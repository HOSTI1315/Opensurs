--[[
    Miranda Hub - Deobfuscated & Cleaned
    Target Game: Likely Animal Tycoon / Zoo Tycoon
    Original Decompiler: Larry
    Cleaned by: AI
]]

--// Services //--
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local ProximityPromptService = game:GetService("ProximityPromptService")

--// Local Player //--
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Mouse = LocalPlayer:GetMouse()

--// Configuration //--
local Config = {
    espPlayer = false,
    xRay = false,
    infJump = false,
    reduceGraphics = false,
    stealFloorInsta = false,
    antiDebuff = false,
    espBest = false,
    unwalk = false, -- This seems to be Anti-Ragdoll/Movement Fix
    autoKick = false, -- Named "Desync" in UI
    flyToBest = false,
    hideSkin = false, -- Remove Clothes
    speed = false,
    nearest = false,
    antiRagdoll = false
}

--// UI Setup //--
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MirandaHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 350) -- Adjusted height
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 60, 60)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -12, 0, 22)
Title.Position = UDim2.new(0, 6, 0, 8)
Title.BackgroundTransparency = 1
Title.Text = "MIRANDA HUB"
Title.Font = Enum.Font.Arcade
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18
Title.Parent = MainFrame

local ScrollContainer = Instance.new("ScrollingFrame")
ScrollContainer.Size = UDim2.new(1, -12, 1, -50)
ScrollContainer.Position = UDim2.new(0, 6, 0, 40)
ScrollContainer.BackgroundTransparency = 1
ScrollContainer.BorderSizePixel = 0
ScrollContainer.ScrollBarThickness = 4
ScrollContainer.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Parent = ScrollContainer

--// Functions //--

local function SaveConfig()
    if writefile then
        writefile("MirandaTweenPlus/config.json", HttpService:JSONEncode(Config))
    end
end

local function CreateButton(text, configKey, callback)
    local ButtonFrame = Instance.new("Frame")
    ButtonFrame.Size = UDim2.new(0.95, 0, 0, 30)
    ButtonFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    ButtonFrame.Parent = ScrollContainer

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = ButtonFrame

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundTransparency = 1
    Button.Font = Enum.Font.Arcade
    Button.Text = text
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.TextSize = 12
    Button.Parent = ButtonFrame

    -- Update Color based on state
    local function UpdateState()
        if Config[configKey] then
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(60, 200, 60) -- Green
        else
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 55) -- Dark
        end
    end
    UpdateState()

    Button.MouseButton1Click:Connect(function()
        Config[configKey] = not Config[configKey]
        UpdateState()
        SaveConfig()
        if callback then callback(Config[configKey]) end
    end)
    
    return Button
end

--// Features Implementation //--

-- 1. Fullbright / Ambient Fix
RunService.LightUpdate:Connect(function()
    if Config.reduceGraphics then
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    end
end)

-- 2. ESP (Player)
local function UpdateESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local char = player.Character
            if Config.espPlayer then
                if not char:FindFirstChild("ESP_HL") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "ESP_HL"
                    hl.FillColor = Color3.fromRGB(255, 0, 0)
                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    hl.FillTransparency = 0.5
                    hl.OutlineTransparency = 0
                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    hl.Parent = char
                    
                    local bg = Instance.new("BillboardGui")
                    bg.Name = "ESP_Name"
                    bg.Size = UDim2.new(0, 100, 0, 50)
                    bg.StudsOffset = Vector3.new(0, 3, 0)
                    bg.AlwaysOnTop = true
                    bg.Parent = char.HumanoidRootPart
                    
                    local txt = Instance.new("TextLabel")
                    txt.Size = UDim2.new(1, 0, 1, 0)
                    txt.BackgroundTransparency = 1
                    txt.Text = player.Name
                    txt.TextColor3 = Color3.new(1, 1, 1)
                    txt.Font = Enum.Font.GothamBold
                    txt.TextScaled = true
                    txt.Parent = bg
                end
            else
                if char:FindFirstChild("ESP_HL") then char.ESP_HL:Destroy() end
                if char.HumanoidRootPart:FindFirstChild("ESP_Name") then char.HumanoidRootPart.ESP_Name:Destroy() end
            end
        end
    end
end

RunService.Heartbeat:Connect(UpdateESP)

-- 3. Graphics Reducer
local function ReduceGraphics(state)
    for _, part in ipairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part:IsDescendantOf(LocalPlayer.Character) then
            if state then
                part.Material = Enum.Material.Plastic
                part.Reflectance = 0
            end
        end
    end
    
    -- Hide Decorations in Plots
    local plots = Workspace:FindFirstChild("Plots")
    if plots then
        for _, plot in ipairs(plots:GetChildren()) do
            local decor = plot:FindFirstChild("Decorations")
            if decor then
                for _, part in ipairs(decor:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.LocalTransparencyModifier = state and 0.8 or 0
                    end
                end
            end
        end
    end
end

-- 4. Speed
local function EnableSpeed()
    RunService.Heartbeat:Connect(function()
        if Config.speed and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LocalPlayer.Character.HumanoidRootPart
            local moveDir = LocalPlayer.Character.Humanoid.MoveDirection
            if moveDir.Magnitude > 0 then
                hrp.Velocity = Vector3.new(moveDir.X * 50, hrp.Velocity.Y, moveDir.Z * 50)
            end
        end
    end)
end
EnableSpeed()

-- 5. Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if Config.infJump and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- 6. Remove Clothes / Hide Skin
local function RemoveClothes()
    if Config.hideSkin and LocalPlayer.Character then
        for _, obj in ipairs(LocalPlayer.Character:GetChildren()) do
            if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("ShirtGraphic") then
                obj:Destroy()
            end
        end
    end
end
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    RemoveClothes()
end)

-- 7. Anti Debuff / Anti Ragdoll
local function CleanCharacter(char)
    if not Config.antiDebuff then return end
    -- Removes restraints often used in Tycoons to ragdoll players
    for _, child in ipairs(char:GetDescendants()) do
        if child:IsA("BallSocketConstraint") or child.Name == "GTB_LV" or child.Name == "GTB_AO" then
            child:Destroy()
        end
    end
    -- Force Getting Up state
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        hum.PlatformStand = false
    end
end

RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character then
        CleanCharacter(LocalPlayer.Character)
    end
end)

-- 8. Steal Floor (Instant Claim)
local function StealFloor()
    while Config.stealFloorInsta and task.wait(0.1) do
        local plots = Workspace:FindFirstChild("Plots")
        if plots then
            for _, plot in ipairs(plots:GetChildren()) do
                local sign = plot:FindFirstChild("PlotSign")
                if sign and sign:FindFirstChild("YourBase") and sign.YourBase.Enabled then
                    -- Teleport/Touch logic usually goes here or firing the touch interest
                    -- The original script seemed to rely on proximity or basic touch
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, sign.Parent, 0)
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, sign.Parent, 1)
                    end
                end
            end
        end
    end
end

-- 9. Desync / Physics Optimization (The large block of setfflag)
local function OptimizePhysics()
    -- These are aggressive settings usually used for "Desync" or reducing lag
    pcall(function()
        setfflag("S2PhysicsSenderRate", "15000")
        setfflag("PhysicsSenderMaxBandwidthBps", "20000")
        -- ... many others from the original script
    end)
end

--// Initialize Buttons //--

CreateButton("ESP Players", "espPlayer", UpdateESP)
CreateButton("X-Ray (Decorations)", "xRay", function(state) ReduceGraphics(Config.reduceGraphics) end) -- Linked logic
CreateButton("Reduce Graphics", "reduceGraphics", ReduceGraphics)
CreateButton("Infinite Jump", "infJump")
CreateButton("Speed Hack", "speed")
CreateButton("Remove Clothes", "hideSkin", RemoveClothes)
CreateButton("Anti-Ragdoll/Debuff", "antiDebuff")
CreateButton("Steal Floor (Auto Claim)", "stealFloorInsta", function(state)
    if state then task.spawn(StealFloor) end
end)
CreateButton("Desync (Optimize)", "autoKick", OptimizePhysics)

--// Final Init //--
if not isfolder("MirandaTweenPlus") then
    makefolder("MirandaTweenPlus")
end

-- Notification
StarterGui:SetCore("SendNotification", {
    Title = "Miranda Hub Loaded",
    Text = "Deobfuscated Version",
    Duration = 5
})

print("Script Loaded Successfully")