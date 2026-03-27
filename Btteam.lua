--[[
    BLOX FRUIT FREE
]]

local Players = game:GetService("Players")
local Player = game:GetService('Players').LocalPlayer;
local Enemies = workspace:WaitForChild("Enemies");
local WorldOrigin = workspace:WaitForChild("_WorldOrigin");
local Locations = WorldOrigin:WaitForChild("Locations");

local Premium = "premium-ui.lua"
local Free = "free-ui.lua"
local Path = "https://files.btteam.net/files/library/"

local Library = loadstring(game:HttpGet(Path..Free))()
local SaveManager = loadstring(game:HttpGet(Path.."addons/savemanager.lua"))()
local Main_Module = loadstring(game:HttpGet("https://files.btteam.net/files/games/bf/modules/Front-modules.lua"))()
local QuestModules = loadstring(game:HttpGet("https://files.btteam.net/files/games/bf/modules/Quest-modules.lua"))()
local OtherModules = loadstring(game:HttpGet("https://files.btteam.net/files/games/bf/modules/Others-modules.lua"))()

local Backgrounds = {
    Default = "http://www.roblox.com/asset/?id=92249981219647",
}

local IconLib = game:HttpGet(Path..'addons/icon.json')
local Icon = game.HttpService:JSONDecode(IconLib)

local MainWindows = Library:CreateWindow("0.0.1", Backgrounds.Default)

local Tabs = {
    Game_Setting = MainWindows:AddTab("Game Setting", Icon.Config),
    Main_Farm = MainWindows:AddTab("Main Farm", Icon.Farm),
    Subs_Farm = MainWindows:AddTab("Subs Farm", Icon['Subs Farm']),
    Main_Quest = MainWindows:AddTab("Main Quest", Icon.Quest),
    Subs_Quest = MainWindows:AddTab("Subs Quest", Icon['Subs Quest']),
    Sea_Event = MainWindows:AddTab('Sea Event', Icon.Sea),
    Main_Island = MainWindows:AddTab('Island', Icon.Island),
    Main_Race = MainWindows:AddTab('Race', Icon.Basic),
    Main_Raid = MainWindows:AddTab('Raid', Icon.Raid),
    Main_Bounty = MainWindows:AddTab('Bounty', Icon.Bounty),
    Main_Teleport = MainWindows:AddTab('Location', Icon.Location),
    Main_Stat = MainWindows:AddTab('Stats', Icon.Stat),
    Main_Shop = MainWindows:AddTab('Shop', Icon.Shop),
    Misc = MainWindows:AddTab('Misc', Icon.Misc),
    SaveManagerTab = MainWindows:AddTab("Save and UI", Icon.Save),

}
----------------------------------------------------//----------------------------------------------------
-- GAME SETTING TABS
local GameSettings = {
    Left = Tabs.Game_Setting:AddSection(),
    Right = Tabs.Game_Setting:AddSection()
}

--// Main Setting
local MainSetting = GameSettings.Left:AddGroup("Main Setting's")

local Weapon_List = {
    "Melee", "Sword", "Gun", "Blox Fruit" 
}

MainSetting:AddDropdown('Weapon_Selected', {
    Text = 'Select Weapon',
    Tooltip = 'If you want farm with "DevilFruits or Gun" choose weapon to "Melee or Sword" only.',
    List = Weapon_List,
    Default = Selected_Weapon,
    Callback = function(Value)
        Selected_Weapon = Value
    end
})
Options.Weapon_Selected:SetValue("Melee")

local Mode_List = {
    "Above", "Behind"
} 
MainSetting:AddDropdown('Mode_Farm_Setting', {
    Text = 'Select Mode',
    Tooltip = 'Mode character for farm',
    List = Mode_List,
    Default = Selected_Mode_Farm,
    Callback = function(Value)
        Selected_Mode_Farm = Value
    end
})
Options.Mode_Farm_Setting:SetValue("Above")

spawn(function()
    while task.wait() do
        if Selected_Mode_Farm == "Above" then
            Farm_Mode = CFrame.new(0,Distance_Func,0) -- * CFrame.Angles(math.rad(-90),0,0)

        elseif Selected_Mode_Farm == "Behind" then
            Farm_Mode = CFrame.new(0,1,Distance_Func) -- * CFrame.Angles(math.rad(0),0,0)

        end
    end
end)

MainSetting:AddInput('Distance_Farm_Setting', {
    Text = 'Set Distance',
    Tooltip = 'Set the distance farming.',
    Default = Distance_Func,
    Numeric = true,
    Finished = false,
    Callback = function(Value)
        Distance_Func = Value
    end
})
Options.Distance_Farm_Setting:SetValue(20)

MainSetting:AddInput('Tween_Speed_Setting', {
    Text = 'Set Tween Speed',
    Tooltip = 'Set the speed of tween.',
    Default = TweenSpeed_Func,
    Numeric = true,
    Finished = false,
    Callback = function(Value)
        TweenSpeed_Func = Value
    end
})
Options.Tween_Speed_Setting:SetValue(250)

--// Fast Attack
local Fast_Attack_Setting = GameSettings.Left:AddGroup("Fast Attack Setting's")

Fast_Attack_Setting:AddCheckbox('Main_Fast_Attack_Setting', {
    Text = "Fast Attack",
    Default = AutoAttacks,
    Callback = function(Value)
        AutoAttacks = Value
    end
})
Checkboxs.Main_Fast_Attack_Setting:SetValue(true)

spawn(function()
    while task.wait() do
        if AutoAttacks then
            AutoShoot = true
        else
            AutoShoot = false
        end
    end
end)

--// Bring Monster
local Bring_Monster_Setting = GameSettings.Left:AddGroup("Bring Enemy Setting's")

Bring_Monster_Setting:AddInput('Bring_Distance_Setting', {
    Text = 'Set Distance Bring',
    Tooltip = 'Set the distance for bring monster.',
    Default = BringDistance,
    Numeric = true,
    Finished = true,
    Callback = function(Value)
        BringDistance = Value
    end
})
Options.Bring_Distance_Setting:SetValue(250)

Bring_Monster_Setting:AddCheckbox('Bring_Value_Setting', {
    Text = "Bring Monster",
    Default = BringMobs,
    Callback = function(Value)
        BringMobs = Value
    end
})
Checkboxs.Bring_Value_Setting:SetValue(true)

SmoothMode = true
----------------------------------------------------//----------------------------------------------------
-- Righ Setting
local Other_Setting = GameSettings.Right:AddGroup("Other Setting's")

Other_Setting:AddCheckbox('AutoClick_Setting', {
    Text = 'Auto Click',
    Default = Auto_Click_Func,
    Callback = function(Value)
        Auto_Click_Func = Value
    end
})
task.spawn(function()
    while wait() do
        if Auto_Click_Func then
            Main_Module.Click(0.3)
        end
    end
end)

Other_Setting:AddCheckbox('Ken_Hakki_Setting', {
    Text = 'Ken Haki',
    Default = Ken_Haki_Func,
    Callback = function(Value)
        Ken_Haki_Func = Value
    end
})
task.spawn(function()
    while wait() do
        if Ken_Haki_Func then
            if not game.Players.LocalPlayer.Character:FindFirstChild("Highlight") then
                game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                wait(.1)
                game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)
            end
        end
    end
end)

Other_Setting:AddCheckbox('Buso_Hakki_Setting', {
    Text = 'Buso Haki',
    Default = Buso_Haki_Func,
    Callback = function(Value)
        Buso_Haki_Func = Value
    end
})
Checkboxs.Buso_Hakki_Setting:SetValue(true)
task.spawn(function()
    while wait() do
        if Buso_Haki_Func then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end
end)

Other_Setting:AddCheckbox('Spawn_point_Setting', {
    Text = 'Spawn Point',
    Default = Spawn_Point_Func,
    Callback = function(Value)
        Spawn_Point_Func = Value
    end
})
task.spawn(function()
    while wait() do
        if Spawn_Point_Func then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        end
    end
end)

Other_Setting:AddButton({
    Text = 'Reset Character',
    Callback = function()
        game.Players.LocalPlayer.Character.Head:Destroy()
    end
})

--// Effect and Audio Setting
local Effect_Settings = GameSettings.Right:AddGroup("Audio and Effect Setting's")

Effect_Settings:AddCheckbox('Hide_EffectAudio_Setting', {
    Text = 'Disable Damage and Audio Effect',
    Default = AudioDamage_Func,
    Callback = function(Value)
        AudioDamage_Func = Value
    end
})
spawn(function()
    while task.wait() do
        if AudioDamage_Func then
            for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
                if v.Name == "Sounds" then
                    for i2,v2 in pairs(v:GetChildren()) do
                        if v2:IsA("Part") then
                            v2:Destroy()
                        end
                    end
                end
                if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == 'SlashTail' or v.Name == 'DamageCounter' then
                    v:Destroy()
                end
            end
            game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Size = UDim2.new(0,0,0,0)
        else
            game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Size = UDim2.new(11,0,4,0)
        end
    end
end)

Effect_Settings:AddCheckbox('Hide_Notif_Setting', {
    Text = 'Disable Notification',
    Default = Hide_Notification_Func,
    Callback = function(Value)
        Hide_Notification_Func = Value
    end
})
task.spawn(function()
    while wait() do
        if Hide_Notification_Func then
            for _,v in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                v:Destroy()
            end
        end
    end
end)

Effect_Settings:AddButton({
    Text = 'Destroy All Effect',
    Callback = function()
        for i,v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
            if v:IsA('ParticleEmitter') then
                v:Destroy()
            end
        end
        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA('ParticleEmitter') then
                v:Destroy()
            end
        end
    end
})

----------------------------------------------------//----------------------------------------------------
-- MAIN FARM
local MainFarms = {
    Left = Tabs.Main_Farm:AddSection(),
    Right = Tabs.Main_Farm:AddSection()
}

--// Level Farm
local Level_Farm = MainFarms.Left:AddGroup("Auto Level Farming")

Level_Farm:AddCheckbox('Level_Quest_Farming', {
    Text = 'Auto Farm (Quest)',
    Default = Level_Quest_Func,
    Callback = function(Value)
        Level_Quest_Func = Value
        Main_Module.StopTween(Level_Quest_Func)
    end
})

Level_Farm:AddCheckbox('Level_No_Quest_Farming', {
    Text = 'Auto Farm (No Quest)',
    Default = Level_No_Quest_Func,
    Callback = function(Value)
        Level_No_Quest_Func = Value
        Main_Module.StopTween(Level_No_Quest_Func)
    end
})

Level_Farm:AddCheckbox('Nearest_Farming', {
    Text = 'Auto Farm (Nearest)',
    Default = Nearest_Farm_Func,
    Callback = function(Value)
        Nearest_Farm_Func = Value
        Main_Module.StopTween(Nearest_Farm_Func)
    end
})

Level_Farm:AddCheckbox('Valentine_Farming', {
    Text = 'Auto Farm Hearts',
    Tooltip = 'Will defeat enemy for hearts.',
    Default = Hearts_Farm_Func,
    Callback = function(Value)
        Hearts_Farm_Func = Value
        Main_Module.StopTween(Hearts_Farm_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// SELECT MONSTER FARM
local Level_Farm_Selected = MainFarms.Left:AddGroup("Selected Monster")

Level_Farm_Selected:AddDropdown('Selected_Monster_Farming', {
    Text = 'Select Monster',
    Tooltip = 'Choose monster you want farm.',
    List = Monster_Listed,
    Default = Selected_Monster,
    Callback = function(Value)
        Selected_Monster = Value
    end
})

Level_Farm_Selected:AddCheckbox('Select_Monster_Quest_Farming', {
    Text = 'Auto Farm Selected (Quest)',
    Default = Select_Monster_Quest_Func,
    Callback = function(Value)
        Select_Monster_Quest_Func = Value
        Main_Module.StopTween(Select_Monster_Quest_Func)
    end
})

Level_Farm_Selected:AddCheckbox('Select_Monster_No_Quest_Farming', {
    Text = 'Auto Farm Selected (No Quest)',
    Default = Select_Monster_No_Quest_Func,
    Callback = function(Value)
        Select_Monster_No_Quest_Func = Value
        Main_Module.StopTween(Select_Monster_No_Quest_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// Material Farm
local Materials_Farm = MainFarms.Left:AddGroup("Auto Farming Materials")

Materials_Farm:AddDropdown('Selected_Material_Farming', {
    Text = 'Select Materials',
    Tooltip = 'Choose material you want farm.',
    List = Material_Listed,
    Default = Selected_Material,
    Callback = function(Value)
        Selected_Material = Value
    end
})

Materials_Farm:AddCheckbox('Select_Materials_Farming', {
    Text = 'Auto Farm Materials',
    Default = Select_Materials_Func,
    Callback = function(Value)
        Select_Materials_Func = Value
        Main_Module.StopTween(Select_Materials_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// Mastery Farm
local Mastery_Farm = MainFarms.Right:AddGroup("Auto Farming Mastery")

Mastery_Farm:AddInput('Mastery_Farm_Monster_Health', {
    Text = 'Set min health (%)',
    Tooltip = 'Set the minimum health monster (while change to mastery equip)',
    Default = Mastery_Farm_Monster_Health_Set,
    Numeric = true,
    Finished = true,
    Callback = function(Value)
        Mastery_Farm_Monster_Health_Set = Value
    end
})
Options.Mastery_Farm_Monster_Health:SetValue(20)

Mastery_Type = {"Blox Fruits", "Gun"}
Mastery_Farm:AddDropdown('Selected_Mastery_Type', {
    Text = 'Select mastery',
    List = Mastery_Type,
    Default = Selected_Type_Mastery,
    Callback = function(Value)
        Selected_Type_Mastery = Value
    end
})

Mode_Mastery_Listed = {
    "Quest", "Nearest", "Select Monsters", "Select Boss", "Material"
}
Mastery_Farm:AddDropdown('Selected_Mode_Mastery_Farming', {
    Text = 'Select mode',
    List = Mode_Mastery_Listed,
    Default = Selected_Mode_Mastery,
    Callback = function(Value)
        Selected_Mode_Mastery = Value
        if Selected_Mode_Mastery == "Select Monsters" then

            Options.Selected_MobsBoss_Farming:UpdateValues(Monster_Listed)

        elseif Selected_Mode_Mastery == "Select Boss" then

            Options.Selected_MobsBoss_Farming:UpdateValues(Boss_Listed)

        elseif Selected_Mode_Mastery == "Material" then

            Options.Selected_MobsBoss_Farming:UpdateValues(Material_Listed)

        else

            Options.Selected_MobsBoss_Farming:UpdateValues(MobBoss_Listed)

        end
    end
})

MobBoss_Listed = {}
Mastery_Farm:AddDropdown('Selected_MobsBoss_Farming', {
    Text = 'Select monster/boss',
    Tooltip = 'Choose Monster or Boss you want farm.',
    List = MobBoss_Listed,
    Default = Selected_Monster_Mastery,
    Callback = function(Value)
        Selected_Monster_Mastery = Value
    end
})

Skill_Listed = {
    "Z", "X", "C", "V", "F"
}
Mastery_Farm:AddDropdown('Selected_Skills_Farming', {
    Text = 'Select skill',
    Tooltip = 'Set the skill u want to use.',
    List = Skill_Listed,
    Default = Selected_Skill,
    Multi = true,
    Callback = function(Value)
        Selected_Skill = Value
    end
})

Mastery_Farm:AddCheckbox('Mastery_Farming', {
    Text = 'Enable mastery farm',
    Default = Mastery_Farming_Func,
    Callback = function(Value)
        Mastery_Farming_Func = Value
        Main_Module.StopTween(Mastery_Farming_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// Boss Farm
local Boss_Farm = MainFarms.Right:AddGroup("Auto Farming Boss")

local function getBossList()
    local Boss_List_update = {}

    for boos_index, boss_value in game.ReplicatedStorage:GetChildren() do
        if table.find(Boss_Listed, boss_value.Name) then
            table.insert(Boss_List_update, boss_value.Name)
        end
    end

    return Boss_List_update
end

Boss_Farm:AddDropdown('Selected_Boss_Farming', {
    Text = 'Select Boss',
    Tooltip = 'Choose Boss you want farm.',
    List = getBossList(),
    Default = Selected_Boss,
    Callback = function(Value)
        Selected_Boss = Value
    end
})

Boss_Farm:AddButton({
    Text = "Refresh boss list",
    Tooltip = 'Will refresh the listed of boss',
    Callback = function()
        Options.Selected_Boss_Farming:UpdateValues(getBossList())
    end
})

Boss_Farm:AddCheckbox('Select_Boss_Quest_Farming', {
    Text = 'Auto farm boss (Quest)',
    Default = Select_Boss_Quest_Func,
    Callback = function(Value)
        Select_Boss_Quest_Func = Value
        Main_Module.StopTween(Select_Boss_Quest_Func)
    end
})

Boss_Farm:AddCheckbox('Select_Boss_No_Quest_Farming', {
    Text = 'Auto farm boss (No Quest)',
    Default = Select_Boss_No_Quest_Func,
    Callback = function(Value)
        Select_Boss_No_Quest_Func = Value
        Main_Module.StopTween(Select_Boss_No_Quest_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// SUBS FARM
local Subs_Farm = {
    Left = Tabs.Subs_Farm:AddSection(),
    Right = Tabs.Subs_Farm:AddSection(),
}

--// Elite Hunter
local Elite_Hunter = Subs_Farm.Left:AddGroup('Elite Hunter')

local Elite_Hunter_Prog = Elite_Hunter:AddLabel('')


Elite_Hunter:AddCheckbox('Elite_Hunter_Quest_Farming', {
    Text = 'Auto farm elite hunter',
    Default = Elite_Hunter_Quest_Func,
    Callback = function(Value)
        Elite_Hunter_Quest_Func = Value
        Main_Module.StopTween(Elite_Hunter_Quest_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// Cake Prince
local Cake_Princed = Subs_Farm.Left:AddGroup('Cake Land Boss')

local Cake_Prince_Prog = Cake_Princed:AddLabel('Killed Left : ? / 500')

Cake_Princed:AddCheckbox('Cake_Prince_Quest_Farming', {
    Text = 'Auto spawn cake prince',
    Tooltip = 'Will defeat enemy for spawn cake prince.',
    Default = Cake_Prince_Quest_Func,
    Callback = function(Value)
        Cake_Prince_Quest_Func = Value
        Main_Module.StopTween(Cake_Prince_Quest_Func)
    end
})

Cake_Princed:AddCheckbox('Dough_King_Quest_Farming', {
    Text = 'Auto spawn dough king',
    Tooltip = 'You need to have Sweet Chalice for spawn dough king after killed 500 Npc',
    Default = Dough_King_Quest_Func,
    Callback = function(Value)
        Dough_King_Quest_Func = Value
        Main_Module.StopTween(Dough_King_Quest_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// Castle farming

if game.PlaceId == 4442272183 then

    local Castle_Farm = Subs_Farm.Left:AddGroup('Factory Raid')

    Castle_Farm:AddCheckbox('Factory_Farming', {
        Text = 'Auto factory raid',
        Default = Factory_Farming_Func,
        Callback = function(Value)
            Factory_Farming_Func = Value
            Main_Module.StopTween(Factory_Farming_Func)
        end
    })
    
elseif game.PlaceId == 7449423635 then

    local Castle_Farm = Subs_Farm.Left:AddGroup('Pirate Raid')

    Castle_Farm:AddCheckbox('Pirate_Raid_Farming', {
        Text = 'Auto pirate raid',
        Default = Pirate_Raid_Farming_Func,
        Callback = function(Value)
            Pirate_Raid_Farming_Func = Value
            Main_Module.StopTween(Pirate_Raid_Farming_Func)
        end
    })

end

----------------------------------------------------//----------------------------------------------------
--// Chest farming
local Chest_Farm = Subs_Farm.Right:AddGroup('Chest Farming')

Chest_Farm:AddCheckbox('Chest_Farming', {
    Text = 'Auto farm chest all island',
    Default = Farming_Chest_Func,
    Callback = function(Value)
        Farming_Chest_Func = Value
        Main_Module.StopTween(Farming_Chest_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// Berries farming
local BerriesFarm = Subs_Farm.Right:AddGroup('Berries Farming')

BerriesFarm:AddCheckbox('Berries_ESP', {
    Text = 'Berry ESP',
    Default = Berries_ESP_Func,
    Callback = function(Value)
        Berries_ESP_Func = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            OtherModules.BerriesESP()
        end)
    end
end)

BerriesFarm:AddCheckbox('Berries_Farming', {
    Text = 'Auto Collect Berries',
    Default = Berries_Farming_Func,
    Callback = function(Value)
        Berries_Farming_Func = Value
        Main_Module.StopTween(Berries_Farming_Func)
    end
})

spawn(function()
    while task.wait() do
        if Berries_Farming_Func then
            OtherModules.CollectBerries()
        end
    end
end)

BerriesFarm:AddButton({
    Text = 'Refresh ESP Berries if have stuck',
    Callback = function()
        OtherModules.RefreshBerries()
    end
})

----------------------------------------------------//----------------------------------------------------
--// Observation farming
local ObservationFarm = Subs_Farm.Right:AddGroup('Observation Farming')

local ObservationRange = ObservationFarm:AddLabel("Observation Level : ?")

ObservationFarm:AddCheckbox('Observation_Farming', {
    Text = 'Auto farm observation',
    Default = Farming_Observation_Func,
    Callback = function(Value)
        Farming_Observation_Func = Value
        Main_Module.StopTween(Farming_Observation_Func)
    end
})

ObservationFarm:AddCheckbox('Observation_Get_V2', {
    Text = 'Observation V2',
    Default = Get_Observation_V2_Func,
    Callback = function(Value)
        Get_Observation_V2_Func = Value
        Main_Module.StopTween(Get_Observation_V2_Func)
    end
})

ObservationFarm:AddButton({
    Text = "Hop Server",
    Callback = function()
        Main_Module.HopServer()
    end
})

ObservationFarm:AddButton({
    Text = "Check observation level",
    Callback = function()
        if not game.Players.LocalPlayer.Character:FindFirstChild("Highlight") then
            game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
            wait(.1)
            game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)
        end
        wait(1)
        ObservationRange:UpdateLabel("Observation Level : " .. tostring(game:GetService("Players").LocalPlayer.VisionRadius.Value))
    end
})

----------------------------------------------------//----------------------------------------------------
--// MAIN QUEST
local Main_Quest = {
    Left = Tabs.Main_Quest:AddSection(),
    Right = Tabs.Main_Quest:AddSection(),
}

--// AUTO WORLD
local World_Quest = Main_Quest.Left:AddGroup('World Quest')

World_Quest:AddCheckbox('Second_World_Quest', {
    Text = 'Auto Second World',
    Tooltip = "Need to reach Lv.700 to going to second world.",
    Default = Second_World_Quest_Func,
    Callback = function(Value)
        Second_World_Quest_Func = Value
        Main_Module.StopTween(Second_World_Quest_Func)
    end
})
spawn(function()
    while task.wait() do
        if Second_World_Quest_Func then
            if Player.Data.Level.Value >= Main_Module.MaxLevel then
                OtherModules.AutoSecondWorld()
            else
                Library:SetNotify("Auto Second World", "You need to reach Lv.700 to use this feature.", 3)
                wait(3)
            end
        end
    end
end)

World_Quest:AddCheckbox('Third_World_Quest', {
    Text = 'Auto Third World',
    Tooltip = "Need to reach Lv.1500 to going to third world.",
    Default = Third_World_Quest_Func,
    Callback = function(Value)
        Third_World_Quest_Func = Value
        Main_Module.StopTween(Third_World_Quest_Func)
    end
})
spawn(function()
    while task.wait() do
        if Third_World_Quest_Func then

            if Player.Data.Level.Value >= Main_Module.MaxLevel then
                OtherModules.AutoThirdWorld()
            else
                Library:SetNotify("Auto Third World", "You need to reach Lv.1500 to use this feature.", 3)
                wait(3)
            end
        end
    end
end)

--// Fighting Quest
local Fighting_Quest = Main_Quest.Left:AddGroup("Fighting Quest")

Fighting_Quest:AddCheckbox('Superhuman_Quest', {
    Text = 'Superhuman',
    Tooltip = "Requires (Black Leg, Electric, Water Kung Fu and Dragon Breath) Mastery 300+ to run this quest. (Price: $3.000.000)",
    Default = Superhuman_Quest_Func,
    Callback = function(Value)
        Superhuman_Quest_Func = Value

        if Superhuman_Quest_Func then
            Main_Module.InvokeRemote("BuySuperhuman")
        end
    end
})

Fighting_Quest:AddCheckbox('Death_Step_Quest', {
    Text = 'Death Step',
    Tooltip = "Requires Black Leg Mastery 400+ to run this quest. (Price: $2.500.000 and f5.000)",
    Default = Death_Step_Quest_Func,
    Callback = function(Value)
        Death_Step_Quest_Func = Value
        Main_Module.StopTween(Death_Step_Quest_Func)
    end
})

Fighting_Quest:AddCheckbox('Sharkman_Karate_Quest', {
    Text = 'Sharkman Karate',
    Tooltip = "Requires Water Kung Fu Mastery 400+ to run this quest. (Price: $2.500.000 and f5.000)",
    Default = Sharkman_Karate_Quest_Func,
    Callback = function(Value)
        Sharkman_Karate_Quest_Func = Value
        Main_Module.StopTween(Sharkman_Karate_Quest_Func)
    end
})

Fighting_Quest:AddCheckbox('Electric_Claw_Quest', {
    Text = 'Electric Claw',
    Tooltip = "Requires Electric Mastery 400+ to run this quest. (Price: $3.000.000 and f5.000)",
    Default = Electric_Claw_Quest_Func,
    Callback = function(Value)
        Electric_Claw_Quest_Func = Value
        Main_Module.StopTween(Electric_Claw_Quest_Func)
    end
})

Fighting_Quest:AddCheckbox('Dragon_Talon_Quest', {
    Text = 'Dragon Talon',
    Tooltip = "Requires Dragon Breath Mastery 400+ to run this quest. (Price: $3.000.000 and f5.000)",
    Default = Dragon_Talon_Quest_Func,
    Callback = function(Value)
        Dragon_Talon_Quest_Func = Value
        Main_Module.StopTween(Dragon_Talon_Quest_Func)
    end
})

Fighting_Quest:AddCheckbox('Godhuman_Quest', {
    Text = 'Godhuman',
    Tooltip = "Requires Level 1500+ and all fighting style mastery 400+ (except Sanguine art and Combat) to run this quest. (Price: $5.000.000 and f5.000) and (Item: 10 Dragon Scale, 20 Fish Tail, 10 Mystic Dreplet, 20 Magma Ore)",
    Default = Godhuman_Quest_Func,
    Callback = function(Value)
        Godhuman_Quest_Func = Value
        Main_Module.StopTween(Godhuman_Quest_Func)
    end
})

Fighting_Quest:AddCheckbox('Sangui_art_Quest', {
    Text = 'Sanguine Art',
    Tooltip = "Requires (Leviathan Heart, 20 Demonic Wisp, 20 Vampire Fang, 2 Dark Fragment) to run this quest. (Price: $5.000.000 and f5.000)",
    Default = Sangui_art_Quest_Func,
    Callback = function(Value)
        Sangui_art_Quest_Func = Value
        Main_Module.StopTween(Sangui_art_Quest_Func)
    end
})



--// Sword Quest

local Sword_Quest = Main_Quest.Right:AddGroup('Sword Quest')

Sword_Quest:AddCheckbox('Saber_V1_Quest', {
    Text = 'Saber V1',
    Tooltip = "Requires Lv.200+",
    Default = Saber_V1_Quest_Func,
    Callback = function(Value)
        Saber_V1_Quest_Func = Value
        Main_Module.StopTween(Saber_V1_Quest_Func)
    end
})

Sword_Quest:AddCheckbox('Legendary_Sword_Dealer', {
    Text = 'Legendary Sword Dealer',
    Tooltip = "Requires at Second World",
    Default = Legendary_Sword_Dealer_Func,
    Callback = function(Value)
        Legendary_Sword_Dealer_Func = Value
    end
})

Sword_Quest:AddCheckbox('Rengoku_Quest', {
    Text = 'Rengoku',
    Tooltip = "Requires Hidden Key",
    Default = Rengoku_Quest_Func,
    Callback = function(Value)
        Rengoku_Quest_Func = Value
        Main_Module.StopTween(Rengoku_Quest_Func)
    end
})

Sword_Quest:AddCheckbox('Buddy_Sword_Quest', {
    Text = 'Buddy Sword',
    Tooltip = "Requires to spawn Cake Queen",
    Default = Buddy_Sword_Quest_Func,
    Callback = function(Value)
        Buddy_Sword_Quest_Func = Value
        Main_Module.StopTween(Buddy_Sword_Quest_Func)
    end
})

Sword_Quest:AddCheckbox('Pole_1stForm_Quest', {
    Text = 'Pole (1st Form)',
    Tooltip = "Requires to defeating Thunder God (6% Chance)",
    Default = Pole_1stForm_Quest_Func,
    Callback = function(Value)
        Pole_1stForm_Quest_Func = Value
        Main_Module.StopTween(Pole_1stForm_Quest_Func)
    end
})

Sword_Quest:AddCheckbox('Cavander_Quest', {
    Text = 'Cavander',
    Tooltip = "Requires to defeating Beautiful Pirate",
    Default = Cavander_Quest_Func,
    Callback = function(Value)
        Cavander_Quest_Func = Value
        Main_Module.StopTween(Cavander_Quest_Func)
    end
})

Sword_Quest:AddCheckbox('Yama_Quest', {
    Text = 'Yama',
    Tooltip = "Requires to Complete Yama Puzzle",
    Default = Yama_Quest_Func,
    Callback = function(Value)
        Yama_Quest_Func = Value
        Main_Module.StopTween(Yama_Quest_Func)
    end
})

Sword_Quest:AddCheckbox('Tushita_Quest', {
    Text = 'Tushita',
    Tooltip = "Requires to Complete Tushita Puzzle",
    Default = Tushita_Quest_Func,
    Callback = function(Value)
        Tushita_Quest_Func = Value
        Main_Module.StopTween(Tushita_Quest_Func)
    end
})

Sword_Quest:AddCheckbox('Dark_Dragger_Quest', {
    Text = 'Dark Dagger',
    Tooltip = "Requires to defeated rip_indra True Form (5% Chance)",
    Default = Dark_Dragger_Quest_Func,
    Callback = function(Value)
        Dark_Dragger_Quest_Func = Value
        Main_Module.StopTween(Dark_Dragger_Quest_Func)
    end
})

Sword_Quest:AddCheckbox('Koko_Quest', {
    Text = 'Koko',
    Tooltip = "Requires to defeated Order",
    Default = Koko_Quest_Func,
    Callback = function(Value)
        Koko_Quest_Func = Value
        Main_Module.StopTween(Koko_Quest_Func)
    end
})

Sword_Quest:AddCheckbox('Spikey_Trident_Quest', {
    Text = 'Spikey Trident',
    Tooltip = "Requires to defeated Cake Prince or Dough King",
    Default = Spikey_Trident_Quest_Func,
    Callback = function(Value)
        Spikey_Trident_Quest_Func = Value
        Main_Module.StopTween(Spikey_Trident_Quest_Func)
    end
})

Sword_Quest:AddCheckbox('Hallow_Scythe_Quest', {
    Text = 'Hallow Scythe',
    Tooltip = "Requires to defeated Soul Reaper with 5% Chance",
    Default = Hallow_Scythe_Quest_Func,
    Callback = function(Value)
        Hallow_Scythe_Quest_Func = Value
        Main_Module.StopTween(Hallow_Scythe_Quest_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// SUBS QUEST
local Subs_Quest = {
    Left = Tabs.Subs_Quest:AddSection(),
    Right = Tabs.Subs_Quest:AddSection(),
}

--// Dragon Hunter
local Dragon_Hunter = Subs_Quest.Left:AddGroup('Dragon Hunter')

Dragon_Hunter:AddButton({
    Text = 'Teleport to Dragon Hunter',
    Tooltip = "To get the quest",
    Callback = function()
        Main_Module.Tween(CFrame.new(5865.80811, 1209.50269, 811.746582))
    end
})

Dragon_Hunter:AddCheckbox('Hydra_Mob_Quest', {
    Text = 'Kill Hydra Mobs and Collect Ember',
    Tooltip = "Get the quest first",
    Default = Hydra_Mob_Quest_Func,
    Callback = function(Value)
        Hydra_Mob_Quest_Func = Value
        Main_Module.StopTween(Hydra_Mob_Quest_Func)
    end
})

Dragon_Hunter:AddCheckbox('Destroy_Tree_Quest', {
    Text = 'Destroy Tree and Collect Ember',
    Tooltip = "Get the quest first",
    Default = Destroy_Tree_Quest_Func,
    Callback = function(Value)
        Destroy_Tree_Quest_Func = Value
        Main_Module.StopTween(Destroy_Tree_Quest_Func)
    end
})

Dragon_Hunter:AddCheckbox('Upgrade_Dragon_Talon_Quest', {
    Text = 'Upgrade Dragon Talon',
    Tooltip = "Requires Mastery 500 for Dragon Talon",
    Default = Upgrade_Dragon_Talon_Quest_Func,
    Callback = function(Value)
        Upgrade_Dragon_Talon_Quest_Func = Value
        Main_Module.StopTween(Upgrade_Dragon_Talon_Quest_Func)
    end
})

--// Other Quest
local Other_Quest = Subs_Quest.Left:AddGroup('Other Quest')

Other_Quest:AddCheckbox('Bartilo_Quest', {
    Text = 'Bartilo',
    Tooltip = "Requires Level.850",
    Default = Bartilo_Quest_Func,
    Callback = function(Value)
        Bartilo_Quest_Func = Value
        Main_Module.StopTween(Bartilo_Quest_Func)
    end
})

Other_Quest:AddCheckbox('Citizen_Quest', {
    Text = 'Citizen',
    Tooltip = "Requires Level.1800 and defeated 50 Forest Pirates",
    Default = Citizen_Quest_Func,
    Callback = function(Value)
        Citizen_Quest_Func = Value
        Main_Module.StopTween(Citizen_Quest_Func)
    end
})

Other_Quest:AddCheckbox('Down_Swan_Quest', {
    Text = 'Don Swan',
    Tooltip = "Auto Don Swan Boss",
    Default = Down_Swan_Quest_Func,
    Callback = function(Value)
        Down_Swan_Quest_Func = Value
        Main_Module.StopTween(Down_Swan_Quest_Func)
    end
})

Other_Quest:AddCheckbox('rip_indra_True_Form_Quest', {
    Text = 'rip indra True Form',
    Tooltip = "Auto rip indra True Form",
    Default = rip_indra_True_Form_Quest_Func,
    Callback = function(Value)
        rip_indra_True_Form_Quest = Value
        Main_Module.StopTween(rip_indra_True_Form_Quest)
    end
})

Other_Quest:AddCheckbox('Rainbow_Haki_Quest', {
    Text = 'Rainbow Haki',
    Tooltip = "Requires Lv.1950",
    Default = Rainbow_Haki_Quest_Func,
    Callback = function(Value)
        Rainbow_Haki_Quest_Func = Value
        Main_Module.StopTween(Rainbow_Haki_Quest_Func)
    end
})

Other_Quest:AddCheckbox('Pray_and_Tryluck_Quest', {
    Text = 'Pray and Try Luck Gravestone',
    Tooltip = "Requires Full Moon",
    Default = Pray_and_Tryluck_Quest_Func,
    Callback = function(Value)
        Pray_and_Tryluck_Quest_Func = Value
        Main_Module.StopTween(Pray_and_Tryluck_Quest_Func)
    end
})

Other_Quest:AddCheckbox('Advanced_Dungeon_Phoenix_Quest', {
    Text = 'Advanced Dungeon (Bird-Bird: Phoenix)',
    Tooltip = "Requires Bird-Bird: Phoenix Fruits",
    Default = Advanced_Dungeon_Phoenix_Quest_Func,
    Callback = function(Value)
        Advanced_Dungeon_Phoenix_Quest_Func = Value
        Main_Module.StopTween(Advanced_Dungeon_Phoenix_Quest_Func)
    end
})

Other_Quest:AddCheckbox('Color_Haki_Quest', {
    Text = 'Buy Color Haki',
    Tooltip = "Nothing",
    Default = Color_Haki_Quest_Func,
    Callback = function(Value)
        Color_Haki_Quest_Func = Value
    end
})

Other_Quest:AddCheckbox('Venom_Bow_Quest', {
    Text = 'Venom Bow',
    Tooltip = "Requires to defeated Hydra Leader",
    Default = Venom_Bow_Quest_Func,
    Callback = function(Value)
        Venom_Bow_Quest_Func = Value
        Main_Module.StopTween(Venom_Bow_Quest_Func)
    end
})



--// Dojo Trainer
local Dojo_Trainer = Subs_Quest.Right:AddGroup('Belt Quest')

Dojo_Trainer:AddLabel("- White: Defeat 20 NPCs with a level difference\n   from the player of up to 100.")
Dojo_Trainer:AddLabel("- Yellow: Defeat 5 Sea Entities.")
Dojo_Trainer:AddLabel("- Orange: Make a successful trade with another\n   player.")
Dojo_Trainer:AddLabel("- Green: Travel to Sea Danger Level 4-6 and stay\n   there for 3-5 minutes.")
Dojo_Trainer:AddLabel("- Blue: Pick up a fruit dropped by another player\n   then drop it or any other fruit back to them.")
Dojo_Trainer:AddLabel("- Purple: Kill 3 Elite Pirates.")
Dojo_Trainer:AddLabel("- Red: Defeat a Terrorshark or Rumbling Waters\n   Sea Event.")
Dojo_Trainer:AddLabel("- Black: Complete Prehistoric Island event and\n   collect 3 Dinosaur Bones from Prehistoric Island.")

Dojo_Trainer:AddCheckbox('Dojo_Quest', {
    Text = 'Request and Claim Quest',
    Tooltip = "Request and Claim Quest",
    Default = Dojo_Quest_Func,
    Callback = function(Value)
        Dojo_Quest_Func = Value
        Main_Module.StopTween(Dojo_Quest_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// SEA EVENT
local Sea_Event = {
    Left = Tabs.Sea_Event:AddSection(),
    Right = Tabs.Sea_Event:AddSection(),
}

--// Config Sea_Event
local Config_Sea_Event = Sea_Event.Left:AddGroup('Configuration')

local Sea_Weapon_List = {
    "Melee", "Sword", "Gun", "Blox Fruit" 
}

Config_Sea_Event:AddDropdown('Sea_Event_Weapon_Selected', {
    Text = 'Select Weapon',
    Tooltip = 'Select weapon.',
    List = Sea_Weapon_List,
    Default = Sea_Event_Weapon_Selected_Func,
    Callback = function(Value)
        Sea_Event_Weapon_Selected_Func = Value
    end
})
Options.Sea_Event_Weapon_Selected:SetValue("Melee")

local Sea_Event_Mode_List = {
    "Above", "Behind"
} 
Config_Sea_Event:AddDropdown('Sea_Event_Mode_Farm_Setting', {
    Text = 'Select Mode',
    Tooltip = 'Mode character for farm',
    List = Sea_Event_Mode_List,
    Default = Sea_Event_Mode_Farm_Setting_Func,
    Callback = function(Value)
        Sea_Event_Mode_Farm_Setting_Func = Value
    end
})
Options.Sea_Event_Mode_Farm_Setting:SetValue("Above")

spawn(function()
    while task.wait() do
        if Sea_Event_Mode_Farm_Setting_Func == "Above" then
            Sea_Event_Farm_Mode = CFrame.new(0,Sea_Event_Distance_Func,0) -- * CFrame.Angles(math.rad(-90),0,0)

        elseif Sea_Event_Mode_Farm_Setting_Func == "Behind" then
            Sea_Event_Farm_Mode = CFrame.new(0,1,Sea_Event_Distance_Func) -- * CFrame.Angles(math.rad(0),0,0)

        end
    end
end)

Config_Sea_Event:AddInput('Sea_Event_Distance_Farm_Setting', {
    Text = 'Set Distance',
    Tooltip = 'Set the distance farming.',
    Default = Sea_Event_Distance_Func,
    Numeric = true,
    Finished = false,
    Callback = function(Value)
        Sea_Event_Distance_Func = Value
    end
})
Options.Sea_Event_Distance_Farm_Setting:SetValue(30)

Config_Sea_Event:AddInput('Sea_Event_Tween_Speed_Setting', {
    Text = 'Set Tween Speed Boat',
    Tooltip = 'Set the speed of tween.',
    Default = Sea_Event_TweenSpeed_Func,
    Numeric = true,
    Finished = false,
    Callback = function(Value)
        Sea_Event_TweenSpeed_Func = Value
    end
})
Options.Sea_Event_Tween_Speed_Setting:SetValue(250)

Config_Sea_Event:AddInput('Sea_Event_Tween_Speed_Setting_Boats', {
    Text = 'Speed Hack Boat',
    Tooltip = 'Set the speed of tween.',
    Default = Sea_Event_Tween_Speed_Setting_Boats_Func,
    Numeric = true,
    Finished = false,
    Callback = function(Value)
        Sea_Event_Tween_Speed_Setting_Boats_Func = Value
        if Sea_Event_Tween_Speed_Setting_Boats_Func then
            workspace.Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.MaxSpeed = Sea_Event_Tween_Speed_Setting_Boats_Func
        end
    end
})

Config_Sea_Event:AddCheckbox('Auto_W', {
    Text = 'Auto W (Auto run manual driving)',
    Tooltip = "Auto run boat.",
    Default = Auto_W_Func,
    Callback = function(Value)
        Auto_W_Func = Value
    end
})
spawn(function()
    while task.wait() do
        if Auto_W_Func then
            game:service('VirtualInputManager'):SendKeyEvent(true, "W", false, game)
            wait(.1)
            game:service('VirtualInputManager'):SendKeyEvent(false, "W", false, game)
        end
    end
end)

local Sea_Event_Skill_List = {
    "Z", "X", "C", "V", "F"
}
Config_Sea_Event:AddDropdown('SeaEvent_Skill', {
    Text = 'Select skill',
    Tooltip = 'Set the skill u want to use automated.',
    List = Sea_Event_Skill_List,
    Default = SeaEvent_Skill_Func,
    Multi = true,
    Callback = function(Value)
        SeaEvent_Skill_Func = Value
    end
})

Config_Sea_Event:AddCheckbox('AimbotSkill_SeaEvent', {
    Text = 'Aimbot Skill',
    Tooltip = "Aimbot skill for sea event.",
    Default = AimbotSkill_SeaEvent_Func,
    Callback = function(Value)
        AimbotSkill_SeaEvent_Func = Value
    end
})


--// Sea Event Farm
local Sea_Event_Main = Sea_Event.Right:AddGroup('Sea Events')

local Team_List = {
    "Marines", "Pirates"
}

Sea_Event_Main:AddDropdown('Team_Selected', {
    Text = 'Select Team',
    Tooltip = 'Select your team.',
    List = Team_List,
    Default = Team_Selected_Func,
    Callback = function(Value)
        Team_Selected_Func = Value
        getBoatsList()
    end
})

function getBoatsList()

    if Team_Selected_Func == 'Marines' then
        Boats_List = {'Dinghy'; 'MarineSloop'; 'MarineBrigade'; 'MarineGrandBrigade';}
        Options.Boats_Selected:UpdateValues(Boats_List)
        wait(8)
        Main_Module.InvokeRemote("SetTeam", "Marines")

    elseif Team_Selected_Func == 'Pirates' then
        Boats_List = {'Dinghy'; 'PirateSloop'; 'PirateBrigade'; 'PirateGrandBrigade';}
        Options.Boats_Selected:UpdateValues(Boats_List)
        wait(8)
        Main_Module.InvokeRemote("SetTeam", "Pirates")
    end

end

local Boats_List = {}
Sea_Event_Main:AddDropdown('Boats_Selected', {
    Text = 'Select Boats',
    Tooltip = 'Choose the boats.',
    List = Boats_List,
    Default = Boats_Selected_Func,
    Callback = function(Value)
        Boats_Selected_Func = Value
    end
})

local Sea_Danger_List = {
    "Sea Danger 1", "Sea Danger 2", "Sea Danger 3", "Sea Danger 4", "Sea Danger 5", "Sea Danger 6"
}

Sea_Event_Main:AddDropdown('Sea_Danger_Selected', {
    Text = 'Select Sea for sails',
    Tooltip = 'Choose level of sea danger.',
    List = Sea_Danger_List,
    Default = Sea_Danger_Selected_Func,
    Callback = function(Value)
        Sea_Danger_Selected_Func = Value
    end
})

Sea_Event_Main:AddCheckbox('Auto_Sails', {
    Text = 'Auto Sails',
    Tooltip = "Run auto sails.",
    Default = Auto_Sails_Func,
    Callback = function(Value)
        Auto_Sails_Func = Value
        Main_Module.StopTween(Auto_Sails_Func)
        Main_Module.BoatsStopTween(Auto_Sails_Func)
    end
})

Sea_Event_Main:AddCheckbox('Fish_Farming', {
    Text = 'Attack Fish',
    Tooltip = "Auto farm fish (Shark, Piranha, Fish Crew Member).",
    Default = Fish_Farming_Func,
    Callback = function(Value)
        Fish_Farming_Func = Value
        Main_Module.StopTween(Fish_Farming_Func)
    end
})

Sea_Event_Main:AddCheckbox('Terrorshark_Farming', {
    Text = 'Attack Terrorshark',
    Tooltip = "Auto farm Terrorshark.",
    Default = Terrorshark_Farming_Func,
    Callback = function(Value)
        Terrorshark_Farming_Func = Value
        Main_Module.StopTween(Terrorshark_Farming_Func)
    end
})

Sea_Event_Main:AddCheckbox('GhostShip_Farming', {
    Text = 'Attack Ghost Ship',
    Tooltip = "Auto farm Ghost Ship.",
    Default = GhostShip_Farming_Func,
    Callback = function(Value)
        GhostShip_Farming_Func = Value
        Main_Module.StopTween(GhostShip_Farming_Func)
    end
})

Sea_Event_Main:AddCheckbox('Sea_Beast_Farming', {
    Text = 'Attack Sea Beast',
    Tooltip = "Auto farm sea beast.",
    Default = Sea_Beast_Farming_Func,
    Callback = function(Value)
        Sea_Beast_Farming_Func = Value
        Main_Module.StopTween(Sea_Beast_Farming_Func)
    end
})
----------------------------------------------------//----------------------------------------------------
--// MAIN ISLAND
local Main_Island = {
    Left = Tabs.Main_Island:AddSection(),
    Right = Tabs.Main_Island:AddSection(),
}

--// MIRAGE ISLAND
local Mirage_Island = Main_Island.Left:AddGroup("Mirage Island")

Mirage_Island:AddCheckbox('Mirage_Notification', {
    Text = 'Mirage Notification',
    Tooltip = "Show Mirage notifications.",
    Default = Mirage_Notification_Func,
    Callback = function(Value)
        Mirage_Notification_Func = Value
    end
})

Mirage_Island:AddCheckbox('Mirage_Esp', {
    Text = 'Mirage ESP',
    Tooltip = "Show Mirage ESP.",
    Default = Mirage_Esp_Func,
    Callback = function(Value)
        Mirage_Esp_Func = Value
    end
})

Mirage_Island:AddCheckbox('Mirage_Teleport', {
    Text = 'Teleport to Mirage',
    Tooltip = "Teleport to mirage island.",
    Default = Mirage_Teleport_Func,
    Callback = function(Value)
        Mirage_Teleport_Func = Value
        Main_Module.StopTween(Mirage_Teleport_Func)
    end
})

Mirage_Island:AddCheckbox('Mirage_Gear_Teleport', {
    Text = 'Collect Gear',
    Tooltip = "Collect Gear.",
    Default = Mirage_Gear_Teleport_Func,
    Callback = function(Value)
        Mirage_Gear_Teleport_Func = Value
        Main_Module.StopTween(Mirage_Gear_Teleport_Func)
    end
})

Mirage_Island:AddCheckbox('Fruit_Dealer_Teleport', {
    Text = 'Teleport to Fruit Dealer',
    Tooltip = "Teleport to Advanced Fruit Dealer.",
    Default = Fruit_Dealer_Teleport_Func,
    Callback = function(Value)
        Fruit_Dealer_Teleport_Func = Value
        Main_Module.StopTween(Fruit_Dealer_Teleport_Func)
    end
})



--// KITSUNE ISLAND
local Kitsune_Island = Main_Island.Left:AddGroup("Kitsune Island")
Kitsune_Island:AddCheckbox('Kitsune_Notification', {
    Text = 'Kitsune Notification',
    Tooltip = "Show Kitsune notifications.",
    Default = Kitsune_Notification_Func,
    Callback = function(Value)
        Kitsune_Notification_Func = Value
    end
})

Kitsune_Island:AddCheckbox('Kitsune_Esp', {
    Text = 'Kitsune ESP',
    Tooltip = "Show Kitsune ESP.",
    Default = Kitsune_Esp_Func,
    Callback = function(Value)
        Kitsune_Esp_Func = Value
    end
})

Kitsune_Island:AddCheckbox('Teleport_Kitsune', {
    Text = 'Teleport to Kitsune Island',
    Tooltip = "Teleport to Kitsune Island.",
    Default = Teleport_Kitsune_Func,
    Callback = function(Value)
        Teleport_Kitsune_Func = Value
        Main_Module.StopTween(Teleport_Kitsune_Func)
    end
})

Kitsune_Island:AddCheckbox('Collect_Azure_Kitsune', {
    Text = 'Collect Azure Ember',
    Tooltip = "Auto collect azure ember.",
    Default = Collect_Azure_Kitsune_Func,
    Callback = function(Value)
        Collect_Azure_Kitsune_Func = Value
        Main_Module.StopTween(Collect_Azure_Kitsune_Func)
    end
})


--// PREHISTORIC ISLAND
local Prehistoric_Island = Main_Island.Right:AddGroup("Prehistoric Island")
Prehistoric_Island:AddCheckbox('Prehistoric_Notification', {
    Text = 'Prehistoric Notification',
    Tooltip = "Show Prehistoric notifications.",
    Default = Prehistoric_Notification_Func,
    Callback = function(Value)
        Prehistoric_Notification_Func = Value
    end
})

Prehistoric_Island:AddCheckbox('Prehistoric_Esp', {
    Text = 'Prehistoric ESP',
    Tooltip = "Show Prehistoric ESP.",
    Default = Prehistoric_Esp_Func,
    Callback = function(Value)
        Prehistoric_Esp_Func = Value
    end
})

Prehistoric_Island:AddCheckbox('Teleport_Prehistoric', {
    Text = 'Teleport to Prehistoric Island',
    Tooltip = "Teleport to Prehistoric Island.",
    Default = Teleport_Prehistoric_Func,
    Callback = function(Value)
        Teleport_Prehistoric_Func = Value
        Main_Module.StopTween(Teleport_Prehistoric_Func)
    end
})

Prehistoric_Island:AddCheckbox('Kill_Golem', {
    Text = 'Kill Lava Golem',
    Tooltip = "Auto kill lava golem.",
    Default = Kill_Golem_Func,
    Callback = function(Value)
        Kill_Golem_Func = Value
        Main_Module.StopTween(Kill_Golem_Func)
    end
})

Prehistoric_Island:AddCheckbox('Kill_Golem_Instantly', {
    Text = 'Prehistoric Aura',
    Tooltip = "Auto kill lava golem instant.",
    Default = Kill_Golem_Instantly_Func,
    Callback = function(Value)
        Kill_Golem_Instantly_Func = Value
    end
})

Prehistoric_Island:AddCheckbox('Collect_Dragon_Egg', {
    Text = 'Collect Dragon Eggs',
    Tooltip = "Auto collect dragon egg.",
    Default = Collect_Dragon_Egg_Func,
    Callback = function(Value)
        Collect_Dragon_Egg_Func = Value
        Main_Module.StopTween(Collect_Dragon_Egg_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// MAIN RACE
local Main_Race = {
    Left = Tabs.Main_Race:AddSection(),
    Right = Tabs.Main_Race:AddSection(),
}

--// RACE
local Race_V4 = Main_Race.Left:AddGroup("Race")

Race_V4:AddCheckbox('Teleport_Race_Door', {
    Text = 'Teleport to Race Door',
    Tooltip = "Auto teleport to race door.",
    Default = Teleport_Race_Door_Func,
    Callback = function(Value)
        Teleport_Race_Door_Func = Value
        Main_Module.StopTween(Teleport_Race_Door_Func)
    end
})

Race_V4:AddCheckbox('Auto_Trial_Race', {
    Text = 'Trial Race',
    Tooltip = "Auto trial race.",
    Default = Auto_Trial_Race_Func,
    Callback = function(Value)
        Auto_Trial_Race_Func = Value
        Main_Module.StopTween(Auto_Trial_Race_Func)
    end
})

Race_V4:AddCheckbox('Auto_Train_Race', {
    Text = 'Training Race',
    Tooltip = "Auto train race.",
    Default = Auto_Train_Race_Func,
    Callback = function(Value)
        Auto_Train_Race_Func = Value
        Main_Module.StopTween(Auto_Train_Race_Func)
    end
})

--// Area
local Area_V4 = Main_Race.Right:AddGroup("Area")

Area_V4:AddButton({
    Text = 'Timple of Time',
    Callback = function()
        Main_Module.InvokeRemote("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        wait(1)
        Main_Module.Tween(CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    end
})

Area_V4:AddButton({
    Text = 'Lever Pull',
    Callback = function()
        Main_Module.InvokeRemote("requestEntrance", Vector3.new(28575.181640625, 14936.6279296875, 72.31636810302734))
        wait(1)
        Main_Module.Tween(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end
})

Area_V4:AddButton({
    Text = 'Ancient One',
    Callback = function()
        Main_Module.InvokeRemote("requestEntrance", Vector3.new(28981.552734375, 14888.4267578125, -120.245849609375))
        wait(1)
        Main_Module.Tween(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    end
})

Area_V4:AddButton({
    Text = 'Safe Zone',
    Callback = function()
        Main_Module.Tween(CFrame.new(28273.0859375, 14896.5078125, 157.42063903808594))
    end
})

Area_V4:AddButton({
    Text = 'PVP Zone',
    Callback = function()
        Main_Module.Tween(CFrame.new(28766.681640625, 14967.1455078125, -164.13290405273438))
    end
})
----------------------------------------------------//----------------------------------------------------
--// MAIN RAID
local Main_Raid = {
    Left = Tabs.Main_Raid:AddSection(),
    Right = Tabs.Main_Raid:AddSection(),
}

--// LAW RAID
local Law_Raids = Main_Raid.Left:AddGroup("Law Raid")

Law_Raids:AddCheckbox('Auto_Buy_Law_Chips', {
    Text = "Auto buy law chips",
    Default = Auto_Buy_Law_Chips_Func,
    Callback = function(Value)
        Auto_Buy_Law_Chips_Func = Value
    end
})

spawn(function()
    while wait() do
        if Auto_Buy_Law_Chips_Func then
            if Player.Backpack:FindFirstChild("Microchip") or Player.Character:FindFirstChild("Microchip") or game:GetService("Workspace").Enemies:FindFirstChild("Order") or game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                
            else
                local args = {
                    [1] = "BlackbeardReward",
                    [2] = "Microchip",
                    [3] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

Law_Raids:AddCheckbox('Auto_Start_Law_Raid', {
    Text = "Auto start law raid",
    Default = Auto_Start_Law_Raid_Func,
    Callback = function(Value)
        Auto_Start_Law_Raid_Func = Value
    end
})
spawn(function()
    while wait() do
        if Auto_Start_Law_Raid_Func then
            pcall(function()
                if Player.Character:FindFirstChild("Microchip") or Player.Backpack:FindFirstChild("Microchip") then
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                end
            end)
        end
    end
end)

Law_Raids:AddCheckbox('Auto_Kill_Law_Raid', {
    Text = "Auto kill law raid",
    Default = Auto_Kill_Law_Raid_Func,
    Callback = function(Value)
        Auto_Kill_Law_Raid_Func = Value
        Main_Module.StopTween(Farm_All_Boss_Func)
    end
})
spawn(function()
    while task.wait() do
        if Auto_Kill_Law_Raid_Func then
            if Enemies:FindFirstChild("Order") then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == "Order" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            EquipTool(Selected_Weapon)
                            v.HumanoidRootPart.CanCollide = false
                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                        until not Auto_Kill_Law_Raid_Func or v.Humanoid.Health <= 0 or not v.Parent or not Enemies:FindFirstChild(v.Name)
                    end
                end
            else
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if v.Name == "Order" then
                        Main_Module.Tween(v.HumanoidRootPart.CFrame)
                    end
                end
            end
        end
    end
end)



--// NORMAL RAID
local Normal_Raid = Main_Raid.Right:AddGroup("Normal Raid")

Normal_Raid:AddDropdown('Select_Chips_Raid', {
    Text = 'Select Chips',
    Tooltip = 'Choose the chips you want to farming on raid.',
    List = OtherModules.RaidChip,
    Default = Select_Chips_Raid_Func,
    Callback = function(Value)
        Select_Chips_Raid_Func = Value
    end
})

Normal_Raid:AddCheckbox('Auto_Buy_Microchips', {
    Text = "Auto buy microchips",
    Default = Auto_Buy_Microchips_Func,
    Callback = function(Value)
        Auto_Buy_Microchips_Func = Value
    end
})
spawn(function()
    while task.wait() do
        if Auto_Buy_Microchips_Func then
            OtherModules.BuyMicrochips()
        end
    end
end)

Normal_Raid:AddCheckbox('Auto_Start_Raid', {
    Text = "Auto start raid",
    Default = Auto_Start_Raid_Func,
    Callback = function(Value)
        Auto_Start_Raid_Func = Value
        Main_Module.StopTween(Auto_Start_Raid_Func)
    end
})
spawn(function()
    while task.wait() do
        if Auto_Start_Raid_Func then
            OtherModules.AutoStartRaids()
        end
    end
end)

Normal_Raid:AddCheckbox('Auto_Next_Island', {
    Text = "Auto next island",
    Default = Auto_Next_Island_Func,
    Callback = function(Value)
        Auto_Next_Island_Func = Value
        Main_Module.StopTween(Auto_Next_Island_Func)
    end
})
spawn(function()
    while wait() do
        if Auto_Next_Island_Func then
            if Player.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
                if Locations:FindFirstChild("Island 5") then
                    if (Locations:FindFirstChild("Island 5").CFrame.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                        Main_Module.Tween(Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,100,0))
                    end
                elseif Locations:FindFirstChild("Island 4") then
                    if (Locations:FindFirstChild("Island 4").CFrame.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                        Main_Module.Tween(Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,100,0))
                    end
                elseif Locations:FindFirstChild("Island 3") then
                    if (Locations:FindFirstChild("Island 3").CFrame.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                        Main_Module.Tween(Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,100,0))
                    end
                elseif Locations:FindFirstChild("Island 2") then
                    if (Locations:FindFirstChild("Island 2").CFrame.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                        Main_Module.Tween(Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,100,0))
                    end
                elseif Locations:FindFirstChild("Island 1") then
                    if (Locations:FindFirstChild("Island 1").CFrame.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                        Main_Module.Tween(Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0,100,0))
                    end
                end
            end
        end
    end
end)


Normal_Raid:AddCheckbox('Auto_Kill_Raid_Monster', {
    Text = "Auto kill monster raid",
    Default = Auto_Kill_Raid_Monster_Func,
    Callback = function(Value)
        Auto_Kill_Raid_Monster_Func = Value
        Main_Module.StopTween(Auto_Kill_Raid_Monster_Func)
    end
})
spawn(function()
    while task.wait() do
        if Auto_Kill_Raid_Monster_Func then

            if Player.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if v.Name then
                            repeat task.wait()
                                if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Main_Module:BringEnemies(v, true)
                                end
                            until not Auto_Kill_Raid_Monster_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            end
        end
    end
end)

Normal_Raid:AddCheckbox('Auto_Raid_Aura', {
    Text = "Auto raid aura (bot recommended)",
    Default = Auto_Raid_Aura_Func,
    Callback = function(Value)
        Auto_Raid_Aura_Func = Value
        Main_Module.StopTween(Auto_Raid_Aura_Func)
    end
})
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if Auto_Raid_Aura_Func then
            pcall(function()

                OtherModules.AutoNextIsland()
                if Player.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
                    for i,v in pairs(Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name then
                                repeat task.wait()
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(Player,"SimulationRadius",math.huge)
                                until not Auto_Raid_Aura_Func or not v.Parent or not Enemies:FindFirstChild(v.Name) or Player.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

----------------------------------------------------//----------------------------------------------------
--// MAIN BOUNTY
local Main_Bounty = {
    Left = Tabs.Main_Bounty:AddSection(),
    Right = Tabs.Main_Bounty:AddSection(),
}

--// INFO BOUNTY
local Info_Bounty = Main_Bounty.Left:AddGroup("Info Bounty")

local Current_Bounty = Info_Bounty:AddLabel("Your Bounty : ")
local Earned_Bounty = Info_Bounty:AddLabel("Earned = ?")

--// Boss
local Boss_Bounty = Main_Bounty.Left:AddGroup("Boss Bounty")

Boss_Bounty:AddCheckbox('Farm_All_Boss', {
    Text = 'Farm All Boss',
    Default = Farm_All_Boss_Func,
    Callback = function(Value)
        Farm_All_Boss_Func = Value
        Main_Module.StopTween(Farm_All_Boss_Func)
    end
})

spawn(function()
    while task.wait() do
        if Farm_All_Boss_Func then
            if Enemies:FindFirstChild(Boss_Listed[1]) or Enemies:FindFirstChild(Boss_Listed[2]) or Enemies:FindFirstChild(Boss_Listed[3]) or Enemies:FindFirstChild(Boss_Listed[4]) or Enemies:FindFirstChild(Boss_Listed[5]) or Enemies:FindFirstChild(Boss_Listed[6]) or Enemies:FindFirstChild(Boss_Listed[7]) or Enemies:FindFirstChild(Boss_Listed[8]) or Enemies:FindFirstChild(Boss_Listed[9]) or Enemies:FindFirstChild(Boss_Listed[10]) or Enemies:FindFirstChild(Boss_Listed[11]) or Enemies:FindFirstChild(Boss_Listed[12]) or Enemies:FindFirstChild(Boss_Listed[13]) or Enemies:FindFirstChild(Boss_Listed[14]) or Enemies:FindFirstChild(Boss_Listed[15]) or Enemies:FindFirstChild(Boss_Listed[16]) or Enemies:FindFirstChild(Boss_Listed[17]) or Enemies:FindFirstChild(Boss_Listed[18]) or Enemies:FindFirstChild(Boss_Listed[19]) then
                for i,v in pairs(Enemies:GetChildren()) do
                    if table.find(Boss_Listed, v.Name) then
                        if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                            repeat task.wait()

                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                            until not Farm_All_Boss_Func or not v.Parent or v.Humanoid.Health <= 0 or not game.ReplicatedStorage:FindFirstChild(v.Name)
                        end
                    end
                end

            else
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if table.find(Boss_Listed, v.Name) then
                        Main_Module.Tween(v.HumanoidRootPart.CFrame)
                    end
                end
            end
        end
    end
end)

--// Players
local Player_Bounty = Main_Bounty.Right:AddGroup("Player Bounty")

Player_Bounty:AddDropdown('Selected_Player', {
    Text = 'Player List',
    List = OtherModules.GetListPlayers(),
    Default = Selected_Player_Func,
    Callback = function(Value)
        Selected_Player_Func = Value
    end
})

Player_Bounty:AddButton({
    Text = "Refresh Player List",
    Callback = function()
        Options.Selected_Player:UpdateValues(OtherModules.GetListPlayers())
    end
})

Player_Bounty:AddCheckbox('Spectate_Player', {
    Text = 'Spectated Player',
    Default = Spectate_Player_Func,
    Callback = function(Value)
        Spectate_Player_Func = Value

        while wait() do
            OtherModules.SpectatePlayer()
        end
    end
})

Player_Bounty:AddCheckbox('Player_ESP', {
    Text = 'ESP Player',
    Default = Player_ESP_Func,
    Callback = function(Value)
        Player_ESP_Func = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            OtherModules.PlayerESP()
        end)
    end
end)

Player_Bounty:AddCheckbox('Tween_Players', {
    Text = 'Tween to Player',
    Default = Tween_Players_Func,
    Callback = function(Value)
        Tween_Players_Func = Value
        Main_Module.StopTween(Tween_Players_Func)

        while task.wait() do
            OtherModules.TweenToPlayers()
        end
    end
})

AimbotToPlayerSkill_List = {
    "Z", "X", "C", "V", "F"
}
Player_Bounty:AddDropdown('Aimbot_Skill_To_Player', {
    Text = 'Select skill',
    Tooltip = 'Set the skill u want to use automated.',
    List = AimbotToPlayerSkill_List,
    Default = Aimbot_Skill_To_Player_Func,
    Multi = true,
    Callback = function(Value)
        Aimbot_Skill_To_Player_Func = Value
    end
})

Player_Bounty:AddCheckbox('Aimbot_Skill', {
    Text = 'Aimbot SKill',
    Default = Aimbot_Skill_Func,
    Callback = function(Value)
        Aimbot_Skill_Func = Value

        while wait() do
            OtherModules.AimbotSKillToPlayer()
        end
    end
})

Player_Bounty:AddCheckbox('Enable_Pvp', {
    Text = 'Enable Pvp',
    Default = Enable_Pvp_Func,
    Callback = function(Value)
        Enable_Pvp_Func = Value

        while wait() do
            OtherModules.EnablePvp()
        end
    end
})

----------------------------------------------------//----------------------------------------------------
--// MAIN TELEPORT
local Main_Teleport = {
    Left = Tabs.Main_Teleport:AddSection(),
    Right = Tabs.Main_Teleport:AddSection(),
}

--// WORLD TELEPORT
local World_Teleport = Main_Teleport.Left:AddGroup('World')

World_Teleport:AddButton({
    Text = "First World",
    Callback = function()
        Main_Module.InvokeRemote("TravelMain")
    end
})

World_Teleport:AddButton({
    Text = "Second World",
    Callback = function()
        Main_Module.InvokeRemote("TravelDressrosa")
    end
})

World_Teleport:AddButton({
    Text = "Third World",
    Callback = function()
        Main_Module.InvokeRemote("TravelZou")
    end
})


--// ISLAND TELEPORT
local Island_Teleported = Main_Teleport.Left:AddGroup('Island')

OtherModules.IslandTeleports(Island_Teleported)

--// NPC TELEPORT
local NPC_Teleported = Main_Teleport.Right:AddGroup('NPC')

local function getNpcList()
    local Npc_List_update = {}

    for npc_index, npc_value in workspace.NPCs:GetChildren() do
        table.insert(Npc_List_update, npc_value.Name)
    end

    return Npc_List_update
end

local NPC_List = {}
NPC_Teleported:AddDropdown('NPC_Listed', {
    Text = 'NPC List',
    List = getNpcList(),
    Default = NPC_Listed_Func,
    Callback = function(Value)
        NPC_Listed_Func = Value
    end
})

NPC_Teleported:AddButton({
    Text = "Refresh npc list",
    Callback = function()
        Options.NPC_Listed:UpdateValues(getNpcList())
    end
})

NPC_Teleported:AddButton({
    Text = "Teleport to npc",
    Callback = function()
        for npc_index, npc_value in workspace.NPCs:GetChildren() do
            if npc_value.Name == NPC_Listed_Func then
                Main_Module.Tween(npc_value.HumanoidRootPart.CFrame)
            end
        end
    end
})

----------------------------------------------------//----------------------------------------------------
--// MAIN STATS
local Main_Stat = {
    Left = Tabs.Main_Stat:AddSection(),
    Right = Tabs.Main_Stat:AddSection(),
}

--// Up Value Point STATS

local Up_Stats = Main_Stat.Left:AddGroup('Auto Stats')

local PointAvaibleStat = Up_Stats:AddLabel("Avaible Points : "..tostring(Player.Data.Points.Value))

Up_Stats:AddInput('Up_Stat_Req_Point', {
    Text = 'Point Set',
    Default = Up_Stat_Req_Point_Func,
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter
    Callback = function(Value)
        Up_Stat_Req_Point_Func = Value
    end
})
Options.Up_Stat_Req_Point:SetValue(1)

Stats_Listeds = {
    "Melee", "Defense", "Blox Fruit", "Sword", "Gun"
}
Up_Stats:AddDropdown('Stats_Listed', {
    Text = 'Select Stats',
    List = Stats_Listeds,
    Multi = true,
    Default = Stats_Listed_Func,
    Callback = function(Value)
        Stats_Listed_Func = Value
    end
})

Up_Stats:AddCheckbox('Selected_Up_Stats', {
    Text = 'Auto Up Stats',
    Default = Selected_Up_Stats_Func,
    Callback = function(Value)
        Selected_Up_Stats_Func = Value
    end
})
spawn(function()
    while task.wait() do
        if Selected_Up_Stats_Func then
            
            OtherModules.StatsUpped()
            
        end
    end
end)

--// INFO STATS
local Info_Stats = Main_Stat.Right:AddGroup('Info Stats')

local RaceInfo = Info_Stats:AddLabel()
local StatRefunds = Info_Stats:AddLabel()
local RaceReroll = Info_Stats:AddLabel()
local FruitsCaps = Info_Stats:AddLabel()
local MeleePoints = Info_Stats:AddLabel()
local DefensePoints = Info_Stats:AddLabel()
local SwordPoints = Info_Stats:AddLabel()
local GunPoints = Info_Stats:AddLabel()
local FruitPoints = Info_Stats:AddLabel()

----------------------------------------------------//----------------------------------------------------
--// MAIN SHOP
local Main_Shop = {
    Left = Tabs.Main_Shop:AddSection(),
    Right = Tabs.Main_Shop:AddSection(),
}

--// Fruits SHOP
local Fruit_Shop = Main_Shop.Left:AddGroup('Fruits')

local PriceOfFruit = Fruit_Shop:AddLabel("?")

local function UpdatePriceFruit()
    local FruitPrice = nil

    for index_Fruits, value_Fruits in Main_Module.InvokeRemote("GetFruits") do
        if value_Fruits.Name == Fruits_List_Func then
            if value_Fruits.OnSale then
                FruitPrice = value_Fruits.Name.." [ $"..value_Fruits.Price.." ] - Avaible."

            else
                FruitPrice = value_Fruits.Name.." [ $"..value_Fruits.Price.." ] - Not avaible."
            end
        end
    end

    return FruitPrice
end

Fruit_Shop:AddDropdown('Fruits_List', {
    Text = 'Fruit List',
    List = OtherModules.GetShopFruits(),
    Default = Fruits_List_Func,
    Callback = function(Value)
        Fruits_List_Func = Value
    end
})

Fruit_Shop:AddButton({
    Text = "Buy",
    Callback = function()
        for index_Fruits, value_Fruits in Main_Module.InvokeRemote("GetFruits") do
            if value_Fruits.Name == Fruits_List_Func then
                if value_Fruits.OnSale then
                    Main_Module.InvokeRemote("PurchaseRawFruit", Fruits_List_Func)
                else
                    Library:SetNotify("Fruit Shop", Fruits_List_Func.." is not avaible now.\nTry again when it avaible later.", 5)
                end
            end
        end
    end
})

--// Fighting SHOP
local Fighting_Shop = Main_Shop.Left:AddGroup('Fighting')

Fighting_Shop:AddDropdown('Fighting_List', {
    Text = 'Fighting list',
    List = OtherModules.GetShopList("Fighting Style"),
    Default = Fighting_List_Func,
    Callback = function(Value)
        Fighting_List_Func = Value
    end
})

Fighting_Shop:AddButton({
    Text = "Buy",
    Callback = function()
        OtherModules.GetBuyinShop("Fighting Style", Fighting_List_Func)
    end
})

--// Sword SHOP
local Sword_Shop = Main_Shop.Left:AddGroup('Sword')

Sword_Shop:AddDropdown('Sword_List', {
    Text = 'Sword list',
    List = OtherModules.GetShopList("Sword"),
    Default = Sword_List_Func,
    Callback = function(Value)
        Sword_List_Func = Value
    end
})

Sword_Shop:AddButton({
    Text = "Buy",
    Callback = function()
        OtherModules.GetBuyinShop("Sword", Sword_List_Func)
    end
})

--// Gun SHOP
local Gun_Shop = Main_Shop.Left:AddGroup('Gun')

Gun_Shop:AddDropdown('Gun_List', {
    Text = 'Gun list',
    List = OtherModules.GetShopList("Gun"),
    Default = Gun_List_Func,
    Callback = function(Value)
        Gun_List_Func = Value
    end
})

Gun_Shop:AddButton({
    Text = "Buy",
    Callback = function()
        OtherModules.GetBuyinShop("Gun", Gun_List_Func)
    end
})

--// Random SHOP
local Random_Shop = Main_Shop.Right:AddGroup('Random')

Random_Shop:AddDropdown('Random_List', {
    Text = 'Random list',
    List = OtherModules.GetShopList("Main"),
    Default = Random_List_Func,
    Callback = function(Value)
        Random_List_Func = Value
    end
})

Random_Shop:AddButton({
    Text = "Buy",
    Callback = function()
        OtherModules.GetBuyinShop("Main", Random_List_Func)
    end
})

--// Abilities SHOP
local Abilities_Shop = Main_Shop.Right:AddGroup('Abilities')

Abilities_Shop:AddDropdown('Abilities_List', {
    Text = 'Abilities list',
    List = OtherModules.GetShopList("Abilities"),
    Default = Abilities_List_Func,
    Callback = function(Value)
        Abilities_List_Func = Value
    end
})

Abilities_Shop:AddButton({
    Text = "Buy",
    Callback = function()
        OtherModules.GetBuyinShop("Abilities", Abilities_List_Func)
    end
})

--// Accessories SHOP
local Accessories_Shop = Main_Shop.Right:AddGroup('Accessories')

Accessories_Shop:AddDropdown('Accessories_List', {
    Text = 'Accessories list',
    List = OtherModules.GetShopList("Accessories"),
    Default = Accessories_List_Func,
    Callback = function(Value)
        Accessories_List_Func = Value
    end
})

Accessories_Shop:AddButton({
    Text = "Buy",
    Callback = function()
        OtherModules.GetBuyinShop("Accessories", Accessories_List_Func)
    end
})

----------------------------------------------------//----------------------------------------------------
--// MISC
local Misc = {
    Left = Tabs.Misc:AddSection(),
    Right = Tabs.Misc:AddSection(),
}

--// Fruits
local Fruits_Misc = Misc.Left:AddGroup("Fruits")

Fruits_Misc:AddCheckbox('Fruit_Notifications', {
    Text = 'Fruit Notifications',
    Default = Fruit_Notifications_Func,
    Callback = function(Value)
        Fruit_Notifications_Func = Value
    end
})
Checkboxs.Fruit_Notifications:SetValue(true)
spawn(function()
    while task.wait() do
        if Fruit_Notifications_Func then
            for i,v in workspace:GetChildren() do
                if (v:IsA("Tool") or v:IsA('Model')) and string.find(v.Name, 'Fruit') then
                    if v:FindFirstChild("Handle") then
                        local FruitDistance = math.floor((Player.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude)
                        Main_Module:SetNotify("Fruit has spawned !", v.Name.." has spawned in "..FruitDistance.."m", 5)
                        wait(3)
                    end
                end
            end
        end
    end
end)

--[[Fruits_Misc:AddCheckbox('Bring_Fruit_Instant', {
    Text = 'Bring Fruit Instant',
    Default = Bring_Fruit_Instant_Func,
    Callback = function(Value)
        Bring_Fruit_Instant_Func = Value
    end
})
spawn(function()
    while task.wait() do
        if Bring_Fruit_Instant_Func then
            OtherModules.BringFruits()
        end
    end
end)]]

Fruits_Misc:AddCheckbox('Tween_To_Fruit', {
    Text = 'Tween Fruit',
    Default = Tween_To_Fruit_Func,
    Callback = function(Value)
        Tween_To_Fruit_Func = Value
        Main_Module.StopTween(Tween_To_Fruit_Func)
    end
})
spawn(function()
    while task.wait() do
        if Tween_To_Fruit_Func then
            OtherModules.TweenFruits()
        end
    end
end)

Fruits_Misc:AddCheckbox('Buy_Random_Fruit', {
    Text = 'Auto buy random fruit',
    Default = Buy_Random_Fruit_Func,
    Callback = function(Value)
        Buy_Random_Fruit_Func = Value
    end
})
spawn(function()
    while task.wait() do
        if Buy_Random_Fruit_Func then
            Main_Module.InvokeRemote("Cousin", "Buy")
        end
    end
end)

Fruits_Misc:AddCheckbox('Auto_Stored_Fruit', {
    Text = 'Auto Stored Fruit',
    Default = Auto_Stored_Fruit_Func,
    Callback = function(Value)
        Auto_Stored_Fruit_Func = Value
    end
})
spawn(function()
    while task.wait() do
        if Auto_Stored_Fruit_Func then
            OtherModules.AutoStoredFruit()
        end
    end
end)



--// ESP
local Main_ESP = Misc.Left:AddGroup("ESP")

Main_ESP:AddCheckbox('Monster_ESP', {
    Text = 'Monster',
    Default = Monster_ESP_Func,
    Callback = function(Value)
        Monster_ESP_Func = Value
    end
})

Main_ESP:AddCheckbox('Island_ESP', {
    Text = 'Island',
    Default = Island_ESP_Func,
    Callback = function(Value)
        Island_ESP_Func = Value
    end
})

Main_ESP:AddCheckbox('NPC_ESP', {
    Text = 'NPC',
    Default = NPC_ESP_Func,
    Callback = function(Value)
        NPC_ESP_Func = Value
    end
})

Main_ESP:AddCheckbox('Fruit_ESP', {
    Text = 'Fruit',
    Default = Fruit_ESP_Func,
    Callback = function(Value)
        Fruit_ESP_Func = Value
    end
})
Checkboxs.Fruit_ESP:SetValue(true)

Main_ESP:AddCheckbox('Chest_ESP', {
    Text = 'Chest',
    Default = Chest_ESP_Func,
    Callback = function(Value)
        Chest_ESP_Func = Value
    end
})

Main_ESP:AddCheckbox('Flower_ESP', {
    Text = 'Flower',
    Default = Flower_ESP_Func,
    Callback = function(Value)
        Flower_ESP_Func = Value
    end
})

spawn(function()
    while wait() do
        pcall(function()
            OtherModules.MonsterEsp()
            OtherModules.IslandESP()
            OtherModules.NpcESP()
            OtherModules.FruitEsp()
            OtherModules.ChestESP()
            OtherModules.FlowerESP()
        end)
    end
end)

--// Other
local Other_Misc = Misc.Right:AddGroup("Other")

Other_Misc:AddCheckbox('Dodge_Cooldown', {
    Text = 'No Dodge Cooldown',
    Default = Dodge_Cooldown_Func,
    Callback = function(Value)
        Dodge_Cooldown_Func = Value

        OtherModules.NoDodgeCooldown()
    end
})

Other_Misc:AddCheckbox('Infinite_Energy', {
    Text = 'Infinite Energy',
    Default = Infinite_Energy_Func,
    Callback = function(Value)
        Infinite_Energy_Func = Value

        while task.wait() do
            OtherModules.InfiniteEnergy()
        end
    end
})

Other_Misc:AddCheckbox('Geppo_Cooldown', {
    Text = 'No Geppo Cooldown',
    Default = Geppo_Cooldown_Func,
    Callback = function(Value)
        Geppo_Cooldown_Func = Value

        while wait() do
            OtherModules.NoGeppoCooldown()
        end
    end
})

Other_Misc:AddCheckbox('Soru_Cooldown', {
    Text = 'No Soru Cooldown',
    Default = Soru_Cooldown_Func,
    Callback = function(Value)
        Soru_Cooldown_Func = Value

        while wait() do
            OtherModules.NoSoruCooldown()
        end
    end
})

Other_Misc:AddCheckbox('Walk_ON_Water', {
    Text = 'Walk On Water',
    Default = Walk_ON_Water_Func,
    Callback = function(Value)
        Walk_ON_Water_Func = Value

        while task.wait() do
            OtherModules.WalkOnWater()
        end
    end
})

Other_Misc:AddCheckbox('Remove_Fog', {
    Text = 'Remove Fog',
    Default = Remove_Fog_Func,
    Callback = function(Value)
        Remove_Fog_Func = Value

        while task.wait() do
            OtherModules.RemoveFog()
        end
    end
})

Other_Misc:AddCheckbox('Always_Day', {
    Text = 'Always Day',
    Default = Always_Day_Func,
    Callback = function(Value)
        Always_Day_Func = Value

        while task.wait() do
            OtherModules.AlwaysDay()
        end
    end
})

Other_Misc:AddCheckbox('White_Screen', {
    Text = 'White Screen',
    Default = White_Screen_Func,
    Callback = function(Value)
        White_Screen_Func = Value
        OtherModules.WhiteScreen()
    end
})

Other_Misc:AddCheckbox('Black_Screen', {
    Text = 'Black Screen',
    Default = Black_Screen_Func,
    Callback = function(Value)
        Black_Screen_Func = Value
        OtherModules.BlackScreen()
    end
})

Other_Misc:AddButton({
    Text = "Remove Lava",
    Callback = function()
        OtherModules.RemoveLava()
    end
})

Other_Misc:AddButton({
    Text = "Pirate Team",
    Callback = function()
        Main_Module.InvokeRemote("SetTeam","Pirates")
    end
})

Other_Misc:AddButton({
    Text = "Marine Team",
    Callback = function()
        Main_Module.InvokeRemote("SetTeam","Marines")
    end
})

Other_Misc:AddButton({
    Text = "Redeem Codes",
    Callback = function()
        for index_Codes, value_Codes in OtherModules.RedeemCodes do
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value_Codes)
        end
    end
})

----------------------------------------------------//----------------------------------------------------
--// Task
task.spawn(function()
    while wait() do
        Cake_Prince_Prog:UpdateLabel(Main_Module.GetCakePrinceProgress())
        Elite_Hunter_Prog:UpdateLabel(Main_Module.GetEliteProgress())

        RaceInfo:UpdateLabel("Race : "..tostring(Player.Data.Race.Value))
        StatRefunds:UpdateLabel("Stat Refund : "..tostring(Player.Data.StatRefunds.Value))
        RaceReroll:UpdateLabel("Race Reroll : "..tostring(Player.Data.RaceRerolls.Value))
        FruitsCaps:UpdateLabel("Fruit Caps : "..tostring(Player.Data.FruitCap.Value))
        MeleePoints:UpdateLabel("Melee : "..tostring(Player.Data.Stats.Melee:WaitForChild("Level").Value))
        DefensePoints:UpdateLabel("Defense : "..tostring(Player.Data.Stats.Defense:WaitForChild("Level").Value))
        SwordPoints:UpdateLabel("Sword : "..tostring(Player.Data.Stats.Sword:WaitForChild("Level").Value))
        GunPoints:UpdateLabel("Gun : "..tostring(Player.Data.Stats.Gun:WaitForChild("Level").Value))
        FruitPoints:UpdateLabel("Blox Fruit : "..tostring(Player.Data.Stats["Demon Fruit"]:WaitForChild("Level").Value))
        PointAvaibleStat:UpdateLabel("Avaible Points : "..tostring(Player.Data.Points.Value))

        PriceOfFruit:UpdateLabel(tostring(UpdatePriceFruit()))

        Current_Bounty:UpdateLabel("Your Bounty : "..tostring(OtherModules.CurrentBounty()))
        Earned_Bounty:UpdateLabel("Earned = "..tostring(OtherModules.EarnedBounty()))
    end
end)
----------------------------------------------------//----------------------------------------------------
-- Hand the library over to our managers
SaveManager:SetLibrary(Library)

SaveManager:SetFolder('Blacktrap/Bloxfruit')
SaveManager:BuildConfigSection(Tabs.SaveManagerTab)

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

----------------------------------------------------//----------------------------------------------------
-- Function Modules
