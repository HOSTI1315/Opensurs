-- Platin Presents
-- crusty hub
-- light hub instant tp source
-- discord: platinv

local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local savedCFrame = nil
local tpEnabled = false
local godModeEnabled = false
local function antiKick()
    for _,v in pairs(getconnections(player.Idled)) do
        v:Disable()
    end
    game:GetService("ScriptContext").Error:Connect(function() return end)
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "kick" or method == "Kicked" or method == "kicked" then
            return nil
        end
        return old(self, ...)
    end)
end
antiKick()

local gui = Instance.new("ScreenGui")
gui.Name = "InstaStealHUD"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 200) 
frame.Position = UDim2.new(0.5, -140, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45) 
frame.BorderSizePixel = 0
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(120, 120, 120)
stroke.Thickness = 2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame

local shadow = Instance.new("ImageLabel")
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.8
shadow.Size = UDim2.new(1, 24, 1, 24)
shadow.Position = UDim2.new(0, -12, 0, -12)
shadow.BackgroundTransparency = 1
shadow.ZIndex = 0
shadow.Parent = frame
frame.ZIndex = 1

local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, -20, 0, 28)
header.Position = UDim2.new(0, 10, 0, 8)
header.BackgroundTransparency = 1
header.Text = "Instant Steal (by Light Hub)"
header.Font = Enum.Font.GothamBold
header.TextSize = 16
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.Parent = frame

local function createButton(text, y)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -30, 0, 38)
	btn.Position = UDim2.new(0, 15, 0, y)
	btn.Text = text
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	btn.BorderSizePixel = 0
	btn.Parent = frame

	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
	end)
	btn.MouseLeave:Connect(function()
		if not (btn == tpBtn and tpEnabled) then
			btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
		end
	end)

	return btn
end

local setBtn = createButton("Set Checkpoint", 45)
local tpBtn = createButton("TP: OFF", 90)

local desyncBtn = Instance.new("TextButton")
desyncBtn.Size = UDim2.new(0, 140, 0, 28)
desyncBtn.Position = UDim2.new(0.5, -70, 0, 135)
desyncBtn.Text = "Desync"
desyncBtn.Font = Enum.Font.GothamBold
desyncBtn.TextSize = 13
desyncBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
desyncBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
desyncBtn.BorderSizePixel = 0
desyncBtn.Parent = frame

Instance.new("UICorner", desyncBtn).CornerRadius = UDim.new(0, 8)

desyncBtn.MouseEnter:Connect(function()
	desyncBtn.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
end)
desyncBtn.MouseLeave:Connect(function()
	desyncBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
end)

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -20, 0, 20)
info.Position = UDim2.new(0, 10, 1, -24)
info.BackgroundTransparency = 1
info.Text = "Need a Flying Carpet/WitchBroom\n or Santa Sleight"
info.Font = Enum.Font.GothamMedium
info.TextSize = 12
info.TextColor3 = Color3.fromRGB(80, 80, 80)
info.Parent = frame

local function activateGodMode()
    local getconnections = getconnections
    local godConnections = {}
    local godHeartbeat

    local function apply(character)
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end

        humanoid.BreakJointsOnDeath = false
        humanoid.RequiresNeck = false

        if getconnections then
            for _, connection in ipairs(getconnections(humanoid.Died)) do
                connection:Disable()
                table.insert(godConnections, connection)
            end
        end

        table.insert(godConnections, humanoid:GetPropertyChangedSignal("Health"):Connect(function()
            if humanoid.Health < humanoid.MaxHealth then
                humanoid.Health = humanoid.MaxHealth
            end
        end))

        godHeartbeat = RunService.Heartbeat:Connect(function()
            if humanoid and humanoid.Health < humanoid.MaxHealth then
                humanoid.Health = humanoid.MaxHealth
            end
        end)
    end

    apply(player.Character or player.CharacterAdded:Wait())
    table.insert(godConnections, player.CharacterAdded:Connect(function(character)
        task.wait(0.5)
        apply(character)
    end))
end

setBtn.MouseButton1Click:Connect(function()
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		savedCFrame = char.HumanoidRootPart.CFrame
	end
end)

tpBtn.MouseButton1Click:Connect(function()
	tpEnabled = not tpEnabled
	tpBtn.Text = tpEnabled and "TP: ON" or "TP: OFF"
	tpBtn.BackgroundColor3 = tpEnabled
		and Color3.fromRGB(0, 170, 255)
		or Color3.fromRGB(70, 70, 70)
end)

desyncBtn.MouseButton1Click:Connect(function()
    local flags = {
        {"GameNetPVHeaderRotationalVelocityZeroCutoffExponent", "-5000"},
        {"LargeReplicatorWrite5", "true"},
        {"LargeReplicatorEnabled9", "true"},
        {"AngularVelociryLimit", "360"},
        {"TimestepArbiterVelocityCriteriaThresholdTwoDt", "2147483646"},
        {"S2PhysicsSenderRate", "15000"},
        {"DisableDPIScale", "true"},
        {"MaxDataPacketPerSend", "2147483647"},
        {"ServerMaxBandwith", "52"},
        {"PhysicsSenderMaxBandwidthBps", "20000"},
        {"MaxTimestepMultiplierBuoyancy", "2147483647"},
        {"SimOwnedNOUCountThresholdMillionth", "2147483647"},
        {"MaxMissedWorldStepsRemembered", "-2147483648"},
        {"CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth", "1"},
        {"StreamJobNOUVolumeLengthCap", "2147483647"},
        {"DebugSendDistInSteps", "-2147483648"},
        {"MaxTimestepMultiplierAcceleration", "2147483647"},
        {"LargeReplicatorRead5", "true"},
        {"SimExplicitlyCappedTimestepMultiplier", "2147483646"},
        {"GameNetDontSendRedundantNumTimes", "1"},
        {"CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent", "1"},
        {"CheckPVCachedRotVelThresholdPercent", "10"},
        {"LargeReplicatorSerializeRead3", "true"},
        {"ReplicationFocusNouExtentsSizeCutoffForPauseStuds", "2147483647"},
        {"NextGenReplicatorEnabledWrite4", "true"},
        {"CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth", "1"},
        {"GameNetDontSendRedundantDeltaPositionMillionth", "1"},
        {"InterpolationFrameVelocityThresholdMillionth", "5"},
        {"StreamJobNOUVolumeCap", "2147483647"},
        {"InterpolationFrameRotVelocityThresholdMillionth", "5"},
        {"WorldStepMax", "30"},
        {"TimestepArbiterHumanoidLinearVelThreshold", "1"},
        {"InterpolationFramePositionThresholdMillionth", "5"},
        {"TimestepArbiterHumanoidTurningVelThreshold", "1"},
        {"MaxTimestepMultiplierContstraint", "2147483647"},
        {"GameNetPVHeaderLinearVelocityZeroCutoffExponent", "-5000"},
        {"CheckPVCachedVelThresholdPercent", "10"},
        {"TimestepArbiterOmegaThou", "1073741823"},
        {"MaxAcceptableUpdateDelay", "1"},
        {"LargeReplicatorSerializeWrite4", "true"},
    }

    for _, data in ipairs(flags) do
        pcall(function()
            if setfflag then
                setfflag(data[1], data[2])
            end
        end)
    end

    local char = player.Character
    if not char then return end

    local humanoid = char:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Dead)
    end

    char:ClearAllChildren()

    local fakeModel = Instance.new("Model", workspace)
    player.Character = fakeModel
    task.wait()
    player.Character = char
    fakeModel:Destroy()
end)

ProximityPromptService.PromptButtonHoldEnded:Connect(function(prompt, who)
	if who ~= player then return end
	if not tpEnabled or not savedCFrame then return end

	if prompt.Name == "Steal" or prompt.ActionText == "Steal" then
		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			char.HumanoidRootPart.CFrame = savedCFrame
            if not godModeEnabled then
                godModeEnabled = true
                activateGodMode()
            end
		end
	end
end)

local dragging = false
local dragStart
local startPos

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

frame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)