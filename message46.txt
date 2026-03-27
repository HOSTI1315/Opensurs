-- LEAKED BY ILLUSION DEV

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StatsService = game:GetService("Stats")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZzzzLagGUI"
ScreenGui.ResetOnSpawn = false
if syn and syn.protect_gui then 
    syn.protect_gui(ScreenGui) 
    ScreenGui.Parent = CoreGui 
elseif gethui then 
    ScreenGui.Parent = gethui() 
else 
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") 
end

local Colors = {
    Background = Color3.fromRGB(18, 18, 22),
    ButtonBlue = Color3.fromRGB(56, 129, 194),
    ButtonRed = Color3.fromRGB(209, 44, 44),
    ButtonDarkRed = Color3.fromRGB(117, 38, 38),
    TextGray = Color3.fromRGB(160, 160, 160),
    TopBtnParams = Color3.fromRGB(35, 35, 40),
    LeakedText = Color3.fromRGB(255, 50, 50)
}

local LeakedLabel = Instance.new("TextLabel")
LeakedLabel.Parent = ScreenGui
LeakedLabel.BackgroundTransparency = 1
LeakedLabel.Position = UDim2.new(0.5, -100, 0, 5)
LeakedLabel.Size = UDim2.new(0, 200, 0, 20)
LeakedLabel.Font = Enum.Font.GothamBold
LeakedLabel.TextColor3 = Colors.LeakedText
LeakedLabel.TextSize = 14
LeakedLabel.Text = "-LEAKED BY ILLUSION DEV"
LeakedLabel.TextStrokeTransparency = 0.5

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Colors.Background
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -140)
MainFrame.Size = UDim2.new(0, 250, 0, 280)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Parent = MainFrame
Header.BackgroundTransparency = 1
Header.Size = UDim2.new(1, 0, 0, 40)

local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.Text = "zzzz's lag bomb"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 16
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0, 150, 1, 0)
Title.TextXAlignment = Enum.TextXAlignment.Left

local function CreateHeaderBtn(text, offset)
    local btn = Instance.new("TextButton")
    btn.Parent = Header
    btn.BackgroundColor3 = Colors.TopBtnParams
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.Position = UDim2.new(1, offset, 0.5, -15)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.new(0.9, 0.9, 0.9)
    btn.TextSize = 16
    btn.AutoButtonColor = false
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    return btn
end

local CloseBtn = CreateHeaderBtn("×", -40)
local MinBtn = CreateHeaderBtn("−", -78)

CloseBtn.MouseButton1Click:Connect(function() 
    ScreenGui:Destroy() 
end)

local Container = Instance.new("Frame")
Container.Parent = MainFrame
Container.BackgroundTransparency = 1
Container.Position = UDim2.new(0, 15, 0, 45)
Container.Size = UDim2.new(1, -30, 1, -50)

local PingLbl = Instance.new("TextLabel")
PingLbl.Parent = Container
PingLbl.BackgroundTransparency = 1
PingLbl.Position = UDim2.new(0, 0, 0, 0)
PingLbl.Size = UDim2.new(1, 0, 0, 20)
PingLbl.Font = Enum.Font.GothamMedium
PingLbl.TextColor3 = Colors.TextGray
PingLbl.TextSize = 14
PingLbl.TextXAlignment = Enum.TextXAlignment.Left
PingLbl.Text = "Ping: 0 ms"

local FPSLbl = Instance.new("TextLabel")
FPSLbl.Parent = Container
FPSLbl.BackgroundTransparency = 1
FPSLbl.Position = UDim2.new(0, 0, 0, 22)
FPSLbl.Size = UDim2.new(1, 0, 0, 20)
FPSLbl.Font = Enum.Font.GothamMedium
FPSLbl.TextColor3 = Colors.TextGray
FPSLbl.TextSize = 14
FPSLbl.TextXAlignment = Enum.TextXAlignment.Left
FPSLbl.Text = "FPS: 0"

local ButtonContainer = Instance.new("Frame")
ButtonContainer.Parent = Container
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Position = UDim2.new(0, 0, 0, 55)
ButtonContainer.Size = UDim2.new(1, 0, 1, -60)

local UIList = Instance.new("UIListLayout")
UIList.Parent = ButtonContainer
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)

local function CreateMainBtn(text, color, order)
    local btn = Instance.new("TextButton")
    btn.Name = text
    btn.Parent = ButtonContainer
    btn.BackgroundColor3 = color
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 14
    btn.LayoutOrder = order
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 10)
    c.Parent = btn
    return btn
end

local LagBtn = CreateMainBtn("lag em", Colors.ButtonBlue, 1)
local ResetBtn = CreateMainBtn("Reset", Colors.ButtonRed, 2)
local SpeedBtn = CreateMainBtn("Speed [E]", Colors.ButtonDarkRed, 3)

local Footer = Instance.new("TextLabel")
Footer.Parent = MainFrame
Footer.BackgroundTransparency = 1
Footer.Position = UDim2.new(0, 0, 1, -18)
Footer.Size = UDim2.new(1, 0, 0, 10)
Footer.Font = Enum.Font.Gotham
Footer.TextColor3 = Color3.fromRGB(60, 60, 65)
Footer.TextSize = 10
Footer.Text = "discord.gg/zzzhub"

local dragging, dragInput, dragStart, startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

local minimized = false
local originalSize = UDim2.new(0, 250, 0, 280)
local minimizedSize = UDim2.new(0, 250, 0, 40)

MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Container.Visible = false
        Footer.Visible = false
        TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = minimizedSize}):Play()
    else
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = originalSize})
        tween:Play()
        tween.Completed:Connect(function()
            if not minimized then
                Container.Visible = true
                Footer.Visible = true
            end
        end)
    end
end)

RunService.RenderStepped:Connect(function(dt)
    FPSLbl.Text = "FPS: " .. math.floor(1/dt)
    local ping = 0
    pcall(function()
        ping = math.floor(StatsService.Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    PingLbl.Text = "Ping: " .. ping .. " ms"
end)

-- [!] SOURCE DUMP OF LAG FUNCTION WAS NOT SUCCESSFUL
-- [!] FAILED
-- [!] FAILED

local lagging = false

local function LagEm()
    if lagging then return end
    lagging = true
    
    LagBtn.Text = "BOMBING..."
    LagBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    
    -- [!] FAILED 
    -- [!] FAILED
    
    task.wait(2)
    
    lagging = false
    LagBtn.Text = "lag em"
    LagBtn.BackgroundColor3 = Colors.ButtonBlue
end

LagBtn.MouseButton1Click:Connect(LagEm)

ResetBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.Health = 0
    end
end)

-- SPEED FUNCTION
local speedActive = false
local speedConnection = nil

local function ToggleSpeed()
    speedActive = not speedActive
    
    if speedActive then
        SpeedBtn.Text = "Speed [E] - ON"
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        
        speedConnection = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                local hrp = char:FindFirstChild("HumanoidRootPart")
                
                if hum then
                    hum.WalkSpeed = 45
                    hum.JumpPower = 50
                    hum.MaxHealth = math.huge
                    hum.Health = math.huge
                end
                
                if hrp then
                    if hrp.Velocity.Y < -5 then
                        workspace.Gravity = 35
                    else
                        workspace.Gravity = 196.2
                    end
                end
            end
        end)
    else
        SpeedBtn.Text = "Speed [E]"
        SpeedBtn.BackgroundColor3 = Colors.ButtonDarkRed
        
        if speedConnection then
            speedConnection:Disconnect()
            speedConnection = nil
        end
        
        workspace.Gravity = 196.2
        
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = 16
                hum.JumpPower = 50
                hum.MaxHealth = 100
                hum.Health = 100
            end
        end
    end
end

SpeedBtn.MouseButton1Click:Connect(ToggleSpeed)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.E then
        TweenService:Create(SpeedBtn, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(180, 60, 60)}):Play()
        task.wait(0.05)
        ToggleSpeed()
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if speedActive then
        local hum = char:WaitForChild("Humanoid", 5)
        if hum then
            hum.WalkSpeed = 45
            hum.JumpPower = 50
            hum.MaxHealth = math.huge
            hum.Health = math.huge
        end
    end
end)