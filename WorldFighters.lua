--[[
    World Fighters Hub — Auto Farm v0.37
    PlaceId: 95630541662383
    Framework: Omni (BridgeNet v1 + ReplicaService)
    UI: ApelHub MacLib fork

    Функционал:
      • Детект мобов в Workspace.Client.Enemies
      • Группировка одинаковых имён (Buggo x54 → одна запись "Buggo (54)")
      • Выбор цели в дропдауне
      • ТП к ближайшему живому мобу с этим именем
      • Attack/Click через Omni.Signal с уважением ClickCooldown
      • Автопереход к следующему мобу того же имени после смерти
      • Live-обновление списка при появлении/смерти мобов
--]]

-- =========================================================
-- [0] KILL PREVIOUS INSTANCE
-- =========================================================
if getgenv()._WF_Stop then
    pcall(getgenv()._WF_Stop)
    task.wait(0.3)
end

-- =========================================================
-- [1] SERVICES / PLAYER
-- =========================================================
local Players       = game:GetService("Players")
local RS            = game:GetService("ReplicatedStorage")
local Workspace     = game:GetService("Workspace")
local VirtualUser   = game:GetService("VirtualUser")
local HttpService   = game:GetService("HttpService")
local RunService    = game:GetService("RunService")

local LocalPlayer   = Players.LocalPlayer

-- =========================================================
-- [2] LOAD OMNI FRAMEWORK
-- =========================================================
local Omni do
    local ok, result = pcall(function()
        return require(RS:WaitForChild("Omni", 15))
    end)
    if not ok or not result then
        warn("[WF] Не удалось загрузить Omni:", result)
        return
    end
    Omni = result
end
Omni:WaitInitialization()

-- =========================================================
-- [3] GLOBAL STATE
-- =========================================================
getgenv().AutoFarm  = false
getgenv().Targets   = {}    -- set {[mobName] = true}, поддержка множественного выбора
getgenv().TpOffset  = Vector3.new(0, 4, 4)

local stopped       = false
local connections   = {}
local farmThread    = nil

-- =========================================================
-- [3b] DEBUG DUMP HELPER
-- =========================================================
-- Заменяет print(...) в debug-кнопках: собирает строки в буфер,
-- печатает в F9, копирует в буфер обмена, показывает Notify.
-- Использование: local d, buf = newDump(); d("line 1"); d("line 2"); flushDump(buf, "title")
local function newDump()
    local buf = {}
    local function push(s)
        if s == nil then s = "" end
        table.insert(buf, tostring(s))
    end
    return push, buf
end

local function flushDump(buf, label)
    local text = table.concat(buf, "\n")
    -- В F9 (для тех случаев когда буфер обмена не сработал)
    print(text)
    local clipOk = false
    pcall(function()
        if type(setclipboard) == "function" then
            setclipboard(text)
            clipOk = true
        elseif type(toclipboard) == "function" then
            toclipboard(text)
            clipOk = true
        end
    end)
    pcall(function()
        Window:Notify({
            Title       = label or "Debug",
            Description = clipOk
                and ("Скопировано в буфер (%d симв.)"):format(#text)
                or ("Clipboard недоступен — см. F9 (%d симв.)"):format(#text),
            Lifetime    = 4,
        })
    end)
end

-- =========================================================
-- [3c] ANTI-AFK BYPASS
-- =========================================================
-- Двухслойная защита от AFK-kick'а:
--
-- (1) Клиентская защита — LocalPlayer.Idled. Roblox сам шлёт Idled через 20 мин
--     бездействия, Rojo'нский Disconnect отключает всё или фолбэк через VirtualUser.
-- (2) Игровая анти-AFK (Omni.Scripts.Player.AntiAfk). Если включена настройка
--     Settings["Anti Afk"]==true — игра дёргает Reconnect на 900с idle (кик+тп).
--     Надёжнее выключить через General/Settings/Set + дисконнектить обработчики.

-- (1) Client-side Idled bypass. Делаем сразу, без toggle — оно безопасно.
coroutine.wrap(function()
    local getSigCons = getconnections or get_signal_cons
    if getSigCons then
        for _, v in pairs(getSigCons(LocalPlayer.Idled)) do
            if v.Disable      then pcall(v.Disable, v)
            elseif v.Disconnect then pcall(v.Disconnect, v) end
        end
    else
        local VU = (cloneref or function(x) return x end)(VirtualUser)
        LocalPlayer.Idled:Connect(function()
            pcall(function() VU:CaptureController() end)
            pcall(function() VU:ClickButton2(Vector2.new()) end)
        end)
    end
end)()

-- Периодически пингуем humanoid.Running — некоторые анти-AFK системы слушают это
do
    local _runThread
    local function startRunPing(character)
        if _runThread then pcall(task.cancel, _runThread); _runThread = nil end
        local hum = character:WaitForChild("Humanoid", 5)
        if not hum then return end
        _runThread = task.spawn(function()
            while hum and hum.Parent do
                task.wait(60)
                if hum and hum.Parent and getconnections then
                    for _, c in pairs(getconnections(hum.Running)) do
                        pcall(function() c:Fire(1) end)
                    end
                end
            end
        end)
    end
    if LocalPlayer.Character then startRunPing(LocalPlayer.Character) end
    LocalPlayer.CharacterAdded:Connect(startRunPing)
end

-- (2) Game-level Anti-AFK killer — вызывается из тоггла в Misc tab.
-- Глобальные fire/fireSelf shortcuts используются и webhook'ом и здесь.
local function fire(...)
    if Omni and Omni.Signal then
        pcall(function(...) Omni.Signal:Fire(...) end, ...)
    end
end
local function fireSelf(...)
    if Omni and Omni.Signal and Omni.Signal.FireSelf then
        pcall(function(...) Omni.Signal:FireSelf(...) end, ...)
    end
end

local function killGameAntiAfk()
    local d = Omni and Omni.Data
    -- Выключить настройку
    pcall(function()
        if d and d.Settings and d.Settings["Anti Afk"] == true then
            fire("General", "Settings", "Set", "Anti Afk", false)
        end
    end)
    -- Дисконнектим все обработчики Idled (включая игровые)
    pcall(function()
        local GC = getconnections or get_signal_cons
        if GC then
            for _, c in pairs(GC(LocalPlayer.Idled)) do
                if c.Disable      then pcall(c.Disable, c)
                elseif c.Disconnect then pcall(c.Disconnect, c) end
            end
        end
    end)
    -- Сбрасываем AntiAfk auto-resume (чтобы игра не открывала звёзды/гача сама)
    pcall(function()
        if d and d.AntiAfk then
            for _, field in ipairs({ "LastStar", "LastGacha", "LastBanner" }) do
                if d.AntiAfk[field] and d.AntiAfk[field] ~= "None" then
                    fire("Player", "AntiAfk", "SetValue", field, "None")
                end
            end
        end
    end)
end

-- =========================================================
-- [3d] ACTIVITY PRIORITY + THROTTLE
-- =========================================================
-- Централизованный координатор для тех фич которые требуют монопольного
-- использования персонажа (TP к звезде, crunching gamemode join), чтобы они не
-- перебивали друг друга. Приоритеты: чем выше число — тем важнее.
--
-- Старые мьютексы `_StarBusy` / `_ZoneTpBusy` остаются для legacy-кода —
-- этот слой предназначен для НОВЫХ фич (Banner, Roulette, Merchant, ...).
local ActivityPriority = {
    currentActivity = nil,
    activities = {
        Star     = 180,
        Banner   = 170,
        Roulette = 160,
        Gamemode = 100,
        Gacha    = 80,
        Merchant = 60,
        AutoFarm = 40,
    },
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

-- Throttle помощник: предотвращает спам одного и того же remote чаще чем
-- раз в N секунд. Используется автокодами, equip-best, banner spam protection.
local _lastFire = {}
local function shouldFire(key, minInterval)
    local t = _lastFire[key]
    if t and tick() - t < (minInterval or 1) then return false end
    _lastFire[key] = tick()
    return true
end

-- =========================================================
-- [4] ENEMY UTILS
-- =========================================================
-- Настоящие данные мобов лежат в:
--   workspace.Server.Enemies.World[Map][Zone]:GetChildren()
-- HP хранится в Attribute "Health" на Part (Client.Enemies — только визуалка).
local function getEnemiesFolder()
    local sv = Workspace:FindFirstChild("Server")              if not sv    then return nil end
    local en = sv:FindFirstChild("Enemies")                    if not en    then return nil end
    local world = en:FindFirstChild("World")                   if not world then return nil end

    local mapName  = (Omni.Data and Omni.Data.Map)  or "Fruits Verse"
    local zoneIdx  = (Omni.Data and Omni.Data.Zone) or 1

    local mapFolder = world:FindFirstChild(mapName)             if not mapFolder then return nil end
    return mapFolder:FindFirstChild(tostring(zoneIdx))
end

local function getHRP()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    return char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))
end

-- Устойчивый лукап HP/MaxHP: атрибут может называться Health/health/HP/hp
-- или как-нибудь типа currentHealth — делаем fuzzy fallback.
local function getMobHPValue(mob)
    if not mob then return nil end
    local ok, attrs = pcall(function() return mob:GetAttributes() end)
    if not ok or type(attrs) ~= "table" then return nil end
    for _, k in ipairs({ "Health", "health", "HP", "hp" }) do
        local v = attrs[k]
        if type(v) == "number" then return v end
    end
    -- fuzzy: любой числовой атрибут, где имя содержит health / hp, НО не max
    for k, v in pairs(attrs) do
        if type(v) == "number" then
            local lk = k:lower()
            if (lk:find("health") or lk:find("hp")) and not lk:find("max") then
                return v
            end
        end
    end
    return nil
end

local function getMobMaxHPValue(mob)
    if not mob then return nil end
    local ok, attrs = pcall(function() return mob:GetAttributes() end)
    if not ok or type(attrs) ~= "table" then return nil end
    for _, k in ipairs({ "MaxHealth", "maxHealth", "Max_Health", "max_health",
                        "HealthMax", "Health_Max", "MaxHP", "maxHP" }) do
        local v = attrs[k]
        if type(v) == "number" then return v end
    end
    for k, v in pairs(attrs) do
        if type(v) == "number" then
            local lk = k:lower()
            if lk:find("max") and (lk:find("health") or lk:find("hp")) then
                return v
            end
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
    local pos
    if mob:IsA("BasePart") then
        pos = mob.Position
    elseif mob.PrimaryPart then
        pos = mob.PrimaryPart.Position
    else
        local ok, piv = pcall(function() return mob:GetPivot().Position end)
        if ok and piv then
            pos = piv
        else
            for _, d in ipairs(mob:GetDescendants()) do
                if d:IsA("BasePart") then pos = d.Position; break end
            end
        end
    end
    -- StreamingEnabled: если моб далеко и не загружен, Position будет близко к (0,0,0).
    -- Возвращаем nil чтобы вызывающий код знал что ТП к нему делать нельзя (и перепроверил).
    if not pos or pos.Magnitude < 0.5 then return nil end
    return pos
end

local function getMobHP(mob)
    local hp  = getMobHPValue(mob)
    local mhp = getMobMaxHPValue(mob)
    if hp ~= nil then
        return math.floor(hp), (mhp and math.floor(mhp) or nil)
    end
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

-- =========================================================
-- [4b] ZONE ROUTING — когда выбранных мобов нет в текущей зоне
-- =========================================================

-- Разблокирована ли зона? Сначала через PlayerStats.HasMapZone, потом fallback'и.
local function isZoneUnlocked(mapName, zoneIdx)
    local ok, result = pcall(function()
        return Omni.Utils.PlayerStats.HasMapZone(Omni.Data, mapName, tonumber(zoneIdx))
    end)
    if ok and type(result) == "boolean" then return result end
    -- Fallback 1: стартовая зона всегда открыта
    if mapName == "Fruits Verse" and tonumber(zoneIdx) == 1 then return true end
    -- Fallback 2: если игрок там был — есть SavedPositions
    local saved = Omni.Data.SavedPositions and Omni.Data.SavedPositions["Map " .. mapName]
    if saved then return true end
    return false
end

-- Универсальный экстрактор имён мобов из конфига зоны.
-- Поддерживает три возможные структуры Omni.Shared.Enemies[map][zone]:
--   (A) массив строк:   {"Buggo", "Shanke", ...}
--   (B) массив таблиц:  {{Name="Buggo", ...}, {Name="Shanke", ...}}
--   (C) словарь:        {Buggo = {stats}, Shanke = {stats}, ...}
-- Возвращает set {[name]=true} найденных имён, чтобы вызывающий код мог делать O(1) проверки.
local function extractMobNames(list)
    local names = {}
    if type(list) ~= "table" then return names end
    for k, v in pairs(list) do
        -- (A) массив строк
        if type(v) == "string" then
            names[v] = true
        -- (B) таблица с .Name
        elseif type(v) == "table" then
            if type(v.Name) == "string" then
                names[v.Name] = true
            elseif type(v.ID) == "string" then
                names[v.ID] = true
            end
            -- (C) словарь — имя в ключе
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
    local shared = Omni.Shared and Omni.Shared.Enemies
    if type(shared) ~= "table" then return nil end

    local curMap  = Omni.Data and Omni.Data.Map
    local curZone = tonumber(Omni.Data and Omni.Data.Zone or 0)

    local best = nil
    for mapName, zones in pairs(shared) do
        if type(zones) == "table" then
            for zoneKey, list in pairs(zones) do
                local zoneIdx = tonumber(zoneKey) or zoneKey
                if type(list) == "table" and isZoneUnlocked(mapName, zoneIdx) then
                    -- Универсальное извлечение: {string[]} / {{.Name}} / {key=val}
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
        Omni.Signal:Fire("Player", "Teleport", "Teleport", mapName, zoneIdx)
    end)
    local deadline = tick() + 8
    while tick() < deadline and not stopped do
        local curMap  = Omni.Data.Map
        local curZone = tonumber(Omni.Data.Zone or 0)
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
    local hasLive  = false   -- есть вообще живые выбранного типа
    local hasReady = false   -- есть живые с валидной позицией
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
-- Это серверная правда — говорит "в этой зоне вообще должны быть такие мобы", независимо
-- от того прогружены они сейчас в workspace или нет.
local function anyTargetInZoneConfig(targets, mapName, zoneIdx)
    local shared = Omni.Shared and Omni.Shared.Enemies
    if type(shared) ~= "table" then return false end
    local zones = shared[mapName]
    if type(zones) ~= "table" then return false end
    local list = zones[tonumber(zoneIdx)] or zones[tostring(zoneIdx)]
    if type(list) ~= "table" then return false end
    local zoneMobs = extractMobNames(list)
    for name in pairs(targets) do
        if zoneMobs[name] then return true end
    end
    return false
end

-- Streaming trick: если в текущей зоне НЕ видно наших мобов, но конфиг говорит что они тут есть —
-- значит они спавнятся на другом краю карты и не стримятся. Телепортируемся к самому дальнему
-- видимому мобу (даже не нашего типа) — это заставит StreamingEnabled прогрузить соседей.
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

-- Где вообще может находиться моб с данным именем (все map/zone из Shared.Enemies).
-- Возвращает массив {mapName, zoneIdx, unlocked}. Нужно для статуса (показать юзеру "локально / в FV2 / locked").
local function findMobLocations(mobName)
    local result = {}
    local shared = Omni.Shared and Omni.Shared.Enemies
    if type(shared) ~= "table" then return result end
    for mapName, zones in pairs(shared) do
        if type(zones) == "table" then
            for zoneKey, list in pairs(zones) do
                if type(list) == "table" then
                    local names = extractMobNames(list)
                    if names[mobName] then
                        local zIdx = tonumber(zoneKey) or zoneKey
                        table.insert(result, {
                            mapName  = mapName,
                            zoneIdx  = zIdx,
                            unlocked = isZoneUnlocked(mapName, zIdx),
                        })
                    end
                end
            end
        end
    end
    return result
end


-- Источник: только мобы ТЕКУЩЕЙ зоны (чтобы легче искать в дропдауне).
-- Сортировка по HP (слабые сверху). Для мобов из других зон — используй Auto Quest
-- (он сам находит нужную зону и фармит).
local function buildOptions()
    local groups = groupMobs()
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

-- =========================================================
-- [5] TELEPORT + ATTACK
-- =========================================================
local function teleportTo(mob)
    local hrp = getHRP()
    if not hrp then return false end
    local pos = getMobPos(mob)
    if not pos then return false end
    hrp.CFrame = CFrame.new(pos + getgenv().TpOffset)
    return true
end

local function attackOnce()
    local ids = Omni.Cache:Get({ "EnemiesOnRangeIds" }) or {}
    Omni.Signal:Fire("General", "Attack", "Click", ids)
end

local function getClickCooldown()
    local cd = 0.3
    pcall(function()
        local v = Omni.Utils.PlayerStats.ClickCooldown(Omni.Data, Omni.Instance)
        if type(v) == "number" and v > 0 then cd = v end
    end)
    return math.max(cd, 0.05)
end

-- =========================================================
-- [6] FARM LOOP
-- =========================================================
local function farmLoop()
    while getgenv().AutoFarm and not stopped do
        -- Уважаем star-open / zone-tp: ждём пока операция не завершится
        while (getgenv()._StarBusy or getgenv()._ZoneTpBusy) and getgenv().AutoFarm and not stopped do
            task.wait(0.1)
        end

        local targetSet = getgenv().Targets
        if not targetSet or next(targetSet) == nil then
            task.wait(0.3)
        else
            local curMap  = Omni.Data and Omni.Data.Map
            local curZone = tonumber(Omni.Data and Omni.Data.Zone or 1) or 1

            -- [1] Есть ли рядом (streamed) готовые к атаке мобы выбранных типов?
            local hasReady, hasLive = hasReadyTargetsInCurrentZone(targetSet)

            if hasReady then
                -- ==== ФАРМИМ ====
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
                    -- Сортировка по HP (слабейший первый)
                    table.sort(candidates, function(a, b)
                        local ha = getMobHPValue(a) or math.huge
                        local hb = getMobHPValue(b) or math.huge
                        return ha < hb
                    end)

                    local hrp = getHRP()
                    local mob = candidates[1]
                    if mob and isAlive(mob) then
                        teleportTo(mob)
                        task.wait(0.08)

                        local cd        = getClickCooldown()
                        local startTime = tick()
                        local mobName   = mob.Name

                        while getgenv().AutoFarm
                            and not stopped
                            and not getgenv()._StarBusy
                            and not getgenv()._ZoneTpBusy
                            and getgenv().Targets
                            and getgenv().Targets[mobName]
                            and isAlive(mob)
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
                    end
                end
            elseif hasLive then
                -- [2] Наши мобы есть в папке но не стримятся. Streaming trick:
                -- TP к самому дальнему видимому мобу — это подтянет наших.
                local ok = tpToFurthestVisibleMob()
                if not ok then
                    -- Вообще ничего не видно → полный re-stream через Teleport в ту же зону
                    getgenv()._ZoneTpBusy = true
                    pcall(function()
                        Omni.Signal:Fire("Player", "Teleport", "Teleport", curMap, curZone)
                    end)
                    task.wait(1.0)
                    getgenv()._ZoneTpBusy = false
                else
                    task.wait(0.6) -- дать streaming'у прогрузить новую окрестность
                end
            else
                -- [3] В папке нет наших мобов вообще. Есть два подслучая:
                --  (a) конфиг говорит "в этой зоне они должны быть" → ждём respawn (или streaming)
                --  (b) эта зона не для них → ищем другую разблокированную зону и TP туда
                if anyTargetInZoneConfig(targetSet, curMap, curZone) then
                    -- Ждём respawn, заодно пробуем streaming trick (вдруг только что умерли и скоро спавн)
                    local tpOk = tpToFurthestVisibleMob()
                    task.wait(tpOk and 0.6 or 1.5)
                else
                    local best = findBestZoneForTargets(targetSet)
                    if best and (best.mapName ~= curMap or best.zoneIdx ~= curZone) then
                        getgenv()._ZoneTpBusy = true
                        teleportToZone(best.mapName, best.zoneIdx)
                        getgenv()._ZoneTpBusy = false
                    else
                        -- Ни одна зона с нашими мобами не разблокирована. Ждём дольше,
                        -- статус покажет юзеру что проблема.
                        task.wait(3)
                    end
                end
            end
        end
    end
    farmThread = nil
end

local function startFarm()
    if farmThread then return end
    farmThread = task.spawn(farmLoop)
end

-- =========================================================
-- [6b] AUTO-CLAIM (Achievements / Rewards / Chests)
-- =========================================================
-- Anti-spam: минимальный интервал между однотипными вызовами.
local _lastFire = {}
local function shouldFire(key, minInterval)
    local t = _lastFire[key]
    if t and tick() - t < (minInterval or 1) then return false end
    _lastFire[key] = tick()
    return true
end

-- Cooldown'ы сундуков (в секундах)
local CHEST_CD = {
    ["Daily Chest"] = 24 * 3600,
    ["Group Chest"] = 12 * 3600,
    ["VIP Chest"]   =  4 * 3600,
}

-- Кэш позиций сундуков (ищем один раз)
local _chestPos = {}
local function getChestPos(chestName)
    if _chestPos[chestName] ~= nil then return _chestPos[chestName] end
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

-- Узнаёт timestamp последнего клейма сундука из Omni.Data (структура нам точно неизвестна,
-- поэтому пробуем несколько типовых форматов).
local function getChestLastClaim(chestName)
    local d = Omni.Data and Omni.Data.Chests and Omni.Data.Chests[chestName]
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
    -- ограничение частоты ретраев (если cooldown неправильно определён)
    if not shouldFire("chest." .. chestName, 60) then return false end

    local hrp = getHRP()
    if not hrp then return false end
    local savedCF = hrp.CFrame
    local pos     = getChestPos(chestName)

    if pos then
        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 4, 0))
        task.wait(0.2)
    end
    pcall(function()
        Omni.Signal:Fire("General", "Chests", "Claim", chestName)
    end)
    task.wait(0.3)
    if pos then
        hrp.CFrame = savedCF  -- возвращаемся (если фарм активен — он ТП к мобу сам)
    end
    return true
end

local function tryAchievementsClaimAll()
    if not shouldFire("ach.claimall", 5) then return end
    pcall(function()
        Omni.Signal:Fire("General", "Achievements", "ClaimAll")
    end)
end

local function tryTimeRewards()
    local data   = Omni.Data and Omni.Data.TimeRewards
    local shared = Omni.Shared and Omni.Shared.TimeRewards
    if not data or not shared then return end
    local tp       = data.TimePlayed or 0
    local claimed  = data.Claimed or {}
    for idx, entry in pairs(shared) do
        if type(idx) == "number" and type(entry) == "table" and entry.Time then
            if tp >= entry.Time and not claimed[idx] then
                if shouldFire("time." .. idx, 2) then
                    pcall(function()
                        Omni.Signal:Fire("General", "TimeRewards", "Claim", idx)
                    end)
                end
            end
        end
    end
end

local function tryDailyRewards()
    local data   = Omni.Data and Omni.Data.DailyRewards
    local shared = Omni.Shared and Omni.Shared.DailyRewards
    if not data or not shared then return end
    local start   = data.Start or 0
    local claimed = data.Claimed or {}
    local days    = math.floor((tick() - start) / 86400) + 1
    for idx = 1, 7 do
        if shared[idx] and not claimed[idx] and idx <= days then
            if shouldFire("daily." .. idx, 2) then
                pcall(function()
                    Omni.Signal:Fire("General", "DailyRewards", "Claim", idx)
                end)
            end
        end
    end
end

local function tryFollowRewards()
    if not shouldFire("follow.verify", 300) then return end  -- раз в 5 мин
    pcall(function()
        Omni.Signal:Fire("General", "FollowRewards", "Verify")
    end)
end

-- Главный цикл авто-клейма (один на всё — меньше тредов, проще останов)
local rewardsThread
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

-- Инициализация глобалов
getgenv().AutoAchievements  = getgenv().AutoAchievements  or false
getgenv().AutoTimeRewards   = getgenv().AutoTimeRewards   or false
getgenv().AutoDailyRewards  = getgenv().AutoDailyRewards  or false
getgenv().AutoFollowRewards = getgenv().AutoFollowRewards or false
getgenv().AutoDailyChest    = getgenv().AutoDailyChest    or false
getgenv().AutoGroupChest    = getgenv().AutoGroupChest    or false
getgenv().AutoVIPChest      = getgenv().AutoVIPChest      or false

-- =========================================================
-- [6c] EGGS / STARS — открытие звёзд (яиц)
-- =========================================================
local CollectionService = game:GetService("CollectionService")

-- Список всех доступных звёзд из Omni.Shared.Stars
local function getAllStars()
    local result = {}
    local shared = Omni.Shared and Omni.Shared.Stars
    if type(shared) ~= "table" then return result end
    for name, cfg in pairs(shared) do
        if type(name) == "string" and type(cfg) == "table" and cfg.Price then
            table.insert(result, name)
        end
    end
    table.sort(result)
    return result
end

local function getStarCfg(starName)
    local s = Omni.Shared and Omni.Shared.Stars
    return s and s[starName]
end

-- Получить текущий баланс игрока для пары (Type, Name)
local function getBalance(priceType, priceName)
    if priceType == "Currency" then
        return Omni.Data[priceName] or 0
    elseif priceType == "Item" then
        local items = Omni.Data.Inventory and Omni.Data.Inventory.Items or {}
        return items[priceName] or 0
    end
    return 0
end

local function canAffordStar(starName, amount)
    local cfg = getStarCfg(starName)
    if not cfg or not cfg.Price then return false, 0, 0 end
    amount = amount or 1
    local have = getBalance(cfg.Price.Type, cfg.Price.Name)
    local need = (cfg.Price.Amount or 0) * amount
    return have >= need, have, need
end

-- Максимальное число открытий за раз (зависит от gamepass Multi Open)
local function getMaxStarOpen()
    local v
    local ok = pcall(function()
        v = Omni.Utils.PlayerStats.MaxStarOpen(Omni.Data, Omni.Instance)
    end)
    if ok and type(v) == "number" and v >= 1 then
        return math.floor(v)
    end
    return 1
end

-- Тайминги репликации (критично для серверной проверки дистанции до звезды):
-- TP_SETTLE — время, нужное чтобы позиция HRP реплицировалась на сервер после TP.
-- FIRE_SETTLE — время, нужное серверу чтобы обработать Fire до того как мы ТП'немся обратно.
-- Роблокс реплицирует клиентскую позицию ~30-60Hz, сервер обрабатывает Fire через несколько frame'ов.
-- Ниже 0.15с сервер начинает терять запросы (открывает "через раз").
local STAR_TP_SETTLE   = 0.2
local STAR_FIRE_SETTLE = 0.2
local STAR_BATCH_GAP   = 0.1  -- между Fire разных звёзд в одном batch (для rate-limit защиты)

-- Поиск модели звезды в мире
local function findStarModel(starName)
    -- Через CollectionService
    for _, m in ipairs(CollectionService:GetTagged("StarModel")) do
        if m.Name == starName then return m end
    end
    -- Fallback: Workspace.Client.Stars.*.<starName>
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

-- "Remote Star" gamepass позволяет открывать без ТП
local function hasRemoteStarPass()
    local gp = Omni.Data and Omni.Data.Gamepasses or {}
    return gp["Remote Star"] == true
end

-- Чистое открытие звезды (БЕЗ ТП — координацию делает вызывающий код).
local function fireStarOpen(starName, amount)
    amount = amount or 1
    pcall(function()
        Omni.Signal:Fire("General", "Stars", "Open", starName, amount)
    end)
end

-- ТП к модели звезды (если доступна и далеко)
local function tpNearStar(starName)
    local model = findStarModel(starName)
    local hrp   = getHRP()
    if not model or not hrp then return false end
    local pos
    if model:IsA("BasePart") then
        pos = model.Position
    else
        pcall(function() pos = model:GetPivot().Position end)
    end
    if not pos then return false end
    if (pos - hrp.Position).Magnitude > 8 then
        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 4, 0))
        return true   -- ТП'нулись
    end
    return false      -- уже рядом, ТП не было
end

-- Совместимый публичный враппер (используется кнопками "Open Now" в UI)
local function openStarOnce(starName, amount)
    if not hasRemoteStarPass() then
        local tpHappened = tpNearStar(starName)
        if tpHappened then
            task.wait(STAR_TP_SETTLE)   -- ждём репликацию позиции на сервер
        end
    end
    fireStarOpen(starName, amount)
    return true
end

-- Подсчитать оптимальный amount с учётом баланса (<= maxOpen и <= affordable)
local function computeStarAmount(starName)
    local max = getMaxStarOpen()
    for try = max, 1, -1 do
        if canAffordStar(starName, try) then
            return try
        end
    end
    return 0
end

-- Авто-цикл открытия звёзд — координируется с Farm через _StarBusy
local starThread
local function startStarLoop()
    if starThread then return end
    starThread = task.spawn(function()
        while getgenv().AutoOpenStar and not stopped do
            -- Уважаем zone-tp farm'а: не вмешиваемся пока он телепортирует между зонами
            while getgenv()._ZoneTpBusy and getgenv().AutoOpenStar and not stopped do
                task.wait(0.15)
            end

            local targets = getgenv().StarTargets or {}
            if next(targets) == nil then
                task.wait(1)
            else
                -- Есть ли хотя бы одна звезда, которую можем открыть сейчас?
                local anyAffordable = false
                for name in pairs(targets) do
                    if computeStarAmount(name) >= 1 then
                        anyAffordable = true
                        break
                    end
                end

                if not anyAffordable then
                    -- Нечего открывать — ждём пока накопится (farm продолжает работать)
                    task.wait(5)
                else
                    local remote = hasRemoteStarPass()

                    -- === Remote Star: ТП не нужен, работаем параллельно farm'у ===
                    if remote then
                        for starName in pairs(targets) do
                            if not (getgenv().AutoOpenStar and not stopped) then break end
                            local amt = computeStarAmount(starName)
                            if amt >= 1 and shouldFire("star." .. starName, 0.5) then
                                fireStarOpen(starName, amt)
                                task.wait(STAR_BATCH_GAP)
                            end
                        end
                    else
                    -- === Без Remote Star: захватываем HRP, ждём репликацию позиции ===
                        local hrp       = getHRP()
                        local savedCF   = hrp and hrp.CFrame
                        local farmActive = getgenv().AutoFarm == true

                        getgenv()._StarBusy = true
                        task.wait(0.1)  -- farm должен успеть выйти из attack-loop

                        for starName in pairs(targets) do
                            if not (getgenv().AutoOpenStar and not stopped) then break end
                            local amt = computeStarAmount(starName)
                            if amt >= 1 and shouldFire("star." .. starName, 0.5) then
                                local tpHappened = tpNearStar(starName)
                                -- После ТП ждём пока сервер увидит новую позицию (критично для
                                -- серверной проверки "игрок у звезды", иначе Fire отклоняется).
                                if tpHappened then
                                    task.wait(STAR_TP_SETTLE)
                                end
                                fireStarOpen(starName, amt)
                                -- Ждём пока сервер обработает Fire, ДО того как клиент
                                -- отрепортит новую (возвращённую) позицию у моба.
                                task.wait(STAR_FIRE_SETTLE)
                            end
                        end

                        -- Возвращаем позицию к мобу (анимация открытия играет в фоне).
                        if farmActive and savedCF then
                            local hrp2 = getHRP()
                            if hrp2 then hrp2.CFrame = savedCF end
                        end

                        getgenv()._StarBusy = false
                    end

                    -- Пауза до следующей проверки
                    -- Remote: часто (2с), shared HRP: длиннее (чтобы farm успел нафармить валюту)
                    task.wait(remote and 2 or 8)
                end
            end
        end
        -- На выходе гарантированно сбрасываем флаг
        getgenv()._StarBusy = false
        starThread = nil
    end)
end

getgenv().AutoOpenStar  = getgenv().AutoOpenStar or false
getgenv().StarTargets   = getgenv().StarTargets or {}  -- set {[starName] = true}
getgenv()._StarBusy     = false
getgenv()._ZoneTpBusy   = false

-- =========================================================
-- [6d] QUESTS — авто-прохождение миссий
-- =========================================================
-- Структура данных (из анализа):
--   Omni.Shared.Quests.List[questName]              -- конфиг квеста
--     .Missions[idx]                                -- конфиг миссии (таблица с 4 полями)
--     .MapName / .ZoneIndex                         -- где этот квест делается
--     .AutoCollect (bool)
--   Omni.Data.Quests.List[questName].Missions[idx]  -- число текущего прогресса миссии
--   Omni.Data.Quests.Pinned                         -- имя закреплённого квеста
--
-- Точные имена полей внутри Missions[idx] сканер не дампил (глубина=2). Эвристически
-- ищем mob name (Target/Name/Mob/Enemy...) и required count (Amount/Count/Required/Goal/Times).
-- Если структура экзотична — кнопка "Debug Quest Data" в UI дампит всё в консоль.

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
    local s = Omni.Shared and Omni.Shared.Quests and Omni.Shared.Quests.List
    return s and s[questName]
end

-- Пытается найти данные конкретного квеста в Omni.Data, пробуя несколько типовых путей.
-- Возможные структуры:
--   Omni.Data.Quests.List[questName]           (мой старый домысел)
--   Omni.Data.Quests[questName]                (прямой ключ)
--   Omni.Data.Quests.Active[questName]
--   Omni.Data.Quests.Progress[questName]
--   Omni.Data.Quests.Missions[questName]
local function getQuestData(questName)
    local q = Omni.Data and Omni.Data.Quests
    if not q then return nil end
    if q.List     and q.List[questName]     then return q.List[questName]     end
    if q.Active   and q.Active[questName]   then return q.Active[questName]   end
    if q.Progress and q.Progress[questName] then return q.Progress[questName] end
    if q.Missions and q.Missions[questName] then return q.Missions[questName] end
    if rawget(q, questName) ~= nil          then return rawget(q, questName)  end
    return nil
end

-- ReplicaService и похожие часто сериализуют числовые ключи в строки при репликации.
-- Поэтому прогресс может лежать под ключом "1" а не 1. Эта функция пробует оба варианта.
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

-- Универсальное чтение прогресса миссии. Передаём index И имя моба (target) —
-- некоторые игры хранят прогресс по имени, некоторые по индексу. Плюс проверяем
-- что ключ может быть числом ИЛИ строкой (ReplicaService-сериализация).
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

    -- (A) d.Missions[idx] — число или таблица (idx число ИЛИ строка)
    if type(d) == "table" and type(d.Missions) == "table" then
        local p = tblGetAny(d.Missions, idx)
        local unwrapped = unwrap(p)
        if unwrapped then return unwrapped end
        -- (B) d.Missions[targetName]
        if targetName then
            p = d.Missions[targetName]
            unwrapped = unwrap(p)
            if unwrapped then return unwrapped end
        end
    end

    -- (C) d[idx] или d[targetName]
    if type(d) == "table" then
        local direct = tblGetAny(d, idx)
        if type(direct) == "number" then return direct end
        if targetName and type(d[targetName]) == "number" then return d[targetName] end
        -- (D) d.Progress[idx|targetName]
        if type(d.Progress) == "table" then
            local p = tblGetAny(d.Progress, idx)
            if type(p) == "number" then return p end
            if targetName and type(d.Progress[targetName]) == "number" then return d.Progress[targetName] end
        end
    end

    -- (E) d это сразу число (прогресс всей квест-линии — одна цифра)
    if type(d) == "number" then return d end

    return 0
end

-- Возвращает {name, required, progress, missionIdx} первой активной (незавершённой) миссии
-- или nil если квест полностью пройден / не имеет корректно распознанных миссий.
local function getActiveMission(questName)
    local cfg = getQuestCfg(questName)
    if not cfg or not cfg.Missions then return nil end
    -- Собираем индексы и идём по возрастанию (миссии могут быть не ipairs-совместимы)
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

-- Список всех квестов
local function getAllQuests()
    local out = {}
    local src = Omni.Shared and Omni.Shared.Quests and Omni.Shared.Quests.List
    if type(src) == "table" then
        for k in pairs(src) do
            if type(k) == "string" then table.insert(out, k) end
        end
    end
    table.sort(out)
    return out
end

-- Проверяем, в правильной ли зоне игрок для конкретного квеста
local function isInQuestZone(questName)
    local cfg = getQuestCfg(questName)
    if not cfg then return true end
    local curMap = Omni.Data and Omni.Data.Map
    local curZone = Omni.Data and Omni.Data.Zone
    local wantMap = cfg.MapName
    local wantZone = cfg.ZoneIndex
    if not wantMap then return true end
    if curMap ~= wantMap then return false end
    if wantZone and curZone ~= wantZone then return false end
    return true
end

local function tpToQuestZone(questName)
    local cfg = getQuestCfg(questName)
    if not cfg or not cfg.MapName then return false end
    if not shouldFire("quest.tp." .. questName, 3) then return false end
    pcall(function()
        Omni.Signal:Fire("Player", "Teleport", "Teleport", cfg.MapName, cfg.ZoneIndex or 1)
    end)
    return true
end

local function pinQuest(questName)
    if Omni.Data and Omni.Data.Quests and Omni.Data.Quests.Pinned == questName then return end
    if not shouldFire("quest.pin." .. questName, 5) then return end
    pcall(function()
        Omni.Signal:Fire("General", "Quests", "Pin", questName)
    end)
end

-- Главный цикл авто-квестов.
-- СТОЯТ САМОСТОЯТЕЛЬНО: дублирует логику farmLoop, не зависит от getgenv().AutoFarm.
-- Одновременно с основным Farm работать может — будет гонка за HRP, но у них одинаковая
-- логика и та же цель (или похожая), конфликт минимальный.
local questThread
local function startQuestLoop()
    if questThread then return end
    questThread = task.spawn(function()
        while getgenv().AutoQuest and not stopped do
            -- Уважаем star-open / zone-tp (тот же мьютекс что и у Farm)
            while (getgenv()._StarBusy or getgenv()._ZoneTpBusy)
                and getgenv().AutoQuest and not stopped
            do
                task.wait(0.1)
            end

            -- [1] Находим активный квест и миссию
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
                -- Нет активных миссий — ждём и пробуем снова
                task.wait(3)
            else
                -- Авто-пин
                if getgenv().AutoPinQuest then pinQuest(activeQuestName) end

                -- Синхронизируем глобальную Targets (для отображения в статусе Farm-таба)
                getgenv().Targets = { [activeMission.name] = true }

                -- ТП в зону квеста если включено
                if getgenv().AutoTpToQuestZone and not isInQuestZone(activeQuestName) then
                    getgenv()._ZoneTpBusy = true
                    tpToQuestZone(activeQuestName)
                    task.wait(1.5)
                    getgenv()._ZoneTpBusy = false
                end

                -- [2] ФАРМ ЛОГИКА (копия farmLoop) — для одного моба-цели
                local targetSet = { [activeMission.name] = true }
                local curMap    = Omni.Data and Omni.Data.Map
                local curZone   = tonumber(Omni.Data and Omni.Data.Zone or 1) or 1

                local hasReady, hasLive = hasReadyTargetsInCurrentZone(targetSet)

                if hasReady then
                    -- Собираем валидных кандидатов и бьём
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
                            teleportTo(mob)
                            task.wait(0.08)

                            local cd        = getClickCooldown()
                            local startTime = tick()
                            local mobName   = mob.Name

                            while getgenv().AutoQuest
                                and not stopped
                                and not getgenv()._StarBusy
                                and not getgenv()._ZoneTpBusy
                                and targetSet[mobName]
                                and isAlive(mob)
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
                        end
                    end
                elseif hasLive then
                    -- Streaming trick — TP к самому дальнему видимому мобу
                    local ok = tpToFurthestVisibleMob()
                    if not ok then
                        getgenv()._ZoneTpBusy = true
                        pcall(function()
                            Omni.Signal:Fire("Player", "Teleport", "Teleport", curMap, curZone)
                        end)
                        task.wait(1.0)
                        getgenv()._ZoneTpBusy = false
                    else
                        task.wait(0.6)
                    end
                else
                    -- Нет моба в текущей зоне — ищем где он есть
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
                            -- Моб не найден ни в одной разблокированной зоне.
                            -- Либо имя не совпадает с конфигом, либо все зоны locked.
                            task.wait(3)
                        end
                    end
                end
            end
        end
        questThread = nil
    end)
end

getgenv().AutoQuest         = getgenv().AutoQuest         or false
getgenv().AutoPinQuest      = getgenv().AutoPinQuest      or true
getgenv().AutoTpToQuestZone = getgenv().AutoTpToQuestZone or true
getgenv().QuestSelections   = getgenv().QuestSelections   or {}



-- =========================================================
-- [7] UI — ApelHub MacLib fork
-- =========================================================
local MacLib
do
    local ok, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/dvorfkar6-lab/uis/refs/heads/main/Mac"))()
    end)
    if not ok or not result then
        warn("[WF] Не удалось загрузить MacLib:", result)
        return
    end
    MacLib = result
end

-- Window
local Window = MacLib:Window({
    Title                  = "World Fighters Hub",
    Subtitle               = "v0.37",
    Size                   = UDim2.fromOffset(865, 650),
    DragStyle              = 2,                           -- free-form drag
    DisabledWindowControls = {},
    ShowUserInfo           = false,
    Keybind                = Enum.KeyCode.LeftControl,     -- toggle UI
    AcrylicBlur            = false,
})

-- Порядок: Window → TabGroup → Tab → Section → элементы
local MainTabGroup = Window:TabGroup()
local FarmTab      = MainTabGroup:Tab({ Name = "Farm" })
local MainSection  = FarmTab:Section({ Side = "Left"  })
local InfoSection  = FarmTab:Section({ Side = "Right" })

-- === Left: controls ===
MainSection:Toggle({
    Name     = "Auto Farm",
    Default  = false,
    Callback = function(state)
        getgenv().AutoFarm = state
        if state then startFarm() end
    end,
}, "AutoFarmToggle")

local mobDropdown = MainSection:Dropdown({
    Name     = "Target Mobs",
    Multi    = true,
    Required = false,
    Options  = buildOptions(),
    Callback = function(values)
        -- ВАЖНО: в Multi-режиме этого форка MacLib отдаёт set {[name] = true},
        -- имена мобов — это КЛЮЧИ, а значения всегда true.
        local set = {}
        if type(values) == "table" then
            for k, v in pairs(values) do
                if v and type(k) == "string" then
                    set[k] = true
                end
            end
        elseif type(values) == "string" and values ~= "" then
            set[values] = true
        end
        getgenv().Targets = set
    end,
})

local function refreshDropdown()
    if not mobDropdown then return end
    local opts = buildOptions()
    pcall(function()
        mobDropdown:ClearOptions()
        mobDropdown:InsertOptions(opts)
    end)
end

MainSection:Button({
    Name     = "Refresh Mobs",
    Callback = refreshDropdown,
})

MainSection:Button({
    Name     = "Debug: Dump Zone→Mobs",
    Callback = function()
        local d, buf = newDump()
        local shared = Omni.Shared and Omni.Shared.Enemies
        if type(shared) ~= "table" then
            d("[WF-Debug] Omni.Shared.Enemies not available")
            flushDump(buf, "Farm Debug")
            return
        end
        d("=========== [WF-Debug] Omni.Shared.Enemies ===========")
        for mapName, zones in pairs(shared) do
            d(("[Map] %s"):format(mapName))
            if type(zones) == "table" then
                for zoneKey, list in pairs(zones) do
                    local unlocked = isZoneUnlocked(mapName, zoneKey)
                    d(("  [Zone %s]  unlocked=%s  list type=%s")
                        :format(tostring(zoneKey), tostring(unlocked), typeof(list)))
                    if type(list) == "table" then
                        for k, v in pairs(list) do
                            if type(v) == "table" then
                                d(("    %s → table: Name=%s, ID=%s")
                                    :format(tostring(k), tostring(v.Name), tostring(v.ID)))
                            else
                                d(("    %s → %s"):format(tostring(k), tostring(v)))
                            end
                        end
                        local names = extractMobNames(list)
                        local arr = {}
                        for n in pairs(names) do table.insert(arr, n) end
                        table.sort(arr)
                        d(("    extracted names [%d]: %s"):format(#arr, table.concat(arr, ", ")))
                    end
                end
            end
        end
        d("======================================================")
        d(("Current: Map=%s, Zone=%s"):format(tostring(Omni.Data.Map), tostring(Omni.Data.Zone)))
        flushDump(buf, "Farm Debug")
    end,
})

MainSection:Button({
    Name     = "Unload Script",
    Callback = function()
        pcall(getgenv()._WF_Stop)
    end,
})

-- === Right: status ===
local statusPara = InfoSection:Paragraph({
    Header = "Status",
    Body   = "Idle",
})

local playerInfoPara = InfoSection:Paragraph({
    Header = "Player Info",
    Body   = "loading...",
})

local mobCountPara = InfoSection:Paragraph({
    Header = "Mobs in zone",
    Body   = (function()
        local f = getEnemiesFolder()
        return tostring(f and #f:GetChildren() or 0)
    end)(),
})

-- Live player info update (Power/Crystals/Gems/Aura/Level/Map/Zone/Gamemode)
local function updatePlayerInfo()
    if not playerInfoPara then return end
    local d = Omni and Omni.Data
    if not d then return end
    local lvl = (d.Level and d.Level.Amount) or 1
    local txt = string.format(
        "Power: %s\nCrystals: %s\nGems: %s\nAura: %s\nLevel: %s\nMap: %s | Zone: %s\nGamemode: %s",
        tostring(d.Power    or 0),
        tostring(d.Crystals or 0),
        tostring((d.FreeGems or 0) + (d.PaidGems or 0)),
        tostring(d.Aura     or 0),
        tostring(lvl),
        tostring(d.Map      or "?"),
        tostring(d.Zone     or 1),
        tostring(d.Gamemode or "—")
    )
    pcall(function() playerInfoPara:UpdateBody(txt) end)
end

local function updateStatus()
    if not statusPara then return end

    local targets = getgenv().Targets or {}
    local selected = {}
    for n in pairs(targets) do table.insert(selected, n) end
    table.sort(selected)

    -- Считаем живых мобов по каждому выбранному типу
    local groups = groupMobs()
    local perType = {}
    local total = 0
    for _, name in ipairs(selected) do
        local c = groups[name] and #groups[name] or 0
        total = total + c
        table.insert(perType, ("  • %s: %d"):format(name, c))
    end

    local lines = { "Auto Farm: " .. (getgenv().AutoFarm and "ON" or "OFF") }

    -- Информация о зоне
    local curMap  = Omni.Data and Omni.Data.Map  or "?"
    local curZone = Omni.Data and Omni.Data.Zone or "?"
    if getgenv()._ZoneTpBusy then
        table.insert(lines, ("Zone: %s %s → TP…"):format(curMap, tostring(curZone)))
    else
        table.insert(lines, ("Zone: %s %s"):format(curMap, tostring(curZone)))
    end

    if #selected == 0 then
        table.insert(lines, "Targets: —")
    else
        table.insert(lines, ("Targets (%d): %d здесь"):format(#selected, total))

        -- Построчно по каждому таргету: где он доступен
        for _, name in ipairs(selected) do
            local cntHere = groups[name] and #groups[name] or 0
            local locs = findMobLocations(name)
            if cntHere > 0 then
                table.insert(lines, ("  ✓ %s — здесь (%d)"):format(name, cntHere))
            elseif #locs == 0 then
                table.insert(lines, ("  ? %s — не найден в конфиге"):format(name))
            else
                -- Собираем карту зон: разблокированные vs заблокированные
                local unlockedLocs, lockedLocs = {}, {}
                for _, l in ipairs(locs) do
                    local str = ("%s %s"):format(l.mapName, tostring(l.zoneIdx))
                    if l.unlocked then
                        table.insert(unlockedLocs, str)
                    else
                        table.insert(lockedLocs, str)
                    end
                end
                if #unlockedLocs > 0 then
                    table.insert(lines, ("  → %s — в: %s"):format(name, table.concat(unlockedLocs, ", ")))
                else
                    table.insert(lines, ("  🔒 %s — locked: %s"):format(name, table.concat(lockedLocs, ", ")))
                end
            end
        end

        -- Показать HP ближайшего по сортировке (слабейшего) из выбранных
        local allCands = {}
        for _, name in ipairs(selected) do
            for _, m in ipairs(groups[name] or {}) do
                table.insert(allCands, m)
            end
        end
        if #allCands > 0 then
            table.sort(allCands, function(a, b)
                return (getMobHPValue(a) or math.huge) < (getMobHPValue(b) or math.huge)
            end)
            local hp, mhp = getMobHP(allCands[1])
            if hp then
                if mhp then
                    table.insert(lines, ("Next HP: %d / %d (%s)"):format(hp, mhp, allCands[1].Name))
                else
                    table.insert(lines, ("Next HP: %d (%s)"):format(hp, allCands[1].Name))
                end
            end
        end
    end

    pcall(function() statusPara:UpdateBody(table.concat(lines, "\n")) end)
    pcall(function()
        local f = getEnemiesFolder()
        mobCountPara:UpdateBody(tostring(f and #f:GetChildren() or 0))
    end)
end

-- =========================================================
-- [7b] UI — Rewards Tab
-- =========================================================
local RewardsTab     = MainTabGroup:Tab({ Name = "Rewards" })
local RewardsLeft    = RewardsTab:Section({ Side = "Left"  })
local RewardsRight   = RewardsTab:Section({ Side = "Right" })

-- Кнопка-хелпер: "любой тоггл включился → убедиться что rewardsLoop запущен"
local function ensureRewardsLoop(state)
    if state then startRewardsLoop() end
end

RewardsLeft:Toggle({
    Name     = "Auto Achievements (ClaimAll)",
    Default  = false,
    Callback = function(s) getgenv().AutoAchievements = s; ensureRewardsLoop(s) end,
}, "AutoAchievementsToggle")
RewardsLeft:Toggle({
    Name     = "Auto Time Rewards",
    Default  = false,
    Callback = function(s) getgenv().AutoTimeRewards = s; ensureRewardsLoop(s) end,
}, "AutoTimeRewardsToggle")
RewardsLeft:Toggle({
    Name     = "Auto Daily Rewards",
    Default  = false,
    Callback = function(s) getgenv().AutoDailyRewards = s; ensureRewardsLoop(s) end,
}, "AutoDailyRewardsToggle")
RewardsLeft:Toggle({
    Name     = "Auto Follow Rewards (Verify)",
    Default  = false,
    Callback = function(s) getgenv().AutoFollowRewards = s; ensureRewardsLoop(s) end,
}, "AutoFollowRewardsToggle")

RewardsRight:Toggle({
    Name     = "Auto Daily Chest",
    Default  = false,
    Callback = function(s) getgenv().AutoDailyChest = s; ensureRewardsLoop(s) end,
}, "AutoDailyChestToggle")
RewardsRight:Toggle({
    Name     = "Auto Group Chest",
    Default  = false,
    Callback = function(s) getgenv().AutoGroupChest = s; ensureRewardsLoop(s) end,
}, "AutoGroupChestToggle")
RewardsRight:Toggle({
    Name     = "Auto VIP Chest",
    Default  = false,
    Callback = function(s) getgenv().AutoVIPChest = s; ensureRewardsLoop(s) end,
}, "AutoVIPChestToggle")

RewardsRight:Button({
    Name     = "Claim Now (все включенные)",
    Callback = function()
        task.spawn(function()
            if getgenv().AutoAchievements then tryAchievementsClaimAll() end
            if getgenv().AutoTimeRewards   then tryTimeRewards()          end
            if getgenv().AutoDailyRewards  then tryDailyRewards()         end
            if getgenv().AutoFollowRewards then tryFollowRewards()        end
            if getgenv().AutoDailyChest    then tryClaimChest("Daily Chest") end
            if getgenv().AutoGroupChest    then tryClaimChest("Group Chest") end
            if getgenv().AutoVIPChest      then tryClaimChest("VIP Chest")   end
        end)
    end,
})

-- =========================================================
-- Auto Codes — периодический redeem всех известных кодов.
-- Логика: раз в 5 мин прогоняем список (0.4с между попытками чтобы сервер не
-- rate-limit'ил). Уже-применённые коды сервер просто отвергнет — без ошибок.
-- Также добавляем все Data.Codes которые есть в Shared но ещё не в Data.Codes
-- (если Shared.Codes доступен) — это ловит временные коды из апдейтов.
-- =========================================================
local KNOWN_CODES = {
    "RELEASE", "WORLDFIGHTERS", "FREE100", "UPDATE1", "UPDATE2", "UPDATE3",
    "DEV", "ADMIN", "WELCOME", "SHUTDOWN", "SORRY",
    "THXSUB", "100KLIKES", "1MVISITS", "10MVISITS", "100MVISITS",
    "LIKES", "FAVORITE", "FOLLOW",
}

local function getAllCodes()
    local out, seen = {}, {}
    for _, c in ipairs(KNOWN_CODES) do
        if not seen[c] then seen[c] = true; table.insert(out, c) end
    end
    -- Динамически докидываем все коды из Shared (если структура доступна)
    local sc = Omni and Omni.Shared and Omni.Shared.Codes
    if type(sc) == "table" then
        for k in pairs(sc) do
            if type(k) == "string" and not seen[k] then
                seen[k] = true; table.insert(out, k)
            end
        end
        if type(sc.List) == "table" then
            for k in pairs(sc.List) do
                if type(k) == "string" and not seen[k] then
                    seen[k] = true; table.insert(out, k)
                end
            end
        end
    end
    return out
end

local _autoCodesLoop
local function startAutoCodesLoop()
    if _autoCodesLoop then return end
    _autoCodesLoop = task.spawn(function()
        while getgenv().AutoCodes and not stopped do
            local codes = getAllCodes()
            local used = (Omni and Omni.Data and Omni.Data.Codes) or {}
            for _, code in ipairs(codes) do
                if not getgenv().AutoCodes or stopped then break end
                -- Пропускаем уже применённые (если структура позволяет проверить)
                if not used[code] then
                    pcall(function() fire("General", "Codes", "Redeem", code) end)
                    task.wait(0.4)
                end
            end
            -- Спим 5 минут — новые коды постят редко, нет смысла спамить
            for _ = 1, 300 do
                if not getgenv().AutoCodes or stopped then break end
                task.wait(1)
            end
        end
        _autoCodesLoop = nil
    end)
end

RewardsRight:Toggle({
    Name     = "Auto Redeem Codes (every 5 min)",
    Default  = false,
    Callback = function(s)
        getgenv().AutoCodes = s
        if s then startAutoCodesLoop() end
    end,
}, "AutoCodesToggle")

RewardsRight:Button({
    Name     = "Redeem All Codes Now",
    Callback = function()
        task.spawn(function()
            local codes = getAllCodes()
            for _, code in ipairs(codes) do
                pcall(function() fire("General", "Codes", "Redeem", code) end)
                task.wait(0.4)
            end
            pcall(function()
                Window:Notify({
                    Title       = "Codes",
                    Description = ("Прогнал %d кодов"):format(#codes),
                    Lifetime    = 3,
                })
            end)
        end)
    end,
})

getgenv().AutoCodes = getgenv().AutoCodes or false

-- Статус сундуков (cooldown остаток)
local chestStatusPara = RewardsRight:Paragraph({
    Header = "Chests Cooldown",
    Body   = "—",
})

local function formatChestCooldown(chestName)
    local last = getChestLastClaim(chestName)
    if not last then return "ready" end
    local cd = CHEST_CD[chestName] or 24 * 3600
    local remaining = cd - (tick() - last)
    if remaining <= 0 then return "ready" end
    local h = math.floor(remaining / 3600)
    local m = math.floor((remaining % 3600) / 60)
    return ("%dh %dm"):format(h, m)
end

local function updateChestStatus()
    if not chestStatusPara then return end
    local lines = {
        "Daily: "  .. formatChestCooldown("Daily Chest"),
        "Group: "  .. formatChestCooldown("Group Chest"),
        "VIP: "    .. formatChestCooldown("VIP Chest"),
    }
    pcall(function() chestStatusPara:UpdateBody(table.concat(lines, "\n")) end)
end

-- =========================================================
-- [7c] UI — Eggs Tab (Stars)
-- =========================================================
local EggsTab   = MainTabGroup:Tab({ Name = "Eggs" })
local EggsLeft  = EggsTab:Section({ Side = "Left"  })
local EggsRight = EggsTab:Section({ Side = "Right" })

-- Star UI Hider — когда сервер отвечает на Stars.Open, клиент замораживает
-- камеру анимацией StarAnimation. Для фонового фарма это мешает. Этот helper
-- агрессивно закрывает анимацию каждый Heartbeat пока она включена.
local starHideEnabled = false
local starHideConn    = nil

local function applyStarHide()
    if not Omni then return end
    pcall(function()
        local sa = LocalPlayer.PlayerGui:FindFirstChild("StarAnimation")
        if sa then sa.Enabled = false end
    end)
    pcall(function() Omni.Frame:Close("Star") end)
    pcall(function() Omni.Frame:RemoveUIHider("StarAnimation") end)
    pcall(function()
        if Omni.Signal and Omni.Signal.FireSelf then
            Omni.Signal:FireSelf("Player", "Camera", "RemoveCameraTypeModifier", "StarAnimation")
            Omni.Signal:FireSelf("Player", "FOV", "Enable")
        end
    end)
end

EggsLeft:Toggle({
    Name     = "Auto Open Eggs",
    Default  = false,
    Callback = function(s)
        getgenv().AutoOpenStar = s
        if s then
            startStarLoop()
        else
            getgenv()._StarBusy = false  -- разблокируем farm если выключили посреди цикла
        end
    end,
}, "AutoOpenStarToggle")

EggsLeft:Toggle({
    Name     = "Hide Star Animation (unfreeze camera)",
    Default  = false,
    Callback = function(on)
        starHideEnabled = on
        if on then
            if starHideConn then starHideConn:Disconnect() end
            starHideConn = RunService.Heartbeat:Connect(function()
                if not starHideEnabled then return end
                applyStarHide()
            end)
            table.insert(connections, starHideConn)
        else
            if starHideConn then starHideConn:Disconnect(); starHideConn = nil end
            pcall(function()
                local sa = LocalPlayer.PlayerGui:FindFirstChild("StarAnimation")
                if sa then sa.Enabled = true end
            end)
        end
    end,
}, "StarHideAnimToggle")

local starDropdown = EggsLeft:Dropdown({
    Name     = "Target Eggs (multi)",
    Multi    = true,
    Required = false,
    Options  = getAllStars(),
    Callback = function(values)
        local set = {}
        if type(values) == "table" then
            for k, v in pairs(values) do
                if v and type(k) == "string" then
                    set[k] = true
                end
            end
        elseif type(values) == "string" and values ~= "" then
            set[values] = true
        end
        getgenv().StarTargets = set
    end,
})

EggsLeft:Button({
    Name     = "Refresh List",
    Callback = function()
        pcall(function()
            starDropdown:ClearOptions()
            starDropdown:InsertOptions(getAllStars())
        end)
    end,
})

EggsLeft:Button({
    Name     = "Open Selected Now (x1 каждая)",
    Callback = function()
        task.spawn(function()
            for starName in pairs(getgenv().StarTargets or {}) do
                openStarOnce(starName, 1)
                task.wait(STAR_FIRE_SETTLE)
            end
        end)
    end,
})

EggsLeft:Button({
    Name     = "Open Selected (max × 10)",
    Callback = function()
        task.spawn(function()
            for starName in pairs(getgenv().StarTargets or {}) do
                for _ = 1, 10 do
                    local amt = getMaxStarOpen()
                    local ok = canAffordStar(starName, amt)
                    if not ok and amt > 1 then
                        for try = amt - 1, 1, -1 do
                            if canAffordStar(starName, try) then amt = try; ok = true; break end
                        end
                    end
                    if not ok then break end
                    openStarOnce(starName, amt)
                    task.wait(STAR_FIRE_SETTLE)
                end
            end
        end)
    end,
})

-- Статус звёзд (цена/баланс/можем ли открыть)
local eggStatusPara = EggsRight:Paragraph({
    Header = "Status",
    Body   = "—",
})

local function updateEggStatus()
    if not eggStatusPara then return end
    local targets = getgenv().StarTargets or {}
    local names = {}
    for n in pairs(targets) do table.insert(names, n) end
    table.sort(names)

    -- Режим работы относительно фарма
    local farmOn   = getgenv().AutoFarm == true
    local remote   = hasRemoteStarPass()
    local busy     = getgenv()._StarBusy == true
    local modeLine
    if remote then
        modeLine = "Mode: Remote Star ✓ (параллельно с farm)"
    elseif farmOn then
        modeLine = busy and "Mode: opening… (farm paused)" or "Mode: shared HRP (перерывает farm)"
    else
        modeLine = "Mode: standalone"
    end

    local lines = {
        "Auto Open: " .. (getgenv().AutoOpenStar and "ON" or "OFF"),
        modeLine,
    }
    if #names == 0 then
        table.insert(lines, "Target: —")
    else
        local maxAmt = getMaxStarOpen()
        table.insert(lines, ("Max per open: %d"):format(maxAmt))
        for _, name in ipairs(names) do
            local cfg = getStarCfg(name)
            if cfg and cfg.Price then
                local pname, ptype, amt = cfg.Price.Name, cfg.Price.Type, cfg.Price.Amount or 0
                local have = getBalance(ptype, pname)
                local canMax = math.floor(have / math.max(1, amt))
                local tag = (canMax >= maxAmt) and "✅" or (canMax >= 1 and "⚠️" or "❌")
                table.insert(lines, ("%s %s"):format(tag, name))
                table.insert(lines, ("  %s: %d / %d (opens: %d)"):format(pname, have, amt, canMax))
            end
        end
    end
    pcall(function() eggStatusPara:UpdateBody(table.concat(lines, "\n")) end)
end

-- =========================================================
-- [7d] UI — Quests Tab
-- =========================================================
local QuestsTab   = MainTabGroup:Tab({ Name = "Quests" })
local QuestsLeft  = QuestsTab:Section({ Side = "Left"  })
local QuestsRight = QuestsTab:Section({ Side = "Right" })

QuestsLeft:Toggle({
    Name     = "Auto Quest",
    Default  = false,
    Callback = function(s)
        getgenv().AutoQuest = s
        if s then
            startQuestLoop()
        else
            -- Сбрасываем одноразовый флаг уведомления, чтобы при следующем включении
            -- снова показалось "Auto Farm включён автоматически"
            getgenv()._QuestAutoFarmNotified = nil
        end
    end,
}, "AutoQuestToggle")

local questDropdown = QuestsLeft:Dropdown({
    Name     = "Quests to do (multi)",
    Multi    = true,
    Required = false,
    Options  = getAllQuests(),
    Callback = function(values)
        local set = {}
        if type(values) == "table" then
            for k, v in pairs(values) do
                if v and type(k) == "string" then
                    set[k] = true
                end
            end
        elseif type(values) == "string" and values ~= "" then
            set[values] = true
        end
        getgenv().QuestSelections = set
    end,
}, "QuestsMultiDropdown")

QuestsLeft:Toggle({
    Name     = "Auto Pin Quest",
    Default  = true,
    Callback = function(s) getgenv().AutoPinQuest = s end,
}, "AutoPinQuestToggle")

QuestsLeft:Toggle({
    Name     = "Auto TP to Quest Zone",
    Default  = true,
    Callback = function(s) getgenv().AutoTpToQuestZone = s end,
}, "AutoTpToQuestZoneToggle")

QuestsLeft:Button({
    Name     = "Refresh Quest List",
    Callback = function()
        pcall(function()
            questDropdown:ClearOptions()
            questDropdown:InsertOptions(getAllQuests())
        end)
    end,
})

QuestsLeft:Button({
    Name     = "Debug: Dump Quest Data",
    Callback = function()
        local d, buf = newDump()
        d("========== [WF] QUEST DEBUG ==========")

        -- Сначала — корень Omni.Data.Quests целиком (все ключи верхнего уровня)
        local qRoot = Omni.Data and Omni.Data.Quests
        d("Omni.Data.Quests keys:")
        if type(qRoot) == "table" then
            for k, v in pairs(qRoot) do
                d(("  [%s] = %s (%s)"):format(tostring(k), tostring(v), typeof(v)))
            end
        else
            d("  (Omni.Data.Quests is not a table)")
        end

        -- Дамп деталей для каждого выбранного квеста из КАЖДОГО вероятного пути
        for qn in pairs(getgenv().QuestSelections or {}) do
            d(("-- Quest: %s --"):format(qn))

            local cfg = getQuestCfg(qn)
            if cfg then
                d("  Config:")
                d(("    MapName: %s  ZoneIndex: %s"):format(tostring(cfg.MapName), tostring(cfg.ZoneIndex)))
                d(("    AutoCollect: %s  Difficulty: %s"):format(tostring(cfg.AutoCollect), tostring(cfg.Difficulty)))
                if type(cfg.Missions) == "table" then
                    d("    Missions:")
                    for idx, m in pairs(cfg.Missions) do
                        d(("     [%s] =>"):format(tostring(idx)))
                        if type(m) == "table" then
                            for k, v in pairs(m) do
                                d(("        %s = %s (%s)"):format(tostring(k), tostring(v), typeof(v)))
                            end
                        else
                            d(("        <value> %s"):format(tostring(m)))
                        end
                    end
                end
            end

            d("  Data — пробуем все пути:")
            local tried = {
                { "Quests.List["       .. qn .. "]", qRoot and qRoot.List     and qRoot.List[qn]     },
                { "Quests[" .. qn .. "]",             qRoot and qRoot[qn]                            },
                { "Quests.Active["     .. qn .. "]", qRoot and qRoot.Active   and qRoot.Active[qn]   },
                { "Quests.Progress["   .. qn .. "]", qRoot and qRoot.Progress and qRoot.Progress[qn] },
                { "Quests.Missions["   .. qn .. "]", qRoot and qRoot.Missions and qRoot.Missions[qn] },
            }
            for _, t in ipairs(tried) do
                local path, val = t[1], t[2]
                if val ~= nil then
                    d(("    %s = %s (%s)"):format(path, tostring(val), typeof(val)))
                    if type(val) == "table" then
                        for k, v in pairs(val) do
                            d(("      .%s = %s (%s)"):format(tostring(k), tostring(v), typeof(v)))
                            if type(v) == "table" then
                                for kk, vv in pairs(v) do
                                    d(("        .%s = %s (%s)"):format(tostring(kk), tostring(vv), typeof(vv)))
                                end
                            end
                        end
                    end
                end
            end

            -- Резолв через нашу логику (что скрипт сейчас видит)
            local dataQ = getQuestData(qn)
            d(("  Resolved getQuestData => %s (%s)"):format(tostring(dataQ), typeof(dataQ)))
            local am = getActiveMission(qn)
            if am then
                d(("  Resolved active mission: #%d  Kill %s [%d/%d]"):format(am.missionIdx, am.name, am.progress, am.required))
            else
                d("  Resolved active mission: nil  (значит все распознанные прогрессы >= required)")
            end
        end
        d("========== END =============")
        flushDump(buf, "Quest Debug")
    end,
})

-- Status paragraph
local questStatusPara = QuestsRight:Paragraph({
    Header = "Quests Status",
    Body   = "—",
})

local function updateQuestStatus()
    if not questStatusPara then return end
    local selected = getgenv().QuestSelections or {}
    local names = {}
    for n in pairs(selected) do table.insert(names, n) end
    table.sort(names)

    local lines = { "Auto Quest: " .. (getgenv().AutoQuest and "ON" or "OFF") }
    table.insert(lines, "Auto Farm:  " .. (getgenv().AutoFarm and "ON" or "OFF"))

    -- Показать какие цели сейчас стоят на фарме (сверка с квестовым)
    local curTargets = {}
    for n in pairs(getgenv().Targets or {}) do table.insert(curTargets, n) end
    if #curTargets > 0 then
        table.sort(curTargets)
        table.insert(lines, "Farm targets: " .. table.concat(curTargets, ", "))
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
                local zoneOK = isInQuestZone(qn) and "" or "  (wrong zone)"
                table.insert(lines, ("▶ %s  (m#%d/%d)%s"):format(qn, active.missionIdx, totalMissions, zoneOK))
                table.insert(lines, ("  Kill %s [%d/%d]"):format(active.name, active.progress, active.required))
            else
                if cfg and cfg.Missions then
                    local anyTarget
                    for _, m in pairs(cfg.Missions) do
                        if extractMissionTarget(m) then anyTarget = true; break end
                    end
                    if not anyTarget then
                        table.insert(lines, ("⚠ %s (структура миссий не распознана — нажми Debug)"):format(qn))
                    else
                        table.insert(lines, ("✅ %s (завершён)"):format(qn))
                    end
                else
                    table.insert(lines, ("? %s"):format(qn))
                end
            end
        end
    end
    pcall(function() questStatusPara:UpdateBody(table.concat(lines, "\n")) end)
end

-- =========================================================
-- [7e] TRIALS — helpers + loop + UI
-- =========================================================
-- Trial'ы — отдельные gamemode'ы со своими мобами в workspace.Server.Enemies.Gamemodes[name]
-- и периодами доступности (OpenTimes). Конфиг в Omni.Shared.Gamemodes.
-- Сервер-вход: Signal:Fire("General","Gamemodes","Join", name).
--
-- Известные gamemode имена (из анализа): "Trial Easy", "Trial Medium", "Trial Hard",
-- "Test Raid", "Dragon Defense". Основной фокус — Trial'ы (у них регулярный cooldown).
--
-- Стратегия: смотрим на Omni.Data.Gamemodes[name] (кулдаун/next open), либо пытаемся
-- Join если папка с мобами пуста. Внутри — стандартный attack-loop по всем видимым мобам.

-- Dynamic trial discovery: принимаем любой gamemode чьё имя начинается с "Trial "
-- (так автоматически поддержим будущие Trial Insane/Nightmare/etc. без правок кода).
-- Остальные gamemode'ы (Test Raid, Dragon Defense) — другой режим игры, не показываем.
local TRIAL_NAME_PATTERN = "^Trial "
local KNOWN_TRIALS = { "Trial Easy", "Trial Medium", "Trial Hard" }  -- fallback

local function isTrialName(name)
    return type(name) == "string" and name:match(TRIAL_NAME_PATTERN) ~= nil
end

local function getAllTrials()
    local out, seen = {}, {}
    local function add(n)
        if isTrialName(n) and not seen[n] then
            seen[n] = true; table.insert(out, n)
        end
    end

    -- Рекурсивно сканим Omni.Shared.Gamemodes (включая подпапки вроде "For Updates")
    local sg = Omni and Omni.Shared and Omni.Shared.Gamemodes
    if type(sg) == "table" then
        for k, v in pairs(sg) do
            if type(v) == "table" then
                if v.OpenTimes or v.MapName or v.EnterTime or v.MaxWave then
                    add(k)
                else
                    for k2, v2 in pairs(v) do
                        if type(v2) == "table" and (v2.OpenTimes or v2.MapName or v2.EnterTime or v2.MaxWave) then
                            add(k2)
                        end
                    end
                end
            end
        end
    end

    -- Fallback: scan workspace.Server.Enemies.Gamemodes (детектит runtime-only)
    local ok, gmFolder = pcall(function() return workspace.Server.Enemies.Gamemodes end)
    if ok and gmFolder then
        for _, ch in ipairs(gmFolder:GetChildren()) do add(ch.Name) end
    end

    -- Ultimate fallback
    for _, n in ipairs(KNOWN_TRIALS) do add(n) end

    table.sort(out)
    return out
end

local function getTrialCfg(name)
    -- Пробуем все вероятные пути в Shared.Gamemodes
    local sg = Omni and Omni.Shared and Omni.Shared.Gamemodes
    if type(sg) ~= "table" then return nil end
    if type(sg[name]) == "table" then return sg[name] end
    for _, sub in pairs(sg) do
        if type(sub) == "table" and type(sub[name]) == "table" then
            return sub[name]
        end
    end
    return nil
end

local function getTrialData(name)
    -- Progress/timestamps gamemode'а в Data
    local d = Omni and Omni.Data and Omni.Data.Gamemodes
    if type(d) ~= "table" then return nil end
    return d[name]
end

local function getTrialEnemiesFolder(name)
    local ok, f = pcall(function()
        return workspace.Server.Enemies.Gamemodes:FindFirstChild(name)
    end)
    if ok then return f end
    return nil
end

-- Проверка что мы сейчас в этом Trial'е.
-- Эвристика: папка с мобами gamemode непустая ИЛИ Data.Map/Zone указывает на Trial.
local function isInTrial(name)
    local f = getTrialEnemiesFolder(name)
    if f and #f:GetChildren() > 0 then return true end
    -- Некоторые trial'ы живут в отдельной Map (вроде Test Raid → Map=Fruits Verse);
    -- эта эвристика не 100%, но лучше чем ничего. Если есть Data.CurrentGamemode — используем.
    local d = Omni.Data
    if d and type(d.CurrentGamemode) == "string" and d.CurrentGamemode == name then
        return true
    end
    return false
end

-- Дёргаем Join — сервер сам перенесёт если gamemode доступен.
local function joinTrial(name)
    if not Omni or not Omni.Signal then return false end
    local ok = pcall(function()
        Omni.Signal:Fire("General", "Gamemodes", "Join", name)
    end)
    return ok
end

-- Простая оценка "можно ли зайти прямо сейчас".
-- Если мы не знаем точной семантики OpenTimes — просто пробуем раз в N секунд.
-- Сервер всё равно сам отвергнет Join если ещё не время.
local _trialLastJoinAttempt = {}
local TRIAL_JOIN_RETRY = 20 -- сек между повторными попытками Join
local function canTryJoin(name)
    local last = _trialLastJoinAttempt[name] or 0
    return (tick() - last) >= TRIAL_JOIN_RETRY
end

-- Чтение текущей волны. 5 путей в порядке надёжности.
local function getCurrentWave(name)
    -- Path 0 (БЕСТ): Omni.Libs.DataContainer — игровой runtime-стейт gamemode'а
    -- (обновляется PlayerScripts скриптами которые игра подгружает во время
    -- активного mode). Возвращает {Data={Wave=N, MaxWave=M, ...}}.
    if Omni and Omni.Libs and Omni.Libs.DataContainer then
        local ok, container = pcall(function()
            return Omni.Libs.DataContainer:Get("GamemodeData - " .. name)
        end)
        if ok and container and container.Data and type(container.Data.Wave) == "number" then
            if container.Data.Wave > 0 then return container.Data.Wave end
        end
    end

    -- Path 1: Omni.Data.Gamemodes[name].Wave / CurrentWave / wave
    local d = Omni and Omni.Data and Omni.Data.Gamemodes
    if type(d) == "table" and type(d[name]) == "table" then
        for _, key in ipairs({ "Wave", "CurrentWave", "wave", "currentWave" }) do
            local v = d[name][key]
            if type(v) == "number" then return v end
        end
    end

    -- Path 2: workspace.Server.Enemies.Gamemodes[name] attributes
    local f = getTrialEnemiesFolder(name)
    if f then
        for _, key in ipairs({ "Wave", "CurrentWave" }) do
            local ok, v = pcall(function() return f:GetAttribute(key) end)
            if ok and type(v) == "number" then return v end
        end
        if f.Parent then
            for _, key in ipairs({ "Wave", "CurrentWave" }) do
                local ok, v = pcall(function() return f.Parent:GetAttribute(key) end)
                if ok and type(v) == "number" then return v end
            end
        end
    end

    -- Path 3: workspace.Client.Maps[name] attribute
    local ok, m = pcall(function()
        return workspace.Client.Maps:FindFirstChild(name)
    end)
    if ok and m then
        for _, key in ipairs({ "Wave", "CurrentWave" }) do
            local ok2, v = pcall(function() return m:GetAttribute(key) end)
            if ok2 and type(v) == "number" then return v end
        end
    end

    -- Path 4 (last resort): PlayerGui HUD parse.
    -- Путь: PlayerGui.UI.HUD.Gamemodes.<name>.Main.Wave.Value.Text = "X / Y".
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    local ui = pg and pg:FindFirstChild("UI")
    local hud = ui and ui:FindFirstChild("HUD")
    local gms = hud and hud:FindFirstChild("Gamemodes")
    local modeUI = gms and gms:FindFirstChild(name)
    local main = modeUI and modeUI:FindFirstChild("Main")
    local waveNode = main and main:FindFirstChild("Wave")
    local valueNode = waveNode and waveNode:FindFirstChild("Value")
    if valueNode and valueNode:IsA("TextLabel") then
        local w = valueNode.Text:match("(%d+)%s*/%s*%d+") or valueNode.Text:match("(%d+)")
        if w then return tonumber(w) end
    end

    return nil
end

-- Выход из Trial'а — TP в безопасное место (Fruits Verse 1 по умолчанию).
-- В этой игре gamemode'ы не имеют explicit "Leave" action; TP на обычную карту
-- корректно снимает нас с gamemode.
local function leaveTrial()
    getgenv()._ZoneTpBusy = true
    pcall(function()
        Omni.Signal:Fire("Player", "Teleport", "Teleport", "Fruits Verse", 1)
    end)
    task.wait(1.0)
    getgenv()._ZoneTpBusy = false
end

-- Состояние/статус Trial'ов для paragraph
local _trialStatus = {
    current  = nil,   -- имя активного trial'а (где мы сейчас)
    wave     = nil,   -- текущая волна
    lastJoin = {},    -- { [name] = tick() }
    lastExit = {},    -- { [name] = tick() }
}

-- Активный таргетинг мобов в trial'е: берём всех живых из папки gamemode
local function getTrialLiveMobs(name)
    local f = getTrialEnemiesFolder(name)
    if not f then return {} end
    local out = {}
    for _, mob in ipairs(f:GetChildren()) do
        if isAlive(mob) and getMobPos(mob) then
            table.insert(out, mob)
        end
    end
    return out
end

-- Флаг и поток
local trialThread
local function startTrialLoop()
    if trialThread then return end
    trialThread = task.spawn(function()
        while getgenv().AutoTrial and not stopped do
            -- Уважаем общие мьютексы
            while (getgenv()._StarBusy or getgenv()._ZoneTpBusy)
                and getgenv().AutoTrial and not stopped
            do
                task.wait(0.1)
            end

            local selected = getgenv().TrialSelections or {}
            local names = {}
            for n, on in pairs(selected) do
                if on then table.insert(names, n) end
            end
            table.sort(names)

            if #names == 0 then
                task.wait(2)
            else
                -- [A] Если мы уже в каком-то выбранном trial'е — фармим его
                local inTrialName
                for _, n in ipairs(names) do
                    if isInTrial(n) then inTrialName = n; break end
                end

                if inTrialName then
                    _trialStatus.current = inTrialName
                    local wave = getCurrentWave(inTrialName)
                    _trialStatus.wave = wave
                    local leaveThr = tonumber(getgenv().TrialAutoLeaveWave) or 0

                    if leaveThr > 0 and type(wave) == "number" and wave > leaveThr then
                        -- Порог превышен — ливаем.
                        pcall(function()
                            Window:Notify({
                                Title       = "Trial",
                                Description = ("Wave %d > %d — leaving"):format(wave, leaveThr),
                                Lifetime    = 4,
                            })
                        end)
                        _trialStatus.lastExit[inTrialName] = tick()
                        leaveTrial()
                        _trialStatus.current = nil
                        _trialStatus.wave    = nil
                        task.wait(1.5)
                    else
                        local mobs = getTrialLiveMobs(inTrialName)
                    if #mobs == 0 then
                        -- Волна закончилась? Ждём следующего тика или выхода
                        task.wait(1)
                    else
                        -- Сортируем по HP (слабые первыми) чтобы добить
                        table.sort(mobs, function(a, b)
                            local ha = getMobHPValue(a) or math.huge
                            local hb = getMobHPValue(b) or math.huge
                            return ha < hb
                        end)
                        local mob = mobs[1]
                        if mob and isAlive(mob) then
                            teleportTo(mob)
                            task.wait(0.08)
                            local cd        = getClickCooldown()
                            local startTime = tick()
                            local hrp       = getHRP()
                            while getgenv().AutoTrial
                                and not stopped
                                and not getgenv()._StarBusy
                                and not getgenv()._ZoneTpBusy
                                and isAlive(mob)
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
                        end
                    end
                    end
                else
                    -- [B] Не в trial'е — пробуем зайти
                    _trialStatus.current = nil
                    local joined = false
                    for _, n in ipairs(names) do
                        if canTryJoin(n) then
                            _trialLastJoinAttempt[n] = tick()
                            _trialStatus.lastJoin[n] = tick()
                            if joinTrial(n) then
                                task.wait(1.2)
                                if isInTrial(n) then
                                    joined = true
                                    break
                                end
                            end
                        end
                    end
                    if not joined then
                        task.wait(3)
                    end
                end
            end
        end
        trialThread = nil
    end)
end

getgenv().AutoTrial         = getgenv().AutoTrial         or false
getgenv().TrialSelections   = getgenv().TrialSelections   or {}
getgenv().TrialAutoLeaveWave = getgenv().TrialAutoLeaveWave or 0

-- UI
local TrialsTab   = MainTabGroup:Tab({ Name = "Trials" })
local TrialsLeft  = TrialsTab:Section({ Side = "Left"  })
local TrialsRight = TrialsTab:Section({ Side = "Right" })

TrialsLeft:Toggle({
    Name     = "Auto Trial",
    Default  = false,
    Callback = function(s)
        getgenv().AutoTrial = s
        if s then startTrialLoop() end
    end,
}, "AutoTrialToggle")

local trialDropdown = TrialsLeft:Dropdown({
    Name     = "Trials to run (multi)",
    Multi    = true,
    Required = false,
    Options  = getAllTrials(),
    Callback = function(values)
        local set = {}
        if type(values) == "table" then
            for k, v in pairs(values) do
                if v and type(k) == "string" then
                    set[k] = true
                end
            end
        elseif type(values) == "string" and values ~= "" then
            set[values] = true
        end
        getgenv().TrialSelections = set
    end,
})

TrialsLeft:Button({
    Name     = "Refresh Trial List",
    Callback = function()
        pcall(function()
            trialDropdown:ClearOptions()
            trialDropdown:InsertOptions(getAllTrials())
        end)
    end,
})

TrialsLeft:Button({
    Name     = "Join Selected Now",
    Callback = function()
        task.spawn(function()
            for name in pairs(getgenv().TrialSelections or {}) do
                joinTrial(name)
                task.wait(0.3)
            end
        end)
    end,
})

pcall(function()
    TrialsLeft:Slider({
        Name          = "Auto Leave on Wave (0=off)",
        Default       = 0,
        Minimum       = 0,
        Maximum       = 50,
        Precision     = 0,
        DisplayMethod = "Value",
        Callback      = function(v)
            getgenv().TrialAutoLeaveWave = tonumber(v) or 0
        end,
    }, "TrialAutoLeaveWaveSlider")
end)

TrialsLeft:Button({
    Name     = "Leave Trial Now",
    Callback = function()
        task.spawn(function() leaveTrial() end)
    end,
})

TrialsLeft:Button({
    Name     = "Debug: Dump Gamemodes",
    Callback = function()
        local d, buf = newDump()
        d("========== [WF] GAMEMODES DEBUG ==========")
        -- Shared config
        local sg = Omni and Omni.Shared and Omni.Shared.Gamemodes
        d("Omni.Shared.Gamemodes:")
        if type(sg) == "table" then
            for k, v in pairs(sg) do
                d(("  [%s] type=%s"):format(tostring(k), typeof(v)))
                if type(v) == "table" then
                    for k2, v2 in pairs(v) do
                        if type(v2) == "table" then
                            d(("    [%s.%s] table:"):format(tostring(k), tostring(k2)))
                            for k3, v3 in pairs(v2) do
                                d(("      %s = %s (%s)"):format(tostring(k3), tostring(v3), typeof(v3)))
                            end
                        else
                            d(("    [%s.%s] = %s (%s)"):format(tostring(k), tostring(k2), tostring(v2), typeof(v2)))
                        end
                    end
                end
            end
        else
            d("  (not a table)")
        end

        -- Data
        d("Omni.Data.Gamemodes:")
        local gd = Omni and Omni.Data and Omni.Data.Gamemodes
        if type(gd) == "table" then
            for k, v in pairs(gd) do
                d(("  [%s] = %s (%s)"):format(tostring(k), tostring(v), typeof(v)))
                if type(v) == "table" then
                    for k2, v2 in pairs(v) do
                        d(("    %s = %s (%s)"):format(tostring(k2), tostring(v2), typeof(v2)))
                    end
                end
            end
        else
            d("  (not a table)")
        end

        -- Workspace folders + attributes
        d("workspace.Server.Enemies.Gamemodes:")
        local ok, gmFolder = pcall(function() return workspace.Server.Enemies.Gamemodes end)
        if ok and gmFolder then
            for _, ch in ipairs(gmFolder:GetChildren()) do
                d(("  [%s] children=%d"):format(ch.Name, #ch:GetChildren()))
                -- Всё-все атрибуты чтобы увидеть где лежит волна
                local attrs = ch:GetAttributes()
                if next(attrs) then
                    for ak, av in pairs(attrs) do
                        d(("    attr[%s] = %s (%s)"):format(tostring(ak), tostring(av), typeof(av)))
                    end
                end
            end
            -- Атрибуты самой папки Gamemodes
            local gmAttrs = gmFolder:GetAttributes()
            if next(gmAttrs) then
                d("  (root) attributes:")
                for ak, av in pairs(gmAttrs) do
                    d(("    %s = %s (%s)"):format(tostring(ak), tostring(av), typeof(av)))
                end
            end
        end

        -- Текущее значение getCurrentWave для каждого выбранного trial'а
        d("getCurrentWave() resolve:")
        for n in pairs(getgenv().TrialSelections or {}) do
            d(("  [%s] => %s"):format(n, tostring(getCurrentWave(n))))
        end
        d("Data.Map=" .. tostring(Omni.Data and Omni.Data.Map) ..
          " Data.Zone=" .. tostring(Omni.Data and Omni.Data.Zone))
        d("=========================================")
        flushDump(buf, "Trial Debug")
    end,
})

-- Status
local trialStatusPara = TrialsRight:Paragraph({
    Header = "Status",
    Body   = "—",
})

local function fmtTimeAgo(t)
    if not t or t <= 0 then return "—" end
    local d = tick() - t
    if d < 60 then return ("%ds ago"):format(math.floor(d)) end
    if d < 3600 then return ("%dm%ds ago"):format(math.floor(d / 60), math.floor(d) % 60) end
    return ("%dh ago"):format(math.floor(d / 3600))
end

local function updateTrialStatus()
    if not trialStatusPara then return end
    local targets = getgenv().TrialSelections or {}
    local names = {}
    for n, on in pairs(targets) do
        if on then table.insert(names, n) end
    end
    table.sort(names)

    local leaveThr = tonumber(getgenv().TrialAutoLeaveWave) or 0
    local lines = {
        "Auto Trial: " .. (getgenv().AutoTrial and "ON" or "OFF"),
        "Current: " .. (_trialStatus.current or "—"),
        "Wave: " .. (_trialStatus.wave and tostring(_trialStatus.wave) or "—"),
        "Leave on wave: " .. (leaveThr > 0 and tostring(leaveThr) or "off"),
    }
    if #names == 0 then
        table.insert(lines, "Targets: —")
    else
        for _, n in ipairs(names) do
            local cfg  = getTrialCfg(n)
            local f    = getTrialEnemiesFolder(n)
            local live = f and #f:GetChildren() or 0
            local cfgInfo = "no-cfg"
            if cfg then
                local parts = {}
                if cfg.MapName then table.insert(parts, "map=" .. tostring(cfg.MapName)) end
                if cfg.MaxWave then table.insert(parts, "waves=" .. tostring(cfg.MaxWave)) end
                if cfg.EnterTime then table.insert(parts, "enter=" .. tostring(cfg.EnterTime) .. "s") end
                if cfg.TotalTime then table.insert(parts, "total=" .. tostring(cfg.TotalTime) .. "s") end
                cfgInfo = (#parts > 0) and table.concat(parts, " ") or "cfg"
            end
            local tag = (n == _trialStatus.current) and "▶" or (live > 0 and "●" or "○")
            table.insert(lines, ("%s %s"):format(tag, n))
            table.insert(lines, ("  %s | live=%d"):format(cfgInfo, live))
            local lj = _trialStatus.lastJoin[n]
            if lj then table.insert(lines, ("  last join: %s"):format(fmtTimeAgo(lj))) end
        end
    end
    pcall(function() trialStatusPara:UpdateBody(table.concat(lines, "\n")) end)
end

-- =========================================================
-- [7f] GACHA — helpers + loop + UI
-- =========================================================
-- Поддержка ВСЕХ гач: Race, Dragon Power, Fruit, Haki, Slime Power.
-- Логика: каждая выбранная гача крутится в своём task.spawn параллельно.
-- Target rarity и threshold общие, но каждая гача смотрит свою валюту
-- (auto-detected через cfg.Price.Name). При достижении target rarity конкретная
-- гача выключается из списка. Когда все выключились — master toggle = false.

-- Список имён всех гач из Omni.Shared.Gacha.List
local function getAllGachaNames()
    local list = Omni and Omni.Shared and Omni.Shared.Gacha and Omni.Shared.Gacha.List
    if type(list) ~= "table" then
        return { "Race", "Dragon Power", "Fruit", "Haki", "Slime Power" }
    end
    local out = {}
    for k in pairs(list) do
        if type(k) == "string" then table.insert(out, k) end
    end
    table.sort(out)
    return out
end

-- Валюта гачи из cfg.Price.Name. Фолбэк по известным именам.
local function getGachaCurrency(gachaName)
    local sg = Omni and Omni.Shared and Omni.Shared.Gacha
    local cfg = sg and sg.List and sg.List[gachaName] or (sg and sg[gachaName])
    if type(cfg) == "table" and type(cfg.Price) == "table" and type(cfg.Price.Name) == "string" then
        return cfg.Price.Name
    end
    local defaults = {
        Haki            = "Haki Token",
        Fruit           = "Fruit Token",
        Race            = "Race Token",
        ["Dragon Power"] = "Dragon Balls Token",
        ["Slime Power"] = "Slime Token",
    }
    return defaults[gachaName] or (gachaName .. " Token")
end

local RARITY_ORDER = {
    Common = 1, Uncommon = 2, Rare = 3, Epic = 4,
    Mythical = 5, Legendary = 6, Secret = 7,
}
local RARITY_OPTIONS = { "Common", "Uncommon", "Rare", "Epic", "Mythical", "Legendary", "Secret" }

local function getGachaCfg(gachaName)
    local sg = Omni and Omni.Shared and Omni.Shared.Gacha
    if type(sg) ~= "table" then return nil end
    if type(sg[gachaName]) == "table" then return sg[gachaName] end
    if type(sg.List) == "table" and type(sg.List[gachaName]) == "table" then
        return sg.List[gachaName]
    end
    return nil
end

local function getGachaCost(gachaName)
    local cfg = getGachaCfg(gachaName)
    if cfg then
        if type(cfg.Price) == "table" and type(cfg.Price.Amount) == "number" then
            return cfg.Price.Amount
        end
        if type(cfg.Cost) == "number" then return cfg.Cost end
    end
    return 1 -- fallback: сервер всё равно отклонит если недостаточно
end

local function getCurrencyBalance(currencyName)
    local inv = Omni and Omni.Data and Omni.Data.Inventory
    if type(inv) ~= "table" then return 0 end
    if type(inv.Items) == "table" then
        local v = inv.Items[currencyName]
        if type(v) == "number" then return v end
        if type(v) == "table" and type(v.Amount) == "number" then return v.Amount end
    end
    local d = Omni.Data
    if d and type(d[currencyName]) == "number" then return d[currencyName] end
    return 0
end

-- =========================================================
-- HELPERS для gacha-rewards. Используют Omni.Shared.Gacha.List[name].SourceInfo
-- как canonical список валидных наград конкретной гачи (с их rarity).
-- Награды могут падать в разные категории Inventory (Units/Accessories/Items/...)
-- или даже в top-level Data.<Category>; скан пройдёт по всем.
-- =========================================================

-- Возвращает SourceInfo конкретной гачи: { [rewardName] = { Rarity=..., Icon=... }, ... }
-- nil если SourceInfo нет.
local function getGachaSourceInfo(gachaName)
    local cfg = getGachaCfg(gachaName)
    if type(cfg) == "table" and type(cfg.SourceInfo) == "table" then
        return cfg.SourceInfo
    end
    return nil
end

-- Возвращает имя категории inventory куда сервер складывает награды этой гачи.
-- Напр. для "Haki" это "Hakis", для "Fruit" — "Fruits", и т.д.
local function getGachaSourceCategory(gachaName)
    local cfg = getGachaCfg(gachaName)
    if type(cfg) == "table" and type(cfg.Source) == "string" then
        return cfg.Source
    end
    return nil
end

-- Категории, в которых потенциально лежат награды. Расширяется defensive.
local INV_CATEGORIES = {
    "Units", "Accessories", "Items", "Hakis", "Hair", "Auras", "Mounts", "Swords", "Avatars"
}
local DATA_TOP_CATEGORIES = {
    "Hakis", "Auras", "Haki", "Aura"
}

-- Rarity reward'а: сначала SourceInfo (canonical), потом fallback на Shared.Units.
local function getRewardRarity(rewardName, gachaName)
    local si = getGachaSourceInfo(gachaName)
    if si and type(si[rewardName]) == "table" and si[rewardName].Rarity then
        return si[rewardName].Rarity
    end
    -- fallback
    local su = Omni and Omni.Shared and Omni.Shared.Units
    if type(su) == "table" then
        if type(su.List) == "table" and type(su.List[rewardName]) == "table" then
            return su.List[rewardName].Rarity
        end
        if type(su[rewardName]) == "table" then return su[rewardName].Rarity end
    end
    return nil
end

-- Совместимость со старым именем (старый код звал getUnitRarity).
local getUnitRarity = getRewardRarity

-- Итерация по всем возможным категориям инвентаря игрока.
-- extraCats — дополнительные имена категорий которые нужно проверить
-- (например cfg.Source = "Hakis" для гачи Haki).
-- visit(key, value, categoryName) вызывается для каждого элемента.
local function forEachInventoryEntry(visit, extraCats)
    local data = Omni and Omni.Data
    if type(data) ~= "table" then return end

    -- Собираем список уникальных inventory-категорий
    local invSet, dataSet = {}, {}
    for _, c in ipairs(INV_CATEGORIES) do invSet[c] = true end
    for _, c in ipairs(DATA_TOP_CATEGORIES) do dataSet[c] = true end
    if type(extraCats) == "table" then
        for _, c in ipairs(extraCats) do
            if type(c) == "string" then
                invSet[c] = true
                dataSet[c] = true
            end
        end
    end

    local inv = data.Inventory
    if type(inv) == "table" then
        for cat in pairs(invSet) do
            local t = inv[cat]
            if type(t) == "table" then
                for k, v in pairs(t) do visit(k, v, "Inventory." .. cat) end
            end
        end
    end
    for cat in pairs(dataSet) do
        local t = data[cat]
        if type(t) == "table" then
            for k, v in pairs(t) do visit(k, v, "Data." .. cat) end
        end
    end
end

local function entryName(k, v)
    return (type(v) == "table" and (v.Name or tostring(k))) or tostring(k)
end

local function entryCount(v)
    if type(v) == "number" then return v end
    if type(v) == "table" then
        return v.Count or v.Amount or 1
    end
    return 1
end

-- Считает текущие награды игрока по данной гаче используя SourceInfo как whitelist.
-- Если SourceInfo отсутствует — фолбэк на старую логику (все Inventory.Units).
-- Возвращает (counts={[rarity]=N}, total, foundCategories={[catName]=count}).
-- Сканирует Data.Gacha[gachaName].* — все подполя (Vault, Unlocked и т.д.)
-- Нужно потому что Haki-награды сервер кладёт не в Inventory а сюда.
local function scanGachaVault(gachaName, visit)
    local data = Omni and Omni.Data
    local gd = data and data.Gacha and data.Gacha[gachaName]
    if type(gd) ~= "table" then return end
    for field, val in pairs(gd) do
        if type(val) == "table" then
            for k, v in pairs(val) do
                visit(k, v, "Data.Gacha." .. gachaName .. "." .. tostring(field))
            end
        end
    end
end

local function getMyUnitsByRarity(gachaName)
    local counts = {}
    local total  = 0
    local foundIn = {}

    local si = getGachaSourceInfo(gachaName)
    local sourceCat = getGachaSourceCategory(gachaName)
    local extras = sourceCat and { sourceCat } or nil

    local function hit(k, v, catName)
        local name = entryName(k, v)
        if si[name] then
            local cnt = entryCount(v)
            local r = si[name].Rarity or getRewardRarity(name, gachaName)
            if r then
                counts[r] = (counts[r] or 0) + cnt
                total = total + cnt
                foundIn[catName] = (foundIn[catName] or 0) + cnt
            end
        end
    end

    if type(si) == "table" then
        forEachInventoryEntry(hit, extras)
        scanGachaVault(gachaName, hit)
    else
        -- Fallback: SourceInfo неизвестен — считаем все Units.
        local inv = Omni and Omni.Data and Omni.Data.Inventory
        if type(inv) == "table" and type(inv.Units) == "table" then
            for k, v in pairs(inv.Units) do
                local name = entryName(k, v)
                local cnt  = entryCount(v)
                local r = getRewardRarity(name, gachaName)
                if r then
                    counts[r] = (counts[r] or 0) + cnt
                    total = total + cnt
                    foundIn["Inventory.Units"] = (foundIn["Inventory.Units"] or 0) + cnt
                end
            end
        end
    end
    return counts, total, foundIn
end

-- Возвращает наивысший rarity (по RARITY_ORDER).
local function getMyHighestRarity(gachaName)
    local counts = getMyUnitsByRarity(gachaName)
    local best, bestOrd = nil, 0
    for r, n in pairs(counts) do
        if n > 0 then
            local ord = RARITY_ORDER[r] or 0
            if ord > bestOrd then best, bestOrd = r, ord end
        end
    end
    return best
end

-- Проверяет есть ли у игрока юнит редкости targetRarity или выше.
-- Возвращает (hasIt, owningRarityName).
local function hasRarityOrHigher(gachaName, targetRarity)
    if not targetRarity then return false end
    local targetOrd = RARITY_ORDER[targetRarity] or 0
    if targetOrd == 0 then return false end
    local counts = getMyUnitsByRarity(gachaName)
    -- Берём наивысший rarity который есть (и проверяем >= target)
    local best, bestOrd = nil, 0
    for r, n in pairs(counts) do
        if n > 0 and (RARITY_ORDER[r] or 0) >= targetOrd then
            local ord = RARITY_ORDER[r] or 0
            if ord > bestOrd then best, bestOrd = r, ord end
        end
    end
    if best then return true, best end
    return false
end

local function getMaxGachaPerRoll()
    local u = Omni and Omni.Utils and Omni.Utils.PlayerStats
    if type(u) == "table" then
        for _, fname in ipairs({ "GachaRolls", "MaxGachaRoll", "Rolls" }) do
            if type(u[fname]) == "function" then
                local ok, val = pcall(function() return u[fname](Omni.Data, Omni.Instance) end)
                if ok and type(val) == "number" and val >= 1 then return math.floor(val) end
            end
        end
    end
    return 1
end

-- Snapshot по ВСЕМ категориям. Если передана gachaName — добавляет cfg.Source
-- как дополнительную категорию (напр. "Hakis" для Haki гачи).
-- Ключ — "catName::entryKey".
local function snapshotUnits(gachaName)
    local snap = {}
    local extras = gachaName and getGachaSourceCategory(gachaName)
    local extrasList = extras and { extras } or nil
    local function capture(k, v, catName)
        local fullKey = catName .. "::" .. tostring(k)
        if type(v) == "table" then
            snap[fullKey] = { Count = v.Count, Amount = v.Amount, Name = v.Name, _name = entryName(k, v) }
        elseif type(v) == "number" then
            snap[fullKey] = { _num = v, _name = tostring(k) }
        elseif type(v) == "boolean" then
            snap[fullKey] = { _bool = v, _name = tostring(k) }
        else
            snap[fullKey] = { _name = tostring(k) }
        end
    end
    forEachInventoryEntry(capture, extrasList)
    if gachaName then scanGachaVault(gachaName, capture) end
    return snap
end

local function diffNewUnits(pre, gachaName)
    local out = {}
    local extras = gachaName and getGachaSourceCategory(gachaName)
    local extrasList = extras and { extras } or nil
    local function check(k, v, catName)
        local fullKey = catName .. "::" .. tostring(k)
        local prev = pre[fullKey]
        local name = entryName(k, v)
        if prev == nil then
            table.insert(out, name)
        else
            if type(v) == "table" then
                local oldCount = (prev.Count or prev.Amount or 0)
                local newCount = (v.Count or v.Amount or 0)
                if newCount > oldCount then
                    for _ = 1, (newCount - oldCount) do table.insert(out, name) end
                end
            elseif type(v) == "number" then
                local oldNum = prev._num or 0
                if v > oldNum then
                    for _ = 1, (v - oldNum) do table.insert(out, name) end
                end
            elseif type(v) == "boolean" and v and not prev._bool then
                table.insert(out, name)
            end
        end
    end
    forEachInventoryEntry(check, extrasList)
    if gachaName then scanGachaVault(gachaName, check) end
    return out
end

local function getAllMobsGlobal()
    local shared = Omni and Omni.Shared and Omni.Shared.Enemies
    local set = {}
    if type(shared) == "table" then
        for _, zones in pairs(shared) do
            if type(zones) == "table" then
                for _, list in pairs(zones) do
                    local names = extractMobNames(list)
                    for n in pairs(names) do set[n] = true end
                end
            end
        end
    end
    if next(set) == nil then
        -- fallback: текущая зона
        local folder = getEnemiesFolder()
        if folder then
            for _, m in ipairs(folder:GetChildren()) do set[m.Name] = true end
        end
    end
    local out = {}
    for n in pairs(set) do table.insert(out, n) end
    table.sort(out)
    return out
end

-- STATE
local _gachaStatus  = { phase = "idle", lastRoll = 0, lastNewUnit = "—" }
local _gachaRollThreads = {}   -- { [gachaName] = thread }
local _gachaFarmThread   = nil

-- ROLL THREAD на одну конкретную гачу. Запускается для каждой выбранной.
-- Смотрит СВОЙ target ownership и СВОЮ валюту.
local function startGachaRollThreadFor(gachaName)
    if _gachaRollThreads[gachaName] then return end
    _gachaRollThreads[gachaName] = task.spawn(function()
        local currency = getGachaCurrency(gachaName)
        while getgenv().AutoGacha and getgenv().GachaSelection[gachaName] and not stopped do
            -- Проверка: target rarity уже во владении?
            local targetR = getgenv().GachaTargetRarity
            if targetR then
                local ownedIt, ownedR = hasRarityOrHigher(gachaName, targetR)
                if ownedIt then
                    -- Конкретно эта гача больше не нужна — убираем из selection
                    getgenv().GachaSelection[gachaName] = nil
                    pcall(function()
                        Window:Notify({
                            Title       = "Gacha hit!",
                            Description = ("%s: %s ≥ %s"):format(gachaName, ownedR or "?", targetR),
                            Lifetime    = 6,
                        })
                    end)
                    -- Если никого не осталось — выключаем master
                    if not next(getgenv().GachaSelection) then
                        getgenv().AutoGacha = false
                    end
                    break
                end
            end

            local cost = math.max(1, getGachaCost(gachaName))
            local bal  = getCurrencyBalance(currency)
            local thr  = math.max(cost, tonumber(getgenv().GachaThreshold) or 0)

            if bal >= thr and bal >= cost then
                _gachaStatus.phase = "rolling"
                local maxPer = getMaxGachaPerRoll()
                local canBuy = math.floor(bal / cost)
                local amount = math.min(maxPer, canBuy)
                if amount >= 1 then
                    local pre = snapshotUnits(gachaName)
                    pcall(function()
                        Omni.Signal:Fire("General", "Gacha", "Roll", gachaName, amount)
                    end)
                    _gachaStatus.lastRoll = tick()
                    task.wait(1.0)
                    local dropped = diffNewUnits(pre, gachaName)
                    if #dropped > 0 then
                        _gachaStatus.lastNewUnit = dropped[#dropped] .. " [" .. gachaName .. "]"
                    end
                else
                    task.wait(0.5)
                end
            else
                _gachaStatus.phase = (getgenv().AutoFarm and "waiting (Auto Farm on)") or "waiting"
                task.wait(1.0)
            end
        end
        _gachaRollThreads[gachaName] = nil
        if not next(_gachaRollThreads) then
            _gachaStatus.phase = "idle"
        end
    end)
end

-- FARM THREAD — ОДИН на все гачи. Фармит выбранного моба когда хотя бы
-- одной из активных гач не хватает токенов.
local function startGachaFarmThread()
    if _gachaFarmThread then return end
    _gachaFarmThread = task.spawn(function()
        while getgenv().AutoGacha and not stopped do
            if getgenv().AutoFarm then
                task.wait(1.0)
            else
                -- Нужен ли фарм? Да, если хотя бы у одной выбранной гачи баланс < threshold
                local thr = math.max(1, tonumber(getgenv().GachaThreshold) or 0)
                local needFarm = false
                for gachaName, on in pairs(getgenv().GachaSelection or {}) do
                    if on then
                        local bal = getCurrencyBalance(getGachaCurrency(gachaName))
                        if bal < thr then needFarm = true; break end
                    end
                end
                if not needFarm then
                    task.wait(0.5)
                else
                    local mobName = getgenv().GachaFarmMob
                    if type(mobName) ~= "string" or mobName == "" then
                        task.wait(2)
                    else
                        while (getgenv()._StarBusy or getgenv()._ZoneTpBusy)
                            and getgenv().AutoGacha and not stopped
                        do
                            task.wait(0.1)
                        end

                        local targetSet = { [mobName] = true }
                        local curMap    = Omni.Data and Omni.Data.Map
                        local curZone   = tonumber(Omni.Data and Omni.Data.Zone or 1) or 1
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
                                local mob = candidates[1]
                                if mob and isAlive(mob) then
                                    teleportTo(mob)
                                    task.wait(0.08)
                                    local cd        = getClickCooldown()
                                    local startTime = tick()
                                    local hrp       = getHRP()
                                    while getgenv().AutoGacha
                                        and not stopped
                                        and not getgenv()._StarBusy
                                        and not getgenv()._ZoneTpBusy
                                        and not getgenv().AutoFarm
                                        and isAlive(mob)
                                        and tick() - startTime < 15
                                    do
                                        -- Если все гачи набрали — выходим досрочно
                                        local stillNeed = false
                                        for gn, on in pairs(getgenv().GachaSelection or {}) do
                                            if on and getCurrencyBalance(getGachaCurrency(gn)) < thr then
                                                stillNeed = true; break
                                            end
                                        end
                                        if not stillNeed then break end
                                        local mp = getMobPos(mob)
                                        local my = hrp and hrp.Position
                                        if mp and my and (mp - my).Magnitude > 12 then
                                            teleportTo(mob)
                                            task.wait(0.05)
                                        end
                                        attackOnce()
                                        task.wait(cd)
                                    end
                                end
                            end
                        elseif hasLive then
                            local ok = tpToFurthestVisibleMob()
                            if not ok then
                                getgenv()._ZoneTpBusy = true
                                pcall(function()
                                    Omni.Signal:Fire("Player", "Teleport", "Teleport", curMap, curZone)
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
            end
        end
        _gachaFarmThread = nil
    end)
end

local function startGachaLoop()
    -- Спавн потоков для каждой выбранной гачи
    for gachaName, on in pairs(getgenv().GachaSelection or {}) do
        if on then startGachaRollThreadFor(gachaName) end
    end
    startGachaFarmThread()
end

getgenv().AutoGacha          = getgenv().AutoGacha          or false
getgenv().GachaSelection     = getgenv().GachaSelection     or {}
getgenv().GachaTargetRarity  = getgenv().GachaTargetRarity  or nil
getgenv().GachaThreshold     = getgenv().GachaThreshold     or 100
getgenv().GachaFarmMob       = getgenv().GachaFarmMob       or ""

-- UI
local gachaStatusPara  -- top-level: used by updateGachaStatus() below
do
local GachaTab   = MainTabGroup:Tab({ Name = "Gacha" })
local GachaLeft  = GachaTab:Section({ Side = "Left"  })
local GachaRight = GachaTab:Section({ Side = "Right" })

GachaLeft:Toggle({
    Name     = "Auto Gacha",
    Default  = false,
    Callback = function(s)
        getgenv().AutoGacha = s
        if s then
            -- Проверяем что хоть что-то выбрано
            if not next(getgenv().GachaSelection or {}) then
                getgenv().AutoGacha = false
                pcall(function()
                    Window:Notify({
                        Title       = "No gachas selected",
                        Description = "Сначала выбери гачу в дропдауне ниже",
                        Lifetime    = 4,
                    })
                end)
                return
            end
            -- Уже-во-владении check для КАЖДОЙ выбранной
            local targetR = getgenv().GachaTargetRarity
            if targetR then
                local allOwned = true
                for gn, on in pairs(getgenv().GachaSelection) do
                    if on then
                        local ownedIt = hasRarityOrHigher(gn, targetR)
                        if not ownedIt then allOwned = false; break end
                    end
                end
                if allOwned then
                    getgenv().AutoGacha = false
                    pcall(function()
                        Window:Notify({
                            Title       = "All targets already owned",
                            Description = ("Все выбранные гачи уже ≥ %s — сними или смени target"):format(targetR),
                            Lifetime    = 6,
                        })
                    end)
                    return
                end
            end
            startGachaLoop()
        end
    end,
}, "AutoGachaToggle")

GachaLeft:Dropdown({
    Name     = "Select Gachas (multi)",
    Multi    = true,
    Required = false,
    Options  = getAllGachaNames(),
    Callback = function(values)
        local set = {}
        if type(values) == "table" then
            for k, v in pairs(values) do
                if v and type(k) == "string" then set[k] = true end
            end
        elseif type(values) == "string" and values ~= "" then
            set[values] = true
        end
        getgenv().GachaSelection = set
    end,
})

GachaLeft:Dropdown({
    Name     = "Target Rarity (stop on ≥, per-gacha)",
    Multi    = false,
    Required = false,
    Options  = RARITY_OPTIONS,
    Callback = function(v)
        if type(v) == "string" and v ~= "" then
            getgenv().GachaTargetRarity = v
        else
            getgenv().GachaTargetRarity = nil
        end
    end,
})

pcall(function()
    GachaLeft:Slider({
        Name          = "Min Tokens Before Roll (per-gacha)",
        Default       = 100,
        Minimum       = 0,
        Maximum       = 1000,
        Precision     = 0,
        DisplayMethod = "Value",
        Callback      = function(v)
            getgenv().GachaThreshold = tonumber(v) or 100
        end,
    }, "GachaThresholdSlider")
end)

local gachaMobDropdown = GachaLeft:Dropdown({
    Name     = "Farm Mob (only if Auto Farm OFF)",
    Multi    = false,
    Required = false,
    Options  = getAllMobsGlobal(),
    Callback = function(v)
        if type(v) == "string" then getgenv().GachaFarmMob = v end
    end,
})

GachaLeft:Button({
    Name     = "Refresh Mob List",
    Callback = function()
        pcall(function()
            gachaMobDropdown:ClearOptions()
            gachaMobDropdown:InsertOptions(getAllMobsGlobal())
        end)
    end,
})

GachaLeft:Button({
    Name     = "Roll Selected x1 Each (now)",
    Callback = function()
        task.spawn(function()
            for gachaName, on in pairs(getgenv().GachaSelection or {}) do
                if on then
                    local cost = getGachaCost(gachaName)
                    local bal  = getCurrencyBalance(getGachaCurrency(gachaName))
                    if bal >= cost then
                        pcall(function()
                            Omni.Signal:Fire("General", "Gacha", "Roll", gachaName, 1)
                        end)
                        task.wait(0.5)
                    end
                end
            end
        end)
    end,
})

GachaLeft:Button({
    Name     = "Debug: Dump All Gachas",
    Callback = function()
        local d, buf = newDump()
        d("========== [WF] GACHA DEBUG (all) ==========")
        for _, gachaName in ipairs(getAllGachaNames()) do
            d(("\n=========== %s ==========="):format(gachaName))
            local cfg = getGachaCfg(gachaName)
            local currency = getGachaCurrency(gachaName)
            d(("  Currency: %s  (balance: %d)"):format(currency, getCurrencyBalance(currency)))
            d(("  Cost/roll: %d  Max/roll: %d"):format(getGachaCost(gachaName), getMaxGachaPerRoll()))

            local srcCat = getGachaSourceCategory(gachaName)
            d(("  cfg.Source: %s"):format(tostring(srcCat)))

            local si = getGachaSourceInfo(gachaName)
            if type(si) == "table" then
                local n = 0; for _ in pairs(si) do n = n + 1 end
                d(("  SourceInfo: %d rewards"):format(n))
                local names = {}
                for k in pairs(si) do table.insert(names, k) end
                table.sort(names)
                for _, nm in ipairs(names) do
                    d(("    %s (%s)"):format(nm, tostring(si[nm].Rarity)))
                end
            end

            -- Data.Gacha[name] содержимое
            local data = Omni and Omni.Data and Omni.Data.Gacha
            if type(data) == "table" and type(data[gachaName]) == "table" then
                d(("  Data.Gacha.%s:"):format(gachaName))
                for k, v in pairs(data[gachaName]) do
                    if type(v) == "table" then
                        local n = 0; for _ in pairs(v) do n = n + 1 end
                        d(("    .%s = table (%d keys)"):format(tostring(k), n))
                        if n > 0 and n <= 30 then
                            for k2, v2 in pairs(v) do
                                d(("      [%s] = %s"):format(tostring(k2), tostring(v2)))
                            end
                        end
                    else
                        d(("    .%s = %s"):format(tostring(k), tostring(v)))
                    end
                end
            end

            local counts, total, foundIn = getMyUnitsByRarity(gachaName)
            d(("  My rewards: %d total"):format(total))
            for _, r in ipairs(RARITY_OPTIONS) do
                if counts[r] and counts[r] > 0 then
                    d(("    %s: %d"):format(r, counts[r]))
                end
            end
            if foundIn then
                for k, v in pairs(foundIn) do
                    d(("    found in %s: %d"):format(k, v))
                end
            end
        end
        d("\n=======================================")
        flushDump(buf, "Gacha Debug (all)")
    end,
})

-- ============ Auto Banner / Auto Roulette (GachaRight) ============
-- Discovery helpers: читаем список доступных баннеров и рулеток.
do
local function getAllBannerNames()
    local out = {}
    local d = Omni and Omni.Data and Omni.Data.Banner
    if type(d) == "table" then
        for k in pairs(d) do
            if type(k) == "string" then table.insert(out, k) end
        end
    end
    if #out == 0 then
        local sb = Omni and Omni.Shared and Omni.Shared.Banner
        if type(sb) == "table" then
            for k in pairs(sb) do
                if type(k) == "string" and k ~= "Default" then
                    table.insert(out, k)
                end
            end
        end
    end
    if #out == 0 then out = { "Swords Banner" } end
    table.sort(out)
    return out
end

local function getAllRouletteNames()
    local out = {}
    pcall(function()
        local rs = game:GetService("ReplicatedStorage")
        local r  = rs:FindFirstChild("Omni")
        r = r and r:FindFirstChild("Shared") and r.Shared:FindFirstChild("Roulette")
        if r then
            for _, child in ipairs(r:GetChildren()) do
                if child:IsA("ModuleScript") then table.insert(out, child.Name) end
            end
        end
    end)
    if #out == 0 then out = { "Dragon Wish" } end
    table.sort(out)
    return out
end

GachaRight:Toggle({
    Name     = "Auto Banner Roll",
    Default  = false,
    Callback = function(on)
        getgenv().AutoBannerRoll = on
        if not on then return end
        task.spawn(function()
            while getgenv().AutoBannerRoll and not stopped do
                local name = getgenv().BannerName
                if type(name) == "string" and name ~= "" and shouldFire("banner.roll", 1.0) then
                    if ActivityPriority:CanStart("Banner") then
                        ActivityPriority:SetActivity("Banner")
                        pcall(function()
                            Omni.Signal:Fire("General", "Banner", "Roll", name)
                        end)
                        ActivityPriority:ClearActivity("Banner")
                    end
                end
                task.wait(1.0)
            end
        end)
    end,
}, "AutoBannerRollToggle")

local bannerDropdown = GachaRight:Dropdown({
    Name     = "Banner",
    Multi    = false,
    Required = false,
    Options  = getAllBannerNames(),
    Callback = function(v)
        if type(v) == "string" then getgenv().BannerName = v end
    end,
}, "BannerNameDropdown")

GachaRight:Button({
    Name     = "Refresh Banners",
    Callback = function()
        pcall(function()
            bannerDropdown:ClearOptions()
            bannerDropdown:InsertOptions(getAllBannerNames())
        end)
    end,
})

GachaRight:Toggle({
    Name     = "Auto Roulette Roll",
    Default  = false,
    Callback = function(on)
        getgenv().AutoRouletteRoll = on
        if not on then return end
        task.spawn(function()
            while getgenv().AutoRouletteRoll and not stopped do
                local name = getgenv().RouletteName
                if type(name) == "string" and name ~= "" and shouldFire("roulette.roll", 3.0) then
                    if ActivityPriority:CanStart("Roulette") then
                        ActivityPriority:SetActivity("Roulette")
                        pcall(function()
                            Omni.Signal:Fire("General", "Roulette", "Roll", name)
                        end)
                        ActivityPriority:ClearActivity("Roulette")
                    end
                end
                task.wait(3.0)
            end
        end)
    end,
}, "AutoRouletteRollToggle")

local rouletteDropdown = GachaRight:Dropdown({
    Name     = "Roulette",
    Multi    = false,
    Required = false,
    Options  = getAllRouletteNames(),
    Callback = function(v)
        if type(v) == "string" then getgenv().RouletteName = v end
    end,
}, "RouletteNameDropdown")

GachaRight:Button({
    Name     = "Refresh Roulettes",
    Callback = function()
        pcall(function()
            rouletteDropdown:ClearOptions()
            rouletteDropdown:InsertOptions(getAllRouletteNames())
        end)
    end,
})

getgenv().AutoBannerRoll    = getgenv().AutoBannerRoll    or false
getgenv().AutoRouletteRoll  = getgenv().AutoRouletteRoll  or false
getgenv().BannerName        = getgenv().BannerName        or ""
getgenv().RouletteName      = getgenv().RouletteName      or ""
end -- end Banner/Roulette do-block

-- Status (assigns to top-level local declared above do block)
gachaStatusPara = GachaRight:Paragraph({
    Header = "Status",
    Body   = "—",
})
end -- end of Gacha UI do-block

local function updateGachaStatus()
    if not gachaStatusPara then return end
    local mp = getMaxGachaPerRoll()
    local thr = tonumber(getgenv().GachaThreshold) or 0
    local tr  = getgenv().GachaTargetRarity or "any"
    local mob = getgenv().GachaFarmMob or ""

    local selected = getgenv().GachaSelection or {}
    local selNames = {}
    for n, on in pairs(selected) do
        if on then table.insert(selNames, n) end
    end
    table.sort(selNames)

    local lines = {
        "Auto Gacha: " .. (getgenv().AutoGacha and "ON" or "OFF"),
        "Phase: " .. tostring(_gachaStatus.phase),
        (getgenv().AutoFarm and "Farming: handled by Auto Farm"
            or ("Farming: internal (mob=" .. (mob == "" and "—" or mob) .. ")")),
        ("Max/roll: %d   Threshold: %d   Target: %s"):format(mp, thr, tr),
        ("Last drop: %s"):format(_gachaStatus.lastNewUnit or "—"),
        "",
    }
    if #selNames == 0 then
        table.insert(lines, "Selected: — (выбери хотя бы одну гачу)")
    else
        table.insert(lines, "Selected: " .. table.concat(selNames, ", "))
        table.insert(lines, "")
        for _, gn in ipairs(selNames) do
            local currency = getGachaCurrency(gn)
            local bal      = getCurrencyBalance(currency)
            local cost     = getGachaCost(gn)
            local canRoll  = bal >= math.max(cost, thr)
            local counts, total = getMyUnitsByRarity(gn)
            local best = getMyHighestRarity(gn) or "—"
            local siOk = getGachaSourceInfo(gn) ~= nil

            local activeTag = (_gachaRollThreads and _gachaRollThreads[gn]) and "▶" or "○"
            table.insert(lines, ("%s %s  (cost %d)"):format(activeTag, gn, cost))
            table.insert(lines, ("   %s: %d %s"):format(currency, bal, canRoll and "✓" or "…"))
            table.insert(lines, ("   My: %d total | best: %s %s")
                :format(total, best, siOk and "✓" or "(no SI)"))

            if total > 0 then
                local parts = {}
                for _, r in ipairs(RARITY_OPTIONS) do
                    if counts[r] and counts[r] > 0 then
                        table.insert(parts, ("%s:%d"):format(r, counts[r]))
                    end
                end
                if #parts > 0 then
                    table.insert(lines, "   " .. table.concat(parts, "  "))
                end
            end
        end
    end
    pcall(function() gachaStatusPara:UpdateBody(table.concat(lines, "\n")) end)
end

-- =========================================================
-- [7g] UI — Misc Tab (Walk Speed, Disable Anti-AFK, etc.)
-- =========================================================
local MiscTab   = MainTabGroup:Tab({ Name = "Misc" })
local MiscLeft  = MiscTab:Section({ Side = "Left"  })
local MiscRight = MiscTab:Section({ Side = "Right" })

-- Walk Speed slider — сохраняется через Humanoid:GetPropertyChangedSignal
-- чтобы сервер не сбрасывал
do
    local currentSpeed = 16
    local walkSpeedConn
    local function applyWalkSpeed(char)
        if walkSpeedConn then walkSpeedConn:Disconnect(); walkSpeedConn = nil end
        local hum = char:WaitForChild("Humanoid", 5)
        if not hum then return end
        hum.WalkSpeed = currentSpeed
        walkSpeedConn = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if hum.WalkSpeed ~= currentSpeed then hum.WalkSpeed = currentSpeed end
        end)
    end

    pcall(function()
        MiscLeft:Slider({
            Name          = "Walk Speed",
            Default       = 16,
            Minimum       = 16,
            Maximum       = 200,
            Precision     = 0,
            DisplayMethod = "Value",
            Callback      = function(v)
                currentSpeed = tonumber(v) or 16
                if LocalPlayer.Character then applyWalkSpeed(LocalPlayer.Character) end
            end,
        }, "WalkSpeedSlider")
    end)

    LocalPlayer.CharacterAdded:Connect(applyWalkSpeed)
    if LocalPlayer.Character then applyWalkSpeed(LocalPlayer.Character) end
end

-- Disable Game Anti-AFK toggle — вызывает killGameAntiAfk() и периодически пере-применяет
do
    local disableAntiAfkEnabled = false
    local disableAntiAfkLoop

    MiscLeft:Toggle({
        Name     = "Disable Game Anti-AFK",
        Default  = false,
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
                pcall(function()
                    Window:Notify({
                        Title       = "Anti-AFK disabled",
                        Description = "Game's anti-AFK (Reconnect on idle) отключён. 24/7 farm OK.",
                        Lifetime    = 4,
                    })
                end)
            else
                if disableAntiAfkLoop then
                    pcall(task.cancel, disableAntiAfkLoop)
                    disableAntiAfkLoop = nil
                end
                -- Восстанавливаем игровую настройку обратно
                pcall(function() fire("General", "Settings", "Set", "Anti Afk", true) end)
            end
        end,
    }, "DisableGameAntiAfkToggle")
end

-- Info label справа
local miscInfoPara = MiscRight:Paragraph({
    Header = "Info",
    Body   =
        "Walk Speed: slider слева.\n" ..
        "Anti-AFK: отключает игровой kick-after-15min. Client-side idle bypass работает всегда (безусловно).\n" ..
        "\n" ..
        "Client-side anti-idle активен ВСЕГДА (нельзя отключить — это базовая защита).\n" ..
        "Toggle здесь управляет только game-level Anti-AFK.",
})

-- ============ Auto Potions ============
-- Discovery: зелья из Omni.Shared.Items.Potion (имена зелий).
-- Логика: раз в 5с для каждого выбранного зелья проверить:
--   (a) Data.UsedPotions[name]           — если активно сейчас, пропускаем
--   (b) Data.Inventory.Potions[name] > 0 — если есть в инвентаре
--  Если оба ок — fire UsePotion.
do
local function getAllPotionNames()
    local out = {}
    local p = Omni and Omni.Shared and Omni.Shared.Items and Omni.Shared.Items.Potion
    if type(p) == "table" then
        for k in pairs(p) do
            if type(k) == "string" then table.insert(out, k) end
        end
    end
    table.sort(out)
    return out
end

local function isPotionActive(name)
    local up = Omni and Omni.Data and Omni.Data.UsedPotions
    if type(up) ~= "table" then return false end
    local v = up[name]
    if v == nil then return false end
    if type(v) == "table" then
        -- обычно: {EndTime=<tick>, Amount=N} — активно если EndTime > tick()
        local et = v.EndTime or v.endTime or v.ExpiresAt
        if type(et) == "number" then return et > tick() end
        return next(v) ~= nil
    end
    return v == true or (type(v) == "number" and v > 0)
end

local function getPotionCount(name)
    local inv = Omni and Omni.Data and Omni.Data.Inventory and Omni.Data.Inventory.Potions
    if type(inv) ~= "table" then return 0 end
    local v = inv[name]
    if type(v) == "number" then return v end
    if type(v) == "table" then
        return tonumber(v.Amount or v.Count or v.Quantity) or 0
    end
    return 0
end

MiscRight:Header({ Text = "Auto Potions" })

MiscRight:Toggle({
    Name     = "Auto Use Potions",
    Default  = false,
    Callback = function(on)
        getgenv().AutoPotions = on
        if not on then return end
        task.spawn(function()
            while getgenv().AutoPotions and not stopped do
                for potionName, enabled in pairs(getgenv().PotionSelection or {}) do
                    if enabled and not isPotionActive(potionName) and getPotionCount(potionName) > 0 then
                        if shouldFire("potion." .. potionName, 2) then
                            pcall(function()
                                Omni.Signal:Fire("General", "Items", "UsePotion", potionName, 1)
                            end)
                            task.wait(0.5)
                        end
                    end
                end
                task.wait(5)
            end
        end)
    end,
}, "AutoPotionsToggle")

local potionDropdown = MiscRight:Dropdown({
    Name     = "Potions to use (multi)",
    Multi    = true,
    Required = false,
    Options  = getAllPotionNames(),
    Callback = function(values)
        local set = {}
        if type(values) == "table" then
            for k, v in pairs(values) do
                if v and type(k) == "string" then set[k] = true end
            end
        end
        getgenv().PotionSelection = set
    end,
}, "PotionSelectionDropdown")

MiscRight:Button({
    Name     = "Refresh Potion List",
    Callback = function()
        pcall(function()
            potionDropdown:ClearOptions()
            potionDropdown:InsertOptions(getAllPotionNames())
        end)
    end,
})

-- ============ Auto Codes ============
-- Раз в 5 мин прогоняет список известных кодов через Redeem.
-- Сервер отклонит уже-использованные коды тихо — не страшно.
local KNOWN_CODES = {
    "RELEASE", "WORLDFIGHTERS", "FREE100", "UPDATE1", "DEV", "ADMIN",
    "WELCOME", "SHUTDOWN", "THXSUB", "100KLIKES", "1MVISITS", "SORRY",
    "FIX", "BUGFIX", "20KLIKES", "50KLIKES", "1KLIKES", "5KLIKES",
    "10KLIKES", "200KLIKES", "500KLIKES",
}

MiscRight:Header({ Text = "Auto Codes" })

MiscRight:Toggle({
    Name     = "Auto Redeem Codes (every 5min)",
    Default  = false,
    Callback = function(on)
        getgenv().AutoCodes = on
        if not on then return end
        task.spawn(function()
            while getgenv().AutoCodes and not stopped do
                for _, code in ipairs(KNOWN_CODES) do
                    pcall(function()
                        Omni.Signal:Fire("General", "Codes", "Redeem", code)
                    end)
                    task.wait(0.4)
                end
                -- spin sleep 300s с проверкой флага каждые 2s
                local waited = 0
                while getgenv().AutoCodes and not stopped and waited < 300 do
                    task.wait(2)
                    waited = waited + 2
                end
            end
        end)
    end,
}, "AutoCodesToggle")

MiscRight:Button({
    Name     = "Redeem Now",
    Callback = function()
        task.spawn(function()
            for _, code in ipairs(KNOWN_CODES) do
                pcall(function()
                    Omni.Signal:Fire("General", "Codes", "Redeem", code)
                end)
                task.wait(0.4)
            end
        end)
    end,
})

getgenv().AutoPotions      = getgenv().AutoPotions      or false
getgenv().PotionSelection  = getgenv().PotionSelection  or {}
getgenv().AutoCodes        = getgenv().AutoCodes        or false
end -- end Potions/Codes do-block

-- =========================================================
-- [7h] UI — Webhook Tab (Discord drop logger)
-- =========================================================
-- Шлёт Discord webhook при новом предмете в инвентаре ИЛИ новом юните в
-- Data.Gacha.<name>.Vault. Фильтры по rarity + category. Ping через Discord ID
-- для заданных редкостей.

local webhookStatusPara  -- top-level: used by updateWebhookStatus() below
do
local WebhookTab   = MainTabGroup:Tab({ Name = "Webhook" })
local WebhookLeft  = WebhookTab:Section({ Side = "Left"  })
local WebhookRight = WebhookTab:Section({ Side = "Right" })

-- HTTP request function (exploit-specific)
local webhookRequest = http_request or request
    or (syn and syn.request) or (http and http.request)

local RARITY_COLORS = {
    Common    = 0xADB5BD, Uncommon  = 0x4C956C, Rare      = 0x3498DB,
    Epic      = 0x9B59B6, Legendary = 0xFFD700, Mythical  = 0xE74C3C,
    Secret    = 0xFFFFFF, Limited   = 0xFF8C00, Exclusive = 0xFF00FF,
}

local WEBHOOK_STATE = {
    url             = "",
    discordId       = "",
    enabled         = false,
    selectedRarities   = { Mythical = true, Secret = true, Legendary = true, Limited = true, Exclusive = true },
    selectedCategories = { Units = true, Swords = true, Accessories = true, Mounts = true, Avatars = true, Hakis = true },
    pingRarities    = { Mythical = true, Secret = true, Limited = true, Exclusive = true },
    snapshot        = {},
    listeners       = {},
    sentCount       = 0,
    lastSent        = nil,
}

local function whShouldLog(category, rarity)
    if WEBHOOK_STATE.selectedCategories[category] ~= true then return false end
    if rarity and WEBHOOK_STATE.selectedRarities[rarity] == false then
        -- если есть хотя бы одна включённая rarity-галочка — фильтруем строго
        local anyOn = false
        for _, v in pairs(WEBHOOK_STATE.selectedRarities) do
            if v == true then anyOn = true; break end
        end
        if anyOn then return false end
    end
    return true
end

local function whSendDiscord(itemName, category, rarity, extra)
    if WEBHOOK_STATE.url == "" or not webhookRequest then return end
    local color = RARITY_COLORS[rarity] or 0xFFFFFF

    local pingText = ""
    if WEBHOOK_STATE.discordId ~= "" and rarity and WEBHOOK_STATE.pingRarities[rarity] then
        pingText = "<@" .. WEBHOOK_STATE.discordId .. ">"
    end

    local fields = {
        { name = "Item",     value = tostring(itemName), inline = true },
        { name = "Category", value = tostring(category), inline = true },
        { name = "Rarity",   value = tostring(rarity or "?"), inline = true },
        { name = "Player",   value = LocalPlayer.Name,     inline = true },
    }
    if extra then
        for k, v in pairs(extra) do
            table.insert(fields, { name = tostring(k), value = tostring(v), inline = true })
        end
    end

    local body = HttpService:JSONEncode({
        content = pingText,
        embeds  = { {
            title     = (rarity or "?") .. " — " .. tostring(itemName),
            color     = color,
            fields    = fields,
            footer    = { text = "WF Hub" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        } },
    })

    pcall(function()
        webhookRequest({
            Url     = WEBHOOK_STATE.url,
            Method  = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body    = body,
        })
    end)
    WEBHOOK_STATE.sentCount = WEBHOOK_STATE.sentCount + 1
    WEBHOOK_STATE.lastSent  = itemName .. " (" .. tostring(rarity or "?") .. ")"
end

-- Извлекаем rarity предмета из всех возможных путей
local function whGetRarity(category, name, item)
    if type(item) == "table" then
        if item.Rarity then return item.Rarity end
        if item.rarity then return item.rarity end
    end
    -- Unified rarity lookup через наш getRewardRarity (поддерживает SourceInfo)
    if category == "Hakis" or category:find("Gacha") then
        for _, gname in ipairs({ "Haki", "Fruit", "Dragon Power", "Slime Power", "Race" }) do
            local si = getGachaSourceInfo(gname)
            if si and si[name] then return si[name].Rarity end
        end
    end
    -- fallback — пробуем Shared[category].List[name].Rarity
    if Omni and Omni.Shared and Omni.Shared[category] then
        local cfg = Omni.Shared[category]
        if type(cfg) == "table" then
            if cfg[name] and type(cfg[name]) == "table" and cfg[name].Rarity then
                return cfg[name].Rarity
            end
            if type(cfg.List) == "table" and type(cfg.List[name]) == "table" then
                return cfg.List[name].Rarity
            end
        end
    end
    return "Unknown"
end

-- Снапшот — ключом служит `cat::name`
local function whSnapshot()
    local snap = {}
    local data = Omni and Omni.Data
    if type(data) ~= "table" then return snap end

    -- Inventory.* категории
    if type(data.Inventory) == "table" then
        for cat, items in pairs(data.Inventory) do
            if type(items) == "table" then
                for k, item in pairs(items) do
                    local name = (type(item) == "table" and (item.Name or item.name)) or tostring(k)
                    snap[cat .. "::" .. tostring(k)] = true
                end
            end
        end
    end

    -- Data.Gacha.<name>.Vault — сюда падают Haki и т.п.
    if type(data.Gacha) == "table" then
        for gname, gdata in pairs(data.Gacha) do
            if type(gdata) == "table" and type(gdata.Vault) == "table" then
                for vname in pairs(gdata.Vault) do
                    snap["Gacha." .. gname .. "::" .. tostring(vname)] = true
                end
            end
        end
    end
    return snap
end

local function whProcessDiff(oldSnap, newSnap)
    for key in pairs(newSnap) do
        if not oldSnap[key] then
            -- Новый ключ
            local prefix, name = key:match("^(.-)::(.+)$")
            if prefix and name then
                local cat = prefix
                -- для Gacha.Haki используем category = "Hakis" (канон)
                if prefix:match("^Gacha%.") then
                    local gachaName = prefix:match("^Gacha%.(.+)$")
                    if gachaName == "Haki"        then cat = "Hakis"
                    elseif gachaName == "Fruit"   then cat = "Fruits"
                    else cat = gachaName .. " (Gacha)" end
                end

                local rarity = whGetRarity(cat, name, nil)
                if whShouldLog(cat, rarity) then
                    task.spawn(function() whSendDiscord(name, cat, rarity, nil) end)
                end
            end
        end
    end
end

local function whPollingLoop()
    while WEBHOOK_STATE.enabled and not stopped do
        task.wait(2)
        local newSnap = whSnapshot()
        whProcessDiff(WEBHOOK_STATE.snapshot, newSnap)
        WEBHOOK_STATE.snapshot = newSnap
    end
end

local function startWebhookEngine()
    if not webhookRequest then
        pcall(function()
            Window:Notify({
                Title       = "Webhook",
                Description = "http_request недоступен у твоего executor'а",
                Lifetime    = 5,
            })
        end)
        return false
    end
    if WEBHOOK_STATE.url == "" then
        pcall(function()
            Window:Notify({
                Title       = "Webhook",
                Description = "Сначала вставь URL!",
                Lifetime    = 4,
            })
        end)
        return false
    end
    WEBHOOK_STATE.snapshot = whSnapshot()
    task.spawn(whPollingLoop)
    return true
end

-- UI
WebhookLeft:Input({
    Name        = "Webhook URL",
    Default     = "",
    Placeholder = "https://discord.com/api/webhooks/…",
    Callback    = function(v) WEBHOOK_STATE.url = tostring(v or "") end,
})

WebhookLeft:Input({
    Name        = "Discord User ID (for ping)",
    Default     = "",
    Placeholder = "123456789012345678",
    Callback    = function(v) WEBHOOK_STATE.discordId = tostring(v or "") end,
})

WebhookLeft:Dropdown({
    Name     = "Log Rarities",
    Multi    = true,
    Required = false,
    Options  = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythical", "Secret", "Limited", "Exclusive" },
    Callback = function(v)
        local set = {}
        if type(v) == "table" then
            for k, on in pairs(v) do if on and type(k) == "string" then set[k] = true end end
        end
        WEBHOOK_STATE.selectedRarities = next(set) and set or { Mythical = true, Secret = true, Legendary = true }
    end,
})

WebhookLeft:Dropdown({
    Name     = "Log Categories",
    Multi    = true,
    Required = false,
    Options  = { "Units", "Swords", "Accessories", "Mounts", "Avatars", "Hakis", "Fruits" },
    Callback = function(v)
        local set = {}
        if type(v) == "table" then
            for k, on in pairs(v) do if on and type(k) == "string" then set[k] = true end end
        end
        WEBHOOK_STATE.selectedCategories = next(set) and set or { Units = true, Hakis = true }
    end,
})

WebhookLeft:Dropdown({
    Name     = "Ping Me On (rarities)",
    Multi    = true,
    Required = false,
    Options  = { "Legendary", "Mythical", "Secret", "Limited", "Exclusive" },
    Callback = function(v)
        local set = {}
        if type(v) == "table" then
            for k, on in pairs(v) do if on and type(k) == "string" then set[k] = true end end
        end
        WEBHOOK_STATE.pingRarities = set
    end,
})

WebhookLeft:Toggle({
    Name     = "Enable Webhook",
    Default  = false,
    Callback = function(on)
        WEBHOOK_STATE.enabled = on
        if on then
            local ok = startWebhookEngine()
            if not ok then
                WEBHOOK_STATE.enabled = false
            else
                pcall(function()
                    Window:Notify({
                        Title       = "Webhook enabled",
                        Description = "Monitoring new items…",
                        Lifetime    = 3,
                    })
                end)
            end
        end
    end,
}, "EnableWebhookToggle")

WebhookLeft:Button({
    Name     = "Send Test Message",
    Callback = function()
        task.spawn(function()
            whSendDiscord("Test Item", "Debug", "Legendary", { Note = "Webhook test from WF Hub" })
            pcall(function()
                Window:Notify({
                    Title       = "Webhook test",
                    Description = "Отправлен тестовый embed (проверь Discord)",
                    Lifetime    = 3,
                })
            end)
        end)
    end,
})

-- Status
webhookStatusPara = WebhookRight:Paragraph({
    Header = "Status",
    Body   = "—",
})
end -- end of Webhook UI do-block

local function updateWebhookStatus()
    if not webhookStatusPara then return end
    local lines = {
        "Enabled: " .. (WEBHOOK_STATE.enabled and "ON" or "OFF"),
        "http_request: " .. (webhookRequest and "available ✓" or "MISSING ✗"),
        ("URL: %s"):format(WEBHOOK_STATE.url ~= "" and "set" or "—"),
        ("Discord ID: %s"):format(WEBHOOK_STATE.discordId ~= "" and "set" or "—"),
        ("Sent: %d"):format(WEBHOOK_STATE.sentCount),
        ("Last: %s"):format(WEBHOOK_STATE.lastSent or "—"),
    }
    pcall(function() webhookStatusPara:UpdateBody(table.concat(lines, "\n")) end)
end

-- =========================================================
-- [7j] UI — Progression Tab
-- =========================================================
-- Fires:
--   Auto Progression       → General/Progression/Upgrade/<name>
--   Auto Trial Upgrades    → General/Upgrade/Upgrade/"Trial Upgrades"/<name>
--   Auto Skill Tree        → General/SkillTree/Unlock/<tree>/<node>   (parent-aware, multi-pass)
--   Auto Equip Best        → General/<cat>/EquipBest/<stat>
--   Auto Index All         → General/Index/Set/<cat>/<item>/<nextVal>

local ProgressTab   = MainTabGroup:Tab({ Name = "Progress" })
local ProgressLeft  = ProgressTab:Section({ Side = "Left"  })
local ProgressRight = ProgressTab:Section({ Side = "Right" })

do
-- ============ Auto Progression ============
local function getAllProgressionNames()
    local out = {}
    local p = Omni and Omni.Shared and Omni.Shared.Progression and Omni.Shared.Progression.List
    if type(p) == "table" then
        for k in pairs(p) do
            if type(k) == "string" then table.insert(out, k) end
        end
    end
    table.sort(out)
    return out
end

ProgressLeft:Header({ Text = "Progression" })

ProgressLeft:Toggle({
    Name     = "Auto Progression (spam Upgrade)",
    Default  = false,
    Callback = function(on)
        getgenv().AutoProgression = on
        if not on then return end
        task.spawn(function()
            while getgenv().AutoProgression and not stopped do
                for prog, enabled in pairs(getgenv().ProgressionSelection or {}) do
                    if enabled then
                        pcall(function()
                            Omni.Signal:Fire("General", "Progression", "Upgrade", prog)
                        end)
                        task.wait(0.3)
                    end
                end
                task.wait(2)
            end
        end)
    end,
}, "AutoProgressionToggle")

local progDropdown = ProgressLeft:Dropdown({
    Name     = "Progressions (multi)",
    Multi    = true,
    Required = false,
    Options  = getAllProgressionNames(),
    Callback = function(values)
        local set = {}
        if type(values) == "table" then
            for k, v in pairs(values) do
                if v and type(k) == "string" then set[k] = true end
            end
        end
        getgenv().ProgressionSelection = set
    end,
}, "ProgressionSelectionDropdown")

ProgressLeft:Button({
    Name     = "Refresh Progressions",
    Callback = function()
        pcall(function()
            progDropdown:ClearOptions()
            progDropdown:InsertOptions(getAllProgressionNames())
        end)
    end,
})
end do -- scope break to release locals

-- ============ Auto Trial Upgrades ============
local function getAllTrialUpgradeNames()
    local out = {}
    local u = Omni and Omni.Shared and Omni.Shared.Upgrade
    local tu = u and u["Trial Upgrades"]
    local list = tu and tu.Upgrades
    if type(list) == "table" then
        for k in pairs(list) do
            if type(k) == "string" then table.insert(out, k) end
        end
    end
    if #out == 0 then
        out = { "Power", "Attack Distance", "Crystals", "Attack Speed", "Damage" }
    end
    table.sort(out)
    return out
end

ProgressLeft:Header({ Text = "Trial Upgrades" })

ProgressLeft:Toggle({
    Name     = "Auto Trial Upgrades",
    Default  = false,
    Callback = function(on)
        getgenv().AutoTrialUpgrades = on
        if not on then return end
        task.spawn(function()
            while getgenv().AutoTrialUpgrades and not stopped do
                for up, enabled in pairs(getgenv().TrialUpgradeSelection or {}) do
                    if enabled then
                        pcall(function()
                            Omni.Signal:Fire("General", "Upgrade", "Upgrade", "Trial Upgrades", up)
                        end)
                        task.wait(0.3)
                    end
                end
                task.wait(3)
            end
        end)
    end,
}, "AutoTrialUpgradesToggle")

local trialUpDropdown = ProgressLeft:Dropdown({
    Name     = "Trial Upgrades (multi)",
    Multi    = true,
    Required = false,
    Options  = getAllTrialUpgradeNames(),
    Callback = function(values)
        local set = {}
        if type(values) == "table" then
            for k, v in pairs(values) do
                if v and type(k) == "string" then set[k] = true end
            end
        end
        getgenv().TrialUpgradeSelection = set
    end,
}, "TrialUpgradeSelectionDropdown")
end do -- scope break

-- ============ Auto Skill Tree (parent-aware, multi-pass) ============
local function getAllSkillTreeNames()
    local out = {}
    local st = Omni and Omni.Shared and Omni.Shared.SkillTree and Omni.Shared.SkillTree.List
    if type(st) == "table" then
        for k in pairs(st) do
            if type(k) == "string" then table.insert(out, k) end
        end
    end
    table.sort(out)
    return out
end

local function isNodeUnlocked(treeName, nodeName)
    local d = Omni and Omni.Data and Omni.Data.SkillTree
    if type(d) ~= "table" then return false end
    local tree = d[treeName]
    if type(tree) ~= "table" then return false end
    local v = tree[nodeName]
    if v == nil then return false end
    if type(v) == "boolean" then return v end
    if type(v) == "number" then return v > 0 end
    if type(v) == "table" then
        if v.Unlocked == true then return true end
        if type(v.Level) == "number" and v.Level > 0 then return true end
    end
    return false
end

local function getTreeNodes(treeName)
    local st = Omni and Omni.Shared and Omni.Shared.SkillTree and Omni.Shared.SkillTree.List
    local tree = st and st[treeName]
    if type(tree) ~= "table" then return nil end
    -- Список нод: если есть tree.Nodes — берём оттуда; иначе сам tree.
    return tree.Nodes or tree.List or tree
end

ProgressRight:Header({ Text = "Skill Tree" })

ProgressRight:Toggle({
    Name     = "Auto Skill Tree (parent-aware)",
    Default  = false,
    Callback = function(on)
        getgenv().AutoSkillTree = on
        if not on then return end
        task.spawn(function()
            while getgenv().AutoSkillTree and not stopped do
                local progressed = false
                for treeName, enabled in pairs(getgenv().SkillTreeSelection or {}) do
                    if enabled then
                        local nodes = getTreeNodes(treeName)
                        if type(nodes) == "table" then
                            -- multi-pass: в одном цикле прогоняем до 10 проходов, пока есть что разлочить
                            for pass = 1, 10 do
                                if not (getgenv().AutoSkillTree and not stopped) then break end
                                local anyThisPass = false
                                for nodeName, nodeData in pairs(nodes) do
                                    local skip = (type(nodeName) ~= "string")
                                        or isNodeUnlocked(treeName, nodeName)

                                    -- Проверка parent: если есть Parent и он НЕ unlock'нут — пропуск
                                    if not skip then
                                        local parent
                                        if type(nodeData) == "table" then
                                            parent = nodeData.Parent or nodeData.Requires or nodeData.RequiresNode
                                        end
                                        if parent and not isNodeUnlocked(treeName, parent) then
                                            skip = true
                                        end
                                    end

                                    if not skip then
                                        pcall(function()
                                            Omni.Signal:Fire("General", "SkillTree", "Unlock", treeName, nodeName)
                                        end)
                                        anyThisPass = true
                                        progressed  = true
                                        task.wait(0.4)  -- ждём Replica propagation
                                    end
                                end
                                if not anyThisPass then break end
                            end
                        end
                    end
                end
                task.wait(progressed and 5 or 15)
            end
        end)
    end,
}, "AutoSkillTreeToggle")

local skillTreeDropdown = ProgressRight:Dropdown({
    Name     = "Skill Trees (multi)",
    Multi    = true,
    Required = false,
    Options  = getAllSkillTreeNames(),
    Callback = function(values)
        local set = {}
        if type(values) == "table" then
            for k, v in pairs(values) do
                if v and type(k) == "string" then set[k] = true end
            end
        end
        getgenv().SkillTreeSelection = set
    end,
}, "SkillTreeSelectionDropdown")

ProgressRight:Button({
    Name     = "Refresh Skill Trees",
    Callback = function()
        pcall(function()
            skillTreeDropdown:ClearOptions()
            skillTreeDropdown:InsertOptions(getAllSkillTreeNames())
        end)
    end,
})
end do -- scope break

-- ============ Auto Equip Best ============
local EQUIP_CATS = { "Swords", "Units", "Accessories", "Avatars", "Mounts", "Gacha" }
local EQUIP_STATS = { "Power", "Damage", "Crystals", "Drops", "Luck", "Attack Speed" }

ProgressRight:Header({ Text = "Auto Equip" })

ProgressRight:Toggle({
    Name     = "Auto Equip Best",
    Default  = false,
    Callback = function(on)
        getgenv().AutoEquipBest = on
        if not on then return end
        task.spawn(function()
            while getgenv().AutoEquipBest and not stopped do
                local stat = getgenv().EquipBestStat
                if type(stat) == "string" and stat ~= "" then
                    for cat, enabled in pairs(getgenv().EquipBestCategories or {}) do
                        if enabled and shouldFire("equip." .. cat, 5) then
                            pcall(function()
                                Omni.Signal:Fire("General", cat, "EquipBest", stat)
                            end)
                            task.wait(0.25)
                        end
                    end
                end
                task.wait(30)
            end
        end)
    end,
}, "AutoEquipBestToggle")

ProgressRight:Dropdown({
    Name     = "Equip Stat",
    Multi    = false,
    Required = false,
    Options  = EQUIP_STATS,
    Callback = function(v)
        if type(v) == "string" then getgenv().EquipBestStat = v end
    end,
}, "EquipBestStatDropdown")

ProgressRight:Dropdown({
    Name     = "Equip Categories (multi)",
    Multi    = true,
    Required = false,
    Options  = EQUIP_CATS,
    Callback = function(values)
        local set = {}
        if type(values) == "table" then
            for k, v in pairs(values) do
                if v and type(k) == "string" then set[k] = true end
            end
        end
        getgenv().EquipBestCategories = set
    end,
}, "EquipBestCategoriesDropdown")

ProgressRight:Button({
    Name     = "Equip Best Now",
    Callback = function()
        local stat = getgenv().EquipBestStat
        if type(stat) ~= "string" or stat == "" then return end
        for cat, enabled in pairs(getgenv().EquipBestCategories or {}) do
            if enabled then
                pcall(function()
                    Omni.Signal:Fire("General", cat, "EquipBest", stat)
                end)
                task.wait(0.2)
            end
        end
    end,
})
end do -- scope break

-- ============ Auto Index All Owned ============
local INDEX_CATS = { "Units", "Swords", "Accessories", "Mounts", "Avatars" }

ProgressLeft:Header({ Text = "Index" })

ProgressLeft:Toggle({
    Name     = "Auto Index All Owned",
    Default  = false,
    Callback = function(on)
        getgenv().AutoIndex = on
        if not on then return end
        task.spawn(function()
            while getgenv().AutoIndex and not stopped do
                local inv = Omni and Omni.Data and Omni.Data.Inventory
                local index = Omni and Omni.Shared and Omni.Shared.Index
                if type(inv) == "table" and type(index) == "table" and index.GetNextValueForIdentifier then
                    for _, cat in ipairs(INDEX_CATS) do
                        local items = inv[cat]
                        if type(items) == "table" then
                            for itemKey, itemData in pairs(items) do
                                if not (getgenv().AutoIndex and not stopped) then break end
                                local name = (type(itemData) == "table" and itemData.Name) or itemKey
                                if type(name) == "string" then
                                    local okGet, nextVal = pcall(function()
                                        return index.GetNextValueForIdentifier(cat, name, Omni.Data)
                                    end)
                                    if okGet and nextVal ~= nil then
                                        if shouldFire("index." .. cat .. "." .. name, 30) then
                                            pcall(function()
                                                Omni.Signal:Fire("General", "Index", "Set", cat, name, nextVal)
                                            end)
                                            task.wait(0.1)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait(60)
            end
        end)
    end,
}, "AutoIndexToggle")

ProgressLeft:Paragraph({
    Header = "Index info",
    Body   =
        "Индексирует все owned items в Units/Swords/Accessories/Mounts/Avatars.\n" ..
        "Каждые 60с проходит по инвентарю и выставляет next value через\n" ..
        "Shared.Index.GetNextValueForIdentifier. Завершение Index даёт бонусы\n" ..
        "(stat boosts, новые слоты). Throttle 30с per-item.",
})

getgenv().AutoProgression           = getgenv().AutoProgression           or false
getgenv().ProgressionSelection      = getgenv().ProgressionSelection      or {}
getgenv().AutoTrialUpgrades         = getgenv().AutoTrialUpgrades         or false
getgenv().TrialUpgradeSelection     = getgenv().TrialUpgradeSelection     or {}
getgenv().AutoSkillTree             = getgenv().AutoSkillTree             or false
getgenv().SkillTreeSelection        = getgenv().SkillTreeSelection        or {}
getgenv().AutoEquipBest             = getgenv().AutoEquipBest             or false
getgenv().EquipBestStat             = getgenv().EquipBestStat             or ""
getgenv().EquipBestCategories       = getgenv().EquipBestCategories       or {}
getgenv().AutoIndex                 = getgenv().AutoIndex                 or false
end -- end Progression tab do-block

-- =========================================================
-- [7i] UI — Settings Tab
-- =========================================================
local SettingsTab   = MainTabGroup:Tab({ Name = "Settings" })
local SettingsLeft  = SettingsTab:Section({ Side = "Left"  })
local SettingsRight = SettingsTab:Section({ Side = "Right" })

SettingsLeft:Header({ Text = "UI" })

pcall(function()
    SettingsLeft:Slider({
        Name          = "UI Size",
        Default       = 0.85,
        Minimum       = 0.5,
        Maximum       = 2.0,
        Precision     = 2,
        DisplayMethod = "Value",
        Callback      = function(v)
            pcall(function() Window:SetScale(v) end)
        end,
    }, "UISizeSlider")
end)

-- GlobalSetting (blur + notifications) — вынесем отдельным task.spawn после
-- инициализации потому что MacLib создаёт эти элементы на окне, а не на табе
task.spawn(function()
    task.wait(0.15)
    pcall(function()
        if Window.GlobalSetting then
            Window:GlobalSetting({
                Name     = "UI Blur",
                Default  = (Window.GetAcrylicBlurState and Window:GetAcrylicBlurState()) or false,
                Callback = function(b) pcall(function() Window:SetAcrylicBlurState(b) end) end,
            })
            Window:GlobalSetting({
                Name     = "Notifications",
                Default  = (Window.GetNotificationsState and Window:GetNotificationsState()) or true,
                Callback = function(b) pcall(function() Window:SetNotificationsState(b) end) end,
            })
        end
    end)
end)

SettingsLeft:Button({
    Name     = "Unload Hub",
    Callback = function() pcall(getgenv()._WF_Stop) end,
})

SettingsRight:Header({ Text = "Info" })
SettingsRight:Paragraph({
    Header = "World Fighters Hub",
    Body   =
        "Version: v0.37\n" ..
        "Framework: Omni (BridgeNet wrapper)\n" ..
        "Toggle UI: LeftCtrl\n" ..
        "Drag: free window (DragStyle=2)\n" ..
        "\n" ..
        "Конфиг сохраняется автоматом в workspace/ApelHub/\n" ..
        "после первого Save Config (или при включении auto-load).",
})

-- =========================================================
-- [8] AUTO-REFRESH LOOP (динамический — фолдер меняется при смене зоны)
-- =========================================================
local folderConns = {}

local function clearFolderConns()
    for _, c in ipairs(folderConns) do pcall(function() c:Disconnect() end) end
    table.clear(folderConns)
end

-- Dropdown теперь из мобов ТЕКУЩЕЙ зоны. Обновляем его при:
--  (A) появлении/исчезновении мобов в текущей папке (ChildAdded/ChildRemoved)
--  (B) смене карты/зоны (Omni:OnDataChanged на Map/Zone)
-- Debounce 2с чтобы не дёргать перестроение на каждую смерть.
local _refreshDebounceAt = 0
local function debouncedRefresh()
    local now = tick()
    if now - _refreshDebounceAt < 2 then return end
    _refreshDebounceAt = now
    task.defer(refreshDropdown)
end

local function attachFolderListeners()
    clearFolderConns()
    local f = getEnemiesFolder()
    if not f then return end
    table.insert(folderConns, f.ChildAdded:Connect(function()
        task.wait(0.2)
        debouncedRefresh()
    end))
    table.insert(folderConns, f.ChildRemoved:Connect(function()
        task.defer(debouncedRefresh)
    end))
end
attachFolderListeners()

-- При смене зоны/карты: переподписываемся на новую папку + перестраиваем дропдаун
pcall(function()
    local c1 = Omni:OnDataChanged({ "Map" }, function()
        task.wait(0.2)
        attachFolderListeners()
        debouncedRefresh()
    end)
    local c2 = Omni:OnDataChanged({ "Zone" }, function()
        task.wait(0.2)
        attachFolderListeners()
        debouncedRefresh()
    end)
    -- OnDataChanged может возвращать connection — добавим в общий cleanup, если он disconnect'абельный
    for _, c in ipairs({ c1, c2 }) do
        if typeof(c) == "RBXScriptConnection" or (type(c) == "table" and c.Disconnect) then
            table.insert(connections, c)
        end
    end
end)

task.spawn(function()
    while not stopped do
        task.wait(1)
        updateStatus()
        updatePlayerInfo()
        updateChestStatus()
        updateEggStatus()
        updateQuestStatus()
        updateTrialStatus()
        updateGachaStatus()
        updateWebhookStatus()
    end
end)

-- =========================================================
-- [9] UNLOAD
-- =========================================================
getgenv()._WF_Stop = function()
    stopped = true
    getgenv().AutoFarm      = false
    getgenv().AutoOpenStar  = false
    getgenv().AutoQuest     = false
    getgenv().AutoTrial     = false
    getgenv().AutoGacha     = false
    getgenv().GachaSelection = {}
    getgenv()._StarBusy     = false
    getgenv()._ZoneTpBusy   = false
    -- Webhook off
    if WEBHOOK_STATE then
        WEBHOOK_STATE.enabled = false
        for _, c in ipairs(WEBHOOK_STATE.listeners or {}) do
            pcall(function() c:Disconnect() end)
        end
        WEBHOOK_STATE.listeners = {}
    end
    for _, c in ipairs(connections) do
        pcall(function() c:Disconnect() end)
    end
    table.clear(connections)
    clearFolderConns()
    pcall(function() Window:Unload() end)
end

pcall(function()
    local f = getEnemiesFolder()
    Window:Notify({
        Title       = "World Fighters Hub",
        Description = ("Загружен. Мобов в зоне: %d"):format(f and #f:GetChildren() or 0),
        Lifetime    = 4,
    })
end)

-- Минимайзер (иконка справа у края экрана чтоб вернуть окно)
task.spawn(function()
    task.wait(0.25)
    pcall(function()
        if Window.CreateMinimizer then
            Window:CreateMinimizer({
                Size     = UDim2.fromOffset(50, 50),
                Position = UDim2.new(1, -10, 0.5, 0),
                Icon     = "rbxassetid://138310609771261",
            })
        end
    end)
end)

-- Конфиг персистентность (MacLib fork). Флаги на toggle'ах/слайдерах сохраняют
-- состояние между сессиями. LoadAutoLoadConfig вызывается в конце, чтобы ВСЕ
-- элементы UI уже были созданы до загрузки сохранённых значений.
pcall(function()
    if MacLib.SetFolder then MacLib:SetFolder("ApelHub") end
    if MacLib.LoadAutoLoadConfig then MacLib:LoadAutoLoadConfig() end
end)

warn(("[WF] Hub v0.37 loaded. %d mobs detected."):format(#(getEnemiesFolder() and getEnemiesFolder():GetChildren() or {})))
