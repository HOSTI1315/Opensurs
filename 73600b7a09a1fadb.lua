local Env = getfenv()
local var1 = wait();
local IsLoaded = game:IsLoaded();
local var2 = game:HttpGet("https://raw.githubusercontent.com/LioK251/RbScripts/refs/heads/main/lazyuhub_theforge.lua");
local var3 = loadstring(var2);
local Loaded_Var2 = var3();
local GameId = game.GameId;
local GameId_is_number = (GameId == 7671049560);
-- true, eq id 1
if not GameId_is_number then return end -- won't run
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Workspace = game:GetService("Workspace");
local RunService = game:GetService("RunService");
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage");
local Shared = ReplicatedStorage:WaitForChild("Shared");
local WaitForChild = Shared.WaitForChild;
local Packages = Shared:WaitForChild("Packages");
local WaitForChild_2 = Packages.WaitForChild;
local Knit = Packages:WaitForChild("Knit");
local WaitForChild_3 = Knit.WaitForChild;
local Services = Knit:WaitForChild("Services");
local WaitForChild_4 = Services.WaitForChild;
local ToolService = Services:WaitForChild("ToolService");
local WaitForChild_5 = ToolService.WaitForChild;
local RF = ToolService:WaitForChild("RF");
local WaitForChild_6 = RF.WaitForChild;
local StartBlock = RF:WaitForChild("StartBlock");
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage");
local Shared_2 = ReplicatedStorage:WaitForChild("Shared");
local WaitForChild_7 = Shared_2.WaitForChild;
local Packages_2 = Shared_2:WaitForChild("Packages");
local WaitForChild_8 = Packages_2.WaitForChild;
local Knit_2 = Packages_2:WaitForChild("Knit");
local WaitForChild_9 = Knit_2.WaitForChild;
local Services_2 = Knit_2:WaitForChild("Services");
local WaitForChild_10 = Services_2.WaitForChild;
local ToolService_2 = Services_2:WaitForChild("ToolService");
local WaitForChild_11 = ToolService_2.WaitForChild;
local RF_2 = ToolService_2:WaitForChild("RF");
local WaitForChild_12 = RF_2.WaitForChild;
local StopBlock = RF_2:WaitForChild("StopBlock");
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage");
local Shared_3 = ReplicatedStorage:WaitForChild("Shared");
local WaitForChild_13 = Shared_3.WaitForChild;
local Packages_3 = Shared_3:WaitForChild("Packages");
local WaitForChild_14 = Packages_3.WaitForChild;
local Knit_3 = Packages_3:WaitForChild("Knit");
local WaitForChild_15 = Knit_3.WaitForChild;
local Services_3 = Knit_3:WaitForChild("Services");
local WaitForChild_16 = Services_3.WaitForChild;
local ProximityService = Services_3:WaitForChild("ProximityService");
local WaitForChild_17 = ProximityService.WaitForChild;
local RF_3 = ProximityService:WaitForChild("RF");
local Dialogue = RF_3.Dialogue;
local LocalPlayer = Players.LocalPlayer;
local Living = workspace:WaitForChild("Living", 10);
local Rocks = workspace:WaitForChild("Rocks", 10);
local Success, Error_Message = pcall(function(...)
    local var4 = game:HttpGet("https://raw.githubusercontent.com/LioK251/RbScripts/refs/heads/main/rayfield_custom.lua");
    local var5 = loadstring(var4);
    local Loaded_Var4 = var5();
end) -- true, Loaded_Var4
local Spawned = task.spawn(function()
    local VirtualUser = game:GetService("VirtualUser");
    local var71 = cloneref(VirtualUser);

end);
local Spawned_2 = task.spawn(function()
    local getconnections = getconnections;
    if not getconnections then return end -- won't run
    local _call72 = getconnections(LocalPlayer.Idled);
    for i_12, v_12 in pairs(_call72) do
        local Disable = v_12.Disable;
        local Disable_2 = v_12:Disable();
    end

end);
getgenv().flags = {
    autotp_World1 = false,
    tweenspeed = 30,
    ores_selected = {},
    autopour = false,
    farmmethod = "Above/Below",
    selected_region = "",
    insta_tp_if = 250,
    insta_tp_cd = 5,
    auto_sell = false,
    insta_tp = false,
    webhook_url = "",
    items_selected = {},
    potions_selected = {},
    mobs_selected = {},
    skipOre_cd = 30,
    automelt = false,
    webhook_user_id = "",
    webhook_ores_selected = {},
    webhook_enabled = false,
    ore_priority = {},
    mob_closestfarm = false,
    autotp_World2 = false,
    automold = false,
    autohammer = false,
    underground_tween = true,
    ore_autofarm = false,
    meltspeed = 15,
    distance = -6,
    maxposition = 0.9,
    ore_closestfarm = false,
    minposition = 0.05,
    poursens = 0.01,
    auto_potion = false,
    sell_anywhere = false,
    walkspeed = 30,
    auto_parry = false,
    mob_autofarm = false,
    regional_ore_farm = false,
};
getgenv().current_tween = false;
getgenv().lastRespawnTime = 0;
getgenv().talkedToGreedyCey = false;
getgenv().parryAnimations = {
    ["rbxassetid://106199289601358"] = 0.433,
    ["rbxassetid://97668319966803"] = 0.3,
    ["rbxassetid://89496572417272"] = 0.44,
    ["rbxassetid://82533430458765"] = 0.37,
    ["rbxassetid://98266710251041"] = 0.25,
    ["rbxassetid://73829363877010"] = 0.43,
    ["rbxassetid://131510736644901"] = 0.4,
    ["rbxassetid://89127058244517"] = 0.59,
    ["rbxassetid://107274803323874"] = 0.93,
};
getgenv().lastReset = 0;
getgenv().isTeleporting = false;
getgenv().lastOre = nil;
getgenv().lastOreTime = 0;
getgenv().cachedOres = {};
getgenv().oreCacheTime = 0;
getgenv().lockInfo = {
    untilT = 0,
};
Env.distance_check = function(p1_0)
    local Character = LocalPlayer.Character;
    -- local _ = Character or (unknown_value)
    local Humanoid_2 = Character:FindFirstChildOfClass("Humanoid");
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart");
    local var73 = (Humanoid_2 and HumanoidRootPart); -- HumanoidRootPart
    local var74 = (Character and var73); -- HumanoidRootPart
    local var75 = (var74 and true); -- true
    local var76 = (var75 or false);
    local Not_HumanoidRootPart = not HumanoidRootPart;
    -- false
    local Not_HumanoidRootPart_2 = not HumanoidRootPart;
    -- false
    local Not_P1_0 = not p1_0;
    -- false
    local var77 = (Not_HumanoidRootPart_2 or Not_P1_0); -- false
    local Position = p1_0.Position;
    local Position_2 = HumanoidRootPart.Position;
    local var78 = Position - Position_2;
    local Magnitude = var78.Magnitude;
    local var79 = (Magnitude <= 25); -- nil
    return var79

end;
Env.parry = function(p1_0, p2_0)

end;
Env.safe_connect_parry = function(p1_0)
    local Spawned_13 = task.spawn(function()
        local WaitForChild_34 = p1_0.WaitForChild;
        local HumanoidRootPart_6 = p1_0:WaitForChild("HumanoidRootPart", 5);
        local Not_HumanoidRootPart_6 = not HumanoidRootPart_6;
        -- false
        local WaitForChild_35 = HumanoidRootPart_6.WaitForChild;
        local InfoFrame = HumanoidRootPart_6:WaitForChild("infoFrame", 5);
        local Not_InfoFrame = not InfoFrame;
        -- false
        local WaitForChild_36 = InfoFrame.WaitForChild;
        local Frame_10 = InfoFrame:WaitForChild("Frame", 5);
        local Not_Frame_10 = not Frame_10;
        -- false
        local WaitForChild_37 = Frame_10.WaitForChild;
        local RockName = Frame_10:WaitForChild("rockName", 5);
        local Not_RockName = not RockName;
        -- false
        local IsA_16 = RockName.IsA;
        local TextLabel = RockName:IsA("TextLabel");
        local Not_TextLabel = not TextLabel;
        -- false
        local var147 = (Not_RockName or Not_TextLabel); -- false
        local Text_10 = RockName.Text;
        local var148 = string.find(Text_10, "Slime")
        if not var148 then return end -- won't run
        local WaitForChild_38 = p1_0.WaitForChild;
        local Status = p1_0:WaitForChild("Status", 5);
        local Not_Status = not Status;
        -- false
        local ChildAdded_4 = Status.ChildAdded;
        local Connect_4 = ChildAdded_4.Connect;
        local Connected_4 = ChildAdded_4:Connect(function(p1_0)
            local IsA_28 = p1_0.IsA;
            local BoolValue = p1_0:IsA("BoolValue");
            local Name_55 = p1_0.Name;
            local Name_55_is_string = (Name_55 == "Attacking");
            -- false, eq id 249
            local var1421 = (BoolValue and Name_55_is_string); -- false

        end);

    end);

end;
local CreateWindow = Loaded_Var4.CreateWindow;
local Window = Loaded_Var4:CreateWindow({
    LoadingTitle = "The Forge | Lazy Hub",
    Name = "The Forge | Lazy Hub",
    DisableBuildWarnings = false,
    LoadingSubtitle = "by Lazy Hub",
    Theme = "Amber Glow",
    DisableRayfieldPrompts = false,
});
local Spawned_3 = task.spawn(function()
    local VirtualInputManager = game:GetService("VirtualInputManager");
    local var80 = cloneref(VirtualInputManager);

end);
local CreateTab = Window.CreateTab;
local Main = Window:CreateTab("Main", 0);
local CreateTab_2 = Window.CreateTab;
local Priority = Window:CreateTab("Priority", 0);
local CreateTab_3 = Window.CreateTab;
local Misc = Window:CreateTab("Misc", 0);
local CreateTab_4 = Window.CreateTab;
local Webhook = Window:CreateTab("Webhook", 0);
local CreateTab_5 = Window.CreateTab;
local Settings = Window:CreateTab("Settings", 0);
local CreateSection = Main.CreateSection;
local Farm_Settings = Main:CreateSection("Farm Settings");
local CreateSlider = Main.CreateSlider;
local Slider = Main:CreateSlider({
    Name = "Distance",
    Callback = function(p1_0)

    end,
    CurrentValue = -6,
    Increment = 0.5,
    Range = {
        -10,
        10,
    },
    Flag = "DistanceSlider",
});
local CreateSlider_2 = Main.CreateSlider;
local Slider_2 = Main:CreateSlider({
    Name = "Tween Speed",
    Callback = function(p1_0)
        local var81 = math.clamp(p1_0, 20, 150);

    end,
    CurrentValue = 30,
    Increment = 1,
    Range = {
        20,
        100,
    },
    Flag = "TweenSpeedSlider",
});
local CreateSlider_3 = Main.CreateSlider;
local Slider_3 = Main:CreateSlider({
    Name = "Instant TP if Distance >",
    Callback = function(p1_0)

    end,
    CurrentValue = 250,
    Increment = 5,
    Range = {
        100,
        500,
    },
    Flag = "InstaTPIfSlider",
});
local CreateSlider_4 = Main.CreateSlider;
local Slider_4 = Main:CreateSlider({
    Name = "Instant TP Cooldown",
    Callback = function(p1_0)

    end,
    CurrentValue = 5,
    Increment = 0.5,
    Range = {
        1,
        10,
    },
    Flag = "InstaTpCdSlider",
});
local CreateSlider_5 = Main.CreateSlider;
local Slider_5 = Main:CreateSlider({
    Name = "Skip Ore CD",
    Callback = function(p1_0)

    end,
    CurrentValue = 30,
    Increment = 1,
    Range = {
        1,
        60,
    },
    Flag = "SkipOreSlider",
});
local CreateToggle = Main.CreateToggle;
local Toggle = Main:CreateToggle({
    CurrentValue = true,
    Callback = function(p1_0)

    end,
    Name = "Underground Tween",
    Flag = "UndergroundPosToggle",
});
local CreateToggle_2 = Main.CreateToggle;
local Toggle_2 = Main:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)

    end,
    Name = "Disable Instant TP",
    Flag = "InstaTPToggle",
});
local CreateDropdown = Main.CreateDropdown;
local Dropdown = Main:CreateDropdown({
    Name = "Farm Method",
    CurrentOption = "Above/Below",
    Flag = "FarmMethodDropdown",
    MultipleOptions = false,
    Callback = function(p1_0)
        local var82 = typeof(p1_0);
        local var82_is_string = (var82 == "table");
        -- true, eq id 6
        local var83 = p1_0[1];
        local var84 = (var82_is_string and var83); -- var83
        -- local _ = var84 or (unknown_value)

    end,
    Options = {
        "Above/Below",
        "Front/Behind",
    },
});
local CreateSection_2 = Main.CreateSection;
local Mob_Farms = Main:CreateSection("Mob Farms");
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage");
local Assets = ReplicatedStorage.Assets;
local Mobs = Assets.Mobs;
local GetChildren = Mobs.GetChildren;
local Children = Mobs:GetChildren();
for i, v in ipairs(Children) do
    local IsA = v.IsA;
    local Model = v:IsA("Model");
    if not Model then return end -- won't run
    local Name = v.Name;
    local Match = Name.match;
    local D = Name:match("^(.-)%d+$");
    -- local _ = D or (unknown_value)
end
local CreateDropdown_2 = Main.CreateDropdown;
local Dropdown_2 = Main:CreateDropdown({
    Name = "Select NPCs",
    CurrentOption = {},
    Flag = "NPCDropdown",
    MultipleOptions = true,
    Callback = function(p1_0)

    end,
    Options = {
        D,
    },
});
local CreateToggle_3 = Main.CreateToggle;
local Toggle_3 = Main:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)
        local Spawned_14 = task.spawn(function()
            local Not_P1_0_4 = not p1_0;
            -- false
            local Waited_For_166 = task.wait();
            local Character_6 = LocalPlayer.Character;
            -- local _ = Character_6 or (unknown_value)
            local Humanoid_7 = Character_6:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_7 = Character_6:FindFirstChild("HumanoidRootPart");
            local var150 = (Humanoid_7 and HumanoidRootPart_7); -- HumanoidRootPart_7
            local var151 = (Character_6 and var150); -- HumanoidRootPart_7
            local var152 = (var151 and true); -- true
            local var153 = (var152 or false);
            local Len_P1_0 = #p1_0;
            local var154 = (Len_P1_0 > 0); -- nil
            local var155 = (p1_0 and var154); -- nil
            local Waited_For_167 = task.wait();
            local Character_7 = LocalPlayer.Character;
            -- local _ = Character_7 or (unknown_value)
            local Humanoid_8 = Character_7:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_8 = Character_7:FindFirstChild("HumanoidRootPart");
            local var156 = (Humanoid_8 and HumanoidRootPart_8); -- HumanoidRootPart_8
            local var157 = (Character_7 and var156); -- HumanoidRootPart_8
            local var158 = (var157 and true); -- true
            local var159 = (var158 or false);
            local Len_P1_0_2 = #p1_0;
            local var160 = (Len_P1_0_2 > 0); -- nil
            local var161 = (p1_0 and var160); -- nil
            local Waited_For_168 = task.wait();
            local Character_8 = LocalPlayer.Character;
            -- local _ = Character_8 or (unknown_value)
            local Humanoid_9 = Character_8:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_9 = Character_8:FindFirstChild("HumanoidRootPart");
            local var162 = (Humanoid_9 and HumanoidRootPart_9); -- HumanoidRootPart_9
            local var163 = (Character_8 and var162); -- HumanoidRootPart_9
            local var164 = (var163 and true); -- true
            local var165 = (var164 or false);
            local Len_P1_0_3 = #p1_0;
            local var166 = (Len_P1_0_3 > 0); -- nil
            local var167 = (p1_0 and var166); -- nil
            local Waited_For_169 = task.wait();
            local Character_9 = LocalPlayer.Character;
            -- local _ = Character_9 or (unknown_value)
            local Humanoid_10 = Character_9:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_10 = Character_9:FindFirstChild("HumanoidRootPart");
            local var168 = (Humanoid_10 and HumanoidRootPart_10); -- HumanoidRootPart_10
            local var169 = (Character_9 and var168); -- HumanoidRootPart_10
            local var170 = (var169 and true); -- true
            local var171 = (var170 or false);
            local Len_P1_0_4 = #p1_0;
            local var172 = (Len_P1_0_4 > 0); -- nil
            local var173 = (p1_0 and var172); -- nil
            local Waited_For_170 = task.wait();
            local Character_10 = LocalPlayer.Character;
            -- local _ = Character_10 or (unknown_value)
            local Humanoid_11 = Character_10:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_11 = Character_10:FindFirstChild("HumanoidRootPart");
            local var174 = (Humanoid_11 and HumanoidRootPart_11); -- HumanoidRootPart_11
            local var175 = (Character_10 and var174); -- HumanoidRootPart_11
            local var176 = (var175 and true); -- true
            local var177 = (var176 or false);
            local Len_P1_0_5 = #p1_0;
            local var178 = (Len_P1_0_5 > 0); -- nil
            local var179 = (p1_0 and var178); -- nil
            local Waited_For_171 = task.wait();
            local Character_11 = LocalPlayer.Character;
            -- local _ = Character_11 or (unknown_value)
            local Humanoid_12 = Character_11:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_12 = Character_11:FindFirstChild("HumanoidRootPart");
            local var180 = (Humanoid_12 and HumanoidRootPart_12); -- HumanoidRootPart_12
            local var181 = (Character_11 and var180); -- HumanoidRootPart_12
            local var182 = (var181 and true); -- true
            local var183 = (var182 or false);
            local Len_P1_0_6 = #p1_0;
            local var184 = (Len_P1_0_6 > 0); -- nil
            local var185 = (p1_0 and var184); -- nil
            local Waited_For_172 = task.wait();
            local Character_12 = LocalPlayer.Character;
            -- local _ = Character_12 or (unknown_value)
            local Humanoid_13 = Character_12:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_13 = Character_12:FindFirstChild("HumanoidRootPart");
            local var186 = (Humanoid_13 and HumanoidRootPart_13); -- HumanoidRootPart_13
            local var187 = (Character_12 and var186); -- HumanoidRootPart_13
            local var188 = (var187 and true); -- true
            local var189 = (var188 or false);
            local Len_P1_0_7 = #p1_0;
            local var190 = (Len_P1_0_7 > 0); -- nil
            local var191 = (p1_0 and var190); -- nil
            local Waited_For_173 = task.wait();
            local Character_13 = LocalPlayer.Character;
            -- local _ = Character_13 or (unknown_value)
            local Humanoid_14 = Character_13:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_14 = Character_13:FindFirstChild("HumanoidRootPart");
            local var192 = (Humanoid_14 and HumanoidRootPart_14); -- HumanoidRootPart_14
            local var193 = (Character_13 and var192); -- HumanoidRootPart_14
            local var194 = (var193 and true); -- true
            local var195 = (var194 or false);
            local Len_P1_0_8 = #p1_0;
            local var196 = (Len_P1_0_8 > 0); -- nil
            local var197 = (p1_0 and var196); -- nil
            local Waited_For_174 = task.wait();
            local Character_14 = LocalPlayer.Character;
            -- local _ = Character_14 or (unknown_value)
            local Humanoid_15 = Character_14:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_15 = Character_14:FindFirstChild("HumanoidRootPart");
            local var198 = (Humanoid_15 and HumanoidRootPart_15); -- HumanoidRootPart_15
            local var199 = (Character_14 and var198); -- HumanoidRootPart_15
            local var200 = (var199 and true); -- true
            local var201 = (var200 or false);
            local Len_P1_0_9 = #p1_0;
            local var202 = (Len_P1_0_9 > 0); -- nil
            local var203 = (p1_0 and var202); -- nil
            local Waited_For_175 = task.wait();
            local Character_15 = LocalPlayer.Character;
            -- local _ = Character_15 or (unknown_value)
            local Humanoid_16 = Character_15:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_16 = Character_15:FindFirstChild("HumanoidRootPart");
            local var204 = (Humanoid_16 and HumanoidRootPart_16); -- HumanoidRootPart_16
            local var205 = (Character_15 and var204); -- HumanoidRootPart_16
            local var206 = (var205 and true); -- true
            local var207 = (var206 or false);
            local Len_P1_0_10 = #p1_0;
            local var208 = (Len_P1_0_10 > 0); -- nil
            local var209 = (p1_0 and var208); -- nil
            local Waited_For_176 = task.wait();
            local Character_16 = LocalPlayer.Character;
            -- local _ = Character_16 or (unknown_value)
            local Humanoid_17 = Character_16:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_17 = Character_16:FindFirstChild("HumanoidRootPart");
            local var210 = (Humanoid_17 and HumanoidRootPart_17); -- HumanoidRootPart_17
            local var211 = (Character_16 and var210); -- HumanoidRootPart_17
            local var212 = (var211 and true); -- true
            local var213 = (var212 or false);
            local Len_P1_0_11 = #p1_0;
            local var214 = (Len_P1_0_11 > 0); -- nil
            local var215 = (p1_0 and var214); -- nil
            local Waited_For_177 = task.wait();
            local Character_17 = LocalPlayer.Character;
            -- local _ = Character_17 or (unknown_value)
            local Humanoid_18 = Character_17:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_18 = Character_17:FindFirstChild("HumanoidRootPart");
            local var216 = (Humanoid_18 and HumanoidRootPart_18); -- HumanoidRootPart_18
            local var217 = (Character_17 and var216); -- HumanoidRootPart_18
            local var218 = (var217 and true); -- true
            local var219 = (var218 or false);
            local Len_P1_0_12 = #p1_0;
            local var220 = (Len_P1_0_12 > 0); -- nil
            local var221 = (p1_0 and var220); -- nil
            local Waited_For_178 = task.wait();
            local Character_18 = LocalPlayer.Character;
            -- local _ = Character_18 or (unknown_value)
            local Humanoid_19 = Character_18:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_19 = Character_18:FindFirstChild("HumanoidRootPart");
            local var222 = (Humanoid_19 and HumanoidRootPart_19); -- HumanoidRootPart_19
            local var223 = (Character_18 and var222); -- HumanoidRootPart_19
            local var224 = (var223 and true); -- true
            local var225 = (var224 or false);
            local Len_P1_0_13 = #p1_0;
            local var226 = (Len_P1_0_13 > 0); -- nil
            local var227 = (p1_0 and var226); -- nil
            local Waited_For_179 = task.wait();
            local Character_19 = LocalPlayer.Character;
            -- local _ = Character_19 or (unknown_value)
            local Humanoid_20 = Character_19:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_20 = Character_19:FindFirstChild("HumanoidRootPart");
            local var228 = (Humanoid_20 and HumanoidRootPart_20); -- HumanoidRootPart_20
            local var229 = (Character_19 and var228); -- HumanoidRootPart_20
            local var230 = (var229 and true); -- true
            local var231 = (var230 or false);
            local Len_P1_0_14 = #p1_0;
            local var232 = (Len_P1_0_14 > 0); -- nil
            local var233 = (p1_0 and var232); -- nil
            local Waited_For_180 = task.wait();
            local Character_20 = LocalPlayer.Character;
            -- local _ = Character_20 or (unknown_value)
            local Humanoid_21 = Character_20:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_21 = Character_20:FindFirstChild("HumanoidRootPart");
            local var234 = (Humanoid_21 and HumanoidRootPart_21); -- HumanoidRootPart_21
            local var235 = (Character_20 and var234); -- HumanoidRootPart_21
            local var236 = (var235 and true); -- true
            local var237 = (var236 or false);
            local Len_P1_0_15 = #p1_0;
            local var238 = (Len_P1_0_15 > 0); -- nil
            local var239 = (p1_0 and var238); -- nil
            local Waited_For_181 = task.wait();
            local Character_21 = LocalPlayer.Character;
            -- local _ = Character_21 or (unknown_value)
            local Humanoid_22 = Character_21:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_22 = Character_21:FindFirstChild("HumanoidRootPart");
            local var240 = (Humanoid_22 and HumanoidRootPart_22); -- HumanoidRootPart_22
            local var241 = (Character_21 and var240); -- HumanoidRootPart_22
            local var242 = (var241 and true); -- true
            local var243 = (var242 or false);
            local Len_P1_0_16 = #p1_0;
            local var244 = (Len_P1_0_16 > 0); -- nil
            local var245 = (p1_0 and var244); -- nil
            local Waited_For_182 = task.wait();
            local Character_22 = LocalPlayer.Character;
            -- local _ = Character_22 or (unknown_value)
            local Humanoid_23 = Character_22:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_23 = Character_22:FindFirstChild("HumanoidRootPart");
            local var246 = (Humanoid_23 and HumanoidRootPart_23); -- HumanoidRootPart_23
            local var247 = (Character_22 and var246); -- HumanoidRootPart_23
            local var248 = (var247 and true); -- true
            local var249 = (var248 or false);
            local Len_P1_0_17 = #p1_0;
            local var250 = (Len_P1_0_17 > 0); -- nil
            local var251 = (p1_0 and var250); -- nil
            local Waited_For_183 = task.wait();
            local Character_23 = LocalPlayer.Character;
            -- local _ = Character_23 or (unknown_value)
            local Humanoid_24 = Character_23:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_24 = Character_23:FindFirstChild("HumanoidRootPart");
            local var252 = (Humanoid_24 and HumanoidRootPart_24); -- HumanoidRootPart_24
            local var253 = (Character_23 and var252); -- HumanoidRootPart_24
            local var254 = (var253 and true); -- true
            local var255 = (var254 or false);
            local Len_P1_0_18 = #p1_0;
            local var256 = (Len_P1_0_18 > 0); -- nil
            local var257 = (p1_0 and var256); -- nil
            local Waited_For_184 = task.wait();
            local Character_24 = LocalPlayer.Character;
            -- local _ = Character_24 or (unknown_value)
            local Humanoid_25 = Character_24:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_25 = Character_24:FindFirstChild("HumanoidRootPart");
            local var258 = (Humanoid_25 and HumanoidRootPart_25); -- HumanoidRootPart_25
            local var259 = (Character_24 and var258); -- HumanoidRootPart_25
            local var260 = (var259 and true); -- true
            local var261 = (var260 or false);
            local Len_P1_0_19 = #p1_0;
            local var262 = (Len_P1_0_19 > 0); -- nil
            local var263 = (p1_0 and var262); -- nil
            local Waited_For_185 = task.wait();
            local Character_25 = LocalPlayer.Character;
            -- local _ = Character_25 or (unknown_value)
            local Humanoid_26 = Character_25:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_26 = Character_25:FindFirstChild("HumanoidRootPart");
            local var264 = (Humanoid_26 and HumanoidRootPart_26); -- HumanoidRootPart_26
            local var265 = (Character_25 and var264); -- HumanoidRootPart_26
            local var266 = (var265 and true); -- true
            local var267 = (var266 or false);
            local Len_P1_0_20 = #p1_0;
            local var268 = (Len_P1_0_20 > 0); -- nil
            local var269 = (p1_0 and var268); -- nil
            local Waited_For_186 = task.wait();
            local Character_26 = LocalPlayer.Character;
            -- local _ = Character_26 or (unknown_value)
            local Humanoid_27 = Character_26:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_27 = Character_26:FindFirstChild("HumanoidRootPart");
            local var270 = (Humanoid_27 and HumanoidRootPart_27); -- HumanoidRootPart_27
            local var271 = (Character_26 and var270); -- HumanoidRootPart_27
            local var272 = (var271 and true); -- true
            local var273 = (var272 or false);
            local Len_P1_0_21 = #p1_0;
            local var274 = (Len_P1_0_21 > 0); -- nil
            local var275 = (p1_0 and var274); -- nil
            local Waited_For_187 = task.wait();
            local Character_27 = LocalPlayer.Character;
            -- local _ = Character_27 or (unknown_value)
            local Humanoid_28 = Character_27:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_28 = Character_27:FindFirstChild("HumanoidRootPart");
            local var276 = (Humanoid_28 and HumanoidRootPart_28); -- HumanoidRootPart_28
            local var277 = (Character_27 and var276); -- HumanoidRootPart_28
            local var278 = (var277 and true); -- true
            local var279 = (var278 or false);
            local Len_P1_0_22 = #p1_0;
            local var280 = (Len_P1_0_22 > 0); -- nil
            local var281 = (p1_0 and var280); -- nil
            local Waited_For_188 = task.wait();
            local Character_28 = LocalPlayer.Character;
            -- local _ = Character_28 or (unknown_value)
            local Humanoid_29 = Character_28:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_29 = Character_28:FindFirstChild("HumanoidRootPart");
            local var282 = (Humanoid_29 and HumanoidRootPart_29); -- HumanoidRootPart_29
            local var283 = (Character_28 and var282); -- HumanoidRootPart_29
            local var284 = (var283 and true); -- true
            local var285 = (var284 or false);
            local Len_P1_0_23 = #p1_0;
            local var286 = (Len_P1_0_23 > 0); -- nil
            local var287 = (p1_0 and var286); -- nil
            local Waited_For_189 = task.wait();
            local Character_29 = LocalPlayer.Character;
            -- local _ = Character_29 or (unknown_value)
            local Humanoid_30 = Character_29:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_30 = Character_29:FindFirstChild("HumanoidRootPart");
            local var288 = (Humanoid_30 and HumanoidRootPart_30); -- HumanoidRootPart_30
            local var289 = (Character_29 and var288); -- HumanoidRootPart_30
            local var290 = (var289 and true); -- true
            local var291 = (var290 or false);
            local Len_P1_0_24 = #p1_0;
            local var292 = (Len_P1_0_24 > 0); -- nil
            local var293 = (p1_0 and var292); -- nil
            local Waited_For_190 = task.wait();
            local Character_30 = LocalPlayer.Character;
            -- local _ = Character_30 or (unknown_value)
            local Humanoid_31 = Character_30:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_31 = Character_30:FindFirstChild("HumanoidRootPart");
            local var294 = (Humanoid_31 and HumanoidRootPart_31); -- HumanoidRootPart_31
            local var295 = (Character_30 and var294); -- HumanoidRootPart_31
            local var296 = (var295 and true); -- true
            local var297 = (var296 or false);
            local Len_P1_0_25 = #p1_0;
            local var298 = (Len_P1_0_25 > 0); -- nil
            local var299 = (p1_0 and var298); -- nil
            local Waited_For_191 = task.wait();
            local Character_31 = LocalPlayer.Character;
            -- local _ = Character_31 or (unknown_value)
            local Humanoid_32 = Character_31:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_32 = Character_31:FindFirstChild("HumanoidRootPart");
            local var300 = (Humanoid_32 and HumanoidRootPart_32); -- HumanoidRootPart_32
            local var301 = (Character_31 and var300); -- HumanoidRootPart_32
            local var302 = (var301 and true); -- true
            local var303 = (var302 or false);
            local Len_P1_0_26 = #p1_0;
            local var304 = (Len_P1_0_26 > 0); -- nil
            local var305 = (p1_0 and var304); -- nil
            local Waited_For_192 = task.wait();
            local Character_32 = LocalPlayer.Character;
            -- local _ = Character_32 or (unknown_value)
            error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

        end);

    end,
    Name = "Farm NPC",
    Flag = "FarmNPCToggle",
});
local CreateToggle_4 = Main.CreateToggle;
local Toggle_4 = Main:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)
        local Spawned_15 = task.spawn(function()
            local Not_P1_0_5 = not p1_0;
            -- false
            local Waited_For_193 = task.wait();
            local Character_33 = LocalPlayer.Character;
            -- local _ = Character_33 or (unknown_value)
            local Humanoid_33 = Character_33:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_33 = Character_33:FindFirstChild("HumanoidRootPart");
            local var306 = (Humanoid_33 and HumanoidRootPart_33); -- HumanoidRootPart_33
            local var307 = (Character_33 and var306); -- HumanoidRootPart_33
            local var308 = (var307 and true); -- true
            local var309 = (var308 or false);
            local var310 = os.clock();
            local Getgenv_LockInfo = getgenv().lockInfo;
            local Not_Living = not Living;
            -- false
            local Character_34 = LocalPlayer.Character;
            -- local _ = Character_34 or (unknown_value)
            local Humanoid_34 = Character_34:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_34 = Character_34:FindFirstChild("HumanoidRootPart");
            local var311 = (Humanoid_34 and HumanoidRootPart_34); -- HumanoidRootPart_34
            local var312 = (Character_34 and var311); -- HumanoidRootPart_34
            local var313 = (var312 and true); -- true
            local var314 = (var313 or false);
            local Position_6 = HumanoidRootPart_34.Position;
            local GetChildren_14 = Living.GetChildren;
            local Children_17 = Living:GetChildren();
            for i_18, v_18 in ipairs(Children_17) do
                local FindFirstChild_7 = v_18.FindFirstChild;
                local HumanoidRootPart_35 = v_18:FindFirstChild("HumanoidRootPart");
                local FindFirstChildOfClass = v_18.FindFirstChildOfClass;
                local Humanoid_35 = v_18:FindFirstChildOfClass("Humanoid");
                local FindFirstChild_8 = v_18.FindFirstChild;
                local Head = v_18:FindFirstChild("Head");
                local Health = Humanoid_35.Health;
                local var315 = (Health > 0); -- nil
                -- local _ = var315 and (unknown_value)
                local var316 = (Head and nil); -- nil
                local var317 = (Humanoid_35 and var316); -- nil
                local var318 = (HumanoidRootPart_35 and var317); -- nil
            end
            getgenv().npcfound = false;
            local Waited_For_194 = task.wait();
            local Character_35 = LocalPlayer.Character;
            -- local _ = Character_35 or (unknown_value)
            local Humanoid_36 = Character_35:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_36 = Character_35:FindFirstChild("HumanoidRootPart");
            local var319 = (Humanoid_36 and HumanoidRootPart_36); -- HumanoidRootPart_36
            local var320 = (Character_35 and var319); -- HumanoidRootPart_36
            local var321 = (var320 and true); -- true
            local var322 = (var321 or false);
            local var323 = os.clock();
            local Getgenv_LockInfo_2 = getgenv().lockInfo;
            local Not_Living_2 = not Living;
            -- false
            local Character_36 = LocalPlayer.Character;
            -- local _ = Character_36 or (unknown_value)
            local Humanoid_37 = Character_36:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_37 = Character_36:FindFirstChild("HumanoidRootPart");
            local var324 = (Humanoid_37 and HumanoidRootPart_37); -- HumanoidRootPart_37
            local var325 = (Character_36 and var324); -- HumanoidRootPart_37
            local var326 = (var325 and true); -- true
            local var327 = (var326 or false);
            local Position_7 = HumanoidRootPart_37.Position;
            local GetChildren_15 = Living.GetChildren;
            local Children_18 = Living:GetChildren();
            for i_19, v_19 in ipairs(Children_18) do
                local FindFirstChild_9 = v_19.FindFirstChild;
                local HumanoidRootPart_38 = v_19:FindFirstChild("HumanoidRootPart");
                local FindFirstChildOfClass_2 = v_19.FindFirstChildOfClass;
                local Humanoid_38 = v_19:FindFirstChildOfClass("Humanoid");
                local FindFirstChild_10 = v_19.FindFirstChild;
                local Head_2 = v_19:FindFirstChild("Head");
                local Health_2 = Humanoid_38.Health;
                local var328 = (Health_2 > 0); -- nil
                -- local _ = var328 and (unknown_value)
                local var329 = (Head_2 and nil); -- nil
                local var330 = (Humanoid_38 and var329); -- nil
                local var331 = (HumanoidRootPart_38 and var330); -- nil
            end
            getgenv().npcfound = false;
            local Waited_For_195 = task.wait();
            local Character_37 = LocalPlayer.Character;
            -- local _ = Character_37 or (unknown_value)
            local Humanoid_39 = Character_37:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_39 = Character_37:FindFirstChild("HumanoidRootPart");
            local var332 = (Humanoid_39 and HumanoidRootPart_39); -- HumanoidRootPart_39
            local var333 = (Character_37 and var332); -- HumanoidRootPart_39
            local var334 = (var333 and true); -- true
            local var335 = (var334 or false);
            local var336 = os.clock();
            local Getgenv_LockInfo_3 = getgenv().lockInfo;
            local Not_Living_3 = not Living;
            -- false
            local Character_38 = LocalPlayer.Character;
            -- local _ = Character_38 or (unknown_value)
            local Humanoid_40 = Character_38:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_40 = Character_38:FindFirstChild("HumanoidRootPart");
            local var337 = (Humanoid_40 and HumanoidRootPart_40); -- HumanoidRootPart_40
            local var338 = (Character_38 and var337); -- HumanoidRootPart_40
            local var339 = (var338 and true); -- true
            local var340 = (var339 or false);
            local Position_8 = HumanoidRootPart_40.Position;
            local GetChildren_16 = Living.GetChildren;
            local Children_19 = Living:GetChildren();
            for i_20, v_20 in ipairs(Children_19) do
                local FindFirstChild_11 = v_20.FindFirstChild;
                local HumanoidRootPart_41 = v_20:FindFirstChild("HumanoidRootPart");
                local FindFirstChildOfClass_3 = v_20.FindFirstChildOfClass;
                local Humanoid_41 = v_20:FindFirstChildOfClass("Humanoid");
                local FindFirstChild_12 = v_20.FindFirstChild;
                local Head_3 = v_20:FindFirstChild("Head");
                local Health_3 = Humanoid_41.Health;
                local var341 = (Health_3 > 0); -- nil
                -- local _ = var341 and (unknown_value)
                local var342 = (Head_3 and nil); -- nil
                local var343 = (Humanoid_41 and var342); -- nil
                local var344 = (HumanoidRootPart_41 and var343); -- nil
            end
            getgenv().npcfound = false;
            local Waited_For_196 = task.wait();
            local Character_39 = LocalPlayer.Character;
            -- local _ = Character_39 or (unknown_value)
            local Humanoid_42 = Character_39:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_42 = Character_39:FindFirstChild("HumanoidRootPart");
            local var345 = (Humanoid_42 and HumanoidRootPart_42); -- HumanoidRootPart_42
            local var346 = (Character_39 and var345); -- HumanoidRootPart_42
            local var347 = (var346 and true); -- true
            local var348 = (var347 or false);
            local var349 = os.clock();
            local Getgenv_LockInfo_4 = getgenv().lockInfo;
            local Not_Living_4 = not Living;
            -- false
            local Character_40 = LocalPlayer.Character;
            -- local _ = Character_40 or (unknown_value)
            local Humanoid_43 = Character_40:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_43 = Character_40:FindFirstChild("HumanoidRootPart");
            local var350 = (Humanoid_43 and HumanoidRootPart_43); -- HumanoidRootPart_43
            local var351 = (Character_40 and var350); -- HumanoidRootPart_43
            local var352 = (var351 and true); -- true
            local var353 = (var352 or false);
            local Position_9 = HumanoidRootPart_43.Position;
            local GetChildren_17 = Living.GetChildren;
            local Children_20 = Living:GetChildren();
            for i_21, v_21 in ipairs(Children_20) do
                local FindFirstChild_13 = v_21.FindFirstChild;
                local HumanoidRootPart_44 = v_21:FindFirstChild("HumanoidRootPart");
                local FindFirstChildOfClass_4 = v_21.FindFirstChildOfClass;
                local Humanoid_44 = v_21:FindFirstChildOfClass("Humanoid");
                local FindFirstChild_14 = v_21.FindFirstChild;
                local Head_4 = v_21:FindFirstChild("Head");
                local Health_4 = Humanoid_44.Health;
                local var354 = (Health_4 > 0); -- nil
                -- local _ = var354 and (unknown_value)
                local var355 = (Head_4 and nil); -- nil
                local var356 = (Humanoid_44 and var355); -- nil
                local var357 = (HumanoidRootPart_44 and var356); -- nil
            end
            getgenv().npcfound = false;
            local Waited_For_197 = task.wait();
            local Character_41 = LocalPlayer.Character;
            -- local _ = Character_41 or (unknown_value)
            local Humanoid_45 = Character_41:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_45 = Character_41:FindFirstChild("HumanoidRootPart");
            local var358 = (Humanoid_45 and HumanoidRootPart_45); -- HumanoidRootPart_45
            local var359 = (Character_41 and var358); -- HumanoidRootPart_45
            local var360 = (var359 and true); -- true
            local var361 = (var360 or false);
            local var362 = os.clock();
            local Getgenv_LockInfo_5 = getgenv().lockInfo;
            local Not_Living_5 = not Living;
            -- false
            local Character_42 = LocalPlayer.Character;
            -- local _ = Character_42 or (unknown_value)
            local Humanoid_46 = Character_42:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_46 = Character_42:FindFirstChild("HumanoidRootPart");
            local var363 = (Humanoid_46 and HumanoidRootPart_46); -- HumanoidRootPart_46
            local var364 = (Character_42 and var363); -- HumanoidRootPart_46
            local var365 = (var364 and true); -- true
            local var366 = (var365 or false);
            local Position_10 = HumanoidRootPart_46.Position;
            local GetChildren_18 = Living.GetChildren;
            local Children_21 = Living:GetChildren();
            for i_22, v_22 in ipairs(Children_21) do
                local FindFirstChild_15 = v_22.FindFirstChild;
                local HumanoidRootPart_47 = v_22:FindFirstChild("HumanoidRootPart");
                local FindFirstChildOfClass_5 = v_22.FindFirstChildOfClass;
                local Humanoid_47 = v_22:FindFirstChildOfClass("Humanoid");
                local FindFirstChild_16 = v_22.FindFirstChild;
                local Head_5 = v_22:FindFirstChild("Head");
                local Health_5 = Humanoid_47.Health;
                local var367 = (Health_5 > 0); -- nil
                -- local _ = var367 and (unknown_value)
                local var368 = (Head_5 and nil); -- nil
                local var369 = (Humanoid_47 and var368); -- nil
                local var370 = (HumanoidRootPart_47 and var369); -- nil
            end
            getgenv().npcfound = false;
            local Waited_For_198 = task.wait();
            local Character_43 = LocalPlayer.Character;
            -- local _ = Character_43 or (unknown_value)
            local Humanoid_48 = Character_43:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_48 = Character_43:FindFirstChild("HumanoidRootPart");
            local var371 = (Humanoid_48 and HumanoidRootPart_48); -- HumanoidRootPart_48
            local var372 = (Character_43 and var371); -- HumanoidRootPart_48
            local var373 = (var372 and true); -- true
            local var374 = (var373 or false);
            local var375 = os.clock();
            local Getgenv_LockInfo_6 = getgenv().lockInfo;
            local Not_Living_6 = not Living;
            -- false
            local Character_44 = LocalPlayer.Character;
            -- local _ = Character_44 or (unknown_value)
            local Humanoid_49 = Character_44:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_49 = Character_44:FindFirstChild("HumanoidRootPart");
            local var376 = (Humanoid_49 and HumanoidRootPart_49); -- HumanoidRootPart_49
            local var377 = (Character_44 and var376); -- HumanoidRootPart_49
            local var378 = (var377 and true); -- true
            local var379 = (var378 or false);
            local Position_11 = HumanoidRootPart_49.Position;
            local GetChildren_19 = Living.GetChildren;
            local Children_22 = Living:GetChildren();
            for i_23, v_23 in ipairs(Children_22) do
                local FindFirstChild_17 = v_23.FindFirstChild;
                local HumanoidRootPart_50 = v_23:FindFirstChild("HumanoidRootPart");
                local FindFirstChildOfClass_6 = v_23.FindFirstChildOfClass;
                local Humanoid_50 = v_23:FindFirstChildOfClass("Humanoid");
                local FindFirstChild_18 = v_23.FindFirstChild;
                local Head_6 = v_23:FindFirstChild("Head");
                local Health_6 = Humanoid_50.Health;
                local var380 = (Health_6 > 0); -- nil
                -- local _ = var380 and (unknown_value)
                local var381 = (Head_6 and nil); -- nil
                local var382 = (Humanoid_50 and var381); -- nil
                local var383 = (HumanoidRootPart_50 and var382); -- nil
            end
            getgenv().npcfound = false;
            local Waited_For_199 = task.wait();
            local Character_45 = LocalPlayer.Character;
            -- local _ = Character_45 or (unknown_value)
            local Humanoid_51 = Character_45:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_51 = Character_45:FindFirstChild("HumanoidRootPart");
            local var384 = (Humanoid_51 and HumanoidRootPart_51); -- HumanoidRootPart_51
            local var385 = (Character_45 and var384); -- HumanoidRootPart_51
            local var386 = (var385 and true); -- true
            local var387 = (var386 or false);
            local var388 = os.clock();
            local Getgenv_LockInfo_7 = getgenv().lockInfo;
            local Not_Living_7 = not Living;
            -- false
            local Character_46 = LocalPlayer.Character;
            -- local _ = Character_46 or (unknown_value)
            local Humanoid_52 = Character_46:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_52 = Character_46:FindFirstChild("HumanoidRootPart");
            local var389 = (Humanoid_52 and HumanoidRootPart_52); -- HumanoidRootPart_52
            local var390 = (Character_46 and var389); -- HumanoidRootPart_52
            local var391 = (var390 and true); -- true
            local var392 = (var391 or false);
            local Position_12 = HumanoidRootPart_52.Position;
            local GetChildren_20 = Living.GetChildren;
            local Children_23 = Living:GetChildren();
            for i_24, v_24 in ipairs(Children_23) do
                local FindFirstChild_19 = v_24.FindFirstChild;
                local HumanoidRootPart_53 = v_24:FindFirstChild("HumanoidRootPart");
                local FindFirstChildOfClass_7 = v_24.FindFirstChildOfClass;
                local Humanoid_53 = v_24:FindFirstChildOfClass("Humanoid");
                local FindFirstChild_20 = v_24.FindFirstChild;
                local Head_7 = v_24:FindFirstChild("Head");
                local Health_7 = Humanoid_53.Health;
                local var393 = (Health_7 > 0); -- nil
                -- local _ = var393 and (unknown_value)
                local var394 = (Head_7 and nil); -- nil
                local var395 = (Humanoid_53 and var394); -- nil
                local var396 = (HumanoidRootPart_53 and var395); -- nil
            end
            getgenv().npcfound = false;
            local Waited_For_200 = task.wait();
            local Character_47 = LocalPlayer.Character;
            -- local _ = Character_47 or (unknown_value)
            local Humanoid_54 = Character_47:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_54 = Character_47:FindFirstChild("HumanoidRootPart");
            local var397 = (Humanoid_54 and HumanoidRootPart_54); -- HumanoidRootPart_54
            local var398 = (Character_47 and var397); -- HumanoidRootPart_54
            local var399 = (var398 and true); -- true
            local var400 = (var399 or false);
            local var401 = os.clock();
            local Getgenv_LockInfo_8 = getgenv().lockInfo;
            local Not_Living_8 = not Living;
            -- false
            local Character_48 = LocalPlayer.Character;
            -- local _ = Character_48 or (unknown_value)
            local Humanoid_55 = Character_48:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_55 = Character_48:FindFirstChild("HumanoidRootPart");
            local var402 = (Humanoid_55 and HumanoidRootPart_55); -- HumanoidRootPart_55
            local var403 = (Character_48 and var402); -- HumanoidRootPart_55
            local var404 = (var403 and true); -- true
            local var405 = (var404 or false);
            local Position_13 = HumanoidRootPart_55.Position;
            local GetChildren_21 = Living.GetChildren;
            local Children_24 = Living:GetChildren();
            for i_25, v_25 in ipairs(Children_24) do
                local FindFirstChild_21 = v_25.FindFirstChild;
                local HumanoidRootPart_56 = v_25:FindFirstChild("HumanoidRootPart");
                local FindFirstChildOfClass_8 = v_25.FindFirstChildOfClass;
                local Humanoid_56 = v_25:FindFirstChildOfClass("Humanoid");
                local FindFirstChild_22 = v_25.FindFirstChild;
                local Head_8 = v_25:FindFirstChild("Head");
                local Health_8 = Humanoid_56.Health;
                local var406 = (Health_8 > 0); -- nil
                -- local _ = var406 and (unknown_value)
                local var407 = (Head_8 and nil); -- nil
                local var408 = (Humanoid_56 and var407); -- nil
                local var409 = (HumanoidRootPart_56 and var408); -- nil
            end
            getgenv().npcfound = false;
            local Waited_For_201 = task.wait();
            local Character_49 = LocalPlayer.Character;
            -- local _ = Character_49 or (unknown_value)
            local Humanoid_57 = Character_49:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_57 = Character_49:FindFirstChild("HumanoidRootPart");
            local var410 = (Humanoid_57 and HumanoidRootPart_57); -- HumanoidRootPart_57
            local var411 = (Character_49 and var410); -- HumanoidRootPart_57
            local var412 = (var411 and true); -- true
            local var413 = (var412 or false);
            local var414 = os.clock();
            local Getgenv_LockInfo_9 = getgenv().lockInfo;
            local Not_Living_9 = not Living;
            -- false
            local Character_50 = LocalPlayer.Character;
            -- local _ = Character_50 or (unknown_value)
            local Humanoid_58 = Character_50:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_58 = Character_50:FindFirstChild("HumanoidRootPart");
            local var415 = (Humanoid_58 and HumanoidRootPart_58); -- HumanoidRootPart_58
            local var416 = (Character_50 and var415); -- HumanoidRootPart_58
            local var417 = (var416 and true); -- true
            local var418 = (var417 or false);
            local Position_14 = HumanoidRootPart_58.Position;
            local GetChildren_22 = Living.GetChildren;
            local Children_25 = Living:GetChildren();
            for i_26, v_26 in ipairs(Children_25) do
                local FindFirstChild_23 = v_26.FindFirstChild;
                local HumanoidRootPart_59 = v_26:FindFirstChild("HumanoidRootPart");
                local FindFirstChildOfClass_9 = v_26.FindFirstChildOfClass;
                local Humanoid_59 = v_26:FindFirstChildOfClass("Humanoid");
                local FindFirstChild_24 = v_26.FindFirstChild;
                local Head_9 = v_26:FindFirstChild("Head");
                local Health_9 = Humanoid_59.Health;
                local var419 = (Health_9 > 0); -- nil
                -- local _ = var419 and (unknown_value)
                local var420 = (Head_9 and nil); -- nil
                local var421 = (Humanoid_59 and var420); -- nil
                local var422 = (HumanoidRootPart_59 and var421); -- nil
            end
            getgenv().npcfound = false;
            local Waited_For_202 = task.wait();
            local Character_51 = LocalPlayer.Character;
            -- local _ = Character_51 or (unknown_value)
            local Humanoid_60 = Character_51:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_60 = Character_51:FindFirstChild("HumanoidRootPart");
            local var423 = (Humanoid_60 and HumanoidRootPart_60); -- HumanoidRootPart_60
            local var424 = (Character_51 and var423); -- HumanoidRootPart_60
            local var425 = (var424 and true); -- true
            local var426 = (var425 or false);
            local var427 = os.clock();
            local Getgenv_LockInfo_10 = getgenv().lockInfo;
            local Not_Living_10 = not Living;
            -- false
            local Character_52 = LocalPlayer.Character;
            -- local _ = Character_52 or (unknown_value)
            local Humanoid_61 = Character_52:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_61 = Character_52:FindFirstChild("HumanoidRootPart");
            local var428 = (Humanoid_61 and HumanoidRootPart_61); -- HumanoidRootPart_61
            local var429 = (Character_52 and var428); -- HumanoidRootPart_61
            local var430 = (var429 and true); -- true
            local var431 = (var430 or false);
            local Position_15 = HumanoidRootPart_61.Position;
            local GetChildren_23 = Living.GetChildren;
            local Children_26 = Living:GetChildren();
            for i_27, v_27 in ipairs(Children_26) do
                local FindFirstChild_25 = v_27.FindFirstChild;
                local HumanoidRootPart_62 = v_27:FindFirstChild("HumanoidRootPart");
                local FindFirstChildOfClass_10 = v_27.FindFirstChildOfClass;
                local Humanoid_62 = v_27:FindFirstChildOfClass("Humanoid");
                local FindFirstChild_26 = v_27.FindFirstChild;
                local Head_10 = v_27:FindFirstChild("Head");
                local Health_10 = Humanoid_62.Health;
                local var432 = (Health_10 > 0); -- nil
                -- local _ = var432 and (unknown_value)
                local var433 = (Head_10 and nil); -- nil
                local var434 = (Humanoid_62 and var433); -- nil
                local var435 = (HumanoidRootPart_62 and var434); -- nil
            end
            getgenv().npcfound = false;
            local Waited_For_203 = task.wait();
            local Character_53 = LocalPlayer.Character;
            -- local _ = Character_53 or (unknown_value)
            local Humanoid_63 = Character_53:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_63 = Character_53:FindFirstChild("HumanoidRootPart");
            local var436 = (Humanoid_63 and HumanoidRootPart_63); -- HumanoidRootPart_63
            error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

        end);

    end,
    Name = "Closest NPC Farm",
    Flag = "ClosestNPCToggle",
});
local CreateSection_3 = Main.CreateSection;
local Ore_Farms = Main:CreateSection("Ore Farms");
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage");
local Assets_2 = ReplicatedStorage.Assets;
local Rocks_2 = Assets_2.Rocks;
local GetChildren_2 = Rocks_2.GetChildren;
local Children_2 = Rocks_2:GetChildren();
for i_2, v_2 in ipairs(Children_2) do
    local IsA_2 = v_2.IsA;
    local Model_2 = v_2:IsA("Model");
    if not Model_2 then return end -- won't run
    local Name_2 = v_2.Name;
    local Match_2 = Name_2.match;
    local D_2 = Name_2:match("^(.-)%d+$");
    -- local _ = D_2 or (unknown_value)
end
local CreateDropdown_3 = Main.CreateDropdown;
local Dropdown_3 = Main:CreateDropdown({
    Name = "Select Ore(s)",
    CurrentOption = {},
    Flag = "OreDropdown",
    MultipleOptions = true,
    Callback = function(p1_0)

    end,
    Options = {
        D_2,
    },
});
local CreateToggle_5 = Main.CreateToggle;
local Toggle_5 = Main:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)
        local Spawned_16 = task.spawn(function()
            local Not_P1_0_6 = not p1_0;
            -- false
            local Waited_For_204 = task.wait();
            local Character_54 = LocalPlayer.Character;
            -- local _ = Character_54 or (unknown_value)
            local Humanoid_64 = Character_54:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_64 = Character_54:FindFirstChild("HumanoidRootPart");
            local var437 = (Humanoid_64 and HumanoidRootPart_64); -- HumanoidRootPart_64
            local var438 = (Character_54 and var437); -- HumanoidRootPart_64
            local var439 = (var438 and true); -- true
            local var440 = (var439 or false);
            local Getgenv_Current_Tween_2 = getgenv().current_tween;
            local Character_55 = LocalPlayer.Character;
            -- local _ = Character_55 or (unknown_value)
            local Humanoid_65 = Character_55:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_65 = Character_55:FindFirstChild("HumanoidRootPart");
            local var441 = (Humanoid_65 and HumanoidRootPart_65); -- HumanoidRootPart_65
            local var442 = (Character_55 and var441); -- HumanoidRootPart_65
            local var443 = (var442 and true); -- true
            local var444 = (var443 or false);
            local Position_16 = HumanoidRootPart_65.Position;
            local var445 = tick();
            local Getgenv_OreCacheTime = getgenv().oreCacheTime;
            local var446 = var445 - 0;
            -- 1767089557.847771
            local var447 = (var446 < 0.5); -- false
            -- local _ = var447 and (unknown_value)
            local GetChildren_24 = Rocks.GetChildren;
            local Children_27 = Rocks:GetChildren();
            for i_28, v_28 in ipairs(Children_27) do
                local GetChildren_25 = v_28.GetChildren;
                local Children_28 = v_28:GetChildren();
                for i_29, v_29 in ipairs(Children_28) do
                    local GetAttribute_2 = v_29.GetAttribute;
                    local IsOccupied = v_29:GetAttribute("IsOccupied");
                    local FindFirstChildWhichIsA = v_29.FindFirstChildWhichIsA;
                    local Model_13 = v_29:FindFirstChildWhichIsA("Model");
                    local var448 = (IsOccupied and Model_13); -- Model_13
                    if not var448 then return end -- won't run
                    local FindFirstChildWhichIsA_2 = v_29.FindFirstChildWhichIsA;
                    local Model_14 = v_29:FindFirstChildWhichIsA("Model");
                end
            end
            getgenv().cachedOres = {
                Model_14,
            };
            getgenv().oreCacheTime = var445;
            local GetAttribute_3 = Model_14.GetAttribute;
            local Someone = Model_14:GetAttribute("Someone");
            if not Someone then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_205 = task.wait();
            local Character_56 = LocalPlayer.Character;
            -- local _ = Character_56 or (unknown_value)
            local Humanoid_66 = Character_56:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_66 = Character_56:FindFirstChild("HumanoidRootPart");
            local var449 = (Humanoid_66 and HumanoidRootPart_66); -- HumanoidRootPart_66
            local var450 = (Character_56 and var449); -- HumanoidRootPart_66
            local var451 = (var450 and true); -- true
            local var452 = (var451 or false);
            local Getgenv_Current_Tween_3 = getgenv().current_tween;
            local Character_57 = LocalPlayer.Character;
            -- local _ = Character_57 or (unknown_value)
            local Humanoid_67 = Character_57:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_67 = Character_57:FindFirstChild("HumanoidRootPart");
            local var453 = (Humanoid_67 and HumanoidRootPart_67); -- HumanoidRootPart_67
            local var454 = (Character_57 and var453); -- HumanoidRootPart_67
            local var455 = (var454 and true); -- true
            local var456 = (var455 or false);
            local Position_17 = HumanoidRootPart_67.Position;
            local var457 = tick();
            local Getgenv_OreCacheTime_2 = getgenv().oreCacheTime;
            local var458 = var457 - var445;
            -- 0.023565
            local var459 = (var458 < 0.5); -- true
            local Getgenv_CachedOres = getgenv().cachedOres;
            local var460 = (var459 and true); -- true
            if not var460 then return end -- won't run
            local Getgenv_CachedOres_2 = getgenv().cachedOres;
            local GetAttribute_4 = Model_14.GetAttribute;
            local Someone_2 = Model_14:GetAttribute("Someone");
            if not Someone_2 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_206 = task.wait();
            local Character_58 = LocalPlayer.Character;
            -- local _ = Character_58 or (unknown_value)
            local Humanoid_68 = Character_58:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_68 = Character_58:FindFirstChild("HumanoidRootPart");
            local var461 = (Humanoid_68 and HumanoidRootPart_68); -- HumanoidRootPart_68
            local var462 = (Character_58 and var461); -- HumanoidRootPart_68
            local var463 = (var462 and true); -- true
            local var464 = (var463 or false);
            local Getgenv_Current_Tween_4 = getgenv().current_tween;
            local Character_59 = LocalPlayer.Character;
            -- local _ = Character_59 or (unknown_value)
            local Humanoid_69 = Character_59:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_69 = Character_59:FindFirstChild("HumanoidRootPart");
            local var465 = (Humanoid_69 and HumanoidRootPart_69); -- HumanoidRootPart_69
            local var466 = (Character_59 and var465); -- HumanoidRootPart_69
            local var467 = (var466 and true); -- true
            local var468 = (var467 or false);
            local Position_18 = HumanoidRootPart_69.Position;
            local var469 = tick();
            local Getgenv_OreCacheTime_3 = getgenv().oreCacheTime;
            local var470 = var469 - var445;
            -- 0.042397
            local var471 = (var470 < 0.5); -- true
            local Getgenv_CachedOres_3 = getgenv().cachedOres;
            local var472 = (var471 and true); -- true
            if not var472 then return end -- won't run
            local Getgenv_CachedOres_4 = getgenv().cachedOres;
            local GetAttribute_5 = Model_14.GetAttribute;
            local Someone_3 = Model_14:GetAttribute("Someone");
            if not Someone_3 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_207 = task.wait();
            local Character_60 = LocalPlayer.Character;
            -- local _ = Character_60 or (unknown_value)
            local Humanoid_70 = Character_60:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_70 = Character_60:FindFirstChild("HumanoidRootPart");
            local var473 = (Humanoid_70 and HumanoidRootPart_70); -- HumanoidRootPart_70
            local var474 = (Character_60 and var473); -- HumanoidRootPart_70
            local var475 = (var474 and true); -- true
            local var476 = (var475 or false);
            local Getgenv_Current_Tween_5 = getgenv().current_tween;
            local Character_61 = LocalPlayer.Character;
            -- local _ = Character_61 or (unknown_value)
            local Humanoid_71 = Character_61:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_71 = Character_61:FindFirstChild("HumanoidRootPart");
            local var477 = (Humanoid_71 and HumanoidRootPart_71); -- HumanoidRootPart_71
            local var478 = (Character_61 and var477); -- HumanoidRootPart_71
            local var479 = (var478 and true); -- true
            local var480 = (var479 or false);
            local Position_19 = HumanoidRootPart_71.Position;
            local var481 = tick();
            local Getgenv_OreCacheTime_4 = getgenv().oreCacheTime;
            local var482 = var481 - var445;
            -- 0.060596
            local var483 = (var482 < 0.5); -- true
            local Getgenv_CachedOres_5 = getgenv().cachedOres;
            local var484 = (var483 and true); -- true
            if not var484 then return end -- won't run
            local Getgenv_CachedOres_6 = getgenv().cachedOres;
            local GetAttribute_6 = Model_14.GetAttribute;
            local Someone_4 = Model_14:GetAttribute("Someone");
            if not Someone_4 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_208 = task.wait();
            local Character_62 = LocalPlayer.Character;
            -- local _ = Character_62 or (unknown_value)
            local Humanoid_72 = Character_62:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_72 = Character_62:FindFirstChild("HumanoidRootPart");
            local var485 = (Humanoid_72 and HumanoidRootPart_72); -- HumanoidRootPart_72
            local var486 = (Character_62 and var485); -- HumanoidRootPart_72
            local var487 = (var486 and true); -- true
            local var488 = (var487 or false);
            local Getgenv_Current_Tween_6 = getgenv().current_tween;
            local Character_63 = LocalPlayer.Character;
            -- local _ = Character_63 or (unknown_value)
            local Humanoid_73 = Character_63:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_73 = Character_63:FindFirstChild("HumanoidRootPart");
            local var489 = (Humanoid_73 and HumanoidRootPart_73); -- HumanoidRootPart_73
            local var490 = (Character_63 and var489); -- HumanoidRootPart_73
            local var491 = (var490 and true); -- true
            local var492 = (var491 or false);
            local Position_20 = HumanoidRootPart_73.Position;
            local var493 = tick();
            local Getgenv_OreCacheTime_5 = getgenv().oreCacheTime;
            local var494 = var493 - var445;
            -- 0.078918
            local var495 = (var494 < 0.5); -- true
            local Getgenv_CachedOres_7 = getgenv().cachedOres;
            local var496 = (var495 and true); -- true
            if not var496 then return end -- won't run
            local Getgenv_CachedOres_8 = getgenv().cachedOres;
            local GetAttribute_7 = Model_14.GetAttribute;
            local Someone_5 = Model_14:GetAttribute("Someone");
            if not Someone_5 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_209 = task.wait();
            local Character_64 = LocalPlayer.Character;
            -- local _ = Character_64 or (unknown_value)
            local Humanoid_74 = Character_64:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_74 = Character_64:FindFirstChild("HumanoidRootPart");
            local var497 = (Humanoid_74 and HumanoidRootPart_74); -- HumanoidRootPart_74
            local var498 = (Character_64 and var497); -- HumanoidRootPart_74
            local var499 = (var498 and true); -- true
            local var500 = (var499 or false);
            local Getgenv_Current_Tween_7 = getgenv().current_tween;
            local Character_65 = LocalPlayer.Character;
            -- local _ = Character_65 or (unknown_value)
            local Humanoid_75 = Character_65:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_75 = Character_65:FindFirstChild("HumanoidRootPart");
            local var501 = (Humanoid_75 and HumanoidRootPart_75); -- HumanoidRootPart_75
            local var502 = (Character_65 and var501); -- HumanoidRootPart_75
            local var503 = (var502 and true); -- true
            local var504 = (var503 or false);
            local Position_21 = HumanoidRootPart_75.Position;
            local var505 = tick();
            local Getgenv_OreCacheTime_6 = getgenv().oreCacheTime;
            local var506 = var505 - var445;
            -- 0.097688
            local var507 = (var506 < 0.5); -- true
            local Getgenv_CachedOres_9 = getgenv().cachedOres;
            local var508 = (var507 and true); -- true
            if not var508 then return end -- won't run
            local Getgenv_CachedOres_10 = getgenv().cachedOres;
            local GetAttribute_8 = Model_14.GetAttribute;
            local Someone_6 = Model_14:GetAttribute("Someone");
            if not Someone_6 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_210 = task.wait();
            local Character_66 = LocalPlayer.Character;
            -- local _ = Character_66 or (unknown_value)
            local Humanoid_76 = Character_66:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_76 = Character_66:FindFirstChild("HumanoidRootPart");
            local var509 = (Humanoid_76 and HumanoidRootPart_76); -- HumanoidRootPart_76
            local var510 = (Character_66 and var509); -- HumanoidRootPart_76
            local var511 = (var510 and true); -- true
            local var512 = (var511 or false);
            local Getgenv_Current_Tween_8 = getgenv().current_tween;
            local Character_67 = LocalPlayer.Character;
            -- local _ = Character_67 or (unknown_value)
            local Humanoid_77 = Character_67:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_77 = Character_67:FindFirstChild("HumanoidRootPart");
            local var513 = (Humanoid_77 and HumanoidRootPart_77); -- HumanoidRootPart_77
            local var514 = (Character_67 and var513); -- HumanoidRootPart_77
            local var515 = (var514 and true); -- true
            local var516 = (var515 or false);
            local Position_22 = HumanoidRootPart_77.Position;
            local var517 = tick();
            local Getgenv_OreCacheTime_7 = getgenv().oreCacheTime;
            local var518 = var517 - var445;
            -- 0.116179
            local var519 = (var518 < 0.5); -- true
            local Getgenv_CachedOres_11 = getgenv().cachedOres;
            local var520 = (var519 and true); -- true
            if not var520 then return end -- won't run
            local Getgenv_CachedOres_12 = getgenv().cachedOres;
            local GetAttribute_9 = Model_14.GetAttribute;
            local Someone_7 = Model_14:GetAttribute("Someone");
            if not Someone_7 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_211 = task.wait();
            local Character_68 = LocalPlayer.Character;
            -- local _ = Character_68 or (unknown_value)
            local Humanoid_78 = Character_68:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_78 = Character_68:FindFirstChild("HumanoidRootPart");
            local var521 = (Humanoid_78 and HumanoidRootPart_78); -- HumanoidRootPart_78
            local var522 = (Character_68 and var521); -- HumanoidRootPart_78
            local var523 = (var522 and true); -- true
            local var524 = (var523 or false);
            local Getgenv_Current_Tween_9 = getgenv().current_tween;
            local Character_69 = LocalPlayer.Character;
            -- local _ = Character_69 or (unknown_value)
            local Humanoid_79 = Character_69:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_79 = Character_69:FindFirstChild("HumanoidRootPart");
            local var525 = (Humanoid_79 and HumanoidRootPart_79); -- HumanoidRootPart_79
            local var526 = (Character_69 and var525); -- HumanoidRootPart_79
            local var527 = (var526 and true); -- true
            local var528 = (var527 or false);
            local Position_23 = HumanoidRootPart_79.Position;
            local var529 = tick();
            local Getgenv_OreCacheTime_8 = getgenv().oreCacheTime;
            local var530 = var529 - var445;
            -- 0.134762
            local var531 = (var530 < 0.5); -- true
            local Getgenv_CachedOres_13 = getgenv().cachedOres;
            local var532 = (var531 and true); -- true
            if not var532 then return end -- won't run
            local Getgenv_CachedOres_14 = getgenv().cachedOres;
            local GetAttribute_10 = Model_14.GetAttribute;
            local Someone_8 = Model_14:GetAttribute("Someone");
            if not Someone_8 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_212 = task.wait();
            local Character_70 = LocalPlayer.Character;
            -- local _ = Character_70 or (unknown_value)
            local Humanoid_80 = Character_70:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_80 = Character_70:FindFirstChild("HumanoidRootPart");
            local var533 = (Humanoid_80 and HumanoidRootPart_80); -- HumanoidRootPart_80
            local var534 = (Character_70 and var533); -- HumanoidRootPart_80
            local var535 = (var534 and true); -- true
            local var536 = (var535 or false);
            local Getgenv_Current_Tween_10 = getgenv().current_tween;
            local Character_71 = LocalPlayer.Character;
            -- local _ = Character_71 or (unknown_value)
            local Humanoid_81 = Character_71:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_81 = Character_71:FindFirstChild("HumanoidRootPart");
            local var537 = (Humanoid_81 and HumanoidRootPart_81); -- HumanoidRootPart_81
            local var538 = (Character_71 and var537); -- HumanoidRootPart_81
            local var539 = (var538 and true); -- true
            local var540 = (var539 or false);
            local Position_24 = HumanoidRootPart_81.Position;
            local var541 = tick();
            local Getgenv_OreCacheTime_9 = getgenv().oreCacheTime;
            local var542 = var541 - var445;
            -- 0.153480
            local var543 = (var542 < 0.5); -- true
            local Getgenv_CachedOres_15 = getgenv().cachedOres;
            local var544 = (var543 and true); -- true
            if not var544 then return end -- won't run
            local Getgenv_CachedOres_16 = getgenv().cachedOres;
            local GetAttribute_11 = Model_14.GetAttribute;
            local Someone_9 = Model_14:GetAttribute("Someone");
            if not Someone_9 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_213 = task.wait();
            local Character_72 = LocalPlayer.Character;
            -- local _ = Character_72 or (unknown_value)
            local Humanoid_82 = Character_72:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_82 = Character_72:FindFirstChild("HumanoidRootPart");
            local var545 = (Humanoid_82 and HumanoidRootPart_82); -- HumanoidRootPart_82
            local var546 = (Character_72 and var545); -- HumanoidRootPart_82
            local var547 = (var546 and true); -- true
            local var548 = (var547 or false);
            local Getgenv_Current_Tween_11 = getgenv().current_tween;
            local Character_73 = LocalPlayer.Character;
            -- local _ = Character_73 or (unknown_value)
            local Humanoid_83 = Character_73:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_83 = Character_73:FindFirstChild("HumanoidRootPart");
            local var549 = (Humanoid_83 and HumanoidRootPart_83); -- HumanoidRootPart_83
            local var550 = (Character_73 and var549); -- HumanoidRootPart_83
            local var551 = (var550 and true); -- true
            local var552 = (var551 or false);
            local Position_25 = HumanoidRootPart_83.Position;
            local var553 = tick();
            local Getgenv_OreCacheTime_10 = getgenv().oreCacheTime;
            local var554 = var553 - var445;
            -- 0.172858
            local var555 = (var554 < 0.5); -- true
            local Getgenv_CachedOres_17 = getgenv().cachedOres;
            local var556 = (var555 and true); -- true
            if not var556 then return end -- won't run
            local Getgenv_CachedOres_18 = getgenv().cachedOres;
            local GetAttribute_12 = Model_14.GetAttribute;
            local Someone_10 = Model_14:GetAttribute("Someone");
            if not Someone_10 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_214 = task.wait();
            local Character_74 = LocalPlayer.Character;
            -- local _ = Character_74 or (unknown_value)
            local Humanoid_84 = Character_74:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_84 = Character_74:FindFirstChild("HumanoidRootPart");
            local var557 = (Humanoid_84 and HumanoidRootPart_84); -- HumanoidRootPart_84
            local var558 = (Character_74 and var557); -- HumanoidRootPart_84
            local var559 = (var558 and true); -- true
            local var560 = (var559 or false);
            local Getgenv_Current_Tween_12 = getgenv().current_tween;
            local Character_75 = LocalPlayer.Character;
            -- local _ = Character_75 or (unknown_value)
            local Humanoid_85 = Character_75:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_85 = Character_75:FindFirstChild("HumanoidRootPart");
            local var561 = (Humanoid_85 and HumanoidRootPart_85); -- HumanoidRootPart_85
            local var562 = (Character_75 and var561); -- HumanoidRootPart_85
            local var563 = (var562 and true); -- true
            local var564 = (var563 or false);
            local Position_26 = HumanoidRootPart_85.Position;
            local var565 = tick();
            local Getgenv_OreCacheTime_11 = getgenv().oreCacheTime;
            local var566 = var565 - var445;
            -- 0.192663
            local var567 = (var566 < 0.5); -- true
            local Getgenv_CachedOres_19 = getgenv().cachedOres;
            local var568 = (var567 and true); -- true
            if not var568 then return end -- won't run
            local Getgenv_CachedOres_20 = getgenv().cachedOres;
            local GetAttribute_13 = Model_14.GetAttribute;
            local Someone_11 = Model_14:GetAttribute("Someone");
            if not Someone_11 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_215 = task.wait();
            local Character_76 = LocalPlayer.Character;
            -- local _ = Character_76 or (unknown_value)
            local Humanoid_86 = Character_76:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_86 = Character_76:FindFirstChild("HumanoidRootPart");
            local var569 = (Humanoid_86 and HumanoidRootPart_86); -- HumanoidRootPart_86
            local var570 = (Character_76 and var569); -- HumanoidRootPart_86
            local var571 = (var570 and true); -- true
            local var572 = (var571 or false);
            local Getgenv_Current_Tween_13 = getgenv().current_tween;
            local Character_77 = LocalPlayer.Character;
            -- local _ = Character_77 or (unknown_value)
            local Humanoid_87 = Character_77:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_87 = Character_77:FindFirstChild("HumanoidRootPart");
            local var573 = (Humanoid_87 and HumanoidRootPart_87); -- HumanoidRootPart_87
            local var574 = (Character_77 and var573); -- HumanoidRootPart_87
            local var575 = (var574 and true); -- true
            local var576 = (var575 or false);
            local Position_27 = HumanoidRootPart_87.Position;
            local var577 = tick();
            local Getgenv_OreCacheTime_12 = getgenv().oreCacheTime;
            local var578 = var577 - var445;
            -- 0.211343
            local var579 = (var578 < 0.5); -- true
            local Getgenv_CachedOres_21 = getgenv().cachedOres;
            local var580 = (var579 and true); -- true
            if not var580 then return end -- won't run
            local Getgenv_CachedOres_22 = getgenv().cachedOres;
            local GetAttribute_14 = Model_14.GetAttribute;
            local Someone_12 = Model_14:GetAttribute("Someone");
            if not Someone_12 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_216 = task.wait();
            local Character_78 = LocalPlayer.Character;
            -- local _ = Character_78 or (unknown_value)
            local Humanoid_88 = Character_78:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_88 = Character_78:FindFirstChild("HumanoidRootPart");
            local var581 = (Humanoid_88 and HumanoidRootPart_88);
            error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

        end);

    end,
    Name = "Farm Ores",
    Flag = "OreFarmToggle",
});
local CreateToggle_6 = Main.CreateToggle;
local Toggle_6 = Main:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)
        local Spawned_17 = task.spawn(function()
            local Not_P1_0_7 = not p1_0;
            -- false
            local Waited_For_217 = task.wait();
            local Character_79 = LocalPlayer.Character;
            -- local _ = Character_79 or (unknown_value)
            local Humanoid_89 = Character_79:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_89 = Character_79:FindFirstChild("HumanoidRootPart");
            local var582 = (Humanoid_89 and HumanoidRootPart_89); -- HumanoidRootPart_89
            local var583 = (Character_79 and var582); -- HumanoidRootPart_89
            local var584 = (var583 and true); -- true
            local var585 = (var584 or false);
            local Getgenv_Current_Tween_14 = getgenv().current_tween;
            local Character_80 = LocalPlayer.Character;
            -- local _ = Character_80 or (unknown_value)
            local Humanoid_90 = Character_80:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_90 = Character_80:FindFirstChild("HumanoidRootPart");
            local var586 = (Humanoid_90 and HumanoidRootPart_90); -- HumanoidRootPart_90
            local var587 = (Character_80 and var586); -- HumanoidRootPart_90
            local var588 = (var587 and true); -- true
            local var589 = (var588 or false);
            local Position_28 = HumanoidRootPart_90.Position;
            local var590 = tick();
            local Getgenv_OreCacheTime_13 = getgenv().oreCacheTime;
            local var591 = var590 - var445;
            -- 0.265315
            local var592 = (var591 < 0.5); -- true
            local Getgenv_CachedOres_23 = getgenv().cachedOres;
            local var593 = (var592 and true); -- true
            if not var593 then return end -- won't run
            local Getgenv_CachedOres_24 = getgenv().cachedOres;
            local GetAttribute_15 = Model_14.GetAttribute;
            local Someone_13 = Model_14:GetAttribute("Someone");
            if not Someone_13 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_218 = task.wait();
            local Character_81 = LocalPlayer.Character;
            -- local _ = Character_81 or (unknown_value)
            local Humanoid_91 = Character_81:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_91 = Character_81:FindFirstChild("HumanoidRootPart");
            local var594 = (Humanoid_91 and HumanoidRootPart_91); -- HumanoidRootPart_91
            local var595 = (Character_81 and var594); -- HumanoidRootPart_91
            local var596 = (var595 and true); -- true
            local var597 = (var596 or false);
            local Getgenv_Current_Tween_15 = getgenv().current_tween;
            local Character_82 = LocalPlayer.Character;
            -- local _ = Character_82 or (unknown_value)
            local Humanoid_92 = Character_82:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_92 = Character_82:FindFirstChild("HumanoidRootPart");
            local var598 = (Humanoid_92 and HumanoidRootPart_92); -- HumanoidRootPart_92
            local var599 = (Character_82 and var598); -- HumanoidRootPart_92
            local var600 = (var599 and true); -- true
            local var601 = (var600 or false);
            local Position_29 = HumanoidRootPart_92.Position;
            local var602 = tick();
            local Getgenv_OreCacheTime_14 = getgenv().oreCacheTime;
            local var603 = var602 - var445;
            -- 0.280902
            local var604 = (var603 < 0.5); -- true
            local Getgenv_CachedOres_25 = getgenv().cachedOres;
            local var605 = (var604 and true); -- true
            if not var605 then return end -- won't run
            local Getgenv_CachedOres_26 = getgenv().cachedOres;
            local GetAttribute_16 = Model_14.GetAttribute;
            local Someone_14 = Model_14:GetAttribute("Someone");
            if not Someone_14 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_219 = task.wait();
            local Character_83 = LocalPlayer.Character;
            -- local _ = Character_83 or (unknown_value)
            local Humanoid_93 = Character_83:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_93 = Character_83:FindFirstChild("HumanoidRootPart");
            local var606 = (Humanoid_93 and HumanoidRootPart_93); -- HumanoidRootPart_93
            local var607 = (Character_83 and var606); -- HumanoidRootPart_93
            local var608 = (var607 and true); -- true
            local var609 = (var608 or false);
            local Getgenv_Current_Tween_16 = getgenv().current_tween;
            local Character_84 = LocalPlayer.Character;
            -- local _ = Character_84 or (unknown_value)
            local Humanoid_94 = Character_84:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_94 = Character_84:FindFirstChild("HumanoidRootPart");
            local var610 = (Humanoid_94 and HumanoidRootPart_94); -- HumanoidRootPart_94
            local var611 = (Character_84 and var610); -- HumanoidRootPart_94
            local var612 = (var611 and true); -- true
            local var613 = (var612 or false);
            local Position_30 = HumanoidRootPart_94.Position;
            local var614 = tick();
            local Getgenv_OreCacheTime_15 = getgenv().oreCacheTime;
            local var615 = var614 - var445;
            -- 0.298854
            local var616 = (var615 < 0.5); -- true
            local Getgenv_CachedOres_27 = getgenv().cachedOres;
            local var617 = (var616 and true); -- true
            if not var617 then return end -- won't run
            local Getgenv_CachedOres_28 = getgenv().cachedOres;
            local GetAttribute_17 = Model_14.GetAttribute;
            local Someone_15 = Model_14:GetAttribute("Someone");
            if not Someone_15 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_220 = task.wait();
            local Character_85 = LocalPlayer.Character;
            -- local _ = Character_85 or (unknown_value)
            local Humanoid_95 = Character_85:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_95 = Character_85:FindFirstChild("HumanoidRootPart");
            local var618 = (Humanoid_95 and HumanoidRootPart_95); -- HumanoidRootPart_95
            local var619 = (Character_85 and var618); -- HumanoidRootPart_95
            local var620 = (var619 and true); -- true
            local var621 = (var620 or false);
            local Getgenv_Current_Tween_17 = getgenv().current_tween;
            local Character_86 = LocalPlayer.Character;
            -- local _ = Character_86 or (unknown_value)
            local Humanoid_96 = Character_86:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_96 = Character_86:FindFirstChild("HumanoidRootPart");
            local var622 = (Humanoid_96 and HumanoidRootPart_96); -- HumanoidRootPart_96
            local var623 = (Character_86 and var622); -- HumanoidRootPart_96
            local var624 = (var623 and true); -- true
            local var625 = (var624 or false);
            local Position_31 = HumanoidRootPart_96.Position;
            local var626 = tick();
            local Getgenv_OreCacheTime_16 = getgenv().oreCacheTime;
            local var627 = var626 - var445;
            -- 0.326356
            local var628 = (var627 < 0.5); -- true
            local Getgenv_CachedOres_29 = getgenv().cachedOres;
            local var629 = (var628 and true); -- true
            if not var629 then return end -- won't run
            local Getgenv_CachedOres_30 = getgenv().cachedOres;
            local GetAttribute_18 = Model_14.GetAttribute;
            local Someone_16 = Model_14:GetAttribute("Someone");
            if not Someone_16 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_221 = task.wait();
            local Character_87 = LocalPlayer.Character;
            -- local _ = Character_87 or (unknown_value)
            local Humanoid_97 = Character_87:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_97 = Character_87:FindFirstChild("HumanoidRootPart");
            local var630 = (Humanoid_97 and HumanoidRootPart_97); -- HumanoidRootPart_97
            local var631 = (Character_87 and var630); -- HumanoidRootPart_97
            local var632 = (var631 and true); -- true
            local var633 = (var632 or false);
            local Getgenv_Current_Tween_18 = getgenv().current_tween;
            local Character_88 = LocalPlayer.Character;
            -- local _ = Character_88 or (unknown_value)
            local Humanoid_98 = Character_88:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_98 = Character_88:FindFirstChild("HumanoidRootPart");
            local var634 = (Humanoid_98 and HumanoidRootPart_98); -- HumanoidRootPart_98
            local var635 = (Character_88 and var634); -- HumanoidRootPart_98
            local var636 = (var635 and true); -- true
            local var637 = (var636 or false);
            local Position_32 = HumanoidRootPart_98.Position;
            local var638 = tick();
            local Getgenv_OreCacheTime_17 = getgenv().oreCacheTime;
            local var639 = var638 - var445;
            -- 0.344648
            local var640 = (var639 < 0.5); -- true
            local Getgenv_CachedOres_31 = getgenv().cachedOres;
            local var641 = (var640 and true); -- true
            if not var641 then return end -- won't run
            local Getgenv_CachedOres_32 = getgenv().cachedOres;
            local GetAttribute_19 = Model_14.GetAttribute;
            local Someone_17 = Model_14:GetAttribute("Someone");
            if not Someone_17 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_222 = task.wait();
            local Character_89 = LocalPlayer.Character;
            -- local _ = Character_89 or (unknown_value)
            local Humanoid_99 = Character_89:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_99 = Character_89:FindFirstChild("HumanoidRootPart");
            local var642 = (Humanoid_99 and HumanoidRootPart_99); -- HumanoidRootPart_99
            local var643 = (Character_89 and var642); -- HumanoidRootPart_99
            local var644 = (var643 and true); -- true
            local var645 = (var644 or false);
            local Getgenv_Current_Tween_19 = getgenv().current_tween;
            local Character_90 = LocalPlayer.Character;
            -- local _ = Character_90 or (unknown_value)
            local Humanoid_100 = Character_90:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_100 = Character_90:FindFirstChild("HumanoidRootPart");
            local var646 = (Humanoid_100 and HumanoidRootPart_100); -- HumanoidRootPart_100
            local var647 = (Character_90 and var646); -- HumanoidRootPart_100
            local var648 = (var647 and true); -- true
            local var649 = (var648 or false);
            local Position_33 = HumanoidRootPart_100.Position;
            local var650 = tick();
            local Getgenv_OreCacheTime_18 = getgenv().oreCacheTime;
            local var651 = var650 - var445;
            -- 0.362870
            local var652 = (var651 < 0.5); -- true
            local Getgenv_CachedOres_33 = getgenv().cachedOres;
            local var653 = (var652 and true); -- true
            if not var653 then return end -- won't run
            local Getgenv_CachedOres_34 = getgenv().cachedOres;
            local GetAttribute_20 = Model_14.GetAttribute;
            local Someone_18 = Model_14:GetAttribute("Someone");
            if not Someone_18 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_223 = task.wait();
            local Character_91 = LocalPlayer.Character;
            -- local _ = Character_91 or (unknown_value)
            local Humanoid_101 = Character_91:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_101 = Character_91:FindFirstChild("HumanoidRootPart");
            local var654 = (Humanoid_101 and HumanoidRootPart_101); -- HumanoidRootPart_101
            local var655 = (Character_91 and var654); -- HumanoidRootPart_101
            local var656 = (var655 and true); -- true
            local var657 = (var656 or false);
            local Getgenv_Current_Tween_20 = getgenv().current_tween;
            local Character_92 = LocalPlayer.Character;
            -- local _ = Character_92 or (unknown_value)
            local Humanoid_102 = Character_92:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_102 = Character_92:FindFirstChild("HumanoidRootPart");
            local var658 = (Humanoid_102 and HumanoidRootPart_102); -- HumanoidRootPart_102
            local var659 = (Character_92 and var658); -- HumanoidRootPart_102
            local var660 = (var659 and true); -- true
            local var661 = (var660 or false);
            local Position_34 = HumanoidRootPart_102.Position;
            local var662 = tick();
            local Getgenv_OreCacheTime_19 = getgenv().oreCacheTime;
            local var663 = var662 - var445;
            -- 0.382004
            local var664 = (var663 < 0.5); -- true
            local Getgenv_CachedOres_35 = getgenv().cachedOres;
            local var665 = (var664 and true); -- true
            if not var665 then return end -- won't run
            local Getgenv_CachedOres_36 = getgenv().cachedOres;
            local GetAttribute_21 = Model_14.GetAttribute;
            local Someone_19 = Model_14:GetAttribute("Someone");
            if not Someone_19 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_224 = task.wait();
            local Character_93 = LocalPlayer.Character;
            -- local _ = Character_93 or (unknown_value)
            local Humanoid_103 = Character_93:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_103 = Character_93:FindFirstChild("HumanoidRootPart");
            local var666 = (Humanoid_103 and HumanoidRootPart_103); -- HumanoidRootPart_103
            local var667 = (Character_93 and var666); -- HumanoidRootPart_103
            local var668 = (var667 and true); -- true
            local var669 = (var668 or false);
            local Getgenv_Current_Tween_21 = getgenv().current_tween;
            local Character_94 = LocalPlayer.Character;
            -- local _ = Character_94 or (unknown_value)
            local Humanoid_104 = Character_94:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_104 = Character_94:FindFirstChild("HumanoidRootPart");
            local var670 = (Humanoid_104 and HumanoidRootPart_104); -- HumanoidRootPart_104
            local var671 = (Character_94 and var670); -- HumanoidRootPart_104
            local var672 = (var671 and true); -- true
            local var673 = (var672 or false);
            local Position_35 = HumanoidRootPart_104.Position;
            local var674 = tick();
            local Getgenv_OreCacheTime_20 = getgenv().oreCacheTime;
            local var675 = var674 - var445;
            -- 0.401089
            local var676 = (var675 < 0.5); -- true
            local Getgenv_CachedOres_37 = getgenv().cachedOres;
            local var677 = (var676 and true); -- true
            if not var677 then return end -- won't run
            local Getgenv_CachedOres_38 = getgenv().cachedOres;
            local GetAttribute_22 = Model_14.GetAttribute;
            local Someone_20 = Model_14:GetAttribute("Someone");
            if not Someone_20 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_225 = task.wait();
            local Character_95 = LocalPlayer.Character;
            -- local _ = Character_95 or (unknown_value)
            local Humanoid_105 = Character_95:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_105 = Character_95:FindFirstChild("HumanoidRootPart");
            local var678 = (Humanoid_105 and HumanoidRootPart_105); -- HumanoidRootPart_105
            local var679 = (Character_95 and var678); -- HumanoidRootPart_105
            local var680 = (var679 and true); -- true
            local var681 = (var680 or false);
            local Getgenv_Current_Tween_22 = getgenv().current_tween;
            local Character_96 = LocalPlayer.Character;
            -- local _ = Character_96 or (unknown_value)
            local Humanoid_106 = Character_96:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_106 = Character_96:FindFirstChild("HumanoidRootPart");
            local var682 = (Humanoid_106 and HumanoidRootPart_106); -- HumanoidRootPart_106
            local var683 = (Character_96 and var682); -- HumanoidRootPart_106
            local var684 = (var683 and true); -- true
            local var685 = (var684 or false);
            local Position_36 = HumanoidRootPart_106.Position;
            local var686 = tick();
            local Getgenv_OreCacheTime_21 = getgenv().oreCacheTime;
            local var687 = var686 - var445;
            -- 0.420757
            local var688 = (var687 < 0.5); -- true
            local Getgenv_CachedOres_39 = getgenv().cachedOres;
            local var689 = (var688 and true); -- true
            if not var689 then return end -- won't run
            local Getgenv_CachedOres_40 = getgenv().cachedOres;
            local GetAttribute_23 = Model_14.GetAttribute;
            local Someone_21 = Model_14:GetAttribute("Someone");
            if not Someone_21 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_226 = task.wait();
            local Character_97 = LocalPlayer.Character;
            -- local _ = Character_97 or (unknown_value)
            local Humanoid_107 = Character_97:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_107 = Character_97:FindFirstChild("HumanoidRootPart");
            local var690 = (Humanoid_107 and HumanoidRootPart_107); -- HumanoidRootPart_107
            local var691 = (Character_97 and var690); -- HumanoidRootPart_107
            local var692 = (var691 and true); -- true
            local var693 = (var692 or false);
            local Getgenv_Current_Tween_23 = getgenv().current_tween;
            local Character_98 = LocalPlayer.Character;
            -- local _ = Character_98 or (unknown_value)
            local Humanoid_108 = Character_98:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_108 = Character_98:FindFirstChild("HumanoidRootPart");
            local var694 = (Humanoid_108 and HumanoidRootPart_108); -- HumanoidRootPart_108
            local var695 = (Character_98 and var694); -- HumanoidRootPart_108
            local var696 = (var695 and true); -- true
            local var697 = (var696 or false);
            local Position_37 = HumanoidRootPart_108.Position;
            local var698 = tick();
            local Getgenv_OreCacheTime_22 = getgenv().oreCacheTime;
            local var699 = var698 - var445;
            -- 0.440158
            local var700 = (var699 < 0.5); -- true
            local Getgenv_CachedOres_41 = getgenv().cachedOres;
            local var701 = (var700 and true); -- true
            if not var701 then return end -- won't run
            local Getgenv_CachedOres_42 = getgenv().cachedOres;
            local GetAttribute_24 = Model_14.GetAttribute;
            local Someone_22 = Model_14:GetAttribute("Someone");
            if not Someone_22 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_227 = task.wait();
            local Character_99 = LocalPlayer.Character;
            -- local _ = Character_99 or (unknown_value)
            local Humanoid_109 = Character_99:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_109 = Character_99:FindFirstChild("HumanoidRootPart");
            local var702 = (Humanoid_109 and HumanoidRootPart_109); -- HumanoidRootPart_109
            local var703 = (Character_99 and var702); -- HumanoidRootPart_109
            local var704 = (var703 and true); -- true
            local var705 = (var704 or false);
            local Getgenv_Current_Tween_24 = getgenv().current_tween;
            local Character_100 = LocalPlayer.Character;
            -- local _ = Character_100 or (unknown_value)
            local Humanoid_110 = Character_100:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_110 = Character_100:FindFirstChild("HumanoidRootPart");
            local var706 = (Humanoid_110 and HumanoidRootPart_110); -- HumanoidRootPart_110
            local var707 = (Character_100 and var706); -- HumanoidRootPart_110
            local var708 = (var707 and true); -- true
            local var709 = (var708 or false);
            local Position_38 = HumanoidRootPart_110.Position;
            local var710 = tick();
            local Getgenv_OreCacheTime_23 = getgenv().oreCacheTime;
            local var711 = var710 - var445;
            -- 0.459332
            local var712 = (var711 < 0.5); -- true
            local Getgenv_CachedOres_43 = getgenv().cachedOres;
            local var713 = (var712 and true); -- true
            if not var713 then return end -- won't run
            local Getgenv_CachedOres_44 = getgenv().cachedOres;
            local GetAttribute_25 = Model_14.GetAttribute;
            local Someone_23 = Model_14:GetAttribute("Someone");
            if not Someone_23 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_228 = task.wait();
            local Character_101 = LocalPlayer.Character;
            -- local _ = Character_101 or (unknown_value)
            local Humanoid_111 = Character_101:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_111 = Character_101:FindFirstChild("HumanoidRootPart");
            local var714 = (Humanoid_111 and HumanoidRootPart_111); -- HumanoidRootPart_111
            local var715 = (Character_101 and var714); -- HumanoidRootPart_111
            local var716 = (var715 and true); -- true
            local var717 = (var716 or false);
            local Getgenv_Current_Tween_25 = getgenv().current_tween;
            local Character_102 = LocalPlayer.Character;
            -- local _ = Character_102 or (unknown_value)
            local Humanoid_112 = Character_102:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_112 = Character_102:FindFirstChild("HumanoidRootPart");
            local var718 = (Humanoid_112 and HumanoidRootPart_112); -- HumanoidRootPart_112
            local var719 = (Character_102 and var718); -- HumanoidRootPart_112
            local var720 = (var719 and true); -- true
            local var721 = (var720 or false);
            local Position_39 = HumanoidRootPart_112.Position;
            local var722 = tick();
            local Getgenv_OreCacheTime_24 = getgenv().oreCacheTime;
            local var723 = var722 - var445;
            -- 0.480283
            local var724 = (var723 < 0.5); -- true
            local Getgenv_CachedOres_45 = getgenv().cachedOres;
            local var725 = (var724 and true); -- true
            if not var725 then return end -- won't run
            local Getgenv_CachedOres_46 = getgenv().cachedOres;
            local GetAttribute_26 = Model_14.GetAttribute;
            local Someone_24 = Model_14:GetAttribute("Someone");
            if not Someone_24 then return end -- won't run
            getgenv().orefound = false;
            local Waited_For_229 = task.wait();
            local Character_103 = LocalPlayer.Character;
            -- local _ = Character_103 or (unknown_value)
            local Humanoid_113 = Character_103:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_113 = Character_103:FindFirstChild("HumanoidRootPart");
            local var726 = (Humanoid_113 and HumanoidRootPart_113); -- HumanoidRootPart_113
            local var727 = (Character_103 and var726); -- HumanoidRootPart_113
            local var728 = (var727 and true); -- true
            local var729 = (var728 or false);
            local Getgenv_Current_Tween_26 = getgenv().current_tween;
            local Character_104 = LocalPlayer.Character;
            -- local _ = Character_104 or (unknown_value)
            error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

        end);

    end,
    Name = "Closest Ore Farm",
    Flag = "ClosestOreToggle",
});
local GetChildren_3 = Rocks.GetChildren;
local Children_3 = Rocks:GetChildren();
for i_3, v_3 in ipairs(Children_3) do
    local Name_3 = v_3.Name;
end
local CreateDropdown_4 = Main.CreateDropdown;
local Dropdown_4 = Main:CreateDropdown({
    Name = "Select Region",
    CurrentOption = "",
    Flag = "RegionDropdown",
    MultipleOptions = false,
    Callback = function(p1_0)
        local var85 = typeof(p1_0);
        local var85_is_string = (var85 == "table");
        -- true, eq id 7
        local var86 = p1_0[1];
        local var87 = (var85_is_string and var86); -- var86
        -- local _ = var87 or (unknown_value)
        -- local _ = var86 or (unknown_value)

    end,
    Options = {
        Name_3,
    },
});
local CreateToggle_7 = Main.CreateToggle;
local Toggle_7 = Main:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)
        local Spawned_18 = task.spawn(function()
            local Not_P1_0_8 = not p1_0;
            -- false
            local Waited_For_230 = task.wait();
            local Character_105 = LocalPlayer.Character;
            -- local _ = Character_105 or (unknown_value)
            local Humanoid_114 = Character_105:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_114 = Character_105:FindFirstChild("HumanoidRootPart");
            local var730 = (Humanoid_114 and HumanoidRootPart_114); -- HumanoidRootPart_114
            local var731 = (Character_105 and var730); -- HumanoidRootPart_114
            local var732 = (var731 and true); -- true
            local var733 = (var732 or false);
            local Getgenv_Current_Tween_27 = getgenv().current_tween;
            local Not_Var86 = not var86;
            -- false
            local var86_is_string = (var86 == "");
            -- false, eq id 17
            local var734 = (Not_Var86 or var86_is_string); -- false
            local Character_106 = LocalPlayer.Character;
            -- local _ = Character_106 or (unknown_value)
            local Humanoid_115 = Character_106:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_115 = Character_106:FindFirstChild("HumanoidRootPart");
            local var735 = (Humanoid_115 and HumanoidRootPart_115); -- HumanoidRootPart_115
            local var736 = (Character_106 and var735); -- HumanoidRootPart_115
            local var737 = (var736 and true); -- true
            local var738 = (var737 or false);
            local Position_40 = HumanoidRootPart_115.Position;
            local FindFirstChild_27 = Rocks.FindFirstChild;
            local FindFirstChild_28 = Rocks:FindFirstChild(var86);
            local Not_FindFirstChild_28 = not FindFirstChild_28;
            -- false
            local GetChildren_26 = FindFirstChild_28.GetChildren;
            local Children_29 = FindFirstChild_28:GetChildren();
            for i_30, v_30 in ipairs(Children_29) do
                local GetAttribute_27 = v_30.GetAttribute;
                local IsOccupied_2 = v_30:GetAttribute("IsOccupied");
                local Not_IsOccupied_2 = not IsOccupied_2;
                -- false
                local FindFirstChildWhichIsA_3 = v_30.FindFirstChildWhichIsA;
                local Model_15 = v_30:FindFirstChildWhichIsA("Model");
                local Not_Model_15 = not Model_15;
                -- false
                local GetAttribute_28 = Model_15.GetAttribute;
                local Someone_25 = Model_15:GetAttribute("Someone");
                if not Someone_25 then return end -- won't run
            end
            getgenv().orefound = false;
            local Waited_For_231 = task.wait();
            local Character_107 = LocalPlayer.Character;
            -- local _ = Character_107 or (unknown_value)
            local Humanoid_116 = Character_107:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_116 = Character_107:FindFirstChild("HumanoidRootPart");
            local var740 = (Humanoid_116 and HumanoidRootPart_116); -- HumanoidRootPart_116
            local var741 = (Character_107 and var740); -- HumanoidRootPart_116
            local var742 = (var741 and true); -- true
            local var743 = (var742 or false);
            local Getgenv_Current_Tween_28 = getgenv().current_tween;
            local Not_Var86_2 = not var86;
            -- false
            local var86_is_string_2 = (var86 == "");
            -- false, eq id 18
            local var744 = (Not_Var86_2 or var86_is_string_2); -- false
            local Character_108 = LocalPlayer.Character;
            -- local _ = Character_108 or (unknown_value)
            local Humanoid_117 = Character_108:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_117 = Character_108:FindFirstChild("HumanoidRootPart");
            local var745 = (Humanoid_117 and HumanoidRootPart_117); -- HumanoidRootPart_117
            local var746 = (Character_108 and var745); -- HumanoidRootPart_117
            local var747 = (var746 and true); -- true
            local var748 = (var747 or false);
            local Position_41 = HumanoidRootPart_117.Position;
            local FindFirstChild_29 = Rocks.FindFirstChild;
            local FindFirstChild_30 = Rocks:FindFirstChild(var86);
            local Not_FindFirstChild_30 = not FindFirstChild_30;
            -- false
            local GetChildren_27 = FindFirstChild_30.GetChildren;
            local Children_30 = FindFirstChild_30:GetChildren();
            for i_31, v_31 in ipairs(Children_30) do
                local GetAttribute_29 = v_31.GetAttribute;
                local IsOccupied_3 = v_31:GetAttribute("IsOccupied");
                local Not_IsOccupied_3 = not IsOccupied_3;
                -- false
                local FindFirstChildWhichIsA_4 = v_31.FindFirstChildWhichIsA;
                local Model_16 = v_31:FindFirstChildWhichIsA("Model");
                local Not_Model_16 = not Model_16;
                -- false
                local GetAttribute_30 = Model_16.GetAttribute;
                local Someone_26 = Model_16:GetAttribute("Someone");
                if not Someone_26 then return end -- won't run
            end
            getgenv().orefound = false;
            local Waited_For_232 = task.wait();
            local Character_109 = LocalPlayer.Character;
            -- local _ = Character_109 or (unknown_value)
            local Humanoid_118 = Character_109:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_118 = Character_109:FindFirstChild("HumanoidRootPart");
            local var750 = (Humanoid_118 and HumanoidRootPart_118); -- HumanoidRootPart_118
            local var751 = (Character_109 and var750); -- HumanoidRootPart_118
            local var752 = (var751 and true); -- true
            local var753 = (var752 or false);
            local Getgenv_Current_Tween_29 = getgenv().current_tween;
            local Not_Var86_3 = not var86;
            -- false
            local var86_is_string_3 = (var86 == "");
            -- false, eq id 19
            local var754 = (Not_Var86_3 or var86_is_string_3); -- false
            local Character_110 = LocalPlayer.Character;
            -- local _ = Character_110 or (unknown_value)
            local Humanoid_119 = Character_110:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_119 = Character_110:FindFirstChild("HumanoidRootPart");
            local var755 = (Humanoid_119 and HumanoidRootPart_119); -- HumanoidRootPart_119
            local var756 = (Character_110 and var755); -- HumanoidRootPart_119
            local var757 = (var756 and true); -- true
            local var758 = (var757 or false);
            local Position_42 = HumanoidRootPart_119.Position;
            local FindFirstChild_31 = Rocks.FindFirstChild;
            local FindFirstChild_32 = Rocks:FindFirstChild(var86);
            local Not_FindFirstChild_32 = not FindFirstChild_32;
            -- false
            local GetChildren_28 = FindFirstChild_32.GetChildren;
            local Children_31 = FindFirstChild_32:GetChildren();
            for i_32, v_32 in ipairs(Children_31) do
                local GetAttribute_31 = v_32.GetAttribute;
                local IsOccupied_4 = v_32:GetAttribute("IsOccupied");
                local Not_IsOccupied_4 = not IsOccupied_4;
                -- false
                local FindFirstChildWhichIsA_5 = v_32.FindFirstChildWhichIsA;
                local Model_17 = v_32:FindFirstChildWhichIsA("Model");
                local Not_Model_17 = not Model_17;
                -- false
                local GetAttribute_32 = Model_17.GetAttribute;
                local Someone_27 = Model_17:GetAttribute("Someone");
                if not Someone_27 then return end -- won't run
            end
            getgenv().orefound = false;
            local Waited_For_233 = task.wait();
            local Character_111 = LocalPlayer.Character;
            -- local _ = Character_111 or (unknown_value)
            local Humanoid_120 = Character_111:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_120 = Character_111:FindFirstChild("HumanoidRootPart");
            local var760 = (Humanoid_120 and HumanoidRootPart_120); -- HumanoidRootPart_120
            local var761 = (Character_111 and var760); -- HumanoidRootPart_120
            local var762 = (var761 and true); -- true
            local var763 = (var762 or false);
            local Getgenv_Current_Tween_30 = getgenv().current_tween;
            local Not_Var86_4 = not var86;
            -- false
            local var86_is_string_4 = (var86 == "");
            -- false, eq id 20
            local var764 = (Not_Var86_4 or var86_is_string_4); -- false
            local Character_112 = LocalPlayer.Character;
            -- local _ = Character_112 or (unknown_value)
            local Humanoid_121 = Character_112:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_121 = Character_112:FindFirstChild("HumanoidRootPart");
            local var765 = (Humanoid_121 and HumanoidRootPart_121); -- HumanoidRootPart_121
            local var766 = (Character_112 and var765); -- HumanoidRootPart_121
            local var767 = (var766 and true); -- true
            local var768 = (var767 or false);
            local Position_43 = HumanoidRootPart_121.Position;
            local FindFirstChild_33 = Rocks.FindFirstChild;
            local FindFirstChild_34 = Rocks:FindFirstChild(var86);
            local Not_FindFirstChild_34 = not FindFirstChild_34;
            -- false
            local GetChildren_29 = FindFirstChild_34.GetChildren;
            local Children_32 = FindFirstChild_34:GetChildren();
            for i_33, v_33 in ipairs(Children_32) do
                local GetAttribute_33 = v_33.GetAttribute;
                local IsOccupied_5 = v_33:GetAttribute("IsOccupied");
                local Not_IsOccupied_5 = not IsOccupied_5;
                -- false
                local FindFirstChildWhichIsA_6 = v_33.FindFirstChildWhichIsA;
                local Model_18 = v_33:FindFirstChildWhichIsA("Model");
                local Not_Model_18 = not Model_18;
                -- false
                local GetAttribute_34 = Model_18.GetAttribute;
                local Someone_28 = Model_18:GetAttribute("Someone");
                if not Someone_28 then return end -- won't run
            end
            getgenv().orefound = false;
            local Waited_For_234 = task.wait();
            local Character_113 = LocalPlayer.Character;
            -- local _ = Character_113 or (unknown_value)
            local Humanoid_122 = Character_113:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_122 = Character_113:FindFirstChild("HumanoidRootPart");
            local var770 = (Humanoid_122 and HumanoidRootPart_122); -- HumanoidRootPart_122
            local var771 = (Character_113 and var770); -- HumanoidRootPart_122
            local var772 = (var771 and true); -- true
            local var773 = (var772 or false);
            local Getgenv_Current_Tween_31 = getgenv().current_tween;
            local Not_Var86_5 = not var86;
            -- false
            local var86_is_string_5 = (var86 == "");
            -- false, eq id 21
            local var774 = (Not_Var86_5 or var86_is_string_5); -- false
            local Character_114 = LocalPlayer.Character;
            -- local _ = Character_114 or (unknown_value)
            local Humanoid_123 = Character_114:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_123 = Character_114:FindFirstChild("HumanoidRootPart");
            local var775 = (Humanoid_123 and HumanoidRootPart_123); -- HumanoidRootPart_123
            local var776 = (Character_114 and var775); -- HumanoidRootPart_123
            local var777 = (var776 and true); -- true
            local var778 = (var777 or false);
            local Position_44 = HumanoidRootPart_123.Position;
            local FindFirstChild_35 = Rocks.FindFirstChild;
            local FindFirstChild_36 = Rocks:FindFirstChild(var86);
            local Not_FindFirstChild_36 = not FindFirstChild_36;
            -- false
            local GetChildren_30 = FindFirstChild_36.GetChildren;
            local Children_33 = FindFirstChild_36:GetChildren();
            for i_34, v_34 in ipairs(Children_33) do
                local GetAttribute_35 = v_34.GetAttribute;
                local IsOccupied_6 = v_34:GetAttribute("IsOccupied");
                local Not_IsOccupied_6 = not IsOccupied_6;
                -- false
                local FindFirstChildWhichIsA_7 = v_34.FindFirstChildWhichIsA;
                local Model_19 = v_34:FindFirstChildWhichIsA("Model");
                local Not_Model_19 = not Model_19;
                -- false
                local GetAttribute_36 = Model_19.GetAttribute;
                local Someone_29 = Model_19:GetAttribute("Someone");
                if not Someone_29 then return end -- won't run
            end
            getgenv().orefound = false;
            local Waited_For_235 = task.wait();
            local Character_115 = LocalPlayer.Character;
            -- local _ = Character_115 or (unknown_value)
            local Humanoid_124 = Character_115:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_124 = Character_115:FindFirstChild("HumanoidRootPart");
            local var780 = (Humanoid_124 and HumanoidRootPart_124); -- HumanoidRootPart_124
            local var781 = (Character_115 and var780); -- HumanoidRootPart_124
            local var782 = (var781 and true); -- true
            local var783 = (var782 or false);
            local Getgenv_Current_Tween_32 = getgenv().current_tween;
            local Not_Var86_6 = not var86;
            -- false
            local var86_is_string_6 = (var86 == "");
            -- false, eq id 22
            local var784 = (Not_Var86_6 or var86_is_string_6); -- false
            local Character_116 = LocalPlayer.Character;
            -- local _ = Character_116 or (unknown_value)
            local Humanoid_125 = Character_116:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_125 = Character_116:FindFirstChild("HumanoidRootPart");
            local var785 = (Humanoid_125 and HumanoidRootPart_125); -- HumanoidRootPart_125
            local var786 = (Character_116 and var785); -- HumanoidRootPart_125
            local var787 = (var786 and true); -- true
            local var788 = (var787 or false);
            local Position_45 = HumanoidRootPart_125.Position;
            local FindFirstChild_37 = Rocks.FindFirstChild;
            local FindFirstChild_38 = Rocks:FindFirstChild(var86);
            local Not_FindFirstChild_38 = not FindFirstChild_38;
            -- false
            local GetChildren_31 = FindFirstChild_38.GetChildren;
            local Children_34 = FindFirstChild_38:GetChildren();
            for i_35, v_35 in ipairs(Children_34) do
                local GetAttribute_37 = v_35.GetAttribute;
                local IsOccupied_7 = v_35:GetAttribute("IsOccupied");
                local Not_IsOccupied_7 = not IsOccupied_7;
                -- false
                local FindFirstChildWhichIsA_8 = v_35.FindFirstChildWhichIsA;
                local Model_20 = v_35:FindFirstChildWhichIsA("Model");
                local Not_Model_20 = not Model_20;
                -- false
                local GetAttribute_38 = Model_20.GetAttribute;
                local Someone_30 = Model_20:GetAttribute("Someone");
                if not Someone_30 then return end -- won't run
            end
            getgenv().orefound = false;
            local Waited_For_236 = task.wait();
            local Character_117 = LocalPlayer.Character;
            -- local _ = Character_117 or (unknown_value)
            local Humanoid_126 = Character_117:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_126 = Character_117:FindFirstChild("HumanoidRootPart");
            local var790 = (Humanoid_126 and HumanoidRootPart_126); -- HumanoidRootPart_126
            local var791 = (Character_117 and var790); -- HumanoidRootPart_126
            local var792 = (var791 and true); -- true
            local var793 = (var792 or false);
            local Getgenv_Current_Tween_33 = getgenv().current_tween;
            local Not_Var86_7 = not var86;
            -- false
            local var86_is_string_7 = (var86 == "");
            -- false, eq id 23
            local var794 = (Not_Var86_7 or var86_is_string_7); -- false
            local Character_118 = LocalPlayer.Character;
            -- local _ = Character_118 or (unknown_value)
            local Humanoid_127 = Character_118:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_127 = Character_118:FindFirstChild("HumanoidRootPart");
            local var795 = (Humanoid_127 and HumanoidRootPart_127); -- HumanoidRootPart_127
            local var796 = (Character_118 and var795); -- HumanoidRootPart_127
            local var797 = (var796 and true); -- true
            local var798 = (var797 or false);
            local Position_46 = HumanoidRootPart_127.Position;
            local FindFirstChild_39 = Rocks.FindFirstChild;
            local FindFirstChild_40 = Rocks:FindFirstChild(var86);
            local Not_FindFirstChild_40 = not FindFirstChild_40;
            -- false
            local GetChildren_32 = FindFirstChild_40.GetChildren;
            local Children_35 = FindFirstChild_40:GetChildren();
            for i_36, v_36 in ipairs(Children_35) do
                local GetAttribute_39 = v_36.GetAttribute;
                local IsOccupied_8 = v_36:GetAttribute("IsOccupied");
                local Not_IsOccupied_8 = not IsOccupied_8;
                -- false
                local FindFirstChildWhichIsA_9 = v_36.FindFirstChildWhichIsA;
                local Model_21 = v_36:FindFirstChildWhichIsA("Model");
                local Not_Model_21 = not Model_21;
                -- false
                local GetAttribute_40 = Model_21.GetAttribute;
                local Someone_31 = Model_21:GetAttribute("Someone");
                if not Someone_31 then return end -- won't run
            end
            getgenv().orefound = false;
            local Waited_For_237 = task.wait();
            local Character_119 = LocalPlayer.Character;
            -- local _ = Character_119 or (unknown_value)
            local Humanoid_128 = Character_119:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_128 = Character_119:FindFirstChild("HumanoidRootPart");
            local var800 = (Humanoid_128 and HumanoidRootPart_128); -- HumanoidRootPart_128
            local var801 = (Character_119 and var800); -- HumanoidRootPart_128
            local var802 = (var801 and true); -- true
            local var803 = (var802 or false);
            local Getgenv_Current_Tween_34 = getgenv().current_tween;
            local Not_Var86_8 = not var86;
            -- false
            local var86_is_string_8 = (var86 == "");
            -- false, eq id 24
            local var804 = (Not_Var86_8 or var86_is_string_8); -- false
            local Character_120 = LocalPlayer.Character;
            -- local _ = Character_120 or (unknown_value)
            local Humanoid_129 = Character_120:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_129 = Character_120:FindFirstChild("HumanoidRootPart");
            local var805 = (Humanoid_129 and HumanoidRootPart_129); -- HumanoidRootPart_129
            local var806 = (Character_120 and var805); -- HumanoidRootPart_129
            local var807 = (var806 and true); -- true
            local var808 = (var807 or false);
            local Position_47 = HumanoidRootPart_129.Position;
            local FindFirstChild_41 = Rocks.FindFirstChild;
            local FindFirstChild_42 = Rocks:FindFirstChild(var86);
            local Not_FindFirstChild_42 = not FindFirstChild_42;
            -- false
            local GetChildren_33 = FindFirstChild_42.GetChildren;
            local Children_36 = FindFirstChild_42:GetChildren();
            for i_37, v_37 in ipairs(Children_36) do
                local GetAttribute_41 = v_37.GetAttribute;
                local IsOccupied_9 = v_37:GetAttribute("IsOccupied");
                local Not_IsOccupied_9 = not IsOccupied_9;
                -- false
                local FindFirstChildWhichIsA_10 = v_37.FindFirstChildWhichIsA;
                local Model_22 = v_37:FindFirstChildWhichIsA("Model");
                local Not_Model_22 = not Model_22;
                -- false
                local GetAttribute_42 = Model_22.GetAttribute;
                local Someone_32 = Model_22:GetAttribute("Someone");
                if not Someone_32 then return end -- won't run
            end
            getgenv().orefound = false;
            local Waited_For_238 = task.wait();
            local Character_121 = LocalPlayer.Character;
            -- local _ = Character_121 or (unknown_value)
            local Humanoid_130 = Character_121:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_130 = Character_121:FindFirstChild("HumanoidRootPart");
            local var810 = (Humanoid_130 and HumanoidRootPart_130); -- HumanoidRootPart_130
            local var811 = (Character_121 and var810); -- HumanoidRootPart_130
            local var812 = (var811 and true); -- true
            local var813 = (var812 or false);
            local Getgenv_Current_Tween_35 = getgenv().current_tween;
            local Not_Var86_9 = not var86;
            -- false
            local var86_is_string_9 = (var86 == "");
            -- false, eq id 25
            local var814 = (Not_Var86_9 or var86_is_string_9); -- false
            local Character_122 = LocalPlayer.Character;
            -- local _ = Character_122 or (unknown_value)
            local Humanoid_131 = Character_122:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_131 = Character_122:FindFirstChild("HumanoidRootPart");
            local var815 = (Humanoid_131 and HumanoidRootPart_131); -- HumanoidRootPart_131
            local var816 = (Character_122 and var815); -- HumanoidRootPart_131
            local var817 = (var816 and true); -- true
            local var818 = (var817 or false);
            local Position_48 = HumanoidRootPart_131.Position;
            local FindFirstChild_43 = Rocks.FindFirstChild;
            local FindFirstChild_44 = Rocks:FindFirstChild(var86);
            local Not_FindFirstChild_44 = not FindFirstChild_44;
            -- false
            local GetChildren_34 = FindFirstChild_44.GetChildren;
            local Children_37 = FindFirstChild_44:GetChildren();
            for i_38, v_38 in ipairs(Children_37) do
                local GetAttribute_43 = v_38.GetAttribute;
                local IsOccupied_10 = v_38:GetAttribute("IsOccupied");
                local Not_IsOccupied_10 = not IsOccupied_10;
                -- false
                local FindFirstChildWhichIsA_11 = v_38.FindFirstChildWhichIsA;
                local Model_23 = v_38:FindFirstChildWhichIsA("Model");
                local Not_Model_23 = not Model_23;
                -- false
                local GetAttribute_44 = Model_23.GetAttribute;
                local Someone_33 = Model_23:GetAttribute("Someone");
                if not Someone_33 then return end -- won't run
            end
            getgenv().orefound = false;
            local Waited_For_239 = task.wait();
            local Character_123 = LocalPlayer.Character;
            -- local _ = Character_123 or (unknown_value)
            local Humanoid_132 = Character_123:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_132 = Character_123:FindFirstChild("HumanoidRootPart");
            local var820 = (Humanoid_132 and HumanoidRootPart_132); -- HumanoidRootPart_132
            local var821 = (Character_123 and var820); -- HumanoidRootPart_132
            local var822 = (var821 and true); -- true
            local var823 = (var822 or false);
            local Getgenv_Current_Tween_36 = getgenv().current_tween;
            local Not_Var86_10 = not var86;
            -- false
            local var86_is_string_10 = (var86 == "");
            -- false, eq id 26
            local var824 = (Not_Var86_10 or var86_is_string_10); -- false
            local Character_124 = LocalPlayer.Character;
            -- local _ = Character_124 or (unknown_value)
            local Humanoid_133 = Character_124:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_133 = Character_124:FindFirstChild("HumanoidRootPart");
            local var825 = (Humanoid_133 and HumanoidRootPart_133); -- HumanoidRootPart_133
            local var826 = (Character_124 and var825); -- HumanoidRootPart_133
            local var827 = (var826 and true); -- true
            local var828 = (var827 or false);
            local Position_49 = HumanoidRootPart_133.Position;
            local FindFirstChild_45 = Rocks.FindFirstChild;
            local FindFirstChild_46 = Rocks:FindFirstChild(var86);
            local Not_FindFirstChild_46 = not FindFirstChild_46;
            -- false
            local GetChildren_35 = FindFirstChild_46.GetChildren;
            local Children_38 = FindFirstChild_46:GetChildren();
            for i_39, v_39 in ipairs(Children_38) do
                local GetAttribute_45 = v_39.GetAttribute;
                local IsOccupied_11 = v_39:GetAttribute("IsOccupied");
                local Not_IsOccupied_11 = not IsOccupied_11;
                -- false
                local FindFirstChildWhichIsA_12 = v_39.FindFirstChildWhichIsA;
                local Model_24 = v_39:FindFirstChildWhichIsA("Model");
                local Not_Model_24 = not Model_24;
                -- false
                local GetAttribute_46 = Model_24.GetAttribute;
                local Someone_34 = Model_24:GetAttribute("Someone");
                if not Someone_34 then return end -- won't run
            end
            getgenv().orefound = false;
            local Waited_For_240 = task.wait();
            local Character_125 = LocalPlayer.Character;
            -- local _ = Character_125 or (unknown_value)
            local Humanoid_134 = Character_125:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_134 = Character_125:FindFirstChild("HumanoidRootPart");
            local var830 = (Humanoid_134 and HumanoidRootPart_134); -- HumanoidRootPart_134
            local var831 = (Character_125 and var830); -- HumanoidRootPart_134
            local var832 = (var831 and true); -- true
            local var833 = (var832 or false);
            local Getgenv_Current_Tween_37 = getgenv().current_tween;
            local Not_Var86_11 = not var86;
            -- false
            local var86_is_string_11 = (var86 == "");
            -- false, eq id 27
            local var834 = (Not_Var86_11 or var86_is_string_11); -- false
            local Character_126 = LocalPlayer.Character;
            -- local _ = Character_126 or (unknown_value)
            local Humanoid_135 = Character_126:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_135 = Character_126:FindFirstChild("HumanoidRootPart");
            local var835 = (Humanoid_135 and HumanoidRootPart_135); -- HumanoidRootPart_135
            local var836 = (Character_126 and var835); -- HumanoidRootPart_135
            error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

        end);

    end,
    Name = "Regional Ore Farm",
    Flag = "RegionalOreToggle",
});
local CreateSection_4 = Main.CreateSection;
local Auto_Teleport = Main:CreateSection("Auto Teleport");
local CreateToggle_8 = Main.CreateToggle;
local Toggle_8 = Main:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)
        local Not_P1_0_2 = not p1_0;
        -- false
        local Spawned_19 = task.spawn(function()
            local PlaceId_2 = game.PlaceId;
            local PlaceId_2_is_number = (PlaceId_2 == 129009554587176);
            -- true, eq id 28
            local Not_P1_0_9 = not p1_0;
            -- false
            local var837 = (PlaceId_2_is_number and Not_P1_0_9); -- false
            local Waited_For_241 = task.wait(1);
            local PlaceId_3 = game.PlaceId;
            local PlaceId_3_is_number = (PlaceId_3 == 129009554587176);
            -- true, eq id 29
            local Not_P1_0_10 = not p1_0;
            -- false
            local var838 = (PlaceId_3_is_number and Not_P1_0_10); -- false
            local Waited_For_242 = task.wait(1);
            local PlaceId_4 = game.PlaceId;
            local PlaceId_4_is_number = (PlaceId_4 == 129009554587176);
            -- true, eq id 30
            local Not_P1_0_11 = not p1_0;
            -- false
            local var839 = (PlaceId_4_is_number and Not_P1_0_11); -- false
            local Waited_For_243 = task.wait(1);
            local PlaceId_5 = game.PlaceId;
            local PlaceId_5_is_number = (PlaceId_5 == 129009554587176);
            -- true, eq id 31
            local Not_P1_0_12 = not p1_0;
            -- false
            local var840 = (PlaceId_5_is_number and Not_P1_0_12); -- false
            local Waited_For_244 = task.wait(1);
            local PlaceId_6 = game.PlaceId;
            local PlaceId_6_is_number = (PlaceId_6 == 129009554587176);
            -- true, eq id 32
            local Not_P1_0_13 = not p1_0;
            -- false
            local var841 = (PlaceId_6_is_number and Not_P1_0_13); -- false
            local Waited_For_245 = task.wait(1);
            local PlaceId_7 = game.PlaceId;
            local PlaceId_7_is_number = (PlaceId_7 == 129009554587176);
            -- true, eq id 33
            local Not_P1_0_14 = not p1_0;
            -- false
            local var842 = (PlaceId_7_is_number and Not_P1_0_14); -- false
            local Waited_For_246 = task.wait(1);
            local PlaceId_8 = game.PlaceId;
            local PlaceId_8_is_number = (PlaceId_8 == 129009554587176);
            -- true, eq id 34
            local Not_P1_0_15 = not p1_0;
            -- false
            local var843 = (PlaceId_8_is_number and Not_P1_0_15); -- false
            local Waited_For_247 = task.wait(1);
            local PlaceId_9 = game.PlaceId;
            local PlaceId_9_is_number = (PlaceId_9 == 129009554587176);
            -- true, eq id 35
            local Not_P1_0_16 = not p1_0;
            -- false
            local var844 = (PlaceId_9_is_number and Not_P1_0_16); -- false
            local Waited_For_248 = task.wait(1);
            local PlaceId_10 = game.PlaceId;
            local var845 = (PlaceId_10 == 129009554587176);
            -- true, eq id 36
            local Not_P1_0_17 = not p1_0;
            -- false
            local var846 = (var845 and Not_P1_0_17); -- false
            local Waited_For_249 = task.wait(1);
            local PlaceId_11 = game.PlaceId;
            local var847 = (PlaceId_11 == 129009554587176);
            -- true, eq id 37
            local Not_P1_0_18 = not p1_0;
            -- false
            local var848 = (var847 and Not_P1_0_18); -- false
            local Waited_For_250 = task.wait(1);
            local PlaceId_12 = game.PlaceId;
            local var849 = (PlaceId_12 == 129009554587176);
            -- true, eq id 38
            local Not_P1_0_19 = not p1_0;
            -- false
            local var850 = (var849 and Not_P1_0_19); -- false
            local Waited_For_251 = task.wait(1);
            local PlaceId_13 = game.PlaceId;
            local var851 = (PlaceId_13 == 129009554587176);
            -- true, eq id 39
            local Not_P1_0_20 = not p1_0;
            -- false
            local var852 = (var851 and Not_P1_0_20); -- false
            local Waited_For_252 = task.wait(1);
            local PlaceId_14 = game.PlaceId;
            local var853 = (PlaceId_14 == 129009554587176);
            -- true, eq id 40
            local Not_P1_0_21 = not p1_0;
            -- false
            local var854 = (var853 and Not_P1_0_21); -- false
            local Waited_For_253 = task.wait(1);
            local PlaceId_15 = game.PlaceId;
            local var855 = (PlaceId_15 == 129009554587176);
            -- true, eq id 41
            local Not_P1_0_22 = not p1_0;
            -- false
            local var856 = (var855 and Not_P1_0_22); -- false
            local Waited_For_254 = task.wait(1);
            local PlaceId_16 = game.PlaceId;
            local var857 = (PlaceId_16 == 129009554587176);
            -- true, eq id 42
            local Not_P1_0_23 = not p1_0;
            -- false
            local var858 = (var857 and Not_P1_0_23); -- false
            local Waited_For_255 = task.wait(1);
            local PlaceId_17 = game.PlaceId;
            local var859 = (PlaceId_17 == 129009554587176);
            -- true, eq id 43
            local Not_P1_0_24 = not p1_0;
            -- false
            local var860 = (var859 and Not_P1_0_24); -- false
            local Waited_For_256 = task.wait(1);
            local PlaceId_18 = game.PlaceId;
            local var861 = (PlaceId_18 == 129009554587176);
            -- true, eq id 44
            local Not_P1_0_25 = not p1_0;
            -- false
            local var862 = (var861 and Not_P1_0_25); -- false
            local Waited_For_257 = task.wait(1);
            local PlaceId_19 = game.PlaceId;
            local var863 = (PlaceId_19 == 129009554587176);
            -- true, eq id 45
            local Not_P1_0_26 = not p1_0;
            -- false
            local var864 = (var863 and Not_P1_0_26); -- false
            local Waited_For_258 = task.wait(1);
            local PlaceId_20 = game.PlaceId;
            local var865 = (PlaceId_20 == 129009554587176);
            -- true, eq id 46
            local Not_P1_0_27 = not p1_0;
            -- false
            local var866 = (var865 and Not_P1_0_27); -- false
            local Waited_For_259 = task.wait(1);
            local PlaceId_21 = game.PlaceId;
            local var867 = (PlaceId_21 == 129009554587176);
            -- true, eq id 47
            local Not_P1_0_28 = not p1_0;
            -- false
            local var868 = (var867 and Not_P1_0_28); -- false
            local Waited_For_260 = task.wait(1);
            local PlaceId_22 = game.PlaceId;
            local var869 = (PlaceId_22 == 129009554587176);
            -- true, eq id 48
            local Not_P1_0_29 = not p1_0;
            -- false
            local var870 = (var869 and Not_P1_0_29); -- false
            local Waited_For_261 = task.wait(1);
            local PlaceId_23 = game.PlaceId;
            local var871 = (PlaceId_23 == 129009554587176);
            -- true, eq id 49
            local Not_P1_0_30 = not p1_0;
            -- false
            local var872 = (var871 and Not_P1_0_30); -- false
            local Waited_For_262 = task.wait(1);
            local PlaceId_24 = game.PlaceId;
            local var873 = (PlaceId_24 == 129009554587176);
            -- true, eq id 50
            local Not_P1_0_31 = not p1_0;
            -- false
            local var874 = (var873 and Not_P1_0_31); -- false
            local Waited_For_263 = task.wait(1);
            local PlaceId_25 = game.PlaceId;
            local var875 = (PlaceId_25 == 129009554587176);
            -- true, eq id 51
            local Not_P1_0_32 = not p1_0;
            -- false
            local var876 = (var875 and Not_P1_0_32); -- false
            local Waited_For_264 = task.wait(1);
            local PlaceId_26 = game.PlaceId;
            local var877 = (PlaceId_26 == 129009554587176);
            -- true, eq id 52
            local Not_P1_0_33 = not p1_0;
            -- false
            local var878 = (var877 and Not_P1_0_33); -- false
            local Waited_For_265 = task.wait(1);
            local PlaceId_27 = game.PlaceId;
            local var879 = (PlaceId_27 == 129009554587176);
            -- true, eq id 53
            local Not_P1_0_34 = not p1_0;
            -- false
            local var880 = (var879 and Not_P1_0_34); -- false
            local Waited_For_266 = task.wait(1);
            local PlaceId_28 = game.PlaceId;
            local var881 = (PlaceId_28 == 129009554587176);
            -- true, eq id 54
            local Not_P1_0_35 = not p1_0;
            -- false
            local var882 = (var881 and Not_P1_0_35); -- false
            local Waited_For_267 = task.wait(1);
            local PlaceId_29 = game.PlaceId;
            local var883 = (PlaceId_29 == 129009554587176);
            -- true, eq id 55
            local Not_P1_0_36 = not p1_0;
            -- false
            local var884 = (var883 and Not_P1_0_36); -- false
            local Waited_For_268 = task.wait(1);
            local PlaceId_30 = game.PlaceId;
            local var885 = (PlaceId_30 == 129009554587176);
            -- true, eq id 56
            local Not_P1_0_37 = not p1_0;
            -- false
            local var886 = (var885 and Not_P1_0_37); -- false
            local Waited_For_269 = task.wait(1);
            local PlaceId_31 = game.PlaceId;
            local var887 = (PlaceId_31 == 129009554587176);
            -- true, eq id 57
            local Not_P1_0_38 = not p1_0;
            -- false
            local var888 = (var887 and Not_P1_0_38); -- false
            local Waited_For_270 = task.wait(1);
            local PlaceId_32 = game.PlaceId;
            local var889 = (PlaceId_32 == 129009554587176);
            -- true, eq id 58
            local Not_P1_0_39 = not p1_0;
            -- false
            local var890 = (var889 and Not_P1_0_39); -- false
            local Waited_For_271 = task.wait(1);
            local PlaceId_33 = game.PlaceId;
            local var891 = (PlaceId_33 == 129009554587176);
            -- true, eq id 59
            local Not_P1_0_40 = not p1_0;
            -- false
            local var892 = (var891 and Not_P1_0_40); -- false
            local Waited_For_272 = task.wait(1);
            local PlaceId_34 = game.PlaceId;
            local var893 = (PlaceId_34 == 129009554587176);
            -- true, eq id 60
            local Not_P1_0_41 = not p1_0;
            -- false
            local var894 = (var893 and Not_P1_0_41); -- false
            local Waited_For_273 = task.wait(1);
            local PlaceId_35 = game.PlaceId;
            local var895 = (PlaceId_35 == 129009554587176);
            -- true, eq id 61
            local Not_P1_0_42 = not p1_0;
            -- false
            local var896 = (var895 and Not_P1_0_42); -- false
            local Waited_For_274 = task.wait(1);
            local PlaceId_36 = game.PlaceId;
            local var897 = (PlaceId_36 == 129009554587176);
            -- true, eq id 62
            local Not_P1_0_43 = not p1_0;
            -- false
            local var898 = (var897 and Not_P1_0_43); -- false
            local Waited_For_275 = task.wait(1);
            local PlaceId_37 = game.PlaceId;
            local var899 = (PlaceId_37 == 129009554587176);
            -- true, eq id 63
            local Not_P1_0_44 = not p1_0;
            -- false
            local var900 = (var899 and Not_P1_0_44); -- false
            local Waited_For_276 = task.wait(1);
            local PlaceId_38 = game.PlaceId;
            local var901 = (PlaceId_38 == 129009554587176);
            -- true, eq id 64
            local Not_P1_0_45 = not p1_0;
            -- false
            local var902 = (var901 and Not_P1_0_45); -- false
            local Waited_For_277 = task.wait(1);
            local PlaceId_39 = game.PlaceId;
            local var903 = (PlaceId_39 == 129009554587176);
            -- true, eq id 65
            local Not_P1_0_46 = not p1_0;
            -- false
            local var904 = (var903 and Not_P1_0_46); -- false
            local Waited_For_278 = task.wait(1);
            local PlaceId_40 = game.PlaceId;
            local var905 = (PlaceId_40 == 129009554587176);
            -- true, eq id 66
            local Not_P1_0_47 = not p1_0;
            -- false
            local var906 = (var905 and Not_P1_0_47); -- false
            local Waited_For_279 = task.wait(1);
            local PlaceId_41 = game.PlaceId;
            local var907 = (PlaceId_41 == 129009554587176);
            -- true, eq id 67
            local Not_P1_0_48 = not p1_0;
            -- false
            local var908 = (var907 and Not_P1_0_48); -- false
            local Waited_For_280 = task.wait(1);
            local PlaceId_42 = game.PlaceId;
            local var909 = (PlaceId_42 == 129009554587176);
            -- true, eq id 68
            local Not_P1_0_49 = not p1_0;
            -- false
            local var910 = (var909 and Not_P1_0_49); -- false
            local Waited_For_281 = task.wait(1);
            local PlaceId_43 = game.PlaceId;
            local var911 = (PlaceId_43 == 129009554587176);
            -- true, eq id 69
            local Not_P1_0_50 = not p1_0;
            -- false
            local var912 = (var911 and Not_P1_0_50); -- false
            local Waited_For_282 = task.wait(1);
            local PlaceId_44 = game.PlaceId;
            local var913 = (PlaceId_44 == 129009554587176);
            -- true, eq id 70
            local Not_P1_0_51 = not p1_0;
            -- false
            local var914 = (var913 and Not_P1_0_51); -- false
            local Waited_For_283 = task.wait(1);
            local PlaceId_45 = game.PlaceId;
            local var915 = (PlaceId_45 == 129009554587176);
            -- true, eq id 71
            local Not_P1_0_52 = not p1_0;
            -- false
            local var916 = (var915 and Not_P1_0_52); -- false
            local Waited_For_284 = task.wait(1);
            local PlaceId_46 = game.PlaceId;
            local var917 = (PlaceId_46 == 129009554587176);
            -- true, eq id 72
            local Not_P1_0_53 = not p1_0;
            -- false
            local var918 = (var917 and Not_P1_0_53); -- false
            local Waited_For_285 = task.wait(1);
            local PlaceId_47 = game.PlaceId;
            local var919 = (PlaceId_47 == 129009554587176);
            -- true, eq id 73
            local Not_P1_0_54 = not p1_0;
            -- false
            local var920 = (var919 and Not_P1_0_54); -- false
            local Waited_For_286 = task.wait(1);
            local PlaceId_48 = game.PlaceId;
            local var921 = (PlaceId_48 == 129009554587176);
            -- true, eq id 74
            local Not_P1_0_55 = not p1_0;
            -- false
            local var922 = (var921 and Not_P1_0_55); -- false
            local Waited_For_287 = task.wait(1);
            local PlaceId_49 = game.PlaceId;
            local var923 = (PlaceId_49 == 129009554587176);
            -- true, eq id 75
            local Not_P1_0_56 = not p1_0;
            -- false
            local var924 = (var923 and Not_P1_0_56); -- false
            local Waited_For_288 = task.wait(1);
            local PlaceId_50 = game.PlaceId;
            local var925 = (PlaceId_50 == 129009554587176);
            -- true, eq id 76
            local Not_P1_0_57 = not p1_0;
            -- false
            local var926 = (var925 and Not_P1_0_57); -- false
            local Waited_For_289 = task.wait(1);
            local PlaceId_51 = game.PlaceId;
            local var927 = (PlaceId_51 == 129009554587176);
            -- true, eq id 77
            local Not_P1_0_58 = not p1_0;
            -- false
            local var928 = (var927 and Not_P1_0_58); -- false
            local Waited_For_290 = task.wait(1);
            local PlaceId_52 = game.PlaceId;
            local var929 = (PlaceId_52 == 129009554587176);
            -- true, eq id 78
            local Not_P1_0_59 = not p1_0;
            -- false
            local var930 = (var929 and Not_P1_0_59); -- false
            local Waited_For_291 = task.wait(1);
            local PlaceId_53 = game.PlaceId;
            local var931 = (PlaceId_53 == 129009554587176);
            -- true, eq id 79
            local Not_P1_0_60 = not p1_0;
            -- false
            local var932 = (var931 and Not_P1_0_60); -- false
            local Waited_For_292 = task.wait(1);
            local PlaceId_54 = game.PlaceId;
            local var933 = (PlaceId_54 == 129009554587176);
            -- true, eq id 80
            local Not_P1_0_61 = not p1_0;
            -- false
            local var934 = (var933 and Not_P1_0_61); -- false
            local Waited_For_293 = task.wait(1);
            local PlaceId_55 = game.PlaceId;
            local var935 = (PlaceId_55 == 129009554587176);
            -- true, eq id 81
            local Not_P1_0_62 = not p1_0;
            -- false
            local var936 = (var935 and Not_P1_0_62); -- false
            local Waited_For_294 = task.wait(1);
            local PlaceId_56 = game.PlaceId;
            local var937 = (PlaceId_56 == 129009554587176);
            -- true, eq id 82
            local Not_P1_0_63 = not p1_0;
            -- false
            local var938 = (var937 and Not_P1_0_63); -- false
            local Waited_For_295 = task.wait(1);
            local PlaceId_57 = game.PlaceId;
            local var939 = (PlaceId_57 == 129009554587176);
            -- true, eq id 83
            local Not_P1_0_64 = not p1_0;
            -- false
            local var940 = (var939 and Not_P1_0_64); -- false
            local Waited_For_296 = task.wait(1);
            local PlaceId_58 = game.PlaceId;
            local var941 = (PlaceId_58 == 129009554587176);
            -- true, eq id 84
            local Not_P1_0_65 = not p1_0;
            -- false
            local var942 = (var941 and Not_P1_0_65); -- false
            local Waited_For_297 = task.wait(1);
            local PlaceId_59 = game.PlaceId;
            local var943 = (PlaceId_59 == 129009554587176);
            -- true, eq id 85
            local Not_P1_0_66 = not p1_0;
            -- false
            local var944 = (var943 and Not_P1_0_66); -- false
            local Waited_For_298 = task.wait(1);
            local PlaceId_60 = game.PlaceId;
            local var945 = (PlaceId_60 == 129009554587176);
            -- true, eq id 86
            local Not_P1_0_67 = not p1_0;
            -- false
            local var946 = (var945 and Not_P1_0_67); -- false
            local Waited_For_299 = task.wait(1);
            local PlaceId_61 = game.PlaceId;
            local var947 = (PlaceId_61 == 129009554587176);
            -- true, eq id 87
            local Not_P1_0_68 = not p1_0;
            -- false
            local var948 = (var947 and Not_P1_0_68); -- false
            local Waited_For_300 = task.wait(1);
            local PlaceId_62 = game.PlaceId;
            local var949 = (PlaceId_62 == 129009554587176);
            -- true, eq id 88
            local Not_P1_0_69 = not p1_0;
            -- false
            local var950 = (var949 and Not_P1_0_69); -- false
            local Waited_For_301 = task.wait(1);
            local PlaceId_63 = game.PlaceId;
            local var951 = (PlaceId_63 == 129009554587176);
            -- true, eq id 89
            local Not_P1_0_70 = not p1_0;
            -- false
            local var952 = (var951 and Not_P1_0_70); -- false
            local Waited_For_302 = task.wait(1);
            local PlaceId_64 = game.PlaceId;
            local var953 = (PlaceId_64 == 129009554587176);
            -- true, eq id 90
            local Not_P1_0_71 = not p1_0;
            -- false
            local var954 = (var953 and Not_P1_0_71); -- false
            local Waited_For_303 = task.wait(1);
            local PlaceId_65 = game.PlaceId;
            local var955 = (PlaceId_65 == 129009554587176);
            -- true, eq id 91
            local Not_P1_0_72 = not p1_0;
            -- false
            local var956 = (var955 and Not_P1_0_72); -- false
            local Waited_For_304 = task.wait(1);
            local PlaceId_66 = game.PlaceId;
            local var957 = (PlaceId_66 == 129009554587176);
            -- true, eq id 92
            local Not_P1_0_73 = not p1_0;
            -- false
            local var958 = (var957 and Not_P1_0_73); -- false
            local Waited_For_305 = task.wait(1);
            local PlaceId_67 = game.PlaceId;
            local var959 = (PlaceId_67 == 129009554587176);
            -- true, eq id 93
            local Not_P1_0_74 = not p1_0;
            -- false
            local var960 = (var959 and Not_P1_0_74); -- false
            local Waited_For_306 = task.wait(1);
            local PlaceId_68 = game.PlaceId;
            local var961 = (PlaceId_68 == 129009554587176);
            -- true, eq id 94
            local Not_P1_0_75 = not p1_0;
            -- false
            local var962 = (var961 and Not_P1_0_75); -- false
            local Waited_For_307 = task.wait(1);
            local PlaceId_69 = game.PlaceId;
            local var963 = (PlaceId_69 == 129009554587176);
            -- true, eq id 95
            local Not_P1_0_76 = not p1_0;
            -- false
            local var964 = (var963 and Not_P1_0_76); -- false
            local Waited_For_308 = task.wait(1);
            local PlaceId_70 = game.PlaceId;
            local var965 = (PlaceId_70 == 129009554587176);
            -- true, eq id 96
            local Not_P1_0_77 = not p1_0;
            -- false
            local var966 = (var965 and Not_P1_0_77); -- false
            local Waited_For_309 = task.wait(1);
            local PlaceId_71 = game.PlaceId;
            local var967 = (PlaceId_71 == 129009554587176);
            -- true, eq id 97
            local Not_P1_0_78 = not p1_0;
            -- false
            local var968 = (var967 and Not_P1_0_78); -- false
            local Waited_For_310 = task.wait(1);
            local PlaceId_72 = game.PlaceId;
            local var969 = (PlaceId_72 == 129009554587176);
            -- true, eq id 98
            local Not_P1_0_79 = not p1_0;
            -- false
            local var970 = (var969 and Not_P1_0_79); -- false
            local Waited_For_311 = task.wait(1);
            local PlaceId_73 = game.PlaceId;
            local var971 = (PlaceId_73 == 129009554587176);
            -- true, eq id 99
            local Not_P1_0_80 = not p1_0;
            -- false
            local var972 = (var971 and Not_P1_0_80); -- false
            local Waited_For_312 = task.wait(1);
            local PlaceId_74 = game.PlaceId;
            local var973 = (PlaceId_74 == 129009554587176);
            -- true, eq id 100
            local Not_P1_0_81 = not p1_0;
            -- false
            local var974 = (var973 and Not_P1_0_81); -- false
            local Waited_For_313 = task.wait(1);
            local PlaceId_75 = game.PlaceId;
            local var975 = (PlaceId_75 == 129009554587176);
            -- true, eq id 101
            local Not_P1_0_82 = not p1_0;
            -- false
            local var976 = (var975 and Not_P1_0_82); -- false
            local Waited_For_314 = task.wait(1);
            local PlaceId_76 = game.PlaceId;
            local var977 = (PlaceId_76 == 129009554587176);
            -- true, eq id 102
            local Not_P1_0_83 = not p1_0;
            -- false
            local var978 = (var977 and Not_P1_0_83); -- false
            local Waited_For_315 = task.wait(1);
            local PlaceId_77 = game.PlaceId;
            local var979 = (PlaceId_77 == 129009554587176);
            -- true, eq id 103
            local Not_P1_0_84 = not p1_0;
            -- false
            local var980 = (var979 and Not_P1_0_84); -- false
            local Waited_For_316 = task.wait(1);
            local PlaceId_78 = game.PlaceId;
            local var981 = (PlaceId_78 == 129009554587176);
            -- true, eq id 104
            local Not_P1_0_85 = not p1_0;
            -- false
            local var982 = (var981 and Not_P1_0_85); -- false
            local Waited_For_317 = task.wait(1);
            local PlaceId_79 = game.PlaceId;
            local var983 = (PlaceId_79 == 129009554587176);
            -- true, eq id 105
            local Not_P1_0_86 = not p1_0;
            -- false
            local var984 = (var983 and Not_P1_0_86); -- false
            local Waited_For_318 = task.wait(1);
            local PlaceId_80 = game.PlaceId;
            local var985 = (PlaceId_80 == 129009554587176);
            -- true, eq id 106
            local Not_P1_0_87 = not p1_0;
            -- false
            local var986 = (var985 and Not_P1_0_87); -- false
            local Waited_For_319 = task.wait(1);
            local PlaceId_81 = game.PlaceId;
            local var987 = (PlaceId_81 == 129009554587176);
            -- true, eq id 107
            local Not_P1_0_88 = not p1_0;
            -- false
            local var988 = (var987 and Not_P1_0_88); -- false
            local Waited_For_320 = task.wait(1);
            local PlaceId_82 = game.PlaceId;
            local var989 = (PlaceId_82 == 129009554587176);
            -- true, eq id 108
            local Not_P1_0_89 = not p1_0;
            -- false
            local var990 = (var989 and Not_P1_0_89); -- false
            local Waited_For_321 = task.wait(1);
            local PlaceId_83 = game.PlaceId;
            local var991 = (PlaceId_83 == 129009554587176);
            -- true, eq id 109
            local Not_P1_0_90 = not p1_0;
            -- false
            local var992 = (var991 and Not_P1_0_90); -- false
            local Waited_For_322 = task.wait(1);
            local PlaceId_84 = game.PlaceId;
            local var993 = (PlaceId_84 == 129009554587176);
            -- true, eq id 110
            local Not_P1_0_91 = not p1_0;
            -- false
            local var994 = (var993 and Not_P1_0_91); -- false
            local Waited_For_323 = task.wait(1);
            local PlaceId_85 = game.PlaceId;
            local var995 = (PlaceId_85 == 129009554587176);
            -- true, eq id 111
            error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

        end);

    end,
    Name = "Auto TP World 1",
    Flag = "autoWorld1Toggle",
});
local CreateToggle_9 = Main.CreateToggle;
local Toggle_9 = Main:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)
        local Not_P1_0_3 = not p1_0;
        -- false
        local Spawned_20 = task.spawn(function()
            local PlaceId_86 = game.PlaceId;
            local var996 = (PlaceId_86 == 76558904092080);
            -- true, eq id 112
            local Not_P1_0_92 = not p1_0;
            -- false
            local var997 = (var996 and Not_P1_0_92); -- false
            local Waited_For_324 = task.wait(1);
            local PlaceId_87 = game.PlaceId;
            local var998 = (PlaceId_87 == 76558904092080);
            -- true, eq id 113
            local Not_P1_0_93 = not p1_0;
            -- false
            local var999 = (var998 and Not_P1_0_93); -- false
            local Waited_For_325 = task.wait(1);
            local PlaceId_88 = game.PlaceId;
            local var1000 = (PlaceId_88 == 76558904092080);
            -- true, eq id 114
            local Not_P1_0_94 = not p1_0;
            -- false
            local var1001 = (var1000 and Not_P1_0_94); -- false
            local Waited_For_326 = task.wait(1);
            local PlaceId_89 = game.PlaceId;
            local var1002 = (PlaceId_89 == 76558904092080);
            -- true, eq id 115
            local Not_P1_0_95 = not p1_0;
            -- false
            local var1003 = (var1002 and Not_P1_0_95); -- false
            local Waited_For_327 = task.wait(1);
            local PlaceId_90 = game.PlaceId;
            local var1004 = (PlaceId_90 == 76558904092080);
            -- true, eq id 116
            local Not_P1_0_96 = not p1_0;
            -- false
            local var1005 = (var1004 and Not_P1_0_96); -- false
            local Waited_For_328 = task.wait(1);
            local PlaceId_91 = game.PlaceId;
            local var1006 = (PlaceId_91 == 76558904092080);
            -- true, eq id 117
            local Not_P1_0_97 = not p1_0;
            -- false
            local var1007 = (var1006 and Not_P1_0_97); -- false
            local Waited_For_329 = task.wait(1);
            local PlaceId_92 = game.PlaceId;
            local var1008 = (PlaceId_92 == 76558904092080);
            -- true, eq id 118
            local Not_P1_0_98 = not p1_0;
            -- false
            local var1009 = (var1008 and Not_P1_0_98); -- false
            local Waited_For_330 = task.wait(1);
            local PlaceId_93 = game.PlaceId;
            local var1010 = (PlaceId_93 == 76558904092080);
            -- true, eq id 119
            local Not_P1_0_99 = not p1_0;
            -- false
            local var1011 = (var1010 and Not_P1_0_99); -- false
            local Waited_For_331 = task.wait(1);
            local PlaceId_94 = game.PlaceId;
            local var1012 = (PlaceId_94 == 76558904092080);
            -- true, eq id 120
            local Not_P1_0_100 = not p1_0;
            -- false
            local var1013 = (var1012 and Not_P1_0_100); -- false
            local Waited_For_332 = task.wait(1);
            local PlaceId_95 = game.PlaceId;
            local var1014 = (PlaceId_95 == 76558904092080);
            -- true, eq id 121
            local Not_P1_0_101 = not p1_0;
            -- false
            local var1015 = (var1014 and Not_P1_0_101); -- false
            local Waited_For_333 = task.wait(1);
            local PlaceId_96 = game.PlaceId;
            local var1016 = (PlaceId_96 == 76558904092080);
            -- true, eq id 122
            local Not_P1_0_102 = not p1_0;
            -- false
            local var1017 = (var1016 and Not_P1_0_102); -- false
            local Waited_For_334 = task.wait(1);
            local PlaceId_97 = game.PlaceId;
            local var1018 = (PlaceId_97 == 76558904092080);
            -- true, eq id 123
            local Not_P1_0_103 = not p1_0;
            -- false
            local var1019 = (var1018 and Not_P1_0_103); -- false
            local Waited_For_335 = task.wait(1);
            local PlaceId_98 = game.PlaceId;
            local var1020 = (PlaceId_98 == 76558904092080);
            -- true, eq id 124
            local Not_P1_0_104 = not p1_0;
            -- false
            local var1021 = (var1020 and Not_P1_0_104); -- false
            local Waited_For_336 = task.wait(1);
            local PlaceId_99 = game.PlaceId;
            local var1022 = (PlaceId_99 == 76558904092080);
            -- true, eq id 125
            local Not_P1_0_105 = not p1_0;
            -- false
            local var1023 = (var1022 and Not_P1_0_105); -- false
            local Waited_For_337 = task.wait(1);
            local PlaceId_100 = game.PlaceId;
            local var1024 = (PlaceId_100 == 76558904092080);
            -- true, eq id 126
            local Not_P1_0_106 = not p1_0;
            -- false
            local var1025 = (var1024 and Not_P1_0_106); -- false
            local Waited_For_338 = task.wait(1);
            local PlaceId_101 = game.PlaceId;
            local var1026 = (PlaceId_101 == 76558904092080);
            -- true, eq id 127
            local Not_P1_0_107 = not p1_0;
            -- false
            local var1027 = (var1026 and Not_P1_0_107); -- false
            local Waited_For_339 = task.wait(1);
            local PlaceId_102 = game.PlaceId;
            local var1028 = (PlaceId_102 == 76558904092080);
            -- true, eq id 128
            local Not_P1_0_108 = not p1_0;
            -- false
            local var1029 = (var1028 and Not_P1_0_108); -- false
            local Waited_For_340 = task.wait(1);
            local PlaceId_103 = game.PlaceId;
            local var1030 = (PlaceId_103 == 76558904092080);
            -- true, eq id 129
            local Not_P1_0_109 = not p1_0;
            -- false
            local var1031 = (var1030 and Not_P1_0_109); -- false
            local Waited_For_341 = task.wait(1);
            local PlaceId_104 = game.PlaceId;
            local var1032 = (PlaceId_104 == 76558904092080);
            -- true, eq id 130
            local Not_P1_0_110 = not p1_0;
            -- false
            local var1033 = (var1032 and Not_P1_0_110); -- false
            local Waited_For_342 = task.wait(1);
            local PlaceId_105 = game.PlaceId;
            local var1034 = (PlaceId_105 == 76558904092080);
            -- true, eq id 131
            local Not_P1_0_111 = not p1_0;
            -- false
            local var1035 = (var1034 and Not_P1_0_111); -- false
            local Waited_For_343 = task.wait(1);
            local PlaceId_106 = game.PlaceId;
            local var1036 = (PlaceId_106 == 76558904092080);
            -- true, eq id 132
            local Not_P1_0_112 = not p1_0;
            -- false
            local var1037 = (var1036 and Not_P1_0_112); -- false
            local Waited_For_344 = task.wait(1);
            local PlaceId_107 = game.PlaceId;
            local var1038 = (PlaceId_107 == 76558904092080);
            -- true, eq id 133
            local Not_P1_0_113 = not p1_0;
            -- false
            local var1039 = (var1038 and Not_P1_0_113); -- false
            local Waited_For_345 = task.wait(1);
            local PlaceId_108 = game.PlaceId;
            local var1040 = (PlaceId_108 == 76558904092080);
            -- true, eq id 134
            local Not_P1_0_114 = not p1_0;
            -- false
            local var1041 = (var1040 and Not_P1_0_114); -- false
            local Waited_For_346 = task.wait(1);
            local PlaceId_109 = game.PlaceId;
            local var1042 = (PlaceId_109 == 76558904092080);
            -- true, eq id 135
            local Not_P1_0_115 = not p1_0;
            -- false
            local var1043 = (var1042 and Not_P1_0_115); -- false
            local Waited_For_347 = task.wait(1);
            local PlaceId_110 = game.PlaceId;
            local var1044 = (PlaceId_110 == 76558904092080);
            -- true, eq id 136
            local Not_P1_0_116 = not p1_0;
            -- false
            local var1045 = (var1044 and Not_P1_0_116); -- false
            local Waited_For_348 = task.wait(1);
            local PlaceId_111 = game.PlaceId;
            local var1046 = (PlaceId_111 == 76558904092080);
            -- true, eq id 137
            local Not_P1_0_117 = not p1_0;
            -- false
            local var1047 = (var1046 and Not_P1_0_117); -- false
            local Waited_For_349 = task.wait(1);
            local PlaceId_112 = game.PlaceId;
            local var1048 = (PlaceId_112 == 76558904092080);
            -- true, eq id 138
            local Not_P1_0_118 = not p1_0;
            -- false
            local var1049 = (var1048 and Not_P1_0_118); -- false
            local Waited_For_350 = task.wait(1);
            local PlaceId_113 = game.PlaceId;
            local var1050 = (PlaceId_113 == 76558904092080);
            -- true, eq id 139
            local Not_P1_0_119 = not p1_0;
            -- false
            local var1051 = (var1050 and Not_P1_0_119); -- false
            local Waited_For_351 = task.wait(1);
            local PlaceId_114 = game.PlaceId;
            local var1052 = (PlaceId_114 == 76558904092080);
            -- true, eq id 140
            local Not_P1_0_120 = not p1_0;
            -- false
            local var1053 = (var1052 and Not_P1_0_120); -- false
            local Waited_For_352 = task.wait(1);
            local PlaceId_115 = game.PlaceId;
            local var1054 = (PlaceId_115 == 76558904092080);
            -- true, eq id 141
            local Not_P1_0_121 = not p1_0;
            -- false
            local var1055 = (var1054 and Not_P1_0_121); -- false
            local Waited_For_353 = task.wait(1);
            local PlaceId_116 = game.PlaceId;
            local var1056 = (PlaceId_116 == 76558904092080);
            -- true, eq id 142
            local Not_P1_0_122 = not p1_0;
            -- false
            local var1057 = (var1056 and Not_P1_0_122); -- false
            local Waited_For_354 = task.wait(1);
            local PlaceId_117 = game.PlaceId;
            local var1058 = (PlaceId_117 == 76558904092080);
            -- true, eq id 143
            local Not_P1_0_123 = not p1_0;
            -- false
            local var1059 = (var1058 and Not_P1_0_123); -- false
            local Waited_For_355 = task.wait(1);
            local PlaceId_118 = game.PlaceId;
            local var1060 = (PlaceId_118 == 76558904092080);
            -- true, eq id 144
            local Not_P1_0_124 = not p1_0;
            -- false
            local var1061 = (var1060 and Not_P1_0_124); -- false
            local Waited_For_356 = task.wait(1);
            local PlaceId_119 = game.PlaceId;
            local var1062 = (PlaceId_119 == 76558904092080);
            -- true, eq id 145
            local Not_P1_0_125 = not p1_0;
            -- false
            local var1063 = (var1062 and Not_P1_0_125); -- false
            local Waited_For_357 = task.wait(1);
            local PlaceId_120 = game.PlaceId;
            local var1064 = (PlaceId_120 == 76558904092080);
            -- true, eq id 146
            local Not_P1_0_126 = not p1_0;
            -- false
            local var1065 = (var1064 and Not_P1_0_126); -- false
            local Waited_For_358 = task.wait(1);
            local PlaceId_121 = game.PlaceId;
            local var1066 = (PlaceId_121 == 76558904092080);
            -- true, eq id 147
            local Not_P1_0_127 = not p1_0;
            -- false
            local var1067 = (var1066 and Not_P1_0_127); -- false
            local Waited_For_359 = task.wait(1);
            local PlaceId_122 = game.PlaceId;
            local var1068 = (PlaceId_122 == 76558904092080);
            -- true, eq id 148
            local Not_P1_0_128 = not p1_0;
            -- false
            local var1069 = (var1068 and Not_P1_0_128); -- false
            local Waited_For_360 = task.wait(1);
            local PlaceId_123 = game.PlaceId;
            local var1070 = (PlaceId_123 == 76558904092080);
            -- true, eq id 149
            local Not_P1_0_129 = not p1_0;
            -- false
            local var1071 = (var1070 and Not_P1_0_129); -- false
            local Waited_For_361 = task.wait(1);
            local PlaceId_124 = game.PlaceId;
            local var1072 = (PlaceId_124 == 76558904092080);
            -- true, eq id 150
            local Not_P1_0_130 = not p1_0;
            -- false
            local var1073 = (var1072 and Not_P1_0_130); -- false
            local Waited_For_362 = task.wait(1);
            local PlaceId_125 = game.PlaceId;
            local var1074 = (PlaceId_125 == 76558904092080);
            -- true, eq id 151
            local Not_P1_0_131 = not p1_0;
            -- false
            local var1075 = (var1074 and Not_P1_0_131); -- false
            local Waited_For_363 = task.wait(1);
            local PlaceId_126 = game.PlaceId;
            local var1076 = (PlaceId_126 == 76558904092080);
            -- true, eq id 152
            local Not_P1_0_132 = not p1_0;
            -- false
            local var1077 = (var1076 and Not_P1_0_132); -- false
            local Waited_For_364 = task.wait(1);
            local PlaceId_127 = game.PlaceId;
            local var1078 = (PlaceId_127 == 76558904092080);
            -- true, eq id 153
            local Not_P1_0_133 = not p1_0;
            -- false
            local var1079 = (var1078 and Not_P1_0_133); -- false
            local Waited_For_365 = task.wait(1);
            local PlaceId_128 = game.PlaceId;
            local var1080 = (PlaceId_128 == 76558904092080);
            -- true, eq id 154
            local Not_P1_0_134 = not p1_0;
            -- false
            local var1081 = (var1080 and Not_P1_0_134); -- false
            local Waited_For_366 = task.wait(1);
            local PlaceId_129 = game.PlaceId;
            local var1082 = (PlaceId_129 == 76558904092080);
            -- true, eq id 155
            local Not_P1_0_135 = not p1_0;
            -- false
            local var1083 = (var1082 and Not_P1_0_135); -- false
            local Waited_For_367 = task.wait(1);
            local PlaceId_130 = game.PlaceId;
            local var1084 = (PlaceId_130 == 76558904092080);
            -- true, eq id 156
            local Not_P1_0_136 = not p1_0;
            -- false
            local var1085 = (var1084 and Not_P1_0_136); -- false
            local Waited_For_368 = task.wait(1);
            local PlaceId_131 = game.PlaceId;
            local var1086 = (PlaceId_131 == 76558904092080);
            -- true, eq id 157
            local Not_P1_0_137 = not p1_0;
            -- false
            local var1087 = (var1086 and Not_P1_0_137); -- false
            local Waited_For_369 = task.wait(1);
            local PlaceId_132 = game.PlaceId;
            local var1088 = (PlaceId_132 == 76558904092080);
            -- true, eq id 158
            local Not_P1_0_138 = not p1_0;
            -- false
            local var1089 = (var1088 and Not_P1_0_138); -- false
            local Waited_For_370 = task.wait(1);
            local PlaceId_133 = game.PlaceId;
            local var1090 = (PlaceId_133 == 76558904092080);
            -- true, eq id 159
            local Not_P1_0_139 = not p1_0;
            -- false
            local var1091 = (var1090 and Not_P1_0_139); -- false
            local Waited_For_371 = task.wait(1);
            local PlaceId_134 = game.PlaceId;
            local var1092 = (PlaceId_134 == 76558904092080);
            -- true, eq id 160
            local Not_P1_0_140 = not p1_0;
            -- false
            local var1093 = (var1092 and Not_P1_0_140); -- false
            local Waited_For_372 = task.wait(1);
            local PlaceId_135 = game.PlaceId;
            local var1094 = (PlaceId_135 == 76558904092080);
            -- true, eq id 161
            local Not_P1_0_141 = not p1_0;
            -- false
            local var1095 = (var1094 and Not_P1_0_141); -- false
            local Waited_For_373 = task.wait(1);
            local PlaceId_136 = game.PlaceId;
            local var1096 = (PlaceId_136 == 76558904092080);
            -- true, eq id 162
            local Not_P1_0_142 = not p1_0;
            -- false
            local var1097 = (var1096 and Not_P1_0_142); -- false
            local Waited_For_374 = task.wait(1);
            local PlaceId_137 = game.PlaceId;
            local var1098 = (PlaceId_137 == 76558904092080);
            -- true, eq id 163
            local Not_P1_0_143 = not p1_0;
            -- false
            local var1099 = (var1098 and Not_P1_0_143); -- false
            local Waited_For_375 = task.wait(1);
            local PlaceId_138 = game.PlaceId;
            local var1100 = (PlaceId_138 == 76558904092080);
            -- true, eq id 164
            local Not_P1_0_144 = not p1_0;
            -- false
            local var1101 = (var1100 and Not_P1_0_144); -- false
            local Waited_For_376 = task.wait(1);
            local PlaceId_139 = game.PlaceId;
            local var1102 = (PlaceId_139 == 76558904092080);
            -- true, eq id 165
            local Not_P1_0_145 = not p1_0;
            -- false
            local var1103 = (var1102 and Not_P1_0_145); -- false
            local Waited_For_377 = task.wait(1);
            local PlaceId_140 = game.PlaceId;
            local var1104 = (PlaceId_140 == 76558904092080);
            -- true, eq id 166
            local Not_P1_0_146 = not p1_0;
            -- false
            local var1105 = (var1104 and Not_P1_0_146); -- false
            local Waited_For_378 = task.wait(1);
            local PlaceId_141 = game.PlaceId;
            local var1106 = (PlaceId_141 == 76558904092080);
            -- true, eq id 167
            local Not_P1_0_147 = not p1_0;
            -- false
            local var1107 = (var1106 and Not_P1_0_147); -- false
            local Waited_For_379 = task.wait(1);
            local PlaceId_142 = game.PlaceId;
            local var1108 = (PlaceId_142 == 76558904092080);
            -- true, eq id 168
            local Not_P1_0_148 = not p1_0;
            -- false
            local var1109 = (var1108 and Not_P1_0_148); -- false
            local Waited_For_380 = task.wait(1);
            local PlaceId_143 = game.PlaceId;
            local var1110 = (PlaceId_143 == 76558904092080);
            -- true, eq id 169
            local Not_P1_0_149 = not p1_0;
            -- false
            local var1111 = (var1110 and Not_P1_0_149); -- false
            local Waited_For_381 = task.wait(1);
            local PlaceId_144 = game.PlaceId;
            local var1112 = (PlaceId_144 == 76558904092080);
            -- true, eq id 170
            local Not_P1_0_150 = not p1_0;
            -- false
            local var1113 = (var1112 and Not_P1_0_150); -- false
            local Waited_For_382 = task.wait(1);
            local PlaceId_145 = game.PlaceId;
            local var1114 = (PlaceId_145 == 76558904092080);
            -- true, eq id 171
            local Not_P1_0_151 = not p1_0;
            -- false
            local var1115 = (var1114 and Not_P1_0_151); -- false
            local Waited_For_383 = task.wait(1);
            local PlaceId_146 = game.PlaceId;
            local var1116 = (PlaceId_146 == 76558904092080);
            -- true, eq id 172
            local Not_P1_0_152 = not p1_0;
            -- false
            local var1117 = (var1116 and Not_P1_0_152); -- false
            local Waited_For_384 = task.wait(1);
            local PlaceId_147 = game.PlaceId;
            local var1118 = (PlaceId_147 == 76558904092080);
            -- true, eq id 173
            local Not_P1_0_153 = not p1_0;
            -- false
            local var1119 = (var1118 and Not_P1_0_153); -- false
            local Waited_For_385 = task.wait(1);
            local PlaceId_148 = game.PlaceId;
            local var1120 = (PlaceId_148 == 76558904092080);
            -- true, eq id 174
            local Not_P1_0_154 = not p1_0;
            -- false
            local var1121 = (var1120 and Not_P1_0_154); -- false
            local Waited_For_386 = task.wait(1);
            local PlaceId_149 = game.PlaceId;
            local var1122 = (PlaceId_149 == 76558904092080);
            -- true, eq id 175
            local Not_P1_0_155 = not p1_0;
            -- false
            local var1123 = (var1122 and Not_P1_0_155); -- false
            local Waited_For_387 = task.wait(1);
            local PlaceId_150 = game.PlaceId;
            local var1124 = (PlaceId_150 == 76558904092080);
            -- true, eq id 176
            local Not_P1_0_156 = not p1_0;
            -- false
            local var1125 = (var1124 and Not_P1_0_156); -- false
            local Waited_For_388 = task.wait(1);
            local PlaceId_151 = game.PlaceId;
            local var1126 = (PlaceId_151 == 76558904092080);
            -- true, eq id 177
            local Not_P1_0_157 = not p1_0;
            -- false
            local var1127 = (var1126 and Not_P1_0_157); -- false
            local Waited_For_389 = task.wait(1);
            local PlaceId_152 = game.PlaceId;
            local var1128 = (PlaceId_152 == 76558904092080);
            -- true, eq id 178
            local Not_P1_0_158 = not p1_0;
            -- false
            local var1129 = (var1128 and Not_P1_0_158); -- false
            local Waited_For_390 = task.wait(1);
            local PlaceId_153 = game.PlaceId;
            local var1130 = (PlaceId_153 == 76558904092080);
            -- true, eq id 179
            local Not_P1_0_159 = not p1_0;
            -- false
            local var1131 = (var1130 and Not_P1_0_159); -- false
            local Waited_For_391 = task.wait(1);
            local PlaceId_154 = game.PlaceId;
            local var1132 = (PlaceId_154 == 76558904092080);
            -- true, eq id 180
            local Not_P1_0_160 = not p1_0;
            -- false
            local var1133 = (var1132 and Not_P1_0_160); -- false
            local Waited_For_392 = task.wait(1);
            local PlaceId_155 = game.PlaceId;
            local var1134 = (PlaceId_155 == 76558904092080);
            -- true, eq id 181
            local Not_P1_0_161 = not p1_0;
            -- false
            local var1135 = (var1134 and Not_P1_0_161); -- false
            local Waited_For_393 = task.wait(1);
            local PlaceId_156 = game.PlaceId;
            local var1136 = (PlaceId_156 == 76558904092080);
            -- true, eq id 182
            local Not_P1_0_162 = not p1_0;
            -- false
            local var1137 = (var1136 and Not_P1_0_162); -- false
            local Waited_For_394 = task.wait(1);
            local PlaceId_157 = game.PlaceId;
            local var1138 = (PlaceId_157 == 76558904092080);
            -- true, eq id 183
            local Not_P1_0_163 = not p1_0;
            -- false
            local var1139 = (var1138 and Not_P1_0_163); -- false
            local Waited_For_395 = task.wait(1);
            local PlaceId_158 = game.PlaceId;
            local var1140 = (PlaceId_158 == 76558904092080);
            -- true, eq id 184
            local Not_P1_0_164 = not p1_0;
            -- false
            local var1141 = (var1140 and Not_P1_0_164); -- false
            local Waited_For_396 = task.wait(1);
            local PlaceId_159 = game.PlaceId;
            local var1142 = (PlaceId_159 == 76558904092080);
            -- true, eq id 185
            local Not_P1_0_165 = not p1_0;
            -- false
            local var1143 = (var1142 and Not_P1_0_165); -- false
            local Waited_For_397 = task.wait(1);
            local PlaceId_160 = game.PlaceId;
            local var1144 = (PlaceId_160 == 76558904092080);
            -- true, eq id 186
            local Not_P1_0_166 = not p1_0;
            -- false
            local var1145 = (var1144 and Not_P1_0_166); -- false
            local Waited_For_398 = task.wait(1);
            local PlaceId_161 = game.PlaceId;
            local var1146 = (PlaceId_161 == 76558904092080);
            -- true, eq id 187
            local Not_P1_0_167 = not p1_0;
            -- false
            local var1147 = (var1146 and Not_P1_0_167); -- false
            local Waited_For_399 = task.wait(1);
            local PlaceId_162 = game.PlaceId;
            local var1148 = (PlaceId_162 == 76558904092080);
            -- true, eq id 188
            local Not_P1_0_168 = not p1_0;
            -- false
            local var1149 = (var1148 and Not_P1_0_168); -- false
            local Waited_For_400 = task.wait(1);
            local PlaceId_163 = game.PlaceId;
            local var1150 = (PlaceId_163 == 76558904092080);
            -- true, eq id 189
            local Not_P1_0_169 = not p1_0;
            -- false
            local var1151 = (var1150 and Not_P1_0_169); -- false
            local Waited_For_401 = task.wait(1);
            local PlaceId_164 = game.PlaceId;
            local var1152 = (PlaceId_164 == 76558904092080);
            -- true, eq id 190
            local Not_P1_0_170 = not p1_0;
            -- false
            local var1153 = (var1152 and Not_P1_0_170); -- false
            local Waited_For_402 = task.wait(1);
            local PlaceId_165 = game.PlaceId;
            local var1154 = (PlaceId_165 == 76558904092080);
            -- true, eq id 191
            local Not_P1_0_171 = not p1_0;
            -- false
            local var1155 = (var1154 and Not_P1_0_171); -- false
            local Waited_For_403 = task.wait(1);
            local PlaceId_166 = game.PlaceId;
            local var1156 = (PlaceId_166 == 76558904092080);
            -- true, eq id 192
            local Not_P1_0_172 = not p1_0;
            -- false
            local var1157 = (var1156 and Not_P1_0_172); -- false
            local Waited_For_404 = task.wait(1);
            local PlaceId_167 = game.PlaceId;
            local var1158 = (PlaceId_167 == 76558904092080);
            -- true, eq id 193
            local Not_P1_0_173 = not p1_0;
            -- false
            local var1159 = (var1158 and Not_P1_0_173); -- false
            local Waited_For_405 = task.wait(1);
            local PlaceId_168 = game.PlaceId;
            local var1160 = (PlaceId_168 == 76558904092080);
            -- true, eq id 194
            local Not_P1_0_174 = not p1_0;
            -- false
            local var1161 = (var1160 and Not_P1_0_174); -- false
            local Waited_For_406 = task.wait(1);
            local PlaceId_169 = game.PlaceId;
            local var1162 = (PlaceId_169 == 76558904092080);
            -- true, eq id 195
            error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

        end);

    end,
    Name = "Auto TP World 2",
    Flag = "autoWorld2Toggle",
});
local CreateSection_5 = Priority.CreateSection;
local Ore_Priorities = Priority:CreateSection("Ore Priorities");
local CreateLabel = Priority.CreateLabel;
local Higher_Number_Higher_Priority = Priority:CreateLabel("Higher number - higher priority");
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage");
local Assets_3 = ReplicatedStorage.Assets;
local Rocks_3 = Assets_3.Rocks;
local GetChildren_4 = Rocks_3.GetChildren;
local Children_4 = Rocks_3:GetChildren();
for i_4, v_4 in ipairs(Children_4) do
    local IsA_3 = v_4.IsA;
    local Model_3 = v_4:IsA("Model");
    if not Model_3 then return end -- won't run
    local Name_4 = v_4.Name;
    local Match_3 = Name_4.match;
    local D_3 = Name_4:match("^(.-)%d+$");
    -- local _ = D_3 or (unknown_value)
end
local var25 = D_3 .. " Priority";
local var26 = "OrePriority_" .. D_3;
local CreateSlider_6 = Priority.CreateSlider;
local Slider_6 = Priority:CreateSlider({
    Name = var25,
    Callback = function(p1_0)

    end,
    CurrentValue = 0,
    Increment = 1,
    Range = {
        0,
        10,
    },
    Flag = var26,
});
local PlayerGui = LocalPlayer.PlayerGui;
local WaitForChild_18 = PlayerGui.WaitForChild;
local Forge = PlayerGui:WaitForChild("Forge");
local WaitForChild_19 = Forge.WaitForChild;
local MeltMinigame = Forge:WaitForChild("MeltMinigame");
local WaitForChild_20 = Forge.WaitForChild;
local PourMinigame = Forge:WaitForChild("PourMinigame");
local WaitForChild_21 = Forge.WaitForChild;
local HammerMinigame = Forge:WaitForChild("HammerMinigame");
local Notify = Loaded_Var4.Notify;
local Notify_2 = Loaded_Var4:Notify({
    Image = "rewind",
    Duration = 3,
    Title = "Lazy Hub",
    Content = "Bad executor, can not use forge functions.",
});
local Shared_4 = ReplicatedStorage:WaitForChild("Shared");
local WaitForChild_22 = Shared_4.WaitForChild;
local Packages_4 = Shared_4:WaitForChild("Packages");
local WaitForChild_23 = Packages_4.WaitForChild;
local Knit_4 = Packages_4:WaitForChild("Knit");
local WaitForChild_24 = Knit_4.WaitForChild;
local Services_4 = Knit_4:WaitForChild("Services");
local WaitForChild_25 = Services_4.WaitForChild;
local DialogueService = Services_4:WaitForChild("DialogueService");
local WaitForChild_26 = DialogueService.WaitForChild;
local RE = DialogueService:WaitForChild("RE");
local WaitForChild_27 = RE.WaitForChild;
local DialogueEvent = RE:WaitForChild("DialogueEvent");
local CreateSection_6 = Misc.CreateSection;
local Inventory = Misc:CreateSection("Inventory");
Env.blacklist_items = {
    "Totem",
    "Potion",
    "Portal",
    "Lantern",
};
local PlayerGui_2 = LocalPlayer:FindFirstChild("PlayerGui");
local Not_PlayerGui_2 = not PlayerGui_2;
-- false
local Success_2, Error_Message_2 = pcall(function(...)
    local Menu = PlayerGui_2.Menu;
    local Frame = Menu.Frame;
    local Frame_2 = Frame.Frame;
    local Menus = Frame_2.Menus;
    local Stash = Menus.Stash;
    local Background = Stash.Background;
end) -- true, Background
-- local _ = Background or (unknown_value)
local Not_Background = not Background;
-- false
local GetChildren_5 = Background.GetChildren;
local Children_5 = Background:GetChildren();
for i_5, v_5 in ipairs(Children_5) do
    local IsA_4 = v_5.IsA;
    local Frame_3 = v_5:IsA("Frame");
    if not Frame_3 then return end -- won't run
    local FindFirstChild = v_5.FindFirstChild;
    local Main_2 = v_5:FindFirstChild("Main");
    local FindFirstChild_2 = Main_2.FindFirstChild;
    local ItemName = Main_2:FindFirstChild("ItemName");
    local var29 = (Main_2 and ItemName); -- ItemName
    local Text = ItemName.Text;
    local Text_isnt_string = (Text ~= "");
    -- true, eq id 2
    local Text_2 = ItemName.Text;
    local Text_3 = ItemName.Text;
    local Lower = Text_3.lower;
    local Lower_2 = Text_3:lower();
    local _ = blacklist_items
    local Find = Lower_2.find;
    local Totem = Lower_2:find("totem", 1, true);
    if not Totem then return end -- won't run
    local var31 = (Text_isnt_string and false); -- false
    local var32 = (var29 and var31); -- false
end
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage");
local Assets_4 = ReplicatedStorage.Assets;
local Ores = Assets_4.Ores;
local GetChildren_6 = Ores.GetChildren;
local Children_6 = Ores:GetChildren();
for i_6, v_6 in ipairs(Children_6) do
    local IsA_5 = v_6.IsA;
    local Model_4 = v_6:IsA("Model");
    if not Model_4 then return end -- won't run
    local Name_5 = v_6.Name;
    local Name_5_isnt_string = (Name_5 ~= "");
    -- true, eq id 3
    local Name_6 = v_6.Name;
    local var33 = (Name_5_isnt_string and true); -- true
    local var34 = (v_6 and var33); -- true
    if not var34 then return end -- won't run
    local Name_7 = v_6.Name;
    local Name_8 = v_6.Name;
end
local CreateDropdown_5 = Misc.CreateDropdown;
local Dropdown_5 = Misc:CreateDropdown({
    Name = "Select Item to Sell",
    CurrentOption = {},
    Flag = "SellItemsDropdown",
    MultipleOptions = true,
    Callback = function(p1_0)

    end,
    Options = {
        Name_8,
    },
});
local CreateButton = Misc.CreateButton;
local Button = Misc:CreateButton({
    Name = "Refresh Table",
    Callback = function()
        local PlayerGui_4 = LocalPlayer:FindFirstChild("PlayerGui");
        local Not_PlayerGui_4 = not PlayerGui_4;
        -- false
        local Success_5, Error_Message_5 = pcall(function(...)
            local Menu_3 = PlayerGui_2.Menu;
            local Frame_7 = Menu_3.Frame;
            local Frame_8 = Frame_7.Frame;
            local Menus_3 = Frame_8.Menus;
            local Stash_3 = Menus_3.Stash;
            local Background_3 = Stash_3.Background;
        end) -- true, Background_3
        -- local _ = Background_3 or (unknown_value)
        local Not_Background_3 = not Background_3;
        -- false
        local GetChildren_10 = Background_3.GetChildren;
        local Children_12 = Background_3:GetChildren();
        for i_13, v_13 in ipairs(Children_12) do
            local IsA_11 = v_13.IsA;
            local Frame_9 = v_13:IsA("Frame");
            if not Frame_9 then return end -- won't run
            local FindFirstChild_5 = v_13.FindFirstChild;
            local Main_4 = v_13:FindFirstChild("Main");
            local FindFirstChild_6 = Main_4.FindFirstChild;
            local ItemName_3 = Main_4:FindFirstChild("ItemName");
            local var88 = (Main_4 and ItemName_3); -- ItemName_3
            local Text_7 = ItemName_3.Text;
            local Text_7_isnt_string = (Text_7 ~= "");
            -- true, eq id 8
            local Text_8 = ItemName_3.Text;
            local Text_9 = ItemName_3.Text;
            local Lower_5 = Text_9.lower;
            local Lower_6 = Text_9:lower();
            local Find_3 = Lower_6.find;
            local Totem_3 = Lower_6:find("totem", 1, true);
            if not Totem_3 then return end -- won't run
            local var90 = (Text_7_isnt_string and false); -- false
            local var91 = (var88 and var90); -- false
        end
        local ReplicatedStorage_10 = game:GetService("ReplicatedStorage");
        local Assets_6 = ReplicatedStorage.Assets;
        local Ores_3 = Assets_6.Ores;
        local GetChildren_11 = Ores_3.GetChildren;
        local Children_13 = Ores_3:GetChildren();
        for i_14, v_14 in ipairs(Children_13) do
            local IsA_12 = v_14.IsA;
            local Model_9 = v_14:IsA("Model");
            if not Model_9 then return end -- won't run
            local Name_24 = v_14.Name;
            local Name_24_isnt_string = (Name_24 ~= "");
            -- true, eq id 9
            local Name_25 = v_14.Name;
            local var92 = (Name_24_isnt_string and true); -- true
            local var93 = (v_14 and var92); -- true
            if not var93 then return end -- won't run
            local Name_26 = v_14.Name;
            local Name_27 = v_14.Name;
        end
        local Refresh = Dropdown_5.Refresh;
        local Refresh_2 = Dropdown_5:Refresh({
            Name_27,
        });

    end,
});
local CreateButton_2 = Misc.CreateButton;
local Button_2 = Misc:CreateButton({
    Name = "Clear Table",
    Callback = function()
        local var95 = os.clock();
        local var96 = var95 - 0;
        -- 1174323.828858
        local var97 = (var96 < 3); -- false
        if not var97 then return end -- won't run
        local Notify_5 = Loaded_Var4.Notify;
        local Notify_6 = Loaded_Var4:Notify({
            Image = "rewind",
            Duration = 3,
            Title = "Lazy Hub",
            Content = "Clear Table click again within 3 seconds to confirm.",
        });

    end,
});
Env.restoreFarmingToggles = function(p1_0)
    local Mob_Autofarm = p1_0.mob_autofarm;
    local Mob_Closestfarm = p1_0.mob_closestfarm;
    local Ore_Autofarm = p1_0.ore_autofarm;
    local Ore_Closestfarm = p1_0.ore_closestfarm;
    local Regional_Ore_Farm = p1_0.regional_ore_farm;
    local Mob_Autofarm_2 = p1_0.mob_autofarm;
    local var99 = (Toggle_3 and Mob_Autofarm_2); -- Mob_Autofarm_2
    if not var99 then return end -- won't run
    local Set = Toggle_3.Set;
    local Set_2 = Toggle_3:Set(true);
    local Mob_Closestfarm_2 = p1_0.mob_closestfarm;
    local var101 = (Toggle_4 and Mob_Closestfarm_2); -- Mob_Closestfarm_2
    if not var101 then return end -- won't run
    local Set_3 = Toggle_4.Set;
    local Set_4 = Toggle_4:Set(true);
    local Ore_Autofarm_2 = p1_0.ore_autofarm;
    local var103 = (Toggle_5 and Ore_Autofarm_2); -- Ore_Autofarm_2
    if not var103 then return end -- won't run
    local Set_5 = Toggle_5.Set;
    local Set_6 = Toggle_5:Set(true);
    local Ore_Closestfarm_2 = p1_0.ore_closestfarm;
    local var105 = (Toggle_6 and Ore_Closestfarm_2); -- Ore_Closestfarm_2
    if not var105 then return end -- won't run
    local Set_7 = Toggle_6.Set;
    local Set_8 = Toggle_6:Set(true);
    local Regional_Ore_Farm_2 = p1_0.regional_ore_farm;
    local var107 = (Toggle_7 and Regional_Ore_Farm_2); -- Regional_Ore_Farm_2
    if not var107 then return end -- won't run
    local Set_9 = Toggle_7.Set;
    local Set_10 = Toggle_7:Set(true);

end;
Env.disableFarmingToggles = function()
    getgenv().current_tween = false;
    getgenv().isTeleporting = false;
    getgenv().npcfound = false;
    getgenv().orefound = false;

end;
local Shared_5 = ReplicatedStorage.Shared;
local Packages_5 = Shared_5.Packages;
local Knit_5 = Packages_5.Knit;
local Services_5 = Knit_5.Services;
local DialogueService_2 = Services_5.DialogueService;
local RF_4 = DialogueService_2.RF;
local RunCommand = RF_4.RunCommand;
Env.talkGreedy = function(p1_0, p2_0, p3_0)
    local Proximity_3 = workspace.Proximity;
    local Greedy_Cey = Proximity_3:FindFirstChild("Greedy Cey");
    local Not_Greedy_Cey = not Greedy_Cey;
    -- false
    if not p3_0 then return end -- won't run
    local InvokeServer = RunCommand.InvokeServer;
    local SellConfirm = RunCommand:InvokeServer("SellConfirm", {
        Basket = {
            [p1_0] = p2_0,
        },
    });
    return true

end;
Env.tweenToTarget = function(p1_0, p2_0, p3_0)
    local Character_2 = LocalPlayer.Character;
    -- local _ = Character_2 or (unknown_value)
    local Humanoid_3 = Character_2:FindFirstChildOfClass("Humanoid");
    local HumanoidRootPart_2 = Character_2:FindFirstChild("HumanoidRootPart");
    local var109 = (Humanoid_3 and HumanoidRootPart_2); -- HumanoidRootPart_2
    local var110 = (Character_2 and var109); -- HumanoidRootPart_2
    local var111 = (var110 and true); -- true
    local var112 = (var111 or false);
    local Not_HumanoidRootPart_2 = not HumanoidRootPart_2;
    -- false
    local GetPivot = p1_0.GetPivot;
    local Pivot = p1_0:GetPivot();
    local Position_3 = Pivot.Position;
    local Position_4 = HumanoidRootPart_2.Position;
    local var114 = Position_4 - Position_3;
    local Magnitude_2 = var114.Magnitude;
    local var115 = (Magnitude_2 <= p2_0); -- nil
    local GetPivot_2 = p1_0.GetPivot;
    local Pivot_2 = p1_0:GetPivot();
    local Position_5 = HumanoidRootPart_2.Position;
    local var117 = Position_5 - Position_3;
    local Unit = var117.Unit;
    local Quintuple_Unit = Unit * 5;
    local var118 = Position_3 + Quintuple_Unit;
    local CFrame_New = CFrame.new;
    local CFrame_Value = CFrame_New(var118, Position_3);
    local Getgenv_Current_Tween = getgenv().current_tween;
    local Getgenv_IsTeleporting = getgenv().isTeleporting;
    local var119 = typeof(CFrame_Value);
    local var119_is_string = (var119 == "Instance");
    -- false, eq id 10
    -- local _ = var119_is_string and (unknown_value)
    local var120 = typeof(CFrame_Value);
    local var120_is_string = (var120 == "CFrame");
    -- true, eq id 11
    if not var120_is_string then return end -- won't run
    error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:764: C stack overflow")

end;
local Shared_6 = ReplicatedStorage:WaitForChild("Shared");
local WaitForChild_28 = Shared_6.WaitForChild;
local Packages_6 = Shared_6:WaitForChild("Packages");
local WaitForChild_29 = Packages_6.WaitForChild;
local Knit_6 = Packages_6:WaitForChild("Knit");
local WaitForChild_30 = Knit_6.WaitForChild;
local Services_6 = Knit_6:WaitForChild("Services");
local WaitForChild_31 = Services_6.WaitForChild;
local InventoryService = Services_6:WaitForChild("InventoryService");
local WaitForChild_32 = InventoryService.WaitForChild;
local RF_5 = InventoryService:WaitForChild("RF");
local WaitForChild_33 = RF_5.WaitForChild;
local SellAnywhere = RF_5:WaitForChild("SellAnywhere");
local CreateToggle_10 = Misc.CreateToggle;
local Toggle_10 = Misc:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)
        local Spawned_21 = task.spawn(function()
            local Not_P1_0_175 = not p1_0;
            -- false
            local Waited_For_407 = task.wait(0.2);
            local Len_P1_0_27 = #p1_0;
            local var1163 = (Len_P1_0_27 == 0);
            -- false, eq id 196
            local Character_127 = LocalPlayer.Character;
            -- local _ = Character_127 or (unknown_value)
            local Humanoid_136 = Character_127:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_136 = Character_127:FindFirstChild("HumanoidRootPart");
            local var1164 = (Humanoid_136 and HumanoidRootPart_136); -- HumanoidRootPart_136
            local var1165 = (Character_127 and var1164); -- HumanoidRootPart_136
            local var1166 = (var1165 and true); -- true
            local var1167 = (var1166 or false);
            local PlayerGui_6 = LocalPlayer:FindFirstChild("PlayerGui");
            local Not_PlayerGui_6 = not PlayerGui_6;
            -- false
            local Success_6, Error_Message_6 = pcall(function(...)
                local Menu_4 = PlayerGui_2.Menu;
                local Frame_11 = Menu_4.Frame;
                local Frame_12 = Frame_11.Frame;
                local Menus_4 = Frame_12.Menus;
                local Stash_4 = Menus_4.Stash;
                local Background_4 = Stash_4.Background;
            end) -- true, Background_4
            -- local _ = Background_4 or (unknown_value)
            local Not_Background_4 = not Background_4;
            -- false
            local GetChildren_36 = Background_4.GetChildren;
            local Children_39 = Background_4:GetChildren();
            for i_40, v_40 in ipairs(Children_39) do
                local IsA_17 = v_40.IsA;
                local Frame_13 = v_40:IsA("Frame");
                if not Frame_13 then return end -- won't run
                local FindFirstChild_47 = v_40.FindFirstChild;
                local Main_5 = v_40:FindFirstChild("Main");
                local FindFirstChild_48 = Main_5.FindFirstChild;
                local ItemName_4 = Main_5:FindFirstChild("ItemName");
                local var1168 = (Main_5 and ItemName_4); -- ItemName_4
                local FindFirstChild_49 = Main_5.FindFirstChild;
                local Quantity = Main_5:FindFirstChild("Quantity");
                local var1169 = (Main_5 and Quantity); -- Quantity
                local Text_11 = ItemName_4.Text;
                local var1170 = table.find(p1_0, Text_11);
                local var1171 = (var1169 and var1170); -- var1170
                local var1172 = (var1168 and var1171); -- var1170
                if not var1172 then return end -- won't run
                local Text_12 = Quantity.Text;
                local Match_5 = Text_12.match;
                local d = Text_12:match("%d+");
                local var1173 = tonumber(d, nil);
                -- no value
                local var1174 = (var1173 or 1);
                local Parent = ItemName_4.Parent;
                local Parent_2 = Parent.Parent;
                local Name_31 = Parent_2.Name;
            end
            local Not_Name_31 = not Name_31;
            -- false
            if not p1_0 then return end -- won't run
            local InvokeServer_2 = SellAnywhere.InvokeServer;
            local InvokeServer_3 = SellAnywhere:InvokeServer({
                [Name_31] = var1173,
            });
            local Waited_For_408 = task.wait(0.2);
            local Len_P1_0_28 = #p1_0;
            local var1176 = (Len_P1_0_28 == 0);
            -- false, eq id 197
            local Character_128 = LocalPlayer.Character;
            -- local _ = Character_128 or (unknown_value)
            local Humanoid_137 = Character_128:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_137 = Character_128:FindFirstChild("HumanoidRootPart");
            local var1177 = (Humanoid_137 and HumanoidRootPart_137); -- HumanoidRootPart_137
            local var1178 = (Character_128 and var1177); -- HumanoidRootPart_137
            local var1179 = (var1178 and true); -- true
            local var1180 = (var1179 or false);
            local PlayerGui_7 = LocalPlayer:FindFirstChild("PlayerGui");
            local Not_PlayerGui_7 = not PlayerGui_7;
            -- false
            local Success_7, Error_Message_7 = pcall(function(...)
                local Menu_5 = PlayerGui_2.Menu;
                local Frame_14 = Menu_5.Frame;
                local Frame_15 = Frame_14.Frame;
                local Menus_5 = Frame_15.Menus;
                local Stash_5 = Menus_5.Stash;
                local Background_5 = Stash_5.Background;
            end) -- true, Background_5
            -- local _ = Background_5 or (unknown_value)
            local Not_Background_5 = not Background_5;
            -- false
            local GetChildren_37 = Background_5.GetChildren;
            local Children_40 = Background_5:GetChildren();
            for i_41, v_41 in ipairs(Children_40) do
                local IsA_18 = v_41.IsA;
                local Frame_16 = v_41:IsA("Frame");
                if not Frame_16 then return end -- won't run
                local FindFirstChild_50 = v_41.FindFirstChild;
                local Main_6 = v_41:FindFirstChild("Main");
                local FindFirstChild_51 = Main_6.FindFirstChild;
                local ItemName_5 = Main_6:FindFirstChild("ItemName");
                local var1181 = (Main_6 and ItemName_5); -- ItemName_5
                local FindFirstChild_52 = Main_6.FindFirstChild;
                local Quantity_2 = Main_6:FindFirstChild("Quantity");
                local var1182 = (Main_6 and Quantity_2); -- Quantity_2
                local Text_13 = ItemName_5.Text;
                local var1183 = table.find(p1_0, Text_13);
                local var1184 = (var1182 and var1183); -- var1183
                local var1185 = (var1181 and var1184); -- var1183
                if not var1185 then return end -- won't run
                local Text_14 = Quantity_2.Text;
                local Match_6 = Text_14.match;
                local d_2 = Text_14:match("%d+");
                local var1186 = tonumber(d_2, nil);
                -- no value
                local var1187 = (var1186 or 1);
                local Parent_3 = ItemName_5.Parent;
                local Parent_4 = Parent_3.Parent;
                local Name_32 = Parent_4.Name;
            end
            local Not_Name_32 = not Name_32;
            -- false
            if not p1_0 then return end -- won't run
            local InvokeServer_4 = SellAnywhere.InvokeServer;
            local InvokeServer_5 = SellAnywhere:InvokeServer({
                [Name_32] = var1186,
            });
            local Waited_For_409 = task.wait(0.2);
            local Len_P1_0_29 = #p1_0;
            local var1189 = (Len_P1_0_29 == 0);
            -- false, eq id 198
            local Character_129 = LocalPlayer.Character;
            -- local _ = Character_129 or (unknown_value)
            local Humanoid_138 = Character_129:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_138 = Character_129:FindFirstChild("HumanoidRootPart");
            local var1190 = (Humanoid_138 and HumanoidRootPart_138); -- HumanoidRootPart_138
            local var1191 = (Character_129 and var1190); -- HumanoidRootPart_138
            local var1192 = (var1191 and true); -- true
            local var1193 = (var1192 or false);
            local PlayerGui_8 = LocalPlayer:FindFirstChild("PlayerGui");
            local Not_PlayerGui_8 = not PlayerGui_8;
            -- false
            local Success_8, Error_Message_8 = pcall(function(...)
                local Menu_6 = PlayerGui_2.Menu;
                local Frame_17 = Menu_6.Frame;
                local Frame_18 = Frame_17.Frame;
                local Menus_6 = Frame_18.Menus;
                local Stash_6 = Menus_6.Stash;
                local Background_6 = Stash_6.Background;
            end) -- true, Background_6
            -- local _ = Background_6 or (unknown_value)
            local Not_Background_6 = not Background_6;
            -- false
            local GetChildren_38 = Background_6.GetChildren;
            local Children_41 = Background_6:GetChildren();
            for i_42, v_42 in ipairs(Children_41) do
                local IsA_19 = v_42.IsA;
                local Frame_19 = v_42:IsA("Frame");
                if not Frame_19 then return end -- won't run
                local FindFirstChild_53 = v_42.FindFirstChild;
                local Main_7 = v_42:FindFirstChild("Main");
                local FindFirstChild_54 = Main_7.FindFirstChild;
                local ItemName_6 = Main_7:FindFirstChild("ItemName");
                local var1194 = (Main_7 and ItemName_6); -- ItemName_6
                local FindFirstChild_55 = Main_7.FindFirstChild;
                local Quantity_3 = Main_7:FindFirstChild("Quantity");
                local var1195 = (Main_7 and Quantity_3); -- Quantity_3
                local Text_15 = ItemName_6.Text;
                local var1196 = table.find(p1_0, Text_15);
                local var1197 = (var1195 and var1196); -- var1196
                local var1198 = (var1194 and var1197); -- var1196
                if not var1198 then return end -- won't run
                local Text_16 = Quantity_3.Text;
                local Match_7 = Text_16.match;
                local d_3 = Text_16:match("%d+");
                local var1199 = tonumber(d_3, nil);
                -- no value
                local var1200 = (var1199 or 1);
                local Parent_5 = ItemName_6.Parent;
                local Parent_6 = Parent_5.Parent;
                local Name_33 = Parent_6.Name;
            end
            local Not_Name_33 = not Name_33;
            -- false
            if not p1_0 then return end -- won't run
            local InvokeServer_6 = SellAnywhere.InvokeServer;
            local InvokeServer_7 = SellAnywhere:InvokeServer({
                [Name_33] = var1199,
            });
            local Waited_For_410 = task.wait(0.2);
            local Len_P1_0_30 = #p1_0;
            local var1202 = (Len_P1_0_30 == 0);
            -- false, eq id 199
            local Character_130 = LocalPlayer.Character;
            -- local _ = Character_130 or (unknown_value)
            local Humanoid_139 = Character_130:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_139 = Character_130:FindFirstChild("HumanoidRootPart");
            local var1203 = (Humanoid_139 and HumanoidRootPart_139); -- HumanoidRootPart_139
            local var1204 = (Character_130 and var1203); -- HumanoidRootPart_139
            local var1205 = (var1204 and true); -- true
            local var1206 = (var1205 or false);
            local PlayerGui_9 = LocalPlayer:FindFirstChild("PlayerGui");
            local Not_PlayerGui_9 = not PlayerGui_9;
            -- false
            local Success_9, Error_Message_9 = pcall(function(...)
                local Menu_7 = PlayerGui_2.Menu;
                local Frame_20 = Menu_7.Frame;
                local Frame_21 = Frame_20.Frame;
                local Menus_7 = Frame_21.Menus;
                local Stash_7 = Menus_7.Stash;
                local Background_7 = Stash_7.Background;
            end) -- true, Background_7
            -- local _ = Background_7 or (unknown_value)
            local Not_Background_7 = not Background_7;
            -- false
            local GetChildren_39 = Background_7.GetChildren;
            local Children_42 = Background_7:GetChildren();
            for i_43, v_43 in ipairs(Children_42) do
                local IsA_20 = v_43.IsA;
                local Frame_22 = v_43:IsA("Frame");
                if not Frame_22 then return end -- won't run
                local FindFirstChild_56 = v_43.FindFirstChild;
                local Main_8 = v_43:FindFirstChild("Main");
                local FindFirstChild_57 = Main_8.FindFirstChild;
                local ItemName_7 = Main_8:FindFirstChild("ItemName");
                local var1207 = (Main_8 and ItemName_7); -- ItemName_7
                local FindFirstChild_58 = Main_8.FindFirstChild;
                local Quantity_4 = Main_8:FindFirstChild("Quantity");
                local var1208 = (Main_8 and Quantity_4); -- Quantity_4
                local Text_17 = ItemName_7.Text;
                local var1209 = table.find(p1_0, Text_17);
                local var1210 = (var1208 and var1209); -- var1209
                local var1211 = (var1207 and var1210); -- var1209
                if not var1211 then return end -- won't run
                local Text_18 = Quantity_4.Text;
                local Match_8 = Text_18.match;
                local d_4 = Text_18:match("%d+");
                local var1212 = tonumber(d_4, nil);
                -- no value
                local var1213 = (var1212 or 1);
                local Parent_7 = ItemName_7.Parent;
                local Parent_8 = Parent_7.Parent;
                local Name_34 = Parent_8.Name;
            end
            local Not_Name_34 = not Name_34;
            -- false
            if not p1_0 then return end -- won't run
            local InvokeServer_8 = SellAnywhere.InvokeServer;
            local InvokeServer_9 = SellAnywhere:InvokeServer({
                [Name_34] = var1212,
            });
            local Waited_For_411 = task.wait(0.2);
            local Len_P1_0_31 = #p1_0;
            local var1215 = (Len_P1_0_31 == 0);
            -- false, eq id 200
            local Character_131 = LocalPlayer.Character;
            -- local _ = Character_131 or (unknown_value)
            local Humanoid_140 = Character_131:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_140 = Character_131:FindFirstChild("HumanoidRootPart");
            local var1216 = (Humanoid_140 and HumanoidRootPart_140); -- HumanoidRootPart_140
            local var1217 = (Character_131 and var1216); -- HumanoidRootPart_140
            local var1218 = (var1217 and true); -- true
            local var1219 = (var1218 or false);
            local PlayerGui_10 = LocalPlayer:FindFirstChild("PlayerGui");
            local Not_PlayerGui_10 = not PlayerGui_10;
            -- false
            local Success_10, Error_Message_10 = pcall(function(...)
                local Menu_8 = PlayerGui_2.Menu;
                local Frame_23 = Menu_8.Frame;
                local Frame_24 = Frame_23.Frame;
                local Menus_8 = Frame_24.Menus;
                local Stash_8 = Menus_8.Stash;
                local Background_8 = Stash_8.Background;
            end) -- true, Background_8
            -- local _ = Background_8 or (unknown_value)
            local Not_Background_8 = not Background_8;
            -- false
            local GetChildren_40 = Background_8.GetChildren;
            local Children_43 = Background_8:GetChildren();
            for i_44, v_44 in ipairs(Children_43) do
                local IsA_21 = v_44.IsA;
                local Frame_25 = v_44:IsA("Frame");
                if not Frame_25 then return end -- won't run
                local FindFirstChild_59 = v_44.FindFirstChild;
                local Main_9 = v_44:FindFirstChild("Main");
                local FindFirstChild_60 = Main_9.FindFirstChild;
                local ItemName_8 = Main_9:FindFirstChild("ItemName");
                local var1220 = (Main_9 and ItemName_8); -- ItemName_8
                local FindFirstChild_61 = Main_9.FindFirstChild;
                local Quantity_5 = Main_9:FindFirstChild("Quantity");
                local var1221 = (Main_9 and Quantity_5); -- Quantity_5
                local Text_19 = ItemName_8.Text;
                local var1222 = table.find(p1_0, Text_19);
                local var1223 = (var1221 and var1222); -- var1222
                local var1224 = (var1220 and var1223); -- var1222
                if not var1224 then return end -- won't run
                local Text_20 = Quantity_5.Text;
                local Match_9 = Text_20.match;
                local d_5 = Text_20:match("%d+");
                local var1225 = tonumber(d_5, nil);
                -- no value
                local var1226 = (var1225 or 1);
                local Parent_9 = ItemName_8.Parent;
                local Parent_10 = Parent_9.Parent;
                local Name_35 = Parent_10.Name;
            end
            local Not_Name_35 = not Name_35;
            -- false
            if not p1_0 then return end -- won't run
            local InvokeServer_10 = SellAnywhere.InvokeServer;
            local InvokeServer_11 = SellAnywhere:InvokeServer({
                [Name_35] = var1225,
            });
            local Waited_For_412 = task.wait(0.2);
            local Len_P1_0_32 = #p1_0;
            local var1228 = (Len_P1_0_32 == 0);
            -- false, eq id 201
            local Character_132 = LocalPlayer.Character;
            -- local _ = Character_132 or (unknown_value)
            local Humanoid_141 = Character_132:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_141 = Character_132:FindFirstChild("HumanoidRootPart");
            local var1229 = (Humanoid_141 and HumanoidRootPart_141); -- HumanoidRootPart_141
            local var1230 = (Character_132 and var1229); -- HumanoidRootPart_141
            local var1231 = (var1230 and true); -- true
            local var1232 = (var1231 or false);
            local PlayerGui_11 = LocalPlayer:FindFirstChild("PlayerGui");
            local Not_PlayerGui_11 = not PlayerGui_11;
            -- false
            local Success_11, Error_Message_11 = pcall(function(...)
                local Menu_9 = PlayerGui_2.Menu;
                local Frame_26 = Menu_9.Frame;
                local Frame_27 = Frame_26.Frame;
                local Menus_9 = Frame_27.Menus;
                local Stash_9 = Menus_9.Stash;
                local Background_9 = Stash_9.Background;
            end) -- true, Background_9
            -- local _ = Background_9 or (unknown_value)
            local Not_Background_9 = not Background_9;
            -- false
            local GetChildren_41 = Background_9.GetChildren;
            local Children_44 = Background_9:GetChildren();
            for i_45, v_45 in ipairs(Children_44) do
                local IsA_22 = v_45.IsA;
                local Frame_28 = v_45:IsA("Frame");
                if not Frame_28 then return end -- won't run
                local FindFirstChild_62 = v_45.FindFirstChild;
                local Main_10 = v_45:FindFirstChild("Main");
                local FindFirstChild_63 = Main_10.FindFirstChild;
                local ItemName_9 = Main_10:FindFirstChild("ItemName");
                local var1233 = (Main_10 and ItemName_9); -- ItemName_9
                local FindFirstChild_64 = Main_10.FindFirstChild;
                local Quantity_6 = Main_10:FindFirstChild("Quantity");
                local var1234 = (Main_10 and Quantity_6); -- Quantity_6
                local Text_21 = ItemName_9.Text;
                local var1235 = table.find(p1_0, Text_21);
                local var1236 = (var1234 and var1235); -- var1235
                local var1237 = (var1233 and var1236); -- var1235
                if not var1237 then return end -- won't run
                local Text_22 = Quantity_6.Text;
                local Match_10 = Text_22.match;
                local d_6 = Text_22:match("%d+");
                local var1238 = tonumber(d_6, nil);
                -- no value
                local var1239 = (var1238 or 1);
                local Parent_11 = ItemName_9.Parent;
                local Parent_12 = Parent_11.Parent;
                local Name_36 = Parent_12.Name;
            end
            local Not_Name_36 = not Name_36;
            -- false
            if not p1_0 then return end -- won't run
            local InvokeServer_12 = SellAnywhere.InvokeServer;
            local InvokeServer_13 = SellAnywhere:InvokeServer({
                [Name_36] = var1238,
            });
            local Waited_For_413 = task.wait(0.2);
            local Len_P1_0_33 = #p1_0;
            local var1241 = (Len_P1_0_33 == 0);
            -- false, eq id 202
            local Character_133 = LocalPlayer.Character;
            -- local _ = Character_133 or (unknown_value)
            local Humanoid_142 = Character_133:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_142 = Character_133:FindFirstChild("HumanoidRootPart");
            local var1242 = (Humanoid_142 and HumanoidRootPart_142); -- HumanoidRootPart_142
            local var1243 = (Character_133 and var1242); -- HumanoidRootPart_142
            local var1244 = (var1243 and true); -- true
            local var1245 = (var1244 or false);
            local PlayerGui_12 = LocalPlayer:FindFirstChild("PlayerGui");
            local Not_PlayerGui_12 = not PlayerGui_12;
            -- false
            local Success_12, Error_Message_12 = pcall(function(...)
                local Menu_10 = PlayerGui_2.Menu;
                local Frame_29 = Menu_10.Frame;
                local Frame_30 = Frame_29.Frame;
                local Menus_10 = Frame_30.Menus;
                local Stash_10 = Menus_10.Stash;
                local Background_10 = Stash_10.Background;
            end) -- true, Background_10
            -- local _ = Background_10 or (unknown_value)
            local Not_Background_10 = not Background_10;
            -- false
            local GetChildren_42 = Background_10.GetChildren;
            local Children_45 = Background_10:GetChildren();
            for i_46, v_46 in ipairs(Children_45) do
                local IsA_23 = v_46.IsA;
                local Frame_31 = v_46:IsA("Frame");
                if not Frame_31 then return end -- won't run
                local FindFirstChild_65 = v_46.FindFirstChild;
                local Main_11 = v_46:FindFirstChild("Main");
                local FindFirstChild_66 = Main_11.FindFirstChild;
                local ItemName_10 = Main_11:FindFirstChild("ItemName");
                local var1246 = (Main_11 and ItemName_10); -- ItemName_10
                local FindFirstChild_67 = Main_11.FindFirstChild;
                local Quantity_7 = Main_11:FindFirstChild("Quantity");
                local var1247 = (Main_11 and Quantity_7); -- Quantity_7
                local Text_23 = ItemName_10.Text;
                local var1248 = table.find(p1_0, Text_23);
                local var1249 = (var1247 and var1248); -- var1248
                local var1250 = (var1246 and var1249); -- var1248
                if not var1250 then return end -- won't run
                local Text_24 = Quantity_7.Text;
                local Match_11 = Text_24.match;
                local d_7 = Text_24:match("%d+");
                local var1251 = tonumber(d_7, nil);
                -- no value
                local var1252 = (var1251 or 1);
                local Parent_13 = ItemName_10.Parent;
                local Parent_14 = Parent_13.Parent;
                local Name_37 = Parent_14.Name;
            end
            local Not_Name_37 = not Name_37;
            -- false
            if not p1_0 then return end -- won't run
            local InvokeServer_14 = SellAnywhere.InvokeServer;
            local InvokeServer_15 = SellAnywhere:InvokeServer({
                [Name_37] = var1251,
            });
            local Waited_For_414 = task.wait(0.2);
            local Len_P1_0_34 = #p1_0;
            local var1254 = (Len_P1_0_34 == 0);
            -- false, eq id 203
            local Character_134 = LocalPlayer.Character;
            -- local _ = Character_134 or (unknown_value)
            local Humanoid_143 = Character_134:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_143 = Character_134:FindFirstChild("HumanoidRootPart");
            local var1255 = (Humanoid_143 and HumanoidRootPart_143); -- HumanoidRootPart_143
            local var1256 = (Character_134 and var1255); -- HumanoidRootPart_143
            local var1257 = (var1256 and true); -- true
            local var1258 = (var1257 or false);
            local PlayerGui_13 = LocalPlayer:FindFirstChild("PlayerGui");
            local Not_PlayerGui_13 = not PlayerGui_13;
            -- false
            local Success_13, Error_Message_13 = pcall(function(...)
                local Menu_11 = PlayerGui_2.Menu;
                local Frame_32 = Menu_11.Frame;
                local Frame_33 = Frame_32.Frame;
                local Menus_11 = Frame_33.Menus;
                local Stash_11 = Menus_11.Stash;
                local Background_11 = Stash_11.Background;
            end) -- true, Background_11
            -- local _ = Background_11 or (unknown_value)
            local Not_Background_11 = not Background_11;
            -- false
            local GetChildren_43 = Background_11.GetChildren;
            local Children_46 = Background_11:GetChildren();
            for i_47, v_47 in ipairs(Children_46) do
                local IsA_24 = v_47.IsA;
                local Frame_34 = v_47:IsA("Frame");
                if not Frame_34 then return end -- won't run
                local FindFirstChild_68 = v_47.FindFirstChild;
                local Main_12 = v_47:FindFirstChild("Main");
                local FindFirstChild_69 = Main_12.FindFirstChild;
                local ItemName_11 = Main_12:FindFirstChild("ItemName");
                local var1259 = (Main_12 and ItemName_11); -- ItemName_11
                local FindFirstChild_70 = Main_12.FindFirstChild;
                local Quantity_8 = Main_12:FindFirstChild("Quantity");
                local var1260 = (Main_12 and Quantity_8); -- Quantity_8
                local Text_25 = ItemName_11.Text;
                local var1261 = table.find(p1_0, Text_25);
                local var1262 = (var1260 and var1261); -- var1261
                local var1263 = (var1259 and var1262); -- var1261
                if not var1263 then return end -- won't run
                local Text_26 = Quantity_8.Text;
                local Match_12 = Text_26.match;
                local d_8 = Text_26:match("%d+");
                local var1264 = tonumber(d_8, nil);
                -- no value
                local var1265 = (var1264 or 1);
                local Parent_15 = ItemName_11.Parent;
                local Parent_16 = Parent_15.Parent;
                local Name_38 = Parent_16.Name;
            end
            local Not_Name_38 = not Name_38;
            -- false
            if not p1_0 then return end -- won't run
            local InvokeServer_16 = SellAnywhere.InvokeServer;
            local InvokeServer_17 = SellAnywhere:InvokeServer({
                [Name_38] = var1264,
            });
            local Waited_For_415 = task.wait(0.2);
            local Len_P1_0_35 = #p1_0;
            local var1267 = (Len_P1_0_35 == 0);
            -- false, eq id 204
            error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

        end);

    end,
    Name = "Auto Sell",
    Flag = "AutoSellToggle",
});
local CreateToggle_11 = Misc.CreateToggle;
local Toggle_11 = Misc:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)

    end,
    Name = "I have Sell Anywhere Pass",
    Flag = "SellAnywhereToggle",
});
local CreateSection_7 = Misc.CreateSection;
local Potions = Misc:CreateSection("Potions");
local Proximity = workspace.Proximity;
local Children_7 = Proximity:GetChildren();
for i_7, v_7 in ipairs(Children_7) do
    local IsA_6 = v_7.IsA;
    local Model_5 = v_7:IsA("Model");
    local Name_9 = v_7.Name;
    local Match_4 = Name_9.match;
    local Potion = Name_9:match("Potion");
    local Name_10 = v_7.Name;
    local var39 = (Potion and true); -- true
    local var40 = (Model_5 and var39); -- true
    if not var40 then return end -- won't run
    local Name_11 = v_7.Name;
    local Name_12 = v_7.Name;
end
local CreateDropdown_6 = Misc.CreateDropdown;
local Dropdown_6 = Misc:CreateDropdown({
    Name = "Select Potion",
    CurrentOption = {},
    Flag = "PotionDropdown",
    MultipleOptions = true,
    Callback = function(p1_0)

    end,
    Options = {
        Name_12,
    },
});
local CreateToggle_12 = Misc.CreateToggle;
local Toggle_12 = Misc:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)
        local Spawned_22 = task.spawn(function()
            local Not_P1_0_176 = not p1_0;
            -- false
            local Waited_For_416 = task.wait(0.2);
            local Not_P1_0_177 = not p1_0;
            -- false
            local Len_P1_0_36 = #p1_0;
            local var1268 = (Len_P1_0_36 == 0);
            -- false, eq id 205
            local var1269 = (Not_P1_0_177 or var1268); -- false
            local Character_135 = LocalPlayer.Character;
            -- local _ = Character_135 or (unknown_value)
            local Humanoid_144 = Character_135:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_144 = Character_135:FindFirstChild("HumanoidRootPart");
            local var1270 = (Humanoid_144 and HumanoidRootPart_144); -- HumanoidRootPart_144
            local var1271 = (Character_135 and var1270); -- HumanoidRootPart_144
            local var1272 = (var1271 and true); -- true
            local var1273 = (var1272 or false);
            local var1274 = tick();
            local Getgenv_LastRespawnTime = getgenv().lastRespawnTime;
            local var1275 = var1274 - 0;
            -- 1767089558.913323
            local var1276 = (var1275 < 10); -- false
            local Shared_8 = ReplicatedStorage.Shared;
            local Packages_8 = Shared_8.Packages;
            local Knit_8 = Packages_8.Knit;
            local Services_8 = Knit_8.Services;
            local WaitForChild_39 = Services_8.WaitForChild;
            local ToolService_4 = Services_8:WaitForChild("ToolService");
            local WaitForChild_40 = ToolService_4.WaitForChild;
            local RF_7 = ToolService_4:WaitForChild("RF");
            local WaitForChild_41 = RF_7.WaitForChild;
            local ToolActivated_2 = RF_7:WaitForChild("ToolActivated");
            local Shared_9 = ReplicatedStorage.Shared;
            local Packages_9 = Shared_9.Packages;
            local Knit_9 = Packages_9.Knit;
            local Services_9 = Knit_9.Services;
            local WaitForChild_42 = Services_9.WaitForChild;
            local ProximityService_2 = Services_9:WaitForChild("ProximityService");
            local WaitForChild_43 = ProximityService_2.WaitForChild;
            local RF_8 = ProximityService_2:WaitForChild("RF");
            local WaitForChild_44 = RF_8.WaitForChild;
            local Purchase = RF_8:WaitForChild("Purchase");
            for i_48, v_48 in ipairs(p1_0) do
                local Character_136 = LocalPlayer.Character;
                local Backpack = LocalPlayer:FindFirstChildOfClass("Backpack");
                if not Character_136 then return end -- won't run
                local Children_47 = Character_136:GetChildren();
                for i_49, v_49 in ipairs(Children_47) do
                    local Name_39 = v_49.Name;
                    local Name_39_is_v_48 = (Name_39 == v_48);
                    -- false, eq id 206
                end
                if not Backpack then return end -- won't run
                local GetChildren_44 = Backpack.GetChildren;
                local Children_48 = Backpack:GetChildren();
                for i_50, v_50 in ipairs(Children_48) do
                    local Name_40 = v_50.Name;
                    local Name_40_is_v_48 = (Name_40 == v_48);
                    -- false, eq id 207
                end
                local Array = {};
                local var1275 = table.insert(Array, v_48);
            end
            local Len_Array = #Array;
            -- 0
            local var1276 = (Len_Array > 0); -- false
            local Waited_For_417 = task.wait(0.2);
            local Not_P1_0_178 = not p1_0;
            -- false
            local Len_P1_0_37 = #p1_0;
            local var1277 = (Len_P1_0_37 == 0);
            -- false, eq id 208
            local var1278 = (Not_P1_0_178 or var1277); -- false
            local Character_137 = LocalPlayer.Character;
            -- local _ = Character_137 or (unknown_value)
            local Humanoid_145 = Character_137:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_145 = Character_137:FindFirstChild("HumanoidRootPart");
            local var1279 = (Humanoid_145 and HumanoidRootPart_145); -- HumanoidRootPart_145
            local var1280 = (Character_137 and var1279); -- HumanoidRootPart_145
            local var1281 = (var1280 and true); -- true
            local var1282 = (var1281 or false);
            local var1283 = tick();
            local Getgenv_LastRespawnTime_2 = getgenv().lastRespawnTime;
            local var1284 = var1283 - 0;
            -- 1767089558.947794
            local var1285 = (var1284 < 10); -- false
            local Shared_10 = ReplicatedStorage.Shared;
            local Packages_10 = Shared_10.Packages;
            local Knit_10 = Packages_10.Knit;
            local Services_10 = Knit_10.Services;
            local WaitForChild_45 = Services_10.WaitForChild;
            local ToolService_5 = Services_10:WaitForChild("ToolService");
            local WaitForChild_46 = ToolService_5.WaitForChild;
            local RF_9 = ToolService_5:WaitForChild("RF");
            local WaitForChild_47 = RF_9.WaitForChild;
            local ToolActivated_3 = RF_9:WaitForChild("ToolActivated");
            local Shared_11 = ReplicatedStorage.Shared;
            local Packages_11 = Shared_11.Packages;
            local Knit_11 = Packages_11.Knit;
            local Services_11 = Knit_11.Services;
            local WaitForChild_48 = Services_11.WaitForChild;
            local ProximityService_3 = Services_11:WaitForChild("ProximityService");
            local WaitForChild_49 = ProximityService_3.WaitForChild;
            local RF_10 = ProximityService_3:WaitForChild("RF");
            local WaitForChild_50 = RF_10.WaitForChild;
            local Purchase_2 = RF_10:WaitForChild("Purchase");
            for i_51, v_51 in ipairs(p1_0) do
                local Character_138 = LocalPlayer.Character;
                local Backpack_2 = LocalPlayer:FindFirstChildOfClass("Backpack");
                if not Character_138 then return end -- won't run
                local Children_49 = Character_138:GetChildren();
                for i_52, v_52 in ipairs(Children_49) do
                    local Name_41 = v_52.Name;
                    local Name_41_is_v_51 = (Name_41 == v_51);
                    -- false, eq id 209
                end
                if not Backpack_2 then return end -- won't run
                local GetChildren_45 = Backpack_2.GetChildren;
                local Children_50 = Backpack_2:GetChildren();
                for i_53, v_53 in ipairs(Children_50) do
                    local Name_42 = v_53.Name;
                    local Name_42_is_v_51 = (Name_42 == v_51);
                    -- false, eq id 210
                end
                local Array_2 = {};
                local var1284 = table.insert(Array_2, v_51);
            end
            local Len_Array_2 = #Array_2;
            -- 0
            local var1285 = (Len_Array_2 > 0); -- false
            local Waited_For_418 = task.wait(0.2);
            local Not_P1_0_179 = not p1_0;
            -- false
            local Len_P1_0_38 = #p1_0;
            local var1286 = (Len_P1_0_38 == 0);
            -- false, eq id 211
            local var1287 = (Not_P1_0_179 or var1286); -- false
            local Character_139 = LocalPlayer.Character;
            -- local _ = Character_139 or (unknown_value)
            local Humanoid_146 = Character_139:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_146 = Character_139:FindFirstChild("HumanoidRootPart");
            local var1288 = (Humanoid_146 and HumanoidRootPart_146); -- HumanoidRootPart_146
            local var1289 = (Character_139 and var1288); -- HumanoidRootPart_146
            local var1290 = (var1289 and true); -- true
            local var1291 = (var1290 or false);
            local var1292 = tick();
            local Getgenv_LastRespawnTime_3 = getgenv().lastRespawnTime;
            local var1293 = var1292 - 0;
            -- 1767089558.980092
            local var1294 = (var1293 < 10); -- false
            local Shared_12 = ReplicatedStorage.Shared;
            local Packages_12 = Shared_12.Packages;
            local Knit_12 = Packages_12.Knit;
            local Services_12 = Knit_12.Services;
            local WaitForChild_51 = Services_12.WaitForChild;
            local ToolService_6 = Services_12:WaitForChild("ToolService");
            local WaitForChild_52 = ToolService_6.WaitForChild;
            local RF_11 = ToolService_6:WaitForChild("RF");
            local WaitForChild_53 = RF_11.WaitForChild;
            local ToolActivated_4 = RF_11:WaitForChild("ToolActivated");
            local Shared_13 = ReplicatedStorage.Shared;
            local Packages_13 = Shared_13.Packages;
            local Knit_13 = Packages_13.Knit;
            local Services_13 = Knit_13.Services;
            local WaitForChild_54 = Services_13.WaitForChild;
            local ProximityService_4 = Services_13:WaitForChild("ProximityService");
            local WaitForChild_55 = ProximityService_4.WaitForChild;
            local RF_12 = ProximityService_4:WaitForChild("RF");
            local WaitForChild_56 = RF_12.WaitForChild;
            local Purchase_3 = RF_12:WaitForChild("Purchase");
            for i_54, v_54 in ipairs(p1_0) do
                local Character_140 = LocalPlayer.Character;
                local Backpack_3 = LocalPlayer:FindFirstChildOfClass("Backpack");
                if not Character_140 then return end -- won't run
                local Children_51 = Character_140:GetChildren();
                for i_55, v_55 in ipairs(Children_51) do
                    local Name_43 = v_55.Name;
                    local Name_43_is_v_54 = (Name_43 == v_54);
                    -- false, eq id 212
                end
                if not Backpack_3 then return end -- won't run
                local GetChildren_46 = Backpack_3.GetChildren;
                local Children_52 = Backpack_3:GetChildren();
                for i_56, v_56 in ipairs(Children_52) do
                    local Name_44 = v_56.Name;
                    local Name_44_is_v_54 = (Name_44 == v_54);
                    -- false, eq id 213
                end
                local Array_3 = {};
                local var1293 = table.insert(Array_3, v_54);
            end
            local Len_Array_3 = #Array_3;
            -- 0
            local var1294 = (Len_Array_3 > 0); -- false
            local Waited_For_419 = task.wait(0.2);
            local Not_P1_0_180 = not p1_0;
            -- false
            local Len_P1_0_39 = #p1_0;
            local var1295 = (Len_P1_0_39 == 0);
            -- false, eq id 214
            local var1296 = (Not_P1_0_180 or var1295); -- false
            local Character_141 = LocalPlayer.Character;
            -- local _ = Character_141 or (unknown_value)
            local Humanoid_147 = Character_141:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_147 = Character_141:FindFirstChild("HumanoidRootPart");
            local var1297 = (Humanoid_147 and HumanoidRootPart_147); -- HumanoidRootPart_147
            local var1298 = (Character_141 and var1297); -- HumanoidRootPart_147
            local var1299 = (var1298 and true); -- true
            local var1300 = (var1299 or false);
            local var1301 = tick();
            local Getgenv_LastRespawnTime_4 = getgenv().lastRespawnTime;
            local var1302 = var1301 - 0;
            -- 1767089559.010843
            local var1303 = (var1302 < 10); -- false
            local Shared_14 = ReplicatedStorage.Shared;
            local Packages_14 = Shared_14.Packages;
            local Knit_14 = Packages_14.Knit;
            local Services_14 = Knit_14.Services;
            local WaitForChild_57 = Services_14.WaitForChild;
            local ToolService_7 = Services_14:WaitForChild("ToolService");
            local WaitForChild_58 = ToolService_7.WaitForChild;
            local RF_13 = ToolService_7:WaitForChild("RF");
            local WaitForChild_59 = RF_13.WaitForChild;
            local ToolActivated_5 = RF_13:WaitForChild("ToolActivated");
            local Shared_15 = ReplicatedStorage.Shared;
            local Packages_15 = Shared_15.Packages;
            local Knit_15 = Packages_15.Knit;
            local Services_15 = Knit_15.Services;
            local WaitForChild_60 = Services_15.WaitForChild;
            local ProximityService_5 = Services_15:WaitForChild("ProximityService");
            local WaitForChild_61 = ProximityService_5.WaitForChild;
            local RF_14 = ProximityService_5:WaitForChild("RF");
            local WaitForChild_62 = RF_14.WaitForChild;
            local Purchase_4 = RF_14:WaitForChild("Purchase");
            for i_57, v_57 in ipairs(p1_0) do
                local Character_142 = LocalPlayer.Character;
                local Backpack_4 = LocalPlayer:FindFirstChildOfClass("Backpack");
                if not Character_142 then return end -- won't run
                local Children_53 = Character_142:GetChildren();
                for i_58, v_58 in ipairs(Children_53) do
                    local Name_45 = v_58.Name;
                    local Name_45_is_v_57 = (Name_45 == v_57);
                    -- false, eq id 215
                end
                if not Backpack_4 then return end -- won't run
                local GetChildren_47 = Backpack_4.GetChildren;
                local Children_54 = Backpack_4:GetChildren();
                for i_59, v_59 in ipairs(Children_54) do
                    local Name_46 = v_59.Name;
                    local Name_46_is_v_57 = (Name_46 == v_57);
                    -- false, eq id 216
                end
                local Array_4 = {};
                local var1302 = table.insert(Array_4, v_57);
            end
            local Len_Array_4 = #Array_4;
            -- 0
            local var1303 = (Len_Array_4 > 0); -- false
            local Waited_For_420 = task.wait(0.2);
            local Not_P1_0_181 = not p1_0;
            -- false
            local Len_P1_0_40 = #p1_0;
            local var1304 = (Len_P1_0_40 == 0);
            -- false, eq id 217
            local var1305 = (Not_P1_0_181 or var1304); -- false
            local Character_143 = LocalPlayer.Character;
            -- local _ = Character_143 or (unknown_value)
            local Humanoid_148 = Character_143:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_148 = Character_143:FindFirstChild("HumanoidRootPart");
            local var1306 = (Humanoid_148 and HumanoidRootPart_148); -- HumanoidRootPart_148
            local var1307 = (Character_143 and var1306); -- HumanoidRootPart_148
            local var1308 = (var1307 and true); -- true
            local var1309 = (var1308 or false);
            local var1310 = tick();
            local Getgenv_LastRespawnTime_5 = getgenv().lastRespawnTime;
            local var1311 = var1310 - 0;
            -- 1767089559.041456
            local var1312 = (var1311 < 10); -- false
            local Shared_16 = ReplicatedStorage.Shared;
            local Packages_16 = Shared_16.Packages;
            local Knit_16 = Packages_16.Knit;
            local Services_16 = Knit_16.Services;
            local WaitForChild_63 = Services_16.WaitForChild;
            local ToolService_8 = Services_16:WaitForChild("ToolService");
            local WaitForChild_64 = ToolService_8.WaitForChild;
            local RF_15 = ToolService_8:WaitForChild("RF");
            local WaitForChild_65 = RF_15.WaitForChild;
            local ToolActivated_6 = RF_15:WaitForChild("ToolActivated");
            local Shared_17 = ReplicatedStorage.Shared;
            local Packages_17 = Shared_17.Packages;
            local Knit_17 = Packages_17.Knit;
            local Services_17 = Knit_17.Services;
            local WaitForChild_66 = Services_17.WaitForChild;
            local ProximityService_6 = Services_17:WaitForChild("ProximityService");
            local WaitForChild_67 = ProximityService_6.WaitForChild;
            local RF_16 = ProximityService_6:WaitForChild("RF");
            local WaitForChild_68 = RF_16.WaitForChild;
            local Purchase_5 = RF_16:WaitForChild("Purchase");
            for i_60, v_60 in ipairs(p1_0) do
                local Character_144 = LocalPlayer.Character;
                local Backpack_5 = LocalPlayer:FindFirstChildOfClass("Backpack");
                if not Character_144 then return end -- won't run
                local Children_55 = Character_144:GetChildren();
                for i_61, v_61 in ipairs(Children_55) do
                    local Name_47 = v_61.Name;
                    local Name_47_is_v_60 = (Name_47 == v_60);
                    -- false, eq id 218
                end
                if not Backpack_5 then return end -- won't run
                local GetChildren_48 = Backpack_5.GetChildren;
                local Children_56 = Backpack_5:GetChildren();
                for i_62, v_62 in ipairs(Children_56) do
                    local Name_48 = v_62.Name;
                    local Name_48_is_v_60 = (Name_48 == v_60);
                    -- false, eq id 219
                end
                local Array_5 = {};
                local var1311 = table.insert(Array_5, v_60);
            end
            local Len_Array_5 = #Array_5;
            -- 0
            local var1312 = (Len_Array_5 > 0); -- false
            local Waited_For_421 = task.wait(0.2);
            local Not_P1_0_182 = not p1_0;
            -- false
            local Len_P1_0_41 = #p1_0;
            local var1313 = (Len_P1_0_41 == 0);
            -- false, eq id 220
            local var1314 = (Not_P1_0_182 or var1313); -- false
            local Character_145 = LocalPlayer.Character;
            -- local _ = Character_145 or (unknown_value)
            local Humanoid_149 = Character_145:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_149 = Character_145:FindFirstChild("HumanoidRootPart");
            local var1315 = (Humanoid_149 and HumanoidRootPart_149); -- HumanoidRootPart_149
            local var1316 = (Character_145 and var1315); -- HumanoidRootPart_149
            local var1317 = (var1316 and true); -- true
            local var1318 = (var1317 or false);
            local var1319 = tick();
            local Getgenv_LastRespawnTime_6 = getgenv().lastRespawnTime;
            local var1320 = var1319 - 0;
            -- 1767089559.071236
            local var1321 = (var1320 < 10); -- false
            local Shared_18 = ReplicatedStorage.Shared;
            local Packages_18 = Shared_18.Packages;
            local Knit_18 = Packages_18.Knit;
            local Services_18 = Knit_18.Services;
            local WaitForChild_69 = Services_18.WaitForChild;
            local ToolService_9 = Services_18:WaitForChild("ToolService");
            local WaitForChild_70 = ToolService_9.WaitForChild;
            local RF_17 = ToolService_9:WaitForChild("RF");
            local WaitForChild_71 = RF_17.WaitForChild;
            local ToolActivated_7 = RF_17:WaitForChild("ToolActivated");
            local Shared_19 = ReplicatedStorage.Shared;
            local Packages_19 = Shared_19.Packages;
            local Knit_19 = Packages_19.Knit;
            local Services_19 = Knit_19.Services;
            local WaitForChild_72 = Services_19.WaitForChild;
            local ProximityService_7 = Services_19:WaitForChild("ProximityService");
            local WaitForChild_73 = ProximityService_7.WaitForChild;
            local RF_18 = ProximityService_7:WaitForChild("RF");
            local WaitForChild_74 = RF_18.WaitForChild;
            local Purchase_6 = RF_18:WaitForChild("Purchase");
            for i_63, v_63 in ipairs(p1_0) do
                local Character_146 = LocalPlayer.Character;
                local Backpack_6 = LocalPlayer:FindFirstChildOfClass("Backpack");
                if not Character_146 then return end -- won't run
                local Children_57 = Character_146:GetChildren();
                for i_64, v_64 in ipairs(Children_57) do
                    local Name_49 = v_64.Name;
                    local Name_49_is_v_63 = (Name_49 == v_63);
                    -- false, eq id 221
                end
                if not Backpack_6 then return end -- won't run
                local GetChildren_49 = Backpack_6.GetChildren;
                local Children_58 = Backpack_6:GetChildren();
                for i_65, v_65 in ipairs(Children_58) do
                    local Name_50 = v_65.Name;
                    local Name_50_is_v_63 = (Name_50 == v_63);
                    -- false, eq id 222
                end
                local Array_6 = {};
                local var1320 = table.insert(Array_6, v_63);
            end
            local Len_Array_6 = #Array_6;
            -- 0
            local var1321 = (Len_Array_6 > 0); -- false
            local Waited_For_422 = task.wait(0.2);
            local Not_P1_0_183 = not p1_0;
            -- false
            local Len_P1_0_42 = #p1_0;
            local var1322 = (Len_P1_0_42 == 0);
            -- false, eq id 223
            local var1323 = (Not_P1_0_183 or var1322); -- false
            local Character_147 = LocalPlayer.Character;
            -- local _ = Character_147 or (unknown_value)
            local Humanoid_150 = Character_147:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_150 = Character_147:FindFirstChild("HumanoidRootPart");
            local var1324 = (Humanoid_150 and HumanoidRootPart_150); -- HumanoidRootPart_150
            local var1325 = (Character_147 and var1324); -- HumanoidRootPart_150
            local var1326 = (var1325 and true); -- true
            local var1327 = (var1326 or false);
            local var1328 = tick();
            local Getgenv_LastRespawnTime_7 = getgenv().lastRespawnTime;
            local var1329 = var1328 - 0;
            -- 1767089559.100631
            local var1330 = (var1329 < 10); -- false
            local Shared_20 = ReplicatedStorage.Shared;
            local Packages_20 = Shared_20.Packages;
            local Knit_20 = Packages_20.Knit;
            local Services_20 = Knit_20.Services;
            local WaitForChild_75 = Services_20.WaitForChild;
            local ToolService_10 = Services_20:WaitForChild("ToolService");
            local WaitForChild_76 = ToolService_10.WaitForChild;
            local RF_19 = ToolService_10:WaitForChild("RF");
            local WaitForChild_77 = RF_19.WaitForChild;
            local ToolActivated_8 = RF_19:WaitForChild("ToolActivated");
            local Shared_21 = ReplicatedStorage.Shared;
            local Packages_21 = Shared_21.Packages;
            local Knit_21 = Packages_21.Knit;
            local Services_21 = Knit_21.Services;
            local WaitForChild_78 = Services_21.WaitForChild;
            local ProximityService_8 = Services_21:WaitForChild("ProximityService");
            local WaitForChild_79 = ProximityService_8.WaitForChild;
            local RF_20 = ProximityService_8:WaitForChild("RF");
            local WaitForChild_80 = RF_20.WaitForChild;
            local Purchase_7 = RF_20:WaitForChild("Purchase");
            for i_66, v_66 in ipairs(p1_0) do
                local Character_148 = LocalPlayer.Character;
                local Backpack_7 = LocalPlayer:FindFirstChildOfClass("Backpack");
                if not Character_148 then return end -- won't run
                local Children_59 = Character_148:GetChildren();
                for i_67, v_67 in ipairs(Children_59) do
                    local Name_51 = v_67.Name;
                    local Name_51_is_v_66 = (Name_51 == v_66);
                    -- false, eq id 224
                end
                if not Backpack_7 then return end -- won't run
                local GetChildren_50 = Backpack_7.GetChildren;
                local Children_60 = Backpack_7:GetChildren();
                for i_68, v_68 in ipairs(Children_60) do
                    local Name_52 = v_68.Name;
                    local Name_52_is_v_66 = (Name_52 == v_66);
                    -- false, eq id 225
                end
                local Array_7 = {};
                local var1329 = table.insert(Array_7, v_66);
            end
            local Len_Array_7 = #Array_7;
            -- 0
            local var1330 = (Len_Array_7 > 0); -- false
            local Waited_For_423 = task.wait(0.2);
            local Not_P1_0_184 = not p1_0;
            -- false
            local Len_P1_0_43 = #p1_0;
            local var1331 = (Len_P1_0_43 == 0);
            -- false, eq id 226
            local var1332 = (Not_P1_0_184 or var1331); -- false
            local Character_149 = LocalPlayer.Character;
            -- local _ = Character_149 or (unknown_value)
            local Humanoid_151 = Character_149:FindFirstChildOfClass("Humanoid");
            local HumanoidRootPart_151 = Character_149:FindFirstChild("HumanoidRootPart");
            local var1333 = (Humanoid_151 and HumanoidRootPart_151); -- HumanoidRootPart_151
            local var1334 = (Character_149 and var1333); -- HumanoidRootPart_151
            local var1335 = (var1334 and true); -- true
            local var1336 = (var1335 or false);
            local var1337 = tick();
            local Getgenv_LastRespawnTime_8 = getgenv().lastRespawnTime;
            local var1338 = var1337 - 0;
            -- 1767089559.130119
            local var1339 = (var1338 < 10); -- false
            local Shared_22 = ReplicatedStorage.Shared;
            local Packages_22 = Shared_22.Packages;
            local Knit_22 = Packages_22.Knit;
            local Services_22 = Knit_22.Services;
            local WaitForChild_81 = Services_22.WaitForChild;
            local ToolService_11 = Services_22:WaitForChild("ToolService");
            local WaitForChild_82 = ToolService_11.WaitForChild;
            local RF_21 = ToolService_11:WaitForChild("RF");
            local WaitForChild_83 = RF_21.WaitForChild;
            local ToolActivated_9 = RF_21:WaitForChild("ToolActivated");
            local Shared_23 = ReplicatedStorage.Shared;
            local Packages_23 = Shared_23.Packages;
            local Knit_23 = Packages_23.Knit;
            local Services_23 = Knit_23.Services;
            local WaitForChild_84 = Services_23.WaitForChild;
            local ProximityService_9 = Services_23:WaitForChild("ProximityService");
            local WaitForChild_85 = ProximityService_9.WaitForChild;
            local RF_22 = ProximityService_9:WaitForChild("RF");
            local WaitForChild_86 = RF_22.WaitForChild;
            local Purchase_8 = RF_22:WaitForChild("Purchase");
            for i_69, v_69 in ipairs(p1_0) do
                local Character_150 = LocalPlayer.Character;
                local Backpack_8 = LocalPlayer:FindFirstChildOfClass("Backpack");
                if not Character_150 then return end -- won't run
                local Children_61 = Character_150:GetChildren();
                for i_70, v_70 in ipairs(Children_61) do
                    local Name_53 = v_70.Name;
                    local Name_53_is_v_69 = (Name_53 == v_69);
                    -- false, eq id 227
                end
                if not Backpack_8 then return end -- won't run
                local GetChildren_51 = Backpack_8.GetChildren;
                local Children_62 = Backpack_8:GetChildren();
                for i_71, v_71 in ipairs(Children_62) do
                    local Name_54 = v_71.Name;
                    local Name_54_is_v_69 = (Name_54 == v_69);
                    -- false, eq id 228
                end
                local Array_8 = {};
                local var1338 = table.insert(Array_8, v_69);
            end
            local Len_Array_8 = #Array_8;
            -- 0
            local var1339 = (Len_Array_8 > 0); -- false
            local Waited_For_424 = task.wait(0.2);
            local Not_P1_0_185 = not p1_0;
            -- false
            local Len_P1_0_44 = #p1_0;
            error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

        end);

    end,
    Name = "Auto Buy/Drink Potion",
    Flag = "AutoPotionToggle",
});
local CreateSection_8 = Misc.CreateSection;
local Humanoid = Misc:CreateSection("Humanoid");
local CreateToggle_13 = Misc.CreateToggle;
local Toggle_13 = Misc:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)

    end,
    Name = "Auto Parry",
    Flag = "AutoParryToggle",
});
local Spawned_4 = task.spawn(function()
    local CreateSlider_7 = Misc.CreateSlider;
    local Slider_7 = Misc:CreateSlider({
        Name = "Walk Speed",
        Callback = function(p1_0)
            local var1340 = math.clamp(p1_0, 16, 100);

        end,
        CurrentValue = 30,
        Increment = 1,
        Range = {
            16,
            100,
        },
        Flag = "WalkSpeedSlider",
    });

end);
local Spawned_5 = task.spawn(function()
    local Shared_7 = ReplicatedStorage.Shared;
    local Packages_7 = Shared_7.Packages;
    local Knit_7 = Packages_7.Knit;
    local Services_7 = Knit_7.Services;
    local ToolService_3 = Services_7.ToolService;
    local RF_6 = ToolService_3.RF;
    local ToolActivated = RF_6.ToolActivated;
    local Waited_For = task.wait(0.15);
    local Getgenv_Npcfound = getgenv().npcfound;
    local Getgenv_Orefound = getgenv().orefound;
    local Waited_For_2 = task.wait(0.15);
    local Getgenv_Npcfound_2 = getgenv().npcfound;
    local Getgenv_Orefound_2 = getgenv().orefound;
    local Waited_For_3 = task.wait(0.15);
    local Getgenv_Npcfound_3 = getgenv().npcfound;
    local Getgenv_Orefound_3 = getgenv().orefound;
    local Waited_For_4 = task.wait(0.15);
    local Getgenv_Npcfound_4 = getgenv().npcfound;
    local Getgenv_Orefound_4 = getgenv().orefound;
    local Waited_For_5 = task.wait(0.15);
    local Getgenv_Npcfound_5 = getgenv().npcfound;
    local Getgenv_Orefound_5 = getgenv().orefound;
    local Waited_For_6 = task.wait(0.15);
    local Getgenv_Npcfound_6 = getgenv().npcfound;
    local Getgenv_Orefound_6 = getgenv().orefound;
    local Waited_For_7 = task.wait(0.15);
    local Getgenv_Npcfound_7 = getgenv().npcfound;
    local Getgenv_Orefound_7 = getgenv().orefound;
    local Waited_For_8 = task.wait(0.15);
    local Getgenv_Npcfound_8 = getgenv().npcfound;
    local Getgenv_Orefound_8 = getgenv().orefound;
    local Waited_For_9 = task.wait(0.15);
    local Getgenv_Npcfound_9 = getgenv().npcfound;
    local Getgenv_Orefound_9 = getgenv().orefound;
    local Waited_For_10 = task.wait(0.15);
    local Getgenv_Npcfound_10 = getgenv().npcfound;
    local Getgenv_Orefound_10 = getgenv().orefound;
    local Waited_For_11 = task.wait(0.15);
    local Getgenv_Npcfound_11 = getgenv().npcfound;
    local Getgenv_Orefound_11 = getgenv().orefound;
    local Waited_For_12 = task.wait(0.15);
    local Getgenv_Npcfound_12 = getgenv().npcfound;
    local Getgenv_Orefound_12 = getgenv().orefound;
    local Waited_For_13 = task.wait(0.15);
    local Getgenv_Npcfound_13 = getgenv().npcfound;
    local Getgenv_Orefound_13 = getgenv().orefound;
    local Waited_For_14 = task.wait(0.15);
    local Getgenv_Npcfound_14 = getgenv().npcfound;
    local Getgenv_Orefound_14 = getgenv().orefound;
    local Waited_For_15 = task.wait(0.15);
    local Getgenv_Npcfound_15 = getgenv().npcfound;
    local Getgenv_Orefound_15 = getgenv().orefound;
    local Waited_For_16 = task.wait(0.15);
    local Getgenv_Npcfound_16 = getgenv().npcfound;
    local Getgenv_Orefound_16 = getgenv().orefound;
    local Waited_For_17 = task.wait(0.15);
    local Getgenv_Npcfound_17 = getgenv().npcfound;
    local Getgenv_Orefound_17 = getgenv().orefound;
    local Waited_For_18 = task.wait(0.15);
    local Getgenv_Npcfound_18 = getgenv().npcfound;
    local Getgenv_Orefound_18 = getgenv().orefound;
    local Waited_For_19 = task.wait(0.15);
    local Getgenv_Npcfound_19 = getgenv().npcfound;
    local Getgenv_Orefound_19 = getgenv().orefound;
    local Waited_For_20 = task.wait(0.15);
    local Getgenv_Npcfound_20 = getgenv().npcfound;
    local Getgenv_Orefound_20 = getgenv().orefound;
    local Waited_For_21 = task.wait(0.15);
    local Getgenv_Npcfound_21 = getgenv().npcfound;
    local Getgenv_Orefound_21 = getgenv().orefound;
    local Waited_For_22 = task.wait(0.15);
    local Getgenv_Npcfound_22 = getgenv().npcfound;
    local Getgenv_Orefound_22 = getgenv().orefound;
    local Waited_For_23 = task.wait(0.15);
    local Getgenv_Npcfound_23 = getgenv().npcfound;
    local Getgenv_Orefound_23 = getgenv().orefound;
    local Waited_For_24 = task.wait(0.15);
    local Getgenv_Npcfound_24 = getgenv().npcfound;
    local Getgenv_Orefound_24 = getgenv().orefound;
    local Waited_For_25 = task.wait(0.15);
    local Getgenv_Npcfound_25 = getgenv().npcfound;
    local Getgenv_Orefound_25 = getgenv().orefound;
    local Waited_For_26 = task.wait(0.15);
    local Getgenv_Npcfound_26 = getgenv().npcfound;
    local Getgenv_Orefound_26 = getgenv().orefound;
    local Waited_For_27 = task.wait(0.15);
    local Getgenv_Npcfound_27 = getgenv().npcfound;
    local Getgenv_Orefound_27 = getgenv().orefound;
    local Waited_For_28 = task.wait(0.15);
    local Getgenv_Npcfound_28 = getgenv().npcfound;
    local Getgenv_Orefound_28 = getgenv().orefound;
    local Waited_For_29 = task.wait(0.15);
    local Getgenv_Npcfound_29 = getgenv().npcfound;
    local Getgenv_Orefound_29 = getgenv().orefound;
    local Waited_For_30 = task.wait(0.15);
    local Getgenv_Npcfound_30 = getgenv().npcfound;
    local Getgenv_Orefound_30 = getgenv().orefound;
    local Waited_For_31 = task.wait(0.15);
    local Getgenv_Npcfound_31 = getgenv().npcfound;
    local Getgenv_Orefound_31 = getgenv().orefound;
    local Waited_For_32 = task.wait(0.15);
    local Getgenv_Npcfound_32 = getgenv().npcfound;
    local Getgenv_Orefound_32 = getgenv().orefound;
    local Waited_For_33 = task.wait(0.15);
    local Getgenv_Npcfound_33 = getgenv().npcfound;
    local Getgenv_Orefound_33 = getgenv().orefound;
    local Waited_For_34 = task.wait(0.15);
    local Getgenv_Npcfound_34 = getgenv().npcfound;
    local Getgenv_Orefound_34 = getgenv().orefound;
    local Waited_For_35 = task.wait(0.15);
    local Getgenv_Npcfound_35 = getgenv().npcfound;
    local Getgenv_Orefound_35 = getgenv().orefound;
    local Waited_For_36 = task.wait(0.15);
    local Getgenv_Npcfound_36 = getgenv().npcfound;
    local Getgenv_Orefound_36 = getgenv().orefound;
    local Waited_For_37 = task.wait(0.15);
    local Getgenv_Npcfound_37 = getgenv().npcfound;
    local Getgenv_Orefound_37 = getgenv().orefound;
    local Waited_For_38 = task.wait(0.15);
    local Getgenv_Npcfound_38 = getgenv().npcfound;
    local Getgenv_Orefound_38 = getgenv().orefound;
    local Waited_For_39 = task.wait(0.15);
    local Getgenv_Npcfound_39 = getgenv().npcfound;
    local Getgenv_Orefound_39 = getgenv().orefound;
    local Waited_For_40 = task.wait(0.15);
    local Getgenv_Npcfound_40 = getgenv().npcfound;
    local Getgenv_Orefound_40 = getgenv().orefound;
    local Waited_For_41 = task.wait(0.15);
    local Getgenv_Npcfound_41 = getgenv().npcfound;
    local Getgenv_Orefound_41 = getgenv().orefound;
    local Waited_For_42 = task.wait(0.15);
    local Getgenv_Npcfound_42 = getgenv().npcfound;
    local Getgenv_Orefound_42 = getgenv().orefound;
    local Waited_For_43 = task.wait(0.15);
    local Getgenv_Npcfound_43 = getgenv().npcfound;
    local Getgenv_Orefound_43 = getgenv().orefound;
    local Waited_For_44 = task.wait(0.15);
    local Getgenv_Npcfound_44 = getgenv().npcfound;
    local Getgenv_Orefound_44 = getgenv().orefound;
    local Waited_For_45 = task.wait(0.15);
    local Getgenv_Npcfound_45 = getgenv().npcfound;
    local Getgenv_Orefound_45 = getgenv().orefound;
    local Waited_For_46 = task.wait(0.15);
    local Getgenv_Npcfound_46 = getgenv().npcfound;
    local Getgenv_Orefound_46 = getgenv().orefound;
    local Waited_For_47 = task.wait(0.15);
    local Getgenv_Npcfound_47 = getgenv().npcfound;
    local Getgenv_Orefound_47 = getgenv().orefound;
    local Waited_For_48 = task.wait(0.15);
    local Getgenv_Npcfound_48 = getgenv().npcfound;
    local Getgenv_Orefound_48 = getgenv().orefound;
    local Waited_For_49 = task.wait(0.15);
    local Getgenv_Npcfound_49 = getgenv().npcfound;
    local Getgenv_Orefound_49 = getgenv().orefound;
    local Waited_For_50 = task.wait(0.15);
    local Getgenv_Npcfound_50 = getgenv().npcfound;
    local Getgenv_Orefound_50 = getgenv().orefound;
    local Waited_For_51 = task.wait(0.15);
    local Getgenv_Npcfound_51 = getgenv().npcfound;
    local Getgenv_Orefound_51 = getgenv().orefound;
    local Waited_For_52 = task.wait(0.15);
    local Getgenv_Npcfound_52 = getgenv().npcfound;
    local Getgenv_Orefound_52 = getgenv().orefound;
    local Waited_For_53 = task.wait(0.15);
    local Getgenv_Npcfound_53 = getgenv().npcfound;
    local Getgenv_Orefound_53 = getgenv().orefound;
    local Waited_For_54 = task.wait(0.15);
    local Getgenv_Npcfound_54 = getgenv().npcfound;
    local Getgenv_Orefound_54 = getgenv().orefound;
    local Waited_For_55 = task.wait(0.15);
    local Getgenv_Npcfound_55 = getgenv().npcfound;
    local Getgenv_Orefound_55 = getgenv().orefound;
    local Waited_For_56 = task.wait(0.15);
    local Getgenv_Npcfound_56 = getgenv().npcfound;
    local Getgenv_Orefound_56 = getgenv().orefound;
    local Waited_For_57 = task.wait(0.15);
    local Getgenv_Npcfound_57 = getgenv().npcfound;
    local Getgenv_Orefound_57 = getgenv().orefound;
    local Waited_For_58 = task.wait(0.15);
    local Getgenv_Npcfound_58 = getgenv().npcfound;
    local Getgenv_Orefound_58 = getgenv().orefound;
    local Waited_For_59 = task.wait(0.15);
    local Getgenv_Npcfound_59 = getgenv().npcfound;
    local Getgenv_Orefound_59 = getgenv().orefound;
    local Waited_For_60 = task.wait(0.15);
    local Getgenv_Npcfound_60 = getgenv().npcfound;
    local Getgenv_Orefound_60 = getgenv().orefound;
    local Waited_For_61 = task.wait(0.15);
    local Getgenv_Npcfound_61 = getgenv().npcfound;
    local Getgenv_Orefound_61 = getgenv().orefound;
    local Waited_For_62 = task.wait(0.15);
    local Getgenv_Npcfound_62 = getgenv().npcfound;
    local Getgenv_Orefound_62 = getgenv().orefound;
    local Waited_For_63 = task.wait(0.15);
    local Getgenv_Npcfound_63 = getgenv().npcfound;
    local Getgenv_Orefound_63 = getgenv().orefound;
    local Waited_For_64 = task.wait(0.15);
    local Getgenv_Npcfound_64 = getgenv().npcfound;
    local Getgenv_Orefound_64 = getgenv().orefound;
    local Waited_For_65 = task.wait(0.15);
    local Getgenv_Npcfound_65 = getgenv().npcfound;
    local Getgenv_Orefound_65 = getgenv().orefound;
    local Waited_For_66 = task.wait(0.15);
    local Getgenv_Npcfound_66 = getgenv().npcfound;
    local Getgenv_Orefound_66 = getgenv().orefound;
    local Waited_For_67 = task.wait(0.15);
    local Getgenv_Npcfound_67 = getgenv().npcfound;
    local Getgenv_Orefound_67 = getgenv().orefound;
    local Waited_For_68 = task.wait(0.15);
    local Getgenv_Npcfound_68 = getgenv().npcfound;
    local Getgenv_Orefound_68 = getgenv().orefound;
    local Waited_For_69 = task.wait(0.15);
    local Getgenv_Npcfound_69 = getgenv().npcfound;
    local Getgenv_Orefound_69 = getgenv().orefound;
    local Waited_For_70 = task.wait(0.15);
    local Getgenv_Npcfound_70 = getgenv().npcfound;
    local Getgenv_Orefound_70 = getgenv().orefound;
    local Waited_For_71 = task.wait(0.15);
    local Getgenv_Npcfound_71 = getgenv().npcfound;
    local Getgenv_Orefound_71 = getgenv().orefound;
    local Waited_For_72 = task.wait(0.15);
    local Getgenv_Npcfound_72 = getgenv().npcfound;
    local Getgenv_Orefound_72 = getgenv().orefound;
    local Waited_For_73 = task.wait(0.15);
    local Getgenv_Npcfound_73 = getgenv().npcfound;
    local Getgenv_Orefound_73 = getgenv().orefound;
    local Waited_For_74 = task.wait(0.15);
    local Getgenv_Npcfound_74 = getgenv().npcfound;
    local Getgenv_Orefound_74 = getgenv().orefound;
    local Waited_For_75 = task.wait(0.15);
    local Getgenv_Npcfound_75 = getgenv().npcfound;
    local Getgenv_Orefound_75 = getgenv().orefound;
    local Waited_For_76 = task.wait(0.15);
    local Getgenv_Npcfound_76 = getgenv().npcfound;
    local Getgenv_Orefound_76 = getgenv().orefound;
    local Waited_For_77 = task.wait(0.15);
    local Getgenv_Npcfound_77 = getgenv().npcfound;
    local Getgenv_Orefound_77 = getgenv().orefound;
    local Waited_For_78 = task.wait(0.15);
    local Getgenv_Npcfound_78 = getgenv().npcfound;
    local Getgenv_Orefound_78 = getgenv().orefound;
    local Waited_For_79 = task.wait(0.15);
    local Getgenv_Npcfound_79 = getgenv().npcfound;
    local Getgenv_Orefound_79 = getgenv().orefound;
    local Waited_For_80 = task.wait(0.15);
    local Getgenv_Npcfound_80 = getgenv().npcfound;
    local Getgenv_Orefound_80 = getgenv().orefound;
    local Waited_For_81 = task.wait(0.15);
    local Getgenv_Npcfound_81 = getgenv().npcfound;
    local Getgenv_Orefound_81 = getgenv().orefound;
    local Waited_For_82 = task.wait(0.15);
    local Getgenv_Npcfound_82 = getgenv().npcfound;
    local Getgenv_Orefound_82 = getgenv().orefound;
    local Waited_For_83 = task.wait(0.15);
    local Getgenv_Npcfound_83 = getgenv().npcfound;
    local Getgenv_Orefound_83 = getgenv().orefound;
    local Waited_For_84 = task.wait(0.15);
    local Getgenv_Npcfound_84 = getgenv().npcfound;
    local Getgenv_Orefound_84 = getgenv().orefound;
    local Waited_For_85 = task.wait(0.15);
    local Getgenv_Npcfound_85 = getgenv().npcfound;
    local Getgenv_Orefound_85 = getgenv().orefound;
    local Waited_For_86 = task.wait(0.15);
    local Getgenv_Npcfound_86 = getgenv().npcfound;
    local Getgenv_Orefound_86 = getgenv().orefound;
    local Waited_For_87 = task.wait(0.15);
    local Getgenv_Npcfound_87 = getgenv().npcfound;
    local Getgenv_Orefound_87 = getgenv().orefound;
    local Waited_For_88 = task.wait(0.15);
    local Getgenv_Npcfound_88 = getgenv().npcfound;
    local Getgenv_Orefound_88 = getgenv().orefound;
    local Waited_For_89 = task.wait(0.15);
    local Getgenv_Npcfound_89 = getgenv().npcfound;
    local Getgenv_Orefound_89 = getgenv().orefound;
    local Waited_For_90 = task.wait(0.15);
    local Getgenv_Npcfound_90 = getgenv().npcfound;
    local Getgenv_Orefound_90 = getgenv().orefound;
    local Waited_For_91 = task.wait(0.15);
    local Getgenv_Npcfound_91 = getgenv().npcfound;
    local Getgenv_Orefound_91 = getgenv().orefound;
    local Waited_For_92 = task.wait(0.15);
    local Getgenv_Npcfound_92 = getgenv().npcfound;
    local Getgenv_Orefound_92 = getgenv().orefound;
    local Waited_For_93 = task.wait(0.15);
    local Getgenv_Npcfound_93 = getgenv().npcfound;
    local Getgenv_Orefound_93 = getgenv().orefound;
    local Waited_For_94 = task.wait(0.15);
    local Getgenv_Npcfound_94 = getgenv().npcfound;
    local Getgenv_Orefound_94 = getgenv().orefound;
    local Waited_For_95 = task.wait(0.15);
    local Getgenv_Npcfound_95 = getgenv().npcfound;
    local Getgenv_Orefound_95 = getgenv().orefound;
    local Waited_For_96 = task.wait(0.15);
    local Getgenv_Npcfound_96 = getgenv().npcfound;
    local Getgenv_Orefound_96 = getgenv().orefound;
    local Waited_For_97 = task.wait(0.15);
    local Getgenv_Npcfound_97 = getgenv().npcfound;
    local Getgenv_Orefound_97 = getgenv().orefound;
    local Waited_For_98 = task.wait(0.15);
    local Getgenv_Npcfound_98 = getgenv().npcfound;
    local Getgenv_Orefound_98 = getgenv().orefound;
    local Waited_For_99 = task.wait(0.15);
    local Getgenv_Npcfound_99 = getgenv().npcfound;
    local Getgenv_Orefound_99 = getgenv().orefound;
    local Waited_For_100 = task.wait(0.15);
    local Getgenv_Npcfound_100 = getgenv().npcfound;
    local Getgenv_Orefound_100 = getgenv().orefound;
    local Waited_For_101 = task.wait(0.15);
    local Getgenv_Npcfound_101 = getgenv().npcfound;
    local Getgenv_Orefound_101 = getgenv().orefound;
    local Waited_For_102 = task.wait(0.15);
    local Getgenv_Npcfound_102 = getgenv().npcfound;
    local Getgenv_Orefound_102 = getgenv().orefound;
    local Waited_For_103 = task.wait(0.15);
    local Getgenv_Npcfound_103 = getgenv().npcfound;
    local Getgenv_Orefound_103 = getgenv().orefound;
    local Waited_For_104 = task.wait(0.15);
    local Getgenv_Npcfound_104 = getgenv().npcfound;
    local Getgenv_Orefound_104 = getgenv().orefound;
    local Waited_For_105 = task.wait(0.15);
    local Getgenv_Npcfound_105 = getgenv().npcfound;
    local Getgenv_Orefound_105 = getgenv().orefound;
    local Waited_For_106 = task.wait(0.15);
    local Getgenv_Npcfound_106 = getgenv().npcfound;
    local Getgenv_Orefound_106 = getgenv().orefound;
    local Waited_For_107 = task.wait(0.15);
    local Getgenv_Npcfound_107 = getgenv().npcfound;
    local Getgenv_Orefound_107 = getgenv().orefound;
    local Waited_For_108 = task.wait(0.15);
    local Getgenv_Npcfound_108 = getgenv().npcfound;
    local Getgenv_Orefound_108 = getgenv().orefound;
    local Waited_For_109 = task.wait(0.15);
    local Getgenv_Npcfound_109 = getgenv().npcfound;
    local Getgenv_Orefound_109 = getgenv().orefound;
    local Waited_For_110 = task.wait(0.15);
    local Getgenv_Npcfound_110 = getgenv().npcfound;
    local Getgenv_Orefound_110 = getgenv().orefound;
    local Waited_For_111 = task.wait(0.15);
    local Getgenv_Npcfound_111 = getgenv().npcfound;
    local Getgenv_Orefound_111 = getgenv().orefound;
    local Waited_For_112 = task.wait(0.15);
    local Getgenv_Npcfound_112 = getgenv().npcfound;
    local Getgenv_Orefound_112 = getgenv().orefound;
    local Waited_For_113 = task.wait(0.15);
    local Getgenv_Npcfound_113 = getgenv().npcfound;
    local Getgenv_Orefound_113 = getgenv().orefound;
    local Waited_For_114 = task.wait(0.15);
    local Getgenv_Npcfound_114 = getgenv().npcfound;
    local Getgenv_Orefound_114 = getgenv().orefound;
    local Waited_For_115 = task.wait(0.15);
    local Getgenv_Npcfound_115 = getgenv().npcfound;
    local Getgenv_Orefound_115 = getgenv().orefound;
    local Waited_For_116 = task.wait(0.15);
    local Getgenv_Npcfound_116 = getgenv().npcfound;
    local Getgenv_Orefound_116 = getgenv().orefound;
    local Waited_For_117 = task.wait(0.15);
    local Getgenv_Npcfound_117 = getgenv().npcfound;
    local Getgenv_Orefound_117 = getgenv().orefound;
    local Waited_For_118 = task.wait(0.15);
    local Getgenv_Npcfound_118 = getgenv().npcfound;
    local Getgenv_Orefound_118 = getgenv().orefound;
    local Waited_For_119 = task.wait(0.15);
    local Getgenv_Npcfound_119 = getgenv().npcfound;
    local Getgenv_Orefound_119 = getgenv().orefound;
    local Waited_For_120 = task.wait(0.15);
    local Getgenv_Npcfound_120 = getgenv().npcfound;
    local Getgenv_Orefound_120 = getgenv().orefound;
    local Waited_For_121 = task.wait(0.15);
    local Getgenv_Npcfound_121 = getgenv().npcfound;
    local Getgenv_Orefound_121 = getgenv().orefound;
    local Waited_For_122 = task.wait(0.15);
    local Getgenv_Npcfound_122 = getgenv().npcfound;
    local Getgenv_Orefound_122 = getgenv().orefound;
    local Waited_For_123 = task.wait(0.15);
    local Getgenv_Npcfound_123 = getgenv().npcfound;
    local Getgenv_Orefound_123 = getgenv().orefound;
    local Waited_For_124 = task.wait(0.15);
    local Getgenv_Npcfound_124 = getgenv().npcfound;
    local Getgenv_Orefound_124 = getgenv().orefound;
    local Waited_For_125 = task.wait(0.15);
    local Getgenv_Npcfound_125 = getgenv().npcfound;
    local Getgenv_Orefound_125 = getgenv().orefound;
    local Waited_For_126 = task.wait(0.15);
    local Getgenv_Npcfound_126 = getgenv().npcfound;
    local Getgenv_Orefound_126 = getgenv().orefound;
    local Waited_For_127 = task.wait(0.15);
    local Getgenv_Npcfound_127 = getgenv().npcfound;
    local Getgenv_Orefound_127 = getgenv().orefound;
    local Waited_For_128 = task.wait(0.15);
    local Getgenv_Npcfound_128 = getgenv().npcfound;
    local Getgenv_Orefound_128 = getgenv().orefound;
    local Waited_For_129 = task.wait(0.15);
    local Getgenv_Npcfound_129 = getgenv().npcfound;
    local Getgenv_Orefound_129 = getgenv().orefound;
    local Waited_For_130 = task.wait(0.15);
    local Getgenv_Npcfound_130 = getgenv().npcfound;
    local Getgenv_Orefound_130 = getgenv().orefound;
    local Waited_For_131 = task.wait(0.15);
    local Getgenv_Npcfound_131 = getgenv().npcfound;
    local Getgenv_Orefound_131 = getgenv().orefound;
    local Waited_For_132 = task.wait(0.15);
    local Getgenv_Npcfound_132 = getgenv().npcfound;
    local Getgenv_Orefound_132 = getgenv().orefound;
    local Waited_For_133 = task.wait(0.15);
    local Getgenv_Npcfound_133 = getgenv().npcfound;
    local Getgenv_Orefound_133 = getgenv().orefound;
    local Waited_For_134 = task.wait(0.15);
    local Getgenv_Npcfound_134 = getgenv().npcfound;
    local Getgenv_Orefound_134 = getgenv().orefound;
    local Waited_For_135 = task.wait(0.15);
    local Getgenv_Npcfound_135 = getgenv().npcfound;
    local Getgenv_Orefound_135 = getgenv().orefound;
    local Waited_For_136 = task.wait(0.15);
    local Getgenv_Npcfound_136 = getgenv().npcfound;
    local Getgenv_Orefound_136 = getgenv().orefound;
    local Waited_For_137 = task.wait(0.15);
    local Getgenv_Npcfound_137 = getgenv().npcfound;
    local Getgenv_Orefound_137 = getgenv().orefound;
    local Waited_For_138 = task.wait(0.15);
    local Getgenv_Npcfound_138 = getgenv().npcfound;
    local Getgenv_Orefound_138 = getgenv().orefound;
    local Waited_For_139 = task.wait(0.15);
    local Getgenv_Npcfound_139 = getgenv().npcfound;
    local Getgenv_Orefound_139 = getgenv().orefound;
    local Waited_For_140 = task.wait(0.15);
    local Getgenv_Npcfound_140 = getgenv().npcfound;
    local Getgenv_Orefound_140 = getgenv().orefound;
    local Waited_For_141 = task.wait(0.15);
    local Getgenv_Npcfound_141 = getgenv().npcfound;
    local Getgenv_Orefound_141 = getgenv().orefound;
    local Waited_For_142 = task.wait(0.15);
    local Getgenv_Npcfound_142 = getgenv().npcfound;
    local Getgenv_Orefound_142 = getgenv().orefound;
    local Waited_For_143 = task.wait(0.15);
    local Getgenv_Npcfound_143 = getgenv().npcfound;
    local Getgenv_Orefound_143 = getgenv().orefound;
    local Waited_For_144 = task.wait(0.15);
    local Getgenv_Npcfound_144 = getgenv().npcfound;
    local Getgenv_Orefound_144 = getgenv().orefound;
    local Waited_For_145 = task.wait(0.15);
    local Getgenv_Npcfound_145 = getgenv().npcfound;
    local Getgenv_Orefound_145 = getgenv().orefound;
    local Waited_For_146 = task.wait(0.15);
    local Getgenv_Npcfound_146 = getgenv().npcfound;
    local Getgenv_Orefound_146 = getgenv().orefound;
    local Waited_For_147 = task.wait(0.15);
    local Getgenv_Npcfound_147 = getgenv().npcfound;
    local Getgenv_Orefound_147 = getgenv().orefound;
    local Waited_For_148 = task.wait(0.15);
    local Getgenv_Npcfound_148 = getgenv().npcfound;
    local Getgenv_Orefound_148 = getgenv().orefound;
    local Waited_For_149 = task.wait(0.15);
    local Getgenv_Npcfound_149 = getgenv().npcfound;
    local Getgenv_Orefound_149 = getgenv().orefound;
    local Waited_For_150 = task.wait(0.15);
    local Getgenv_Npcfound_150 = getgenv().npcfound;
    local Getgenv_Orefound_150 = getgenv().orefound;
    local Waited_For_151 = task.wait(0.15);
    local Getgenv_Npcfound_151 = getgenv().npcfound;
    local Getgenv_Orefound_151 = getgenv().orefound;
    local Waited_For_152 = task.wait(0.15);
    local Getgenv_Npcfound_152 = getgenv().npcfound;
    local Getgenv_Orefound_152 = getgenv().orefound;
    local Waited_For_153 = task.wait(0.15);
    local Getgenv_Npcfound_153 = getgenv().npcfound;
    local Getgenv_Orefound_153 = getgenv().orefound;
    local Waited_For_154 = task.wait(0.15);
    local Getgenv_Npcfound_154 = getgenv().npcfound;
    local Getgenv_Orefound_154 = getgenv().orefound;
    local Waited_For_155 = task.wait(0.15);
    local Getgenv_Npcfound_155 = getgenv().npcfound;
    local Getgenv_Orefound_155 = getgenv().orefound;
    local Waited_For_156 = task.wait(0.15);
    local Getgenv_Npcfound_156 = getgenv().npcfound;
    local Getgenv_Orefound_156 = getgenv().orefound;
    local Waited_For_157 = task.wait(0.15);
    local Getgenv_Npcfound_157 = getgenv().npcfound;
    local Getgenv_Orefound_157 = getgenv().orefound;
    local Waited_For_158 = task.wait(0.15);
    local Getgenv_Npcfound_158 = getgenv().npcfound;
    local Getgenv_Orefound_158 = getgenv().orefound;
    local Waited_For_159 = task.wait(0.15);
    local Getgenv_Npcfound_159 = getgenv().npcfound;
    local Getgenv_Orefound_159 = getgenv().orefound;
    local Waited_For_160 = task.wait(0.15);
    local Getgenv_Npcfound_160 = getgenv().npcfound;
    local Getgenv_Orefound_160 = getgenv().orefound;
    local Waited_For_161 = task.wait(0.15);
    local Getgenv_Npcfound_161 = getgenv().npcfound;
    local Getgenv_Orefound_161 = getgenv().orefound;
    local Waited_For_162 = task.wait(0.15);
    local Getgenv_Npcfound_162 = getgenv().npcfound;
    local Getgenv_Orefound_162 = getgenv().orefound;
    local Waited_For_163 = task.wait(0.15);
    local Getgenv_Npcfound_163 = getgenv().npcfound;
    local Getgenv_Orefound_163 = getgenv().orefound;
    local Waited_For_164 = task.wait(0.15);
    local Getgenv_Npcfound_164 = getgenv().npcfound;
    local Getgenv_Orefound_164 = getgenv().orefound;
    error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

end);
local CreateSection_9 = Misc.CreateSection;
local Teleports = Misc:CreateSection("Teleports");
local Shops = workspace.Shops;
local GetChildren_7 = Shops.GetChildren;
local Children_8 = Shops:GetChildren();
for i_8, v_8 in ipairs(Children_8) do
    local IsA_7 = v_8.IsA;
    local Model_6 = v_8:IsA("Model");
    local Name_13 = v_8.Name;
    local var44 = (Model_6 and true); -- true
    if not var44 then return end -- won't run
    local Name_14 = v_8.Name;
    local Name_15 = v_8.Name;
end
local CreateDropdown_7 = Misc.CreateDropdown;
local Dropdown_7 = Misc:CreateDropdown({
    Name = "Shops",
    CurrentOption = "",
    Flag = "ShopsDropdown",
    MultipleOptions = false,
    Callback = function(p1_0)
        local var122 = typeof(p1_0);
        local var122_is_string = (var122 == "table");
        -- true, eq id 12
        local var123 = p1_0[1];
        local var124 = (var122_is_string and var123); -- var123
        -- local _ = var124 or (unknown_value)
        local Character_3 = LocalPlayer.Character;
        -- local _ = Character_3 or (unknown_value)
        local Humanoid_4 = Character_3:FindFirstChildOfClass("Humanoid");
        local HumanoidRootPart_3 = Character_3:FindFirstChild("HumanoidRootPart");
        local var125 = (Humanoid_4 and HumanoidRootPart_3); -- HumanoidRootPart_3
        local var126 = (Character_3 and var125); -- HumanoidRootPart_3
        local var127 = (var126 and true); -- true
        local var128 = (var127 or false);
        local Not_Var123 = not var123;
        -- false
        local Shops_2 = workspace.Shops;
        local GetChildren_12 = Shops_2.GetChildren;
        local Children_14 = Shops_2:GetChildren();
        for i_15, v_15 in ipairs(Children_14) do
            local IsA_13 = v_15.IsA;
            local Model_10 = v_15:IsA("Model");
            local Name_28 = v_15.Name;
            local Name_28_is_var123 = (Name_28 == var123);
            -- false, eq id 13
            local var129 = (Model_10 and Name_28_is_var123); -- false
        end

    end,
    Options = {
        Name_15,
    },
});
local Proximity_2 = workspace.Proximity;
local Children_9 = Proximity_2:GetChildren();
for i_9, v_9 in ipairs(Children_9) do
    local IsA_8 = v_9.IsA;
    local Model_7 = v_9:IsA("Model");
    local Name_16 = v_9.Name;
    local var45 = (Model_7 and true); -- true
    if not var45 then return end -- won't run
    local Name_17 = v_9.Name;
    local Name_18 = v_9.Name;
end
local CreateDropdown_8 = Misc.CreateDropdown;
local Dropdown_8 = Misc:CreateDropdown({
    Name = "Proximity",
    CurrentOption = "",
    Flag = "ProximityDropdown",
    MultipleOptions = false,
    Callback = function(p1_0)
        local var130 = typeof(p1_0);
        local var130_is_string = (var130 == "table");
        -- true, eq id 14
        local var131 = p1_0[1];
        local var132 = (var130_is_string and var131); -- var131
        -- local _ = var132 or (unknown_value)
        local Character_4 = LocalPlayer.Character;
        -- local _ = Character_4 or (unknown_value)
        local Humanoid_5 = Character_4:FindFirstChildOfClass("Humanoid");
        local HumanoidRootPart_4 = Character_4:FindFirstChild("HumanoidRootPart");
        local var133 = (Humanoid_5 and HumanoidRootPart_4); -- HumanoidRootPart_4
        local var134 = (Character_4 and var133); -- HumanoidRootPart_4
        local var135 = (var134 and true); -- true
        local var136 = (var135 or false);
        local Not_Var131 = not var131;
        -- false
        local Proximity_4 = workspace.Proximity;
        local Children_15 = Proximity_4:GetChildren();
        for i_16, v_16 in ipairs(Children_15) do
            local IsA_14 = v_16.IsA;
            local Model_11 = v_16:IsA("Model");
            local Name_29 = v_16.Name;
            local Name_29_is_var131 = (Name_29 == var131);
            -- false, eq id 15
            local var136 = (Model_11 and Name_29_is_var131); -- false
        end

    end,
    Options = {
        Name_18,
    },
});
local CreateButton_3 = Misc.CreateButton;
local Button_3 = Misc:CreateButton({
    Name = "Cancel",
    Callback = function()
        getgenv().current_tween = false;
        getgenv().isTeleporting = false;
        local Character_5 = LocalPlayer.Character;
        -- local _ = Character_5 or (unknown_value)
        local Humanoid_6 = Character_5:FindFirstChildOfClass("Humanoid");
        local HumanoidRootPart_5 = Character_5:FindFirstChild("HumanoidRootPart");
        local var137 = (Humanoid_6 and HumanoidRootPart_5); -- HumanoidRootPart_5
        local var138 = (Character_5 and var137); -- HumanoidRootPart_5
        local var139 = (var138 and true); -- true
        local var140 = (var139 or false);
        if not HumanoidRootPart_5 then return end -- won't run
        local Vector3_New = Vector3.new;
        local Vector3_Value = Vector3_New(0, 0, 0);
        HumanoidRootPart_5.Velocity = Vector3_Value;

    end,
});
local CreateSection_10 = Webhook.CreateSection;
local Webhook_Settings = Webhook:CreateSection("Webhook Settings");
local CreateInput = Webhook.CreateInput;
local Input = Webhook:CreateInput({
    Name = "Webhook URL",
    Flag = "WebhookURLInput",
    CurrentValue = "",
    PlaceholderText = "Enter Discord webhook URL",
    Callback = function(p1_0)

    end,
    RemoveTextAfterFocusLost = false,
});
local CreateInput_2 = Webhook.CreateInput;
local Input_2 = Webhook:CreateInput({
    Name = "User ID",
    Flag = "WebhookUserIDInput",
    CurrentValue = "",
    PlaceholderText = "Enter User ID (optional)",
    Callback = function(p1_0)

    end,
    RemoveTextAfterFocusLost = false,
});
local PlayerGui_3 = LocalPlayer:FindFirstChild("PlayerGui");
local Not_PlayerGui_3 = not PlayerGui_3;
-- false
local Success_3, Error_Message_3 = pcall(function(...)
    local Menu_2 = PlayerGui_2.Menu;
    local Frame_4 = Menu_2.Frame;
    local Frame_5 = Frame_4.Frame;
    local Menus_2 = Frame_5.Menus;
    local Stash_2 = Menus_2.Stash;
    local Background_2 = Stash_2.Background;
end) -- true, Background_2
-- local _ = Background_2 or (unknown_value)
local Not_Background_2 = not Background_2;
-- false
local GetChildren_8 = Background_2.GetChildren;
local Children_10 = Background_2:GetChildren();
for i_10, v_10 in ipairs(Children_10) do
    local IsA_9 = v_10.IsA;
    local Frame_6 = v_10:IsA("Frame");
    if not Frame_6 then return end -- won't run
    local FindFirstChild_3 = v_10.FindFirstChild;
    local Main_3 = v_10:FindFirstChild("Main");
    local FindFirstChild_4 = Main_3.FindFirstChild;
    local ItemName_2 = Main_3:FindFirstChild("ItemName");
    local var50 = (Main_3 and ItemName_2); -- ItemName_2
    local Text_4 = ItemName_2.Text;
    local Text_4_isnt_string = (Text_4 ~= "");
    -- true, eq id 4
    local Text_5 = ItemName_2.Text;
    local Text_6 = ItemName_2.Text;
    local Lower_3 = Text_6.lower;
    local Lower_4 = Text_6:lower();
    local Find_2 = Lower_4.find;
    local Totem_2 = Lower_4:find("totem", 1, true);
    if not Totem_2 then return end -- won't run
    local var52 = (Text_4_isnt_string and false); -- false
    local var53 = (var50 and var52); -- false
end
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage");
local Assets_5 = ReplicatedStorage.Assets;
local Ores_2 = Assets_5.Ores;
local GetChildren_9 = Ores_2.GetChildren;
local Children_11 = Ores_2:GetChildren();
for i_11, v_11 in ipairs(Children_11) do
    local IsA_10 = v_11.IsA;
    local Model_8 = v_11:IsA("Model");
    if not Model_8 then return end -- won't run
    local Name_19 = v_11.Name;
    local Name_19_isnt_string = (Name_19 ~= "");
    -- true, eq id 5
    local Name_20 = v_11.Name;
    local var54 = (Name_19_isnt_string and true); -- true
    local var55 = (v_11 and var54); -- true
    if not var55 then return end -- won't run
    local Name_21 = v_11.Name;
    local Name_22 = v_11.Name;
end
local CreateDropdown_9 = Webhook.CreateDropdown;
local Dropdown_9 = Webhook:CreateDropdown({
    Name = "Select Ores to Notify",
    CurrentOption = {},
    Flag = "WebhookOreDropdown",
    MultipleOptions = true,
    Callback = function(p1_0)

    end,
    Options = {
        Name_22,
    },
});
local CreateToggle_14 = Webhook.CreateToggle;
local Toggle_14 = Webhook:CreateToggle({
    CurrentValue = false,
    Callback = function(p1_0)

    end,
    Name = "Enable Webhook",
    Flag = "WebhookToggle",
});
local HttpService = game:GetService("HttpService");
local Spawned_6 = task.spawn(function()
    local Waited_For_165 = task.wait();

end);
local HttpService_2 = game:GetService("HttpService");
local Name_23 = LocalPlayer.Name;
local var58 = Name_23 .. "_TheForge.json";
-- "TkYAQlZVCCZViKw_TheForge.json"
local Joined_var58 = "/" .. var58;
-- "/TkYAQlZVCCZViKw_TheForge.json"
local var59 = "LazyHub" .. Joined_var58;
-- "LazyHub/TkYAQlZVCCZViKw_TheForge.json"
local var60 = isfolder("LazyHub");
local var61 = makefolder("LazyHub");
local CreateSection_11 = Settings.CreateSection;
local Config = Settings:CreateSection("Config");
local CreateButton_4 = Settings.CreateButton;
local Button_4 = Settings:CreateButton({
    Name = "Save Settings",
    Callback = function()
        local Spawned_23 = task.spawn(function()
            local JSONEncode = HttpService:JSONEncode({
                    autotp_World1 = p1_0,
                    tweenspeed = var81,
                    ores_selected = p1_0,
                    autopour = false,
                    farmmethod = var83,
                    selected_region = var86,
                    insta_tp_if = p1_0,
                    insta_tp_cd = p1_0,
                    auto_sell = p1_0,
                    insta_tp = p1_0,
                    webhook_url = p1_0,
                    items_selected = p1_0,
                    potions_selected = p1_0,
                    mobs_selected = p1_0,
                    skipOre_cd = p1_0,
                    automelt = false,
                    webhook_user_id = p1_0,
                    webhook_ores_selected = p1_0,
                    webhook_enabled = p1_0,
                    ore_priority = {
                        [D_3] = p1_0,
                    },
                    mob_closestfarm = p1_0,
                    autotp_World2 = p1_0,
                    automold = false,
                    autohammer = false,
                    underground_tween = p1_0,
                    ore_autofarm = p1_0,
                    meltspeed = 15,
                    distance = p1_0,
                    maxposition = 0.9,
                    ore_closestfarm = p1_0,
                    minposition = 0.05,
                    poursens = 0.01,
                    auto_potion = p1_0,
                    sell_anywhere = p1_0,
                    walkspeed = var1340,
                    auto_parry = p1_0,
                    mob_autofarm = p1_0,
                    regional_ore_farm = p1_0,
                });
            local Success_15, Error_Message_15 = pcall(function(...)
                local var1341 = writefile(var59, JSONEncode);
                -- C:\Users\Administrator\Downloads\YetAnotherBot\unveilr\main:5020: invalid argument #1 to 'split' (string expected, got table)
            end) -- false, "[LkWmrr]:1: [LkWmrr]:1: invalid argument #1 to 'split' (string expected, got table)"

        end);

    end,
});
local CreateButton_5 = Settings.CreateButton;
local Button_5 = Settings:CreateButton({
    Name = "Load Settings",
    Callback = function()
        local Spawned_24 = task.spawn(function()
            local var1342 = isfile(var59);
            local Notify_9 = Loaded_Var4.Notify;
            local Notify_10 = Loaded_Var4:Notify({
                Image = "rewind",
                Duration = 3,
                Title = "Lazy Hub",
                Content = "No settings file found, using defaults!",
            });

        end);

    end,
});
local CreateSection_12 = Settings.CreateSection;
local Export_Import = Settings:CreateSection("Export / Import");
local CreateButton_6 = Settings.CreateButton;
local Button_6 = Settings:CreateButton({
    Name = "Copy Settings to Clipboard",
    Callback = function()
        local Spawned_25 = task.spawn(function()
            local JSONEncode_2 = HttpService:JSONEncode({
                    autotp_World1 = p1_0,
                    tweenspeed = var81,
                    ores_selected = p1_0,
                    autopour = false,
                    farmmethod = var83,
                    selected_region = var86,
                    insta_tp_if = p1_0,
                    insta_tp_cd = p1_0,
                    auto_sell = p1_0,
                    insta_tp = p1_0,
                    webhook_url = p1_0,
                    items_selected = p1_0,
                    potions_selected = p1_0,
                    mobs_selected = p1_0,
                    skipOre_cd = p1_0,
                    automelt = false,
                    webhook_user_id = p1_0,
                    webhook_ores_selected = p1_0,
                    webhook_enabled = p1_0,
                    ore_priority = {
                        [D_3] = p1_0,
                    },
                    mob_closestfarm = p1_0,
                    autotp_World2 = p1_0,
                    automold = false,
                    autohammer = false,
                    underground_tween = p1_0,
                    ore_autofarm = p1_0,
                    meltspeed = 15,
                    distance = p1_0,
                    maxposition = 0.9,
                    ore_closestfarm = p1_0,
                    minposition = 0.05,
                    poursens = 0.01,
                    auto_potion = p1_0,
                    sell_anywhere = p1_0,
                    walkspeed = var1340,
                    auto_parry = p1_0,
                    mob_autofarm = p1_0,
                    regional_ore_farm = p1_0,
                });
            local Notify_11 = Loaded_Var4.Notify;
            local Notify_12 = Loaded_Var4:Notify({
                Image = "rewind",
                Duration = 3,
                Title = "Lazy Hub",
                Content = "Settings Copied to Clipboard!",
            });
            local Not_JSONEncode_2 = not JSONEncode_2;
            -- false
            local setclipboard = setclipboard;
            if not setclipboard then return end -- won't run
            local _call1345 = setclipboard(JSONEncode_2);

        end);

    end,
});
local CreateInput_3 = Settings.CreateInput;
local Input_3 = Settings:CreateInput({
    Name = "Paste JSON to Import",
    Flag = "ImportJSONInput",
    CurrentValue = "",
    PlaceholderText = "Paste settings JSON here",
    Callback = function(p1_0)
        local Spawned_26 = task.spawn(function()
            local JSONDecode = HttpService:JSONDecode(p1_0);
            local var1346 = typeof(JSONDecode);
            local var1346_isnt_string = (var1346 ~= "table");
            -- false, eq id 229
            for i_72, v_72 in pairs(JSONDecode) do
            end
            local Notify_13 = Loaded_Var4.Notify;
            local Notify_14 = Loaded_Var4:Notify({
                Image = "rewind",
                Duration = 3,
                Title = "Lazy Hub",
                Content = "Settings Imported!",
            });
            local var1347 = (Slider and p1_0); -- p1_0
            if not var1347 then return end -- won't run
            local Set_11 = Slider.Set;
            local Set_12 = Slider:Set(p1_0);
            local var1349 = (Slider_2 and var81); -- var81
            if not var1349 then return end -- won't run
            local Set_13 = Slider_2.Set;
            local Set_14 = Slider_2:Set(var81);
            local var1351 = (Slider_3 and p1_0); -- p1_0
            if not var1351 then return end -- won't run
            local Set_15 = Slider_3.Set;
            local Set_16 = Slider_3:Set(p1_0);
            local var1353 = (Slider_4 and p1_0); -- p1_0
            if not var1353 then return end -- won't run
            local Set_17 = Slider_4.Set;
            local Set_18 = Slider_4:Set(p1_0);
            local var1355 = (Slider_5 and p1_0); -- p1_0
            if not var1355 then return end -- won't run
            local Set_19 = Slider_5.Set;
            local Set_20 = Slider_5:Set(p1_0);
            local var1357 = (Slider_7 and var1340); -- var1340
            if not var1357 then return end -- won't run
            local Set_21 = Slider_7.Set;
            local Set_22 = Slider_7:Set(var1340);
            local P1_0_Exists = (p1_0 ~= nil);
            -- true, eq id 230
            local var1359 = (Toggle_2 and P1_0_Exists); -- true
            if not var1359 then return end -- won't run
            local Set_23 = Toggle_2.Set;
            local Set_24 = Toggle_2:Set(p1_0);
            local P1_0_Exists_2 = (p1_0 ~= nil);
            -- true, eq id 231
            local var1361 = (Toggle and P1_0_Exists_2); -- true
            if not var1361 then return end -- won't run
            local Set_25 = Toggle.Set;
            local Set_26 = Toggle:Set(p1_0);
            local P1_0_Exists_3 = (p1_0 ~= nil);
            -- true, eq id 232
            local var1363 = (Toggle_3 and P1_0_Exists_3); -- true
            if not var1363 then return end -- won't run
            local Set_27 = Toggle_3.Set;
            local Set_28 = Toggle_3:Set(p1_0);
            local P1_0_Exists_4 = (p1_0 ~= nil);
            -- true, eq id 233
            local var1365 = (Toggle_4 and P1_0_Exists_4); -- true
            if not var1365 then return end -- won't run
            local Set_29 = Toggle_4.Set;
            local Set_30 = Toggle_4:Set(p1_0);
            local P1_0_Exists_5 = (p1_0 ~= nil);
            -- true, eq id 234
            local var1367 = (Toggle_5 and P1_0_Exists_5); -- true
            if not var1367 then return end -- won't run
            local Set_31 = Toggle_5.Set;
            local Set_32 = Toggle_5:Set(p1_0);
            local P1_0_Exists_6 = (p1_0 ~= nil);
            -- true, eq id 235
            local var1369 = (Toggle_6 and P1_0_Exists_6); -- true
            if not var1369 then return end -- won't run
            local Set_33 = Toggle_6.Set;
            local Set_34 = Toggle_6:Set(p1_0);
            local P1_0_Exists_7 = (p1_0 ~= nil);
            -- true, eq id 236
            local var1371 = (Toggle_7 and P1_0_Exists_7); -- true
            if not var1371 then return end -- won't run
            local Set_35 = Toggle_7.Set;
            local Set_36 = Toggle_7:Set(p1_0);
            local var86_isnt_string = (var86 ~= "");
            -- true, eq id 237
            local var1373 = (var86 and var86_isnt_string); -- true
            local var1374 = (Dropdown_4 and var1373); -- true
            if not var1374 then return end -- won't run
            local Set_37 = Dropdown_4.Set;
            local Set_38 = Dropdown_4:Set(var86);
            local P1_0_Exists_8 = (p1_0 ~= nil);
            -- true, eq id 238
            local var1376 = (Toggle_10 and P1_0_Exists_8); -- true
            if not var1376 then return end -- won't run
            local Set_39 = Toggle_10.Set;
            local Set_40 = Toggle_10:Set(p1_0);
            local P1_0_Exists_9 = (p1_0 ~= nil);
            -- true, eq id 239
            local var1378 = (Toggle_11 and P1_0_Exists_9); -- true
            if not var1378 then return end -- won't run
            local Set_41 = Toggle_11.Set;
            local Set_42 = Toggle_11:Set(p1_0);
            local P1_0_Exists_10 = (p1_0 ~= nil);
            -- true, eq id 240
            local var1380 = (Toggle_12 and P1_0_Exists_10); -- true
            if not var1380 then return end -- won't run
            local Set_43 = Toggle_12.Set;
            local Set_44 = Toggle_12:Set(p1_0);
            local P1_0_Exists_11 = (p1_0 ~= nil);
            -- true, eq id 241
            local var1382 = (Toggle_13 and P1_0_Exists_11); -- true
            if not var1382 then return end -- won't run
            local Set_45 = Toggle_13.Set;
            local Set_46 = Toggle_13:Set(p1_0);
            local Len_P1_0_45 = #p1_0;
            local var1384 = (Len_P1_0_45 > 0); -- nil
            local var1385 = (p1_0 and var1384); -- nil
            local var1386 = (Dropdown_2 and var1385); -- nil
            local Len_P1_0_46 = #p1_0;
            local var1387 = (Len_P1_0_46 > 0); -- nil
            local var1388 = (p1_0 and var1387); -- nil
            local var1389 = (Dropdown_3 and var1388); -- nil
            local Len_P1_0_47 = #p1_0;
            local var1390 = (Len_P1_0_47 > 0); -- nil
            local var1391 = (p1_0 and var1390); -- nil
            local var1392 = (Dropdown_5 and var1391); -- nil
            local var1393 = typeof(p1_0);
            local var1393_is_string = (var1393 == "table");
            -- true, eq id 242
            local Len_P1_0_48 = #p1_0;
            local var1394 = (Len_P1_0_48 > 0); -- nil
            local var1395 = (var1393_is_string and var1394); -- nil
            local var1396 = (p1_0 and var1395); -- nil
            local var1397 = (Dropdown_6 and var1396); -- nil
            local P1_0_Exists_12 = (p1_0 ~= nil);
            -- true, eq id 243
            local var1398 = (Toggle_8 and P1_0_Exists_12); -- true
            if not var1398 then return end -- won't run
            local Set_47 = Toggle_8.Set;
            local Set_48 = Toggle_8:Set(p1_0);
            local P1_0_Exists_13 = (p1_0 ~= nil);
            -- true, eq id 244
            local var1400 = (Toggle_9 and P1_0_Exists_13); -- true
            if not var1400 then return end -- won't run
            local Set_49 = Toggle_9.Set;
            local Set_50 = Toggle_9:Set(p1_0);
            local var1402 = (p1_0 or 0);
            local Set_51 = Slider_6.Set;
            local Set_52 = Slider_6:Set(p1_0);
            local var1404 = (Input and p1_0); -- p1_0
            if not var1404 then return end -- won't run
            local Set_53 = Input.Set;
            local Set_54 = Input:Set(p1_0);
            local var1406 = (Input_2 and p1_0); -- p1_0
            if not var1406 then return end -- won't run
            local Set_55 = Input_2.Set;
            local Set_56 = Input_2:Set(p1_0);
            local P1_0_Exists_14 = (p1_0 ~= nil);
            -- true, eq id 245
            local var1408 = (Toggle_14 and P1_0_Exists_14); -- true
            if not var1408 then return end -- won't run
            local Set_57 = Toggle_14.Set;
            local Set_58 = Toggle_14:Set(p1_0);
            local Len_P1_0_49 = #p1_0;
            local var1410 = (Len_P1_0_49 > 0); -- nil
            local var1411 = (p1_0 and var1410); -- nil
            local var1412 = (Dropdown_9 and var1411); -- nil

        end);

    end,
    RemoveTextAfterFocusLost = true,
});
local CreateSection_13 = Settings.CreateSection;
local Discord = Settings:CreateSection("Discord");
local CreateButton_7 = Settings.CreateButton;
local Button_7 = Settings:CreateButton({
    Name = "Copy Discord Link",
    Callback = function()
        local Spawned_27 = task.spawn(function()
            if not setclipboard then return end -- won't run
            local _call1413 = setclipboard("https://discord.gg/a4ZgCVkk9V");

        end);

    end,
});
local var67 = isfile(var59);
local Notify_3 = Loaded_Var4.Notify;
local Notify_4 = Loaded_Var4:Notify({
    Image = "rewind",
    Duration = 3,
    Title = "Lazy Hub",
    Content = "First run, no settings file yet!",
});
local Spawned_7 = task.spawn(function()
    local Players_2 = game.Players;
    local Connection;
    Connection = Players.PlayerRemoving:Connect(function(Player) -- args: Player_2;
        local var1414 = (Player == LocalPlayer);
        -- false, eq id 246

    end);

end);
local Spawned_8 = task.spawn(function()
    local GetChildren_13 = Living.GetChildren;
    local Children_16 = Living:GetChildren();
    for i_17, v_17 in ipairs(Children_16) do
        local IsA_15 = v_17.IsA;
        local Model_12 = v_17:IsA("Model");
        local GetAttribute = v_17.GetAttribute;
        local IsNpc = v_17:GetAttribute("IsNpc");
        local var141 = (Model_12 and IsNpc); -- IsNpc
        if not var141 then return end -- won't run
        local _ = safe_connect_parry
        local Spawned_28 = task.spawn(function()
            local WaitForChild_87 = v_17.WaitForChild;
            local HumanoidRootPart_152 = v_17:WaitForChild("HumanoidRootPart", 5);
            local Not_HumanoidRootPart_152 = not HumanoidRootPart_152;
            -- false
            local WaitForChild_88 = HumanoidRootPart_152.WaitForChild;
            local InfoFrame_2 = HumanoidRootPart_152:WaitForChild("infoFrame", 5);
            local Not_InfoFrame_2 = not InfoFrame_2;
            -- false
            local WaitForChild_89 = InfoFrame_2.WaitForChild;
            local Frame_35 = InfoFrame_2:WaitForChild("Frame", 5);
            local Not_Frame_35 = not Frame_35;
            -- false
            local WaitForChild_90 = Frame_35.WaitForChild;
            local RockName_2 = Frame_35:WaitForChild("rockName", 5);
            local Not_RockName_2 = not RockName_2;
            -- false
            local IsA_25 = RockName_2.IsA;
            local TextLabel_2 = RockName_2:IsA("TextLabel");
            local Not_TextLabel_2 = not TextLabel_2;
            -- false
            local var1415 = (Not_RockName_2 or Not_TextLabel_2); -- false
            local Text_27 = RockName_2.Text;
            local var1416 = string.find(Text_27, "Slime")
            if not var1416 then return end -- won't run
            local WaitForChild_91 = v_17.WaitForChild;
            local Status_2 = v_17:WaitForChild("Status", 5);
            local Not_Status_2 = not Status_2;
            -- false
            local ChildAdded_5 = Status_2.ChildAdded;
            local Connect_5 = ChildAdded_5.Connect;
            local Connected_5 = ChildAdded_5:Connect(function(p1_0)
                local IsA_29 = p1_0.IsA;
                local BoolValue_2 = p1_0:IsA("BoolValue");
                local Name_56 = p1_0.Name;
                local Name_56_is_string = (Name_56 == "Attacking");
                -- false, eq id 250
                local var1422 = (BoolValue_2 and Name_56_is_string); -- false

            end);

        end);
    end

end);
local Spawned_9 = task.spawn(function()
    local ChildAdded_2 = Living.ChildAdded;
    local Connect_2 = ChildAdded_2.Connect;
    local Connected_2 = ChildAdded_2:Connect(function(p1_0)
        local IsA_26 = p1_0.IsA;
        local Model_25 = p1_0:IsA("Model");
        local GetAttribute_47 = p1_0.GetAttribute;
        local IsNpc_2 = p1_0:GetAttribute("IsNpc");
        local var1418 = (Model_25 and IsNpc_2); -- IsNpc_2
        if not var1418 then return end -- won't run
        local Spawned_29 = task.spawn(function()
            local WaitForChild_92 = p1_0.WaitForChild;
            local HumanoidRootPart_153 = p1_0:WaitForChild("HumanoidRootPart", 5);
            local Not_HumanoidRootPart_153 = not HumanoidRootPart_153;
            -- false
            local WaitForChild_93 = HumanoidRootPart_153.WaitForChild;
            local InfoFrame_3 = HumanoidRootPart_153:WaitForChild("infoFrame", 5);
            local Not_InfoFrame_3 = not InfoFrame_3;
            -- false
            local WaitForChild_94 = InfoFrame_3.WaitForChild;
            local Frame_37 = InfoFrame_3:WaitForChild("Frame", 5);
            local Not_Frame_37 = not Frame_37;
            -- false
            local WaitForChild_95 = Frame_37.WaitForChild;
            local RockName_3 = Frame_37:WaitForChild("rockName", 5);
            local Not_RockName_3 = not RockName_3;
            -- false
            local IsA_30 = RockName_3.IsA;
            local TextLabel_4 = RockName_3:IsA("TextLabel");
            local Not_TextLabel_4 = not TextLabel_4;
            -- false
            local var1423 = (Not_RockName_3 or Not_TextLabel_4); -- false
            local Text_29 = RockName_3.Text;
            local var1424 = string.find(Text_29, "Slime")
            if not var1424 then return end -- won't run
            local WaitForChild_96 = p1_0.WaitForChild;
            local Status_3 = p1_0:WaitForChild("Status", 5);
            local Not_Status_3 = not Status_3;
            -- false
            local ChildAdded_6 = Status_3.ChildAdded;
            local Connect_6 = ChildAdded_6.Connect;
            local Connected_6 = ChildAdded_6:Connect(function(p1_0)
                local IsA_31 = p1_0.IsA;
                local BoolValue_3 = p1_0:IsA("BoolValue");
                local Name_57 = p1_0.Name;
                local Name_57_is_string = (Name_57 == "Attacking");
                -- false, eq id 251
                local var1426 = (BoolValue_3 and Name_57_is_string); -- false

            end);

        end);

    end);

end);
local Spawned_10 = task.spawn(function()
    local Players_3 = game.Players;
    local LocalPlayer_2 = Players.LocalPlayer;
    local PlayerGui_5 = LocalPlayer.PlayerGui;
    local Notifications = PlayerGui_2.Notifications;
    local Screen = Notifications.Screen;
    local NotificationsFrame = Screen.NotificationsFrame;
    local ChildAdded_3 = NotificationsFrame.ChildAdded;
    local Connect_3 = ChildAdded_3.Connect;
    local Connected_3 = ChildAdded_3:Connect(function(p1_0)
        local IsA_27 = p1_0.IsA;
        local Frame_36 = p1_0:IsA("Frame");
        local FindFirstChild_71 = p1_0.FindFirstChild;
        local TextFrame = p1_0:FindFirstChild("TextFrame");
        local var1419 = (Frame_36 and TextFrame); -- TextFrame
        local Not_Var1419 = not var1419;
        -- false
        local TextFrame_2 = p1_0.TextFrame;
        local FindFirstChild_72 = TextFrame_2.FindFirstChild;
        local TextLabel_3 = TextFrame_2:FindFirstChild("TextLabel");
        local Not_TextLabel_3 = not TextLabel_3;
        -- false
        local Text_28 = TextLabel_3.Text;
        local Match_13 = Text_28.match;
        local Someone_35 = Text_28:match("Someone");
        if not Someone_35 then return end -- won't run
        -- local _ = p1_0 or (unknown_value)
        -- local _ = p1_0 or (unknown_value)
        local Not_P1_0_186 = not p1_0;
        -- false
        local Getgenv_LastOre = getgenv().lastOre;
        local Getgenv_LastOreTime = getgenv().lastOreTime;
        local var1420 = tick();
        TextLabel_3.Text = "Lazy Hub: Switching ores.";

    end);

end);
local Spawned_11 = task.spawn(function()
    local Enum_DevCameraOcclusionMode = Enum.DevCameraOcclusionMode;
    local Invisicam = Enum_DevCameraOcclusionMode.Invisicam;
    LocalPlayer.DevCameraOcclusionMode = Invisicam;
    local BindableFunction = Instance.new("BindableFunction");
    BindableFunction.OnInvoke = function(p1_0)
        local p1_0_is_string = (p1_0 == "Copy");
        -- false, eq id 247

    end;
    local StarterGui = game:GetService("StarterGui");
    local SendNotification = StarterGui:SetCore("SendNotification", {
        Title = "Lazy Hub",
        Button1 = "Copy",
        Text = "Join our discord server for more updates!\ndiscord.gg/a4ZgCVkk9V",
        Callback = BindableFunction,
        Duration = 10,
    });

end);
local Spawned_12 = task.spawn(function()
    local Notify_7 = Loaded_Var4.Notify;
    local Notify_8 = Loaded_Var4:Notify({
        Image = "rewind",
        Duration = 3,
        Title = "Lazy Hub",
        Content = "hookmetamethod is Enabled!",
    });
    local var146;
    var146 = hookmetamethod(game, "__newindex", function(p1_0, p2_0, p3_0)
        local var1420 = tostring(p1_0);
        local var1420_is_string = (var1420 == "Humanoid");
        -- false, eq id 248
        local  = var146(p1_0, p2_0, p3_0)

    end)

end);
local Success_4, Error_Message_4 = pcall(function(...)
    local LoadConfiguration = Loaded_Var4.LoadConfiguration;
    local LoadConfiguration_2 = Loaded_Var4:LoadConfiguration();
end) -- true
local PlaceId = game.PlaceId;
local JobId = game.JobId;
local CoreGui = game:GetService("CoreGui");
local RobloxPromptGui = CoreGui.RobloxPromptGui;
local PromptOverlay = RobloxPromptGui.promptOverlay;
local ChildAdded = PromptOverlay.ChildAdded;
local Connect = ChildAdded.Connect;
local Connected = ChildAdded:Connect(function(p1_0)
    local Name_30 = p1_0.Name;
    local Name_30_is_string = (Name_30 == "ErrorPrompt");
    -- false, eq id 16
    -- local _ = Name_30_is_string and (unknown_value)

end);
queueonteleport("        repeat wait() until game:IsLoaded()\n        loadstring(game:HttpGet(\"https://raw.githubusercontent.com/LioK251/RbScripts/refs/heads/main/lazyuhub_theforge.lua\"))()\n        ")