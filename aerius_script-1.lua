local aerius1 = game:GetService("Players")
local aerius2 = aerius1.LocalPlayer
local aerius3 = aerius2:WaitForChild("Backpack")
local aerius4 = game:GetService("Lighting")
local aerius5 = game.CoreGui:FindFirstChild("TigyFPSDevourUI")
aerius5:Destroy()
aerius4.GlobalShadows = false
aerius4.EnvironmentDiffuseScale = 0
aerius4.EnvironmentSpecularScale = 0
for _, child in aerius4:GetChildren() do
    for _, obj in workspace:GetDescendants() do
        for _, obj in workspace:GetDescendants() do
            local aerius6 = workspace.DescendantAdded:Connect(function(descendant)
            end
        end)
        local aerius7 = Instance.new("ScreenGui")
        aerius7.Name = "TigyFPSDevourUI"
        aerius7.Parent = game.CoreGui
        aerius7.ResetOnSpawn = false
        local aerius8 = Instance.new("Frame")
        aerius8.Parent = aerius7
        aerius8.Size = UDim2.new(0, 340, 0, 160)
        aerius8.Position = UDim2.new(0.5, -170, 0.5, -80)
        aerius8.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
        aerius8.BorderSizePixel = 0
        aerius8.Active = true
        aerius8.Draggable = true
        local aerius9 = Instance.new("UICorner", aerius8)
        aerius9.CornerRadius = UDim.new(0, 18)
        local aerius10 = Instance.new("TextLabel")
        aerius10.Parent = aerius8
        aerius10.Size = UDim2.new(1, -20, 0, 40)
        aerius10.Position = UDim2.new(0, 10, 0, 10)
        aerius10.BackgroundTransparency = 1
        aerius10.Text = "Tigy’s FPS Devour"
        aerius10.Font = Enum.Font.GothamBlack
        aerius10.TextSize = 20
        aerius10.TextXAlignment = Enum.TextXAlignment.Left
        aerius10.TextColor3 = Color3.new(1, 1, 1)
        local aerius11 = Instance.new("TextButton")
        aerius11.Parent = aerius8
        aerius11.Size = UDim2.new(1, -40, 0, 54)
        aerius11.Position = UDim2.new(0, 20, 0, 80)
        aerius11.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        aerius11.Text = "FPS Devour (need auras)"
        aerius11.Font = Enum.Font.GothamBold
        aerius11.TextSize = 15
        aerius11.TextColor3 = Color3.new(1, 1, 1)
        aerius11.BorderSizePixel = 0
        aerius11.AutoButtonColor = true
        local aerius12 = Instance.new("UICorner", aerius11)
        aerius12.CornerRadius = UDim.new(0, 14)
        local aerius13 = aerius11.MouseButton1Click:Connect(function()
            aerius11.Text = "WORKING..."
            aerius11.AutoButtonColor = false
            local aerius14 = object:FindFirstChildOfClass("Humanoid")
            local aerius15 = aerius3:FindFirstChild("Quantum Cloner")
            aerius14:EquipTool(aerius15)
            task.wait()
            for _, child in aerius3:GetChildren() do
                task.wait()
                local aerius16 = aerius15:Activate()
                task.delay(0.5, function()
                    aerius11.Text = "FPS Devour (need auras)"
                    aerius11.AutoButtonColor = true
                end
            end)
        end)