local Players = game:GetService("Players")
local PFS = game:GetService("PathfindingService")
local VIM = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer
local Spectators = {}
local currentCharacter
local isInGame, busy, isSprinting = false, false, false
local stamina, counter = 100, 0
local Killer, Survivor = false, false

local function safe(pos)
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {workspace.Map.Ingame.Map}
    rayParams.FilterType = Enum.RaycastFilterType.Include
    local rayResult = workspace:Raycast(pos + Vector3.new(0, 5, 0), Vector3.new(0, -10, 0), rayParams)
    if rayResult then
        local yDiff = math.abs(rayResult.Position.Y - pos.Y)
        return yDiff < 5 
    end
    return false
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/Test.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/addons/ThemeManagerCopy.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/addons/SaveManagerCopy.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles

function Notification(Message, Time)
if _G.ChooseNotify == "Obsidian" then
Library:Notify(Message, Time or 5)
elseif _G.ChooseNotify == "Roblox" then
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = Message,Icon = "rbxassetid://7733658504",Duration = Time or 5})
end
if _G.NotificationSound then
        local sound = Instance.new("Sound", workspace)
            sound.SoundId = "rbxassetid://4590662766"
            sound.Volume = _G.VolumeTime or 2
            sound.PlayOnRemove = true
            sound:Destroy()
        end
    end

Library:SetDPIScale(85)

local Window = Library:CreateWindow({
    Title = "DYHUB",
    Center = true,
    AutoShow = true,
    Resizable = true,
    Footer = "DYHUB @ Premium - Forsaken (dsc.gg/dyhub)",
	Icon = 86730141841188,
	AutoLock = true,
    ShowCustomCursor = true,
    NotifySide = "Right",
    TabPadding = 2,
    MenuFadeTime = 0
})

Tabs = {
	Tab = Window:AddTab("Main", "rbxassetid://7734053426"),
	Tab2 = Window:AddTab("Anti", "rbxassetid://7734056608"),
	["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
}

local Main1Group = Tabs.Tab:AddLeftGroupbox("Main")

Main1Group:AddToggle("AutoGeneral", {
    Text = "Auto Generator",
    Default = false, 
    Callback = function(Value) 
_G.AutoGeneral = Value
while _G.AutoGeneral do
if workspace.Map.Ingame:FindFirstChild("Map") then
for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
if v.Name == "Generator" and v:FindFirstChild("Remotes") and v.Remotes:FindFirstChild("RE") and v:FindFirstChild("Progress").Value ~= 100 then
v.Remotes:FindFirstChild("RE"):FireServer()
end
end
end
task.wait(5)
end
    end
})

Main1Group:AddButton("Teleport To Generator", function()
if workspace.Map.Ingame:FindFirstChild("Map") then
for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
if v.Name == "Generator" and v:FindFirstChild("Positions") and v.Positions:FindFirstChild("Center") and v:FindFirstChild("Progress").Value ~= 100 then
LP.Character.HumanoidRootPart.CFrame = v.Positions:FindFirstChild("Center").CFrame
break
end
end
end
end)

Main1Group:AddToggle("Inf Stamina", {
    Text = "Infinite Stamina",
    Default = false, 
    Callback = function(Value) 
_G.InfStamina = Value
while _G.InfStamina do
local staminaModule = require(game.ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Character"):WaitForChild("Game"):WaitForChild("Sprinting"))
if staminaModule then
    staminaModule.MaxStamina = 69696969
    staminaModule.Stamina = 69696969
    staminaModule.__staminaChangedEvent:Fire(staminaModule.Stamina)
end
task.wait()
end
    end
})

Main1Group:AddSlider("Speed", {
    Text = "WalkSpeed",
    Default = 20,
    Min = 7,
    Max = 50,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
_G.SpeedWalk = Value
    end
})

Main1Group:AddToggle("SetSpeed", {
    Text = "Set Speed",
    Default = false, 
    Callback = function(Value) 
_G.NahSpeed = Value
while _G.NahSpeed do
if LP.Character:FindFirstChild("Humanoid") then
LP.Character.Humanoid:SetAttribute("BaseSpeed", _G.SpeedWalk)
if LP.Character.Humanoid:GetAttribute("BaseSpeed") == _G.SpeedWalk then
LP.Character.Humanoid.WalkSpeed = _G.SpeedWalk
end
end
task.wait()
end
    end
})

Main1Group:AddToggle("ItemPick", {
    Text = "Auto PickUp Item",
    Default = false, 
    Callback = function(Value) 
_G.PickupItem = Value
while _G.PickupItem do
if workspace.Map.Ingame:FindFirstChild("Map") then
for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
if v:IsA("Tool") and v:FindFirstChild("ItemRoot") and v.ItemRoot:FindFirstChild("ProximityPrompt") then
if (LP.Character.HumanoidRootPart.Position - v.ItemRoot.Position).Magnitude < 25 then
fireproximityprompt(v.ItemRoot:FindFirstChild("ProximityPrompt"))
end
end
end
end
task.wait()
end
    end
})

Main1Group:AddButton("Pick Up Item", function()
if workspace.Map.Ingame:FindFirstChild("Map") then
OldCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
if v:IsA("Tool") and v:FindFirstChild("ItemRoot") and v.ItemRoot:FindFirstChild("ProximityPrompt") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChild("ItemRoot").CFrame
wait(0.3)
fireproximityprompt(v.ItemRoot:FindFirstChild("ProximityPrompt"))
wait(0.4)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldCFrame
break
end
end
end
end)

Main1Group:AddToggle("AutoExpMoney", {
    Text = "Auto Farm Exp / Money",
    Default = false, 
    Callback = function(Value) 
_G.AutoFarm = Value
task.spawn(function()
    while _G.AutoFarm do
        Spectators = {}
        for _, v in ipairs(workspace:WaitForChild("Players"):WaitForChild("Spectating"):GetChildren()) do
            table.insert(Spectators, v.Name)
        end
        isInGame = not table.find(Spectators, LP.Name)
        task.wait(1)
    end
end)
task.spawn(function()
    while _G.AutoFarm do
        if isInGame and currentCharacter and currentCharacter:FindFirstChild("Humanoid") then
            pcall(function()
                currentCharacter.Humanoid:SetAttribute("BaseSpeed", 14)
                local barText = LP:WaitForChild("PlayerGui"):WaitForChild("TemporaryUI"):WaitForChild("PlayerInfo").Bars.Stamina.Amount.Text
                stamina = tonumber(string.split(barText, "/")[1]) or 100
                local fovMult = currentCharacter:FindFirstChild("FOVMultipliers") and currentCharacter.FOVMultipliers:FindFirstChild("Sprinting")
                if fovMult and fovMult.Value ~= 1.125 and stamina >= 70 and not busy then
                    VIM:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
                end
            end)
        end
        task.wait(1)
    end
end)
task.spawn(function()
    while _G.AutoFarm do
        if workspace:FindFirstChild("Players") then
            local killersFolder = workspace.Players:FindFirstChild("Killers")
            local survivorsFolder = workspace.Players:FindFirstChild("Survivors")
            if killersFolder and survivorsFolder then
                Killer = killersFolder:FindFirstChild(LP.Name) or table.find(killersFolder:GetChildren(), LP.Character)
                Survivor = survivorsFolder:FindFirstChild(LP.Name) or table.find(survivorsFolder:GetChildren(), LP.Character)
            end
        end
        task.wait(1)
    end
end)
task.spawn(function()
    task.wait(2)
    local killersFolder = workspace.Players:WaitForChild("Killers")
    local survivorsFolder = workspace.Players:WaitForChild("Survivors")
    while _G.AutoFarm do
        if Killer then
            local target = nil
            for _, survivor in ipairs(survivorsFolder:GetChildren()) do
                if survivor:IsA("Model") and survivor:FindFirstChild("HumanoidRootPart") then
                    target = survivor
                    break
                end
            end
            if target then
                followingTarget = _G.AutoFarm
                task.spawn(function()
                    while followingTarget do
                        local character = LP.Character
                        if character and character:FindFirstChild("HumanoidRootPart") and target:FindFirstChild("HumanoidRootPart") then
                            character:PivotTo(target.HumanoidRootPart.CFrame)
                        end
                        task.wait(0.1)
                    end
                end)
                task.spawn(function()
                    while target and target:FindFirstChild("HumanoidRootPart") and target:IsDescendantOf(survivorsFolder) do
                        VIM:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                        task.wait(0.05)
                        VIM:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                        task.wait(0.1)
                        VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
                        task.wait(0.05)
                        VIM:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
                        task.wait(0.1)
                        VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                        task.wait(0.05)
                        VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        task.wait(0.1)
                        VIM:SendKeyEvent(true, Enum.KeyCode.R, false, game)
                        task.wait(0.05)
                        VIM:SendKeyEvent(false, Enum.KeyCode.R, false, game)
                        task.wait(0.8)
                    end
                    followingTarget = false 
                end)
            else
                task.wait(1)
            end
        elseif Survivor then
            if isInGame then
                for _, surv in ipairs(survivorsFolder:GetChildren()) do
                    if surv:GetAttribute("Username") == LP.Name then
                        currentCharacter = surv
                        break
                    end
                end
                task.spawn(function()
                    while _G.AutoFarm do
                        if currentCharacter and currentCharacter:FindFirstChild("Humanoid") and currentCharacter.Humanoid.Health <= 0 then
                            isInGame = false
                            isSprinting = false
                            busy = false
                            break
                        end
                        task.wait(0.5)
                    end
                end)
                for _, completedgen in ipairs(ReplicatedStorage.ObjectiveStorage:GetChildren()) do
                    if not isInGame then break end
                    local required = completedgen:GetAttribute("RequiredProgress")
                    if completedgen.Value == required then
                        while #killersFolder:GetChildren() >= 1 do
                            for _, killer in ipairs(killersFolder:GetChildren()) do
                                if currentCharacter and killer:FindFirstChild("HumanoidRootPart") and currentCharacter:FindFirstChild("HumanoidRootPart") then
                                    local killerHRP = killer.HumanoidRootPart
                                    local charHRP = currentCharacter.HumanoidRootPart
                                    local dist = (killerHRP.Position - charHRP.Position).Magnitude
                                  if dist <= 100 then
    local fleeDistance = 50
    local bestFleePos = nil
    for i = 1, 10 do
        local randomAngle = math.rad(math.random(-180, 180))
        local cos, sin = math.cos(randomAngle), math.sin(randomAngle)
        local randomDir = Vector3.new(cos, 0, sin).Unit
        local potentialPos = charHRP.Position + randomDir * fleeDistance
        if safe(potentialPos) then
            local path = PFS:CreatePath({
                AgentRadius = 2,
                AgentHeight = 5,
                AgentCanJump = true,
            })
            local success, err = pcall(function()
                path:ComputeAsync(charHRP.Position, potentialPos)
            end)
            if success and path.Status == Enum.PathStatus.Success then
                local waypoints = path:GetWaypoints()
                for i = #waypoints, 1, -1 do
                    if safe(waypoints[i].Position) then
                        bestFleePos = waypoints[i].Position
                        break
                    end
                end
                if bestFleePos then break end
            end
        end
    end
    if bestFleePos then
        currentCharacter:PivotTo(CFrame.new(bestFleePos + Vector3.new(0, 3, 0))) 
    end
end
                                end
                                task.wait(0.1)
                            end
                        end
                    else
                        for _, gen in ipairs(workspace.Map.Ingame:WaitForChild("Map"):GetChildren()) do
                            if gen.Name == "Generator" and gen:FindFirstChild("Progress") and gen.Progress.Value ~= 100 then
                                if currentCharacter and currentCharacter:FindFirstChild("HumanoidRootPart") then
                                    local goalPos = gen:WaitForChild("Positions"):WaitForChild("Right").Position
                                    currentCharacter:PivotTo(CFrame.new(goalPos + Vector3.new(0, 2, 0)))
                                    task.wait(0.25)
                                    local thing = gen:FindFirstChild("Main")
                                    if thing then
                                        thing = thing:FindFirstChild("Prompt")
                                        if thing then
                                            thing.HoldDuration = 0
                                            thing.RequiresLineOfSight = false
                                            thing.MaxActivationDistance = 99999
                                            task.wait(0.1)
                                            pcall(function()
                                                thing:InputHoldBegin()
                                                thing:InputHoldEnd()
                                            end)
                                            busy = true
                                            counter = 0
                                            while gen.Progress.Value ~= 100 do
                                                pcall(function()
                                                    thing:InputHoldBegin()
                                                    thing:InputHoldEnd()
                                                    if _G.AutoGeneral == false then
	                                                    gen.Remotes.RE:FireServer()
													end
                                                end)
                                                task.wait(2.5)
                                                counter += 1
                                                if counter >= 10 or not isInGame then break end
                                            end
                                            busy = false
                                            if not isInGame then break end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)
    end
})

local Main2Group = Tabs.Tab:AddRightGroupbox("Esp")

Main2Group:AddToggle("Generator", {
    Text = "Esp Generator",
    Default = false, 
    Callback = function(Value) 
_G.EspGeneral = Value
if _G.EspGeneral == false then
if workspace.Map.Ingame:FindFirstChild("Map") then
	for i, v in pairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
		if v.Name == "Generator" then
			for x, n in pairs(v:GetChildren()) do
				if n.Name:find("Esp_") then
					n:Destroy()
				end
			end
		end
	end
end
end
while _G.EspGeneral do
if workspace.Map.Ingame:FindFirstChild("Map") then
for i, v in pairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
if v.Name == "Generator" and v:FindFirstChild("Progress") then
if v:FindFirstChild("Esp_Highlight") then
	if v:FindFirstChild("Progress").Value == 100 then
		v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(0, 255, 0)
		v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(0, 255, 0)
	else
		v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.new(255, 255, 255)
		v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.new(255, 255, 255)
	end
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(255, 255, 255) 
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
	v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and "Generator ("..v.Progress.Value.."%)" or "")..
            (_G.EspDistance == true and "\nDistance ("..string.format("%.1f", (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Positions.Canter.Position).Magnitude).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiGenEsp = Instance.new("BillboardGui", v)
	GuiGenEsp.Adornee = v
	GuiGenEsp.Name = "Esp_Gui"
	GuiGenEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiGenEsp.AlwaysOnTop = true
	GuiGenEsp.StudsOffset = Vector3.new(0, 3, 0)
	GuiGenEspText = Instance.new("TextLabel", GuiGenEsp)
	GuiGenEspText.BackgroundTransparency = 1
	GuiGenEspText.Font = Enum.Font.Code
	GuiGenEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiGenEspText.TextSize = 15
	GuiGenEspText.TextColor3 = Color3.new(0,0,0) 
	GuiGenEspText.TextStrokeTransparency = 0.5
	GuiGenEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiGenEspText
	elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
	v:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
end
task.wait()
end
    end
})

function Esp_Player(v, Colorlight)
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = Colorlight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = Colorlight or Color3.fromRGB(255, 255, 255)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(255, 255, 255) 
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v.Head:FindFirstChild("Esp_Gui") and v.Head["Esp_Gui"]:FindFirstChild("TextLabel") then
	v.Head["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and v.Name or "")..
            (_G.EspDistance == true and "\nDistance ("..string.format("%.1f", (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude).."m)" or "")..
            (_G.EspHealth == true and "\nHealth ("..string.format("%.0f", v.Humanoid.Health)..")" or "")
    v.Head["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v.Head["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v.Head:FindFirstChild("Esp_Gui") == nil then
	GuiPlayerEsp = Instance.new("BillboardGui", v.Head)
	GuiPlayerEsp.Adornee = v.Head
	GuiPlayerEsp.Name = "Esp_Gui"
	GuiPlayerEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiPlayerEsp.AlwaysOnTop = true
	GuiPlayerEsp.StudsOffset = Vector3.new(0, 3, 0)
	GuiPlayerEspText = Instance.new("TextLabel", GuiPlayerEsp)
	GuiPlayerEspText.BackgroundTransparency = 1
	GuiPlayerEspText.Font = Enum.Font.Code
	GuiPlayerEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiPlayerEspText.TextSize = 15
	GuiPlayerEspText.TextColor3 = Color3.new(0,0,0) 
	GuiPlayerEspText.TextStrokeTransparency = 0.5
	GuiPlayerEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiPlayerEspText
	elseif _G.EspGui == false and v.Head:FindFirstChild("Esp_Gui") then
	v.Head:FindFirstChild("Esp_Gui"):Destroy()
end
end
Main2Group:AddToggle("Killer", {
    Text = "Esp Killer",
    Default = false, 
    Callback = function(Value) 
_G.EspKiller = Value
if _G.EspKiller == false then
	for i, v in pairs(game.Workspace.Players:GetChildren()) do
		if v.Name == "Killers" then
			if v:FindFirstChild("Esp_Highlight") then
				v:FindFirstChild("Esp_Highlight"):Destroy()
			end
			for y, z in pairs(v.Head:GetChildren()) do
				if z.Name:find("Esp_") then
					z:Destroy()
				end
			end
		end
	end
end
while _G.EspKiller do
for i, v in pairs(game.Workspace.Players:GetChildren()) do
	if v.Name == "Killers" then
		for y, z in pairs(v:GetChildren()) do
			if z:GetAttribute("Username") ~= game.Players.LocalPlayer.Name and z:FindFirstChild("HumanoidRootPart") and z:FindFirstChild("Humanoid") and z:FindFirstChild("Head") then
				Esp_Player(z, _G.ColorLightKill or Color3.fromRGB(255, 0, 0))
			end
		end
	end
end
task.wait()
end
    end
}):AddColorPicker("Color Esp1", {
     Default = Color3.new(255, 0, 0),
     Callback = function(Value)
_G.ColorLightKill = Value
     end
})

Main2Group:AddToggle("Survivors", {
    Text = "Esp Survivors",
    Default = false, 
    Callback = function(Value) 
_G.EspSurvivors = Value
if _G.EspSurvivors == false then
	for i, v in pairs(game.Workspace.Players:GetChildren()) do
		if v.Name == "Survivors" then
			if v:FindFirstChild("Esp_Highlight") then
				v:FindFirstChild("Esp_Highlight"):Destroy()
			end
			for y, z in pairs(v.Head:GetChildren()) do
				if z.Name:find("Esp_") then
					z:Destroy()
				end
			end
		end
	end
end
while _G.EspSurvivors do
for i, v in pairs(game.Workspace.Players:GetChildren()) do
	if v.Name == "Survivors" then
		for y, z in pairs(v:GetChildren()) do
			if z:GetAttribute("Username") ~= game.Players.LocalPlayer.Name and z:FindFirstChild("HumanoidRootPart") and z:FindFirstChild("Humanoid") and z:FindFirstChild("Head") then
				Esp_Player(z, _G.ColorLightSurvivors or Color3.fromRGB(0, 255, 0))
			end
		end
	end
end
task.wait()
end
    end
}):AddColorPicker("Color Esp2", {
     Default = Color3.new(0, 255, 0),
     Callback = function(Value)
_G.ColorLightSurvivors = Value
     end
})

Main2Group:AddToggle("Item", {
    Text = "Esp Item",
    Default = false, 
    Callback = function(Value) 
_G.EspItem = Value
if _G.EspItem == false then
if workspace.Map.Ingame:FindFirstChild("Map") then
for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
for c, n in ipairs(v:FindFirstChild("ItemRoot"):GetChildren()) do
if v.Name:find("Esp_") then
v:Destroy()
end
end
end
end
end
end
while _G.EspItem do
if workspace.Map.Ingame:FindFirstChild("Map") then
for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
if v.ItemRoot:FindFirstChild("Esp_Highlight") then
	v.ItemRoot:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v.ItemRoot:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(255, 255, 255) 
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v.ItemRoot:FindFirstChild("Esp_Gui") and v.ItemRoot["Esp_Gui"]:FindFirstChild("TextLabel") then
	v.ItemRoot["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and v.Name or "")..
            (_G.EspDistance == true and "\nDistance ("..string.format("%.0f", (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.ItemRoot.Position).Magnitude).."m)" or "")
    v.ItemRoot["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v.ItemRoot["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v.ItemRoot:FindFirstChild("Esp_Gui") == nil then
	GuiItemEsp = Instance.new("BillboardGui", v.ItemRoot)
	GuiItemEsp.Adornee = v.ItemRoot
	GuiItemEsp.Name = "Esp_Gui"
	GuiItemEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiItemEsp.AlwaysOnTop = true
	GuiItemEsp.StudsOffset = Vector3.new(0, 3, 0)
	GuiItemEspText = Instance.new("TextLabel", GuiItemEsp)
	GuiItemEspText.BackgroundTransparency = 1
	GuiItemEspText.Font = Enum.Font.Code
	GuiItemEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiItemEspText.TextSize = 15
	GuiItemEspText.TextColor3 = Color3.new(0,0,0) 
	GuiItemEspText.TextStrokeTransparency = 0.5
	GuiItemEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiItemEspText
	elseif _G.EspGui == false and v.ItemRoot:FindFirstChild("Esp_Gui") then
	v.ItemRoot:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
end
task.wait()
end
    end
})

Main2Group:AddDivider()

_G.EspHighlight = false
Main2Group:AddToggle("Esp Hight Light", {
    Text = "Esp Hight Light",
    Default = false, 
    Callback = function(Value) 
_G.EspHighlight = Value
    end
}):AddColorPicker("Color Esp", {
     Default = Color3.new(255,255,255),
     Callback = function(Value)
_G.ColorLight = Value
     end
})

_G.EspGui = false
Main2Group:AddToggle("Esp Gui", {
    Text = "Esp Gui",
    Default = false, 
    Callback = function(Value) 
_G.EspGui = Value
    end
}):AddColorPicker("Color Esp Text", {
     Default = Color3.new(255,255,255),
     Callback = function(Value)
_G.EspGuiTextColor = Value
     end
})

Main2Group:AddSlider("Text Size", {
    Text = "Text Size [ Gui ]",
    Default = 7,
    Min = 7,
    Max = 50,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
_G.EspGuiTextSize = Value
    end
})

Main2Group:AddDivider()

_G.EspName = false
Main2Group:AddToggle("Esp Name", {
    Text = "Esp Name",
    Default = false, 
    Callback = function(Value) 
_G.EspName = Value
    end
})

_G.EspDistance = false
Main2Group:AddToggle("Esp Distance", {
    Text = "Esp Distance",
    Default = false, 
    Callback = function(Value) 
_G.EspDistance = Value
    end
})

_G.EspHealth = false
Main2Group:AddToggle("Esp Health", {
    Text = "Esp Health",
    Default = false, 
    Callback = function(Value) 
_G.EspHealth = Value
    end
})

local Anti1Group = Tabs.Tab2:AddLeftGroupbox("Anti")

Anti1Group:AddToggle("Acid", {
    Text = "Anti Acid",
    Default = false, 
    Callback = function(Value) 
_G.AntiAcid = Value
while _G.AntiAcid do
if workspace.Map.Ingame:FindFirstChild("Map") then
for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
if v.Name == "AcidContainer" then
for _, Acid in ipairs(v:GetChildren()) do
if Acid:IsA("BasePart") then
Acid.CanTouch = false
end
end
end
end
end
task.wait()
end
    end
})

------------------------------------------------------------------------
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")
local CreditsGroup = Tabs["UI Settings"]:AddRightGroupbox("Credits")
local Info = Tabs["UI Settings"]:AddRightGroupbox("Info")

MenuGroup:AddDropdown("NotifySide", {
    Text = "Notification Side",
    Values = {"Left", "Right"},
    Default = "Right",
    Multi = false,
    Callback = function(Value)
Library:SetNotifySide(Value)
    end
})

_G.ChooseNotify = "Obsidian"
MenuGroup:AddDropdown("NotifyChoose", {
    Text = "Notification Choose",
    Values = {"Obsidian", "Roblox"},
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.ChooseNotify = Value
    end
})

_G.NotificationSound = true
MenuGroup:AddToggle("NotifySound", {
    Text = "Notification Sound",
    Default = true, 
    Callback = function(Value) 
_G.NotificationSound = Value 
    end
})

MenuGroup:AddSlider("Volume Notification", {
    Text = "Volume Notification",
    Default = 2,
    Min = 2,
    Max = 10,
    Rounding = 1,
    Compact = true,
    Callback = function(Value)
_G.VolumeTime = Value
    end
})

MenuGroup:AddToggle("KeybindMenuOpen", {Default = false, Text = "Open Keybind Menu", Callback = function(Value) Library.KeybindFrame.Visible = Value end})
MenuGroup:AddToggle("ShowCustomCursor", {Text = "Custom Cursor", Default = true, Callback = function(Value) Library.ShowCustomCursor = Value end})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "RightShift", NoUI = true, Text = "Menu keybind"})
_G.LinkJoin = loadstring(game:HttpGet("https://raw.githubusercontent.com/dyumra/Detail/refs/heads/main/Info"))()
MenuGroup:AddButton("Copy Link Discord", function()
    if setclipboard then
        setclipboard(_G.LinkJoin["Discord"])
        Library:Notify("Copied discord link to clipboard!")
    else
        Library:Notify("Discord link: ".._G.LinkJoin["Discord"], 10)
    end
end):AddButton("Copy Link DYHUB", function()
    if setclipboard then
        setclipboard(_G.LinkJoin["DYHUB"])
        Library:Notify("Copied DYHUB link to clipboard!")
    else
        Library:Notify("DYHUB link: ".._G.LinkJoin["DYHUB"], 10)
    end
end)
MenuGroup:AddButton("Unload", function() Library:Unload() end)
CreditsGroup:AddLabel("DYHUB - Python / Dex / Script / Visual Code", true)
CreditsGroup:AddLabel("HUIOPN - Scripter / Dex / Fixed", true)
CreditsGroup:AddLabel("XAVIER - Scripter / Dex / Tester", true)

Info:AddLabel("Counter [ "..game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(game.Players.LocalPlayer).." ]", true)
Info:AddLabel("Executor [ "..identifyexecutor().." ]", true)
Info:AddLabel("Job Id [ "..game.JobId.." ]", true)
Info:AddDivider()
Info:AddButton("Copy JobId", function()
    if setclipboard then
        setclipboard(tostring(game.JobId))
        Library:Notify("Copied Success")
    else
        Library:Notify(tostring(game.JobId), 10)
    end
end)

Info:AddInput("Join Job", {
    Default = "Put JobID in here",
    Numeric = false,
    Text = "Join Job",
    Placeholder = "UserJobId",
    Callback = function(Value)
_G.JobIdJoin = Value
    end
})

Info:AddButton("Join JobId", function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, _G.JobIdJoin, game.Players.LocalPlayer)
end)

Info:AddButton("Copy Join JobId", function()
    if setclipboard then
        setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, '..game.JobId..", game.Players.LocalPlayer)")
        Library:Notify("Copied Success") 
    else
        Library:Notify(tostring(game.JobId), 10)
    end
end)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig() 
