-- This file is licensed under the Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/legalcode.txt for details.
local Players = game:GetService("Players")
local Run = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local TEAMMATE_OUTLINE = Color3.fromRGB(30, 214, 134)
local TEAMMATE_FILL = Color3.fromRGB(15, 107, 67)
local ENEMY_OUTLINE = Color3.fromRGB(255, 41, 121)
local ENEMY_FILL = Color3.fromRGB(127, 20, 60)

local localPlayer = Players.LocalPlayer
local teammates = {}
local enemies = {}

-- Uncomment this paragraph if you want to use the script standalone
-- getgenv().espTeamMate = true
-- getgenv().espEnemies = true

local function createEnemyBillboard(humanoidRootPart)
	local billboard = Instance.new("BillboardGui")
	billboard.Name = "EnemyBillboard"
	billboard.Adornee = humanoidRootPart
	billboard.AlwaysOnTop = true
	billboard.Size = UDim2.new(1, 0, 1, 0)
	billboard.StudsOffset = Vector3.new(0, 0, 0)
	billboard.Parent = humanoidRootPart

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = ENEMY_OUTLINE
	frame.BackgroundTransparency = 0
	frame.BorderSizePixel = 0
	frame.Parent = billboard

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = frame
end

local Connections = {}
Connections[0] = localPlayer.CharacterAdded:Connect(function()
	teammates = {}
	enemies = {}

	for _, player in pairs(Players:GetPlayers()) do
		if
			player
			and player ~= localPlayer
			and player.Team
			and player.Character
			and player.Character.Parent == Workspace
		then
			if player.Team == localPlayer.Team then
				table.insert(teammates, player)
			else
				table.insert(enemies, player)
			end
		end
	end
end)

Connections[1] = Run.Heartbeat:Connect(function()
	if not localPlayer:GetAttribute("Match") then
		return
	end

	if getgenv().espTeamMates then
		for _, player in ipairs(teammates) do
			local character = player.Character
			local hrp = character and character:FindFirstChild("HumanoidRootPart")
			if character and hrp then
				local highlight = character:FindFirstChild("TeamHighlight")
				if not highlight then
					highlight = Instance.new("Highlight")
					highlight.Name = "TeamHighlight"
					highlight.Parent = character
				end

				highlight.Enabled = true
				highlight.OutlineColor = TEAMMATE_OUTLINE
				highlight.FillColor = TEAMMATE_FILL
				highlight.FillTransparency = 0.7

				local existingBillboard = hrp:FindFirstChild("EnemyBillboard")
				if existingBillboard then
					existingBillboard:Destroy()
				end
			end
		end
	end

	if getgenv().espEnemies then
		for _, player in ipairs(enemies) do
			local character = player.Character
			local hrp = character and character:FindFirstChild("HumanoidRootPart")
			if character and hrp then
				local highlight = character:FindFirstChild("TeamHighlight")
				if not highlight then
					highlight = Instance.new("Highlight")
					highlight.Name = "TeamHighlight"
					highlight.Parent = character
				end

				highlight.Enabled = true
				highlight.OutlineColor = ENEMY_OUTLINE
				highlight.FillColor = ENEMY_FILL
				highlight.FillTransparency = 0.7

				local existingBillboard = hrp:FindFirstChild("EnemyBillboard")
				if not existingBillboard then
					createEnemyBillboard(hrp)
				end
			end
		end
	end
end)

return Connections