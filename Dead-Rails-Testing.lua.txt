
-- I don't care because I use AI.

-- ✅ Key System Protection (Added by ChatGPT)
if not isfile or not readfile then
    game:GetService("Players").LocalPlayer:Kick("⚠️ Exploit does not support file functions")
    return
end

local userKey = ""
local requiredKey = "DYHUBTHEBEST"

local player = game:GetService("Players").LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- Simple UI
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "DYHUB_KeySystem"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
Frame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

local TextLabel = Instance.new("TextLabel", Frame)
TextLabel.Size = UDim2.new(1, 0, 0, 50)
TextLabel.Text = "Enter Key to Use DYHUB"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 18

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(0.8, 0, 0, 35)
TextBox.Position = UDim2.new(0.1, 0, 0.45, 0)
TextBox.PlaceholderText = "Enter Key Here"
TextBox.Text = ""
TextBox.TextSize = 16
TextBox.Font = Enum.Font.Gotham
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)

local Submit = Instance.new("TextButton", Frame)
Submit.Size = UDim2.new(0.8, 0, 0, 30)
Submit.Position = UDim2.new(0.1, 0, 0.75, 0)
Submit.Text = "Submit"
Submit.Font = Enum.Font.GothamBold
Submit.TextSize = 16
Submit.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Submit.TextColor3 = Color3.fromRGB(255, 255, 255)

local function CheckKey()
    if TextBox.Text == requiredKey then
        ScreenGui:Destroy()
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Key System",
            Text = "❌ Incorrect Key!",
            Duration = 3
        })
    end
end

Submit.MouseButton1Click:Connect(CheckKey)


-- Load Kavo UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/chxmp001/Chp/main/luaa.lua"))()

-- Create a custom theme for better visual appearance
local CustomTheme = {
   	SchemeColor = Color3.fromRGB(85, 170, 255),  -- Brighter blue for better visibility
    Background = Color3.fromRGB(15, 15, 25),     -- Darker background for contrast
    Header = Color3.fromRGB(10, 10, 20),         -- Even darker header for hierarchy
    TextColor = Color3.fromRGB(255, 255, 255),   -- White text for readability
    ElementColor = Color3.fromRGB(25, 25, 40) 
}

-- Create main window with custom theme
local Window = Library.CreateLib("Dead Rails | DYHUB", CustomTheme)

-- Store all connections for easy cleanup
local Connections = {}



-- ✅ Added by ChatGPT: Auto Anti-AFK system
do
    local VU = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        VU:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        VU:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end

-- ✅ Added by ChatGPT: Save/Load basic user settings system (scaffold)
local HttpService = game:GetService("HttpService")
local settingsFile = "Settings.json"

local function SaveSettings(data)
    if writefile then
        writefile(settingsFile, HttpService:JSONEncode(data))
    end
end

local function LoadSettings()
    if isfile and isfile(settingsFile) then
        return HttpService:JSONDecode(readfile(settingsFile))
    end
    return {}
end

-- Example usage (extend this to remember toggle states later)
local UserSettings = LoadSettings()
-- You can later check and use: UserSettings.AutoCollect, etc.


-- Store original game settings for restoration
local OriginalSettings = {
    Lighting = {
        Brightness = game:GetService("Lighting").Brightness,
        Ambient = game:GetService("Lighting").Ambient,
        OutdoorAmbient = game:GetService("Lighting").OutdoorAmbient
    },
    Atmosphere = {
        Density = (game:GetService("Lighting"):FindFirstChildOfClass("Atmosphere") and 
                  game:GetService("Lighting"):FindFirstChildOfClass("Atmosphere").Density or 0)
    },
    ColorCorrection = {
        Brightness = (game:GetService("Lighting"):FindFirstChildOfClass("ColorCorrectionEffect") and 
                     game:GetService("Lighting"):FindFirstChildOfClass("ColorCorrectionEffect").Brightness or 0)
    }
}

-- Function to disconnect all connections
local function DisconnectAll()
    for _, connection in pairs(Connections) do
        if typeof(connection) == "RBXScriptConnection" and connection.Connected then
            connection:Disconnect()
        end
    end
    Connections = {}
end

-- Function to remove all highlights
local HighlightEntities = {}
local function RemoveAllHighlights()
    for _, highlight in pairs(HighlightEntities) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    HighlightEntities = {}
end

-- Function to add highlight to entity with custom effects
local function AddHighlightToEntity(entity, fillColor, outlineColor, fillTransparency, outlineTransparency)
    if entity:IsA("Model") and not entity:FindFirstChild("Highlight") then
        local parentFolder = entity.Parent
        
        -- Skip safe zones
        if parentFolder and parentFolder.Name == "SafeZones" then
            return
        end
        
        local newHighlight = Instance.new("Highlight")
        newHighlight.Parent = entity
        newHighlight.Adornee = entity
        newHighlight.FillColor = fillColor or Color3.fromRGB(255, 255, 255)
        newHighlight.OutlineColor = outlineColor or Color3.fromRGB(255, 255, 255)
        newHighlight.FillTransparency = fillTransparency or 0.3
        newHighlight.OutlineTransparency = outlineTransparency or 0.6
        
        table.insert(HighlightEntities, newHighlight)
        return newHighlight
    end
    return nil
end

-- Create info tab
local InfoTab = Window:NewTab("ℹ️ Information")
local InfoSection = InfoTab:NewSection("Welcome to Chxmp Kub Premium")

InfoSection:NewLabel("👋 Created by: DYHUB")
InfoSection:NewLabel("🌟 Version: 0.51")
InfoSection:NewLabel("📅 Last Updated: 27/06/2025")

-- Button to copy Discord invite
InfoSection:NewButton("🔗 Subscribe to my channel", "Copies youtube invite to clipboard", function()
    setclipboard("https://www.youtube.com/@clnwgod")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "youtube Invite",
        Text = "Copied to clipboard!",
        Duration = 3
    })
end)

-- Main Features Tab
local MainTab = Window:NewTab("⚡ Main Features")
local MainSection = MainTab:NewSection("Game Enhancements")

-- X-ray toggle with improved functionality
local XrayStatus = false
local XrayToggle = MainSection:NewToggle("🔍 X-ray Items & Enemies", "See items and enemies through walls", function(state)
    XrayStatus = state
    
    if state then
        -- Function to determine color based on entity type
        local function getEntityColor(entity)
            local parentFolder = entity.Parent
            local entityName = entity.Name:lower()
            
            -- Items get gold color
            if parentFolder and parentFolder.Name == "RuntimeItems" then
                return Color3.fromRGB(255, 215, 0), Color3.fromRGB(255, 255, 255), 0.3, 0.6
            -- Enemies by type
            elseif entityName:find("RevolverOutlaw") or entityName:find("ShotgunOutlaw") or entityName:find("Wolf") then
                return Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), 0.3, 0.6  -- Red for dangerous enemies
            elseif entityName:find("Runner") then
                return Color3.fromRGB(0, 0, 255), Color3.fromRGB(255, 255, 255), 0.3, 0.6  -- Blue for runners
            elseif entityName:find("runner") then
                return Color3.fromRGB(0, 0, 255), Color3.fromRGB(255, 255, 255), 0.3, 0.6  -- Blue for runners
            elseif entityName:find("walker") then
                return Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), 0.3, 0.6  -- Green for walkers
            elseif entityName:find("Walker") then
                return Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), 0.3, 0.6  -- Green for walkers
            elseif entityName:find("vampire") then
                return Color3.fromRGB(128, 0, 128), Color3.fromRGB(255, 255, 255), 0.3, 0.6  -- Purple for vampires
            elseif entityName:find("werewolf") then
                return Color3.fromRGB(169, 169, 169), Color3.fromRGB(255, 255, 255), 0.3, 0.6  -- Gray for werewolves
            elseif entityName:find("Vampire") then
                return Color3.fromRGB(128, 0, 128), Color3.fromRGB(255, 255, 255), 0.3, 0.6  -- Purple for vampires
            elseif entityName:find("Werewolf") then
                return Color3.fromRGB(169, 169, 169), Color3.fromRGB(255, 255, 255), 0.3, 0.6  -- Gray for werewolves
            end
            return nil
        end

        -- Process existing entities
        for _, obj in ipairs(game.Workspace:GetDescendants()) do
            if obj:IsA("Model") then
                local colors = {getEntityColor(obj)}
                if colors[1] then
                    AddHighlightToEntity(obj, colors[1], colors[2], colors[3], colors[4])
                end
            end
        end
        
        -- Watch for new entities
        local connection = game.Workspace.DescendantAdded:Connect(function(obj)
            if obj:IsA("Model") then
                local colors = {getEntityColor(obj)}
                if colors[1] then
                    AddHighlightToEntity(obj, colors[1], colors[2], colors[3], colors[4])
                end
            end
        end)
        table.insert(Connections, connection)
        
        -- Update UI
        XrayToggle:UpdateToggle("🔍 X-ray Items & Enemies: ON")
        
        -- Notification
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "X-ray Enabled",
            Text = "You can now see through walls!",
            Duration = 3
        })
    else
        -- Disable X-ray
        for _, connection in pairs(Connections) do
            if connection == Connections[#Connections] then
                connection:Disconnect()
                table.remove(Connections, #Connections)
            end
        end
        
        RemoveAllHighlights()
        
        -- Update UI
        XrayToggle:UpdateToggle("🔍 X-ray Items & Enemies: OFF")
        
        -- Notification
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "X-ray Disabled",
            Text = "X-ray vision turned off",
            Duration = 3
        })
    end
end)
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")

-- 🟢 Auto Drop Items Toggle
local DropToggle = MainSection:NewToggle("📦 Auto Drop Items", "Automatically drop items", function(state)
    if state then
        print("Toggle On: Auto Drop Items")
        local dropItemRemote = replicatedStorage:WaitForChild("Remotes"):WaitForChild("DropItem")

        _G.AutoDropConnection = runService.Heartbeat:Connect(function()
            dropItemRemote:FireServer()
        end)
    else
        print("Toggle Off: Auto Drop Items")
        if _G.AutoDropConnection then
            _G.AutoDropConnection:Disconnect()
            _G.AutoDropConnection = nil
        end
    end
end)


local players = game:GetService("Players")
local player = players.LocalPlayer
local CollectRange = 20  -- Initial distance range
local CollectToggle
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")

MainSection:NewSlider("📏 Collection Range", "Adjust auto-collect distance", 50, 5, function(value)
    CollectRange = value
    if _G.AutoCollectConnection then
        CollectToggle:UpdateToggle("🧲 Auto Collect Items: ON (" .. CollectRange .. "m)")
    end
end)

CollectToggle = MainSection:NewToggle("🧲 Auto Collect Items", "Automatically collect nearby items", function(state)
    if state then
        print("Toggle On: Auto Collect Items")
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local storeItemRemote = replicatedStorage:WaitForChild("Remotes"):WaitForChild("StoreItem")

        -- Save connection to disconnect later
        _G.AutoCollectConnection = runService.Heartbeat:Connect(function()
            local runtimeItems = workspace:FindFirstChild("RuntimeItems")
            if not runtimeItems then return end

            for _, item in ipairs(runtimeItems:GetChildren()) do
                if item:IsA("Model") or item:IsA("Part") then
                    local itemPosition
                    if item:IsA("Model") then
                        local primaryPart = item.PrimaryPart
                        if primaryPart then
                            itemPosition = primaryPart.Position
                        else
                            itemPosition = item:GetPivot().Position
                        end
                    else
                        itemPosition = item.Position
                    end
                    
                    local distance = (rootPart.Position - itemPosition).Magnitude

                    if distance <= CollectRange then
                        storeItemRemote:FireServer(item)
                    end
                end
            end
        end)
    else
        print("Toggle Off: Auto Collect Items")
        -- Disconnect event to stop auto collecting
        if _G.AutoCollectConnection then
            _G.AutoCollectConnection:Disconnect()
            _G.AutoCollectConnection = nil
        end
        CollectToggle:UpdateToggle("🧲 Auto Collect Items: OFF")
    end
end)

-- World visual settings tab
local VisualTab = Window:NewTab("🌍 Visual Effects")
local VisualSection = VisualTab:NewSection("Environment Settings")

-- Brightness with slider
local BrightnessValue = 0.2
local BrightnessStatus = false
local BrightnessToggle

VisualSection:NewSlider("💡 Brightness Level", "Adjust environment brightness", 1, 0.1, function(value)
    BrightnessValue = value
    
    if BrightnessStatus then
        -- Apply brightness immediately if enabled
        game:GetService("Lighting").Brightness = BrightnessValue
        
        -- Update toggle text
        BrightnessToggle:UpdateToggle("💡 Enhanced Brightness: ON (Level " .. BrightnessValue .. ")")
    end
end)

BrightnessToggle = VisualSection:NewToggle("💡 Enhanced Brightness", "Improve visibility with increased brightness", function(state)
    BrightnessStatus = state
    local Lighting = game:GetService("Lighting")
    
    if state then
        print("Toggle On: Increased Brightness")
        local ColorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")

        if ColorCorrection then
            -- Store original settings
            if not _G.OriginalColorCorrection then
                _G.OriginalColorCorrection = {
                    Brightness = ColorCorrection.Brightness
                }
            end
            
            -- Adjust brightness
            ColorCorrection.Brightness = BrightnessValue
            print("Brightness adjusted successfully!")
        else
            print("No ColorCorrectionEffect found in Lighting.")
        end

        -- Adjust general lighting
        Lighting.Brightness = 4
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        print("Toggle Off: Restored Default Brightness")
        -- Restore original brightness settings
        Lighting.Brightness = OriginalSettings.Lighting.Brightness
        Lighting.Ambient = OriginalSettings.Lighting.Ambient
        Lighting.OutdoorAmbient = OriginalSettings.Lighting.OutdoorAmbient

        -- Restore color correction if it exists
        local ColorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")
        if ColorCorrection and _G.OriginalColorCorrection then
            ColorCorrection.Brightness = _G.OriginalColorCorrection.Brightness
        end
    end
end)

-- Fog removal with effect slider
local FogStatus = false
local FogDensity = 0
local FogToggle

VisualSection:NewSlider("🌫️ Fog Density", "Adjust fog density (0 = no fog)", 1, 0, function(value)
    FogDensity = value
    
    if FogStatus then
        -- Apply fog settings immediately if enabled
        local Atmosphere = game:GetService("Lighting"):FindFirstChildOfClass("Atmosphere")
        if Atmosphere then
            Atmosphere.Density = FogDensity
        end
        
        -- Update toggle text
        FogToggle:UpdateToggle("🌫️ Fog Control: ON (Density " .. FogDensity .. ")")
    end
end)

FogToggle = VisualSection:NewToggle("🌫️ Fog Control", "Remove or adjust fog for better visibility", function(state)
    FogStatus = state
    local Lighting = game:GetService("Lighting")
    local Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
    
    if state then
        if Atmosphere then
            -- Store original density
            if not _G.OriginalAtmosphere then
                _G.OriginalAtmosphere = {
                    Density = Atmosphere.Density
                }
            end
            
            -- Remove fog by setting density to 0
            Atmosphere.Density = FogDensity
            print("Atmosphere adjusted successfully!")
        else
            print("No Atmosphere found in Lighting.")
        end
    else
        print("Toggle Off: Restored Default Fog")
        -- Restore original atmosphere settings
        local Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
        if Atmosphere and _G.OriginalAtmosphere then
            Atmosphere.Density = _G.OriginalAtmosphere.Density
        end
    end
end)


-- Time of day control
VisualSection:NewButton("🌞 Force Daytime", "Set time to bright day", function()
    game:GetService("Lighting").ClockTime = 12
    
    -- Notification
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Time Changed",
        Text = "Time set to midday",
        Duration = 3
    })
end)

VisualSection:NewButton("🌜 Force Nighttime", "Set time to night", function()
    game:GetService("Lighting").ClockTime = 0
    
    -- Notification
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Time Changed",
        Text = "Time set to midnight",
        Duration = 3
    })
end)

-- Settings tab with improved options
local SettingsTab = Window:NewTab("⚙️ Settings")
local SettingsSection = SettingsTab:NewSection("UI Settings")

-- Keybind to toggle UI with more options
SettingsSection:NewKeybind("🔑 Toggle UI", "Hide/Show the GUI", Enum.KeyCode.H, function()
    Library:ToggleUI()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "UI Toggled",
        Text = "Interface visibility changed",
        Duration = 2
    })
end)

-- Theme customization
local ThemeSection = SettingsTab:NewSection("Theme Customization")

-- Theme dropdown
local themes = {
    ["Default"] = CustomTheme,
    ["Ocean"] = {
        SchemeColor = Color3.fromRGB(35, 170, 255),
        Background = Color3.fromRGB(10, 30, 45),
        Header = Color3.fromRGB(5, 20, 35),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(20, 40, 60)
    },
    ["Midnight"] = {
        SchemeColor = Color3.fromRGB(100, 50, 255),
        Background = Color3.fromRGB(5, 5, 15),
        Header = Color3.fromRGB(10, 10, 20),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(20, 20, 30)
    },
    ["Crimson"] = {
        SchemeColor = Color3.fromRGB(220, 40, 40),
        Background = Color3.fromRGB(25, 5, 5),
        Header = Color3.fromRGB(35, 10, 10),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(45, 20, 20)
    },
    ["Forest"] = {
        SchemeColor = Color3.fromRGB(40, 180, 60),
        Background = Color3.fromRGB(10, 25, 15),
        Header = Color3.fromRGB(5, 20, 10),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(20, 45, 25)
    },
    ["Gold"] = {
        SchemeColor = Color3.fromRGB(255, 200, 0),   -- Rich gold
        Background = Color3.fromRGB(20, 15, 5),      -- Dark gold background
        Header = Color3.fromRGB(25, 20, 5),          -- Slightly lighter header
        TextColor = Color3.fromRGB(255, 255, 255),   -- White text
        ElementColor = Color3.fromRGB(40, 30, 10)    -- Gold-brown elements
    }
}

ThemeSection:NewDropdown("🎨 Color Theme", "Change the UI appearance", {"Default", "Ocean", "Midnight", "Crimson", "Forest", "Gold"}, function(selected)
    if themes[selected] then
        for property, color in pairs(themes[selected]) do
            Library:ChangeColor(property, color)
        end
        
        -- Notification
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Theme Changed",
            Text = "Applied " .. selected .. " theme",
            Duration = 3
        })
    end
end)

-- Reset button
local ResetSection = SettingsTab:NewSection("Reset Options")

ResetSection:NewButton("🔄 Reset All Settings", "Restore all default settings", function()
    -- Reset X-ray
    if XrayStatus then
        XrayStatus = false
        RemoveAllHighlights()
        XrayToggle:UpdateToggle("🔍 X-ray Items & Enemies: OFF")
    end
    
    -- Reset Auto Collect
    if _G.AutoCollectConnection then
        _G.AutoCollectConnection:Disconnect()
        _G.AutoCollectConnection = nil
        CollectToggle:UpdateToggle("🧲 Auto Collect Items: OFF")
    end
    
    -- Reset Auto Drop
    if _G.AutoDropConnection then
        _G.AutoDropConnection:Disconnect()
        _G.AutoDropConnection = nil
        DropToggle:UpdateToggle("📦 Auto Drop Items: OFF")
    end
    
    -- Reset Brightness
    if BrightnessStatus then
        BrightnessStatus = false
        local Lighting = game:GetService("Lighting")
        
        Lighting.Brightness = OriginalSettings.Lighting.Brightness
        Lighting.Ambient = OriginalSettings.Lighting.Ambient
        Lighting.OutdoorAmbient = OriginalSettings.Lighting.OutdoorAmbient
        
        local ColorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")
        if ColorCorrection and _G.OriginalColorCorrection then
            ColorCorrection.Brightness = _G.OriginalColorCorrection.Brightness
        end
        
        BrightnessToggle:UpdateToggle("💡 Enhanced Brightness: OFF")
    end
    
    -- Reset Fog
    if FogStatus then
        FogStatus = false
        local Atmosphere = game:GetService("Lighting"):FindFirstChildOfClass("Atmosphere")
        
        if Atmosphere and _G.OriginalAtmosphere then
            Atmosphere.Density = _G.OriginalAtmosphere.Density
        end
        
        FogToggle:UpdateToggle("🌫️ Fog Control: OFF")
    end
    
    -- Disconnect all connections
    DisconnectAll()
    
    -- Notification
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Reset Complete",
        Text = "All settings restored to default",
        Duration = 3
    })
end)

-- Credits tab
local CreditsTab = Window:NewTab("👑 Credits")
local CreditsSection = CreditsTab:NewSection("Special Thanks")

CreditsSection:NewLabel("🌟 Created by: DYHUB")
CreditsSection:NewLabel("🛠️ UI Enhancements: DYHUB Team")
CreditsSection:NewLabel("🔧 Version 0.1 Premium Edition")

-- Create Mobile UI Toggle Button
-- This will create a floating button for mobile users
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Name = "ChxmpMobileToggle"

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "MobileToggle"
ToggleButton.Parent = ScreenGui
ToggleButton.AnchorPoint = Vector2.new(1, 0) -- Anchor to top right
ToggleButton.Position = UDim2.new(0.98, 0, 0.1, 0) -- Position in top right area
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.BackgroundColor3 = Color3.fromRGB(85, 170, 255) -- Match theme blue
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "📱"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 24
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.AutoButtonColor = true

-- Make the button rounded
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0) -- Fully rounded (circle)
UICorner.Parent = ToggleButton

-- Add shadow for better visibility
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Transparency = 0.5
UIStroke.Thickness = 2
UIStroke.Parent = ToggleButton

-- Add a small gradient for style
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 170, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 120, 220))
})
UIGradient.Parent = ToggleButton

-- Add touch effect
local TouchRipple = Instance.new("Frame")
TouchRipple.Name = "TouchRipple"
TouchRipple.Parent = ToggleButton
TouchRipple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TouchRipple.BackgroundTransparency = 0.8
TouchRipple.BorderSizePixel = 0
TouchRipple.Size = UDim2.new(1, 0, 1, 0)
TouchRipple.Visible = false
TouchRipple.ZIndex = 2

local RippleCorner = Instance.new("UICorner")
RippleCorner.CornerRadius = UDim.new(1, 0)
RippleCorner.Parent = TouchRipple

-- Make the button draggable for better user experience
local isDragging = false
local dragInput
local dragStart
local startPos

local function updatePosition(input)
    local delta = input.Position - dragStart
    ToggleButton.Position = UDim2.new(
        startPos.X.Scale, 
        startPos.X.Offset + delta.X, 
        startPos.Y.Scale, 
        startPos.Y.Offset + delta.Y
    )
end

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        -- Visual feedback
        TouchRipple.Visible = true
        
        -- If it's a short tap/click, toggle the UI
        if not isDragging then
            Library:ToggleUI()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "UI Toggled",
                Text = "Menu visibility changed",
                Duration = 2
            })
        end
        
        -- Handle dragging
        isDragging = true
        dragStart = input.Position
        startPos = ToggleButton.Position
        
        -- Hide ripple effect after a short delay
        spawn(function()
            wait(0.3)
            TouchRipple.Visible = false
        end)
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                isDragging = false
            end
        end)
    end
end)

ToggleButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
        if isDragging then
            updatePosition(input)
        end
    end
end)

-- Opening notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "DYHUB'S TEAM",
    Text = "Loaded successfully! Mobile button added!",
    Duration = 5
})
