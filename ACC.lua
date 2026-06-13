-- ============================================================================
-- ANIME CARD COLLECTION  ―  Apel-style Hub
-- Game: PlaceId 76285745979410
-- Framework: Madwork ProfileStore + ReplicaService + Standard group remotes
-- UI: MacLib fork @ https://raw.githubusercontent.com/dvorfkar6-lab/uis/refs/heads/main/Mac
-- ============================================================================

-- // 1. CLEANUP (idempotent re-run)
if getgenv()._ACCRunning then
    getgenv()._ACCRunning = false
    task.wait(0.5)
end
if getgenv()._ACCCleanup then
    pcall(getgenv()._ACCCleanup)
    getgenv()._ACCCleanup = nil
end
if getgenv()._ACCNamecallRestore then
    pcall(getgenv()._ACCNamecallRestore)
    getgenv()._ACCNamecallRestore = nil
end
if getgenv()._ACCNotifyRestore then
    pcall(getgenv()._ACCNotifyRestore)
    getgenv()._ACCNotifyRestore = nil
end
if getgenv()._ACCUI then
    pcall(function() getgenv()._ACCUI:Unload() end)
    getgenv()._ACCUI = nil
end
if getgenv()._ACCHooks then
    for _, h in pairs(getgenv()._ACCHooks) do
        pcall(function() h.holder[h.name] = h.original end)
    end
    getgenv()._ACCHooks = nil
end

-- // 2. SERVICES & VARIABLES
local Players            = game:GetService("Players")
local RS                 = game:GetService("ReplicatedStorage")
local ReplicatedFirst    = game:GetService("ReplicatedFirst")
local RunService         = game:GetService("RunService")
local TweenService       = game:GetService("TweenService")
local UserInputService   = game:GetService("UserInputService")
local HttpService        = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local VirtualUser        = (cloneref and cloneref(game:GetService("VirtualUser")))
                            or game:GetService("VirtualUser")
local CollectionService  = game:GetService("CollectionService")
local Workspace          = workspace

if not game:IsLoaded() then game.Loaded:Wait() end

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    task.wait()
    LocalPlayer = Players.LocalPlayer
end
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

getgenv()._ACCRunning = true
getgenv()._ACCHooks = {}

local _ACC = {}
getgenv()._ACC = _ACC   -- expose for debug probes
_ACC.Debug = false

-- ── Auto Farm state ────────────────────────────────────────────────────────
_ACC.AutoBuyEnabled        = false
_ACC.AutoOpenEnabled       = false
_ACC.AutoPlaceEnabled      = false
_ACC.AutoCollectEnabled    = false
_ACC.AutoLoot              = false
_ACC.CollectAllEnabled     = false
_ACC.SkipOpenAnim          = false
_ACC.OpenViaPrompt         = true
_ACC.SelectedBuyPacks      = {}   -- map { ["Pirate"]=true, ["Pirate Gold"]=true, ... }
_ACC.SelectedPlacePacks    = {}   -- map { ["Pirate"]=true, ["Pirate Gold"]=true, ... }
-- GENERAL cap on USED placement slots — applies to singles AND bundles. The
-- board fills only up to this many used slots, then placing stops (a Bundle
-- counts as 5 used slots). Keeps the plot a predictable size so it doesn't lag
-- or stall retrying into a crammed board. Effective cap = min(this, MaxPlacements).
-- (Flag name kept for config back-compat; it now caps TOTAL slots, not just singles.)
_ACC.SinglePlaceCap        = 50
_ACC.PlaceSkipSingles      = true    -- never place the LAST (count==1) of a type — phantom packs are always 1

-- ── Auto Level Farm (cards → Lv.30) — internal override of Place/Hatch ──
_ACC.LvlFarmEnabled        = false
_ACC._FarmPlacing          = false   -- engines (AutoPlace/Hatch) act on farm sets when true
_ACC._FarmPlacePacks       = {}      -- phase set AutoPlace actually places now (bundles OR singles)
_ACC._FarmPlaceAll         = {}      -- bundles+singles of focus family (for placementDone test)

-- ── Combat state ──────────────────────────────────────────────────────────
_ACC.TowerAutoStart        = false
_ACC.HideBattle            = false
_ACC.AutoTrait             = false
_ACC.AutoArmor             = false
_ACC.SelectedTraitCards    = {}   -- map
_ACC.SelectedWantedTraits  = {}   -- map
_ACC.TraitRollReverse      = false  -- roll the card list last→first instead of first→last
_ACC.WantedArmorGrades     = {}        -- map { ["S+"]=true, ["SR"]=true }
_ACC.ArmorMaterials        = {}        -- map { ["Bronze"]=true, ... }

_ACC.STAutoStart           = false
_ACC.STAutoAttack          = false
_ACC.STHideAnim            = false
_ACC.STSelectedCard        = nil
_ACC.STSelectedDifficulty  = nil
_ACC.AutoStarEvolve        = false
_ACC.StarEvolveCards       = {}     -- map { [internal cardName] = true }
_ACC.STUpgDamage           = false
_ACC.STUpgHealth           = false
_ACC.STUpgBattleSpeed      = false
_ACC.STUpgTicketChance     = false
_ACC.STEvolveTarget        = ""

_ACC.AutoGrade             = false
_ACC.GradeUseTokensFirst   = true
_ACC.SelectedGradeCards    = {}   -- map
_ACC.SelectedWantedGrades  = {}   -- map
_ACC.GradeRollReverse      = false  -- roll the card list last→first instead of first→last

_ACC.AutoRaid              = false
_ACC.RaidEquipBest         = true
_ACC.RaidMode              = "Auto pick (max we can beat)"
_ACC.RaidSpecific          = nil

-- ── Auto Claim ────────────────────────────────────────────────────────────
_ACC.AutoAchievements      = false
_ACC.CodeInput             = ""
-- Codes from the official Discord (redeemed via Codes:FireServer(codeString)).
-- Server rejects invalid/expired silently; check in-game for the result toast.
_ACC.CodeList = {
    "FirstCode","SecondCode","ThirdCode","FourthCode","FifthCode","SixthCode",
    "SeventhCode","EighthCode","NinthCode","TenthCode","EleventhCode","TwelfthCode",
    "ThirteenthCode","FourteenthCode","FifteenthCode","SixteenthCode","SeventeenthCode",
    "EighteenthCode","NineteenthCode","TwentiethCode","TwentyFirstCode","TwentySecondCode",
    "TwentyThirdCode","TwentyFourthCode","TwentyFifthCode","TwentySixthCode","TwentySeventhCode",
    "TwentyEighthCode","TwentyNinthCode","ThirtyCode","ThirtyOneCode","ThirtyTwoCode",
    "ThirtyThreeCode","ThirtyFourCode","ThirtyFiveCode","ThirtySixCode","ThirtySevenCode",
    "ThirtyEightCode","ThirtyNineCode","FortyCode",
}
_ACC.AutoRewards           = false
_ACC.AutoExpSend           = false
_ACC.AutoExpClaim          = false
_ACC.SelectedExpPacks      = {}     -- map { ["Pirate Gold"] = true, ... }
_ACC.SelectedExpNPCs       = { ["1"] = true, ["2"] = true, ["3"] = true, ["4"] = true }
_ACC.RespectExpDaily       = true   -- stop sending when daily cap reached
_ACC.ExpStrategy           = "Cheapest first"  -- or "Most expensive first" / "Highest mutation first"

-- ── Shops ─────────────────────────────────────────────────────────────────
_ACC.AutoStock             = false
_ACC.AutoMerchant          = false
_ACC.SelectedStockItems    = {}   -- map { ["Pirate-Gold"] = true, ... }
_ACC.SelectedMerchantItems = {}   -- map { ["Pirate-Gold"] = true, ... }
_ACC.MerchantPaymentMode   = "Trade -> Tokens"  -- Trade (Cash/packs) first, fall back to TravelTokens
_ACC.SelectedPetEggs       = {}   -- map
_ACC.PetRoll1              = false
_ACC.PetRoll5              = false
_ACC.AutoPetQuests         = false      -- orchestrate engines to complete pet quests
_ACC.PetQuestMode          = "Smart"    -- "Smart" (use your selections) / "Zero-config" (auto-pick)
_ACC.DragonBallAuto        = false
_ACC.DBWishType            = "Cash"  -- which wish to make when 7 balls collected

-- ── Voyage (Update 48) ─────────────────────────────────────────────────────
_ACC.VoyageAuto            = false                 -- auto-start voyage + keep AFK loop running
_ACC.VoyagePack            = "Auto (MaxWave)"       -- "Auto (MaxWave)"=deepest pack · "Auto (Rotate packs)"=1 run per pack · or a pack name
_ACC.VoyageUpgradeAuto     = false                 -- auto-buy voyage upgrades (cheapest first)
_ACC.VoyageEquipAuto       = false                 -- auto-equip best poster per pack
_ACC.VoyageBuffWeights     = {}                    -- buff name -> priority weight 0-10 (poster equip)
_ACC.VoyageSmeltAuto       = false                 -- auto-smelt posters of selected rarities (destructive)
_ACC.VoyageSmeltRarities   = {}                    -- map: limit smelt to these rarities (empty = all)
_ACC.VoyageSmeltThresholds = {}                    -- buff -> min fraction to KEEP; meets none → smelt
_ACC.VoyageForgeAuto       = false                 -- auto-forge a poster when ≥5 scrolls of a rarity
_ACC.VoyageForgePack       = "Auto (deepest eligible)"  -- which pack auto-forge crafts for

-- ── Inventory ─────────────────────────────────────────────────────────────
_ACC.PEMethod              = "Upgrade"   -- Upgrade / Downgrade / Bundle / Unbundle
_ACC.PESelectedPacks       = {}   -- map
_ACC.PEFromRarities        = { Regular = true }   -- multi-select map of rarities
_ACC.PEBatch               = "1x" -- Bundle/Unbundle batch size: 1x / 10x / 100x
_ACC.PEEnabled             = false
_ACC.SelectedCraftPotions  = {}   -- map — potions to auto-craft
_ACC.SelectedUsePotions    = {}   -- map — potions to auto-drink / apply via buttons
_ACC.AutoCraftPotions      = false
_ACC.AutoUsePotions        = false
_ACC.SelectedUpgrades      = {}   -- map
_ACC.AutoUpgrade           = false
_ACC.RelicCraft            = false

-- ── Misc ──────────────────────────────────────────────────────────────────
_ACC.WebhookURL            = ""
_ACC.WebhookDrops          = false
_ACC.WebhookRaid           = false
_ACC.WebhookDBComplete     = false   -- DragonBalls reached 7/7
_ACC.WebhookPetMutation    = false   -- Pet got Rainbow/Diamond/Emerald/Void mutation
_ACC.WebhookCardMax        = false   -- Card reached ⭐5
_ACC.WebhookMerchant       = false   -- log what was bought from the Travel Merchant
_ACC.AntiAFK               = true
_ACC.JoinJobId             = ""   -- server JobId to teleport into (Travel sniping)
-- Auto server hop: after the script loads + buys, jump to a fresh server.
_ACC.AutoHopEnabled        = false
_ACC.HopDelay              = 10   -- snipe: settle time on an empty server before hopping (2..30)
_ACC.HopBuyWindow          = 15   -- snipe: seconds to STAY on a merchant server (buy) before hopping on (3..60)
_ACC.HopMaxPlayers         = 10   -- only hop to servers with <= this many players
_ACC._hopLoadClock         = os.clock()
_ACC.HideHUDPopups         = false
_ACC.FPSBoost              = false   -- low-graphics performance mode (kills FX, drops quality)

-- ── Gallery ───────────────────────────────────────────────────────────────
-- Auto Buy Packs
_ACC.AutoGalleryBuy            = false
_ACC.SelectedGalleryPacks      = {}        -- map ["Basic"]=true ...
_ACC.GalleryBuyStrategy        = "Highest first"  -- / "Lowest first" / "Spread"
-- Auto Upgrade per-card buff
_ACC.AutoGalleryUpgrade        = false
_ACC.SelectedUpgradeCards      = {}        -- map ["Pirate"]=true ...
_ACC.SelectedUpgradeKinds      = {}        -- map ["Cash"]=true ...
_ACC.GalleryUpgradeMode        = "Multi-select"   -- / "Specific card"
_ACC.GalleryUpgradeFocusCard   = nil       -- when mode = Specific
_ACC.GalleryUpgradeStrategy    = "Highest first"  -- / "Lowest first" / "Spread"
-- Auto Levelup figurines
_ACC.AutoGalleryLevelup        = false
_ACC.SelectedLevelupFigurines  = {}        -- map of figurine names
_ACC.GalleryLevelupStrategy    = "Highest mult first"  -- / "Lowest mult first" / "Spread"
-- Misc auto
_ACC.AutoGalleryClaim          = false     -- claim discovered figurine bonuses
_ACC.AutoGalleryCollect        = false     -- collect cash from active slots
-- Auto Boosts (NEW — game update: figurine boost system)
_ACC.AutoFigurineStockBoost    = false     -- auto-upgrade per-pack stock boost
_ACC.SelectedStockBoostPacks   = {}        -- map ["Basic"]=true ...
_ACC.AutoFigurineGenericBoost  = false     -- auto-upgrade DiamondMultiplier / FigurineLuck
_ACC.SelectedGenericBoosts     = {}        -- map ["DiamondMultiplier"]=true ...
-- Internal: spread-mode round-robin counters
_ACC._GallerySpreadIdxBuy      = 0
_ACC._GallerySpreadIdxUpg      = 0
_ACC._GallerySpreadIdxLvl      = 0

-- ── Internal ──────────────────────────────────────────────────────────────
_ACC._connections          = {}
_ACC._merchantBuyQueue     = {}    -- pending Travel-Merchant buys awaiting a webhook flush
_ACC.IsLoadingConfig       = true
_ACC.ModulesLoaded         = false

-- ── Wait until game is ready (multi-signal, with diagnostic logs) ────────
-- Framework sets attribute "DataReady"=true when Replica arrives, then in
-- PostStart() resets DataReady to nil and sets "Init"=true.
-- BUT: in some executor environments the attributes may not be visible.
-- So we check multiple signals: attribute Init, attribute DataReady,
-- PlayerGui.HUD existence (UI is cloned to PlayerGui early in Init),
-- and finally we just try to resolve ReplicatedData — if it works, we go.
warn("[ACC_HUB] starting readiness check...")
local function isReady()
    if LocalPlayer:GetAttribute("Init")      == true then return "Init attribute" end
    if LocalPlayer:GetAttribute("DataReady") == true then return "DataReady attribute" end
    if PlayerGui:FindFirstChild("HUD") then return "PlayerGui.HUD exists" end
    -- last resort: try to resolve ReplicatedData and see if it has Data
    local rdMod = ReplicatedFirst:FindFirstChild("ReplicatedData")
    if rdMod then
        local ok, mod = pcall(require, rdMod)
        if ok and type(mod) == "table" and type(mod.GetReplica) == "function" then
            local okR, replica = pcall(mod.GetReplica)
            if okR and replica and type(replica.Data) == "table" and replica.Data.Cash ~= nil then
                return "ReplicatedData.GetReplica() returned valid Data"
            end
        end
    end
    return nil
end
local readyReason
do
    local started = os.clock()
    while true do
        readyReason = isReady()
        if readyReason then break end
        if os.clock() - started > 30 then break end
        task.wait(0.5)
    end
end
if not readyReason then
    -- print full diagnostic so user can see which signals exist
    warn("[ACC_HUB] readiness check FAILED after 30s, dumping signals:")
    warn("  LocalPlayer attributes:")
    for k, v in pairs(LocalPlayer:GetAttributes()) do
        warn(("    %s = %s"):format(tostring(k), tostring(v)))
    end
    warn("  PlayerGui children:")
    for _, c in ipairs(PlayerGui:GetChildren()) do
        warn(("    [%s] %s"):format(c.ClassName, c.Name))
    end
    warn("  ReplicatedFirst.ReplicatedData = " .. tostring(ReplicatedFirst:FindFirstChild("ReplicatedData")))
    warn("[ACC_HUB] aborting — paste this output into chat")
    getgenv()._ACCRunning = false
    return
end
warn("[ACC_HUB] ready: " .. readyReason)
-- // 3. HELPERS (safe pcall, hooks, debug, notify placeholder)
local function safe(fn, ...)
    local ok, res = pcall(fn, ...)
    if not ok then return nil end
    return res
end
local function tryRequire(path)
    if not path then return nil end
    local ok, mod = pcall(require, path)
    if ok then return mod end
    return nil
end
_ACC._tryRequire = tryRequire
local function dbg(msg)
    if _ACC.Debug then print("[ACC] " .. tostring(msg)) end
end

-- HTTP GET with executor-agnostic fallback. Some executors (and some
-- auto-execute / post-teleport contexts) don't expose `game:HttpGet`
-- ("HttpGet is not a valid member of DataModel"), but DO ship a request
-- function. Try the DataModel method first, then fall back to request().
-- Returns the body string, or nil + error message on total failure.
local function httpGet(url)
    local ok, res = pcall(function() return game:HttpGet(url, true) end)
    if ok and type(res) == "string" then return res end
    local req = (syn and syn.request) or http_request or request or (http and http.request)
    if req then
        local ok2, resp = pcall(req, { Url = url, Method = "GET" })
        if ok2 and type(resp) == "table" then
            local body = resp.Body or resp.body
            if type(body) == "string" then return body end
        end
    end
    return nil, ("httpGet failed for %s (%s)"):format(tostring(url), tostring(res))
end
_ACC._httpGet = httpGet

-- monkey-patch with restore
local function hookPatch(holder, methodName, replacement)
    if not holder then return end
    local key = tostring(holder) .. "::" .. methodName
    if not getgenv()._ACCHooks[key] then
        getgenv()._ACCHooks[key] = { holder = holder, name = methodName, original = holder[methodName] }
    end
    holder[methodName] = replacement
end
local function hookRestore(holder, methodName)
    local key = tostring(holder) .. "::" .. methodName
    local h = getgenv()._ACCHooks[key]
    if h then
        h.holder[h.name] = h.original
        getgenv()._ACCHooks[key] = nil
    end
end

-- // 4. RESOLVE GAME MODULES & FOLDERS
local ModulesFolder = RS:WaitForChild("Modules", 10)
local ConfigFolder  = ModulesFolder and ModulesFolder:WaitForChild("Config", 5)
local CoreFolder    = ConfigFolder and ConfigFolder:WaitForChild("Core", 5)
local RemotesFolder = RS:WaitForChild("Remotes", 10)
local AssetsFolder  = RS:FindFirstChild("Assets")
local ClientFolder  = RS:FindFirstChild("Client")
local UIClient      = ClientFolder and ClientFolder:FindFirstChild("UI")

if not (ModulesFolder and CoreFolder and RemotesFolder) then
    warn("[ACC_HUB] missing core paths — wrong place?")
    getgenv()._ACCRunning = false
    return
end

-- lazy-cached config modules
local Config = setmetatable({}, {
    __index = function(t, k)
        local m = CoreFolder:FindFirstChild(k)
        if not m then return nil end
        local mod = tryRequire(m)
        rawset(t, k, mod)
        return mod
    end,
})
local CardConfig      = Config.CardConfig
local TowerConfig     = Config.TowerConfig
local PetConfig       = Config.PetConfig
local StarTrialConfig = Config.StarTrialConfig
local PackExchange    = Config.PackExchange
local Consumables     = Config.Consumables
local UpgradesConfig  = Config.Upgrades
local GradesConfig    = Config.Grades
local RaidConfig      = Config.RaidConfig
local ProductConfig   = Config.ProductConfig
local ImageConfig     = Config.ImageConfig
-- Mutations: data-only module (no requires, no WaitForChild). Safe to load.
local Mutations       = Config.Mutations  -- RS.Modules.Config.Core.Mutations
local GalleryConfig   = Config.GalleryConfig  -- RS.Modules.Config.Core.GalleryConfig (Gallery system)
local VoyageConfig    = Config.VoyageConfig    -- RS.Modules.Config.Core.VoyageConfig (Voyage system, Update 48)

-- Shop price reduction is the constant 0.6 in Modules.GameUtils.Configuration.
-- We hardcode it instead of requiring Configuration — that module pulls in
-- a chain of services that can hang during early load.
local ShopPriceReduction = 0.6

-- // 5. DATA WRAPPER  ―  Madwork Replica via debug.getupvalues hack
local Data = {}
do
    local ReplicatedData

    local GradeHandler = UIClient and tryRequire(UIClient:FindFirstChild("GradeHandler"))
    if GradeHandler and GradeHandler.Init then
        local ok, ups = pcall(debug.getupvalues, GradeHandler.Init)
        if ok and ups then
            for _, up in ipairs(ups) do
                if type(up) == "table" and type(up.ReplicatedData) == "table" then
                    ReplicatedData = up.ReplicatedData
                    break
                end
            end
        end
    end
    if not ReplicatedData then
        local rdMod = ReplicatedFirst:FindFirstChild("ReplicatedData")
        if rdMod then ReplicatedData = tryRequire(rdMod) end
    end
    if not ReplicatedData then
        warn("[ACC_HUB] could not access ReplicatedData — aborting")
        getgenv()._ACCRunning = false
        return
    end

    function Data.Get(key, sub, sub2)
        local ok, v = pcall(ReplicatedData.GetData, key, sub, sub2)
        if ok then return v end
        return nil
    end
    function Data.GetReplica()
        local ok, r = pcall(ReplicatedData.GetReplica)
        if ok then return r end
        return nil
    end
    function Data.GetTable()
        local r = Data.GetReplica()
        return r and r.Data or nil
    end
    function Data.OnChange(callback)
        local replica = Data.GetReplica()
        if not replica then return nil end
        local ok, conn = pcall(function() return replica:OnChange(callback) end)
        if ok and conn then
            table.insert(_ACC._connections, conn)
            return conn
        end
        return nil
    end
end

-- // 6. REMOTES CATALOG
local R = {}
do
    local function get(name) return RemotesFolder:FindFirstChild(name) end
    R.Card        = get("Card")
    R.Combat      = get("Combat")
    R.Tower       = get("Tower")
    R.Pet         = get("Pet")
    R.Clan        = get("Clan")
    R.Stock       = get("Stock")
    R.Relic       = get("Relic")
    R.Potion      = get("Potion")
    R.Grade       = get("Grade")
    R.Merchant    = get("Merchant")
    R.Settings    = get("Settings")
    R.World       = get("World")
    R.DragonBall  = get("DragonBall")
    R.Achievement = get("Achievement")
    R.Codes       = get("Codes")
    R.Raid        = get("Raid")
    R.StarTrial   = get("StarTrial")
    R.Voyage      = get("Voyage")
    R.Gallery          = get("Gallery")
    R.GetClanInfo      = get("GetClanInfo")
    R.GetMerchantItems = get("GetMerchantItems")
    R.GetStock         = get("GetStock")
    R.GetGalleryStock  = get("GetGalleryStock")
    R.Notify           = RS:FindFirstChild("Remotes") and RS.Remotes:FindFirstChild("Notify")
end

-- // 6.5 NOTIFY FILTER — suppress "No Stock Left" toast spam
-- Method: hook GUIDirectoryHandler.CreateTopNotification via getgc.
-- This is the central in-game toast function — every notification (from
-- Notify remote, local rejections, server messages) routes through here.
-- We patch the table-level field with a wrapper that drops blocked text.
-- Confirmed working over getconnections-based filtering for this game.
do
    local BLOCK_PATTERNS = {
        "no stock left",
        "no stock",
        "out of stock",
        "sold out",
        "not in stock",
    }
    local function shouldBlock(msg)
        if type(msg) ~= "string" or msg == "" then return false end
        -- strip rich-text tags so "<font color=..>No Stock Left</font>" matches
        msg = msg:gsub("<[^>]->", "")
        local low = msg:lower()
        for _, p in ipairs(BLOCK_PATTERNS) do
            if low:find(p, 1, true) then return true end
        end
        return false
    end

    local function applyHooks()
        if not getgc then return 0 end
        local patched = 0
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                local orig = rawget(v, "CreateTopNotification")
                -- Skip already-wrapped: marked with __ACC_wrapped flag
                if type(orig) == "function" and not rawget(v, "__ACC_NotifyHookApplied") then
                    v.CreateTopNotification = function(a, ...)
                        local args = { a, ... }
                        local text
                        for _, x in ipairs(args) do
                            if type(x) == "string" then text = x; break end
                        end
                        if shouldBlock(text) then return end
                        return orig(a, ...)
                    end
                    rawset(v, "__ACC_NotifyHookApplied", true)
                    -- Save original so cleanup can restore
                    rawset(v, "__ACC_NotifyOriginal", orig)
                    patched = patched + 1
                end
            end
        end
        return patched
    end

    local n = applyHooks()
    if _ACC.Debug then print("[ACC NotifyFilter] patched", n, "handlers") end

    -- Re-scan once after a short delay — GUIDirectoryHandler module may not
    -- be in getgc yet on cold script load.
    if n == 0 then
        task.spawn(function()
            for _ = 1, 5 do
                task.wait(1)
                if not getgenv()._ACCRunning then return end
                local more = applyHooks()
                if more > 0 then
                    if _ACC.Debug then print("[ACC NotifyFilter] late-patched", more) end
                    break
                end
            end
        end)
    end

    -- Cleanup hook for re-runs (idempotent)
    getgenv()._ACCNotifyRestore = function()
        if not getgc then return end
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "__ACC_NotifyHookApplied") then
                local orig = rawget(v, "__ACC_NotifyOriginal")
                if type(orig) == "function" then
                    rawset(v, "CreateTopNotification", orig)
                end
                rawset(v, "__ACC_NotifyHookApplied", nil)
                rawset(v, "__ACC_NotifyOriginal", nil)
            end
        end
    end
end

-- // 7. PLOT HELPERS
local Plot = {}
function Plot.GetName()
    return tostring(LocalPlayer:GetAttribute("Plot") or "")
end
function Plot.GetModel()
    local n = Plot.GetName()
    if n == "" then return nil end
    local plots = Workspace:FindFirstChild("Plots")
    return plots and plots:FindFirstChild(n) or nil
end
function Plot.GetPacks()
    local m = Plot.GetModel()
    return m and m:FindFirstChild("Packs") or nil
end
function Plot.GetDisplay()
    local m = Plot.GetModel()
    return m and m.Map and m.Map:FindFirstChild("Display") or nil
end
function Plot.GetConveyorPacks()
    local cf = Workspace:FindFirstChild("Client")
    return cf and cf:FindFirstChild("Packs") or nil
end

-- // 8. RATE LIMITER + SAFE NET
local RL_last = {}
local function RL_Allow(key, interval)
    local now = os.clock()
    if not RL_last[key] or now - RL_last[key] >= interval then
        RL_last[key] = now
        return true
    end
    return false
end

local Net = {}
function Net.Fire(remote, ...)
    if not remote or not getgenv()._ACCRunning then return false end
    local args = { ... }
    local ok = pcall(function() remote:FireServer(table.unpack(args)) end)
    return ok
end
function Net.FireRL(remote, key, interval, ...)
    if not RL_Allow(key, interval) then return false end
    return Net.Fire(remote, ...)
end
function Net.Invoke(remote, ...)
    if not remote or not getgenv()._ACCRunning then return nil end
    local args = { ... }
    local ok, ret = pcall(function() return remote:InvokeServer(table.unpack(args)) end)
    if ok then return ret end
    return nil
end

-- // 9. NUMBER ABBREVIATION PARSER
-- Mirrors Modules.Utils.Conversions.Abbreviate suffixes — each step ×10^3.
-- Used to read prices off MeshPart.ConveyorDisplay.Price.Text without spamming
-- the server with un-affordable BuyPack calls (server-side rejection of those
-- triggers the Robux purchase prompt).
local SUFFIXES = {
    "", "K", "M", "B", "T", "Q", "QN", "S", "SP", "OC", "N", "D",
    "UD", "DD", "TD", "QD", "QND", "SD", "SPD", "OD", "ND", "V", "UV",
}
local SUFFIX_ORDER = {}
for i, s in ipairs(SUFFIXES) do table.insert(SUFFIX_ORDER, { s = s, i = i }) end
-- match longest suffix first (so "QND" matches before "QN", "Q" or "")
table.sort(SUFFIX_ORDER, function(a, b) return #a.s > #b.s end)

local function parseAbbreviated(text)
    if not text or text == "" then return 0 end
    local s = tostring(text):gsub("[%$%s,]", "")
    if s == "" then return 0 end
    for _, entry in ipairs(SUFFIX_ORDER) do
        if entry.s ~= "" then
            local num = s:match("^([%-%d%.]+)" .. entry.s .. "$")
            if num then
                local n = tonumber(num)
                if n then return n * (10 ^ ((entry.i - 1) * 3)) end
            end
        end
    end
    return tonumber(s) or 0
end
-- // 9. PRECOMPUTED LISTS for dropdowns
local Lists = {}
do
    -- ── Pack family list — sorted by in-game Page order, NOT alphabetical ──
    local packs = {}
    if AssetsFolder and AssetsFolder:FindFirstChild("Packs") then
        for _, p in ipairs(AssetsFolder.Packs:GetChildren()) do
            table.insert(packs, p.Name)
        end
    elseif CardConfig and CardConfig.Packs then
        for name in pairs(CardConfig.Packs) do table.insert(packs, name) end
    end
    table.sort(packs, function(a, b)
        local pa = CardConfig and CardConfig.Packs and CardConfig.Packs[a]
                   and CardConfig.Packs[a].Page or 999
        local pb = CardConfig and CardConfig.Packs and CardConfig.Packs[b]
                   and CardConfig.Packs[b].Page or 999
        if pa == pb then return a < b end
        return pa < pb
    end)
    Lists.Packs = packs

    -- ── Voyage pack order (sequential progression: Pirate → … → Meister) ──
    -- Mirrors CardConfig.List.Packs (the canonical voyage unlock chain).
    Lists.VoyagePacks = {}
    if CardConfig and type(CardConfig.List) == "table"
       and type(CardConfig.List.Packs) == "table" then
        for _, p in ipairs(CardConfig.List.Packs) do
            table.insert(Lists.VoyagePacks, p)
        end
    else
        for _, p in ipairs(packs) do table.insert(Lists.VoyagePacks, p) end
    end

    -- ── Rarity list ordered by progression cost ──
    local rarityOrder = {}
    if PackExchange then
        local rs = {}
        for k, cfg in pairs(PackExchange) do
            if k ~= "Downgrade" and type(cfg) == "table" then
                table.insert(rs, { name = k, req = cfg.Requirement or 999 })
            end
        end
        table.sort(rs, function(a, b) return a.req > b.req end)
        for _, r in ipairs(rs) do table.insert(rarityOrder, r.name) end
    end
    if #rarityOrder == 0 then
        rarityOrder = { "Gold", "Emerald", "Void", "Diamond", "Rainbow" }
    end
    Lists.Rarities = { "Regular" }
    for _, r in ipairs(rarityOrder) do table.insert(Lists.Rarities, r) end

    -- ── PacksFull: family × rarities — Pirate, Pirate Gold, Pirate Diamond... ──
    local packsFull = {}
    for _, family in ipairs(Lists.Packs) do
        table.insert(packsFull, family)                             -- Regular
        for _, rarity in ipairs(rarityOrder) do
            table.insert(packsFull, family .. " " .. rarity)        -- with rarity
        end
    end
    Lists.PacksFull = packsFull

    -- ── PacksFullWithBundles: same family/rarity order, with bundle inline ──
    -- Bundle storage key is "<Family>-<Mutation>-Bundle" (mutation always
    -- present, Regular included). Display label uses spaces.
    -- Order matches the place-priority sort: each pack is followed by its
    -- bundle of the same rarity, so the dropdown reads naturally:
    --   Pirate, Pirate Bundle, Pirate Gold, Pirate Gold Bundle, ...
    -- Used by Auto Place, Card Market, Travel Merchant.
    local packsBundles = {}
    for _, family in ipairs(Lists.Packs) do
        table.insert(packsBundles, family)                          -- Regular
        table.insert(packsBundles, family .. " Regular Bundle")     -- Regular Bundle
        for _, rarity in ipairs(rarityOrder) do
            table.insert(packsBundles, family .. " " .. rarity)              -- mutated pack
            table.insert(packsBundles, family .. " " .. rarity .. " Bundle") -- mutated bundle
        end
    end
    Lists.PacksFullWithBundles = packsBundles

    -- ── Build cards in IN-GAME ORDER ──
    -- For each Pack (sorted by .Page), iterate its List and add cards
    -- by .Layout. Result: Pirate cards (Luffy, Zoro, Nami...) → Ninja
    -- cards (Naruto, Sasuke...) → ... in the same order as the index UI.
    local cards = {}
    do
        local seen = {}
        if CardConfig and CardConfig.Packs then
            local sortedPacks = {}
            for packName, packData in pairs(CardConfig.Packs) do
                if type(packData) == "table" then
                    table.insert(sortedPacks, {
                        name = packName,
                        page = packData.Page or 999,
                        data = packData,
                    })
                end
            end
            table.sort(sortedPacks, function(a, b)
                if a.page == b.page then return a.name < b.name end
                return a.page < b.page
            end)

            for _, pack in ipairs(sortedPacks) do
                if type(pack.data.List) == "table" then
                    local entries = {}
                    for cardName, cardInfo in pairs(pack.data.List) do
                        table.insert(entries, {
                            name = cardName,
                            layout = (type(cardInfo) == "table" and cardInfo.Layout) or 9999,
                        })
                    end
                    table.sort(entries, function(a, b)
                        if a.layout == b.layout then return a.name < b.name end
                        return a.layout < b.layout
                    end)
                    for _, e in ipairs(entries) do
                        if not seen[e.name] then
                            seen[e.name] = true
                            table.insert(cards, e.name)
                        end
                    end
                end
            end
        end

        -- supplement with replica cards (handles updates / new cards)
        local owned = Data.Get("Cards")
        if type(owned) == "table" then
            for cardName in pairs(owned) do
                if not seen[cardName] then
                    seen[cardName] = true
                    table.insert(cards, cardName)
                end
            end
        end
    end
    Lists.Cards = cards   -- internal names in IN-GAME ORDER (no alpha sort)
    Lists.CardsAll = { "All" }
    for _, c in ipairs(cards) do table.insert(Lists.CardsAll, c) end

    -- ── Display labels: "Straw Hat (Luffy)" — game title + internal in parens ──
    -- ImageConfig.Names maps internal → in-game title. If no title, fallback
    -- to internal alone. This lets users search by either form.
    local imgNames = (ImageConfig and ImageConfig.Names) or {}
    Lists.CardDisplayToInternal = {}      -- {[displayLabel] = internalName}
    Lists.CardInternalToDisplay = {}      -- {[internalName] = displayLabel}

    local function buildDisplay(internal)
        local title = imgNames[internal]
        local label
        if title and title ~= "" and title ~= internal then
            label = title .. " (" .. internal .. ")"
        else
            label = internal
        end
        Lists.CardDisplayToInternal[label] = internal
        Lists.CardInternalToDisplay[internal] = label
        return label
    end

    Lists.CardsDisplay = {}
    for _, c in ipairs(cards) do
        table.insert(Lists.CardsDisplay, buildDisplay(c))
    end
    -- NO alpha sort: keep the in-game order from Lists.Cards

    Lists.CardsAllDisplay = { "All" }
    for _, lbl in ipairs(Lists.CardsDisplay) do
        table.insert(Lists.CardsAllDisplay, lbl)
    end
    Lists.CardDisplayToInternal["All"] = "All"

    local traits = {}
    if TowerConfig and TowerConfig.Traits then
        for k in pairs(TowerConfig.Traits) do table.insert(traits, k) end
    end
    table.sort(traits)
    Lists.Traits = traits

    local grades = {}
    if GradesConfig and GradesConfig.List then
        for _, g in ipairs(GradesConfig.List) do table.insert(grades, g) end
    end
    Lists.Grades = grades

    local petEggs = {}
    if PetConfig and PetConfig.Eggs then
        for k in pairs(PetConfig.Eggs) do table.insert(petEggs, k) end
    end
    table.sort(petEggs)
    Lists.PetEggs = petEggs

    local diffs = {}
    if StarTrialConfig and StarTrialConfig.Difficulties then
        for k in pairs(StarTrialConfig.Difficulties) do table.insert(diffs, k) end
    end
    table.sort(diffs)
    Lists.Difficulties = diffs

    local upgrades = {}
    if UpgradesConfig then
        for k in pairs(UpgradesConfig) do table.insert(upgrades, k) end
    end
    table.sort(upgrades)
    Lists.Upgrades = upgrades

    -- Potions: 5 categories × 3 tiers = 15 (Luck, HatchTime, MutationChance,
    -- XP, PetLuck). Totem entries live in Consumables too — filter them out
    -- since they're shop-buy items, not personal potions.
    local potions = {}
    Lists.PotionCategories = {}   -- map: category -> [{name, layout}, ...] sorted highest tier first
    if Consumables then
        for k, cfg in pairs(Consumables) do
            if not tostring(k):find("Totem") and type(cfg) == "table" then
                table.insert(potions, k)
                local cat = cfg.Category
                if cat then
                    Lists.PotionCategories[cat] = Lists.PotionCategories[cat] or {}
                    table.insert(Lists.PotionCategories[cat], {
                        name   = k,
                        layout = cfg.Layout or 0,
                    })
                end
            end
        end
    end
    -- Sort: by category, then by tier (Layout) ascending — produces
    -- Luck I, Luck II, Luck III, HatchTime I, HatchTime II, ... in dropdown.
    table.sort(potions, function(a, b)
        local ca = (Consumables[a] and Consumables[a].Category) or ""
        local cb = (Consumables[b] and Consumables[b].Category) or ""
        if ca ~= cb then return ca < cb end
        local la = (Consumables[a] and Consumables[a].Layout) or 0
        local lb = (Consumables[b] and Consumables[b].Layout) or 0
        return la < lb
    end)
    Lists.Potions = potions
    -- Inside each category, highest tier first (so apply-loop can grab the
    -- best owned tier with one walk).
    for _, list in pairs(Lists.PotionCategories) do
        table.sort(list, function(a, b) return a.layout > b.layout end)
    end

    -- Gallery: pack tiers ordered cheap→expensive (used in priorities).
    -- Built dynamically from the live GalleryConfig.FigurinePacks so game
    -- updates that add new tiers (e.g. "Eternal") are picked up without a
    -- script change. Falls back to the known set if the config is missing.
    Lists.GalleryPacks = {}
    if GalleryConfig and type(GalleryConfig.FigurinePacks) == "table" then
        for tier in pairs(GalleryConfig.FigurinePacks) do
            table.insert(Lists.GalleryPacks, tier)
        end
        table.sort(Lists.GalleryPacks, function(a, b)
            local pa = (GalleryConfig.FigurinePacks[a] or {}).Price or 0
            local pb = (GalleryConfig.FigurinePacks[b] or {}).Price or 0
            if pa ~= pb then return pa < pb end
            return a < b
        end)
    end
    if #Lists.GalleryPacks == 0 then
        Lists.GalleryPacks = { "Basic", "Common", "Uncommon", "Rare", "Epic", "Legendary", "Eternal" }
    end
    -- Gallery upgrade kinds (per-card buffs)
    Lists.GalleryUpgradeKinds = { "Cash", "XP", "Health", "Damage" }
    -- Gallery figurines: list every figurine sorted by Multiplier ASC (so
    -- "Highest first" picks Sun God etc.)
    Lists.GalleryFigurines = {}
    if GalleryConfig and type(GalleryConfig.Figurines) == "table" then
        for name in pairs(GalleryConfig.Figurines) do
            table.insert(Lists.GalleryFigurines, name)
        end
        table.sort(Lists.GalleryFigurines, function(a, b)
            local ma = (GalleryConfig.Figurines[a] or {}).Multiplier or 0
            local mb = (GalleryConfig.Figurines[b] or {}).Multiplier or 0
            if ma ~= mb then return ma < mb end
            return a < b
        end)
    end
end

-- // 10. LIBRARY SETUP
local _macSrc, _macErr = httpGet("https://raw.githubusercontent.com/dvorfkar6-lab/uis/refs/heads/main/Mac")
if not _macSrc then
    warn("[ACC_HUB] failed to fetch MacLib: " .. tostring(_macErr))
    getgenv()._ACCRunning = false
    return
end
local MacLib = loadstring(_macSrc)()
local Window = MacLib:Window({
    Title    = "Anime Card Collection | ApelHub",
    Subtitle = "",
    Size     = UDim2.fromOffset(865, 650),
    DragStyle = 2,
    Keybind  = Enum.KeyCode.LeftControl,
    AcrylicBlur = false,
})
getgenv()._ACCUI = Window

local function Notify(text, lifetime)
    Window:Notify({ Title = "ApelHub", Description = text, Lifetime = lifetime or 3 })
end

local tabGroups = { Main = Window:TabGroup() }
local tabs = {
    AutoFarm  = tabGroups.Main:Tab({ Name = "Auto Farm",  Image = "rbxassetid://10723416765" }),
    Combat    = tabGroups.Main:Tab({ Name = "Combat",     Image = "rbxassetid://10734975692" }),
    AutoClaim = tabGroups.Main:Tab({ Name = "Auto Claim", Image = "rbxassetid://10723348925" }),
    Shops     = tabGroups.Main:Tab({ Name = "Shops",      Image = "rbxassetid://10747372992" }),
    Inventory = tabGroups.Main:Tab({ Name = "Inventory",  Image = "rbxassetid://10723396225" }),
    Gallery   = tabGroups.Main:Tab({ Name = "Gallery",    Image = "rbxassetid://10747372992" }),
    Voyage    = tabGroups.Main:Tab({ Name = "Voyage",     Image = "rbxassetid://10723415903" }),
    Misc      = tabGroups.Main:Tab({ Name = "Misc",       Image = "rbxassetid://10734932295" }),
    Settings  = tabGroups.Main:Tab({ Name = "Settings",   Image = "rbxassetid://10734950309" }),
}
_ACC._tabs = tabs   -- expose for finishing init (auto-select default tab)

local sec = {
    -- Auto Farm
    AFBuyL    = tabs.AutoFarm:Section({ Side = "Left" }),
    AFOpenR   = tabs.AutoFarm:Section({ Side = "Right" }),
    AFPlaceL  = tabs.AutoFarm:Section({ Side = "Left" }),
    AFCollR   = tabs.AutoFarm:Section({ Side = "Right" }),
    -- Combat
    TowerL    = tabs.Combat:Section({ Side = "Left" }),
    STR       = tabs.Combat:Section({ Side = "Right" }),
    GradeL    = tabs.Combat:Section({ Side = "Left" }),
    RaidR     = tabs.Combat:Section({ Side = "Right" }),
    -- Auto Claim
    -- NOTE: this fork lays sections into Left/Right columns in declaration
    -- order and pairs them visually row-by-row. Auto Claim must keep 4
    -- sections (2 Left + 2 Right) to stay aligned. ManualL is the renamed
    -- ex-CodesL slot — codes UI was removed but the slot stays for layout.
    ManualL   = tabs.AutoClaim:Section({ Side = "Left" }),
    AchR      = tabs.AutoClaim:Section({ Side = "Right" }),
    RewL      = tabs.AutoClaim:Section({ Side = "Left" }),
    ExpR      = tabs.AutoClaim:Section({ Side = "Right" }),
    -- Shops
    StockL    = tabs.Shops:Section({ Side = "Left" }),
    MerR      = tabs.Shops:Section({ Side = "Right" }),
    PetL      = tabs.Shops:Section({ Side = "Left" }),
    DBR       = tabs.Shops:Section({ Side = "Right" }),
    -- Inventory
    PEL       = tabs.Inventory:Section({ Side = "Left" }),
    PetsR     = tabs.Inventory:Section({ Side = "Right" }),
    PotL      = tabs.Inventory:Section({ Side = "Left" }),
    UpgR      = tabs.Inventory:Section({ Side = "Right" }),
    RelL      = tabs.Inventory:Section({ Side = "Left" }),
    CardsR    = tabs.Inventory:Section({ Side = "Right" }),
    -- Gallery
    GalBuyL   = tabs.Gallery:Section({ Side = "Left" }),
    GalUpgR   = tabs.Gallery:Section({ Side = "Right" }),
    GalLvlL   = tabs.Gallery:Section({ Side = "Left" }),
    GalMiscR  = tabs.Gallery:Section({ Side = "Right" }),
    -- Voyage
    VoyL      = tabs.Voyage:Section({ Side = "Left" }),
    VoyR      = tabs.Voyage:Section({ Side = "Right" }),
    VoyPostL  = tabs.Voyage:Section({ Side = "Left" }),
    VoyForgeR = tabs.Voyage:Section({ Side = "Right" }),
    -- Misc
    WHR       = tabs.Misc:Section({ Side = "Right" }),
    UtilL     = tabs.Misc:Section({ Side = "Left" }),
    VisR      = tabs.Misc:Section({ Side = "Right" }),
    -- Settings
    InfoL     = tabs.Settings:Section({ Side = "Left" }),
    CtrlR     = tabs.Settings:Section({ Side = "Right" }),
}

-- helper: convert MacLib map-style multi dropdown selection to a flat boolean map
local function mapFromMulti(selected)
    local out = {}
    if type(selected) == "table" then
        for k, v in pairs(selected) do
            if v then out[k] = true end
        end
    end
    return out
end

-- helper: iterate a boolean-map dropdown selection in stable order
local function iterMap(map)
    if type(map) ~= "table" then return ipairs({}) end
    local arr = {}
    for k in pairs(map) do table.insert(arr, k) end
    table.sort(arr)
    return ipairs(arr)
end

local function mapHas(map, key)
    return type(map) == "table" and map[key] == true
end
local function mapEmpty(map)
    if type(map) ~= "table" then return true end
    for _ in pairs(map) do return false end
    return true
end

-- ── Searchable dropdown helper ──────────────────────────────────────────
-- The MacLib fork's dropdown has a built-in search field, so we don't add
-- our own. This helper adds Select All / Deselect All buttons next to a
-- multi-dropdown.
--
-- Select All uses the fork's public DropdownFunctions:UpdateSelection(arr)
-- which syncs Selected/Checkmarks/Value AND fires the dropdown Callback
-- (so our wrapper-OnChange writes through to backend state).
--
-- Deselect All can't use UpdateSelection({}) — the fork's isAnyValid check
-- rejects empty selections and stashes them as pending. So deselect goes
-- via ClearOptions + null Value + InsertOptions, which rebuilds the widget
-- with no items checked. The null between Clear and Insert is required:
-- DropdownFunctions.Value survives ClearOptions, and InsertOptions would
-- otherwise visually re-check everything from the old Value.
-- params: { Name, Options, Multi=true|false, Default, OnChange(map_or_value) }
-- flag:   string ID for MacLib.Options[flag]
local function makeSearchableDropdown(section, params, flag)
    local isMulti = params.Multi ~= false
    local stored = {}

    local dd = section:Dropdown({
        Name = params.Name,
        Multi = isMulti,
        Search = true,
        Options = params.Options,
        Default = params.Default,
        Callback = function(selected)
            if isMulti then
                stored = mapFromMulti(selected)
                params.OnChange(stored)
            else
                params.OnChange(selected)
            end
        end,
    }, flag)

    if not isMulti then return dd end

    -- Rebuild dropdown options to force MacLib to reset internal selection
    -- state. ClearOptions wipes the internal Selected list but NOT the
    -- DropdownFunctions.Value field — for a multi dropdown Value still
    -- references the old selection table. InsertOptions then restores
    -- Value visually, re-checking everything. So we must null Value out
    -- between the two calls, otherwise "Deselect All" re-selects all.
    local function rebuildOptions()
        if dd and type(dd.ClearOptions) == "function" then
            pcall(function() dd:ClearOptions() end)
            task.wait(0.05)
        end
        if dd then
            pcall(function() dd.Value = nil end)
        end
        if dd and type(dd.InsertOptions) == "function" then
            pcall(function() dd:InsertOptions(params.Options) end)
        end
    end

    section:Button({
        Name = "Select All",
        Callback = function()
            -- Public fork API: updates Selected/Checkmarks/Value AND fires
            -- our wrapper Callback (which calls params.OnChange). Without
            -- this, MacLib's internal Selected stays empty — subsequent
            -- user clicks then *add* the clicked option (since it wasn't
            -- "selected") and overwrite backend to that single item.
            if dd and type(dd.UpdateSelection) == "function"
               and params.Options and #params.Options > 0 then
                local ok = pcall(function() dd:UpdateSelection(params.Options) end)
                if ok then return end
            end
            -- Fallback: backend-only update (UI will be out of sync).
            stored = {}
            for _, n in ipairs(params.Options) do stored[n] = true end
            params.OnChange(stored)
        end,
    })

    section:Button({
        Name = "Deselect All",
        Callback = function()
            stored = {}
            rebuildOptions()    -- visually clears all checks
            params.OnChange(stored)
        end,
    })

    return dd
end

local function makeStatus(section, header)
    local p = section:Paragraph({ Header = header or "Status", Body = "Idle" })
    return function(t) if p then pcall(function() p:UpdateBody(t) end) end end
end
-- ============================================================================
-- // 11. TAB: AUTO FARM
-- ============================================================================

-- ── Auto Buy ──────────────────────────────────────────────────────────────
sec.AFBuyL:Header({ Text = "Auto Buy" })

-- AutoBuyPacks options: PacksFull + DragonBall. DragonBall spawns on the
-- conveyor as a separate "Dragon Wish Ball" model (Assets.Misc.DragonBalls.<n>)
-- with Primary Part (not MeshPart) and the model name = full conveyor ID
-- like "<plot>-<spawn>-DragonBall-<ballNum>". Conveyor loop has a dedicated
-- branch for it (matched by name pattern), keyed off this "DragonBall" entry.
-- Not added to Lists.PacksFull globally because Auto Place / Expedition /
-- Pack Exchange would mis-handle it.
local AutoBuyPacksOptions = {}
for _, n in ipairs(Lists.PacksFull) do table.insert(AutoBuyPacksOptions, n) end
table.insert(AutoBuyPacksOptions, "DragonBall")

makeSearchableDropdown(sec.AFBuyL, {
    Name = "Packs",
    Multi = true,
    Options = AutoBuyPacksOptions,
    OnChange = function(map) _ACC.SelectedBuyPacks = map end,
}, "AutoBuyPacksDropdown")

sec.AFBuyL:Toggle({
    Name = "Enable Auto Buy",
    Default = false,
    Callback = function(v) _ACC.AutoBuyEnabled = v end,
}, "AutoBuyToggle")

-- ── Auto Open ─────────────────────────────────────────────────────────────
sec.AFOpenR:Header({ Text = "Auto Open" })

sec.AFOpenR:Toggle({
    Name = "Enable Auto Open",
    Default = false,
    Callback = function(v) _ACC.AutoOpenEnabled = v end,
}, "AutoOpenToggle")

sec.AFOpenR:Toggle({
    Name = "Skip opening animation",
    Default = false,
    Callback = function(v)
        _ACC.SkipOpenAnim = v
        local CardOpening = UIClient and UIClient:FindFirstChild("CardHandler")
            and UIClient.CardHandler:FindFirstChild("CardOpening")
        CardOpening = CardOpening and tryRequire(CardOpening)
        if not CardOpening then return end
        if v then
            hookPatch(CardOpening, "OpenCard",   function() end)
            hookPatch(CardOpening, "OpenBundle", function() end)
        else
            hookRestore(CardOpening, "OpenCard")
            hookRestore(CardOpening, "OpenBundle")
        end
    end,
}, "SkipOpenAnimToggle")

sec.AFOpenR:Toggle({
    Name = "Use ProximityPrompt (recommended)",
    Default = true,
    Callback = function(v) _ACC.OpenViaPrompt = v end,
}, "OpenViaPromptToggle")

-- ── Auto Place ────────────────────────────────────────────────────────────
sec.AFPlaceL:Header({ Text = "Auto Place" })

-- live counter — Bundle packs count as 5 (per CardConfig.GetNumPacksPlaced)
local placeCounter = sec.AFPlaceL:Paragraph({
    Header = "Placement slots",
    Body   = "Loading...",
})
-- Authoritative weighted count: the update removed info.Category, so manual
-- (Category=="Bundle" and 5 or 1) miscounts. Use the game's own function, which
-- iterates the PacksPlaced TABLE (errors on bad arg → pcall). Fallback: 1/entry.
local function numPacksPlaced(pp)
    pp = pp or (Data.Get("PacksPlaced") or {})
    local ok, n = pcall(function() return CardConfig and CardConfig.GetNumPacksPlaced and CardConfig.GetNumPacksPlaced(pp) end)
    if ok and type(n) == "number" then return n end
    local used = 0; for _ in pairs(pp) do used = used + 1 end; return used   -- fallback: 1 per entry (Category weighting is gone)
end
local function refreshPlaceCounter()
    local replica = Data.GetReplica()
    local txt
    if not (replica and replica.Data) then
        txt = "waiting for data..."
    else
        local maxP = replica.Data.MaxPlacements or 25
        local used = numPacksPlaced(replica.Data.PacksPlaced)
        txt = ("%d / %d (%d free)"):format(used, maxP, maxP - used)
    end
    if placeCounter then
        -- try every method this MacLib fork might expose
        pcall(function() placeCounter:UpdateBody(txt)  end)
        pcall(function() placeCounter:SetBody(txt)     end)
        pcall(function() placeCounter:SetDescription(txt) end)
        pcall(function() placeCounter:UpdateDescription(txt) end)
    end
end

-- Initial paint; live updates come from the replica OnChange hooks below.
refreshPlaceCounter()
-- Madwork OnChange does NOT fire on sub-key updates, so poll to keep the
-- counter live (the OnChange("PacksPlaced") hook below catches whole-table swaps only).
task.spawn(function() while getgenv()._ACCRunning do task.wait(2); refreshPlaceCounter() end end)

local replica0 = Data.GetReplica()
if replica0 and replica0.OnChange then
    pcall(function()
        local c1 = replica0:OnChange("PacksPlaced",   refreshPlaceCounter)
        local c2 = replica0:OnChange("MaxPlacements", refreshPlaceCounter)
        if c1 then table.insert(getgenv()._ACCHooks, c1) end
        if c2 then table.insert(getgenv()._ACCHooks, c2) end
    end)
end

makeSearchableDropdown(sec.AFPlaceL, {
    Name = "Packs (incl. Bundles)",
    Multi = true,
    Options = Lists.PacksFullWithBundles,
    OnChange = function(map) _ACC.SelectedPlacePacks = map end,
}, "AutoPlacePacksDropdown")

sec.AFPlaceL:Toggle({
    Name = "Enable Auto Place",
    Default = false,
    Callback = function(v) _ACC.AutoPlaceEnabled = v end,
}, "AutoPlaceToggle")

sec.AFPlaceL:Slider({
    Name = "Placement cap — total used slots (anti-lag)",
    Default = 50,
    Minimum = 10,
    Maximum = 60,
    DisplayMethod = "Value",
    Precision = 0,
    Callback = function(v) _ACC.SinglePlaceCap = math.floor(tonumber(v) or 50) end,
}, "SinglePlaceCapSlider")

sec.AFPlaceL:Toggle({
    Name = "Only place when owned > 1 (anti-phantom)",
    Default = true,
    Callback = function(v) _ACC.PlaceSkipSingles = v end,
}, "PlaceSkipSinglesToggle")

-- ── Auto Collect ──────────────────────────────────────────────────────────
sec.AFCollR:Header({ Text = "Auto Collect" })

sec.AFCollR:Toggle({
    Name = "Auto Collect cash (cycles all pages)",
    Default = false,
    Callback = function(v) _ACC.AutoCollectEnabled = v end,
}, "AutoCollectToggle")

sec.AFCollR:Toggle({
    Name = "Spam CollectAll (gamepass)",
    Default = false,
    Callback = function(v) _ACC.CollectAllEnabled = v end,
}, "CollectAllToggle")

sec.AFCollR:Divider()
sec.AFCollR:Header({ Text = "Auto Loot (map drops)" })

sec.AFCollR:Toggle({
    Name = "Auto pickup tokens / potions / DBs",
    Default = false,
    Callback = function(v) _ACC.AutoLoot = v end,
}, "AutoLootToggle")

sec.AFCollR:Divider()

sec.AFCollR:Button({
    Name = "Toggle Belt Speed (gamepass)",
    Callback = function()
        Net.FireRL(R.Card, "Card:ToggleBeltSpeed", 5, "ToggleBeltSpeed")
        Notify("Sent ToggleBeltSpeed")
    end,
})

sec.AFCollR:Button({
    Name = "Toggle Auto Collect (gamepass)",
    Callback = function()
        Net.FireRL(R.Card, "Card:ToggleAutoCollect", 5, "ToggleAutoCollect")
        Notify("Sent ToggleAutoCollect")
    end,
})

sec.AFCollR:Button({
    Name = "Claim Reward",
    Callback = function() Net.Fire(R.Card, "ClaimReward") Notify("Sent ClaimReward") end,
})
-- ============================================================================
-- // 12. TAB: COMBAT
-- ============================================================================
local TowerHandler     = UIClient and tryRequire(UIClient:FindFirstChild("TowerHandler"))
local StarTrialHandler = UIClient and tryRequire(UIClient:FindFirstChild("StarTrialHandler"))

-- ── Tower ─────────────────────────────────────────────────────────────────
sec.TowerL:Header({ Text = "Tower" })

sec.TowerL:Toggle({
    Name = "Auto Equip Best & Start",
    Default = false,
    Callback = function(v) _ACC.TowerAutoStart = v end,
}, "TowerAutoStartToggle")

sec.TowerL:Toggle({
    Name = "Hide Battle (skip animations)",
    Default = false,
    Callback = function(v) _ACC.HideBattle = v end,
}, "HideBattleToggle")

sec.TowerL:Divider()
sec.TowerL:Header({ Text = "Trait Roll" })

_ACC.SetTraitStatus = makeStatus(sec.TowerL)

makeSearchableDropdown(sec.TowerL, {
    Name = "Cards",
    Multi = true,
    Options = Lists.CardsAllDisplay,
    OnChange = function(map)
        local internalMap = {}
        for displayLabel in pairs(map) do
            local internal = Lists.CardDisplayToInternal[displayLabel] or displayLabel
            internalMap[internal] = true
        end
        _ACC.SelectedTraitCards = internalMap
    end,
}, "TraitCardsDropdown")

makeSearchableDropdown(sec.TowerL, {
    Name = "Wanted Traits",
    Multi = true,
    Options = Lists.Traits,
    OnChange = function(map) _ACC.SelectedWantedTraits = map end,
}, "WantedTraitsDropdown")

sec.TowerL:Toggle({
    Name = "Auto Trait Roll",
    Default = false,
    Callback = function(v) _ACC.AutoTrait = v end,
}, "AutoTraitToggle")
sec.TowerL:Toggle({
    Name = "Roll from end (last → first)",
    Default = false,
    Callback = function(v) _ACC.TraitRollReverse = v end,
}, "TraitRollReverseToggle")

sec.TowerL:Divider()
sec.TowerL:Header({ Text = "Armor Roll" })

_ACC.SetArmorStatus = makeStatus(sec.TowerL)

-- Materials ordered best-to-worst (Diamond is rarest/strongest, Bronze cheapest).
-- User picks which to use; loop walks them in this priority order — when one
-- runs out, falls through to next.
makeSearchableDropdown(sec.TowerL, {
    Name = "Materials (best→worst)",
    Multi = true,
    Options = { "Diamond", "Platinum", "Gold", "Silver", "Bronze" },
    OnChange = function(map) _ACC.ArmorMaterials = map end,
}, "ArmorMaterialsDropdown")

makeSearchableDropdown(sec.TowerL, {
    Name = "Wanted Grades",
    Multi = true,
    Options = Lists.Grades,
    OnChange = function(map) _ACC.WantedArmorGrades = map end,
}, "ArmorGradesDropdown")

sec.TowerL:Toggle({
    Name = "Auto Armor Roll",
    Default = false,
    Callback = function(v) _ACC.AutoArmor = v end,
}, "AutoArmorToggle")

-- ── Star Trial ────────────────────────────────────────────────────────────
sec.STR:Header({ Text = "Star Trial" })

makeSearchableDropdown(sec.STR, {
    Name = "Card",
    Multi = false,
    Options = Lists.CardsDisplay,
    Default = Lists.CardsDisplay[1] or nil,
    OnChange = function(displayLabel)
        _ACC.STSelectedCard = Lists.CardDisplayToInternal[displayLabel] or displayLabel
    end,
}, "STCardDropdown")

sec.STR:Dropdown({
    Name = "Difficulty",
    Options = Lists.Difficulties,
    Default = Lists.Difficulties[1] or nil,
    Callback = function(v) _ACC.STSelectedDifficulty = v end,
}, "STDifficultyDropdown")

sec.STR:Toggle({
    Name = "Auto Start Trial",
    Default = false,
    Callback = function(v) _ACC.STAutoStart = v end,
}, "STAutoStartToggle")

sec.STR:Toggle({
    Name = "Auto Attack (clear all)",
    Default = false,
    Callback = function(v) _ACC.STAutoAttack = v end,
}, "STAutoAttackToggle")

sec.STR:Divider()
sec.STR:Header({ Text = "Star Upgrades (auto-buy with Star Tokens)" })
sec.STR:Toggle({
    Name = "Damage",
    Default = false,
    Callback = function(v) _ACC.STUpgDamage = v end,
}, "STUpgDamageToggle")
sec.STR:Toggle({
    Name = "Health",
    Default = false,
    Callback = function(v) _ACC.STUpgHealth = v end,
}, "STUpgHealthToggle")
sec.STR:Toggle({
    Name = "Battle Speed",
    Default = false,
    Callback = function(v) _ACC.STUpgBattleSpeed = v end,
}, "STUpgBattleSpeedToggle")
sec.STR:Toggle({
    Name = "Ticket Chance",
    Default = false,
    Callback = function(v) _ACC.STUpgTicketChance = v end,
}, "STUpgTicketChanceToggle")

sec.STR:Toggle({
    Name = "Hide attack animations",
    Default = false,
    Callback = function(v)
        _ACC.STHideAnim = v
        if not StarTrialHandler then return end
        if v then
            if StarTrialHandler.StartFight then
                hookPatch(StarTrialHandler, "StartFight", function(p1, p2)
                    safe(function()
                        if p1 and StarTrialHandler.InitPlayer then
                            StarTrialHandler.InitPlayer(p1.Card, p1.Health, p1.Damage)
                        end
                        if p2 and StarTrialHandler.InitEnemy then
                            StarTrialHandler.InitEnemy(p2.Card, p2.Health, p2.Damage)
                        end
                        local blackout = PlayerGui:FindFirstChild("UIBlackout")
                        if blackout and blackout:FindFirstChild("Blackout") then
                            blackout.Blackout.BackgroundTransparency = 1
                        end
                    end)
                end)
            end
            if StarTrialHandler.TeleportToStartTrial then
                hookPatch(StarTrialHandler, "TeleportToStartTrial", function() end)
            end
            if StarTrialHandler.EndTrial then
                hookPatch(StarTrialHandler, "EndTrial", function()
                    StarTrialHandler.InTrial   = false
                    StarTrialHandler.StartTime = nil
                    if StarTrialHandler.ShowPlayers then safe(StarTrialHandler.ShowPlayers) end
                end)
            end
        else
            hookRestore(StarTrialHandler, "StartFight")
            hookRestore(StarTrialHandler, "TeleportToStartTrial")
            hookRestore(StarTrialHandler, "EndTrial")
        end
    end,
}, "STHideAnimToggle")

sec.STR:Divider()
sec.STR:Header({ Text = "Auto Star Evolve" })

_ACC.SetStarEvolveStatus = makeStatus(sec.STR)

makeSearchableDropdown(sec.STR, {
    Name = "Cards to evolve",
    Multi = true,
    Options = Lists.CardsDisplay,
    OnChange = function(map)
        local internalMap = {}
        for displayLabel in pairs(map) do
            local internal = Lists.CardDisplayToInternal[displayLabel] or displayLabel
            internalMap[internal] = true
        end
        _ACC.StarEvolveCards = internalMap
    end,
}, "StarEvolveCardsDropdown")

sec.STR:Toggle({
    Name = "Auto Evolve (runs trials & evolves)",
    Default = false,
    Callback = function(v) _ACC.AutoStarEvolve = v end,
}, "AutoStarEvolveToggle")

sec.STR:Divider()
sec.STR:Button({ Name = "Send AFK ON",  Callback = function() Net.Fire(R.StarTrial, "AFK", true) end })
sec.STR:Button({ Name = "Send AFK OFF", Callback = function() Net.Fire(R.StarTrial, "AFK", false) end })
sec.STR:Button({ Name = "Exit Trial",   Callback = function() Net.Fire(R.StarTrial, "Exit") end })
sec.STR:Button({ Name = "Stream lobby", Callback = function() Net.Fire(R.StarTrial, "Stream") end })

-- ── Grade ─────────────────────────────────────────────────────────────────
sec.GradeL:Header({ Text = "Grade" })

_ACC.SetGradeStatus = makeStatus(sec.GradeL)

makeSearchableDropdown(sec.GradeL, {
    Name = "Cards",
    Multi = true,
    Options = Lists.CardsAllDisplay,
    OnChange = function(map)
        local internalMap = {}
        for displayLabel in pairs(map) do
            local internal = Lists.CardDisplayToInternal[displayLabel] or displayLabel
            internalMap[internal] = true
        end
        _ACC.SelectedGradeCards = internalMap
    end,
}, "GradeCardsDropdown")

makeSearchableDropdown(sec.GradeL, {
    Name = "Wanted Grades",
    Multi = true,
    Options = Lists.Grades,
    OnChange = function(map) _ACC.SelectedWantedGrades = map end,
}, "WantedGradesDropdown")

sec.GradeL:Toggle({
    Name = "Use Tokens before Cash",
    Default = true,
    Callback = function(v) _ACC.GradeUseTokensFirst = v end,
}, "GradeUseTokensFirstToggle")

sec.GradeL:Toggle({
    Name = "Auto Grade",
    Default = false,
    Callback = function(v) _ACC.AutoGrade = v end,
}, "AutoGradeToggle")
sec.GradeL:Toggle({
    Name = "Roll from end (last → first)",
    Default = false,
    Callback = function(v) _ACC.GradeRollReverse = v end,
}, "GradeRollReverseToggle")

sec.GradeL:Button({
    Name = "Exit grade UI",
    Callback = function() Net.Fire(R.Card, "ExitGrade") end,
})

-- ── Raid ──────────────────────────────────────────────────────────────────
sec.RaidR:Header({ Text = "Raid" })

_ACC.SetRaidStatus = makeStatus(sec.RaidR)

sec.RaidR:Dropdown({
    Name = "Mode",
    Options = {
        "Auto pick (max we can beat)",
        "Specific raid",
        "Grind badges (each raid 1x)",
        "Grind manga (each raid to max card layout)",
    },
    Default = "Auto pick (max we can beat)",
    Callback = function(v) _ACC.RaidMode = v end,
}, "RaidModeDropdown")

local activeRaidsList = (RaidConfig and RaidConfig.ActiveRaids) or {}
sec.RaidR:Dropdown({
    Name = "Specific raid",
    Options = activeRaidsList,
    Default = activeRaidsList[1],
    Callback = function(v) _ACC.RaidSpecific = v end,
}, "RaidSpecificDropdown")

sec.RaidR:Toggle({
    Name = "Equip Best (auto-pick top 3 per raid)",
    Default = true,
    Callback = function(v) _ACC.RaidEquipBest = v end,
}, "RaidEquipBestToggle")

sec.RaidR:Toggle({
    Name = "Auto Raid Farm",
    Default = false,
    Callback = function(v) _ACC.AutoRaid = v end,
}, "AutoRaidToggle")

sec.RaidR:Divider()
sec.RaidR:Button({ Name = "Exit Raid", Callback = function() Net.Fire(R.Raid, "Exit") end })
-- ============================================================================
-- // 13. TAB: AUTO CLAIM
-- ============================================================================
sec.ManualL:Header({ Text = "Manual" })
sec.ManualL:Button({
    Name = "Trigger ClaimReward",
    -- Single fire-and-forget claim; useful when an event drop / Robux
    -- product / login bundle is sitting unclaimed and the auto-loop is off.
    Callback = function() Net.Fire(R.Card, "ClaimReward"); Notify("Sent ClaimReward") end,
})
sec.ManualL:Button({
    Name = "Claim Daily Login",
    -- Login rewards path is unverified after the v38 update (handler missing
    -- from decompile). Best-effort.
    Callback = function() Net.Fire(R.Card, "Claim", "Login"); Notify("Sent Claim Login") end,
})
sec.ManualL:Button({
    Name = "Claim Wheelspin",
    Callback = function() Net.Fire(R.Card, "Claim", "Wheelspin"); Notify("Sent Claim Wheelspin") end,
})

sec.ManualL:Divider()
sec.ManualL:Header({ Text = "Codes" })
sec.ManualL:Input({
    Name = "Code",
    Default = "",
    Placeholder = "enter a code",
    Callback = function(v) _ACC.CodeInput = (v or ""):gsub("^%s+", ""):gsub("%s+$", "") end,
}, "CodeInput")
sec.ManualL:Button({
    Name = "Redeem code",
    Callback = function()
        local c = _ACC.CodeInput or ""
        if c == "" then Notify("Type a code first"); return end
        if not R.Codes then Notify("Codes remote not found"); return end
        pcall(function() R.Codes:FireServer(c) end)
        Notify("Sent code: " .. c)
    end,
})
sec.ManualL:Button({
    Name = "Redeem ALL (built-in list)",
    Callback = function()
        if not R.Codes then Notify("Codes remote not found"); return end
        task.spawn(function()
            local n = 0
            for _, c in ipairs(_ACC.CodeList or {}) do
                if not getgenv()._ACCRunning then break end
                pcall(function() R.Codes:FireServer(c) end)
                n = n + 1
                task.wait(0.6)   -- pace so we don't trip server anti-spam
            end
            Notify(("Sent %d codes — check in-game toasts"):format(n))
        end)
    end,
})

sec.AchR:Header({ Text = "Achievements" })
sec.AchR:Toggle({
    Name = "Auto claim achievements",
    Default = false,
    Callback = function(v) _ACC.AutoAchievements = v end,
}, "AutoAchievementsToggle")
sec.AchR:Button({
    Name = "Claim all now",
    Callback = function()
        task.spawn(function()
            local n = (_ACC._claimReadyAchievements and _ACC._claimReadyAchievements()) or 0
            Notify(("Claimed %d achievements"):format(n))
        end)
    end,
})

sec.RewL:Header({ Text = "Rewards" })
sec.RewL:Toggle({
    Name = "Auto Claim Rewards loop",
    Default = false,
    Callback = function(v) _ACC.AutoRewards = v end,
}, "AutoRewardsToggle")
sec.RewL:Button({
    Name = "Trigger ClaimReward",
    Callback = function() Net.Fire(R.Card, "ClaimReward") end,
})

-- ── Expedition (Auto Claim tab, right side) ──────────────────────────────
-- Uses Remotes.StarTrial:
--   FireServer("SendExpedition",  { Reward=packKey, Category="Pack", NPC=npc })
--   FireServer("ClaimExpedition", npc)
--   FireServer("SetSkipExpedition", npc)  ← only useful with Robux DevProduct
--
-- Cost & gating: Modules.Config.Core.ExpeditionConfig
--   Cash    = GetPackPrice(packKey, replica)
--   Tickets = GetTicketCost(packKey)            -- "StarTickets" currency
--   Time    = GetPackTime(packKey) / GetBuff("Time", TotalExpeditions)
--   Daily   = 4 + GetBuff("MoreExpeditions", TotalExpeditions)
--
-- NPC unlocks: "1" always, "2" at 50 total, "3" at 100 total, "4" via
-- gamepass GamepassValues.ExtraMarine.
sec.ExpR:Header({ Text = "Expedition" })

makeSearchableDropdown(sec.ExpR, {
    Name = "Packs to send (must be opened at least once)",
    Multi = true,
    Options = Lists.PacksFull,   -- bundles are not eligible for expeditions
    OnChange = function(map) _ACC.SelectedExpPacks = map end,
}, "ExpPacksDropdown")

makeSearchableDropdown(sec.ExpR, {
    Name = "Marines (NPCs)",
    Multi = true,
    Options = { "1", "2", "3", "4" },
    Default = { "1", "2", "3", "4" },
    OnChange = function(map) _ACC.SelectedExpNPCs = map end,
}, "ExpNPCsDropdown")

sec.ExpR:Dropdown({
    Name = "Pick strategy",
    Multi = false,
    Options = {
        "Cheapest first",            -- save cash & tickets
        "Most expensive first",      -- chase higher reward tier
        "Highest mutation first",    -- prefer Diamond/Rainbow over Regular
    },
    Default = _ACC.ExpStrategy,
    Callback = function(v) _ACC.ExpStrategy = v end,
}, "ExpStrategyDropdown")

sec.ExpR:Toggle({
    Name = "Auto send (when NPC free + resources available)",
    Default = false,
    Callback = function(v) _ACC.AutoExpSend = v end,
}, "AutoExpSendToggle")
sec.ExpR:Toggle({
    Name = "Auto claim (when expedition done)",
    Default = false,
    Callback = function(v) _ACC.AutoExpClaim = v end,
}, "AutoExpClaimToggle")
sec.ExpR:Toggle({
    Name = "Respect daily limit",
    Default = true,
    Callback = function(v) _ACC.RespectExpDaily = v end,
}, "RespectExpDailyToggle")

sec.ExpR:Button({
    Name = "Send to all free Marines now",
    Callback = function() _ACC._ExpForceSend = true end,
})
sec.ExpR:Button({
    Name = "Claim all ready expeditions",
    Callback = function() _ACC._ExpForceClaim = true end,
})

-- ============================================================================
-- // 14. TAB: SHOPS
-- ============================================================================
-- Stock: GetStock:InvokeServer() returns
--   { ["Pack-Mutation"] = {Layout=N, Amount=N}, DragonBall = bool }
-- Price = CardConfig.Packs[family].Price
--       * (Mutations[mut].PriceMultiplier or 1)
--       * ShopPriceReduction (0.6),  floored.
-- Game's "BuyAll" remote action is broken — we implement our own by spamming
-- "Buy" per id while we have cash.
--
-- Merchant: GetMerchantItems:InvokeServer() returns array
--   { {Item, Category, Price, Token}, ... }   Category ∈ Packs|Bundle|Consumables|Totem
--   Price  = cash cost (number) for non-Totem; for Totem it's a {pack=count} table.
--   Token  = TravelTokens cost.
--   Buy: Merchant:FireServer("Buy", item)         -- pays Cash (or pack-trade for Totem)
--        Merchant:FireServer("Buy", item, "Token") -- pays TravelTokens

-- ── Snapshot helpers ─────────────────────────────────────────────────────
local Shops = {}
Shops.StockSnap     = {}   -- array of {id, family, mut, price}
Shops.MerchantSnap  = {}   -- array of {item, category, cashPrice, tokenPrice}
-- Short-TTL cache: many loops/buttons/the webhook ask for the same snapshot in
-- the same tick. os.clock() timestamp of the last SUCCESSFUL server fetch; a
-- refresh re-invokes only if older than SHOP_SNAP_TTL (or force=true).
Shops.StockSnapAt    = 0
Shops.MerchantSnapAt = 0
local SHOP_SNAP_TTL  = 2.5

local function stockPrice(family, mut)
    if not (CardConfig and CardConfig.Packs and CardConfig.Packs[family]) then return nil end
    local base = CardConfig.Packs[family].Price
    if not base then return nil end
    local mul = 1
    if mut and Mutations and Mutations[mut] and Mutations[mut].PriceMultiplier then
        mul = Mutations[mut].PriceMultiplier
    end
    return math.floor(base * mul * ShopPriceReduction)
end

-- Refresh = pull current stock from server. Result is a map id -> entry where
-- entry.price is the cash cost (computed locally).
-- DragonBall is special: server returns a boolean (true = already purchased
-- this cycle). When it's absent/false, the ball is buyable — but its price
-- isn't in CardConfig.Packs, so we leave price=nil and the auto-buy loop
-- fires once without a client-side cash check (server validates).
function Shops.RefreshStock(force)
    if not force and Shops.StockSnapAt > 0
       and (os.clock() - Shops.StockSnapAt) < SHOP_SNAP_TTL then
        return Shops.StockSnap
    end
    Shops.StockSnap = {}
    if not R.GetStock then return Shops.StockSnap end
    local items = Net.Invoke(R.GetStock)
    if type(items) ~= "table" then return Shops.StockSnap end
    for id, info in pairs(items) do
        if id == "DragonBall" then
            -- v44: GetStock().DragonBall == true  → ball is IN STOCK (buyable).
            -- "already purchased" is tracked separately in Data.StockItems
            -- .DragonBall and DragonBalls["7"]. The old logic was inverted
            -- (added it when NOT in stock), so it never bought the real one.
            local stockItems = Data.Get("StockItems") or {}
            local owned7     = (Data.Get("DragonBalls") or {})["7"] == true
            local alreadyBought = stockItems.DragonBall == true or owned7
            if info == true and not alreadyBought then
                table.insert(Shops.StockSnap, {
                    id = "DragonBall",
                    family = "DragonBall",
                    mut = nil,
                    price = nil,
                    amount = 1,
                })
            end
        elseif type(info) == "table" then
            local family, mut = unpack(tostring(id):split("-"))
            local price = stockPrice(family, mut)
            table.insert(Shops.StockSnap, {
                id = tostring(id),
                family = family,
                mut = mut,
                price = price,
                amount = info.Amount,
            })
        end
    end
    Shops.StockSnapAt = os.clock()
    return Shops.StockSnap
end

-- Merchant item entry: {item, category, cashPrice (number|nil),
--                       tokenPrice (number|nil), rawPrice (table|nil for Totem)}
function Shops.RefreshMerchant(force)
    if not force and Shops.MerchantSnapAt > 0
       and (os.clock() - Shops.MerchantSnapAt) < SHOP_SNAP_TTL then
        return Shops.MerchantSnap
    end
    Shops.MerchantSnap = {}
    if not R.GetMerchantItems then return Shops.MerchantSnap end
    local items = Net.Invoke(R.GetMerchantItems)
    if type(items) ~= "table" then return Shops.MerchantSnap end
    for _, info in ipairs(items) do
        if type(info) == "table" and info.Item then
            table.insert(Shops.MerchantSnap, {
                item       = info.Item,
                category   = info.Category,
                cashPrice  = (type(info.Price) == "number") and info.Price or nil,
                tokenPrice = (type(info.Token) == "number") and info.Token or nil,
                rawPrice   = info.Price,  -- keep table form for Totem
            })
        end
    end
    Shops.MerchantSnapAt = os.clock()
    return Shops.MerchantSnap
end

-- ── Build static option lists (every item that could ever appear in shops) ──
-- Card Market (Stock): all Pack-Mutation combos + DragonBall.
-- Display uses spaces, server uses dashes; convert with gsub(" ", "-").
local function buildStockOptions()
    local out = {}
    for _, label in ipairs(Lists.PacksFull) do
        table.insert(out, label)
    end
    table.insert(out, "DragonBall")
    return out
end
local function stockLabelToId(label)
    if label == "DragonBall" then return "DragonBall" end
    return tostring(label):gsub(" ", "-")
end

-- Travel Merchant: all packs + bundles (interleaved) + all consumables + 3 totem tiers.
-- Reuses Lists.PacksFullWithBundles so dropdown order matches Auto Place exactly.
local function buildMerchantOptions()
    local out = {}
    for _, label in ipairs(Lists.PacksFullWithBundles) do
        table.insert(out, label)
    end
    for _, name in ipairs(Lists.Potions or {}) do
        table.insert(out, name)
    end
    -- Totem tiers (3 known from ImageConfig.Totems)
    table.insert(out, "Totem1")
    table.insert(out, "Totem2")
    table.insert(out, "Totem3")
    return out
end
local function merchantLabelToItem(label)
    return tostring(label):gsub(" ", "-")
end

-- Initial snapshot
Shops.RefreshStock()
Shops.RefreshMerchant()

-- ── Card Market UI (was: Stock) ──────────────────────────────────────────
sec.StockL:Header({ Text = "Card Market" })
sec.StockL:Paragraph({
    Header = "Whitelist mode",
    Body = "Pick everything you'd ever want to auto-buy. The script polls the market every few seconds and buys whatever you've selected, IF it's currently in stock and you have enough Cash.",
})

makeSearchableDropdown(sec.StockL, {
    Name = "Allow-list (auto-buy when in stock)",
    Multi = true,
    Options = buildStockOptions(),
    OnChange = function(map)
        local out = {}
        for label in pairs(map) do
            out[stockLabelToId(label)] = true
        end
        _ACC.SelectedStockItems = out
    end,
}, "StockItemsDropdown")

sec.StockL:Toggle({
    Name = "Auto Buy Card Market (Cash)",
    Default = false,
    Callback = function(v) _ACC.AutoStock = v end,
}, "AutoStockToggle")

-- Shared stock-buy loop. `filter` is a predicate over the snapshot entry
-- (or nil = buy everything in stock). Force-refreshes the snapshot, sends
-- Buy requests while Cash allows, and returns the number of requests sent.
local function buyStock(filter)
    Shops.RefreshStock(true)
    local n = 0
    for _, e in ipairs(Shops.StockSnap) do
        if e.price and (filter == nil or filter(e)) then
            local amt = tonumber(e.amount) or 1
            while amt > 0 and (Data.Get("Cash") or 0) >= e.price do
                Net.Fire(R.Stock, "Buy", e.id)
                n = n + 1
                amt = amt - 1
                task.wait(0.25)
            end
        end
    end
    return n
end

sec.StockL:Button({
    Name = "Buy Selected Now",
    Callback = function()
        if mapEmpty(_ACC.SelectedStockItems) then
            Notify("Nothing selected"); return
        end
        local n = buyStock(function(e) return _ACC.SelectedStockItems[e.id] end)
        Notify("Sent " .. n .. " buy requests")
    end,
})

sec.StockL:Button({
    Name = "Buy ALL in stock now (custom — fixes BuyAll bug)",
    Callback = function()
        local n = buyStock(nil)
        Notify("Bought " .. n .. " items")
    end,
})

-- ── Travel Merchant UI ────────────────────────────────────────────────────
sec.MerR:Header({ Text = "Travel Merchant" })
sec.MerR:Paragraph({
    Header = "Whitelist mode",
    Body = "Pick everything you'd ever want to auto-buy. The script polls the merchant every few seconds and buys what's selected. Default payment: Trade (Cash/packs) first, fall back to TravelTokens.",
})

makeSearchableDropdown(sec.MerR, {
    Name = "Allow-list (auto-buy when offered)",
    Multi = true,
    Options = buildMerchantOptions(),
    OnChange = function(map)
        local out = {}
        for label in pairs(map) do
            out[merchantLabelToItem(label)] = true
        end
        _ACC.SelectedMerchantItems = out
    end,
}, "MerchantItemsDropdown")

sec.MerR:Dropdown({
    Name = "Payment priority",
    Multi = false,
    Options = {
        "Trade -> Tokens",   -- (default) Cash / pack-trade first, then TravelTokens
        "Tokens -> Trade",
        "Trade only",
        "Tokens only",
    },
    Default = _ACC.MerchantPaymentMode,
    Callback = function(v) _ACC.MerchantPaymentMode = v end,
}, "MerchantPayModeDropdown")

-- Returns true if a buy was sent. Honors payment-mode preference.
-- "Trade" = Merchant:FireServer("Buy", item)            — uses Cash for Pack/Bundle/Consumables,
--                                                          consumes packs for Totem
-- "Tokens" = Merchant:FireServer("Buy", item, "Token")  — uses TravelTokens
local function buyMerchantItem(entry)
    local mode = _ACC.MerchantPaymentMode or "Trade -> Tokens"
    local cash   = Data.Get("Cash")        or 0
    local tokens = Data.Get("TravelTokens") or 0
    local hasCash   = entry.cashPrice  and cash   >= entry.cashPrice
    local hasTokens = entry.tokenPrice and tokens >= entry.tokenPrice
    -- Totem trade path: cashPrice is nil; server validates pack inventory.
    -- We can't pre-check pack count without parsing rawPrice, so we let it through
    -- when "Trade" is preferred and assume server-side validation handles it.
    local function logBuy(via, price)
        table.insert(_ACC._merchantBuyQueue, {
            item = entry.item, category = entry.category, price = price, via = via,
        })
    end
    local function tryTrade()
        if entry.category == "Totem" and not entry.cashPrice then
            Net.Fire(R.Merchant, "Buy", entry.item); logBuy("Trade", nil); return true
        end
        if hasCash then
            Net.Fire(R.Merchant, "Buy", entry.item); logBuy("Cash", entry.cashPrice); return true
        end
        return false
    end
    local function tryTokens()
        if hasTokens then
            Net.Fire(R.Merchant, "Buy", entry.item, "Token"); logBuy("Tokens", entry.tokenPrice); return true
        end
        return false
    end
    if mode == "Trade -> Tokens" then
        if tryTrade()  then return true end
        if tryTokens() then return true end
    elseif mode == "Tokens -> Trade" then
        if tryTokens() then return true end
        if tryTrade()  then return true end
    elseif mode == "Trade only" then
        return tryTrade()
    elseif mode == "Tokens only" then
        return tryTokens()
    end
    return false
end

sec.MerR:Toggle({
    Name = "Auto Buy Travel Merchant",
    Default = false,
    Callback = function(v) _ACC.AutoMerchant = v end,
}, "AutoMerchantToggle")

-- Shared merchant-buy loop. `filter` is a predicate over the snapshot entry
-- (or nil = buy everything offered). Force-refreshes the snapshot, runs each
-- eligible entry through buyMerchantItem (honoring payment priority), and
-- returns the number of buys sent.
local function buyMerchant(filter)
    Shops.RefreshMerchant(true)
    local n = 0
    for _, e in ipairs(Shops.MerchantSnap) do
        if filter == nil or filter(e) then
            if buyMerchantItem(e) then
                n = n + 1
                task.wait(0.3)
            end
        end
    end
    return n
end

sec.MerR:Button({
    Name = "Buy Selected Now",
    Callback = function()
        if mapEmpty(_ACC.SelectedMerchantItems) then
            Notify("Nothing selected"); return
        end
        local n = buyMerchant(function(e) return _ACC.SelectedMerchantItems[e.item] end)
        Notify("Sent " .. n .. " buy requests")
    end,
})

sec.MerR:Button({
    Name = "Buy ALL offered (using payment priority)",
    Callback = function()
        local n = buyMerchant(nil)
        Notify("Bought " .. n .. " items")
    end,
})

sec.PetL:Header({ Text = "Pet Packs" })
makeSearchableDropdown(sec.PetL, {
    Name = "Eggs",
    Multi = true,
    Options = Lists.PetEggs,
    OnChange = function(map) _ACC.SelectedPetEggs = map end,
}, "PetEggsDropdown")
sec.PetL:Toggle({
    Name = "Auto Roll x1",
    Default = false,
    Callback = function(v) _ACC.PetRoll1 = v end,
}, "PetRoll1Toggle")
sec.PetL:Toggle({
    Name = "Auto Roll x5",
    Default = false,
    Callback = function(v) _ACC.PetRoll5 = v end,
}, "PetRoll5Toggle")
sec.PetL:Button({
    Name = "Show Roll toggle",
    Callback = function() Net.Fire(R.Pet, "ShowRoll") end,
})

-- ── Auto Pet Quests ───────────────────────────────────────────────────────
-- Pet quests have NO claim button — the server auto-grants Pet Tokens on
-- completion. They're done by Place/Open/Craft/Tower actions, so this just
-- drives the matching auto-engines for any incomplete quest and idles when
-- all 10 are done (re-arming every 3h reset). Reward is collected automatically.
sec.PetL:Divider()
sec.PetL:Header({ Text = "Auto Pet Quests" })
local petQuestStatus = sec.PetL:Paragraph({ Header = "Progress", Body = "Off" })
function _ACC.SetPetQuestStatus(t)
    if petQuestStatus then pcall(function() petQuestStatus:UpdateBody(t) end) end
end
sec.PetL:Dropdown({
    Name = "Mode",
    Multi = false,
    Options = { "Smart", "Zero-config" },
    Default = _ACC.PetQuestMode,
    Callback = function(v) if type(v) == "string" then _ACC.PetQuestMode = v end end,
}, "PetQuestModeDropdown")
sec.PetL:Toggle({
    Name = "Auto-complete Pet Quests",
    Default = false,
    Callback = function(v) _ACC.AutoPetQuests = v end,
}, "AutoPetQuestsToggle")
sec.PetL:Label({ Text = "Smart = uses YOUR pack/potion picks. Zero-config = auto-picks (place/open all owned, craft any). Tower & mutation-pack quests need owned packs / enough power." })

sec.DBR:Header({ Text = "Dragon Ball" })
sec.DBR:Button({
    Name = "Buy DragonBall (one-time)",
    -- "Buy DragonBall" goes through the Stock remote, not the DragonBall one
    -- (verified in StockHandler decompile: v_u_9.Stock:FireServer("Buy", "DragonBall")).
    Callback = function() Net.Fire(R.Stock, "Buy", "DragonBall") end,
})
-- DragonBallHandler.MakeWish (decompile L37028-37046) requires:
--   DragonBall:FireServer("Use", wishType[, extraArg])
-- where extraArg is needed only for "PetMutation" (the pet name to mutate).
-- Server enforces 24h cooldown via DragonBallTime attribute.
sec.DBR:Dropdown({
    Name = "Wish type (when 7 balls collected)",
    Multi = false,
    Options = { "Cash", "GradeTokens", "PetTokens", "TraitTokens", "Card", "RainbowCard", "PetMutation" },
    Default = "Cash",
    Callback = function(v) _ACC.DBWishType = v end,
}, "DBWishTypeDropdown")
sec.DBR:Toggle({
    Name = "Auto collect DB events + auto-wish when full set",
    Default = false,
    Callback = function(v) _ACC.DragonBallAuto = v end,
}, "DBAutoToggle")
-- ============================================================================
-- // 15. TAB: INVENTORY
-- ============================================================================
sec.PEL:Header({ Text = "Pack Exchange" })
sec.PEL:Dropdown({
    Name = "Method",
    Options = { "Upgrade", "Downgrade", "Bundle", "Unbundle" },
    Default = "Upgrade",
    Callback = function(v) _ACC.PEMethod = v end,
}, "PEMethodDropdown")
makeSearchableDropdown(sec.PEL, {
    Name = "Packs",
    Multi = true,
    Options = Lists.Packs,
    OnChange = function(map) _ACC.PESelectedPacks = map end,
}, "PEPacksDropdown")
makeSearchableDropdown(sec.PEL, {
    Name = "Rarity (from / to bundle) — multi",
    Multi = true,
    Options = Lists.Rarities,
    Default = { "Regular" },
    OnChange = function(map) _ACC.PEFromRarities = map end,
}, "PEFromDropdown")
sec.PEL:Dropdown({
    Name = "Bundle/Unbundle batch",
    Options = { "1x", "10x", "100x" },
    Default = "1x",
    Callback = function(v) _ACC.PEBatch = v end,
}, "PEBatchDropdown")
sec.PEL:Toggle({
    Name = "Run Pack Exchange",
    Default = false,
    Callback = function(v) _ACC.PEEnabled = v end,
}, "PEEnabledToggle")

sec.PetsR:Header({ Text = "Pets" })
sec.PetsR:Button({ Name = "Equip Best",   Callback = function() Net.Fire(R.Pet, "EquipBest") end })
sec.PetsR:Button({ Name = "Unequip All",  Callback = function() Net.Fire(R.Pet, "UnequipAll") end })
sec.PetsR:Button({
    Name = "Claim all index rewards",
    Callback = function()
        task.spawn(function()
            local petsData = Data.Get("Pets") or {}
            local claimed  = Data.Get("PetsClaimed") or {}
            local set = {}
            if type(claimed) == "table" then for _, n in ipairs(claimed) do set[n] = true end end
            local n = 0
            for petName in pairs(petsData) do
                if not getgenv()._ACCRunning then break end
                if not set[petName] then
                    Net.FireRL(R.Pet, "Pet:Claim:" .. petName, 0.3, "ClaimPet", petName)
                    n = n + 1
                    task.wait(0.25)
                end
            end
            Notify(("Claimed %d index rewards"):format(n))
        end)
    end,
})

-- Potions: craft and use are independent selections so a user can craft one
-- set of potions while draining a different one (e.g. craft Mutation,
-- drink Luck from a stockpile).
sec.PotL:Header({ Text = "Potions — Craft" })
makeSearchableDropdown(sec.PotL, {
    Name = "Potions to craft",
    Multi = true,
    Options = Lists.Potions,
    OnChange = function(map) _ACC.SelectedCraftPotions = map end,
}, "CraftPotionsDropdown")
sec.PotL:Toggle({
    Name = "Auto Craft (when affordable)",
    Default = false,
    Callback = function(v) _ACC.AutoCraftPotions = v end,
}, "AutoCraftPotionsToggle")

sec.PotL:Header({ Text = "Potions — Use" })
makeSearchableDropdown(sec.PotL, {
    Name = "Potions to use",
    Multi = true,
    Options = Lists.Potions,
    OnChange = function(map) _ACC.SelectedUsePotions = map end,
}, "UsePotionsDropdown")
sec.PotL:Toggle({
    Name = "Auto Use (drain all selected, then 5s recheck)",
    Default = false,
    Callback = function(v) _ACC.AutoUsePotions = v end,
}, "AutoUsePotionsToggle")
sec.PotL:Button({
    Name = "Apply x1 (selected)",
    Callback = function()
        task.spawn(function()
            for _, p in iterMap(_ACC.SelectedUsePotions) do
                Net.FireRL(R.Potion, "Pot:Apply:" .. p, 0.4, "Apply", p)
                task.wait(0.3)
            end
        end)
    end,
})
sec.PotL:Button({
    Name = "Apply x10",
    Callback = function()
        task.spawn(function()
            for _, p in iterMap(_ACC.SelectedUsePotions) do
                Net.FireRL(R.Potion, "Pot:Apply10:" .. p, 0.4, "Apply10", p)
                task.wait(0.3)
            end
        end)
    end,
})

sec.UpgR:Header({ Text = "Upgrades" })
makeSearchableDropdown(sec.UpgR, {
    Name = "Upgrades",
    Multi = true,
    Options = Lists.Upgrades,
    OnChange = function(map) _ACC.SelectedUpgrades = map end,
}, "UpgradesDropdown")
sec.UpgR:Toggle({
    Name = "Auto Upgrade",
    Default = false,
    Callback = function(v) _ACC.AutoUpgrade = v end,
}, "AutoUpgradeToggle")

sec.RelL:Header({ Text = "Relics" })
-- Relics are passive buffs that activate automatically once Crafted (verified
-- in RelicHandler decompile — only "Craft" action exists). The previous
-- "Apply" / "Apply10" toggles fired actions that do not exist on the Relic
-- remote, so they did nothing. Removed.
sec.RelL:Toggle({
    Name = "Auto Craft",
    Default = false,
    Callback = function(v) _ACC.RelicCraft = v end,
}, "RelicCraftToggle")

sec.CardsR:Header({ Text = "Cards" })
sec.CardsR:Button({ Name = "Equip Best (Tower)", Callback = function() Net.Fire(R.Tower, "EquipBest") end })
sec.CardsR:Button({ Name = "Unequip All packs", Callback = function() Net.Fire(R.Card, "UnequipAll") end })

-- ============================================================================
-- // 15.7 TAB: VOYAGE  (Update 48)
-- ============================================================================
-- Live-verified remotes (Voyage RemoteEvent, method-string convention):
--   Voyage:FireServer("Start",   packName)         -- begin a voyage with a pack
--   Voyage:FireServer("AFK",     bool)             -- game auto-battles + auto-rejoins after cooldown
--   Voyage:FireServer("Exit")
--   Voyage:FireServer("Equip",   posterUUID)  / ("Unequip", packName)
--   Voyage:FireServer("Smelt",   packName, {uuid,…})   -- posters → scroll (PERMANENT)
--   Voyage:FireServer("SmeltAll",packName | "All")
--   Voyage:FireServer("Forge",   packName, scrollRarity) -- 5 scrolls → random poster
--   Voyage:FireServer("Upgrade", upgradeName)
-- Battle is fully automatic: the game's VoyageHandler.Attack fires AttackDone
-- itself each round (server-driven via OnClientEvent), so Start + AFK(true) is
-- a hands-off farm. Start gate: cooldown elapsed + pack has unlocked cards +
-- previous pack reached stage StageReq (50). Voyage runs as a HUD overlay
-- (same place, no teleport). Data lives in the replica:
--   Posters[]={UUID,Buffs,Rarity,Pack,Lock} · PostersEquipped={[pack]=poster}
--   Scrolls={[rarity]=n} · VoyageTokens=n · VoyageUpgrades={[name]=lvl}
--   VoyageStages={[pack]=stage} · VoyageTime=lastVoyageTimestamp
local VoyageHelpers = {}
do
    local VHmod
    function VoyageHelpers.getVH()
        if not VHmod then VHmod = UIClient and tryRequire(UIClient:FindFirstChild("VoyageHandler")) end
        return VHmod
    end
    local function stageReq()
        return (VoyageConfig and VoyageConfig.Data and VoyageConfig.Data.StageReq) or 50
    end
    function VoyageHelpers.prevPack(pack)
        local order = Lists.VoyagePacks or {}
        for i, p in ipairs(order) do if p == pack then return order[i - 1] end end
        return nil
    end
    -- pack is voyageable when it's the first pack, or the previous pack in the
    -- chain reached StageReq (mirrors the game's own Start gate)
    function VoyageHelpers.unlocked(pack)
        local order = Lists.VoyagePacks or {}
        if not pack then return false end
        if pack == order[1] then return true end
        local prev = VoyageHelpers.prevPack(pack)
        if not prev then return false end
        local stages = Data.Get("VoyageStages") or {}
        return (tonumber(stages[prev]) or 0) >= stageReq()
    end
    function VoyageHelpers.hasCards(pack)
        if not (CardConfig and CardConfig.GetCardsInPack and CardConfig.Packs
                and CardConfig.Packs[pack]) then return true end
        local rep = Data.GetReplica()
        local cards = rep and rep.Data and rep.Data.Cards
        local ok, n = pcall(CardConfig.GetCardsInPack, cards, CardConfig.Packs[pack].List)
        if ok then return (tonumber(n) or 0) > 0 end
        return true
    end
    -- highest-stage unlocked pack with cards (deepest progress = best posters +
    -- most tokens). Ties resolve to the later pack in the chain.
    function VoyageHelpers.autoPick()
        local order  = Lists.VoyagePacks or {}
        local stages = Data.Get("VoyageStages") or {}
        local pick, pickStage = order[1], -1
        for _, p in ipairs(order) do
            if VoyageHelpers.unlocked(p) and VoyageHelpers.hasCards(p) then
                local s = tonumber(stages[p]) or 0
                if s >= pickStage then pick, pickStage = p, s end
            end
        end
        return pick
    end
    -- packs currently voyageable (unlocked + you own cards), in chain order
    function VoyageHelpers.eligiblePacks()
        local elig = {}
        for _, p in ipairs(Lists.VoyagePacks or {}) do
            if VoyageHelpers.unlocked(p) and VoyageHelpers.hasCards(p) then
                table.insert(elig, p)
            end
        end
        return elig
    end
    -- round-robin: the eligible pack AFTER the last one we voyaged (wraps around)
    function VoyageHelpers.rotatePick()
        local elig = VoyageHelpers.eligiblePacks()
        if #elig == 0 then return (Lists.VoyagePacks or {})[1] end
        local last = VoyageHelpers._rotLast
        if not last then return elig[1] end
        for i, p in ipairs(elig) do
            if p == last then return elig[(i % #elig) + 1] end
        end
        return elig[1]   -- last pack became ineligible → restart the rotation
    end
    function VoyageHelpers.resolvePack()
        local sel = _ACC.VoyagePack
        if sel == "Auto (Rotate packs)" then return VoyageHelpers.rotatePick() end
        -- "Auto (MaxWave)" (and legacy "Auto (furthest)") = deepest pack
        if not sel or sel == "Auto (MaxWave)" or sel == "Auto (furthest)" then
            return VoyageHelpers.autoPick()
        end
        return sel   -- a specific pack name
    end
    function VoyageHelpers.cooldownLeft()
        local last = Data.Get("VoyageTime") or 0
        local now  = workspace:GetServerTimeNow()
        local cd   = (VoyageConfig and VoyageConfig.Data and VoyageConfig.Data.VoyageCooldown) or 300
        if VoyageConfig and VoyageConfig.GetVoyageCooldown then
            local rep = Data.GetReplica()
            if rep then
                local ok, c = pcall(VoyageConfig.GetVoyageCooldown, rep)
                if ok and c then cd = c end
            end
        end
        return math.max(0, cd - (now - last))
    end
    -- true while a voyage is actively running or the game is AFK-waiting to rejoin
    function VoyageHelpers.busy()
        local VH = VoyageHelpers.getVH()
        if not VH then return false end
        return VH.InBattle == true or VH.AFKStart ~= nil
    end
    function VoyageHelpers.startVoyage(pack)
        pack = pack or VoyageHelpers.resolvePack()
        if not pack then return false, "no pack" end
        if not VoyageHelpers.unlocked(pack) then return false, "locked: " .. tostring(pack) end
        local VH = VoyageHelpers.getVH()
        if VH and VH.PacksSelected then VH.PacksSelected.VoyagePackSelected = pack end
        Net.Fire(R.Voyage, "Start", pack)
        return true, pack
    end
    function VoyageHelpers.setAFK(on)
        on = on and true or false
        local VH = VoyageHelpers.getVH()
        if VH then VH.AFK = on end
        Net.Fire(R.Voyage, "AFK", on)
    end
    -- poster value: rarity rank dominates, then total buff magnitude
    local rank
    function VoyageHelpers.posterScore(po)
        if not rank then
            rank = {}
            if VoyageConfig and VoyageConfig.RarityList then
                for i, r in ipairs(VoyageConfig.RarityList) do rank[r] = i end
            end
        end
        local s = (rank[po.Rarity] or 0) * 1e6
        if type(po.Buffs) == "table" then
            for _, v in pairs(po.Buffs) do s = s + (tonumber(v) or 0) end
        end
        return s
    end
    function VoyageHelpers.bestPerPack(posters)
        local best = {}
        for _, po in ipairs(posters or {}) do
            if type(po) == "table" and po.Pack and po.UUID then
                local cur = best[po.Pack]
                if not cur or VoyageHelpers.posterScore(po) > VoyageHelpers.posterScore(cur) then
                    best[po.Pack] = po
                end
            end
        end
        return best
    end

    -- ── Priority-weighted equip ───────────────────────────────────────────
    -- Each buff's slider weight is a TIER. A poster's score = Σ value × BASE^w
    -- with BASE big enough (50 > the ~20× spread of buff values) that a higher
    -- weight STRICTLY dominates lower ones: Cash=8 beats Time/Damage=7 even if
    -- their % is bigger, and among posters that have Cash the max Cash% wins.
    -- Equal weights = same tier = either/or (their values add). weight 0 = ignore.
    local WEIGHT_BASE = 50
    function VoyageHelpers.weightedScore(po, weights)
        local s = 0
        if type(po.Buffs) == "table" and type(weights) == "table" then
            for b, v in pairs(po.Buffs) do
                local w = tonumber(weights[b]) or 0
                if w > 0 then s = s + (tonumber(v) or 0) * (WEIGHT_BASE ^ w) end
            end
        end
        return s
    end
    -- best poster per pack by the weighted priority (rarity/sum as tiebreak).
    -- No weights set anywhere → fall back to plain rarity-best.
    function VoyageHelpers.bestWeighted(posters, weights)
        local anyW = false
        if type(weights) == "table" then
            for _, w in pairs(weights) do if (tonumber(w) or 0) > 0 then anyW = true break end end
        end
        if not anyW then return VoyageHelpers.bestPerPack(posters) end
        local best, bestS = {}, {}
        for _, po in ipairs(posters or {}) do
            if type(po) == "table" and po.Pack and po.UUID then
                local s = VoyageHelpers.weightedScore(po, weights)
                local cur = best[po.Pack]
                if not cur then
                    best[po.Pack], bestS[po.Pack] = po, s
                elseif s > bestS[po.Pack]
                       or (s == bestS[po.Pack]
                           and VoyageHelpers.posterScore(po) > VoyageHelpers.posterScore(cur)) then
                    best[po.Pack], bestS[po.Pack] = po, s
                end
            end
        end
        return best
    end
    -- best poster per pack maximizing ONE buff; packs with no such poster are skipped
    function VoyageHelpers.bestByCategory(posters, buff)
        local best = {}
        for _, po in ipairs(posters or {}) do
            if type(po) == "table" and po.Pack and po.UUID and type(po.Buffs) == "table" then
                local v = tonumber(po.Buffs[buff])
                if v and v > 0 then
                    local cur = best[po.Pack]
                    if not cur or v > (tonumber(cur.Buffs[buff]) or 0) then best[po.Pack] = po end
                end
            end
        end
        return best
    end
    -- fire Equip for each pack where the chosen poster differs from equipped
    function VoyageHelpers.equipBest(bestMap)
        local equipped = Data.Get("PostersEquipped") or {}
        local n = 0
        for pack, po in pairs(bestMap or {}) do
            if not getgenv()._ACCRunning then break end
            local eq = equipped[pack]
            if po and po.UUID and (not eq or eq.UUID ~= po.UUID) then
                Net.FireRL(R.Voyage, "Voy:Equip:" .. pack, 0.4, "Equip", po.UUID)
                n = n + 1
                task.wait(0.3)
            end
        end
        return n
    end

    -- ── Smelt % filter ─────────────────────────────────────────────────────
    -- KEEP a poster if ANY of its buffs is ≥ that buff's threshold; if none of
    -- the set thresholds are met, the poster is junk → smelt. Buffs without a
    -- threshold don't count toward keeping. Values are fractions (1.5% = 0.015).
    function VoyageHelpers.meetsThreshold(po, thr)
        if type(po.Buffs) ~= "table" or type(thr) ~= "table" then return false end
        for b, t in pairs(thr) do
            t = tonumber(t) or 0
            if t > 0 then
                local v = tonumber(po.Buffs[b])
                if v and v >= t then return true end
            end
        end
        return false
    end
    function VoyageHelpers.anyThreshold(thr)
        if type(thr) ~= "table" then return false end
        for _, t in pairs(thr) do if (tonumber(t) or 0) > 0 then return true end end
        return false
    end
    -- one smelt pass by the % filter → returns count, or (0, reason) if disarmed.
    -- Always protects equipped / Locked / best-per-pack (rarity + weighted), so
    -- it can never smelt your best or equipped poster even if it fails the filter.
    function VoyageHelpers.doSmelt()
        local thr = _ACC.VoyageSmeltThresholds
        if not VoyageHelpers.anyThreshold(thr) then return 0, "set a % threshold first" end
        local posters  = Data.Get("Posters") or {}
        local equipped = Data.Get("PostersEquipped") or {}
        local protect  = {}
        for _, po in pairs(equipped) do
            if type(po) == "table" and po.UUID then protect[po.UUID] = true end
        end
        for _, po in pairs(VoyageHelpers.bestPerPack(posters)) do
            if po.UUID then protect[po.UUID] = true end
        end
        for _, po in pairs(VoyageHelpers.bestWeighted(posters, _ACC.VoyageBuffWeights)) do
            if po.UUID then protect[po.UUID] = true end
        end
        local rl = (not mapEmpty(_ACC.VoyageSmeltRarities)) and _ACC.VoyageSmeltRarities or nil
        local byPack = {}
        for _, po in ipairs(posters) do
            if type(po) == "table" and po.UUID and po.Pack
               and po.Lock ~= true and not protect[po.UUID]
               and (rl == nil or rl[po.Rarity])
               and not VoyageHelpers.meetsThreshold(po, thr) then
                byPack[po.Pack] = byPack[po.Pack] or {}
                table.insert(byPack[po.Pack], po.UUID)
            end
        end
        local smelted = 0
        for pack, uuids in pairs(byPack) do
            if not getgenv()._ACCRunning then break end
            if #uuids > 0 then
                Net.FireRL(R.Voyage, "Voy:Smelt:" .. pack, 1.0, "Smelt", pack, uuids)
                smelted = smelted + #uuids
                task.wait(0.5)
            end
        end
        return smelted
    end
end

-- ── VoyL: Auto Voyage ──────────────────────────────────────────────────────
sec.VoyL:Header({ Text = "🚢 Auto Voyage" })
_ACC.SetVoyageStatus = makeStatus(sec.VoyL)
do
    local packOpts = { "Auto (MaxWave)", "Auto (Rotate packs)" }
    for _, p in ipairs(Lists.VoyagePacks or {}) do table.insert(packOpts, p) end
    sec.VoyL:Dropdown({
        Name = "Voyage pack",
        Multi = false,
        Search = true,
        Options = packOpts,
        Default = "Auto (MaxWave)",
        Callback = function(v) _ACC.VoyagePack = v end,
    }, "VoyagePackDropdown")
end
sec.VoyL:Paragraph({
    Header = "Pack modes",
    Body = "Auto (MaxWave): farms your deepest pack for best posters/tokens (game AFK loop).\nAuto (Rotate packs): one full voyage on each unlocked pack, round-robin — levels ALL packs.\nOr pick one pack to farm only it.",
})
sec.VoyL:Toggle({
    Name = "Auto Voyage (AFK farm)",
    Default = false,
    -- turning the hub toggle off also stops the game's AFK auto-rejoin so the
    -- loop ends after the current voyage instead of running unattended
    Callback = function(v)
        _ACC.VoyageAuto = v
        if not v then pcall(function() VoyageHelpers.setAFK(false) end) end
    end,
}, "VoyageAutoToggle")
sec.VoyL:Divider()
sec.VoyL:Button({
    Name = "Start voyage (selected pack)",
    Callback = function()
        local ok, info = VoyageHelpers.startVoyage()
        Notify(ok and ("🚢 Voyage started: " .. tostring(info)) or ("⚠ " .. tostring(info)))
    end,
})
sec.VoyL:Button({ Name = "AFK loop ON",  Callback = function() VoyageHelpers.setAFK(true);  Notify("Voyage AFK on")  end })
sec.VoyL:Button({ Name = "AFK loop OFF", Callback = function() VoyageHelpers.setAFK(false); Notify("Voyage AFK off") end })
sec.VoyL:Button({ Name = "Exit voyage",  Callback = function() Net.Fire(R.Voyage, "Exit") end })

-- ── VoyR: Voyage Upgrades ──────────────────────────────────────────────────
sec.VoyR:Header({ Text = "⬆ Voyage Upgrades" })
_ACC.SetVoyageUpgStatus = makeStatus(sec.VoyR)
sec.VoyR:Toggle({
    Name = "Auto Buy Upgrades (cheapest first)",
    Default = false,
    Callback = function(v) _ACC.VoyageUpgradeAuto = v end,
}, "VoyageUpgradeAutoToggle")
sec.VoyR:Paragraph({
    Header = "Upgrades (spends Voyage Tokens)",
    Body = "BattleSpeed / Cooldown / Health / Damage / Rewards → max 50\nTokenChance → max 35\nBuys the cheapest not-maxed upgrade you can afford each cycle.",
})

-- ── VoyPostL: Posters + Smelt ──────────────────────────────────────────────
sec.VoyPostL:Header({ Text = "🖼 Posters — Equip" })
_ACC.SetPosterStatus = makeStatus(sec.VoyPostL)
sec.VoyPostL:Paragraph({
    Header = "Priority weights",
    Body = "Each slider = how important that buff is when picking which poster to equip per pack. A HIGHER slider is a strict tier: Cash 8 beats Time/Damage 7 even if their % is bigger, and among posters that have Cash it takes the max Cash%. Equal weights = either/or. 0 = ignore. All 0 → equips highest rarity.\n(HatchTime = open-time reduction; higher % = better.)",
})
do
    local buffs = (VoyageConfig and VoyageConfig.BuffList) or
                  { "Cash", "Diamonds", "Health", "Damage", "Luck", "HatchTime", "MutationChance", "XP" }
    for _, buff in ipairs(buffs) do
        sec.VoyPostL:Slider({
            Name = "Priority: " .. buff,
            Default = 0, Minimum = 0, Maximum = 10,
            DisplayMethod = "Value", Precision = 0,
            Callback = function(v) _ACC.VoyageBuffWeights[buff] = math.floor(tonumber(v) or 0) end,
        }, "VoyWeight_" .. buff)
    end
end
sec.VoyPostL:Toggle({
    Name = "Auto Equip Best Poster (uses weights)",
    Default = false,
    Callback = function(v) _ACC.VoyageEquipAuto = v end,
}, "VoyageEquipAutoToggle")
sec.VoyPostL:Button({
    Name = "⭐ Equip Best now (by priority)",
    Callback = function()
        task.spawn(function()
            local n = VoyageHelpers.equipBest(
                VoyageHelpers.bestWeighted(Data.Get("Posters") or {}, _ACC.VoyageBuffWeights))
            Notify(("Equipped %d poster(s) by priority"):format(n))
            if _ACC.SetPosterStatus then
                _ACC.SetPosterStatus(("⭐ Equipped %d by priority"):format(n))
            end
        end)
    end,
})
sec.VoyPostL:Divider()
sec.VoyPostL:Header({ Text = "Equip max single stat" })
do
    local buffs = (VoyageConfig and VoyageConfig.BuffList) or
                  { "Cash", "Diamonds", "Health", "Damage", "Luck", "HatchTime", "MutationChance", "XP" }
    for _, buff in ipairs(buffs) do
        sec.VoyPostL:Button({
            Name = "Equip max " .. buff,
            Callback = function()
                task.spawn(function()
                    local n = VoyageHelpers.equipBest(
                        VoyageHelpers.bestByCategory(Data.Get("Posters") or {}, buff))
                    Notify(("Equipped max %s on %d pack(s)"):format(buff, n))
                    if _ACC.SetPosterStatus then
                        _ACC.SetPosterStatus(("Equipped max %s → %d pack(s)"):format(buff, n))
                    end
                end)
            end,
        })
    end
end
sec.VoyPostL:Divider()
sec.VoyPostL:Header({ Text = "♻ Smelt" })
do
    local buffs = (VoyageConfig and VoyageConfig.BuffList) or
                  { "Cash", "Diamonds", "Health", "Damage", "Luck", "HatchTime", "MutationChance", "XP" }
    for _, buff in ipairs(buffs) do
        sec.VoyPostL:Slider({
            Name = "Keep ≥ " .. buff .. " %",
            Default = 0, Minimum = 0, Maximum = 10, DisplayMethod = "Value", Precision = 1,
            Callback = function(v) _ACC.VoyageSmeltThresholds[buff] = (tonumber(v) or 0) / 100 end,
        }, "VoySmeltThr_" .. buff)
    end
end
do
    local rarOpts = {}
    if VoyageConfig and VoyageConfig.RarityList then
        for _, r in ipairs(VoyageConfig.RarityList) do table.insert(rarOpts, r) end
    else
        rarOpts = { "Common", "Rare", "Epic", "Legendary", "Mythical" }
    end
    makeSearchableDropdown(sec.VoyPostL, {
        Name = "Limit to rarities (optional, empty = all)",
        Multi = true,
        Options = rarOpts,
        OnChange = function(map) _ACC.VoyageSmeltRarities = map end,
    }, "VoyageSmeltRaritiesDropdown")
end
sec.VoyPostL:Toggle({
    Name = "Auto Smelt (% filter)",
    Default = false,
    Callback = function(v) _ACC.VoyageSmeltAuto = v end,
}, "VoyageSmeltAutoToggle")
sec.VoyPostL:Button({
    Name = "Smelt now (% filter)",
    Callback = function()
        task.spawn(function()
            local n, why = VoyageHelpers.doSmelt()
            Notify(why and ("Smelt: " .. why) or ("♻ Smelted " .. tostring(n) .. " poster(s)"))
        end)
    end,
})
sec.VoyPostL:Paragraph({
    Header = "How the % filter works",
    Body = "Set a minimum % per buff. A poster is KEPT if ANY of its buffs is ≥ its threshold; if none qualify it's smelted (buffs with no threshold don't count). e.g. Damage 1.5% + Luck 1.5%: a poster with Damage 1.6% → keep; Damage 1.2% / Luck 0.4% → smelt; Damage 1.2% / Luck 1.7% → keep. Posters roll ~0.1–2% per buff, so set thresholds in that range. Never smelts equipped / Locked / your best poster per pack. Needs at least one threshold to arm.",
})

-- ── VoyForgeR: Forge ───────────────────────────────────────────────────────
sec.VoyForgeR:Header({ Text = "⚒ Forge" })
_ACC.SetForgeStatus = makeStatus(sec.VoyForgeR)
do
    local forgePackOpts = { "Auto (deepest eligible)" }
    for _, p in ipairs(Lists.VoyagePacks or {}) do table.insert(forgePackOpts, p) end
    sec.VoyForgeR:Dropdown({
        Name = "Forge pack",
        Multi = false,
        Search = true,
        Options = forgePackOpts,
        Default = "Auto (deepest eligible)",
        Callback = function(v) _ACC.VoyageForgePack = v end,
    }, "VoyageForgePackDropdown")
end
sec.VoyForgeR:Toggle({
    Name = "Auto Forge (≥5 scrolls of a rarity)",
    Default = false,
    Callback = function(v) _ACC.VoyageForgeAuto = v end,
}, "VoyageForgeAutoToggle")
sec.VoyForgeR:Paragraph({
    Header = "How forge works",
    Body = "Spends 5 scrolls of a rarity → 1 random poster for the chosen pack. The pack must have reached the rarity's stage (Common1/Rare20/Epic40/Legendary60/Mythical80) — scrolls below that pack's stage are skipped. 'Auto' picks the deepest eligible pack per scroll rarity.",
})

-- ============================================================================
-- // 15.5 TAB: GALLERY
-- ============================================================================
-- New system from the latest update. Diamond economy with 6 pack tiers,
-- ~110 figurines (mult 1..350), per-card upgrades (Cash/XP/Health/Damage),
-- and on-floor cash collect.
--
-- Remotes:
--   Gallery:FireServer("Buy",            packKey)              -- Diamonds
--   Gallery:FireServer("StockBuy",       packKey)              -- Robux (skip)
--   Gallery:FireServer("Levelup",        figurineName)         -- Diamonds
--   Gallery:FireServer("Upgrade",        cardName, kind)       -- Diamonds (per-card)
--   Gallery:FireServer("ClaimFigurine",  figurineName)         -- free, +10 💎
--   Gallery:FireServer("ShowRoll")                             -- toggle UI
--   Gallery:FireServer("Collect",        slotNumberStr "1".."10") -- collect cash
--   GetGalleryStock:InvokeServer() → { [packKey] = stockAmount, ... }
--
-- Replica: Diamonds, DiamondsPerSecond, Figurines (map), FigurinesDiscovered
-- (array), FigurinesClaimed (array), FigurineUpgrades (map of map), etc.

-- Local helpers — config formulas mirror GalleryConfig (decompile: GetUpgradeCost
-- / GetLevelupCost / Round5). The update changed both formulas; keep them in sync.
local function round5(n)
    return math.round((tonumber(n) or 0) / 5) * 5
end
local function galleryUpgradeCost(level, multiplier)
    -- mirrors GalleryConfig.GetUpgradeCost(level, page); page is multiplier here.
    -- Called with (currentLevel + 1, page) — same as the game's own UI.
    multiplier = multiplier or 1
    local v6
    if level == 0 then
        v6 = 250
    else
        local v8 = level * 250
        local v9 = math.log(level, 2)            -- update: log base 2 (was 2.3)
        local v10 = v8 + math.pow(level, v9)
        v6 = round5(math.round(v10))             -- update: real Round5
    end
    return math.round(v6 * multiplier)
end
local function galleryLevelupCost(figMultiplier, figLevel)
    -- mirrors GalleryConfig.GetLevelupCost(multiplier, level)
    return round5(figMultiplier * (figLevel ^ 1.35) * 10)   -- update: ^1.35 (was 1.3) + Round5
end
-- GetGalleryStock:InvokeServer() returns (baseStock, overrideStock). Effective
-- purchasable stock per box mirrors GalleryHandler.NewStock:
--   overrideStock[box]                          when the server sent an override
--   else baseStock[box] + FigurineBoosts[box]   (the Stock boost adds spawns)
-- Reading only the 1st value (old behaviour) under-counted boosted stock and
-- mis-fired Buy on sold-out tiers — the "No Stock Left" / "buys not all" bugs.
local gallerySnap, gallerySnapAt = {}, 0
local function galleryRefreshStock(force)
    if not force and gallerySnapAt > 0
       and (os.clock() - gallerySnapAt) < SHOP_SNAP_TTL then
        return gallerySnap
    end
    if not R.GetGalleryStock or not getgenv()._ACCRunning then return {} end
    local ok, base, override = pcall(function()
        return R.GetGalleryStock:InvokeServer()
    end)
    if not ok or type(base) ~= "table" then return {} end
    local boosts = Data.Get("FigurineBoosts") or {}
    local eff = {}
    for _, box in ipairs(Lists.GalleryPacks) do
        local n
        if type(override) == "table" and override[box] ~= nil then
            n = tonumber(override[box])
        else
            n = (tonumber(base[box]) or 0) + (tonumber(boosts[box]) or 0)
        end
        eff[box] = n or 0
    end
    gallerySnap, gallerySnapAt = eff, os.clock()
    return eff
end
-- Mirror of GalleryHandler InitActiveFigurines: top 10 owned by Chance ASC
local function galleryActiveSlots()
    local figs = Data.Get("Figurines") or {}
    local list = {}
    for name, info in pairs(figs) do
        table.insert(list, { name = name, chance = info.Chance or 0 })
    end
    table.sort(list, function(a, b) return a.chance < b.chance end)
    local slots = {}
    for i = 1, math.min(10, #list) do slots[i] = list[i].name end
    return slots
end

-- Cards list: every card name from CardConfig.Packs[*].List, plus pack name itself
-- as a column hint (so display says "Pirate (Pirate)" etc).
-- For simplicity we let user pick by card name; cost formula uses the card's pack Page.
local cardsByPack = {}
local allCardNames = {}
if CardConfig and CardConfig.Packs then
    for packName, packData in pairs(CardConfig.Packs) do
        if type(packData) == "table" and type(packData.List) == "table" then
            for cardName in pairs(packData.List) do
                table.insert(allCardNames, cardName)
                cardsByPack[cardName] = { pack = packName, page = packData.Page or 0 }
            end
        end
    end
end
table.sort(allCardNames)

-- ── GalBuyL: Auto Buy Packs ──────────────────────────────────────────────
sec.GalBuyL:Header({ Text = "Auto Buy Figurine Packs" })

_ACC.SetGalleryBuyStatus = makeStatus(sec.GalBuyL)

makeSearchableDropdown(sec.GalBuyL, {
    Name = "Pack tiers",
    Multi = true,
    Options = Lists.GalleryPacks,
    OnChange = function(map) _ACC.SelectedGalleryPacks = map end,
}, "GalleryPacksDropdown")

sec.GalBuyL:Dropdown({
    Name = "Priority",
    Multi = false,
    Options = { "Highest first", "Lowest first", "Spread" },
    Default = _ACC.GalleryBuyStrategy,
    Callback = function(v) _ACC.GalleryBuyStrategy = v end,
}, "GalleryBuyStrategyDropdown")

sec.GalBuyL:Toggle({
    Name = "Auto Buy (Diamonds, when in stock)",
    Default = false,
    Callback = function(v) _ACC.AutoGalleryBuy = v end,
}, "AutoGalleryBuyToggle")

sec.GalBuyL:Button({
    Name = "Buy selected once",
    Callback = function() _ACC._GalleryBuyForce = true end,
})

sec.GalBuyL:Button({
    Name = "Show current stock",
    Callback = function()
        local stock = galleryRefreshStock(true)
        local lines = {}
        for _, k in ipairs(Lists.GalleryPacks) do
            table.insert(lines, ("%s: %d"):format(k, stock[k] or 0))
        end
        Notify(("Diamonds: %s\n%s"):format(
            tostring(Data.Get("Diamonds") or 0),
            table.concat(lines, "  ")), 6)
    end,
})

-- ── Stock Boosts (NEW) ────────────────────────────────────────────────────
-- Gallery:FireServer("Boost", "Stock", packName)
-- Increases how many of that pack appear in market refreshes.
-- Cost: GalleryConfig.GetStockBoostCost(level+1, packName)
-- Cap:  GalleryConfig.Boosts.Stock.MaxLevel
sec.GalBuyL:Divider()
sec.GalBuyL:Header({ Text = "Auto Boost Pack Stock" })

_ACC.SetStockBoostStatus = makeStatus(sec.GalBuyL)

makeSearchableDropdown(sec.GalBuyL, {
    Name = "Packs to boost stock (Diamonds)",
    Multi = true,
    Options = Lists.GalleryPacks,
    OnChange = function(map) _ACC.SelectedStockBoostPacks = map end,
}, "StockBoostPacksDropdown")

sec.GalBuyL:Toggle({
    Name = "Auto Boost Stock (Diamonds)",
    Default = false,
    Callback = function(v) _ACC.AutoFigurineStockBoost = v end,
}, "AutoStockBoostToggle")

-- ── GalUpgR: Per-card Upgrades ───────────────────────────────────────────
sec.GalUpgR:Header({ Text = "Per-Card Upgrades" })

_ACC.SetGalleryUpgStatus = makeStatus(sec.GalUpgR)

sec.GalUpgR:Dropdown({
    Name = "Mode",
    Multi = false,
    Options = { "Multi-select", "Specific card" },
    Default = _ACC.GalleryUpgradeMode,
    Callback = function(v) _ACC.GalleryUpgradeMode = v end,
}, "GalleryUpgradeModeDropdown")

makeSearchableDropdown(sec.GalUpgR, {
    Name = "Cards (Multi-select mode)",
    Multi = true,
    Options = allCardNames,
    OnChange = function(map) _ACC.SelectedUpgradeCards = map end,
}, "GalleryUpgCardsDropdown")

makeSearchableDropdown(sec.GalUpgR, {
    Name = "Specific card (Specific-card mode)",
    Multi = false,
    Options = allCardNames,
    OnChange = function(v) _ACC.GalleryUpgradeFocusCard = v end,
}, "GalleryUpgFocusCardDropdown")

makeSearchableDropdown(sec.GalUpgR, {
    Name = "Upgrade kinds",
    Multi = true,
    Options = Lists.GalleryUpgradeKinds,
    Default = Lists.GalleryUpgradeKinds,   -- pre-select all
    OnChange = function(map) _ACC.SelectedUpgradeKinds = map end,
}, "GalleryUpgKindsDropdown")

sec.GalUpgR:Dropdown({
    Name = "Priority",
    Multi = false,
    Options = { "Highest first", "Lowest first", "Spread" },
    Default = _ACC.GalleryUpgradeStrategy,
    Callback = function(v) _ACC.GalleryUpgradeStrategy = v end,
}, "GalleryUpgStrategyDropdown")

sec.GalUpgR:Toggle({
    Name = "Auto Upgrade (Diamonds, max 20/level)",
    Default = false,
    Callback = function(v) _ACC.AutoGalleryUpgrade = v end,
}, "AutoGalleryUpgradeToggle")

-- ── GalLvlL: Figurine Levelup ────────────────────────────────────────────
sec.GalLvlL:Header({ Text = "Auto Levelup Figurines" })

_ACC.SetGalleryLvlStatus = makeStatus(sec.GalLvlL)

makeSearchableDropdown(sec.GalLvlL, {
    Name = "Figurines (sorted by multiplier)",
    Multi = true,
    Options = Lists.GalleryFigurines,
    OnChange = function(map) _ACC.SelectedLevelupFigurines = map end,
}, "GalleryLvlFiguresDropdown")

sec.GalLvlL:Dropdown({
    Name = "Priority",
    Multi = false,
    Options = { "Highest mult first", "Lowest mult first", "Spread" },
    Default = _ACC.GalleryLevelupStrategy,
    Callback = function(v) _ACC.GalleryLevelupStrategy = v end,
}, "GalleryLvlStrategyDropdown")

sec.GalLvlL:Toggle({
    Name = "Auto Levelup (Diamonds, max lv. 50)",
    Default = false,
    Callback = function(v) _ACC.AutoGalleryLevelup = v end,
}, "AutoGalleryLevelupToggle")

-- ── GalMiscR: Claim + Collect ────────────────────────────────────────────
sec.GalMiscR:Header({ Text = "Misc" })
sec.GalMiscR:Toggle({
    Name = "Auto Claim discovered figurines (+10 💎 each)",
    Default = false,
    Callback = function(v) _ACC.AutoGalleryClaim = v end,
}, "AutoGalleryClaimToggle")
sec.GalMiscR:Toggle({
    Name = "Auto Collect cash from active figurines (slots 1-10)",
    Default = false,
    Callback = function(v) _ACC.AutoGalleryCollect = v end,
}, "AutoGalleryCollectToggle")
sec.GalMiscR:Button({
    Name = "Toggle ShowRoll animation (server-side)",
    Callback = function() Net.Fire(R.Gallery, "ShowRoll"); Notify("Toggled ShowRoll") end,
})

-- ── Generic Boosts (NEW) ──────────────────────────────────────────────────
-- Gallery:FireServer("Boost", boostName)
-- GalleryConfig.Boosts has: DiamondMultiplier, FigurineLuck (and Stock,
-- which is handled separately above).
sec.GalMiscR:Divider()
sec.GalMiscR:Header({ Text = "Auto Boost (DiamondMult / Luck)" })

_ACC.SetGenericBoostStatus = makeStatus(sec.GalMiscR)

makeSearchableDropdown(sec.GalMiscR, {
    Name = "Boosts to upgrade",
    Multi = true,
    Options = { "DiamondMultiplier", "FigurineLuck" },
    Default = { ["DiamondMultiplier"] = true, ["FigurineLuck"] = true },
    OnChange = function(map) _ACC.SelectedGenericBoosts = map end,
}, "GenericBoostsDropdown")

sec.GalMiscR:Toggle({
    Name = "Auto Boost generic (Diamonds)",
    Default = false,
    Callback = function(v) _ACC.AutoFigurineGenericBoost = v end,
}, "AutoGenericBoostToggle")

-- ============================================================================
-- // 16. TAB: MISC
-- ============================================================================
sec.WHR:Header({ Text = "Webhook" })
sec.WHR:Input({
    Name = "Webhook URL",
    Default = "",
    Placeholder = "https://discord.com/api/webhooks/...",
    Callback = function(v) _ACC.WebhookURL = v or "" end,
}, "WebhookURLInput")
sec.WHR:Toggle({ Name = "Notify rare drops (new cards/pets/achievements + card mutations)",
                 Default = false, Callback = function(v) _ACC.WebhookDrops = v end },
               "WebhookDropsToggle")
sec.WHR:Toggle({ Name = "Notify raid wins",
                 Default = false, Callback = function(v) _ACC.WebhookRaid = v end },
               "WebhookRaidToggle")
sec.WHR:Toggle({ Name = "Notify DragonBall set 7/7 (ready to wish)",
                 Default = false, Callback = function(v) _ACC.WebhookDBComplete = v end },
               "WebhookDBCompleteToggle")
sec.WHR:Toggle({ Name = "Notify pet mutations (Rainbow / Diamond / Emerald / Void)",
                 Default = false, Callback = function(v) _ACC.WebhookPetMutation = v end },
               "WebhookPetMutationToggle")
sec.WHR:Toggle({ Name = "Notify card reaches ⭐5",
                 Default = false, Callback = function(v) _ACC.WebhookCardMax = v end },
               "WebhookCardMaxToggle")
sec.WHR:Toggle({ Name = "Notify Travel Merchant purchases (what you bought)",
                 Default = false, Callback = function(v) _ACC.WebhookMerchant = v end },
               "WebhookMerchantToggle")
sec.WHR:Button({
    Name = "Test webhook",
    Callback = function()
        if _ACC.WebhookURL == "" then Notify("URL empty"); return end
        if _ACC._WebhookTest then
            _ACC._WebhookTest()
            Notify("Sent test webhook")
        else
            Notify("Webhook helper not ready")
        end
    end,
})

sec.UtilL:Header({ Text = "Utility" })
sec.UtilL:Toggle({
    Name = "Anti-AFK",
    Default = true,
    Callback = function(v) _ACC.AntiAFK = v end,
}, "AntiAFKToggle")

sec.UtilL:Divider()
sec.UtilL:Header({ Text = "Server Join (Travel sniping)" })
sec.UtilL:Paragraph({
    Header = "How",
    Body = "Paste the JobId from the Travel webhook and hit Join to teleport into that exact server. Note: Roblox throttles instance hops — if it lands you in a random server, retry.",
})
sec.UtilL:Input({
    Name = "Job ID",
    Default = "",
    Placeholder = "paste server JobId here",
    Callback = function(v) _ACC.JoinJobId = (v or ""):gsub("%s+", "") end,
}, "JoinJobIdInput")
sec.UtilL:Button({
    Name = "Join Server",
    Callback = function()
        local jid = (_ACC.JoinJobId or ""):gsub("%s+", "")
        if jid == "" then Notify("Paste a JobId first"); return end
        if jid == game.JobId then Notify("That's the server you're already in"); return end
        local TP = (cloneref and cloneref(game:GetService("TeleportService")))
                   or game:GetService("TeleportService")
        Notify("Joining server...")
        local ok, err = pcall(function()
            TP:TeleportToPlaceInstance(game.PlaceId, jid, LocalPlayer)
        end)
        if not ok then
            Notify("Join failed: " .. tostring(err))
        end
    end,
})
sec.UtilL:Button({
    Name = "Copy current JobId",
    Callback = function()
        local setclip = (setclipboard or toclipboard or (Clipboard and Clipboard.set) or writeclipboard)
        if setclip then
            pcall(setclip, game.JobId)
            Notify("Copied current JobId")
        else
            Notify("JobId: " .. tostring(game.JobId))
        end
    end,
})

sec.UtilL:Divider()
sec.UtilL:Header({ Text = "Auto Server Hop" })

_ACC.SetHopStatus = makeStatus(sec.UtilL)

sec.UtilL:Paragraph({
    Header = "How",
    Body = "Snipe mode: hops across fresh low-pop servers UNTIL it lands on one with an active Travel Merchant, STAYS the buy window (so Auto Buy Travel Merchant can grab it), then hops onward — cycling merchant → buy → next merchant. Settle time = wait on an EMPTY server (for merchant state to replicate) before hopping; lower = faster scan. Needs Auto Buy Travel Merchant ON (with items picked) to actually buy. Keep the script on auto-execute so it re-runs on each new server.",
})

sec.UtilL:Slider({
    Name = "Settle time per server (s)",
    Default = 10,
    Minimum = 2,
    Maximum = 30,
    DisplayMethod = "Value",
    Precision = 0,
    Callback = function(v) _ACC.HopDelay = math.clamp(math.floor(tonumber(v) or 10), 2, 30) end,
}, "HopDelaySlider")

sec.UtilL:Slider({
    Name = "Buy window on merchant (s)",
    Default = 15,
    Minimum = 3,
    Maximum = 60,
    DisplayMethod = "Value",
    Precision = 0,
    Callback = function(v) _ACC.HopBuyWindow = math.clamp(math.floor(tonumber(v) or 15), 3, 60) end,
}, "HopBuyWindowSlider")

sec.UtilL:Slider({
    Name = "Max players (target server)",
    Default = 10,
    Minimum = 1,
    Maximum = math.max(2, Players.MaxPlayers),
    DisplayMethod = "Value",
    Precision = 0,
    Callback = function(v) _ACC.HopMaxPlayers = math.max(1, math.floor(tonumber(v) or 10)) end,
}, "HopMaxPlayersSlider")

sec.UtilL:Toggle({
    Name = "Auto Hop (snipe: hop until merchant)",
    Default = false,
    Callback = function(v) _ACC.AutoHopEnabled = v end,
}, "AutoHopToggle")

sec.UtilL:Button({
    Name = "Hop Now",
    Callback = function() _ACC._HopNow = true end,
})


sec.VisR:Header({ Text = "Visual" })
sec.VisR:Toggle({
    Name = "Hide HUD popups (CashChange, etc.)",
    Default = false,
    Callback = function(v) _ACC.HideHUDPopups = v end,
}, "HideHUDPopupsToggle")
sec.VisR:Button({
    Name = "Reset character",
    Callback = function()
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end,
})

-- ── FPS Boost / Low Graphics ──────────────────────────────────────────────
-- Helps with the lag spikes when spam-opening cards: drops render quality,
-- kills post-processing + shadows, and continuously disables particle-type
-- effects (the bursts every card-open spawns). Effects stay off until rejoin.
sec.VisR:Toggle({
    Name = "FPS Boost (low graphics)",
    Default = false,
    Callback = function(v) _ACC.FPSBoost = v end,
}, "FPSBoostToggle")
sec.VisR:Label({ Text = "Soaps the game: no particles/shadows/post-FX, lowest quality. Reverts on toggle-off." })

do
    -- effect classes nuked while boost is on (card-open bursts are mostly these)
    local FPS_KILL = {
        ParticleEmitter = true, Trail = true, Beam = true,
        Smoke = true, Fire = true, Sparkles = true, Explosion = true,
    }
    local Lighting = game:GetService("Lighting")
    local applied, conn = false, nil
    local saved = {}

    local function applyStatic(on)
        pcall(function()
            settings().Rendering.QualityLevel =
                on and Enum.QualityLevel.Level01 or Enum.QualityLevel.Automatic
        end)
        if on then
            if saved.GlobalShadows == nil then saved.GlobalShadows = Lighting.GlobalShadows end
            if saved.FogEnd       == nil then saved.FogEnd       = Lighting.FogEnd end
            pcall(function() Lighting.GlobalShadows = false end)
            pcall(function() Lighting.FogEnd = 1e9 end)
            for _, e in ipairs(Lighting:GetChildren()) do
                if e:IsA("BloomEffect") or e:IsA("BlurEffect")
                   or e:IsA("DepthOfFieldEffect") or e:IsA("SunRaysEffect") then
                    pcall(function() e.Enabled = false end)
                end
            end
        else
            if saved.GlobalShadows ~= nil then
                pcall(function() Lighting.GlobalShadows = saved.GlobalShadows end)
            end
            if saved.FogEnd then pcall(function() Lighting.FogEnd = saved.FogEnd end) end
            for _, e in ipairs(Lighting:GetChildren()) do
                if e:IsA("BloomEffect") or e:IsA("BlurEffect")
                   or e:IsA("DepthOfFieldEffect") or e:IsA("SunRaysEffect") then
                    pcall(function() e.Enabled = true end)
                end
            end
        end
    end

    local function sweepNow()
        local ok, ds = pcall(function() return Workspace:GetDescendants() end)
        if not ok then return end
        for _, d in ipairs(ds) do
            if FPS_KILL[d.ClassName] then pcall(function() d.Enabled = false end) end
        end
    end

    -- restore hook invoked by _ACCCleanup so lighting/quality/shadows/fog/post-FX
    -- revert on Unload even while FPS Boost is ON (closure over applyStatic/applied/conn)
    getgenv()._ACCFPSRestore = function()
        if conn then pcall(function() conn:Disconnect() end); conn = nil end
        if applied then
            applied = false
            pcall(function() applyStatic(false) end)
        end
    end

    task.spawn(function()
        while getgenv()._ACCRunning do
            if _ACC.FPSBoost and not applied then
                applied = true
                applyStatic(true)
                sweepNow()
                conn = Workspace.DescendantAdded:Connect(function(d)
                    if _ACC.FPSBoost and FPS_KILL[d.ClassName] then
                        pcall(function() d.Enabled = false end)
                    end
                end)
                table.insert(_ACC._connections, conn)
            elseif (not _ACC.FPSBoost) and applied then
                applied = false
                if conn then pcall(function() conn:Disconnect() end); conn = nil end
                applyStatic(false)
            end
            task.wait(1)
        end
        -- restore on unload
        if applied then
            if conn then pcall(function() conn:Disconnect() end) end
            pcall(function() applyStatic(false) end)
        end
    end)
end

-- ============================================================================
-- // 17. TAB: SETTINGS
-- ============================================================================
sec.InfoL:Header({ Text = "Info" })
sec.InfoL:Label({ Text = "Anime Card Collection | ApelHub" })
sec.InfoL:Label({ Text = "Player: " .. LocalPlayer.Name })
sec.InfoL:Label({ Text = "UserId: " .. tostring(LocalPlayer.UserId) })
sec.InfoL:Label({ Text = "Plot:   " .. Plot.GetName() })

sec.CtrlR:Header({ Text = "Control" })

-- ── UI Size (mobile-friendly) ─────────────────────────────────────────────
-- MacLib fork exposes Window:SetScale(0.5..2.0). Auto-detect mobile by
-- TouchEnabled + no keyboard → start at 0.6, otherwise 1.0.
local _isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local _defaultScale = _isMobile and 0.6 or 1.0

task.spawn(function()
    task.wait(0.1)
    if Window.SetScale then pcall(function() Window:SetScale(_defaultScale) end) end
end)

sec.CtrlR:Slider({
    Name = "UI Size",
    Default = _defaultScale,
    Minimum = 0.5,
    Maximum = 2.0,
    DisplayMethod = "Value",
    Precision = 2,
    Callback = function(v)
        if Window.SetScale then pcall(function() Window:SetScale(v) end) end
    end,
}, "UISizeSlider")

sec.CtrlR:Button({
    Name = "Unload Hub",
    Callback = function()
        if getgenv()._ACCCleanup then getgenv()._ACCCleanup() end
    end,
})

sec.InfoL:Divider()
sec.InfoL:Header({ Text = "Quick Actions" })
sec.InfoL:Button({
    Name = "Skip Tutorial",
    Callback = function()
        local rem = R.TutorialFinished or RS.Remotes:FindFirstChild("TutorialFinished")
        if rem then
            pcall(function() rem:FireServer() end)
            Notify("Tutorial finish sent")
        else
            Notify("TutorialFinished remote not found")
        end
    end,
})
sec.InfoL:Input({
    Name = "Star Evolve card (internal name)",
    Default = "",
    Placeholder = "e.g. Hisoka",
    Callback = function(v) _ACC.STEvolveTarget = (v or ""):gsub("^%s+", ""):gsub("%s+$", "") end,
}, "STEvolveInput")
sec.InfoL:Button({
    Name = "Evolve selected card (Star)",
    Callback = function()
        local n = _ACC.STEvolveTarget
        if not n or n == "" then Notify("Type a card name first"); return end
        Net.Fire(R.StarTrial, "Star", n)
        Notify("Sent Star evolve: " .. n)
    end,
})
sec.InfoL:Button({
    Name = "Claim Group Reward",
    Callback = function() Net.Fire(R.Card, "ClaimReward"); Notify("Group reward claim sent") end,
})
-- ============================================================================
-- // 18. LOOPS — AUTO FARM
-- ============================================================================

-- ── Auto Buy ──────────────────────────────────────────────────────────────
-- SelectedBuyPacks keys are combined: "Pirate" (Regular), "Pirate Gold",
-- "Pirate Diamond", ... — match by reconstructing the key from the conveyor
-- pack's mesh.Name (family) and inner Folder.Name (rarity).
-- Reads price from mesh.ConveyorDisplay.Price.Text BEFORE firing — server
-- rejects un-affordable buys with a Robux donation prompt, so client-side
-- gating prevents that popup AND cuts wasted requests.
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoBuyEnabled and not mapEmpty(_ACC.SelectedBuyPacks) then
            local conveyor = Plot.GetConveyorPacks()
            if conveyor then
                local cash = Data.Get("Cash") or 0

                for _, pack in ipairs(conveyor:GetChildren()) do
                    if not _ACC.AutoBuyEnabled or not getgenv()._ACCRunning then break end

                    -- DragonBall: SpawnDragonBall (decompile) parents its model
                    -- to workspace.Client.Packs, names it "<plot>-<spawn>-DragonBall-<n>",
                    -- and uses a Primary Part (not MeshPart) + DragonBallDisplay.
                    -- Match by name pattern so we don't depend on the part class.
                    if pack:IsA("Model") and tostring(pack.Name):find("-DragonBall-") then
                        if mapHas(_ACC.SelectedBuyPacks, "DragonBall") then
                            local prim = pack.PrimaryPart or pack:FindFirstChild("Primary")
                            local priceLbl = prim
                                             and prim:FindFirstChild("DragonBallDisplay")
                                             and prim.DragonBallDisplay:FindFirstChild("Price")
                            local price = priceLbl and parseAbbreviated(priceLbl.Text) or 0
                            if price == 0 or price <= cash then
                                Net.Fire(R.Card, "BuyPack", pack.Name)
                                if price > 0 then cash = cash - price end
                                task.wait(0.15)
                            end
                        end
                    else
                        local mesh = pack:FindFirstChildOfClass("MeshPart")
                        if mesh then
                            local family = mesh.Name
                            local rarity = "Regular"
                            for _, c in ipairs(pack:GetChildren()) do
                                if c:IsA("Folder") then rarity = c.Name; break end
                            end
                            local key = (rarity == "Regular") and family
                                                              or (family .. " " .. rarity)

                            if mapHas(_ACC.SelectedBuyPacks, key) then
                                local priceLbl = mesh:FindFirstChild("ConveyorDisplay")
                                                 and mesh.ConveyorDisplay:FindFirstChild("Price")
                                local price = priceLbl and parseAbbreviated(priceLbl.Text) or 0

                                if price > 0 and price <= cash then
                                    Net.Fire(R.Card, "BuyPack", pack.Name)
                                    cash = cash - price            -- optimistic
                                    task.wait(0.15)
                                elseif price == 0 then
                                    -- couldn't read price — fall back to firing once
                                    Net.Fire(R.Card, "BuyPack", pack.Name)
                                    task.wait(0.15)
                                end
                            end
                        end
                    end
                    task.wait(0.05)
                end
                -- refetch after a full conveyor sweep
                cash = Data.Get("Cash") or 0
            end
        end
        task.wait(0.4)
    end
end)

-- ── Auto Open: teleport to each Ready! pack and activate its prompt ─────
-- Pack readiness is tracked via per-player CollectionService tags:
--   "<PlayerName>-Pack"      → Part / Model — the pack itself
--   "<PlayerName>-PackTimer" → TextLabel    — text becomes "Ready!" when ready
-- Reads attributes "Time" and "Hatch" on the timer label as a safety check
-- (RenderStepped sets Text, but attribute math is authoritative).
-- Per-pack cache (weak keys: entries drop when the pack despawns/hatches) so we
-- resolve the ProximityPrompt + timer label with a SINGLE descendants pass once
-- instead of two full walks every cycle. Re-resolves only on a cache miss or
-- when a previously-found child went stale / was not present yet.
local _autoOpenCache = setmetatable({}, { __mode = "k" })
local function resolveAutoOpenPack(packPart, timerTag)
    local cached = _autoOpenCache[packPart]
    if cached then
        local p, t = cached.prompt, cached.timer
        local pOk = p and p.Parent ~= nil
        local tOk = t and t.Parent ~= nil
        if pOk and tOk then return cached end
        -- nil-on-first-resolve or stale child: fall through to re-resolve below
    end
    local model = packPart:FindFirstAncestorOfClass("Model") or packPart
    local prompt, timer
    for _, d in ipairs(model:GetDescendants()) do
        if not prompt and d:IsA("ProximityPrompt") then prompt = d end
        if not timer and CollectionService:HasTag(d, timerTag) then timer = d end
        if prompt and timer then break end
    end
    cached = { prompt = prompt, timer = timer }
    _autoOpenCache[packPart] = cached
    return cached
end
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoOpenEnabled then
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local packTag  = LocalPlayer.Name .. "-Pack"
                local timerTag = LocalPlayer.Name .. "-PackTimer"

                -- gather Ready! packs (timer label resolved from per-pack cache);
                -- safe()-wrapped so a pack vanishing mid-gather can't kill the loop
                local readyPacks = {}
                local now = workspace:GetServerTimeNow()
                for _, packPart in ipairs(CollectionService:GetTagged(packTag)) do
                    safe(function()
                        if not packPart:IsDescendantOf(workspace) then return end
                        local timerLabel = resolveAutoOpenPack(packPart, timerTag).timer
                        local ready = false
                        if timerLabel then
                            local t = timerLabel:GetAttribute("Time")
                            local h = timerLabel:GetAttribute("Hatch")
                            if t and h and h < (now - t) then
                                ready = true
                            elseif tostring(timerLabel.Text) == "Ready!" then
                                ready = true
                            end
                        end
                        if ready then
                            table.insert(readyPacks, packPart)
                        end
                    end)
                end

                if #readyPacks > 0 then
                    local startCFrame = hrp.CFrame
                    local moved = false
                    for _, packPart in ipairs(readyPacks) do
                        if not _ACC.AutoOpenEnabled or not getgenv()._ACCRunning then break end
                        -- a destroyed/reparented pack must not kill the loop
                        safe(function()
                            if not packPart:IsDescendantOf(workspace) then return end
                            local prompt = resolveAutoOpenPack(packPart, timerTag).prompt
                            if not prompt or not prompt.Parent then return end
                            -- only teleport when out of activation range; landing
                            -- the spawned reward inside our auto-collect range still
                            -- needs us nearby, so use the prompt's own reach as the
                            -- threshold and skip the TP when we're already close
                            local reach = prompt.MaxActivationDistance
                            if not reach or reach <= 0 then reach = 10 end
                            local packPos = packPart.Position
                            if (hrp.Position - packPos).Magnitude > reach then
                                hrp.CFrame = CFrame.new(packPos + Vector3.new(0, 3, 0))
                                moved = true
                                task.wait(0.15)
                            end

                            prompt:InputHoldBegin()
                            task.wait(prompt.HoldDuration + 0.05)
                            prompt:InputHoldEnd()
                            -- linger on the spot so the reward is grabbed
                            task.wait(0.4)
                        end)
                    end
                    if moved and hrp.Parent then hrp.CFrame = startCFrame end
                end
            end
        end
        task.wait(1.0)
    end
end)

-- ── Auto Collect cash (full-page collect + deterministic page sweep) ─────
-- FIX (player report "auto collect not working / misses a lot of money"):
--   Live recon (PlaceId 76285745979410, 2026-06-13) proved the remote+arg
--   are CORRECT — Card:FireServer("Collect", <slotPart>) drains a slot even
--   from 196 studs away (no proximity check). The bug was the LOOP:
--     * Old aggregate cap of 12 fires/cycle, but each page has 18 slots
--       (Left 1-9 + Right 1-9). Iteration always restarted at Left.1, so
--       slots Right.4-9 — frequently the RICHEST cards — were NEVER collected
--       on ANY page. Confirmed live: Right.4-9 sat at $253T-$360T while the
--       loop ran. Now EVERY visible slot is collected each page.
--     * Edge detection was a fragile 2-frame snapshot-equality heuristic.
--       Now we parse the authoritative "Page N/M" label and reverse exactly
--       at N>=M / N<=1, so any binder size is fully swept (this acct: 27 pp).
--     * Flip wait is event-driven: poll the page counter until it actually
--       changes (replication measured ~0.17-0.29s live), capped — faster and
--       never collects a stale page.
--     * Light per-fire jitter prevents a single-frame burst of 18 identical
--       FireServer calls (cheap server-rate-limiter insurance; jitter scoped
--       to this game only).
task.spawn(function()
    local direction = "RightArrow"

    -- Parse "Page N/M" -> N, M. M is nil on single-page binders.
    local function readPage(display)
        local p = display:FindFirstChild("Page")
        if not p then return nil, nil end
        for _, d in ipairs(p:GetDescendants()) do
            if d:IsA("TextLabel") and d.Text and d.Text ~= "" then
                local n, m = d.Text:match("(%d+)%s*/%s*(%d+)")
                if n then return tonumber(n), tonumber(m) end
                local only = d.Text:match("(%d+)")
                if only then return tonumber(only), nil end
            end
        end
        return nil, nil
    end

    -- collect EVERY slot currently bound on both binder sides
    local function collectVisible(display)
        for _, sideName in ipairs({ "Left", "Right" }) do
            local side = display:FindFirstChild(sideName)
            if side then
                for _, slot in ipairs(side:GetChildren()) do
                    if not _ACC.AutoCollectEnabled or not getgenv()._ACCRunning then return end
                    -- per-slot RL only guards accidental double-fire; flips
                    -- naturally space same-slot collects >0.1s apart anyway
                    if RL_Allow("Card:Collect:" .. sideName .. "/" .. slot.Name, 0.05) then
                        Net.Fire(R.Card, "Collect", slot)
                        task.wait(0.02 + math.random() * 0.04) -- anti-burst jitter
                    end
                end
            end
        end
    end

    -- fire a flip, then wait until the page counter actually changes (capped)
    local function flipAndWait(display, dir)
        local n0 = select(1, readPage(display))
        Net.Fire(R.Card, "Page", dir)
        local t0 = os.clock()
        while os.clock() - t0 < 0.6 do
            task.wait(0.03)
            if not _ACC.AutoCollectEnabled or not getgenv()._ACCRunning then return end
            if select(1, readPage(display)) ~= n0 then return end
        end
    end

    while getgenv()._ACCRunning do
        if _ACC.AutoCollectEnabled then
            local display = Plot.GetDisplay()
            if display then
                -- 1. collect every visible slot on the current page
                collectVisible(display)

                -- 2. choose direction from the live page counter, then flip
                local n, m = readPage(display)
                if m and m > 1 then
                    if direction == "RightArrow" and n and n >= m then
                        direction = "LeftArrow"
                    elseif direction == "LeftArrow" and n and n <= 1 then
                        direction = "RightArrow"
                    end
                    flipAndWait(display, direction)
                elseif n == nil and m == nil then
                    -- no readable page label: flip blindly so multi-page binders
                    -- without a counter are still swept (rare)
                    Net.FireRL(R.Card, "Card:PageFlip", 0.4, "Page", direction)
                    task.wait(0.4)
                end
                -- m == 1 (single page): nothing to flip, keep collecting
            end
        end
        task.wait(0.1)
    end
end)

-- ── Spam CollectAll (if user owns gamepass) ───────────────────────────────
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.CollectAllEnabled then
            Net.FireRL(R.Card, "Card:CollectAll", 1.5, "CollectAll")
        end
        task.wait(0.5)
    end
end)

-- ── Auto Loot — pickup tokens, DBs, potions/consumables on the map ────────
-- Each drop type has its own per-player CollectionService tag and remote:
--   "<UserName>Token"  → Card:CollectToken(name)
--   "<UserId>-DB"      → DragonBall:Collect()    (no args)
--   "<UserId>-Egg"     → Potion:Collect(name)    (Easter eggs go through Potion remote in this game)
--   "Potions"          → Potion:Collect(name)
-- No teleport needed — server doesn't enforce strict proximity for these
-- (it does spawn drops near the player anyway).
task.spawn(function()
    local function tagOnce(inst, key)
        if not inst then return false end
        if inst:GetAttribute(key) == true then return false end
        inst:SetAttribute(key, true)
        task.delay(5, function()
            if inst.Parent then inst:SetAttribute(key, nil) end
        end)
        return true
    end

    while getgenv()._ACCRunning do
        if _ACC.AutoLoot then
            local userName = LocalPlayer.Name
            local userId   = tostring(LocalPlayer.UserId)
            local tokenTag = userName .. "Token"
            local dbTag    = userId .. "-DB"
            local eggTag   = userId .. "-Egg"

            -- tokens (grade tokens dropped on the map)
            for _, token in ipairs(CollectionService:GetTagged(tokenTag)) do
                if not _ACC.AutoLoot or not getgenv()._ACCRunning then break end
                if tagOnce(token, "_ACCLooted") then
                    Net.Fire(R.Card, "CollectToken", token.Name)
                end
            end

            -- dragon balls
            for _, db in ipairs(CollectionService:GetTagged(dbTag)) do
                if not _ACC.AutoLoot or not getgenv()._ACCRunning then break end
                if tagOnce(db, "_ACCLooted") then
                    Net.Fire(R.DragonBall, "Collect")
                    task.wait(0.05)
                end
            end

            -- easter eggs (rare; tag exists year-round in code)
            for _, egg in ipairs(CollectionService:GetTagged(eggTag)) do
                if not _ACC.AutoLoot or not getgenv()._ACCRunning then break end
                if tagOnce(egg, "_ACCLooted") then
                    Net.Fire(R.Potion, "Collect", egg.Name)
                end
            end

            -- potions / consumables (parkour drops, weather drops, etc.)
            for _, p in ipairs(CollectionService:GetTagged("Potions")) do
                if not _ACC.AutoLoot or not getgenv()._ACCRunning then break end
                if tagOnce(p, "_ACCLooted") then
                    Net.Fire(R.Potion, "Collect", p.Name)
                end
            end
        end
        task.wait(0.5)
    end
end)

-- ── Auto Place ────────────────────────────────────────────────────────────
-- Strategy: equip pack once, then teleport to random spots within plot Floor
-- and try to Place. After each fire we check if PacksPlaced grew — if not,
-- the spot was occupied/invalid → try another random position. Up to 10 tries
-- per pack.
-- Priority: higher CardConfig.Packs[family].Page first (later families
-- like Slayer/Sorcerer beat earlier ones like Pirate/Ninja), then within
-- the same family higher rarity (Rainbow > Diamond > Void > Emerald > Gold
-- > Regular). Ensures rare/late packs claim slots before common ones if
-- the placement cap is reached.
task.spawn(function()
    -- rarity priority lookup: higher index = higher priority
    local rarityIdx = { Regular = 0 }
    do
        local i = 1
        for _, r in ipairs(Lists.Rarities) do
            if r ~= "Regular" then rarityIdx[r] = i; i = i + 1 end
        end
    end

    local function parsePackKey(displayName)
        -- Strip "Bundle" suffix first if present
        local body = displayName:match("^(.-) Bundle$") or displayName
        -- "<family> <rarity>" if last token is a known rarity, else family only
        local prefix, last = body:match("^(.+) (%S+)$")
        if prefix and last and rarityIdx[last] and last ~= "Regular" then
            return prefix, last
        end
        if prefix and last == "Regular" then
            return prefix, "Regular"
        end
        return body, "Regular"
    end

    local function priorityOf(displayName)
        local family, rarity = parsePackKey(displayName)
        local page = (CardConfig and CardConfig.Packs
                      and CardConfig.Packs[family]
                      and CardConfig.Packs[family].Page) or 0
        return page, rarityIdx[rarity] or 0, family, rarity
    end

    -- ── pack footprints (read once from Assets, scaled by mutation Size) ──
    -- Server-side spawn (decompile L19618): mutated packs scale by
    --   1 + (Mutations[mut].Size - 1) * 0.6
    -- so collision check must use the scaled footprint, not just the base.
    local PACK_FOOTPRINT, BUNDLE_FOOTPRINT
    do
        local function modelFootprint(model)
            if not (model and model:IsA("Model")) then return nil end
            local _, size = model:GetBoundingBox()
            return Vector3.new(size.X * 0.95, 0.5, size.Z * 0.95)
        end
        local assets = RS:FindFirstChild("Assets")
        local packsF = assets and assets:FindFirstChild("Packs")
        if packsF then
            for _, m in ipairs(packsF:GetChildren()) do
                if m:IsA("Model") and m.PrimaryPart then
                    PACK_FOOTPRINT = modelFootprint(m); break
                end
            end
        end
        local bundleAsset = assets and assets:FindFirstChild("Misc")
                            and assets.Misc:FindFirstChild("Bundle")
        BUNDLE_FOOTPRINT = modelFootprint(bundleAsset)
        PACK_FOOTPRINT   = PACK_FOOTPRINT   or Vector3.new(4.5, 0.5, 4.5)
        BUNDLE_FOOTPRINT = BUNDLE_FOOTPRINT or Vector3.new(7.5, 0.5, 7.5)
    end

    local function entryFootprint(entry)
        -- Plain base footprint — server-side scale-by-mutation (1+(Size-1)*0.6)
        -- only affects visual; collision uses the un-scaled bbox at place
        -- time, so probing with the base footprint matches what the server
        -- actually checks. (Pre-fix the scaled probe was over-blocking
        -- otherwise-free cells for Diamond/Rainbow packs.)
        return entry.isBundle and BUNDLE_FOOTPRINT or PACK_FOOTPRINT
    end

    -- ── overlap params: only PlayerPack-tagged BaseParts on OUR plot ─────
    -- Scoped to plotModel, NOT the whole workspace. On a populated server the
    -- global PlayerPack tag set grows into the hundreds (every player's packs),
    -- and every GetPartBoundsInBox probe runs against that filter list — so the
    -- cost crept up the longer the session ran. Restricting the filter to our
    -- own plot keeps it flat. This was the "lags more over time" cause.
    local function buildPlayerPackParams(plotModel)
        local scope = plotModel or workspace
        local params = OverlapParams.new()
        params.FilterType                 = Enum.RaycastFilterType.Include
        params.MaxParts                   = 200
        params.RespectCanCollide          = false
        local list = {}
        for _, inst in ipairs(CollectionService:GetTagged("PlayerPack")) do
            if inst:IsDescendantOf(scope) then
                if inst:IsA("Model") then
                    if inst.PrimaryPart then table.insert(list, inst.PrimaryPart) end
                elseif inst:IsA("BasePart") then
                    table.insert(list, inst)
                end
            end
        end
        params.FilterDescendantsInstances = list
        return params
    end

    -- ── avoid zones: machine boxes whose ProximityPrompt UI annoys players ─
    -- AutoCollect / CollectTen / DoubleXP / GradeMachine / OpenAllPacks /
    -- UpgradeMachine sit under plot.Misc, and GalleryPortal under plot.Map —
    -- all on the SAME platform where packs are placed. Teleporting a cell
    -- center next to one pops its prompt UI. We build a circular keep-out
    -- zone per machine (= prompt activation distance + margin) and reject any
    -- placement cell that lands inside.
    local AVOID_MISC = {
        "AutoCollect", "CollectTen", "DoubleXP",
        "GradeMachine", "OpenAllPacks", "UpgradeMachine",
    }
    local function buildAvoidZones(plotModel)
        local zones = {}
        if not plotModel then return zones end
        local function add(inst)
            if not inst then return end
            local ok, pivot = pcall(function() return inst:GetPivot() end)
            if not ok or not pivot then return end
            -- radius = prompt activation distance (default 10) + character/footprint margin
            local activation = 10
            for _, d in ipairs(inst:GetDescendants()) do
                if d:IsA("ProximityPrompt") then
                    activation = math.max(activation, d.MaxActivationDistance)
                end
            end
            table.insert(zones, { pos = pivot.Position, radius = (activation + 6) * 0.5 })
        end
        local misc = plotModel:FindFirstChild("Misc")
        if misc then
            for _, name in ipairs(AVOID_MISC) do
                add(misc:FindFirstChild(name))
            end
        end
        local map = plotModel:FindFirstChild("Map")
        if map then
            add(map:FindFirstChild("GalleryPortal"))
        end
        return zones
    end

    -- ── pack spacing ─────────────────────────────────────────────────────
    -- The footprint overlap test only stops packs from physically clipping —
    -- it still lets them sit edge-to-edge in a cramped cluster. Packs are
    -- rectangular, so to keep cards out of a "milli" gap we just probe each
    -- placement cell with an INFLATED footprint (pack size + PACK_SPACING on
    -- every side) — pretend the pack is bigger and the existing rectangular
    -- overlap test does the rest. No circular zones needed.
    -- PACK_SPACING is the clear gap, in studs, kept between pack edges.
    local PACK_SPACING = 1

    -- ── grid-aware free cell picker ──────────────────────────────────────
    -- Walks an N×N grid over the floor; for each cell asks
    --   "if I dropped a pack with `footprint` centred here, would it overlap
    --    any tagged PlayerPack?"  Returns cell positions sorted by distance
    --   from `hintPos` (so we tend to fill close to the player first).
    local function findFreeCells(floor, footprint, params, hintPos, gridN, avoidZones)
        gridN = gridN or 18
        local cellSizeX = floor.Size.X / gridN
        local cellSizeZ = floor.Size.Z / gridN
        -- Light edge inset so packs aren't placed half-off the plot.
        -- Don't set this aggressive — small floors collapse the usable area.
        local pad = 0.05
        local cells = {}
        for ix = 1, gridN do
            for iz = 1, gridN do
                local localX = (ix - 0.5 - gridN / 2) * cellSizeX * (1 - pad)
                local localZ = (iz - 0.5 - gridN / 2) * cellSizeZ * (1 - pad)
                local cf = floor.CFrame * CFrame.new(localX,
                                                     floor.Size.Y / 2 + 0.5,
                                                     localZ)
                local hits = workspace:GetPartBoundsInBox(cf, footprint, params)
                if #hits == 0 then
                    local pos  = cf.Position
                    -- reject cells inside a machine keep-out zone (XZ distance)
                    local blocked = false
                    if avoidZones then
                        for _, z in ipairs(avoidZones) do
                            local dx, dz = pos.X - z.pos.X, pos.Z - z.pos.Z
                            if (dx * dx + dz * dz) <= (z.radius * z.radius) then
                                blocked = true
                                break
                            end
                        end
                    end
                    if not blocked then
                        local dist = hintPos and (pos - hintPos).Magnitude or 0
                        table.insert(cells, { pos = pos, dist = dist })
                    end
                end
            end
            -- yield every few rows so a dense (32×32) scan doesn't freeze a frame
            if ix % 8 == 0 then task.wait() end
        end
        table.sort(cells, function(a, b) return a.dist < b.dist end)
        return cells
    end

    -- Phantom-pack guard (cumulative-lag fix): some pack keys keep a stale count
    -- in Data.Packs (inventory "shows 1" but the pack isn't really there). The
    -- engine used to retry them EVERY cycle — each retry is a full grid scan +
    -- failed Place, and phantoms pile up (≈1 per type placed), so lag grows over
    -- the session. We skip a key after it fails to place WHILE ROOM IS AVAILABLE
    -- across 2 cycles; we un-skip the instant its inventory count grows (a real
    -- pack arrived), plus a periodic full retry as a false-positive safety net.
    local placeSkip    = {}   -- server key -> owned count when we gave up (skip while owned <= it)
    local placeFailCyc = {}   -- server key -> consecutive failed-with-room cycles
    local skipClearTick = 0

    while getgenv()._ACCRunning do
        skipClearTick = skipClearTick + 1
        if skipClearTick >= 30 then   -- ~1 min: retry skipped packs (recover false positives)
            skipClearTick, placeSkip, placeFailCyc = 0, {}, {}
        end
        local placeSel = (_ACC._FarmPlacing and _ACC._FarmPlacePacks) or _ACC.SelectedPlacePacks
        if (_ACC.AutoPlaceEnabled or _ACC._FarmPlacing) and not mapEmpty(placeSel) then
            safe(function()
                local replica = Data.GetReplica()
                if not (replica and replica.Data) then return end
                local placed     = replica.Data.PacksPlaced or {}
                local ownedPacks = replica.Data.Packs       or {}
                local maxP       = replica.Data.MaxPlacements or 25

                local used = numPacksPlaced(placed)
                local free = maxP - used
                if free < 1 then return end

                local char = LocalPlayer.Character
                local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local plotModel = Plot.GetModel()
                local floor = plotModel and plotModel:FindFirstChild("Misc")
                              and plotModel.Misc:FindFirstChild("Floor")
                if not floor then return end

                -- keep-out zones around plot machines (prompt UI is annoying)
                local avoidZones = buildAvoidZones(plotModel)

                -- build candidate list (unique pack types user selected, owned > 0)
                local toPlace = {}
                for displayName in pairs(placeSel) do
                    local serverName = displayName:gsub(" ", "-")
                    local isBundle   = serverName:match("%-Bundle$") ~= nil
                    local slotCost   = isBundle and 5 or 1
                    local owned      = ownedPacks[serverName] or 0
                    -- inventory grew past the skip mark → real packs arrived, retry it
                    if placeSkip[serverName] and owned > placeSkip[serverName] then
                        placeSkip[serverName], placeFailCyc[serverName] = nil, nil
                    end
                    if owned > (_ACC.PlaceSkipSingles and 1 or 0) and not placeSkip[serverName] then
                        local page, rIdx, family, rarity = priorityOf(displayName)
                        table.insert(toPlace, {
                            server   = serverName,
                            display  = displayName,
                            page     = page,
                            rIdx     = rIdx,
                            family   = family,
                            rarity   = rarity,
                            isBundle = isBundle,
                            slotCost = slotCost,
                        })
                    end
                end
                if #toPlace == 0 then
                    if _ACC.Debug then warn("[ACC AutoPlace] none owned") end
                    return
                end

                -- Sort: family Page DESC -> rarity DESC -> pack-before-bundle.
                -- Rarity priority is highest-first per user spec:
                --   Rainbow > Diamond > Void > Emerald > Gold > Regular
                -- Within the same rarity the un-bundled pack goes first.
                -- Example (Pirate selected, all variants) — placement order:
                --   Pirate Rainbow -> Pirate Rainbow Bundle ->
                --   Pirate Diamond -> Pirate Diamond Bundle -> ... ->
                --   Pirate -> Pirate Regular Bundle
                table.sort(toPlace, function(a, b)
                    if a.page  ~= b.page  then return a.page > b.page  end   -- newer family first
                    if a.rIdx  ~= b.rIdx  then return a.rIdx > b.rIdx  end   -- HIGH rarity first
                    if a.isBundle ~= b.isBundle then return not a.isBundle end -- pack before bundle
                    return false
                end)

                local startCFrame = hrp.CFrame
                local totalPlaced = 0
                local lastEquipped

                -- ── Serpentine placement grid — built ONCE per cycle ───────────
                -- Walk a fixed snake grid over the floor placing one pack per cell
                -- (like a human auto-clicking corner→corner→shift→back). Cells are
                -- spaced > footprint + character clearance so the player never lands
                -- ON an already-placed pack (that was the cause of failed Places),
                -- with only a 0.5-stud edge inset (server just needs you on-floor).
                -- Machine keep-out zones are removed by a distance check (no scan),
                -- and ONE overlap pass marks cells blocked by PRE-EXISTING packs
                -- (skipped entirely when the board starts empty). After this there
                -- are ZERO grid scans while placing — the per-pack full-grid scan
                -- was the cumulative-lag source.
                local STEP
                do
                    local mx = 0
                    for _, e in ipairs(toPlace) do
                        local fp = entryFootprint(e)
                        mx = math.max(mx, fp.X, fp.Z)
                    end
                    STEP = mx + PACK_SPACING   -- footprint + small gap (tight; player drops in from +3 so no side clearance needed, avoid-zones handle machine hits)
                end
                local freeGrid, gridIdx = {}, 1
                do
                    local pad = 0.5                                  -- only need ~0.5 stud off the edge
                    local cols = math.max(1, math.floor((floor.Size.X - pad * 2) / STEP))
                    local rows = math.max(1, math.floor((floor.Size.Z - pad * 2) / STEP))
                    local raw = {}
                    for r = 0, rows - 1 do
                        local zr = (r + 0.5 - rows / 2) * STEP
                        if r % 2 == 0 then
                            for c = 0, cols - 1 do raw[#raw + 1] = Vector3.new((c + 0.5 - cols / 2) * STEP, floor.Size.Y / 2 + 0.5, zr) end
                        else
                            for c = cols - 1, 0, -1 do raw[#raw + 1] = Vector3.new((c + 0.5 - cols / 2) * STEP, floor.Size.Y / 2 + 0.5, zr) end
                        end
                    end
                    local params      = buildPlayerPackParams(plotModel)
                    local probeFP     = Vector3.new(math.max(1, STEP - PACK_SPACING), 0.5, math.max(1, STEP - PACK_SPACING))
                    local boardEmpty  = used <= 0   -- fresh board → no occupancy scan needed at all
                    for i, lp in ipairs(raw) do
                        local cf  = floor.CFrame * CFrame.new(lp.X, lp.Y, lp.Z)
                        local pos = cf.Position
                        local blocked = false
                        if avoidZones then
                            for _, z in ipairs(avoidZones) do
                                local dx, dz = pos.X - z.pos.X, pos.Z - z.pos.Z
                                if (dx * dx + dz * dz) <= z.radius * z.radius then blocked = true; break end
                            end
                        end
                        if not blocked and not boardEmpty then
                            if #workspace:GetPartBoundsInBox(cf, probeFP, params) > 0 then blocked = true end
                        end
                        if not blocked then freeGrid[#freeGrid + 1] = pos end
                        if i % 40 == 0 then task.wait() end   -- yield so the single pass never frame-hitches
                    end
                end

                for _, entry in ipairs(toPlace) do
                    if not (_ACC.AutoPlaceEnabled or _ACC._FarmPlacing) or not getgenv()._ACCRunning then break end

                    local stillOwned = ownedPacks[entry.server] or 0
                    if stillOwned <= 0 or free < entry.slotCost then
                        -- skip but DON'T break — a later entry may still fit
                    else
                        -- Equip is required: every Place callsite in the game
                        -- decompile (L27256, L27272, L27373) checks the
                        -- equipped slot; without prior Equip server-side state
                        -- isn't aligned and Place silently no-ops. Equip once
                        -- per stack (skip when already equipped).
                        if lastEquipped ~= entry.server then
                            Net.Fire(R.Card, "Equip", entry.server)
                            lastEquipped = entry.server
                            task.wait(0.25)
                        end

                        local consecFails   = 0
                        local failedWithRoom = false   -- broke because Place kept failing though cells existed
                        local placedHere    = 0
                        local FAIL_LIMIT    = 4

                        -- GENERAL cap on USED slots (singles AND bundles): place
                        -- only while used + this pack's slotCost stays <= cap.
                        local cap     = math.min(tonumber(_ACC.SinglePlaceCap) or maxP, maxP)
                        local minFree = math.max(entry.slotCost, maxP - cap + entry.slotCost)
                        local placeFloor = _ACC.PlaceSkipSingles and 1 or 0   -- leave the last (count==1) → no phantom attempts

                        -- Place into the pre-built serpentine grid via a SHARED
                        -- cursor (cells consumed across all entries this cycle).
                        -- No scanning here — cells are already validated + spaced.
                        while stillOwned > placeFloor
                              and free >= minFree
                              and gridIdx <= #freeGrid
                              and (_ACC.AutoPlaceEnabled or _ACC._FarmPlacing)
                              and getgenv()._ACCRunning
                        do
                            local cellPos = freeGrid[gridIdx]
                            gridIdx = gridIdx + 1                 -- consume the cell (shared across entries)
                            hrp.CFrame = CFrame.new(cellPos + Vector3.new(0, 3, 0))
                            task.wait(0.12)

                            local repB = Data.GetReplica()
                            local before = 0
                            if repB and repB.Data and repB.Data.PacksPlaced then
                                for _ in pairs(repB.Data.PacksPlaced) do before = before + 1 end
                            end

                            Net.Fire(R.Card, "Place", entry.server)
                            task.wait(0.45)   -- wait for server replication

                            local rep2 = Data.GetReplica()
                            local rd2  = rep2 and rep2.Data
                            local now  = 0
                            if rd2 and rd2.PacksPlaced then for _ in pairs(rd2.PacksPlaced) do now = now + 1 end end

                            if now > before then
                                free        = free - entry.slotCost
                                placedHere  = placedHere + 1
                                totalPlaced = totalPlaced + 1
                                consecFails = 0
                                ownedPacks  = rd2 and rd2.Packs or ownedPacks
                                stillOwned  = ownedPacks[entry.server] or 0
                            else
                                consecFails = consecFails + 1
                                if consecFails >= FAIL_LIMIT then
                                    failedWithRoom = true   -- cells existed but Place never took → phantom signal
                                    break
                                end
                            end
                        end

                        if _ACC.Debug and placedHere > 0 then
                            warn(("[ACC AutoPlace] %s × %d placed (free=%d, owned=%d)")
                                 :format(entry.server, placedHere, free, stillOwned))
                        end

                        -- phantom guard: placed nothing despite free room across 2
                        -- cycles → treat as a stale/phantom inventory count and skip
                        -- it (un-skipped automatically when its count grows).
                        if placedHere > 0 then
                            placeFailCyc[entry.server] = nil
                            placeSkip[entry.server]    = nil
                        elseif failedWithRoom then
                            placeFailCyc[entry.server] = (placeFailCyc[entry.server] or 0) + 1
                            if placeFailCyc[entry.server] >= 2 then
                                placeSkip[entry.server] = stillOwned
                                if _ACC.Debug then
                                    warn(("[ACC AutoPlace] %s unplaceable w/ room ×2 — skipping as phantom (owned=%d)")
                                         :format(entry.server, stillOwned))
                                end
                            end
                        end
                    end
                end

                if hrp.Parent then hrp.CFrame = startCFrame end

                if _ACC.Debug and totalPlaced > 0 then
                    warn(("[ACC AutoPlace] cycle done: placed %d packs total, %d slots free")
                         :format(totalPlaced, free))
                end
            end)
        end
        task.wait(2.0)
    end
end)

-- ============================================================================
-- // 19. LOOPS — COMBAT
-- ============================================================================

-- ── Tower auto start ──────────────────────────────────────────────────────
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.TowerAutoStart then
            local frame = PlayerGui:FindFirstChild("Tower")
                and PlayerGui.Tower:FindFirstChild("Frame")
            local battleVisible = frame and frame.Visible
            if not battleVisible then
                Net.FireRL(R.Tower, "Tower:EquipBest", 1.0, "EquipBest")
                task.wait(0.2)
                Net.FireRL(R.Tower, "Tower:Start", 1.0, "StartTower")
            end
        end
        task.wait(2)
    end
end)

-- ── Hide Battle (calls TowerHandler.HideBattle when in fight) ─────────────
-- Mirrors the in-game "Hide Battle" HUD button. While enabled, whenever
-- TowerHandler.InBattle becomes true we close the battle UI immediately.
task.spawn(function()
    local _tr = _ACC._tryRequire
    local TowerHandlerLocal = UIClient and _tr and _tr(UIClient:FindFirstChild("TowerHandler"))
    while getgenv()._ACCRunning do
        if _ACC.HideBattle and TowerHandlerLocal and TowerHandlerLocal.InBattle == true then
            safe(function()
                if type(TowerHandlerLocal.HideBattle) == "function" then
                    TowerHandlerLocal.HideBattle()
                end
            end)
        end
        task.wait(0.5)
    end
end)

-- ── Tower auto trait roll (focused roll per card) ─────────────────────────
-- Iterates selected cards once, but for each card keeps rolling until
-- a wanted trait drops (or tokens run out / user disables). Skips cards
-- that already have a wanted trait.
-- Server tolerates rapid Roll calls only when "ToggleAT" auto-mode is on
-- (this is what the in-game Auto Roll button toggles). Without it, server
-- treats it as if no UI is open and may reject. So we set ToggleAT(true)
-- before the sweep and ToggleAT(nil) after.
-- ── Shared roll engine ────────────────────────────────────────────────────
-- Drives the identical "iterate selected+owned targets, roll each until a
-- wanted value drops" skeleton shared by the Card Trait, Card Grade, Figurine
-- Grade and Figurine Trait loops. The variant-specific bits (flag, status
-- setter, selected/wanted maps, list ordering, currency gates, remote fire,
-- and every status string) are supplied by cfg. Behavior is byte-for-byte
-- identical to the previously-inlined loops.
--
-- cfg fields:
--   flag()        -> bool   the _ACC.Auto* enable flag (read fresh)
--   setStatus(t)  -> ()     status paragraph setter
--   selected()    -> map    selected targets (re-read each tick)
--   wanted()      -> map    wanted values (re-read each tick)
--   noTargetsMsg, noWantedMsg, noneOwnedMsg : guard cascade strings
--   preGuard()    -> bool?  optional extra top-level guard; if it returns
--                           truthy it has already set status and the sweep
--                           is skipped this tick
--   buildList()   -> {name} owned ∩ selected list in the variant's order
--   preSweep()    -> ()     optional, run once before the per-target sweep
--   rollOne(name, idx, total) -> bool : the inner while-body. Returns true to
--                           keep rolling this target (engine then waits 0.4),
--                           false to break to the next target.
--   postSweep()   -> ()     optional, run once after a non-empty sweep
--   loopWait      -> number per-tick wait (defaults 1.0)
local function runRollEngine(cfg)
    while getgenv()._ACCRunning do
        if not cfg.flag() then
            cfg.setStatus("Off")
        elseif mapEmpty(cfg.selected()) then
            cfg.setStatus(cfg.noTargetsMsg)
        elseif mapEmpty(cfg.wanted()) then
            cfg.setStatus(cfg.noWantedMsg)
        elseif cfg.preGuard and cfg.preGuard() then
            -- preGuard set its own status; skip the sweep this tick
        else
            local list = cfg.buildList()
            if #list == 0 then
                cfg.setStatus(cfg.noneOwnedMsg)
                task.wait(2.0)
            else
                if cfg.preSweep then cfg.preSweep() end
                local total = #list
                for idx, name in ipairs(list) do
                    if not cfg.flag() or not getgenv()._ACCRunning then break end
                    while cfg.flag() and getgenv()._ACCRunning do
                        if not cfg.rollOne(name, idx, total) then break end
                        task.wait(0.4)
                    end
                end
                if cfg.postSweep then cfg.postSweep() end
            end
        end
        task.wait(cfg.loopWait or 1.0)
    end
end

-- ── Trait/Grade roll loops ────────────────────────────────────────────────
-- Status reporters show what's currently being rolled and the live value
-- read directly from replica each iteration.

task.spawn(function()
    local SetStatus = function(t) if _ACC.SetTraitStatus then _ACC.SetTraitStatus(t) end end
    local function displayName(internal)
        return Lists.CardInternalToDisplay and Lists.CardInternalToDisplay[internal] or internal
    end
    local rolls = 0

    runRollEngine({
        flag      = function() return _ACC.AutoTrait end,
        setStatus = SetStatus,
        selected  = function() return _ACC.SelectedTraitCards end,
        wanted    = function() return _ACC.SelectedWantedTraits end,
        noTargetsMsg = "⚠ No cards selected",
        noWantedMsg  = "⚠ No wanted traits selected",
        noneOwnedMsg = "⚠ None of the selected cards are owned",
        preGuard = function()
            if (Data.Get("TraitTokens") or 0) <= 0 then
                SetStatus("⏸ Out of TraitTokens — waiting")
                return true
            end
            return false
        end,
        buildList = function()
            -- iterate Lists.Cards in IN-GAME ORDER (Pirate first, then Ninja...)
            -- and keep only cards that are both selected AND owned. This gives
            -- a deterministic Pack-by-Pack roll sequence.
            local selectAll = mapHas(_ACC.SelectedTraitCards, "All")
            local _rep = Data.GetReplica()
            local ownedCards = (_rep and _rep.Data and _rep.Data.Cards) or {}
            local list = {}
            for _, name in ipairs(Lists.Cards) do
                if (selectAll or _ACC.SelectedTraitCards[name]) and ownedCards[name] then
                    table.insert(list, name)
                end
            end
            if _ACC.TraitRollReverse then
                for i = 1, math.floor(#list / 2) do
                    list[i], list[#list - i + 1] = list[#list - i + 1], list[i]
                end
            end
            return list
        end,
        preSweep = function()
            Net.Fire(R.Tower, "ToggleAT", true)
            task.wait(0.1)
        end,
        rollOne = function(name, idx, total)
            local tokens = Data.Get("TraitTokens") or 0
            if tokens <= 0 then return false end
            local cd = Data.Get("Cards", name)
            if not cd then
                SetStatus(("⏭ %s — not owned, skipping"):format(displayName(name)))
                return false
            end
            local cur = cd.Trait
            if cur and mapHas(_ACC.SelectedWantedTraits, cur) then
                SetStatus(("✅ %s\nTrait: %s\n(card %d/%d done)\nRolls: %d  Tokens: %d")
                          :format(displayName(name), cur, idx, total, rolls, tokens))
                return false
            end
            SetStatus(("🎲 [%d/%d] %s\nCurrent: %s\nRolls: %d  Tokens: %d")
                      :format(idx, total, displayName(name),
                              cur or "(none)", rolls, tokens))
            -- final check before fire
            if not _ACC.AutoTrait or not getgenv()._ACCRunning then return false end
            Net.FireRL(R.Tower, "Tower:Roll:" .. name, 0.4, "Roll", name)
            rolls = rolls + 1
            return true
        end,
        postSweep = function()
            Net.Fire(R.Tower, "ToggleAT", nil)
            SetStatus(("✓ Sweep done\nRolls: %d  Tokens left: %d")
                      :format(rolls, Data.Get("TraitTokens") or 0))
        end,
        loopWait = 1.0,
    })
end)

-- ── Tower auto armor roll ─────────────────────────────────────────────────
-- ── Tower auto armor roll ─────────────────────────────────────────────────
-- Server signature: Tower:FireServer("Armor", piece, material). Server reads
-- Data.AutoArmorGrades — when current piece grade is in this list, server
-- treats it as Auto Stop. So we sync the list to contain exactly the wanted
-- grades user selected (toggle remote: AutoArmorGrade adds/removes one grade).
--
-- Materials are chosen best-to-worst (Diamond > Platinum > Gold > Silver >
-- Bronze). Loop picks first selected material with count >= 1 each iteration —
-- when Diamond runs out it falls through to Platinum, etc.
task.spawn(function()
    local SetStatus = function(t) if _ACC.SetArmorStatus then _ACC.SetArmorStatus(t) end end
    local ARMOR_PIECES = { "Helmet", "Necklace", "Chestplate", "Gauntlets", "Sword", "Shoes" }
    local MATERIAL_PRIORITY = { "Diamond", "Platinum", "Gold", "Silver", "Bronze" }
    local rolls = 0
    local lastSyncedKey

    local function gradeOf(entry)
        if type(entry) == "table" then return entry.Grade end
        return entry
    end

    local function pickMaterial(rd)
        local mats = (rd and rd.Materials) or {}
        local picked = _ACC.ArmorMaterials or {}
        for _, m in ipairs(MATERIAL_PRIORITY) do
            if picked[m] and (mats[m] or 0) >= 1 then
                return m, mats[m]
            end
        end
        return nil, 0
    end

    -- sync server's AutoArmorGrades to match user wanted grades exactly
    local function syncAutoStopList(wanted)
        local key = ""
        local wantedKeys = {}
        for g in pairs(wanted) do table.insert(wantedKeys, g) end
        table.sort(wantedKeys)
        key = table.concat(wantedKeys, ",")
        if key == lastSyncedKey then return end

        local replica = Data.GetReplica()
        local cur = (replica and replica.Data and replica.Data.AutoArmorGrades) or {}
        local has = {}
        for _, g in ipairs(cur) do has[g] = true end
        -- remove anything that's not wanted
        for g in pairs(has) do
            if not wanted[g] then
                Net.Fire(R.Tower, "AutoArmorGrade", g)
                task.wait(0.1)
            end
        end
        -- add wanted that aren't yet in list
        for g in pairs(wanted) do
            if not has[g] then
                Net.Fire(R.Tower, "AutoArmorGrade", g)
                task.wait(0.1)
            end
        end
        lastSyncedKey = key
    end

    while getgenv()._ACCRunning do
        local replica = Data.GetReplica()
        local rd      = replica and replica.Data
        local armor   = (rd and rd.Armor) or {}
        local wanted  = _ACC.WantedArmorGrades or {}

        local pieceCount = 0
        for _ in pairs(armor) do pieceCount = pieceCount + 1 end

        -- per-piece overview
        local lines = {}
        local needsRoll
        for _, piece in ipairs(ARMOR_PIECES) do
            local entry = armor[piece]
            if entry ~= nil then
                local g = tostring(gradeOf(entry) or "-")
                local marker
                if wanted[g] then
                    marker = "✅"
                else
                    marker = "▫"
                    if not needsRoll then needsRoll = piece end
                end
                table.insert(lines, ("%s %-11s %s"):format(marker, piece, g))
            end
        end

        if not _ACC.AutoArmor then
            if pieceCount == 0 then
                SetStatus("Off\n\n(no armor pieces yet)")
            else
                SetStatus("Off\n\n" .. table.concat(lines, "\n"))
            end
        elseif pieceCount == 0 then
            SetStatus("⚠ Data.Armor is empty\nVisit Tower to acquire pieces")
        elseif mapEmpty(wanted) then
            SetStatus("⚠ Select wanted grades first\n\n" .. table.concat(lines, "\n"))
        elseif mapEmpty(_ACC.ArmorMaterials) then
            SetStatus("⚠ Select at least one material\n\n" .. table.concat(lines, "\n"))
        else
            local material, matCount = pickMaterial(rd)
            if not material then
                -- show what materials are picked but exhausted
                local picked = {}
                for _, m in ipairs(MATERIAL_PRIORITY) do
                    if _ACC.ArmorMaterials[m] then
                        local c = (rd and rd.Materials and rd.Materials[m]) or 0
                        table.insert(picked, ("%s: %d"):format(m, c))
                    end
                end
                SetStatus(("⏸ All selected materials exhausted\n%s\n\n%s")
                          :format(table.concat(picked, "  "), table.concat(lines, "\n")))
            elseif not needsRoll then
                SetStatus(("✅ All pieces match wanted\nRolls: %d  %s left: %d\n\n%s")
                          :format(rolls, material, matCount, table.concat(lines, "\n")))
            else
                syncAutoStopList(wanted)

                local cur = tostring(gradeOf(armor[needsRoll]) or "-")
                for i, line in ipairs(lines) do
                    if line:find(needsRoll, 1, true) and line:sub(1, 1) == "▫" then
                        lines[i] = line:gsub("^▫", "🎲", 1)
                        break
                    end
                end

                local wantedList = {}
                for g in pairs(wanted) do table.insert(wantedList, g) end
                table.sort(wantedList)

                SetStatus(("🎲 Rolling %s\nCurrent: %s\nWanted: %s\nMaterial: %s (%d left)\nRolls: %d\n\n%s")
                          :format(needsRoll, cur, table.concat(wantedList, ", "),
                                  material, matCount, rolls, table.concat(lines, "\n")))
                if _ACC.Debug then
                    print(("[ACC Armor] piece=%s material=%s curGrade=%s mat=%d")
                          :format(needsRoll, material, cur, matCount))
                end

                if not _ACC.AutoArmor or not getgenv()._ACCRunning then
                    -- toggle disabled during wait window
                else
                    Net.FireRL(R.Tower, "Tower:Armor:" .. needsRoll, 0.4, "Armor", needsRoll, material)
                    rolls = rolls + 1
                end
            end
        end
        task.wait(0.5)
    end
end)

-- ── Star Trial helpers ────────────────────────────────────────────────────
local function inDungeon()
    local map = Workspace:FindFirstChild("Map")
    local d   = map and map:FindFirstChild("StarTrial") and map.StarTrial:FindFirstChild("Dungeon")
    local sp  = d and d:FindFirstChild("EnemySpawns")
        and d.EnemySpawns:FindFirstChild(tostring(LocalPlayer.UserId))
    return sp ~= nil, sp
end

task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.STAutoStart and _ACC.STSelectedCard and _ACC.STSelectedDifficulty then
            if not inDungeon() then
                Net.FireRL(R.StarTrial, "ST:Start", 5,
                           "Start", _ACC.STSelectedDifficulty, tostring(_ACC.STSelectedCard))
            end
        end
        task.wait(2)
    end
end)

task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.STAutoAttack then
            local active, spawns = inDungeon()
            if active and spawns then
                if StarTrialHandler then
                    StarTrialHandler.InBattle = false
                    StarTrialHandler.InTrial  = false
                    StarTrialHandler.StartTime = nil
                end
                for _, child in ipairs(spawns:GetDescendants()) do
                    if not _ACC.STAutoAttack or not getgenv()._ACCRunning then break end
                    if child:IsA("BasePart") and child:FindFirstChildOfClass("ProximityPrompt") then
                        local idx = child.Name:match("%d+")
                        if idx then
                            Net.FireRL(R.StarTrial, "ST:Challenge:" .. idx, 0.2,
                                       "Challenge", tostring(idx))
                            task.wait(0.05)
                            Net.FireRL(R.StarTrial, "ST:Done:" .. idx, 0.2,
                                       "AttackDone", tostring(idx))
                        end
                    end
                end
            end
        end
        task.wait(0.4)
    end
end)

-- ── Auto Star Evolve ──────────────────────────────────────────────────────
-- Walks selected cards and evolves them up to ⭐5 by:
--   1. Reading nextStar requirements from StarTrialConfig.StarEvolutions
--   2. Running trials at the required difficulty until 5 completions
--   3. Once Completions and Currency both met → fire "Star" to evolve
-- Stays on the same card until ⭐5 OR 3 consecutive fails on a difficulty
-- (then marks card+difficulty as failed, moves on).
-- Auto-enables _ACC.STAutoAttack while running so trials actually win.
task.spawn(function()
    local SetStatus = function(t) if _ACC.SetStarEvolveStatus then _ACC.SetStarEvolveStatus(t) end end
    local function displayName(internal)
        return Lists.CardInternalToDisplay and Lists.CardInternalToDisplay[internal] or internal
    end

    -- StarTrialConfig.StarEvolutions: tonumberKey → {Currency, Completions}
    local function getEvolutionReq(nextStar)
        if not StarTrialConfig or not StarTrialConfig.StarEvolutions then return nil end
        return StarTrialConfig.StarEvolutions[tostring(nextStar)]
    end

    local TRIAL_TIMEOUT = 330   -- StarTrialConfig.Data.Time = 300, +30s buffer
    local FAIL_LIMIT    = 3
    local failed = {}           -- failed[card][diff] = true → skip this combo
    local function markFail(card, diff)
        failed[card] = failed[card] or {}
        failed[card][diff] = (failed[card][diff] or 0) + 1
        return failed[card][diff]
    end
    local function isFailed(card, diff)
        return failed[card] and (failed[card][diff] or 0) >= FAIL_LIMIT
    end

    while getgenv()._ACCRunning do
        if not _ACC.AutoStarEvolve then
            SetStatus("Off")
            task.wait(1.0)
        elseif mapEmpty(_ACC.StarEvolveCards) then
            SetStatus("⚠ Select cards to evolve first")
            task.wait(1.5)
        else
            -- ensure auto-attack is on so trials actually clear
            if not _ACC.STAutoAttack then
                _ACC.STAutoAttack = true
                pcall(function()
                    if MacLib.Options.STAutoAttackToggle
                       and MacLib.Options.STAutoAttackToggle.UpdateState then
                        MacLib.Options.STAutoAttackToggle:UpdateState(true)
                    end
                end)
            end

            -- build candidate list in in-game order, owned only
            local replica  = Data.GetReplica()
            local rd       = replica and replica.Data
            local owned    = (rd and rd.Cards) or {}
            local starData = (rd and rd.StarData) or {}
            local starCur  = (rd and rd.StarCurrency) or {}

            local candidates = {}
            for _, name in ipairs(Lists.Cards) do
                if _ACC.StarEvolveCards[name] and owned[name] then
                    table.insert(candidates, name)
                end
            end

            if #candidates == 0 then
                SetStatus("⚠ None of selected cards are owned")
                task.wait(2.0)
            else
                local processed = false
                for _, name in ipairs(candidates) do
                    if not _ACC.AutoStarEvolve or not getgenv()._ACCRunning then break end

                    local cardData = owned[name]
                    local curStar  = tonumber(cardData.Star or 0) or 0
                    if curStar >= 5 then
                        -- already maxed
                    else
                        local nextStar = curStar + 1
                        local req = getEvolutionReq(nextStar)
                        if not req then break end

                        -- which difficulty needed for completions
                        local targetDiff, neededComps
                        for diff, cnt in pairs(req.Completions or {}) do
                            targetDiff   = diff
                            neededComps  = cnt
                            break
                        end

                        if isFailed(name, targetDiff) then
                            SetStatus(("⚠ %s — too weak for %s (%d fails), skipping")
                                      :format(displayName(name), targetDiff, FAIL_LIMIT))
                            task.wait(1.0)
                        else
                            local cardStarData = starData[name] or {}
                            local doneComps    = cardStarData[targetDiff] or 0

                            local currencyOK = true
                            local missingCur = {}
                            for cur, amt in pairs(req.Currency or {}) do
                                local have = starCur[cur] or 0
                                if have < amt then
                                    currencyOK = false
                                    table.insert(missingCur, ("%s %d/%d"):format(cur, have, amt))
                                end
                            end

                            if doneComps >= neededComps and currencyOK then
                                -- READY to evolve
                                SetStatus(("🌟 %s ⭐%d → ⭐%d\nEvolving..."):format(
                                    displayName(name), curStar, nextStar))
                                Net.Fire(R.StarTrial, "Star", name)
                                task.wait(1.5)
                                processed = true
                                break  -- restart outer loop, same card likely now ⭐+1
                            else
                                -- need more trials OR currency from trials
                                local before = doneComps
                                local stage  = (doneComps < neededComps)
                                    and ("Completions: %d/%d"):format(doneComps, neededComps)
                                    or  ("Need currency: " .. table.concat(missingCur, ", "))

                                SetStatus(("🎲 %s ⭐%d → ⭐%d\nRunning %s\n%s\nFails so far: %d/%d")
                                    :format(displayName(name), curStar, nextStar, targetDiff,
                                            stage,
                                            (failed[name] and failed[name][targetDiff]) or 0,
                                            FAIL_LIMIT))

                                -- launch the trial
                                _ACC.STSelectedCard       = name
                                _ACC.STSelectedDifficulty = targetDiff
                                Net.Fire(R.StarTrial, "Start", targetDiff, name)
                                task.wait(2.0)   -- let the trial UI come up

                                -- locate the Results panel — same frame shows on win AND loss
                                local resultsFrame
                                pcall(function()
                                    local stGui = PlayerGui:FindFirstChild("StarTrial")
                                    local f = stGui and stGui:FindFirstChild("Frame")
                                    resultsFrame = f and f:FindFirstChild("Results")
                                end)

                                -- wait for trial end: Results panel shown OR completions grew OR timeout
                                local elapsed = 0
                                while elapsed < TRIAL_TIMEOUT do
                                    if not _ACC.AutoStarEvolve or not getgenv()._ACCRunning then break end
                                    task.wait(2)
                                    elapsed = elapsed + 2

                                    -- end-of-trial signal: results panel becomes visible
                                    if resultsFrame and resultsFrame.Visible then break end

                                    -- (also catch direct counter increase as backup)
                                    local newRep = Data.GetReplica()
                                    local nowComps = (newRep and newRep.Data
                                                      and newRep.Data.StarData
                                                      and newRep.Data.StarData[name]
                                                      and newRep.Data.StarData[name][targetDiff]) or 0
                                    if nowComps > before then break end

                                    SetStatus(("🎲 %s ⭐%d → ⭐%d\nTrial: %s (%ds left)\nCompletions: %d → %d/%d")
                                        :format(displayName(name), curStar, nextStar, targetDiff,
                                                TRIAL_TIMEOUT - elapsed, before, nowComps, neededComps))
                                end

                                -- give server a beat to commit any counter increment
                                task.wait(1.0)

                                -- evaluate result: counter delta is authoritative
                                local rep2 = Data.GetReplica()
                                local after = (rep2 and rep2.Data and rep2.Data.StarData
                                               and rep2.Data.StarData[name]
                                               and rep2.Data.StarData[name][targetDiff]) or 0
                                if after > before then
                                    failed[name] = failed[name] or {}
                                    failed[name][targetDiff] = 0
                                    SetStatus(("✓ %s — %s WON (%d/%d)")
                                        :format(displayName(name), targetDiff, after, neededComps))
                                else
                                    local fc = markFail(name, targetDiff)
                                    SetStatus(("✗ %s — %s LOST (fail %d/%d)")
                                        :format(displayName(name), targetDiff, fc, FAIL_LIMIT))
                                end
                                task.wait(2.0)
                                processed = true
                                break -- restart with fresh data
                            end
                        end
                    end
                end

                if not processed then
                    -- nothing actionable in this pass — maybe all maxed/failed
                    local maxed, failedCnt = 0, 0
                    for _, name in ipairs(candidates) do
                        local cs = tonumber((owned[name] or {}).Star or 0) or 0
                        if cs >= 5 then maxed = maxed + 1 end
                        if failed[name] then
                            for _, f in pairs(failed[name]) do
                                if f >= FAIL_LIMIT then failedCnt = failedCnt + 1; break end
                            end
                        end
                    end
                    SetStatus(("✓ Nothing to do\nMaxed ⭐5: %d  Stuck: %d  Total selected: %d")
                        :format(maxed, failedCnt, #candidates))
                    task.wait(5)
                end
            end
        end
    end
end)

-- ── Star Upgrades auto-buy ────────────────────────────────────────────────
-- Each upgrade is bought via R.StarTrial:FireServer("Upgrade", upgradeName).
-- Costs scale per level — we always try, server rejects if not enough.
-- Cost source is StarCurrency.Tokens (and StarTickets for TicketChance).
task.spawn(function()
    while getgenv()._ACCRunning do
        local picks = {}
        if _ACC.STUpgDamage        then table.insert(picks, "Damage")        end
        if _ACC.STUpgHealth        then table.insert(picks, "Health")        end
        if _ACC.STUpgBattleSpeed   then table.insert(picks, "BattleSpeed")   end
        if _ACC.STUpgTicketChance  then table.insert(picks, "TicketChance")  end

        if #picks > 0 then
            for _, name in ipairs(picks) do
                if not getgenv()._ACCRunning then break end
                Net.FireRL(R.StarTrial, "ST:Upg:" .. name, 1.0, "Upgrade", name)
                task.wait(0.3)
            end
        end
        task.wait(2.0)
    end
end)
-- Grade has no server-side AutoToggle remote — Roll is accepted directly.
task.spawn(function()
    local SetStatus = function(t) if _ACC.SetGradeStatus then _ACC.SetGradeStatus(t) end end
    local function displayName(internal)
        return Lists.CardInternalToDisplay and Lists.CardInternalToDisplay[internal] or internal
    end
    local rolls = 0

    runRollEngine({
        flag      = function() return _ACC.AutoGrade end,
        setStatus = SetStatus,
        selected  = function() return _ACC.SelectedGradeCards end,
        wanted    = function() return _ACC.SelectedWantedGrades end,
        noTargetsMsg = "⚠ No cards selected",
        noWantedMsg  = "⚠ No wanted grades selected",
        noneOwnedMsg = "⚠ None of the selected cards are owned",
        buildList = function()
            -- iterate Lists.Cards in IN-GAME ORDER, keep only selected+owned
            local selectAll = mapHas(_ACC.SelectedGradeCards, "All")
            local _rep = Data.GetReplica()
            local ownedCards = (_rep and _rep.Data and _rep.Data.Cards) or {}
            local list = {}
            for _, n in ipairs(Lists.Cards) do
                if (selectAll or _ACC.SelectedGradeCards[n]) and ownedCards[n] then
                    table.insert(list, n)
                end
            end
            if _ACC.GradeRollReverse then
                for i = 1, math.floor(#list / 2) do
                    list[i], list[#list - i + 1] = list[#list - i + 1], list[i]
                end
            end
            return list
        end,
        rollOne = function(name, idx, total)
            -- re-check immediately before any fire (wait window may have ended toggle)
            if not _ACC.AutoGrade then return false end
            local replica = Data.GetReplica()
            local cd = replica and replica.Data and replica.Data.Cards
                       and replica.Data.Cards[name]
            if not cd then
                SetStatus(("⏭ %s — not owned"):format(displayName(name)))
                return false
            end
            local curGrade = cd.Grade
            if curGrade and mapHas(_ACC.SelectedWantedGrades, curGrade) then
                SetStatus(("✅ %s\nGrade: %s\n(card %d/%d done)\nRolls: %d")
                          :format(displayName(name), curGrade, idx, total, rolls))
                return false
            end
            local tokens = (replica and replica.Data and replica.Data.GradeTokens) or 0
            local cash   = (replica and replica.Data and replica.Data.Cash) or 0
            local source, using
            if _ACC.GradeUseTokensFirst and tokens > 0 then
                source = "Tokens"; using = ("Tokens: %d"):format(tokens)
            else
                using = "Cash"
            end

            SetStatus(("🎲 [%d/%d] %s\nCurrent: %s\nUsing: %s\nRolls: %d\nCash: %s")
                      :format(idx, total, displayName(name),
                              tostring(curGrade or "(none)"),
                              using, rolls, tostring(cash)))
            if _ACC.Debug then
                print(("[ACC Grade] %s | grade=%s | rolls=%d | source=%s")
                      :format(name, tostring(curGrade), rolls, tostring(source)))
            end

            -- final check before fire
            if not _ACC.AutoGrade or not getgenv()._ACCRunning then return false end
            Net.FireRL(R.Grade, "Grade:Roll:" .. name, 0.4, "Roll", name, source)
            rolls = rolls + 1
            return true
        end,
        postSweep = function()
            SetStatus(("✓ Sweep done\nRolls: %d"):format(rolls))
        end,
        loopWait = 1.0,
    })
end)

-- ── Auto Raid Farm ────────────────────────────────────────────────────────
-- State machine: VOTE → JOIN → IN_RAID → RESULT → cooldown
--
-- Server gating from RaidHandler decompile:
--   * Vote phase: workspace:GetAttribute("RaidVoteTime") ~= nil
--   * Join phase: RaidHandler.RaidActive == true
--   * Cooldown:  workspace:GetServerTimeNow() - Data.RaidJoinTime >= RaidJoinWait (600s)
--   * Cards param to "Join": ARRAY of internal names (not map)
--
-- Win/loss detection (per user spec):
--   MangaTokens > before  → "we tanked it" — reset fail counter
--   MangaTokens unchanged → real loss (died in first seconds, no damage)
-- RaidsDefeated.Packs[raid] only goes up on full kill — used for stats only.
task.spawn(function()
    local SetStatus = function(t) if _ACC.SetRaidStatus then _ACC.SetRaidStatus(t) end end
    local FAIL_LIMIT = 3
    local failed = {}    -- failed[raidName] = consecutive zero-manga losses

    -- locate handlers (RaidHandler.RaidActive, StarTrialHandler.InTrial)
    local tryReq = _ACC._tryRequire
    local UIC = RS:FindFirstChild("Client")
                and RS.Client:FindFirstChild("UI")
    local raidH  = UIC and tryReq and tryReq(UIC:FindFirstChild("RaidHandler"))
    local stockH = UIC and tryReq and tryReq(UIC:FindFirstChild("StockHandler"))

    -- m:ss formatter
    local function fmtMinSec(secs)
        secs = math.max(0, math.ceil(secs or 0))
        return ("%d:%02d"):format(math.floor(secs / 60), secs % 60)
    end

    -- load Multipliers utility module (used by game's own EquipBest)
    local multipliers
    pcall(function()
        local mod = RS:FindFirstChild("Modules")
                    and RS.Modules:FindFirstChild("Shared")
                    and RS.Modules.Shared:FindFirstChild("Multipliers")
        multipliers = mod and tryReq and tryReq(mod)
    end)

    -- mirror of game's EquipBest (line 35549 in decompile):
    -- For each card in CardConfig.Packs[raidName].List that we own, compute
    -- multiplier = TowerCashPerSecond(cash, mut, lvl, grade, star) * TraitHealthBuff
    -- Sort desc, return top 3 internal names.
    local function computeEquipBest(raidName)
        if not raidName then return nil end
        if not (CardConfig and CardConfig.Packs and CardConfig.Packs[raidName]) then
            return nil
        end
        local rep = Data.GetReplica()
        local owned = rep and rep.Data and rep.Data.Cards
        if type(owned) ~= "table" then return nil end

        local list = CardConfig.Packs[raidName].List
        if type(list) ~= "table" then return nil end

        local scored = {}
        for cardName, packEntry in pairs(list) do
            local cd = owned[cardName]
            if cd and packEntry and packEntry.Cash then
                local score = 0
                if multipliers and multipliers.GetTowerCashPerSecond then
                    pcall(function()
                        local cps = multipliers.GetTowerCashPerSecond(packEntry.Cash,
                            cd.Mutation, cd.Level, cd.Grade, cd.Star)
                        local trait = 1
                        if multipliers.GetTraitBuff then
                            trait = multipliers.GetTraitBuff("Health", cd.Trait) or 1
                        end
                        score = math.ceil(cps * trait)
                    end)
                end
                if score == 0 then
                    -- fallback when Multipliers missing: cash × level proxy
                    score = (packEntry.Cash or 0) * (tonumber(cd.Level) or 1)
                end
                table.insert(scored, { name = cardName, mult = score })
            end
        end

        table.sort(scored, function(a, b) return a.mult > b.mult end)

        local top = {}
        for i = 1, math.min(3, #scored) do
            table.insert(top, scored[i].name)
        end
        return (#top > 0) and top or nil
    end

    -- Grind targets per raid pack: highest card Layout in the pack. A card
    -- needs RaidsDefeated.Packs[pack] >= its Layout to qualify for Manga, so
    -- grinding to the MAX layout clears the raid-defeat requirement for every
    -- card in that pack at once.
    local RaidMaxLayout = {}
    if CardConfig and CardConfig.Packs then
        for packName, packData in pairs(CardConfig.Packs) do
            if type(packData) == "table" and type(packData.List) == "table" then
                local mx = 0
                for _, info in pairs(packData.List) do
                    local l = (type(info) == "table" and info.Layout) or 0
                    if l > mx then mx = l end
                end
                RaidMaxLayout[packName] = mx
            end
        end
    end

    -- Is this raid's grind target already met (badge owned / defeats reached)?
    local function gridTargetMet(raid)
        if _ACC.RaidMode == "Grind badges (each raid 1x)" then
            local badges = Data.Get("RaidBadges") or {}
            if type(badges) == "table" then
                for _, b in ipairs(badges) do if b == raid then return true end end
            end
            -- fallback if badge list not populated yet: 1 defeat = badge earned
            return ((Data.Get("RaidsDefeated", "Packs", raid)) or 0) >= 1
        elseif _ACC.RaidMode == "Grind manga (each raid to max card layout)" then
            local need = RaidMaxLayout[raid] or 0
            return need > 0 and ((Data.Get("RaidsDefeated", "Packs", raid)) or 0) >= need
        end
        return false
    end

    local function pickRaid()
        local active = (RaidConfig and RaidConfig.ActiveRaids) or {}
        local base   = (RaidConfig and RaidConfig.Base) or {}

        if _ACC.RaidMode == "Specific raid" and _ACC.RaidSpecific then
            for _, r in ipairs(active) do
                if r == _ACC.RaidSpecific then return r end
            end
            return nil
        end

        -- Grind modes: sweep EASIEST-first (lowest Base) among raids that
        -- aren't at target yet, aren't marked stuck, and we have a 3-card team
        -- for. pickRaid keeps returning the same raid until its target is met
        -- (or it fails out), so we grind one raid fully then move up.
        if _ACC.RaidMode == "Grind badges (each raid 1x)"
           or _ACC.RaidMode == "Grind manga (each raid to max card layout)"
        then
            local best, bestBase = nil, math.huge
            for _, r in ipairs(active) do
                if (failed[r] or 0) < FAIL_LIMIT and not gridTargetMet(r) then
                    local team = computeEquipBest(r)
                    if team and #team >= 3 and (base[r] or 0) < bestBase then
                        best, bestBase = r, base[r] or 0
                    end
                end
            end
            return best
        end

        -- Auto pick: max Base from raids where we actually own ≥3 cards
        -- (EquipBest needs 3 cards to send a full team)
        local best, bestBase = nil, -1
        for _, r in ipairs(active) do
            if (failed[r] or 0) < FAIL_LIMIT then
                local team = computeEquipBest(r)
                if team and #team >= 3 and (base[r] or 0) > bestBase then
                    best, bestBase = r, base[r] or 0
                end
            end
        end
        return best
    end

    -- Grind progress summary for status display (badges X/N, or packs done).
    local function gridProgress()
        local active = (RaidConfig and RaidConfig.ActiveRaids) or {}
        if _ACC.RaidMode == "Grind badges (each raid 1x)" then
            local badges = Data.Get("RaidBadges") or {}
            local have = (type(badges) == "table") and #badges or 0
            return ("Badges: %d/%d"):format(have, #active)
        elseif _ACC.RaidMode == "Grind manga (each raid to max card layout)" then
            local done = 0
            for _, r in ipairs(active) do if gridTargetMet(r) then done = done + 1 end end
            return ("Manga packs cleared: %d/%d"):format(done, #active)
        end
        return ""
    end
    _ACC._RaidGridProgress = gridProgress

    -- Vote dedup — vote only once per voting session.
    -- workspace.RaidVoteTime is the timestamp set when voting opens; it changes
    -- each session, so we use it as session id.
    local votedAtStamp

    -- Read which raid is currently active. Game's RaidHandler holds pack name
    -- in a local upvalue; not exposed. But it DOES expose RaidBossCard (the
    -- boss character name). We look up which pack that card belongs to.
    -- Fallback: PlayerGui.RaidSelect.Frame.PackName.Text (set during selection
    -- screen, may be empty after join).
    local function getActiveRaidName()
        -- 1) primary: derive from RaidBossCard via CardConfig.Packs
        if raidH and raidH.RaidBossCard and CardConfig and CardConfig.Packs then
            local boss = raidH.RaidBossCard
            for packName, packData in pairs(CardConfig.Packs) do
                if type(packData) == "table"
                   and type(packData.List) == "table"
                   and packData.List[boss]
                then
                    return packName
                end
            end
        end
        -- 2) fallback: RaidSelect UI label
        local ok, name = pcall(function()
            local f = PlayerGui:FindFirstChild("RaidSelect")
            f = f and f:FindFirstChild("Frame")
            local lbl = f and f:FindFirstChild("PackName")
            return lbl and lbl.Text or nil
        end)
        if ok and name and name ~= "" then return name end
        return nil
    end

    -- Dedicated fast Vote watcher: polls every 2s to never miss the 60s window.
    -- Fires once per voteTime stamp (same session id as main loop).
    task.spawn(function()
        while getgenv()._ACCRunning do
            if _ACC.AutoRaid then
                local voteTime = workspace:GetAttribute("RaidVoteTime")
                if voteTime and voteTime ~= votedAtStamp
                   and (not raidH or not raidH.RaidActive)
                then
                    local picked = pickRaid()
                    if picked then
                        Net.Fire(R.Raid, "Vote", picked)
                        votedAtStamp = voteTime
                        if _ACC.Debug then
                            print(("[ACC Raid] Vote fired: %s (voteTime=%s)")
                                :format(picked, tostring(voteTime)))
                        end
                    end
                end
            end
            task.wait(2)
        end
    end)

    while getgenv()._ACCRunning do
        if not _ACC.AutoRaid then
            SetStatus("Off")
            task.wait(1.0)
        else
            local picked = pickRaid()
            if not picked then
                local isGrind = _ACC.RaidMode == "Grind badges (each raid 1x)"
                    or _ACC.RaidMode == "Grind manga (each raid to max card layout)"
                if isGrind then
                    SetStatus(("✓ Grind complete (or no beatable raid left)\n%s")
                        :format(_ACC._RaidGridProgress and _ACC._RaidGridProgress() or ""))
                else
                    SetStatus("⚠ No raid available\n(all selected raids stuck or none active)")
                end
                task.wait(8)
            else
                local raidActive = (raidH and raidH.RaidActive) == true
                local voteTime   = workspace:GetAttribute("RaidVoteTime")
                local raidStartA = workspace:GetAttribute("RaidStart")
                local lastJoin   = Data.Get("RaidJoinTime") or 0
                local joinWait   = (RaidConfig and RaidConfig.RaidJoinWait) or 600
                local raidDur    = (RaidConfig and RaidConfig.RaidDuration) or 450
                local sinceJoin  = workspace:GetServerTimeNow() - lastJoin
                local now        = workspace:GetServerTimeNow()

                -- VOTE phase: only fire once per voting session.
                -- workspace.RaidVoteTime changes per session, used as session id.
                -- Vote duration is 60s (from decompile).
                if voteTime and not raidActive then
                    local voteLeft = math.max(0, math.ceil(60 - (now - voteTime)))
                    if voteTime ~= votedAtStamp then
                        Net.Fire(R.Raid, "Vote", picked)
                        votedAtStamp = voteTime
                        SetStatus(("🗳 VOTING — %ds left\nVoted for: %s\nMode: %s")
                                  :format(voteLeft, picked, _ACC.RaidMode))
                    else
                        SetStatus(("🗳 VOTING — %ds left\nAlready voted: %s")
                                  :format(voteLeft, picked))
                    end
                    task.wait(3)

                -- JOIN phase: detect what's actually active (server-decided)
                elseif raidActive then
                    local actualRaid = getActiveRaidName() or picked

                    -- Skip stuck raids (3 fails) even in Auto mode
                    if (failed[actualRaid] or 0) >= FAIL_LIMIT then
                        SetStatus(("⏸ %s is marked stuck\nWaiting for next cycle")
                                  :format(actualRaid))
                        task.wait(15)
                    elseif sinceJoin < joinWait then
                        local left = math.floor(joinWait - sinceJoin)
                        SetStatus(("⏸ Join cooldown: %ds left\nActive: %s")
                                  :format(left, actualRaid))
                        task.wait(5)
                    elseif raidH and raidH.InRaid then
                        -- already inside this raid; just wait it out
                        SetStatus(("⏳ Already in %s\nWaiting for completion")
                                  :format(actualRaid))
                        task.wait(10)
                    else
                        -- pick cards via EquipBest (top 3 from owned in this pack)
                        local cardsToUse
                        if _ACC.RaidEquipBest then
                            cardsToUse = computeEquipBest(actualRaid)
                        end
                        if not cardsToUse or #cardsToUse == 0 then
                            SetStatus(("⚠ No owned cards from %s pack to bring\nWait for next raid cycle")
                                      :format(actualRaid))
                            task.wait(15)
                        else
                            local beforeManga = Data.Get("MangaTokens") or 0
                            local beforeKill  = (Data.Get("RaidsDefeated", "Packs", actualRaid)) or 0

                            local cardLabel = (#cardsToUse <= 3) and table.concat(cardsToUse, ", ")
                                              or (("%d cards"):format(#cardsToUse))
                            SetStatus(("⚔ Joining %s\n%s%s\nFails: %d/%d  Manga: %d  Kills: %d")
                                      :format(actualRaid, cardLabel,
                                              _ACC.RaidEquipBest and " (auto-best)" or "",
                                              failed[actualRaid] or 0, FAIL_LIMIT,
                                              beforeManga, beforeKill))
                            Net.Fire(R.Raid, "Join", cardsToUse)
                            task.wait(5)

                        -- IN_RAID phase: wait until raid ends
                        local elapsed = 0
                        local timeout = ((RaidConfig and RaidConfig.RaidDuration) or 450) + 30
                        while elapsed < timeout do
                            if not _ACC.AutoRaid or not getgenv()._ACCRunning then break end
                            task.wait(5)
                            elapsed = elapsed + 5

                            local stillActive = raidH and raidH.RaidActive
                            local nowManga    = Data.Get("MangaTokens") or 0
                            local nowKill     = (Data.Get("RaidsDefeated", "Packs", actualRaid)) or 0

                            if not stillActive or nowKill > beforeKill or nowManga > beforeManga then
                                if elapsed > 30 then break end
                            end

                            SetStatus(("⚔ In %s (%ds left)\nManga: %d (+%d)  Kills: %d (+%d)")
                                      :format(actualRaid, timeout - elapsed,
                                              nowManga, nowManga - beforeManga,
                                              nowKill, nowKill - beforeKill))
                        end
                        task.wait(2)

                        -- RESULT
                        local afterManga = Data.Get("MangaTokens") or 0
                        local afterKill  = (Data.Get("RaidsDefeated", "Packs", actualRaid)) or 0
                        local mangaGain  = afterManga - beforeManga
                        local killed     = afterKill > beforeKill

                        if mangaGain > 0 then
                            failed[actualRaid] = 0
                            if killed then
                                SetStatus(("✓ %s KILLED\n+%d Manga  +1 kill (total %d)")
                                          :format(actualRaid, mangaGain, afterKill))
                            else
                                SetStatus(("✓ %s — partial damage\n+%d Manga (no kill)")
                                          :format(actualRaid, mangaGain))
                            end
                        else
                            failed[actualRaid] = (failed[actualRaid] or 0) + 1
                            SetStatus(("✗ %s TOTAL FAIL\n0 Manga (fail %d/%d)")
                                      :format(actualRaid, failed[actualRaid], FAIL_LIMIT))
                        end
                        task.wait(3)
                        end -- if no cards else
                    end

                -- IDLE — neither vote nor active raid
                else
                    -- next-raid timer comes from StockHandler.RaidTimeLeft
                    -- (game uses this for "Raid will start in X" notification)
                    local nextIn
                    if stockH and stockH.RaidTimeLeft and stockH.RaidTimeLeft > 0 then
                        nextIn = stockH.RaidTimeLeft
                    end

                    if sinceJoin < joinWait then
                        local cdLeft = math.ceil(joinWait - sinceJoin)
                        local extra = nextIn and ("\nNext raid in %s"):format(fmtMinSec(nextIn)) or ""
                        SetStatus(("⏸ JOIN COOLDOWN — %ds left%s\nNext target: %s")
                                  :format(cdLeft, extra, picked))
                    elseif raidStartA and (now - raidStartA) < raidDur then
                        local left = math.ceil(raidDur - (now - raidStartA))
                        SetStatus(("⚔ RAID IN PROGRESS — %ds left\nYou can still try to join: %s")
                                  :format(left, picked))
                    elseif nextIn then
                        SetStatus(("⏳ Next raid in %s\nNext target: %s")
                                  :format(fmtMinSec(nextIn), picked))
                    else
                        local lastJoinAge = (lastJoin > 0)
                            and (("%dm ago"):format(math.floor(sinceJoin / 60)))
                            or "never"
                        SetStatus(("⏸ Waiting for next raid cycle\nLast raid: %s\nNext target: %s")
                                  :format(lastJoinAge, picked))
                    end
                    task.wait(5)
                end
            end
        end
    end
end)
-- ============================================================================
-- // 20. LOOPS — AUTO CLAIM
-- ============================================================================

-- Achievements: real schema — Data.Achievements is an array of CLAIMED ids.
-- Available achievements live in Config.Rewards.AchievementConfig with
-- Category + Info + Requirement. We replicate the client-side progress
-- check helpers (from AchievementHandler) and Claim what's ready & unclaimed.
local AchievementConfig
do
    -- AchievementConfig sits at Modules.Config.Rewards.AchievementConfig
    local achMod = ModulesFolder
        :FindFirstChild("Config")
        and ModulesFolder.Config:FindFirstChild("Rewards")
        and ModulesFolder.Config.Rewards:FindFirstChild("AchievementConfig")
    if achMod then AchievementConfig = _ACC._tryRequire and _ACC._tryRequire(achMod) end
end

-- progress checkers replicated from decompiled AchievementHandler v_u_43
local achProgress = {}
function achProgress.Packs(info, req)
    if not (CardConfig and CardConfig.Packs and CardConfig.Packs[info]) then return 0 end
    local owned = Data.Get("Cards") or {}
    local n = 0
    for cardName in pairs(CardConfig.Packs[info].List or {}) do
        if owned[cardName] ~= nil then n = n + 1 end
    end
    return n / req
end
function achProgress.Mutations(info, req)
    return ((Data.Get("Stats", info) or 0)) / req
end
function achProgress.Playtime(_, req)
    return (Data.Get("Playtime") or 0) / req
end
function achProgress.PacksOpened(_, req)
    return (Data.Get("PacksOpened") or 0) / req
end
function achProgress.PetEquipRoll(_, req)
    return (Data.Get("PetPacksOpened") or 0) / req
end
function achProgress.PetEquipDiscover(_, req)
    local pets = Data.Get("Pets") or {}
    local n = 0
    for _ in pairs(pets) do n = n + 1 end
    return n / req
end
function achProgress.MangaCards(_, req)
    local cards = Data.Get("Cards") or {}
    local n = 0
    for _, cd in pairs(cards) do
        if type(cd) == "table" and cd.Manga == true then n = n + 1 end
    end
    return n / req
end
function achProgress.Rainbow(packName, req)
    if not (CardConfig and CardConfig.Packs and CardConfig.Packs[packName]) then return 0 end
    local cards = Data.Get("Cards") or {}
    local n = 0
    for cardName in pairs(CardConfig.Packs[packName].List) do
        local cd = cards[cardName]
        if cd and cd.Mutation == "Rainbow" then n = n + 1 end
    end
    return n / req
end
function achProgress.Manga(packName, req)
    if not (CardConfig and CardConfig.Packs and CardConfig.Packs[packName]) then return 0 end
    local cards = Data.Get("Cards") or {}
    local n = 0
    for cardName in pairs(CardConfig.Packs[packName].List) do
        local cd = cards[cardName]
        if cd and cd.Manga == true then n = n + 1 end
    end
    return n / req
end

local function claimReadyAchievements()
    if not AchievementConfig then return 0 end
    local claimed = Data.Get("Achievements") or {}
    -- build set of already claimed for fast lookup (claimed is array)
    local claimedSet = {}
    for _, id in ipairs(claimed) do claimedSet[id] = true end

    local n = 0
    for id, cfg in pairs(AchievementConfig) do
        if not getgenv()._ACCRunning then break end
        if type(cfg) == "table" and not claimedSet[id] then
            local fn = achProgress[cfg.Category]
            if fn then
                local ok, ratio = pcall(fn, cfg.Info, cfg.Requirement)
                if ok and type(ratio) == "number" and ratio >= 1 then
                    Net.FireRL(R.Achievement, "Ach:" .. tostring(id), 0.5, "Claim", id)
                    n = n + 1
                    task.wait(0.4)
                end
            end
        end
    end
    return n
end
_ACC._claimReadyAchievements = claimReadyAchievements

-- Replica change handler: claim when something relevant updates
Data.OnChange(function(_, path, _, _)
    if not _ACC.AutoAchievements then return end
    if path[1] == "Achievements"      then return end -- self-loop on own claim
    if path[1] == "CardsDiscovered" or path[1] == "PetsClaimed"
       or path[1] == "Cards"          or path[1] == "Pets"
       or path[1] == "Stats"          or path[1] == "Playtime"
       or path[1] == "PacksOpened"    or path[1] == "PetPacksOpened"
    then
        task.spawn(claimReadyAchievements)
    end
end)

-- Periodic safety net: every 30s recheck (for time-based achievements)
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoAchievements then
            claimReadyAchievements()
        end
        task.wait(30)
    end
end)

-- ── Auto Rewards: clan + daily quests + login + wheelspin + group + index ──
-- One toggle covers everything because none of them have a cooldown problem
-- on the server side — each is gated by data.* fields. We just probe each
-- channel and fire if claimable. Server ignores duplicates silently.
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoRewards then
            local rep = Data.GetReplica()
            local d = rep and rep.Data

            -- 1. Group reward (one-shot, never resets)
            if d and d.GroupRewardClaimed == false
               and RL_Allow("Reward:Group", 60)
            then
                Net.Fire(R.Card, "ClaimReward")
            end

            -- 2. Clan rewards: ClanRewards is array of claimed level numbers,
            --    ClanLevel says highest level reached. Claim everything up to it.
            if d and d.ClanLevel then
                local claimed = {}
                for _, lvl in ipairs(d.ClanRewards or {}) do claimed[lvl] = true end
                for lvl = 1, d.ClanLevel do
                    if not claimed[lvl] and RL_Allow("Reward:Clan:" .. lvl, 30) then
                        Net.Fire(R.Clan, "ClaimReward", lvl)
                        task.wait(0.15)
                    end
                end
            end

            -- 3. Daily Quests: each Quest has Completed=true, Saved field marks
            --    it claimed. Fire Claim for completed-but-unsaved.
            if d and type(d.DailyQuests) == "table" then
                local saved = d.ClanDailyQuestsSaved or {} -- field naming clue from data
                for qid, info in pairs(d.DailyQuests) do
                    if type(info) == "table" and info.Completed and not saved[qid]
                       and RL_Allow("Reward:DailyQuest:" .. qid, 30)
                    then
                        Net.Fire(R.Card, "Claim", qid)
                        task.wait(0.1)
                    end
                end
            end

            -- 4. Clan Daily/Weekly quests — completed but unsaved
            if d and type(d.ClanDailyQuests) == "table" then
                local saved = d.ClanDailyQuestsSaved or {}
                for qid, info in pairs(d.ClanDailyQuests) do
                    if type(info) == "table" and info.Completed and not saved[qid]
                       and RL_Allow("Reward:ClanDQ:" .. qid, 30)
                    then
                        Net.Fire(R.Clan, "ClaimReward", qid)
                        task.wait(0.1)
                    end
                end
            end
            if d and type(d.ClanWeeklyQuests) == "table" then
                local saved = d.ClanWeeklyQuestsSaved or {}
                for qid, info in pairs(d.ClanWeeklyQuests) do
                    if type(info) == "table" and info.Completed and not saved[qid]
                       and RL_Allow("Reward:ClanWQ:" .. qid, 30)
                    then
                        Net.Fire(R.Clan, "ClaimReward", qid)
                        task.wait(0.1)
                    end
                end
            end

            -- 5. Login streak: server marks ClaimedLoginRewards keys as we claim
            if d and type(d.ClaimedLoginRewards) == "table" then
                local streak = d.LoginStreak or 0
                local claimed = {}
                for _, day in ipairs(d.ClaimedLoginRewards) do claimed[day] = true end
                for day = 1, streak do
                    if not claimed[day] and RL_Allow("Reward:Login:" .. day, 30) then
                        Net.Fire(R.Card, "Claim", "Login" .. day)
                        task.wait(0.1)
                    end
                end
            end

            -- 6. Wheelspin: Wheelspins is the count of available spins
            if d and (d.Wheelspins or 0) > 0 and RL_Allow("Reward:Wheelspin", 5) then
                Net.Fire(R.Card, "Claim", "Wheelspin")
            end

            -- 7. Index discoveries: CardsDiscovered grew past CardsClaimed?
            if d and type(d.CardsDiscovered) == "table" and type(d.CardsClaimed) == "table" then
                local claimed = {}
                for _, c in ipairs(d.CardsClaimed) do claimed[c] = true end
                for _, c in ipairs(d.CardsDiscovered) do
                    if not claimed[c] and RL_Allow("Reward:Index:" .. c, 30) then
                        Net.Fire(R.Card, "ClaimCard", c)
                        task.wait(0.05)
                    end
                end
            end

            -- 8. Generic safety net for any plain rewards bucket
            if RL_Allow("Reward:GenericClaim", 14) then
                Net.Fire(R.Card, "ClaimReward")
            end
        end
        task.wait(8)
    end
end)

-- ============================================================================
-- // EXPEDITION — full impl
-- ============================================================================
-- Verified flow (StarTrialHandler.ExpeditionHandler L38893 + ExpeditionConfig):
--   * Send payload is a TABLE: { Reward = packKey, Category = "Pack", NPC = npc }
--   * Server checks: enough StarTickets, enough Cash, daily cap not hit,
--     pack opened at least once, NPC unlocked.
--   * Active state lives in Data.Get("Expeditions", npc) = { Start, Duration, ... }
--   * Done when (workspace:GetServerTimeNow() - Start) >= Duration.
--   * Skip = Robux DevProduct ("SkipExpedition") — exploits can't trigger it.
local ExpConfig = Config.ExpeditionConfig

local function expCosts(packKey, replica, total)
    if not ExpConfig then return nil end
    local cash    = ExpConfig.GetPackPrice  and ExpConfig.GetPackPrice(packKey, replica) or nil
    local tickets = ExpConfig.GetTicketCost and ExpConfig.GetTicketCost(packKey)         or nil
    local timeRaw = ExpConfig.GetPackTime   and ExpConfig.GetPackTime(packKey)           or nil
    local timeBuff = (ExpConfig.GetBuff and ExpConfig.GetBuff("Time", total or 0)) or 1
    local timeAdj = timeRaw and math.ceil(timeRaw / timeBuff) or nil
    return cash, tickets, timeAdj
end

local function expNPCUnlocked(npc, total, hasGamepass)
    if npc == "1" then return true end
    if npc == "4" then return hasGamepass end
    if not ExpConfig or not ExpConfig.GetBuff then
        -- conservative fallback
        if npc == "2" then return (total or 0) >= 50 end
        if npc == "3" then return (total or 0) >= 100 end
        return false
    end
    local extraNpc = ExpConfig.GetBuff("ExtraNPC", total or 0) or 1
    return ExpConfig.CheckNPCUnlocked and ExpConfig.CheckNPCUnlocked(extraNpc, npc) or false
end

-- "Pirate Gold" -> "Pirate-Gold"; "Pirate" -> "Pirate"
local function expDisplayToKey(displayName)
    return tostring(displayName):gsub(" ", "-")
end

-- Mutation tier: 0 = Regular, 1 = Gold, 2 = Emerald, 3 = Void, 4 = Diamond, 5 = Rainbow
local EXP_MUTATION_RANK = { Gold=1, Emerald=2, Void=3, Diamond=4, Rainbow=5 }
local function expMutationOf(packKey)
    local _, mut = unpack(packKey:split("-"))
    return EXP_MUTATION_RANK[mut or ""] or 0
end

-- Score a candidate based on chosen strategy. Lower score = sooner.
local function expScore(strategy, cash, tickets, packKey)
    if strategy == "Most expensive first" then
        return -((cash or 0) + (tickets or 0) * 1000)
    elseif strategy == "Highest mutation first" then
        return -expMutationOf(packKey) * 1e9 - ((cash or 0) + (tickets or 0) * 1000)
    end
    -- default: Cheapest first
    return (cash or 0) + (tickets or 0) * 1000
end

-- Pick the best affordable pack for current resources from selectedPacks.
local function expPickPack(selectedPacks, replica, total)
    if not ExpConfig then return nil end
    local data = (replica and replica.Data) or {}
    local cashOwn    = data.Cash        or 0
    local ticketsOwn = data.StarTickets or 0
    -- NB: we don't pre-check HasOpenedPack (it iterates Cards);
    -- we trust user selection — if they pick something they
    -- haven't opened, server will reject and we'll move on.

    local candidates = {}
    for displayName in pairs(selectedPacks) do
        local key = expDisplayToKey(displayName)
        local cash, tickets, _ = expCosts(key, replica, total)
        if cash and tickets and cashOwn >= cash and ticketsOwn >= tickets then
            table.insert(candidates, {
                key = key, display = displayName,
                cash = cash, tickets = tickets,
            })
        end
    end
    if #candidates == 0 then return nil end

    local strategy = _ACC.ExpStrategy or "Cheapest first"
    table.sort(candidates, function(a, b)
        return expScore(strategy, a.cash, a.tickets, a.key)
             < expScore(strategy, b.cash, b.tickets, b.key)
    end)
    return candidates[1]
end

-- ── Send / Claim loop ─────────────────────────────────────────────────────
task.spawn(function()
    while getgenv()._ACCRunning do
        local doSend  = _ACC.AutoExpSend  or _ACC._ExpForceSend
        local doClaim = _ACC.AutoExpClaim or _ACC._ExpForceClaim
        _ACC._ExpForceSend  = false
        _ACC._ExpForceClaim = false

        if doSend or doClaim then
            local exps   = Data.Get("Expeditions") or {}
            local total  = Data.Get("TotalExpeditions") or 0
            local hasGP  = ((Data.Get("GamepassValues") or {}).ExtraMarine == true)
            local now    = workspace:GetServerTimeNow()

            -- 1) Claim ready first (frees up NPCs for new sends in same iteration)
            if doClaim then
                for _, npc in ipairs({ "1", "2", "3", "4" }) do
                    if not getgenv()._ACCRunning then break end
                    local info = exps[npc]
                    if type(info) == "table" and info.Start and info.Duration
                       and (now - info.Start) >= info.Duration
                    then
                        Net.FireRL(R.StarTrial, "Exp:Claim:" .. npc, 0.6,
                                   "ClaimExpedition", npc)
                        task.wait(0.4)
                    end
                end
            end

            -- 2) Send to free NPCs
            if doSend and not mapEmpty(_ACC.SelectedExpPacks)
               and not mapEmpty(_ACC.SelectedExpNPCs)
            then
                exps = Data.Get("Expeditions") or {}  -- re-fetch after claims
                local daily       = Data.Get("DailyExpeditions") or 0
                local maxDaily    = 4 + ((ExpConfig and ExpConfig.GetBuff and ExpConfig.GetBuff("MoreExpeditions", total)) or 0)
                local replica     = Data.GetReplica()

                for _, npc in ipairs({ "1", "2", "3", "4" }) do
                    if not getgenv()._ACCRunning then break end
                    if _ACC.SelectedExpNPCs[npc]
                       and not exps[npc]                          -- NPC free
                       and expNPCUnlocked(npc, total, hasGP)
                       and (not _ACC.RespectExpDaily or daily < maxDaily)
                    then
                        local pick = expPickPack(_ACC.SelectedExpPacks, replica, total)
                        if pick then
                            Net.FireRL(R.StarTrial, "Exp:Send:" .. npc, 2.0,
                                       "SendExpedition", {
                                           Reward   = pick.key,
                                           Category = "Pack",
                                           NPC      = npc,
                                       })
                            daily = daily + 1
                            task.wait(0.6)
                        else
                            -- nothing affordable in selection; bail this cycle
                            break
                        end
                    end
                end
            end
        end

        task.wait(5)
    end
end)

-- ============================================================================
-- // 21. LOOPS — SHOPS
-- ============================================================================
-- Auto Stock: only buy items in _ACC.SelectedStockItems, gated by Cash >= price.
-- Uses server-reported e.amount from GetStock (set during Shops.RefreshStock).
-- Won't fire on sold-out tiers — that was the cause of "No Stock Left" spam.
-- DragonBall has no client-known price (server returns boolean availability);
-- when selected and available, fire once and let the server validate cash.
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoStock and R.GetStock and not mapEmpty(_ACC.SelectedStockItems) then
            Shops.RefreshStock()
            for _, e in ipairs(Shops.StockSnap) do
                if not _ACC.AutoStock or not getgenv()._ACCRunning then break end
                if _ACC.SelectedStockItems[e.id] then
                    if e.id == "DragonBall" then
                        Net.Fire(R.Stock, "Buy", "DragonBall")
                        task.wait(0.4)
                    elseif e.price then
                        -- e.amount is the server's current count for this item.
                        -- Buy the whole stack this pass; never fire on a sold-out
                        -- item (Amount 0) — that is what triggers "No Stock Left".
                        -- Fallback 1 only if the Amount field is ever missing.
                        local amt = tonumber(e.amount) or 1
                        while amt > 0
                              and (Data.Get("Cash") or 0) >= e.price
                              and _ACC.AutoStock and getgenv()._ACCRunning
                        do
                            Net.Fire(R.Stock, "Buy", e.id)
                            amt = amt - 1
                            task.wait(0.4)
                        end
                    end
                end
            end
        end
        task.wait(5)
    end
end)

-- Auto Merchant: only buy items in _ACC.SelectedMerchantItems, using payment mode.
-- Cash → Tokens fallback (default): try cash first, then TravelTokens.
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoMerchant and R.GetMerchantItems and not mapEmpty(_ACC.SelectedMerchantItems) then
            Shops.RefreshMerchant()
            for _, e in ipairs(Shops.MerchantSnap) do
                if not _ACC.AutoMerchant or not getgenv()._ACCRunning then break end
                if _ACC.SelectedMerchantItems[e.item] then
                    if buyMerchantItem(e) then
                        task.wait(0.4)
                    end
                end
            end
        end
        task.wait(5)
    end
end)

-- Pet roll x1 (fixed: tokens >= price, not <)
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.PetRoll1 and not mapEmpty(_ACC.SelectedPetEggs) and PetConfig and PetConfig.Eggs then
            local toks = Data.Get("PetTokens") or 0
            for _, eggName in iterMap(_ACC.SelectedPetEggs) do
                if not _ACC.PetRoll1 or not getgenv()._ACCRunning then break end
                local cfg = PetConfig.Eggs[eggName]
                if cfg and cfg.Price and toks >= cfg.Price then
                    Net.FireRL(R.Pet, "Pet:Roll:" .. eggName, 0.4, "Roll", eggName)
                    task.wait(0.4)
                    toks = Data.Get("PetTokens") or 0
                end
            end
            task.wait(0.5)
        else
            task.wait(1.5)
        end
    end
end)

-- Pet roll x5
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.PetRoll5 and not mapEmpty(_ACC.SelectedPetEggs) and PetConfig and PetConfig.Eggs then
            local toks = Data.Get("PetTokens") or 0
            for _, eggName in iterMap(_ACC.SelectedPetEggs) do
                if not _ACC.PetRoll5 or not getgenv()._ACCRunning then break end
                local cfg = PetConfig.Eggs[eggName]
                if cfg and cfg.Price and toks >= cfg.Price * 5 then
                    Net.FireRL(R.Pet, "Pet:Roll5:" .. eggName, 0.6, "Roll5", eggName)
                    task.wait(0.5)
                    toks = Data.Get("PetTokens") or 0
                end
            end
            task.wait(0.5)
        else
            task.wait(1.5)
        end
    end
end)

-- ── Auto Pet Quests orchestrator ──────────────────────────────────────────
-- Pet quests auto-grant their reward server-side (no claim remote). They're
-- completed by Place/Open/Craft/Tower actions, so this drives the matching
-- existing engines for any INCOMPLETE quest and idles when all are done,
-- re-arming each 3h reset. Non-destructive: only flips OFF engines/selections
-- it turned ON itself (your own toggles are left alone).
--   Smart       — uses YOUR pack/potion selections.
--   Zero-config — also auto-fills empty selections (place/open all owned packs,
--                 craft any potion) so it works with no setup.
do
    local PETQUEST_RESET = 10800   -- Configuration.PetQuestRefreshTime (3h)
    -- quest category → engine flag + member quest ids
    local CATS = {
        Place = { engine = "AutoPlaceEnabled", ids = { "Quest1", "Quest6" } },
        Open  = { engine = "AutoOpenEnabled",  ids = { "Quest2", "Quest7", "Quest3", "Quest8" } },
        Craft = { engine = "AutoCraftPotions", ids = { "Quest4", "Quest9" } },
        Tower = { engine = "TowerAutoStart",   ids = { "Quest5", "Quest10" } },
    }
    local managedEngines = {}   -- flag -> true if WE turned it on
    local managedFill     = {}  -- "Craft" -> snapshot map WE auto-filled

    -- Pack-selection label sets (mirror how Lists.PacksFullWithBundles is built).
    -- ALL_PACKS = every label; MUTATED_PACKS = only the non-Regular variants +
    -- their bundles. The "open X packs WITH A MUTATION" quests (Q3/Q8) only
    -- advance when MUTATED packs are placed+opened, so while those are pending we
    -- force Place to put down mutated packs (regular packs never advance them).
    local ALL_PACKS, MUTATED_PACKS = {}, {}
    for _, label in ipairs(Lists.PacksFullWithBundles or {}) do ALL_PACKS[label] = true end
    for _, family in ipairs(Lists.Packs or {}) do
        for _, rarity in ipairs(Lists.Rarities or {}) do
            if rarity ~= "Regular" then
                MUTATED_PACKS[family .. " " .. rarity] = true
                MUTATED_PACKS[family .. " " .. rarity .. " Bundle"] = true
            end
        end
    end

    -- Non-destructive override of the Place selection: the user's own picks are
    -- stashed (placePrev) and restored when we stop. placeSet = the map we last
    -- wrote, so we only restore if the user hasn't hand-edited it since.
    local managingPlace, placePrev, placeSet = false, nil, nil

    -- true if both are boolean-maps with the exact same set of true keys
    local function sameMap(a, b)
        if type(a) ~= "table" or type(b) ~= "table" then return false end
        for k, v in pairs(a) do if v and not b[k] then return false end end
        for k, v in pairs(b) do if v and not a[k] then return false end end
        return true
    end

    local function questDone(pq, id)
        local q = pq[id]
        return q ~= nil and q.Completed == true
    end
    local function setEngine(flag, want)
        if want then
            if not _ACC[flag] then _ACC[flag] = true; managedEngines[flag] = true end
        elseif managedEngines[flag] then
            _ACC[flag] = false; managedEngines[flag] = nil
        end
    end
    -- Drive the Place selection to `desired` (a label map) or, with nil, restore
    -- the user's stashed selection. Snapshots the user's picks the first time we
    -- override so they're never lost.
    local function managePlace(desired)
        if desired then
            if not managingPlace then placePrev = _ACC.SelectedPlacePacks; managingPlace = true end
            if not sameMap(_ACC.SelectedPlacePacks, desired) then _ACC.SelectedPlacePacks = desired end
            placeSet = desired
        elseif managingPlace then
            if sameMap(_ACC.SelectedPlacePacks, placeSet) then _ACC.SelectedPlacePacks = placePrev or {} end
            managingPlace, placePrev, placeSet = false, nil, nil
        end
    end
    local function fillCraft(needCraft)
        if _ACC.PetQuestMode ~= "Zero-config" then return end
        if needCraft and mapEmpty(_ACC.SelectedCraftPotions) then
            local m = {}
            for _, name in ipairs(Lists.Potions or {}) do m[name] = true end
            _ACC.SelectedCraftPotions = m; managedFill.Craft = m
        end
    end
    local function releaseAll()
        for flag in pairs(managedEngines) do _ACC[flag] = false end
        managedEngines = {}
        managePlace(nil)   -- restore the user's Place selection
        -- only clear what WE auto-filled; if the user has since edited it
        -- (no longer equals our snapshot), drop ownership but keep it.
        if managedFill.Craft then
            if sameMap(_ACC.SelectedCraftPotions, managedFill.Craft) then _ACC.SelectedCraftPotions = {} end
            managedFill.Craft = nil
        end
    end
    local function buildStatus(pq, quests, done, total, resetIn, header)
        local lines = {}
        for i = 1, 10 do
            local def = quests["Quest" .. i]
            if def then
                local q = pq["Quest" .. i]
                local prog = (q and q.Progress) or 0
                local comp = q and q.Completed == true
                lines[#lines + 1] = ("%s %s %d/%d"):format(
                    comp and "✅" or "⏳", def.Title,
                    math.min(prog, def.Requirement), def.Requirement)
            end
        end
        return ("%s\nDone %d/%d · reset in %dm\n%s"):format(
            header, done, total, math.floor(resetIn / 60), table.concat(lines, "\n"))
    end

    task.spawn(function()
        while getgenv()._ACCRunning do
            -- per-cycle work is pcall-wrapped: a transient error must never
            -- strand the managed engines ON by escaping the loop.
            safe(function()
            if _ACC.AutoPetQuests then
                local pq     = Data.Get("PetQuests") or {}
                local pqTime = Data.Get("PetQuestTime") or 0
                local quests = (PetConfig and PetConfig.Quests) or {}
                local done, total = 0, 0
                for id in pairs(quests) do
                    total = total + 1
                    if questDone(pq, id) then done = done + 1 end
                end
                local resetIn = math.max(0, (pqTime + PETQUEST_RESET) - workspace:GetServerTimeNow())

                if total == 0 then
                    -- PetConfig.Quests failed to load: never blindly arm every
                    -- engine. Release anything we own and wait for a good read.
                    releaseAll()
                    if _ACC.SetPetQuestStatus then
                        _ACC.SetPetQuestStatus("⚠ Pet quest config unavailable — idle")
                    end
                    return
                end

                if total > 0 and done >= total then
                    releaseAll()   -- all complete → stop the engines we started, wait for reset
                    if _ACC.SetPetQuestStatus then
                        _ACC.SetPetQuestStatus(buildStatus(pq, quests, done, total, resetIn,
                            "✅ All done — idle until reset"))
                    end
                else
                    local need = {}
                    for cat, info in pairs(CATS) do
                        local incomplete = false
                        for _, id in ipairs(info.ids) do
                            if not questDone(pq, id) then incomplete = true; break end
                        end
                        need[cat] = incomplete
                    end
                    -- Mutation-pack quests (Q3/Q8) only advance when MUTATED packs
                    -- are placed+opened — opening regular packs does nothing. So
                    -- while they're pending, force Place to mutated packs in ANY
                    -- mode (else the quest is impossible); otherwise Zero-config
                    -- fills all packs and Smart leaves your own picks alone.
                    local needMutOpen = (not questDone(pq, "Quest3")) or (not questDone(pq, "Quest8"))
                    local desiredPlace
                    if needMutOpen then
                        desiredPlace = MUTATED_PACKS
                    elseif (need.Place or need.Open) and _ACC.PetQuestMode == "Zero-config" then
                        desiredPlace = ALL_PACKS
                    end
                    managePlace(desiredPlace)
                    fillCraft(need.Craft)
                    -- Open quests need placed packs that hatch → keep Place on while
                    -- Open is needed, BUT respect AutoPlace's own anti-lag cap: once the
                    -- plot is full (used >= cap) AutoPlace just re-scans the whole board
                    -- every cycle finding no free cells (in-game lag). So gate Place on
                    -- free room; AutoOpen stays on to drain packs and free slots, and a
                    -- later tick (used < cap) re-enables Place. Used/cap computed EXACTLY
                    -- like refreshPlaceCounter + AutoPlace's general cap (Bundle = 5 slots).
                    local hasRoom = true
                    do
                        local replica = Data.GetReplica()
                        if replica and replica.Data then
                            local maxP = replica.Data.MaxPlacements or 25
                            local used = numPacksPlaced(replica.Data.PacksPlaced)
                            local cap = math.min(tonumber(_ACC.SinglePlaceCap) or maxP, maxP)
                            hasRoom = used < cap
                        end
                    end
                    local wantPlace = (need.Place or need.Open) and hasRoom
                    setEngine("AutoPlaceEnabled", wantPlace)
                    setEngine("AutoOpenEnabled",  need.Open)
                    setEngine("AutoCraftPotions", need.Craft)
                    setEngine("TowerAutoStart",   need.Tower)
                    if _ACC.SetPetQuestStatus then
                        local header = (_ACC.PetQuestMode or "Smart") .. " — driving engines"
                        if (need.Place or need.Open) and not hasRoom then
                            header = header .. " · plot full, opening"
                        end
                        _ACC.SetPetQuestStatus(buildStatus(pq, quests, done, total, resetIn, header))
                    end
                end
            elseif next(managedEngines) or next(managedFill) or managingPlace then
                releaseAll()
                if _ACC.SetPetQuestStatus then _ACC.SetPetQuestStatus("Off") end
            end
            end)   -- end safe() per-cycle wrapper
            task.wait(5)
        end
        releaseAll()   -- unload cleanup
    end)
end

-- Dragon Ball: schema = { ["1"]=true, ["2"]=true, ... } — owned ball IDs.
-- Physical balls spawn in the world during DB events; player walks up and
-- triggers a ProximityPrompt to collect (no remote-based collect by id).
-- When all 7 owned: DragonBallHandler.MakeWish fires
--   DragonBall:FireServer("Use", wishType[, petName for "PetMutation"])
-- Server enforces 24h cooldown via DragonBallTime — our 60s rate-limit is
-- harmless safety on top.
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.DragonBallAuto then
            local owned = Data.Get("DragonBalls")
            if type(owned) == "table" then
                local count = 0
                for _, v in pairs(owned) do
                    if v == true then count = count + 1 end
                end
                if count >= 7 then
                    -- 24h server cooldown: don't bother retrying often
                    local last = Data.Get("DragonBallTime")
                    local cooldownOk = true
                    if last and workspace.GetServerTimeNow then
                        local now = workspace:GetServerTimeNow()
                        cooldownOk = (now - last) >= 86400
                    end
                    if cooldownOk then
                        local wish = _ACC.DBWishType or "Cash"
                        if wish == "PetMutation" then
                            -- needs a pet name; try to grab any owned non-Rainbow
                            local pets = Data.Get("Pets")
                            local petName
                            if type(pets) == "table" then
                                for name, info in pairs(pets) do
                                    if type(info) == "table" and info.Mutation ~= "Rainbow" then
                                        petName = name; break
                                    end
                                end
                            end
                            if petName then
                                Net.FireRL(R.DragonBall, "DB:Wish", 60,
                                           "Use", wish, petName)
                            end
                        else
                            -- Cash, GradeTokens, PetTokens, TraitTokens, Card, RainbowCard
                            Net.FireRL(R.DragonBall, "DB:Wish", 60, "Use", wish)
                        end
                    end
                end
            end
        end
        task.wait(5)
    end
end)

-- ============================================================================
-- // 22. LOOPS — INVENTORY
-- ============================================================================

-- Pack Exchange — Upgrade / Downgrade / Bundle / Unbundle (all via R.Card).
-- All 4 actions accept an optional batch arg "10"/"100" (verified by RemoteSpy
-- + decompile L31571-31896). Costs (Cash), mirrored from the decompiled UI:
--   upgrade   1x = ceil(packPrice * Requirement * mut)
--   downgrade 1x = ceil( ceil(packPrice * Requirement * mut) * 0.25 )
--   bundle    1x = ceil( round(packPrice * mut * 2) )
--   unbundle  1x = ceil( round(packPrice * mut * 2) * 0.5 )
--   10x / 100x = the 1x unit cost × 10 / × 100 (rounded).
-- Pack requirement per fire:
--   upgrade   = round(Requirement * batchMult)   of the source rarity
--   downgrade = batchMult                        of the source rarity
--   bundle    = 5 * batchMult                    of the source rarity
--   unbundle  = 1 * batchMult                    of the "<f>-<r>-Bundle" key
task.spawn(function()
    local PE_BATCH = {
        ["1x"]   = { arg = nil,   mult = 1   },
        ["10x"]  = { arg = "10",  mult = 10  },
        ["100x"] = { arg = "100", mult = 100 },
    }

    local function peMutMult(rarity)
        if not rarity or rarity == "Regular" then return 1 end
        if Mutations and Mutations[rarity] and Mutations[rarity].PriceMultiplier then
            return Mutations[rarity].PriceMultiplier
        end
        return 1
    end
    -- PackExchange[rarity].Requirement — packs needed to make one of `rarity`
    local function peReq(rarity)
        if PackExchange and type(PackExchange[rarity]) == "table" then
            return PackExchange[rarity].Requirement
        end
        return nil
    end
    -- round(packPrice * mut * 2) — bundle/unbundle price base before ceil
    local function peBundleBase(family, rarity)
        local p = CardConfig and CardConfig.Packs and CardConfig.Packs[family]
        if not (p and p.Price) then return nil end
        return math.round(p.Price * peMutMult(rarity) * 2)
    end

    while getgenv()._ACCRunning do
        if _ACC.PEEnabled and not mapEmpty(_ACC.PESelectedPacks) then
            local method = _ACC.PEMethod or "Upgrade"
            local batch  = PE_BATCH[_ACC.PEBatch or "1x"] or PE_BATCH["1x"]
            local cash   = Data.Get("Cash") or 0

            -- selected rarities in progression order (multi-select)
            local rarities = {}
            for _, r in ipairs(Lists.Rarities) do
                if _ACC.PEFromRarities[r] then table.insert(rarities, r) end
            end
            if #rarities == 0 then rarities = { "Regular" } end

            for _, packName in iterMap(_ACC.PESelectedPacks) do
                if not _ACC.PEEnabled or not getgenv()._ACCRunning then break end
                local price = CardConfig and CardConfig.Packs
                              and CardConfig.Packs[packName]
                              and CardConfig.Packs[packName].Price

              for _, from in ipairs(rarities) do
                if not _ACC.PEEnabled or not getgenv()._ACCRunning then break end
                if method == "Upgrade" then
                    -- find target rarity from chain: PackExchange[target].Pack == from
                    local target
                    if PackExchange then
                        for rarity, cfg in pairs(PackExchange) do
                            if rarity ~= "Downgrade" and type(cfg) == "table"
                               and cfg.Pack == from
                            then
                                target = rarity
                                break
                            end
                        end
                    end
                    local req = target and peReq(target)
                    if target and req and price then
                        local srcKey  = (from == "Regular") and packName
                                                              or (packName .. "-" .. from)
                        local owned   = tonumber(Data.Get("Packs", srcKey)) or 0
                        local needPk  = math.round(req * batch.mult)
                        local cost    = math.ceil(price * req * peMutMult(target)) * batch.mult
                        if owned >= needPk and cash >= cost then
                            if batch.arg then
                                Net.FireRL(R.Card, "PE:Up:" .. srcKey, 0.5,
                                           "Exchange", packName, from, target, batch.arg)
                            else
                                Net.FireRL(R.Card, "PE:Up:" .. srcKey, 0.5,
                                           "Exchange", packName, from, target)
                            end
                        end
                    end

                elseif method == "Downgrade" then
                    -- `from` is the rarity being downgraded (cannot be Regular)
                    local req = peReq(from)
                    if from ~= "Regular" and req and price then
                        local srcKey = packName .. "-" .. from
                        local owned  = tonumber(Data.Get("Packs", srcKey)) or 0
                        local unit   = math.ceil(math.ceil(price * req * peMutMult(from)) * 0.25)
                        local cost   = unit * batch.mult
                        if owned >= batch.mult and cash >= cost then
                            if batch.arg then
                                Net.FireRL(R.Card, "PE:Dn:" .. srcKey, 0.5,
                                           "Downgrade", packName, from, batch.arg)
                            else
                                Net.FireRL(R.Card, "PE:Dn:" .. srcKey, 0.5,
                                           "Downgrade", packName, from)
                            end
                        end
                    end

                elseif method == "Bundle" then
                    -- 5 / 50 / 500 packs of source rarity → 1 / 10 / 100 bundles
                    local srcKey = (from == "Regular") and packName
                                                         or (packName .. "-" .. from)
                    local owned  = tonumber(Data.Get("Packs", srcKey)) or 0
                    local base   = peBundleBase(packName, from)
                    if base and owned >= (5 * batch.mult) then
                        local cost = math.ceil(base) * batch.mult
                        if cash >= cost then
                            if batch.arg then
                                Net.FireRL(R.Card, "PE:Bn:" .. srcKey, 0.5,
                                           "Bundle", packName, from, batch.arg)
                            else
                                Net.FireRL(R.Card, "PE:Bn:" .. srcKey, 0.5,
                                           "Bundle", packName, from)
                            end
                        end
                    end

                elseif method == "Unbundle" then
                    -- 1 / 10 / 100 bundles → packs
                    local bundleKey = packName .. "-" .. from .. "-Bundle"
                    local owned     = tonumber(Data.Get("Packs", bundleKey)) or 0
                    local base      = peBundleBase(packName, from)
                    if base and owned >= batch.mult then
                        local cost = math.ceil(base * 0.5) * batch.mult
                        if cash >= cost then
                            if batch.arg then
                                Net.FireRL(R.Card, "PE:Un:" .. bundleKey, 0.5,
                                           "Unbundle", bundleKey, batch.arg)
                            else
                                Net.FireRL(R.Card, "PE:Un:" .. bundleKey, 0.5,
                                           "Unbundle", bundleKey)
                            end
                        end
                    end
                end

                task.wait(0.4)
              end
            end
        end
        task.wait(1)
    end
end)

-- Auto Craft Potions
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoCraftPotions and not mapEmpty(_ACC.SelectedCraftPotions) then
            local replicaPacks = (Data.GetTable() or {}).Packs or {}
            for _, p in iterMap(_ACC.SelectedCraftPotions) do
                if not _ACC.AutoCraftPotions or not getgenv()._ACCRunning then break end
                local cfg = Consumables and Consumables[p]
                if cfg and type(cfg.Requirements) == "table" then
                    local enough = true
                    for reqId, reqAmt in pairs(cfg.Requirements) do
                        local have = tonumber(replicaPacks[tostring(reqId)] or replicaPacks[reqId]) or 0
                        if have < reqAmt then enough = false; break end
                    end
                    if enough then
                        Net.FireRL(R.Potion, "Pot:Craft:" .. p, 0.5, "Craft", p)
                        task.wait(0.4)
                    end
                end
            end
        end
        task.wait(2)
    end
end)

-- Auto Use Potions
-- Behaviour: walk every selected potion in order; for each, spam Apply
-- (or Apply10 when there's enough stock) until the inventory count hits
-- zero, then move to the next selected potion. Once all are drained, wait
-- 5 seconds and re-poll the inventory — new potions might come in from
-- Auto Craft, Travel Merchant, drops, etc.
--
-- No buff-active check: the user explicitly asked to drink everything
-- selected. Server will simply overwrite the active buff with the latest
-- one in the same category — desired behaviour for stockpile burns.
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoUsePotions and not mapEmpty(_ACC.SelectedUsePotions) then
            for _, potionName in iterMap(_ACC.SelectedUsePotions) do
                if not _ACC.AutoUsePotions or not getgenv()._ACCRunning then break end
                local owned = Data.Get("Consumables") or {}
                local count = tonumber(owned[potionName]) or 0
                while count > 0 and _ACC.AutoUsePotions and getgenv()._ACCRunning do
                    if count >= 10 then
                        Net.Fire(R.Potion, "Apply10", potionName)
                        task.wait(0.4)
                    else
                        Net.Fire(R.Potion, "Apply", potionName)
                        task.wait(0.25)
                    end
                    owned = Data.Get("Consumables") or {}
                    count = tonumber(owned[potionName]) or 0
                end
            end
        end
        task.wait(5)
    end
end)

-- Auto Upgrade
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoUpgrade and not mapEmpty(_ACC.SelectedUpgrades) then
            for _, name in iterMap(_ACC.SelectedUpgrades) do
                if not _ACC.AutoUpgrade or not getgenv()._ACCRunning then break end
                Net.FireRL(R.Card, "Upg:" .. name, 0.4, "Upgrade", name)
                task.wait(0.4)
            end
        end
        task.wait(1)
    end
end)

-- Auto Craft Relics — RelicHandler decompile:
--   relics = Data.Get("Relics")  -- ARRAY of owned relic names in craft order
--   list = Config.Relics.List    -- canonical craft order
--   next-to-craft = list[#owned + 1]   (must own previous before crafting next)
--   Relic:FireServer("Craft", relicName)
-- Apply / Apply10 are NOT real actions on the Relic remote — once crafted,
-- relics are passive buffs that activate automatically.
task.spawn(function()
    local Relics = Config.Relics
    while getgenv()._ACCRunning do
        if _ACC.RelicCraft and Relics and type(Relics.List) == "table" then
            local owned = Data.Get("Relics") or {}
            -- Build owned set (Data is array, but we lookup by name)
            local ownedSet = {}
            if type(owned) == "table" then
                for _, name in pairs(owned) do
                    if type(name) == "string" then ownedSet[name] = true end
                end
            end
            -- Find first relic in List that's not owned and whose predecessor IS owned.
            for i, relicName in ipairs(Relics.List) do
                if not _ACC.RelicCraft or not getgenv()._ACCRunning then break end
                if not ownedSet[relicName] then
                    local prev = i > 1 and Relics.List[i - 1] or nil
                    if prev == nil or ownedSet[prev] then
                        Net.FireRL(R.Relic, "Rel:C:" .. relicName, 1.5,
                                   "Craft", relicName)
                        task.wait(0.5)
                    end
                    break  -- one craft per iteration
                end
            end
        end
        task.wait(2)
    end
end)

-- ============================================================================
-- // 22.6 LOOPS — VOYAGE  (Update 48)
-- ============================================================================

-- Auto Voyage: keep a voyage running using the game's own AFK auto-battle.
-- We only (re)Start when nothing is active/waiting AND the cooldown elapsed —
-- the game's JoinFromAFK handles rejoin between voyages, so this mainly kicks
-- off the first run and recovers if the loop ever stalls.
task.spawn(function()
    local lastStart = 0
    local wasBusy   = false
    while getgenv()._ACCRunning do
        if _ACC.VoyageAuto and R.Voyage then
            local rotate = (_ACC.VoyagePack == "Auto (Rotate packs)")
            local busy   = VoyageHelpers.busy()

            -- rotate: when a voyage just finished, clear the results screen so the
            -- next pack queues cleanly (MaxWave lets the game's AFK loop handle it)
            if rotate and wasBusy and not busy then
                pcall(function()
                    local VH = VoyageHelpers.getVH()
                    if VH and VH.ContinueClicked then VH.ContinueClicked() end
                end)
            end
            wasBusy = busy

            if busy then
                if _ACC.SetVoyageStatus then
                    local VH = VoyageHelpers.getVH()
                    local p  = VH and VH.PacksSelected and VH.PacksSelected.VoyagePackSelected
                    local stages = Data.Get("VoyageStages") or {}
                    _ACC.SetVoyageStatus(("%s Running: %s (stage %s)")
                        :format(rotate and "🔁" or "🚢", tostring(p),
                                tostring(p and stages[p] or "?")))
                end
            else
                local cd = VoyageHelpers.cooldownLeft()
                if cd > 0 then
                    if _ACC.SetVoyageStatus then
                        _ACC.SetVoyageStatus(("⏳ Cooldown %ds → next: %s")
                            :format(math.ceil(cd), tostring(VoyageHelpers.resolvePack())))
                    end
                elseif os.clock() - lastStart > 8 then
                    local pack = VoyageHelpers.resolvePack()
                    if pack and VoyageHelpers.unlocked(pack) and VoyageHelpers.hasCards(pack) then
                        local ok = VoyageHelpers.startVoyage(pack)
                        if ok then
                            lastStart = os.clock()
                            if rotate then
                                VoyageHelpers._rotLast = pack
                                task.wait(0.3)
                                VoyageHelpers.setAFK(false)  -- single run; engine rotates to next pack
                                if _ACC.SetVoyageStatus then
                                    _ACC.SetVoyageStatus(("🔁 Rotate → %s"):format(pack))
                                end
                            else
                                task.wait(0.3)
                                VoyageHelpers.setAFK(true)   -- game AFK-loops the deepest pack
                                if _ACC.SetVoyageStatus then
                                    _ACC.SetVoyageStatus(("🚢 MaxWave → %s (AFK)"):format(pack))
                                end
                            end
                        end
                    elseif _ACC.SetVoyageStatus then
                        _ACC.SetVoyageStatus(("⚠ %s not voyageable yet"):format(tostring(pack)))
                    end
                end
            end
        else
            wasBusy = false
        end
        task.wait(3)
    end
end)

-- Auto Buy Voyage Upgrades — cheapest not-maxed upgrade we can afford, per cycle
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.VoyageUpgradeAuto and R.Voyage and VoyageConfig and VoyageConfig.Upgrades then
            local tokens = tonumber(Data.Get("VoyageTokens")) or 0
            local levels = Data.Get("VoyageUpgrades") or {}
            local best
            for name, cfg in pairs(VoyageConfig.Upgrades) do
                local lvl  = tonumber(levels[name]) or 0
                local maxL = cfg.MaxLevel or 50
                if lvl < maxL then
                    local cost = VoyageConfig.GetUpgradeCost(lvl + 1)
                    if cost and tokens >= cost and (not best or cost < best.cost) then
                        best = { name = name, cost = cost }
                    end
                end
            end
            if best then
                Net.FireRL(R.Voyage, "Voy:Upg", 0.4, "Upgrade", best.name)
                if _ACC.SetVoyageUpgStatus then
                    _ACC.SetVoyageUpgStatus(("⬆ %s (cost %d · tokens %d)")
                        :format(best.name, best.cost, tokens))
                end
                task.wait(0.4)
            elseif _ACC.SetVoyageUpgStatus then
                _ACC.SetVoyageUpgStatus(("Tokens: %d — nothing affordable/left"):format(tokens))
            end
        end
        task.wait(1.0)
    end
end)

-- Auto Equip Best Poster (per pack)
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.VoyageEquipAuto and R.Voyage then
            local posters  = Data.Get("Posters") or {}
            local equipped = Data.Get("PostersEquipped") or {}
            local best     = VoyageHelpers.bestWeighted(posters, _ACC.VoyageBuffWeights)
            local changed  = 0
            for pack, po in pairs(best) do
                if not _ACC.VoyageEquipAuto or not getgenv()._ACCRunning then break end
                local eq = equipped[pack]
                if not eq or eq.UUID ~= po.UUID then
                    Net.FireRL(R.Voyage, "Voy:Equip:" .. pack, 0.4, "Equip", po.UUID)
                    changed = changed + 1
                    task.wait(0.3)
                end
            end
            if _ACC.SetPosterStatus then
                _ACC.SetPosterStatus(changed > 0 and ("Equipped %d poster(s)"):format(changed)
                                                  or "Best posters equipped ✓")
            end
        end
        task.wait(2.0)
    end
end)

-- Auto Smelt by the % filter. Keeps any poster with a buff ≥ its threshold,
-- smelts the rest. Protects equipped / Locked / best-per-pack (rarity+weighted).
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.VoyageSmeltAuto and R.Voyage then
            local n, why = VoyageHelpers.doSmelt()
            if _ACC.SetPosterStatus then
                if why then
                    _ACC.SetPosterStatus("♻ Smelt: " .. why)
                elseif n and n > 0 then
                    _ACC.SetPosterStatus(("♻ Smelted %d poster(s)"):format(n))
                end
            end
        end
        task.wait(3.0)
    end
end)

-- Auto Forge — when ≥5 scrolls of a rarity, forge a poster for the chosen pack
-- (dropdown), or — in "Auto" — the deepest pack in the chain that has reached
-- that rarity's stage requirement. Scrolls whose stage the pack hasn't reached
-- are skipped.
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.VoyageForgeAuto and R.Voyage and VoyageConfig and VoyageConfig.Rarities then
            local scrolls = Data.Get("Scrolls") or {}
            local stages  = Data.Get("VoyageStages") or {}
            local order   = Lists.VoyagePacks or {}
            local sel     = _ACC.VoyageForgePack
            local auto    = (not sel or sel == "Auto (deepest eligible)")
            local didForge, blockedSel = false, false
            for rarity, rcfg in pairs(VoyageConfig.Rarities) do
                if not _ACC.VoyageForgeAuto or not getgenv()._ACCRunning then break end
                if (tonumber(scrolls[rarity]) or 0) >= 5 then
                    local reqStage = rcfg.Stage or 1
                    local pack
                    if auto then
                        -- deepest pack in the chain that meets the stage gate
                        for _, p in ipairs(order) do
                            if (tonumber(stages[p]) or 0) >= reqStage then pack = p end
                        end
                    elseif (tonumber(stages[sel]) or 0) >= reqStage then
                        pack = sel
                    else
                        blockedSel = true   -- have scrolls, but chosen pack isn't deep enough yet
                    end
                    if pack then
                        Net.FireRL(R.Voyage, "Voy:Forge:" .. rarity, 1.0, "Forge", pack, rarity)
                        if _ACC.SetForgeStatus then
                            _ACC.SetForgeStatus(("⚒ Forged %s scroll → %s pack"):format(rarity, pack))
                        end
                        didForge = true
                        task.wait(0.6)
                    end
                end
            end
            if _ACC.SetForgeStatus and not didForge then
                if blockedSel then
                    _ACC.SetForgeStatus(("⏸ %s hasn't reached the stage for your ≥5 scrolls")
                        :format(tostring(sel)))
                else
                    _ACC.SetForgeStatus("Waiting for ≥5 scrolls of an eligible rarity…")
                end
            end
        end
        task.wait(3.0)
    end
end)

-- ============================================================================
-- // 22.5 LOOPS — GALLERY
-- ============================================================================

-- ── Auto Buy Packs ────────────────────────────────────────────────────────
-- Loop strategy (rewritten):
--   1. Refresh stock via GetGalleryStock.
--   2. Build affordable+selected+in-stock+req-met candidate list.
--   3. Sort by chosen strategy (Highest/Lowest/Spread).
--   4. Buy ALL candidates this pass — decrement local stock after each buy
--      and re-read diamonds. This fixes:
--        - "buys very slowly": was 1 buy / 4s, now buys everything available.
--        - "spams No Stock Left": local stock counter prevents firing on
--           sold-out tiers within the same cycle.
--   5. Short pause (1.5s) before next polling cycle.
task.spawn(function()
    while getgenv()._ACCRunning do
        local force = _ACC._GalleryBuyForce
        _ACC._GalleryBuyForce = false

        if _ACC.AutoGalleryBuy or force then
            local stock = galleryRefreshStock(force)

            local diamonds   = Data.Get("Diamonds") or 0
            local discovered = Data.Get("FigurinesDiscovered") or {}
            local nDisc      = #discovered

            -- Whole-shop cost = Σ(price × stock) over every in-stock,
            -- discovery-req-met tier. Matches the native BuyAll spend exactly.
            local wholeShopCost = 0
            local anyStock = false
            for _, k in ipairs(Lists.GalleryPacks) do
                local qty = stock[k] or 0
                if qty > 0 then
                    anyStock = true
                    local cfg = GalleryConfig and GalleryConfig.FigurinePacks
                                and GalleryConfig.FigurinePacks[k]
                    if cfg then
                        local price    = cfg.Price or 0
                        local needDisc = cfg.FigurinesDiscovered or 0
                        if price > 0 and nDisc >= needDisc then
                            wholeShopCost = wholeShopCost + price * qty
                        end
                    end
                end
            end

            if wholeShopCost > 0 and diamonds >= wholeShopCost then
                -- Affordable whole shop → one native call clears every tier.
                Net.Fire(R.Gallery, "BuyAll")
                _ACC.SetGalleryBuyStatus(
                    ("🛒 BuyAll — whole shop (%s 💎)"):format(tostring(wholeShopCost)))
            elseif not anyStock then
                _ACC.SetGalleryBuyStatus("⏳ Shop empty — waiting for restock")
            elseif mapEmpty(_ACC.SelectedGalleryPacks) then
                _ACC.SetGalleryBuyStatus(
                    ("⏸ Can't afford whole shop — pick tier(s) for per-item\n💎 %s / %s")
                    :format(tostring(diamonds), tostring(wholeShopCost)))
            else
                -- Per-item fallback: buy the user's SELECTED tiers.
                local candidates = {}
                for tier in pairs(_ACC.SelectedGalleryPacks) do
                    local cfg = GalleryConfig and GalleryConfig.FigurinePacks
                                and GalleryConfig.FigurinePacks[tier]
                    if cfg and (stock[tier] or 0) > 0 then
                        local price = cfg.Price or 0
                        local needDisc = cfg.FigurinesDiscovered or 0
                        if diamonds >= price and nDisc >= needDisc then
                            table.insert(candidates, {
                                tier = tier, price = price,
                                stock = stock[tier] or 0,
                            })
                        end
                    end
                end

                if #candidates == 0 then
                    _ACC.SetGalleryBuyStatus(
                        ("⏸ Nothing affordable\n💎 %s | discovered %d")
                        :format(tostring(diamonds), nDisc))
                else
                    -- Apply priority strategy
                    local strat = _ACC.GalleryBuyStrategy or "Highest first"
                    if strat == "Highest first" then
                        table.sort(candidates, function(a, b) return a.price > b.price end)
                    elseif strat == "Lowest first" then
                        table.sort(candidates, function(a, b) return a.price < b.price end)
                    elseif strat == "Spread" then
                        _ACC._GallerySpreadIdxBuy = (_ACC._GallerySpreadIdxBuy + 1) % #candidates
                        local rot = _ACC._GallerySpreadIdxBuy
                        local rotated = {}
                        for i, c in ipairs(candidates) do
                            rotated[((i - 1 + rot) % #candidates) + 1] = c
                        end
                        candidates = rotated
                    end

                    -- Buy ALL affordable+in-stock candidates this pass.
                    local bought = 0
                    local lastTier, lastPrice = "", 0
                    for _, c in ipairs(candidates) do
                        if not _ACC.AutoGalleryBuy and not force then break end
                        if not getgenv()._ACCRunning then break end
                        local liveDi = Data.Get("Diamonds") or 0
                        while c.stock > 0
                              and liveDi >= c.price
                              and (_ACC.AutoGalleryBuy or force)
                              and getgenv()._ACCRunning
                        do
                            Net.Fire(R.Gallery, "Buy", c.tier)
                            bought = bought + 1
                            lastTier, lastPrice = c.tier, c.price
                            c.stock = c.stock - 1
                            task.wait(0.25)
                            liveDi = Data.Get("Diamonds") or 0
                        end
                    end

                    if bought > 0 then
                        local diLeft = Data.Get("Diamonds") or 0
                        _ACC.SetGalleryBuyStatus(
                            ("🛒 Bought %d (last: %s @ %d 💎)\n💎 %s | strat: %s")
                            :format(bought, lastTier, lastPrice,
                                    tostring(diLeft), strat))
                    else
                        _ACC.SetGalleryBuyStatus(
                            ("⏸ Could not buy\n💎 %s | strat: %s")
                            :format(tostring(diamonds), strat))
                    end
                end
            end
        else
            _ACC.SetGalleryBuyStatus("Off")
        end
        task.wait(1.5)
    end
end)

-- ── Auto Upgrade Per-Card ────────────────────────────────────────────────
-- Each (card, kind) pair has its own level (max 20). Cost scales with the
-- card's pack Page (newer family = pricier). One upgrade fired per cycle.
task.spawn(function()
    while getgenv()._ACCRunning do
        if not _ACC.AutoGalleryUpgrade then
            _ACC.SetGalleryUpgStatus("Off")
            task.wait(1)
        else
            local upgrades = Data.Get("FigurineUpgrades") or {}
            local diamonds = Data.Get("Diamonds") or 0

            -- Build (card, kind) candidate list based on selected mode
            local cards = {}
            if _ACC.GalleryUpgradeMode == "Specific card" then
                if _ACC.GalleryUpgradeFocusCard
                   and cardsByPack[_ACC.GalleryUpgradeFocusCard]
                then
                    table.insert(cards, _ACC.GalleryUpgradeFocusCard)
                end
            else
                for c in pairs(_ACC.SelectedUpgradeCards) do
                    if cardsByPack[c] then table.insert(cards, c) end
                end
            end

            local kinds = {}
            for k in pairs(_ACC.SelectedUpgradeKinds) do
                table.insert(kinds, k)
            end

            if #cards == 0 then
                _ACC.SetGalleryUpgStatus("⚠ No cards selected")
                task.wait(1)
            elseif #kinds == 0 then
                _ACC.SetGalleryUpgStatus("⚠ No upgrade kinds selected")
                task.wait(1)
            else
                local candidates = {}
                for _, card in ipairs(cards) do
                    local page = cardsByPack[card].page or 1
                    local cardUpg = upgrades[card] or {}
                    for _, kind in ipairs(kinds) do
                        local lvl = cardUpg[kind] or 0
                        if lvl < 20 then
                            local cost = galleryUpgradeCost(lvl + 1, page)
                            if diamonds >= cost then
                                table.insert(candidates, {
                                    card = card, kind = kind,
                                    level = lvl, cost = cost,
                                })
                            end
                        end
                    end
                end

                if #candidates == 0 then
                    _ACC.SetGalleryUpgStatus(
                        ("⏸ Nothing to upgrade (max'd or 💎 short)\n💎 %s")
                        :format(tostring(diamonds)))
                    task.wait(2)
                else
                    local strat = _ACC.GalleryUpgradeStrategy or "Highest first"
                    if strat == "Highest first" then
                        table.sort(candidates, function(a, b) return a.cost > b.cost end)
                    elseif strat == "Lowest first" then
                        table.sort(candidates, function(a, b) return a.cost < b.cost end)
                    end
                    local pickIdx = 1
                    if strat == "Spread" then
                        _ACC._GallerySpreadIdxUpg = (_ACC._GallerySpreadIdxUpg + 1) % #candidates
                        pickIdx = _ACC._GallerySpreadIdxUpg + 1
                    end

                    local p = candidates[pickIdx] or candidates[1]
                    Net.FireRL(R.Gallery,
                               ("Gal:Upg:%s:%s"):format(p.card, p.kind), 0.4,
                               "Upgrade", p.card, p.kind)
                    _ACC.SetGalleryUpgStatus(
                        ("⬆ %s/%s lv %d→%d (cost %d 💎)\n💎 %s | strat: %s")
                        :format(p.card, p.kind, p.level, p.level + 1,
                                p.cost, tostring(diamonds - p.cost), strat))
                    task.wait(0.6)
                end
            end
        end
    end
end)

-- ── Auto Levelup Figurines ───────────────────────────────────────────────
-- Each owned figurine has a level (max 50). Cost = mult * lvl^1.3 * 10.
task.spawn(function()
    while getgenv()._ACCRunning do
        if not _ACC.AutoGalleryLevelup then
            _ACC.SetGalleryLvlStatus("Off")
            task.wait(1)
        elseif mapEmpty(_ACC.SelectedLevelupFigurines) then
            _ACC.SetGalleryLvlStatus("⚠ No figurines selected")
            task.wait(1)
        else
            local owned    = Data.Get("Figurines") or {}
            local diamonds = Data.Get("Diamonds") or 0

            local candidates = {}
            for name in pairs(_ACC.SelectedLevelupFigurines) do
                local info = owned[name]
                if info then
                    local lvl  = tonumber(info.Level) or 0
                    local mult = (GalleryConfig and GalleryConfig.Figurines
                                  and GalleryConfig.Figurines[name]
                                  and GalleryConfig.Figurines[name].Multiplier) or 1
                    if lvl < (GalleryConfig and GalleryConfig.Data and GalleryConfig.Data.MaxLevelup or 50) then
                        local cost = galleryLevelupCost(mult, lvl)
                        if diamonds >= cost then
                            table.insert(candidates, {
                                name = name, level = lvl,
                                mult = mult, cost = cost,
                            })
                        end
                    end
                end
            end

            if #candidates == 0 then
                _ACC.SetGalleryLvlStatus(
                    ("⏸ Nothing affordable / all max\n💎 %s"):format(tostring(diamonds)))
                task.wait(2)
            else
                local strat = _ACC.GalleryLevelupStrategy or "Highest mult first"
                if strat == "Highest mult first" then
                    table.sort(candidates, function(a, b) return a.mult > b.mult end)
                elseif strat == "Lowest mult first" then
                    table.sort(candidates, function(a, b) return a.mult < b.mult end)
                end
                local pickIdx = 1
                if strat == "Spread" then
                    _ACC._GallerySpreadIdxLvl = (_ACC._GallerySpreadIdxLvl + 1) % #candidates
                    pickIdx = _ACC._GallerySpreadIdxLvl + 1
                end

                local p = candidates[pickIdx] or candidates[1]
                Net.FireRL(R.Gallery, "Gal:Lvl:" .. p.name, 0.4,
                           "Levelup", p.name)
                _ACC.SetGalleryLvlStatus(
                    ("⬆ %s lv %d→%d (×%d, cost %d 💎)\n💎 %s | strat: %s")
                    :format(p.name, p.level, p.level + 1, p.mult,
                            p.cost, tostring(diamonds - p.cost), strat))
                task.wait(0.6)
            end
        end
    end
end)

-- ── Auto Claim discovered figurines ──────────────────────────────────────
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoGalleryClaim then
            local discovered = Data.Get("FigurinesDiscovered") or {}
            local claimed    = Data.Get("FigurinesClaimed")    or {}
            local cset = {}
            for _, n in ipairs(claimed) do cset[n] = true end
            local n = 0
            for _, name in ipairs(discovered) do
                if not _ACC.AutoGalleryClaim or not getgenv()._ACCRunning then break end
                if not cset[name] then
                    Net.FireRL(R.Gallery, "Gal:Claim:" .. name, 1.0,
                               "ClaimFigurine", name)
                    n = n + 1
                    task.wait(0.4)
                end
            end
            if n > 0 then Notify(("Gallery: claimed %d figurine bonus(es)"):format(n)) end
        end
        task.wait(15)
    end
end)

-- ── Auto Collect cash from all gallery pages ────────────────────────────
-- Pages mechanic (decompile L29920, L30043):
--   Plot has physical "LeftArrowFigurine" / "RightArrowFigurine" parts
--   tagged "<UserName>-Panels". Clicking them fires
--     Card:FireServer("Page", "RightArrowFigurine")
--   Server flips to next page → fires Gallery:FireClient("PageFlipped", newSlots).
--
-- Page state is persistent between sweeps — if we leave the player parked
-- on the last page, the next sweep starts there and never re-visits earlier
-- pages. So at the end of every sweep we UNWIND with LeftArrowFigurine
-- flips equal to the number of forward flips we made, returning to page 1.
--
-- A page = the current set of figurines mapped onto the plot's physical
-- slots (up to 10). User can have many pages (≤16 in practice). Strategy:
-- collect slots 1..10 on the current page, flip right, repeat until 2
-- consecutive empty pages (Cash + Diamonds delta = 0) or 20-flip cap.
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoGalleryCollect then
            local MAX_FLIPS    = 20
            local prevCash     = Data.Get("Cash")     or 0
            local prevDiams    = Data.Get("Diamonds") or 0
            local emptyRuns    = 0
            local flipsForward = 0

            for _ = 0, MAX_FLIPS do
                if not _ACC.AutoGalleryCollect or not getgenv()._ACCRunning then break end

                -- collect every slot (1..10); server ignores inactive slots
                for slot = 1, 10 do
                    if not _ACC.AutoGalleryCollect or not getgenv()._ACCRunning then break end
                    Net.FireRL(R.Gallery, "Gal:Coll:" .. slot, 0.15,
                               "Collect", tostring(slot))
                    task.wait(0.04)
                end
                task.wait(0.35)   -- let server replicate Cash/Diamonds change

                -- did the page give us anything?
                local nowCash  = Data.Get("Cash")     or 0
                local nowDiams = Data.Get("Diamonds") or 0
                if nowCash == prevCash and nowDiams == prevDiams then
                    emptyRuns = emptyRuns + 1
                    if emptyRuns >= 2 then
                        -- 2 in a row = full cycle complete or no figurines
                        break
                    end
                else
                    emptyRuns = 0
                end
                prevCash, prevDiams = nowCash, nowDiams

                -- flip to the next page (Card remote, Page action)
                Net.Fire(R.Card, "Page", "RightArrowFigurine")
                flipsForward = flipsForward + 1
                task.wait(0.45)
            end

            -- Unwind: flip Left as many times as we went Right, so the next
            -- sweep starts from page 1. Without this we get stuck on the
            -- last page and never re-collect earlier pages.
            for _ = 1, flipsForward do
                if not getgenv()._ACCRunning then break end
                Net.Fire(R.Card, "Page", "LeftArrowFigurine")
                task.wait(0.25)
            end
        end
        task.wait(4)
    end
end)

-- ── Auto Boost: per-pack Stock (NEW) ─────────────────────────────────────
-- Gallery:FireServer("Boost", "Stock", packName)
-- Cost: GalleryConfig.GetStockBoostCost(level+1, packName)  [Diamonds]
-- Cap:  GalleryConfig.Boosts.Stock.MaxLevel
task.spawn(function()
    while getgenv()._ACCRunning do
        if not _ACC.AutoFigurineStockBoost
           or mapEmpty(_ACC.SelectedStockBoostPacks)
           or not GalleryConfig
           or not GalleryConfig.Boosts
           or not GalleryConfig.Boosts.Stock
           or type(GalleryConfig.GetStockBoostCost) ~= "function"
        then
            if _ACC.SetStockBoostStatus then
                _ACC.SetStockBoostStatus(_ACC.AutoFigurineStockBoost
                    and "⚠ Pick pack(s) first" or "Off")
            end
            task.wait(1)
        else
            local maxLv  = GalleryConfig.Boosts.Stock.MaxLevel or 50
            local boosts = Data.Get("FigurineBoosts") or {}
            local diLive = Data.Get("Diamonds") or 0
            local fired, lastPack, lastLv = 0, "", 0

            for pack in pairs(_ACC.SelectedStockBoostPacks) do
                if not _ACC.AutoFigurineStockBoost or not getgenv()._ACCRunning then break end
                local lv = boosts[pack] or 0
                if lv < maxLv then
                    local okCost, cost = pcall(GalleryConfig.GetStockBoostCost, lv + 1, pack)
                    if okCost and type(cost) == "number" and diLive >= cost then
                        Net.FireRL(R.Gallery, "Gal:SB:" .. pack, 0.5,
                                   "Boost", "Stock", pack)
                        fired = fired + 1
                        lastPack, lastLv = pack, lv + 1
                        task.wait(0.35)
                        diLive = Data.Get("Diamonds") or 0
                        boosts = Data.Get("FigurineBoosts") or {}
                    end
                end
            end

            if _ACC.SetStockBoostStatus then
                if fired > 0 then
                    _ACC.SetStockBoostStatus(
                        ("⬆ %d boost(s) — last: %s Lv. %d\n💎 %s")
                        :format(fired, lastPack, lastLv, tostring(diLive)))
                else
                    _ACC.SetStockBoostStatus(
                        ("⏸ Can't afford / max'd\n💎 %s"):format(tostring(diLive)))
                end
            end
            task.wait(2)
        end
    end
end)

-- ── Auto Boost: generic (DiamondMultiplier / FigurineLuck) (NEW) ─────────
-- Gallery:FireServer("Boost", boostName)
-- Cost: GalleryConfig.GetBoostCost(level+1)  [Diamonds]
-- Cap:  GalleryConfig.Boosts[boostName].MaxLevel
task.spawn(function()
    while getgenv()._ACCRunning do
        if not _ACC.AutoFigurineGenericBoost
           or mapEmpty(_ACC.SelectedGenericBoosts)
           or not GalleryConfig
           or not GalleryConfig.Boosts
           or type(GalleryConfig.GetBoostCost) ~= "function"
        then
            if _ACC.SetGenericBoostStatus then
                _ACC.SetGenericBoostStatus(_ACC.AutoFigurineGenericBoost
                    and "⚠ Pick boost(s) first" or "Off")
            end
            task.wait(1)
        else
            local boosts = Data.Get("FigurineBoosts") or {}
            local diLive = Data.Get("Diamonds") or 0
            local fired, lastName, lastLv = 0, "", 0

            for boostName in pairs(_ACC.SelectedGenericBoosts) do
                if not _ACC.AutoFigurineGenericBoost or not getgenv()._ACCRunning then break end
                local cfg = GalleryConfig.Boosts[boostName]
                local maxLv = cfg and cfg.MaxLevel or 50
                local lv = boosts[boostName] or 0
                if lv < maxLv then
                    local okCost, cost = pcall(GalleryConfig.GetBoostCost, lv + 1)
                    if okCost and type(cost) == "number" and diLive >= cost then
                        Net.FireRL(R.Gallery, "Gal:GB:" .. boostName, 0.5,
                                   "Boost", boostName)
                        fired = fired + 1
                        lastName, lastLv = boostName, lv + 1
                        task.wait(0.35)
                        diLive = Data.Get("Diamonds") or 0
                        boosts = Data.Get("FigurineBoosts") or {}
                    end
                end
            end

            if _ACC.SetGenericBoostStatus then
                if fired > 0 then
                    _ACC.SetGenericBoostStatus(
                        ("⬆ %d boost(s) — last: %s Lv. %d\n💎 %s")
                        :format(fired, lastName, lastLv, tostring(diLive)))
                else
                    _ACC.SetGenericBoostStatus(
                        ("⏸ Can't afford / max'd\n💎 %s"):format(tostring(diLive)))
                end
            end
            task.wait(2)
        end
    end
end)

-- ============================================================================
-- // 23. LOOPS — MISC (ESP, AntiAFK, Webhook, HUD hide)
-- ============================================================================

-- ── Anti-AFK ──────────────────────────────────────────────────────────────
-- The game runs its OWN anti-AFK in CardHandler.AntiAFK:
--     while time() - lastInput <= 1020 do task.wait(5) end
--     Remotes.Card:FireServer("TP", autoRollGrade, autoRollTower)  -- TP to AFK place
-- `lastInput` is reset only by UserInputService.InputBegan / TouchTap.
-- VirtualUser:ClickButton2 does NOT fire those signals, so the timer keeps
-- counting and the player gets teleported to the AFK universe → kicked → rejoin.
--
-- Fix: hook __namecall and drop Card:FireServer("TP", ...) when AntiAFK is on.
-- Verified: "TP" is the only action sent through the Card remote (single grep
-- match in decompiled), so this block is safe.
--
-- The VirtualUser:ClickButton2 path is kept as well — it handles Roblox's
-- engine-level 20-min idle kick (separate from the game's custom AntiAFK).
do
    local Card = R.Card
    local hooked = false

    -- Preferred path: hookmetamethod (most modern executors).
    if hookmetamethod then
        local oldNC
        oldNC = hookmetamethod(game, "__namecall", function(self, ...)
            if _ACC.AntiAFK and self == Card then
                local method = getnamecallmethod and getnamecallmethod()
                if method == "FireServer" and (...) == "TP" then
                    return
                end
            end
            return oldNC(self, ...)
        end)
        hooked = true
        getgenv()._ACCNamecallRestore = function()
            -- hookmetamethod returns the original; we can't cleanly unhook,
            -- but disabling _ACC.AntiAFK already neutralizes the hook.
        end

    -- Fallback: raw metatable manipulation.
    elseif getrawmetatable and (setreadonly or make_writeable) then
        local mt = getrawmetatable(game)
        local protect = setreadonly or make_writeable
        pcall(protect, mt, false)
        local oldNC = mt.__namecall
        local nc = function(self, ...)
            if _ACC.AntiAFK and self == Card then
                local method = getnamecallmethod and getnamecallmethod()
                if method == "FireServer" and (...) == "TP" then
                    return
                end
            end
            return oldNC(self, ...)
        end
        mt.__namecall = newcclosure and newcclosure(nc) or nc
        pcall(protect, mt, true)
        hooked = true
        getgenv()._ACCNamecallRestore = function()
            pcall(protect, mt, false)
            mt.__namecall = oldNC
            pcall(protect, mt, true)
        end
    end

    if not hooked then
        warn("[ACC_HUB] anti-AFK namecall hook unsupported by this executor")
    end
end

-- ── VirtualUser fallback for Roblox engine-level Idled kick (20 min) ───────
-- VirtualUser:ClickButton2() only works when called from inside an Idled
-- signal callback — Roblox ignores synthetic input outside that context.
do
    local GC = getconnections or get_signal_cons

    -- silence Roblox's built-in Idled connections (auto-kick engine).
    -- Remember the ones we :Disable so _ACCCleanup can :Enable them again on
    -- unload (Disconnect is irreversible, so those are not tracked).
    getgenv()._ACCDisabledIdled = getgenv()._ACCDisabledIdled or {}
    if GC then
        pcall(function()
            for _, c in ipairs(GC(LocalPlayer.Idled)) do
                if c.Disable then
                    c:Disable()
                    if c.Enable then table.insert(getgenv()._ACCDisabledIdled, c) end
                elseif c.Disconnect then c:Disconnect() end
            end
        end)
    end

    table.insert(_ACC._connections, LocalPlayer.Idled:Connect(function()
        if _ACC.AntiAFK and getgenv()._ACCRunning then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end))
end

-- ── Webhook: rare event notifications ────────────────────────────────────
-- Compact-embed style: author = player, color sidebar, title + description,
-- inline fields with stats, footer = plot, ISO timestamp (Discord renders
-- it as relative — "5 min ago"). One unified sender; each event picks its
-- own emoji/color/fields.
--
-- Triggers (each gated by its own toggle):
--   _ACC.WebhookDrops      → new card/pet/achievement, rare card mutations
--   _ACC.WebhookRaid       → raid completion
--   _ACC.WebhookDBComplete → DragonBalls reached 7/7
--   _ACC.WebhookPetMutation→ pet got Rainbow/Diamond/Emerald/Void mutation
--   _ACC.WebhookCardMax    → card hit ⭐5
local lastMutations    = {}   -- Cards.<name>.Mutation
local lastPetMutations = {}   -- Pets.<name>.Mutation
local lastCardStars    = {}   -- Cards.<name>.Star
local dbCompleteFired  = false

local MUTATION_COLOR = {
    Rainbow = 0xFF06EA,
    Diamond = 0x10D7FF,
    Emerald = 0x2ECC71,
    Void    = 0x9B59B6,
    Gold    = 0xF1C40F,
}

local function sendEmbed(opts)
    -- opts: { emoji, title, desc?, color, fields? }
    if _ACC.WebhookURL == "" then return end
    local req = (syn and syn.request) or http_request or request or (http and http.request)
    if not req then return end

    local displayName = LocalPlayer.DisplayName ~= nil
                        and LocalPlayer.DisplayName ~= LocalPlayer.Name
                        and (LocalPlayer.DisplayName .. " (@" .. LocalPlayer.Name .. ")")
                        or LocalPlayer.Name

    local body = HttpService:JSONEncode({
        username = "ApelHub",
        embeds = {{
            author = { name = displayName },
            title = (opts.emoji and (opts.emoji .. "  ") or "") .. tostring(opts.title or ""),
            description = opts.desc,
            color = opts.color,
            fields = opts.fields,
            footer = { text = ("plot %s • ACC"):format(Plot.GetName()) },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        }},
    })
    safe(req, { Url = _ACC.WebhookURL, Method = "POST",
                Headers = { ["Content-Type"] = "application/json" }, Body = body })
end

-- Test-webhook handler used by the Misc tab button.
_ACC._WebhookTest = function()
    sendEmbed({
        emoji = "🔧",
        title = "Test webhook",
        desc  = "If you see this, the URL works.",
        color = 0x57F287,
        fields = {
            { name = "Status", value = "OK",      inline = true },
            { name = "Hub",    value = "ApelHub", inline = true },
        },
    })
end

-- ── Travel Merchant purchase webhook (WebhookMerchant) ────────────────────
-- buyMerchantItem() pushes each successful buy into _ACC._merchantBuyQueue.
-- This drains the queue every couple seconds so a whole buy-pass collapses
-- into ONE embed listing exactly what was bought (item × count, price, payment).
task.spawn(function()
    while getgenv()._ACCRunning do
        task.wait(2)
        local q = _ACC._merchantBuyQueue
        if q and #q > 0 then
            _ACC._merchantBuyQueue = {}   -- drain even if toggle off, so it can't grow unbounded
            if _ACC.WebhookMerchant and _ACC.WebhookURL ~= "" then
                -- collapse duplicates: item -> { n, price, via }
                local counts, order = {}, {}
                for _, b in ipairs(q) do
                    local c = counts[b.item]
                    if not c then
                        c = { n = 0, price = b.price, via = b.via }
                        counts[b.item] = c
                        table.insert(order, b.item)
                    end
                    c.n = c.n + 1
                end
                local lines = {}
                for _, item in ipairs(order) do
                    local c = counts[item]
                    local payTxt = (c.via == "Tokens") and "Tokens"
                                   or (c.via == "Trade") and "pack-trade" or "Cash"
                    local priceTxt = c.price and (" — " .. tostring(c.price) .. " " .. payTxt)
                                     or (" — " .. payTxt)
                    table.insert(lines, ("• **%s** ×%d%s"):format(
                        tostring(item):gsub("-", " "), c.n, priceTxt))
                end
                sendEmbed({
                    emoji = "🛒",
                    title = "Travel Merchant purchase",
                    desc  = table.concat(lines, "\n"),
                    color = 0xF1C40F,
                    fields = { { name = "Items bought", value = tostring(#q), inline = true } },
                })
            end
        end
    end
end)

Data.OnChange(function(opType, path, newVal)
    if _ACC.WebhookURL == "" then return end

    -- ── Rare drops bucket (WebhookDrops) ───────────────────────────────────
    if _ACC.WebhookDrops and opType == "ArrayInsert" then
        if path[1] == "CardsDiscovered" then
            sendEmbed({ emoji = "📚", title = "New card discovered",
                        color = 0xFEE75C,
                        fields = { { name = "Card", value = tostring(newVal), inline = true } } })
        elseif path[1] == "PetsClaimed" then
            sendEmbed({ emoji = "🐾", title = "New pet claimed",
                        color = 0x57F287,
                        fields = { { name = "Pet", value = tostring(newVal), inline = true } } })
        elseif path[1] == "Achievements" then
            sendEmbed({ emoji = "🏆", title = "Achievement unlocked",
                        color = 0xEB459E,
                        fields = { { name = "Name", value = tostring(newVal), inline = true } } })
        end
    end

    -- ── Card mutation (WebhookDrops, Diamond/Rainbow only) ────────────────
    -- Dedupe on prev value so repeat SetValue with the same mutation (e.g.
    -- replica re-sync after rejoin) doesn't re-ping.
    if opType == "SetValue" and path[1] == "Cards" and path[3] == "Mutation" then
        local cardName = tostring(path[2])
        local prev = lastMutations[cardName]
        lastMutations[cardName] = newVal
        if _ACC.WebhookDrops and prev ~= newVal
           and (newVal == "Diamond" or newVal == "Rainbow") then
            sendEmbed({
                emoji = "✨",
                title = newVal .. " mutation",
                desc  = ("**%s** ascended to **%s** tier"):format(cardName, newVal),
                color = MUTATION_COLOR[newVal] or 0xFFFFFF,
                fields = {
                    { name = "Card",     value = cardName, inline = true },
                    { name = "Mutation", value = newVal,   inline = true },
                },
            })
        end
    end

    -- ── Raid completion ───────────────────────────────────────────────────
    if _ACC.WebhookRaid and opType == "ArrayInsert" and path[1] == "RaidsDefeated" then
        sendEmbed({ emoji = "⚔️", title = "Raid completed",
                    color = 0xED4245,
                    fields = { { name = "Raid", value = tostring(newVal), inline = true } } })
    end

    -- ── DragonBalls 7/7 (WebhookDBComplete) ───────────────────────────────
    -- Replica stores DragonBalls as { ["1"]=assetId, ..., ["7"]=assetId }.
    -- Fire once when count transitions from <7 to 7; reset the flag when
    -- count drops back below 7 (after wish, server clears the set).
    if opType == "SetValue" and path[1] == "DragonBalls" then
        local balls = Data.Get("DragonBalls") or {}
        local n = 0
        for _ in pairs(balls) do n = n + 1 end
        if n >= 7 then
            if _ACC.WebhookDBComplete and not dbCompleteFired then
                dbCompleteFired = true
                sendEmbed({
                    emoji = "🐉",
                    title = "Dragon Ball set complete — 7/7",
                    desc  = "Ready to make a wish.",
                    color = 0xFF8C00,
                    fields = {
                        { name = "Wish type", value = tostring(_ACC.DBWishType or "Cash"), inline = true },
                        { name = "Auto-wish", value = _ACC.DragonBallAuto and "on" or "off", inline = true },
                    },
                })
            end
        else
            dbCompleteFired = false
        end
    end

    -- ── Pet mutation (WebhookPetMutation) ─────────────────────────────────
    if opType == "SetValue" and path[1] == "Pets" and path[3] == "Mutation" then
        local petName = tostring(path[2])
        local prev = lastPetMutations[petName]
        lastPetMutations[petName] = newVal
        if _ACC.WebhookPetMutation and prev ~= newVal
           and (newVal == "Rainbow" or newVal == "Diamond"
                or newVal == "Emerald" or newVal == "Void") then
            sendEmbed({
                emoji = "🐾",
                title = newVal .. " pet mutation",
                desc  = ("**%s** rolled **%s**"):format(petName, newVal),
                color = MUTATION_COLOR[newVal] or 0xFFFFFF,
                fields = {
                    { name = "Pet",      value = petName, inline = true },
                    { name = "Mutation", value = newVal,  inline = true },
                },
            })
        end
    end

    -- ── Card ⭐5 (WebhookCardMax) ──────────────────────────────────────────
    -- Cards.<name>.Star is a string ("1".."5"). Fire once per transition
    -- to "5"; track last value so re-imports don't re-trigger.
    if opType == "SetValue" and path[1] == "Cards" and path[3] == "Star" then
        local cardName = tostring(path[2])
        local prev = lastCardStars[cardName]
        lastCardStars[cardName] = newVal
        if _ACC.WebhookCardMax and tostring(newVal) == "5" and tostring(prev) ~= "5" then
            local cardData = (Data.GetTable() or {}).Cards or {}
            local entry = cardData[cardName] or {}
            local fields = {
                { name = "Card",  value = cardName,                                inline = true },
                { name = "Stars", value = "⭐⭐⭐⭐⭐",                             inline = true },
            }
            if entry.Mutation then
                table.insert(fields, { name = "Mutation", value = tostring(entry.Mutation), inline = true })
            end
            if entry.Grade then
                table.insert(fields, { name = "Grade",    value = tostring(entry.Grade),    inline = true })
            end
            sendEmbed({
                emoji = "⭐",
                title = "Card reached ⭐5",
                desc  = ("**%s** is now max-star."):format(cardName),
                color = 0xFFD700,
                fields = fields,
            })
        end
    end
end)

-- HUD popup hider (event-driven: only runs when a new CashChange label spawns)
task.spawn(function()
    local cc
    while getgenv()._ACCRunning and not cc do
        local hud = PlayerGui:FindFirstChild("HUD")
        local frame = hud and hud:FindFirstChild("Frame")
        cc = frame and frame:FindFirstChild("CashChange")
        if not cc then task.wait(0.5) end
    end
    if not (cc and getgenv()._ACCRunning) then return end
    -- hide anything already present
    for _, c in ipairs(cc:GetChildren()) do
        if _ACC.HideHUDPopups and c:IsA("TextLabel") then c.Visible = false end
    end
    table.insert(_ACC._connections, cc.ChildAdded:Connect(function(c)
        if _ACC.HideHUDPopups and getgenv()._ACCRunning and c:IsA("TextLabel") then
            c.Visible = false
        end
    end))
end)
-- ============================================================================
-- // 23.5 v44 UPDATE — Figurine Grade/Trait roll, Live Event, Ad Restock
-- ============================================================================

-- ── new remotes ──────────────────────────────────────────────────────────
R.LiveEvent = RemotesFolder:FindFirstChild("LiveEvent")
R.GetEvent  = RemotesFolder:FindFirstChild("GetEvent")
R.Ads       = RemotesFolder:FindFirstChild("Ads")

-- ── new config: Shared.LiveEvents (data-only) ──────────────────────────────
local LiveEvents
do
    local sharedF = ModulesFolder:FindFirstChild("Shared")
    local m = sharedF and sharedF:FindFirstChild("LiveEvents")
    LiveEvents = m and tryRequire(m) or nil
end

local AD_COOLDOWN = 900  -- Configuration/Merchant.AdCooldown (v44)

-- ── new state ──────────────────────────────────────────────────────────────
_ACC.AutoFigGrade         = false
_ACC.SelectedFigGradeFigs = {}   -- map of figurine names
_ACC.WantedFigGrades      = {}   -- map of grades
_ACC.AutoFigTrait         = false
_ACC.SelectedFigTraitFigs = {}   -- map
_ACC.WantedFigTraits      = {}   -- map

_ACC.LiveEventAutoVote     = false
_ACC.LiveEventWanted       = {}  -- map of event names (priority via Lists order)
_ACC.LiveEventAutoBuy      = false
_ACC.SelectedLiveEventItems= {}  -- map of shop item keys

_ACC.AutoAdRestock         = false

-- ── new lists ──────────────────────────────────────────────────────────────
do
    -- Figurine Grades, best→worst (UR rarest). Filter to what config actually has.
    local gradeOrder = { "UR", "SR", "SS", "S+", "S", "A", "B", "C", "D", "E", "F" }
    Lists.FigGrades = {}
    local gcfg = GalleryConfig and GalleryConfig.Grades
    for _, g in ipairs(gradeOrder) do
        if not gcfg or gcfg[g] then table.insert(Lists.FigGrades, g) end
    end
    if #Lists.FigGrades == 0 then Lists.FigGrades = gradeOrder end

    -- Figurine Traits, best→worst (diamond income multiplier).
    local traitOrder = { "Prismatic", "Royal", "Diamond3", "Diamond2", "Diamond1" }
    Lists.FigTraits = {}
    local tcfg = GalleryConfig and GalleryConfig.Traits
    for _, t in ipairs(traitOrder) do
        if not tcfg or tcfg[t] then table.insert(Lists.FigTraits, t) end
    end
    if #Lists.FigTraits == 0 then Lists.FigTraits = traitOrder end

    -- Live Event types — fixed priority order (best farm value first), filtered
    -- to what the config offers.
    local evOrder = { "Cash", "Diamonds", "Luck", "XP", "MutationChance",
                      "FigurineLuck", "PetLuck", "PackDiscount" }
    Lists.LiveEventTypes = {}
    local ecfg = LiveEvents and LiveEvents.Events
    for _, e in ipairs(evOrder) do
        if not ecfg or ecfg[e] then table.insert(Lists.LiveEventTypes, e) end
    end
    if ecfg then
        for k in pairs(ecfg) do
            local seen = false
            for _, e in ipairs(Lists.LiveEventTypes) do if e == k then seen = true break end end
            if not seen then table.insert(Lists.LiveEventTypes, k) end
        end
    end

    -- Live Event shop items (sorted by price asc).
    Lists.LiveEventShop = {}
    if LiveEvents and type(LiveEvents.Shop) == "table" then
        for k in pairs(LiveEvents.Shop) do table.insert(Lists.LiveEventShop, k) end
        table.sort(Lists.LiveEventShop, function(a, b)
            local pa = (LiveEvents.Shop[a] or {}).Price or 0
            local pb = (LiveEvents.Shop[b] or {}).Price or 0
            if pa ~= pb then return pa < pb end
            return a < b
        end)
    end
end

-- ============================================================================
-- UI — Gallery tab: Figurine Grade Roll + Trait Roll (left column)
-- ============================================================================
sec.GalLvlL:Divider()
sec.GalLvlL:Header({ Text = "Figurine Grade Roll (Diamonds)" })

_ACC.SetFigGradeStatus = makeStatus(sec.GalLvlL)

makeSearchableDropdown(sec.GalLvlL, {
    Name = "Figurines to grade-roll",
    Multi = true,
    Options = Lists.GalleryFigurines,
    OnChange = function(map) _ACC.SelectedFigGradeFigs = map end,
}, "FigGradeFigsDropdown")

makeSearchableDropdown(sec.GalLvlL, {
    Name = "Wanted Grades (stop on)",
    Multi = true,
    Options = Lists.FigGrades,
    OnChange = function(map) _ACC.WantedFigGrades = map end,
}, "FigGradeWantedDropdown")

sec.GalLvlL:Toggle({
    Name = "Auto Grade Roll",
    Default = false,
    Callback = function(v) _ACC.AutoFigGrade = v end,
}, "AutoFigGradeToggle")

sec.GalLvlL:Divider()
sec.GalLvlL:Header({ Text = "Figurine Trait Roll (Figurine Tokens)" })

_ACC.SetFigTraitStatus = makeStatus(sec.GalLvlL)

makeSearchableDropdown(sec.GalLvlL, {
    Name = "Figurines to trait-roll",
    Multi = true,
    Options = Lists.GalleryFigurines,
    OnChange = function(map) _ACC.SelectedFigTraitFigs = map end,
}, "FigTraitFigsDropdown")

makeSearchableDropdown(sec.GalLvlL, {
    Name = "Wanted Traits (stop on)",
    Multi = true,
    Options = Lists.FigTraits,
    OnChange = function(map) _ACC.WantedFigTraits = map end,
}, "FigTraitWantedDropdown")

sec.GalLvlL:Toggle({
    Name = "Auto Trait Roll",
    Default = false,
    Callback = function(v) _ACC.AutoFigTrait = v end,
}, "AutoFigTraitToggle")

-- ============================================================================
-- UI — Shops tab: Live Event (new Left + Right sections, keeps L/R pairing)
-- ============================================================================
sec.LEL = tabs.Shops:Section({ Side = "Left" })
sec.LER = tabs.Shops:Section({ Side = "Right" })

sec.LEL:Header({ Text = "Live Event — Vote" })
_ACC.SetLiveEventStatus = makeStatus(sec.LEL)

makeSearchableDropdown(sec.LEL, {
    Name = "Vote for (priority order)",
    Multi = true,
    Options = Lists.LiveEventTypes,
    OnChange = function(map) _ACC.LiveEventWanted = map end,
}, "LiveEventWantedDropdown")

sec.LEL:Toggle({
    Name = "Auto Vote (when vote phase opens)",
    Default = false,
    Callback = function(v) _ACC.LiveEventAutoVote = v end,
}, "LiveEventAutoVoteToggle")

sec.LER:Header({ Text = "Live Event — Shop" })
sec.LER:Paragraph({
    Header = "Whitelist mode",
    Body = "Pick items to auto-buy with Live Event Tokens whenever you can afford them.",
})

makeSearchableDropdown(sec.LER, {
    Name = "Items to auto-buy",
    Multi = true,
    Options = Lists.LiveEventShop,
    OnChange = function(map) _ACC.SelectedLiveEventItems = map end,
}, "LiveEventItemsDropdown")

sec.LER:Toggle({
    Name = "Auto Buy shop (Live Event Tokens)",
    Default = false,
    Callback = function(v) _ACC.LiveEventAutoBuy = v end,
}, "LiveEventAutoBuyToggle")

sec.LER:Button({
    Name = "Buy Selected Now",
    Callback = function()
        if not (LiveEvents and LiveEvents.Shop) then Notify("Live Event config missing"); return end
        if mapEmpty(_ACC.SelectedLiveEventItems) then Notify("Nothing selected"); return end
        local tokens = Data.Get("LiveEventTokens") or 0
        local n = 0
        for item in pairs(_ACC.SelectedLiveEventItems) do
            local cfg = LiveEvents.Shop[item]
            if cfg and cfg.Price and tokens >= cfg.Price then
                Net.Fire(R.LiveEvent, "Buy", item)
                tokens = tokens - cfg.Price
                n = n + 1
                task.wait(0.3)
            end
        end
        Notify("Sent " .. n .. " buy requests")
    end,
})

-- ============================================================================
-- UI — Shops tab: Ad restock toggle (appended to existing Travel Merchant)
-- ============================================================================
sec.MerR:Divider()
sec.MerR:Toggle({
    Name = "Free ad restock (watch-ad bypass, 15m CD)",
    Default = false,
    Callback = function(v) _ACC.AutoAdRestock = v end,
}, "AutoAdRestockToggle")

-- ============================================================================
-- LOOPS
-- ============================================================================

-- ── Figurine Grade roll (Diamonds) ──────────────────────────────────────
-- Client-driven, mirrors the card Grade roller: for each selected+owned
-- figurine, spam RollGrade until its Grade is one of the wanted grades,
-- gated by Diamonds >= GetGradeCost(figurine).
task.spawn(function()
    runRollEngine({
        flag      = function() return _ACC.AutoFigGrade end,
        setStatus = _ACC.SetFigGradeStatus,
        selected  = function() return _ACC.SelectedFigGradeFigs end,
        wanted    = function() return _ACC.WantedFigGrades end,
        noTargetsMsg = "⚠ No figurines selected",
        noWantedMsg  = "⚠ No wanted grades selected",
        noneOwnedMsg = "⚠ None of the selected figurines are owned",
        buildList = function()
            local owned = Data.Get("Figurines") or {}
            local list = {}
            -- highest multiplier first: GalleryFigurines is sorted mult ASC,
            -- so walk it in reverse to grade the strongest figurines first.
            for i = #Lists.GalleryFigurines, 1, -1 do
                local name = Lists.GalleryFigurines[i]
                if _ACC.SelectedFigGradeFigs[name] and owned[name] then
                    table.insert(list, name)
                end
            end
            return list
        end,
        rollOne = function(name, idx, total)
            local cur = Data.Get("Figurines", name, "Grade")
            if cur and mapHas(_ACC.WantedFigGrades, cur) then
                _ACC.SetFigGradeStatus(("✅ %s = %s\n(%d/%d done)")
                    :format(name, cur, idx, total))
                return false
            end
            local cost = 0
            if GalleryConfig and type(GalleryConfig.GetGradeCost) == "function" then
                local ok, c = pcall(GalleryConfig.GetGradeCost, name)
                if ok and type(c) == "number" then cost = c end
            end
            local dia = Data.Get("Diamonds") or 0
            if cost > 0 and dia < cost then
                _ACC.SetFigGradeStatus(("⏸ %s — need %d 💎 (have %d)")
                    :format(name, cost, dia))
                return false
            end
            _ACC.SetFigGradeStatus(("🎲 [%d/%d] %s\nGrade: %s  cost %d 💎  (have %d)")
                :format(idx, total, name, tostring(cur or "none"), cost, dia))
            if not _ACC.AutoFigGrade or not getgenv()._ACCRunning then return false end
            Net.FireRL(R.Gallery, "Gal:RollGrade:" .. name, 0.4, "RollGrade", name)
            return true
        end,
        loopWait = 1,
    })
end)

-- ── Figurine Trait roll (Figurine Tokens, 1 per roll) ────────────────────
task.spawn(function()
    runRollEngine({
        flag      = function() return _ACC.AutoFigTrait end,
        setStatus = _ACC.SetFigTraitStatus,
        selected  = function() return _ACC.SelectedFigTraitFigs end,
        wanted    = function() return _ACC.WantedFigTraits end,
        noTargetsMsg = "⚠ No figurines selected",
        noWantedMsg  = "⚠ No wanted traits selected",
        noneOwnedMsg = "⚠ None of the selected figurines are owned",
        buildList = function()
            local owned = Data.Get("Figurines") or {}
            local list = {}
            -- highest multiplier first (walk the ASC-sorted list in reverse)
            for i = #Lists.GalleryFigurines, 1, -1 do
                local name = Lists.GalleryFigurines[i]
                if _ACC.SelectedFigTraitFigs[name] and owned[name] then
                    table.insert(list, name)
                end
            end
            return list
        end,
        rollOne = function(name, idx, total)
            local cur = Data.Get("Figurines", name, "Trait")
            if cur and mapHas(_ACC.WantedFigTraits, cur) then
                _ACC.SetFigTraitStatus(("✅ %s = %s\n(%d/%d done)")
                    :format(name, cur, idx, total))
                return false
            end
            local toks = Data.Get("FigurineTokens") or 0
            if toks < 1 then
                _ACC.SetFigTraitStatus(("⏸ Out of Figurine Tokens\n%s — trait: %s")
                    :format(name, tostring(cur or "none")))
                return false
            end
            _ACC.SetFigTraitStatus(("🎲 [%d/%d] %s\nTrait: %s  FigTokens: %d")
                :format(idx, total, name, tostring(cur or "none"), toks))
            if not _ACC.AutoFigTrait or not getgenv()._ACCRunning then return false end
            Net.FireRL(R.Gallery, "Gal:RollTrait:" .. name, 0.4, "RollTrait", name)
            return true
        end,
        loopWait = 1,
    })
end)

-- ── Live Event: auto-vote + auto-buy shop ────────────────────────────────
-- Vote phase: workspace attribute "EventVoteStart" set; GetEvent:InvokeServer()
-- returns an array of the offered event names. We vote once per session for
-- the highest-priority wanted event that's actually offered.
task.spawn(function()
    local votedStamp
    while getgenv()._ACCRunning do
        -- VOTE
        if _ACC.LiveEventAutoVote and R.LiveEvent and not mapEmpty(_ACC.LiveEventWanted) then
            local voteStart = workspace:GetAttribute("EventVoteStart")
            if voteStart and voteStart ~= votedStamp then
                local opts = R.GetEvent and Net.Invoke(R.GetEvent) or nil
                if type(opts) == "table" then
                    local offered = {}
                    for _, ev in pairs(opts) do
                        if type(ev) == "string" then offered[ev] = true end
                    end
                    local pick
                    for _, ev in ipairs(Lists.LiveEventTypes) do  -- priority order
                        if _ACC.LiveEventWanted[ev] and offered[ev] then pick = ev; break end
                    end
                    if pick then
                        Net.Fire(R.LiveEvent, "Vote", pick)
                        votedStamp = voteStart
                        _ACC.SetLiveEventStatus("🗳 Voted: " .. pick)
                    else
                        _ACC.SetLiveEventStatus("🗳 Vote open — none of wanted offered")
                    end
                end
            elseif not voteStart then
                local active = workspace:GetAttribute("Event")
                _ACC.SetLiveEventStatus(active and ("⚡ Active event: " .. tostring(active))
                                               or "Idle (no vote / event)")
            end
        elseif _ACC.LiveEventAutoVote then
            _ACC.SetLiveEventStatus("⚠ Pick events to vote for")
        end

        -- BUY SHOP
        if _ACC.LiveEventAutoBuy and R.LiveEvent and LiveEvents and LiveEvents.Shop
           and not mapEmpty(_ACC.SelectedLiveEventItems)
        then
            local tokens = Data.Get("LiveEventTokens") or 0
            for item in pairs(_ACC.SelectedLiveEventItems) do
                if not _ACC.LiveEventAutoBuy or not getgenv()._ACCRunning then break end
                local cfg = LiveEvents.Shop[item]
                if cfg and cfg.Price and tokens >= cfg.Price then
                    Net.FireRL(R.LiveEvent, "LE:Buy:" .. item, 0.5, "Buy", item)
                    tokens = tokens - cfg.Price
                    task.wait(0.4)
                end
            end
        end

        task.wait(3)
    end
end)

-- ── Ads: free Travel Merchant restock ────────────────────────────────────
-- Fires Ads:FireServer("Watch","RestockMerchant"). Server gates on
-- Data.AdWatchTime + 900s cooldown; we respect the same cooldown so we don't
-- spam. On executors that can't show a rewarded ad the server usually grants
-- the restock from the "Watch" call anyway; if not, it's a silent no-op.
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoAdRestock and R.Ads then
            local last = Data.Get("AdWatchTime") or 0
            local now  = workspace:GetServerTimeNow()
            if (now - last) >= AD_COOLDOWN then
                Net.FireRL(R.Ads, "Ads:Restock", 30, "Watch", "RestockMerchant")
            end
        end
        task.wait(20)
    end
end)
-- ============================================================================
-- // 23.6 v44 — AUTO HATCH POTIONS (speed up / instant-open placed packs)
-- ============================================================================
-- HatchTime potions cut a FIXED number of seconds off EVERY placed pack at once
-- (1 potion → all packs). Tiers: HatchTime1 -120s, HatchTime2 -360s,
-- HatchTime3 -900s. Each pack can absorb at most MaxHatchPotions (=25 + the
-- HatchPotions upgrade, up to 45) potions, after which it stops reducing.
--
-- A placed pack's remaining time is read live from its timer label
-- (tagged "<Name>-PackTimer"): remaining = Hatch - (now - Time), where
--   Time  = placement timestamp, Hatch = total hatch duration (seconds).
--
-- This is the SMART counterpart to "Auto Use Potions": it drinks only as many
-- as needed to clear the slowest pack, in chunks, and detects when a pack hits
-- its cap (drop << expected) so it never pours hundreds of potions into a pack
-- that can't be reduced further.

-- HatchTime tiers, smallest buff first
local HatchTiers = {}
do
    for _, key in ipairs({ "HatchTime1", "HatchTime2", "HatchTime3" }) do
        local cfg = Consumables and Consumables[key]
        if cfg and cfg.Buff then
            table.insert(HatchTiers, {
                key     = key,
                buff    = cfg.Buff,                       -- seconds removed per potion
                display = cfg.Display or key,
            })
        end
    end
    table.sort(HatchTiers, function(a, b) return a.buff < b.buff end)
end
local HatchTierDisplays = {}
local HatchDisplayToKey = {}
for _, t in ipairs(HatchTiers) do
    table.insert(HatchTierDisplays, t.display)
    HatchDisplayToKey[t.display] = t.key
end

_ACC.AutoHatchPotions = false
_ACC.HatchTiersAllowed = {}                  -- map of allowed tier KEYS
for _, t in ipairs(HatchTiers) do _ACC.HatchTiersAllowed[t.key] = true end
_ACC.HatchStrategy     = "Auto (conserve, finish within cap)"
_ACC.HatchAfterPlaceDone = true   -- drink only once AutoPlace can't place anything more

-- per-pack potion cap = base 25 + HatchPotions upgrade buff (1/level, max 20)
local function hatchCap()
    local up = (Data.GetTable() or {}).Upgrades
    local bonus = (up and up.HatchPotions and up.HatchPotions.Buff) or 0
    return 25 + bonus
end

-- ── UI (Auto Farm tab, appended under Auto Place) ─────────────────────────
sec.AFPlaceL:Divider()
sec.AFPlaceL:Header({ Text = "Auto Hatch Potions" })

_ACC.SetHatchStatus = makeStatus(sec.AFPlaceL)

sec.AFPlaceL:Dropdown({
    Name = "Allowed HatchTime tiers",
    Multi = true,
    Options = HatchTierDisplays,
    Default = HatchTierDisplays,
    Callback = function(selected)
        local out = {}
        for disp, on in pairs(mapFromMulti(selected)) do
            if on then out[HatchDisplayToKey[disp] or disp] = true end
        end
        _ACC.HatchTiersAllowed = out
    end,
}, "HatchTiersDropdown")

sec.AFPlaceL:Dropdown({
    Name = "Tier strategy",
    Multi = false,
    Options = {
        "Auto (conserve, finish within cap)",
        "Smallest first",
        "Largest first",
    },
    Default = _ACC.HatchStrategy,
    Callback = function(v) _ACC.HatchStrategy = v end,
}, "HatchStrategyDropdown")

sec.AFPlaceL:Toggle({
    Name = "Only after AutoPlace can't place more",
    Default = true,
    Callback = function(v) _ACC.HatchAfterPlaceDone = v end,
}, "HatchAfterPlaceDoneToggle")

sec.AFPlaceL:Toggle({
    Name = "Enable Auto Hatch Potions",
    Default = false,
    Callback = function(v) _ACC.AutoHatchPotions = v end,
}, "AutoHatchPotionsToggle")

-- ── loop ──────────────────────────────────────────────────────────────────
task.spawn(function()
    local cappedSet = setmetatable({}, { __mode = "k" })  -- weak: drops opened packs

    -- count free placement slots (Bundle counts as 5)
    local function freeSlots()
        local rep = Data.GetReplica()
        if not (rep and rep.Data) then return nil end
        local maxP = rep.Data.MaxPlacements or 25
        local used = numPacksPlaced(rep.Data.PacksPlaced)
        return maxP - used
    end

    -- read placed pack timers → { {label, remaining}, ... }
    local function readPacks()
        local now  = workspace:GetServerTimeNow()
        local out  = {}
        for _, lbl in ipairs(CollectionService:GetTagged(LocalPlayer.Name .. "-PackTimer")) do
            if lbl:IsDescendantOf(workspace) then
                local hatch = lbl:GetAttribute("Hatch")
                local startT = lbl:GetAttribute("Time")
                if hatch and startT then
                    out[#out + 1] = { label = lbl, remaining = hatch - (now - startT) }
                end
            end
        end
        return out
    end

    -- placement saturated: nothing AutoPlace could place right now. True when
    -- the board is full OR no selected pack still fits the free space (e.g.
    -- 55/58 used, 3 free, but only bundles owned which need 5; or no cards).
    -- Uses the SAME selection + slot math as AutoPlace.
    local function placementDone()
        local rep = Data.GetReplica()
        if not (rep and rep.Data) then return false end
        local fs = freeSlots()
        if fs == nil then return false end
        if fs <= 0 then return true end
        -- during the level farm, test against the focus family's full set
        -- (bundles+singles) so we only open once NEITHER fits the free space.
        local sel = _ACC._FarmPlacing and (_ACC._FarmPlaceAll or {}) or (_ACC.SelectedPlacePacks or {})
        local ownedPacks = rep.Data.Packs or {}
        local maxP = rep.Data.MaxPlacements or 25
        local cap = math.min(tonumber(_ACC.SinglePlaceCap) or maxP, maxP)
        for displayName in pairs(sel) do
            local serverName = tostring(displayName):gsub(" ", "-")
            local isBundle   = serverName:match("%-Bundle$") ~= nil
            local slotCost   = isBundle and 5 or 1
            local minFree    = math.max(slotCost, maxP - cap + slotCost)
            if (ownedPacks[serverName] or 0) > 0 and fs >= minFree then
                return false   -- something still fits (within the cap) → not done
            end
        end
        return true            -- nothing selected can be placed into free space
    end

    -- pick a tier by strategy among allowed + owned (>0). maxRem drives "Auto".
    local function pickTier(maxRem)
        local owned = Data.Get("Consumables") or {}
        local avail = {}
        for _, t in ipairs(HatchTiers) do
            if _ACC.HatchTiersAllowed[t.key] and (tonumber(owned[t.key]) or 0) > 0 then
                table.insert(avail, t)   -- HatchTiers already smallest→largest
            end
        end
        if #avail == 0 then return nil end

        local strat = _ACC.HatchStrategy or "Auto (conserve, finish within cap)"
        if strat == "Largest first" then
            return avail[#avail]
        elseif strat == "Smallest first" then
            return avail[1]
        else
            -- Auto: smallest owned tier that can finish the bottleneck within
            -- the per-pack cap (cap * buff >= maxRem). Else the largest owned.
            local cap = hatchCap()
            for _, t in ipairs(avail) do            -- smallest→largest
                if cap * t.buff >= maxRem then return t end
            end
            return avail[#avail]
        end
    end

    local doneStreak = 0
    while getgenv()._ACCRunning do
        if not (_ACC.AutoHatchPotions or _ACC._FarmPlacing) then
            _ACC.SetHatchStatus("Off")
            doneStreak = 0
            task.wait(1)
        else
            local afterDone = _ACC.HatchAfterPlaceDone or _ACC._FarmPlacing
            local packs = readPacks()
            if #packs == 0 then
                _ACC.SetHatchStatus("⏸ No packs placed")
                doneStreak = 0
                task.wait(2)
            elseif afterDone and not placementDone() then
                -- AutoPlace can still place something → let it finish first
                doneStreak = 0
                _ACC.SetHatchStatus(("⏸ Placement not done yet (%d free slots)")
                    :format(freeSlots() or 0))
                task.wait(2)
            elseif afterDone and doneStreak < 2 then
                -- debounce: confirm saturation across 2 checks so we don't race
                -- AutoPlace mid-cycle (inventory/PacksPlaced replicating)
                doneStreak = doneStreak + 1
                _ACC.SetHatchStatus("⏳ Confirming placement is done...")
                task.wait(1.5)
            else
                -- active = remaining > 1s and not yet capped
                local active = {}
                local maxRem = 0
                for _, p in ipairs(packs) do
                    if p.remaining > 1 and not cappedSet[p.label] then
                        table.insert(active, p)
                        if p.remaining > maxRem then maxRem = p.remaining end
                    end
                end

                if #active == 0 then
                    -- nothing left to speed up: either all opening or all capped
                    local stuck = 0
                    for _, p in ipairs(packs) do
                        if p.remaining > 1 then stuck = stuck + 1 end
                    end
                    _ACC.SetHatchStatus(stuck > 0
                        and ("✓ Done — %d pack(s) hit the %d-potion cap, finishing on timer")
                            :format(stuck, hatchCap())
                        or  "✓ All placed packs ready")
                    task.wait(4)
                else
                    local tier = pickTier(maxRem)
                    if not tier then
                        _ACC.SetHatchStatus(("⏸ Out of allowed HatchTime potions\nSlowest pack: ~%ds left")
                            :format(math.ceil(maxRem)))
                        task.wait(3)
                    else
                        local owned = tonumber((Data.Get("Consumables") or {})[tier.key]) or 0
                        -- chunk to finish the bottleneck, capped at 10 per Apply10
                        local need  = math.ceil(maxRem / tier.buff)
                        local chunk = math.min(need, owned)
                        if chunk < 1 then chunk = 0 end

                        _ACC.SetHatchStatus(("🧪 %s  (-%ds each)\nSlowest pack: ~%ds  |  active: %d\nDrinking %d (own %d)  cap %d/pack")
                            :format(tier.display, tier.buff, math.ceil(maxRem),
                                    #active, chunk, owned, hatchCap()))

                        -- snapshot before
                        local before = {}
                        for _, p in ipairs(active) do before[p.label] = p.remaining end

                        local drunk = 0
                        while chunk > 0 and _ACC.AutoHatchPotions and getgenv()._ACCRunning do
                            local step = math.min(chunk, 10)
                            if step >= 10 then
                                Net.Fire(R.Potion, "Apply10", tier.key)
                                drunk = drunk + 10
                            else
                                for _ = 1, step do
                                    Net.Fire(R.Potion, "Apply", tier.key)
                                    drunk = drunk + 1
                                    task.wait(0.12)
                                end
                            end
                            chunk = chunk - step
                            task.wait(0.3)
                        end

                        task.wait(0.4)   -- let server replicate new Hatch/Time

                        -- cap detection: if a pack's remaining dropped far less
                        -- than expected (drunk * buff), it hit its cap.
                        local after = readPacks()
                        local afterMap = {}
                        for _, p in ipairs(after) do afterMap[p.label] = p.remaining end
                        local expected = drunk * tier.buff
                        for lbl, rem0 in pairs(before) do
                            local rem1 = afterMap[lbl]
                            if rem1 ~= nil then
                                local drop = rem0 - rem1
                                if drop < expected * 0.6 and rem1 > 1 then
                                    cappedSet[lbl] = true
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- ============================================================================
-- // 23.7 v44 — AUTO LEVEL FARM (cards → Lv. 30, weakest family first)
-- ============================================================================
-- A macro that DRIVES the existing AutoPlace + AutoHatchPotions engines.
-- It does NOT buy anything — it only places + opens packs already in inventory.
--
-- Per family, walked weakest→strongest (Lists.Packs = Page order, Pirate first):
--   * place that family's BUNDLES first (5 cards each = most XP/slot), falling
--     back to its SINGLES when no bundle fits the free space or none are owned;
--   * once nothing more of the family fits, the hatch engine opens the board;
--   * repeat until the family's packs run out OR every discovered card in it
--     is Lv.30, then advance to the next family.
--
-- Control handshake: while enabled it sets _ACC._FarmPlacing = true and feeds
-- _FarmPlacePacks (phase set) + _FarmPlaceAll (whole family) to the engines.
-- The hatch tier choice / strategy is taken from the existing Auto Hatch
-- Potions settings, so pick which HatchTime tiers it may drink there.
local FARM_TARGET_LEVEL = 30   -- hard target per spec

-- owned packs of a family split into bundle/single display-name sets
local function farmFamilyPacks(family)
    local rep = Data.GetReplica()
    local packs = (rep and rep.Data and rep.Data.Packs) or {}
    local bundles, singles, count = {}, {}, 0
    local pat = "^" .. family .. "%-"
    for key, cnt in pairs(packs) do
        if (tonumber(cnt) or 0) > 0
           and (key == family or tostring(key):find(pat)) then
            count = count + (tonumber(cnt) or 0)
            local disp = tostring(key):gsub("-", " ")
            if tostring(key):find("%-Bundle$") then
                bundles[disp] = true
            else
                singles[disp] = true
            end
        end
    end
    return bundles, singles, count
end

-- family done = every card in its config List is discovered AND ≥ target,
-- OR we own no more of its packs (supply exhausted — nothing left to farm).
local function farmFamilyDone(family)
    local list = (CardConfig and CardConfig.Packs and CardConfig.Packs[family]
                  and CardConfig.Packs[family].List) or {}
    local maxed, total = true, 0
    for cardName in pairs(list) do
        total = total + 1
        local cd = Data.Get("Cards", cardName)
        if not cd or (tonumber(cd.Level) or 0) < FARM_TARGET_LEVEL then
            maxed = false
        end
    end
    if total > 0 and maxed then return true end          -- all cards at target
    local _, _, owned = farmFamilyPacks(family)
    return owned <= 0                                     -- no packs left to open
end

-- count discovered+leveled cards of a family for status
local function farmFamilyProgress(family)
    local list = (CardConfig and CardConfig.Packs and CardConfig.Packs[family]
                  and CardConfig.Packs[family].List) or {}
    local at, total = 0, 0
    for cardName in pairs(list) do
        total = total + 1
        local cd = Data.Get("Cards", cardName)
        if cd and (tonumber(cd.Level) or 0) >= FARM_TARGET_LEVEL then at = at + 1 end
    end
    return at, total
end

-- ── UI (Auto Farm tab, own section) ───────────────────────────────────────
sec.LvlFarmL = tabs.AutoFarm:Section({ Side = "Left" })
sec.LvlFarmL:Header({ Text = "Auto Level Farm (cards → Lv. 30)" })

_ACC.SetLvlFarmStatus = makeStatus(sec.LvlFarmL)

sec.LvlFarmL:Paragraph({
    Header = "How it works",
    Body = "Places bundles first (then singles) of the weakest family, opens them with Hatch potions, and moves up family by family until every card is Lv.30 or packs run out. Uses your inventory only — no buying. Pick which HatchTime tiers it may drink in 'Auto Hatch Potions' above. Turning this on disables manual Auto Place.",
})

sec.LvlFarmL:Toggle({
    Name = "Enable Auto Level Farm",
    Default = false,
    Callback = function(v)
        _ACC.LvlFarmEnabled = v
        if v then
            -- take over: stop manual AutoPlace so it doesn't fight the farm
            _ACC.AutoPlaceEnabled = false
            pcall(function()
                if MacLib.Options.AutoPlaceToggle
                   and MacLib.Options.AutoPlaceToggle.UpdateState then
                    MacLib.Options.AutoPlaceToggle:UpdateState(false)
                end
            end)
        else
            _ACC._FarmPlacing = false
            _ACC._FarmPlacePacks = {}
            _ACC._FarmPlaceAll = {}
        end
    end,
}, "LvlFarmToggle")

-- ── controller loop ────────────────────────────────────────────────────────
task.spawn(function()
    local function freeSlotsFarm()
        local rep = Data.GetReplica()
        if not (rep and rep.Data) then return nil end
        local maxP = rep.Data.MaxPlacements or 25
        local used = numPacksPlaced(rep.Data.PacksPlaced)
        return maxP - used
    end

    while getgenv()._ACCRunning do
        if not _ACC.LvlFarmEnabled then
            _ACC._FarmPlacing = false
            _ACC._FarmPlacePacks = {}
            _ACC._FarmPlaceAll = {}
            _ACC.SetLvlFarmStatus("Off")
            task.wait(1)
        else
            _ACC._FarmPlacing = true   -- engines active while farm runs

            -- focus = weakest family not yet done
            local focus
            for _, family in ipairs(Lists.Packs) do
                if not farmFamilyDone(family) then focus = family; break end
            end

            if not focus then
                -- nothing left to place; keep engines on so hatch opens any
                -- residual placed packs, then idle.
                _ACC._FarmPlacePacks = {}
                _ACC._FarmPlaceAll   = {}
                _ACC.SetLvlFarmStatus("✓ All families farmed (cards at Lv.30 or packs exhausted)")
                task.wait(4)
            else
                local bundles, singles, owned = farmFamilyPacks(focus)
                local all = {}
                for k in pairs(bundles) do all[k] = true end
                for k in pairs(singles) do all[k] = true end
                _ACC._FarmPlaceAll = all

                local rep0  = Data.GetReplica()
                local maxP  = (rep0 and rep0.Data and rep0.Data.MaxPlacements) or 25
                local free  = freeSlotsFarm() or 0
                local cap = math.min(tonumber(_ACC.SinglePlaceCap) or maxP, maxP)
                local bundleMinFree = math.max(5, maxP - cap + 5)   -- cap applies to bundles too
                local singleMinFree = math.max(1, maxP - cap + 1)
                local phase
                if next(bundles) and free >= bundleMinFree then
                    _ACC._FarmPlacePacks = bundles
                    phase = "placing bundles"
                elseif next(singles) and free >= singleMinFree then
                    _ACC._FarmPlacePacks = singles
                    phase = "placing singles"
                else
                    _ACC._FarmPlacePacks = {}
                    phase = "opening (cap reached / no fit)"
                end

                local at, total = farmFamilyProgress(focus)
                _ACC.SetLvlFarmStatus(("🎯 %s → Lv.%d\n%s\nCards %d/%d at target  |  packs owned: %d  |  free slots: %d")
                    :format(focus, FARM_TARGET_LEVEL, phase, at, total, owned, free))
                task.wait(2)
            end
        end
    end
end)

-- ============================================================================
-- // 23.8 GLOBAL TRAVEL SNIPE WEBHOOK (hardcoded, always-on, all users)
-- ============================================================================
-- Collects Travel Merchant restocks from EVERYONE running the script into one
-- shared Discord channel for sniping. Fires once per merchant spawn (per user)
-- when the merchant offers a pack ABOVE Stray in the family order (Paradise /
-- Monster and anything ranked higher in future updates). Includes the JobId so
-- others can paste it into Misc → Server Join.
--
-- NOTE on scale: a single Discord webhook is globally limited (~30 req/min). At
-- a large user count this can still get throttled/blocked despite per-spawn
-- dedup here. The robust fix is a relay backend (script → your server → Discord)
-- so the URL isn't in the client and you can batch/throttle. This is the
-- hardcoded-URL version as requested.
local GLOBAL_TRAVEL_WEBHOOK = "https://discord.com/api/webhooks/1511054384010887248/DQUnz82KB-V4Xj6fI5iCK9vQfV9_33bNpIUnB-vC1cw-D0Iqwm2ukcQLrnlXBtBeTzmz"

do
    -- family rank (weak→strong) from Lists.Packs. "Valuable" = one of the LAST N
    -- families (the newest/strongest). Threshold is computed from the list length,
    -- so a game update that adds pack families auto-raises the bar — no manual edit.
    local rank = {}
    for i, fam in ipairs(Lists.Packs) do rank[fam] = i end
    local TOP_FAMILIES = 5
    local valuableThreshold = #Lists.Packs - TOP_FAMILIES   -- rank > this ⇒ top-N family

    local MerchantHandler = UIClient and tryRequire(UIClient:FindFirstChild("MerchantHandler"))

    local function familyOf(itemKey)
        return tostring(itemKey):match("^[^%-]+")
    end
    local function isValuable(itemKey, category)
        if category ~= "Packs" and category ~= "Bundle" then return false end
        local r = rank[familyOf(itemKey)]
        return r ~= nil and r > valuableThreshold
    end
    local function prettyItem(itemKey)
        return tostring(itemKey):gsub("-", " ")
    end
    local function mutationOf(itemKey)
        return tostring(itemKey):match("^[^%-]+%-([^%-]+)")   -- 2nd "-" segment = mutation
    end

    local httpreq = (syn and syn.request) or http_request or request or (http and http.request)

    local function sendGlobalTravel(items, total, origin)
        if not httpreq then return end
        local lines = {}
        for _, it in ipairs(items) do table.insert(lines, "• " .. it) end
        if #lines == 0 then lines = { "(no items listed)" } end
        -- origin tells whether detection fired because the merchant was already
        -- up when the script loaded ("at-load"), or because the script was
        -- already running and caught a fresh spawn ("live-spawn" — the real test).
        local payload = {
            username = "Travel Sniper",
            embeds = {{
                title = "🛒 Travel Merchant spawned!",
                description = "```\n" .. table.concat(lines, "\n") .. "\n```",
                color = 0xF1C40F,
                fields = {
                    { name = "JobId (paste in Server Join)",
                      value = "```" .. tostring(game.JobId) .. "```", inline = false },
                    { name = "PlaceId", value = tostring(game.PlaceId), inline = true },
                    { name = "Players",
                      value = ("%d/%d"):format(#Players:GetPlayers(), Players.MaxPlayers),
                      inline = true },
                    { name = "Items offered", value = tostring(total), inline = true },
                },
                footer = { text = ("ACC • detect: %s • by %s")
                    :format(tostring(origin or "?"), LocalPlayer.Name) },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            }},
        }
        safe(httpreq, {
            Url = GLOBAL_TRAVEL_WEBHOOK,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(payload),
        })
    end

    task.spawn(function()
        local wasUp    = false
        local lastSent = 0
        local sawDown  = false   -- have we observed a NO-merchant state since load?
        while getgenv()._ACCRunning do
            task.wait(6)

            -- "Merchant up?" — use the game's OWN live signals, NOT the workspace
            -- "MerchantTime" attribute. That attribute is read in exactly one spot
            -- in MerchantHandler (→ a dead MerchantSpawnTime field) and is often
            -- absent, so the old `session ~= ""` guard silently never fired.
            -- Authoritative client signal: MerchantHandler.MerchantActive (set true
            -- in MerchantSpawned, even on mid-merchant injection via Connections).
            -- Fallback: workspace attribute "Merchant" (the flag the game gates on).
            local up = MerchantHandler and MerchantHandler.MerchantActive
            if up == nil then up = workspace:GetAttribute("Merchant") end
            up = up == true
            if not up then sawDown = true end   -- proves the script was running with no merchant

            -- rising edge (down→up) → a merchant just spawned: fire ONCE for EVERY
            -- spawn, no value filtering (detect-all mode). wasUp resets on despawn,
            -- so the next spawn fires again. The 15s guard only protects against flag
            -- flicker, not normal per-spawn dedup.
            if up and not wasUp and R.GetMerchantItems and (os.clock() - lastSent) > 15 then
                -- Cached path: reuse the merchant snapshot the auto-buy loop just
                -- pulled instead of a duplicate GetMerchantItems round-trip. The
                -- snapshot exposes the server's Item/Category as e.item/e.category.
                local raw = Shops.RefreshMerchant()
                if type(raw) == "table" then
                    local items, total = {}, 0
                    for _, info in ipairs(raw) do
                        if type(info) == "table" and info.item then
                            total = total + 1
                            -- markers ONLY on ⭐ top-4 items (so lower cards don't
                            -- clutter the search): ⭐ + 💰 bundle + 🌈 Rainbow
                            local marks = ""
                            if isValuable(info.item, info.category) then
                                marks = "⭐"
                                if info.category == "Bundle" then marks = marks .. "💰" end
                                if mutationOf(info.item) == "Rainbow" then marks = marks .. "🌈" end
                                marks = " " .. marks
                            end
                            table.insert(items, ("%s [%s]%s")
                                :format(prettyItem(info.item), tostring(info.category or "?"), marks))
                        end
                    end
                    -- origin: "live-spawn" if we'd already seen a no-merchant tick
                    -- (script was running, caught a fresh spawn — the real test),
                    -- else "at-load" (merchant was already up when the script loaded).
                    local origin = sawDown and "live-spawn" or "at-load"
                    print(("[ACC-Travel] (%s) merchant up — %d items: %s")
                        :format(origin, total, table.concat(items, ", ")))
                    -- send on ANY spawn (filters removed); still skip a truly empty poll
                    if total > 0 then
                        sendGlobalTravel(items, total, origin)
                        lastSent = os.clock()
                    end
                end
            end
            wasUp = up
        end
    end)
end

-- ============================================================================
-- // 23.9 AUTO SERVER HOP (delay after load, then jump to a fresh server)
-- ============================================================================
-- Finds a low-pop server via the public servers API and TeleportToPlaceInstance.
-- The delay gives the rest of the script time to load and buy before hopping.
-- Re-execution on the next server relies on the executor's auto-execute (the
-- script is "always on"); queue_on_teleport is used as a best-effort backup
-- when the executor supports it AND we can re-reference our own source.
task.spawn(function()
    local MerchantHandler = UIClient and tryRequire(UIClient:FindFirstChild("MerchantHandler"))

    pcall(function() math.randomseed(os.clock() * 1e4 % 2147483647) end)

    local function findAndHop()
        local placeId = game.PlaceId
        local jobId   = game.JobId
        local maxPl   = _ACC.HopMaxPlayers or 10
        local maxPing = 300
        local cursor  = ""
        local deadline = os.clock() + 8
        local TP = (cloneref and cloneref(game:GetService("TeleportService")))
                   or game:GetService("TeleportService")

        -- Collect a pool of eligible servers across pages, then pick one at
        -- RANDOM. Picking the first match (old behaviour) made the bot bounce
        -- between the same 1-2 servers; random spreads the hop across the
        -- server list so sniping actually scans different servers.
        local candidates = {}
        while getgenv()._ACCRunning and os.clock() < deadline do
            local url = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100&cursor=%s")
                :format(placeId, HttpService:UrlEncode(cursor))
            local ok, data = pcall(function()
                local body = httpGet(url)
                return body and HttpService:JSONDecode(body) or nil
            end)
            if not ok or type(data) ~= "table" or type(data.data) ~= "table" then
                if #candidates == 0 then return false, "api error" end
                break
            end
            for _, server in ipairs(data.data) do
                if server.id ~= jobId
                   and (tonumber(server.playing) or 0) <= maxPl
                   and (not server.ping or server.ping <= maxPing)
                then
                    candidates[#candidates + 1] = server.id
                end
            end
            if #candidates >= 30 then break end   -- enough to randomize over
            cursor = data.nextPageCursor or ""
            if cursor == "" then break end
        end

        if not getgenv()._ACCRunning then return false end
        if #candidates == 0 then return false, "no server found" end

        local pick = candidates[math.random(1, #candidates)]
        local tok = pcall(function()
            TP:TeleportToPlaceInstance(placeId, pick, LocalPlayer)
        end)
        if tok then return true end       -- teleport fired; client will leave
        return false, "teleport failed"
    end

    local function merchantUp()
        return (MerchantHandler and MerchantHandler.MerchantActive == true)
            or (workspace:GetAttribute("Merchant") == true)
    end

    local function hopOnward(label)
        _ACC.SetHopStatus(label or "🔍 Searching next server...")
        local ok, why = findAndHop()
        if ok then
            _ACC.SetHopStatus("✈ Hopping to next server...")
            task.wait(5)   -- if still here, teleport didn't take — retry
        else
            _ACC.SetHopStatus(("⚠ Hop failed (%s) — retrying"):format(tostring(why or "?")))
            task.wait(5)
        end
    end

    local stayStart = nil   -- os.clock() when we landed on the current merchant server

    while getgenv()._ACCRunning do
        local manual = _ACC._HopNow
        if manual then _ACC._HopNow = false end

        if manual then
            -- manual "Hop Now" — hop once, unconditionally.
            stayStart = nil
            _ACC.SetHopStatus("🔍 Hop Now — searching...")
            local ok, why = findAndHop()
            if ok then
                _ACC.SetHopStatus("✈ Teleporting...")
                task.wait(5)
            else
                _ACC.SetHopStatus(("⚠ Hop failed (%s)"):format(tostring(why or "?")))
                task.wait(3)
            end

        elseif _ACC.AutoHopEnabled then
            -- SNIPE MODE: hop fresh low-pop servers UNTIL one has an active Travel
            -- Merchant, then STAY a buy-window (so Auto Buy Travel Merchant can grab
            -- it) and hop onward — keeps cycling merchant → buy → next merchant.
            if merchantUp() then
                if not stayStart then stayStart = os.clock() end   -- just arrived at a merchant
                local stayed = os.clock() - stayStart
                local buyWin = _ACC.HopBuyWindow or 15
                if stayed >= buyWin then
                    stayStart = nil
                    hopOnward("✅ Buy window done — next server...")
                else
                    _ACC.SetHopStatus(("🎯 Merchant! buying — hop in %ds")
                        :format(math.ceil(buyWin - stayed)))
                    task.wait(0.5)
                end
            else
                -- no merchant here: give the freshly-joined server a moment for
                -- merchant state to replicate (HopDelay = settle), then hop onward.
                stayStart = nil
                local waited = os.clock() - (_ACC._hopLoadClock or 0)
                local settle = _ACC.HopDelay or 10
                if waited < settle then
                    _ACC.SetHopStatus(("🔎 No merchant — hopping in %ds")
                        :format(math.ceil(settle - waited)))
                    task.wait(0.5)
                else
                    hopOnward("🔍 No merchant — next server...")
                end
            end
        else
            _ACC.SetHopStatus("Off")
            stayStart = nil
            task.wait(1)
        end
    end
end)

-- ============================================================================
-- // 24. CLEANUP / UNLOAD
-- ============================================================================
getgenv()._ACCCleanup = function()
    -- 1. signal all loops to stop (next iteration check)
    getgenv()._ACCRunning = false
    task.wait(0.6)

    -- 2. disconnect Replica + RBXScriptConnections
    if _ACC._connections then
        for _, c in ipairs(_ACC._connections) do pcall(function() c:Disconnect() end) end
        _ACC._connections = {}
    end

    -- 2b. revert FPS Boost mutations (lighting/quality/shadows/fog/post-FX)
    if getgenv()._ACCFPSRestore then
        pcall(getgenv()._ACCFPSRestore)
        getgenv()._ACCFPSRestore = nil
    end

    -- 3. restore monkey-patched functions
    if getgenv()._ACCHooks then
        for _, h in pairs(getgenv()._ACCHooks) do
            pcall(function() h.holder[h.name] = h.original end)
        end
        getgenv()._ACCHooks = {}
    end
    if getgenv()._ACCNamecallRestore then
        pcall(getgenv()._ACCNamecallRestore)
        getgenv()._ACCNamecallRestore = nil
    end

    -- 3.5. restore Roblox's native Idled (auto-kick) connections we disabled
    if getgenv()._ACCDisabledIdled then
        for _, c in ipairs(getgenv()._ACCDisabledIdled) do
            pcall(function() if c.Enable then c:Enable() end end)
        end
        getgenv()._ACCDisabledIdled = nil
    end

    -- 4. unload UI window
    if getgenv()._ACCUI then
        pcall(function() getgenv()._ACCUI:Unload() end)
        getgenv()._ACCUI = nil
    end

    -- 5. wipe globals
    getgenv()._ACCCleanup = nil
    print("[ACC_HUB] unloaded")
end

-- ============================================================================
-- // 25. INIT FINISH — config save/load + default tab
-- ============================================================================

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

-- 1. set MacLib autosave folder for this hub
pcall(function() MacLib:SetFolder("ApelHub") end)

-- 1a. backwards-compat: migrate configs from old folder name "ACCHub"
-- to new "ApelHub" so users keep their saved settings on first launch.
-- One-shot: removes the old folder after successful copy.
-- Marker file prevents re-running the migration.
pcall(function()
    if not (isfolder and isfile and listfiles and writefile and readfile) then
        return  -- executor lacks file IO
    end
    local OLD = "MacLib/ACCHub"
    local NEW = "MacLib/ApelHub"
    local MARKER = NEW .. "/.migrated_from_ACCHub"

    if not isfolder(OLD) then return end          -- nothing to migrate
    if isfile(MARKER) then return end             -- already migrated

    if not isfolder(NEW) then
        pcall(makefolder, NEW)
    end

    local migrated = 0
    for _, path in ipairs(listfiles(OLD)) do
        local fname = path:match("[^/\\]+$")
        if fname and not isfile(NEW .. "/" .. fname) then
            local ok, contents = pcall(readfile, path)
            if ok and contents then
                pcall(writefile, NEW .. "/" .. fname, contents)
                migrated = migrated + 1
            end
        end
    end

    pcall(writefile, MARKER, tostring(os.time()))

    -- best-effort cleanup of old folder
    if delfolder then pcall(delfolder, OLD) end

    if migrated > 0 then
        print(("[ACC_HUB] migrated %d config file(s) ACCHub → ApelHub"):format(migrated))
    end
end)

-- 2. wrap AutoSave to (a) no-op during initial load — restore-time callbacks
-- would otherwise spam the JSON file once per element — and (b) debounce
-- post-load writes so a dragged slider coalesces to ~1 disk write / 0.6s
-- instead of one per step. The final write is never lost: the latest call's
-- self/args are always flushed when the debounce window elapses.
local _configLoading = true
local _origAutoSave = MacLib.AutoSave
if type(_origAutoSave) == "function" then
    local _saveQueued = false
    local _savePending = nil   -- { self, args } of the most recent call
    local _saveInterval = 0.6
    MacLib.AutoSave = function(self, ...)
        if _configLoading then return end
        _savePending = { self = self, n = select("#", ...), args = { ... } }
        if _saveQueued then return end
        _saveQueued = true
        task.delay(_saveInterval, function()
            _saveQueued = false
            local p = _savePending
            _savePending = nil
            if p then
                pcall(function() _origAutoSave(p.self, table.unpack(p.args, 1, p.n)) end)
            end
        end)
    end
end

-- 3. load the auto-load config file (sets every option's .Value but in this
-- fork DOES NOT fire each option's Callback)
pcall(function() MacLib:LoadAutoLoadConfig() end)

-- 4. re-apply each loaded value via the option's Update method — this fires
-- the Callback we wrote in the UI builders, so _ACC state syncs to the
-- restored values. AutoSave is wrapped above so this loop is silent.
pcall(function()
    if type(MacLib.Options) == "table" then
        for _, opt in pairs(MacLib.Options) do
            if type(opt) == "table" and opt.Value ~= nil then
                if type(opt.UpdateState) == "function" then
                    pcall(function() opt:UpdateState(opt.Value) end)            -- toggles
                elseif type(opt.UpdateSelection) == "function" then
                    pcall(function() opt:UpdateSelection(opt.Value) end)        -- dropdowns
                elseif type(opt.UpdateValue) == "function" then
                    pcall(function() opt:UpdateValue(opt.Value) end)            -- inputs/sliders
                end
            end
        end
    end
end)

-- 5. release autosave now that initial restore is done
_configLoading = false
_ACC.IsLoadingConfig = false
_ACC.ModulesLoaded = true

-- 6. default to Auto Farm tab on launch
pcall(function()
    if _ACC._tabs and _ACC._tabs.AutoFarm and _ACC._tabs.AutoFarm.Select then
        _ACC._tabs.AutoFarm:Select()
    end
end)

Notify(("Loaded — %s, plot %s"):format(LocalPlayer.Name, Plot.GetName()), 5)
print("[ACC_HUB] loaded — " .. LocalPlayer.Name .. " — plot " .. Plot.GetName())
