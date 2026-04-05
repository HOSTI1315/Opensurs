-- ============================================================
-- Anime Overload | Apel Hub x skrilya — Unified
-- Framework: Reflex + ZAP
-- Lobby: 126297188712308 | Game Stage: 80353351682367
-- ============================================================

-- // 1. CLEANUP
if getgenv()._AORunning then getgenv()._AORunning = false task.wait(0.5) end
if getgenv()._AOUI then pcall(function() getgenv()._AOUI:Unload() end) end

-- // 2. SERVICES & VARIABLES
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
getgenv()._AORunning = true
local _AO = {}
_AO.EnableDebug = false

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- LocalPlayer может быть nil при очень раннем инжекте (раньше, чем клиент привяжет игрока)
while not LocalPlayer do
    task.wait()
    LocalPlayer = Players.LocalPlayer
end

local function dbg(msg)
    if _AO.EnableDebug then print("[AH] " .. msg) end
end

local LOBBY_ID = 126297188712308
local isLobby = (game.PlaceId == LOBBY_ID)

-- Premium tester
_G.fanmyrka = true

-- Shared state
_AO.IsLoadingConfig = true
_AO.AutoJoinEnabled = false
_AO.SelectedMode = "Story"
_AO.SelectedStage = nil
_AO.SelectedAct = 1
_AO.SelectedDifficulty = "normal"
_AO.AutoSummonEnabled = false
_AO.SummonAmount = 1
_AO.SummonDelay = 0.5
_AO.SummonBanner = "NORMAL"
_AO.SelectedFeatured = {}
_AO.AutoSellRare = false
_AO.AutoSellEpic = false
_AO.AutoSellLegendary = false
_AO.AutoClaimQuestsEnabled = false
_AO.AutoClaimDailyRewardsEnabled = false -- lobby: daily + event tracks (event1, …)

-- Game Stage state
_AO.IsRecording = false
_AO.IsPlaying = false
_AO.AutoPlayEnabled = false
_AO.CurrentMacro = {}
_AO.SelectedMacroName = ""
_AO.MacroImportURL = ""
_AO.MacroSpeed = 0 -- 0=fast, 1=timed
_AO.AutoSkipWaveEnabled = false
_AO.AutoStartEnabled = false
_AO.AutoNextEnabled = false
_AO.AutoReplayEnabled = false
_AO.ChallengeMatchForceLobby = true
_AO.LiveUnitsMap = {}
_AO.RecordedEntityMap = {}
_AO._macroSuppressPrioHook = false -- true while hub Auto Upgrade loop calls changeUpgradePriority (do not record)
_AO.AutoPlayByStageEnabled = false

-- Auto Ultimate
_AO.AutoUltimateEnabled = false
local AutoUltSettings = {
	DEBUG = false,
	BOSS_MODE = "while_alive",
	INCLUDE_MINI_BOSS = true,
	BOSS_SPAWN_WINDOW_SEC = 12,
	MIN_INTERVAL_BETWEEN_ANY_ULT_SEC = 0.35,
	MAX_ULTS_PER_BOSS_WINDOW = 6,
	RELAX_ENEMY_RANGE_WITH_BOSS = true,
	--- If true: auto-ult ignores global selectOnUltimate (still blocks on cutscene). Matches need when game keeps ult UI flag after tower #1.
	--- If false: same strict gate as AO_AutoUltimate.lua (both ult + cutscene block all towers).
	RELAX_GLOBAL_ON_ULTIMATE_FOR_CHAIN = true,
}
getgenv().AO_AutoUltSettings = AutoUltSettings
_AO._AOAutoUltHeartbeatConn = nil
getgenv().AOAutoUlt_Dump = function()
	print("[AO_AutoUlt] Только стадия матча. Зайди в игру или проверь ошибки инициализации в консоли.")
end

-- File system
local RootFolder = "ApelHub"
local MacroFolder = RootFolder .. "/AnimeOverload_Macros"
local DataFolder = RootFolder .. "/AnimeOverload"
if not isfolder(RootFolder) then makefolder(RootFolder) end
if not isfolder(MacroFolder) then makefolder(MacroFolder) end
if not isfolder(DataFolder) then makefolder(DataFolder) end

-- // 3. LIBRARY SETUP
local MacLib = loadstring(game:HttpGet("http://localhost:8081/MacLib.lua"))()
local Window = MacLib:Window({
    Title = "Anime Overload | Apel Hub",
    Subtitle = isLobby and "Lobby" or "Game Stage",
    Size = UDim2.fromOffset(865, 650),
    DragStyle = 2,
    Keybind = Enum.KeyCode.LeftControl,
    AcrylicBlur = false,
})
getgenv()._AOUI = Window

local tabGroups = { Main = Window:TabGroup() }
local tabs = {
    Join     = tabGroups.Main:Tab({ Name = "Auto Join", Image = "rbxassetid://10734923549" }),
    AutoPlace = tabGroups.Main:Tab({ Name = "Auto Place", Image = "rbxassetid://10723416765" }),
    Summon   = tabGroups.Main:Tab({ Name = "Summon",    Image = "rbxassetid://10747372992" }),
    Macro     = tabGroups.Main:Tab({ Name = "Macros",     Image = "rbxassetid://10734898592" }),
    StageMacro = tabGroups.Main:Tab({ Name = "Stage Macros", Image = "rbxassetid://10723416765" }),
    Challenge = tabGroups.Main:Tab({ Name = "Challenges", Image = "rbxassetid://10734975692" }),
    Auto      = tabGroups.Main:Tab({ Name = "Auto",       Image = "rbxassetid://10734932295" }),
    Cards     = tabGroups.Main:Tab({ Name = "Cards",      Image = "rbxassetid://10723396225" }),
    Teleport  = tabGroups.Main:Tab({ Name = "Teleport",   Image = "rbxassetid://6026568198" }),
    Settings = tabGroups.Main:Tab({ Name = "Settings",   Image = "rbxassetid://10734950309" }),
}

local sections = {
    JoinLeft      = tabs.Join:Section({ Side = "Left" }),
    JoinRight     = tabs.Join:Section({ Side = "Right" }),
    AutoPlaceLeft = tabs.AutoPlace:Section({ Side = "Left" }),
    AutoPlaceRight= tabs.AutoPlace:Section({ Side = "Right" }),
    SummonLeft    = tabs.Summon:Section({ Side = "Left" }),
    SummonRight   = tabs.Summon:Section({ Side = "Right" }),
    MacroLeft     = tabs.Macro:Section({ Side = "Left" }),
    MacroRight    = tabs.Macro:Section({ Side = "Right" }),
    StageMacroLeft  = tabs.StageMacro:Section({ Side = "Left" }),
    StageMacroRight = tabs.StageMacro:Section({ Side = "Right" }),
    ChalLeft      = tabs.Challenge:Section({ Side = "Left" }),
    ChalRight     = tabs.Challenge:Section({ Side = "Right" }),
    AutoLeft      = tabs.Auto:Section({ Side = "Left" }),
    AutoRight     = tabs.Auto:Section({ Side = "Right" }),
    CardsLeft     = tabs.Cards:Section({ Side = "Left" }),
    CardsCenter   = tabs.Cards:Section({ Side = "Center" }),
    CardsRight    = tabs.Cards:Section({ Side = "Right" }),
    TeleportLeft  = tabs.Teleport:Section({ Side = "Left" }),
    TeleportRight = tabs.Teleport:Section({ Side = "Right" }),
    SettingsUI    = tabs.Settings:Section({ Side = "Left" }),
}

-- // 4. ANTI-AFK
coroutine.wrap(function()
    local GC = getconnections or get_signal_cons
    if GC then
        for _, v in pairs(GC(LocalPlayer.Idled)) do
            if v["Disable"] then v["Disable"](v) elseif v["Disconnect"] then v["Disconnect"](v) end
        end
    else
        local VU = cloneref(game:GetService("VirtualUser"))
        LocalPlayer.Idled:Connect(function() VU:CaptureController() VU:ClickButton2(Vector2.new()) end)
    end
end)()

local function Notify(text)
    Window:Notify({ Title = "Apel Hub", Description = text, Lifetime = 3 })
end

local function LobbyTeleportToZone(displayName, position)
    if not isLobby then
        Notify("Teleport: Lobby only")
        return
    end
    local char = LocalPlayer.Character
    if not char then
        Notify("Character not loaded")
        return
    end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then
        Notify("HumanoidRootPart missing")
        return
    end
    hrp.CFrame = CFrame.new(position)
    Notify("Teleported · " .. displayName)
end

-- // 5. SAFE MODULE LOADER
-- Lobby modules
local roomsNet, questsNet, summonNet, playerNet, reflexNet, clientStore, questsConfig, bannerState
local stageConfigs = {}

-- Game Stage modules
local syncNet, towersNet, votingNet, gameClientStore

_AO.ModulesLoaded = false
local success_load, err_load = pcall(function()

    if isLobby then
        local lc = RS:WaitForChild("lobbyClient", 10)

        roomsNet = require(lc:WaitForChild("net"):WaitForChild("rooms"))
        questsNet = require(lc:WaitForChild("net"):WaitForChild("quests"))
        summonNet = require(lc:WaitForChild("net"):WaitForChild("summon"))
        playerNet = require(lc:WaitForChild("net"):WaitForChild("player"))
        reflexNet = require(lc:WaitForChild("net"):WaitForChild("reflex"))
        clientStore = require(lc:WaitForChild("store"):WaitForChild("clientStore"))
        bannerState = require(lc:WaitForChild("ui"):WaitForChild("summon"):WaitForChild("bannerState"))
        questsConfig = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("quests"))

    else
        local gc = RS:WaitForChild("gameClient", 10)

        syncNet = require(gc:WaitForChild("net"):WaitForChild("sync"))

        towersNet = require(gc:WaitForChild("net"):WaitForChild("towers"))

        votingNet = require(gc:WaitForChild("net"):WaitForChild("votingNet"))

        playerNet = require(gc:WaitForChild("net"):WaitForChild("player"))

        reflexNet = require(gc:WaitForChild("net"):WaitForChild("reflex"))
        gameClientStore = require(gc:WaitForChild("store"):WaitForChild("clientStore"))
        -- Start reflex sync
        pcall(function() reflexNet.start.fire() end)

    end

    -- Load stage configs (shared, available in both)
    pcall(function()
        local stagesFolder = RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("stages")
        for _, module in pairs(stagesFolder:GetChildren()) do
            if module:IsA("ModuleScript") then
                local ok, cfg = pcall(require, module)
                if ok and type(cfg) == "table" and cfg.id then stageConfigs[cfg.id] = cfg end
            end
        end
    end)
    local stageCount = 0; for _ in pairs(stageConfigs) do stageCount = stageCount + 1 end
    _AO.ModulesLoaded = true

end)

if not isLobby and _AO.ModulesLoaded and success_load then
	local _okAutoUlt, _errAutoUlt = pcall(function()
		local RunService = game:GetService("RunService")
		local CONFIG = AutoUltSettings
		local function log(...)
			if CONFIG.DEBUG then
				print("[AO_AutoUlt]", ...)
			end
		end
	local gc = RS:WaitForChild("gameClient", 15)
	local FEECS = require(RS:WaitForChild("Packages"):WaitForChild("FEECS"))
	local items = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("items"))
	local clock = require(RS:WaitForChild("shared"):WaitForChild("clock"))
	local gamemodes = require(RS:WaitForChild("shared"):WaitForChild("enums"):WaitForChild("gamemodes"))
	local getHeroStats = require(
		RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("gameData"):WaitForChild("functions"):WaitForChild("getHeroStats")
	)
	local getTowerBuffs = require(RS:WaitForChild("gameShared"):WaitForChild("utilities"):WaitForChild("getTowerBuffs"))
	local ultimateReq = require(RS:WaitForChild("gameShared"):WaitForChild("utilities"):WaitForChild("ultimateRequirements"))
	local ultimateCd = require(RS:WaitForChild("gameShared"):WaitForChild("utilities"):WaitForChild("ultimateCooldownMode"))
	-- NOTE: clientStore/syncNet shadow outer scope intentionally (same modules, scoped to AutoUlt)
	local clientStore = require(gc:WaitForChild("store"):WaitForChild("clientStore"))
	local syncNet = require(gc:WaitForChild("net"):WaitForChild("sync"))
	local attackStateManager = require(gc:WaitForChild("controllers"):WaitForChild("tower"):WaitForChild("attackStateManager"))
	local heroPlacement = require(gc:WaitForChild("controllers"):WaitForChild("tower"):WaitForChild("heroPlacement"))
	local isPlayerCrouchingInDD = require(gc:WaitForChild("utilities"):WaitForChild("isPlayerCrouchingInDD"))

	local selectGamemode =
		require(RS:WaitForChild("gameShared"):WaitForChild("store"):WaitForChild("slices"):WaitForChild("gamemode"):WaitForChild("selectors"):WaitForChild("selectGamemode"))
	local selectOnUltimate = require(
		gc:WaitForChild("store"):WaitForChild("slices"):WaitForChild("towers"):WaitForChild("selectors"):WaitForChild("selectOnUltimate")
	)
	local selectCutsceneActive = require(
		gc:WaitForChild("store"):WaitForChild("slices"):WaitForChild("towers"):WaitForChild("selectors"):WaitForChild("selectCutsceneActive")
	)
	local selectUltimateUsageState = require(
		gc:WaitForChild("store"):WaitForChild("slices"):WaitForChild("gui"):WaitForChild("selectors"):WaitForChild("selectUltimateUsageState")
	)
	local selectTowerStat = require(
		RS:WaitForChild("gameShared"):WaitForChild("store"):WaitForChild("slices"):WaitForChild("towers"):WaitForChild("selectors"):WaitForChild("selectTowerStat")
	)
	local selectPlayerHero = require(
		RS:WaitForChild("shared")
			:WaitForChild("store")
			:WaitForChild("slices")
			:WaitForChild("data")
			:WaitForChild("selectors")
			:WaitForChild("heroes")
			:WaitForChild("selectPlayerHero")
	)

	pcall(function()
		require(gc:WaitForChild("net"):WaitForChild("reflex")).start.fire()
	end)

	local myUserId = tonumber(LocalPlayer.UserId)

	local function isMyTower(tower)
		return tower and tonumber(tower.owner) == myUserId
	end

	--- Выбор актуального ульта по уровню прокачки (как в UI: приоритет с большим levelRange[1]).
	local function pickUltimateSlot(heroCfg, currentUpgrade)
		if not heroCfg or not heroCfg.ultimates then
			return nil, nil
		end
		local bestSlot, bestMin = nil, -math.huge
		for i, u in ipairs(heroCfg.ultimates) do
			if currentUpgrade >= u.levelRange[1] and currentUpgrade <= u.levelRange[2] then
				if u.levelRange[1] > bestMin then
					bestMin = u.levelRange[1]
					bestSlot = i
				end
			end
		end
		if not bestSlot then
			return nil, nil
		end
		return bestSlot, heroCfg.ultimates[bestSlot]
	end

	local function enemyMatchesBossFilter(className)
		if className == "boss" then
			return true
		end
		if CONFIG.INCLUDE_MINI_BOSS and className == "miniBoss" then
			return true
		end
		return false
	end

	local function iterBossesOnMap()
		local list = {}
		for entityId, etype in FEECS.queryEntities("entityType") do
			if etype == "enemyEntity" then
				local comp = FEECS.getAllEntityComponents(entityId)
				if comp and enemyMatchesBossFilter(comp.class) and (comp.health or 0) > 0 then
					table.insert(list, { id = entityId, uniqueId = comp.uniqueId, class = comp.class })
				end
			end
		end
		return list
	end

	-- Cache boss scan to avoid iterating all entities multiple times per frame
	local _cachedBossList = {}
	local _cachedBossTime = 0
	local function getCachedBosses()
		local now = tick()
		if now - _cachedBossTime > 0.5 then
			_cachedBossList = iterBossesOnMap()
			_cachedBossTime = now
		end
		return _cachedBossList
	end

	local function shouldRelaxEnemyRangeForBoss()
		if CONFIG.BOSS_MODE == "off" or not CONFIG.RELAX_ENEMY_RANGE_WITH_BOSS then
			return false
		end
		return #getCachedBosses() > 0
	end

	--- opts.skipGlobalUltimateGate: if true, only cutscene blocks (lets next tower ult after another's ult UI)
	local function describeTowerState(uniqueId, heroCfg, opts)
		opts = opts or {}
		local ref = FEECS.refEntity(uniqueId)
		if not ref then
			return { ok = false, reason = "no_entity_ref" }
		end
		local tower = FEECS.getAllEntityComponents(ref)
		if not tower or tower.entityType ~= "towerEntity" then
			return { ok = false, reason = "not_tower" }
		end
		if not isMyTower(tower) then
			return { ok = false, reason = "not_owner" }
		end

		local gamemode = clientStore:getState(selectGamemode)
		if gamemode == gamemodes.doubleDungeon or gamemode == gamemodes.raid then
			return { ok = false, reason = "gamemode_no_ults" }
		end
		if isPlayerCrouchingInDD() then
			return { ok = false, reason = "crouching" }
		end
		if opts.skipGlobalUltimateGate then
			if clientStore:getState(selectCutsceneActive) then
				return { ok = false, reason = "global_cutscene" }
			end
		elseif clientStore:getState(selectOnUltimate) or clientStore:getState(selectCutsceneActive) then
			return { ok = false, reason = "global_ult_or_cutscene" }
		end
		if tower.onAttack or attackStateManager.isClientAttacking(ref) then
			return { ok = false, reason = "tower_attacking" }
		end

		local slotIdx, resolvedUlt = pickUltimateSlot(heroCfg, tower.currentUpgrade)
		if not slotIdx or not resolvedUlt then
			return { ok = false, reason = "no_ult_for_upgrade" }
		end

		if resolvedUlt.requireTarget and not tower.currentTarget then
			return { ok = false, reason = "require_target" }
		end

		local usage = clientStore:getState(selectUltimateUsageState(resolvedUlt.id))
		if ultimateCd.isOneTimeUse(resolvedUlt) and usage and usage.used then
			return { ok = false, reason = "one_time_used" }
		end
		local lastAt = usage and usage.lastUsedAt or nil
		local elapsed = lastAt and (clock.now() - lastAt) or math.huge
		if ultimateCd.usesCooldown(resolvedUlt) and resolvedUlt.cooldown and lastAt and elapsed < resolvedUlt.cooldown then
			return {
				ok = false,
				reason = "cooldown",
				cdLeft = math.ceil(resolvedUlt.cooldown - elapsed),
			}
		end

		local heroState = clientStore:getState(selectPlayerHero(tower.owner, tower.originalUniqueId))
		if not heroState then
			return { ok = false, reason = "no_hero_state" }
		end

		local barMeters = clientStore:getState(selectTowerStat(uniqueId, "barMeters"))
		local reqState = ultimateReq.buildState(tower.id, resolvedUlt.id, {
			barMeters = barMeters,
			towerComponents = tower,
		})
		if not ultimateReq.meetsRequirement(tower.id, resolvedUlt.id, reqState) then
			return { ok = false, reason = "requirements", msg = ultimateReq.getFailureMessage(tower.id, resolvedUlt.id) }
		end

		local heroRow = items.hero.get(tower.id)
		if heroRow and heroRow.heroType ~= "farm" then
			local buffs = getTowerBuffs(clientStore:getState(selectTowerStat(uniqueId, "buffTable")))
			local range = getHeroStats(heroState, { currentUpgrade = tower.currentUpgrade }, buffs).range
			local pos = tower.cframe and tower.cframe.Position
			if not pos then
				return { ok = false, reason = "no_position" }
			end
			local relaxRange = shouldRelaxEnemyRangeForBoss()
			if not relaxRange then
				local enemyInRange = false
				for eid, et in FEECS.queryEntities("entityType") do
					if et == "enemyEntity" then
						local ec = FEECS.getAllEntityComponents(eid)
						if ec and ec.cframe and (ec.cframe.Position - pos).Magnitude <= range then
							enemyInRange = true
							break
						end
					end
				end
				if not enemyInRange then
					return { ok = false, reason = "no_enemies_in_range" }
				end
			end
		end

		return {
			ok = true,
			slot = slotIdx,
			ultId = resolvedUlt.id,
			heroId = tower.id,
			uniqueId = uniqueId,
			ultActive = tower.onAttack == true,
		}
	end

	--- Полный снимок для дампа (не влияет на логику выстрела).
	local function computeUltDump(tower, heroCfg)
		local uid = tower.uniqueId
		local ref = FEECS.refEntity(uid)
		local d = {
			uniqueId = uid,
			heroId = tower.id,
			currentUpgrade = tower.currentUpgrade,
			upgradeMax = tower.upgradeValues and #tower.upgradeValues or nil,
		}

		if not heroCfg then
			d.error = "no_hero_config"
			return d
		end

		d.configUltCount = heroCfg.ultimates and #heroCfg.ultimates or 0
		d.configHasUltimates = d.configUltCount > 0

		local slot, ult = pickUltimateSlot(heroCfg, tower.currentUpgrade)
		d.resolvedSlot = slot
		d.resolvedUltId = ult and ult.id or nil
		if ult and ult.levelRange then
			d.ultLevelRange = ("%s–%s"):format(tostring(ult.levelRange[1]), tostring(ult.levelRange[2]))
		end
		d.levelUnlockOk = slot ~= nil and ult ~= nil

		d.gamemode = clientStore:getState(selectGamemode)
		d.check_gamemode = not (d.gamemode == gamemodes.doubleDungeon or d.gamemode == gamemodes.raid)
		d.check_crouch = not isPlayerCrouchingInDD()

		d.globalOnUltimate = clientStore:getState(selectOnUltimate) == true
		d.globalCutscene = clientStore:getState(selectCutsceneActive) == true
		d.check_global_ui = not d.globalOnUltimate and not d.globalCutscene

		d.towerOnAttack = tower.onAttack == true
		d.clientAttacking = ref ~= nil and attackStateManager.isClientAttacking(ref) or false
		d.check_not_attacking = not d.towerOnAttack and not d.clientAttacking

		if ult then
			d.requireTarget = ult.requireTarget == true
			local ct = tower.currentTarget
			d.hasTarget = ct ~= nil and ct ~= ""
			d.check_target = (not d.requireTarget) or d.hasTarget
		else
			d.requireTarget = nil
			d.hasTarget = nil
			d.check_target = false
		end

		if ult then
			local usage = clientStore:getState(selectUltimateUsageState(ult.id))
			d.cooldownMode = ultimateCd.getMode(ult)
			d.usesCooldown = ultimateCd.usesCooldown(ult)
			d.oneTimeUse = ultimateCd.isOneTimeUse(ult)
			d.ultCooldownTotal = ult.cooldown
			d.lastUsedAt = usage and usage.lastUsedAt or nil
			d.usedOnce = usage and usage.used == true
			local elapsed = d.lastUsedAt and (clock.now() - d.lastUsedAt) or math.huge
			d.cdElapsedSec = d.lastUsedAt and elapsed or nil
			if d.oneTimeUse and d.usedOnce then
				d.check_cooldown = false
				d.cdLeftSec = nil
			elseif d.usesCooldown and ult.cooldown and d.lastUsedAt and elapsed < ult.cooldown then
				d.check_cooldown = false
				d.cdLeftSec = math.ceil(ult.cooldown - elapsed)
			else
				d.check_cooldown = true
				d.cdLeftSec = 0
			end
		else
			d.check_cooldown = false
		end

		local heroState = clientStore:getState(selectPlayerHero(tower.owner, tower.originalUniqueId))
		d.heroStateOk = heroState ~= nil

		local barMeters = clientStore:getState(selectTowerStat(uid, "barMeters"))
		d.barPrimaryProgress = nil
		if barMeters and barMeters.primary and barMeters.primary.progress ~= nil then
			d.barPrimaryProgress = barMeters.primary.progress
		end
		d.variBarOnTower = tower.variBarProgress

		if ult and d.heroStateOk then
			local reqCtx = { barMeters = barMeters, towerComponents = tower }
			d.reqHave = ultimateReq.buildState(tower.id, ult.id, reqCtx)
			d.reqNeed = ultimateReq.getRequirement(tower.id, ult.id)
			d.check_requirements = ultimateReq.meetsRequirement(tower.id, ult.id, d.reqHave)
			if not d.check_requirements then
				d.requirementsMsg = ultimateReq.getFailureMessage(tower.id, ult.id)
			end
		elseif not ult then
			d.requirementsNote = "нет ульта для текущего уровня (см. диапазон лвл в конфиге)"
		elseif not d.heroStateOk then
			d.requirementsNote = "нет hero state в сторе — требования не считались"
		end

		local heroRow = items.hero.get(tower.id)
		d.isFarm = heroRow and heroRow.heroType == "farm"
		d.enemiesInRangeCount = nil
		d.attackRange = nil
		d.check_enemies_in_range = true
		d.relaxEnemyRangeApplied = shouldRelaxEnemyRangeForBoss()
		if ult and d.levelUnlockOk and heroRow and not d.isFarm and heroState then
			local buffs = getTowerBuffs(clientStore:getState(selectTowerStat(uid, "buffTable")))
			d.attackRange = getHeroStats(heroState, { currentUpgrade = tower.currentUpgrade }, buffs).range
			local pos = tower.cframe and tower.cframe.Position
			if not pos then
				d.check_enemies_in_range = false
				d.enemyRangeFail = "no_position"
			else
				local n = 0
				for eid, et in FEECS.queryEntities("entityType") do
					if et == "enemyEntity" then
						local ec = FEECS.getAllEntityComponents(eid)
						if ec and ec.cframe and (ec.cframe.Position - pos).Magnitude <= d.attackRange then
							n = n + 1
						end
					end
				end
				d.enemiesInRangeCount = n
				if d.relaxEnemyRangeApplied then
					d.check_enemies_in_range = true
					d.enemyRangeNote = "радиус не требуется: босс на карте (RELAX_ENEMY_RANGE_WITH_BOSS)"
				else
					d.check_enemies_in_range = n > 0
				end
			end
		elseif d.isFarm then
			d.check_enemies_in_range = true
		end

		local st = d.configHasUltimates and describeTowerState(uid, heroCfg) or { ok = false, reason = "hero_no_ultimates" }
		d.canFire = st.ok
		d.blockReason = st.reason
		d.blockMsg = st.msg
		d.cdLeftFromState = st.cdLeft

		return d
	end

	local function formatReqTable(need, have)
		if type(need) ~= "table" or next(need) == nil then
			return "нет отдельных требований (бар/прочее)"
		end
		local parts = {}
		for k, needVal in pairs(need) do
			local got = have and have[k]
			table.insert(parts, ("%s: нужно ≥%s, сейчас %s"):format(tostring(k), tostring(needVal), tostring(got)))
		end
		return table.concat(parts, " | ")
	end

	local function scanTowerEntities()
		local total, mine = 0, 0
		local owners = {}
		for entityId, etype in FEECS.queryEntities("entityType") do
			if etype == "towerEntity" then
				total = total + 1
				local tower = FEECS.getAllEntityComponents(entityId)
				if tower then
					local o = tower.owner
					if o ~= nil then
						owners[o] = (owners[o] or 0) + 1
					end
					if isMyTower(tower) then
						mine = mine + 1
					end
				end
			end
		end
		return { total = total, mine = mine, owners = owners }
	end

	local function collectDiagnostics()
		local rows = {}
		local bossList = iterBossesOnMap()
		local scan = scanTowerEntities()
		for entityId, etype in FEECS.queryEntities("entityType") do
			if etype == "towerEntity" then
				local tower = FEECS.getAllEntityComponents(entityId)
				if tower and isMyTower(tower) then
					local heroCfg = items.hero.get(tower.id)
					local dump = computeUltDump(tower, heroCfg)
					table.insert(rows, dump)
				end
			end
		end
		return rows, bossList, scan
	end

	-- Export ult check for macro playback
	_AO._getUltLastUsedAt = function(uniqueId)
		local result = nil
		pcall(function()
			local ref = FEECS.refEntity(uniqueId)
			if not ref then return end
			local tower = FEECS.getAllEntityComponents(ref)
			if not tower then return end
			local heroCfg = items.hero.get(tower.id)
			if not heroCfg then return end
			local slot, ult = pickUltimateSlot(heroCfg, tower.currentUpgrade)
			if not ult then return end
			local usage = clientStore:getState(selectUltimateUsageState(ult.id))
			result = usage and usage.lastUsedAt or 0
		end)
		return result
	end

	local lastAnyUltTime = 0
	local bossWindowEnd = 0
	local ultsInWindow = 0
	local hadBoss = false
	local _lastHeartbeatCheck = 0
	local _lastStatusLog = 0
	local _heartbeatStarted = false

	_AO._AOAutoUltHeartbeatConn = RunService.Heartbeat:Connect(function()
		if not getgenv()._AORunning or not _AO.AutoUltimateEnabled then
			return
		end

		-- First run log
		if not _heartbeatStarted then
			_heartbeatStarted = true
			log("Heartbeat loop ACTIVE — boss_mode=" .. CONFIG.BOSS_MODE)
		end

		-- Throttle: check ~10x/sec instead of 60x
		local now = tick()
		if now - _lastHeartbeatCheck < 0.1 then return end
		_lastHeartbeatCheck = now

		-- Periodic status every 5 sec when debug on
		if CONFIG.DEBUG and now - _lastStatusLog > 5 then
			_lastStatusLog = now
			local bosses = getCachedBosses()
			local myTowers = 0
			local towerStatuses = {}
			for eid, et in FEECS.queryEntities("entityType") do
				if et == "towerEntity" then
					local t = FEECS.getAllEntityComponents(eid)
					if t and isMyTower(t) then
						myTowers = myTowers + 1
						local hcfg = items.hero.get(t.id)
						local status
						if not hcfg or not hcfg.ultimates or not hcfg.ultimates[1] then
							status = t.id .. ":no_ults"
						else
							local s, u = pickUltimateSlot(hcfg, t.currentUpgrade)
							if not s then
								status = t.id .. ":no_ult_for_lvl(" .. tostring(t.currentUpgrade) .. ")"
							else
								local st = describeTowerState(t.uniqueId, hcfg)
								if st.ok then
									status = t.id .. ":READY"
								else
									status = t.id .. ":" .. (st.reason or "?")
								end
							end
						end
						table.insert(towerStatuses, status)
					end
				end
			end
			log(("STATUS: towers=%d bosses=%d mode=%s"):format(myTowers, #bosses, CONFIG.BOSS_MODE))
			for _, s in ipairs(towerStatuses) do
				log("  " .. s)
			end
		end

		local ok, err = pcall(function()
			local bosses = getCachedBosses()
			local bossNow = #bosses > 0
			if CONFIG.BOSS_MODE == "spawn_window" then
				if bossNow and not hadBoss then
					bossWindowEnd = tick() + CONFIG.BOSS_SPAWN_WINDOW_SEC
					ultsInWindow = 0
					log("Босс/минибосс на карте — окно ультов", CONFIG.BOSS_SPAWN_WINDOW_SEC, "сек")
				end
				hadBoss = bossNow
				if tick() > bossWindowEnd then
					return
				end
			elseif CONFIG.BOSS_MODE == "while_alive" then
				if not bossNow then
					return
				end
			end
			-- BOSS_MODE == "off" → не фильтруем по боссу

			if CONFIG.BOSS_MODE == "spawn_window" and CONFIG.MAX_ULTS_PER_BOSS_WINDOW > 0 and ultsInWindow >= CONFIG.MAX_ULTS_PER_BOSS_WINDOW then
				return
			end

			if tick() - lastAnyUltTime < CONFIG.MIN_INTERVAL_BETWEEN_ANY_ULT_SEC then
				return
			end

			for entityId, etype in FEECS.queryEntities("entityType") do
				if etype == "towerEntity" then
					local tower = FEECS.getAllEntityComponents(entityId)
					if tower and isMyTower(tower) then
						local heroCfg = items.hero.get(tower.id)
						if heroCfg and heroCfg.ultimates and heroCfg.ultimates[1] then
							local slot, ult = pickUltimateSlot(heroCfg, tower.currentUpgrade)
							if slot and ult then
								local st = describeTowerState(
									tower.uniqueId,
									heroCfg,
									CONFIG.RELAX_GLOBAL_ON_ULTIMATE_FOR_CHAIN and { skipGlobalUltimateGate = true } or nil
								)
								if st.ok then
									pcall(function()
										heroPlacement.cancel()
									end)
									pcall(function()
										clientStore.setIsPlacing(nil)
									end)
									local fireOk, fireErr = pcall(function()
										syncNet.clientUltimate.fire(st.uniqueId, st.slot)
									end)
									lastAnyUltTime = tick()
									ultsInWindow = ultsInWindow + 1
									if fireOk then
										log("ULT fired", st.heroId, "slot", st.slot, "uid", st.uniqueId)
									else
										warn("[AO_AutoUlt] fire error", fireErr)
									end
									return
								end
							end
						end
					end
				end
			end
		end)
		if not ok then
			warn("[AO_AutoUlt] Heartbeat error:", err)
		end
	end)

	local function yn(v)
		return v and "да" or "нет"
	end

	-- Разовый дамп в консоль (можно вызывать снова из консоли)
	getgenv().AOAutoUlt_Dump = function()
		local rows, bosses, scan = collectDiagnostics()
		print("======== AO AutoUlt diagnostics ========")
		print(
			"Башни (FEECS towerEntity): всего",
			scan.total,
			"| ваших по owner:",
			scan.mine,
			"| ваш UserId:",
			tostring(myUserId)
		)
		if scan.total > 0 and scan.mine == 0 then
			local parts = {}
			for o, c in pairs(scan.owners) do
				table.insert(parts, tostring(o) .. "×" .. tostring(c))
			end
			table.sort(parts)
			print("  Внимание: ваших башен 0. Owner userId на карте:", #parts > 0 and table.concat(parts, ", ") or "?")
		end
		print(
			"Глобально: gamemode =",
			tostring(clientStore:getState(selectGamemode)),
			"| onUltimate =",
			yn(clientStore:getState(selectOnUltimate)),
			"| cutscene =",
			yn(clientStore:getState(selectCutsceneActive)),
			"| DD crouch =",
			yn(isPlayerCrouchingInDD())
		)
		print("Боссы / минибоссы на карте:", #bosses)
		for _, b in ipairs(bosses) do
			print(("  • %s | %s"):format(tostring(b.class), tostring(b.uniqueId)))
		end
		if #rows == 0 then
			print("(Нет ваших towerEntity на карте)")
		end
		for _, r in ipairs(rows) do
			print("----------------------------------------")
			if r.error then
				print(("Башня %s | hero=%s | ошибка: %s"):format(tostring(r.uniqueId), tostring(r.heroId), r.error))
			else
				print(
					("Башня %s | hero=%s | апгрейд %s/%s | ультов в конфиге: %s"):format(
						tostring(r.uniqueId),
						tostring(r.heroId),
						tostring(r.currentUpgrade),
						tostring(r.upgradeMax or "?"),
						tostring(r.configUltCount)
					)
				)
				print(
					("  Уровень→ульт: %s | слот=%s id=%s диапазон лвл [%s]"):format(
						yn(r.levelUnlockOk),
						tostring(r.resolvedSlot or "—"),
						tostring(r.resolvedUltId or "—"),
						tostring(r.ultLevelRange or "—")
					)
				)
				print(
					("  Режим: gamemode_ok=%s | не в DD приседе=%s | глоб.ульт/катсцена свободны=%s"):format(
						yn(r.check_gamemode),
						yn(r.check_crouch),
						yn(r.check_global_ui)
					)
				)
				print(
					("  Башня не бьёт / не clientAttack: %s (onAttack=%s clientAtt=%s)"):format(
						yn(r.check_not_attacking),
						yn(r.towerOnAttack),
						yn(r.clientAttacking)
					)
				)
				print(
					("  Цель: needTarget=%s hasTarget=%s ok=%s"):format(
						tostring(r.requireTarget),
						tostring(r.hasTarget),
						yn(r.check_target)
					)
				)
				print(
					("  КД: mode=%s usesCd=%s oneTime=%s used=%s | готово=%s осталось_сек=%s (elapsed=%s total=%s)"):format(
						tostring(r.cooldownMode or "—"),
						tostring(r.usesCooldown),
						tostring(r.oneTimeUse),
						tostring(r.usedOnce),
						yn(r.check_cooldown),
						tostring(r.cdLeftSec ~= nil and r.cdLeftSec or r.cdLeftFromState or "—"),
						tostring(r.cdElapsedSec or "—"),
						tostring(r.ultCooldownTotal or "—")
					)
				)
				print(("  Данные героя в сторе: %s"):format(yn(r.heroStateOk)))
				print(
					("  Бар: primary.progress=%s | tower.variBarProgress=%s"):format(
						tostring(r.barPrimaryProgress or "—"),
						tostring(r.variBarOnTower or "—")
					)
				)
				if r.requirementsNote then
					print(("  Требования ульта: %s"):format(r.requirementsNote))
				else
					print(("  Требования ульта: ok=%s | %s"):format(yn(r.check_requirements), formatReqTable(r.reqNeed, r.reqHave)))
					if r.requirementsMsg then
						print(("    → %s"):format(r.requirementsMsg))
					end
				end
				if r.isFarm then
					print("  Враги в радиусе: N/A (farm)")
				else
					print(
						("  Враги в радиусе: count=%s range=%s ok=%s %s"):format(
							tostring(r.enemiesInRangeCount or "—"),
							tostring(r.attackRange or "—"),
							yn(r.check_enemies_in_range),
							r.enemyRangeFail and ("(" .. r.enemyRangeFail .. ")") or ""
						)
					)
					if r.enemyRangeNote then
						print("    →", r.enemyRangeNote)
					end
				end
				print(
					("  >>> ИТОГ: canFire=%s | причина=%s %s"):format(
						yn(r.canFire),
						tostring(r.blockReason or "—"),
						r.blockMsg and ("| " .. tostring(r.blockMsg)) or ""
					)
				)
			end
		end
		print("========================================")
	end
		dbg("Auto Ultimate: FEECS loop registered")
	end)
	if _okAutoUlt then
		print("[AO_AutoUlt] Init OK — Heartbeat registered, toggle Auto Ultimate to start")
	else
		warn("[Apel Hub] Auto Ultimate init FAILED:", _errAutoUlt)
		getgenv().AOAutoUlt_Dump = function()
			print("[AO_AutoUlt] Init failed:", tostring(_errAutoUlt))
		end
	end
end
-- // 6. HELPERS

local userId = tostring(LocalPlayer.UserId)

local function GetStore()
    return isLobby and clientStore or gameClientStore
end

-- Get hero name by UUID from store
local function GetHeroNameByUUID(uuid)
    local store = GetStore()
    if not store then return "Unknown" end
    local ok, state = pcall(function() return store:getState() end)
    if not ok or not state or not state.data or not state.data.heroes then return "Unknown" end
    local heroes = state.data.heroes[userId]
    if not heroes then return "Unknown" end
    local hero = heroes[uuid]
    if hero and hero.id then return hero.id end
    return "Unknown"
end

-- Get hero UUID by name from store (prefers equipped hero, falls back to any match for premium)
local function GetHeroUUIDByName(heroName)
    local store = GetStore()
    if not store then return nil end
    local ok, state = pcall(function() return store:getState() end)
    if not ok or not state or not state.data or not state.data.heroes then return nil end
    local heroes = state.data.heroes[userId]
    if not heroes then return nil end
    local equippedMatch, anyMatch = nil, nil
    for uuid, hero in pairs(heroes) do
        if hero.id == heroName then
            if hero.equipped and hero.equipped > 0 then
                if equippedMatch == nil or hero.equipped < (heroes[equippedMatch].equipped or 999) then
                    equippedMatch = uuid
                end
            elseif anyMatch == nil then
                anyMatch = uuid
            end
        end
    end
    if equippedMatch then return equippedMatch end
    if anyMatch then return anyMatch end
    return nil
end

-- Get equipped hero UUIDs
local function GetEquippedHeroes()
    local store = GetStore()
    if not store then return {} end
    local ok, state = pcall(function() return store:getState() end)
    if not ok or not state or not state.data or not state.data.heroes then return {} end
    local heroes = state.data.heroes[userId]
    if not heroes then return {} end
    local equipped = {}
    for uuid, hero in pairs(heroes) do
        if hero.equipped and hero.equipped > 0 then
            table.insert(equipped, { uuid = uuid, id = hero.id, slot = hero.equipped })
        end
    end
    table.sort(equipped, function(a, b) return a.slot < b.slot end)
    return equipped
end

local function IsPremium()
    return _G.fanmyrka == true
end

local MAX_FREE_MACRO_UNITS = 6

local function GetMacroUniqueUnits(macro)
    local units = {}
    local seen = {}
    for _, step in ipairs(macro) do
        if step.Action == "Place" and step.UnitName and not seen[step.UnitName] then
            seen[step.UnitName] = true
            table.insert(units, step.UnitName)
        end
    end
    return units
end

local function GetHeroEquippedStatus(heroName)
    local store = GetStore()
    if not store then return nil end
    local ok, state = pcall(function() return store:getState() end)
    if not ok or not state or not state.data or not state.data.heroes then return nil end
    local heroes = state.data.heroes[userId]
    if not heroes then return nil end
    for _, hero in pairs(heroes) do
        if hero.id == heroName and hero.equipped and hero.equipped > 0 then
            return hero.equipped
        end
    end
    return nil
end

local function CanPlayMacro(macro, silent)
    if #macro == 0 then
        if not silent then Notify("Macro is empty") end
        return false, "empty"
    end
    local uniqueUnits = GetMacroUniqueUnits(macro)
    local premium = IsPremium()

    if not premium and #uniqueUnits > MAX_FREE_MACRO_UNITS then
        if not silent then
            Notify("Macro uses " .. #uniqueUnits .. " units (max " .. MAX_FREE_MACRO_UNITS .. " for free). Buy Premium to unlock!")
        end
        return false, "too_many_units"
    end

    if not premium then
        local missing = {}
        for _, name in ipairs(uniqueUnits) do
            local slot = GetHeroEquippedStatus(name)
            if not slot then
                table.insert(missing, name)
            end
        end
        if #missing > 0 then
            if not silent then
                Notify("Equip these heroes or buy Premium: " .. table.concat(missing, ", "))
            end
            return false, "not_equipped", missing
        end
    end

    return true
end

-- ═══════════════════════════════════════════
-- LOBBY FEATURES (Auto Join, Summon, Quests)
-- ═══════════════════════════════════════════

-- Stage lists
local StoryStages, RaidStages, ExcavationStages = {}, {}, {}
local AllStages = {}
local StoryDisplayNames, RaidDisplayNames, ExcavationDisplayNames = {}, {}, {}

local function BuildStageLists()
    for id, cfg in pairs(stageConfigs) do
        local displayName = cfg.name or id
        AllStages[displayName] = id
        local gm = cfg.gamemode or (cfg.raidOnly and "raid") or "story"
        if cfg.gamemode == "excavation" then
            table.insert(ExcavationStages, { id = id, name = displayName, order = cfg.order or 999, gamemode = gm })
        elseif cfg.gamemodeSpecific then
            -- skip
        elseif cfg.raidOnly then
            table.insert(RaidStages, { id = id, name = displayName, order = cfg.order or 999, gamemode = gm })
        else
            table.insert(StoryStages, { id = id, name = displayName, order = cfg.order or 999, gamemode = gm })
        end
    end
    table.sort(StoryStages, function(a, b) return a.order < b.order end)
    table.sort(RaidStages, function(a, b) return (a.order or 999) < (b.order or 999) end)
    for _, s in ipairs(StoryStages) do table.insert(StoryDisplayNames, s.name) end
    for _, s in ipairs(RaidStages) do table.insert(RaidDisplayNames, s.name) end
    for _, s in ipairs(ExcavationStages) do table.insert(ExcavationDisplayNames, s.name) end
end
if _AO.ModulesLoaded then
    pcall(BuildStageLists)
end

local function GetStagesForMode(mode)
    if mode == "Story" then return StoryDisplayNames
    elseif mode == "Raid" then return RaidDisplayNames
    elseif mode == "Excavation" then return ExcavationDisplayNames end
    return {}
end

local function GetActsForStage(stageId)
    local cfg = stageConfigs[stageId]
    if not cfg or not cfg.acts then return { "1" } end
    local acts = {}
    for actNum, _ in pairs(cfg.acts) do table.insert(acts, tostring(actNum)) end
    table.sort(acts, function(a, b) return tonumber(a) < tonumber(b) end)
    return acts
end

local function GetLegendsActsForStage(stageId)
    local cfg = stageConfigs[stageId]
    if not cfg or not cfg.acts then return { "1" } end
    local acts = {}
    for actNum, actData in pairs(cfg.acts) do
        if type(actData) == "table" and actData.legendRewards then
            table.insert(acts, tostring(actNum))
        end
    end
    table.sort(acts, function(a, b) return tonumber(a) < tonumber(b) end)
    if #acts == 0 then
        return GetActsForStage(stageId)
    end
    return acts
end

local function GetRoomType()
    if _AO.SelectedMode == "Chain of Control" then return "release_001" end
    if _AO.SelectedMode == "Raid" then return "raid_001" end
    if _AO.SelectedMode == "Excavation" then return "excavation_001" end
    return "story_001"
end

local function GetDoorFolder(mode)
    if mode == "Story" or mode == "Legends" then return workspace:FindFirstChild("StoryDoor") end
    if mode == "Raid" then return workspace:FindFirstChild("RaidDoor") end
    if mode == "Excavation" then return workspace:FindFirstChild("ExcavationDoor") end
    return nil
end

local function TeleportAndJoinDoor(mode)
    if not isLobby then return false end
    local doorFolder = GetDoorFolder(mode)
    if not doorFolder then return false end
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    for _, child in pairs(doorFolder:GetChildren()) do
        local door = child:FindFirstChild("Door")
        if door and door:IsA("BasePart") and door:GetAttribute("roomId") then
            local roomId = door:GetAttribute("roomId")
            hrp.CFrame = door.CFrame + Vector3.new(0, 3, 0)
            task.wait(0.3)
            local ok, success, errorMsg = pcall(function() return roomsNet.joinLobby.call(roomId) end)
            if not ok then
                -- pcall error
            elseif success then
                return true
            elseif tostring(errorMsg):find("already") then
                return true
            end
        end
    end
    return false
end

local function DoAutoJoin()
    if not isLobby or not _AO.ModulesLoaded then return end
    if _AO.SelectedMode == "Chain of Control" then
        -- Chain of Control uses a dedicated room join, no door needed
        local ok, success, errorMsg = pcall(function() return roomsNet.joinChainOfControlRoom.call() end)
        if not ok then return end
        if not success and not (tostring(errorMsg or ""):find("already")) then return end
        task.wait(0.5)
        pcall(function() roomsNet.getReady.call() end)
        return
    end
    if not _AO.SelectedStage then return end
    local joined = TeleportAndJoinDoor(_AO.SelectedMode)
    if not joined then return end
    task.wait(0.3)
    pcall(function() roomsNet.selectStage.call(_AO.SelectedStage) end)
    task.wait(0.3)
    pcall(function() roomsNet.selectAct.call(tonumber(_AO.SelectedAct) or 1) end)
    task.wait(0.3)
    pcall(function() roomsNet.selectDifficulty.call(_AO.SelectedDifficulty) end)
    task.wait(0.3)
    pcall(function() roomsNet.queueMatchmaking.call(GetRoomType(), false) end)
    task.wait(0.5)
    pcall(function() roomsNet.getReady.call() end)
end

-- Auto Join Loop (challenge priority handled via _doChallengeJoinIfAvailable, set later)
local _doChallengeJoinIfAvailable = nil -- forward declaration, set after FindMatchingChallenge is defined

task.spawn(function()
    while getgenv()._AORunning do
        if isLobby and _AO.ModulesLoaded then
            -- Challenge priority: if available, do challenges first
            local didChallenge = false
            if _AO.AutoChallengeEnabled and _doChallengeJoinIfAvailable then
                didChallenge = _doChallengeJoinIfAvailable()
            end
            if didChallenge then
                local w = tick()
                while getgenv()._AORunning and (tick() - w < 15) do task.wait(1) end
            elseif _AO.AutoJoinEnabled then
                pcall(DoAutoJoin)
                local w = tick()
                while _AO.AutoJoinEnabled and getgenv()._AORunning and (tick() - w < 15) do task.wait(1) end
            end
        end
        task.wait(2)
    end
end)

-- Quest claim
local function ClaimCompletedQuests()
    if not isLobby or not _AO.ModulesLoaded or not questsNet or not questsConfig then return end
    local ok, state = pcall(function() return clientStore:getState() end)
    if not ok or not state or not state.data or not state.data.quest then return end
    local questSlice = state.data.quest[userId]
    if not questSlice or not questSlice.current then return end
    for questId, qs in pairs(questSlice.current) do
        if type(qs) == "table" and qs.progress then
            local ok2, cfg = pcall(function() return questsConfig.get(questId) end)
            if ok2 and cfg and cfg.target and qs.progress >= cfg.target then
                pcall(function() questsNet.claimQuest.fire(questId) end)
                task.wait(0.1)
            end
        end
    end
end

--- One category: done = track complete, canClaim = server should accept claim now, nextDay = next slot index
local function _aoDailyCategoryProgress(cat, s, now, DAY, drCfg, weekGen)
    local nextDay, canClaim, done
    if drCfg.isGeneratedWeeklyCategory(cat) then
        if not s then
            nextDay, canClaim, done = 1, true, false
        else
            local w0 = weekGen.getWeekStart(now)
            local sameWeek = (w0 == (s.weekSeed or 0))
            local idx = 0
            if sameWeek then
                idx = math.clamp(s.weeklyRewardIndex or 0, 0, 7)
            end
            if sameWeek and (s.weeklyRewardIndex or 0) >= 7 then
                done = true
            elseif sameWeek and idx < 7 then
                nextDay = idx + 1
                local lr = s.lastReedemed
                canClaim = (typeof(lr) ~= "number") or (now - lr >= DAY)
            else
                nextDay = 1
                canClaim = true
            end
        end
    else
        local total = drCfg.getCategoryRewardCount(cat) or 0
        if total <= 0 then
            return true, false, nil
        end
        if not s then
            nextDay, canClaim, done = 1, true, false
        else
            local dc = math.clamp(s.daysClaimed or 0, 0, total)
            if dc >= total then
                done = true
            else
                nextDay = dc + 1
                local lr = s.lastReedemed
                canClaim = (typeof(lr) ~= "number") or (now - lr >= DAY)
            end
        end
    end
    return done == true, canClaim == true, nextDay
end

local function RunAutoClaimDailyRewards()
    if not isLobby or not clientStore or not playerNet or not _AO.ModulesLoaded then return end
    local ok, clock = pcall(function()
        return require(RS:WaitForChild("shared"):WaitForChild("clock"))
    end)
    local ok2, drCfg = pcall(function()
        return require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("dailyRewards"))
    end)
    local ok3, weekGen = pcall(function()
        return require(RS:WaitForChild("shared"):WaitForChild("utils"):WaitForChild("weeklyRewardGenerator"))
    end)
    if not (ok and ok2 and ok3 and clock and drCfg and weekGen) then return end
    local stOk, state = pcall(function() return clientStore:getState() end)
    if not stOk or not state or not state.data or not state.data.daily then return end
    local root = state.data.daily[userId]
    if not root then return end
    local now = clock.now()
    local DAY = clock.DAY
    local categories = drCfg.getActiveCategories()
    if not categories then return end
    for _, cat in ipairs(categories) do
        if type(cat) ~= "string" then continue end
        local s = root[cat]
        local done, canClaim, nextDay = _aoDailyCategoryProgress(cat, s, now, DAY, drCfg, weekGen)
        if not done and canClaim and nextDay then
            dbg("Auto claim daily reward: " .. cat .. " (day " .. tostring(nextDay) .. ")")
            pcall(function() playerNet.claimReward.fire(cat) end)
            task.wait(0.45)
        end
    end
end

--- Daily / event login rewards: timers per category (daily, event1, …) — mirrors lobby UI logic
local function BuildDailyRewardsLobbyLines()
    if not isLobby or not clientStore or not _AO.ModulesLoaded then
        return { isLobby and "Load lobby modules first…" or "Lobby only." }
    end
    local ok, clock = pcall(function()
        return require(RS:WaitForChild("shared"):WaitForChild("clock"))
    end)
    local ok2, drCfg = pcall(function()
        return require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("dailyRewards"))
    end)
    local ok3, weekGen = pcall(function()
        return require(RS:WaitForChild("shared"):WaitForChild("utils"):WaitForChild("weeklyRewardGenerator"))
    end)
    if not (ok and ok2 and ok3 and clock and drCfg and weekGen) then
        return { "Daily rewards: could not load game modules." }
    end
    local stOk, state = pcall(function() return clientStore:getState() end)
    if not stOk or not state or not state.data or not state.data.daily then
        return { "Daily rewards: no store slice." }
    end
    local root = state.data.daily[userId]
    if not root then
        return { "Daily rewards: no player data yet." }
    end
    local now = clock.now()
    local DAY = clock.DAY
    local categories = drCfg.getActiveCategories()
    if not categories or #categories == 0 then
        return { "Daily rewards: no active categories." }
    end
    local lines = {}
    for _, cat in ipairs(categories) do
        local s = root[cat]
        if not drCfg.isGeneratedWeeklyCategory(cat) and (drCfg.getCategoryRewardCount(cat) or 0) <= 0 then
            table.insert(lines, cat .. ": (no rewards in config)")
            continue
        end
        local done, canClaim, nextDay = _aoDailyCategoryProgress(cat, s, now, DAY, drCfg, weekGen)
        if done then
            table.insert(lines, string.format("%s: track finished (wait reset / next week)", cat))
        elseif canClaim and nextDay then
            table.insert(lines, string.format("%s: ready — claim day %d", cat, nextDay))
        elseif nextDay and s and typeof(s.lastReedemed) == "number" then
            local rem = math.max(0, s.lastReedemed + DAY - now)
            table.insert(lines, string.format("%s: next in %s (then day %d)", cat, clock.format.long(rem), nextDay))
        elseif nextDay then
            table.insert(lines, string.format("%s: day %d (check in game)", cat, nextDay))
        else
            table.insert(lines, string.format("%s: —", cat))
        end
    end
    return lines
end

task.spawn(function()
    while getgenv()._AORunning do
        if _AO.AutoClaimQuestsEnabled and isLobby then pcall(ClaimCompletedQuests) end
        if _AO.AutoClaimDailyRewardsEnabled and isLobby then pcall(RunAutoClaimDailyRewards) end
        task.wait(5)
    end
end)

-- Summon helpers
local function GetCurrentFeatured(banner)
    if not isLobby or not clientStore then return {} end
    local ok, state = pcall(function() return clientStore:getState() end)
    if not ok or not state or not state.summon or not state.summon.banners then return {} end
    local f = state.summon.banners.featured
    if not f or not f[banner] then return {} end
    local r = {}
    for _, h in pairs(f[banner]) do table.insert(r, h) end
    return r
end

local function GetBannerChampion()
    if not isLobby or not clientStore then return nil end
    local ok, state = pcall(function() return clientStore:getState() end)
    if not ok or not state or not state.summon or not state.summon.banners then return nil end
    local s = state.summon.banners.secrets
    if s and s.NORMAL and s.NORMAL.prioritizedSecret and s.NORMAL.prioritizedSecret ~= "" then
        return s.NORMAL.prioritizedSecret
    end
    return nil
end

local function GetAllMythicHeroes()
    local heroes = {}
    pcall(function()
        local hr = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("summon"):WaitForChild("heroRarities"))
        if hr and hr.Mythic then for h, _ in pairs(hr.Mythic) do table.insert(heroes, h) end end
    end)
    table.sort(heroes)
    return heroes
end

local function IsFeaturedMatch(banner)
    if not next(_AO.SelectedFeatured) then return true end
    for _, h in ipairs(GetCurrentFeatured(banner)) do
        if _AO.SelectedFeatured[h] then return true end
    end
    return false
end

local function GetSummonCurrency(banner)
    if not isLobby or not clientStore then return 0 end
    local ok, state = pcall(function() return clientStore:getState() end)
    if not ok or not state or not state.data or not state.data.core then return 0 end
    local core = state.data.core[userId]
    if not core then return 0 end
    return banner == "CRIMSON" and (core.bloodiedChains or 0) or (core.crystalShard or 0)
end

-- Summon loop
task.spawn(function()
    while getgenv()._AORunning do
        if _AO.AutoSummonEnabled and isLobby and _AO.ModulesLoaded and summonNet then
            if IsFeaturedMatch(_AO.SummonBanner) then
                local cost = (_AO.SummonBanner == "CRIMSON" and 60 or 50) * _AO.SummonAmount
                if GetSummonCurrency(_AO.SummonBanner) >= cost then
                    pcall(function() summonNet.summonHero.call(_AO.SummonAmount, _AO.SummonBanner) end)
                    task.wait(_AO.SummonDelay)
                else task.wait(3) end
            else task.wait(3) end
        else task.wait(0.5) end
    end
end)

-- ═══════════════════════════════════════════
-- GAME STAGE FEATURES (Macros, Auto)
-- ═══════════════════════════════════════════

-- Macro file I/O
local function SanitizeMacroName(name)
    if type(name) ~= "string" then return "" end
    name = name:match("^%s*(.-)%s*$") or ""
    name = name:gsub('[<>:"/\\|?*]', "")
    return name
end

local function GetMacroFiles()
    if not isfolder(MacroFolder) then return {} end
    local names = {}
    for _, file in ipairs(listfiles(MacroFolder)) do
        local name = file:match("([^/\\]+)%.json$")
        if name then table.insert(names, name) end
    end
    return names
end

local function SaveMacro(name, data)
    name = SanitizeMacroName(name)
    if name == "" then return end
    local lines = {}
    for i, step in ipairs(data) do
        local parts = {}
        for k, v in pairs(step) do
            if type(v) == "table" then
                parts[#parts+1] = '"' .. k .. '": [' .. table.concat(v, ", ") .. ']'
            elseif type(v) == "string" then
                parts[#parts+1] = '"' .. k .. '": "' .. v .. '"'
            else
                parts[#parts+1] = '"' .. k .. '": ' .. tostring(v)
            end
        end
        lines[#lines+1] = "    {" .. table.concat(parts, ", ") .. "}"
    end
    writefile(MacroFolder .. "/" .. name .. ".json", "[\n" .. table.concat(lines, ",\n") .. "\n]")
end

local function EnsureMacroJsonFile(rawName)
    local name = SanitizeMacroName(rawName)
    if name == "" or name == "No Macros" then return end
    if not isfolder(MacroFolder) then makefolder(MacroFolder) end
    local path = MacroFolder .. "/" .. name .. ".json"
    if not isfile(path) then SaveMacro(name, {}) end
end

local function MacroBaseNameFromImportUrl(url)
    if type(url) ~= "string" then return "" end
    -- paste.rs URLs: use "imported_XXXX" since ID is meaningless
    if url:find("paste%.rs/") then
        local id = url:match("paste%.rs/(%w+)")
        return SanitizeMacroName("paste_" .. (id or "import"))
    end
    local noQuery = url:match("^([^%?#]+)") or url
    local file = noQuery:match("([^/\\]+)$") or ""
    file = file:gsub("%.json$", ""):gsub("%.JSON$", "")
    return SanitizeMacroName(file)
end

local function FetchMacroImportUrl(url)
    if type(url) ~= "string" or url == "" then return nil, "empty url" end
    url = url:match("^%s*(%S+)%s*$") or url
    local req = (syn and syn.request) or (http and http.request) or http_request or request
    if req then
        local ok, res = pcall(function()
            return req({ Url = url, Method = "GET", Headers = { ["User-Agent"] = "Mozilla/5.0 ApelHub-MacroImport" } })
        end)
        if ok and type(res) == "table" then
            local code = res.StatusCode or res.statusCode or res.Status
            local body = res.Body or res.body
            if type(body) == "string" and body ~= "" and (code == nil or code == 200 or code == 0) then return body end
        end
    end
    local ok2, body2 = pcall(function() return game:HttpGet(url, true) end)
    if ok2 and type(body2) == "string" and body2 ~= "" then return body2 end
    return nil, "download failed"
end

local function NormalizeImportedMacroTable(t)
    if type(t) ~= "table" then return nil, "not a table" end
    if t[1] ~= nil then return t end
    if type(t.steps) == "table" and t.steps[1] ~= nil then return t.steps end
    if type(t.macro) == "table" and t.macro[1] ~= nil then return t.macro end
    return t
end

local function _macro_normImportLabel(s)
    if type(s) ~= "string" then return "" end
    s = s:gsub("^%s+", ""):gsub("%s+$", ""):gsub("%s+", " ")
    return string.lower(s)
end

local _macroLabelToHeroId = nil
local function _macroEnsureLegacyNameResolver()
    if _macroLabelToHeroId then return _macroLabelToHeroId end
    local byNorm = {}
    pcall(function()
        local folder = RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("items"):WaitForChild("data"):WaitForChild("hero")
        for _, m in pairs(folder:GetChildren()) do
            if m:IsA("ModuleScript") then
                local ok, cfg = pcall(require, m)
                if ok and type(cfg) == "table" and cfg.id then
                    byNorm[_macro_normImportLabel(cfg.id)] = cfg.id
                    if type(cfg.name) == "string" and cfg.name ~= "" then
                        byNorm[_macro_normImportLabel(cfg.name)] = cfg.id
                    end
                    if type(cfg.skins) == "table" then
                        for _, sk in pairs(cfg.skins) do
                            if type(sk) == "table" and sk.id and type(sk.name) == "string" then
                                byNorm[_macro_normImportLabel(sk.name)] = sk.id
                            end
                        end
                    end
                end
            end
        end
    end)
    _macroLabelToHeroId = function(label)
        if type(label) ~= "string" or label == "" then return nil end
        local hid = byNorm[_macro_normImportLabel(label)]
        if hid then return hid end
        local base = label:match("^(.-)%s*%([^%)]+%)%s*$")
        if base and base ~= "" then
            hid = byNorm[_macro_normImportLabel(base)]
            if hid then return hid end
        end
        return nil
    end
    return _macroLabelToHeroId
end

local function _macro_parseLegacyPosString(s)
    if type(s) ~= "string" then return nil end
    local x, y, z = s:match("^%s*([^,]+)%s*,%s*([^,]+)%s*,%s*([^,]+)%s*$")
    x, y, z = tonumber(x), tonumber(y), tonumber(z)
    if not x or not y or not z then return nil end
    return Vector3.new(x, y, z)
end

--- Foreign hub: object map of steps with type/time/unit/pos → Apel array (Action, UnitName=id, UnitIndex, Position, Timestamp).
local function TryConvertLegacyHubMacro(t)
    if type(t) ~= "table" then return nil end
    if t[1] ~= nil and type(t[1]) == "table" and type(t[1].Action) == "string" then
        return nil
    end
    local rows = {}
    for _, v in pairs(t) do
        if type(v) == "table" and type(v.type) == "string" and type(v.time) == "number" then
            table.insert(rows, v)
        end
    end
    if #rows == 0 then return nil end
    table.sort(rows, function(a, b) return a.time < b.time end)

    local resolve = _macroEnsureLegacyNameResolver()
    local out = {}
    local placeCount = 0
    local placed = {} -- { { unitIndex = n, heroId = id, pos = Vector3 } }

    local function findUnitIndexForPos(heroId, pos)
        if not pos then return nil end
        local bestIdx, bestD = nil, 1e9
        for _, pl in ipairs(placed) do
            if pl.heroId == heroId then
                local d = (pl.pos - pos).Magnitude
                if d < bestD then
                    bestD = d
                    bestIdx = pl.unitIndex
                end
            end
        end
        if bestIdx and bestD < 28 then return bestIdx end
        return nil
    end

    local seq = 0
    for _, r in ipairs(rows) do
        local ty = string.lower(tostring(r.type or ""))
        local label = r.unit
        local heroId = type(label) == "string" and resolve(label) or nil
        local pos = _macro_parseLegacyPosString(r.pos)
        local ts = tonumber(r.time) or 0

        if ty == "place" then
            if not heroId or not pos then
                dbg("LegacyMacro: skip Place (unmapped unit or bad pos) unit=" .. tostring(label))
            else
                placeCount = placeCount + 1
                local x, y, z = pos.X, pos.Y, pos.Z
                x = math.floor(x * 100) / 100
                y = math.floor(y * 100) / 100
                z = math.floor(z * 100) / 100
                seq = seq + 1
                table.insert(out, {
                    Action = "Place",
                    UnitName = heroId,
                    UnitIndex = placeCount,
                    Position = { x, y, z },
                    Timestamp = ts,
                    Seq = seq,
                })
                table.insert(placed, { unitIndex = placeCount, heroId = heroId, pos = Vector3.new(x, y, z) })
            end
        elseif ty == "upgrade" or ty == "autoupgrade" then
            if not heroId then
                dbg("LegacyMacro: skip " .. ty .. " (unmapped unit) label=" .. tostring(label))
            else
                local uidx = findUnitIndexForPos(heroId, pos)
                if not uidx then
                    dbg("LegacyMacro: skip " .. ty .. " (no tower match) " .. tostring(heroId))
                else
                    seq = seq + 1
                    table.insert(out, {
                        Action = ty == "autoupgrade" and "AutoUpgrade" or "Upgrade",
                        UnitIndex = uidx,
                        Timestamp = ts,
                        Seq = seq,
                    })
                end
            end
        end
    end

    if #out == 0 then return nil end
    dbg("LegacyMacro: converted " .. #out .. " steps from foreign format")
    return out
end

local function ResolveImportedMacroSteps(decoded)
    if type(decoded) ~= "table" then return nil, "not a table" end
    local leg = TryConvertLegacyHubMacro(decoded)
    if leg then return leg, "legacy" end
    local norm, err = NormalizeImportedMacroTable(decoded)
    if not norm then return nil, err end
    leg = TryConvertLegacyHubMacro(norm)
    if leg then return leg, "legacy" end
    return norm
end

local function LoadMacro(name)
    name = SanitizeMacroName(name or "")
    if name == "" then return {} end
    local path = MacroFolder .. "/" .. name .. ".json"
    if not isfile(path) then return {} end
    local ok, data = pcall(function() return HttpService:JSONDecode(readfile(path)) end)
    if not ok or type(data) ~= "table" then return {} end
    local leg = TryConvertLegacyHubMacro(data)
    if leg then return leg end
    return data
end

local function ValidateMacroImportDecoded(t)
    if type(t) ~= "table" then return false, "not a JSON object/array" end
    for i, step in ipairs(t) do
        if type(step) ~= "table" then return false, "step #" .. tostring(i) .. " must be an object" end
    end
    return true
end

_AO.StopRecordingAndSave = nil -- forward declaration

-- Hook recording (Game Stage only)
_AO.origPlaceCall = nil
_AO.origUpgradeCall = nil
_AO.origSellCall = nil
_AO.origUltFire = nil

-- Luraph macro shims for non-obfuscated runs
if not LPH_OBFUSCATED then
    LPH_NO_VIRTUALIZE = function(f) return f end
end

-- ── Recording helpers (shared by LPH and non-LPH branches) ──
_AO._pendingPlaces = {} -- queue of {unitIndex, position, time}
_AO._macroSeq = 0

local function recordStep(step)
    _AO._macroSeq = _AO._macroSeq + 1
    step.Seq = _AO._macroSeq
    table.insert(_AO.CurrentMacro, step)
end

-- Scan state for new towers and map them to pending Place steps
local function tryMapNewTowers()
    if not gameClientStore then return end
    local ok, state = pcall(function() return gameClientStore:getState() end)
    if not ok or not state or not state.towers or not state.towers.towers then return end
    for uniqueId, tower in pairs(state.towers.towers) do
        if tower.owner == userId and not _AO.RecordedEntityMap[uniqueId] then
            -- Try to match by position from pending queue
            local matched = false
            for i, pending in ipairs(_AO._pendingPlaces) do
                local tpos = tower.cframe and tower.cframe.Position
                if tpos and pending.position then
                    local dist = (tpos - pending.position).Magnitude
                    if dist < 2 then -- within 2 studs tolerance
                        _AO.RecordedEntityMap[uniqueId] = pending.unitIndex
                        table.remove(_AO._pendingPlaces, i)
                        dbg("Map: uid=" .. tostring(uniqueId) .. " → idx=" .. pending.unitIndex .. " (pos match, dist=" .. string.format("%.1f", dist) .. ")")
                        matched = true
                        break
                    end
                end
            end
            -- Fallback: FIFO order if position match failed
            if not matched and #_AO._pendingPlaces > 0 then
                local pending = table.remove(_AO._pendingPlaces, 1)
                _AO.RecordedEntityMap[uniqueId] = pending.unitIndex
                dbg("Map: uid=" .. tostring(uniqueId) .. " → idx=" .. pending.unitIndex .. " (FIFO fallback)")
            end
        end
    end
end

-- Record upgrade/sell/ult with retry if mapping not ready yet
local function deferredRecord(uniqueId, action, extraFields)
    local function tryRecord()
        local unitIndex = _AO.RecordedEntityMap[uniqueId]
        if unitIndex then
            local step = { Action = action, UnitIndex = unitIndex, Timestamp = tick() }
            if extraFields then
                for k, v in pairs(extraFields) do step[k] = v end
            end
            recordStep(step)
            dbg("Hook: " .. action .. " recorded idx=" .. unitIndex)
            return true
        end
        return false
    end

    if tryRecord() then return end

    -- Not mapped yet — try mapping then retry over a few frames
    dbg("Hook: " .. action .. " deferred (uid " .. tostring(uniqueId) .. " not mapped yet)")
    task.spawn(function()
        for attempt = 1, 10 do
            tryMapNewTowers()
            if tryRecord() then
                dbg("Hook: " .. action .. " deferred SUCCESS after " .. attempt .. " attempts")
                return
            end
            task.wait(0.05)
        end
        dbg("Hook: " .. action .. " LOST — uid " .. tostring(uniqueId) .. " never mapped (10 attempts)")
    end)
end

-- Place hook body (shared logic)
local function onPlaceRecorded(heroUuid, cframe)
    local heroName = GetHeroNameByUUID(heroUuid)
    local unitCount = 0
    for _, s in ipairs(_AO.CurrentMacro) do
        if s.Action == "Place" then unitCount = unitCount + 1 end
    end
    local unitIndex = unitCount + 1
    local pos = cframe.Position
    recordStep({
        Action = "Place",
        UnitName = heroName,
        UnitIndex = unitIndex,
        Position = {
            math.floor(pos.X * 100) / 100,
            math.floor(pos.Y * 100) / 100,
            math.floor(pos.Z * 100) / 100
        },
        Timestamp = tick()
    })
    -- Queue for immediate mapping
    table.insert(_AO._pendingPlaces, {
        unitIndex = unitIndex,
        position = pos,
        time = tick()
    })
    -- Try to map on next frame
    task.defer(function()
        tryMapNewTowers()
    end)
    dbg("Hook: Place recorded idx=" .. unitIndex .. " hero=" .. heroName .. " (pending map)")
end

local SetupRecordingHooks
if LPH_OBFUSCATED then
    LPH_NO_VIRTUALIZE(function()
        SetupRecordingHooks = function()
            if isLobby or not _AO.ModulesLoaded then
                dbg("Hooks skipped: isLobby=" .. tostring(isLobby) .. " loaded=" .. tostring(_AO.ModulesLoaded))
                return
            end
            local ok1, err1 = pcall(function()
                _AO.origPlaceCall = hookfunction(syncNet.clientTowerPlacement.call, function(heroUuid, cframe)
                    local result = _AO.origPlaceCall(heroUuid, cframe)
                    if _AO.IsRecording and result then
                        onPlaceRecorded(heroUuid, cframe)
                    end
                    return result
                end)
            end)
            dbg("Hook Place: " .. (ok1 and "OK" or ("FAIL: " .. tostring(err1))))
            local ok2, err2 = pcall(function()
                _AO.origUpgradeCall = hookfunction(towersNet.upgradeUnit.call, function(uniqueId)
                    local result = _AO.origUpgradeCall(uniqueId)
                    if _AO.IsRecording and result then
                        deferredRecord(uniqueId, "Upgrade")
                    end
                    return result
                end)
            end)
            dbg("Hook Upgrade: " .. (ok2 and "OK" or ("FAIL: " .. tostring(err2))))
            local ok3, err3 = pcall(function()
                _AO.origSellCall = hookfunction(towersNet.sellUnit.call, function(uniqueId)
                    local result = _AO.origSellCall(uniqueId)
                    if _AO.IsRecording and result then
                        deferredRecord(uniqueId, "Sell")
                    end
                    return result
                end)
            end)
            dbg("Hook Sell: " .. (ok3 and "OK" or ("FAIL: " .. tostring(err3))))
            local okPrio, errPrio = pcall(function()
                _AO.origChangeUpgradePriorityCall = hookfunction(towersNet.changeUpgradePriority.call, function(towerUid)
                    local success, errMsg = _AO.origChangeUpgradePriorityCall(towerUid)
                    if _AO.IsRecording and success and not _AO._macroSuppressPrioHook then
                        deferredRecord(towerUid, "AutoUpgrade")
                    end
                    return success, errMsg
                end)
            end)
            dbg("Hook changeUpgradePriority: " .. (okPrio and "OK" or ("FAIL: " .. tostring(errPrio))))
            local ok4, err4 = pcall(function()
                _AO.origUltFire = hookfunction(syncNet.clientUltimate.fire, function(uniqueId, slot)
                    if _AO.IsRecording then
                        deferredRecord(uniqueId, "Ultimate", { Slot = slot })
                    end
                    return _AO.origUltFire(uniqueId, slot)
                end)
            end)
            dbg("Hook Ult: " .. (ok4 and "OK" or ("FAIL: " .. tostring(err4))))
            dbg("All hooks done! origPlaceCall=" .. tostring(_AO.origPlaceCall))
        end
    end)()
else
    SetupRecordingHooks = function()
    if isLobby or not _AO.ModulesLoaded then
        dbg("Hooks skipped: isLobby=" .. tostring(isLobby) .. " loaded=" .. tostring(_AO.ModulesLoaded))
        return
    end

    local ok1, err1 = pcall(function()
        _AO.origPlaceCall = hookfunction(syncNet.clientTowerPlacement.call, function(heroUuid, cframe)
            local result = _AO.origPlaceCall(heroUuid, cframe)
            if _AO.IsRecording and result then
                onPlaceRecorded(heroUuid, cframe)
            end
            return result
        end)
    end)
    dbg("Hook Place: " .. (ok1 and "OK" or ("FAIL: " .. tostring(err1))))

    local ok2, err2 = pcall(function()
        _AO.origUpgradeCall = hookfunction(towersNet.upgradeUnit.call, function(uniqueId)
            local result = _AO.origUpgradeCall(uniqueId)
            if _AO.IsRecording and result then
                deferredRecord(uniqueId, "Upgrade")
            end
            return result
        end)
    end)
    dbg("Hook Upgrade: " .. (ok2 and "OK" or ("FAIL: " .. tostring(err2))))

    local ok3, err3 = pcall(function()
        _AO.origSellCall = hookfunction(towersNet.sellUnit.call, function(uniqueId)
            local result = _AO.origSellCall(uniqueId)
            if _AO.IsRecording and result then
                deferredRecord(uniqueId, "Sell")
            end
            return result
        end)
    end)
    dbg("Hook Sell: " .. (ok3 and "OK" or ("FAIL: " .. tostring(err3))))

    local okPrio, errPrio = pcall(function()
        _AO.origChangeUpgradePriorityCall = hookfunction(towersNet.changeUpgradePriority.call, function(towerUid)
            local success, errMsg = _AO.origChangeUpgradePriorityCall(towerUid)
            if _AO.IsRecording and success and not _AO._macroSuppressPrioHook then
                deferredRecord(towerUid, "AutoUpgrade")
            end
            return success, errMsg
        end)
    end)
    dbg("Hook changeUpgradePriority: " .. (okPrio and "OK" or ("FAIL: " .. tostring(errPrio))))

    local ok4, err4 = pcall(function()
        _AO.origUltFire = hookfunction(syncNet.clientUltimate.fire, function(uniqueId, slot)
            if _AO.IsRecording then
                deferredRecord(uniqueId, "Ultimate", { Slot = slot })
            end
            return _AO.origUltFire(uniqueId, slot)
        end)
    end)
    dbg("Hook Ult: " .. (ok4 and "OK" or ("FAIL: " .. tostring(err4))))
    dbg("All hooks done! origPlaceCall=" .. tostring(_AO.origPlaceCall))

    end
end

-- Backup tower tracker (catches anything the immediate mapping missed)
local function TrackNewTowers()
    task.spawn(function()
        while getgenv()._AORunning and _AO.IsRecording do
            pcall(tryMapNewTowers)
            task.wait(0.15)
        end
    end)
end

-- Match state (must be before PlayMacro so closure can see it)
_AO.MatchEnded = false

-- Playback
local function PlayMacro()
    if #_AO.CurrentMacro == 0 or not _AO.ModulesLoaded then
        dbg("PlayMacro skipped: steps=" .. #_AO.CurrentMacro .. " loaded=" .. tostring(_AO.ModulesLoaded))
        return
    end
    local allowed, reason, missing = CanPlayMacro(_AO.CurrentMacro)
    if not allowed then
        dbg("PlayMacro blocked: " .. tostring(reason))
        return
    end
    _AO.IsPlaying = true
    _AO.LiveUnitsMap = {}
    dbg("PlayMacro starting: " .. #_AO.CurrentMacro .. " steps, speed=" .. tostring(_AO.MacroSpeed) .. " premium=" .. tostring(IsPremium()))
    Notify("Playing macro: " .. _AO.SelectedMacroName .. " (" .. #_AO.CurrentMacro .. " steps)")

    table.sort(_AO.CurrentMacro, function(a, b)
        local ta = a.Timestamp or a.time or 0
        local tb = b.Timestamp or b.time or 0
        if ta ~= tb then return ta < tb end
        return (a.Seq or 0) < (b.Seq or 0)
    end)

    local startTime = tick()
    local firstTime = _AO.CurrentMacro[1].Timestamp or _AO.CurrentMacro[1].time or 0
    local stepNum = 0

    local shouldStopLogged = false
    local function shouldStop()
        local s = not _AO.IsPlaying or not getgenv()._AORunning or _AO.MatchEnded
        if s and not shouldStopLogged then
            shouldStopLogged = true
            dbg("shouldStop=true: IsPlaying=" .. tostring(_AO.IsPlaying) .. " _AORunning=" .. tostring(getgenv()._AORunning) .. " MatchEnded=" .. tostring(_AO.MatchEnded))
        end
        return s
    end

    for _, step in ipairs(_AO.CurrentMacro) do
        if shouldStop() then dbg("PlayMacro stopped at step " .. stepNum .. " (shouldStop)") break end
        stepNum = stepNum + 1

        -- Timing
        if _AO.MacroSpeed == 1 then
            local stepT = step.Timestamp or step.time or firstTime
            local diff = stepT - firstTime
            local waitUntil = startTime + diff
            while tick() < waitUntil do
                if shouldStop() then break end
                task.wait(0.1)
            end
        else
            task.wait(0.15)
        end

        if shouldStop() then dbg("PlayMacro stopped at step " .. stepNum .. " after wait") break end

        if step.Action == "Place" then
            local heroUuid = GetHeroUUIDByName(step.UnitName)
            dbg("Step " .. stepNum .. ": Place " .. tostring(step.UnitName) .. " uuid=" .. tostring(heroUuid))
            if heroUuid then
                local pos = Vector3.new(step.Position[1], step.Position[2], step.Position[3])
                local cf = CFrame.new(pos)

                local placed = false
                local retries = 0
                while not placed and not shouldStop() do
                    local callDone = false
                    local callOk, callResult = false, false
                    task.spawn(function()
                        callOk, callResult = pcall(function()
                            return syncNet.clientTowerPlacement.call(heroUuid, cf)
                        end)
                        callDone = true
                    end)
                    -- Wait for call to finish OR match to end
                    while not callDone and not shouldStop() do
                        task.wait(0.1)
                    end
                    retries = retries + 1
                    if callOk and callResult then
                        placed = true
                        dbg("Step " .. stepNum .. ": Place SUCCESS after " .. retries .. " tries")
                    else
                        if shouldStop() then break end
                        if retries % 10 == 0 then
                            dbg("Step " .. stepNum .. ": Place retry #" .. retries .. " ok=" .. tostring(callOk) .. " success=" .. tostring(callResult))
                        end
                        task.wait(1)
                    end
                end

                -- Track the new tower's uniqueId
                if placed then
                    task.wait(0.5)
                    pcall(function()
                        local state = gameClientStore:getState()
                        if state and state.towers and state.towers.towers then
                            for uid, tower in pairs(state.towers.towers) do
                                if tower.owner == userId then
                                    local alreadyTracked = false
                                    for _, existingUid in pairs(_AO.LiveUnitsMap) do
                                        if existingUid == uid then
                                            alreadyTracked = true
                                            break
                                        end
                                    end
                                    if not alreadyTracked then
                                        _AO.LiveUnitsMap[step.UnitIndex] = uid
                                        dbg("Step " .. stepNum .. ": Tracked tower idx=" .. step.UnitIndex .. " uid=" .. tostring(uid))
                                        break
                                    end
                                end
                            end
                        end
                    end)
                end
            else
                dbg("Step " .. stepNum .. ": Place SKIP - no UUID for " .. tostring(step.UnitName))
            end

        elseif step.Action == "Upgrade" then
            local uid = _AO.LiveUnitsMap[step.UnitIndex]
            dbg("Step " .. stepNum .. ": Upgrade idx=" .. tostring(step.UnitIndex) .. " uid=" .. tostring(uid))
            if uid then
                local upgraded = false
                local retries = 0
                while not upgraded and not shouldStop() do
                    local callDone = false
                    local callOk, callResult = false, false
                    task.spawn(function()
                        callOk, callResult = pcall(function()
                            return towersNet.upgradeUnit.call(uid)
                        end)
                        callDone = true
                    end)
                    while not callDone and not shouldStop() do
                        task.wait(0.1)
                    end
                    if shouldStop() then
                        dbg("Step " .. stepNum .. ": Upgrade ABORTED by shouldStop after " .. retries .. " tries, MatchEnded=" .. tostring(_AO.MatchEnded))
                        break
                    end
                    retries = retries + 1
                    if callOk and callResult then
                        upgraded = true
                        dbg("Step " .. stepNum .. ": Upgrade SUCCESS after " .. retries .. " tries")
                    else
                        if retries % 10 == 0 then
                            dbg("Step " .. stepNum .. ": Upgrade retry #" .. retries .. " MatchEnded=" .. tostring(_AO.MatchEnded) .. " IsPlaying=" .. tostring(_AO.IsPlaying) .. " callDone=" .. tostring(callDone))
                        end
                        task.wait(1)
                    end
                end
            end

        elseif step.Action == "AutoUpgrade" then
            local uid = _AO.LiveUnitsMap[step.UnitIndex]
            dbg("Step " .. stepNum .. ": AutoUpgrade idx=" .. tostring(step.UnitIndex) .. " uid=" .. tostring(uid))
            if uid then
                local changed = false
                local retries = 0
                while not changed and not shouldStop() do
                    local callDone = false
                    local callOk, callResult = false, false
                    task.spawn(function()
                        callOk, callResult = pcall(function()
                            return towersNet.changeUpgradePriority.call(uid)
                        end)
                        callDone = true
                    end)
                    while not callDone and not shouldStop() do
                        task.wait(0.1)
                    end
                    if shouldStop() then
                        dbg("Step " .. stepNum .. ": AutoUpgrade ABORTED by shouldStop after " .. retries .. " tries")
                        break
                    end
                    retries = retries + 1
                    if callOk and callResult then
                        changed = true
                        dbg("Step " .. stepNum .. ": AutoUpgrade SUCCESS after " .. retries .. " tries")
                    else
                        if retries % 10 == 0 then
                            dbg("Step " .. stepNum .. ": AutoUpgrade retry #" .. retries .. " ok=" .. tostring(callOk) .. " res=" .. tostring(callResult))
                        end
                        task.wait(0.5)
                    end
                end
            end

        elseif step.Action == "Sell" then
            local uid = _AO.LiveUnitsMap[step.UnitIndex]
            dbg("Step " .. stepNum .. ": Sell idx=" .. tostring(step.UnitIndex) .. " uid=" .. tostring(uid))
            if uid then
                local sold = false
                while not sold and not shouldStop() do
                    local callDone = false
                    local callOk, callResult = false, false
                    task.spawn(function()
                        callOk, callResult = pcall(function()
                            return towersNet.sellUnit.call(uid)
                        end)
                        callDone = true
                    end)
                    while not callDone and not shouldStop() do
                        task.wait(0.1)
                    end
                    if callOk and callResult then
                        sold = true
                        _AO.LiveUnitsMap[step.UnitIndex] = nil
                        dbg("Step " .. stepNum .. ": Sell SUCCESS")
                    else
                        if shouldStop() then break end
                        task.wait(0.5)
                    end
                end
            end

        elseif step.Action == "Ultimate" then
            local uid = _AO.LiveUnitsMap[step.UnitIndex]
            local slot = step.Slot or 1
            dbg("Step " .. stepNum .. ": Ultimate idx=" .. tostring(step.UnitIndex) .. " slot=" .. tostring(slot) .. " uid=" .. tostring(uid))
            if uid then
                local fired = false
                local retries = 0
                local MAX_ULT_RETRIES = 60 -- 30 seconds at 0.5s interval

                -- Get lastUsedAt before firing to detect change
                local beforeLastUsed = _AO._getUltLastUsedAt and _AO._getUltLastUsedAt(uid)
                local canTrack = (beforeLastUsed ~= nil) -- if nil, can't track → fire once

                while not fired and not shouldStop() and retries < MAX_ULT_RETRIES do
                    retries = retries + 1
                    pcall(function() syncNet.clientUltimate.fire(uid, slot) end)

                    if not canTrack then
                        -- Can't track (AutoUlt not loaded or tower not found), fire once and move on
                        fired = true
                        break
                    end

                    task.wait(0.5)

                    -- Check if lastUsedAt changed (ult was accepted by server)
                    local afterLastUsed = _AO._getUltLastUsedAt(uid)
                    if afterLastUsed and afterLastUsed ~= beforeLastUsed then
                        fired = true
                    end

                    if not fired and retries % 10 == 0 then
                        dbg("Step " .. stepNum .. ": Ultimate retry #" .. retries .. " uid=" .. tostring(uid))
                    end
                end
                if fired then
                    dbg("Step " .. stepNum .. ": Ultimate FIRED after " .. retries .. " tries")
                else
                    dbg("Step " .. stepNum .. ": Ultimate TIMEOUT after " .. retries .. " tries")
                end
            end
        end
    end

    dbg("PlayMacro finished: completed " .. stepNum .. "/" .. #_AO.CurrentMacro .. " steps, MatchEnded=" .. tostring(_AO.MatchEnded))
    _AO.IsPlaying = false
    if not _AO.MatchEnded then
        Notify("Macro playback finished")
    end
end

-- Match end detection
local function IsMatchEnded()
    if isLobby or not gameClientStore then return false end
    local ok, state = pcall(function() return gameClientStore:getState() end)
    if not ok or not state or not state.gamemode or not state.gamemode.round then return false end
    return state.gamemode.round.state == "Ended"
end

-- Webhook
_AO.WebhookURL = ""
_AO.WebhookEnabled = false
_AO.WebhookEquippedTeamEnabled = false -- list equipped units before Rewards in Discord
_AO.LastMatchData = nil -- filled by matchEnd.on hook
-- Which lines appear under "Currencies" in Discord (MacLib multi-select syncs this table)
_AO.WebhookCurrenciesShown = {
    gold = true,
    crystals = true,
    tokens = true,
    chains = true,
    grimoires = true,
    systemFragments = true,
    crystallineShells = true,
}

local WEBHOOK_CURRENCY_ROW_DEFS = {
    { key = "gold", label = "Gold", kind = "core", field = "gold" },
    { key = "crystals", label = "Crystals", kind = "core", field = "crystalShard" },
    { key = "tokens", label = "Tokens", kind = "core", field = "token" },
    { key = "chains", label = "Bloodied Chains", kind = "core", field = "bloodiedChains" },
    { key = "grimoires", label = "Grimoires", kind = "raid", raidId = "magicLibrary" },
    { key = "systemFragments", label = "System Fragments", kind = "raid", raidId = "doubleDungeon" },
    { key = "crystallineShells", label = "Crystalline Shells", kind = "raid", raidId = "fishmanIsland" },
}

-- Sum all collection slots per item id (stacks split across uuids)
local function SumCollectionByItemId(state)
    local byId = {}
    if not state or type(state.data) ~= "table" or not state.data.collection then return byId end
    local col = state.data.collection[userId]
    if type(col) ~= "table" then return byId end
    for _, entry in pairs(col) do
        if type(entry) == "table" and entry.id then
            local id = tostring(entry.id)
            local n = tonumber(entry.amount) or 1
            byId[id] = (byId[id] or 0) + n
        end
    end
    return byId
end

-- Raid shop currencies (Grimoires, etc.) live in data.raids[userId][currencyItemId]
local function SumRaidCurrencyByItemId(state)
    local byId = {}
    if not state or type(state.data) ~= "table" or not state.data.raids then return byId end
    local r = state.data.raids[userId]
    if type(r) ~= "table" then return byId end
    for cid, amt in pairs(r) do
        byId[tostring(cid)] = tonumber(amt) or 0
    end
    return byId
end

local function TotalHeldForRewardItem(itemKey, collectionById, core, raidById)
    if not itemKey or itemKey == "" then return nil end
    itemKey = tostring(itemKey)
    if itemKey == "Unknown" then return nil end
    if collectionById[itemKey] ~= nil then
        return collectionById[itemKey]
    end
    if type(core) == "table" and core[itemKey] ~= nil then
        return tonumber(core[itemKey]) or 0
    end
    if type(raidById) == "table" and raidById[itemKey] ~= nil then
        return tonumber(raidById[itemKey]) or 0
    end
    return nil
end

local function GetStageDisplayName(stageId)
    if stageId == nil or stageId == "?" then return "?" end
    local idStr = tostring(stageId)
    local cfg = stageConfigs[idStr]
    if type(cfg) == "table" and type(cfg.name) == "string" and cfg.name ~= "" then
        return cfg.name
    end
    return idStr
end

-- Readable label when config require() fails (camelCase / snake ids → title case)
local function PrettifyConfigId(id)
    if type(id) ~= "string" or id == "" then
        return tostring(id)
    end
    local spaced = id:gsub("(%l)(%u)", "%1 %2"):gsub("(%d)(%a)", "%1 %2")
    spaced = spaced:gsub("_", " ")
    return spaced:gsub("(%a)([%w'-]*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

local itemsConfigCache
local function GetItemsConfig()
    if itemsConfigCache ~= nil then
        return itemsConfigCache ~= false and itemsConfigCache or nil
    end
    local ok, m = pcall(function()
        return require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("items"))
    end)
    itemsConfigCache = ok and m or false
    return ok and m or nil
end

local function GetRewardItemDisplayName(idKey, nameKey, fallbackLine)
    local items = GetItemsConfig()
    local getter = items and items.any and type(items.any.get) == "function" and items.any.get
    for _, k in ipairs({ idKey, nameKey, fallbackLine }) do
        if k ~= nil and k ~= "" and tostring(k) ~= "Unknown" and getter then
            local def = getter(tostring(k))
            if type(def) == "table" and type(def.name) == "string" and def.name ~= "" then
                return def.name
            end
        end
    end
    if fallbackLine and fallbackLine ~= "" then return tostring(fallbackLine) end
    if nameKey and nameKey ~= "" then return tostring(nameKey) end
    if idKey and idKey ~= "" then return tostring(idKey) end
    return "Unknown"
end

local WEBHOOK_EQUIP_MAX_CHARS = 980

local function BuildWebhookEquippedTeamText(store, userIdStr)
    if not store or type(userIdStr) ~= "string" then return "" end
    local itemsMod = GetItemsConfig()
    if not itemsMod or not itemsMod.hero or type(itemsMod.hero.get) ~= "function" then return "" end
    local gameDataMod = nil
    pcall(function()
        gameDataMod = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("gameData"))
    end)
    if not gameDataMod or type(gameDataMod.getLevelFromExperience) ~= "function" then return "" end

    local ok, state = pcall(function()
        return store:getState()
    end)
    if not ok or not state or not state.data or not state.data.heroes then return "" end
    local heroes = state.data.heroes[userIdStr]
    if type(heroes) ~= "table" then return "" end

    local worthTable = gameDataMod.constants and gameDataMod.constants.WORTHINESS
    local rows = {}
    for _, hero in pairs(heroes) do
        if type(hero) == "table" and hero.id and type(hero.equipped) == "number" and hero.equipped > 0 then
            local cfg = itemsMod.hero.get(hero.id)
            local rarity = (cfg and cfg.rarity) or "Rare"
            local maxW = 1000
            if type(worthTable) == "table" and worthTable[rarity] then
                maxW = tonumber(worthTable[rarity]) or maxW
            end
            local curW = math.max(0, (hero.takeDowns or 0) - (hero.lastWorthinessReset or 0))
            local lvl = 1
            pcall(function()
                lvl = gameDataMod.getLevelFromExperience(hero.totalExperience or 0, "hero")
            end)
            local displayName = (cfg and type(cfg.name) == "string" and cfg.name ~= "") and cfg.name or tostring(hero.id)
            table.insert(rows, {
                slot = hero.equipped,
                displayName = displayName,
                level = lvl,
                shiny = hero.shiny == true,
                curW = curW,
                maxW = maxW,
            })
        end
    end
    if #rows == 0 then return "" end
    table.sort(rows, function(a, b)
        return a.slot < b.slot
    end)
    local lines = {}
    for _, r in ipairs(rows) do
        local shinyPart = r.shiny and "[Shiny] " or ""
        table.insert(
            lines,
            string.format("[%d] %s%s lvl %d [%d/%d]", r.slot, shinyPart, r.displayName, r.level, r.curW, r.maxW)
        )
    end
    local text = table.concat(lines, "\n")
    if #text > WEBHOOK_EQUIP_MAX_CHARS then
        text = text:sub(1, WEBHOOK_EQUIP_MAX_CHARS - 3) .. "..."
    end
    return text
end

local function SendWebhook(won, rewardsData, heroesExp, finalTime)
    if not _AO.WebhookEnabled or _AO.WebhookURL == "" then return end

    pcall(function()
        local req = (syn and syn.request) or (http and http.request) or http_request or request
        if not req then return end

        -- Match info
        local stage, act, difficulty, waves = "?", 0, "?", "?"
        pcall(function()
            local state = gameClientStore:getState()
            local round = state.gamemode.round
            stage = round.stage or "?"
            act = round.act or 0
            difficulty = round.difficulty or "?"
            waves = tostring(state.wave.waveNumber or 0) .. "/" .. tostring(round.maxWave or 0)
        end)
        local stageLabel = GetStageDisplayName(stage)

        local embedColor = won and 65280 or 16711680
        local resultText = won and "🏆 Victory" or "💀 Defeat"

        -- Format time
        local timeText = "N/A"
        if finalTime then
            local mins = math.floor(finalTime / 60)
            local secs = math.floor(finalTime % 60)
            timeText = string.format("%02d:%02d", mins, secs)
        end

        -- Rewards (+ total held per item: collection, core, or raid currency slice)
        local rewardsText = ""
        local collectionById, coreTbl, raidById = {}, nil, {}
        pcall(function()
            local state = gameClientStore:getState()
            if state and state.data then
                collectionById = SumCollectionByItemId(state)
                raidById = SumRaidCurrencyByItemId(state)
                if state.data.core then
                    coreTbl = state.data.core[userId]
                end
            end
        end)
        if type(rewardsData) == "table" then
            for _, r in ipairs(rewardsData) do
                local name = r.id or r.name or "Unknown"
                local amount = r.amount or r.quantity or 1
                local label = GetRewardItemDisplayName(r.id, r.name, name)
                local totalHeld = nil
                if r.id then totalHeld = TotalHeldForRewardItem(tostring(r.id), collectionById, coreTbl, raidById) end
                if totalHeld == nil and r.name then totalHeld = TotalHeldForRewardItem(tostring(r.name), collectionById, coreTbl, raidById) end
                if totalHeld == nil then totalHeld = TotalHeldForRewardItem(tostring(name), collectionById, coreTbl, raidById) end
                if totalHeld ~= nil then
                    rewardsText = rewardsText .. string.format("+%s %s (%d)\n", tostring(amount), label, math.floor(totalHeld + 0.5))
                else
                    rewardsText = rewardsText .. string.format("+%s %s\n", tostring(amount), label)
                end
            end
        end
        if rewardsText == "" then rewardsText = "None" end

        local equipUnitsText = ""
        if _AO.WebhookEquippedTeamEnabled and gameClientStore then
            pcall(function()
                equipUnitsText = BuildWebhookEquippedTeamText(gameClientStore, userId)
            end)
        end

        -- Currencies (subset chosen in Auto → Webhook)
        local currText = ""
        pcall(function()
            local state = gameClientStore:getState()
            if not state or not state.data then return end
            local core = state.data.core and state.data.core[userId]
            if type(core) ~= "table" then core = {} end

            local selRaid = nil
            pcall(function()
                selRaid = require(
                    RS:WaitForChild("shared")
                        :WaitForChild("store")
                        :WaitForChild("slices")
                        :WaitForChild("data")
                        :WaitForChild("selectors")
                        :WaitForChild("raids")
                        :WaitForChild("selectPlayerRaidCurrency")
                )
            end)

            local shown = _AO.WebhookCurrenciesShown
            local function rowEnabled(key)
                if type(shown) ~= "table" then return true end
                local v = shown[key]
                if v == nil then return true end
                return v == true
            end

            for _, row in ipairs(WEBHOOK_CURRENCY_ROW_DEFS) do
                if rowEnabled(row.key) then
                    if row.kind == "core" and row.field then
                        currText = currText .. string.format("**%s:** %s\n", row.label, tostring(core[row.field] or 0))
                    elseif row.kind == "raid" and row.raidId and selRaid then
                        local amt = 0
                        local okSel, v = pcall(function()
                            return gameClientStore:getState(selRaid(nil, row.raidId))
                        end)
                        if okSel and v ~= nil then
                            amt = tonumber(v) or 0
                        end
                        currText = currText .. string.format("**%s:** %s\n", row.label, tostring(amt))
                    end
                end
            end
        end)
        if currText == "" then currText = "N/A" end

        local embedFields = {
            { name = "Player",     value = "||" .. LocalPlayer.Name .. "||", inline = true },
            { name = "Result",     value = resultText,                        inline = true },
            { name = "Duration",   value = "⏱️ " .. timeText,                inline = true },
            { name = "Stage",      value = stageLabel .. " Act " .. tostring(act) .. " (" .. difficulty .. ")", inline = true },
            { name = "Waves",      value = waves,                             inline = true },
            { name = "\u{200b}",   value = "\u{200b}",                       inline = true },
        }
        if _AO.WebhookEquippedTeamEnabled then
            table.insert(embedFields, {
                name = "Equip units",
                value = (equipUnitsText ~= "" and equipUnitsText) or "None",
                inline = false,
            })
        end
        table.insert(embedFields, { name = "Rewards",    value = rewardsText, inline = false })
        table.insert(embedFields, { name = "Currencies", value = currText,    inline = false })

        local payload = HttpService:JSONEncode({
            username = "Apel Hub Webhook",
            embeds = {
                {
                    title = "Anime Overload — Match Result",
                    color = embedColor,
                    fields = embedFields,
                    footer = { text = "Apel Hub • " .. os.date("%Y-%m-%d %H:%M:%S") }
                }
            }
        })

        req({
            Url = _AO.WebhookURL,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = payload
        })
    end)
end

-- Auto Return to Lobby
_AO.AutoReturnLobby = false

-- Post-match vote: только режим challenge/challenges → лобби (если тоггл в Challenges).
-- Story / Raid / Legends и т.д. никогда не трогаем здесь — только Auto (Return / Next / Replay).
local function _aoGetRoundGamemode()
    local gm = nil
    pcall(function()
        if not gameClientStore then return end
        local st = gameClientStore:getState()
        gm = st and st.gamemode and st.gamemode.round and st.gamemode.round.gamemode
    end)
    return gm
end

local function _aoIsRoundChallengeGamemode()
    local g = _aoGetRoundGamemode()
    if g == nil then return false end
    local s = tostring(g):lower()
    -- в клиенте встречается и "challenge", и "challenges"
    return s == "challenge" or s == "challenges"
end

local function _aoShouldForceReturnLobbyAfterChallenge()
    if not _AO.ChallengeMatchForceLobby then return false end
    return _aoIsRoundChallengeGamemode()
end

local function _aoPickPostMatchVoteKind()
    if _aoShouldForceReturnLobbyAfterChallenge() then
        return "lobby"
    end
    if _AO.AutoReturnLobby then return "lobby" end
    if _AO.AutoNextEnabled then return "next" end
    if _AO.AutoReplayEnabled then return "replay" end
    return nil
end

local function _aoExecutePostMatchVote(voteKind)
    if not votingNet or not voteKind then return end
    if voteKind == "lobby" then
        pcall(function() votingNet.returnLobby.call() end)
    elseif voteKind == "next" then
        pcall(function() votingNet.nextStage.call() end)
    elseif voteKind == "replay" then
        pcall(function() votingNet.replayStage.call() end)
    end
end

-- Hook matchEnd.on for rewards + match end handling (Game Stage only)

if not isLobby and _AO.ModulesLoaded then
    pcall(function()
        local matchNet = require(RS:WaitForChild("gameClient"):WaitForChild("net"):WaitForChild("match"))
        dbg("matchEnd.on hook registered")
        matchNet.matchEnd.on(function(won, rewardsData, heroesExp, finalTime)
            dbg("matchEnd fired: won=" .. tostring(won))
            _AO.MatchEnded = true
            if _AO.IsRecording then
                dbg("matchEnd: flagging record stop")
                _AO._pendingRecordStop = true
            end
            _AO.LastMatchData = {
                won = won,
                rewards = rewardsData,
                heroesExp = heroesExp,
                finalTime = finalTime
            }

            -- Get stage info for notify
            local stage = "?"
            local act = 0
            pcall(function()
                local state = gameClientStore:getState()
                stage = state.gamemode.round.stage or "?"
                act = state.gamemode.round.act or 0
            end)

            -- Webhook
            if _AO.WebhookEnabled then
                pcall(function() SendWebhook(won, rewardsData, heroesExp, finalTime) end)
            end

            -- Auto actions (wait a bit for game to process)
            local vk = _aoPickPostMatchVoteKind()
            dbg(
                "Hook: post-match vote="
                    .. tostring(vk)
                    .. " (challengeForceLobby="
                    .. tostring(_aoShouldForceReturnLobbyAfterChallenge())
                    .. " Replay="
                    .. tostring(_AO.AutoReplayEnabled)
                    .. " Next="
                    .. tostring(_AO.AutoNextEnabled)
                    .. " ReturnLobby="
                    .. tostring(_AO.AutoReturnLobby)
                    .. ")"
            )
            task.wait(3)
            if vk then
                _aoExecutePostMatchVote(vk)
            else
                dbg("Hook: no auto action enabled")
            end
        end)
    end)
end

-- Game Stage auto loops
task.spawn(function()
    while getgenv()._AORunning do
        if not isLobby and _AO.AutoSkipWaveEnabled and votingNet then
            pcall(function() votingNet.skipWave.fire() end)
        end
        task.wait(1)
    end
end)

task.spawn(function()
    while getgenv()._AORunning do
        if not isLobby and _AO.AutoStartEnabled and votingNet then
            pcall(function() votingNet.startMatch.fire() end)
        end
        task.wait(1)
    end
end)

-- Auto Play Macro loop
task.spawn(function()
    dbg("Macro loop started")
    while getgenv()._AORunning do
        if not isLobby and _AO.AutoPlayEnabled and #_AO.CurrentMacro > 0 then
            -- Wait for match to start (round state not Ended, wave exists)
            _AO.MatchEnded = false
            dbg("Loop: waiting for match start...")
            local ready = false
            while not ready and _AO.AutoPlayEnabled and getgenv()._AORunning do
                local roundState = "?"
                pcall(function()
                    if gameClientStore then
                        local state = gameClientStore:getState()
                        if state and state.gamemode and state.gamemode.round then
                            roundState = state.gamemode.round.state or "nil"
                            local hasWave = state.wave and state.wave.waveNumber
                            if roundState ~= "Ended" and hasWave then
                                ready = true
                            end
                        end
                    end
                end)
                if not ready then task.wait(1) end
            end

            -- Play macro (re-check permissions before each run)
            if _AO.AutoPlayEnabled and getgenv()._AORunning then
                local allowed = CanPlayMacro(_AO.CurrentMacro)
                if not allowed then
                    dbg("Loop: CanPlayMacro blocked, disabling AutoPlay")
                    _AO.AutoPlayEnabled = false
                    pcall(function()
                        local opt = MacLib.Options and MacLib.Options["AutoPlayMacroToggle"]
                        if opt and type(opt.UpdateState) == "function" then opt:UpdateState(false) end
                    end)
                else
                dbg("Loop: match ready, starting PlayMacro (" .. #_AO.CurrentMacro .. " steps)")
                task.wait(1)
                _AO.IsPlaying = true
                PlayMacro()
                dbg("Loop: PlayMacro done, waiting for MatchEnded...")

                -- Wait for match to end (via matchEnd.on hook)
                while getgenv()._AORunning and _AO.AutoPlayEnabled and not _AO.MatchEnded do
                    task.wait(1)
                end

                -- Keep voting replay/next until match actually restarts
                if _AO.AutoPlayEnabled and getgenv()._AORunning and _AO.MatchEnded then
                    dbg("Loop: match ended, voting for restart...")
                    local retryCount = 0
                    while _AO.AutoPlayEnabled and getgenv()._AORunning do
                        -- Check if match restarted
                        local restarted = false
                        local curState = "?"
                        pcall(function()
                            if gameClientStore then
                                local state = gameClientStore:getState()
                                if state and state.gamemode and state.gamemode.round then
                                    curState = state.gamemode.round.state or "nil"
                                    if curState ~= "Ended" then
                                        restarted = true
                                    end
                                end
                            end
                        end)
                        if restarted then
                            dbg("Loop: match restarted! state=" .. curState)
                            break
                        end

                        retryCount = retryCount + 1
                        if votingNet then
                            local vk2 = _aoPickPostMatchVoteKind()
                            if vk2 then
                                _aoExecutePostMatchVote(vk2)
                                dbg("Loop: voted " .. vk2 .. " #" .. retryCount)
                            else
                                dbg("Loop: no auto action! #" .. retryCount)
                            end
                        else
                            dbg("Loop: votingNet nil!")
                        end
                        task.wait(3)
                    end
                end
                end
            end
        end
        task.wait(2)
    end
end)

-- Setup hooks for recording
if not isLobby then

    dbg("Calling SetupRecordingHooks... ModulesLoaded=" .. tostring(_AO.ModulesLoaded))
    local ok, err = pcall(SetupRecordingHooks)
    dbg("SetupRecordingHooks: " .. (ok and "OK" or ("FAIL: " .. tostring(err))))
    if not ok then

    end
end

-- ═══════════════════════════════════════════
-- UI: AUTO JOIN TAB
-- ═══════════════════════════════════════════

local ModeDropdown, StageDropdown, ActDropdown, DifficultyDropdown

if isLobby then
    sections.JoinLeft:Header({ Text = "Stage Selection" })

    local function UpdateUIForMode(mode, skipActRebuild)
        local showStage = (mode == "Story" or mode == "Raid" or mode == "Legends")
        local showDifficulty = (mode == "Story" or mode == "Raid")
        local hideAll = (mode == "Chain of Control")
        MacLib.Options["StageDropdown"]:SetVisibility(showStage and not hideAll)
        MacLib.Options["ActDropdown"]:SetVisibility(mode ~= "Excavation" and not hideAll)
        MacLib.Options["DifficultyDropdown"]:SetVisibility(showDifficulty and not hideAll)

        if showStage and StageDropdown then
            local stageMode = (mode == "Legends") and "Story" or mode
            local stages = GetStagesForMode(stageMode)
            if #stages == 0 then stages = { "No Stages Found" } end
            StageDropdown:ClearOptions()
            StageDropdown:InsertOptions(stages)
            StageDropdown:UpdateSelection(stages[1])
            _AO.SelectedStage = AllStages[stages[1]]
        elseif mode == "Excavation" then
            _AO.SelectedStage = "desertMap"
        end

        if not skipActRebuild and _AO.SelectedStage and ActDropdown then
            local acts = (mode == "Legends") and GetLegendsActsForStage(_AO.SelectedStage) or GetActsForStage(_AO.SelectedStage)
            ActDropdown:ClearOptions()
            ActDropdown:InsertOptions(acts)
            ActDropdown:UpdateSelection(acts[1])
            _AO.SelectedAct = acts[1]
        end

        -- Set difficulty based on mode
        if mode == "Legends" then
            _AO.SelectedDifficulty = "legends"
        elseif not showDifficulty then
            _AO.SelectedDifficulty = "normal"
        end
    end

    local initStages = GetStagesForMode("Story")
    if #initStages == 0 then initStages = { "No Stages Found" } end

    ModeDropdown = sections.JoinLeft:Dropdown({
        Name = "Mode",
        Options = { "Story", "Raid", "Legends", "Excavation", "Chain of Control" },
        Default = "Story",
        Callback = function(v)
            _AO.SelectedMode = v
            if not _AO.IsLoadingConfig then UpdateUIForMode(v) end
        end
    }, "ModeDropdown")

    StageDropdown = sections.JoinLeft:Dropdown({
        Name = "Stage",
        Options = initStages,
        Default = initStages[1] or "None",
        Callback = function(v)
            _AO.SelectedStage = AllStages[v]
            if _AO.SelectedStage and not _AO.IsLoadingConfig then
                local acts = (_AO.SelectedMode == "Legends") and GetLegendsActsForStage(_AO.SelectedStage) or GetActsForStage(_AO.SelectedStage)
                if ActDropdown then
                    ActDropdown:ClearOptions()
                    ActDropdown:InsertOptions(acts)
                    ActDropdown:UpdateSelection(acts[1])
                end
                _AO.SelectedAct = acts[1]
            end
        end
    }, "StageDropdown")

    ActDropdown = sections.JoinLeft:Dropdown({
        Name = "Act",
        Options = { "1" },
        Default = "1",
        Callback = function(v)
            if not _AO.IsLoadingConfig then _AO.SelectedAct = v end
        end
    }, "ActDropdown")

    DifficultyDropdown = sections.JoinLeft:Dropdown({
        Name = "Difficulty",
        Options = { "normal", "nightmare" },
        Default = "normal",
        Callback = function(v)
            if not _AO.IsLoadingConfig then _AO.SelectedDifficulty = v end
        end
    }, "DifficultyDropdown")

    sections.JoinLeft:Divider()

    sections.JoinLeft:Button({
        Name = "Join Now",
        Callback = function()
            if _AO.ModulesLoaded then
                task.spawn(DoAutoJoin)
            end
        end
    })
else
    sections.JoinLeft:Header({ Text = "Join settings can only be changed in Lobby" })

    -- Hidden stub dropdowns with full options to preserve config
    local allStageNames = {}
    for name in pairs(AllStages) do table.insert(allStageNames, name) end
    table.sort(allStageNames)
    if #allStageNames == 0 then allStageNames = { "None" } end

    local allActOptions = { "1", "2", "3", "4", "5", "6", "7" }

    sections.JoinLeft:Dropdown({
        Name = "Mode", Options = { "Story", "Raid", "Legends", "Excavation", "Chain of Control" }, Default = "Story",
        Callback = function(v) _AO.SelectedMode = v end
    }, "ModeDropdown")
    sections.JoinLeft:Dropdown({
        Name = "Stage", Options = allStageNames, Default = allStageNames[1],
        Callback = function(v) local sid = AllStages[v]; if sid then _AO.SelectedStage = sid end end
    }, "StageDropdown")
    sections.JoinLeft:Dropdown({
        Name = "Act", Options = allActOptions, Default = "1",
        Callback = function(v) _AO.SelectedAct = v end
    }, "ActDropdown")
    sections.JoinLeft:Dropdown({
        Name = "Difficulty", Options = { "normal", "nightmare" }, Default = "normal",
        Callback = function(v) _AO.SelectedDifficulty = v end
    }, "DifficultyDropdown")
    task.defer(function()
        pcall(function() MacLib.Options["ModeDropdown"]:SetVisibility(false) end)
        pcall(function() MacLib.Options["StageDropdown"]:SetVisibility(false) end)
        pcall(function() MacLib.Options["ActDropdown"]:SetVisibility(false) end)
        pcall(function() MacLib.Options["DifficultyDropdown"]:SetVisibility(false) end)
    end)
end

sections.JoinLeft:Toggle({
    Name = "Auto Join",
    Default = false,
    Callback = function(v)
        _AO.AutoJoinEnabled = v
    end
}, "AutoJoinToggle")

-- Right: Player Info
sections.JoinRight:Header({ Text = "Player Info" })
local StatusLabel = sections.JoinRight:Paragraph({ Header = "Stats", Body = "Loading..." })
local DailyRewardsLobbyLabel = sections.JoinRight:Paragraph({
    Header = "Daily rewards (timers)",
    Body = isLobby and "…" or "Only in lobby.",
})

local getLevelFromExp = nil
pcall(function() getLevelFromExp = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("gameData"):WaitForChild("functions"):WaitForChild("getLevelFromExperience")) end)

task.spawn(function()
    while getgenv()._AORunning do
        pcall(function()
            local store = GetStore()
            if not store then return end
            local state = store:getState()
            if not state or not state.data then return end
            local lines = {}
            if state.data.level and type(state.data.level) == "table" then
                local exp = state.data.level[userId]
                if exp and getLevelFromExp then
                    local ok, lvl = pcall(getLevelFromExp, exp)
                    if ok then table.insert(lines, "Level: " .. tostring(lvl)) end
                end
            end
            if state.data.stats and type(state.data.stats) == "table" then
                local stats = state.data.stats[userId]
                if type(stats) == "table" then
                    table.insert(lines, "Games: " .. tostring(stats.gamesPlayed or 0) .. " | Wins: " .. tostring(stats.gamesWon or 0))
                end
            end
            if state.data.core and type(state.data.core) == "table" then
                local core = state.data.core[userId]
                if type(core) == "table" then
                    table.insert(lines, "Gold: " .. tostring(core.gold or 0))
                    table.insert(lines, "Crystals: " .. tostring(core.crystalShard or 0))
                    table.insert(lines, "Tokens: " .. tostring(core.token or 0))
                    table.insert(lines, "Bloodied Chains: " .. tostring(core.bloodiedChains or 0))
                end
            end
            if state.data.heroes and type(state.data.heroes) == "table" then
                local h = state.data.heroes[userId]
                if type(h) == "table" then
                    local c = 0; for _ in pairs(h) do c = c + 1 end
                    table.insert(lines, "Heroes: " .. tostring(c))
                end
            end
            if #lines > 0 then StatusLabel:UpdateBody(table.concat(lines, "\n")) end
        end)
        task.wait(3)
    end
end)

task.spawn(function()
    while getgenv()._AORunning do
        if isLobby then
            pcall(function()
                local drLines = BuildDailyRewardsLobbyLines()
                DailyRewardsLobbyLabel:UpdateBody(table.concat(drLines, "\n"))
            end)
            task.wait(1)
        else
            pcall(function()
                DailyRewardsLobbyLabel:UpdateBody("Only in lobby.")
            end)
            task.wait(5)
        end
    end
end)

sections.JoinRight:Paragraph({ Header = "How it works", Body = "1. Select Mode, Stage, Act, Difficulty\n2. Click 'Join Now' or enable 'Auto Join'\n3. Teleports to door, joins room, queues\n\nWorks in Lobby only." })

-- ═══════════════════════════════════════════
-- UI: SUMMON TAB
-- ═══════════════════════════════════════════

local allMythics = GetAllMythicHeroes()

if isLobby then
    sections.SummonLeft:Header({ Text = "Auto Summon" })

    sections.SummonLeft:Dropdown({
        Name = "Banner",
        Options = { "NORMAL", "CRIMSON" },
        Default = "NORMAL",
        Callback = function(v)
            if not _AO.IsLoadingConfig then
                _AO.SummonBanner = v
            end
        end
    }, "SummonBannerDropdown")

    sections.SummonLeft:Dropdown({
        Name = "Amount",
        Options = { "x1", "x10" },
        Default = "x1",
        Callback = function(v)
            if not _AO.IsLoadingConfig then
                _AO.SummonAmount = v == "x10" and 10 or 1
            end
        end
    }, "SummonAmountDropdown")

    sections.SummonLeft:Dropdown({
        Name = "Only When Featured",
        Multi = true,
        Options = #allMythics > 0 and allMythics or { "None" },
        Callback = function(selected)
            if not _AO.IsLoadingConfig then
                _AO.SelectedFeatured = {}
                for heroId, isSelected in pairs(selected) do
                    if isSelected then
                        _AO.SelectedFeatured[heroId] = true
                    end
                end
            end
        end
    }, "FeaturedFilterDropdown")

    sections.SummonLeft:Slider({
        Name = "Delay (seconds)",
        Default = 0.5,
        Minimum = 0.1,
        Maximum = 2,
        Precision = 1,
        DisplayMethod = "Value",
        Callback = function(v)
            _AO.SummonDelay = v
        end
    }, "SummonDelaySlider")
else
    sections.SummonLeft:Header({ Text = "Summon settings can only be changed in Lobby" })

    -- Hidden stub dropdowns with full options to preserve config
    sections.SummonLeft:Dropdown({
        Name = "Banner", Options = { "NORMAL", "CRIMSON" }, Default = "NORMAL",
        Callback = function(v) _AO.SummonBanner = v end
    }, "SummonBannerDropdown")
    sections.SummonLeft:Dropdown({
        Name = "Amount", Options = { "x1", "x10" }, Default = "x1",
        Callback = function(v) _AO.SummonAmount = v == "x10" and 10 or 1 end
    }, "SummonAmountDropdown")
    sections.SummonLeft:Dropdown({
        Name = "Only When Featured", Multi = true, Options = #allMythics > 0 and allMythics or { "None" },
        Callback = function(selected)
            _AO.SelectedFeatured = {}
            for heroId, isSelected in pairs(selected) do
                if isSelected then _AO.SelectedFeatured[heroId] = true end
            end
        end
    }, "FeaturedFilterDropdown")
    sections.SummonLeft:Slider({
        Name = "Delay (seconds)", Default = 0.5, Minimum = 0.1, Maximum = 2, Precision = 1, DisplayMethod = "Value",
        Callback = function(v) _AO.SummonDelay = v end
    }, "SummonDelaySlider")
    task.defer(function()
        pcall(function() MacLib.Options["SummonBannerDropdown"]:SetVisibility(false) end)
        pcall(function() MacLib.Options["SummonAmountDropdown"]:SetVisibility(false) end)
        pcall(function() MacLib.Options["FeaturedFilterDropdown"]:SetVisibility(false) end)
        pcall(function() MacLib.Options["SummonDelaySlider"]:SetVisibility(false) end)
    end)
end

sections.SummonLeft:Toggle({
    Name = "Auto Summon",
    Default = false,
    Callback = function(v)
        _AO.AutoSummonEnabled = v
    end
}, "AutoSummonToggle")

if isLobby then
    sections.SummonLeft:Divider()
    sections.SummonLeft:Header({ Text = "Auto Sell (Hero)" })

    sections.SummonLeft:Toggle({
        Name = "Auto Sell Rare",
        Default = false,
        Callback = function(v)
            _AO.AutoSellRare = v
            if not _AO.IsLoadingConfig and playerNet then
                pcall(function() playerNet.updateSettings.fire("autoSellHeroRare", v) end)
            end
        end
    }, "AutoSellRareToggle")

    sections.SummonLeft:Toggle({
        Name = "Auto Sell Epic",
        Default = false,
        Callback = function(v)
            _AO.AutoSellEpic = v
            if not _AO.IsLoadingConfig and playerNet then
                pcall(function() playerNet.updateSettings.fire("autoSellHeroEpic", v) end)
            end
        end
    }, "AutoSellEpicToggle")

    sections.SummonLeft:Toggle({
        Name = "Auto Sell Legendary",
        Default = false,
        Callback = function(v)
            _AO.AutoSellLegendary = v
            if not _AO.IsLoadingConfig and playerNet then
                pcall(function() playerNet.updateSettings.fire("autoSellHeroLegendary", v) end)
            end
        end
    }, "AutoSellLegendaryToggle")
else
    -- Stub toggles to preserve config
    sections.SummonLeft:Toggle({ Name = "Auto Sell Rare", Default = false, Callback = function(v) _AO.AutoSellRare = v end }, "AutoSellRareToggle")
    sections.SummonLeft:Toggle({ Name = "Auto Sell Epic", Default = false, Callback = function(v) _AO.AutoSellEpic = v end }, "AutoSellEpicToggle")
    sections.SummonLeft:Toggle({ Name = "Auto Sell Legendary", Default = false, Callback = function(v) _AO.AutoSellLegendary = v end }, "AutoSellLegendaryToggle")
end

local ChampionLabel = sections.SummonRight:Paragraph({ Header = "Banner's Champion", Body = "Loading..." })
local FeaturedLabel = sections.SummonRight:Paragraph({ Header = "Featured Mythics", Body = "Loading..." })

task.spawn(function()
    while getgenv()._AORunning do
        pcall(function()
            ChampionLabel:UpdateBody(GetBannerChampion() or "None")
            local featured = GetCurrentFeatured(_AO.SummonBanner)
            FeaturedLabel:UpdateHeader("Featured (" .. _AO.SummonBanner .. ")")
            if #featured > 0 then
                local text = table.concat(featured, "\n")
                if next(_AO.SelectedFeatured) then text = text .. "\n\n" .. (IsFeaturedMatch(_AO.SummonBanner) and "Filter: MATCH" or "Filter: waiting...") end
                FeaturedLabel:UpdateBody(text)
            else
                FeaturedLabel:UpdateBody("No data")
            end
        end)
        task.wait(3)
    end
end)

-- Sync auto-sell toggles with game state on load
task.defer(function()
    if not isLobby or not _AO.ModulesLoaded or not clientStore then return end
    pcall(function()
        local state = clientStore:getState()
        if state and state.data and state.data.settings then
            local settings = state.data.settings[userId]
            if type(settings) == "table" then
                _AO.AutoSellRare = settings.autoSellHeroRare or false
                _AO.AutoSellEpic = settings.autoSellHeroEpic or false
                _AO.AutoSellLegendary = settings.autoSellHeroLegendary or false
            end
        end
    end)
end)

-- ═══════════════════════════════════════════
-- UI: MACROS TAB
-- ═══════════════════════════════════════════

local PlayDropdown
local RecordToggle
_AO.RecordingWatchdogGeneration = 0

local function RefreshMacroDropdown(selectName)
    local files = GetMacroFiles()
    if PlayDropdown then
        PlayDropdown:ClearOptions()
        PlayDropdown:InsertOptions(#files > 0 and files or { "No Macros" })
        if selectName and selectName ~= "" then
            PlayDropdown:UpdateSelection(selectName)
        end
    end
end

local function UpdateUnitsInfo()
    if not UnitsParagraph then return end
    local uniqueUnits = GetMacroUniqueUnits(_AO.CurrentMacro)
    if #uniqueUnits == 0 then
        UnitsParagraph:UpdateBody("No units")
        return
    end
    local premium = IsPremium()
    local lines = {}
    for _, name in ipairs(uniqueUnits) do
        local slot = GetHeroEquippedStatus(name)
        if slot then
            table.insert(lines, "• " .. name .. "  [Slot " .. tostring(slot) .. "]")
        elseif premium then
            table.insert(lines, "• " .. name .. "  [not equipped — Premium OK]")
        else
            table.insert(lines, "• " .. name .. "  ⚠ NOT EQUIPPED")
        end
    end
    local header = tostring(#uniqueUnits) .. " unit(s)"
    if not premium and #uniqueUnits > MAX_FREE_MACRO_UNITS then
        header = header .. "  ⚠ >" .. MAX_FREE_MACRO_UNITS .. " units — Premium required!"
    end
    table.insert(lines, 1, header)
    UnitsParagraph:UpdateBody(table.concat(lines, "\n"))
end

_AO.StopRecordingAndSave = function()
    if not _AO.IsRecording then return end
    _AO.IsRecording = false
    _AO._pendingRecordStop = false
    dbg("StopRecording: steps=" .. #_AO.CurrentMacro .. " name=" .. tostring(_AO.SelectedMacroName))
    if #_AO.CurrentMacro > 0 and _AO.SelectedMacroName ~= "" and _AO.SelectedMacroName ~= "No Macros" then
        SaveMacro(_AO.SelectedMacroName, _AO.CurrentMacro)
        dbg("Saved! " .. #_AO.CurrentMacro .. " steps")
        pcall(function() Notify("Saved: " .. _AO.SelectedMacroName .. " (" .. #_AO.CurrentMacro .. " steps)") end)
        pcall(function() RefreshMacroDropdown(_AO.SelectedMacroName) end)
        pcall(function() UpdateUnitsInfo() end)
    else
        dbg("Nothing to save")
        pcall(function() Notify("Recording stopped — nothing to save") end)
    end
    task.defer(function()
        if MacLib.Options["RecordMacroToggle"] then
            MacLib.Options["RecordMacroToggle"]:UpdateState(false)
        end
    end)
end

local function StartRecordingRoundWatchdog()
    if isLobby or not gameClientStore then return end
    _AO.RecordingWatchdogGeneration = _AO.RecordingWatchdogGeneration + 1
    local gen = _AO.RecordingWatchdogGeneration
    task.spawn(function()
        dbg("RecordingWatchdog gen=" .. gen .. " started")
        while getgenv()._AORunning and _AO.IsRecording and gen == _AO.RecordingWatchdogGeneration do
            -- Check flag from subscribe callback
            if _AO._pendingRecordStop then
                _AO._pendingRecordStop = false
                dbg("RecordingWatchdog: _pendingRecordStop → StopRecordingAndSave")
                if gen == _AO.RecordingWatchdogGeneration and _AO.IsRecording then
                    _AO.StopRecordingAndSave()
                end
                break
            end
            -- Also poll round state as backup
            local rs = nil
            pcall(function()
                local state = gameClientStore:getState()
                if state and state.gamemode and state.gamemode.round then
                    rs = state.gamemode.round.state
                end
            end)
            if rs == "Ended" or rs == "Ending" then
                dbg("RecordingWatchdog: round.state=" .. tostring(rs) .. " → StopRecordingAndSave")
                if gen == _AO.RecordingWatchdogGeneration and _AO.IsRecording then
                    _AO.StopRecordingAndSave()
                end
                break
            end
            task.wait(0.45)
        end
        dbg("RecordingWatchdog gen=" .. gen .. " ended")
    end)
end

-- Stop macro recording when round ends in Reflex store
_AO._pendingRecordStop = false

if not isLobby and _AO.ModulesLoaded and gameClientStore then
    task.defer(function()
        pcall(function()
            local selectRound = require(RS:WaitForChild("gameShared"):WaitForChild("store"):WaitForChild("slices"):WaitForChild("gamemode"):WaitForChild("selectors"):WaitForChild("selectRound"))
            local roundEnum = require(RS:WaitForChild("gameShared"):WaitForChild("enums"):WaitForChild("round"))
            gameClientStore:subscribe(selectRound, function(newState, _)
                if not _AO.IsRecording then return end
                if newState ~= roundEnum.ended and newState ~= roundEnum.ending then return end
                dbg("selectRound: " .. tostring(newState) .. " — flagging record stop")
                _AO._pendingRecordStop = true
            end)
            dbg("subscribe(selectRound) for macro record stop OK")
        end)
    end)
end

-- ── Create Macro File ──
sections.MacroLeft:Header({ Text = "Create Macro File" })

sections.MacroLeft:Input({
    Name = "Macro Name",
    Default = "",
    Placeholder = "Enter name...",
    Callback = function(v)
        _AO.SelectedMacroName = v or ""
    end
}, "MacroNameInput")

sections.MacroLeft:Button({
    Name = "Create Macro File",
    Callback = function()
        local safe = SanitizeMacroName(_AO.SelectedMacroName)
        if safe == "" then
            Notify("Enter a macro name first")
            return
        end
        local path = MacroFolder .. "/" .. safe .. ".json"
        if isfile(path) then
            Notify("Macro «" .. safe .. "» already exists")
            return
        end
        EnsureMacroJsonFile(safe)
        Notify("Created: " .. safe)
        RefreshMacroDropdown(safe)
        _AO.SelectedMacroName = safe
    end
})

sections.MacroLeft:Header({ Text = "Import Macro" })
sections.MacroLeft:Input({
    Name = "Macro JSON URL",
    Default = "",
    Placeholder = "Discord URL or paste.rs link",
    Callback = function(v)
        _AO.MacroImportURL = v or ""
    end
}, "MacroImportUrlInput")

sections.MacroLeft:Button({
    Name = "Import Macro",
    Callback = function()
        local url = _AO.MacroImportURL
        if type(url) ~= "string" or url:match("^%s*$") then
            Notify("Paste a macro JSON link first")
            return
        end
        local body, err = FetchMacroImportUrl(url)
        if not body then
            Notify("Import failed: " .. tostring(err))
            return
        end
        -- Check for embedded macro name header (paste.rs exports: "-- MACRO:name\n{json}")
        local embeddedName = nil
        local jsonBody = body
        local headerLine = body:match("^(%-%-% MACRO:[^\n]*)\n")
        if headerLine then
            embeddedName = headerLine:match("^%-%-%s*MACRO:(.+)$")
            if embeddedName then
                embeddedName = embeddedName:match("^%s*(.-)%s*$") -- trim
            end
            jsonBody = body:sub(#headerLine + 2) -- skip header + newline
        end
        local okDec, decoded = pcall(function() return HttpService:JSONDecode(jsonBody) end)
        if not okDec or decoded == nil then
            Notify("Import failed: invalid JSON")
            return
        end
        local steps, importKind = ResolveImportedMacroSteps(decoded)
        if not steps then
            Notify("Import failed: " .. tostring(importKind or "could not read macro"))
            return
        end
        local okV, why = ValidateMacroImportDecoded(steps)
        if not okV then
            Notify("Import failed: " .. tostring(why or "expected JSON array of steps"))
            return
        end
        decoded = steps
        local legacyNote = (importKind == "legacy") and " — foreign format → converted" or ""
        local base = ""
        if embeddedName and embeddedName ~= "" then
            base = SanitizeMacroName(embeddedName)
        end
        if base == "" then base = MacroBaseNameFromImportUrl(url) end
        if base == "" then base = SanitizeMacroName("ImportedMacro") end
        if base == "" then
            Notify("Import failed: bad file name")
            return
        end
        if not isfolder(MacroFolder) then makefolder(MacroFolder) end
        local existed = isfile(MacroFolder .. "/" .. base .. ".json")
        SaveMacro(base, decoded)
        Notify((existed and "Replaced: " or "Imported: ") .. base .. " (" .. tostring(#decoded) .. " steps)" .. legacyNote)
        _AO.SelectedMacroName = base
        _AO.CurrentMacro = LoadMacro(base)
        RefreshMacroDropdown(base)
        UpdateUnitsInfo()
    end
})

-- ── Macro ──
sections.MacroLeft:Divider()
sections.MacroLeft:Header({ Text = "Macro" })

local MacroList = GetMacroFiles()

PlayDropdown = sections.MacroLeft:Dropdown({
    Name = "Select Macro",
    Search = true,
    Options = #MacroList > 0 and MacroList or { "No Macros" },
    Default = MacroList[1] or "No Macros",
    Callback = function(v)
        if v == "No Macros" then return end
        _AO.SelectedMacroName = v
        _AO.CurrentMacro = LoadMacro(v)
        UpdateUnitsInfo()
    end
}, "SelectMacroDropdown")

sections.MacroLeft:Button({
    Name = "Refresh List",
    Callback = function()
        RefreshMacroDropdown()
    end
})

RecordToggle = sections.MacroLeft:Toggle({
    Name = "Record",
    Default = false,
    Callback = function(v)
        if v then
            if isLobby then
                Notify("Enter game stage first")
                pcall(function() RecordToggle:UpdateState(false) end)
                return
            end
            if _AO.SelectedMacroName == "" or _AO.SelectedMacroName == "No Macros" then
                Notify("Select a macro file first")
                pcall(function() RecordToggle:UpdateState(false) end)
                return
            end
            dbg("Record ON: name=" .. _AO.SelectedMacroName)
            _AO.CurrentMacro = {}
            _AO.RecordedEntityMap = {}
            _AO._pendingPlaces = {}
            _AO._macroSeq = 0
            _AO.IsRecording = true
            TrackNewTowers()
            StartRecordingRoundWatchdog()
            Notify("Recording: " .. _AO.SelectedMacroName)
        else
            _AO.StopRecordingAndSave()
        end
    end
}, "RecordMacroToggle")

sections.MacroLeft:Button({
    Name = "Delete Macro",
    Callback = function()
        if not _AO.SelectedMacroName or _AO.SelectedMacroName == "" or _AO.SelectedMacroName == "No Macros" then return end
        local delName = SanitizeMacroName(_AO.SelectedMacroName)
        if delName == "" then return end
        local path = MacroFolder .. "/" .. delName .. ".json"
        if isfile(path) then delfile(path) end
        _AO.CurrentMacro = {}
        _AO.SelectedMacroName = ""
        RefreshMacroDropdown()
        UpdateUnitsInfo()
        Notify("Deleted: " .. delName)
    end
})

sections.MacroLeft:Button({
    Name = "Export Macro",
    Callback = function()
        if not _AO.SelectedMacroName or _AO.SelectedMacroName == "" or _AO.SelectedMacroName == "No Macros" then
            Notify("Select a macro first")
            return
        end
        local name = SanitizeMacroName(_AO.SelectedMacroName)
        local path = MacroFolder .. "/" .. name .. ".json"
        if not isfile(path) then
            Notify("Macro file not found")
            return
        end
        local jsonData = readfile(path)
        local req = (syn and syn.request) or (http and http.request) or http_request or request
        if not req then
            local clip = setclipboard or toclipboard
            if clip then
                clip("```json\n" .. jsonData .. "\n```")
                Notify("JSON copied to clipboard.\nPaste in Discord to share.")
            else
                Notify("HTTP and clipboard not supported")
            end
            return
        end

        Notify("Uploading...")
        task.spawn(function()
            local pasteUrl = nil
            pcall(function()
                -- Prepend macro name as first line so import can recover it
                local pasteBody = "-- MACRO:" .. name .. "\n" .. jsonData
                local res = req({
                    Url = "https://paste.rs/",
                    Method = "POST",
                    Headers = { ["Content-Type"] = "text/plain" },
                    Body = pasteBody
                })
                local body = res.Body or res.body
                if body then
                    pasteUrl = body:match("(https://paste%.rs/%S+)")
                end
            end)

            if pasteUrl then
                local clip = setclipboard or toclipboard
                if clip then clip(pasteUrl) end
                Notify("Link copied!\n" .. pasteUrl .. "\n\nPaste in Discord to share.")
            else
                -- Fallback: copy raw JSON to clipboard
                local clip = setclipboard or toclipboard
                if clip then
                    clip("```json\n" .. jsonData .. "\n```")
                    Notify("Upload failed — JSON copied to clipboard instead.\nPaste in Discord to share.")
                else
                    Notify("Upload failed and clipboard not supported")
                end
            end
        end)
    end
})

local PlayMacroToggle
PlayMacroToggle = sections.MacroLeft:Toggle({
    Name = "Play Selected Macro",
    Default = false,
    Callback = function(v)
        if _AO.IsLoadingConfig then
            _AO.AutoPlayEnabled = v
            return
        end
        if v then
            if _AO.AutoPlayByStageEnabled then
                Notify("Disable 'Auto Play by Stage' first")
                task.defer(function() MacLib.Options["AutoPlayMacroToggle"]:UpdateState(false) end)
                return
            end
            if _AO.SelectedMacroName == "" or _AO.SelectedMacroName == "No Macros" then
                Notify("Select a macro first")
                task.defer(function() MacLib.Options["AutoPlayMacroToggle"]:UpdateState(false) end)
                return
            end
            _AO.CurrentMacro = LoadMacro(_AO.SelectedMacroName)
            local allowed = CanPlayMacro(_AO.CurrentMacro)
            if not allowed then
                task.defer(function() MacLib.Options["AutoPlayMacroToggle"]:UpdateState(false) end)
                return
            end
            _AO.AutoPlayEnabled = true
        else
            _AO.AutoPlayEnabled = false
            _AO.IsPlaying = false
        end
    end
}, "AutoPlayMacroToggle")

sections.MacroLeft:Dropdown({
    Name = "Playback Speed",
    Options = { "Fast", "Timed (Normal)" },
    Default = "Fast",
    Callback = function(v)
        _AO.MacroSpeed = v == "Timed (Normal)" and 1 or 0
    end
}, "PlaybackSpeedDropdown")

-- Right: Macro Info
sections.MacroRight:Header({ Text = "Units in Macro" })
UnitsParagraph = sections.MacroRight:Paragraph({
    Header = "Unit List",
    Body = "Select a macro to see units."
})

sections.MacroRight:Paragraph({
    Header = "Guide",
    Body = "1. Create file or Import from URL (Discord .json)\n2. Select macro → Record / Play manually\n3. OR go to 'Stage Macros' tab to assign per stage\n4. Enable 'Auto Play by Stage' — picks macro by current map"
})

-- ═══════════════════════════════════════════
-- UI: STAGE MACROS TAB
-- ═══════════════════════════════════════════

_AO.StageMacroMap = {} -- {stageId = macroName}

-- Build sorted stage list for dropdowns
local allStagesSorted = {}
for _, s in ipairs(StoryStages) do table.insert(allStagesSorted, { id = s.id, name = s.name }) end
for _, s in ipairs(RaidStages) do table.insert(allStagesSorted, { id = s.id, name = s.name }) end
table.insert(allStagesSorted, { id = "release", name = "Chain of Control" })

local stageMacroDropdowns = {}

local function GetMacroOptionsForStage()
    local files = GetMacroFiles()
    local opts = { "None" }
    for _, f in ipairs(files) do table.insert(opts, f) end
    return opts
end

-- Split stages between left and right sections
local halfCount = math.ceil(#allStagesSorted / 2)

sections.StageMacroLeft:Header({ Text = "Assign Macro per Stage" })

local _usedStageMacroFlags = {}
for i, stageInfo in ipairs(allStagesSorted) do
    local sid = stageInfo.id
    local opts = GetMacroOptionsForStage()
    local section = (i <= halfCount) and sections.StageMacroLeft or sections.StageMacroRight
    if i == halfCount + 1 then
        sections.StageMacroRight:Header({ Text = "Assign Macro per Stage" })
    end
    local flagBase = sid:gsub("[^%w_]", "_")
    -- Check for duplicate sid (e.g. "release" used by both LTM and Chain of Control)
    local flagSid = flagBase
    if _usedStageMacroFlags[flagBase] then
        flagSid = (sid .. "_" .. stageInfo.name):gsub("[^%w_]", "_")
    end
    _usedStageMacroFlags[flagBase] = true
    local displayName = stageInfo.name:gsub("%[", "("):gsub("%]", ")") -- MacLib can't handle brackets
    local dd = section:Dropdown({
        Name = displayName,
        Search = true,
        Options = opts,
        Default = "None",
        Callback = function(v)
            if v == "None" then
                _AO.StageMacroMap[stageInfo.name] = nil
            else
                _AO.StageMacroMap[stageInfo.name] = v
            end
        end
    }, "StageMacro_" .. flagSid)
    stageMacroDropdowns[stageInfo.name] = dd
end

-- Controls at the bottom of right section
sections.StageMacroRight:Divider()

sections.StageMacroRight:Toggle({
    Name = "Auto Play by Stage",
    Default = false,
    Callback = function(v)
        if _AO.IsLoadingConfig then
            _AO.AutoPlayByStageEnabled = v
            return
        end
        if v then
            if _AO.AutoPlayEnabled then
                Notify("Disable 'Play Selected Macro' first")
                task.defer(function() MacLib.Options["AutoPlayByStageToggle"]:UpdateState(false) end)
                return
            end
            _AO.AutoPlayByStageEnabled = true
        else
            _AO.AutoPlayByStageEnabled = false
            _AO.IsPlaying = false
        end
    end
}, "AutoPlayByStageToggle")

sections.StageMacroRight:Button({
    Name = "Refresh Macro Lists",
    Callback = function()
        local opts = GetMacroOptionsForStage()
        for sid, dd in pairs(stageMacroDropdowns) do
            pcall(function()
                local current = _AO.StageMacroMap[sid]
                dd:ClearOptions()
                dd:InsertOptions(opts)
                if current and table.find(opts, current) then
                    dd:UpdateSelection(current)
                else
                    dd:UpdateSelection("None")
                end
            end)
        end
        Notify("Stage macro lists refreshed")
    end
})

sections.StageMacroRight:Paragraph({
    Header = "How It Works",
    Body = "Assign a macro to each stage. When 'Auto Play by Stage' is on, the script detects which stage you're in and plays the assigned macro automatically.\n\nCannot be used together with 'Play Selected Macro'."
})

-- Get current stage id from game state
local function GetCurrentStageId()
    if isLobby or not gameClientStore then return nil end
    local result = nil
    pcall(function()
        local state = gameClientStore:getState()
        if state and state.gamemode and state.gamemode.round then
            local stage = state.gamemode.round.stage
            if not stage then return end
            -- Look up display name from stageConfigs
            local cfg = stageConfigs[stage]
            if cfg and cfg.name then
                result = cfg.name
            else
                result = stage
            end
            -- For stage="release", check if it's Chain of Control (not from stageConfigs or different gamemode)
            if stage == "release" then
                local gm = _aoGetRoundGamemode()
                local gmStr = gm and tostring(gm):lower() or ""
                -- Challenge gamemode = LTM (name already set from config)
                -- Non-challenge = Chain of Control
                if gmStr ~= "challenge" and gmStr ~= "challenges" then
                    result = "Chain of Control"
                end
                dbg("GetCurrentStageId: stage=release gm=" .. tostring(gm) .. " → " .. tostring(result))
            end
        end
    end)
    return result
end

-- Auto Play by Stage loop
task.spawn(function()
    while getgenv()._AORunning do
        if not isLobby and _AO.AutoPlayByStageEnabled then
            _AO.MatchEnded = false
            local ready = false
            local stageId = nil
            while not ready and _AO.AutoPlayByStageEnabled and getgenv()._AORunning do
                pcall(function()
                    if gameClientStore then
                        local state = gameClientStore:getState()
                        if state and state.gamemode and state.gamemode.round then
                            local roundState = state.gamemode.round.state or "nil"
                            stageId = GetCurrentStageId()
                            local hasWave = state.wave and state.wave.waveNumber
                            if roundState ~= "Ended" and hasWave then
                                ready = true
                            end
                        end
                    end
                end)
                if not ready then task.wait(1) end
            end

            if _AO.AutoPlayByStageEnabled and getgenv()._AORunning and stageId then
                local macroName = _AO.StageMacroMap[stageId]
                if macroName then
                    _AO.CurrentMacro = LoadMacro(macroName)
                    _AO.SelectedMacroName = macroName
                    local allowed = CanPlayMacro(_AO.CurrentMacro, true)
                    if allowed then
                        dbg("StagePlay: stage=" .. tostring(stageId) .. " macro=" .. macroName .. " steps=" .. #_AO.CurrentMacro)
                        task.wait(1)
                        _AO.IsPlaying = true
                        PlayMacro()

                        while getgenv()._AORunning and _AO.AutoPlayByStageEnabled and not _AO.MatchEnded do
                            task.wait(1)
                        end

                        if _AO.AutoPlayByStageEnabled and getgenv()._AORunning and _AO.MatchEnded then
                            local retryCount = 0
                            while _AO.AutoPlayByStageEnabled and getgenv()._AORunning do
                                local restarted = false
                                pcall(function()
                                    if gameClientStore then
                                        local state = gameClientStore:getState()
                                        if state and state.gamemode and state.gamemode.round then
                                            if (state.gamemode.round.state or "") ~= "Ended" then
                                                restarted = true
                                            end
                                        end
                                    end
                                end)
                                if restarted then break end
                                retryCount = retryCount + 1
                                if votingNet then
                                    local vk3 = _aoPickPostMatchVoteKind()
                                    if vk3 then
                                        _aoExecutePostMatchVote(vk3)
                                    end
                                end
                                task.wait(3)
                            end
                        end
                    else
                        dbg("StagePlay: CanPlayMacro blocked for " .. macroName)
                        Notify("Stage macro '" .. macroName .. "' blocked — check units/premium")
                        task.wait(5)
                    end
                else
                    dbg("StagePlay: no macro assigned for stage " .. tostring(stageId))
                    task.wait(3)
                end
            end
        end
        task.wait(2)
    end
end)

-- ═══════════════════════════════════════════
-- UI: CHALLENGES TAB
-- ═══════════════════════════════════════════

_AO.AutoChallengeEnabled = false
_AO.ChallengeAutoReturnEnabled = false -- return to lobby on hourly reset to check challenges
local _chalCheckFile = DataFolder .. "/last_challenge_hour.txt"
local function _getChallengeLastHour()
    if isfile(_chalCheckFile) then
        local ok, h = pcall(function() return tonumber(readfile(_chalCheckFile)) end)
        if ok and h then return h end
    end
    return -1
end
local function _setChallengeLastHour(h)
    pcall(function() writefile(_chalCheckFile, tostring(h)) end)
end
_AO.SelectedChallengeTypes = { hourly = true, daily = true, weekly = true }
_AO.SelectedRewards = {} -- {rewardId = true} multi-select
_AO.IgnoredChallengeStages = {} -- { stageId = true }
_AO.IgnoredChallengeModifiers = {} -- { modifierId = true }

-- Load unique reward item IDs from config
local AllRewardItemIds = {}
local RewardPoolMap = {} -- {poolIndex = {itemId1, itemId2, ...}}

pcall(function()
    local rewardsConfig = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("gamemodes"):WaitForChild("challengeRewards"))
    local freqEnum = require(RS:WaitForChild("shared"):WaitForChild("enums"):WaitForChild("challengeFrequency"))

    -- Collect from all frequency types
    for _, freq in pairs(freqEnum) do
        local pools = rewardsConfig[freq]
        if pools then
            for poolIdx, items in pairs(pools) do
                RewardPoolMap[poolIdx] = RewardPoolMap[poolIdx] or {}
                for _, item in ipairs(items) do
                    if not table.find(AllRewardItemIds, item.id) then
                        table.insert(AllRewardItemIds, item.id)
                    end
                    if not table.find(RewardPoolMap[poolIdx], item.id) then
                        table.insert(RewardPoolMap[poolIdx], item.id)
                    end
                end
            end
        end
    end
    table.sort(AllRewardItemIds)
end)


-- Target rewards dropdown: "Item name — id" (logic still uses item ids)
local ChallengeRewardOptionLabels = {}
local RewardLabelToId = {}
do
    local rows = {}
    for _, itemId in ipairs(AllRewardItemIds) do
        local dn = GetRewardItemDisplayName(itemId, nil, nil)
        if dn == itemId or (type(dn) == "string" and dn:lower() == tostring(itemId):lower()) then
            dn = PrettifyConfigId(itemId)
        end
        local label = dn .. " — " .. itemId
        RewardLabelToId[label] = itemId
        table.insert(rows, { label = label, sortKey = string.lower(dn) })
    end
    table.sort(rows, function(a, b) return a.sortKey < b.sortKey end)
    for _, r in ipairs(rows) do
        table.insert(ChallengeRewardOptionLabels, r.label)
    end
    if #ChallengeRewardOptionLabels == 0 then
        ChallengeRewardOptionLabels = { "None" }
    end
end

local function RewardDropdownKeyToItemId(key)
    if type(key) ~= "string" then return nil end
    local id = RewardLabelToId[key]
    if id then return id end
    for _, itemId in ipairs(AllRewardItemIds) do
        if itemId == key then return itemId end
    end
    return nil
end

-- Options for ignore dropdowns: UI label "Name — id", maps store raw stage/mod ids
local ChallengeStageIgnoreOptions = {}
local StageIgnoreLabelToId = {}
do
    local rows = {}
    for id, cfg in pairs(stageConfigs) do
        local displayName = (cfg and type(cfg.name) == "string" and cfg.name ~= "") and cfg.name or id
        local label = (displayName == id) and id or (displayName .. " — " .. id)
        table.insert(rows, { label = label, sortKey = displayName:lower(), id = id })
        StageIgnoreLabelToId[label] = id
    end
    table.sort(rows, function(a, b) return a.sortKey < b.sortKey end)
    for _, r in ipairs(rows) do
        table.insert(ChallengeStageIgnoreOptions, r.label)
    end
    if #ChallengeStageIgnoreOptions == 0 then
        ChallengeStageIgnoreOptions = { "(no stages loaded)" }
    end
end

-- Modifiers: enum always (avoid one big pcall); chalConfig.get per id in pcall (executor-safe)
local ChallengeModifierIgnoreOptions = {}
local ModifierIgnoreLabelToId = {}
local FALLBACK_CHALLENGE_MODIFIER_IDS = {
    "blindBarrage", "buffedBosses", "clonedChaos", "cruelCosts", "daringDodgers",
    "devilsDomain", "elementalEvasion", "fastFoes", "mercilessMarch",
    "rapidReinforcements", "wickedWinds",
}
local modifierIds = {}
local enumOk, chalEnum = pcall(function()
    return require(RS:WaitForChild("shared"):WaitForChild("enums"):WaitForChild("challenges"))
end)
if enumOk and type(chalEnum) == "table" then
    for _, id in pairs(chalEnum) do
        if type(id) == "string" and not table.find(modifierIds, id) then
            table.insert(modifierIds, id)
        end
    end
end
if #modifierIds == 0 then
    for _, id in ipairs(FALLBACK_CHALLENGE_MODIFIER_IDS) do
        table.insert(modifierIds, id)
    end
end
table.sort(modifierIds)

local chalConfigMod = nil
pcall(function()
    chalConfigMod = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("gamemodes"):WaitForChild("challenges"))
end)

local modRows = {}
for _, id in ipairs(modifierIds) do
    local displayName = PrettifyConfigId(id)
    if chalConfigMod and type(chalConfigMod.get) == "function" then
        local okCfg, cfg = pcall(function()
            return chalConfigMod.get(id)
        end)
        if okCfg and cfg and type(cfg.name) == "string" and cfg.name ~= "" then
            displayName = cfg.name
        end
    end
    local label = displayName .. " — " .. id
    table.insert(modRows, { label = label, sortKey = string.lower(displayName) })
    ModifierIgnoreLabelToId[label] = id
end
table.sort(modRows, function(a, b) return a.sortKey < b.sortKey end)
for _, r in ipairs(modRows) do
    table.insert(ChallengeModifierIgnoreOptions, r.label)
end
if #ChallengeModifierIgnoreOptions == 0 then
    ChallengeModifierIgnoreOptions = { "(no modifiers loaded)" }
end

local function GetChallengePoolItemIds(poolIndex)
    if poolIndex == nil then return nil end
    local items = RewardPoolMap[poolIndex]
    if items then return items end
    if type(poolIndex) == "number" then
        return RewardPoolMap[tostring(poolIndex)]
    end
    if type(poolIndex) == "string" then
        local n = tonumber(poolIndex)
        if n then return RewardPoolMap[n] end
    end
    return nil
end

-- Check if a reward pool contains any of the selected rewards
local function PoolMatchesSelectedRewards(poolIndex)
    if not next(_AO.SelectedRewards) then return true end -- nothing selected = any
    local items = GetChallengePoolItemIds(poolIndex)
    if not items then return false end
    for _, itemId in ipairs(items) do
        if _AO.SelectedRewards[itemId] then return true end
    end
    return false
end

-- Get active challenges from state
local function GetActiveChallenges(chalType)
    if not clientStore then return {} end
    local ok, state = pcall(function() return clientStore:getState() end)
    if not ok or not state or not state.challenges then return {} end
    return state.challenges[chalType] or {}
end

-- Check if challenge is already completed
local function IsChallengeCompleted(challengeId)
    if not clientStore then return false end
    local ok, state = pcall(function() return clientStore:getState() end)
    if not ok or not state or not state.data or not state.data.settings then return false end
    local settings = state.data.settings[userId]
    if type(settings) ~= "table" then return false end
    local completed = settings.completedChallengeEntries
    if type(completed) == "table" then
        return completed[challengeId] == true
    end
    return false
end


-- MacLib multi-dropdown may pass { ["Label — id"] = true } or an array { "Label — id", ... } (1..n keys).
local function MultiDropdownSelectionToIdSet(selected, labelToId, placeholderLabel)
    local out = {}
    if type(selected) ~= "table" then
        return out
    end
    local function addLabel(label)
        if type(label) ~= "string" or label == placeholderLabel then
            return
        end
        local id = labelToId[label]
        if id then
            out[id] = true
        end
    end
    local sawStringKeys = false
    for k, v in pairs(selected) do
        if type(k) == "string" and v == true then
            sawStringKeys = true
            addLabel(k)
        elseif type(k) == "number" and type(v) == "string" then
            addLabel(v)
        end
    end
    if not sawStringKeys then
        for _, v in ipairs(selected) do
            addLabel(v)
        end
    end
    return out
end

local function ApplyTargetRewardsFromDropdown(selected)
    _AO.SelectedRewards = MultiDropdownSelectionToIdSet(selected or {}, RewardLabelToId, "None")
end

local function IdInIgnoreSet(id, ignoreSet)
    if type(id) ~= "string" or id == "" or type(ignoreSet) ~= "table" then
        return false
    end
    if ignoreSet[id] then
        return true
    end
    local low = string.lower(id)
    for ignId, _ in pairs(ignoreSet) do
        if type(ignId) == "string" and string.lower(ignId) == low then
            return true
        end
    end
    return false
end

-- Skip challenge if stage or any modifier is on user ignore list
local function ShouldSkipChallengeDueToIgnoreList(chal)
    if not chal or type(chal) ~= "table" then
        return false
    end
    local sid = chal.stage or chal.stageId
    if IdInIgnoreSet(sid, _AO.IgnoredChallengeStages) then
        return true
    end
    local mods = chal.challenges
    if type(mods) == "table" then
        for _, modId in ipairs(mods) do
            if IdInIgnoreSet(modId, _AO.IgnoredChallengeModifiers) then
                return true
            end
        end
    end
    return false
end

-- Find best challenge matching selected types, rewards, not completed, and not ignored
local function FindMatchingChallenge()
    for _, chalType in ipairs({ "hourly", "daily", "weekly" }) do
        if _AO.SelectedChallengeTypes[chalType] then
            local challenges = GetActiveChallenges(chalType)
            for _, chal in ipairs(challenges) do
                if not IsChallengeCompleted(chal.id) then
                    if PoolMatchesSelectedRewards(chal.rewardPool) then
                        if not ShouldSkipChallengeDueToIgnoreList(chal) then
                            return chal, chalType
                        end
                    end
                end
            end
        end
    end
    return nil, nil
end

-- Find any challenge door and join
local function TeleportAndJoinChallengeDoor()
    if not isLobby then return false end
    local doorFolder = workspace:FindFirstChild("ChallengeDoor")
    if not doorFolder then return false end

    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    for _, child in pairs(doorFolder:GetChildren()) do
        local door = child:FindFirstChild("Door")
        if door and door:IsA("BasePart") and door:GetAttribute("roomId") then
            local roomId = door:GetAttribute("roomId")
            hrp.CFrame = door.CFrame + Vector3.new(0, 3, 0)
            task.wait(0.3)

            local ok, success, errorMsg = pcall(function()
                return roomsNet.joinLobby.call(roomId)
            end)

            if not ok then
                -- pcall error
            elseif success then
                return true, roomId
            elseif tostring(errorMsg):find("already") then
                return true, roomId
            end
        end
    end
    return false
end

-- Do challenge join
local function DoChallengeJoin()
    if not isLobby or not _AO.ModulesLoaded then return end

    local chal, chalType = FindMatchingChallenge()
    if not chal then return end

    local joined, roomId = TeleportAndJoinChallengeDoor()
    if not joined then return end
    task.wait(0.5)

    pcall(function()
        roomsNet.selectChallenge.call(chalType, chal.id)
    end)
    task.wait(0.3)

    pcall(function()
        roomsNet.queueMatchmaking.call(roomId, false)
    end)
    task.wait(0.5)

    pcall(function()
        roomsNet.getReady.call()
    end)
end

-- Challenge hourly return loop (Game Stage: return to lobby when new hour starts)
if not isLobby then
    task.spawn(function()
        while getgenv()._AORunning do
            if _AO.ChallengeAutoReturnEnabled and _AO.AutoChallengeEnabled and votingNet then
                local currentHour = os.date("!*t").hour -- UTC to match server reset
                local lastHour = _getChallengeLastHour()
                if currentHour ~= lastHour then
                    dbg("ChallengeReturn: new hour " .. currentHour .. " (last=" .. lastHour .. "), returning to lobby")
                    _setChallengeLastHour(currentHour)
                    -- Vote return to lobby
                    pcall(function() votingNet.returnLobby.call() end)
                    -- Keep voting until we actually leave
                    for _ = 1, 10 do
                        task.wait(3)
                        if not getgenv()._AORunning or not _AO.ChallengeAutoReturnEnabled then break end
                        pcall(function() votingNet.returnLobby.call() end)
                    end
                end
            end
            task.wait(10)
        end
    end)
end

-- Set challenge priority hook (forward declaration from auto join loop)
_doChallengeJoinIfAvailable = function()
    local chal = FindMatchingChallenge()
    if chal then
        pcall(DoChallengeJoin)
        return true
    end
    return false
end

-- UI
if isLobby then
    sections.ChalLeft:Header({ Text = "Challenge Selection" })

    sections.ChalLeft:Dropdown({
        Name = "Types",
        Multi = true,
        Options = { "hourly", "daily", "weekly" },
        Callback = function(selected)
            if not _AO.IsLoadingConfig then
                _AO.SelectedChallengeTypes = {}
                for t, s in pairs(selected) do
                    if s then _AO.SelectedChallengeTypes[t] = true end
                end
                if not next(_AO.SelectedChallengeTypes) then
                    _AO.SelectedChallengeTypes = { hourly = true, daily = true, weekly = true }
                end
            end
        end
    }, "ChallengeTypesDropdown")

    sections.ChalLeft:Dropdown({
        Name = "Target Rewards",
        Multi = true,
        Options = ChallengeRewardOptionLabels,
        Callback = function(selected)
            ApplyTargetRewardsFromDropdown(selected)
        end
    }, "ChallengeRewardsDropdown")

    sections.ChalLeft:Dropdown({
        Name = "Ignore maps (stage)",
        Multi = true,
        Options = ChallengeStageIgnoreOptions,
        Callback = function(selected)
            if not _AO.IsLoadingConfig then
                _AO.IgnoredChallengeStages = MultiDropdownSelectionToIdSet(selected, StageIgnoreLabelToId, "(no stages loaded)")
            end
        end
    }, "ChallengeIgnoreStagesDropdown")

    sections.ChalLeft:Dropdown({
        Name = "Ignore modifiers",
        Multi = true,
        Options = ChallengeModifierIgnoreOptions,
        Callback = function(selected)
            if not _AO.IsLoadingConfig then
                _AO.IgnoredChallengeModifiers = MultiDropdownSelectionToIdSet(selected, ModifierIgnoreLabelToId, "(no modifiers loaded)")
            end
        end
    }, "ChallengeIgnoreModifiersDropdown")

    sections.ChalLeft:Toggle({
        Name = "After challenge: force lobby",
        Default = true,
        Callback = function(v)
            _AO.ChallengeMatchForceLobby = v
        end
    }, "ChallengeMatchForceLobbyToggle")

    sections.ChalLeft:Divider()

    sections.ChalLeft:Button({
        Name = "Join Challenge",
        Callback = function()
            if _AO.ModulesLoaded then
                task.spawn(DoChallengeJoin)
            end
        end
    })
else
    sections.ChalLeft:Header({ Text = "Challenge settings can only be changed in Lobby" })

    -- Stub dropdowns to preserve config (reward config loads fine in game stage)
    sections.ChalLeft:Dropdown({
        Name = "Types", Multi = true, Options = { "hourly", "daily", "weekly" },
        Callback = function(selected)
            _AO.SelectedChallengeTypes = {}
            for t, s in pairs(selected) do if s then _AO.SelectedChallengeTypes[t] = true end end
            if not next(_AO.SelectedChallengeTypes) then _AO.SelectedChallengeTypes = { hourly = true, daily = true, weekly = true } end
        end
    }, "ChallengeTypesDropdown")
    sections.ChalLeft:Dropdown({
        Name = "Target Rewards", Multi = true, Options = ChallengeRewardOptionLabels,
        Callback = function(selected)
            ApplyTargetRewardsFromDropdown(selected)
        end
    }, "ChallengeRewardsDropdown")
    sections.ChalLeft:Dropdown({
        Name = "Ignore maps (stage)", Multi = true, Options = ChallengeStageIgnoreOptions,
        Callback = function(selected)
            _AO.IgnoredChallengeStages = MultiDropdownSelectionToIdSet(selected, StageIgnoreLabelToId, "(no stages loaded)")
        end
    }, "ChallengeIgnoreStagesDropdown")
    sections.ChalLeft:Dropdown({
        Name = "Ignore modifiers", Multi = true, Options = ChallengeModifierIgnoreOptions,
        Callback = function(selected)
            _AO.IgnoredChallengeModifiers = MultiDropdownSelectionToIdSet(selected, ModifierIgnoreLabelToId, "(no modifiers loaded)")
        end
    }, "ChallengeIgnoreModifiersDropdown")
end

sections.ChalLeft:Toggle({
    Name = "Auto Challenge",
    Default = false,
    Callback = function(v)
        _AO.AutoChallengeEnabled = v
    end
}, "AutoChallengeToggle")

sections.ChalLeft:Toggle({
    Name = "Return to lobby on hourly reset",
    Default = false,
    Callback = function(v)
        _AO.ChallengeAutoReturnEnabled = v
    end
}, "ChallengeAutoReturnToggle")

-- Right: Active challenges with rewards and completion status
local ChalInfoLabel = sections.ChalRight:Paragraph({
    Header = "Active Challenges",
    Body = "Loading..."
})

task.spawn(function()
    while getgenv()._AORunning do
        pcall(function()
            local lines = {}
            for _, freq in ipairs({ "hourly", "daily", "weekly" }) do
                local challenges = GetActiveChallenges(freq)
                if #challenges > 0 then
                    table.insert(lines, "— " .. freq:upper() .. " —")
                    for _, chal in ipairs(challenges) do
                        local modParts = {}
                        for _, mid in ipairs(chal.challenges or {}) do
                            local md = PrettifyConfigId(mid)
                            if chalConfigMod and type(chalConfigMod.get) == "function" then
                                local okc, cfgm = pcall(function()
                                    return chalConfigMod.get(mid)
                                end)
                                if okc and cfgm and type(cfgm.name) == "string" and cfgm.name ~= "" then
                                    md = cfgm.name
                                end
                            end
                            table.insert(modParts, md)
                        end
                        local mods = table.concat(modParts, " + ")
                        local completed = IsChallengeCompleted(chal.id)
                        local status = completed and " ✓" or ""
                        local ignored = (not completed) and ShouldSkipChallengeDueToIgnoreList(chal)
                        local ignoreTag = ignored and " [ignored]" or ""

                        local rewardText = ""
                        local poolItems = RewardPoolMap[chal.rewardPool]
                        if poolItems then
                            local rp = {}
                            for _, pid in ipairs(poolItems) do
                                local rn = GetRewardItemDisplayName(pid, nil, nil)
                                if rn == pid then rn = PrettifyConfigId(pid) end
                                table.insert(rp, rn)
                            end
                            rewardText = " → " .. table.concat(rp, ", ")
                        end

                        local stageLine = GetStageDisplayName(chal.stage)
                        table.insert(lines, (completed and "~~" or "") .. stageLine .. " (" .. mods .. ")" .. rewardText .. status .. ignoreTag .. (completed and "~~" or ""))
                    end
                    table.insert(lines, "")
                end
            end
            if #lines > 0 then
                ChalInfoLabel:UpdateBody(table.concat(lines, "\n"))
            else
                ChalInfoLabel:UpdateBody("No active challenges")
            end
        end)
        task.wait(10)
    end
end)

sections.ChalRight:Divider()
sections.ChalRight:Paragraph({
    Header = "Hourly Return",
    Body = "When enabled, the script returns to lobby when a new hour starts (challenges reset at :00 UTC). In lobby, it completes all available challenges first, then resumes normal Auto Join.",
})

-- ═══════════════════════════════════════════
-- UI: AUTO TAB (Game Stage)
-- ═══════════════════════════════════════════

sections.AutoLeft:Header({ Text = "Match Automation" })

sections.AutoLeft:Toggle({
    Name = "Auto Start Match",
    Default = false,
    Callback = function(v)
        _AO.AutoStartEnabled = v
    end
}, "AutoStartToggle")

sections.AutoLeft:Toggle({
    Name = "Auto Skip Wave",
    Default = false,
    Callback = function(v)
        _AO.AutoSkipWaveEnabled = v
    end
}, "AutoSkipWaveToggle")

_AO.AutoRestartWaveEnabled = false
_AO.RestartAfterWave = 10

sections.AutoLeft:Toggle({
    Name = "Auto Restart After Wave",
    Default = false,
    Callback = function(v)
        _AO.AutoRestartWaveEnabled = v
    end
}, "AutoRestartWaveToggle")

sections.AutoLeft:Slider({
    Name = "Restart At Wave",
    Default = 10,
    Minimum = 1,
    Maximum = 100,
    Precision = 0,
    DisplayMethod = "Value",
    Callback = function(v)
        _AO.RestartAfterWave = v
    end
}, "RestartWaveSlider")

-- Auto Restart After Wave loop
task.spawn(function()
    while getgenv()._AORunning do
        if not isLobby and _AO.AutoRestartWaveEnabled and votingNet and gameClientStore then
            pcall(function()
                local state = gameClientStore:getState()
                if state and state.wave and state.wave.waveNumber then
                    local currentWave = state.wave.waveNumber
                    if currentWave >= _AO.RestartAfterWave then
                        dbg("Auto Restart: wave " .. currentWave .. " >= " .. _AO.RestartAfterWave .. ", voting resetAct")
                        pcall(function() votingNet.resetAct.call() end)
                        _AO.MatchEnded = true
                        _AO.IsPlaying = false
                    end
                end
            end)
        end
        task.wait(2)
    end
end)

sections.AutoLeft:Divider()
sections.AutoLeft:Header({ Text = "After Match Ends" })

sections.AutoLeft:Toggle({
    Name = "Auto Next Stage",
    Default = false,
    Callback = function(v)
        _AO.AutoNextEnabled = v
        if v then _AO.AutoReplayEnabled = false; _AO.AutoReturnLobby = false end
    end
}, "AutoNextToggle")

sections.AutoLeft:Toggle({
    Name = "Auto Replay",
    Default = false,
    Callback = function(v)
        _AO.AutoReplayEnabled = v
        if v then _AO.AutoNextEnabled = false; _AO.AutoReturnLobby = false end
    end
}, "AutoReplayToggle")

sections.AutoLeft:Toggle({
    Name = "Auto Return to Lobby",
    Default = false,
    Callback = function(v)
        _AO.AutoReturnLobby = v
        if v then _AO.AutoNextEnabled = false; _AO.AutoReplayEnabled = false end
    end
}, "AutoReturnLobbyToggle")


sections.AutoLeft:Divider()
sections.AutoLeft:Header({ Text = "Auto Ultimate" })
sections.AutoLeft:Paragraph({
    Header = "Game stage only",
    Body = "Fires ultimates when the game would allow it (cooldown, bars, boss, range). Use the toggles below to tune behavior.",
})

sections.AutoLeft:Toggle({
    Name = "Auto Ultimate",
    Default = false,
    Callback = function(v)
        _AO.AutoUltimateEnabled = v
    end
}, "AutoUltimateToggle")

sections.AutoLeft:Dropdown({
    Name = "When to use ults",
    Multi = false,
    Required = false,
    Options = { "Always", "While boss alive", "On boss spawn" },
    Default = "While boss alive",
    Callback = function(v)
        if v then
            local map = { ["Always"] = "off", ["While boss alive"] = "while_alive", ["On boss spawn"] = "spawn_window" }
            AutoUltSettings.BOSS_MODE = map[v] or v
        end
    end
}, "AutoUltBossModeDropdown")

sections.AutoLeft:Toggle({
    Name = "Mini-bosses trigger ults too",
    Default = true,
    Callback = function(v)
        AutoUltSettings.INCLUDE_MINI_BOSS = v
    end
}, "AutoUltIncludeMiniBossToggle")

sections.AutoLeft:Toggle({
    Name = "Skip range check if boss on map",
    Default = true,
    Callback = function(v)
        AutoUltSettings.RELAX_ENEMY_RANGE_WITH_BOSS = v
    end
}, "AutoUltRelaxRangeToggle")

sections.AutoLeft:Toggle({
    Name = "Allow back-to-back ults (different units)",
    Default = true,
    Callback = function(v)
        AutoUltSettings.RELAX_GLOBAL_ON_ULTIMATE_FOR_CHAIN = v
    end
}, "AutoUltRelaxGlobalUltToggle")

sections.AutoLeft:Slider({
    Name = "Boss spawn window (sec)",
    Default = 12,
    Minimum = 1,
    Maximum = 45,
    Precision = 0,
    DisplayMethod = "Value",
    Callback = function(v)
        AutoUltSettings.BOSS_SPAWN_WINDOW_SEC = v
    end
}, "AutoUltBossWindowSlider")

sections.AutoLeft:Slider({
    Name = "Delay between ults (sec)",
    Default = 0.35,
    Minimum = 0.05,
    Maximum = 1.5,
    Precision = 2,
    DisplayMethod = "Value",
    Callback = function(v)
        AutoUltSettings.MIN_INTERVAL_BETWEEN_ANY_ULT_SEC = v
    end
}, "AutoUltMinIntervalSlider")

sections.AutoLeft:Slider({
    Name = "Max ults per boss (0 = no limit)",
    Default = 6,
    Minimum = 0,
    Maximum = 20,
    Precision = 0,
    DisplayMethod = "Value",
    Callback = function(v)
        AutoUltSettings.MAX_ULTS_PER_BOSS_WINDOW = v
    end
}, "AutoUltMaxUltsWindowSlider")

sections.AutoLeft:Divider()
sections.AutoLeft:Header({ Text = "Quests" })

sections.AutoLeft:Button({
    Name = "Claim All Completed Quests",
    Callback = function()
        task.spawn(ClaimCompletedQuests)
    end
})

sections.AutoLeft:Toggle({
    Name = "Auto Claim Quests",
    Default = false,
    Callback = function(v)
        _AO.AutoClaimQuestsEnabled = v
    end
}, "AutoClaimQuestsToggle")

sections.AutoLeft:Button({
    Name = "Claim Daily / Event Login Rewards Now",
    Callback = function()
        if not isLobby then
            Notify("Lobby only")
            return
        end
        task.spawn(function()
            pcall(RunAutoClaimDailyRewards)
        end)
    end
})

sections.AutoLeft:Toggle({
    Name = "Auto Claim Daily & Event Rewards",
    Default = false,
    Callback = function(v)
        _AO.AutoClaimDailyRewardsEnabled = v
    end
}, "AutoClaimDailyRewardsToggle")

sections.CardsCenter:Header({ Text = "How It Works" })

sections.CardsCenter:Paragraph({
    Header = "Priority System",
    Body = "When the game offers you a choice of cards/contracts, the script automatically picks the one with the highest priority value.\n\n• Set priority 1-20 for cards you want\n• Higher number = picked first\n• Cards with priority 0 are ignored\n• If multiple cards have the same priority, the first one offered is picked\n• If none of the offered cards have priority > 0, the first option is auto-selected"
})

sections.CardsCenter:Paragraph({
    Header = "Legends (Left)",
    Body = "Cards appear between waves in Legends mode. Set high priority on cards that buff your team (e.g. Inflation, Just Business) and low priority on enemy buff cards you'd rather avoid."
})

sections.CardsCenter:Paragraph({
    Header = "Chain of Control (Right)",
    Body = "Contracts appear between waves in Chain of Control mode. They work the same way — pick your preferred contracts with higher priority values."
})

sections.CardsCenter:Divider()

sections.CardsLeft:Header({ Text = "Legends Card Priority" })

_AO.CardPriorities = {}
local AllCards = {
    { id = "armoredJuggernaut", name = "Armored Juggernaut" },
    { id = "blazingFast", name = "Blazing Fast" },
    { id = "chainsOfAlliance", name = "Chains of Alliance" },
    { id = "devilsBlessing", name = "Devil's Blessing" },
    { id = "enhancedEvasion", name = "Enhanced Evasion" },
    { id = "enragedBeasts", name = "Enraged Beasts" },
    { id = "fastKarma", name = "Fast Karma" },
    { id = "inflation", name = "Inflation" },
    { id = "justBusiness", name = "Just Business" },
    { id = "poorYields", name = "Poor Yields" },
    { id = "primaryBomb", name = "Primary Bomb" },
    { id = "shadowClones", name = "Shadow Clones" },
    { id = "speedOSound", name = "Speed O' Sound" },
    { id = "straightFromHell", name = "Straight From Hell" },
    { id = "traceOn", name = "Trace On" },
    { id = "unrelentingAdvance", name = "Unrelenting Advance" },
}
for _, c in ipairs(AllCards) do _AO.CardPriorities[c.id] = 0 end

_AO.AutoCardPickEnabled = false

-- Рестарт акта (resetAct) после 1-й волны: хотя бы одна «плохая» карта в тройке
_AO.RestartWave1IfAnyDebuffEnabled = false
_AO.RestartWave1IfAnyZeroPrioEnabled = false
_AO.Wave1DebuffOffer = {}
for _, c in ipairs(AllCards) do
    _AO.Wave1DebuffOffer[c.id] = false
end

for _, card in ipairs(AllCards) do
    sections.CardsLeft:Slider({
        Name = card.name,
        Default = 0,
        Minimum = 0,
        Maximum = 20,
        Precision = 0,
        DisplayMethod = "Value",
        Callback = function(v)
            _AO.CardPriorities[card.id] = v
        end
    }, "CardPrio_" .. card.id)
end

sections.CardsLeft:Toggle({
    Name = "Auto Card Pick",
    Default = false,
    Callback = function(v)
        _AO.AutoCardPickEnabled = v
    end
}, "AutoCardPickToggle")

sections.CardsLeft:Divider()
sections.CardsLeft:Header({ Text = "Волна 1 · рестарт акта" })
sections.CardsLeft:Paragraph({
    Header = "Как работает",
    Body = "После первой волны Legends: resetAct, если в тройке есть хотя бы одна «плохая» карта.\n\n• «Хотя бы одна с приоритетом 0»: если среди трёх есть карта со слайдером 0 — рестарт (продолжаем только если все три с приоритетом ≥1).\n• «Хотя бы одна — дебафф»: если среди трёх есть карта, отмеченная переключателем ниже — рестарт (одной катастрофической карты в пуле достаточно).",
})

sections.CardsLeft:Toggle({
    Name = "Рестарт, если у любой из трёх приоритет 0",
    Default = false,
    Callback = function(v)
        _AO.RestartWave1IfAnyZeroPrioEnabled = v
    end
}, "RestartWave1AnyZeroPrioToggle")

sections.CardsLeft:Toggle({
    Name = "Рестарт, если любая из трёх — дебафф (список ниже)",
    Default = false,
    Callback = function(v)
        _AO.RestartWave1IfAnyDebuffEnabled = v
    end
}, "RestartWave1AnyDebuffToggle")

for _, card in ipairs(AllCards) do
    sections.CardsLeft:Toggle({
        Name = "Дебафф: " .. card.name,
        Default = false,
        Callback = function(v)
            _AO.Wave1DebuffOffer[card.id] = v
        end
    }, "Wave1Debuff_" .. card.id)
end

-- ═══════════════════════════════════════════
-- CONTRACT PRIORITY (Chain of Control)
-- ═══════════════════════════════════════════

sections.CardsRight:Header({ Text = "Chain of Control Contract Priority" })

_AO.ContractPriorities = {}
local AllContracts = {
    { id = "atonementByBlood", name = "Atonement by Blood" },
    { id = "bloodiedHalo", name = "Bloodied Halo" },
    { id = "costOfVictory", name = "Cost of Victory" },
    { id = "crimsonQueen", name = "Crimson Queen" },
    { id = "devilsDomain", name = "Devil's Domain" },
    { id = "hellsTax", name = "Hell's Tax" },
    { id = "highTolerance", name = "High Tolerance" },
    { id = "sacrificialContract", name = "Sacrificial Contract" },
}
for _, c in ipairs(AllContracts) do _AO.ContractPriorities[c.id] = 0 end

_AO.AutoContractPickEnabled = false

for _, contract in ipairs(AllContracts) do
    sections.CardsRight:Slider({
        Name = contract.name,
        Default = 0,
        Minimum = 0,
        Maximum = 20,
        Precision = 0,
        DisplayMethod = "Value",
        Callback = function(v)
            _AO.ContractPriorities[contract.id] = v
        end
    }, "ContractPrio_" .. contract.id)
end

sections.CardsRight:Toggle({
    Name = "Auto Contract Pick",
    Default = false,
    Callback = function(v)
        _AO.AutoContractPickEnabled = v
    end
}, "AutoContractPickToggle")

-- Auto Card + Contract Pick (Game Stage only)
-- Both come through showInfCards — detect by checking if IDs match contracts
if not isLobby then
    pcall(function()
        local gamemodesNet = require(RS:WaitForChild("gameClient"):WaitForChild("net"):WaitForChild("gamemodesNet"))

        -- Both Legends cards AND Chain of Control contracts come through showInfCards
        gamemodesNet.showInfCards.on(function(availableCards)
            if not availableCards or #availableCards == 0 then return end

            -- Detect mode: check if first item is a contract
            local isContract = false
            for _, c in ipairs(AllContracts) do
                if c.id == availableCards[1] then isContract = true break end
            end

            if isContract then
                -- Chain of Control contracts
                if not _AO.AutoContractPickEnabled then return end
                dbg("showInfCards: CONTRACTS detected (" .. #availableCards .. ")")
                task.wait(1)

                local bestPick = nil
                local bestPrio = 0
                for _, contractId in ipairs(availableCards) do
                    local prio = _AO.ContractPriorities[contractId] or 0
                    dbg("  contract: " .. tostring(contractId) .. " prio=" .. tostring(prio))
                    if prio > bestPrio then
                        bestPrio = prio
                        bestPick = contractId
                    end
                end
                if not bestPick then bestPick = availableCards[1] end
                dbg("Contract pick: " .. tostring(bestPick) .. " prio=" .. tostring(bestPrio))
                pcall(function() gamemodesNet.selectInfCard.call(bestPick) end)
            else
                -- Legends cards
                local function aoIsFirstWaveCardPhase()
                    if not gameClientStore then
                        return false
                    end
                    local ok, st = pcall(function()
                        return gameClientStore:getState()
                    end)
                    if not ok or not st or not st.wave then
                        return false
                    end
                    local w = st.wave.waveNumber
                    return type(w) == "number" and w <= 2
                end

                local shouldRestartWave1 = false
                if votingNet and aoIsFirstWaveCardPhase() then
                    if _AO.RestartWave1IfAnyZeroPrioEnabled then
                        for _, cardId in ipairs(availableCards) do
                            if (_AO.CardPriorities[cardId] or 0) <= 0 then
                                shouldRestartWave1 = true
                                break
                            end
                        end
                    end
                    if not shouldRestartWave1 and _AO.RestartWave1IfAnyDebuffEnabled then
                        for _, cardId in ipairs(availableCards) do
                            if _AO.Wave1DebuffOffer[cardId] then
                                shouldRestartWave1 = true
                                break
                            end
                        end
                    end
                end

                if shouldRestartWave1 then
                    dbg("showInfCards: wave1 restart (unwanted cards only)")
                    Notify("Рестарт акта: нежелательный набор карт после 1-й волны")
                    _AO.MatchEnded = true
                    _AO.IsPlaying = false
                    pcall(function()
                        votingNet.resetAct.call()
                    end)
                    return
                end

                if not _AO.AutoCardPickEnabled then
                    return
                end
                dbg("showInfCards: CARDS detected (" .. #availableCards .. ")")
                task.wait(1)

                local bestCard = nil
                local bestPrio = 0
                for _, cardId in ipairs(availableCards) do
                    local prio = _AO.CardPriorities[cardId] or 0
                    if prio > bestPrio then
                        bestPrio = prio
                        bestCard = cardId
                    end
                end
                if not bestCard then
                    bestCard = availableCards[1]
                end
                pcall(function()
                    gamemodesNet.selectInfCard.call(bestCard)
                end)
            end
        end)
    end)
end

-- Right side: Webhook
sections.AutoRight:Header({ Text = "Webhook" })

sections.AutoRight:Toggle({
    Name = "Enable Webhook",
    Default = false,
    Callback = function(v)
        _AO.WebhookEnabled = v
    end
}, "WebhookEnabledToggle")

sections.AutoRight:Toggle({
    Name = "Webhook: show equipped team",
    Default = false,
    Callback = function(v)
        _AO.WebhookEquippedTeamEnabled = v
    end
}, "WebhookEquippedTeamToggle")

sections.AutoRight:Input({
    Name = "Webhook URL",
    Default = "",
    Placeholder = "https://discord.com/api/webhooks/...",
    Callback = function(v)
        _AO.WebhookURL = v
    end
}, "WebhookURLInput")

local _webhookCurrencyLabels = {}
for _, r in ipairs(WEBHOOK_CURRENCY_ROW_DEFS) do
    table.insert(_webhookCurrencyLabels, r.label)
end
sections.AutoRight:Dropdown({
    Name = "Webhook: Currencies block",
    Description = "Balances listed under Currencies in Discord",
    Search = true,
    Multi = true,
    Options = _webhookCurrencyLabels,
    Callback = function(selected)
        _AO.WebhookCurrenciesShown = {}
        for _, r in ipairs(WEBHOOK_CURRENCY_ROW_DEFS) do
            _AO.WebhookCurrenciesShown[r.key] = selected[r.label] == true
        end
    end
}, "WebhookCurrenciesDropdown")

sections.AutoRight:Divider()

sections.AutoRight:Paragraph({
    Header = "Info",
    Body = "After match ends:\n• Next / Replay / Return Lobby\n• Webhook sends rewards + stats\n• Optional: equipped team (slot, Shiny, level, worthiness) before Rewards\n• Rewards totals use collection + core + raid currencies\n• Currencies block: multi-select above\n\nPriority: Return Lobby > Next > Replay\nOnly one can be active."
})

-- Auto Vending + Gold Shop + Chain Shop (Lobby only)
-- Wrapped in IIFE: Luau limits ~200 locals per chunk; this file is one chunk.
; (function()
local AutoVendingEnabled = false
local AutoGoldShopEnabled = false
local GoldShopSelectedItems = {} -- {itemIndex = true}
local AutoChainShopEnabled = false
local ChainShopSelectedItems = {} -- {name = true}

-- Build gold shop item list from config
local GoldShopItems = {} -- {index, id, name, cost, stock, currency}
pcall(function()
    local shopConfig = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("shops"):WaitForChild("speedwagonShop"))
    for idx, item in pairs(shopConfig) do
        if type(item) == "table" and item.id then
            table.insert(GoldShopItems, {
                index = item.index or idx,
                id = item.id,
                name = item.name or item.id,
                cost = item.cost or 0,
                stock = item.stock or 1,
                currency = item.currency or "token",
                rotation = item.rotationPeriod or "permanent",
            })
        end
    end
    table.sort(GoldShopItems, function(a, b) return a.index < b.index end)
end)

-- Build chain of control shop item list from config
local ChainShopItems = {}
pcall(function()
    local shopConfig = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("shops"):WaitForChild("chainsOfControlShop"))
    for idx, item in pairs(shopConfig) do
        if type(item) == "table" and item.id then
            table.insert(ChainShopItems, {
                index = item.index or idx,
                id = item.id,
                name = item.name or item.id,
                cost = item.cost or 0,
                stock = item.stock or 1,
                currency = item.currency or "bloodiedChains",
                rotation = item.rotationPeriod or "permanent",
            })
        end
    end
    table.sort(ChainShopItems, function(a, b) return a.index < b.index end)
end)

local function GetChainShopDisplayNames()
    local names = {}
    for _, item in ipairs(ChainShopItems) do
        table.insert(names, item.name .. " (" .. tostring(item.cost) .. "bc)")
    end
    if #names == 0 then table.insert(names, "None") end
    return names
end

local function GetGoldShopDisplayNames()
    local names = {}
    for _, item in ipairs(GoldShopItems) do
        local cur = item.currency == "gold" and "g" or "t"
        table.insert(names, item.name .. " (" .. tostring(item.cost) .. cur .. ")")
    end
    if #names == 0 then table.insert(names, "None") end
    return names
end

-- Get remaining stock for a shop item (speedwagon)
local function GetShopStock(itemIndex)
    if not clientStore then return 0 end
    local ok, state = pcall(function() return clientStore:getState() end)
    if not ok or not state or not state.data or not state.data.speedwagonShop then return 0 end
    local shop = state.data.speedwagonShop[userId]
    if not shop or not shop.stock then return 999 end
    local stockData = shop.stock[itemIndex]
    if not stockData then return 999 end
    return stockData.remaining or 0
end

-- Get remaining stock for a chain of control shop item
local function GetChainShopStock(itemIndex)
    if not clientStore then return 0 end
    local ok, state = pcall(function() return clientStore:getState() end)
    if not ok or not state or not state.data or not state.data.chainOfControlShop then return 0 end
    local shop = state.data.chainOfControlShop[userId]
    if not shop or not shop.stock then return 999 end
    local stockData = shop.stock[itemIndex]
    if not stockData then return 999 end
    return stockData.remaining or 0
end

-- Get vending claims for a machine
local function GetVendingClaims(machineId)
    if not clientStore then return 0 end
    local ok, state = pcall(function() return clientStore:getState() end)
    if not ok or not state or not state.data or not state.data.vendingMachines then return 0 end
    local vm = state.data.vendingMachines[userId]
    if not vm or not vm.claims then return 0 end
    return vm.claims[machineId] or 0
end

-- Auto Vending Loop
task.spawn(function()
    while getgenv()._AORunning do
        if AutoVendingEnabled and isLobby and _AO.ModulesLoaded and playerNet then
            pcall(function()
                local CS = game:GetService("CollectionService")
                local machines = CS:GetTagged("vendingMachine")
                dbg("Vending: found " .. #machines .. " machines")
                for _, machine in pairs(machines) do
                    if not AutoVendingEnabled or not getgenv()._AORunning then break end
                    local machineId = machine:GetAttribute("vendingMachineId")
                    dbg("Vending: machine=" .. tostring(machine) .. " machineId=" .. tostring(machineId))
                    if machineId then
                        machineId = tostring(machineId)
                        local claims = GetVendingClaims(machineId)
                        dbg("Vending: machineId=" .. machineId .. " claims=" .. tostring(claims))
                        if claims < 5 then
                            -- Teleport to machine
                            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            local target = machine:IsA("BasePart") and machine or machine:FindFirstChildWhichIsA("BasePart", true)
                            if hrp and target then
                                hrp.CFrame = target.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.5)
                            end
                            while claims < 5 and AutoVendingEnabled and getgenv()._AORunning do
                                local ok, result = pcall(function()
                                    return playerNet.useVendingMachine.call(machineId)
                                end)
                                dbg("Vending: call ok=" .. tostring(ok) .. " result=" .. tostring(result))
                                if ok and result then
                                    claims = claims + 1
                                    task.wait(1.5)
                                else
                                    break
                                end
                            end
                        end
                    end
                end
            end)
        end
        task.wait(10)
    end
end)

-- Auto Gold Shop Loop
task.spawn(function()
    while getgenv()._AORunning do
        if AutoGoldShopEnabled and isLobby and _AO.ModulesLoaded then
            dbg("GoldShop: loop tick, items=" .. #GoldShopItems .. " selected:")
            for k in pairs(GoldShopSelectedItems) do dbg("  selected: '" .. k .. "'") end
            pcall(function()
                local coreNet = require(RS:WaitForChild("lobbyClient"):WaitForChild("net"):WaitForChild("core"))
                for _, item in ipairs(GoldShopItems) do
                    if not AutoGoldShopEnabled or not getgenv()._AORunning then break end
                    local cur = item.currency == "gold" and "g" or "t"
                    local displayName = item.name .. " (" .. tostring(item.cost) .. cur .. ")"
                    dbg("GoldShop: checking '" .. displayName .. "' selected=" .. tostring(GoldShopSelectedItems[displayName] or false))
                    if GoldShopSelectedItems[displayName] then
                        local stock = GetShopStock(item.index)
                        dbg("GoldShop: " .. item.id .. " stock=" .. tostring(stock))
                        while stock > 0 and AutoGoldShopEnabled and getgenv()._AORunning do
                            local ok, result = pcall(function()
                                return coreNet.speedwagonPurchase.call(item.id, 1)
                            end)
                            dbg("GoldShop: purchase " .. item.id .. " ok=" .. tostring(ok) .. " result=" .. tostring(result))
                            if ok and result then
                                stock = stock - 1
                                task.wait(0.5)
                            else
                                break
                            end
                        end
                    end
                end
            end)
        end
        task.wait(5)
    end
end)

-- Auto Chain Shop Loop
task.spawn(function()
    while getgenv()._AORunning do
        if AutoChainShopEnabled and isLobby and _AO.ModulesLoaded then
            dbg("ChainShop: loop tick, items=" .. #ChainShopItems .. " selected:")
            for k in pairs(ChainShopSelectedItems) do dbg("  selected: '" .. k .. "'") end
            pcall(function()
                local coreNet = require(RS:WaitForChild("lobbyClient"):WaitForChild("net"):WaitForChild("core"))
                for _, item in ipairs(ChainShopItems) do
                    if not AutoChainShopEnabled or not getgenv()._AORunning then break end
                    local displayName = item.name .. " (" .. tostring(item.cost) .. "bc)"
                    dbg("ChainShop: checking '" .. displayName .. "' selected=" .. tostring(ChainShopSelectedItems[displayName] or false))
                    if ChainShopSelectedItems[displayName] then
                        local stock = GetChainShopStock(item.index)
                        dbg("ChainShop: " .. item.id .. " stock=" .. tostring(stock))
                        while stock > 0 and AutoChainShopEnabled and getgenv()._AORunning do
                            local ok, result = pcall(function()
                                return coreNet.chainOfControlPurchase.call(item.id, 1)
                            end)
                            dbg("ChainShop: purchase " .. item.id .. " ok=" .. tostring(ok) .. " result=" .. tostring(result))
                            if ok and result then
                                stock = stock - 1
                                task.wait(0.5)
                            else
                                break
                            end
                        end
                    end
                end
            end)
        end
        task.wait(5)
    end
end)

-- UI
sections.AutoRight:Divider()
sections.AutoRight:Header({ Text = "Lobby Automation" })

sections.AutoRight:Toggle({
    Name = "Auto Vending Machines",
    Default = false,
    Callback = function(v)
        AutoVendingEnabled = v
    end
}, "AutoVendingToggle")

local goldShopNames = GetGoldShopDisplayNames()
sections.AutoRight:Dropdown({
    Name = "Speedwagon Shop Items",
    Search = true,
    Multi = true,
    Options = goldShopNames,
    Callback = function(selected)
        GoldShopSelectedItems = {}
        for name, isSelected in pairs(selected) do
            if isSelected then
                GoldShopSelectedItems[name] = true
            end
        end
    end
}, "GoldShopItemsDropdown")

sections.AutoRight:Toggle({
    Name = "Auto Speedwagon Shop",
    Default = false,
    Callback = function(v)
        AutoGoldShopEnabled = v
    end
}, "AutoGoldShopToggle")

local chainShopNames = GetChainShopDisplayNames()
sections.AutoRight:Dropdown({
    Name = "Chain Shop Items",
    Search = true,
    Multi = true,
    Options = chainShopNames,
    Callback = function(selected)
        ChainShopSelectedItems = {}
        for name, isSelected in pairs(selected) do
            if isSelected then
                ChainShopSelectedItems[name] = true
            end
        end
    end
}, "ChainShopItemsDropdown")

sections.AutoRight:Toggle({
    Name = "Auto Chain Shop",
    Default = false,
    Callback = function(v)
        AutoChainShopEnabled = v
    end
}, "AutoChainShopToggle")

end)()


-- ═══════════════════════════════════════════
-- UI: TELEPORT TAB (Lobby waypoints)
-- ═══════════════════════════════════════════

sections.TeleportLeft:Header({ Text = "Lobby zones" })
sections.TeleportLeft:Paragraph({
    Header = "Info",
    Body = "Fixed positions in the AO lobby — Evo, Speed shop & Summon, Event shop / Play, Expeditions, Excavation, Raid, Mount, Play zone, Trait, Prestige, Craft, Stats, Challenges.",
})

sections.TeleportLeft:Button({
    Name = "Evo zone",
    Callback = function()
        LobbyTeleportToZone("Evo zone", Vector3.new(8032.38, 171.17, 574.94))
    end,
})
sections.TeleportLeft:Button({
    Name = "Speed shop & Summon",
    Callback = function()
        LobbyTeleportToZone("Speed shop & Summon", Vector3.new(-2448.92, 355.80, -224.03))
    end,
})
sections.TeleportLeft:Button({
    Name = "Event shop / Play",
    Callback = function()
        LobbyTeleportToZone("Event shop / Play", Vector3.new(-2535.22, 355.33, -466.71))
    end,
})
sections.TeleportLeft:Button({
    Name = "Expeditions",
    Callback = function()
        LobbyTeleportToZone("Expeditions", Vector3.new(-2423.10, 356.07, -465.72))
    end,
})
sections.TeleportLeft:Button({
    Name = "Excavation",
    Callback = function()
        LobbyTeleportToZone("Excavation", Vector3.new(-2696.55, 345.04, -1303.51))
    end,
})
sections.TeleportLeft:Button({
    Name = "Raid / Raid shop",
    Callback = function()
        LobbyTeleportToZone("Raid / Raid shop", Vector3.new(-2241.96, 344.78, -464.08))
    end,
})
sections.TeleportLeft:Button({
    Name = "Mount shop",
    Callback = function()
        LobbyTeleportToZone("Mount shop", Vector3.new(-2225.52, 353.66, -684.81))
    end,
})

sections.TeleportRight:Header({ Text = "More waypoints" })
sections.TeleportRight:Button({
    Name = "Play zone",
    Callback = function()
        LobbyTeleportToZone("Play zone", Vector3.new(-2717.14, 353.27, -462.84))
    end,
})
sections.TeleportRight:Button({
    Name = "Trait",
    Callback = function()
        LobbyTeleportToZone("Trait", Vector3.new(-2692.37, 353.09, -714.40))
    end,
})
sections.TeleportRight:Button({
    Name = "Prestige",
    Callback = function()
        LobbyTeleportToZone("Prestige", Vector3.new(-2702.23, 353.09, -682.36))
    end,
})
sections.TeleportRight:Button({
    Name = "Craft",
    Callback = function()
        LobbyTeleportToZone("Craft", Vector3.new(-2767.98, 353.19, -691.42))
    end,
})
sections.TeleportRight:Button({
    Name = "Stats",
    Callback = function()
        LobbyTeleportToZone("Stats", Vector3.new(-2751.38, 353.19, -742.39))
    end,
})
sections.TeleportRight:Button({
    Name = "Challenges",
    Callback = function()
        LobbyTeleportToZone("Challenges", Vector3.new(-2126.10, 351.11, -1038.60))
    end,
})

if not isLobby then
    sections.TeleportRight:Divider()
    sections.TeleportRight:Paragraph({
        Header = "Not available",
        Body = "Teleport buttons only work in the Anime Overload lobby. Join the lobby place to use them.",
    })
end



-- ═══════════════════════════════════════════
-- UI: AUTO PLACE TAB (Game Stage)
-- ═══════════════════════════════════════════
;(function()

-- Auto Upgrade settings (always available, not premium-gated)
local AutoUpgradeEnabled = false
local AutoUpgradeMode = "all_equal"  -- "all_equal" / "farms_first"
local AutoUpgradeSellAllEnabled = false
local AutoUpgradeSellAllWave = 0
local _allUnitsSoldThisRound = false -- blocks auto place until new round

if _G.fanmyrka == true then
(function()

-- Placement settings
local AP_Mode = "Spiral"           -- "Spiral" / "Along Path" / "At Point"
local AP_GridRadius = 28
local AP_SpiralStep = 3
local AP_ShowGrid = true
local AP_MaxFails = 40
local AP_PathStartPct = 10
local AP_PathStep = 4
local AP_RowOffsetInner = 3
local AP_RowGap = 3
local AP_HeroFilter = "all"        -- "all" / "equipped_only" / "air_only" / "selected_only"
local AP_SpecialHeroIds = {}       -- when filter == selected_only: { [heroId] = true }
local AP_MinWaveToPlace = 1       -- Auto Place starts when wave >= this value (each match cycle)

-- ── Path helpers ──
local function _ap_sortCFV(list)
    table.sort(list, function(a, b)
        local na, nb = tonumber(a.Name), tonumber(b.Name)
        if na and nb then return na < nb end
        return a.Name < b.Name
    end)
end

local function _ap_collectPathGroups(pathsFolder)
    local groups = {}
    for _, diff in ipairs(pathsFolder:GetChildren()) do
        if diff:IsA("Folder") or diff:IsA("Model") then
            local byParent = {}
            for _, d in ipairs(diff:GetDescendants()) do
                if d:IsA("CFrameValue") then
                    local par = d.Parent
                    byParent[par] = byParent[par] or {}
                    table.insert(byParent[par], d)
                end
            end
            for parent, cfs in pairs(byParent) do
                if #cfs >= 2 then
                    _ap_sortCFV(cfs)
                    table.insert(groups, { key = diff.Name .. "/" .. parent.Name, values = cfs })
                end
            end
        end
    end
    return groups
end

local function _ap_teleportPos(modelName)
    local tele = workspace:FindFirstChild("teleports")
    if not tele then return nil end
    local m = tele:FindFirstChild(modelName)
    if not m then return nil end
    local rp = m:FindFirstChild("RootPart", true) or m:FindFirstChildWhichIsA("BasePart", true)
    return rp and rp.Position or nil
end

local function _ap_pickPathGroup(groups, enemyPos)
    if #groups == 0 then return nil end
    if not enemyPos then
        local best = groups[1]
        for _, g in ipairs(groups) do
            if #g.values > #best.values then best = g end
        end
        return best
    end
    local best, bestScore = nil, math.huge
    for _, g in ipairs(groups) do
        local p1, p2 = g.values[1].Value.Position, g.values[#g.values].Value.Position
        local score = math.min((p1 - enemyPos).Magnitude, (p2 - enemyPos).Magnitude) * 10000 - #g.values
        if score < bestScore then bestScore = score; best = g end
    end
    return best
end

local function _ap_orientFromEnemy(pts, enemyPos)
    if not enemyPos or #pts < 2 then return pts end
    if (pts[#pts] - enemyPos).Magnitude < (pts[1] - enemyPos).Magnitude then
        local rev = {}
        for i = #pts, 1, -1 do table.insert(rev, pts[i]) end
        return rev
    end
    return pts
end

local function _ap_polyLength(pts)
    local L = 0
    for i = 1, #pts - 1 do L = L + (pts[i + 1] - pts[i]).Magnitude end
    return L
end

local function _ap_pointAtDist(pts, dist)
    dist = math.max(0, dist)
    local acc = 0
    for i = 1, #pts - 1 do
        local seg = pts[i + 1] - pts[i]
        local len = seg.Magnitude
        if len < 1e-6 then -- skip zero segments
        elseif acc + len >= dist then
            return pts[i] + seg.Unit * (dist - acc)
        end
        acc = acc + len
    end
    return pts[#pts]
end

local function _ap_sampleAlongPath(pts, step, startDist)
    startDist = math.max(0, startDist or 0)
    local samples, accSeg, started = {}, 0, false
    for i = 1, #pts - 1 do
        local a, b = pts[i], pts[i + 1]
        local d = b - a; local len = d.Magnitude
        if len < 1e-4 then -- skip
        else
            local dir = d.Unit
            if not started then
                if accSeg + len >= startDist then
                    local t = startDist - accSeg
                    while t < len - 1e-4 do
                        table.insert(samples, a + dir * t)
                        t = t + step
                    end
                    started = true
                end
            else
                local t = 0
                while t < len - 1e-4 do
                    table.insert(samples, a + dir * t)
                    t = t + step
                end
            end
            accSeg = accSeg + len
        end
    end
    if #pts > 0 and #samples == 0 then table.insert(samples, pts[#pts]) end
    return samples
end

local function _ap_xzPerp(samples, index)
    local tan
    if #samples < 2 then tan = Vector3.new(0, 0, -1)
    elseif index == 1 then tan = samples[2] - samples[1]
    elseif index == #samples then tan = samples[#samples] - samples[#samples - 1]
    else tan = samples[index + 1] - samples[index - 1] end
    local t = Vector3.new(tan.X, 0, tan.Z)
    if t.Magnitude < 1e-3 then return Vector3.new(0, 0, 1) end
    t = t.Unit
    return Vector3.new(-t.Z, 0, t.X)
end

local function _ap_buildPathCandidates(samples, inner, gap)
    local list = {}
    local outer = inner + gap
    for i, center in ipairs(samples) do
        local flat = Vector3.new(center.X, 0, center.Z)
        local perp = _ap_xzPerp(samples, i)
        local pathY = center.Y
        for _, pair in ipairs({
            { flat + perp * inner, "L1" }, { flat + perp * outer, "L2" },
            { flat - perp * inner, "R1" }, { flat - perp * outer, "R2" },
        }) do
            table.insert(list, { x = pair[1].X, z = pair[1].Z, y = pathY, tag = string.format("%d:%s", i, pair[2]) })
        end
    end
    return list
end

-- ── Hero config helpers ──
local function _ap_loadHeroConfigs()
    local cfgs = {}
    pcall(function()
        local folder = RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("items"):WaitForChild("data"):WaitForChild("hero")
        for _, m in pairs(folder:GetChildren()) do
            if m:IsA("ModuleScript") then
                local ok, cfg = pcall(require, m)
                if ok and type(cfg) == "table" and cfg.id then cfgs[cfg.id] = cfg end
            end
        end
    end)
    return cfgs
end

local function _ap_measureBody(model, padding)
    local minX, maxX, minZ, maxZ = math.huge, -math.huge, math.huge, -math.huge
    local found = false
    for _, part in pairs(model:GetDescendants()) do
        if part:IsA("BasePart") then
            local n = part.Name:lower()
            if not n:match("effect") and not n:match("aura") and not n:match("particle")
               and not n:match("trail") and not n:match("hitbox") and not n:match("root")
               and part.Transparency < 1 then
                local pos, hs = part.Position, part.Size / 2
                minX = math.min(minX, pos.X - hs.X); maxX = math.max(maxX, pos.X + hs.X)
                minZ = math.min(minZ, pos.Z - hs.Z); maxZ = math.max(maxZ, pos.Z + hs.Z)
                found = true
            end
        end
    end
    return found and (math.max(maxX - minX, maxZ - minZ) / 2 + (padding or 0.3)) or 2.5
end

local function _ap_displayName(heroCfgs, heroId)
    local cfg = heroCfgs[heroId]
    if cfg and type(cfg.name) == "string" and cfg.name ~= "" then return cfg.name end
    return heroId
end

local function _ap_maxPlacementCfg(heroCfgs, heroId)
    local cfg = heroCfgs[heroId]
    if cfg and type(cfg.maxPlacement) == "number" then return cfg.maxPlacement end
    return 3
end

local function _ap_parseHeroIdFromLabel(label)
    if type(label) ~= "string" then return nil end
    return string.match(label, "%(([%w_]+)%)$")
end

--- MacLib Multi dropdown shapes (same as MultiDropdownSelectionToIdSet): { ["Label"] = true } or { [1] = "Label", ... } / array of labels.
local function _ap_specialHeroIdsFromMultiValue(selected)
    local out = {}
    local placeholder = "(no heroes — open in stage or Refresh)"
    if type(selected) == "string" and selected ~= "" and selected ~= placeholder then
        local hid = _ap_parseHeroIdFromLabel(selected)
        if hid then out[hid] = true end
        return out
    end
    if type(selected) ~= "table" then
        return out
    end
    local function addLabel(label)
        if type(label) ~= "string" or label == placeholder then
            return
        end
        local hid = _ap_parseHeroIdFromLabel(label)
        if hid then out[hid] = true end
    end
    local sawStringKeys = false
    for k, v in pairs(selected) do
        if type(k) == "string" and v then
            sawStringKeys = true
            addLabel(k)
        elseif type(k) == "number" and type(v) == "string" then
            addLabel(v)
        end
    end
    if not sawStringKeys then
        for _, v in ipairs(selected) do
            addLabel(v)
        end
    end
    return out
end

--- One row per owned hero id: "Name — placeable/max (id)" for multi-select + search
local function _ap_buildSpecialUnitLabels(heroCfgs)
    local labels = {}
    local store = GetStore()
    if not store then return labels end
    local ok, state = pcall(function() return store:getState() end)
    if not ok or not state or not state.data or not state.data.heroes then return labels end
    local heroes = state.data.heroes[userId]
    if not heroes then return labels end
    local byId = {}
    for _, hero in pairs(heroes) do
        if hero.id then
            local pack = byId[hero.id]
            if not pack then pack = { count = 0 }; byId[hero.id] = pack end
            pack.count = pack.count + 1
        end
    end
    local rows = {}
    for hid, pack in pairs(byId) do
        local maxP = _ap_maxPlacementCfg(heroCfgs, hid)
        local owned = pack.count
        local placeable = math.min(owned, maxP)
        local dname = _ap_displayName(heroCfgs, hid)
        table.insert(rows, {
            label = string.format("%s — %d/%d (%s)", dname, placeable, maxP, hid),
        })
    end
    table.sort(rows, function(a, b) return a.label:lower() < b.label:lower() end)
    for _, r in ipairs(rows) do
        table.insert(labels, r.label)
    end
    return labels
end

-- ── UI ──
sections.AutoPlaceLeft:Header({ Text = "Auto Place" })

sections.AutoPlaceLeft:Dropdown({
    Name = "Placement mode",
    Options = { "Spiral", "Along Path", "At Point" },
    Default = "Spiral",
    Callback = function(v) AP_Mode = v end
}, "AP_Mode")

sections.AutoPlaceLeft:Dropdown({
    Name = "Hero filter",
    Options = { "All heroes", "Equipped only", "Air only (test)", "Selected units only" },
    Default = "All heroes",
    Callback = function(v)
        local map = {
            ["All heroes"] = "all",
            ["Equipped only"] = "equipped_only",
            ["Air only (test)"] = "air_only",
            ["Selected units only"] = "selected_only",
        }
        AP_HeroFilter = map[v] or "all"
    end
}, "AP_HeroFilter")

local _apSpecialLabelsInit = _ap_buildSpecialUnitLabels(_ap_loadHeroConfigs())
sections.AutoPlaceLeft:Dropdown({
    Name = "Units (when filter = Selected only)",
    Search = true,
    Multi = true,
    Options = #_apSpecialLabelsInit > 0 and _apSpecialLabelsInit or { "(no heroes — open in stage or Refresh)" },
    Callback = function(selected)
        AP_SpecialHeroIds = _ap_specialHeroIdsFromMultiValue(selected)
    end
}, "AP_SpecialUnitsDropdown")

sections.AutoPlaceLeft:Button({
    Name = "Refresh unit list",
    Callback = function()
        local heroCfgs = _ap_loadHeroConfigs()
        local labels = _ap_buildSpecialUnitLabels(heroCfgs)
        local opts = #labels > 0 and labels or { "(no heroes — open in stage or Refresh)" }
        pcall(function()
            local dd = MacLib.Options["AP_SpecialUnitsDropdown"]
            if dd and dd.ClearOptions and dd.InsertOptions then
                dd:ClearOptions()
                dd:InsertOptions(opts)
            end
        end)
    end
})

sections.AutoPlaceLeft:Slider({
    Name = "Grid radius (Spiral)",
    Default = 28, Minimum = 10, Maximum = 60, Precision = 0, DisplayMethod = "Value",
    Callback = function(v) AP_GridRadius = v end
}, "AP_GridRadius")

sections.AutoPlaceLeft:Slider({
    Name = "Spacing",
    Default = 3, Minimum = 1, Maximum = 8, Precision = 1, DisplayMethod = "Value",
    Callback = function(v) AP_SpiralStep = v; AP_PathStep = v end
}, "AP_Spacing")

sections.AutoPlaceLeft:Slider({
    Name = "Distance from path",
    Default = 3, Minimum = 1, Maximum = 12, Precision = 1, DisplayMethod = "Value",
    Callback = function(v) AP_RowOffsetInner = v end
}, "AP_RowOffset")

sections.AutoPlaceLeft:Slider({
    Name = "Start % from enemy (Path/Point)",
    Default = 10, Minimum = 0, Maximum = 90, Precision = 0, DisplayMethod = "Value",
    Callback = function(v) AP_PathStartPct = v end
}, "AP_StartPct")

sections.AutoPlaceLeft:Toggle({
    Name = "Show placement grid",
    Default = true,
    Callback = function(v) AP_ShowGrid = v end
}, "AP_ShowGrid")

sections.AutoPlaceLeft:Slider({
    Name = "Start Auto Place from wave",
    Default = 1, Minimum = 1, Maximum = 50, Precision = 0, DisplayMethod = "Value",
    Callback = function(v) AP_MinWaveToPlace = math.max(1, math.floor(v)) end
}, "AP_MinWaveToPlace")

local AP_Status = sections.AutoPlaceRight:Paragraph({
    Header = "Status",
    Body = "Enable toggle to start placing."
})

local AutoPlaceRunning = false

sections.AutoPlaceLeft:Toggle({
    Name = "Auto Place Heroes",
    Default = false,
    Callback = function(v)
        if v then
            if isLobby then Notify("Game Stage only") return end
            if not _AO.ModulesLoaded or not syncNet then Notify("Modules not loaded") return end
            AutoPlaceRunning = true

            task.spawn(function()
                local function userWantsStop()
                    return not AutoPlaceRunning or not getgenv()._AORunning
                end
                local function shouldStop()
                    return userWantsStop() or _allUnitsSoldThisRound
                end

                local function apWaveReady()
                    local okGo = false
                    pcall(function()
                        if not gameClientStore then return end
                        local st = gameClientStore:getState()
                        if st and st.gamemode and st.gamemode.round and st.wave then
                            local rs = st.gamemode.round.state
                            local wn = st.wave.waveNumber
                            if tostring(rs) ~= "Ended" and type(wn) == "number" and wn >= AP_MinWaveToPlace then
                                okGo = true
                            end
                        end
                    end)
                    return okGo
                end

                local function apRoundEndedOrBetweenMatches()
                    if _AO.MatchEnded then return true end
                    local ended = false
                    pcall(function()
                        if not gameClientStore then return end
                        local st = gameClientStore:getState()
                        local rs = st and st.gamemode and st.gamemode.round and st.gamemode.round.state
                        if tostring(rs) == "Ended" then ended = true end
                    end)
                    return ended
                end

                while true do -- ap_loop
                if userWantsStop() or isLobby then
                    AutoPlaceRunning = false
                    return
                end

                AP_Status:UpdateBody("Waiting for wave ≥ " .. AP_MinWaveToPlace .. " (Auto Place)...")
                while AutoPlaceRunning and getgenv()._AORunning and not isLobby do
                    if apWaveReady() then break end
                    task.wait(0.35)
                end
                if userWantsStop() or isLobby then
                    AutoPlaceRunning = false
                    return
                end

                AP_Status:UpdateBody("Starting...")
                repeat -- placement block (break = skip to after-place)
                dbg("AutoPlace: mode=" .. AP_Mode .. " filter=" .. AP_HeroFilter .. " minWave=" .. AP_MinWaveToPlace)
                local uid_ = tostring(LocalPlayer.UserId)
                local heroCfgs = _ap_loadHeroConfigs()

                -- Get store
                local store_ = gameClientStore
                if not store_ then AP_Status:UpdateBody("Store not available"); AutoPlaceRunning = false return end
                local ok_s, state_ = pcall(function() return store_:getState() end)
                if not ok_s or not state_ or not state_.data or not state_.data.heroes then
                    AP_Status:UpdateBody("No hero data"); AutoPlaceRunning = false return
                end
                local heroes_ = state_.data.heroes[uid_]
                if not heroes_ then AP_Status:UpdateBody("No heroes"); AutoPlaceRunning = false return end

                if AP_HeroFilter == "selected_only" then
                    local opt = MacLib.Options["AP_SpecialUnitsDropdown"]
                    if opt and opt.Value ~= nil then
                        AP_SpecialHeroIds = _ap_specialHeroIdsFromMultiValue(opt.Value)
                    end
                    if next(AP_SpecialHeroIds) == nil then
                        AP_Status:UpdateBody("Selected units: pick heroes in the list (search) or Refresh unit list")
                        AutoPlaceRunning = false
                        return
                    end
                end

                -- Count already placed towers per heroId + collect their positions
                local alreadyPlacedCount = {} -- {heroId = count}
                local existingPositions = {} -- {{pos=Vector3, radius=number}, ...}
                if state_.towers and state_.towers.towers then
                    for tUid, tower in pairs(state_.towers.towers) do
                        if tostring(tower.owner) == uid_ and tower.id then
                            alreadyPlacedCount[tower.id] = (alreadyPlacedCount[tower.id] or 0) + 1
                        end
                    end
                end
                -- Get positions from workspace models (store doesn't have cframe)
                pcall(function()
                    local ptFolder = workspace:FindFirstChild("placedTowers")
                    if ptFolder then
                        for _, model in pairs(ptFolder:GetChildren()) do
                            local tUid = model:GetAttribute("uniqueId") or model.Name
                            -- Check if this tower is ours (exists in state with our owner)
                            if state_.towers and state_.towers.towers then
                                local tData = state_.towers.towers[tUid]
                                if tData and tostring(tData.owner) == uid_ then
                                    local rp = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChildWhichIsA("BasePart", true)
                                    if rp then
                                        table.insert(existingPositions, { pos = rp.Position, radius = 2.5 })
                                    end
                                end
                            end
                        end
                    end
                end)

                -- Collect heroes with filter + maxPlacement cap (subtract already placed)
                local heroEntries = {}
                for uuid, hero in pairs(heroes_) do
                    if hero.id then
                        local eq = hero.equipped
                        local ut = (heroCfgs[hero.id] and heroCfgs[hero.id].unitType) or "ground"
                        local pass = AP_HeroFilter == "all"
                            or (AP_HeroFilter == "equipped_only" and type(eq) == "number" and eq > 0)
                            or (AP_HeroFilter == "air_only" and ut == "air")
                            or (AP_HeroFilter == "selected_only" and AP_SpecialHeroIds[hero.id])
                        if pass then
                            table.insert(heroEntries, { uuid = uuid, id = hero.id, equipped = eq })
                        end
                    end
                end
                table.sort(heroEntries, function(a, b)
                    if AP_HeroFilter == "equipped_only" then
                        local sa, sb = tonumber(a.equipped) or 999, tonumber(b.equipped) or 999
                        if sa ~= sb then return sa < sb end
                    end
                    return a.id < b.id
                end)

                local uuids_ = {}
                local uniqueIds_ = {}
                local countById = {}
                for _, e in ipairs(heroEntries) do
                    local maxP = (heroCfgs[e.id] and heroCfgs[e.id].maxPlacement) or 3
                    local alreadyOn = alreadyPlacedCount[e.id] or 0
                    local c = countById[e.id] or 0
                    -- Add this UUID as many times as it can still be placed
                    local remaining = maxP - alreadyOn - c
                    if remaining > 0 then
                        countById[e.id] = c + remaining
                        uniqueIds_[e.id] = true
                        local ut = (heroCfgs[e.id] and heroCfgs[e.id].unitType) or "ground"
                        for _ = 1, remaining do
                            table.insert(uuids_, { uuid = e.uuid, id = e.id, unitType = ut })
                        end
                    end
                end

                local ranPlaceBatch = false
                if #uuids_ == 0 then
                    local totalAlready = 0
                    for _, n in pairs(alreadyPlacedCount) do totalAlready = totalAlready + n end
                    AP_Status:UpdateBody("All heroes already placed (" .. totalAlready .. " on map) — next cycle after match")
                    dbg("AutoPlace: nothing to place, " .. totalAlready .. " already on map")
                else
                    ranPlaceBatch = true
                    AP_Status:UpdateBody("To place: " .. #uuids_ .. " | Mode: " .. AP_Mode)
                dbg("AutoPlace: " .. #uuids_ .. " to place (already on map: " .. tostring(next(alreadyPlacedCount) and "" or "0") .. ")")
                for hid, n in pairs(alreadyPlacedCount) do dbg("  already: " .. hid .. " x" .. n) end
                for _, h in ipairs(uuids_) do dbg("  to place: " .. h.id .. " [" .. h.unitType .. "]") end

                if userWantsStop() then AutoPlaceRunning = false return end
                if _allUnitsSoldThisRound then break end

                -- Measure model sizes
                local sizeCache = {}
                pcall(function()
                    local assets = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("assets"))
                    for hid in pairs(uniqueIds_) do
                        if not sizeCache[hid] then
                            local cfg = heroCfgs[hid]
                            if cfg and cfg.modelId then
                                pcall(function()
                                    local model = assets.get(cfg.modelId)
                                    if model and model:IsA("Model") then
                                        local clone = model:Clone()
                                        clone.Parent = workspace
                                        clone:PivotTo(CFrame.new(0, -500, 0))
                                        task.wait()
                                        sizeCache[hid] = _ap_measureBody(clone, 0.3)
                                        clone:Destroy()
                                    end
                                end)
                            end
                        end
                    end
                end)
                for hid in pairs(uniqueIds_) do
                    if not sizeCache[hid] then sizeCache[hid] = 2.5 end
                end

                if userWantsStop() then AutoPlaceRunning = false return end
                if _allUnitsSoldThisRound then break end

                -- Player position + floor
                local char_ = LocalPlayer.Character
                local hrp_ = char_ and char_:FindFirstChild("HumanoidRootPart")
                if not hrp_ then AP_Status:UpdateBody("No HumanoidRootPart"); AutoPlaceRunning = false return end
                local floorY_ = hrp_.Position.Y
                pcall(function()
                    local params = RaycastParams.new()
                    params.FilterType = Enum.RaycastFilterType.Exclude
                    params.FilterDescendantsInstances = {char_}
                    local result = workspace:Raycast(hrp_.Position, Vector3.new(0, -20, 0), params)
                    if result then floorY_ = result.Position.Y end
                end)
                local cx, cz = hrp_.Position.X, hrp_.Position.Z

                -- Build candidates based on mode
                local candidates = {}
                local modeLabel = AP_Mode
                local _pathPoints = nil -- saved for air candidate sorting
                local _pathSamples = nil -- actual placement stations (subset of path)

                if AP_Mode == "Along Path" or AP_Mode == "At Point" then
                    local mapFolder_ = workspace:FindFirstChild("mapFolder")
                    local pathsFolder_ = mapFolder_ and mapFolder_:FindFirstChild("Paths")
                    local enemyPos = _ap_teleportPos("enemyTeleport")

                    if pathsFolder_ then
                        local groups = _ap_collectPathGroups(pathsFolder_)
                        local g = _ap_pickPathGroup(groups, enemyPos)
                        if g then
                            local pts = {}
                            for _, cfv in ipairs(g.values) do table.insert(pts, cfv.Value.Position) end
                            pts = _ap_orientFromEnemy(pts, enemyPos)
                            _pathPoints = pts
                            local totalLen = _ap_polyLength(pts)
                            local startAlong = totalLen * (AP_PathStartPct / 100)

                            if AP_Mode == "Along Path" then
                                local samples = _ap_sampleAlongPath(pts, AP_PathStep, startAlong)
                                _pathSamples = samples
                                candidates = _ap_buildPathCandidates(samples, AP_RowOffsetInner, AP_RowGap)
                                modeLabel = "Path: " .. g.key
                                dbg("AutoPlace: path=" .. g.key .. " len=" .. string.format("%.0f", totalLen) .. " start=" .. AP_PathStartPct .. "% stations=" .. #samples .. " slots=" .. #candidates)
                                AP_Status:UpdateBody("Path: " .. g.key .. " | " .. #candidates .. " slots")
                            else -- At Point
                                local pointPos = _ap_pointAtDist(pts, startAlong)
                                local pcx, pcz, pcy = pointPos.X, pointPos.Z, pointPos.Y
                                -- Spiral around the point on path
                                table.insert(candidates, { x = pcx, z = pcz, y = pcy, tag = "C" })
                                for dist = AP_SpiralStep, AP_GridRadius, AP_SpiralStep do
                                    local nPts = math.max(6, math.floor(2 * math.pi * dist / AP_SpiralStep))
                                    for p = 0, nPts - 1 do
                                        local angle = (p / nPts) * 2 * math.pi
                                        table.insert(candidates, {
                                            x = math.floor((pcx + math.cos(angle) * dist) * 100) / 100,
                                            z = math.floor((pcz + math.sin(angle) * dist) * 100) / 100,
                                            y = pcy,
                                            tag = "pt"
                                        })
                                    end
                                end
                                modeLabel = "Point @" .. AP_PathStartPct .. "%"
                                dbg("AutoPlace: point at " .. AP_PathStartPct .. "% pos=" .. string.format("%.0f, %.0f", pcx, pcz) .. " slots=" .. #candidates)
                                AP_Status:UpdateBody("Point at " .. AP_PathStartPct .. "% from enemy | " .. #candidates .. " slots")
                            end
                        else
                            dbg("AutoPlace: no path groups found, falling back to Spiral")
                            AP_Status:UpdateBody("No path found — falling back to Spiral")
                            modeLabel = "Spiral (fallback)"
                        end
                    else
                        dbg("AutoPlace: no Paths folder, falling back to Spiral")
                        AP_Status:UpdateBody("No Paths folder — falling back to Spiral")
                        modeLabel = "Spiral (fallback)"
                    end
                end

                -- Spiral fallback / Spiral mode
                if #candidates == 0 then
                    table.insert(candidates, { x = cx, z = cz, tag = "C" })
                    for dist = AP_SpiralStep, AP_GridRadius, AP_SpiralStep do
                        local nPts = math.max(6, math.floor(2 * math.pi * dist / AP_SpiralStep))
                        for p = 0, nPts - 1 do
                            local angle = (p / nPts) * 2 * math.pi
                            table.insert(candidates, {
                                x = math.floor((cx + math.cos(angle) * dist) * 100) / 100,
                                z = math.floor((cz + math.sin(angle) * dist) * 100) / 100,
                                tag = "sp"
                            })
                        end
                    end
                    if modeLabel == AP_Mode then modeLabel = "Spiral" end
                end

                -- Generate extra candidates on air PlaceAreas for air units
                local hasAirUnits = false
                for _, h in ipairs(uuids_) do
                    if h.unitType == "air" then hasAirUnits = true break end
                end
                if hasAirUnits then
                    local airCandidates = {}
                    pcall(function()
                        local mapF = workspace:FindFirstChild("mapFolder")
                        local pa = mapF and mapF:FindFirstChild("PlaceAreas")
                        local airModel = pa and pa:FindFirstChild("air")
                        if airModel then
                            for _, part in pairs(airModel:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    local cf = part.CFrame
                                    local sz = part.Size
                                    -- Generate grid in LOCAL space, then transform to world
                                    local step = math.max(AP_SpiralStep, 2)
                                    local halfX = sz.X / 2 - 0.5
                                    local halfZ = sz.Z / 2 - 0.5
                                    if halfX < 0.5 then halfX = 0 end
                                    if halfZ < 0.5 then halfZ = 0 end
                                    for lx = -halfX, halfX, step do
                                        for lz = -halfZ, halfZ, step do
                                            -- Local offset on top surface of part
                                            local worldPos = cf * Vector3.new(lx, sz.Y / 2 + 0.5, lz)
                                            table.insert(airCandidates, {
                                                x = math.floor(worldPos.X * 100) / 100,
                                                y = worldPos.Y,
                                                z = math.floor(worldPos.Z * 100) / 100,
                                                tag = "air:" .. part.Name
                                            })
                                        end
                                    end
                                    -- Always add center too
                                    local centerPos = cf * Vector3.new(0, sz.Y / 2 + 0.5, 0)
                                    table.insert(airCandidates, {
                                        x = math.floor(centerPos.X * 100) / 100,
                                        y = centerPos.Y,
                                        z = math.floor(centerPos.Z * 100) / 100,
                                        tag = "air:" .. part.Name .. ":C"
                                    })
                                end
                            end
                        end
                    end)
                    if #airCandidates > 0 then
                        local refPoints = _pathSamples or _pathPoints
                        if refPoints and #refPoints > 0 then
                            local totalSamples = #refPoints
                            local MAX_PERP_DIST = 18

                            -- Compute start zone boundary: first sample position
                            -- Air slots whose nearest full-path point is before the first sample are rejected
                            local startSample = refPoints[1]
                            local startDist2 = nil -- distance² from path start to first sample
                            if _pathPoints and #_pathPoints > 0 then
                                startDist2 = (startSample.X - _pathPoints[1].X)^2 + (startSample.Z - _pathPoints[1].Z)^2
                            end

                            local filtered = {}
                            for _, ac in ipairs(airCandidates) do
                                local bestDist = math.huge
                                local bestIdx = totalSamples
                                for si, sp in ipairs(refPoints) do
                                    local d = (ac.x - sp.X)^2 + (ac.z - sp.Z)^2
                                    if d < bestDist then
                                        bestDist = d
                                        bestIdx = si
                                    end
                                end
                                local perpDist = math.sqrt(bestDist)

                                -- Skip if too far from path
                                if perpDist > MAX_PERP_DIST then
                                    -- filtered out
                                -- Skip if closest sample is #1 AND slot is actually behind start (closer to enemy spawn than first sample)
                                elseif bestIdx == 1 and _pathPoints and #_pathPoints >= 2 then
                                    local distToPathStart2 = (ac.x - _pathPoints[1].X)^2 + (ac.z - _pathPoints[1].Z)^2
                                    if startDist2 and distToPathStart2 < startDist2 * 0.8 then
                                        -- This slot is closer to enemy spawn than the Start% point — skip
                                    else
                                        local pathProgress = bestIdx / totalSamples
                                        ac._score = pathProgress * 100 + perpDist
                                        ac._dist2 = bestDist
                                        ac._sampleIdx = bestIdx
                                        table.insert(filtered, ac)
                                    end
                                else
                                    local pathProgress = bestIdx / totalSamples
                                    ac._score = pathProgress * 100 + perpDist
                                    ac._dist2 = bestDist
                                    ac._sampleIdx = bestIdx
                                    table.insert(filtered, ac)
                                end
                            end
                            table.sort(filtered, function(a, b) return a._score < b._score end)
                            airCandidates = filtered
                        end
                        for _, ac in ipairs(airCandidates) do
                            table.insert(candidates, ac)
                        end
                        dbg("AutoPlace: " .. #airCandidates .. " air slots (sorted by path progress + distance)")
                        -- Debug: show top 10 air candidates + find house_4.020
                        local found020 = false
                        for di = 1, #airCandidates do
                            local ac = airCandidates[di]
                            if di <= 10 then
                                dbg("  air[" .. di .. "] " .. (ac.tag or "?") .. " pos=" .. string.format("%.0f,%.0f,%.0f", ac.x, ac.y or 0, ac.z) .. " sample#" .. (ac._sampleIdx or "?") .. " dist=" .. string.format("%.0f", math.sqrt(ac._dist2 or 0)) .. " score=" .. string.format("%.1f", ac._score or 0))
                            end
                            if not found020 and ac.tag and ac.tag:find("house_4.020") then
                                found020 = true
                                dbg("  >>> house_4.020 at rank " .. di .. " sample#" .. (ac._sampleIdx or "?") .. " dist=" .. string.format("%.0f", math.sqrt(ac._dist2 or 0)) .. " score=" .. string.format("%.1f", ac._score or 0))
                            end
                        end
                        if not found020 then
                            dbg("  >>> house_4.020 NOT FOUND in air candidates!")
                        end
                    end
                end

                if userWantsStop() then AutoPlaceRunning = false return end
                if _allUnitsSoldThisRound then break end

                -- Grid visualization
                local gridFolder_ = nil
                if AP_ShowGrid then
                    pcall(function()
                        local old = workspace:FindFirstChild("ApelHub_PlaceGrid")
                        if old then old:Destroy() end
                    end)
                    gridFolder_ = Instance.new("Folder")
                    gridFolder_.Name = "ApelHub_PlaceGrid"
                    gridFolder_.Parent = workspace
                end

                -- PlaceArea validation (same logic as game's isValidPlacement)
                local _paMapFolder = workspace:FindFirstChild("mapFolder")
                local _paFilterParts = {}
                if _paMapFolder then
                    local m = _paMapFolder:FindFirstChild("Map")
                    local pa = _paMapFolder:FindFirstChild("PlaceAreas")
                    local pm = _paMapFolder:FindFirstChild("PathsModels")
                    if m then table.insert(_paFilterParts, m) end
                    if pa then table.insert(_paFilterParts, pa) end
                    if pm then table.insert(_paFilterParts, pm) end
                end
                local _paParams = RaycastParams.new()
                _paParams.FilterType = Enum.RaycastFilterType.Include
                _paParams.FilterDescendantsInstances = _paFilterParts

                local function isValidSlotForUnit(x, z, unitType, slotY)
                    if #_paFilterParts == 0 then return true end -- no PlaceAreas = skip check
                    local baseY = slotY or floorY_
                    local origin = Vector3.new(x, baseY + 10, z)
                    local hit = workspace:Raycast(origin, Vector3.new(0, -30, 0), _paParams)
                    if not hit then return false end
                    if unitType == "hybrid" then
                        return hit.Instance:FindFirstAncestor("ground") ~= nil or hit.Instance:FindFirstAncestor("air") ~= nil
                    end
                    return hit.Instance:FindFirstAncestor(unitType or "ground") ~= nil
                end

                -- Placement loop
                local usedSlot = {}
                local placedCenters_ = {}
                local placedCount_ = 0

                -- Seed placedCenters_ with existing towers for collision avoidance
                for _, ep in ipairs(existingPositions) do
                    table.insert(placedCenters_, ep)
                end
                dbg("AutoPlace: seeded " .. #existingPositions .. " existing tower positions for collision")

                -- Raycast params for floor detection (used once for player pos)
                -- Slots use floorY_ directly as in original working version

                -- Helper: get current yen from store
                local function getCurrentYen()
                    local y = nil
                    pcall(function()
                        local s = gameClientStore:getState()
                        if s and s.currency then y = s.currency.yen end
                    end)
                    return y
                end

                for i, hero in ipairs(uuids_) do
                    if userWantsStop() then
                        dbg("AutoPlace: stopped by user at hero " .. i .. "/" .. #uuids_)
                        AutoPlaceRunning = false
                        return
                    end
                    if _allUnitsSoldThisRound then
                        dbg("AutoPlace: sell-all flag at hero " .. i .. "/" .. #uuids_)
                        break
                    end

                    -- Wait for enough yen before trying to place (max 30s then try anyway)
                    local heroCost = (heroCfgs[hero.id] and heroCfgs[hero.id].cost) or 0
                    if heroCost > 0 then
                        local yen = getCurrentYen()
                        dbg("AutoPlace: [" .. i .. "] " .. hero.id .. " cost=¥" .. heroCost .. " yen=" .. tostring(yen))
                        if yen ~= nil and yen < heroCost then
                            local waitStart = tick()
                            local MAX_YEN_WAIT = 30
                            while true do
                                if userWantsStop() then AutoPlaceRunning = false return end
                                if _allUnitsSoldThisRound then break end
                                if tick() - waitStart > MAX_YEN_WAIT then
                                    dbg("AutoPlace: yen wait timeout (" .. MAX_YEN_WAIT .. "s), trying anyway")
                                    break
                                end
                                yen = getCurrentYen()
                                if yen == nil or yen >= heroCost then break end
                                AP_Status:UpdateBody(modeLabel .. " | " .. placedCount_ .. "/" .. #uuids_ .. " — ¥" .. tostring(yen) .. "/" .. heroCost .. " (" .. hero.id .. ")")
                                task.wait(0.5)
                            end
                            if userWantsStop() then AutoPlaceRunning = false return end
                            if _allUnitsSoldThisRound then break end
                        end
                    end

                    local placed = false
                    local fails = 0
                    local skippedArea = 0
                    local skippedCollision = 0
                    local radius = sizeCache[hero.id] or 2.5

                    for idx, slot in ipairs(candidates) do
                        local failLimit = hero.unitType == "air" and 9999 or AP_MaxFails
                        if userWantsStop() then AutoPlaceRunning = false return end
                        if _allUnitsSoldThisRound then break end
                        if placed or fails >= failLimit then break end
                        if not usedSlot[idx] then
                            -- Local collision check against ALL towers (existing + newly placed)
                            local tooClose = false
                            for _, p in ipairs(placedCenters_) do
                                if math.sqrt((slot.x - p.pos.X)^2 + (slot.z - p.pos.Z)^2) < (p.radius * 0.8) then
                                    tooClose = true; break
                                end
                            end
                            if tooClose then
                                skippedCollision = skippedCollision + 1
                            elseif not isValidSlotForUnit(slot.x, slot.z, hero.unitType, slot.y) then
                                skippedArea = skippedArea + 1
                            else
                                local pos = Vector3.new(slot.x, slot.y or floorY_, slot.z)
                                local ok_, result_ = pcall(function()
                                    return syncNet.clientTowerPlacement.call(hero.uuid, CFrame.new(pos))
                                end)
                                if ok_ and result_ == true then
                                    placed = true
                                    usedSlot[idx] = true
                                    table.insert(placedCenters_, { pos = pos, radius = radius })
                                    placedCount_ = placedCount_ + 1
                                    dbg("AutoPlace: [" .. i .. "] " .. hero.id .. " OK @ " .. (slot.tag or "?") .. " pos=" .. string.format("%.0f,%.0f,%.0f", pos.X, pos.Y, pos.Z))
                                    if gridFolder_ then
                                        local sz = radius * 2 * 0.85
                                        local part = Instance.new("Part")
                                        part.Size = Vector3.new(sz, 0.15, sz)
                                        part.Position = pos + Vector3.new(0, 0.1, 0)
                                        part.Anchored = true; part.CanCollide = false
                                        part.Material = Enum.Material.Neon
                                        part.Color = hero.unitType == "air" and Color3.fromRGB(80, 150, 255) or Color3.fromRGB(80, 180, 80)
                                        part.Transparency = 0.3; part.Parent = gridFolder_
                                        local bb = Instance.new("BillboardGui")
                                        bb.Size = UDim2.new(0, 120, 0, 30)
                                        bb.StudsOffset = Vector3.new(0, 2, 0)
                                        bb.AlwaysOnTop = true; bb.Parent = part
                                        local txt = Instance.new("TextLabel")
                                        txt.Size = UDim2.new(1, 0, 1, 0)
                                        txt.BackgroundTransparency = 1
                                        txt.Text = i .. ": " .. hero.id
                                        txt.TextColor3 = Color3.new(1, 1, 1)
                                        txt.TextStrokeTransparency = 0.3
                                        txt.TextScaled = true
                                        txt.Font = Enum.Font.GothamBold
                                        txt.Parent = bb
                                    end
                                else
                                    fails = fails + 1
                                    local errMsg = not ok_ and tostring(result_):sub(1, 50) or (type(result_) == "string" and result_ or "false")
                                    dbg("AutoPlace: [" .. i .. "] " .. hero.id .. " REJECTED @ " .. (slot.tag or "?") .. " pos=" .. string.format("%.0f,%.0f,%.0f", pos.X, pos.Y, pos.Z) .. " err=" .. tostring(errMsg))
                                    -- Visual: red marker at failed attempt
                                    if gridFolder_ then
                                        pcall(function()
                                            local dp = Instance.new("Part")
                                            dp.Size = Vector3.new(1, 1, 1)
                                            dp.Position = pos + Vector3.new(0, 0.5, 0)
                                            dp.Anchored = true; dp.CanCollide = false
                                            dp.Shape = Enum.PartType.Ball
                                            dp.Material = Enum.Material.Neon
                                            dp.Color = Color3.fromRGB(255, 50, 50)
                                            dp.Transparency = 0.3; dp.Parent = gridFolder_
                                        end)
                                    end
                                end
                            end
                        end
                    end
                    AP_Status:UpdateBody(modeLabel .. " | " .. placedCount_ .. "/" .. #uuids_)
                    if not placed and not userWantsStop() and not _allUnitsSoldThisRound then
                        dbg("AutoPlace: [" .. i .. "] " .. hero.id .. " FAIL — server_reject=" .. fails .. " wrong_area=" .. skippedArea .. " collision=" .. skippedCollision .. " (unitType=" .. hero.unitType .. ")")
                    end
                end

                if userWantsStop() then AutoPlaceRunning = false return end

                local stopReason = _allUnitsSoldThisRound and " (paused — sell all / next round)" or ""
                dbg("AutoPlace: DONE " .. placedCount_ .. "/" .. #uuids_ .. " (" .. modeLabel .. ")" .. stopReason)
                AP_Status:UpdateBody("Done! " .. placedCount_ .. "/" .. #uuids_ .. " placed (" .. modeLabel .. ")" .. stopReason)
                Notify("Auto Place: " .. placedCount_ .. "/" .. #uuids_ .. " (" .. modeLabel .. ")" .. stopReason)

                if gridFolder_ then
                    task.delay(60, function()
                        pcall(function() if gridFolder_ then gridFolder_:Destroy() end end)
                    end)
                end

                end -- ranPlaceBatch (#uuids_ > 0)

                until true -- end placement block (ap_after_place)
                if userWantsStop() or isLobby then
                    AutoPlaceRunning = false
                    return
                end

                AP_Status:UpdateBody("Waiting for match end (next Auto Place cycle)...")
                while AutoPlaceRunning and getgenv()._AORunning and not isLobby and not apRoundEndedOrBetweenMatches() do
                    task.wait(0.35)
                end
                if userWantsStop() or isLobby then
                    AutoPlaceRunning = false
                    return
                end

                AP_Status:UpdateBody("Waiting for next match (wave ≥ " .. AP_MinWaveToPlace .. ")...")
                while AutoPlaceRunning and getgenv()._AORunning and not isLobby do
                    if apWaveReady() then
                        task.wait(0.4)
                        break
                    end
                    task.wait(0.4)
                end
                if userWantsStop() or isLobby then
                    AutoPlaceRunning = false
                    return
                end

                end -- while true (ap_loop)
            end)
        else
            if AutoPlaceRunning then
                AutoPlaceRunning = false
                AP_Status:UpdateBody("Stopping...")
                dbg("AutoPlace: stop requested by user")
            end
        end
    end
}, "AutoPlaceToggle")

end)() -- end premium Auto Place IIFE

else
    sections.AutoPlaceLeft:Header({ Text = "Auto Place — Premium" })
    sections.AutoPlaceLeft:Paragraph({
        Header = "Premium required",
        Body = "Auto Place is a Premium feature.\n\nPurchase a Premium key in our Discord server to unlock Auto Place.",
    })
end -- if _G.fanmyrka

-- ── Auto Upgrade (available to all) ──
sections.AutoPlaceLeft:Divider()
sections.AutoPlaceLeft:Header({ Text = "Auto Upgrade" })

sections.AutoPlaceLeft:Toggle({
    Name = "Auto Upgrade",
    Default = false,
    Callback = function(v) AutoUpgradeEnabled = v end
}, "AutoUpgradeToggle")

sections.AutoPlaceLeft:Dropdown({
    Name = "Upgrade priority",
    Options = { "All equal", "Farms first" },
    Default = "All equal",
    Callback = function(v)
        local map = { ["All equal"] = "all_equal", ["Farms first"] = "farms_first" }
        AutoUpgradeMode = map[v] or "all_equal"
    end
}, "AutoUpgradeMode")

sections.AutoPlaceLeft:Toggle({
    Name = "Sell all units at wave",
    Default = false,
    Callback = function(v) AutoUpgradeSellAllEnabled = v end
}, "AutoUpgradeSellAllToggle")

sections.AutoPlaceLeft:Slider({
    Name = "Sell at wave",
    Default = 10, Minimum = 1, Maximum = 500, Precision = 0, DisplayMethod = "Value",
    Callback = function(v) AutoUpgradeSellAllWave = v end
}, "AutoUpgradeSellAllWave")

-- Right: info
sections.AutoPlaceRight:Header({ Text = "Placement Modes" })
sections.AutoPlaceRight:Paragraph({
    Header = "Spiral",
    Body = "Places heroes in a spiral around your character. Simple, works everywhere.",
})
sections.AutoPlaceRight:Paragraph({
    Header = "Along Path",
    Body = "Reads the enemy path from the map and places heroes in 4 rows (2 left, 2 right) along it. Start % controls how far from enemy spawn to begin.",
})
sections.AutoPlaceRight:Paragraph({
    Header = "At Point",
    Body = "Finds the point at X% along the enemy path and places heroes in a spiral around that spot. Good for concentrating firepower at a chokepoint.",
})
sections.AutoPlaceRight:Paragraph({
    Header = "Selected units (special)",
    Body = "Set Hero filter to Selected units only, then choose hero types in the searchable list. Numbers show how many can still be placed vs max per type. Refresh after summoning.",
})
sections.AutoPlaceRight:Divider()
sections.AutoPlaceRight:Paragraph({
    Header = "Auto Upgrade",
    Body = "Uses the game's built-in auto-upgrade system (server-side).\n\nAll equal: Sets priority 1 on all towers.\nFarms first: Farms get priority 1, others priority 2 (farms upgraded first).\n\nSell all units: sells everything at the specified wave and blocks auto place until next round.",
})

-- ── Auto Upgrade Loop (server-side only, always runs) ──
task.defer(function()
if not isLobby then
    local _upgradeSoldAll = false
    local _upgradeStarted = false
    local _lastUpgradeLog = 0

    -- Load items config once (for farm detection)
    local _upgradeItemsCfg = nil
    pcall(function() _upgradeItemsCfg = require(RS:WaitForChild("shared"):WaitForChild("config"):WaitForChild("items")) end)

    local function isFarmHero(heroId)
        if not _upgradeItemsCfg then return false end
        local ok, cfg = pcall(function() return _upgradeItemsCfg.hero.get(heroId) end)
        return ok and cfg and cfg.heroType == "farm"
    end

    task.spawn(function()
        while getgenv()._AORunning do
            if AutoUpgradeEnabled and not isLobby and gameClientStore and towersNet then
                if not _upgradeStarted then
                    _upgradeStarted = true
                    dbg("AutoUpgrade[Server]: STARTED mode=" .. AutoUpgradeMode)
                end

                local ok, err = pcall(function()
                    local state = gameClientStore:getState()
                    local uid_ = tostring(LocalPlayer.UserId)

                    -- Wave-based sell all
                    local w = state.wave and state.wave.waveNumber
                    if type(w) == "number" then
                        if AutoUpgradeSellAllEnabled and AutoUpgradeSellAllWave > 0 and w >= AutoUpgradeSellAllWave and not _upgradeSoldAll then
                            _upgradeSoldAll = true
                            _allUnitsSoldThisRound = true
                            if state.towers and state.towers.towers then
                                for uid, tower in pairs(state.towers.towers) do
                                    if tostring(tower.owner) == uid_ then
                                        pcall(function() towersNet.sellUnit.call(uid) end)
                                        task.wait(0.08)
                                    end
                                end
                            end
                            dbg("AutoUpgrade: sold all units at wave " .. w .. " — auto place blocked until new round")
                        end
                        if _AO.MatchEnded then _upgradeSoldAll = false; _allUnitsSoldThisRound = false end
                    end

                    -- Server auto-upgrade: set upgradePriority via changeUpgradePriority
                    if not state.towers or not state.towers.towers then return end

                    local totalOwned, alreadySet, adjusted = 0, 0, 0
                    local BATCH = 3
                    local needFix = {}

                    for uid, tower in pairs(state.towers.towers) do
                        if tostring(tower.owner) == uid_ then
                            totalOwned = totalOwned + 1
                            local curPrio = tower.upgradePriority or 0
                            local target
                            if AutoUpgradeMode == "farms_first" then
                                target = isFarmHero(tower.id) and 1 or 2
                            else
                                target = 1
                            end
                            if curPrio == target then
                                alreadySet = alreadySet + 1
                            else
                                table.insert(needFix, { uid = uid, curPrio = curPrio, target = target, id = tower.id })
                            end
                        end
                    end

                    -- Process up to BATCH towers this tick
                    for i = 1, math.min(BATCH, #needFix) do
                        if not getgenv()._AORunning or not AutoUpgradeEnabled then break end
                        local t = needFix[i]
                        local steps = (t.target - t.curPrio) % 9
                        local moved = false
                        for s = 1, math.min(steps, 16) do
                            local freshPrio = t.curPrio
                            pcall(function()
                                local fs = gameClientStore:getState()
                                local ft = fs and fs.towers and fs.towers.towers and fs.towers.towers[t.uid]
                                if ft then freshPrio = ft.upgradePriority or 0 end
                            end)
                            if freshPrio == t.target then break end
                            _AO._macroSuppressPrioHook = true
                            local cOk = pcall(function() return towersNet.changeUpgradePriority.call(t.uid) end)
                            _AO._macroSuppressPrioHook = false
                            if not cOk then break end
                            moved = true
                            task.wait(0.06)
                        end
                        if moved then adjusted = adjusted + 1 end
                    end

                    -- Periodic log
                    local now = tick()
                    if now - _lastUpgradeLog > 5 then
                        _lastUpgradeLog = now
                        dbg("AutoUpgrade[Server]: mode=" .. AutoUpgradeMode .. " owned=" .. totalOwned .. " done=" .. alreadySet .. " pending=" .. #needFix .. " fixed_now=" .. adjusted)
                    end
                end)
                if not ok then
                    dbg("AutoUpgrade: ERROR — " .. tostring(err))
                end
            else
                if _upgradeStarted and not AutoUpgradeEnabled then
                    _upgradeStarted = false
                    dbg("AutoUpgrade: STOPPED")
                end
            end
            task.wait(0.5)
        end
    end)
end
end)

end)() -- end Auto Place tab IIFE

-- ═══════════════════════════════════════════
-- UI: SETTINGS TAB
-- ═══════════════════════════════════════════

sections.SettingsUI:Header({ Text = "UI Settings" })
sections.SettingsUI:Slider({ Name = "UI Scale", Default = 0.75, Minimum = 0.5, Maximum = 2, DisplayMethod = "Value", Precision = 2,
    Callback = function(v) Window:SetScale(v) end }, "UIScale")
Window:GlobalSetting({ Name = "UI Blur", Default = Window:GetAcrylicBlurState(),
    Callback = function(v) Window:SetAcrylicBlurState(v) end }, "UIBlur")
Window:GlobalSetting({ Name = "Notifications", Default = Window:GetNotificationsState(),
    Callback = function(v) Window:SetNotificationsState(v) end }, "UINotifs")

sections.SettingsUI:Divider()
sections.SettingsUI:Toggle({ Name = "Auto Execute on Teleport", Default = false,
    Callback = function(v)
        if v then
            local qot = queue_on_teleport or queueonteleport
            if qot then qot([[
                repeat task.wait(1) until game:IsLoaded()
                task.wait(7)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ApelsinkaFr/ApelHub/refs/heads/main/ApelHub"))()
            ]]) end
        end
    end
}, "AutoExecToggle")

local OriginalName = nil
sections.SettingsUI:Toggle({ Name = "Hide Name", Default = false,
    Callback = function(v)
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            local head = char:FindFirstChild("Head")
            if not head then return end
            local playerInfo = head:FindFirstChild("playerInfo")
            if not playerInfo then return end
            local nameText = playerInfo:FindFirstChild("NameText")
            if not nameText then return end
            if v then
                OriginalName = nameText.Text
                nameText.Text = "APEL HUB ON TOP"
            else
                if OriginalName then
                    nameText.Text = OriginalName
                end
            end
        end)
    end
}, "HideNameToggle")

sections.SettingsUI:Button({ Name = "Unload Script", Callback = function() getgenv()._AORunning = false; Window:Unload() end })

-- ═══════════════════════════════════════════
-- WINDOW FINALIZE
-- ═══════════════════════════════════════════

task.spawn(function() task.wait(0.2)
    Window:CreateMinimizer({ Size = UDim2.fromOffset(50, 50), Position = UDim2.new(1, -10, 0.5, 0), Icon = "rbxassetid://138310609771261" })
end)
task.spawn(function() task.wait(0.5) if _G.KeyExpiresAt then Window:SetKeyTimer(_G.KeyExpiresAt) end end)

-- Save & Load
local function _doConfigSetup()
    MacLib:SetFolder("ApelHub")
    local _configLoading = true
    local _origAS = MacLib.AutoSave
    MacLib.AutoSave = function(self, ...) if _configLoading then return end return _origAS(self, ...) end
    MacLib:LoadAutoLoadConfig()

    task.spawn(function()
        task.wait(0.3)
        local savedMode, savedStage, savedAct, savedDifficulty, savedSummonAmount, savedSummonBanner
        pcall(function()
        local gf = MacLib.Folder .. "/settings/" .. tostring(game.PlaceId)
        if not isfolder(gf) then gf = MacLib.Folder .. "/settings/" .. tostring(game.CreatorId) end
        local alp = gf .. "/autoload.txt"
        local cn = isfile(alp) and readfile(alp) or "default"
        local cp = gf .. "/" .. cn .. ".json"
        if isfile(cp) then
            local data = HttpService:JSONDecode(readfile(cp))
            for _, obj in ipairs(data.objects) do
                if obj.flag == "ModeDropdown"          then savedMode         = obj.value end
                if obj.flag == "StageDropdown"         then savedStage        = obj.value end
                if obj.flag == "ActDropdown"            then savedAct          = obj.value end
                if obj.flag == "DifficultyDropdown"     then savedDifficulty   = obj.value end
                if obj.flag == "SummonAmountDropdown"   then savedSummonAmount = obj.value end
                if obj.flag == "SummonBannerDropdown"   then savedSummonBanner = obj.value end
            end
        end
    end)

    -- Restore mode/stage/act/difficulty values (stubs exist in both places)
    if savedMode then
        _AO.SelectedMode = savedMode
        pcall(function() MacLib.Options["ModeDropdown"]:UpdateSelection(savedMode, true) end)
    end
    if savedMode == "Legends" then _AO.SelectedDifficulty = "legends" end
    if savedDifficulty and savedMode ~= "Legends" then _AO.SelectedDifficulty = savedDifficulty end

    -- Rebuild UI only in lobby (full dropdowns)
    if isLobby then
        pcall(function()
            local showStage = (_AO.SelectedMode == "Story" or _AO.SelectedMode == "Raid" or _AO.SelectedMode == "Legends")
            local showDifficulty = (_AO.SelectedMode == "Story" or _AO.SelectedMode == "Raid")
            local hideAll = (_AO.SelectedMode == "Chain of Control")
            MacLib.Options["StageDropdown"]:SetVisibility(showStage and not hideAll)
            MacLib.Options["ActDropdown"]:SetVisibility(_AO.SelectedMode ~= "Excavation" and not hideAll)
            MacLib.Options["DifficultyDropdown"]:SetVisibility(showDifficulty and not hideAll)
            if _AO.SelectedMode == "Excavation" then _AO.SelectedStage = "desertMap" end
        end)

        -- Rebuild stage list
        local stageMode = (_AO.SelectedMode == "Legends") and "Story" or _AO.SelectedMode
        local stages = GetStagesForMode(stageMode)
        if #stages > 0 and StageDropdown then
            StageDropdown:ClearOptions()
            StageDropdown:InsertOptions(stages)
            if savedStage then
                pcall(function() StageDropdown:UpdateSelection(savedStage, true) end)
                local sid = AllStages[savedStage]
                if sid then _AO.SelectedStage = sid end
            else
                StageDropdown:UpdateSelection(stages[1])
                _AO.SelectedStage = AllStages[stages[1]]
            end
        end

        -- Rebuild act list
        if _AO.SelectedStage and ActDropdown then
            local acts = (_AO.SelectedMode == "Legends") and GetLegendsActsForStage(_AO.SelectedStage) or GetActsForStage(_AO.SelectedStage)
            ActDropdown:ClearOptions()
            ActDropdown:InsertOptions(acts)
            if savedAct then
                local found = false
                for _, a in ipairs(acts) do
                    if a == savedAct then found = true break end
                end
                if found then
                    ActDropdown:UpdateSelection(savedAct)
                    _AO.SelectedAct = savedAct
                else
                    ActDropdown:UpdateSelection(acts[1])
                    _AO.SelectedAct = acts[1]
                end
            else
                ActDropdown:UpdateSelection(acts[1])
                _AO.SelectedAct = acts[1]
            end
        end
    else
        -- Game stage: restore values + update stub dropdowns
        if savedStage then
            local sid = AllStages[savedStage]
            if sid then _AO.SelectedStage = sid end
            pcall(function() MacLib.Options["StageDropdown"]:UpdateSelection(savedStage, true) end)
        end
        if savedAct then
            _AO.SelectedAct = savedAct
            pcall(function() MacLib.Options["ActDropdown"]:UpdateSelection(savedAct, true) end)
        end
    end
    if savedSummonAmount then _AO.SummonAmount = savedSummonAmount == "x10" and 10 or 1 end
    if savedSummonBanner then _AO.SummonBanner = savedSummonBanner end

    -- Restore macro selection
    pcall(function()
        local loadedMacro = MacLib.Options.SelectMacroDropdown and MacLib.Options.SelectMacroDropdown.Value
        if loadedMacro and loadedMacro ~= "No Macros" then
            _AO.SelectedMacroName = loadedMacro
            _AO.CurrentMacro = LoadMacro(loadedMacro)
        end
    end)

    -- Target rewards: LoadAutoLoadConfig skips Callback while loading — sync from MacLib or "match all" wipes filters
    pcall(function()
        local opt = MacLib.Options["ChallengeRewardsDropdown"]
        if opt and opt.Value ~= nil then
            ApplyTargetRewardsFromDropdown(opt.Value)
        end
    end)

    _configLoading = false
    _AO.IsLoadingConfig = false
    if isLobby then tabs.Join:Select() else tabs.Macro:Select() end
end)
Window.onUnloaded(function()
    getgenv()._AORunning = false
    _AO.IsPlaying = false
    _AO.IsRecording = false
    _AO.RecordingWatchdogGeneration = _AO.RecordingWatchdogGeneration + 1
    if _AO._AOAutoUltHeartbeatConn then
        pcall(function()
            _AO._AOAutoUltHeartbeatConn:Disconnect()
        end)
        _AO._AOAutoUltHeartbeatConn = nil
    end
end)
end

if LPH_OBFUSCATED then
    LPH_NO_VIRTUALIZE(function()
        _doConfigSetup()
    end)()
else
    _doConfigSetup()
end
