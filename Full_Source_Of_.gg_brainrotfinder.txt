print ("leaked by @bu8f on discord")

    -- Services with safety checks
    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local guiService = game:GetService("GuiService")
    local UserInputService = game:GetService("UserInputService")

    -- Wait for LocalPlayer to be valid
    if not LocalPlayer then
        return
    end

    -- Variables
    local PlaceID = 109983668079237
    local autoJoinerEnabled = false
    local websocketConnection = nil
    local isConnecting = false
    -- Cooldowns removed for instant joining
    local isScriptRunning = true
    local connections = {}
    local uiConnections = {} -- Separate array for UI connections that should never be disconnected


    -- Tween configurations for smooth animations
    local TweenService = game:GetService("TweenService")
    local buttonTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

    -- Mobile detection and UI scaling
    local UserInputService = game:GetService("UserInputService")
    local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    
    local joinStartTime = 0
    local totalJoins = 0
    local totalJoinTime = 0
    local isTeleporting = false -- Prevent multiple simultaneous teleports
    local crashCount = 0
    local lastCrashTime = 0
    local teleportAttempts = 0
    local hasJoinedNewServer = false
    local serverJoinTime = 0
    local lastJobId = game.JobId or ""

    -- Configuration
    local WEBSOCKET_URL = ""
    local WEBHOOK_URL = ""
    

    -- Forward declarations
    local hideLoadingUI
    local addLogEntry
    

    -- Brainrot Scrambler functionality
    local processedBrainrots = {}
    
    -- Function to generate random gibberish text
    local function generateGibberish(length)
        local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        local result = ""
        for i = 1, length do
            local rand = math.random(1, #chars)
            result = result .. chars:sub(rand, rand)
        end
        return result
    end
    
    -- Function to process a single podium
    local function processPodium(podium)
        local overhead
        for _, child in ipairs(podium:GetDescendants()) do
            if child.Name == "AnimalOverhead" then 
                overhead = child 
                break 
            end
        end
        
        if not overhead then return end

        local displayName = overhead:FindFirstChild("DisplayName")
        local generation = overhead:FindFirstChild("Generation")
        
        if not (displayName and generation) then return end

        -- Check if we already processed this brainrot
        local brainrotId = tostring(podium)
        if processedBrainrots[brainrotId] then
            return
        end

        -- Change the object names to gibberish
        pcall(function()
            displayName.Name = generateGibberish(12)
            generation.Name = generateGibberish(10)
        end)
        
        -- Mark this brainrot as processed
        processedBrainrots[brainrotId] = true
    end
    
    -- Function to scan all plots and process brainrots
    local function scanAndScramble()
        local plotsFolder = Workspace:FindFirstChild("Plots")
        if not plotsFolder then 
            return 
        end
        
        for _, playerBase in ipairs(plotsFolder:GetChildren()) do
            local podiumsFolder = playerBase:FindFirstChild("AnimalPodiums")
            if podiumsFolder then
                for _, podium in ipairs(podiumsFolder:GetChildren()) do
                    pcall(function() 
                        processPodium(podium)
                    end)
                end
            end
        end
    end
    
    -- Function to handle new player joining
    local function onPlayerAdded(player)
        -- Wait a bit for the player's base to load
        task.wait(2)
        
        -- Check if player has a base
        local plotsFolder = Workspace:FindFirstChild("Plots")
        if not plotsFolder then return end
        
        local playerBase = plotsFolder:FindFirstChild(player.Name .. "'s Base")
        if not playerBase then return end
        
        local podiumsFolder = playerBase:FindFirstChild("AnimalPodiums")
        if not podiumsFolder then return end
        
        print("🧠 Brainrot Scrambler: New player joined - " .. player.Name)
        
        -- Process any new brainrots
        local processedCount = 0
        for _, podium in ipairs(podiumsFolder:GetChildren()) do
            pcall(function() 
                local wasProcessed = processedBrainrots[tostring(podium)]
                processPodium(podium)
                if not wasProcessed and processedBrainrots[tostring(podium)] then
                    processedCount = processedCount + 1
                end
            end)
        end
        
        if processedCount > 0 then
            print("🧠 Brainrot Scrambler: Spoofed " .. processedCount .. " brainrots from " .. player.Name)
        end
    end
    
    -- Start brainrot scrambler
    local function startBrainrotScrambler()
        print("🧠 Brainrot Scrambler: Starting automatic brainrot spoofing...")
        
        -- Initial scan
        scanAndScramble()
        print("🧠 Brainrot Scrambler: Initial scan complete")
        
        -- Connect to player joining event
        Players.PlayerAdded:Connect(onPlayerAdded)
        print("🧠 Brainrot Scrambler: Monitoring for new players")
        
        -- Periodic scanning every 10 seconds
        task.spawn(function()
            while isScriptRunning do
                task.wait(10)
                if isScriptRunning then
                    scanAndScramble()
                end
            end
        end)
    end

    -- Anti-Lag functionality
    local function removeAvatarItems(player)
        local character = player.Character
        if not character then return end
        
        local humanoid = character:FindFirstChild("Humanoid")
        if not humanoid then return end
        
        -- Remove all accessories (hats, hair, etc.)
        for _, accessory in pairs(character:GetChildren()) do
            if accessory:IsA("Accessory") then
                accessory:Destroy()
            end
        end
        
        -- Remove clothing items
        local bodyColors = humanoid:FindFirstChild("Body Colors")
        if bodyColors then
            bodyColors:Destroy()
        end
        
        -- Remove face
        local head = character:FindFirstChild("Head")
        if head then
            local face = head:FindFirstChild("face")
            if face then
                face:Destroy()
            end
        end
    end

    -- Function to remove avatar items from all players
    local function removeAllAvatarItems()
        local players = Players:GetPlayers()
        local removedCount = 0
        
        for _, player in pairs(players) do
            if player ~= LocalPlayer then -- Don't remove from local player
                removeAvatarItems(player)
                removedCount = removedCount + 1
            end
        end
        
    end

    -- Run anti-lag automatically when script starts
    removeAllAvatarItems()

    -- Helper functions for generation formatting
local function parseGeneration(generationStr)
    if not generationStr or generationStr == "" then
        return 0
    end

    -- Clean input: remove $, /s, commas, spaces
    local str = tostring(generationStr):gsub("[$,/s ]", ""):lower()
    
    -- Match number (including decimals) and optional suffix
    local numPart, suffix = str:match("^(%d*%.?%d+)([kmb]?)")
    
    if not numPart then
        return 0
    end
    
    local num = tonumber(numPart) or 0
    if suffix == "k" then
        num = num * 1000
    elseif suffix == "m" then
        num = num * 1000000
    elseif suffix == "b" then
        num = num * 1000000000
    end
    
    return num
end

    local function formatGenerationNumber(input)
        local num = parseGeneration(tostring(input))
        if num >= 1000000000 then
            return string.format("%.1fB", num / 1000000000)
        elseif num >= 1000000 then
            return string.format("%.1fM", num / 1000000)
        elseif num >= 1000 then
            return string.format("%.1fK", num / 1000)
        else
            return tostring(num)
        end
    end

    -- Loading UI
    local LoadingUI = nil
    local LoadingUIElements = {}

    -- Function to create loading UI
    local function createLoadingUI()
        local G2L = {}
        
        -- StarterGui.LoadingUI
        G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
        G2L["1"]["IgnoreGuiInset"] = true
        G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets
        G2L["1"]["Name"] = "LoadingUI"
        G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

        -- StarterGui.LoadingUI.Frame
        G2L["3"] = Instance.new("Frame", G2L["1"])
        G2L["3"]["BorderSizePixel"] = 0
        G2L["3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
        G2L["3"]["Size"] = UDim2.new(1.455, 0, 1.388, 0)
        G2L["3"]["Position"] = UDim2.new(0.2725, 0, 0.306, 0)
        G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        G2L["3"]["Draggable"] = true

        -- StarterGui.LoadingUI.Frame.StatusContainer
        G2L["4"] = Instance.new("Frame", G2L["3"])
        G2L["4"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 49)
        G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
        G2L["4"]["Size"] = UDim2.new(0.28245, 0, 0.02301, 0)
        G2L["4"]["Position"] = UDim2.new(0.65608, 0, 0.76207, 0)
        G2L["4"]["Name"] = "StatusContainer"

        -- StarterGui.LoadingUI.Frame.StatusContainer.UICorner
        G2L["5"] = Instance.new("UICorner", G2L["4"])
        G2L["5"]["CornerRadius"] = UDim.new(1, 0)

        -- StarterGui.LoadingUI.Frame.StatusBar
        G2L["6"] = Instance.new("Frame", G2L["3"])
        G2L["6"]["BackgroundColor3"] = Color3.fromRGB(250, 249, 255)
        G2L["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
        G2L["6"]["Size"] = UDim2.new(0.01163, 0, 0.02301, 0)
        G2L["6"]["Position"] = UDim2.new(0.52012, 0, 0.76207, 0)
        G2L["6"]["Name"] = "StatusBar"

        -- StarterGui.LoadingUI.Frame.StatusBar.UICorner
        G2L["7"] = Instance.new("UICorner", G2L["6"])
        G2L["7"]["CornerRadius"] = UDim.new(1, 0)

        -- StarterGui.LoadingUI.Frame.StatusBar.UIGradient
        G2L["8"] = Instance.new("UIGradient", G2L["6"])
        G2L["8"]["Rotation"] = 90
        G2L["8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(116, 246, 108)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(116, 246, 108))}

        -- StarterGui.LoadingUI.Frame.TextLabel
        G2L["9"] = Instance.new("TextLabel", G2L["3"])
        G2L["9"]["TextWrapped"] = true
        G2L["9"]["TextTransparency"] = 0.36
        G2L["9"]["TextScaled"] = true
        G2L["9"]["FontFace"] = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
        G2L["9"]["BackgroundTransparency"] = 1
        G2L["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
        G2L["9"]["Size"] = UDim2.new(0.19605, 0, 0.07749, 0)
        G2L["9"]["Text"] = "Puzzle Auto Joiner"
        G2L["9"]["Position"] = UDim2.new(0.65497, 0, 0.59194, 0)

        -- StarterGui.LoadingUI.Frame.TextLabel
        G2L["a"] = Instance.new("TextLabel", G2L["3"])
        G2L["a"]["TextWrapped"] = true
        G2L["a"]["TextTransparency"] = 0.56
        G2L["a"]["TextScaled"] = true
        G2L["a"]["FontFace"] = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        G2L["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
        G2L["a"]["BackgroundTransparency"] = 1
        G2L["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
        G2L["a"]["Size"] = UDim2.new(0.27414, 0, 0.11988, 0)
        G2L["a"]["Text"] = "discord.gg/brainrotfinder"
        G2L["a"]["Position"] = UDim2.new(0.6547, 0, 0.65067, 0)

        -- StarterGui.LoadingUI.Frame.TeleportingStatus
        G2L["b"] = Instance.new("TextLabel", G2L["3"])
        G2L["b"]["TextWrapped"] = true
        G2L["b"]["TextTransparency"] = 0.56
        G2L["b"]["TextScaled"] = true
        G2L["b"]["FontFace"] = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        G2L["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
        G2L["b"]["BackgroundTransparency"] = 1
        G2L["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
        G2L["b"]["Size"] = UDim2.new(0.04375, 0, 0.01453, 0)
        G2L["b"]["Text"] = "Teleporting"
        G2L["b"]["Name"] = "TeleportingStatus"
        G2L["b"]["Position"] = UDim2.new(0.65525, 0, 0.72514, 0)

        -- StarterGui.LoadingUI.Frame.BrainrotDetails
        G2L["c"] = Instance.new("TextLabel", G2L["3"])
        G2L["c"]["TextWrapped"] = true
        G2L["c"]["TextTransparency"] = 0.56
        G2L["c"]["TextScaled"] = true
        G2L["c"]["FontFace"] = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
        G2L["c"]["BackgroundTransparency"] = 1
        G2L["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
        G2L["c"]["Size"] = UDim2.new(0.10689, 0, 0.02785, 0)
        G2L["c"]["Text"] = "[Noobini Pizzanini (3M)]"
        G2L["c"]["Name"] = "BrainrotDetails"
        G2L["c"]["Position"] = UDim2.new(0.65636, 0, 0.79839, 0)

        -- StarterGui.LoadingUI.StrokeFrame
        G2L["d"] = Instance.new("Frame", G2L["1"])
        G2L["d"]["BorderSizePixel"] = 0
        G2L["d"]["BackgroundColor3"] = Color3.fromRGB(157, 157, 157)
        G2L["d"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
        G2L["d"]["Size"] = UDim2.new(0.93929, 0, 0.91237, 0)
        G2L["d"]["Position"] = UDim2.new(0.49732, 0, 0.49844, 0)
        G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        G2L["d"]["Name"] = "StrokeFrame"
        G2L["d"]["BackgroundTransparency"] = 1

        -- StarterGui.LoadingUI.StrokeFrame.UIStroke
        G2L["e"] = Instance.new("UIStroke", G2L["d"])
        G2L["e"]["Color"] = Color3.fromRGB(255, 255, 255)

        -- StarterGui.LoadingUI.UIAspectRatioConstraint
        G2L["f"] = Instance.new("UIAspectRatioConstraint", G2L["1"])
        G2L["f"]["AspectRatio"] = 2.08571

        return G2L
    end

    -- Function to show loading UI
    local function showLoadingUI(brainrotName, generation)
        if LoadingUI then
            LoadingUI:Destroy()
        end
        
        LoadingUIElements = createLoadingUI()
        LoadingUI = LoadingUIElements["1"]
        
        -- Update brainrot details with generation
        LoadingUIElements["c"].Text = "[" .. brainrotName .. " (" .. generation .. ")]"
        
        -- Reset status
        LoadingUIElements["b"].Text = "Teleporting"
        
        -- Reset loading bar
        LoadingUIElements["6"].Size = UDim2.new(0.01163, 0, 0.02301, 0)
        LoadingUIElements["6"].Position = UDim2.new(0.52012, 0, 0.76207, 0)
        
        -- Animate loading bar - stretch to fill entire status container
        local statusContainerSize = LoadingUIElements["4"].Size.X.Scale
        local statusContainerPosition = LoadingUIElements["4"].Position.X.Scale
        
        local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        local tween = TweenService:Create(LoadingUIElements["6"], tweenInfo, {
            Size = UDim2.new(statusContainerSize, 0, 0.02301, 0),
            Position = UDim2.new(statusContainerPosition, 0, 0.76207, 0)
        })
        tween:Play()
        
        -- Animate teleporting status dots
        local dotCount = 0
        local maxDots = 3
        local dotConnection
        local lastDotUpdate = 0
        
        local function updateDots()
            local currentTime = tick()
            if currentTime - lastDotUpdate >= 0.3 then -- Update every 0.3 seconds
                dotCount = dotCount + 1
                if dotCount > maxDots then
                    dotCount = 1
                end
                
                local dots = string.rep(".", dotCount)
                LoadingUIElements["b"].Text = "Teleporting" .. dots
                lastDotUpdate = currentTime
            end
        end
        
        dotConnection = game:GetService("RunService").Heartbeat:Connect(function()
            updateDots()
        end)
        
        -- Store connection for cleanup
        LoadingUIElements.dotConnection = dotConnection
        
        -- Auto-hide loading UI after 2 seconds
        task.spawn(function()
            task.wait(2)
            hideLoadingUI()
        end)
    end

    -- Function to hide loading UI
    hideLoadingUI = function()
        -- Hide loading UI immediately (no wait)
        if LoadingUIElements and LoadingUIElements.dotConnection then
            LoadingUIElements.dotConnection:Disconnect()
        end
        
        if LoadingUI then
            LoadingUI:Destroy()
            LoadingUI = nil
            LoadingUIElements = {}
        end
    end

    -- Function to update loading UI status
    local function updateLoadingStatus(status)
        if LoadingUIElements and LoadingUIElements["b"] then
            LoadingUIElements["b"].Text = status
        end
    end

    -- Retry logic removed - just move on to new brainrots after first failure


    -- Filter variables
    local generationFilterEnabled = false
    local minGeneration = ""
    local minGenerationValue = 0  -- Store the actual numeric value
    
    -- Convert min generation string to actual number
    local function updateMinGenerationValue()
        if minGeneration and minGeneration ~= "" then
            minGenerationValue = parseGeneration(minGeneration)
        else
            minGenerationValue = 0
        end
    end
    local onlyJoinEnabled = false
    local onlyJoinBrainrots = {} -- Will store {name = "brainrot", type = "join" or "ignore"}
    local isSettingsOpen = true

    -- Configuration save/load system
    local CONFIG_KEY = "AutoJoinerConfig_" .. LocalPlayer.UserId

    local function saveConfig()
        local config = {
            generationFilterEnabled = generationFilterEnabled,
            minGeneration = minGeneration,
            onlyJoinEnabled = onlyJoinEnabled,
            onlyJoinBrainrots = onlyJoinBrainrots
        }
        
        local success, err = pcall(function()
            local jsonString = HttpService:JSONEncode(config)
            
            -- Try different save methods for different executors
            if syn and syn.crypt and syn.crypt.base64 and syn.crypt.base64.encode then
                -- Synapse method - save to registry
                syn.crypt.base64.encode(jsonString)
                syn.set_clipboard(jsonString) -- Backup to clipboard
            elseif writefile then
                -- Standard writefile method
                writefile("AutoJoinerConfig.json", jsonString)
            elseif getgenv and getgenv().writefile then
                -- Alternative writefile method
                getgenv().writefile("AutoJoinerConfig.json", jsonString)
            else
                -- Fallback: save to workspace
                local configFolder = game:GetService("Workspace"):FindFirstChild("AutoJoinerConfig")
                if not configFolder then
                    configFolder = Instance.new("Folder")
                    configFolder.Name = "AutoJoinerConfig"
                    configFolder.Parent = game:GetService("Workspace")
                end
                
                local configValue = configFolder:FindFirstChild("ConfigData")
                if not configValue then
                    configValue = Instance.new("StringValue")
                    configValue.Name = "ConfigData"
                    configValue.Parent = configFolder
                end
                configValue.Value = jsonString
            end
        end)
        
        if success then
            if addLogEntry then
                addLogEntry("Configuration saved successfully")
            end
        else
            if addLogEntry then
                addLogEntry("Failed to save configuration: " .. tostring(err))
            end
        end
    end

    local function loadConfig()
        local success, config = pcall(function()
            local jsonString = ""
            
            -- Try different load methods for different executors
            if syn and syn.crypt and syn.crypt.base64 and syn.crypt.base64.decode then
                -- Synapse method - try to load from registry or clipboard
                local clipboard = syn.get_clipboard()
                if clipboard and clipboard ~= "" then
                    jsonString = clipboard
                end
            elseif readfile then
                -- Standard readfile method
                jsonString = readfile("AutoJoinerConfig.json")
            elseif getgenv and getgenv().readfile then
                -- Alternative readfile method
                jsonString = getgenv().readfile("AutoJoinerConfig.json")
            else
                -- Fallback: load from workspace
                local configFolder = game:GetService("Workspace"):FindFirstChild("AutoJoinerConfig")
                if configFolder then
                    local configValue = configFolder:FindFirstChild("ConfigData")
                    if configValue then
                        jsonString = configValue.Value
                    end
                end
            end
            
            if jsonString and jsonString ~= "" then
                return HttpService:JSONDecode(jsonString)
            end
            return nil
        end)
        
        if success and config then
            generationFilterEnabled = config.generationFilterEnabled or false
            minGeneration = config.minGeneration or ""
            updateMinGenerationValue()
            onlyJoinEnabled = config.onlyJoinEnabled or false
            onlyJoinBrainrots = config.onlyJoinBrainrots or {}
            
            if addLogEntry then
                addLogEntry("Configuration loaded successfully")
            end
            
            return true
        else
            if addLogEntry then
                addLogEntry("No saved configuration found or failed to load")
            end
            return false
        end
    end

    -- Helper function to apply loaded configuration to UI
    local function applyLoadedConfig()
        
        -- Debug: Check what GUI elements are available
        if G2L then
        else
            return
        end
        
        -- Update UI to reflect loaded settings
        if G2L and G2L["30"] then
            G2L["30"].Text = minGeneration
        else
            -- Try alternative approach - find the TextBox by name
            if G2L and G2L["2d"] then
                local minGenInput = G2L["2d"]:FindFirstChild("MinGenInput")
                if minGenInput then
                    minGenInput.Text = minGeneration
                else
                end
            end
        end
        
        -- Update toggle states visually
        if generationFilterEnabled then
            if G2L and G2L["35"] and G2L["33"] then
                -- Set toggle to ON position (right side)
                G2L["35"].Position = UDim2.new(0.79, 0, 0.5, 0)
                G2L["33"].BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green
            else
            end
        else
            if G2L and G2L["35"] and G2L["33"] then
                -- Set toggle to OFF position (left side)
                G2L["35"].Position = UDim2.new(0.21, 0, 0.5, 0)
                G2L["33"].BackgroundColor3 = Color3.fromRGB(255, 70, 50) -- Red
            end
        end
        
        if onlyJoinEnabled then
            if G2L and G2L["46"] and G2L["44"] then
                -- Set toggle to ON position (right side)
                G2L["46"].Position = UDim2.new(0.79, 0, 0.48, 0)
                G2L["44"].BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green
            else
            end
        else
            if G2L and G2L["46"] and G2L["44"] then
                -- Set toggle to OFF position (left side)
                G2L["46"].Position = UDim2.new(0.21, 0, 0.48, 0)
                G2L["44"].BackgroundColor3 = Color3.fromRGB(255, 70, 50) -- Red
            end
        end
        
        -- Recreate brainrot list items
        if G2L and G2L["3e"] then
            for i, brainrotName in ipairs(onlyJoinBrainrots) do
                recreateBrainrotListItem(brainrotName)
            end
        else
        end
        
    end

    -- Helper function to recreate brainrot list items (for loading)
    local function recreateBrainrotListItem(brainrotName)
        if not G2L or not G2L["3e"] then
            return
        end
        
        local nameHolder = G2L["3e"]:FindFirstChild("NameHolder")
        if nameHolder and not nameHolder.BrainrotName.Visible then
            nameHolder.BrainrotName.Text = brainrotName
            nameHolder.BrainrotName.Visible = true
            nameHolder.Visible = true
            nameHolder.BrainrotName.MouseButton1Click:Connect(function()
                for i, name in ipairs(onlyJoinBrainrots) do
                    if name == brainrotName then
                        table.remove(onlyJoinBrainrots, i)
                        nameHolder.BrainrotName.Visible = false
                        nameHolder.Visible = false
                        nameHolder.BrainrotName.Text = ""
                        saveConfig() -- Save when removing
                        break
                    end
                end
                G2L["3e"].CanvasSize = UDim2.new(0, 0, 0, G2L["43"].AbsoluteContentSize.Y)
            end)
        else
            local newNameHolder = nameHolder:Clone()
            newNameHolder.Parent = G2L["3e"]
            newNameHolder.Position = UDim2.new(0.5, 0, 0, 0)
            newNameHolder.BrainrotName.Text = brainrotName
            newNameHolder.BrainrotName.Visible = true
            newNameHolder.BrainrotName.MouseButton1Click:Connect(function()
                for i, name in ipairs(onlyJoinBrainrots) do
                    if name == brainrotName then
                        table.remove(onlyJoinBrainrots, i)
                        newNameHolder:Destroy()
                        saveConfig() -- Save when removing
                        break
                    end
                end
                G2L["3e"].CanvasSize = UDim2.new(0, 0, 0, G2L["43"].AbsoluteContentSize.Y)
            end)
        end
        G2L["3e"].CanvasSize = UDim2.new(0, 0, 0, G2L["43"].AbsoluteContentSize.Y)
    end

    -- Helper function to recreate brainrot list items by searching (for loading)
    local function recreateBrainrotListItemBySearch(brainrotList, brainrotName, brainrotType)
        local targetList = onlyJoinBrainrots -- Always use the unified list
        
        local nameHolder = brainrotList:FindFirstChild("NameHolder")
        if nameHolder then
            if not nameHolder.BrainrotName.Visible then
                nameHolder.BrainrotName.Text = brainrotName
                nameHolder.BrainrotName.Visible = true
                nameHolder.Visible = true
                -- Set text color based on type
                if brainrotType == "ignore" then
                    nameHolder.BrainrotName.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red for ignore
                else
                    nameHolder.BrainrotName.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green for join
                end
                
                nameHolder.BrainrotName.MouseButton1Click:Connect(function()
                    for i, item in ipairs(targetList) do
                        if item.name == brainrotName then
                            table.remove(targetList, i)
                            nameHolder.BrainrotName.Visible = false
                            nameHolder.Visible = false
                        nameHolder.Visible = false
                            nameHolder.BrainrotName.Text = ""
                            saveConfig() -- Save when removing
                            break
                        end
                    end
                    brainrotList.CanvasSize = UDim2.new(0, 0, 0, brainrotList.UIListLayout.AbsoluteContentSize.Y)
                end)
            else
                local newNameHolder = nameHolder:Clone()
                newNameHolder.Parent = brainrotList
                newNameHolder.Position = UDim2.new(0.5, 0, 0, 0)
                newNameHolder.BrainrotName.Text = brainrotName
                newNameHolder.BrainrotName.Visible = true
                -- Set text color based on type
                if brainrotType == "ignore" then
                    newNameHolder.BrainrotName.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red for ignore
                else
                    newNameHolder.BrainrotName.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green for join
                end
                
                newNameHolder.BrainrotName.MouseButton1Click:Connect(function()
                    for i, item in ipairs(targetList) do
                        if item.name == brainrotName then
                            table.remove(targetList, i)
                            newNameHolder:Destroy()
                            saveConfig() -- Save when removing
                            break
                        end
                    end
                    brainrotList.CanvasSize = UDim2.new(0, 0, 0, brainrotList.UIListLayout.AbsoluteContentSize.Y)
                end)
            end
        else
            -- Debug: list all children
            for _, child in ipairs(brainrotList:GetChildren()) do
            end
            return
        end
        brainrotList.CanvasSize = UDim2.new(0, 0, 0, brainrotList.UIListLayout.AbsoluteContentSize.Y)
    end

    -- Helper function to apply loaded configuration by searching for GUI elements
    local function applyLoadedConfigBySearch(mainFrame)
        
        -- Find MinGenerationContainer and update min generation text
        local minGenContainer = mainFrame:FindFirstChild("MinGenerationContainer")
        if minGenContainer then
            local minGenInput = minGenContainer:FindFirstChild("MinGenInput")
            if minGenInput then
                minGenInput.Text = minGeneration
            else
            end
        else
        end
        
        -- Find generation filter toggle elements
        if minGenContainer then
            local toggleFrameGen = minGenContainer:FindFirstChild("ToggleFrameGen")
            local toggleButton = toggleFrameGen and toggleFrameGen:FindFirstChild("Toggle")
            
            if toggleFrameGen and toggleButton then
                if generationFilterEnabled then
                    -- Set toggle to ON position (right side)
                    toggleButton.Position = UDim2.new(0.79, 0, 0.5, 0)
                    toggleFrameGen.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green
                else
                    -- Set toggle to OFF position (left side)
                    toggleButton.Position = UDim2.new(0.21, 0, 0.5, 0)
                    toggleFrameGen.BackgroundColor3 = Color3.fromRGB(255, 70, 50) -- Red
                end
            else
            end
        end
        
        -- Find specific-rot join toggle elements
        local joinByRotContainer = mainFrame:FindFirstChild("JoinByRotContainer")
        if joinByRotContainer then
            local toggleFrameGen = joinByRotContainer:FindFirstChild("ToggleFrameGen")
            local toggleButton = toggleFrameGen and toggleFrameGen:FindFirstChild("Toggle")
            
            if toggleFrameGen and toggleButton then
                if onlyJoinEnabled then
                    -- Set toggle to ON position (right side)
                    toggleButton.Position = UDim2.new(0.79, 0, 0.48, 0)
                    toggleFrameGen.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green
                else
                    -- Set toggle to OFF position (left side)
                    toggleButton.Position = UDim2.new(0.21, 0, 0.48, 0)
                    toggleFrameGen.BackgroundColor3 = Color3.fromRGB(255, 70, 50) -- Red
                end
            else
            end
            
            -- Find brainrot list container and recreate items
            local brainrotList = joinByRotContainer:FindFirstChild("ScrollingFrame")
            if brainrotList then
                for i, item in ipairs(onlyJoinBrainrots) do
                    recreateBrainrotListItemBySearch(brainrotList, item.name, item.type)
                end
            else
                -- Debug: list all children
                for _, child in ipairs(joinByRotContainer:GetChildren()) do
                end
            end
        else
        end
        
    end

    -- Apply configuration after GUI is created
    local function applyConfigAfterGUI()
        
        -- Find the main GUI frame by searching for it
        local mainFrame = nil
        local attempts = 0
        while not mainFrame and attempts < 50 do
            task.wait(0.1)
            attempts = attempts + 1
            
            -- Try to find the main frame in PlayerGui
            local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
            if playerGui then
                local screenGui = playerGui:FindFirstChild("AutoJoiner")
                if screenGui then
                    mainFrame = screenGui:FindFirstChild("Main")
                    screenGui.ResetOnSpawn = false
                end
            end
        end
        
        if mainFrame then
            applyLoadedConfigBySearch(mainFrame)
        else
        end
    end

    -- Create GUI
    local G2L = {};

    -- StarterGui.AutoJoiner with safety check
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)
    if not PlayerGui then
    end

    G2L["1"] = Instance.new("ScreenGui", PlayerGui);
    G2L["1"]["IgnoreGuiInset"] = true;
    G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
    G2L["1"]["Name"] = [[AutoJoiner]];
    G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

    -- Mobile UI scaling will be applied after main frame is created

    -- Make GUI persist through character respawns/deaths (CRASH SAFE)
    local CoreGui = game:GetService("CoreGui")
    local guiStabilityCheck = true

    -- Handle character added/removing for respawn persistence (IMPROVED)
    LocalPlayer.CharacterAdded:Connect(function()
        task.spawn(function()
            task.wait(1.5) -- Wait for character to fully load
            if G2L["1"] then
                local success = pcall(function()
                    G2L["1"].Parent = PlayerGui
                    G2L["1"].Prefab = true
                    G2L["1"].Enabled = true
                end)
                if success then
                    addLogEntry("GUI restored after character respawn")
                end
                if not success then
                    -- Retry after delay
                    task.wait(2)
                    pcall(function()
                        G2L["1"].Parent = PlayerGui
                        G2L["1"].Enabled = true
                    end)
                end
            end
        end)
    end)

    LocalPlayer.CharacterRemoving:Connect(function()
        task.spawn(function()
            task.wait(0.1) -- Small delay to ensure stability
            if G2L["1"] then
                local success = pcall(function()
                    if G2L["1"].Parent == PlayerGui then
                        G2L["1"].Parent = CoreGui -- Move to CoreGui to survive respawn
                        G2L["1"].Enabled = true -- Keep enabled so it's still visible
                    end
                end)
                -- Ensure GUI stays visible even after character removal
                if not success then
                    task.wait(1)
                    pcall(function()
                        if G2L["1"] then
                            G2L["1"].Parent = CoreGui
                            G2L["1"].Enabled = true
                        end
                    end)
                end
            end
        end)
    end)

    -- SAFE Backup: Move GUI to CoreGui on any character change (with error handling)
    task.spawn(function()
        while isScriptRunning do
            task.wait(3) -- Reduced frequency to prevent crashes
            
            if guiStabilityCheck then
                local success = pcall(function()
                    if G2L["1"] and not LocalPlayer.Character then
                        -- Character is dead/respawning, preserve GUI
                        if G2L["1"].Parent == PlayerGui then
                            G2L["1"].Parent = CoreGui
                        end
                    elseif G2L["1"] and LocalPlayer.Character and G2L["1"].Parent == CoreGui then
                        -- Character is back, move to PlayerGui
                        G2L["1"].Parent = PlayerGui
                        G2L["1"].Enabled = true
                    end
                end)
                
                if not success then
                    guiStabilityCheck = false
                    task.wait(2)
                    guiStabilityCheck = true
                end
            end
        end
    end)

    -- StarterGui.AutoJoiner.Main
    G2L["2"] = Instance.new("Frame", G2L["1"]);
    G2L["2"]["BorderSizePixel"] = 0;
    G2L["2"]["BackgroundColor3"] = Color3.fromRGB(34, 35, 35);
    G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["2"]["Size"] = UDim2.new(0.35938, 0, 0.41953, 0);
    G2L["2"]["Position"] = UDim2.new(0.49991, 0, 0.49981, 0);
    G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["2"]["Name"] = [[Main]];
    G2L["2"]["Draggable"] = true;

    -- Scale main frame for mobile devices (1.25x bigger)
    if isMobile then
        G2L["2"]["Size"] = UDim2.new(0.44923, 0, 0.52441, 0) -- 0.35938 * 1.25 = 0.44923, 0.41953 * 1.25 = 0.52441
        -- Keep position centered
    end

    -- Create Open Button (mobile-friendly)
    local OpenButton = Instance.new("TextButton", G2L["1"])
    OpenButton.Name = "OpenButton"
    OpenButton.TextWrapped = true
    OpenButton.BorderSizePixel = 0
    OpenButton.TextSize = 14
    OpenButton.TextScaled = true
    OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenButton.BackgroundColor3 = Color3.fromRGB(35, 36, 36)
    OpenButton.FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
    OpenButton.AnchorPoint = Vector2.new(0.5, 0.5)
    OpenButton.Size = UDim2.new(0.17279, 0, 0.06218, 0)
    OpenButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    OpenButton.Text = "Open Auto Joiner (T)"
    OpenButton.Position = UDim2.new(0.5064, 0, 0.11422, 0)

    -- Add corner to match design
    local OpenButtonCorner = Instance.new("UICorner", OpenButton)
    local OpenButtonAspectRatio = Instance.new("UIAspectRatioConstraint", OpenButton)
    OpenButtonAspectRatio.AspectRatio = 5.08108

    -- Hide main frame initially, show only open button
    G2L["2"].Visible = false

    -- StarterGui.AutoJoiner.Main.ValueBar
    G2L["3"] = Instance.new("Frame", G2L["2"]);
    G2L["3"]["ZIndex"] = 2;
    G2L["3"]["BorderSizePixel"] = 0;
    G2L["3"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
    G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["3"]["Size"] = UDim2.new(0.62044, 0, 0.04125, 0);
    G2L["3"]["Position"] = UDim2.new(0.66063, 0, 0.06847, 0);
    G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["3"]["Name"] = [[ValueBar]];

    -- StarterGui.AutoJoiner.Main.ValueBar.Brainrot
    G2L["4"] = Instance.new("TextLabel", G2L["3"]);
    G2L["4"]["TextWrapped"] = true;
    G2L["4"]["ZIndex"] = 2;
    G2L["4"]["BorderSizePixel"] = 0;
    G2L["4"]["TextSize"] = 12;
    G2L["4"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["4"]["TextScaled"] = true;
    G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
    G2L["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["4"]["BackgroundTransparency"] = 1;
    G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["4"]["Size"] = UDim2.new(0.17606, 0, 1.80273, 0);
    G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["4"]["Text"] = [[Brainrot]];
    G2L["4"]["Name"] = [[Brainrot]];
    G2L["4"]["Position"] = UDim2.new(0.14381, 0, -0.00385, 0);

    -- StarterGui.AutoJoiner.Main.ValueBar.Brainrot.UITextSizeConstraint
    G2L["5"] = Instance.new("UITextSizeConstraint", G2L["4"]);
    G2L["5"]["MaxTextSize"] = 12;

    -- StarterGui.AutoJoiner.Main.ValueBar.Players
    G2L["6"] = Instance.new("TextLabel", G2L["3"]);
    G2L["6"]["TextWrapped"] = true;
    G2L["6"]["ZIndex"] = 2;
    G2L["6"]["BorderSizePixel"] = 0;
    G2L["6"]["TextSize"] = 12;
    G2L["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["6"]["TextScaled"] = true;
    G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
    G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["6"]["BackgroundTransparency"] = 1;
    G2L["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["6"]["Size"] = UDim2.new(0.15791, 0, 1.80266, 0);
    G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["6"]["Text"] = [[Players]];
    G2L["6"]["Name"] = [[Players]];
    G2L["6"]["Position"] = UDim2.new(0.54637, 0, -0.00382, 0);

    -- StarterGui.AutoJoiner.Main.ValueBar.Players.UITextSizeConstraint
    G2L["7"] = Instance.new("UITextSizeConstraint", G2L["6"]);
    G2L["7"]["MaxTextSize"] = 12;

    -- StarterGui.AutoJoiner.Main.ValueBar.Timestamp
    G2L["8"] = Instance.new("TextLabel", G2L["3"]);
    G2L["8"]["TextWrapped"] = true;
    G2L["8"]["ZIndex"] = 2;
    G2L["8"]["BorderSizePixel"] = 0;
    G2L["8"]["TextSize"] = 12;
    G2L["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["8"]["TextScaled"] = true;
    G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
    G2L["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["8"]["BackgroundTransparency"] = 1;
    G2L["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["8"]["Size"] = UDim2.new(0.18004, 0, 1.80266, 0);
    G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["8"]["Text"] = [[Stamp]];
    G2L["8"]["Name"] = [[Timestamp]];
    G2L["8"]["Position"] = UDim2.new(0.75, 0, -0.00382, 0);

    -- StarterGui.AutoJoiner.Main.ValueBar.Timestamp.UITextSizeConstraint
    G2L["9"] = Instance.new("UITextSizeConstraint", G2L["8"]);
    G2L["9"]["MaxTextSize"] = 12;

    -- StarterGui.AutoJoiner.Main.MainScrollFrame
    G2L["a"] = Instance.new("ScrollingFrame", G2L["2"]);
    G2L["a"]["Active"] = true;
    G2L["a"]["ZIndex"] = 2;
    G2L["a"]["BorderSizePixel"] = 0;
    G2L["a"]["TopImage"] = [[]];
    G2L["a"]["MidImage"] = [[]];
    G2L["a"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
    G2L["a"]["Name"] = [[MainScrollFrame]];
    G2L["a"]["BottomImage"] = [[]];
    G2L["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["a"]["Size"] = UDim2.new(0.62044, 0, 0.55382, 0);
    G2L["a"]["ScrollBarImageColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["a"]["Position"] = UDim2.new(0.65228, 0, 0.36178, 0);
    G2L["a"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
    G2L["a"]["ScrollBarThickness"] = 6;
    G2L["a"]["ScrollBarImageTransparency"] = 0.3;

    -- StarterGui.AutoJoiner.Main.MainScrollFrame.UIListLayout
    G2L["b"] = Instance.new("UIListLayout", G2L["a"]);
    G2L["b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
    G2L["b"]["Padding"] = UDim.new(0, 2);

    -- StarterGui.AutoJoiner.Main.MainScrollFrame.FindInfo
    G2L["c"] = Instance.new("Frame", G2L["a"]);
    G2L["c"]["Visible"] = false;
    G2L["c"]["BorderSizePixel"] = 0;
    G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["c"]["Size"] = UDim2.new(1.006, 0, 0, 20);
    G2L["c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["c"]["Name"] = [[FindInfo]];
    G2L["c"]["BackgroundTransparency"] = 0.85;

    -- StarterGui.AutoJoiner.Main.MainScrollFrame.FindInfo.RotName
    G2L["d"] = Instance.new("TextLabel", G2L["c"]);
    G2L["d"]["TextWrapped"] = true;
    G2L["d"]["BorderSizePixel"] = 0;
    G2L["d"]["TextSize"] = 12;
    G2L["d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["d"]["TextScaled"] = true;
    G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    G2L["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["d"]["BackgroundTransparency"] = 1;
    G2L["d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["d"]["Size"] = UDim2.new(0.424, 0, 0.647, 0);
    G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["d"]["Text"] = [[Auto-Join Rots]];
    G2L["d"]["Name"] = [[RotName]];
    G2L["d"]["Position"] = UDim2.new(0.268, 0, 0.5, 0);

    -- StarterGui.AutoJoiner.Main.MainScrollFrame.FindInfo.RotName.UITextSizeConstraint
    G2L["e"] = Instance.new("UITextSizeConstraint", G2L["d"]);
    G2L["e"]["MaxTextSize"] = 12;

    -- StarterGui.AutoJoiner.Main.MainScrollFrame.FindInfo.RotPlayers
    G2L["f"] = Instance.new("TextLabel", G2L["c"]);
    G2L["f"]["TextWrapped"] = true;
    G2L["f"]["BorderSizePixel"] = 0;
    G2L["f"]["TextSize"] = 15;
    G2L["f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["f"]["TextScaled"] = true;
    G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    G2L["f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["f"]["BackgroundTransparency"] = 1;
    G2L["f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["f"]["Size"] = UDim2.new(0.065, 0, 1.04934, 0);
    G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["f"]["Text"] = [[8/8]];
    G2L["f"]["Name"] = [[RotPlayers]];
    G2L["f"]["Position"] = UDim2.new(0.557, 0, 0.5, 0);

    -- StarterGui.AutoJoiner.Main.MainScrollFrame.FindInfo.RotPlayers.UITextSizeConstraint
    G2L["10"] = Instance.new("UITextSizeConstraint", G2L["f"]);
    G2L["10"]["MaxTextSize"] = 12;

    -- StarterGui.AutoJoiner.Main.MainScrollFrame.FindInfo.Timestamp
    G2L["11"] = Instance.new("TextLabel", G2L["c"]);
    G2L["11"]["TextWrapped"] = true;
    G2L["11"]["BorderSizePixel"] = 0;
    G2L["11"]["TextSize"] = 12;
    G2L["11"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["11"]["TextScaled"] = true;
    G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    G2L["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["11"]["BackgroundTransparency"] = 1;
    G2L["11"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["11"]["Size"] = UDim2.new(0.16268, 0, 1.04934, 0);
    G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["11"]["Text"] = [[12:67:00]];
    G2L["11"]["Name"] = [[Timestamp]];
    G2L["11"]["Position"] = UDim2.new(0.75, 0, 0.5, 0);

    -- StarterGui.AutoJoiner.Main.MainScrollFrame.FindInfo.Timestamp.UITextSizeConstraint
    G2L["12"] = Instance.new("UITextSizeConstraint", G2L["11"]);
    G2L["12"]["MaxTextSize"] = 12;

    -- StarterGui.AutoJoiner.Main.StopButton
    G2L["13"] = Instance.new("TextButton", G2L["2"]);
    G2L["13"]["TextWrapped"] = true;
    G2L["13"]["BorderSizePixel"] = 0;
    G2L["13"]["TextSize"] = 14;
    G2L["13"]["TextScaled"] = true;
    G2L["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["13"]["BackgroundColor3"] = Color3.fromRGB(128, 128, 128);
    G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    G2L["13"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["13"]["Size"] = UDim2.new(0.24553, 0, 0.07799, 0);
    G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["13"]["Text"] = [[Stop]];
    G2L["13"]["Name"] = [[StopButton]];
    G2L["13"]["Position"] = UDim2.new(0.17985, 0, 0.17735, 0);

    -- StarterGui.AutoJoiner.Main.StopButton.UICorner
    G2L["14"] = Instance.new("UICorner", G2L["13"]);
    G2L["14"]["CornerRadius"] = UDim.new(0.35, 0);

    -- StarterGui.AutoJoiner.Main.StopButton.UITextSizeConstraint
    G2L["15"] = Instance.new("UITextSizeConstraint", G2L["13"]);
    G2L["15"]["MaxTextSize"] = 14;

    -- StarterGui.AutoJoiner.Main.RunButton
    G2L["16"] = Instance.new("TextButton", G2L["2"]);
    G2L["16"]["TextWrapped"] = true;
    G2L["16"]["BorderSizePixel"] = 0;
    G2L["16"]["TextSize"] = 14;
    G2L["16"]["TextScaled"] = true;
    G2L["16"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    G2L["16"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["16"]["Size"] = UDim2.new(0.24553, 0, 0.07799, 0);
    G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["16"]["Text"] = [[Run]];
    G2L["16"]["Name"] = [[RunButton]];
    G2L["16"]["Position"] = UDim2.new(0.17985, 0, 0.07123, 0);

    -- StarterGui.AutoJoiner.Main.RunButton.UICorner
    G2L["17"] = Instance.new("UICorner", G2L["16"]);
    G2L["17"]["CornerRadius"] = UDim.new(0.35, 0);

    -- StarterGui.AutoJoiner.Main.RunButton.UITextSizeConstraint
    G2L["18"] = Instance.new("UITextSizeConstraint", G2L["16"]);
    G2L["18"]["MaxTextSize"] = 14;

    -- StarterGui.AutoJoiner.Main.AddButon
    G2L["19"] = Instance.new("TextButton", G2L["2"]);
    G2L["19"]["TextWrapped"] = true;
    G2L["19"]["BorderSizePixel"] = 0;
    G2L["19"]["TextSize"] = 14;
    G2L["19"]["TextScaled"] = true;
    G2L["19"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    G2L["19"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["19"]["Size"] = UDim2.new(0.23477, 0, 0.06181, 0);
    G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["19"]["Text"] = [[Add]];
    G2L["19"]["Name"] = [[AddButon]];
    G2L["19"]["Position"] = UDim2.new(0.18034, 0, 0.70349, 0);

    -- StarterGui.AutoJoiner.Main.AddButon.UICorner
    G2L["1a"] = Instance.new("UICorner", G2L["19"]);
    G2L["1a"]["CornerRadius"] = UDim.new(0.35, 0);

    -- StarterGui.AutoJoiner.Main.AddButon.UITextSizeConstraint
    G2L["1b"] = Instance.new("UITextSizeConstraint", G2L["19"]);
    G2L["1b"]["MaxTextSize"] = 14;

    -- StarterGui.AutoJoiner.Main.HeaderFrame
    G2L["1c"] = Instance.new("Frame", G2L["2"]);
    G2L["1c"]["BorderSizePixel"] = 0;
    G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
    G2L["1c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["1c"]["Size"] = UDim2.new(-1, 0, -0.07964, 0);
    G2L["1c"]["Position"] = UDim2.new(0.5, 0, -0.04013, 0);
    G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["1c"]["Name"] = [[HeaderFrame]];

    -- StarterGui.AutoJoiner.Main.HeaderFrame.AutoJoinerText
    G2L["1d"] = Instance.new("TextLabel", G2L["1c"]);
    G2L["1d"]["TextWrapped"] = true;
    G2L["1d"]["ZIndex"] = 2;
    G2L["1d"]["BorderSizePixel"] = 0;
    G2L["1d"]["TextSize"] = 15;
    G2L["1d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["1d"]["TextScaled"] = true;
    G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    G2L["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["1d"]["BackgroundTransparency"] = 1;
    G2L["1d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["1d"]["Size"] = UDim2.new(0.26729, 0, 0.64286, 0);
    G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["1d"]["Text"] = [[Puzzle Auto Joiner]];
    G2L["1d"]["Name"] = [[AutoJoinerText]];
    G2L["1d"]["Position"] = UDim2.new(0.19587, 0, 0.51908, 0);

    -- StarterGui.AutoJoiner.Main.HeaderFrame.AutoJoinerText.UITextSizeConstraint
    G2L["1e"] = Instance.new("UITextSizeConstraint", G2L["1d"]);
    G2L["1e"]["MaxTextSize"] = 18;

    -- StarterGui.AutoJoiner.Main.HeaderFrame.Close
    G2L["1f"] = Instance.new("TextButton", G2L["1c"]);
    G2L["1f"]["TextWrapped"] = true;
    G2L["1f"]["BorderSizePixel"] = 0;
    G2L["1f"]["TextSize"] = 17;
    G2L["1f"]["TextScaled"] = true;
    G2L["1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    G2L["1f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["1f"]["BackgroundTransparency"] = 1;
    G2L["1f"]["Size"] = UDim2.new(-0.07143, 0, -0.57143, 0);
    G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["1f"]["Text"] = [[X]];
    G2L["1f"]["Name"] = [[Close]];
    G2L["1f"]["Position"] = UDim2.new(0.96484, 0, 0.50698, 0);

    -- StarterGui.AutoJoiner.Main.HeaderFrame.Close.UITextSizeConstraint
    G2L["20"] = Instance.new("UITextSizeConstraint", G2L["1f"]);
    G2L["20"]["MaxTextSize"] = 17;

    -- StarterGui.AutoJoiner.Main.HeaderFrame.StatusImage
    G2L["21"] = Instance.new("ImageLabel", G2L["1c"]);
    G2L["21"]["ZIndex"] = 2;
    G2L["21"]["BorderSizePixel"] = 0;
    G2L["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["21"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["21"]["Image"] = [[rbxassetid://118672789412763]];
    G2L["21"]["Size"] = UDim2.new(-0.0337, 0, -0.67394, 0);
    G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["21"]["BackgroundTransparency"] = 1;
    G2L["21"]["Name"] = [[StatusImage]];
    G2L["21"]["Position"] = UDim2.new(0.04064, 0, 0.52232, 0);

    -- StarterGui.AutoJoiner.Main.HeaderFrame.Minimize
    G2L["22"] = Instance.new("TextButton", G2L["1c"]);
    G2L["22"]["TextWrapped"] = true;
    G2L["22"]["BorderSizePixel"] = 0;
    G2L["22"]["TextSize"] = 25;
    G2L["22"]["TextScaled"] = true;
    G2L["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    G2L["22"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["22"]["BackgroundTransparency"] = 1;
    G2L["22"]["Size"] = UDim2.new(-0.07143, 0, -0.57143, 0);
    G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["22"]["Text"] = [[─]];
    G2L["22"]["Name"] = [[Minimize]];
    G2L["22"]["Position"] = UDim2.new(0.92656, 0, 0.50698, 0);

    -- StarterGui.AutoJoiner.Main.HeaderFrame.Minimize.UITextSizeConstraint
    G2L["23"] = Instance.new("UITextSizeConstraint", G2L["22"]);
    G2L["23"]["MaxTextSize"] = 25;

    -- StarterGui.AutoJoiner.Main.ConsoleContainer
    G2L["24"] = Instance.new("Frame", G2L["2"]);
    G2L["24"]["BorderSizePixel"] = 0;
    G2L["24"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
    G2L["24"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["24"]["Size"] = UDim2.new(0.61866, 0, 0.25999, 0);
    G2L["24"]["Position"] = UDim2.new(0.65028, 0, 0.80426, 0);
    G2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["24"]["Name"] = [[ConsoleContainer]];

    -- StarterGui.AutoJoiner.Main.ConsoleContainer.Brainrot
    G2L["25"] = Instance.new("TextLabel", G2L["24"]);
    G2L["25"]["TextWrapped"] = true;
    G2L["25"]["ZIndex"] = 2;
    G2L["25"]["BorderSizePixel"] = 0;
    G2L["25"]["TextSize"] = 12;
    G2L["25"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["25"]["TextScaled"] = true;
    G2L["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
    G2L["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["25"]["BackgroundTransparency"] = 1;
    G2L["25"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["25"]["Size"] = UDim2.new(0.30367, 0, 0.22993, 0);
    G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["25"]["Text"] = [[Console Log]];
    G2L["25"]["Name"] = [[Brainrot]];
    G2L["25"]["Position"] = UDim2.new(0.16986, 0, 0.06497, 0);

    -- StarterGui.AutoJoiner.Main.ConsoleContainer.Brainrot.UITextSizeConstraint
    G2L["26"] = Instance.new("UITextSizeConstraint", G2L["25"]);
    G2L["26"]["MaxTextSize"] = 12;

    -- StarterGui.AutoJoiner.Main.ConsoleContainer.MainScrollFrame
    G2L["27"] = Instance.new("ScrollingFrame", G2L["24"]);
    G2L["27"]["Active"] = true;
    G2L["27"]["ZIndex"] = 2;
    G2L["27"]["BorderSizePixel"] = 0;
    G2L["27"]["TopImage"] = [[]];
    G2L["27"]["MidImage"] = [[]];
    G2L["27"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
    G2L["27"]["Name"] = [[MainScrollFrame]];
    G2L["27"]["BottomImage"] = [[]];
    G2L["27"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["27"]["Size"] = UDim2.new(0.94613, 0, 0.72661, 0);
    G2L["27"]["ScrollBarImageColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["27"]["Position"] = UDim2.new(0.49356, 0, 0.54323, 0);
    G2L["27"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
    G2L["27"]["ScrollBarThickness"] = 6;
    G2L["27"]["ScrollBarImageTransparency"] = 0.3;

    -- StarterGui.AutoJoiner.Main.ConsoleContainer.MainScrollFrame.UIListLayout
    G2L["28"] = Instance.new("UIListLayout", G2L["27"]);
    G2L["28"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
    G2L["28"]["Padding"] = UDim.new(0, 2);

    -- StarterGui.AutoJoiner.Main.ConsoleContainer.MainScrollFrame.FindInfo
    G2L["29"] = Instance.new("Frame", G2L["27"]);
    G2L["29"]["BorderSizePixel"] = 0;
    G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["29"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["29"]["Size"] = UDim2.new(1.006, 0, 0, 15);
    G2L["29"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["29"]["Name"] = [[FindInfo]];
    G2L["29"]["BackgroundTransparency"] = 1;

    -- StarterGui.AutoJoiner.Main.ConsoleContainer.MainScrollFrame.FindInfo.LogName
    G2L["2a"] = Instance.new("TextLabel", G2L["29"]);
    G2L["2a"]["TextWrapped"] = true;
    G2L["2a"]["BorderSizePixel"] = 0;
    G2L["2a"]["TextSize"] = 12;
    G2L["2a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["2a"]["TextScaled"] = true;
    G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    G2L["2a"]["TextColor3"] = Color3.fromRGB(91, 255, 127);
    G2L["2a"]["BackgroundTransparency"] = 1;
    G2L["2a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["2a"]["Size"] = UDim2.new(0.97933, 0, 0.95558, 0);
    G2L["2a"]["Visible"] = false;
    G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["2a"]["Text"] = [[[12:67:00] Auto joiner active]];
    G2L["2a"]["Name"] = [[LogName]];
    G2L["2a"]["Position"] = UDim2.new(0.50437, 0, 0.44502, 0);

    -- StarterGui.AutoJoiner.Main.ConsoleContainer.MainScrollFrame.FindInfo.LogName.UITextSizeConstraint
    G2L["2b"] = Instance.new("UITextSizeConstraint", G2L["2a"]);
    G2L["2b"]["MaxTextSize"] = 12;

    -- StarterGui.AutoJoiner.Main.UIAspectRatioConstraint
    G2L["2c"] = Instance.new("UIAspectRatioConstraint", G2L["2"]);
    G2L["2c"]["AspectRatio"] = 1.8382;

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer
    G2L["2d"] = Instance.new("Frame", G2L["2"]);
    G2L["2d"]["BorderSizePixel"] = 0;
    G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["2d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["2d"]["Size"] = UDim2.new(0.30211, 0, 0.13667, 0);
    G2L["2d"]["Position"] = UDim2.new(0.17485, 0, 0.8578, 0);
    G2L["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["2d"]["Name"] = [[MinGenerationContainer]];
    G2L["2d"]["BackgroundTransparency"] = 1;

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.MinGen
    G2L["2e"] = Instance.new("TextLabel", G2L["2d"]);
    G2L["2e"]["TextWrapped"] = true;
    G2L["2e"]["ZIndex"] = 2;
    G2L["2e"]["BorderSizePixel"] = 0;
    G2L["2e"]["TextSize"] = 14;
    G2L["2e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["2e"]["TextScaled"] = true;
    G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["2e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
    G2L["2e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["2e"]["BackgroundTransparency"] = 1;
    G2L["2e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["2e"]["Size"] = UDim2.new(0.53447, 0, 0.29773, 0);
    G2L["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["2e"]["Text"] = [[Min. Generation]];
    G2L["2e"]["Name"] = [[MinGen]];
    G2L["2e"]["Position"] = UDim2.new(0.29689, 0, 0.07165, 0);

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.MinGen.UITextSizeConstraint
    G2L["2f"] = Instance.new("UITextSizeConstraint", G2L["2e"]);
    G2L["2f"]["MaxTextSize"] = 14;

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.MinGenInput
    G2L["30"] = Instance.new("TextBox", G2L["2d"]);
    G2L["30"]["Name"] = [[MinGenInput]];
    G2L["30"]["BorderSizePixel"] = 0;
    G2L["30"]["TextWrapped"] = true;
    G2L["30"]["TextSize"] = 14;
    G2L["30"]["TextColor3"] = Color3.fromRGB(185, 187, 187);
    G2L["30"]["TextScaled"] = true;
    G2L["30"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
    G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    G2L["30"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["30"]["PlaceholderText"] = [[1M]];
    G2L["30"]["Size"] = UDim2.new(0.92568, 0, 0.42144, 0);
    G2L["30"]["Position"] = UDim2.new(0.51393, 0, 0.7478, 0);
    G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["30"]["Text"] = [[]];

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.MinGenInput.UIStroke
    G2L["31"] = Instance.new("UIStroke", G2L["30"]);
    G2L["31"]["Transparency"] = 0.76;
    G2L["31"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    G2L["31"]["Color"] = Color3.fromRGB(255, 255, 255);

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.MinGenInput.UITextSizeConstraint
    G2L["32"] = Instance.new("UITextSizeConstraint", G2L["30"]);
    G2L["32"]["MaxTextSize"] = 14;

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.ToggleFrameGen
    G2L["33"] = Instance.new("Frame", G2L["2d"]);
    G2L["33"]["BorderSizePixel"] = 0;
    G2L["33"]["BackgroundColor3"] = Color3.fromRGB(255, 70, 50);
    G2L["33"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["33"]["Size"] = UDim2.new(0.25846, 0, 0.29773, 0);
    G2L["33"]["Position"] = UDim2.new(0.84753, 0, 0.07166, 0);
    G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["33"]["Name"] = [[ToggleFrameGen]];

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.ToggleFrameGen.UICorner
    G2L["34"] = Instance.new("UICorner", G2L["33"]);
    G2L["34"]["CornerRadius"] = UDim.new(0.35, 0);

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.ToggleFrameGen.Toggle
    G2L["35"] = Instance.new("TextButton", G2L["33"]);
    G2L["35"]["TextWrapped"] = true;
    G2L["35"]["BorderSizePixel"] = 0;
    G2L["35"]["TextSize"] = 14;
    G2L["35"]["TextScaled"] = true;
    G2L["35"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["35"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    G2L["35"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["35"]["Size"] = UDim2.new(0.42105, 0, 1, 0);
    G2L["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["35"]["Text"] = [[]];
    G2L["35"]["Name"] = [[Toggle]];
    G2L["35"]["Position"] = UDim2.new(0.20924, 0, 0.47513, 0);

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.ToggleFrameGen.Toggle.UICorner
    G2L["36"] = Instance.new("UICorner", G2L["35"]);
    G2L["36"]["CornerRadius"] = UDim.new(0.22, 0);

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.ToggleFrameGen.Toggle.UITextSizeConstraint
    G2L["37"] = Instance.new("UITextSizeConstraint", G2L["35"]);
    G2L["37"]["MaxTextSize"] = 14;

    -- StarterGui.AutoJoiner.Main.MinGenerationContainer.UIAspectRatioConstraint
    G2L["38"] = Instance.new("UIAspectRatioConstraint", G2L["2d"]);
    G2L["38"]["AspectRatio"] = 4.06332;

    -- StarterGui.AutoJoiner.Main.StrokeFrame
    G2L["39"] = Instance.new("Frame", G2L["2"]);
    G2L["39"]["BorderSizePixel"] = 0;
    G2L["39"]["BackgroundColor3"] = Color3.fromRGB(46, 47, 47);
    G2L["39"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["39"]["Size"] = UDim2.new(0.62879, 0, 0.6554, 0);
    G2L["39"]["Position"] = UDim2.new(0.65645, 0, 0.3277, 0);
    G2L["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["39"]["Name"] = [[StrokeFrame]];
    G2L["39"]["BackgroundTransparency"] = 1;

    -- StarterGui.AutoJoiner.Main.StrokeFrame.UIStroke
    G2L["3a"] = Instance.new("UIStroke", G2L["39"]);
    G2L["3a"]["Color"] = Color3.fromRGB(255, 255, 255);

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer
    G2L["3b"] = Instance.new("Frame", G2L["2"]);
    G2L["3b"]["BorderSizePixel"] = 0;
    G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["3b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["3b"]["Size"] = UDim2.new(0.32857, 0, 0.45624, 0);
    G2L["3b"]["Position"] = UDim2.new(0.16429, 0, 0.44446, 0);
    G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["3b"]["Name"] = [[JoinByRotContainer]];
    G2L["3b"]["BackgroundTransparency"] = 1;

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.MinGen
    G2L["3c"] = Instance.new("TextLabel", G2L["3b"]);
    G2L["3c"]["TextWrapped"] = true;
    G2L["3c"]["ZIndex"] = 2;
    G2L["3c"]["BorderSizePixel"] = 0;
    G2L["3c"]["TextSize"] = 14;
    G2L["3c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["3c"]["TextScaled"] = true;
    G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
    G2L["3c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["3c"]["BackgroundTransparency"] = 1;
    G2L["3c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["3c"]["Size"] = UDim2.new(0.66792, 0, 0.09011, 0);
    G2L["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["3c"]["Text"] = [[Specific-Rot Filter]];
    G2L["3c"]["Name"] = [[MinGen]];
    G2L["3c"]["Position"] = UDim2.new(0.35017, 0, 0.12993, 0);

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.MinGen.UITextSizeConstraint
    G2L["3d"] = Instance.new("UITextSizeConstraint", G2L["3c"]);
    G2L["3d"]["MaxTextSize"] = 14;

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ScrollingFrame
    G2L["3e"] = Instance.new("ScrollingFrame", G2L["3b"]);
    G2L["3e"]["Active"] = true;
    G2L["3e"]["BorderSizePixel"] = 0;
    G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
    G2L["3e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["3e"]["Size"] = UDim2.new(0.91146, 0, 0.64557, 0);
    G2L["3e"]["Position"] = UDim2.new(0.51668, 0, 0.61605, 0);
    G2L["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["3e"]["ScrollBarThickness"] = 0;

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ScrollingFrame.UIStroke
    G2L["3f"] = Instance.new("UIStroke", G2L["3e"]);
    G2L["3f"]["Color"] = Color3.fromRGB(255, 255, 255);

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ScrollingFrame.NameHolder
    G2L["40"] = Instance.new("Frame", G2L["3e"]);
    G2L["40"]["BorderSizePixel"] = 0;
    G2L["40"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
    G2L["40"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["40"]["Size"] = UDim2.new(1, 0, 0.3, 0);
    G2L["40"]["Position"] = UDim2.new(0.5, 0, 0.06, 0);
    G2L["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["40"]["Name"] = [[NameHolder]];
    G2L["40"]["BackgroundTransparency"] = 0.1;
    G2L["40"]["Visible"] = false;

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ScrollingFrame.NameHolder.BrainrotName
    G2L["41"] = Instance.new("TextButton", G2L["40"]);
    G2L["41"]["TextWrapped"] = true;
    G2L["41"]["BorderSizePixel"] = 0;
    G2L["41"]["TextXAlignment"] = Enum.TextXAlignment.Center;
    G2L["41"]["TextSize"] = 12;
    G2L["41"]["TextScaled"] = true;
    G2L["41"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["41"]["BackgroundColor3"] = Color3.fromRGB(70, 70, 70);
    G2L["41"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    G2L["41"]["ZIndex"] = 2;
    G2L["41"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["41"]["BackgroundTransparency"] = 0.2;
    G2L["41"]["Size"] = UDim2.new(0.9, 0, 0.8, 0);
    G2L["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["41"]["Text"] = [[]];
    G2L["41"]["Name"] = [[BrainrotName]];
    G2L["41"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    G2L["41"]["Visible"] = false;


    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ScrollingFrame.NameHolder.BrainrotName.UITextSizeConstraint
    G2L["42"] = Instance.new("UITextSizeConstraint", G2L["41"]);
    G2L["42"]["MaxTextSize"] = 12;

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ScrollingFrame.UIListLayout
    G2L["43"] = Instance.new("UIListLayout", G2L["3e"]);
    G2L["43"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ToggleFrameGen
    G2L["44"] = Instance.new("Frame", G2L["3b"]);
    G2L["44"]["BorderSizePixel"] = 0;
    G2L["44"]["BackgroundColor3"] = Color3.fromRGB(255, 70, 50);
    G2L["44"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["44"]["Size"] = UDim2.new(0.27737, 0, 0.09339, 0);
    G2L["44"]["Position"] = UDim2.new(0.84895, 0, 0.13157, 0);
    G2L["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["44"]["Name"] = [[ToggleFrameGen]];

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ToggleFrameGen.UICorner
    G2L["45"] = Instance.new("UICorner", G2L["44"]);
    G2L["45"]["CornerRadius"] = UDim.new(0.35, 0);

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ToggleFrameGen.Toggle
    G2L["46"] = Instance.new("TextButton", G2L["44"]);
    G2L["46"]["TextWrapped"] = true;
    G2L["46"]["BorderSizePixel"] = 0;
    G2L["46"]["TextSize"] = 14;
    G2L["46"]["TextScaled"] = true;
    G2L["46"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["46"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    G2L["46"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["46"]["Size"] = UDim2.new(0.42105, 0, 1, 0);
    G2L["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["46"]["Text"] = [[]];
    G2L["46"]["Name"] = [[Toggle]];
    G2L["46"]["Position"] = UDim2.new(0.20924, 0, 0.48164, 0);

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ToggleFrameGen.Toggle.UICorner
    G2L["47"] = Instance.new("UICorner", G2L["46"]);
    G2L["47"]["CornerRadius"] = UDim.new(0.22, 0);

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.ToggleFrameGen.Toggle.UITextSizeConstraint
    G2L["48"] = Instance.new("UITextSizeConstraint", G2L["46"]);
    G2L["48"]["MaxTextSize"] = 14;

    -- StarterGui.AutoJoiner.Main.JoinByRotContainer.UIAspectRatioConstraint
    G2L["49"] = Instance.new("UIAspectRatioConstraint", G2L["3b"]);
    G2L["49"]["AspectRatio"] = 1.16612;

    -- StarterGui.AutoJoiner.UIAspectRatioConstraint
    G2L["4a"] = Instance.new("UIAspectRatioConstraint", G2L["1"]);
    G2L["4a"]["AspectRatio"] = 1.56639;

    -- Input field for adding brainrots (not in new UI, recreated to maintain functionality)
    local InputFrame = Instance.new("Frame")
    InputFrame.Name = "InputFrame"
    InputFrame.Parent = G2L["1"]
    InputFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    InputFrame.BackgroundColor3 = Color3.fromRGB(34, 35, 35)
    InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    InputFrame.Draggable = true
    InputFrame.BorderSizePixel = 0
    InputFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    InputFrame.Size = UDim2.new(0.25, 0, 0.12, 0)
    InputFrame.Visible = false

    local UICorner_InputFrame = Instance.new("UICorner")
    UICorner_InputFrame.CornerRadius = UDim.new(0, 6)
    UICorner_InputFrame.Parent = InputFrame

    local InputTextBox = Instance.new("TextBox")
    InputTextBox.Name = "InputTextBox"
    InputTextBox.Parent = InputFrame
    InputTextBox.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    InputTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    InputTextBox.BorderSizePixel = 0
    InputTextBox.Position = UDim2.new(0.05, 0, 0.2, 0)
    InputTextBox.Size = UDim2.new(0.9, 0, 0.4, 0)
    InputTextBox.FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    InputTextBox.PlaceholderText = "Enter brainrot name"
    InputTextBox.Text = ""
    InputTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputTextBox.TextScaled = true
    InputTextBox.TextSize = 14
    InputTextBox.TextWrapped = true

    local UICorner_InputTextBox = Instance.new("UICorner")
    UICorner_InputTextBox.CornerRadius = UDim.new(0, 6)
    UICorner_InputTextBox.Parent = InputTextBox

    local SubmitButton = Instance.new("TextButton")
    SubmitButton.Name = "SubmitButton"
    SubmitButton.Parent = InputFrame
    SubmitButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SubmitButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SubmitButton.BorderSizePixel = 0
    SubmitButton.Position = UDim2.new(0.05, 0, 0.65, 0)
    SubmitButton.Size = UDim2.new(0.4, 0, 0.25, 0)
    SubmitButton.FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    SubmitButton.Text = "Only Join"
    SubmitButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    SubmitButton.TextScaled = true
    SubmitButton.TextSize = 14
    SubmitButton.TextWrapped = true

    local UICorner_SubmitButton = Instance.new("UICorner")
    UICorner_SubmitButton.CornerRadius = UDim.new(0, 6)
    UICorner_SubmitButton.Parent = SubmitButton

    local IgnoreButton = Instance.new("TextButton")
    IgnoreButton.Name = "IgnoreButton"
    IgnoreButton.Parent = InputFrame
    IgnoreButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    IgnoreButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    IgnoreButton.BorderSizePixel = 0
    IgnoreButton.Position = UDim2.new(0.55, 0, 0.65, 0)
    IgnoreButton.Size = UDim2.new(0.4, 0, 0.25, 0)
    IgnoreButton.FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    IgnoreButton.Text = "Ignore"
    IgnoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    IgnoreButton.TextScaled = true
    IgnoreButton.TextSize = 14
    IgnoreButton.TextWrapped = true

    local UICorner_IgnoreButton = Instance.new("UICorner")
    UICorner_IgnoreButton.CornerRadius = UDim.new(0, 6)
    UICorner_IgnoreButton.Parent = IgnoreButton


    -- Safe spawn function
    local function safeSpawn(func)
        if func then
            local success, err = pcall(function()
                spawn(func)
            end)
            if not success then
            end
        end
    end

    -- Safe wait function
    local function safeWait(time)
        local success, result = pcall(function()
            return wait(time)
        end)
        if not success then
            return time
        end
        return result
    end

    -- Send Webhook
    local function SendWebhook(url, data)
        local httpRequest = (syn and syn.request) or (housekeeper and housekeeper.request) or (http and http.request) or (http_request) or (fluxus and fluxus.request) or request
        if not httpRequest then
            return
        end

        local success, err = pcall(function()
            httpRequest({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(data)
            })
        end)
        if not success then
        end
    end

    -- Webhook queue system
    local webhookQueue = {}
    local isProcessingWebhookQueue = false
    local webhookCooldown = 5

    local function processWebhookQueue()
        if isProcessingWebhookQueue then return end
        isProcessingWebhookQueue = true

        while #webhookQueue > 0 and isScriptRunning do
            local webhookData = table.remove(webhookQueue, 1)
            local success, err = pcall(function()
                SendWebhook(WEBHOOK_URL, webhookData)
            end)
            if not success then
            end
            safeWait(webhookCooldown)
        end
        isProcessingWebhookQueue = false
    end

    -- Send debug message to webhook
    local function sendDebugToWebhook(message, joinTime)
        local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=150&height=150&format=png"
        local data = {
            embeds = {{
                description = message,
                color = 0x00FF00,
                author = {name = LocalPlayer.Name, icon_url = avatarUrl},
                footer = {text = joinTime and ("Join Time: "..joinTime.."ms") or "Debug Info"},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
            }}
        }
        table.insert(webhookQueue, data)
        spawn(processWebhookQueue)
    end

    -- Send join time report to webhook
    local function sendJoinTimeReport(joinTime, brainrotName, jobId)
        local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=150&height=150&format=png"
        local data = {
            embeds = {{
                title = "🚀 Join Time Report",
                description = "**Brainrot:** "..brainrotName.."\n**Job ID:** "..jobId,
                color = 0x0099FF,
                fields = {
                    {name = "⏱️ Join Time", value = joinTime.."ms", inline = true},
                    {name = "📊 Total Joins", value = tostring(totalJoins), inline = true},
                    {name = "📈 Average Time", value = totalJoins > 0 and math.floor(totalJoinTime / totalJoins).."ms" or "N/A", inline = true}
                },
                author = {name = LocalPlayer.Name, icon_url = avatarUrl},
                footer = {text = "Auto Joiner Performance"},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
            }}
        }
        table.insert(webhookQueue, data)
        spawn(processWebhookQueue)
    end

    -- Send crash report to webhook
    local function sendCrashReport(reason, details)
        local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=150&height=150&format=png"
        local data = {
            embeds = {{
                title = "💥 Crash Detected",
                description = "**Reason:** "..reason.."\n**Details:** "..details,
                color = 0xFF0000,
                fields = {
                    {name = "🚨 Crash Count", value = tostring(crashCount), inline = true},
                    {name = "📊 Teleport Attempts", value = tostring(teleportAttempts), inline = true},
                    {name = "⏰ Time Since Last Crash", value = math.floor(tick() - lastCrashTime).."s", inline = true}
                },
                author = {name = LocalPlayer.Name, icon_url = avatarUrl},
                footer = {text = "Crash Detection System"},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
            }}
        }
        table.insert(webhookQueue, data)
        spawn(processWebhookQueue)
    end

    -- Enhanced crash detection
    local function detectCrash()
        crashCount = crashCount + 1
        lastCrashTime = tick()
        
        local crashDetails = "Script execution stopped unexpectedly"
        if hasJoinedNewServer then
            crashDetails = crashDetails .. " | Post-teleport crash after "..math.floor(tick() - serverJoinTime).."s in new server"
        end
        
        sendCrashReport("Script Crash", crashDetails)
        
        
        isTeleporting = false
    end

    -- Detect when we successfully join a new server
    local function detectServerJoin()
        local currentJobId = game.JobId
        if currentJobId and currentJobId ~= lastJobId then
            hasJoinedNewServer = true
            serverJoinTime = tick()
            lastJobId = currentJobId
            
            isTeleporting = false -- Make sure teleporting is set to false
            
            sendDebugToWebhook("🎉 Successfully joined new server! JobId: "..currentJobId)
            
            task.spawn(function()
                task.wait(5)
                if hasJoinedNewServer and autoJoinerEnabled then
                    connectWebSocket()
                end
            end)
            
            -- Reset only websocket-related connections, preserve UI connections
            connections = {}
            setupTeleportEventHandlers()
            
            task.spawn(function()
                task.wait(10)
                if hasJoinedNewServer and tick() - serverJoinTime > 10 then
                    sendDebugToWebhook("✅ Successfully stayed in new server for 10+ seconds")
                end
            end)
        end
    end

    -- Check generation filter
    local function checkGenerationFilter(income)
        if not generationFilterEnabled then
            return true
        end
        
        -- Convert income to actual number
        local incomeValue = parseGeneration(tostring(income))
        
        -- Compare actual numbers
        if minGenerationValue > 0 and incomeValue >= minGenerationValue then
            return true
        elseif minGenerationValue > 0 and incomeValue < minGenerationValue then
            return false
        end
        
        return true
    end

    -- Check only join filter
    local function checkOnlyJoinFilter(brainrotName)
        -- Always check ignore list first, regardless of onlyJoinEnabled
        for _, item in ipairs(onlyJoinBrainrots) do
            if item.type == "ignore" and brainrotName:lower():find(item.name:lower(), 1, true) then
                return "ignore"  -- Found a match in ignore list
            end
        end
        
        -- Only check join list if onlyJoinEnabled is true
        if not onlyJoinEnabled or #onlyJoinBrainrots == 0 then
            return false  -- If no specific brainrots are set, don't consider any as specific
        end
        
        -- Check for join matches
        for _, item in ipairs(onlyJoinBrainrots) do
            if item.type == "join" and brainrotName:lower():find(item.name:lower(), 1, true) then
                return "join"  -- Found a match in join list
            end
        end
        
        return false
    end

    -- Add brainrot to list
    -- Spelling correction for brainrot names
    local function correctBrainrotSpelling(inputName)
        local correctedNames = {
            "Agarrini La Palini",
            "Anpali Babel",
            "Antonio",
            "Belula Beluga",
            "Bisonte Giuppitere",
            "Bombardini Tortinii",
            "Brainrot God Lucky Block",
            "Brres Teh Patipum",
            "Cacasito Satalito",
            "Celularcini Viciosini",
            "Chachechi",
            "Chicleteira Bicicleteira",
            "Cocofanto Elefanto",
            "Dragon Cannelloni",
            "Dug Dug Dug",
            "Dul Dul Dul",
            "Elefanto Frigo",
            "Esok Sekolah",
            "Extinct Ballerina",
            "Extinct Matteo",
            "Extinct Tralalero",
            "Fragola La La La",
            "Garama and Madundung",
            "Girafa Celestre",
            "Graipuss Medussi",
            "Job Job Job Sahur",
            "Karkerkar Kurkur",
            "Ketchuru and Musturu",
            "Ketupat Kepat",
            "La Grande Combinasion",
            "La Karkerkar Combinasion",
            "La Sahur Combinasion",
            "La Supreme Combinasion",
            "La Vacca Saturno Saturnita",
            "La Vaccca Saturno Saturnita",
            "Las Sis",
            "Las Tralaleritas",
            "Las Vaquitas Saturnitas",
            "Los Matteos",
            "Los Bombinitos",
            "Los Bros",
            "Los Chicleteiras",
            "Los Combinasionas",
            "Los Crocodillitos",
            "Los Hotspotsitos",
            "Los Nooo My Hotspotsitos",
            "Los Orcalitos",
            "Los Tralaleritos",
            "Los Tungtungtungcitos",
            "Mariachi Corazoni",
            "Mastodontico Telepiedone",
            "Nuclearo Dinossauro",
            "Odin Din Din Dun",
            "Orcalero Orcala",
            "Orcalita Orcala",
            "Pakrahmat Mamat",
            "Piccione Macchina",
            "Piccionetta Machina",
            "Pot Hotspot",
            "Quesadilla Crocodila",
            "Sammyni Spyderini",
            "Secret Lucky Block",
            "Sigma Girl",
            "Spaghetti Tualetti",
            "Tacorita Bicicleta",
            "Tartaruga Cisterna",
            "Tictac Sahur",
            "Tigroligre Frutonni",
            "Torrtuginni Dragonfruitini",
            "Tototo Sahur",
            "Tralaledon",
            "Tralalero Tralala",
            "Tralalita Tralala",
            "Trenostruzzo Turbo 3000",
            "Trenostruzzo Turbo 4000",
            "Trippi Troppi Troppa Trippa",
            "Tukanno Bananno",
            "Urubini Flamenguini"
        }
        
        -- Convert input to lowercase for comparison
        local lowerInput = string.lower(inputName)
        
        -- Check for exact matches first
        for _, correctName in ipairs(correctedNames) do
            if string.lower(correctName) == lowerInput then
                return correctName
            end
        end
        
        -- Check for partial matches (contains the input)
        for _, correctName in ipairs(correctedNames) do
            if string.find(string.lower(correctName), lowerInput, 1, true) then
                return correctName
            end
        end
        
        -- Check for similar words (Levenshtein distance approximation)
        local bestMatch = nil
        local bestScore = math.huge
        
        for _, correctName in ipairs(correctedNames) do
            local score = 0
            local words1 = {}
            local words2 = {}
            
            -- Split into words
            for word in string.gmatch(lowerInput, "%S+") do
                table.insert(words1, word)
            end
            for word in string.gmatch(string.lower(correctName), "%S+") do
                table.insert(words2, word)
            end
            
            -- Check if any words match
            for _, word1 in ipairs(words1) do
                for _, word2 in ipairs(words2) do
                    if word1 == word2 then
                        score = score - 10 -- Strong match
                    elseif string.find(word2, word1, 1, true) then
                        score = score - 5 -- Partial match
                    elseif string.len(word1) > 3 and string.len(word2) > 3 then
                        -- Simple similarity check for longer words
                        local similarity = 0
                        local minLen = math.min(string.len(word1), string.len(word2))
                        for i = 1, minLen do
                            if string.sub(word1, i, i) == string.sub(word2, i, i) then
                                similarity = similarity + 1
                            end
                        end
                        if similarity / minLen > 0.6 then
                            score = score - 3 -- Similar words
                        end
                    end
                end
            end
            
            if score < bestScore then
                bestScore = score
                bestMatch = correctName
            end
        end
        
        -- If we found a reasonable match (score < -3), return it
        if bestMatch and bestScore < -3 then
            return bestMatch
        end
        
        -- No correction found, return original
        return inputName
    end

    local function addBrainrotToList(brainrotName, brainrotType)
        if brainrotName == "" then return end
        table.insert(onlyJoinBrainrots, {name = brainrotName, type = brainrotType})
        
        local nameHolder = G2L["3e"]:FindFirstChild("NameHolder")
        if nameHolder and not nameHolder.BrainrotName.Visible then
            nameHolder.BrainrotName.Text = brainrotName
            nameHolder.BrainrotName.Visible = true
            nameHolder.Visible = true
            -- Set text color based on type
            if brainrotType == "ignore" then
                nameHolder.BrainrotName.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red for ignore
            else
                nameHolder.BrainrotName.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green for join
            end
            
            nameHolder.BrainrotName.MouseButton1Click:Connect(function()
                for i, item in ipairs(onlyJoinBrainrots) do
                    if item.name == brainrotName then
                        table.remove(onlyJoinBrainrots, i)
                        nameHolder.BrainrotName.Visible = false
                        nameHolder.Visible = false
                        nameHolder.BrainrotName.Text = ""
                        saveConfig() -- Save when removing
                        break
                    end
                end
                G2L["3e"].CanvasSize = UDim2.new(0, 0, 0, G2L["43"].AbsoluteContentSize.Y)
            end)
        else
            local newNameHolder = nameHolder:Clone()
            newNameHolder.Parent = G2L["3e"]
            -- Fix positioning for cloned items - let UIListLayout handle positioning
            newNameHolder.Position = UDim2.new(0.5, 0, 0, 0) -- Reset to center horizontally, let layout handle vertical
            newNameHolder.BrainrotName.Text = brainrotName
            newNameHolder.BrainrotName.Visible = true
            -- Set text color based on type
            if brainrotType == "ignore" then
                newNameHolder.BrainrotName.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red for ignore
            else
                newNameHolder.BrainrotName.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green for join
            end
            
            newNameHolder.BrainrotName.MouseButton1Click:Connect(function()
                for i, item in ipairs(onlyJoinBrainrots) do
                    if item.name == brainrotName then
                        table.remove(onlyJoinBrainrots, i)
                        newNameHolder:Destroy()
                        saveConfig() -- Save when removing
                        break
                    end
                end
                G2L["3e"].CanvasSize = UDim2.new(0, 0, 0, G2L["43"].AbsoluteContentSize.Y)
            end)
        end
        G2L["3e"].CanvasSize = UDim2.new(0, 0, 0, G2L["43"].AbsoluteContentSize.Y)
        saveConfig() -- Save when adding
    end


    -- Add log entry for console
    local function addLogEntry(message, isRed)
        local logFrame = G2L["27"]:FindFirstChild("FindInfo")
        local timestamp = os.date("%H:%M:%S")
        
        local newLogFrame
        if logFrame and not logFrame.LogName.Visible then
            newLogFrame = logFrame
        else
            newLogFrame = logFrame:Clone()
            newLogFrame.Parent = G2L["27"]
            newLogFrame.LayoutOrder = -tick() -- Make it appear at top with unique negative order
        end
        
        newLogFrame.LogName.Text = string.format("[%s] %s", timestamp, message)
        newLogFrame.LogName.Visible = true
        
        -- Set text color based on parameter or message content
        if isRed or message:find("❌") or message:find("FAILED") then
            newLogFrame.LogName.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
        elseif message:find("Skipped") then
            newLogFrame.LogName.TextColor3 = Color3.fromRGB(255, 165, 0)
        elseif message:find("Debug") then
            newLogFrame.LogName.TextColor3 = Color3.fromRGB(255, 255, 0)
        else
            newLogFrame.LogName.TextColor3 = Color3.fromRGB(91, 255, 127)
        end
        
        G2L["27"].CanvasSize = UDim2.new(0, 0, 0, G2L["28"].AbsoluteContentSize.Y)
    end

    -- Track existing servers to prevent duplicates
    local existingServers = {}
    
    -- Function to clean up old server entries (prevent memory buildup)
    local function cleanupOldServers()
        local currentTime = tick()
        local maxAge = 300 -- 5 minutes
        
        for serverKey, timestamp in pairs(existingServers) do
            if currentTime - timestamp > maxAge then
                existingServers[serverKey] = nil
            end
        end
    end
    
    -- Function to connect join button functionality
    local function connectJoinButton(joinButton)
        joinButton.MouseButton1Click:Connect(function()
            local jobId = joinButton:GetAttribute("JobId")
            local brainrotName = joinButton:GetAttribute("BrainrotName")
            local income = joinButton:GetAttribute("Income")
            
            if jobId and brainrotName then
                addLogEntry("Manual join attempt for "..brainrotName.." (Job ID: "..jobId..")")
                
                -- Show loading UI
                showLoadingUI(brainrotName, income)
                
                -- Close websocket first
                safeCloseWebSocket()
                
                -- Wait for websocket closure
                task.wait(0.5)
                
                -- Attempt teleport
                local success, result = pcall(function()
                    TeleportService:TeleportToPlaceInstance(109983668079237, jobId, LocalPlayer)
                end)
                
                if not success then
                    addLogEntry("❌ Manual join failed: "..tostring(result), true)
                    hideLoadingUI()
                else
                    addLogEntry("✅ Manual join initiated for "..brainrotName)
                    -- Stop auto joiner after successful teleport
                    autoJoinerEnabled = false
                    G2L["16"].Text = "Start"
                    TweenService:Create(G2L["16"], tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    addLogEntry("Auto joiner stopped after manual join")
                end
            end
        end)
    end
    
    -- Add server to GUI
    local function addServerToGui(brainrotName, playerCount, timestamp, jobId, income)
        -- Create unique key for duplicate detection
        local serverKey = brainrotName .. "_" .. (jobId or "unknown") .. "_" .. (income or 0)
        
        -- Check if this exact server already exists
        if existingServers[serverKey] then
            return -- Skip duplicate
        end
        
        local serverFrame = G2L["a"]:FindFirstChild("FindInfo")
        local newServerFrame
        
        if serverFrame and not serverFrame.Visible then
            newServerFrame = serverFrame
        else
            newServerFrame = serverFrame:Clone()
            newServerFrame.Parent = G2L["a"]
            newServerFrame.LayoutOrder = -tick() -- Make it appear at top with unique negative order
        end
        
        newServerFrame.Visible = true
        
        -- Ensure we have valid values
        brainrotName = brainrotName or "Unknown Server"
        playerCount = playerCount or "0/8"
        timestamp = timestamp or os.date("%H:%M:%S")
        income = income or 0
        
        
        -- format brainrot name with generation (show actual generation number)
        newServerFrame.RotName.Text = brainrotName .. " [" .. income .. "]"
        
        -- Color coding for generations
        local incomeNum = parseGeneration(tostring(income))
        
        -- Force color application
        newServerFrame.RotName.TextScaled = true
        newServerFrame.RotName.TextSize = 12
        
        if incomeNum >= 15000000 then
            newServerFrame.RotName.TextColor3 = Color3.fromRGB(179, 158, 181) -- Lavender for 15m+
        elseif incomeNum >= 5000000 then
            newServerFrame.RotName.TextColor3 = Color3.fromRGB(255, 165, 0) -- Orange for 5m+
        else
            newServerFrame.RotName.TextColor3 = Color3.fromRGB(255, 255, 255) -- White for others
        end
        
        -- Restore text scaled after color is applied
        newServerFrame.RotName.TextScaled = true
        
        newServerFrame.RotPlayers.Text = playerCount
        newServerFrame.Timestamp.Text = timestamp
        
        -- Create join button if it doesn't exist
        local joinButton = newServerFrame:FindFirstChild("JoinButton")
        if not joinButton then
            joinButton = Instance.new("TextButton")
            joinButton.Name = "JoinButton"
            joinButton.Parent = newServerFrame
            joinButton.Text = "Join"
            joinButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            joinButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            joinButton.BackgroundTransparency = 0.3
            joinButton.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Bold)
            joinButton.TextSize = 10
            joinButton.TextScaled = true
            joinButton.BorderSizePixel = 0
            joinButton.AnchorPoint = Vector2.new(0.5, 0.5)
            joinButton.Size = UDim2.new(0.12, 0, 0.5, 0)
            joinButton.Position = UDim2.new(0.9, 0, 0.5, 0)
            
            -- Add UICorner for rounded corners (half the previous size)
            local corner = Instance.new("UICorner")
            corner.Parent = joinButton
            corner.CornerRadius = UDim.new(0.25, 0)
            
            -- Add UITextSizeConstraint
            local textConstraint = Instance.new("UITextSizeConstraint")
            textConstraint.Parent = joinButton
            textConstraint.MaxTextSize = 10
        end
        
        -- Store job ID as attribute for the join button
        joinButton:SetAttribute("JobId", jobId)
        joinButton:SetAttribute("BrainrotName", brainrotName)
        joinButton:SetAttribute("Income", income)
        
        -- Connect join button functionality after attributes are set
        connectJoinButton(joinButton)
        
        -- Mark this server as existing to prevent duplicates (with timestamp)
        existingServers[serverKey] = tick()
        
        -- Clean up old entries periodically
        if math.random() < 0.1 then -- 10% chance to clean up
            cleanupOldServers()
        end
        
        G2L["a"].CanvasSize = UDim2.new(0, 0, 0, G2L["b"].AbsoluteContentSize.Y)
    end

    -- Function to safely close websocket and clean up connections
    local function safeCloseWebSocket()
        if websocketConnection then
            pcall(function()
                websocketConnection:Close()
            end)
            websocketConnection = nil
        end
        
        -- Don't disconnect UI connections, only close the websocket
        -- The UI connections (like T key binding) should remain active
    end

    -- Function to reconnect websocket after teleportation
    local function reconnectAfterTeleport()
        if isScriptRunning and not isConnecting then
            task.wait(2) -- Wait a bit longer after teleportation
            connectWebSocket()
        end
    end

    -- Connect to WebSocket
    local function connectWebSocket()
        if isConnecting or not isScriptRunning then return end
        isConnecting = true
        
        local success, ws = pcall(function()
            return WebSocket.connect(WEBSOCKET_URL)
        end)
        
        if not success then
            isConnecting = false
            safeWait(5)
            if isScriptRunning then
                connectWebSocket()
            end
            return
        end
        
        websocketConnection = ws
        
        ws.OnMessage:Connect(function(message)
            
            local success, data = pcall(function()
                return HttpService:JSONDecode(message)
            end)
            
            if not success then
                return
            end
            
            
            -- Handle different possible data structures
            local brainrotName = data.brainrotName or data.name or data.brainrot or "Unknown"
            local jobId = data.jobId or data.jobid or data.serverId or ""
            local playerCount = ""
            local timestamp = ""
            local income
            
            -- Parse player count - Discord bot already provides proper format
            if data.playerCount then
                local rawCount = tostring(data.playerCount)
                -- Check if it's already in "X/Y" format from Discord bot
                if rawCount:match("%d/%d") then
                    playerCount = rawCount -- Already formatted like "5/8"
                else
                    -- If it's just a number, assume max players are 8
                    playerCount = rawCount.."/8"
                end
            elseif data.players then
                playerCount = tostring(data.players).."/8"
            elseif data.JobsJoined then -- Alternative format
                playerCount = tostring(data.JobsJoined).."/8"
            else
                playerCount = "0/8"
            end
            
            -- Parse timestamp - Discord bot sends Unix timestamp in milliseconds
            if data.timestamp then
                local unixTime = tonumber(data.timestamp)
                if unixTime then
                    -- Discord bot sends timestamp in milliseconds, convert to seconds
                    local date = os.date("!%H:%M:%S", unixTime / 1000)
                    timestamp = date
                else
                    -- If conversion fails, use current time
                    timestamp = os.date("%H:%M:%S")
                end
            elseif data.time then
                local tm = tostring(data.time)
                if tm:match("^%d%d:%d%d:%d%d$") then
                    timestamp = tm
                else
                    timestamp = os.date("%H:%M:%S")
                end
            else
                timestamp = os.date("%H:%M:%S")
            end
            
            -- Parse income/generation
            if data.income then
                income = data.income
            elseif data.generation then
                income = data.generation
            elseif data.money then
                income = data.money
            elseif data.g then
                income = data.g
            else
                -- If no income field found, try to extract from brainrot name or use default
                local nameWithGen = brainrotName:match("%[(.+)%]")
                if nameWithGen then
                    income = parseGeneration(nameWithGen)
                else
                    income = 1000000 -- Default to 1M if no income data
                end
            end
            
            -- Check if this is a specific brainrot we want to join or ignore
            local filterResult = checkOnlyJoinFilter(brainrotName)
            
            if filterResult == "ignore" then
                addLogEntry("Ignoring brainrot: "..brainrotName.." (in ignore list)")
                return
            end
            
            -- If only join filter is enabled, ONLY join brainrots in the join list
            if onlyJoinEnabled then
                if filterResult == "join" then
                    addLogEntry("Found specific brainrot to join: "..brainrotName.." (bypassing generation filter)")
                else
                    addLogEntry("Skipped "..brainrotName.." (not in only join list) | Income: "..income)
                    return
                end
            else
                -- Normal generation filter when only join is disabled
                if not checkGenerationFilter(income) then
                    addLogEntry("Skipped "..brainrotName.." (Income: "..income..")")
                    return
                end
            end
            
            addServerToGui(brainrotName, playerCount, timestamp, jobId, income)
            
            if autoJoinerEnabled and not isTeleporting then
                isTeleporting = true
                teleportAttempts = teleportAttempts + 1
                joinStartTime = tick()
                
                addLogEntry("Found eligible brainrot: "..brainrotName.." ("..jobId..")")
                
                
                
                -- Show loading UI
                showLoadingUI(brainrotName, income)
                
                task.wait(0.5) -- Wait after logging join attempt
                
                -- Step 1: Close websocket
                safeCloseWebSocket()
                
                -- Step 2: Wait for websocket closure
                task.wait(0.5)
                
                -- Step 3: Join server
                addLogEntry("Attempting to join server")
                
                -- Teleport to server
                local success, result = pcall(function()
                    TeleportService:TeleportToPlaceInstance(109983668079237, jobId, LocalPlayer)
                end)
                
                if not success then
                    addLogEntry("❌ FAILED to join "..brainrotName..": "..tostring(result), true)
                    hideLoadingUI()
                    isTeleporting = false
                else
                    local joinTime = math.floor((tick() - joinStartTime) * 1000)
                    addLogEntry("❌ Failed to join "..brainrotName.." in "..joinTime.."ms")
                    totalJoins = totalJoins + 1
                    totalJoinTime = totalJoinTime + joinTime
                    sendJoinTimeReport(joinTime, brainrotName, jobId)
                    hideLoadingUI()
                    isTeleporting = false
                    
                    -- Stop auto joiner after successful teleport
                    autoJoinerEnabled = false
                    G2L["16"].Text = "Start"
                    TweenService:Create(G2L["16"], tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    addLogEntry("Auto joiner stopped after successful teleport")
                end
            end
        end)
        
        ws.OnClose:Connect(function()
            websocketConnection = nil
            isConnecting = false
            
            -- Only reconnect if script is still running and not teleporting
            if isScriptRunning and not isTeleporting then
                safeWait(5)
                connectWebSocket()
            elseif isScriptRunning and isTeleporting then
                -- Set up a delayed reconnection for teleport cases
                task.spawn(function()
                    task.wait(5) -- Reduced wait time for faster recovery
                    if isScriptRunning and not websocketConnection then
                        connectWebSocket()
                    end
                end)
            end
        end)
        
        isConnecting = false
    end

    -- Setup teleport event handlers
    local function setupTeleportEventHandlers()
        -- No teleport event handlers needed - removed retry logic
        
        table.insert(connections, Players.PlayerRemoving:Connect(function(player)
            if player == LocalPlayer then
                addLogEntry("Local player left game")
                isTeleporting = false
            end
        end))
        
        table.insert(connections, game.Close:Connect(function()
            isScriptRunning = false
            if websocketConnection then
                pcall(function()
                    websocketConnection:Close()
                end)
            end
            for _, connection in ipairs(connections) do
                pcall(function()
                    connection:Disconnect()
                end)
            end
            sendDebugToWebhook("Script shutting down")
            addLogEntry("Script shutting down")
        end))
        
        -- Use Heartbeat to call detectServerJoin
        table.insert(connections, RunService.Heartbeat:Connect(function()
            if isScriptRunning then
                detectServerJoin()
            end
        end))
    end

    -- Toggle auto joiner
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local buttonTweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local greenColor = Color3.fromRGB(0, 255, 0)
    local greyColor = Color3.fromRGB(128, 128, 128)
    local redColor = Color3.fromRGB(216, 84, 45)

    local function toggleAutoJoiner()
        autoJoinerEnabled = not autoJoinerEnabled
        
        if autoJoinerEnabled then
            -- Animate buttons
            TweenService:Create(G2L["16"], buttonTweenInfo, {Size = UDim2.new(0.24553, 0, 0.07799, 0)}):Play()
            TweenService:Create(G2L["13"], buttonTweenInfo, {Size = UDim2.new(0.24553, 0, 0.07799, 0)}):Play()
            
            -- When enabled: Run button grey (disabled), Stop button red (active)
            TweenService:Create(G2L["16"], tweenInfo, {BackgroundColor3 = greyColor}):Play()
            TweenService:Create(G2L["13"], tweenInfo, {BackgroundColor3 = redColor}):Play()
            G2L["21"].Image = "rbxassetid://118672789412763" -- Online status
            sendDebugToWebhook("Auto joiner enabled")
            addLogEntry("Auto joiner enabled")
            if not websocketConnection then
                connectWebSocket()
            end
        else
            -- Animate buttons
            TweenService:Create(G2L["16"], buttonTweenInfo, {Size = UDim2.new(0.24553, 0, 0.07799, 0)}):Play()
            TweenService:Create(G2L["13"], buttonTweenInfo, {Size = UDim2.new(0.24553, 0, 0.07799, 0)}):Play()
            
            -- When disabled: Run button white (ready), Stop button grey (disabled)
            TweenService:Create(G2L["16"], tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(G2L["13"], tweenInfo, {BackgroundColor3 = greyColor}):Play()
            G2L["21"].Image = "rbxassetid://118672789412763" -- Offline status
            addLogEntry("Auto joiner disabled")
            sendDebugToWebhook("Auto joiner disabled")
            if websocketConnection then
                pcall(function()
                    websocketConnection:Close()
                end)
                websocketConnection = nil
            end
        end
    end

    -- UI Event Handlers
    G2L["16"].MouseButton1Click:Connect(function()
        if not autoJoinerEnabled then
            toggleAutoJoiner()
        end
    end)

    G2L["13"].MouseButton1Click:Connect(function()
        if autoJoinerEnabled then
            -- Close websocket when stop button is clicked
            safeCloseWebSocket()
            toggleAutoJoiner()
        end
    end)

    G2L["19"].MouseButton1Click:Connect(function()
        InputFrame.Visible = true
        G2L["2"].Visible = false
    end)

    -- Note: Join button connections are now handled directly in addServerToGui function
    -- after attributes are set, ensuring all buttons work properly including the first one

    SubmitButton.MouseButton1Click:Connect(function()
        local brainrotName = InputTextBox.Text
        if brainrotName ~= "" then
            addBrainrotToList(brainrotName, "join")
            addLogEntry("Added brainrot to only join list: "..brainrotName)
            InputTextBox.Text = ""
            InputFrame.Visible = false
            G2L["2"].Visible = true
        end
    end)

    IgnoreButton.MouseButton1Click:Connect(function()
        local brainrotName = InputTextBox.Text
        if brainrotName ~= "" then
            addBrainrotToList(brainrotName, "ignore")
            addLogEntry("Added brainrot to ignore list: "..brainrotName)
            InputTextBox.Text = ""
            InputFrame.Visible = false
            G2L["2"].Visible = true
        end
    end)



    G2L["30"].FocusLost:Connect(function(enterPressed)
        if enterPressed then
            minGeneration = G2L["30"].Text
            updateMinGenerationValue()
            addLogEntry("Set minimum generation to "..minGeneration)
            saveConfig() -- Save when changing min generation
        end
    end)

    G2L["35"].MouseButton1Click:Connect(function()
        -- Toggle the state
        generationFilterEnabled = not generationFilterEnabled
        
        -- Get the correct colors and positions
        local targetColor = generationFilterEnabled and greenColor or Color3.fromRGB(255, 70, 50)
        local targetPosition = generationFilterEnabled and UDim2.new(0.79, 0, 0.5, 0) or UDim2.new(0.21, 0, 0.5, 0)
        
        -- Animate toggle button sliding to the right (preserving original Y position)
        TweenService:Create(G2L["35"], buttonTweenInfo, {Position = targetPosition}):Play()
        TweenService:Create(G2L["33"], tweenInfo, {BackgroundColor3 = targetColor}):Play()
        
        addLogEntry("Generation filter "..(generationFilterEnabled and "enabled" or "disabled"))
        saveConfig() -- Save when toggling generation filter
    end)

    G2L["46"].MouseButton1Click:Connect(function()
        -- Toggle the state
        onlyJoinEnabled = not onlyJoinEnabled
        
        -- Get the correct colors and positions
        local targetColor = onlyJoinEnabled and greenColor or Color3.fromRGB(255, 70, 50)
        local targetPosition = onlyJoinEnabled and UDim2.new(0.79, 0, 0.48, 0) or UDim2.new(0.21, 0, 0.48, 0)
        
        -- Animate toggle button sliding to the right (preserving original Y position)
        TweenService:Create(G2L["46"], buttonTweenInfo, {Position = targetPosition}):Play()
        TweenService:Create(G2L["44"], tweenInfo, {BackgroundColor3 = targetColor}):Play()
        
        addLogEntry("Specific-Rot join "..(onlyJoinEnabled and "enabled" or "disabled"))
        saveConfig() -- Save when toggling specific-rot join
    end)


    -- Toggle GUI visibility function (keep open button always visible)
    local function toggleGUI()
        G2L["2"].Visible = not G2L["2"].Visible
    end

    -- Open button click handler - use uiConnections to prevent disconnection
    table.insert(uiConnections, OpenButton.MouseButton1Click:Connect(toggleGUI))

    -- Keyboard binding (T key) - use uiConnections to prevent disconnection
    table.insert(uiConnections, UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Enum.KeyCode.T then
            toggleGUI()
        elseif input.KeyCode == Enum.KeyCode.Y then
            -- Test configuration system
            testConfig()
        elseif input.KeyCode == Enum.KeyCode.U then
            -- Force UI update
            forceUIUpdate()
        end
    end))

    -- Remove minimize and close buttons from header (after GUI is fully created)
    if G2L["1f"] then G2L["1f"].Visible = false end -- Close button (X)
    if G2L["22"] then G2L["22"].Visible = false end -- Minimize button (-)

    -- Dragging functionality for HeaderFrame (G2L["1c"])
    local dragging = false
    local lastMousePosition = Vector2.new(0, 0)

    G2L["1c"].InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            lastMousePosition = input.Position
            G2L["1c"].Parent.InputBegan:CaptureMouse()
        end
    end)

    G2L["1c"].InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - lastMousePosition
            local newPosition = G2L["1c"].Parent.Position + UDim2.new(0, delta.X, 0, delta.Y)
            G2L["1c"].Parent.Position = newPosition
            lastMousePosition = input.Position
        end
    end)

    G2L["1c"].InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            G2L["1c"].Parent.InputBegan:ReleaseMouse()
        end
    end)

    -- Close button - Fully terminate script
    G2L["1f"].MouseButton1Click:Connect(function()
        addLogEntry("Closing auto joiner...")
        G2L["1"].Enabled = false
        isScriptRunning = false
        
        -- Hide loading UI if visible
        hideLoadingUI()
        
        -- Clean up connections
        if websocketConnection then
            pcall(function()
                websocketConnection:Close()
            end)
        end
        for _, connection in ipairs(connections) do
            pcall(function()
                connection:Disconnect()
            end)
        end
        
        -- Fully destroy GUI after cleanup
        task.spawn(function()
            task.wait(0.1)
            G2L["1"]:Destroy()
            pcall(function()
                error("Script terminated by user")
            end)
        end)
    end)


    -- Initialize with safety checks
    local function safeInitialize()
        pcall(function()
            addLogEntry("Auto joiner script initialized")
            sendDebugToWebhook("Auto joiner script initialized")
            
            -- Start brainrot scrambler
            startBrainrotScrambler()
            
            -- Load saved configuration (but don't apply to UI yet)
            loadConfig()
            
            setupTeleportEventHandlers()

            -- Heartbeat for crash detection
            table.insert(connections, RunService.Heartbeat:Connect(function()
                if isScriptRunning then
                    detectServerJoin()
                end
            end))
            
            -- Connect WebSocket safely
            task.spawn(function()
                task.wait(1) -- Wait a moment before connecting
                connectWebSocket()
            end)
        end)
    end

    -- Error handling for script crashes
    local function handleError(err)
        if err then
            detectCrash()
            addLogEntry("Script error: "..tostring(err))
            sendCrashReport("Script Error", tostring(err))
        end
    end

    -- Test configuration system
    local function testConfig()
        -- Test save
        generationFilterEnabled = true
        minGeneration = "5M"
        updateMinGenerationValue()
        onlyJoinEnabled = true
        onlyJoinBrainrots = {"TestBrainrot1", "TestBrainrot2"}
        
        saveConfig()
        
        -- Reset variables
        generationFilterEnabled = false
        minGeneration = ""
        updateMinGenerationValue()
        onlyJoinEnabled = false
        onlyJoinBrainrots = {}
        
        -- Test load
        loadConfig()
        
        addLogEntry("Configuration test completed")
    end

    -- Manual UI update function
    local function forceUIUpdate()
        
        applyLoadedConfig()
    end

    -- Safe initialization

    task.spawn(function()
        task.wait(2) -- Wait for game to fully load
        local success = pcall(function()
            safeInitialize()
            
            -- Apply configuration after everything is initialized
            task.wait(2) -- Give everything time to fully initialize
            applyConfigAfterGUI()
        end)
        
        if not success then
            addLogEntry("Initialization failed - retrying")
            task.wait(5)
            safeInitialize()
            
            -- Apply configuration after retry
            task.wait(2)
            applyConfigAfterGUI()
        end
    end)
