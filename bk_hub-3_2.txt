getgenv().BRAINROT_CONFIG = {
        -- Keybinds
        TELEPORT_KEYBIND       = nil,
        TOGGLE_GUI_KEYBIND     = nil,
        INSTANT_CLONER_KEYBIND = nil,
        KICK_SELF_KEYBIND      = nil,
        FLOOR_STEAL_KEYBIND    = nil,
        REJOIN_KEYBIND         = nil,
        DESYNC_KEYBIND         = nil,

        -- Main Features
        AUTO_TP_ENABLED        = false,
        AUTO_HIDE_ENABLED      = false,
        AUTO_STEAL_ENABLED     = false,
        AUTO_STEAL_NEAREST_ENABLED = false,
        AUTO_STEAL_PRIORITY_ENABLED = false,
        PREDICTIVE_STEAL       = true,
        OptimizerEnabled       = false,
        FLOOR_STEAL_ENABLED    = false,
        AUTO_DESYNC_ENABLED    = false,
        STEAL_SPEED_ENABLED    = false,
        STEAL_DISABLE_ANIM_ENABLED = false,

        GUI_POSITION_X = nil,
        GUI_POSITION_Y = nil,
        MINI_GUI_POSITION_X = nil,
        MINI_GUI_POSITION_Y = nil,
        
        -- Filters
        SHOW_ALL_RARITIES      = true,
        SHOW_MUTATIONS_ONLY    = false,
        SHOW_TRAITS_ONLY       = false,
        MIN_GEN_VALUE          = 0,
        
        -- Priority System
        FAVORITES_PRIORITY_ENABLED = false,
        INVISIBLE_BASE_WALLS_ENABLED = false,
        SAFE_TELEPORT  = true,
        CARPET_MIDDLE  = false,
        
        -- ESP
        ESP_ENABLED         = false,
        ESP_PLAYERS_ENABLED = false,
        
        -- Anti-Lag
        ANTI_LAG_ENABLED    = false,
        ANTI_BEE_DISCO_ENABLED = false,
        ANTI_RAGDOLL_V1_ENABLED = false,
        ANTI_RAGDOLL_V2_ENABLED = false,
}

local PRIORITY_ANIMALS = {
    "Strawberry Elephant",
    "Meowl",
    "Headless Horseman",
    "Dragon Cannelloni",
    "Capitano Moby",
    "Cooki and Milki",
    "La Supreme Combinasion",
    "Burguro and Fryuro",
    "Garama and Madundung",
    "Lavadorito Spinito",
    "Spooky and Pumpky",
    "La Casa Boo",
    "La Secret Combinasion",
    "Chillin Chili",
    "Ketchuru and Musturu",
    "Ketupat Kepat",
    "La Taco Combinasion",
    "Tang Tang Keletang",
    "Tictac Sahur",
    "W or L",
    "Spaghetti Tualetti",
    "Nuclearo Dinossauro",
    "Money Money Puggy"
}

local CONFIG = getgenv().BRAINROT_CONFIG

if not getgenv().BRAINROT_FAVORITES then
    getgenv().BRAINROT_FAVORITES = {}
end

local FAVORITES = getgenv().BRAINROT_FAVORITES

local Config = {
    FAVORITES_FILE = "BrainrotFinderFavorites.json",
    CONFIG_FILE_NAME = "BrainrotFinderConfig.json"
}

local COLORS = {
    Background             = Color3.fromRGB(8, 8, 15),
    BackgroundTransparency = 0.25,
    Surface                = Color3.fromRGB(18, 12, 28),
    SurfaceTransparency    = 0.20,
    Text    = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(230, 230, 240),
    Accent  = Color3.new(0.694118, 0.121569, 1.000000),
    Purple = Color3.new(0.796078, 0.317647, 0.972549),
    Pink   = Color3.fromRGB(255, 140, 255),
    Cyan   = Color3.fromRGB(120, 240, 255),
    Yellow = Color3.fromRGB(255, 235, 120),
    Blue   = Color3.fromRGB(140, 200, 255),
    Red    = Color3.fromRGB(255, 120, 160),
    Success = Color3.fromRGB(120, 255, 200),
    Warning = Color3.fromRGB(255, 215, 120),
    Error   = Color3.fromRGB(255, 120, 160),
}

-- Desync flags
local DESYNC_FLAGS = {
    LargeReplicatorEnabled9 = true,
    GameNetDontSendRedundantNumTimes = 1,
    MaxTimestepMultiplierAcceleration = 2147483647,
    InterpolationFrameVelocityThresholdMillionth = 5,
    CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth = 1,
    TimestepArbiterVelocityCriteriaThresholdTwoDt = 2147483646,
    GameNetPVHeaderLinearVelocityZeroCutoffExponent = -5000,
    TimestepArbiterHumanoidTurningVelThreshold = 1,
    LargeReplicatorSerializeWrite4 = true,
    SimExplicitlyCappedTimestepMultiplier = 2147483646,
    InterpolationFrameRotVelocityThresholdMillionth = 5,
    ServerMaxBandwith = 52,
    LargeReplicatorSerializeRead3 = true,
    GameNetDontSendRedundantDeltaPositionMillionth = 1,
    PhysicsSenderMaxBandwidthBps = 20000,
    CheckPVCachedVelThresholdPercent = 10,
    NextGenReplicatorEnabledWrite4 = true,
    LargeReplicatorWrite5 = true,
    MaxMissedWorldStepsRemembered = -2147483648,
    StreamJobNOUVolumeCap = 2147483647,
    CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent = 1,
    DisableDPIScale = true,
    WorldStepMax = 30,
    InterpolationFramePositionThresholdMillionth = 5,
    MaxAcceptableUpdateDelay = 1,
    TimestepArbiterOmegaThou = 1073741823,
    CheckPVCachedRotVelThresholdPercent = 10,
    StreamJobNOUVolumeLengthCap = 2147483647,
    S2PhysicsSenderRate = 15000,
    MaxTimestepMultiplierBuoyancy = 2147483647,
    SimOwnedNOUCountThresholdMillionth = 2147483647,
    ReplicationFocusNouExtentsSizeCutoffForPauseStuds = 2147483647,
    LargeReplicatorRead5 = true,
    CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth = 1,
    MaxDataPacketPerSend = 2147483647,
    MaxTimestepMultiplierContstraint = 2147483647,
    DebugSendDistInSteps = -2147483648,
    GameNetPVHeaderRotationalVelocityZeroCutoffExponent = -5000,
    AngularVelociryLimit = 360
}

-- ============================================================
-- SECTION 2: SERVICES & MODULES
-- ============================================================

local S = {
    -- Services
    Players           = game:GetService("Players"),
    UserInputService  = game:GetService("UserInputService"),
    TweenService      = game:GetService("TweenService"),
    ReplicatedStorage = game:GetService("ReplicatedStorage"),
    HttpService       = game:GetService("HttpService"),
    RunService        = game:GetService("RunService"),
    Stats             = game:GetService("Stats"),
    TeleportService   = game:GetService("TeleportService"),
    Lighting          = game:GetService("Lighting"),
}

S.Packages = S.ReplicatedStorage:WaitForChild("Packages")
S.Datas    = S.ReplicatedStorage:WaitForChild("Datas")
S.Shared   = S.ReplicatedStorage:WaitForChild("Shared")
S.Utils    = S.ReplicatedStorage:WaitForChild("Utils")

S.Synchronizer  = require(S.Packages:WaitForChild("Synchronizer"))
S.AnimalsData   = require(S.Datas:WaitForChild("Animals"))
S.RaritiesData  = require(S.Datas:WaitForChild("Rarities"))
S.AnimalsShared = require(S.Shared:WaitForChild("Animals"))
S.NumberUtils   = require(S.Utils:WaitForChild("NumberUtils"))

S.LocalPlayer = S.Players.LocalPlayer
S.PlayerGui   = S.LocalPlayer:WaitForChild("PlayerGui")

-- ============================================================
-- SECTION 3: GLOBAL STATE
-- ============================================================

local screenGui, mainFrame, contentFrame
local allAnimalsCache = {}
local guiVisible = true
local currentTab = "animals"
local searchQuery = ""
local isCloning = false
local highestAnimal = nil
local statLabels = nil

local ESP_INSTANCES = {}
local PLAYER_ESP = {}
local ESP_BEST_UID = nil

local stats = {
    totalAnimals  = 0,
    totalValue    = 0,
    highestGen    = 0,
    mutationCount = 0,
    traitCount    = 0,
}

local scannerConnections = {}
local plotChannels = {}
local lastAnimalData = {}

local floatPlatform = nil
local invisibleWallsLoaded = false
local originalTransparency = {}

local InternalStealCache = {}
local AUTO_STEAL_PROX_RADIUS = 20
local PromptMemoryCache = {}
local LastTargetUID = nil
local LastPlayerPosition = nil
local PlayerVelocity = Vector3.zero
local PREDICTION_LOOKAHEAD = 1.25 -- seconds

local STEAL_SPEED = 25.5
local stealSpeedConn = nil

local PLAYER_OUTLINE_MAIN = Color3.fromRGB(220, 120, 255)  -- Vibrant purple
local PLAYER_OUTLINE_SOFT = Color3.new(0.345098, 0.066667, 0.952941)  -- Soft blue

local tweenInfoFast   = TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
local tweenInfoMedium = TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)

-- ============================================================
-- SECTION 4: CORE HELPER FUNCTIONS
-- ============================================================

local function blendColor(c1, c2, alpha)
    return Color3.new(
        c1.R + (c2.R - c1.R) * alpha,
        c1.G + (c2.G - c1.G) * alpha,
        c1.B + (c2.B - c1.B) * alpha
    )
end

local function applyTitanzTextStyle(el)
    if not el then return end
    if el:IsA("TextLabel") or el:IsA("TextButton") or el:IsA("TextBox") then
        el.TextStrokeColor3 = COLORS.Accent
        local size = el.TextSize
        if el.TextScaled then
            size = math.floor((el.AbsoluteSize.Y / 24) * 18)
        end
        if size <= 14 then
            el.TextStrokeTransparency = 0.65
        elseif size <= 18 then
            el.TextStrokeTransparency = 0.45
        else
            el.TextStrokeTransparency = 0.25
        end
    end
end

local function applyTitanzButtonStyle(frame)
    if not frame or not (frame:IsA("Frame") or frame:IsA("TextButton")) then return end
    
    frame.BackgroundColor3 = blendColor(COLORS.Surface, COLORS.Accent, 0.10)
    frame.BackgroundTransparency = math.clamp(COLORS.SurfaceTransparency + 0.15, 0, 1)
    
    local border = frame:FindFirstChild("TitanzBorder")
    if not border then
        border = Instance.new("UIStroke")
        border.Name = "TitanzBorder"
        border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        border.Parent = frame
    end
    border.Thickness = 1.5
    border.Color = COLORS.Accent
    border.Transparency = 0.35
    
    if not frame:FindFirstChild("TitanzShadow") then
        local corner = Instance.new("UICorner")
        corner.Name = "TitanzShadow"
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = frame
    end
end

local function createElement(className, properties)
    local el = Instance.new(className)
    for k, v in pairs(properties) do
        el[k] = v
    end
    applyTitanzTextStyle(el)
    return el
end

local function tween(el, info, props)
    S.TweenService:Create(el, info, props):Play()
end

local glowingTexts = {}

local function makeTextGlow(textElement, color1, color2, duration, delay)
    color1 = color1 or COLORS.Purple
    color2 = color2 or Color3.fromRGB(255, 100, 255)
    duration = duration or 1.2
    delay = delay or 0
    
    table.insert(glowingTexts, textElement)
    
    task.spawn(function()
        if delay > 0 then task.wait(delay) end
        
        while textElement.Parent do
            tween(textElement, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                TextColor3 = color2
            })
            task.wait(duration)
            tween(textElement, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                TextColor3 = color1
            })
            task.wait(duration)
        end
    end)
end

local function addTextGradient(textElement, color1, color2, rotation)
    rotation = rotation or 45
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, color1),
        ColorSequenceKeypoint.new(1, color2)
    })
    gradient.Rotation = rotation
    gradient.Parent = textElement
    
    -- Animated rotating gradient
    task.spawn(function()
        while textElement.Parent and gradient.Parent do
            for rot = rotation, rotation + 360, 2 do
                if not gradient.Parent then break end
                gradient.Rotation = rot
                task.wait(0.03)
            end
        end
    end)
    
    return gradient
end

-- ============================================================
-- NOTIFICATION SYSTEM (REVAMPED)
-- ============================================================

local NOTIFICATION_QUEUE = {}
local NOTIFICATION_ACTIVE = {}
local MAX_NOTIFICATIONS = 5
local NOTIFICATION_DURATION = 3.5

-- Notification types with icons and colors
local NOTIFICATION_TYPES = {
    success = {
        icon = "✓",
        color = COLORS.Success,
        gradient = Color3.fromRGB(100, 255, 150)
    },
    error = {
        icon = "✗",
        color = COLORS.Error,
        gradient = Color3.fromRGB(255, 100, 120)
    },
    warning = {
        icon = "⚠",
        color = COLORS.Warning,
        gradient = Color3.fromRGB(255, 200, 50)
    },
    info = {
        icon = "ℹ",
        color = COLORS.Cyan,
        gradient = Color3.fromRGB(100, 200, 255)
    },
    default = {
        icon = "•",
        color = COLORS.Accent,
        gradient = COLORS.Purple
    }
}

local function getNotificationType(color)
    if not color then return NOTIFICATION_TYPES.default end
    
    -- Match color to type
    if color == COLORS.Pink then return NOTIFICATION_TYPES.success end
    if color == COLORS.Error or color == COLORS.Pink then return NOTIFICATION_TYPES.error end
    if color == COLORS.Warning or color == COLORS.Pink then return NOTIFICATION_TYPES.warning end
    if color == COLORS.Pink then return NOTIFICATION_TYPES.info end
    
    return NOTIFICATION_TYPES.default
end

local function repositionNotifications()
    local yOffset = -100  -- Start from bottom
    
    for i = #NOTIFICATION_ACTIVE, 1, -1 do  -- Reverse order
        local notif = NOTIFICATION_ACTIVE[i]
        if notif and notif.frame and notif.frame.Parent then
            tween(notif.frame, tweenInfoFast, {
                Position = UDim2.new(1, -1600, 1, yOffset)  -- Bottom-right
            })
            yOffset = yOffset - 85  -- Stack upwards
        end
    end
end

local function removeNotification(notif)
    if not notif or not notif.frame then return end
    
    -- Remove from active list
    for i, n in ipairs(NOTIFICATION_ACTIVE) do
        if n == notif then
            table.remove(NOTIFICATION_ACTIVE, i)
            break
        end
    end
    
    -- Animate out
    tween(notif.frame, tweenInfoMedium, {
        Position = UDim2.new(1, -1600, 1, 100),  -- Slide down-right
        BackgroundTransparency = 1
    })
    
    -- Fade out all children
    for _, child in ipairs(notif.frame:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            tween(child, tweenInfoMedium, { TextTransparency = 1 })
        elseif child:IsA("Frame") or child:IsA("ImageLabel") then
            tween(child, tweenInfoMedium, { BackgroundTransparency = 1 })
        elseif child:IsA("UIStroke") then
            tween(child, tweenInfoMedium, { Transparency = 1 })
        end
    end
    
    task.wait(0.5)
    if notif.frame then
        notif.frame:Destroy()
    end
    
    repositionNotifications()
    
    -- Process queue
    if #NOTIFICATION_QUEUE > 0 then
        local next = table.remove(NOTIFICATION_QUEUE, 1)
        showNotification(next.message, next.color, next.duration)
    end
end

function showNotification(message, color, duration)
    if not screenGui then return end
    
    duration = duration or NOTIFICATION_DURATION
    local notifType = getNotificationType(color)
    
    -- Queue if too many active
    if #NOTIFICATION_ACTIVE >= MAX_NOTIFICATIONS then
        table.insert(NOTIFICATION_QUEUE, {
            message = message,
            color = color,
            duration = duration
        })
        return
    end
    
    local notif = {}
    
    -- Main frame
    notif.frame = createElement("Frame", {
        Size = UDim2.new(0, 360, 0, 75),
        Position = UDim2.new(1, 1600, 1, 100),
        BackgroundColor3 = COLORS.Background,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        Parent = screenGui,
        ZIndex = 999999999999999,
    })
    
    -- Rounded corners
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 14),
        Parent = notif.frame,
    })
    
    -- Gradient border
    local border = createElement("UIStroke", {
        Name = "GradientBorder",
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = 2,
        Transparency = 0.3,
        Parent = notif.frame,
    })
    
    local gradient = createElement("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, notifType.color),
            ColorSequenceKeypoint.new(1, notifType.gradient)
        }),
        Rotation = 45,
        Parent = border,
    })
    
    -- Accent bar (left side)
    local accentBar = createElement("Frame", {
        Size = UDim2.new(0, 5, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = notifType.color,
        BorderSizePixel = 0,
        Parent = notif.frame,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = accentBar,
    })
    
    createElement("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, notifType.color),
            ColorSequenceKeypoint.new(1, notifType.gradient)
        }),
        Rotation = 90,
        Parent = accentBar,
    })
    
    -- Icon
    local icon = createElement("TextLabel", {
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 15, 0.5, -20),
        BackgroundTransparency = 1,
        Text = notifType.icon,
        TextColor3 = notifType.color,
        TextSize = 24,
        Font = Enum.Font.GothamBold,
        TextStrokeTransparency = 0.5,
        TextStrokeColor3 = COLORS.Background,
        Parent = notif.frame,
        ZIndex = 999999999999999,
    })
    makeTextGlow(icon, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(icon, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    -- Message text
    local messageLabel = createElement("TextLabel", {
        Size = UDim2.new(1, -100, 1, -10),
        Position = UDim2.new(0, 60, 0, 5),
        BackgroundTransparency = 1,
        Text = message,
        TextColor3 = COLORS.Text,
        TextSize = 15,
        Font = Enum.Font.GothamSemibold,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        Parent = notif.frame,
        ZIndex = 999999999999999,
    })
    makeTextGlow(messageLabel, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(messageLabel, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzTextStyle(messageLabel)
    
    -- Close button
    local closeButton = createElement("TextButton", {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -40, 0.5, -15),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = 0.3,
        Text = "×",
        TextColor3 = COLORS.TextDim,
        TextSize = 20,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = notif.frame,
        ZIndex = 999999999999999,
    })
    makeTextGlow(closeButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(closeButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    createElement("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = closeButton,
    })
    
    -- Close button hover effect
    closeButton.MouseEnter:Connect(function()
        tween(closeButton, tweenInfoFast, {
            BackgroundTransparency = 0.1,
            TextColor3 = COLORS.Red
        })
    end)
    
    closeButton.MouseLeave:Connect(function()
        tween(closeButton, tweenInfoFast, {
            BackgroundTransparency = 0.3,
            TextColor3 = COLORS.TextDim
        })
    end)
    
    closeButton.MouseButton1Click:Connect(function()
        removeNotification(notif)
    end)
    
    -- Progress bar
    local progressBar = createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 3),
        Position = UDim2.new(0, 0, 1, -3),
        BackgroundColor3 = notifType.color,
        BorderSizePixel = 0,
        Parent = notif.frame,
        ZIndex = 999999999999999,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = progressBar,
    })
    
    createElement("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, notifType.color),
            ColorSequenceKeypoint.new(1, notifType.gradient)
        }),
        Rotation = 0,
        Parent = progressBar,
    })
    
    -- Add to active list
    table.insert(NOTIFICATION_ACTIVE, notif)
    
    -- Animate in
    notif.frame.BackgroundTransparency = 1
    for _, child in ipairs(notif.frame:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            child.TextTransparency = 1
        elseif child:IsA("Frame") and child ~= notif.frame then
            child.BackgroundTransparency = 1
        elseif child:IsA("UIStroke") then
            child.Transparency = 1
        end
    end
    
    local targetY = -100 - (#NOTIFICATION_ACTIVE - 1) * 85  -- Stack upwards

    tween(notif.frame, tweenInfoMedium, {
        Position = UDim2.new(1, -1600, 1, targetY),  -- Bottom-right
        BackgroundTransparency = 0.15
    })
    
    for _, child in ipairs(notif.frame:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            tween(child, tweenInfoMedium, { TextTransparency = 0 })
        elseif child:IsA("Frame") and child ~= notif.frame and child ~= progressBar then
            tween(child, tweenInfoMedium, { BackgroundTransparency = 0 })
        elseif child:IsA("UIStroke") then
            tween(child, tweenInfoMedium, { Transparency = 0.3 })
        end
    end
    
    -- Animate progress bar
    task.spawn(function()
        tween(progressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
            Size = UDim2.new(0, 0, 0, 3)
        })
    end)
    
    -- Auto-remove after duration
    task.delay(duration, function()
        removeNotification(notif)
    end)
end

-- Shorthand functions for specific notification types
local function notifySuccess(message, duration)
    showNotification(message, COLORS.Success, duration)
end

local function notifyError(message, duration)
    showNotification(message, COLORS.Error, duration)
end

local function notifyWarning(message, duration)
    showNotification(message, COLORS.Warning, duration)
end

local function notifyInfo(message, duration)
    showNotification(message, COLORS.Cyan, duration)
end

-- Export to global scope
getgenv().ShowNotification = showNotification
getgenv().NotifySuccess = notifySuccess
getgenv().NotifyError = notifyError
getgenv().NotifyWarning = notifyWarning
getgenv().NotifyInfo = notifyInfo

-- ============================================================
-- SECTION 5: CONFIG MANAGEMENT (REVAMPED)
-- ============================================================

local function saveConfig()
    local serializableConfig = {}
    
    for k, v in pairs(CONFIG) do
        if typeof(v) == "EnumItem" then
            serializableConfig[k] = {
                _type = "EnumItem",
                _enumType = tostring(v.EnumType),
                _name = v.Name
            }
        else
            -- Save all values including nil
            serializableConfig[k] = v
        end
    end
    
    local success, jsonData = pcall(S.HttpService.JSONEncode, S.HttpService, serializableConfig)
    if success then
        writefile(Config.CONFIG_FILE_NAME, jsonData)
        print("[Config] Saved successfully") -- Debug
    else
        warn("[Config] Failed to save:", jsonData)
    end
end

local function loadConfig()
    if not isfile(Config.CONFIG_FILE_NAME) then 
        print("[Config] No config file found, using defaults")
        return 
    end
    
    local success, jsonData = pcall(readfile, Config.CONFIG_FILE_NAME)
    if not success or not jsonData then 
        warn("[Config] Failed to read config file")
        return 
    end
    
    local success2, savedConfig = pcall(S.HttpService.JSONDecode, S.HttpService, jsonData)
    if not success2 or not savedConfig then 
        warn("[Config] Failed to decode config file")
        return 
    end
    
    for k, v in pairs(savedConfig) do
        if type(v) == "table" and v._type == "EnumItem" then
            -- Restore EnumItem
            local enumType = v._enumType
            local enumName = v._name
            
            if enumType == "KeyCode" and Enum.KeyCode[enumName] then
                CONFIG[k] = Enum.KeyCode[enumName]
            end
        else
            -- Load all values including nil
            CONFIG[k] = v
        end
    end
    
    -- Update global reference
    getgenv().BRAINROT_CONFIG = CONFIG
    
    print("[Config] Loaded successfully")
    print("[Config] GUI_POSITION_X:", CONFIG.GUI_POSITION_X)
    print("[Config] GUI_POSITION_Y:", CONFIG.GUI_POSITION_Y)
end

-- Save GUI position
local function saveGuiPosition()
    if not mainFrame then return end
    
    -- Get the actual screen position (accounting for scale)
    local pos = mainFrame.AbsolutePosition
    local scale = 1
    
    -- Check if there's a UIScale applied
    local uiScale = mainFrame:FindFirstChildOfClass("UIScale")
    if uiScale then
        scale = uiScale.Scale
    end
    
    -- Save unscaled position
    CONFIG.GUI_POSITION_X = pos.X / scale
    CONFIG.GUI_POSITION_Y = pos.Y / scale
    
    saveConfig()
end

local miniGuiContainer = nil -- Will be set when mini GUI is created

local function saveMiniGuiPosition()
    if not miniGuiContainer then return end
    
    local pos = miniGuiContainer.AbsolutePosition
    local scale = 1
    
    -- Check if there's a UIScale applied
    local uiScale = miniGuiContainer:FindFirstChildOfClass("UIScale")
    if uiScale then
        scale = uiScale.Scale
    end
    
    -- Save unscaled position
    CONFIG.MINI_GUI_POSITION_X = pos.X / scale
    CONFIG.MINI_GUI_POSITION_Y = pos.Y / scale
    
    saveConfig()
end

local function saveFavorites()
    local success, jsonData = pcall(S.HttpService.JSONEncode, S.HttpService, FAVORITES)
    if success then
        writefile(Config.FAVORITES_FILE, jsonData)
    else
        warn("[Favorites] Failed to save:", jsonData)
    end
end

local function loadFavorites()
    if not isfile(Config.FAVORITES_FILE) then 
        print("[Favorites] No favorites file found")
        return 
    end
    
    local success, jsonData = pcall(readfile, Config.FAVORITES_FILE)
    if not success or not jsonData then 
        warn("[Favorites] Failed to read favorites file")
        return 
    end
    
    local success2, savedFavorites = pcall(S.HttpService.JSONDecode, S.HttpService, jsonData)
    if success2 and savedFavorites then
        for _, name in ipairs(savedFavorites) do
            table.insert(FAVORITES, name)
        end
        
        -- Update global reference
        getgenv().BRAINROT_FAVORITES = FAVORITES
        
        print("[Favorites] Loaded", #FAVORITES, "items")
    else
        warn("[Favorites] Failed to decode favorites file")
    end
end

-- Helper function to update config value
local function updateConfig(key, value)
    CONFIG[key] = value
    getgenv().BRAINROT_CONFIG[key] = value
    saveConfig()
    return true
end

-- Helper function to get config value
local function getConfig(key)
    return CONFIG[key]
end

-- Debug function to print current config
local function debugConfig()
    print("============ CURRENT CONFIG ============")
    for k, v in pairs(CONFIG) do
        print(string.format("%s = %s", k, tostring(v)))
    end
    print("========================================")
end

-- Export helper functions to global scope if needed
getgenv().UpdateBrainrotConfig = updateConfig
getgenv().GetBrainrotConfig = getConfig
getgenv().DebugBrainrotConfig = debugConfig

-- ============================================================
-- SECTION 6: FAVORITES MANAGEMENT
-- ============================================================

local function isFavorite(animalName)
    for _, name in ipairs(FAVORITES) do
        if name:lower() == animalName:lower() then
            return true
        end
    end
    return false
end

local function addFavorite(animalName)
    for _, name in ipairs(FAVORITES) do
        if name:lower() == animalName:lower() then
            if showNotification then
                showNotification("Already in favorites: " .. animalName, COLORS.Yellow)
            end
            return false
        end
    end
    
    table.insert(FAVORITES, animalName)
    saveFavorites()
    
    if showNotification then
        showNotification("⭐ Added to favorites: " .. animalName, COLORS.Cyan)
    end
    
    return true
end

local function removeFavorite(animalName)
    for i, name in ipairs(FAVORITES) do
        if name:lower() == animalName:lower() then
            table.remove(FAVORITES, i)
            saveFavorites()
            if showNotification then
                showNotification("❌ Removed from favorites: " .. animalName, COLORS.Red)
            end
            return true
        end
    end
    return false
end

local function moveFavoriteUp(index)
    if index > 1 and index <= #FAVORITES then
        FAVORITES[index], FAVORITES[index - 1] = FAVORITES[index - 1], FAVORITES[index]
        saveFavorites()
        return true
    end
    return false
end

local function moveFavoriteDown(index)
    if index >= 1 and index < #FAVORITES then
        FAVORITES[index], FAVORITES[index + 1] = FAVORITES[index + 1], FAVORITES[index]
        saveFavorites()
        return true
    end
    return false
end

local function getFavoriteByPriority()
    for _, favName in ipairs(FAVORITES) do
        for _, animal in ipairs(allAnimalsCache) do
            if animal.name:lower() == favName:lower() then
                return animal
            end
        end
    end
    return nil
end

-- ============================================================
-- SECTION 7: DESYNC SYSTEM
-- ============================================================

local function runDesyncEngine()
    for key, value in pairs(DESYNC_FLAGS) do
        pcall(function()
            setfflag(tostring(key), tostring(value))
        end)
    end
end

local function createDesyncIndicator()
    if not screenGui then return end
    
    if screenGui:FindFirstChild("DesyncIndicator") then
        return
    end
    
    local isMobile = S.UserInputService.TouchEnabled and not S.UserInputService.KeyboardEnabled
    local isTablet = S.UserInputService.TouchEnabled and workspace.CurrentCamera.ViewportSize.X >= 768
    
    local indicatorWidth = isMobile and 200 or (isTablet and 220 or 210)
    local indicatorHeight = 50
    
    local indicator = createElement("Frame", {
        Name = "DesyncIndicator",
        Size = UDim2.new(0, indicatorWidth, 0, indicatorHeight),
        Position = UDim2.new(0.5, -indicatorWidth/2, 0, isMobile and 90 or (isTablet and 130 or 125)),
        BackgroundColor3 = COLORS.Background,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        ZIndex = 999999999999999,
        Parent = screenGui,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = indicator,
    })
    
    -- Simple animated border
    local border = createElement("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = 2,
        Color = COLORS.Purple,
        Transparency = 0.3,
        Parent = indicator,
    })
    
    -- Rotating gradient on border
    local gradient = createElement("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 120, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 240, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 120, 255))
        }),
        Rotation = 0,
        Parent = border,
    })
    
    task.spawn(function()
        while indicator.Parent do
            for i = 0, 360, 3 do
                if not indicator.Parent then break end
                gradient.Rotation = i
                task.wait(0.01)
            end
        end
    end)
    
    -- Icon
    local icon = createElement("TextLabel", {
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(0, 12, 0.5, -17.5),
        BackgroundTransparency = 1,
        Text = "BK's",
        TextColor3 = Color3.fromRGB(220, 120, 255),
        TextSize = 22,
        Font = Enum.Font.GothamBold,
        Parent = indicator,
        ZIndex = 999999999999999,
    })
    
    -- Title
    local title = createElement("TextLabel", {
        Size = UDim2.new(1, -55, 0, 20),
        Position = UDim2.new(0, 60, 0, 8),
        BackgroundTransparency = 1,
        Text = "Desync V3",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = isMobile and 13 or 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = indicator,
        ZIndex = 999999999999999,
    })
    makeTextGlow(title, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(title, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzTextStyle(title)
    
    -- Status
    local status = createElement("TextLabel", {
        Size = UDim2.new(1, -55, 0, 16),
        Position = UDim2.new(0, 60, 0, 28),
        BackgroundTransparency = 1,
        Text = "ACTIVE • NO LAGBACK",
        TextColor3 = Color3.fromRGB(120, 255, 200),
        TextSize = isMobile and 10 or 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = indicator,
        ZIndex = 999999999999999,
    })
    makeTextGlow(status, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(status, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzTextStyle(status)
    
    -- Simple glow animation
    task.spawn(function()
        while indicator.Parent do
            tween(icon, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                TextColor3 = Color3.fromRGB(255, 180, 255)
            })
            task.wait(1)
            tween(icon, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                TextColor3 = Color3.fromRGB(220, 120, 255)
            })
            task.wait(1)
        end
    end)
    
    -- Fade in
    indicator.BackgroundTransparency = 1
    border.Transparency = 1
    icon.TextTransparency = 1
    title.TextTransparency = 1
    status.TextTransparency = 1
    
    tween(indicator, tweenInfoMedium, { BackgroundTransparency = 0.15 })
    tween(border, tweenInfoMedium, { Transparency = 0.3 })
    tween(icon, tweenInfoMedium, { TextTransparency = 0 })
    tween(title, tweenInfoMedium, { TextTransparency = 0 })
    tween(status, tweenInfoMedium, { TextTransparency = 0 })
    
    return indicator
end

local function enableDesync()
    task.spawn(runDesyncEngine)
    showNotification("Desync Enabled", COLORS.Accent)
    
    -- Show permanent tuff desync indicator
    task.spawn(createDesyncIndicator)
end

-- ============================================================
-- SECTION 8: ESP SYSTEM
-- ============================================================

local function isMyBaseAnimal(animalData)
    if not animalData or not animalData.plot then
        return false
    end
    
    local plots = workspace:FindFirstChild("Plots")
    if not plots then
        return false
    end
    
    local plot = plots:FindFirstChild(animalData.plot)
    if not plot then
        return false
    end
    
    -- PRIMARY METHOD: Use Synchronizer to check owner (most reliable)
    local channel = S.Synchronizer:Get(plot.Name)
    if channel then
        local owner = channel:Get("Owner")
        if owner then
            -- Check if owner matches LocalPlayer by comparing UserId (more reliable than Name)
            if typeof(owner) == "Instance" and owner:IsA("Player") then
                return owner.UserId == S.LocalPlayer.UserId
            elseif typeof(owner) == "table" and owner.UserId then
                return owner.UserId == S.LocalPlayer.UserId
            elseif typeof(owner) == "Instance" then
                return owner == S.LocalPlayer
            end
        end
    end
    
    -- FALLBACK METHOD: Check PlotSign.YourBase
    local sign = plot:FindFirstChild("PlotSign")
    if sign then
        local yourBase = sign:FindFirstChild("YourBase")
        if yourBase and yourBase:IsA("BillboardGui") then
            return yourBase.Enabled == true
        end
    end
    
    return false
end

local function clearESPForUID(uid)
    local rec = ESP_INSTANCES[uid]
    if not rec then return end
    if rec.highlight then pcall(function() rec.highlight:Destroy() end) end
    if rec.billboard then pcall(function() rec.billboard:Destroy() end) end
    ESP_INSTANCES[uid] = nil
end

local function clearAllESP()
    for uid in pairs(ESP_INSTANCES) do
        clearESPForUID(uid)
    end
    ESP_BEST_UID = nil
end

local function getPodiumWorldPart(animal)
    if not animal.plot or not animal.slot then return nil end
    
    local plot = workspace.Plots:FindFirstChild(animal.plot)
    if not plot then return nil end
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return nil end
    
    local podium = podiums:FindFirstChild(animal.slot)
    if not podium then return nil end
    
    local base = podium:FindFirstChild("Base")
    if not base then return podium end
    
    local spawn = base:FindFirstChild("Spawn")
    return spawn or base or podium
end

local function refreshAllESP()
    if not screenGui then return end
    
    if not CONFIG.ESP_ENABLED then
        clearAllESP()
        return
    end
    
    local activeUIDs = {}
    local bestAnimal = nil
    
    -- Find best animal that's NOT from your base
    for _, animalData in ipairs(allAnimalsCache) do
        if not isMyBaseAnimal(animalData) then
            bestAnimal = animalData
            break
        end
    end
    
    ESP_BEST_UID = bestAnimal and bestAnimal.uid or nil
    
    for _, animalData in ipairs(allAnimalsCache) do
        -- CRITICAL: Skip your own base animals
        if isMyBaseAnimal(animalData) then
            continue
        end
        
        if (animalData.uid == ESP_BEST_UID) or (animalData.genValue >= 50000000) then
            local uid = animalData.uid
            activeUIDs[uid] = true
            
            local rec = ESP_INSTANCES[uid]
            local model = getPodiumWorldPart(animalData)
            
            if not model then
                if rec then clearESPForUID(uid) end
                ESP_INSTANCES[uid] = nil
            else
                if not rec or rec.part ~= model then
                    if rec then clearESPForUID(uid) end
                    
                    rec = { part = model }
                    
                    -- Add highlight for better visibility
                    local highlight = Instance.new("Highlight")
                    highlight.Adornee = model
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.FillTransparency = 0.7
                    highlight.FillColor = Color3.fromRGB(220, 120, 255)
                    highlight.OutlineTransparency = 0.5
                    highlight.OutlineColor = Color3.fromRGB(255, 180, 255)
                    highlight.Parent = screenGui
                    rec.highlight = highlight
                    
                    local bb = Instance.new("BillboardGui")
                    bb.Name = "BrainrotESP"
                    bb.Adornee = model
                    bb.AlwaysOnTop = true
                    bb.Size = UDim2.new(0, 220, 0, 80)
                    bb.SizeOffset = Vector2.new(0, 0)
                    bb.StudsOffset = Vector3.new(0, 3.5, 0)
                    bb.Parent = screenGui
                    
                    -- Background frame with gradient
                    local bgFrame = Instance.new("Frame")
                    bgFrame.Size = UDim2.new(1, 0, 1, 0)
                    bgFrame.BackgroundColor3 = Color3.fromRGB(100, 50, 150)
                    bgFrame.BackgroundTransparency = 0.8
                    bgFrame.BorderSizePixel = 0
                    bgFrame.Parent = bb
                    
                    -- Gradient overlay
                    local gradient = Instance.new("UIGradient")
                    gradient.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 80, 200)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 180, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 200, 150))
                    })
                    gradient.Rotation = 45
                    gradient.Parent = bgFrame
                    
                    local corner = Instance.new("UICorner")
                    corner.CornerRadius = UDim.new(0, 10)
                    corner.Parent = bgFrame
                    
                    local stroke = Instance.new("UIStroke")
                    stroke.Color = Color3.fromRGB(255, 255, 255)
                    stroke.Thickness = 2
                    stroke.Transparency = 0.4
                    stroke.Parent = bgFrame
                    
                    -- Add animated gradient rotation
                    task.spawn(function()
                        while bgFrame.Parent do
                            for rot = 45, 405, 2 do
                                if not bgFrame.Parent then break end
                                gradient.Rotation = rot
                                task.wait(0.03)
                            end
                        end
                    end)
                    
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Size = UDim2.new(1, -10, 0.5, 0)
                    nameLabel.Position = UDim2.new(0, 5, 0, 5)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    nameLabel.TextScaled = true
                    nameLabel.Font = Enum.Font.GothamBold
                    nameLabel.TextStrokeTransparency = 0
                    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    nameLabel.Parent = bgFrame
                    makeTextGlow(nameLabel, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
                    addTextGradient(nameLabel, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
                    applyTitanzTextStyle(nameLabel)
                    
                    local genLabel = Instance.new("TextLabel")
                    genLabel.Size = UDim2.new(1, -10, 0.5, -5)
                    genLabel.Position = UDim2.new(0, 5, 0.5, 0)
                    genLabel.BackgroundTransparency = 1
                    genLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    genLabel.TextScaled = true
                    genLabel.Font = Enum.Font.GothamBold
                    genLabel.TextStrokeTransparency = 0
                    genLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    genLabel.Parent = bgFrame
                    applyTitanzTextStyle(genLabel)
                    
                    rec.billboard = bb
                    rec.labelName = nameLabel
                    rec.labelGen = genLabel
                    
                    ESP_INSTANCES[uid] = rec
                end
                
                rec.labelName.Text = animalData.name
                rec.labelGen.Text = animalData.genText
            end
        end
    end
    
    for uid in pairs(ESP_INSTANCES) do
        if not activeUIDs[uid] then
            clearESPForUID(uid)
        end
    end
end

-- ============================================================
-- SECTION 9: PLAYER ESP
-- ============================================================

local function clearPlayerESP(plr)
    local rec = PLAYER_ESP[plr]
    if not rec then return end
    
    if rec.highlightMain then pcall(function() rec.highlightMain:Destroy() end) end
    if rec.highlightSoft then pcall(function() rec.highlightSoft:Destroy() end) end
    if rec.billboard then pcall(function() rec.billboard:Destroy() end) end
    
    PLAYER_ESP[plr] = nil
end

local function clearAllPlayerESP()
    for plr in pairs(PLAYER_ESP) do
        clearPlayerESP(plr)
    end
end

local function createPlayerESP(plr)
    local char = plr.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char.PrimaryPart
    if not hrp then return end
    
    local rec = {}
    
    local hMain = Instance.new("Highlight")
    hMain.Adornee = char
    hMain.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hMain.FillTransparency = 1
    hMain.OutlineTransparency = 0
    hMain.OutlineColor = PLAYER_OUTLINE_MAIN
    hMain.Parent = screenGui
    rec.highlightMain = hMain
    
    local hSoft = Instance.new("Highlight")
    hSoft.Adornee = char
    hSoft.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hSoft.FillTransparency = 1
    hSoft.OutlineTransparency = 0
    hSoft.OutlineColor = PLAYER_OUTLINE_SOFT
    hSoft.Parent = screenGui
    rec.highlightSoft = hSoft
    
    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0, 160, 0, 32)
    bb.Adornee = hrp
    bb.AlwaysOnTop = true
    bb.StudsOffset = Vector3.new(0, 3.2, 0)
    bb.Parent = screenGui
    rec.billboard = bb
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(120, 240, 255)  -- Bright cyan
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.TextStrokeTransparency = 0.3
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Text = plr.Name
    nameLabel.Parent = bb
    makeTextGlow(nameLabel, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(nameLabel, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzTextStyle(nameLabel)
    rec.nameLabel = nameLabel
    
    PLAYER_ESP[plr] = rec
end

local function refreshPlayerESP()
    if not CONFIG.ESP_PLAYERS_ENABLED then
        clearAllPlayerESP()
        return
    end
    
    for _, plr in ipairs(S.Players:GetPlayers()) do
        if plr ~= S.LocalPlayer then
            if not PLAYER_ESP[plr] then
                createPlayerESP(plr)
            end
        end
    end
    
    local myChar = S.LocalPlayer.Character
    local myHRP = myChar and (myChar:FindFirstChild("HumanoidRootPart") or myChar:FindFirstChild("UpperTorso") or myChar.PrimaryPart)
    
    for plr, rec in pairs(PLAYER_ESP) do
        local char = plr.Character
        local hrp = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char.PrimaryPart)
        
        if not char or not hrp or not myHRP then
            clearPlayerESP(plr)
        else
            local dist = (myHRP.Position - hrp.Position).Magnitude
            local distInt = math.floor(dist + 0.5)
            
            if rec.nameLabel then
                rec.nameLabel.Text = string.format("%s [%dm]", plr.Name, distInt)
            end
        end
    end
end

local function playerESPHeartbeat()
    if CONFIG.ESP_PLAYERS_ENABLED then
        refreshPlayerESP()
    end
end

-- ============================================================
-- SECTION 10: FLOOR STEAL & INVISIBLE WALLS
-- ============================================================

local function getHRP()
    local c = S.LocalPlayer.Character
    if not c then return end
    return c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("UpperTorso")
end

local function startFloorSteal()
    if floatPlatform then floatPlatform:Destroy() end
    
    floatPlatform = Instance.new("Part")
    floatPlatform.Size = Vector3.new(6, 1, 6)
    floatPlatform.Anchored = true
    floatPlatform.CanCollide = true
    floatPlatform.Transparency = 1
    floatPlatform.Parent = workspace
    
    task.spawn(function()
        while CONFIG.FLOOR_STEAL_ENABLED and floatPlatform do
            local hrp = getHRP()
            if hrp then
                floatPlatform.Position = hrp.Position - Vector3.new(0, 3, 0)
            end
            task.wait(0.05)
        end
    end)
end

local function stopFloorSteal()
    if floatPlatform then
        floatPlatform:Destroy()
        floatPlatform = nil
    end
end

local function isBaseWall(obj)
    if not obj:IsA("BasePart") then return false end
    local n = obj.Name:lower()
    local parent = obj.Parent and obj.Parent.Name:lower() or ""
    return n:find("base") or parent:find("base")
end

local function tryApplyInvisibleWalls()
    if not CONFIG.INVISIBLE_BASE_WALLS_ENABLED then return end
    
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return end
    if #plots:GetChildren() == 0 then return end
    
    if invisibleWallsLoaded then return end
    invisibleWallsLoaded = true
    
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Anchored and obj.CanCollide and isBaseWall(obj) then
            originalTransparency[obj] = obj.LocalTransparencyModifier
            obj.LocalTransparencyModifier = 0.85
        end
    end
    
    workspace.DescendantAdded:Connect(function(obj)
        if CONFIG.INVISIBLE_BASE_WALLS_ENABLED and isBaseWall(obj) then
            originalTransparency[obj] = obj.LocalTransparencyModifier
            obj.LocalTransparencyModifier = 0.85
        end
    end)
end

local function enableInvisibleBaseWalls()
    CONFIG.INVISIBLE_BASE_WALLS_ENABLED = true
    
    task.spawn(function()
        for _ = 1, 20 do
            tryApplyInvisibleWalls()
            if invisibleWallsLoaded then return end
            task.wait(0.5)
        end
    end)
end

local function disableInvisibleBaseWalls()
    CONFIG.INVISIBLE_BASE_WALLS_ENABLED = false
    invisibleWallsLoaded = false
    
    for part, value in pairs(originalTransparency) do
        if part then
            part.LocalTransparencyModifier = value
        end
    end
    originalTransparency = {}
end

-- ============================================================
-- SECTION 11: AUTO-STEAL SYSTEM (WITH PREDICTION)
-- ============================================================

local function findProximityPromptForAnimal(animalData)
    if not animalData then return nil end
    
    local cachedPrompt = PromptMemoryCache[animalData.uid]
    if cachedPrompt and cachedPrompt.Parent then
        return cachedPrompt
    end
    
    local plot = workspace.Plots:FindFirstChild(animalData.plot)
    if not plot then return nil end
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return nil end
    
    local podium = podiums:FindFirstChild(animalData.slot)
    if not podium then return nil end
    
    local base = podium:FindFirstChild("Base")
    if not base then return nil end
    
    local spawn = base:FindFirstChild("Spawn")
    if not spawn then return nil end
    
    local attach = spawn:FindFirstChild("PromptAttachment")
    if not attach then return nil end
    
    for _, p in ipairs(attach:GetChildren()) do
        if p:IsA("ProximityPrompt") then
            PromptMemoryCache[animalData.uid] = p
            return p
        end
    end
    
    return nil
end

local function getAnimalPosition(animalData)
    local plot = workspace.Plots:FindFirstChild(animalData.plot)
    if not plot then return nil end
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return nil end
    
    local podium = podiums:FindFirstChild(animalData.slot)
    if not podium then return nil end
    
    return podium:GetPivot().Position
end

local function getNearestAnimal()
    local hrp = getHRP()
    if not hrp then return nil end
    
    local nearest = nil
    local minDist = math.huge
    
    for _, animalData in ipairs(allAnimalsCache) do
        -- CRITICAL: Skip your own base animals
        if isMyBaseAnimal(animalData) then
            continue
        end
        
        local pos = getAnimalPosition(animalData)
        if pos then
            local dist = (hrp.Position - pos).Magnitude
            
            if dist < minDist then
                minDist = dist
                nearest = animalData
            end
        end
    end
    
    return nearest
end

-- Calculate player velocity for prediction
local function updatePlayerVelocity()
    local hrp = getHRP()
    if not hrp then return end
    
    local currentPos = hrp.Position
    
    if LastPlayerPosition then
        PlayerVelocity = (currentPos - LastPlayerPosition) / task.wait()
    end
    
    LastPlayerPosition = currentPos
end

-- Predict time until player reaches target
local function getTimeToReach(targetPos)
    local hrp = getHRP()
    if not hrp then return math.huge end
    
    local currentPos = hrp.Position
    local distance = (targetPos - currentPos).Magnitude
    
    -- If not moving, return infinite time
    if PlayerVelocity.Magnitude < 0.1 then
        return math.huge
    end
    
    -- Calculate direction to target
    local directionToTarget = (targetPos - currentPos).Unit
    
    -- Project velocity onto direction to target
    local velocityTowardTarget = PlayerVelocity:Dot(directionToTarget)
    
    -- If moving away from target, return infinite time
    if velocityTowardTarget <= 0 then
        return math.huge
    end
    
    -- Calculate time to reach
    return distance / velocityTowardTarget
end

-- Check if we should pre-fire based on prediction
local function shouldPreFire(animalData)
    local animalPos = getAnimalPosition(animalData)
    if not animalPos then return false end
    
    local hrp = getHRP()
    if not hrp then return false end
    
    local currentDistance = (hrp.Position - animalPos).Magnitude
    
    -- Always fire if in range
    if currentDistance <= AUTO_STEAL_PROX_RADIUS then
        return true
    end
    
    -- Check prediction if enabled
    if not CONFIG.PREDICTIVE_STEAL then
        return false
    end
    
    local timeToReach = getTimeToReach(animalPos)
    
    if timeToReach <= PREDICTION_LOOKAHEAD and timeToReach > 0 then
        return true
    end
    
    return false
end

local function buildStealCallbacks(prompt)
    if InternalStealCache[prompt] then return end
    
    local data = {
        holdCallbacks = {},
        triggerCallbacks = {},
        ready = true,
    }
    
    local ok1, conns1 = pcall(getconnections, prompt.PromptButtonHoldBegan)
    if ok1 and type(conns1) == "table" then
        for _, conn in ipairs(conns1) do
            if type(conn.Function) == "function" then
                table.insert(data.holdCallbacks, conn.Function)
            end
        end
    end
    
    local ok2, conns2 = pcall(getconnections, prompt.Triggered)
    if ok2 and type(conns2) == "table" then
        for _, conn in ipairs(conns2) do
            if type(conn.Function) == "function" then
                table.insert(data.triggerCallbacks, conn.Function)
            end
        end
    end
    
    if (#data.holdCallbacks > 0) or (#data.triggerCallbacks > 0) then
        InternalStealCache[prompt] = data
    end
end

local function runCallbackList(list)
    for _, fn in ipairs(list) do
        task.spawn(fn)
    end
end

-- OPTIMIZED: Non-blocking async execution
local function executeInternalStealAsync(prompt)
    local data = InternalStealCache[prompt]
    if not data or not data.ready then return false end
    
    data.ready = false
    
    task.spawn(function()
        if #data.holdCallbacks > 0 then
            runCallbackList(data.holdCallbacks)
        end
        
        task.wait(1.3)
        
        if #data.triggerCallbacks > 0 then
            runCallbackList(data.triggerCallbacks)
        end
        
        task.wait()
        data.ready = true
    end)
    
    return true
end

local function attemptSteal(prompt)
    if not prompt or not prompt.Parent then
        return false
    end
    
    buildStealCallbacks(prompt)
    if not InternalStealCache[prompt] then
        return false
    end
    
    return executeInternalStealAsync(prompt)
end

-- Pre-build callbacks in background
local function prebuildStealCallbacks()
    for uid, prompt in pairs(PromptMemoryCache) do
        if prompt and prompt.Parent then
            buildStealCallbacks(prompt)
        end
    end
end

task.spawn(function()
    while task.wait() do
        if CONFIG.AUTO_STEAL_ENABLED or CONFIG.AUTO_STEAL_NEAREST_ENABLED then
            prebuildStealCallbacks()
        end
    end
end)

local function getPriorityAnimal()
    for _, priorityName in ipairs(PRIORITY_ANIMALS) do
        for _, animalData in ipairs(allAnimalsCache) do
            -- CRITICAL: Skip your own base animals
            if not isMyBaseAnimal(animalData) and animalData.name == priorityName then
                return animalData
            end
        end
    end
    return nil
end

local stealConnection = nil
local velocityConnection = nil

local function autoStealLoop()
    if stealConnection then
        stealConnection:Disconnect()
    end
    if velocityConnection then
        velocityConnection:Disconnect()
    end
    
    velocityConnection = S.RunService.Heartbeat:Connect(function()
        updatePlayerVelocity()
    end)
    
    stealConnection = S.RunService.Heartbeat:Connect(function()
        if not CONFIG.AUTO_STEAL_ENABLED and not CONFIG.AUTO_STEAL_NEAREST_ENABLED and not CONFIG.AUTO_STEAL_PRIORITY_ENABLED then
            return
        end
        
        local targetAnimal = nil
        
        if CONFIG.AUTO_STEAL_PRIORITY_ENABLED then
            targetAnimal = getPriorityAnimal()
            
            if not targetAnimal then
                if CONFIG.AUTO_STEAL_NEAREST_ENABLED then
                    targetAnimal = getNearestAnimal()
                elseif CONFIG.AUTO_STEAL_ENABLED then
                    -- Find first non-owned animal
                    for _, animal in ipairs(allAnimalsCache) do
                        if not isMyBaseAnimal(animal) then
                            targetAnimal = animal
                            break
                        end
                    end
                end
            end
        elseif CONFIG.AUTO_STEAL_NEAREST_ENABLED then
            targetAnimal = getNearestAnimal()
        elseif CONFIG.AUTO_STEAL_ENABLED then
            -- Find first non-owned animal
            for _, animal in ipairs(allAnimalsCache) do
                if not isMyBaseAnimal(animal) then
                    targetAnimal = animal
                    break
                end
            end
        end
        
        -- CRITICAL: Double-check target is not your own
        if not targetAnimal or isMyBaseAnimal(targetAnimal) then
            return
        end
        
        if not shouldPreFire(targetAnimal) then
            return
        end
        
        if LastTargetUID ~= targetAnimal.uid then
            LastTargetUID = targetAnimal.uid
        end
        
        local prompt = PromptMemoryCache[targetAnimal.uid]
        if not prompt or not prompt.Parent then
            prompt = findProximityPromptForAnimal(targetAnimal)
        end
        
        if prompt then
            attemptSteal(prompt)
        end
    end)
end

local function setupPromptCacheCleanup()
    local plots = workspace:WaitForChild("Plots", 8)
    if not plots then return end
    
    plots.ChildRemoved:Connect(function(plot)
        for uid, prompt in pairs(PromptMemoryCache) do
            if uid:find(plot.Name) then
                PromptMemoryCache[uid] = nil
            end
        end
    end)
end

-- ============================================================
-- SECTION 11.5: SPEED BOOST SYSTEM
-- ============================================================

local function startStealSpeed()
    if stealSpeedConn then return end

    stealSpeedConn = S.RunService.Heartbeat:Connect(function()
        if not CONFIG.STEAL_SPEED_ENABLED then return end
        if not S.LocalPlayer:GetAttribute("Stealing") then return end

        local char = S.LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end

        -- Only move if the player is actually pressing movement
        local move = hum.MoveDirection
        if move.Magnitude > 0 then
            hrp.AssemblyLinearVelocity = Vector3.new(
                move.X * STEAL_SPEED,
                hrp.AssemblyLinearVelocity.Y,
                move.Z * STEAL_SPEED
            )
        end
    end)
end

local function stopStealSpeed()
    if stealSpeedConn then
        stealSpeedConn:Disconnect()
        stealSpeedConn = nil
    end
end

S.LocalPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()
    if S.LocalPlayer:GetAttribute("Stealing") then
        startStealSpeed()
    else
        stopStealSpeed()
    end
end)

-- ============================================================
-- SECTION 11.6: ANIMATION DISABLER SYSTEM
-- ============================================================

local animDisableConn = nil
local originalAnimIds = {}
local animateScript = nil

local ANIM_TYPES = {
    "walk", "run", "jump", "fall"
}

local function cacheOriginalAnimations()
    local char = S.LocalPlayer.Character
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
    
    local char = S.LocalPlayer.Character
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

local function startAnimDisable()
    if animDisableConn then return end
    
    -- Cache animations on first run
    if not next(originalAnimIds) then
        if not cacheOriginalAnimations() then
            warn("[Anim Disable] Failed to cache animations")
            return
        end
    end

    animDisableConn = S.RunService.Heartbeat:Connect(function()
        if not CONFIG.STEAL_DISABLE_ANIM_ENABLED then return end
        if not S.LocalPlayer:GetAttribute("Stealing") then return end

        disableAnimations()
    end)
end

local function stopAnimDisable()
    if animDisableConn then
        animDisableConn:Disconnect()
        animDisableConn = nil
    end
    restoreAnimations()
end

-- Monitor stealing state for animations
S.LocalPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()
    if S.LocalPlayer:GetAttribute("Stealing") then
        if CONFIG.STEAL_DISABLE_ANIM_ENABLED then
            startAnimDisable()
        end
    else
        stopAnimDisable()
    end
end)

-- Re-cache animations on respawn
S.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1) -- Wait for Animate script to load
    originalAnimIds = {}
    animateScript = nil
    cacheOriginalAnimations()
end)

-- ============================================================
-- SECTION 12: OPTIMIZER MODULE (ULTRA POTATO MODE)
-- ============================================================

local OPTIMIZER = {}
local optimizerThreads = {}
local optimizerConnections = {}
local originalSettings = {}

local function addThread(func)
    local t = task.spawn(func)
    table.insert(optimizerThreads, t)
    return t
end

local function addConnection(conn)
    table.insert(optimizerConnections, conn)
    return conn
end

-- Store original settings for restoration
local function storeOriginalSettings()
    pcall(function()
        originalSettings = {
            -- Workspace
            streamingEnabled = workspace.StreamingEnabled,
            streamingMinRadius = workspace.StreamingMinRadius,
            streamingTargetRadius = workspace.StreamingTargetRadius,
            
            -- Rendering
            qualityLevel = settings().Rendering.QualityLevel,
            meshPartDetailLevel = settings().Rendering.MeshPartDetailLevel,
            
            -- Lighting
            globalShadows = S.Lighting.GlobalShadows,
            brightness = S.Lighting.Brightness,
            fogEnd = S.Lighting.FogEnd,
            technology = S.Lighting.Technology,
            environmentDiffuseScale = S.Lighting.EnvironmentDiffuseScale,
            environmentSpecularScale = S.Lighting.EnvironmentSpecularScale,
            
            -- Terrain
            decoration = workspace.Terrain.Decoration,
            waterWaveSize = workspace.Terrain.WaterWaveSize,
            waterWaveSpeed = workspace.Terrain.WaterWaveSpeed,
            waterReflectance = workspace.Terrain.WaterReflectance,
            waterTransparency = workspace.Terrain.WaterTransparency,
        }
    end)
end

local PERFORMANCE_FFLAGS = {
    -- Rendering optimizations (ULTRA LOW)
    ["DFIntTaskSchedulerTargetFps"] = 999,
    ["FFlagDebugGraphicsPreferVulkan"] = true,
    ["FFlagDebugGraphicsDisableDirect3D11"] = true,
    ["FFlagDebugGraphicsPreferD3D11FL10"] = false,
    ["DFFlagDebugRenderForceTechnologyVoxel"] = true,
    ["FFlagDisablePostFx"] = true,
    ["FIntRenderShadowIntensity"] = 0,
    ["FIntRenderLocalLightUpdatesMax"] = 0,
    ["FIntRenderLocalLightUpdatesMin"] = 0,
    ["DFIntTextureCompositorActiveJobs"] = 1,
    ["DFIntDebugFRMQualityLevelOverride"] = 1,
    
    -- Physics optimizations
    ["FFlagFixPlayerCollisionWhenSwimming"] = false,
    ["DFIntMaxInterpolationSubsteps"] = 0,
    ["DFIntS2PhysicsSenderRate"] = 15,
    
    -- Network optimizations
    ["DFIntConnectionMTUSize"] = 1492,
    ["DFIntHttpCurlConnectionCacheSize"] = 134217728,
    
    -- Memory optimizations (AGGRESSIVE)
    ["DFIntCSGLevelOfDetailSwitchingDistance"] = 0,
    ["DFIntCSGLevelOfDetailSwitchingDistanceL12"] = 0,
    ["DFIntCSGLevelOfDetailSwitchingDistanceL23"] = 0,
    ["DFIntCSGLevelOfDetailSwitchingDistanceL34"] = 0,
    
    -- Disable unnecessary features
    ["FFlagEnableInGameMenuChromeABTest3"] = false,
    ["FFlagEnableInGameMenuModernization"] = false,
    ["FFlagEnableReportAbuseMenuRoactABTest2"] = false,
    ["FFlagDisableNewIGMinDUA"] = true,
    ["FFlagEnableAccessoryValidation"] = false,
    ["FFlagEnableV3MenuABTest3"] = false,
    
    -- UI optimizations (MINIMAL)
    ["FIntRobloxGuiBlurIntensity"] = 0,
    ["DFIntTimestepArbiterThresholdCFLThou"] = 10,
    
    -- Texture/graphics optimizations (POTATO)
    ["DFIntTextureQualityOverride"] = 1,
    ["DFIntPerformanceControlTextureQualityBestUtility"] = 1,
    ["DFIntTexturePoolSizeMB"] = 64,
    
    -- Animation optimizations
    ["DFIntMaxFrameBufferSize"] = 1,
    
    -- Particle optimizations
    ["FFlagDebugDisableParticleRendering"] = false, -- Can't fully disable or game breaks
    ["DFIntParticleMaxCount"] = 100,
    
    -- Water optimizations
    ["FFlagEnableWaterReflections"] = false,
    ["DFIntWaterReflectionQuality"] = 0,
}

local function applyFFlags()
    local success = 0
    local failed = 0
    
    for flag, value in pairs(PERFORMANCE_FFLAGS) do
        local ok = pcall(function()
            setfflag(flag, tostring(value))
        end)
        
        if ok then
            success = success + 1
        else
            failed = failed + 1
        end
    end
    
    print(string.format("[Optimizer] Applied %d/%d FFlags", success, success + failed))
end

-- ULTRA POTATO: Destroy all visual effects in workspace
local function nukeVisualEffects()
    pcall(function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            pcall(function()
                -- Destroy ALL particles
                if obj:IsA("ParticleEmitter") then
                    obj.Enabled = false
                    obj.Rate = 0
                    obj:Destroy()
                    
                -- Destroy trails
                elseif obj:IsA("Trail") then
                    obj.Enabled = false
                    obj:Destroy()
                    
                -- Destroy beams
                elseif obj:IsA("Beam") then
                    obj.Enabled = false
                    obj:Destroy()
                    
                -- Destroy all lights
                elseif obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                    obj.Enabled = false
                    obj.Brightness = 0
                    obj:Destroy()
                    
                -- Destroy fire, smoke, sparkles
                elseif obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
                    obj.Enabled = false
                    obj:Destroy()
                    
                -- Destroy explosions
                elseif obj:IsA("Explosion") then
                    obj:Destroy()
                    
                -- Simplify meshes
                elseif obj:IsA("SpecialMesh") then
                    obj.TextureId = ""
                    
                -- Remove textures/decals (except faces)
                elseif obj:IsA("Decal") or obj:IsA("Texture") then
                    if not (obj.Name == "face" and obj.Parent and obj.Parent.Name == "Head") then
                        obj.Transparency = 1
                    end
                    
                -- Disable shadows on all parts
                elseif obj:IsA("BasePart") then
                    obj.CastShadow = false
                    obj.Material = Enum.Material.Plastic -- Cheapest material
                    
                    -- Remove reflectance
                    if obj.Material == Enum.Material.Glass then
                        obj.Reflectance = 0
                    end
                end
            end)
        end
    end)
end

function OPTIMIZER.Enable()
    if getgenv().OPTIMIZER_ACTIVE then 
        warn("[Optimizer] Already running!")
        return 
    end
    
    getgenv().OPTIMIZER_ACTIVE = true
    storeOriginalSettings()
    
    -- Apply FFlags first
    pcall(applyFFlags)
    
    -- 1. ULTRA POTATO Streaming
    pcall(function()
        workspace.StreamingEnabled = true
        workspace.StreamingMinRadius = 64
        workspace.StreamingTargetRadius = 256
        workspace.StreamingIntegrityMode = Enum.StreamingIntegrityMode.MinimumRadiusPause
    end)
    
    -- 2. ULTRA POTATO Rendering
    pcall(function()
        local renderSettings = settings().Rendering
        renderSettings.QualityLevel = Enum.QualityLevel.Level01
        renderSettings.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
        renderSettings.EditQualityLevel = Enum.QualityLevel.Level01
        
        -- Disable ALL lighting effects
        S.Lighting.GlobalShadows = false
        S.Lighting.Brightness = 3 -- Max brightness = no shadows needed
        S.Lighting.FogEnd = 9e9
        S.Lighting.Technology = Enum.Technology.Legacy -- Cheapest lighting
        S.Lighting.EnvironmentDiffuseScale = 0
        S.Lighting.EnvironmentSpecularScale = 0
        
        -- Disable ALL post-processing effects
        for _, effect in ipairs(S.Lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                pcall(function() 
                    effect.Enabled = false 
                    effect:Destroy()
                end)
            end
        end
        
        -- Remove atmosphere
        local atmo = S.Lighting:FindFirstChildOfClass("Atmosphere")
        if atmo then atmo:Destroy() end
        
        -- Remove bloom
        local bloom = S.Lighting:FindFirstChildOfClass("BloomEffect")
        if bloom then bloom:Destroy() end
        
        -- Remove blur
        local blur = S.Lighting:FindFirstChildOfClass("BlurEffect")
        if blur then blur:Destroy() end
        
        -- Remove color correction
        local cc = S.Lighting:FindFirstChildOfClass("ColorCorrectionEffect")
        if cc then cc:Destroy() end
        
        -- Remove sun rays
        local sunrays = S.Lighting:FindFirstChildOfClass("SunRaysEffect")
        if sunrays then sunrays:Destroy() end
        
        -- Remove depth of field
        local dof = S.Lighting:FindFirstChildOfClass("DepthOfFieldEffect")
        if dof then dof:Destroy() end
    end)
    
    -- 3. ULTRA POTATO Physics
    pcall(function()
        local physics = settings().Physics
        physics.AllowSleep = true
        physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Skip
        physics.ThrottleAdjustTime = 0
    end)
    
    -- 4. POTATO Terrain
    pcall(function()
        workspace.Terrain.WaterWaveSize = 0
        workspace.Terrain.WaterWaveSpeed = 0
        workspace.Terrain.WaterReflectance = 0
        workspace.Terrain.WaterTransparency = 1
        workspace.Terrain.Decoration = false
    end)
    
    -- 5. NUKE all visual effects (one-time aggressive pass)
    addThread(function()
        task.wait(1)
        nukeVisualEffects()
    end)
    
    -- 6. Monitor for NEW visual effects and destroy them
    addConnection(workspace.DescendantAdded:Connect(function(obj)
        if not getgenv().OPTIMIZER_ACTIVE then return end
        
        pcall(function()
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or
               obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") or
               obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") or obj:IsA("Explosion") then
                obj:Destroy()
            elseif obj:IsA("BasePart") then
                obj.CastShadow = false
                obj.Material = Enum.Material.Plastic
            end
        end)
    end))
    
    -- 7. Character optimizer (event-based, ULTRA POTATO)
    local function optimizeCharacter(char)
        if not char then return end
        
        task.spawn(function()
            task.wait(0.5)
            
            pcall(function()
                for _, part in ipairs(char:GetDescendants()) do
                    pcall(function()
                        if part:IsA("BasePart") then
                            part.CastShadow = false
                            part.Material = Enum.Material.Plastic
                            part.Reflectance = 0
                            
                        elseif part:IsA("ParticleEmitter") or part:IsA("Trail") or part:IsA("Beam") then
                            part:Destroy()
                            
                        elseif part:IsA("PointLight") or part:IsA("SpotLight") or part:IsA("SurfaceLight") then
                            part:Destroy()
                            
                        elseif part:IsA("Fire") or part:IsA("Smoke") or part:IsA("Sparkles") then
                            part:Destroy()
                        end
                    end)
                end
            end)
        end)
    end
    
    -- Optimize current characters
    for _, player in ipairs(S.Players:GetPlayers()) do
        if player.Character then
            optimizeCharacter(player.Character)
        end
        
        addConnection(player.CharacterAdded:Connect(function(char)
            if getgenv().OPTIMIZER_ACTIVE then
                optimizeCharacter(char)
            end
        end))
    end
    
    addConnection(S.Players.PlayerAdded:Connect(function(player)
        addConnection(player.CharacterAdded:Connect(function(char)
            if getgenv().OPTIMIZER_ACTIVE then
                optimizeCharacter(char)
            end
        end))
    end))
    
    -- 8. Memory cleanup (less aggressive - every 15 seconds)
    addThread(function()
        while getgenv().OPTIMIZER_ACTIVE do
            task.wait(15)
            
            pcall(function()
                collectgarbage("collect")
            end)
        end
    end)
    
    -- 9. FPS Unlocker
    pcall(function()
        setfpscap(999)
    end)
    
    -- 10. Disable camera shake/effects
    pcall(function()
        local cam = workspace.CurrentCamera
        cam.FieldOfView = 70
    end)
    
    showNotification("ULTRA POTATO Optimizer Enabled", COLORS.Success)
end

function OPTIMIZER.Disable()
    if not getgenv().OPTIMIZER_ACTIVE then return end
    
    getgenv().OPTIMIZER_ACTIVE = false
    
    -- Cancel all threads
    for _, thread in ipairs(optimizerThreads) do
        pcall(function()
            task.cancel(thread)
        end)
    end
    optimizerThreads = {}
    
    -- Disconnect all connections
    for _, conn in ipairs(optimizerConnections) do
        pcall(function()
            conn:Disconnect()
        end)
    end
    optimizerConnections = {}
    
    -- Restore original settings
    pcall(function()
        workspace.StreamingEnabled = originalSettings.streamingEnabled or true
        workspace.StreamingMinRadius = originalSettings.streamingMinRadius or 64
        workspace.StreamingTargetRadius = originalSettings.streamingTargetRadius or 1024
        
        settings().Rendering.QualityLevel = originalSettings.qualityLevel or Enum.QualityLevel.Automatic
        settings().Rendering.MeshPartDetailLevel = originalSettings.meshPartDetailLevel or Enum.MeshPartDetailLevel.DistanceBased
        
        S.Lighting.GlobalShadows = originalSettings.globalShadows ~= false
        S.Lighting.Brightness = originalSettings.brightness or 1
        S.Lighting.FogEnd = originalSettings.fogEnd or 100000
        S.Lighting.Technology = originalSettings.technology or Enum.Technology.ShadowMap
        S.Lighting.EnvironmentDiffuseScale = originalSettings.environmentDiffuseScale or 1
        S.Lighting.EnvironmentSpecularScale = originalSettings.environmentSpecularScale or 1
        
        workspace.Terrain.WaterWaveSize = originalSettings.waterWaveSize or 0.15
        workspace.Terrain.WaterWaveSpeed = originalSettings.waterWaveSpeed or 10
        workspace.Terrain.WaterReflectance = originalSettings.waterReflectance or 1
        workspace.Terrain.WaterTransparency = originalSettings.waterTransparency or 0.3
        workspace.Terrain.Decoration = originalSettings.decoration ~= false
    end)
    
    showNotification("Optimizer Disabled", COLORS.Red)
end

-- ============================================================
-- SECTION 13: ANTI-LAG SYSTEM (OPTIMIZED)
-- ============================================================

local ANTI_LAG = {}
local antiLagRunning = false
local antiLagConnections = {}
local cleanedCharacters = {} -- Track already cleaned characters

-- Comprehensive cleanup function for characters
local function destroyAllEquippableItems(character)
    if not character then return end
    if not CONFIG.ANTI_LAG_ENABLED then return end
    
    pcall(function()
        -- Remove all accessories (hats, hair, face accessories, etc.)
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("Accessory") or child:IsA("Hat") then
                child:Destroy()
            end
        end
        
        -- Remove clothing
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("Shirt") or child:IsA("Pants") or child:IsA("ShirtGraphic") then
                child:Destroy()
            end
        end
        
        -- Remove body colors
        local bodyColors = character:FindFirstChildOfClass("BodyColors")
        if bodyColors then
            bodyColors:Destroy()
        end
        
        -- Remove character meshes
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("CharacterMesh") then
                child:Destroy()
            end
        end
        
        -- Remove layered clothing (modern avatar items)
        for _, child in ipairs(character:GetDescendants()) do
            if child.ClassName == "LayeredClothing" or child.ClassName == "WrapLayer" then
                child:Destroy()
            end
        end
        
        -- Remove special meshes from body parts
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("BasePart") then
                local mesh = child:FindFirstChildOfClass("SpecialMesh")
                if mesh then
                    mesh:Destroy()
                end
            end
        end
        
        -- Remove all particle effects
        for _, child in ipairs(character:GetDescendants()) do
            if child:IsA("ParticleEmitter") or child:IsA("Trail") or child:IsA("Beam") then
                child:Destroy()
            end
        end
        
        -- Remove all light sources
        for _, child in ipairs(character:GetDescendants()) do
            if child:IsA("PointLight") or child:IsA("SpotLight") or child:IsA("SurfaceLight") then
                child:Destroy()
            end
        end
        
        -- Remove fire, smoke, sparkles
        for _, child in ipairs(character:GetDescendants()) do
            if child:IsA("Fire") or child:IsA("Smoke") or child:IsA("Sparkles") then
                child:Destroy()
            end
        end
        
        -- Remove highlights
        for _, child in ipairs(character:GetDescendants()) do
            if child:IsA("Highlight") then
                child:Destroy()
            end
        end
        
        -- Remove decals and textures from body parts
        for _, child in ipairs(character:GetDescendants()) do
            if child:IsA("Decal") or child:IsA("Texture") then
                -- Keep face decal on head
                if not (child.Name == "face" and child.Parent and child.Parent.Name == "Head") then
                    child:Destroy()
                end
            end
        end
    end)
end

-- Clean backpack tools
local function destroyBackpackTools(player)
    if not CONFIG.ANTI_LAG_ENABLED then return end
    
    pcall(function()
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            for _, tool in ipairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    for _, desc in ipairs(tool:GetDescendants()) do
                        if desc:IsA("ParticleEmitter") or desc:IsA("Trail") or desc:IsA("Beam") or
                           desc:IsA("SpecialMesh") or desc:IsA("PointLight") or desc:IsA("SpotLight") or
                           desc:IsA("Fire") or desc:IsA("Smoke") or desc:IsA("Sparkles") then
                            desc:Destroy()
                        end
                    end
                end
            end
        end
    end)
end

-- Clean equipped tools
local function destroyEquippedTools(character)
    if not character then return end
    if not CONFIG.ANTI_LAG_ENABLED then return end
    
    pcall(function()
        for _, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                for _, desc in ipairs(tool:GetDescendants()) do
                    if desc:IsA("ParticleEmitter") or desc:IsA("Trail") or desc:IsA("Beam") or
                       desc:IsA("SpecialMesh") or desc:IsA("PointLight") or desc:IsA("SpotLight") or
                       desc:IsA("Fire") or desc:IsA("Smoke") or desc:IsA("Sparkles") then
                        desc:Destroy()
                    end
                end
            end
        end
    end)
end

-- Comprehensive character cleanup
local function antiLagCleanCharacter(char)
    if not char then return end
    
    destroyAllEquippableItems(char)
    destroyEquippedTools(char)
    cleanedCharacters[char] = true
end

-- Disconnect all connections
local function antiLagDisconnectAll()
    for _, conn in ipairs(antiLagConnections) do
        if typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
    end
    antiLagConnections = {}
    cleanedCharacters = {}
end

function ANTI_LAG.Enable()
    if antiLagRunning then return end
    antiLagRunning = true
    
    -- Clean all existing players ONCE
    for _, plr in ipairs(S.Players:GetPlayers()) do
        if plr.Character then
            antiLagCleanCharacter(plr.Character)
            destroyBackpackTools(plr)
        end
        
        -- Monitor backpack changes
        if plr.Backpack then
            table.insert(antiLagConnections, plr.Backpack.ChildAdded:Connect(function()
                if antiLagRunning and CONFIG.ANTI_LAG_ENABLED then
                    task.wait(0.1)
                    destroyBackpackTools(plr)
                end
            end))
        end
    end
    
    -- Monitor new players
    table.insert(antiLagConnections, S.Players.PlayerAdded:Connect(function(plr)
        table.insert(antiLagConnections, plr.CharacterAdded:Connect(function(char)
            if not antiLagRunning then return end
            task.wait(0.5) -- Wait for character to fully load
            antiLagCleanCharacter(char)
            destroyBackpackTools(plr)
            
            -- Monitor NEW items being added to character (event-based, not loop)
            table.insert(antiLagConnections, char.ChildAdded:Connect(function(child)
                if not antiLagRunning or not CONFIG.ANTI_LAG_ENABLED then return end
                task.wait(0.1)
                
                if child:IsA("Accessory") or child:IsA("Hat") or child:IsA("Shirt") or 
                   child:IsA("Pants") or child:IsA("ShirtGraphic") then
                    child:Destroy()
                elseif child:IsA("Tool") then
                    destroyEquippedTools(char)
                end
            end))
        end))
        
        if plr.Character then
            antiLagCleanCharacter(plr.Character)
            destroyBackpackTools(plr)
        end
        
        -- Monitor backpack
        if plr.Backpack then
            table.insert(antiLagConnections, plr.Backpack.ChildAdded:Connect(function()
                if antiLagRunning and CONFIG.ANTI_LAG_ENABLED then
                    task.wait(0.1)
                    destroyBackpackTools(plr)
                end
            end))
        end
    end))
    
    -- Monitor existing player characters
    for _, plr in ipairs(S.Players:GetPlayers()) do
        table.insert(antiLagConnections, plr.CharacterAdded:Connect(function(char)
            if antiLagRunning and CONFIG.ANTI_LAG_ENABLED then
                task.wait(0.5)
                antiLagCleanCharacter(char)
                destroyBackpackTools(plr)
                
                -- Monitor NEW items being added (event-based)
                table.insert(antiLagConnections, char.ChildAdded:Connect(function(child)
                    if not antiLagRunning or not CONFIG.ANTI_LAG_ENABLED then return end
                    task.wait(0.1)
                    
                    if child:IsA("Accessory") or child:IsA("Hat") or child:IsA("Shirt") or 
                       child:IsA("Pants") or child:IsA("ShirtGraphic") then
                        child:Destroy()
                    elseif child:IsA("Tool") then
                        destroyEquippedTools(char)
                    end
                end))
            end
        end))
    end
    
    -- MUCH LESS AGGRESSIVE PERIODIC CLEANUP (every 3 seconds instead of every frame)
    table.insert(antiLagConnections, task.spawn(function()
        while antiLagRunning and CONFIG.ANTI_LAG_ENABLED do
            task.wait(3) -- Only check every 3 seconds
            
            for _, plr in ipairs(S.Players:GetPlayers()) do
                if plr.Character and not cleanedCharacters[plr.Character] then
                    antiLagCleanCharacter(plr.Character)
                    destroyBackpackTools(plr)
                end
            end
        end
    end))
    
    showNotification("Optimized Anti-Lag Enabled", COLORS.Success)
end

function ANTI_LAG.Disable()
    if not antiLagRunning then return end
    antiLagRunning = false
    antiLagDisconnectAll()
    showNotification("Anti-Lag Disabled", COLORS.Red)
end

-- ============================================================
-- SECTION 14: ANTI-BEE & ANTI-DISCO (WITH CONTROL PROTECTION)
-- ============================================================

local FOV_MANAGER = {
    activeCount = 0,
    conn = nil,
    forcedFOV = 70,
}

function FOV_MANAGER:Start()
    if self.conn then return end
    
    self.conn = S.RunService.RenderStepped:Connect(function()
        local cam = workspace.CurrentCamera
        if cam and cam.FieldOfView ~= self.forcedFOV then
            cam.FieldOfView = self.forcedFOV
        end
    end)
end

function FOV_MANAGER:Stop()
    if self.conn then
        self.conn:Disconnect()
        self.conn = nil
    end
end

function FOV_MANAGER:Push()
    self.activeCount += 1
    self:Start()
end

function FOV_MANAGER:Pop()
    if self.activeCount > 0 then
        self.activeCount -= 1
    end
    if self.activeCount == 0 then
        self:Stop()
    end
end

local ANTI_BEE_DISCO = {}
local antiBeeDiscoRunning = false
local antiBeeDiscoConnections = {}
local originalMoveFunction = nil
local controlsProtected = false

local BAD_LIGHTING_NAMES = {
    Blue = true,
    DiscoEffect = true,
    BeeBlur = true,
    ColorCorrection = true,
}

local function antiBeeDiscoNuke(obj)
    if not obj or not obj.Parent then return end
    if BAD_LIGHTING_NAMES[obj.Name] then
        pcall(function()
            obj:Destroy()
        end)
    end
end

local function antiBeeDiscoDisconnectAll()
    for _, conn in ipairs(antiBeeDiscoConnections) do
        if typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
    end
    antiBeeDiscoConnections = {}
end

-- Protect player controls from inversion
local function protectControls()
    if controlsProtected then return end
    
    pcall(function()
        local PlayerScripts = S.LocalPlayer.PlayerScripts
        local PlayerModule = PlayerScripts:FindFirstChild("PlayerModule")
        if not PlayerModule then return end
        
        local Controls = require(PlayerModule):GetControls()
        if not Controls then return end
        
        -- Store original move function
        if not originalMoveFunction then
            originalMoveFunction = Controls.moveFunction
        end
        
        -- Create protected wrapper that prevents control inversion
        local function protectedMoveFunction(self, moveVector, relativeToCamera)
            -- Call original function with original parameters (no negation)
            if originalMoveFunction then
                originalMoveFunction(self, moveVector, relativeToCamera)
            end
        end
        
        -- Monitor for control hijacking
        local controlCheckConn = S.RunService.Heartbeat:Connect(function()
            if not antiBeeDiscoRunning or not CONFIG.ANTI_BEE_DISCO_ENABLED then return end
            
            -- Restore controls if they've been modified
            if Controls.moveFunction ~= protectedMoveFunction then
                Controls.moveFunction = protectedMoveFunction
            end
        end)
        
        table.insert(antiBeeDiscoConnections, controlCheckConn)
        
        -- Set protected function
        Controls.moveFunction = protectedMoveFunction
        controlsProtected = true
    end)
end

-- Restore original controls
local function restoreControls()
    if not controlsProtected then return end
    
    pcall(function()
        local PlayerScripts = S.LocalPlayer.PlayerScripts
        local PlayerModule = PlayerScripts:FindFirstChild("PlayerModule")
        if not PlayerModule then return end
        
        local Controls = require(PlayerModule):GetControls()
        if not Controls or not originalMoveFunction then return end
        
        Controls.moveFunction = originalMoveFunction
        controlsProtected = false
    end)
end

-- Block buzzing sound
local function blockBuzzingSound()
    pcall(function()
        local PlayerScripts = S.LocalPlayer.PlayerScripts
        local beeScript = PlayerScripts:FindFirstChild("Bee", true)
        if beeScript then
            local buzzing = beeScript:FindFirstChild("Buzzing")
            if buzzing and buzzing:IsA("Sound") then
                buzzing:Stop()
                buzzing.Volume = 0
            end
        end
    end)
end

function ANTI_BEE_DISCO.Enable()
    if antiBeeDiscoRunning then return end
    antiBeeDiscoRunning = true
    
    -- Nuke existing bad effects
    for _, inst in ipairs(S.Lighting:GetDescendants()) do
        antiBeeDiscoNuke(inst)
    end
    
    -- Monitor for new effects
    table.insert(antiBeeDiscoConnections, S.Lighting.DescendantAdded:Connect(function(obj)
        if not antiBeeDiscoRunning or not CONFIG.ANTI_BEE_DISCO_ENABLED then return end
        antiBeeDiscoNuke(obj)
    end))
    
    -- Protect controls from inversion
    protectControls()
    
    -- Block buzzing sound
    table.insert(antiBeeDiscoConnections, S.RunService.Heartbeat:Connect(function()
        if not antiBeeDiscoRunning or not CONFIG.ANTI_BEE_DISCO_ENABLED then return end
        blockBuzzingSound()
    end))
    
    showNotification("Anti-Bee & Anti-Disco Enabled", COLORS.Success)
    FOV_MANAGER:Push()
end

function ANTI_BEE_DISCO.Disable()
    if not antiBeeDiscoRunning then return end
    antiBeeDiscoRunning = false
    
    -- Restore original controls
    restoreControls()
    
    -- Disconnect all monitors
    antiBeeDiscoDisconnectAll()
    
    showNotification("Anti-Bee & Anti-Disco Disabled", COLORS.Red)
    FOV_MANAGER:Pop()
end

-- ============================================================
-- SECTION 15: ANTI-RAGDOLL SYSTEM (IMPROVED)
-- ============================================================

local ANTI_RAGDOLL = {}

local antiRagdollMode = nil
local ragdollConnections = {}
local cachedCharData = {}

-- Cache character data for performance
local function cacheCharacterData()
    local char = S.LocalPlayer.Character
    if not char then return false end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    
    if not hum or not root then return false end
    
    cachedCharData = {
        character = char,
        humanoid = hum,
        root = root,
        originalWalkSpeed = hum.WalkSpeed,
        originalJumpPower = hum.JumpPower,
        isFrozen = false
    }
    
    return true
end

-- Clean disconnect helper
local function disconnectAll()
    for _, conn in ipairs(ragdollConnections) do
        if typeof(conn) == "RBXScriptConnection" then
            pcall(function() conn:Disconnect() end)
        end
    end
    ragdollConnections = {}
end

-- Check if currently ragdolled (using multiple detection methods)
local function isRagdolled()
    if not cachedCharData.humanoid then return false end
    
    local hum = cachedCharData.humanoid
    local state = hum:GetState()
    
    -- State check
    local ragdollStates = {
        [Enum.HumanoidStateType.Physics] = true,
        [Enum.HumanoidStateType.Ragdoll] = true,
        [Enum.HumanoidStateType.FallingDown] = true
    }
    
    if ragdollStates[state] then
        return true
    end
    
    -- Timer attribute check
    local endTime = S.LocalPlayer:GetAttribute("RagdollEndTime")
    if endTime then
        local now = workspace:GetServerTimeNow()
        if (endTime - now) > 0 then
            return true
        end
    end
    
    return false
end

-- Remove all ragdoll constraints (v1 method)
local function removeRagdollConstraints()
    if not cachedCharData.character then return end
    
    local removed = false
    
    for _, descendant in ipairs(cachedCharData.character:GetDescendants()) do
        if descendant:IsA("BallSocketConstraint") or 
           (descendant:IsA("Attachment") and descendant.Name:find("RagdollAttachment")) then
            pcall(function()
                descendant:Destroy()
                removed = true
            end)
        end
    end
    
    return removed
end

-- Force exit ragdoll state
local function forceExitRagdoll()
    if not cachedCharData.humanoid or not cachedCharData.root then return end
    
    local hum = cachedCharData.humanoid
    local root = cachedCharData.root
    
    -- Clear ragdoll timer
    pcall(function()
        local now = workspace:GetServerTimeNow()
        S.LocalPlayer:SetAttribute("RagdollEndTime", now)
    end)
    
    -- Force standing state
    if hum.Health > 0 then
        hum:ChangeState(Enum.HumanoidStateType.Running)
    end
    
    -- Reset physics
    root.Anchored = false
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
end

-- Freeze player in place (v2 method)
local function freezePlayer()
    if not cachedCharData.humanoid or not cachedCharData.root then return end
    if cachedCharData.isFrozen then return end
    
    local hum = cachedCharData.humanoid
    local root = cachedCharData.root
    
    -- Save current stats
    cachedCharData.originalWalkSpeed = hum.WalkSpeed
    cachedCharData.originalJumpPower = hum.JumpPower
    
    -- Freeze
    hum.WalkSpeed = 0
    hum.JumpPower = 0
    root.Anchored = true
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
    
    cachedCharData.isFrozen = true
end

-- Unfreeze player (v2 method)
local function unfreezePlayer()
    if not cachedCharData.humanoid or not cachedCharData.root then return end
    if not cachedCharData.isFrozen then return end
    
    local hum = cachedCharData.humanoid
    local root = cachedCharData.root
    
    -- Restore stats
    hum.WalkSpeed = cachedCharData.originalWalkSpeed or 16
    hum.JumpPower = cachedCharData.originalJumpPower or 50
    
    -- Unfreeze
    root.Anchored = false
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
    
    cachedCharData.isFrozen = false
end

-- Main heartbeat loop for v1 (Moveable)
local function v1HeartbeatLoop()
    while antiRagdollMode == "v1" and cachedCharData.humanoid do
        task.wait()
        
        if isRagdolled() then
            -- Remove constraints and force exit
            removeRagdollConstraints()
            forceExitRagdoll()
        end
    end
end

-- Main heartbeat loop for v2 (Freeze)
local function v2HeartbeatLoop()
    while antiRagdollMode == "v2" and cachedCharData.humanoid do
        task.wait()
        
        if isRagdolled() then
            freezePlayer()
        else
            unfreezePlayer()
        end
    end
end

-- Setup camera binding for v1
local function setupCameraBinding()
    if not cachedCharData.humanoid then return end
    
    local conn = S.RunService.RenderStepped:Connect(function()
        if antiRagdollMode ~= "v1" then return end
        
        local cam = workspace.CurrentCamera
        if cam and cachedCharData.humanoid and cam.CameraSubject ~= cachedCharData.humanoid then
            cam.CameraSubject = cachedCharData.humanoid
        end
    end)
    
    table.insert(ragdollConnections, conn)
end

-- Handle character respawn
local function onCharacterAdded(char)
    task.wait(0.5) -- Wait for character to load
    
    if not antiRagdollMode then return end
    
    if cacheCharacterData() then
        if antiRagdollMode == "v1" then
            setupCameraBinding()
            task.spawn(v1HeartbeatLoop)
        elseif antiRagdollMode == "v2" then
            task.spawn(v2HeartbeatLoop)
        end
    end
end

function ANTI_RAGDOLL.Enable(mode)
    if mode ~= "v1" and mode ~= "v2" then 
        warn("[Anti-Ragdoll] Invalid mode:", mode)
        return 
    end
    
    if antiRagdollMode == mode then return end
    
    -- Disable first
    ANTI_RAGDOLL.Disable()
    
    -- Cache character data
    if not cacheCharacterData() then
        warn("[Anti-Ragdoll] Failed to cache character data")
        return
    end
    
    antiRagdollMode = mode
    
    -- Setup character respawn listener
    local charConn = S.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
    table.insert(ragdollConnections, charConn)
    
    -- Start appropriate mode
    if mode == "v1" then
        setupCameraBinding()
        task.spawn(v1HeartbeatLoop)
        showNotification("Anti-Ragdoll v2 (Moveable) Enabled", COLORS.Success)
    else
        task.spawn(v2HeartbeatLoop)
        showNotification("Anti-Ragdoll v1 (Freeze) Enabled", COLORS.Success)
    end
end

function ANTI_RAGDOLL.Disable()
    if not antiRagdollMode then return end
    
    local mode = antiRagdollMode
    antiRagdollMode = nil
    
    -- Unfreeze if frozen
    if cachedCharData.isFrozen then
        unfreezePlayer()
    end
    
    -- Disconnect all
    disconnectAll()
    
    -- Clear cache
    cachedCharData = {}
    
    showNotification("✗ Anti-Ragdoll Disabled", COLORS.Red)
end

-- ============================================================
-- SECTION 16: HELPERS
-- ============================================================

local function getSideBounds(sideFolder)
    if not sideFolder then return nil end
    
    local minX, minY, minZ = math.huge, math.huge, math.huge
    local maxX, maxY, maxZ = -math.huge, -math.huge, -math.huge
    local found = false
    
    local function scan(obj)
        for _, child in ipairs(obj:GetChildren()) do
            if child:IsA("BasePart") then
                found = true
                local p = child.Position
                minX = math.min(minX, p.X)
                minY = math.min(minY, p.Y)
                minZ = math.min(minZ, p.Z)
                maxX = math.max(maxX, p.X)
                maxY = math.max(maxY, p.Y)
                maxZ = math.max(maxZ, p.Z)
            else
                scan(child)
            end
        end
    end
    
    scan(sideFolder)
    if not found then return nil end
    
    local center = Vector3.new((minX + maxX) * 0.5, (minY + maxY) * 0.5, (minZ + maxZ) * 0.5)
    local halfSize = Vector3.new((maxX - minX) * 0.5, (maxY - minY) * 0.5, (maxZ - minZ) * 0.5)
    
    return {
        center = center,
        halfSize = halfSize,
        minX = minX,
        maxX = maxX,
        minZ = minZ,
        maxZ = maxZ,
    }
end

local function getSafeOutsideDecorPos(plot, targetPos, fromPos)
    local decorations = plot:FindFirstChild("Decorations")
    if not decorations then return targetPos end
    
    local side3Folder = decorations:FindFirstChild("Side 3")
    if not side3Folder then return targetPos end
    
    local info = getSideBounds(side3Folder)
    if not info then return targetPos end
    
    local center = info.center
    local halfSize = info.halfSize
    local MARGIN = 4
    
    -- Convert target to local space relative to bounds center
    local localTarget = targetPos - center
    local insideX = math.abs(localTarget.X) <= halfSize.X
    local insideZ = math.abs(localTarget.Z) <= halfSize.Z
    
    -- If already outside, return as-is
    if not (insideX and insideZ) then
        return targetPos
    end
    
    -- Calculate escape direction (towards where player came from, or from target)
    local src = fromPos and (fromPos - center) or localTarget
    local dir = Vector3.new(src.X, 0, src.Z) -- Flatten to 2D
    
    -- Fallback direction if too close to center
    if dir.Magnitude < 1e-3 then
        dir = Vector3.new(0, 0, 1)
    end
    
    local dirUnit = dir.Unit
    
    -- Calculate intersection with bounds using parametric ray
    local tx, tz = math.huge, math.huge
    
    if dirUnit.X ~= 0 then
        local boundX = (dirUnit.X > 0) and halfSize.X or -halfSize.X
        tx = boundX / dirUnit.X
    end
    
    if dirUnit.Z ~= 0 then
        local boundZ = (dirUnit.Z > 0) and halfSize.Z or -halfSize.Z
        tz = boundZ / dirUnit.Z
    end
    
    -- Take the closest intersection (minimum t value)
    local tHit = math.min(tx, tz)
    if tHit == math.huge then return targetPos end
    
    -- Calculate exit point with margin
    local boundaryLocal = dirUnit * (tHit + MARGIN)
    local worldPos = center + boundaryLocal
    
    return Vector3.new(worldPos.X, targetPos.Y, worldPos.Z)
end

local function getSmartCarpetPosition(carpetPart, fromPos)
    if not carpetPart or not fromPos then return nil end
    
    local cf = carpetPart.CFrame
    local size = carpetPart.Size
    local halfX = size.X / 2
    local halfZ = size.Z / 2
    
    -- Convert player position to carpet's local space
    local localPos = cf:PointToObjectSpace(fromPos)
    
    -- Clamp to carpet bounds to find nearest point
    local clampedX = math.clamp(localPos.X, -halfX, halfX)
    local clampedZ = math.clamp(localPos.Z, -halfZ, halfZ)
    
    -- If player is inside carpet bounds, find nearest edge
    if math.abs(localPos.X) < halfX and math.abs(localPos.Z) < halfZ then
        local distToEdges = {
            north = halfZ - localPos.Z,
            south = halfZ + localPos.Z,
            east = halfX - localPos.X,
            west = halfX + localPos.X
        }
        
        local minDist = math.huge
        local nearestEdge = "north"
        
        for edge, dist in pairs(distToEdges) do
            if dist < minDist then
                minDist = dist
                nearestEdge = edge
            end
        end
        
        if nearestEdge == "north" then
            clampedZ = halfZ
        elseif nearestEdge == "south" then
            clampedZ = -halfZ
        elseif nearestEdge == "east" then
            clampedX = halfX
        else -- west
            clampedX = -halfX
        end
    end
    
    -- Convert back to world space
    local nearestPoint = cf:PointToWorldSpace(Vector3.new(clampedX, 0, clampedZ))
    
    -- Raycast down to get actual ground position
    local rayOrigin = nearestPoint + Vector3.new(0, 50, 0)
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = { workspace.Map }
    rayParams.FilterType = Enum.RaycastFilterType.Whitelist
    
    local result = workspace:Raycast(rayOrigin, Vector3.new(0, -100, 0), rayParams)
    local finalY = result and result.Position.Y or fromPos.Y
    
    return Vector3.new(nearestPoint.X, finalY, nearestPoint.Z)
end

local function tpNearPlotIfFar(animalData)
    local hrp = getHRP()
    if not hrp or not animalData or not animalData.plot then return end

    local plot = workspace.Plots:FindFirstChild(animalData.plot)
    if not plot then return end

    local plotPos = plot:GetPivot().Position

    -- If close enough already → skip
    if (hrp.Position - plotPos).Magnitude <= 100 then
        return
    end

    local decorations = plot:FindFirstChild("Decorations")
    local side3 = decorations and decorations:FindFirstChild("Side 3") or nil

    local info = side3 and getSideBounds(side3) or nil
    local center = info and info.center or plotPos

    -- === REAL FIX: compute outward facing direction ===
    -- Vector from plot center to player (player’s viewing side)
    local dir = (hrp.Position - center).Unit

    -- Put player ON THAT SIDE (outward)
    local distanceFromPlot = 70 -- how far in front you want to stand

    -- Height safe
    local y = center.Y + 4

    -- Final position: CENTER + DIR * distance
    local finalPos = Vector3.new(
        center.X + dir.X * distanceFromPlot,
        y,
        center.Z + dir.Z * distanceFromPlot
    )

    -- Face toward plot
    hrp.CFrame = CFrame.new(finalPos, center)
end

local function teleportToAnimal(animalData)
    local character = S.LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        showNotification("⚠️ Character not found!", COLORS.Warning)
        return false
    end
    
    local humanoid = character:FindFirstChild("Humanoid")
    local hrp = character.HumanoidRootPart
    if not humanoid or not hrp then return false end
    
    -- Equip carpet if available
    local carpet = S.LocalPlayer.Backpack:FindFirstChild("Flying Carpet")
    if carpet then
        humanoid:EquipTool(carpet)
    end
    
    -- Find plot
    local plot = workspace.Plots:FindFirstChild(animalData.plot)
    if not plot then
        showNotification("⚠️ Plot not found!", COLORS.Warning)
        return false
    end
    
    -- Find target position
    local targetPos = Vector3.new(0, 10, 0)
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    local animalFolder = podiums and podiums:FindFirstChild(animalData.slot)
    
    local allParts = {}
    local function scan(obj)
        for _, child in ipairs(obj:GetChildren()) do
            if child:IsA("BasePart") then
                table.insert(allParts, child)
            else
                scan(child)
            end
        end
    end
    
    if animalFolder then
        scan(animalFolder)
    end
    
    if #allParts > 0 then
        local closest, minDist = nil, math.huge
        local hrpPos = hrp.Position
        
        for _, part in ipairs(allParts) do
            local dist = (part.Position - hrpPos).Magnitude
            if dist < minDist then
                minDist = dist
                closest = part
            end
        end
        
        if closest then
            targetPos = closest.Position
        end
    else
        -- Fallback to spawn
        local spawnPart = plot:FindFirstChild("Spawn")
        if spawnPart and spawnPart:IsA("BasePart") then
            targetPos = Vector3.new(spawnPart.Position.X, targetPos.Y, spawnPart.Position.Z)
        else
            local plotPart = plot:FindFirstChildWhichIsA("BasePart")
            if plotPart then
                targetPos = Vector3.new(plotPart.Position.X, targetPos.Y, plotPart.Position.Z)
            end
        end
    end
    
    local animalY = targetPos.Y
    local highAnimal = animalY > 10
    local currentPos = hrp.Position
    
    -- Safe teleport via carpet
    if CONFIG.SAFE_TELEPORT then
        local carpetPart = workspace.Map:FindFirstChild("Carpet")
        if carpetPart and carpetPart:IsA("BasePart") then
            local carpetPos = getSmartCarpetPosition(carpetPart, currentPos)
            if carpetPos then
                -- Use velocity method for jumping
                local state = humanoid:GetState()
                if state ~= Enum.HumanoidStateType.Jumping and state ~= Enum.HumanoidStateType.Freefall then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    task.wait(0.05)
                end
                
                -- Apply upward velocity
                hrp.Velocity = Vector3.new(hrp.Velocity.X, 200, hrp.Velocity.Z)
                
                task.wait(0.1)
                
                hrp.CFrame = CFrame.new(carpetPos.X, hrp.Position.Y, carpetPos.Z)
                
                task.wait(0.3)
                
                tpNearPlotIfFar(animalData)
                
                task.wait(0.3)
            end
        end
    else
        -- Non-safe teleport: just velocity jump boost
        if highAnimal then
            local state = humanoid:GetState()
            if state ~= Enum.HumanoidStateType.Jumping and state ~= Enum.HumanoidStateType.Freefall then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                task.wait(0.05)
            end
            
            -- Apply upward velocity
            hrp.Velocity = Vector3.new(hrp.Velocity.X, 200, hrp.Velocity.Z)
            
            task.wait(0.2)
        end
    end
    
    -- Adjust final position based on height
    local finalPos
    if highAnimal then
        finalPos = Vector3.new(targetPos.X, 20, targetPos.Z)
    else
        finalPos = targetPos
    end
    
    -- Apply decoration safety
    finalPos = getSafeOutsideDecorPos(plot, finalPos, currentPos)
    
    hrp.CFrame = CFrame.new(finalPos)
    
    showNotification(string.format("🚀 Teleported to %s", animalData.name), COLORS.Cyan)
    return true
end

local function teleportToHighest()
    if #allAnimalsCache == 0 then
        showNotification("No brainrots found yet!", COLORS.Yellow)
        return
    end
    
    if CONFIG.FAVORITES_PRIORITY_ENABLED and #FAVORITES > 0 then
        local favAnimal = getFavoriteByPriority()
        if favAnimal then
            showNotification("🔖 Teleporting to priority: " .. favAnimal.name, COLORS.Yellow)
            teleportToAnimal(favAnimal)
            return
        else
            showNotification("⚠️ No favorites found, using highest gen", COLORS.TextDim)
        end
    end
    
    teleportToAnimal(allAnimalsCache[1])
end

local function autoTeleportOnStart()
    task.wait(0.5)
    if #allAnimalsCache > 0 then
        teleportToHighest()
    end
end

-- ============================================================
-- SECTION 17: UTILITY ACTIONS
-- ============================================================

local function instantCloner()
    if isCloning then
        showNotification("Cloner already in progress!", COLORS.Yellow)
        return
    end
    
    isCloning = true
    
    local success, err = pcall(function()
        local character = S.LocalPlayer.Character
        if not character then error("Character not found") end
        
        local humanoid = character:FindFirstChild("Humanoid")
        if not humanoid then error("Humanoid not found") end
        
        for _, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                humanoid:UnequipTools()
                task.wait(0.1)
                break
            end
        end
        
        local backpack = S.LocalPlayer.Backpack
        local cloner = backpack:FindFirstChild("Quantum Cloner")
        if not cloner then error("Quantum Cloner not found in inventory!") end
        
        humanoid:EquipTool(cloner)
        task.wait()
        
        local useRemote = S.ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RE/UseItem")
        useRemote:FireServer()
        task.wait()
        
        local clonerRemote = S.ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RE/QuantumCloner/OnTeleport")
        clonerRemote:FireServer()
        
        showNotification("Instant Cloner Activated!", COLORS.Cyan)
    end)
    
    if not success then
        showNotification("Cloner Failed: " .. tostring(err), COLORS.Red)
    end
    
    task.wait(1)
    isCloning = false
end

local function kickSelf()
    showNotification("Kicking...", COLORS.Red)
    task.wait()
    S.LocalPlayer:Kick("Kicked the boii :E")
end

local function rejoinServer()
    local placeId = game.PlaceId
    local jobId = game.JobId
    
    showNotification("Rejoining current server...", COLORS.Cyan)
    
    task.delay(0.15, function()
        local ok, err = pcall(function()
            if jobId and jobId ~= "" then
                S.TeleportService:TeleportToPlaceInstance(placeId, jobId, S.LocalPlayer)
            else
                S.TeleportService:Teleport(placeId, S.LocalPlayer)
            end
        end)
        
        if not ok and err then
            showNotification("Rejoin failed: " .. tostring(err), COLORS.Red)
        end
    end)
end

local function matchesFilters(animalData)
    -- Always ignore your own base animals
    if isMyBaseAnimal(animalData) then
        return false
    end
    
    if searchQuery ~= "" then
        local query = searchQuery:lower()
        if not (animalData.name:lower():find(query) or
                animalData.mutation:lower():find(query) or
                animalData.traits:lower():find(query)) then
            return false
        end
    end
    
    if animalData.genValue < CONFIG.MIN_GEN_VALUE then return false end
    if CONFIG.SHOW_MUTATIONS_ONLY and animalData.mutation == "None" then return false end
    if CONFIG.SHOW_TRAITS_ONLY and animalData.traits == "None" then return false end
    
    return true
end

-- ============================================================
-- SECTION 17.5: UNLOCK BASE BUTTONS SYSTEM
-- ============================================================

local UNLOCK_BASE = {}
local unlockBaseGui = nil
local unlockBaseButtons = {}

local function getClosestPlot()
    local character = S.LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    local rootPart = character.HumanoidRootPart
    
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return nil end
    
    local closestPlot = nil
    local minDistance = 25 -- 25 Studs radius
    
    for _, plot in pairs(plots:GetChildren()) do
        local plotPos = nil
        if plot.PrimaryPart then
            plotPos = plot.PrimaryPart.Position
        elseif plot:FindFirstChild("Base") then
            plotPos = plot.Base.Position
        elseif plot:FindFirstChild("Floor") then
            plotPos = plot.Floor.Position
        else
            plotPos = plot:GetPivot().Position
        end
        
        if plotPos then
            local distance = (rootPart.Position - plotPos).Magnitude
            if distance < minDistance then
                closestPlot = plot
                minDistance = distance
            end
        end
    end
    
    return closestPlot
end

local function findPrompts(instance, found)
    for _, child in pairs(instance:GetChildren()) do
        if child:IsA("ProximityPrompt") then
            table.insert(found, child)
        end
        findPrompts(child, found)
    end
end

local function smartInteract(number)
    local targetPlot = getClosestPlot()
    
    if not targetPlot then
        showNotification("No plot nearby!", COLORS.Red)
        return
    end
    
    local unlockFolder = targetPlot:FindFirstChild("Unlock")
    if not unlockFolder then
        showNotification("No unlock folder found!", COLORS.Red)
        return
    end
    
    local unlockItems = {}
    for _, item in pairs(unlockFolder:GetChildren()) do
        local pos = nil
        if item:IsA("Model") then
            pos = item:GetPivot().Position
        elseif item:IsA("BasePart") then
            pos = item.Position
        end
        
        if pos then
            table.insert(unlockItems, {
                Object = item,
                Height = pos.Y
            })
        end
    end
    
    table.sort(unlockItems, function(a, b)
        return a.Height < b.Height
    end)
    
    if number > #unlockItems then
        showNotification("Floor " .. number .. " not found!", COLORS.Red)
        return
    end
    
    local targetFloor = unlockItems[number].Object
    
    local prompts = {}
    findPrompts(targetFloor, prompts)
    
    if #prompts == 0 then
        showNotification("No prompts found on floor " .. number, COLORS.Red)
        return
    end
    
    for _, prompt in pairs(prompts) do
        fireproximityprompt(prompt)
    end
end

function UNLOCK_BASE.CreateGUI()
    if unlockBaseGui then
        unlockBaseGui:Destroy()
    end
    
    unlockBaseGui = createElement("Frame", {
        Name = "UnlockBaseContainer",
        Size = UDim2.new(0, 70, 0, 210),
        Position = UDim2.new(0, 1530, 0.5, -105),
        BackgroundTransparency = 1,
        Parent = screenGui,
        ZIndex = 999999999999999,
    })
    
    local function createNumberButton(number, yPos)
        local btn = createElement("TextButton", {
            Name = "UnlockBtn" .. number,
            Size = UDim2.new(0, 65, 0, 65),
            Position = UDim2.new(0, 0, 0, yPos),
            BackgroundColor3 = COLORS.Surface,
            BackgroundTransparency = COLORS.SurfaceTransparency,
            BorderSizePixel = 0,
            Text = tostring(number),
            TextColor3 = COLORS.Cyan,
            TextSize = 32,
            Font = Enum.Font.GothamBold,
            Parent = unlockBaseGui,
            ZIndex = 999999999999999,
        })
        
        createElement("UICorner", {
            CornerRadius = UDim.new(0, 12),
            Parent = btn,
        })
        
        applyTitanzButtonStyle(btn)
        applyTitanzTextStyle(btn)
        makeTextGlow(btn, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
        addTextGradient(btn, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
        
        -- Hover effects
        btn.MouseEnter:Connect(function()
            tween(btn, tweenInfoFast, {
                BackgroundTransparency = 0.1,
                Size = UDim2.new(0, 70, 0, 70)
            })
        end)
        
        btn.MouseLeave:Connect(function()
            tween(btn, tweenInfoFast, {
                BackgroundTransparency = COLORS.SurfaceTransparency,
                Size = UDim2.new(0, 65, 0, 65)
            })
        end)
        
        btn.MouseButton1Click:Connect(function()
            smartInteract(number)
        end)
        
        unlockBaseButtons[number] = btn
        return btn
    end
    
    createNumberButton(1, 0)
    createNumberButton(2, 72)
    createNumberButton(3, 144)
end

function UNLOCK_BASE.Show()
    if unlockBaseGui then
        unlockBaseGui.Visible = true
    end
end

function UNLOCK_BASE.Hide()
    if unlockBaseGui then
        unlockBaseGui.Visible = false
    end
end

function UNLOCK_BASE.Destroy()
    if unlockBaseGui then
        unlockBaseGui:Destroy()
        unlockBaseGui = nil
        unlockBaseButtons = {}
    end
end

-- ============================================================
-- SECTION 18: SCANNER SYSTEM
-- ============================================================

local function updateStats(statLabels)
    if not statLabels then return end
    statLabels.total.Text = tostring(stats.totalAnimals)
    statLabels.value.Text = "$" .. S.NumberUtils:ToString(stats.totalValue) .. "/s"
    statLabels.highest.Text = "$" .. S.NumberUtils:ToString(stats.highestGen) .. "/s"
    statLabels.mutations.Text = tostring(stats.mutationCount)
    statLabels.traits.Text = tostring(stats.traitCount)
end

local function getAnimalHash(animalList)
    if not animalList then return "" end
    local hash = ""
    for slot, data in pairs(animalList) do
        if type(data) == "table" then
            hash = hash .. tostring(slot) .. tostring(data.Index) .. tostring(data.Mutation)
        end
    end
    return hash
end

local function scanSinglePlot(plot, statLabels)
    pcall(function()        
        local plotUID = plot.Name
        local channel = S.Synchronizer:Get(plotUID)
        if not channel then return end
        
        local animalList = channel:Get("AnimalList")
        local currentHash = getAnimalHash(animalList)
        if lastAnimalData[plotUID] == currentHash then
            return
        end
        lastAnimalData[plotUID] = currentHash
        
        for i = #allAnimalsCache, 1, -1 do
            if allAnimalsCache[i].plot == plot.Name then
                table.remove(allAnimalsCache, i)
            end
        end
        
        local owner = channel:Get("Owner")
        if not owner or not S.Players:FindFirstChild(owner.Name) then
            for i = #allAnimalsCache, 1, -1 do
                if allAnimalsCache[i].plot == plot.Name then
                    table.remove(allAnimalsCache, i)
                end
            end
            updateAnimalsList()
            updateStats(statLabels)
            return
        end
        
        local ownerName = owner and owner.Name or "Unknown"
        if not animalList then return end
        
        for slot, animalData in pairs(animalList) do
            if type(animalData) == "table" then
                local animalName = animalData.Index
                local animalInfo = S.AnimalsData[animalName]
                if not animalInfo then continue end
                
                local rarity = animalInfo.Rarity
                local rarityColor = (S.RaritiesData[rarity] and S.RaritiesData[rarity].Color) or Color3.fromRGB(255, 255, 255)
                
                local mutation = animalData.Mutation or "None"
                local traits = (animalData.Traits and #animalData.Traits > 0) and table.concat(animalData.Traits, ", ") or "None"
                
                local genValue = S.AnimalsShared:GetGeneration(animalName, animalData.Mutation, animalData.Traits, nil)
                local genText = "$" .. S.NumberUtils:ToString(genValue) .. "/s"
                
                table.insert(allAnimalsCache, {
                    name = animalInfo.DisplayName or animalName,
                    genText = genText,
                    genValue = genValue,
                    rarity = rarity,
                    rarityColor = rarityColor,
                    mutation = mutation,
                    traits = traits,
                    owner = ownerName,
                    plot = plot.Name,
                    slot = tostring(slot),
                    uid = plot.Name .. "_" .. tostring(slot),
                })
            end
        end
        
        stats = {
            totalAnimals = 0,
            totalValue = 0,
            highestGen = 0,
            mutationCount = 0,
            traitCount = 0,
        }
        
        for _, animal in ipairs(allAnimalsCache) do
            stats.totalAnimals = stats.totalAnimals + 1
            stats.totalValue = stats.totalValue + animal.genValue
            stats.highestGen = math.max(stats.highestGen, animal.genValue)
            if animal.mutation ~= "None" then
                stats.mutationCount = stats.mutationCount + 1
            end
            if animal.traits ~= "None" then
                stats.traitCount = stats.traitCount + 1
            end
        end
        
        table.sort(allAnimalsCache, function(a, b)
            return a.genValue > b.genValue
        end)
        
        highestAnimal = allAnimalsCache[1]
        
        updateAnimalsList()
        updateStats(statLabels)
        refreshAllESP()
    end)
end

local function setupPlotListener(plot, statLabels)
    if plotChannels[plot.Name] then return end
    
    local channel
    local retries = 0
    local maxRetries = 10
    
    while not channel and retries < maxRetries do
        local success, result = pcall(function()
            return S.Synchronizer:Get(plot.Name)
        end)
        if success and result then
            channel = result
            break
        else
            retries = retries + 1
            if retries < maxRetries then
                task.wait(0.5)
            end
        end
    end
    
    if not channel then return end
    plotChannels[plot.Name] = true
    
    scanSinglePlot(plot, statLabels)
    
    local c1 = plot.DescendantAdded:Connect(function()
        task.wait(0.1)
        scanSinglePlot(plot, statLabels)
    end)
    table.insert(scannerConnections, c1)
    
    local c2 = plot.DescendantRemoving:Connect(function()
        task.wait(0.1)
        scanSinglePlot(plot, statLabels)
    end)
    table.insert(scannerConnections, c2)
    
    local c3 = task.spawn(function()
        while plot.Parent and plotChannels[plot.Name] do
            task.wait(5)
            scanSinglePlot(plot, statLabels)
        end
    end)
    table.insert(scannerConnections, c3)
end

local function initializePlotScanner(statLabels)
    local plots = workspace:WaitForChild("Plots", 8)
    if not plots then
        warn("⚠️ Plots folder not found!")
        return
    end
    
    for _, plot in ipairs(plots:GetChildren()) do
        setupPlotListener(plot, statLabels)
    end
    
    local newPlotConnection = plots.ChildAdded:Connect(function(plot)
        task.wait(0.5)
        setupPlotListener(plot, statLabels)
    end)
    table.insert(scannerConnections, newPlotConnection)
    
    local removedPlotConnection = plots.ChildRemoved:Connect(function(plot)
        plotChannels[plot.Name] = nil
        lastAnimalData[plot.Name] = nil
        
        for i = #allAnimalsCache, 1, -1 do
            if allAnimalsCache[i].plot == plot.Name then
                table.remove(allAnimalsCache, i)
            end
        end
        
        updateAnimalsList()
        updateStats(statLabels)
        refreshAllESP()
    end)
    table.insert(scannerConnections, removedPlotConnection)
end

local function cleanupScanner()
    for _, connection in ipairs(scannerConnections) do
        if typeof(connection) == "RBXScriptConnection" then
            connection:Disconnect()
        elseif typeof(connection) == "thread" then
            task.cancel(connection)
        end
    end
    scannerConnections = {}
    plotChannels = {}
    lastAnimalData = {}
end

local function rescanAllPlots()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return end
    
    for _, plot in ipairs(plots:GetChildren()) do
        scanSinglePlot(plot, statLabels)
    end
end

S.Players.PlayerRemoving:Connect(function(player)
    for i = #allAnimalsCache, 1, -1 do
        if allAnimalsCache[i].owner == player.Name then
            table.remove(allAnimalsCache, i)
        end
    end
    updateAnimalsList()
    updateStats(statLabels)
    refreshAllESP()
end)

-- ============================================================
-- SECTION 19: GUI COMPONENT BUILDERS
-- ============================================================

local function createStatCard(parent, label, value, yPos, valueColor)
    valueColor = valueColor or COLORS.Cyan
    
    local card = createElement("Frame", {
        Size = UDim2.new(1, -20, 0, 70),
        Position = UDim2.new(0, 10, 0, yPos),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = COLORS.SurfaceTransparency,
        BorderSizePixel = 0,
        Parent = parent,
    })
    applyTitanzButtonStyle(card)
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = card,
    })
    
    createElement("TextLabel", {
        Size = UDim2.new(1, -20, 0, 18),
        Position = UDim2.new(0, 15, 0, 12),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = COLORS.TextDim,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = card,
    })
    
    local valueLabel = createElement("TextLabel", {
        Name = "ValueLabel",
        Size = UDim2.new(1, -20, 0, 28),
        Position = UDim2.new(0, 15, 0, 32),
        BackgroundTransparency = 1,
        Text = value,
        TextColor3 = valueColor,
        TextSize = 22,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = card,
    })
    
    return valueLabel
end

local function createToggleButton(parent, text, isEnabled, yPos, callback)
    local container = createElement("Frame", {
        Size = UDim2.new(1, -20, 0, 50),
        Position = UDim2.new(0, 10, 0, yPos),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = COLORS.SurfaceTransparency,
        BorderSizePixel = 0,
        Parent = parent,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = container,
    })
    
    local text = createElement("TextLabel", {
        Size = UDim2.new(0.65, 0, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = COLORS.Text,
        TextSize = 14,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = container,
    })
    makeTextGlow(text, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(text, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    local onColor = COLORS.Accent
    local offColor = blendColor(COLORS.Surface, COLORS.Accent, 0.25)
    
    local toggleBg = createElement("Frame", {
        Size = UDim2.new(0, 50, 0, 28),
        Position = UDim2.new(1, -60, 0.5, -14),
        BackgroundColor3 = isEnabled and onColor or offColor,
        BackgroundTransparency = isEnabled and 0.10 or 0.40,
        BorderSizePixel = 0,
        Parent = container,
    })
    createElement("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = toggleBg,
    })
    makeTextGlow(toggleBg, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(toggleBg, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    local toggleCircle = createElement("Frame", {
        Size = UDim2.new(0, 22, 0, 22),
        Position = isEnabled and UDim2.new(0, 25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11),
        BackgroundColor3 = COLORS.Text,
        BorderSizePixel = 0,
        Parent = toggleBg,
    })
    applyTitanzButtonStyle(toggleCircle)
    applyTitanzTextStyle(toggleCircle)
    createElement("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = toggleCircle,
    })
    
    local button = createElement("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Parent = container,
    })
    
    button.MouseButton1Click:Connect(function()
        local newState = callback()
        tween(toggleBg, tweenInfoFast, {
            BackgroundColor3 = newState and onColor or offColor,
            BackgroundTransparency = newState and 0.10 or 0.40,
        })
        tween(toggleCircle, tweenInfoMedium, {
            Position = newState and UDim2.new(0, 25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11),
        })
        saveConfig()
    end)
    
    applyTitanzButtonStyle(container)
    
    return container
end

local function createKeybindButton(parent, text, currentKey, yPos, callback)
    local container = createElement("Frame", {
        Size = UDim2.new(1, -20, 0, 55),
        Position = UDim2.new(0, 10, 0, yPos),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = COLORS.SurfaceTransparency,
        BorderSizePixel = 0,
        Parent = parent,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = container,
    })
    
    local text = createElement("TextLabel", {
        Size = UDim2.new(0.55, 0, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = COLORS.Text,
        TextSize = 14,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = container,
    })
    makeTextGlow(text, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(text, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    local keyButton = createElement("TextButton", {
        Size = UDim2.new(0, 90, 0, 38),
        Position = UDim2.new(1, -100, 0.5, -19),
        BackgroundColor3 = COLORS.Purple,
        BackgroundTransparency = 0.3,
        Text = currentKey and currentKey.Name or "Not Set",
        TextColor3 = COLORS.Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = container,
    })
    makeTextGlow(keyButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(keyButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzButtonStyle(keyButton)
    applyTitanzTextStyle(keyButton)
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = keyButton,
    })
    
    local isListening = false
    keyButton.MouseButton1Click:Connect(function()
        if isListening then return end
        isListening = true
        keyButton.Text = "..."
        keyButton.BackgroundColor3 = COLORS.Yellow
        
        local conn
        conn = S.UserInputService.InputBegan:Connect(function(input, gp)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                local newKey = input.KeyCode
                keyButton.Text = newKey.Name
                keyButton.BackgroundColor3 = COLORS.Purple
                callback(newKey)
                saveConfig()
                isListening = false
                conn:Disconnect()
            end
        end)
    end)
    
    applyTitanzButtonStyle(container)
    
    return container
end

local function createActionButton(parent, text, buttonText, buttonColor, yPos, callback)
    buttonColor = buttonColor or COLORS.Purple
    
    local container = createElement("Frame", {
        Size = UDim2.new(1, -20, 0, 55),
        Position = UDim2.new(0, 10, 0, yPos),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = COLORS.SurfaceTransparency,
        BorderSizePixel = 0,
        Parent = parent,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = container,
    })
    
    local text = createElement("TextLabel", {
        Size = UDim2.new(0.55, 0, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = COLORS.Text,
        TextSize = 14,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = container,
    })
    makeTextGlow(text, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(text, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    local actionButton = createElement("TextButton", {
        Size = UDim2.new(0, 90, 0, 38),
        Position = UDim2.new(1, -100, 0.5, -19),
        BackgroundColor3 = buttonColor,
        BackgroundTransparency = 0.3,
        Text = buttonText or "RUN",
        TextColor3 = COLORS.Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = container,
    })
    makeTextGlow(actionButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(actionButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzButtonStyle(actionButton)
    applyTitanzTextStyle(actionButton)
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = actionButton,
    })
    
    actionButton.MouseButton1Click:Connect(callback)
    applyTitanzButtonStyle(container)
    
    return container
end

local function createAnimalEntry(animalData, parent)
    local rarityColor = animalData.rarityColor or COLORS.Purple
    local mixedNameColor = blendColor(rarityColor, COLORS.Purple, 0.35)
    
    local entry = createElement("Frame", {
        Name = "AnimalEntry",
        Size = UDim2.new(1, 0, 0, 110),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = COLORS.SurfaceTransparency,
        BorderSizePixel = 0,
        Parent = parent,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = entry,
    })
    
    local accentLine = createElement("Frame", {
        Size = UDim2.new(0, 3, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = rarityColor,
        BorderSizePixel = 0,
        Parent = entry,
    })
    createElement("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = accentLine,
    })
    
    local isFav = isFavorite(animalData.name)
    
    local name = createElement("TextLabel", {
        Size = UDim2.new(1, -120, 0, 22),
        Position = UDim2.new(0, 15, 0, 10),
        BackgroundTransparency = 1,
        Text = (isFav and "⭐ " or "") .. animalData.name,
        TextColor3 = isFav and COLORS.Yellow or mixedNameColor,
        TextSize = 17,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = entry,
    })
    makeTextGlow(name, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(name, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    local rarity = createElement("TextLabel", {
        Size = UDim2.new(0, 120, 0, 18),
        Position = UDim2.new(0, 15, 0, 36),
        BackgroundTransparency = 1,
        Text = animalData.rarity,
        TextColor3 = rarityColor,
        TextSize = 14,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = entry,
    })
    
    local gen = createElement("TextLabel", {
        Size = UDim2.new(1, -15, 0, 18),
        Position = UDim2.new(0, 15, 0, 85),
        BackgroundTransparency = 1,
        Text = animalData.genText,
        TextColor3 = COLORS.Cyan,
        TextSize = 15,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = entry,
    })
    
    local mutation = createElement("TextLabel", {
        Size = UDim2.new(1, -120, 0, 18),
        Position = UDim2.new(0, 15, 0, 58),
        BackgroundTransparency = 1,
        Text = animalData.mutation,
        TextColor3 = COLORS.Pink,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = entry,
    })
    
    local traits = createElement("TextLabel", {
        Size = UDim2.new(1, -120, 0, 18),
        Position = UDim2.new(0, 140, 0, 58),
        BackgroundTransparency = 1,
        Text = animalData.traits,
        TextColor3 = COLORS.Cyan,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = entry,
    })
    
    local tpButton = createElement("TextButton", {
        Size = UDim2.new(0, 85, 0, 35),
        Position = UDim2.new(1, -95, 0.5, -17.5),
        BackgroundColor3 = COLORS.Cyan,
        BackgroundTransparency = 0.2,
        Text = "TP",
        TextColor3 = COLORS.Text,
        TextSize = 15,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = entry,
    })
    makeTextGlow(tpButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(tpButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzButtonStyle(tpButton)
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = tpButton,
    })
    
    tpButton.MouseButton1Click:Connect(function()
        teleportToAnimal(animalData)
    end)
    
    local favButton = createElement("TextButton", {
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(1, -135, 0.5, -17.5),
        BackgroundColor3 = isFav and COLORS.Yellow or COLORS.Surface,
        BackgroundTransparency = isFav and 0.2 or 0.1,
        Text = "⭐",
        TextColor3 = COLORS.Text,
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = entry,
    })
    makeTextGlow(favButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(favButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzButtonStyle(favButton)
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = favButton,
    })
    
    favButton.MouseButton1Click:Connect(function()
        local wasFav = isFavorite(animalData.name)
        if wasFav then
            removeFavorite(animalData.name)
            favButton.BackgroundColor3 = COLORS.Surface
            favButton.BackgroundTransparency = 0.1
        else
            addFavorite(animalData.name)
            favButton.BackgroundColor3 = COLORS.Yellow
            favButton.BackgroundTransparency = 0.2
        end
        task.wait(0.1)
        updateAnimalsList()
    end)
    
    entry.BackgroundTransparency = 1
    accentLine.BackgroundTransparency = 1
    for _, child in ipairs(entry:GetChildren()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            child.TextTransparency = 1
        end
    end
    
    tween(entry, tweenInfoMedium, { BackgroundTransparency = COLORS.SurfaceTransparency })
    tween(accentLine, tweenInfoMedium, { BackgroundTransparency = 0 })
    for _, child in ipairs(entry:GetChildren()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            tween(child, tweenInfoMedium, { TextTransparency = 0 })
        end
    end
    
    return entry
end

function updateAnimalsList()
    if not contentFrame or not contentFrame.Parent then return end
    local animalsTab = contentFrame:FindFirstChild("AnimalsTab")
    if not animalsTab then return end
    local scrollFrame = animalsTab:FindFirstChild("AnimalList")
    if not scrollFrame then return end
    
    for _, child in ipairs(scrollFrame:GetChildren()) do
        if child:IsA("Frame") and child.Name == "AnimalEntry" then
            child:Destroy()
        end
    end
    
    local displayCount = 0
    for _, animalData in ipairs(allAnimalsCache) do
        if matchesFilters(animalData) then
            local entry = createAnimalEntry(animalData, scrollFrame)
            entry.LayoutOrder = displayCount
            displayCount = displayCount + 1
        end
    end
    
    local listLayout = scrollFrame:FindFirstChild("UIListLayout")
    if listLayout then
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 15)
    end
end

-- ============================================================
-- SECTION 20: GUI TAB CREATION
-- ============================================================

local function createAnimalsTab(parent)
    local container = createElement("Frame", {
        Name = "AnimalsTab",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Visible = true,
        Parent = parent,
    })
    
    local searchFrame = createElement("Frame", {
        Size = UDim2.new(1, -20, 0, 45),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = COLORS.SurfaceTransparency,
        BorderSizePixel = 0,
        Parent = container,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = searchFrame,
    })
    
    local searchBox = createElement("TextBox", {
        Size = UDim2.new(1, -30, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        PlaceholderText = "Search brainrots, mutations, traits...",
        Text = "",
        TextColor3 = COLORS.Text,
        PlaceholderColor3 = COLORS.Pink,
        TextSize = 15,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        Parent = searchFrame,
    })

    makeTextGlow(searchBox, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(searchBox, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        searchQuery = searchBox.Text
        task.spawn(updateAnimalsList)
    end)
    
    local scrollFrame = createElement("ScrollingFrame", {
        Name = "AnimalList",
        Size = UDim2.new(1, -20, 1, -65),
        Position = UDim2.new(0, 10, 0, 65),
        BackgroundColor3 = COLORS.Background,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        ScrollBarThickness = 6,
        ScrollBarImageColor3 = COLORS.Purple,
        Parent = container,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = scrollFrame,
    })
    
    createElement("UIListLayout", {
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = scrollFrame,
    })
    
    return container
end

local function createStatsTab(parent)
    local container = createElement("Frame", {
        Name = "StatsTab",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Visible = false,
        Parent = parent,
    })

    local labels = {}
    labels.total = createStatCard(container, "Total Animals", "0", 15, COLORS.Text)
    labels.value = createStatCard(container, "Total Value/s", "$0", 95, COLORS.Cyan)
    labels.highest = createStatCard(container, "Highest Gen", "$0/s", 175, COLORS.Yellow)
    labels.mutations = createStatCard(container, "With Mutations", "0", 255, COLORS.Accent)
    labels.traits = createStatCard(container, "With Traits", "0", 335, COLORS.Blue)

    return container, labels
end

local function createFavoritesTab(parent)
    local container = createElement("Frame", {
        Name = "FavoritesTab",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Visible = false,
        Parent = parent,
    })
    
    local headerFrame = createElement("Frame", {
        Size = UDim2.new(1, -20, 0, 60),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = COLORS.SurfaceTransparency,
        BorderSizePixel = 0,
        Parent = container,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = headerFrame,
    })
    
    local title = createElement("TextLabel", {
        Size = UDim2.new(1, -30, 0, 24),
        Position = UDim2.new(0, 15, 0, 10),
        BackgroundTransparency = 1,
        Text = "⭐ FAVORITES PRIORITY",
        TextColor3 = COLORS.Yellow,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = headerFrame,
    })

    makeTextGlow(title, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(title, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    local info = createElement("TextLabel", {
        Size = UDim2.new(1, -30, 0, 16),
        Position = UDim2.new(0, 15, 0, 36),
        BackgroundTransparency = 1,
        Text = "Higher = More Priority | Will TP to highest priority first",
        TextColor3 = COLORS.TextDim,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = headerFrame,
    })
    makeTextGlow(info, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(info, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    local addFrame = createElement("Frame", {
        Size = UDim2.new(1, -20, 0, 50),
        Position = UDim2.new(0, 10, 0, 80),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = COLORS.SurfaceTransparency,
        BorderSizePixel = 0,
        Parent = container,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = addFrame,
    })
    
    local addInput = createElement("TextBox", {
        Size = UDim2.new(1, -110, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        PlaceholderText = "Enter animal name (e.g., Garama, Dragon)...",
        Text = "",
        TextColor3 = COLORS.Text,
        PlaceholderColor3 = COLORS.TextDim,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        Parent = addFrame,
    })
    makeTextGlow(addInput, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(addInput, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzButtonStyle(addInput)
    
    local addButton = createElement("TextButton", {
        Size = UDim2.new(0, 80, 0, 38),
        Position = UDim2.new(1, -90, 0.5, -19),
        BackgroundColor3 = COLORS.Yellow,
        BackgroundTransparency = 0.2,
        Text = "ADD",
        TextColor3 = COLORS.Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = addFrame,
    })
    makeTextGlow(addButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(addButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzButtonStyle(addButton)
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = addButton,
    })
    
    local scrollFrame = createElement("ScrollingFrame", {
        Name = "FavoritesList",
        Size = UDim2.new(1, -20, 1, -215),
        Position = UDim2.new(0, 10, 0, 140),
        BackgroundColor3 = COLORS.Background,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        ScrollBarThickness = 6,
        ScrollBarImageColor3 = COLORS.Yellow,
        Parent = container,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = scrollFrame,
    })
    
    createElement("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = scrollFrame,
    })
    
    local function refreshFavoritesList()
        for _, child in ipairs(scrollFrame:GetChildren()) do
            if child:IsA("Frame") and child.Name == "FavoriteEntry" then
                child:Destroy()
            end
        end
        
        for index, favName in ipairs(FAVORITES) do
            local entry = createElement("Frame", {
                Name = "FavoriteEntry",
                Size = UDim2.new(1, 0, 0, 55),
                BackgroundColor3 = COLORS.Surface,
                BackgroundTransparency = COLORS.SurfaceTransparency,
                BorderSizePixel = 0,
                LayoutOrder = index,
                Parent = scrollFrame,
            })
            
            createElement("UICorner", {
                CornerRadius = UDim.new(0, 10),
                Parent = entry,
            })
            
            createElement("TextLabel", {
                Size = UDim2.new(0, 35, 1, 0),
                Position = UDim2.new(0, 10, 0, 0),
                BackgroundTransparency = 1,
                Text = "#" .. index,
                TextColor3 = COLORS.Yellow,
                TextSize = 18,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = entry,
            })
            
            createElement("TextLabel", {
                Size = UDim2.new(1, -200, 1, 0),
                Position = UDim2.new(0, 50, 0, 0),
                BackgroundTransparency = 1,
                Text = favName,
                TextColor3 = COLORS.Text,
                TextSize = 15,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = entry,
            })
            
            local upButton = createElement("TextButton", {
                Size = UDim2.new(0, 40, 0, 40),
                Position = UDim2.new(1, -135, 0.5, -20),
                BackgroundColor3 = COLORS.Cyan,
                BackgroundTransparency = 0.2,
                Text = "▲",
                TextColor3 = COLORS.Text,
                TextSize = 16,
                Font = Enum.Font.GothamBold,
                BorderSizePixel = 0,
                Visible = index > 1,
                Parent = entry,
            })
            makeTextGlow(upButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
            addTextGradient(upButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
            applyTitanzButtonStyle(upButton)
            createElement("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = upButton,
            })
            
            upButton.MouseButton1Click:Connect(function()
                if moveFavoriteUp(index) then
                    refreshFavoritesList()
                    showNotification("Moved up: " .. favName, COLORS.Cyan)
                end
            end)
            
            local downButton = createElement("TextButton", {
                Size = UDim2.new(0, 40, 0, 40),
                Position = UDim2.new(1, -90, 0.5, -20),
                BackgroundColor3 = COLORS.Cyan,
                BackgroundTransparency = 0.2,
                Text = "▼",
                TextColor3 = COLORS.Text,
                TextSize = 16,
                Font = Enum.Font.GothamBold,
                BorderSizePixel = 0,
                Visible = index < #FAVORITES,
                Parent = entry,
            })
            makeTextGlow(downButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
            addTextGradient(downButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
            applyTitanzButtonStyle(downButton)
            createElement("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = downButton,
            })
            
            downButton.MouseButton1Click:Connect(function()
                if moveFavoriteDown(index) then
                    refreshFavoritesList()
                    showNotification("Moved down: " .. favName, COLORS.Cyan)
                end
            end)
            
            local removeButton = createElement("TextButton", {
                Size = UDim2.new(0, 40, 0, 40),
                Position = UDim2.new(1, -45, 0.5, -20),
                BackgroundColor3 = COLORS.Red,
                BackgroundTransparency = 0.2,
                Text = "X",
                TextColor3 = COLORS.Text,
                TextSize = 18,
                Font = Enum.Font.GothamBold,
                BorderSizePixel = 0,
                Parent = entry,
            })
            makeTextGlow(removeButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
            addTextGradient(removeButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
            applyTitanzButtonStyle(removeButton)
            createElement("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = removeButton,
            })
            
            removeButton.MouseButton1Click:Connect(function()
                removeFavorite(favName)
                refreshFavoritesList()
                updateAnimalsList()
            end)
        end
        
        local listLayout = scrollFrame:FindFirstChild("UIListLayout")
        if listLayout then
            scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 15)
        end
    end
    
    addButton.MouseButton1Click:Connect(function()
        local animalName = addInput.Text:match("^%s*(.-)%s*$")
        if animalName ~= "" then
            if addFavorite(animalName) then
                addInput.Text = ""
                refreshFavoritesList()
            end
        else
            showNotification("Please enter an animal name!", COLORS.Yellow)
        end
    end)
    
    addInput.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local animalName = addInput.Text:match("^%s*(.-)%s*$")
            if animalName ~= "" then
                if addFavorite(animalName) then
                    addInput.Text = ""
                    refreshFavoritesList()
                end
            end
        end
    end)
    
    local toggleFrame = createElement("Frame", {
        Size = UDim2.new(1, -20, 0, 60),
        Position = UDim2.new(0, 10, 1, -70),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = COLORS.SurfaceTransparency,
        BorderSizePixel = 0,
        Parent = container,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = toggleFrame,
    })
    
    local apply = createElement("TextLabel", {
        Size = UDim2.new(0.7, 0, 0, 20),
        Position = UDim2.new(0, 15, 0, 10),
        BackgroundTransparency = 1,
        Text = "⭐ Apply Favorites Priority",
        TextColor3 = COLORS.Yellow,
        TextSize = 15,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = toggleFrame,
    })
    makeTextGlow(apply, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(apply, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    local info = createElement("TextLabel", {
        Size = UDim2.new(0.7, 0, 0, 16),
        Position = UDim2.new(0, 15, 0, 32),
        BackgroundTransparency = 1,
        Text = "When enabled, keybind TPs to favorites first",
        TextColor3 = COLORS.TextDim,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = toggleFrame,
    })
    makeTextGlow(info, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(info, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    local toggleBg = createElement("Frame", {
        Size = UDim2.new(0, 50, 0, 28),
        Position = UDim2.new(1, -60, 0.5, -14),
        BackgroundColor3 = CONFIG.FAVORITES_PRIORITY_ENABLED and COLORS.Cyan or COLORS.Surface,
        BackgroundTransparency = CONFIG.FAVORITES_PRIORITY_ENABLED and 0.2 or 0,
        BorderSizePixel = 0,
        Parent = toggleFrame,
    })
    makeTextGlow(toggleBg, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(toggleBg, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzButtonStyle(toggleBg)
    createElement("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = toggleBg,
    })
    
    local toggleCircle = createElement("Frame", {
        Size = UDim2.new(0, 22, 0, 22),
        Position = CONFIG.FAVORITES_PRIORITY_ENABLED and UDim2.new(0, 25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11),
        BackgroundColor3 = COLORS.Text,
        BorderSizePixel = 0,
        Parent = toggleBg,
    })
    makeTextGlow(toggleCircle, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(toggleCircle, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    applyTitanzButtonStyle(toggleCircle)
    applyTitanzTextStyle(toggleCircle)
    createElement("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = toggleCircle,
    })
    
    local toggleButton = createElement("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Parent = toggleFrame,
    })
    
    toggleButton.MouseButton1Click:Connect(function()
        CONFIG.FAVORITES_PRIORITY_ENABLED = not CONFIG.FAVORITES_PRIORITY_ENABLED
        tween(toggleBg, tweenInfoFast, {
            BackgroundColor3 = CONFIG.FAVORITES_PRIORITY_ENABLED and COLORS.Cyan or COLORS.Surface,
            BackgroundTransparency = CONFIG.FAVORITES_PRIORITY_ENABLED and 0.2 or 0,
        })
        tween(toggleCircle, tweenInfoMedium, {
            Position = CONFIG.FAVORITES_PRIORITY_ENABLED and UDim2.new(0, 25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11),
        })
        saveConfig()
        if showNotification then
            showNotification(
                CONFIG.FAVORITES_PRIORITY_ENABLED and "✅ Favorites Priority Enabled" or "❌ Favorites Priority Disabled",
                CONFIG.FAVORITES_PRIORITY_ENABLED and COLORS.Cyan or COLORS.Red
            )
        end
    end)
    
    refreshFavoritesList()
    
    return container, refreshFavoritesList
end

-- ============================================================
-- SECTION 21: ACTIONS TAB CREATION
-- ============================================================

local function createActionsTab(parent)
    local container = createElement("Frame", {
        Name = "ActionsTab",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Visible = false,
        Parent = parent,
    })
    
    local scroll = createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 6,
        ScrollBarImageColor3 = COLORS.Purple,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0), -- Will be updated dynamically
        AutomaticCanvasSize = Enum.AutomaticSize.Y, -- This fixes the scrolling issue
        Parent = container,
    })
    
    local list = createElement("UIListLayout", {
        Padding = UDim.new(0, 12),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = scroll,
    })
    
    -- Update canvas size when content changes
    list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scroll.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 20)
    end)
    
    local order = 1
    local function nextOrder()
        order += 1
        return order
    end
    
    local function addHeader(text)
        local wrap = createElement("Frame", {
            Size = UDim2.new(1, -20, 0, 26),
            BackgroundTransparency = 1,
            Parent = scroll,
            LayoutOrder = nextOrder(),
        })
        
        local text = createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = COLORS.Purple,
            TextSize = 18,
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            Position = UDim2.new(0, 10, 0, 0),
            Parent = wrap,
        })
        makeTextGlow(text, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
        addTextGradient(text, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    end
    
    addHeader("KEYBINDS")
    
    createKeybindButton(scroll, "Toggle GUI", CONFIG.TOGGLE_GUI_KEYBIND, 0, function(key)
        CONFIG.TOGGLE_GUI_KEYBIND = key
        saveConfig()
    end).LayoutOrder = nextOrder()
    
    createKeybindButton(scroll, "Teleport to Highest", CONFIG.TELEPORT_KEYBIND, 0, function(key)
        CONFIG.TELEPORT_KEYBIND = key
        saveConfig()
    end).LayoutOrder = nextOrder()

    createKeybindButton(scroll, "Desync V3", CONFIG.DESYNC_KEYBIND, 0, function(key)
        CONFIG.DESYNC_KEYBIND = key
        saveConfig()
    end).LayoutOrder = nextOrder()
    
    createKeybindButton(scroll, "Instant Cloner", CONFIG.INSTANT_CLONER_KEYBIND, 0, function(key)
        CONFIG.INSTANT_CLONER_KEYBIND = key
        saveConfig()
    end).LayoutOrder = nextOrder()
    
    createKeybindButton(scroll, "Floor Steal", CONFIG.FLOOR_STEAL_KEYBIND, 0, function(key)
        CONFIG.FLOOR_STEAL_KEYBIND = key
        saveConfig()
    end).LayoutOrder = nextOrder()
    
    createKeybindButton(scroll, "Kick Self", CONFIG.KICK_SELF_KEYBIND, 0, function(key)
        CONFIG.KICK_SELF_KEYBIND = key
        saveConfig()
    end).LayoutOrder = nextOrder()
    
    createKeybindButton(scroll, "Rejoin Server", CONFIG.REJOIN_KEYBIND, 0, function(key)
        CONFIG.REJOIN_KEYBIND = key
        saveConfig()
    end).LayoutOrder = nextOrder()
    
    addHeader("MAIN FEATURES")

    createToggleButton(scroll, "Auto-Desync V3 on Start", CONFIG.AUTO_DESYNC_ENABLED, 0, function()
        CONFIG.AUTO_DESYNC_ENABLED = not CONFIG.AUTO_DESYNC_ENABLED
        saveConfig()
        return CONFIG.AUTO_DESYNC_ENABLED
    end).LayoutOrder = nextOrder()
    
    createToggleButton(scroll, "Auto-Teleport on Start", CONFIG.AUTO_TP_ENABLED, 0, function()
        CONFIG.AUTO_TP_ENABLED = not CONFIG.AUTO_TP_ENABLED
        saveConfig()
        return CONFIG.AUTO_TP_ENABLED
    end).LayoutOrder = nextOrder()

    createToggleButton(scroll, "Auto-Steal Priority", CONFIG.AUTO_STEAL_PRIORITY_ENABLED, 0, function()
        CONFIG.AUTO_STEAL_PRIORITY_ENABLED = not CONFIG.AUTO_STEAL_PRIORITY_ENABLED
        saveConfig()
        return CONFIG.AUTO_STEAL_PRIORITY_ENABLED
    end).LayoutOrder = nextOrder()

    createToggleButton(scroll, "Auto-Steal Highest Gen", CONFIG.AUTO_STEAL_ENABLED, 0, function()
        CONFIG.AUTO_STEAL_ENABLED = not CONFIG.AUTO_STEAL_ENABLED
        
        if CONFIG.AUTO_STEAL_ENABLED then
            CONFIG.AUTO_STEAL_NEAREST_ENABLED = false
        end
        
        saveConfig()
        return CONFIG.AUTO_STEAL_ENABLED
    end).LayoutOrder = nextOrder()

    createToggleButton(scroll, "Auto-Steal Nearest", CONFIG.AUTO_STEAL_NEAREST_ENABLED, 0, function()
        CONFIG.AUTO_STEAL_NEAREST_ENABLED = not CONFIG.AUTO_STEAL_NEAREST_ENABLED
        
        if CONFIG.AUTO_STEAL_NEAREST_ENABLED then
            CONFIG.AUTO_STEAL_ENABLED = false
        end
        
        saveConfig()
        return CONFIG.AUTO_STEAL_NEAREST_ENABLED
    end).LayoutOrder = nextOrder()

    createToggleButton(scroll, "Speed Boost During Steal", CONFIG.STEAL_SPEED_ENABLED, 0, function()
        CONFIG.STEAL_SPEED_ENABLED = not CONFIG.STEAL_SPEED_ENABLED
        saveConfig()
        return CONFIG.STEAL_SPEED_ENABLED
    end).LayoutOrder = nextOrder()

    createToggleButton(scroll, "Disable Animation During Steal", CONFIG.STEAL_DISABLE_ANIM_ENABLED, 0, function()
        CONFIG.STEAL_DISABLE_ANIM_ENABLED = not CONFIG.STEAL_DISABLE_ANIM_ENABLED
        saveConfig()
        
        if CONFIG.STEAL_DISABLE_ANIM_ENABLED then
            -- Cache animations immediately when enabled
            if not cacheOriginalAnimations() then
                showNotification("Failed to cache animations", COLORS.Red)
                CONFIG.STEAL_DISABLE_ANIM_ENABLED = false
                return false
            end
            showNotification("Animation Disable Ready", COLORS.Success)
        else
            stopAnimDisable()
        end
        
        return CONFIG.STEAL_DISABLE_ANIM_ENABLED
    end).LayoutOrder = nextOrder()
    
    createToggleButton(scroll, "Floor Steal", CONFIG.FLOOR_STEAL_ENABLED, 0, function()
        CONFIG.FLOOR_STEAL_ENABLED = not CONFIG.FLOOR_STEAL_ENABLED
        saveConfig()
        if CONFIG.FLOOR_STEAL_ENABLED then
            startFloorSteal()
        else
            stopFloorSteal()
        end
        return CONFIG.FLOOR_STEAL_ENABLED
    end).LayoutOrder = nextOrder()

    createActionButton(scroll, "Desync V3 (No Lagback)", "ACTIVATE", COLORS.Purple, 0, function()
        enableDesync()
    end).LayoutOrder = nextOrder()
    
    createActionButton(scroll, "Teleport to Highest", "TELEPORT", COLORS.Cyan, 0, function()
        teleportToHighest()
    end).LayoutOrder = nextOrder()
    
    createActionButton(scroll, "Instant Cloner", "CLONE", COLORS.Purple, 0, function()
        instantCloner()
    end).LayoutOrder = nextOrder()
    
    createActionButton(scroll, "Kick Self", "KICK", COLORS.Red, 0, function()
        kickSelf()
    end).LayoutOrder = nextOrder()
    
    createActionButton(scroll, "Rejoin Same Server", "REJOIN", COLORS.Cyan, 0, function()
        rejoinServer()
    end).LayoutOrder = nextOrder()
    
    addHeader("ESP")
    
    createToggleButton(scroll, "Brainrot ESP (Best + Min Gen 10M)", CONFIG.ESP_ENABLED, 0, function()
        CONFIG.ESP_ENABLED = not CONFIG.ESP_ENABLED
        saveConfig()
        refreshAllESP()
        return CONFIG.ESP_ENABLED
    end).LayoutOrder = nextOrder()
    
    createToggleButton(scroll, "Player ESP", CONFIG.ESP_PLAYERS_ENABLED, 0, function()
        CONFIG.ESP_PLAYERS_ENABLED = not CONFIG.ESP_PLAYERS_ENABLED
        saveConfig()
        refreshPlayerESP()
        return CONFIG.ESP_PLAYERS_ENABLED
    end).LayoutOrder = nextOrder()
    
    addHeader("MISC")
    
    createToggleButton(scroll, "Load Tuff Optimizer", CONFIG.OptimizerEnabled, 0, function()
        CONFIG.OptimizerEnabled = not CONFIG.OptimizerEnabled
        saveConfig()
        if CONFIG.OptimizerEnabled then
            pcall(OPTIMIZER.Enable)
        else
            OPTIMIZER.Disable()
        end
        return CONFIG.OptimizerEnabled
    end).LayoutOrder = nextOrder()
    
    createToggleButton(scroll, "Anti-Lag (No FPS Killers)", CONFIG.ANTI_LAG_ENABLED, 0, function()
        CONFIG.ANTI_LAG_ENABLED = not CONFIG.ANTI_LAG_ENABLED
        saveConfig()
        if CONFIG.ANTI_LAG_ENABLED then
            ANTI_LAG.Enable()
        else
            ANTI_LAG.Disable()
        end
        return CONFIG.ANTI_LAG_ENABLED
    end).LayoutOrder = nextOrder()
    
    createToggleButton(scroll, "Anti-Bee & Anti-Disco", CONFIG.ANTI_BEE_DISCO_ENABLED, 0, function()
        CONFIG.ANTI_BEE_DISCO_ENABLED = not CONFIG.ANTI_BEE_DISCO_ENABLED
        saveConfig()
        if CONFIG.ANTI_BEE_DISCO_ENABLED then
            ANTI_BEE_DISCO.Enable()
        else
            ANTI_BEE_DISCO.Disable()
        end
        return CONFIG.ANTI_BEE_DISCO_ENABLED
    end).LayoutOrder = nextOrder()
    
    createToggleButton(scroll, "Anti-Ragdoll v1 (Freeze Only)", CONFIG.ANTI_RAGDOLL_V1_ENABLED, 0, function()
        CONFIG.ANTI_RAGDOLL_V1_ENABLED = not CONFIG.ANTI_RAGDOLL_V1_ENABLED
        
        if CONFIG.ANTI_RAGDOLL_V1_ENABLED then
            CONFIG.ANTI_RAGDOLL_V2_ENABLED = false
            ANTI_RAGDOLL.Enable("v2")
        else
            ANTI_RAGDOLL.Disable()
        end
        
        saveConfig()
        return CONFIG.ANTI_RAGDOLL_V1_ENABLED
    end).LayoutOrder = nextOrder()
    
    createToggleButton(scroll, "Anti-Ragdoll v2 (Moveable)", CONFIG.ANTI_RAGDOLL_V2_ENABLED, 0, function()
        CONFIG.ANTI_RAGDOLL_V2_ENABLED = not CONFIG.ANTI_RAGDOLL_V2_ENABLED
        
        if CONFIG.ANTI_RAGDOLL_V2_ENABLED then
            CONFIG.ANTI_RAGDOLL_V1_ENABLED = false
            ANTI_RAGDOLL.Enable("v1")
        else
            ANTI_RAGDOLL.Disable()
        end
        
        saveConfig()
        return CONFIG.ANTI_RAGDOLL_V2_ENABLED
    end).LayoutOrder = nextOrder()

    createToggleButton(scroll, "Safe Teleport", CONFIG.SAFE_TELEPORT, 0, function()
        CONFIG.SAFE_TELEPORT = not CONFIG.SAFE_TELEPORT
        saveConfig()
        return CONFIG.SAFE_TELEPORT
    end).LayoutOrder = nextOrder()
    
    createToggleButton(scroll, "Xray Base", CONFIG.INVISIBLE_BASE_WALLS_ENABLED, 0, function()
        CONFIG.INVISIBLE_BASE_WALLS_ENABLED = not CONFIG.INVISIBLE_BASE_WALLS_ENABLED
        saveConfig()
        if CONFIG.INVISIBLE_BASE_WALLS_ENABLED then
            enableInvisibleBaseWalls()
        else
            disableInvisibleBaseWalls()
        end
        return CONFIG.INVISIBLE_BASE_WALLS_ENABLED
    end).LayoutOrder = nextOrder()
    
    createToggleButton(scroll, "Auto-Hide GUI on Start", CONFIG.AUTO_HIDE_ENABLED, 0, function()
        CONFIG.AUTO_HIDE_ENABLED = not CONFIG.AUTO_HIDE_ENABLED
        saveConfig()
        return CONFIG.AUTO_HIDE_ENABLED
    end).LayoutOrder = nextOrder()
    
    return container
end

-- ============================================================
-- SECTION 22: MAIN GUI CREATION (WITH MOBILE SUPPORT)
-- ============================================================

local function toggleGui()
    guiVisible = not guiVisible
    if mainFrame then
        mainFrame.Visible = guiVisible
    end
end

local function createGui()
    screenGui = createElement("ScreenGui", {
        Name = "BrainrotFinder",
        ResetOnSpawn = false,
        DisplayOrder = 999999,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,  -- ADD THIS
        Parent = S.PlayerGui,
    })
    
    -- Advanced device detection
    local isMobile = S.UserInputService.TouchEnabled and not S.UserInputService.KeyboardEnabled
    local isTablet = S.UserInputService.TouchEnabled and workspace.CurrentCamera.ViewportSize.X >= 768
    local screenSize = workspace.CurrentCamera.ViewportSize
    
    -- Dynamic scaling based on screen size
    local function getScaleFactor()
        local baseWidth = 1920 -- Reference resolution
        local currentWidth = screenSize.X
        local scaleFactor = math.clamp(currentWidth / baseWidth, 0.5, 1.2)
        
        if isMobile and not isTablet then
            return math.clamp(scaleFactor * 0.85, 0.6, 0.9) -- Smaller for phones
        elseif isTablet then
            return math.clamp(scaleFactor * 1.0, 0.8, 1.1) -- Medium for tablets
        else
            return scaleFactor -- Full for desktop
        end
    end
    
    local globalScale = getScaleFactor()
    
    -- Responsive sizes with scale factor
    local overlayWidth = isMobile and 320 or (isTablet and 380 or 350)
    local overlayHeight = isMobile and 70 or (isTablet and 85 or 80)
    local mainWidth = isMobile and 340 or (isTablet and 450 or 400)
    local mainHeight = isMobile and 460 or (isTablet and 560 or 530)
    
    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.new(0, overlayWidth, 0, overlayHeight)
    overlay.Position = isMobile and UDim2.new(0.5, -overlayWidth/2, 0, 10) or (isTablet and UDim2.new(0.5, -overlayWidth/2, 0, 40) or UDim2.new(0.5, -170, 0, 40))
    overlay.BackgroundColor3 = COLORS.Background
    overlay.BackgroundTransparency = COLORS.BackgroundTransparency
    overlay.BorderSizePixel = 0
    overlay.ZIndex = 999999999999999
    overlay.Parent = screenGui
    
    Instance.new("UICorner", overlay).CornerRadius = UDim.new(0, 10)
    
    -- Add UIScale for responsive scaling (only for mobile/tablet)
    local overlayScale
    if isMobile or isTablet then
        overlayScale = Instance.new("UIScale")
        overlayScale.Scale = globalScale
        overlayScale.Parent = overlay
    end
    
    local titleSize = isMobile and 18 or (isTablet and 22 or 24)
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 22)
    title.Position = UDim2.new(0, isMobile and 15 or (isTablet and 20 or 95), 0, 5)
    title.BackgroundTransparency = 1
    title.Text = "BK's Hub | v2.5 ;)"
    title.Font = Enum.Font.GothamBold
    title.TextSize = titleSize
    title.TextColor3 = COLORS.Purple
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextScaled = isMobile
    title.ZIndex = 999999999999999
    title.Parent = overlay
    applyTitanzTextStyle(title)
    makeTextGlow(title, Color3.fromRGB(255, 140, 255), Color3.fromHSV(0.578947, 0.298039, 1.000000), 1.2, 0)
    addTextGradient(title, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45)    

    local subSize = isMobile and 14 or (isTablet and 18 or 20)
    local sub = Instance.new("TextLabel")
    sub.Size = UDim2.new(1, 0, 0, 18)
    sub.Position = UDim2.new(0, 15, 0, isMobile and 28 or (isTablet and 29 or 30))
    sub.BackgroundTransparency = 1
    sub.Text = "@bkmd_ytt | discord.gg/bkshub"
    sub.Font = Enum.Font.Gotham
    sub.TextSize = subSize
    sub.TextColor3 = COLORS.Pink
    sub.TextXAlignment = Enum.TextXAlignment.Left
    sub.TextScaled = isMobile
    sub.ZIndex = 999999999999999
    sub.Parent = overlay
    applyTitanzTextStyle(sub)
    makeTextGlow(sub, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(sub, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45)    
    
    local infoSize = isMobile and 14 or (isTablet and 16 or 18)
    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(1, -10, 0, 20)
    info.Position = UDim2.new(0, isMobile and 15 or (isTablet and 20 or 80), 0, isMobile and 48 or (isTablet and 50 or 53))
    info.BackgroundTransparency = 1
    info.Font = Enum.Font.GothamBold
    info.TextSize = infoSize
    info.TextColor3 = COLORS.Cyan
    info.TextXAlignment = Enum.TextXAlignment.Left
    info.TextScaled = isMobile
    info.ZIndex = 999999999999999
    info.Parent = overlay
    applyTitanzTextStyle(info)
    
    local frames = 0
    local last = tick()
    
    S.RunService.RenderStepped:Connect(function()
        frames += 1
        local now = tick()
        if now - last >= 1 then
            local fps = frames
            frames = 0
            last = now
            
            local rawPing = S.Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            local ping = math.floor(rawPing + 0.5)
            
            info.Text = "FPS: " .. fps .. "    PING: " .. ping .. "ms"
        end
    end)
    
    -- Calculate default position
    local defaultPos
    if CONFIG.GUI_POSITION_X and CONFIG.GUI_POSITION_Y then
        -- Use saved position if available
        print("[GUI] Loading saved position:", CONFIG.GUI_POSITION_X, CONFIG.GUI_POSITION_Y)
        defaultPos = UDim2.new(0, CONFIG.GUI_POSITION_X, 0, CONFIG.GUI_POSITION_Y)
    else
        -- Use default position based on device
        print("[GUI] No saved position, using default")
        if isMobile then
            defaultPos = UDim2.new(0.5, -mainWidth/2, 0.6, -mainHeight/2)
        elseif isTablet then
            defaultPos = UDim2.new(0.5, -mainWidth/2, 0.55, -mainHeight/2)
        else
            defaultPos = UDim2.new(0, 1200, 0, 0)
        end
    end

    mainFrame = createElement("Frame", {
        Name = "MainFrame",
        Size = UDim2.new(0, mainWidth, 0, mainHeight),
        Position = defaultPos,
        BackgroundColor3 = COLORS.Background,
        BackgroundTransparency = COLORS.BackgroundTransparency,
        BorderSizePixel = 0,
        Parent = screenGui,
    })
    
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
    
    -- Add UIScale for main frame (only for mobile/tablet)
    local mainScale
    if isMobile or isTablet then
        mainScale = Instance.new("UIScale")
        mainScale.Scale = globalScale
        mainScale.Parent = mainFrame
    end
    
    -- Auto-resize handler for screen orientation changes (only for mobile/tablet)
    if isMobile or isTablet then
        local function updateScreenScale()
            local newScreenSize = workspace.CurrentCamera.ViewportSize
            local newScaleFactor = getScaleFactor()
            
            if mainScale then
                mainScale.Scale = newScaleFactor
            end
            if overlayScale then
                overlayScale.Scale = newScaleFactor
            end
        end
        
        -- Connect to viewport size changes (orientation/resize)
        workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScreenScale)
    end
    
    if isMobile or isTablet then
    -- Mobile/Tablet toggle button (floating)
        local toggleButton = createElement("TextButton", {
            Size = UDim2.new(0, 65, 0, 65),
            Position = UDim2.new(1, -80, 0, 15),
            BackgroundColor3 = COLORS.Purple,
            BackgroundTransparency = 0.2,
            Text = ";)",
            TextColor3 = COLORS.Text,
            TextSize = 28,
            Font = Enum.Font.GothamBold,
            BorderSizePixel = 0,
            ZIndex = 999999999999999,
            Parent = screenGui,
        })
        makeTextGlow(toggleButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
        addTextGradient(toggleButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
        applyTitanzButtonStyle(toggleButton)
        
        -- Add UIScale to toggle button
        local toggleScale = Instance.new("UIScale")
        toggleScale.Scale = globalScale
        toggleScale.Parent = toggleButton
        
        createElement("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = toggleButton,
        })
        
        toggleButton.MouseButton1Click:Connect(function()
            toggleGui()
        end)
        
        -- Make button draggable
        local dragging = false
        local dragStart = nil
        local startPos = nil
        
        toggleButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = toggleButton.Position
            end
        end)
        
        toggleButton.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
        
        S.UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.Touch then
                local delta = input.Position - dragStart
                toggleButton.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)
    end
    
    local titleBar = createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = mainFrame,
    })
    
    local mainTitle = createElement("TextLabel", {
        Size = UDim2.new(1, -60, 0, 25),
        Position = UDim2.new(0, 15, 0, 10),
        BackgroundTransparency = 1,
        Text = "BK's Hub | v2.5 ;)",
        TextColor3 = COLORS.Purple,
        TextSize = isMobile and 17 or (isTablet and 18 or 19),
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextScaled = (isMobile or isTablet),
        Parent = titleBar,
    })
    makeTextGlow(mainTitle, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(mainTitle, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45)  

    local mainSub = createElement("TextLabel", {
        Size = UDim2.new(1, -60, 0, 18),
        Position = UDim2.new(0, 15, 0, 35),
        BackgroundTransparency = 1,
        Text = "by Tuff Boii | @bkmd_ytt | discord.gg/bkshub",
        TextColor3 = COLORS.Pink,
        TextSize = isMobile and 11 or (isTablet and 12 or 13),
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextScaled = (isMobile or isTablet),
        Parent = titleBar,
    })
    makeTextGlow(mainSub, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(mainSub, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45)  
        
    local tabBar = createElement("Frame", {
        Size = UDim2.new(1, -20, 0, 40),
        Position = UDim2.new(0, 10, 0, 60),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        Parent = mainFrame,
    })
    
    Instance.new("UICorner", tabBar).CornerRadius = UDim.new(0, 10)
    
    local tabButtons = {}
    local tabNames = { "Brainrots", "Priority", "Tuff :3", "Stats" }
    local tabIds = { "animals", "favorites", "actions", "stats" }
    
    local numTabs = #tabNames
    local tabWidth = (1 / numTabs)
    local tabTextSize = isMobile and 12 or (isTablet and 13 or 14)
    
    for i, tabName in ipairs(tabNames) do
        local isActive = (currentTab == tabIds[i])
        
        local tabButton = createElement("TextButton", {
            Size = UDim2.new(tabWidth, 0, 1, 0),
            Position = UDim2.new(tabWidth * (i - 1), 0, 0, 0),
            BackgroundTransparency = 1,
            Text = tabName,
            TextColor3 = isActive and COLORS.Purple or COLORS.TextDim,
            TextSize = tabTextSize,
            Font = Enum.Font.GothamBold,
            BorderSizePixel = 0,
            Parent = tabBar,
        })

        makeTextGlow(tabButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
        addTextGradient(tabButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
        
        tabButtons[tabIds[i]] = tabButton
    end
    
    contentFrame = createElement("Frame", {
        Name = "ContentFrame",
        Size = UDim2.new(1, 0, 1, -110),
        Position = UDim2.new(0, 0, 0, 110),
        BackgroundTransparency = 1,
        Parent = mainFrame,
    })
    
    local animalsTab = createAnimalsTab(contentFrame)
    local favoritesTab, refreshFavoritesList = createFavoritesTab(contentFrame)
    local actionsTab = createActionsTab(contentFrame)
    local statsTab, statsLabels = createStatsTab(contentFrame)
    
    statLabels = statsLabels
    
    local function switchTab(tabId)
        currentTab = tabId
        
        if animalsTab then animalsTab.Visible = (tabId == "animals") end
        if favoritesTab then favoritesTab.Visible = (tabId == "favorites") end
        if actionsTab then actionsTab.Visible = (tabId == "actions") end
        if statsTab then statsTab.Visible = (tabId == "stats") end
        
        if tabId == "favorites" and refreshFavoritesList then
            task.spawn(refreshFavoritesList)
        end
        
        for id, button in pairs(tabButtons) do
            tween(button, tweenInfoFast, {
                TextColor3 = (id == tabId) and COLORS.Purple or COLORS.TextDim,
            })
        end
    end
    
    for id, button in pairs(tabButtons) do
        button.MouseButton1Click:Connect(function()
            switchTab(id)
        end)
    end
    
    -- Dragging support (both mouse and touch)
    local dragging, dragStart, startPos

    local function startDrag(input)
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end

    local function stopDrag()
        if dragging then
            dragging = false
            saveGuiPosition()
        end
    end

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            startDrag(input)
        end
    end)

    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            stopDrag()
        end
    end)

    tabBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            startDrag(input)
        end
    end)

    tabBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            stopDrag()
        end
    end)

    S.UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Global input ended handler to catch all drag stops
    S.UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            stopDrag()
        end
    end)
    
    return statLabels
end

local function createMiniGui()
    if screenGui:FindFirstChild("MiniGuiContainer") then
        screenGui.MiniGuiContainer:Destroy()
    end
    
    -- Calculate default position
    local defaultPos
    if CONFIG.MINI_GUI_POSITION_X and CONFIG.MINI_GUI_POSITION_Y then
        -- Use saved position if available
        print("[Mini GUI] Loading saved position:", CONFIG.MINI_GUI_POSITION_X, CONFIG.MINI_GUI_POSITION_Y)
        defaultPos = UDim2.new(0, CONFIG.MINI_GUI_POSITION_X, 0, CONFIG.MINI_GUI_POSITION_Y)
    else
        -- Use default position
        print("[Mini GUI] No saved position, using default")
        defaultPos = UDim2.new(1, -350, 0, 500)  -- TOP RIGHT
    end
    
    local container = createElement("Frame", {
        Name = "MiniGuiContainer",
        Size = UDim2.new(0, 340, 0, 300),
        Position = defaultPos,  -- Use calculated position
        BackgroundTransparency = 1,
        Parent = screenGui,
    })

    miniGuiContainer = container
    
    local isMinimized = false
    
    -- Container for sections with layout
    local sectionsContainer = createElement("Frame", {
        Name = "SectionsContainer",
        Size = UDim2.new(1, 0, 1, -65),
        Position = UDim2.new(0, 0, 0, 65),
        BackgroundTransparency = 1,
        Parent = container,
    })
    
    -- Horizontal layout for sections (side by side)
    local sectionsLayout = createElement("UIListLayout", {
        Padding = UDim.new(0, 10),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = sectionsContainer,
    })
    
    local function createSection(title, order)
        local section = createElement("Frame", {
            Size = UDim2.new(0, 160, 0, 22),
            BackgroundColor3 = COLORS.Background,
            BackgroundTransparency = COLORS.BackgroundTransparency,
            BorderSizePixel = 0,
            LayoutOrder = order,
            Parent = sectionsContainer,
        })
        
        createElement("UICorner", {
            CornerRadius = UDim.new(0, 12),
            Parent = section,
        })
        
        createElement("UIStroke", {
            Color = COLORS.Accent,
            Thickness = 1.5,
            Transparency = 0.35,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Parent = section,
        })
        
        local sectionLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Parent = section,
        })
        
        createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12),
            PaddingBottom = UDim.new(0, 12),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            Parent = section,
        })
        
        sectionLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            section.Size = UDim2.new(0, 160, 0, sectionLayout.AbsoluteContentSize.Y + 24)
        end)
        
        local header = createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
            Text = title,
            TextColor3 = COLORS.Accent,
            TextSize = 14,
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = 0,
            Parent = section,
        })
        makeTextGlow(header, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
        addTextGradient(header, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
        applyTitanzTextStyle(header)
        
        return section, header
    end
    
    local function createToggle(parent, text, configKey, enableFunc, disableFunc, order)
        local container = createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 38),
            BackgroundColor3 = COLORS.Surface,
            BackgroundTransparency = COLORS.SurfaceTransparency,
            BorderSizePixel = 0,
            LayoutOrder = order,
            Parent = parent,
        })
        
        createElement("UICorner", {
            CornerRadius = UDim.new(0, 10),
            Parent = container,
        })
        makeTextGlow(container, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
        addTextGradient(container, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
        applyTitanzButtonStyle(container)
        
        local label = createElement("TextLabel", {
            Size = UDim2.new(1, -55, 1, 0),
            Position = UDim2.new(0, 8, 0, 0),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = COLORS.Text,
            TextSize = 10,
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = container,
        })
        makeTextGlow(label, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
        addTextGradient(label, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
        applyTitanzTextStyle(label)
        
        local function getState()
            return CONFIG[configKey] == true
        end
        
        local initialState = getState()
        local onColor = COLORS.Accent
        local offColor = blendColor(COLORS.Surface, COLORS.Accent, 0.25)
        
        local switch = createElement("Frame", {
            Size = UDim2.new(0, 42, 0, 22),
            Position = UDim2.new(1, -48, 0.5, -11),
            BackgroundColor3 = initialState and onColor or offColor,
            BackgroundTransparency = initialState and 0.10 or 0.40,
            BorderSizePixel = 0,
            Parent = container,
        })
        
        createElement("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = switch,
        })

        makeTextGlow(switch, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
        addTextGradient(switch, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
        
        local knob = createElement("Frame", {
            Size = UDim2.new(0, 18, 0, 18),
            Position = initialState and UDim2.new(0, 22, 0.5, -9) or UDim2.new(0, 2, 0.5, -9),
            BackgroundColor3 = COLORS.Text,
            BorderSizePixel = 0,
            Parent = switch,
        })
        
        createElement("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = knob,
        })
        
        makeTextGlow(knob, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
        addTextGradient(knob, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
        applyTitanzButtonStyle(knob)
        
        local button = createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = "",
            Parent = container,
        })
        
        local function updateUI()
            local currentState = getState()
            
            tween(switch, tweenInfoFast, {
                BackgroundColor3 = currentState and onColor or offColor,
                BackgroundTransparency = currentState and 0.10 or 0.40,
            })
            
            tween(knob, tweenInfoFast, {
                Position = currentState and UDim2.new(0, 22, 0.5, -9) or UDim2.new(0, 2, 0.5, -9),
            })
        end
        
        button.MouseButton1Click:Connect(function()
            CONFIG[configKey] = not CONFIG[configKey]
            local newState = CONFIG[configKey]
            
            if newState and enableFunc then
                enableFunc()
            elseif not newState and disableFunc then
                disableFunc()
            end
            
            saveConfig()
            updateUI()
        end)
        
        task.defer(updateUI)
        
        return container
    end
    
    local function createButton(parent, text, color, callback, order)
        local button = createElement("TextButton", {
            Size = UDim2.new(1, 0, 0, 36),
            BackgroundColor3 = color,
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            LayoutOrder = order,
            Text = text,
            TextColor3 = COLORS.Text,
            TextSize = 12,
            Font = Enum.Font.GothamBold,
            Parent = parent,
        })
        
        createElement("UICorner", {
            CornerRadius = UDim.new(0, 10),
            Parent = button,
        })

        makeTextGlow(button, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
        addTextGradient(button, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
        
        applyTitanzButtonStyle(button)
        applyTitanzTextStyle(button)
        
        button.MouseButton1Click:Connect(callback)
        
        button.MouseEnter:Connect(function()
            tween(button, tweenInfoFast, { BackgroundTransparency = 0.1 })
        end)
        
        button.MouseLeave:Connect(function()
            tween(button, tweenInfoFast, { BackgroundTransparency = 0.3 })
        end)
        
        return button
    end
    
    -- Header Section (full width at top)
    local headerSection = createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 55),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = COLORS.Background,
        BackgroundTransparency = COLORS.BackgroundTransparency,
        BorderSizePixel = 0,
        Parent = container,
    })
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = headerSection,
    })
    
    createElement("UIStroke", {
        Color = COLORS.Accent,
        Thickness = 1.5,
        Transparency = 0.35,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = headerSection,
    })
    
    local headerTitle = createElement("TextLabel", {
        Size = UDim2.new(1, -50, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = ";) Undivided Mini Gui",
        TextColor3 = COLORS.Accent,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        Parent = headerSection,
    })
    applyTitanzTextStyle(headerTitle)
    makeTextGlow(headerTitle, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(headerTitle, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45)  
    
    local minimizeButton = createElement("TextButton", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(1, -40, 0.5, -16),
        BackgroundColor3 = COLORS.Surface,
        BackgroundTransparency = 0.3,
        Text = "-",
        TextColor3 = COLORS.Text,
        TextSize = 22,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = headerSection,
    })
    makeTextGlow(minimizeButton, Color3.fromRGB(255, 140, 255), Color3.fromRGB(180, 220, 255), 1.2, 0.3)
    addTextGradient(minimizeButton, Color3.new(0.815686, 0.305882, 1.000000), Color3.fromHSV(0.578947, 0.298039, 1.000000), 45) 
    
    createElement("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = minimizeButton,
    })
    
    applyTitanzButtonStyle(minimizeButton)
    applyTitanzTextStyle(minimizeButton)
    
    local sectionsToHide = {}
    
    -- AUTO STEAL Section (left column)
    local stealSection, stealHeader = createSection("AUTO STEAL", 1)
    table.insert(sectionsToHide, stealSection)
    
    createToggle(stealSection, "Auto-Steal Best", "AUTO_STEAL_ENABLED", 
        function()
            CONFIG.AUTO_STEAL_NEAREST_ENABLED = false
        end, 
        nil, 1)
    
    createToggle(stealSection, "Auto-Steal Nearest", "AUTO_STEAL_NEAREST_ENABLED", 
        function()
            CONFIG.AUTO_STEAL_ENABLED = false
        end, 
        nil, 2)
    
    createToggle(stealSection, "Auto-Steal Priority", "AUTO_STEAL_PRIORITY_ENABLED", nil, nil, 3)
    createToggle(stealSection, "Speed Boost", "STEAL_SPEED_ENABLED", nil, nil, 4)
    createToggle(stealSection, "Disable Animation", "STEAL_DISABLE_ANIM_ENABLED", nil, nil, 5)
    
    -- ACTIONS Section (right column)
    local actionsSection, actionsHeader = createSection("ACTIONS", 2)
    table.insert(sectionsToHide, actionsSection)
    
    createButton(actionsSection, "TP Highest", Color3.fromRGB(0, 200, 255), function()
        teleportToHighest()
    end, 1)
    
    createButton(actionsSection, "Desync V3", Color3.fromRGB(180, 0, 255), function()
        enableDesync()
    end, 2)
    
    createButton(actionsSection, "Instant Cloner", Color3.fromRGB(180, 0, 255), function()
        instantCloner()
    end, 3)

    createButton(actionsSection, "Rejoin", Color3.fromRGB(50, 150, 255), function()
        rejoinServer()
    end, 4)
    
    createButton(actionsSection, "Kick", Color3.fromRGB(255, 60, 60), function()
        kickSelf()
    end, 5)
     
    minimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        
        minimizeButton.Text = isMinimized and "+" or "-"
        
        for _, section in ipairs(sectionsToHide) do
            section.Visible = not isMinimized
        end
        
        -- Adjust container size when minimized
        if isMinimized then
            tween(container, tweenInfoMedium, {
                Size = UDim2.new(0, 340, 0, 65)
            })
            tween(sectionsContainer, tweenInfoMedium, {
                Size = UDim2.new(1, 0, 0, 0)
            })
        else
            tween(container, tweenInfoMedium, {
                Size = UDim2.new(0, 340, 0, 300)
            })
            tween(sectionsContainer, tweenInfoMedium, {
                Size = UDim2.new(1, 0, 1, -65)
            })
        end
    end)
    
    minimizeButton.MouseEnter:Connect(function()
        tween(minimizeButton, tweenInfoFast, {
            BackgroundTransparency = 0.1,
            TextColor3 = COLORS.Accent
        })
    end)
    
    minimizeButton.MouseLeave:Connect(function()
        tween(minimizeButton, tweenInfoFast, {
            BackgroundTransparency = 0.3,
            TextColor3 = COLORS.Text
        })
    end)
    
    local dragging, dragStart, startPos
    
    headerSection.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = container.Position
        end
    end)
    
    headerSection.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            saveMiniGuiPosition()  -- SAVE POSITION WHEN DRAG ENDS
        end
    end)
    
    S.UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            container.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    -- Global input ended handler to catch all drag stops
    S.UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                dragging = false
                saveMiniGuiPosition()  -- SAVE POSITION WHEN DRAG ENDS
            end
        end
    end)
    
    return container
end

-- ============================================================
-- SECTION 23: INITIALIZATION & EVENT HANDLERS
-- ============================================================

S.UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == CONFIG.TELEPORT_KEYBIND then
        teleportToHighest()
        
    elseif input.KeyCode == CONFIG.TOGGLE_GUI_KEYBIND then
        toggleGui()
        
    elseif input.KeyCode == CONFIG.INSTANT_CLONER_KEYBIND then
        instantCloner()
        
    elseif input.KeyCode == CONFIG.KICK_SELF_KEYBIND then
        kickSelf()
        
    elseif input.KeyCode == CONFIG.REJOIN_KEYBIND then
        rejoinServer()
        
    elseif input.KeyCode == CONFIG.FLOOR_STEAL_KEYBIND then
        CONFIG.FLOOR_STEAL_ENABLED = not CONFIG.FLOOR_STEAL_ENABLED
        saveConfig()
        if CONFIG.FLOOR_STEAL_ENABLED then
            startFloorSteal()
            showNotification("Floor Steal Enabled", COLORS.Cyan)
        else
            stopFloorSteal()
            showNotification("Floor Steal Disabled", COLORS.Red)
        end
    
    elseif input.KeyCode == CONFIG.DESYNC_KEYBIND then
        enableDesync()
    end
end)

pcall(loadConfig)
pcall(loadFavorites)
print("[Config] Loaded GUI_POSITION_X:", CONFIG.GUI_POSITION_X, "GUI_POSITION_Y:", CONFIG.GUI_POSITION_Y) -- Debug

if not game:IsLoaded() then
    game.Loaded:Wait()
end

task.spawn(function()
    createGui()
    createMiniGui()
    UNLOCK_BASE.CreateGUI()
    UNLOCK_BASE.Show()
end)

initializePlotScanner(statLabels)
autoStealLoop()
setupPromptCacheCleanup()

if CONFIG.AUTO_TP_ENABLED then
    task.spawn(autoTeleportOnStart)
end

screenGui.Destroying:Connect(function()
    cleanupScanner()
    clearAllESP()
end)

S.RunService.Heartbeat:Connect(playerESPHeartbeat)

task.spawn(function()
    if CONFIG.AUTO_DESYNC_ENABLED then
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        task.wait(1)
        enableDesync()
    end

    if CONFIG.OptimizerEnabled then
        pcall(OPTIMIZER.Enable)
        showNotification("Load Tuff Optimizer Auto-Enabled", COLORS.Success)
    end
    
    if CONFIG.INVISIBLE_BASE_WALLS_ENABLED then
        enableInvisibleBaseWalls()
    end
    
    if CONFIG.FLOOR_STEAL_ENABLED then
        startFloorSteal()
    end
    
    if CONFIG.ANTI_LAG_ENABLED then
        ANTI_LAG.Enable()
    end
    
    if CONFIG.ANTI_BEE_DISCO_ENABLED then
        ANTI_BEE_DISCO.Enable()
    end
    
    if CONFIG.ANTI_RAGDOLL_V1_ENABLED then
        ANTI_RAGDOLL.Enable("v2")
    elseif CONFIG.ANTI_RAGDOLL_V2_ENABLED then
        ANTI_RAGDOLL.Enable("v1")
    end
end)

if CONFIG.AUTO_HIDE_ENABLED then
    task.spawn(function()
        task.wait(1)
        if mainFrame and mainFrame.Parent and guiVisible then
            toggleGui()
        end
    end)
end