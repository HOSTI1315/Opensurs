--@rznnq ui 
--WALLHACK BASES-DISCORD @rznnq (working in STEAL A BRAINROT uwu)
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer
local originalTransparency = {}
local function isPlayerBase(obj)
	if not (obj:IsA("BasePart") or obj:IsA("MeshPart") or obj:IsA("UnionOperation")) then
		return false
	end
	local n = obj.Name:lower()
	local p = obj.Parent and obj.Parent.Name:lower() or ""
	return n:find("base") or n:find("claim") or p:find("base") or p:find("claim")
end
for _, obj in ipairs(Workspace:GetDescendants()) do
	if isPlayerBase(obj) then
		originalTransparency[obj] = obj.LocalTransparencyModifier
		obj.LocalTransparencyModifier = 0.8
	end
end
Workspace.DescendantAdded:Connect(function(obj)
	if isPlayerBase(obj) then
		originalTransparency[obj] = obj.LocalTransparencyModifier
		obj.LocalTransparencyModifier = 0.8
	end
end)
player.CharacterAdded:Connect(function()
	task.wait(0.5)
	for _, obj in ipairs(Workspace:GetDescendants()) do
		if isPlayerBase(obj) then
			originalTransparency[obj] = obj.LocalTransparencyModifier
			obj.LocalTransparencyModifier = 0.8
		end
	end
end)
