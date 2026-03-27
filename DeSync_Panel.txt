local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local Config = {
    StrokeThickness = 2,
    ESPColor = Color3.fromRGB(255, 230, 0),
    BTNSColor = Color3.fromRGB(255, 170, 0),
    AnimDisable = false
}

local FFlags = {
    DisableDPIScale = true,
    S2PhysicsSenderRate = 15000,
    AngularVelociryLimit = 360,
    StreamJobNOUVolumeCap = 2147483647,
    GameNetDontSendRedundantDeltaPositionMillionth = 1,
    TimestepArbiterOmegaThou = 1073741823,
    MaxMissedWorldStepsRemembered = -2147483648,
    GameNetPVHeaderRotationalVelocityZeroCutoffExponent = -5000,
    PhysicsSenderMaxBandwidthBps = 20000,
    LargeReplicatorSerializeWrite4 = true,
    MaxAcceptableUpdateDelay = 1,
    ServerMaxBandwith = 52,
    InterpolationFrameRotVelocityThresholdMillionth = 5,
    GameNetDontSendRedundantNumTimes = 1,
    StreamJobNOUVolumeLengthCap = 2147483647,
    CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent = 1,
    TimestepArbiterHumanoidTurningVelThreshold = 1,
    MaxTimestepMultiplierAcceleration = 2147483647,
    SimOwnedNOUCountThresholdMillionth = 2147483647,
    SimExplicitlyCappedTimestepMultiplier = 2147483646,
    TimestepArbiterVelocityCriteriaThresholdTwoDt = 2147483646,
    CheckPVCachedVelThresholdPercent = 10,
    ReplicationFocusNouExtentsSizeCutoffForPauseStuds = 2147483647,
    InterpolationFramePositionThresholdMillionth = 5,
    DebugSendDistInSteps = -2147483648,
    LargeReplicatorEnabled9 = true,
    CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth = 1,
    LargeReplicatorWrite5 = true,
    NextGenReplicatorEnabledWrite4 = true,
    MaxTimestepMultiplierContstraint = 2147483647,
    MaxTimestepMultiplierBuoyancy = 2147483647,
    MaxDataPacketPerSend = 2147483647,
    LargeReplicatorRead5 = true,
    CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth = 1,
    TimestepArbiterHumanoidLinearVelThreshold = 1,
    WorldStepMax = 30,
    InterpolationFrameVelocityThresholdMillionth = 5,
    LargeReplicatorSerializeRead3 = true,
    GameNetPVHeaderLinearVelocityZeroCutoffExponent = -5000,
    CheckPVCachedRotVelThresholdPercent = 10,
}

local animDisableConn = nil
local originalAnimIds = {}
local animateScript = nil

local ANIM_TYPES = {
    "walk", "run", "jump", "fall", "idle", "toolnone"
}

local function cacheOriginalAnimations()
    local char = player.Character
    if not char then return false end
    
    animateScript = char:FindFirstChild("Animate")
    if not animateScript then return false end
    
    originalAnimIds = {}
    
    for _, animType in ipairs(ANIM_TYPES) do
        local animFolder = animateScript:FindFirstChild(animType)
        if animFolder then
            originalAnimIds[animType] = {}
            for _, anim in ipairs(animFolder:GetChildren()) do
                if anim:IsA("Animation") then
                    originalAnimIds[animType][anim.Name] = anim.AnimationId
                end
            end
        end
    end
    return true
end

local function disableAnimations()
    if not animateScript then return end
    
    for _, animType in ipairs(ANIM_TYPES) do
        local animFolder = animateScript:FindFirstChild(animType)
        if animFolder then
            for _, anim in ipairs(animFolder:GetChildren()) do
                if anim:IsA("Animation") then
                    anim.AnimationId = ""
                end
            end
        end
    end
    
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
                track:Stop(0)
            end
        end
    end
end

local function restoreAnimations()
    local char = player.Character
    if not char then return end
    animateScript = char:FindFirstChild("Animate")

    if not animateScript or not originalAnimIds then return end
    
    for animType, anims in pairs(originalAnimIds) do
        local animFolder = animateScript:FindFirstChild(animType)
        if animFolder then
            for animName, animId in pairs(anims) do
                local anim = animFolder:FindFirstChild(animName)
                if anim and anim:IsA("Animation") then
                    anim.AnimationId = animId
                end
            end
        end
    end
end

local function toggleAnimLoop(state)
    if state then
        if not next(originalAnimIds) then
            cacheOriginalAnimations()
        end
        
        if animDisableConn then animDisableConn:Disconnect() end
        animDisableConn = RunService.Heartbeat:Connect(function()
            if Config.AnimDisable then
                disableAnimations()
            end
        end)
    else
        if animDisableConn then
            animDisableConn:Disconnect()
            animDisableConn = nil
        end
        restoreAnimations()
    end
end

local function setFlags()
    for name, value in pairs(FFlags) do
        pcall(function()
            setfflag(tostring(name), tostring(value))
        end)
    end
end

function respawn(plr)
    local rcdEnabled, wasHidden = false, false
    if gethidden then
        pcall(function()
             rcdEnabled, wasHidden = gethidden(workspace, 'RejectCharacterDeletions')
            ~= Enum.RejectCharacterDeletions.Disabled
        end)
    end

    if rcdEnabled and replicatesignal then
        replicatesignal(plr.ConnectDiedSignalBackend)
        task.wait(Players.RespawnTime - 0.1)
        replicatesignal(plr.Kill)
    else
        local char = plr.Character
        local hum = char:FindFirstChildWhichIsA('Humanoid')
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Dead)
        end
        char:ClearAllChildren()
        local newChar = Instance.new('Model')
        newChar.Parent = workspace
        plr.Character = newChar
        task.wait()
        plr.Character = char
        newChar:Destroy()
    end
end

local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "ESPFolder"
ESPFolder.Parent = workspace

local fakePosESP = nil
local serverPosition = nil

function createESPVisual()
    local part = Instance.new("Part")
    part.Name = "ServerPosBox"
    part.Size = Vector3.new(4, 6, 2)
    part.Transparency = 1 
    part.Anchored = true
    part.CanCollide = false
    part.Parent = ESPFolder
    
    local box = Instance.new("SelectionBox")
    box.Name = "Outline"
    box.Adornee = part
    box.Parent = part
    box.Color3 = Config.ESPColor
    box.LineThickness = 0.10
    box.Transparency = 0
    box.SurfaceTransparency = 0.85
    
    local bb = Instance.new("BillboardGui")
    bb.Parent = part
    bb.Adornee = part
    bb.Size = UDim2.new(0, 100, 0, 50)
    bb.AlwaysOnTop = true
    bb.StudsOffset = Vector3.new(0, 4, 0)
    
    local text = Instance.new("TextLabel")
    text.Parent = bb
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "YOUR POSITION"
    text.TextColor3 = Config.ESPColor
    text.TextScaled = false
    text.TextSize = 10
    text.Font = Enum.Font.GothamBold
    text.TextStrokeTransparency = 0.5
    
    return part
end

local function trackServerPosition()
    local char = player.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local success, result = pcall(function()
        return hrp:GetNetworkOwner()
    end)
    
    if success and result == nil then
    else
        local oldPos = hrp:GetPropertyChangedSignal("Position"):Connect(function()
            task.wait(0.15)
            local char = player.Character
            if char then
                local currentHRP = char:FindFirstChild("HumanoidRootPart")
                if currentHRP then
                    serverPosition = currentHRP.Position
                end
            end
        end)
    end
end

local function updateESP()
    if fakePosESP and serverPosition then
        fakePosESP.CFrame = fakePosESP.CFrame:Lerp(CFrame.new(serverPosition), 0.2)
    end
end

local function initializeESP()
    ESPFolder:ClearAllChildren()
    fakePosESP = createESPVisual()
    
    local char = player.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            serverPosition = hrp.Position
            fakePosESP.CFrame = CFrame.new(serverPosition)
            
            hrp:GetPropertyChangedSignal("CFrame"):Connect(function()
                task.wait(0.2)
                serverPosition = hrp.Position
            end)
        end
    end
    if Config.AnimDisable then
        task.wait(0.5)
        cacheOriginalAnimations()
    end
end

local function CreateGUI()
    if CoreGui:FindFirstChild("DesyncControlUI") then CoreGui.DesyncControlUI:Destroy() end
    if player.PlayerGui:FindFirstChild("DesyncControlUI") then player.PlayerGui.DesyncControlUI:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "DesyncControlUI"
    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then ScreenGui.Parent = player.PlayerGui end
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75) 
    MainFrame.Size = UDim2.new(0, 190, 0, 140)
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Parent = MainFrame
    UIStroke.Color = Color3.fromRGB(255, 255, 255)
    UIStroke.Thickness = Config.StrokeThickness
    
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Parent = UIStroke
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))
    }

    RunService.RenderStepped:Connect(function()
        UIGradient.Rotation = (tick() * 100) % 360
    end)

    local Title = Instance.new("TextLabel")
    Title.Parent = MainFrame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.Size = UDim2.new(1, 0, 0, 25)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "NORRYS's"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.TextStrokeTransparency = 0.8

    local DesyncBtn = Instance.new("TextButton")
    DesyncBtn.Parent = MainFrame
    DesyncBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    DesyncBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
    DesyncBtn.Size = UDim2.new(0.8, 0, 0.25, 0)
    DesyncBtn.Font = Enum.Font.GothamBold
    DesyncBtn.Text = "Desync"
    DesyncBtn.TextColor3 = Config.ESPColor
    DesyncBtn.TextSize = 13
    
    Instance.new("UICorner", DesyncBtn).CornerRadius = UDim.new(0, 6)

    local ds = Instance.new("UIStroke", DesyncBtn)
    ds.Color = Config.ESPColor
    ds.Thickness = 0.6
    ds.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    DesyncBtn.MouseButton1Click:Connect(function()
        DesyncBtn.Text = "Desyinc..."
        setFlags()
        respawn(player)
        task.wait(5.1)
        DesyncBtn.Text = "Desync"
    end)

    local AnimBtn = Instance.new("TextButton")
    AnimBtn.Parent = MainFrame
    AnimBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    AnimBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
    AnimBtn.Size = UDim2.new(0.8, 0, 0.25, 0)
    AnimBtn.Font = Enum.Font.GothamBold
    AnimBtn.Text = "Disable Animations"
    AnimBtn.TextColor3 = Config.ESPColor
    AnimBtn.TextSize = 13
    
    Instance.new("UICorner", AnimBtn).CornerRadius = UDim.new(0, 6)

    local as = Instance.new("UIStroke", AnimBtn)
    as.Color = Config.ESPColor
    as.Thickness = 0.6
    as.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    AnimBtn.MouseButton1Click:Connect(function()
        Config.AnimDisable = not Config.AnimDisable
        
        if Config.AnimDisable then
            AnimBtn.BackgroundColor3 = Config.BTNSColor
            toggleAnimLoop(true)
        else
            AnimBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            toggleAnimLoop(false)
        end
    end)
            
    local dragging, dragInput, dragStart, startPos
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end


player.CharacterAdded:Connect(function()
    task.wait(0.2)
    initializeESP()
    if Config.AnimDisable then
        task.wait(0.5)
        cacheOriginalAnimations()
    end
end)

RunService.RenderStepped:Connect(function()
    trackServerPosition()
    updateESP()
end)

CreateGUI()
