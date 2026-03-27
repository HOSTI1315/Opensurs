--@rznnq ui 
--AUTOKICK-DISCORD @rznnq (working in STEAL A BRAINROT uwu)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local KEYWORD = "you stole"
local KICK_MESSAGE = "Discord@rznnq"
local connections = {}
local function hasKeyword(text)
	if typeof(text) ~= "string" then return false end
	return string.find(string.lower(text), KEYWORD) ~= nil
end
local function kick()
	pcall(function()
		player:Kick(KICK_MESSAGE)
	end)
end
local function watchObject(obj)
	if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then
		return
	end
	if hasKeyword(obj.Text) then
		kick()
		return
	end
	local conn = obj:GetPropertyChangedSignal("Text"):Connect(function()
		if hasKeyword(obj.Text) then
			kick()
		end
	end)
	table.insert(connections, conn)
end
local function scan(parent)
	for _, obj in ipairs(parent:GetDescendants()) do
		watchObject(obj)
	end
end
local function watchGui(gui)
	scan(gui)
	local conn = gui.DescendantAdded:Connect(function(desc)
		watchObject(desc)
	end)
	table.insert(connections, conn)
end
for _, gui in ipairs(PlayerGui:GetChildren()) do
	watchGui(gui)
end
table.insert(connections,
	PlayerGui.ChildAdded:Connect(function(gui)
		watchGui(gui)
	end)
)
