local fenv = getfenv()
local larry3 = game:GetService("HttpService")
local larry6 = larry3:JSONEncode({
    hwid = get_hwid(),
})
local larry7 = request({
    Body = larry6,
    Url = "https://ver.lucasemanuelguimaraes20.workers.dev/",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json",
    },
})
local larry10 = larry3:JSONDecode(larry7.Body)
local _ = larry10.exists
local _ = larry10.nome
local _ = larry10.perm.Keyless
local _ = larry10.perm["10-30"]
local _ = larry10.perm["30+"]
setfpscap(500)
local larry23 = loadstring(game:HttpGet("https://raw.githubusercontent.com/LucasggkX/LKZ-Hub/refs/heads/main/Library.lua"))()
local larry29 = larry23:CreateWindow({
    SubTitle = "https://discord.gg/lkzhub",
    Title = "LKZ Hub",
    MinimizeKey = Enum.KeyCode.LeftControl,
    Theme = "Dark",
    Size = UDim2.fromOffset(500, 370),
})
larry29:CreateMinimizer({
    CornerRadius = UDim.new(0, 12),
    Image = "rbxassetid://88557808889639",
    Position = UDim2.fromOffset(20, 20),
    Size = UDim2.fromOffset(70, 70),
})
local larry39 = larry29:CreateTab({
    Title = "Farm",
    SaveManager = false,
})
local larry41 = larry29:CreateTab({
    Title = "Movement",
    SaveManager = true,
})
local larry43 = larry29:CreateTab({
    Title = "Steal",
    SaveManager = true,
})
local larry45 = larry29:CreateTab({
    Title = "ESP",
    SaveManager = true,
})
local larry47 = larry29:CreateTab({
    Title = "Misc",
    SaveManager = true,
})
local larry49 = larry29:CreateTab({
    Title = "Server",
    SaveManager = true,
})
local larry51 = larry29:CreateTab({
    Title = "Joiner",
    SaveManager = false,
})
local larry53 = larry29:CreateTab({
    Title = "KeyBinds",
    SaveManager = true,
})
local larry55 = larry29:CreateTab({
    Title = "Config",
    SaveManager = true,
})
Color3.fromRGB(0, 255, 0)
larry41:CreateSection("Speed, Jump & Ragdoll")
larry41:CreateToggle({
    Callback = function(larry62, _62_2, _62_3, _62_4)
    end,
    Default = false,
    Title = "Additional Speed",
    Description = "Set your speed to 28.5",
})
larry41:CreateToggle({
    Callback = function(larry65, _65_2)
    end,
    Default = false,
    Title = "Infinite Jump",
    Description = "Self-explanatory",
})
larry41:CreateToggle({
    Callback = function(larry68, _68_2, _68_3)
    end,
    Default = false,
    Title = "Anti Ragdoll",
    Description = "Prevents ragdoll effects and maintains control",
})
larry41:CreateSection("Fly")
local larry73 = game:GetService("Players").LocalPlayer
local larry74 = larry73.Character
larry73:WaitForChild("Backpack")
larry74:FindFirstChild("Flying Carpet")
larry74:FindFirstChild("Witch's Broom")
larry41:CreateToggle({
    Callback = function(larry83, _83_2, _83_3, _83_4, _83_5, _83_6)
    end,
    Default = false,
    Title = "Fly using: Flying Carpet",
    Description = "",
})
larry41:CreateSlider({
    Min = 50,
    Title = "Fly Speed",
    Max = 500,
    Default = 100,
    Callback = function(larry86, _86_2, _86_3, _86_4)
    end,
    Description = "Adjust the fly speed",
})
larry45:CreateSection("Player ESP")
larry45:CreateToggle({
    Callback = function(larry91, _91_2, _91_3, _91_4, _91_5)
    end,
    Default = false,
    Title = "ESP Players",
    Description = "Show ESP on all players",
})
larry45:CreateColorPicker({
    Callback = function(larry96, _96_2, _96_3, _96_4, _96_5)
    end,
    Title = "ESP Color",
    Default = Color3.fromRGB(0, 255, 0),
})
larry45:CreateSection("Base ESP")
larry45:CreateToggle({
    Callback = function(larry101, _101_2, _101_3, _101_4, _101_5, _101_6)
    end,
    Default = false,
    Title = "ESP Base",
    Description = "Show ESP on player bases",
})
larry45:CreateSection("Best Brainrot ESP")
larry45:CreateToggle({
    Callback = function(larry106, _106_2, _106_3, _106_4, _106_5, _106_6)
    end,
    Default = false,
    Title = "ESP Best Brainrot",
    Description = "Highlight the best stolen brainrot",
})
larry43:CreateSection("Helper")
larry43:CreateToggle({
    Callback = function(larry111, _111_2, _111_3, _111_4)
        local larry118 = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
        larry118.Name = "UpstairsToggleGUI"
        larry118.ResetOnSpawn = false
        local larry120 = Instance.new("Frame", larry118)
        larry120.Size = UDim2.new(0, 220, 0, 40)
        larry120.Position = UDim2.new(1, - 230, 0, 10)
        larry120.AnchorPoint = Vector2.new(0, 0)
        larry120.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
        larry120.BorderSizePixel = 0
        larry120.Active = true
        larry120.Draggable = true
        local larry130 = Instance.new("UICorner", larry120)
        larry130.CornerRadius = UDim.new(0, 20)
        local larry134 = Instance.new("UIStroke", larry120)
        larry134.Color = Color3.fromRGB(0, 255, 255)
        larry134.Thickness = 2
        local larry138 = Instance.new("TextLabel", larry120)
        larry138.Size = UDim2.new(0, 150, 1, 0)
        larry138.Position = UDim2.new(0, 10, 0, 0)
        larry138.BackgroundTransparency = 1
        larry138.Text = "Upstairs"
        larry138.TextColor3 = Color3.fromRGB(255, 255, 255)
        larry138.TextScaled = false
        larry138.TextSize = 16.5
        larry138.Font = Enum.Font.Gotham
        local larry148 = Instance.new("Frame", larry120)
        larry148.Size = UDim2.new(0, 50, 0, 25)
        larry148.Position = UDim2.new(1, - 60, 0.5, - 12)
        larry148.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
        larry148.BorderSizePixel = 0
        local larry156 = Instance.new("UICorner", larry148)
        larry156.CornerRadius = UDim.new(0, 12)
        local larry160 = Instance.new("Frame", larry148)
        larry160.Size = UDim2.new(0, 20, 0, 20)
        larry160.Position = UDim2.new(0, 2, 0.5, - 10)
        larry160.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
        larry160.BorderSizePixel = 0
        local larry168 = Instance.new("UICorner", larry160)
        larry168.CornerRadius = UDim.new(1, 0)
        local larry172 = Instance.new("TextButton", larry148)
        larry172.Size = UDim2.new(1, 0, 1, 0)
        larry172.Position = UDim2.new(0, 0, 0, 2)
        larry172.BackgroundTransparency = 1
        larry172.Text = ""
        larry172.AutoButtonColor = false
        larry172.MouseButton1Click:Connect(function(larry180)
            larry160:TweenPosition(UDim2.new(0.55, 0, 0.5, - 10), "Out", "Sine", 0.2, true)
            larry148.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
        end)
        task.spawn(function(larry189, _189_2)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            error("internal 542: <larry: infinitelooperror>")
        end)
    end,
    Default = false,
    Title = "Upstairs",
    Description = "The name is self-explanatory! Have high skin",
})
larry43:CreateToggle({
    Callback = function(larry192, _192_2)
        local larry199 = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
        larry199.Name = "FloatToggleGUI"
        larry199.ResetOnSpawn = false
        local larry201 = Instance.new("Frame", larry199)
        larry201.Size = UDim2.new(0, 220, 0, 40)
        larry201.Position = UDim2.new(1, - 230, 0, 65)
        larry201.AnchorPoint = Vector2.new(0, 0)
        larry201.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
        larry201.BorderSizePixel = 0
        larry201.Active = true
        larry201.Draggable = true
        local larry211 = Instance.new("UICorner", larry201)
        larry211.CornerRadius = UDim.new(0, 20)
        local larry215 = Instance.new("UIStroke", larry201)
        larry215.Color = Color3.fromRGB(0, 255, 255)
        larry215.Thickness = 2
        local larry219 = Instance.new("TextLabel", larry201)
        larry219.Size = UDim2.new(0, 150, 1, 0)
        larry219.Position = UDim2.new(0, 10, 0, 0)
        larry219.BackgroundTransparency = 1
        larry219.Text = "Float"
        larry219.TextColor3 = Color3.fromRGB(255, 255, 255)
        larry219.TextScaled = false
        larry219.TextSize = 16.5
        larry219.Font = Enum.Font.Gotham
        local larry229 = Instance.new("Frame", larry201)
        larry229.Size = UDim2.new(0, 50, 0, 25)
        larry229.Position = UDim2.new(1, - 60, 0.5, - 12)
        larry229.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
        larry229.BorderSizePixel = 0
        local larry237 = Instance.new("UICorner", larry229)
        larry237.CornerRadius = UDim.new(0, 12)
        local larry241 = Instance.new("Frame", larry229)
        larry241.Size = UDim2.new(0, 20, 0, 20)
        larry241.Position = UDim2.new(0, 2, 0.5, - 10)
        larry241.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
        larry241.BorderSizePixel = 0
        local larry249 = Instance.new("UICorner", larry241)
        larry249.CornerRadius = UDim.new(1, 0)
        local larry253 = Instance.new("TextButton", larry229)
        larry253.Size = UDim2.new(1, 0, 1, 0)
        larry253.Position = UDim2.new(0, 0, 0, 2)
        larry253.BackgroundTransparency = 1
        larry253.Text = ""
        larry253.AutoButtonColor = false
        larry253.MouseButton1Click:Connect(function(larry261, _261_2, _261_3, _261_4, _261_5)
            larry241:TweenPosition(UDim2.new(0.55, 0, 0.5, - 10), "Out", "Sine", 0.2, true)
            larry229.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
        end)
        task.spawn(function(larry270, _270_2)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            task.wait(0.1)
            error("internal 542: <larry: infinitelooperror>")
        end)
    end,
    Default = false,
    Title = "Float",
    Description = "Float according to the direction of your camera",
})
larry43:CreateToggle({
    Callback = function(larry273, _273_2, _273_3, _273_4, _273_5, _273_6)
        local larry276 = game:GetService("Players").LocalPlayer
        game:GetService("RunService")
        larry276.Character:WaitForChild("HumanoidRootPart")
        larry276.CharacterAdded:Connect(function(larry285, _285_2)
            larry285:WaitForChild("HumanoidRootPart")
        end)
        local larry291 = Instance.new("ScreenGui", larry276:WaitForChild("PlayerGui"))
        larry291.Name = "AutoDeliveryToggleGUI"
        larry291.ResetOnSpawn = false
        local larry293 = Instance.new("Frame", larry291)
        larry293.Size = UDim2.new(0, 220, 0, 40)
        larry293.Position = UDim2.new(1, - 230, 0, 120)
        larry293.AnchorPoint = Vector2.new(0, 0)
        larry293.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
        larry293.BorderSizePixel = 0
        larry293.Active = true
        larry293.Draggable = true
        local larry303 = Instance.new("UICorner", larry293)
        larry303.CornerRadius = UDim.new(0, 20)
        local larry307 = Instance.new("UIStroke", larry293)
        larry307.Color = Color3.fromRGB(0, 255, 255)
        larry307.Thickness = 2
        local larry311 = Instance.new("TextLabel", larry293)
        larry311.Size = UDim2.new(0, 150, 1, 0)
        larry311.Position = UDim2.new(0, 10, 0, 0)
        larry311.BackgroundTransparency = 1
        larry311.Text = "Fly To Base"
        larry311.TextColor3 = Color3.fromRGB(255, 255, 255)
        larry311.TextScaled = false
        larry311.TextSize = 16.5
        larry311.Font = Enum.Font.Gotham
        local larry321 = Instance.new("Frame", larry293)
        larry321.Size = UDim2.new(0, 50, 0, 25)
        larry321.Position = UDim2.new(1, - 60, 0.5, - 12)
        larry321.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
        larry321.BorderSizePixel = 0
        local larry329 = Instance.new("UICorner", larry321)
        larry329.CornerRadius = UDim.new(0, 12)
        local larry333 = Instance.new("Frame", larry321)
        larry333.Size = UDim2.new(0, 20, 0, 20)
        larry333.Position = UDim2.new(0, 2, 0.5, - 10)
        larry333.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
        larry333.BorderSizePixel = 0
        local larry341 = Instance.new("UICorner", larry333)
        larry341.CornerRadius = UDim.new(1, 0)
        local larry345 = Instance.new("TextButton", larry321)
        larry345.Size = UDim2.new(1, 0, 1, 0)
        larry345.Position = UDim2.new(0, 0, 0, 2)
        larry345.BackgroundTransparency = 1
        larry345.Text = ""
        larry345.AutoButtonColor = false
        larry345.MouseButton1Click:Connect(function(larry353)
            local larry356 = larry276.Character:FindFirstChild("HumanoidRootPart")
            local larry358 = larry356:FindFirstChild("DeliveryTween_Attachment")
            local larry360 = larry356:FindFirstChild("DeliveryLinearVelocity")
            larry360.VectorVelocity = Vector3.new(0, 0, 0)
            larry360:Destroy()
            larry358:Destroy()
            larry333:TweenPosition(UDim2.new(0, 2, 0.5, - 10), "Out", "Sine", 0.2, true)
            larry321.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
            local larry375 = larry276.Character:FindFirstChild("HumanoidRootPart")
            local larry377 = larry375:FindFirstChild("DeliveryTween_Attachment")
            local larry379 = larry375:FindFirstChild("DeliveryLinearVelocity")
            larry379.VectorVelocity = Vector3.new(0, 0, 0)
            larry379:Destroy()
            larry377:Destroy()
        end)
    end,
    Default = false,
    Title = "Fly To Base",
    Description = "Automatically fly to your base",
})
larry43:CreateToggle({
    Callback = function(larry388, _388_2, _388_3, _388_4)
    end,
    Default = false,
    Title = "Kick After Stealing",
    Description = "Automatically kicks you after stealing",
})
larry43:CreateButton({
    Callback = function()
        setfflag("GameNetPVHeaderRotationalVelocityZeroCutoffExponent", "-5000")
        setfflag("LargeReplicatorWrite5", "true")
        setfflag("LargeReplicatorEnabled9", "true")
        setfflag("AngularVelociryLimit", "360")
        setfflag("TimestepArbiterVelocityCriteriaThresholdTwoDt", "2147483646")
        setfflag("S2PhysicsSenderRate", "15000")
        setfflag("DisableDPIScale", "true")
        setfflag("MaxDataPacketPerSend", "2147483647")
        setfflag("ServerMaxBandwith", "52")
        setfflag("PhysicsSenderMaxBandwidthBps", "20000")
        setfflag("MaxTimestepMultiplierBuoyancy", "2147483647")
        setfflag("SimOwnedNOUCountThresholdMillionth", "2147483647")
        setfflag("MaxMissedWorldStepsRemembered", "-2147483648")
        setfflag("CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth", "1")
        setfflag("StreamJobNOUVolumeLengthCap", "2147483647")
        setfflag("DebugSendDistInSteps", "-2147483648")
        setfflag("MaxTimestepMultiplierAcceleration", "2147483647")
        setfflag("LargeReplicatorRead5", "true")
        setfflag("SimExplicitlyCappedTimestepMultiplier", "2147483646")
        setfflag("GameNetDontSendRedundantNumTimes", "1")
        setfflag("CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent", "1")
        setfflag("CheckPVCachedRotVelThresholdPercent", "10")
        setfflag("LargeReplicatorSerializeRead3", "true")
        setfflag("ReplicationFocusNouExtentsSizeCutoffForPauseStuds", "2147483647")
        setfflag("NextGenReplicatorEnabledWrite4", "true")
        setfflag("CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth", "1")
        setfflag("GameNetDontSendRedundantDeltaPositionMillionth", "1")
        setfflag("InterpolationFrameVelocityThresholdMillionth", "5")
        setfflag("StreamJobNOUVolumeCap", "2147483647")
        setfflag("InterpolationFrameRotVelocityThresholdMillionth", "5")
        setfflag("WorldStepMax", "30")
        setfflag("TimestepArbiterHumanoidLinearVelThreshold", "1")
        setfflag("InterpolationFramePositionThresholdMillionth", "5")
        setfflag("TimestepArbiterHumanoidTurningVelThreshold", "1")
        setfflag("MaxTimestepMultiplierContstraint", "2147483647")
        setfflag("GameNetPVHeaderLinearVelocityZeroCutoffExponent", "-5000")
        setfflag("CheckPVCachedVelThresholdPercent", "10")
        setfflag("TimestepArbiterOmegaThou", "1073741823")
        setfflag("MaxAcceptableUpdateDelay", "1")
        setfflag("LargeReplicatorSerializeWrite4", "true")
        local larry434 = game:GetService("Players").LocalPlayer
        local _ = fenv.gethidden
        local larry436 = larry434.Character
        larry436:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        larry436:ClearAllChildren()
        local larry446 = Instance.new("Model")
        larry446.Parent = workspace
        larry434.Character = larry446
        task.wait()
        larry434.Character = larry436
        larry446:Destroy()
        error("line 1: attempt to index nil with 'SetTitle'")
    end,
    Title = "Desync V2",
    Description = "By activating this Desync, it will ALWAYS be active",
})
larry47:CreateSection("Visual Functions")
larry47:CreateToggle({
    Callback = function(larry453, _453_2, _453_3, _453_4, _453_5, _453_6)
    end,
    Default = false,
    Title = "X-Ray",
    Description = "Toggle transparency on base parts",
})
larry47:CreateToggle({
    Callback = function(larry456, _456_2, _456_3, _456_4, _456_5, _456_6)
    end,
    Default = false,
    Title = "Rainbow Base",
    Description = "Makes your base rainbow colored",
})
larry47:CreateSection("Utilities")
local larry461 = game:GetService("Players").LocalPlayer
local larry462 = larry461.Character
larry461:WaitForChild("Backpack")
larry462:FindFirstChild("Flying Carpet")
larry47:CreateButton({
    Callback = function()
        local _ = tick() - 0
        error("line 1: attempt to compare table < number")
    end,
    Title = "TP TO BEST",
    Description = "Ready to use",
})
larry47:CreateToggle({
    Callback = function(larry474)
    end,
    Default = false,
    Title = "Auto Laser Cape",
    Description = "Automatically targets and fires laser cape at nearby players",
})
larry47:CreateSlider({
    Min = 20,
    Title = "Laser Cape Range",
    Default = 50,
    Max = 80,
    Description = "Set the detection range for auto laser cape",
    Callback = function(larry477, _477_2, _477_3, _477_4, _477_5)
    end,
    Rounding = 1,
})
larry47:CreateToggle({
    Callback = function(larry480, _480_2, _480_3, _480_4, _480_5, _480_6)
    end,
    Default = false,
    Title = "Auto Paintball",
    Description = "Automatically targets and fires Paintball (Good for robberies, as it works with Brainrot in hand, slowing and blinding the enemy, and also inflicting ragdoll effect.)",
})
larry47:CreateToggle({
    Callback = function(larry483, _483_2)
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Obama9282921781/Rjdhdidjdj/refs/heads/main/Protected_4809522785054226.lua.txt"))()
            local larry493 = game:GetService("Players").LocalPlayer
            local larry496 = larry493.PlayerGui:FindFirstChild("AjjanGui")
            larry496.Name = "LKZ-HUB"
            larry493.PlayerGui.ChildAdded:Connect(function(larry501, _501_2, _501_3, _501_4, _501_5)
                local _ = larry501.Name
                local _ = larry501.Name
            end)
            local larry507 = larry493.PlayerGui:FindFirstChild("LKZ-HUB").Frame
            local larry508 = larry507.UICorner
            larry508.CornerRadius = UDim.new(0, 5)
            larry507.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            for larry515, _515_2 in ipairs(larry507:GetChildren()) do
                _515_2:IsA("TextButton")
                _515_2.Font = Enum.Font.GothamBold
                _515_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end
            larry507.ChildAdded:Connect(function(larry525, _525_2, _525_3, _525_4, _525_5, _525_6)
                larry525:IsA("TextButton")
                larry525.Font = Enum.Font.GothamBold
                larry525.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end)
            larry493.PlayerGui:FindFirstChild("AjjanNotification"):Destroy()
        end)
    end,
    Default = false,
    Title = "Control Panel",
    Description = "Advanced player control interface",
})
larry47:CreateToggle({
    Callback = function(larry539, _539_2, _539_3, _539_4)
    end,
    Default = false,
    Title = "Auto Destroy Sentry",
    Description = "Automatically destroys enemy sentries",
})
larry47:CreateToggle({
    Callback = function(larry542, _542_2, _542_3, _542_4, _542_5, _542_6)
    end,
    Default = false,
    Title = "Kill Player",
    Description = "Player killing interface",
})
larry47:CreateToggle({
    Callback = function(larry545, _545_2, _545_3, _545_4, _545_5)
        local larry548 = game.Players.LocalPlayer.Character
        larry548:FindFirstChild("Humanoid")
        local larry552 = Instance.new("Animation")
        larry552.AnimationId = "rbxassetid://127212897044971"
        local larry556 = larry548.Humanoid.Animator:LoadAnimation(larry552)
        larry556.Priority = Enum.AnimationPriority.Action
        larry556:Play(0)
        local _ = larry556.TimePosition
        error("line 1: attempt to compare table < number")
    end,
    Default = false,
    Title = "Semi Invisible",
    Description = "",
})
larry39:CreateSection("Auto Collect")
larry39:CreateToggle({
    Callback = function(larry566, _566_2, _566_3, _566_4, _566_5)
    end,
    Default = false,
    Title = "Auto Collect",
    Description = "Automatically collect coins from your base",
})
larry39:CreateSlider({
    Min = 5,
    Title = "Delay Auto Collect",
    Default = 30,
    Max = 100,
    Description = "Delay between collections in seconds",
    Callback = function(larry569)
    end,
    Rounding = 1,
})
larry39:CreateSection("Auto Buy")
larry39:CreateToggle({
    Callback = function(larry574, _574_2)
    end,
    Default = false,
    Title = "Auto Buy",
    Description = "Automatically buy pets",
})
larry39:CreateDropdown({
    Title = "Minimum Value for Auto Purchase",
    Values = {
        [1] = "1K/s",
        [2] = "10K/s",
        [3] = "100K/s",
        [4] = "300K/s",
        [5] = "1M/s",
        [6] = "10M/s",
        [7] = "50M/s",
    },
    Default = "1K/s",
    Multi = false,
    Callback = function(larry577, _577_2, _577_3, _577_4)
    end,
    Description = "Select minimum earning value",
})
local larry579 = larry49:CreateInput({
    Placeholder = "Enter JobId",
    Title = "Server JobId",
    Default = "",
    Numeric = false,
    Finished = true,
    Callback = function(larry580, _580_2, _580_3)
        local larry582 = game:GetService("TeleportService")
        larry582:TeleportToPlaceInstance(game.PlaceId, larry580, game:GetService("Players").LocalPlayer)
        larry23:Notify({
            Duration = 3,
            Title = "Teleporting",
            Content = "Teleporting to server: " .. larry580,
        })
    end,
    Description = "Enter the JobId to teleport",
})
larry49:CreateButton({
    Title = "Clear Input",
    Callback = function(larry594, _594_2, _594_3)
        larry579:SetValue("")
    end,
})
larry49:CreateToggle({
    Callback = function(larry599, _599_2, _599_3, _599_4, _599_5, _599_6)
        local larry601 = game:GetService("Lighting")
        local _ = larry601.Ambient
        local _ = larry601.OutdoorAmbient
        local _ = larry601.Brightness
        local _ = larry601.GlobalShadows
        local _ = larry601.FogEnd
        local _ = larry601.ClockTime
        local _ = larry601.ColorShift_Bottom
        local _ = larry601.ColorShift_Top
        local _ = larry601.EnvironmentDiffuseScale
        local _ = larry601.EnvironmentSpecularScale
        local _ = larry601.ShadowSoftness
        larry601.Ambient = Color3.fromRGB(100, 100, 100)
        larry601.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
        larry601.Brightness = 1
        larry601.GlobalShadows = false
        larry601.FogEnd = 1000000
        larry601.ClockTime = 12
        larry601.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        larry601.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        larry601.EnvironmentDiffuseScale = 0
        larry601.EnvironmentSpecularScale = 0
        larry601.ShadowSoftness = 0
        for larry623, _623_2 in ipairs(larry601:GetChildren()) do
            _623_2:IsA("PostEffect")
            local _ = _623_2.Enabled
            _623_2.Enabled = false
        end
        for larry629, _629_2 in ipairs(workspace:GetDescendants()) do
            _629_2:IsA("ParticleEmitter")
            local _ = _629_2.Enabled
            _629_2.Enabled = false
        end
        local larry634 = workspace:FindFirstChildOfClass("Terrain")
        local _ = larry634.WaterTransparency
        local _ = larry634.WaterReflectance
        local _ = larry634.WaterWaveSize
        local _ = larry634.WaterWaveSpeed
        local _ = larry634.Decoration
        larry634.WaterTransparency = 1
        larry634.WaterReflectance = 0
        larry634.WaterWaveSize = 0
        larry634.WaterWaveSpeed = 0
        larry634.Decoration = false
        local _ = fenv.settings
        error("line 1: attempt to call a nil value")
    end,
    Default = false,
    Title = "Low Graphics",
    Description = "Reduces graphics quality significantly to improve performance",
})
larry55:CreateButton({
    Callback = function(larry643, _643_2, _643_3, _643_4, _643_5)
        larry29:ClearSave()
    end,
    Title = "Clear Config File",
    Description = "Clear all saved settings",
})
larry55:CreateDropdown({
    Title = "Theme",
    Values = larry23.Themes,
    Default = "Dark",
    Multi = false,
    Callback = function(larry649)
        larry29:SetTheme(larry649)
    end,
    Description = "Change UI theme",
})
larry51:CreateDropdown({
    Title = "Joiner Range",
    Values = {
        [1] = "10M - 30M",
        [2] = "30M - 100B",
    },
    Default = "10M - 30M",
    Multi = false,
    Callback = function(larry654, _654_2, _654_3, _654_4, _654_5, _654_6)
    end,
    Description = "Select the value range",
})
larry51:CreateToggle({
    Callback = function(larry657, _657_2, _657_3)
    end,
    Default = false,
    Title = "Active Joiner",
    Description = "Enable/Disable the joiner system",
})
larry51:CreateToggle({
    Callback = function(larry660, _660_2, _660_3, _660_4, _660_5, _660_6)
    end,
    Default = false,
    Title = "Auto Execute",
    Description = "Automatically execute after joining server",
})
larry53:CreateSection("Movement")
larry53:CreateKeyBind({
    Title = "Additional Speed",
})
larry53:CreateKeyBind({
    Title = "Infinite Jump",
})
larry53:CreateKeyBind({
    Title = "Anti Ragdoll",
})
larry53:CreateKeyBind({
    Title = "Fly using: Flying Carpet",
})
larry53:CreateSection("ESP")
larry53:CreateKeyBind({
    Title = "ESP Players",
})
larry53:CreateKeyBind({
    Title = "ESP Base",
})
larry53:CreateKeyBind({
    Title = "ESP Best Brainrot",
})
larry53:CreateSection("Steal")
larry53:CreateKeyBind({
    Title = "Upstairs",
})
larry53:CreateKeyBind({
    Title = "Float",
})
larry53:CreateKeyBind({
    Title = "Fly To Base",
})
larry53:CreateKeyBind({
    Title = "Kick After Stealing",
})
larry53:CreateKeyBind({
    Title = "Desync V2",
})
larry53:CreateSection("Misc")
larry53:CreateKeyBind({
    Title = "X-Ray",
})
larry53:CreateKeyBind({
    Title = "Rainbow Base",
})
local larry699 = game:GetService("Players").LocalPlayer
local larry700 = larry699.Character
larry699:WaitForChild("Backpack")
larry700:FindFirstChild("Flying Carpet")
larry53:CreateKeyBind({
    Title = "TP TO BEST",
})
larry53:CreateKeyBind({
    Title = "Control Panel",
})
larry53:CreateKeyBind({
    Title = "Auto Laser Cape",
})
larry53:CreateKeyBind({
    Title = "Auto Paintball",
})
larry53:CreateKeyBind({
    Title = "Auto Destroy Sentry",
})
larry53:CreateKeyBind({
    Title = "Kill Player",
})
larry53:CreateKeyBind({
    Title = "Semi Invisible",
})
larry53:CreateSection("Farm")
larry53:CreateKeyBind({
    Title = "Auto Collect",
})
larry53:CreateKeyBind({
    Title = "Auto Buy",
})
larry53:CreateSection("Server")
larry53:CreateKeyBind({
    Title = "Low Graphics",
})
local larry731 = game:GetService("Players").LocalPlayer
larry731.CharacterAdded:Connect(function(larry735, _735_2, _735_3)

end)
fenv.GotoBest = function(larry736)
    game:GetService("ReplicatedStorage")
    local larry741 = game:GetService("Players").LocalPlayer
    local larry744 = game:GetService("Players").LocalPlayer
    local larry745 = larry744.Character
    larry744:WaitForChild("Backpack")
    larry745:FindFirstChild("Flying Carpet")
    local larry750 = larry741.Character
    larry750:WaitForChild("Humanoid")
    larry750:WaitForChild("HumanoidRootPart")
    larry741:WaitForChild("Backpack")
    for larry761, _761_2 in ipairs(workspace:FindFirstChild("Plots"):GetChildren()) do
        for larry764, _764_2 in ipairs(_761_2:GetDescendants()) do
            _764_2:IsA("TextLabel")
            local _ = _764_2.Text
        end
        for larry772, _772_2 in ipairs(_761_2:FindFirstChild("AnimalPodiums"):GetChildren()) do
            _772_2:FindFirstChild("Base")
            _772_2.Base:FindFirstChild("Spawn")
            _772_2.Base.Spawn:FindFirstChild("Attachment")
            for larry789, _789_2 in ipairs(_772_2.Base.Spawn.Attachment:FindFirstChild("AnimalOverhead"):GetDescendants()) do
                _789_2:IsA("TextLabel")
                local _ = _789_2.Name
                local _ = _789_2.Name
            end
        end
        for larry796, _796_2 in ipairs(_761_2:GetChildren()) do
            _796_2:IsA("Model")
            for larry801, _801_2 in ipairs(_796_2:GetDescendants()) do
                local _ = _801_2.Name
            end
        end
    end
    return false
end
task.spawn(function(larry805, _805_2)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry818 = larry731.CharacterAdded:Wait()
        larry818:WaitForChild("Humanoid")
        larry818:WaitForChild("HumanoidRootPart")
        local larry829 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry829:Disable()
        for larry836, _836_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry839, _839_2 in ipairs(_836_2:GetDescendants()) do
                _839_2:IsA("TextLabel")
                local _ = _839_2.Text
            end
        end
        larry829:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry857 = larry731.CharacterAdded:Wait()
        larry857:WaitForChild("Humanoid")
        larry857:WaitForChild("HumanoidRootPart")
        local larry868 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry868:Disable()
        for larry875, _875_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry878, _878_2 in ipairs(_875_2:GetDescendants()) do
                _878_2:IsA("TextLabel")
                local _ = _878_2.Text
            end
        end
        larry868:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry896 = larry731.CharacterAdded:Wait()
        larry896:WaitForChild("Humanoid")
        larry896:WaitForChild("HumanoidRootPart")
        local larry907 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry907:Disable()
        for larry914, _914_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry917, _917_2 in ipairs(_914_2:GetDescendants()) do
                _917_2:IsA("TextLabel")
                local _ = _917_2.Text
            end
        end
        larry907:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry935 = larry731.CharacterAdded:Wait()
        larry935:WaitForChild("Humanoid")
        larry935:WaitForChild("HumanoidRootPart")
        local larry946 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry946:Disable()
        for larry953, _953_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry956, _956_2 in ipairs(_953_2:GetDescendants()) do
                _956_2:IsA("TextLabel")
                local _ = _956_2.Text
            end
        end
        larry946:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry974 = larry731.CharacterAdded:Wait()
        larry974:WaitForChild("Humanoid")
        larry974:WaitForChild("HumanoidRootPart")
        local larry985 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry985:Disable()
        for larry992, _992_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry995, _995_2 in ipairs(_992_2:GetDescendants()) do
                _995_2:IsA("TextLabel")
                local _ = _995_2.Text
            end
        end
        larry985:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry1013 = larry731.CharacterAdded:Wait()
        larry1013:WaitForChild("Humanoid")
        larry1013:WaitForChild("HumanoidRootPart")
        local larry1024 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry1024:Disable()
        for larry1031, _1031_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry1034, _1034_2 in ipairs(_1031_2:GetDescendants()) do
                _1034_2:IsA("TextLabel")
                local _ = _1034_2.Text
            end
        end
        larry1024:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry1052 = larry731.CharacterAdded:Wait()
        larry1052:WaitForChild("Humanoid")
        larry1052:WaitForChild("HumanoidRootPart")
        local larry1063 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry1063:Disable()
        for larry1070, _1070_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry1073, _1073_2 in ipairs(_1070_2:GetDescendants()) do
                _1073_2:IsA("TextLabel")
                local _ = _1073_2.Text
            end
        end
        larry1063:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry1091 = larry731.CharacterAdded:Wait()
        larry1091:WaitForChild("Humanoid")
        larry1091:WaitForChild("HumanoidRootPart")
        local larry1102 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry1102:Disable()
        for larry1109, _1109_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry1112, _1112_2 in ipairs(_1109_2:GetDescendants()) do
                _1112_2:IsA("TextLabel")
                local _ = _1112_2.Text
            end
        end
        larry1102:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry1130 = larry731.CharacterAdded:Wait()
        larry1130:WaitForChild("Humanoid")
        larry1130:WaitForChild("HumanoidRootPart")
        local larry1141 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry1141:Disable()
        for larry1148, _1148_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry1151, _1151_2 in ipairs(_1148_2:GetDescendants()) do
                _1151_2:IsA("TextLabel")
                local _ = _1151_2.Text
            end
        end
        larry1141:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry1169 = larry731.CharacterAdded:Wait()
        larry1169:WaitForChild("Humanoid")
        larry1169:WaitForChild("HumanoidRootPart")
        local larry1180 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry1180:Disable()
        for larry1187, _1187_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry1190, _1190_2 in ipairs(_1187_2:GetDescendants()) do
                _1190_2:IsA("TextLabel")
                local _ = _1190_2.Text
            end
        end
        larry1180:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry1208 = larry731.CharacterAdded:Wait()
        larry1208:WaitForChild("Humanoid")
        larry1208:WaitForChild("HumanoidRootPart")
        local larry1219 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry1219:Disable()
        for larry1226, _1226_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry1229, _1229_2 in ipairs(_1226_2:GetDescendants()) do
                _1229_2:IsA("TextLabel")
                local _ = _1229_2.Text
            end
        end
        larry1219:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry1247 = larry731.CharacterAdded:Wait()
        larry1247:WaitForChild("Humanoid")
        larry1247:WaitForChild("HumanoidRootPart")
        local larry1258 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry1258:Disable()
        for larry1265, _1265_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry1268, _1268_2 in ipairs(_1265_2:GetDescendants()) do
                _1268_2:IsA("TextLabel")
                local _ = _1268_2.Text
            end
        end
        larry1258:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry1286 = larry731.CharacterAdded:Wait()
        larry1286:WaitForChild("Humanoid")
        larry1286:WaitForChild("HumanoidRootPart")
        local larry1297 = require(larry731:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        larry1297:Disable()
        for larry1304, _1304_2 in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
            for larry1307, _1307_2 in ipairs(_1304_2:GetDescendants()) do
                _1307_2:IsA("TextLabel")
                local _ = _1307_2.Text
            end
        end
        larry1297:Enable()
    end)
    task.wait(0.05)
    task.spawn(function()
        larry731.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        local larry1325 = larry731.CharacterAdded:Wait()
        larry1325:WaitForChild("Humanoid")
        larry1325:WaitForChild("HumanoidRootPart")
        local _ = larry731.WaitForChild
        error("internal 542: <larry: infinitelooperror>")
    end)
    task.wait(0.05)
    task.wait(0.05)
    task.wait(0.05)
    error("internal 542: <larry: infinitelooperror>")
end)
error("internal 542: <larry: infinitelooperror>")