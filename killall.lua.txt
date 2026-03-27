-- This file is licensed under the Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/legalcode.txt for details.
local Players = game:GetService("Players")
local Run = game:GetService("RunService")
local Replicated = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local throwStartRemote = Replicated.Remotes:WaitForChild("ThrowStart")
local throwHitRemote = Replicated.Remotes:WaitForChild("ThrowHit")
local shootRemote = ReplicatedStorage.Remotes:WaitForChild("ShootGun")
local WEAPON_TYPE = { gun = "Gun_Equip", knife = "Knife_Equip" }

-- Uncomment this paragraph if you want to use the script standalone
-- getgenv().killButton = { gun = false, knife = false }
-- getgenv().killLoop = { gun = false, knife = false }

local localPlayer = Players.LocalPlayer
local lock = { gun = false, knife = false }
local enemyCache = {}

local function equipWeapon(weaponType)
	local backpack = localPlayer.Backpack
	local character = localPlayer.Character
	if not character or not backpack then
		return false
	end

	while task.wait(0.2) do
		for _, tool in pairs(backpack:GetChildren()) do
			if tool:GetAttribute("EquipAnimation") == weaponType then
				character.Humanoid:EquipTool(tool)
				return
			end
		end
	end
end

local function killAllKnife()
	local character = localPlayer.Character
	if not character then
		return
	end

	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		return
	end

	for _, part in pairs(enemyCache) do
		if part then
			local origin = humanoidRootPart.Position
			local direction = (part.Position - origin).Unit
			throwStartRemote:FireServer(origin, direction)
			throwHitRemote:FireServer(part, part.Position)
		end
	end
end

local function killAllGun()
	local character = localPlayer.Character
	if not character then
		return
	end

	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

	for _, part in pairs(enemyCache) do
		if part then
			shootRemote:FireServer(humanoidRootPart.Position, part.Position, part, part.Position)
		end
	end
end

local Connections = {}
Connections[0] = Run.Heartbeat:Connect(function()
	if getgenv().killButton.knife then
		equipWeapon(WEAPON_TYPE.knife)
		killAllKnife()
		getgenv().killButton.knife = false
	end

	if getgenv().killButton.gun then
		equipWeapon(WEAPON_TYPE.gun)
		killAllGun()
		getgenv().killButton.gun = false
	end
end)

Connections[1] = Run.Heartbeat:Connect(function()
	enemyCache = {}
	for _, enemy in pairs(Players:GetPlayers()) do
		if enemy and enemy ~= localPlayer and enemy.Team and enemy.Team ~= localPlayer.Team then
			if enemy.Character and enemy.Character.Parent == Workspace then
				local targetPart = enemy.Character:FindFirstChild("HumanoidRootPart")
				if targetPart then
					enemyCache[enemy] = targetPart
				end
			end
		end
	end
end)

Connections[2] = Run.RenderStepped:Connect(function()
	if getgenv().killLoop.gun and not lock.gun then
		killAllGun()
	end

	if getgenv().killLoop.knife and not lock.knife then
		killAllKnife()
	end
end)

Connections[3] = localPlayer.CharacterAdded:Connect(function()
	local character = localPlayer.Character
	if not character then
		return
	end

	lock.gun = true
	lock.knife = true

	if getgenv().killLoop.gun then
		equipWeapon(WEAPON_TYPE.gun)
	elseif getgenv().killLoop.knife then
		equipWeapon(WEAPON_TYPE.knife)
	end

	local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 3)
	if not humanoidRootPart or not localPlayer:GetAttribute("Match") then
		return
	end

	local anchoredConnection = humanoidRootPart:GetPropertyChangedSignal("Anchored"):Connect(function()
		if not humanoidRootPart.Anchored then
			if getgenv().killLoop.gun then
				lock.gun = false
			elseif getgenv().killLoop.knife then
				lock.knife = false
			end

			if anchoredConnection then
				anchoredConnection:Disconnect()
			end
		end
	end)
end)

return Connections