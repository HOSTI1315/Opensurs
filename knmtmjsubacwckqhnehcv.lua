--[[This file was beautified by Light Community | https://discord.gg/RNzAwYMj2t]]
local _ = ((table and 11957670)
local TweenService = game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local DesyncMenu = Instance.new("ScreenGui")
DesyncMenu.Name = "DesyncMenu"
DesyncMenu.ResetOnSpawn = false
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
local UDim2_New = UDim2.new
MainFrame.Size = UDim2_New(0, 180, 0, 60)
MainFrame.Position = UDim2_New(0.5, -90, 0.1, 0)
local Color3_FromRGB = Color3.fromRGB
MainFrame.BackgroundColor3 = Color3_FromRGB(40, 40, 45)
MainFrame.BorderSizePixel = 0
local UICorner = Instance.new("UICorner")
local UDim_New = UDim.new
UICorner.CornerRadius = UDim_New(0, 10)
UICorner.Parent = MainFrame
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3_FromRGB(20, 20, 25)
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame
local DragFrame = Instance.new("Frame")
DragFrame.Name = "DragFrame"
DragFrame.Size = UDim2_New(1, 0, 1, 0)
DragFrame.BackgroundTransparency = 1
DragFrame.Parent = MainFrame
local DesyncButton = Instance.new("TextButton")
DesyncButton.Name = "DesyncButton"
DesyncButton.Size = UDim2_New(0.9, 0, 0.7, 0)
DesyncButton.Position = UDim2_New(0.05, 0, 0.15, 0)
DesyncButton.BackgroundColor3 = Color3_FromRGB(200, 50, 50)
DesyncButton.Text = "Kerlev desync"
DesyncButton.TextColor3 = Color3_FromRGB(255, 255, 255)
DesyncButton.TextSize = 12
DesyncButton.Font = Enum.Font.GothamBold
DesyncButton.AutoButtonColor = false
local UICorner_2 = Instance.new("UICorner")
UICorner_2.CornerRadius = UDim_New(0, 6)
UICorner_2.Parent = DesyncButton
local UIStroke_2 = Instance.new("UIStroke")
UIStroke_2.Color = Color3_FromRGB(150, 30, 30)
UIStroke_2.Thickness = 1
UIStroke_2.Parent = DesyncButton
TextButton.Parent = MainFrame
Frame.Parent = DesyncMenu
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
local Connection
Connection = DragFrame.InputBegan:Connect(function(Input, p2_0, p3_0, p4_0) 
    local Enum_UserInputType = Enum.UserInputType
    local _ = (Input.UserInputType == Enum_UserInputType.MouseButton1)
    local _ = ((Input.UserInputType == Enum_UserInputType.Touch) and 16352738)
end)
local Connection_2
Connection_2 = DragFrame.InputChanged:Connect(function(Input_3, p2_0) 
    local _ = ((Input_3.UserInputType == Enum_UserInputType.MouseMovement) and 13279587)
    local _ = (Input_3.UserInputType == Enum_UserInputType.Touch)
end)
local Connection_3
Connection_3 = game:GetService("UserInputService").InputChanged:Connect(function(Input_5, GameProcessedEvent, p3_0, p4_0, p5_0) 
    local _ = ((Input_5 == nil) and 14228812)
end)
local Connection_4
Connection_4 = DesyncButton.MouseEnter:Connect(function() 
    local TweenInfo = Env.TweenInfo
    local str = TweenService:Create(DesyncButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3_FromRGB(220, 60, 60),
    })
    str:Play()
end)
local Connection_5
Connection_5 = DesyncButton.MouseLeave:Connect(function(X_2, Y_2, p3_0) 
    local str_2 = TweenService:Create(DesyncButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3_FromRGB(200, 50, 50),
    })
    str_2:Play()
end)
local Connection_6
Connection_6 = DesyncButton.MouseButton1Click:Connect(function(p1_0, p2_0, p3_0, p4_0, p5_0)
    local str_3 = TweenService:Create(DesyncButton, TweenInfo.new(0.1), {
        BackgroundColor3 = Color3_FromRGB(180, 40, 40),
    })
    str_3:Play()
    task.wait(0.1)
    local str_4 = TweenService:Create(DesyncButton, TweenInfo.new(0.1), {
        BackgroundColor3 = Color3_FromRGB(200, 50, 50),
    })
    str_4:Play()
    local _ = (not LocalPlayer.Character and 15920110)
    local HumanoidRootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    task.spawn(function()
        local setfflag = Env.setfflag
        setfflag("WorldStepsOffsetAdjustRate", "-1")
        task.wait(0.01257)
        setfflag("WorldStepsOffsetAdjustRate", "60")
        local CFrame = HumanoidRootPart.CFrame
        local CFrame_New = CFrame.new
        HumanoidRootPart.CFrame = CFrame * CFrame_New(7, 0, -3)
        task.wait(0.05214)
        setfflag("WorldStepsOffsetAdjustRate", "-9999999999")
        task.wait(0.06615)
        setfflag("WorldStepsOffsetAdjustRate", "-9999999999")
        HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame_New(19, 0, -3)
        task.wait(1.44719)
        setfflag("WorldStepsOffsetAdjustRate", "-1")
end)
    DesyncButton.Text = "ACTIVATED"
    task.wait(0.1)
    DesyncButton.Text = "Kerlev desync"
    task.wait(0.1)
    DesyncButton.Text = "ACTIVATED"
    task.wait(0.1)
    DesyncButton.Text = "Kerlev desync"
    task.wait(0.1)
    DesyncButton.Text = "ACTIVATED"
    task.wait(0.1)
    DesyncButton.Text = "Kerlev desync"
    task.wait(0.1)
end)