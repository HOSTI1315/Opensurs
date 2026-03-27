

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ESP Settings
local ESPEnabled = false
local ESPSettings = {
    Boxes = false,
    Tracers = false,
    Name = false,
    Meters = false
}
local ESPObjects = {}

-- Enemy check
local function isEnemy(player)
    if player.Team ~= nil and LocalPlayer.Team ~= nil then
        return player.Team ~= LocalPlayer.Team
    end
    return true
end

-- Create ESP object per player
local function createESP(player)
    if player == LocalPlayer then return end
    ESPObjects[player] = {
        Box = Drawing.new("Square"),
        Tracer = Drawing.new("Line"),
        Name = Drawing.new("Text"),
        Meter = Drawing.new("Line")
    }

    local o = ESPObjects[player]
    o.Box.Visible = false
    o.Box.Color = Color3.fromRGB(0, 255, 0)
    o.Box.Thickness = 2
    o.Box.Filled = false

    o.Tracer.Visible = false
    o.Tracer.Color = Color3.fromRGB(0, 255, 255)
    o.Tracer.Thickness = 1

    o.Name.Visible = false
    o.Name.Color = Color3.fromRGB(255, 255, 255)
    o.Name.Size = 16
    o.Name.Center = true
    o.Name.Outline = true

    o.Meter.Visible = false
    o.Meter.Color = Color3.fromRGB(255, 170, 0)
    o.Meter.Thickness = 2
end

-- Cleanup
Players.PlayerRemoving:Connect(function(player)
    local objs = ESPObjects[player]
    if objs then
        for _, obj in pairs(objs) do obj:Remove() end
        ESPObjects[player] = nil
    end
end)

for _, player in ipairs(Players:GetPlayers()) do createESP(player) end
Players.PlayerAdded:Connect(createESP)

-- ESP update loop
RunService.RenderStepped:Connect(function()
    if not ESPEnabled then
        for _, objs in pairs(ESPObjects) do
            for _, obj in pairs(objs) do obj.Visible = false end
        end
        return
    end

    for player, objs in pairs(ESPObjects) do
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp and isEnemy(player) then
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local size = Vector2.new(2000 / math.max(pos.Z, 0.1), 2500 / math.max(pos.Z, 0.1))

                if ESPSettings.Boxes then
                    objs.Box.Size = size
                    objs.Box.Position = Vector2.new(pos.X - size.X/2, pos.Y - size.Y/2)
                    objs.Box.Visible = true
                else objs.Box.Visible = false end

                if ESPSettings.Tracers then
                    objs.Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                    objs.Tracer.To = Vector2.new(pos.X, pos.Y)
                    objs.Tracer.Visible = true
                else objs.Tracer.Visible = false end

                if ESPSettings.Name then
                    objs.Name.Text = player.Name
                    objs.Name.Position = Vector2.new(pos.X, pos.Y - size.Y/2 - 15)
                    objs.Name.Visible = true
                else objs.Name.Visible = false end

                if ESPSettings.Meters then
                    objs.Meter.From = Vector2.new(pos.X, pos.Y)
                    objs.Meter.To = Vector2.new(pos.X, pos.Y + math.clamp(pos.Z/5, 20, 200))
                    objs.Meter.Visible = true
                else objs.Meter.Visible = false end
            else
                for _, obj in pairs(objs) do obj.Visible = false end
            end
        else
            for _, obj in pairs(objs) do obj.Visible = false end
        end
    end
end)

--// UI
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "ESP_UI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 360, 0, 340)
Frame.Position = UDim2.new(0.3, 0, 0.25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "Open Source ESP"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Master Toggle
local MasterToggle = Instance.new("TextButton", Frame)
MasterToggle.Size = UDim2.new(0, 40, 0, 40)
MasterToggle.Position = UDim2.new(0, 10, 0, 60)
MasterToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
MasterToggle.Text = ""
MasterToggle.BorderSizePixel = 0
MasterToggle.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    MasterToggle.BackgroundColor3 = ESPEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
end)

-- Dropdown button
local Dropdown = Instance.new("TextButton", Frame)
Dropdown.Size = UDim2.new(1, -60, 0, 40)
Dropdown.Position = UDim2.new(0, 60, 0, 60)
Dropdown.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
Dropdown.Text = ""
Dropdown.BorderSizePixel = 0

-- Arrow indicator
local Arrow = Instance.new("TextLabel", Dropdown)
Arrow.Size = UDim2.new(0, 20, 0, 20)
Arrow.Position = UDim2.new(0.5, -10, 1, -20)
Arrow.BackgroundTransparency = 1
Arrow.Text = "▼"
Arrow.TextColor3 = Color3.fromRGB(200, 200, 200)
Arrow.Font = Enum.Font.GothamBold
Arrow.TextSize = 18

-- Scrollable dropdown container
local ScrollFrame = Instance.new("ScrollingFrame", Frame)
ScrollFrame.Size = UDim2.new(1, -20, 0, 0) -- collapsed initially
ScrollFrame.Position = UDim2.new(0, 10, 0, 110)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ScrollFrame.BorderSizePixel = 0
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.Visible = false

local UIList = Instance.new("UIListLayout", ScrollFrame)
UIList.Padding = UDim.new(0, 5)
UIList.FillDirection = Enum.FillDirection.Vertical
UIList.SortOrder = Enum.SortOrder.LayoutOrder

local Options = {"Boxes", "Tracers", "Name", "Meters"}
local OptionButtons = {}
local itemHeight, padding = 30, 5
local expandedHeight = (#Options * (itemHeight + padding)) + 100 -- longer scroll area
local collapsedHeight = 0

for _, opt in ipairs(Options) do
    local btn = Instance.new("TextButton", ScrollFrame)
    btn.Size = UDim2.new(1, -10, 0, itemHeight)
    btn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    btn.Text = opt .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.BorderSizePixel = 0

    btn.MouseButton1Click:Connect(function()
        ESPSettings[opt] = not ESPSettings[opt]
        btn.Text = opt .. ": " .. (ESPSettings[opt] and "ON" or "OFF")
        btn.BackgroundColor3 = ESPSettings[opt] and Color3.fromRGB(0, 170, 85) or Color3.fromRGB(55, 55, 55)
    end)

    table.insert(OptionButtons, btn)
end

-- Update CanvasSize based on content
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, expandedHeight)

-- Dropdown open/close tween
local Open = false
local tweenInfoOpen = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfoClose = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

local function setDropdown(open)
    Open = open
    ScrollFrame.Visible = true
    local targetHeight = open and expandedHeight or collapsedHeight

    -- Animate dropdown frame height
    local tween = TweenService:Create(
        ScrollFrame,
        open and tweenInfoOpen or tweenInfoClose,
        {Size = UDim2.new(1, -20, 0, targetHeight)}
    )
    tween:Play()

    -- Animate arrow rotation
    local arrowTween = TweenService:Create(
        Arrow,
        tweenInfoOpen,
        {Rotation = open and 180 or 0}
    )
    arrowTween:Play()

    tween.Completed:Connect(function()
        if not Open then
            ScrollFrame.Visible = false
        end
    end)
end

-- Toggle dropdown on click
Dropdown.MouseButton1Click:Connect(function()
    setDropdown(not Open)
end)
