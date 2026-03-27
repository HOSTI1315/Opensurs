--[[This file was beautified by Light Community | https://discord.gg/RNzAwYMj2t]]
local CryHubJumpscare = Instance.new("ScreenGui")
CryHubJumpscare.Name = "CryHubJumpscare"
CryHubJumpscare.Parent = game.CoreGui
CryHubJumpscare.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CryHubJumpscare.ResetOnSpawn = false
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = CryHubJumpscare
local Color3_FromRGB = Color3.fromRGB
MainFrame.BackgroundColor3 = Color3_FromRGB(22, 33, 62)
MainFrame.BorderSizePixel = 0
local UDim2_New = UDim2.new
MainFrame.Position = UDim2_New(0.5, -125, 0.5, -100)
MainFrame.Size = UDim2_New(0, 250, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true
local UICorner = Instance.new("UICorner")
local UDim_New = UDim.new
UICorner.CornerRadius = UDim_New(0, 12)
UICorner.Parent = MainFrame
local UIGradient = Instance.new("UIGradient")
local ColorSequence_New = ColorSequence.new
local ColorSequenceKeypoint_New = ColorSequenceKeypoint.new
UIGradient.Color = ColorSequence_New({
    ColorSequenceKeypoint_New(0, Color3_FromRGB(22, 33, 62)),
    ColorSequenceKeypoint_New(0.5, Color3_FromRGB(15, 22, 38)),
    ColorSequenceKeypoint_New(1, Color3_FromRGB(26, 26, 46)),
})
UIGradient.Rotation = 135
UIGradient.Parent = MainFrame
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3_FromRGB(30, 58, 95)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2_New(1, 0, 0, 30)
local UICorner_2 = Instance.new("UICorner")
UICorner_2.CornerRadius = UDim_New(0, 12)
UICorner_2.Parent = TitleBar
local UIGradient_2 = Instance.new("UIGradient")
UIGradient_2.Color = ColorSequence_New({
    ColorSequenceKeypoint_New(0, Color3_FromRGB(30, 58, 95)),
    ColorSequenceKeypoint_New(1, Color3_FromRGB(13, 27, 42)),
})
UIGradient_2.Rotation = 135
UIGradient_2.Parent = TitleBar
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2_New(0, 15, 0, 0)
TitleLabel.Size = UDim2_New(0.8, 0, 1, 0)
local Enum_Font = Enum.Font
TitleLabel.Font = Enum_Font.GothamBold
TitleLabel.Text = "CryHub Lagger"
TitleLabel.TextColor3 = Color3_FromRGB(255, 255, 255)
TitleLabel.TextSize = 14
local Enum_TextXAlignment = Enum.TextXAlignment
TitleLabel.TextXAlignment = Enum_TextXAlignment.Left
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3_FromRGB(255, 68, 68)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2_New(1, -28, 0.5, -6)
CloseButton.Size = UDim2_New(0, 12, 0, 12)
CloseButton.Text = ""
CloseButton.AutoButtonColor = false
local UICorner_3 = Instance.new("UICorner")
UICorner_3.CornerRadius = UDim_New(1, 0)
UICorner_3.Parent = CloseButton
local UIGradient_3 = Instance.new("UIGradient")
UIGradient_3.Color = ColorSequence_New({
    ColorSequenceKeypoint_New(0, Color3_FromRGB(255, 68, 68)),
    ColorSequenceKeypoint_New(1, Color3_FromRGB(204, 0, 0)),
})
UIGradient_3.Rotation = 135
UIGradient_3.Parent = CloseButton
local DiscordLabel = Instance.new("TextLabel")
DiscordLabel.Name = "DiscordLabel"
DiscordLabel.Parent = MainFrame
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Position = UDim2_New(1, -130, 1, -22)
DiscordLabel.Size = UDim2_New(0, 120, 0, 18)
DiscordLabel.Font = Enum_Font.GothamBold
DiscordLabel.Text = "discord.gg/hf3g3KqVk7"
DiscordLabel.TextColor3 = Color3_FromRGB(114, 137, 218)
DiscordLabel.TextSize = 10
DiscordLabel.TextXAlignment = Enum_TextXAlignment.Right
local ServerLabel = Instance.new("TextLabel")
ServerLabel.Name = "ServerLabel"
ServerLabel.Parent = MainFrame
ServerLabel.BackgroundTransparency = 1
ServerLabel.Position = UDim2_New(0, 10, 1, -22)
ServerLabel.Size = UDim2_New(0, 100, 0, 18)
ServerLabel.Font = Enum_Font.Gotham
ServerLabel.Text = "Discord: cryxn."
ServerLabel.TextColor3 = Color3_FromRGB(180, 180, 180)
ServerLabel.TextSize = 9
ServerLabel.TextXAlignment = Enum_TextXAlignment.Left
local MessageLabel = Instance.new("TextLabel")
MessageLabel.Name = "MessageLabel"
MessageLabel.Parent = MainFrame
MessageLabel.BackgroundTransparency = 1
MessageLabel.Position = UDim2_New(0, 10, 0, 40)
MessageLabel.Size = UDim2_New(1, -20, 1, -70)
MessageLabel.Font = Enum_Font.GothamBold
MessageLabel.Text = "there wont be a
free version
again :D"
MessageLabel.TextColor3 = Color3_FromRGB(255, 68, 68)
MessageLabel.TextSize = 20
MessageLabel.TextWrapped = true
MessageLabel.TextXAlignment = Enum_TextXAlignment.Center
MessageLabel.TextYAlignment = Enum.TextYAlignment.Center
local JumpscareSound = Instance.new("Sound")
JumpscareSound.Name = "JumpscareSound"
JumpscareSound.Parent = game:GetService("SoundService")
JumpscareSound.SoundId = "rbxassetid://5567523008"
JumpscareSound.Volume = 1
JumpscareSound.Looped = false
task.wait(0.5)
JumpscareSound:Play()
local Color3_Value_15 = Color3_FromRGB(255, 68, 68)
local Color3_Value_16 = Color3_FromRGB(255, 255, 255)
local Color3_Value_17 = Color3_FromRGB(255, 0, 0)
task.spawn(function(p1_0, p2_0, p3_0)
    MessageLabel.TextColor3 = Color3_Value_15
    task.wait(0.1)
    MessageLabel.TextColor3 = Color3_Value_16
    task.wait(0.1)
    MessageLabel.TextColor3 = Color3_Value_16
    task.wait(0.1)
    MessageLabel.TextColor3 = Color3_Value_16
    task.wait(0.1)
    MessageLabel.TextColor3 = Color3_Value_15
    task.wait(0.1)
    MessageLabel.TextColor3 = Color3_Value_17
    MessageLabel.TextColor3 = Color3_Value_16
    MessageLabel.TextColor3 = Color3_Value_16
    MessageLabel.TextColor3 = Color3_Value_17
    MessageLabel.TextColor3 = Color3_Value_15
    MessageLabel.TextColor3 = Color3_FromRGB(255, 68, 68)
end)
task.spawn(function(p1_0)
    MainFrame.Position = UDim2_New(0.5, -124, 0.5, -100)
    task.wait(0.05)
    MainFrame.Position = UDim2_New(0.5, -122, 0.5, -103)
    task.wait(0.05)
    MainFrame.Position = UDim2_New(0.5, -123, 0.5, -101)
    task.wait(0.05)
    MainFrame.Position = UDim2_New(0.5, -121, 0.5, -99)
    task.wait(0.05)
    MainFrame.Position = UDim2_New(0.5, -120, 0.5, -103)
    task.wait(0.05)
    MainFrame.Position = UDim2_New(0.5, -121, 0.5, -99)
    MainFrame.Position = UDim2_New(0.5, -121, 0.5, -98)
    MainFrame.Position = UDim2_New(0.5, -127, 0.5, -95)
    MainFrame.Position = UDim2_New(0.5, -129, 0.5, -102)
    MainFrame.Position = UDim2_New(0.5, -124, 0.5, -102)
    MainFrame.Position = UDim2_New(0.5, -120, 0.5, -101)
    MainFrame.Position = UDim2_New(0.5, -123, 0.5, -101)
    MainFrame.Position = UDim2_New(0.5, -128, 0.5, -101)
    MainFrame.Position = UDim2_New(0.5, -121, 0.5, -95)
    MainFrame.Position = UDim2_New(0.5, -130, 0.5, -96)
    MainFrame.Position = UDim2_New(0.5, -125, 0.5, -105)
    MainFrame.Position = UDim2_New(0.5, -121, 0.5, -103)
    MainFrame.Position = UDim2_New(0.5, -127, 0.5, -100)
    MainFrame.Position = UDim2_New(0.5, -123, 0.5, -95)
    MainFrame.Position = UDim2_New(0.5, -124, 0.5, -99)
    MainFrame.Position = MainFrame.Position
end)
local Connection
Connection = CloseButton.MouseButton1Click:Connect(function(p1_0, p2_0, p3_0, p4_0, p5_0)
    CloseButton:TweenSize(UDim2_New(0, 10, 0, 10), "Out", "Quad", 0.1, true, function(p1_0, p2_0, p3_0, p4_0, p5_0)
        CloseButton:TweenSize(UDim2_New(0, 12, 0, 12), "Out", "Quad", 0.1, true)
end)
    local _ = (JumpscareSound and 13984867)
    JumpscareSound:Stop()
    JumpscareSound:Destroy()
    wait(0.2)
    MainFrame:TweenSize(UDim2_New(0, 0, 0, 0), "Out", "Quad", 0.3, true)
    wait(0.3)
    CryHubJumpscare:Destroy()
end)
local Connection_2
Connection_2 = CloseButton.MouseEnter:Connect(function(X, Y, p3_0, p4_0) 
    CloseButton:TweenSize(UDim2_New(0, 14, 0, 14), "Out", "Quad", 0.2, true)
end)
local Connection_3
Connection_3 = CloseButton.MouseLeave:Connect(function(X_3) 
    CloseButton:TweenSize(UDim2_New(0, 12, 0, 12), "Out", "Quad", 0.2, true)
return {
    MainFrame = MainFrame,
}