-- ╔══════════════════════════════════════════════════════════════╗
-- ║                [NEW] WORLD FIGHTERS — APEL HUB                 ║
-- ║   PlaceId 95630541662383  ·  Framework: Omni (BridgeNet wrap)  ║
-- ╚══════════════════════════════════════════════════════════════╝

-- // 1. CLEANUP
if getgenv()._WFRunning then getgenv()._WFRunning = false task.wait(0.5) end
if getgenv()._WFStop    then pcall(getgenv()._WFStop) end
if getgenv()._WFUI      then pcall(function() getgenv()._WFUI:Unload() end) end
if getgenv()._WFCleanup then pcall(getgenv()._WFCleanup) end
getgenv()._WFRunning = true

local _cleanupConns = {}
getgenv()._WFCleanup = function()
    for _, c in ipairs(_cleanupConns) do pcall(function() c:Disconnect() end) end
    table.clear(_cleanupConns)
end

-- // 2. SERVICES & VARIABLES
local Players          = game:GetService("Players")
local RS               = game:GetService("ReplicatedStorage")
local HttpService      = game:GetService("HttpService")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser      = game:GetService("VirtualUser")
local Workspace        = game:GetService("Workspace")

local _cachedRequest = (syn and syn.request) or (http and http.request) or http_request or request

if not game:IsLoaded() then game.Loaded:Wait() end
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do task.wait() LocalPlayer = Players.LocalPlayer end

local GameName = "World Fighters"

-- State namespace — everything feature-related lives here.
local _WF = {}
_WF.EnableDebug    = false
_WF.ModulesLoaded  = false

-- Farm
_WF.AutoFarmEnabled = false
_WF.Targets         = {}    -- { [mobName] = true }
-- TP offset: Vector3.new(3, 2, 0) — +3 X (сбоку от моба), +2 Y (над), 0 Z.
-- Из рабочей версии: оптимально для DD (не выкидывает из arena bounds) и
-- обычных зон (не клипает через стены). Заменяет предыдущий (0,4,4) который
-- иногда ставил слишком высоко/далеко в узких гейммодах.
_WF.TpOffset        = Vector3.new(3, 2, 0)
_WF.FillerRadius    = 80    -- studs (радиус поиска ближайшего живого при простое)
-- NoClip: проходим сквозь стены/пол во время фарма. Критично для Dragon Defense
-- (arena имеет стены/barriers, TP на мобов может уронить игрока за пределы).
-- Режимы:
--   "off"   — всегда выкл
--   "auto"  — вкл во время Trial/DD/обычного фарма (default)
--   "on"    — всегда вкл
_WF.NoClipMode      = "auto"

-- Auto Click — 20 Hz fire (0.05с) на General/Attack/Click. Обходит игровой
-- gamepass-cooldown (без gamepass игра режет до 0.5с). Работает независимо
-- от Auto Farm: можно стоять около моба и бить, без TP. attackOnce() сам
-- игнорит пустой EnemiesOnRangeIds, так что в фоне практически бесплатно.
_WF.AutoClickEnabled = false

-- Eggs (Stars)
_WF.AutoOpenStarEnabled = false
_WF.StarTargets         = {}
_WF.StarBusy            = false   -- mutex for star TP

-- Quests
_WF.AutoQuestEnabled         = false
_WF.AutoPinQuestEnabled      = true
_WF.AutoTpToQuestZoneEnabled = true
_WF.QuestSelections          = {}

-- Trials
_WF.AutoTrialEnabled     = false
_WF.TrialSelections      = {}
_WF.TrialAutoLeaveWave   = 0
-- После leaveTrial() серверная сессия gamemode НЕ очищается (игра не имеет
-- сигнала "Leave"). Физически уходим, но сервер держит Data.Gamemode=name до
-- natural end. Флаг чтобы не спамить leaveTrial в цикле.
_WF.TrialAbandoned       = false
-- Dragon Defense (отдельный event-gamemode в табе Trials)
_WF.AutoDragonDefenseEnabled = false
_WF.DragonDefenseLeaveWave   = 0  -- 0 = пройти до конца, >0 = выход на волне
_WF.DragonDefenseAbandoned   = false
-- Tempest Invasion (event-gamemode, требует Slime Key, аналог Dragon Defense)
_WF.AutoTempestInvasionEnabled = false
_WF.TempestInvasionLeaveWave   = 0  -- 0 = full run, >0 = выход на волне
_WF.TempestInvasionAbandoned   = false
-- Приоритет когда включены два или больше из (Auto Trial + Auto DD + Auto TI):
--   "Trial"           — делаем трайлы, остальные ждут
--   "DragonDefense"   — делаем DD, остальные ждут (default, у DD требуется ключ)
--   "TempestInvasion" — делаем TI, остальные ждут (требует Slime Key)
_WF.GamemodePriority = "DragonDefense"
-- Saved player position (для возврата после трайлов/DD на точное место фарма)
_WF.SavedPosition     = nil  -- CFrame
_WF.SavedLocation     = nil  -- "Fruits Verse | Zone 4"

-- Gacha
_WF.AutoGachaEnabled     = false
_WF.GachaSelection       = {}
_WF.GachaTargetRarity    = nil
_WF.GachaThreshold       = 100
_WF.GachaFarmMob         = ""
_WF.AutoBannerRollEnabled   = false
_WF.BannerName           = ""
_WF.AutoRouletteRollEnabled = false
_WF.RouletteName         = ""

-- Rewards
_WF.AutoAchievementsEnabled  = false
_WF.AutoTimeRewardsEnabled   = false
_WF.AutoDailyRewardsEnabled  = false
_WF.AutoFollowRewardsEnabled = false
_WF.AutoDailyChestEnabled    = false
_WF.AutoGroupChestEnabled    = false
_WF.AutoVIPChestEnabled      = false

-- Progression
_WF.AutoProgressionEnabled   = false
_WF.ProgressionSelection     = {}
_WF.AutoTrialUpgradesEnabled = false
_WF.TrialUpgradeSelection    = {}
_WF.AutoTempestUpgradesEnabled = false
_WF.TempestUpgradeSelection    = {}
_WF.AutoSkillTreeEnabled     = false
_WF.SkillTreeSelection       = {}
_WF.AutoEquipBestEnabled     = false
_WF.EquipBestStat            = ""
_WF.EquipBestCategories      = {}

-- Misc
_WF.WalkSpeed                = 16
_WF.DisableGameAntiAfkEnabled = false
_WF.AutoPotionsEnabled       = false
_WF.PotionSelection          = {}
_WF.AutoCodesEnabled         = false

-- Webhook
_WF.WebhookEnabled           = false
_WF.WebhookURL               = ""
_WF.WebhookDiscordUserId     = ""
_WF.WebhookRarityFilter      = {}
_WF.WebhookPingOnMythical    = false
_WF.WebhookSentCount         = 0
_WF.WebhookLastSent          = nil

-- Mutex for zone TP (conflicts with star TP and gacha mob-farm TP)
_WF.ZoneTpBusy = false
-- Mutex: когда мы внутри trial'а (AutoTrial активен + игрок реально в gamemode),
-- блокируем farm/egg/quest чтобы они не дёргали HRP и не портили прохождение волн.
_WF.TrialBusy  = false
-- Race-window mutex: set ПЕРЕД Fire("General","Gamemodes","Join", ...) и снимается
-- когда Data.Gamemode появилось (или таймаут 5с). Без него Auto Farm в эту 1-2с
-- дыру видит "не в трайле, в зоне нет таргетов" → ТП в свою фарм-зону →
-- выкидывает нас из трайла В МОМЕНТ захода. Тот же гейт уважают Star loop и Quest.
_WF.GamemodeJoinBusy = false

-- File system
local RootFolder = "ApelHub"
if not isfolder(RootFolder) then makefolder(RootFolder) end

-- // 3. HELPERS
-- Forward declaration — Notify is assigned in section 6 (UI setup)
local Notify
local function dbg(msg)
    if _WF.EnableDebug then print("[WF] " .. tostring(msg)) end
end

local function safe(fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then dbg("error: " .. tostring(err)) end
    return ok, err
end

local function awaitChild(parent, name, timeout)
    if not parent then return nil end
    return parent:WaitForChild(name, timeout or 8)
end

-- ═══════════════════════════════════════════════════════════════════
-- SafeWrapParagraph — workaround для MacSploit / executors которые теряют
-- Plugin-capability через ~10 сек после инжекта. Без обёртки `:UpdateBody`
-- (который внутри делает TextLabel.Text=X) тихо фейлит с "lacking capability
-- Plugin" — paragraph застывает и перестаёт обновляться.
-- Обёртка роутит апдейты на RunService.Heartbeat:Once (privileged thread).
-- Использовать для любого paragraph который апдейтится в task.spawn цикле.
-- ═══════════════════════════════════════════════════════════════════
local RunService = game:GetService("RunService")
local function wrapParagraph(p)
    if not p then return p end
    local origUpdateBody   = p.UpdateBody
    local origUpdateHeader = p.UpdateHeader
    local origSetVis       = p.SetVisibility

    local pendingBody, pendingHeader, pendingVis
    local scheduled = false
    local function flush()
        scheduled = false
        if pendingBody ~= nil then
            local b = pendingBody; pendingBody = nil
            pcall(origUpdateBody, p, b)
        end
        if pendingHeader ~= nil then
            local h = pendingHeader; pendingHeader = nil
            pcall(origUpdateHeader, p, h)
        end
        if pendingVis ~= nil then
            local v = pendingVis; pendingVis = nil
            pcall(origSetVis, p, v)
        end
    end
    local function schedule()
        if scheduled then return end
        scheduled = true
        RunService.Heartbeat:Once(flush)
    end
    function p:UpdateBody(text)   pendingBody = text;     schedule() end
    function p:UpdateHeader(text) pendingHeader = text;   schedule() end
    function p:SetVisibility(v)   pendingVis = v;         schedule() end
    return p
end

-- ═══════════════════════════════════════════════════════════════════
-- Saved Position System — JSON-persisted CFrame для возврата после трайлов/DD.
-- Юзер фармит в определённой зоне → заходит в event-gamemode → выходит → возвращаем
-- на ту же координату. Лучше чем fallback TP в Fruits Verse 1.
-- ═══════════════════════════════════════════════════════════════════
local HttpService = game:GetService("HttpService")

local function savePositionToFile(cframe, location)
    if not cframe then return end
    local data = {
        position = { x = cframe.Position.X, y = cframe.Position.Y, z = cframe.Position.Z },
        location = location or "Unknown"
    }
    safe(function()
        if not isfolder("ApelHub") then makefolder("ApelHub") end
        if not isfolder("ApelHub/saved_positions") then makefolder("ApelHub/saved_positions") end
        writefile("ApelHub/saved_positions/WorldFighters.json", HttpService:JSONEncode(data))
    end)
end

local function loadPositionFromFile()
    local ok, raw = pcall(function()
        return readfile("ApelHub/saved_positions/WorldFighters.json")
    end)
    if not ok or not raw then return nil, nil end
    local ok2, decoded = pcall(function() return HttpService:JSONDecode(raw) end)
    if not ok2 or type(decoded) ~= "table" or type(decoded.position) ~= "table" then return nil, nil end
    local p = decoded.position
    return CFrame.new(p.x or 0, p.y or 0, p.z or 0), decoded.location or "Unknown"
end

-- Парсит "Fruits Verse | Zone 4 | Trial" → mapName="Fruits Verse", zoneIdx=4
local function parseSavedLocation(loc)
    if type(loc) ~= "string" then return nil, nil end
    local m, z = loc:match("^(.-)%s*|%s*Zone%s*(%d+)")
    if m and z then return m, tonumber(z) end
    return nil, nil
end

-- Надёжный TP: TP в нужную зону если не там → ждём респавн персонажа → ставим CFrame
-- с retry (сервер может отбросить physics'ом). ~8с макс.
-- TP на сохранённую позицию. Ключевой инсайт из рабочей версии:
-- 1. ВСЕГДА фаирим Teleport signal — даже если Data.Map/Zone совпадают.
--    Это гарантирует что сервер снимет Gamemode status.
--    Если savedLocation == lobby-зоне трайла (типично), и мы "TP в себя" без
--    этого signal'а — сервер не поймёт что надо выйти из гейммода.
-- 2. Ждём 4 сек — за это время сервер выгружает gamemode, снимает Data.Gamemode,
--    respawn'ит новый character, завершает Results screen.
-- 3. ПОТОМ ставим HRP.CFrame (до 3 попыток с 0.3с между ними).
local function tpToSavedPosition()
    if not _WF.SavedPosition then return false end
    local targetMap, targetZone = parseSavedLocation(_WF.SavedLocation)
    if not targetMap then
        targetMap = "Fruits Verse"
        targetZone = 1
    end

    -- [1] Всегда fire — не пропускаем по match'у Data.Map
    safe(function()
        _WF.Omni.Signal:Fire("Player", "Teleport", "Teleport", targetMap, targetZone or 1)
    end)

    -- [2] 4 секунды на серверную обработку: выгрузка gamemode, respawn, Results
    task.wait(4)

    -- [3] Ставим HRP на точную сохранённую позицию (до 3 попыток)
    local targetPos = _WF.SavedPosition.Position
    for _ = 1, 3 do
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp and hrp.Parent and not hrp.Anchored then
            safe(function() hrp.CFrame = _WF.SavedPosition end)
            task.wait(0.3)
            if hrp.Parent and (hrp.Position - targetPos).Magnitude < 25 then
                return true
            end
        else
            task.wait(0.3)
        end
    end
    return false
end

-- Load at script start
do
    local cf, loc = loadPositionFromFile()
    if cf then _WF.SavedPosition = cf; _WF.SavedLocation = loc end
end

-- ── ActivityPriority — coordinates features that can't run simultaneously ──
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

-- ── Throttle: prevents spam of the same remote ──
_WF._lastFire = {}
local function shouldFire(key, minInterval)
    local t = _WF._lastFire[key]
    if t and tick() - t < (minInterval or 1) then return false end
    _WF._lastFire[key] = tick()
    return true
end

-- ── Dump helpers: buffer debug output into a string, copy to clipboard + print ──
-- Example:
--   local d, buf = newDump()
--   d("line 1"); d("line 2")
--   flushDump(buf, "Gacha Debug")  -- copies to clipboard, prints, notifies
local function newDump()
    local buf = { lines = {} }
    local function d(s) table.insert(buf.lines, tostring(s)) end
    return d, buf
end

local function flushDump(buf, label)
    local text = table.concat(buf.lines, "\n")
    print(text)
    local copied = false
    if setclipboard then
        local ok = pcall(setclipboard, text)
        copied = ok
    elseif toclipboard then
        local ok = pcall(toclipboard, text)
        copied = ok
    end
    Notify((label or "Debug") .. (copied and " copied to clipboard" or " printed (clipboard unavailable)"), 4)
end

-- ── Character helpers ──
local function getChar()
    return LocalPlayer.Character
end

local function getHRP()
    local ch = LocalPlayer.Character
    if not ch then return nil end
    -- В момент respawn'а HRP на ~0.3s отсутствует — возвращаем nil, пусть луп ретраит,
    -- а не блокируемся на CharacterAdded:Wait() внутри 15-секундного attack-лупа.
    return ch:FindFirstChild("HumanoidRootPart") or ch:FindFirstChild("Torso")
end

-- ── Enemy/mob helpers ──
-- Real mob data lives in workspace.Server.Enemies.World[Map][Zone]:GetChildren()
function _WF.getEnemiesFolder()
    local sv = Workspace:FindFirstChild("Server")              if not sv    then return nil end
    local en = sv:FindFirstChild("Enemies")                    if not en    then return nil end
    local wr = en:FindFirstChild("World")                      if not wr    then return nil end
    local mapName = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Map
    if not mapName then return nil end
    local mf = wr:FindFirstChild(mapName)                      if not mf    then return nil end
    local zoneIdx = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Zone
    if zoneIdx == nil then return nil end
    local zf = mf:FindFirstChild(tostring(zoneIdx))            if not zf    then return nil end
    return zf
end

function _WF.isAlive(mob)
    if not mob or not mob.Parent then return false end
    local hp = mob:GetAttribute("Health")
    if type(hp) == "number" then return hp > 0 end
    -- Fallback: Humanoid
    local h = mob:FindFirstChildOfClass("Humanoid")
    return h and h.Health > 0
end

function _WF.getMobHP(mob)
    if not mob then return nil end
    local hp = mob:GetAttribute("Health")
    if type(hp) == "number" then return hp end
    local h = mob:FindFirstChildOfClass("Humanoid")
    return h and h.Health
end

function _WF.getMobPos(mob)
    if not mob or not mob.Parent then return nil end
    local pos
    -- ВАЖНО: в этой игре мобы — Part, а не Model. Доступ к mob.PrimaryPart на Part'е
    -- выкидывает ошибку (property не существует на этом классе). Поэтому сначала IsA.
    if mob:IsA("BasePart") then
        pos = mob.Position
    elseif mob:IsA("Model") then
        local root = mob:FindFirstChild("HumanoidRootPart") or mob.PrimaryPart
        if root then
            pos = root.Position
        else
            local ok, piv = pcall(function() return mob:GetPivot().Position end)
            if ok and piv then
                pos = piv
            else
                local part = mob:FindFirstChildWhichIsA("BasePart")
                if part then pos = part.Position end
            end
        end
    else
        -- Неизвестный класс (Folder, etc) — пробуем найти первый BasePart-потомок
        local part = mob:FindFirstChildWhichIsA("BasePart")
        if part then pos = part.Position end
    end
    -- StreamingEnabled: выгруженные парты репортят Position около (0,0,0).
    -- Возвращаем nil — иначе ТП кинет персонажа под карту.
    if not pos or pos.Magnitude < 0.5 then return nil end
    return pos
end

function _WF.teleportTo(mob)
    local hrp = getHRP()
    if not hrp then return false end
    local pos = _WF.getMobPos(mob)
    if not pos then return false end
    hrp.CFrame = CFrame.new(pos + _WF.TpOffset)
    return true
end

function _WF.attackOnce()
    if not (_WF.Omni and _WF.Omni.Signal) then return end
    if not _WF.Omni.Cache then return end   -- рано, Cache ещё не готов
    local ids = _WF.Omni.Cache:Get({"EnemiesOnRangeIds"}) or {}
    -- EnemiesOnRangeIds — это DICTIONARY ({[mob_id]=true, ...}), не array.
    -- В Luau # на хэш-таблицу всегда возвращает 0, поэтому проверяем через next().
    -- Раньше тут было `if #ids == 0 then return end` — функция всегда выходила
    -- рано, и Auto Click не работал. Auto Farm маскировал это благодаря teleportTo().
    if type(ids) ~= "table" or not next(ids) then return end
    safe(function()
        _WF.Omni.Signal:Fire("General", "Attack", "Click", ids)
    end)
end

-- Безопасный Join в gamemode. Ставит мьютекс ПЕРЕД Fire, снимает после того
-- как Data.Gamemode реально появился (или после timeout). Все loop'ы (Farm,
-- Star, Quest) видят флаг и не дёргают HRP в окне Join. Возвращает true если
-- сервер подтвердил вход.
function _WF.fireGamemodeJoin(modeName, timeout)
    timeout = timeout or 5
    if not (_WF.Omni and _WF.Omni.Signal) then return false end
    _WF.GamemodeJoinBusy = true
    safe(function()
        _WF.Omni.Signal:Fire("General", "Gamemodes", "Join", modeName)
    end)
    local deadline = tick() + timeout
    while tick() < deadline do
        local d = _WF.Omni.Data
        if d and d.Gamemode == modeName then break end
        task.wait(0.1)
    end
    _WF.GamemodeJoinBusy = false
    local d = _WF.Omni.Data
    return d and d.Gamemode == modeName
end

function _WF.getClickCooldown()
    local u = _WF.Omni and _WF.Omni.Utils and _WF.Omni.Utils.PlayerStats
    if type(u) == "table" and type(u.ClickCooldown) == "function" then
        local ok, v = pcall(function()
            return u.ClickCooldown(_WF.Omni.Data, _WF.Omni.Instance)
        end)
        if ok and type(v) == "number" and v > 0 then return v end
    end
    return 0.15
end

-- Вытащить MaxHP моба из Omni.Shared.Enemies конфига (структура варьируется:
-- dict name→cfg, array of {Name=...,Health=...}, или array of strings без HP).
function _WF.getMobMaxHPFromConfig(mobName)
    local shared = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Enemies
    if type(shared) ~= "table" then return nil end
    local function readHP(cfg)
        if type(cfg) ~= "table" then return nil end
        for _, k in ipairs({ "MaxHealth", "Health", "MaxHP", "HP", "HealthAmount", "MaxHp" }) do
            if type(cfg[k]) == "number" then return cfg[k] end
        end
        for _, parent in ipairs({ "Stats", "BaseStats", "Data" }) do
            if type(cfg[parent]) == "table" then
                for _, k in ipairs({ "MaxHealth", "Health", "MaxHP", "HP" }) do
                    if type(cfg[parent][k]) == "number" then return cfg[parent][k] end
                end
            end
        end
        return nil
    end
    for _, zones in pairs(shared) do
        if type(zones) == "table" then
            for _, list in pairs(zones) do
                if type(list) == "table" then
                    -- Словарь: list[mobName] = cfg
                    local dictCfg = list[mobName]
                    local hp = readHP(dictCfg)
                    if hp then return hp end
                    -- Массив: {Name=mobName, Health=...}
                    for _, v in pairs(list) do
                        if type(v) == "table" and v.Name == mobName then
                            local h = readHP(v)
                            if h then return h end
                        end
                    end
                end
            end
        end
    end
    return nil
end

-- Fallback: снять MaxHealth с любого живого экземпляра в текущей зоне.
function _WF.getMobMaxHPFromLive(mobName)
    local folder = _WF.getEnemiesFolder()
    if not folder then return nil end
    for _, m in ipairs(folder:GetChildren()) do
        if m.Name == mobName then
            local v = m:GetAttribute("MaxHealth") or m:GetAttribute("Health")
            if type(v) == "number" and v > 0 then return v end
        end
    end
    return nil
end

-- Универсальная сортировка имён мобов по MaxHP ascending. Без HP → в конец, alpha tiebreak.
function _WF.sortMobNamesByHP(names)
    local hpCache = {}
    for _, n in ipairs(names) do
        hpCache[n] = _WF.getMobMaxHPFromConfig(n) or _WF.getMobMaxHPFromLive(n) or math.huge
    end
    table.sort(names, function(a, b)
        if hpCache[a] == hpCache[b] then return a < b end
        return hpCache[a] < hpCache[b]
    end)
    return names
end

-- List all mob names in current zone (sorted by HP ascending)
function _WF.getMobsInCurrentZone()
    local out = {}
    local folder = _WF.getEnemiesFolder()
    if not folder then return out end
    local seen = {}
    for _, m in ipairs(folder:GetChildren()) do
        if not seen[m.Name] then
            seen[m.Name] = true
            table.insert(out, m.Name)
        end
    end
    return _WF.sortMobNamesByHP(out)
end

-- List all mob names across all zones (from Shared.Enemies config, sorted by HP ascending)
function _WF.getAllMobsGlobal()
    local set = {}
    local shared = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Enemies
    if type(shared) == "table" then
        for _, zones in pairs(shared) do
            if type(zones) == "table" then
                for _, list in pairs(zones) do
                    if type(list) == "table" then
                        for k, v in pairs(list) do
                            local nm
                            if type(v) == "string" then nm = v
                            elseif type(v) == "table" and type(v.Name) == "string" then nm = v.Name
                            elseif type(k) == "string" then nm = k
                            end
                            if nm then set[nm] = true end
                        end
                    end
                end
            end
        end
    end
    if next(set) == nil then
        for _, n in ipairs(_WF.getMobsInCurrentZone()) do set[n] = true end
    end
    local out = {}
    for n in pairs(set) do table.insert(out, n) end
    return _WF.sortMobNamesByHP(out)
end

-- Extract mob names from a zone config table (can be array or name-keyed dict)
function _WF.extractMobNames(list)
    local out = {}
    if type(list) ~= "table" then return out end
    for k, v in pairs(list) do
        if type(v) == "string" then out[v] = true
        elseif type(v) == "table" and type(v.Name) == "string" then out[v.Name] = true
        elseif type(k) == "string" then out[k] = true
        end
    end
    return out
end

-- Get mob names configured for a specific map/zone
function _WF.getMobsInZoneConfig(mapName, zoneIdx)
    local shared = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Enemies
    if type(shared) ~= "table" then return {} end
    local mapConfig = shared[mapName]
    if type(mapConfig) ~= "table" then return {} end
    local zoneConfig = mapConfig[tostring(zoneIdx)] or mapConfig[zoneIdx]
    if type(zoneConfig) ~= "table" then return {} end
    return _WF.extractMobNames(zoneConfig)
end

-- Check if any selected target is configured to spawn in this zone
function _WF.anyTargetInZoneConfig(targetSet, mapName, zoneIdx)
    local zoneMobs = _WF.getMobsInZoneConfig(mapName, zoneIdx)
    for n in pairs(targetSet) do
        if zoneMobs[n] then return true end
    end
    return false
end

-- Check current-zone folder: are there live/ready targets?
-- Returns (hasReady, hasLive). Ready = in streaming range. Live = config-listed
-- but may be culled due to distance.
function _WF.hasReadyTargetsInCurrentZone(targetSet)
    local folder = _WF.getEnemiesFolder()
    if not folder then return false, false end
    local hasReady, hasLive = false, false
    for _, mob in ipairs(folder:GetChildren()) do
        if targetSet[mob.Name] then
            hasLive = true
            if _WF.isAlive(mob) and _WF.getMobPos(mob) then
                hasReady = true
                break
            end
        end
    end
    return hasReady, hasLive
end

-- TP to the furthest visible mob (un-stalls Roblox streaming to load new mobs)
function _WF.tpToFurthestVisibleMob()
    local folder = _WF.getEnemiesFolder()
    if not folder then return false end
    local hrp = getHRP(); if not hrp then return false end
    local myPos = hrp.Position
    local best, bestDist = nil, 0
    for _, mob in ipairs(folder:GetChildren()) do
        local mp = _WF.getMobPos(mob)
        if mp then
            local d = (mp - myPos).Magnitude
            if d > bestDist then best, bestDist = mob, d end
        end
    end
    if best then
        _WF.teleportTo(best)
        return true
    end
    return false
end

-- Helper: max HP конкретной инстанции моба (live attribute приоритет, config fallback).
function _WF.getMobInstanceMaxHP(mob)
    local m = mob:GetAttribute("MaxHealth")
    if type(m) == "number" and m > 0 then return m end
    local h = mob:GetAttribute("Health")
    if type(h) == "number" and h > 0 then return h end
    return _WF.getMobMaxHPFromConfig(mob.Name)
end

-- Find nearest LIVE mob (any name) in the current zone within radius.
-- Used by Filler farm: когда target недоступен — бьём ближайшего любого живого.
function _WF.findNearestLiveMob(radius)
    local folder = _WF.getEnemiesFolder()
    if not folder then return nil end
    local hrp = getHRP(); if not hrp then return nil end
    local myPos = hrp.Position
    local best, bestDist = nil, radius or 80
    for _, mob in ipairs(folder:GetChildren()) do
        if _WF.isAlive(mob) then
            local p = _WF.getMobPos(mob)
            if p then
                local d = (p - myPos).Magnitude
                if d < bestDist then
                    best, bestDist = mob, d
                end
            end
        end
    end
    return best
end

-- Find EASIER mob for filler: HP below the weakest selected target, closest-by-HP.
-- Идея: пока ждём respawn нашего Big Boss'а (HP = X), набиваем убивы на мобе с HP = X-ε.
-- Берём моба с максимальным HP среди тех у кого HP строго ниже таргета — это "самый похожий
-- по сложности" моб (Insane ближе к Боссу чем King). Радиус НЕ ограничиваем — мы всё равно
-- телепортируемся, а при ограничении 80 studs упускались мобы в 150+ studs.
function _WF.findEasierMob(targetSet, _unusedRadius)
    local folder = _WF.getEnemiesFolder()
    if not folder then return nil end

    -- Нижняя граница "таргет HP" = минимум по всем выбранным таргетам.
    local targetMinHP
    for name in pairs(targetSet or {}) do
        local hp = _WF.getMobMaxHPFromConfig(name) or _WF.getMobMaxHPFromLive(name)
        if type(hp) == "number" then
            if not targetMinHP or hp < targetMinHP then targetMinHP = hp end
        end
    end
    if not targetMinHP then
        dbg("findEasierMob: no HP for target → fallback to nearest")
        return _WF.findNearestLiveMob(_WF.FillerRadius)
    end

    local best, bestHP = nil, -1
    local considered = 0
    for _, mob in ipairs(folder:GetChildren()) do
        if _WF.isAlive(mob) and not (targetSet and targetSet[mob.Name]) then
            local p = _WF.getMobPos(mob)
            if p then
                considered = considered + 1
                local hp = _WF.getMobInstanceMaxHP(mob)
                if hp and hp < targetMinHP and hp > bestHP then
                    best, bestHP = mob, hp
                end
            end
        end
    end
    if _WF.EnableDebug then
        dbg(("findEasierMob: targetMinHP=%s, scanned=%d, picked=%s (HP=%s)"):format(
            tostring(targetMinHP), considered,
            best and best.Name or "nil",
            tostring(bestHP > 0 and bestHP or "—")
        ))
    end
    return best
end

-- Short filler attack burst: TP + atacks N times or until mob dies / HP stalls.
-- Always <2s, non-blocking for the main farm loop on its next tick.
-- gateFn (optional): () → bool. Возвращает false — филлер сразу выходит.
-- Если не передан — дефолт: _WF.AutoFarmEnabled (старое поведение для farm-loop'а).
function _WF.fillerHit(mob, maxDuration, gateFn)
    if not mob or not _WF.isAlive(mob) then return end
    gateFn = gateFn or function() return _WF.AutoFarmEnabled end
    _WF.teleportTo(mob)
    task.wait(0.05)
    local cd = _WF.getClickCooldown()
    local started = tick()
    local lastHP = _WF.getMobHP(mob)
    local lastHPTick = tick()
    while gateFn() and getgenv()._WFRunning
        and not _WF.StarBusy and not _WF.ZoneTpBusy and not _WF.TrialBusy
        and not _WF.GamemodeJoinBusy
        and _WF.isAlive(mob) and tick() - started < (maxDuration or 1.5)
    do
        _WF.attackOnce()
        local curHP = _WF.getMobHP(mob)
        if curHP and lastHP and curHP < lastHP then
            lastHP = curHP; lastHPTick = tick()
        elseif tick() - lastHPTick > 0.8 then
            break  -- HP не падает, выходим раньше — у filler короткий ресурс терпения
        end
        task.wait(cd)
    end
end

-- Find best zone for targets: scans all maps/zones, returns {mapName, zoneIdx}
-- where the most selected targets are configured.
function _WF.findBestZoneForTargets(targetSet)
    local shared = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Enemies
    if type(shared) ~= "table" then return nil end
    local best, bestScore = nil, 0
    for mapName, zones in pairs(shared) do
        if type(zones) == "table" then
            for zoneKey, zoneConfig in pairs(zones) do
                if type(zoneConfig) == "table" then
                    local zoneMobs = _WF.extractMobNames(zoneConfig)
                    local score = 0
                    for n in pairs(targetSet) do
                        if zoneMobs[n] then score = score + 1 end
                    end
                    if score > bestScore then
                        bestScore = score
                        best = { mapName = mapName, zoneIdx = tonumber(zoneKey) or zoneKey }
                    end
                end
            end
        end
    end
    return best
end

-- TP to a specific map/zone (fires server teleport). Uses ZoneTpBusy mutex.
function _WF.teleportToZone(mapName, zoneIdx)
    if not (_WF.Omni and _WF.Omni.Signal) then return end
    _WF.ZoneTpBusy = true
    safe(function()
        _WF.Omni.Signal:Fire("Player", "Teleport", "Teleport", mapName, zoneIdx)
    end)
    task.wait(1.0)
    _WF.ZoneTpBusy = false
end

-- ═══════════════════════════════════════════════════════════════════════
-- One iteration of target-farming logic. Shared by Farm-loop и Quest-loop.
-- Позволяет Quest-loop'у быть самодостаточным (как в легаси v0.37) — не
-- зависеть от того, включён ли AutoFarm toggle пользователем.
--
--   targetSet : {[mobName]=true} — кого бить
--   gateFn    : () → bool — вернёт false → итерация останавливается досрочно
--                          (передавай _WF.AutoFarmEnabled / _WF.AutoQuestEnabled)
-- ═══════════════════════════════════════════════════════════════════════
function _WF.runTargetFarmStep(targetSet, gateFn)
    gateFn = gateFn or function() return true end
    if not (_WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Map) then return end
    if not next(targetSet) then return end
    local curMap  = _WF.Omni.Data.Map
    local curZone = tonumber(_WF.Omni.Data.Zone or 1) or 1

    local hasReady, hasLive = _WF.hasReadyTargetsInCurrentZone(targetSet)

    if hasReady then
        -- ATTACK PHASE
        local folder = _WF.getEnemiesFolder()
        local hrp0 = getHRP()
        local myPos = (hrp0 and hrp0.Position) or Vector3.new()
        local candidates = {}
        if folder then
            for _, mob in ipairs(folder:GetChildren()) do
                if targetSet[mob.Name] and _WF.isAlive(mob) then
                    local p = _WF.getMobPos(mob)
                    if p then
                        table.insert(candidates, { mob = mob, dist = (p - myPos).Magnitude })
                    end
                end
            end
        end
        table.sort(candidates, function(a, b) return a.dist < b.dist end)
        local mob = candidates[1] and candidates[1].mob
        if mob then
            _WF.teleportTo(mob)
            task.wait(0.08)
            local cd         = _WF.getClickCooldown()
            local started    = tick()
            local lastHP     = _WF.getMobHP(mob)
            local lastHPTick = tick()
            while gateFn() and getgenv()._WFRunning
                and not _WF.StarBusy and not _WF.ZoneTpBusy and not _WF.TrialBusy
                and not _WF.GamemodeJoinBusy
                and _WF.isAlive(mob) and tick() - started < 15
            do
                local hrp = getHRP()
                local mp  = _WF.getMobPos(mob)
                if hrp and mp then
                    local my = hrp.Position
                    if (mp - my).Magnitude > 12 then
                        _WF.teleportTo(mob)
                        task.wait(0.05)
                    end
                    _WF.attackOnce()
                end
                local curHP = _WF.getMobHP(mob)
                if curHP and lastHP and curHP < lastHP then
                    lastHP = curHP; lastHPTick = tick()
                elseif tick() - lastHPTick > 1.5 then
                    dbg(("HP-stall: skip %s (HP stuck at %s)"):format(tostring(mob.Name), tostring(lastHP)))
                    break
                end
                task.wait(cd)
            end
        end

    elseif hasLive then
        -- STREAMING-BOUNDS PHASE: target в folder есть, но position = (0,0,0).
        local streamed = _WF.tpToFurthestVisibleMob()
        task.wait(0.1)
        local easier = _WF.findEasierMob(targetSet, _WF.FillerRadius)
        if easier then
            _WF.fillerHit(easier, 1.2, gateFn)
        else
            task.wait(streamed and 0.5 or 0.8)
        end

    else
        -- ZONE ROUTING PHASE
        if _WF.anyTargetInZoneConfig(targetSet, curMap, curZone) then
            local easier = _WF.findEasierMob(targetSet, _WF.FillerRadius)
            if easier then
                _WF.fillerHit(easier, 1.5, gateFn)
            else
                local tpOk = _WF.tpToFurthestVisibleMob()
                task.wait(tpOk and 0.6 or 1.5)
            end
        else
            local best = _WF.findBestZoneForTargets(targetSet)
            if best and (best.mapName ~= curMap or best.zoneIdx ~= curZone) then
                _WF.teleportToZone(best.mapName, best.zoneIdx)
            else
                task.wait(3)
            end
        end
    end
end

-- // 4. SAFE MODULE LOADER
local okLoad, errLoad = pcall(function()
    local OmniModule = awaitChild(RS, "Omni", 15)
    if not OmniModule then error("Omni ModuleScript missing in ReplicatedStorage") end
    _WF.Omni = require(OmniModule)
    if _WF.Omni.WaitInitialization then
        _WF.Omni:WaitInitialization()
    end
    assert(_WF.Omni.Signal,  "Omni.Signal missing")
    assert(_WF.Omni.Data,    "Omni.Data missing")
    _WF.ModulesLoaded = true
end)

-- Omni:WaitInitialization() возвращается как только готова Data (через Replica),
-- но Shared-конфиги (Enemies/Stars/Quests/Gacha/Progression/SkillTree/Items/Gamemodes)
-- подтягиваются отдельно и могут опоздать на 1–3 секунды. Если строить UI сразу —
-- все Dropdown'ы создадутся с пустыми Options и юзер ничего не выберет.
-- Даём Shared до 6с, чтобы хоть Enemies прогрузился (остальное обычно подтягивается вместе).
if _WF.ModulesLoaded then
    local deadline = tick() + 6
    while tick() < deadline do
        local shared = _WF.Omni.Shared
        if shared and shared.Enemies and next(shared.Enemies) ~= nil then
            break
        end
        task.wait(0.1)
    end
    if not (_WF.Omni.Shared and _WF.Omni.Shared.Enemies and next(_WF.Omni.Shared.Enemies)) then
        warn("[WF] Omni.Shared.Enemies не загрузился за 6с — дропдауны будут пустыми, жми Refresh после их появления.")
    end
end

-- // 5. ANTI-AFK
coroutine.wrap(function()
    local GC = getconnections or get_signal_cons
    if GC then
        safe(function()
            for _, v in pairs(GC(LocalPlayer.Idled)) do
                if v.Disable then v:Disable()
                elseif v.Disconnect then v:Disconnect() end
            end
        end)
    else
        LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end)()

-- ДОПОЛНИТЕЛЬНЫЙ слой anti-AFK — каждые 60с fire'им Humanoid.Running connections
-- чтобы обмануть ROBLOX-движковый (не игровой) 20-минутный AFK-таймер. Симулирует
-- движение на уровне Humanoid. Работает независимо от toggle в Misc tab.
do
    local antiAfkThread = nil
    local function startAntiAfkLoop(character)
        if antiAfkThread then pcall(task.cancel, antiAfkThread); antiAfkThread = nil end
        local humanoid = character:WaitForChild("Humanoid")
        antiAfkThread = task.spawn(function()
            while humanoid and humanoid.Parent and getgenv()._WFRunning do
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

-- ═══════════════════════════════════════════════════════════════════
-- NoClip — проходим сквозь стены/пол во время фарма.
-- Решает проблему DD: teleportTo(mob) может поставить игрока в/за стену arena,
-- персонаж падает в void → character respawn → ещё один TP → loop повторяется.
-- Отключаем CanCollide у всех BasePart'ов в персонаже каждый Stepped (Roblox
-- восстанавливает их автоматически когда applyAnchored/respawn).
-- Режимы через _WF.NoClipMode: "off" / "auto" / "on".
-- ═══════════════════════════════════════════════════════════════════
do
    local function isFarming()
        return _WF.AutoFarmEnabled
            or _WF.AutoTrialEnabled
            or _WF.AutoDragonDefenseEnabled
            or _WF.AutoQuestEnabled
    end
    local function shouldNoClip()
        local m = _WF.NoClipMode
        if m == "on" then return true end
        if m == "off" then return false end
        return isFarming()  -- "auto"
    end
    -- Per-character: храним ссылки на descendants, чтобы возвращать CanCollide обратно
    -- когда noclip выключается (не оставляем персонажа в broken state).
    local noclippedParts = {}  -- [part] = true
    local noClipConn = nil
    local function stopNoClip()
        if noClipConn then noClipConn:Disconnect(); noClipConn = nil end
        for part in pairs(noclippedParts) do
            if part and part.Parent then
                pcall(function() part.CanCollide = true end)
            end
        end
        noclippedParts = {}
    end
    local function startNoClip()
        if noClipConn then return end
        noClipConn = RunService.Stepped:Connect(function()
            if not shouldNoClip() then
                stopNoClip()
                return
            end
            local char = LocalPlayer.Character
            if not char then return end
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    pcall(function() part.CanCollide = false end)
                    noclippedParts[part] = true
                end
            end
        end)
    end
    -- Фоновый watcher — поддерживает активный connection когда shouldNoClip()=true
    task.spawn(function()
        -- Ждём пока скрипт полностью инициализируется (_WFRunning ставится в finalize)
        while getgenv()._WFRunning == nil do task.wait(0.2) end
        while getgenv()._WFRunning do
            task.wait(0.5)
            if shouldNoClip() then
                startNoClip()
            end
            -- Stop происходит автоматически внутри Stepped callback когда
            -- shouldNoClip() возвращает false — не надо явно вызывать stopNoClip
        end
        -- Final cleanup when script stops
        stopNoClip()
    end)
    -- На respawn'е — старые part-references невалидны, сбрасываем таблицу.
    LocalPlayer.CharacterAdded:Connect(function()
        noclippedParts = {}
    end)
end

-- // 6. UI LIBRARY
local MacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dvorfkar6-lab/uis/refs/heads/main/Mac"))()

local Window = MacLib:Window({
    Title                  = "World Fighters | Apel Hub",
    Subtitle               = "v1.0",
    Size                   = UDim2.fromOffset(865, 650),
    DragStyle              = 2,
    DisabledWindowControls = {},
    ShowUserInfo           = false,
    Keybind                = Enum.KeyCode.LeftControl,
    AcrylicBlur            = false,
})
getgenv()._WFUI = Window

local function Notify_impl(msg, lifetime)
    pcall(function()
        Window:Notify({ Title = "Apel Hub", Description = tostring(msg), Lifetime = lifetime or 3 })
    end)
end
Notify = Notify_impl

local tabs      = {}
local sec       = {}
local MainGroup = Window:TabGroup()

tabs.Farm      = MainGroup:Tab({ Name = "Farm" })
tabs.Rewards   = MainGroup:Tab({ Name = "Rewards" })
tabs.Eggs      = MainGroup:Tab({ Name = "Eggs" })
tabs.Quests    = MainGroup:Tab({ Name = "Quests" })
tabs.Trials    = MainGroup:Tab({ Name = "Trials" })
tabs.Gacha     = MainGroup:Tab({ Name = "Gacha" })
tabs.Progress  = MainGroup:Tab({ Name = "Progress" })
tabs.Misc      = MainGroup:Tab({ Name = "Misc" })
tabs.Webhook   = MainGroup:Tab({ Name = "Webhook" })
tabs.Settings  = MainGroup:Tab({ Name = "Settings" })

sec.FarmL     = tabs.Farm:Section({ Side = "Left"  })
sec.FarmR     = tabs.Farm:Section({ Side = "Right" })
sec.RewardsL  = tabs.Rewards:Section({ Side = "Left"  })
sec.RewardsR  = tabs.Rewards:Section({ Side = "Right" })
sec.EggsL     = tabs.Eggs:Section({ Side = "Left"  })
sec.EggsR     = tabs.Eggs:Section({ Side = "Right" })
sec.QuestsL   = tabs.Quests:Section({ Side = "Left"  })
sec.QuestsR   = tabs.Quests:Section({ Side = "Right" })
sec.TrialsL   = tabs.Trials:Section({ Side = "Left"  })
sec.TrialsR   = tabs.Trials:Section({ Side = "Right" })
sec.GachaL    = tabs.Gacha:Section({ Side = "Left"  })
sec.GachaR    = tabs.Gacha:Section({ Side = "Right" })
sec.ProgressL = tabs.Progress:Section({ Side = "Left"  })
sec.ProgressR = tabs.Progress:Section({ Side = "Right" })
sec.MiscL     = tabs.Misc:Section({ Side = "Left"  })
sec.MiscR     = tabs.Misc:Section({ Side = "Right" })
sec.WebhookL  = tabs.Webhook:Section({ Side = "Left"  })
sec.WebhookR  = tabs.Webhook:Section({ Side = "Right" })
sec.SetL      = tabs.Settings:Section({ Side = "Left"  })
sec.SetR      = tabs.Settings:Section({ Side = "Right" })

-- ════════════════════════════════════════════════════════════════
-- SETTINGS PROXY HELPER (глобальный, чтоб любой таб мог использовать)
-- ════════════════════════════════════════════════════════════════
-- Прокси на серверные Data.Settings. Default берётся из текущего значения
-- на сервере. Aura/Awaken/Auto Click/Auto Attack — gamepass-gated на стороне
-- сервера; если нет пасса — тогл выставится, но эффекта не будет (это норма).
local function makeSettingToggle(parent, label, settingKey, flagId)
    local default = false
    safe(function()
        local s = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Settings
        if s then default = s[settingKey] == true end
    end)
    parent:Toggle({
        Name    = label,
        Default = default,
        Callback = function(on)
            safe(function()
                _WF.Omni.Signal:Fire("General", "Settings", "Set", settingKey, on)
            end)
        end,
    }, flagId)
end

-- ════════════════════════════════════════════════════════════════
-- GLOBAL UI UNLOCKER
-- ════════════════════════════════════════════════════════════════
-- Gacha roll и Star open добавляют Frame:AddUIHider(...) + camera modifier
-- на время анимации. Когда несколько фаиров стакаются параллельно (AutoGacha
-- + AutoOpenEgg + AutoBanner одновременно), одна из анимаций иногда не снимает
-- свой hider → камера замирает, UI пропадает, персонаж "залочен".
-- Этот фоновый таск каждые 0.15с агрессивно чистит все известные hiders пока
-- активна любая из autoroll-фичей.
task.spawn(function()
    while getgenv()._WFRunning do
        task.wait(0.15)
        local anyRollActive = _WF.AutoOpenStarEnabled
            or _WF.AutoGachaEnabled
            or _WF.AutoBannerRollEnabled
            or _WF.AutoRouletteRollEnabled
        if anyRollActive and _WF.ModulesLoaded and _WF.Omni then
            -- UI hiders: Gacha animation и StarAnimation. Snapshot names'ов из decompiled.
            safe(function() _WF.Omni.Frame:RemoveUIHider("Gacha") end)
            safe(function() _WF.Omni.Frame:RemoveUIHider("StarAnimation") end)
            safe(function() _WF.Omni.Frame:Close("Star") end)
            -- Camera modifiers: ставятся игрой при анимации, не всегда снимаются.
            if _WF.Omni.Signal and _WF.Omni.Signal.FireSelf then
                safe(function() _WF.Omni.Signal:FireSelf("Player", "Camera", "RemoveCameraTypeModifier", "StarAnimation") end)
                safe(function() _WF.Omni.Signal:FireSelf("Player", "Camera", "RemoveCameraTypeModifier", "Gacha") end)
                safe(function() _WF.Omni.Signal:FireSelf("Player", "FOV", "Enable") end)
            end
            -- GUI'шки с анимациями — если есть, глушим рендер.
            safe(function()
                local sa = LocalPlayer.PlayerGui:FindFirstChild("StarAnimation")
                if sa and sa:IsA("ScreenGui") and sa.Enabled then sa.Enabled = false end
            end)
            safe(function()
                local ga = LocalPlayer.PlayerGui:FindFirstChild("GachaAnimation")
                if ga and ga:IsA("ScreenGui") and ga.Enabled then ga.Enabled = false end
            end)
        end
    end
end)

-- Graceful degradation: if Omni failed to load, show error and still allow Settings
if not _WF.ModulesLoaded then
    sec.SetL:Header({ Text = "Module load failed" })
    sec.SetL:Paragraph({ Header = "Error", Body = tostring(errLoad) })
    sec.SetL:Button({
        Name = "Retry (rerun script)",
        Callback = function() Notify("Rerun the script to retry", 4) end,
    })
end

-- // 7. WEBHOOK SENDER
local function sendWebhook(title, description, color)
    if not _WF.WebhookEnabled then return end
    if not _WF.WebhookURL or _WF.WebhookURL == "" then return end
    task.spawn(function()
        local pingContent = nil
        if type(_WF.WebhookDiscordUserId) == "string" and _WF.WebhookDiscordUserId ~= "" then
            pingContent = "<@" .. _WF.WebhookDiscordUserId .. ">"
        end
        local payload = HttpService:JSONEncode({
            username = "Apel Hub · " .. GameName,
            content  = pingContent,
            embeds   = {{
                title = title,
                description = description,
                color = color or 15277667,
                footer = { text = "Apel Hub • " .. os.date("%Y-%m-%d %H:%M:%S") },
            }},
        })
        local sent = false
        if _cachedRequest then
            sent = pcall(function()
                _cachedRequest({
                    Url = _WF.WebhookURL, Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = payload,
                })
            end)
        end
        if not sent then
            pcall(function()
                HttpService:PostAsync(_WF.WebhookURL, payload,
                    Enum.HttpContentType.ApplicationJson, false)
            end)
        end
        _WF.WebhookSentCount = _WF.WebhookSentCount + 1
        _WF.WebhookLastSent  = os.date("%H:%M:%S")
    end)
end

-- ════════════════════════════════════════════════════════════════
-- // 8. FARM TAB
-- ════════════════════════════════════════════════════════════════
local _ok_farm, _err_farm = pcall(function()
    -- // AUTO CLICK \\ --
    sec.FarmL:Header({ Text = "Auto Click" })

    sec.FarmL:Toggle({
        Name    = "Auto Click (20Hz, custom)",
        Default = false,
        Callback = function(on)
            _WF.AutoClickEnabled = on
            if on then
                -- Гасим игровой Auto Click если был включён — иначе в параллель с
                -- нашим loop'ом = двойной fire rate, сервер рейтлимитит, лишний
                -- трафик. Игра хранит в persistent Data.Settings, юзер сможет
                -- вернуть вручную через игровое меню если захочет.
                safe(function()
                    local s = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Settings
                    if s and s["Auto Click"] then
                        _WF.Omni.Signal:Fire("General", "Settings", "Set", "Auto Click", false)
                    end
                end)
            end
        end,
    }, "AutoClickToggle")

    -- Background: Auto Click loop. attackOnce() сам no-op'ит когда
    -- EnemiesOnRangeIds пустой, так что в idle-стейте loop стоит дёшево.
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(0.05)
            if _WF.AutoClickEnabled and _WF.ModulesLoaded then
                _WF.attackOnce()
            end
        end
    end)

    -- // GAME SETTINGS \\ --
    -- Прокси на серверные Data.Settings. Aura/Awaken/Auto Attack — gamepass-gated
    -- (если нет пасса — сервер молча игнорит). Always Run работает у всех.
    sec.FarmL:Divider()
    sec.FarmL:Header({ Text = "In-Game Settings" })
    makeSettingToggle(sec.FarmL, "Auto Aura Upgrade", "Auto Aura Upgrade", "AutoAuraToggle")
    makeSettingToggle(sec.FarmL, "Auto Awaken",       "Auto Awaken",       "AutoAwakenToggle")
    makeSettingToggle(sec.FarmL, "Auto Attack",       "Auto Attack",       "AutoAttackToggle")
    makeSettingToggle(sec.FarmL, "Always Run",        "Always Run",        "AlwaysRunToggle")

    sec.FarmL:Divider()
    sec.FarmL:Header({ Text = "Auto Farm" })

    sec.FarmL:Toggle({
        Name = "Auto Farm",
        Default = false,
        Callback = function(on) _WF.AutoFarmEnabled = on end,
    }, "AutoFarmToggle")

    local mobDropdown = sec.FarmL:Dropdown({
        Name     = "Target Mobs (multi) — current zone",
        Multi    = true,
        Required = false,
        Options  = _WF.getMobsInCurrentZone(),
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do
                    if v and type(k) == "string" then set[k] = true end
                end
            end
            _WF.Targets = set
        end,
    }, "FarmTargetsDropdown")

    local function refreshMobList()
        pcall(function()
            mobDropdown:ClearOptions()
            mobDropdown:InsertOptions(_WF.getMobsInCurrentZone())
        end)
    end

    sec.FarmL:Button({
        Name = "Refresh Mob List",
        Callback = function()
            refreshMobList()
            Notify("Mob list refreshed", 2)
        end,
    })

    -- Авто-обновление при смене зоны/карты. Проверяем каждые 1.5с — дёшево.
    task.spawn(function()
        local lastMap, lastZone
        while getgenv()._WFRunning do
            task.wait(1.5)
            safe(function()
                local d = _WF.Omni and _WF.Omni.Data
                if not d then return end
                local m, z = d.Map, d.Zone
                if m ~= lastMap or z ~= lastZone then
                    lastMap, lastZone = m, z
                    -- Первый запуск: lastMap был nil, пропускаем (начальный список уже правильный).
                    -- Последующие смены: обновляем dropdown.
                    if lastMap ~= nil then
                        refreshMobList()
                    end
                end
            end)
        end
    end)

    sec.FarmL:Button({
        Name = "Debug: Dump Farm State",
        Callback = function()
            local d, buf = newDump()
            d("========== [WF] FARM DEBUG ==========")
            local data = _WF.Omni and _WF.Omni.Data
            d(("Map: %s | Zone: %s"):format(tostring(data and data.Map), tostring(data and data.Zone)))

            local sel = {}
            for n in pairs(_WF.Targets) do table.insert(sel, n) end
            table.sort(sel)
            d("Selected targets: " .. (#sel == 0 and "(none)" or table.concat(sel, ", ")))

            local folder = _WF.getEnemiesFolder()
            d(("Enemies folder: %s"):format(folder and folder:GetFullName() or "nil"))
            if folder then
                local byName = {}
                for _, m in ipairs(folder:GetChildren()) do
                    byName[m.Name] = (byName[m.Name] or 0) + 1
                end
                local names = {}
                for n in pairs(byName) do table.insert(names, n) end
                table.sort(names)
                d(("Mobs in zone: %d total"):format(#folder:GetChildren()))
                for _, n in ipairs(names) do
                    local isTarget = _WF.Targets[n] and " ← TARGET" or ""
                    d(("  %s x%d%s"):format(n, byName[n], isTarget))
                end
            end

            d("-- Zone routing check --")
            if data and data.Map then
                local hasReady, hasLive = _WF.hasReadyTargetsInCurrentZone(_WF.Targets)
                d(("  hasReadyTargets: %s"):format(tostring(hasReady)))
                d(("  hasLiveTargets: %s"):format(tostring(hasLive)))
                d(("  anyTargetInZoneConfig: %s"):format(tostring(_WF.anyTargetInZoneConfig(_WF.Targets, data.Map, data.Zone))))
                local best = _WF.findBestZoneForTargets(_WF.Targets)
                d(("  findBestZone: %s"):format(best and (best.mapName .. " / " .. tostring(best.zoneIdx)) or "(none)"))
            end

            d("=======================================")
            flushDump(buf, "Farm Debug")
        end,
    })

    -- Status paragraphs (right section)
    sec.FarmR:Header({ Text = "Status" })
    local statusPara     = wrapParagraph(sec.FarmR:Paragraph({ Header = "Farm Status", Body = "Idle" }))
    local infoPara       = wrapParagraph(sec.FarmR:Paragraph({ Header = "Player Info", Body = "loading..." }))
    local mobCountPara   = wrapParagraph(sec.FarmR:Paragraph({ Header = "Mobs in zone", Body = "—" }))
    local routingPara    = wrapParagraph(sec.FarmR:Paragraph({ Header = "Zone Routing", Body = "—" }))

    -- Background: status refresh
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(1)
            safe(function()
                -- Status
                local sel = {}
                for n in pairs(_WF.Targets) do table.insert(sel, n) end
                table.sort(sel)
                local lines = {
                    "Auto Farm: " .. (_WF.AutoFarmEnabled and "ON" or "OFF"),
                    "Targets: " .. (#sel == 0 and "—" or table.concat(sel, ", ")),
                    "Busy: " .. ((_WF.StarBusy or _WF.ZoneTpBusy) and "yes (TP in progress)" or "no"),
                }
                statusPara:UpdateBody(table.concat(lines, "\n"))

                -- Player Info
                local d = _WF.Omni and _WF.Omni.Data
                if d then
                    local lvl = (d.Level and d.Level.Amount) or 1
                    infoPara:UpdateBody(string.format(
                        "Power: %s\nCrystals: %s\nGems: %s\nAura: %s\nLevel: %s\nMap: %s | Zone: %s\nGamemode: %s",
                        tostring(d.Power or 0), tostring(d.Crystals or 0),
                        tostring((d.FreeGems or 0) + (d.PaidGems or 0)),
                        tostring(d.Aura or 0), tostring(lvl),
                        tostring(d.Map or "?"), tostring(d.Zone or 1),
                        tostring(d.Gamemode or "—")
                    ))
                end

                -- Mob count
                local folder = _WF.getEnemiesFolder()
                mobCountPara:UpdateBody(folder and tostring(#folder:GetChildren()) or "—")

                -- Zone routing state (only meaningful when AutoFarm on)
                if _WF.AutoFarmEnabled and d and d.Map and next(_WF.Targets) then
                    local hasReady, hasLive = _WF.hasReadyTargetsInCurrentZone(_WF.Targets)
                    local inConfig = _WF.anyTargetInZoneConfig(_WF.Targets, d.Map, d.Zone)
                    local best = _WF.findBestZoneForTargets(_WF.Targets)
                    local rLines = {
                        "Ready: " .. (hasReady and "✓" or "—"),
                        "Live in zone: " .. (hasLive and "✓" or "—"),
                        "In zone config: " .. (inConfig and "✓" or "—"),
                    }
                    if best then
                        table.insert(rLines, ("Best zone: %s / %s"):format(best.mapName, tostring(best.zoneIdx)))
                    end
                    routingPara:UpdateBody(table.concat(rLines, "\n"))
                else
                    routingPara:UpdateBody("(disabled)")
                end
            end)
        end
    end)

    -- Background: farm loop. Логика вынесена в _WF.runTargetFarmStep — используется
    -- также quest-loop'ом для самодостаточного фарма миссии.
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(0.15)
            if _WF.AutoFarmEnabled and _WF.ModulesLoaded
                and not _WF.StarBusy and not _WF.ZoneTpBusy and not _WF.TrialBusy
                and not _WF.GamemodeJoinBusy
            then
                safe(function()
                    _WF.runTargetFarmStep(_WF.Targets, function() return _WF.AutoFarmEnabled end)
                end)
            end
        end
    end)
end)
if not _ok_farm then warn("[ApelHub] FARM tab failed: " .. tostring(_err_farm)) end

-- ════════════════════════════════════════════════════════════════
-- // 9. REWARDS TAB
-- ════════════════════════════════════════════════════════════════
local _ok_rewards, _err_rewards = pcall(function()
    local CHEST_CD = {
        ["Daily Chest"] = 24 * 3600,
        ["Group Chest"] = 24 * 3600,
        ["VIP Chest"]   = 12 * 3600,
    }
    local function fire(sys, scr, act, ...)
        if _WF.Omni and _WF.Omni.Signal then _WF.Omni.Signal:Fire(sys, scr, act, ...) end
    end

    -- Позиция сундука в workspace — сервер проверяет дистанцию до сундука при Claim.
    -- Путь: workspace.Server.Interactable.[zoneName].[chestName " Chest"]
    -- Кешируем (позиция не меняется в течение сессии).
    local _chestPosCache = {}
    local function getChestPos(chestName)
        if _chestPosCache[chestName] ~= nil then
            return _chestPosCache[chestName] or nil
        end
        local sv = Workspace:FindFirstChild("Server")
        local ia = sv and sv:FindFirstChild("Interactable")
        if not ia then return nil end
        for _, zone in ipairs(ia:GetChildren()) do
            local part = zone:FindFirstChild(chestName .. " Chest")
            if part and part:IsA("BasePart") then
                _chestPosCache[chestName] = part.Position
                return part.Position
            end
        end
        _chestPosCache[chestName] = false  -- отмечаем "искали и не нашли"
        return nil
    end

    -- Claim chest: TP к сундуку → Fire("General","Chests","Claim",name) → возврат
    -- Сигнал именно "Claim" (проверено в decompiled), НЕ "Open".
    local function tryClaimChest(chestName)
        local hrp = getHRP()
        if not hrp then return false end
        local savedCF = hrp.CFrame
        local pos = getChestPos(chestName)
        if pos then
            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 4, 0))
            task.wait(0.2)
        end
        safe(function() fire("General", "Chests", "Claim", chestName) end)
        task.wait(0.3)
        if pos then
            local h2 = getHRP()
            if h2 then h2.CFrame = savedCF end
        end
        return true
    end

    sec.RewardsL:Header({ Text = "Rewards" })

    sec.RewardsL:Toggle({ Name = "Auto Achievements (ClaimAll)", Default = false,
        Callback = function(s) _WF.AutoAchievementsEnabled = s end }, "AutoAchievementsToggle")
    sec.RewardsL:Toggle({ Name = "Auto Time Rewards", Default = false,
        Callback = function(s) _WF.AutoTimeRewardsEnabled = s end }, "AutoTimeRewardsToggle")
    sec.RewardsL:Toggle({ Name = "Auto Daily Rewards", Default = false,
        Callback = function(s) _WF.AutoDailyRewardsEnabled = s end }, "AutoDailyRewardsToggle")
    sec.RewardsL:Toggle({ Name = "Auto Follow Rewards (Verify)", Default = false,
        Callback = function(s) _WF.AutoFollowRewardsEnabled = s end }, "AutoFollowRewardsToggle")

    sec.RewardsR:Header({ Text = "Chests" })
    sec.RewardsR:Toggle({ Name = "Auto Daily Chest", Default = false,
        Callback = function(s) _WF.AutoDailyChestEnabled = s end }, "AutoDailyChestToggle")
    sec.RewardsR:Toggle({ Name = "Auto Group Chest", Default = false,
        Callback = function(s) _WF.AutoGroupChestEnabled = s end }, "AutoGroupChestToggle")
    sec.RewardsR:Toggle({ Name = "Auto VIP Chest", Default = false,
        Callback = function(s) _WF.AutoVIPChestEnabled = s end }, "AutoVIPChestToggle")

    sec.RewardsR:Button({ Name = "Claim Now (все включенные)",
        Callback = function()
            task.spawn(function()
                if _WF.AutoAchievementsEnabled  then safe(function() fire("General", "Achievements", "ClaimAll") end) task.wait(0.3) end
                if _WF.AutoDailyRewardsEnabled  then safe(function() fire("General", "DailyRewards",  "Claim")    end) task.wait(0.3) end
                if _WF.AutoFollowRewardsEnabled then safe(function() fire("General", "FollowRewards", "Verify")   end) task.wait(0.3) end
                for name, enabled in pairs({
                    ["Daily Chest"] = _WF.AutoDailyChestEnabled,
                    ["Group Chest"] = _WF.AutoGroupChestEnabled,
                    ["VIP Chest"]   = _WF.AutoVIPChestEnabled,
                }) do
                    if enabled then tryClaimChest(name); task.wait(0.3) end
                end
            end)
        end,
    })

    -- Chest status paragraph
    local chestStatus = wrapParagraph(sec.RewardsR:Paragraph({ Header = "Chest Cooldowns", Body = "—" }))

    local function getChestLastClaim(chestName)
        local d = _WF.Omni and _WF.Omni.Data
        if type(d) ~= "table" then return nil end
        -- Various possible paths the game might use
        local paths = {
            { "Chests", chestName, "LastClaim" },
            { "Chests", chestName, "LastClaimed" },
            { "Chests", chestName, "Last" },
            { "LastChest",  chestName },
            { "ChestData", chestName, "Last" },
        }
        for _, path in ipairs(paths) do
            local cur = d
            for _, key in ipairs(path) do
                cur = type(cur) == "table" and cur[key]
                if cur == nil then break end
            end
            if type(cur) == "number" then return cur end
        end
        return nil
    end

    local function formatChestCooldown(chestName)
        local last = getChestLastClaim(chestName)
        if not last then return "ready (or no data)" end
        local cd = CHEST_CD[chestName] or 24 * 3600
        local remaining = cd - (tick() - last)
        if remaining <= 0 then return "ready" end
        local h = math.floor(remaining / 3600)
        local m = math.floor((remaining % 3600) / 60)
        return ("%dh %dm"):format(h, m)
    end

    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(5)
            safe(function()
                chestStatus:UpdateBody(
                    "Daily: "  .. formatChestCooldown("Daily Chest") ..
                    "\nGroup: " .. formatChestCooldown("Group Chest") ..
                    "\nVIP: "   .. formatChestCooldown("VIP Chest")
                )
            end)
        end
    end)

    -- Background: rewards loop (polls every 30s)
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(30)
            if _WF.ModulesLoaded then
                if _WF.AutoAchievementsEnabled  and shouldFire("ach.claimall", 5)  then safe(function() fire("General", "Achievements", "ClaimAll") end) end
                if _WF.AutoTimeRewardsEnabled   and shouldFire("time.claim",   5)  then
                    -- time rewards are indexed; try first few slots
                    for i = 1, 10 do safe(function() fire("General", "TimeRewards", "Claim", i) end) task.wait(0.1) end
                end
                if _WF.AutoDailyRewardsEnabled  and shouldFire("daily.claim",  60) then safe(function() fire("General", "DailyRewards",  "Claim")  end) end
                if _WF.AutoFollowRewardsEnabled and shouldFire("follow.verify",60) then safe(function() fire("General", "FollowRewards", "Verify") end) end
                for name, flag in pairs({
                    ["Daily Chest"] = _WF.AutoDailyChestEnabled,
                    ["Group Chest"] = _WF.AutoGroupChestEnabled,
                    ["VIP Chest"]   = _WF.AutoVIPChestEnabled,
                }) do
                    -- Проверка cooldown'а: getChestLastClaim → если не прошло CHEST_CD, пропускаем
                    if flag then
                        local last = getChestLastClaim(name)
                        local cd = CHEST_CD[name] or 24 * 3600
                        local ready = not last or (tick() - last) >= cd
                        if ready and shouldFire("chest." .. name, 60) then
                            tryClaimChest(name)
                        end
                    end
                end
            end
        end
    end)
end)
if not _ok_rewards then warn("[ApelHub] REWARDS tab failed: " .. tostring(_err_rewards)) end

-- ════════════════════════════════════════════════════════════════
-- // 10. EGGS TAB (Stars)
-- ════════════════════════════════════════════════════════════════
local _ok_eggs, _err_eggs = pcall(function()
    local CollectionService = game:GetService("CollectionService")

    -- Timing critical: Roblox replicates position ~30-60Hz. Below 0.15s
    -- server starts rejecting Fire as "player not at star".
    local STAR_TP_SETTLE   = 0.2
    local STAR_FIRE_SETTLE = 0.2
    local STAR_BATCH_GAP   = 0.1

    -- Реальный сервер-ный cooldown между open'ами: формула из декомпайла —
    -- 3.5 / StarOpenSpeed(data, player). Без геймпасса speed=1 → 3.5с.
    -- С геймпассами/бустами может упасть до ~0.5с. Жёсткая нижняя граница 0.3с —
    -- чтобы не насобирать server-side rate-limit.
    local function getStarOpenCooldown()
        local u = _WF.Omni and _WF.Omni.Utils and _WF.Omni.Utils.PlayerStats
        if type(u) == "table" and type(u.StarOpenSpeed) == "function" then
            local ok, v = pcall(function()
                return u.StarOpenSpeed(_WF.Omni.Data, _WF.Omni.Instance or LocalPlayer)
            end)
            if ok and type(v) == "number" and v > 0 then
                return math.max(3.5 / v, 0.3)
            end
        end
        return 3.5  -- дефолт (без бустов)
    end

    -- Find the star model in workspace (via CollectionService tag, fallback to Client.Stars)
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

    -- "Remote Star" gamepass lets player open without TP
    local function hasRemoteStarPass()
        local gp = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Gamepasses or {}
        for _, name in pairs(gp) do
            if tostring(name) == "Remote Star" then return true end
        end
        if type(gp) == "table" and gp["Remote Star"] then return true end
        return false
    end

    local function fireStarOpen(starName, amount)
        safe(function() _WF.Omni.Signal:Fire("General", "Stars", "Open", starName, amount or 1) end)
    end

    -- TP near star model. Returns true if TP happened, false if already close.
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

    -- Get max stars per open (gamepass Multi Star)
    local function getMaxStarOpen()
        local u = _WF.Omni and _WF.Omni.Utils and _WF.Omni.Utils.PlayerStats
        if type(u) == "table" then
            for _, fname in ipairs({ "StarOpens", "MaxStarOpen", "Stars" }) do
                if type(u[fname]) == "function" then
                    local ok, v = pcall(function() return u[fname](_WF.Omni.Data, _WF.Omni.Instance) end)
                    if ok and type(v) == "number" and v >= 1 then return math.floor(v) end
                end
            end
        end
        return 1
    end

    -- Получить баланс игрока для пары (Type, Name) — как в легаси.
    -- Currency → Omni.Data[priceName] (Crystals, Gems и т.д. на верхнем уровне Data)
    -- Item     → Omni.Data.Inventory.Items[priceName]
    local function getBalance(priceType, priceName)
        local data = _WF.Omni and _WF.Omni.Data
        if not data then return 0 end
        if priceType == "Currency" then
            local v = data[priceName]
            return type(v) == "number" and v or 0
        elseif priceType == "Item" then
            local items = data.Inventory and data.Inventory.Items or {}
            local v = items[priceName]
            if type(v) == "number" then return v end
            if type(v) == "table" and type(v.Amount) == "number" then return v.Amount end
            return 0
        end
        -- Unknown type — пробуем оба места на всякий случай.
        if type(data[priceName]) == "number" then return data[priceName] end
        local items = data.Inventory and data.Inventory.Items or {}
        local v = items[priceName]
        if type(v) == "number" then return v end
        if type(v) == "table" and type(v.Amount) == "number" then return v.Amount end
        return 0
    end

    -- Check if player can afford N stars of this name
    local function canAffordStar(starName, n)
        local stars = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Stars
        local cfg = stars and stars[starName]
        if type(cfg) ~= "table" or type(cfg.Price) ~= "table" then return true end
        local needed = (cfg.Price.Amount or 0) * n
        local bal    = getBalance(cfg.Price.Type, cfg.Price.Name)
        return bal >= needed
    end

    local function computeStarAmount(starName)
        local max = getMaxStarOpen()
        for try = max, 1, -1 do
            if canAffordStar(starName, try) then return try end
        end
        return 0
    end

    sec.EggsL:Header({ Text = "Stars / Eggs" })

    sec.EggsL:Toggle({
        Name = "Auto Open Eggs",
        Default = false,
        Callback = function(s) _WF.AutoOpenStarEnabled = s; if not s then _WF.StarBusy = false end end,
    }, "AutoOpenStarToggle")

    local starDropdown = sec.EggsL:Dropdown({
        Name     = "Target Eggs (multi)",
        Multi    = true,
        Required = false,
        Options  = (function()
            local out = {}
            local stars = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Stars
            if type(stars) == "table" then
                for k in pairs(stars) do if type(k) == "string" then table.insert(out, k) end end
            end
            table.sort(out)
            return out
        end)(),
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do if v and type(k) == "string" then set[k] = true end end
            end
            _WF.StarTargets = set
        end,
    }, "StarTargetsDropdown")

    sec.EggsL:Button({
        Name = "Open Selected x1 Now",
        Callback = function()
            task.spawn(function()
                for name in pairs(_WF.StarTargets) do
                    local remote = hasRemoteStarPass()
                    if not remote then
                        if tpNearStar(name) then task.wait(STAR_TP_SETTLE) end
                    end
                    fireStarOpen(name, 1)
                    task.wait(STAR_FIRE_SETTLE)
                end
            end)
        end,
    })

    -- Star UI Hider — теперь через нативный игровой Setting "Hide Star Animation"
    -- (раньше был кастомный hack с RunService.Heartbeat + RemoveUIHider).
    -- Игра сама хайдит анимацию и снимает камеру-модификатор когда setting=true.
    makeSettingToggle(sec.EggsL, "Hide Star Animation", "Hide Star Animation", "HideStarAnimToggle")

    sec.EggsR:Header({ Text = "Status" })
    local eggStatus = wrapParagraph(sec.EggsR:Paragraph({ Header = "Stars", Body = "—" }))

    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(2)
            safe(function()
                local sel = {}
                for n in pairs(_WF.StarTargets) do table.insert(sel, n) end
                table.sort(sel)
                local hideAnim = false
                pcall(function()
                    local s = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Settings
                    if s then hideAnim = s["Hide Star Animation"] == true end
                end)
                local lines = {
                    "Auto: " .. (_WF.AutoOpenStarEnabled and "ON" or "OFF"),
                    "Hide anim: " .. (hideAnim and "ON (native)" or "OFF"),
                    "Targets: " .. (#sel == 0 and "—" or table.concat(sel, ", ")),
                    "Busy: " .. (_WF.StarBusy and "yes" or "no"),
                    "Remote Star pass: " .. (hasRemoteStarPass() and "yes (no TP needed)" or "no (TP mode)"),
                    "Max/open: " .. tostring(getMaxStarOpen()),
                }
                if #sel > 0 then
                    table.insert(lines, "")
                    for _, n in ipairs(sel) do
                        table.insert(lines, string.format("  %s: affordable=%d", n, computeStarAmount(n)))
                    end
                end
                eggStatus:UpdateBody(table.concat(lines, "\n"))
            end)
        end
    end)

    -- Main star loop — coordinates with Farm via _WF.StarBusy mutex
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(0.5)
            -- Уважаем zone-tp farm'а: не вмешиваемся пока он телепортирует между зонами
            if _WF.ZoneTpBusy or _WF.TrialBusy or _WF.GamemodeJoinBusy then
                while (_WF.ZoneTpBusy or _WF.TrialBusy or _WF.GamemodeJoinBusy) and getgenv()._WFRunning do task.wait(0.15) end
            end
            if _WF.AutoOpenStarEnabled and _WF.ModulesLoaded and not _WF.StarBusy and not _WF.TrialBusy and not _WF.GamemodeJoinBusy then
                local targets = _WF.StarTargets
                if next(targets) == nil then
                    task.wait(1)
                else
                    local anyAffordable = false
                    for name in pairs(targets) do
                        if computeStarAmount(name) >= 1 then anyAffordable = true; break end
                    end
                    if not anyAffordable then
                        -- Валюта ещё не накопилась — farm продолжает её набивать.
                        task.wait(5)
                    else
                        local remote = hasRemoteStarPass()
                        local cd     = getStarOpenCooldown()  -- Серверный cooldown: 3.5 / speed
                        local didAny = false
                        if remote then
                            -- Remote Star mode: no TP, fire in parallel with farm
                            for starName in pairs(targets) do
                                if not (_WF.AutoOpenStarEnabled and getgenv()._WFRunning) then break end
                                local amt = computeStarAmount(starName)
                                if amt >= 1 and shouldFire("star." .. starName, cd) then
                                    fireStarOpen(starName, amt)
                                    didAny = true
                                    task.wait(STAR_BATCH_GAP)
                                end
                            end
                        else
                            -- No gamepass: acquire HRP, TP to each star, fire, restore position
                            local hrp     = getHRP()
                            local savedCF = hrp and hrp.CFrame
                            _WF.StarBusy = true
                            task.wait(0.1)  -- let farm exit attack-loop
                            safe(function()
                                for starName in pairs(targets) do
                                    if not (_WF.AutoOpenStarEnabled and getgenv()._WFRunning) then break end
                                    local amt = computeStarAmount(starName)
                                    if amt >= 1 and shouldFire("star." .. starName, cd) then
                                        local tpHappened = tpNearStar(starName)
                                        if tpHappened then task.wait(STAR_TP_SETTLE) end
                                        fireStarOpen(starName, amt)
                                        didAny = true
                                        task.wait(STAR_FIRE_SETTLE)
                                    end
                                end
                                -- Restore position to wherever farm was
                                if _WF.AutoFarmEnabled and savedCF then
                                    local hrp2 = getHRP()
                                    if hrp2 then hrp2.CFrame = savedCF end
                                end
                            end)
                            _WF.StarBusy = false
                        end
                        -- Межцикловая пауза = реальному серверному cooldown'у.
                        -- С геймпассом "Star Speed" это ~0.5с, без — 3.5с. Farm успеет в любом случае.
                        if didAny then
                            task.wait(cd)
                        end
                    end
                end
            end
        end
        -- На выходе гарантированно отпускаем mutex.
        _WF.StarBusy = false
    end)
end)
if not _ok_eggs then warn("[ApelHub] EGGS tab failed: " .. tostring(_err_eggs)) end

-- ════════════════════════════════════════════════════════════════
-- // 11. QUESTS TAB
-- ════════════════════════════════════════════════════════════════
local _ok_quests, _err_quests = pcall(function()
    local MISSION_TARGET_KEYS = { "Target", "Name", "Mob", "Enemy", "EnemyName", "MobName", "What" }
    local MISSION_COUNT_KEYS  = { "Amount", "Count", "Required", "Goal", "Times", "Total" }

    local function getQuestCfg(questName)
        local s = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Quests
        if not s then return nil end
        -- Try Shared.Quests.List first, fallback to direct key
        if s.List and s.List[questName] then return s.List[questName] end
        return s[questName]
    end

    local function getAllQuests()
        local out = {}
        local s = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Quests
        local list = (s and s.List) or s
        if type(list) == "table" then
            for k, v in pairs(list) do
                -- Skip non-quest entries (Shared.Quests can have helper functions)
                if type(k) == "string" and type(v) == "table" then
                    table.insert(out, k)
                end
            end
        end
        table.sort(out)
        return out
    end

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

    -- Data.Quests structure varies; try multiple paths.
    local function getQuestData(questName)
        local q = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Quests
        if not q then return nil end
        if q.List     and q.List[questName]     then return q.List[questName]     end
        if q.Active   and q.Active[questName]   then return q.Active[questName]   end
        if q.Progress and q.Progress[questName] then return q.Progress[questName] end
        if q.Missions and q.Missions[questName] then return q.Missions[questName] end
        if q[questName] then return q[questName] end
        return nil
    end

    -- Table access by number OR string key (ReplicaService can serialize either)
    local function tblGetAny(t, key)
        if type(t) ~= "table" then return nil end
        return t[key] or t[tostring(key)] or t[tonumber(key)]
    end

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
            local v = unwrap(p)
            if type(v) == "number" then return v end
        end
        if type(d) == "table" then
            local p = tblGetAny(d, idx)
            local v = unwrap(p)
            if type(v) == "number" then return v end
        end
        if targetName and type(d) == "table" and type(d.Kills) == "table" then
            local v = d.Kills[targetName]
            if type(v) == "number" then return v end
        end
        return 0
    end

    -- Find first incomplete mission — returns {name=mobName, progress=N, required=M, idx=I} or nil
    local function getActiveMission(questName)
        local cfg = getQuestCfg(questName)
        if not cfg or not cfg.Missions then return nil end
        local indices = {}
        for k in pairs(cfg.Missions) do if type(k) == "number" then table.insert(indices, k) end end
        table.sort(indices)
        for _, idx in ipairs(indices) do
            local target, required = extractMissionTarget(cfg.Missions[idx])
            if target and required then
                local progress = getMissionProgress(questName, idx, target)
                if progress < required then
                    return { name = target, required = required, progress = progress, idx = idx }
                end
            end
        end
        return nil
    end

    local function isInQuestZone(questName)
        local cfg = getQuestCfg(questName)
        if not cfg then return true end
        local curMap = _WF.Omni.Data and _WF.Omni.Data.Map
        local curZone = _WF.Omni.Data and _WF.Omni.Data.Zone
        local wantMap = cfg.MapName
        if not wantMap then return true end
        if curMap ~= wantMap then return false end
        if cfg.ZoneIndex and curZone ~= cfg.ZoneIndex then return false end
        return true
    end

    local function tpToQuestZone(questName)
        local cfg = getQuestCfg(questName)
        if not cfg or not cfg.MapName then return false end
        if not shouldFire("quest.tp." .. questName, 3) then return false end
        safe(function()
            _WF.Omni.Signal:Fire("Player", "Teleport", "Teleport", cfg.MapName, cfg.ZoneIndex or 1)
        end)
        return true
    end

    local function pinQuest(questName)
        local pinned = _WF.Omni.Data and _WF.Omni.Data.Quests and _WF.Omni.Data.Quests.Pinned
        if pinned == questName then return end
        if not shouldFire("quest.pin." .. questName, 5) then return end
        safe(function()
            _WF.Omni.Signal:Fire("General", "Quests", "Pin", questName)
        end)
    end

    sec.QuestsL:Header({ Text = "Quests" })

    sec.QuestsL:Toggle({ Name = "Auto Quest", Default = false,
        Callback = function(s) _WF.AutoQuestEnabled = s end }, "AutoQuestToggle")

    local questDropdown = sec.QuestsL:Dropdown({
        Name = "Quests to do (multi)", Multi = true, Required = false,
        Options = getAllQuests(),
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do if v and type(k) == "string" then set[k] = true end end
            end
            _WF.QuestSelections = set
        end,
    }, "QuestsMultiDropdown")

    sec.QuestsL:Toggle({ Name = "Auto Pin Quest", Default = true,
        Callback = function(s) _WF.AutoPinQuestEnabled = s end }, "AutoPinQuestToggle")
    sec.QuestsL:Toggle({ Name = "Auto TP to Quest Zone", Default = true,
        Callback = function(s) _WF.AutoTpToQuestZoneEnabled = s end }, "AutoTpToQuestZoneToggle")

    sec.QuestsL:Button({ Name = "Refresh Quest List",
        Callback = function()
            pcall(function()
                questDropdown:ClearOptions()
                questDropdown:InsertOptions(getAllQuests())
            end)
            Notify("Quest list refreshed", 2)
        end,
    })

    sec.QuestsL:Button({
        Name = "Debug: Dump Quest State",
        Callback = function()
            local d, buf = newDump()
            d("========== [WF] QUEST DEBUG ==========")
            local all = getAllQuests()
            d(("All quests: %d"):format(#all))
            for _, n in ipairs(all) do
                local m = getActiveMission(n)
                local info = m and string.format("%s (%d/%d)", m.name, m.progress, m.required) or "(no active)"
                d(("  %s → %s"):format(n, info))
            end
            local sel = {}
            for n in pairs(_WF.QuestSelections) do table.insert(sel, n) end
            table.sort(sel)
            d("Selected: " .. (#sel == 0 and "(none)" or table.concat(sel, ", ")))

            d("-- Data.Quests dump --")
            local dq = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Quests
            if type(dq) == "table" then
                for k, v in pairs(dq) do
                    d(("  [%s] = %s"):format(tostring(k), typeof(v)))
                end
            end
            d("=======================================")
            flushDump(buf, "Quest Debug")
        end,
    })

    sec.QuestsR:Header({ Text = "Status" })
    local questStatus = wrapParagraph(sec.QuestsR:Paragraph({ Header = "Quests", Body = "—" }))

    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(2)
            safe(function()
                local sel = {}
                for n in pairs(_WF.QuestSelections) do table.insert(sel, n) end
                local lines = {
                    "Auto: " .. (_WF.AutoQuestEnabled and "ON" or "OFF"),
                    "Pin: "  .. (_WF.AutoPinQuestEnabled and "ON" or "OFF"),
                    "TP: "   .. (_WF.AutoTpToQuestZoneEnabled and "ON" or "OFF"),
                    "Selected: " .. (#sel == 0 and "—" or table.concat(sel, ", ")),
                }
                if #sel > 0 then
                    table.insert(lines, "")
                    for _, q in ipairs(sel) do
                        local m = getActiveMission(q)
                        if m then
                            table.insert(lines, string.format("  %s: %s (%d/%d)",
                                q, m.name, m.progress, m.required))
                        else
                            table.insert(lines, ("  %s: ✓ complete or not active"):format(q))
                        end
                    end
                end
                questStatus:UpdateBody(table.concat(lines, "\n"))
            end)
        end
    end)

    -- Main quest loop — САМОДОСТАТОЧНЫЙ, как в легаси v0.37. Делает свою атаку через
    -- _WF.runTargetFarmStep с собственной gate-функцией. НЕ зависит от того включён
    -- ли Auto Farm toggle — квест будет фармить миссию в любом случае.
    task.spawn(function()
        local function questGate() return _WF.AutoQuestEnabled end
        while getgenv()._WFRunning do
            -- Уважаем star-open / zone-tp / trial / join-window (mutex'ы)
            if _WF.StarBusy or _WF.ZoneTpBusy or _WF.TrialBusy or _WF.GamemodeJoinBusy then
                while (_WF.StarBusy or _WF.ZoneTpBusy or _WF.TrialBusy or _WF.GamemodeJoinBusy)
                    and getgenv()._WFRunning and _WF.AutoQuestEnabled
                do
                    task.wait(0.1)
                end
            end
            if not (_WF.AutoQuestEnabled and _WF.ModulesLoaded) then
                task.wait(0.5)
            else
                safe(function()
                    -- [1] Находим активный квест и миссию
                    local selected = _WF.QuestSelections or {}
                    local names = {}
                    for n in pairs(selected) do table.insert(names, n) end
                    table.sort(names)

                    local activeQuestName, activeMission
                    for _, qn in ipairs(names) do
                        local m = getActiveMission(qn)
                        if m then activeQuestName, activeMission = qn, m; break end
                    end

                    if not activeQuestName then
                        -- Нет активных миссий — ждём 3с и пробуем снова
                        _WF._lastQuestNotified = nil
                        task.wait(3)
                        return
                    end

                    -- Уведомляем при смене активного квеста/миссии (без спама)
                    local notifyKey = activeQuestName .. "|" .. tostring(activeMission.name)
                    if _WF._lastQuestNotified ~= notifyKey then
                        _WF._lastQuestNotified = notifyKey
                        Notify(("Quest: %s → %s (%d/%d)"):format(
                            activeQuestName,
                            tostring(activeMission.name),
                            tonumber(activeMission.progress) or 0,
                            tonumber(activeMission.required) or 0
                        ), 3)
                    end

                    -- [2] Pin
                    if _WF.AutoPinQuestEnabled then pinQuest(activeQuestName) end

                    -- [3] Target (для отображения в Farm-status + для любых observer'ов)
                    local targetSet = { [activeMission.name] = true }
                    _WF.Targets = targetSet

                    -- [4] TP в зону квеста если нужно
                    if _WF.AutoTpToQuestZoneEnabled and not isInQuestZone(activeQuestName) then
                        _WF.ZoneTpBusy = true
                        tpToQuestZone(activeQuestName)
                        task.wait(1.5)
                        _WF.ZoneTpBusy = false
                    end

                    -- [5] Одна итерация фарма миссии (атака / streaming / zone routing)
                    _WF.runTargetFarmStep(targetSet, questGate)
                end)
            end
        end
    end)
end)
if not _ok_quests then warn("[ApelHub] QUESTS tab failed: " .. tostring(_err_quests)) end

-- ════════════════════════════════════════════════════════════════
-- // 12. TRIALS TAB
-- ════════════════════════════════════════════════════════════════
local _ok_trials, _err_trials = pcall(function()
    local TRIAL_NAME_PATTERN = "^Trial "
    local function isTrialName(n) return type(n) == "string" and n:match(TRIAL_NAME_PATTERN) ~= nil end

    -- Только трайлы с реальными конфигами в Shared.Gamemodes.
    -- workspace.Server.Enemies.Gamemodes содержит стаб-папки "Trial Hard"/"Trial Medium"
    -- как задел на будущий контент — их конфиг ещё не добавлен разработчиками, играть в них
    -- нельзя. Когда игра добавит их в Shared.Gamemodes — сканер подхватит автоматически.
    local function getAllTrials()
        local out, seen = {}, {}
        local function add(n) if isTrialName(n) and not seen[n] then seen[n] = true; table.insert(out, n) end end
        local sg = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Gamemodes
        if type(sg) == "table" then
            for k, v in pairs(sg) do
                if type(v) == "table" then
                    if v.OpenTimes or v.MapName or v.EnterTime or v.MaxWave then add(k)
                    else
                        -- Подпапка типа Shared.Gamemodes["For Updates"] — перебираем её содержимое
                        for k2, v2 in pairs(v) do
                            if type(v2) == "table" and (v2.OpenTimes or v2.MapName or v2.EnterTime or v2.MaxWave) then add(k2) end
                        end
                    end
                end
            end
        end
        table.sort(out)
        return out
    end

    -- Trial-specific mob folder (в отличие от обычных зон — трайл'ы лежат в Gamemodes/)
    local function getTrialEnemiesFolder(name)
        local ok, f = pcall(function()
            return Workspace.Server.Enemies.Gamemodes:FindFirstChild(name)
        end)
        if ok then return f end
        return nil
    end

    -- Двойной heuristic: Data.Gamemode ИЛИ папка с мобами непустая.
    -- Data.Gamemode может иногда быть nil пока игрок телепортируется, а мобы уже заспавнились.
    local function isInTrial(name)
        local f = getTrialEnemiesFolder(name)
        if f and #f:GetChildren() > 0 then return true end
        local d = _WF.Omni and _WF.Omni.Data
        if d and d.Gamemode == name then return true end
        return false
    end

    -- Выход из gamemode — TP через Signal. Сервер автоматом снимает Gamemode статус
    -- при смене зоны (если зона != текущая trial зона).
    -- ПАТТЕРН из рабочей версии: всегда fire, ждём 4с, не проверяем успех.
    local function leaveTrial()
        _WF.ZoneTpBusy = true
        if _WF.SavedPosition then
            tpToSavedPosition()  -- сам фаирит signal + 4с wait + CFrame
        else
            -- Fallback: просто TP в Fruits Verse 1 с 4с wait
            safe(function()
                _WF.Omni.Signal:Fire("Player", "Teleport", "Teleport", "Fruits Verse", 1)
            end)
            task.wait(4)
        end
        _WF.ZoneTpBusy = false
        return true  -- успех подразумевается — signal выпустили, сервер делает что делает
    end

    -- Один тик фарма внутри трайла: бьём ближайшего живого моба из gamemode-folder.
    -- Все мобы в трайле считаются таргетом (нет "селекта имени").
    local function runTrialFarmStep(trialName, gateFn)
        gateFn = gateFn or function() return true end
        local folder = getTrialEnemiesFolder(trialName)
        if not folder then return end
        local hrp0 = getHRP()
        local myPos = (hrp0 and hrp0.Position) or Vector3.new()
        local candidates = {}
        for _, mob in ipairs(folder:GetChildren()) do
            if _WF.isAlive(mob) then
                local p = _WF.getMobPos(mob)
                if p then
                    table.insert(candidates, { mob = mob, dist = (p - myPos).Magnitude })
                end
            end
        end
        if #candidates == 0 then
            task.wait(1)  -- волна закончилась / следующая спавнится
            return
        end
        -- Ближайший первый
        table.sort(candidates, function(a, b) return a.dist < b.dist end)
        local mob = candidates[1].mob
        _WF.teleportTo(mob)
        task.wait(0.08)
        local cd         = _WF.getClickCooldown()
        local started    = tick()
        local lastHP     = _WF.getMobHP(mob)
        local lastHPTick = tick()
        while gateFn() and getgenv()._WFRunning
            and not _WF.StarBusy and not _WF.ZoneTpBusy
            and _WF.isAlive(mob) and tick() - started < 15
        do
            local hrp = getHRP()
            local mp  = _WF.getMobPos(mob)
            if hrp and mp then
                local my = hrp.Position
                if (mp - my).Magnitude > 12 then
                    _WF.teleportTo(mob)
                    task.wait(0.05)
                end
                _WF.attackOnce()
            end
            local curHP = _WF.getMobHP(mob)
            if curHP and lastHP and curHP < lastHP then
                lastHP = curHP; lastHPTick = tick()
            elseif tick() - lastHPTick > 1.5 then
                break
            end
            task.wait(cd)
        end
    end

    -- ═══════════════════════════════════════════════════════════════════
    -- Dragon Defense — отдельный event-gamemode.
    -- Отличия от Trial:
    --   * Нет OpenTimes — доступен всегда. Гейт = наличие Saiyan Key (Item).
    --   * У игрока 3 жизни, мобы идут к базе — её надо защищать.
    --   * Farm по расстоянию к БАЗЕ (не к игроку) — чем ближе моб к базе тем приоритетнее.
    -- Наш mutex `_WF.TrialBusy` reuse'ится семантически (= "event-gamemode активен").
    -- ═══════════════════════════════════════════════════════════════════

    -- Saiyan Key check — через тот же Utils.Info:GetPriceAmount что игра использует.
    local function hasSaiyanKey()
        local data = _WF.Omni and _WF.Omni.Data
        local util = _WF.Omni and _WF.Omni.Utils and _WF.Omni.Utils.Info
        if not (data and util and type(util.GetPriceAmount) == "function") then return false end
        local ok, amount = pcall(function() return util:GetPriceAmount("Item", "Saiyan Key", data) end)
        return ok and type(amount) == "number" and amount >= 1
    end

    -- База DD — ищем несколько способов, `children[71]` ненадёжен
    -- (индекс может меняться между билдами). Пробуем по порядку:
    --   1. FindFirstChild("Base") / "HQ" / "Tower" / "Main"
    --   2. Child с атрибутом IsBase=true
    --   3. Child чьё имя содержит "base"/"hq"/"tower"
    --   4. children[71] как last-resort
    --   5. Самый большой BasePart в модели (база обычно центральная крупная часть)
    local function getDragonDefenseBasePos()
        local model
        safe(function()
            local mapsRoot = Workspace:FindFirstChild("Client") and Workspace.Client:FindFirstChild("Maps")
            local mapFolder = mapsRoot and mapsRoot:FindFirstChild("Dragon Defense")
            local mapNode = mapFolder and mapFolder:FindFirstChild("Map")
            local defense = mapNode and mapNode:FindFirstChild("Defense")
            model = defense and defense:FindFirstChild("Model")
        end)
        if not model then return nil end

        local function extract(obj)
            if not obj then return nil end
            if obj:IsA("BasePart") then return obj.Position end
            if obj:IsA("Model") then
                if obj.PrimaryPart then return obj.PrimaryPart.Position end
                local ok, p = pcall(function() return obj:GetPivot().Position end)
                if ok and p then return p end
                for _, desc in ipairs(obj:GetDescendants()) do
                    if desc:IsA("BasePart") then return desc.Position end
                end
            end
            return nil
        end

        local children = model:GetChildren()
        -- [1] Known names
        for _, name in ipairs({ "Base", "HQ", "Tower", "Main", "Dragon" }) do
            local c = model:FindFirstChild(name)
            if c then local p = extract(c); if p then return p end end
        end
        -- [2] Attribute + [3] name pattern
        for _, c in ipairs(children) do
            if c:GetAttribute("IsBase") then
                local p = extract(c); if p then return p end
            end
            local lname = c.Name:lower()
            if lname:match("base") or lname:match("hq") or lname:match("tower") then
                local p = extract(c); if p then return p end
            end
        end
        -- [4] Legacy children[71]
        if children[71] then
            local p = extract(children[71]); if p then return p end
        end
        -- [5] Largest BasePart as last-resort
        local biggest, biggestSize = nil, 0
        for _, desc in ipairs(model:GetDescendants()) do
            if desc:IsA("BasePart") then
                local s = desc.Size.X * desc.Size.Y * desc.Size.Z
                if s > biggestSize then biggestSize = s; biggest = desc end
            end
        end
        if biggest then return biggest.Position end
        return nil
    end

    -- В режиме? Двойной heuristic как у isInTrial.
    local function isInDragonDefense()
        local d = _WF.Omni and _WF.Omni.Data
        if d and d.Gamemode == "Dragon Defense" then return true end
        local f = getTrialEnemiesFolder("Dragon Defense")
        if f and #f:GetChildren() > 0 then return true end
        return false
    end

    -- ═══════════════════════════════════════════════════════════════════
    -- TEMPEST INVASION хелперы (event-gamemode, аналог Dragon Defense)
    -- ═══════════════════════════════════════════════════════════════════
    -- Slime Key check (аналог hasSaiyanKey) — для запуска Tempest Invasion.
    local function hasSlimeKey()
        local data = _WF.Omni and _WF.Omni.Data
        local util = _WF.Omni and _WF.Omni.Utils and _WF.Omni.Utils.Info
        if not (data and util and type(util.GetPriceAmount) == "function") then return false end
        local ok, amount = pcall(function() return util:GetPriceAmount("Item", "Slime Key", data) end)
        return ok and type(amount) == "number" and amount >= 1
    end

    local function isInTempestInvasion()
        local d = _WF.Omni and _WF.Omni.Data
        if d and d.Gamemode == "Tempest Invasion" then return true end
        local f = getTrialEnemiesFolder("Tempest Invasion")
        if f and #f:GetChildren() > 0 then return true end
        return false
    end

    local function getTempestInvasionWave()
        if _WF.Omni and _WF.Omni.Libs and _WF.Omni.Libs.DataContainer then
            local ok, c = pcall(function() return _WF.Omni.Libs.DataContainer:Get("GamemodeData - Tempest Invasion") end)
            if ok and c and c.Data and type(c.Data.Wave) == "number" then return c.Data.Wave end
        end
        return nil
    end

    local function getDragonDefenseWave()
        if _WF.Omni and _WF.Omni.Libs and _WF.Omni.Libs.DataContainer then
            local ok, c = pcall(function() return _WF.Omni.Libs.DataContainer:Get("GamemodeData - Dragon Defense") end)
            if ok and c and c.Data and type(c.Data.Wave) == "number" then return c.Data.Wave end
        end
        return nil
    end

    -- Farm-step для DD. Приоритет целей:
    --   * Если нашли базу → sort по расстоянию к БАЗЕ (ближайший = приоритет)
    --   * Если базы нет → fallback на closest-to-PLAYER (чтобы не стоять)
    -- DD особенность: мобы бегут к базе постоянно. Если threshold движения большой
    -- (12 studs), моб убегает между attack-тиками → мы промахиваемся → можем
    -- случайно TP за arena bounds. Жёсткий re-TP каждый тик + малый threshold (6).
    local function runDragonDefenseFarmStep(gateFn)
        gateFn = gateFn or function() return true end
        local folder = getTrialEnemiesFolder("Dragon Defense")
        if not folder then
            dbg("DD: enemies folder missing")
            task.wait(1); return
        end
        local basePos = getDragonDefenseBasePos()
        local hrp0 = getHRP()
        local myPos = hrp0 and hrp0.Position
        local refPos = basePos or myPos
        if not refPos then
            dbg("DD: no base and no HRP — skipping tick")
            task.wait(0.5); return
        end

        local candidates = {}
        for _, mob in ipairs(folder:GetChildren()) do
            if _WF.isAlive(mob) then
                local p = _WF.getMobPos(mob)
                if p then
                    table.insert(candidates, { mob = mob, dist = (p - refPos).Magnitude })
                end
            end
        end
        if #candidates == 0 then
            dbg(("DD: no attackable mobs (folder has %d children)"):format(#folder:GetChildren()))
            task.wait(1); return
        end
        table.sort(candidates, function(a, b) return a.dist < b.dist end)
        local mob = candidates[1].mob
        _WF.teleportTo(mob)
        task.wait(0.08)
        local cd         = _WF.getClickCooldown()
        local started    = tick()
        local lastHP     = _WF.getMobHP(mob)
        local lastHPTick = tick()
        while gateFn() and getgenv()._WFRunning
            and not _WF.StarBusy and not _WF.ZoneTpBusy
            and _WF.isAlive(mob) and tick() - started < 15
        do
            local hrp = getHRP()
            local mp  = _WF.getMobPos(mob)
            if hrp and mp then
                -- DD-specific: мобы ДВИГАЮТСЯ к базе, поэтому re-TP АГРЕССИВНО.
                -- threshold=6 (не 12) — моба легко унесёт за 0.3с тика. Каждый тик
                -- проверяем distance + TP если надо, ТОЛЬКО ПОТОМ attack.
                if (mp - hrp.Position).Magnitude > 6 then
                    _WF.teleportTo(mob)
                    task.wait(0.05)
                end
                _WF.attackOnce()
            end
            local curHP = _WF.getMobHP(mob)
            if curHP and lastHP and curHP < lastHP then
                lastHP = curHP; lastHPTick = tick()
            elseif tick() - lastHPTick > 1.5 then
                break
            end
            task.wait(cd)
        end
    end

    -- Wave detection: DataContainer primary, fallbacks below
    local function getCurrentWave(name)
        if _WF.Omni and _WF.Omni.Libs and _WF.Omni.Libs.DataContainer then
            local ok, c = pcall(function() return _WF.Omni.Libs.DataContainer:Get("GamemodeData - " .. name) end)
            if ok and c and c.Data and type(c.Data.Wave) == "number" and c.Data.Wave > 0 then
                return c.Data.Wave
            end
        end
        local d = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Gamemodes
        if type(d) == "table" and type(d[name]) == "table" then
            for _, key in ipairs({ "Wave", "CurrentWave" }) do
                if type(d[name][key]) == "number" then return d[name][key] end
            end
        end
        -- PlayerGui HUD text fallback
        local pg = LocalPlayer:FindFirstChild("PlayerGui")
        local ui = pg and pg:FindFirstChild("UI")
        local hud = ui and ui:FindFirstChild("HUD")
        local gms = hud and hud:FindFirstChild("Gamemodes")
        local modeUI = gms and gms:FindFirstChild(name)
        local valueNode = modeUI and modeUI:FindFirstChild("Main")
            and modeUI.Main:FindFirstChild("Wave") and modeUI.Main.Wave:FindFirstChild("Value")
        if valueNode and valueNode:IsA("TextLabel") then
            local cur = valueNode.Text:match("^(%d+)")
            if cur then return tonumber(cur) end
        end
        return nil
    end

    local trialDropdown -- forward

    -- Приоритет по сложности: Hard > Medium > Easy (первым в join-очереди идёт Hard).
    -- Для кастомных трайлов (Trial Insane etc.) — fallback на алфавит.
    local DIFFICULTY_RANK = {
        ["Trial Secret"] = 1, ["Trial Boss"] = 2, ["Trial Insane"] = 3,
        ["Trial Hard"] = 4, ["Trial Medium"] = 5, ["Trial Easy"] = 6,
    }
    local function difficultyRank(name) return DIFFICULTY_RANK[name] or 99 end

    -- Runtime-статус трайла через игровой API.
    -- Возвращает { opened = bool, secondsToNext = number }
    --   opened        — DataContainer.Data.Opened (игра сама этот флаг использует для AutoRoll)
    --   secondsToNext — секунд до следующего окна (0 = открыт сейчас)
    local function getTrialStatus(name)
        local out = { opened = false, secondsToNext = nil }
        local SG = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Gamemodes
        if not SG then return out end

        -- Проверяем что трайл реально таймерный в этой версии игры.
        if type(SG.IsTimedGamemode) ~= "function" then return out end
        local okT, timed = pcall(SG.IsTimedGamemode, name)
        if not (okT and timed) then return out end  -- не сконфигурирован → статус недоступен

        local lastStart = 0
        if _WF.Omni.Libs and _WF.Omni.Libs.DataContainer then
            local ok, c = pcall(function() return _WF.Omni.Libs.DataContainer:Get("GamemodeData - " .. name) end)
            if ok and c and c.Data then
                if c.Data.Opened == true then out.opened = true end
                if type(c.Data.LastStart) == "number" then lastStart = c.Data.LastStart end
            end
        end

        if type(SG.GetTimeForNextOpen) == "function" then
            local okS, secs = pcall(SG.GetTimeForNextOpen, name, lastStart)
            if okS and type(secs) == "number" then out.secondsToNext = secs end
        end

        return out
    end

    local function formatSeconds(s)
        if type(s) ~= "number" then return "—" end
        if s <= 0 then return "now" end
        local m = math.floor(s / 60)
        local sec = math.floor(s - m * 60)
        if m > 0 then return ("%dm %ds"):format(m, sec) end
        return ("%ds"):format(sec)
    end

    sec.TrialsL:Header({ Text = "Trials" })

    sec.TrialsL:Toggle({ Name = "Auto Trial", Default = false,
        Callback = function(s)
            _WF.AutoTrialEnabled = s
            if not s then _WF.TrialBusy = false end  -- снимаем mutex когда отключили
        end,
    }, "AutoTrialToggle")

    trialDropdown = sec.TrialsL:Dropdown({
        Name = "Trials to run (multi)", Multi = true, Required = false,
        Options = getAllTrials(),
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do if v and type(k) == "string" then set[k] = true end end
            end
            _WF.TrialSelections = set
        end,
    }, "TrialSelectionsDropdown")

    sec.TrialsL:Button({
        Name = "Refresh Trial List",
        Callback = function()
            pcall(function()
                trialDropdown:ClearOptions()
                trialDropdown:InsertOptions(getAllTrials())
            end)
            Notify("Trial list refreshed", 2)
        end,
    })

    sec.TrialsL:Slider({
        Name = "Auto Leave on Wave (0=off)", Default = 0,
        Minimum = 0, Maximum = 50, Precision = 0, DisplayMethod = "Value",
        Callback = function(v) _WF.TrialAutoLeaveWave = tonumber(v) or 0 end,
    }, "TrialAutoLeaveWaveSlider")

    sec.TrialsL:Button({ Name = "Leave Trial Now",
        Callback = function() leaveTrial() end,
    })

    -- ── Saved Position (для возврата после event-gamemode'ов) ──
    sec.TrialsL:Header({ Text = "Saved Position" })
    local positionLabel = wrapParagraph(sec.TrialsL:Paragraph({
        Header = "Position",
        Body = _WF.SavedPosition and (
            ("%s\n(%.0f, %.0f, %.0f)"):format(
                _WF.SavedLocation or "—",
                _WF.SavedPosition.Position.X,
                _WF.SavedPosition.Position.Y,
                _WF.SavedPosition.Position.Z
            )
        ) or "not saved — set by 'Save Current Position'",
    }))
    sec.TrialsL:Button({
        Name = "Save Current Position",
        Callback = function()
            local hrp = getHRP()
            if not hrp then Notify("No character", 3); return end
            local d = _WF.Omni and _WF.Omni.Data or {}
            _WF.SavedPosition = hrp.CFrame
            _WF.SavedLocation = ("%s | Zone %s"):format(d.Map or "?", tostring(d.Zone or 1))
            savePositionToFile(_WF.SavedPosition, _WF.SavedLocation)
            local p = _WF.SavedPosition.Position
            positionLabel:UpdateBody(("%s\n(%.0f, %.0f, %.0f)"):format(_WF.SavedLocation, p.X, p.Y, p.Z))
            Notify("Position saved: " .. _WF.SavedLocation, 3)
        end,
    })
    sec.TrialsL:Button({
        Name = "TP to Saved Position",
        Callback = function()
            if not _WF.SavedPosition then Notify("No saved position", 3); return end
            _WF.ZoneTpBusy = true
            task.spawn(function()
                tpToSavedPosition()
                _WF.ZoneTpBusy = false
            end)
        end,
    })

    -- ── Dragon Defense UI ──
    sec.TrialsL:Header({ Text = "Dragon Defense" })
    sec.TrialsL:Toggle({ Name = "Auto Dragon Defense", Default = false,
        Callback = function(s)
            _WF.AutoDragonDefenseEnabled = s
            if not s then _WF.TrialBusy = false end  -- снимаем mutex при отключении
        end,
    }, "AutoDragonDefenseToggle")
    sec.TrialsL:Slider({
        Name = "DD: Leave at Wave (0 = run full)", Default = 0,
        Minimum = 0, Maximum = 100, Precision = 0, DisplayMethod = "Value",
        Callback = function(v) _WF.DragonDefenseLeaveWave = tonumber(v) or 0 end,
    }, "DragonDefenseLeaveWaveSlider")
    sec.TrialsL:Button({ Name = "Leave DD Now",
        Callback = function() leaveTrial() end,
    })

    -- ── Gamemode Priority ──
    -- Когда ВКЛЮЧЕНЫ И Auto Trial И Auto Dragon Defense — какой из них делать первым.
    -- Без этого оба цикла параллельно пытались Join → конфликт: ты не попадаешь
    -- стабильно ни в один. Теперь только выбранный запускается.
    sec.TrialsL:Divider()
    sec.TrialsL:Header({ Text = "Priority (when 2+ ON)" })
    sec.TrialsL:Dropdown({
        Name = "Gamemode Priority",
        Options = { "DragonDefense", "TempestInvasion", "Trial" },
        Default = "DragonDefense",
        Callback = function(v)
            if v == "Trial" or v == "DragonDefense" or v == "TempestInvasion" then
                _WF.GamemodePriority = v
            end
        end,
    }, "GamemodePriorityDropdown")

    -- Per-trial retry tracking — don't spam Join when the server rejects.
    local TRIAL_JOIN_RETRY = 20  -- seconds between retry attempts for the same trial
    local _lastJoinAttempt = {}
    local function canTryJoin(name)
        local last = _lastJoinAttempt[name] or 0
        return (tick() - last) >= TRIAL_JOIN_RETRY
    end

    sec.TrialsR:Header({ Text = "Status" })
    local trialStatus = wrapParagraph(sec.TrialsR:Paragraph({ Header = "Trials", Body = "—" }))

    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(1)
            safe(function()
                local sel = {}
                for n in pairs(_WF.TrialSelections) do table.insert(sel, n) end
                table.sort(sel, function(a, b) return difficultyRank(a) < difficultyRank(b) end)
                local inGm = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Gamemode
                local curWave = inGm and getCurrentWave(inGm)
                local lines = {
                    "Auto: " .. (_WF.AutoTrialEnabled and "ON" or "OFF"),
                    "Leave wave: " .. tostring(_WF.TrialAutoLeaveWave),
                    "Current: " .. tostring(inGm or "—"),
                    "Wave: " .. tostring(curWave or "—"),
                }
                -- Per-trial status: Running / Opens in Xm Ys (читаем игровой DataContainer)
                if #sel > 0 then
                    table.insert(lines, "")
                    table.insert(lines, "Status (Hard → Easy):")
                    for _, n in ipairs(sel) do
                        local st = getTrialStatus(n)
                        local statusStr
                        if st.opened then
                            statusStr = "⏺ RUNNING"
                        elseif st.secondsToNext then
                            statusStr = "⏱ opens in " .. formatSeconds(st.secondsToNext)
                        else
                            statusStr = "—"
                        end
                        table.insert(lines, ("  %s: %s"):format(n, statusStr))
                    end
                end
                trialStatus:UpdateBody(table.concat(lines, "\n"))
            end)
        end
    end)

    -- Main trial loop — самодостаточный (как в легаси v0.37):
    -- [A] если в трайле — check leave threshold, иначе бьём мобов (runTrialFarmStep)
    -- [B] если не в трайле — пробуем join с retry backoff
    task.spawn(function()
        local function trialGate() return _WF.AutoTrialEnabled end
        local wasInTrial = false  -- отслеживаем transition "был в трайле → вышел" для auto-TP назад
        while getgenv()._WFRunning do
            -- Уважаем star-open / zone-tp мьютекс
            if _WF.StarBusy or _WF.ZoneTpBusy then
                while (_WF.StarBusy or _WF.ZoneTpBusy) and getgenv()._WFRunning and _WF.AutoTrialEnabled do
                    task.wait(0.1)
                end
            end

            -- Priority gate: если DD/TI приоритет и тогл их включён — Trial loop ждёт.
            -- Exception: если физически уже В трайле (прошлая сессия), обрабатываем
            -- выход/natural-end чтобы не застрять.
            local priorityBlocked = false
            if _WF.AutoDragonDefenseEnabled and _WF.GamemodePriority == "DragonDefense" then
                local inAnyTrial = false
                for n in pairs(_WF.TrialSelections or {}) do
                    if isInTrial(n) then inAnyTrial = true; break end
                end
                if not inAnyTrial then priorityBlocked = true end
            end
            if _WF.AutoTempestInvasionEnabled and _WF.GamemodePriority == "TempestInvasion" then
                local inAnyTrial = false
                for n in pairs(_WF.TrialSelections or {}) do
                    if isInTrial(n) then inAnyTrial = true; break end
                end
                if not inAnyTrial then priorityBlocked = true end
            end

            if not (_WF.AutoTrialEnabled and _WF.ModulesLoaded) then
                task.wait(0.5)
            elseif priorityBlocked then
                task.wait(1)
            else
                safe(function()
                    local selected = _WF.TrialSelections or {}
                    local names = {}
                    for n in pairs(selected) do table.insert(names, n) end
                    table.sort(names)

                    if #names == 0 then
                        task.wait(2)
                        return
                    end

                    -- [A] Уже в одном из выбранных трайлов?
                    local inTrialName
                    for _, n in ipairs(names) do
                        if isInTrial(n) then inTrialName = n; break end
                    end

                    -- Natural-end detection: если были в трайле а теперь нет — ждём Results
                    -- screen, TP'аемся на saved position. Не путать с leaveTrial() который
                    -- сам ставит wasInTrial=false после выхода.
                    if wasInTrial and not inTrialName then
                        wasInTrial = false
                        if _WF.SavedPosition then
                            Notify("Trial ended — returning to saved position", 3)
                            task.wait(4)  -- Results screen / респавн персонажа
                            _WF.ZoneTpBusy = true
                            tpToSavedPosition()
                            _WF.ZoneTpBusy = false
                        end
                        return  -- следующая итерация попробует Join заново
                    end

                    if inTrialName then
                        wasInTrial = true
                        -- Мы в трайле — блочим farm/egg/quest. Приоритет Trial выше всех.
                        _WF.TrialBusy = true
                        local wave = getCurrentWave(inTrialName)
                        local leaveThr = tonumber(_WF.TrialAutoLeaveWave) or 0
                        if leaveThr > 0 and type(wave) == "number" and wave >= leaveThr then
                            -- Target wave достигнут. TP через Signal — сервер сам
                            -- очистит Gamemode status при смене зоны.
                            Notify(("Trial %s: wave %d ≥ %d — leaving"):format(
                                inTrialName, wave, leaveThr), 4)
                            leaveTrial()  -- always-on signal + 4с wait внутри
                            _WF.TrialSelections[inTrialName] = nil
                            if not next(_WF.TrialSelections) then
                                _WF.AutoTrialEnabled = false
                                Notify("Auto Trial: all targets reached — disabled", 4)
                            end
                            _WF.TrialBusy = false
                            task.wait(2)
                        else
                            runTrialFarmStep(inTrialName, trialGate)
                        end
                    else
                        -- Не в трайле — mutex снят, другие фичи могут работать
                        _WF.TrialBusy = false
                        -- [B] Не в трайле. Считываем runtime-статусы, фильтруем
                        -- только реально открытые, сортируем по сложности (Hard первый).
                        local openNow, soonest = {}, nil
                        for _, n in ipairs(names) do
                            local st = getTrialStatus(n)
                            if st.opened then
                                table.insert(openNow, n)
                            end
                            if type(st.secondsToNext) == "number" and st.secondsToNext > 0 then
                                if not soonest or st.secondsToNext < soonest then
                                    soonest = st.secondsToNext
                                end
                            end
                        end
                        -- Sort по сложности: Hard → Medium → Easy
                        table.sort(openNow, function(a, b) return difficultyRank(a) < difficultyRank(b) end)

                        local joined = false
                        for _, n in ipairs(openNow) do
                            if canTryJoin(n) then
                                _lastJoinAttempt[n] = tick()
                                -- TRANSITION: если сейчас в другом gamemode (например DD или
                                -- другом трайле), сначала выходим в обычный мир. Сервер не
                                -- любит Join из гейммода в гейммод — игрок застревает.
                                local curGm = _WF.Omni.Data and _WF.Omni.Data.Gamemode
                                if curGm and curGm ~= n then
                                    dbg(("Trial: transitioning via normal world (from %s)"):format(curGm))
                                    leaveTrial()  -- signal + 4с wait
                                    task.wait(0.5)
                                end
                                local entered = _WF.fireGamemodeJoin(n, 5)
                                if entered or isInTrial(n) then
                                    joined = true
                                    Notify("Entered " .. n, 3)
                                    break
                                end
                            end
                        end
                        if not joined then
                            -- Умный wait: до ближайшего открытия любого из выбранных
                            -- (но минимум 3с, максимум 60с — чтобы не уснуть слишком надолго
                            -- если у нас вдруг устаревший timer).
                            if soonest then
                                task.wait(math.clamp(soonest + 1, 3, 60))
                            else
                                task.wait(5)
                            end
                        end
                    end
                end)
            end
        end
    end)

    -- ═══════════════════════════════════════════════════════════════════
    -- Dragon Defense main loop — отдельный task.spawn, не пересекается с Trial loop.
    -- Структура: mutex-wait → если в DD фармим → иначе если есть ключ и не в другом
    -- gamemode → Join.
    -- ═══════════════════════════════════════════════════════════════════
    task.spawn(function()
        local DD = "Dragon Defense"
        local function ddGate() return _WF.AutoDragonDefenseEnabled end
        local DD_JOIN_RETRY = 8  -- секунд между попытками Join
        local lastJoinAttempt = 0
        local lastKeyWarn = 0
        local wasInDD = false  -- natural-end tracking
        while getgenv()._WFRunning do
            -- Уважаем star-open / zone-tp мьютексы
            if _WF.StarBusy or _WF.ZoneTpBusy then
                while (_WF.StarBusy or _WF.ZoneTpBusy) and getgenv()._WFRunning and _WF.AutoDragonDefenseEnabled do
                    task.wait(0.1)
                end
            end

            -- Priority gate: Trial/TI приоритет + соответствующий тогл включён →
            -- DD ждёт. Exception: если мы УЖЕ в DD физически, обрабатываем выход.
            local priorityBlocked = false
            if _WF.AutoTrialEnabled and _WF.GamemodePriority == "Trial" then
                local hasSel = _WF.TrialSelections and next(_WF.TrialSelections)
                if hasSel and not isInDragonDefense() then
                    priorityBlocked = true
                end
            end
            if _WF.AutoTempestInvasionEnabled and _WF.GamemodePriority == "TempestInvasion" then
                if not isInDragonDefense() then
                    priorityBlocked = true
                end
            end

            if not (_WF.AutoDragonDefenseEnabled and _WF.ModulesLoaded) then
                task.wait(0.5)
            elseif priorityBlocked then
                task.wait(1)
            else
                safe(function()
                    local currentlyInDD = isInDragonDefense()

                    -- Natural-end: был в DD → сервер нас выбросил (закончились жизни / победа)
                    if wasInDD and not currentlyInDD then
                        wasInDD = false
                        _WF.TrialBusy = false
                        if _WF.SavedPosition then
                            Notify("Dragon Defense ended — returning to saved position", 3)
                            task.wait(4)
                            _WF.ZoneTpBusy = true
                            tpToSavedPosition()
                            _WF.ZoneTpBusy = false
                        end
                        lastJoinAttempt = 0  -- сбрасываем retry чтобы next tick попробовал Join снова
                        return
                    end

                    if currentlyInDD then
                        wasInDD = true
                        -- [A] В режиме — фармим или уходим
                        _WF.TrialBusy = true
                        local wave = getDragonDefenseWave()
                        local leaveAt = tonumber(_WF.DragonDefenseLeaveWave) or 0
                        if leaveAt > 0 and type(wave) == "number" and wave >= leaveAt then
                            Notify(("Dragon Defense: wave %d ≥ %d — leaving"):format(wave, leaveAt), 4)
                            leaveTrial()  -- signal + 4с wait
                            _WF.AutoDragonDefenseEnabled = false
                            _WF.TrialBusy = false
                            wasInDD = false  -- вышли сами, не natural-end
                            task.wait(2)
                        else
                            runDragonDefenseFarmStep(ddGate)
                        end
                    else
                        -- [B] Не в режиме — mutex сбрасываем (если DD выключался сам)
                        _WF.TrialBusy = false
                        -- Если мы уже в другом gamemode (Trial etc.) — не трогаем.
                        local curGm = _WF.Omni.Data and _WF.Omni.Data.Gamemode
                        if curGm and curGm ~= DD then
                            task.wait(2)
                            return
                        end
                        -- Нет Saiyan Key → тихо ждём (notify раз в 60с)
                        if not hasSaiyanKey() then
                            if tick() - lastKeyWarn > 60 then
                                lastKeyWarn = tick()
                                Notify("Dragon Defense: no Saiyan Key — waiting", 3)
                            end
                            task.wait(5)
                            return
                        end
                        -- Есть ключ — пробуем Join (с retry cooldown)
                        if tick() - lastJoinAttempt < DD_JOIN_RETRY then
                            task.wait(1); return
                        end
                        lastJoinAttempt = tick()
                        -- TRANSITION: если в другом gamemode (трайл) — сначала выходим
                        -- в обычный мир. Иначе Join DD из трайла даст race condition.
                        local curGm = _WF.Omni.Data and _WF.Omni.Data.Gamemode
                        if curGm and curGm ~= DD then
                            dbg(("DD: transitioning via normal world (from %s)"):format(curGm))
                            leaveTrial()  -- signal + 4с wait
                            task.wait(0.5)
                        end
                        local entered = _WF.fireGamemodeJoin(DD, 5)
                        if entered or isInDragonDefense() then
                            Notify("Entered Dragon Defense", 3)
                        end
                    end
                end)
            end
        end
    end)

    -- ═══════════════════════════════════════════════════════════════════
    -- TEMPEST INVASION (event-gamemode, аналог DD, требует Slime Key)
    -- ═══════════════════════════════════════════════════════════════════
    sec.TrialsL:Divider()
    sec.TrialsL:Header({ Text = "Tempest Invasion" })

    sec.TrialsL:Toggle({
        Name = "Auto Tempest Invasion",
        Default = false,
        Callback = function(s)
            _WF.AutoTempestInvasionEnabled = s
            if not s then _WF.TempestInvasionAbandoned = false end
        end,
    }, "AutoTempestInvasionToggle")

    sec.TrialsL:Slider({
        Name = "TI Leave at Wave (0 = full run)",
        Default = 0, Minimum = 0, Maximum = 200, Increment = 1, Suffix = "",
        Callback = function(v) _WF.TempestInvasionLeaveWave = math.floor(v) end,
    }, "TempestInvasionLeaveWaveSlider")

    sec.TrialsL:Button({
        Name = "Leave Tempest Invasion",
        Callback = function() leaveTrial() end,
    })

    -- ═══════════════════════════════════════════════════════════════════
    -- TI main loop — структура копирует DD: mutex-wait → priority-gate →
    -- если в TI: leave-at-wave check / atom фарма → иначе Join (с Slime Key check).
    -- ═══════════════════════════════════════════════════════════════════
    task.spawn(function()
        local TI = "Tempest Invasion"
        local TI_JOIN_RETRY = 8  -- секунд между попытками Join
        local lastJoinAttempt = 0
        local lastKeyWarn = 0
        local wasInTI = false  -- для natural-end notification
        while getgenv()._WFRunning do
            -- Уважаем star-open / zone-tp мьютексы
            if _WF.StarBusy or _WF.ZoneTpBusy then
                while (_WF.StarBusy or _WF.ZoneTpBusy)
                    and getgenv()._WFRunning and _WF.AutoTempestInvasionEnabled
                do task.wait(0.1) end
            end

            -- Priority gate: если приоритет на Trial/DD и они активны — TI ждёт.
            -- Exception: если уже физически В TI — обрабатываем выход/leave чтобы не застрять.
            local priorityBlocked = false
            if _WF.AutoTrialEnabled and _WF.GamemodePriority == "Trial" then
                if not isInTempestInvasion() then priorityBlocked = true end
            end
            if _WF.AutoDragonDefenseEnabled and _WF.GamemodePriority == "DragonDefense" then
                if not isInTempestInvasion() then priorityBlocked = true end
            end

            if not (_WF.AutoTempestInvasionEnabled and _WF.ModulesLoaded) then
                task.wait(0.5)
            elseif priorityBlocked then
                task.wait(1)
            else
                safe(function()
                    if isInTempestInvasion() then
                        wasInTI = true
                        -- Leave at wave check
                        if _WF.TempestInvasionLeaveWave > 0 and not _WF.TempestInvasionAbandoned then
                            local wave = getTempestInvasionWave()
                            if wave and wave >= _WF.TempestInvasionLeaveWave then
                                _WF.TempestInvasionAbandoned = true
                                Notify(("Tempest Invasion: leave at wave %d"):format(wave), 3)
                                leaveTrial()
                                task.wait(2)
                                return
                            end
                        end
                        -- Inside TI — atom фарма (используем generic farm step c
                        -- любым набором таргетов из _WF.Targets — мобы спавнятся
                        -- в Workspace.Server.Enemies.Gamemodes["Tempest Invasion"]).
                        _WF.TrialBusy = true
                        safe(function()
                            _WF.runTargetFarmStep(_WF.Targets, function() return _WF.AutoTempestInvasionEnabled end)
                        end)
                        _WF.TrialBusy = false
                    else
                        -- Был в TI и вышел (natural end или ручной leave)
                        if wasInTI then
                            wasInTI = false
                            _WF.TempestInvasionAbandoned = false
                            Notify("Tempest Invasion ended", 3)
                        end
                        -- Не в TI — пытаемся войти, если есть Slime Key
                        if not hasSlimeKey() then
                            if tick() - lastKeyWarn > 30 then
                                lastKeyWarn = tick()
                                Notify("Tempest Invasion: no Slime Key — waiting", 3)
                            end
                            task.wait(5)
                            return
                        end
                        if tick() - lastJoinAttempt < TI_JOIN_RETRY then
                            task.wait(1); return
                        end
                        lastJoinAttempt = tick()
                        -- TRANSITION: если в другом gamemode (трайл / DD) — выходим в норм. мир
                        local curGm = _WF.Omni.Data and _WF.Omni.Data.Gamemode
                        if curGm and curGm ~= TI then
                            dbg(("TI: transitioning via normal world (from %s)"):format(curGm))
                            leaveTrial()
                            task.wait(0.5)
                        end
                        local entered = _WF.fireGamemodeJoin(TI, 5)
                        if entered or isInTempestInvasion() then
                            Notify("Entered Tempest Invasion", 3)
                        end
                    end
                end)
            end
        end
    end)
end)
if not _ok_trials then warn("[ApelHub] TRIALS tab failed: " .. tostring(_err_trials)) end

-- ════════════════════════════════════════════════════════════════
-- // 13. GACHA TAB  (multi-gacha: Race, Dragon Power, Fruit, Haki, Slime Power)
-- ════════════════════════════════════════════════════════════════
local _ok_gacha, _err_gacha = pcall(function()
    local RARITY_ORDER = { Common=1, Uncommon=2, Rare=3, Epic=4, Mythical=5, Legendary=6, Secret=7 }
    local RARITY_OPTIONS = { "Common","Uncommon","Rare","Epic","Mythical","Legendary","Secret" }

    local function getAllGachaNames()
        local out = {}
        local list = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Gacha and _WF.Omni.Shared.Gacha.List
        if type(list) == "table" then
            for k in pairs(list) do if type(k) == "string" then table.insert(out, k) end end
        end
        if #out == 0 then out = { "Race", "Dragon Power", "Fruit", "Haki", "Slime Power" } end
        table.sort(out)
        return out
    end

    local function getGachaCfg(name)
        local sg = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Gacha
        if type(sg) ~= "table" then return nil end
        if type(sg.List) == "table" and type(sg.List[name]) == "table" then return sg.List[name] end
        if type(sg[name]) == "table" then return sg[name] end
        return nil
    end

    local function getGachaCurrency(name)
        local cfg = getGachaCfg(name)
        if type(cfg) == "table" and type(cfg.Price) == "table" and type(cfg.Price.Name) == "string" then
            return cfg.Price.Name
        end
        local defaults = {
            Haki = "Haki Token", Fruit = "Fruit Token", Race = "Race Token",
            ["Dragon Power"] = "Dragon Balls Token", ["Slime Power"] = "Slime Token",
        }
        return defaults[name] or (name .. " Token")
    end

    local function getGachaCost(name)
        local cfg = getGachaCfg(name)
        if cfg then
            if type(cfg.Price) == "table" and type(cfg.Price.Amount) == "number" then return cfg.Price.Amount end
            if type(cfg.Cost) == "number" then return cfg.Cost end
        end
        return 1
    end

    local function getCurrencyBalance(currencyName)
        local inv = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Inventory
        if type(inv) == "table" and type(inv.Items) == "table" then
            local v = inv.Items[currencyName]
            if type(v) == "number" then return v end
            if type(v) == "table" and type(v.Amount) == "number" then return v.Amount end
        end
        local d = _WF.Omni and _WF.Omni.Data
        if d and type(d[currencyName]) == "number" then return d[currencyName] end
        return 0
    end

    local function getMaxGachaPerRoll()
        local u = _WF.Omni and _WF.Omni.Utils and _WF.Omni.Utils.PlayerStats
        if type(u) == "table" then
            for _, fname in ipairs({ "GachaRolls", "MaxGachaRoll", "Rolls" }) do
                if type(u[fname]) == "function" then
                    local ok, val = pcall(function() return u[fname](_WF.Omni.Data, _WF.Omni.Instance) end)
                    if ok and type(val) == "number" and val >= 1 then return math.floor(val) end
                end
            end
        end
        return 1
    end

    -- Rarity tracking via SourceInfo (Haki stores in .Vault, others in Inventory)
    local function getSourceInfo(name)
        local cfg = getGachaCfg(name)
        if type(cfg) == "table" and type(cfg.SourceInfo) == "table" then return cfg.SourceInfo end
        return nil
    end

    local function hasRarityOrHigher(gachaName, targetR)
        local targetOrder = RARITY_ORDER[targetR] or 0
        local si = getSourceInfo(gachaName)
        if not si then return false end
        -- 1) Vault (Haki-style: booleans in Data.Gacha.<name>.Vault)
        local dg = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Gacha
        if type(dg) == "table" and type(dg[gachaName]) == "table" then
            local vault = dg[gachaName].Vault
            if type(vault) == "table" then
                for rewardName, owned in pairs(vault) do
                    if owned and si[rewardName] and (RARITY_ORDER[si[rewardName].Rarity] or 0) >= targetOrder then
                        return true, si[rewardName].Rarity
                    end
                end
            end
        end
        -- 2) Inventory scan (non-Vault gachas like Fruit store directly)
        local inv = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Inventory
        if type(inv) == "table" then
            local cats = { "Units", "Swords", "Accessories", "Mounts", "Avatars", "Hakis", "Fruits", "Powers" }
            for _, cat in ipairs(cats) do
                local t = inv[cat]
                if type(t) == "table" then
                    for k, v in pairs(t) do
                        local nm = (type(v) == "table" and (v.Name or tostring(k))) or tostring(k)
                        if si[nm] and (RARITY_ORDER[si[nm].Rarity] or 0) >= targetOrder then
                            return true, si[nm].Rarity
                        end
                    end
                end
            end
        end
        return false
    end

    local function getMyUnitsByRarity(gachaName)
        local counts, total = {}, 0
        local si = getSourceInfo(gachaName)
        if not si then return counts, total end
        local dg = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Gacha
        if type(dg) == "table" and type(dg[gachaName]) == "table" and type(dg[gachaName].Vault) == "table" then
            for rname, owned in pairs(dg[gachaName].Vault) do
                if owned and si[rname] then
                    local r = si[rname].Rarity
                    if r then counts[r] = (counts[r] or 0) + 1; total = total + 1 end
                end
            end
        end
        local inv = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Inventory
        if type(inv) == "table" then
            for _, cat in ipairs({ "Units","Swords","Accessories","Mounts","Avatars","Hakis","Fruits","Powers" }) do
                local t = inv[cat]
                if type(t) == "table" then
                    for k, v in pairs(t) do
                        local nm = (type(v) == "table" and (v.Name or tostring(k))) or tostring(k)
                        if si[nm] then
                            local r = si[nm].Rarity
                            if r then counts[r] = (counts[r] or 0) + 1; total = total + 1 end
                        end
                    end
                end
            end
        end
        return counts, total
    end

    sec.GachaL:Header({ Text = "Auto Gacha" })

    sec.GachaL:Toggle({
        Name = "Auto Gacha", Default = false,
        Callback = function(s)
            _WF.AutoGachaEnabled = s
            if s and not next(_WF.GachaSelection) then
                _WF.AutoGachaEnabled = false
                Notify("Сначала выбери гачу в дропдауне", 4)
            end
        end,
    }, "AutoGachaToggle")

    gachaSelDropdown = sec.GachaL:Dropdown({
        Name = "Select Gachas (multi)", Multi = true, Required = false,
        Options = getAllGachaNames(),
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do if v and type(k) == "string" then set[k] = true end end
            end
            _WF.GachaSelection = set
        end,
    }, "GachaSelectionDropdown")

    sec.GachaL:Dropdown({
        Name = "Target Rarity (stop on ≥)", Multi = false, Required = false,
        Options = RARITY_OPTIONS,
        Callback = function(v)
            if type(v) == "string" and v ~= "" then _WF.GachaTargetRarity = v
            else _WF.GachaTargetRarity = nil end
        end,
    }, "GachaTargetRarityDropdown")

    sec.GachaL:Slider({
        Name = "Min Tokens Before Roll", Default = 100,
        Minimum = 0, Maximum = 1000, Precision = 0, DisplayMethod = "Value",
        Callback = function(v) _WF.GachaThreshold = tonumber(v) or 100 end,
    }, "GachaThresholdSlider")

    -- Banner + Roulette (right side)
    local function getAllBanners()
        local out = {}
        local d = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Banner
        if type(d) == "table" then for k in pairs(d) do if type(k) == "string" then table.insert(out, k) end end end
        if #out == 0 then out = { "Swords Banner" } end
        table.sort(out)
        return out
    end
    local function getAllRoulettes()
        local out = {}
        safe(function()
            local r = RS:FindFirstChild("Omni")
            r = r and r:FindFirstChild("Shared") and r.Shared:FindFirstChild("Roulette")
            if r then for _, c in ipairs(r:GetChildren()) do if c:IsA("ModuleScript") then table.insert(out, c.Name) end end end
        end)
        if #out == 0 then out = { "Dragon Wish" } end
        table.sort(out)
        return out
    end

    local gachaSelDropdown -- forward for refresh button

    sec.GachaL:Button({
        Name = "Refresh Gacha List",
        Callback = function()
            pcall(function()
                gachaSelDropdown:ClearOptions()
                gachaSelDropdown:InsertOptions(getAllGachaNames())
            end)
            Notify("Gacha list refreshed", 2)
        end,
    })

    sec.GachaL:Button({
        Name = "Roll Selected x1 Each (now)",
        Callback = function()
            task.spawn(function()
                for gn, on in pairs(_WF.GachaSelection) do
                    if on then
                        local bal = getCurrencyBalance(getGachaCurrency(gn))
                        if bal >= getGachaCost(gn) then
                            safe(function() _WF.Omni.Signal:Fire("General", "Gacha", "Roll", gn, 1) end)
                            task.wait(0.5)
                        end
                    end
                end
            end)
        end,
    })

    sec.GachaL:Button({
        Name = "Debug: Dump All Gachas",
        Callback = function()
            local d, buf = newDump()
            d("========== [WF] GACHA DEBUG (all) ==========")
            for _, gn in ipairs(getAllGachaNames()) do
                d(("\n=========== %s ==========="):format(gn))
                local cfg = getGachaCfg(gn)
                local currency = getGachaCurrency(gn)
                d(("  Currency: %s  (balance: %d)"):format(currency, getCurrencyBalance(currency)))
                d(("  Cost/roll: %d  Max/roll: %d"):format(getGachaCost(gn), getMaxGachaPerRoll()))
                d(("  cfg.Source: %s"):format(tostring(cfg and cfg.Source)))
                local si = getSourceInfo(gn)
                if type(si) == "table" then
                    local n = 0; for _ in pairs(si) do n = n + 1 end
                    d(("  SourceInfo: %d rewards"):format(n))
                    local names = {}
                    for k in pairs(si) do table.insert(names, k) end
                    table.sort(names)
                    for _, nm in ipairs(names) do
                        d(("    %s (%s)"):format(nm, tostring(si[nm].Rarity)))
                    end
                else
                    d("  SourceInfo: MISSING")
                end
                -- Data.Gacha[gn] dump
                local dg = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Gacha
                if type(dg) == "table" and type(dg[gn]) == "table" then
                    d(("  Data.Gacha.%s:"):format(gn))
                    for k, v in pairs(dg[gn]) do
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
                local counts, total = getMyUnitsByRarity(gn)
                d(("  My rewards: %d total"):format(total))
                for _, r in ipairs(RARITY_OPTIONS) do
                    if counts[r] and counts[r] > 0 then
                        d(("    %s: %d"):format(r, counts[r]))
                    end
                end
            end
            d("\n=======================================")
            flushDump(buf, "Gacha Debug (all)")
        end,
    })

    sec.GachaR:Header({ Text = "Banner / Roulette" })

    sec.GachaR:Toggle({ Name = "Auto Banner Roll", Default = false,
        Callback = function(s) _WF.AutoBannerRollEnabled = s end }, "AutoBannerRollToggle")
    local bannerDropdown = sec.GachaR:Dropdown({ Name = "Banner", Multi = false, Required = false,
        Options = getAllBanners(),
        Callback = function(v) if type(v) == "string" then _WF.BannerName = v end end,
    }, "BannerNameDropdown")
    sec.GachaR:Button({ Name = "Refresh Banners",
        Callback = function()
            pcall(function()
                bannerDropdown:ClearOptions()
                bannerDropdown:InsertOptions(getAllBanners())
            end)
        end,
    })

    sec.GachaR:Toggle({ Name = "Auto Roulette Roll", Default = false,
        Callback = function(s) _WF.AutoRouletteRollEnabled = s end }, "AutoRouletteRollToggle")
    local rouletteDropdown = sec.GachaR:Dropdown({ Name = "Roulette", Multi = false, Required = false,
        Options = getAllRoulettes(),
        Callback = function(v) if type(v) == "string" then _WF.RouletteName = v end end,
    }, "RouletteNameDropdown")
    sec.GachaR:Button({ Name = "Refresh Roulettes",
        Callback = function()
            pcall(function()
                rouletteDropdown:ClearOptions()
                rouletteDropdown:InsertOptions(getAllRoulettes())
            end)
        end,
    })

    -- Status (detailed per-rarity breakdown per gacha)
    sec.GachaR:Header({ Text = "Status" })
    local gachaStatus = wrapParagraph(sec.GachaR:Paragraph({ Header = "Gacha", Body = "—" }))

    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(2)
            safe(function()
                local sel = {}
                for n in pairs(_WF.GachaSelection) do table.insert(sel, n) end
                table.sort(sel)
                local lines = {
                    "Auto: " .. (_WF.AutoGachaEnabled and "ON" or "OFF"),
                    "Target: " .. tostring(_WF.GachaTargetRarity or "any"),
                    "Threshold: " .. tostring(_WF.GachaThreshold),
                    "Max/roll: " .. tostring(getMaxGachaPerRoll()),
                    "",
                }
                if #sel == 0 then
                    table.insert(lines, "Selected: — (выбери гачу)")
                else
                    table.insert(lines, "Selected: " .. table.concat(sel, ", "))
                    table.insert(lines, "")
                    for _, gn in ipairs(sel) do
                        local currency = getGachaCurrency(gn)
                        local bal = getCurrencyBalance(currency)
                        local cost = getGachaCost(gn)
                        local counts, total = getMyUnitsByRarity(gn)
                        local canRoll = bal >= math.max(cost, _WF.GachaThreshold)
                        local siOk = getSourceInfo(gn) ~= nil
                        table.insert(lines, string.format("%s (%d owned, SI %s)",
                            gn, total, siOk and "✓" or "?"))
                        table.insert(lines, string.format("   %s: %d %s",
                            currency, bal, canRoll and "✓" or "…"))
                        if total > 0 then
                            local parts = {}
                            for _, r in ipairs(RARITY_OPTIONS) do
                                if counts[r] and counts[r] > 0 then
                                    table.insert(parts, string.format("%s:%d", r, counts[r]))
                                end
                            end
                            if #parts > 0 then
                                table.insert(lines, "   " .. table.concat(parts, "  "))
                            end
                        end
                    end
                end
                gachaStatus:UpdateBody(table.concat(lines, "\n"))
            end)
        end
    end)

    -- Gacha roll loop: per-gacha thread
    -- Adaptive cost-check: фаирим только то количество roll'ов которое можем купить.
    -- Если даже на 1 roll не хватает — ждём дольше (3с вместо 0.5с), чтобы не спамить
    -- тиками пока currency копится из фарма.
    local _spawnedThreads = {}
    local function ensureRollThread(gachaName)
        if _spawnedThreads[gachaName] then return end
        _spawnedThreads[gachaName] = true
        task.spawn(function()
            while getgenv()._WFRunning do
                task.wait(0.5)
                if _WF.AutoGachaEnabled and _WF.GachaSelection[gachaName] and _WF.ModulesLoaded then
                    local longWait = false
                    safe(function()
                        -- Target owned? stop this gacha
                        if _WF.GachaTargetRarity then
                            local owned = hasRarityOrHigher(gachaName, _WF.GachaTargetRarity)
                            if owned then
                                _WF.GachaSelection[gachaName] = nil
                                Notify(gachaName .. ": target rarity reached!", 5)
                                if not next(_WF.GachaSelection) then _WF.AutoGachaEnabled = false end
                                return
                            end
                        end
                        local currency = getGachaCurrency(gachaName)
                        local bal = getCurrencyBalance(currency)
                        local cost = math.max(1, getGachaCost(gachaName))
                        local thr = math.max(cost, _WF.GachaThreshold or 0)
                        if bal < cost then
                            -- Не хватает даже на 1 roll — ждём фарма. Не спамим fire'ы.
                            longWait = true
                            return
                        end
                        if bal >= thr then
                            local maxPer = getMaxGachaPerRoll()
                            local canBuy = math.floor(bal / cost)
                            local amount = math.min(maxPer, canBuy)  -- adaptive: столько roll'ов сколько реально купим
                            if amount >= 1 then
                                -- Gacha — pure remote fire, не трогает HRP. Крутим где угодно,
                                -- даже внутри трайла / во время star-open / во время zone-TP.
                                _WF.Omni.Signal:Fire("General", "Gacha", "Roll", gachaName, amount)
                                task.wait(1.0)
                            end
                        else
                            -- balance ниже threshold (хватает на rolls, но юзер выставил
                            -- минимальный баланс) — ждём покрупнее
                            longWait = true
                        end
                    end)
                    if longWait then task.wait(3) end
                end
            end
        end)
    end

    -- Spawn threads on-demand
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(1)
            for gn in pairs(_WF.GachaSelection or {}) do ensureRollThread(gn) end
        end
    end)

    -- Banner loop
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(1)
            if _WF.AutoBannerRollEnabled and _WF.BannerName ~= "" and _WF.ModulesLoaded
                and shouldFire("banner.roll", 1)
            then
                -- Banner roll — pure remote fire, крутим где угодно.
                safe(function() _WF.Omni.Signal:Fire("General", "Banner", "Roll", _WF.BannerName) end)
            end
        end
    end)

    -- Roulette loop
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(3)
            if _WF.AutoRouletteRollEnabled and _WF.RouletteName ~= "" and _WF.ModulesLoaded
                and shouldFire("roulette.roll", 3)
            then
                -- Roulette roll — pure remote fire, крутим где угодно.
                safe(function() _WF.Omni.Signal:Fire("General", "Roulette", "Roll", _WF.RouletteName) end)
            end
        end
    end)
end)
if not _ok_gacha then warn("[ApelHub] GACHA tab failed: " .. tostring(_err_gacha)) end

-- ════════════════════════════════════════════════════════════════
-- // 14. PROGRESS TAB
-- ════════════════════════════════════════════════════════════════
local _ok_prog, _err_prog = pcall(function()
    local function getAllProgressionNames()
        local out = {}
        local p = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Progression and _WF.Omni.Shared.Progression.List
        if type(p) == "table" then for k in pairs(p) do if type(k) == "string" then table.insert(out, k) end end end
        table.sort(out); return out
    end
    local function getAllTrialUpgradeNames()
        local out = {}
        local u = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Upgrade
        local tu = u and u["Trial Upgrades"]
        local list = tu and tu.Upgrades
        if type(list) == "table" then for k in pairs(list) do if type(k) == "string" then table.insert(out, k) end end end
        if #out == 0 then out = { "Power","Attack Distance","Crystals","Attack Speed","Damage" } end
        table.sort(out); return out
    end
    -- Tempest Upgrades — зеркальная функция для Shared.Upgrade["Tempest Upgrades"]
    local function getAllTempestUpgradeNames()
        local out = {}
        local u = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Upgrade
        local tu = u and u["Tempest Upgrades"]
        local list = tu and tu.Upgrades
        if type(list) == "table" then for k in pairs(list) do if type(k) == "string" then table.insert(out, k) end end end
        if #out == 0 then out = { "Power","Attack Distance","Crystals","Attack Speed","Damage" } end
        table.sort(out); return out
    end
    local function getAllSkillTreeNames()
        local out = {}
        local st = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.SkillTree and _WF.Omni.Shared.SkillTree.List
        if type(st) == "table" then for k in pairs(st) do if type(k) == "string" then table.insert(out, k) end end end
        table.sort(out); return out
    end

    local function isNodeUnlocked(treeName, nodeName)
        local d = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.SkillTree
        local tree = type(d) == "table" and d[treeName]
        if type(tree) ~= "table" then return false end
        local v = tree[nodeName]
        if v == true or (type(v) == "number" and v > 0) then return true end
        if type(v) == "table" and (v.Unlocked == true or (type(v.Level) == "number" and v.Level > 0)) then return true end
        return false
    end

    -- ═══════════════════════════════════════════════════════════════════
    -- Pre-flight balance checks. Игра сама проверяет цену перед Upgrade —
    -- дублируем ту же логику чтобы не спамить сервер Fire'ами без валюты.
    -- Возвращают (canAfford, reason) где reason: "maxed" / "no_balance" / "no_api"
    -- ═══════════════════════════════════════════════════════════════════

    -- Auto Progression (GetLevelInformation(name, level) → {Price={Type,Name,Amount}})
    local function canAffordProgression(name)
        local data = _WF.Omni and _WF.Omni.Data
        local sp = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Progression
        local util = _WF.Omni and _WF.Omni.Utils and _WF.Omni.Utils.Info
        if not (data and sp and util) then return false, "no_api" end
        if type(sp.GetLevelInformation) ~= "function" or type(util.GetPriceAmount) ~= "function" then
            return false, "no_api"
        end
        -- Zone-lock check. Без него fire на locked-зону → сервер отвергает +
        -- локальный notify "You don't have access to this progression". Даём юзеру
        -- заранее выбрать progression под зону которую он скоро откроет — до разблока
        -- мы тихо скипаем, после — автоматически начнём прокачивать.
        local cfg = sp.List and sp.List[name]
        if type(cfg) == "table" and cfg.MapName then
            local PS = _WF.Omni.Utils and _WF.Omni.Utils.PlayerStats
            if PS and type(PS.HasMapZone) == "function" then
                local okZ, has = pcall(PS.HasMapZone, data, cfg.MapName, cfg.ZoneIndex)
                if okZ and not has then return false, "zone_locked" end
            end
        end
        local cur = (data.Progression and data.Progression[name]) or 0
        local ok, info = pcall(sp.GetLevelInformation, name, cur + 1)
        if not ok or type(info) ~= "table" then return false, "maxed" end  -- нет следующего уровня
        if type(info.Price) ~= "table" then return true end  -- без цены — фаирим
        local okBal, bal = pcall(function() return util:GetPriceAmount(info.Price.Type, info.Price.Name, data) end)
        if not okBal or type(bal) ~= "number" then return false, "no_api" end
        if bal >= (info.Price.Amount or 0) then return true end
        return false, "no_balance"
    end

    -- Trial Upgrades (Shared.Upgrade["Trial Upgrades"].Upgrades[n].
    -- GetLevelInformation(category, name, level))
    local function canAffordTrialUpgrade(upgradeName)
        local CAT = "Trial Upgrades"
        local data = _WF.Omni and _WF.Omni.Data
        local su = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Upgrade
        local util = _WF.Omni and _WF.Omni.Utils and _WF.Omni.Utils.Info
        if not (data and su and util) then return false, "no_api" end
        if type(su.GetLevelInformation) ~= "function" or type(util.GetPriceAmount) ~= "function" then
            return false, "no_api"
        end
        local cur = (data.Upgrade and data.Upgrade[CAT] and data.Upgrade[CAT][upgradeName]) or 0
        local ok, info = pcall(su.GetLevelInformation, CAT, upgradeName, cur + 1)
        if not ok or type(info) ~= "table" then return false, "maxed" end
        if type(info.Price) ~= "table" then return true end
        local okBal, bal = pcall(function() return util:GetPriceAmount(info.Price.Type, info.Price.Name, data) end)
        if not okBal or type(bal) ~= "number" then return false, "no_api" end
        if bal >= (info.Price.Amount or 0) then return true end
        return false, "no_balance"
    end

    -- Tempest Upgrades — структура такая же как Trial Upgrades, валюта Slime Shard
    local function canAffordTempestUpgrade(upgradeName)
        local CAT = "Tempest Upgrades"
        local data = _WF.Omni and _WF.Omni.Data
        local su = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Upgrade
        local util = _WF.Omni and _WF.Omni.Utils and _WF.Omni.Utils.Info
        if not (data and su and util) then return false, "no_api" end
        if type(su.GetLevelInformation) ~= "function" or type(util.GetPriceAmount) ~= "function" then
            return false, "no_api"
        end
        local cur = (data.Upgrade and data.Upgrade[CAT] and data.Upgrade[CAT][upgradeName]) or 0
        local ok, info = pcall(su.GetLevelInformation, CAT, upgradeName, cur + 1)
        if not ok or type(info) ~= "table" then return false, "maxed" end
        if type(info.Price) ~= "table" then return true end
        local okBal, bal = pcall(function() return util:GetPriceAmount(info.Price.Type, info.Price.Name, data) end)
        if not okBal or type(bal) ~= "number" then return false, "no_api" end
        if bal >= (info.Price.Amount or 0) then return true end
        return false, "no_balance"
    end

    -- Игра имеет СВОЙ встроенный "Auto Roll" для progression'ов, хранится в
    -- Omni.Data.ProgressionsAuto. На каждый ItemsChanged event (каждое убийство/награда)
    -- игра перебирает этот список и для ЗАЛОЧЕННЫХ progression'ов (HasMapZone=false)
    -- шлёт локальный notify "You don't have access to this progression".
    -- Когда наш farm работает быстро — убийств много → спам. Чистим такие entries.
    local function disableLockedProgressionsAuto()
        local d = _WF.Omni and _WF.Omni.Data
        if not d or type(d.ProgressionsAuto) ~= "table" then return 0 end
        local shared = _WF.Omni.Shared and _WF.Omni.Shared.Progression and _WF.Omni.Shared.Progression.List
        if not shared then return 0 end
        local PS = _WF.Omni.Utils and _WF.Omni.Utils.PlayerStats
        local hasMapZone = PS and PS.HasMapZone
        local cleared = 0
        -- Snapshot список ключей (игровая таблица может мутироваться пока мы итерируем)
        local names = {}
        for name, on in pairs(d.ProgressionsAuto) do
            if on then table.insert(names, name) end
        end
        for _, name in ipairs(names) do
            local cfg = shared[name]
            local locked = false
            if cfg then
                if hasMapZone then
                    local ok, has = pcall(hasMapZone, d, cfg.MapName, cfg.ZoneIndex)
                    if ok and not has then locked = true end
                end
            else
                -- Конфига нет вообще (устаревшее имя / removed progression) — тоже чистим.
                locked = true
            end
            if locked then
                -- Toggle off через "Progression/Auto" signal (тот же что игра юзает на клик UI)
                safe(function() _WF.Omni.Signal:Fire("General", "Progression", "Auto", name) end)
                cleared = cleared + 1
                task.wait(0.15)
            end
        end
        return cleared
    end

    sec.ProgressL:Header({ Text = "Progression" })
    sec.ProgressL:Toggle({ Name = "Auto Progression", Default = false,
        Callback = function(s) _WF.AutoProgressionEnabled = s end }, "AutoProgressionToggle")
    local progDropdown = sec.ProgressL:Dropdown({ Name = "Progressions (multi)", Multi = true, Required = false,
        Options = getAllProgressionNames(),
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do if v and type(k) == "string" then set[k] = true end end
            end
            _WF.ProgressionSelection = set
        end,
    }, "ProgressionSelectionDropdown")
    sec.ProgressL:Button({ Name = "Refresh Progressions",
        Callback = function()
            pcall(function()
                progDropdown:ClearOptions()
                progDropdown:InsertOptions(getAllProgressionNames())
            end)
        end,
    })
    sec.ProgressL:Button({
        Name = "Fix 'no access' spam (clear locked Auto Roll)",
        Callback = function()
            local n = disableLockedProgressionsAuto()
            Notify(("Cleared %d locked Auto Roll entries"):format(n), 4)
        end,
    })

    -- Автоочистка при загрузке скрипта — даём игре 3с устаканиться с Data, потом чистим.
    task.spawn(function()
        task.wait(3)
        if _WF.ModulesLoaded then
            local n = disableLockedProgressionsAuto()
            if n > 0 then
                Notify(("Disabled %d locked Auto Roll(s) to stop spam"):format(n), 4)
            end
        end
    end)

    sec.ProgressL:Header({ Text = "Trial Upgrades" })
    sec.ProgressL:Toggle({ Name = "Auto Trial Upgrades", Default = false,
        Callback = function(s) _WF.AutoTrialUpgradesEnabled = s end }, "AutoTrialUpgradesToggle")
    sec.ProgressL:Dropdown({ Name = "Upgrades (multi)", Multi = true, Required = false,
        Options = getAllTrialUpgradeNames(),
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do if v and type(k) == "string" then set[k] = true end end
            end
            _WF.TrialUpgradeSelection = set
        end,
    }, "TrialUpgradeSelectionDropdown")

    sec.ProgressL:Divider()
    sec.ProgressL:Header({ Text = "Tempest Upgrades" })
    sec.ProgressL:Toggle({ Name = "Auto Tempest Upgrades", Default = false,
        Callback = function(s) _WF.AutoTempestUpgradesEnabled = s end }, "AutoTempestUpgradesToggle")
    sec.ProgressL:Dropdown({ Name = "Tempest Upgrades (multi)", Multi = true, Required = false,
        Options = getAllTempestUpgradeNames(),
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do if v and type(k) == "string" then set[k] = true end end
            end
            _WF.TempestUpgradeSelection = set
        end,
    }, "TempestUpgradeSelectionDropdown")

    sec.ProgressR:Header({ Text = "Skill Tree" })
    sec.ProgressR:Toggle({ Name = "Auto Skill Tree (parent-aware)", Default = false,
        Callback = function(s) _WF.AutoSkillTreeEnabled = s end }, "AutoSkillTreeToggle")
    local stDropdown = sec.ProgressR:Dropdown({ Name = "Skill Trees (multi)", Multi = true, Required = false,
        Options = getAllSkillTreeNames(),
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do if v and type(k) == "string" then set[k] = true end end
            end
            _WF.SkillTreeSelection = set
        end,
    }, "SkillTreeSelectionDropdown")
    sec.ProgressR:Button({ Name = "Refresh Skill Trees",
        Callback = function()
            pcall(function()
                stDropdown:ClearOptions()
                stDropdown:InsertOptions(getAllSkillTreeNames())
            end)
        end,
    })

    sec.ProgressR:Header({ Text = "Auto Equip" })
    sec.ProgressR:Toggle({ Name = "Auto Equip Best", Default = false,
        Callback = function(s) _WF.AutoEquipBestEnabled = s end }, "AutoEquipBestToggle")
    sec.ProgressR:Dropdown({ Name = "Equip Stat", Multi = false, Required = false,
        Options = { "Power","Damage","Crystals","Drops","Luck","Attack Speed" },
        Callback = function(v) if type(v) == "string" then _WF.EquipBestStat = v end end,
    }, "EquipBestStatDropdown")
    sec.ProgressR:Dropdown({ Name = "Categories (multi)", Multi = true, Required = false,
        Options = { "Swords","Units","Accessories","Avatars","Mounts","Gacha" },
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do if v and type(k) == "string" then set[k] = true end end
            end
            _WF.EquipBestCategories = set
        end,
    }, "EquipBestCategoriesDropdown")

    -- Loops
    -- Status tracking для Progress paragraph
    _WF.ProgressStatus = { progressionMaxed = {}, trialMaxed = {} }

    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(2)
            if _WF.AutoProgressionEnabled and _WF.ModulesLoaded then
                for n, on in pairs(_WF.ProgressionSelection) do
                    if on then
                        local ok, reason = canAffordProgression(n)
                        if ok then
                            safe(function() _WF.Omni.Signal:Fire("General", "Progression", "Upgrade", n) end)
                            task.wait(0.3)
                        elseif reason == "maxed" then
                            -- Прокачан до максимума — снимаем из selection чтобы не проверять каждые 2с
                            _WF.ProgressionSelection[n] = nil
                            _WF.ProgressStatus.progressionMaxed[n] = true
                            Notify(("Progression %s: MAXED"):format(n), 3)
                        end
                        -- reason == "no_balance" → тихо пропускаем, попробуем позже
                    end
                end
            end
        end
    end)
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(3)
            if _WF.AutoTrialUpgradesEnabled and _WF.ModulesLoaded then
                for n, on in pairs(_WF.TrialUpgradeSelection) do
                    if on then
                        local ok, reason = canAffordTrialUpgrade(n)
                        if ok then
                            safe(function() _WF.Omni.Signal:Fire("General", "Upgrade", "Upgrade", "Trial Upgrades", n) end)
                            task.wait(0.3)
                        elseif reason == "maxed" then
                            _WF.TrialUpgradeSelection[n] = nil
                            _WF.ProgressStatus.trialMaxed[n] = true
                            Notify(("Trial Upgrade %s: MAXED"):format(n), 3)
                        end
                    end
                end
            end
        end
    end)
    -- Tempest Upgrades loop (зеркальная копия Trial Upgrades, валюта Slime Shard)
    _WF.ProgressStatus.tempestMaxed = _WF.ProgressStatus.tempestMaxed or {}
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(3)
            if _WF.AutoTempestUpgradesEnabled and _WF.ModulesLoaded then
                for n, on in pairs(_WF.TempestUpgradeSelection) do
                    if on then
                        local ok, reason = canAffordTempestUpgrade(n)
                        if ok then
                            safe(function() _WF.Omni.Signal:Fire("General", "Upgrade", "Upgrade", "Tempest Upgrades", n) end)
                            task.wait(0.3)
                        elseif reason == "maxed" then
                            _WF.TempestUpgradeSelection[n] = nil
                            _WF.ProgressStatus.tempestMaxed[n] = true
                            Notify(("Tempest Upgrade %s: MAXED"):format(n), 3)
                        end
                    end
                end
            end
        end
    end)
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(5)
            if _WF.AutoSkillTreeEnabled and _WF.ModulesLoaded then
                local progressed = false
                -- Helper: хватит ли валюты на цену ноды?
                -- (Price может быть nil → тогда bесплатно; может быть строкой "25" → tonumber)
                local util = _WF.Omni.Utils and _WF.Omni.Utils.Info
                local function canAffordNode(nodeData)
                    if type(nodeData) ~= "table" then return true end
                    local price = nodeData.Price
                    if type(price) ~= "table" or not price.Type or not price.Name then return true end
                    local amount = tonumber(price.Amount) or 0
                    if amount <= 0 then return true end
                    if not util or type(util.GetPriceAmount) ~= "function" then return true end
                    local ok, have = pcall(function() return util:GetPriceAmount(price.Type, price.Name, _WF.Omni.Data) end)
                    if not ok or type(have) ~= "number" then return true end  -- API fail → не блокируем
                    return have >= amount
                end
                for treeName, on in pairs(_WF.SkillTreeSelection) do
                    if on then
                        local st = _WF.Omni.Shared.SkillTree and _WF.Omni.Shared.SkillTree.List
                        local tree = st and st[treeName]
                        local nodes = tree and (tree.Nodes or tree.List or tree)
                        if type(nodes) == "table" then
                            for pass = 1, 10 do
                                local any = false
                                for nodeName, nodeData in pairs(nodes) do
                                    if type(nodeName) == "string" and not isNodeUnlocked(treeName, nodeName) then
                                        local parent
                                        if type(nodeData) == "table" then
                                            parent = nodeData.Parent or nodeData.Requires
                                        end
                                        local parentOk = not parent or isNodeUnlocked(treeName, parent)
                                        -- ✅ Price check — не фаирим Unlock если не хватает валюты.
                                        -- Без этого каждые 5с сервер отвергает fire + локальный
                                        -- notify "not enough X".
                                        local priceOk = canAffordNode(nodeData)
                                        if parentOk and priceOk then
                                            safe(function() _WF.Omni.Signal:Fire("General", "SkillTree", "Unlock", treeName, nodeName) end)
                                            any = true; progressed = true
                                            task.wait(0.4)
                                        end
                                    end
                                end
                                if not any then break end
                            end
                        end
                    end
                end
                if not progressed then task.wait(10) end
            end
        end
    end)
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(30)
            if _WF.AutoEquipBestEnabled and _WF.ModulesLoaded and _WF.EquipBestStat ~= "" then
                for cat, on in pairs(_WF.EquipBestCategories) do
                    if on and shouldFire("equip." .. cat, 5) then
                        safe(function() _WF.Omni.Signal:Fire("General", cat, "EquipBest", _WF.EquipBestStat) end)
                        task.wait(0.25)
                    end
                end
            end
        end
    end)
    -- Auto Index loop УДАЛЁН (баг): GetNextValueForIdentifier циклит
    -- nil → Delete → Lock → Delete Shiny → Lock Shiny → nil → ... По факту ломал
    -- ручные Delete/Lock юзера каждые 60с. При этом toggle автозагружался из MacLib
    -- config (если был хоть раз включён), создавая скрытый демон.
end)
if not _ok_prog then warn("[ApelHub] PROGRESS tab failed: " .. tostring(_err_prog)) end

-- ════════════════════════════════════════════════════════════════
-- // 15. MISC TAB (Walk Speed, Anti-AFK, Potions, Codes)
-- ════════════════════════════════════════════════════════════════
local _ok_misc, _err_misc = pcall(function()
    -- Walk Speed — periodic re-apply (not signal-based).
    -- Signal-based GetPropertyChangedSignal can crash client after re-injection
    -- if old handler's connection survives. Periodic poll is safer.
    local function applyWalkSpeed()
        local ch = LocalPlayer.Character
        local hum = ch and ch:FindFirstChildOfClass("Humanoid")
        if hum and hum.WalkSpeed ~= _WF.WalkSpeed then
            hum.WalkSpeed = _WF.WalkSpeed
        end
    end

    sec.MiscL:Header({ Text = "Character" })
    sec.MiscL:Slider({
        Name = "Walk Speed", Default = 16,
        Minimum = 16, Maximum = 200, Precision = 0, DisplayMethod = "Value",
        Callback = function(v)
            _WF.WalkSpeed = tonumber(v) or 16
            applyWalkSpeed()
        end,
    }, "WalkSpeedSlider")

    -- Background loop applies walk speed periodically — no per-property signal connection
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(0.5)
            if _WF.WalkSpeed ~= 16 then applyWalkSpeed() end
        end
    end)
    -- Apply on respawn — track connection for cleanup
    table.insert(_cleanupConns, LocalPlayer.CharacterAdded:Connect(function()
        task.wait(0.5)  -- wait for Humanoid to be ready
        if _WF.WalkSpeed ~= 16 then applyWalkSpeed() end
    end))

    -- NoClip — проходим сквозь стены/пол. Решает проблему DD: teleportTo(mob)
    -- может поставить игрока в/за стену arena → падение в void → respawn → loop.
    -- Auto режим (default): включается сам когда активен любой фарм-toggle.
    sec.MiscL:Dropdown({
        Name = "NoClip (pass through walls)",
        Options = { "auto", "on", "off" },
        Default = "auto",
        Callback = function(v)
            if v == "auto" or v == "on" or v == "off" then
                _WF.NoClipMode = v
            end
        end,
    }, "NoClipModeDropdown")

    -- Game Anti-AFK (bypass). Игра авто-открывает звёзды/гачу через 900с idle
    -- (AntiAfk.LastStar/LastGacha/LastBanner сохраняются для auto-resume). Убиваем
    -- это на трёх уровнях:
    --  1. Settings.Anti Afk = false
    --  2. Disconnect всех LocalPlayer.Idled connections
    --  3. Reset AntiAfk.LastStar/LastGacha/LastBanner = "None" (стоп auto-resume)
    local function killGameAntiAfk()
        safe(function()
            local d = _WF.Omni and _WF.Omni.Data
            if d and (d.Settings or {})["Anti Afk"] == true then
                _WF.Omni.Signal:Fire("General", "Settings", "Set", "Anti Afk", false)
            end
        end)
        -- Disconnect Idled connections (если executor поддерживает getconnections)
        safe(function()
            local GC = getconnections or get_signal_cons
            if GC then
                for _, c in pairs(GC(LocalPlayer.Idled)) do
                    if c.Disable then c:Disable()
                    elseif c.Disconnect then c:Disconnect() end
                end
            end
        end)
        -- Сброс LastStar/LastGacha/LastBanner чтобы игра не "resume"нула что-то
        safe(function()
            local d = _WF.Omni and _WF.Omni.Data
            if d and d.AntiAfk then
                for _, field in ipairs({ "LastStar", "LastGacha", "LastBanner" }) do
                    if d.AntiAfk[field] and d.AntiAfk[field] ~= "None" then
                        _WF.Omni.Signal:Fire("Player", "AntiAfk", "SetValue", field, "None")
                    end
                end
            end
        end)
    end

    sec.MiscL:Toggle({
        Name = "Disable Game Anti-AFK (recommended)", Default = false,
        Callback = function(on)
            _WF.DisableGameAntiAfkEnabled = on
            if on then
                killGameAntiAfk()
                Notify("Anti-AFK fully disabled — auto-open stop", 4)
            else
                safe(function() _WF.Omni.Signal:Fire("General", "Settings", "Set", "Anti Afk", true) end)
            end
        end,
    }, "DisableGameAntiAfkToggle")

    -- Background re-applier (на случай если игра откатит флаг)
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(30)
            if _WF.DisableGameAntiAfkEnabled and _WF.ModulesLoaded then
                killGameAntiAfk()
            end
        end
    end)

    -- Auto Potions
    local function getAllPotions()
        local out = {}
        local p = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Items and _WF.Omni.Shared.Items.Potion
        if type(p) == "table" then for k in pairs(p) do if type(k) == "string" then table.insert(out, k) end end end
        table.sort(out); return out
    end
    local function isPotionActive(name)
        local up = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.UsedPotions
        if type(up) ~= "table" then return false end
        local v = up[name]
        if v == nil then return false end
        if type(v) == "table" then
            local et = v.EndTime or v.endTime or v.ExpiresAt
            if type(et) == "number" then return et > tick() end
            return next(v) ~= nil
        end
        return v == true or (type(v) == "number" and v > 0)
    end
    local function getPotionCount(name)
        local inv = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Inventory and _WF.Omni.Data.Inventory.Potions
        if type(inv) ~= "table" then return 0 end
        local v = inv[name]
        if type(v) == "number" then return v end
        if type(v) == "table" then return tonumber(v.Amount or v.Count) or 0 end
        return 0
    end

    sec.MiscR:Header({ Text = "Auto Potions" })
    sec.MiscR:Toggle({ Name = "Auto Use Potions", Default = false,
        Callback = function(s) _WF.AutoPotionsEnabled = s end }, "AutoPotionsToggle")
    sec.MiscR:Dropdown({ Name = "Potions (multi)", Multi = true, Required = false,
        Options = getAllPotions(),
        Callback = function(values)
            local set = {}
            if type(values) == "table" then
                for k, v in pairs(values) do if v and type(k) == "string" then set[k] = true end end
            end
            _WF.PotionSelection = set
        end,
    }, "PotionSelectionDropdown")

    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(5)
            if _WF.AutoPotionsEnabled and _WF.ModulesLoaded then
                for name, on in pairs(_WF.PotionSelection) do
                    if on and not isPotionActive(name) and getPotionCount(name) > 0 then
                        if shouldFire("potion." .. name, 2) then
                            safe(function() _WF.Omni.Signal:Fire("General", "Items", "UsePotion", name, 1) end)
                            task.wait(0.5)
                        end
                    end
                end
            end
        end
    end)

    -- Auto Codes
    local KNOWN_CODES = {
        "RELEASE", "WORLDFIGHTERS", "FREE100", "UPDATE1", "DEV", "ADMIN",
        "WELCOME", "SHUTDOWN", "THXSUB", "100KLIKES", "1MVISITS", "SORRY",
        "FIX", "BUGFIX", "20KLIKES", "50KLIKES", "1KLIKES", "5KLIKES",
        "10KLIKES", "200KLIKES", "500KLIKES",
    }
    sec.MiscR:Header({ Text = "Auto Codes" })
    sec.MiscR:Toggle({ Name = "Auto Redeem Codes (every 5min)", Default = false,
        Callback = function(s) _WF.AutoCodesEnabled = s end }, "AutoCodesToggle")
    sec.MiscR:Button({ Name = "Redeem Now",
        Callback = function()
            task.spawn(function()
                for _, code in ipairs(KNOWN_CODES) do
                    safe(function() _WF.Omni.Signal:Fire("General", "Codes", "Redeem", code) end)
                    task.wait(0.4)
                end
            end)
        end,
    })
    task.spawn(function()
        while getgenv()._WFRunning do
            if _WF.AutoCodesEnabled and _WF.ModulesLoaded then
                for _, code in ipairs(KNOWN_CODES) do
                    safe(function() _WF.Omni.Signal:Fire("General", "Codes", "Redeem", code) end)
                    task.wait(0.4)
                end
            end
            -- 300s sleep with flag check
            local waited = 0
            while waited < 300 and getgenv()._WFRunning do task.wait(2); waited = waited + 2 end
        end
    end)

    -- ═══════════════════════════════════════════════════════════════════
    -- GAME UI / PERFORMANCE — прокси на нативные игровые Settings
    -- ═══════════════════════════════════════════════════════════════════
    -- Все шлются через тот же Signal:Fire("General","Settings","Set",key,on).
    -- Сервер хранит в Data.Settings, persistent между сессиями. Тогглы тут —
    -- зеркало того что есть в игровом UI Settings (Performance + Gameplay + Others
    -- категории). Default берётся из текущего значения на сервере.
    sec.MiscR:Header({ Text = "Game UI / Performance" })
    makeSettingToggle(sec.MiscR, "Hide Effects",            "Hide Effects",            "HideEffectsToggle")
    makeSettingToggle(sec.MiscR, "Low Mode",                "Low Mode",                "LowModeToggle")
    makeSettingToggle(sec.MiscR, "Hide Pop Ups",            "Hide Pop Ups",            "HidePopUpsToggle")
    makeSettingToggle(sec.MiscR, "Hide Drop Notifications", "Hide Drop Notifications", "HideDropNotifToggle")
    makeSettingToggle(sec.MiscR, "Enable Gifts",            "Enable Gifts",            "EnableGiftsToggle")
end)
if not _ok_misc then warn("[ApelHub] MISC tab failed: " .. tostring(_err_misc)) end

-- ════════════════════════════════════════════════════════════════
-- // 16. WEBHOOK TAB
-- ════════════════════════════════════════════════════════════════
local _ok_webhook, _err_webhook = pcall(function()
    sec.WebhookL:Header({ Text = "Discord Webhook" })

    sec.WebhookL:Toggle({ Name = "Enable Webhook", Default = false,
        Callback = function(on)
            _WF.WebhookEnabled = on
            if on and (_WF.WebhookURL == "") then
                _WF.WebhookEnabled = false
                Notify("Введи Webhook URL сначала", 4)
            end
        end,
    }, "EnableWebhookToggle")

    sec.WebhookL:Input({ Name = "Webhook URL", Default = "",
        Callback = function(v) _WF.WebhookURL = tostring(v or "") end,
    }, "WebhookURLInput")

    sec.WebhookL:Input({ Name = "Discord User ID (for ping)", Default = "",
        Callback = function(v) _WF.WebhookDiscordUserId = tostring(v or "") end,
    }, "WebhookDiscordIdInput")

    sec.WebhookL:Dropdown({ Name = "Rarity Filter (log ≥)", Multi = false, Required = false,
        Options = { "Common","Uncommon","Rare","Epic","Mythical","Legendary","Secret" },
        Callback = function(v)
            local set = {}
            if type(v) == "string" and v ~= "" then
                local ranks = { Common=1,Uncommon=2,Rare=3,Epic=4,Mythical=5,Legendary=6,Secret=7 }
                local min = ranks[v] or 0
                for r, i in pairs(ranks) do if i >= min then set[r] = true end end
            end
            _WF.WebhookRarityFilter = set
        end,
    }, "WebhookRarityFilterDropdown")

    sec.WebhookL:Toggle({ Name = "Ping on Mythical+", Default = false,
        Callback = function(s) _WF.WebhookPingOnMythical = s end }, "WebhookPingMythicalToggle")

    sec.WebhookL:Button({ Name = "Test Webhook",
        Callback = function() sendWebhook("Test", "Apel Hub webhook test", 2672813) end,
    })

    sec.WebhookR:Header({ Text = "Status" })
    local whStatus = wrapParagraph(sec.WebhookR:Paragraph({ Header = "Webhook", Body = "—" }))
    task.spawn(function()
        while getgenv()._WFRunning do
            task.wait(2)
            safe(function()
                whStatus:UpdateBody(
                    "Enabled: " .. (_WF.WebhookEnabled and "yes" or "no") ..
                    "\nURL: " .. (_WF.WebhookURL ~= "" and "set" or "—") ..
                    "\nDiscord ID: " .. (_WF.WebhookDiscordUserId ~= "" and "set" or "—") ..
                    "\nSent: " .. tostring(_WF.WebhookSentCount) ..
                    "\nLast: " .. tostring(_WF.WebhookLastSent or "—")
                )
            end)
        end
    end)

    -- Monitor loop: scans Data.Gacha.*.Vault AND Inventory.* for new items.
    -- First pass records baseline; subsequent iterations notify on diff.
    local _seen = {}
    local INV_CATS = { "Units", "Swords", "Accessories", "Mounts", "Avatars", "Hakis", "Fruits", "Powers" }

    -- Resolve rarity for any item by scanning all gacha SourceInfos
    local function resolveItemRarity(itemName)
        local sg = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Gacha and _WF.Omni.Shared.Gacha.List
        if type(sg) ~= "table" then return nil end
        for gn, cfg in pairs(sg) do
            if type(cfg) == "table" and type(cfg.SourceInfo) == "table" then
                local info = cfg.SourceInfo[itemName]
                if info and info.Rarity then return info.Rarity, gn end
            end
        end
        return nil
    end

    task.spawn(function()
        task.wait(3)
        -- Baseline: record everything that's already there (no notify)
        safe(function()
            local dg = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Gacha
            if type(dg) == "table" then
                for gn, gval in pairs(dg) do
                    if type(gval) == "table" and type(gval.Vault) == "table" then
                        for k, v in pairs(gval.Vault) do
                            if v then _seen["vault:" .. gn .. ":" .. tostring(k)] = true end
                        end
                    end
                end
            end
            local inv = _WF.Omni and _WF.Omni.Data and _WF.Omni.Data.Inventory
            if type(inv) == "table" then
                for _, cat in ipairs(INV_CATS) do
                    local t = inv[cat]
                    if type(t) == "table" then
                        for k, v in pairs(t) do
                            local name = (type(v) == "table" and (v.Name or tostring(k))) or tostring(k)
                            _seen["inv:" .. cat .. ":" .. name] = true
                        end
                    end
                end
            end
        end)

        -- Monitoring loop
        while getgenv()._WFRunning do
            task.wait(5)
            if _WF.WebhookEnabled and _WF.ModulesLoaded then
                safe(function()
                    local rarityColors = {
                        Secret = 15844367, Legendary = 15105570, Mythical = 10181046,
                        Epic = 10181046, Rare = 3447003, Uncommon = 3066993, Common = 9807270,
                    }

                    -- Scan Vault
                    local dg = _WF.Omni.Data.Gacha
                    if type(dg) == "table" then
                        for gn, gval in pairs(dg) do
                            if type(gval) == "table" and type(gval.Vault) == "table" then
                                for name, owned in pairs(gval.Vault) do
                                    local key = "vault:" .. gn .. ":" .. tostring(name)
                                    if owned and not _seen[key] then
                                        _seen[key] = true
                                        local rarity = resolveItemRarity(name) or "?"
                                        if next(_WF.WebhookRarityFilter) == nil or _WF.WebhookRarityFilter[rarity] then
                                            sendWebhook(
                                                gn .. " drop!",
                                                string.format("**%s** (%s)", name, rarity),
                                                rarityColors[rarity] or 3447003
                                            )
                                        end
                                    end
                                end
                            end
                        end
                    end

                    -- Scan Inventory categories (for games that store drops directly
                    -- in Inventory rather than Vault — like Fruit gacha for swords/units)
                    local inv = _WF.Omni.Data.Inventory
                    if type(inv) == "table" then
                        for _, cat in ipairs(INV_CATS) do
                            local t = inv[cat]
                            if type(t) == "table" then
                                for k, v in pairs(t) do
                                    local name = (type(v) == "table" and (v.Name or tostring(k))) or tostring(k)
                                    local key = "inv:" .. cat .. ":" .. name
                                    if not _seen[key] then
                                        _seen[key] = true
                                        local rarity, fromGacha = resolveItemRarity(name)
                                        rarity = rarity or "?"
                                        if next(_WF.WebhookRarityFilter) == nil or _WF.WebhookRarityFilter[rarity] then
                                            sendWebhook(
                                                (fromGacha or cat) .. " drop!",
                                                string.format("**%s** (%s)", name, rarity),
                                                rarityColors[rarity] or 3447003
                                            )
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
end)
if not _ok_webhook then warn("[ApelHub] WEBHOOK tab failed: " .. tostring(_err_webhook)) end

-- ════════════════════════════════════════════════════════════════
-- // 17. SETTINGS TAB + UI finalize
-- ════════════════════════════════════════════════════════════════
sec.SetL:Header({ Text = "UI Settings" })

sec.SetL:Slider({
    Name          = "UI Size",
    Default       = 0.85,
    Minimum       = 0.5,
    Maximum       = 2.0,
    Precision     = 2,
    DisplayMethod = "Value",
    Callback      = function(v) pcall(function() Window:SetScale(v) end) end,
}, "UiSizeSlider")

task.spawn(function()
    task.wait(0.1)
    pcall(function()
        Window:GlobalSetting({
            Name     = "UI Blur",
            Default  = Window:GetAcrylicBlurState(),
            Callback = function(b) pcall(function() Window:SetAcrylicBlurState(b) end) end,
        })
        Window:GlobalSetting({
            Name     = "Notifications",
            Default  = Window:GetNotificationsState(),
            Callback = function(b) pcall(function() Window:SetNotificationsState(b) end) end,
        })
    end)
end)

sec.SetL:Button({
    Name     = "Unload Hub",
    Callback = function() pcall(getgenv()._WFStop) end,
})

sec.SetL:Toggle({
    Name     = "Enable Debug Prints",
    Default  = false,
    Callback = function(on) _WF.EnableDebug = on end,
}, "EnableDebugToggle")

sec.SetR:Header({ Text = "Diagnostics" })

-- ═══════════════════════════════════════════════════════════════════
-- FULL DEBUG DUMP — комплексный дамп всего состояния скрипта и игры.
-- Юзер жмёт кнопку → буфер копируется в clipboard → вставляет сюда в чат.
-- Покрывает: executor env, Omni API, Data snapshot, workspace, Shared
-- configs, per-gamemode state, script state (_WF.*), character.
-- ═══════════════════════════════════════════════════════════════════
sec.SetR:Button({
    Name = "📋 Full Debug Dump (copy to clipboard)",
    Callback = function()
        local d, buf = newDump()
        d("═══════════════════ APEL HUB FULL DEBUG ═══════════════════")
        d(("Timestamp: %s | PlaceId: %s"):format(os.date("!%Y-%m-%d %H:%M:%S UTC"), tostring(game.PlaceId)))
        d(("Player: %s (%d)"):format(LocalPlayer.Name, LocalPlayer.UserId))

        -- ── 1. EXECUTOR ENV ──
        d("")
        d("── 1. EXECUTOR ENV ──")
        d(("  getconnections: %s"):format(tostring(getconnections ~= nil)))
        d(("  getgenv: %s"):format(tostring(getgenv ~= nil)))
        d(("  setclipboard: %s"):format(tostring(setclipboard ~= nil)))
        d(("  http_request: %s"):format(tostring((http_request or request or (syn and syn.request) or (http and http.request)) ~= nil)))
        d(("  writefile/readfile: %s/%s"):format(tostring(writefile ~= nil), tostring(readfile ~= nil)))
        d(("  isfolder/makefolder: %s/%s"):format(tostring(isfolder ~= nil), tostring(makefolder ~= nil)))
        d(("  cloneref: %s"):format(tostring(cloneref ~= nil)))
        d(("  identifyexecutor: %s"):format(identifyexecutor and tostring(identifyexecutor()) or "n/a"))

        -- ── 2. OMNI FRAMEWORK ──
        d("")
        d("── 2. OMNI FRAMEWORK ──")
        d(("  _WF.ModulesLoaded: %s"):format(tostring(_WF.ModulesLoaded)))
        d(("  Omni: %s"):format(_WF.Omni and "✓" or "✗ MISSING"))
        if _WF.Omni then
            d(("  Omni.Data: %s"):format(_WF.Omni.Data and "✓" or "✗"))
            d(("  Omni.Signal.Fire: %s"):format(_WF.Omni.Signal and type(_WF.Omni.Signal.Fire) == "function" and "✓" or "✗"))
            d(("  Omni.Shared: %s"):format(_WF.Omni.Shared and "✓" or "✗"))
            d(("  Omni.Cache.Get: %s"):format(_WF.Omni.Cache and type(_WF.Omni.Cache.Get) == "function" and "✓" or "✗"))
            d(("  Omni.Libs.DataContainer: %s"):format(_WF.Omni.Libs and _WF.Omni.Libs.DataContainer and "✓" or "✗"))
            local util = _WF.Omni.Utils and _WF.Omni.Utils.Info
            d(("  Omni.Utils.Info.GetPriceAmount: %s"):format(util and type(util.GetPriceAmount) == "function" and "✓" or "✗"))
            local ps = _WF.Omni.Utils and _WF.Omni.Utils.PlayerStats
            d(("  Omni.Utils.PlayerStats.HasMapZone: %s"):format(ps and type(ps.HasMapZone) == "function" and "✓" or "✗"))
            d(("  Omni.Utils.PlayerStats.ClickCooldown: %s"):format(ps and type(ps.ClickCooldown) == "function" and "✓" or "✗"))
            d(("  Omni.Utils.PlayerStats.StarOpenSpeed: %s"):format(ps and type(ps.StarOpenSpeed) == "function" and "✓" or "✗"))
            d(("  Omni.Utils.PlayerStats.MaxStarOpen: %s"):format(ps and type(ps.MaxStarOpen) == "function" and "✓" or "✗"))
            local sg = _WF.Omni.Shared and _WF.Omni.Shared.Gamemodes
            d(("  Shared.Gamemodes.IsTimedGamemode: %s"):format(sg and type(sg.IsTimedGamemode) == "function" and "✓" or "✗"))
            d(("  Shared.Gamemodes.GetTimeForNextOpen: %s"):format(sg and type(sg.GetTimeForNextOpen) == "function" and "✓" or "✗"))
            local sp = _WF.Omni.Shared and _WF.Omni.Shared.Progression
            d(("  Shared.Progression.GetLevelInformation: %s"):format(sp and type(sp.GetLevelInformation) == "function" and "✓" or "✗"))
            local su = _WF.Omni.Shared and _WF.Omni.Shared.Upgrade
            d(("  Shared.Upgrade.GetLevelInformation: %s"):format(su and type(su.GetLevelInformation) == "function" and "✓" or "✗"))
        end

        -- ── 3. DATA SNAPSHOT ──
        d("")
        d("── 3. DATA SNAPSHOT ──")
        local data = _WF.Omni and _WF.Omni.Data
        if not data then
            d("  (Data not available)")
        else
            d(("  Power: %s | Crystals: %s | Gems: %s (%s paid, %s free) | Aura: %s"):format(
                tostring(data.Power), tostring(data.Crystals), tostring((data.FreeGems or 0)+(data.PaidGems or 0)),
                tostring(data.PaidGems), tostring(data.FreeGems), tostring(data.Aura)))
            d(("  Level: %s"):format(tostring(data.Level and data.Level.Amount or data.Level)))
            d(("  Map: %s | Zone: %s | Gamemode: %s"):format(tostring(data.Map), tostring(data.Zone), tostring(data.Gamemode)))
            d(("  Settings.Anti Afk: %s"):format(tostring((data.Settings or {})["Anti Afk"])))
            if data.AntiAfk then
                d(("  AntiAfk.LastStar: %s | LastGacha: %s | LastBanner: %s"):format(
                    tostring(data.AntiAfk.LastStar), tostring(data.AntiAfk.LastGacha), tostring(data.AntiAfk.LastBanner)))
            end
            -- Gamepasses relevant to us
            local gp = data.Gamepasses or {}
            local gpRelevant = {}
            for _, name in ipairs({ "Remote Star", "Star Speed", "Gacha Rolls", "Auto Click", "Auto Aura Upgrade", "Auto Awaken" }) do
                table.insert(gpRelevant, name .. "=" .. tostring(gp[name]))
            end
            d("  Gamepasses: " .. table.concat(gpRelevant, " | "))
            -- Inventory items (ключевые)
            local items = data.Inventory and data.Inventory.Items or {}
            local keyItems = {}
            for _, name in ipairs({ "Saiyan Key", "Haki Token", "Race Token", "Fruit Token", "Slime Token", "Dragon Balls Token" }) do
                local v = items[name]
                local amt = (type(v) == "number") and v or (type(v) == "table" and (v.Amount or 0)) or 0
                table.insert(keyItems, name .. "=" .. tostring(amt))
            end
            d("  Items: " .. table.concat(keyItems, " | "))
            -- Progression/Upgrade/SkillTree counts
            local pCount, uCount, stCount = 0, 0, 0
            if type(data.Progression) == "table" then for _ in pairs(data.Progression) do pCount = pCount + 1 end end
            if type(data.Upgrade) == "table" then for _ in pairs(data.Upgrade) do uCount = uCount + 1 end end
            if type(data.SkillTree) == "table" then for _ in pairs(data.SkillTree) do stCount = stCount + 1 end end
            d(("  Progression keys: %d | Upgrade keys: %d | SkillTree keys: %d"):format(pCount, uCount, stCount))
            local pa = data.ProgressionsAuto
            if type(pa) == "table" then
                local onCount, offCount = 0, 0
                for _, v in pairs(pa) do if v then onCount = onCount + 1 else offCount = offCount + 1 end end
                d(("  ProgressionsAuto: %d on / %d off"):format(onCount, offCount))
            end
            -- Data.Gacha — Current для каждой гачи (для target-rarity detection)
            if type(data.Gacha) == "table" then
                local gNames = {}
                for k, v in pairs(data.Gacha) do
                    if type(v) == "table" and v.Current then
                        table.insert(gNames, k .. "→" .. tostring(v.Current))
                    end
                end
                d(("  Data.Gacha.Current: %s"):format(#gNames > 0 and table.concat(gNames, ", ") or "(none rolled)"))
            end
        end

        -- ── 4. WORKSPACE ──
        d("")
        d("── 4. WORKSPACE ──")
        local enemies = Workspace:FindFirstChild("Server") and Workspace.Server:FindFirstChild("Enemies")
        d(("  Server.Enemies: %s"):format(enemies and "✓" or "✗ MISSING"))
        if enemies then
            local gms = enemies:FindFirstChild("Gamemodes")
            if gms then
                local gmList = {}
                for _, c in ipairs(gms:GetChildren()) do
                    table.insert(gmList, ("%s=%d"):format(c.Name, #c:GetChildren()))
                end
                d(("  Enemies.Gamemodes: %s"):format(#gmList > 0 and table.concat(gmList, ", ") or "(empty)"))
            end
            local world = enemies:FindFirstChild("World")
            if world and data and data.Map then
                local mapFolder = world:FindFirstChild(data.Map)
                if mapFolder then
                    local zoneFolder = mapFolder:FindFirstChild(tostring(data.Zone or 1))
                    if zoneFolder then
                        d(("  Enemies.World.%s.%s: %d mobs"):format(data.Map, tostring(data.Zone), #zoneFolder:GetChildren()))
                    end
                end
            end
        end
        -- Dragon Defense base lookup
        safe(function()
            local mapsRoot = Workspace:FindFirstChild("Client") and Workspace.Client:FindFirstChild("Maps")
            local ddMap = mapsRoot and mapsRoot:FindFirstChild("Dragon Defense")
            if ddMap then
                local model = ddMap.Map and ddMap.Map.Defense and ddMap.Map.Defense:FindFirstChild("Model")
                if model then
                    local children = model:GetChildren()
                    d(("  DD base path: Client.Maps.Dragon Defense.Map.Defense.Model (%d children)"):format(#children))
                    local base71 = children[71]
                    if base71 then
                        d(("    [71]: %s (%s, %s)"):format(base71.Name, base71.ClassName,
                            base71:IsA("BasePart") and tostring(base71.Position) or "not BasePart"))
                    end
                else
                    d("  DD base: Map.Defense.Model not found")
                end
            else
                d("  DD base: Client.Maps.Dragon Defense not found (map unloaded)")
            end
        end)

        -- ── 5. SHARED CONFIGS ──
        d("")
        d("── 5. SHARED CONFIGS ──")
        if _WF.Omni and _WF.Omni.Shared then
            local sh = _WF.Omni.Shared
            local function countTable(t) local n=0; if type(t)=="table" then for _ in pairs(t) do n=n+1 end end; return n end
            d(("  Gamemodes: %d entries"):format(countTable(sh.Gamemodes)))
            -- Имена gamemode'ов лежат в Shared.Gamemodes.List, НЕ на верхнем уровне.
            -- На верхнем только методы (List/IsTimedGamemode/GetTimeForNextOpen).
            local gmList = sh.Gamemodes and sh.Gamemodes.List
            if type(gmList) == "table" then
                local gmNames = {}
                for k in pairs(gmList) do
                    if type(k) == "string" then table.insert(gmNames, k) end
                end
                table.sort(gmNames)
                d(("    List: %d → %s"):format(#gmNames, table.concat(gmNames, ", ")))
            end
            d(("  Progression.List: %d"):format(countTable(sh.Progression and sh.Progression.List)))
            d(("  SkillTree.List: %d"):format(countTable(sh.SkillTree and sh.SkillTree.List)))
            d(("  Gacha.List: %d"):format(countTable(sh.Gacha and sh.Gacha.List)))
            d(("  Banner.List: %d"):format(countTable(sh.Banner and sh.Banner.List)))
            d(("  Roulette.List: %d"):format(countTable(sh.Roulette and sh.Roulette.List)))
            -- Trial Upgrades
            local tu = sh.Upgrade and sh.Upgrade.List and sh.Upgrade.List["Trial Upgrades"]
            if tu and tu.Upgrades then
                local names = {}
                for k in pairs(tu.Upgrades) do table.insert(names, k) end
                table.sort(names)
                d("  Upgrade['Trial Upgrades'].Upgrades: " .. table.concat(names, ", "))
            end
            -- Stars
            if type(sh.Stars) == "table" then
                local sNames = {}
                for k, v in pairs(sh.Stars) do
                    if type(v) == "table" and v.Price then table.insert(sNames, k) end
                end
                table.sort(sNames)
                d(("  Stars: %d (%s)"):format(#sNames, table.concat(sNames, ", ")))
            end
        end

        -- ── 6. PER-GAMEMODE STATE ──
        d("")
        d("── 6. PER-GAMEMODE STATE ──")
        local sg = _WF.Omni and _WF.Omni.Shared and _WF.Omni.Shared.Gamemodes
        local sgList = sg and sg.List  -- конфиги живут в .List, не на верхнем уровне
        local dc = _WF.Omni and _WF.Omni.Libs and _WF.Omni.Libs.DataContainer
        local gmNamesToCheck = {}
        if type(sgList) == "table" then
            for k, v in pairs(sgList) do
                if type(k) == "string" and type(v) == "table" and
                   (v.OpenTimes or v.OpenEvery or v.MapName or v.MaxWave or v.EnterTime) then
                    table.insert(gmNamesToCheck, k)
                end
            end
        end
        table.sort(gmNamesToCheck)
        for _, name in ipairs(gmNamesToCheck) do
            d(("  [%s]"):format(name))
            local cfg = sgList[name]
            d(("    OpenTimes=%s | OpenEvery=%s | EnterTime=%s | MapName=%s | MaxWave=%s"):format(
                cfg.OpenTimes and table.concat(cfg.OpenTimes, ",") or "nil",
                tostring(cfg.OpenEvery), tostring(cfg.EnterTime),
                tostring(cfg.MapName), tostring(cfg.MaxWave)))
            if sg.IsTimedGamemode then
                local ok, t = pcall(sg.IsTimedGamemode, name)
                d(("    IsTimedGamemode: %s (ok=%s)"):format(tostring(t), tostring(ok)))
            end
            if dc then
                local ok, c = pcall(function() return dc:Get("GamemodeData - " .. name) end)
                if ok and c and c.Data then
                    d(("    Data: Opened=%s LastStart=%s Wave=%s/%s Enemies=%s Health=%s"):format(
                        tostring(c.Data.Opened), tostring(c.Data.LastStart),
                        tostring(c.Data.Wave), tostring(c.Data.MaxWave),
                        tostring(c.Data.Enemies), tostring(c.Data.Health)))
                else
                    d("    DataContainer: not available")
                end
            end
            if sg.GetTimeForNextOpen then
                local ls = 0
                if dc then
                    local _, c = pcall(function() return dc:Get("GamemodeData - " .. name) end)
                    if c and c.Data and type(c.Data.LastStart) == "number" then ls = c.Data.LastStart end
                end
                local ok, s = pcall(sg.GetTimeForNextOpen, name, ls)
                d(("    GetTimeForNextOpen: %s (ok=%s)"):format(tostring(s), tostring(ok)))
            end
        end

        -- ── 7. SCRIPT STATE (_WF.*) ──
        d("")
        d("── 7. SCRIPT STATE ──")
        d("  Toggles ON:")
        local toggles = {
            "AutoFarmEnabled","AutoClickEnabled","AutoOpenStarEnabled","AutoQuestEnabled","AutoPinQuestEnabled",
            "AutoTpToQuestZoneEnabled","AutoTrialEnabled","AutoDragonDefenseEnabled","AutoTempestInvasionEnabled",
            "AutoGachaEnabled","AutoBannerRollEnabled","AutoRouletteRollEnabled",
            "AutoAchievementsEnabled","AutoTimeRewardsEnabled","AutoDailyRewardsEnabled",
            "AutoFollowRewardsEnabled","AutoDailyChestEnabled","AutoGroupChestEnabled",
            "AutoVIPChestEnabled","AutoProgressionEnabled","AutoTrialUpgradesEnabled","AutoTempestUpgradesEnabled",
            "AutoSkillTreeEnabled","AutoEquipBestEnabled","AutoPotionsEnabled",
            "AutoCodesEnabled","DisableGameAntiAfkEnabled",
            "WebhookEnabled",
        }
        local onList = {}
        for _, name in ipairs(toggles) do
            if _WF[name] then table.insert(onList, name) end
        end
        d("    " .. (#onList > 0 and table.concat(onList, ", ") or "(none)"))
        -- Selections
        local function listKeys(t) local o={}; if type(t)=="table" then for k in pairs(t) do table.insert(o,tostring(k)) end end; table.sort(o); return o end
        d("  Selections:")
        d(("    Targets (farm): %s"):format(table.concat(listKeys(_WF.Targets), ", ")))
        d(("    StarTargets: %s"):format(table.concat(listKeys(_WF.StarTargets), ", ")))
        d(("    QuestSelections: %s"):format(table.concat(listKeys(_WF.QuestSelections), ", ")))
        d(("    TrialSelections: %s"):format(table.concat(listKeys(_WF.TrialSelections), ", ")))
        d(("    GachaSelection: %s"):format(table.concat(listKeys(_WF.GachaSelection), ", ")))
        d(("    ProgressionSelection: %s"):format(table.concat(listKeys(_WF.ProgressionSelection), ", ")))
        d(("    TrialUpgradeSelection: %s"):format(table.concat(listKeys(_WF.TrialUpgradeSelection), ", ")))
        d(("    TempestUpgradeSelection: %s"):format(table.concat(listKeys(_WF.TempestUpgradeSelection), ", ")))
        d(("    SkillTreeSelection: %s"):format(table.concat(listKeys(_WF.SkillTreeSelection), ", ")))
        d("  Mutexes:")
        d(("    StarBusy=%s | ZoneTpBusy=%s | TrialBusy=%s | GamemodeJoinBusy=%s"):format(
            tostring(_WF.StarBusy), tostring(_WF.ZoneTpBusy),
            tostring(_WF.TrialBusy), tostring(_WF.GamemodeJoinBusy)))
        d("  Config:")
        d(("    TrialAutoLeaveWave=%s | DragonDefenseLeaveWave=%s"):format(
            tostring(_WF.TrialAutoLeaveWave), tostring(_WF.DragonDefenseLeaveWave)))
        d(("    GachaTargetRarity=%s | GachaThreshold=%s"):format(
            tostring(_WF.GachaTargetRarity), tostring(_WF.GachaThreshold)))
        d(("    BannerName=%s | RouletteName=%s"):format(
            tostring(_WF.BannerName), tostring(_WF.RouletteName)))
        d(("    EquipBestStat=%s"):format(tostring(_WF.EquipBestStat)))
        d("  Saved Position:")
        if _WF.SavedPosition then
            local p = _WF.SavedPosition.Position
            d(("    Location: %s"):format(tostring(_WF.SavedLocation)))
            d(("    CFrame: (%.1f, %.1f, %.1f)"):format(p.X, p.Y, p.Z))
        else
            d("    (not saved)")
        end

        -- ── 8. CHARACTER ──
        d("")
        d("── 8. CHARACTER ──")
        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hrp then
                d(("  HRP: (%.1f, %.1f, %.1f) anchored=%s"):format(
                    hrp.Position.X, hrp.Position.Y, hrp.Position.Z, tostring(hrp.Anchored)))
            end
            if hum then
                d(("  Humanoid: Health=%s/%s WalkSpeed=%s"):format(
                    tostring(math.floor(hum.Health)), tostring(math.floor(hum.MaxHealth)), tostring(hum.WalkSpeed)))
            end
        else
            d("  Character: nil (respawning?)")
        end

        d("")
        d("═══════════════════ END ═══════════════════")
        flushDump(buf, "Full Debug Dump")
    end,
})

sec.SetR:Header({ Text = "Info" })
sec.SetR:Paragraph({
    Header = "World Fighters Hub",
    Body   =
        "Version: v1.0\n" ..
        "Framework: Omni (BridgeNet wrapper)\n" ..
        "Toggle UI: LeftCtrl\n" ..
        "Drag: free window (DragStyle=2)\n" ..
        "\n" ..
        "Конфиг автосохраняется в workspace/ApelHub/.",
})

-- // ========================================== \\ --
-- //               FINALIZATION                 \\ --
-- // ========================================== \\ --

-- _WFStop — master kill-switch. Turns off every feature flag, disconnects signals, unloads window.
getgenv()._WFStop = function()
    -- Turn off every flag
    _WF.AutoFarmEnabled          = false
    _WF.AutoClickEnabled         = false
    _WF.AutoOpenStarEnabled      = false
    _WF.AutoQuestEnabled         = false
    _WF.AutoTrialEnabled         = false
    _WF.AutoDragonDefenseEnabled = false
    _WF.AutoTempestInvasionEnabled = false
    _WF.TempestInvasionAbandoned   = false
    _WF.AutoGachaEnabled         = false
    _WF.AutoBannerRollEnabled    = false
    _WF.AutoRouletteRollEnabled  = false
    _WF.AutoAchievementsEnabled  = false
    _WF.AutoTimeRewardsEnabled   = false
    _WF.AutoDailyRewardsEnabled  = false
    _WF.AutoFollowRewardsEnabled = false
    _WF.AutoDailyChestEnabled    = false
    _WF.AutoGroupChestEnabled    = false
    _WF.AutoVIPChestEnabled      = false
    _WF.AutoProgressionEnabled   = false
    _WF.AutoTrialUpgradesEnabled = false
    _WF.AutoTempestUpgradesEnabled = false
    _WF.AutoSkillTreeEnabled     = false
    _WF.AutoEquipBestEnabled     = false
    _WF.DisableGameAntiAfkEnabled = false
    _WF.AutoPotionsEnabled       = false
    _WF.AutoCodesEnabled         = false
    _WF.WebhookEnabled           = false

    _WF.Targets          = {}
    _WF.StarTargets      = {}
    _WF.QuestSelections  = {}
    _WF.TrialSelections  = {}
    _WF.GachaSelection   = {}

    -- Mutexes
    _WF.GamemodeJoinBusy = false
    _WF.StarBusy         = false
    _WF.ZoneTpBusy       = false
    _WF.TrialBusy        = false

    if getgenv()._WFCleanup then pcall(getgenv()._WFCleanup); getgenv()._WFCleanup = nil end
    pcall(function() Window:Unload() end)
end

task.spawn(function()
    task.wait(0.2)
    pcall(function()
        Window:CreateMinimizer({
            Size = UDim2.fromOffset(50, 50),
            Position = UDim2.new(1, -10, 0.5, 0),
            Icon = "rbxassetid://138310609771261",
        })
    end)
end)

task.spawn(function()
    task.wait(0.5)
    print("Apel Hub | " .. GameName .. " loaded!")
    task.wait(0.5)
    if _G.KeyExpiresAt then pcall(function() Window:SetKeyTimer(_G.KeyExpiresAt) end) end
end)

MacLib:SetFolder("ApelHub")
task.spawn(function() pcall(function() MacLib:LoadAutoLoadConfig() end) end)
task.spawn(function() pcall(function() tabs.Farm:Select() end) end)

Window.onUnloaded(function()
    getgenv()._WFRunning = false
    if getgenv()._WFCleanup then pcall(getgenv()._WFCleanup); getgenv()._WFCleanup = nil end
    getgenv()._WFStop = nil
    print("Apel Hub | " .. GameName .. " unloaded!")
end)
