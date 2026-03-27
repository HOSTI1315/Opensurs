-- ts file was generated at discord.gg/25ms


local genv = getgenv()
local fenv = getfenv()
local _3 = game:GetService("Players")
local _5 = game:GetService("RunService")
game:GetService("TweenService")
game:GetService("TextService")
local _ = game:GetService("Workspace").CurrentCamera
local _15 = _3.LocalPlayer
local _19 = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local _31 = _19:CreateWindow({
    SideBarWidth = 190,
    Author = "by Leakg0d",
    Resizable = true,
    OpenButton = {
        StrokeThickness = 3,
        Title = "Flash Hub - Open",
        Enabled = true,
        Color = ColorSequence.new(Color3.fromHex("#30FF6A"), Color3.fromHex("#e7ff2f")),
        Draggable = true,
        OnlyMobile = false,
        CornerRadius = UDim.new(1, 0),
    },
    Folder = "MVSG",
    ScrollBarEnabled = false,
    Title = "Flash Hub | Murders Vs Sherrifs",
    Transparent = true,
    HideSearchBar = true,
    Theme = "Midnight",
    Icon = "square-function",
    Size = UDim2.fromOffset(700, 100),
})
local _34 = _31.ConfigManager:CreateConfig("default")
Vector3.new(2, 2, 1)
tick()
local _41 = game:GetService("VirtualUser")
genv.aimConfig = {
    VELOCITY_FACTOR = 1.2,
    AUTO_EQUIP = true,
    CAMERA_CAST = true,
    RAYCAST_DISTANCE = 1000,
    ACTION_TIME = 0.3,
    MAX_VELOCITY = 40,
    ACCURACY_BUILDUP = 0.8,
    MIN_DEVIATION = 1,
    EQUIP_LOOP = 0.3,
    VISIBLE_PARTS = 4,
    MAX_DISTANCE = 250,
    BASE_DEVIATION = 2.1,
    DISTANCE_FACTOR = 0.8,
    DEVIATION_ENABLED = true,
    REACTION_TIME = 0.18,
    NATIVE_UI = true,
    FOV_CHECK = true,
}
fenv.loadModule = function(_42, _42_2, _42_3, _42_4, _42_5)
    local _ = fenv.Repository
    loadstring(game:HttpGet(nil .. _42))()
end
fenv.lockToggle = function(_49, _49_2)

end
local _51 = _31:Tab({
    Locked = false,
    Title = "Shooter",
    Icon = "focus",
})
_51:Toggle({
    Callback = function(_54, _54_2, _54_3, _54_4)
        error("line 1: attempt to concatenate nil with string")
    end,
    Title = "Auto Shoot status",
    Desc = "Enable/Disable the auto shoot",
})
local _56 = _51:Toggle({
    Value = true,
    Callback = function(_57, _57_2, _57_3, _57_4)
        local _ = genv.aimConfig
        local _ = fenv.saveFlag
    end,
    Title = "Native Raycast Method",
    Desc = "Whether or not to check player visibility in the same way that the game does, if enabled doubles the amount of work the script has to do per check",
})
local _61 = _51:Toggle({
    Value = true,
    Callback = function(_62, _62_2, _62_3, _62_4, _62_5)
        local _ = genv.aimConfig
    end,
    Title = "FOV Check",
    Desc = "Whether or not to check if the target is in the current fov before selecting it",
})
_51:Toggle({
    Value = true,
    Callback = function(_66)
        local _ = genv.aimConfig
    end,
    Title = "Auto Equip",
    Desc = "Whether or not the script should automatically switch or equip the best available weapon",
})
_51:Toggle({
    Value = true,
    Callback = function(_70, _70_2, _70_3)
        local _ = genv.aimConfig
    end,
    Title = "Native User Interface",
    Desc = "Whether or not the script should render the gun cooldown and tool equip highlights",
})
_51:Toggle({
    Value = true,
    Callback = function(_74, _74_2)
        local _ = genv.aimConfig
    end,
    Title = "Aim Deviation",
    Desc = "Whether or not the script should sometimes misfire when using the gun",
})
_51:Slider({
    Value = {
        Min = 50,
        Default = 250,
        Max = 1000,
    },
    Callback = function(_78, _78_2, _78_3, _78_4, _78_5, _78_6)
        local _ = genv.aimConfig
    end,
    Title = "Maximum distance",
    Desc = "The maximum distance at which the script will no longer target enemies",
})
local _81 = _51:Slider({
    Value = {
        Min = 20,
        Default = 40,
        Max = 200,
    },
    Callback = function(_82)
        local _ = genv.aimConfig
    end,
    Title = "Maximum velocity",
    Desc = "The maximum target velocity at which the script will no longer attempt to shoot a target",
})
local _85 = _51:Slider({
    Value = {
        Min = 1,
        Default = 4,
        Max = 18,
    },
    Callback = function(_86, _86_2, _86_3, _86_4)
        local _ = genv.aimConfig
    end,
    Title = "Required Visible Parts",
    Desc = "The amount of visible player parts the script will require before selecting a target",
})
local _89 = _51:Slider({
    Title = "Reaction Time",
    Value = {
        Min = 0.01,
        Default = 0.18,
        Max = 1,
    },
    Callback = function(_90, _90_2, _90_3)
        local _ = genv.aimConfig
    end,
    Step = 0.01,
    Desc = "The amount of time the script will wait before attacking a given target, is not applied when 'Switch Weapons' is toggled",
})
local _93 = _51:Slider({
    Title = "Action Time",
    Value = {
        Min = 0.2,
        Default = 0.32,
        Max = 4,
    },
    Callback = function(_94)
        local _ = genv.aimConfig
    end,
    Step = 0.01,
    Desc = "The amount of time the script will wait after switching or equipping a weapon before attacking a given target, is not applied when 'Switch Weapons' is not toggled",
})
local _97 = _51:Slider({
    Title = "Equip Time",
    Value = {
        Min = 0.1,
        Default = 0.3,
        Max = 4,
    },
    Callback = function(_98, _98_2)
        local _ = genv.aimConfig
    end,
    Step = 0.1,
    Desc = "The amount of time the script will wait before checking what is the best weapon to equip again.",
})
local _101 = _51:Slider({
    Title = "Base Deviation",
    Value = {
        Min = 0.5,
        Default = 2.1,
        Max = 5,
    },
    Callback = function(_102, _102_2, _102_3, _102_4, _102_5, _102_6)
        local _ = genv.aimConfig
    end,
    Step = 0.1,
    Desc = "Base aim inaccuracy in degrees, controls how much the aim naturally deviates",
})
local _105 = _51:Slider({
    Title = "Distance Factor",
    Value = {
        Min = 0,
        Default = 0.8,
        Max = 2,
    },
    Callback = function(_106, _106_2)
        local _ = genv.aimConfig
    end,
    Step = 0.1,
    Desc = "Additional deviation penalty for distance - higher values make long shots less accurate",
})
local _109 = _51:Slider({
    Title = "Velocity Factor",
    Value = {
        Min = 0,
        Default = 1.2,
        Max = 2,
    },
    Callback = function(_110, _110_2)
        local _ = genv.aimConfig
    end,
    Step = 0.1,
    Desc = "Additional deviation penalty for moving targets - higher values make moving targets harder to hit",
})
local _113 = _51:Slider({
    Title = "Accuracy Buildup",
    Value = {
        Min = 0,
        Default = 0.8,
        Max = 2,
    },
    Callback = function(_114, _114_2)
        local _ = genv.aimConfig
    end,
    Step = 0.01,
    Desc = "How much accuracy improves with consecutive shots - higher values = faster improvement",
})
_51:Slider({
    Title = "Min Deviation",
    Value = {
        Min = 0.1,
        Default = 1,
        Max = 3,
    },
    Callback = function(_118, _118_2, _118_3, _118_4, _118_5, _118_6)
        local _ = genv.aimConfig
    end,
    Step = 0.1,
    Desc = "Minimum deviation that always remains - prevents perfect accuracy",
})
local _121 = _31:Tab({
    Locked = false,
    Title = "Crasher",
    Icon = "settings",
})
_121:Section({
    Title = "Match Lagger",
})
local _125 = _121:Button({
    Title = "Execute Match Lagger (By Flash Hub)",
    Callback = function(_126, _126_2, _126_3, _126_4, _126_5)
        _19:Notify({
            Icon = "download",
            Duration = 3,
            Title = "Match Lagger V2",
            Content = "Loading script...",
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/MatchLaggerV2"))()
        _19:Notify({
            Icon = "check-circle",
            Duration = 5,
            Title = "Match Lagger V2",
            Content = "Script executed successfully!",
        })
    end,
})
_121:Paragraph({
    Title = "Match Lagger V2",
    Desc = "Only working lagger in MVSD!",
})
_34:Register("MatchLaggerButton", _125)
local _140 = game:GetService("Players")
local _142 = game:GetService("RunService")
local _143 = _140.LocalPlayer
game:GetService("ReplicatedStorage"):WaitForChild("Ability"):WaitForChild("ActivateShroud")
_121:Section({
    Title = "Blind All",
})
local _153 = _121:Toggle({
    Callback = function(_154, _154_2, _154_3, _154_4, _154_5, _154_6)
        _142.Heartbeat:Connect(function(_158, _158_2)
            local _ = tick() - 0
            error("line 1: attempt to compare number <= table")
        end)
        _19:Notify({
            Icon = "eye-off",
            Duration = 3,
            Title = "Blind All Started",
            Content = "Blinding all enemies...",
        })
    end,
    Title = "Loop Blind All",
    Desc = "Loop Blind all enemies instantly",
})
_121:Paragraph({
    Title = "Blind All Information",
    Desc = "Equip your Shroud Tool, then Enable the loop blind all toggle, and you are done!",
})
_34:Register("BlindAllToggle", _153)
_143.AncestryChanged:Connect(function()
    local _ = _143.Parent
end)
local _173 = _31:Tab({
    Locked = false,
    Title = "Combat",
    Icon = "swords",
})
local _175 = _31:Tab({
    Title = "Streak Farm",
    Icon = "user-check",
})
Vector3.new(32, - 115, 16)
Vector3.new(36, - 115, 16)
Vector3.new(- 46, - 118, 36)
_175:Section({
    Title = "Information",
})
_175:Paragraph({
    Title = "Read This Message",
    Desc = "Streak farm account is for the account you want the Streak farm, the 2nd Account is the one that helps the streak farm account get a High streak!",
})
_175:Section({
    Title = "Streak Farm Account",
})
local _189 = _175:Input({
    Callback = function(_190, _190_2, _190_3)
    end,
    Placeholder = "Enter username...",
    Title = "Whitelist User",
    Desc = "Enter part or full username...",
})
local _192 = _175:Button({
    Callback = function(_193, _193_2, _193_3, _193_4)
        for _198, _198_2 in ipairs(_140:GetPlayers()) do
            local _ = _198_2 == _143
            local _202 = _198_2.Name:lower()
            _198_2.DisplayName:lower()
            _202:find(_190:lower(), 1, true)
            local _ = fenv.WindUI
            local _ = "Whitelisted: " .. _198_2.Name
            error("line 1: attempt to index nil with 'Notify'")
        end
    end,
    Title = "Add Player Whitelist",
    Desc = "Whitelist the specified player",
})
local _212 = _175:Toggle({
    Callback = function(_213, _213_2)
        local _ = _143.Character
        _143.Character:FindFirstChild("HumanoidRootPart")
        local _ = _143.Character:FindFirstChild("HumanoidRootPart").Position
        _142.Heartbeat:Connect(function(_225, _225_2, _225_3)
            local _ = _143.Character
            _143.Character:FindFirstChild("HumanoidRootPart")
            _143.Character:FindFirstChild("HumanoidRootPart")
            local _ = _143.Team
            local _ = _143.Character
            _143.Character:FindFirstChild("HumanoidRootPart")
            local _238 = _143.Character
            local _ = _198_2.Character
            _198_2.Character:FindFirstChild("HumanoidRootPart")
            local _243 = _198_2.Character
            local _245 = _238:FindFirstChild("HumanoidRootPart")
            local _247 = _243:FindFirstChild("HumanoidRootPart")
            _245.CFrame = CFrame.new((_247.Position - ((_247.Position - _245.Position).Unit * 2)))
        end)
        error("line 1: attempt to index nil with 'Notify'")
    end,
    Title = "Auto Gamemode Teleport",
    Desc = "Spam teleports to gamemode position - Must Toggle ON",
})
_175:Toggle({
    Callback = function(_259, _259_2, _259_3, _259_4, _259_5, _259_6)
        error("line 1: attempt to concatenate nil with string")
    end,
    Title = "Auto Shoot status",
    Desc = "This is needed for the Streak Farm, only on Main Account Farm!",
})
fenv.enableAntiAFK = function(_260, _260_2, _260_3, _260_4, _260_5)
    for _266, _266_2 in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
        local _ = _266_2.Disable
        _266_2:Disable()
    end
end
fenv.disableAntiAFK = function()
    local _274 = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function(_279, _279_2)
        _274:CaptureController()
        _274.ClickButton2(_274, Vector2.new())
    end)
end
local _287 = _175:Toggle({
    Callback = function(_288, _288_2, _288_3, _288_4)
        game:GetService("Players").LocalPlayer.Idled:Connect(function(_295, _295_2, _295_3, _295_4)
            game:GetService("VirtualUser"):CaptureController()
            local _301 = game:GetService("VirtualUser")
            _301.ClickButton2(_301, Vector2.new())
        end)
        local _ = fenv.Rayfield
        error("line 1: attempt to index nil with 'Notify'")
    end,
    Title = "Anti-AFK",
    Desc = "Avoids any Disconnection (Must Toggle ON)",
})
_175:Divider()
_175:Section({
    Title = "2nd Account Settings",
})
local _312 = _175:Input({
    Callback = function(_313, _313_2, _313_3, _313_4)
    end,
    Placeholder = "Enter username...",
    Title = "Whitelist User",
    Desc = "Enter part or full username...",
})
local _315 = _175:Button({
    Callback = function(_316, _316_2, _316_3)
        for _321, _321_2 in ipairs(_140:GetPlayers()) do
            local _ = _321_2 == _143
            local _325 = _321_2.Name:lower()
            _321_2.DisplayName:lower()
            _325:find(_313:lower(), 1, true)
            local _ = _198_2 == _321_2
            local _ = "Whitelisted: " .. _321_2.Name
            error("line 1: attempt to index nil with 'Notify'")
        end
    end,
    Title = "Add Player Whitelist",
    Desc = "Whitelist the specified player",
})
local _335 = _175:Toggle({
    Callback = function(_336, _336_2, _336_3)
        local _ = _143.Character
        _143.Character:FindFirstChild("HumanoidRootPart")
        local _ = _143.Character:FindFirstChild("HumanoidRootPart").Position
        _142.Heartbeat:Connect(function()
            local _ = _143.Character
            _143.Character:FindFirstChild("HumanoidRootPart")
            _143.Character:FindFirstChild("HumanoidRootPart")
            local _ = _143.Team
            local _ = _143.Character
            _143.Character:FindFirstChild("HumanoidRootPart")
            local _361 = _143.Character
            local _ = _321_2.Character
            _321_2.Character:FindFirstChild("HumanoidRootPart")
            local _366 = _321_2.Character
            local _368 = _361:FindFirstChild("HumanoidRootPart")
            local _370 = _366:FindFirstChild("HumanoidRootPart")
            _368.CFrame = CFrame.new((_370.Position - ((_370.Position - _368.Position).Unit * 2)))
        end)
        error("line 1: attempt to index nil with 'Notify'")
    end,
    Title = "Auto Gamemode Teleport",
    Desc = "Spam teleports to gamemode position - Must Toggle ON",
})
local _381 = _175:Toggle({
    Callback = function(_382, _382_2)
        game:GetService("Players").LocalPlayer.Idled:Connect(function(_389, _389_2, _389_3, _389_4)
            game:GetService("VirtualUser"):CaptureController()
            local _395 = game:GetService("VirtualUser")
            _395.ClickButton2(_395, Vector2.new())
        end)
        error("line 1: attempt to index nil with 'Notify'")
    end,
    Title = "Anti-AFK",
    Desc = "Avoids any Disconnection (Must Toggle ON)",
})
_175:Divider()
_175:Section({
    Title = "Current Whitelist Status",
})
local _405 = _175:Button({
    Callback = function(_406, _406_2, _406_3, _406_4)
        _189:Set("")
        _312:Set("")
        error("line 1: attempt to index nil with 'Notify'")
    end,
    Title = "Clear All Whitelists",
    Desc = "Remove all whitelisted players",
})
_34:Register("MainWhitelistInput", _189)
_34:Register("MainAddWhitelistButton", _192)
_34:Register("MainAutoTeleportToggle", _212)
_34:Register("SecondWhitelistInput", _312)
_34:Register("SecondAddWhitelistButton", _315)
_34:Register("SecondAutoTeleportToggle", _335)
_34:Register("ClearWhitelistButton", _405)
_34:Register("AntiAfkToggle", _381)
_34:Register("AntiAfkToggleTwo", _287)
local _430 = _31:Tab({
    Locked = false,
    Title = "Render",
    Icon = "eye",
})
local _432 = _31:Tab({
    Locked = false,
    Title = "Player",
    Icon = "move",
})
local _434 = _31:Tab({
    Locked = false,
    Title = "Exploit",
    Icon = "zap",
})
_31:Tab({
    Locked = false,
    Title = "Kill All",
    Icon = "target",
})
local _438 = _31:Tab({
    Locked = false,
    Title = "Utility",
    Icon = "settings",
})
_173:Section({
    Title = "Player Attach",
})
_173:Toggle({
    Callback = function(_443, _443_2, _443_3, _443_4, _443_5, _443_6)
        _5.RenderStepped:Connect(function(_447, _447_2, _447_3)
            local _ = _15.Character
            _15.Character:FindFirstChild("HumanoidRootPart")
            local _452 = _15.Character
            _452:FindFirstChild("HumanoidRootPart")
            for _458, _458_2 in ipairs(_15.Backpack:GetChildren()) do
                _458_2:IsA("Tool")
                for _463, _463_2 in ipairs(_452:GetChildren()) do
                    _463_2:IsA("Tool")
                    for _468, _468_2 in ipairs(_3:GetPlayers()) do
                        local _ = _468_2 == _15
                        local _ = _468_2.Team == _15.Team
                        local _ = _468_2.Team
                        local _ = _468_2.Character
                        _468_2.Character:FindFirstChild("HumanoidRootPart")
                        local _478 = _468_2.Character
                        _478:FindFirstChild("HumanoidRootPart")
                        local _ = _478:FindFirstChildOfClass("Humanoid").Health
                        error("line 1: attempt to compare number < table")
                    end
                end
            end
        end)
    end,
    Title = "Player Attach (VERY BUGGY)",
    Desc = "Automatically position behind enemies",
})
local _485 = _173:Slider({
    Value = {
        Min = 1,
        Default = 3,
        Max = 10,
    },
    Callback = function(_486, _486_2, _486_3, _486_4, _486_5, _486_6)
    end,
    Title = "Behind Distance",
    Desc = "Distance to maintain behind targets",
})
_173:Section({
    Title = "Knife Reach",
})
_173:Toggle({
    Callback = function(_491, _491_2, _491_3, _491_4, _491_5)
        _5.RenderStepped:Connect(function(_495, _495_2, _495_3)
            local _ = _15.Character
            _15.Character:FindFirstChild("HumanoidRootPart")
            for _503, _503_2 in ipairs(_15.Character:GetChildren()) do
                _503_2:IsA("Tool")
                _503_2.Name:lower():find("knife")
                local _512 = _503_2:FindFirstChild("Handle")
                _512.Size = Vector3.new(10, _512.Size.Y, _512.Size.Z)
            end
        end)
    end,
    Title = "Knife Reach",
    Desc = "Extend knife attack range",
})
local _520 = _173:Slider({
    Value = {
        Min = 5,
        Default = 10,
        Max = 20,
    },
    Callback = function(_521)
    end,
    Title = "Knife Reach Distance",
    Desc = "Extended reach distance for knives",
})
_173:Section({
    Title = "Silent Aim",
})
_173:Toggle({
    Callback = function(_526, _526_2, _526_3, _526_4)
    end,
    Title = "Silent Aim",
    Desc = "Enable silent aim functionality",
})
_430:Section({
    Title = "MVSD ESPs",
})
_430:Toggle({
    Callback = function(_531)
        for _534, _534_2 in ipairs(_3:GetPlayers()) do
            local _ = _534_2.Character
            _534_2.Character:FindFirstChild("HumanoidRootPart")
            local _ = _534_2.Character
            local _ = _534_2.Character
            _534_2.Character:FindFirstChild("HumanoidRootPart")
            local _544 = _534_2.Character
            local _ = _534_2.UserId
            local _547 = Instance.new("Highlight")
            _547.Name = "ESP_Highlight"
            _547.FillTransparency = 0.3
            _547.OutlineTransparency = 0
            _547.Adornee = _544
            _547.Parent = _544
            _547.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            local _ = _534_2.Team == _15.Team
            _547.FillColor = Color3.fromRGB(255, 85, 85)
            _547.OutlineColor = Color3.fromRGB(200, 0, 0)
            local _ = _534_2.UserId
            _544:FindFirstChildOfClass("Humanoid").Died:Once(function(_563, _563_2, _563_3, _563_4)
                local _ = _534_2.UserId
            end)
            _534_2.CharacterAdded:Connect(function(_568, _568_2, _568_3)
                _568:WaitForChild("HumanoidRootPart", 5)
                task.wait(0.1)
                local _ = _534_2.Character
                _534_2.Character:FindFirstChild("HumanoidRootPart")
                local _575 = _534_2.Character
                local _ = _534_2.UserId
                local _578 = Instance.new("Highlight")
                _578.Name = "ESP_Highlight"
                _578.FillTransparency = 0.3
                _578.OutlineTransparency = 0
                _578.Adornee = _575
                _578.Parent = _575
                _578.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                local _ = _534_2.Team == _15.Team
                _578.FillColor = Color3.fromRGB(255, 85, 85)
                _578.OutlineColor = Color3.fromRGB(200, 0, 0)
                local _ = _534_2.UserId
                _575:FindFirstChildOfClass("Humanoid").Died:Once(function(_594, _594_2, _594_3, _594_4)
                    local _ = _534_2.UserId
                end)
            end)
        end
        _3.PlayerAdded:Connect(function(_599, _599_2)
            local _ = _599.Character
            _599.Character:FindFirstChild("HumanoidRootPart")
            local _ = _599.Character
            local _ = _599.Character
            _599.Character:FindFirstChild("HumanoidRootPart")
            local _609 = _599.Character
            local _ = _599.UserId
            local _612 = Instance.new("Highlight")
            _612.Name = "ESP_Highlight"
            _612.FillTransparency = 0.3
            _612.OutlineTransparency = 0
            _612.Adornee = _609
            _612.Parent = _609
            _612.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            local _ = _599.Team == _15.Team
            _612.FillColor = Color3.fromRGB(255, 85, 85)
            _612.OutlineColor = Color3.fromRGB(200, 0, 0)
            local _ = _599.UserId
            _609:FindFirstChildOfClass("Humanoid").Died:Once(function(_628, _628_2, _628_3, _628_4)
                local _ = _599.UserId
            end)
            _599.CharacterAdded:Connect(function(_633, _633_2, _633_3)
                _633:WaitForChild("HumanoidRootPart", 5)
                task.wait(0.1)
                local _ = _599.Character
                _599.Character:FindFirstChild("HumanoidRootPart")
                local _640 = _599.Character
                local _ = _599.UserId
                local _643 = Instance.new("Highlight")
                _643.Name = "ESP_Highlight"
                _643.FillTransparency = 0.3
                _643.OutlineTransparency = 0
                _643.Adornee = _640
                _643.Parent = _640
                _643.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                local _ = _599.Team == _15.Team
                _643.FillColor = Color3.fromRGB(255, 85, 85)
                _643.OutlineColor = Color3.fromRGB(200, 0, 0)
                local _ = _599.UserId
                _640:FindFirstChildOfClass("Humanoid").Died:Once(function(_659, _659_2, _659_3, _659_4)
                    local _ = _599.UserId
                end)
            end)
        end)
        _3.PlayerRemoving:Connect(function(_664)
            local _ = _664.UserId
        end)
    end,
    Title = "ESP",
    Desc = "Enable ESP for players",
})
_430:Toggle({
    Callback = function(_668, _668_2, _668_3, _668_4, _668_5)
        for _671, _671_2 in ipairs(_3:GetPlayers()) do
            local _ = _671_2 == _15
            local _ = _671_2 == _15
            local _ = _671_2.Team == _15.Team
            local _ = _671_2.Team
            local _ = _671_2.Character
            _671_2.Character:FindFirstChild("HumanoidRootPart")
            local _682 = _671_2.Character
            local _684 = Instance.new("Highlight")
            _684.Name = "ChamsHighlight"
            _684.FillColor = Color3.fromRGB(255, 0, 0)
            _684.OutlineColor = Color3.fromRGB(255, 100, 100)
            _684.FillTransparency = 0.3
            _684.OutlineTransparency = 0
            _684.Adornee = _682
            _684.Parent = _682
            _682.ChildAdded:Connect(function(_692)
                _692:IsA("Highlight")
                local _ = _692.Name
            end)
        end
        _3.PlayerAdded:Connect(function(_699, _699_2, _699_3, _699_4)
            _699.CharacterAdded:Connect(function(_703, _703_2, _703_3, _703_4, _703_5)
                local _ = _699 == _15
                local _ = _699.Team == _15.Team
                local _ = _699.Team
                local _710 = Instance.new("Highlight")
                _710.Name = "ChamsHighlight"
                _710.FillColor = Color3.fromRGB(255, 0, 0)
                _710.OutlineColor = Color3.fromRGB(255, 100, 100)
                _710.FillTransparency = 0.3
                _710.OutlineTransparency = 0
                _710.Adornee = _703
                _710.Parent = _703
            end)
        end)
        _19:Notify({
            Icon = "eye",
            Duration = 3,
            Title = "Chams",
            Content = "Chams enabled! Enemy players highlighted in red.",
        })
    end,
    Title = "Chams",
    Desc = "Enable chams for enemies",
})
_430:Toggle({
    Callback = function(_719, _719_2)
        for _722, _722_2 in ipairs(_3:GetPlayers()) do
            local _ = _722_2 == _15
            local _ = _722_2.Character
            local _725 = _722_2.Character
            local _727 = _725:WaitForChild("HumanoidRootPart")
            local _729 = _725:FindFirstChildOfClass("Humanoid")
            local _731 = Instance.new("BillboardGui")
            _731.Name = "Nametag"
            _731.AlwaysOnTop = true
            _731.Size = UDim2.new(0, 200, 0, 50)
            _731.StudsOffset = Vector3.new(0, 3, 0)
            _731.Adornee = _727
            _731.Parent = _727
            local _737 = Instance.new("Frame")
            _737.Size = UDim2.new(1, 0, 1, 0)
            _737.BackgroundTransparency = 1
            _737.Parent = _731
            local _741 = Instance.new("TextLabel")
            _741.Size = UDim2.new(1, 0, 0.5, 0)
            _741.Position = UDim2.new(0, 0, 0, 0)
            _741.BackgroundTransparency = 1
            local _ = _722_2.DisplayName == _722_2.Name
            _741.Text = _722_2.DisplayName .. " (@" .. _722_2.Name .. ")"
            local _ = _722_2.Team == _15.Team
            _741.TextColor3 = Color3.fromRGB(255, 0, 0)
            _741.TextSize = 14
            _741.Font = Enum.Font.GothamBold
            _741.Parent = _737
            local _762 = Instance.new("TextLabel")
            _762.Size = UDim2.new(1, 0, 0.5, 0)
            _762.Position = UDim2.new(0, 0, 0.5, 0)
            _762.BackgroundTransparency = 1
            _762.TextColor3 = Color3.fromRGB(255, 255, 255)
            _762.TextSize = 12
            _762.Font = Enum.Font.Gotham
            _762.Parent = _737
            _731.Enabled = _719
            local _ = _731.Parent
            local _ = _727.Parent
            local _780, _780_2, _780_3 = math.floor(_729.Health)
            local _782, _782_2, _782_3 = math.floor(_729.MaxHealth)
            local _786, _786_2, _786_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _780 .. "/" .. _782 .. " | " .. _786 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _799, _799_2, _799_3 = math.floor(_729.Health)
            local _801, _801_2, _801_3 = math.floor(_729.MaxHealth)
            local _805, _805_2, _805_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _799 .. "/" .. _801 .. " | " .. _805 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _818, _818_2, _818_3 = math.floor(_729.Health)
            local _820, _820_2, _820_3 = math.floor(_729.MaxHealth)
            local _824, _824_2, _824_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _818 .. "/" .. _820 .. " | " .. _824 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _837, _837_2, _837_3 = math.floor(_729.Health)
            local _839, _839_2, _839_3 = math.floor(_729.MaxHealth)
            local _843, _843_2, _843_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _837 .. "/" .. _839 .. " | " .. _843 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _856, _856_2, _856_3 = math.floor(_729.Health)
            local _858, _858_2, _858_3 = math.floor(_729.MaxHealth)
            local _862, _862_2, _862_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _856 .. "/" .. _858 .. " | " .. _862 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _875, _875_2, _875_3 = math.floor(_729.Health)
            local _877, _877_2, _877_3 = math.floor(_729.MaxHealth)
            local _881, _881_2, _881_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _875 .. "/" .. _877 .. " | " .. _881 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _894, _894_2, _894_3 = math.floor(_729.Health)
            local _896, _896_2, _896_3 = math.floor(_729.MaxHealth)
            local _900, _900_2, _900_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _894 .. "/" .. _896 .. " | " .. _900 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _913, _913_2, _913_3 = math.floor(_729.Health)
            local _915, _915_2, _915_3 = math.floor(_729.MaxHealth)
            local _919, _919_2, _919_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _913 .. "/" .. _915 .. " | " .. _919 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _932, _932_2, _932_3 = math.floor(_729.Health)
            local _934, _934_2, _934_3 = math.floor(_729.MaxHealth)
            local _938, _938_2, _938_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _932 .. "/" .. _934 .. " | " .. _938 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _951, _951_2, _951_3 = math.floor(_729.Health)
            local _953, _953_2, _953_3 = math.floor(_729.MaxHealth)
            local _957, _957_2, _957_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _951 .. "/" .. _953 .. " | " .. _957 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _970, _970_2, _970_3 = math.floor(_729.Health)
            local _972, _972_2, _972_3 = math.floor(_729.MaxHealth)
            local _976, _976_2, _976_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _970 .. "/" .. _972 .. " | " .. _976 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _989, _989_2, _989_3 = math.floor(_729.Health)
            local _991, _991_2, _991_3 = math.floor(_729.MaxHealth)
            local _995, _995_2, _995_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _989 .. "/" .. _991 .. " | " .. _995 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1008, _1008_2, _1008_3 = math.floor(_729.Health)
            local _1010, _1010_2, _1010_3 = math.floor(_729.MaxHealth)
            local _1014, _1014_2, _1014_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1008 .. "/" .. _1010 .. " | " .. _1014 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1027, _1027_2, _1027_3 = math.floor(_729.Health)
            local _1029, _1029_2, _1029_3 = math.floor(_729.MaxHealth)
            local _1033, _1033_2, _1033_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1027 .. "/" .. _1029 .. " | " .. _1033 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1046, _1046_2, _1046_3 = math.floor(_729.Health)
            local _1048, _1048_2, _1048_3 = math.floor(_729.MaxHealth)
            local _1052, _1052_2, _1052_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1046 .. "/" .. _1048 .. " | " .. _1052 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1065, _1065_2, _1065_3 = math.floor(_729.Health)
            local _1067, _1067_2, _1067_3 = math.floor(_729.MaxHealth)
            local _1071, _1071_2, _1071_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1065 .. "/" .. _1067 .. " | " .. _1071 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1084, _1084_2, _1084_3 = math.floor(_729.Health)
            local _1086, _1086_2, _1086_3 = math.floor(_729.MaxHealth)
            local _1090, _1090_2, _1090_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1084 .. "/" .. _1086 .. " | " .. _1090 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1103, _1103_2, _1103_3 = math.floor(_729.Health)
            local _1105, _1105_2, _1105_3 = math.floor(_729.MaxHealth)
            local _1109, _1109_2, _1109_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1103 .. "/" .. _1105 .. " | " .. _1109 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1122, _1122_2, _1122_3 = math.floor(_729.Health)
            local _1124, _1124_2, _1124_3 = math.floor(_729.MaxHealth)
            local _1128, _1128_2, _1128_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1122 .. "/" .. _1124 .. " | " .. _1128 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1141, _1141_2, _1141_3 = math.floor(_729.Health)
            local _1143, _1143_2, _1143_3 = math.floor(_729.MaxHealth)
            local _1147, _1147_2, _1147_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1141 .. "/" .. _1143 .. " | " .. _1147 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1160, _1160_2, _1160_3 = math.floor(_729.Health)
            local _1162, _1162_2, _1162_3 = math.floor(_729.MaxHealth)
            local _1166, _1166_2, _1166_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1160 .. "/" .. _1162 .. " | " .. _1166 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1179, _1179_2, _1179_3 = math.floor(_729.Health)
            local _1181, _1181_2, _1181_3 = math.floor(_729.MaxHealth)
            local _1185, _1185_2, _1185_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1179 .. "/" .. _1181 .. " | " .. _1185 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1198, _1198_2, _1198_3 = math.floor(_729.Health)
            local _1200, _1200_2, _1200_3 = math.floor(_729.MaxHealth)
            local _1204, _1204_2, _1204_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1198 .. "/" .. _1200 .. " | " .. _1204 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1217, _1217_2, _1217_3 = math.floor(_729.Health)
            local _1219, _1219_2, _1219_3 = math.floor(_729.MaxHealth)
            local _1223, _1223_2, _1223_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1217 .. "/" .. _1219 .. " | " .. _1223 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1236, _1236_2, _1236_3 = math.floor(_729.Health)
            local _1238, _1238_2, _1238_3 = math.floor(_729.MaxHealth)
            local _1242, _1242_2, _1242_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1236 .. "/" .. _1238 .. " | " .. _1242 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1255, _1255_2, _1255_3 = math.floor(_729.Health)
            local _1257, _1257_2, _1257_3 = math.floor(_729.MaxHealth)
            local _1261, _1261_2, _1261_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1255 .. "/" .. _1257 .. " | " .. _1261 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1274, _1274_2, _1274_3 = math.floor(_729.Health)
            local _1276, _1276_2, _1276_3 = math.floor(_729.MaxHealth)
            local _1280, _1280_2, _1280_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1274 .. "/" .. _1276 .. " | " .. _1280 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1293, _1293_2, _1293_3 = math.floor(_729.Health)
            local _1295, _1295_2, _1295_3 = math.floor(_729.MaxHealth)
            local _1299, _1299_2, _1299_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1293 .. "/" .. _1295 .. " | " .. _1299 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1312, _1312_2, _1312_3 = math.floor(_729.Health)
            local _1314, _1314_2, _1314_3 = math.floor(_729.MaxHealth)
            local _1318, _1318_2, _1318_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1312 .. "/" .. _1314 .. " | " .. _1318 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _1331, _1331_2, _1331_3 = math.floor(_729.Health)
            local _1333, _1333_2, _1333_3 = math.floor(_729.MaxHealth)
            local _1337, _1337_2, _1337_3 = math.floor((_727.Position - _15.Character.HumanoidRootPart.Position).Magnitude)
            _762.Text = "HP: " .. _1331 .. "/" .. _1333 .. " | " .. _1337 .. " studs"
            wait(0.1)
            local _ = _731.Parent
            local _ = _727.Parent
            local _ = _727.Position
            local _ = _15.Character
            error("line 1: runtime error: internal 547: <25ms: infinitelooperror>\nstack traceback:\n\x09[C]: in function 'error'\n\x09internal 547: in ?\n\x09internal 598: in function '__index'\n\x09line 1: in ?\n\x09line 1: in ?")
        end
    end,
    Title = "Nametags",
    Desc = "Show player nametags with info",
})
_430:Section({
    Title = "Match ESPs",
})
genv.espTeamMates = true
genv.espEnemies = true
fenv.loadModule = function(_1348, _1348_2, _1348_3, _1348_4, _1348_5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/goose-birb/lua-buffoonery/master/" .. _1348))()
end
local _1355 = _430:Toggle({
    Callback = function(_1356, _1356_2, _1356_3, _1356_4, _1356_5, _1356_6)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/goose-birb/lua-buffoonery/master/mvsd/esp.lua"))()
    end,
    Title = "ESP Status (Only Works In a Match)",
    Desc = "Enable match-specific ESP",
})
_430:Toggle({
    Value = true,
    Callback = function(_1363, _1363_2, _1363_3)
        genv.espTeamMates = _1363
    end,
    Title = "Display Team",
    Desc = "Show teammates in ESP",
})
local _1365 = _430:Toggle({
    Value = true,
    Callback = function(_1366, _1366_2, _1366_3, _1366_4, _1366_5)
        genv.espEnemies = _1366
    end,
    Title = "Display Enemies",
    Desc = "Show enemies in ESP",
})
_430:Paragraph({
    Title = "ESP Info",
    Desc = "If any ESP don't work notify Flash Hub discord!",
})
_432:Section({
    Title = "WalkSpeed Configuration",
})
local _1372 = _432:Toggle({
    Callback = function(_1373, _1373_2)
        _5.Heartbeat:Connect(function(_1377, _1377_2)
            local _ = _15.Character
            _15.Character:FindFirstChild("HumanoidRootPart")
            local _1384 = _15.Character:FindFirstChildOfClass("Humanoid")
            _1384.WalkSpeed = 50
        end)
        local _ = _15.Character
        _15.Character:FindFirstChild("HumanoidRootPart")
        local _1391 = _15.Character:FindFirstChildOfClass("Humanoid")
        _1391.WalkSpeed = 50
    end,
    Title = "Enable Speed",
    Desc = "Enable custom walk speed",
})
_432:Slider({
    Value = {
        Min = 16,
        Default = 50,
        Max = 100,
    },
    Callback = function(_1394, _1394_2, _1394_3, _1394_4, _1394_5)
        local _ = _15.Character
        _15.Character:FindFirstChild("HumanoidRootPart")
        local _1401 = _15.Character:FindFirstChildOfClass("Humanoid")
        _1401.WalkSpeed = 16
    end,
    Title = "Walk Speed",
    Desc = "Custom walk speed value",
})
_432:Section({
    Title = "Jump Configuration",
})
_432:Toggle({
    Callback = function(_1406, _1406_2)
        game:GetService("UserInputService").JumpRequest:Connect(function(_1410, _1410_2, _1410_3)
            local _ = _15.Character
            _15.Character:FindFirstChild("HumanoidRootPart")
            _15.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end)
        local _ = _15.Character
        _15.Character:FindFirstChild("HumanoidRootPart")
        local _1428 = _15.Character:FindFirstChildOfClass("Humanoid")
        _1428.UseJumpPower = true
        _1428.JumpPower = 50
    end,
    Title = "Infinite Jump",
    Desc = "Enable infinite jumping",
})
local _1430 = _432:Slider({
    Value = {
        Min = 50,
        Default = 50,
        Max = 200,
    },
    Callback = function(_1431, _1431_2, _1431_3, _1431_4, _1431_5)
        local _ = _15.Character
        _15.Character:FindFirstChild("HumanoidRootPart")
        local _1438 = _15.Character:FindFirstChildOfClass("Humanoid")
        _1438.UseJumpPower = true
        _1438.JumpPower = 50
    end,
    Title = "Jump Power",
    Desc = "Custom jump power value",
})
_434:Section({
    Title = "MVSD Exploits",
})
_434:Toggle({
    Callback = function(_1443, _1443_2, _1443_3)
        _5.RenderStepped:Connect(function(_1447)
            for _1450, _1450_2 in pairs(_3:GetPlayers()) do
                local _ = _1450_2.Character
                _1450_2.Character:FindFirstChild("HumanoidRootPart")
                local _1455 = _1450_2.Character
                local _ = _1450_2 == _15
                local _1458 = _1455:FindFirstChild("HumanoidRootPart")
                _1458.Size = Vector3.new(8, 8, 8)
                _1458.Transparency = 0.6
                _1458.BrickColor = BrickColor.new("Really blue")
                _1458.Material = Enum.Material.ForceField
                _1458.CanCollide = false
            end
        end)
    end,
    Title = "Hitbox Expander",
    Desc = "Expand player hitboxes",
})
_434:Slider({
    Value = {
        Min = 2,
        Default = 8,
        Max = 20,
    },
    Callback = function(_1465, _1465_2, _1465_3, _1465_4, _1465_5, _1465_6)
    end,
    Title = "Hitbox Size",
    Desc = "Size of expanded hitboxes",
})
local _1467 = _434:Toggle({
    Callback = function(_1468, _1468_2)
        _5.Heartbeat:Connect(function(_1472, _1472_2)
            for _1476, _1476_2 in ipairs(_15.Backpack:GetChildren()) do
                _1476_2:IsA("Tool")
                _1476_2:GetAttribute("Cooldown")
                _1476_2:SetAttribute("Cooldown", 0)
            end
            local _ = _15.Character
            _15.Character:FindFirstChild("HumanoidRootPart")
            for _1490, _1490_2 in ipairs(_15.Character:GetChildren()) do
                _1490_2:IsA("Tool")
                _1490_2:GetAttribute("Cooldown")
                _1490_2:SetAttribute("Cooldown", 0)
            end
        end)
    end,
    Title = "Zero Cooldown",
    Desc = "Remove weapon cooldowns",
})
_434:Section({
    Title = "Controllers",
})
local _1500 = _434:Toggle({
    Value = true,
    Callback = function(_1501, _1501_2, _1501_3, _1501_4)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/goose-birb/lua-buffoonery/master/mvsd/controllers/init.lua"))()
    end,
    Title = "Delete Old Controllers",
    Desc = "Remove old controller scripts",
})
local _1507 = _434:Toggle({
    Value = true,
    Callback = function(_1508, _1508_2, _1508_3, _1508_4, _1508_5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/goose-birb/lua-buffoonery/master/mvsd/controllers/knife.lua"))()
    end,
    Title = "Custom Knife Controller",
    Desc = "Use custom knife controller",
})
local _1514 = _434:Toggle({
    Value = true,
    Callback = function(_1515, _1515_2, _1515_3, _1515_4)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/goose-birb/lua-buffoonery/master/mvsd/controllers/gun.lua"))()
    end,
    Title = "Custom Gun Controller",
    Desc = "Use custom gun controller",
})
_434:Section({
    Title = "Miscellaneous",
})
local _1524 = game:GetService("Players").LocalPlayer
local _1526 = game:GetService("ReplicatedStorage")
local _1528 = _434:Toggle({
    Value = true,
    Callback = function(_1529, _1529_2)
        local _ = _1524.Character
        _1524.CharacterAdded:Connect(function(_1534, _1534_2, _1534_3, _1534_4, _1534_5)
            local _1537 = _1526.Ability:WaitForChild("ShroudProjectileController", 5)
            local _1539 = Instance.new("ModuleScript")
            _1539.Name = "ShroudProjectileController"
            _1539.Parent = _1537.Parent
            _1537:Destroy()
        end)
    end,
    Title = "Anti Crash",
    Desc = "Prevent game crashes",
})
local _1544 = _434:Toggle({
    Callback = function(_1545, _1545_2, _1545_3)
        local _1548 = _1526.Settings:WaitForChild("UpdateSetting", 4)
        _1548:FireServer("LowGraphics", _1545)
        _1548:FireServer("KillEffectsDisabled", _1545)
        _1548:FireServer("LobbyMusicDisabled", _1545)
    end,
    Title = "Low Poly",
    Desc = "Enable low graphics mode",
})
_434:Toggle({
    Callback = function(_1557, _1557_2, _1557_3)
        genv.autoSpin = _1557
        spawn(function()
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            _1526.Dailies.Spin:InvokeServer()
            wait(0.1)
            local _ = genv.autoSpin
            _1524:GetAttribute("Match")
            local _ = _1526.Dailies.Spin.InvokeServer
            error("internal 547: <25ms: infinitelooperror>")
        end)
    end,
    Title = "Auto Spin",
    Desc = "Automatically spin modifier wheel",
})
_434:Paragraph({
    Title = "Feature Request",
    Desc = "What other exploits should we add?",
})
_438:Section({
    Title = "MVSD Utilities",
})
local _1684 = _438:Toggle({
    Callback = function(_1685, _1685_2, _1685_3, _1685_4, _1685_5)
        _3.LocalPlayer.Idled:Connect(function()
            _41.Button2Down(_41, Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            _41.Button2Up(_41, Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
        _19:Notify({
            Icon = "timer-off",
            Duration = 3,
            Title = "AntiAFk",
            Content = "Anti Afk Might Trigger Anticheat",
        })
    end,
    Title = "Anti AFK",
    Desc = "Prevent being kicked for AFK",
})
local _1706 = _438:Toggle({
    Callback = function(_1707, _1707_2, _1707_3, _1707_4, _1707_5, _1707_6)
        _5.Heartbeat:Connect(function(_1711)
            local _1713 = game:GetService("Players")
            local _ = _1713.LocalPlayer
            for _1717, _1717_2 in ipairs(_1713:GetPlayers()) do
                local _ = _1717_2.UserId
                local _ = _1717_2.UserId
                local _ = _1717_2.UserId
                local _ = _1717_2.UserId
                local _ = _1717_2.UserId
                local _ = _1717_2.UserId
                local _ = _1717_2.UserId
                local _ = _1717_2.UserId
                local _ = _1717_2.UserId
            end
            _1713.PlayerAdded:Connect(function(_1730, _1730_2, _1730_3, _1730_4)
                local _ = _1730.UserId
                local _ = _1730.UserId
                local _ = _1730.UserId
                local _ = _1730.UserId
                local _ = _1730.UserId
                local _ = _1730.UserId
                local _ = _1730.UserId
                local _ = _1730.UserId
                local _ = _1730.UserId
            end)
        end)
    end,
    Title = "Staff Detector",
    Desc = "Detect and warn about staff members",
})
_438:Toggle({
    Callback = function(_1742, _1742_2, _1742_3, _1742_4, _1742_5, _1742_6)
        _19:Notify({
            Icon = "shield-off",
            Duration = 5,
            Title = "Anti-Cheat Disabler",
            Content = "Disabling Anti-Cheat Measures...",
        })
    end,
    Title = "Anti-Cheat Disabler",
    Desc = "Attempt to disable anti-cheat measures",
})
local _1746 = _438:Button({
    Callback = function(_1747, _1747_2)
        game:GetService("TeleportService"):Teleport(game.PlaceId, _15)
    end,
    Title = "Rejoin Server",
    Desc = "Rejoin the current server",
})
_438:Section({
    Title = "Shaders",
})
local _1756 = _438:Button({
    Callback = function(_1757)
        local _1759 = game:GetService("Lighting")
        game:GetService("Lighting")
        _1759.Brightness = 2.5
        _1759.GlobalShadows = true
        _1759.ShadowSoftness = 0.5
        _1759.ExposureCompensation = 0.3
        _1759.Ambient = Color3.fromRGB(40, 40, 50)
        _1759.OutdoorAmbient = Color3.fromRGB(120, 120, 140)
        _1759.ColorShift_Top = Color3.fromRGB(255, 220, 180)
        _1759.ColorShift_Bottom = Color3.fromRGB(100, 150, 255)
        _1759.FogColor = Color3.fromRGB(140, 160, 255)
        _1759.FogStart = 100
        _1759.FogEnd = 500
        _1759.ClockTime = 14
        _1759.GeographicLatitude = 45
        for _1787, _1787_2 in pairs(workspace:GetDescendants()) do
            _1787_2:IsA("PointLight")
            _1787_2.Brightness = (_1787_2.Brightness * 1.5)
            _1787_2.Range = (_1787_2.Range * 1.2)
        end
        _1759:FindFirstChild("EnhancedSkybox")
        _1759:FindFirstChild("BloomEffect")
        _1759:FindFirstChild("ColorCorrection")
        _19:Notify({
            Icon = "monitor",
            Duration = 3,
            Title = "Shaders",
            Content = "Cool Shaders Enabled",
        })
    end,
    Title = "Enable Shaders",
    Desc = "Amazing shaders for MVSD",
})
local _1803 = _438:Button({
    Callback = function()
        local _1806 = game:GetService("Lighting")
        local _ = _1806.ClockTime
        _1806.ClockTime = _1761.ClockTime
        local _ = _1806.ColorShift_Bottom
        _1806.ColorShift_Bottom = _1761.ColorShift_Bottom
        local _ = _1806.FogColor
        _1806.FogColor = _1761.FogColor
        local _ = _1806.FogEnd
        _1806.FogEnd = _1761.FogEnd
        local _ = _1806.GlobalShadows
        _1806.GlobalShadows = _1761.GlobalShadows
        local _ = _1806.ShadowSoftness
        _1806.ShadowSoftness = _1761.ShadowSoftness
        local _ = _1806.FogStart
        _1806.FogStart = _1761.FogStart
        local _ = _1806.Ambient
        _1806.Ambient = _1761.Ambient
        local _ = _1806.OutdoorAmbient
        _1806.OutdoorAmbient = _1761.OutdoorAmbient
        local _ = _1806.GeographicLatitude
        _1806.GeographicLatitude = _1761.GeographicLatitude
        local _ = _1806.Brightness
        _1806.Brightness = _1761.Brightness
        local _ = _1806.ColorShift_Top
        _1806.ColorShift_Top = _1761.ColorShift_Top
        local _ = _1806.ExposureCompensation
        _1806.ExposureCompensation = _1761.ExposureCompensation
        _1806:FindFirstChild("EnhancedSkybox"):Destroy()
        _1806:FindFirstChild("BloomEffect"):Destroy()
        _1806:FindFirstChild("ColorCorrection"):Destroy()
        _1806:FindFirstChild("DepthOfField"):Destroy()
        for _1838, _1838_2 in pairs(workspace:GetDescendants()) do
            _1838_2:IsA("PointLight")
            _1838_2.Brightness = (_1838_2.Brightness / 1.5)
            _1838_2.Range = (_1838_2.Range / 1.2)
        end
        _19:Notify({
            Icon = "monitor",
            Duration = 2,
            Title = "Shaders Reset",
            Content = "Graphics reset to default",
        })
    end,
    Title = "Reset Shaders",
    Desc = "Reset graphics back to default",
})
_438:Paragraph({
    Title = "Status",
    Desc = "Utilities have been loaded!",
})
_34:Register(_105.Title, _105)
_34:Register(_520.Title, _520)
_34:Register(_485.Title, _485)
_34:Register(_89.Title, _89)
_34:Register(_101.Title, _101)
_34:Register(_1365.Title, _1365)
_34:Register(_113.Title, _113)
_34:Register(_212.Title, _212)
_34:Register(_56.Title, _56)
_34:Register(_1803.Title, _1803)
_34:Register(_61.Title, _61)
_34:Register(_1756.Title, _1756)
_34:Register(_1746.Title, _1746)
_34:Register(_1684.Title, _1684)
_34:Register(_97.Title, _97)
_34:Register(_1706.Title, _1706)
_34:Register(_1430.Title, _1430)
_34:Register(_93.Title, _93)
_34:Register(_335.Title, _335)
_34:Register(_405.Title, _405)
_34:Register(_1544.Title, _1544)
_34:Register(_189.Title, _189)
_34:Register(_153.Title, _153)
_34:Register(_192.Title, _192)
_34:Register(_85.Title, _85)
_34:Register(_315.Title, _315)
_34:Register(_1500.Title, _1500)
_34:Register(_81.Title, _81)
_34:Register(_109.Title, _109)
_34:Register(_1514.Title, _1514)
_34:Register(_1507.Title, _1507)
_34:Register(_1355.Title, _1355)
_34:Register(_1528.Title, _1528)
_34:Register(_312.Title, _312)
_34:Register(_1372.Title, _1372)
_34:Register(_1467.Title, _1467)
local _ = _34.Register
error("internal 547: <25ms: infinitelooperror>")