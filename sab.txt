op Steal a Brainrot script, und float script(proxy arms, no roleback with brainrot)
side tp is D with brainrot so dont use!!!! also model fling is basically a trash antihit so ye.
added new go to spawn button, works for anyspeed under 32, AND 32


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Create or reuse GUI
local screenGui = player:WaitForChild("PlayerGui"):FindFirstChild("CustomGUI")
if not screenGui then
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CustomGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")
end

-- Main frame
local frame = screenGui:FindFirstChild("MainFrame")
if not frame then
    frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.Size = UDim2.new(0, 400, 0, 400)
    frame.Position = UDim2.new(0.3, 0, -0.5, 0)
    frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    frame.Active = true
    frame.Draggable = true
    frame.Visible = true
    frame.ClipsDescendants = true
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame
end

local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Open/Close GUI
local function openGUI()
    TweenService:Create(frame, tweenInfo, {Position = UDim2.new(0.3, 0, 0.3, 0)}):Play()
end
local function closeGUI()
    TweenService:Create(frame, tweenInfo, {Position = UDim2.new(0.3, 0, -0.5, 0)}):Play()
end

-- Title
local title = frame:FindFirstChild("Title")
if not title then
    title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -10, 0, 40)
    title.Position = UDim2.new(0, 5, 0, 5)
    title.BackgroundTransparency = 1
    title.Text = "Utility GUI"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Parent = frame
end

-- Page arrow
local pageArrow = frame:FindFirstChild("PageArrow")
if not pageArrow then
    pageArrow = Instance.new("TextButton")
    pageArrow.Name = "PageArrow"
    pageArrow.Size = UDim2.new(0, 30, 0, 30)
    pageArrow.Position = UDim2.new(1, -35, 0, 5)
    pageArrow.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    pageArrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    pageArrow.Text = "→"
    pageArrow.Font = Enum.Font.GothamBold
    pageArrow.TextSize = 18
    pageArrow.Parent = frame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = pageArrow
end

-- Pages
local mainPage = Instance.new("Frame")
mainPage.Size = UDim2.new(1, 0, 1, 0)
mainPage.Position = UDim2.new(0, 0, 0, 0)
mainPage.BackgroundTransparency = 1
mainPage.Parent = frame

local settingsPage = Instance.new("Frame")
settingsPage.Size = UDim2.new(1, 0, 1, 0)
settingsPage.Position = UDim2.new(1, 0, 0, 0)
settingsPage.BackgroundTransparency = 1
settingsPage.Parent = frame

-- Page toggle
local currentPage = "Main"
local function updatePageVisibility()
    for _, btn in ipairs(mainPage:GetChildren()) do
        if btn:IsA("TextButton") then btn.Visible = (currentPage == "Main") end
    end
    for _, btn in ipairs(settingsPage:GetChildren()) do
        if btn:IsA("TextButton") or btn:IsA("TextLabel") then
            btn.Visible = (currentPage == "Settings")
        end
    end
end

pageArrow.MouseButton1Click:Connect(function()
    if currentPage == "Main" then
        currentPage = "Settings"
        pageArrow.Text = "←"
        TweenService:Create(mainPage, tweenInfo, {Position = UDim2.new(-1, 0, 0, 0)}):Play()
        TweenService:Create(settingsPage, tweenInfo, {Position = UDim2.new(0, 0, 0, 0)}):Play()
    else
        currentPage = "Main"
        pageArrow.Text = "→"
        TweenService:Create(mainPage, tweenInfo, {Position = UDim2.new(0, 0, 0, 0)}):Play()
        TweenService:Create(settingsPage, tweenInfo, {Position = UDim2.new(1, 0, 0, 0)}):Play()
    end
    updatePageVisibility()
end)

-- Helper functions
local function darkenColor(color, factor)
    factor = factor or 0.7
    return Color3.new(color.R * factor, color.G * factor, color.B * factor)
end

local function makeButton(text, parent, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 35)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.BackgroundColor3 = darkenColor(frame.BackgroundColor3, 0.7)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 18
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    return btn
end

-- Scrollable main page
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 1, -60)
scrollFrame.Position = UDim2.new(0, 10, 0, 50)
scrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
scrollFrame.ScrollBarThickness = 10
scrollFrame.BackgroundTransparency = 1
scrollFrame.Parent = mainPage

-- Feature variables
local runningFollower, block, connFollower = false, nil, nil
local stayActive, dummyModel, dummyParts, connStay, savedParts = false, nil, {}, nil, {}
local teleportActive, teleportCoroutine = false, nil
local zigzagActive, zigzagCoroutine = false, nil
local proxyArmActive, proxyPart, armWelds, proxyDistance, armSpeed = false, nil, {}, 6, 25
local spawnPoint = nil
local goSpeed = 25
local gotoActive, gotoCoroutine = false, nil

-- Buttons in scroll frame
local buttons = {}
buttons.blockBtn = makeButton("Toggle Block Follower", scrollFrame, 0)
buttons.stayBtn = makeButton("Toggle Stay Model Fling", scrollFrame, 50)
buttons.teleportBtn = makeButton("Toggle Teleport 1 Stud", scrollFrame, 100)
buttons.zigzagBtn = makeButton("Toggle Zigzag Teleport", scrollFrame, 150)
buttons.proxyArmBtn = makeButton("Toggle Proxy Arms", scrollFrame, 200)
buttons.proxySliderBtn = makeButton("Proxy Arms Slider", scrollFrame, 250)
buttons.goSpawnBtn = makeButton("Go To Spawn Controls", scrollFrame, 300)
buttons.resetBtn = makeButton("Reset Character", scrollFrame, 350)
buttons.closeBtn = makeButton("Close GUI", scrollFrame, 400)

-- Functionality
local function enableProxyArms()
    if proxyArmActive then return end
    proxyArmActive = true
    proxyPart = Instance.new("Part")
    proxyPart.Size = Vector3.new(2, 2, 1)
    proxyPart.Anchored = false
    proxyPart.CanCollide = false
    proxyPart.Transparency = 1
    proxyPart.CFrame = hrp.CFrame + hrp.CFrame.LookVector * proxyDistance
    proxyPart.Parent = workspace
    local leftArm = char:FindFirstChild("LeftUpperArm") or char:FindFirstChild("Left Arm")
    local rightArm = char:FindFirstChild("RightUpperArm") or char:FindFirstChild("Right Arm")
    for _, arm in pairs({leftArm, rightArm}) do
        if arm then
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = arm
            weld.Part1 = proxyPart
            weld.Parent = arm
            table.insert(armWelds, weld)
        end
    end
    RunService.RenderStepped:Connect(function()
        if proxyArmActive and proxyPart then
            local move = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + proxyPart.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - proxyPart.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - proxyPart.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + proxyPart.CFrame.RightVector end
            proxyPart.Velocity = (move.Magnitude > 0) and move.Unit * armSpeed or Vector3.new(0,0,0)
        end
    end)
end

local function disableProxyArms()
    if not proxyArmActive then return end
    proxyArmActive = false
    if proxyPart then proxyPart:Destroy() proxyPart=nil end
    for _, weld in pairs(armWelds) do weld:Destroy() end
    armWelds = {}
end

-- Proxy Arms Slider
buttons.proxySliderBtn.MouseButton1Click:Connect(function()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ProxySliderGUI"
    gui.ResetOnSpawn = false
    gui.Parent = player.PlayerGui

    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(0, 250, 0, 100)
    sliderFrame.Position = UDim2.new(0.5, -125, 0.5, -50)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)
    sliderFrame.Active = true
    sliderFrame.Draggable = true
    sliderFrame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = sliderFrame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 30)
    label.Position = UDim2.new(0, 10, 0, 10)
    label.BackgroundTransparency = 1
    label.Text = "Proxy Arm Speed: "..armSpeed
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 16
    label.Parent = sliderFrame

    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(1, -20, 0, 20)
    slider.Position = UDim2.new(0, 10, 0, 60)
    slider.BackgroundColor3 = Color3.fromRGB(100,100,100)
    slider.Parent = sliderFrame

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(math.clamp(armSpeed/50,0,1),0,1,0)
    fill.BackgroundColor3 = Color3.fromRGB(200,200,50)
    fill.Parent = slider

    local drag = false
    slider.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 then drag=true end
    end)
    slider.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end
    end)
    slider.InputChanged:Connect(function(input)
        if drag and input.UserInputType==Enum.UserInputType.MouseMovement then
            local mouseX = UserInputService:GetMouseLocation().X
            local sliderPos = slider.AbsolutePosition.X
            local sliderSize = slider.AbsoluteSize.X
            local percent = math.clamp((mouseX - sliderPos)/sliderSize,0,1)
            fill.Size = UDim2.new(percent,0,1,0)
            armSpeed = math.floor(percent*50)
            label.Text = "Proxy Arm Speed: "..armSpeed
        end
    end)
end)

-- Go To Spawn GUI
buttons.goSpawnBtn.MouseButton1Click:Connect(function()
    local existing = player.PlayerGui:FindFirstChild("GoToSpawnGUI")
    if existing then existing:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "GoToSpawnGUI"
    gui.ResetOnSpawn = false
    gui.Parent = player.PlayerGui

    local frameG = Instance.new("Frame")
    frameG.Size = UDim2.new(0, 300, 0, 180)
    frameG.Position = UDim2.new(0.5, -150, 0.5, -90)
    frameG.BackgroundColor3 = Color3.fromRGB(50,50,50)
    frameG.Active = true
    frameG.Draggable = true
    frameG.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,10)
    corner.Parent = frameG

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 25)
    label.Position = UDim2.new(0,10,0,10)
    label.BackgroundTransparency = 1
    label.Text = "Go To Spawn Speed: "..goSpeed
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 16
    label.Parent = frameG

    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(1, -20, 0, 20)
    slider.Position = UDim2.new(0,10,0,50)
    slider.BackgroundColor3 = Color3.fromRGB(100,100,100)
    slider.Parent = frameG

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(math.clamp(goSpeed/50,0,1),0,1,0)
    fill.BackgroundColor3 = Color3.fromRGB(200,200,50)
    fill.Parent = slider

    local drag = false
    slider.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 then drag=true end
    end)
    slider.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end
    end)
    slider.InputChanged:Connect(function(input)
        if drag and input.UserInputType==Enum.UserInputType.MouseMovement then
            local mouseX = UserInputService:GetMouseLocation().X
            local sliderPos = slider.AbsolutePosition.X
            local sliderSize = slider.AbsoluteSize.X
            local percent = math.clamp((mouseX - sliderPos)/sliderSize,0,1)
            fill.Size = UDim2.new(percent,0,1,0)
            goSpeed = math.floor(percent*50)
            label.Text = "Go To Spawn Speed: "..goSpeed
        end
    end)

    -- Buttons: Set Point, Go, Close
    local yPos = 80
    local function makeSpawnButton(text)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -20, 0, 35)
        btn.Position = UDim2.new(0, 10, 0, yPos)
        btn.BackgroundColor3 = Color3.fromRGB(80,80,80)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Text = text
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 16
        btn.Parent = frameG
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0,8)
        corner.Parent = btn
        yPos = yPos + 45
        return btn
    end

    local setPointBtn = makeSpawnButton("Set Spawn Point")
    local goBtn = makeSpawnButton("Go To Spawn")
    local closeBtn = makeSpawnButton("Close")

    setPointBtn.MouseButton1Click:Connect(function()
        spawnPoint = hrp.Position
    end)

    goBtn.MouseButton1Click:Connect(function()
        if not spawnPoint then return end
        gotoActive = not gotoActive
        if gotoActive then
            gotoCoroutine = coroutine.create(function()
                while gotoActive do
                    if hrp then
                        local dir = (spawnPoint - hrp.Position).Unit
                        hrp.Velocity = dir * goSpeed
                    end
                    task.wait(0.05)
                end
            end)
            coroutine.resume(gotoCoroutine)
        else
            gotoCoroutine = nil
        end
    end)

    closeBtn.MouseButton1Click:Connect(function()
        gotoActive=false
        if gotoCoroutine then gotoCoroutine=nil end
        gui:Destroy()
    end)
end)

-- Connect main buttons
buttons.blockBtn.MouseButton1Click:Connect(function() 
    -- Follower toggle
    if runningFollower then
        runningFollower=false
        if connFollower then connFollower:Disconnect() end
        if block then block:Destroy() end
    else
        runningFollower=true
        block = Instance.new("Part")
        block.Size = Vector3.new(6,1,6)
        block.Anchored=true
        block.CanCollide=true
        block.BrickColor=BrickColor.new("Bright blue")
        block.Parent=workspace
        connFollower = RunService.Heartbeat:Connect(function()
            if hrp and block then
                block.Position = hrp.Position - Vector3.new(0, hrp.Size.Y/2 + block.Size.Y/2, 0)
            end
        end)
    end
end)
buttons.stayBtn.MouseButton1Click:Connect(function()
    stayActive = not stayActive
    if stayActive then
        savedParts={}
        dummyParts={}
        if dummyModel then dummyModel:Destroy() end
        dummyModel = Instance.new("Model",workspace)
        dummyModel.Name="StayDummy"
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                local clone = part:Clone()
                clone.Anchored=true
                clone.CanCollide=false
                clone.Parent=dummyModel
                table.insert(dummyParts,{original=part, clone=clone})
            end
        end
        connStay = RunService.Heartbeat:Connect(function()
            for _, pair in ipairs(dummyParts) do
                if pair.original and pair.clone then pair.clone.CFrame = pair.original.CFrame end
            end
        end)
    else
        if connStay then connStay:Disconnect() connStay=nil end
        if dummyModel then dummyModel:Destroy() dummyModel=nil end
    end
end)
buttons.teleportBtn.MouseButton1Click:Connect(function()
    teleportActive = not teleportActive
    if teleportActive then
        teleportCoroutine = coroutine.create(function()
            while teleportActive do
                if hrp then hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector end
                task.wait(0.75)
            end
        end)
        coroutine.resume(teleportCoroutine)
    else teleportCoroutine=nil end
end)
buttons.zigzagBtn.MouseButton1Click:Connect(function()
    zigzagActive = not zigzagActive
    if zigzagActive then
        local direction = 1
        zigzagCoroutine = coroutine.create(function()
            while zigzagActive do
                if hrp then
                    local forward = hrp.CFrame.LookVector
                    local right = hrp.CFrame.RightVector
                    local offset = (forward + right*direction).Unit * 2
                    hrp.CFrame = hrp.CFrame + offset
                end
                direction = direction * -1
                task.wait(0.6)
            end
        end)
        coroutine.resume(zigzagCoroutine)
    else zigzagCoroutine=nil end
end)
buttons.proxyArmBtn.MouseButton1Click:Connect(function()
    if proxyArmActive then disableProxyArms() else enableProxyArms() end
end)
buttons.resetBtn.MouseButton1Click:Connect(function()
    if char then char:BreakJoints() end
end)
buttons.closeBtn.MouseButton1Click:Connect(function()
    closeGUI()
    disableProxyArms()
    runningFollower=false
    stayActive=false
    teleportActive=false
    zigzagActive=false
    gotoActive=false
    if connFollower then connFollower:Disconnect() end
    if connStay then connStay:Disconnect() end
end)

-- Update character on respawn
player.CharacterAdded:Connect(function(newChar)
    char=newChar
    hrp = newChar:WaitForChild("HumanoidRootPart")
end)

-- Open GUI
openGUI()
updatePageVisibility()
