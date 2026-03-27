-- This file is licensed under the Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/legalcode.txt for details.
local Replicated = game:GetService("ReplicatedStorage")
local Collection = game:GetService("CollectionService")
local Tween = game:GetService("TweenService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Run = game:GetService("RunService")

--[[ Uncomment this paragraph if you want to use the script standalone
getgenv().aimConfig = {
	MAX_DISTANCE = 300,
	VISIBLE_PARTS = 4,
	CAMERA_CAST = true,
	FOV_CHECK = true,
	REACTION_TIME = 0.17,
	ACTION_TIME = 0.3,
	AUTO_EQUIP = true,
	NATIVE_UI = true,
	PREDICTION_TIME = 0.08,
	DEVIATION_ENABLED = true,
	AIM_DEVIATION = 10,
	RAYCAST_DISTANCE = 1000,
}
--]]

local WEAPON_TYPE = { GUN = "Gun_Equip", KNIFE = "Knife_Equip" }
local FOV_ANGLE = math.cos(math.rad(45))
local MAX_SQUARE = getgenv().aimConfig.MAX_DISTANCE * getgenv().aimConfig.MAX_DISTANCE

local camera = Workspace.CurrentCamera
local player = Players.LocalPlayer
local animations = Replicated.Animations
local remotes = Replicated.Remotes
local modules = Replicated.Modules

local shootAnim = animations:WaitForChild("Shoot")
local throwAnim = animations:WaitForChild("Throw")
local shootRemote = remotes:WaitForChild("ShootGun")
local throwStartRemote = remotes:WaitForChild("ThrowStart")
local throwHitRemote = remotes:WaitForChild("ThrowHit")
local bulletRenderer = require(modules:WaitForChild("BulletRenderer"))
local knifeController = require(modules:WaitForChild("KnifeProjectileController"))

getgenv().controller = {}
getgenv().controller.lock = { gun = false, knife = false, general = false }
getgenv().controller.gunCooldown = 0
local progressTween

local raycastParams = RaycastParams.new()
raycastParams.IgnoreWater = true
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

local groundRayParams = RaycastParams.new()
groundRayParams.FilterType = Enum.RaycastFilterType.Blacklist

local misfireRayParams = RaycastParams.new()
misfireRayParams.IgnoreWater = true
misfireRayParams.FilterType = Enum.RaycastFilterType.Blacklist

local playerReferences = {}
local function initializePlayer()
	local char = player.Character
	if not char or not char.Parent then
		return
	end
	
  local hrp = char:WaitForChild("HumanoidRootPart")
	local hum = char:WaitForChild("Humanoid")
	local animator = hum and hum:WaitForChild("Animator")
	playerReferences = { char, hrp, animator }
end

local function isInFov(pos)
	local toTarget = (pos - camera.CFrame.Position).Unit
	return camera.CFrame.LookVector:Dot(toTarget) >= FOV_ANGLE
end

local deviationSeed = math.random(1, 1000000)
local shotCount = 0

local function applyAimDeviation(originalPos, muzzlePos, targetChar)
	if not getgenv().aimConfig.DEVIATION_ENABLED then
		return originalPos, nil
	end

	shotCount = shotCount + 1
	math.randomseed(deviationSeed + shotCount)

	local direction = (originalPos - muzzlePos).Unit
	local distance = (originalPos - muzzlePos).Magnitude

	local distanceRatio = math.min(distance / getgenv().aimConfig.MAX_DISTANCE, 1.0)
	local distanceFalloff = 1 + (distanceRatio * distanceRatio * 2)

	local movementSpread = 0
	if targetChar then
		local humanoid = targetChar:FindFirstChildOfClass("Humanoid")
		if humanoid then
			local speed = humanoid.MoveDirection.Magnitude * humanoid.WalkSpeed
			movementSpread = math.min(speed / 50, 1.0) * 0.5
		end
	end

	local baseSpread = getgenv().aimConfig.AIM_DEVIATION * 0.1
	local totalSpread = baseSpread * distanceFalloff * (1 + movementSpread)

	local function normalRandom()
		local u1, u2 = math.random(), math.random()
		return math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
	end

	local horizontalDeviation = normalRandom() * totalSpread * math.rad(1)
	local verticalDeviation = normalRandom() * totalSpread * math.rad(1)

	local right = Vector3.new(-direction.Z, 0, direction.X)
	if right.Magnitude < 0.001 then
		right = Vector3.new(1, 0, 0)
	else
		right = right.Unit
	end
	local up = direction:Cross(right).Unit

	local deviatedDirection = (direction + right * math.tan(horizontalDeviation) + up * math.tan(verticalDeviation)).Unit

	misfireRayParams.FilterDescendantsInstances = { player.Character }
	local rayResult =
		Workspace:Raycast(muzzlePos, deviatedDirection * getgenv().aimConfig.RAYCAST_DISTANCE, misfireRayParams)

	if shotCount % 10 == 0 then
		math.randomseed(tick())
	end

	return rayResult and rayResult.Position or originalPos, rayResult and rayResult.Instance
end

local function predictTargetPoint(targetHrp)
	local currentPos = targetHrp.Position
	local rayOrigin = Vector3.new(currentPos.X, currentPos.Y + 15, currentPos.Z)

	groundRayParams.FilterDescendantsInstances = { targetHrp.Parent, player.Character }
	local rayResult = Workspace:Raycast(rayOrigin, Vector3.new(0, -80, 0), groundRayParams)

	if rayResult then
		local heightAboveGround = currentPos.Y - rayResult.Position.Y
		if heightAboveGround < 15 then
			return currentPos
		end
	end
	return currentPos
end

local function isValidTarget(targetPlayer, localHrp)
	if not targetPlayer or targetPlayer == player then
		return false
	end

	local char = targetPlayer.Character
	if not char or char.Parent ~= Workspace then
		return false
	end

	if not targetPlayer.Team or targetPlayer.Team == player.Team then
		return false
	end

	if Collection:HasTag(char, "Invulnerable") or Collection:HasTag(char, "SpeedTrail") then
		return false
	end

	local hum = char:FindFirstChild("Humanoid")
	local head = char:FindFirstChild("Head")
	local hrp = char:FindFirstChild("HumanoidRootPart")

	if not hum or hum.Health <= 0 or not head or not hrp then
		return false
	end

	local distanceVec = head.Position - localHrp.Position
	if distanceVec:Dot(distanceVec) > MAX_SQUARE then
		return false
	end

	return not getgenv().aimConfig.FOV_CHECK or isInFov(hrp.Position)
end

local function getVisibleParts(targetChar, localHrp)
	if not targetChar.Parent or not player.Character or not player.Character.Parent then
		return {}
	end

	local visibleParts = {}
	local cameraPos = camera.CFrame.Position
	raycastParams.FilterDescendantsInstances = { player.Character, targetChar }

	for _, part in ipairs(targetChar:GetChildren()) do
		if part:IsA("BasePart") then
			local directionFromHRP = part.Position - localHrp.Position
			local distanceFromHRP = directionFromHRP.Magnitude

			if distanceFromHRP > 0 then
				local resultFromHRP =
					Workspace:Raycast(localHrp.Position, directionFromHRP.Unit * distanceFromHRP, raycastParams)
				local visibleFromHRP = not resultFromHRP

				if visibleFromHRP then
					if not getgenv().aimConfig.CAMERA_CAST then
						table.insert(visibleParts, part)
					else
						local directionFromCamera = part.Position - cameraPos
						local distanceFromCamera = directionFromCamera.Magnitude

						if distanceFromCamera > 0 then
							local resultFromCamera = Workspace:Raycast(
								cameraPos,
								directionFromCamera.Unit * distanceFromCamera,
								raycastParams
							)
							if not resultFromCamera then
								table.insert(visibleParts, part)
							end
						end
					end
				end
			end
		end
	end

	return visibleParts
end

local function getWeapon(weaponType)
	local char = player.Character
	if not char or not char.Parent then
		return
	end

	for _, tool in ipairs(char:GetChildren()) do
		if tool:IsA("Tool") and (not weaponType or tool:GetAttribute("EquipAnimation") == weaponType) then
			return tool
		end
	end
end

local function findBestTarget(localHrp)
	local bestTarget, bestPart, bestKnifeTarget, bestKnifePoint = nil, nil, nil, nil
	local closestDist = getgenv().aimConfig.MAX_DISTANCE + 1

	for _, targetPlayer in ipairs(Players:GetPlayers()) do
		if isValidTarget(targetPlayer, localHrp) then
			local targetChar = targetPlayer.Character
			local visible = getVisibleParts(targetChar, localHrp)

			if #visible >= getgenv().aimConfig.VISIBLE_PARTS then
				local hrp = targetChar:FindFirstChild("HumanoidRootPart")
				if hrp then
					local dist = (hrp.Position - localHrp.Position).Magnitude

					if dist < closestDist then
						closestDist = dist
						bestTarget = targetPlayer

						local priorityPart = nil
						for _, part in ipairs(visible) do
							local partName = part.Name:lower()
							if partName:find("uppertorso") or partName:find("humanoidrootpart") then
								priorityPart = part
								break
							end
						end
						bestPart = priorityPart or visible[1]
						bestKnifeTarget = targetPlayer
						bestKnifePoint = predictTargetPoint(hrp)
					end
				end
			end
		end
	end

	return bestTarget, bestPart, bestKnifeTarget, bestKnifePoint
end

local function updateUIHighlight(tool)
	if not getgenv().aimConfig.NATIVE_UI or not tool then
		return
	end

	local success, backpackUi = pcall(function()
		return player:WaitForChild("PlayerGui"):WaitForChild("Backpack")
	end)
	if not success or not backpackUi then
		return
	end

	local buttonFrame = backpackUi.Container and backpackUi.Container.ButtonFrame
	if not buttonFrame then
		return
	end

	for _, button in ipairs(buttonFrame:GetChildren()) do
		if button:IsA("TextButton") then
			button.UIStroke.Enabled = (button.Container.Icon.Image == tool.TextureId)
		end
	end
end

local function renderCooldown(tool)
	if not tool or not getgenv().aimConfig.NATIVE_UI then
		return
	end

	local success, backpack = pcall(function()
		return player.PlayerGui:WaitForChild("Backpack")
	end)
	if not success then
		return
	end

	local cooldown = tool:GetAttribute("Cooldown")
	local buttonFrame = backpack.Container and backpack.Container.ButtonFrame
	if not buttonFrame then
		return
	end

	for _, button in ipairs(buttonFrame:GetChildren()) do
		if button:IsA("TextButton") and button.Container.Icon.Image == tool.TextureId then
			local cooldownBar = button:FindFirstChild("CooldownBar")
			local gradient = cooldownBar and cooldownBar.Bar and cooldownBar.Bar:FindFirstChild("UIGradient")

			if cooldownBar and gradient then
				gradient.Offset = Vector2.new(0, 0)
				cooldownBar.Visible = true

				progressTween = Tween:Create(
					gradient,
					TweenInfo.new(cooldown, Enum.EasingStyle.Linear),
					{ Offset = Vector2.new(-1, 0) }
				)

				progressTween.Completed:Connect(function()
					cooldownBar.Visible = false
				end)
				progressTween:Play()
			end
			break
		end
	end
end

local function fireGun(targetPos, hitPart, localHrp, animator)
	if getgenv().controller.lock.gun then
		return
	end
	getgenv().controller.lock.gun = true

	local gun = getWeapon(WEAPON_TYPE.GUN)
	if not gun then
		getgenv().controller.lock.gun = false
		return
	end

	local cooldown = gun:GetAttribute("Cooldown") or 2.5
	if tick() - getgenv().controller.gunCooldown < cooldown then
		getgenv().controller.lock.gun = false
		return
	end

	local muzzle = gun:FindFirstChild("Muzzle", true)
	if not muzzle then
		getgenv().controller.lock.gun = false
		return
	end

	-- Revalidate target and get best visible part
	local targetChar = hitPart and hitPart.Parent
	if targetChar then
		local visibleParts = getVisibleParts(targetChar, localHrp)
		if #visibleParts >= getgenv().aimConfig.VISIBLE_PARTS then
			for _, part in ipairs(visibleParts) do
				local lowerName = part.Name:lower()
				if lowerName:find("uppertorso") or lowerName:find("humanoidrootpart") then
					hitPart = part
					targetPos = part.Position
					break
				end
			end
		end
	end

	local muzzlePos = muzzle.WorldPosition
	local finalPos, actualHitPart = applyAimDeviation(targetPos, muzzlePos, targetChar)

	local animTrack = animator:LoadAnimation(shootAnim)
	animTrack:Play()

	local sound = gun:FindFirstChild("Fire")
	if sound then
		sound:Play()
	end

	bulletRenderer(muzzlePos, finalPos, "Default")
	shootRemote:FireServer(muzzlePos, finalPos, actualHitPart or hitPart, finalPos)

	getgenv().controller.gunCooldown = tick()
	renderCooldown(gun)

	task.wait(animTrack.Length or 0.5)
	getgenv().controller.lock.gun = false
end

local function throwKnife(targetPos, hitPart, localHrp, animator)
	if getgenv().controller.lock.knife then
		return
	end
	getgenv().controller.lock.knife = true

	local knife = getWeapon(WEAPON_TYPE.KNIFE)
	if not knife then
		getgenv().controller.lock.knife = false
		return
	end

	local handle = knife:FindFirstChild("RightHandle")
	if not handle then
		getgenv().controller.lock.knife = false
		return
	end

	local finalPos = applyAimDeviation(targetPos, localHrp.Position)
	local direction = (finalPos - localHrp.Position).Unit

	local animTrack = animator:LoadAnimation(throwAnim)
	animTrack:Play()

	local sound = knife:FindFirstChild("ThrowSound")
	if sound then
		sound:Play()
	end

	throwStartRemote:FireServer(localHrp.Position, direction)
	knifeController({
		Speed = knife:GetAttribute("ThrowSpeed") or 150,
		KnifeProjectile = handle:Clone(),
		Direction = direction,
		Origin = localHrp.Position,
		IgnoreCharacter = player.Character,
	}, function(result)
		if result and result.Instance then
			throwHitRemote:FireServer(result.Instance, result.Position)
		end
		task.wait(1)
		getgenv().controller.lock.knife = false
	end)
end

local function equipWeapon(weaponType, callback)
	local char = player.Character
	if not char then
		if callback then
			callback(false, "No character")
		end
		return
	end

	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		if callback then
			callback(false, "No humanoid")
		end
		return
	end

	local currentTool = getWeapon()
	local targetTool = getWeapon(weaponType)

	if not targetTool and player.Backpack then
		for _, tool in ipairs(player.Backpack:GetChildren()) do
			if tool:IsA("Tool") and tool:GetAttribute("EquipAnimation") == weaponType then
				targetTool = tool
				break
			end
		end
	end

	if not targetTool then
		if callback then
			callback(false, "Tool not found")
		end
		return
	end

	if currentTool == targetTool then
		if callback then
			callback(true, targetTool)
		end
		return
	end

	if currentTool then
		humanoid:UnequipTools()
		getgenv().controller.lock.general = true
		task.wait(getgenv().aimConfig.ACTION_TIME)
		if targetTool.Parent ~= player.Backpack then
			getgenv().controller.lock.general = false
			if callback then
				callback(false, "Tool no longer available")
			end
			return
		end
		humanoid:EquipTool(targetTool)
		task.wait(getgenv().aimConfig.ACTION_TIME)
		getgenv().controller.lock.general = false
		if callback then
			callback(true, targetTool)
		end
	else
		humanoid:EquipTool(targetTool)
		getgenv().controller.lock.general = true
		task.wait(getgenv().aimConfig.ACTION_TIME)
		getgenv().controller.lock.general = false
		if callback then
			callback(true, targetTool)
		end
	end
end

local function handleAutoEquip(bestTarget, bestPart, bestKnifeTarget, bestKnifePoint, localHrp, animator)
	if getgenv().controller.lock.general then
		return
	end
	getgenv().controller.lock.general = true

	if bestTarget and bestPart and not isValidTarget(bestTarget, localHrp) then
		getgenv().controller.lock.general = false
		return
	end
	if bestKnifeTarget and bestKnifePoint and not isValidTarget(bestKnifeTarget, localHrp) then
		getgenv().controller.lock.general = false
		return
	end

	local gunEquipped = getWeapon(WEAPON_TYPE.GUN)
	local gunInBackpack = nil
	if player.Backpack then
		for _, tool in ipairs(player.Backpack:GetChildren()) do
			if tool:IsA("Tool") and tool:GetAttribute("EquipAnimation") == WEAPON_TYPE.GUN then
				gunInBackpack = tool
				break
			end
		end
	end

	local gunAvailable = gunEquipped or gunInBackpack
	local gunReady = gunAvailable
		and not getgenv().controller.lock.gun
		and (tick() - getgenv().controller.gunCooldown >= ((gunEquipped or gunInBackpack):GetAttribute("Cooldown") or 2.5))

	local knifeEquipped = getWeapon(WEAPON_TYPE.KNIFE)
	local knifeInBackpack = nil
	if player.Backpack then
		for _, tool in ipairs(player.Backpack:GetChildren()) do
			if tool:IsA("Tool") and tool:GetAttribute("EquipAnimation") == WEAPON_TYPE.KNIFE then
				knifeInBackpack = tool
				break
			end
		end
	end

	local knifeAvailable = (knifeEquipped or knifeInBackpack) and not getgenv().controller.lock.knife

	if gunReady then
		if gunEquipped then
		  task.wait(getgenv().aimConfig.REACTION_TIME)
			fireGun(bestPart.Position, bestPart, localHrp, animator)
			getgenv().controller.lock.general = false
		else
			equipWeapon(WEAPON_TYPE.GUN, function(success, gun)
				if success and bestPart and bestPart.Parent then
					-- Revalidate target after equip
					if bestTarget and isValidTarget(bestTarget, localHrp) then
						updateUIHighlight(gun)
						fireGun(bestPart.Position, bestPart, localHrp, animator)
					end
				end
				getgenv().controller.lock.general = false
			end)
		end
	elseif knifeAvailable then
		if knifeEquipped then
			if bestKnifeTarget and bestKnifePoint and isValidTarget(bestKnifeTarget, localHrp) then
				local targetHrp = bestKnifeTarget.Character:FindFirstChild("HumanoidRootPart")
				if targetHrp then
				  task.wait(getgenv().aimConfig.REACTION_TIME)
					throwKnife(bestKnifePoint, targetHrp, localHrp, animator)
				end
			end
			getgenv().controller.lock.general = false
		else
			equipWeapon(WEAPON_TYPE.KNIFE, function(success, knife)
				if success then
					updateUIHighlight(knife)
					if bestKnifeTarget and bestKnifePoint and isValidTarget(bestKnifeTarget, localHrp) then
						local targetHrp = bestKnifeTarget.Character:FindFirstChild("HumanoidRootPart")
						if targetHrp then
							throwKnife(bestKnifePoint, targetHrp, localHrp, animator)
						end
					end
				end
				getgenv().controller.lock.general = false
			end)
		end
	else
		getgenv().controller.lock.general = false
	end
end

local function handleCombat()
	local char, localHrp, animator = unpack(playerReferences)
	if not char or not localHrp or not animator then
		return
	end

	if
		Collection:HasTag(char, "Invulnerable")
		or Collection:HasTag(char, "CombatDisabled")
		or Collection:HasTag(char, "SpeedTrail")
	then
		return
	end

	local bestTarget, bestPart, bestKnifeTarget, bestKnifePoint = findBestTarget(localHrp)
	if not bestTarget or not bestPart then
		return
	end

	if getgenv().aimConfig.AUTO_EQUIP then
		handleAutoEquip(bestTarget, bestPart, bestKnifeTarget, bestKnifePoint, localHrp, animator)
		return
	end

	if getgenv().controller.lock.general then
		return
	end

	local weapon = getWeapon()
	if not weapon then
		return
	end

	task.wait(getgenv().aimConfig.REACTION_TIME)
	if not isValidTarget(bestTarget, localHrp) then
		return
	end

	local equipType = weapon:GetAttribute("EquipAnimation")
	if equipType == WEAPON_TYPE.GUN then
		local gunReady = not getgenv().controller.lock.gun and (tick() - getgenv().controller.gunCooldown >= (weapon:GetAttribute("Cooldown") or 2.5))
		if gunReady and bestPart and bestPart.Parent then
			fireGun(bestPart.Position, bestPart, localHrp, animator)
		end
	elseif equipType == WEAPON_TYPE.KNIFE then
		if not getgenv().controller.lock.knife and bestKnifeTarget and bestKnifePoint and isValidTarget(bestKnifeTarget, localHrp) then
			local targetHrp = bestKnifeTarget.Character:FindFirstChild("HumanoidRootPart")
			if targetHrp then
				throwKnife(bestKnifePoint, targetHrp, localHrp, animator)
			end
		end
	end
end

local Connections = {}
Connections[0] = Run.RenderStepped:Connect(handleCombat)
Connections[1] = player.CharacterAdded:Connect(initializePlayer)

return Connections