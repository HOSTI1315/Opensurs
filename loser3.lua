-- Platin and Shadow Presents
-- crusty hub

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local PathfindingService = game:GetService("PathfindingService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local keyword = "you stole"
local kickMessage = "You stole brainrot!"

local function hasKeyword(text)
	if typeof(text) ~= "string" then
		return false
	end
	return string.find(string.lower(text), keyword) ~= nil
end

local function kickPlayer()
	local success, err = pcall(function()
		LocalPlayer:Kick(kickMessage)
	end)
	if not success then
		warn("Kick failed: " .. tostring(err))
	end
end

local function scanGuiObjects(parent)
	for _, obj in ipairs(parent:GetDescendants()) do
		if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
			if hasKeyword(obj.Text) then
				kickPlayer()
				return true
			end

			obj:GetPropertyChangedSignal("Text"):Connect(function()
				if hasKeyword(obj.Text) then
					kickPlayer()
				end
			end)
		end
	end
	return false
end

local function setupGuiWatcher(gui)
	gui.DescendantAdded:Connect(function(desc)
		if desc:IsA("TextLabel") or desc:IsA("TextButton") or desc:IsA("TextBox") then
			if hasKeyword(desc.Text) then
				kickPlayer()
			end

			desc:GetPropertyChangedSignal("Text"):Connect(function()
				if hasKeyword(desc.Text) then
					kickPlayer()
				end
			end)
		end
	end)
end

for _, gui in ipairs(PlayerGui:GetChildren()) do
	setupGuiWatcher(gui)
end

PlayerGui.ChildAdded:Connect(function(gui)
	setupGuiWatcher(gui)
	scanGuiObjects(gui)
end)

scanGuiObjects(PlayerGui)

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

LocalPlayer.CharacterAdded:Connect(function(newChar)
	character = newChar
	hrp = character:WaitForChild("HumanoidRootPart")
	humanoid = character:WaitForChild("Humanoid")
end)

local speedBoostActive = false
local flyToBestEnabled = false
local autoTweenActive = false
local aimbotLaserEnabled = false
local desyncSequence = nil
local isInvisible = false

local flyToBestConnection
local tweenConnection
local aimbotConnection
local desyncConnection

local speedMultiplier = 1.725
local baseSpeed = 16

local function updateSpeedBoost()
	speedBoostActive = LocalPlayer:GetAttribute("Stealing") == true
end

LocalPlayer:GetAttributeChangedSignal("Stealing"):Connect(updateSpeedBoost)
updateSpeedBoost()

local speedConnection = RunService.Heartbeat:Connect(function()
	if not speedBoostActive then return end
	if hrp and humanoid then
		local moveDirection = humanoid.MoveDirection
		if moveDirection.Magnitude > 0 then
			local velocity = moveDirection * (baseSpeed * speedMultiplier)
			hrp.Velocity = Vector3.new(
				velocity.X,
				hrp.Velocity.Y,
				velocity.Z
			)
		end
	end
end)

local function buyAndEquipItem(itemName)
	local success = pcall(function()
		local remote = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RF/CoinsShopService/RequestBuy")
		remote:InvokeServer(itemName)
	end)
	if success then
		task.delay(0.5, function()
			local backpack = LocalPlayer:WaitForChild("Backpack")
			local tool = backpack:FindFirstChild(itemName)
			if tool then
				local char = LocalPlayer.Character
				if char then
					tool.Parent = char
					task.wait(0.25)
					tool.Parent = backpack
				end
			end
		end)
	end
end

local function buyAndEquipSpeedCoil()
	buyAndEquipItem("Speed Coil")
end

local Net = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net")
local UseItemRE = Net:WaitForChild("RE/UseItem")
local RequestBuyRF = Net:WaitForChild("RF/CoinsShopService/RequestBuy")
local QuantumTeleportRE = Net:WaitForChild("RE/QuantumCloner/OnTeleport")

local ITEM_ID = "Grapple Hook"
local QUANTUM_CLONER = "Quantum Cloner"
local CURRENT_SPEED = 120

local fakeFireLoop
local lastWallTouch = 0

local function purchaseGrappleHook()
	pcall(function()
		RequestBuyRF:InvokeServer(ITEM_ID)
	end)
end

local function autoEquip()
	pcall(function()
		if not character or not humanoid or humanoid.Health <= 0 then
			return
		end
		
		local currentTool = character:FindFirstChildOfClass("Tool")
		if currentTool and currentTool.Name == ITEM_ID then
			return
		end
		
		local backpack = LocalPlayer:WaitForChild("Backpack")
		local grappleInBackpack = backpack:FindFirstChild(ITEM_ID)
		
		if grappleInBackpack then
			humanoid:EquipTool(grappleInBackpack)
		end
	end)
end

local function fakeFire()
	autoEquip()
	pcall(function()
		local args = {1.9832406361897787}
		UseItemRE:FireServer(table.unpack(args))
	end)
end

local function startFakeFireLoop()
	if fakeFireLoop then
		fakeFireLoop:Disconnect()
	end
	
	fakeFireLoop = RunService.Heartbeat:Connect(function()
		if flyToBestEnabled then
			fakeFire()
		end
	end)
end

local function parseMoneyPerSec(text)
	if not text then
		return 0
	end
	local number, suffix = text:match("%$(%d+%.?%d*)(%a*)/s")
	number = tonumber(number)
	if not number then
		return 0
	end
	
	if suffix == "k" then
		number = number * 1000
	elseif suffix == "m" then
		number = number * 1000000
	elseif suffix == "b" then
		number = number * 1000000000
	end
	
	return number
end

local function findBestAnimal()
	local bestMps = 0
	local bestPart = nil
	
	local plots = Workspace:FindFirstChild("Plots")
	if not plots then
		return nil
	end
	
	for _, plot in pairs(plots:GetChildren()) do
		local podiums = plot:FindFirstChild("AnimalPodiums")
		if podiums then
			for _, podium in pairs(podiums:GetChildren()) do
				local base = podium:FindFirstChild("Base")
				local spawnPart = base and base:FindFirstChild("Spawn")
				if spawnPart then
					local attach = spawnPart:FindFirstChild("Attachment")
					if attach then
						local overhead = attach:FindFirstChild("AnimalOverhead")
						if overhead then
							local label = overhead:FindFirstChild("Generation")
							if label and label:IsA("TextLabel") then
								local mps = parseMoneyPerSec(label.Text)
								if mps > bestMps then
									bestMps = mps
									bestPart = spawnPart
								end
							end
						end
					end
				end
			end
		end
	end
	
	return bestPart
end

local function activateQuantumCloner()
	pcall(function()
		RequestBuyRF:InvokeServer(QUANTUM_CLONER)
		
		local backpack = LocalPlayer:WaitForChild("Backpack")
		local currentTool = character:FindFirstChildOfClass("Tool")
		
		if currentTool and currentTool.Name == ITEM_ID then
			currentTool.Parent = backpack
		end
		
		local tool = backpack:FindFirstChild(QUANTUM_CLONER)
		if tool then
			tool.Parent = character
			UseItemRE:FireServer()
			QuantumTeleportRE:FireServer()
		end
	end)
end

local function isWall(part)
	if not part then
		return false
	end
	
	if part:IsA("BasePart") then
		if string.lower(part.Name):find("wall") or string.lower(part.Name):find("barrier") then
			return true
		end
		
		if part.Material == Enum.Material.Plastic or part.Material == Enum.Material.Wood then
			return true
		end
		
		if part.Parent and (part.Parent:IsA("Model") or part.Parent:IsA("Folder")) then
			local parentName = string.lower(part.Parent.Name)
			if parentName:find("wall") or parentName:find("barrier") or parentName:find("obstacle") then
				return true
			end
		end
	end
	
	return false
end

local function startAutoFly()
	if flyToBestConnection then
		flyToBestConnection:Disconnect()
	end
	
	flyToBestConnection = RunService.Heartbeat:Connect(function()
		if not flyToBestEnabled or not hrp then
			return
		end
		
		local bestPart = findBestAnimal()
		if not bestPart then
			return
		end
		
		local currentPos = hrp.Position
		local targetPos = bestPart.Position
		local distance = (targetPos - currentPos).Magnitude
		
		if distance <= 5 then
			flyToBestEnabled = false
			hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			hrp.CFrame = CFrame.new(hrp.Position, targetPos)
			fakeFire()
			return
		end
		
		local direction = (targetPos - currentPos).Unit
		
		if distance < 20 then
			direction = direction + Vector3.new(0, 0.3, 0)
		end
		
		hrp.AssemblyLinearVelocity = direction * CURRENT_SPEED
	end)
end

if hrp then
	hrp.Touched:Connect(function(hit)
		if flyToBestEnabled and isWall(hit) and tick() - lastWallTouch > 2 then
			lastWallTouch = tick()
			flyToBestEnabled = false
			hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			
			local bestPart = findBestAnimal()
			if bestPart then
				hrp.CFrame = CFrame.new(hrp.Position, bestPart.Position)
			end
			
			fakeFire()
			activateQuantumCloner()
			
			task.wait(1)
			flyToBestEnabled = true
		end
	end)
end

local function startFlyToBest()
	if flyToBestEnabled then
		return
	end
	flyToBestEnabled = true
	purchaseGrappleHook()
	startFakeFireLoop()
	startAutoFly()
end

local function stopFlyToBest()
	if not flyToBestEnabled then
		return
	end
	flyToBestEnabled = false
	if fakeFireLoop then
		fakeFireLoop:Disconnect()
		fakeFireLoop = nil
	end
	if flyToBestConnection then
		flyToBestConnection:Disconnect()
		flyToBestConnection = nil
	end
	if hrp then
		hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
	end
end

-- Anti-death variables
local originalHealth = humanoid.Health
local lastSafePosition = hrp.Position
local deathConnection
local respawned = false

local function getBasePosition()
    local plots = Workspace:FindFirstChild("Plots")
    if not plots then
        return nil
    end
    for _, plot in ipairs(plots:GetChildren()) do
        local sign = plot:FindFirstChild("PlotSign")
        local base = plot:FindFirstChild("DeliveryHitbox")
        if sign and sign:FindFirstChild("YourBase") and sign.YourBase.Enabled and base then
            return base.Position
        end
    end
    return nil
end

local Y_OFFSET = 9
local STOP_DISTANCE = 5

local currentTween
local function tweenWalkTo(position)
    if currentTween then
        currentTween:Cancel()
    end

    local startPos = hrp.Position
    local targetPos = Vector3.new(position.X, position.Y + Y_OFFSET, position.Z)
    local distance = (targetPos - startPos).Magnitude
    local speed = math.max(humanoid.WalkSpeed, 24)
    local duration = distance / speed
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)

    currentTween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(targetPos)})
    currentTween:Play()

    humanoid:ChangeState(Enum.HumanoidStateType.Running)
end

local tweenActive = false
local walkThread

local function isAtBase(basePos)
    if not basePos then
        return false
    end
    local dist = (hrp.Position - basePos).Magnitude
    return dist <= STOP_DISTANCE
end

-- Anti-death function
local function setupAntiDeath()
    -- Store safe position periodically
    local safePositionThread = task.spawn(function()
        while tweenActive do
            lastSafePosition = hrp.Position
            task.wait(0.5)
        end
    end)
    
    -- Monitor health
    deathConnection = humanoid.Died:Connect(function()
        respawned = true
        stopAutoTweenToBase()
        
        -- Wait for respawn
        humanoid:GetPropertyChangedSignal("Health"):Wait()
        if humanoid.Health > 0 then
            task.wait(2) -- Wait for respawn completion
            startAutoTweenToBase() -- Restart walking after respawn
        end
    end)
    
    -- Health monitoring
    humanoid.HealthChanged:Connect(function()
        if humanoid.Health < originalHealth * 0.3 then -- If health drops below 30%
            -- Teleport to last safe position
            hrp.CFrame = CFrame.new(lastSafePosition)
            humanoid.Health = originalHealth -- Restore health
        end
    end)
end

local function walkToBase()
    while tweenActive do
        -- Update last safe position
        lastSafePosition = hrp.Position
        
        local target = getBasePosition()
        if not target then
            break
        end

        if isAtBase(target) then
            stopAutoTweenToBase()
            break
        end

        local path = PathfindingService:CreatePath()
        local success, err = pcall(function()
            path:ComputeAsync(hrp.Position, target)
        end)
        
        if success and path.Status == Enum.PathStatus.Success then
            for _, waypoint in ipairs(path:GetWaypoints()) do
                if not tweenActive then
                    return
                end
                if isAtBase(target) then
                    stopAutoTweenToBase()
                    return
                end
                tweenWalkTo(waypoint.Position)
                task.wait(0.1)
            end
        else
            tweenWalkTo(target)
        end

        task.wait(1.5)
    end
end

local function startAutoTweenToBase()
    if tweenActive then
        return
    end
    tweenActive = true
    humanoid.WalkSpeed = 24
    
    -- Setup anti-death protection
    setupAntiDeath()

    walkThread = task.spawn(function()
        while tweenActive do
            walkToBase()
            task.wait(1)
        end
    end)
end

local function stopAutoTweenToBase()
    if not tweenActive then
        return
    end
    tweenActive = false
    
    -- Clean up anti-death connections
    if deathConnection then
        deathConnection:Disconnect()
        deathConnection = nil
    end
    
    if currentTween then
        currentTween:Cancel()
        currentTween = nil
    end
    if walkThread then
        task.cancel(walkThread)
        walkThread = nil
    end
    humanoid.WalkSpeed = 16
end

local function toggleAimbotLaser()
	aimbotLaserEnabled = not aimbotLaserEnabled
	
	if aimbotLaserEnabled then
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local HRP = char:WaitForChild("HumanoidRootPart")
		local backpack = LocalPlayer:WaitForChild("Backpack")
		local Event = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RE/UseItem")
		
		local range = 100
		local delayBetweenShots = 0.6
		
		local function getNearestPlayer(maxRange)
			maxRange = maxRange or math.huge
			if not LocalPlayer.Character then
				return nil
			end
			local myPos = HRP.Position
			local nearest = nil
			local shortest = maxRange
			for _, pl in ipairs(Players:GetPlayers()) do
				if pl ~= LocalPlayer and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
					local targetHrp = pl.Character.HumanoidRootPart
					local dist = (targetHrp.Position - myPos).Magnitude
					if dist < shortest then
						shortest = dist
						nearest = pl
					end
				end
			end
			return nearest
		end
		
		local function hasTool(toolName)
			return backpack:FindFirstChild(toolName) ~= nil
		end
		
		local function equipTool(toolName)
			local tool = backpack:FindFirstChild(toolName)
			if tool then
				tool.Parent = char
				return true
			end
			return false
		end
		
		local function equipOnlyTool(toolName)
			for _, tool in ipairs(char:GetChildren()) do
				if tool:IsA("Tool") then
					tool.Parent = backpack
				end
			end
			if hasTool(toolName) then
				equipTool(toolName)
				return true
			else
				return false
			end
		end
		
		local function useLaserCape(targetPart)
			if not targetPart then
				return
			end
			local args = {targetPart.Position, targetPart}
			pcall(function()
				Event:FireServer(table.unpack(args))
			end)
		end
		
		aimbotConnection = RunService.Heartbeat:Connect(function()
			if aimbotLaserEnabled and char and char.Parent then
				local target = getNearestPlayer(range)
				if target and target.Character then
					if equipOnlyTool("Laser Cape") then
						local hand = target.Character:FindFirstChild("RightHand") or target.Character:FindFirstChild("LeftHand")
						if hand then
							useLaserCape(hand)
							task.wait(delayBetweenShots)
						end
					end
				end
			end
		end)
	else
		if aimbotConnection then
			aimbotConnection:Disconnect()
			aimbotConnection = nil
		end
	end
end

local function runDesyncSequence()
	if desyncSequence and not desyncSequence.isStopped then
		desyncSequence.isStopped = true
	end
	
	desyncSequence = {}
	desyncSequence.isStopped = false
	desyncSequence.teleportIndices = {2, 4}
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	desyncSequence.randomTp = function()
		local max = 20
		if hrp then
			hrp.CFrame = hrp.CFrame * CFrame.new(
				math.random(-max, max),
				0,
				math.random(-max, max)
			)
		end
	end

	desyncSequence.sequence = {
		{flag = "WorldStepsOffsetAdjustRate", value = "-1", delay = 0},
		{flag = "WorldStepsOffsetAdjustRate", value = "60", delay = 12.57},
		{flag = "WorldStepsOffsetAdjustRate", value = "-9999999999", delay = 52.14},
		{flag = "WorldStepsOffsetAdjustRate", value = "-9999999999", delay = 66.15},
		{flag = "WorldStepsOffsetAdjustRate", value = "-1", delay = 1447.19},
	}

	task.spawn(function()
		for i, entry in ipairs(desyncSequence.sequence) do
			if desyncSequence.isStopped then
				break
			end
			if entry.delay > 0 then
				task.wait(entry.delay / 1000)
			end
			if desyncSequence.isStopped then
				break
			end
			pcall(function()
				setfflag(entry.flag, entry.value)
			end)
			if table.find(desyncSequence.teleportIndices, i) then
				desyncSequence.randomTp()
			end
		end
	end)
end

local function enableAntiHit()
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local backpack = LocalPlayer:WaitForChild("Backpack")
	humanoid:UnequipTools()
	local quantumCloner = backpack:FindFirstChild("Quantum Cloner") or backpack:FindFirstChild("QuantumCloner")
	if quantumCloner then
		humanoid:EquipTool(quantumCloner)
		quantumCloner:Activate()
	end
	task.wait(0.5)
	local teleportEvent = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RE/QuantumCloner/OnTeleport")
	teleportEvent:FireServer()
	setfflag("WorldStepMax", "-99999999999999")
	runDesyncSequence()
end

local connections = {
	SemiInvisible = {}
}

local clone, oldRoot, hip, animTrack, connection, characterConnection

local function semiInvisibleFunction()
	local DEPTH_OFFSET = 0.01

	local function removeFolders()  
		local playerName = LocalPlayer.Name  
		local playerFolder = Workspace:FindFirstChild(playerName)  
		if not playerFolder then  
			return  
		end  

		local doubleRig = playerFolder:FindFirstChild("DoubleRig")  
		if doubleRig then  
			doubleRig:Destroy()  
		end  

		local constraints = playerFolder:FindFirstChild("Constraints")  
		if constraints then  
			constraints:Destroy()  
		end  

		local childAddedConn = playerFolder.ChildAdded:Connect(function(child)  
			if child.Name == "DoubleRig" or child.Name == "Constraints" then  
				child:Destroy()  
			end  
		end)  
		table.insert(connections.SemiInvisible, childAddedConn)  
	end  

	local function doClone()  
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 then  
			hip = LocalPlayer.Character.Humanoid.HipHeight  
			oldRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
			if not oldRoot or not oldRoot.Parent then  
				return false  
			end  

			local tempParent = Instance.new("Model")  
			tempParent.Parent = game  
			LocalPlayer.Character.Parent = tempParent  

			clone = oldRoot:Clone()  
			clone.Parent = LocalPlayer.Character  
			oldRoot.Parent = game.Workspace.CurrentCamera  
			clone.CFrame = oldRoot.CFrame  

			LocalPlayer.Character.PrimaryPart = clone  
			LocalPlayer.Character.Parent = game.Workspace  

			for _, v in pairs(LocalPlayer.Character:GetDescendants()) do  
				if v:IsA("Weld") or v:IsA("Motor6D") then  
					if v.Part0 == oldRoot then  
						v.Part0 = clone  
					end  
					if v.Part1 == oldRoot then  
						v.Part1 = clone  
					end  
				end  
			end  

			tempParent:Destroy()  
			return true  
		end  
		return false  
	end  

	local function revertClone()  
		if not oldRoot or not oldRoot:IsDescendantOf(game.Workspace) or not LocalPlayer.Character or LocalPlayer.Character.Humanoid.Health <= 0 then  
			return false  
		end  

		local tempParent = Instance.new("Model")  
		tempParent.Parent = game  
		LocalPlayer.Character.Parent = tempParent  

		oldRoot.Parent = LocalPlayer.Character  
		LocalPlayer.Character.PrimaryPart = oldRoot  
		LocalPlayer.Character.Parent = game.Workspace  
		oldRoot.CanCollide = true  

		for _, v in pairs(LocalPlayer.Character:GetDescendants()) do  
			if v:IsA("Weld") or v:IsA("Motor6D") then  
				if v.Part0 == clone then  
					v.Part0 = oldRoot  
				end  
				if v.Part1 == clone then  
					v.Part1 = oldRoot  
				end  
			end  
		end  

		if clone then  
			local oldPos = clone.CFrame  
			clone:Destroy()  
			clone = nil  
			oldRoot.CFrame = oldPos  
		end  

		oldRoot = nil  
		if LocalPlayer.Character and LocalPlayer.Character.Humanoid then  
			LocalPlayer.Character.Humanoid.HipHeight = hip  
		end  
	end  

	local function animationTrickery()  
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 then  
			local anim = Instance.new("Animation")  
			anim.AnimationId = "http://www.roblox.com/asset/?id=18537363391"  
			local humanoid = LocalPlayer.Character.Humanoid  
			local animator = humanoid:FindFirstChild("Animator") or Instance.new("Animator", humanoid)  
			animTrack = animator:LoadAnimation(anim)  
			animTrack.Priority = Enum.AnimationPriority.Action4  
			animTrack:Play(0, 1, 0)  
			anim:Destroy()  

			local animStoppedConn = animTrack.Stopped:Connect(function()  
				if isInvisible then  
					animationTrickery()  
				end  
			end)  
			table.insert(connections.SemiInvisible, animStoppedConn)  

			task.delay(0, function()  
				if animTrack then
					animTrack.TimePosition = 0.7  
					task.delay(1, function()  
						if animTrack then
							animTrack:AdjustSpeed(math.huge)  
						end
					end)  
				end
			end)  
		end  
	end  

	local function enableInvisibility()  
		if not LocalPlayer.Character or LocalPlayer.Character.Humanoid.Health <= 0 then  
			return false
		end  

		removeFolders()  
		local success = doClone()  
		if success then  
			task.wait(0.1)  
			animationTrickery()  
			connection = RunService.PreSimulation:Connect(function(dt)  
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 and oldRoot then  
					local root = LocalPlayer.Character.PrimaryPart or LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
					if root then  
						local cf = root.CFrame - Vector3.new(0, LocalPlayer.Character.Humanoid.HipHeight + (root.Size.Y / 2) - 1 + DEPTH_OFFSET, 0)  
						oldRoot.CFrame = cf * CFrame.Angles(math.rad(180), 0, 0)  
						oldRoot.Velocity = root.Velocity  
						oldRoot.CanCollide = false  
					end  
				end  
			end)  
			table.insert(connections.SemiInvisible, connection)  

			characterConnection = LocalPlayer.CharacterAdded:Connect(function(newChar)
				if isInvisible then
					if animTrack then  
						animTrack:Stop()  
						animTrack:Destroy()  
						animTrack = nil  
					end  
					if connection then
						connection:Disconnect()
					end  
					revertClone()
					removeFolders()
					isInvisible = false
					
					for _, conn in ipairs(connections.SemiInvisible) do  
						if conn then
							conn:Disconnect()
						end  
					end  
					connections.SemiInvisible = {}
				end
			end)
			table.insert(connections.SemiInvisible, characterConnection)
			
			return true
		end  
		return false
	end  

	local function disableInvisibility()  
		if animTrack then  
			animTrack:Stop()  
			animTrack:Destroy()  
			animTrack = nil  
		end  
		if connection then
			connection:Disconnect()
		end  
		if characterConnection then
			characterConnection:Disconnect()
		end  
		revertClone()  
		removeFolders()  
	end

	local function setupGodmode()  
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()  
		local hum = char:WaitForChild("Humanoid")  
		local mt = getrawmetatable(game)  
		local oldNC = mt.__namecall  
		local oldNI = mt.__newindex  

		setreadonly(mt, false)  

		mt.__namecall = function(self, ...)  
			local m = getnamecallmethod()  
			if self == hum then  
				if m == "ChangeState" and select(1, ...) == Enum.HumanoidStateType.Dead then  
					return
				end
				if m == "SetStateEnabled" then
					local st, en = ...
					if st == Enum.HumanoidStateType.Dead and en == true then
						return
					end
				end
				if m == "Destroy" then
					return
				end
			end

			if self == char and m == "BreakJoints" then  
				return  
			end  

			return oldNC(self, ...)  
		end  

		mt.__newindex = function(self, k, v)  
			if self == hum then  
				if k == "Health" and type(v) == "number" and v <= 0 then  
					return  
				end  
				if k == "MaxHealth" and type(v) == "number" and v < hum.MaxHealth then  
					return  
				end  
				if k == "BreakJointsOnDeath" and v == true then  
					return  
				end  
				if k == "Parent" and v == nil then  
					return  
				end  
			end  

			return oldNI(self, k, v)  
		end  

		setreadonly(mt, true)  
	end  

	if not isInvisible then
		removeFolders()  
		setupGodmode()  
		if enableInvisibility() then
			isInvisible = true
		end
	else
		disableInvisibility()
		isInvisible = false
		
		pcall(function()  
			local oldGui = LocalPlayer.PlayerGui:FindFirstChild("InvisibleGui")  
			if oldGui then
				oldGui:Destroy()
			end  
		end)  
		for _, conn in ipairs(connections.SemiInvisible) do  
			if conn then
				conn:Disconnect()
			end  
		end  
		connections.SemiInvisible = {}  
	end
end

local LightHub = Instance.new("ScreenGui")
LightHub.Name = "LightHub"
LightHub.Parent = LocalPlayer:WaitForChild("PlayerGui")
LightHub.ResetOnSpawn = false

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 10, 0, 10)
ToggleBtn.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
ToggleBtn.BorderSizePixel = 0
ToggleBtn.Text = "LPH"
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.TextSize = 14
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.AutoButtonColor = false
ToggleBtn.Parent = LightHub

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.new(0.2, 0.2, 0.2)
ToggleStroke.Thickness = 2
ToggleStroke.Parent = ToggleBtn

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 200, 0, 240)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -120)
MainFrame.BackgroundColor3 = Color3.new(0.04, 0.04, 0.04)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.BackgroundTransparency = 0
MainFrame.Parent = LightHub

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.new(0.1, 0.1, 0.1)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.new(0.02, 0.02, 0.02)
TitleBar.BorderSizePixel = 0
TitleBar.BackgroundTransparency = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Size = UDim2.new(1, 0, 1, 0)
TitleText.Position = UDim2.new(0, 0, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "L1GHT PVP HELPER"
TitleText.TextColor3 = Color3.new(1, 1, 1)
TitleText.TextSize = 14
TitleText.Font = Enum.Font.GothamBold
TitleText.Parent = TitleBar

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 1, -60)
ContentFrame.Position = UDim2.new(0, 0, 0, 30)
ContentFrame.BackgroundColor3 = Color3.new(0.04, 0.04, 0.04)
ContentFrame.BorderSizePixel = 0
ContentFrame.BackgroundTransparency = 0
ContentFrame.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 10)
ContentCorner.Parent = ContentFrame

local ContentStroke = Instance.new("UIStroke")
ContentStroke.Color = Color3.new(0.1, 0.1, 0.1)
ContentStroke.Thickness = 1
ContentStroke.Parent = ContentFrame

local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, 0, 0, 40)
TabContainer.Position = UDim2.new(0, 0, 1, -40)
TabContainer.BackgroundColor3 = Color3.new(0.06, 0.06, 0.06)
TabContainer.BorderSizePixel = 0
TabContainer.BackgroundTransparency = 0
TabContainer.Parent = MainFrame

local TabContainerCorner = Instance.new("UICorner")
TabContainerCorner.CornerRadius = UDim.new(0, 10)
TabContainerCorner.Parent = TabContainer

local TabContainerStroke = Instance.new("UIStroke")
TabContainerStroke.Color = Color3.new(0.1, 0.1, 0.1)
TabContainerStroke.Thickness = 1
TabContainerStroke.Parent = TabContainer

local Tabs = {
	MAIN = Instance.new("TextButton"),
	HELPER = Instance.new("TextButton")
}

local TabPositions = {
	MAIN = UDim2.new(0, 10, 0, 5),
	HELPER = UDim2.new(0.5, 5, 0, 5)
}

for tabName, tabBtn in pairs(Tabs) do
	tabBtn.Name = tabName .. "Tab"
	tabBtn.Size = UDim2.new(0.5, -15, 1, -10)
	tabBtn.Position = TabPositions[tabName]
	tabBtn.BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
	tabBtn.BorderSizePixel = 0
	tabBtn.Text = tabName
	tabBtn.TextColor3 = Color3.new(0.6, 0.6, 0.6)
	tabBtn.TextSize = 12
	tabBtn.Font = Enum.Font.Gotham
	tabBtn.AutoButtonColor = false
	tabBtn.Parent = TabContainer
	
	local tabCorner = Instance.new("UICorner")
	tabCorner.CornerRadius = UDim.new(0, 6)
	tabCorner.Parent = tabBtn
	
	local tabStroke = Instance.new("UIStroke")
	tabStroke.Color = Color3.new(0.12, 0.12, 0.12)
	tabStroke.Thickness = 1
	tabStroke.Parent = tabBtn
end

local function createBtn(name, text, position, parent)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Size = UDim2.new(1, -20, 0, 35)
	btn.Position = position
	btn.BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
	btn.BorderSizePixel = 0
	btn.Text = text
	btn.TextColor3 = Color3.new(0.6, 0.6, 0.6)
	btn.TextSize = 12
	btn.Font = Enum.Font.Gotham
	btn.AutoButtonColor = false
	btn.Parent = parent
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn
	
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.new(0.12, 0.12, 0.12)
	stroke.Thickness = 1
	stroke.Parent = btn
	
	return btn
end

local ButtonStates = {
	SPEEDBOOST = false,
	FLYTOBEST = false,
	TWEENTOBASE = false,
	AUTOLASER = false,
	DESYNC = false,
	INVISIBLE = false
}

local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

TitleBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

local function toggleBtnState(btn, btnName)
	ButtonStates[btnName] = not ButtonStates[btnName]
	
	if ButtonStates[btnName] then
		TweenService:Create(btn, TweenInfo.new(0.2), {
			TextColor3 = Color3.new(1, 1, 1)
		}):Play()
	else
		TweenService:Create(btn, TweenInfo.new(0.2), {
			TextColor3 = Color3.new(0.6, 0.6, 0.6)
		}):Play()
	end
end

local function setupBtnHover(btn, btnName)
	btn.MouseEnter:Connect(function()
		if not ButtonStates[btnName] then
			TweenService:Create(btn, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.new(0.1, 0.1, 0.1),
				TextColor3 = Color3.new(0.8, 0.8, 0.8)
			}):Play()
		end
	end)
	
	btn.MouseLeave:Connect(function()
		if not ButtonStates[btnName] then
			TweenService:Create(btn, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.new(0.08, 0.08, 0.08),
				TextColor3 = Color3.new(0.6, 0.6, 0.6)
			}):Play()
		end
	end)
end

local function setupTabHover(tabBtn)
	tabBtn.MouseEnter:Connect(function()
		if tabBtn.TextColor3 == Color3.new(0.6, 0.6, 0.6) then
			TweenService:Create(tabBtn, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.new(0.1, 0.1, 0.1),
				TextColor3 = Color3.new(0.8, 0.8, 0.8)
			}):Play()
		end
	end)
	
	tabBtn.MouseLeave:Connect(function()
		if tabBtn.TextColor3 == Color3.new(0.8, 0.8, 0.8) then
			TweenService:Create(tabBtn, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.new(0.08, 0.08, 0.08),
				TextColor3 = Color3.new(0.6, 0.6, 0.6)
			}):Play()
		end
	end)
end

ToggleBtn.MouseButton1Click:Connect(function()
	if MainFrame.Visible then
		TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 1
		}):Play()
		TweenService:Create(TitleBar, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 1
		}):Play()
		TweenService:Create(ContentFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 1
		}):Play()
		TweenService:Create(TabContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 1
		}):Play()
		
		task.wait(0.3)
		MainFrame.Visible = false
	else
		MainFrame.Visible = true
		TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0
		}):Play()
		TweenService:Create(TitleBar, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0
		}):Play()
		TweenService:Create(ContentFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0
		}):Play()
		TweenService:Create(TabContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0
		}):Play()
	end
end)

local function clearContentFrame()
	for _, child in ipairs(ContentFrame:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end
end

local function switchTab(activeTab)
	for _, tabBtn in pairs(Tabs) do
		TweenService:Create(tabBtn, TweenInfo.new(0.2), {
			TextColor3 = Color3.new(0.6, 0.6, 0.6),
			BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
		}):Play()
	end
	
	TweenService:Create(activeTab, TweenInfo.new(0.2), {
		TextColor3 = Color3.new(1, 1, 1),
		BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
	}):Play()
	
	clearContentFrame()
end

local function loadMAINTab()
	local speedBoostBtn = createBtn("SPEEDBOOSTBtn", "SPEED BOOST", UDim2.new(0, 10, 0, 15), ContentFrame)
	local flyToBestBtn = createBtn("FLYTOBESTBtn", "FLY TO BEST", UDim2.new(0, 10, 0, 60), ContentFrame)
	local tweenToBaseBtn = createBtn("TWEENTOBASEBtn", "TWEEN TO BASE", UDim2.new(0, 10, 0, 105), ContentFrame)
	
	speedBoostBtn.MouseButton1Click:Connect(function() 
		toggleBtnState(speedBoostBtn, "SPEEDBOOST")
	end)
	flyToBestBtn.MouseButton1Click:Connect(function() 
		toggleBtnState(flyToBestBtn, "FLYTOBEST")
		if ButtonStates.FLYTOBEST then
			startFlyToBest()
		else
			stopFlyToBest()
		end
	end)
	tweenToBaseBtn.MouseButton1Click:Connect(function() 
		toggleBtnState(tweenToBaseBtn, "TWEENTOBASE")
		if ButtonStates.TWEENTOBASE then
			startAutoTweenToBase()
		else
			stopAutoTweenToBase()
		end
	end)
	
	setupBtnHover(speedBoostBtn, "SPEEDBOOST")
	setupBtnHover(flyToBestBtn, "FLYTOBEST")
	setupBtnHover(tweenToBaseBtn, "TWEENTOBASE")
end

local function loadHELPERtab()
	local autoLaserBtn = createBtn("AUTOLASERBtn", "AUTO LASER", UDim2.new(0, 10, 0, 15), ContentFrame)
	local desyncBtn = createBtn("DESYNCBtn", "DESYNC", UDim2.new(0, 10, 0, 60), ContentFrame)
	local invisibleBtn = createBtn("INVISIBLEBtn", "INVISIBLE", UDim2.new(0, 10, 0, 105), ContentFrame)
	
	autoLaserBtn.MouseButton1Click:Connect(function() 
		toggleBtnState(autoLaserBtn, "AUTOLASER")
		toggleAimbotLaser()
	end)
	desyncBtn.MouseButton1Click:Connect(function() 
		toggleBtnState(desyncBtn, "DESYNC")
		if ButtonStates.DESYNC then
			enableAntiHit()
		else
			pcall(function()
				setfflag("WorldStepsOffsetAdjustRate", "60")
			end)
			if desyncSequence then
				desyncSequence.isStopped = true
			end
		end
	end)
	invisibleBtn.MouseButton1Click:Connect(function() 
		toggleBtnState(invisibleBtn, "INVISIBLE")
		semiInvisibleFunction()
	end)
	
	setupBtnHover(autoLaserBtn, "AUTOLASER")
	setupBtnHover(desyncBtn, "DESYNC")
	setupBtnHover(invisibleBtn, "INVISIBLE")
end

for _, tabBtn in pairs(Tabs) do
	setupTabHover(tabBtn)
end

Tabs.MAIN.MouseButton1Click:Connect(function()
	switchTab(Tabs.MAIN)
	loadMAINTab()
end)

Tabs.HELPER.MouseButton1Click:Connect(function()
	switchTab(Tabs.HELPER)
	loadHELPERtab()
end)

TweenService:Create(Tabs.MAIN, TweenInfo.new(0.2), {
	TextColor3 = Color3.new(1, 1, 1),
	BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
}):Play()
loadMAINTab()

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.F and not gameProcessed then
		semiInvisibleFunction()
	end
end)

buyAndEquipSpeedCoil()