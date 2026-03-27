-- deobf by tenaciosus

-- =========================
-- Whitelist Check
-- =========================
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TextService = game:GetService("TextService")

local player = Players.LocalPlayer
local lp = player  -- Alias for compatibility

local Whitelist = {
    "DontGetMeAngry_0",
    "crwvingcazslips",
    "SmtDivergent",
    "FrostyFrost_ieatglue",
    "SuitMeSaii",
    "Kingcole1891",
    "Ithinkusername",
    "KRAZ3WRLD",
    "24k_Jorddy",
    "lkreserva5",
    "Abbasm630",
    "Lavagamer10758",
    "Mclovinondat",
    "Your_wifibum",
    "Am4n_az",
    "AltamimiX",
    "Best_Pro06",
    "Zeldrix_51",
    "Noahm172",
    "Ajaim170",
    "sezotp",
    "Ajaim172",
    "stinkyboy1678",
    "El_vieji4",
    "uzishells",
    "jbalt225",
    "JOJOMAMAMAMdvdv",
    "sab_davidbarosand",
    "barryphooo",
    "TRK_Savx",
    "cutzoned",
    "Baconduddy2",
    "whatyoulookinathu_9",
    "MuckyMayo",
    "USERCREATED",
    "Ryz3nStorage",
    "Shsjsj3883",
    "lirilalala6",
    "uonarcs",
    "Mvcross12345",
    "6lpzi",
    "secerttaker",
    "Bukeylukey",
    "stinkyboy1678",
    "EliteYasharal",
    "Bethpine25",
    "iloverobloxxbox1s",
    "MCLOVInOnDAT",
    "Aesss192",
    "UrbanGhostX4",
    "FullyJayy",
    "fortn1t3x91",
    "HauntedCheezBurgerr",
    "AltamimiX",
    "JaydenPires000",
    "jhenriique015",
    "Deinechaiya",
    "juiceman0712805",
    "rditachii",
    "imbaz1",
    "yeyeyey366",
    "fortnitepro098721",
    "xcrxptz",
    "kmdreaper",
    "Swaggyboy15089"
}

local function isWhitelisted(name)
    name = name:lower()
    for _, v in ipairs(Whitelist) do
        if name == v:lower() then
            return true
        end
    end
    return false
end

if not isWhitelisted(player.Name) and not isWhitelisted(player.DisplayName) then
    player:Kick("Not whitelisted")
    return
end

-- =========================
-- Character References
-- =========================
local backpack = player:WaitForChild("Backpack")
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

player.CharacterAdded:Connect(function(c)
    char = c
    humanoid = c:WaitForChild("Humanoid")
    hrp = c:WaitForChild("HumanoidRootPart")
end)

-- =========================
-- Block Delay Configuration
-- =========================
local blockDelay = 0.7  -- Default delay in seconds
local minDelay = 0.1    -- Minimum allowed delay
local maxDelay = 5.0    -- Maximum allowed delay

-- =========================
-- GUI Setup (Mobile Optimized - Small)
-- =========================
local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
ScreenGui.Name = "VonsTeleport"
ScreenGui.ResetOnSpawn = false

-- Very small frame for mobile
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 160, 0, 220)  -- Very small for mobile
Frame.Position = UDim2.new(0.5, -80, 0.5, -110)  -- Centered
Frame.BackgroundColor3 = Color3.fromRGB(0,0,0)  -- Black
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", Frame).Color = Color3.fromRGB(255,255,255)  -- White stroke

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, -20, 0, 25)
Title.Position = UDim2.new(0, 10, 0, 8)
Title.Text = "Kanye Teleport"
Title.TextColor3 = Color3.fromRGB(255,255,255)  -- White
Title.Font = Enum.Font.GothamBold
Title.TextSize = 12  -- Very small
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Center

-- Teleport Button
local TeleportButton = Instance.new("TextButton", Frame)
TeleportButton.Size = UDim2.new(0, 130, 0, 25)  -- Very small
TeleportButton.Position = UDim2.new(0, 15, 0, 38)
TeleportButton.Text = "Teleport"
TeleportButton.TextColor3 = Color3.fromRGB(0,0,0)  -- Black text
TeleportButton.Font = Enum.Font.GothamBold
TeleportButton.TextSize = 12  -- Very small
TeleportButton.BackgroundColor3 = Color3.fromRGB(255,255,255)  -- White
Instance.new("UICorner", TeleportButton).CornerRadius = UDim.new(0, 6)

-- Keybind Button
local KeybindButton = Instance.new("TextButton", Frame)
KeybindButton.Size = UDim2.new(0, 130, 0, 25)  -- Very small
KeybindButton.Position = UDim2.new(0, 15, 0, 68)
KeybindButton.Text = "Keybind: [F]"
KeybindButton.TextColor3 = Color3.fromRGB(0,0,0)  -- Black text
KeybindButton.Font = Enum.Font.GothamBold
KeybindButton.TextSize = 12  -- Very small
KeybindButton.BackgroundColor3 = Color3.fromRGB(255,255,255)  -- White
Instance.new("UICorner", KeybindButton).CornerRadius = UDim.new(0, 6)

-- Auto Block Toggle Button
local autoBlockEnabled = true
local AutoBlockButton = Instance.new("TextButton", Frame)
AutoBlockButton.Size = UDim2.new(0, 130, 0, 25)  -- Very small
AutoBlockButton.Position = UDim2.new(0, 15, 0, 98)
AutoBlockButton.Font = Enum.Font.GothamBold
AutoBlockButton.TextSize = 11  -- Very small
AutoBlockButton.TextColor3 = Color3.fromRGB(0,0,0)  -- Black text
Instance.new("UICorner", AutoBlockButton).CornerRadius = UDim.new(0, 6)

-- Block Delay Label
local DelayLabel = Instance.new("TextLabel", Frame)
DelayLabel.Size = UDim2.new(1, -20, 0, 16)
DelayLabel.Position = UDim2.new(0, 10, 0, 128)
DelayLabel.Text = "Delay:"
DelayLabel.TextColor3 = Color3.fromRGB(255,255,255)  -- White
DelayLabel.Font = Enum.Font.Gotham
DelayLabel.TextSize = 10  -- Very small
DelayLabel.BackgroundTransparency = 1
DelayLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Block Delay Text Box
local DelayTextBox = Instance.new("TextBox", Frame)
DelayTextBox.Size = UDim2.new(0, 75, 0, 20)  -- Very small
DelayTextBox.Position = UDim2.new(0, 15, 0, 145)
DelayTextBox.Text = tostring(blockDelay)
DelayTextBox.TextColor3 = Color3.fromRGB(0,0,0)  -- Black text
DelayTextBox.Font = Enum.Font.Gotham
DelayTextBox.TextSize = 11  -- Very small
DelayTextBox.BackgroundColor3 = Color3.fromRGB(255,255,255)  -- White
DelayTextBox.PlaceholderText = "0.1-5.0"
DelayTextBox.PlaceholderColor3 = Color3.fromRGB(150,150,150)
Instance.new("UICorner", DelayTextBox).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", DelayTextBox).Color = Color3.fromRGB(100,100,100)

-- Set Delay Button
local SetDelayButton = Instance.new("TextButton", Frame)
SetDelayButton.Size = UDim2.new(0, 40, 0, 20)  -- Very small
SetDelayButton.Position = UDim2.new(0, 100, 0, 145)
SetDelayButton.Text = "Set"
SetDelayButton.TextColor3 = Color3.fromRGB(0,0,0)  -- Black text
SetDelayButton.Font = Enum.Font.GothamBold
SetDelayButton.TextSize = 10  -- Very small
SetDelayButton.BackgroundColor3 = Color3.fromRGB(200,200,200)  -- Light gray
Instance.new("UICorner", SetDelayButton).CornerRadius = UDim.new(0, 4)

-- Block All Button
local BlockAllButton = Instance.new("TextButton", Frame)
BlockAllButton.Size = UDim2.new(0, 130, 0, 25)  -- Very small
BlockAllButton.Position = UDim2.new(0, 15, 0, 175)
BlockAllButton.Text = "Block All"
BlockAllButton.TextColor3 = Color3.fromRGB(0,0,0)  -- Black text
BlockAllButton.Font = Enum.Font.GothamBold
BlockAllButton.TextSize = 11  -- Very small
BlockAllButton.BackgroundColor3 = Color3.fromRGB(255,255,255)  -- White
Instance.new("UICorner", BlockAllButton).CornerRadius = UDim.new(0, 6)

-- Current Delay Display
local CurrentDelayLabel = Instance.new("TextLabel", Frame)
CurrentDelayLabel.Size = UDim2.new(1, -20, 0, 16)
CurrentDelayLabel.Position = UDim2.new(0, 10, 0, 205)
CurrentDelayLabel.Text = "Delay: " .. tostring(blockDelay) .. "s"
CurrentDelayLabel.TextColor3 = Color3.fromRGB(255,255,255)  -- White
CurrentDelayLabel.Font = Enum.Font.Gotham
CurrentDelayLabel.TextSize = 9  -- Very small
CurrentDelayLabel.BackgroundTransparency = 1
CurrentDelayLabel.TextXAlignment = Enum.TextXAlignment.Center

-- =========================
-- Minimize Button
-- =========================
local ToggleCircle = Instance.new("ImageButton", ScreenGui)
ToggleCircle.Size = UDim2.new(0, 40, 0, 40)  -- Very small for mobile
ToggleCircle.Position = UDim2.new(0, 10, 0, 10)  -- Top left for easy access
ToggleCircle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleCircle.BackgroundTransparency = 0.2
ToggleCircle.Image = "rbxassetid://6034834113"
ToggleCircle.ImageColor3 = Color3.new(1,1,1)
ToggleCircle.ZIndex = 10
ToggleCircle.Active = true
ToggleCircle.Draggable = true

local ToggleCorner = Instance.new("UICorner", ToggleCircle)
ToggleCorner.CornerRadius = UDim.new(1, 0)

local ToggleStroke = Instance.new("UIStroke", ToggleCircle)
ToggleStroke.Color = Color3.fromRGB(255, 255, 255)
ToggleStroke.Thickness = 1

-- Minimize toggle functionality
ToggleCircle.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
    -- Change the button image to indicate state
    if Frame.Visible then
        ToggleCircle.Image = "rbxassetid://6034834113"  -- Default icon (eye)
    else
        ToggleCircle.Image = "rbxassetid://6034835320"  -- Different icon for hidden state
    end
end)

-- =========================
-- Function to update auto-block UI
-- =========================
local function updateAutoBlockUI()
    if autoBlockEnabled then
        AutoBlockButton.Text = "Auto: ON"
        AutoBlockButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Green when ON
    else
        AutoBlockButton.Text = "Auto: OFF"
        AutoBlockButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red when OFF
    end
end

-- Function to validate and set block delay
local function setBlockDelay()
    local text = DelayTextBox.Text
    if text == "" then
        DelayTextBox.Text = tostring(blockDelay)
        return
    end
    
    -- Try to convert to number
    local num = tonumber(text)
    if num then
        -- Clamp between min and max
        if num < minDelay then
            num = minDelay
        elseif num > maxDelay then
            num = maxDelay
        end
        
        -- Round to 2 decimal places for display
        blockDelay = math.floor(num * 100 + 0.5) / 100
        
        -- Update display
        DelayTextBox.Text = tostring(blockDelay)
        CurrentDelayLabel.Text = "Delay: " .. tostring(blockDelay) .. "s"
        
        print("Block delay set to: " .. tostring(blockDelay) .. " seconds")
    else
        -- Invalid input, reset to current value
        DelayTextBox.Text = tostring(blockDelay)
        warn("Invalid delay value. Using: " .. tostring(blockDelay))
    end
end

-- Initialize the UI
updateAutoBlockUI()

-- =========================
-- Auto-Block Functions
-- =========================
local function FastClick()
    task.wait(blockDelay)  -- Use the customizable delay here
    local cam = workspace.CurrentCamera.ViewportSize
    local x = cam.X / 2
    local y = cam.Y / 2 + 23

    for _ = 1, 8 do
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 1)
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 1)
        task.wait(0.008)
    end
end

local function blockPlayer(plr)
    if not plr or plr == player then return end
    pcall(function()
        StarterGui:SetCore("PromptBlockPlayer", plr)
    end)
end

-- =========================
-- Brainrot/Auto-Block Detection
-- =========================
local function checkForBrainrot()
    -- Check if auto-block is enabled
    if not autoBlockEnabled then
        return false
    end
    
    -- Check backpack for brainrot/animal tools
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local toolName = tool.Name:lower()
            -- Check if tool name contains brainrot or common animal names
            if toolName:find("brainrot") or toolName:find("animal") or 
               toolName:find("monkey") or toolName:find("dog") or 
               toolName:find("cat") or toolName:find("bird") then
                
                -- Find the player who might have dropped it (check players in workspace)
                for _, otherPlayer in ipairs(Players:GetPlayers()) do
                    if otherPlayer ~= player and otherPlayer.Character then
                        -- Check if this player recently had this tool
                        local otherBackpack = otherPlayer:FindFirstChild("Backpack")
                        if otherBackpack and not otherBackpack:FindFirstChild(tool.Name) then
                            -- Block the player who potentially dropped the brainrot
                            blockPlayer(otherPlayer)
                            FastClick()
                            task.wait(0.25)
                            return true
                        end
                    end
                end
            end
        end
    end
    
    -- Also check character
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") then
            local toolName = tool.Name:lower()
            if toolName:find("brainrot") or toolName:find("animal") or 
               toolName:find("monkey") or toolName:find("dog") or 
               toolName:find("cat") or toolName:find("bird") then
                
                -- Find and block potential dropper
                for _, otherPlayer in ipairs(Players:GetPlayers()) do
                    if otherPlayer ~= player and otherPlayer.Character then
                        local otherBackpack = otherPlayer:FindFirstChild("Backpack")
                        if otherBackpack and not otherBackpack:FindFirstChild(tool.Name) then
                            blockPlayer(otherPlayer)
                            FastClick()
                            task.wait(0.25)
                            return true
                        end
                    end
                end
            end
        end
    end
    
    return false
end

-- Set up brainrot detection
local function setupBrainrotDetection()
    -- Check initially
    checkForBrainrot()
    
    -- Check when tools are added to backpack
    backpack.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            task.wait(0.5)  -- Wait a moment for tool to fully load
            checkForBrainrot()
        end
    end)
    
    -- Check when tools are added to character
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            task.wait(0.5)
            checkForBrainrot()
        end
    end)
    
    -- Also check when character changes
    player.CharacterAdded:Connect(function(newChar)
        char = newChar
        newChar.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then
                task.wait(0.5)
                checkForBrainrot()
            end
        end)
        
        -- Check new character's tools
        task.wait(1)
        checkForBrainrot()
    end)
end

-- =========================
-- Teleport Data
-- =========================
local spots = {
    CFrame.new(-402.18, -6.34, 131.83) * CFrame.Angles(0, math.rad(-20.08), 0),
    CFrame.new(-416.66, -6.34, -2.05) * CFrame.Angles(0, math.rad(-62.89), 0),
    CFrame.new(-329.37, -4.68, 18.12) * CFrame.Angles(0, math.rad(-30.53), 0),
}

local REQUIRED_TOOL = "Flying Carpet"
local teleportKey = Enum.KeyCode.F
local waitingForKey = false
local lastTarget = nil

-- =========================
-- Equip Flying Carpet (Auto)
-- =========================
local function equipFlyingCarpet()
    local tool = backpack:FindFirstChild(REQUIRED_TOOL) or char:FindFirstChild(REQUIRED_TOOL)
    if not tool then
        warn("Flying Carpet not found")
        return false
    end

    if tool.Parent ~= char then
        humanoid:EquipTool(tool)
        repeat task.wait() until tool.Parent == char
    end

    return true
end

-- =========================
-- Block All Players Function
-- =========================
local function blockAllPlayers()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player then
            blockPlayer(plr)
            FastClick()
            task.wait(0.25)
        end
    end
end

-- =========================
-- Teleport + Auto Block (Modified)
-- =========================
local function teleportAll()
    if not equipFlyingCarpet() then return end

    lastTarget = nil
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player then
            lastTarget = plr
            break
        end
    end

    for _, spot in ipairs(spots) do
        equipFlyingCarpet()
        hrp.CFrame = spot
        task.wait(0.12)
    end

    -- Only block if auto-block is enabled
    if lastTarget and autoBlockEnabled then
        blockPlayer(lastTarget)
        FastClick()
    end
end

-- =========================
-- Button & Keybind Logic
-- =========================
TeleportButton.MouseButton1Click:Connect(function()
    teleportAll()
    -- Check for brainrot after teleporting (only if auto-block is enabled)
    if autoBlockEnabled then
        task.wait(1)
        checkForBrainrot()
    end
end)

KeybindButton.MouseButton1Click:Connect(function()
    KeybindButton.Text = "Press a key..."
    waitingForKey = true
end)

-- Auto Block Toggle Button Logic
AutoBlockButton.MouseButton1Click:Connect(function()
    autoBlockEnabled = not autoBlockEnabled
    updateAutoBlockUI()
end)

-- Set Delay Button Logic
SetDelayButton.MouseButton1Click:Connect(setBlockDelay)

-- Delay Text Box: Set on focus lost
DelayTextBox.FocusLost:Connect(function(enterPressed)
    setBlockDelay()
end)

-- Delay Text Box: Validate input on text change
DelayTextBox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = DelayTextBox.Text
    if text ~= "" then
        local num = tonumber(text)
        if num then
            -- Highlight valid input with subtle color change
            if num >= minDelay and num <= maxDelay then
                DelayTextBox.BackgroundColor3 = Color3.fromRGB(255,255,255)  -- White
            else
                DelayTextBox.BackgroundColor3 = Color3.fromRGB(255,200,200)  -- Light red for out of range
            end
        else
            DelayTextBox.BackgroundColor3 = Color3.fromRGB(255,200,200)  -- Light red for invalid
        end
    else
        DelayTextBox.BackgroundColor3 = Color3.fromRGB(255,255,255)  -- White
    end
end)

-- Block All Button Logic
BlockAllButton.MouseButton1Click:Connect(blockAllPlayers)

-- Set delay on Enter key press in text box
DelayTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        setBlockDelay()
    end
end)

-- Also set delay when text box loses focus
DelayTextBox.FocusLost:Connect(setBlockDelay)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if waitingForKey and input.UserInputType == Enum.UserInputType.Keyboard then
        teleportKey = input.KeyCode
        KeybindButton.Text = "Keybind: [" .. teleportKey.Name .. "]"
        waitingForKey = false
    elseif input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == teleportKey then
        teleportAll()
        -- Check for brainrot after teleporting (only if auto-block is enabled)
        if autoBlockEnabled then
            task.wait(1)
            checkForBrainrot()
        end
    end
end)

-- =========================
-- Initialize Auto-Block System
-- =========================
setupBrainrotDetection()

-- Add a message to show auto-block is active
print("=========================================")
print("Teleport & Auto-Block script loaded!")
print("Auto-Block: " .. (autoBlockEnabled and "ENABLED" or "DISABLED"))
print("Block Delay: " .. tostring(blockDelay) .. " seconds")
print("Valid range: " .. tostring(minDelay) .. "s - " .. tostring(maxDelay) .. "s")
print("Ultra-compact mobile GUI with minimize button")
print("=========================================")