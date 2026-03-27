-- special dumped using larry dec/deobf (dsc.gg/larrydeobf)


local genv = getgenv()
local _ = require == require
local larry6 = cloneref(game:GetService("TweenService"))
local larry9 = cloneref(game:GetService("RunService"))
local larry12 = cloneref(game:GetService("HttpService"))
local larry15 = cloneref(game:GetService("UserInputService"))
cloneref(game:GetService("CoreGui"))
local _ = cloneref(game:GetService("Players")).LocalPlayer
local larry24 = Color3.fromRGB(16, 24, 39)
local larry26 = Color3.fromRGB(12, 18, 32)
local larry28 = Color3.fromRGB(21, 30, 47)
local larry30 = Color3.fromRGB(10, 82, 120)
local larry32 = Color3.fromRGB(56, 189, 248)
local larry34 = Color3.fromRGB(56, 189, 248)
local larry36 = Color3.fromRGB(30, 41, 59)
local larry38 = Color3.fromRGB(25, 32, 48)
local larry40 = Color3.fromRGB(52, 180, 230)
local larry42 = Color3.fromRGB(241, 245, 249)
local larry44 = Color3.fromRGB(148, 163, 184)
local larry46 = Color3.fromRGB(239, 68, 68)
local larry48 = Enum.Font.GothamBold
local larry50 = Enum.Font.GothamMedium
local larry52 = Enum.Font.Gotham
local _ = genv.IO_SAVE
genv.IO_SAVE = function(...)

end
return {
    LoadConfig = function(...)
        local _55_vararg1, _55_vararg2 = ...
        local _ = "ChilliLib" .. "/settings/" .. _55_vararg2 .. ".json"
        return false, "No file"
    end,
    Options = {},
    Window = function(...)
        local _59_vararg1, _59_vararg2 = ...
        local larry61 = Instance.new("ScreenGui")
        larry61.Name = "ChilliLibUI"
        larry61.ScreenInsets = Enum.ScreenInsets.None
        larry61.ResetOnSpawn = false
        larry61.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        larry61.DisplayOrder = 10000
        local _ = larry9.IsStudio
        larry61.Parent = gethui()
        local larry69 = Instance.new("Frame")
        larry69.Name = "Notifications"
        larry69.BackgroundTransparency = 1
        larry69.Size = UDim2.new(0, 300, 1, - 20)
        larry69.Position = UDim2.new(1, - 320, 0, 10)
        larry69.AnchorPoint = Vector2.new(0, 0)
        larry69.Parent = larry61
        larry69.ZIndex = 100
        local larry77 = Instance.new("UIListLayout")
        larry77.Padding = UDim.new(0, 10)
        larry77.HorizontalAlignment = Enum.HorizontalAlignment.Center
        larry77.SortOrder = Enum.SortOrder.LayoutOrder
        larry77.VerticalAlignment = Enum.VerticalAlignment.Bottom
        larry77.Parent = larry69
        local larry86 = _59_vararg2.Size
        local _ = larry86.X.Scale
        local _ = larry86.Y.Scale
        local larry100 = UDim2.new(larry86.X.Scale, larry86.X.Offset, larry86.Y.Scale, larry86.Y.Offset)
        local larry102 = Instance.new("Frame")
        larry102.Name = "MainBase"
        larry102.AnchorPoint = Vector2.new(0.5, 0.5)
        larry102.Position = UDim2.fromScale(0.5, 0.5)
        larry102.Size = larry100
        larry102.Parent = larry61
        larry102.ClipsDescendants = false
        larry102.BackgroundColor3 = larry24
        larry102.BorderSizePixel = 0
        local larry108 = Instance.new("UICorner", larry102)
        larry108.CornerRadius = UDim.new(0, 20)
        local larry112 = Instance.new("UIGradient", larry102)
        larry112.Rotation = 35
        local larry120 = ColorSequence.new({
            [1] = ColorSequenceKeypoint.new(0, larry26),
            [2] = ColorSequenceKeypoint.new(0.55, larry28),
            [3] = ColorSequenceKeypoint.new(1, larry30),
        })
        larry112.Color = larry120
        local larry122 = Instance.new("UIStroke", larry102)
        larry122.Thickness = 3
        larry122.Transparency = 0.8
        larry122.Color = larry32
        larry122.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local larry126 = Instance.new("UIStroke", larry102)
        larry126.Thickness = 1
        larry126.Transparency = 0.5
        larry126.Color = larry34
        larry126.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        larry102.InputBegan:Connect(function(...)
            local _132_vararg1 = ...
            local _ = _132_vararg1.UserInputType == Enum.UserInputType.MouseButton1
            local _ = _132_vararg1.UserInputType == Enum.UserInputType.Touch
        end)
        larry102.InputChanged:Connect(function(...)
            local _144_vararg1 = ...
            local _ = _144_vararg1.UserInputType == Enum.UserInputType.MouseMovement
            local _ = _144_vararg1.UserInputType == Enum.UserInputType.Touch
        end)
        larry15.InputChanged:Connect(function(...)
        end)
        larry102.Size = UDim2.new(0, 0, 0, 0)
        larry102.Visible = true
        local larry166 = larry6:Create(larry102, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = larry100,
        })
        larry166:Play()
        local larry170 = Instance.new("Frame")
        larry170.Name = "TopBar"
        larry170.Parent = larry102
        larry170.BackgroundColor3 = larry38
        larry170.BackgroundTransparency = 0.3
        larry170.BorderSizePixel = 0
        larry170.Size = UDim2.new(1, - 14, 0, 32)
        larry170.Position = UDim2.new(0, 7, 0, 7)
        local larry176 = Instance.new("UICorner", larry170)
        larry176.CornerRadius = UDim.new(0, 12)
        local larry180 = Instance.new("TextLabel")
        larry180.Parent = larry170
        larry180.BackgroundTransparency = 1
        larry180.Position = UDim2.new(0, 16, 0, 0)
        larry180.Size = UDim2.new(1, - 80, 1, 0)
        larry180.Font = larry48
        larry180.Text = _59_vararg2.Title
        larry180.TextXAlignment = Enum.TextXAlignment.Left
        larry180.TextSize = 18
        larry180.TextColor3 = larry42
        local larry189 = Instance.new("UIGradient", larry180)
        local larry203 = ColorSequence.new({
            [1] = ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 211, 238)),
            [2] = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
            [3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(99, 102, 241)),
        })
        larry189.Color = larry203
        local larry205 = Instance.new("TextButton", larry170)
        larry205.Size = UDim2.fromOffset(24, 24)
        larry205.Position = UDim2.new(1, - 30, 0.5, - 12)
        larry205.BackgroundColor3 = larry36
        larry205.Text = "X"
        larry205.Font = larry48
        larry205.TextSize = 14
        larry205.TextColor3 = larry46
        larry205.AutoButtonColor = true
        local larry211 = Instance.new("UICorner", larry205)
        larry211.CornerRadius = UDim.new(0, 8)
        local larry215 = Instance.new("UIStroke", larry205)
        larry215.Color = larry34
        larry215.Transparency = 0.7
        larry215.Thickness = 1
        larry205.MouseButton1Click:Connect(function(...)
            local larry229 = larry6:Create(larry102, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
            })
            larry229:Play()
            task.delay(0.26, function(...)
                larry102.Visible = false
            end)
        end)
        larry15.InputBegan:Connect(function(...)
        end)
        local larry240 = Instance.new("Frame", larry102)
        larry240.BackgroundTransparency = 1
        larry240.Position = UDim2.new(0, 10, 0, 45)
        larry240.Size = UDim2.new(1, - 20, 1, - 50)
        local larry246 = Instance.new("ScrollingFrame", larry240)
        larry246.Size = UDim2.new(0, 105, 1, 0)
        larry246.BackgroundTransparency = 1
        larry246.ScrollBarThickness = 2
        larry246.BorderSizePixel = 0
        larry246.CanvasSize = UDim2.new(0, 0, 0, 0)
        larry246.AutomaticCanvasSize = Enum.AutomaticSize.Y
        local larry254 = Instance.new("UIListLayout", larry246)
        larry254.Padding = UDim.new(0, 6)
        larry254.SortOrder = Enum.SortOrder.LayoutOrder
        local larry260 = Instance.new("Frame", larry240)
        larry260.Size = UDim2.new(0, 1, 1, 0)
        larry260.Position = UDim2.new(0, 115, 0, 0)
        larry260.BackgroundColor3 = larry34
        larry260.BackgroundTransparency = 0.8
        larry260.BorderSizePixel = 0
        local larry266 = Instance.new("Frame", larry240)
        larry266.Size = UDim2.new(1, - 125, 1, 0)
        larry266.Position = UDim2.new(0, 125, 0, 0)
        larry266.BackgroundTransparency = 1
        larry266.ClipsDescendants = true
        return {
            Show = function(...)
                larry102.Visible = true
                local larry279 = larry6:Create(larry102, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Size = larry100,
                })
                larry279:Play()
            end,
            TabGroup = function(...)
                return {
                    Tab = function(...)
                        local _283_vararg1, _283_vararg2 = ...
                        local larry285 = Instance.new("TextButton", larry246)
                        larry285.Size = UDim2.new(1, - 4, 0, 32)
                        larry285.BackgroundColor3 = larry36
                        larry285.BackgroundTransparency = 1
                        larry285.Text = ""
                        larry285.AutoButtonColor = false
                        local larry289 = Instance.new("UICorner", larry285)
                        larry289.CornerRadius = UDim.new(0, 10)
                        local larry293 = Instance.new("UIStroke", larry285)
                        larry293.Transparency = 1
                        larry293.Color = larry40
                        larry293.Thickness = 1
                        local larry295 = Instance.new("Frame", larry285)
                        larry295.Size = UDim2.new(0, 3, 1, - 6)
                        larry295.Position = UDim2.new(0, 1, 0, 3)
                        larry295.BackgroundColor3 = larry40
                        larry295.BorderSizePixel = 0
                        larry295.BackgroundTransparency = 1
                        local larry301 = Instance.new("UIGradient", larry285)
                        larry301.Rotation = 35
                        local larry309 = ColorSequence.new({
                            [1] = ColorSequenceKeypoint.new(0, larry26),
                            [2] = ColorSequenceKeypoint.new(0.55, larry28),
                            [3] = ColorSequenceKeypoint.new(1, larry30),
                        })
                        larry301.Color = larry309
                        larry301.Enabled = false
                        local larry311 = Instance.new("ImageLabel", larry285)
                        larry311.Size = UDim2.fromOffset(18, 18)
                        larry311.Position = UDim2.new(0, 8, 0.5, - 9)
                        larry311.BackgroundTransparency = 1
                        larry311.ImageColor3 = larry44
                        local _ = _283_vararg2.Image
                        local larry317 = _283_vararg2.Image
                        local larry321 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Dummyrme/Library/refs/heads/main/Icon.lua"))()
                        local _ = larry321.Icons
                        local _ = larry321.Icons[larry317]
                        local larry326 = larry321.Icons[larry317]
                        larry311.Image = larry321.Spritesheets[larry326.Image]
                        larry311.ImageRectOffset = larry326.ImageRectPosition
                        larry311.ImageRectSize = larry326.ImageRectSize
                        local larry333 = Instance.new("TextLabel", larry285)
                        larry333.BackgroundTransparency = 1
                        larry333.Position = UDim2.new(0, 30, 0, 0)
                        larry333.Size = UDim2.new(1, - 32, 1, 0)
                        larry333.Font = larry48
                        larry333.Text = _283_vararg2.Title
                        larry333.TextSize = 15
                        larry333.TextColor3 = larry44
                        larry333.TextXAlignment = Enum.TextXAlignment.Left
                        local larry342 = Instance.new("ScrollingFrame", larry266)
                        larry342.Size = UDim2.fromScale(1, 1)
                        larry342.BackgroundTransparency = 1
                        larry342.Visible = false
                        larry342.ScrollBarThickness = 2
                        larry342.ScrollBarImageColor3 = larry40
                        larry342.BorderSizePixel = 0
                        larry342.CanvasSize = UDim2.new(0, 0, 0, 0)
                        larry342.AutomaticCanvasSize = Enum.AutomaticSize.Y
                        local larry350 = Instance.new("UIListLayout", larry342)
                        larry350.Padding = UDim.new(0, 12)
                        larry350.SortOrder = Enum.SortOrder.LayoutOrder
                        local larry356 = Instance.new("UIPadding", larry342)
                        larry356.PaddingLeft = UDim.new(0, 4)
                        larry356.PaddingRight = UDim.new(0, 4)
                        larry356.PaddingTop = UDim.new(0, 4)
                        larry356.PaddingBottom = UDim.new(0, 10)
                        larry285.MouseButton1Click:Connect(function(...)
                            larry342.Visible = true
                            larry342.Position = UDim2.new(0, 10, 0, 0)
                            local larry378 = larry6:Create(larry342, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                                Position = UDim2.new(0, 0, 0, 0),
                            })
                            larry378:Play()
                            local larry384 = larry6:Create(larry285, TweenInfo.new(0.2), {
                                BackgroundTransparency = 0,
                            })
                            larry384:Play()
                            local larry390 = larry6:Create(larry293, TweenInfo.new(0.2), {
                                Transparency = 0.4,
                            })
                            larry390:Play()
                            local larry396 = larry6:Create(larry333, TweenInfo.new(0.2), {
                                TextColor3 = larry42,
                            })
                            larry396:Play()
                            local larry402 = larry6:Create(larry311, TweenInfo.new(0.2), {
                                ImageColor3 = larry40,
                            })
                            larry402:Play()
                            larry301.Enabled = true
                            local larry408 = larry6:Create(larry295, TweenInfo.new(0.2), {
                                BackgroundTransparency = 0,
                            })
                            larry408:Play()
                        end)
                        return {
                            Select = function(...)
                                local _ = larry285 == larry285
                            end,
                            Section = function(...)
                                local _413_vararg1, _413_vararg2 = ...
                                local larry415 = Instance.new("Frame", larry342)
                                larry415.Size = UDim2.new(1, - 2, 0, 0)
                                larry415.AutomaticSize = Enum.AutomaticSize.Y
                                larry415.BackgroundTransparency = 0
                                larry415.ClipsDescendants = true
                                larry415.BackgroundColor3 = larry24
                                larry415.BorderSizePixel = 0
                                local larry421 = Instance.new("UICorner", larry415)
                                larry421.CornerRadius = UDim.new(0, 12)
                                local larry425 = Instance.new("UIGradient", larry415)
                                larry425.Rotation = 35
                                local larry433 = ColorSequence.new({
                                    [1] = ColorSequenceKeypoint.new(0, larry26),
                                    [2] = ColorSequenceKeypoint.new(0.55, larry28),
                                    [3] = ColorSequenceKeypoint.new(1, larry30),
                                })
                                larry425.Color = larry433
                                local larry435 = Instance.new("UIStroke", larry415)
                                larry435.Thickness = 3
                                larry435.Transparency = 0.8
                                larry435.Color = larry32
                                larry435.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                local larry439 = Instance.new("UIStroke", larry415)
                                larry439.Thickness = 1
                                larry439.Transparency = 0.5
                                larry439.Color = larry34
                                larry439.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                local larry443 = Instance.new("UIPadding", larry415)
                                larry443.PaddingTop = UDim.new(0, 4)
                                larry443.PaddingBottom = UDim.new(0, 4)
                                larry443.PaddingLeft = UDim.new(0, 2)
                                larry443.PaddingRight = UDim.new(0, 2)
                                local _ = _413_vararg2.Title
                                local larry454 = Instance.new("TextButton", larry415)
                                larry454.Size = UDim2.new(1, - 16, 0, 24)
                                larry454.Position = UDim2.new(0, 8, 0, 4)
                                larry454.BackgroundTransparency = 1
                                larry454.Text = ""
                                local larry460 = Instance.new("TextLabel", larry454)
                                larry460.Text = _413_vararg2.Title
                                larry460.Font = larry48
                                larry460.TextSize = 16
                                larry460.TextColor3 = Color3.fromRGB(255, 255, 255)
                                larry460.Size = UDim2.new(1, - 20, 1, 0)
                                larry460.BackgroundTransparency = 1
                                larry460.TextXAlignment = Enum.TextXAlignment.Left
                                local larry469 = Instance.new("UIGradient", larry460)
                                local larry483 = ColorSequence.new({
                                    [1] = ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 211, 238)),
                                    [2] = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                                    [3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
                                })
                                larry469.Color = larry483
                                local larry485 = Instance.new("TextLabel", larry454)
                                larry485.Text = "\xE2\x96\xBC"
                                larry485.TextColor3 = larry40
                                larry485.BackgroundTransparency = 1
                                larry485.Size = UDim2.new(0, 20, 1, 0)
                                larry485.Position = UDim2.new(1, - 20, 0, 0)
                                larry485.TextSize = 12
                                local larry491 = Instance.new("Frame", larry415)
                                larry491.Name = "ContentHolder"
                                larry491.BackgroundTransparency = 1
                                local _ = _413_vararg2.Title
                                larry491.Position = UDim2.new(0, 8, 0, 32)
                                larry491.Size = UDim2.new(1, - 16, 0, 0)
                                larry491.AutomaticSize = Enum.AutomaticSize.Y
                                local larry500 = Instance.new("UIListLayout", larry491)
                                larry500.Padding = UDim.new(0, 8)
                                larry500.SortOrder = Enum.SortOrder.LayoutOrder
                                larry500.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                local larry508 = Instance.new("UIPadding", larry491)
                                larry508.PaddingBottom = UDim.new(0, 6)
                                larry454.MouseButton1Click:Connect(function(...)
                                    local larry518 = larry6:Create(larry485, TweenInfo.new(0.2), {
                                        Rotation = - 90,
                                    })
                                    larry518:Play()
                                    local larry524 = larry6:Create(larry491, TweenInfo.new(0.2), {
                                        BackgroundTransparency = 1,
                                    })
                                    larry524:Play()
                                    larry491.Visible = false
                                end)
                                return {
                                    Paragraph = function(...)
                                        local _527_vararg1, _527_vararg2 = ...
                                        local larry529 = Instance.new("Frame", larry491)
                                        larry529.Size = UDim2.new(1, 0, 0, 44)
                                        larry529.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
                                        larry529.BackgroundTransparency = 0.5
                                        local larry535 = Instance.new("UICorner", larry529)
                                        larry535.CornerRadius = UDim.new(0, 8)
                                        local larry539 = Instance.new("UIStroke", larry529)
                                        larry539.Color = larry34
                                        larry539.Transparency = 0.9
                                        larry539.Thickness = 1
                                        larry529.BackgroundTransparency = 0.25
                                        local larry541 = larry529:FindFirstChildOfClass("UIStroke")
                                        larry541.Transparency = 0.5
                                        larry541.Thickness = 1
                                        local larry544 = Instance.new("TextLabel", larry529)
                                        larry544.Size = UDim2.new(1, - 10, 1, 0)
                                        larry544.Position = UDim2.new(0, 10, 0, 0)
                                        larry544.BackgroundTransparency = 1
                                        larry544.Text = _527_vararg2.Title
                                        larry544.Font = larry50
                                        larry544.TextSize = 14
                                        larry544.TextColor3 = larry42
                                        larry544.TextXAlignment = Enum.TextXAlignment.Left
                                        larry544.Font = larry48
                                        larry544.TextSize = 14
                                        local larry552 = Instance.new("TextLabel", larry529)
                                        larry552.Size = UDim2.new(1, - 20, 1, - 22)
                                        larry552.Position = UDim2.new(0, 10, 0, 20)
                                        larry552.BackgroundTransparency = 1
                                        larry552.Text = _527_vararg2.Desc
                                        larry552.TextColor3 = larry42
                                        larry552.TextSize = 13
                                        larry552.TextWrapped = true
                                        larry552.TextXAlignment = Enum.TextXAlignment.Left
                                        larry552.TextYAlignment = Enum.TextYAlignment.Top
                                        larry552.Font = larry50
                                    end,
                                    Dropdown = function(...)
                                        local _562_vararg1, _562_vararg2 = ...
                                        local larry564 = Instance.new("Frame", larry491)
                                        larry564.Size = UDim2.new(1, 0, 0, 44)
                                        larry564.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
                                        larry564.BackgroundTransparency = 0.5
                                        local larry570 = Instance.new("UICorner", larry564)
                                        larry570.CornerRadius = UDim.new(0, 8)
                                        local larry574 = Instance.new("UIStroke", larry564)
                                        larry574.Color = larry34
                                        larry574.Transparency = 0.9
                                        larry574.Thickness = 1
                                        larry564.ClipsDescendants = true
                                        local larry576 = Instance.new("TextLabel", larry564)
                                        larry576.Size = UDim2.new(1, - 10, 0, 20)
                                        larry576.Position = UDim2.new(0, 10, 0, 4)
                                        larry576.BackgroundTransparency = 1
                                        larry576.Text = _562_vararg2.Title
                                        larry576.Font = larry50
                                        larry576.TextSize = 14
                                        larry576.TextColor3 = larry42
                                        larry576.TextXAlignment = Enum.TextXAlignment.Left
                                        local larry586 = Instance.new("TextLabel", larry564)
                                        larry586.Size = UDim2.new(0, 110, 0, 20)
                                        larry586.Position = UDim2.new(1, - 140, 0, 4)
                                        larry586.Text = _562_vararg2.Default
                                        larry586.Font = larry48
                                        larry586.TextColor3 = larry42
                                        larry586.TextXAlignment = Enum.TextXAlignment.Right
                                        larry586.BackgroundTransparency = 1
                                        larry586.TextSize = 13
                                        local larry594 = Instance.new("TextLabel", larry564)
                                        larry594.Text = "\xE2\x96\xBC"
                                        larry594.Size = UDim2.new(0, 20, 0, 20)
                                        larry594.Position = UDim2.new(1, - 26, 0, 4)
                                        larry594.BackgroundTransparency = 1
                                        larry594.TextColor3 = larry44
                                        larry594.TextSize = 12
                                        local larry600 = Instance.new("TextButton", larry564)
                                        larry600.Size = UDim2.new(1, 0, 1, 0)
                                        larry600.BackgroundTransparency = 1
                                        larry600.Text = ""
                                        local larry604 = Instance.new("Frame", larry564)
                                        larry604.Size = UDim2.new(1, - 10, 0, 0)
                                        larry604.Position = UDim2.new(0, 5, 0, 26)
                                        larry604.BackgroundTransparency = 1
                                        larry604.Visible = false
                                        local larry610 = Instance.new("UIListLayout", larry604)
                                        larry610.Padding = UDim.new(0, 4)
                                        for larry615, _615_2 in pairs(larry604:GetChildren()) do
                                            _615_2:IsA("TextButton")
                                            _615_2:Destroy()
                                        end
                                        local larry620 = _562_vararg2.Options
                                        for larry621, _621_2 in ipairs(larry620) do
                                            local larry623 = Instance.new("TextButton", larry604)
                                            larry623.Size = UDim2.new(1, 0, 0, 26)
                                            larry623.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
                                            larry623.Text = _621_2
                                            larry623.Font = larry52
                                            larry623.TextColor3 = larry42
                                            larry623.TextSize = 13
                                            local larry629 = Instance.new("UICorner", larry623)
                                            larry629.CornerRadius = UDim.new(0, 6)
                                            local larry633 = Instance.new("UIStroke", larry623)
                                            larry633.Color = larry34
                                            larry633.Transparency = 0.7
                                            larry633.Thickness = 1
                                            larry623.MouseButton1Click:Connect(function(...)
                                                larry586.Text = _621_2
                                                larry586.TextColor3 = larry42
                                                local _ = _562_vararg2.Callback
                                                _562_vararg2.Callback(_621_2)
                                                larry604.Visible = false
                                                local larry648 = larry6:Create(larry564, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                                                    Size = UDim2.new(1, 0, 0, 44),
                                                })
                                                larry648:Play()
                                                local larry654 = larry6:Create(larry594, TweenInfo.new(0.25), {
                                                    Rotation = 0,
                                                })
                                                larry654:Play()
                                            end)
                                        end
                                        local _ = # larry620
                                        larry604.Size = UDim2.new(1, - 10, 0, 21045074130)
                                        larry600.MouseButton1Click:Connect(function(...)
                                            larry604.Visible = true
                                            local larry676 = larry6:Create(larry564, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                                                Size = UDim2.new(1, 0, 0, ((44 + larry604.Size.Y.Offset) + 4)),
                                            })
                                            larry676:Play()
                                            local larry682 = larry6:Create(larry594, TweenInfo.new(0.25), {
                                                Rotation = 180,
                                            })
                                            larry682:Play()
                                        end)
                                        return {
                                            Value = _621_2,
                                            Class = "Dropdown",
                                            Refresh = function(...)
                                                local _685_vararg1, _685_vararg2 = ...
                                                _562_vararg2.Options = _685_vararg2
                                                for larry688, _688_2 in pairs(larry604:GetChildren()) do
                                                    _688_2:IsA("TextButton")
                                                    _688_2:Destroy()
                                                end
                                                local larry693 = _562_vararg2.Options
                                                for larry694, _694_2 in ipairs(larry693) do
                                                    local larry696 = Instance.new("TextButton", larry604)
                                                    larry696.Size = UDim2.new(1, 0, 0, 26)
                                                    larry696.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
                                                    larry696.Text = _694_2
                                                    larry696.Font = larry52
                                                    larry696.TextColor3 = larry42
                                                    larry696.TextSize = 13
                                                    local larry702 = Instance.new("UICorner", larry696)
                                                    larry702.CornerRadius = UDim.new(0, 6)
                                                    local larry706 = Instance.new("UIStroke", larry696)
                                                    larry706.Color = larry34
                                                    larry706.Transparency = 0.7
                                                    larry706.Thickness = 1
                                                    larry696.MouseButton1Click:Connect(function(...)
                                                        larry586.Text = _694_2
                                                        larry586.TextColor3 = larry42
                                                        local _ = _562_vararg2.Callback
                                                        _562_vararg2.Callback(_694_2)
                                                        larry604.Visible = false
                                                        local larry721 = larry6:Create(larry564, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                                                            Size = UDim2.new(1, 0, 0, 44),
                                                        })
                                                        larry721:Play()
                                                        local larry727 = larry6:Create(larry594, TweenInfo.new(0.25), {
                                                            Rotation = 0,
                                                        })
                                                        larry727:Play()
                                                    end)
                                                end
                                                local _ = # larry693
                                                larry604.Size = UDim2.new(1, - 10, 0, 17771637780)
                                            end,
                                            Set = function(...)
                                                local _733_vararg1, _733_vararg2 = ...
                                                larry586.Text = _733_vararg2
                                                larry586.TextColor3 = larry42
                                            end,
                                        }
                                    end,
                                    Divider = function(...)
                                        local larry736 = Instance.new("Frame", larry491)
                                        larry736.Size = UDim2.new(1, 0, 0, 1)
                                        larry736.BackgroundColor3 = larry34
                                        larry736.BackgroundTransparency = 0.8
                                        larry736.BorderSizePixel = 0
                                    end,
                                    Label = function(...)
                                        local _739_vararg1, _739_vararg2 = ...
                                        local larry741 = Instance.new("Frame", larry491)
                                        larry741.Size = UDim2.new(1, 0, 0, 24)
                                        larry741.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
                                        larry741.BackgroundTransparency = 0.5
                                        local larry747 = Instance.new("UICorner", larry741)
                                        larry747.CornerRadius = UDim.new(0, 8)
                                        local larry751 = Instance.new("UIStroke", larry741)
                                        larry751.Color = larry34
                                        larry751.Transparency = 0.9
                                        larry751.Thickness = 1
                                        larry741.BackgroundTransparency = 1
                                        larry741:FindFirstChildOfClass("UIStroke"):Destroy()
                                        local larry758 = Instance.new("TextLabel", larry741)
                                        larry758.Size = UDim2.new(1, - 10, 1, 0)
                                        larry758.Position = UDim2.new(0, 10, 0, 0)
                                        larry758.BackgroundTransparency = 1
                                        larry758.Text = _739_vararg2.Title
                                        larry758.Font = larry50
                                        larry758.TextSize = 14
                                        larry758.TextColor3 = larry42
                                        larry758.TextXAlignment = Enum.TextXAlignment.Left
                                        larry758.Font = larry52
                                    end,
                                    Button = function(...)
                                        local _765_vararg1, _765_vararg2 = ...
                                        local larry767 = Instance.new("Frame", larry491)
                                        larry767.Size = UDim2.new(1, 0, 0, 36)
                                        larry767.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
                                        larry767.BackgroundTransparency = 0.5
                                        local larry773 = Instance.new("UICorner", larry767)
                                        larry773.CornerRadius = UDim.new(0, 8)
                                        local larry777 = Instance.new("UIStroke", larry767)
                                        larry777.Color = larry34
                                        larry777.Transparency = 0.9
                                        larry777.Thickness = 1
                                        larry767.BackgroundColor3 = larry40
                                        larry767.BackgroundTransparency = 0.9
                                        local larry779 = Instance.new("TextButton", larry767)
                                        larry779.Size = UDim2.fromScale(1, 1)
                                        larry779.BackgroundTransparency = 1
                                        larry779.Text = _765_vararg2.Title
                                        larry779.Font = larry48
                                        larry779.TextColor3 = larry40
                                        larry779.TextSize = 14
                                        larry779.MouseButton1Click:Connect(function(...)
                                            local _ = _765_vararg2.Callback
                                            _765_vararg2.Callback()
                                            local larry793 = larry6:Create(larry779, TweenInfo.new(0.1), {
                                                TextSize = 12,
                                            })
                                            larry793:Play()
                                            task.wait(0.1)
                                            local larry799 = larry6:Create(larry779, TweenInfo.new(0.1), {
                                                TextSize = 14,
                                            })
                                            larry799:Play()
                                        end)
                                        return {
                                            SetTitle = function(...)
                                                local _802_vararg1, _802_vararg2 = ...
                                                larry779.Text = _802_vararg2
                                            end,
                                            Class = "Button",
                                        }
                                    end,
                                    Input = function(...)
                                        local _803_vararg1, _803_vararg2 = ...
                                        local larry805 = Instance.new("Frame", larry491)
                                        larry805.Size = UDim2.new(1, 0, 0, 38)
                                        larry805.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
                                        larry805.BackgroundTransparency = 0.5
                                        local larry811 = Instance.new("UICorner", larry805)
                                        larry811.CornerRadius = UDim.new(0, 8)
                                        local larry815 = Instance.new("UIStroke", larry805)
                                        larry815.Color = larry34
                                        larry815.Transparency = 0.9
                                        larry815.Thickness = 1
                                        local larry818 = Instance.new("TextLabel", larry805)
                                        larry818.Size = UDim2.new(1, - 10, 1, 0)
                                        larry818.Position = UDim2.new(0, 10, 0, 0)
                                        larry818.BackgroundTransparency = 1
                                        larry818.Text = _803_vararg2.Title
                                        larry818.Font = larry50
                                        larry818.TextSize = 14
                                        larry818.TextColor3 = larry42
                                        larry818.TextXAlignment = Enum.TextXAlignment.Left
                                        local larry826 = Instance.new("Frame", larry805)
                                        larry826.Size = UDim2.new(0, 60, 0, 26)
                                        larry826.Position = UDim2.new(1, - 70, 0.5, - 13)
                                        larry826.BackgroundColor3 = larry24
                                        local larry832 = Instance.new("UICorner", larry826)
                                        larry832.CornerRadius = UDim.new(0, 6)
                                        local larry836 = Instance.new("UIStroke", larry826)
                                        larry836.Color = larry34
                                        larry836.Transparency = 0.8
                                        local larry838 = Instance.new("TextBox", larry826)
                                        larry838.Size = UDim2.new(1, - 10, 1, 0)
                                        larry838.Position = UDim2.new(0, 5, 0, 0)
                                        larry838.BackgroundTransparency = 1
                                        larry838.Text = _803_vararg2.Default
                                        larry838.PlaceholderText = _803_vararg2.Placeholder
                                        larry838.TextColor3 = larry42
                                        larry838.Font = larry48
                                        larry838.TextSize = 14
                                        larry838.TextStrokeTransparency = 0.8
                                        larry838.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                        local _ = larry838.Text
                                        larry838.FocusLost:Connect(function(...)
                                            local _ = _803_vararg2.Callback
                                            _803_vararg2.Callback(larry838.Text)
                                        end)
                                        return {
                                            Value = larry838.Text,
                                            Class = "Input",
                                            Set = function(...)
                                                local _857_vararg1, _857_vararg2 = ...
                                                larry838.Text = _857_vararg2
                                            end,
                                        }
                                    end,
                                    Toggle = function(...)
                                        local _858_vararg1, _858_vararg2 = ...
                                        local larry860 = Instance.new("Frame", larry491)
                                        larry860.Size = UDim2.new(1, 0, 0, 38)
                                        larry860.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
                                        larry860.BackgroundTransparency = 0.5
                                        local larry866 = Instance.new("UICorner", larry860)
                                        larry866.CornerRadius = UDim.new(0, 8)
                                        local larry870 = Instance.new("UIStroke", larry860)
                                        larry870.Color = larry34
                                        larry870.Transparency = 0.9
                                        larry870.Thickness = 1
                                        local larry873 = Instance.new("TextLabel", larry860)
                                        larry873.Size = UDim2.new(1, - 10, 1, 0)
                                        larry873.Position = UDim2.new(0, 10, 0, 0)
                                        larry873.BackgroundTransparency = 1
                                        larry873.Text = _858_vararg2.Title
                                        larry873.Font = larry50
                                        larry873.TextSize = 14
                                        larry873.TextColor3 = larry42
                                        larry873.TextXAlignment = Enum.TextXAlignment.Left
                                        local larry881 = Instance.new("TextButton", larry860)
                                        larry881.Size = UDim2.fromScale(1, 1)
                                        larry881.BackgroundTransparency = 1
                                        larry881.Text = ""
                                        local larry885 = Instance.new("Frame", larry860)
                                        larry885.Size = UDim2.fromOffset(40, 20)
                                        larry885.Position = UDim2.new(1, - 50, 0.5, - 10)
                                        larry885.BackgroundColor3 = larry36
                                        larry885.BackgroundTransparency = 0.1
                                        local larry891 = Instance.new("UICorner", larry885)
                                        larry891.CornerRadius = UDim.new(1, 0)
                                        local larry895 = Instance.new("Frame", larry885)
                                        larry895.Size = UDim2.fromOffset(16, 16)
                                        larry895.Position = UDim2.new(0, 2, 0.5, - 8)
                                        larry895.BackgroundColor3 = larry42
                                        local larry901 = Instance.new("UICorner", larry895)
                                        larry901.CornerRadius = UDim.new(1, 0)
                                        local _ = _858_vararg2.Default
                                        local larry908 = larry6:Create(larry885, TweenInfo.new(0.2), {
                                            BackgroundTransparency = 0,
                                            BackgroundColor3 = larry40,
                                        })
                                        larry908:Play()
                                        local larry916 = larry6:Create(larry895, TweenInfo.new(0.2), {
                                            Position = UDim2.new(1, - 18, 0.5, - 8),
                                        })
                                        larry916:Play()
                                        larry881.MouseButton1Click:Connect(function(...)
                                            local larry926 = larry6:Create(larry885, TweenInfo.new(0.2), {
                                                BackgroundTransparency = 0.1,
                                                BackgroundColor3 = larry36,
                                            })
                                            larry926:Play()
                                            local larry934 = larry6:Create(larry895, TweenInfo.new(0.2), {
                                                Position = UDim2.new(0, 2, 0.5, - 8),
                                            })
                                            larry934:Play()
                                            local _ = _858_vararg2.Callback
                                            _858_vararg2.Callback(false)
                                        end)
                                        return {
                                            State = false,
                                            Set = function(...)
                                                local larry944 = larry6:Create(larry885, TweenInfo.new(0.2), {
                                                    BackgroundTransparency = 0,
                                                    BackgroundColor3 = larry40,
                                                })
                                                larry944:Play()
                                                local larry952 = larry6:Create(larry895, TweenInfo.new(0.2), {
                                                    Position = UDim2.new(1, - 18, 0.5, - 8),
                                                })
                                                larry952:Play()
                                                local _ = _858_vararg2.Callback
                                                _858_vararg2.Callback(true)
                                            end,
                                            Value = true,
                                            Class = "Toggle",
                                            UpdateState = function(...)
                                                local larry962 = larry6:Create(larry885, TweenInfo.new(0.2), {
                                                    BackgroundTransparency = 0,
                                                    BackgroundColor3 = larry40,
                                                })
                                                larry962:Play()
                                                local larry970 = larry6:Create(larry895, TweenInfo.new(0.2), {
                                                    Position = UDim2.new(1, - 18, 0.5, - 8),
                                                })
                                                larry970:Play()
                                                local _ = _858_vararg2.Callback
                                                _858_vararg2.Callback(true)
                                            end,
                                        }
                                    end,
                                    Slider = function(...)
                                        local _976_vararg1, _976_vararg2 = ...
                                        local larry978 = Instance.new("Frame", larry491)
                                        larry978.Size = UDim2.new(1, 0, 0, 50)
                                        larry978.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
                                        larry978.BackgroundTransparency = 0.5
                                        local larry984 = Instance.new("UICorner", larry978)
                                        larry984.CornerRadius = UDim.new(0, 8)
                                        local larry988 = Instance.new("UIStroke", larry978)
                                        larry988.Color = larry34
                                        larry988.Transparency = 0.9
                                        larry988.Thickness = 1
                                        local larry991 = Instance.new("TextLabel", larry978)
                                        larry991.Size = UDim2.new(1, - 10, 1, 0)
                                        larry991.Position = UDim2.new(0, 10, 0, 0)
                                        larry991.BackgroundTransparency = 1
                                        larry991.Text = _976_vararg2.Title
                                        larry991.Font = larry50
                                        larry991.TextSize = 14
                                        larry991.TextColor3 = larry42
                                        larry991.TextXAlignment = Enum.TextXAlignment.Left
                                        larry991.Size = UDim2.new(1, - 10, 0, 25)
                                        local larry1001 = Instance.new("TextLabel", larry978)
                                        larry1001.Size = UDim2.new(0, 50, 0, 25)
                                        larry1001.Position = UDim2.new(1, - 60, 0, 0)
                                        larry1001.BackgroundTransparency = 1
                                        larry1001.Text = _976_vararg2.Default
                                        larry1001.TextColor3 = larry40
                                        larry1001.Font = larry48
                                        larry1001.TextSize = 13
                                        larry1001.TextXAlignment = Enum.TextXAlignment.Right
                                        local larry1010 = Instance.new("Frame", larry978)
                                        larry1010.Size = UDim2.new(0.85, - 20, 0, 4)
                                        larry1010.Position = UDim2.new(0, 10, 0, 32)
                                        larry1010.BackgroundColor3 = larry36
                                        local larry1016 = Instance.new("UICorner", larry1010)
                                        larry1016.CornerRadius = UDim.new(1, 0)
                                        local larry1020 = Instance.new("Frame", larry1010)
                                        larry1020.Size = UDim2.new(0, 0, 1, 0)
                                        larry1020.BackgroundColor3 = larry40
                                        local larry1024 = Instance.new("UICorner", larry1020)
                                        larry1024.CornerRadius = UDim.new(1, 0)
                                        local larry1027 = _976_vararg2.Minimum
                                        local larry1028 = _976_vararg2.Maximum
                                        local larry1029 = _976_vararg2.Default
                                        larry1020.Size = UDim2.new(((larry1029 - larry1027) / (larry1028 - larry1027)), 0, 1, 0)
                                        larry1001.Text = larry1029
                                        local larry1036 = Instance.new("TextButton", larry1010)
                                        larry1036.Size = UDim2.fromScale(1, 1)
                                        larry1036.BackgroundTransparency = 1
                                        larry1036.Text = ""
                                        larry1036.InputBegan:Connect(function(...)
                                            local _1042_vararg1 = ...
                                            local _ = _1042_vararg1.UserInputType == Enum.UserInputType.MouseButton1
                                        end)
                                        larry15.InputEnded:Connect(function(...)
                                            local _1050_vararg1 = ...
                                            local _ = _1050_vararg1.UserInputType == Enum.UserInputType.MouseButton1
                                        end)
                                        larry15.InputChanged:Connect(function(...)
                                        end)
                                        return {
                                            Value = larry1029,
                                            Class = "Slider",
                                            Set = function(...)
                                                local _1059_vararg1, _1059_vararg2 = ...
                                                local larry1060, _1060_2, _1060_3 = math.clamp(_1059_vararg2, larry1027, larry1028)
                                                local larry1069 = larry6:Create(larry1020, TweenInfo.new(0.2), {
                                                    Size = UDim2.new(((larry1060 - larry1027) / (larry1028 - larry1027)), 0, 1, 0),
                                                })
                                                larry1069:Play()
                                                larry1001.Text = larry1060
                                                local _ = _976_vararg2.Callback
                                                _976_vararg2.Callback(larry1060)
                                            end,
                                        }
                                    end,
                                }
                            end,
                        }
                    end,
                }
            end,
            Settings = _59_vararg2,
            Notify = function(...)
                local _1075_vararg1, _1075_vararg2 = ...
                local larry1077 = Instance.new("Frame")
                larry1077.Size = UDim2.new(1, 0, 0, 70)
                larry1077.BackgroundTransparency = 1
                larry1077.Parent = larry69
                local larry1081 = Instance.new("Frame", larry1077)
                larry1081.Size = UDim2.new(1, 0, 1, 0)
                larry1081.Position = UDim2.new(1, 40, 0, 0)
                larry1081.BackgroundTransparency = 1
                larry1081.BackgroundColor3 = larry24
                larry1081.BorderSizePixel = 0
                local larry1087 = Instance.new("UICorner", larry1081)
                larry1087.CornerRadius = UDim.new(0, 12)
                local larry1091 = Instance.new("UIGradient", larry1081)
                larry1091.Rotation = 35
                local larry1099 = ColorSequence.new({
                    [1] = ColorSequenceKeypoint.new(0, larry26),
                    [2] = ColorSequenceKeypoint.new(0.55, larry28),
                    [3] = ColorSequenceKeypoint.new(1, larry30),
                })
                larry1091.Color = larry1099
                local larry1101 = Instance.new("UIStroke", larry1081)
                larry1101.Thickness = 3
                larry1101.Transparency = 0.8
                larry1101.Color = larry32
                larry1101.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                local larry1105 = Instance.new("UIStroke", larry1081)
                larry1105.Thickness = 1
                larry1105.Transparency = 0.5
                larry1105.Color = larry34
                larry1105.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                local larry1109 = Instance.new("TextLabel", larry1081)
                larry1109.Position = UDim2.new(0, 12, 0, 8)
                larry1109.Size = UDim2.new(1, - 24, 0, 20)
                larry1109.BackgroundTransparency = 1
                larry1109.Font = larry48
                larry1109.Text = _1075_vararg2.Title
                larry1109.TextColor3 = larry40
                larry1109.TextSize = 14
                larry1109.TextXAlignment = Enum.TextXAlignment.Left
                local larry1118 = Instance.new("TextLabel", larry1081)
                larry1118.Position = UDim2.new(0, 12, 0, 30)
                larry1118.Size = UDim2.new(1, - 24, 0, 32)
                larry1118.BackgroundTransparency = 1
                larry1118.Font = larry52
                larry1118.Text = _1075_vararg2.Desc
                larry1118.TextColor3 = larry42
                larry1118.TextSize = 13
                larry1118.TextWrapped = true
                larry1118.TextXAlignment = Enum.TextXAlignment.Left
                larry1118.TextYAlignment = Enum.TextYAlignment.Top
                local larry1137 = larry6:Create(larry1081, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 0,
                    Position = UDim2.new(0, 0, 0, 0),
                })
                larry1137:Play()
                task.delay(_1075_vararg2.Duration, function(...)
                    local larry1153 = larry6:Create(larry1081, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, 40, 0, 0),
                    })
                    larry1153:Play()
                    task.wait(0.36)
                    larry1077:Destroy()
                end)
            end,
            Toggle = function(...)
                local larry1168 = larry6:Create(larry102, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    Size = UDim2.new(0, 0, 0, 0),
                })
                larry1168:Play()
                task.delay(0.26, function(...)
                    larry102.Visible = false
                end)
            end,
            onUnloaded = function(...)
            end,
            Show = function(...)
                larry102.Visible = true
                local larry1183 = larry6:Create(larry102, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Size = larry100,
                })
                larry1183:Play()
            end,
            Settings = _59_vararg2,
            Unload = function(...)
                _1174_vararg1()
                larry61:Destroy()
            end,
            Toggle = function(...)
                local larry1200 = larry6:Create(larry102, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    Size = UDim2.new(0, 0, 0, 0),
                })
                larry1200:Play()
                task.delay(0.26, function(...)
                    larry102.Visible = false
                end)
            end,
            onUnloadCallback = _1174_vararg1,
            Hide = function(...)
            end,
        }
    end,
    GetService = function(...)
        local _1207_vararg1 = ...
        return cloneref(game:GetService(_1207_vararg1))
    end,
    Folder = "ChilliLib",
    SetFolder = function(...)
        local _1211_vararg1, _1211_vararg2 = ...
        makefolder(_1211_vararg2)
        local _ = _1211_vararg2 .. "/settings"
        makefolder(_1211_vararg2 .. "/settings")
    end,
    RefreshConfigList = function(...)
        for larry1219, _1219_2 in pairs(listfiles(_1211_vararg2 .. "/settings")) do
            _1219_2:sub(- 5)
        end
        return {}
    end,
    Demo = function(...)
        local larry1224 = UDim2.fromOffset(650, 400)
        local larry1226 = Instance.new("ScreenGui")
        larry1226.Name = "ChilliLibUI"
        larry1226.ScreenInsets = Enum.ScreenInsets.None
        larry1226.ResetOnSpawn = false
        larry1226.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        larry1226.DisplayOrder = 10000
        local _ = larry9.IsStudio
        larry1226.Parent = gethui()
        local larry1234 = Instance.new("Frame")
        larry1234.Name = "Notifications"
        larry1234.BackgroundTransparency = 1
        larry1234.Size = UDim2.new(0, 300, 1, - 20)
        larry1234.Position = UDim2.new(1, - 320, 0, 10)
        larry1234.AnchorPoint = Vector2.new(0, 0)
        larry1234.Parent = larry1226
        larry1234.ZIndex = 100
        local larry1242 = Instance.new("UIListLayout")
        larry1242.Padding = UDim.new(0, 10)
        larry1242.HorizontalAlignment = Enum.HorizontalAlignment.Center
        larry1242.SortOrder = Enum.SortOrder.LayoutOrder
        larry1242.VerticalAlignment = Enum.VerticalAlignment.Bottom
        larry1242.Parent = larry1234
        local _ = larry1224.X.Scale
        local _ = larry1224.Y.Scale
        local larry1264 = UDim2.new(larry1224.X.Scale, larry1224.X.Offset, larry1224.Y.Scale, larry1224.Y.Offset)
        local larry1266 = Instance.new("Frame")
        larry1266.Name = "MainBase"
        larry1266.AnchorPoint = Vector2.new(0.5, 0.5)
        larry1266.Position = UDim2.fromScale(0.5, 0.5)
        larry1266.Size = larry1264
        larry1266.Parent = larry1226
        larry1266.ClipsDescendants = false
        larry1266.BackgroundColor3 = larry24
        larry1266.BorderSizePixel = 0
        local larry1272 = Instance.new("UICorner", larry1266)
        larry1272.CornerRadius = UDim.new(0, 20)
        local larry1276 = Instance.new("UIGradient", larry1266)
        larry1276.Rotation = 35
        local larry1284 = ColorSequence.new({
            [1] = ColorSequenceKeypoint.new(0, larry26),
            [2] = ColorSequenceKeypoint.new(0.55, larry28),
            [3] = ColorSequenceKeypoint.new(1, larry30),
        })
        larry1276.Color = larry1284
        local larry1286 = Instance.new("UIStroke", larry1266)
        larry1286.Thickness = 3
        larry1286.Transparency = 0.8
        larry1286.Color = larry32
        larry1286.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local larry1290 = Instance.new("UIStroke", larry1266)
        larry1290.Thickness = 1
        larry1290.Transparency = 0.5
        larry1290.Color = larry34
        larry1290.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        larry1266.InputBegan:Connect(function(...)
            local _1296_vararg1 = ...
            local _ = _1296_vararg1.UserInputType == Enum.UserInputType.MouseButton1
            local _ = _1296_vararg1.UserInputType == Enum.UserInputType.Touch
        end)
        larry1266.InputChanged:Connect(function(...)
            local _1308_vararg1 = ...
            local _ = _1308_vararg1.UserInputType == Enum.UserInputType.MouseMovement
            local _ = _1308_vararg1.UserInputType == Enum.UserInputType.Touch
        end)
        larry15.InputChanged:Connect(function(...)
        end)
        larry1266.Size = UDim2.new(0, 0, 0, 0)
        larry1266.Visible = true
        local larry1330 = larry6:Create(larry1266, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = larry1264,
        })
        larry1330:Play()
        local larry1334 = Instance.new("Frame")
        larry1334.Name = "TopBar"
        larry1334.Parent = larry1266
        larry1334.BackgroundColor3 = larry38
        larry1334.BackgroundTransparency = 0.3
        larry1334.BorderSizePixel = 0
        larry1334.Size = UDim2.new(1, - 14, 0, 32)
        larry1334.Position = UDim2.new(0, 7, 0, 7)
        local larry1340 = Instance.new("UICorner", larry1334)
        larry1340.CornerRadius = UDim.new(0, 12)
        local larry1344 = Instance.new("TextLabel")
        larry1344.Parent = larry1334
        larry1344.BackgroundTransparency = 1
        larry1344.Position = UDim2.new(0, 16, 0, 0)
        larry1344.Size = UDim2.new(1, - 80, 1, 0)
        larry1344.Font = larry48
        larry1344.Text = "Chilli Interface"
        larry1344.TextXAlignment = Enum.TextXAlignment.Left
        larry1344.TextSize = 18
        larry1344.TextColor3 = larry42
        local larry1352 = Instance.new("UIGradient", larry1344)
        local larry1366 = ColorSequence.new({
            [1] = ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 211, 238)),
            [2] = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
            [3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(99, 102, 241)),
        })
        larry1352.Color = larry1366
        local larry1368 = Instance.new("TextButton", larry1334)
        larry1368.Size = UDim2.fromOffset(24, 24)
        larry1368.Position = UDim2.new(1, - 30, 0.5, - 12)
        larry1368.BackgroundColor3 = larry36
        larry1368.Text = "X"
        larry1368.Font = larry48
        larry1368.TextSize = 14
        larry1368.TextColor3 = larry46
        larry1368.AutoButtonColor = true
        local larry1374 = Instance.new("UICorner", larry1368)
        larry1374.CornerRadius = UDim.new(0, 8)
        local larry1378 = Instance.new("UIStroke", larry1368)
        larry1378.Color = larry34
        larry1378.Transparency = 0.7
        larry1378.Thickness = 1
        larry1368.MouseButton1Click:Connect(function(...)
            local larry1392 = larry6:Create(larry1266, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
            })
            larry1392:Play()
            task.delay(0.26, function(...)
                larry1266.Visible = false
            end)
        end)
        larry15.InputBegan:Connect(function(...)
        end)
        local larry1403 = Instance.new("Frame", larry1266)
        larry1403.BackgroundTransparency = 1
        larry1403.Position = UDim2.new(0, 10, 0, 45)
        larry1403.Size = UDim2.new(1, - 20, 1, - 50)
        local larry1409 = Instance.new("ScrollingFrame", larry1403)
        larry1409.Size = UDim2.new(0, 105, 1, 0)
        larry1409.BackgroundTransparency = 1
        larry1409.ScrollBarThickness = 2
        larry1409.BorderSizePixel = 0
        larry1409.CanvasSize = UDim2.new(0, 0, 0, 0)
        larry1409.AutomaticCanvasSize = Enum.AutomaticSize.Y
        local larry1417 = Instance.new("UIListLayout", larry1409)
        larry1417.Padding = UDim.new(0, 6)
        larry1417.SortOrder = Enum.SortOrder.LayoutOrder
        local larry1423 = Instance.new("Frame", larry1403)
        larry1423.Size = UDim2.new(0, 1, 1, 0)
        larry1423.Position = UDim2.new(0, 115, 0, 0)
        larry1423.BackgroundColor3 = larry34
        larry1423.BackgroundTransparency = 0.8
        larry1423.BorderSizePixel = 0
        local larry1429 = Instance.new("Frame", larry1403)
        larry1429.Size = UDim2.new(1, - 125, 1, 0)
        larry1429.Position = UDim2.new(0, 125, 0, 0)
        larry1429.BackgroundTransparency = 1
        larry1429.ClipsDescendants = true
        local larry1435 = Instance.new("TextButton", larry1409)
        larry1435.Size = UDim2.new(1, - 4, 0, 32)
        larry1435.BackgroundColor3 = larry36
        larry1435.BackgroundTransparency = 1
        larry1435.Text = ""
        larry1435.AutoButtonColor = false
        local larry1439 = Instance.new("UICorner", larry1435)
        larry1439.CornerRadius = UDim.new(0, 10)
        local larry1443 = Instance.new("UIStroke", larry1435)
        larry1443.Transparency = 1
        larry1443.Color = larry40
        larry1443.Thickness = 1
        local larry1445 = Instance.new("Frame", larry1435)
        larry1445.Size = UDim2.new(0, 3, 1, - 6)
        larry1445.Position = UDim2.new(0, 1, 0, 3)
        larry1445.BackgroundColor3 = larry40
        larry1445.BorderSizePixel = 0
        larry1445.BackgroundTransparency = 1
        local larry1451 = Instance.new("UIGradient", larry1435)
        larry1451.Rotation = 35
        local larry1459 = ColorSequence.new({
            [1] = ColorSequenceKeypoint.new(0, larry26),
            [2] = ColorSequenceKeypoint.new(0.55, larry28),
            [3] = ColorSequenceKeypoint.new(1, larry30),
        })
        larry1451.Color = larry1459
        larry1451.Enabled = false
        local larry1461 = Instance.new("ImageLabel", larry1435)
        larry1461.Size = UDim2.fromOffset(18, 18)
        larry1461.Position = UDim2.new(0, 8, 0.5, - 9)
        larry1461.BackgroundTransparency = 1
        larry1461.ImageColor3 = larry44
        local _ = larry321.Icons
        local _ = larry321.Icons["rbxassetid://10709791437"]
        local larry1470 = larry321.Icons["rbxassetid://10709791437"]
        larry1461.Image = larry321.Spritesheets[larry1470.Image]
        larry1461.ImageRectOffset = larry1470.ImageRectPosition
        larry1461.ImageRectSize = larry1470.ImageRectSize
        local larry1477 = Instance.new("TextLabel", larry1435)
        larry1477.BackgroundTransparency = 1
        larry1477.Position = UDim2.new(0, 30, 0, 0)
        larry1477.Size = UDim2.new(1, - 32, 1, 0)
        larry1477.Font = larry48
        larry1477.Text = "Main"
        larry1477.TextSize = 15
        larry1477.TextColor3 = larry44
        larry1477.TextXAlignment = Enum.TextXAlignment.Left
        local larry1485 = Instance.new("ScrollingFrame", larry1429)
        larry1485.Size = UDim2.fromScale(1, 1)
        larry1485.BackgroundTransparency = 1
        larry1485.Visible = false
        larry1485.ScrollBarThickness = 2
        larry1485.ScrollBarImageColor3 = larry40
        larry1485.BorderSizePixel = 0
        larry1485.CanvasSize = UDim2.new(0, 0, 0, 0)
        larry1485.AutomaticCanvasSize = Enum.AutomaticSize.Y
        local larry1493 = Instance.new("UIListLayout", larry1485)
        larry1493.Padding = UDim.new(0, 12)
        larry1493.SortOrder = Enum.SortOrder.LayoutOrder
        local larry1499 = Instance.new("UIPadding", larry1485)
        larry1499.PaddingLeft = UDim.new(0, 4)
        larry1499.PaddingRight = UDim.new(0, 4)
        larry1499.PaddingTop = UDim.new(0, 4)
        larry1499.PaddingBottom = UDim.new(0, 10)
        larry1435.MouseButton1Click:Connect(function(...)
            larry1485.Visible = true
            larry1485.Position = UDim2.new(0, 10, 0, 0)
            local larry1521 = larry6:Create(larry1485, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 0),
            })
            larry1521:Play()
            local larry1527 = larry6:Create(larry1435, TweenInfo.new(0.2), {
                BackgroundTransparency = 0,
            })
            larry1527:Play()
            local larry1533 = larry6:Create(larry1443, TweenInfo.new(0.2), {
                Transparency = 0.4,
            })
            larry1533:Play()
            local larry1539 = larry6:Create(larry1477, TweenInfo.new(0.2), {
                TextColor3 = larry42,
            })
            larry1539:Play()
            local larry1545 = larry6:Create(larry1461, TweenInfo.new(0.2), {
                ImageColor3 = larry40,
            })
            larry1545:Play()
            larry1451.Enabled = true
            local larry1551 = larry6:Create(larry1445, TweenInfo.new(0.2), {
                BackgroundTransparency = 0,
            })
            larry1551:Play()
        end)
        local larry1555 = Instance.new("Frame", larry1485)
        larry1555.Size = UDim2.new(1, - 2, 0, 0)
        larry1555.AutomaticSize = Enum.AutomaticSize.Y
        larry1555.BackgroundTransparency = 0
        larry1555.ClipsDescendants = true
        larry1555.BackgroundColor3 = larry24
        larry1555.BorderSizePixel = 0
        local larry1561 = Instance.new("UICorner", larry1555)
        larry1561.CornerRadius = UDim.new(0, 12)
        local larry1565 = Instance.new("UIGradient", larry1555)
        larry1565.Rotation = 35
        local larry1573 = ColorSequence.new({
            [1] = ColorSequenceKeypoint.new(0, larry26),
            [2] = ColorSequenceKeypoint.new(0.55, larry28),
            [3] = ColorSequenceKeypoint.new(1, larry30),
        })
        larry1565.Color = larry1573
        local larry1575 = Instance.new("UIStroke", larry1555)
        larry1575.Thickness = 3
        larry1575.Transparency = 0.8
        larry1575.Color = larry32
        larry1575.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local larry1579 = Instance.new("UIStroke", larry1555)
        larry1579.Thickness = 1
        larry1579.Transparency = 0.5
        larry1579.Color = larry34
        larry1579.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local larry1583 = Instance.new("UIPadding", larry1555)
        larry1583.PaddingTop = UDim.new(0, 4)
        larry1583.PaddingBottom = UDim.new(0, 4)
        larry1583.PaddingLeft = UDim.new(0, 2)
        larry1583.PaddingRight = UDim.new(0, 2)
        local larry1593 = Instance.new("TextButton", larry1555)
        larry1593.Size = UDim2.new(1, - 16, 0, 24)
        larry1593.Position = UDim2.new(0, 8, 0, 4)
        larry1593.BackgroundTransparency = 1
        larry1593.Text = ""
        local larry1599 = Instance.new("TextLabel", larry1593)
        larry1599.Text = "Features"
        larry1599.Font = larry48
        larry1599.TextSize = 16
        larry1599.TextColor3 = Color3.fromRGB(255, 255, 255)
        larry1599.Size = UDim2.new(1, - 20, 1, 0)
        larry1599.BackgroundTransparency = 1
        larry1599.TextXAlignment = Enum.TextXAlignment.Left
        local larry1607 = Instance.new("UIGradient", larry1599)
        local larry1621 = ColorSequence.new({
            [1] = ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 211, 238)),
            [2] = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
            [3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
        })
        larry1607.Color = larry1621
        local larry1623 = Instance.new("TextLabel", larry1593)
        larry1623.Text = "\xE2\x96\xBC"
        larry1623.TextColor3 = larry40
        larry1623.BackgroundTransparency = 1
        larry1623.Size = UDim2.new(0, 20, 1, 0)
        larry1623.Position = UDim2.new(1, - 20, 0, 0)
        larry1623.TextSize = 12
        local larry1629 = Instance.new("Frame", larry1555)
        larry1629.Name = "ContentHolder"
        larry1629.BackgroundTransparency = 1
        larry1629.Position = UDim2.new(0, 8, 0, 32)
        larry1629.Size = UDim2.new(1, - 16, 0, 0)
        larry1629.AutomaticSize = Enum.AutomaticSize.Y
        local larry1637 = Instance.new("UIListLayout", larry1629)
        larry1637.Padding = UDim.new(0, 8)
        larry1637.SortOrder = Enum.SortOrder.LayoutOrder
        larry1637.HorizontalAlignment = Enum.HorizontalAlignment.Center
        local larry1645 = Instance.new("UIPadding", larry1629)
        larry1645.PaddingBottom = UDim.new(0, 6)
        larry1593.MouseButton1Click:Connect(function(...)
            local larry1655 = larry6:Create(larry1623, TweenInfo.new(0.2), {
                Rotation = - 90,
            })
            larry1655:Play()
            local larry1661 = larry6:Create(larry1629, TweenInfo.new(0.2), {
                BackgroundTransparency = 1,
            })
            larry1661:Play()
            larry1629.Visible = false
        end)
        local larry1665 = Instance.new("Frame", larry1629)
        larry1665.Size = UDim2.new(1, 0, 0, 38)
        larry1665.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
        larry1665.BackgroundTransparency = 0.5
        local larry1671 = Instance.new("UICorner", larry1665)
        larry1671.CornerRadius = UDim.new(0, 8)
        local larry1675 = Instance.new("UIStroke", larry1665)
        larry1675.Color = larry34
        larry1675.Transparency = 0.9
        larry1675.Thickness = 1
        local larry1677 = Instance.new("TextLabel", larry1665)
        larry1677.Size = UDim2.new(1, - 10, 1, 0)
        larry1677.Position = UDim2.new(0, 10, 0, 0)
        larry1677.BackgroundTransparency = 1
        larry1677.Text = "Auto Farm"
        larry1677.Font = larry50
        larry1677.TextSize = 14
        larry1677.TextColor3 = larry42
        larry1677.TextXAlignment = Enum.TextXAlignment.Left
        local larry1685 = Instance.new("TextButton", larry1665)
        larry1685.Size = UDim2.fromScale(1, 1)
        larry1685.BackgroundTransparency = 1
        larry1685.Text = ""
        local larry1689 = Instance.new("Frame", larry1665)
        larry1689.Size = UDim2.fromOffset(40, 20)
        larry1689.Position = UDim2.new(1, - 50, 0.5, - 10)
        larry1689.BackgroundColor3 = larry36
        larry1689.BackgroundTransparency = 0.1
        local larry1695 = Instance.new("UICorner", larry1689)
        larry1695.CornerRadius = UDim.new(1, 0)
        local larry1699 = Instance.new("Frame", larry1689)
        larry1699.Size = UDim2.fromOffset(16, 16)
        larry1699.Position = UDim2.new(0, 2, 0.5, - 8)
        larry1699.BackgroundColor3 = larry42
        local larry1705 = Instance.new("UICorner", larry1699)
        larry1705.CornerRadius = UDim.new(1, 0)
        local larry1711 = larry6:Create(larry1689, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.1,
            BackgroundColor3 = larry36,
        })
        larry1711:Play()
        local larry1719 = larry6:Create(larry1699, TweenInfo.new(0.2), {
            Position = UDim2.new(0, 2, 0.5, - 8),
        })
        larry1719:Play()
        larry1685.MouseButton1Click:Connect(function(...)
            local larry1729 = larry6:Create(larry1689, TweenInfo.new(0.2), {
                BackgroundTransparency = 0,
                BackgroundColor3 = larry40,
            })
            larry1729:Play()
            local larry1737 = larry6:Create(larry1699, TweenInfo.new(0.2), {
                Position = UDim2.new(1, - 18, 0.5, - 8),
            })
            larry1737:Play()
            print("Farm:", true)
        end)
        local larry1742 = Instance.new("Frame", larry1629)
        larry1742.Size = UDim2.new(1, 0, 0, 50)
        larry1742.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
        larry1742.BackgroundTransparency = 0.5
        local larry1748 = Instance.new("UICorner", larry1742)
        larry1748.CornerRadius = UDim.new(0, 8)
        local larry1752 = Instance.new("UIStroke", larry1742)
        larry1752.Color = larry34
        larry1752.Transparency = 0.9
        larry1752.Thickness = 1
        local larry1754 = Instance.new("TextLabel", larry1742)
        larry1754.Size = UDim2.new(1, - 10, 1, 0)
        larry1754.Position = UDim2.new(0, 10, 0, 0)
        larry1754.BackgroundTransparency = 1
        larry1754.Text = "WalkSpeed"
        larry1754.Font = larry50
        larry1754.TextSize = 14
        larry1754.TextColor3 = larry42
        larry1754.TextXAlignment = Enum.TextXAlignment.Left
        larry1754.Size = UDim2.new(1, - 10, 0, 25)
        local larry1764 = Instance.new("TextLabel", larry1742)
        larry1764.Size = UDim2.new(0, 50, 0, 25)
        larry1764.Position = UDim2.new(1, - 60, 0, 0)
        larry1764.BackgroundTransparency = 1
        larry1764.Text = "16"
        larry1764.TextColor3 = larry40
        larry1764.Font = larry48
        larry1764.TextSize = 13
        larry1764.TextXAlignment = Enum.TextXAlignment.Right
        local larry1772 = Instance.new("Frame", larry1742)
        larry1772.Size = UDim2.new(0.85, - 20, 0, 4)
        larry1772.Position = UDim2.new(0, 10, 0, 32)
        larry1772.BackgroundColor3 = larry36
        local larry1778 = Instance.new("UICorner", larry1772)
        larry1778.CornerRadius = UDim.new(1, 0)
        local larry1782 = Instance.new("Frame", larry1772)
        larry1782.Size = UDim2.new(0, 0, 1, 0)
        larry1782.BackgroundColor3 = larry40
        local larry1786 = Instance.new("UICorner", larry1782)
        larry1786.CornerRadius = UDim.new(1, 0)
        larry1782.Size = UDim2.new(0, 0, 1, 0)
        larry1764.Text = "16"
        local larry1792 = Instance.new("TextButton", larry1772)
        larry1792.Size = UDim2.fromScale(1, 1)
        larry1792.BackgroundTransparency = 1
        larry1792.Text = ""
        larry1792.InputBegan:Connect(function(...)
            local _1798_vararg1 = ...
            local _ = _1798_vararg1.UserInputType == Enum.UserInputType.MouseButton1
        end)
        larry15.InputEnded:Connect(function(...)
            local _1806_vararg1 = ...
            local _ = _1806_vararg1.UserInputType == Enum.UserInputType.MouseButton1
        end)
        larry15.InputChanged:Connect(function(...)
        end)
        local larry1816 = Instance.new("Frame", larry1629)
        larry1816.Size = UDim2.new(1, 0, 0, 44)
        larry1816.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
        larry1816.BackgroundTransparency = 0.5
        local larry1822 = Instance.new("UICorner", larry1816)
        larry1822.CornerRadius = UDim.new(0, 8)
        local larry1826 = Instance.new("UIStroke", larry1816)
        larry1826.Color = larry34
        larry1826.Transparency = 0.9
        larry1826.Thickness = 1
        larry1816.ClipsDescendants = true
        local larry1828 = Instance.new("TextLabel", larry1816)
        larry1828.Size = UDim2.new(1, - 10, 0, 20)
        larry1828.Position = UDim2.new(0, 10, 0, 4)
        larry1828.BackgroundTransparency = 1
        larry1828.Text = "Target Mode"
        larry1828.Font = larry50
        larry1828.TextSize = 14
        larry1828.TextColor3 = larry42
        larry1828.TextXAlignment = Enum.TextXAlignment.Left
        local larry1836 = Instance.new("TextLabel", larry1816)
        larry1836.Size = UDim2.new(0, 110, 0, 20)
        larry1836.Position = UDim2.new(1, - 140, 0, 4)
        larry1836.Text = "Nearest"
        larry1836.Font = larry48
        larry1836.TextColor3 = larry42
        larry1836.TextXAlignment = Enum.TextXAlignment.Right
        larry1836.BackgroundTransparency = 1
        larry1836.TextSize = 13
        local larry1844 = Instance.new("TextLabel", larry1816)
        larry1844.Text = "\xE2\x96\xBC"
        larry1844.Size = UDim2.new(0, 20, 0, 20)
        larry1844.Position = UDim2.new(1, - 26, 0, 4)
        larry1844.BackgroundTransparency = 1
        larry1844.TextColor3 = larry44
        larry1844.TextSize = 12
        local larry1850 = Instance.new("TextButton", larry1816)
        larry1850.Size = UDim2.new(1, 0, 1, 0)
        larry1850.BackgroundTransparency = 1
        larry1850.Text = ""
        local larry1854 = Instance.new("Frame", larry1816)
        larry1854.Size = UDim2.new(1, - 10, 0, 0)
        larry1854.Position = UDim2.new(0, 5, 0, 26)
        larry1854.BackgroundTransparency = 1
        larry1854.Visible = false
        local larry1860 = Instance.new("UIListLayout", larry1854)
        larry1860.Padding = UDim.new(0, 4)
        for larry1865, _1865_2 in pairs(larry1854:GetChildren()) do
            _1865_2:IsA("TextButton")
            _1865_2:Destroy()
        end
        local larry1871 = Instance.new("TextButton", larry1854)
        larry1871.Size = UDim2.new(1, 0, 0, 26)
        larry1871.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
        larry1871.Text = "Nearest"
        larry1871.Font = larry52
        larry1871.TextColor3 = larry42
        larry1871.TextSize = 13
        local larry1877 = Instance.new("UICorner", larry1871)
        larry1877.CornerRadius = UDim.new(0, 6)
        local larry1881 = Instance.new("UIStroke", larry1871)
        larry1881.Color = larry34
        larry1881.Transparency = 0.7
        larry1881.Thickness = 1
        larry1871.MouseButton1Click:Connect(function(...)
            larry1836.Text = "Nearest"
            larry1836.TextColor3 = larry42
            print("Mode:", "Nearest")
            larry1854.Visible = false
            local larry1894 = larry6:Create(larry1816, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                Size = UDim2.new(1, 0, 0, 44),
            })
            larry1894:Play()
            local larry1900 = larry6:Create(larry1844, TweenInfo.new(0.25), {
                Rotation = 0,
            })
            larry1900:Play()
        end)
        local larry1904 = Instance.new("TextButton", larry1854)
        larry1904.Size = UDim2.new(1, 0, 0, 26)
        larry1904.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
        larry1904.Text = "Random"
        larry1904.Font = larry52
        larry1904.TextColor3 = larry42
        larry1904.TextSize = 13
        local larry1910 = Instance.new("UICorner", larry1904)
        larry1910.CornerRadius = UDim.new(0, 6)
        local larry1914 = Instance.new("UIStroke", larry1904)
        larry1914.Color = larry34
        larry1914.Transparency = 0.7
        larry1914.Thickness = 1
        larry1904.MouseButton1Click:Connect(function(...)
            larry1836.Text = "Random"
            larry1836.TextColor3 = larry42
            print("Mode:", "Random")
            larry1854.Visible = false
            local larry1927 = larry6:Create(larry1816, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                Size = UDim2.new(1, 0, 0, 44),
            })
            larry1927:Play()
            local larry1933 = larry6:Create(larry1844, TweenInfo.new(0.25), {
                Rotation = 0,
            })
            larry1933:Play()
        end)
        larry1854.Size = UDim2.new(1, - 10, 0, 60)
        larry1850.MouseButton1Click:Connect(function(...)
            larry1854.Visible = true
            local larry1954 = larry6:Create(larry1816, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                Size = UDim2.new(1, 0, 0, ((44 + larry1854.Size.Y.Offset) + 4)),
            })
            larry1954:Play()
            local larry1960 = larry6:Create(larry1844, TweenInfo.new(0.25), {
                Rotation = 180,
            })
            larry1960:Play()
        end)
        local larry1964 = Instance.new("Frame", larry1629)
        larry1964.Size = UDim2.new(1, 0, 0, 38)
        larry1964.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
        larry1964.BackgroundTransparency = 0.5
        local larry1970 = Instance.new("UICorner", larry1964)
        larry1970.CornerRadius = UDim.new(0, 8)
        local larry1974 = Instance.new("UIStroke", larry1964)
        larry1974.Color = larry34
        larry1974.Transparency = 0.9
        larry1974.Thickness = 1
        local larry1976 = Instance.new("TextLabel", larry1964)
        larry1976.Size = UDim2.new(1, - 10, 1, 0)
        larry1976.Position = UDim2.new(0, 10, 0, 0)
        larry1976.BackgroundTransparency = 1
        larry1976.Text = "Webhook URL"
        larry1976.Font = larry50
        larry1976.TextSize = 14
        larry1976.TextColor3 = larry42
        larry1976.TextXAlignment = Enum.TextXAlignment.Left
        local larry1984 = Instance.new("Frame", larry1964)
        larry1984.Size = UDim2.new(0, 60, 0, 26)
        larry1984.Position = UDim2.new(1, - 70, 0.5, - 13)
        larry1984.BackgroundColor3 = larry24
        local larry1990 = Instance.new("UICorner", larry1984)
        larry1990.CornerRadius = UDim.new(0, 6)
        local larry1994 = Instance.new("UIStroke", larry1984)
        larry1994.Color = larry34
        larry1994.Transparency = 0.8
        local larry1996 = Instance.new("TextBox", larry1984)
        larry1996.Size = UDim2.new(1, - 10, 1, 0)
        larry1996.Position = UDim2.new(0, 5, 0, 0)
        larry1996.BackgroundTransparency = 1
        larry1996.Text = ""
        larry1996.PlaceholderText = "..."
        larry1996.TextColor3 = larry42
        larry1996.Font = larry48
        larry1996.TextSize = 14
        larry1996.TextStrokeTransparency = 0.8
        larry1996.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        local _ = larry1996.Text
        larry1996.FocusLost:Connect(function(...)
            print("Webhook:", larry1996.Text)
        end)
        local larry2012 = Instance.new("Frame", larry1629)
        larry2012.Size = UDim2.new(1, 0, 0, 44)
        larry2012.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
        larry2012.BackgroundTransparency = 0.5
        local larry2018 = Instance.new("UICorner", larry2012)
        larry2018.CornerRadius = UDim.new(0, 8)
        local larry2022 = Instance.new("UIStroke", larry2012)
        larry2022.Color = larry34
        larry2022.Transparency = 0.9
        larry2022.Thickness = 1
        larry2012.BackgroundTransparency = 0.25
        local larry2024 = larry2012:FindFirstChildOfClass("UIStroke")
        larry2024.Transparency = 0.5
        larry2024.Thickness = 1
        local larry2026 = Instance.new("TextLabel", larry2012)
        larry2026.Size = UDim2.new(1, - 10, 1, 0)
        larry2026.Position = UDim2.new(0, 10, 0, 0)
        larry2026.BackgroundTransparency = 1
        larry2026.Text = "Info"
        larry2026.Font = larry50
        larry2026.TextSize = 14
        larry2026.TextColor3 = larry42
        larry2026.TextXAlignment = Enum.TextXAlignment.Left
        larry2026.Font = larry48
        larry2026.TextSize = 14
        local larry2034 = Instance.new("TextLabel", larry2012)
        larry2034.Size = UDim2.new(1, - 20, 1, - 22)
        larry2034.Position = UDim2.new(0, 10, 0, 20)
        larry2034.BackgroundTransparency = 1
        larry2034.Text = "This is a sample paragraph with Chilli Finder styling."
        larry2034.TextColor3 = larry42
        larry2034.TextSize = 13
        larry2034.TextWrapped = true
        larry2034.TextXAlignment = Enum.TextXAlignment.Left
        larry2034.TextYAlignment = Enum.TextYAlignment.Top
        larry2034.Font = larry50
        local larry2044 = Instance.new("Frame", larry1629)
        larry2044.Size = UDim2.new(1, 0, 0, 36)
        larry2044.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
        larry2044.BackgroundTransparency = 0.5
        local larry2050 = Instance.new("UICorner", larry2044)
        larry2050.CornerRadius = UDim.new(0, 8)
        local larry2054 = Instance.new("UIStroke", larry2044)
        larry2054.Color = larry34
        larry2054.Transparency = 0.9
        larry2054.Thickness = 1
        larry2044.BackgroundColor3 = larry40
        larry2044.BackgroundTransparency = 0.9
        local larry2056 = Instance.new("TextButton", larry2044)
        larry2056.Size = UDim2.fromScale(1, 1)
        larry2056.BackgroundTransparency = 1
        larry2056.Text = "Server Hop"
        larry2056.Font = larry48
        larry2056.TextColor3 = larry40
        larry2056.TextSize = 14
        larry2056.MouseButton1Click:Connect(function(...)
            local larry2064 = Instance.new("Frame")
            larry2064.Size = UDim2.new(1, 0, 0, 70)
            larry2064.BackgroundTransparency = 1
            larry2064.Parent = larry1234
            local larry2068 = Instance.new("Frame", larry2064)
            larry2068.Size = UDim2.new(1, 0, 1, 0)
            larry2068.Position = UDim2.new(1, 40, 0, 0)
            larry2068.BackgroundTransparency = 1
            larry2068.BackgroundColor3 = larry24
            larry2068.BorderSizePixel = 0
            local larry2074 = Instance.new("UICorner", larry2068)
            larry2074.CornerRadius = UDim.new(0, 12)
            local larry2078 = Instance.new("UIGradient", larry2068)
            larry2078.Rotation = 35
            local larry2086 = ColorSequence.new({
                [1] = ColorSequenceKeypoint.new(0, larry26),
                [2] = ColorSequenceKeypoint.new(0.55, larry28),
                [3] = ColorSequenceKeypoint.new(1, larry30),
            })
            larry2078.Color = larry2086
            local larry2088 = Instance.new("UIStroke", larry2068)
            larry2088.Thickness = 3
            larry2088.Transparency = 0.8
            larry2088.Color = larry32
            larry2088.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            local larry2092 = Instance.new("UIStroke", larry2068)
            larry2092.Thickness = 1
            larry2092.Transparency = 0.5
            larry2092.Color = larry34
            larry2092.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            local larry2096 = Instance.new("TextLabel", larry2068)
            larry2096.Position = UDim2.new(0, 12, 0, 8)
            larry2096.Size = UDim2.new(1, - 24, 0, 20)
            larry2096.BackgroundTransparency = 1
            larry2096.Font = larry48
            larry2096.Text = "System"
            larry2096.TextColor3 = larry40
            larry2096.TextSize = 14
            larry2096.TextXAlignment = Enum.TextXAlignment.Left
            local larry2104 = Instance.new("TextLabel", larry2068)
            larry2104.Position = UDim2.new(0, 12, 0, 30)
            larry2104.Size = UDim2.new(1, - 24, 0, 32)
            larry2104.BackgroundTransparency = 1
            larry2104.Font = larry52
            larry2104.Text = "Hopping..."
            larry2104.TextColor3 = larry42
            larry2104.TextSize = 13
            larry2104.TextWrapped = true
            larry2104.TextXAlignment = Enum.TextXAlignment.Left
            larry2104.TextYAlignment = Enum.TextYAlignment.Top
            local larry2122 = larry6:Create(larry2068, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                BackgroundTransparency = 0,
                Position = UDim2.new(0, 0, 0, 0),
            })
            larry2122:Play()
            task.delay(3, function(...)
                local larry2137 = larry6:Create(larry2068, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, 40, 0, 0),
                })
                larry2137:Play()
                task.wait(0.36)
                larry2064:Destroy()
            end)
            local larry2145 = larry6:Create(larry2056, TweenInfo.new(0.1), {
                TextSize = 12,
            })
            larry2145:Play()
            task.wait(0.1)
            local larry2151 = larry6:Create(larry2056, TweenInfo.new(0.1), {
                TextSize = 14,
            })
            larry2151:Play()
        end)
        makefolder("ChilliLib")
        makefolder("ChilliLib/settings")
    end,
    SaveConfig = function(...)
        local _2156_vararg1, _2156_vararg2 = ...
        local larry2161 = larry12:JSONEncode({
            [1] = {
                flag = _562_vararg3,
                type = "Dropdown",
                value = _694_2,
            },
            [2] = {
                flag = "AutoFarm",
                type = "Toggle",
                state = true,
            },
            [3] = {
                flag = _803_vararg3,
                type = "Input",
                text = _857_vararg2,
            },
            [4] = {
                flag = _976_vararg3,
                type = "Slider",
                value = larry1029,
            },
            [5] = {
                flag = "Webhook",
                type = "Input",
                text = larry1996.Text,
            },
            [6] = {
                flag = _858_vararg3,
                type = "Toggle",
                state = true,
            },
            [7] = {
                flag = "WalkSpeed",
                type = "Slider",
                value = 16,
            },
            [8] = {
                flag = "TargetMode",
                type = "Dropdown",
                value = "Random",
            },
        })
        writefile("ChilliLib" .. "/settings/" .. _2156_vararg2 .. ".json", larry2161)
        return true
    end,
}