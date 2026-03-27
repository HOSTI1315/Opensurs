local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"))()

local Options = Library.Options
Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "Axeus Hub",
    Footer = "By ZoxPetty",
    NotifySide = "Right",
    Icon = 118378636057990,
    ShowCustomCursor = false,
})

local MainTab = Window:AddTab("Main", "flame")
local VisualsTab = Window:AddTab("Visuals", "eye")
local PlayerTab = Window:AddTab("Player", "user")
local UISettingsTab = Window:AddTab("UI Settings", "settings")

local ItemsSystem = MainTab:AddLeftGroupbox("Items System")

local GameResources = workspace:FindFirstChild("GameResources")
local ToolFolder = GameResources and GameResources:FindFirstChild("ToolFolder")

local function CollectItems()
    local itemList = {}
    
    if ToolFolder then
        local categories = {"Other", "Guns", "Heal", "Tool", "Upgrade", "Fuel"}
        
        for _, categoryName in ipairs(categories) do
            local category = ToolFolder:FindFirstChild(categoryName)
            if category then
                for _, item in pairs(category:GetChildren()) do
                    if item:IsA("Tool") and item.Name ~= "Eyeball" then
                        table.insert(itemList, item.Name)
                    end
                end
            end
        end
    end
    
    return itemList
end

local allItems = CollectItems()

ItemsSystem:AddDropdown("ItemDropdown", {
    Values = allItems,
    Text = "Select Items",
    Tooltip = "Select items to bring to your position (Eyeballs excluded)",
    Multi = true,
    Callback = function(selected)
        Options.SelectedItems = selected
    end,
    Default = 1,
})

ItemsSystem:AddButton({
    Tooltip = "Bring all selected items to your position",
    Text = "Bring Selected Items",
    Func = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character then return end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then return end
        
        local selectedItems = Options.SelectedItems or {}
        
        if ToolFolder then
            for _, categoryName in ipairs({"Other", "Guns", "Heal", "Tool", "Upgrade", "Fuel"}) do
                local category = ToolFolder:FindFirstChild(categoryName)
                if category then
                    for _, item in pairs(category:GetChildren()) do
                        if item:IsA("Tool") and table.find(selectedItems, item.Name) then
                            item.Handle.CFrame = humanoidRootPart.CFrame
                        end
                    end
                end
            end
        end
    end,
})

local MainFeatures = MainTab:AddRightGroupbox("Main Features")

MainFeatures:AddButton({
    Text = "Bring All Items [FIX]",
    Tooltip = "Bring all available items to your position",
    Func = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character then return end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then return end
        
        if ToolFolder then
            for _, categoryName in ipairs({"Other", "Guns", "Heal", "Tool", "Upgrade", "Fuel"}) do
                local category = ToolFolder:FindFirstChild(categoryName)
                if category then
                    for _, item in pairs(category:GetChildren()) do
                        if item:IsA("Tool") and item.Name ~= "Eyeball" then
                            item.Handle.CFrame = humanoidRootPart.CFrame
                        end
                    end
                end
            end
        end
    end,
})

MainFeatures:AddToggle("InstantInteract", {
    Text = "Instant Interact",
    Default = false,
    Tooltip = "Instantly interact with objects",
    Callback = function(state)
        Options.InstantInteract = state
    end,
})

MainFeatures:AddToggle("LowGraphics", {
    Text = "Low Graphics",
    Default = false,
    Tooltip = "Reduce graphics quality",
    Callback = function(state)
        Options.LowGraphics = state
        if state then
            settings().Rendering.QualityLevel = 1
            for _, effect in pairs(game.Lighting:GetChildren()) do
                if effect:IsA("PostEffect") then
                    effect.Enabled = false
                end
            end
        else
            settings().Rendering.QualityLevel = 21
        end
    end,
})

MainFeatures:AddToggle("AntiVoid", {
    Text = "Anti Void",
    Default = false,
    Tooltip = "Prevent falling into void",
    Callback = function(state)
        Options.AntiVoid = state
        if state then
            game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
                task.wait(1)
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.StateChanged:Connect(function(oldState, newState)
                        if newState == Enum.HumanoidStateType.Freefall then
                            humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                        end
                    end)
                end
            end)
        end
    end,
})

local PlayerVisuals = VisualsTab:AddLeftGroupbox("Players")

PlayerVisuals:AddToggle("ShowPlayers", {
    Text = "Players",
    Default = true,
    Tooltip = "Show player name tags and highlights",
    Callback = function(state)
        Options.ShowPlayers = state
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local character = player.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        if state then
                            local highlight = Instance.new("Highlight")
                            highlight.Parent = character
                            highlight.Adornee = character
                            highlight.FillColor = Color3.fromRGB(0, 170, 255)
                        else
                            for _, child in pairs(character:GetChildren()) do
                                if child:IsA("Highlight") then
                                    child:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    end,
})

local ItemsVisuals = VisualsTab:AddLeftGroupbox("Items/Tools")

ItemsVisuals:AddToggle("ShowItems", {
    Text = "Items/Tools",
    Default = true,
    Tooltip = "Highlight items and tools in the world",
    Callback = function(state)
        Options.ShowItems = state
        if ToolFolder then
            for _, categoryName in ipairs({"Other", "Guns", "Heal", "Tool", "Upgrade", "Fuel"}) do
                local category = ToolFolder:FindFirstChild(categoryName)
                if category then
                    for _, item in pairs(category:GetChildren()) do
                        if item:IsA("Tool") then
                            if state then
                                local highlight = Instance.new("Highlight")
                                highlight.Parent = item
                                highlight.Adornee = item
                                highlight.FillColor = Color3.fromRGB(255, 170, 0)
                            else
                                for _, child in pairs(item:GetChildren()) do
                                    if child:IsA("Highlight") then
                                        child:Destroy()
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end,
})

local EnemiesVisuals = VisualsTab:AddRightGroupbox("Enemies")

EnemiesVisuals:AddToggle("ShowEnemies", {
    Text = "Enemies",
    Default = true,
    Tooltip = "Show enemy highlights",
    Callback = function(state)
        Options.ShowEnemies = state
        local function processModel(model)
            if state then
                local highlight = Instance.new("Highlight")
                highlight.Parent = model
                highlight.Adornee = model
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
            else
                for _, child in pairs(model:GetChildren()) do
                    if child:IsA("Highlight") then
                        child:Destroy()
                    end
                end
            end
        end
        
        if GameResources then
            local mapFolder = GameResources:FindFirstChild("MapFolder")
            if mapFolder then
                for _, model in pairs(mapFolder:GetChildren()) do
                    if model:IsA("Model") then
                        processModel(model)
                    end
                end
            end
        end
    end,
})

local LightingVisuals = VisualsTab:AddRightGroupbox("Lighting")

LightingVisuals:AddToggle("Fullbright", {
    Text = "Fullbright",
    Default = false,
    Tooltip = "Enable fullbright lighting",
    Callback = function(state)
        Options.Fullbright = state
        if state then
            game.Lighting.GlobalShadows = false
            game.Lighting.Brightness = 2
        else
            game.Lighting.GlobalShadows = true
            game.Lighting.Brightness = 1
        end
    end,
})

LightingVisuals:AddToggle("CustomFullbright", {
    Text = "Custom Fullbright",
    Default = false,
    Tooltip = "Enable custom fullbright with adjustable brightness",
    Callback = function(state)
        Options.CustomFullbright = state
        if state then
            game.Lighting.GlobalShadows = false
        else
            game.Lighting.GlobalShadows = true
        end
    end,
})

LightingVisuals:AddSlider("BrightnessSlider", {
    Text = "Brightness Level",
    Default = 2,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Tooltip = "Adjust brightness level",
    Callback = function(value)
        if Options.CustomFullbright then
            game.Lighting.Brightness = value
        end
    end,
})

local MovementGroup = PlayerTab:AddLeftGroupbox("Movement")

MovementGroup:AddSlider("WalkSpeed", {
    Text = "WalkSpeed",
    Default = 16,
    Min = 0,
    Max = 200,
    Rounding = 0,
    Tooltip = "Set walk speed",
    Callback = function(value)
        Options.WalkSpeed = value
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = value
            end
        end
    end,
})

MovementGroup:AddInput("CustomSpeed", {
    Text = "Custom Speed",
    Default = "50",
    Numeric = true,
    Tooltip = "Enter custom speed value",
    Callback = function(value)
        local numValue = tonumber(value)
        if numValue then
            Options.CustomSpeed = numValue
            local character = game.Players.LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = numValue
                end
            end
        end
    end,
})

local TeleportsGroup = PlayerTab:AddRightGroupbox("Teleports")

TeleportsGroup:AddButton({
    Text = "Elevator",
    Tooltip = "Teleport to elevator",
    Func = function()
        local character = game.Players.LocalPlayer.Character
        if not character then return end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then return end
        
        if GameResources then
            local mapFolder = GameResources:FindFirstChild("MapFolder")
            if mapFolder then
                for _, model in pairs(mapFolder:GetChildren()) do
                    if model:IsA("Model") and (model.Name:find("Elevator") or model.Name:find("Lift")) then
                        local primaryPart = model.PrimaryPart
                        if primaryPart then
                            humanoidRootPart.CFrame = primaryPart.CFrame
                            break
                        end
                    end
                end
            end
        end
    end,
})

TeleportsGroup:AddButton({
    Text = "Safe Place",
    Tooltip = "Teleport to safe place",
    Func = function()
        local character = game.Players.LocalPlayer.Character
        if not character then return end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then return end
        
        local safeCFrame = CFrame.new(0, 50, 0)
        humanoidRootPart.CFrame = safeCFrame
    end,
})

local ConfigGroup = UISettingsTab:AddLeftGroupbox("Configuration")

ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder("AxeusHub")
ThemeManager:ApplyToGroupbox(ConfigGroup)

SaveManager:SetLibrary(Library)
SaveManager:SetFolder("AxeusHub")
SaveManager:ApplyToGroupbox(ConfigGroup)

ConfigGroup:AddButton({
    Text = "Unload",
    Tooltip = "Unload the UI",
    Func = function()
        Library:Unload()
    end,
})

Library:Notify("Axeus Hub loaded successfully!", 5)
Window:SelectTab(1)