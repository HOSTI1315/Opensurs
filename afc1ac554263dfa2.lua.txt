-- ts file was generated at discord.gg/25ms


local _3 = game:GetService("Players")
local _4 = _3.LocalPlayer
local _5 = workspace.CurrentCamera
game:GetService("HttpService")
local _17 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Yomkav2/Sugar-UI/refs/heads/main/Source"))()
local _19 = _17.Notification()
_19.new({
    Icon = "check",
    Duration = 5,
    Title = "THX FOR USING YOXI HUB",
    Description = "Telegram: @YomkaMadeIt",
})
_19.new({
    Icon = "link",
    Duration = 5,
    Title = "JOIN DISCORD SERVER",
    Description = "https://discord.gg/PKdh229jqg",
})
local _27 = _17.new({
    Title = "YOXI HUB | [FPS] FLICK",
    Keybind = Enum.KeyCode.B,
    Description = "Made by: Yomka & Xira | Telegram - @YomkaMadeIt | https://discord.gg/PKdh229jqg",
    Logo = "http://www.roblox.com/asset/?id=82898985676372",
    ConfigFolder = "YoxiHubFLICKCfg",
})
local _29 = _27:NewTab({
    Icon = "info",
    Title = "Info",
    Description = "Information",
})
local _31 = _27:NewTab({
    Icon = "house",
    Title = "Main",
    Description = "Main Features",
})
local _33 = _27:NewTab({
    Icon = "user",
    Title = "Player",
    Description = "Player Settings",
})
local _35 = _27:NewTab({
    Icon = "eye",
    Title = "Esp",
    Description = "ESP Features",
})
local _37 = _27:NewTab({
    Icon = "save",
    Title = "Configs",
    Description = "Config Management",
})
local _39 = _29:NewSection({
    Icon = "info",
    Title = "Information",
    Position = "Left",
})
_39:NewTitle("UI TOGGLE KEY - B")
_39:NewTitle("Made by: Yomka & Xira")
_39:NewTitle("Telegram: @YomkaMadeIt")
_39:NewTitle("Discord: https://discord.gg/PKdh229jqg")
_39:NewButton({
    Title = "Join Telegram",
    Callback = function()
        setclipboard("https://t.me/YomkaMadeIt")
        _19.new({
            Icon = "check",
            Duration = 5,
            Title = "Link Copied",
            Description = "Telegram channel link copied to clipboard!",
        })
    end,
})
_39:NewButton({
    Title = "Discord Server",
    Callback = function()
        setclipboard("https://discord.gg/PKdh229jqg")
        _19.new({
            Icon = "check",
            Duration = 5,
            Title = "Link Copied",
            Description = "Discord server link copied to clipboard!",
        })
    end,
})
local _61 = _31:NewSection({
    Icon = "target",
    Title = "Aimbot Settings",
    Position = "Left",
})
_61:NewToggle({
    Callback = function(_64)
        print("Aimbot:", _64)
    end,
    Title = "Aimbot Enabled",
    Default = false,
})
_61:NewToggle({
    Callback = function(_68)
        print("WallCheck:", _68)
    end,
    Title = "Wall Check",
    Default = false,
})
_61:NewDropdown({
    Callback = function(_72)
        print("Target Part set to:", _72)
    end,
    Default = "Head",
    Title = "Target Part",
    Data = {
        [1] = "Head",
        [2] = "HumanoidRootPart",
    },
})
_61:NewSlider({
    Min = 1,
    Title = "Aim Strength (1-100)",
    Def = 100,
    Max = 100,
    Callback = function(_76)
        print("AimStrength set to:", (_76 / 100))
    end,
})
_61:NewToggle({
    Callback = function(_81)
        print("FOV Visible:", _81)
    end,
    Title = "FOV Visible",
    Default = true,
})
_61:NewToggle({
    Callback = function(_85)
        print("RGB Effects:", _85)
    end,
    Title = "RGB Effects",
    Default = true,
})
_61:NewSlider({
    Min = 10,
    Title = "FOV Size",
    Def = 300,
    Max = 1000,
    Callback = function(_89)
        print("FOV set to:", _89)
    end,
})
local _ = Enum.KeyCode.C
_61:NewKeybind({
    Callback = function(_97)
        print("Aimbot toggle key set to:", _97)
    end,
    Title = "Toggle Aimbot Bind (C)",
    Default = Enum.KeyCode.C,
})
game:GetService("UserInputService").InputBegan:Connect(function(_102, _102_2)

end)
local _104 = _35:NewSection({
    Icon = "eye",
    Title = "ESP Settings",
    Position = "Left",
})
_104:NewToggle({
    Callback = function(_107)
        print("ESP:", _107)
    end,
    Title = "ESP Enabled",
    Default = false,
})
local _110 = _33:NewSection({
    Icon = "user",
    Title = "Player Modifications",
    Position = "Left",
})
_110:NewSlider({
    Min = 0,
    Title = "FOV (0-120)",
    Def = 120,
    Max = 120,
    Callback = function(_113)
        print("PlayerFOV set to:", _113)
    end,
})
for _117, _117_2 in pairs(_3:GetPlayers()) do
    local _ = _117_2 == _4
    local _ = _117_2.Character
    local _ = _117_2 == _4
    local _121 = _117_2.Character
    local _123 = Instance.new("Highlight")
    _123.Name = _117_2.Name .. "_Highlight"
    _123.Adornee = _121
    _123.Parent = _121
    _123.FillColor = Color3.fromRGB(0, 255, 0)
    _123.OutlineColor = Color3.fromRGB(255, 255, 255)
    _123.FillTransparency = 1
    _123.OutlineTransparency = 0
    _123.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    _117_2.CharacterAdded:Connect(function(_135)
        wait(1)
        local _ = _117_2 == _4
        local _137 = _117_2.Character
        _123:Destroy()
        local _141 = Instance.new("Highlight")
        _141.Name = _117_2.Name .. "_Highlight"
        _141.Adornee = _137
        _141.Parent = _137
        _141.FillColor = Color3.fromRGB(0, 255, 0)
        _141.OutlineColor = Color3.fromRGB(255, 255, 255)
        _141.FillTransparency = 1
        _141.OutlineTransparency = 0
        _141.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end)
    _117_2.CharacterRemoving:Connect(function(_153)
        _141:Destroy()
    end)
end
_3.PlayerAdded:Connect(function(_159)
    local _ = _159 == _4
    local _ = _159.Character
    local _ = _159 == _4
    local _163 = _159.Character
    local _165 = Instance.new("Highlight")
    _165.Name = _159.Name .. "_Highlight"
    _165.Adornee = _163
    _165.Parent = _163
    _165.FillColor = Color3.fromRGB(0, 255, 0)
    _165.OutlineColor = Color3.fromRGB(255, 255, 255)
    _165.FillTransparency = 1
    _165.OutlineTransparency = 0
    _165.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    _159.CharacterAdded:Connect(function(_177)
        wait(1)
        local _ = _159 == _4
        local _179 = _159.Character
        _165:Destroy()
        local _183 = Instance.new("Highlight")
        _183.Name = _159.Name .. "_Highlight"
        _183.Adornee = _179
        _183.Parent = _179
        _183.FillColor = Color3.fromRGB(0, 255, 0)
        _183.OutlineColor = Color3.fromRGB(255, 255, 255)
        _183.FillTransparency = 1
        _183.OutlineTransparency = 0
        _183.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end)
    _159.CharacterRemoving:Connect(function(_195)
        _183:Destroy()
    end)
end)
_3.PlayerRemoving:Connect(function(_201)

end)
local _203 = Instance.new("ScreenGui")
_203.Name = "Yoxi_FOV_UI"
_203.Parent = game:GetService("CoreGui")
_203.ResetOnSpawn = false
_203.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local _207 = Drawing.new("Circle")
_207.Thickness = 2
_207.NumSides = 100
_207.Filled = false
_207.Visible = _81
local _208 = _4.Character
_208:FindFirstChildOfClass("Humanoid")
_208:FindFirstChild("HumanoidRootPart")
_4.CharacterAdded:Connect(function(_216)
    _216:WaitForChild("Humanoid")
    _216:WaitForChild("HumanoidRootPart")
end)
game:GetService("RunService").RenderStepped:Connect(function(_224)
    _207.Visible = _81
    _207.Radius = _89
    _207.Position = Vector2.new((_5.ViewportSize.X / 2), (_5.ViewportSize.Y / 2))
    _207.Color = Color3.fromHSV((((0 + (_224 * 90)) % 360) / 360), 1, 1)
    for _241, _241_2 in pairs(_3:GetPlayers()) do
        local _ = _241_2 == _4
        local _ = _241_2.Character
        local _ = _241_2.Character:FindFirstChild("Humanoid").Health
        error("line 393: attempt to compare number < table")
    end
end)
_3.PlayerRemoving:Connect(function(_251)
    local _ = _251 == _4
end)
local _254 = _37:NewSection({
    Icon = "save",
    Title = "Configs",
    Position = "Left",
})
local _256 = _27.ListConfigs()
local _259 = _254:NewDropdown({
    Callback = function(_260)
        print("Selected config: " .. _260)
    end,
    Default = _256[1],
    Title = "Configs",
    Data = _256,
})
local _264 = _254:NewTextbox({
    Callback = function(_265)
        print("Entered name: " .. _265)
    end,
    FileType = "",
    Title = "Config Name",
    Default = "",
})
_254:NewButton({
    Title = "Create Config",
    Callback = function()
        local _272 = _264.Get()
        _27.SaveConfig(_272)
        _259.Refresh(_27.ListConfigs())
        print("Created config: " .. _272)
    end,
})
_254:NewButton({
    Title = "Load Config",
    Callback = function()
        local _285 = _259.Get()
        _27.LoadConfig(_285)
        local _ = _27.ConfigFolder .. "/" .. _285 .. ".json"
        warn("Failed to read config file:", "readfile failed")
        print("Loaded config: " .. _285)
    end,
})
_254:NewButton({
    Title = "Delete Config",
    Callback = function()
        local _300 = _259.Get()
        delfile(_27.ConfigFolder .. "/" .. _300 .. ".json")
        _259.Refresh(_27.ListConfigs())
        print("Deleted config: " .. _300)
    end,
})
_254:NewButton({
    Title = "Refresh Configs",
    Callback = function()
        _259.Refresh(_27.ListConfigs())
        print("Configs refreshed")
    end,
})