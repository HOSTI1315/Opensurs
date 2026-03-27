--[[This file was beautified by Light Community | https://discord.gg/RNzAwYMj2t]]
-- This file was deobfuscated with UnveilR 2.1.8 at discord.gg/threaded
select(1, ...)
local TweenService = game:GetService("TweenService")
game:GetService("RunService")
local TskRagdoll_UI = Instance.new("ScreenGui")
TskRagdoll_UI.Parent = game:GetService("CoreGui")
TskRagdoll_UI.Name = "TskRagdoll_UI"
TskRagdoll_UI.ResetOnSpawn = false
TskRagdoll_UI.DisplayOrder = 999
local Frame = Instance.new("Frame")
Frame.Parent = TskRagdoll_UI
local UDim2_New = UDim2.new
Frame.Size = UDim2_New(0, 160, 0, 60)
Frame.Position = UDim2_New(0.020000000000000018, 0, 0.30000000000000004, 0)
local Color3_FromRGB = Color3.fromRGB
Frame.BackgroundColor3 = Color3_FromRGB(15, 15, 25)
Frame.BackgroundTransparency = 0.10000000000000009
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame
local UDim_New = UDim.new
UICorner.CornerRadius = UDim_New(0, 10)
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = Frame
UIStroke.Color = Color3_FromRGB(120, 170, 255)
UIStroke.Transparency = 0.6000000000000001
UIStroke.Thickness = 1.5
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = Frame
TextLabel.Size = UDim2_New(1, -20, 0, 20)
TextLabel.Position = UDim2_New(0, 10, 0, 5)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Tsk Ragdoll"
local Enum_Font = Enum.Font
TextLabel.Font = Enum_Font.GothamBlack
TextLabel.TextSize = 14
TextLabel.TextColor3 = Color3_FromRGB(230, 230, 255)
local Enum_TextXAlignment = Enum.TextXAlignment
TextLabel.TextXAlignment = Enum_TextXAlignment.Left
local Frame_2 = Instance.new("Frame")
Frame_2.Parent = Frame
Frame_2.Size = UDim2_New(1, -20, 0, 24)
Frame_2.Position = UDim2_New(0, 10, 0, 30)
Frame_2.BackgroundTransparency = 1
local Frame_3 = Instance.new("Frame")
Frame_3.Parent = Frame_2
Frame_3.Size = UDim2_New(1, 0, 1, 0)
Frame_3.BackgroundColor3 = Color3_FromRGB(25, 30, 40)
Frame_3.BorderSizePixel = 0
local UICorner_2 = Instance.new("UICorner")
UICorner_2.Parent = Frame_3
UICorner_2.CornerRadius = UDim_New(1, 0)
local Frame_4 = Instance.new("Frame")
Frame_4.Parent = Frame_3
Frame_4.Size = UDim2_New(0, 20, 0, 20)
Frame_4.Position = UDim2_New(0, 2, 0.5, -10)
Frame_4.BackgroundColor3 = Color3_FromRGB(255, 70, 70)
Frame_4.BorderSizePixel = 0
local UICorner_3 = Instance.new("UICorner")
UICorner_3.Parent = Frame_4
UICorner_3.CornerRadius = UDim_New(1, 0)
local UIStroke_2 = Instance.new("UIStroke")
UIStroke_2.Parent = Frame_4
UIStroke_2.Color = Color3_FromRGB(255, 255, 255)
UIStroke_2.Transparency = 0.8500000000000001
UIStroke_2.Thickness = 1
local TextLabel_2 = Instance.new("TextLabel")
TextLabel_2.Parent = Frame_2
TextLabel_2.Size = UDim2_New(1, -30, 1, 0)
TextLabel_2.Position = UDim2_New(0, 30, 0, 0)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Text = "OFF"
TextLabel_2.Font = Enum_Font.GothamMedium
TextLabel_2.TextSize = 12
TextLabel_2.TextColor3 = Color3_FromRGB(255, 100, 100)
TextLabel_2.TextXAlignment = Enum_TextXAlignment.Left
local Connection
Connection = Frame_2.InputBegan:Connect(function(Input, p2_0, p3_0, p4_0, p5_0) 
    local Enum_UserInputType = Enum.UserInputType
end)
local Connection_2
Connection_2 = Frame_4.InputBegan:Connect(function(Input_3, p2_0, p3_0) 
end)
local TweenInfo = getfenv().TweenInfo
local Enum_EasingStyle = Enum.EasingStyle
local Enum_EasingDirection = Enum.EasingDirection
local _call9 = TweenInfo.new(0.25, Enum_EasingStyle.Quint, Enum_EasingDirection.Out)
local str = TweenService:Create(Frame_4, _call9, {
    BackgroundColor3 = Color3_FromRGB(255, 70, 70),
    Position = UDim2_New(0, 2, 0.5, -10),
})
str:Play()
local str_2 = TweenService:Create(Frame_3, _call9, {
    BackgroundColor3 = Color3_FromRGB(25, 30, 40),
})
str_2:Play()
TextLabel_2.Text = "OFF"
TextLabel_2.TextColor3 = Color3_FromRGB(255, 100, 100)
task.spawn(function(p1_0, p2_0, p3_0, p4_0, p5_0, p6_0, p7_0, p8_0)
end)
local TextButton = Instance.new("TextButton")
TextButton.Parent = Frame
TextButton.Size = UDim2_New(0, 16, 0, 16)
TextButton.Position = UDim2_New(1, -21, 0, 5)
TextButton.BackgroundTransparency = 1
TextButton.Text = "×"
TextButton.Font = Enum_Font.GothamBold
TextButton.TextSize = 16
TextButton.TextColor3 = Color3_FromRGB(255, 100, 100)
local Connection_3
Connection_3 = TextButton.MouseButton1Click:Connect(function(p1_0, p2_0, p3_0, p4_0, p5_0, p6_0)
    TskRagdoll_UI:Destroy()
end)
local Connection_4
Connection_4 = TextButton.MouseEnter:Connect(function(X, Y, p3_0, p4_0, p5_0) 
    local str_4 = TweenService:Create(TextButton, TweenInfo.new(0.19999999999999996), {
        TextColor3 = Color3_FromRGB(255, 50, 50),
    })
    str_4:Play()
end)
local Connection_5
Connection_5 = TextButton.MouseLeave:Connect(function(X_3, Y_3, p3_0, p4_0, p5_0, p6_0, p7_0, p8_0) 
    local str_5 = TweenService:Create(TextButton, TweenInfo.new(0.19999999999999996), {
        TextColor3 = Color3_FromRGB(255, 100, 100),
    })
    str_5:Play()
end)
local Connection_6
Connection_6 = TskRagdoll_UI.Destroying:Connect(function(p1_0, p2_0, p3_0, p4_0, p5_0, p6_0)
end)
Frame.Position = UDim2_New(-0.30000000000000004, 0, 0.30000000000000004, 0)
local str_3 = TweenService:Create(Frame, TweenInfo.new(0.5, Enum_EasingStyle.Back, Enum_EasingDirection.Out), {
    Position = UDim2_New(0.020000000000000018, 0, 0.30000000000000004, 0),
})
str_3:Play()