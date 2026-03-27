local var1 = game:HttpGet("https://raw.githubusercontent.com/Nisulrocks/The-Forge/refs/heads/main/main");
local var2 = loadstring(var1);
local Loaded_Var1 = var2();
local var3 = game:HttpGet("https://raw.githubusercontent.com/nitulgamez-lab/The-Forge/refs/heads/main/main");
local var4 = loadstring(var3);
local Loaded_Var3 = var4();
local var5 = game:HttpGet("https://raw.githubusercontent.com/Nisulrocks/Key-system/refs/heads/main/Main");
local var6 = loadstring(var5);
-- this function was spied, no real content was loaded.
local _call7 = var6();
local Config = _call7.Config;
Config.ScriptName = "NisulRocks The Forge Auto Farm";
local Config_2 = _call7.Config;
Config_2.Version = "V1.0";
local Config_3 = _call7.Config;
Config_3.StorageId = "NisulRocks_TheForge_AutoFarm";
local Config_4 = _call7.Config;
Config_4.CorrectKey = "NisulrocksTheForge123";
local Config_5 = _call7.Config;
Config_5.DiscordLink = "https://discord.gg/jUctfTAa5D";
local Validate = _call7.Validate;
local _call3 = Validate();
local AndThen = _call3.andThen;
local AndThen_2 = _call3:andThen(function()
    local Players = game:GetService("Players");
    local ReplicatedStorage = game:GetService("ReplicatedStorage");
    local TweenService = game:GetService("TweenService");
    local RunService = game:GetService("RunService");
    local HttpService = game:GetService("HttpService");
    local UserInputService = game:GetService("UserInputService");
    local LocalPlayer = Players.LocalPlayer;
    -- local _ = LocalPlayer or (unknown_value)
    local Shared = ReplicatedStorage:WaitForChild("Shared");
    local WaitForChild = Shared.WaitForChild;
    local Packages = Shared:WaitForChild("Packages");
    local Knit = Packages.Knit;
    local Knit_Module = require(Knit);
    local WaitForChild_2 = Shared.WaitForChild;
    local Utils = Shared:WaitForChild("Utils");
    local Utils_Module = require(Utils);
    local WaitForChild_3 = Shared.WaitForChild;
    local Data = Shared:WaitForChild("Data");
    local WaitForChild_4 = Data.WaitForChild;
    local Ore = Data:WaitForChild("Ore");
    local Ore_Module = require(Ore);
    local var5 = game:HttpGet("https://sirius.menu/rayfield");
    local var6 = loadstring(var5);
    -- this function was spied, no real content was loaded.
    local _call7 = var6();
    local CreateWindow = _call7.CreateWindow;
    local Window = _call7:CreateWindow({
        LoadingTitle = "The Forge Automation V1.0",
        Name = "The Forge Auto Farm V1.0",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "TheForgeNisulrocks",
            FileName = "TheForgeConfig_V2",
        },
        Discord = {
            Enabled = true,
            RememberJoins = true,
            Invite = "wN85KUq6nD",
        },
        LoadingSubtitle = "By Nisulrocks",
        ToggleUIKeybind = "K",
        ShowText = "The Forge",
    });
    local CreateTab = Window.CreateTab;
    local Main_Farm = Window:CreateTab("Main Farm", 4483362458);
    local CreateSection = Main_Farm.CreateSection;
    local Movement_Settings = Main_Farm:CreateSection("Movement Settings");
    local CreateSlider = Main_Farm.CreateSlider;
    local Slider = Main_Farm:CreateSlider({
        Name = "Scan Distance",
        Callback = function(p1_0)

        end,
        CurrentValue = 300,
        Increment = 100,
        Range = {
            100,
            500,
        },
        Flag = "Forge_ScanDistance",
    });
    local CreateSlider_2 = Main_Farm.CreateSlider;
    local Slider_2 = Main_Farm:CreateSlider({
        Name = "Tween Speed",
        Callback = function(p1_0)

        end,
        CurrentValue = 40,
        Increment = 10,
        Range = {
            30,
            100,
        },
        Flag = "Forge_TweenSpeed",
    });
    local CreateSection_2 = Main_Farm.CreateSection;
    local Auto_Farm_Ores = Main_Farm:CreateSection("Auto Farm Ores");
    local Assets = ReplicatedStorage:FindFirstChild("Assets");
    local Rocks = Assets:FindFirstChild("Rocks");
    local var11 = (Assets and Rocks); -- Rocks
    if not var11 then return end -- won't run
    local Children = Rocks:GetChildren();
    for i, v in ipairs(Children) do
        local Name = v.Name;
        local Name_2 = v.Name;
        local Name_2_isnt_string = (Name_2 ~= "");
        -- true, eq id 1
        local var11 = (Name and Name_2_isnt_string); -- true
        if not var11 then return end -- won't run
        local Name_3 = v.Name;
        local Array = {};
        local var12 = table.insert(Array, Name_3);
    end
    local Len_Array = #Array;
    -- 0
    local Len_Array_is_number = (Len_Array == 0);
    -- true, eq id 2
    if not Len_Array_is_number then return end -- won't run
    warn("[Forge] No rock templates found in ReplicatedStorage.Assets.Rocks")
    local Assets_2 = ReplicatedStorage:FindFirstChild("Assets");
    local Ores = Assets:FindFirstChild("Ores");
    local var13 = (Assets_2 and Ores); -- nil
    local Len_Array_2 = #Array;
    -- 0
    local var14 = (Len_Array_2 == 0);
    -- true, eq id 3
    if not var14 then return end -- won't run
    local CreateDropdown = Main_Farm.CreateDropdown;
    local Dropdown = Main_Farm:CreateDropdown({
        Name = "Rock Types to Farm",
        MultipleOptions = true,
        Flag = "Forge_RockTypes",
        CurrentOption = {
            "Boulder",
        },
        Callback = function(p1_0)
            local var54 = typeof(p1_0);
            local var54_is_string = (var54 == "table");
            -- true, eq id 6
            local Len_P1_0 = #p1_0;
            local var55 = (Len_P1_0 > 0); -- nil
            local var56 = (var54_is_string and var55); -- nil

        end,
        Options = Array,
    });
    local CreateButton = Main_Farm.CreateButton;
    local Button = Main_Farm:CreateButton({
        Name = "Refresh Rock Types",
        Callback = function()
            local Assets_5 = ReplicatedStorage:FindFirstChild("Assets");
            local Rocks_2 = Assets:FindFirstChild("Rocks");
            local var57 = (Assets_5 and Rocks_2); -- Rocks
            if not var57 then return end -- won't run
            local Children_2 = Rocks:GetChildren();
            for i_3, v_3 in ipairs(Children_2) do
                local Name_4 = v_3.Name;
                local Name_5 = v_3.Name;
                local Name_5_isnt_string = (Name_5 ~= "");
                -- true, eq id 7
                local var57 = (Name_4 and Name_5_isnt_string); -- true
                if not var57 then return end -- won't run
                local Name_6 = v_3.Name;
                local Array_3 = {};
                local var58 = table.insert(Array_3, Name_6);
            end
            local Len_Array_3 = #Array_3;
            -- 0
            local var59 = (Len_Array_3 == 0);
            -- true, eq id 8
            if not var59 then return end -- won't run
            warn("[Forge] No rock templates found in ReplicatedStorage.Assets.Rocks")
            local Len_Array_3_2 = #Array_3;
            -- 0
            local var60 = (Len_Array_3_2 == 0);
            -- true, eq id 9
            if not var60 then return end -- won't run
            if not Dropdown then return end -- won't run
            local Set = Dropdown.Set;
            local Set_2 = Dropdown:Set({
                Options = {
                    "Boulder",
                },
                CurrentOption = {
                    "Boulder",
                },
            });

        end,
    });
    local CreateDropdown_2 = Main_Farm.CreateDropdown;
    local Dropdown_2 = Main_Farm:CreateDropdown({
        Name = "Ore Types to Farm",
        MultipleOptions = true,
        Flag = "Forge_OreTypes",
        CurrentOption = {
            "Any",
        },
        Callback = function(p1_0)
            local var62 = typeof(p1_0);
            local var62_is_string = (var62 == "table");
            -- true, eq id 10
            local Len_P1_0_2 = #p1_0;
            local var63 = (Len_P1_0_2 > 0); -- nil
            local var64 = (var62_is_string and var63); -- nil

        end,
        Options = {
            "Any",
        },
    });
    local CreateSlider_3 = Main_Farm.CreateSlider;
    local Slider_3 = Main_Farm:CreateSlider({
        Name = "Max Time Per Rock (s)",
        Callback = function(p1_0)

        end,
        CurrentValue = 4,
        Increment = 1,
        Range = {
            1,
            20,
        },
        Flag = "Forge_MaxRockTime",
    });
    local CreateSlider_4 = Main_Farm.CreateSlider;
    local Slider_4 = Main_Farm:CreateSlider({
        Name = "Mine Interval (s)",
        Callback = function(p1_0)

        end,
        CurrentValue = 0.1,
        Increment = 0.02,
        Range = {
            0.02,
            0.5,
        },
        Flag = "Forge_MineInterval",
    });
    local CreateToggle = Main_Farm.CreateToggle;
    local Toggle = Main_Farm:CreateToggle({
        CurrentValue = false,
        Callback = function(p1_0)
            local var65 = (p1_0 and true); -- true
            local var66 = (var65 or false);
            local Character = LocalPlayer.Character;
            -- local _ = Character or (unknown_value)
            local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
            local Position = HumanoidRootPart.Position;
            local var67 = (HumanoidRootPart and Position); -- Position
            local var68 = tonumber(p1_0, nil);
            -- no value
            local var69 = (var68 or 500);
            local Rocks_3 = workspace:FindFirstChild("Rocks");
            local Not_Rocks_3 = not Rocks_3;
            -- false
            local var70 = var68 * var68;
            local var71 = (var68 and var70); -- var70
            local Children_3 = Rocks_3:GetChildren();
            for i_4, v_4 in ipairs(Children_3) do
                local GetChildren = v_4.GetChildren;
                local Children_4 = v_4:GetChildren();
                for i_5, v_5 in ipairs(Children_4) do
                    local Not_V_5 = not v_5;
                    -- false
                    local Parent = v_5.Parent;
                    local Not_Parent = not Parent;
                    -- false
                    local var71 = (Not_V_5 or Not_Parent); -- false
                    local IsA = v_5.IsA;
                    local BasePart = v_5:IsA("BasePart");
                    local var72 = (BasePart and v_5); -- v_5
                    -- local _ = var72 or (unknown_value)
                    -- local _ = v_5 or (unknown_value)
                    -- local _ = v_5 or (unknown_value)
                    local Not_V_5_2 = not v_5;
                    -- false
                    -- local _ = var71 and (unknown_value)
                    local Not_V_5_3 = not v_5;
                    -- false
                    local Parent_2 = v_5.Parent;
                    local Not_Parent_2 = not Parent_2;
                    -- false
                    local var73 = (Not_V_5_3 or Not_Parent_2); -- false
                    local Not_V_5_4 = not v_5;
                    -- false
                    local GetAttribute = v_5.GetAttribute;
                    local Health = v_5:GetAttribute("Health");
                    local Health_Is_Nil = (Health == nil);
                    -- false, eq id 11
                    local Health_Is_Nil_2 = (Health == nil);
                    -- false, eq id 12
                    local var74 = tonumber(Health, nil);
                    -- no value
                    local Var74_Exists = (var74 ~= nil);
                    -- false, eq id 13
                    local FindFirstChild = v_5.FindFirstChild;
                    local Boulder = v_5:FindFirstChild("Boulder");
                    local Not_Boulder = not Boulder;
                    -- false
                    local Not_Boulder_2 = not Boulder;
                    -- false
                    if not Boulder then return end -- won't run
                    local GetAttribute_2 = v_5.GetAttribute;
                    local RockType = v_5:GetAttribute("RockType");
                    -- local _ = RockType or (unknown_value)
                    -- local _ = RockType or (unknown_value)
                    -- local _ = RockType or (unknown_value)
                    local GetAttribute_3 = v_5.GetAttribute;
                    local RequiredDamage = v_5:GetAttribute("RequiredDamage");
                    local var75 = tonumber(RequiredDamage, nil);
                    -- no value
                    local Not_Var75 = not var75;
                    -- false
                end
            end
            if not var67 then return end -- won't run
            local Not_V_5_5 = not v_5;
            -- false
            local Parent_3 = v_5.Parent;
            local Not_Parent_3 = not Parent_3;
            -- false
            local var76 = (Not_V_5_5 or Not_Parent_3); -- false
            local IsA_2 = v_5.IsA;
            local BasePart_2 = v_5:IsA("BasePart");
            local var77 = (v_5 and BasePart_2); -- BasePart_2
            local Not_Var77 = not var77;
            -- false
            local Highlight = Instance.new("Highlight");
            local Color3_FromRGB = Color3.fromRGB;
            local Color3_Value = Color3_FromRGB(0, 255, 200);
            Highlight.FillColor = Color3_Value;
            local Color3_Value_2 = Color3_FromRGB(255, 255, 0);
            Highlight.OutlineColor = Color3_Value_2;
            Highlight.FillTransparency = 0.2;
            Highlight.OutlineTransparency = 0;
            local Enum_HighlightDepthMode = Enum.HighlightDepthMode;
            local AlwaysOnTop = Enum_HighlightDepthMode.AlwaysOnTop;
            Highlight.DepthMode = AlwaysOnTop;
            Highlight.Enabled = true;
            local Not_Boulder_3 = not Boulder;
            -- false
            local Parent_4 = Boulder.Parent;
            local Not_Parent_4 = not Parent_4;
            -- false
            local var79 = (Not_Boulder_3 or Not_Parent_4); -- false
            Highlight.Adornee = Boulder;
            Highlight.Parent = workspace;
            local Attachment = Instance.new("Attachment");
            Attachment.Parent = v_5;
            local Vector3_New = Vector3.new;
            local Vector3_Value = Vector3_New(0, 2, 0);
            Attachment.Position = Vector3_Value;
            local Attachment_2 = Instance.new("Attachment");
            Attachment_2.Parent = v_5;
            local Vector3_Value_2 = Vector3_New(0, 20, 0);
            Attachment_2.Position = Vector3_Value_2;
            local Beam = Instance.new("Beam");
            Beam.Attachment0 = Attachment;
            Beam.Attachment1 = Attachment_2;
            local ColorSequence_New = ColorSequence.new;
            local ColorSequenceKeypoint_New = ColorSequenceKeypoint.new;
            local Color3_Value_3 = Color3_FromRGB(0, 255, 200);
            local ColorSequenceKeypoint_Value = ColorSequenceKeypoint_New(0, Color3_Value_3);
            local Color3_Value_4 = Color3_FromRGB(100, 200, 255);
            local ColorSequenceKeypoint_Value_2 = ColorSequenceKeypoint_New(0.5, Color3_Value_4);
            local Color3_Value_5 = Color3_FromRGB(255, 100, 255);
            local ColorSequenceKeypoint_Value_3 = ColorSequenceKeypoint_New(1, Color3_Value_5);
            local ColorSequence_Value = ColorSequence_New({
                ColorSequenceKeypoint_Value,
                ColorSequenceKeypoint_Value_2,
                ColorSequenceKeypoint_Value_3,
            });
            Beam.Color = ColorSequence_Value;
            local NumberSequence_New = NumberSequence.new;
            local NumberSequenceKeypoint_New = NumberSequenceKeypoint.new;
            local NumberSequenceKeypoint_Value = NumberSequenceKeypoint_New(0, 0.3);
            local NumberSequenceKeypoint_Value_2 = NumberSequenceKeypoint_New(0.5, 0.1);
            local NumberSequenceKeypoint_Value_3 = NumberSequenceKeypoint_New(1, 0.8);
            local NumberSequence_Value = NumberSequence_New({
                NumberSequenceKeypoint_Value,
                NumberSequenceKeypoint_Value_2,
                NumberSequenceKeypoint_Value_3,
            });
            Beam.Transparency = NumberSequence_Value;
            Beam.Width0 = 0.5;
            Beam.Width1 = 2;
            Beam.FaceCamera = true;
            Beam.LightEmission = 1;
            Beam.LightInfluence = 0;
            Beam.Texture = "rbxasset://textures/particles/sparkles_main.dds";
            local Enum_TextureMode = Enum.TextureMode;
            local Wrap = Enum_TextureMode.Wrap;
            Beam.TextureMode = Wrap;
            Beam.TextureSpeed = 1;
            Beam.Parent = v_5;
            local BillboardGui = Instance.new("BillboardGui");
            local UDim2_New = UDim2.new;
            local UDim2_Value = UDim2_New(0, 150, 0, 50);
            BillboardGui.Size = UDim2_Value;
            BillboardGui.Adornee = v_5;
            BillboardGui.AlwaysOnTop = true;
            BillboardGui.MaxDistance = 1000;
            local Vector3_Value_3 = Vector3_New(0, 5, 0);
            BillboardGui.StudsOffset = Vector3_Value_3;
            BillboardGui.Parent = v_5;
            local Frame = Instance.new("Frame");
            local UDim2_Value_2 = UDim2_New(1, 0, 1, 0);
            Frame.Size = UDim2_Value_2;
            local Color3_Value_6 = Color3_FromRGB(20, 20, 30);
            Frame.BackgroundColor3 = Color3_Value_6;
            Frame.BackgroundTransparency = 0.3;
            Frame.BorderSizePixel = 0;
            Frame.Parent = BillboardGui;
            local UICorner = Instance.new("UICorner");
            local UDim_New = UDim.new;
            local UDim_Value = UDim_New(0, 8);
            UICorner.CornerRadius = UDim_Value;
            UICorner.Parent = Frame;
            local UIGradient = Instance.new("UIGradient");
            local Color3_Value_7 = Color3_FromRGB(50, 50, 80);
            local ColorSequenceKeypoint_Value_4 = ColorSequenceKeypoint_New(0, Color3_Value_7);
            local Color3_Value_8 = Color3_FromRGB(20, 20, 40);
            local ColorSequenceKeypoint_Value_5 = ColorSequenceKeypoint_New(1, Color3_Value_8);
            local ColorSequence_Value_2 = ColorSequence_New({
                ColorSequenceKeypoint_Value_4,
                ColorSequenceKeypoint_Value_5,
            });
            UIGradient.Color = ColorSequence_Value_2;
            UIGradient.Rotation = 90;
            UIGradient.Parent = Frame;
            local UIStroke = Instance.new("UIStroke");
            local Color3_Value_9 = Color3_FromRGB(0, 255, 200);
            UIStroke.Color = Color3_Value_9;
            UIStroke.Thickness = 2;
            UIStroke.Transparency = 0;
            UIStroke.Parent = Frame;
            local TextLabel = Instance.new("TextLabel");
            local UDim2_Value_3 = UDim2_New(1, -10, 0.6, 0);
            TextLabel.Size = UDim2_Value_3;
            local UDim2_Value_4 = UDim2_New(0, 5, 0.1, 0);
            TextLabel.Position = UDim2_Value_4;
            TextLabel.BackgroundTransparency = 1;
            local var81 = tostring(RockType);
            local var82 = "⛏️ " .. var81;
            -- "⛏️ RockType"
            TextLabel.Text = var82;
            local Color3_Value_10 = Color3_FromRGB(255, 255, 255);
            TextLabel.TextColor3 = Color3_Value_10;
            TextLabel.TextStrokeTransparency = 0.5;
            local Color3_Value_11 = Color3_FromRGB(0, 0, 0);
            TextLabel.TextStrokeColor3 = Color3_Value_11;
            TextLabel.TextScaled = true;
            local Enum_Font = Enum.Font;
            local GothamBold = Enum_Font.GothamBold;
            TextLabel.Font = GothamBold;
            TextLabel.Parent = Frame;
            local TextLabel_2 = Instance.new("TextLabel");
            local UDim2_Value_5 = UDim2_New(1, -10, 0.3, 0);
            TextLabel_2.Size = UDim2_Value_5;
            local UDim2_Value_6 = UDim2_New(0, 5, 0.65, 0);
            TextLabel_2.Position = UDim2_Value_6;
            TextLabel_2.BackgroundTransparency = 1;
            TextLabel_2.Text = "...";
            local Color3_Value_12 = Color3_FromRGB(100, 255, 200);
            TextLabel_2.TextColor3 = Color3_Value_12;
            TextLabel_2.TextStrokeTransparency = 0.5;
            TextLabel_2.TextScaled = true;
            local Gotham = Enum_Font.Gotham;
            TextLabel_2.Font = Gotham;
            TextLabel_2.Parent = Frame;
            if not HumanoidRootPart then return end -- won't run
            local var85 = (TextLabel_2 and v_5); -- v_5
            local Parent_5 = v_5.Parent;
            local var86 = (var85 and Parent_5); -- Parent_5
            if not var86 then return end -- won't run
            local Position_2 = v_5.Position;
            local Position_3 = HumanoidRootPart.Position;
            local var87 = Position_2 - Position_3;
            local Magnitude = var87.Magnitude;
            local var88 = string.format("%.0f studs", Magnitude);
            TextLabel_2.Text = var88;

        end,
        Name = "Rocks ESP",
        Flag = "Forge_RocksESP",
    });
    local CreateParagraph = Main_Farm.CreateParagraph;
    local Paragraph = Main_Farm:CreateParagraph({
        Title = "Pickaxe Info",
        Content = "Name: ?\nDamage: ?",
    });
    local CreateToggle_2 = Main_Farm.CreateToggle;
    local Toggle_2 = Main_Farm:CreateToggle({
        CurrentValue = false,
        Callback = function(p1_0)
            local var89 = (p1_0 and true); -- true
            local var90 = (var89 or false);
            local Spawned_3 = task.spawn(function()
                local var373 = tick();
                local var374 = var373 - 0;
                -- 1767090506.045792
                local var375 = (var374 > 30); -- true
                if not var375 then return end -- won't run
                local var376 = tick();
                local Character_27 = LocalPlayer.Character;
                -- local _ = Character_27 or (unknown_value)
                local Character_28 = LocalPlayer.Character;
                -- local _ = Character_28 or (unknown_value)
                local Humanoid_16 = Character_28:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_16 or (unknown_value)
                local Children_18 = Character_27:GetChildren();
                for i_19, v_19 in ipairs(Children_18) do
                    local IsA_20 = v_19.IsA;
                    local Tool_4 = v_19:IsA("Tool");
                    local var376 = (v_19 and Tool_4); -- Tool_4
                    local Not_Var376 = not var376;
                    -- false
                    local Assets_6 = ReplicatedStorage:FindFirstChild("Assets");
                    local Equipments = Assets:FindFirstChild("Equipments");
                    local var377 = (Assets_6 and Equipments); -- nil
                    -- local _ = var377 and (unknown_value)
                    local Name_13 = v_19.Name;
                    -- local _ = Name_13 or (unknown_value)
                    local var378 = string.lower(Name_13);
                    local GetAttribute_19 = v_19.GetAttribute;
                    local ItemName = v_19:GetAttribute("ItemName");
                    local var379 = tostring(ItemName);
                    local var380 = (ItemName and "itemname"); -- "itemname"
                    -- local _ = var380 or (unknown_value)
                    local Find = var378.find;
                    local Pickaxe = var378:find("pickaxe", 1, true);
                    -- local _ = Pickaxe or (unknown_value)
                    if not Pickaxe then return end -- won't run
                    local Not_V_19 = not v_19;
                    -- false
                    local Character_29 = LocalPlayer.Character;
                    -- local _ = Character_29 or (unknown_value)
                    local Children_19 = Character_29:GetChildren();
                    for i_20, v_20 in ipairs(Children_19) do
                        local IsA_21 = v_20.IsA;
                        local Tool_5 = v_20:IsA("Tool");
                        local GetAttribute_20 = v_20.GetAttribute;
                        local ItemJSON_7 = v_20:GetAttribute("ItemJSON");
                        local var380 = (Tool_5 and ItemJSON_7); -- ItemJSON_7
                        if not var380 then return end -- won't run
                        local Not_V_20 = not v_20;
                        -- false
                        local Not_V_20_2 = not v_20;
                        -- false
                        local GetAttribute_21 = v_20.GetAttribute;
                        local ItemJSON_8 = v_20:GetAttribute("ItemJSON");
                        local var381 = typeof(ItemJSON_8);
                        local var381_isnt_string = (var381 ~= "string");
                        -- false, eq id 39
                        local var382 = (ItemJSON_8 == "");
                        -- false, eq id 40
                        local var383 = (var381_isnt_string or var382); -- false
                        local JSONDecode_3 = HttpService:JSONDecode(ItemJSON_8);
                        local var384 = typeof(JSONDecode_3);
                        local var384_isnt_string = (var384 ~= "table");
                        -- false, eq id 41
                        local Name_14 = JSONDecode_3.Name;
                        -- local _ = Name_14 or (unknown_value)
                        local var385 = tostring(Name_14);
                        local PlayerGui_4 = LocalPlayer:FindFirstChild("PlayerGui");
                        local Not_PlayerGui_4 = not PlayerGui_4;
                        -- false
                        local Menu_4 = PlayerGui:FindFirstChild("Menu");
                        local Not_Menu_4 = not Menu_4;
                        -- false
                        local Frame_13 = Menu:FindFirstChild("Frame");
                        local Not_Frame_13 = not Frame_13;
                        -- false
                        local Frame_14 = Frame_3:FindFirstChild("Frame");
                        local Not_Frame_14 = not Frame_14;
                        -- false
                        local Menus_4 = Frame_4:FindFirstChild("Menus");
                        local Not_Menus_4 = not Menus_4;
                        -- false
                        local Tools_3 = Menus:FindFirstChild("Tools");
                        local Not_Tools_3 = not Tools_3;
                        -- false
                        local Frame_15 = Tools:FindFirstChild("Frame");
                        local Not_Frame_15 = not Frame_15;
                        -- false
                        local FindFirstChild_11 = Frame_5:FindFirstChild(var385);
                        local Not_FindFirstChild_11 = not FindFirstChild_11;
                        -- true
                        if not Not_FindFirstChild_11 then return end -- won't run
                        local Character_30 = LocalPlayer.Character;
                        -- local _ = Character_30 or (unknown_value)
                        local HumanoidRootPart_24 = Character_30:WaitForChild("HumanoidRootPart");
                        local Not_HumanoidRootPart_24 = not HumanoidRootPart_24;
                        -- false
                        local var386 = tonumber(p1_0, nil);
                        -- no value
                        local var387 = (var386 or 500);
                        local Position_13 = HumanoidRootPart_24.Position;
                        local Rocks_7 = workspace:FindFirstChild("Rocks");
                        local Not_Rocks_7 = not Rocks_7;
                        -- false
                        local var388 = var386 * var386;
                        local var389 = (var386 and var388); -- var388
                        local Children_20 = Rocks_3:GetChildren();
                        for i_21, v_21 in ipairs(Children_20) do
                            local GetChildren_5 = v_21.GetChildren;
                            local Children_21 = v_21:GetChildren();
                            for i_22, v_22 in ipairs(Children_21) do
                                local Not_V_22 = not v_22;
                                -- false
                                local Parent_21 = v_22.Parent;
                                local Not_Parent_21 = not Parent_21;
                                -- false
                                local var389 = (Not_V_22 or Not_Parent_21); -- false
                                local IsA_22 = v_22.IsA;
                                local BasePart_9 = v_22:IsA("BasePart");
                                local var390 = (BasePart_9 and v_22); -- v_22
                                -- local _ = var390 or (unknown_value)
                                -- local _ = v_22 or (unknown_value)
                                -- local _ = v_22 or (unknown_value)
                                local Not_V_22_2 = not v_22;
                                -- false
                                -- local _ = var389 and (unknown_value)
                                local Not_V_22_3 = not v_22;
                                -- false
                                local Parent_22 = v_22.Parent;
                                local Not_Parent_22 = not Parent_22;
                                -- false
                                local var391 = (Not_V_22_3 or Not_Parent_22); -- false
                                local Not_V_22_4 = not v_22;
                                -- false
                                local GetAttribute_22 = v_22.GetAttribute;
                                local Health_20 = v_22:GetAttribute("Health");
                                local Health_20_Is_Nil = (Health_20 == nil);
                                -- false, eq id 42
                                local Health_20_Is_Nil_2 = (Health_20 == nil);
                                -- false, eq id 43
                                local var392 = tonumber(Health_20, nil);
                                -- no value
                                local Var392_Exists = (var392 ~= nil);
                                -- false, eq id 44
                                local FindFirstChild_12 = v_22.FindFirstChild;
                                local Boulder_5 = v_22:FindFirstChild("Boulder");
                                local Not_Boulder_5 = not Boulder_5;
                                -- false
                                local Not_Boulder_5_2 = not Boulder_5;
                                -- false
                                if not Boulder_5 then return end -- won't run
                                local GetAttribute_23 = v_22.GetAttribute;
                                local RockType_5 = v_22:GetAttribute("RockType");
                                -- local _ = RockType_5 or (unknown_value)
                                -- local _ = RockType_5 or (unknown_value)
                                -- local _ = RockType_5 or (unknown_value)
                                local GetAttribute_24 = v_22.GetAttribute;
                                local RequiredDamage_5 = v_22:GetAttribute("RequiredDamage");
                                local var393 = tonumber(RequiredDamage_5, nil);
                                -- no value
                                local Not_Var393 = not var393;
                                -- false
                            end
                        end
                        local Waited_For_496 = task.wait(0.5);
                        local var394 = tick();
                        local var395 = var394 - var376;
                        local var396 = (var395 > 30); -- nil
                        local Character_31 = LocalPlayer.Character;
                        -- local _ = Character_31 or (unknown_value)
                        local Character_32 = LocalPlayer.Character;
                        -- local _ = Character_32 or (unknown_value)
                        local Humanoid_17 = Character_32:FindFirstChildOfClass("Humanoid");
                        -- local _ = Humanoid_17 or (unknown_value)
                        local Children_22 = Character_31:GetChildren();
                        for i_23, v_23 in ipairs(Children_22) do
                            local IsA_23 = v_23.IsA;
                            local Tool_6 = v_23:IsA("Tool");
                            local var396 = (v_23 and Tool_6); -- Tool_6
                            local Not_Var396 = not var396;
                            -- false
                            local Name_15 = v_23.Name;
                            -- local _ = Name_15 or (unknown_value)
                            local var397 = string.lower(Name_15);
                            local GetAttribute_25 = v_23.GetAttribute;
                            local ItemName_2 = v_23:GetAttribute("ItemName");
                            local var398 = tostring(ItemName_2);
                            local var399 = (ItemName_2 and "itemname_2"); -- "itemname_2"
                            -- local _ = var399 or (unknown_value)
                            local Find_2 = var397.find;
                            local Pickaxe_2 = var397:find("pickaxe", 1, true);
                            -- local _ = Pickaxe_2 or (unknown_value)
                            if not Pickaxe_2 then return end -- won't run
                            local Not_V_23 = not v_23;
                            -- false
                            local Character_33 = LocalPlayer.Character;
                            -- local _ = Character_33 or (unknown_value)
                            local Children_23 = Character_33:GetChildren();
                            for i_24, v_24 in ipairs(Children_23) do
                                local IsA_24 = v_24.IsA;
                                local Tool_7 = v_24:IsA("Tool");
                                local GetAttribute_26 = v_24.GetAttribute;
                                local ItemJSON_9 = v_24:GetAttribute("ItemJSON");
                                local var399 = (Tool_7 and ItemJSON_9); -- ItemJSON_9
                                if not var399 then return end -- won't run
                                local Not_V_24 = not v_24;
                                -- false
                                local Not_V_24_2 = not v_24;
                                -- false
                                local GetAttribute_27 = v_24.GetAttribute;
                                local ItemJSON_10 = v_24:GetAttribute("ItemJSON");
                                local var400 = typeof(ItemJSON_10);
                                local var400_isnt_string = (var400 ~= "string");
                                -- false, eq id 45
                                local var401 = (ItemJSON_10 == "");
                                -- false, eq id 46
                                local var402 = (var400_isnt_string or var401); -- false
                                local JSONDecode_4 = HttpService:JSONDecode(ItemJSON_10);
                                local var403 = typeof(JSONDecode_4);
                                local var403_isnt_string = (var403 ~= "table");
                                -- false, eq id 47
                                local Name_16 = JSONDecode_4.Name;
                                -- local _ = Name_16 or (unknown_value)
                                local var404 = tostring(Name_16);
                                local PlayerGui_5 = LocalPlayer:FindFirstChild("PlayerGui");
                                local Not_PlayerGui_5 = not PlayerGui_5;
                                -- false
                                local Menu_5 = PlayerGui:FindFirstChild("Menu");
                                local Not_Menu_5 = not Menu_5;
                                -- false
                                local Frame_16 = Menu:FindFirstChild("Frame");
                                local Not_Frame_16 = not Frame_16;
                                -- false
                                local Frame_17 = Frame_3:FindFirstChild("Frame");
                                local Not_Frame_17 = not Frame_17;
                                -- false
                                local Menus_5 = Frame_4:FindFirstChild("Menus");
                                local Not_Menus_5 = not Menus_5;
                                -- false
                                local Tools_4 = Menus:FindFirstChild("Tools");
                                local Not_Tools_4 = not Tools_4;
                                -- false
                                local Frame_18 = Tools:FindFirstChild("Frame");
                                local Not_Frame_18 = not Frame_18;
                                -- false
                                local FindFirstChild_13 = Frame_5:FindFirstChild(var404);
                                local Not_FindFirstChild_13 = not FindFirstChild_13;
                                -- true
                                if not Not_FindFirstChild_13 then return end -- won't run
                                local Character_34 = LocalPlayer.Character;
                                -- local _ = Character_34 or (unknown_value)
                                local HumanoidRootPart_25 = Character_34:WaitForChild("HumanoidRootPart");
                                local Not_HumanoidRootPart_25 = not HumanoidRootPart_25;
                                -- false
                                local var405 = tonumber(p1_0, nil);
                                -- no value
                                local var406 = (var405 or 500);
                                local Position_14 = HumanoidRootPart_25.Position;
                                local Rocks_8 = workspace:FindFirstChild("Rocks");
                                local Not_Rocks_8 = not Rocks_8;
                                -- false
                                local var407 = var405 * var405;
                                local var408 = (var405 and var407); -- var407
                                local Children_24 = Rocks_3:GetChildren();
                                for i_25, v_25 in ipairs(Children_24) do
                                    local GetChildren_6 = v_25.GetChildren;
                                    local Children_25 = v_25:GetChildren();
                                    for i_26, v_26 in ipairs(Children_25) do
                                        local Not_V_26 = not v_26;
                                        -- false
                                        local Parent_23 = v_26.Parent;
                                        local Not_Parent_23 = not Parent_23;
                                        -- false
                                        local var408 = (Not_V_26 or Not_Parent_23); -- false
                                        local IsA_25 = v_26.IsA;
                                        local BasePart_10 = v_26:IsA("BasePart");
                                        local var409 = (BasePart_10 and v_26); -- v_26
                                        -- local _ = var409 or (unknown_value)
                                        -- local _ = v_26 or (unknown_value)
                                        -- local _ = v_26 or (unknown_value)
                                        local Not_V_26_2 = not v_26;
                                        -- false
                                        -- local _ = var408 and (unknown_value)
                                        local Not_V_26_3 = not v_26;
                                        -- false
                                        local Parent_24 = v_26.Parent;
                                        local Not_Parent_24 = not Parent_24;
                                        -- false
                                        local var410 = (Not_V_26_3 or Not_Parent_24); -- false
                                        local Not_V_26_4 = not v_26;
                                        -- false
                                        local GetAttribute_28 = v_26.GetAttribute;
                                        local Health_21 = v_26:GetAttribute("Health");
                                        local Health_21_Is_Nil = (Health_21 == nil);
                                        -- false, eq id 48
                                        local Health_21_Is_Nil_2 = (Health_21 == nil);
                                        -- false, eq id 49
                                        local var411 = tonumber(Health_21, nil);
                                        -- no value
                                        local Var411_Exists = (var411 ~= nil);
                                        -- false, eq id 50
                                        local FindFirstChild_14 = v_26.FindFirstChild;
                                        local Boulder_6 = v_26:FindFirstChild("Boulder");
                                        local Not_Boulder_6 = not Boulder_6;
                                        -- false
                                        local Not_Boulder_6_2 = not Boulder_6;
                                        -- false
                                        if not Boulder_6 then return end -- won't run
                                        local GetAttribute_29 = v_26.GetAttribute;
                                        local RockType_6 = v_26:GetAttribute("RockType");
                                        -- local _ = RockType_6 or (unknown_value)
                                        -- local _ = RockType_6 or (unknown_value)
                                        -- local _ = RockType_6 or (unknown_value)
                                        local GetAttribute_30 = v_26.GetAttribute;
                                        local RequiredDamage_6 = v_26:GetAttribute("RequiredDamage");
                                        local var412 = tonumber(RequiredDamage_6, nil);
                                        -- no value
                                        local Not_Var412 = not var412;
                                        -- false
                                    end
                                end
                                local Waited_For_497 = task.wait(0.5);
                                local var413 = tick();
                                local var414 = var413 - var376;
                                local var415 = (var414 > 30); -- nil
                                local Character_35 = LocalPlayer.Character;
                                -- local _ = Character_35 or (unknown_value)
                                local Character_36 = LocalPlayer.Character;
                                -- local _ = Character_36 or (unknown_value)
                                local Humanoid_18 = Character_36:FindFirstChildOfClass("Humanoid");
                                -- local _ = Humanoid_18 or (unknown_value)
                                local Children_26 = Character_35:GetChildren();
                                for i_27, v_27 in ipairs(Children_26) do
                                    local IsA_26 = v_27.IsA;
                                    local Tool_8 = v_27:IsA("Tool");
                                    local var415 = (v_27 and Tool_8); -- Tool_8
                                    local Not_Var415 = not var415;
                                    -- false
                                    local Name_17 = v_27.Name;
                                    -- local _ = Name_17 or (unknown_value)
                                    local var416 = string.lower(Name_17);
                                    local GetAttribute_31 = v_27.GetAttribute;
                                    local ItemName_3 = v_27:GetAttribute("ItemName");
                                    local var417 = tostring(ItemName_3);
                                    local var418 = (ItemName_3 and "itemname_3"); -- "itemname_3"
                                    -- local _ = var418 or (unknown_value)
                                    local Find_3 = var416.find;
                                    local Pickaxe_3 = var416:find("pickaxe", 1, true);
                                    -- local _ = Pickaxe_3 or (unknown_value)
                                    if not Pickaxe_3 then return end -- won't run
                                    local Not_V_27 = not v_27;
                                    -- false
                                    local Character_37 = LocalPlayer.Character;
                                    -- local _ = Character_37 or (unknown_value)
                                    local Children_27 = Character_37:GetChildren();
                                    for i_28, v_28 in ipairs(Children_27) do
                                        local IsA_27 = v_28.IsA;
                                        local Tool_9 = v_28:IsA("Tool");
                                        local GetAttribute_32 = v_28.GetAttribute;
                                        local ItemJSON_11 = v_28:GetAttribute("ItemJSON");
                                        local var418 = (Tool_9 and ItemJSON_11); -- ItemJSON_11
                                        if not var418 then return end -- won't run
                                        local Not_V_28 = not v_28;
                                        -- false
                                        local Not_V_28_2 = not v_28;
                                        -- false
                                        local GetAttribute_33 = v_28.GetAttribute;
                                        local ItemJSON_12 = v_28:GetAttribute("ItemJSON");
                                        local var419 = typeof(ItemJSON_12);
                                        local var419_isnt_string = (var419 ~= "string");
                                        -- false, eq id 51
                                        local var420 = (ItemJSON_12 == "");
                                        -- false, eq id 52
                                        local var421 = (var419_isnt_string or var420); -- false
                                        local JSONDecode_5 = HttpService:JSONDecode(ItemJSON_12);
                                        local var422 = typeof(JSONDecode_5);
                                        local var422_isnt_string = (var422 ~= "table");
                                        -- false, eq id 53
                                        local Name_18 = JSONDecode_5.Name;
                                        -- local _ = Name_18 or (unknown_value)
                                        local var423 = tostring(Name_18);
                                        local PlayerGui_6 = LocalPlayer:FindFirstChild("PlayerGui");
                                        local Not_PlayerGui_6 = not PlayerGui_6;
                                        -- false
                                        local Menu_6 = PlayerGui:FindFirstChild("Menu");
                                        local Not_Menu_6 = not Menu_6;
                                        -- false
                                        local Frame_19 = Menu:FindFirstChild("Frame");
                                        local Not_Frame_19 = not Frame_19;
                                        -- false
                                        local Frame_20 = Frame_3:FindFirstChild("Frame");
                                        local Not_Frame_20 = not Frame_20;
                                        -- false
                                        local Menus_6 = Frame_4:FindFirstChild("Menus");
                                        local Not_Menus_6 = not Menus_6;
                                        -- false
                                        local Tools_5 = Menus:FindFirstChild("Tools");
                                        local Not_Tools_5 = not Tools_5;
                                        -- false
                                        local Frame_21 = Tools:FindFirstChild("Frame");
                                        local Not_Frame_21 = not Frame_21;
                                        -- false
                                        local FindFirstChild_15 = Frame_5:FindFirstChild(var423);
                                        local Not_FindFirstChild_15 = not FindFirstChild_15;
                                        -- true
                                        if not Not_FindFirstChild_15 then return end -- won't run
                                        local Character_38 = LocalPlayer.Character;
                                        -- local _ = Character_38 or (unknown_value)
                                        local HumanoidRootPart_26 = Character_38:WaitForChild("HumanoidRootPart");
                                        local Not_HumanoidRootPart_26 = not HumanoidRootPart_26;
                                        -- false
                                        local var424 = tonumber(p1_0, nil);
                                        -- no value
                                        local var425 = (var424 or 500);
                                        local Position_15 = HumanoidRootPart_26.Position;
                                        local Rocks_9 = workspace:FindFirstChild("Rocks");
                                        local Not_Rocks_9 = not Rocks_9;
                                        -- false
                                        local var426 = var424 * var424;
                                        local var427 = (var424 and var426); -- var426
                                        local Children_28 = Rocks_3:GetChildren();
                                        for i_29, v_29 in ipairs(Children_28) do
                                            local GetChildren_7 = v_29.GetChildren;
                                            local Children_29 = v_29:GetChildren();
                                            for i_30, v_30 in ipairs(Children_29) do
                                                local Not_V_30 = not v_30;
                                                -- false
                                                local Parent_25 = v_30.Parent;
                                                local Not_Parent_25 = not Parent_25;
                                                -- false
                                                local var427 = (Not_V_30 or Not_Parent_25); -- false
                                                local IsA_28 = v_30.IsA;
                                                local BasePart_11 = v_30:IsA("BasePart");
                                                local var428 = (BasePart_11 and v_30); -- v_30
                                                -- local _ = var428 or (unknown_value)
                                                -- local _ = v_30 or (unknown_value)
                                                -- local _ = v_30 or (unknown_value)
                                                local Not_V_30_2 = not v_30;
                                                -- false
                                                -- local _ = var427 and (unknown_value)
                                                local Not_V_30_3 = not v_30;
                                                -- false
                                                local Parent_26 = v_30.Parent;
                                                local Not_Parent_26 = not Parent_26;
                                                -- false
                                                local var429 = (Not_V_30_3 or Not_Parent_26); -- false
                                                local Not_V_30_4 = not v_30;
                                                -- false
                                                local GetAttribute_34 = v_30.GetAttribute;
                                                local Health_22 = v_30:GetAttribute("Health");
                                                local Health_22_Is_Nil = (Health_22 == nil);
                                                -- false, eq id 54
                                                local Health_22_Is_Nil_2 = (Health_22 == nil);
                                                -- false, eq id 55
                                                local var430 = tonumber(Health_22, nil);
                                                -- no value
                                                local Var430_Exists = (var430 ~= nil);
                                                -- false, eq id 56
                                                local FindFirstChild_16 = v_30.FindFirstChild;
                                                local Boulder_7 = v_30:FindFirstChild("Boulder");
                                                local Not_Boulder_7 = not Boulder_7;
                                                -- false
                                                local Not_Boulder_7_2 = not Boulder_7;
                                                -- false
                                                if not Boulder_7 then return end -- won't run
                                                local GetAttribute_35 = v_30.GetAttribute;
                                                local RockType_7 = v_30:GetAttribute("RockType");
                                                -- local _ = RockType_7 or (unknown_value)
                                                -- local _ = RockType_7 or (unknown_value)
                                                -- local _ = RockType_7 or (unknown_value)
                                                local GetAttribute_36 = v_30.GetAttribute;
                                                local RequiredDamage_7 = v_30:GetAttribute("RequiredDamage");
                                                local var431 = tonumber(RequiredDamage_7, nil);
                                                -- no value
                                                local Not_Var431 = not var431;
                                                -- false
                                            end
                                        end
                                        local Waited_For_498 = task.wait(0.5);
                                        local var432 = tick();
                                        local var433 = var432 - var376;
                                        local var434 = (var433 > 30); -- nil
                                        local Character_39 = LocalPlayer.Character;
                                        -- local _ = Character_39 or (unknown_value)
                                        local Character_40 = LocalPlayer.Character;
                                        -- local _ = Character_40 or (unknown_value)
                                        local Humanoid_19 = Character_40:FindFirstChildOfClass("Humanoid");
                                        -- local _ = Humanoid_19 or (unknown_value)
                                        local Children_30 = Character_39:GetChildren();
                                        for i_31, v_31 in ipairs(Children_30) do
                                            local IsA_29 = v_31.IsA;
                                            local Tool_10 = v_31:IsA("Tool");
                                            local var434 = (v_31 and Tool_10); -- Tool_10
                                            local Not_Var434 = not var434;
                                            -- false
                                            local Name_19 = v_31.Name;
                                            -- local _ = Name_19 or (unknown_value)
                                            local var435 = string.lower(Name_19);
                                            local GetAttribute_37 = v_31.GetAttribute;
                                            local ItemName_4 = v_31:GetAttribute("ItemName");
                                            local var436 = tostring(ItemName_4);
                                            local var437 = (ItemName_4 and "itemname_4"); -- "itemname_4"
                                            -- local _ = var437 or (unknown_value)
                                            local Find_4 = var435.find;
                                            local Pickaxe_4 = var435:find("pickaxe", 1, true);
                                            -- local _ = Pickaxe_4 or (unknown_value)
                                            if not Pickaxe_4 then return end -- won't run
                                            local Not_V_31 = not v_31;
                                            -- false
                                            local Character_41 = LocalPlayer.Character;
                                            -- local _ = Character_41 or (unknown_value)
                                            local Children_31 = Character_41:GetChildren();
                                            for i_32, v_32 in ipairs(Children_31) do
                                                local IsA_30 = v_32.IsA;
                                                local Tool_11 = v_32:IsA("Tool");
                                                local GetAttribute_38 = v_32.GetAttribute;
                                                local ItemJSON_13 = v_32:GetAttribute("ItemJSON");
                                                local var437 = (Tool_11 and ItemJSON_13); -- ItemJSON_13
                                                if not var437 then return end -- won't run
                                                local Not_V_32 = not v_32;
                                                -- false
                                                local Not_V_32_2 = not v_32;
                                                -- false
                                                local GetAttribute_39 = v_32.GetAttribute;
                                                local ItemJSON_14 = v_32:GetAttribute("ItemJSON");
                                                local var438 = typeof(ItemJSON_14);
                                                local var438_isnt_string = (var438 ~= "string");
                                                -- false, eq id 57
                                                local var439 = (ItemJSON_14 == "");
                                                -- false, eq id 58
                                                local var440 = (var438_isnt_string or var439); -- false
                error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

            end);

        end,
        Name = "Auto Farm Ores",
        Flag = "Forge_AutoFarmOres",
    });
    local Assets_3 = ReplicatedStorage:FindFirstChild("Assets");
    local Mobs = Assets:FindFirstChild("Mobs");
    local var23 = (Assets_3 and Mobs); -- nil
    local CreateSection_3 = Main_Farm.CreateSection;
    local Auto_Farm_Mobs = Main_Farm:CreateSection("Auto Farm Mobs");
    local CreateDropdown_3 = Main_Farm.CreateDropdown;
    local Dropdown_3 = Main_Farm:CreateDropdown({
        Name = "Mobs to Farm",
        MultipleOptions = true,
        Flag = "Forge_MobTypes",
        CurrentOption = {
            "Zombie",
        },
        Callback = function(p1_0)
            local var91 = typeof(p1_0);
            local var91_is_string = (var91 == "table");
            -- true, eq id 14
            local Len_P1_0_3 = #p1_0;
            local var92 = (Len_P1_0_3 > 0); -- nil
            local var93 = (var91_is_string and var92); -- nil

        end,
        Options = {
            "Zombie",
        },
    });
    local CreateSlider_5 = Main_Farm.CreateSlider;
    local Slider_5 = Main_Farm:CreateSlider({
        Name = "Safe HP % (Mobs)",
        Callback = function(p1_0)

        end,
        CurrentValue = 30,
        Increment = 5,
        Range = {
            0,
            100,
        },
        Flag = "Forge_MobSafeHP",
    });
    local CreateToggle_3 = Main_Farm.CreateToggle;
    local Toggle_3 = Main_Farm:CreateToggle({
        CurrentValue = false,
        Callback = function(p1_0)
            local var94 = (p1_0 and true); -- true
            local var95 = (var94 or false);
            local Spawned_4 = task.spawn(function()
                local Character_42 = LocalPlayer.Character;
                -- local _ = Character_42 or (unknown_value)
                local Humanoid_20 = Character_42:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_20 or (unknown_value)
                local Not_Humanoid_20 = not Humanoid_20;
                -- false
                local MaxHealth = Humanoid_20.MaxHealth;
                local var441 = (MaxHealth <= 0); -- nil
                local var442 = (Not_Humanoid_20 or var441); -- nil
                local Health_23 = Humanoid_20.Health;
                local MaxHealth_2 = Humanoid_20.MaxHealth;
                local var443 = Health_23 / MaxHealth_2;
                local var444 = var443 * 100;
                local var445 = tonumber(p1_0, nil);
                -- no value
                local var446 = (var445 or 0);
                local var447 = (var444 <= var445); -- nil
                local Character_43 = LocalPlayer.Character;
                -- local _ = Character_43 or (unknown_value)
                local Character_44 = LocalPlayer.Character;
                -- local _ = Character_44 or (unknown_value)
                local Humanoid_21 = Character_44:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_21 or (unknown_value)
                local Children_32 = Character_43:GetChildren();
                for i_33, v_33 in ipairs(Children_32) do
                    local IsA_31 = v_33.IsA;
                    local Tool_12 = v_33:IsA("Tool");
                    local Name_20 = v_33.Name;
                    local Name_20_is_string = (Name_20 == "Weapon");
                    -- false, eq id 59
                    local var447 = (Tool_12 and Name_20_is_string); -- false
                end
                local Backpack = LocalPlayer:FindFirstChild("Backpack");
                local Not_Backpack = not Backpack;
                -- false
                local Weapon = Backpack:FindFirstChild("Weapon");
                local Tool_13 = Weapon:IsA("Tool");
                local var448 = (Weapon and Tool_13); -- false
                local Not_Var448 = not var448;
                -- true
                if not Not_Var448 then return end -- won't run
                local var449 = wait(0.1);
                local Character_45 = LocalPlayer.Character;
                -- local _ = Character_45 or (unknown_value)
                local Humanoid_22 = Character_45:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_22 or (unknown_value)
                local Not_Humanoid_22 = not Humanoid_22;
                -- false
                local MaxHealth_3 = Humanoid_22.MaxHealth;
                local var450 = (MaxHealth_3 <= 0); -- nil
                local var451 = (Not_Humanoid_22 or var450); -- nil
                local Health_24 = Humanoid_22.Health;
                local MaxHealth_4 = Humanoid_22.MaxHealth;
                local var452 = Health_24 / MaxHealth_4;
                local var453 = var452 * 100;
                local var454 = tonumber(p1_0, nil);
                -- no value
                local var455 = (var454 or 0);
                local var456 = (var453 <= var454); -- nil
                local Character_46 = LocalPlayer.Character;
                -- local _ = Character_46 or (unknown_value)
                local Character_47 = LocalPlayer.Character;
                -- local _ = Character_47 or (unknown_value)
                local Humanoid_23 = Character_47:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_23 or (unknown_value)
                local Children_33 = Character_46:GetChildren();
                for i_34, v_34 in ipairs(Children_33) do
                    local IsA_32 = v_34.IsA;
                    local Tool_14 = v_34:IsA("Tool");
                    local Name_21 = v_34.Name;
                    local Name_21_is_string = (Name_21 == "Weapon");
                    -- false, eq id 60
                    local var456 = (Tool_14 and Name_21_is_string); -- false
                end
                local Backpack_2 = LocalPlayer:FindFirstChild("Backpack");
                local Not_Backpack_2 = not Backpack_2;
                -- false
                local Weapon_2 = Backpack:FindFirstChild("Weapon");
                local Tool_15 = Weapon:IsA("Tool");
                local var457 = (Weapon_2 and Tool_15); -- false
                local Not_Var457 = not var457;
                -- true
                if not Not_Var457 then return end -- won't run
                local var458 = wait(0.1);
                local Character_48 = LocalPlayer.Character;
                -- local _ = Character_48 or (unknown_value)
                local Humanoid_24 = Character_48:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_24 or (unknown_value)
                local Not_Humanoid_24 = not Humanoid_24;
                -- false
                local MaxHealth_5 = Humanoid_24.MaxHealth;
                local var459 = (MaxHealth_5 <= 0); -- nil
                local var460 = (Not_Humanoid_24 or var459); -- nil
                local Health_25 = Humanoid_24.Health;
                local MaxHealth_6 = Humanoid_24.MaxHealth;
                local var461 = Health_25 / MaxHealth_6;
                local var462 = var461 * 100;
                local var463 = tonumber(p1_0, nil);
                -- no value
                local var464 = (var463 or 0);
                local var465 = (var462 <= var463); -- nil
                local Character_49 = LocalPlayer.Character;
                -- local _ = Character_49 or (unknown_value)
                local Character_50 = LocalPlayer.Character;
                -- local _ = Character_50 or (unknown_value)
                local Humanoid_25 = Character_50:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_25 or (unknown_value)
                local Children_34 = Character_49:GetChildren();
                for i_35, v_35 in ipairs(Children_34) do
                    local IsA_33 = v_35.IsA;
                    local Tool_16 = v_35:IsA("Tool");
                    local Name_22 = v_35.Name;
                    local Name_22_is_string = (Name_22 == "Weapon");
                    -- false, eq id 61
                    local var465 = (Tool_16 and Name_22_is_string); -- false
                end
                local Backpack_3 = LocalPlayer:FindFirstChild("Backpack");
                local Not_Backpack_3 = not Backpack_3;
                -- false
                local Weapon_3 = Backpack:FindFirstChild("Weapon");
                local Tool_17 = Weapon:IsA("Tool");
                local var466 = (Weapon_3 and Tool_17); -- false
                local Not_Var466 = not var466;
                -- true
                if not Not_Var466 then return end -- won't run
                local var467 = wait(0.1);
                local Character_51 = LocalPlayer.Character;
                -- local _ = Character_51 or (unknown_value)
                local Humanoid_26 = Character_51:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_26 or (unknown_value)
                local Not_Humanoid_26 = not Humanoid_26;
                -- false
                local MaxHealth_7 = Humanoid_26.MaxHealth;
                local var468 = (MaxHealth_7 <= 0); -- nil
                local var469 = (Not_Humanoid_26 or var468); -- nil
                local Health_26 = Humanoid_26.Health;
                local MaxHealth_8 = Humanoid_26.MaxHealth;
                local var470 = Health_26 / MaxHealth_8;
                local var471 = var470 * 100;
                local var472 = tonumber(p1_0, nil);
                -- no value
                local var473 = (var472 or 0);
                local var474 = (var471 <= var472); -- nil
                local Character_52 = LocalPlayer.Character;
                -- local _ = Character_52 or (unknown_value)
                local Character_53 = LocalPlayer.Character;
                -- local _ = Character_53 or (unknown_value)
                local Humanoid_27 = Character_53:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_27 or (unknown_value)
                local Children_35 = Character_52:GetChildren();
                for i_36, v_36 in ipairs(Children_35) do
                    local IsA_34 = v_36.IsA;
                    local Tool_18 = v_36:IsA("Tool");
                    local Name_23 = v_36.Name;
                    local Name_23_is_string = (Name_23 == "Weapon");
                    -- false, eq id 62
                    local var474 = (Tool_18 and Name_23_is_string); -- false
                end
                local Backpack_4 = LocalPlayer:FindFirstChild("Backpack");
                local Not_Backpack_4 = not Backpack_4;
                -- false
                local Weapon_4 = Backpack:FindFirstChild("Weapon");
                local Tool_19 = Weapon:IsA("Tool");
                local var475 = (Weapon_4 and Tool_19); -- false
                local Not_Var475 = not var475;
                -- true
                if not Not_Var475 then return end -- won't run
                local var476 = wait(0.1);
                local Character_54 = LocalPlayer.Character;
                -- local _ = Character_54 or (unknown_value)
                local Humanoid_28 = Character_54:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_28 or (unknown_value)
                local Not_Humanoid_28 = not Humanoid_28;
                -- false
                local MaxHealth_9 = Humanoid_28.MaxHealth;
                local var477 = (MaxHealth_9 <= 0); -- nil
                local var478 = (Not_Humanoid_28 or var477); -- nil
                local Health_27 = Humanoid_28.Health;
                local MaxHealth_10 = Humanoid_28.MaxHealth;
                local var479 = Health_27 / MaxHealth_10;
                local var480 = var479 * 100;
                local var481 = tonumber(p1_0, nil);
                -- no value
                local var482 = (var481 or 0);
                local var483 = (var480 <= var481); -- nil
                local Character_55 = LocalPlayer.Character;
                -- local _ = Character_55 or (unknown_value)
                local Character_56 = LocalPlayer.Character;
                -- local _ = Character_56 or (unknown_value)
                local Humanoid_29 = Character_56:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_29 or (unknown_value)
                local Children_36 = Character_55:GetChildren();
                for i_37, v_37 in ipairs(Children_36) do
                    local IsA_35 = v_37.IsA;
                    local Tool_20 = v_37:IsA("Tool");
                    local Name_24 = v_37.Name;
                    local Name_24_is_string = (Name_24 == "Weapon");
                    -- false, eq id 63
                    local var483 = (Tool_20 and Name_24_is_string); -- false
                end
                local Backpack_5 = LocalPlayer:FindFirstChild("Backpack");
                local Not_Backpack_5 = not Backpack_5;
                -- false
                local Weapon_5 = Backpack:FindFirstChild("Weapon");
                local Tool_21 = Weapon:IsA("Tool");
                local var484 = (Weapon_5 and Tool_21); -- false
                local Not_Var484 = not var484;
                -- true
                if not Not_Var484 then return end -- won't run
                local var485 = wait(0.1);
                local Character_57 = LocalPlayer.Character;
                -- local _ = Character_57 or (unknown_value)
                local Humanoid_30 = Character_57:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_30 or (unknown_value)
                local Not_Humanoid_30 = not Humanoid_30;
                -- false
                local MaxHealth_11 = Humanoid_30.MaxHealth;
                local var486 = (MaxHealth_11 <= 0); -- nil
                local var487 = (Not_Humanoid_30 or var486); -- nil
                local Health_28 = Humanoid_30.Health;
                local MaxHealth_12 = Humanoid_30.MaxHealth;
                local var488 = Health_28 / MaxHealth_12;
                local var489 = var488 * 100;
                local var490 = tonumber(p1_0, nil);
                -- no value
                local var491 = (var490 or 0);
                local var492 = (var489 <= var490); -- nil
                local Character_58 = LocalPlayer.Character;
                -- local _ = Character_58 or (unknown_value)
                local Character_59 = LocalPlayer.Character;
                -- local _ = Character_59 or (unknown_value)
                local Humanoid_31 = Character_59:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_31 or (unknown_value)
                local Children_37 = Character_58:GetChildren();
                for i_38, v_38 in ipairs(Children_37) do
                    local IsA_36 = v_38.IsA;
                    local Tool_22 = v_38:IsA("Tool");
                    local Name_25 = v_38.Name;
                    local Name_25_is_string = (Name_25 == "Weapon");
                    -- false, eq id 64
                    local var492 = (Tool_22 and Name_25_is_string); -- false
                end
                local Backpack_6 = LocalPlayer:FindFirstChild("Backpack");
                local Not_Backpack_6 = not Backpack_6;
                -- false
                local Weapon_6 = Backpack:FindFirstChild("Weapon");
                local Tool_23 = Weapon:IsA("Tool");
                local var493 = (Weapon_6 and Tool_23); -- false
                local Not_Var493 = not var493;
                -- true
                if not Not_Var493 then return end -- won't run
                local var494 = wait(0.1);
                local Character_60 = LocalPlayer.Character;
                -- local _ = Character_60 or (unknown_value)
                local Humanoid_32 = Character_60:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_32 or (unknown_value)
                local Not_Humanoid_32 = not Humanoid_32;
                -- false
                local MaxHealth_13 = Humanoid_32.MaxHealth;
                local var495 = (MaxHealth_13 <= 0); -- nil
                local var496 = (Not_Humanoid_32 or var495); -- nil
                local Health_29 = Humanoid_32.Health;
                local MaxHealth_14 = Humanoid_32.MaxHealth;
                local var497 = Health_29 / MaxHealth_14;
                local var498 = var497 * 100;
                local var499 = tonumber(p1_0, nil);
                -- no value
                local var500 = (var499 or 0);
                local var501 = (var498 <= var499); -- nil
                local Character_61 = LocalPlayer.Character;
                -- local _ = Character_61 or (unknown_value)
                local Character_62 = LocalPlayer.Character;
                -- local _ = Character_62 or (unknown_value)
                local Humanoid_33 = Character_62:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_33 or (unknown_value)
                local Children_38 = Character_61:GetChildren();
                for i_39, v_39 in ipairs(Children_38) do
                    local IsA_37 = v_39.IsA;
                    local Tool_24 = v_39:IsA("Tool");
                    local Name_26 = v_39.Name;
                    local Name_26_is_string = (Name_26 == "Weapon");
                    -- false, eq id 65
                    local var501 = (Tool_24 and Name_26_is_string); -- false
                end
                local Backpack_7 = LocalPlayer:FindFirstChild("Backpack");
                local Not_Backpack_7 = not Backpack_7;
                -- false
                local Weapon_7 = Backpack:FindFirstChild("Weapon");
                local Tool_25 = Weapon:IsA("Tool");
                local var502 = (Weapon_7 and Tool_25); -- false
                local Not_Var502 = not var502;
                -- true
                if not Not_Var502 then return end -- won't run
                local var503 = wait(0.1);
                local Character_63 = LocalPlayer.Character;
                -- local _ = Character_63 or (unknown_value)
                local Humanoid_34 = Character_63:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_34 or (unknown_value)
                local Not_Humanoid_34 = not Humanoid_34;
                -- false
                local MaxHealth_15 = Humanoid_34.MaxHealth;
                local var504 = (MaxHealth_15 <= 0); -- nil
                local var505 = (Not_Humanoid_34 or var504); -- nil
                local Health_30 = Humanoid_34.Health;
                local MaxHealth_16 = Humanoid_34.MaxHealth;
                local var506 = Health_30 / MaxHealth_16;
                local var507 = var506 * 100;
                local var508 = tonumber(p1_0, nil);
                -- no value
                local var509 = (var508 or 0);
                local var510 = (var507 <= var508); -- nil
                local Character_64 = LocalPlayer.Character;
                -- local _ = Character_64 or (unknown_value)
                local Character_65 = LocalPlayer.Character;
                -- local _ = Character_65 or (unknown_value)
                local Humanoid_35 = Character_65:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_35 or (unknown_value)
                local Children_39 = Character_64:GetChildren();
                for i_40, v_40 in ipairs(Children_39) do
                    local IsA_38 = v_40.IsA;
                    local Tool_26 = v_40:IsA("Tool");
                    local Name_27 = v_40.Name;
                    local Name_27_is_string = (Name_27 == "Weapon");
                    -- false, eq id 66
                    local var510 = (Tool_26 and Name_27_is_string); -- false
                end
                local Backpack_8 = LocalPlayer:FindFirstChild("Backpack");
                local Not_Backpack_8 = not Backpack_8;
                -- false
                local Weapon_8 = Backpack:FindFirstChild("Weapon");
                local Tool_27 = Weapon:IsA("Tool");
                local var511 = (Weapon_8 and Tool_27); -- false
                local Not_Var511 = not var511;
                -- true
                if not Not_Var511 then return end -- won't run
                local var512 = wait(0.1);
                local Character_66 = LocalPlayer.Character;
                -- local _ = Character_66 or (unknown_value)
                local Humanoid_36 = Character_66:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_36 or (unknown_value)
                local Not_Humanoid_36 = not Humanoid_36;
                -- false
                local MaxHealth_17 = Humanoid_36.MaxHealth;
                local var513 = (MaxHealth_17 <= 0); -- nil
                local var514 = (Not_Humanoid_36 or var513); -- nil
                local Health_31 = Humanoid_36.Health;
                local MaxHealth_18 = Humanoid_36.MaxHealth;
                local var515 = Health_31 / MaxHealth_18;
                local var516 = var515 * 100;
                local var517 = tonumber(p1_0, nil);
                -- no value
                local var518 = (var517 or 0);
                local var519 = (var516 <= var517); -- nil
                local Character_67 = LocalPlayer.Character;
                -- local _ = Character_67 or (unknown_value)
                local Character_68 = LocalPlayer.Character;
                -- local _ = Character_68 or (unknown_value)
                local Humanoid_37 = Character_68:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_37 or (unknown_value)
                local Children_40 = Character_67:GetChildren();
                for i_41, v_41 in ipairs(Children_40) do
                    local IsA_39 = v_41.IsA;
                    local Tool_28 = v_41:IsA("Tool");
                    local Name_28 = v_41.Name;
                    local Name_28_is_string = (Name_28 == "Weapon");
                    -- false, eq id 67
                    local var519 = (Tool_28 and Name_28_is_string); -- false
                end
                local Backpack_9 = LocalPlayer:FindFirstChild("Backpack");
                local Not_Backpack_9 = not Backpack_9;
                -- false
                local Weapon_9 = Backpack:FindFirstChild("Weapon");
                local Tool_29 = Weapon:IsA("Tool");
                local var520 = (Weapon_9 and Tool_29); -- false
                local Not_Var520 = not var520;
                -- true
                if not Not_Var520 then return end -- won't run
                local var521 = wait(0.1);
                local Character_69 = LocalPlayer.Character;
                -- local _ = Character_69 or (unknown_value)
                local Humanoid_38 = Character_69:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_38 or (unknown_value)
                local Not_Humanoid_38 = not Humanoid_38;
                -- false
                local MaxHealth_19 = Humanoid_38.MaxHealth;
                local var522 = (MaxHealth_19 <= 0); -- nil
                local var523 = (Not_Humanoid_38 or var522); -- nil
                local Health_32 = Humanoid_38.Health;
                local MaxHealth_20 = Humanoid_38.MaxHealth;
                local var524 = Health_32 / MaxHealth_20;
                local var525 = var524 * 100;
                local var526 = tonumber(p1_0, nil);
                -- no value
                local var527 = (var526 or 0);
                local var528 = (var525 <= var526); -- nil
                local Character_70 = LocalPlayer.Character;
                -- local _ = Character_70 or (unknown_value)
                local Character_71 = LocalPlayer.Character;
                -- local _ = Character_71 or (unknown_value)
                local Humanoid_39 = Character_71:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_39 or (unknown_value)
                local Children_41 = Character_70:GetChildren();
                for i_42, v_42 in ipairs(Children_41) do
                    local IsA_40 = v_42.IsA;
                    local Tool_30 = v_42:IsA("Tool");
                    local Name_29 = v_42.Name;
                    local Name_29_is_string = (Name_29 == "Weapon");
                    -- false, eq id 68
                    local var528 = (Tool_30 and Name_29_is_string); -- false
                end
                local Backpack_10 = LocalPlayer:FindFirstChild("Backpack");
                local Not_Backpack_10 = not Backpack_10;
                -- false
                local Weapon_10 = Backpack:FindFirstChild("Weapon");
                local Tool_31 = Weapon:IsA("Tool");
                local var529 = (Weapon_10 and Tool_31); -- false
                local Not_Var529 = not var529;
                -- true
                if not Not_Var529 then return end -- won't run
                local var530 = wait(0.1);
                local Character_72 = LocalPlayer.Character;
                -- local _ = Character_72 or (unknown_value)
                local Humanoid_40 = Character_72:FindFirstChildOfClass("Humanoid");
                -- local _ = Humanoid_40 or (unknown_value)
                local Not_Humanoid_40 = not Humanoid_40;
                -- false
                local MaxHealth_21 = Humanoid_40.MaxHealth;
                local var531 = (MaxHealth_21 <= 0); -- nil
                local var532 = (Not_Humanoid_40 or var531); -- nil
                local Health_33 = Humanoid_40.Health;
                local MaxHealth_22 = Humanoid_40.MaxHealth;
                local var533 = Health_33 / MaxHealth_22;
                local var534 = var533 * 100;
                local var535 = tonumber(p1_0, nil);
                -- no value
                local var536 = (var535 or 0);
                local var537 = (var534 <= var535); -- nil
                local Character_73 = LocalPlayer.Character;
                -- local _ = Character_73 or (unknown_value)
                local Character_74 = LocalPlayer.Character;
                -- local _ = Character_74 or (unknown_value)
                error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

            end);

        end,
        Name = "Auto Farm Mobs",
        Flag = "Forge_AutoFarmMobs",
    });
    local CreateToggle_4 = Main_Farm.CreateToggle;
    local Toggle_4 = Main_Farm:CreateToggle({
        CurrentValue = false,
        Callback = function(p1_0)
            local var96 = (p1_0 and true); -- true
            local var97 = (var96 or false);
            local Living = workspace:FindFirstChild("Living");
            local Not_Living = not Living;
            -- false
            local Children_5 = Living:GetChildren();
            for i_6, v_6 in ipairs(Children_5) do
                local IsA_3 = v_6.IsA;
                local Model = v_6:IsA("Model");
                if not Model then return end -- won't run
                local Not_V_6 = not v_6;
                -- false
                local FindFirstChild_2 = v_6.FindFirstChild;
                local Dead = v_6:FindFirstChild("Dead", true);
                local IsA_4 = Dead.IsA;
                local BoolValue = Dead:IsA("BoolValue");
                local var97 = (Dead and BoolValue); -- BoolValue
                if not var97 then return end -- won't run
                local Value = Dead.Value;
                local Name_7 = v_6.Name;
                local var98 = tostring(Name_7);
                local Gsub = var98.gsub;
            end
            local Character_2 = LocalPlayer.Character;
            -- local _ = Character_2 or (unknown_value)
            local HumanoidRootPart_2 = Character_2:WaitForChild("HumanoidRootPart");
            if not HumanoidRootPart_2 then return end -- won't run

        end,
        Name = "Mobs ESP",
        Flag = "Forge_MobsESP",
    });
    local Spawned = task.spawn(function()
        local Character_3 = LocalPlayer.Character;
        -- local _ = Character_3 or (unknown_value)
        local HumanoidRootPart_3 = Character_3:WaitForChild("HumanoidRootPart");
        local Position_4 = HumanoidRootPart_3.Position;
        local var100 = (HumanoidRootPart_3 and Position_4); -- Position_4
        local var101 = tonumber(p1_0, nil);
        -- no value
        local var102 = (var101 or 500);
        local Rocks_4 = workspace:FindFirstChild("Rocks");
        local Not_Rocks_4 = not Rocks_4;
        -- false
        local var103 = var101 * var101;
        local var104 = (var101 and var103); -- var103
        local Children_6 = Rocks_3:GetChildren();
        for i_7, v_7 in ipairs(Children_6) do
            local GetChildren_2 = v_7.GetChildren;
            local Children_7 = v_7:GetChildren();
            for i_8, v_8 in ipairs(Children_7) do
                local Not_V_8 = not v_8;
                -- false
                local Parent_6 = v_8.Parent;
                local Not_Parent_6 = not Parent_6;
                -- false
                local var104 = (Not_V_8 or Not_Parent_6); -- false
                local IsA_5 = v_8.IsA;
                local BasePart_3 = v_8:IsA("BasePart");
                local var105 = (BasePart_3 and v_8); -- v_8
                -- local _ = var105 or (unknown_value)
                -- local _ = v_8 or (unknown_value)
                -- local _ = v_8 or (unknown_value)
                local Not_V_8_2 = not v_8;
                -- false
                -- local _ = var104 and (unknown_value)
                local Not_V_8_3 = not v_8;
                -- false
                local Parent_7 = v_8.Parent;
                local Not_Parent_7 = not Parent_7;
                -- false
                local var106 = (Not_V_8_3 or Not_Parent_7); -- false
                local Not_V_8_4 = not v_8;
                -- false
                local GetAttribute_4 = v_8.GetAttribute;
                local Health_2 = v_8:GetAttribute("Health");
                local Health_2_Is_Nil = (Health_2 == nil);
                -- false, eq id 15
                local Health_2_Is_Nil_2 = (Health_2 == nil);
                -- false, eq id 16
                local var107 = tonumber(Health_2, nil);
                -- no value
                local Var107_Exists = (var107 ~= nil);
                -- false, eq id 17
                local FindFirstChild_3 = v_8.FindFirstChild;
                local Boulder_2 = v_8:FindFirstChild("Boulder");
                local Not_Boulder_2 = not Boulder_2;
                -- false
                local Not_Boulder_2_2 = not Boulder_2;
                -- false
                if not Boulder_2 then return end -- won't run
                local GetAttribute_5 = v_8.GetAttribute;
                local RockType_2 = v_8:GetAttribute("RockType");
                -- local _ = RockType_2 or (unknown_value)
                -- local _ = RockType_2 or (unknown_value)
                -- local _ = RockType_2 or (unknown_value)
                local GetAttribute_6 = v_8.GetAttribute;
                local RequiredDamage_2 = v_8:GetAttribute("RequiredDamage");
                local var108 = tonumber(RequiredDamage_2, nil);
                -- no value
                local Not_Var108 = not var108;
                -- false
            end
        end
        if not var100 then return end -- won't run
        local Not_V_8_5 = not v_8;
        -- false
        local Parent_8 = v_8.Parent;
        local Not_Parent_8 = not Parent_8;
        -- false
        local var109 = (Not_V_8_5 or Not_Parent_8); -- false
        local IsA_6 = v_8.IsA;
        local BasePart_4 = v_8:IsA("BasePart");
        local var110 = (v_8 and BasePart_4); -- BasePart_4
        local Not_Var110 = not var110;
        -- false
        local Highlight_2 = Instance.new("Highlight");
        local Color3_Value_13 = Color3_FromRGB(0, 255, 200);
        Highlight_2.FillColor = Color3_Value_13;
        local Color3_Value_14 = Color3_FromRGB(255, 255, 0);
        Highlight_2.OutlineColor = Color3_Value_14;
        Highlight_2.FillTransparency = 0.2;
        Highlight_2.OutlineTransparency = 0;
        local AlwaysOnTop_2 = Enum_HighlightDepthMode.AlwaysOnTop;
        Highlight_2.DepthMode = AlwaysOnTop_2;
        Highlight_2.Enabled = true;
        local Not_Boulder_2_3 = not Boulder_2;
        -- false
        local Parent_9 = Boulder_2.Parent;
        local Not_Parent_9 = not Parent_9;
        -- false
        local var112 = (Not_Boulder_2_3 or Not_Parent_9); -- false
        Highlight_2.Adornee = Boulder_2;
        Highlight_2.Parent = workspace;
        local Attachment_3 = Instance.new("Attachment");
        Attachment_3.Parent = v_8;
        local Vector3_Value_4 = Vector3_New(0, 2, 0);
        Attachment_3.Position = Vector3_Value_4;
        local Attachment_4 = Instance.new("Attachment");
        Attachment_4.Parent = v_8;
        local Vector3_Value_5 = Vector3_New(0, 20, 0);
        Attachment_4.Position = Vector3_Value_5;
        local Beam_2 = Instance.new("Beam");
        Beam_2.Attachment0 = Attachment_3;
        Beam_2.Attachment1 = Attachment_4;
        local Color3_Value_15 = Color3_FromRGB(0, 255, 200);
        local ColorSequenceKeypoint_Value_6 = ColorSequenceKeypoint_New(0, Color3_Value_15);
        local Color3_Value_16 = Color3_FromRGB(100, 200, 255);
        local ColorSequenceKeypoint_Value_7 = ColorSequenceKeypoint_New(0.5, Color3_Value_16);
        local Color3_Value_17 = Color3_FromRGB(255, 100, 255);
        local ColorSequenceKeypoint_Value_8 = ColorSequenceKeypoint_New(1, Color3_Value_17);
        local ColorSequence_Value_3 = ColorSequence_New({
            ColorSequenceKeypoint_Value_6,
            ColorSequenceKeypoint_Value_7,
            ColorSequenceKeypoint_Value_8,
        });
        Beam_2.Color = ColorSequence_Value_3;
        local NumberSequenceKeypoint_Value_4 = NumberSequenceKeypoint_New(0, 0.3);
        local NumberSequenceKeypoint_Value_5 = NumberSequenceKeypoint_New(0.5, 0.1);
        local NumberSequenceKeypoint_Value_6 = NumberSequenceKeypoint_New(1, 0.8);
        local NumberSequence_Value_2 = NumberSequence_New({
            NumberSequenceKeypoint_Value_4,
            NumberSequenceKeypoint_Value_5,
            NumberSequenceKeypoint_Value_6,
        });
        Beam_2.Transparency = NumberSequence_Value_2;
        Beam_2.Width0 = 0.5;
        Beam_2.Width1 = 2;
        Beam_2.FaceCamera = true;
        Beam_2.LightEmission = 1;
        Beam_2.LightInfluence = 0;
        Beam_2.Texture = "rbxasset://textures/particles/sparkles_main.dds";
        local Wrap_2 = Enum_TextureMode.Wrap;
        Beam_2.TextureMode = Wrap_2;
        Beam_2.TextureSpeed = 1;
        Beam_2.Parent = v_8;
        local BillboardGui_2 = Instance.new("BillboardGui");
        local UDim2_Value_7 = UDim2_New(0, 150, 0, 50);
        BillboardGui_2.Size = UDim2_Value_7;
        BillboardGui_2.Adornee = v_8;
        BillboardGui_2.AlwaysOnTop = true;
        BillboardGui_2.MaxDistance = 1000;
        local Vector3_Value_6 = Vector3_New(0, 5, 0);
        BillboardGui_2.StudsOffset = Vector3_Value_6;
        BillboardGui_2.Parent = v_8;
        local Frame_2 = Instance.new("Frame");
        local UDim2_Value_8 = UDim2_New(1, 0, 1, 0);
        Frame_2.Size = UDim2_Value_8;
        local Color3_Value_18 = Color3_FromRGB(20, 20, 30);
        Frame_2.BackgroundColor3 = Color3_Value_18;
        Frame_2.BackgroundTransparency = 0.3;
        Frame_2.BorderSizePixel = 0;
        Frame_2.Parent = BillboardGui_2;
        local UICorner_2 = Instance.new("UICorner");
        local UDim_Value_2 = UDim_New(0, 8);
        UICorner_2.CornerRadius = UDim_Value_2;
        UICorner_2.Parent = Frame_2;
        local UIGradient_2 = Instance.new("UIGradient");
        local Color3_Value_19 = Color3_FromRGB(50, 50, 80);
        local ColorSequenceKeypoint_Value_9 = ColorSequenceKeypoint_New(0, Color3_Value_19);
        local Color3_Value_20 = Color3_FromRGB(20, 20, 40);
        local ColorSequenceKeypoint_Value_10 = ColorSequenceKeypoint_New(1, Color3_Value_20);
        local ColorSequence_Value_4 = ColorSequence_New({
            ColorSequenceKeypoint_Value_9,
            ColorSequenceKeypoint_Value_10,
        });
        UIGradient_2.Color = ColorSequence_Value_4;
        UIGradient_2.Rotation = 90;
        UIGradient_2.Parent = Frame_2;
        local UIStroke_2 = Instance.new("UIStroke");
        local Color3_Value_21 = Color3_FromRGB(0, 255, 200);
        UIStroke_2.Color = Color3_Value_21;
        UIStroke_2.Thickness = 2;
        UIStroke_2.Transparency = 0;
        UIStroke_2.Parent = Frame_2;
        local TextLabel_3 = Instance.new("TextLabel");
        local UDim2_Value_9 = UDim2_New(1, -10, 0.6, 0);
        TextLabel_3.Size = UDim2_Value_9;
        local UDim2_Value_10 = UDim2_New(0, 5, 0.1, 0);
        TextLabel_3.Position = UDim2_Value_10;
        TextLabel_3.BackgroundTransparency = 1;
        local var114 = tostring(RockType_2);
        local var115 = "⛏️ " .. var114;
        -- "⛏️ RockType_2"
        TextLabel_3.Text = var115;
        local Color3_Value_22 = Color3_FromRGB(255, 255, 255);
        TextLabel_3.TextColor3 = Color3_Value_22;
        TextLabel_3.TextStrokeTransparency = 0.5;
        local Color3_Value_23 = Color3_FromRGB(0, 0, 0);
        TextLabel_3.TextStrokeColor3 = Color3_Value_23;
        TextLabel_3.TextScaled = true;
        local GothamBold_2 = Enum_Font.GothamBold;
        TextLabel_3.Font = GothamBold_2;
        TextLabel_3.Parent = Frame_2;
        local TextLabel_4 = Instance.new("TextLabel");
        local UDim2_Value_11 = UDim2_New(1, -10, 0.3, 0);
        TextLabel_4.Size = UDim2_Value_11;
        local UDim2_Value_12 = UDim2_New(0, 5, 0.65, 0);
        TextLabel_4.Position = UDim2_Value_12;
        TextLabel_4.BackgroundTransparency = 1;
        TextLabel_4.Text = "...";
        local Color3_Value_24 = Color3_FromRGB(100, 255, 200);
        TextLabel_4.TextColor3 = Color3_Value_24;
        TextLabel_4.TextStrokeTransparency = 0.5;
        TextLabel_4.TextScaled = true;
        local Gotham_2 = Enum_Font.Gotham;
        TextLabel_4.Font = Gotham_2;
        TextLabel_4.Parent = Frame_2;
        if not HumanoidRootPart_3 then return end -- won't run
        if not Highlight then return end -- won't run
        local Destroy = Highlight:Destroy();
        if not BillboardGui then return end -- won't run
        local Destroy_2 = BillboardGui:Destroy();
        if not Beam then return end -- won't run
        local Destroy_3 = Beam:Destroy();
        if not Attachment then return end -- won't run
        local Destroy_4 = Attachment:Destroy();
        local var118 = (TextLabel_4 and v_8); -- v_8
        local Parent_10 = v_8.Parent;
        local var119 = (var118 and Parent_10); -- Parent_10
        if not var119 then return end -- won't run
        local Position_5 = v_8.Position;
        local Position_6 = HumanoidRootPart_3.Position;
        local var120 = Position_5 - Position_6;
        local Magnitude_2 = var120.Magnitude;
        local var121 = string.format("%.0f studs", Magnitude_2);
        TextLabel_4.Text = var121;
        local Living_2 = workspace:FindFirstChild("Living");
        local Not_Living_2 = not Living_2;
        -- false
        local Children_8 = Living:GetChildren();
        for i_9, v_9 in ipairs(Children_8) do
            local IsA_7 = v_9.IsA;
            local Model_2 = v_9:IsA("Model");
            if not Model_2 then return end -- won't run
            local Not_V_9 = not v_9;
            -- false
            local FindFirstChild_4 = v_9.FindFirstChild;
            local Dead_2 = v_9:FindFirstChild("Dead", true);
            local IsA_8 = Dead_2.IsA;
            local BoolValue_2 = Dead_2:IsA("BoolValue");
            local var121 = (Dead_2 and BoolValue_2); -- BoolValue_2
            if not var121 then return end -- won't run
            local Value_2 = Dead_2.Value;
            local Name_8 = v_9.Name;
            local var122 = tostring(Name_8);
            local Gsub_2 = var122.gsub;
        end
        local Character_4 = LocalPlayer.Character;
        -- local _ = Character_4 or (unknown_value)
        local HumanoidRootPart_4 = Character_4:WaitForChild("HumanoidRootPart");
        if not HumanoidRootPart_4 then return end -- won't run
        local Character_5 = LocalPlayer.Character;
        -- local _ = Character_5 or (unknown_value)
        local Children_9 = Character_5:GetChildren();
        for i_10, v_10 in ipairs(Children_9) do
            local IsA_9 = v_10.IsA;
            local Tool = v_10:IsA("Tool");
            local GetAttribute_7 = v_10.GetAttribute;
            local ItemJSON = v_10:GetAttribute("ItemJSON");
            local var123 = (Tool and ItemJSON); -- ItemJSON
            if not var123 then return end -- won't run
            local Not_V_10 = not v_10;
            -- false
            local Not_V_10_2 = not v_10;
            -- false
            local GetAttribute_8 = v_10.GetAttribute;
            local ItemJSON_2 = v_10:GetAttribute("ItemJSON");
            local var124 = typeof(ItemJSON_2);
            local var124_isnt_string = (var124 ~= "string");
            -- false, eq id 18
            local var125 = (ItemJSON_2 == "");
            -- false, eq id 19
            local var126 = (var124_isnt_string or var125); -- false
            local JSONDecode = HttpService:JSONDecode(ItemJSON_2);
            local var127 = typeof(JSONDecode);
            local var127_isnt_string = (var127 ~= "table");
            -- false, eq id 20
            local Name_9 = JSONDecode.Name;
            -- local _ = Name_9 or (unknown_value)
            local var128 = tostring(Name_9);
            local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui");
            local Not_PlayerGui = not PlayerGui;
            -- false
            local Menu = PlayerGui:FindFirstChild("Menu");
            local Not_Menu = not Menu;
            -- false
            local Frame_3 = Menu:FindFirstChild("Frame");
            local Not_Frame_3 = not Frame_3;
            -- false
            local Frame_4 = Frame_3:FindFirstChild("Frame");
            local Not_Frame_4 = not Frame_4;
            -- false
            local Menus = Frame_4:FindFirstChild("Menus");
            local Not_Menus = not Menus;
            -- false
            local Tools = Menus:FindFirstChild("Tools");
            local Not_Tools = not Tools;
            -- false
            local Frame_5 = Tools:FindFirstChild("Frame");
            local Not_Frame_5 = not Frame_5;
            -- false
            local FindFirstChild_5 = Frame_5:FindFirstChild(var128);
            local Not_FindFirstChild_5 = not FindFirstChild_5;
            -- false
            local Stats = FindFirstChild_5:FindFirstChild("Stats");
            local Not_Stats = not Stats;
            -- false
            local DMG = Stats:FindFirstChild("DMG");
            local Not_DMG = not DMG;
            -- false
            local TextLabel_5 = DMG:IsA("TextLabel");
            if not Paragraph then return end -- won't run
            -- local _ = var128 or (unknown_value)
            local Set_3 = Paragraph.Set;
            local Set_4 = Paragraph:Set({
                Title = "Pickaxe Info",
                Content = "Name: Name_9\nDamage: 0",
            });
            local var130 = wait(0.5);
            local Character_6 = LocalPlayer.Character;
            -- local _ = Character_6 or (unknown_value)
            local HumanoidRootPart_5 = Character_6:WaitForChild("HumanoidRootPart");
            local Position_7 = HumanoidRootPart_5.Position;
            local var131 = (HumanoidRootPart_5 and Position_7); -- Position_7
            local var132 = tonumber(p1_0, nil);
            -- no value
            local var133 = (var132 or 500);
            local Rocks_5 = workspace:FindFirstChild("Rocks");
            local Not_Rocks_5 = not Rocks_5;
            -- false
            local var134 = var132 * var132;
            local var135 = (var132 and var134); -- var134
            local Children_10 = Rocks_3:GetChildren();
            for i_11, v_11 in ipairs(Children_10) do
                local GetChildren_3 = v_11.GetChildren;
                local Children_11 = v_11:GetChildren();
                for i_12, v_12 in ipairs(Children_11) do
                    local Not_V_12 = not v_12;
                    -- false
                    local Parent_11 = v_12.Parent;
                    local Not_Parent_11 = not Parent_11;
                    -- false
                    local var135 = (Not_V_12 or Not_Parent_11); -- false
                    local IsA_10 = v_12.IsA;
                    local BasePart_5 = v_12:IsA("BasePart");
                    local var136 = (BasePart_5 and v_12); -- v_12
                    -- local _ = var136 or (unknown_value)
                    -- local _ = v_12 or (unknown_value)
                    -- local _ = v_12 or (unknown_value)
                    local Not_V_12_2 = not v_12;
                    -- false
                    -- local _ = var135 and (unknown_value)
                    local Not_V_12_3 = not v_12;
                    -- false
                    local Parent_12 = v_12.Parent;
                    local Not_Parent_12 = not Parent_12;
                    -- false
                    local var137 = (Not_V_12_3 or Not_Parent_12); -- false
                    local Not_V_12_4 = not v_12;
                    -- false
                    local GetAttribute_9 = v_12.GetAttribute;
                    local Health_3 = v_12:GetAttribute("Health");
                    local Health_3_Is_Nil = (Health_3 == nil);
                    -- false, eq id 21
                    local Health_3_Is_Nil_2 = (Health_3 == nil);
                    -- false, eq id 22
                    local var138 = tonumber(Health_3, nil);
                    -- no value
                    local Var138_Exists = (var138 ~= nil);
                    -- false, eq id 23
                    local FindFirstChild_6 = v_12.FindFirstChild;
                    local Boulder_3 = v_12:FindFirstChild("Boulder");
                    local Not_Boulder_3 = not Boulder_3;
                    -- false
                    local Not_Boulder_3_2 = not Boulder_3;
                    -- false
                    if not Boulder_3 then return end -- won't run
                    local GetAttribute_10 = v_12.GetAttribute;
                    local RockType_3 = v_12:GetAttribute("RockType");
                    -- local _ = RockType_3 or (unknown_value)
                    -- local _ = RockType_3 or (unknown_value)
                    -- local _ = RockType_3 or (unknown_value)
                    local GetAttribute_11 = v_12.GetAttribute;
                    local RequiredDamage_3 = v_12:GetAttribute("RequiredDamage");
                    local var139 = tonumber(RequiredDamage_3, nil);
                    -- no value
                    local Not_Var139 = not var139;
                    -- false
                end
            end
            if not var131 then return end -- won't run
            local Not_V_12_5 = not v_12;
            -- false
            local Parent_13 = v_12.Parent;
            local Not_Parent_13 = not Parent_13;
            -- false
            local var140 = (Not_V_12_5 or Not_Parent_13); -- false
            local IsA_11 = v_12.IsA;
            local BasePart_6 = v_12:IsA("BasePart");
            local var141 = (v_12 and BasePart_6); -- BasePart_6
            local Not_Var141 = not var141;
            -- false
            local Highlight_3 = Instance.new("Highlight");
            local Color3_Value_25 = Color3_FromRGB(0, 255, 200);
            Highlight_3.FillColor = Color3_Value_25;
            local Color3_Value_26 = Color3_FromRGB(255, 255, 0);
            Highlight_3.OutlineColor = Color3_Value_26;
            Highlight_3.FillTransparency = 0.2;
            Highlight_3.OutlineTransparency = 0;
            local AlwaysOnTop_3 = Enum_HighlightDepthMode.AlwaysOnTop;
            Highlight_3.DepthMode = AlwaysOnTop_3;
            Highlight_3.Enabled = true;
            local Not_Boulder_3_3 = not Boulder_3;
            -- false
            local Parent_14 = Boulder_3.Parent;
            local Not_Parent_14 = not Parent_14;
            -- false
            local var143 = (Not_Boulder_3_3 or Not_Parent_14); -- false
            Highlight_3.Adornee = Boulder_3;
            Highlight_3.Parent = workspace;
            local Attachment_5 = Instance.new("Attachment");
            Attachment_5.Parent = v_12;
            local Vector3_Value_7 = Vector3_New(0, 2, 0);
            Attachment_5.Position = Vector3_Value_7;
            local Attachment_6 = Instance.new("Attachment");
            Attachment_6.Parent = v_12;
            local Vector3_Value_8 = Vector3_New(0, 20, 0);
            Attachment_6.Position = Vector3_Value_8;
            local Beam_3 = Instance.new("Beam");
            Beam_3.Attachment0 = Attachment_5;
            Beam_3.Attachment1 = Attachment_6;
            local Color3_Value_27 = Color3_FromRGB(0, 255, 200);
            local ColorSequenceKeypoint_Value_11 = ColorSequenceKeypoint_New(0, Color3_Value_27);
            local Color3_Value_28 = Color3_FromRGB(100, 200, 255);
            local ColorSequenceKeypoint_Value_12 = ColorSequenceKeypoint_New(0.5, Color3_Value_28);
            local Color3_Value_29 = Color3_FromRGB(255, 100, 255);
            local ColorSequenceKeypoint_Value_13 = ColorSequenceKeypoint_New(1, Color3_Value_29);
            local ColorSequence_Value_5 = ColorSequence_New({
                ColorSequenceKeypoint_Value_11,
                ColorSequenceKeypoint_Value_12,
                ColorSequenceKeypoint_Value_13,
            });
            Beam_3.Color = ColorSequence_Value_5;
            local NumberSequenceKeypoint_Value_7 = NumberSequenceKeypoint_New(0, 0.3);
            local NumberSequenceKeypoint_Value_8 = NumberSequenceKeypoint_New(0.5, 0.1);
            local NumberSequenceKeypoint_Value_9 = NumberSequenceKeypoint_New(1, 0.8);
            local NumberSequence_Value_3 = NumberSequence_New({
                NumberSequenceKeypoint_Value_7,
                NumberSequenceKeypoint_Value_8,
                NumberSequenceKeypoint_Value_9,
            });
            Beam_3.Transparency = NumberSequence_Value_3;
            Beam_3.Width0 = 0.5;
            Beam_3.Width1 = 2;
            Beam_3.FaceCamera = true;
            Beam_3.LightEmission = 1;
            Beam_3.LightInfluence = 0;
            Beam_3.Texture = "rbxasset://textures/particles/sparkles_main.dds";
            local Wrap_3 = Enum_TextureMode.Wrap;
            Beam_3.TextureMode = Wrap_3;
            Beam_3.TextureSpeed = 1;
            Beam_3.Parent = v_12;
            local BillboardGui_3 = Instance.new("BillboardGui");
            local UDim2_Value_13 = UDim2_New(0, 150, 0, 50);
            BillboardGui_3.Size = UDim2_Value_13;
            BillboardGui_3.Adornee = v_12;
            BillboardGui_3.AlwaysOnTop = true;
            BillboardGui_3.MaxDistance = 1000;
            local Vector3_Value_9 = Vector3_New(0, 5, 0);
            BillboardGui_3.StudsOffset = Vector3_Value_9;
            BillboardGui_3.Parent = v_12;
            local Frame_6 = Instance.new("Frame");
            local UDim2_Value_14 = UDim2_New(1, 0, 1, 0);
            Frame_6.Size = UDim2_Value_14;
            local Color3_Value_30 = Color3_FromRGB(20, 20, 30);
            Frame_6.BackgroundColor3 = Color3_Value_30;
            Frame_6.BackgroundTransparency = 0.3;
            Frame_6.BorderSizePixel = 0;
            Frame_6.Parent = BillboardGui_3;
            local UICorner_3 = Instance.new("UICorner");
            local UDim_Value_3 = UDim_New(0, 8);
            UICorner_3.CornerRadius = UDim_Value_3;
            UICorner_3.Parent = Frame_6;
            local UIGradient_3 = Instance.new("UIGradient");
            local Color3_Value_31 = Color3_FromRGB(50, 50, 80);
            local ColorSequenceKeypoint_Value_14 = ColorSequenceKeypoint_New(0, Color3_Value_31);
            local Color3_Value_32 = Color3_FromRGB(20, 20, 40);
            local ColorSequenceKeypoint_Value_15 = ColorSequenceKeypoint_New(1, Color3_Value_32);
            local ColorSequence_Value_6 = ColorSequence_New({
                ColorSequenceKeypoint_Value_14,
                ColorSequenceKeypoint_Value_15,
            });
            UIGradient_3.Color = ColorSequence_Value_6;
            UIGradient_3.Rotation = 90;
            UIGradient_3.Parent = Frame_6;
            local UIStroke_3 = Instance.new("UIStroke");
            local Color3_Value_33 = Color3_FromRGB(0, 255, 200);
            UIStroke_3.Color = Color3_Value_33;
            UIStroke_3.Thickness = 2;
            UIStroke_3.Transparency = 0;
            UIStroke_3.Parent = Frame_6;
            local TextLabel_6 = Instance.new("TextLabel");
            local UDim2_Value_15 = UDim2_New(1, -10, 0.6, 0);
            TextLabel_6.Size = UDim2_Value_15;
            local UDim2_Value_16 = UDim2_New(0, 5, 0.1, 0);
            TextLabel_6.Position = UDim2_Value_16;
            TextLabel_6.BackgroundTransparency = 1;
            local var145 = tostring(RockType_3);
            local var146 = "⛏️ " .. var145;
            -- "⛏️ RockType_3"
            TextLabel_6.Text = var146;
            local Color3_Value_34 = Color3_FromRGB(255, 255, 255);
            TextLabel_6.TextColor3 = Color3_Value_34;
            TextLabel_6.TextStrokeTransparency = 0.5;
            local Color3_Value_35 = Color3_FromRGB(0, 0, 0);
            TextLabel_6.TextStrokeColor3 = Color3_Value_35;
            TextLabel_6.TextScaled = true;
            local GothamBold_3 = Enum_Font.GothamBold;
            TextLabel_6.Font = GothamBold_3;
            TextLabel_6.Parent = Frame_6;
            local TextLabel_7 = Instance.new("TextLabel");
            local UDim2_Value_17 = UDim2_New(1, -10, 0.3, 0);
            TextLabel_7.Size = UDim2_Value_17;
            local UDim2_Value_18 = UDim2_New(0, 5, 0.65, 0);
            TextLabel_7.Position = UDim2_Value_18;
            TextLabel_7.BackgroundTransparency = 1;
            TextLabel_7.Text = "...";
            local Color3_Value_36 = Color3_FromRGB(100, 255, 200);
            TextLabel_7.TextColor3 = Color3_Value_36;
            TextLabel_7.TextStrokeTransparency = 0.5;
            TextLabel_7.TextScaled = true;
            local Gotham_3 = Enum_Font.Gotham;
            TextLabel_7.Font = Gotham_3;
            TextLabel_7.Parent = Frame_6;
            if not HumanoidRootPart_5 then return end -- won't run
            local var149 = (TextLabel_7 and v_12); -- v_12
            local Parent_15 = v_12.Parent;
            local var150 = (var149 and Parent_15); -- Parent_15
            if not var150 then return end -- won't run
            local Position_8 = v_12.Position;
            local Position_9 = HumanoidRootPart_5.Position;
            local var151 = Position_8 - Position_9;
            local Magnitude_3 = var151.Magnitude;
            local var152 = string.format("%.0f studs", Magnitude_3);
            TextLabel_7.Text = var152;
            if not Highlight_2 then return end -- won't run
            local Destroy_5 = Highlight_2:Destroy();
            if not BillboardGui_2 then return end -- won't run
            local Destroy_6 = BillboardGui_2:Destroy();
            if not Beam_2 then return end -- won't run
            local Destroy_7 = Beam_2:Destroy();
            if not Attachment_3 then return end -- won't run
            local Destroy_8 = Attachment_3:Destroy();
            local Living_3 = workspace:FindFirstChild("Living");
            local Not_Living_3 = not Living_3;
            -- false
            local Children_12 = Living:GetChildren();
            for i_13, v_13 in ipairs(Children_12) do
                local IsA_12 = v_13.IsA;
                local Model_3 = v_13:IsA("Model");
                if not Model_3 then return end -- won't run
                local Not_V_13 = not v_13;
                -- false
                local FindFirstChild_7 = v_13.FindFirstChild;
                local Dead_3 = v_13:FindFirstChild("Dead", true);
                local IsA_13 = Dead_3.IsA;
                local BoolValue_3 = Dead_3:IsA("BoolValue");
                local var152 = (Dead_3 and BoolValue_3); -- BoolValue_3
                if not var152 then return end -- won't run
                local Value_3 = Dead_3.Value;
                local Name_10 = v_13.Name;
                local var153 = tostring(Name_10);
                local Gsub_3 = var153.gsub;
            end
            local Character_7 = LocalPlayer.Character;
            -- local _ = Character_7 or (unknown_value)
            local HumanoidRootPart_6 = Character_7:WaitForChild("HumanoidRootPart");
            if not HumanoidRootPart_6 then return end -- won't run
            local Character_8 = LocalPlayer.Character;
            -- local _ = Character_8 or (unknown_value)
            local Children_13 = Character_8:GetChildren();
            for i_14, v_14 in ipairs(Children_13) do
                local IsA_14 = v_14.IsA;
                local Tool_2 = v_14:IsA("Tool");
                local GetAttribute_12 = v_14.GetAttribute;
                local ItemJSON_3 = v_14:GetAttribute("ItemJSON");
                local var154 = (Tool_2 and ItemJSON_3); -- ItemJSON_3
                if not var154 then return end -- won't run
                local Not_V_14 = not v_14;
                -- false
                local Not_V_14_2 = not v_14;
                -- false
                local GetAttribute_13 = v_14.GetAttribute;
                local ItemJSON_4 = v_14:GetAttribute("ItemJSON");
                local var155 = typeof(ItemJSON_4);
                local var155_isnt_string = (var155 ~= "string");
                -- false, eq id 24
                local var156 = (ItemJSON_4 == "");
                -- false, eq id 25
                local var157 = (var155_isnt_string or var156); -- false
                local JSONDecode_2 = HttpService:JSONDecode(ItemJSON_4);
                local var158 = typeof(JSONDecode_2);
                local var158_isnt_string = (var158 ~= "table");
                -- false, eq id 26
                local Name_11 = JSONDecode_2.Name;
                -- local _ = Name_11 or (unknown_value)
                local var159 = tostring(Name_11);
                local PlayerGui_2 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_2 = not PlayerGui_2;
                -- false
                local Menu_2 = PlayerGui:FindFirstChild("Menu");
                local Not_Menu_2 = not Menu_2;
                -- false
                local Frame_7 = Menu:FindFirstChild("Frame");
                local Not_Frame_7 = not Frame_7;
                -- false
                local Frame_8 = Frame_3:FindFirstChild("Frame");
                local Not_Frame_8 = not Frame_8;
                -- false
                local Menus_2 = Frame_4:FindFirstChild("Menus");
                local Not_Menus_2 = not Menus_2;
                -- false
                local Tools_2 = Menus:FindFirstChild("Tools");
                local Not_Tools_2 = not Tools_2;
                -- false
                local Frame_9 = Tools:FindFirstChild("Frame");
                local Not_Frame_9 = not Frame_9;
                -- false
                local FindFirstChild_8 = Frame_5:FindFirstChild(var159);
                local Not_FindFirstChild_8 = not FindFirstChild_8;
                -- true
                if not Not_FindFirstChild_8 then return end -- won't run
                local var160 = wait(0.5);
                local Character_9 = LocalPlayer.Character;
                -- local _ = Character_9 or (unknown_value)
                local HumanoidRootPart_7 = Character_9:WaitForChild("HumanoidRootPart");
                local Position_10 = HumanoidRootPart_7.Position;
                local var161 = (HumanoidRootPart_7 and Position_10); -- Position_10
                local var162 = tonumber(p1_0, nil);
                -- no value
                local var163 = (var162 or 500);
                local Rocks_6 = workspace:FindFirstChild("Rocks");
                local Not_Rocks_6 = not Rocks_6;
                -- false
                local var164 = var162 * var162;
                local var165 = (var162 and var164); -- var164
                local Children_14 = Rocks_3:GetChildren();
                for i_15, v_15 in ipairs(Children_14) do
                    local GetChildren_4 = v_15.GetChildren;
                    local Children_15 = v_15:GetChildren();
                    for i_16, v_16 in ipairs(Children_15) do
                        local Not_V_16 = not v_16;
                        -- false
                        local Parent_16 = v_16.Parent;
                        local Not_Parent_16 = not Parent_16;
                        -- false
                        local var165 = (Not_V_16 or Not_Parent_16); -- false
                        local IsA_15 = v_16.IsA;
                        local BasePart_7 = v_16:IsA("BasePart");
                        local var166 = (BasePart_7 and v_16); -- v_16
                        -- local _ = var166 or (unknown_value)
                        -- local _ = v_16 or (unknown_value)
                        -- local _ = v_16 or (unknown_value)
                        local Not_V_16_2 = not v_16;
                        -- false
                        -- local _ = var165 and (unknown_value)
                        local Not_V_16_3 = not v_16;
                        -- false
                        local Parent_17 = v_16.Parent;
                        local Not_Parent_17 = not Parent_17;
                        -- false
                        local var167 = (Not_V_16_3 or Not_Parent_17); -- false
                        local Not_V_16_4 = not v_16;
                        -- false
                        local GetAttribute_14 = v_16.GetAttribute;
                        local Health_4 = v_16:GetAttribute("Health");
                        local Health_4_Is_Nil = (Health_4 == nil);
                        -- false, eq id 27
                        local Health_4_Is_Nil_2 = (Health_4 == nil);
                        -- false, eq id 28
                        local var168 = tonumber(Health_4, nil);
                        -- no value
                        local Var168_Exists = (var168 ~= nil);
                        -- false, eq id 29
                        local FindFirstChild_9 = v_16.FindFirstChild;
                        local Boulder_4 = v_16:FindFirstChild("Boulder");
                        local Not_Boulder_4 = not Boulder_4;
                        -- false
                        local Not_Boulder_4_2 = not Boulder_4;
                        -- false
                        if not Boulder_4 then return end -- won't run
                        local GetAttribute_15 = v_16.GetAttribute;
                        local RockType_4 = v_16:GetAttribute("RockType");
                        -- local _ = RockType_4 or (unknown_value)
                        -- local _ = RockType_4 or (unknown_value)
                        -- local _ = RockType_4 or (unknown_value)
                        local GetAttribute_16 = v_16.GetAttribute;
                        local RequiredDamage_4 = v_16:GetAttribute("RequiredDamage");
                        local var169 = tonumber(RequiredDamage_4, nil);
                        -- no value
                        local Not_Var169 = not var169;
                        -- false
                    end
                end
                if not var161 then return end -- won't run
                local Not_V_16_5 = not v_16;
                -- false
                local Parent_18 = v_16.Parent;
                local Not_Parent_18 = not Parent_18;
                -- false
                local var170 = (Not_V_16_5 or Not_Parent_18); -- false
                local IsA_16 = v_16.IsA;
                local BasePart_8 = v_16:IsA("BasePart");
                local var171 = (v_16 and BasePart_8); -- BasePart_8
                local Not_Var171 = not var171;
                -- false
                local Highlight_4 = Instance.new("Highlight");
                local Color3_Value_37 = Color3_FromRGB(0, 255, 200);
                Highlight_4.FillColor = Color3_Value_37;
                local Color3_Value_38 = Color3_FromRGB(255, 255, 0);
                Highlight_4.OutlineColor = Color3_Value_38;
                Highlight_4.FillTransparency = 0.2;
                Highlight_4.OutlineTransparency = 0;
                local AlwaysOnTop_4 = Enum_HighlightDepthMode.AlwaysOnTop;
                Highlight_4.DepthMode = AlwaysOnTop_4;
                Highlight_4.Enabled = true;
                local Not_Boulder_4_3 = not Boulder_4;
                -- false
                local Parent_19 = Boulder_4.Parent;
                local Not_Parent_19 = not Parent_19;
                -- false
                local var173 = (Not_Boulder_4_3 or Not_Parent_19); -- false
                Highlight_4.Adornee = Boulder_4;
                Highlight_4.Parent = workspace;
                local Attachment_7 = Instance.new("Attachment");
                Attachment_7.Parent = v_16;
                local Vector3_Value_10 = Vector3_New(0, 2, 0);
                Attachment_7.Position = Vector3_Value_10;
                local Attachment_8 = Instance.new("Attachment");
                Attachment_8.Parent = v_16;
                local Vector3_Value_11 = Vector3_New(0, 20, 0);
                Attachment_8.Position = Vector3_Value_11;
                local Beam_4 = Instance.new("Beam");
                Beam_4.Attachment0 = Attachment_7;
                Beam_4.Attachment1 = Attachment_8;
                local Color3_Value_39 = Color3_FromRGB(0, 255, 200);
                local ColorSequenceKeypoint_Value_16 = ColorSequenceKeypoint_New(0, Color3_Value_39);
                local Color3_Value_40 = Color3_FromRGB(100, 200, 255);
                local ColorSequenceKeypoint_Value_17 = ColorSequenceKeypoint_New(0.5, Color3_Value_40);
                local Color3_Value_41 = Color3_FromRGB(255, 100, 255);
                local ColorSequenceKeypoint_Value_18 = ColorSequenceKeypoint_New(1, Color3_Value_41);
                local ColorSequence_Value_7 = ColorSequence_New({
                    ColorSequenceKeypoint_Value_16,
                    ColorSequenceKeypoint_Value_17,
                    ColorSequenceKeypoint_Value_18,
                });
                Beam_4.Color = ColorSequence_Value_7;
                local NumberSequenceKeypoint_Value_10 = NumberSequenceKeypoint_New(0, 0.3);
                local NumberSequenceKeypoint_Value_11 = NumberSequenceKeypoint_New(0.5, 0.1);
                local NumberSequenceKeypoint_Value_12 = NumberSequenceKeypoint_New(1, 0.8);
                local NumberSequence_Value_4 = NumberSequence_New({
                    NumberSequenceKeypoint_Value_10,
                    NumberSequenceKeypoint_Value_11,
                    NumberSequenceKeypoint_Value_12,
                });
                Beam_4.Transparency = NumberSequence_Value_4;
                Beam_4.Width0 = 0.5;
                Beam_4.Width1 = 2;
                Beam_4.FaceCamera = true;
                Beam_4.LightEmission = 1;
                Beam_4.LightInfluence = 0;
                Beam_4.Texture = "rbxasset://textures/particles/sparkles_main.dds";
                local Wrap_4 = Enum_TextureMode.Wrap;
                Beam_4.TextureMode = Wrap_4;
                Beam_4.TextureSpeed = 1;
                Beam_4.Parent = v_16;
                local BillboardGui_4 = Instance.new("BillboardGui");
                local UDim2_Value_19 = UDim2_New(0, 150, 0, 50);
                BillboardGui_4.Size = UDim2_Value_19;
                BillboardGui_4.Adornee = v_16;
                BillboardGui_4.AlwaysOnTop = true;
                BillboardGui_4.MaxDistance = 1000;
                local Vector3_Value_12 = Vector3_New(0, 5, 0);
                BillboardGui_4.StudsOffset = Vector3_Value_12;
                BillboardGui_4.Parent = v_16;
                local Frame_10 = Instance.new("Frame");
                local UDim2_Value_20 = UDim2_New(1, 0, 1, 0);
                Frame_10.Size = UDim2_Value_20;
                local Color3_Value_42 = Color3_FromRGB(20, 20, 30);
                Frame_10.BackgroundColor3 = Color3_Value_42;
                Frame_10.BackgroundTransparency = 0.3;
                Frame_10.BorderSizePixel = 0;
                Frame_10.Parent = BillboardGui_4;
                local UICorner_4 = Instance.new("UICorner");
                local UDim_Value_4 = UDim_New(0, 8);
                UICorner_4.CornerRadius = UDim_Value_4;
                UICorner_4.Parent = Frame_10;
                local UIGradient_4 = Instance.new("UIGradient");
                local Color3_Value_43 = Color3_FromRGB(50, 50, 80);
                local ColorSequenceKeypoint_Value_19 = ColorSequenceKeypoint_New(0, Color3_Value_43);
                local Color3_Value_44 = Color3_FromRGB(20, 20, 40);
                local ColorSequenceKeypoint_Value_20 = ColorSequenceKeypoint_New(1, Color3_Value_44);
                local ColorSequence_Value_8 = ColorSequence_New({
                    ColorSequenceKeypoint_Value_19,
                    ColorSequenceKeypoint_Value_20,
                });
                UIGradient_4.Color = ColorSequence_Value_8;
                UIGradient_4.Rotation = 90;
                UIGradient_4.Parent = Frame_10;
                local UIStroke_4 = Instance.new("UIStroke");
                local Color3_Value_45 = Color3_FromRGB(0, 255, 200);
                UIStroke_4.Color = Color3_Value_45;
                UIStroke_4.Thickness = 2;
                UIStroke_4.Transparency = 0;
                UIStroke_4.Parent = Frame_10;
                local TextLabel_8 = Instance.new("TextLabel");
                local UDim2_Value_21 = UDim2_New(1, -10, 0.6, 0);
                TextLabel_8.Size = UDim2_Value_21;
                local UDim2_Value_22 = UDim2_New(0, 5, 0.1, 0);
                TextLabel_8.Position = UDim2_Value_22;
                TextLabel_8.BackgroundTransparency = 1;
                local var175 = tostring(RockType_4);
                local var176 = "⛏️ " .. var175;
                -- "⛏️ RockType_4"
                TextLabel_8.Text = var176;
                local Color3_Value_46 = Color3_FromRGB(255, 255, 255);
                TextLabel_8.TextColor3 = Color3_Value_46;
                TextLabel_8.TextStrokeTransparency = 0.5;
                local Color3_Value_47 = Color3_FromRGB(0, 0, 0);
                TextLabel_8.TextStrokeColor3 = Color3_Value_47;
                TextLabel_8.TextScaled = true;
                local GothamBold_4 = Enum_Font.GothamBold;
                TextLabel_8.Font = GothamBold_4;
                TextLabel_8.Parent = Frame_10;
                local TextLabel_9 = Instance.new("TextLabel");
                local UDim2_Value_23 = UDim2_New(1, -10, 0.3, 0);
                TextLabel_9.Size = UDim2_Value_23;
                local UDim2_Value_24 = UDim2_New(0, 5, 0.65, 0);
                TextLabel_9.Position = UDim2_Value_24;
                TextLabel_9.BackgroundTransparency = 1;
                TextLabel_9.Text = "...";
                local Color3_Value_48 = Color3_FromRGB(100, 255, 200);
                TextLabel_9.TextColor3 = Color3_Value_48;
                TextLabel_9.TextStrokeTransparency = 0.5;
                TextLabel_9.TextScaled = true;
                local Gotham_4 = Enum_Font.Gotham;
                TextLabel_9.Font = Gotham_4;
                TextLabel_9.Parent = Frame_10;
                if not HumanoidRootPart_7 then return end -- won't run
                if not Highlight_3 then return end -- won't run
                local Destroy_9 = Highlight_3:Destroy();
                if not BillboardGui_3 then return end -- won't run
                local Destroy_10 = BillboardGui_3:Destroy();
                if not Beam_3 then return end -- won't run
                local Destroy_11 = Beam_3:Destroy();
                if not Attachment_5 then return end -- won't run
                local Destroy_12 = Attachment_5:Destroy();
                local var179 = (TextLabel_9 and v_16); -- v_16
                local Parent_20 = v_16.Parent;
                local var180 = (var179 and Parent_20); -- Parent_20
                if not var180 then return end -- won't run
                local Position_11 = v_16.Position;
                local Position_12 = HumanoidRootPart_7.Position;
                local var181 = Position_11 - Position_12;
                local Magnitude_4 = var181.Magnitude;
                local var182 = string.format("%.0f studs", Magnitude_4);
                TextLabel_9.Text = var182;
                local Living_4 = workspace:FindFirstChild("Living");
                local Not_Living_4 = not Living_4;
                -- false
                local Children_16 = Living:GetChildren();
                for i_17, v_17 in ipairs(Children_16) do
                    local IsA_17 = v_17.IsA;
                    local Model_4 = v_17:IsA("Model");
                    if not Model_4 then return end -- won't run
                    local Not_V_17 = not v_17;
                    -- false
                    local FindFirstChild_10 = v_17.FindFirstChild;
                    local Dead_4 = v_17:FindFirstChild("Dead", true);
                    local IsA_18 = Dead_4.IsA;
                    local BoolValue_4 = Dead_4:IsA("BoolValue");
                    local var182 = (Dead_4 and BoolValue_4); -- BoolValue_4
                    if not var182 then return end -- won't run
                    local Value_4 = Dead_4.Value;
                    local Name_12 = v_17.Name;
                    local var183 = tostring(Name_12);
                    local Gsub_4 = var183.gsub;
                end
                local Character_10 = LocalPlayer.Character;
                -- local _ = Character_10 or (unknown_value)
                local HumanoidRootPart_8 = Character_10:WaitForChild("HumanoidRootPart");
                if not HumanoidRootPart_8 then return end -- won't run
                local Character_11 = LocalPlayer.Character;
                -- local _ = Character_11 or (unknown_value)
                local Children_17 = Character_11:GetChildren();
                for i_18, v_18 in ipairs(Children_17) do
                    local IsA_19 = v_18.IsA;
                    local Tool_3 = v_18:IsA("Tool");
                    local GetAttribute_17 = v_18.GetAttribute;
                    local ItemJSON_5 = v_18:GetAttribute("ItemJSON");
                    local var184 = (Tool_3 and ItemJSON_5); -- ItemJSON_5
                    if not var184 then return end -- won't run
                    local Not_V_18 = not v_18;
                    -- false
                    local Not_V_18_2 = not v_18;
                    -- false
                    local GetAttribute_18 = v_18.GetAttribute;
                    local ItemJSON_6 = v_18:GetAttribute("ItemJSON");
                    local var185 = typeof(ItemJSON_6);
                    local var185_isnt_string = (var185 ~= "string");
                    -- false, eq id 30
                    local var186 = (ItemJSON_6 == "");
                    -- false, eq id 31
        error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")
                end
            end
        end

    end);
    local CreateTab_2 = Window.CreateTab;
    local Auto_Forge = Window:CreateTab("Auto Forge", 4483362458);
    local CreateSection_4 = Auto_Forge.CreateSection;
    local Status = Auto_Forge:CreateSection("Status");
    local CreateParagraph_2 = Auto_Forge.CreateParagraph;
    local Paragraph_2 = Auto_Forge:CreateParagraph({
        Title = "Status",
        Content = "Idle",
    });
    local Success_28, Error_Message_28 = pcall(function(...)
        local FormArrayFromNames = Utils_Module.FormArrayFromNames;
        local _call29 = FormArrayFromNames(Ore_Module);
    end) -- true, _call29
    local var30 = typeof(_call29);
    local var30_is_string = (var30 == "table");
    -- true, eq id 4
    for i_2, v_2 in ipairs(_call29) do
        local var30 = typeof(v_2);
        local var30_is_string_2 = (var30 == "string");
        -- true, eq id 5
        if not var30_is_string_2 then return end -- won't run
        local Array_2 = {};
        local var31 = table.insert(Array_2, v_2);
    end
    local Len_Array_2 = #Array_2;
    -- 0
    local var32 = (Len_Array_2 > 0); -- false
    local CreateDropdown_4 = Auto_Forge.CreateDropdown;
    local Dropdown_4 = Auto_Forge:CreateDropdown({
        Name = "Item Type",
        CurrentOption = {
            "Weapon",
        },
        Flag = "AutoForge_ItemType",
        MultipleOptions = false,
        Callback = function(p1_0)
            local var187 = typeof(p1_0);
            local var187_is_string = (var187 == "table");
            -- true, eq id 32
            local var188 = p1_0[1];
            local var189 = (var187_is_string and var188); -- var188
            -- local _ = var189 or (unknown_value)
            local var188_is_string = (var188 == "Weapon");
            -- false, eq id 33
            local var188_is_string_2 = (var188 == "Armor");
            -- false, eq id 34
            local var190 = (var188_is_string or var188_is_string_2); -- false

        end,
        Options = {
            "Weapon",
            "Armor",
        },
    });
    local CreateDropdown_5 = Auto_Forge.CreateDropdown;
    local Dropdown_5 = Auto_Forge:CreateDropdown({
        Name = "Ores to Use",
        MultipleOptions = true,
        Flag = "AutoForge_Ores",
        CurrentOption = {},
        Callback = function(p1_0)
            local var191 = typeof(p1_0);
            local var191_is_string = (var191 == "table");
            -- true, eq id 35
            local Len_P1_0_4 = #p1_0;
            local var192 = (Len_P1_0_4 > 0); -- nil
            local var193 = (var191_is_string and var192); -- nil

        end,
        Options = Array_2,
    });
    local CreateSlider_6 = Auto_Forge.CreateSlider;
    local Slider_6 = Auto_Forge:CreateSlider({
        Name = "Ores Per Forge",
        Callback = function(p1_0)
            local var194 = math.floor(p1_0);

        end,
        CurrentValue = 3,
        Increment = 1,
        Range = {
            3,
            10,
        },
        Flag = "AutoForge_OresPerForge",
    });
    local CreateToggle_5 = Auto_Forge.CreateToggle;
    local Toggle_5 = Auto_Forge:CreateToggle({
        CurrentValue = true,
        Callback = function(p1_0)

        end,
        Name = "Auto Complete Minigames",
        Flag = "AutoForge_AutoMinigames",
    });
    local CreateToggle_6 = Auto_Forge.CreateToggle;
    local Toggle_6 = Auto_Forge:CreateToggle({
        CurrentValue = false,
        Callback = function(p1_0)
            if not p1_0 then return end -- won't run
            if not Paragraph_2 then return end -- won't run
            local Set_5 = Paragraph_2.Set;
            local Set_6 = Paragraph_2:Set({
                Title = "Status",
                Content = "Starting auto forge...",
            });
            print("[Auto Forge]", "Starting auto forge...") -- [Auto Forge] Starting auto forge...
            local Spawned_5 = task.spawn(function()
                local Success_51, Error_Message_51 = pcall(function(...)
                    local GetController = Knit_Module.GetController;
                    local _call538 = GetController("UIController");
                end) -- true, _call538
                local Success_52, Error_Message_52 = pcall(function(...)
                    local GetController_2 = Knit_Module.GetController;
                    local _call539 = GetController_2("ForgeController");
                end) -- true, _call539
                local Success_53, Error_Message_53 = pcall(function(...)
                    local GetController_3 = Knit_Module.GetController;
                    local _call540 = GetController_3("PlayerController");
                end) -- true, _call540
                local var541 = (_call538 and _call539); -- _call539
                local var542 = (var541 and _call540); -- _call540
                if not var542 then return end -- won't run
                local Replica = _call540.Replica;
                local Modules = _call538.Modules;
                local Modules_2 = _call538.Modules;
                local Forge = Modules_2.Forge;
                local var543 = (Modules and Forge); -- Forge
                local var544 = (_call539 and var543); -- Forge
                local var545 = (var544 and _call538); -- _call538
                local var546 = (var545 and Replica); -- Replica
                local Not_Var546 = not var546;
                -- false
                local PlayerGui_7 = _call538.PlayerGui;
                local WaitForChild_5 = PlayerGui_7.WaitForChild;
                local Forge_2 = PlayerGui_7:WaitForChild("Forge", 5);
                local Not_Forge_2 = not Forge_2;
                -- false
                local ForgeActive = _call539.ForgeActive;
                local Not_ForgeActive = not ForgeActive;
                -- false
                if not Paragraph_2 then return end -- won't run
                local Set_9 = Paragraph_2.Set;
                local Set_10 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #1...",
                });
                print("[Auto Forge]", "Starting cycle #1...") -- [Auto Forge] Starting cycle #1...
                local Data_2 = Replica.Data;
                local var548 = (Replica and Data_2); -- Data_2
                local Data_3 = Replica.Data;
                local Inventory = Data_3.Inventory;
                local var549 = (var548 and Inventory); -- Inventory
                local var550 = (var549 or {});
                local var551 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_11 = Paragraph_2.Set;
                local Set_12 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_499 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_13 = Paragraph_2.Set;
                local Set_14 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #2...",
                });
                print("[Auto Forge]", "Starting cycle #2...") -- [Auto Forge] Starting cycle #2...
                local Data_4 = Replica.Data;
                local var554 = (Replica and Data_4); -- Data_4
                local Data_5 = Replica.Data;
                local Inventory_2 = Data_5.Inventory;
                local var555 = (var554 and Inventory_2); -- Inventory_2
                local var556 = (var555 or {});
                local var557 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_15 = Paragraph_2.Set;
                local Set_16 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_500 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_17 = Paragraph_2.Set;
                local Set_18 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #3...",
                });
                print("[Auto Forge]", "Starting cycle #3...") -- [Auto Forge] Starting cycle #3...
                local Data_6 = Replica.Data;
                local var560 = (Replica and Data_6); -- Data_6
                local Data_7 = Replica.Data;
                local Inventory_3 = Data_7.Inventory;
                local var561 = (var560 and Inventory_3); -- Inventory_3
                local var562 = (var561 or {});
                local var563 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_19 = Paragraph_2.Set;
                local Set_20 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_501 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_21 = Paragraph_2.Set;
                local Set_22 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #4...",
                });
                print("[Auto Forge]", "Starting cycle #4...") -- [Auto Forge] Starting cycle #4...
                local Data_8 = Replica.Data;
                local var566 = (Replica and Data_8); -- Data_8
                local Data_9 = Replica.Data;
                local Inventory_4 = Data_9.Inventory;
                local var567 = (var566 and Inventory_4); -- Inventory_4
                local var568 = (var567 or {});
                local var569 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_23 = Paragraph_2.Set;
                local Set_24 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_502 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_25 = Paragraph_2.Set;
                local Set_26 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #5...",
                });
                print("[Auto Forge]", "Starting cycle #5...") -- [Auto Forge] Starting cycle #5...
                local Data_10 = Replica.Data;
                local var572 = (Replica and Data_10); -- Data_10
                local Data_11 = Replica.Data;
                local Inventory_5 = Data_11.Inventory;
                local var573 = (var572 and Inventory_5); -- Inventory_5
                local var574 = (var573 or {});
                local var575 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_27 = Paragraph_2.Set;
                local Set_28 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_503 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_29 = Paragraph_2.Set;
                local Set_30 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #6...",
                });
                print("[Auto Forge]", "Starting cycle #6...") -- [Auto Forge] Starting cycle #6...
                local Data_12 = Replica.Data;
                local var578 = (Replica and Data_12); -- Data_12
                local Data_13 = Replica.Data;
                local Inventory_6 = Data_13.Inventory;
                local var579 = (var578 and Inventory_6); -- Inventory_6
                local var580 = (var579 or {});
                local var581 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_31 = Paragraph_2.Set;
                local Set_32 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_504 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_33 = Paragraph_2.Set;
                local Set_34 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #7...",
                });
                print("[Auto Forge]", "Starting cycle #7...") -- [Auto Forge] Starting cycle #7...
                local Data_14 = Replica.Data;
                local var584 = (Replica and Data_14); -- Data_14
                local Data_15 = Replica.Data;
                local Inventory_7 = Data_15.Inventory;
                local var585 = (var584 and Inventory_7); -- Inventory_7
                local var586 = (var585 or {});
                local var587 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_35 = Paragraph_2.Set;
                local Set_36 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_505 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_37 = Paragraph_2.Set;
                local Set_38 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #8...",
                });
                print("[Auto Forge]", "Starting cycle #8...") -- [Auto Forge] Starting cycle #8...
                local Data_16 = Replica.Data;
                local var590 = (Replica and Data_16); -- Data_16
                local Data_17 = Replica.Data;
                local Inventory_8 = Data_17.Inventory;
                local var591 = (var590 and Inventory_8); -- Inventory_8
                local var592 = (var591 or {});
                local var593 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_39 = Paragraph_2.Set;
                local Set_40 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_506 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_41 = Paragraph_2.Set;
                local Set_42 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #9...",
                });
                print("[Auto Forge]", "Starting cycle #9...") -- [Auto Forge] Starting cycle #9...
                local Data_18 = Replica.Data;
                local var596 = (Replica and Data_18); -- Data_18
                local Data_19 = Replica.Data;
                local Inventory_9 = Data_19.Inventory;
                local var597 = (var596 and Inventory_9); -- Inventory_9
                local var598 = (var597 or {});
                local var599 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_43 = Paragraph_2.Set;
                local Set_44 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_507 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_45 = Paragraph_2.Set;
                local Set_46 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #10...",
                });
                print("[Auto Forge]", "Starting cycle #10...") -- [Auto Forge] Starting cycle #10...
                local Data_20 = Replica.Data;
                local var602 = (Replica and Data_20); -- Data_20
                local Data_21 = Replica.Data;
                local Inventory_10 = Data_21.Inventory;
                local var603 = (var602 and Inventory_10); -- Inventory_10
                local var604 = (var603 or {});
                local var605 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_47 = Paragraph_2.Set;
                local Set_48 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_508 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_49 = Paragraph_2.Set;
                local Set_50 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #11...",
                });
                print("[Auto Forge]", "Starting cycle #11...") -- [Auto Forge] Starting cycle #11...
                local Data_22 = Replica.Data;
                local var608 = (Replica and Data_22); -- Data_22
                local Data_23 = Replica.Data;
                local Inventory_11 = Data_23.Inventory;
                local var609 = (var608 and Inventory_11); -- Inventory_11
                local var610 = (var609 or {});
                local var611 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_51 = Paragraph_2.Set;
                local Set_52 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_509 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_53 = Paragraph_2.Set;
                local Set_54 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #12...",
                });
                print("[Auto Forge]", "Starting cycle #12...") -- [Auto Forge] Starting cycle #12...
                local Data_24 = Replica.Data;
                local var614 = (Replica and Data_24); -- Data_24
                local Data_25 = Replica.Data;
                local Inventory_12 = Data_25.Inventory;
                local var615 = (var614 and Inventory_12); -- Inventory_12
                local var616 = (var615 or {});
                local var617 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_55 = Paragraph_2.Set;
                local Set_56 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_510 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_57 = Paragraph_2.Set;
                local Set_58 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #13...",
                });
                print("[Auto Forge]", "Starting cycle #13...") -- [Auto Forge] Starting cycle #13...
                local Data_26 = Replica.Data;
                local var620 = (Replica and Data_26); -- Data_26
                local Data_27 = Replica.Data;
                local Inventory_13 = Data_27.Inventory;
                local var621 = (var620 and Inventory_13); -- Inventory_13
                local var622 = (var621 or {});
                local var623 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_59 = Paragraph_2.Set;
                local Set_60 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_511 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_61 = Paragraph_2.Set;
                local Set_62 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #14...",
                });
                print("[Auto Forge]", "Starting cycle #14...") -- [Auto Forge] Starting cycle #14...
                local Data_28 = Replica.Data;
                local var626 = (Replica and Data_28); -- Data_28
                local Data_29 = Replica.Data;
                local Inventory_14 = Data_29.Inventory;
                local var627 = (var626 and Inventory_14); -- Inventory_14
                local var628 = (var627 or {});
                local var629 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_63 = Paragraph_2.Set;
                local Set_64 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_512 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_65 = Paragraph_2.Set;
                local Set_66 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #15...",
                });
                print("[Auto Forge]", "Starting cycle #15...") -- [Auto Forge] Starting cycle #15...
                local Data_30 = Replica.Data;
                local var632 = (Replica and Data_30); -- Data_30
                local Data_31 = Replica.Data;
                local Inventory_15 = Data_31.Inventory;
                local var633 = (var632 and Inventory_15); -- Inventory_15
                local var634 = (var633 or {});
                local var635 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_67 = Paragraph_2.Set;
                local Set_68 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_513 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_69 = Paragraph_2.Set;
                local Set_70 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #16...",
                });
                print("[Auto Forge]", "Starting cycle #16...") -- [Auto Forge] Starting cycle #16...
                local Data_32 = Replica.Data;
                local var638 = (Replica and Data_32); -- Data_32
                local Data_33 = Replica.Data;
                local Inventory_16 = Data_33.Inventory;
                local var639 = (var638 and Inventory_16); -- Inventory_16
                local var640 = (var639 or {});
                local var641 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_71 = Paragraph_2.Set;
                local Set_72 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_514 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_73 = Paragraph_2.Set;
                local Set_74 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #17...",
                });
                print("[Auto Forge]", "Starting cycle #17...") -- [Auto Forge] Starting cycle #17...
                local Data_34 = Replica.Data;
                local var644 = (Replica and Data_34); -- Data_34
                local Data_35 = Replica.Data;
                local Inventory_17 = Data_35.Inventory;
                local var645 = (var644 and Inventory_17); -- Inventory_17
                local var646 = (var645 or {});
                local var647 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_75 = Paragraph_2.Set;
                local Set_76 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_515 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_77 = Paragraph_2.Set;
                local Set_78 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #18...",
                });
                print("[Auto Forge]", "Starting cycle #18...") -- [Auto Forge] Starting cycle #18...
                local Data_36 = Replica.Data;
                local var650 = (Replica and Data_36); -- Data_36
                local Data_37 = Replica.Data;
                local Inventory_18 = Data_37.Inventory;
                local var651 = (var650 and Inventory_18); -- Inventory_18
                local var652 = (var651 or {});
                local var653 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_79 = Paragraph_2.Set;
                local Set_80 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_516 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_81 = Paragraph_2.Set;
                local Set_82 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #19...",
                });
                print("[Auto Forge]", "Starting cycle #19...") -- [Auto Forge] Starting cycle #19...
                local Data_38 = Replica.Data;
                local var656 = (Replica and Data_38); -- Data_38
                local Data_39 = Replica.Data;
                local Inventory_19 = Data_39.Inventory;
                local var657 = (var656 and Inventory_19); -- Inventory_19
                local var658 = (var657 or {});
                local var659 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_83 = Paragraph_2.Set;
                local Set_84 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_517 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_85 = Paragraph_2.Set;
                local Set_86 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #20...",
                });
                print("[Auto Forge]", "Starting cycle #20...") -- [Auto Forge] Starting cycle #20...
                local Data_40 = Replica.Data;
                local var662 = (Replica and Data_40); -- Data_40
                local Data_41 = Replica.Data;
                local Inventory_20 = Data_41.Inventory;
                local var663 = (var662 and Inventory_20); -- Inventory_20
                local var664 = (var663 or {});
                local var665 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_87 = Paragraph_2.Set;
                local Set_88 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_518 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_89 = Paragraph_2.Set;
                local Set_90 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #21...",
                });
                print("[Auto Forge]", "Starting cycle #21...") -- [Auto Forge] Starting cycle #21...
                local Data_42 = Replica.Data;
                local var668 = (Replica and Data_42); -- Data_42
                local Data_43 = Replica.Data;
                local Inventory_21 = Data_43.Inventory;
                local var669 = (var668 and Inventory_21); -- Inventory_21
                local var670 = (var669 or {});
                local var671 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_91 = Paragraph_2.Set;
                local Set_92 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_519 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_93 = Paragraph_2.Set;
                local Set_94 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #22...",
                });
                print("[Auto Forge]", "Starting cycle #22...") -- [Auto Forge] Starting cycle #22...
                local Data_44 = Replica.Data;
                local var674 = (Replica and Data_44); -- Data_44
                local Data_45 = Replica.Data;
                local Inventory_22 = Data_45.Inventory;
                local var675 = (var674 and Inventory_22); -- Inventory_22
                local var676 = (var675 or {});
                local var677 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_95 = Paragraph_2.Set;
                local Set_96 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_520 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_97 = Paragraph_2.Set;
                local Set_98 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #23...",
                });
                print("[Auto Forge]", "Starting cycle #23...") -- [Auto Forge] Starting cycle #23...
                local Data_46 = Replica.Data;
                local var680 = (Replica and Data_46); -- Data_46
                local Data_47 = Replica.Data;
                local Inventory_23 = Data_47.Inventory;
                local var681 = (var680 and Inventory_23); -- Inventory_23
                local var682 = (var681 or {});
                local var683 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_99 = Paragraph_2.Set;
                local Set_100 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_521 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_101 = Paragraph_2.Set;
                local Set_102 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #24...",
                });
                print("[Auto Forge]", "Starting cycle #24...") -- [Auto Forge] Starting cycle #24...
                local Data_48 = Replica.Data;
                local var686 = (Replica and Data_48); -- Data_48
                local Data_49 = Replica.Data;
                local Inventory_24 = Data_49.Inventory;
                local var687 = (var686 and Inventory_24); -- Inventory_24
                local var688 = (var687 or {});
                local var689 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_103 = Paragraph_2.Set;
                local Set_104 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_522 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_105 = Paragraph_2.Set;
                local Set_106 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #25...",
                });
                print("[Auto Forge]", "Starting cycle #25...") -- [Auto Forge] Starting cycle #25...
                local Data_50 = Replica.Data;
                local var692 = (Replica and Data_50); -- Data_50
                local Data_51 = Replica.Data;
                local Inventory_25 = Data_51.Inventory;
                local var693 = (var692 and Inventory_25); -- Inventory_25
                local var694 = (var693 or {});
                local var695 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_107 = Paragraph_2.Set;
                local Set_108 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_523 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_109 = Paragraph_2.Set;
                local Set_110 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #26...",
                });
                print("[Auto Forge]", "Starting cycle #26...") -- [Auto Forge] Starting cycle #26...
                local Data_52 = Replica.Data;
                local var698 = (Replica and Data_52); -- Data_52
                local Data_53 = Replica.Data;
                local Inventory_26 = Data_53.Inventory;
                local var699 = (var698 and Inventory_26); -- Inventory_26
                local var700 = (var699 or {});
                local var701 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_111 = Paragraph_2.Set;
                local Set_112 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_524 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_113 = Paragraph_2.Set;
                local Set_114 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #27...",
                });
                print("[Auto Forge]", "Starting cycle #27...") -- [Auto Forge] Starting cycle #27...
                local Data_54 = Replica.Data;
                local var704 = (Replica and Data_54); -- Data_54
                local Data_55 = Replica.Data;
                local Inventory_27 = Data_55.Inventory;
                local var705 = (var704 and Inventory_27); -- Inventory_27
                local var706 = (var705 or {});
                local var707 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_115 = Paragraph_2.Set;
                local Set_116 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_525 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_117 = Paragraph_2.Set;
                local Set_118 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #28...",
                });
                print("[Auto Forge]", "Starting cycle #28...") -- [Auto Forge] Starting cycle #28...
                local Data_56 = Replica.Data;
                local var710 = (Replica and Data_56); -- Data_56
                local Data_57 = Replica.Data;
                local Inventory_28 = Data_57.Inventory;
                local var711 = (var710 and Inventory_28); -- Inventory_28
                local var712 = (var711 or {});
                local var713 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_119 = Paragraph_2.Set;
                local Set_120 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_526 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_121 = Paragraph_2.Set;
                local Set_122 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #29...",
                });
                print("[Auto Forge]", "Starting cycle #29...") -- [Auto Forge] Starting cycle #29...
                local Data_58 = Replica.Data;
                local var716 = (Replica and Data_58); -- Data_58
                local Data_59 = Replica.Data;
                local Inventory_29 = Data_59.Inventory;
                local var717 = (var716 and Inventory_29); -- Inventory_29
                local var718 = (var717 or {});
                local var719 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_123 = Paragraph_2.Set;
                local Set_124 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_527 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_125 = Paragraph_2.Set;
                local Set_126 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #30...",
                });
                print("[Auto Forge]", "Starting cycle #30...") -- [Auto Forge] Starting cycle #30...
                local Data_60 = Replica.Data;
                local var722 = (Replica and Data_60); -- Data_60
                local Data_61 = Replica.Data;
                local Inventory_30 = Data_61.Inventory;
                local var723 = (var722 and Inventory_30); -- Inventory_30
                local var724 = (var723 or {});
                local var725 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_127 = Paragraph_2.Set;
                local Set_128 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_528 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_129 = Paragraph_2.Set;
                local Set_130 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #31...",
                });
                print("[Auto Forge]", "Starting cycle #31...") -- [Auto Forge] Starting cycle #31...
                local Data_62 = Replica.Data;
                local var728 = (Replica and Data_62); -- Data_62
                local Data_63 = Replica.Data;
                local Inventory_31 = Data_63.Inventory;
                local var729 = (var728 and Inventory_31); -- Inventory_31
                local var730 = (var729 or {});
                local var731 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_131 = Paragraph_2.Set;
                local Set_132 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_529 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_133 = Paragraph_2.Set;
                local Set_134 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #32...",
                });
                print("[Auto Forge]", "Starting cycle #32...") -- [Auto Forge] Starting cycle #32...
                local Data_64 = Replica.Data;
                local var734 = (Replica and Data_64); -- Data_64
                local Data_65 = Replica.Data;
                local Inventory_32 = Data_65.Inventory;
                local var735 = (var734 and Inventory_32); -- Inventory_32
                local var736 = (var735 or {});
                local var737 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_135 = Paragraph_2.Set;
                local Set_136 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_530 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_137 = Paragraph_2.Set;
                local Set_138 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #33...",
                });
                print("[Auto Forge]", "Starting cycle #33...") -- [Auto Forge] Starting cycle #33...
                local Data_66 = Replica.Data;
                local var740 = (Replica and Data_66); -- Data_66
                local Data_67 = Replica.Data;
                local Inventory_33 = Data_67.Inventory;
                local var741 = (var740 and Inventory_33); -- Inventory_33
                local var742 = (var741 or {});
                local var743 = (var194 or 3);
                if not Paragraph_2 then return end -- won't run
                local Set_139 = Paragraph_2.Set;
                local Set_140 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Error: No ores selected",
                });
                print("[Auto Forge]", "Error: No ores selected") -- [Auto Forge] Error: No ores selected
                local Waited_For_531 = task.wait(5);
                if not Paragraph_2 then return end -- won't run
                local Set_141 = Paragraph_2.Set;
                local Set_142 = Paragraph_2:Set({
                    Title = "Status",
                    Content = "Starting cycle #34...",
                });
                print("[Auto Forge]", "Starting cycle #34...") -- [Auto Forge] Starting cycle #34...
                local Data_68 = Replica.Data;
                local var746 = (Replica and Data_68); -- Data_68
                local Data_69 = Replica.Data;
                local Inventory_34 = Data_69.Inventory;
                local var747 = (var746 and Inventory_34); -- Inventory_34
                error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

            end);

        end,
        Name = "Enable Auto Forge",
        Flag = "AutoForge_Enable",
    });
    local CreateTab_3 = Window.CreateTab;
    local Auto = Window:CreateTab("Auto", 4483362458);
    local CreateSection_5 = Auto.CreateSection;
    local Auto_Use_Poitions = Auto:CreateSection("auto use poitions");
    local CreateParagraph_3 = Auto.CreateParagraph;
    local Paragraph_3 = Auto:CreateParagraph({
        Title = "Potions Status",
        Content = "Idle",
    });
    local Assets_4 = ReplicatedStorage:FindFirstChild("Assets");
    local Extras = Assets:FindFirstChild("Extras");
    local var39 = (Assets_4 and Extras); -- nil
    local var40 = (var39 or nil); -- nil
    -- local _ = var40 and (unknown_value)
    local CreateDropdown_6 = Auto.CreateDropdown;
    local Dropdown_6 = Auto:CreateDropdown({
        Name = "Potions to Auto-Use",
        MultipleOptions = true,
        Flag = "Auto_Potions_List",
        CurrentOption = {},
        Callback = function(p1_0)
            local var196 = typeof(p1_0);
            local var196_is_string = (var196 == "table");
            -- true, eq id 36
            local Len_P1_0_5 = #p1_0;
            local var197 = (Len_P1_0_5 > 0); -- nil
            local var198 = (var196_is_string and var197); -- nil
            if not var198 then return end -- won't run

        end,
        Options = {},
    });
    local CreateToggle_7 = Auto.CreateToggle;
    local Toggle_7 = Auto:CreateToggle({
        CurrentValue = false,
        Callback = function(p1_0)
            if not p1_0 then return end -- won't run
            if not Paragraph_3 then return end -- won't run
            local Set_7 = Paragraph_3.Set;
            local Set_8 = Paragraph_3:Set({
                Title = "Potions Status",
                Content = "Starting auto potions...",
            });
            print("[Auto Potions]", "Starting auto potions...") -- [Auto Potions] Starting auto potions...
            spawn(function()
                local Shared_2 = ReplicatedStorage:WaitForChild("Shared");
                local WaitForChild_6 = Shared_2.WaitForChild;
                local Packages_2 = Shared_2:WaitForChild("Packages");
                local WaitForChild_7 = Packages_2.WaitForChild;
                local Knit_2 = Packages_2:WaitForChild("Knit");
                local WaitForChild_8 = Knit_2.WaitForChild;
                local Services = Knit_2:WaitForChild("Services");
                local WaitForChild_9 = Services.WaitForChild;
                local ToolService = Services:WaitForChild("ToolService");
                local WaitForChild_10 = ToolService.WaitForChild;
                local RF = ToolService:WaitForChild("RF");
                local WaitForChild_11 = RF.WaitForChild;
                local ToolActivated = RF:WaitForChild("ToolActivated");
                if not Paragraph_3 then return end -- won't run
                local Set_143 = Paragraph_3.Set;
                local Set_144 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "Auto potions running...",
                });
                print("[Auto Potions]", "Auto potions running...") -- [Auto Potions] Auto potions running...
                if not Paragraph_3 then return end -- won't run
                local Set_145 = Paragraph_3.Set;
                local Set_146 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var750 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_147 = Paragraph_3.Set;
                local Set_148 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var752 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_149 = Paragraph_3.Set;
                local Set_150 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var754 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_151 = Paragraph_3.Set;
                local Set_152 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var756 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_153 = Paragraph_3.Set;
                local Set_154 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var758 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_155 = Paragraph_3.Set;
                local Set_156 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var760 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_157 = Paragraph_3.Set;
                local Set_158 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var762 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_159 = Paragraph_3.Set;
                local Set_160 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var764 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_161 = Paragraph_3.Set;
                local Set_162 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var766 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_163 = Paragraph_3.Set;
                local Set_164 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var768 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_165 = Paragraph_3.Set;
                local Set_166 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var770 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_167 = Paragraph_3.Set;
                local Set_168 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var772 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_169 = Paragraph_3.Set;
                local Set_170 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var774 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_171 = Paragraph_3.Set;
                local Set_172 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var776 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_173 = Paragraph_3.Set;
                local Set_174 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var778 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_175 = Paragraph_3.Set;
                local Set_176 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var780 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_177 = Paragraph_3.Set;
                local Set_178 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var782 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_179 = Paragraph_3.Set;
                local Set_180 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var784 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_181 = Paragraph_3.Set;
                local Set_182 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var786 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_183 = Paragraph_3.Set;
                local Set_184 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var788 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_185 = Paragraph_3.Set;
                local Set_186 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var790 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_187 = Paragraph_3.Set;
                local Set_188 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var792 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_189 = Paragraph_3.Set;
                local Set_190 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var794 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_191 = Paragraph_3.Set;
                local Set_192 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var796 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_193 = Paragraph_3.Set;
                local Set_194 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var798 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_195 = Paragraph_3.Set;
                local Set_196 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var800 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_197 = Paragraph_3.Set;
                local Set_198 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var802 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_199 = Paragraph_3.Set;
                local Set_200 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var804 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_201 = Paragraph_3.Set;
                local Set_202 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var806 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_203 = Paragraph_3.Set;
                local Set_204 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var808 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_205 = Paragraph_3.Set;
                local Set_206 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var810 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_207 = Paragraph_3.Set;
                local Set_208 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var812 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_209 = Paragraph_3.Set;
                local Set_210 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var814 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_211 = Paragraph_3.Set;
                local Set_212 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var816 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_213 = Paragraph_3.Set;
                local Set_214 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var818 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_215 = Paragraph_3.Set;
                local Set_216 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var820 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_217 = Paragraph_3.Set;
                local Set_218 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var822 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_219 = Paragraph_3.Set;
                local Set_220 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var824 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_221 = Paragraph_3.Set;
                local Set_222 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var826 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_223 = Paragraph_3.Set;
                local Set_224 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var828 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_225 = Paragraph_3.Set;
                local Set_226 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var830 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_227 = Paragraph_3.Set;
                local Set_228 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var832 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_229 = Paragraph_3.Set;
                local Set_230 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var834 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_231 = Paragraph_3.Set;
                local Set_232 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var836 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_233 = Paragraph_3.Set;
                local Set_234 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var838 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_235 = Paragraph_3.Set;
                local Set_236 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var840 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_237 = Paragraph_3.Set;
                local Set_238 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var842 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_239 = Paragraph_3.Set;
                local Set_240 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var844 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_241 = Paragraph_3.Set;
                local Set_242 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var846 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_243 = Paragraph_3.Set;
                local Set_244 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var848 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_245 = Paragraph_3.Set;
                local Set_246 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var850 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_247 = Paragraph_3.Set;
                local Set_248 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var852 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_249 = Paragraph_3.Set;
                local Set_250 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var854 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_251 = Paragraph_3.Set;
                local Set_252 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var856 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_253 = Paragraph_3.Set;
                local Set_254 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var858 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_255 = Paragraph_3.Set;
                local Set_256 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var860 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_257 = Paragraph_3.Set;
                local Set_258 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var862 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_259 = Paragraph_3.Set;
                local Set_260 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var864 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_261 = Paragraph_3.Set;
                local Set_262 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var866 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_263 = Paragraph_3.Set;
                local Set_264 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var868 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_265 = Paragraph_3.Set;
                local Set_266 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var870 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_267 = Paragraph_3.Set;
                local Set_268 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var872 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_269 = Paragraph_3.Set;
                local Set_270 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var874 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_271 = Paragraph_3.Set;
                local Set_272 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var876 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_273 = Paragraph_3.Set;
                local Set_274 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var878 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_275 = Paragraph_3.Set;
                local Set_276 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var880 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_277 = Paragraph_3.Set;
                local Set_278 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var882 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_279 = Paragraph_3.Set;
                local Set_280 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var884 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_281 = Paragraph_3.Set;
                local Set_282 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var886 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_283 = Paragraph_3.Set;
                local Set_284 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var888 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_285 = Paragraph_3.Set;
                local Set_286 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var890 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_287 = Paragraph_3.Set;
                local Set_288 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var892 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_289 = Paragraph_3.Set;
                local Set_290 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var894 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_291 = Paragraph_3.Set;
                local Set_292 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var896 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_293 = Paragraph_3.Set;
                local Set_294 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var898 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_295 = Paragraph_3.Set;
                local Set_296 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var900 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_297 = Paragraph_3.Set;
                local Set_298 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var902 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_299 = Paragraph_3.Set;
                local Set_300 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var904 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_301 = Paragraph_3.Set;
                local Set_302 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var906 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_303 = Paragraph_3.Set;
                local Set_304 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var908 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_305 = Paragraph_3.Set;
                local Set_306 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var910 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_307 = Paragraph_3.Set;
                local Set_308 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var912 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_309 = Paragraph_3.Set;
                local Set_310 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var914 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_311 = Paragraph_3.Set;
                local Set_312 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var916 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_313 = Paragraph_3.Set;
                local Set_314 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var918 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_315 = Paragraph_3.Set;
                local Set_316 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var920 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_317 = Paragraph_3.Set;
                local Set_318 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var922 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_319 = Paragraph_3.Set;
                local Set_320 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var924 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_321 = Paragraph_3.Set;
                local Set_322 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var926 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_323 = Paragraph_3.Set;
                local Set_324 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var928 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_325 = Paragraph_3.Set;
                local Set_326 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var930 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_327 = Paragraph_3.Set;
                local Set_328 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var932 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_329 = Paragraph_3.Set;
                local Set_330 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var934 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_331 = Paragraph_3.Set;
                local Set_332 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var936 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_333 = Paragraph_3.Set;
                local Set_334 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var938 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_335 = Paragraph_3.Set;
                local Set_336 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var940 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_337 = Paragraph_3.Set;
                local Set_338 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var942 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_339 = Paragraph_3.Set;
                local Set_340 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var944 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_341 = Paragraph_3.Set;
                local Set_342 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var946 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_343 = Paragraph_3.Set;
                local Set_344 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var948 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_345 = Paragraph_3.Set;
                local Set_346 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var950 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_347 = Paragraph_3.Set;
                local Set_348 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var952 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_349 = Paragraph_3.Set;
                local Set_350 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var954 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_351 = Paragraph_3.Set;
                local Set_352 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var956 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_353 = Paragraph_3.Set;
                local Set_354 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var958 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_355 = Paragraph_3.Set;
                local Set_356 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var960 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_357 = Paragraph_3.Set;
                local Set_358 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var962 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_359 = Paragraph_3.Set;
                local Set_360 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var964 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_361 = Paragraph_3.Set;
                local Set_362 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var966 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_363 = Paragraph_3.Set;
                local Set_364 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var968 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_365 = Paragraph_3.Set;
                local Set_366 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var970 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_367 = Paragraph_3.Set;
                local Set_368 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var972 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_369 = Paragraph_3.Set;
                local Set_370 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var974 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_371 = Paragraph_3.Set;
                local Set_372 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var976 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_373 = Paragraph_3.Set;
                local Set_374 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var978 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_375 = Paragraph_3.Set;
                local Set_376 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var980 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_377 = Paragraph_3.Set;
                local Set_378 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var982 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_379 = Paragraph_3.Set;
                local Set_380 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var984 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_381 = Paragraph_3.Set;
                local Set_382 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var986 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_383 = Paragraph_3.Set;
                local Set_384 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var988 = wait(1);
                if not Paragraph_3 then return end -- won't run
                local Set_385 = Paragraph_3.Set;
                local Set_386 = Paragraph_3:Set({
                    Title = "Potions Status",
                    Content = "No potions selected",
                });
                print("[Auto Potions]", "No potions selected") -- [Auto Potions] No potions selected
                local var990 = wait(1);
                error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

            end)

        end,
        Name = "Enable Auto Potions",
        Flag = "Auto_Potions_Enable",
    });
    local CreateSection_6 = Auto.CreateSection;
    local Auto_Player_Movement = Auto:CreateSection("auto player movement");
    local CreateToggle_8 = Auto.CreateToggle;
    local Toggle_8 = Auto:CreateToggle({
        CurrentValue = false,
        Callback = function(p1_0)
            local Not_P1_0 = not p1_0;
            -- false
            -- local _ = p1_0 or (unknown_value)
            if not p1_0 then return end -- won't run
            spawn(function()

            end)

        end,
        Name = "Always Run",
        Flag = "Auto_Move_AlwaysRun",
    });
    local CreateToggle_9 = Auto.CreateToggle;
    local Toggle_9 = Auto:CreateToggle({
        CurrentValue = false,
        Callback = function(p1_0)
            -- local _ = p1_0 or (unknown_value)
            if not p1_0 then return end -- won't run
            spawn(function()
                -- local _ = p1_0 or (unknown_value)
                local Character_12 = LocalPlayer.Character;
                local var200 = (LocalPlayer and Character_12); -- Character_12
                -- local _ = var200 or (unknown_value)
                local Humanoid = Character_12:FindFirstChildOfClass("Humanoid");
                local var201 = (Character_12 and Humanoid); -- Humanoid
                -- local _ = var201 or (unknown_value)
                local HumanoidRootPart_9 = Character_12:FindFirstChild("HumanoidRootPart");
                local var202 = (Character_12 and HumanoidRootPart_9); -- HumanoidRootPart_9
                -- local _ = var202 or (unknown_value)
                local var203 = (Humanoid and HumanoidRootPart_9); -- HumanoidRootPart_9
                if not var203 then return end -- won't run
                local Health_5 = Humanoid.Health;
                local MoveDirection = Humanoid.MoveDirection;
                local Magnitude_5 = MoveDirection.Magnitude;
                local var204 = (Magnitude_5 > 0.1); -- nil
                local var205 = (p1_0 and var204); -- nil
                local var206 = (p1_0 and nil); -- nil
                -- local _ = var206 and (unknown_value)
                local var207 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_13 = LocalPlayer.Character;
                local var208 = (LocalPlayer and Character_13); -- Character_13
                -- local _ = var208 or (unknown_value)
                local Humanoid_2 = Character_13:FindFirstChildOfClass("Humanoid");
                local var209 = (Character_13 and Humanoid_2); -- Humanoid_2
                -- local _ = var209 or (unknown_value)
                local HumanoidRootPart_10 = Character_13:FindFirstChild("HumanoidRootPart");
                local var210 = (Character_13 and HumanoidRootPart_10); -- HumanoidRootPart_10
                -- local _ = var210 or (unknown_value)
                local var211 = (Humanoid_2 and HumanoidRootPart_10); -- HumanoidRootPart_10
                if not var211 then return end -- won't run
                local Health_6 = Humanoid_2.Health;
                local MoveDirection_2 = Humanoid_2.MoveDirection;
                local Magnitude_6 = MoveDirection_2.Magnitude;
                local var212 = (Magnitude_6 > 0.1); -- nil
                local var213 = (p1_0 and var212); -- nil
                local var214 = (p1_0 and Health_5); -- Health_5
                local var215 = Health_5 - 0.5;
                local var216 = (Health_6 < var215); -- nil
                local var217 = (var214 and var216); -- nil
                -- local _ = var217 and (unknown_value)
                local var218 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_14 = LocalPlayer.Character;
                local var219 = (LocalPlayer and Character_14); -- Character_14
                -- local _ = var219 or (unknown_value)
                local Humanoid_3 = Character_14:FindFirstChildOfClass("Humanoid");
                local var220 = (Character_14 and Humanoid_3); -- Humanoid_3
                -- local _ = var220 or (unknown_value)
                local HumanoidRootPart_11 = Character_14:FindFirstChild("HumanoidRootPart");
                local var221 = (Character_14 and HumanoidRootPart_11); -- HumanoidRootPart_11
                -- local _ = var221 or (unknown_value)
                local var222 = (Humanoid_3 and HumanoidRootPart_11); -- HumanoidRootPart_11
                if not var222 then return end -- won't run
                local Health_7 = Humanoid_3.Health;
                local MoveDirection_3 = Humanoid_3.MoveDirection;
                local Magnitude_7 = MoveDirection_3.Magnitude;
                local var223 = (Magnitude_7 > 0.1); -- nil
                local var224 = (p1_0 and var223); -- nil
                local var225 = (p1_0 and Health_6); -- Health_6
                local var226 = Health_6 - 0.5;
                local var227 = (Health_7 < var226); -- nil
                local var228 = (var225 and var227); -- nil
                -- local _ = var228 and (unknown_value)
                local var229 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_15 = LocalPlayer.Character;
                local var230 = (LocalPlayer and Character_15); -- Character_15
                -- local _ = var230 or (unknown_value)
                local Humanoid_4 = Character_15:FindFirstChildOfClass("Humanoid");
                local var231 = (Character_15 and Humanoid_4); -- Humanoid_4
                -- local _ = var231 or (unknown_value)
                local HumanoidRootPart_12 = Character_15:FindFirstChild("HumanoidRootPart");
                local var232 = (Character_15 and HumanoidRootPart_12); -- HumanoidRootPart_12
                -- local _ = var232 or (unknown_value)
                local var233 = (Humanoid_4 and HumanoidRootPart_12); -- HumanoidRootPart_12
                if not var233 then return end -- won't run
                local Health_8 = Humanoid_4.Health;
                local MoveDirection_4 = Humanoid_4.MoveDirection;
                local Magnitude_8 = MoveDirection_4.Magnitude;
                local var234 = (Magnitude_8 > 0.1); -- nil
                local var235 = (p1_0 and var234); -- nil
                local var236 = (p1_0 and Health_7); -- Health_7
                local var237 = Health_7 - 0.5;
                local var238 = (Health_8 < var237); -- nil
                local var239 = (var236 and var238); -- nil
                -- local _ = var239 and (unknown_value)
                local var240 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_16 = LocalPlayer.Character;
                local var241 = (LocalPlayer and Character_16); -- Character_16
                -- local _ = var241 or (unknown_value)
                local Humanoid_5 = Character_16:FindFirstChildOfClass("Humanoid");
                local var242 = (Character_16 and Humanoid_5); -- Humanoid_5
                -- local _ = var242 or (unknown_value)
                local HumanoidRootPart_13 = Character_16:FindFirstChild("HumanoidRootPart");
                local var243 = (Character_16 and HumanoidRootPart_13); -- HumanoidRootPart_13
                -- local _ = var243 or (unknown_value)
                local var244 = (Humanoid_5 and HumanoidRootPart_13); -- HumanoidRootPart_13
                if not var244 then return end -- won't run
                local Health_9 = Humanoid_5.Health;
                local MoveDirection_5 = Humanoid_5.MoveDirection;
                local Magnitude_9 = MoveDirection_5.Magnitude;
                local var245 = (Magnitude_9 > 0.1); -- nil
                local var246 = (p1_0 and var245); -- nil
                local var247 = (p1_0 and Health_8); -- Health_8
                local var248 = Health_8 - 0.5;
                local var249 = (Health_9 < var248); -- nil
                local var250 = (var247 and var249); -- nil
                -- local _ = var250 and (unknown_value)
                local var251 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_17 = LocalPlayer.Character;
                local var252 = (LocalPlayer and Character_17); -- Character_17
                -- local _ = var252 or (unknown_value)
                local Humanoid_6 = Character_17:FindFirstChildOfClass("Humanoid");
                local var253 = (Character_17 and Humanoid_6); -- Humanoid_6
                -- local _ = var253 or (unknown_value)
                local HumanoidRootPart_14 = Character_17:FindFirstChild("HumanoidRootPart");
                local var254 = (Character_17 and HumanoidRootPart_14); -- HumanoidRootPart_14
                -- local _ = var254 or (unknown_value)
                local var255 = (Humanoid_6 and HumanoidRootPart_14); -- HumanoidRootPart_14
                if not var255 then return end -- won't run
                local Health_10 = Humanoid_6.Health;
                local MoveDirection_6 = Humanoid_6.MoveDirection;
                local Magnitude_10 = MoveDirection_6.Magnitude;
                local var256 = (Magnitude_10 > 0.1); -- nil
                local var257 = (p1_0 and var256); -- nil
                local var258 = (p1_0 and Health_9); -- Health_9
                local var259 = Health_9 - 0.5;
                local var260 = (Health_10 < var259); -- nil
                local var261 = (var258 and var260); -- nil
                -- local _ = var261 and (unknown_value)
                local var262 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_18 = LocalPlayer.Character;
                local var263 = (LocalPlayer and Character_18); -- Character_18
                -- local _ = var263 or (unknown_value)
                local Humanoid_7 = Character_18:FindFirstChildOfClass("Humanoid");
                local var264 = (Character_18 and Humanoid_7); -- Humanoid_7
                -- local _ = var264 or (unknown_value)
                local HumanoidRootPart_15 = Character_18:FindFirstChild("HumanoidRootPart");
                local var265 = (Character_18 and HumanoidRootPart_15); -- HumanoidRootPart_15
                -- local _ = var265 or (unknown_value)
                local var266 = (Humanoid_7 and HumanoidRootPart_15); -- HumanoidRootPart_15
                if not var266 then return end -- won't run
                local Health_11 = Humanoid_7.Health;
                local MoveDirection_7 = Humanoid_7.MoveDirection;
                local Magnitude_11 = MoveDirection_7.Magnitude;
                local var267 = (Magnitude_11 > 0.1); -- nil
                local var268 = (p1_0 and var267); -- nil
                local var269 = (p1_0 and Health_10); -- Health_10
                local var270 = Health_10 - 0.5;
                local var271 = (Health_11 < var270); -- nil
                local var272 = (var269 and var271); -- nil
                -- local _ = var272 and (unknown_value)
                local var273 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_19 = LocalPlayer.Character;
                local var274 = (LocalPlayer and Character_19); -- Character_19
                -- local _ = var274 or (unknown_value)
                local Humanoid_8 = Character_19:FindFirstChildOfClass("Humanoid");
                local var275 = (Character_19 and Humanoid_8); -- Humanoid_8
                -- local _ = var275 or (unknown_value)
                local HumanoidRootPart_16 = Character_19:FindFirstChild("HumanoidRootPart");
                local var276 = (Character_19 and HumanoidRootPart_16); -- HumanoidRootPart_16
                -- local _ = var276 or (unknown_value)
                local var277 = (Humanoid_8 and HumanoidRootPart_16); -- HumanoidRootPart_16
                if not var277 then return end -- won't run
                local Health_12 = Humanoid_8.Health;
                local MoveDirection_8 = Humanoid_8.MoveDirection;
                local Magnitude_12 = MoveDirection_8.Magnitude;
                local var278 = (Magnitude_12 > 0.1); -- nil
                local var279 = (p1_0 and var278); -- nil
                local var280 = (p1_0 and Health_11); -- Health_11
                local var281 = Health_11 - 0.5;
                local var282 = (Health_12 < var281); -- nil
                local var283 = (var280 and var282); -- nil
                -- local _ = var283 and (unknown_value)
                local var284 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_20 = LocalPlayer.Character;
                local var285 = (LocalPlayer and Character_20); -- Character_20
                -- local _ = var285 or (unknown_value)
                local Humanoid_9 = Character_20:FindFirstChildOfClass("Humanoid");
                local var286 = (Character_20 and Humanoid_9); -- Humanoid_9
                -- local _ = var286 or (unknown_value)
                local HumanoidRootPart_17 = Character_20:FindFirstChild("HumanoidRootPart");
                local var287 = (Character_20 and HumanoidRootPart_17); -- HumanoidRootPart_17
                -- local _ = var287 or (unknown_value)
                local var288 = (Humanoid_9 and HumanoidRootPart_17); -- HumanoidRootPart_17
                if not var288 then return end -- won't run
                local Health_13 = Humanoid_9.Health;
                local MoveDirection_9 = Humanoid_9.MoveDirection;
                local Magnitude_13 = MoveDirection_9.Magnitude;
                local var289 = (Magnitude_13 > 0.1); -- nil
                local var290 = (p1_0 and var289); -- nil
                local var291 = (p1_0 and Health_12); -- Health_12
                local var292 = Health_12 - 0.5;
                local var293 = (Health_13 < var292); -- nil
                local var294 = (var291 and var293); -- nil
                -- local _ = var294 and (unknown_value)
                local var295 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_21 = LocalPlayer.Character;
                local var296 = (LocalPlayer and Character_21); -- Character_21
                -- local _ = var296 or (unknown_value)
                local Humanoid_10 = Character_21:FindFirstChildOfClass("Humanoid");
                local var297 = (Character_21 and Humanoid_10); -- Humanoid_10
                -- local _ = var297 or (unknown_value)
                local HumanoidRootPart_18 = Character_21:FindFirstChild("HumanoidRootPart");
                local var298 = (Character_21 and HumanoidRootPart_18); -- HumanoidRootPart_18
                -- local _ = var298 or (unknown_value)
                local var299 = (Humanoid_10 and HumanoidRootPart_18); -- HumanoidRootPart_18
                if not var299 then return end -- won't run
                local Health_14 = Humanoid_10.Health;
                local MoveDirection_10 = Humanoid_10.MoveDirection;
                local Magnitude_14 = MoveDirection_10.Magnitude;
                local var300 = (Magnitude_14 > 0.1); -- nil
                local var301 = (p1_0 and var300); -- nil
                local var302 = (p1_0 and Health_13); -- Health_13
                local var303 = Health_13 - 0.5;
                local var304 = (Health_14 < var303); -- nil
                local var305 = (var302 and var304); -- nil
                -- local _ = var305 and (unknown_value)
                local var306 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_22 = LocalPlayer.Character;
                local var307 = (LocalPlayer and Character_22); -- Character_22
                -- local _ = var307 or (unknown_value)
                local Humanoid_11 = Character_22:FindFirstChildOfClass("Humanoid");
                local var308 = (Character_22 and Humanoid_11); -- Humanoid_11
                -- local _ = var308 or (unknown_value)
                local HumanoidRootPart_19 = Character_22:FindFirstChild("HumanoidRootPart");
                local var309 = (Character_22 and HumanoidRootPart_19); -- HumanoidRootPart_19
                -- local _ = var309 or (unknown_value)
                local var310 = (Humanoid_11 and HumanoidRootPart_19); -- HumanoidRootPart_19
                if not var310 then return end -- won't run
                local Health_15 = Humanoid_11.Health;
                local MoveDirection_11 = Humanoid_11.MoveDirection;
                local Magnitude_15 = MoveDirection_11.Magnitude;
                local var311 = (Magnitude_15 > 0.1); -- nil
                local var312 = (p1_0 and var311); -- nil
                local var313 = (p1_0 and Health_14); -- Health_14
                local var314 = Health_14 - 0.5;
                local var315 = (Health_15 < var314); -- nil
                local var316 = (var313 and var315); -- nil
                -- local _ = var316 and (unknown_value)
                local var317 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_23 = LocalPlayer.Character;
                local var318 = (LocalPlayer and Character_23); -- Character_23
                -- local _ = var318 or (unknown_value)
                local Humanoid_12 = Character_23:FindFirstChildOfClass("Humanoid");
                local var319 = (Character_23 and Humanoid_12); -- Humanoid_12
                -- local _ = var319 or (unknown_value)
                local HumanoidRootPart_20 = Character_23:FindFirstChild("HumanoidRootPart");
                local var320 = (Character_23 and HumanoidRootPart_20); -- HumanoidRootPart_20
                -- local _ = var320 or (unknown_value)
                local var321 = (Humanoid_12 and HumanoidRootPart_20); -- HumanoidRootPart_20
                if not var321 then return end -- won't run
                local Health_16 = Humanoid_12.Health;
                local MoveDirection_12 = Humanoid_12.MoveDirection;
                local Magnitude_16 = MoveDirection_12.Magnitude;
                local var322 = (Magnitude_16 > 0.1); -- nil
                local var323 = (p1_0 and var322); -- nil
                local var324 = (p1_0 and Health_15); -- Health_15
                local var325 = Health_15 - 0.5;
                local var326 = (Health_16 < var325); -- nil
                local var327 = (var324 and var326); -- nil
                -- local _ = var327 and (unknown_value)
                local var328 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_24 = LocalPlayer.Character;
                local var329 = (LocalPlayer and Character_24); -- Character_24
                -- local _ = var329 or (unknown_value)
                local Humanoid_13 = Character_24:FindFirstChildOfClass("Humanoid");
                local var330 = (Character_24 and Humanoid_13); -- Humanoid_13
                -- local _ = var330 or (unknown_value)
                local HumanoidRootPart_21 = Character_24:FindFirstChild("HumanoidRootPart");
                local var331 = (Character_24 and HumanoidRootPart_21); -- HumanoidRootPart_21
                -- local _ = var331 or (unknown_value)
                local var332 = (Humanoid_13 and HumanoidRootPart_21); -- HumanoidRootPart_21
                if not var332 then return end -- won't run
                local Health_17 = Humanoid_13.Health;
                local MoveDirection_13 = Humanoid_13.MoveDirection;
                local Magnitude_17 = MoveDirection_13.Magnitude;
                local var333 = (Magnitude_17 > 0.1); -- nil
                local var334 = (p1_0 and var333); -- nil
                local var335 = (p1_0 and Health_16); -- Health_16
                local var336 = Health_16 - 0.5;
                local var337 = (Health_17 < var336); -- nil
                local var338 = (var335 and var337); -- nil
                -- local _ = var338 and (unknown_value)
                local var339 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_25 = LocalPlayer.Character;
                local var340 = (LocalPlayer and Character_25); -- Character_25
                -- local _ = var340 or (unknown_value)
                local Humanoid_14 = Character_25:FindFirstChildOfClass("Humanoid");
                local var341 = (Character_25 and Humanoid_14); -- Humanoid_14
                -- local _ = var341 or (unknown_value)
                local HumanoidRootPart_22 = Character_25:FindFirstChild("HumanoidRootPart");
                local var342 = (Character_25 and HumanoidRootPart_22); -- HumanoidRootPart_22
                -- local _ = var342 or (unknown_value)
                local var343 = (Humanoid_14 and HumanoidRootPart_22); -- HumanoidRootPart_22
                if not var343 then return end -- won't run
                local Health_18 = Humanoid_14.Health;
                local MoveDirection_14 = Humanoid_14.MoveDirection;
                local Magnitude_18 = MoveDirection_14.Magnitude;
                local var344 = (Magnitude_18 > 0.1); -- nil
                local var345 = (p1_0 and var344); -- nil
                local var346 = (p1_0 and Health_17); -- Health_17
                local var347 = Health_17 - 0.5;
                local var348 = (Health_18 < var347); -- nil
                local var349 = (var346 and var348); -- nil
                -- local _ = var349 and (unknown_value)
                local var350 = wait(0.1);
                -- local _ = p1_0 or (unknown_value)
                local Character_26 = LocalPlayer.Character;
                local var351 = (LocalPlayer and Character_26); -- Character_26
                -- local _ = var351 or (unknown_value)
                local Humanoid_15 = Character_26:FindFirstChildOfClass("Humanoid");
                local var352 = (Character_26 and Humanoid_15); -- Humanoid_15
                -- local _ = var352 or (unknown_value)
                local HumanoidRootPart_23 = Character_26:FindFirstChild("HumanoidRootPart");
                local var353 = (Character_26 and HumanoidRootPart_23); -- HumanoidRootPart_23
                -- local _ = var353 or (unknown_value)
                local var354 = (Humanoid_15 and HumanoidRootPart_23); -- HumanoidRootPart_23
                if not var354 then return end -- won't run
                local Health_19 = Humanoid_15.Health;
                local MoveDirection_15 = Humanoid_15.MoveDirection;
                local Magnitude_19 = MoveDirection_15.Magnitude;
                local var355 = (Magnitude_19 > 0.1); -- nil
                local var356 = (p1_0 and var355); -- nil
                local var357 = (p1_0 and Health_18); -- Health_18
                local var358 = Health_18 - 0.5;
                local var359 = (Health_19 < var358); -- nil
                error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

            end)

        end,
        Name = "Auto Dodge (dash on hit)",
        Flag = "Auto_Move_AutoDodge",
    });
    local CreateTab_4 = Window.CreateTab;
    local Auto_Sell = Window:CreateTab("Auto Sell", 4483362458);
    local CreateToggle_10 = Auto_Sell.CreateToggle;
    local Toggle_10 = Auto_Sell:CreateToggle({
        CurrentValue = false,
        Callback = function(p1_0)
            if not p1_0 then return end -- won't run
            local Spawned_6 = task.spawn(function()
                local PlayerGui_8 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_8 = not PlayerGui_8;
                -- false
                local Menu_7 = PlayerGui:FindFirstChild("Menu");
                local Frame_22 = Menu:FindFirstChild("Frame");
                local var991 = (Menu_7 and Frame_22); -- Frame_3
                local Frame_23 = Frame_3:FindFirstChild("Frame");
                local var992 = (var991 and Frame_23); -- Frame_4
                local Menus_7 = Frame_4:FindFirstChild("Menus");
                local var993 = (var992 and Menus_7); -- Menus
                local Stash_2 = Menus:FindFirstChild("Stash");
                local var994 = (var993 and Stash_2); -- nil
                -- local _ = var994 and (unknown_value)
                local Not_Var994 = not var994;
                -- true
                if not Not_Var994 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_43, v_43 in ipairs(p1_0) do
                    local var994 = tostring(v_43);
                end
                for i_44, v_44 in ipairs(p1_0) do
                    local var994 = tostring(v_44);
                end
                local var995 = tonumber(p1_0, nil);
                -- no value
                local var996 = (var995 or 100);
                local var997 = (p1_0 or 10);
                local Waited_For_532 = task.wait(p1_0);
                local PlayerGui_9 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_9 = not PlayerGui_9;
                -- false
                local Menu_8 = PlayerGui:FindFirstChild("Menu");
                local Frame_24 = Menu:FindFirstChild("Frame");
                local var998 = (Menu_8 and Frame_24); -- Frame_3
                local Frame_25 = Frame_3:FindFirstChild("Frame");
                local var999 = (var998 and Frame_25); -- Frame_4
                local Menus_8 = Frame_4:FindFirstChild("Menus");
                local var1000 = (var999 and Menus_8); -- Menus
                local Stash_3 = Menus:FindFirstChild("Stash");
                local var1001 = (var1000 and Stash_3); -- nil
                -- local _ = var1001 and (unknown_value)
                local Not_Var1001 = not var1001;
                -- true
                if not Not_Var1001 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_45, v_45 in ipairs(p1_0) do
                    local var1001 = tostring(v_45);
                end
                for i_46, v_46 in ipairs(p1_0) do
                    local var1001 = tostring(v_46);
                end
                local var1002 = tonumber(p1_0, nil);
                -- no value
                local var1003 = (var1002 or 100);
                local var1004 = (p1_0 or 10);
                local Waited_For_533 = task.wait(p1_0);
                local PlayerGui_10 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_10 = not PlayerGui_10;
                -- false
                local Menu_9 = PlayerGui:FindFirstChild("Menu");
                local Frame_26 = Menu:FindFirstChild("Frame");
                local var1005 = (Menu_9 and Frame_26); -- Frame_3
                local Frame_27 = Frame_3:FindFirstChild("Frame");
                local var1006 = (var1005 and Frame_27); -- Frame_4
                local Menus_9 = Frame_4:FindFirstChild("Menus");
                local var1007 = (var1006 and Menus_9); -- Menus
                local Stash_4 = Menus:FindFirstChild("Stash");
                local var1008 = (var1007 and Stash_4); -- nil
                -- local _ = var1008 and (unknown_value)
                local Not_Var1008 = not var1008;
                -- true
                if not Not_Var1008 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_47, v_47 in ipairs(p1_0) do
                    local var1008 = tostring(v_47);
                end
                for i_48, v_48 in ipairs(p1_0) do
                    local var1008 = tostring(v_48);
                end
                local var1009 = tonumber(p1_0, nil);
                -- no value
                local var1010 = (var1009 or 100);
                local var1011 = (p1_0 or 10);
                local Waited_For_534 = task.wait(p1_0);
                local PlayerGui_11 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_11 = not PlayerGui_11;
                -- false
                local Menu_10 = PlayerGui:FindFirstChild("Menu");
                local Frame_28 = Menu:FindFirstChild("Frame");
                local var1012 = (Menu_10 and Frame_28); -- Frame_3
                local Frame_29 = Frame_3:FindFirstChild("Frame");
                local var1013 = (var1012 and Frame_29); -- Frame_4
                local Menus_10 = Frame_4:FindFirstChild("Menus");
                local var1014 = (var1013 and Menus_10); -- Menus
                local Stash_5 = Menus:FindFirstChild("Stash");
                local var1015 = (var1014 and Stash_5); -- nil
                -- local _ = var1015 and (unknown_value)
                local Not_Var1015 = not var1015;
                -- true
                if not Not_Var1015 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_49, v_49 in ipairs(p1_0) do
                    local var1015 = tostring(v_49);
                end
                for i_50, v_50 in ipairs(p1_0) do
                    local var1015 = tostring(v_50);
                end
                local var1016 = tonumber(p1_0, nil);
                -- no value
                local var1017 = (var1016 or 100);
                local var1018 = (p1_0 or 10);
                local Waited_For_535 = task.wait(p1_0);
                local PlayerGui_12 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_12 = not PlayerGui_12;
                -- false
                local Menu_11 = PlayerGui:FindFirstChild("Menu");
                local Frame_30 = Menu:FindFirstChild("Frame");
                local var1019 = (Menu_11 and Frame_30); -- Frame_3
                local Frame_31 = Frame_3:FindFirstChild("Frame");
                local var1020 = (var1019 and Frame_31); -- Frame_4
                local Menus_11 = Frame_4:FindFirstChild("Menus");
                local var1021 = (var1020 and Menus_11); -- Menus
                local Stash_6 = Menus:FindFirstChild("Stash");
                local var1022 = (var1021 and Stash_6); -- nil
                -- local _ = var1022 and (unknown_value)
                local Not_Var1022 = not var1022;
                -- true
                if not Not_Var1022 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_51, v_51 in ipairs(p1_0) do
                    local var1022 = tostring(v_51);
                end
                for i_52, v_52 in ipairs(p1_0) do
                    local var1022 = tostring(v_52);
                end
                local var1023 = tonumber(p1_0, nil);
                -- no value
                local var1024 = (var1023 or 100);
                local var1025 = (p1_0 or 10);
                local Waited_For_536 = task.wait(p1_0);
                local PlayerGui_13 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_13 = not PlayerGui_13;
                -- false
                local Menu_12 = PlayerGui:FindFirstChild("Menu");
                local Frame_32 = Menu:FindFirstChild("Frame");
                local var1026 = (Menu_12 and Frame_32); -- Frame_3
                local Frame_33 = Frame_3:FindFirstChild("Frame");
                local var1027 = (var1026 and Frame_33); -- Frame_4
                local Menus_12 = Frame_4:FindFirstChild("Menus");
                local var1028 = (var1027 and Menus_12); -- Menus
                local Stash_7 = Menus:FindFirstChild("Stash");
                local var1029 = (var1028 and Stash_7); -- nil
                -- local _ = var1029 and (unknown_value)
                local Not_Var1029 = not var1029;
                -- true
                if not Not_Var1029 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_53, v_53 in ipairs(p1_0) do
                    local var1029 = tostring(v_53);
                end
                for i_54, v_54 in ipairs(p1_0) do
                    local var1029 = tostring(v_54);
                end
                local var1030 = tonumber(p1_0, nil);
                -- no value
                local var1031 = (var1030 or 100);
                local var1032 = (p1_0 or 10);
                local Waited_For_537 = task.wait(p1_0);
                local PlayerGui_14 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_14 = not PlayerGui_14;
                -- false
                local Menu_13 = PlayerGui:FindFirstChild("Menu");
                local Frame_34 = Menu:FindFirstChild("Frame");
                local var1033 = (Menu_13 and Frame_34); -- Frame_3
                local Frame_35 = Frame_3:FindFirstChild("Frame");
                local var1034 = (var1033 and Frame_35); -- Frame_4
                local Menus_13 = Frame_4:FindFirstChild("Menus");
                local var1035 = (var1034 and Menus_13); -- Menus
                local Stash_8 = Menus:FindFirstChild("Stash");
                local var1036 = (var1035 and Stash_8); -- nil
                -- local _ = var1036 and (unknown_value)
                local Not_Var1036 = not var1036;
                -- true
                if not Not_Var1036 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_55, v_55 in ipairs(p1_0) do
                    local var1036 = tostring(v_55);
                end
                for i_56, v_56 in ipairs(p1_0) do
                    local var1036 = tostring(v_56);
                end
                local var1037 = tonumber(p1_0, nil);
                -- no value
                local var1038 = (var1037 or 100);
                local var1039 = (p1_0 or 10);
                local Waited_For_538 = task.wait(p1_0);
                local PlayerGui_15 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_15 = not PlayerGui_15;
                -- false
                local Menu_14 = PlayerGui:FindFirstChild("Menu");
                local Frame_36 = Menu:FindFirstChild("Frame");
                local var1040 = (Menu_14 and Frame_36); -- Frame_3
                local Frame_37 = Frame_3:FindFirstChild("Frame");
                local var1041 = (var1040 and Frame_37); -- Frame_4
                local Menus_14 = Frame_4:FindFirstChild("Menus");
                local var1042 = (var1041 and Menus_14); -- Menus
                local Stash_9 = Menus:FindFirstChild("Stash");
                local var1043 = (var1042 and Stash_9); -- nil
                -- local _ = var1043 and (unknown_value)
                local Not_Var1043 = not var1043;
                -- true
                if not Not_Var1043 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_57, v_57 in ipairs(p1_0) do
                    local var1043 = tostring(v_57);
                end
                for i_58, v_58 in ipairs(p1_0) do
                    local var1043 = tostring(v_58);
                end
                local var1044 = tonumber(p1_0, nil);
                -- no value
                local var1045 = (var1044 or 100);
                local var1046 = (p1_0 or 10);
                local Waited_For_539 = task.wait(p1_0);
                local PlayerGui_16 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_16 = not PlayerGui_16;
                -- false
                local Menu_15 = PlayerGui:FindFirstChild("Menu");
                local Frame_38 = Menu:FindFirstChild("Frame");
                local var1047 = (Menu_15 and Frame_38); -- Frame_3
                local Frame_39 = Frame_3:FindFirstChild("Frame");
                local var1048 = (var1047 and Frame_39); -- Frame_4
                local Menus_15 = Frame_4:FindFirstChild("Menus");
                local var1049 = (var1048 and Menus_15); -- Menus
                local Stash_10 = Menus:FindFirstChild("Stash");
                local var1050 = (var1049 and Stash_10); -- nil
                -- local _ = var1050 and (unknown_value)
                local Not_Var1050 = not var1050;
                -- true
                if not Not_Var1050 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_59, v_59 in ipairs(p1_0) do
                    local var1050 = tostring(v_59);
                end
                for i_60, v_60 in ipairs(p1_0) do
                    local var1050 = tostring(v_60);
                end
                local var1051 = tonumber(p1_0, nil);
                -- no value
                local var1052 = (var1051 or 100);
                local var1053 = (p1_0 or 10);
                local Waited_For_540 = task.wait(p1_0);
                local PlayerGui_17 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_17 = not PlayerGui_17;
                -- false
                local Menu_16 = PlayerGui:FindFirstChild("Menu");
                local Frame_40 = Menu:FindFirstChild("Frame");
                local var1054 = (Menu_16 and Frame_40); -- Frame_3
                local Frame_41 = Frame_3:FindFirstChild("Frame");
                local var1055 = (var1054 and Frame_41); -- Frame_4
                local Menus_16 = Frame_4:FindFirstChild("Menus");
                local var1056 = (var1055 and Menus_16); -- Menus
                local Stash_11 = Menus:FindFirstChild("Stash");
                local var1057 = (var1056 and Stash_11); -- nil
                -- local _ = var1057 and (unknown_value)
                local Not_Var1057 = not var1057;
                -- true
                if not Not_Var1057 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_61, v_61 in ipairs(p1_0) do
                    local var1057 = tostring(v_61);
                end
                for i_62, v_62 in ipairs(p1_0) do
                    local var1057 = tostring(v_62);
                end
                local var1058 = tonumber(p1_0, nil);
                -- no value
                local var1059 = (var1058 or 100);
                local var1060 = (p1_0 or 10);
                local Waited_For_541 = task.wait(p1_0);
                local PlayerGui_18 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_18 = not PlayerGui_18;
                -- false
                local Menu_17 = PlayerGui:FindFirstChild("Menu");
                local Frame_42 = Menu:FindFirstChild("Frame");
                local var1061 = (Menu_17 and Frame_42); -- Frame_3
                local Frame_43 = Frame_3:FindFirstChild("Frame");
                local var1062 = (var1061 and Frame_43); -- Frame_4
                local Menus_17 = Frame_4:FindFirstChild("Menus");
                local var1063 = (var1062 and Menus_17); -- Menus
                local Stash_12 = Menus:FindFirstChild("Stash");
                local var1064 = (var1063 and Stash_12); -- nil
                -- local _ = var1064 and (unknown_value)
                local Not_Var1064 = not var1064;
                -- true
                if not Not_Var1064 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_63, v_63 in ipairs(p1_0) do
                    local var1064 = tostring(v_63);
                end
                for i_64, v_64 in ipairs(p1_0) do
                    local var1064 = tostring(v_64);
                end
                local var1065 = tonumber(p1_0, nil);
                -- no value
                local var1066 = (var1065 or 100);
                local var1067 = (p1_0 or 10);
                local Waited_For_542 = task.wait(p1_0);
                local PlayerGui_19 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_19 = not PlayerGui_19;
                -- false
                local Menu_18 = PlayerGui:FindFirstChild("Menu");
                local Frame_44 = Menu:FindFirstChild("Frame");
                local var1068 = (Menu_18 and Frame_44); -- Frame_3
                local Frame_45 = Frame_3:FindFirstChild("Frame");
                local var1069 = (var1068 and Frame_45); -- Frame_4
                local Menus_18 = Frame_4:FindFirstChild("Menus");
                local var1070 = (var1069 and Menus_18); -- Menus
                local Stash_13 = Menus:FindFirstChild("Stash");
                local var1071 = (var1070 and Stash_13); -- nil
                -- local _ = var1071 and (unknown_value)
                local Not_Var1071 = not var1071;
                -- true
                if not Not_Var1071 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_65, v_65 in ipairs(p1_0) do
                    local var1071 = tostring(v_65);
                end
                for i_66, v_66 in ipairs(p1_0) do
                    local var1071 = tostring(v_66);
                end
                local var1072 = tonumber(p1_0, nil);
                -- no value
                local var1073 = (var1072 or 100);
                local var1074 = (p1_0 or 10);
                local Waited_For_543 = task.wait(p1_0);
                local PlayerGui_20 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_20 = not PlayerGui_20;
                -- false
                local Menu_19 = PlayerGui:FindFirstChild("Menu");
                local Frame_46 = Menu:FindFirstChild("Frame");
                local var1075 = (Menu_19 and Frame_46); -- Frame_3
                local Frame_47 = Frame_3:FindFirstChild("Frame");
                local var1076 = (var1075 and Frame_47); -- Frame_4
                local Menus_19 = Frame_4:FindFirstChild("Menus");
                local var1077 = (var1076 and Menus_19); -- Menus
                local Stash_14 = Menus:FindFirstChild("Stash");
                local var1078 = (var1077 and Stash_14); -- nil
                -- local _ = var1078 and (unknown_value)
                local Not_Var1078 = not var1078;
                -- true
                if not Not_Var1078 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_67, v_67 in ipairs(p1_0) do
                    local var1078 = tostring(v_67);
                end
                for i_68, v_68 in ipairs(p1_0) do
                    local var1078 = tostring(v_68);
                end
                local var1079 = tonumber(p1_0, nil);
                -- no value
                local var1080 = (var1079 or 100);
                local var1081 = (p1_0 or 10);
                local Waited_For_544 = task.wait(p1_0);
                local PlayerGui_21 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_21 = not PlayerGui_21;
                -- false
                local Menu_20 = PlayerGui:FindFirstChild("Menu");
                local Frame_48 = Menu:FindFirstChild("Frame");
                local var1082 = (Menu_20 and Frame_48); -- Frame_3
                local Frame_49 = Frame_3:FindFirstChild("Frame");
                local var1083 = (var1082 and Frame_49); -- Frame_4
                local Menus_20 = Frame_4:FindFirstChild("Menus");
                local var1084 = (var1083 and Menus_20); -- Menus
                local Stash_15 = Menus:FindFirstChild("Stash");
                local var1085 = (var1084 and Stash_15); -- nil
                -- local _ = var1085 and (unknown_value)
                local Not_Var1085 = not var1085;
                -- true
                if not Not_Var1085 then return end -- won't run
                if not p1_0 then return end -- won't run
                print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
                for i_69, v_69 in ipairs(p1_0) do
                    local var1085 = tostring(v_69);
                end
                for i_70, v_70 in ipairs(p1_0) do
                    local var1085 = tostring(v_70);
                end
                local var1086 = tonumber(p1_0, nil);
                -- no value
                local var1087 = (var1086 or 100);
                local var1088 = (p1_0 or 10);
                local Waited_For_545 = task.wait(p1_0);
                local PlayerGui_22 = LocalPlayer:FindFirstChild("PlayerGui");
                local Not_PlayerGui_22 = not PlayerGui_22;
                -- false
                local Menu_21 = PlayerGui:FindFirstChild("Menu");
                local Frame_50 = Menu:FindFirstChild("Frame");
                local var1089 = (Menu_21 and Frame_50);
                error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

            end);

        end,
        Name = "Enable Auto Sell",
        Flag = "Forge_AutoSellEnabled",
    });
    local CreateDropdown_7 = Auto_Sell.CreateDropdown;
    local Dropdown_7 = Auto_Sell:CreateDropdown({
        Name = "Ores to Auto Sell (Pre-select)",
        MultipleOptions = true,
        Flag = "Forge_AutoSellOres",
        CurrentOption = {},
        Callback = function(p1_0)
            local var360 = typeof(p1_0);
            local var360_is_string = (var360 == "table");
            -- true, eq id 37
            if not var360_is_string then return end -- won't run

        end,
        Options = Array_2,
    });
    local CreateButton_2 = Auto_Sell.CreateButton;
    local Button_2 = Auto_Sell:CreateButton({
        Name = "Refresh Inventory List",
        Callback = function()
            local PlayerGui_3 = LocalPlayer:FindFirstChild("PlayerGui");
            local Not_PlayerGui_3 = not PlayerGui_3;
            -- false
            local Menu_3 = PlayerGui:FindFirstChild("Menu");
            local Frame_11 = Menu:FindFirstChild("Frame");
            local var361 = (Menu_3 and Frame_11); -- Frame_3
            local Frame_12 = Frame_3:FindFirstChild("Frame");
            local var362 = (var361 and Frame_12); -- Frame_4
            local Menus_3 = Frame_4:FindFirstChild("Menus");
            local var363 = (var362 and Menus_3); -- Menus
            local Stash = Menus:FindFirstChild("Stash");
            local var364 = (var363 and Stash); -- nil
            -- local _ = var364 and (unknown_value)
            local Not_Var364 = not var364;
            -- true
            if not Not_Var364 then return end -- won't run
            if not p1_0 then return end -- won't run
            print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background") -- [Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background
            if not Dropdown_8 then return end -- won't run
            local Refresh = Dropdown_8.Refresh;
            local Refresh_2 = Dropdown_8:Refresh({
                "No items found (Open Stash)",
            }, {});
            print("[Forge] Refreshed inventory list. Found 1 items.") -- [Forge] Refreshed inventory list. Found 1 items.

        end,
    });
    local CreateDropdown_8 = Auto_Sell.CreateDropdown;
    local Dropdown_8 = Auto_Sell:CreateDropdown({
        Name = "Inventory Items to Sell",
        MultipleOptions = true,
        Flag = "Forge_AutoSellInvItems",
        CurrentOption = {},
        Callback = function(p1_0)
            local var366 = typeof(p1_0);
            local var366_is_string = (var366 == "table");
            -- true, eq id 38
            if not var366_is_string then return end -- won't run

        end,
        Options = {
            "Click Refresh Inventory",
        },
    });
    local CreateSlider_7 = Auto_Sell.CreateSlider;
    local Slider_7 = Auto_Sell:CreateSlider({
        Name = "Sell Amount (Batch Size)",
        Callback = function(p1_0)

        end,
        CurrentValue = 100,
        Increment = 1,
        Range = {
            1,
            1000,
        },
        Flag = "Forge_AutoSellAmount",
    });
    local CreateSlider_8 = Auto_Sell.CreateSlider;
    local Slider_8 = Auto_Sell:CreateSlider({
        Name = "Sell Interval (s)",
        Callback = function(p1_0)

        end,
        CurrentValue = 10,
        Increment = 5,
        Range = {
            5,
            120,
        },
        Flag = "Forge_AutoSellInterval",
    });
    local CreateTab_5 = Window.CreateTab;
    local Settings = Window:CreateTab("Settings", 4483362458);
    local VirtualInputManager = game:GetService("VirtualInputManager");
    local ContextActionService = game:GetService("ContextActionService");
    local Enum_KeyCode = Enum.KeyCode;
    local ButtonR3 = Enum_KeyCode.ButtonR3;
    local CreateSection_7 = Settings.CreateSection;
    local AntiAFK = Settings:CreateSection("Anti-AFK");
    local CreateToggle_11 = Settings.CreateToggle;
    local Toggle_11 = Settings:CreateToggle({
        CurrentValue = true,
        Callback = function(p1_0)
            local var367 = (p1_0 and true); -- true
            local var368 = (var367 or false);
            if not p1_0 then return end -- won't run

        end,
        Name = "Enable Anti-AFK",
        Flag = "EnableAntiAFK",
    });
    local CreateSlider_9 = Settings.CreateSlider;
    local Slider_9 = Settings:CreateSlider({
        Name = "AFK Tap Interval (sec)",
        Callback = function(p1_0)
            local var369 = tonumber(p1_0, nil);
            -- no value
            local var370 = (var369 >= 10); -- nil
            local var371 = (var369 and var370); -- nil

        end,
        CurrentValue = 60,
        Increment = 5,
        Range = {
            30,
            180,
        },
        Flag = "AntiAFK_Interval",
    });
    local PVB_AntiAFK_Sink = ContextActionService:UnbindAction("PVB_AntiAFK_Sink");
    local PVB_AntiAFK_Sink_2 = ContextActionService:BindAction("PVB_AntiAFK_Sink", function()
            local Enum_ContextActionResult = Enum.ContextActionResult;
            local Sink = Enum_ContextActionResult.Sink;
            return Sink

        end, false, ButtonR3);
    local Spawned_2 = task.spawn(function()
        local SendKeyEvent = VirtualInputManager:SendKeyEvent(true, ButtonR3, false, game);
        local Waited_For = task.wait(0.06);
        local SendKeyEvent_2 = VirtualInputManager:SendKeyEvent(false, ButtonR3, false, game);
        local Waited_For_2 = task.wait(0.1);
        local Waited_For_3 = task.wait(0.1);
        local Waited_For_4 = task.wait(0.1);
        local Waited_For_5 = task.wait(0.1);
        local Waited_For_6 = task.wait(0.1);
        local Waited_For_7 = task.wait(0.1);
        local Waited_For_8 = task.wait(0.1);
        local Waited_For_9 = task.wait(0.1);
        local Waited_For_10 = task.wait(0.1);
        local Waited_For_11 = task.wait(0.1);
        local Waited_For_12 = task.wait(0.1);
        local Waited_For_13 = task.wait(0.1);
        local Waited_For_14 = task.wait(0.1);
        local Waited_For_15 = task.wait(0.1);
        local Waited_For_16 = task.wait(0.1);
        local Waited_For_17 = task.wait(0.1);
        local Waited_For_18 = task.wait(0.1);
        local Waited_For_19 = task.wait(0.1);
        local Waited_For_20 = task.wait(0.1);
        local Waited_For_21 = task.wait(0.1);
        local Waited_For_22 = task.wait(0.1);
        local Waited_For_23 = task.wait(0.1);
        local Waited_For_24 = task.wait(0.1);
        local Waited_For_25 = task.wait(0.1);
        local Waited_For_26 = task.wait(0.1);
        local Waited_For_27 = task.wait(0.1);
        local Waited_For_28 = task.wait(0.1);
        local Waited_For_29 = task.wait(0.1);
        local Waited_For_30 = task.wait(0.1);
        local Waited_For_31 = task.wait(0.1);
        local Waited_For_32 = task.wait(0.1);
        local Waited_For_33 = task.wait(0.1);
        local Waited_For_34 = task.wait(0.1);
        local Waited_For_35 = task.wait(0.1);
        local Waited_For_36 = task.wait(0.1);
        local Waited_For_37 = task.wait(0.1);
        local Waited_For_38 = task.wait(0.1);
        local Waited_For_39 = task.wait(0.1);
        local Waited_For_40 = task.wait(0.1);
        local Waited_For_41 = task.wait(0.1);
        local Waited_For_42 = task.wait(0.1);
        local Waited_For_43 = task.wait(0.1);
        local Waited_For_44 = task.wait(0.1);
        local Waited_For_45 = task.wait(0.1);
        local Waited_For_46 = task.wait(0.1);
        local Waited_For_47 = task.wait(0.1);
        local Waited_For_48 = task.wait(0.1);
        local Waited_For_49 = task.wait(0.1);
        local Waited_For_50 = task.wait(0.1);
        local Waited_For_51 = task.wait(0.1);
        local Waited_For_52 = task.wait(0.1);
        local Waited_For_53 = task.wait(0.1);
        local Waited_For_54 = task.wait(0.1);
        local Waited_For_55 = task.wait(0.1);
        local Waited_For_56 = task.wait(0.1);
        local Waited_For_57 = task.wait(0.1);
        local Waited_For_58 = task.wait(0.1);
        local Waited_For_59 = task.wait(0.1);
        local Waited_For_60 = task.wait(0.1);
        local Waited_For_61 = task.wait(0.1);
        local Waited_For_62 = task.wait(0.1);
        local Waited_For_63 = task.wait(0.1);
        local Waited_For_64 = task.wait(0.1);
        local Waited_For_65 = task.wait(0.1);
        local Waited_For_66 = task.wait(0.1);
        local Waited_For_67 = task.wait(0.1);
        local Waited_For_68 = task.wait(0.1);
        local Waited_For_69 = task.wait(0.1);
        local Waited_For_70 = task.wait(0.1);
        local Waited_For_71 = task.wait(0.1);
        local Waited_For_72 = task.wait(0.1);
        local Waited_For_73 = task.wait(0.1);
        local Waited_For_74 = task.wait(0.1);
        local Waited_For_75 = task.wait(0.1);
        local Waited_For_76 = task.wait(0.1);
        local Waited_For_77 = task.wait(0.1);
        local Waited_For_78 = task.wait(0.1);
        local Waited_For_79 = task.wait(0.1);
        local Waited_For_80 = task.wait(0.1);
        local Waited_For_81 = task.wait(0.1);
        local Waited_For_82 = task.wait(0.1);
        local Waited_For_83 = task.wait(0.1);
        local Waited_For_84 = task.wait(0.1);
        local Waited_For_85 = task.wait(0.1);
        local Waited_For_86 = task.wait(0.1);
        local Waited_For_87 = task.wait(0.1);
        local Waited_For_88 = task.wait(0.1);
        local Waited_For_89 = task.wait(0.1);
        local Waited_For_90 = task.wait(0.1);
        local Waited_For_91 = task.wait(0.1);
        local Waited_For_92 = task.wait(0.1);
        local Waited_For_93 = task.wait(0.1);
        local Waited_For_94 = task.wait(0.1);
        local Waited_For_95 = task.wait(0.1);
        local Waited_For_96 = task.wait(0.1);
        local Waited_For_97 = task.wait(0.1);
        local Waited_For_98 = task.wait(0.1);
        local Waited_For_99 = task.wait(0.1);
        local Waited_For_100 = task.wait(0.1);
        local Waited_For_101 = task.wait(0.1);
        local Waited_For_102 = task.wait(0.1);
        local Waited_For_103 = task.wait(0.1);
        local Waited_For_104 = task.wait(0.1);
        local Waited_For_105 = task.wait(0.1);
        local Waited_For_106 = task.wait(0.1);
        local Waited_For_107 = task.wait(0.1);
        local Waited_For_108 = task.wait(0.1);
        local Waited_For_109 = task.wait(0.1);
        local Waited_For_110 = task.wait(0.1);
        local Waited_For_111 = task.wait(0.1);
        local Waited_For_112 = task.wait(0.1);
        local Waited_For_113 = task.wait(0.1);
        local Waited_For_114 = task.wait(0.1);
        local Waited_For_115 = task.wait(0.1);
        local Waited_For_116 = task.wait(0.1);
        local Waited_For_117 = task.wait(0.1);
        local Waited_For_118 = task.wait(0.1);
        local Waited_For_119 = task.wait(0.1);
        local Waited_For_120 = task.wait(0.1);
        local Waited_For_121 = task.wait(0.1);
        local Waited_For_122 = task.wait(0.1);
        local Waited_For_123 = task.wait(0.1);
        local Waited_For_124 = task.wait(0.1);
        local Waited_For_125 = task.wait(0.1);
        local Waited_For_126 = task.wait(0.1);
        local Waited_For_127 = task.wait(0.1);
        local Waited_For_128 = task.wait(0.1);
        local Waited_For_129 = task.wait(0.1);
        local Waited_For_130 = task.wait(0.1);
        local Waited_For_131 = task.wait(0.1);
        local Waited_For_132 = task.wait(0.1);
        local Waited_For_133 = task.wait(0.1);
        local Waited_For_134 = task.wait(0.1);
        local Waited_For_135 = task.wait(0.1);
        local Waited_For_136 = task.wait(0.1);
        local Waited_For_137 = task.wait(0.1);
        local Waited_For_138 = task.wait(0.1);
        local Waited_For_139 = task.wait(0.1);
        local Waited_For_140 = task.wait(0.1);
        local Waited_For_141 = task.wait(0.1);
        local Waited_For_142 = task.wait(0.1);
        local Waited_For_143 = task.wait(0.1);
        local Waited_For_144 = task.wait(0.1);
        local Waited_For_145 = task.wait(0.1);
        local Waited_For_146 = task.wait(0.1);
        local Waited_For_147 = task.wait(0.1);
        local Waited_For_148 = task.wait(0.1);
        local Waited_For_149 = task.wait(0.1);
        local Waited_For_150 = task.wait(0.1);
        local Waited_For_151 = task.wait(0.1);
        local Waited_For_152 = task.wait(0.1);
        local Waited_For_153 = task.wait(0.1);
        local Waited_For_154 = task.wait(0.1);
        local Waited_For_155 = task.wait(0.1);
        local Waited_For_156 = task.wait(0.1);
        local Waited_For_157 = task.wait(0.1);
        local Waited_For_158 = task.wait(0.1);
        local Waited_For_159 = task.wait(0.1);
        local Waited_For_160 = task.wait(0.1);
        local Waited_For_161 = task.wait(0.1);
        local Waited_For_162 = task.wait(0.1);
        local Waited_For_163 = task.wait(0.1);
        local Waited_For_164 = task.wait(0.1);
        local Waited_For_165 = task.wait(0.1);
        local Waited_For_166 = task.wait(0.1);
        local Waited_For_167 = task.wait(0.1);
        local Waited_For_168 = task.wait(0.1);
        local Waited_For_169 = task.wait(0.1);
        local Waited_For_170 = task.wait(0.1);
        local Waited_For_171 = task.wait(0.1);
        local Waited_For_172 = task.wait(0.1);
        local Waited_For_173 = task.wait(0.1);
        local Waited_For_174 = task.wait(0.1);
        local Waited_For_175 = task.wait(0.1);
        local Waited_For_176 = task.wait(0.1);
        local Waited_For_177 = task.wait(0.1);
        local Waited_For_178 = task.wait(0.1);
        local Waited_For_179 = task.wait(0.1);
        local Waited_For_180 = task.wait(0.1);
        local Waited_For_181 = task.wait(0.1);
        local Waited_For_182 = task.wait(0.1);
        local Waited_For_183 = task.wait(0.1);
        local Waited_For_184 = task.wait(0.1);
        local Waited_For_185 = task.wait(0.1);
        local Waited_For_186 = task.wait(0.1);
        local Waited_For_187 = task.wait(0.1);
        local Waited_For_188 = task.wait(0.1);
        local Waited_For_189 = task.wait(0.1);
        local Waited_For_190 = task.wait(0.1);
        local Waited_For_191 = task.wait(0.1);
        local Waited_For_192 = task.wait(0.1);
        local Waited_For_193 = task.wait(0.1);
        local Waited_For_194 = task.wait(0.1);
        local Waited_For_195 = task.wait(0.1);
        local Waited_For_196 = task.wait(0.1);
        local Waited_For_197 = task.wait(0.1);
        local Waited_For_198 = task.wait(0.1);
        local Waited_For_199 = task.wait(0.1);
        local Waited_For_200 = task.wait(0.1);
        local Waited_For_201 = task.wait(0.1);
        local Waited_For_202 = task.wait(0.1);
        local Waited_For_203 = task.wait(0.1);
        local Waited_For_204 = task.wait(0.1);
        local Waited_For_205 = task.wait(0.1);
        local Waited_For_206 = task.wait(0.1);
        local Waited_For_207 = task.wait(0.1);
        local Waited_For_208 = task.wait(0.1);
        local Waited_For_209 = task.wait(0.1);
        local Waited_For_210 = task.wait(0.1);
        local Waited_For_211 = task.wait(0.1);
        local Waited_For_212 = task.wait(0.1);
        local Waited_For_213 = task.wait(0.1);
        local Waited_For_214 = task.wait(0.1);
        local Waited_For_215 = task.wait(0.1);
        local Waited_For_216 = task.wait(0.1);
        local Waited_For_217 = task.wait(0.1);
        local Waited_For_218 = task.wait(0.1);
        local Waited_For_219 = task.wait(0.1);
        local Waited_For_220 = task.wait(0.1);
        local Waited_For_221 = task.wait(0.1);
        local Waited_For_222 = task.wait(0.1);
        local Waited_For_223 = task.wait(0.1);
        local Waited_For_224 = task.wait(0.1);
        local Waited_For_225 = task.wait(0.1);
        local Waited_For_226 = task.wait(0.1);
        local Waited_For_227 = task.wait(0.1);
        local Waited_For_228 = task.wait(0.1);
        local Waited_For_229 = task.wait(0.1);
        local Waited_For_230 = task.wait(0.1);
        local Waited_For_231 = task.wait(0.1);
        local Waited_For_232 = task.wait(0.1);
        local Waited_For_233 = task.wait(0.1);
        local Waited_For_234 = task.wait(0.1);
        local Waited_For_235 = task.wait(0.1);
        local Waited_For_236 = task.wait(0.1);
        local Waited_For_237 = task.wait(0.1);
        local Waited_For_238 = task.wait(0.1);
        local Waited_For_239 = task.wait(0.1);
        local Waited_For_240 = task.wait(0.1);
        local Waited_For_241 = task.wait(0.1);
        local Waited_For_242 = task.wait(0.1);
        local Waited_For_243 = task.wait(0.1);
        local Waited_For_244 = task.wait(0.1);
        local Waited_For_245 = task.wait(0.1);
        local Waited_For_246 = task.wait(0.1);
        local Waited_For_247 = task.wait(0.1);
        local Waited_For_248 = task.wait(0.1);
        local Waited_For_249 = task.wait(0.1);
        local Waited_For_250 = task.wait(0.1);
        local Waited_For_251 = task.wait(0.1);
        local Waited_For_252 = task.wait(0.1);
        local Waited_For_253 = task.wait(0.1);
        local Waited_For_254 = task.wait(0.1);
        local Waited_For_255 = task.wait(0.1);
        local Waited_For_256 = task.wait(0.1);
        local Waited_For_257 = task.wait(0.1);
        local Waited_For_258 = task.wait(0.1);
        local Waited_For_259 = task.wait(0.1);
        local Waited_For_260 = task.wait(0.1);
        local Waited_For_261 = task.wait(0.1);
        local Waited_For_262 = task.wait(0.1);
        local Waited_For_263 = task.wait(0.1);
        local Waited_For_264 = task.wait(0.1);
        local Waited_For_265 = task.wait(0.1);
        local Waited_For_266 = task.wait(0.1);
        local Waited_For_267 = task.wait(0.1);
        local Waited_For_268 = task.wait(0.1);
        local Waited_For_269 = task.wait(0.1);
        local Waited_For_270 = task.wait(0.1);
        local Waited_For_271 = task.wait(0.1);
        local Waited_For_272 = task.wait(0.1);
        local Waited_For_273 = task.wait(0.1);
        local Waited_For_274 = task.wait(0.1);
        local Waited_For_275 = task.wait(0.1);
        local Waited_For_276 = task.wait(0.1);
        local Waited_For_277 = task.wait(0.1);
        local Waited_For_278 = task.wait(0.1);
        local Waited_For_279 = task.wait(0.1);
        local Waited_For_280 = task.wait(0.1);
        local Waited_For_281 = task.wait(0.1);
        local Waited_For_282 = task.wait(0.1);
        local Waited_For_283 = task.wait(0.1);
        local Waited_For_284 = task.wait(0.1);
        local Waited_For_285 = task.wait(0.1);
        local Waited_For_286 = task.wait(0.1);
        local Waited_For_287 = task.wait(0.1);
        local Waited_For_288 = task.wait(0.1);
        local Waited_For_289 = task.wait(0.1);
        local Waited_For_290 = task.wait(0.1);
        local Waited_For_291 = task.wait(0.1);
        local Waited_For_292 = task.wait(0.1);
        local Waited_For_293 = task.wait(0.1);
        local Waited_For_294 = task.wait(0.1);
        local Waited_For_295 = task.wait(0.1);
        local Waited_For_296 = task.wait(0.1);
        local Waited_For_297 = task.wait(0.1);
        local Waited_For_298 = task.wait(0.1);
        local Waited_For_299 = task.wait(0.1);
        local Waited_For_300 = task.wait(0.1);
        local Waited_For_301 = task.wait(0.1);
        local Waited_For_302 = task.wait(0.1);
        local Waited_For_303 = task.wait(0.1);
        local Waited_For_304 = task.wait(0.1);
        local Waited_For_305 = task.wait(0.1);
        local Waited_For_306 = task.wait(0.1);
        local Waited_For_307 = task.wait(0.1);
        local Waited_For_308 = task.wait(0.1);
        local Waited_For_309 = task.wait(0.1);
        local Waited_For_310 = task.wait(0.1);
        local Waited_For_311 = task.wait(0.1);
        local Waited_For_312 = task.wait(0.1);
        local Waited_For_313 = task.wait(0.1);
        local Waited_For_314 = task.wait(0.1);
        local Waited_For_315 = task.wait(0.1);
        local Waited_For_316 = task.wait(0.1);
        local Waited_For_317 = task.wait(0.1);
        local Waited_For_318 = task.wait(0.1);
        local Waited_For_319 = task.wait(0.1);
        local Waited_For_320 = task.wait(0.1);
        local Waited_For_321 = task.wait(0.1);
        local Waited_For_322 = task.wait(0.1);
        local Waited_For_323 = task.wait(0.1);
        local Waited_For_324 = task.wait(0.1);
        local Waited_For_325 = task.wait(0.1);
        local Waited_For_326 = task.wait(0.1);
        local Waited_For_327 = task.wait(0.1);
        local Waited_For_328 = task.wait(0.1);
        local Waited_For_329 = task.wait(0.1);
        local Waited_For_330 = task.wait(0.1);
        local Waited_For_331 = task.wait(0.1);
        local Waited_For_332 = task.wait(0.1);
        local Waited_For_333 = task.wait(0.1);
        local Waited_For_334 = task.wait(0.1);
        local Waited_For_335 = task.wait(0.1);
        local Waited_For_336 = task.wait(0.1);
        local Waited_For_337 = task.wait(0.1);
        local Waited_For_338 = task.wait(0.1);
        local Waited_For_339 = task.wait(0.1);
        local Waited_For_340 = task.wait(0.1);
        local Waited_For_341 = task.wait(0.1);
        local Waited_For_342 = task.wait(0.1);
        local Waited_For_343 = task.wait(0.1);
        local Waited_For_344 = task.wait(0.1);
        local Waited_For_345 = task.wait(0.1);
        local Waited_For_346 = task.wait(0.1);
        local Waited_For_347 = task.wait(0.1);
        local Waited_For_348 = task.wait(0.1);
        local Waited_For_349 = task.wait(0.1);
        local Waited_For_350 = task.wait(0.1);
        local Waited_For_351 = task.wait(0.1);
        local Waited_For_352 = task.wait(0.1);
        local Waited_For_353 = task.wait(0.1);
        local Waited_For_354 = task.wait(0.1);
        local Waited_For_355 = task.wait(0.1);
        local Waited_For_356 = task.wait(0.1);
        local Waited_For_357 = task.wait(0.1);
        local Waited_For_358 = task.wait(0.1);
        local Waited_For_359 = task.wait(0.1);
        local Waited_For_360 = task.wait(0.1);
        local Waited_For_361 = task.wait(0.1);
        local Waited_For_362 = task.wait(0.1);
        local Waited_For_363 = task.wait(0.1);
        local Waited_For_364 = task.wait(0.1);
        local Waited_For_365 = task.wait(0.1);
        local Waited_For_366 = task.wait(0.1);
        local Waited_For_367 = task.wait(0.1);
        local Waited_For_368 = task.wait(0.1);
        local Waited_For_369 = task.wait(0.1);
        local Waited_For_370 = task.wait(0.1);
        local Waited_For_371 = task.wait(0.1);
        local Waited_For_372 = task.wait(0.1);
        local Waited_For_373 = task.wait(0.1);
        local Waited_For_374 = task.wait(0.1);
        local Waited_For_375 = task.wait(0.1);
        local Waited_For_376 = task.wait(0.1);
        local Waited_For_377 = task.wait(0.1);
        local Waited_For_378 = task.wait(0.1);
        local Waited_For_379 = task.wait(0.1);
        local Waited_For_380 = task.wait(0.1);
        local Waited_For_381 = task.wait(0.1);
        local Waited_For_382 = task.wait(0.1);
        local Waited_For_383 = task.wait(0.1);
        local Waited_For_384 = task.wait(0.1);
        local Waited_For_385 = task.wait(0.1);
        local Waited_For_386 = task.wait(0.1);
        local Waited_For_387 = task.wait(0.1);
        local Waited_For_388 = task.wait(0.1);
        local Waited_For_389 = task.wait(0.1);
        local Waited_For_390 = task.wait(0.1);
        local Waited_For_391 = task.wait(0.1);
        local Waited_For_392 = task.wait(0.1);
        local Waited_For_393 = task.wait(0.1);
        local Waited_For_394 = task.wait(0.1);
        local Waited_For_395 = task.wait(0.1);
        local Waited_For_396 = task.wait(0.1);
        local Waited_For_397 = task.wait(0.1);
        local Waited_For_398 = task.wait(0.1);
        local Waited_For_399 = task.wait(0.1);
        local Waited_For_400 = task.wait(0.1);
        local Waited_For_401 = task.wait(0.1);
        local Waited_For_402 = task.wait(0.1);
        local Waited_For_403 = task.wait(0.1);
        local Waited_For_404 = task.wait(0.1);
        local Waited_For_405 = task.wait(0.1);
        local Waited_For_406 = task.wait(0.1);
        local Waited_For_407 = task.wait(0.1);
        local Waited_For_408 = task.wait(0.1);
        local Waited_For_409 = task.wait(0.1);
        local Waited_For_410 = task.wait(0.1);
        local Waited_For_411 = task.wait(0.1);
        local Waited_For_412 = task.wait(0.1);
        local Waited_For_413 = task.wait(0.1);
        local Waited_For_414 = task.wait(0.1);
        local Waited_For_415 = task.wait(0.1);
        local Waited_For_416 = task.wait(0.1);
        local Waited_For_417 = task.wait(0.1);
        local Waited_For_418 = task.wait(0.1);
        local Waited_For_419 = task.wait(0.1);
        local Waited_For_420 = task.wait(0.1);
        local Waited_For_421 = task.wait(0.1);
        local Waited_For_422 = task.wait(0.1);
        local Waited_For_423 = task.wait(0.1);
        local Waited_For_424 = task.wait(0.1);
        local Waited_For_425 = task.wait(0.1);
        local Waited_For_426 = task.wait(0.1);
        local Waited_For_427 = task.wait(0.1);
        local Waited_For_428 = task.wait(0.1);
        local Waited_For_429 = task.wait(0.1);
        local Waited_For_430 = task.wait(0.1);
        local Waited_For_431 = task.wait(0.1);
        local Waited_For_432 = task.wait(0.1);
        local Waited_For_433 = task.wait(0.1);
        local Waited_For_434 = task.wait(0.1);
        local Waited_For_435 = task.wait(0.1);
        local Waited_For_436 = task.wait(0.1);
        local Waited_For_437 = task.wait(0.1);
        local Waited_For_438 = task.wait(0.1);
        local Waited_For_439 = task.wait(0.1);
        local Waited_For_440 = task.wait(0.1);
        local Waited_For_441 = task.wait(0.1);
        local Waited_For_442 = task.wait(0.1);
        local Waited_For_443 = task.wait(0.1);
        local Waited_For_444 = task.wait(0.1);
        local Waited_For_445 = task.wait(0.1);
        local Waited_For_446 = task.wait(0.1);
        local Waited_For_447 = task.wait(0.1);
        local Waited_For_448 = task.wait(0.1);
        local Waited_For_449 = task.wait(0.1);
        local Waited_For_450 = task.wait(0.1);
        local Waited_For_451 = task.wait(0.1);
        local Waited_For_452 = task.wait(0.1);
        local Waited_For_453 = task.wait(0.1);
        local Waited_For_454 = task.wait(0.1);
        local Waited_For_455 = task.wait(0.1);
        local Waited_For_456 = task.wait(0.1);
        local Waited_For_457 = task.wait(0.1);
        local Waited_For_458 = task.wait(0.1);
        local Waited_For_459 = task.wait(0.1);
        local Waited_For_460 = task.wait(0.1);
        local Waited_For_461 = task.wait(0.1);
        local Waited_For_462 = task.wait(0.1);
        local Waited_For_463 = task.wait(0.1);
        local Waited_For_464 = task.wait(0.1);
        local Waited_For_465 = task.wait(0.1);
        local Waited_For_466 = task.wait(0.1);
        local Waited_For_467 = task.wait(0.1);
        local Waited_For_468 = task.wait(0.1);
        local Waited_For_469 = task.wait(0.1);
        local Waited_For_470 = task.wait(0.1);
        local Waited_For_471 = task.wait(0.1);
        local Waited_For_472 = task.wait(0.1);
        local Waited_For_473 = task.wait(0.1);
        local Waited_For_474 = task.wait(0.1);
        local Waited_For_475 = task.wait(0.1);
        local Waited_For_476 = task.wait(0.1);
        local Waited_For_477 = task.wait(0.1);
        local Waited_For_478 = task.wait(0.1);
        local Waited_For_479 = task.wait(0.1);
        local Waited_For_480 = task.wait(0.1);
        local Waited_For_481 = task.wait(0.1);
        local Waited_For_482 = task.wait(0.1);
        local Waited_For_483 = task.wait(0.1);
        local Waited_For_484 = task.wait(0.1);
        local Waited_For_485 = task.wait(0.1);
        local Waited_For_486 = task.wait(0.1);
        local Waited_For_487 = task.wait(0.1);
        local Waited_For_488 = task.wait(0.1);
        local Waited_For_489 = task.wait(0.1);
        local Waited_For_490 = task.wait(0.1);
        local Waited_For_491 = task.wait(0.1);
        local Waited_For_492 = task.wait(0.1);
        local Waited_For_493 = task.wait(0.1);
        local Waited_For_494 = task.wait(0.1);
        local Waited_For_495 = task.wait(0.1);
        error("C:\\Users\\Administrator\\Downloads\\YetAnotherBot\\unveilr\\main:659: too many operations")

    end);

end);