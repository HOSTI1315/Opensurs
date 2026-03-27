local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local VirtualInputManager = game:GetService("VirtualInputManager")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

local VELOCITY_SPEED = 58.1
local STEAL_SPEED = 29.3

local POSITION_L1 = Vector3.new(-476.48, -6.28, 92.73)
local POSITION_L2 = Vector3.new(-483.12, -4.95, 94.80)
local POSITION_R1 = Vector3.new(-476.16, -6.52, 25.62)
local POSITION_R2 = Vector3.new(-483.04, -5.09, 23.14)
local POSITION_L3 = Vector3.new(-474.480, -7.098, 95.407)
local POSITION_L4 = Vector3.new(-473.165, -7.098, 22.341)
local POSITION_R3 = Vector3.new(-472.409, -7.098, 25.268)
local POSITION_R4 = Vector3.new(-472.676, -7.098, 98.162)

local CARPET_SPOT_1 = CFrame.new(-402.18, -6.34, 131.83) * CFrame.Angles(0, math.rad(-20.08), 0)
local CARPET_SPOT_2 = CFrame.new(-416.66, -6.34, -2.05) * CFrame.Angles(0, math.rad(-62.89), 0)
local CARPET_SPOT_3 = CFrame.new(-329.37, -4.68, 18.12) * CFrame.Angles(0, math.rad(-30.53), 0)

local stealBoost = false
local infJumpEnabled = false
local instaGrabEnabled = false
local xrayEnabled = false
local autoWalkEnabled = false
local targetPlayerEnabled = false
local instaBlockEnabled = false
local AutoLeftEnabled = false
local AutoRightEnabled = false
local isOnPath = false
local autoLeftPhase = 1
local autoRightPhase = 1
local autoLeftConn = nil
local autoRightConn = nil
local autoWalkConn = nil
local autoWalkPhase = 1
local autoWalkSide = nil
local infJumpConn = nil
local infFallConn = nil
local jumpForce = 50
local clampFallSpeed = 80
local blockDelay = 0.7
local minDelay = 0.1
local maxDelay = 5.0
local savedAnimations = {}
local originalTransparency = {}
local xrayActive = false
local targetPlayerConn = nil

local KEYBINDS = {
	STEAL        = Enum.KeyCode.X,
	JUMP         = Enum.KeyCode.C,
	INSTAGRAB    = Enum.KeyCode.G,
	XRAY         = Enum.KeyCode.N,
	AUTOWALK     = Enum.KeyCode.V,
	TARGETPLAYER = Enum.KeyCode.B,
	INSTABLOCK   = Enum.KeyCode.F,
}

local character, humanoid, hrp
local antiKbActive = false
local antiKbConnections = {}

local function updateChar()
	character = player.Character or player.CharacterAdded:Wait()
	humanoid  = character:FindFirstChildOfClass("Humanoid")
	hrp       = character:FindFirstChild("HumanoidRootPart")
			 or character:FindFirstChild("RootPart")
			 or character:FindFirstChild("HumanoidRoot")
end

local function isValid()
	return humanoid and humanoid.Parent ~= nil
end

local function shouldBlock()
	if not humanoid then return false end
	local s = humanoid:GetState()
	if s == Enum.HumanoidStateType.Jumping or s == Enum.HumanoidStateType.Freefall or s == Enum.HumanoidStateType.Landed then return false end
	if s == Enum.HumanoidStateType.Physics or s == Enum.HumanoidStateType.Ragdoll or s == Enum.HumanoidStateType.FallingDown or s == Enum.HumanoidStateType.GettingUp then return true end
	return false
end

local function enableControls()
	pcall(function()
		local pm = player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
		require(pm):GetControls():Enable()
	end)
end

local function cleanChar()
	if not shouldBlock() then return end
	if not character then return end
	for _, desc in pairs(character:GetDescendants()) do
		if desc:IsA("BallSocketConstraint") or desc:IsA("NoCollisionConstraint") or desc:IsA("HingeConstraint") or (desc:IsA("Attachment") and (desc.Name == "A" or desc.Name == "B")) then
			pcall(function() desc:Destroy() end)
		elseif desc:IsA("BodyVelocity") or desc:IsA("BodyPosition") or desc:IsA("BodyGyro") then
			pcall(function() desc:Destroy() end)
		elseif desc:IsA("Motor6D") then
			pcall(function() desc.Enabled = true end)
		end
	end
end

local function enableAntiKb()
	if antiKbActive then return end
	antiKbActive = true
	updateChar()
	if not isValid() then return end
	if humanoid then
		table.insert(antiKbConnections, humanoid.StateChanged:Connect(function()
			if shouldBlock() then
				pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Running) end)
				cleanChar()
				pcall(function() Workspace.CurrentCamera.CameraSubject = humanoid end)
				enableControls()
			end
		end))
	end
	pcall(function()
		local pkg = ReplicatedStorage:FindFirstChild("Packages")
		if pkg then
			local net = pkg:FindFirstChild("Net")
			if net then
				local ev = net:FindFirstChild("RE/CombatService/ApplyImpulse") or net:FindFirstChild("ApplyImpulse")
				if ev and ev:IsA("RemoteEvent") then
					table.insert(antiKbConnections, ev.OnClientEvent:Connect(function()
						if shouldBlock() and hrp then
							pcall(function() hrp.AssemblyLinearVelocity = Vector3.new(0,0,0) end)
						end
					end))
				end
			end
		end
	end)
	if character then
		table.insert(antiKbConnections, character.DescendantAdded:Connect(function()
			if shouldBlock() then cleanChar() end
		end))
	end
	local lastVelocity = Vector3.new(0,0,0)
	table.insert(antiKbConnections, RunService.Heartbeat:Connect(function()
		if shouldBlock() and hrp then
			cleanChar()
			local cv = hrp.AssemblyLinearVelocity
			if (cv - lastVelocity).Magnitude > 40 and cv.Magnitude > 25 then
				pcall(function() hrp.AssemblyLinearVelocity = cv.Unit * math.min(cv.Magnitude, 15) end)
			end
			lastVelocity = cv
		else
			if hrp then lastVelocity = hrp.AssemblyLinearVelocity end
		end
	end))
	table.insert(antiKbConnections, player.CharacterAdded:Connect(function()
		task.wait(0.5)
		updateChar()
		enableControls()
		cleanChar()
	end))
	enableControls()
	cleanChar()
end

local function startUnwalk()
	local c = player.Character
	if not c then return end
	local hum = c:FindFirstChildOfClass("Humanoid")
	if hum then for _, t in ipairs(hum:GetPlayingAnimationTracks()) do t:Stop() end end
	local anim = c:FindFirstChild("Animate")
	if anim then
		savedAnimations.Animate = anim:Clone()
		anim:Destroy()
	end
end

local espFolder = Instance.new("Folder", Workspace)
espFolder.Name = "LunixCoordESP"

local PINK = Color3.fromRGB(255, 80, 180)

local function makeMarker(pos, label, color)
	local dot = Instance.new("Part", espFolder)
	dot.Name = "Marker_" .. label
	dot.Anchored = true; dot.CanCollide = false; dot.CastShadow = false
	dot.Material = Enum.Material.Neon; dot.Shape = Enum.PartType.Ball
	dot.Color = color; dot.Size = Vector3.new(1.3, 1.3, 1.3)
	dot.Position = pos; dot.Transparency = 0.15
	local bb = Instance.new("BillboardGui", dot)
	bb.AlwaysOnTop = true; bb.Size = UDim2.new(0,120,0,22)
	bb.StudsOffset = Vector3.new(0,2.8,0); bb.MaxDistance = 450
	local txt = Instance.new("TextLabel", bb)
	txt.Size = UDim2.new(1,0,1,0); txt.BackgroundTransparency = 1
	txt.Text = label; txt.TextColor3 = color
	txt.TextStrokeColor3 = Color3.new(0,0,0); txt.TextStrokeTransparency = 0
	txt.Font = Enum.Font.GothamBold; txt.TextSize = 13
	task.spawn(function()
		while dot and dot.Parent do
			TweenService:Create(dot, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency=0.6}):Play()
			task.wait(1)
			TweenService:Create(dot, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency=0.1}):Play()
			task.wait(1)
		end
	end)
end

local function makeSquareMarker(cf, label, color)
	local box = Instance.new("Part", espFolder)
	box.Name = "SqMarker_" .. label
	box.Anchored = true; box.CanCollide = false; box.CastShadow = false
	box.Material = Enum.Material.Neon; box.Shape = Enum.PartType.Block
	box.Color = color; box.Size = Vector3.new(2,2,2)
	if typeof(cf) == "CFrame" then
		box.CFrame = cf
	else
		box.Position = cf
	end
	box.Transparency = 0.2
	local sel = Instance.new("SelectionBox", box)
	sel.Adornee = box; sel.Color3 = color; sel.LineThickness = 0.04
	sel.SurfaceTransparency = 0.7; sel.SurfaceColor3 = color
	local bb = Instance.new("BillboardGui", box)
	bb.AlwaysOnTop = true; bb.Size = UDim2.new(0,140,0,22)
	bb.StudsOffset = Vector3.new(0,3,0); bb.MaxDistance = 500
	local txt = Instance.new("TextLabel", bb)
	txt.Size = UDim2.new(1,0,1,0); txt.BackgroundTransparency = 1
	txt.Text = label; txt.TextColor3 = color
	txt.TextStrokeColor3 = Color3.new(0,0,0); txt.TextStrokeTransparency = 0
	txt.Font = Enum.Font.GothamBold; txt.TextSize = 13
	task.spawn(function()
		while box and box.Parent do
			TweenService:Create(box, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency=0.65}):Play()
			task.wait(1)
			TweenService:Create(box, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency=0.1}):Play()
			task.wait(1)
		end
	end)
end

makeMarker(POSITION_L1, "L1 - GO LEFT",  Color3.fromRGB(180,80,255))
makeMarker(POSITION_L2, "L END",          Color3.fromRGB(255,80,180))
makeMarker(POSITION_R1, "R1 - GO RIGHT", Color3.fromRGB(180,80,255))
makeMarker(POSITION_R2, "R END",          Color3.fromRGB(255,80,180))
makeSquareMarker(CARPET_SPOT_1, "CARPET SPOT 1", PINK)
makeSquareMarker(CARPET_SPOT_2, "CARPET SPOT 2", PINK)
makeSquareMarker(CARPET_SPOT_3, "CARPET SPOT 3", PINK)

local ESP_COLOR = Color3.fromRGB(255, 105, 180)
local espData = {}

local tracerGui = Instance.new("ScreenGui", CoreGui)
tracerGui.Name = "LunixTracers"; tracerGui.ResetOnSpawn = false; tracerGui.DisplayOrder = 99

local tracerCanvas = Instance.new("Frame", tracerGui)
tracerCanvas.Size = UDim2.new(1,0,1,0); tracerCanvas.BackgroundTransparency = 1; tracerCanvas.BorderSizePixel = 0

local function removeESP(plr)
	if espData[plr] then
		pcall(function()
			if espData[plr].highlight and espData[plr].highlight.Parent then espData[plr].highlight:Destroy() end
			if espData[plr].billboard and espData[plr].billboard.Parent then espData[plr].billboard:Destroy() end
			if espData[plr].tracerLine and espData[plr].tracerLine.Parent then espData[plr].tracerLine:Destroy() end
		end)
		espData[plr] = nil
	end
end

local function addESP(plr)
	if plr == player then return end
	removeESP(plr)
	local tracerLine = Instance.new("Frame", tracerCanvas)
	tracerLine.Name = "Tracer_" .. plr.Name
	tracerLine.BackgroundColor3 = ESP_COLOR; tracerLine.BorderSizePixel = 0
	tracerLine.AnchorPoint = Vector2.new(0.5,0); tracerLine.Size = UDim2.new(0,1,0,0); tracerLine.Visible = false
	local function buildESP(char)
		if not char then return end
		local root = char:WaitForChild("HumanoidRootPart", 5)
		if not root then return end
		local hl = Instance.new("SelectionBox", char)
		hl.Name = "LunixESP_HL"; hl.Adornee = char; hl.Color3 = ESP_COLOR
		hl.LineThickness = 0.05; hl.SurfaceTransparency = 0.85; hl.SurfaceColor3 = ESP_COLOR
		local bb = Instance.new("BillboardGui", root)
		bb.Name = "LunixESP_BB"; bb.AlwaysOnTop = true
		bb.Size = UDim2.new(0,90,0,36); bb.StudsOffset = Vector3.new(0,3.2,0); bb.MaxDistance = 600
		local bg = Instance.new("Frame", bb)
		bg.Size = UDim2.new(1,0,1,0); bg.BackgroundColor3 = Color3.new(0,0,0)
		bg.BackgroundTransparency = 0.45; bg.BorderSizePixel = 0
		Instance.new("UICorner", bg).CornerRadius = UDim.new(0,4)
		local nameLbl = Instance.new("TextLabel", bg)
		nameLbl.Size = UDim2.new(1,0,0.55,0); nameLbl.Position = UDim2.new(0,0,0,0)
		nameLbl.BackgroundTransparency = 1; nameLbl.Text = plr.DisplayName
		nameLbl.TextColor3 = ESP_COLOR; nameLbl.TextSize = 11; nameLbl.Font = Enum.Font.GothamBold
		nameLbl.TextStrokeColor3 = Color3.new(0,0,0); nameLbl.TextStrokeTransparency = 0.3
		local distLbl = Instance.new("TextLabel", bg)
		distLbl.Size = UDim2.new(1,0,0.45,0); distLbl.Position = UDim2.new(0,0,0.55,0)
		distLbl.BackgroundTransparency = 1; distLbl.TextColor3 = Color3.fromRGB(255,200,230)
		distLbl.TextSize = 9; distLbl.Font = Enum.Font.GothamMedium
		distLbl.TextStrokeColor3 = Color3.new(0,0,0); distLbl.TextStrokeTransparency = 0.3
		espData[plr] = {highlight=hl, billboard=bb, distLabel=distLbl, tracerLine=tracerLine, char=char}
		RunService.RenderStepped:Connect(function()
			if not espData[plr] then tracerLine.Visible = false; return end
			local myChar = player.Character
			local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
			local theirRoot = char:FindFirstChild("HumanoidRootPart")
			if myRoot and theirRoot then
				distLbl.Text = math.floor((myRoot.Position - theirRoot.Position).Magnitude) .. " studs"
			end
			local camera = Workspace.CurrentCamera
			if not (camera and theirRoot) then tracerLine.Visible = false; return end
			local screenPos, onScreen = camera:WorldToViewportPoint(theirRoot.Position)
			if not onScreen then tracerLine.Visible = false; return end
			local vp = camera.ViewportSize
			local originX, originY = vp.X/2, vp.Y
			local dx = screenPos.X - originX; local dy = screenPos.Y - originY
			tracerLine.Visible = true
			tracerLine.Size = UDim2.new(0,1,0,math.sqrt(dx*dx+dy*dy))
			tracerLine.Position = UDim2.new(0,originX,0,originY)
			tracerLine.Rotation = math.deg(math.atan2(dy,dx)) + 90
		end)
	end
	if plr.Character then task.spawn(buildESP, plr.Character) end
	plr.CharacterAdded:Connect(function(char)
		task.wait(0.5)
		if espData[plr] then
			pcall(function()
				if espData[plr].highlight and espData[plr].highlight.Parent then espData[plr].highlight:Destroy() end
				if espData[plr].billboard and espData[plr].billboard.Parent then espData[plr].billboard:Destroy() end
			end)
			espData[plr] = nil
		end
		task.spawn(buildESP, char)
	end)
end

for _, plr in ipairs(Players:GetPlayers()) do task.spawn(addESP, plr) end
Players.PlayerAdded:Connect(function(plr) task.spawn(addESP, plr) end)
Players.PlayerRemoving:Connect(function(plr) removeESP(plr) end)

local INSTA_COOLDOWN = 0.2
local INSTA_HOLD = 0.5

local function getPromptPart(prompt)
	local parent = prompt.Parent
	if parent:IsA("BasePart") then return parent end
	if parent:IsA("Model") then return parent.PrimaryPart or parent:FindFirstChildWhichIsA("BasePart") end
	if parent:IsA("Attachment") then return parent.Parent end
	return parent:FindFirstChildWhichIsA("BasePart", true)
end

local function findNearestStealPrompt()
	local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not root then return nil end
	local plots = Workspace:FindFirstChild("Plots")
	if not plots then return nil end
	local bestPrompt, bestDist = nil, math.huge
	for _, desc in pairs(plots:GetDescendants()) do
		if desc:IsA("ProximityPrompt") and desc.Enabled and desc.ActionText == "Steal" then
			local part = getPromptPart(desc)
			if part then
				local dist = (root.Position - part.Position).Magnitude
				if dist < bestDist then bestDist = dist; bestPrompt = desc end
			end
		end
	end
	return bestPrompt
end

local function triggerPrompt(prompt)
	if not prompt or not prompt:IsDescendantOf(Workspace) then return end
	prompt.MaxActivationDistance = 9e9
	prompt.RequiresLineOfSight = false
	prompt.ClickablePrompt = true
	local ok = pcall(function() fireproximityprompt(prompt, 9e9, INSTA_HOLD) end)
	if not ok then
		pcall(function()
			prompt:InputHoldBegin()
			task.wait(INSTA_HOLD)
			prompt:InputHoldEnd()
		end)
	end
end

local instaGrabConn = nil

local function startInstaGrab()
	if instaGrabConn then return end
	instaGrabConn = task.spawn(function()
		while instaGrabEnabled do
			local prompt = findNearestStealPrompt()
			if prompt then triggerPrompt(prompt) end
			task.wait(INSTA_COOLDOWN)
		end
		instaGrabConn = nil
	end)
end

local function stopInstaGrab()
	instaGrabEnabled = false
	instaGrabConn = nil
end

local SlapList = {
	"Bat","Slap","Iron Slap","Gold Slap","Diamond Slap",
	"Emerald Slap","Ruby Slap","Dark Matter Slap","Flame Slap",
	"Nuclear Slap","Galaxy Slap","Glitched Slap"
}

local function findBat()
	local c = player.Character
	if not c then return nil end
	local bp = player:FindFirstChildOfClass("Backpack")
	for _, ch in ipairs(c:GetChildren()) do
		if ch:IsA("Tool") and ch.Name:lower():find("bat") then return ch end
	end
	if bp then
		for _, ch in ipairs(bp:GetChildren()) do
			if ch:IsA("Tool") and ch.Name:lower():find("bat") then return ch end
		end
	end
	for _, name in ipairs(SlapList) do
		local t = c:FindFirstChild(name) or (bp and bp:FindFirstChild(name))
		if t then return t end
	end
	return nil
end

local function findNearestEnemy()
	local c = player.Character
	if not c then return nil, nil, nil end
	local myHRP = c:FindFirstChild("HumanoidRootPart")
	if not myHRP then return nil, nil, nil end
	local nearest, nearestDist, nearestTorso = nil, math.huge, nil
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local eh = p.Character:FindFirstChild("HumanoidRootPart")
			local torso = p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("Torso")
			local hum = p.Character:FindFirstChildOfClass("Humanoid")
			if eh and hum and hum.Health > 0 then
				local d = (eh.Position - myHRP.Position).Magnitude
				if d < nearestDist then nearestDist = d; nearest = eh; nearestTorso = torso or eh end
			end
		end
	end
	return nearest, nearestDist, nearestTorso
end

local function startTargetPlayer()
	if targetPlayerConn then return end
	targetPlayerConn = RunService.Heartbeat:Connect(function()
		if not targetPlayerEnabled then return end
		local c = player.Character
		if not c then return end
		local h = c:FindFirstChild("HumanoidRootPart")
		local hum = c:FindFirstChildOfClass("Humanoid")
		if not h or not hum then return end
		local bat = findBat()
		if bat and bat.Parent ~= c then pcall(function() hum:EquipTool(bat) end) end
		local target, _, torso = findNearestEnemy()
		if target and torso then
			local dir = torso.Position - h.Position
			local flatDir = Vector3.new(dir.X, 0, dir.Z)
			if flatDir.Magnitude > 1.5 then
				local moveDir = flatDir.Unit
				h.AssemblyLinearVelocity = Vector3.new(moveDir.X*55, h.AssemblyLinearVelocity.Y, moveDir.Z*55)
			else
				local tv = target.AssemblyLinearVelocity
				h.AssemblyLinearVelocity = Vector3.new(tv.X, h.AssemblyLinearVelocity.Y, tv.Z)
			end
			if bat then pcall(function() bat:Activate() end) end
		end
	end)
end

local function stopTargetPlayer()
	if targetPlayerConn then targetPlayerConn:Disconnect(); targetPlayerConn = nil end
end

RunService.Heartbeat:Connect(function()
	if stealBoost and not isOnPath then
		local char = player.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if root and hum then
			local md = hum.MoveDirection
			if md.Magnitude > 0 then
				root.AssemblyLinearVelocity = Vector3.new(md.X*STEAL_SPEED, root.AssemblyLinearVelocity.Y, md.Z*STEAL_SPEED)
			end
		end
	end
end)

local function setupInfJump()
	if infJumpConn then infJumpConn:Disconnect(); infJumpConn = nil end
	if infFallConn then infFallConn:Disconnect(); infFallConn = nil end
	if not infJumpEnabled then return end
	infFallConn = RunService.Heartbeat:Connect(function()
		if not infJumpEnabled then return end
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if root and root.AssemblyLinearVelocity.Y < -clampFallSpeed then
			root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, -clampFallSpeed, root.AssemblyLinearVelocity.Z)
		end
	end)
	infJumpConn = UserInputService.JumpRequest:Connect(function()
		if not infJumpEnabled then return end
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if root then
			root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, jumpForce, root.AssemblyLinearVelocity.Z)
		end
	end)
end

local function enableXray()
	if getgenv and getgenv().OPTIMIZER_ACTIVE then return end
	if getgenv then getgenv().OPTIMIZER_ACTIVE = true end
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		Lighting.GlobalShadows = false; Lighting.Brightness = 3; Lighting.FogEnd = 9e9
	end)
	pcall(function()
		for _, obj in ipairs(Workspace:GetDescendants()) do
			pcall(function()
				if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then obj:Destroy() end
				if obj:IsA("BasePart") then obj.CastShadow = false; obj.Material = Enum.Material.Plastic end
			end)
		end
	end)
	xrayActive = true
	pcall(function()
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:IsA("BasePart") and obj.Anchored and (obj.Name:lower():find("base") or (obj.Parent and obj.Parent.Name:lower():find("base"))) then
				originalTransparency[obj] = obj.LocalTransparencyModifier
				obj.LocalTransparencyModifier = 0.85
			end
		end
	end)
end

local function disableXray()
	if getgenv then getgenv().OPTIMIZER_ACTIVE = false end
	if xrayActive then
		for part, val in pairs(originalTransparency) do
			if part then part.LocalTransparencyModifier = val end
		end
		originalTransparency = {}; xrayActive = false
	end
end

local function faceSide(side)
	local c = player.Character
	local h = c and c:FindFirstChild("HumanoidRootPart")
	if h then
		h.CFrame = CFrame.new(h.Position) * CFrame.Angles(0, 0, 0)
		local camera = Workspace.CurrentCamera
		if camera then
			local p = h.Position
			local camPos, lookTarget
			if side == "right" then
				camPos = Vector3.new(p.X, p.Y + 5, p.Z + 12)
				lookTarget = Vector3.new(p.X, p.Y, p.Z)
			else
				camPos = Vector3.new(p.X, p.Y + 5, p.Z - 12)
				lookTarget = Vector3.new(p.X, p.Y, p.Z)
			end
			camera.CFrame = CFrame.lookAt(camPos, lookTarget)
		end
	end
end

local function equipFlyingCarpet()
	local c = player.Character
	if not c then return false end
	local hum = c:FindFirstChildOfClass("Humanoid")
	if not hum then return false end
	local bp = player:FindFirstChild("Backpack")
	local tool = (bp and bp:FindFirstChild("Flying Carpet")) or c:FindFirstChild("Flying Carpet")
	if not tool then return false end
	if tool.Parent ~= c then
		hum:EquipTool(tool)
		local t0 = tick()
		repeat task.wait() until tool.Parent == c or (tick() - t0) > 1
	end
	return true
end

local function fastClick()
	task.wait(blockDelay)
	local cam = Workspace.CurrentCamera
	if not cam then return end
	local vp = cam.ViewportSize
	local x = vp.X / 2
	local y = vp.Y / 2 + 23
	for _ = 1, 8 do
		VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 1)
		VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 1)
		task.wait(0.008)
	end
end

local function blockPlayer(plr)
	if not plr or plr == player then return end
	pcall(function() StarterGui:SetCore("PromptBlockPlayer", plr) end)
end

local function checkForBrainrot()
	if not instaBlockEnabled then return end
	local bp = player:FindFirstChild("Backpack")
	local c = player.Character
	local keywords = {"brainrot","animal","monkey","dog","cat","bird"}
	local function scanTools(container)
		if not container then return end
		for _, tool in ipairs(container:GetChildren()) do
			if tool:IsA("Tool") then
				local n = tool.Name:lower()
				for _, kw in ipairs(keywords) do
					if n:find(kw) then
						for _, other in ipairs(Players:GetPlayers()) do
							if other ~= player and other.Character then
								local ob = other:FindFirstChild("Backpack")
								if ob and not ob:FindFirstChild(tool.Name) then
									task.spawn(function()
										blockPlayer(other)
										task.wait(0.1)
										fastClick()
									end)
									task.wait(0.3)
								end
							end
						end
						break
					end
				end
			end
		end
	end
	scanTools(bp)
	scanTools(c)
end

local function setupBrainrotDetection()
	checkForBrainrot()
	local bp = player:FindFirstChild("Backpack")
	if bp then
		bp.ChildAdded:Connect(function(child)
			if child:IsA("Tool") then task.wait(0.5); checkForBrainrot() end
		end)
	end
	local c = player.Character
	if c then
		c.ChildAdded:Connect(function(child)
			if child:IsA("Tool") then task.wait(0.5); checkForBrainrot() end
		end)
	end
	player.CharacterAdded:Connect(function(newChar)
		newChar.ChildAdded:Connect(function(child)
			if child:IsA("Tool") then task.wait(0.5); checkForBrainrot() end
		end)
		task.wait(1); checkForBrainrot()
	end)
end

local blockedByScam = {}

local function doCarpetScam()
	task.spawn(function()
		if not equipFlyingCarpet() then return end
		local c = player.Character
		local h = c and c:FindFirstChild("HumanoidRootPart")
		if not h then return end
		h.CFrame = CARPET_SPOT_1
		equipFlyingCarpet()
		task.wait(0.10)
		c = player.Character
		h = c and c:FindFirstChild("HumanoidRootPart")
		if not h then return end
		h.CFrame = CARPET_SPOT_2
		equipFlyingCarpet()
		task.wait(0.10)
		c = player.Character
		h = c and c:FindFirstChild("HumanoidRootPart")
		if not h then return end
		h.CFrame = CARPET_SPOT_3
		equipFlyingCarpet()
		task.wait(0.12)
		if instaBlockEnabled then
			blockedByScam = {}
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= player then
					task.spawn(function()
						blockPlayer(plr)
						task.wait(0.1)
						fastClick()
						blockedByScam[plr] = true
					end)
					task.wait(0.35)
				end
			end
		end
	end)
end

local updateStealUI, updateJumpUI, updateInstaGrabUI, updateXrayUI, updateAutoWalkUI, updateTargetPlayerUI, updateInstaBlockUI

local function stopAutoWalk()
	if autoWalkConn then autoWalkConn:Disconnect(); autoWalkConn = nil end
	autoWalkPhase = 1; autoWalkSide = nil
	local c = player.Character
	if c then
		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum then hum:Move(Vector3.zero, false) end
		local h = c:FindFirstChild("HumanoidRootPart")
		if h then h.AssemblyLinearVelocity = Vector3.zero end
	end
end

local function startAutoWalkPath(side)
	if autoWalkConn then autoWalkConn:Disconnect(); autoWalkConn = nil end
	autoWalkPhase = 1; autoWalkSide = side
	local p3 = side == "left" and POSITION_L3 or POSITION_R3
	local p4 = side == "left" and POSITION_L4 or POSITION_R4
	task.wait(0.9)
	autoWalkConn = RunService.Heartbeat:Connect(function()
		if not autoWalkEnabled then stopAutoWalk(); return end
		local c = player.Character
		local h = c and c:FindFirstChild("HumanoidRootPart")
		local hum = c and c:FindFirstChildOfClass("Humanoid")
		if not (h and hum) then return end
		local target = autoWalkPhase == 1 and p3 or p4
		local dist = (Vector3.new(target.X, h.Position.Y, target.Z) - h.Position).Magnitude
		if dist < 1.5 then
			if autoWalkPhase == 1 then autoWalkPhase = 2
			else
				hum:Move(Vector3.zero, false); h.AssemblyLinearVelocity = Vector3.zero
				stopAutoWalk(); return
			end
		end
		local md = Vector3.new(target.X-h.Position.X, 0, target.Z-h.Position.Z).Unit
		hum:Move(md, false)
	end)
end

local function onPathFinished(side)
	isOnPath = false; stealBoost = false; infJumpEnabled = false; instaGrabEnabled = false
	setupInfJump()
	if updateStealUI then updateStealUI() end
	if updateJumpUI then updateJumpUI() end
	if updateInstaGrabUI then updateInstaGrabUI() end
	task.wait(0.05)
	stealBoost = true; infJumpEnabled = true; instaGrabEnabled = true
	setupInfJump()
	if updateStealUI then updateStealUI() end
	if updateJumpUI then updateJumpUI() end
	if updateInstaGrabUI then updateInstaGrabUI() end
	startInstaGrab()
	if autoWalkEnabled then task.wait(0.1); startAutoWalkPath(side) end
end

local function startAutoLeft()
	if autoLeftConn then autoLeftConn:Disconnect() end
	autoLeftPhase = 1; isOnPath = true; stealBoost = false; infJumpEnabled = false
	setupInfJump()
	if updateStealUI then updateStealUI() end
	if updateJumpUI then updateJumpUI() end
	autoLeftConn = RunService.Heartbeat:Connect(function()
		if not AutoLeftEnabled then isOnPath = false; return end
		local c = player.Character
		local h = c and c:FindFirstChild("HumanoidRootPart")
		local hum = c and c:FindFirstChildOfClass("Humanoid")
		if not (h and hum) then return end
		local target = autoLeftPhase == 1 and POSITION_L1 or POSITION_L2
		local dist = (Vector3.new(target.X, h.Position.Y, target.Z) - h.Position).Magnitude
		if dist < 1.5 then
			if autoLeftPhase == 1 then autoLeftPhase = 2
			else
				hum:Move(Vector3.zero, false); h.AssemblyLinearVelocity = Vector3.zero
				AutoLeftEnabled = false
				if autoLeftConn then autoLeftConn:Disconnect(); autoLeftConn = nil end
				faceSide("left")
				if _G.LunixSetLeftVisual then _G.LunixSetLeftVisual(false) end
				onPathFinished("left"); return
			end
		end
		local md = Vector3.new(target.X-h.Position.X, 0, target.Z-h.Position.Z).Unit
		hum:Move(md, false)
		h.AssemblyLinearVelocity = Vector3.new(md.X*VELOCITY_SPEED, h.AssemblyLinearVelocity.Y, md.Z*VELOCITY_SPEED)
	end)
end

local function stopAutoLeft()
	if autoLeftConn then autoLeftConn:Disconnect(); autoLeftConn = nil end
	autoLeftPhase = 1; isOnPath = false
	local c = player.Character
	if c then
		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum then hum:Move(Vector3.zero, false) end
		local h = c:FindFirstChild("HumanoidRootPart")
		if h then h.AssemblyLinearVelocity = Vector3.zero end
	end
end

local function startAutoRight()
	if autoRightConn then autoRightConn:Disconnect() end
	autoRightPhase = 1; isOnPath = true; stealBoost = false; infJumpEnabled = false
	setupInfJump()
	if updateStealUI then updateStealUI() end
	if updateJumpUI then updateJumpUI() end
	autoRightConn = RunService.Heartbeat:Connect(function()
		if not AutoRightEnabled then isOnPath = false; return end
		local c = player.Character
		local h = c and c:FindFirstChild("HumanoidRootPart")
		local hum = c and c:FindFirstChildOfClass("Humanoid")
		if not (h and hum) then return end
		local target = autoRightPhase == 1 and POSITION_R1 or POSITION_R2
		local dist = (Vector3.new(target.X, h.Position.Y, target.Z) - h.Position).Magnitude
		if dist < 1.5 then
			if autoRightPhase == 1 then autoRightPhase = 2
			else
				hum:Move(Vector3.zero, false); h.AssemblyLinearVelocity = Vector3.zero
				AutoRightEnabled = false
				if autoRightConn then autoRightConn:Disconnect(); autoRightConn = nil end
				faceSide("right")
				if _G.LunixSetRightVisual then _G.LunixSetRightVisual(false) end
				onPathFinished("right"); return
			end
		end
		local md = Vector3.new(target.X-h.Position.X, 0, target.Z-h.Position.Z).Unit
		hum:Move(md, false)
		h.AssemblyLinearVelocity = Vector3.new(md.X*VELOCITY_SPEED, h.AssemblyLinearVelocity.Y, md.Z*VELOCITY_SPEED)
	end)
end

local function stopAutoRight()
	if autoRightConn then autoRightConn:Disconnect(); autoRightConn = nil end
	autoRightPhase = 1; isOnPath = false
	local c = player.Character
	if c then
		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum then hum:Move(Vector3.zero, false) end
		local h = c:FindFirstChild("HumanoidRootPart")
		if h then h.AssemblyLinearVelocity = Vector3.zero end
	end
end

updateChar()
enableAntiKb()
startUnwalk()
setupBrainrotDetection()

local theme = {
	bg         = Color3.fromRGB(10, 10, 10),
	white      = Color3.fromRGB(255, 255, 255),
	subtext    = Color3.fromRGB(155, 155, 155),
	toggleOff  = Color3.fromRGB(38, 38, 38),
	toggleOn   = Color3.fromRGB(160, 0, 240),
	knob       = Color3.fromRGB(255, 255, 255),
	btnIdle    = Color3.fromRGB(28, 28, 28),
	btnActive  = Color3.fromRGB(120, 0, 195),
	carpetBtn  = Color3.fromRGB(160, 0, 110),
	bindIdle   = Color3.fromRGB(30, 20, 45),
	bindListen = Color3.fromRGB(80, 50, 0),
	ibOff      = Color3.fromRGB(80, 0, 160),
	ibOn       = Color3.fromRGB(120, 0, 220),
}

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "LunixBotUI"; gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 240, 0, 455)
frame.Position = UDim2.new(1, 10, 0.5, -227)
frame.BackgroundColor3 = theme.bg
frame.BackgroundTransparency = 0.08
frame.BorderSizePixel = 0; frame.Active = true; frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2.5; stroke.Color = Color3.fromRGB(255, 255, 255)

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0,    Color3.fromRGB(180,0,255)),
	ColorSequenceKeypoint.new(0.15, Color3.new(0,0,0)),
	ColorSequenceKeypoint.new(0.3,  Color3.fromRGB(255,80,180)),
	ColorSequenceKeypoint.new(0.45, Color3.new(0,0,0)),
	ColorSequenceKeypoint.new(0.6,  Color3.fromRGB(180,0,255)),
	ColorSequenceKeypoint.new(0.75, Color3.new(0,0,0)),
	ColorSequenceKeypoint.new(1,    Color3.fromRGB(255,80,180)),
})
gradient.Parent = stroke
task.spawn(function()
	while frame and frame.Parent do
		gradient.Rotation = (gradient.Rotation + 2) % 360
		task.wait(0.01)
	end
end)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,28); title.Position = UDim2.new(0,0,0,6)
title.BackgroundTransparency = 1; title.Text = "LUNIX DUELS"
title.TextColor3 = theme.white; title.TextSize = 16; title.Font = Enum.Font.GothamBold

local divider = Instance.new("Frame", frame)
divider.Size = UDim2.new(0.85,0,0,1); divider.Position = UDim2.new(0.075,0,0,34)
divider.BackgroundColor3 = theme.white; divider.BorderSizePixel = 0

local subtitle = Instance.new("TextLabel", frame)
subtitle.Size = UDim2.new(1,0,0,14); subtitle.Position = UDim2.new(0,0,0,38)
subtitle.BackgroundTransparency = 1; subtitle.Text = "Beta v1.3.0"
subtitle.TextColor3 = theme.subtext; subtitle.TextSize = 10; subtitle.Font = Enum.Font.GothamMedium

local topRow = Instance.new("Frame", frame)
topRow.Size = UDim2.new(1,-20,0,30); topRow.Position = UDim2.new(0,10,0,58)
topRow.BackgroundTransparency = 1

local leftBtn = Instance.new("TextButton", topRow)
leftBtn.Size = UDim2.new(0.32,0,1,0); leftBtn.Position = UDim2.new(0,0,0,0)
leftBtn.BackgroundColor3 = theme.btnIdle; leftBtn.Text = "← LEFT"
leftBtn.TextColor3 = theme.white; leftBtn.TextSize = 11; leftBtn.Font = Enum.Font.GothamBold
leftBtn.AutoButtonColor = false; leftBtn.BorderSizePixel = 0
Instance.new("UICorner", leftBtn).CornerRadius = UDim.new(0,6)
local s1 = Instance.new("UIStroke", leftBtn); s1.Thickness = 1.5; s1.Color = Color3.fromRGB(80,80,80)

local rightBtn = Instance.new("TextButton", topRow)
rightBtn.Size = UDim2.new(0.32,0,1,0); rightBtn.Position = UDim2.new(0.34,0,0,0)
rightBtn.BackgroundColor3 = theme.btnIdle; rightBtn.Text = "RIGHT →"
rightBtn.TextColor3 = theme.white; rightBtn.TextSize = 11; rightBtn.Font = Enum.Font.GothamBold
rightBtn.AutoButtonColor = false; rightBtn.BorderSizePixel = 0
Instance.new("UICorner", rightBtn).CornerRadius = UDim.new(0,6)
local s2 = Instance.new("UIStroke", rightBtn); s2.Thickness = 1.5; s2.Color = Color3.fromRGB(80,80,80)

local carpetScamBtn = Instance.new("TextButton", topRow)
carpetScamBtn.Size = UDim2.new(0.32,0,1,0); carpetScamBtn.Position = UDim2.new(0.68,0,0,0)
carpetScamBtn.BackgroundColor3 = theme.carpetBtn; carpetScamBtn.Text = "CARPET SCAM"
carpetScamBtn.TextColor3 = theme.white; carpetScamBtn.TextSize = 9; carpetScamBtn.Font = Enum.Font.GothamBold
carpetScamBtn.AutoButtonColor = false; carpetScamBtn.BorderSizePixel = 0
Instance.new("UICorner", carpetScamBtn).CornerRadius = UDim.new(0,6)
local sc = Instance.new("UIStroke", carpetScamBtn); sc.Thickness = 1.2; sc.Color = PINK

local page = Instance.new("Frame", frame)
page.Size = UDim2.new(1,-20,0,390); page.Position = UDim2.new(0,10,0,98)
page.BackgroundTransparency = 1

local footer = Instance.new("TextLabel", frame)
footer.Size = UDim2.new(1,0,0,14); footer.Position = UDim2.new(0,0,1,-16)
footer.BackgroundTransparency = 1; footer.Text = "discord.gg/TSZjbfhZD4"
footer.TextColor3 = Color3.fromRGB(85,85,85); footer.TextSize = 10; footer.Font = Enum.Font.GothamMedium

local function setPathBtnActive(btn, on)
	TweenService:Create(btn, TweenInfo.new(0.18), {BackgroundColor3 = on and theme.btnActive or theme.btnIdle}):Play()
end

local function setToggleVisual(sw, knob, on)
	TweenService:Create(sw, TweenInfo.new(0.22, Enum.EasingStyle.Quart), {BackgroundColor3 = on and theme.toggleOn or theme.toggleOff}):Play()
	TweenService:Create(knob, TweenInfo.new(0.22, Enum.EasingStyle.Quart), {Position = on and UDim2.new(1,-19,0.5,-8) or UDim2.new(0,3,0.5,-8)}):Play()
end

local listeningBind = nil
local allBindLabels = {}

local function stopListening()
	if not listeningBind then return end
	local b = listeningBind; listeningBind = nil
	TweenService:Create(b.frame, TweenInfo.new(0.15), {BackgroundColor3 = theme.bindIdle}):Play()
	b.label.Text = KEYBINDS[b.key].Name
	b.label.TextColor3 = Color3.fromRGB(200,150,255)
end

UserInputService.InputBegan:Connect(function(input, gp)
	if not listeningBind then return end
	if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
	if input.KeyCode == Enum.KeyCode.Escape then stopListening(); return end
	KEYBINDS[listeningBind.key] = input.KeyCode
	local b = listeningBind; listeningBind = nil
	TweenService:Create(b.frame, TweenInfo.new(0.15), {BackgroundColor3 = theme.bindIdle}):Play()
	b.label.Text = input.KeyCode.Name
	b.label.TextColor3 = Color3.fromRGB(200,150,255)
end)

local function makeToggleRow(parent, labelText, bindKey, yPos)
	local row = Instance.new("Frame", parent)
	row.Size = UDim2.new(1,0,0,34); row.Position = UDim2.new(0,0,0,yPos)
	row.BackgroundTransparency = 1
	local lbl = Instance.new("TextLabel", row)
	lbl.Size = UDim2.new(1,-110,1,0); lbl.BackgroundTransparency = 1
	lbl.Text = labelText; lbl.TextColor3 = theme.white
	lbl.TextSize = 12; lbl.Font = Enum.Font.GothamMedium
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	local bindFrame = Instance.new("TextButton", row)
	bindFrame.Size = UDim2.new(0,30,0,20)
	bindFrame.Position = UDim2.new(1,-76,0.5,-10)
	bindFrame.BackgroundColor3 = theme.bindIdle
	bindFrame.Text = ""; bindFrame.AutoButtonColor = false; bindFrame.BorderSizePixel = 0
	Instance.new("UICorner", bindFrame).CornerRadius = UDim.new(0,5)
	local bStr = Instance.new("UIStroke", bindFrame)
	bStr.Thickness = 1.2; bStr.Color = Color3.fromRGB(100,0,160)
	local bindLbl = Instance.new("TextLabel", bindFrame)
	bindLbl.Size = UDim2.new(1,0,1,0); bindLbl.BackgroundTransparency = 1
	bindLbl.Text = KEYBINDS[bindKey].Name
	bindLbl.TextColor3 = Color3.fromRGB(200,150,255)
	bindLbl.TextSize = 10; bindLbl.Font = Enum.Font.GothamBold
	bindFrame.MouseButton1Click:Connect(function()
		if listeningBind then stopListening() end
		listeningBind = {key=bindKey, frame=bindFrame, label=bindLbl}
		TweenService:Create(bindFrame, TweenInfo.new(0.15), {BackgroundColor3 = theme.bindListen}):Play()
		bindLbl.Text = "..."; bindLbl.TextColor3 = Color3.fromRGB(255,200,50)
	end)
	allBindLabels[bindKey] = bindLbl
	local switchBg = Instance.new("TextButton", row)
	switchBg.Size = UDim2.new(0,40,0,22); switchBg.Position = UDim2.new(1,-40,0.5,-11)
	switchBg.BackgroundColor3 = theme.toggleOff; switchBg.Text = ""
	switchBg.AutoButtonColor = false; switchBg.BorderSizePixel = 0
	Instance.new("UICorner", switchBg).CornerRadius = UDim.new(1,0)
	local knob = Instance.new("Frame", switchBg)
	knob.Size = UDim2.new(0,16,0,16); knob.Position = UDim2.new(0,3,0.5,-8)
	knob.BackgroundColor3 = theme.knob; knob.BorderSizePixel = 0
	Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)
	return switchBg, knob
end

local stealSwitch,        stealKnob        = makeToggleRow(page, "Steal Boost",      "STEAL",        8)
local jumpSwitch,         jumpKnob         = makeToggleRow(page, "Infinite Jump",    "JUMP",         48)
local instaGrabSwitch,    instaGrabKnob    = makeToggleRow(page, "Insta Grab",       "INSTAGRAB",    88)
local xraySwitch,         xrayKnob         = makeToggleRow(page, "XRay + Optimizer", "XRAY",         128)
local autoWalkSwitch,     autoWalkKnob     = makeToggleRow(page, "Auto Walk",        "AUTOWALK",     168)
local targetPlayerSwitch, targetPlayerKnob = makeToggleRow(page, "Target Player",    "TARGETPLAYER", 208)

local delayRow = Instance.new("Frame", page)
delayRow.Size = UDim2.new(1,0,0,22); delayRow.Position = UDim2.new(0,0,0,248)
delayRow.BackgroundTransparency = 1

local delayLbl = Instance.new("TextLabel", delayRow)
delayLbl.Size = UDim2.new(0,50,1,0); delayLbl.Position = UDim2.new(0,0,0,0)
delayLbl.BackgroundTransparency = 1; delayLbl.Text = "Delay"
delayLbl.TextColor3 = theme.white; delayLbl.TextSize = 11; delayLbl.Font = Enum.Font.GothamMedium
delayLbl.TextXAlignment = Enum.TextXAlignment.Left

local delayBox = Instance.new("TextBox", delayRow)
delayBox.Size = UDim2.new(0,52,1,0); delayBox.Position = UDim2.new(0,52,0,0)
delayBox.Text = tostring(blockDelay)
delayBox.TextColor3 = Color3.fromRGB(220,235,255)
delayBox.Font = Enum.Font.GothamMedium; delayBox.TextSize = 11
delayBox.BackgroundColor3 = Color3.fromRGB(28,28,45)
delayBox.PlaceholderText = "0.1-5"; delayBox.PlaceholderColor3 = Color3.fromRGB(120,130,160)
delayBox.BorderSizePixel = 0
Instance.new("UICorner", delayBox).CornerRadius = UDim.new(0,5)
local dbStroke = Instance.new("UIStroke", delayBox); dbStroke.Thickness = 1.1; dbStroke.Color = Color3.fromRGB(100,0,180)

local setDelayBtn = Instance.new("TextButton", delayRow)
setDelayBtn.Size = UDim2.new(0,32,1,0); setDelayBtn.Position = UDim2.new(0,108,0,0)
setDelayBtn.BackgroundColor3 = Color3.fromRGB(60,20,120)
setDelayBtn.Text = "SET"; setDelayBtn.TextColor3 = theme.white
setDelayBtn.TextSize = 10; setDelayBtn.Font = Enum.Font.GothamBold
setDelayBtn.AutoButtonColor = false; setDelayBtn.BorderSizePixel = 0
Instance.new("UICorner", setDelayBtn).CornerRadius = UDim.new(0,5)

local function applyDelay()
	local text = delayBox.Text
	if text == "" then delayBox.Text = tostring(blockDelay); return end
	local num = tonumber(text)
	if num then
		blockDelay = math.floor(math.clamp(num, minDelay, maxDelay) * 100 + 0.5) / 100
		delayBox.Text = tostring(blockDelay)
	else
		delayBox.Text = tostring(blockDelay)
	end
end

setDelayBtn.MouseButton1Click:Connect(applyDelay)
delayBox.FocusLost:Connect(applyDelay)

delayBox:GetPropertyChangedSignal("Text"):Connect(function()
	local num = tonumber(delayBox.Text)
	if num and num >= minDelay and num <= maxDelay then
		dbStroke.Color = Color3.fromRGB(100,0,180)
	else
		dbStroke.Color = Color3.fromRGB(180,40,40)
	end
end)

local ibRowY = 278

local instaBlockBtn = Instance.new("TextButton", page)
instaBlockBtn.Size = UDim2.new(1,-50,0,26)
instaBlockBtn.Position = UDim2.new(0,0,0,ibRowY)
instaBlockBtn.BackgroundColor3 = theme.ibOff
instaBlockBtn.Text = "INSTA BLOCK  [OFF]"
instaBlockBtn.TextColor3 = theme.white; instaBlockBtn.TextSize = 11
instaBlockBtn.Font = Enum.Font.GothamBold
instaBlockBtn.AutoButtonColor = false; instaBlockBtn.BorderSizePixel = 0
Instance.new("UICorner", instaBlockBtn).CornerRadius = UDim.new(0,6)

local ibBindFrame = Instance.new("TextButton", page)
ibBindFrame.Size = UDim2.new(0,40,0,26)
ibBindFrame.Position = UDim2.new(1,-40,0,ibRowY)
ibBindFrame.BackgroundColor3 = theme.bindIdle
ibBindFrame.Text = ""; ibBindFrame.AutoButtonColor = false; ibBindFrame.BorderSizePixel = 0
Instance.new("UICorner", ibBindFrame).CornerRadius = UDim.new(0,5)
local ibBindStr = Instance.new("UIStroke", ibBindFrame)
ibBindStr.Thickness = 1.2; ibBindStr.Color = Color3.fromRGB(100,0,160)

local ibBindLbl = Instance.new("TextLabel", ibBindFrame)
ibBindLbl.Size = UDim2.new(1,0,1,0); ibBindLbl.BackgroundTransparency = 1
ibBindLbl.Text = KEYBINDS.INSTABLOCK.Name
ibBindLbl.TextColor3 = Color3.fromRGB(200,150,255)
ibBindLbl.TextSize = 10; ibBindLbl.Font = Enum.Font.GothamBold

ibBindFrame.MouseButton1Click:Connect(function()
	if listeningBind then stopListening() end
	listeningBind = {key="INSTABLOCK", frame=ibBindFrame, label=ibBindLbl}
	TweenService:Create(ibBindFrame, TweenInfo.new(0.15), {BackgroundColor3 = theme.bindListen}):Play()
	ibBindLbl.Text = "..."; ibBindLbl.TextColor3 = Color3.fromRGB(255,200,50)
end)
allBindLabels["INSTABLOCK"] = ibBindLbl

local function updateInstaBlockButton()
	if instaBlockEnabled then
		TweenService:Create(instaBlockBtn, TweenInfo.new(0.2), {BackgroundColor3 = theme.ibOn}):Play()
		instaBlockBtn.Text = "INSTA BLOCK  [ON]"
	else
		TweenService:Create(instaBlockBtn, TweenInfo.new(0.2), {BackgroundColor3 = theme.ibOff}):Play()
		instaBlockBtn.Text = "INSTA BLOCK  [OFF]"
	end
end

updateStealUI        = function() setToggleVisual(stealSwitch,        stealKnob,        stealBoost)          end
updateJumpUI         = function() setToggleVisual(jumpSwitch,         jumpKnob,         infJumpEnabled)      end
updateInstaGrabUI    = function() setToggleVisual(instaGrabSwitch,    instaGrabKnob,    instaGrabEnabled)    end
updateXrayUI         = function() setToggleVisual(xraySwitch,         xrayKnob,         xrayEnabled)         end
updateAutoWalkUI     = function() setToggleVisual(autoWalkSwitch,     autoWalkKnob,     autoWalkEnabled)     end
updateTargetPlayerUI = function() setToggleVisual(targetPlayerSwitch, targetPlayerKnob, targetPlayerEnabled) end
updateInstaBlockUI   = function() updateInstaBlockButton()                                                   end

task.spawn(function()
	task.wait(0.3)
	TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(1,-254,0.5,-227)
	}):Play()
end)

do
	local dragging, dragStart, startPos = false, nil, nil
	title.InputBegan:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
			dragging = true; dragStart = inp.Position; startPos = frame.Position
			inp.Changed:Connect(function()
				if inp.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	UserInputService.InputChanged:Connect(function(inp)
		if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
			local d = inp.Position - dragStart
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset+d.X, startPos.Y.Scale, startPos.Y.Offset+d.Y)
		end
	end)
end

leftBtn.MouseButton1Click:Connect(function()
	if AutoLeftEnabled then
		AutoLeftEnabled = false; stopAutoLeft(); setPathBtnActive(leftBtn, false)
	else
		AutoLeftEnabled = true; setPathBtnActive(leftBtn, true); startAutoLeft()
	end
end)

rightBtn.MouseButton1Click:Connect(function()
	if AutoRightEnabled then
		AutoRightEnabled = false; stopAutoRight(); setPathBtnActive(rightBtn, false)
	else
		AutoRightEnabled = true; setPathBtnActive(rightBtn, true); startAutoRight()
	end
end)

carpetScamBtn.MouseButton1Click:Connect(function() doCarpetScam() end)

_G.LunixSetLeftVisual  = function(on) AutoLeftEnabled  = on; setPathBtnActive(leftBtn,  on) end
_G.LunixSetRightVisual = function(on) AutoRightEnabled = on; setPathBtnActive(rightBtn, on) end

stealSwitch.MouseButton1Click:Connect(function()
	stealBoost = not stealBoost; updateStealUI()
end)

jumpSwitch.MouseButton1Click:Connect(function()
	infJumpEnabled = not infJumpEnabled; setupInfJump(); updateJumpUI()
end)

instaGrabSwitch.MouseButton1Click:Connect(function()
	instaGrabEnabled = not instaGrabEnabled; updateInstaGrabUI()
	if instaGrabEnabled then startInstaGrab() else stopInstaGrab() end
end)

xraySwitch.MouseButton1Click:Connect(function()
	xrayEnabled = not xrayEnabled; updateXrayUI()
	if xrayEnabled then enableXray() else disableXray() end
end)

autoWalkSwitch.MouseButton1Click:Connect(function()
	autoWalkEnabled = not autoWalkEnabled; updateAutoWalkUI()
	if not autoWalkEnabled then stopAutoWalk() end
end)

targetPlayerSwitch.MouseButton1Click:Connect(function()
	targetPlayerEnabled = not targetPlayerEnabled; updateTargetPlayerUI()
	if targetPlayerEnabled then startTargetPlayer() else stopTargetPlayer() end
end)

instaBlockBtn.MouseButton1Click:Connect(function()
	instaBlockEnabled = not instaBlockEnabled
	updateInstaBlockUI()
	if instaBlockEnabled then
		checkForBrainrot()
	end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if listeningBind then return end
	if input.KeyCode == KEYBINDS.STEAL        then stealBoost = not stealBoost; updateStealUI(); return end
	if input.KeyCode == KEYBINDS.JUMP         then infJumpEnabled = not infJumpEnabled; setupInfJump(); updateJumpUI(); return end
	if input.KeyCode == KEYBINDS.INSTAGRAB    then instaGrabEnabled = not instaGrabEnabled; updateInstaGrabUI(); if instaGrabEnabled then startInstaGrab() else stopInstaGrab() end; return end
	if input.KeyCode == KEYBINDS.XRAY         then xrayEnabled = not xrayEnabled; updateXrayUI(); if xrayEnabled then enableXray() else disableXray() end; return end
	if input.KeyCode == KEYBINDS.AUTOWALK     then autoWalkEnabled = not autoWalkEnabled; updateAutoWalkUI(); if not autoWalkEnabled then stopAutoWalk() end; return end
	if input.KeyCode == KEYBINDS.TARGETPLAYER then targetPlayerEnabled = not targetPlayerEnabled; updateTargetPlayerUI(); if targetPlayerEnabled then startTargetPlayer() else stopTargetPlayer() end; return end
	if input.KeyCode == KEYBINDS.INSTABLOCK   then
		instaBlockEnabled = not instaBlockEnabled
		updateInstaBlockUI()
		if instaBlockEnabled then checkForBrainrot() end
		return
	end
end)

updateStealUI(); updateJumpUI(); updateInstaGrabUI()
updateXrayUI(); updateAutoWalkUI(); updateTargetPlayerUI(); updateInstaBlockUI()

task.spawn(function()
	task.wait(0.1)
	for key, lbl in pairs(allBindLabels) do
		if not listeningBind or listeningBind.key ~= key then
			lbl.Text = KEYBINDS[key].Name
		end
	end
	ibBindLbl.Text = KEYBINDS.INSTABLOCK.Name
end)

player.CharacterAdded:Connect(function()
	task.wait(0.15)
	updateChar(); enableAntiKb(); startUnwalk()
	if infJumpEnabled      then setupInfJump()      end
	if AutoLeftEnabled     then startAutoLeft()     end
	if AutoRightEnabled    then startAutoRight()    end
	if targetPlayerEnabled then startTargetPlayer() end
end)