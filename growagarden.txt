-- Services
local Players = game:GetService('Players')
local TweenService = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')
local MarketplaceService = game:GetService('MarketplaceService')

-- Variables
local player = Players.LocalPlayer
local playerGui = player:WaitForChild('PlayerGui')
local currentGameName = 'Loading...'

-- Get current game name
pcall(function()
    currentGameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
end)

-- Main GUI Setup
local gui = Instance.new('ScreenGui')
gui.Name = 'XetraHub'
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Loading Screen
local loadingFrame = Instance.new('Frame')
loadingFrame.Name = 'LoadingScreen'
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.Position = UDim2.new(0, 0, 0, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = gui

-- Loading Background Gradient
local gradient = Instance.new('UIGradient')
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20)),
})
gradient.Rotation = 45
gradient.Parent = loadingFrame

-- Logo Container
local logoContainer = Instance.new('Frame')
logoContainer.Name = 'LogoContainer'
logoContainer.Size = UDim2.new(0, 200, 0, 200)
logoContainer.Position = UDim2.new(0.5, -100, 0.5, -150)
logoContainer.BackgroundTransparency = 1
logoContainer.Parent = loadingFrame

-- Logo Image
local logo = Instance.new('ImageLabel')
logo.Name = 'Logo'
logo.Size = UDim2.new(1, 0, 1, 0)
logo.Position = UDim2.new(0, 0, 0, 0)
logo.BackgroundTransparency = 1
logo.Image = 'rbxassetid://111108278176277'
logo.ImageTransparency = 0.2
logo.Parent = logoContainer

-- Logo Corner
local logoCorner = Instance.new('UICorner')
logoCorner.CornerRadius = UDim.new(0, 20)
logoCorner.Parent = logo

-- Credits Text
local creditsText = Instance.new('TextLabel')
creditsText.Name = 'Credits'
creditsText.Size = UDim2.new(0, 400, 0, 60)
creditsText.Position = UDim2.new(0.5, -200, 0.5, 80)
creditsText.BackgroundTransparency = 1
creditsText.Text = 'Xetra Hub'
creditsText.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsText.TextSize = 32
creditsText.Font = Enum.Font.GothamBold
creditsText.TextTransparency = 1
creditsText.Parent = loadingFrame

-- Made By Text
local madeByText = Instance.new('TextLabel')
madeByText.Name = 'MadeBy'
madeByText.Size = UDim2.new(0, 400, 0, 40)
madeByText.Position = UDim2.new(0.5, -200, 0.5, 130)
madeByText.BackgroundTransparency = 1
madeByText.Text = 'Made By Bebo Mods'
madeByText.TextColor3 = Color3.fromRGB(180, 180, 190)
madeByText.TextSize = 18
madeByText.Font = Enum.Font.Gotham
madeByText.TextTransparency = 1
madeByText.Parent = loadingFrame

-- Game Name Display
local gameNameText = Instance.new('TextLabel')
gameNameText.Name = 'GameName'
gameNameText.Size = UDim2.new(0, 600, 0, 30)
gameNameText.Position = UDim2.new(0.5, -300, 0.5, 170)
gameNameText.BackgroundTransparency = 1
gameNameText.Text = '🎮 ' .. currentGameName
gameNameText.TextColor3 = Color3.fromRGB(100, 200, 255)
gameNameText.TextSize = 16
gameNameText.Font = Enum.Font.GothamBold
gameNameText.TextTransparency = 1
gameNameText.Parent = loadingFrame

-- Loading Status Text
local statusText = Instance.new('TextLabel')
statusText.Name = 'StatusText'
statusText.Size = UDim2.new(0, 400, 0, 25)
statusText.Position = UDim2.new(0.5, -200, 0.75, 0)
statusText.BackgroundTransparency = 1
statusText.Text = 'Initializing...'
statusText.TextColor3 = Color3.fromRGB(150, 150, 160)
statusText.TextSize = 14
statusText.Font = Enum.Font.Gotham
statusText.TextTransparency = 1
statusText.Parent = loadingFrame

-- Loading Bar Container
local loadingBarContainer = Instance.new('Frame')
loadingBarContainer.Name = 'LoadingBarContainer'
loadingBarContainer.Size = UDim2.new(0, 400, 0, 8)
loadingBarContainer.Position = UDim2.new(0.5, -200, 0.8, 0)
loadingBarContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
loadingBarContainer.BorderSizePixel = 0
loadingBarContainer.Parent = loadingFrame

local loadingBarCorner = Instance.new('UICorner')
loadingBarCorner.CornerRadius = UDim.new(0, 4)
loadingBarCorner.Parent = loadingBarContainer

-- Loading Bar Fill
local loadingBar = Instance.new('Frame')
loadingBar.Name = 'LoadingBar'
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.Position = UDim2.new(0, 0, 0, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingBarContainer

local loadingBarFillCorner = Instance.new('UICorner')
loadingBarFillCorner.CornerRadius = UDim.new(0, 4)
loadingBarFillCorner.Parent = loadingBar

-- Loading Percentage
local loadingPercent = Instance.new('TextLabel')
loadingPercent.Size = UDim2.new(0, 100, 0, 25)
loadingPercent.Position = UDim2.new(0.5, -50, 0.85, 0)
loadingPercent.BackgroundTransparency = 1
loadingPercent.Text = '0%'
loadingPercent.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingPercent.TextSize = 14
loadingPercent.Font = Enum.Font.GothamBold
loadingPercent.TextTransparency = 1
loadingPercent.Parent = loadingFrame

-- Copy Utility
local function copyToClipboard(text)
    if setclipboard then
        setclipboard(text)
        pcall(function()
            game.StarterGui:SetCore('SendNotification', {
                Title = 'Copied!',
                Text = 'Link copied to clipboard.',
                Duration = 3,
            })
        end)
    end
end

-- Loading Animations with Smart Status Updates
local function playLoadingAnimations()
    -- Logo fade in with scale
    logo.ImageTransparency = 1
    logoContainer.Size = UDim2.new(0, 150, 0, 150)
    logoContainer.Position = UDim2.new(0.5, -75, 0.5, -150)

    local logoScaleTween = TweenService:Create(
        logoContainer,
        TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0, 200, 0, 200),
            Position = UDim2.new(0.5, -100, 0.5, -150),
        }
    )

    local logoFadeTween = TweenService:Create(
        logo,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            ImageTransparency = 0.2,
        }
    )

    logoScaleTween:Play()
    wait(0.3)
    logoFadeTween:Play()

    -- Credits text fade in
    wait(0.5)
    local creditsFadeTween = TweenService:Create(
        creditsText,
        TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            TextTransparency = 0,
        }
    )
    creditsFadeTween:Play()

    -- Made by text fade in
    wait(0.3)
    local madeByFadeTween = TweenService:Create(
        madeByText,
        TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            TextTransparency = 0,
        }
    )
    madeByFadeTween:Play()

    -- Game name fade in
    wait(0.3)
    local gameNameFadeTween = TweenService:Create(
        gameNameText,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            TextTransparency = 0,
        }
    )
    gameNameFadeTween:Play()

    -- Status text fade in
    wait(0.3)
    local statusFadeTween = TweenService:Create(
        statusText,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            TextTransparency = 0,
        }
    )
    statusFadeTween:Play()

    -- Loading percentage fade in
    wait(0.2)
    local percentFadeTween = TweenService:Create(
        loadingPercent,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            TextTransparency = 0,
        }
    )
    percentFadeTween:Play()

    -- Smart loading sequence with realistic steps
    wait(0.5)

    local loadingSteps = {
        {
            text = 'Initializing script environment...',
            percent = 5,
            duration = 0.8,
        },
        { text = 'Loading core modules...', percent = 15, duration = 0.6 },
        {
            text = 'Connecting to authentication server...',
            percent = 25,
            duration = 1.0,
        },
        {
            text = 'Verifying game compatibility...',
            percent = 40,
            duration = 0.7,
        },
        {
            text = 'Loading game-specific features...',
            percent = 55,
            duration = 0.9,
        },
        {
            text = 'Injecting security protocols...',
            percent = 70,
            duration = 0.8,
        },
        {
            text = 'Establishing secure connection...',
            percent = 85,
            duration = 0.7,
        },
        { text = 'Finalizing initialization...', percent = 95, duration = 0.6 },
        { text = 'Ready to authenticate!', percent = 100, duration = 0.5 },
    }

    for _, step in ipairs(loadingSteps) do
        statusText.Text = step.text
        loadingPercent.Text = step.percent .. '%'

        local barTween = TweenService:Create(
            loadingBar,
            TweenInfo.new(
                step.duration * 0.8,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.new(step.percent / 100, 0, 1, 0),
            }
        )
        barTween:Play()

        wait(step.duration)
    end

    -- Final completion effect
    wait(0.8)
    statusText.Text = 'Loading complete! Starting authentication...'

    wait(1)

    -- Fade out loading screen
    local fadeOutTween = TweenService:Create(
        loadingFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            BackgroundTransparency = 1,
        }
    )

    local logoFadeOutTween = TweenService:Create(
        logo,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            ImageTransparency = 1,
        }
    )

    local creditsFadeOutTween = TweenService:Create(
        creditsText,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            TextTransparency = 1,
        }
    )

    local madeByFadeOutTween = TweenService:Create(
        madeByText,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            TextTransparency = 1,
        }
    )

    local gameNameFadeOutTween = TweenService:Create(
        gameNameText,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            TextTransparency = 1,
        }
    )

    local statusFadeOutTween = TweenService:Create(
        statusText,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            TextTransparency = 1,
        }
    )

    local percentFadeOutTween = TweenService:Create(
        loadingPercent,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            TextTransparency = 1,
        }
    )

    fadeOutTween:Play()
    logoFadeOutTween:Play()
    creditsFadeOutTween:Play()
    madeByFadeOutTween:Play()
    gameNameFadeOutTween:Play()
    statusFadeOutTween:Play()
    percentFadeOutTween:Play()

    fadeOutTween.Completed:Connect(function()
        loadingFrame:Destroy()
        createKeySystem()
    end)
end

-- Original Key System
function createKeySystem()
    -- Main Shadow
    local shadow = Instance.new('ImageLabel')
    shadow.Name = 'Shadow'
    shadow.Image = 'rbxassetid://1316045217'
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.85
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.Size = UDim2.new(0, 350, 0, 280)
    shadow.Position = UDim2.new(0.5, -175, 0.5, -140)
    shadow.BackgroundTransparency = 1
    shadow.ZIndex = 0
    shadow.Parent = gui

    local frame = Instance.new('Frame')
    frame.Size = UDim2.new(0, 340, 0, 270)
    frame.Position = UDim2.new(0.5, -170, 0.5, -135)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.Parent = gui

    -- Round corners
    local corner = Instance.new('UICorner')
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    -- Close Button
    local closeBtn = Instance.new('TextButton')
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.Text = '×'
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 24
    closeBtn.Parent = frame

    closeBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    -- Title with divider
    local title = Instance.new('TextLabel')
    title.Size = UDim2.new(1, -40, 0, 40)
    title.Position = UDim2.new(0, 20, 0, 0)
    title.Text = 'Xetra Hub Key System'
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame

    local divider = Instance.new('Frame')
    divider.Size = UDim2.new(1, -40, 0, 1)
    divider.Position = UDim2.new(0, 20, 0, 40)
    divider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    divider.BorderSizePixel = 0
    divider.Parent = frame

    -- Key Input Box
    local keyBox = Instance.new('TextBox')
    keyBox.Size = UDim2.new(1, -40, 0, 40)
    keyBox.Position = UDim2.new(0, 20, 0, 60)
    keyBox.PlaceholderText = 'Paste your key here...'
    keyBox.Font = Enum.Font.Gotham
    keyBox.TextSize = 14
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    keyBox.ClearTextOnFocus = false
    keyBox.Parent = frame

    local boxCorner = Instance.new('UICorner')
    boxCorner.CornerRadius = UDim.new(0, 6)
    boxCorner.Parent = keyBox

    local boxPadding = Instance.new('UIPadding')
    boxPadding.PaddingLeft = UDim.new(0, 10)
    boxPadding.PaddingRight = UDim.new(0, 10)
    boxPadding.Parent = keyBox

    -- Check Button
    local checkBtn = Instance.new('TextButton')
    checkBtn.Size = UDim2.new(1, -40, 0, 40)
    checkBtn.Position = UDim2.new(0, 20, 0, 110)
    checkBtn.Text = 'CHECK KEY'
    checkBtn.Font = Enum.Font.GothamBold
    checkBtn.TextSize = 14
    checkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    checkBtn.Parent = frame

    local btnCorner = Instance.new('UICorner')
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = checkBtn

    -- Button hover effects
    checkBtn.MouseEnter:Connect(function()
        TweenService
            :Create(
                checkBtn,
                TweenInfo.new(0.1),
                { BackgroundColor3 = Color3.fromRGB(0, 140, 255) }
            )
            :Play()
    end)

    checkBtn.MouseLeave:Connect(function()
        TweenService
            :Create(
                checkBtn,
                TweenInfo.new(0.1),
                { BackgroundColor3 = Color3.fromRGB(0, 120, 215) }
            )
            :Play()
    end)

    -- Status Label
    local statusLabel = Instance.new('TextLabel')
    statusLabel.Size = UDim2.new(1, -40, 0, 50)
    statusLabel.Position = UDim2.new(0, 20, 0, 160)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = 'Status: Waiting for key...'
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.TextSize = 14
    statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusLabel.TextWrapped = true
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Parent = frame

    -- Bottom Buttons Container
    local buttonContainer = Instance.new('Frame')
    buttonContainer.Size = UDim2.new(1, -40, 0, 40)
    buttonContainer.Position = UDim2.new(0, 20, 1, -50)
    buttonContainer.BackgroundTransparency = 1
    buttonContainer.Parent = frame

    -- Get Key Button
    local getKeyBtn = Instance.new('TextButton')
    getKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
    getKeyBtn.Position = UDim2.new(0, 0, 0, 0)
    getKeyBtn.Text = '🔑 GET KEY'
    getKeyBtn.Font = Enum.Font.GothamBold
    getKeyBtn.TextSize = 14
    getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
    getKeyBtn.Parent = buttonContainer

    local getKeyCorner = Instance.new('UICorner')
    getKeyCorner.CornerRadius = UDim.new(0, 6)
    getKeyCorner.Parent = getKeyBtn

    -- Discord Button
    local discordBtn = Instance.new('TextButton')
    discordBtn.Size = UDim2.new(0.48, 0, 1, 0)
    discordBtn.Position = UDim2.new(0.52, 0, 0, 0)
    discordBtn.Text = '💬 DISCORD'
    discordBtn.Font = Enum.Font.GothamBold
    discordBtn.TextSize = 14
    discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 161)
    discordBtn.Parent = buttonContainer

    local discordCorner = Instance.new('UICorner')
    discordCorner.CornerRadius = UDim.new(0, 6)
    discordCorner.Parent = discordBtn

    -- Button hover effects
    getKeyBtn.MouseEnter:Connect(function()
        TweenService
            :Create(
                getKeyBtn,
                TweenInfo.new(0.1),
                { BackgroundColor3 = Color3.fromRGB(0, 170, 120) }
            )
            :Play()
    end)

    getKeyBtn.MouseLeave:Connect(function()
        TweenService
            :Create(
                getKeyBtn,
                TweenInfo.new(0.1),
                { BackgroundColor3 = Color3.fromRGB(0, 150, 100) }
            )
            :Play()
    end)

    discordBtn.MouseEnter:Connect(function()
        TweenService
            :Create(
                discordBtn,
                TweenInfo.new(0.1),
                { BackgroundColor3 = Color3.fromRGB(114, 137, 218) }
            )
            :Play()
    end)

    discordBtn.MouseLeave:Connect(function()
        TweenService
            :Create(
                discordBtn,
                TweenInfo.new(0.1),
                { BackgroundColor3 = Color3.fromRGB(88, 101, 161) }
            )
            :Play()
    end)

    -- Get Key Button Functionality
    getKeyBtn.MouseButton1Click:Connect(function()
        local originalText = getKeyBtn.Text
        getKeyBtn.Text = 'GENERATING KEY...'

        wait(0.5)

        local keyLink =
            'https://ads.luarmor.net/get_key?for=WorkinkForScriptHub-vluylajhmgqF'
        copyToClipboard(keyLink)

        statusLabel.Text =
            '✅ Key link copied to clipboard! Paste it in your browser.'

        wait(1.5)
        getKeyBtn.Text = originalText
    end)

    -- Discord Button Functionality
    discordBtn.MouseButton1Click:Connect(function()
        local discordLink = 'https://discord.gg/DR2RdatRjc'
        copyToClipboard(discordLink)
        statusLabel.Text = '✅ Discord invite link copied to clipboard!'
    end)

    -- Luarmor Key Check Logic
    local api = loadstring(
        game:HttpGet('https://sdkapi-public.luarmor.net/library.lua')
    )()
    api.script_id = 'b8f3cad4ff24c98ef41e99b4a1131316'

    checkBtn.MouseButton1Click:Connect(function()
        local userKey = keyBox.Text
        if not userKey or #userKey < 32 then
            statusLabel.Text =
                '❌ Key is too short or empty. Please enter a valid key.'
            return
        end

        statusLabel.Text = '🔍 Checking key validity...'

        local success, response = pcall(function()
            return api.check_key(userKey)
        end)

        if not success then
            statusLabel.Text = '⚠️ Error checking key. Please try again.'
            return
        end

        if response.code == 'KEY_VALID' then
            local timeLeft = response.data.auth_expire - os.time()
            local hoursLeft = math.floor(timeLeft / 3600)
            local minutesLeft = math.floor((timeLeft % 3600) / 60)
            statusLabel.Text = string.format(
                '✅ Valid key! Time remaining: %dh %dm',
                hoursLeft,
                minutesLeft
            )
            getgenv().script_key = userKey
            wait(1)
            api.load_script()
            gui:Destroy()
        elseif response.code == 'KEY_HWID_LOCKED' then
            statusLabel.Text =
                '🔒 Key is locked to another device. Reset via bot.'
        elseif response.code == 'KEY_INCORRECT' then
            statusLabel.Text = '❌ Invalid key. Please check and try again.'
        elseif response.code == 'KEY_EXPIRED' then
            statusLabel.Text =
                '⌛ Key has expired. Please renew your subscription.'
        elseif response.code == 'KEY_BANNED' then
            statusLabel.Text = '🚫 Key has been blacklisted. Contact support.'
        else
            statusLabel.Text = '❗ Error: '
                .. (response.message or 'Unknown error')
                .. ' (Code: '
                .. response.code
                .. ')'
        end
    end)

    -- Make the window draggable
    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
        shadow.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X - 5,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y - 5
        )
    end

    frame.InputBegan:Connect(function(input)
        if
            input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch
        then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- Start loading sequence
playLoadingAnimations()