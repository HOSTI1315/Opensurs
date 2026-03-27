-- This file is licensed under the Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/legalcode.txt for details.
local Replicated = game:GetService("ReplicatedStorage")
local Input = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

local CollisionGroups = require(Replicated.Modules.CollisionGroups)
local WeaponRaycast = require(Replicated.Modules.WeaponRaycast)
local Maid = require(Replicated.Modules.Util.Maid)
local CharacterRayOrigin = require(Replicated.Modules.CharacterRayOrigin)
local BulletRenderer = require(Replicated.Modules.BulletRenderer)
local Tags = require(Replicated.Modules.Tags)

getgenv().controller = {}
getgenv().controller.lock = { gun = false, general = false }
getgenv().controller.gunCooldown = 0

local MUZZLE_ATTACHMENT_NAME = "Muzzle"
local FIRE_SOUND_NAME = "Fire"
local DEFAULT_RAYCAST_DISTANCE = 2000
local MOUSE_RAYCAST_OFFSET = 50

local currentCamera = workspace.CurrentCamera
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local mouse = player:GetMouse()

local shootGunRemote = Replicated.Remotes.ShootGun
local maid = Maid.new()
local currentTool = nil

local function canShoot(tool)
	local cooldown = tool:GetAttribute("Cooldown")
	if not cooldown then
		return true
	end
	if getgenv().controller.gunCooldown == 0 then
		return true
	end
	return (tick() - getgenv().controller.gunCooldown) >= cooldown
end

local function shootGun(tool, targetPosition)
	if getgenv().controller.lock.gun or getgenv().controller.lock.general then
		return
	end

	if not canShoot(tool) then
		return
	end

	local muzzleAttachment = tool:FindFirstChild(MUZZLE_ATTACHMENT_NAME, true)
	if not muzzleAttachment then
		warn("Muzzle attachment not found for gun: " .. tool.Name)
		return
	end

	getgenv().controller.gunCooldown = tick()

	if not targetPosition then
		targetPosition = mouse.Hit.Position + (MOUSE_RAYCAST_OFFSET * mouse.UnitRay.Direction)
	end

	local screenRayResult =
		WeaponRaycast(currentCamera.CFrame.Position, targetPosition, nil, CollisionGroups.SCREEN_RAYCAST)
	local characterOrigin = CharacterRayOrigin(character)
	if not characterOrigin then
		return
	end

	local finalTarget = targetPosition
	if screenRayResult and screenRayResult.Position then
		finalTarget = screenRayResult.Position
	end

	local worldRayResult = WeaponRaycast(characterOrigin, finalTarget)
	local hitResult = worldRayResult or screenRayResult

	local fireSound = tool:FindFirstChild(FIRE_SOUND_NAME)
	if fireSound then
		fireSound:Play()
	end

	BulletRenderer(muzzleAttachment.WorldPosition, finalTarget, tool:GetAttribute("BulletType"))
	tool:Activate()

	local hitInstance = hitResult and hitResult.Instance
	local hitPosition = hitResult and hitResult.Position
	shootGunRemote:FireServer(characterOrigin, finalTarget, hitInstance, hitPosition)
end

local function handleGunInput(tool)
	maid:GiveTask(Input.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.KeyCode == Enum.KeyCode.ButtonR2 then
			shootGun(tool)
		end
	end))

	maid:GiveTask(Input.TouchTapInWorld:Connect(function(position, gameProcessed)
		if gameProcessed then
			return
		end
		local worldPosition = WeaponRaycast.convertScreenPointToVector3(position, DEFAULT_RAYCAST_DISTANCE)
		shootGun(tool, worldPosition)
	end))
end

local function onGunEquipped(tool)
	maid:DoCleaning()
	currentTool = tool
	getgenv().controller.gunCooldown = 0
	handleGunInput(tool)

	maid:GiveTask(tool.AncestryChanged:Connect(function()
		if not tool:IsDescendantOf(character) then
			maid:DoCleaning()
			currentTool = nil
		end
	end))
end

return player.CharacterAdded:Connect(function(new)
	character = new
	humanoid = character:WaitForChild("Humanoid")
	animator = humanoid:WaitForChild("Animator")

	character.ChildAdded:Connect(function(child)
		if child:IsA("Tool") and CollectionService:HasTag(child, Tags.GUN_TOOL) then
			onGunEquipped(child)
		end
	end)

	for _, child in ipairs(character:GetChildren()) do
		if child:IsA("Tool") and CollectionService:HasTag(child, Tags.GUN_TOOL) then
			onGunEquipped(child)
		end
	end
end)