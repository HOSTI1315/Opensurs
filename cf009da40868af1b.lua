-- ts file was generated at discord.gg/25ms


local _ = require == require
local _call5 = Instance.new("ScreenGui")
local _call7 = Instance.new("Frame")
local _call9 = Instance.new("Frame")
local _call11 = Instance.new("TextLabel")
local _call13 = Instance.new("TextLabel")
local _call15 = Instance.new("TextBox")
local _call17 = Instance.new("Frame")
local _call19 = Instance.new("TextButton")
local _call21 = Instance.new("Frame")
local _call23 = Instance.new("TextButton")
local _call25 = Instance.new("Frame")
local _call27 = Instance.new("TextButton")
local _call29 = Instance.new("Frame")
local _call31 = Instance.new("TextButton")
local _call33 = Instance.new("Frame")
local _call35 = Instance.new("UICorner")
local _call37 = Instance.new("UICorner")
local _call39 = Instance.new("UICorner")
local _call41 = Instance.new("UICorner")
local _call43 = Instance.new("UICorner")
local _call45 = Instance.new("UICorner")
local _call47 = Instance.new("UICorner")
local _call49 = Instance.new("UICorner")
local _call51 = Instance.new("UICorner")
local _call53 = Instance.new("UICorner")
local _call55 = Instance.new("UICorner")
local _call57 = Instance.new("UICorner")
_call5.Name = "HubKeySystem"
_call5.Parent = game.CoreGui
_call5.ResetOnSpawn = false
_call9.Name = "MainFrameBorder"
_call9.Parent = _call5
_call9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_call9.BorderSizePixel = 0
_call9.Position = UDim2.new(0.5, - 202, 0.5, - 162)
_call9.Size = UDim2.new(0, 404, 0, 324)
_call9.Active = true
_call9.Draggable = true
_call35.CornerRadius = UDim.new(0, 15)
_call35.Parent = _call9
_call7.Name = "MainFrame"
_call7.Parent = _call9
_call7.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_call7.BorderSizePixel = 0
_call7.Position = UDim2.new(0, 2, 0, 2)
_call7.Size = UDim2.new(0, 400, 0, 320)
_call37.CornerRadius = UDim.new(0, 13)
_call37.Parent = _call7
_call11.Name = "Title"
_call11.Parent = _call7
_call11.BackgroundTransparency = 1
_call11.Position = UDim2.new(0, 0, 0, 20)
_call11.Size = UDim2.new(1, 0, 0, 40)
_call11.Font = Enum.Font.SourceSansBold
_call11.Text = "NSHUB"
_call11.TextColor3 = Color3.fromRGB(255, 255, 255)
_call11.TextSize = 32
_call11.TextStrokeTransparency = 0.8
_call13.Name = "Subtitle"
_call13.Parent = _call7
_call13.BackgroundTransparency = 1
_call13.Position = UDim2.new(0, 0, 0, 60)
_call13.Size = UDim2.new(1, 0, 0, 20)
_call13.Font = Enum.Font.SourceSans
_call13.Text = "KEY SYSTEM"
_call13.TextColor3 = Color3.fromRGB(255, 255, 255)
_call13.TextSize = 14
_call17.Name = "KeyInputBorder"
_call17.Parent = _call7
_call17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_call17.BorderSizePixel = 0
_call17.Position = UDim2.new(0, 30, 0, 110)
_call17.Size = UDim2.new(1, - 60, 0, 42)
_call39.CornerRadius = UDim.new(0, 8)
_call39.Parent = _call17
_call15.Name = "KeyInput"
_call15.Parent = _call17
_call15.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_call15.BorderSizePixel = 0
_call15.Position = UDim2.new(0, 1, 0, 1)
_call15.Size = UDim2.new(1, - 2, 1, - 2)
_call15.Font = Enum.Font.SourceSans
_call15.PlaceholderText = "Enter your key here..."
_call15.Text = ""
_call15.TextColor3 = Color3.fromRGB(255, 255, 255)
_call15.TextSize = 16
_call15.PlaceholderColor3 = Color3.fromRGB(170, 170, 170)
_call41.CornerRadius = UDim.new(0, 7)
_call41.Parent = _call15
_call21.Name = "CheckKeyBtnBorder"
_call21.Parent = _call7
_call21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_call21.BorderSizePixel = 0
_call21.Position = UDim2.new(0, 30, 0, 170)
_call21.Size = UDim2.new(0.5, - 47, 0, 42)
_call43.CornerRadius = UDim.new(0, 8)
_call43.Parent = _call21
_call19.Name = "CheckKeyBtn"
_call19.Parent = _call21
_call19.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_call19.BorderSizePixel = 0
_call19.Position = UDim2.new(0, 1, 0, 1)
_call19.Size = UDim2.new(1, - 2, 1, - 2)
_call19.Font = Enum.Font.SourceSansBold
_call19.Text = "CHECK KEY"
_call19.TextColor3 = Color3.fromRGB(255, 255, 255)
_call19.TextSize = 16
_call45.CornerRadius = UDim.new(0, 7)
_call45.Parent = _call19
_call25.Name = "GetKeyBtnBorder"
_call25.Parent = _call7
_call25.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_call25.BorderSizePixel = 0
_call25.Position = UDim2.new(0.5, 17, 0, 170)
_call25.Size = UDim2.new(0.5, - 47, 0, 42)
_call47.CornerRadius = UDim.new(0, 8)
_call47.Parent = _call25
_call23.Name = "GetKeyBtn"
_call23.Parent = _call25
_call23.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_call23.BorderSizePixel = 0
_call23.Position = UDim2.new(0, 1, 0, 1)
_call23.Size = UDim2.new(1, - 2, 1, - 2)
_call23.Font = Enum.Font.SourceSansBold
_call23.Text = "GET KEY"
_call23.TextColor3 = Color3.fromRGB(255, 255, 255)
_call23.TextSize = 16
_call49.CornerRadius = UDim.new(0, 7)
_call49.Parent = _call23
_call29.Name = "HowToGetKeyBtnBorder"
_call29.Parent = _call7
_call29.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_call29.BorderSizePixel = 0
_call29.Position = UDim2.new(0.5, - 150, 0, 220)
_call29.Size = UDim2.new(0, 300, 0, 40)
_call55.CornerRadius = UDim.new(0, 8)
_call55.Parent = _call29
_call27.Name = "HowToGetKeyBtn"
_call27.Parent = _call29
_call27.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_call27.BorderSizePixel = 0
_call27.Position = UDim2.new(0, 1, 0, 1)
_call27.Size = UDim2.new(1, - 2, 1, - 2)
_call27.Font = Enum.Font.SourceSansBold
_call27.Text = "HOW TO GET KEY?"
_call27.TextColor3 = Color3.fromRGB(255, 255, 255)
_call27.TextSize = 16
_call57.CornerRadius = UDim.new(0, 7)
_call57.Parent = _call27
_call33.Name = "DiscordBtnBorder"
_call33.Parent = _call7
_call33.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_call33.BorderSizePixel = 0
_call33.Position = UDim2.new(0.5, - 150, 0, 270)
_call33.Size = UDim2.new(0, 300, 0, 40)
_call51.CornerRadius = UDim.new(0, 8)
_call51.Parent = _call33
_call31.Name = "DiscordBtn"
_call31.Parent = _call33
_call31.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_call31.BorderSizePixel = 0
_call31.Position = UDim2.new(0, 1, 0, 1)
_call31.Size = UDim2.new(1, - 2, 1, - 2)
_call31.Font = Enum.Font.SourceSansBold
_call31.Text = "JOIN DISCORD"
_call31.TextColor3 = Color3.fromRGB(255, 255, 255)
_call31.TextSize = 16
_call53.CornerRadius = UDim.new(0, 7)
_call53.Parent = _call31
local _call194 = game:GetService("TweenService")
_call19.MouseEnter:Connect(function(...)
    local _call204 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _call208 = _call194:Create(_call19, _call204, {
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
    })
    _call208:Play()
    local _call212 = _call194:Create(_call21, _call204, {
        BackgroundTransparency = 0.96,
    })
    _call212:Play()
end)
_call19.MouseLeave:Connect(function(...)
    local _call224 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _call228 = _call194:Create(_call19, _call224, {
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
    })
    _call228:Play()
    local _call232 = _call194:Create(_call21, _call224, {
        BackgroundTransparency = 0,
    })
    _call232:Play()
end)
_call23.MouseEnter:Connect(function(...)
    local _call244 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _call248 = _call194:Create(_call23, _call244, {
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
    })
    _call248:Play()
    local _call252 = _call194:Create(_call25, _call244, {
        BackgroundTransparency = 0.96,
    })
    _call252:Play()
end)
_call23.MouseLeave:Connect(function(...)
    local _call264 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _call268 = _call194:Create(_call23, _call264, {
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
    })
    _call268:Play()
    local _call272 = _call194:Create(_call25, _call264, {
        BackgroundTransparency = 0,
    })
    _call272:Play()
end)
_call27.MouseEnter:Connect(function(...)
    local _call284 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _call288 = _call194:Create(_call27, _call284, {
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
    })
    _call288:Play()
    local _call292 = _call194:Create(_call29, _call284, {
        BackgroundTransparency = 0.96,
    })
    _call292:Play()
end)
_call27.MouseLeave:Connect(function(...)
    local _call304 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _call308 = _call194:Create(_call27, _call304, {
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
    })
    _call308:Play()
    local _call312 = _call194:Create(_call29, _call304, {
        BackgroundTransparency = 0,
    })
    _call312:Play()
end)
_call31.MouseEnter:Connect(function(...)
    local _call324 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _call328 = _call194:Create(_call31, _call324, {
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
    })
    _call328:Play()
    local _call332 = _call194:Create(_call33, _call324, {
        BackgroundTransparency = 0.96,
    })
    _call332:Play()
end)
_call31.MouseLeave:Connect(function(...)
    local _call344 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _call348 = _call194:Create(_call31, _call344, {
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
    })
    _call348:Play()
    local _call352 = _call194:Create(_call33, _call344, {
        BackgroundTransparency = 0,
    })
    _call352:Play()
end)
_call15.Focused:Connect(function(...)
    local _call364 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _call368 = _call194:Create(_call15, _call364, {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    })
    _call368:Play()
    local _call372 = _call194:Create(_call17, _call364, {
        BackgroundTransparency = 0.96,
    })
    _call372:Play()
end)
_call15.FocusLost:Connect(function(...)
    local _call384 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _call388 = _call194:Create(_call15, _call384, {
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
    })
    _call388:Play()
    local _call392 = _call194:Create(_call17, _call384, {
        BackgroundTransparency = 0,
    })
    _call392:Play()
end)
_call19.MouseButton1Click:Connect(function(...)
    local _call404 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local _Size405 = _call19.Size
    local _call410 = _call194:Create(_call19, _call404, {
        Size = (_Size405 - UDim2.new(0, 4, 0, 2)),
    })
    local _call412 = _call194:Create(_call19, _call404, {
        Size = _Size405,
    })
    _call410:Play()
    _call410.Completed:Connect(function(...)
        _call412:Play()
    end)
    local _ = _call15.Text
    _call5:Destroy()
    loadstring("script_key=" .. "\"" .. _call15.Text .. "\"" .. "; loadstring(game:HttpGet(\"https://api.luarmor.net/files/v3/loaders/064defa844d413e44319b04631c36357.lua\"))()")()
end)
_call23.MouseButton1Click:Connect(function(...)
    local _call440 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local _Size441 = _call23.Size
    local _call446 = _call194:Create(_call23, _call440, {
        Size = (_Size441 - UDim2.new(0, 4, 0, 2)),
    })
    local _call448 = _call194:Create(_call23, _call440, {
        Size = _Size441,
    })
    _call446:Play()
    _call446.Completed:Connect(function(...)
        _call448:Play()
    end)
    _call23.Text = "Link Copied!"
    setclipboard("https://ads.luarmor.net/get_key?for=NSHUB_KEY-ZHTUjvinbYyV")
    local _call459 = Instance.new("Frame")
    local _call461 = Instance.new("Frame")
    local _call463 = Instance.new("TextLabel")
    local _call465 = Instance.new("UICorner")
    local _call467 = Instance.new("UICorner")
    _call461.Name = "NotificationBorder"
    _call461.Parent = _call5
    _call461.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _call461.BorderSizePixel = 0
    _call461.Position = UDim2.new(0.5, - 200, 0, - 100)
    _call461.Size = UDim2.new(0, 400, 0, 60)
    _call461.ZIndex = 10
    _call465.CornerRadius = UDim.new(0, 10)
    _call465.Parent = _call461
    _call459.Name = "NotificationFrame"
    _call459.Parent = _call461
    _call459.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    _call459.BorderSizePixel = 0
    _call459.Position = UDim2.new(0, 2, 0, 2)
    _call459.Size = UDim2.new(0, 396, 0, 56)
    _call459.ZIndex = 10
    _call467.CornerRadius = UDim.new(0, 8)
    _call467.Parent = _call459
    _call463.Name = "NotificationText"
    _call463.Parent = _call459
    _call463.BackgroundTransparency = 1
    _call463.Size = UDim2.new(1, 0, 1, 0)
    _call463.Font = Enum.Font.SourceSansBold
    _call463.Text = "Link Copied! Paste it in your browser to get the key"
    _call463.TextColor3 = Color3.fromRGB(255, 255, 255)
    _call463.TextSize = 16
    _call463.TextWrapped = true
    _call463.ZIndex = 10
    local _call499 = _call194:Create(_call461, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, - 200, 0, 20),
    })
    _call499:Play()
    wait(3)
    local _call511 = _call194:Create(_call461, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, - 200, 0, - 100),
    })
    _call511:Play()
    _call511.Completed:Connect(function(...)
        _call461:Destroy()
    end)
    wait(1)
    _call23.Text = "GET KEY"
end)
_call27.MouseButton1Click:Connect(function(...)
    local _call529 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local _Size530 = _call27.Size
    local _call535 = _call194:Create(_call27, _call529, {
        Size = (_Size530 - UDim2.new(0, 4, 0, 2)),
    })
    local _call537 = _call194:Create(_call27, _call529, {
        Size = _Size530,
    })
    _call535:Play()
    _call535.Completed:Connect(function(...)
        _call537:Play()
    end)
    _call27.Text = "Link Copied Go To Your Browser and Watch It"
    setclipboard("https://www.youtube.com/watch?v=LUL9xJFyaBk")
    local _call548 = Instance.new("Frame")
    local _call550 = Instance.new("Frame")
    local _call552 = Instance.new("TextLabel")
    local _call554 = Instance.new("UICorner")
    local _call556 = Instance.new("UICorner")
    _call550.Name = "NotificationBorder"
    _call550.Parent = _call5
    _call550.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _call550.BorderSizePixel = 0
    _call550.Position = UDim2.new(0.5, - 200, 0, - 100)
    _call550.Size = UDim2.new(0, 400, 0, 60)
    _call550.ZIndex = 10
    _call554.CornerRadius = UDim.new(0, 10)
    _call554.Parent = _call550
    _call548.Name = "NotificationFrame"
    _call548.Parent = _call550
    _call548.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    _call548.BorderSizePixel = 0
    _call548.Position = UDim2.new(0, 2, 0, 2)
    _call548.Size = UDim2.new(0, 396, 0, 56)
    _call548.ZIndex = 10
    _call556.CornerRadius = UDim.new(0, 8)
    _call556.Parent = _call548
    _call552.Name = "NotificationText"
    _call552.Parent = _call548
    _call552.BackgroundTransparency = 1
    _call552.Size = UDim2.new(1, 0, 1, 0)
    _call552.Font = Enum.Font.SourceSansBold
    _call552.Text = "YouTube tutorial link copied! Go to your browser and watch it"
    _call552.TextColor3 = Color3.fromRGB(255, 255, 255)
    _call552.TextSize = 16
    _call552.TextWrapped = true
    _call552.ZIndex = 10
    local _call588 = _call194:Create(_call550, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, - 200, 0, 20),
    })
    _call588:Play()
    wait(3)
    local _call600 = _call194:Create(_call550, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, - 200, 0, - 100),
    })
    _call600:Play()
    _call600.Completed:Connect(function(...)
        _call550:Destroy()
    end)
    wait(1)
    _call27.Text = "HOW TO GET KEY?"
end)
_call31.MouseButton1Click:Connect(function(...)
    local _call618 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local _Size619 = _call31.Size
    local _call624 = _call194:Create(_call31, _call618, {
        Size = (_Size619 - UDim2.new(0, 4, 0, 2)),
    })
    local _call626 = _call194:Create(_call31, _call618, {
        Size = _Size619,
    })
    _call624:Play()
    _call624.Completed:Connect(function(...)
        _call626:Play()
    end)
    _call31.Text = "Copied!"
    setclipboard("https://discord.gg/ZkptAdmFDg")
    local _call637 = Instance.new("Frame")
    local _call639 = Instance.new("Frame")
    local _call641 = Instance.new("TextLabel")
    local _call643 = Instance.new("UICorner")
    local _call645 = Instance.new("UICorner")
    _call639.Name = "NotificationBorder"
    _call639.Parent = _call5
    _call639.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _call639.BorderSizePixel = 0
    _call639.Position = UDim2.new(0.5, - 200, 0, - 100)
    _call639.Size = UDim2.new(0, 400, 0, 60)
    _call639.ZIndex = 10
    _call643.CornerRadius = UDim.new(0, 10)
    _call643.Parent = _call639
    _call637.Name = "NotificationFrame"
    _call637.Parent = _call639
    _call637.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    _call637.BorderSizePixel = 0
    _call637.Position = UDim2.new(0, 2, 0, 2)
    _call637.Size = UDim2.new(0, 396, 0, 56)
    _call637.ZIndex = 10
    _call645.CornerRadius = UDim.new(0, 8)
    _call645.Parent = _call637
    _call641.Name = "NotificationText"
    _call641.Parent = _call637
    _call641.BackgroundTransparency = 1
    _call641.Size = UDim2.new(1, 0, 1, 0)
    _call641.Font = Enum.Font.SourceSansBold
    _call641.Text = "Discord link copied to clipboard!"
    _call641.TextColor3 = Color3.fromRGB(255, 255, 255)
    _call641.TextSize = 16
    _call641.TextWrapped = true
    _call641.ZIndex = 10
    local _call677 = _call194:Create(_call639, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, - 200, 0, 20),
    })
    _call677:Play()
    wait(3)
    local _call689 = _call194:Create(_call639, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, - 200, 0, - 100),
    })
    _call689:Play()
    _call689.Completed:Connect(function(...)
        _call639:Destroy()
    end)
    wait(1)
    _call31.Text = "JOIN DISCORD"
end)