-- ts file was generated at discord.gg/25ms


local vu1 = select(1, ...) or {
    JoinTeam = "Pirates",
    Translator = true
}
if not game.IsLoaded then
    game.Loaded:Wait()
end
local vu2 = game:GetService("VirtualInputManager")
local vu3 = game:GetService("LocalizationService")
local vu4 = game:GetService("CollectionService")
local vu5 = game:GetService("ReplicatedStorage")
local vu6 = game:GetService("VirtualUser")
local vu7 = game:GetService("HttpService")
local v8 = game:GetService("RunService")
local vu9 = game:GetService("Lighting")
local vu10 = game:GetService("Players")
local vu11 = game:GetService("CoreGui")
local vu12 = workspace.CurrentCamera
local vu13 = v8.Stepped
local vu14 = vu10.LocalPlayer
local vu15 = vu14:WaitForChild("Data")
vu15:WaitForChild("LastSpawnPoint")
vu15:WaitForChild("SpawnPoint")
local vu16 = vu15:WaitForChild("Fragments")
local vu17 = vu15:WaitForChild("Subclass")
local vu18 = vu15:WaitForChild("FruitCap")
local vu19 = vu15:WaitForChild("Level")
local vu20 = vu15:WaitForChild("Beli")
local vu21 = workspace:WaitForChild("Map")
local vu22 = workspace:WaitForChild("NPCs")
local vu23 = workspace:WaitForChild("Boats")
local vu24 = workspace:WaitForChild("SeaBeasts")
local vu25 = workspace:WaitForChild("Enemies")
local vu26 = workspace:WaitForChild("Characters")
local vu27 = workspace:WaitForChild("_WorldOrigin")
local vu28 = vu27:WaitForChild("Locations")
vu27:WaitForChild("PlayerSpawns")
local vu29 = vu5:WaitForChild("Remotes")
local vu30 = vu5:WaitForChild("Modules")
local vu31 = vu30:WaitForChild("Net")
local vu32 = (getgenv or (getrenv or getfenv))()
local vu33 = game.HttpGet
local vu34 = {}
local vu35 = {}
local vu36 = vu32.rz_Functions or {}
local vu37 = vu32.rz_FarmFunctions or {}
local vu38 = vu32.rz_Settings or {
    AutoBuso = true,
    BringMobs = true,
    BringDistance = 250,
    FarmMode = "Up",
    FarmTool = "Melee",
    FarmDistance = 15,
    FarmPos = Vector3.new(0, 15, 0),
    SeaSkills = {},
    boatSelected = {},
    fishSelected = {}
}
local vu45 = vu32.rz_EnabledOptions or setmetatable({}, {
    __newindex = function(_, p39, p40)
        rawset(vu35, p39, p40 or nil)
        table.clear(vu37)
        local v41, v42, v43 = ipairs(vu36)
        while true do
            local v44
            v43, v44 = v41(v42, v43)
            if v43 == nil then
                break
            end
            if rawget(vu35, v44.Name) then
                table.insert(vu37, v44)
            end
        end
    end,
    __index = vu35
})
local vu46 = vu14.PlayerGui
if not (vu14.Team or vu14:FindFirstChild("Main")) then
    local v47 = 0
    local function v53(p48)
        local v49 = vu46["Main (minimal)"]:WaitForChild("ChooseTeam")
        local v50 = p48:find("pirate") and "Pirates" or "Marines"
        local v51 = getconnections(v49.Container[v50].Frame.TextButton.Activated)
        for v52 = 1, # v51 do
            v51[v52].Function()
        end
    end
    while not (vu14.Team or vu14:FindFirstChild("Main")) do
        if tick() - v47 >= 0.5 then
            pcall(v53, string.lower(vu1.JoinTeam or "Pirates"))
            v47 = tick()
        end
        task.wait()
    end
end
if vu32.redz_hub_error then
    vu32.redz_hub_error:Destroy()
end
local vu54 = {
    Owner = "https://raw.githubusercontent.com/newredz/"
}
vu54.Repository = vu54.Owner .. "BloxFruits/refs/heads/main/"
local function vu55()
    return identifyexecutor and identifyexecutor() or "Null"
end
local function vu58(p56)
    vu32.loadedFarm = nil
    vu32.OnFarm = false
    local v57 = Instance.new("Message", workspace)
    v57.Text = string.gsub(p56, vu54.Owner, "")
    vu32.redz_hub_error = v57
    return error(p56, 2)
end
function __httpget(p59, _)
    local v60, v61, v62 = pairs(vu54)
    while true do
        local v63
        v62, v63 = v60(v61, v62)
        if v62 == nil then
            break
        end
        local v64 = "{" .. v62 .. "}"
        if p59:find(v64) then
            p59 = p59:gsub(v64, v63)
        end
    end
    local v65, v66 = pcall(vu33, game, p59)
    if v65 then
        return v66, p59
    else
        return vu58((("[1] [%s] Failed to load script: %s\n{{ %s }}"):format(vu55(), p59, v66)))
    end
end
function __loadstring(p67, p68, p69)
    local v70, v71 = __httpget(p67)
    local v72, v73 = loadstring(v70 .. (p68 or ""))
    if type(v72) ~= "function" then
        return vu58((("[2] [%s] sintaxe error: %s\n{{ %s }}"):format(vu55(), v71, v73)))
    end
    local v74, v75
    if p69 then
        v74, v75 = pcall(v72, unpack(p69))
    else
        v74, v75 = pcall(v72)
    end
    if v74 then
        return v75
    end
    if type(v75) == "string" then
        ("[3] [%s] Execute error: %s\n{{ %s }}"):format(vu55(), v71, v75)
    end
end
vu32.rz_Functions = vu36
vu32.rz_Settings = vu38
vu32.rz_EnabledOptions = vu45
vu32.rz_FarmFunctions = vu37
local vu76 = rz_connections or {}
vu32.rz_connections = vu76
local v77, v78, v79 = ipairs(vu76)
while true do
    local v80
    v79, v80 = v77(v78, v79)
    if v79 == nil then
        break
    end
    v80:Disconnect()
end
table.clear(vu76)
local vu81 = nil
local vu82 = nil
local vu83 = nil
local vu84 = {
    Marines = function()
        vu82.FireRemote("SetTeam", "Marines")
    end,
    Pirates = function()
        vu82.FireRemote("SetTeam", "Pirates")
    end
}
local function v88(p85)
    local vu86 = vu4:GetTagged(p85)
    table.insert(vu76, vu4:GetInstanceAddedSignal(p85):Connect(function(p87)
        table.insert(vu86, p87)
    end))
    return vu86
end
local vu89 = v88("_ChestTagged")
local vu90 = v88("BerryBush")
local vu101 = {
    RemoveFog = function()
        if vu9:FindFirstChild("LightingLayers") then
            vu9.LightingLayers:Remove()
        end
    end,
    AllCodes = function()
        local v91 = __httpget("{Repository}Utils/Codes.txt")
        local v92 = string.gsub(v91, "\n", ""):split(" ")
        for v93 = 1, # v92 do
            vu29.Redeem:InvokeServer(v92[v93])
        end
    end,
    GetTimer = function(p94)
        local v95 = math.floor(p94)
        local v96 = math.floor(p94 / 60)
        local v97 = math.floor(p94 / 60 / 60)
        local v98 = v95 - v96 * 60
        local v99 = v96 - v97 * 60
        if v99 < 10 then
            v99 = "0" .. tostring(v99) or v99
        end
        local v100 = ":"
        if v98 < 10 then
            v98 = "0" .. tostring(v98) or v98
        end
        return v99 .. v100 .. v98
    end
}
local vu102 = {
    Managers = {}
}
local vu103 = vu102.Managers
local vu104 = loadstring("\n    local module = {}\n    module.__index = module\n    \n    local TweenService = game:GetService(\"TweenService\")\n    \n    local tweens = {}\n    local EasingStyle = Enum.EasingStyle.Linear\n    \n    function module.new(obj, time, prop, value)\n      local self = setmetatable({}, module)\n      \n      self.tween = TweenService:Create(obj, TweenInfo.new(time, EasingStyle), { [prop] = value })\n      self.tween:Play()\n      self.value = value\n      self.object = obj\n      \n      if tweens[obj] then\n        tweens[obj]:destroy()\n      end\n      \n      tweens[obj] = self\n      return self\n    end\n    \n    function module:destroy()\n      self.tween:Pause()\n      self.tween:Destroy()\n      \n      tweens[self.object] = nil\n      setmetatable(self, nil)\n    end\n    \n    function module:stop(obj)\n      if tweens[obj] then\n        tweens[obj]:destroy()\n      end\n    end\n    \n    return module\n  ")()
function vu103.PlayerTeleport()
    local vu105 = {
        lastCF = nil,
        lastTP = 0,
        nextNum = 1,
        BypassCooldown = 0,
        GreatTree = CFrame.new(28610, 14897, 105),
        SpawnVector = Vector3.new(0, - 25.2, 0)
    }
    local vu106 = vu82.Inventory.Unlocked
    local vu107 = vu82.GameData.Sea
    local vu108 = vu82.IsAlive
    local vu109 = vu82.FireRemote
    local vu110 = ({
        {
            ["Sky Island 1"] = Vector3.new(- 4652, 873, - 1754),
            ["Sky Island 2"] = Vector3.new(- 7895, 5547, - 380),
            ["Under Water Island"] = Vector3.new(61164, 15, 1820),
            ["Under Water Island Entrace"] = Vector3.new(3865, 20, - 1926)
        },
        {
            ["Flamingo Mansion"] = Vector3.new(- 317, 331, 597),
            ["Flamingo Room"] = Vector3.new(2283, 15, 867),
            ["Cursed Ship"] = Vector3.new(923, 125, 32853),
            ["Zombie Island"] = Vector3.new(- 6509, 83, - 133)
        },
        {
            Mansion = Vector3.new(- 12464, 376, - 7566),
            ["Hydra Island"] = Vector3.new(5651, 1015, - 350),
            ["Temple of Time"] = Vector3.new(28286, 14897, 103),
            ["Sea Castle"] = Vector3.new(- 5090, 319, - 3146),
            ["Great Tree"] = Vector3.new(2953, 2282, - 7217)
        }
    })[vu107]
    local function vu111()
        vu105.NpcDebounce = false
    end
    function vu105.talkNpc(_, p112, p113, ...)
        if vu14:DistanceFromCharacter(p112.Position) < 5 then
            if type(p113) ~= "function" then
                vu109(p113, ...)
            else
                p113()
            end
        end
    end
    function vu105.hasUnlocked(_, p114)
        if vu107 == 3 and (p114 == "Hydra Island" or (p114 == "Sea Castle" or p114 == "Mansion")) then
            return vu106["Valkyrie Helm"]
        end
        if vu107 == 2 then
            if p114 == "Flamingo Mansion" or p114 == "Flamingo Room" then
                return vu106["Swan Glasses"] or vu19.Value >= 1750
            end
            if p114 == "Zombie Island" or p114 == "Cursed Ship" then
                return vu19.Value >= 1000
            end
        end
        return true
    end
    function vu105.GetNearestPortal(p115, p116)
        local v117 = math.huge
        local v118, v119, v120 = pairs(vu110)
        local v121 = nil
        local v122 = nil
        while true do
            local v123
            v120, v123 = v118(v119, v120)
            if v120 == nil then
                break
            end
            if p115:hasUnlocked(v120) then
                local v124 = (p116 - v123).Magnitude
                if v124 < v117 then
                    v122 = v120
                    v121 = v123
                    v117 = v124
                end
            end
        end
        return v121, v122
    end
    function vu105.TeleportToGreatTree(p125)
        p125.new(p125.GreatTree, nil, true)
        p125:talkNpc(p125.GreatTree, "RaceV4Progress", "TeleportBack")
    end
    function vu105.NPCs(p126, p127, p128)
        if vu108(vu14.Character) then
            if p126.NpcDebounce and p127[p126.nextNum] then
                vu83(p127[p126.nextNum] + p126.SpawnVector)
                return nil
            end
            local v129 = vu14.Character.PrimaryPart
            if # p127 ~= 1 then
                if # p127 > 1 then
                    if p126.nextNum > # p127 then
                        p126.nextNum = 1
                    end
                    local v130 = p127[p126.nextNum]
                    if v129 and (v129.Position - v130.Position).Magnitude < 5 then
                        p126.nextNum = p126.nextNum + 1
                        p126.NpcDebounce = true
                        task.delay(1, vu111)
                    else
                        p126.new(v130, p128)
                    end
                end
            else
                p126.new(p127[1], p128)
            end
        end
    end
    function vu105.new(p131, p132, p133, p134)
        local v135 = vu105
        if vu108(vu14.Character) and (tick() - v135.lastTP >= 1 or p131 ~= v135.lastCF) then
            if vu14.Character.PrimaryPart then
                if not p133 then
                    v135.lastPosition = p131.Position
                end
                v135.lastTP = tick()
                v135.lastCF = p131
                local v136 = vu14.Character.Humanoid
                local v137 = vu14.Character.PrimaryPart
                if v136.Sit then
                    v136.Sit = false
                    return
                elseif v137.Anchored then
                    vu104:stop(v137)
                else
                    local v138 = vu38.TweenSpeed or 220
                    local v139 = p131.Position
                    local v140 = (v137.Position - v139).Magnitude
                    if v140 < 150 and not p132 then
                        vu104:stop(v137)
                        v137.CFrame = p131
                    end
                    local v141, v142 = v135:GetNearestPortal(v139)
                    local v143
                    if v141 then
                        v143 = (v139 - v141).Magnitude + 300
                    else
                        v143 = v141
                    end
                    if v141 and (tick() - v135.BypassCooldown >= 8 and v143 < v140) then
                        if v142 == "Great Tree" then
                            v135:TeleportToGreatTree()
                        else
                            vu104:stop(v137)
                            task.wait(0.2)
                            if (v139 - v141).Magnitude >= 50 then
                                v139 = v141 + (v139 - v137.Position).Unit * 40
                            end
                            vu109("requestEntrance", v139)
                            BypassCooldown = tick()
                        end
                    elseif p132 then
                        vu104.new(v137, v140 / p132, "CFrame", p131)
                    else
                        if not p134 then
                            local v144 = v137.Position
                            local v145 = CFrame.new(v144.X, v139.Y, v144.Z)
                            if (v144 - v145.Position).Magnitude > 75 then
                                vu104:stop(v137)
                                task.wait(0.1)
                                v137.CFrame = v145
                                task.wait(0.5)
                            end
                        end
                        if v140 < 380 then
                            vu104.new(v137, v140 / (v138 * 2), "CFrame", p131)
                        else
                            vu104.new(v137, v140 / v138, "CFrame", p131)
                        end
                    end
                end
            else
                return nil
            end
        else
            return nil
        end
    end
    vu82.Tween:GetPropertyChangedSignal("Parent"):Connect(function()
        if not vu82.Tween.Parent and vu108(vu14.Character) then
            vu104:stop(vu14.Character.PrimaryPart)
        end
    end)
    vu83 = vu105.new
    return vu105
end
function vu103.QuestManager()
    local vu146 = {
        QuestList = {},
        EnemyList = {},
        QuestPos = {},
        Crafts = {},
        Sea = vu82.GameData.Sea,
        takeQuestDebounce = false,
        _Position = CFrame.new(0, 0, 2.5)
    }
    local vu147 = vu14.PlayerGui:WaitForChild("Main").Quest
    local vu148 = vu147.Container.QuestTitle.Title
    local vu149 = "https://raw.githubusercontent.com/newredzBloxFruits/refs/heads/main/GameModules/"
    local vu150 = {
        GuideModule = vu5:WaitForChild("GuideModule"),
        Quests = vu5:WaitForChild("Quests"),
        SkinUtil = vu30:WaitForChild("SkinUtil")
    }
    local function v154(pu151)
        local v152, v153 = pcall(function()
            return require(vu150[pu151])
        end)
        if not v152 then
            warn(("falha a o carregar Module [ %s ] [ %s ]"):format(pu151, v153))
        end
        return v152 and v153 and v153 or loadstring(vu33(workspace, vu149 .. pu151 .. ".lua"))()
    end
    local vu155 = v154("GuideModule")
    local v156 = v154("Quests")
    local v157 = v154("SkinUtil")
    local vu158 = v157.AuraSkins or v157
    local vu159 = vu82.EnemyLocations
    local _ = vu82.EnemySpawned
    local vu160 = vu82.IsBoss
    local vu161 = {
        Colors = {
            Context = "GetSkinsInventory"
        }
    }
    local function v169(p162)
        local v163 = next
        local v164 = p162.Task
        local v165 = nil
        local v166 = {}
        local v167 = {}
        while true do
            local v168
            v165, v168 = v163(v164, v165)
            if v165 == nil then
                break
            end
            v167 = vu159[v165] or {}
            vu159[v165] = v167
            table.insert(v166, v165)
        end
        return v166, v167
    end
    task.spawn(function()
        if vu155.Data.IsFakeData then
            return nil
        end
        local v170, v171, v172 = pairs(vu155.Data.NPCList)
        while true do
            local v173
            v172, v173 = v170(v171, v172)
            if v172 == nil then
                break
            end
            vu146.QuestPos[v173.NPCName] = CFrame.new(v173.Position)
        end
        local v177 = {
            __newindex = function(p174, p175, p176)
                vu146.QuestPos[p176.NPCName] = CFrame.new(p176.Position)
                return rawset(p174, p175, p176)
            end
        }
        setmetatable(vu155.Data.NPCList, v177)
    end)
    task.spawn(vu82.RunFunctions.Quests, vu146, v156, v169)
    function vu146.GetUnlockedHakiColors(p178)
        if not p178.haki_colors or tick() - p178.haki_colors.last_update >= 30 then
            p178.haki_colors = vu31["RF/FruitCustomizerRF"]:InvokeServer(vu161.Colors)
            p178.haki_colors.last_update = tick()
        end
        return p178.haki_colors
    end
    function vu146.GetQuest(p179)
        if p179.oldLevel ~= vu19.Value or not p179.CurrentQuest then
            p179.oldLevel = vu19.Value
            local v180 = p179.Sea
            local v181 = math.clamp(vu19.Value, 0, v180 == 1 and 700 or (v180 == 2 and 1500 or vu19.Value))
            local v182, v183, v184 = ipairs(p179.QuestList)
            local v185 = nil
            local v186 = nil
            local v187 = nil
            while true do
                local v188
                v184, v188 = v182(v183, v184)
                if v184 == nil then
                    break
                end
                local v189 = v188.Enemy.Level
                local v190 = v188.Enemy.Name[1]
                if vu160(v190) then
                    if v189 <= v181 and v181 - 50 <= v189 then
                        v185 = v190
                    else
                        v185 = false
                    end
                    v186 = v188
                else
                    if v181 < v189 then
                        p179.CurrentQuest = v187
                        p179.oldBossQuest = v186
                        p179.oldBoss = v185
                        return v187
                    end
                    v187 = v188
                end
            end
            p179.CurrentQuest = v187
            p179.oldBossQuest = v186
            p179.oldBoss = v185
            return v187
        elseif p179.oldBoss and vu82.Enemies.IsSpawned(p179.oldBoss) then
            return p179.oldBossQuest
        else
            return p179.CurrentQuest
        end
    end
    function vu146.GetQuestPosition(p191, p192)
        if not vu155.Data.IsFakeData then
            return p191.QuestPos[vu155.Data.LastClosestNPC]
        end
        local v193 = vu155.Data.NPCs[p192]
        if v193 then
            v193 = vu22:FindFirstChild(v193) or vu5.NPCs:FindFirstChild(v193)
        end
        if v193 then
            v193 = v193:GetPivot()
        end
        return v193
    end
    function vu146.VerifyQuest(_, p194)
        if not vu147.Visible then
            return false
        end
        local v195 = string.gsub(vu148.Text, "-", ""):lower()
        if type(p194) == "string" then
            return string.find(v195, string.gsub(p194, "-", ""):lower())
        end
        local v196, v197, v198 = ipairs(p194)
        while true do
            local v199
            v198, v199 = v196(v197, v198)
            if v198 == nil then
                break
            end
            if string.find(v195, string.gsub(v199, "-", ""):lower()) then
                return v199
            end
        end
    end
    function vu146.StartQuest(p200, p201, p202, p203)
        if p203 and vu14:DistanceFromCharacter(p203.Position) >= 5 then
            vu83(p203 * p200._Position)
            return "Teleporting to NPC: " .. p201
        end
        if not p200.takeQuestDebounce then
            task.wait(0.5)
            vu82.FireRemote("StartQuest", p201, p202)
            return "Getting Quest: " .. p201, task.wait(0.5)
        end
        if p200.Debounce and (tick() - p200.Debounce < 75 and p200.InDebounceQuest == p202 .. p201) then
            return "Quest Debounce: " .. vu101.GetTimer(75 - (tick() - p200.Debounce))
        end
        vu38.RunningMethod = "Getting Quest: " .. p201
        task.wait(0.5)
        vu82.FireRemote("StartQuest", p201, p202)
        local v204 = p202 .. p201
        p200.Debounce = tick()
        p200.InDebounceQuest = v204
        return vu38.RunningMethod, task.wait(0.5)
    end
    function vu146.GetAuraCraft(_, p205)
        return (vu158[p205] or {}).EtcItems
    end
    function vu146.GetColorsList(_)
        local v206, v207, v208 = pairs(vu158)
        local v209 = {}
        while true do
            local v210
            v208, v210 = v206(v207, v208)
            if v208 == nil then
                break
            end
            if v210.EtcItems then
                table.insert(v209, v208)
            end
        end
        return v209
    end
    return vu146
end
function vu103.FarmManager()
    local vu211 = {
        NPCs = {},
        CanFarm = {},
        EnemyLocation = {},
        ClickPosition = Vector2.new(),
        axisDebounce = 0
    }
    local vu212 = vu82.IsAlive
    local vu213 = vu82.EnemySpawned
    local vu214 = vu82.EnemyLocations
    local vu215 = vu82.EquipTool
    local vu216 = 0
    vu211.Materials = ({
        {
            "Leather + Scrap Metal",
            "Magma Ore",
            "Fish Tail",
            "Angel Wings"
        },
        {
            "Leather + Scrap Metal",
            "Magma Ore",
            "Mystic Droplet",
            "Radiactive Material",
            "Vampire Fang"
        },
        {
            "Leather + Scrap Metal",
            "Fish Tail",
            "Gunpowder",
            "Mini Tusk",
            "Conjured Cocoa",
            "Dragon Scale"
        }
    })[vu82.GameData.Sea]
    vu211.Enemies = {
        Elites = {
            "Deandre",
            "Diablo",
            "Urban"
        },
        Bones = {
            "Reborn Skeleton",
            "Living Zombie",
            "Demonic Soul",
            "Posessed Mummy"
        },
        Katakuri = {
            "Head Baker",
            "Baking Staff",
            "Cake Guard",
            "Cookie Crafter"
        },
        Ectoplasm = {
            "Ship Deckhand",
            "Ship Engineer",
            "Ship Steward",
            "Ship Officer"
        }
    }
    vu211.FarmModes = {
        Star = function(p217, p218)
            local v219 = p218.CFrame + p217:GetNextAxis()
            if vu14:DistanceFromCharacter(v219.Position) >= 5 then
                vu83(v219)
            end
        end,
        Orbit = function(_, p220, p221)
            local v222 = p220.Parent
            local v223 = task.wait()
            local v224 = vu38.RunningOption
            local v225 = 3.5
            local v226 = 0
            while (p221 or vu38.FarmMode) == "Orbit" and (vu45[v224] and (p220 and vu212(v222))) do
                if tick() - vu216 >= 1 then
                    vu215()
                end
                EnableBuso()
                local v227 = vu38.FarmDistance
                v226 = v226 + v225 * v223
                vu83(CFrame.new(math.cos(v226) * v227, 8, math.sin(v226) * v227) + p220.Position)
                v223 = task.wait(vu38.SmoothMode and 0.1 or 0)
            end
        end,
        Up = function(_, p228)
            local v229 = p228.CFrame + vu38.FarmPos
            if vu14:DistanceFromCharacter(v229.Position) >= 5 then
                vu83(v229)
            end
        end
    }
    local vu230 = {
        ["Angel Wings"] = {
            CFrame.new(- 7742, 5634, - 1564)
        },
        ["Leather + Scrap Metal"] = {
            CFrame.new(- 1257, 54, 4091),
            CFrame.new(- 1100, 77, 1152),
            CFrame.new(- 364, 116, 5692)
        },
        ["Magma Ore"] = {
            CFrame.new(- 5408, 11, 8456),
            CFrame.new(- 5241, 50, - 4713)
        },
        ["Fish Tail"] = {
            CFrame.new(60931, 19, 1574),
            false,
            CFrame.new(- 10679, 398, - 8975)
        },
        ["Mystic Droplet"] = {
            false,
            CFrame.new(- 3350, 282, - 10527)
        },
        ["Radiactive Material"] = {
            false,
            CFrame.new(- 73, 149, - 112)
        },
        ["Vampire Fang"] = {
            false,
            CFrame.new(- 6030, 6, - 1281)
        },
        Gunpowder = {
            false,
            false,
            CFrame.new(- 394, 135, 5981)
        },
        ["Mini Tusk"] = {
            false,
            false,
            CFrame.new(- 13510, 584, - 6986)
        },
        ["Conjured Cocoa"] = {
            false,
            false,
            CFrame.new(400, 81, - 12257)
        },
        ["Dragon Scale"] = {
            false,
            false,
            CFrame.new(6689, 378, 331)
        }
    }
    local vu231 = {
        ["Leather + Scrap Metal"] = {
            {
                "Pirate",
                "Brute",
                "Scrap Metal",
                "Pirate Millionaire"
            },
            {
                true,
                true,
                true
            }
        },
        ["Angel Wings"] = {
            {
                "Royal Soldier",
                "Royal Squad"
            },
            {
                true,
                false,
                false
            }
        },
        ["Magma Ore"] = {
            {
                "Military Soldier",
                "Lava Pirate"
            },
            {
                true,
                true,
                false
            }
        },
        ["Fish Tail"] = {
            {
                "Fishman Warrior",
                "Fishman Captain",
                "Fishman Raider"
            },
            {
                true,
                false,
                true
            }
        },
        ["Conjured Cocoa"] = {
            {
                "Cocoa Warrior",
                "Chocolate Bar Battler"
            },
            {
                false,
                false,
                true
            }
        },
        ["Mystic Droplet"] = {
            {
                "Water Fighter"
            },
            {
                false,
                true,
                false
            }
        },
        ["Radiactive Material"] = {
            {
                "Factory Staff"
            },
            {
                false,
                true,
                false
            }
        },
        ["Vampire Fang"] = {
            {
                "Vampire"
            },
            {
                false,
                true,
                false
            }
        },
        Gunpowder = {
            {
                "Pistol Billionaire"
            },
            {
                false,
                false,
                true
            }
        },
        ["Mini Tusk"] = {
            {
                "Mythological Pirate"
            },
            {
                false,
                false,
                true
            }
        },
        ["Dragon Scale"] = {
            {
                "Dragon Crew Archer"
            },
            {
                false,
                false,
                true
            }
        }
    }
    function vu211.ToolDebounce()
        vu216 = tick()
    end
    function vu211.TargetPosition(p232)
        if typeof(p232) == "CFrame" then
            vu83(p232)
            EnableBuso()
            vu215()
        end
    end
    function vu211.GetNextAxis(p233)
        if tick() - p233.axisDebounce <= 0.4 then
            return p233.nextAxis
        end
        local v234 = Vector3[math.random() <= 0.5 and "xAxis" or "zAxis"] * (math.random() <= 0.5 and vu38.FarmDistance or - vu38.FarmDistance) + Vector3.yAxis * 8
        local v235 = tick()
        p233.nextAxis = v234
        p233.axisDebounce = v235
        return v234
    end
    function vu211.Mastery(_, p236, p237)
        local v238 = p237.Health
        local v239 = vu25
        local v240, v241, v242 = ipairs(v239:GetChildren())
        while true do
            local v243
            v242, v243 = v240(v241, v242)
            if v242 == nil then
                break
            end
            if v243.PrimaryPart then
                local v244 = v243:FindFirstChild("Humanoid")
                if v244 and (v244.Health > 0 and v244.Health <= v238) then
                    v238 = v244.Health
                    p236 = v243.PrimaryPart
                    p237 = v244
                end
            end
        end
        local v245 = p236.CFrame + vu38.FarmPos
        local v246 = p237.Health / p237.MaxHealth * 100
        vu215(v246 <= vu38.mHealth and vu38.mTool or "Melee", true)
        vu82:BringEnemies(p236.Parent)
        EnableBuso()
        if vu14:DistanceFromCharacter(v245.Position) >= 2.5 then
            vu83(v245)
        end
        if v246 <= vu38.mHealth and vu14:DistanceFromCharacter(v245.Position) < 5 then
            vu82.Hooking:SetTarget(p236, p236.Parent, true)
            vu82.UseSkills(p236, vu38.MasterySkills)
        end
    end
    function vu211.attack(p247, p248, p249, p250)
        local v251 = p247:FindFirstChild("Humanoid")
        if not v251 then
            return nil
        end
        if vu45.Mastery and v251.MaxHealth < 40000 then
            vu211:Mastery(p247.PrimaryPart, v251)
            return true
        end
        if p248 then
            vu82:BringEnemies(p247, p249)
        end
        if tick() - vu216 >= 1 then
            vu215()
        end
        EnableBuso()
        vu211.FarmModes[p250 or vu38.FarmMode](vu211, p247.PrimaryPart, p250)
        if vu38.SmoothMode and ((p250 or vu38.FarmMode) ~= "Orbit" and (task.wait(0.1) and (vu212(p247) and (p247.PrimaryPart and vu45[vu38.RunningOption])))) then
            local v252 = vu38
            local v253 = vu32
            local v254 = "Killing: " .. p247.Name
            v253.OnFarm = true
            v252.RunningMethod = v254
            vu211.attack(p247, p248, p249, p250)
        end
        return true
    end
    function vu211.Material(p255, p256)
        local v257 = vu230[p256]
        if v257 then
            v257 = vu230[p256][vu82.GameData.Sea]
        end
        local v258 = vu231[p256]
        if v258 then
            local v259 = p255.EnemyLocation
            local v260 = p255.CanFarm
            if v260[p256] == nil then
                if v258[2][vu82.GameData.Sea] then
                    v260[p256] = true
                else
                    v260[p256] = false
                end
            end
            if not v260[p256] then
                return nil
            end
            if v259[p256] == nil then
                local v261, v262, v263 = ipairs(v258[1])
                while true do
                    local v264
                    v263, v264 = v261(v262, v263)
                    if v263 == nil then
                        break
                    end
                    local v265 = vu214[v264]
                    if v265 and # v265 > 0 then
                        v259[p256] = v265
                    end
                end
                if not v259[p256] then
                    v259[p256] = false
                end
            end
            local v266, v267, v268 = ipairs(v258[1])
            while true do
                local v269
                v268, v269 = v266(v267, v268)
                if v268 == nil then
                    break
                end
                local v270 = vu213(v269)
                if v270 and v270.PrimaryPart then
                    p255.attack(v270, true, true)
                    return "Killing: " .. v269
                end
            end
            if v259[p256] then
                vu103.PlayerTeleport:NPCs(v259[p256])
            else
                vu83(v257)
            end
            return "Farming Material: " .. p256
        end
    end
    function vu211.GetNpcPosition(p271, p272)
        if p271.NPCs[p272] then
            return p271.NPCs[p272]:GetPivot()
        end
        local v273 = vu22:FindFirstChild(p272) or vu5.NPCs:FindFirstChild(p272)
        if v273 then
            p271.NPCs[p272] = v273
            local _ = v273.GetPivot
        end
    end
    return vu211
end
function vu103.RaidManager()
    if vu82.GameData.Sea ~= 2 and vu82.GameData.Sea ~= 3 then
        return nil
    end
    local v274 = {}
    local _ = vu82.GameData.Sea ~= 2
    v274.RaidPosition = CFrame.new(- 5033, 315, - 2950)
    v274.requests = {}
    v274.Require = 0
    v274.Timer = vu14.PlayerGui:WaitForChild("Main").Timer
    v274.Button = vu82.GameData.Sea == 2 and "CircleIsland.RaidSummon2.Button.Main" or (vu82.GameData.Sea == 3 and "Boat Castle.RaidSummon2.Button.Main" or false)
    function v274.IsRaiding(_)
        local v275 = vu45.Raid
        if v275 then
            v275 = vu14:GetAttribute("IslandRaiding")
        end
        return v275
    end
    function v274.GetRaidIsland(_)
        return vu82:GetRaidIsland()
    end
    function v274.CanStartRaid(_)
        local v276
        if vu19.Value < 1200 then
            v276 = false
        else
            v276 = VerifyTool("Special Microchip")
        end
        return v276
    end
    function v274.start(p277)
        if not p277:IsRaiding() and p277:CanStartRaid() then
            local v278 = p277.Button:split(".")
            local v279 = vu21
            for v280 = 1, # v278 do
                if v279 then
                    v279 = v279:FindFirstChild(v278[v280])
                end
            end
            if v279 and v279:FindFirstChild("ClickDetector") then
                fireclickdetector(v279.ClickDetector)
                task.wait(1)
            else
                local _ = p277.RaidPosition
            end
        end
    end
    function v274.requestFragment(p281, p282, p283)
        if p281.requests[p282] then
            return nil
        end
        p281.Require = p281.Require + (p283 or 0)
    end
    return v274
end
function vu103.ItemsQuests()
    local vu284 = {
        CursedDualKatana = {},
        SkullGuitar = {}
    }
    local vu285 = vu82.Enemies.IsSpawned
    local vu286 = vu82.EnemySpawned
    local vu287 = vu82.EnemyLocations
    local vu288 = vu82.EquipTool
    local vu289 = vu82.FireRemote
    if vu82.GameData.Sea == 3 then
        local vu290 = nil
        local function vu299()
            if vu290 and vu290.Value > 0 then
                return vu290
            end
            local v291 = math.huge
            local v292, v293, v294 = ipairs(vu14.QuestHaze:GetChildren())
            local v295 = nil
            while true do
                local v296
                v294, v296 = v292(v293, v294)
                if v294 == nil then
                    break
                end
                if v296.Value > 0 then
                    local v297 = v296:GetAttribute("Position")
                    local v298
                    if typeof(v297) ~= "Vector3" then
                        v298 = false
                    else
                        v298 = vu14:DistanceFromCharacter(v297)
                    end
                    if v298 then
                        if v298 <= v291 then
                            v295 = v296
                            v291 = v298
                        end
                    end
                end
            end
            vu290 = v295
            return v295
        end
        local function vu303(p300)
            for v301 = 1, 3 do
                local v302 = p300:FindFirstChild("Torch" .. v301)
                if v302 then
                    if v302:FindFirstChild("ProximityPrompt") then
                        if v302.ProximityPrompt.Enabled then
                            return v302
                        end
                    end
                end
            end
        end
        local function vu307(p304)
            for v305 = 1, 3 do
                local v306 = p304:FindFirstChild("Pedestal" .. v305)
                if v306 then
                    if v306:FindFirstChild("ProximityPrompt") then
                        if v306.ProximityPrompt.Enabled then
                            return v306
                        end
                    end
                end
            end
        end
        local function vu316(p308)
            local v309 = math.huge
            local v310, v311, v312 = ipairs(vu5.NPCs:GetChildren())
            local v313 = nil
            while true do
                local v314
                v312, v314 = v310(v311, v312)
                if v312 == nil then
                    break
                end
                if v314.Name == "Luxury Boat Dealer" and not p308[v314] then
                    local v315 = v314.PrimaryPart
                    if v315 and vu14:DistanceFromCharacter(v315.Position) <= v309 then
                        v309 = vu14:DistanceFromCharacter(v315.Position)
                        v313 = v314
                    end
                end
            end
            return v313
        end
        local v328 = {
            function(p317, _)
                if VerifyTool("Yama") then
                    vu288("Yama")
                    local v318 = vu286("Forest Pirate")
                    if v318 and v318.PrimaryPart then
                        vu82.AttackCooldown = tick()
                        vu83(v318.PrimaryPart.CFrame * CFrame.new(0, 0, - 2))
                    else
                        vu83(p317.ForestPirate)
                    end
                else
                    vu289("LoadItem", "Yama")
                end
                return true
            end,
            function(_, _)
                local v319 = vu14:FindFirstChild("QuestHaze") and vu299()
                if v319 then
                    local v320 = v319.Name
                    local v321 = vu286(v320)
                    if v321 and v321.PrimaryPart then
                        vu103.FarmManager.attack(v321, true)
                    elseif vu287[v320] then
                        vu103.PlayerTeleport:NPCs(vu287[v320])
                    else
                        vu83(v319:GetAttribute("Position"))
                    end
                    return true
                end
            end,
            function(p322, p323)
                local v324 = vu21:FindFirstChild("HellDimension")
                if v324 then
                    local v325 = vu303(v324) or v324:FindFirstChild("Exit")
                    if v325 and vu14:DistanceFromCharacter(v325.Position) <= 600 then
                        local v326 = vu286(p322.Hell)
                        if v326 and v326.PrimaryPart then
                            vu83(v326.PrimaryPart.CFrame + vu38.FarmPos)
                            return true, vu82.KillAura(125)
                        end
                        if v325.Name == "Exit" or vu14:DistanceFromCharacter(v325.Position) >= 5 then
                            vu83(v325.CFrame)
                        else
                            fireproximityprompt(v325.ProximityPrompt)
                        end
                    end
                    return true
                end
                if not vu285("Soul Reaper") then
                    return p323.SoulReaper() or p323.Bones()
                end
                local v327 = vu286("Soul Reaper")
                if v327 and v327.PrimaryPart and vu14:DistanceFromCharacter(v327.PrimaryPart.Position) > 6 then
                    vu83(v327.PrimaryPart.CFrame * CFrame.new(0, 0, - 2))
                    return true
                end
            end
        }
        vu284.CursedDualKatana.Yama = v328
        local v337 = {
            function(p329, _)
                if vu14:FindFirstChild("BoatQuest") then
                    local v330 = p329.CurrentDealer
                    if not v330 or p329.BoatsDealer[v330] then
                        v330 = vu22:FindFirstChild("Luxury Boat Dealer")
                        if not v330 or (not v330.PrimaryPart or p329.BoatsDealer[v330]) then
                            v330 = vu316(p329.BoatsDealer)
                        end
                    end
                    if v330 and v330.PrimaryPart then
                        if p329.CurrentDealer ~= v330 then
                            p329.CurrentDealer = v330
                        end
                        if vu14:DistanceFromCharacter(v330.PrimaryPart.Position) >= 5 then
                            return true, vu83(v330.PrimaryPart.CFrame)
                        end
                        if vu289("CDKQuest", "BoatQuest", v330, "Check") then
                            vu289("CDKQuest", "BoatQuest", v330)
                        end
                        p329.BoatsDealer[v330] = true
                    else
                        task.wait(0.5)
                    end
                end
            end,
            function(_, p331)
                return p331.PirateRaid()
            end,
            function(p332, _)
                local v333 = vu21:FindFirstChild("HeavenlyDimension")
                if v333 then
                    local v334 = vu303(v333) or v333:FindFirstChild("Exit")
                    if v334 and vu14:DistanceFromCharacter(v334.Position) <= 600 then
                        local v335 = vu286(p332.Heaven)
                        if v335 and v335.PrimaryPart then
                            vu83(v335.PrimaryPart.CFrame + vu38.FarmPos)
                            return true, vu82.KillAura(125)
                        end
                        if v334.Name == "Exit" or vu14:DistanceFromCharacter(v334.Position) >= 5 then
                            vu83(v334.CFrame)
                        else
                            fireproximityprompt(v334.ProximityPrompt)
                        end
                    end
                    return true
                end
                if vu285("Cake Queen") then
                    local v336 = vu286("Cake Queen")
                    if v336 and v336.PrimaryPart then
                        vu103.FarmManager.attack(v336)
                    else
                        vu83(p332.CakeQueen)
                    end
                    return true
                end
            end
        }
        vu284.CursedDualKatana.Tushita = v337
        function vu284.CursedDualKatana.FinalQuest(p338, _)
            if VerifyTool("Tushita") or VerifyTool("Yama") then
                if vu285("Cursed Skeleton Boss") then
                    local v339 = vu286("Cursed Skeleton Boss")
                    if not (v339 and v339.PrimaryPart) then
                        return nil
                    end
                    vu288("Sword", true)
                    vu103.FarmManager.ToolDebounce()
                    vu103.FarmManager.attack(v339)
                    return true
                end
                if vu14.PlayerGui.Main.Dialogue.Visible then
                    vu6:ClickButton1(Vector2.new(10000, 10000))
                end
                local v340 = vu307(vu21.Turtle.Cursed)
                if v340 then
                    if vu14:DistanceFromCharacter(v340.Position) >= 5 then
                        vu83(v340.CFrame)
                    else
                        fireproximityprompt(v340.ProximityPrompt)
                    end
                    return true
                end
                local v341 = vu14:DistanceFromCharacter(p338.CursedSkeleton[1].Position)
                if v341 > 6 then
                    vu83(p338.CursedSkeleton[1], v341 <= 100 and 40 or false)
                else
                    vu83(p338.CursedSkeleton[2])
                end
                task.wait(0.5)
                return true
            end
            vu289("LoadItem", "Yama")
        end
    end
    if vu82.GameData.Sea == 3 then
        local vu342 = CFrame.new(5867, 1208, 872)
        local vu343 = CFrame.new(5771, 1209, 804)
        local vu344 = vu31:WaitForChild("RF/InteractDragonQuest")
        local vu345 = vu82.Inventory.Count
        local vu346 = vu82.Inventory.Unlocked
        local vu347 = {
            Progress = {},
            CurrentBelt = "Null",
            YellowQuest = ToDictionary({
                "Piranha",
                "Shark"
            }),
            RedQuest = ToDictionary({
                "Terrorshark",
                "Sea Beast"
            })
        }
        local vu348 = {
            CheckStart = {
                "CanTransform",
                "CanLearnTether",
                "TetherLearned",
                "AvailableVQuest"
            },
            Complete = {
                NPC = "Dragon Wizard",
                Command = "Ascension",
                Action = "Complete"
            },
            Begin = {
                NPC = "Dragon Wizard",
                Command = "Ascension",
                Action = "Begin"
            },
            LearnTether = {
                NPC = "Dragon Wizard",
                Command = "LearnTether"
            },
            BuyDraco = {
                NPC = "Dragon Wizard",
                Command = "DragonRace"
            }
        }
        local vu349 = {
            DojoClaim = {
                NPC = "Dojo Trainer",
                Command = "ClaimQuest"
            },
            DojoProgress = {
                NPC = "Dojo Trainer",
                Command = "RequestQuest"
            },
            SpeakWizard = {
                NPC = "Dragon Wizard",
                Command = "Speak"
            },
            RaceV3 = ToDictionary({
                "Terrorshark",
                "Sea Beast"
            })
        }
        function vu347.CollectReward(_, p350)
            if vu346["Dojo Belt (" .. p350 .. ")"] then
                vu347.Progress[p350] = nil
                return nil
            else
                if vu14:DistanceFromCharacter(vu342.Position) > 3 then
                    vu83(vu342)
                else
                    vu344:InvokeServer(vu349.DojoClaim)
                    vu284.CurrentBeltQuest = nil
                end
                return true
            end
        end
        function vu347.White(p351, p352)
            if p351.Progress.White < 20 then
                return p352.Level()
            else
                return p351:CollectReward("White")
            end
        end
        function vu347.Green(p353)
            if p353.Progress.Green >= 330 then
                return p353:CollectReward("Green")
            end
            if vu14:GetAttribute("DangerLevel") >= 500 and p353.GreenTimer then
                p353.Progress.Green = p353.Progress.Green + (tick() - p353.GreenTimer)
            end
            p353.GreenTimer = tick()
            if vu103.SeaManager:GetPlayerBoat() then
                vu103.SeaManager:RandomTeleport("inf")
            else
                vu103.SeaManager:BuyNewBoat()
            end
            return true
        end
        function vu347.Purple(p354, p355)
            if p354.Progress.Purple >= 3 then
                return p354:CollectReward("Purple")
            end
            if p354.PurpleProgress then
                if p355.EliteHunter() then
                    return true
                end
                local v356 = vu82
                p354.Progress.Purple = p354.StartPurpleProgress + (v356:GetProgress("EliteProgress", "EliteHunter", "Progress") - p354.PurpleProgress)
            else
                p354.StartPurpleProgress = p354.Progress.Purple
                p354.PurpleProgress = vu82:GetProgress("EliteProgress", "EliteHunter", "Progress")
            end
        end
        function vu347.Red(p357, p358)
            if p357.Progress.Red < 1 then
                return p358.Sea(p357.RedQuest)
            else
                return p357:CollectReward("Red")
            end
        end
        function vu347.Yellow(p359, p360)
            if p359.Progress.Yellow < 5 then
                return p360.Sea(p359.YellowQuest)
            else
                return p359:CollectReward("Yellow")
            end
        end
        function vu347.Blue(p361, p362)
            if p361.Progress.Blue >= 1 then
                return p361:CollectReward("Blue")
            end
            if vu14.Character then
                local v363 = vu14.Character:FindFirstChildOfClass("Tool")
                if v363 and (v363:FindFirstChild("Fruit") and (v363.ToolTip ~= "Blox Fruit" and v363:GetAttribute("DroppedBy"))) and v363:GetAttribute("DroppedBy"):len() > 0 then
                    p361.Progress.Blue = 1
                    return nil
                end
                local v364, v365, v366 = ipairs(vu14.Backpack:GetChildren())
                while true do
                    local v367
                    v366, v367 = v364(v365, v366)
                    if v366 == nil then
                        break
                    end
                    if v367:IsA("Tool") and (v367:FindFirstChild("Fruit") and (v367.ToolTip ~= "Blox Fruit" and v363:GetAttribute("DroppedBy"))) and v363:GetAttribute("DroppedBy"):len() > 0 then
                        p361.Progress.Blue = 1
                        return nil
                    end
                end
                local _ = p362.Fruits
            end
        end
        function vu347.Black(p368, p369)
            if p368.Progress.Black < 3 then
                if p368.BlackProgress then
                    p368.Progress.Black = vu345["Dinosaur Bones"] - p368.BlackProgress
                    return p369.LavaGolem() or (p369.PrehistoricBones() or p369.PrehistoricIsland())
                else
                    p368.BlackProgress = p368.Progress.Black - vu345["Dinosaur Bones"]
                    return true
                end
            else
                return p368:CollectReward("Black")
            end
        end
        function vu284.BeltProgress(p370, p371, p372)
            if vu347.CurrentBelt ~= p371 then
                if p370.CurrentDracoQuest and p370.CurrentDracoQuest.AvailableVQuest == "V3InProgress" then
                    p370.KilledTerrorshark = true
                end
            else
                vu347.Progress[p371] = vu347.Progress[p371] + p372
            end
        end
        function vu284.BeltQuest(p373, p374, p375)
            local v376 = p374.BeltName
            if vu347[v376] then
                if vu346["Dojo Belt (" .. v376 .. ")"] then
                    return p373:GetNextBeltQuest()
                end
                if not (vu347.Progress[v376] and p374.UpdatedProgress) then
                    local v377 = vu347.Progress
                    local v378 = p374.Progress
                    p374.UpdatedProgress = true
                    v377[v376] = v378
                end
                vu347.CurrentBelt = v376
                if vu347[v376](vu347, p375) then
                    return "Belt Quest: " .. v376
                end
            end
        end
        function vu284.GetNextBeltQuest(p379)
            if vu14:DistanceFromCharacter(vu342.Position) > 5 then
                vu83(vu342)
            else
                p379.CurrentBeltQuest = vu344:InvokeServer(vu349.DojoProgress)
            end
            return "Getting Belt Quest"
        end
        function vu284.BeltQuests(p380, p381)
            local v382 = p380.CurrentBeltQuest
            if type(v382) ~= "table" then
                local _ = p380.GetNextBeltQuest
            else
                if v382.Timeout or v382.Completed then
                    return nil
                end
                if v382.Quest then
                    return p380:BeltQuest(v382.Quest, p381)
                end
            end
        end
        function vu284.SpeakWizard(p383)
            if vu14:DistanceFromCharacter(vu343.Position) > 5 then
                vu83(vu343)
            else
                p383.CurrentDracoQuest = vu344:InvokeServer(vu349.SpeakWizard)
            end
            return "Teleporting to NPC: Dragon Wizard"
        end
        function vu284.TalkNpc(p384, p385, p386, p387)
            if vu14:DistanceFromCharacter(p385.Position) > 5 then
                vu83(p385)
            elseif vu344:InvokeServer(p386) and p387 then
                p384[p387] = nil
            end
            return "Teleporting to NPC: " .. (p386.NPC or "???")
        end
        function vu284.GetDracoRace(p388, p389)
            if not vu346["Dojo Belt (Black)"] then
                return p389.DojoTrainer()
            end
            local v390 = p388.CurrentDracoQuest
            if type(v390) ~= "table" then
                local _ = p388.SpeakWizard
            else
                if not (v390.TetherLearned or v390.CanLearnTether) then
                    return nil
                end
                if not v390.FoundPrehistoric then
                    return p389.PrehistoricBones() or p389.PrehistoricEgg() or (p389.LavaGolem() or p389.PrehistoricIsland())
                end
                if vu15.Race.Value ~= "Draco" then
                    if v390.CanTransform or v390.CanTransformFree then
                        return p388:TalkNpc(vu343, vu348.BuyDraco, "CurrentDracoQuest")
                    elseif v390.TetherLearned then
                        if vu346["Dragon Egg"] then
                            return p388:TalkNpc(vu343, vu348.BuyDraco, "CurrentDracoQuest")
                        else
                            return p389.PrehistoricBones() or p389.PrehistoricEgg() or (p389.LavaGolem() or p389.PrehistoricIsland())
                        end
                    else
                        return p388:TalkNpc(vu343, vu348.LearnTether, "CurrentDracoQuest")
                    end
                end
                local v391 = v390.AvailableVQuest
                if v391 == "V2" or v391 == "V3" then
                    return p388:TalkNpc(vu343, vu348.Begin, "CurrentDracoQuest")
                end
                if v391 == "V2InProgress" then
                    if vu345["Fire Flower"] < 5 then
                        return vu45.EliteHunter and p389.EliteHunter() or (vu45.BerryBush and vu45.BerryBush() or p389.FireFlowers(5))
                    else
                        return p388:TalkNpc(vu343, vu348.Complete, "CurrentDracoQuest")
                    end
                end
                if v391 == "V3InProgress" then
                    if p388.KilledTerrorshark then
                        return p388:TalkNpc(vu343, vu348.Complete, "CurrentDracoQuest")
                    else
                        return p389.Sea(vu349.RaceV3)
                    end
                end
                if v391 == "V2TurnInReady" then
                    if vu15.Level.Value < 1000000 then
                        return p389.Level()
                    else
                        return p388:TalkNpc(vu343, vu348.Complete, "CurrentDracoQuest")
                    end
                end
                if v391 == "V3TurnInReady" then
                    if vu15.Level.Value < 3000000 then
                        return p389.Level()
                    else
                        return p388:TalkNpc(vu343, vu348.Complete, "CurrentDracoQuest")
                    end
                end
            end
        end
    end
    return vu284
end
function vu103.IslandManager()
    return {
        Islands = {},
        GetMirageFruitDealer = function(p392)
            if p392.MirageFruitDealer then
                return p392.MirageFruitDealer
            end
            local v393 = vu22:FindFirstChild("Advanced Fruit Dealer") or vu5.NPCs:FindFirstChild("Advanced Fruit Dealer")
            if v393 then
                p392.MirageFruitDealer = v393
                return v393
            end
        end,
        GetMirageGear = function(p394, p395)
            if p394.MirageGear and p394.MirageGear.Parent then
                return p394.MirageGear
            end
            local v396, v397, v398 = ipairs(p395:GetChildren())
            while true do
                local v399
                v398, v399 = v396(v397, v398)
                if v398 == nil then
                    break
                end
                if v399:IsA("MeshPart") and v399.MeshId == "rbxassetid://10153114969" then
                    p394.MirageGear = v399
                    return v399
                end
            end
        end,
        GetMirageTop = function(p400, p401)
            if p400.MirageTop and p400.MirageTop.Parent then
                return p400.MirageTop
            end
            local v402, v403, v404 = ipairs(p401:GetChildren())
            while true do
                local v405
                v404, v405 = v402(v403, v404)
                if v404 == nil then
                    break
                end
                local v406 = v405:FindFirstChild("dbz_map1_Cube.012")
                if v406 then
                    p400.MirageTop = v406
                    return v406
                end
            end
        end,
        GetPrehistoricActivationPrompt = function(p407, p408)
            local v409 = p407.PrehistoricPrompt
            if v409 and v409:IsDescendantOf(vu21) then
                return v409
            end
            local v410 = p408:FindFirstChild("Core")
            if v410 and v410:FindFirstChild("ActivationPrompt") then
                p407.PrehistoricPrompt = v410.ActivationPrompt
                return v410.ActivationPrompt
            end
        end,
        GetSpawnedIsland = function(p411, p412)
            local v413 = p411.Islands[p412]
            if v413 and v413.Parent == vu21 then
                return v413
            end
            local v414 = vu21:FindFirstChild(p412)
            if v414 then
                p411.Islands[p412] = v414
                return v414
            end
        end
    }
end
function vu103.EspManager()
    local vu415 = {}
    vu415.__index = vu415
    function vu415.__newindex(p416, p417, p418)
        if p417 == "Enabled" then
            return task.spawn(p416.toggle, p416, p418)
        else
            return rawset(p416, p417, p418)
        end
    end
    local function vu420(p419)
        if p419:FindFirstChild("Humanoid") then
            return p419.PrimaryPart or p419
        elseif p419:FindFirstChild("Handle") then
            return p419.Handle
        else
            return p419
        end
    end
    local function vu422(p421)
        if p421.Object and p421.Section.List[p421.Object] then
            p421.Section.List[p421.Object] = nil
        end
        if p421.EspHandle then
            p421.EspHandle:Destroy()
        end
    end
    local vu423 = vu82.FruitsName
    local vu424 = "%s<font color=\'rgb(160, 160, 160)\'> [ %im ]</font>\n<font color=\'rgb(25, 240, 25)\'>[%i/%i]</font>"
    local vu425 = Instance.new("Folder", vu11)
    vu425.Name = "rz_EspFolder"
    local v426 = vu11:FindFirstChild(vu425.Name)
    if v426 and v426 ~= vu425 then
        v426:Destroy()
    end
    function vu415.new(p427, p428, p429, p430)
        local v431 = setmetatable({}, vu415)
        local v432 = Instance.new("Folder", vu425)
        v432.Name = p427
        v431.List = {}
        v431.Name = p427
        v431.Folder = v432
        v431.IsEnabled = p430
        v431.Instance = p428
        v431.IsEspObject = p429
        return v431
    end
    function vu415.clear(p433)
        p433.Folder:ClearAllChildren()
        table.clear(p433.List)
    end
    function vu415.add(pu434, p435, p436, p437, _)
        local vu438 = {
            Section = pu434,
            Color = p436 or Color3.fromRGB(255, 255, 255),
            Name = p437 or p435.Name,
            Object = p435,
            EspHandle = nil
        }
        local v439 = Instance.new("BoxHandleAdornment")
        v439.Size = Vector3.new(1, 0, 1, 0)
        v439.AlwaysOnTop = true
        v439.ZIndex = 10
        v439.Transparency = 0
        local v440 = Instance.new("BillboardGui")
        v440.Adornee = p435
        v440.Size = UDim2.new(0, 100, 0, 150)
        v440.StudsOffset = Vector3.new(0, 2, 0)
        v440.AlwaysOnTop = true
        local vu441 = Instance.new("TextLabel")
        vu441.BackgroundTransparency = 1
        vu441.Position = UDim2.new(0, 0, 0, - 50)
        vu441.Size = UDim2.new(0, 100, 0, 100)
        vu441.TextSize = 10
        vu441.TextColor3 = vu438.Color
        vu441.TextStrokeTransparency = 0
        vu441.TextYAlignment = Enum.TextYAlignment.Bottom
        vu441.Text = "..."
        vu441.ZIndex = 15
        vu441.RichText = true
        vu441.Parent = v440
        v440.Parent = v439
        v439.Parent = pu434.Folder
        vu438.EspHandle = v439
        task.spawn(function()
            local v442 = pu434.IsEnabled
            local v443 = vu438.EspHandle
            local v444 = vu438.Object
            while true do
                if not (vu38.SmoothMode and task.wait(0.25)) then
                    vu13:Wait()
                end
                if not v444 or (not v444:IsDescendantOf(workspace) or (not v443 or v442 and not v442(v444))) then
                    return vu422(vu438)
                end
                local v445 = vu420(v444)
                if not v445 then
                    return vu422(vu438)
                end
                if v445:IsA("Model") then
                    v445 = v445:GetPivot()
                end
                local v446 = vu14
                local v447 = math.floor(v446:DistanceFromCharacter(v445.Position) / 5)
                local v448 = v444:FindFirstChildOfClass("Humanoid")
                if v448 then
                    vu441.Text = vu424:format(vu438.Name, v447, math.floor(v448.Health), math.floor(v448.MaxHealth))
                elseif v444.Parent ~= workspace or v444.Name ~= "Fruit " then
                    vu441.Text = ("%s < %i >"):format(vu438.Name, v447)
                else
                    vu441.Text = "Fruit [ ??? ]"
                    vu441.Text = ("%s < %i >"):format(vu423[v444], v447)
                end
            end
        end)
        return vu438
    end
    function vu415.toggle(p449, p450)
        local v451 = "Esp" .. p449.Name
        vu32[v451] = p450
        local v452 = p449.IsEnabled
        local v453 = p449.Instance
        local v454 = p449.IsEspObject
        while vu32[v451] do
            local v455
            if type(v453) ~= "table" or not v453 then
                v455 = v453:GetChildren()
            else
                v455 = v453
            end
            for v456 = 1, # v455 do
                local v457 = v455[v456]
                if not p449.List[v457] then
                    local v458, v459, v460, v461 = v454(v457)
                    if v458 then
                        p449.List[v457] = p449:add(v461 or v457, v459, v460, v452)
                    end
                end
            end
            task.wait(0.25)
        end
        p449:clear()
    end
    return vu415
end
function vu103.SeaManager()
    if vu82.GameData.Sea == 1 then
        return nil
    end
    local v462 = {
        oldTool = "Melee",
        SeaEvents = {},
        BoatTweenDebounce = 0,
        randomNumber = 1,
        toolDebounce = 0,
        rdDebounce = 0,
        nextNum = 1,
        SeaEnemyVector = Vector3.new(0, 32, 0),
        DodgeVector = Vector3.new(0, 160, 0),
        nextTool = {
            Melee = "Blox Fruit",
            ["Blox Fruit"] = "Sword",
            Sword = "Gun",
            Gun = "Melee"
        },
        BuyBoat = {
            Position = vu82.GameData.Sea == 2 and CFrame.new(94, 10, 2951) or CFrame.new(- 6123, 16, - 2247),
            TikiIsland = CFrame.new(- 16917, 9, 510),
            BoatName = "BeastHunter",
            OthersBoats = {
                "BeastHunter",
                "Guardian",
                "Lantern",
                "Sleigh",
                "PirateGrandBrigade",
                "MarineGrandBrigade"
            }
        },
        RandomPosition = ({
            false,
            {
                CFrame.new(- 43, 21, 5054),
                CFrame.new(1744, 21, 4393),
                CFrame.new(1003, 21, 3598),
                CFrame.new(- 935, 21, 3813)
            },
            {
                inf = - 100000000,
                ["6"] = - 43200,
                ["5"] = - 38200,
                ["4"] = - 34000,
                ["3"] = - 30000,
                ["2"] = - 26000,
                ["1"] = - 22000
            }
        })[vu82.GameData.Sea],
        Directions = {
            Vector3.new(60, 0, 0),
            Vector3.new(0, 0, 60),
            Vector3.new(- 60, 0, 0),
            Vector3.new(0, 0, - 60),
            Vector3.new(0, 0, 0)
        },
        TerrorSkills = {
            "FinalSpinAttachment",
            "GroundExplosionSplashStart",
            "SpinSlash",
            "SpinSlash3",
            "SpinSlash4"
        }
    }
    local _ = vu82.Inventory.Unlocked
    local vu463 = vu82.Inventory.Count
    local vu464 = vu82.IsAlive
    local vu465 = vu82.UseSkills
    local vu466 = vu82.EquipTool
    local vu467 = vu82.FireRemote
    local vu468 = nil
    local vu469 = vu29:WaitForChild("SubclassNetwork")
    if vu82.GameData.Sea == 3 then
        local v470 = v462.RandomPosition
        local v471, v472, v473 = pairs(v470)
        while true do
            local v474
            v473, v474 = v471(v472, v473)
            if v473 == nil then
                break
            end
            v470[v473] = {
                CFrame.new(v474, 21, 500),
                CFrame.new(v474 - 3000, 21, 500),
                CFrame.new(v474 - 3000, 21, 2000),
                CFrame.new(v474, 21, - 1000)
            }
        end
    end
    function v462.IsOwner(p475)
        local v476 = p475:FindFirstChild("Owner")
        if v476 then
            v476 = p475.Owner.Value.Name == vu14.Name
        end
        return v476
    end
    function v462.GetPlayerBoat(p477)
        if vu464(vu14.Character) then
            local v478 = p477.PlayerBoat
            if v478 and (not v478:FindFirstChild("Health") or vu464(v478)) and v478:IsDescendantOf(vu23) then
                return v478
            end
            local v479 = vu14.Character.Humanoid.SeatPart
            if v479 and v479.Name == "VehicleSeat" then
                p477.PlayerBoat = v479.Parent
                return p477.PlayerBoat
            end
            local v480 = vu23
            local v481, v482, v483 = ipairs(v480:GetChildren())
            while true do
                local v484
                v483, v484 = v481(v482, v483)
                if v483 == nil then
                    break
                end
                if (not v484:FindFirstChild("Health") or vu464(v484)) and p477.IsOwner(v484) then
                    if v484.Name ~= p477.BuyBoat.BoatName then
                        p477.BuyBoat.BoatName = v484.Name
                    end
                    p477.PlayerBoat = v484
                    return v484
                end
            end
        end
    end
    function v462.BuyNewBoat(p485)
        if not vu82.IsAlive(vu14.Character) then
            return nil
        end
        local v486 = p485.BuyBoat
        local v487 = v486.Position
        if vu82.GameData.Sea == 3 then
            local v488 = vu14
            if vu14:DistanceFromCharacter(v486.TikiIsland.Position) < v488:DistanceFromCharacter(v487.Position) then
                v487 = v486.TikiIsland
            end
        end
        if vu14:DistanceFromCharacter(v487.Position) >= 10 then
            vu83(v487)
        elseif vu467("BuyBoat", v486.BoatName) ~= 1 then
            for v489 = 1, # v486.OthersBoats do
                local v490 = v486.OthersBoats[v489]
                if v490 ~= v486.BoatName then
                    if vu467("BuyBoat", v490) == 1 then
                        break
                    end
                end
            end
        end
    end
    function v462.teleportBoat(p491, p492, p493, p494)
        if tick() - p491.BoatTweenDebounce >= 0.5 then
            local v495 = (p493.Position - p492.Position).Unit
            vu82.Tween.Velocity = v495 * (p494 or vu38.BoatSpeed)
            vu82:RemoveBoatCollision(p492.Parent)
            p491.BoatTweenDebounce = tick()
        end
    end
    function v462.StopBoat(_)
        vu82.Tween.Velocity = Vector3.zero
    end
    function v462.GetSelectedLevel(p496, p497)
        return p496.RandomPosition[p497 or vu38.SeaLevel]
    end
    function v462.RandomTeleport(p498, p499)
        if not vu468 or vu468.Health <= 0 then
            local v500 = vu14.Character
            if v500 then
                v500 = vu14.Character:FindFirstChild("Humanoid")
            end
            vu468 = v500
            return nil
        end
        if not vu468.SeatPart then
            return p498:TeleportToBoat()
        end
        local v501 = p498:GetPlayerBoat().PrimaryPart
        if not v501 then
            return nil
        end
        local v502 = v501.Position
        local v503 = vu82.GameData.Sea == 3 and p498:GetSelectedLevel(p499) or p498.RandomPosition
        if # v503 ~= 1 then
            if # v503 > 1 then
                if p498.nextNum > # v503 then
                    p498.nextNum = 1
                end
                local v504 = v503[p498.nextNum]
                if (v502 - v504.Position).Magnitude >= 100 then
                    p498:teleportBoat(v501, v504)
                else
                    p498.nextNum = p498.nextNum + 1
                end
            end
        else
            p498:teleportBoat(v501, v503[1])
        end
    end
    function v462.RandomTool(p505)
        if tick() - p505.toolDebounce < 2 then
            return p505.oldTool
        end
        p505.toolDebounce = tick()
        local v506 = p505.nextTool[p505.oldTool]
        local v507 = 0
        while not VerifyToolTip(v506) do
            v506 = p505.nextTool[v506]
            v507 = v507 + 1
            if v507 >= 3 then
                p505.oldTool = v506
                return v506
            end
        end
        p505.oldTool = v506
        return v506
    end
    function v462.GetSeaEvent(_, p508)
        local v509 = vu25
        local v510, v511, v512 = ipairs(v509:GetChildren())
        while true do
            local v513
            v512, v513 = v510(v511, v512)
            if v512 == nil then
                break
            end
            if v513.Name == p508 and vu464(v513) then
                return v513
            end
        end
    end
    function v462.attackBoat(p514, p515)
        local v516 = p515.PrimaryPart
        if not v516 then
            return nil
        end
        local v517 = v516.CFrame + Vector3.new(0, 20, 0)
        EnableBuso()
        vu83(v517)
        p514:StopBoat()
        if vu14:DistanceFromCharacter(v517.Position) < 50 then
            vu465(v516, vu38.SeaSkills)
            vu466(p514:RandomTool(), true)
        end
    end
    function v462.attackFish(p518, p519)
        local v520 = p519.PrimaryPart
        if v520 then
            if (p519.Name == "Terrorshark" or p519.Name == "Shark") and vu38.DodgeShark then
                local v521 = p518.TerrorSkills
                for v522 = 1, # v521 do
                    local v523 = vu27:FindFirstChild(v521[v522])
                    if v523 then
                        if (v523.Position - v520.Position).Magnitude <= 100 then
                            return vu83(v520.CFrame + p518.DodgeVector)
                        end
                    end
                end
            end
            vu83(v520.CFrame + p518.SeaEnemyVector)
            vu466()
            EnableBuso()
            p518:StopBoat()
        end
    end
    function v462.StartHolding(_, p524)
        if not p524:GetAttribute("Repairing") then
            vu2:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            print("Segurando o mouse")
            p524.AncestryChanged:Wait()
            vu2:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            print("Parou de segurar")
        end
    end
    function v462.RepairBoat(p525, p526)
        local v527 = vu38.RepairBoat and vu17.Value == "Shipwright" and (vu463["Wooden Plank"] > 0 and p526:FindFirstChild("Humanoid"))
        if v527 and (p526:GetAttribute("__Repair") or v527.Value < (p526:GetAttribute("MaxHealth") or v527.Value) / 1.2) then
            local v528 = (vu14.Character or vu14.CharacterAdded:Wait()):FindFirstChild("_RepairHammer")
            if v527.Value >= (p526:GetAttribute("MaxHealth") or v527.Value) then
                p526:SetAttribute("__Repair", nil)
            else
                p526:SetAttribute("__Repair", true)
            end
            if not (v528 and v528:WaitForChild("Marker")) then
                if p526:FindFirstChild("VehicleSeat") then
                    local v529 = p526.VehicleSeat.CFrame + Vector3.yAxis * 20
                    if vu14:DistanceFromCharacter(v529.Position) > 5 then
                        vu83(v529)
                    else
                        vu469.UseSubclass:InvokeServer({
                            Action = "RequestHammer"
                        })
                    end
                end
                return true, p525:StopBoat(p526)
            end
            vu83(v528.Marker.Value.WorldCFrame + Vector3.xAxis * 10)
            task.spawn(p525.StartHolding, p525, v528)
            return true
        end
        if vu17.Value == "Shipwright" and (vu38.RepairBoat and vu14.Character) and vu14.Character:FindFirstChild("_RepairHammer") then
            vu469.UseSubclass:InvokeServer({
                Action = "RequestHammer"
            })
        end
    end
    function v462.attackSeaEvent(p530, p531)
        if p531:GetAttribute("IsBoat") then
            p530:attackBoat(p531)
        else
            p530:attackFish(p531)
        end
    end
    function v462.RandomDirection(p532)
        if tick() - p532.rdDebounce < 1.5 then
            return p532.Directions[p532.randomNumber]
        end
        p532.rdDebounce = tick()
        p532.randomNumber = math.random(# p532.Directions)
        return p532.Directions[p532.randomNumber]
    end
    function v462.attackSeaBeast(p533, p534)
        local v535 = p533:RandomDirection()
        local v536 = p534:FindFirstChild("HumanoidRootPart")
        if not v536 then
            return nil
        end
        local v537 = v536.Position
        local v538 = CFrame.new(v537.X, 25, v537.Z) + v535
        EnableBuso()
        vu83(v538)
        p533:StopBoat()
        vu466(p533:RandomTool(), true)
        vu465(v538, vu38.SeaSkills)
    end
    function v462.GetSeaBeast(p539)
        local v540 = p539.SeaBeast
        if v540 and (v540.Parent == vu24 and vu464(v540)) then
            return v540
        end
        local v541 = math.huge
        local v542 = vu24
        local v543, v544, v545 = ipairs(v542:GetChildren())
        local v546 = nil
        while true do
            local v547
            v545, v547 = v543(v544, v545)
            if v545 == nil then
                break
            end
            if v547:IsA("Model") then
                local v548 = vu14:DistanceFromCharacter(v547:GetPivot().Position)
                if vu464(v547) then
                    if v548 < v541 then
                        v546 = v547
                        v541 = v548
                    end
                end
            end
        end
        p539.SeaBeast = v546
        return v546
    end
    function v462.TeleportToBoat(p549)
        if not vu468 or vu468.Health <= 0 or not vu468:IsDescendantOf(vu26) then
            local v550 = vu14.Character
            if v550 then
                v550 = vu14.Character:FindFirstChild("Humanoid")
            end
            vu468 = v550
            return nil
        end
        local v551 = p549.VehicleSeat
        if v551 and v551:IsDescendantOf(p549.PlayerBoat) then
            if vu468.SeatPart and vu468.SeatPart ~= v551 then
                vu468.Sit = false
            elseif vu14:DistanceFromCharacter(v551.Position) >= 150 then
                vu83(v551.CFrame)
            else
                v551:Sit(vu468)
            end
            task.wait(0.25)
        elseif p549.PlayerBoat then
            p549.VehicleSeat = p549.PlayerBoat:FindFirstChild("VehicleSeat")
        end
    end
    return v462
end
function vu103.FruitManager()
    local v552 = {
        RandomDebounce = 0,
        MoneyToReroll = 0
    }
    local vu553 = vu82.IsAlive
    local _ = vu82.FruitsName
    local vu554 = vu82.Inventory.Count
    local _ = vu82.Inventory.Unlocked
    function v552.GetRealFruitName(_, p555)
        local v556 = string.gsub(p555.Name, " Fruit", "")
        return v556 .. "-" .. v556
    end
    function v552.CanStoreFruit(p557, p558)
        return vu554[p557:GetRealFruitName(p558)] < vu18.Value
    end
    function v552.StoreFruit(p559, p560)
        return vu82.FireRemote("StoreFruit", p559:GetRealFruitName(p560), p560)
    end
    function v552.IsFruit(_, p561)
        local v562
        if string.sub(p561.Name, - 6, - 1) ~= " Fruit" then
            v562 = false
        else
            v562 = p561:GetAttribute("DroppedBy")
        end
        return v562
    end
    function v552.GetInventoryItems(_)
        local v563 = vu14.Backpack:GetChildren()
        local v564 = vu14.Character:FindFirstChildOfClass("Tool")
        if v564 then
            table.insert(v563, v564)
        end
        return v563
    end
    function v552.CanBuyMicrochip(p565)
        if not vu553(vu14.Character) then
            return false
        end
        if vu14:GetAttribute("IslandRaiding") then
            return false
        end
        if vu14.Backpack:FindFirstChild("Microchip") or vu14.Character:FindFirstChild("Microchip") then
            return false
        end
        local v566, v567, v568 = ipairs(p565:GetInventoryItems())
        while true do
            local v569
            v568, v569 = v566(v567, v568)
            if v568 == nil then
                break
            end
            if v569:IsA("Tool") and p565:IsFruit(v569) then
                return true
            end
        end
        return - 1
    end
    function v552.GetStorableFruit(p570, p571)
        if not vu553(vu14.Character) then
            return false
        end
        local v572, v573, v574 = ipairs(p570:GetInventoryItems())
        repeat
            local v575
            v574, v575 = v572(v573, v574)
        until v574 == nil or v575.Name ~= p571 and not vu553(vu14.Character)
    end
    function v552.RerollRandomFruit(p576)
        if vu19.Value < 50 then
            return vu19:GetPropertyChangedSignal("Value"):Wait()
        end
        if vu20.Value < p576.MoneyToReroll then
            return vu20:GetPropertyChangedSignal("Value"):Wait()
        end
        if tick() - p576.RandomDebounce >= 1 then
            local v577 = vu82.FireRemote("Cousin", "Buy")
            if v577 == 1 then
                p576.RandomDebounce = tick() + 7200
            elseif v577 == 2 then
                local _, _, v578 = vu82.FireRemote("Cousin", "Check")
                p576.MoneyToReroll = v578 or 0
            elseif type(v577) ~= "string" or not v577:match("%d%d:%d%d") then
                p576.RandomDebounce = tick() + 5
            else
                local v579, v580 = v577:match("(%d+):(%d+)")
                local v581 = tonumber(v579)
                local v582 = tonumber(v580)
                if v581 and v582 then
                    local v583 = v581 * 60 * 60
                    local v584 = v582 * 60
                    p576.RandomDebounce = tick() + (v583 + v584)
                end
            end
        end
    end
    return v552
end
function vu102.RunModules(p585)
    local v586 = next
    local v587 = p585.Managers
    local v588 = nil
    while true do
        local v589
        v588, v589 = v586(v587, v588)
        if v588 == nil then
            break
        end
        local v590, v591 = pcall(v589)
        if v590 then
            p585.Managers[v588] = v591
            vu32[v588] = v591
        else
            vu32[v588] = nil
            warn("falha ao carregar Module [ redz hub ]: " .. v588 .. " : " .. v591)
        end
    end
end
function vu102.Initialize(p592)
    vu81 = __loadstring(vu1.LibraryUrl or "{Owner}RedzLibV5/refs/heads/main/Source.lua")
    vu82 = __loadstring(vu1.ModuleUrl or "{Repository}Utils/Module.luau", " return Module", {
        vu38,
        vu76
    })
    p592.IsCustomUrl = (vu1.LibraryUrl or (vu1.ModuleUrl or vu1.CustomFunctions)) and true or false
    vu102:RunModules()
end
function vu102.LoadTabs(_, p593)
    return {
        Discord = p593:MakeTab({
            "Discord",
            "Info"
        }),
        MainFarm = p593:MakeTab({
            "Farm",
            "Home"
        }),
        Sea = p593:MakeTab({
            "Sea",
            "Waves"
        }),
        RaceV4 = p593:MakeTab({
            "Race-V4",
            ""
        }),
        Islands = p593:MakeTab({
            "Islands",
            "PalmTree"
        }),
        Items = p593:MakeTab({
            "Quests/Items",
            "Swords"
        }),
        FruitRaid = p593:MakeTab({
            "Fruit/Raid",
            "Cherry"
        }),
        Stats = p593:MakeTab({
            "Stats",
            "Signal"
        }),
        Teleport = p593:MakeTab({
            "Teleport",
            "Locate"
        }),
        Status = p593:MakeTab({
            "Status",
            "scroll"
        }),
        Visual = p593:MakeTab({
            "Visual",
            "User"
        }),
        Shop = p593:MakeTab({
            "Shop",
            "ShoppingCart"
        }),
        Misc = p593:MakeTab({
            "Misc",
            "Settings"
        })
    }
end
function vu102.InstallPlugin(_)
    return {
        Toggle = vu82.RunFunctions.LibraryToggle(vu45, vu34)
    }
end
function vu102.GetTranslation(_, p594)
    local v595 = {
        BR = "Portuguese.json",
        VN = "Vietnamese.json",
        TH = "Thai.json"
    }
    if v595[p594] then
        local _ = vu7.JSONDecode
        local _ = __httpget
        local _ = "{Owner}BloxFruits/refs/heads/main/Translator/" .. v595[p594]
    end
end
function vu102.Translator(p596, p597)
    if not vu1.Translator then
        return p597
    end
    local v600, v601, v602 = pcall(function()
        local v598 = readfile
        if v598 then
            v598 = pcall(readfile, "PlayerCountry.txt")
        end
        local v599 = nil
        if v598 and type(v599) == "string" then
            return v599, true
        else
            return vu3:GetCountryRegionForPlayerAsync(vu14)
        end
    end)
    if v600 and (v601 and (v602 ~= true and writefile)) then
        pcall(writefile, "PlayerCountry.txt", v601)
    end
    if v600 then
        v600 = p596:GetTranslation(v601)
    end
    if v600 then
        local _ = vu82.RunFunctions.Translator
    end
    return p597
end
function vu102.DisableOption(_)
    if vu38.RunningOption and vu34[vu38.RunningOption] then
        vu34[vu38.RunningOption]:Set(false, true)
    end
end
function vu102.LoadLibrary(pu603)
    local v604 = vu81:MakeWindow({
        "redz Hub : Blox Fruits",
        "by real_redz",
        "redzHub-BloxFruits.json"
    })
    pu603:Translator(v604)
    local v605 = pu603:InstallPlugin(v604)
    local v606 = pu603:LoadTabs(v604)
    local vu607 = pu603.Managers.FruitManager
    local v608 = pu603.Managers.QuestManager
    local v609 = pu603.Managers.FarmManager
    local vu610 = vu82.FireRemote
    local vu611 = vu82.Inventory.Count
    local vu612 = vu82.Inventory.Unlocked
    local v613 = vu82.GameData.Sea
    local v614 = v605.Toggle
    v604:SelectTab(v606.MainFarm)
    v604:AddMinimizeButton({
        Button = {
            Image = "rbxassetid://15298567397",
            BackgroundTransparency = 0
        },
        Corner = {
            CornerRadius = UDim.new(0, 6)
        }
    })
    local v615 = v606.Discord
    v615:AddDiscordInvite({
        Name = "redz Hub | Community",
        Description = "Join our discord community to receive information about the next update",
        Logo = "rbxassetid://17382040552",
        Invite = "https://discord.gg/7aR7kNVt4g"
    })
    v615:AddSection("")
    v615:AddParagraph({
        "Mentions:\n Honorable Mention: acsu123\n Honorable Mention 2: XFister"
    })
    local v616 = v606.MainFarm
    local vu617 = {
        Bigger = 380,
        Large = 450,
        Medium = 620,
        Small = 760
    }
    local v618 = {
        {
            "Z",
            "X",
            "C",
            "V",
            "F"
        },
        ToDictionary({
            "Z",
            "X",
            "C",
            "V"
        })
    }
    local function v620(p619)
        pcall(vu81.SetScale, vu81, vu617[p619] or 450)
    end
    local function v623(p621)
        vu32.TradeBones = p621
        while vu32.TradeBones do
            task.wait()
            local v622 = vu611.Bones
            if v622 >= 50 then
                vu610("Bones", "Buy", 1, 1)
                if v622 == vu611.Bones then
                    task.wait(5)
                end
            else
                task.wait(0.5)
            end
        end
    end
    local vu624 = nil
    local function v630()
        local v625, v626, v627 = pairs(vu82.Bosses)
        local v628 = {}
        while true do
            local v629
            v627, v629 = v625(v626, v627)
            if v627 == nil then
                break
            end
            if vu82.Enemies.IsSpawned(v627) then
                table.insert(v628, v627)
            end
        end
        vu624:Set(v628)
    end
    v616:AddDropdown({
        "Select Tool",
        {
            "Melee",
            "Sword",
            "Blox Fruit",
            "Gun"
        },
        "Melee",
        {
            vu38,
            "FarmTool"
        },
        "FarmTool"
    })
    v616:AddDropdown({
        "UI Scale",
        {
            "Small",
            "Medium",
            "Large",
            "Bigger"
        },
        "Large",
        v620,
        "UIScale"
    })
    v616:AddSection("Farm")
    v614(v616, {
        "Auto Farm Level",
        "Level Farm"
    }, "Level")
    v614(v616, {
        "Auto Farm Nearest",
        "Farm Nearest Mobs"
    }, "Nearest")
    if v613 ~= 1 then
        if v613 == 2 then
            v614(v616, {
                "Auto Factory",
                "Spawns Every 1:30 [hours, minutes]"
            }, "Factory")
            v616:AddSection("Ectoplasm")
            v614(v616, {
                "Auto Farm Ectoplasm"
            }, "Ectoplasm")
        elseif v613 == 3 then
            v614(v616, {
                "Auto Pirates Sea",
                "Auto Finish Pirate Raid in Sea Castle"
            }, "PirateRaid")
            v616:AddSection("Bones")
            v614(v616, {
                "Auto Farm Bones"
            }, "Bones")
            v614(v616, {
                "Auto Kill Soul Reaper"
            }, "SoulReaper")
            v616:AddToggle({
                "Auto Trade Bones",
                false,
                v623,
                "TradeBones"
            })
        end
    end
    v616:AddSection("Chest")
    v614(v616, {
        "Auto Chest [ Tween ]"
    }, "ChestTween")
    v616:AddSection("Bosses")
    v616:AddButton({
        "Update Boss List",
        v630
    })
    vu624 = v616:AddDropdown({
        "Boss List",
        {},
        false,
        {
            vu38,
            "BossSelected"
        },
        "B-Selected"
    })
    v630()
    v614(v616, {
        "Auto Kill Boss Selected",
        "Kill boss Selected"
    }, "BossSelected")
    v614(v616, {
        "Auto Farm All Bosses",
        "Kill all bosses Spawned"
    }, "AllBosses")
    v616:AddToggle({
        "Take Boss Quest",
        true,
        {
            vu38,
            "BossQuest"
        },
        "B-Quest"
    })
    v616:AddSection("Material")
    local v631 = v616.AddDropdown
    local v632 = {}
    local v633 = {
        vu38,
        "fMaterial"
    }
    __set_list(v632, 1, {
        "Material List",
        v609.Materials,
        false,
        v633,
        "S-Material"
    })
    v631(v616, v632)
    v614(v616, {
        "Auto Farm Material",
        "Farm material Selected"
    }, "Material")
    v616:AddSection("Mastery")
    v616:AddSlider({
        "Select Enemy Health [ % ]",
        10,
        100,
        1,
        25,
        {
            vu38,
            "mHealth"
        },
        "M-Health"
    })
    v616:AddDropdown({
        "Select Tool",
        {
            "Blox Fruit",
            "Gun"
        },
        {
            "Blox Fruit"
        },
        {
            vu38,
            "mTool"
        },
        "M-Tool"
    })
    local v634 = v616.AddDropdown
    local v635 = {}
    local v636 = v618[1]
    local v637 = v618[2]
    local v638 = {
        vu38,
        "MasterySkills"
    }
    v635.MultiSelect = true
    __set_list(v635, 1, {
        "Select Skills",
        v636,
        v637,
        v638,
        "M-Skills"
    })
    v634(v616, v635)
    v614(v616, {
        "Auto Farm Mastery"
    }, "Mastery")
    local v639 = v606.Sea
    if v613 == 1 then
        v639:Destroy()
    elseif v613 == 2 then
        local v640 = {
            {
                "Sea Beast",
                "PirateBrigade"
            },
            ToDictionary({
                "Sea Beast"
            })
        }
        local v641 = {
            {
                "Z",
                "X",
                "C",
                "V",
                "F"
            },
            ToDictionary({
                "Z",
                "X",
                "C",
                "V"
            })
        }
        v639:AddSection("Farm")
        v614(v639, {
            "Auto Farm Sea"
        }, "Sea")
        v639:AddSection("Farm Select")
        local v642 = v639.AddDropdown
        local v643 = {}
        local v644 = v640[1]
        local v645 = v640[2]
        local v646 = {
            vu38,
            "seaEnemy"
        }
        v643.MultiSelect = true
        __set_list(v643, 1, {
            "Enemies",
            v644,
            v645,
            v646,
            "S-Enemies"
        })
        v642(v639, v643)
        local v647 = v639.AddDropdown
        local v648 = {}
        local v649 = v641[1]
        local v650 = v641[2]
        local v651 = {
            vu38,
            "SeaSkills"
        }
        v648.MultiSelect = true
        __set_list(v648, 1, {
            "Select Skills",
            v649,
            v650,
            v651,
            "S-Skills"
        })
        v647(v639, v648)
        v639:AddSection("Configs")
        v639:AddSlider({
            "Boat Tween Speed",
            100,
            300,
            10,
            250,
            {
                vu38,
                "BoatSpeed"
            },
            "S-BoatSpeed"
        })
        v639:AddToggle({
            "Auto Repair Boat [ BETA ]",
            false,
            {
                vu38,
                "RepairBoat"
            },
            "S-RepairBoat"
        })
    elseif v613 == 3 then
        local v652 = {
            {
                "Z",
                "X",
                "C",
                "V",
                "F"
            },
            ToDictionary({
                "Z",
                "X",
                "C",
                "V"
            })
        }
        local v653 = {
            {
                "Sea Beast",
                "Terrorshark",
                "Fish Crew Member",
                "Piranha",
                "Shark"
            },
            ToDictionary({
                "Terrorshark",
                "Fish Crew Member",
                "Piranha",
                "Shark"
            })
        }
        local vu654 = nil
        local vu655 = {
            ["Shipwright Teacher"] = CFrame.new(- 16526, 76, 309),
            ["Shark Hunter"] = CFrame.new(- 16526, 108, 752),
            ["Beast Hunter"] = CFrame.new(- 16281, 73, 263),
            Spy = CFrame.new(- 16471, 528, 539)
        }
        local function v657(p656)
            vu32.teleporting = p656
            while vu32.teleporting do
                task.wait()
                if vu38.selectedNpc then
                    vu83(vu655[vu38.selectedNpc])
                end
            end
            if p656 and vu654 then
                vu654:Set(false, true)
            end
        end
        local function v661(p658)
            if p658 then
                local v659 = pu603.Managers.PlayerTeleport
                local v660 = math.huge
                while true do
                    task.wait()
                    if v659.lastPosition then
                        v660 = vu14:DistanceFromCharacter(v659.lastPosition)
                    end
                    if not vu32.teleporting or v660 < 15 then
                        vu32.teleporting = false
                    end
                end
            else
                return
            end
        end
        v639:AddSection("Sea")
        v614(v639, {
            "Auto Farm Sea"
        }, "Sea")
        v639:AddToggle({
            "Auto Drive Boat",
            true,
            {
                vu38,
                "aTweenBoat"
            },
            "A-TweenBoat"
        })
        v639:AddSection("Farm Select")
        local v662 = v639.AddDropdown
        local v663 = {}
        local v664 = v653[1]
        local v665 = v653[2]
        local v666 = {
            vu38,
            "fishSelected"
        }
        v663.MultiSelect = true
        __set_list(v663, 1, {
            "Fish",
            v664,
            v665,
            v666,
            "S-Fish"
        })
        v662(v639, v663)
        local v667 = v639.AddDropdown
        local v668 = {}
        local v669 = {
            vu38,
            "boatSelected"
        }
        v668.MultiSelect = true
        __set_list(v668, 1, {
            "Boats",
            {
                "PirateBrigade",
                "PirateGrandBrigade",
                "GhostShip",
                "FishBoat"
            },
            nil,
            v669,
            "S-Boat"
        })
        v667(v639, v668)
        local v670 = v639.AddDropdown
        local v671 = {}
        local v672 = v652[1]
        local v673 = v652[2]
        local v674 = {
            vu38,
            "SeaSkills"
        }
        v671.MultiSelect = true
        __set_list(v671, 1, {
            "Select Skills",
            v672,
            v673,
            v674,
            "S-Skills"
        })
        v670(v639, v671)
        v639:AddSection("Configs")
        v639:AddDropdown({
            "Sea Level",
            {
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "inf"
            },
            "6",
            {
                vu38,
                "SeaLevel"
            },
            "S-SeaLevel"
        })
        v639:AddSlider({
            "Boat Tween Speed",
            100,
            300,
            10,
            250,
            {
                vu38,
                "BoatSpeed"
            },
            "S-BoatSpeed"
        })
        v639:AddToggle({
            "Auto Repair Boat [ BETA ]",
            false,
            {
                vu38,
                "RepairBoat"
            },
            "S-RepairBoat"
        })
        v639:AddSection("NPCs")
        v639:AddDropdown({
            "Select NPC",
            {
                "Shipwright Teacher",
                "Shark Hunter",
                "Beast Hunter",
                "Spy"
            },
            "Spy",
            {
                vu38,
                "selectedNpc"
            }
        })
        vu654 = v639:AddToggle({
            "Teleport to NPC",
            false,
            v657
        })
        local v675 = vu654
        vu654.Callback(v675, v661)
        v639:AddSection("Quests/Items")
        v614(v639, {
            "Auto Unlock Shipwright Subclass [ BETA ]"
        }, "Shipwright")
    end
    local vu676 = v606.Stats
    if vu19.Value >= vu82.GameData.MaxLevel then
        vu676:Destroy()
    else
        local vu677 = {}
        local vu678 = vu15:WaitForChild("Points")
        local vu679 = vu15:WaitForChild("Stats")
        local function v686(p680)
            vu32.AutoStats = p680
            while task.wait() and vu32.AutoStats do
                local v681 = vu678.Value
                if v681 > 0 then
                    local v682, v683, v684 = pairs(vu677)
                    while true do
                        local v685
                        v684, v685 = v682(v683, v684)
                        if v684 == nil then
                            break
                        end
                        if v685 and vu679[v684].Level.Value < vu82.GameData.MaxLevel then
                            vu610("AddPoint", v684, (math.clamp(math.clamp(vu38.StatsPoints or 3, 0, v681), 0, vu82.GameData.MaxLevel)))
                        end
                    end
                end
            end
        end
        local function v688(_, p687)
            vu676:AddToggle({
                p687,
                false,
                {
                    vu677,
                    p687
                },
                "Stats-" .. p687
            })
        end
        vu676:AddSlider({
            "Points Amount",
            1,
            100,
            1,
            3,
            {
                vu38,
                "StatsPoints"
            },
            "P-Stats"
        })
        vu676:AddToggle({
            "Auto Stats",
            false,
            v686,
            "A-Stats"
        })
        vu676:AddSection("Select Stats")
        table.foreach({
            "Melee",
            "Defense",
            "Gun",
            "Sword",
            "Demon Fruit"
        }, v688)
    end
    local v689 = v606.RaceV4
    if v613 == 4 then
        v689:AddSection("Race V4")
        v614(v689, {
            "Auto Finish Trial"
        }, "TrialV4")
        v614(v689, {
            "Auto Kill Players in Trial"
        }, "KillPlayersV4")
        v614(v689, {
            "Auto Train Race"
        }, "TrainV4")
    else
        v689:Destroy()
    end
    local vu690 = v606.Islands
    if v613 == 3 then
        local function v693(p691)
            vu32.LookMoon = p691
            while vu32.LookMoon do
                local v692 = vu9
                vu12.CFrame = CFrame.new(vu12.CFrame.Position, v692:GetMoonDirection() + vu12.CFrame.Position)
                task.wait()
            end
        end
        local function v695(p694)
            vu32.TradeAzure = p694
            while vu32.TradeAzure do
                if vu9:GetAttribute("IsBlueMoon") and (not vu9:GetAttribute("BlueMoonEnded") and vu611["Azure Ember"] >= vu38.Azure) then
                    vu31["RF/KitsuneStatuePray"]:InvokeServer()
                end
                task.wait(1)
            end
        end
        local function v701(p696, p697)
            local v698 = vu690:AddParagraph({
                p696 .. " : not Spawn"
            })
            while task.wait() do
                local v699 = vu21:FindFirstChild(p697)
                if v699 then
                    local v700 = vu14
                    v698:SetTitle(p696 .. " : Spawned | Distance : " .. math.floor(v700:DistanceFromCharacter(v699.WorldPivot.Position) / 5))
                else
                    v698:SetTitle(p696 .. " : not Spawn")
                    vu21.ChildAdded:Wait()
                end
            end
        end
        vu690:AddSection("Islands Stats")
        task.spawn(v701, "Mirage Island", "MysticIsland")
        task.spawn(v701, "Kitsune Island", "KitsuneIsland")
        task.spawn(v701, "Prehistoric Island", "PrehistoricIsland")
        vu690:AddSection("Prehistoric Island")
        v614(vu690, {
            "Auto Craft Volcanic Magnet"
        }, "CraftVolcanicMagnet")
        v614(vu690, {
            "Auto Prehistoric Island"
        }, "PrehistoricIsland")
        v614(vu690, {
            "Auto Kill Lava Golem"
        }, "LavaGolem")
        v614(vu690, {
            "Auto Collect Dinosaur Bones"
        }, "PrehistoricBones")
        v614(vu690, {
            "Auto Collect Dragon Egg"
        }, "PrehistoricEgg")
        vu690:AddToggle({
            "Reset after finishing",
            false,
            {
                vu38,
                "ResetPrehistoric"
            },
            "P-Reset"
        })
        vu690:AddSection("Leviathan [ BETA ]")
        v614(vu690, {
            "Auto Attack Leviathan"
        }, "Leviathan")
        vu690:AddSection("Kitsune Island")
        vu690:AddSlider({
            "Trade Azure Ember Amount",
            10,
            25,
            5,
            20,
            {
                vu38,
                "Azure"
            },
            "A-Amount"
        })
        vu690:AddToggle({
            "Auto Trade Azure Ember",
            false,
            v695
        }, "Trade-Azure")
        v614(vu690, {
            "Auto Kitsune Island"
        }, "KitsuneIsland")
        vu690:AddSection("Mirage Island")
        v614(vu690, {
            "Teleport To Gear"
        }, "MirageGear")
        v614(vu690, {
            "Teleport To Mirage"
        }, "TeleportMirage")
        v614(vu690, {
            "Teleport To Fruit Dealer"
        }, "MirageFruitDealer")
        v614(vu690, {
            "Collect Mirage Chests"
        }, "MirageChests")
        vu690:AddToggle({
            "Look To Moon",
            false,
            v693,
            "MirageLookMoon"
        })
    else
        vu690:Destroy()
    end
    local v702 = v606.FruitRaid
    local vu703 = {
        "Rocket",
        "Spin",
        "Blade",
        "Spring",
        "Bomb",
        "Smoke",
        "Spike"
    }
    local v704 = "Only on Sea 2 and 3"
    local vu705 = true
    local vu706 = nil
    local function v710(p707)
        vu32.auto_store = p707
        while vu32.auto_store do
            task.wait(vu38.SmoothMode and 0.3 or 0.2)
            vu705 = false
            local v708 = not vu14:GetAttribute("IslandRaiding") and vu32.unstore_common_fruits
            if v708 then
                v708 = vu706
            end
            local v709 = vu607:GetStorableFruit(v708)
            if v709 then
                vu607:StoreFruit(v709)
                vu706 = nil
            else
                vu705 = true
            end
        end
        vu705 = true
    end
    local function v712(p711)
        vu32.random_fruit = p711
        while vu32.random_fruit do
            vu607:RerollRandomFruit()
            task.wait(0.1)
        end
    end
    local function v714(p713)
        vu32.raid_microchip = p713
        while vu32.raid_microchip do
            if vu705 then
                if vu607:CanBuyMicrochip() then
                    vu610("RaidsNpc", "Select", vu38.SelectedChip)
                else
                    task.wait(0.1)
                end
            else
                task.wait()
            end
        end
    end
    local function v719(p715)
        vu32.unstore_common_fruits = p715
        while vu32.unstore_common_fruits do
            if vu607:CanBuyMicrochip() == - 1 and vu705 then
                for v716 = 1, # vu703 do
                    local v717 = vu703[v716]
                    local v718 = v717 .. "-" .. v717
                    if vu14.Character:FindFirstChild(v718) or vu14.Backpack:FindFirstChild(v718) then
                        break
                    end
                end
            end
            task.wait(0.25)
        end
    end
    v702:AddSection("Fruits")
    v702:AddToggle({
        "Auto Store Fruits",
        false,
        v710,
        "F-AutoStore"
    })
    v614(v702, {
        "Teleport To Fruits"
    }, "Fruits")
    v702:AddToggle({
        "Auto Random Fruit",
        false,
        v712,
        "F-RandomFruit"
    })
    v702:AddSection("Raid")
    if v613 == 2 or v613 == 3 then
        local v720 = v702.AddDropdown
        local v721 = {}
        local v722 = {
            vu38,
            "SelectedChip"
        }
        __set_list(v721, 1, {
            "Select Chip",
            vu82.RaidList,
            "",
            v722,
            "R-RaidChip"
        })
        v720(v702, v721)
        v614(v702, {
            "Auto Farm Raid",
            "Kill Aura, Start & Awaken"
        }, "Raid")
        v702:AddToggle({
            "Auto Buy Chip",
            false,
            v714,
            "R-BuyChip"
        })
        v702:AddToggle({
            "Unstore Common Fruits",
            false,
            v719,
            "R-Unstore"
        })
    else
        v702:AddParagraph({
            v704
        })
    end
    local v723 = v606.Teleport
    local vu724 = nil
    local vu725 = CFrame.new(28286, 14897, 103)
    local v726 = ({
        {
            "WindMill",
            "Marine",
            "Middle Town",
            "Jungle",
            "Pirate Village",
            "Desert",
            "Snow Island",
            "MarineFord",
            "Colosseum",
            "Sky Island 1",
            "Sky Island 2",
            "Sky Island 3",
            "Prison",
            "Magma Village",
            "Under Water Island",
            "Fountain City"
        },
        {
            "The Cafe",
            "Frist Spot",
            "Dark Area",
            "Flamingo Mansion",
            "Flamingo Room",
            "Green Zone",
            "Zombie Island",
            "Two Snow Mountain",
            "Punk Hazard",
            "Cursed Ship",
            "Ice Castle",
            "Forgotten Island",
            "Ussop Island"
        },
        {
            "Mansion",
            "Port Town",
            "Great Tree",
            "Castle On The Sea",
            "Hydra Island",
            "Floating Turtle",
            "Haunted Castle",
            "Ice Cream Island",
            "Peanut Island",
            "Cake Island",
            "Candy Cane Island",
            "Tiki Outpost"
        }
    })[v613]
    local vu727 = {
        ["Middle Town"] = CFrame.new(- 688, 15, 1585),
        MarineFord = CFrame.new(- 4810, 21, 4359),
        Marine = CFrame.new(- 2728, 25, 2056),
        WindMill = CFrame.new(889, 17, 1434),
        Desert = CFrame.new(1054, 53, 4490),
        ["Snow Island"] = CFrame.new(1298, 87, - 1344),
        ["Pirate Village"] = CFrame.new(- 1173, 45, 3837),
        Jungle = CFrame.new(- 1614, 37, 146),
        Prison = CFrame.new(4870, 6, 736),
        ["Under Water Island"] = CFrame.new(61164, 5, 1820),
        Colosseum = CFrame.new(- 1535, 7, - 3014),
        ["Magma Village"] = CFrame.new(- 5290, 9, 8349),
        ["Sky Island 1"] = CFrame.new(- 4814, 718, - 2551),
        ["Sky Island 2"] = CFrame.new(- 4652, 873, - 1754),
        ["Sky Island 3"] = CFrame.new(- 7895, 5547, - 380),
        ["Fountain City"] = CFrame.new(5041, 1, 4101),
        ["The Cafe"] = CFrame.new(- 382, 73, 290),
        ["Frist Spot"] = CFrame.new(- 11, 29, 2771),
        ["Dark Area"] = CFrame.new(3494, 13, - 3259),
        ["Flamingo Mansion"] = CFrame.new(- 317, 331, 597),
        ["Flamingo Room"] = CFrame.new(2285, 15, 905),
        ["Green Zone"] = CFrame.new(- 2258, 73, - 2696),
        ["Zombie Island"] = CFrame.new(- 5552, 194, - 776),
        ["Two Snow Mountain"] = CFrame.new(752, 408, - 5277),
        ["Punk Hazard"] = CFrame.new(- 5897, 18, - 5096),
        ["Cursed Ship"] = CFrame.new(919, 125, 32869),
        ["Ice Castle"] = CFrame.new(5505, 40, - 6178),
        ["Forgotten Island"] = CFrame.new(- 3050, 240, - 10178),
        ["Ussop Island"] = CFrame.new(4816, 8, 2863),
        Mansion = CFrame.new(- 12471, 374, - 7551),
        ["Port Town"] = CFrame.new(- 334, 7, 5300),
        ["Castle On The Sea"] = CFrame.new(- 5073, 315, - 3153),
        ["Hydra Island"] = CFrame.new(5666, 1013, - 310),
        ["Great Tree"] = CFrame.new(2683, 275, - 7008),
        ["Floating Turtle"] = CFrame.new(- 12528, 332, - 8658),
        ["Haunted Castle"] = CFrame.new(- 9517, 142, 5528),
        ["Ice Cream Island"] = CFrame.new(- 902, 79, - 10988),
        ["Peanut Island"] = CFrame.new(- 2062, 50, - 10232),
        ["Cake Island"] = CFrame.new(- 1897, 14, - 11576),
        ["Candy Cane Island"] = CFrame.new(- 1038, 10, - 14076),
        ["Tiki Outpost"] = CFrame.new(- 16224, 9, 439)
    }
    local function v728()
        for _ = 1, 10 do
            task.wait()
            vu14.Character:SetPrimaryPartCFrame(vu725)
        end
    end
    local function v730(p729)
        vu32.teleporting = p729
        while vu32.teleporting do
            task.wait()
            if vu727[vu32.SelectedIsland] then
                vu83(vu727[vu32.SelectedIsland])
            end
        end
        if p729 and vu724 then
            vu724:Set(false, true)
        end
    end
    local function v734(p731)
        if p731 then
            local v732 = pu603.Managers.PlayerTeleport
            local v733 = math.huge
            while true do
                task.wait()
                if v732.lastPosition then
                    v733 = vu14:DistanceFromCharacter(v732.lastPosition)
                end
                if not vu32.teleporting or v733 < 15 then
                    vu32.teleporting = false
                end
            end
        else
            return
        end
    end
    v723:AddSection("Travel")
    local v735 = v723.AddButton
    local v736 = {}
    local function v737()
        vu82:TravelTo(1)
    end
    v736.Desc = "Main"
    __set_list(v736, 1, {
        "Teleport to Sea 1",
        v737
    })
    v735(v723, v736)
    local v738 = v723.AddButton
    local v739 = {}
    local function v740()
        vu82:TravelTo(2)
    end
    v739.Desc = "Dressrosa"
    __set_list(v739, 1, {
        "Teleport to Sea 2",
        v740
    })
    v738(v723, v739)
    local v741 = v723.AddButton
    local v742 = {}
    local function v743()
        vu82:TravelTo(3)
    end
    v742.Desc = "Zou"
    __set_list(v742, 1, {
        "Teleport to Sea 3",
        v743
    })
    v741(v723, v742)
    v723:AddSection("Islands")
    v723:AddDropdown({
        "Select Island",
        v726,
        "",
        {
            vu32,
            "SelectedIsland"
        }
    })
    vu724 = v723:AddToggle({
        "Teleport to Island",
        false,
        v730
    })
    local v744 = vu724
    vu724.Callback(v744, v734)
    if v613 == 3 then
        v723:AddSection("Race V4")
        v723:AddButton({
            "Teleport to Temple of Time",
            v728
        })
    end
    local vu745 = v606.Status
    local vu746 = v613
    local _ = v609.Enemies.Elites
    local vu747 = vu82.Enemies.IsSpawned
    local vu748 = nil
    local vu749 = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189"
    local vu750 = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189"
    local vu751 = {}
    local vu752 = 0
    local function v758(p753, p754)
        if p754 or p754 == nil then
            local v755 = table.insert
            local v756 = vu751
            local v757 = {
                Paragraph = vu745:AddParagraph({
                    ""
                }),
                Function = p753
            }
            v755(v756, v757)
        end
    end
    v758(function()
        local v759 = vu82:GetProgress("EliteProgress", "EliteHunter", "Progress")
        local v760 = vu82.Enemies:GetEnemyByTag("Elite")
        if v760 then
            return ("Elite Progress: %i\nElite Hunter: %s %s"):format(v759, v760.Name, vu749)
        else
            return ("Elite Progress: %i\nElite Hunter: %s"):format(v759, (vu748 and 600 - (tick() - vu748) >= 0 and (vu101.GetTimer(600 - (tick() - vu748) or "00:00") or "") or "") .. vu750)
        end
    end, vu746 == 3)
    v758(function()
        local v761 = vu747("Cake Prince") and "Cake Prince"
        if not v761 then
            local v762 = vu747("Dough King")
            v761 = v762 and "Dough King" or v762
        end
        if v761 then
            return ("Katakuri: %s %s"):format(v761, vu749)
        end
        local v763 = vu82
        local v764 = string.gsub(v763:GetProgress("Katakuri", "CakePrinceSpawner", true), "%D", "")
        return "Katakuri: " .. (v764:len() == 0 and ("0" or v764) or v764)
    end, vu746 == 3)
    v758(function()
        local v765 = vu82:GetProgress("Sword Dealer", "LegendarySwordDealer", "1")
        if type(v765) ~= "string" then
            return ("Sword Dealer: %s"):format(vu750)
        else
            return ("Sword Dealer: %s %s"):format(v765, vu749)
        end
    end, vu746 == 2)
    v758(function()
        local v766, v767 = vu82:GetProgress("BaristaCousin", "ColorsDealer", "1")
        if type(v766) ~= "string" then
            return "Barista Cousin: " .. vu750
        else
            return ("Barista Cousin: %s [ %s ] %s"):format(v766, 3 <= v767 and "LEGENDARY" or "Rare", vu749)
        end
    end)
    v758(function()
        if workspace:FindFirstChild("Fruit ") then
            return ("Devil Fruit: %s %s"):format(vu82.FruitsName[workspace["Fruit "] ], vu749)
        else
            return "Devil Fruit: " .. vu750
        end
    end)
    v758(function()
        local v768 = {}
        for v769 = 1, # vu90 do
            if v769 % 10 == 0 then
                task.wait(0.1)
            end
            local v770 = vu90[v769]
            local v771, v772, v773 = pairs(v770:GetAttributes())
            while true do
                local v774
                v773, v774 = v771(v772, v773)
                if v773 == nil then
                    break
                end
                table.insert(v768, v774)
            end
        end
        if # v768 <= 0 then
            return "Berries: " .. vu750
        else
            return ("Berries: #%i [ %s ] %s"):format(# v768, table.concat(v768, ", "), vu749)
        end
    end)
    v758(function()
        return "Players: " .. # vu10:GetPlayers() .. "/12"
    end)
    v758(function()
        return ("Enabled Options: %i/%i\nFarm Status: %s [ %s ]"):format(# vu37, # vu36, vu38.RunningOption or "Null", vu38.RunningMethod or "Null")
    end)
    v758(function()
        return "Is Private Server: " .. (vu5.PrivateServerOwnerId.Value ~= 0 and vu749 or vu750)
    end)
    local vu775 = 1
    local vu776 = nil
    vu776 = vu13:Connect(function()
        if not (vu745 and vu745.Cont) then
            return vu776:Disconnect()
        end
        if vu746 == 3 and (vu775 == 1 and tick() - vu752 >= 1) then
            if not vu745.Cont.Parent then
                vu752 = tick()
            end
            if vu82.Enemies:GetEnemyByTag("Elite") then
                vu748 = tick()
            end
        end
        if tick() - vu752 >= 1 and vu745.Cont.Parent then
            local v777 = vu751[vu775]
            vu775 = (vu775 >= # vu751 and 0 or vu775) + 1
            if vu775 >= # vu751 then
                vu752 = tick()
            end
            if v777 and not v777.Updating then
                v777.Updating = true
                v777.Paragraph:SetTitle(v777.Function())
                v777.Updating = false
            end
        end
    end)
    local v778 = v606.Visual
    local v779 = pu603.Managers.EspManager
    local vu780 = vu1.EspColors or {
        Players = Color3.fromRGB(220, 220, 220),
        Fruits = Color3.fromRGB(255, 0, 0),
        Islands = Color3.fromRGB(0, 255, 255),
        Berries = Color3.fromRGB(255, 255, 0),
        Chests = {
            Chest1 = Color3.fromRGB(150, 150, 150),
            Chest2 = Color3.fromRGB(255, 255, 0),
            Chest3 = Color3.fromRGB(0, 255, 255),
            Null = Color3.fromRGB(150, 0, 255)
        }
    }
    local v798 = {
        Players = v779.new("Player", vu26, function(p781)
            if p781 ~= vu14.Character then
                return true, vu780.Players
            end
        end),
        Islands = v779.new("Island", vu28, function(p782)
            if p782.Name ~= "Sea" then
                return true, vu780.Islands
            end
        end),
        Fruits = v779.new("Fruit", workspace, function(p783)
            if p783:IsA("Model") and p783:GetPivot().Position == Vector3.zero then
                return nil
            end
            if string.sub(p783.Name, - 6, - 1) == " Fruit" or p783.Name == "Fruit " then
                return true, vu780.Fruits, p783:FindFirstChild("Handle") or p783
            end
        end),
        Flowers = v779.new("Flower", workspace, function(p784)
            if p784:IsA("BasePart") and p784.Name:find("Flower") then
                return true, p784.Color
            end
        end),
        Chests = v779.new("Chests", vu89, function(p785)
            return not p785:GetAttribute("IsDisabled"), vu780.Chests[p785.Name]
        end, function(p786)
            return not p786:GetAttribute("IsDisabled")
        end),
        Berries = v779.new("Berries", vu90, function(p787)
            local v788, v789, v790 = pairs(p787:GetAttributes())
            local v791, v792 = v788(v789, v790)
            if v791 ~= nil then
                return true, vu780.Berries, v792, p787.Parent
            end
        end, function(p793)
            if p793:FindFirstChild("Berries") then
                local v794, v795, v796 = pairs(p793.Berries:GetAttributes())
                local v797, _ = v794(v795, v796)
                if v797 ~= nil then
                    return true
                end
            end
        end)
    }
    if not vu82:IsBlacklistedExecutor() then
        v778:AddSection("Aimbot Nearest")
        v778:AddToggle({
            "Aimbot Gun",
            false,
            {
                vu32,
                "AimBot_Gun"
            }
        })
        v778:AddToggle({
            "Aimbot Tap",
            false,
            {
                vu32,
                "AimBot_Tap"
            }
        })
        v778:AddToggle({
            "Aimbot Skills",
            false,
            {
                vu32,
                "AimBot_Skills"
            }
        })
        v778:AddToggle({
            "Ignore Mobs",
            true,
            {
                vu38,
                "NoAimMobs"
            }
        })
    end
    v778:AddSection("ESP")
    if v613 == 2 then
        v778:AddToggle({
            "ESP Flowers",
            false,
            {
                v798.Flowers,
                "Enabled"
            },
            "Esp-Flower"
        })
    end
    v778:AddToggle({
        "ESP Players",
        false,
        {
            v798.Players,
            "Enabled"
        },
        "Esp-Players"
    })
    v778:AddToggle({
        "ESP Fruits",
        false,
        {
            v798.Fruits,
            "Enabled"
        },
        "Esp-Fruits"
    })
    v778:AddToggle({
        "ESP Berries",
        false,
        {
            v798.Berries,
            "Enabled"
        },
        "Esp-Berry"
    })
    v778:AddToggle({
        "ESP Chests",
        false,
        {
            v798.Chests,
            "Enabled"
        },
        "Esp-Chests"
    })
    v778:AddToggle({
        "ESP Islands",
        false,
        {
            v798.Islands,
            "Enabled"
        },
        "Esp-Island"
    })
    v778:AddSection("Visual")
    v778:AddButton({
        "Meteor Rain",
        function()
            require(game:GetService("ReplicatedStorage").Effect.Container.UzothSpec)({
                Position = vu14.Character.PrimaryPart.Position
            })
        end
    })
    v778:AddButton({
        "Remove Portal Dash Cooldown",
        function()
            local v799 = vu14.Backpack:FindFirstChild("Portal-Portal") or vu14.Character:FindFirstChild("Portal-Portal")
            if v799 then
                local v800 = next
                local v801, v802 = getconnections(v799.Activated)
                while true do
                    local v803
                    v802, v803 = v800(v801, v802)
                    if v802 == nil then
                        break
                    end
                    if # debug.getupvalues(v803.Function) == 9 then
                        while task.wait() and (v799 and v799:IsDescendantOf(game)) do
                            debug.setupvalue(v803.Function, 2, 0)
                        end
                    end
                end
            end
        end
    })
    local v804 = v606.Shop
    local v805, v806, v807 = ipairs(vu82.Shop)
    local vu808 = vu610
    while true do
        local v809
        v807, v809 = v805(v806, v807)
        if v807 == nil then
            break
        end
        v804:AddSection(v809[1])
        local v810, v811, v812 = ipairs(v809[2])
        while true do
            local vu813
            v812, vu813 = v810(v811, v812)
            if v812 == nil then
                break
            end
            local v814 = vu813[2]
            local v815 = type(vu813[2]) == "table" and function()
                vu808(unpack(vu813[2]))
            end or v814
            v804:AddButton({
                vu813[1],
                v815
            })
        end
    end
    local v816 = v606.Misc
    local vu817 = nil
    local function v818()
        loadstring((getclipboard or fromclipboard)())()
    end
    local function vu821(p819)
        local v820 = p819:gsub("\n", ""):gsub("```", ""):gsub("`", "")
        if v820:find("-") then
            return v820
        else
            return v820:gsub("v", "-"):gsub("q", "00"):gsub("x", "22"):gsub("f", "11"):gsub("d", "44"):gsub("a", "55"):gsub("h", "66"):gsub("s", "77"):gsub("j", "88"):gsub("g", "99"):gsub("i", "33"):gsub("y", "1"):gsub("p", "2"):gsub("u", "3"):gsub("z", "4"):gsub("o", "5"):gsub("l", "6"):gsub("r", "7"):gsub("k", "8"):gsub("t", "9"):gsub("e", "0"):lower()
        end
    end
    local function v823(p822)
        return vu821(p822)
    end
    local function vu825(p824)
        vu5.__ServerBrowser:InvokeServer("teleport", p824)
    end
    local function v826()
        vu825((getclipboard or fromclipboard)())
    end
    local vu827 = nil
    local vu828 = nil
    local function v832(p829)
        if p829 then
            vu82.Hooking:EnableBypass()
        end
        local v830 = vu32
        local v831 = p829 and vu828 or false
        vu827 = p829
        v830.WalkSpeedBypass = v831
    end
    local function v836(p833)
        local v834 = vu32
        local v835 = vu827 and p833 and p833 or false
        vu828 = p833
        v834.WalkSpeedBypass = v835
    end
    local function v841(p837)
        vu32.WalkOnWater = p837
        local v838 = vu21:WaitForChild("WaterBase-Plane", 9000000000)
        local v839 = vu817 or v838.Size
        local v840 = Vector3.new(v839.X, 113, v839.Z)
        vu817 = v839
        while task.wait(0.25) and vu32.WalkOnWater do
            if vu82.IsAlive(vu14.Character) and vu14.Character.Humanoid.Sit then
                v838.Size = v839
            else
                v838.Size = v840
            end
        end
        v838.Size = v839
    end
    local function v843(p842)
        vu32.AntiAFK = p842
        while vu32.AntiAFK do
            vu6:CaptureController()
            vu6:ClickButton1(Vector2.new(math.huge, math.huge))
            task.wait(600)
        end
    end
    local function v845(p844)
        vu32.ActiveRaceV3 = p844
        while vu32.ActiveRaceV3 do
            if vu15.Race:FindFirstChild("Evolved") then
                vu29.CommE:FireServer("ActivateAbility")
            else
                vu15.Race.ChildAdded:Wait()
            end
            task.wait(vu38.SmoothMode and 2.5 or 1)
        end
    end
    local function v851(p846)
        vu32.ActiveRaceV4 = p846
        local v847 = vu14.Character
        while vu32.ActiveRaceV4 do
            v847 = v847 or vu14.CharacterAdded:Wait()
            local v848 = v847:FindFirstChild("RaceTransformed")
            local v849 = v847:FindFirstChild("RaceEnergy")
            if v849 and (v849.Value >= 1 and (v848 and not v848.Value)) then
                local v850 = vu14.Backpack:FindFirstChild("Awakening") or v847:FindFirstChild("Awakening")
                if v850:FindFirstChild("RemoteFunction") then
                    v850.RemoteFunction:InvokeServer(true)
                end
            end
            task.wait(vu38.SmoothMode and 1 or 0.5)
        end
    end
    if IsOwner then
        v816:AddSection("Executor")
        v816:AddButton({
            "Execute Clipboard",
            v818
        })
    end
    if vu82.JobIds then
        v816:AddSection("Join Server")
        v816:AddTextBox({
            "Input Job Id",
            "1",
            true,
            vu825,
            "JobId"
        }).OnChanging = v823
        v816:AddButton({
            "Join Clipboard",
            v826
        })
    end
    v816:AddSection("Settings")
    v816:AddDropdown({
        "Farm Mode",
        {
            "Up",
            "Orbit",
            "Star"
        },
        "Up",
        {
            vu38,
            "FarmMode"
        },
        "S-FarmMode"
    })
    v816:AddSlider({
        "Farm Distance",
        5,
        30,
        1,
        15,
        function(p852)
            vu38.FarmPos = Vector3.new(0, p852, 0)
            vu38.FarmDistance = p852
        end,
        "S-Distance"
    })
    v816:AddSlider({
        "Tween Speed",
        50,
        300,
        5,
        200,
        {
            vu38,
            "TweenSpeed"
        },
        "S-TweenSpeed"
    })
    v816:AddSlider({
        "Bring Mobs Distance",
        50,
        400,
        10,
        250,
        {
            vu38,
            "BringDistance"
        },
        "S-BringDistance"
    })
    v816:AddToggle({
        "Bring Mobs",
        true,
        {
            vu38,
            "BringMobs"
        },
        "S-BringMobs"
    })
    v816:AddToggle({
        "Auto Haki",
        true,
        {
            vu38,
            "AutoBuso"
        },
        "S-AutoBuso"
    })
    v816:AddToggle({
        "Auto Attack",
        true,
        {
            vu38,
            "AutoClick"
        },
        "S-AutoClick"
    })
    v816:AddToggle({
        "Auto Shoot",
        false,
        {
            vu38,
            "AutoShoot"
        },
        "S-AutoShoot"
    })
    local v853 = v816.AddToggle
    local v854 = {}
    local v855 = {
        pu603.Managers.QuestManager,
        "takeQuestDebounce"
    }
    v854.Desc = "Wait 75 seconds to take the next mission"
    __set_list(v854, 1, {
        "Take Quest Debounce",
        false,
        v855,
        "S-QuestDenounce"
    })
    v853(v816, v854)
    v816:AddSection("Codes")
    v816:AddButton({
        "Redeem all Codes",
        vu101.AllCodes
    })
    v816:AddSection("Server")
    v816:AddButton({
        "Server Hop",
        function()
            vu82:ServerHop()
        end
    })
    v816:AddButton({
        "Rejoin",
        function()
            vu82.Rejoin()
        end
    })
    v816:AddSection("Team")
    v816:AddButton({
        "Join Pirates Team",
        vu84.Pirates
    })
    v816:AddButton({
        "Join Marines Team",
        vu84.Marines
    })
    v816:AddSection("Race")
    v816:AddToggle({
        "Auto Active Race V3",
        false,
        v845,
        "S-RaceV3"
    })
    v816:AddToggle({
        "Auto Active Race V4",
        false,
        v851,
        "S-RaceV4"
    })
    v816:AddSection("Menu")
    v816:AddButton({
        "Devil Fruit Shop",
        function()
            require(vu14.PlayerGui.Main.UIController.FruitShop):Open("FruitDealer")
        end
    })
    v816:AddButton({
        "Advanced Fruit Dealer",
        function()
            require(vu14.PlayerGui.Main.UIController.FruitShop):Open("AdvancedFruitDealer")
        end
    })
    v816:AddButton({
        "Titles",
        function()
            vu808("getTitles")
            vu14.PlayerGui.Main.Titles.Visible = true
        end
    })
    v816:AddButton({
        "Haki Color",
        function()
        end
    })
    if not vu82:IsBlacklistedExecutor() then
        v816:AddSection("Local-Player")
        v816:AddToggle({
            "Enable Speed Hack",
            false,
            v832,
            "M-WalkSpeed:A"
        })
        v816:AddSlider({
            "Walk Speed",
            10,
            300,
            5,
            150,
            v836,
            "M-WalkSpeed:B"
        })
    end
    v816:AddSection("Visual")
    v816:AddButton({
        "Remove Fog",
        vu101.RemoveFog
    })
    v816:AddSection("More FPS")
    local v856 = v816.AddToggle
    local v857 = {}
    local v858 = {
        vu38,
        "SmoothMode"
    }
    v857.Desc = "Reduces calculation speed to improve FPS"
    __set_list(v857, 1, {
        "Smooth Farm Mode",
        false,
        v858,
        "SmoothFarm"
    })
    v856(v816, v857)
    v816:AddToggle({
        "Remove Damage",
        false,
        function(p859)
            vu5.Assets.GUI.DamageCounter.Enabled = not p859
        end,
        "M-DamageCounter"
    })
    v816:AddToggle({
        "Remove Notifications",
        false,
        function(p860)
            vu14.PlayerGui.Notifications.Enabled = not p860
        end,
        "M-Notifications"
    })
    v816:AddSection("Others")
    v816:AddToggle({
        "Walk On Water",
        true,
        v841,
        "M-WalkOnWater"
    })
    v816:AddToggle({
        "Anti AFK",
        true,
        v843,
        "M-AntiAFK"
    })
    local v861 = v606.Items
    if v613 ~= 3 then
        if v613 ~= 2 then
            if v613 == 1 then
                v861:AddSection("Second Sea")
                v614(v861, {
                    "Auto Second Sea",
                    "Automatically unlocks access to the Second Sea"
                }, "SecondSea")
                v861:AddSection("Swords")
                v614(v861, {
                    "Auto Unlock Saber",
                    "Automatically unlocks the Saber Sword"
                }, "Saber")
                v614(v861, {
                    "Auto Pole V1",
                    "Kill Thunder God"
                }, "PoleV1")
                v614(v861, {
                    "Auto Saw Sword",
                    "Kill The Saw"
                }, "TheSaw")
            end
        else
            local function v864(p862)
                vu32.LegendSword = p862
                while task.wait() and vu32.LegendSword do
                    local v863 = vu808("LegendarySwordDealer", "1")
                    if type(v863) ~= "string" then
                        task.wait(5)
                    elseif vu612[v863] then
                        task.wait(13500)
                    elseif vu20.Value < 2000000 then
                        vu20:GetPropertyChangedSignal("Value"):Wait()
                    else
                        vu808("LegendarySwordDealer", "2")
                    end
                end
            end
            v861:AddSection("Third Sea")
            v614(v861, {
                "Auto Third Sea",
                "Automatically unlocks access to the Third Sea"
            }, "ThirdSea")
            v614(v861, {
                "Auto Kill Don Swan",
                "Automatically defeats Don Swan"
            }, "DonSwan")
            v861:AddSection("Bosses")
            v614(v861, {
                "Auto Darkbeard",
                "Automatically spawns and defeats Darkbeard"
            }, "Darkbeard")
            v614(v861, {
                "Auto Cursed Captain",
                "Automatically summons and defeats the Cursed Captain"
            }, "CursedCaptain")
            v861:AddSection("Law")
            v614(v861, {
                "Auto Kill Law",
                "Automatically spawns and defeats Law (Order)"
            }, "Order")
            local v865 = v861.AddToggle
            local v866 = {}
            local v867 = {
                vu38,
                "FullyLawRaid"
            }
            v866.Desc = "Buy the raid law Microchip"
            __set_list(v866, 1, {
                "Auto Buy Microchip",
                false,
                v867,
                "S-FullyLaw"
            })
            v865(v861, v866)
            v861:AddSection("Sword")
            v861:AddToggle({
                Desc = "Automatically purchases Legendary Swords when available",
                "Auto Buy Legendary Sword",
                false,
                v864,
                "LegendSword"
            })
            v614(v861, {
                "Auto Rengoku",
                "Automatically kill Ice Admiral to unlock the Rengoku sword"
            }, "Rengoku")
            v861:AddSection("Race")
            v614(v861, {
                "Auto Race V2",
                "Automatically evolves the Race to V2"
            }, "RaceV2")
            v614(v861, {
                "Auto Race V3",
                "Mink, Human & Shark"
            }, "RaceV3")
            v861:AddSection("Bartilo")
            v614(v861, {
                "Auto Bartilo Quest",
                "Req: Level 850"
            }, "Bartilo")
        end
    else
        v861:AddSection("Dragon Dojo")
        v614(v861, {
            "Auto Dojo Trainer Quest",
            "Automatically completes Dojo Trainer quests"
        }, "DojoTrainer")
        v614(v861, {
            "Auto Dragon Hunter Quest",
            "Automatically completes Dragon Hunter quests"
        }, "DragonHunter")
        v614(v861, {
            "Auto Draco V2 & V3",
            "Evolves the Draco Race to V2 and V3"
        }, "DracoV2V3")
        v861:AddSection("Farm")
        v614(v861, {
            "Auto Elite Hunter",
            "Automatically completes Elite Hunter quests"
        }, "EliteHunter")
        v614(v861, {
            "Auto Rip Indra",
            "Activates the plates and summons Rip Indra"
        }, "RipIndra")
        v614(v861, {
            "Auto Cake Prince",
            "Automatically summons the Cake Prince"
        }, "CakePrince")
        v614(v861, {
            "Auto Dough King",
            "Automatically summons the Dough King"
        }, "DoughKing")
        v861:AddSection("Sword")
        v614(v861, {
            "Auto Collect Yama",
            "Automatically collects the Yama sword after defeating 30 Elite Hunters"
        }, "Yama")
        v614(v861, {
            "Auto Tushita",
            "Solves the Tushita puzzle and defeats Longma"
        }, "Tushita")
        v614(v861, {
            "Auto Cursed Dual Katana",
            "Complete the Cursed Dual Katana puzzle"
        }, "CursedDualKatana")
        v861:AddSection("Quest")
        v614(v861, {
            "Auto Citizen Quest"
        }, "Citizen")
        v614(v861, {
            "Auto Rainbow Haki"
        }, "RainbowHaki")
    end
    v861:AddSection("Berries")
    v614(v861, {
        "Auto Collect Berries"
    }, "BerryBush")
    v861:AddToggle({
        "Auto Berry Hop",
        false,
        {
            vu38,
            "BerryHop"
        },
        "S-BerryHop"
    })
    if v613 ~= 1 and v608.GetColorsList then
        local function v871(p868)
            vu32.barista_cousin = p868
            while vu32.barista_cousin do
                local v869, _ = vu808("BaristaCousin", "ColorsDealer", "1")
                if type(v869) ~= "string" then
                    task.wait(5)
                else
                    local v870 = vu808("ColorsDealer", "2")
                    if v870 == 1 or v870 == 2 then
                        task.wait(250)
                    elseif v870 == 0 then
                        vu20:GetPropertyChangedSignal("Value"):Wait()
                    end
                end
            end
        end
        v861:AddSection("Aura Color")
        local v872 = v861.AddDropdown
        local v873 = {}
        local v874 = {
            vu38,
            "CraftAura"
        }
        __set_list(v873, 1, {
            "Select Aura",
            v608:GetColorsList(),
            false,
            v874,
            "S-Aura"
        })
        v872(v861, v873)
        v614(v861, {
            "Auto Craft Aura Color"
        }, "AuraColor")
        v861:AddToggle({
            "Auto Craft Hop",
            false,
            {
                vu38,
                "CraftHop"
            },
            "S-CraftHop"
        })
        v861:AddToggle({
            "Auto Barista Cousin",
            false,
            v871,
            "B-Cousin"
        })
    end
end
function vu102.StartFarm(_)
    if not vu32.loadedFarm then
        vu32.loadedFarm = true
        task.spawn(vu82.RunFunctions.FarmQueue, vu37)
    end
end
function vu102.StartFunctions(p875)
    table.clear(vu36)
    local vu876 = {}
    local function v884(p877, p878, p879)
        if p879 == false then
            return
        end
        if not vu876[p877] then
            vu876[p877] = p878
            table.insert(vu36, {
                Name = p877,
                Function = p878
            })
            return nil
        end
        vu876[p877] = p878
        local v880, v881, v882 = ipairs(vu36)
        while true do
            local v883
            v882, v883 = v880(v881, v882)
            if v882 == nil then
                break
            end
            if v883.Name == p877 then
                v883.Function = p878
                break
            end
        end
    end
    local _ = p875.Managers.FightingStyle
    local vu885 = p875.Managers.IslandManager
    local vu886 = p875.Managers.QuestManager
    local vu887 = p875.Managers.FarmManager
    local vu888 = p875.Managers.RaidManager
    local vu889 = p875.Managers.ItemsQuests
    local vu890 = p875.Managers.SeaManager
    local vu891 = p875.Managers.PlayerTeleport
    local _ = vu82.GameData.MaxMastery
    local vu892 = vu82.GameData.MaxLevel
    local vu893 = vu82.GameData.Sea
    local vu894 = vu82.IsAlive
    local v895 = vu82.Inventory
    local vu896 = vu82.EquipTool
    local vu897 = vu82.FireRemote
    local vu898 = v895.Unlocked
    local vu899 = v895.Count
    local vu900 = v895.Mastery
    local vu901 = vu82.Enemies.IsSpawned
    local vu902 = vu82.EnemySpawned
    local vu903 = vu82.EnemyLocations
    local vu904 = vu887.Enemies.Elites
    local _ = vu887.Enemies.Bones
    local _ = vu887.Enemies.Katakuri
    local vu905 = vu887.Enemies.Ectoplasm
    local vu906 = vu887.attack
    local vu907 = Vector3.new(0, 3, 0)
    local vu908 = Vector3.new(0, 5, 0)
    local vu909 = Vector3.new(0, 50, 0)
    local vu910 = Vector3.new(0, - 10, 0)
    local vu911 = CFrame.new(- 1926, 13, 1738)
    local vu912 = CFrame.new(- 5556, 300, - 2988)
    local vu913 = CFrame.new(914, 126, 33100)
    local vu914 = CFrame.new(- 5410, 314, - 2628)
    local vu915 = CFrame.new(- 5561, 314, - 2663)
    local vu916 = CFrame.new(- 8932.85, 142.87, 6063.31)
    local vu917 = CFrame.new(1346, 37, - 1329)
    local vu918 = CFrame.new(- 2103, 70, - 12165)
    local vu919 = CFrame.new(224, 25, - 12771)
    local vu920 = CFrame.new(3779, 16, - 3500)
    local vu921 = CFrame.new(912, 186, 33591)
    local vu922 = CFrame.new(- 5417, 313, - 2822)
    local vu923 = CFrame.new(- 9513, 164, 5786)
    local vu924 = CFrame.new(- 1461, 30, - 51)
    local vu925 = CFrame.new(5864, 1209, 810)
    local vu926 = CFrame.new(5251, 20, 454)
    local vu927 = CFrame.new(- 7739, 5657, - 2289)
    local vu928 = CFrame.new(- 690, 15, 1583)
    local vu929 = CFrame.new(- 26952, 21, 329)
    local vu930 = CFrame.new(- 462, 73, 300)
    local vu931 = CFrame.new(2289, 15, 808)
    local vu932 = CFrame.new(- 2777, 73, - 3570)
    local vu933 = CFrame.new(- 1988, 124, - 70)
    local vu934 = CFrame.new(- 12512, 340, - 9872)
    local vu935 = CFrame.new(- 12445, 332, - 7676)
    local vu936 = CFrame.new(- 12445, 332, - 7676)
    local vu937 = vu31:WaitForChild("RF/InteractSubclassQuest")
    vu31:WaitForChild("RF/InteractDragonQuest")
    local vu938 = vu31:WaitForChild("RF/StartSubclassQuest")
    local vu939 = vu31:WaitForChild("RE/TouchKitsuneStatue")
    vu31:WaitForChild("RE/DragonDojoEmber")
    local vu940 = vu31:WaitForChild("RF/JuiceNetworkRF")
    local vu941 = vu31:WaitForChild("RF/DragonHunter")
    local vu942 = vu31:WaitForChild("RF/ClaimBerry")
    local vu943 = vu29:WaitForChild("SubclassNetwork")
    vu29:WaitForChild("QuestUpdate")
    local vu944 = nil
    local vu945 = 0
    local vu946 = nil
    local vu947 = nil
    local vu948 = nil
    local vu949 = nil
    local vu950 = {}
    local vu951 = {}
    local vu952 = {
        SegmentVector = Vector3.new(0, 75, 0),
        Segment = nil
    }
    local vu953 = {
        ["Forest Pirate"] = {
            CFrame.new(- 13335, 380, - 7660),
            CFrame.new(- 13138, 380, - 7713),
            CFrame.new(- 13298, 380, - 7876),
            CFrame.new(- 13512, 380, - 7983),
            CFrame.new(- 13632, 380, - 7815)
        },
        ["Swan Pirate"] = {
            CFrame.new(778, 110, 1129),
            CFrame.new(1018, 110, 1128),
            CFrame.new(1020, 110, 1366),
            CFrame.new(1016, 110, 1115)
        }
    }
    local vu954 = {
        Quests = {
            Evil = "Yama",
            Good = "Tushita"
        },
        CurrentQuest = {
            Quest = false,
            Frags = - 1
        },
        BoatsDealer = {},
        CakeQueen = CFrame.new(- 710, 382, - 11150),
        DoorNpc = CFrame.new(- 12131, 578, - 6707),
        ForestPirate = CFrame.new(- 13350, 332, - 7645),
        Heaven = {
            "Heaven\'s Guardian",
            "Cursed Skeleton"
        },
        Hell = {
            "Hell\'s Messenger",
            "Cursed Skeleton"
        },
        CursedSkeleton = {
            CFrame.new(- 12360, 603, - 6551),
            CFrame.new(- 12331, 603, - 6551)
        },
        OpenedDoor = false
    }
    local vu955 = {
        "Stone",
        "Hydra Leader",
        "Kilo Admiral",
        "Captain Elephant",
        "Beautiful Pirate"
    }
    local vu956 = {
        GravestoneEvent = CFrame.new(- 8654, 141, 6169),
        Gravestones = CFrame.new(- 8760, 142, 6018),
        BuySkullGuitar = CFrame.new(- 9680, 6, 6346),
        Zombies = CFrame.new(- 10139, 154, 6001),
        Trophies = CFrame.new(- 9529, 6, 6039),
        Ghost = CFrame.new(- 9758, 270, 6291),
        Pipes = CFrame.new(- 9576, 6, 6230)
    }
    local vu957 = {
        FireFlower = {
            "Forest Pirate",
            "Mythological Pirate"
        },
        RequestQuest = {
            Context = "RequestQuest"
        },
        Check = {
            Context = "Check"
        }
    }
    local vu958 = {
        Human = {
            "Fajita",
            "Diamond",
            "Jeremy"
        },
        Shark = ToDictionary({
            "Sea Beast"
        })
    };
    ({}).Races = ToDictionary({
        "Human",
        "Skypiea",
        "Fishman",
        "Mink",
        "Cyborg",
        "Ghoul"
    })
    local vu959 = {
        ["Really red"] = "Pure Red",
        Oyster = "Snow White",
        ["Hot pink"] = "Winter Sky",
        Hot_Green = BrickColor.new("Lime green")
    }
    local vu960 = {
        Shipwright = ToDictionary({
            "Shark"
        }),
        SharkAnchor = ToDictionary({
            "Terrorshark"
        })
    }
    local function vu965()
        if vu944 and vu901(vu944) then
            return vu944
        end
        local v961, v962, v963 = pairs(vu82.Bosses)
        while true do
            local v964
            v963, v964 = v961(v962, v963)
            if v963 == nil then
                break
            end
            if vu901(v963) then
                vu944 = v963
                return v963
            end
        end
    end
    local function vu976()
        local v966 = vu886:GetUnlockedHakiColors()
        local v967 = vu21["Boat Castle"].Summoner.Circle
        local v968 = vu959.Hot_Green
        local v969, v970, v971 = ipairs(v967:GetChildren())
        local v972 = 0
        while true do
            local v973
            v971, v973 = v969(v970, v971)
            if v971 == nil then
                break
            end
            if v973:IsA("BasePart") and v973:FindFirstChild("Part") then
                local v974 = vu959[v973.BrickColor.Name]
                local v975 = v973.Position
                if v973.Part.BrickColor ~= v968 then
                    if v966[v974] then
                        if vu14:DistanceFromCharacter(v975) > 3 then
                            vu83(v973.CFrame)
                        else
                            vu83(place.CFrame + vu908)
                            vu31:FindFirstChild("RF/FruitCustomizerRF"):InvokeServer({
                                StorageName = place_color_name,
                                Type = "AuraSkin",
                                Context = "Equip"
                            })
                        end
                    end
                else
                    v972 = v972 + 1
                end
            end
        end
        return v972
    end
    local function vu977()
        fireclickdetector(vu21.Waterfall.SealedKatana.Hitbox.ClickDetector)
    end
    local function vu983(p978, p979, p980)
        local v981 = p978.Quest
        if v981 and (p980 == false or not p980 and vu38.BossQuest) and vu19.Value >= p978.Level and not vu886:VerifyQuest(p979) then
            vu886:StartQuest(v981[1], v981[3] or 3, v981[2])
            return "Getting Boss Quest: " .. p979
        end
        local v982 = vu902(p979)
        if v982 and v982.PrimaryPart then
            return "Killing: " .. p979, vu906(v982)
        end
        if p978.Position then
            return "Waiting for: " .. p979, vu83(p978.Position)
        end
    end
    local function vu991()
        local v984 = math.huge
        local v985, v986, v987 = ipairs(workspace:GetChildren())
        local v988 = nil
        while true do
            local v989
            v987, v989 = v985(v986, v987)
            if v987 == nil then
                break
            end
            if v989.Name == "EmberTemplate" and (v989:FindFirstChild("Part") and v989.Part.Position.Y > 0) then
                local v990 = vu14:DistanceFromCharacter(v989.Part.Position)
                if v990 < v984 then
                    v988 = v989.Part
                    v984 = v990
                end
            end
        end
        return v988
    end
    local function vu993()
        if vu16.Value >= 1000 and not VerifyTool("Microchip") then
            vu897("BlackbeardReward", "Microchip", "2")
            local v992 = tick()
            repeat
                task.wait()
            until VerifyTool("Microchip") or tick() - v992 > 5
        end
    end
    local function vu1000()
        if vu949 and vu949:IsDescendantOf(vu21) then
            return vu949
        end
        local v994 = vu21.Waterfall.IslandModel:GetChildren()
        local v995, v996, v997 = ipairs(v994)
        while true do
            local v998
            v997, v998 = v995(v996, v997)
            if v997 == nil then
                break
            end
            if v998:IsA("Model") and v998.Name == "Tree" then
                local v999 = v998:FindFirstChild("Group")
                if v999 then
                    v999 = v999:FindFirstChild("Meshes/bambootree")
                end
                if v999 and v999.Anchored then
                    vu949 = v999
                    return v999
                end
            end
        end
    end
    local function vu1002()
        local v1001 = vu1000()
        if v1001 and vu14:DistanceFromCharacter(v1001.Position) <= 3 then
            if vu898["Skull Guitar"] then
                if VerifyTool("Skull Guitar") then
                    vu82.Hooking:SetTarget(v1001)
                    vu896("Skull Guitar")
                    vu82.FastAttack:ShootInTarget(v1001.Position + vu910)
                else
                    vu897("LoadItem", "Skull Guitar")
                end
                return nil
            end
            vu896(vu890:RandomTool(), true)
            vu82.UseSkills(v1001, vu38.SeaSkills)
        elseif v1001 then
            local _ = v1001.CFrame
        end
    end
    local function vu1012()
        if vu14:DistanceFromCharacter(vu956.Zombies) >= 10 then
            return vu83(vu956.Zombies)
        end
        local v1003 = 0
        local v1004 = vu14.Character
        local v1005
        if v1004 then
            v1005 = v1004.PrimaryPart
        else
            v1005 = v1004
        end
        if not v1005 then
            return nil
        end
        local v1006 = vu25
        local v1007, v1008, v1009 = ipairs(v1006:GetChildren())
        while true do
            local v1010
            v1009, v1010 = v1007(v1008, v1009)
            if v1009 == nil then
                break
            end
            local v1011 = v1010.PrimaryPart
            if v1010.Name == "Living Zombie" and (vu894(v1010) and v1011) then
                v1003 = v1003 + 1
                v1011.CFrame = v1005.CFrame * CFrame.new(0, - 15, - 15)
                v1011.CanCollide = false
                v1011.Size = Vector3.new(60, 60, 60)
                v1010.Humanoid.WalkSpeed = 0
                v1010.Humanoid.JumpPower = 0
                v1010.Humanoid:ChangeState(14)
            end
        end
        pcall(sethiddenproperty, vu14, "SimulationRadius", math.huge)
        if v1003 > 5 then
            vu896()
            EnableBuso()
        elseif v1004:FindFirstChildOfClass("Tool") then
            v1004:FindFirstChildOfClass("Tool").Parent = vu14.Backpack
        end
    end
    local function vu1018()
        if vu14:FindFirstChild("QuestHaze") then
            return "Yama", 2
        end
        if vu14:FindFirstChild("BoatQuest") then
            return "Tushita", 1
        end
        if vu21:FindFirstChild("HellDimension") then
            return "Yama", 3
        end
        if vu21:FindFirstChild("HeavenlyDimension") then
            return "Tushita", 3
        end
        if vu899["Alucard Fragment"] == 6 then
            return "FinalQuest"
        end
        local v1013, v1014, v1015 = pairs(vu954.Quests)
        while true do
            local v1016
            v1015, v1016 = v1013(v1014, v1015)
            if v1015 == nil then
                break
            end
            local v1017 = vu897("CDKQuest", "Progress", v1015)[v1015]
            if v1017 < - 2 then
                return v1016, (v1017 + 2) * - 1
            end
            if 0 <= v1017 and v1017 < 3 then
                vu897("CDKQuest", "StartTrial", v1015)
                return v1016, v1017 + 1
            end
        end
    end
    local function vu1021(p1019)
        local v1020 = p1019:FindFirstChild("Specs")
        if v1020 then
            v1020 = p1019.Specs.Enabled
        end
        return v1020
    end
    local function vu1028(p1022)
        if vu948 and (vu948:IsDescendantOf(p1022) and vu1021(vu948)) then
            return vu948
        end
        local v1023, v1024, v1025 = ipairs(p1022.Core.VolcanoRocks:GetChildren())
        while true do
            local v1026
            v1025, v1026 = v1023(v1024, v1025)
            if v1025 == nil then
                break
            end
            local v1027 = v1026:FindFirstChild("VFXLayer")
            if v1027 and vu1021(v1027) then
                vu948 = v1027
                return v1027
            end
        end
    end
    local function vu1031(p1029)
        EnableBuso()
        vu890:StopBoat()
        if p1029.Name == "Leviathan Segment" and p1029:FindFirstChild("Head") then
            vu896(vu890:RandomTool(), true)
            vu82.UseSkills(p1029.Head.CFrame + vu952.SegmentVector, vu38.SeaSkills)
            return true, vu83(p1029.Head.CFrame + vu952.SegmentVector)
        end
        if p1029:FindFirstChild("Head") then
            local v1030 = CFrame.new(p1029.Head.Position.X, 60, p1029.Head.Position.Z)
            EnableBuso()
            vu890:StopBoat()
            vu896(vu890:RandomTool(), true)
            vu82.UseSkills(v1030, vu38.SeaSkills)
            return true, vu83(v1030)
        end
    end
    v884("Tushita", function()
        if vu898.Tushita then
            if not vu901("rip_indra True Form") then
                return nil
            end
            local v1032 = vu902("rip_indra True Form")
            if v1032 and v1032.PrimaryPart then
                vu906(v1032)
            else
                vu83(vu914)
            end
            return true
        else
            local v1033 = vu82:GetProgress("Tushita", "TushitaProgress")
            if v1033.OpenedDoor then
                if vu901("Longma") then
                    return vu983(vu82.Bosses.Longma, "Longma")
                else
                    return nil
                end
            elseif VerifyTool("Holy Torch") then
                for v1034 = 1, # v1033.Torches do
                    if not v1033.Torches[v1034] then
                        vu897("TushitaProgress", "Torch", v1034)
                    end
                end
                return true
            elseif vu901("rip_indra True Form") then
                vu83(CFrame.new(5713, 38, 255))
                return true
            else
                local v1035
                if vu45.EliteHunter then
                    v1035 = false
                else
                    v1035 = vu876.EliteHunter()
                end
                return v1035
            end
        end
    end, vu893 == 3)
    v884("Darkbeard", function()
        if vu901("Darkbeard") then
            local v1036 = vu902("Darkbeard")
            if v1036 and v1036.PrimaryPart then
                vu906(v1036)
            else
                vu83(vu920)
            end
            return true
        end
        if VerifyTool("Fist of Darkness") then
            vu896("Fist of Darkness")
            vu83(vu920)
            return true
        end
    end, vu893 == 2)
    v884("CursedCaptain", function()
        if vu901("Cursed Captain") then
            local v1037 = vu902("Cursed Captain")
            if v1037 and v1037.PrimaryPart then
                vu906(v1037)
            else
                vu83(vu921)
            end
            return true
        end
    end, vu893 == 2)
    v884("Factory", function()
        local v1038 = vu25:FindFirstChild("Core") or vu5:FindFirstChild("Core")
        if v1038 and (vu894(v1038) and v1038.PrimaryPart) then
            return "Defeating Factory", vu887.TargetPosition(v1038.PrimaryPart.CFrame)
        end
    end, vu893 == 2)
    v884("SkullGuitar", function()
        if vu19.Value < 2300 or (vu9:GetAttribute("MoonPhase") ~= 5 or vu898["Skull Guitar"]) then
            return nil
        else
            local v1039 = vu82:GetProgress("SkullGuitar", "GuitarPuzzleProgress", "Check")
            if v1039 then
                local _ = v1039.CraftedOnce
                local v1040 = v1039.Gravestones
                local v1041 = v1039.Trophies
                local v1042 = v1039.Swamp
                local v1043 = v1039.Ghost
                if v1039.Pipes then
                    if vu14:DistanceFromCharacter(vu956.BuySkullGuitar.Position) then
                        vu897("soulGuitarBuy", true)
                    else
                        vu83(vu956.BuySkullGuitar)
                    end
                    return true
                else
                    if v1041 then
                        vu83(vu956.Pipes)
                        vu891:NPCTalk(vu956.Pipes, "GuitarPuzzleProgress", "Pipes")
                    elseif v1043 then
                        vu83(vu956.Trophies)
                        vu891:NPCTalk(vu956.Trophies, "GuitarPuzzleProgress", "Trophies")
                    elseif v1040 then
                        vu83(vu956.Ghost)
                        vu891:NPCTalk(vu956.Ghost, "GuitarPuzzleProgress", "Ghost")
                    elseif v1042 then
                        vu83(vu956.Gravestones)
                        vu891:NPCTalk(vu956.Gravestones, "GuitarPuzzleProgress", "Gravestones")
                    else
                        vu1012()
                    end
                    return true
                end
            else
                if vu14:DistanceFromCharacter(vu956.GravestoneEvent.Position) then
                    vu897("gravestoneEvent", 2, true)
                else
                    vu83(vu956.GravestoneEvent)
                end
                return true
            end
        end
    end, vu893 == 3)
    v884("CursedDualKatana", function()
        if vu898["Cursed Dual Katana"] then
            return nil
        end
        if not vu898.Tushita then
            return vu876.Tushita()
        end
        if not vu898.Yama then
            return vu876.Yama() or vu876.EliteHunter()
        end
        local v1044 = vu900.Tushita
        local v1045 = vu900.Yama
        if 350 > v1044 or 350 > v1045 then
            local v1046 = v1044 < 350 and "Tushita" or "Yama"
            if not VerifyTool(v1046) then
                vu897("LoadItem", v1046)
                return "Getting 350 in: " .. v1046
            end
            vu896(v1046)
            vu887.ToolDebounce()
            return vu45.PirateRaid and vu876.PirateRaid() or vu45.Fruits and vu876.Fruits() or (vu45.EliteHunter and vu876.EliteHunter() or vu876.Bones())
        end
        local v1047 = vu954.CurrentQuest
        local _ = vu21.Turtle.Cursed
        if not vu954.OpenedDoor then
            local v1048 = vu897("CDKQuest", "OpenDoor")
            if v1048 == "opened" or v1048 == "can" and vu897("CDKQuest", "OpenDoor", true) then
                vu954.OpenedDoor = true
                setclipboard("Destruindo porta")
                if vu21.Turtle.Cursed:FindFirstChild("Breakable") then
                    vu21.Turtle.Cursed.Breakable:Destroy()
                end
            end
            return nil
        end
        if not v1047.Quest or v1047.Frags ~= vu899["Alucard Fragment"] then
            local v1049 = vu899["Alucard Fragment"]
            v1047.Quest = {
                vu1018()
            }
            v1047.Frags = v1049
        end
        local v1050 = vu889.CursedDualKatana
        local v1051 = v1047.Quest[1]
        local v1052 = v1047.Quest[2]
        if v1051 then
            if v1052 then
                if v1050[v1051][v1052](vu954, vu876) then
                    return v1051 .. v1052
                end
            elseif v1050[v1051](vu954, vu876) then
                return v1051
            end
        end
    end, vu893 == 3)
    v884("Raid", function()
        local v1053 = vu28:FindFirstChild("l\'\195\137glise de Proph\195\169tie")
        if v1053 and vu14:DistanceFromCharacter(v1053.Position) <= 150 then
            local v1054 = vu897("Awakener", "Check")
            if type(v1054) ~= "table" then
                if v1054 ~= 0 then
                    return true, vu897("Awakener", "Teleport")
                end
            else
                if vu16.Value < (v1054.Cost or 0) then
                    return true, vu897("Awakener", "Teleport")
                end
                vu897("Awakener", "Awaken")
                vu897("Awakener", "Teleport")
            end
        end
        if vu888:IsRaiding() then
            local v1055 = vu82:GetRaidIsland()
            if not v1055 then
                return true
            end
            local v1056 = vu25
            local v1057, v1058, v1059 = ipairs(v1056:GetChildren())
            while true do
                local v1060
                v1059, v1060 = v1057(v1058, v1059)
                if v1059 == nil then
                    break
                end
                local v1061 = v1060.PrimaryPart
                if vu894(v1060) and (v1061 and ((v1055.Position - v1061.Position).Magnitude <= 1000 and v1061.Position.Y > 0)) then
                    return true, vu906(v1060, true, true, vu38.FarmMode ~= "Up" and vu38.FarmMode or "Star")
                end
            end
            if vu14:DistanceFromCharacter(v1055.Position) <= 3000 then
                vu83(v1055.CFrame + vu909)
            end
            return true
        end
        if VerifyTool("Special Microchip") then
            return true, vu888:start()
        end
    end, vu893 == 2 or vu893 == 3)
    v884("Leviathan", function()
        if not vu21:FindFirstChild("FrozenHeart") then
            local v1062 = vu952.Segment
            if v1062 and (vu894(v1062) and v1062:GetAttribute("HealthEnabled")) then
                return vu1031(v1062)
            end
            local v1063 = vu24:GetChildren()
            for v1064 = 1, # v1063 do
                local v1065 = v1063[v1064]
                if v1065.name:find("Leviathan") then
                    if vu894(v1065) then
                        if v1065:GetAttribute("HealthEnabled") then
                            vu952.Segment = v1065
                            return vu1031(v1065)
                        end
                    end
                end
            end
        end
    end, vu893 == 3)
    v884("PirateRaid", function()
        local v1066 = vu82.Enemies:GetTagged("PirateRaid")
        if # v1066 > 0 or tick() - vu82.PirateRaid <= 10 then
            for v1067 = 1, # v1066 do
                if v1066[v1067].PrimaryPart then
                    return true, vu906(v1066[v1067], true, true)
                end
            end
            return true, vu83(vu912)
        end
    end, vu893 == 3)
    v884("Fruits", function()
        local v1068 = workspace:FindFirstChild("Fruit ") or workspace:FindFirstChildOfClass("Tool")
        if v1068 and (v1068:IsA("Model") or v1068:IsA("Tool")) then
            local v1069 = v1068:FindFirstChild("Handle")
            if v1069 then
                v1069 = v1068.Handle.CFrame
            end
            local v1070
            if v1069 or not v1068:IsA("Model") then
                v1070 = v1069
            else
                v1070 = v1068:GetPivot()
                if v1070.Position == Vector3.zero then
                    v1070 = v1069
                end
            end
            if v1070 then
                if vu14:DistanceFromCharacter(v1070.Position) > 2 then
                    vu83(v1070)
                else
                    vu83(v1070 + vu907)
                end
                return true
            end
        end
    end)
    v884("FireFlowers", function(p1071)
        local v1072 = workspace:FindFirstChild("FireFlowers")
        if v1072 then
            local v1073 = v1072:GetChildren()
            for v1074 = 1, # v1073 do
                local v1075 = v1073[v1074]
                local v1076 = v1075:IsA("Model")
                if v1076 then
                    v1076 = v1075.PrimaryPart or v1075:FindFirstChildOfClass("MeshPart")
                end
                if v1076 then
                    if vu14:DistanceFromCharacter(v1076.Position) > 3 then
                        vu83(v1076.CFrame)
                    elseif v1075:FindFirstChild("ProximityPrompt") and v1075.ProximityPrompt.Enabled then
                        fireproximityprompt(v1075.ProximityPrompt)
                        task.wait(0.5)
                    end
                    return "Collecting Fire Flower"
                end
            end
        end
        local v1077 = vu902(vu957.FireFlower)
        if v1077 and v1077.PrimaryPart then
            vu906(v1077, true)
        else
            vu891:NPCs(vu953["Forest Pirate"])
        end
        return ("Getting Fire Flowers: %i/%i"):format(vu899["Fire Flower"], p1071 or 99)
    end, vu893 == 3)
    v884("DracoV2V3", function()
        return vu889:GetDracoRace(vu876)
    end, vu893 == 3)
    v884("DojoTrainer", function()
        local v1078 = vu950["Dragon Talon"]
        if v1078 and v1078 >= 500 then
            return vu889:BeltQuests(vu876)
        end
        if VerifyTool("Dragon Talon") then
            if v1078 then
                vu950["Dragon Talon"] = GetToolMastery("Dragon Talon")
                vu896("Dragon Talon")
                vu887.ToolDebounce()
                return vu876.Bones()
            end
            vu950["Dragon Talon"] = GetToolMastery("Dragon Talon")
        else
            vu897("BuyDragonTalon")
        end
        return true
    end, vu893 == 3)
    v884("DragonHunter", function()
        if vu946 == "Locked" then
            return nil
        end
        local v1079 = vu991()
        if v1079 then
            vu83(v1079.CFrame)
            return "Colleting Blaze Ember"
        end
        if not (vu946 and vu946.Text) then
            if vu14:DistanceFromCharacter(vu925.Position) >= 5 then
                vu83(vu925)
            else
                vu946 = vu941:InvokeServer(vu957.Check)
                if vu946 and not vu946.Text then
                    pcall(vu941.InvokeServer, vu941, vu957.RequestQuest)
                end
            end
            return "Getting Dragon Hunter Quest"
        end
        local v1080 = vu946.Text
        if v1080:find("Defeat") then
            local v1081 = v1080:find("Venomous") and "Venomous Assailant" or "Hydra Enforcer"
            local v1082 = vu902(v1081)
            local v1083 = vu903[v1081]
            if v1082 and v1082.PrimaryPart then
                vu906(v1082, true)
            elseif v1083 then
                vu891:NPCs(v1083)
            end
            return "Killing: " .. v1081
        end
        if v1080:find("Destroy") then
            vu1002()
            return "Breaking Hydra Island Tree\'s"
        end
    end, vu893 == 3)
    v884("MirageFruitDealer", function()
        if vu885:GetSpawnedIsland("MysticIsland") then
            local v1084 = vu885:GetMirageFruitDealer()
            if v1084 and v1084.PrimaryPart then
                vu83(v1084.PrimaryPart.CFrame)
                return true
            end
        end
    end, vu893 == 3)
    v884("MirageGear", function()
        local v1085 = vu21:FindFirstChild("MysticIsland")
        if v1085 then
            local v1086 = vu885:GetMirageGear(v1085)
            if v1086 and v1086.Transparency < 1 then
                vu83(v1086.CFrame)
                return true
            end
        end
    end, vu893 == 3)
    v884("MirageChests", function()
        if vu21:FindFirstChild("MysticIsland") then
            local _ = vu876.ChestTween
            local _ = vu21.MysticIsland
        end
    end)
    v884("TeleportMirage", function()
        local v1087 = vu21:FindFirstChild("MysticIsland")
        if v1087 then
            v1087 = vu885:GetMirageTop(v1087)
        end
        if v1087 then
            vu83(v1087.CFrame * CFrame.new(0, 211.8, 0))
            return true
        end
    end, vu893 == 3)
    v884("CraftVolcanicMagnet", function()
        if not (vu898["Volcanic Magnet"] or vu21:FindFirstChild("PrehistoricIsland")) then
            if vu899["Scrap Metal"] < 10 then
                return vu887:Material("Leather + Scrap Metal")
            end
            if vu899["Blaze Ember"] < 15 then
                return vu876.DragonHunter()
            end
            if vu14:DistanceFromCharacter(vu925.Position) >= 3 then
                vu83(vu925)
            else
                vu897("CraftItem", "Craft", "Volcanic Magnet")
            end
            return true
        end
    end, vu893 == 3)
    v884("PrehistoricBones", function()
        if vu899["Dinosaur Bones"] >= 99 then
            return nil
        end
        if vu14:GetAttribute("PrehistoricIslandParticipant") and workspace:FindFirstChild("PrehistoricIsland") then
            local v1088 = workspace:GetChildren()
            for v1089 = 1, # v1088 do
                local v1090 = v1088[v1089]
                if v1090.Name == "DinoBone" then
                    if v1090:IsA("BasePart") then
                        if (v1090.Position - workspace.PrehistoricIsland:GetPivot().Position).Magnitude <= 1500 then
                            if vu14:DistanceFromCharacter(v1090.Position) > 3 then
                                vu83(v1090.CFrame)
                            else
                                vu83(v1090.CFrame + vu908)
                            end
                            vu945 = tick()
                            return "Collecting Dinosaur Bones"
                        end
                    end
                end
            end
        end
    end, vu893 == 3)
    v884("PrehistoricEgg", function()
        local v1091 = vu885:GetSpawnedIsland("PrehistoricIsland")
        if v1091 then
            local v1092 = v1091:FindFirstChild("Core")
            if v1092 then
                v1092 = v1092:FindFirstChild("SpawnedDragonEggs")
            end
            if v1092 and # v1092:GetChildren() > 0 then
                local v1093 = v1092:FindFirstChild("DragonEgg")
                if v1093 then
                    v1093 = v1093:FindFirstChild("Molten")
                end
                if v1093 and (v1093:FindFirstChild("ProximityPrompt") and v1093.ProximityPrompt.Enabled) then
                    if vu14:DistanceFromCharacter(v1093.Position) >= 3 then
                        vu83(v1093.CFrame)
                    else
                        fireproximityprompt(v1093.ProximityPrompt)
                        task.wait(0.5)
                    end
                    vu945 = tick()
                    return "Collecting Dragon Egg"
                end
            end
        end
    end, vu893 == 3)
    v884("LavaGolem", function()
        local v1094 = vu885:GetSpawnedIsland("PrehistoricIsland")
        if v1094 and v1094:GetAttribute("IsMinigameActive") then
            local v1095 = vu25
            local v1096, v1097, v1098 = ipairs(v1095:GetChildren())
            while true do
                local v1099
                v1098, v1099 = v1096(v1097, v1098)
                if v1098 == nil then
                    break
                end
                local v1100 = v1099.PrimaryPart
                if v1099.Name == "Lava Golem" and (v1100 and v1100.Position.Y > 0) then
                    vu906(v1099, true)
                    vu945 = tick()
                    return "Defeating Lava Golem"
                end
            end
        end
    end, vu893 == 3)
    v884("PrehistoricIsland", function()
        local v1101 = vu885:GetSpawnedIsland("PrehistoricIsland")
        if v1101 then
            local v1102 = vu885:GetPrehistoricActivationPrompt(v1101)
            if not v1102 then
                return true, vu890:StopBoat()
            end
            if v1102.Parent:FindFirstChild("InteriorLava") then
                v1102.Parent.InteriorLava:Destroy()
            end
            if v1101:GetAttribute("IsMinigameActive") then
                local v1103 = tick()
                RemoveCanTouch = tick()
                vu945 = v1103
                local v1104 = vu1028(v1101)
                if v1104 then
                    if vu14:DistanceFromCharacter(v1104.Position) >= 5 then
                        vu83(v1104.CFrame, false, false, true)
                    else
                        vu896(vu890:RandomTool(), true)
                        vu82.UseSkills(v1104, vu38.SeaSkills)
                    end
                else
                    vu83(v1102.CFrame, false, false, true)
                end
                return "Volcano Patch"
            end
            if vu14:DistanceFromCharacter(v1102.Position) > 3 then
                vu945 = tick()
                vu83(v1102.CFrame)
                return "Teleporting to Prehistoric Island"
            end
            if v1102:FindFirstChild("ProximityPrompt") and v1102.ProximityPrompt.Enabled then
                vu945 = tick()
                fireproximityprompt(v1102.ProximityPrompt)
                task.wait(0.5)
                return "Waiting..."
            end
            if vu38.ResetPrehistoric and (tick() - vu945 >= 8 and vu894(vu14.Character)) then
                vu14.Character.Humanoid.Health = 0
                return "Reseting..."
            end
        end
        if vu45.Sea and vu38.aTweenBoat or vu45.KitsuneIsland and vu21:FindFirstChild("KitsuneIsland") then
            return nil
        end
        if vu890:GetPlayerBoat() then
            vu890:RandomTeleport("inf")
        else
            vu890:BuyNewBoat()
        end
        return "Finding Prehistoric Island"
    end, vu893 == 3)
    v884("KitsuneIsland", function()
        local v1105 = vu21:FindFirstChild("KitsuneIsland")
        if not v1105 or vu9:GetAttribute("MoonPhase") ~= 5 then
            if vu45.Sea then
                return nil
            end
            if vu890:GetPlayerBoat() then
                vu890:RandomTeleport("6")
            else
                vu890:BuyNewBoat()
            end
            return true
        end
        if vu9:GetAttribute("IsBlueMoon") and vu9:GetAttribute("BlueMoonEnded") then
            return nil
        end
        local v1106 = vu991()
        if v1106 then
            vu83(v1106.CFrame)
            return true
        end
        local v1107 = v1105:FindFirstChild("ShrineDialogPart")
        if v1107 then
            if vu14:DistanceFromCharacter(v1107.Position) > 3 then
                vu83(v1107.CFrame)
            elseif vu9:GetAttribute("MoonPhase") == 5 and not vu9:GetAttribute("IsBlueMoon") then
                vu939:FireServer()
            end
        elseif v1105.WorldPivot then
            vu83(v1105.WorldPivot)
        end
        return true
    end, vu893 == 3)
    v884("Shipwright", function()
        if vu17.Value == "Shipwright" then
            return nil
        end
        local v1108, v1109 = vu937:InvokeServer("Shipwright")
        if v1108 == 1 then
            vu938:InvokeServer("Shipwright")
        elseif v1108 == 3 then
            if (tonumber(v1109) or 0) < 20 then
                return vu876.Sea(vu960.Shipwright)
            end
        elseif v1108 == 4 or v1108 == 2 then
            if vu943.GetPlayerData:InvokeServer().Purchased.Shipwright == nil then
                if vu16.Value >= 3000 then
                    vu943.PurchaseSubclass:InvokeServer("Shipwright")
                end
            else
                vu943.EquipSubclass:InvokeServer("Shipwright")
            end
        end
    end, vu893 == 3)
    v884("RaceV2", function()
        if vu15.Race.Value == "Draco" or not vu898["Warrior Helmet"] or vu15.Race:FindFirstChild("Evolved") then
            return nil
        end
        local v1110 = vu82:GetProgress("RaceV2", "Alchemist", "1")
        if v1110 == 0 or v1110 == 2 then
            if v1110 ~= 2 or vu20.Value >= 500000 then
                if vu14:DistanceFromCharacter(vu932.Position) >= 5 then
                    vu83(vu932)
                else
                    vu897("Alchemist", v1110 == 0 and "2" or "3")
                end
                return true
            end
        elseif v1110 == 1 then
            for v1111 = 1, 2 do
                local v1112 = workspace:FindFirstChild("Flower" .. v1111)
                if v1112 then
                    if v1112.Transparency ~= 1 then
                        if not VerifyTool("Flower " .. v1111) then
                            return "Collecting Flower: " .. v1111, vu83(v1112.CFrame)
                        end
                    end
                end
            end
            if not VerifyTool("Flower 3") then
                local v1113 = vu902("Swan Pirate")
                if v1113 and v1113.PrimaryPart then
                    vu906(v1113)
                else
                    vu891:NPCs(vu953["Swan Pirate"])
                end
                return "Getting Flower: 3"
            end
        end
    end, vu893 == 2)
    v884("RaceV3", function()
        local v1114 = vu15.Race.Value
        if v1114 == "Draco" or (not vu15.Race:FindFirstChild("Evolved") or vu951.RaceV3 and vu951.RaceV3[v1114]) then
            return nil
        end
        local v1115 = vu82:GetProgress("RaceV3", "Wenlocktoad", "1")
        if v1115 == - 2 then
            if vu951.RaceV3 then
                vu951.RaceV3[v1114] = true
            else
                vu951.RaceV3 = {
                    [v1114] = true
                }
            end
            return nil
        end
        if v1115 == 0 or v1115 == 2 then
            if v1115 ~= 2 or vu20.Value >= 2000000 then
                if vu14:DistanceFromCharacter(vu933.Position) >= 5 then
                    vu83(vu933)
                else
                    vu897("Wenlocktoad", v1115 == 0 and "2" or "3")
                end
                return true
            end
        elseif v1115 == 1 then
            if v1114 == "Fishman" then
                return vu876.Sea(vu958.Shark)
            end
            if v1114 == "Human" then
                local v1116, v1117, v1118 = ipairs(vu958.Human)
                while true do
                    local v1119
                    v1118, v1119 = v1116(v1117, v1118)
                    if v1118 == nil then
                        break
                    end
                    if vu901(v1119) then
                        return vu983(vu82.Bosses[v1119], v1119)
                    end
                end
            elseif v1114 == "Mink" then
                local _ = vu876.ChestTween
            end
        end
    end, vu893 == 2)
    v884("Sea", function(p1120)
        local v1121 = vu890:GetPlayerBoat()
        if not v1121 then
            vu890:BuyNewBoat()
            return true
        end
        local v1122 = p1120 or vu38.seaEnemy
        if not v1122 then
            return nil
        end
        local v1123 = v1122.PirateBrigade and vu890:GetSeaEvent("PirateBrigade")
        if v1123 then
            vu890:attackSeaEvent(v1123)
            return true
        end
        local v1124 = v1122["Sea Beast"] and vu890:GetSeaBeast()
        if v1124 then
            vu890:attackSeaBeast(v1124)
            return true
        end
        if vu890:RepairBoat(v1121) then
            return true
        end
        if v1121 then
            vu890:RandomTeleport()
            return true
        end
    end, vu893 == 2)
    v884("Sea", function(p1125, p1126)
        local v1127 = vu890:GetPlayerBoat()
        if not v1127 then
            vu890:BuyNewBoat()
            return true
        end
        local v1128 = p1126 or vu38.boatSelected
        local v1129 = p1125 or vu38.fishSelected
        local v1130 = v1129["Sea Beast"] and vu890:GetSeaBeast()
        if v1130 then
            vu890:attackSeaBeast(v1130)
            return true
        end
        local v1131, v1132, v1133 = pairs(v1129)
        while true do
            local v1134
            v1133, v1134 = v1131(v1132, v1133)
            if v1133 == nil then
                break
            end
            if v1134 and v1133 ~= "Sea Beast" then
                local v1135 = vu890:GetSeaEvent(v1133)
                if v1135 then
                    vu890:attackSeaEvent(v1135)
                    return true
                end
            end
        end
        local v1136, v1137, v1138 = pairs(v1128)
        while true do
            local v1139
            v1138, v1139 = v1136(v1137, v1138)
            if v1138 == nil then
                break
            end
            if v1139 then
                local v1140 = vu890:GetSeaEvent(v1138)
                if v1140 then
                    vu890:attackSeaEvent(v1140)
                    return true
                end
            end
        end
        if vu890:RepairBoat(v1127) then
            return true
        end
        if vu38.aTweenBoat and v1127 then
            vu890:RandomTeleport()
            return true
        end
    end, vu893 == 3)
    v884("Rengoku", function()
        if vu898.Rengoku or vu45.Level and vu19.Value < 1350 then
            return nil
        end
        if VerifyTool("Library Key") then
            return vu897("OpenLibrary")
        end
        if VerifyTool("Hidden Key") then
            return vu897("OpenRengoku")
        end
        if vu901("Awakened Ice Admiral") then
            return vu983(vu82.Bosses["Awakened Ice Admiral"], "Awakened Ice Admiral")
        end
        if vu19.Value >= 1425 or not vu45.Level then
            local v1141 = vu902("Arctic Warrior", "Snow Lurker")
            if v1141 and v1141.PrimaryPart then
                vu906(v1141)
                return true
            end
        end
    end, vu893 == 2)
    v884("Bartilo", function()
        if vu19.Value < 850 or vu898["Warrior Helmet"] then
            return nil
        end
        local v1142 = vu82:GetProgress("Bartilo", "BartiloQuestProgress")
        if v1142.KilledSpring then
            vu897("BartiloQuestProgress", "DidPlates")
        elseif v1142.KilledBandits then
            if vu901("Jeremy") then
                local v1143 = vu902("Jeremy")
                if v1143 and v1143.PrimaryPart then
                    vu906(v1143)
                else
                    vu83(CFrame.new(2316, 449, 787))
                end
                return true
            end
        elseif not v1142.KilledBandits then
            local v1144 = vu886:VerifyQuest("Swan Pirate")
            if v1144 then
                v1144 = vu886:VerifyQuest("50")
            end
            if v1144 then
                local v1145 = vu902("Swan Pirate")
                if v1145 and v1145.PrimaryPart then
                    vu906(v1145)
                else
                    vu891:NPCs(vu953["Swan Pirate"])
                end
            else
                vu886:StartQuest("BartiloQuest", 1, vu930)
            end
            return true
        end
    end, vu893 == 2)
    v884("Yama", function()
        if vu898.Yama then
            return nil
        end
        if vu82:GetProgress("EliteProgress", "EliteHunter", "Progress") >= 30 then
            if vu14:DistanceFromCharacter(vu926.Position) >= 5 then
                vu83(vu926)
            else
                pcall(vu977)
                task.wait(1)
            end
            return true
        end
    end, vu893 == 3)
    v884("Citizen", function()
        if vu19.Value < 1800 or vu898["Musketeer Hat"] then
            return nil
        end
        local v1146 = vu82:GetProgress("Citizen", "CitizenQuestProgress")
        if v1146.FoundTreasure then
            return nil
        end
        if v1146.KilledBoss then
            vu83(vu934)
            return true
        end
        if not v1146.KilledBandits then
            local v1147 = vu886:VerifyQuest("Forest Pirate")
            if v1147 then
                v1147 = vu886:VerifyQuest("50")
            end
            if not v1147 then
                if vu14:DistanceFromCharacter(vu936.Position) < 5 then
                    vu83(vu936)
                else
                    vu897("CitizenQuest", 1)
                end
                return true
            end
            local v1148 = vu902("Forest Pirate")
            if v1148 and v1148.PrimaryPart then
                vu906(v1148, true)
            else
                vu891:NPCs(vu953["Forest Pirate"])
            end
            return true
        end
        if vu901("Captain Elephant") then
            if not vu886:VerifyQuest("Captain Elephant") then
                if vu14:DistanceFromCharacter(vu936.Position) < 5 then
                    vu83(vu936)
                else
                    vu897("CitizenQuestProgress", "Citizen")
                end
                return true
            end
            local v1149 = vu902("Captain Elephant")
            if v1149 and v1149.PrimaryPart then
                vu906(v1149)
            else
                vu83(vu935)
            end
            return true
        end
    end, vu893 == 3)
    v884("RainbowHaki", function()
        local v1150 = vu886:VerifyQuest(vu955)
        if v1150 then
            if vu901(v1150) then
                return vu983(vu82.Bosses[v1150], v1150, true)
            end
        else
            vu897("HornedMan", "Bet")
        end
    end, vu893 == 3)
    v884("EliteHunter", function()
        local v1151 = vu886:VerifyQuest(vu904)
        if (vu45.DoughKing or (vu45.CakePrince or vu45.RipIndra)) and (vu901("rip_indra True Form") or (vu901("Dough King") or (vu901("Cake Prince") or (VerifyTool("God\'s Chalice") or VerifyTool("Sweet Chalice"))))) then
            return nil
        end
        if v1151 then
            local v1152 = vu902(v1151)
            if v1152 and v1152.PrimaryPart then
                return "Killing Elite Hunter: " .. v1151, vu906(v1152)
            end
        else
            local v1153 = vu82.Enemies:GetEnemyByTag("Elite")
            if v1153 then
                vu83(vu922)
                vu891:talkNpc(vu922, "EliteHunter")
                return "Getting Elite Quest: " .. v1153.Name
            end
        end
    end, vu893 == 3)
    v884("AuraColor", function()
        local v1154 = vu38.CraftAura
        if v1154 and not vu898[v1154] then
            local v1155 = vu886:GetAuraCraft(v1154)
            if not type(v1155) ~= "table" then
                return nil
            end
            local v1156, v1157, v1158 = ipairs(v1155)
            local v1159 = {}
            while true do
                local v1160
                v1158, v1160 = v1156(v1157, v1158)
                if v1158 == nil then
                    break
                end
                if vu899[v1160.Name] < v1160.Amount then
                    table.insert(v1159, v1160.Name)
                end
            end
            if # v1159 <= 0 then
                local v1161 = vu887:GetNpcPosition("Barista")
                if vu14:DistanceFromCharacter(v1161.Position) >= 3 then
                    vu83(v1161)
                else
                    vu940:InvokeServer({
                        StorageName = v1154,
                        Type = "AuraSkin",
                        Context = "Craft"
                    })
                end
                return true
            end
            if vu45.BerryBush then
                v1159 = nil
            end
            if vu876.BerryBush(v1159, vu38.CraftHop) then
                return true
            end
            task.wait(0.3)
        end
    end, vu893 ~= 1)
    v884("BerryBush", function(p1162, p1163)
        local v1164 = vu82.Berry(p1162)
        if v1164 and v1164.Parent then
            local v1165, v1166, v1167 = pairs(v1164:GetAttributes())
            local v1168, v1169 = v1165(v1166, v1167)
            if v1168 ~= nil then
                local v1170 = v1164.Parent
                local v1171 = v1170:GetPivot() * v1170:GetAttribute(v1168)
                if vu14:DistanceFromCharacter(v1171.Position) >= 3 then
                    vu83(v1171)
                else
                    vu942:InvokeServer(v1170.Name, v1168)
                end
                return "Collecting Berry: " .. v1169
            end
        elseif p1163 or p1163 == nil and vu38.BerryHop then
            vu82:ServerHop()
        end
    end)
    v884("ThirdSea", function()
        if vu19.Value < 1500 or vu19.Value >= 1850 then
            return nil
        else
            local v1172 = vu82:GetProgress("Zou1", "ZQuestProgress")
            if vu951.Zou2 or vu82:GetProgress("Zou2", "ZQuestProgress", "Check") then
                if not vu951.Zou2 then
                    vu951.Zou2 = true
                end
                if vu14:DistanceFromCharacter(vu929.Position) < 1200 then
                    local v1173 = vu25:FindFirstChild("rip_indra")
                    if v1173 and (v1173.PrimaryPart and v1173.PrimaryPart.Position.Y > 0) then
                        vu906(v1173)
                    end
                    return true
                end
                if v1172.KilledIndraBoss then
                    return vu82:TravelTo(3)
                end
                if vu14:DistanceFromCharacter(vu911.Position) < 5 then
                    vu897("ZQuestProgress", "Begin")
                    vu32.OnFarm = false
                    repeat
                        task.wait()
                    until vu14:DistanceFromCharacter(vu929.Position) < 1200 or not vu45[vu38.RunningOption]
                    return true
                end
                vu83(vu911)
                return
            elseif vu82:GetProgress("Unlockables", "GetUnlockables").FlamingoAccess then
                return vu876.DonSwan()
            else
                return nil
            end
        end
    end, vu893 == 2)
    v884("DonSwan", function()
        if not vu898["Warrior Helmet"] then
            return nil
        end
        if vu901("Don Swan") then
            local v1174 = vu902("Don Swan")
            if v1174 and v1174.PrimaryPart then
                vu906(v1174)
            else
                vu83(vu931)
            end
            return true
        end
    end, vu893 == 2)
    v884("SecondSea", function()
        if vu19.Value < 700 then
            return nil
        end
        local v1175 = vu82:GetProgress("Dressrosa", "DressrosaQuestProgress")
        if v1175.KilledIceBoss then
            return vu82:TravelTo(2)
        end
        if v1175.TalkedDetective then
            if v1175.UsedKey then
                if not v1175.KilledIceBoss then
                    local v1176 = vu902("Ice Admiral")
                    if v1176 and v1176.PrimaryPart then
                        vu906(v1176)
                    else
                        vu83(vu917)
                    end
                end
            else
                if not VerifyTool("Key") then
                    vu897("DressrosaQuestProgress", "Detective")
                end
                vu896("Key")
                vu897("DressrosaQuestProgress", "UseKey")
            end
        else
            vu897("DressrosaQuestProgress", "Detective")
        end
        return true
    end, vu893 == 1)
    v884("Order", function()
        local v1177 = vu25:FindFirstChild("Order")
        if v1177 and v1177.PrimaryPart then
            vu906(v1177)
            return true
        end
        if VerifyTool("Microchip") then
            return fireclickdetector(vu21.CircleIsland.RaidSummon.Button.Main.ClickDetector)
        end
        local _ = vu38.FullyLawRaid
    end, vu893 == 2)
    v884("Saber", function()
        if vu19.Value < 200 or vu898.Saber then
            return nil
        end
        local v1178 = vu82:GetProgress("Shanks", "ProQuestProgress")
        if v1178.UsedRelic then
            if vu82.Enemies.IsSpawned("Saber Expert") then
                local v1179 = vu902("Saber Expert")
                if v1179 and v1179.PrimaryPart then
                    vu906(v1179)
                else
                    vu83(vu924)
                end
                return true
            end
        else
            if v1178.KilledMob then
                if VerifyTool("Relic") then
                    vu897("ProQuestProgress", "PlaceRelic")
                else
                    vu897("ProQuestProgress", "RichSon")
                end
                return true
            end
            if not v1178.UsedCup then
                if v1178.UsedTorch then
                    if VerifyTool("Cup") then
                        vu897("ProQuestProgress", "FillCup", vu14.Character and vu14.Character:FindFirstChild("Cup") or vu14.Backpack:FindFirstChild("Cup"))
                    else
                        vu897("ProQuestProgress", "GetCup")
                    end
                    vu897("ProQuestProgress", "SickMan")
                    return true
                end
                local v1180 = next
                local v1181 = v1178.Plates
                local v1182 = nil
                while true do
                    local v1183
                    v1182, v1183 = v1180(v1181, v1182)
                    if v1182 == nil then
                        break
                    end
                    if not v1183 then
                        vu897("ProQuestProgress", "Plate", v1182)
                        return true
                    end
                end
                if VerifyTool("Torch") then
                    vu897("ProQuestProgress", "DestroyTorch")
                else
                    vu897("ProQuestProgress", "GetTorch")
                end
                return true
            end
            if not v1178.TalkedSon then
                return vu897("ProQuestProgress", "RichSon")
            end
            if vu82.Enemies.IsSpawned("Mob Leader") then
                local v1184 = vu902("Mob Leader")
                if v1184 and v1184.PrimaryPart then
                    vu906(v1184)
                else
                    vu83(CFrame.new(- 2880, 9, 5430))
                end
                return true
            end
        end
    end, vu893 == 1)
    v884("PoleV1", function()
        if vu19.Value < 450 or vu898["Pole (1st Form)"] then
            return nil
        end
        if vu82.Enemies.IsSpawned("Thunder God") then
            local v1185 = vu902("Thunder God")
            if v1185 and v1185.PrimaryPart then
                vu906(v1185)
            else
                vu83(vu927)
            end
            return true
        end
    end, vu893 == 1)
    v884("TheSaw", function()
        if vu19.Value < 100 or vu898["Shark Saw"] then
            return nil
        end
        if vu82.Enemies.IsSpawned("The Saw") then
            local v1186 = vu902("The Saw")
            if v1186 and v1186.PrimaryPart then
                vu906(v1186)
            else
                vu83(vu928)
            end
            return true
        end
    end, vu893 == 1)
    v884("SoulReaper", function()
        local v1187 = vu902("Soul Reaper")
        if v1187 and v1187.PrimaryPart then
            vu906(v1187)
            return true
        end
        if VerifyTool("Hallow Essence") then
            vu896("Hallow Essence")
            vu83(vu916)
            return true
        end
    end, vu893 == 3)
    v884("RipIndra", function()
        if vu901("rip_indra True Form") then
            local v1188 = vu902("rip_indra True Form")
            if v1188 and v1188.PrimaryPart then
                vu906(v1188)
            else
                vu83(vu914)
            end
            return "Killing: rip_indra True Form"
        end
        if VerifyTool("God\'s Chalice") then
            if vu976() < 3 then
                vu83(vu914)
            else
                vu83(vu915)
            end
            return "God\'s Chalice: rip_indra True Form"
        end
    end, vu893 == 3)
    v884("BossSelected", function()
        local v1189 = vu38.BossSelected
        local v1190
        if v1189 then
            v1190 = vu901(v1189)
        else
            v1190 = v1189
        end
        if v1190 then
            local _ = vu82.Bosses[v1189]
        end
    end)
    v884("AllBosses", function()
        local v1191 = vu965()
        if v1191 then
            local _ = vu82.Bosses[v1191]
        end
    end)
    v884("DoughKing", function()
        local v1192 = vu902("Dough King") or vu902("Cake Prince")
        if VerifyTool("Red Key") then
            vu897("CakeScientist", "Check")
            return true
        else
            if v1192 and v1192.PrimaryPart then
                vu906(v1192)
            else
                if not VerifyTool("Sweet Chalice") and VerifyTool("God\'s Chalice") then
                    if vu899["Conjured Cocoa"] < 10 then
                        return vu887:Material("Conjured Cocoa")
                    end
                    vu83(vu919)
                    vu891:talkNpc(vu919, "SweetChaliceNpc")
                    return true
                end
                local v1193 = vu82.Enemies:GetClosestByTag("CakePrince")
                if v1193 and v1193.PrimaryPart then
                    vu906(v1193, true, true)
                else
                    vu83(vu918)
                end
            end
            return true
        end
    end, vu893 == 3)
    v884("CakePrince", function()
        if vu45.DoughKing then
            return nil
        end
        local v1194 = vu902("Dough King") or vu902("Cake Prince")
        if v1194 and v1194.PrimaryPart then
            vu906(v1194)
        else
            local v1195 = vu82.Enemies:GetClosestByTag("CakePrince")
            if v1195 and v1195.PrimaryPart then
                vu906(v1195, true, true)
            else
                vu83(vu918)
            end
        end
        return true
    end, vu893 == 3)
    v884("ChestTween", function(p1196, p1197)
        local v1198 = vu82.Chests()
        if v1198 then
            local v1199 = v1198:GetPivot(p1197)
            if vu14:DistanceFromCharacter(v1199.Position) >= 3 then
                vu83(v1199)
            else
                vu83(v1199 + vu908)
                task.wait(0.15)
            end
            return "Collecting Chest" .. (p1196 or "")
        end
    end)
    v884("Ectoplasm", function()
        local v1200 = vu902(vu905)
        if v1200 and v1200.PrimaryPart then
            return "Killing: " .. v1200.Name, vu906(v1200, true, true)
        else
            return "Waiting for: Enemy Spawn", vu83(vu913)
        end
    end, vu893 == 2)
    v884("Bones", function()
        if vu45.Level and vu19.Value < vu892 then
            return nil
        else
            local v1201 = vu82.Enemies:GetClosestByTag("Bones")
            if v1201 and v1201.PrimaryPart then
                return "Killing: " .. v1201.Name, vu906(v1201, true, true)
            else
                return "Waiting for: Enemy Spawn", vu83(vu923)
            end
        end
    end, vu893 == 3)
    v884("Level", function()
        local v1202 = vu886:GetQuest()
        if not v1202 then
            return nil
        end
        local v1203 = v1202.Enemy.Name
        local v1204 = v1202.Enemy.Position
        local v1205 = vu886:VerifyQuest(v1203)
        if v1205 and vu82.IsBoss(v1205) then
            return vu983(vu82.Bosses[v1205], v1205, false)
        end
        if not v1205 then
            local v1206 = vu886
            return vu886:StartQuest(v1202.Name, v1202.Count, v1206:GetQuestPosition(v1202.Name))
        end
        local v1207 = vu902(v1205)
        if v1207 and v1207.PrimaryPart then
            return "Killing: " .. v1207.Name, vu906(v1207, true)
        end
        local v1208 = vu886:GetQuestPosition(v1202.Name)
        if # v1204 <= 0 then
            if v1208 then
                vu83(v1208 * vu886._Position)
            end
        else
            vu891:NPCs(v1204)
        end
        return "Waiting for: " .. v1205
    end)
    v884("Mastery", function()
        if vu893 ~= 3 or vu892 > vu19.Value then
            return vu876.Level()
        else
            return vu876.Bones()
        end
    end)
    v884("Material", function()
        if vu38.fMaterial then
            local _ = vu887.Material
            local _ = vu38.fMaterial
        end
    end)
    v884("Nearest", function()
        local v1209 = vu947
        if v1209 then
            v1209 = vu947.PrimaryPart
        end
        if v1209 and vu894(vu947) and vu14:DistanceFromCharacter(v1209.Position) < 1500 then
            return "Killing: " .. vu947.Name, vu906(vu947, true, true)
        end
        local v1210 = vu25
        local v1211, v1212, v1213 = ipairs(v1210:GetChildren())
        local v1214 = 1500
        local v1215 = nil
        while true do
            local v1216
            v1213, v1216 = v1211(v1212, v1213)
            if v1213 == nil then
                break
            end
            local v1217 = v1216.PrimaryPart
            if vu894(v1216) and v1217 then
                local v1218 = vu14:DistanceFromCharacter(v1217.Position)
                if v1218 < v1214 then
                    v1215 = v1216
                    v1214 = v1218
                end
            end
        end
        if v1215 then
            vu947 = v1215
            vu906(v1215, true, true)
            return true
        end
        task.wait(0.4)
    end)
    local vu1219
    if type(vu1.CustomFunctions) ~= "function" then
        vu1219 = vu897
    else
        local v1220 = vu1.CustomFunctions({
            Managers = p875.Managers,
            Module = vu82,
            ScriptFunctions = vu876,
            Functions = {
                GetNextBoss = vu965,
                AttackSegment = vu1031,
                GetVolcanoRock = vu1028,
                KillBossByInfo = vu983,
                GetCursedDualKatanaTask = vu1018,
                GetEmberTemplate = vu991,
                BreakTree = vu1002
            }
        })
        local v1221, v1222, v1223 = pairs(v1220)
        vu1219 = vu897
        while true do
            local v1224
            v1223, v1224 = v1221(v1222, v1223)
            if v1223 == nil then
                break
            end
            v884(v1223, v1224)
        end
    end
    if vu893 == 3 then
        local vu1225 = "Do you want to open the portal now?"
        local vu1226 = 0
        local vu1227 = {
            ["Obtained <Color=Purple><Mutant Tooth><Color=/> (1x)"] = function()
                vu889:BeltProgress("Red", 1)
            end,
            ["<Color=Yellow><QUEST COMPLETED!><Color=/>"] = function()
                vu889:BeltProgress("White", 8)
            end,
            ["Head back to the Dojo to complete more tasks."] = function()
                vu946 = nil
            end,
            ["Dojo quest abandoned!"] = function()
                vu946 = nil
            end
        }
        table.insert(vu76, vu82.Signals.Notify:Connect(function(p1228)
            local v1229 = vu1227[p1228]
            if v1229 then
                return v1229()
            end
            if p1228:find("Earned <Color=Green>%$%d+<Color=/>") then
                if vu14:GetAttribute("DangerLevel") < 100 then
                    if vu45.DoughKing and VerifyTool("Sweet Chalice") or vu45.CakePrince then
                        vu1226 = tick() + 9000000000
                        local v1230 = vu1219("CakePrinceSpawner", true) or "Error"
                        if tick() - vu1226 >= 0.25 and string.find(v1230, vu1225) then
                            vu1219("CakePrinceSpawner")
                        end
                        vu1226 = tick()
                    end
                else
                    vu889:BeltProgress("Yellow", 1)
                end
            end
        end))
    end
end
function vu102.Webhooks(_)
    if not vu82.IsCustomUrl and vu82.Webhooks then
        local v1231 = {
            vu82
        }
        __loadstring("{Repository}Utils/Webhooks.lua", false, v1231)
    end
end
local function v1234(p1232, ...)
    local v1233 = tick()
    vu102[p1232](vu102, ...)
    print(p1232, tick() - v1233)
end
v1234("Initialize")
v1234("StartFarm")
v1234("StartFunctions")
task.spawn(v1234, "LoadLibrary")
task.spawn(v1234, "Webhooks")