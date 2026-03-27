--@rznnq ui 
--ANTI RAGDOLL AND EFFECTS-DISCORD @rznnq (working in STEAL A BRAINROT uwu)
if not game:IsLoaded() then
	game.Loaded:Wait()
end
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local PlayerModule = require(Player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"))
local Controls = PlayerModule:GetControls()
local ENABLE_ANTI_RAGDOLL = true
local ENABLE_ANTI_ITEM = true
local Frozen = false
local DisabledRemotes = {}
local RemoteWatcher
local BlockedStates = {
	[Enum.HumanoidStateType.Ragdoll] = true,
	[Enum.HumanoidStateType.FallingDown] = true,
	[Enum.HumanoidStateType.Physics] = true,
	[Enum.HumanoidStateType.Dead] = true
}
local RemoteKeywords = { "useitem", "combatservice", "ragdoll" }
local function ForceNormal(character)
	local hum = character:FindFirstChildOfClass("Humanoid")
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hum or not hrp then return end
	hum.Health = hum.MaxHealth
	hum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	if not Frozen then
		Frozen = true
		hrp.Anchored = true
		hrp.AssemblyLinearVelocity = Vector3.zero
		hrp.AssemblyAngularVelocity = Vector3.zero
		hrp.CFrame += Vector3.new(0, 1.5, 0)
	end
end
local function Release(character)
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if hrp and Frozen then
		hrp.Anchored = false
		Frozen = false
	end
end
local function RestoreMotors(character)
	for _, v in ipairs(character:GetDescendants()) do
		if v:IsA("Motor6D") then
			v.Enabled = true
		elseif v:IsA("Constraint") then
			v.Enabled = false
		end
	end
end
local function InitAntiRagdoll(character)
	local hum = character:WaitForChild("Humanoid", 10)
	if not hum then return end
	for state in pairs(BlockedStates) do
		hum:SetStateEnabled(state, false)
	end
	hum.StateChanged:Connect(function(_, new)
		if ENABLE_ANTI_RAGDOLL and BlockedStates[new] then
			ForceNormal(character)
			RestoreMotors(character)
		end
	end)
	RunService.Stepped:Connect(function()
		if not ENABLE_ANTI_RAGDOLL then
			Release(character)
			return
		end
		if BlockedStates[hum:GetState()] then
			ForceNormal(character)
		else
			Release(character)
		end
		hum.Health = hum.MaxHealth
	end)
end
local function KillRemote(remote)
	if not getconnections or not remote:IsA("RemoteEvent") then return end
	if DisabledRemotes[remote] then return end
	local name = remote.Name:lower()
	for _, key in ipairs(RemoteKeywords) do
		if name:find(key) then
			DisabledRemotes[remote] = {}
			for _, c in ipairs(getconnections(remote.OnClientEvent)) do
				if c.Disable then
					c:Disable()
					table.insert(DisabledRemotes[remote], c)
				end
			end
			break
		end
	end
end
local function InitAntiItem()
	Controls:Enable()
	for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
		KillRemote(obj)
	end
	RemoteWatcher = ReplicatedStorage.DescendantAdded:Connect(KillRemote)
end
Player.CharacterAdded:Connect(function(char)
	task.wait(0.4)
	InitAntiRagdoll(char)
end)
if Player.Character then
	InitAntiRagdoll(Player.Character)
end
if ENABLE_ANTI_ITEM then
	task.delay(0.25, InitAntiItem)
end
--@rznnq on discord