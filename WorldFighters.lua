

if getgenv()._WF_Stop then
    pcall(getgenv()._WF_Stop)
    task.wait(0.3)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/dvorfkar6-lab/uis/refs/heads/main/Mac"))()
-- // ========================================== \\ --
-- //          GLOBAL SERVICES & VARIABLES       \\ --
-- // ========================================== \\ --

local Players              = game:GetService("Players")
local ReplicatedStorage    = game:GetService("ReplicatedStorage")
local RunService           = game:GetService("RunService")
local Workspace            = game:GetService("Workspace")
local HttpService          = game:GetService("HttpService")
local VirtualUser          = game:GetService("VirtualUser")
local CollectionService    = game:GetService("CollectionService")

local LocalPlayer = Players.LocalPlayer
local GameName    = "World Fighters"

-- // ========================================== \\ --
-- //          PRIORITY SYSTEM                   \\ --
-- // ========================================== \\ --

local ActivityPriority = {
    currentActivity = nil,
    activities = {
        Star = 180, Banner = 170, Roulette = 160,
        Gamemode = 100, Gacha = 80, Merchant = 60, AutoFarm = 40,
    }
}

function ActivityPriority:CanStart(name)
    if not self.currentActivity then return true end
    local cur = self.activities[self.currentActivity] or 0
    local new = self.activities[name] or 0
    return new >= cur
end

function ActivityPriority:SetActivity(name)
    if name == nil then self.currentActivity = nil; return true end
    if self:CanStart(name) then self.currentActivity = name; return true end
    return false
end

function ActivityPriority:ClearActivity(name)
    if self.currentActivity == name then self.currentActivity = nil end
end

getgenv().ActivityPriority = ActivityPriority

-- Global state
getgenv().Targets        = getgenv().Targets        or {}
getgenv().StarTargets    = getgenv().StarTargets    or {}
getgenv().QuestSelections = getgenv().QuestSelections or {}
getgenv()._StarBusy      = false
getgenv()._ZoneTpBusy    = false
getgenv()._FarmBusy      = false
getgenv().AutoQuest         = getgenv().AutoQuest         or false
getgenv().AutoPinQuest      = (getgenv().AutoPinQuest      == nil) and true or getgenv().AutoPinQuest
getgenv().AutoTpToQuestZone = (getgenv().AutoTpToQuestZone == nil) and true or getgenv().AutoTpToQuestZone

local stopped     = false
local connections = {}

-- // ========================================== \\ --
-- //          SAFE OMNI LOADER                  \\ --
-- // ========================================== \\ --

local Omni, Signal, Shared
local ModulesLoaded = false
local LoadError

do
    local ok, err = pcall(function()
        local OmniRoot = ReplicatedStorage:WaitForChild("Omni", 15)
        if not OmniRoot then error("Omni framework not found") end
        Omni = require(OmniRoot)
        if not Omni or type(Omni) ~= "table" then error("Omni invalid type") end

        if type(Omni.WaitInitialization) == "function" then
            Omni:WaitInitialization()
        else
            local timeout = tick() + 15
            while (not Omni.DataLoaded or not Omni.Loaded) and tick() < timeout do task.wait(0.2) end
        end

        if not Omni.DataLoaded then error("Omni Data not loaded") end
        if not Omni.Signal or not Omni.Signal.Fire then error("Omni Signal API missing") end

        Signal = Omni.Signal
        Shared = Omni.Shared
        ModulesLoaded = true
    end)
    if not ok then
        LoadError = err
        warn("[ApelHub] Omni load failed:", err)
    end
end

local function fire(...)
    if Signal then pcall(function(...) Signal:Fire(...) end, ...) end
end
local function fireSelf(...)
    if Signal then pcall(function(...) Signal:FireSelf(...) end, ...) end
end
local function getData()
    return (Omni and Omni.Data) or {}
end

-- Anti-spam
local _lastFire = {}
local function shouldFire(key, minInterval)
    local t = _lastFire[key]
    if t and tick() - t < (minInterval or 1) then return false end
    _lastFire[key] = tick()
    return true
end

-- // ========================================== \\ --
-- //          CORE HELPERS                      \\ --
-- // ========================================== \\ --

local function getEnemiesFolder()
    local sv = Workspace:FindFirstChild("Server"); if not sv then return nil end
    local en = sv:FindFirstChild("Enemies");       if not en then return nil end
    local d = getData()

    -- ОСНОВНОЙ ПУТЬ: Server.Enemies.World[Map][Zone]
    -- В триале Data.Map = "Trial" (из cfg.MapName), Data.Zone = 1 (из cfg.ZoneIndex).
    -- Мобы триала там же — так работает в референсной рабочей версии.
    local world = en:FindFirstChild("World")
    local primaryFolder
    if world then
        local mapName = d.Map or "Fruits Verse"
        local zoneIdx = d.Zone or 1
        local mapFolder = world:FindFirstChild(mapName)
        if mapFolder then
            primaryFolder = mapFolder:FindFirstChild(tostring(zoneIdx))
        end
    end

    -- Если основной путь дал непустую папку — возвращаем его
    if primaryFolder and #primaryFolder:GetChildren() > 0 then
        return primaryFolder
    end

    -- FALLBACK: если в gamemode и World[Map][Zone] пуст — пробуем Gamemodes folder
    -- (на случай если будущий обновление переместит мобов туда)
    if d.Gamemode then
        local gms = en:FindFirstChild("Gamemodes")
        if gms then
            local gmFolder = gms:FindFirstChild(d.Gamemode)
            if gmFolder and #gmFolder:GetChildren() > 0 then
                return gmFolder
            end
        end
    end

    -- Last resort — возвращаем primary даже если он пустой (чтобы вызывающий код не упал на nil)
    return primaryFolder
end

local function getHRP()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    return char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))
end

local function getMobHPValue(mob)
    if not mob then return nil end
    local ok, attrs = pcall(function() return mob:GetAttributes() end)
    if not ok or type(attrs) ~= "table" then return nil end
    for _, k in ipairs({ "Health", "health", "HP", "hp" }) do
        if type(attrs[k]) == "number" then return attrs[k] end
    end
    for k, v in pairs(attrs) do
        if type(v) == "number" then
            local lk = k:lower()
            if (lk:find("health") or lk:find("hp")) and not lk:find("max") then return v end
        end
    end
    return nil
end

local function getMobMaxHPValue(mob)
    if not mob then return nil end
    local ok, attrs = pcall(function() return mob:GetAttributes() end)
    if not ok or type(attrs) ~= "table" then return nil end
    for _, k in ipairs({ "MaxHealth", "maxHealth", "Max_Health", "Health_Max", "MaxHP", "maxHP" }) do
        if type(attrs[k]) == "number" then return attrs[k] end
    end
    for k, v in pairs(attrs) do
        if type(v) == "number" then
            local lk = k:lower()
            if lk:find("max") and (lk:find("health") or lk:find("hp")) then return v end
        end
    end
    return nil
end

local function isAlive(mob)
    if not mob or not mob.Parent then return false end
    local hp = getMobHPValue(mob)
    if hp ~= nil then return hp > 0 end
    local hum = mob:FindFirstChildOfClass("Humanoid")
    if hum then return hum.Health > 0 end
    return true
end

local function getMobPos(mob)
    if not mob or not mob.Parent then return nil end
    if mob:IsA("BasePart") then return mob.Position end
    if mob.PrimaryPart then return mob.PrimaryPart.Position end
    local ok, piv = pcall(function() return mob:GetPivot().Position end)
    if ok and piv then return piv end
    for _, d in ipairs(mob:GetDescendants()) do
        if d:IsA("BasePart") then return d.Position end
    end
    return nil
end

local function getMobHP(mob)
    local hp  = getMobHPValue(mob)
    local mhp = getMobMaxHPValue(mob)
    if hp ~= nil then return math.floor(hp), (mhp and math.floor(mhp) or nil) end
    local hum = mob:FindFirstChildOfClass("Humanoid")
    if hum then return math.floor(hum.Health), math.floor(hum.MaxHealth) end
    return nil, nil
end

local function groupMobs()
    local groups = {}
    local folder = getEnemiesFolder()
    if not folder then return groups end
    for _, mob in ipairs(folder:GetChildren()) do
        if isAlive(mob) then
            local n = mob.Name
            groups[n] = groups[n] or {}
            table.insert(groups[n], mob)
        end
    end
    return groups
end

local function buildMobOptions(groups)
    groups = groups or groupMobs()
    local entries = {}
    for name, mobs in pairs(groups) do
        local refHP
        for _, mob in ipairs(mobs) do
            local cur, mx = getMobHP(mob)
            local v = mx or cur
            if v and (not refHP or v > refHP) then refHP = v end
        end
        table.insert(entries, { name = name, hp = refHP or 0 })
    end
    table.sort(entries, function(a, b)
        if a.hp == b.hp then return a.name < b.name end
        return a.hp < b.hp
    end)
    local opts = {}
    for _, e in ipairs(entries) do table.insert(opts, e.name) end
    return opts
end

-- Проверка "сейчас в активном гейммоде" — Omni.Data.Gamemode = имя или nil
local function isInGamemode()
    return (getData().Gamemode ~= nil)
end

-- // ========================================== \\ --
-- //          ZONE ROUTING                      \\ --
-- // ========================================== \\ --

-- Разблокирована ли зона? Сначала через PlayerStats.HasMapZone, потом fallback'и.
local function isZoneUnlocked(mapName, zoneIdx)
    if not Omni then return false end
    local ok, result = pcall(function()
        return Omni.Utils.PlayerStats.HasMapZone(Omni.Data, mapName, tonumber(zoneIdx))
    end)
    if ok and type(result) == "boolean" then return result end
    -- Fallback 1: стартовая зона всегда открыта
    if mapName == "Fruits Verse" and tonumber(zoneIdx) == 1 then return true end
    -- Fallback 2: если игрок там был — есть SavedPositions
    local saved = getData().SavedPositions and getData().SavedPositions["Map " .. mapName]
    if saved then return true end
    return false
end

-- Универсальный экстрактор имён мобов из конфига зоны.
-- Поддерживает три структуры Shared.Enemies[map][zone]:
--   (A) массив строк:   {"Buggo", "Shanke", ...}
--   (B) массив таблиц:  {{Name="Buggo"}, {Name="Shanke"}}
--   (C) словарь:        {Buggo = {stats}, Shanke = {stats}}
local function extractMobNames(list)
    local names = {}
    if type(list) ~= "table" then return names end
    for k, v in pairs(list) do
        if type(v) == "string" then
            names[v] = true
        elseif type(v) == "table" then
            if type(v.Name) == "string" then
                names[v.Name] = true
            elseif type(v.ID) == "string" then
                names[v.ID] = true
            end
            if type(k) == "string" then
                names[k] = true
            end
        end
    end
    return names
end

-- Ищет наилучшую разблокированную зону с хотя бы одним выбранным типом мобов.
-- Предпочтение: текущая зона > зона с максимальным числом совпадений.
local function findBestZoneForTargets(targets)
    if not targets or next(targets) == nil then return nil end
    if not Shared then return nil end
    local sharedE = Shared.Enemies
    if type(sharedE) ~= "table" then return nil end

    local curMap  = getData().Map
    local curZone = tonumber(getData().Zone or 0)

    local best = nil
    for mapName, zones in pairs(sharedE) do
        if type(zones) == "table" then
            for zoneKey, list in pairs(zones) do
                local zoneIdx = tonumber(zoneKey) or zoneKey
                if type(list) == "table" and isZoneUnlocked(mapName, zoneIdx) then
                    local zoneMobs = extractMobNames(list)
                    local matches = 0
                    for name in pairs(targets) do
                        if zoneMobs[name] then matches = matches + 1 end
                    end
                    if matches > 0 then
                        local isCur = (mapName == curMap) and (tonumber(zoneIdx) == curZone)
                        local betterThanBest = false
                        if not best then
                            betterThanBest = true
                        elseif isCur and not best.isCurrent then
                            betterThanBest = true
                        elseif isCur == best.isCurrent and matches > best.matches then
                            betterThanBest = true
                        end
                        if betterThanBest then
                            best = {
                                mapName   = mapName,
                                zoneIdx   = tonumber(zoneIdx) or zoneIdx,
                                matches   = matches,
                                isCurrent = isCur,
                            }
                        end
                    end
                end
            end
        end
    end
    return best
end

-- ТП игрока в указанную зону + ожидание пока Data.Map/Zone обновятся и папка прогрузится.
local function teleportToZone(mapName, zoneIdx)
    pcall(function()
        Signal:Fire("Player", "Teleport", "Teleport", mapName, zoneIdx)
    end)
    local deadline = tick() + 8
    while tick() < deadline do
        local curMap  = getData().Map
        local curZone = tonumber(getData().Zone or 0)
        if curMap == mapName and curZone == tonumber(zoneIdx) then
            local f = getEnemiesFolder()
            if f and #f:GetChildren() > 0 then return true end
        end
        task.wait(0.3)
    end
    return false
end

-- Проверка: есть ли в текущей зоне мобы выбранных типов (alive + стриммятся)
local function hasReadyTargetsInCurrentZone(targets)
    local folder = getEnemiesFolder()
    if not folder then return false, false end
    local hasLive  = false
    local hasReady = false
    for _, mob in ipairs(folder:GetChildren()) do
        if targets[mob.Name] and isAlive(mob) then
            hasLive = true
            if getMobPos(mob) then
                hasReady = true
                break
            end
        end
    end
    return hasReady, hasLive
end

-- Проверка: содержит ли конфиг Shared.Enemies хотя бы один из targets для указанной зоны.
local function anyTargetInZoneConfig(targets, mapName, zoneIdx)
    if not Shared then return false end
    local sharedE = Shared.Enemies
    if type(sharedE) ~= "table" then return false end
    local zones = sharedE[mapName]
    if type(zones) ~= "table" then return false end
    local list = zones[tonumber(zoneIdx)] or zones[tostring(zoneIdx)]
    if type(list) ~= "table" then return false end
    local zoneMobs = extractMobNames(list)
    for name in pairs(targets) do
        if zoneMobs[name] then return true end
    end
    return false
end

-- Streaming trick: телепорт к самому дальнему видимому мобу → StreamingEnabled прогрузит соседей
local function tpToFurthestVisibleMob()
    local folder = getEnemiesFolder()
    if not folder then return false end
    local hrp = getHRP()
    if not hrp then return false end

    local furthest, maxDist = nil, -1
    for _, m in ipairs(folder:GetChildren()) do
        if isAlive(m) then
            local p = getMobPos(m)
            if p then
                local d = (p - hrp.Position).Magnitude
                if d > maxDist then
                    maxDist = d
                    furthest = m
                end
            end
        end
    end
    if furthest then
        local pos = getMobPos(furthest)
        if pos then
            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 4, 4))
            return true
        end
    end
    return false
end

-- // ========================================== \\ --
-- //          AUTO QUEST ENGINE                 \\ --
-- // ========================================== \\ --

-- Структура данных:
--   Omni.Shared.Quests.List[questName].Missions[idx]  -- конфиг миссии
--   Omni.Shared.Quests.List[questName].MapName/ZoneIndex
--   Omni.Data.Quests.List[questName].Missions[idx]    -- прогресс
--   Omni.Data.Quests.Pinned                           -- пин

local MISSION_TARGET_KEYS = { "Target", "Name", "Mob", "Enemy", "EnemyName", "MobName", "What" }
local MISSION_COUNT_KEYS  = { "Amount", "Count", "Required", "Goal", "Times", "Total" }

local function extractMissionTarget(missionCfg)
    if type(missionCfg) ~= "table" then return nil, nil end
    local target, count
    for _, k in ipairs(MISSION_TARGET_KEYS) do
        if type(missionCfg[k]) == "string" then target = missionCfg[k]; break end
    end
    for _, k in ipairs(MISSION_COUNT_KEYS) do
        if type(missionCfg[k]) == "number" then count = missionCfg[k]; break end
    end
    return target, count
end

local function getQuestCfg(questName)
    local s = Shared and Shared.Quests and Shared.Quests.List
    return s and s[questName]
end

-- Пробуем разные пути к данным квеста
local function getQuestData(questName)
    local q = getData().Quests
    if not q then return nil end
    if q.List     and q.List[questName]     then return q.List[questName]     end
    if q.Active   and q.Active[questName]   then return q.Active[questName]   end
    if q.Progress and q.Progress[questName] then return q.Progress[questName] end
    if q.Missions and q.Missions[questName] then return q.Missions[questName] end
    if rawget(q, questName) ~= nil          then return rawget(q, questName)  end
    return nil
end

-- Numeric ИЛИ string lookup (Replica может сериализовать числовые ключи как строки)
local function tblGetAny(t, key)
    if type(t) ~= "table" then return nil end
    local v = t[key]
    if v ~= nil then return v end
    if type(key) == "number" then
        v = t[tostring(key)]
        if v ~= nil then return v end
    elseif type(key) == "string" then
        local n = tonumber(key)
        if n then
            v = t[n]
            if v ~= nil then return v end
        end
    end
    return nil
end

-- Универсальное чтение прогресса миссии — пробуем 5 разных путей
local function getMissionProgress(questName, idx, targetName)
    local d = getQuestData(questName)
    if not d then return 0 end

    local function unwrap(p)
        if type(p) == "number" then return p end
        if type(p) == "table" then
            return p.Progress or p.Current or p.Amount or p.Count or p.Value or p[1] or 0
        end
        return nil
    end

    if type(d) == "table" and type(d.Missions) == "table" then
        local p = tblGetAny(d.Missions, idx)
        local unwrapped = unwrap(p)
        if unwrapped then return unwrapped end
        if targetName then
            p = d.Missions[targetName]
            unwrapped = unwrap(p)
            if unwrapped then return unwrapped end
        end
    end

    if type(d) == "table" then
        local direct = tblGetAny(d, idx)
        if type(direct) == "number" then return direct end
        if targetName and type(d[targetName]) == "number" then return d[targetName] end
        if type(d.Progress) == "table" then
            local p = tblGetAny(d.Progress, idx)
            if type(p) == "number" then return p end
            if targetName and type(d.Progress[targetName]) == "number" then return d.Progress[targetName] end
        end
    end

    if type(d) == "number" then return d end

    return 0
end

local function getActiveMission(questName)
    local cfg = getQuestCfg(questName)
    if not cfg or not cfg.Missions then return nil end
    local indices = {}
    for k in pairs(cfg.Missions) do
        if type(k) == "number" then table.insert(indices, k) end
    end
    table.sort(indices)
    for _, idx in ipairs(indices) do
        local target, required = extractMissionTarget(cfg.Missions[idx])
        if target and required then
            local progress = getMissionProgress(questName, idx, target)
            if progress < required then
                return {
                    name       = target,
                    required   = required,
                    progress   = progress,
                    missionIdx = idx,
                }
            end
        end
    end
    return nil
end

local function getAllQuests()
    local out = {}
    local src = Shared and Shared.Quests and Shared.Quests.List
    if type(src) == "table" then
        for k in pairs(src) do
            if type(k) == "string" then table.insert(out, k) end
        end
    end
    table.sort(out)
    return out
end

local function isInQuestZone(questName)
    local cfg = getQuestCfg(questName)
    if not cfg then return true end
    local curMap = getData().Map
    local curZone = getData().Zone
    local wantMap = cfg.MapName
    local wantZone = cfg.ZoneIndex
    if not wantMap then return true end
    if curMap ~= wantMap then return false end
    if wantZone and curZone ~= wantZone then return false end
    return true
end

-- // ========================================== \\ --
-- //          SAFE LABEL WRAPPER                 \\ --
-- // ========================================== \\ --

-- На MacSploit (и похожих executor'ах) тред теряет 'Plugin' capability через несколько секунд,
-- и прямой TextLabel.Text = X начинает падать с "lacking capability Plugin". MacLib :UpdateName
-- делает именно это. Решение — отложить все Update вызовы до RunService.Heartbeat callback'а,
-- который выполняется в privileged thread с правильной capability.
-- Используется для labels которые часто обновляются в loop'ах (Live Status, Player Info, etc.)
local function SafeWrapLabel(label)
    if not label or not label.UpdateName then return label end
    local origUpdateName = label.UpdateName
    local pendingText
    local scheduled = false

    local function flush()
        scheduled = false
        if pendingText ~= nil then
            local t = pendingText
            pendingText = nil
            pcall(origUpdateName, label, t)
        end
    end

    function label:UpdateName(text)
        pendingText = text
        if not scheduled then
            scheduled = true
            RunService.Heartbeat:Once(flush)
        end
    end
    return label
end

-- // ========================================== \\ --
-- //          ANTI-AFK BYPASS                   \\ --
-- // ========================================== \\ --

coroutine.wrap(function()
    local GC = getconnections or get_signal_cons
    if GC then
        for _, v in pairs(GC(LocalPlayer.Idled)) do
            if v["Disable"] then v["Disable"](v) elseif v["Disconnect"] then v["Disconnect"](v) end
        end
    else
        local VU = (cloneref or function(x) return x end)(VirtualUser)
        LocalPlayer.Idled:Connect(function()
            VU:CaptureController()
            VU:ClickButton2(Vector2.new())
        end)
    end
end)()

do
    local antiAfkThread = nil
    local function startAntiAfkLoop(character)
        if antiAfkThread then pcall(task.cancel, antiAfkThread); antiAfkThread = nil end
        local humanoid = character:WaitForChild("Humanoid")
        antiAfkThread = task.spawn(function()
            while humanoid and humanoid.Parent do
                task.wait(60)
                if humanoid and humanoid.Parent and getconnections then
                    for _, c in pairs(getconnections(humanoid.Running)) do
                        pcall(function() c:Fire(1) end)
                    end
                end
            end
        end)
    end
    if LocalPlayer.Character then startAntiAfkLoop(LocalPlayer.Character) end
    LocalPlayer.CharacterAdded:Connect(startAntiAfkLoop)
end

-- // ========================================== \\ --
-- //          STAR UI HIDER (camera unfreeze)   \\ --
-- // ========================================== \\ --
-- Когда сервер отвечает на Stars.Open, клиент:
--   1) Open's UI Frame "Star" (Frame:Open(StarFrame))
--   2) Hides UI behind StarAnimation hider
--   3) Disables FOV
--   4) Adds CameraTypeModifier "StarAnimation" (Scriptable) — камера замораживается
--   5) Plays StarAnimation in PlayerGui.StarAnimation
-- Toggle отключает всё это: hide ScreenGui + close Frame + remove camera modifier

local starHideEnabled = false
local starHideConn = nil

local function applyStarHide()
    if not ModulesLoaded then return end
    pcall(function()
        local sa = LocalPlayer.PlayerGui:FindFirstChild("StarAnimation")
        if sa then sa.Enabled = false end
    end)
    pcall(function() Omni.Frame:Close("Star") end)
    pcall(function() Omni.Frame:RemoveUIHider("StarAnimation") end)
    pcall(function() fireSelf("Player", "Camera", "RemoveCameraTypeModifier", "StarAnimation") end)
    pcall(function() fireSelf("Player", "FOV", "Enable") end)
end

local function startStarHide()
    if starHideConn then starHideConn:Disconnect(); starHideConn = nil end
    -- Persistent watch — переоткрытие закрываем сразу
    starHideConn = RunService.Heartbeat:Connect(function()
        if not starHideEnabled then return end
        applyStarHide()
    end)
    table.insert(connections, starHideConn)
end

local function stopStarHide()
    if starHideConn then starHideConn:Disconnect(); starHideConn = nil end
    -- Restore animation gui
    pcall(function()
        local sa = LocalPlayer.PlayerGui:FindFirstChild("StarAnimation")
        if sa then sa.Enabled = true end
    end)
end

-- // ========================================== \\ --
-- //          POSITION SAVE/LOAD (JSON)         \\ --
-- // ========================================== \\ --

local savedPosition = nil
local savedLocation = "Unknown"

local function savePositionFile(cframe, location)
    local data = {
        position = { x = cframe.Position.X, y = cframe.Position.Y, z = cframe.Position.Z },
        location = location
    }
    local encoded = HttpService:JSONEncode(data)
    if not isfolder("ApelHub") then makefolder("ApelHub") end
    if not isfolder("ApelHub/saved_positions") then makefolder("ApelHub/saved_positions") end
    writefile("ApelHub/saved_positions/WorldFighters.json", encoded)
end

local function loadPositionFile()
    local ok, data = pcall(function()
        return readfile("ApelHub/saved_positions/WorldFighters.json")
    end)
    if ok and data then
        local decoded = HttpService:JSONDecode(data)
        if decoded.position then
            savedPosition = CFrame.new(decoded.position.x, decoded.position.y, decoded.position.z)
            savedLocation = decoded.location or "Unknown"
            return true
        end
    end
    return false
end
loadPositionFile()

-- // ========================================== \\ --
-- //                 UI SETUP                   \\ --
-- // ========================================== \\ --

local Window = MacLib:Window({
    Title    = tostring(GameName) .. " | Apel Hub",
    Subtitle = "",
    Size     = UDim2.fromOffset(865, 650),
    DragStyle = 2,
    DisabledWindowControls = {},
    ShowUserInfo = false,
    Keybind = Enum.KeyCode.LeftControl,
    AcrylicBlur = false,
})

local tabGroups = { MainGroup = Window:TabGroup() }
local tabs = {
    Main      = tabGroups.MainGroup:Tab({ Name = "Main",      Image = "rbxassetid://10723407389" }),
    Gamemodes = tabGroups.MainGroup:Tab({ Name = "Gamemodes", Image = "rbxassetid://10734949856" }),
    Gacha     = tabGroups.MainGroup:Tab({ Name = "Gacha",     Image = "rbxassetid://10723345518" }),
    Quests    = tabGroups.MainGroup:Tab({ Name = "Quests",    Image = "rbxassetid://10723347446" }),
    Rewards   = tabGroups.MainGroup:Tab({ Name = "Rewards",   Image = "rbxassetid://10709752906" }),
    Misc      = tabGroups.MainGroup:Tab({ Name = "Misc",      Image = "rbxassetid://10747372992" }),
    Webhook   = tabGroups.MainGroup:Tab({ Name = "Webhook",   Image = "rbxassetid://10747384394" }),
    Settings  = tabGroups.MainGroup:Tab({ Name = "Settings",  Image = "rbxassetid://10734950309" }),
}

local sections = {
    MainSection1     = tabs.Main:Section({ Side = "Left" }),
    MainSection2     = tabs.Main:Section({ Side = "Right" }),
    SettingsSection  = tabs.Settings:Section({ Side = "Left" }),
    InfoSection      = tabs.Settings:Section({ Side = "Right" }),
}

-- // ========================================== \\ --
-- //              MAIN TAB                      \\ --
-- // ========================================== \\ --

if not ModulesLoaded then
    sections.MainSection1:Header({ Text = "Framework Status" })
    sections.MainSection1:Label({ Text = "⚠ Omni Failed to Load" })
    sections.MainSection1:Label({ Text = "Reason: " .. tostring(LoadError or "Unknown") })
else
    sections.MainSection1:Header({ Text = "In-Game Auto Settings" })

    local function makeSettingToggle(name, key, flag)
        sections.MainSection1:Toggle({
            Name = name,
            Default = (getData().Settings and getData().Settings[key]) == true,
            Callback = function(on)
                fire("General", "Settings", "Set", key, on)
            end
        }, flag)
    end

    makeSettingToggle("Auto Click",        "Auto Click",        "AutoClickToggle")
    makeSettingToggle("Auto Aura Upgrade", "Auto Aura Upgrade", "AutoAuraToggle")
    makeSettingToggle("Auto Awaken",       "Auto Awaken",       "AutoAwakenToggle")
    makeSettingToggle("Always Run",        "Always Run",        "AlwaysRunToggle")

    -- Player Info live
    sections.MainSection2:Header({ Text = "Player Info" })
    local statsLabel = SafeWrapLabel(sections.MainSection2:Label({ Text = "Loading..." }))

    task.spawn(function()
        while not stopped do
            task.wait(2)
            local d = getData()
            if d then
                local txt = string.format(
                    "Power: %s\nCrystals: %s\nGems: %s\nAura: %s\nLevel: %s\nMap: %s | Zone: %s\nGamemode: %s",
                    tostring(d.Power or 0),
                    tostring(d.Crystals or 0),
                    tostring((d.FreeGems or 0) + (d.PaidGems or 0)),
                    tostring(d.Aura or 0),
                    tostring(d.Level and d.Level.Amount or 1),
                    tostring(d.Map or "?"),
                    tostring(d.Zone or 1),
                    tostring(d.Gamemode or "—")
                )
                pcall(function() statsLabel:UpdateName(txt) end)
            end
        end
    end)

    sections.MainSection2:Divider()
    sections.MainSection2:Header({ Text = "Hub Status" })
    local activityLabel = SafeWrapLabel(sections.MainSection2:Label({ Text = "Activity: idle" }))

    task.spawn(function()
        while not stopped do
            task.wait(1)
            pcall(function()
                activityLabel:UpdateName("Activity: " .. tostring(ActivityPriority.currentActivity or "idle"))
            end)
        end
    end)

    -- ============================================
    -- AUTO FARM (теперь в Main, не в отдельной табе)
    -- ============================================

    sections.MainSection1:Divider()
    sections.MainSection1:Header({ Text = "Auto Farm" })

    local autoFarmEnabled = false
    local autoFarmLoop = nil
    local mobDropdown = nil

    -- Side offset захардкожен
    local TP_OFFSET = Vector3.new(3, 2, 0)

    mobDropdown = sections.MainSection1:Dropdown({
        Name = "Target Mobs (multi)",
        Multi = true, Required = false,
        Options = buildMobOptions(),
        Default = {},
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do
                    if v and type(k) == "string" then set[k] = true end
                end
            elseif type(values) == "string" and values ~= "" then
                set[values] = true
            end
            getgenv().Targets = set
        end,
    }, "AutoFarmTargetsDropdown")

    sections.MainSection1:Button({
        Name = "Refresh Mob List",
        Callback = function()
            pcall(function()
                if mobDropdown.ClearOptions then mobDropdown:ClearOptions() end
                task.wait(0.05)
                mobDropdown:InsertOptions(buildMobOptions())
            end)
        end
    })

    -- Helpers
    local function teleportTo(mob)
        local hrp = getHRP();      if not hrp then return false end
        local pos = getMobPos(mob); if not pos then return false end
        hrp.CFrame = CFrame.new(pos + TP_OFFSET)
        return true
    end

    local function attackOnce()
        local ids
        pcall(function() ids = Omni.Cache:Get({ "EnemiesOnRangeIds" }) end)
        ids = ids or {}
        fire("General", "Attack", "Click", ids)
    end

    local function getClickCooldown()
        local cd = 0.3
        pcall(function()
            local v = Omni.Utils.PlayerStats.ClickCooldown(Omni.Data, Omni.Instance)
            if type(v) == "number" and v > 0 then cd = v end
        end)
        return math.max(cd, 0.05)
    end

    local function farmTick()
        -- Уважаем Star mutex + Zone-TP mutex
        if getgenv()._StarBusy or getgenv()._ZoneTpBusy then return end
        local targetSet = getgenv().Targets or {}
        if not next(targetSet) then return end

        local curMap  = getData().Map
        local curZone = tonumber(getData().Zone or 1) or 1

        -- [1] Есть ли стримленные готовые к атаке мобы выбранных типов?
        local hasReady, hasLive = hasReadyTargetsInCurrentZone(targetSet)

        if hasReady then
            -- === ФАРМ ===
            local candidates = {}
            local folder = getEnemiesFolder()
            if folder then
                for _, mob in ipairs(folder:GetChildren()) do
                    if targetSet[mob.Name] and isAlive(mob) and getMobPos(mob) then
                        table.insert(candidates, mob)
                    end
                end
            end
            if #candidates == 0 then return end

            table.sort(candidates, function(a, b)
                local ha = getMobHPValue(a) or math.huge
                local hb = getMobHPValue(b) or math.huge
                return ha < hb
            end)

            local mob = candidates[1]
            if not (mob and isAlive(mob)) then return end

            teleportTo(mob)
            task.wait(0.08)

            local cd = getClickCooldown()
            local startTime = tick()
            local mobName = mob.Name
            local hrp = getHRP()
            getgenv()._FarmBusy = true

            while autoFarmEnabled and not stopped
                and not getgenv()._StarBusy and not getgenv()._ZoneTpBusy
                and getgenv().Targets[mobName] and isAlive(mob)
                and tick() - startTime < 15
            do
                local mp = getMobPos(mob)
                local my = hrp and hrp.Position
                if mp and my and (mp - my).Magnitude > 12 then
                    teleportTo(mob)
                    task.wait(0.05)
                end
                attackOnce()
                task.wait(cd)
            end
            getgenv()._FarmBusy = false
        elseif hasLive then
            -- [2] Мобы есть в папке но без позиции — streaming trick
            local ok = tpToFurthestVisibleMob()
            if not ok then
                -- Полный re-stream через Teleport в ту же зону
                getgenv()._ZoneTpBusy = true
                pcall(function()
                    Signal:Fire("Player", "Teleport", "Teleport", curMap, curZone)
                end)
                task.wait(1.0)
                getgenv()._ZoneTpBusy = false
            else
                task.wait(0.6)
            end
        else
            -- [3] Нет наших мобов в папке. Два подслучая:
            --  (a) конфиг говорит "в этой зоне они должны быть" → ждём respawn
            --  (b) эта зона не для них → ищем другую и TP туда
            if anyTargetInZoneConfig(targetSet, curMap, curZone) then
                local tpOk = tpToFurthestVisibleMob()
                task.wait(tpOk and 0.6 or 1.5)
            else
                local best = findBestZoneForTargets(targetSet)
                if best and (best.mapName ~= curMap or best.zoneIdx ~= curZone) then
                    getgenv()._ZoneTpBusy = true
                    teleportToZone(best.mapName, best.zoneIdx)
                    getgenv()._ZoneTpBusy = false
                else
                    task.wait(3)
                end
            end
        end
    end

    sections.MainSection1:Toggle({
        Name = "Auto Farm",
        Default = false,
        Callback = function(on)
            autoFarmEnabled = on
            if on then
                if not ActivityPriority:CanStart("AutoFarm") then
                    warn("[ApelHub] Higher priority running"); return
                end
                ActivityPriority:SetActivity("AutoFarm")
                autoFarmLoop = task.spawn(function()
                    while autoFarmEnabled and not stopped do
                        farmTick()
                        task.wait(0.2)
                    end
                    getgenv()._FarmBusy = false
                    ActivityPriority:ClearActivity("AutoFarm")
                end)
            else
                if autoFarmLoop then task.cancel(autoFarmLoop); autoFarmLoop = nil end
                getgenv()._FarmBusy = false
                ActivityPriority:ClearActivity("AutoFarm")
            end
        end
    }, "AutoFarmToggle")

    -- ============================================
    -- AUTO-REFRESH MOB DROPDOWN
    -- ============================================
    local folderConns = {}
    local function clearFolderConns()
        for _, c in ipairs(folderConns) do pcall(function() c:Disconnect() end) end
        table.clear(folderConns)
    end
    local function refreshMobDropdown()
        if not mobDropdown then return end
        pcall(function()
            if mobDropdown.ClearOptions then mobDropdown:ClearOptions() end
            task.wait(0.05)
            mobDropdown:InsertOptions(buildMobOptions())
        end)
    end
    local function attachFolderListeners()
        clearFolderConns()
        local f = getEnemiesFolder()
        if not f then return end
        table.insert(folderConns, f.ChildAdded:Connect(function()
            task.wait(0.2); refreshMobDropdown()
        end))
        table.insert(folderConns, f.ChildRemoved:Connect(function()
            task.defer(refreshMobDropdown)
        end))
    end
    attachFolderListeners()

    pcall(function()
        if Omni.OnDataChanged then
            local c1 = Omni:OnDataChanged({ "Map" }, function()
                task.wait(0.1); attachFolderListeners(); refreshMobDropdown()
            end)
            local c2 = Omni:OnDataChanged({ "Zone" }, function()
                task.wait(0.1); attachFolderListeners(); refreshMobDropdown()
            end)
            for _, c in ipairs({ c1, c2 }) do
                if typeof(c) == "RBXScriptConnection" or (type(c) == "table" and c.Disconnect) then
                    table.insert(connections, c)
                end
            end
        end
    end)
end

-- // ========================================== \\ --
-- //              GAMEMODES TAB                 \\ --
-- // ========================================== \\ --

if not ModulesLoaded then
    local s = tabs.Gamemodes:Section({ Side = "Center" })
    s:Label({ Text = "⚠ Requires Omni Framework" })
else
    -- ============================================
    -- ВЕРХ — Position (CENTER, общая для всех gamemodes)
    -- ============================================
    local posSection = tabs.Gamemodes:Section({ Side = "Center" })
    posSection:Header({ Text = "Position" })

    local positionLabel = posSection:Label({ Text = "Position: not saved" })
    local locationLabel = posSection:Label({ Text = "Location: —" })

    if savedPosition then
        local p = savedPosition.Position
        positionLabel:UpdateName(string.format("Position: %.0f, %.0f, %.0f", p.X, p.Y, p.Z))
        locationLabel:UpdateName("Location: " .. savedLocation)
    end

    posSection:Button({
        Name = "Save Current Position",
        Callback = function()
            local hrp = getHRP()
            if not hrp then warn("[ApelHub] No character"); return end
            local d = getData()
            savedPosition = hrp.CFrame
            savedLocation = (d.Map or "?") .. " | Zone " .. (d.Zone or 1)
                            .. (d.Gamemode and (" | " .. d.Gamemode) or "")
            savePositionFile(savedPosition, savedLocation)
            local p = savedPosition.Position
            positionLabel:UpdateName(string.format("Position: %.0f, %.0f, %.0f", p.X, p.Y, p.Z))
            locationLabel:UpdateName("Location: " .. savedLocation)
        end
    })

    posSection:Button({
        Name = "Teleport to Saved",
        Callback = function()
            if not savedPosition then warn("[ApelHub] No saved position"); return end
            local targetMap, targetZone
            if savedLocation then
                local m, z = savedLocation:match("^(.-)%s*|%s*Zone%s*(%d+)")
                if m and z then
                    targetMap = m
                    targetZone = tonumber(z) or 1
                end
            end
            local d = getData()
            if targetMap and (d.Map ~= targetMap or tonumber(d.Zone) ~= targetZone) then
                getgenv()._ZoneTpBusy = true
                pcall(function()
                    Signal:Fire("Player", "Teleport", "Teleport", targetMap, targetZone)
                end)
                task.wait(1.5)
                getgenv()._ZoneTpBusy = false
            end
            local hrp = getHRP()
            if hrp then
                pcall(function() hrp.CFrame = savedPosition end)
            end
        end
    })

    -- ============================================
    -- DYNAMIC PER-MODE SECTIONS
    -- ============================================

    -- Сканим ВСЕ модули из ReplicatedStorage.Omni.Shared.Gamemodes (рекурсивно —
    -- там есть подпапка "For Updates" с Test Raid). Возвращает {{name=..., cfg=...}}
    local function discoverGamemodes()
        local out = {}
        local sharedFolder = ReplicatedStorage:FindFirstChild("Omni")
            and ReplicatedStorage.Omni:FindFirstChild("Shared")
        local gmFolder = sharedFolder and sharedFolder:FindFirstChild("Gamemodes")
        if not gmFolder then return out end

        local seen = {}
        local function recurse(folder)
            for _, child in ipairs(folder:GetChildren()) do
                if child:IsA("ModuleScript") and not seen[child.Name] then
                    seen[child.Name] = true
                    local ok, cfg = pcall(require, child)
                    if ok and type(cfg) == "table" then
                        table.insert(out, { name = child.Name, cfg = cfg })
                    else
                        -- Если require не удался — всё равно добавляем (просто без конфига)
                        table.insert(out, { name = child.Name, cfg = {} })
                    end
                elseif child:IsA("Folder") then
                    recurse(child)
                end
            end
        end
        recurse(gmFolder)

        -- Стабильная сортировка: Trials первыми (по MaxWave возрастанию), потом остальное
        table.sort(out, function(a, b)
            local aTrial = a.name:find("Trial") ~= nil
            local bTrial = b.name:find("Trial") ~= nil
            if aTrial and not bTrial then return true  end
            if bTrial and not aTrial then return false end
            local aw = tonumber(a.cfg.MaxWave) or 0
            local bw = tonumber(b.cfg.MaxWave) or 0
            if aw ~= bw then return aw < bw end
            return a.name < b.name
        end)
        return out
    end

    -- Текущая волна — сначала через DataContainer (работает для модов со скриптами),
    -- fallback через PlayerGui HUD (для новых модов без PlayerScripts)
    local function getCurrentWave(modeName)
        -- Метод 1: DataContainer (есть только для модов с PlayerScripts.Omni.Scripts.Gamemodes.<name>)
        local container
        pcall(function()
            container = Omni.Libs.DataContainer:Get("GamemodeData - " .. modeName)
        end)
        if container and container.Data then
            local w  = tonumber(container.Data.Wave or 0) or 0
            local mw = tonumber(container.Data.MaxWave or 0) or 0
            if w > 0 or mw > 0 then return w, mw end
        end

        -- Метод 2: PlayerGui HUD parse (у игры есть UI templates для любого активного mode)
        local pg = LocalPlayer:FindFirstChild("PlayerGui")
        local ui = pg and pg:FindFirstChild("UI")
        local hud = ui and ui:FindFirstChild("HUD")
        local gms = hud and hud:FindFirstChild("Gamemodes")
        local modeUI = gms and gms:FindFirstChild(modeName)
        local main = modeUI and modeUI:FindFirstChild("Main")
        local waveNode = main and main:FindFirstChild("Wave")
        local valueNode = waveNode and waveNode:FindFirstChild("Value")
        if valueNode and valueNode:IsA("TextLabel") then
            -- Формат: "<rich>X / Y</rich>" или "X / Y"
            local w, mw = valueNode.Text:match("(%d+)%s*/%s*(%d+)")
            if w and mw then return tonumber(w), tonumber(mw) end
        end

        return 0, 0
    end

    local function isInThisMode(modeName)
        return getData().Gamemode == modeName
    end

    -- Таймер-gamemode helpers — читаем через Shared.Gamemodes (встроенные функции)
    -- Trial Easy открывается в минуту 15 и 45 каждого часа, на 30 секунд окно.
    -- Test Raid — в минуту 0 и 30, на 30 секунд.
    -- Dragon Defense — всегда открыт (нет OpenTimes).
    local function isTimedGamemode(modeName)
        local ok, result = pcall(function()
            return Shared.Gamemodes.IsTimedGamemode(modeName)
        end)
        return ok and result == true
    end

    -- Сколько секунд до следующего открытия mode (0 = открыт сейчас).
    -- Для Trial Easy в xx:20 вернёт ~25 мин до xx:45.
    local function getTimeUntilOpen(modeName)
        local ok, result = pcall(function()
            return Shared.Gamemodes.GetTimeForNextOpen(modeName)
        end)
        if ok and type(result) == "number" then return result end
        return 0
    end

    -- Надёжная доставка игрока на сохранённую позицию.
    -- При смене зоны character ре-спавнится новый, HRP старого уже нерелевантен.
    -- Поэтому:
    --   1. TP в нужную зону (если не там)
    --   2. Ждём пока character появится (до 6 сек)
    --   3. Ставим HRP.CFrame + проверяем что реально телепортировались
    --   4. Если позицию выбросило — ретрай (сервер мог задавить physics'ом)
    local function tpToSavedPosition()
        if not savedPosition then return false end

        local targetMap, targetZone
        if savedLocation then
            local m, z = savedLocation:match("^(.-)%s*|%s*Zone%s*(%d+)")
            if m and z then
                targetMap = m
                targetZone = tonumber(z) or 1
            end
        end

        -- 1. Смена зоны (если нужно)
        local d = getData()
        if targetMap and (d.Map ~= targetMap or tonumber(d.Zone) ~= targetZone) then
            pcall(function()
                Signal:Fire("Player", "Teleport", "Teleport", targetMap, targetZone)
            end)
            task.wait(1.5)  -- начальное ожидание загрузки зоны
        end

        -- 2. Ожидаем валидного HRP нового персонажа + ставим CFrame с ретраями
        local deadline = tick() + 8
        local targetPos = savedPosition.Position

        while tick() < deadline do
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            -- HRP должен быть и physics должны работать (RootPart не anchored)
            if hrp and hrp.Parent and not hrp.Anchored then
                pcall(function() hrp.CFrame = savedPosition end)
                task.wait(0.3)

                -- Проверим что реально телепортнулось
                if hrp.Parent then
                    local dist = (hrp.Position - targetPos).Magnitude
                    if dist < 25 then
                        return true  -- успех
                    end
                    -- Не попало — может сервер отринул из-за анимации. Ретрай.
                end
            end
            task.wait(0.3)
        end
        return false
    end

    -- Выход из gamemode раньше времени — TP в сохранённую позицию.
    -- Сервер автоматом снимает Gamemode статус при смене зоны.
    local function forceLeave()
        getgenv()._ZoneTpBusy = true
        if savedPosition then
            tpToSavedPosition()
        else
            -- Нет saved позиции — fallback TP в Fruits Verse zone 1
            pcall(function()
                Signal:Fire("Player", "Teleport", "Teleport", "Fruits Verse", 1)
            end)
            task.wait(1.5)
        end
        getgenv()._ZoneTpBusy = false
    end

    -- Универсальный per-mode loop
    local function makeAutoModeLoop(modeName, getWaveLimit, getEnabled)
        return function()
            local lastJoinTime = 0
            local wasInMode = false  -- была ли в этом режиме на прошлом тике
            while getEnabled() and not stopped do
                local inMode = isInThisMode(modeName)

                if inMode then
                    wasInMode = true
                    local wave = getCurrentWave(modeName)
                    local limit = getWaveLimit()
                    -- Выход раньше времени: достигли target wave (но только если wave > 0,
                    -- то есть mode реально начался — иначе мы только что зашли и wave ещё 0)
                    if wave >= limit and wave > 0 then
                        print(string.format("[ApelHub] %s reached wave %d / limit %d → leaving", modeName, wave, limit))
                        forceLeave()
                        task.wait(5)
                    else
                        task.wait(2)
                    end
                else
                    -- Не в этом mode. Два подслучая:
                    --  (a) только что вышли (wasInMode=true) — gamemode закончился сам:
                    --      сервер уже сбросил Data.Gamemode = nil. Ждём Results screen +
                    --      респавн, затем ТП на saved позицию.
                    --  (b) первый раз / давно вышли — обычный Join cycle
                    if wasInMode then
                        print(string.format("[ApelHub] %s ended naturally → waiting for respawn + TP to saved", modeName))
                        wasInMode = false
                        task.wait(4)  -- даём Results screen/respawn анимации завершиться
                        -- ТП на сохранённую позицию (сервер положил нас где-то в lobby, но не там)
                        if savedPosition then
                            getgenv()._ZoneTpBusy = true
                            tpToSavedPosition()
                            getgenv()._ZoneTpBusy = false
                        end
                        task.wait(1)
                        lastJoinTime = 0  -- сбросить throttle чтобы Join сразу сработал
                    end

                    local now = tick()
                    if now - lastJoinTime >= 8 then
                        if not getData().Gamemode then  -- только если вообще не в gamemode
                            -- Для timed gamemodes (Trial Easy, Test Raid) проверяем окно
                            if isTimedGamemode(modeName) then
                                local waitSec = getTimeUntilOpen(modeName)
                                if waitSec > 2 then
                                    -- Окно ещё не открылось — спим почти до открытия
                                    -- Не ждём ровно waitSec чтобы не проспать: минус 1 сек safety
                                    local sleepTime = math.max(waitSec - 1, 1)
                                    -- Для диагностики — print только если ждём > 10 сек
                                    if sleepTime > 10 then
                                        print(string.format("[ApelHub] %s opens in %ds — waiting", modeName, math.floor(waitSec)))
                                    end
                                    -- Не спим весь интервал одним wait — нужно чекать toggle
                                    local deadline = tick() + sleepTime
                                    while tick() < deadline and getEnabled() and not stopped do
                                        task.wait(math.min(5, deadline - tick()))
                                    end
                                else
                                    -- Окно открыто — Join
                                    fire("General", "Gamemodes", "Join", modeName)
                                    lastJoinTime = now
                                end
                            else
                                -- Не timed gamemode — Join сразу (Dragon Defense и т.п.)
                                fire("General", "Gamemodes", "Join", modeName)
                                lastJoinTime = now
                            end
                        end
                    end
                    task.wait(3)
                end
            end
        end
    end

    -- Per-mode state storage (persists across rebuild for config preservation)
    local modeStates = {}  -- {[name] = {enabled=, waveLimit=, loop=, slider=, toggle=}}

    -- Построить секции для всех обнаруженных модов
    local builtModes = {}  -- список уже построенных (чтобы не дублировать при Refresh)
    local sideCounter = 0

    local function buildModeSection(entry)
        local name = entry.name
        local cfg = entry.cfg or {}
        local maxWave = tonumber(cfg.MaxWave) or 100
        -- +1 нужно чтобы можно было пройти ПОЛНОСТЬЮ:
        -- при default=MaxWave+1 wave никогда не достигнет лимита,
        -- gamemode завершится естественным путём (Data.Gamemode станет nil),
        -- а loop поймает это и сделает re-join. Если юзер сдвинет slider влево
        -- до конкретной волны — выйдет раньше через TP.
        local sliderMax = maxWave + 1

        sideCounter = sideCounter + 1
        local side = (sideCounter % 2 == 1) and "Left" or "Right"
        local section = tabs.Gamemodes:Section({ Side = side })

        section:Header({ Text = name })

        -- Info labels — показываем данные из конфига модуля
        local infoLines = { "Max Wave: " .. maxWave }
        if cfg.EnterTime then table.insert(infoLines, "Enter Time: " .. cfg.EnterTime .. "s") end
        if cfg.TotalTime then table.insert(infoLines, "Total Time: " .. cfg.TotalTime .. "s") end
        if cfg.MapName  then table.insert(infoLines, "Map: " .. cfg.MapName .. (cfg.ZoneIndex and (" zone " .. cfg.ZoneIndex) or "")) end
        section:Label({ Text = table.concat(infoLines, "\n") })

        -- Preserve state on rebuild (если уже был toggle включён)
        local state = modeStates[name] or {
            enabled = false,
            waveLimit = sliderMax,  -- default = пройти всё
            loop = nil,
        }
        modeStates[name] = state

        section:Slider({
            Name = "Leave at Wave (max = full run)",
            Default = state.waveLimit or sliderMax,
            Minimum = 1, Maximum = sliderMax,
            DisplayMethod = "Value", Precision = 0,
            Callback = function(v) state.waveLimit = v end
        }, name:gsub("%s+", "") .. "_WaveSlider")

        section:Toggle({
            Name = "Auto Run",
            Default = state.enabled,
            Callback = function(on)
                state.enabled = on
                if on then
                    state.loop = task.spawn(makeAutoModeLoop(
                        name,
                        function() return state.waveLimit end,
                        function() return state.enabled end
                    ))
                else
                    if state.loop then task.cancel(state.loop); state.loop = nil end
                end
            end
        }, name:gsub("%s+", "") .. "_AutoToggle")
    end

    -- Build initial set
    for _, entry in ipairs(discoverGamemodes()) do
        if not builtModes[entry.name] then
            builtModes[entry.name] = true
            buildModeSection(entry)
        end
    end

    -- ============================================
    -- Live status (Center) — показывает текущий gamemode и активные toggles
    -- ============================================
    local statusSection = tabs.Gamemodes:Section({ Side = "Center" })
    statusSection:Header({ Text = "Live Status" })
    local waveStatusLabel = SafeWrapLabel(statusSection:Label({ Text = "—" }))

    task.spawn(function()
        while not stopped do
            task.wait(1)
            local d = getData()
            local cur = d.Gamemode
            local lines = { "Current: " .. (cur or "—") }
            if cur then
                local w, mw = getCurrentWave(cur)
                table.insert(lines, string.format("Wave: %d / %d", w, mw))
            end
            local autos = {}
            for name, state in pairs(modeStates) do
                if state.enabled then
                    local suffix = ""
                    -- Показываем время до открытия для timed-режимов если они не активны сейчас
                    if cur ~= name and isTimedGamemode(name) then
                        local waitSec = getTimeUntilOpen(name)
                        if waitSec > 2 then
                            local m = math.floor(waitSec / 60)
                            local s = math.floor(waitSec % 60)
                            suffix = m > 0 and string.format(" (opens in %dm %ds)", m, s)
                                           or  string.format(" (opens in %ds)", s)
                        else
                            suffix = " (OPEN)"
                        end
                    end
                    table.insert(autos, name .. " → " .. tostring(state.waveLimit) .. suffix)
                end
            end
            table.sort(autos)
            if #autos > 0 then
                table.insert(lines, "Auto:")
                for _, a in ipairs(autos) do table.insert(lines, "  " .. a) end
            end
            pcall(function() waveStatusLabel:UpdateName(table.concat(lines, "\n")) end)
        end
    end)
end

-- // ========================================== \\ --
-- //                GACHA TAB                   \\ --
-- // ========================================== \\ --

if not ModulesLoaded then
    local s = tabs.Gacha:Section({ Side = "Left" })
    s:Label({ Text = "⚠ Requires Omni Framework" })
else
    local function getGachaNames()
        local list = Shared and Shared.Gacha and Shared.Gacha.List
        if list then
            local out = {}
            for k, _ in pairs(list) do table.insert(out, k) end
            table.sort(out); return out
        end
        return { "Race", "Dragon Power", "Fruit", "Haki", "Slime Power" }
    end

    local function getBannerNames()
        local d = getData()
        if d.Banner then
            local out = {}
            for k, _ in pairs(d.Banner) do table.insert(out, k) end
            if #out > 0 then table.sort(out); return out end
        end
        return { "Swords Banner" }
    end

    local function getRouletteNames()
        local out = {}
        local sharedFolder = ReplicatedStorage:FindFirstChild("Omni") and ReplicatedStorage.Omni:FindFirstChild("Shared")
        local rFolder = sharedFolder and sharedFolder:FindFirstChild("Roulette")
        if rFolder then
            for _, m in ipairs(rFolder:GetChildren()) do
                if m:IsA("ModuleScript") then table.insert(out, m.Name) end
            end
        end
        if #out == 0 then table.insert(out, "Dragon Wish") end
        table.sort(out); return out
    end

    -- ============================================
    -- LEFT — Auto Gacha
    -- ============================================

    -- Лестница рарностей (из Shared.Banner.Rarities: Common→Uncommon→Rare→Epic→Legendary→Mythical→Secret)
    local RARITY_TIERS = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythical", "Secret" }

    local function rarityRank(str)
        if type(str) ~= "string" or str == "" then return 0 end
        for i, t in ipairs(RARITY_TIERS) do
            if str == t then return i end
        end
        return 0
    end

    -- Возвращает Rarity текущего (последний выпавший) варианта для gacha.
    -- Omni.Data.Gacha[name].Current = имя варианта → Shared.Gacha.List[name].SourceInfo[variant].Rarity
    local function getCurrentGachaRarity(gachaName)
        local d = getData()
        local gData = d.Gacha and d.Gacha[gachaName]
        if not gData or not gData.Current then return nil, nil end
        local current = gData.Current
        local cfg = Shared and Shared.Gacha and Shared.Gacha.List and Shared.Gacha.List[gachaName]
        if not cfg or not cfg.SourceInfo then return current, nil end
        local info = cfg.SourceInfo[current]
        return current, (info and info.Rarity or nil)
    end

    local gachaSection = tabs.Gacha:Section({ Side = "Left" })
    gachaSection:Header({ Text = "Auto Gacha" })

    local selectedGachas = {}
    local gachaCooldown = 0.5
    local gachaTargetRarity = "Legendary"

    -- Авто-детект max rolls per spin (как MaxStarOpen для звёзд)
    -- Базовое значение 1, увеличивается с Gacha Roll geampass'ом
    local function getMaxGachaRolls()
        local v
        local ok = pcall(function()
            v = Omni.Utils.PlayerStats.GachaRolls(Omni.Data, Omni.Instance)
        end)
        if ok and type(v) == "number" and v >= 1 then return math.floor(v) end
        return 1
    end

    gachaSection:Dropdown({
        Name = "Select Gachas (multi)",
        Multi = true,
        Options = getGachaNames(),
        Default = {},
        Callback = function(val) selectedGachas = val end
    }, "GachaSelectDropdown")

    gachaSection:Dropdown({
        Name = "Target Rarity (stop at)",
        Options = RARITY_TIERS,
        Default = "Legendary",
        Callback = function(v) gachaTargetRarity = v end
    }, "GachaTargetRarityDropdown")

    gachaSection:Slider({
        Name = "Delay (sec)",
        Default = 0.5, Minimum = 0.1, Maximum = 5.0,
        DisplayMethod = "Value", Precision = 2,
        Callback = function(v) gachaCooldown = v end
    }, "GachaDelaySlider")

    -- Live status
    local gachaStatusLabel = SafeWrapLabel(gachaSection:Label({ Text = "—" }))

    local function updateGachaStatus()
        local maxRolls = getMaxGachaRolls()
        local lines = { string.format("Target: %s (rank %d) | Max/spin: %d", gachaTargetRarity, rarityRank(gachaTargetRarity), maxRolls) }
        local any = false
        for name, sel in pairs(selectedGachas) do
            if sel == true then
                any = true
                local cur, rar = getCurrentGachaRarity(name)
                if cur then
                    local rank = rar and rarityRank(rar) or 0
                    local targetRank = rarityRank(gachaTargetRarity)
                    local tag = (rank >= targetRank and targetRank > 0) and "✅" or "▶"
                    table.insert(lines, string.format("%s %s: %s (%s)", tag, name, cur, rar or "?"))
                else
                    table.insert(lines, string.format("▶ %s: (not rolled yet)", name))
                end
            end
        end
        if not any then table.insert(lines, "No gachas selected") end
        pcall(function() gachaStatusLabel:UpdateName(table.concat(lines, "\n")) end)
    end

    task.spawn(function()
        while not stopped do task.wait(2); updateGachaStatus() end
    end)

    local autoGachaEnabled = false
    local autoGachaLoops = {}  -- per-gacha parallel loops

    local autoGachaToggle
    autoGachaToggle = gachaSection:Toggle({
        Name = "Auto Gacha",
        Default = false,
        Callback = function(on)
            autoGachaEnabled = on

            if on then
                -- Cancel any previous leftover loops
                for _, loop in pairs(autoGachaLoops) do pcall(task.cancel, loop) end
                autoGachaLoops = {}

                local targetRank = rarityRank(gachaTargetRarity)
                if targetRank <= 0 then
                    warn("[ApelHub] Invalid target rarity: " .. tostring(gachaTargetRarity))
                    autoGachaEnabled = false
                    pcall(function() autoGachaToggle:UpdateState(false) end)
                    return
                end

                -- Count selected
                local selectedList = {}
                for name, sel in pairs(selectedGachas) do
                    if sel == true then table.insert(selectedList, name) end
                end
                if #selectedList == 0 then
                    warn("[ApelHub] No gachas selected")
                    autoGachaEnabled = false
                    pcall(function() autoGachaToggle:UpdateState(false) end)
                    return
                end

                ActivityPriority:SetActivity("Gacha")

                -- Parallel loop per gacha, каждая стопится самостоятельно при достижении target
                local activeCount = #selectedList

                for _, gachaName in ipairs(selectedList) do
                    autoGachaLoops[gachaName] = task.spawn(function()
                        -- Check "already at target" on start
                        local _, startRarity = getCurrentGachaRarity(gachaName)
                        if startRarity and rarityRank(startRarity) >= targetRank then
                            print("[ApelHub] " .. gachaName .. " already at " .. startRarity)
                            activeCount = activeCount - 1
                            if activeCount <= 0 then
                                autoGachaEnabled = false
                                ActivityPriority:ClearActivity("Gacha")
                                pcall(function() autoGachaToggle:UpdateState(false) end)
                            end
                            return
                        end

                        while autoGachaEnabled and not stopped do
                            -- Check current before each roll
                            local _, curRarity = getCurrentGachaRarity(gachaName)
                            if curRarity and rarityRank(curRarity) >= targetRank then
                                print("[ApelHub] " .. gachaName .. " reached " .. curRarity)
                                break
                            end

                            -- Авто-детект max rolls (динамически — может измениться при покупке gamepass)
                            local rolls = getMaxGachaRolls()
                            fire("General", "Gacha", "Roll", gachaName, rolls)
                            task.wait(gachaCooldown)
                        end

                        -- This loop finished — decrement counter; if last one, disable master toggle
                        activeCount = activeCount - 1
                        if activeCount <= 0 then
                            autoGachaEnabled = false
                            ActivityPriority:ClearActivity("Gacha")
                            pcall(function() autoGachaToggle:UpdateState(false) end)
                        end
                    end)
                end
            else
                -- Master toggle turned off — cancel all per-gacha loops
                for _, loop in pairs(autoGachaLoops) do pcall(task.cancel, loop) end
                autoGachaLoops = {}
                ActivityPriority:ClearActivity("Gacha")
            end
        end
    }, "AutoGachaToggle")

    -- ============================================
    -- RIGHT — Auto Banner
    -- ============================================

    local bannerSection = tabs.Gacha:Section({ Side = "Right" })
    bannerSection:Header({ Text = "Auto Banner" })

    local selectedBanner = nil
    local bannerNames = getBannerNames()

    bannerSection:Dropdown({
        Name = "Select Banner",
        Options = bannerNames,
        Default = #bannerNames > 0 and 1 or nil,
        Callback = function(val) selectedBanner = val end
    }, "BannerDropdown")

    local autoBannerEnabled = false
    local autoBannerLoop = nil

    bannerSection:Toggle({
        Name = "Auto Banner Roll",
        Default = false,
        Callback = function(on)
            autoBannerEnabled = on
            if on then
                autoBannerLoop = task.spawn(function()
                    while autoBannerEnabled and not stopped do
                        if selectedBanner and ActivityPriority:CanStart("Banner") then
                            ActivityPriority:SetActivity("Banner")
                            fire("General", "Banner", "Roll", selectedBanner)
                            ActivityPriority:ClearActivity("Banner")
                        end
                        task.wait(1)
                    end
                    ActivityPriority:ClearActivity("Banner")
                end)
            else
                if autoBannerLoop then task.cancel(autoBannerLoop); autoBannerLoop = nil end
                ActivityPriority:ClearActivity("Banner")
            end
        end
    }, "AutoBannerToggle")

    -- ============================================
    -- LEFT BELOW — Auto Stars
    -- ============================================

    local STAR_TP_SETTLE   = 0.2
    local STAR_FIRE_SETTLE = 0.15
    local STAR_BATCH_GAP   = 0.1

    local function getAllStars()
        local result = {}
        local s = Shared and Shared.Stars
        if type(s) ~= "table" then return result end
        for name, cfg in pairs(s) do
            if type(name) == "string" and type(cfg) == "table" and cfg.Price then
                table.insert(result, name)
            end
        end
        table.sort(result); return result
    end

    local function getStarCfg(name)
        return Shared and Shared.Stars and Shared.Stars[name]
    end

    local function getBalance(priceType, priceName)
        local d = getData()
        if priceType == "Currency" then
            return d[priceName] or 0
        elseif priceType == "Item" then
            local items = d.Inventory and d.Inventory.Items or {}
            return items[priceName] or 0
        end
        return 0
    end

    local function canAffordStar(starName, amount)
        local cfg = getStarCfg(starName)
        if not cfg or not cfg.Price then return false end
        amount = amount or 1
        local have = getBalance(cfg.Price.Type, cfg.Price.Name)
        local need = (cfg.Price.Amount or 0) * amount
        return have >= need
    end

    local function getMaxStarOpen()
        local v
        local ok = pcall(function()
            v = Omni.Utils.PlayerStats.MaxStarOpen(Omni.Data, Omni.Instance)
        end)
        if ok and type(v) == "number" and v >= 1 then return math.floor(v) end
        return 1
    end

    -- Откат между Roll'ами в игре = 3.5 / StarOpenSpeed
    -- Base StarOpenSpeed = 1.0 → 3.5 sec. С Star Speed gamepass'ом меньше.
    local function getStarRollCooldown()
        local speed = 1
        pcall(function()
            local v = Omni.Utils.PlayerStats.StarOpenSpeed(Omni.Data, Omni.Instance)
            if type(v) == "number" and v > 0 then speed = v end
        end)
        return math.max(3.5 / speed, 0.5)  -- floor 0.5s safety
    end

    local function computeStarAmount(starName)
        local max = getMaxStarOpen()
        for try = max, 1, -1 do
            if canAffordStar(starName, try) then return try end
        end
        return 0
    end

    local function findStarModel(starName)
        for _, m in ipairs(CollectionService:GetTagged("StarModel")) do
            if m.Name == starName then return m end
        end
        local cl = Workspace:FindFirstChild("Client")
        local st = cl and cl:FindFirstChild("Stars")
        if st then
            for _, zone in ipairs(st:GetChildren()) do
                local match = zone:FindFirstChild(starName)
                if match then return match end
                if zone.Name == starName then return zone end
            end
        end
        return nil
    end

    local function hasRemoteStarPass()
        local gp = getData().Gamepasses or {}
        return gp["Remote Star"] == true
    end

    local function fireStarOpen(starName, amount)
        amount = amount or 1
        fire("General", "Stars", "Open", starName, amount)
    end

    local function tpNearStar(starName)
        local model = findStarModel(starName)
        local hrp = getHRP()
        if not model or not hrp then return false end
        local pos
        if model:IsA("BasePart") then pos = model.Position
        else pcall(function() pos = model:GetPivot().Position end) end
        if not pos then return false end
        if (pos - hrp.Position).Magnitude > 8 then
            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 4, 0))
            return true
        end
        return false
    end

    local starsSection = tabs.Gacha:Section({ Side = "Left" })
    starsSection:Header({ Text = "Auto Stars" })

    local selectedStars = {}
    local starsDropdown = nil
    local useStarTP = true        -- toggle: использовать ли ТП (только если нет Remote Star)
    local pauseInGamemode = true  -- toggle: паузить открытие если в активном гейммоде

    starsDropdown = starsSection:Dropdown({
        Name = "Select Star",
        Options = getAllStars(),
        Default = nil,
        Callback = function(value)
            local set = {}
            if type(value) == "string" and value ~= "" then
                set[value] = true
            end
            getgenv().StarTargets = set
            selectedStars = set
        end
    }, "StarsDropdown")

    starsSection:Button({
        Name = "Refresh List",
        Callback = function()
            pcall(function()
                if starsDropdown.ClearOptions then starsDropdown:ClearOptions() end
                task.wait(0.05)
                starsDropdown:InsertOptions(getAllStars())
            end)
        end
    })

    starsSection:Toggle({
        Name = "Use Teleport (when no Remote Star)",
        Default = true,
        Callback = function(on) useStarTP = on end
    }, "StarUseTPToggle")

    starsSection:Toggle({
        Name = "Pause in Gamemode",
        Default = true,
        Callback = function(on) pauseInGamemode = on end
    }, "StarPauseInGMToggle")

    starsSection:Toggle({
        Name = "Hide Open Animation (unfreezes camera)",
        Default = false,
        Callback = function(on)
            starHideEnabled = on
            if on then startStarHide() else stopStarHide() end
        end
    }, "StarHideAnimToggle")

    -- Live status
    local starStatusLabel = SafeWrapLabel(starsSection:Label({ Text = "Status: idle" }))

    local function updateStarStatus()
        local targets = getgenv().StarTargets or {}
        local names = {}
        for n in pairs(targets) do table.insert(names, n) end
        table.sort(names)

        if #names == 0 then
            pcall(function() starStatusLabel:UpdateName("Status: no stars selected") end)
            return
        end

        local maxAmt = getMaxStarOpen()
        local rollCD = getStarRollCooldown()
        local mode = hasRemoteStarPass() and "Remote ✓" or (useStarTP and "TP" or "No TP")
        local gmTag = (pauseInGamemode and isInGamemode()) and "  ⏸ paused (in gamemode)" or ""
        local lines = {
            string.format("Mode: %s | Max/open: %d | CD: %.1fs%s", mode, maxAmt, rollCD, gmTag)
        }

        for _, name in ipairs(names) do
            local cfg = getStarCfg(name)
            if cfg and cfg.Price then
                local pname, ptype, amt = cfg.Price.Name, cfg.Price.Type, cfg.Price.Amount or 0
                local have = getBalance(ptype, pname)
                local opens = math.floor(have / math.max(1, amt))
                local tag = (opens >= maxAmt) and "✅" or (opens >= 1 and "⚠" or "❌")
                table.insert(lines, string.format("%s %s: %d/%d (opens %d)", tag, name, have, amt, opens))
            end
        end
        pcall(function() starStatusLabel:UpdateName(table.concat(lines, "\n")) end)
    end

    task.spawn(function()
        while not stopped do task.wait(2); updateStarStatus() end
    end)

    local autoStarsEnabled = false
    local autoStarsLoop = nil

    starsSection:Toggle({
        Name = "Auto Open Stars",
        Default = false,
        Callback = function(on)
            autoStarsEnabled = on
            if on then
                autoStarsLoop = task.spawn(function()
                    while autoStarsEnabled and not stopped do
                        -- Уважаем zone-tp farm'а: не вмешиваемся пока он между зонами
                        while getgenv()._ZoneTpBusy and autoStarsEnabled and not stopped do
                            task.wait(0.15)
                        end
                        -- Pause in active gamemode (если включено)
                        if pauseInGamemode and isInGamemode() then
                            task.wait(2)
                            -- continue loop
                        else
                            local targets = getgenv().StarTargets or {}
                            if next(targets) == nil then
                                task.wait(1)
                            else
                                local anyAffordable = false
                                for name in pairs(targets) do
                                    if computeStarAmount(name) >= 1 then anyAffordable = true; break end
                                end

                                if not anyAffordable then
                                    task.wait(5)
                                else
                                    local remote = hasRemoteStarPass()
                                    local rollCD = getStarRollCooldown()  -- 3.5 / StarOpenSpeed

                                    if remote then
                                        -- Remote Star: ТП не нужен
                                        for starName in pairs(targets) do
                                            if not autoStarsEnabled or stopped then break end
                                            local amt = computeStarAmount(starName)
                                            if amt >= 1 then
                                                fireStarOpen(starName, amt)
                                                task.wait(STAR_BATCH_GAP)
                                            end
                                        end
                                        task.wait(rollCD)
                                    elseif not useStarTP then
                                        -- ТП отключён — пробуем без него (сервер вернёт ошибку если далеко)
                                        for starName in pairs(targets) do
                                            if not autoStarsEnabled or stopped then break end
                                            local amt = computeStarAmount(starName)
                                            if amt >= 1 then
                                                fireStarOpen(starName, amt)
                                                task.wait(STAR_BATCH_GAP)
                                            end
                                        end
                                        task.wait(rollCD)
                                    else
                                        -- Shared HRP: приоритет останавливает Auto Farm → TP к яйцу →
                                        -- 0.15с settle → fire → 0.15с settle → TP назад → cleanup приоритет.
                                        -- Farm сразу продолжает. Следующая итерация ровно через rollCD
                                        -- от СТАРТА (чтобы TP-время не добавлялось к cooldown'у).
                                        local iterStart = tick()
                                        local hrp = getHRP()
                                        local savedCF = hrp and hrp.CFrame

                                        if ActivityPriority:CanStart("Star") then
                                            ActivityPriority:SetActivity("Star")
                                            getgenv()._StarBusy = true

                                            -- Дать фарму 1 тик чтобы выйти из attack-loop'а
                                            task.wait()

                                            for starName in pairs(targets) do
                                                if not autoStarsEnabled or stopped then break end
                                                local amt = computeStarAmount(starName)
                                                if amt >= 1 then
                                                    local tpHappened = tpNearStar(starName)
                                                    if tpHappened then task.wait(STAR_TP_SETTLE) end
                                                    fireStarOpen(starName, amt)
                                                    task.wait(STAR_FIRE_SETTLE)
                                                end
                                            end

                                            -- ВСЕГДА возвращаемся на сохранённый CFrame — это safe reset
                                            -- независимо активен ли farm сейчас или только что поставили на паузу
                                            if savedCF then
                                                local hrp2 = getHRP()
                                                if hrp2 then
                                                    pcall(function() hrp2.CFrame = savedCF end)
                                                end
                                            end

                                            -- Cleanup приоритет ПЕРЕД wait'ом — farm подхватит работу сразу
                                            getgenv()._StarBusy = false
                                            ActivityPriority:ClearActivity("Star")
                                        end

                                        -- Ждём точно до истечения rollCD с момента СТАРТА итерации.
                                        -- Если TP+fire+TP заняли 0.5с, остаток ждать 3с (при rollCD=3.5).
                                        -- Farm работает параллельно в это время.
                                        local elapsed = tick() - iterStart
                                        local remaining = rollCD - elapsed
                                        if remaining > 0 then task.wait(remaining) end
                                    end
                                end
                            end
                        end
                    end
                    getgenv()._StarBusy = false
                    ActivityPriority:ClearActivity("Star")
                end)
            else
                if autoStarsLoop then task.cancel(autoStarsLoop); autoStarsLoop = nil end
                getgenv()._StarBusy = false
                ActivityPriority:ClearActivity("Star")
            end
        end
    }, "AutoStarsToggle")

    -- ============================================
    -- RIGHT BELOW — Auto Roulette
    -- ============================================

    local rouletteSection = tabs.Gacha:Section({ Side = "Right" })
    rouletteSection:Header({ Text = "Auto Roulette (Dragon Wish)" })

    local selectedRoulette = nil
    local rouletteNames = getRouletteNames()

    rouletteSection:Dropdown({
        Name = "Select Roulette",
        Options = rouletteNames,
        Default = #rouletteNames > 0 and 1 or nil,
        Callback = function(val) selectedRoulette = val end
    }, "RouletteDropdown")

    local autoRouletteEnabled = false
    local autoRouletteLoop = nil

    rouletteSection:Toggle({
        Name = "Auto Roulette Roll",
        Default = false,
        Callback = function(on)
            autoRouletteEnabled = on
            if on then
                autoRouletteLoop = task.spawn(function()
                    while autoRouletteEnabled and not stopped do
                        if selectedRoulette and ActivityPriority:CanStart("Roulette") then
                            ActivityPriority:SetActivity("Roulette")
                            fire("General", "Roulette", "Roll", selectedRoulette)
                            ActivityPriority:ClearActivity("Roulette")
                        end
                        task.wait(3)
                    end
                    ActivityPriority:ClearActivity("Roulette")
                end)
            else
                if autoRouletteLoop then task.cancel(autoRouletteLoop); autoRouletteLoop = nil end
                ActivityPriority:ClearActivity("Roulette")
            end
        end
    }, "AutoRouletteToggle")
end
-- // ========================================== \\ --
-- //              REWARDS TAB                    \\ --
-- // ========================================== \\ --

if not ModulesLoaded then
    local s = tabs.Rewards:Section({ Side = "Left" })
    s:Label({ Text = "⚠ Requires Omni Framework" })
else
    -- Helpers
    local CHEST_CD = {
        ["Daily Chest"] = 24 * 3600,
        ["Group Chest"] = 12 * 3600,
        ["VIP Chest"]   =  4 * 3600,
    }

    local _chestPos = {}
    local function getChestPos(chestName)
        if _chestPos[chestName] ~= nil then return _chestPos[chestName] or nil end
        local sv = Workspace:FindFirstChild("Server")
        local ia = sv and sv:FindFirstChild("Interactable")
        if not ia then return nil end
        for _, zone in ipairs(ia:GetChildren()) do
            local part = zone:FindFirstChild(chestName .. " Chest")
            if part and part:IsA("BasePart") then
                _chestPos[chestName] = part.Position
                return part.Position
            end
        end
        _chestPos[chestName] = false
        return nil
    end

    local function getChestLastClaim(chestName)
        local d = getData().Chests and getData().Chests[chestName]
        if not d then return nil end
        if type(d) == "number" then return d end
        if type(d) == "table" then
            return d.LastClaim or d.Last or d.Time or d.LastRefresh or d.Claimed
        end
        return nil
    end

    local function chestOnCooldown(chestName)
        local last = getChestLastClaim(chestName)
        if not last then return false end
        local cd = CHEST_CD[chestName] or 24 * 3600
        return (tick() - last) < cd
    end

    local function tryClaimChest(chestName)
        if chestOnCooldown(chestName) then return false end
        if not shouldFire("chest." .. chestName, 60) then return false end

        local hrp = getHRP();      if not hrp then return false end
        local savedCF = hrp.CFrame
        local pos = getChestPos(chestName)

        if pos then
            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 4, 0))
            task.wait(0.2)
        end
        fire("General", "Chests", "Claim", chestName)
        task.wait(0.3)
        if pos then hrp.CFrame = savedCF end
        return true
    end

    local function tryAchievementsClaimAll()
        if not shouldFire("ach.claimall", 5) then return end
        fire("General", "Achievements", "ClaimAll")
    end

    local function tryTimeRewards()
        local data = getData().TimeRewards
        local shared = Shared and Shared.TimeRewards
        if not data or not shared then return end
        local tp = data.TimePlayed or 0
        local claimed = data.Claimed or {}
        for idx, entry in pairs(shared) do
            if type(idx) == "number" and type(entry) == "table" and entry.Time then
                -- ВАЖНО: ключи в Replica.Claimed хранятся как строки (JSON-сериализация)
                if tp >= entry.Time and claimed[tostring(idx)] ~= true then
                    if shouldFire("time." .. idx, 2) then
                        fire("General", "TimeRewards", "Claim", idx)
                    end
                end
            end
        end
    end

    local function tryDailyRewards()
        local data = getData().DailyRewards
        local shared = Shared and Shared.DailyRewards
        if not data or not shared then return end
        local start = data.Start or 0
        local claimed = data.Claimed or {}
        -- Игра использует workspace:GetServerTimeNow() — серверное время надёжнее tick()
        local now = workspace:GetServerTimeNow()
        local daysFloor = math.floor((now - start) / 86400)
        for idx, _ in pairs(shared) do
            if type(idx) == "number" and claimed[tostring(idx)] ~= true and (idx - 1) <= daysFloor then
                if shouldFire("daily." .. idx, 2) then
                    fire("General", "DailyRewards", "Claim", idx)
                end
            end
        end
    end

    local function tryFollowRewards()
        if not shouldFire("follow.verify", 300) then return end
        fire("General", "FollowRewards", "Verify")
    end

    -- Global flags для toggles
    getgenv().AutoAchievements  = getgenv().AutoAchievements  or false
    getgenv().AutoTimeRewards   = getgenv().AutoTimeRewards   or false
    getgenv().AutoDailyRewards  = getgenv().AutoDailyRewards  or false
    getgenv().AutoFollowRewards = getgenv().AutoFollowRewards or false
    getgenv().AutoDailyChest    = getgenv().AutoDailyChest    or false
    getgenv().AutoGroupChest    = getgenv().AutoGroupChest    or false
    getgenv().AutoVIPChest      = getgenv().AutoVIPChest      or false

    local rewardsThread = nil
    local function startRewardsLoop()
        if rewardsThread then return end
        rewardsThread = task.spawn(function()
            while not stopped do
                if getgenv().AutoAchievements then tryAchievementsClaimAll() end
                if getgenv().AutoTimeRewards   then tryTimeRewards()          end
                if getgenv().AutoDailyRewards  then tryDailyRewards()         end
                if getgenv().AutoFollowRewards then tryFollowRewards()        end
                if getgenv().AutoDailyChest    then tryClaimChest("Daily Chest") end
                if getgenv().AutoGroupChest    then tryClaimChest("Group Chest") end
                if getgenv().AutoVIPChest      then tryClaimChest("VIP Chest")   end
                task.wait(30)
            end
            rewardsThread = nil
        end)
    end
    local function ensureRewards(s) if s then startRewardsLoop() end end

    -- LEFT — Auto Rewards
    local claimSection = tabs.Rewards:Section({ Side = "Left" })
    claimSection:Header({ Text = "Auto Claim Rewards" })

    claimSection:Toggle({ Name = "Auto Achievements (ClaimAll)", Default = false,
        Callback = function(s) getgenv().AutoAchievements = s; ensureRewards(s) end }, "AutoAchievementsToggle")
    claimSection:Toggle({ Name = "Auto Time Rewards", Default = false,
        Callback = function(s) getgenv().AutoTimeRewards = s; ensureRewards(s) end }, "AutoTimeToggle")
    claimSection:Toggle({ Name = "Auto Daily Rewards", Default = false,
        Callback = function(s) getgenv().AutoDailyRewards = s; ensureRewards(s) end }, "AutoDailyToggle")
    claimSection:Toggle({ Name = "Auto Follow Rewards", Default = false,
        Callback = function(s) getgenv().AutoFollowRewards = s; ensureRewards(s) end }, "AutoFollowToggle")

    claimSection:Divider()
    claimSection:Header({ Text = "Auto Chests (with cooldown)" })

    claimSection:Toggle({ Name = "Auto Daily Chest", Default = false,
        Callback = function(s) getgenv().AutoDailyChest = s; ensureRewards(s) end }, "AutoDailyChestToggle")
    claimSection:Toggle({ Name = "Auto Group Chest", Default = false,
        Callback = function(s) getgenv().AutoGroupChest = s; ensureRewards(s) end }, "AutoGroupChestToggle")
    claimSection:Toggle({ Name = "Auto VIP Chest", Default = false,
        Callback = function(s) getgenv().AutoVIPChest = s; ensureRewards(s) end }, "AutoVIPChestToggle")

    -- Cooldown display
    claimSection:Divider()
    local chestStatusLabel = claimSection:Label({ Text = "Chests: loading..." })

    local function formatCooldown(chestName)
        local last = getChestLastClaim(chestName)
        if not last then return "ready" end
        local cd = CHEST_CD[chestName] or 24 * 3600
        local rem = cd - (tick() - last)
        if rem <= 0 then return "ready" end
        local h = math.floor(rem / 3600)
        local m = math.floor((rem % 3600) / 60)
        return string.format("%dh %dm", h, m)
    end

    task.spawn(function()
        while not stopped do
            task.wait(5)
            pcall(function()
                chestStatusLabel:UpdateName(string.format(
                    "Daily: %s | Group: %s | VIP: %s",
                    formatCooldown("Daily Chest"),
                    formatCooldown("Group Chest"),
                    formatCooldown("VIP Chest")
                ))
            end)
        end
    end)

    -- RIGHT — Auto Codes + Auto Index
    local codesSection = tabs.Rewards:Section({ Side = "Right" })
    codesSection:Header({ Text = "Auto Codes" })

    local knownCodes = {
        "RELEASE", "WORLDFIGHTERS", "FREE100", "UPDATE1",
        "DEV", "ADMIN", "WELCOME", "SHUTDOWN",
        "THXSUB", "100KLIKES", "1MVISITS",
    }

    local autoCodesEnabled = false
    local autoCodesLoop = nil

    codesSection:Toggle({
        Name = "Auto Redeem Known Codes",
        Default = false,
        Callback = function(on)
            autoCodesEnabled = on
            if on then
                autoCodesLoop = task.spawn(function()
                    while autoCodesEnabled and not stopped do
                        for _, code in ipairs(knownCodes) do
                            if not autoCodesEnabled then break end
                            fire("General", "Codes", "Redeem", code)
                            task.wait(0.5)
                        end
                        task.wait(300)
                    end
                end)
            else
                if autoCodesLoop then task.cancel(autoCodesLoop); autoCodesLoop = nil end
            end
        end
    }, "AutoCodesToggle")

    codesSection:Divider()
    codesSection:Header({ Text = "Auto Index" })

    local autoIndexEnabled = false
    local autoIndexLoop = nil

    codesSection:Toggle({
        Name = "Auto Index All Owned",
        Default = false,
        Callback = function(on)
            autoIndexEnabled = on
            if on then
                autoIndexLoop = task.spawn(function()
                    while autoIndexEnabled and not stopped do
                        local d = getData()
                        if d.Inventory and d.Index and Shared and Shared.Index and Shared.Index.GetNextValueForIdentifier then
                            for _, cat in ipairs({ "Units", "Swords", "Accessories", "Mounts", "Avatars" }) do
                                if not autoIndexEnabled then break end
                                local inv = d.Inventory[cat]
                                if inv then
                                    for _, item in pairs(inv) do
                                        if not autoIndexEnabled then break end
                                        local itemName = type(item) == "table" and (item.Name or item.name) or item
                                        if itemName then
                                            local nextVal
                                            pcall(function()
                                                nextVal = Shared.Index.GetNextValueForIdentifier(cat, itemName, d)
                                            end)
                                            if nextVal then
                                                fire("General", "Index", "Set", cat, itemName, nextVal)
                                                task.wait(0.1)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        task.wait(60)
                    end
                end)
            else
                if autoIndexLoop then task.cancel(autoIndexLoop); autoIndexLoop = nil end
            end
        end
    }, "AutoIndexToggle")
end

-- // ========================================== \\ --
-- //              QUESTS TAB (Auto Quest)       \\ --
-- // ========================================== \\ --

if not ModulesLoaded then
    local s = tabs.Quests:Section({ Side = "Left" })
    s:Label({ Text = "⚠ Requires Omni Framework" })
else
    local function pinQuest(questName)
        if getData().Quests and getData().Quests.Pinned == questName then return end
        if not shouldFire("quest.pin." .. questName, 5) then return end
        fire("General", "Quests", "Pin", questName)
    end

    local function tpToQuestZone(questName)
        local cfg = getQuestCfg(questName)
        if not cfg or not cfg.MapName then return false end
        if not shouldFire("quest.tp." .. questName, 3) then return false end
        fire("Player", "Teleport", "Teleport", cfg.MapName, cfg.ZoneIndex or 1)
        return true
    end

    -- Нужны те же helpers что у Auto Farm (teleportTo, attackOnce, getClickCooldown)
    local function q_teleportTo(mob)
        local hrp = getHRP();       if not hrp then return false end
        local pos = getMobPos(mob); if not pos then return false end
        hrp.CFrame = CFrame.new(pos + Vector3.new(3, 2, 0))
        return true
    end

    local function q_attackOnce()
        local ids
        pcall(function() ids = Omni.Cache:Get({ "EnemiesOnRangeIds" }) end)
        ids = ids or {}
        fire("General", "Attack", "Click", ids)
    end

    local function q_getClickCooldown()
        local cd = 0.3
        pcall(function()
            local v = Omni.Utils.PlayerStats.ClickCooldown(Omni.Data, Omni.Instance)
            if type(v) == "number" and v > 0 then cd = v end
        end)
        return math.max(cd, 0.05)
    end

    -- Главный цикл Auto Quest
    local questThread = nil
    local function startQuestLoop()
        if questThread then return end
        questThread = task.spawn(function()
            while getgenv().AutoQuest and not stopped do
                while (getgenv()._StarBusy or getgenv()._ZoneTpBusy)
                    and getgenv().AutoQuest and not stopped
                do
                    task.wait(0.1)
                end

                local selected = getgenv().QuestSelections or {}
                local names = {}
                for n in pairs(selected) do table.insert(names, n) end
                table.sort(names)

                local activeQuestName, activeMission
                for _, qn in ipairs(names) do
                    local m = getActiveMission(qn)
                    if m then
                        activeQuestName = qn
                        activeMission   = m
                        break
                    end
                end

                if not activeQuestName then
                    task.wait(3)
                else
                    if getgenv().AutoPinQuest then pinQuest(activeQuestName) end

                    -- Синхронизируем Targets для отображения в Main tab статусе
                    getgenv().Targets = { [activeMission.name] = true }

                    if getgenv().AutoTpToQuestZone and not isInQuestZone(activeQuestName) then
                        getgenv()._ZoneTpBusy = true
                        tpToQuestZone(activeQuestName)
                        task.wait(1.5)
                        getgenv()._ZoneTpBusy = false
                    end

                    local targetSet = { [activeMission.name] = true }
                    local curMap    = getData().Map
                    local curZone   = tonumber(getData().Zone or 1) or 1

                    local hasReady, hasLive = hasReadyTargetsInCurrentZone(targetSet)

                    if hasReady then
                        local candidates = {}
                        local folder = getEnemiesFolder()
                        if folder then
                            for _, mob in ipairs(folder:GetChildren()) do
                                if targetSet[mob.Name] and isAlive(mob) and getMobPos(mob) then
                                    table.insert(candidates, mob)
                                end
                            end
                        end

                        if #candidates == 0 then
                            task.wait(0.5)
                        else
                            table.sort(candidates, function(a, b)
                                local ha = getMobHPValue(a) or math.huge
                                local hb = getMobHPValue(b) or math.huge
                                return ha < hb
                            end)

                            local hrp = getHRP()
                            local mob = candidates[1]
                            if mob and isAlive(mob) then
                                q_teleportTo(mob)
                                task.wait(0.08)

                                local cd        = q_getClickCooldown()
                                local startTime = tick()
                                local mobName   = mob.Name

                                while getgenv().AutoQuest and not stopped
                                    and not getgenv()._StarBusy
                                    and not getgenv()._ZoneTpBusy
                                    and targetSet[mobName]
                                    and isAlive(mob)
                                    and tick() - startTime < 15
                                do
                                    local mp = getMobPos(mob)
                                    local my = hrp and hrp.Position
                                    if mp and my and (mp - my).Magnitude > 12 then
                                        q_teleportTo(mob)
                                        task.wait(0.05)
                                    end
                                    q_attackOnce()
                                    task.wait(cd)
                                end
                            end
                        end
                    elseif hasLive then
                        local ok = tpToFurthestVisibleMob()
                        if not ok then
                            getgenv()._ZoneTpBusy = true
                            pcall(function()
                                Signal:Fire("Player", "Teleport", "Teleport", curMap, curZone)
                            end)
                            task.wait(1.0)
                            getgenv()._ZoneTpBusy = false
                        else
                            task.wait(0.6)
                        end
                    else
                        if anyTargetInZoneConfig(targetSet, curMap, curZone) then
                            local tpOk = tpToFurthestVisibleMob()
                            task.wait(tpOk and 0.6 or 1.5)
                        else
                            local best = findBestZoneForTargets(targetSet)
                            if best and (best.mapName ~= curMap or best.zoneIdx ~= curZone) then
                                getgenv()._ZoneTpBusy = true
                                teleportToZone(best.mapName, best.zoneIdx)
                                getgenv()._ZoneTpBusy = false
                            else
                                task.wait(3)
                            end
                        end
                    end
                end
            end
            questThread = nil
        end)
    end

    -- UI: Auto Quest controls
    local questLeft = tabs.Quests:Section({ Side = "Left" })
    questLeft:Header({ Text = "Auto Quest" })

    local questDropdown = questLeft:Dropdown({
        Name = "Quests (multi)",
        Multi = true, Required = false,
        Options = getAllQuests(),
        Default = {},
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do
                    if v and type(k) == "string" then set[k] = true end
                end
            elseif type(values) == "string" and values ~= "" then
                set[values] = true
            end
            getgenv().QuestSelections = set
        end
    }, "QuestsDropdown")

    questLeft:Button({
        Name = "Refresh List",
        Callback = function()
            pcall(function()
                if questDropdown.ClearOptions then questDropdown:ClearOptions() end
                task.wait(0.05)
                questDropdown:InsertOptions(getAllQuests())
            end)
        end
    })

    questLeft:Toggle({
        Name = "Auto Quest",
        Default = false,
        Callback = function(s)
            getgenv().AutoQuest = s
            if s then startQuestLoop() end
        end
    }, "AutoQuestToggle")

    questLeft:Toggle({
        Name = "Auto Pin Quest",
        Default = true,
        Callback = function(s) getgenv().AutoPinQuest = s end
    }, "AutoPinQuestToggle")

    questLeft:Toggle({
        Name = "Auto TP to Quest Zone",
        Default = true,
        Callback = function(s) getgenv().AutoTpToQuestZone = s end
    }, "AutoTpToQuestZoneToggle")

    -- RIGHT — Status
    local questRight = tabs.Quests:Section({ Side = "Right" })
    questRight:Header({ Text = "Quest Status" })

    local questStatusLabel = SafeWrapLabel(questRight:Label({ Text = "—" }))

    local function updateQuestStatus()
        local selected = getgenv().QuestSelections or {}
        local names = {}
        for n in pairs(selected) do table.insert(names, n) end
        table.sort(names)

        local lines = {
            "Auto Quest: " .. (getgenv().AutoQuest and "ON" or "OFF"),
            "Auto Farm:  " .. (tostring(getgenv()._FarmBusy == true))
        }

        local curTargets = {}
        for n in pairs(getgenv().Targets or {}) do table.insert(curTargets, n) end
        if #curTargets > 0 then
            table.sort(curTargets)
            table.insert(lines, "Current: " .. table.concat(curTargets, ", "))
        end

        if #names == 0 then
            table.insert(lines, "Quests: —")
        else
            for _, qn in ipairs(names) do
                local cfg = getQuestCfg(qn)
                local totalMissions = 0
                if cfg and cfg.Missions then
                    for k in pairs(cfg.Missions) do
                        if type(k) == "number" then totalMissions = totalMissions + 1 end
                    end
                end
                local active = getActiveMission(qn)
                if active then
                    local zoneOK = isInQuestZone(qn) and "" or " (wrong zone)"
                    table.insert(lines, string.format("▶ %s (m#%d/%d)%s", qn, active.missionIdx, totalMissions, zoneOK))
                    table.insert(lines, string.format("  Kill %s [%d/%d]", active.name, active.progress, active.required))
                else
                    if cfg and cfg.Missions then
                        local anyTarget
                        for _, m in pairs(cfg.Missions) do
                            if extractMissionTarget(m) then anyTarget = true; break end
                        end
                        if not anyTarget then
                            table.insert(lines, string.format("⚠ %s (missions unparseable — use Debug)", qn))
                        else
                            table.insert(lines, string.format("✅ %s (completed)", qn))
                        end
                    else
                        table.insert(lines, string.format("? %s", qn))
                    end
                end
            end
        end
        pcall(function() questStatusLabel:UpdateName(table.concat(lines, "\n")) end)
    end

    task.spawn(function()
        while not stopped do
            task.wait(2)
            updateQuestStatus()
        end
    end)
end

-- // ========================================== \\ --
-- //                MISC TAB                    \\ --
-- // ========================================== \\ --

-- Walk Speed
local miscPlayerSection = tabs.Misc:Section({ Side = "Left" })
miscPlayerSection:Header({ Text = "Player" })

local currentSpeed = 16
local walkSpeedConn = nil

local function applyWalkSpeed(character)
    if walkSpeedConn then walkSpeedConn:Disconnect(); walkSpeedConn = nil end
    local hum = character:WaitForChild("Humanoid", 5)
    if not hum then return end
    hum.WalkSpeed = currentSpeed
    walkSpeedConn = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if hum.WalkSpeed ~= currentSpeed then hum.WalkSpeed = currentSpeed end
    end)
end

miscPlayerSection:Slider({
    Name = "Walk Speed",
    Default = 16, Minimum = 16, Maximum = 200,
    DisplayMethod = "Value", Precision = 0,
    Callback = function(v)
        currentSpeed = v
        if LocalPlayer.Character then applyWalkSpeed(LocalPlayer.Character) end
    end
}, "WalkSpeedSlider")

LocalPlayer.CharacterAdded:Connect(applyWalkSpeed)
if LocalPlayer.Character then applyWalkSpeed(LocalPlayer.Character) end

-- ============================================
-- DISABLE GAME ANTI-AFK
-- ============================================
-- Игра имеет агрессивный анти-AFK (Omni.Scripts.Player.AntiAfk):
--  • Counter растёт каждую секунду без UserInputService.InputBegan
--  • При 900s idle + Settings["Anti Afk"]==true → Reconnect (кик + телепорт обратно)
--  • Idled signal на 900s → infinite loop Reconnect каждую секунду
--  • ClientReplicator.AncestryChanged → auto-teleport на разрыв соединения
-- Решение: установить Settings.Anti Afk = false + дисконнектить Idled connections
if ModulesLoaded then
    local disableAntiAfkEnabled = false
    local disableAntiAfkLoop = nil

    local function killGameAntiAfk()
        -- 1. Выключить game setting (главное)
        pcall(function()
            if (getData().Settings or {})["Anti Afk"] == true then
                fire("General", "Settings", "Set", "Anti Afk", false)
            end
        end)

        -- 2. Дисконнектить все LocalPlayer.Idled connections (включая game's)
        pcall(function()
            local GC = getconnections or get_signal_cons
            if GC then
                for _, c in pairs(GC(LocalPlayer.Idled)) do
                    if c["Disable"] then c["Disable"](c)
                    elseif c["Disconnect"] then c["Disconnect"](c) end
                end
            end
        end)

        -- 3. Сбросить AntiAfk auto-resume (чтобы не открывало звёзды/гача автоматом)
        pcall(function()
            local d = getData()
            if d.AntiAfk then
                if d.AntiAfk.LastStar   and d.AntiAfk.LastStar   ~= "None" then
                    fire("Player", "AntiAfk", "SetValue", "LastStar",   "None")
                end
                if d.AntiAfk.LastGacha  and d.AntiAfk.LastGacha  ~= "None" then
                    fire("Player", "AntiAfk", "SetValue", "LastGacha",  "None")
                end
                if d.AntiAfk.LastBanner and d.AntiAfk.LastBanner ~= "None" then
                    fire("Player", "AntiAfk", "SetValue", "LastBanner", "None")
                end
            end
        end)
    end

    miscPlayerSection:Toggle({
        Name = "Disable Game Anti-AFK (recommended)",
        Default = true,
        Callback = function(on)
            disableAntiAfkEnabled = on
            if on then
                killGameAntiAfk()
                disableAntiAfkLoop = task.spawn(function()
                    while disableAntiAfkEnabled and not stopped do
                        task.wait(30)
                        killGameAntiAfk()
                    end
                end)
            else
                if disableAntiAfkLoop then
                    task.cancel(disableAntiAfkLoop)
                    disableAntiAfkLoop = nil
                end
                -- Restore game setting
                pcall(function() fire("General", "Settings", "Set", "Anti Afk", true) end)
            end
        end
    }, "DisableGameAntiAfkToggle")
end

if not ModulesLoaded then
    local s = tabs.Misc:Section({ Side = "Right" })
    s:Label({ Text = "⚠ Other features require Omni Framework" })
else
    -- LEFT (под Player) — Auto Progression + Trial Upg
    miscPlayerSection:Divider()
    miscPlayerSection:Header({ Text = "Auto Progression" })

    local function getProgressionNames()
        local list = Shared and Shared.Progression and Shared.Progression.List
        if list then
            local out = {}
            for k, _ in pairs(list) do table.insert(out, k) end
            table.sort(out); return out
        end
        return { "Pirate Evolution", "Combat", "Dragon", "Ki", "Race" }
    end

    local selectedProgs = {}

    miscPlayerSection:Dropdown({
        Name = "Progressions (multi)",
        Multi = true, Options = getProgressionNames(), Default = {},
        Callback = function(val) selectedProgs = val end
    }, "ProgressionDropdown")

    local autoProgEnabled = false
    local autoProgLoop = nil

    miscPlayerSection:Toggle({
        Name = "Auto Upgrade",
        Default = false,
        Callback = function(on)
            autoProgEnabled = on
            if on then
                autoProgLoop = task.spawn(function()
                    while autoProgEnabled and not stopped do
                        for prog, sel in pairs(selectedProgs) do
                            if not autoProgEnabled then break end
                            if sel == true then
                                fire("General", "Progression", "Upgrade", prog)
                                task.wait(0.3)
                            end
                        end
                        task.wait(2)
                    end
                end)
            else
                if autoProgLoop then task.cancel(autoProgLoop); autoProgLoop = nil end
            end
        end
    }, "AutoProgToggle")

    miscPlayerSection:Divider()
    miscPlayerSection:Header({ Text = "Auto Trial Upgrades" })

    local trialUpgrades = { "Power", "Attack Distance", "Crystals", "Attack Speed", "Damage" }
    local selectedTrialUpgrades = {}

    miscPlayerSection:Dropdown({
        Name = "Trial Upgrades (multi)",
        Multi = true, Options = trialUpgrades, Default = {},
        Callback = function(val) selectedTrialUpgrades = val end
    }, "TrialUpgradesDropdown")

    local autoTrialUpgEnabled = false
    local autoTrialUpgLoop = nil

    miscPlayerSection:Toggle({
        Name = "Auto Trial Upgrade",
        Default = false,
        Callback = function(on)
            autoTrialUpgEnabled = on
            if on then
                autoTrialUpgLoop = task.spawn(function()
                    while autoTrialUpgEnabled and not stopped do
                        for upg, sel in pairs(selectedTrialUpgrades) do
                            if not autoTrialUpgEnabled then break end
                            if sel == true then
                                fire("General", "Upgrade", "Upgrade", "Trial Upgrades", upg)
                                task.wait(0.3)
                            end
                        end
                        task.wait(3)
                    end
                end)
            else
                if autoTrialUpgLoop then task.cancel(autoTrialUpgLoop); autoTrialUpgLoop = nil end
            end
        end
    }, "AutoTrialUpgToggle")

    -- RIGHT — SkillTree + Merchant
    local skillSection = tabs.Misc:Section({ Side = "Right" })
    skillSection:Header({ Text = "Auto Skill Tree" })

    -- Получить список всех skill trees из Shared.SkillTree.List
    local function getSkillTreeNames()
        local list = Shared and Shared.SkillTree and Shared.SkillTree.List
        if list then
            local out = {}
            for k, _ in pairs(list) do
                if type(k) == "string" then table.insert(out, k) end
            end
            table.sort(out); return out
        end
        return { "Pirate Evolution" }  -- fallback
    end

    local selectedSkillTrees = {}
    local skillTreeDropdown = skillSection:Dropdown({
        Name = "Skill Trees (multi)",
        Multi = true,
        Options = getSkillTreeNames(),
        Default = {},
        Callback = function(val) selectedSkillTrees = val end
    }, "SkillTreeDropdown")

    skillSection:Button({
        Name = "Refresh Trees",
        Callback = function()
            pcall(function()
                if skillTreeDropdown.ClearOptions then skillTreeDropdown:ClearOptions() end
                task.wait(0.05)
                skillTreeDropdown:InsertOptions(getSkillTreeNames())
            end)
        end
    })

    local autoSkillEnabled = false
    local autoSkillLoop = nil

    skillSection:Toggle({
        Name = "Auto Unlock (parent-aware)",
        Default = false,
        Callback = function(on)
            autoSkillEnabled = on
            if on then
                autoSkillLoop = task.spawn(function()
                    while autoSkillEnabled and not stopped do
                        local anyTreeProgressed = false

                        for treeName, sel in pairs(selectedSkillTrees) do
                            if not autoSkillEnabled then break end
                            -- Правильный путь — через .List (мой старый код использовал просто Shared.SkillTree[name])
                            local tree = sel == true
                                and Shared and Shared.SkillTree and Shared.SkillTree.List
                                and Shared.SkillTree.List[treeName]
                                or nil

                            if tree and type(tree.Upgrades) == "table" then
                                -- Multi-pass: на каждом проходе ищем nodes которые можно сейчас unlock
                                -- (Parent == nil, либо Data.SkillTree[treeName][Parent] == true)
                                -- После каждой попытки ждём чтобы Replica обновилась
                                local maxPasses = 10  -- safety
                                for pass = 1, maxPasses do
                                    if not autoSkillEnabled then break end
                                    local data = getData()
                                    local unlocked = (data.SkillTree and data.SkillTree[treeName]) or {}

                                    local toUnlock = {}
                                    for nodeName, nodeCfg in pairs(tree.Upgrades) do
                                        if type(nodeCfg) == "table" and not unlocked[nodeName] then
                                            local parent = nodeCfg.Parent
                                            if parent == nil or unlocked[parent] == true then
                                                table.insert(toUnlock, nodeName)
                                            end
                                        end
                                    end

                                    if #toUnlock == 0 then break end  -- ничего больше не можем unlock

                                    for _, nodeName in ipairs(toUnlock) do
                                        if not autoSkillEnabled then break end
                                        fire("General", "SkillTree", "Unlock", treeName, nodeName)
                                        anyTreeProgressed = true
                                        task.wait(0.4)  -- даём Replica время обновиться
                                    end

                                    task.wait(0.3)  -- подождать перед следующим pass
                                end
                            end
                        end

                        -- Если ничего не unlock'нулось за весь tick — увеличиваем паузу (нет ресурсов)
                        task.wait(anyTreeProgressed and 5 or 15)
                    end
                end)
            else
                if autoSkillLoop then task.cancel(autoSkillLoop); autoSkillLoop = nil end
            end
        end
    }, "AutoSkillToggle")

    skillSection:Divider()
    skillSection:Header({ Text = "Auto Equip Best" })

    local equipBestStat = "Power"

    skillSection:Dropdown({
        Name = "Stat to Optimize For",
        Options = { "Power", "Damage", "Crystals", "Drops", "Luck", "Attack Speed" },
        Default = 1,
        Callback = function(val) equipBestStat = val end
    }, "EquipBestStatDropdown")

    local equipCategories = { "Swords", "Units", "Accessories", "Avatars", "Mounts", "Gacha" }
    local selectedEquipCats = {}

    skillSection:Dropdown({
        Name = "Categories (multi)",
        Multi = true,
        Options = equipCategories,
        Default = { "Swords", "Units", "Accessories", "Avatars", "Mounts", "Gacha" },
        Callback = function(val) selectedEquipCats = val end
    }, "EquipCategoriesDropdown")

    local autoEquipBestEnabled = false
    local autoEquipBestLoop = nil

    skillSection:Toggle({
        Name = "Auto Equip Best",
        Default = false,
        Callback = function(on)
            autoEquipBestEnabled = on
            if on then
                autoEquipBestLoop = task.spawn(function()
                    while autoEquipBestEnabled and not stopped do
                        for cat, sel in pairs(selectedEquipCats) do
                            if not autoEquipBestEnabled then break end
                            if sel == true and shouldFire("equip." .. cat, 5) then
                                fire("General", cat, "EquipBest", equipBestStat)
                                task.wait(0.2)
                            end
                        end
                        task.wait(30)
                    end
                end)
            else
                if autoEquipBestLoop then task.cancel(autoEquipBestLoop); autoEquipBestLoop = nil end
            end
        end
    }, "AutoEquipBestToggle")

    skillSection:Divider()
    skillSection:Header({ Text = "Auto Merchant" })

    local function getMerchantNames()
        local d = getData()
        if d.Merchant then
            local out = {}
            for k, _ in pairs(d.Merchant) do table.insert(out, k) end
            if #out > 0 then table.sort(out); return out end
        end
        return { "Dragon Merchant" }
    end

    local function getMerchantStock(merchantName)
        local d = getData()
        if d.Merchant and d.Merchant[merchantName] then
            local out = {}
            for k, _ in pairs(d.Merchant[merchantName]) do table.insert(out, k) end
            table.sort(out); return out
        end
        return {}
    end

    local selectedMerchant = "Dragon Merchant"
    local selectedMerchItems = {}
    local merchItemsDropdown = nil

    skillSection:Dropdown({
        Name = "Merchant",
        Options = getMerchantNames(),
        Default = 1,
        Callback = function(val)
            selectedMerchant = val
            local items = getMerchantStock(val)
            if merchItemsDropdown then
                pcall(function()
                    if merchItemsDropdown.ClearOptions then merchItemsDropdown:ClearOptions() end
                    task.wait(0.05)
                    merchItemsDropdown:InsertOptions(items)
                end)
            end
        end
    }, "MerchantDropdown")

    merchItemsDropdown = skillSection:Dropdown({
        Name = "Items (multi)",
        Multi = true,
        Options = getMerchantStock(selectedMerchant),
        Default = {},
        Callback = function(val) selectedMerchItems = val end
    }, "MerchantItemsDropdown")

    local autoMerchEnabled = false
    local autoMerchLoop = nil

    skillSection:Toggle({
        Name = "Auto-Buy on Restock",
        Default = false,
        Callback = function(on)
            autoMerchEnabled = on
            if on then
                autoMerchLoop = task.spawn(function()
                    while autoMerchEnabled and not stopped do
                        if ActivityPriority:CanStart("Merchant") then
                            ActivityPriority:SetActivity("Merchant")
                            for item, sel in pairs(selectedMerchItems) do
                                if not autoMerchEnabled then break end
                                if sel == true then
                                    local d = getData()
                                    local stock = (d.Merchant and d.Merchant[selectedMerchant]
                                                   and d.Merchant[selectedMerchant][item]
                                                   and d.Merchant[selectedMerchant][item].Stock) or 0
                                    if stock and stock > 0 then
                                        fire("General", "Merchant", "Buy", selectedMerchant, item, stock)
                                        task.wait(0.3)
                                    end
                                end
                            end
                            ActivityPriority:ClearActivity("Merchant")
                        end
                        task.wait(30)
                    end
                    ActivityPriority:ClearActivity("Merchant")
                end)
            else
                if autoMerchLoop then task.cancel(autoMerchLoop); autoMerchLoop = nil end
                ActivityPriority:ClearActivity("Merchant")
            end
        end
    }, "AutoMerchToggle")

    -- LEFT BELOW — Auto Potions
    local potionSection = tabs.Misc:Section({ Side = "Left" })
    potionSection:Header({ Text = "Auto Potions" })

    local potionList = (function()
        local list = Shared and Shared.Items and Shared.Items.Potion
        if list then
            local out = {}
            for k, _ in pairs(list) do table.insert(out, k) end
            table.sort(out); return out
        end
        return {
            "Power Potion I", "Power Potion II",
            "Damage Potion I", "Damage Potion II",
            "Crystals Potion I", "Crystals Potion II",
            "Luck Potion I", "Luck Potion II",
        }
    end)()

    local selectedAutoPotions = {}

    potionSection:Dropdown({
        Name = "Potions (multi)",
        Multi = true, Options = potionList, Default = {},
        Callback = function(val) selectedAutoPotions = val end
    }, "AutoPotionDropdown")

    local autoPotionEnabled = false
    local autoPotionLoop = nil

    potionSection:Toggle({
        Name = "Auto Use Selected Potions",
        Default = false,
        Callback = function(on)
            autoPotionEnabled = on
            if on then
                autoPotionLoop = task.spawn(function()
                    while autoPotionEnabled and not stopped do
                        local d = getData()
                        for potionName, sel in pairs(selectedAutoPotions) do
                            if not autoPotionEnabled then break end
                            if sel == true then
                                local active = d.UsedPotions and d.UsedPotions[potionName]
                                if not active then
                                    local count = (d.Inventory and d.Inventory.Potions
                                                   and d.Inventory.Potions[potionName]) or 0
                                    if count > 0 then
                                        fire("General", "Items", "UsePotion", potionName, 1)
                                        task.wait(0.3)
                                    end
                                end
                            end
                        end
                        task.wait(5)
                    end
                end)
            else
                if autoPotionLoop then task.cancel(autoPotionLoop); autoPotionLoop = nil end
            end
        end
    }, "AutoPotionToggle")
end

-- // ========================================== \\ --
-- //              WEBHOOK TAB                   \\ --
-- // ========================================== \\ --

if not ModulesLoaded then
    local s = tabs.Webhook:Section({ Side = "Left" })
    s:Label({ Text = "⚠ Requires Omni Framework" })
else
    local webhookCfgSection = tabs.Webhook:Section({ Side = "Left" })
    webhookCfgSection:Header({ Text = "Discord Webhook Logger" })

    local webhookUrl = ""
    local webhookDiscordId = ""
    local webhookEnabled = false

    local rarityColors = {
        Common    = 11382189,  Uncommon  = 5025616,   Rare      = 3447003,
        Epic      = 10181046,  Legendary = 16766720,  Mythical  = 15548997,
        Secret    = 16777215,  Limited   = 16753920,  Exclusive = 16711935,
    }

    local webhookRequest = http_request or request or (syn and syn.request) or (http and http.request)

    local function sendWebhook(itemName, category, rarity, extra)
        if webhookUrl == "" or not webhookRequest then return end
        local color = rarityColors[rarity] or 16777215

        local pingText = ""
        if webhookDiscordId ~= "" and rarity then
            local r = tostring(rarity):lower()
            if r:find("mythical") or r:find("secret") or r:find("limited") or r:find("exclusive") then
                pingText = "<@" .. webhookDiscordId .. ">"
            end
        end

        local fields = {
            { ["name"] = "Item",     ["value"] = tostring(itemName), ["inline"] = true },
            { ["name"] = "Category", ["value"] = tostring(category), ["inline"] = true },
            { ["name"] = "Rarity",   ["value"] = tostring(rarity),   ["inline"] = true },
            { ["name"] = "Player",   ["value"] = LocalPlayer.Name,   ["inline"] = true },
        }
        if extra then
            for k, v in pairs(extra) do
                table.insert(fields, { ["name"] = tostring(k), ["value"] = tostring(v), ["inline"] = true })
            end
        end

        pcall(function()
            webhookRequest({
                Url = webhookUrl,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = HttpService:JSONEncode({
                    ["content"] = pingText,
                    ["embeds"] = { {
                        ["title"]     = (rarity or "?") .. " — " .. (itemName or "?"),
                        ["color"]     = color,
                        ["fields"]    = fields,
                        ["footer"]    = { ["text"] = "Apel Hub • " .. GameName },
                        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                    } }
                })
            })
        end)
    end

    webhookCfgSection:Input({
        Name = "Webhook URL",
        Default = "",
        Placeholder = "https://discord.com/api/webhooks/...",
        Callback = function(val) webhookUrl = val end
    }, "WebhookUrlInput")

    webhookCfgSection:Input({
        Name = "Discord ID (for ping)",
        Default = "",
        Placeholder = "123456789012345678",
        Callback = function(val) webhookDiscordId = val end
    }, "WebhookDiscordIdInput")

    -- RIGHT — Filters + Toggle
    local webhookFiltSection = tabs.Webhook:Section({ Side = "Right" })
    webhookFiltSection:Header({ Text = "Filters" })

    local webhookSelectedRarities = {}
    local webhookSelectedCategories = {}

    webhookFiltSection:Dropdown({
        Name = "Rarities",
        Multi = true,
        Options = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythical", "Secret", "Limited", "Exclusive" },
        Default = { "Mythical", "Secret", "Legendary", "Limited", "Exclusive" },
        Callback = function(val) webhookSelectedRarities = val end
    }, "WebhookRaritiesDropdown")

    webhookFiltSection:Dropdown({
        Name = "Categories",
        Multi = true,
        Options = { "Units", "Swords", "Accessories", "Mounts", "Avatars" },
        Default = { "Units", "Swords" },
        Callback = function(val) webhookSelectedCategories = val end
    }, "WebhookCategoriesDropdown")

    -- Engine
    local function shouldLog(category, rarity)
        local catSelected = false
        for _, v in pairs(webhookSelectedCategories) do
            if v == true then catSelected = true; break end
        end
        if catSelected and webhookSelectedCategories[category] ~= true then return false end

        local raritySelected = false
        for _, v in pairs(webhookSelectedRarities) do
            if v == true then raritySelected = true; break end
        end
        if raritySelected and rarity and webhookSelectedRarities[rarity] ~= true then return false end
        return true
    end

    local function getRarityFromItem(category, name, item)
        if type(item) == "table" then
            if item.Rarity then return item.Rarity end
            if item.rarity then return item.rarity end
        end
        if Shared and Shared[category] then
            local cfg = Shared[category]
            if type(cfg) == "table" then
                if cfg[name] and type(cfg[name]) == "table" and cfg[name].Rarity then
                    return cfg[name].Rarity
                end
                for _, sub in pairs(cfg) do
                    if type(sub) == "table" and sub[name] and type(sub[name]) == "table" and sub[name].Rarity then
                        return sub[name].Rarity
                    end
                end
            end
        end
        return "Unknown"
    end

    local webhookSnapshot = {}
    local webhookListeners = {}

    local function snapshotInventory()
        webhookSnapshot = {}
        local d = getData()
        if not d or not d.Inventory then return end
        for cat, items in pairs(d.Inventory) do
            webhookSnapshot[cat] = {}
            if type(items) == "table" then
                for _, item in pairs(items) do
                    local name = type(item) == "table" and (item.Name or item.name or item.id) or item
                    if name then webhookSnapshot[cat][tostring(name)] = item end
                end
            end
        end
    end

    local function processNewItem(category, name, item)
        local rarity = getRarityFromItem(category, name, item)
        if not shouldLog(category, rarity) then return end
        local extra = {}
        if type(item) == "table" then
            if item.Level then extra["Level"] = item.Level end
            if item.Shiny ~= nil then extra["Shiny"] = item.Shiny and "✨ Yes" or "No" end
            if item.Stars then extra["Stars"] = item.Stars end
        end
        task.spawn(function() sendWebhook(name, category, rarity, extra) end)
    end

    local function startWebhookEngine()
        for _, conn in ipairs(webhookListeners) do pcall(function() conn:Disconnect() end) end
        webhookListeners = {}

        snapshotInventory()

        if not Omni.OnDataChanged then
            warn("[ApelHub] Omni:OnDataChanged not available")
            return false
        end

        for category, sel in pairs(webhookSelectedCategories) do
            if sel == true then
                local conn = Omni:OnDataChanged({ "Inventory", category }, function()
                    if not webhookEnabled then return end
                    local d = getData()
                    if not d.Inventory or not d.Inventory[category] then return end
                    local current = d.Inventory[category]
                    local snap = webhookSnapshot[category] or {}
                    for _, item in pairs(current) do
                        local name = type(item) == "table" and (item.Name or item.name or item.id) or item
                        if name and not snap[tostring(name)] then
                            snap[tostring(name)] = item
                            processNewItem(category, name, item)
                        end
                    end
                    webhookSnapshot[category] = snap
                end)
                if conn then table.insert(webhookListeners, conn) end
            end
        end
        return true
    end

    local function stopWebhookEngine()
        for _, conn in ipairs(webhookListeners) do pcall(function() conn:Disconnect() end) end
        webhookListeners = {}
    end

    webhookFiltSection:Toggle({
        Name = "Enable Webhook Logger",
        Default = false,
        Callback = function(on)
            webhookEnabled = on
            if on then
                if webhookUrl == "" then
                    task.spawn(function()
                        local timeout = tick() + 3
                        while webhookUrl == "" and tick() < timeout do task.wait(0.1) end
                        if webhookEnabled then
                            if webhookUrl == "" then
                                warn("[ApelHub] Webhook URL is empty")
                                webhookEnabled = false
                            else
                                startWebhookEngine()
                            end
                        end
                    end)
                else
                    startWebhookEngine()
                end
            else
                stopWebhookEngine()
            end
        end
    }, "WebhookEnableToggle")
end

-- // ========================================== \\ --
-- //                 SETTINGS                   \\ --
-- // ========================================== \\ --

sections.SettingsSection:Header({ Text = "UI" })

sections.SettingsSection:Slider({
    Name = "UI Size",
    Default = 0.85, Minimum = 0.5, Maximum = 2,
    DisplayMethod = "Value", Precision = 2,
    Callback = function(v) Window:SetScale(v) end
})

task.spawn(function()
    task.wait(0.1)
    pcall(function()
        Window:GlobalSetting({
            Name = "UI Blur",
            Default = Window:GetAcrylicBlurState(),
            Callback = function(b) Window:SetAcrylicBlurState(b) end,
        })
        Window:GlobalSetting({
            Name = "Notifications",
            Default = Window:GetNotificationsState(),
            Callback = function(b) Window:SetNotificationsState(b) end,
        })
    end)
end)

sections.SettingsSection:Button({
    Name = "Destroy GUI",
    Callback = function() pcall(getgenv()._WF_Stop) end
})

sections.InfoSection:Header({ Text = "Info" })
sections.InfoSection:Label({ Text = "Game: " .. GameName })
sections.InfoSection:Label({ Text = "Framework: Omni (BridgeNet wrapper)" })
sections.InfoSection:Label({ Text = "Hotkey: LeftCtrl" })

-- // ========================================== \\ --
-- //              CLEANUP / UNLOAD              \\ --
-- // ========================================== \\ --

getgenv()._WF_Stop = function()
    stopped = true
    -- Drop all global flags so loops exit
    getgenv().AutoFarm          = false
    getgenv().AutoQuest         = false
    getgenv()._FarmBusy         = false
    getgenv()._StarBusy         = false
    getgenv()._ZoneTpBusy       = false
    getgenv().AutoAchievements  = false
    getgenv().AutoTimeRewards   = false
    getgenv().AutoDailyRewards  = false
    getgenv().AutoFollowRewards = false
    getgenv().AutoDailyChest    = false
    getgenv().AutoGroupChest    = false
    getgenv().AutoVIPChest      = false

    -- Restore Star animation if it was hidden
    pcall(function()
        local sa = LocalPlayer.PlayerGui:FindFirstChild("StarAnimation")
        if sa then sa.Enabled = true end
    end)

    for _, c in ipairs(connections) do pcall(function() c:Disconnect() end) end
    table.clear(connections)
    pcall(function() Window:Unload() end)
end

-- // ========================================== \\ --
-- //              MINIMIZER + LOAD              \\ --
-- // ========================================== \\ --

task.spawn(function()
    task.wait(0.2)
    pcall(function()
        Window:CreateMinimizer({
            Size = UDim2.fromOffset(50, 50),
            Position = UDim2.new(1, -10, 0.5, 0),
            Icon = "rbxassetid://138310609771261"
        })
    end)
end)

MacLib:SetFolder("ApelHub")
MacLib:LoadAutoLoadConfig()

task.spawn(function()
    task.wait(0.5)
    print("[ApelHub] World Fighters loaded")
end)

task.spawn(function() tabs.Main:Select() end)
