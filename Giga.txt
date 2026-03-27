local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local ProximityPromptService = game:GetService("ProximityPromptService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Состояния скрипта
local isActive = false
local isMoving = false
local promptTriggered = false
local armCheckConnection = nil
local promptConnection = nil
local currentProcess = nil

-- === GUI SETUP ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MovementControlGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main frame
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Size = UDim2.new(0, 250, 0, 120)
backgroundFrame.Position = UDim2.new(0.5, -125, 0.3, 0)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
backgroundFrame.BorderSizePixel = 0
backgroundFrame.Parent = screenGui

local uiCornerBg = Instance.new("UICorner")
uiCornerBg.CornerRadius = UDim.new(0, 12)
uiCornerBg.Parent = backgroundFrame

local shadow = Instance.new("UIStroke")
shadow.Thickness = 2
shadow.Color = Color3.fromRGB(60, 60, 60)
shadow.Parent = backgroundFrame

-- Header
local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, 0, 0, 30)
header.BackgroundTransparency = 1
header.Text = "Makal Hub Tween To Base"
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 18
header.Font = Enum.Font.GothamBold
header.Parent = backgroundFrame

-- Gradient bar under header
local gradientBar = Instance.new("Frame")
gradientBar.Size = UDim2.new(1, 0, 0, 3)
gradientBar.Position = UDim2.new(0, 0, 0, 30)
gradientBar.BorderSizePixel = 0
gradientBar.Parent = backgroundFrame

local barGradient = Instance.new("UIGradient")
barGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 200, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 150, 255))
}
barGradient.Parent = gradientBar

-- Status label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 40)
statusLabel.Position = UDim2.new(0, 10, 0, 40)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Press Start before stealing!"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextWrapped = true
statusLabel.Parent = backgroundFrame

-- Start button
local textButton = Instance.new("TextButton")
textButton.Size = UDim2.new(0, 120, 0, 30)
textButton.Position = UDim2.new(0.5, -60, 1, -40)
textButton.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
textButton.Text = "Start Tween"
textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton.TextSize = 16
textButton.Font = Enum.Font.GothamBold
textButton.Parent = backgroundFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = textButton

local btnGradient = Instance.new("UIGradient")
btnGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 120, 200))
}
btnGradient.Rotation = 45
btnGradient.Parent = textButton

-- === DRAGGABLE FUNCTIONALITY ===
local dragging = false
local dragStart = nil
local startPos = nil

backgroundFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = backgroundFrame.Position
    end
end)

backgroundFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        backgroundFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- === FUNCTION TO UPDATE STATUS LABEL ===
local function updateStatus(text)
    statusLabel.Text = text
end

-- === RESET STATUS ON CHARACTER RESPAWN ===
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    hrp = newCharacter:WaitForChild("HumanoidRootPart")
    updateStatus("Idle")
end)

-- === MOVEMENT SCRIPT ===
local function FindDelivery()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then
        warn("Plots folder not found in workspace")
        return
    end
    for _, plot in pairs(plots:GetChildren()) do
        local sign = plot:FindFirstChild("PlotSign")
        if sign then
            local yourBase = sign:FindFirstChild("YourBase")
            if yourBase and yourBase.Enabled then
                local hitbox = plot:FindFirstChild("DeliveryHitbox")
                if hitbox then return hitbox end
            end
        end
    end
    warn("No valid DeliveryHitbox found")
end

local function setupFlight()
    if hrp:FindFirstChild("FlightAttachment") then
        hrp.FlightAttachment:Destroy()
    end
    if hrp:FindFirstChildOfClass("LinearVelocity") then
        hrp:FindFirstChildOfClass("LinearVelocity"):Destroy()
    end

    local attachment = Instance.new("Attachment")
    attachment.Name = "FlightAttachment"
    attachment.Parent = hrp

    local lv = Instance.new("LinearVelocity")
    lv.Attachment0 = attachment
    lv.RelativeTo = Enum.ActuatorRelativeTo.World
    lv.MaxForce = math.huge
    lv.Name = "FlightVelocity"
    lv.Parent = hrp
    return lv, attachment
end

local function moveToDelivery()
    local targetHitbox = FindDelivery()
    if not targetHitbox then
        warn("No target to move towards")
        updateStatus("No delivery target found")
        return
    end

    for _, obj in ipairs(hrp:GetChildren()) do
        if obj:IsA("LinearVelocity") or obj:IsA("Attachment") then
            obj:Destroy()
        end
    end

    local lv, attachment = setupFlight()
    local currentY = hrp.Position.Y
    updateStatus("Flying to delivery...")
    hrp.CFrame = hrp.CFrame + Vector3.new(0, 0, 0)
    task.wait(0.2)

    local speed = 65
    
    local reached = false
    local maxTime = 8
    local startTime = tick()

    local connection
    connection = RunService.Heartbeat:Connect(function()
        if not isMoving then
            lv.VectorVelocity = Vector3.zero
            lv:Destroy()
            connection:Disconnect()
            return
        end

        if not targetHitbox or not targetHitbox:IsDescendantOf(workspace) then
            warn("Target lost during flight")
            updateStatus("Delivery target lost")
            lv.VectorVelocity = Vector3.zero
            lv:Destroy()
            connection:Disconnect()
            reached = true
            return
        end

        local targetPos = targetHitbox.Position - Vector3.new(0, 6, 0) -- Adjusted to 6 studs below
        local direction = (targetPos - hrp.Position)
        local distance = direction.Magnitude

        if distance <= 0.5 then
            updateStatus("Reached delivery target, distance: " .. distance)
            lv.VectorVelocity = Vector3.zero
            lv:Destroy()
            connection:Disconnect()
            reached = true
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
                updateStatus("PlatformStand disabled")
            end
            return
        end

        if tick() - startTime >= maxTime then
            warn("Timeout before reaching delivery target")
            updateStatus("Timeout during delivery")
            lv.VectorVelocity = Vector3.zero
            lv:Destroy()
            connection:Disconnect()
            reached = true
            return
        end

        local unitDir = direction.Unit
        lv.VectorVelocity = Vector3.new(unitDir.X * speed, unitDir.Y * speed, unitDir.Z * speed)
        updateStatus("Moving to delivery, distance: " .. distance)
    end)

    while not reached do
        task.wait(0.12)
    end

    if not isMoving then return end

    updateStatus("Starting smooth deceleration for delivery")
    lv, attachment = setupFlight()
    for i = 1, 12 do
        if not isMoving then break end
        speed = speed * 0.6
        local dir = (targetHitbox.Position - Vector3.new(0, 6, 0) - hrp.Position) -- Adjusted to 6 studs below
        if dir.Magnitude > 0 then
            dir = dir.Unit
            lv.VectorVelocity = Vector3.new(dir.X * speed, dir.Y * speed, dir.Z * speed)
            updateStatus("Decelerating for delivery, iteration: " .. i)
        else
            lv.VectorVelocity = Vector3.zero
        end
        task.wait(0.05)
    end
    lv:Destroy()

    if not isMoving then return end

    updateStatus("Starting smooth descent for delivery")
    lv, attachment = setupFlight()
    local targetY = targetHitbox.Position.Y - 6 + 2.5 -- Adjusted to 6 studs below, plus original 2.5 offset
    local reachedY = false
    connection = RunService.Heartbeat:Connect(function()
        if not isMoving then
            lv.VectorVelocity = Vector3.zero
            lv:Destroy()
            connection:Disconnect()
            reachedY = true
            return
        end

        if hrp.Position.Y <= targetY then
            lv.VectorVelocity = Vector3.zero
            lv:Destroy()
            connection:Disconnect()
            reachedY = true
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
                updateStatus("PlatformStand disabled")
            end
            return
        end
        lv.VectorVelocity = Vector3.new(0, -speed, 0)
        updateStatus("Descending for delivery, current Y: " .. hrp.Position.Y)
    end)

    while not reachedY do
        task.wait(0.05)
    end

    updateStatus("Cleaning up delivery objects")
    task.delay(0.5, function()
        if attachment then attachment:Destroy() end
        if isMoving then
            updateStatus("Idle")
            isMoving = false
            textButton.Text = "Start Process"
        end
    end)
end

local function getLaserCenter(model)
    if not model:IsA("Model") then return nil end
    local primary = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
    if not primary then return nil end
    return primary.Position
end

local function isSizeClose(partSize, targetSize, tolerance)
    return math.abs(partSize.X - targetSize.X) <= tolerance
        and math.abs(partSize.Y - targetSize.Y) <= tolerance
        and math.abs(partSize.Z - targetSize.Z) <= tolerance
end

local function getTargetForFloor(level, fromThirdFloor)
    local closestTarget, closestDistance = nil, math.huge

    for _, plot in ipairs(workspace:WaitForChild("Plots"):GetChildren()) do
        if level == 1 then
            local laserFolder = plot:FindFirstChild("Laser")
            if laserFolder then
                for _, laser in ipairs(laserFolder:GetChildren()) do
                    if laser:IsA("Model") then
                        local pos = getLaserCenter(laser)
                        if pos and pos.Y <= 8 then
                            local dist = (pos - hrp.Position).Magnitude
                            if dist < closestDistance then
                                closestDistance = dist
                                closestTarget = laser
                            end
                        end
                    end
                end
            end
        elseif level == 2 then
            if not fromThirdFloor then
                local modelFolder = plot:FindFirstChild("Model")
                local foundInitialTarget = false
                if modelFolder then
                    for _, obj in ipairs(modelFolder:GetChildren()) do
                        if obj:IsA("BasePart") and isSizeClose(obj.Size, Vector3.new(5, 1, 1), 0.01) then
                            local dist = (obj.Position - hrp.Position).Magnitude
                            if dist < 5 then -- Check if within 50 studs
                                if dist < closestDistance then
                                    closestDistance = dist
                                    closestTarget = obj
                                    foundInitialTarget = true
                                end
                            end
                        end
                    end
                end
                if not foundInitialTarget then
                    local decorations = plot:FindFirstChild("Decorations")
                    if decorations then
                        for _, obj in ipairs(decorations:GetChildren()) do
                            if obj:IsA("BasePart") and isSizeClose(obj.Size, Vector3.new(45, 45, 2), 0.01) then
                                local posY = obj.Position.Y
                                if posY >= 8 and posY <= 9.1 then
                                    local dist = (obj.Position - hrp.Position).Magnitude
                                    if dist < closestDistance then
                                        closestDistance = dist
                                        closestTarget = obj
                                    end
                                end
                            end
                        end
                    end
                end
            else
                local decorations = plot:FindFirstChild("Decorations")
                if decorations then
                    for _, obj in ipairs(decorations:GetChildren()) do
                        if obj:IsA("BasePart") and isSizeClose(obj.Size, Vector3.new(17, 10, 2), 0.01) then
                            local dist = (obj.Position - hrp.Position).Magnitude
                            if dist < closestDistance then
                                closestDistance = dist
                                closestTarget = obj
                            end
                        end
                    end
                end
            end
        elseif level == 3 then
            local laserHitboxFolder = plot:FindFirstChild("LaserHitbox")
            if laserHitboxFolder then
                local thirdFloorPart = laserHitboxFolder:FindFirstChild("ThirdFloor")
                if thirdFloorPart then
                    local dist = (thirdFloorPart.Position - hrp.Position).Magnitude
                    if dist < closestDistance then
                        closestDistance = dist
                        closestTarget = thirdFloorPart
                    end
                end
            end
        end
    end
    
    return closestTarget
end

local function getTargetPosition(target)
    if target:IsA("Model") then
        return getLaserCenter(target)
    elseif target:IsA("BasePart") then
        local pos = target.Position
        -- Adjust position for level 2 large part (fromThirdFloor = true)
        if isSizeClose(target.Size, Vector3.new(17, 10, 2), 0.01) then
            local zOffset = hrp.Position.X > -410 and 5 or -5
            pos = pos + Vector3.new(0, 0, zOffset)
        end
        return pos
    else
        return nil
    end
end

local function moveUntil(conditionFunc, directionFunc, callback)
    local speed = 67
    local conn
    conn = RunService.Heartbeat:Connect(function()
        if not isMoving then
            hrp.Velocity = Vector3.zero
            conn:Disconnect()
            return
        end

        if conditionFunc() then
            hrp.Velocity = Vector3.zero
            conn:Disconnect()
            if callback then callback() end
        else
            local dir = directionFunc()
            if dir.Magnitude > 0 then
                dir = dir.Unit
                hrp.Velocity = Vector3.new(dir.X * speed, hrp.Velocity.Y, dir.Z * speed)
            else
                hrp.Velocity = Vector3.zero
            end
        end
    end)
end

local function moveUntilLinear(conditionFunc, directionFunc, callback)
    local lv, attachment = setupFlight()
    local speed = 80
    local currentY = hrp.Position.Y
    local level = currentY <= 8 and 1 or (currentY <= 24 and 2 or 3)
    if level == 2 then
        speed = 50 -- Set speed to 50 for second floor movement to X = -410
    end
    local conn
    conn = RunService.Heartbeat:Connect(function()
        if not isMoving then
            lv.VectorVelocity = Vector3.zero
            lv:Destroy()
            attachment:Destroy()
            conn:Disconnect()
            return
        end

        if conditionFunc() then
            lv.VectorVelocity = Vector3.zero
            lv:Destroy()
            attachment:Destroy()
            conn:Disconnect()
            if callback then callback() end
        else
            local dir = directionFunc()
            if dir.Magnitude > 0 then
                dir = dir.Unit
                lv.VectorVelocity = Vector3.new(dir.X * speed, 0, dir.Z * speed)
            else
                lv.VectorVelocity = Vector3.zero
            end
        end
    end)
end

local function moveToTarget(target, level, fromThirdFloor)
    local pos = getTargetPosition(target)
    if not pos then
        warn("Invalid target position")
        updateStatus("Invalid target")
        isMoving = false
        textButton.Text = "Start Process"
        return
    end

    local tolerance = 0.5  -- Допуск для проверки позиции
    updateStatus("Moving to target at " .. tostring(pos))
    moveUntil(
        function()
            if level == 1 or (level == 2 and fromThirdFloor) then
                local charPos = hrp.Position
                local dx = math.abs(charPos.X - pos.X)
                local dz = math.abs(charPos.Z - pos.Z)
                local reached = dx < tolerance and dz < tolerance
                if reached then
                    updateStatus("Reached target center on floor " .. level)
                end
                return reached
            elseif level == 2 then
                local distance = (hrp.Position - pos).Magnitude
                local reachedInitial = distance < 6
                if reachedInitial then
                    updateStatus("Within 6 studs of initial target, switching to main target")
                end
                return reachedInitial
            else
                local reached = (hrp.Position - pos).Magnitude < 1
                if reached then
                    updateStatus("Reached target on floor " .. level)
                end
                return reached
            end
        end,
        function()
            return pos - hrp.Position
        end,
        function()
            if level == 2 and not fromThirdFloor then
                local mainTarget = getTargetForFloor(2, true)
                if mainTarget then
                    updateStatus("Found main target on floor 2")
                    moveToTarget(mainTarget, 2, true)
                else
                    warn("No main target found on floor 2")
                    updateStatus("No main target found")
                    isMoving = false
                    textButton.Text = "Start Process"
                end
            elseif level == 3 then
                updateStatus("Waiting for fall from third floor")
                local startY = hrp.Position.Y
                local conn
                conn = RunService.Heartbeat:Connect(function()
                    if hrp.Position.Y < startY - 1 then
                        conn:Disconnect()
                        updateStatus("Falling from third floor")
                        local newTarget = getTargetForFloor(2, true)
                        if newTarget then
                            moveToTarget(newTarget, 2, true)
                        else
                            warn("No target on floor 2 after fall")
                            updateStatus("No target on floor 2")
                            isMoving = false
                            textButton.Text = "Start Process"
                        end
                    end
                end)
            else
                updateStatus("Moving to X = -410")
                moveUntilLinear(
                    function()
                        local distanceToTarget = math.abs(hrp.Position.X - (-410))
                        local reached = distanceToTarget < 1
                        local stopEarly = distanceToTarget <= 5
                        if stopEarly then
                            updateStatus("Within 50 studs of X = -410, starting delivery")
                        end
                        return reached or stopEarly
                    end,
                    function()
                        return Vector3.new(hrp.Position.X > -410 and -1 or 1, 0, 0)
                    end,
                    function()
                        updateStatus("Starting delivery")
                        moveToDelivery()
                    end
                )
            end
        end
    )
end

-- === ANTI HIT FUNCTION ===
local function enableAntiHit()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRoot = character:WaitForChild("HumanoidRootPart")
    local webName = "Web Slinger"
    local remote = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RE/UseItem")
    local buyRemote = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RF/CoinsShopService/RequestBuy")

    local function getWebTool()
        for _, tool in ipairs(player.Backpack:GetChildren()) do
            if tool:IsA("Tool") and tool.Name == webName then
                return tool
            end
        end
        return nil
    end

    local function ensureWebTool()
        if not getWebTool() then
            buyRemote:InvokeServer(webName)
        end
    end

    local function equipWebSlinger()
        local currentTool = character:FindFirstChildOfClass("Tool")
        if currentTool and currentTool.Name ~= webName then
            currentTool.Parent = player.Backpack
        end
        local tool = getWebTool()
        if tool then
            tool.Parent = character
        end
    end

    local function useWebSlinger()
        local tool = character:FindFirstChild(webName)
        if tool and tool:FindFirstChild("Handle") then
            local args = {
                vector.create(-391.2049865722656, -7.293223857879639, 124.80510711669922),
                character:WaitForChild("UpperTorso")
            }
            remote:FireServer(unpack(args))
        end
    end

    ensureWebTool()
    equipWebSlinger()
    useWebSlinger()
end

-- Функция для работы с Invisibility Cloak
local function useInvisibilityCloak()
    local cloakName = "Invisibility Cloak"
    local buyRemote = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RF/CoinsShopService/RequestBuy")

    local function getCloakInBackpack()
        return player.Backpack:FindFirstChild(cloakName)
    end

    local function getCloakEquipped()
        return character:FindFirstChild(cloakName)
    end

    if not getCloakInBackpack() and not getCloakEquipped() then
        updateStatus("Buying Invisibility Cloak...")
        buyRemote:InvokeServer(cloakName)
        task.wait(0.5)
    end

    local cloak = getCloakInBackpack()
    if cloak then
        cloak.Parent = character
        updateStatus("Equipped Invisibility Cloak")
        task.wait(0.2)
    end

    cloak = getCloakEquipped()
    if cloak then
        for i = 1, 2 do
            cloak:Activate()
            updateStatus("Activated cloak (" .. i .. "/2)")
            task.wait(0.5)
        end
    else
        warn("Failed to equip or activate Invisibility Cloak")
        updateStatus("Cloak not found in character")
    end
end

-- Функция для проверки угла руки
local function checkArmRotation()
    if not character then return end
    local leftArm = character:FindFirstChild("LeftUpperArm")
    if not leftArm then return end
    
    return math.deg(leftArm.Orientation.X) > 60
end

-- Функция для обработки ProximityPrompt
local function handlePromptTriggered(prompt)
    if isActive and not promptTriggered then
        promptTriggered = true
        updateStatus("Prompt triggered, activating anti-hit...")
        enableAntiHit()
    end
end

-- Основная функция запуска процесса
local function startProcess()
    if isMoving then
        isMoving = false
        textButton.Text = "Start Process"
        updateStatus("Process canceled")
        return
    end

    isActive = true
    promptTriggered = false
    textButton.Text = "Waiting for prompt..."
    updateStatus("Waiting for proximity prompt...")

    useInvisibilityCloak()

    promptConnection = ProximityPromptService.PromptTriggered:Connect(handlePromptTriggered)

    armCheckConnection = RunService.Heartbeat:Connect(function()
        if not isActive then
            armCheckConnection:Disconnect()
            return
        end

        if promptTriggered and checkArmRotation() then
            isMoving = true
            isActive = false
            textButton.Text = "Cancel"
            
            if promptConnection then
                promptConnection:Disconnect()
                promptConnection = nil
            end
            
            if armCheckConnection then
                armCheckConnection:Disconnect()
                armCheckConnection = nil
            end

            updateStatus("Starting process")
            local currentY = hrp.Position.Y
            local level = currentY <= 8 and 1 or (currentY <= 24 and 2 or 3)
            updateStatus("Current floor: " .. level)
            local target = getTargetForFloor(level, false)
            if target then
                updateStatus("Found target for floor " .. level)
                moveToTarget(target, level, false)
            else
                warn("No target found for floor: " .. level)
                updateStatus("No target found")
                isMoving = false
                textButton.Text = "Start Process"
            end
        end
    end)
end

textButton.MouseButton1Click:Connect(function()
    if isMoving then
        isMoving = false
        isActive = false
        textButton.Text = "Start Process"
        updateStatus("Process canceled")
        
        if promptConnection then
            promptConnection:Disconnect()
            promptConnection = nil
        end
        
        if armCheckConnection then
            armCheckConnection:Disconnect()
            armCheckConnection = nil
        end
    else
        startProcess()
    end
end)
