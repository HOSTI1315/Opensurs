-- leaked by script haven https://discord.gg/sREcYZPsPc

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local VirtualUser = game:GetService("VirtualUser")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")


local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled


local player = Players.LocalPlayer


local buttonCooldowns = {}
local function withCooldown(key, handler, delay)
    local now = tick()
    delay = delay or 0.25
    if buttonCooldowns[key] and now - buttonCooldowns[key] < delay then
        return
    end
    buttonCooldowns[key] = now
    if type(handler) == "function" then
        handler()
    end
end


local function applySavedKeybindToButton(button)
    if not button or not button.Name then return end
    if not savedConfig or not savedConfig.keybinds then return end


    local stored = savedConfig.keybinds[button.Name]
    if type(stored) ~= "string" then return end


    local keyCode = Enum.KeyCode[stored]
    if keyCode then
        setButtonKeybind(button, keyCode)
    end
end


local ACTIVE_COLOR = Color3.fromRGB(0, 150, 0)
local CHECKMARK = "✅"
local character = player.Character or player.CharacterAdded:Wait()


local themes = {
    Black = Color3.fromRGB(0, 0, 0),
    Blue = Color3.fromRGB(0, 170, 255),
    Red = Color3.fromRGB(255, 70, 70),
    Green = Color3.fromRGB(70, 255, 140),
    Purple = Color3.fromRGB(180, 70, 255)
}


local currentThemeName = "Black"
local currentThemeColor = themes[currentThemeName]


local CONFIG_FILE = "Vexuhub_" .. player.Name .. "_config.json"
local canUseFS = typeof(isfile) == "function" and typeof(readfile) == "function" and typeof(writefile) == "function"


savedConfig = {
    theme = currentThemeName,
    keybinds = {}
}


local function loadConfig()
    if not canUseFS then return end
    if not isfile(CONFIG_FILE) then return end


    local ok, data = pcall(readfile, CONFIG_FILE)
    if not ok or not data or data == "" then return end


    local okDecode, decoded = pcall(function()
        return HttpService:JSONDecode(data)
    end)
    if not okDecode or type(decoded) ~= "table" then return end


    if type(decoded.theme) == "string" and themes[decoded.theme] then
        currentThemeName = decoded.theme
        currentThemeColor = themes[currentThemeName]
        savedConfig.theme = currentThemeName
    end


    if type(decoded.keybinds) == "table" then
        savedConfig.keybinds = decoded.keybinds
    end
end


local function saveConfig()
    if not canUseFS then return end


    savedConfig.theme = currentThemeName


    local okEncode, encoded = pcall(function()
        return HttpService:JSONEncode(savedConfig)
    end)
    if not okEncode then return end


    pcall(writefile, CONFIG_FILE, encoded)
end


loadConfig()


local function applyTheme(elements, color)
    for _, obj in ipairs(elements) do
        if obj:IsA("Frame") or obj:IsA("TextButton") or obj:IsA("TextLabel") then
            if obj.Name ~= "Background" then
                obj.BackgroundColor3 = color
            end
        end
        if obj:IsA("TextButton") or obj:IsA("TextLabel") then
            obj.TextColor3 = Color3.new(1, 1, 1)
        end
    end
end


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VexuhubUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")


local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 260)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -130)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui


local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = currentThemeColor
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame


local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(0, 120, 1, 0)
titleLabel.Position = UDim2.new(0, 8, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "XENT v0.1"
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Parent = topBar


local exitButton = Instance.new("TextButton")
exitButton.Name = "ExitButton"
exitButton.Size = UDim2.new(0, 40, 0, 24)
exitButton.Position = UDim2.new(1, -46, 0.5, -12)
exitButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
exitButton.Text = "X"
exitButton.Font = Enum.Font.GothamBold
exitButton.TextSize = 18
exitButton.TextColor3 = Color3.new(1, 1, 1)
exitButton.Parent = topBar


local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 34, 0, 24)
minimizeButton.Position = UDim2.new(1, -84, 0.5, -12)
minimizeButton.BackgroundColor3 = currentThemeColor
minimizeButton.Text = "-"
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 18
minimizeButton.TextColor3 = Color3.new(1, 1, 1)
minimizeButton.Parent = topBar


local tabBar = Instance.new("Frame")
tabBar.Name = "TabBar"
tabBar.Size = UDim2.new(1, 0, 0, 28)
tabBar.Position = UDim2.new(0, 0, 0, 30)
tabBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
tabBar.BorderSizePixel = 0
tabBar.Parent = mainFrame


local function createTabButton(name, order)
    local btn = Instance.new("TextButton")
    btn.Name = name .. "Tab"
    btn.Size = UDim2.new(0, 90, 1, 0)
    btn.Position = UDim2.new(0, 8 + (order - 1) * 94, 0, 0)
    btn.BackgroundColor3 = currentThemeColor
    btn.Text = name
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 14
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Parent = tabBar
    return btn
end


local mainTabButton = createTabButton("Main", 1)
local miscTabButton = createTabButton("Misc", 2)
local settingsTabButton = createTabButton("Settings", 3)


local pagesFrame = Instance.new("Frame")
pagesFrame.Name = "PagesFrame"
pagesFrame.Size = UDim2.new(1, -20, 1, -68)
pagesFrame.Position = UDim2.new(0, 10, 0, 60)
pagesFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
pagesFrame.BorderSizePixel = 0
pagesFrame.Parent = mainFrame


local function createPage(name)
    local page = Instance.new("Frame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.Position = UDim2.new(0, 0, 0, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = pagesFrame
    return page
end


local mainPage = createPage("Main")
local miscPage = createPage("Misc")
local settingsPage = createPage("Settings")


local restoreButton = Instance.new("TextButton")
restoreButton.Name = "RestoreButton"
-- make the restore button bigger so it's easier to grab
restoreButton.Size = UDim2.new(0, 44, 0, 44)
restoreButton.Position = UDim2.new(0, 10, 0, 10)
restoreButton.BackgroundColor3 = currentThemeColor
restoreButton.Text = "X"
restoreButton.Font = Enum.Font.GothamBold
restoreButton.TextSize = 20
restoreButton.TextColor3 = Color3.new(1, 1, 1)
restoreButton.Visible = false
restoreButton.Parent = screenGui


local restoreDragging = false
local restoreDragStart
local restoreStartPos
local restoreWasDragged = false


restoreButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        restoreDragging = true
        restoreWasDragged = false
        restoreDragStart = input.Position
        restoreStartPos = restoreButton.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                restoreDragging = false
                -- if the button was dragged, also reopen the hub when the drag ends
                if restoreWasDragged then
                    showHub()
                end
            end
        end)
    end
end)


UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if restoreDragging then
            local delta = input.Position - restoreDragStart
            -- consider it a drag once we've moved a little bit
            if math.abs(delta.X) > 2 or math.abs(delta.Y) > 2 then
                restoreWasDragged = true
            end
            restoreButton.Position = UDim2.new(
                restoreStartPos.X.Scale,
                restoreStartPos.X.Offset + delta.X,
                restoreStartPos.Y.Scale,
                restoreStartPos.Y.Offset + delta.Y
            )
        end
    end
end)


local function hideHub()
    mainFrame.Visible = false
    restoreButton.Visible = true
end


local function showHub()
    mainFrame.Visible = true
    restoreButton.Visible = false
end


minimizeButton.MouseButton1Click:Connect(hideHub)
restoreButton.MouseButton1Click:Connect(showHub)


local function showPage(pageName)
    mainPage.Visible = (pageName == "Main")
    miscPage.Visible = (pageName == "Misc")
    settingsPage.Visible = (pageName == "Settings")
end


mainTabButton.MouseButton1Click:Connect(function()
    showPage("Main")
end)


miscTabButton.MouseButton1Click:Connect(function()
    showPage("Misc")
end)


settingsTabButton.MouseButton1Click:Connect(function()
    showPage("Settings")
end)


showPage("Main")


local toggleIndicators = {} -- now stores per-button keybind TextBoxes
local buttonKeybinds = {}
local buttonClickHistory = {}
local buttonUpdateFunctions = {}
local buttonActions = {}


local function setButtonState(button, isActive)
    button.BackgroundColor3 = isActive and Color3.fromRGB(0, 255, 0) or currentThemeColor
end


local function refreshButtonLabel(button)
    local updater = buttonUpdateFunctions[button]
    if updater then
        updater()
    end
end


function setButtonKeybind(button, keyCode)
    buttonKeybinds[button] = keyCode
    if button and button.Name and savedConfig and savedConfig.keybinds then
        local key = button.Name
        if keyCode then
            local name = keyCode.Name or tostring(keyCode)
            savedConfig.keybinds[key] = name
        else
            savedConfig.keybinds[key] = nil
        end
        saveConfig()
    end
    -- keep the TextBox in sync with the stored keybind
    local keyBox = toggleIndicators[button]
    if keyBox and keyBox:IsA("TextBox") then
        if keyCode then
            keyBox.Text = keyCode.Name or tostring(keyCode)
        else
            keyBox.Text = ""
        end
    end
    refreshButtonLabel(button)
end


local function recordButtonClick(button)
    local now = tick()
    local history = buttonClickHistory[button]
    if not history then
        history = {}
        buttonClickHistory[button] = history
    end


    table.insert(history, now)
    if #history > 3 then
        table.remove(history, 1)
    end


    if #history == 3 and (history[3] - history[1]) <= 2.5 then
        buttonClickHistory[button] = {}
        setButtonKeybind(button, nil)
        if keybindTargetButton == button then
            keybindTargetButton = nil
        end
    end
end


local function attachIndicatorLabel(button)
    -- now creates a small TextBox on each button for keybind input
    if isMobile then return end
    if toggleIndicators[button] then return end


    local box = Instance.new("TextBox")
    box.Name = "KeyBox"
    box.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    box.BackgroundTransparency = 0.3
    -- small square on the far left edge of the button
    box.Size = UDim2.new(0, 18, 0, 18)
    box.Position = UDim2.new(0, 4, 0.5, -9)


    box.Font = button.Font
    box.TextSize = button.TextSize
    box.TextColor3 = button.TextColor3
    box.ClearTextOnFocus = false
    box.TextXAlignment = Enum.TextXAlignment.Center
    box.TextYAlignment = Enum.TextYAlignment.Center
    box.Text = ""

    box.Parent = button


    -- double-click the box quickly to reset the keybind
    local lastClick = 0
    box.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local now = tick()
            if now - lastClick <= 0.35 then
                lastClick = 0
                box.Text = ""
                setButtonKeybind(button, nil)
            else
                lastClick = now
            end
        end
    end)

    box.FocusLost:Connect(function()
        local text = box.Text or ""
        -- use only the first word and only letters (no numbers/symbols)
        local word = string.match(text, "^%s*([A-Za-z]+)%s*") or ""

        if word == "" then
            setButtonKeybind(button, nil)
            return
        end

        -- For single-letter keys (e.g. "f") use upper-case so it matches
        -- Enum.KeyCode.F. For multi-letter names (e.g. "LeftShift") keep
        -- the original casing so Enum.KeyCode lookup works.
        local lookup
        if #word == 1 then
            lookup = string.upper(word)
        else
            lookup = word
        end

        local keyCode = Enum.KeyCode[lookup]
        if keyCode then
            setButtonKeybind(button, keyCode)
        else
            -- invalid name, clear
            setButtonKeybind(button, nil)
        end
    end)

    toggleIndicators[button] = box
end


local function wrapText(button, active, text)
    -- no more [] prefix; just set the main label text
    button.Text = text
end


local keybindModeEnabled = false
local keybindTargetButton
local keybindPromptFrame
local keybindMainLabel
local keybindSubLabel
local keybindInputConnection


local function ensureKeybindPrompt()
    if keybindPromptFrame then return end


    keybindPromptFrame = Instance.new("Frame")
    keybindPromptFrame.Name = "KeybindPrompt"
    keybindPromptFrame.Size = UDim2.new(0, 380, 0, 40)
    keybindPromptFrame.Position = UDim2.new(0.5, -190, 0, -40)
    keybindPromptFrame.BackgroundTransparency = 1
    keybindPromptFrame.Parent = screenGui


    keybindMainLabel = Instance.new("TextLabel")
    keybindMainLabel.BackgroundTransparency = 1
    keybindMainLabel.Size = UDim2.new(1, 0, 0, 20)
    keybindMainLabel.Position = UDim2.new(0, 0, 0, 0)
    keybindMainLabel.Font = Enum.Font.GothamSemibold
    keybindMainLabel.TextSize = 16
    keybindMainLabel.TextColor3 = Color3.new(1, 1, 1)
    keybindMainLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    keybindMainLabel.TextStrokeTransparency = 0
    keybindMainLabel.Text = "click a button and press a word on your keyboard."
    keybindMainLabel.TextXAlignment = Enum.TextXAlignment.Center
    keybindMainLabel.TextYAlignment = Enum.TextYAlignment.Center
    keybindMainLabel.Parent = keybindPromptFrame


    keybindSubLabel = Instance.new("TextLabel")
    keybindSubLabel.BackgroundTransparency = 1
    keybindSubLabel.Size = UDim2.new(1, 0, 0, 18)
    keybindSubLabel.Position = UDim2.new(0, 0, 0, 20)
    keybindSubLabel.Font = Enum.Font.Gotham
    keybindSubLabel.TextSize = 14
    keybindSubLabel.TextColor3 = Color3.new(1, 1, 1)
    keybindSubLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    keybindSubLabel.TextStrokeTransparency = 0
    keybindSubLabel.Text = "click the same button 3 times to reset it"
    keybindSubLabel.TextXAlignment = Enum.TextXAlignment.Center
    keybindSubLabel.TextYAlignment = Enum.TextYAlignment.Center
    keybindSubLabel.Parent = keybindPromptFrame


    keybindPromptFrame.Visible = false
end


local function fadeOutKeybindPrompt()
    if not keybindPromptFrame or not keybindPromptFrame.Visible then return end


    task.spawn(function()
        for i = 0, 10 do
            local t = i / 10
            if keybindMainLabel then
                keybindMainLabel.TextTransparency = t
                keybindMainLabel.TextStrokeTransparency = t
            end
            if keybindSubLabel then
                keybindSubLabel.TextTransparency = t
                keybindSubLabel.TextStrokeTransparency = t
            end
            task.wait(0.03)
        end
        if keybindPromptFrame then
            keybindPromptFrame.Visible = false
        end
    end)
end


local function showKeybindPrompt()
    ensureKeybindPrompt()
    keybindPromptFrame.Visible = true
    keybindMainLabel.TextTransparency = 0
    keybindMainLabel.TextStrokeTransparency = 0
    keybindSubLabel.TextTransparency = 0
    keybindSubLabel.TextStrokeTransparency = 0
    keybindPromptFrame.Position = UDim2.new(0.5, -190, 0, -40)


    task.spawn(function()
        for i = 0, 10 do
            local t = i / 10
            local y = -40 + (50 * t)
            if keybindPromptFrame then
                keybindPromptFrame.Position = UDim2.new(0.5, -190, 0, y)
            end
            task.wait(0.03)
        end
    end)
end


local function setKeybindMode(enabled)
    if keybindModeEnabled == enabled then return end
    keybindModeEnabled = enabled
    keybindTargetButton = nil
    if enabled then
        showKeybindPrompt()
    else
        fadeOutKeybindPrompt()
    end
end


keybindInputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType ~= Enum.UserInputType.Keyboard then
        return
    end


    local keyCode = input.KeyCode
    if keyCode == Enum.KeyCode.Unknown then
        return
    end


    -- While in keybind setup mode, always capture the key and do NOT
    -- trigger any existing hotkeys.
    if keybindModeEnabled then
        if keybindTargetButton then
            setButtonKeybind(keybindTargetButton, keyCode)
            setKeybindMode(false)
        end
        return
    end


    -- Outside of keybind mode, ignore inputs Roblox already processed
    -- (e.g. chat) to avoid conflicts.
    if gameProcessed then return end


    for button, boundKey in pairs(buttonKeybinds) do
        if boundKey == keyCode then
            -- Extra safety: only trigger if this button still has
            -- a key stored in the config. If the keybind was reset
            -- (removed from savedConfig.keybinds), ignore this.
            local isStillBound = true
            if savedConfig and savedConfig.keybinds then
                local stored = savedConfig.keybinds[button.Name]
                if stored == nil then
                    isStillBound = false
                end
            end


            if isStillBound then
                local action = buttonActions[button]
                if action then
                    withCooldown("keybind_" .. tostring(button), function()
                        action()
                    end, 0.15)
                end
            end
        end
    end
end)


local noAnimationsEnabled = false
local noAnimJoints = {}
local noAnimJointConnection


-- No animations button (main page)
local rawrButton = Instance.new("TextButton")
rawrButton.Name = "NoAnimationsButton"
rawrButton.Size = UDim2.new(0, 180, 0, 32)
rawrButton.Position = UDim2.new(0, 10, 0, 10)
rawrButton.BackgroundColor3 = currentThemeColor
rawrButton.Text = "No animations"
rawrButton.Font = Enum.Font.GothamBold
rawrButton.TextSize = 14
rawrButton.TextColor3 = Color3.new(1, 1, 1)
rawrButton.TextXAlignment = Enum.TextXAlignment.Center
rawrButton.Parent = mainPage


attachIndicatorLabel(rawrButton)


local function updateNoAnimationsText()
	wrapText(rawrButton, noAnimationsEnabled, "No animations")
	setButtonState(rawrButton, noAnimationsEnabled)
end


local function setCharacterAnimationsEnabled(char, enabled)
    if not char then return end
    local animate = char:FindFirstChild("Animate")
    if animate then
        animate.Disabled = not enabled
    end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if animator then
            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                if enabled then
                    track:Play()
                else
                    track:Stop()
                end
            end
        end
    end
end


local function cacheNoAnimJoints(char)
    table.clear(noAnimJoints)
    if not char then return end


    for _, inst in ipairs(char:GetDescendants()) do
        if inst:IsA("Motor6D") then
            table.insert(noAnimJoints, {
                joint = inst,
                C0 = inst.C0,
                C1 = inst.C1
            })
        end
    end
end


local function startNoAnimJointLock()
    if noAnimJointConnection then
        noAnimJointConnection:Disconnect()
        noAnimJointConnection = nil
    end


    noAnimJointConnection = RunService.RenderStepped:Connect(function()
        if not noAnimationsEnabled then return end


        for _, data in ipairs(noAnimJoints) do
            local joint = data.joint
            if joint and joint.Parent then
                if joint.C0 ~= data.C0 then
                    joint.C0 = data.C0
                end
                if joint.C1 ~= data.C1 then
                    joint.C1 = data.C1
                end
            end
        end
    end)
end


local function stopNoAnimJointLock()
    if noAnimJointConnection then
        noAnimJointConnection:Disconnect()
        noAnimJointConnection = nil
    end
end


local function applyNoAnimationsState()
    if noAnimationsEnabled then
        cacheNoAnimJoints(character)
        setCharacterAnimationsEnabled(character, false)
        startNoAnimJointLock()
    else
        stopNoAnimJointLock()
        setCharacterAnimationsEnabled(character, true)
    end
end


local function toggleNoAnimations()
	noAnimationsEnabled = not noAnimationsEnabled
	applyNoAnimationsState()
	updateNoAnimationsText()
end


rawrButton.MouseButton1Click:Connect(function()
    recordButtonClick(rawrButton)
    if keybindModeEnabled then
        keybindTargetButton = rawrButton
        return
    end


    withCooldown("noAnimations", function()
        toggleNoAnimations()
    end)
end)


buttonUpdateFunctions[rawrButton] = updateNoAnimationsText
buttonActions[rawrButton] = toggleNoAnimations
applySavedKeybindToButton(rawrButton)


local autoBlockButton = Instance.new("TextButton")
autoBlockButton.Name = "AutoBlockButton"
autoBlockButton.Size = UDim2.new(0, 180, 0, 32)
autoBlockButton.Position = UDim2.new(0, 10, 0, 52)
autoBlockButton.BackgroundColor3 = currentThemeColor
autoBlockButton.Text = "Auto block"
autoBlockButton.Font = Enum.Font.GothamBold
autoBlockButton.TextSize = 14
autoBlockButton.TextColor3 = Color3.new(1, 1, 1)
autoBlockButton.TextXAlignment = Enum.TextXAlignment.Center
autoBlockButton.Parent = mainPage


attachIndicatorLabel(autoBlockButton)


local function updateAutoBlockText()
    -- Auto block is a one-shot action, not a toggle, so we always
    -- show it as OFF (no checkmark).
    wrapText(autoBlockButton, false, "Auto block")
    setButtonState(autoBlockButton, false)
end


local function getNearestPlayerForBlock()
    local myChar = character
    if not myChar then return nil end

    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        or myChar:FindFirstChild("Torso")
        or myChar:FindFirstChild("UpperTorso")
    if not myRoot then return nil end

    local nearestPlayer
    local nearestDist
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local root = plr.Character:FindFirstChild("HumanoidRootPart")
                or plr.Character:FindFirstChild("Torso")
                or plr.Character:FindFirstChild("UpperTorso")
            if root then
                local dist = (root.Position - myRoot.Position).Magnitude
                if not nearestDist or dist < nearestDist then
                    nearestDist = dist
                    nearestPlayer = plr
                end
            end
        end
    end

    -- Fallback: if we couldn't get a distance (e.g. no roots), just
    -- pick any other player in the server.
    if not nearestPlayer then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player then
                nearestPlayer = plr
                break
            end
        end
    end

    return nearestPlayer
end


local function toggleAutoBlock()
    -- Just open Roblox's built-in "Block <player>?" prompt for the
    -- nearest other player.
    local target = getNearestPlayerForBlock()
    if not target then return end

    pcall(function()
        if StarterGui and StarterGui.SetCore then
            StarterGui:SetCore("PromptBlockPlayer", target)
        end
    end)
end


autoBlockButton.MouseButton1Click:Connect(function()
    recordButtonClick(autoBlockButton)
    if keybindModeEnabled then
        keybindTargetButton = autoBlockButton
        return
    end

    withCooldown("autoBlock", function()
        toggleAutoBlock()
    end)
end)


buttonUpdateFunctions[autoBlockButton] = updateAutoBlockText
buttonActions[autoBlockButton] = toggleAutoBlock
applySavedKeybindToButton(autoBlockButton)


local jumpHopButton = Instance.new("TextButton")
jumpHopButton.Name = "JumpHopButton"

jumpHopButton.Size = UDim2.new(0, 180, 0, 32)
jumpHopButton.Position = UDim2.new(0, 10, 0, 94)
jumpHopButton.BackgroundColor3 = currentThemeColor
jumpHopButton.Text = "Jump Hop"
jumpHopButton.Font = Enum.Font.GothamSemibold
jumpHopButton.TextSize = 14
jumpHopButton.TextColor3 = Color3.new(1, 1, 1)
jumpHopButton.TextXAlignment = Enum.TextXAlignment.Center
jumpHopButton.Parent = mainPage


attachIndicatorLabel(jumpHopButton)


local jumpHopEnabled = false
local jumpHopReady = false
local jumpHopConnection
local jumpHopInputConnection
local JUMP_HOP_VELOCITY = 48
local hopCount = 0
local MAX_HOPS = 6


local function updateJumpHopText()
    wrapText(jumpHopButton, jumpHopEnabled, "Jump Hop")
    setButtonState(jumpHopButton, jumpHopEnabled)
end


local function startJumpHop()
    if jumpHopConnection then
        jumpHopConnection:Disconnect()
        jumpHopConnection = nil
    end

    if jumpHopInputConnection then
        jumpHopInputConnection:Disconnect()
        jumpHopInputConnection = nil
    end

    jumpHopConnection = RunService.Heartbeat:Connect(function()
        if not character then
            return
        end

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not rootPart then
            return
        end

        local isOnGround = humanoid.FloorMaterial ~= Enum.Material.Air
        local falling = rootPart.Velocity.Y < -1

        if isOnGround then
            hopCount = 0
            jumpHopReady = false
            return
        end

        if falling and hopCount < MAX_HOPS then
            jumpHopReady = true
        end
    end)

    jumpHopInputConnection = UserInputService.JumpRequest:Connect(function()
        if not jumpHopEnabled then
            return
        end

        if jumpHopReady and hopCount < MAX_HOPS then
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.Velocity = Vector3.new(rootPart.Velocity.X, JUMP_HOP_VELOCITY, rootPart.Velocity.Z)
                jumpHopReady = false
                hopCount = hopCount + 1
            end
        end
    end)
end


local function stopJumpHop()
    if jumpHopConnection then
        jumpHopConnection:Disconnect()
        jumpHopConnection = nil
    end

    if jumpHopInputConnection then
        jumpHopInputConnection:Disconnect()
        jumpHopInputConnection = nil
    end

    jumpHopReady = false
end


local function toggleJumpHop()
    jumpHopEnabled = not jumpHopEnabled
    if jumpHopEnabled then
        startJumpHop()
    else
        stopJumpHop()
    end
    updateJumpHopText()
end


jumpHopButton.MouseButton1Click:Connect(function()
    recordButtonClick(jumpHopButton)
    if keybindModeEnabled then
        keybindTargetButton = jumpHopButton
        return
    end

    withCooldown("jumpHop", function()
        toggleJumpHop()
    end)
end)


buttonUpdateFunctions[jumpHopButton] = updateJumpHopText
buttonActions[jumpHopButton] = toggleJumpHop
applySavedKeybindToButton(jumpHopButton)


local speedIncreaseButton = Instance.new("TextButton")
speedIncreaseButton.Name = "SpeedIncreaseButton"
speedIncreaseButton.Size = UDim2.new(0, 180, 0, 32)
speedIncreaseButton.Position = UDim2.new(0, 10, 0, 136)
speedIncreaseButton.BackgroundColor3 = currentThemeColor
speedIncreaseButton.Text = "Speed increase"
speedIncreaseButton.Font = Enum.Font.GothamSemibold
speedIncreaseButton.TextSize = 14
speedIncreaseButton.TextColor3 = Color3.new(1, 1, 1)
speedIncreaseButton.TextXAlignment = Enum.TextXAlignment.Center
speedIncreaseButton.Parent = mainPage


attachIndicatorLabel(speedIncreaseButton)


local speedToggled = false
local speedConnection
local speedWalkConnection
local originalWalkSpeed = 16
local speedMultiplier = 1.25


local function updateSpeedText()
    wrapText(speedIncreaseButton, speedToggled, "Speed increase")
    setButtonState(speedIncreaseButton, speedToggled)
end


local function updateSpeed()
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    if speedToggled then
        -- Keep boosted speed locked to originalWalkSpeed * speedMultiplier
        local targetSpeed = originalWalkSpeed * speedMultiplier
        if math.abs(humanoid.WalkSpeed - targetSpeed) > 0.5 then
            humanoid.WalkSpeed = targetSpeed
        end
    else
        -- When disabled, ensure we are at the original (saved) walk speed
        if math.abs(humanoid.WalkSpeed - originalWalkSpeed) > 0.5 then
            humanoid.WalkSpeed = originalWalkSpeed
        end
    end
end


local function startSpeedLoop()
    if speedConnection then
        speedConnection:Disconnect()
    end
    speedConnection = RunService.Heartbeat:Connect(updateSpeed)

    -- Also react whenever something else changes WalkSpeed
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if speedWalkConnection then
                speedWalkConnection:Disconnect()
                speedWalkConnection = nil
            end
            speedWalkConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                if speedToggled then
                    updateSpeed()
                end
            end)
        end
    end
end


local function stopSpeedLoop()
    if speedConnection then
        speedConnection:Disconnect()
        speedConnection = nil
    end
    if speedWalkConnection then
        speedWalkConnection:Disconnect()
        speedWalkConnection = nil
    end
end


local function toggleSpeedIncrease()
    speedToggled = not speedToggled
    setButtonState(speedIncreaseButton, speedToggled)

    if speedToggled then
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            originalWalkSpeed = humanoid.WalkSpeed
        end
        updateSpeed()
        startSpeedLoop()
    else
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = originalWalkSpeed
        end
        stopSpeedLoop()
    end

    updateSpeedText()
end


speedIncreaseButton.MouseButton1Click:Connect(function()
    recordButtonClick(speedIncreaseButton)
    if keybindModeEnabled then
        keybindTargetButton = speedIncreaseButton
        return
    end

    withCooldown("speed", function()
        toggleSpeedIncrease()
    end)
end)


buttonUpdateFunctions[speedIncreaseButton] = updateSpeedText
buttonActions[speedIncreaseButton] = toggleSpeedIncrease
applySavedKeybindToButton(speedIncreaseButton)


updateSpeedText()


local instantPickupButton = Instance.new("TextButton")
instantPickupButton.Name = "InstantPickupButton"
instantPickupButton.Size = UDim2.new(0, 160, 0, 32)
instantPickupButton.Position = UDim2.new(0, 210, 0, 10)
instantPickupButton.BackgroundColor3 = currentThemeColor
instantPickupButton.Text = "Auto Grab"
instantPickupButton.Font = Enum.Font.GothamSemibold
instantPickupButton.TextSize = 14
instantPickupButton.TextColor3 = Color3.new(1, 1, 1)
instantPickupButton.TextXAlignment = Enum.TextXAlignment.Center
instantPickupButton.Parent = mainPage


attachIndicatorLabel(instantPickupButton)


local autoPickupEnabled = false
local autoPromptConnection


local function updateAutoPickupText()
    wrapText(instantPickupButton, autoPickupEnabled, "Auto Grab")
    setButtonState(instantPickupButton, autoPickupEnabled)
end


local function onPromptShown(prompt, inputType)
    if not autoPickupEnabled then return end
    if not prompt or not prompt.Parent or not prompt.Enabled then return end


    -- Only auto-pickup prompts that use the E key, to match "hold E" behavior
    if prompt.KeyboardKeyCode ~= Enum.KeyCode.E then return end


    local duration = prompt.HoldDuration or 0
    -- Only handle prompts that actually require holding; skip instant (0 sec) prompts
    if duration <= 0 then
        return
    end


    task.spawn(function()
        pcall(function()
            prompt:InputHoldBegin()
            task.delay(duration + 0.05, function()
                if autoPickupEnabled and prompt and prompt.Parent and prompt.Enabled then
                    prompt:InputHoldEnd()
                end
            end)
        end)
    end)
end


local function startAutoPickup()
    if autoPromptConnection then
        autoPromptConnection:Disconnect()
        autoPromptConnection = nil
    end
    autoPromptConnection = ProximityPromptService.PromptShown:Connect(onPromptShown)
end


local function stopAutoPickup()
    if autoPromptConnection then
        autoPromptConnection:Disconnect()
        autoPromptConnection = nil
    end
end


local function toggleAutoPickup()
    autoPickupEnabled = not autoPickupEnabled
    if autoPickupEnabled then
        startAutoPickup()
    else
        stopAutoPickup()
    end
    updateAutoPickupText()
end


instantPickupButton.MouseButton1Click:Connect(function()
    recordButtonClick(instantPickupButton)
    if keybindModeEnabled then
        keybindTargetButton = instantPickupButton
        return
    end


    withCooldown("autoPickup", function()
        toggleAutoPickup()
    end)
end)


buttonUpdateFunctions[instantPickupButton] = updateAutoPickupText
buttonActions[instantPickupButton] = toggleAutoPickup
applySavedKeybindToButton(instantPickupButton)


updateAutoPickupText()


local moreFpsButton = Instance.new("TextButton")
moreFpsButton.Name = "MoreFpsButton"
moreFpsButton.Size = UDim2.new(0, 160, 0, 32)
moreFpsButton.Position = UDim2.new(0, 210, 0, 52)
moreFpsButton.BackgroundColor3 = currentThemeColor
moreFpsButton.Text = "More FPS"
moreFpsButton.Font = Enum.Font.GothamSemibold
moreFpsButton.TextSize = 14
moreFpsButton.TextColor3 = Color3.new(1, 1, 1)
moreFpsButton.TextXAlignment = Enum.TextXAlignment.Center
moreFpsButton.Parent = mainPage


attachIndicatorLabel(moreFpsButton)


local moreFpsEnabled = false
local savedLightingProps = {}
local moreFpsDisabledEffects = {}


local function applyMoreFps()
    local lighting = game:GetService("Lighting")
    if not lighting then return end


    if not next(savedLightingProps) then
        savedLightingProps.GlobalShadows = lighting.GlobalShadows
        savedLightingProps.Brightness = lighting.Brightness
        savedLightingProps.EnvironmentDiffuseScale = lighting.EnvironmentDiffuseScale
        savedLightingProps.EnvironmentSpecularScale = lighting.EnvironmentSpecularScale
    end


    lighting.GlobalShadows = false
    lighting.Brightness = math.min(lighting.Brightness, 2)
    lighting.EnvironmentDiffuseScale = 0
    lighting.EnvironmentSpecularScale = 0


    for _, inst in ipairs(lighting:GetDescendants()) do
        if inst:IsA("BloomEffect") or inst:IsA("ColorCorrectionEffect")
            or inst:IsA("DepthOfFieldEffect") or inst:IsA("SunRaysEffect")
            or inst:IsA("BlurEffect") then
            if moreFpsDisabledEffects[inst] == nil then
                moreFpsDisabledEffects[inst] = inst.Enabled
            end
            inst.Enabled = false
        end
    end
end


local function restoreMoreFps()
    local lighting = game:GetService("Lighting")
    if lighting and next(savedLightingProps) then
        lighting.GlobalShadows = savedLightingProps.GlobalShadows
        lighting.Brightness = savedLightingProps.Brightness
        lighting.EnvironmentDiffuseScale = savedLightingProps.EnvironmentDiffuseScale
        lighting.EnvironmentSpecularScale = savedLightingProps.EnvironmentSpecularScale
    end


    for inst, wasEnabled in pairs(moreFpsDisabledEffects) do
        if inst and inst.Parent then
            inst.Enabled = wasEnabled
        end
    end
end


local function updateMoreFpsText()
    wrapText(moreFpsButton, moreFpsEnabled, "More FPS")
    setButtonState(moreFpsButton, moreFpsEnabled)
end


local function toggleMoreFps()
    moreFpsEnabled = not moreFpsEnabled
    if moreFpsEnabled then
        applyMoreFps()
    else
        restoreMoreFps()
    end
    updateMoreFpsText()
end


moreFpsButton.MouseButton1Click:Connect(function()
    recordButtonClick(moreFpsButton)
    if keybindModeEnabled then
        keybindTargetButton = moreFpsButton
        return
    end


    withCooldown("moreFps", function()
        toggleMoreFps()
    end)
end)


buttonUpdateFunctions[moreFpsButton] = updateMoreFpsText
buttonActions[moreFpsButton] = toggleMoreFps
applySavedKeybindToButton(moreFpsButton)


updateMoreFpsText()


local showPlayersButton = Instance.new("TextButton")
showPlayersButton.Name = "ShowPlayersButton"
showPlayersButton.Size = UDim2.new(0, 180, 0, 32)
showPlayersButton.Position = UDim2.new(0, 10, 0, 10)
showPlayersButton.BackgroundColor3 = currentThemeColor
showPlayersButton.Text = "Show Players"
showPlayersButton.Font = Enum.Font.GothamBold
showPlayersButton.TextSize = 14
showPlayersButton.TextColor3 = Color3.new(1, 1, 1)
showPlayersButton.TextXAlignment = Enum.TextXAlignment.Center
showPlayersButton.Parent = miscPage


attachIndicatorLabel(showPlayersButton)


local xrayButton = Instance.new("TextButton")
xrayButton.Name = "XrayButton"
xrayButton.Size = UDim2.new(0, 160, 0, 32)
xrayButton.Position = UDim2.new(0, 210, 0, 10)
xrayButton.BackgroundColor3 = currentThemeColor
xrayButton.Text = "X-ray"
xrayButton.Font = Enum.Font.GothamBold
xrayButton.TextSize = 14
xrayButton.TextColor3 = Color3.new(1, 1, 1)
xrayButton.TextXAlignment = Enum.TextXAlignment.Center
xrayButton.Parent = miscPage


attachIndicatorLabel(xrayButton)


local brainrotEspButton = Instance.new("TextButton")
brainrotEspButton.Name = "BrainrotESPButton"
brainrotEspButton.Size = UDim2.new(0, 180, 0, 32)
brainrotEspButton.Position = UDim2.new(0, 10, 0, 52)
brainrotEspButton.BackgroundColor3 = currentThemeColor
brainrotEspButton.Text = "Brainrot ESP"
brainrotEspButton.Font = Enum.Font.GothamBold
brainrotEspButton.TextSize = 14
brainrotEspButton.TextColor3 = Color3.new(1, 1, 1)
brainrotEspButton.TextXAlignment = Enum.TextXAlignment.Center
brainrotEspButton.Parent = miscPage


attachIndicatorLabel(brainrotEspButton)


local invisibleWallsButton = Instance.new("TextButton")
invisibleWallsButton.Name = "InvisibleWallsButton"
invisibleWallsButton.Size = UDim2.new(0, 180, 0, 32)
invisibleWallsButton.Position = UDim2.new(0, 10, 0, 94)
invisibleWallsButton.BackgroundColor3 = currentThemeColor
invisibleWallsButton.Text = "Invisible walls"
invisibleWallsButton.Font = Enum.Font.GothamBold
invisibleWallsButton.TextSize = 14
invisibleWallsButton.TextColor3 = Color3.new(1, 1, 1)
invisibleWallsButton.TextXAlignment = Enum.TextXAlignment.Center
invisibleWallsButton.Parent = miscPage

attachIndicatorLabel(invisibleWallsButton)


local lagServerButton = Instance.new("TextButton")
lagServerButton.Name = "LagServerButton"
lagServerButton.Size = UDim2.new(0, 180, 0, 32)
lagServerButton.Position = UDim2.new(0, 10, 0, 136)
lagServerButton.BackgroundColor3 = currentThemeColor
lagServerButton.Text = "Lag server"
lagServerButton.Font = Enum.Font.GothamBold
lagServerButton.TextSize = 14
lagServerButton.TextColor3 = Color3.new(1, 1, 1)
lagServerButton.TextXAlignment = Enum.TextXAlignment.Center
lagServerButton.Parent = miscPage


attachIndicatorLabel(lagServerButton)


-- SETTINGS PAGE UI
local changeThemeButton = Instance.new("TextButton")
changeThemeButton.Name = "ChangeThemeButton"
changeThemeButton.Size = UDim2.new(0, 180, 0, 32)
changeThemeButton.Position = UDim2.new(0, 10, 0, 10)
changeThemeButton.BackgroundColor3 = currentThemeColor
changeThemeButton.Text = "Change Theme Color"
changeThemeButton.Font = Enum.Font.GothamBold
changeThemeButton.TextSize = 14
changeThemeButton.TextColor3 = Color3.new(1, 1, 1)
changeThemeButton.Parent = settingsPage


local dropdownFrame = Instance.new("ScrollingFrame")
dropdownFrame.Name = "ThemeDropdown"
dropdownFrame.Size = UDim2.new(0, 180, 0, 4 + 4 * 26)
dropdownFrame.Position = UDim2.new(0, 10, 0, 48)
dropdownFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
dropdownFrame.BorderSizePixel = 0
dropdownFrame.Visible = false
dropdownFrame.CanvasSize = UDim2.new(0, 0, 0, 4 + 4 * 26)
dropdownFrame.ScrollBarThickness = 5
dropdownFrame.ScrollBarImageColor3 = Color3.fromRGB(200, 200, 200)
dropdownFrame.Parent = settingsPage


local themeButtons = {}
local themeIndex = 0
for name, color in pairs(themes) do
	themeIndex = themeIndex + 1
	local btn = Instance.new("TextButton")
	btn.Name = name .. "ThemeButton"
	btn.Size = UDim2.new(1, -8, 0, 24)
	btn.Position = UDim2.new(0, 4, 0, 2 + (themeIndex - 1) * 26)
	btn.BackgroundColor3 = color
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Parent = dropdownFrame
	themeButtons[name] = btn
end


dropdownFrame.CanvasSize = UDim2.new(0, 0, 0, 4 + themeIndex * 26)


local copyDiscordButton = Instance.new("TextButton")
copyDiscordButton.Name = "CopyDiscordButton"
copyDiscordButton.Size = UDim2.new(0, 180, 0, 32)
copyDiscordButton.Position = UDim2.new(0, 10, 0, 48)
copyDiscordButton.BackgroundColor3 = currentThemeColor
copyDiscordButton.Text = "Copy Discord link"
copyDiscordButton.Font = Enum.Font.GothamBold
copyDiscordButton.TextSize = 14
copyDiscordButton.TextColor3 = Color3.new(1, 1, 1)
copyDiscordButton.Parent = settingsPage


local autoKickButton = Instance.new("TextButton")
autoKickButton.Name = "AutoKickButton"
autoKickButton.Size = UDim2.new(0, 180, 0, 32)
autoKickButton.Position = UDim2.new(0, 200, 0, 10)
autoKickButton.BackgroundColor3 = currentThemeColor
autoKickButton.Text = "Auto kick after steal"
autoKickButton.Font = Enum.Font.GothamBold
autoKickButton.TextSize = 14
autoKickButton.TextColor3 = Color3.new(1, 1, 1)
autoKickButton.TextXAlignment = Enum.TextXAlignment.Center
autoKickButton.Parent = settingsPage


local keybindModeButton = Instance.new("TextButton")
keybindModeButton.Name = "KeybindModeButton"
keybindModeButton.Size = UDim2.new(0, 200, 0, 32)
keybindModeButton.Position = UDim2.new(0, 10, 0, 132)
keybindModeButton.BackgroundColor3 = currentThemeColor
keybindModeButton.Text = "Add keybind to button"
keybindModeButton.Font = Enum.Font.GothamBold
keybindModeButton.TextSize = 14
keybindModeButton.TextColor3 = Color3.new(1, 1, 1)
keybindModeButton.TextXAlignment = Enum.TextXAlignment.Center
keybindModeButton.Parent = settingsPage


-- keybind mode button is deprecated; keep it hidden on all platforms
keybindModeButton.Visible = false
keybindModeButton.Active = false


local showPlayersEnabled = false
local invisibleWallsEnabled = false
local lagServerEnabled = false
local playerHighlightData = {}
local playerCharacterConnections = {}
local playersAddedConnection
local playersRemovingConnection


local invisibleWallParts = {}


local brainrotBillboard
local brainrotEspEnabled = false


local xrayEnabled = false
local xrayConnection
local xrayFromAttachment
local xrayBrainrotAttachment
local xrayNicknameAttachment
local xrayBrainrotBeam
local xrayNicknameBeam


local function clearXrayVisuals()
    if xrayConnection then
        xrayConnection:Disconnect()
        xrayConnection = nil
    end
    if xrayBrainrotBeam then
        xrayBrainrotBeam:Destroy()
        xrayBrainrotBeam = nil
    end
    if xrayNicknameBeam then
        xrayNicknameBeam:Destroy()
        xrayNicknameBeam = nil
    end
    if xrayFromAttachment then
        xrayFromAttachment:Destroy()
        xrayFromAttachment = nil
    end
    if xrayBrainrotAttachment then
        xrayBrainrotAttachment:Destroy()
        xrayBrainrotAttachment = nil
    end
    if xrayNicknameAttachment then
        xrayNicknameAttachment:Destroy()
        xrayNicknameAttachment = nil
    end
end


local function updateXrayText()
    wrapText(xrayButton, xrayEnabled, "X-ray")
    setButtonState(xrayButton, xrayEnabled)
end


local function startXray()
    clearXrayVisuals()


    -- Inline search for the highest brainrot source so we don't depend on
    -- any external function reference when X-ray runs.
    local bestGui = nil
    local bestValue = nil
    local inspected = 0
    for _, inst in ipairs(workspace:GetDescendants()) do
        if inst:IsA("TextLabel") or inst:IsA("TextBox") then
            local label = inst
            local text = label.Text
            if type(text) == "string" and text ~= "" and string.find(text, "M/s", 1, true) then
                local numStr = string.match(text, "%$?%s*([%d%.]+)%s*[Mm]/s")
                if numStr then
                    local value = tonumber(numStr)
                    if value then
                        local guiAncestor = label:FindFirstAncestorWhichIsA("BillboardGui")
                            or label:FindFirstAncestorWhichIsA("SurfaceGui")

                        if guiAncestor and (not bestValue or value > bestValue) then
                            bestValue = value
                            bestGui = guiAncestor
                        end
                    end
                end
            end
        end

        inspected = inspected + 1
        if inspected % 400 == 0 then
            task.wait()
        end
    end

    if not bestGui then
        return
    end

    local char = character
    if not char then
        return
    end
    local root = char:FindFirstChild("HumanoidRootPart")
        or char:FindFirstChild("Torso")
        or char:FindFirstChild("UpperTorso")
    if not root then
        return
    end


    local targetPart
    local adornee = bestGui.Adornee
    if adornee and adornee:IsA("BasePart") then
        targetPart = adornee
    else
        targetPart = bestGui:FindFirstAncestorWhichIsA("BasePart")
        if not targetPart then
            local model = bestGui:FindFirstAncestorWhichIsA("Model")
            if model then
                targetPart = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
            end
        end
    end
    if not targetPart then
        return
    end


    xrayFromAttachment = Instance.new("Attachment")
    xrayFromAttachment.Name = "XentXrayFromAttachment"
    xrayFromAttachment.Parent = root


    xrayBrainrotAttachment = Instance.new("Attachment")
    xrayBrainrotAttachment.Name = "XentXrayBrainrotAttachment"
    xrayBrainrotAttachment.Position = Vector3.new(-2, -5, 0)
    xrayBrainrotAttachment.Parent = targetPart


    local nicknameParent
    local myNameLower = string.lower(player.Name)
    local displayNameLower = string.lower(player.DisplayName or player.Name)
    for _, inst in ipairs(workspace:GetDescendants()) do
        if inst:IsA("SurfaceGui") or inst:IsA("BillboardGui") then
            for _, guiChild in ipairs(inst:GetDescendants()) do
                if guiChild:IsA("TextLabel") or guiChild:IsA("TextBox") then
                    local text = guiChild.Text
                    if type(text) == "string" and text ~= "" then
                        local lower = string.lower(text)
                        local hasBase = string.find(lower, "base", 1, true) ~= nil
                        local hasUserName = string.find(lower, myNameLower, 1, true) ~= nil
                        local hasDisplayName = string.find(lower, displayNameLower, 1, true) ~= nil
                        -- Look for any text that contains either the username or display name
                        -- plus the word "base" (e.g. "7euroo's Base").
                        if hasBase and (hasUserName or hasDisplayName) then
                            local parentPart = inst.Adornee or inst.Parent
                            if parentPart and parentPart:IsA("BasePart") then
                                nicknameParent = parentPart
                                break
                            end
                        end
                    end
                end
            end
        end
        if nicknameParent then
            break
        end
    end


    xrayNicknameAttachment = Instance.new("Attachment")
    xrayNicknameAttachment.Name = "XentXrayNicknameAttachment"
    xrayNicknameAttachment.Position = Vector3.new(0, -15, 0)
    xrayNicknameAttachment.Parent = nicknameParent or root


    xrayBrainrotBeam = Instance.new("Beam")
    xrayBrainrotBeam.Name = "XentXrayBrainrotBeam"
    xrayBrainrotBeam.Attachment0 = xrayFromAttachment
    xrayBrainrotBeam.Attachment1 = xrayBrainrotAttachment
    xrayBrainrotBeam.Color = ColorSequence.new(currentThemeColor)
    xrayBrainrotBeam.Width0 = 0.35
    xrayBrainrotBeam.Width1 = 0.35
    xrayBrainrotBeam.FaceCamera = true
    xrayBrainrotBeam.Transparency = NumberSequence.new(0.05)
    xrayBrainrotBeam.Parent = root


    xrayNicknameBeam = Instance.new("Beam")
    xrayNicknameBeam.Name = "XentXrayNicknameBeam"
    xrayNicknameBeam.Attachment0 = xrayFromAttachment
    xrayNicknameBeam.Attachment1 = xrayNicknameAttachment
    xrayNicknameBeam.Color = ColorSequence.new(currentThemeColor)
    xrayNicknameBeam.Width0 = 0.35
    xrayNicknameBeam.Width1 = 0.35
    xrayNicknameBeam.FaceCamera = true
    xrayNicknameBeam.Transparency = NumberSequence.new(0.05)
    xrayNicknameBeam.Parent = root


    xrayConnection = RunService.Heartbeat:Connect(function()
        if not xrayEnabled then
            clearXrayVisuals()
            return
        end


        -- Animate a rainbow color over time for both beams.
        local t = os.clock()
        local hue = (t * 0.3) % 1
        local color = Color3.fromHSV(hue, 1, 1)
        local seq = ColorSequence.new(color)

        if xrayBrainrotBeam then
            xrayBrainrotBeam.Color = seq
        end
        if xrayNicknameBeam then
            xrayNicknameBeam.Color = seq
        end
    end)
end


local function toggleXray()
    xrayEnabled = not xrayEnabled
    if xrayEnabled then
        startXray()
    else
        clearXrayVisuals()
    end
    updateXrayText()
end


local function clearBrainrotBillboard()
    if brainrotBillboard and brainrotBillboard.Parent then
        brainrotBillboard:Destroy()
    end
    brainrotBillboard = nil
end


local function findHighestBrainrotSource()
    local bestGui = nil
    local bestValue = nil
    local inspected = 0

    for _, inst in ipairs(workspace:GetDescendants()) do
        if inst:IsA("TextLabel") or inst:IsA("TextBox") then
            local label = inst
            local text = label.Text
            if type(text) == "string" and text ~= "" and string.find(text, "M/s", 1, true) then
                local numStr = string.match(text, "%$?%s*([%d%.]+)%s*[Mm]/s")
                if numStr then
                    local value = tonumber(numStr)
                    if value then
                        local guiAncestor = label:FindFirstAncestorWhichIsA("BillboardGui")
                            or label:FindFirstAncestorWhichIsA("SurfaceGui")

                        if guiAncestor and (not bestValue or value > bestValue) then
                            bestValue = value
                            bestGui = guiAncestor
                        end
                    end
                end
            end
        end

        inspected = inspected + 1
        if inspected % 400 == 0 then
            task.wait()
        end
    end

    return bestGui, bestValue
end


-- X-ray feature was added at user request.


local function getBrainrotNameFromGui(sourceGui)
    if not sourceGui then return nil end

    for _, inst in ipairs(sourceGui:GetDescendants()) do
        if inst:IsA("TextLabel") or inst:IsA("TextBox") then
            local text = inst.Text
            if type(text) == "string" and text ~= "" then
                if not string.find(text, "M/s", 1, true)
                    and not string.find(text, "%$", 1, true)
                    and string.find(text, "%a") then
                    return text
                end
            end
        end
    end

    return nil
end


local function createBrainrotBillboard(sourceGui, value)
    if not sourceGui then return end

    local adornee = sourceGui.Adornee
    local parentForNew

    if adornee then
        parentForNew = adornee
    else
        parentForNew = sourceGui.Parent
    end

    if not parentForNew then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "BrainrotESPBillboard"
    billboard.Size = UDim2.new(0, 140, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2.2, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = parentForNew


    local container = Instance.new("Frame")
    container.Name = "BrainrotESPContainer"
    container.BackgroundTransparency = 1
    container.Size = UDim2.new(1, 0, 1, 0)
    container.Parent = billboard


    local boxStroke = Instance.new("UIStroke")
    boxStroke.Thickness = 2
    boxStroke.Color = Color3.new(0, 0, 0)
    boxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    boxStroke.Parent = container


    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "BrainrotNameLabel"
    nameLabel.Size = UDim2.new(1, -8, 0.5, -2)
    nameLabel.Position = UDim2.new(0, 4, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = getBrainrotNameFromGui(sourceGui) or "?"
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextScaled = true
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Parent = container

    local moneyLabel = Instance.new("TextLabel")
    moneyLabel.Name = "BrainrotMoneyLabel"
    moneyLabel.Size = UDim2.new(1, -8, 0.5, -2)
    moneyLabel.Position = UDim2.new(0, 4, 0.5, 0)
    moneyLabel.BackgroundTransparency = 1
    moneyLabel.Text = string.format("$%sM/s", tostring(value or "?"))
    moneyLabel.Font = Enum.Font.GothamBold
    moneyLabel.TextScaled = true
    moneyLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    moneyLabel.Parent = container


    local divider = Instance.new("Frame")
    divider.Name = "BrainrotDivider"
    divider.BackgroundColor3 = Color3.new(0, 0, 0)
    divider.BorderSizePixel = 0
    divider.Size = UDim2.new(1, -8, 0, 1)
    divider.Position = UDim2.new(0, 4, 0.5, -1)
    divider.Parent = container


    brainrotBillboard = billboard
end


local function runBrainrotScan()
    clearBrainrotBillboard()

    task.spawn(function()
        local sourceGui, value = findHighestBrainrotSource()
        if not brainrotEspEnabled or not sourceGui then
            return
        end

        createBrainrotBillboard(sourceGui, value)
    end)
end


local function updateShowPlayersText()
    wrapText(showPlayersButton, showPlayersEnabled, "Show Players")
    setButtonState(showPlayersButton, showPlayersEnabled)
end


local function updateInvisibleWallsText()
    wrapText(invisibleWallsButton, invisibleWallsEnabled, "Invisible walls")
    setButtonState(invisibleWallsButton, invisibleWallsEnabled)
end


local function collectBaseParts()
    invisibleWallParts = {}
    local count = 0
    for _, inst in ipairs(workspace:GetDescendants()) do
        if inst:IsA("BasePart") then
            -- Skip character parts
            local model = inst:FindFirstAncestorOfClass("Model")
            local isCharacterPart = false
            if model then
                local humanoid = model:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    isCharacterPart = true
                end
            end


            if not isCharacterPart then
                if inst.Transparency == 0 then
                    -- Treat mostly-horizontal parts as "ground" and keep them solid
                    local up = inst.CFrame.UpVector
                    local isGroundLike = up.Y > 0.7


                    if not isGroundLike then
                        invisibleWallParts[inst] = inst.Transparency
                        count = count + 1
                        if count % 500 == 0 then
                            task.wait()
                        end
                    end
                end
            end
        end
    end
end


local function applyInvisibleWalls()
    if not next(invisibleWallParts) then
        collectBaseParts()
    end
    local processed = 0
    for part in pairs(invisibleWallParts) do
        if part and part.Parent then
            part.Transparency = 0.69
            processed = processed + 1
            if processed % 500 == 0 then
                task.wait()
            end
        end
    end
end


local function restoreInvisibleWalls()
    local processed = 0
    for part, original in pairs(invisibleWallParts) do
        if part and part.Parent then
            part.Transparency = original
            processed = processed + 1
            if processed % 500 == 0 then
                task.wait()
            end
        end
    end
end


local function toggleInvisibleWalls()
    invisibleWallsEnabled = not invisibleWallsEnabled
    if invisibleWallsEnabled then
        collectBaseParts()
        applyInvisibleWalls()
    else
        restoreInvisibleWalls()
    end
    updateInvisibleWallsText()
end


local function updateLagServerText()
    wrapText(lagServerButton, lagServerEnabled, "Lag server")
    setButtonState(lagServerButton, lagServerEnabled)
end


local missingToolMessage
local missingToolMessageTimes = {}


local function showMissingToolMessage(toolName)
    local now = tick()
    local last = missingToolMessageTimes[toolName]
    if last and (now - last) < 2 then
        return
    end
    missingToolMessageTimes[toolName] = now


    if not missingToolMessage then
        missingToolMessage = Instance.new("TextLabel")
        missingToolMessage.Name = "MissingToolMessage"
        missingToolMessage.Size = UDim2.new(0, 400, 0, 30)
        missingToolMessage.Position = UDim2.new(0.5, -200, 0, -40)
        missingToolMessage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        missingToolMessage.BackgroundTransparency = 0.2
        missingToolMessage.Font = Enum.Font.GothamBold
        missingToolMessage.TextSize = 16
        missingToolMessage.TextColor3 = Color3.new(1, 1, 1)
        missingToolMessage.TextStrokeColor3 = Color3.new(0, 0, 0)
        missingToolMessage.TextStrokeTransparency = 0
        missingToolMessage.TextXAlignment = Enum.TextXAlignment.Center
        missingToolMessage.TextYAlignment = Enum.TextYAlignment.Center
        missingToolMessage.TextWrapped = true
        missingToolMessage.Parent = screenGui
    end


    missingToolMessage.Text = "We cannot find " .. tostring(toolName) .. " please purchase it!."
    missingToolMessage.Visible = true
    missingToolMessage.Position = UDim2.new(0.5, -200, 0, -40)


    task.spawn(function()
        -- Slide down
        for i = 0, 10 do
            local t = i / 10
            local y = -40 + (50 * t)
            if missingToolMessage then
                missingToolMessage.Position = UDim2.new(0.5, -200, 0, y)
            end
            task.wait(0.03)
        end


        task.wait(1)


        -- Slide back up
        for i = 0, 10 do
            local t = i / 10
            local y = 10 - (50 * t)
            if missingToolMessage then
                missingToolMessage.Position = UDim2.new(0.5, -200, 0, y)
            end
            task.wait(0.03)
        end


        if missingToolMessage then
            missingToolMessage.Visible = false
        end
    end)
end


local function getToolByName(name)
    if not player then return nil end


    local backpack = player:FindFirstChildOfClass("Backpack") or player:FindFirstChild("Backpack")
    if backpack then
        local tool = backpack:FindFirstChild(name)
        if tool and tool:IsA("Tool") then
            return tool
        end
    end


    if character then
        local tool = character:FindFirstChild(name)
        if tool and tool:IsA("Tool") then
            return tool
        end
    end


    return nil
end


local function clickNearestPlayerHead()
    local cam = workspace.CurrentCamera
    if not cam then return end


    local myChar = character
    if not myChar then return end
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        or myChar:FindFirstChild("Torso")
        or myChar:FindFirstChild("UpperTorso")


    local nearestHead
    local nearestDist
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local head = plr.Character:FindFirstChild("Head")
            if head then
                local dist = myRoot and (head.Position - myRoot.Position).Magnitude or 0
                if not nearestDist or dist < nearestDist then
                    nearestDist = dist
                    nearestHead = head
                end
            end
        end
    end


    if not nearestHead then return end


    local viewportPos, onScreen = cam:WorldToViewportPoint(nearestHead.Position)
    if not onScreen or viewportPos.Z <= 0 then return end


    local pos = Vector2.new(viewportPos.X, viewportPos.Y)
    pcall(function()
        VirtualUser:Button1Down(pos, cam.CFrame)
        task.wait(0.02)
        VirtualUser:Button1Up(pos, cam.CFrame)
    end)
end


local function startLagServerLoop()
    lagServerEnabled = true


    task.spawn(function()
        while lagServerEnabled do
            local char = character
            local humanoid = char and char:FindFirstChildOfClass("Humanoid")
            if not humanoid then
                break
            end


            local backpack = player:FindFirstChildOfClass("Backpack") or player:FindFirstChild("Backpack")


            local laserCape = getToolByName("Laser Cape")
            local medusaHead = getToolByName("Medusa's Head")


            local function spamTool(tool)
                if not tool or not humanoid then return end
                for _ = 1, 3 do
                    if not lagServerEnabled then return end
                    pcall(function()
                        humanoid:EquipTool(tool)
                        if tool == laserCape then
                            clickNearestPlayerHead()
                        end
                        tool:Activate()
                    end)
                    task.wait(0.05)
                    if backpack and tool.Parent ~= backpack then
                        tool.Parent = backpack
                    end
                    task.wait(0.05)
                end
            end


            if laserCape then
                spamTool(laserCape)
            else
                showMissingToolMessage("Laser Cape")
            end


            if medusaHead then
                spamTool(medusaHead)
            else
                showMissingToolMessage("Medusa's Head")
            end


            task.wait(0.05)
        end
    end)
end


local function stopLagServerLoop()
    lagServerEnabled = false
end


local function toggleLagServer()
    if lagServerEnabled then
        stopLagServerLoop()
    else
        startLagServerLoop()
    end
    updateLagServerText()
end


local function clearHighlightForPlayer(targetPlayer)
    local data = playerHighlightData[targetPlayer]
    if data then
        if data.highlight and data.highlight.Parent then
            data.highlight:Destroy()
        end
        if data.billboard and data.billboard.Parent then
            data.billboard:Destroy()
        end
        playerHighlightData[targetPlayer] = nil
    end
end


local function createHighlightForCharacter(targetPlayer, character)
    if not character then
        return
    end
    clearHighlightForPlayer(targetPlayer)
    local head = character:FindFirstChild("Head")
    if not head then
        return
    end
    local highlight = Instance.new("Highlight")
    highlight.FillColor = currentThemeColor
    highlight.OutlineColor = currentThemeColor
    highlight.FillTransparency = 0.6
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Adornee = character
    highlight.Parent = character


    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 150, 0, 24)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = head


    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = targetPlayer.Name
    nameLabel.Font = Enum.Font.GothamSemibold
    nameLabel.TextSize = 14
    nameLabel.TextScaled = false
    nameLabel.TextColor3 = currentThemeColor
    nameLabel.Parent = billboard
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Color3.new(0, 0, 0)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = nameLabel


    playerHighlightData[targetPlayer] = {
        highlight = highlight,
        billboard = billboard,
        label = nameLabel,
        stroke = stroke
    }
end


local function setupCharacter(targetPlayer, character)
    createHighlightForCharacter(targetPlayer, character)
end


local function startShowPlayers()
    if showPlayersEnabled then return end
    showPlayersEnabled = true
    updateShowPlayersText()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player then
            if plr.Character then
                setupCharacter(plr, plr.Character)
            end
            playerCharacterConnections[plr] = plr.CharacterAdded:Connect(function(char)
                setupCharacter(plr, char)
            end)
        end
    end
    playersAddedConnection = Players.PlayerAdded:Connect(function(plr)
        if plr == player then return end
        if plr.Character then
            setupCharacter(plr, plr.Character)
        end
        playerCharacterConnections[plr] = plr.CharacterAdded:Connect(function(char)
            setupCharacter(plr, char)
        end)
    end)
    playersRemovingConnection = Players.PlayerRemoving:Connect(function(plr)
        if playerCharacterConnections[plr] then
            playerCharacterConnections[plr]:Disconnect()
            playerCharacterConnections[plr] = nil
        end
        clearHighlightForPlayer(plr)
    end)
end


local function stopShowPlayers()
    if not showPlayersEnabled then return end
    showPlayersEnabled = false
    updateShowPlayersText()
    if playersAddedConnection then
        playersAddedConnection:Disconnect()
        playersAddedConnection = nil
    end
    if playersRemovingConnection then
        playersRemovingConnection:Disconnect()
        playersRemovingConnection = nil
    end
    for plr, conn in pairs(playerCharacterConnections) do
        conn:Disconnect()
        playerCharacterConnections[plr] = nil
    end
    for plr in pairs(playerHighlightData) do
        clearHighlightForPlayer(plr)
    end
end


local function toggleShowPlayers()
    if showPlayersEnabled then
        stopShowPlayers()
    else
        startShowPlayers()
    end
end


local function updateBrainrotText()
    wrapText(brainrotEspButton, brainrotEspEnabled, "Brainrot ESP")
    setButtonState(brainrotEspButton, brainrotEspEnabled)
end


local function toggleBrainrotEsp()
    brainrotEspEnabled = not brainrotEspEnabled
    if brainrotEspEnabled then
        runBrainrotScan()
    else
        clearBrainrotBillboard()
    end
    updateBrainrotText()
end


brainrotEspButton.MouseButton1Click:Connect(function()
    recordButtonClick(brainrotEspButton)
    if keybindModeEnabled then
        keybindTargetButton = brainrotEspButton
        return
    end


    withCooldown("brainrotEsp", function()
        toggleBrainrotEsp()
    end)
end)


buttonUpdateFunctions[brainrotEspButton] = updateBrainrotText
buttonActions[brainrotEspButton] = toggleBrainrotEsp
applySavedKeybindToButton(brainrotEspButton)


updateBrainrotText()


lagServerButton.MouseButton1Click:Connect(function()
    recordButtonClick(lagServerButton)
    if keybindModeEnabled then
        keybindTargetButton = lagServerButton
        return
    end


    withCooldown("lagServer", function()
        toggleLagServer()
    end)
end)


buttonUpdateFunctions[lagServerButton] = updateLagServerText
buttonActions[lagServerButton] = toggleLagServer
applySavedKeybindToButton(lagServerButton)


updateLagServerText()


showPlayersButton.MouseButton1Click:Connect(function()
    recordButtonClick(showPlayersButton)
    if keybindModeEnabled then
        keybindTargetButton = showPlayersButton
        return
    end


    toggleShowPlayers()
end)


buttonUpdateFunctions[showPlayersButton] = updateShowPlayersText
buttonActions[showPlayersButton] = toggleShowPlayers
applySavedKeybindToButton(showPlayersButton)


updateShowPlayersText()


xrayButton.MouseButton1Click:Connect(function()
    recordButtonClick(xrayButton)
    if keybindModeEnabled then
        keybindTargetButton = xrayButton
        return
    end


    withCooldown("xray", function()
        toggleXray()
    end)
end)


buttonUpdateFunctions[xrayButton] = updateXrayText
buttonActions[xrayButton] = toggleXray
applySavedKeybindToButton(xrayButton)


updateXrayText()


invisibleWallsButton.MouseButton1Click:Connect(function()
    recordButtonClick(invisibleWallsButton)
    if keybindModeEnabled then
        keybindTargetButton = invisibleWallsButton
        return
    end


    withCooldown("invisibleWalls", function()
        toggleInvisibleWalls()
    end)
end)


buttonUpdateFunctions[invisibleWallsButton] = updateInvisibleWallsText
buttonActions[invisibleWallsButton] = toggleInvisibleWalls
applySavedKeybindToButton(invisibleWallsButton)


local autoKickAfterStealEnabled = false
local autoKickTextConnections = {}
local autoKickDescendantConnection


local function textStartsWithYouStole(text)
    if type(text) ~= "string" or text == "" then return false end
    text = string.lower(text)
    return string.find(text, "you stole", 1, true) ~= nil
end


local function clearAutoKickConnections()
    for inst, conn in pairs(autoKickTextConnections) do
        if conn.Connected then
            conn:Disconnect()
        end
        autoKickTextConnections[inst] = nil
    end
    if autoKickDescendantConnection and autoKickDescendantConnection.Connected then
        autoKickDescendantConnection:Disconnect()
        autoKickDescendantConnection = nil
    end
end


local function maybeKickForTextInstance(inst)
    if not autoKickAfterStealEnabled then return end
    if not inst then return end
    local text = inst.Text
    if textStartsWithYouStole(text) then
        player:Kick("Auto kick after steal: You stole.")
    end
end


local function attachAutoKickWatcher(inst)
    if not (inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox")) then
        return
    end
    if autoKickTextConnections[inst] then
        return
    end


    maybeKickForTextInstance(inst)


    autoKickTextConnections[inst] = inst:GetPropertyChangedSignal("Text"):Connect(function()
        maybeKickForTextInstance(inst)
    end)
end


local function startAutoKickAfterSteal()
    clearAutoKickConnections()
    local root = player:FindFirstChildOfClass("PlayerGui") or player:FindFirstChild("PlayerGui")
    if not root then
        return
    end


    local count = 0
    for _, inst in ipairs(root:GetDescendants()) do
        attachAutoKickWatcher(inst)
        count = count + 1
        if count % 200 == 0 then
            task.wait()
        end
    end


    autoKickDescendantConnection = root.DescendantAdded:Connect(function(inst)
        attachAutoKickWatcher(inst)
    end)
end


local function stopAutoKickAfterSteal()
    clearAutoKickConnections()
end


local function updateAutoKickButtonText()
    	if autoKickAfterStealEnabled then
		autoKickButton.Text = "Auto kick after steal (ON)"
	else
		autoKickButton.Text = "Auto kick after steal"


    end
    setButtonState(autoKickButton, autoKickAfterStealEnabled)
end


local function toggleAutoKickAfterSteal()
	autoKickAfterStealEnabled = not autoKickAfterStealEnabled
	if autoKickAfterStealEnabled then
		startAutoKickAfterSteal()
	else
		stopAutoKickAfterSteal()
	end
	updateAutoKickButtonText()
end


autoKickButton.MouseButton1Click:Connect(function()
    recordButtonClick(autoKickButton)
    if keybindModeEnabled then
        keybindTargetButton = autoKickButton
        return
    end


    withCooldown("autoKick", function()
        toggleAutoKickAfterSteal()
    end)
end)


buttonUpdateFunctions[autoKickButton] = updateAutoKickButtonText
buttonActions[autoKickButton] = toggleAutoKickAfterSteal
applySavedKeybindToButton(autoKickButton)


updateAutoKickButtonText()


local COPY_URL = "https://discord.gg/DtzVEakm5r"


local function layoutSettingsButtons()
	local copyY = 48
	if dropdownFrame.Visible then
		copyY = 48 + dropdownFrame.Size.Y.Offset + 10
	end


    -- only the Copy Discord button moves with the dropdown; Auto Kick stays next to Change Theme
	copyDiscordButton.Position = UDim2.new(0, 10, 0, copyY)
end


-- simple reusable toast in the bottom-right corner for Discord copies
local discordToast


local function showDiscordToast()
	if not screenGui then return end
	if not discordToast then
		discordToast = Instance.new("TextLabel")
		discordToast.Name = "DiscordCopiedToast"
		discordToast.Size = UDim2.new(0, 260, 0, 40)
		discordToast.AnchorPoint = Vector2.new(1, 1)
		discordToast.Position = UDim2.new(1, -16, 1, -16)
		discordToast.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		discordToast.BackgroundTransparency = 0.3
		discordToast.Font = Enum.Font.GothamBold
		discordToast.TextSize = 14
		discordToast.TextColor3 = Color3.new(1, 1, 1)
		discordToast.TextWrapped = true
		discordToast.TextXAlignment = Enum.TextXAlignment.Center
		discordToast.TextYAlignment = Enum.TextYAlignment.Center
		discordToast.Parent = screenGui
	end
	discordToast.Text = "Discord link Copied\nPaste the link inside Discord."
	discordToast.Visible = true
	task.delay(2.5, function()
		if discordToast then
			discordToast.Visible = false
		end
	end)
end


if copyDiscordButton then
	copyDiscordButton.MouseButton1Click:Connect(function()
		withCooldown("copyDiscord", function()
			if typeof(setclipboard) == "function" then
				setclipboard(COPY_URL)
			end
			showDiscordToast()
		end)
	end)
end


if changeThemeButton then
    changeThemeButton.MouseButton1Click:Connect(function()
        withCooldown("theme", function()
            dropdownFrame.Visible = not dropdownFrame.Visible
            layoutSettingsButtons()
        end)
    end)
end


local themedObjects = {
    topBar,
    mainTabButton,
    miscTabButton,
    settingsTabButton,
    rawrButton,
    autoBlockButton,
    jumpHopButton,
    speedIncreaseButton,
    instantPickupButton,
    moreFpsButton,
    showPlayersButton,
    xrayButton,
    brainrotEspButton,
    invisibleWallsButton,
    lagServerButton,
    changeThemeButton,
    copyDiscordButton,
    autoKickButton,
    keybindModeButton,
    minimizeButton,
    restoreButton
}


local function setTheme(name)
    local color = themes[name]
    if not color then return end
    currentThemeName = name
    currentThemeColor = color
    if themedObjects then
        applyTheme(themedObjects, color)
    end
    saveConfig()
end


if themeButtons then
    for name, btn in pairs(themeButtons) do
        btn.MouseButton1Click:Connect(function()
            setTheme(name)
            dropdownFrame.Visible = false
            changeThemeButton.BackgroundColor3 = currentThemeColor
            layoutSettingsButtons()
        end)
    end
end


setTheme(currentThemeName)


dragging = false
dragStart = nil
startPos = nil


local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end


topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)


UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        update(input)
    end
end)


exitButton.MouseButton1Click:Connect(function()
    if autoPickupEnabled then
        autoPickupEnabled = false
        stopAutoPickup()
    end


    stopShowPlayers()


    if invisibleWallsEnabled then
        invisibleWallsEnabled = false
        restoreInvisibleWalls()
        updateInvisibleWallsText()
    end


    if noAnimationsEnabled then
        noAnimationsEnabled = false
        applyNoAnimationsState()
        updateNoAnimationsText()
    end


    if autoKickAfterStealEnabled then
        autoKickAfterStealEnabled = false
        stopAutoKickAfterSteal()
        updateAutoKickButtonText()
    end


    if brainrotEspEnabled then
        brainrotEspEnabled = false
        clearBrainrotBillboard()
        updateBrainrotText()
    else
        clearBrainrotBillboard()
    end


    if xrayEnabled then
        xrayEnabled = false
        clearXrayVisuals()
        updateXrayText()
    end


    if moreFpsEnabled then
        moreFpsEnabled = false
        restoreMoreFps()
        updateMoreFpsText()
    end


    stopNoAnimJointLock()


    -- Disable all keybind hotkeys once the UI is closed
    if keybindInputConnection then
        keybindInputConnection:Disconnect()
        keybindInputConnection = nil
    end
    for btn in pairs(buttonKeybinds) do
        buttonKeybinds[btn] = nil
    end


    screenGui:Destroy()
end)
