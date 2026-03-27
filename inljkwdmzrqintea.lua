--[[This file was beautified by Light Community | https://discord.gg/RNzAwYMj2t]]
local _ = pcall(
function(...)
    local CryHubLagger = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TitleBar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")
    local ContentFrame = Instance.new("Frame")
    local UIGradient = Instance.new("UIGradient")
    local UIGradient_2 = Instance.new("UIGradient")
    CryHubLagger.Name = "CryHubLagger"
    local CoreGui = game.CoreGui
    CryHubLagger.Parent = CoreGui
    local Enum_ZIndexBehavior = Enum.ZIndexBehavior
    local Sibling = Enum_ZIndexBehavior.Sibling
    CryHubLagger.ZIndexBehavior = Sibling
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = CryHubLagger
    local Color3_FromRGB = Color3.fromRGB
    local Color3_Value = Color3_FromRGB(22, 33, 62)
    MainFrame.BackgroundColor3 = Color3_Value
    MainFrame.BorderSizePixel = 0
    local UDim2_New = UDim2.new
    local UDim2_Value = UDim2_New(0.5, -125, 0.5, -60)
    MainFrame.Position = UDim2_Value
    local UDim2_Value_2 = UDim2_New(0, 250, 0, 120)
    MainFrame.Size = UDim2_Value_2
    MainFrame.Active = true
    MainFrame.Draggable = true
    local UDim_New = UDim.new
    local UDim_Value = UDim_New(0, 12)
    UICorner.CornerRadius = UDim_Value
    UICorner.Parent = MainFrame
    local ColorSequence_New = ColorSequence.new
    local ColorSequenceKeypoint_New = ColorSequenceKeypoint.new
    local Color3_Value_2 = Color3_FromRGB(22, 33, 62)
    local ColorSequenceKeypoint_Value = ColorSequenceKeypoint_New(0, Color3_Value_2)
    local Color3_Value_3 = Color3_FromRGB(15, 22, 38)
    local ColorSequenceKeypoint_Value_2 = ColorSequenceKeypoint_New(0.5, Color3_Value_3)
    local Color3_Value_4 = Color3_FromRGB(26, 26, 46)
    local ColorSequenceKeypoint_Value_3 = ColorSequenceKeypoint_New(1, Color3_Value_4)
    local ColorSequence_Value = ColorSequence_New({
        ColorSequenceKeypoint_Value,
        ColorSequenceKeypoint_Value_2,
        ColorSequenceKeypoint_Value_3,
    })
    UIGradient.Color = ColorSequence_Value
    UIGradient.Rotation = 135
    UIGradient.Parent = MainFrame
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    local Color3_Value_5 = Color3_FromRGB(30, 58, 95)
    TitleBar.BackgroundColor3 = Color3_Value_5
    TitleBar.BorderSizePixel = 0
    local UDim2_Value_3 = UDim2_New(1, 0, 0, 30)
    TitleBar.Size = UDim2_Value_3
    local UDim_Value_2 = UDim_New(0, 12)
    UICorner_2.CornerRadius = UDim_Value_2
    UICorner_2.Parent = TitleBar
    local Color3_Value_6 = Color3_FromRGB(30, 58, 95)
    local ColorSequenceKeypoint_Value_4 = ColorSequenceKeypoint_New(0, Color3_Value_6)
    local Color3_Value_7 = Color3_FromRGB(13, 27, 42)
    local ColorSequenceKeypoint_Value_5 = ColorSequenceKeypoint_New(1, Color3_Value_7)
    local ColorSequence_Value_2 = ColorSequence_New({
        ColorSequenceKeypoint_Value_4,
        ColorSequenceKeypoint_Value_5,
    })
    UIGradient_2.Color = ColorSequence_Value_2
    UIGradient_2.Rotation = 135
    UIGradient_2.Parent = TitleBar
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TitleBar
    TitleLabel.BackgroundTransparency = 1
    local UDim2_Value_4 = UDim2_New(0, 15, 0, 0)
    TitleLabel.Position = UDim2_Value_4
    local UDim2_Value_5 = UDim2_New(0.8, 0, 1, 0)
    TitleLabel.Size = UDim2_Value_5
    local Enum_Font = Enum.Font
    local GothamBold = Enum_Font.GothamBold
    TitleLabel.Font = GothamBold
    TitleLabel.Text = "CryHub Lagger"
    local Color3_Value_8 = Color3_FromRGB(255, 255, 255)
    TitleLabel.TextColor3 = Color3_Value_8
    TitleLabel.TextSize = 14
    local Enum_TextXAlignment = Enum.TextXAlignment
    local Left = Enum_TextXAlignment.Left
    TitleLabel.TextXAlignment = Left
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TitleBar
    local Color3_Value_9 = Color3_FromRGB(255, 68, 68)
    CloseButton.BackgroundColor3 = Color3_Value_9
    CloseButton.BorderSizePixel = 0
    local UDim2_Value_6 = UDim2_New(1, -28, 0.5, -6)
    CloseButton.Position = UDim2_Value_6
    local UDim2_Value_7 = UDim2_New(0, 12, 0, 12)
    CloseButton.Size = UDim2_Value_7
    CloseButton.Text = ""
    CloseButton.AutoButtonColor = false
    local UDim_Value_3 = UDim_New(1, 0)
    UICorner_3.CornerRadius = UDim_Value_3
    UICorner_3.Parent = CloseButton
    local UIGradient_3 = Instance.new("UIGradient")
    local Color3_Value_10 = Color3_FromRGB(255, 68, 68)
    local ColorSequenceKeypoint_Value_6 = ColorSequenceKeypoint_New(0, Color3_Value_10)
    local Color3_Value_11 = Color3_FromRGB(204, 0, 0)
    local ColorSequenceKeypoint_Value_7 = ColorSequenceKeypoint_New(1, Color3_Value_11)
    local ColorSequence_Value_3 = ColorSequence_New({
        ColorSequenceKeypoint_Value_6,
        ColorSequenceKeypoint_Value_7,
    })
    UIGradient_3.Color = ColorSequence_Value_3
    UIGradient_3.Rotation = 135
    UIGradient_3.Parent = CloseButton
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundTransparency = 1
    local UDim2_Value_8 = UDim2_New(0, 0, 0, 30)
    ContentFrame.Position = UDim2_Value_8
    local UDim2_Value_9 = UDim2_New(1, 0, 1, -30)
    ContentFrame.Size = UDim2_Value_9
    local DiscordLabel = Instance.new("TextLabel")
    DiscordLabel.Name = "DiscordLabel"
    DiscordLabel.Parent = ContentFrame
    DiscordLabel.BackgroundTransparency = 1
    local UDim2_Value_10 = UDim2_New(1, -130, 1, -22)
    DiscordLabel.Position = UDim2_Value_10
    local UDim2_Value_11 = UDim2_New(0, 120, 0, 18)
    DiscordLabel.Size = UDim2_Value_11
    local GothamBold_2 = Enum_Font.GothamBold
    DiscordLabel.Font = GothamBold_2
    DiscordLabel.Text = "discord.gg/hf3g3KqVk7"
    local Color3_Value_12 = Color3_FromRGB(114, 137, 218)
    DiscordLabel.TextColor3 = Color3_Value_12
    DiscordLabel.TextSize = 10
    local Right = Enum_TextXAlignment.Right
    DiscordLabel.TextXAlignment = Right
    local ServerLabel = Instance.new("TextLabel")
    ServerLabel.Name = "ServerLabel"
    ServerLabel.Parent = ContentFrame
    ServerLabel.BackgroundTransparency = 1
    local UDim2_Value_12 = UDim2_New(0, 10, 1, -22)
    ServerLabel.Position = UDim2_Value_12
    local UDim2_Value_13 = UDim2_New(0, 100, 0, 18)
    ServerLabel.Size = UDim2_Value_13
    local Gotham = Enum_Font.Gotham
    ServerLabel.Font = Gotham
    ServerLabel.Text = "Discord: cryxn."
    local Color3_Value_13 = Color3_FromRGB(180, 180, 180)
    ServerLabel.TextColor3 = Color3_Value_13
    ServerLabel.TextSize = 9
    local Left_2 = Enum_TextXAlignment.Left
    ServerLabel.TextXAlignment = Left_2
    local StartButton = Instance.new("TextButton")
    local UICorner_4 = Instance.new("UICorner")
    local UIGradient_4 = Instance.new("UIGradient")
    StartButton.Name = "StartButton"
    StartButton.Parent = ContentFrame
    local Color3_Value_14 = Color3_FromRGB(30, 58, 95)
    StartButton.BackgroundColor3 = Color3_Value_14
    StartButton.BorderSizePixel = 0
    local UDim2_Value_14 = UDim2_New(0.5, -90, 0.5, -25)
    StartButton.Position = UDim2_Value_14
    local UDim2_Value_15 = UDim2_New(0, 180, 0, 42)
    StartButton.Size = UDim2_Value_15
    local GothamBold_3 = Enum_Font.GothamBold
    StartButton.Font = GothamBold_3
    StartButton.Text = "Start Lagging"
    local Color3_Value_15 = Color3_FromRGB(255, 255, 255)
    StartButton.TextColor3 = Color3_Value_15
    StartButton.TextSize = 14
    StartButton.AutoButtonColor = false
    local UDim_Value_4 = UDim_New(0, 8)
    UICorner_4.CornerRadius = UDim_Value_4
    UICorner_4.Parent = StartButton
    local Color3_Value_16 = Color3_FromRGB(30, 58, 95)
    local ColorSequenceKeypoint_Value_8 = ColorSequenceKeypoint_New(0, Color3_Value_16)
    local Color3_Value_17 = Color3_FromRGB(13, 27, 42)
    local ColorSequenceKeypoint_Value_9 = ColorSequenceKeypoint_New(1, Color3_Value_17)
    local ColorSequence_Value_4 = ColorSequence_New({
        ColorSequenceKeypoint_Value_8,
        ColorSequenceKeypoint_Value_9,
    })
    UIGradient_4.Color = ColorSequence_Value_4
    UIGradient_4.Rotation = 135
    UIGradient_4.Parent = StartButton
    local HttpService = game:GetService("HttpService")
    local Players = game.Players
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character
    local Not_Character = not Character
    if Character then 
        local Character_2 = LocalPlayer.Character
        local Descendants = Character_2:GetDescendants()
        for i, v in pairs(Descendants) do
            local IsA = v.IsA
            local BasePart = v:IsA("BasePart")
            if BasePart then 
                v.LocalTransparencyModifier = 1
            end
            local Character_3 = LocalPlayer.Character
            local Connection
            Connection = Character_3.DescendantAdded:Connect(
function(...)
                local Success_1836, Error_Message_1836 = pcall(
function(...)
                    local IsA_2 = ({
                        ...
                    }).IsA
                    local BasePart_2 = (...):IsA("BasePart")
                    if BasePart_2 then
                        ({
                            ...
                        }).LocalTransparencyModifier = 1
                    end
end)
end)
            local settings = getfenv().settings
            local _call8 = settings()
            local Rendering = _call8.Rendering
            local Enum_QualityLevel = Enum.QualityLevel
            local Level01 = Enum_QualityLevel.Level01
            Rendering.QualityLevel = Level01
            local Connection_2
            Connection_2 = StartButton.MouseButton1Click:Connect(
function(...)
                local Success_1852, Error_Message_1852 = pcall(
function(...)
                    StartButton.Text = "Stop Lagging"
                    local Color3_Value_18 = Color3_FromRGB(255, 68, 68)
                    local ColorSequenceKeypoint_Value_10 = ColorSequenceKeypoint_New(0, Color3_Value_18)
                    local Color3_Value_19 = Color3_FromRGB(204, 0, 0)
                    local ColorSequenceKeypoint_Value_11 = ColorSequenceKeypoint_New(1, Color3_Value_19)
                    local ColorSequence_Value_5 = ColorSequence_New({
                        ColorSequenceKeypoint_Value_10,
                        ColorSequenceKeypoint_Value_11,
                    })
                    UIGradient_4.Color = ColorSequence_Value_5
                    local Spawned = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
                        local Success_2077, Error_Message_2077 = pcall(
function(...)
                            local Waited_For = task.wait(5)
                            local Success_2083, Error_Message_2083 = pcall(
function(...)
                                StartButton.Text = "Start Lagging"
                                local Color3_Value_20 = Color3_FromRGB(30, 58, 95)
                                local ColorSequenceKeypoint_Value_12 = ColorSequenceKeypoint_New(0, Color3_Value_20)
                                local Color3_Value_21 = Color3_FromRGB(13, 27, 42)
                                local ColorSequenceKeypoint_Value_13 = ColorSequenceKeypoint_New(1, Color3_Value_21)
                                local ColorSequence_Value_6 = ColorSequence_New({
                                    ColorSequenceKeypoint_Value_12,
                                    ColorSequenceKeypoint_Value_13,
                                })
                                UIGradient_4.Color = ColorSequence_Value_6
                                local Character_4 = LocalPlayer.Character
                                local Not_Character_4 = not Character_4
                                if Character_4 then 
                                    local Humanoid = Character_4:FindFirstChildOfClass("Humanoid")
                                    local Not_Humanoid = not Humanoid
                                    if Humanoid then 
                                        local FindFirstChildOfClass = Humanoid.FindFirstChildOfClass
                                        local Animator = Humanoid:FindFirstChildOfClass("Animator")
                                        local Not_Animator = not Animator
                                        if Animator then 
                                            local GetPlayingAnimationTracks = Animator.GetPlayingAnimationTracks
                                            local PlayingAnimationTracks = Animator:GetPlayingAnimationTracks()
                                            for i_2, v_2 in pairs(PlayingAnimationTracks) do
                                                local Success_2141, Error_Message_2141 = pcall(
function(...)
                                                    local Success_2142, Error_Message_2142 = pcall(
function(...)
                                                        local Stop = v_2.Stop
                                                        local Stop_2 = v_2:Stop()
                                                        local Destroy_2 = v_2.Destroy
                                                        local Destroy_3 = v_2:Destroy()
end)
end)
                                            end
                                            local Not_Spawned = not Spawned
                                            if Spawned then 
                                                task.cancel(Spawned)
                                            end
                                        end
                                    end
                                end
end)
end)
end)
                    local Spawned_2 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array = {}
                    local var8 = table.insert(Array, Spawned_2)
                    local Spawned_3 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_2 = Array
                    local var9 = table.insert(Array_2, Spawned_3)
                    local Spawned_4 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_3 = Array_2
                    local var10 = table.insert(Array_3, Spawned_4)
                    local Spawned_5 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_4 = Array_3
                    local var11 = table.insert(Array_4, Spawned_5)
                    local Spawned_6 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_5 = Array_4
                    local var12 = table.insert(Array_5, Spawned_6)
                    local Spawned_7 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_6 = Array_5
                    local var13 = table.insert(Array_6, Spawned_7)
                    local Spawned_8 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_7 = Array_6
                    local var14 = table.insert(Array_7, Spawned_8)
                    local Spawned_9 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_8 = Array_7
                    local var15 = table.insert(Array_8, Spawned_9)
                    local Spawned_10 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_9 = Array_8
                    local var16 = table.insert(Array_9, Spawned_10)
                    local Spawned_11 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_10 = Array_9
                    local var17 = table.insert(Array_10, Spawned_11)
                    local Spawned_12 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_11 = Array_10
                    local var18 = table.insert(Array_11, Spawned_12)
                    local Spawned_13 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_12 = Array_11
                    local var19 = table.insert(Array_12, Spawned_13)
                    local Spawned_14 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_13 = Array_12
                    local var20 = table.insert(Array_13, Spawned_14)
                    local Spawned_15 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_14 = Array_13
                    local var21 = table.insert(Array_14, Spawned_15)
                    local Spawned_16 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_15 = Array_14
                    local var22 = table.insert(Array_15, Spawned_16)
                    local Spawned_17 = task.spawn(function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
end)
                    local Array_16 = Array_15
                    local var23 = table.insert(Array_16, Spawned_17)
end)
end)
            local Connection_3
            Connection_3 = StartButton.MouseEnter:Connect(
function(...)
                local Success_1925, Error_Message_1925 = pcall(
function(...)
                    local UDim2_Value_16 = UDim2_New(0, 190, 0, 46)
                    local TweenSize = StartButton:TweenSize(UDim2_Value_16, "Out", "Quad", 0.2, true)
end)
end)
            local Connection_4
            Connection_4 = StartButton.MouseLeave:Connect(
function(...)
                local Success_2003, Error_Message_2003 = pcall(
function(...)
                    local UDim2_Value_17 = UDim2_New(0, 180, 0, 42)
                    local TweenSize_2 = StartButton:TweenSize(UDim2_Value_17, "Out", "Quad", 0.2, true)
end)
end)
            local Connection_5
            Connection_5 = CloseButton.MouseButton1Click:Connect(
function(...)
                local Success_2015, Error_Message_2015 = pcall(
function(...)
                    local UDim2_Value_18 = UDim2_New(0, 10, 0, 10)
                    local TweenSize_3 = CloseButton:TweenSize(UDim2_Value_18, "Out", "Quad", 0.1, true, function(ext_1_0, ext_2_0, ext_3_0, ext_4_0, ext_5_0, ...)
                        local Success_2185, Error_Message_2185 = pcall(
function(...)
                            local UDim2_Value_22 = UDim2_New(0, 12, 0, 12)
                            local TweenSize_7 = CloseButton:TweenSize(UDim2_Value_22, "Out", "Quad", 0.1, true)
end)
end)
                    local var24 = wait(0.2)
                    local UDim2_Value_19 = UDim2_New(0, 0, 0, 0)
                    local TweenSize_4 = MainFrame:TweenSize(UDim2_Value_19, "Out", "Quad", 0.3, true)
                    local var25 = wait(0.3)
                    local Destroy = CryHubLagger:Destroy()
end)
end)
            local Connection_6
            Connection_6 = CloseButton.MouseEnter:Connect(
function(...)
                local Success_2064, Error_Message_2064 = pcall(
function(...)
                    local UDim2_Value_20 = UDim2_New(0, 14, 0, 14)
                    local TweenSize_5 = CloseButton:TweenSize(UDim2_Value_20, "Out", "Quad", 0.2, true)
end)
end)
            local Connection_7
            Connection_7 = CloseButton.MouseLeave:Connect(
function(...)
                local Success_2065, Error_Message_2065 = pcall(
function(...)
                    local UDim2_Value_21 = UDim2_New(0, 12, 0, 12)
                    local TweenSize_6 = CloseButton:TweenSize(UDim2_Value_21, "Out", "Quad", 0.2, true)
end)
end)
        end
    end
end)
return {
    ContentFrame = ContentFrame,
    MainFrame = MainFrame,
}