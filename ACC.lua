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
local VirtualUser        = game:GetService("VirtualUser")
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

-- ── Combat state ──────────────────────────────────────────────────────────
_ACC.TowerAutoStart        = false
_ACC.HideBattle            = false
_ACC.AutoTrait             = false
_ACC.AutoArmor             = false
_ACC.SelectedTraitCards    = {}   -- map
_ACC.SelectedWantedTraits  = {}   -- map
_ACC.WantedArmorGrade      = nil

_ACC.STAutoStart           = false
_ACC.STAutoAttack          = false
_ACC.STHideAnim            = false
_ACC.STSelectedCard        = nil
_ACC.STSelectedDifficulty  = nil

_ACC.AutoGrade             = false
_ACC.GradeUseTokensFirst   = true
_ACC.SelectedGradeCards    = {}   -- map
_ACC.SelectedWantedGrades  = {}   -- map

_ACC.RaidQuickStart        = false
_ACC.RaidAutoVote          = false
_ACC.RaidAutoJoin          = false
_ACC.RaidSelectedCards     = {}   -- map

-- ── Auto Claim ────────────────────────────────────────────────────────────
_ACC.CodesInput            = ""
_ACC.CodesURL              = ""
_ACC.AutoAchievements      = false
_ACC.AutoRewards           = false
_ACC.AutoExpSend           = false
_ACC.AutoExpClaim          = false
_ACC.SkipExpedition        = false

-- ── Shops ─────────────────────────────────────────────────────────────────
_ACC.AutoStock             = false
_ACC.AutoMerchant          = false
_ACC.StockSpecific         = ""
_ACC.MerchantSpecific      = ""
_ACC.SelectedPetEggs       = {}   -- map
_ACC.PetRoll1              = false
_ACC.PetRoll5              = false
_ACC.DragonBallAuto        = false

-- ── Inventory ─────────────────────────────────────────────────────────────
_ACC.PEMethod              = "Upgrade"
_ACC.PESelectedPacks       = {}   -- map
_ACC.PEFromRarity          = "Regular"
_ACC.PEEnabled             = false
_ACC.SelectedPotions       = {}   -- map
_ACC.AutoCraftPotions      = false
_ACC.SelectedUpgrades      = {}   -- map
_ACC.AutoUpgrade           = false
_ACC.RelicApply            = false
_ACC.RelicApply10          = false
_ACC.RelicCraft            = false

-- ── Misc ──────────────────────────────────────────────────────────────────
_ACC.WebhookURL            = ""
_ACC.WebhookDrops          = false
_ACC.WebhookRaid           = false
_ACC.AntiAFK               = true
_ACC.HideHUDPopups         = false

-- ── Internal ──────────────────────────────────────────────────────────────
_ACC._connections          = {}
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
local function dbg(msg)
    if _ACC.Debug then print("[ACC] " .. tostring(msg)) end
end

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
    R.GetClanInfo      = get("GetClanInfo")
    R.GetMerchantItems = get("GetMerchantItems")
    R.GetStock         = get("GetStock")
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

    local cards = {}
    if CardConfig and CardConfig.Packs then
        for _, packData in pairs(CardConfig.Packs) do
            if type(packData) == "table" and type(packData.List) == "table" then
                for cardName in pairs(packData.List) do table.insert(cards, cardName) end
            end
        end
    end
    table.sort(cards)
    Lists.Cards = cards   -- internal names (kept for backwards compat / loops)
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
    table.sort(Lists.CardsDisplay)

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

    local potions = {}
    if Consumables then
        for k in pairs(Consumables) do table.insert(potions, k) end
    end
    table.sort(potions)
    Lists.Potions = potions
end

-- // 10. LIBRARY SETUP
local MacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dvorfkar6-lab/uis/refs/heads/main/Mac"))()
local Window = MacLib:Window({
    Title    = "Anime Card Collection",
    Subtitle = "ACC Hub",
    Size     = UDim2.fromOffset(865, 650),
    DragStyle = 2,
    Keybind  = Enum.KeyCode.LeftControl,
    AcrylicBlur = false,
})
getgenv()._ACCUI = Window

local function Notify(text, lifetime)
    Window:Notify({ Title = "ACC Hub", Description = text, Lifetime = lifetime or 3 })
end

local tabGroups = { Main = Window:TabGroup() }
local tabs = {
    AutoFarm  = tabGroups.Main:Tab({ Name = "Auto Farm",  Image = "rbxassetid://10723416765" }),
    Combat    = tabGroups.Main:Tab({ Name = "Combat",     Image = "rbxassetid://10734975692" }),
    AutoClaim = tabGroups.Main:Tab({ Name = "Auto Claim", Image = "rbxassetid://10723348925" }),
    Shops     = tabGroups.Main:Tab({ Name = "Shops",      Image = "rbxassetid://10747372992" }),
    Inventory = tabGroups.Main:Tab({ Name = "Inventory",  Image = "rbxassetid://10723396225" }),
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
    CodesL    = tabs.AutoClaim:Section({ Side = "Left" }),
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
-- our own. This helper just adds Select All / Deselect All buttons next to
-- a multi-dropdown.
-- params: { Name, Options, Multi=true|false, Default, OnChange(map_or_value) }
-- flag:   string ID for MacLib.Options[flag]
local function makeSearchableDropdown(section, params, flag)
    local isMulti = params.Multi ~= false
    local stored = {}

    section:Dropdown({
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

    if not isMulti then return end

    -- programmatic UI update — try multiple formats since the fork's API
    -- isn't documented; at minimum the underlying _ACC map is always set.
    local function pushSelection(sel_map)
        local opt = MacLib.Options[flag]
        if not opt then return end
        local arr = {}
        for k in pairs(sel_map) do table.insert(arr, k) end
        pcall(function() opt:UpdateSelection(sel_map) end)   -- map form
        pcall(function() opt:UpdateSelection(arr)     end)   -- array form
        pcall(function() opt:SetValue(sel_map)        end)
        pcall(function() opt:Set(sel_map)             end)
    end

    section:Button({
        Name = "Select All",
        Callback = function()
            stored = {}
            for _, n in ipairs(params.Options) do stored[n] = true end
            pushSelection(stored)
            params.OnChange(stored)
        end,
    })

    section:Button({
        Name = "Deselect All",
        Callback = function()
            stored = {}
            pushSelection(stored)
            params.OnChange(stored)
        end,
    })
end
-- ============================================================================
-- // 11. TAB: AUTO FARM
-- ============================================================================

-- ── Auto Buy ──────────────────────────────────────────────────────────────
sec.AFBuyL:Header({ Text = "Auto Buy" })

makeSearchableDropdown(sec.AFBuyL, {
    Name = "Packs",
    Multi = true,
    Options = Lists.PacksFull,
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
local function refreshPlaceCounter()
    local replica = Data.GetReplica()
    local txt
    if not (replica and replica.Data) then
        txt = "waiting for data..."
    else
        local maxP = replica.Data.MaxPlacements or 25
        local used = 0
        for _, info in pairs(replica.Data.PacksPlaced or {}) do
            local isBundle = type(info) == "table" and info.Category == "Bundle"
            used = used + (isBundle and 5 or 1)
        end
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

-- Madwork OnChange may not fire on sub-key updates, so also poll periodically
refreshPlaceCounter()
task.spawn(function()
    while getgenv()._ACCRunning do
        task.wait(2)
        refreshPlaceCounter()
    end
end)

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
    Name = "Packs",
    Multi = true,
    Options = Lists.PacksFull,
    OnChange = function(map) _ACC.SelectedPlacePacks = map end,
}, "AutoPlacePacksDropdown")

sec.AFPlaceL:Toggle({
    Name = "Enable Auto Place",
    Default = false,
    Callback = function(v) _ACC.AutoPlaceEnabled = v end,
}, "AutoPlaceToggle")

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

sec.TowerL:Dropdown({
    Name = "Wanted Traits",
    Multi = true,
    Options = Lists.Traits,
    Callback = function(selected)
        _ACC.SelectedWantedTraits = mapFromMulti(selected)
    end,
}, "WantedTraitsDropdown")

sec.TowerL:Toggle({
    Name = "Auto Trait Roll",
    Default = false,
    Callback = function(v) _ACC.AutoTrait = v end,
}, "AutoTraitToggle")

sec.TowerL:Divider()
sec.TowerL:Header({ Text = "Armor Roll" })

sec.TowerL:Dropdown({
    Name = "Wanted Grade",
    Options = Lists.Grades,
    Default = Lists.Grades[1] or nil,
    Callback = function(v) _ACC.WantedArmorGrade = v end,
}, "ArmorGradeDropdown")

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
sec.STR:Button({ Name = "Send AFK ON",  Callback = function() Net.Fire(R.StarTrial, "AFK", true) end })
sec.STR:Button({ Name = "Send AFK OFF", Callback = function() Net.Fire(R.StarTrial, "AFK", false) end })
sec.STR:Button({ Name = "Exit Trial",   Callback = function() Net.Fire(R.StarTrial, "Exit") end })
sec.STR:Button({ Name = "Stream lobby", Callback = function() Net.Fire(R.StarTrial, "Stream") end })

-- ── Grade ─────────────────────────────────────────────────────────────────
sec.GradeL:Header({ Text = "Grade" })

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

sec.GradeL:Dropdown({
    Name = "Wanted Grades",
    Multi = true,
    Options = Lists.Grades,
    Callback = function(selected)
        _ACC.SelectedWantedGrades = mapFromMulti(selected)
    end,
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

sec.GradeL:Button({
    Name = "Exit grade UI",
    Callback = function() Net.Fire(R.Card, "ExitGrade") end,
})

-- ── Raid ──────────────────────────────────────────────────────────────────
sec.RaidR:Header({ Text = "Raid" })

sec.RaidR:Toggle({
    Name = "Auto Quick Start",
    Default = false,
    Callback = function(v) _ACC.RaidQuickStart = v end,
}, "RaidQuickStartToggle")

sec.RaidR:Toggle({
    Name = "Auto Vote (any raid)",
    Default = false,
    Callback = function(v) _ACC.RaidAutoVote = v end,
}, "RaidAutoVoteToggle")

sec.RaidR:Toggle({
    Name = "Auto Join (with selected cards)",
    Default = false,
    Callback = function(v) _ACC.RaidAutoJoin = v end,
}, "RaidAutoJoinToggle")

makeSearchableDropdown(sec.RaidR, {
    Name = "Cards for Raid",
    Multi = true,
    Options = Lists.CardsDisplay,
    OnChange = function(map)
        local internalMap = {}
        for displayLabel in pairs(map) do
            local internal = Lists.CardDisplayToInternal[displayLabel] or displayLabel
            internalMap[internal] = true
        end
        _ACC.RaidSelectedCards = internalMap
    end,
}, "RaidCardsDropdown")

sec.RaidR:Button({ Name = "Exit Raid", Callback = function() Net.Fire(R.Raid, "Exit") end })
-- ============================================================================
-- // 13. TAB: AUTO CLAIM
-- ============================================================================
sec.CodesL:Header({ Text = "Codes" })
sec.CodesL:Input({
    Name = "Codes (comma-separated)",
    Default = "",
    Placeholder = "code1, code2, ...",
    Callback = function(v) _ACC.CodesInput = v or "" end,
}, "CodesInput")
sec.CodesL:Input({
    Name = "Code list URL (raw)",
    Default = "",
    Placeholder = "https://raw.githubusercontent.com/.../codes.txt",
    Callback = function(v) _ACC.CodesURL = v or "" end,
}, "CodesURLInput")
sec.CodesL:Button({
    Name = "Redeem now",
    Callback = function()
        local codes = {}
        for token in tostring(_ACC.CodesInput):gmatch("[^,%s]+") do
            table.insert(codes, token)
        end
        if _ACC.CodesURL ~= "" then
            local ok, body = pcall(game.HttpGet, game, _ACC.CodesURL)
            if ok and body then
                for line in body:gmatch("[^\r\n]+") do
                    local trimmed = line:match("^%s*(.-)%s*$")
                    if trimmed ~= "" and not trimmed:match("^#") then
                        table.insert(codes, trimmed)
                    end
                end
            end
        end
        task.spawn(function()
            local n = 0
            for _, c in ipairs(codes) do
                if not getgenv()._ACCRunning then break end
                if #c > 0 and #c <= 25 then
                    Net.Fire(R.Codes, c)
                    n = n + 1
                    task.wait(2.5)
                end
            end
            Notify(("Tried %d code(s)"):format(n))
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

sec.ExpR:Header({ Text = "Expedition" })
sec.ExpR:Toggle({
    Name = "Auto send expeditions",
    Default = false,
    Callback = function(v) _ACC.AutoExpSend = v end,
}, "AutoExpSendToggle")
sec.ExpR:Toggle({
    Name = "Auto claim expeditions",
    Default = false,
    Callback = function(v) _ACC.AutoExpClaim = v end,
}, "AutoExpClaimToggle")
sec.ExpR:Toggle({
    Name = "Skip expedition (server-side flag)",
    Default = false,
    Callback = function(v)
        _ACC.SkipExpedition = v
        Net.Fire(R.Relic, "SetSkipExpedition", v)
    end,
}, "SkipExpToggle")

-- ============================================================================
-- // 14. TAB: SHOPS
-- ============================================================================
sec.StockL:Header({ Text = "Stock" })
sec.StockL:Toggle({
    Name = "Auto Buy Stock (cash)",
    Default = false,
    Callback = function(v) _ACC.AutoStock = v end,
}, "AutoStockToggle")
sec.StockL:Button({
    Name = "BuyAll Stock",
    Callback = function() Net.Fire(R.Stock, "BuyAll") Notify("Sent BuyAll") end,
})
sec.StockL:Input({
    Name = "Specific stock id",
    Default = "",
    Placeholder = "Pack-Mutation",
    Callback = function(v) _ACC.StockSpecific = v or "" end,
}, "StockSpecificInput")
sec.StockL:Button({
    Name = "Buy specific (cash)",
    Callback = function()
        if _ACC.StockSpecific ~= "" then
            Net.Fire(R.Stock, "Buy", _ACC.StockSpecific)
        end
    end,
})

sec.MerR:Header({ Text = "Merchant" })
sec.MerR:Toggle({
    Name = "Auto Buy Merchant (TravelTokens)",
    Default = false,
    Callback = function(v) _ACC.AutoMerchant = v end,
}, "AutoMerchantToggle")
sec.MerR:Button({
    Name = "BuyAll Merchant",
    Callback = function() Net.Fire(R.Merchant, "BuyAll") end,
})
sec.MerR:Input({
    Name = "Specific item",
    Default = "",
    Placeholder = "ItemName",
    Callback = function(v) _ACC.MerchantSpecific = v or "" end,
}, "MerSpecificInput")
sec.MerR:Button({
    Name = "Buy (TravelTokens)",
    Callback = function()
        if _ACC.MerchantSpecific ~= "" then
            Net.Fire(R.Merchant, "Buy", _ACC.MerchantSpecific)
        end
    end,
})
sec.MerR:Button({
    Name = "Buy (Token currency)",
    Callback = function()
        if _ACC.MerchantSpecific ~= "" then
            Net.Fire(R.Merchant, "Buy", _ACC.MerchantSpecific, "Token")
        end
    end,
})

sec.PetL:Header({ Text = "Pet Packs" })
sec.PetL:Dropdown({
    Name = "Eggs",
    Multi = true,
    Options = Lists.PetEggs,
    Callback = function(selected) _ACC.SelectedPetEggs = mapFromMulti(selected) end,
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

sec.DBR:Header({ Text = "Dragon Ball" })
sec.DBR:Button({
    Name = "Buy DragonBall (one-time)",
    Callback = function() Net.Fire(R.DragonBall, "Buy", "DragonBall") end,
})
sec.DBR:Toggle({
    Name = "Auto collect/claim DB events",
    Default = false,
    Callback = function(v) _ACC.DragonBallAuto = v end,
}, "DBAutoToggle")
-- ============================================================================
-- // 15. TAB: INVENTORY
-- ============================================================================
sec.PEL:Header({ Text = "Pack Exchange" })
sec.PEL:Dropdown({
    Name = "Method",
    Options = { "Upgrade", "Downgrade" },
    Default = "Upgrade",
    Callback = function(v) _ACC.PEMethod = v end,
}, "PEMethodDropdown")
sec.PEL:Dropdown({
    Name = "Packs",
    Multi = true,
    Search = true,
    Options = Lists.Packs,
    Callback = function(selected) _ACC.PESelectedPacks = mapFromMulti(selected) end,
}, "PEPacksDropdown")
sec.PEL:Dropdown({
    Name = "From rarity",
    Options = Lists.Rarities,
    Default = "Regular",
    Callback = function(v) _ACC.PEFromRarity = v end,
}, "PEFromDropdown")
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

sec.PotL:Header({ Text = "Potions" })
sec.PotL:Dropdown({
    Name = "Potions",
    Multi = true,
    Search = true,
    Options = Lists.Potions,
    Callback = function(selected) _ACC.SelectedPotions = mapFromMulti(selected) end,
}, "PotionsDropdown")
sec.PotL:Toggle({
    Name = "Auto Craft (when affordable)",
    Default = false,
    Callback = function(v) _ACC.AutoCraftPotions = v end,
}, "AutoCraftPotionsToggle")
sec.PotL:Button({
    Name = "Apply x1 (selected)",
    Callback = function()
        task.spawn(function()
            for _, p in iterMap(_ACC.SelectedPotions) do
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
            for _, p in iterMap(_ACC.SelectedPotions) do
                Net.FireRL(R.Potion, "Pot:Apply10:" .. p, 0.4, "Apply10", p)
                task.wait(0.3)
            end
        end)
    end,
})

sec.UpgR:Header({ Text = "Upgrades" })
sec.UpgR:Dropdown({
    Name = "Upgrades",
    Multi = true,
    Options = Lists.Upgrades,
    Callback = function(selected) _ACC.SelectedUpgrades = mapFromMulti(selected) end,
}, "UpgradesDropdown")
sec.UpgR:Toggle({
    Name = "Auto Upgrade",
    Default = false,
    Callback = function(v) _ACC.AutoUpgrade = v end,
}, "AutoUpgradeToggle")

sec.RelL:Header({ Text = "Relics" })
sec.RelL:Toggle({
    Name = "Auto Apply (1)",
    Default = false,
    Callback = function(v) _ACC.RelicApply = v end,
}, "RelicApplyToggle")
sec.RelL:Toggle({
    Name = "Auto Apply (10)",
    Default = false,
    Callback = function(v) _ACC.RelicApply10 = v end,
}, "RelicApply10Toggle")
sec.RelL:Toggle({
    Name = "Auto Craft",
    Default = false,
    Callback = function(v) _ACC.RelicCraft = v end,
}, "RelicCraftToggle")

sec.CardsR:Header({ Text = "Cards" })
sec.CardsR:Button({ Name = "Equip Best (Tower)", Callback = function() Net.Fire(R.Tower, "EquipBest") end })
sec.CardsR:Button({ Name = "Unequip All packs", Callback = function() Net.Fire(R.Card, "UnequipAll") end })

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
sec.WHR:Toggle({ Name = "Notify rare drops",  Default = false, Callback = function(v) _ACC.WebhookDrops = v end }, "WebhookDropsToggle")
sec.WHR:Toggle({ Name = "Notify raid wins",   Default = false, Callback = function(v) _ACC.WebhookRaid  = v end }, "WebhookRaidToggle")
sec.WHR:Button({
    Name = "Test webhook",
    Callback = function()
        local req = (syn and syn.request) or http_request or request
            or (http and http.request)
        if not req or _ACC.WebhookURL == "" then Notify("No exec request fn / URL empty"); return end
        local body = HttpService:JSONEncode({
            username = "ACC Hub",
            embeds = {{ title = "Test", description = "Webhook works", color = 0x57F287 }},
        })
        safe(req, { Url = _ACC.WebhookURL, Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" }, Body = body })
        Notify("Sent test webhook")
    end,
})

sec.UtilL:Header({ Text = "Utility" })
sec.UtilL:Toggle({
    Name = "Anti-AFK",
    Default = true,
    Callback = function(v) _ACC.AntiAFK = v end,
}, "AntiAFKToggle")

sec.UtilL:Divider()
sec.UtilL:Header({ Text = "Debug Dump" })

-- ── Debug dump helpers ────────────────────────────────────────────────────
local function dumpValue(v, depth, maxDepth, lines, indent)
    depth = depth or 0
    maxDepth = maxDepth or 4
    local t = type(v)

    if t == "nil" or t == "boolean" or t == "number" then
        return tostring(v)
    elseif t == "string" then
        if #v > 120 then return ("%q...(+%d chars)"):format(v:sub(1, 120), #v - 120) end
        return ("%q"):format(v)
    elseif t == "function" then
        return "<function>"
    elseif t == "userdata" then
        local ok, cls = pcall(function() return v.ClassName end)
        if ok and cls then
            local name = pcall(function() return v.Name end) and v.Name or "?"
            return ("<Instance %s.%s>"):format(cls, tostring(name))
        end
        return "<userdata>"
    elseif t == "table" then
        if depth >= maxDepth then return "{...maxDepth}" end
        local count = 0; for _ in pairs(v) do count = count + 1 end
        if count == 0 then return "{}" end
        local out = { "{" }
        local i = 0
        local maxKeys = 60
        local keys = {}
        for k in pairs(v) do table.insert(keys, k) end
        table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
        for _, k in ipairs(keys) do
            i = i + 1
            if i > maxKeys then
                table.insert(out, indent .. "  ...+" .. (count - maxKeys) .. " more")
                break
            end
            local keyStr = type(k) == "string" and k or ("[" .. tostring(k) .. "]")
            local val = v[k]
            local valStr = dumpValue(val, depth + 1, maxDepth, lines, indent .. "  ")
            table.insert(out, indent .. "  " .. keyStr .. " = " .. valStr)
        end
        table.insert(out, indent .. "}")
        return table.concat(out, "\n")
    end
    return ("<%s>"):format(t)
end

local function dumpInstanceTree(inst, depth, maxDepth, indent)
    if not inst or depth > maxDepth then return "" end
    local lines = {}
    table.insert(lines, ("%s[%s] %s"):format(indent, inst.ClassName, inst.Name))
    if depth < maxDepth then
        for _, c in ipairs(inst:GetChildren()) do
            table.insert(lines, dumpInstanceTree(c, depth + 1, maxDepth, indent .. "  "))
        end
    end
    return table.concat(lines, "\n")
end

local function buildDebugDump(opts)
    opts = opts or {}
    local out = {}
    local function add(s) table.insert(out, s or "") end

    add("================================================================")
    add("  ACC HUB  ―  DEBUG DUMP")
    add("================================================================")
    add("Time:        " .. os.date("%Y-%m-%d %H:%M:%S"))
    add("PlaceId:     " .. tostring(game.PlaceId))
    add("JobId:       " .. tostring(game.JobId))
    add("Player:      " .. LocalPlayer.Name)
    add("UserId:      " .. tostring(LocalPlayer.UserId))
    add("Plot:        " .. Plot.GetName())
    add("Hub running: " .. tostring(getgenv()._ACCRunning))
    add("")

    -- ── Replica data full dump ──
    add("================================================================")
    add("  REPLICA  (full Data tree, depth 4)")
    add("================================================================")
    local replica = Data.GetReplica()
    if replica then
        add("Replica.Id:   " .. tostring(replica.Id))
        add("Replica.Class:" .. tostring(replica.Class or "?"))
        add("Replica.Tags: " .. dumpValue(replica.Tags, 0, 2, nil, ""))
        add("")
        add("Replica.Data:")
        add(dumpValue(replica.Data, 0, 4, nil, ""))
    else
        add("(Replica unavailable)")
    end
    add("")

    -- ── All top-level data keys with type/size summary ──
    add("================================================================")
    add("  DATA KEYS  (top-level summary)")
    add("================================================================")
    local data = Data.GetTable()
    if data then
        local rows = {}
        for k, v in pairs(data) do
            local t = type(v)
            local extra = ""
            if t == "table" then
                local sz = 0
                for _ in pairs(v) do sz = sz + 1 end
                extra = ("(%d keys)"):format(sz)
            elseif t == "string" or t == "number" or t == "boolean" then
                extra = "= " .. tostring(v):sub(1, 80)
            end
            table.insert(rows, ("  %-32s %-8s %s"):format(k, t, extra))
        end
        table.sort(rows)
        add(table.concat(rows, "\n"))
    end
    add("")

    -- ── RS.Remotes catalog ──
    add("================================================================")
    add("  REMOTES  (RS.Remotes children)")
    add("================================================================")
    if RemotesFolder then
        for _, c in ipairs(RemotesFolder:GetChildren()) do
            add(("  [%-22s] %s"):format(c.ClassName, c.Name))
        end
    end
    add("")

    -- ── Plot model tree (3 levels) ──
    add("================================================================")
    add("  PLOT MODEL TREE")
    add("================================================================")
    local pm = Plot.GetModel()
    if pm then
        add(dumpInstanceTree(pm, 0, 3, ""))
    else
        add("(plot model not found)")
    end
    add("")

    -- ── Conveyor packs (active) ──
    add("================================================================")
    add("  CONVEYOR PACKS  (workspace.Client.Packs)")
    add("================================================================")
    local conv = Plot.GetConveyorPacks()
    if conv then
        for _, p in ipairs(conv:GetChildren()) do
            local mesh = p:FindFirstChildOfClass("MeshPart")
            local rarity = "Regular"
            for _, c in ipairs(p:GetChildren()) do
                if c:IsA("Folder") then rarity = c.Name; break end
            end
            local prc = mesh and mesh:FindFirstChild("ConveyorDisplay")
                and mesh.ConveyorDisplay:FindFirstChild("Price")
            local priceText = prc and prc.Text or "?"
            add(("  %-30s family=%-12s rarity=%-10s price=%s"):format(
                p.Name, mesh and mesh.Name or "?", rarity, priceText))
        end
    else
        add("(workspace.Client.Packs not found)")
    end
    add("")

    -- ── PlayerGui list ──
    add("================================================================")
    add("  PLAYERGUI ScreenGui list")
    add("================================================================")
    for _, gui in ipairs(PlayerGui:GetChildren()) do
        if gui:IsA("ScreenGui") or gui:IsA("Frame") then
            add(("  [%-12s] %-30s enabled=%s"):format(gui.ClassName, gui.Name,
                tostring(gui:IsA("ScreenGui") and gui.Enabled or "n/a")))
        end
    end
    add("")

    -- ── Workspace key paths (for ESP path verification) ──
    add("================================================================")
    add("  WORKSPACE KEY PATHS (ESP target paths)")
    add("================================================================")
    local function probePath(...)
        local path = { ... }
        local node = Workspace
        local trail = "workspace"
        for _, name in ipairs(path) do
            if not node then return ("  workspace%s → MISSING at %s"):format(
                table.concat(path, "."):gsub("^", "."), name) end
            node = node:FindFirstChild(name)
            trail = trail .. "." .. name
        end
        if not node then
            return ("  %s → not found"):format(trail)
        end
        local count = #node:GetChildren()
        return ("  %s → [%s] (%d children)"):format(trail, node.ClassName, count)
    end
    add(probePath("Items", "Tokens", "Server"))
    add(probePath("Items", "Misc", "Collectables"))
    add(probePath("Map", "StarTrial", "Dungeon", "EnemySpawns"))
    add(probePath("Plots"))
    add(probePath("Client", "Packs"))
    add("")

    -- ── Active hooks ──
    add("================================================================")
    add("  ACTIVE HOOKS")
    add("================================================================")
    local hcount = 0
    for _, h in pairs(getgenv()._ACCHooks or {}) do
        hcount = hcount + 1
        add(("  hooked: %s  (original type: %s)"):format(
            h.name, type(h.original)))
    end
    if hcount == 0 then add("  (none)") end
    add("")

    -- ── Module load status ──
    add("================================================================")
    add("  CONFIG MODULES")
    add("================================================================")
    local mods = { "CardConfig", "TowerConfig", "PetConfig", "StarTrialConfig",
        "PackExchange", "Consumables", "Upgrades", "Grades", "RaidConfig",
        "ProductConfig", "Mutations", "Stock", "ImageConfig", "Relics",
        "Merchant", "ClanConfig", "DragonBalls", "ExpeditionConfig",
        "WeatherConfig", "QuestConfig", "RebirthConfig" }
    for _, n in ipairs(mods) do
        local m = Config[n]
        if m then
            local sz = 0
            for _ in pairs(m) do sz = sz + 1 end
            add(("  %-22s LOADED  (%d keys)"):format(n, sz))
        else
            add(("  %-22s NOT LOADED"):format(n))
        end
    end
    add("")

    -- ── Achievements / Expeditions / DragonBalls full sample ──
    add("================================================================")
    add("  SAMPLE STRUCTURES (for hub schema verification)")
    add("================================================================")
    local function sampleStruct(label, getter)
        add("--- " .. label .. " ---")
        local v = getter()
        if v == nil then
            add("  (nil)")
        elseif type(v) ~= "table" then
            add("  type=" .. type(v) .. " value=" .. tostring(v))
        else
            -- show first 3 entries with full structure
            local i = 0
            for k, info in pairs(v) do
                i = i + 1
                if i > 3 then add(("  ... +%d more entries"):format(0)); break end
                add(("  [%s] = %s"):format(tostring(k),
                    dumpValue(info, 0, 3, nil, "  ")))
            end
            if i == 0 then add("  (empty table)") end
        end
        add("")
    end
    sampleStruct("Achievements", function() return Data.Get("Achievements") end)
    sampleStruct("Expeditions",  function() return Data.Get("Expeditions") end)
    sampleStruct("DragonBalls",  function() return Data.Get("DragonBalls") end)
    sampleStruct("Cards (1st)",  function() return Data.Get("Cards") end)
    sampleStruct("Pets (1st)",   function() return Data.Get("Pets") end)
    sampleStruct("Armor",        function() return Data.Get("Armor") end)
    sampleStruct("Settings",     function() return Data.Get("Settings") end)
    sampleStruct("Stats",        function() return Data.Get("Stats") end)
    sampleStruct("Upgrades",     function() return Data.Get("Upgrades") end)
    sampleStruct("StarUpgrades", function() return Data.Get("StarUpgrades") end)

    -- ── full Packs (inventory) and PacksPlaced (full) ──
    add("--- Data.Packs FULL (inventory keys → counts) ---")
    local pp = Data.Get("Packs") or {}
    local packKeys = {}
    for k, v in pairs(pp) do table.insert(packKeys, { k = k, v = v }) end
    table.sort(packKeys, function(a, b) return tostring(a.k) < tostring(b.k) end)
    for _, e in ipairs(packKeys) do
        add(("  [%-40s] = %s"):format(tostring(e.k), tostring(e.v)))
    end
    if #packKeys == 0 then add("  (empty)") end
    add("")

    add("--- Data.PacksPlaced FULL ---")
    local placed = Data.Get("PacksPlaced") or {}
    local placedKeys = {}
    for k, info in pairs(placed) do table.insert(placedKeys, { k = k, info = info }) end
    table.sort(placedKeys, function(a, b) return tostring(a.k) < tostring(b.k) end)
    for _, e in ipairs(placedKeys) do
        add(("  [%s] = %s"):format(tostring(e.k), dumpValue(e.info, 0, 2, nil, "  ")))
    end
    if #placedKeys == 0 then add("  (empty)") end
    add("")
    add("--- Data.Hotbar ---")
    add(dumpValue(Data.Get("Hotbar"), 0, 2, nil, "  "))
    add("")

    -- ── InvokeServer probes (carefully, only on remotes that should be safe) ──
    if opts.invokeRemotes then
        add("================================================================")
        add("  REMOTE INVOKE PROBES")
        add("================================================================")
        local function probe(name, remote, ...)
            local args = { ... }
            local started = os.clock()
            local ret = Net.Invoke(remote, table.unpack(args))
            local dur = os.clock() - started
            add(("--- %s (%dms) ---"):format(name, dur * 1000))
            if ret == nil then
                add("  result: nil")
            else
                add("  result type: " .. type(ret))
                add(dumpValue(ret, 0, 3, nil, "  "))
            end
            add("")
        end
        if R.GetStock          then probe("GetStock",          R.GetStock) end
        if R.GetMerchantItems  then probe("GetMerchantItems",  R.GetMerchantItems) end
        if R.GetClanInfo       then probe("GetClanInfo:GetClanData", R.GetClanInfo, "GetClanData") end
    end

    -- ── Last 50 hub state values ──
    add("================================================================")
    add("  HUB STATE  (_ACC.*)")
    add("================================================================")
    local stKeys = {}
    for k, v in pairs(_ACC) do
        if not k:match("^_") and not k:match("^[A-Z][a-z]+Loaded") then
            table.insert(stKeys, k)
        end
    end
    table.sort(stKeys)
    for _, k in ipairs(stKeys) do
        add(("  %-30s = %s"):format(k, dumpValue(_ACC[k], 0, 2, nil, "  ")))
    end
    add("")

    add("================================================================")
    add("  END OF DUMP")
    add("================================================================")

    return table.concat(out, "\n")
end

-- detect setclipboard variants across executors
local function setClip(text)
    local fn = setclipboard or set_clipboard or toclipboard
        or (Clipboard and Clipboard.set)
        or (syn and syn.write_clipboard)
    if fn then
        local ok = pcall(fn, text)
        return ok
    end
    return false
end

sec.UtilL:Button({
    Name = "Copy Debug Info",
    Callback = function()
        task.spawn(function()
            Notify("Probing remotes... wait", 3)
            local text = buildDebugDump({ invokeRemotes = true })
            local ok = setClip(text)
            if ok then
                Notify(("Copied %d chars to clipboard"):format(#text), 5)
            else
                Notify("setclipboard not available — see console", 5)
                print("=== ACC HUB DEBUG DUMP ===")
                print(text)
            end
        end)
    end,
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

-- ============================================================================
-- // 17. TAB: SETTINGS
-- ============================================================================
sec.InfoL:Header({ Text = "Info" })
sec.InfoL:Label({ Text = "ACC Hub v1.0" })
sec.InfoL:Label({ Text = "Player: " .. LocalPlayer.Name })
sec.InfoL:Label({ Text = "UserId: " .. tostring(LocalPlayer.UserId) })
sec.InfoL:Label({ Text = "Plot:   " .. Plot.GetName() })

sec.CtrlR:Header({ Text = "Control" })
sec.CtrlR:Button({
    Name = "Unload Hub",
    Callback = function()
        if getgenv()._ACCCleanup then getgenv()._ACCCleanup() end
    end,
})
sec.CtrlR:Toggle({
    Name = "Debug logs",
    Default = false,
    Callback = function(v) _ACC.Debug = v end,
}, "DebugToggle")
sec.CtrlR:Button({
    Name = "Print state",
    Callback = function()
        for k, v in pairs(_ACC) do
            if not k:match("^_") then
                print(("[ACC] %s = %s"):format(k, tostring(v)))
            end
        end
    end,
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
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoOpenEnabled then
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local packTag  = LocalPlayer.Name .. "-Pack"
                local timerTag = LocalPlayer.Name .. "-PackTimer"

                -- gather Ready! packs
                local readyPacks = {}
                local now = workspace:GetServerTimeNow()
                for _, packPart in ipairs(CollectionService:GetTagged(packTag)) do
                    if packPart:IsDescendantOf(workspace) then
                        local model = packPart:FindFirstAncestorOfClass("Model") or packPart
                        local timerLabel
                        for _, d in ipairs(model:GetDescendants()) do
                            if CollectionService:HasTag(d, timerTag) then
                                timerLabel = d; break
                            end
                        end
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
                    end
                end

                if #readyPacks > 0 then
                    local startCFrame = hrp.CFrame
                    for _, packPart in ipairs(readyPacks) do
                        if not _ACC.AutoOpenEnabled or not getgenv()._ACCRunning then break end
                        if packPart:IsDescendantOf(workspace) then
                            local model = packPart:FindFirstAncestorOfClass("Model") or packPart
                            local prompt
                            for _, d in ipairs(model:GetDescendants()) do
                                if d:IsA("ProximityPrompt") then prompt = d; break end
                            end
                            if prompt then
                                -- teleport directly onto the pack so the spawned
                                -- reward lands inside our auto-collect range
                                hrp.CFrame = CFrame.new(packPart.Position + Vector3.new(0, 3, 0))
                                task.wait(0.15)

                                safe(function()
                                    prompt:InputHoldBegin()
                                    task.wait(prompt.HoldDuration + 0.05)
                                    prompt:InputHoldEnd()
                                end)
                                -- linger on the spot so the reward is grabbed
                                task.wait(0.4)
                            end
                        end
                    end
                    if hrp.Parent then hrp.CFrame = startCFrame end
                end
            end
        end
        task.wait(1.0)
    end
end)

-- ── Auto Collect cash (with bidirectional page zigzag) ──────────────────
-- Page detection priority:
--   1. Read Display.Page TextLabel (gives exact "N" or "N/M") — most reliable
--   2. Fallback: snapshot of inner content (slot names alone collide between
--      pages, so we include the inner pack/card model name)
-- Edge detection only fires after 2 CONSECUTIVE identical readings to avoid
-- single-frame race conditions. Hard safety: reverse after 35 steps anyway.
task.spawn(function()
    local direction = "RightArrow"
    local sameCount = 0
    local stepsInDir = 0
    local MAX_STEPS = 35

    local function readPageLabel(display)
        local p = display:FindFirstChild("Page")
        if p then
            for _, d in ipairs(p:GetDescendants()) do
                if d:IsA("TextLabel") and d.Text and d.Text ~= "" then
                    return d.Text
                end
            end
        end
        return nil
    end

    local function snapshotPage(display)
        -- prefer authoritative Page label
        local lbl = readPageLabel(display)
        if lbl then return "L:" .. lbl end
        -- fallback: include inner content of slots
        local s = {}
        for _, sideName in ipairs({ "Left", "Right" }) do
            local side = display:FindFirstChild(sideName)
            if side then
                for _, slot in ipairs(side:GetChildren()) do
                    local inner = slot:FindFirstChildWhichIsA("BasePart")
                                  or slot:FindFirstChildWhichIsA("Model")
                                  or slot:FindFirstChildWhichIsA("MeshPart")
                    table.insert(s, sideName .. "/" .. slot.Name
                                    .. ":" .. (inner and inner.Name or "?"))
                end
            end
        end
        table.sort(s)
        return "S:" .. table.concat(s, "|")
    end

    local function reverse()
        direction = (direction == "RightArrow") and "LeftArrow" or "RightArrow"
        sameCount = 0
        stepsInDir = 0
    end

    while getgenv()._ACCRunning do
        if _ACC.AutoCollectEnabled then
            local display = Plot.GetDisplay()
            if display then
                -- 1. collect everything visible
                for _, sideName in ipairs({ "Left", "Right" }) do
                    if not _ACC.AutoCollectEnabled or not getgenv()._ACCRunning then break end
                    local side = display:FindFirstChild(sideName)
                    if side then
                        for _, slot in ipairs(side:GetChildren()) do
                            if RL_Allow("Card:Collect:" .. sideName .. "/" .. slot.Name, 0.1) then
                                Net.Fire(R.Card, "Collect", slot)
                            end
                        end
                    end
                end

                -- 2. snapshot, flip, wait, snapshot
                local before = snapshotPage(display)
                Net.FireRL(R.Card, "Card:PageFlip", 0.5, "Page", direction)
                task.wait(0.45)
                local after = snapshotPage(display)
                stepsInDir = stepsInDir + 1

                -- 3. edge detection: needs TWO consecutive identical readings
                if before == after then
                    sameCount = sameCount + 1
                    if sameCount >= 2 then reverse() end
                else
                    sameCount = 0
                end

                -- 4. hard safety: too many steps in one direction
                if stepsInDir >= MAX_STEPS then reverse() end
            end
        else
            sameCount  = 0
            stepsInDir = 0
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
        -- "<family> <rarity>" if last token is a known rarity, else family only
        local prefix, last = displayName:match("^(.+) (%S+)$")
        if prefix and last and rarityIdx[last] and last ~= "Regular" then
            return prefix, last
        end
        return displayName, "Regular"
    end

    local function priorityOf(displayName)
        local family, rarity = parsePackKey(displayName)
        local page = (CardConfig and CardConfig.Packs
                      and CardConfig.Packs[family]
                      and CardConfig.Packs[family].Page) or 0
        return page, rarityIdx[rarity] or 0, family, rarity
    end

    local function countPlaced()
        local rep = Data.GetReplica()
        if not (rep and rep.Data and rep.Data.PacksPlaced) then return 0 end
        local n = 0
        for _ in pairs(rep.Data.PacksPlaced) do n = n + 1 end
        return n
    end

    while getgenv()._ACCRunning do
        if _ACC.AutoPlaceEnabled and not mapEmpty(_ACC.SelectedPlacePacks) then
            safe(function()
                local replica = Data.GetReplica()
                if not (replica and replica.Data) then return end
                local placed     = replica.Data.PacksPlaced or {}
                local ownedPacks = replica.Data.Packs       or {}
                local maxP       = replica.Data.MaxPlacements or 25

                local used = 0
                for _, info in pairs(placed) do
                    used = used + ((type(info) == "table" and info.Category == "Bundle") and 5 or 1)
                end
                local free = maxP - used
                if free < 1 then return end

                local char = LocalPlayer.Character
                local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local plotModel = Plot.GetModel()
                local floor = plotModel and plotModel:FindFirstChild("Misc")
                              and plotModel.Misc:FindFirstChild("Floor")
                if not floor then return end

                -- build candidate list with priority info
                local toPlace = {}
                for displayName in pairs(_ACC.SelectedPlacePacks) do
                    local serverName = displayName:gsub(" ", "-")
                    if (ownedPacks[serverName] or 0) > 0 then
                        local page, rIdx, family, rarity = priorityOf(displayName)
                        table.insert(toPlace, {
                            server = serverName,
                            display = displayName,
                            page = page,
                            rIdx = rIdx,
                            family = family,
                            rarity = rarity,
                        })
                    end
                end
                if #toPlace == 0 then
                    if _ACC.Debug then
                        warn("[ACC AutoPlace] none of the selected packs are owned")
                    end
                    return
                end

                -- highest Page first, then highest rarity
                table.sort(toPlace, function(a, b)
                    if a.page ~= b.page then return a.page > b.page end
                    return a.rIdx > b.rIdx
                end)

                if _ACC.Debug then
                    local order = {}
                    for _, e in ipairs(toPlace) do
                        table.insert(order, ("%s(p=%d r=%d)"):format(e.display, e.page, e.rIdx))
                    end
                    warn("[ACC AutoPlace] order: " .. table.concat(order, " > "))
                end

                local startCFrame = hrp.CFrame
                local fSize = floor.Size

                for _, entry in ipairs(toPlace) do
                    if not _ACC.AutoPlaceEnabled or not getgenv()._ACCRunning then break end
                    if free < 1 then break end

                    Net.Fire(R.Card, "Equip", entry.server)
                    task.wait(0.3)

                    local before = countPlaced()
                    local success = false
                    for attempt = 1, 10 do
                        if not _ACC.AutoPlaceEnabled or not getgenv()._ACCRunning then break end
                        local rx = (math.random() - 0.5) * fSize.X * 0.7
                        local rz = (math.random() - 0.5) * fSize.Z * 0.7
                        local pos = (floor.CFrame * CFrame.new(rx, 5, rz)).Position
                        hrp.CFrame = CFrame.new(pos)
                        task.wait(0.2)

                        Net.Fire(R.Card, "Place", entry.server)
                        task.wait(0.4)

                        if countPlaced() > before then
                            success = true
                            break
                        end
                    end

                    if success then
                        free = free - 1
                        if _ACC.Debug then
                            warn(("[ACC AutoPlace] placed '%s' (free=%d)"):format(entry.server, free))
                        end
                    elseif _ACC.Debug then
                        warn(("[ACC AutoPlace] failed '%s' after 10 tries"):format(entry.server))
                    end
                end

                if hrp.Parent then hrp.CFrame = startCFrame end
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
    local TowerHandlerLocal = UIClient and tryRequire(UIClient:FindFirstChild("TowerHandler"))
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
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoTrait and (Data.Get("TraitTokens") or 0) > 0
           and not mapEmpty(_ACC.SelectedTraitCards) and not mapEmpty(_ACC.SelectedWantedTraits)
        then
            local list
            if mapHas(_ACC.SelectedTraitCards, "All") then
                list = Lists.Cards
            else
                list = {}
                for _, name in iterMap(_ACC.SelectedTraitCards) do
                    if name ~= "All" then table.insert(list, name) end
                end
            end

            -- enable server-side auto-roll session
            Net.Fire(R.Tower, "ToggleAT", true)
            task.wait(0.1)

            for _, name in ipairs(list) do
                if not _ACC.AutoTrait or not getgenv()._ACCRunning then break end
                while _ACC.AutoTrait and getgenv()._ACCRunning do
                    if (Data.Get("TraitTokens") or 0) <= 0 then break end
                    local cd = Data.Get("Cards", name)
                    if not cd then break end
                    local cur = cd.Trait
                    if cur and mapHas(_ACC.SelectedWantedTraits, cur) then
                        break
                    end
                    Net.FireRL(R.Tower, "Tower:Roll:" .. name, 0.4, "Roll", name)
                    task.wait(0.4)
                end
            end

            -- disable server-side auto-roll session
            Net.Fire(R.Tower, "ToggleAT", nil)
        end
        task.wait(1.0)
    end
end)

-- ── Tower auto armor roll ─────────────────────────────────────────────────
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoArmor and _ACC.WantedArmorGrade then
            local armor = Data.Get("Armor")
            if type(armor) == "table" then
                for piece, info in pairs(armor) do
                    if not _ACC.AutoArmor or not getgenv()._ACCRunning then break end
                    if type(info) == "table" and info.Grade ~= _ACC.WantedArmorGrade then
                        Net.FireRL(R.Tower, "Tower:Armor:" .. piece, 0.45, "Armor", piece)
                        task.wait(0.4)
                    end
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

-- ── Auto Grade (focused roll per card, Cash → Tokens fallback) ────────────
-- Same pattern as AutoTrait. Cash by default; if GradeUseTokensFirst is on
-- and GradeTokens > 0, server is told to deduct tokens instead.
-- Grade has no server-side AutoToggle remote — Roll is accepted directly.
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoGrade and not mapEmpty(_ACC.SelectedGradeCards)
           and not mapEmpty(_ACC.SelectedWantedGrades)
        then
            local list
            if mapHas(_ACC.SelectedGradeCards, "All") then
                list = Lists.Cards
            else
                list = {}
                for _, n in iterMap(_ACC.SelectedGradeCards) do
                    if n ~= "All" then table.insert(list, n) end
                end
            end

            for _, name in ipairs(list) do
                if not _ACC.AutoGrade or not getgenv()._ACCRunning then break end
                while _ACC.AutoGrade and getgenv()._ACCRunning do
                    local cd = Data.Get("Cards", name)
                    if not cd then break end
                    if cd.Grade and mapHas(_ACC.SelectedWantedGrades, cd.Grade) then
                        break
                    end
                    local tokens = Data.Get("GradeTokens") or 0
                    local source
                    if _ACC.GradeUseTokensFirst and tokens > 0 then source = "Tokens" end
                    Net.FireRL(R.Grade, "Grade:Roll:" .. name, 0.4, "Roll", name, source)
                    task.wait(0.4)
                end
            end
        end
        task.wait(1.0)
    end
end)

-- ── Raid loops ────────────────────────────────────────────────────────────
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.RaidQuickStart then
            Net.FireRL(R.Raid, "Raid:QuickStart", 4, "QuickStart")
        end
        task.wait(2)
    end
end)

task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.RaidAutoVote and RaidConfig and RaidConfig.Raids then
            for raidId in pairs(RaidConfig.Raids) do
                if not _ACC.RaidAutoVote or not getgenv()._ACCRunning then break end
                Net.FireRL(R.Raid, "Raid:Vote:" .. raidId, 8, "Vote", raidId)
                task.wait(0.5)
            end
        end
        task.wait(5)
    end
end)

task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.RaidAutoJoin and not mapEmpty(_ACC.RaidSelectedCards) then
            local arr = {}
            for _, n in iterMap(_ACC.RaidSelectedCards) do table.insert(arr, n) end
            if #arr > 0 then
                Net.FireRL(R.Raid, "Raid:Join", 8, "Join", arr)
            end
        end
        task.wait(3)
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
    local rewardsFolder = ConfigFolder.Parent and ConfigFolder.Parent:FindFirstChild("Rewards")
        or ConfigFolder:FindFirstChild("Rewards")
    -- AchievementConfig sits at Modules.Config.Rewards.AchievementConfig
    local achMod = ModulesFolder
        :FindFirstChild("Config")
        and ModulesFolder.Config:FindFirstChild("Rewards")
        and ModulesFolder.Config.Rewards:FindFirstChild("AchievementConfig")
    if achMod then AchievementConfig = tryRequire(achMod) end
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
Data.OnChange(function(opType, path, newVal, oldVal)
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

task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoRewards then
            Net.FireRL(R.Card, "Card:ClaimReward", 14, "ClaimReward")
        end
        task.wait(15)
    end
end)

-- Expedition send
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoExpSend then
            local exps = Data.Get("Expeditions")
            if type(exps) == "table" then
                for slot, info in pairs(exps) do
                    if not _ACC.AutoExpSend or not getgenv()._ACCRunning then break end
                    if type(info) == "table" and not info.Started and not info.Ready then
                        local cards = Data.Get("Cards")
                        if cards then
                            for cardName in pairs(cards) do
                                Net.FireRL(R.Relic, "Exp:Send:" .. tostring(slot), 1.0,
                                           "SendExpedition", slot, cardName)
                                break
                            end
                        end
                        task.wait(0.4)
                    end
                end
            end
        end
        task.wait(2)
    end
end)

-- Expedition claim
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoExpClaim then
            local exps = Data.Get("Expeditions")
            if type(exps) == "table" then
                for slot, info in pairs(exps) do
                    if not _ACC.AutoExpClaim or not getgenv()._ACCRunning then break end
                    if type(info) == "table" and info.Ready then
                        Net.FireRL(R.Relic, "Exp:Claim:" .. tostring(slot), 0.6,
                                   "ClaimExpedition", slot)
                        task.wait(0.3)
                    end
                end
            end
        end
        task.wait(2)
    end
end)

-- ============================================================================
-- // 21. LOOPS — SHOPS
-- ============================================================================
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoStock and R.GetStock then
            local items = Net.Invoke(R.GetStock)
            if type(items) == "table" then
                for id, info in pairs(items) do
                    if not _ACC.AutoStock or not getgenv()._ACCRunning then break end
                    if type(info) == "table" and info.Cost
                       and (Data.Get("Cash") or 0) >= info.Cost
                    then
                        Net.FireRL(R.Stock, "Stock:Buy:" .. tostring(id), 0.6, "Buy", id)
                        task.wait(0.4)
                    end
                end
            end
        end
        task.wait(5)
    end
end)

task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoMerchant and R.GetMerchantItems then
            local items = Net.Invoke(R.GetMerchantItems)
            if type(items) == "table" then
                for id, info in pairs(items) do
                    if not _ACC.AutoMerchant or not getgenv()._ACCRunning then break end
                    if type(info) == "table" and info.Cost
                       and (Data.Get("TravelTokens") or 0) >= info.Cost
                    then
                        Net.FireRL(R.Merchant, "Mer:Buy:" .. tostring(id), 0.6, "Buy", id)
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
        end
        task.wait(0.5)
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
        end
        task.wait(0.5)
    end
end)

-- Dragon Ball: real schema is { [id]=true } map of OWNED ball ids.
-- Physical balls spawn in the world during DB events; player walks up
-- and triggers a ProximityPrompt. There's no remote to "collect by id"
-- without the prompt. So we only:
--   - claim full set (all 7 owned) via "Claim"
--   - one-time "Buy DragonBall" through Stock (manual button already exists)
-- This loop just auto-claims the set when complete.
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
                    Net.FireRL(R.DragonBall, "DB:Claim", 5, "Claim")
                end
            end
        end
        task.wait(3)
    end
end)

-- ============================================================================
-- // 22. LOOPS — INVENTORY
-- ============================================================================

-- Pack Exchange (chains via PackExchange config, no hardcoded "Gold")
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.PEEnabled and not mapEmpty(_ACC.PESelectedPacks) then
            local method = _ACC.PEMethod or "Upgrade"
            local from   = _ACC.PEFromRarity or "Regular"
            for _, packName in iterMap(_ACC.PESelectedPacks) do
                if not _ACC.PEEnabled or not getgenv()._ACCRunning then break end
                if method == "Upgrade" then
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
                    if target then
                        Net.FireRL(R.Card, "PE:Up:" .. packName, 0.5,
                                   "Exchange", packName, from, target)
                    end
                else
                    local downCfg = PackExchange and PackExchange.Downgrade
                                      and PackExchange.Downgrade[from]
                    if downCfg and downCfg.Pack then
                        Net.FireRL(R.Card, "PE:Dn:" .. packName, 0.5,
                                   "Downgrade", packName, from)
                    end
                end
                task.wait(0.4)
            end
        end
        task.wait(1)
    end
end)

-- Auto Craft Potions
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.AutoCraftPotions and not mapEmpty(_ACC.SelectedPotions) then
            local replicaPacks = (Data.GetTable() or {}).Packs or {}
            for _, p in iterMap(_ACC.SelectedPotions) do
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

-- Relics (Apply / Apply10 / Craft)
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.RelicApply or _ACC.RelicApply10 or _ACC.RelicCraft then
            local relics = Data.Get("Relics") or {}
            for relicName in pairs(relics) do
                if not getgenv()._ACCRunning then break end
                if not (_ACC.RelicApply or _ACC.RelicApply10 or _ACC.RelicCraft) then break end
                if _ACC.RelicApply10 then
                    Net.FireRL(R.Relic, "Rel:A10:" .. relicName, 0.4, "Apply10", relicName)
                elseif _ACC.RelicApply then
                    Net.FireRL(R.Relic, "Rel:A:"  .. relicName, 0.4, "Apply",   relicName)
                end
                if _ACC.RelicCraft then
                    Net.FireRL(R.Relic, "Rel:C:"  .. relicName, 0.4, "Craft",   relicName)
                end
                task.wait(0.3)
            end
        end
        task.wait(1)
    end
end)

-- ============================================================================
-- // 23. LOOPS — MISC (ESP, AntiAFK, Webhook, HUD hide)
-- ============================================================================

-- Anti-AFK
table.insert(_ACC._connections, LocalPlayer.Idled:Connect(function()
    if _ACC.AntiAFK and getgenv()._ACCRunning then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end))

-- Webhook on rare drops
Data.OnChange(function(opType, path, newVal, oldVal)
    if not _ACC.WebhookDrops or _ACC.WebhookURL == "" then return end
    if opType ~= "ArrayInsert" then return end
    local req = (syn and syn.request) or http_request or request
        or (http and http.request)
    if not req then return end
    local function send(title, desc, color)
        local body = HttpService:JSONEncode({
            username = "ACC Hub",
            embeds = {{ title = title, description = desc, color = color }},
        })
        safe(req, { Url = _ACC.WebhookURL, Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" }, Body = body })
    end
    if path[1] == "CardsDiscovered" then send("New card discovered", tostring(newVal), 0xFEE75C) end
    if path[1] == "PetsClaimed"     then send("New pet claimed",     tostring(newVal), 0x57F287) end
end)

-- HUD popup hider
task.spawn(function()
    while getgenv()._ACCRunning do
        if _ACC.HideHUDPopups then
            local hud = PlayerGui:FindFirstChild("HUD")
            local frame = hud and hud:FindFirstChild("Frame")
            local cc = frame and frame:FindFirstChild("CashChange")
            if cc then
                for _, c in ipairs(cc:GetChildren()) do
                    if c:IsA("TextLabel") then c.Visible = false end
                end
            end
        end
        task.wait(0.5)
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

    -- 3. restore monkey-patched functions
    if getgenv()._ACCHooks then
        for _, h in pairs(getgenv()._ACCHooks) do
            pcall(function() h.holder[h.name] = h.original end)
        end
        getgenv()._ACCHooks = {}
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

-- 1. set MacLib autosave folder for this hub
pcall(function() MacLib:SetFolder("ACCHub") end)

-- 2. wrap AutoSave to no-op during initial load — restore-time callbacks
-- would otherwise spam the JSON file once per element
local _configLoading = true
local _origAutoSave = MacLib.AutoSave
if type(_origAutoSave) == "function" then
    MacLib.AutoSave = function(self, ...)
        if _configLoading then return end
        return _origAutoSave(self, ...)
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
