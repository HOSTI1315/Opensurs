-- This file is licensed under the Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/legalcode.txt for details.
local Replicated = game:GetService("ReplicatedStorage")
local Input = game:GetService("UserInputService")
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")
local CollectionService = game:GetService("CollectionService")

local CollisionGroups = require(Replicated.Modules.CollisionGroups)
local WeaponRaycast = require(Replicated.Modules.WeaponRaycast)
local Promise = require(Replicated.Modules.Util.Promise)
local Maid = require(Replicated.Modules.Util.Maid)
local CharacterRayOrigin = require(Replicated.Modules.CharacterRayOrigin)
local KnifeProjectileController = require(Replicated.Modules.KnifeProjectileController)
local Hitbox = require(Replicated.Modules.Hitbox)
local Tags = require(Replicated.Modules.Tags)

getgenv().controller = {}
getgenv().controller.lock = { knife = false, general = false }

local THROW_ANIMATION_SPEED = 1.4
local CHARGE_DELAY = 0.25
local KNIFE_HANDLE_NAME = "RightHandle"

local currentCamera = workspace.CurrentCamera
local player = Players.LocalPlayer
local character = player.Character
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local mouse = player:GetMouse()
local playerGui = player.PlayerGui

local throwAnimation = Replicated.Animations.Throw
local touchControlsGui = Replicated.Gui.KnifeTouchControls:Clone()
local throwButton = touchControlsGui.ThrowButton
local modeLabel = throwButton.Mode

local throwStartRemote = Replicated.Remotes.ThrowStart
local throwHitRemote = Replicated.Remotes.ThrowHit
local stabRemote = Replicated.Remotes.Stab

local isStabMode = false
local currentThrowPromise = nil
local currentTool = nil
local maid = Maid.new()

touchControlsGui.Parent = playerGui
local hasMouseEnabled = Input.MouseEnabled
local hasTouchEnabled = Input.TouchEnabled and not Input.KeyboardEnabled

if hasTouchEnabled then
	spawn(function()
		local jumpButton =
			playerGui:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")

		local function calibrateControls()
			local buttonHeight = jumpButton.AbsoluteSize.Y
			throwButton.Size = UDim2.new(0, jumpButton.AbsoluteSize.X * 0.9, 0, buttonHeight * 0.9)
			throwButton.Position =
				UDim2.new(0, jumpButton.AbsolutePosition.X - 30, 0, jumpButton.AbsolutePosition.Y + buttonHeight - 30)
		end

		calibrateControls()
		jumpButton.Changed:Connect(calibrateControls)
	end)
end

local function getThrowDirection(targetPosition, hrpPosition)
	local screenRayResult =
		WeaponRaycast(currentCamera.CFrame.Position, targetPosition, nil, CollisionGroups.SCREEN_RAYCAST)
	local finalTarget = targetPosition

	if screenRayResult and screenRayResult.Position then
		local worldRayResult = WeaponRaycast(hrpPosition, screenRayResult.Position)
		if worldRayResult and worldRayResult.Position then
			finalTarget = worldRayResult.Position
		else
			finalTarget = screenRayResult.Position
		end
	end

	return (finalTarget - hrpPosition).Unit
end

local function setKnifeHandleTransparency(tool, transparency)
	local rightHandle = tool:FindFirstChild(KNIFE_HANDLE_NAME)
	if not rightHandle then
		return
	end

	rightHandle.LocalTransparencyModifier = transparency

	for _, descendant in ipairs(rightHandle:GetDescendants()) do
		if descendant:IsA("BasePart") then
			descendant.LocalTransparencyModifier = transparency
		elseif descendant:IsA("Trail") then
			descendant.Enabled = transparency < 1
		end
	end
end

local function throwKnife(tool, targetPosition, isManualActivation)
	if getgenv().controller.lock.knife or getgenv().controller.lock.general then
		return
	end

	if currentThrowPromise or not tool.Enabled then
		return
	end

	local knifeHandle = tool:FindFirstChild(KNIFE_HANDLE_NAME)
	if not knifeHandle then
		return
	end

	local hrpPosition = targetPosition and CharacterRayOrigin(character)
	local throwDirection

	if targetPosition then
		throwDirection = getThrowDirection(targetPosition, hrpPosition)
	end

	local function createKnifeProjectile()
		if not hrpPosition then
			hrpPosition = CharacterRayOrigin(character)
			if not hrpPosition then
				return
			end
		end

		if not throwDirection then
			throwDirection = getThrowDirection(targetPosition, hrpPosition)
		end

		setKnifeHandleTransparency(tool, 1)
		throwStartRemote:FireServer(hrpPosition, throwDirection)
		KnifeProjectileController({
			Speed = tool:GetAttribute("ThrowSpeed"),
			KnifeProjectile = knifeHandle:Clone(),
			Direction = throwDirection,
			Origin = hrpPosition,
		}, function(hitResult)
			local hitInstance = hitResult and hitResult.Instance
			local hitPosition = hitResult and hitResult.Position
			throwHitRemote:FireServer(hitInstance, hitPosition)
		end)
	end

	if not hasMouseEnabled then
		local throwAnimationTrack = animator:LoadAnimation(throwAnimation)

		currentThrowPromise = Promise.new(function(resolve, reject, onCancel)
			onCancel(function()
				throwAnimationTrack:Stop(0)
			end)

			throwAnimationTrack:GetMarkerReachedSignal("Completed"):Connect(function()
				if not targetPosition then
					targetPosition = mouse.Hit.Position
				end
				resolve()
			end)

			throwAnimationTrack.Ended:Connect(function()
				setKnifeHandleTransparency(tool, 0)
				currentThrowPromise = nil
				throwAnimationTrack:Destroy()
			end)

			throwAnimationTrack:Play(nil, nil, THROW_ANIMATION_SPEED)
		end):andThen(function()
			createKnifeProjectile()
		end)

		maid:GiveTask(function()
			if currentThrowPromise then
				currentThrowPromise:cancel()
			end
		end)
	else
		createKnifeProjectile()
	end
end

local function handleStabInput(tool)
	local hitTargets = {}

	local hitboxController = Hitbox(tool, function(hitResult)
		local hitCharacter = hitResult.Instance.Parent
		local targetHumanoid = hitCharacter and hitCharacter:FindFirstChild("Humanoid")

		if not targetHumanoid or hitTargets[hitCharacter] then
			return
		end

		hitTargets[hitCharacter] = true
		stabRemote:FireServer(hitResult.Instance)
	end)

	maid:GiveTask(tool:GetAttributeChangedSignal("IsActivated"):Connect(function()
		if tool:GetAttribute("IsActivated") then
			hitboxController.Activate()
		else
			hitTargets = {}
			hitboxController.Deactivate()
		end
	end))

	maid:GiveTask(tool.Activated:Connect(function()
		if getgenv().controller.lock.knife or getgenv().controller.lock.general then
			return
		end

		if isStabMode then
			hitboxController.Activate()
			wait(0.1)
			hitboxController.Deactivate()
			hitTargets = {}
		end
	end))

	maid:GiveTask(function()
		hitboxController.Deactivate()
	end)
end

local chargeAnimationTrack = animator:LoadAnimation(throwAnimation)
local function handleMouseThrowInput(tool)
	local isCharged = false
	local chargePromise = nil

	maid:GiveTask(chargeAnimationTrack:GetMarkerReachedSignal("Completed"):Connect(function()
		isCharged = true
		chargeAnimationTrack:AdjustSpeed(0)
	end))

	maid:GiveTask(chargeAnimationTrack.Ended:Connect(function()
		isCharged = false
		setKnifeHandleTransparency(tool, 0)
	end))

	maid:GiveTask(Input.InputBegan:Connect(function(input, gameProcessed)
		if
			gameProcessed
			or input.UserInputType ~= Enum.UserInputType.MouseButton1
			or chargeAnimationTrack.IsPlaying
			or isCharged
			or isStabMode
		then
			return
		end

		chargePromise = Promise.delay(CHARGE_DELAY):andThen(function()
			chargeAnimationTrack:Play(nil, nil, THROW_ANIMATION_SPEED)
		end)
	end))

	maid:GiveTask(Input.InputEnded:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		if isStabMode then
			tool:Activate()
			return
		end

		if not chargePromise then
			return
		end

		chargePromise:cancel()
		chargePromise = nil

		if not chargeAnimationTrack.IsPlaying or not isCharged then
			chargeAnimationTrack:Stop()
			task.wait()
			tool:Activate()
			return
		end

		chargeAnimationTrack:AdjustSpeed(1)
		throwKnife(tool, mouse.Hit.Position)
	end))

	maid:GiveTask(function()
		if chargePromise then
			chargePromise:cancel()
		end
		chargeAnimationTrack:Stop()
		setKnifeHandleTransparency(tool, 0)
	end)
end

local function handleThrowInput(tool)
	maid:GiveTask(throwButton.MouseButton1Down:Connect(function()
		isStabMode = not isStabMode
		modeLabel.Text = isStabMode and "Throw Mode" or "Stab Mode"

		tool.ManualActivationOnly = not isStabMode
	end))

	if hasMouseEnabled and Input.MouseEnabled then
		handleMouseThrowInput(tool)
	else
		ContextActionService:BindAction("Throw", function(actionName, inputState)
			if actionName == "Throw" and inputState == Enum.UserInputState.Begin then
				if isStabMode then
					tool:Activate()
				else
					throwKnife(tool, nil, true)
				end
			end
		end, false, Enum.KeyCode.E, Enum.KeyCode.ButtonL2)

		maid:GiveTask(function()
			ContextActionService:UnbindAction("Throw")
		end)
	end

	maid:GiveTask(Input.TouchTapInWorld:Connect(function(position, gameProcessed)
		if gameProcessed then
			return
		end

		if isStabMode then
			tool:Activate()
		else
			local worldPosition = WeaponRaycast.convertScreenPointToVector3(position, 2000)
			throwKnife(tool, worldPosition)
		end
	end))
end

local function onKnifeEquipped(tool)
	maid:DoCleaning()
	currentTool = tool

	tool.ManualActivationOnly = not isStabMode
	touchControlsGui.Enabled = hasTouchEnabled
	modeLabel.Text = isStabMode and "Throw Mode" or "Stab Mode"

	maid:GiveTask(function()
		touchControlsGui.Enabled = false
		currentTool = nil
	end)

	handleStabInput(tool)
	handleThrowInput(tool)

	maid:GiveTask(tool.AncestryChanged:Connect(function()
		if not tool:IsDescendantOf(character) then
			maid:DoCleaning()
		end
	end))
end

return player.CharacterAdded:Connect(function(new)
	character = new
	humanoid = character:WaitForChild("Humanoid")
	animator = humanoid:WaitForChild("Animator")

	character.ChildAdded:Connect(function(child)
		if child:IsA("Tool") and CollectionService:HasTag(child, Tags.KNIFE_TOOL) then
			onKnifeEquipped(child)
		end
	end)

	for _, child in ipairs(character:GetChildren()) do
		if child:IsA("Tool") and CollectionService:HasTag(child, Tags.GUN_TOOL) then
			onKnifeEquipped(child)
		end
	end
end)