if not workspace:FindFirstChild("Game") then
repeat task.wait() until workspace:FindFirstChild("Game")
end

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
-------------------------
local Game = workspace:WaitForChild("Game")
local House = workspace:WaitForChild("House")
-------------------------
local Trash = Game:WaitForChild("trashes")
local Dad = Game:WaitForChild("dad")
local Room = House:WaitForChild("Rooms")
local Kitchen = Room:WaitForChild("Kitchen")
--------------------------
local player = game.Players.LocalPlayer
local pack = player:WaitForChild("Backpack")
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart") 

_G.GetOldBright = {
	["Old"] = {
		Brightness = game.Lighting.Brightness,
		ClockTime = game.Lighting.ClockTime,
		FogEnd = game.Lighting.FogEnd,
		FogStart = game.Lighting.FogStart,
		GlobalShadows = game.Lighting.GlobalShadows,
		OutdoorAmbient = game.Lighting.OutdoorAmbient
	},
	["New"] = {
		Brightness = 2,
		ClockTime = 14,
		FogEnd = 200000,
		FogStart = 100000,
		GlobalShadows = false,
		OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	}
}

game:GetService("RunService").RenderStepped:Connect(function()
for i, v in pairs(_G.GetOldBright.New) do
	if _G.FullBright then
		game.Lighting[i] = v
	end
end
end)

function Distance(pos)
	if root then
		return (root.Position - pos).Magnitude
	end
end

function hasTool(name)
	return pack:FindFirstChild(name) or char:FindFirstChild(name)
end
	

local ui = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local win = ui:CreateWindow({
    Title = "Nihahaha Hub",
    Icon = "rbxassetid://134430677550422",
    Author = "by tanhoangvn and gianghub",
    Folder = "Nihahaha Hub",
    Size = UDim2.fromOffset(700, 320),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    Background = "rbxassetid://0",
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = true
    },
})

win:EditOpenButton({
    Title = "Nihahaha Hub",
    Icon = "rbxassetid://134430677550422",
    CornerRadius = UDim.new(2,0),
    StrokeThickness = 2.0,
    Color = ColorSequence.new(
        Color3.fromHex("#FF00B0"), 
        Color3.fromHex("#DBCCD5")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})
win:Tag({
    Title = "Beta - PreRelease",
    Color = Color3.fromHex("#EEFF00")
})
win:Tag({
    Title = "Assistant Arona AI",
    Color = Color3.fromHex("#00F3FF")
})

function Notification(notifyFu)
if _G.ChooseNotify == "WindUI" then
ui:Notify({
    Title = notifyFu.title or "",
    Content = notifyFu.content or "",
    Duration = notifyFu.duration or 3,
    Icon = ("rbxassetid://"..notifyFu.icon) or "",
    Background = ("rbxassetid://"..notifyFu.background) or "0"
})
elseif _G.ChooseNotify == "Roblox" then
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = notifyFu.title,
	Text = notifyFu.content,
	Icon = ("rbxassetid://"..notifyFu.icon) or "",
	Duration = notifyFu.duration or 5
})
end
end

--// Floder Path \\--
local folderPath = "Nihahaha Hub"
local autoConfigFile = folderPath .. "/Auto.txt"

if not isfolder(folderPath) then makefolder(folderPath) end

local function getPath(name)
	return folderPath .. "/" .. name .. ".json"
end

function SaveConfig(name, data)
	writefile(getPath(name), HttpService:JSONEncode(data))
	writefile(autoConfigFile, HttpService:JSONEncode({
		NameFileSelected = name,
		Auto = true
	}))
end

function LoadConfig(name)
	local path = getPath(name)
	if isfile(path) then
		local success, result = pcall(function()
			return HttpService:JSONDecode(readfile(path))
		end)
		if success then return result end
	end
end

function AutoLoadConfig()
	if isfile(autoConfigFile) then
		local success, auto = pcall(function()
			return HttpService:JSONDecode(readfile(autoConfigFile))
		end)
		if success and auto.Auto and auto.NameFileSelected then
			return LoadConfig(auto.NameFileSelected)
		end
	end
end

function readAuto()
	if isfile(autoConfigFile) then
		local success, result = pcall(function()
			return HttpService:JSONDecode(readfile(autoConfigFile))
		end)
		if success then return result end
	end
	return { NameFileSelected = "Default", Auto = false }
end

function writeAuto(state)
	local current = readAuto()
	current.Auto = state
	writefile(autoConfigFile, HttpService:JSONEncode(current))
end

function ListFiles()
	local files = {}
	for _, file in ipairs(listfiles(folderPath)) do
		local name = file:match("([^/\\]+)%.json$")
		if name then
			table.insert(files, name)
		end
	end
	return files
end

local themeValues = {}
for name,_ in pairs(ui:GetThemes()) do
    themeValues[#themeValues+1] = name
end

Tabs = {
    Tab = win:Tab({Title = "Main", Icon = "house"}),
    Tab1 = win:Tab({Title = "Misc", Icon = "layout-list"}),
    Tab2 = win:Tab({Title = "Esp", Icon = "house-plus"}),
    ["Info"] = win:Tab({Title = "Information", Icon = "cog"}),
}

local Main = Tabs.Tab
Main:Toggle({
    Title = "Fullbright",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.FullBright = Value
if _G.FullBright then
for i, v in pairs(_G.GetOldBright.New) do
game.Lighting[i] = v
end
else
for i, v in pairs(_G.GetOldBright.Old) do
game.Lighting[i] = v
end
end
    end
})

Main:Toggle({
    Title = "No Fog",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.Nofog = Value
while _G.Nofog do
for i, v in pairs(game:GetService("Lighting"):GetChildren()) do
if v.ClassName == "Atmosphere" then
v.Density = 0
v.Haze = 0
end
end
task.wait()
end
for i, v in pairs(game:GetService("Lighting"):GetChildren()) do
if v.ClassName == "Atmosphere" then
v.Density = 0.3
v.Haze = 1
end
end
    end
})

Main:Toggle({
    Title = "Instant Prompt",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.NoCooldownProximity = Value
if _G.NoCooldownProximity == true then
for i, v in pairs(workspace:GetDescendants()) do
if v.ClassName == "ProximityPrompt" then
v.HoldDuration = 0
end
end
CooldownProximity = workspace.DescendantAdded:Connect(function(Cooldown)
if _G.NoCooldownProximity == true then
if Cooldown:IsA("ProximityPrompt") then
Cooldown.HoldDuration = 0
end
end
end)
else
if CooldownProximity then
CooldownProximity:Disconnect()
CooldownProximity = nil
end
end
    end
})

Main:Section({Title = "Quest Main", TextXAlignment = "Center", TextSize = 19})

Main:Button({
    Title = "Reset Wait",
    Locked = false,
    Callback = function()
_G.LoadingScript = false
    end
})

Main:Button({
    Title = "Quest Clean Trash",
    Locked = false,
    Callback = function()
if _G.LoadingScript then return end
_G.LoadingScript = true
if Trash then
	local cframe = root.CFrame
	for i, v in pairs(Trash:GetChildren()) do
		if v.Name == "P2" and v:FindFirstChild("ProximityPrompt") then
			root.CFrame = v.CFrame * CFrame.new(0, 3, 0)
			repeat task.wait() until Distance(v.Position) < 8
			wait(0.2)
			fireproximityprompt(v.ProximityPrompt)
			wait(0.1)
		end
	end
	wait(1.6)
	if Game:FindFirstChild("TrashBin") then
		root.CFrame = Game.TrashBin.CFrame * CFrame.new(0, 7, 0)
		repeat task.wait() until Distance(Game.TrashBin.Position) < 8
		wait(0.2)
		fireproximityprompt(Game.TrashBin.ProximityPrompt)
	end
	if cframe then
		wait(0.1)
		root.CFrame = cframe
	end
end
_G.LoadingScript = false
    end
})

Main:Button({
    Title = "Quest Cook Noodle",
    Locked = false,
    Callback = function()
if _G.LoadingScript then return end
_G.LoadingScript = true
if Kitchen then
	local cframe = root.CFrame
	local fridge = Kitchen:FindFirstChild("FridgeNoodles")
	local stove = Kitchen:FindFirstChild("Stove")
	local table = Kitchen:FindFirstChild("DiningTable")
	local noodles = table:FindFirstChild("Noodles")
	local tabledad = noodles:FindFirstChild("DadPlate")
	
	local function AutoCookNoodle()
		if fridge and stove then
			if fridge:FindFirstChild("Primary") and fridge.Primary:FindFirstChildOfClass("ProximityPrompt") then
				root.CFrame = fridge.Primary.CFrame * CFrame.new(0, 0, -5)
				repeat task.wait() until Distance(fridge.Primary.Position) < 8
				wait(0.3)
				fireproximityprompt(fridge.Primary:FindFirstChildOfClass("ProximityPrompt"))
			end
			repeat task.wait() until hasTool("Raw Noodle")
			wait(0.3)
			if pack:FindFirstChild("Raw Noodle") then
				pack["Raw Noodle"].Parent = char
			end
			wait(0.3)
			if stove:FindFirstChild("Primary") and stove.Primary:FindFirstChildOfClass("ProximityPrompt") then
				root.CFrame = stove.Primary.CFrame * CFrame.new(0, 0, -5)
				repeat task.wait() until Distance(stove.Primary.Position) < 8
				wait(0.3)
				fireproximityprompt(stove.Primary:FindFirstChildOfClass("ProximityPrompt"))
			end
		end
	end
	
	if tabledad and tabledad:FindFirstChild("Plate") and tabledad.Plate.Transparency > 0 then
		AutoCookNoodle()
		repeat task.wait() until hasTool("Cooked Noodle")
		wait(0.3)
		if pack:FindFirstChild("Cooked Noodle") then
			pack["Cooked Noodle"].Parent = char
		end
		wait(0.3)
		if tabledad and tabledad:FindFirstChild("Plate") and tabledad.Plate:FindFirstChildOfClass("ProximityPrompt") then
			root.CFrame = tabledad.Plate.CFrame * CFrame.new(0, 3, 0)
			repeat task.wait() until Distance(tabledad.Plate.Position) < 8
			wait(0.3)
			fireproximityprompt(tabledad.Plate:FindFirstChildOfClass("ProximityPrompt"))
		end
	end
	wait(0.3)
	for _, v in ipairs(noodles:GetChildren()) do
	    if v.Name ~= "DadPlate" and v:FindFirstChild("Plate") and v.Plate:FindFirstChildOfClass("ProximityPrompt") and v.Plate.Transparency > 0 then
			AutoCookNoodle()
			repeat task.wait() until hasTool("Cooked Noodle")
			wait(0.3)
			if pack:FindFirstChild("Cooked Noodle") then
				pack["Cooked Noodle"].Parent = char
			end
			wait(0.3)
			root.CFrame = v.Plate.CFrame * CFrame.new(0, 3, 0)
			repeat task.wait() until Distance(v.Plate.Position) < 8
			wait(0.3)
			fireproximityprompt(v.Plate:FindFirstChildOfClass("ProximityPrompt"))
			break
	    end
	end
	if cframe then
		root.CFrame = cframe
	end
end
_G.LoadingScript = false
    end
})

Main:Button({
    Title = "Quest Generator",
    Locked = false,
    Callback = function()
if _G.LoadingScript then return end
_G.LoadingScript = true
if House then
	local cframe = root.CFrame
	local Gas = House:FindFirstChild("GasCans")
	local Gen = House:FindFirstChild("Generator")
	if Gas and Gen then
		for i, v in ipairs(Gas:GetChildren()) do
			if v.Name == "GasCan" and v:FindFirstChild("Primary") and v.Primary:FindFirstChildOfClass("ProximityPrompt") then
				root.CFrame = v.Primary.CFrame * CFrame.new(0, 3, 0)
				repeat task.wait() until Distance(v.Primary.Position) < 8
				wait(0.3)
				fireproximityprompt(v.Primary:FindFirstChildOfClass("ProximityPrompt"))
				break
			end
		end
		repeat task.wait() until hasTool("gas can")
		wait(0.3)
		if pack:FindFirstChild("gas can") then
			pack["gas can"].Parent = char
		end
		wait(0.15)
		if Gen:FindFirstChild("Button") and Gen.Button:FindFirstChildOfClass("ProximityPrompt") then
			root.CFrame = Gen.Button.CFrame * CFrame.new(0, 0, 5)
			repeat task.wait() until Distance(Gen.Button.Position) < 8
			wait(0.3)
			fireproximityprompt(Gen.Button:FindFirstChildOfClass("ProximityPrompt"))
		end
	end
	if cframe then
		wait(0.1) 
		root.CFrame = cframe
	end
end
_G.LoadingScript = false
    end
})

Main:Button({
    Title = "Quest Rooms",
    Locked = false,
    Callback = function()
if _G.LoadingScript then return end
_G.LoadingScript = true
if Room then
	local Bedroom = Room:FindFirstChild("Bedroom")
	local conditioner = Bedroom:FindFirstChild("Remote")
	local PromptPart = conditioner:FindFirstChild("Prompt")
	local Messy = House:FindFirstChild("Messy")
	
	if PromptPart then
		root.CFrame = PromptPart.CFrame * CFrame.new(0, 2, 0)
		repeat task.wait() until Distance(PromptPart.Position) < 8
		wait(0.3)
		fireproximityprompt(PromptPart:FindFirstChildOfClass("ProximityPrompt"))
	end
	wait(0.2)
	if Messy then
		for i, v in pairs(Messy:GetChildren()) do
			if v.Name == "Messes" and v:FindFirstChild("Primary") and v.Primary:FindFirstChildOfClass("ProximityPrompt") then
				root.CFrame = v.Primary.CFrame * CFrame.new(0, 2, 0)
				repeat task.wait() until Distance(v.Primary.Position) < 8
				wait(0.15)
				fireproximityprompt(v.Primary:FindFirstChildOfClass("ProximityPrompt"))
			end
		end
	end
end
_G.LoadingScript = false
    end
})

Main:Button({
    Title = "Quest Internet",
    Locked = false,
    Callback = function()
if _G.LoadingScript then return end
_G.LoadingScript = true
if House and Game then
	local cframe = root.CFrame
	local Router = House:FindFirstChild("Router")
	local RouterPrompt = Router and Router:FindFirstChild("Prompt")
	
	local Socket = Game:FindFirstChild("Socket")
	local Plug = Socket and Socket:FindFirstChild("Plug")
	local PromptPart = Plug and Plug:FindFirstChild("MeshPart")

	if RouterPrompt then
		root.CFrame = RouterPrompt.CFrame * CFrame.new(0, 0, -5)
		repeat task.wait() until Distance(RouterPrompt.Position) < 8
		wait(0.3)
		fireproximityprompt(RouterPrompt:FindFirstChildOfClass("ProximityPrompt"))
	end
	wait(0.2)
	if PromptPart then
		root.CFrame = PromptPart.CFrame * CFrame.new(0, 0, -5)
		repeat task.wait() until Distance(PromptPart.Position) < 8
		wait(0.3)
		fireproximityprompt(PromptPart:FindFirstChildOfClass("ProximityPrompt"))
	end
	if cframe then
		root.CFrame = cframe
	end
end
_G.LoadingScript = false
    end
})

Main:Button({
    Title = "Quest Turn Off Light",
    Locked = false,
    Callback = function()
if _G.LoadingScript then return end
_G.LoadingScript = true
if House then	
	local cframe = root.CFrame
	local Light = House:FindFirstChild("Lights")
	
	if Light then
		for i, v in pairs(Light:GetDescendants()) do
			if v:FindFirstChild("Switch") and v.Switch:FindFirstChild("Prompt") and v:FindFirstChild("Active").Value then
				local Prompted = v.Switch:FindFirstChild("Prompt")
				if Prompted then
					root.CFrame = Prompted.CFrame * CFrame.new(0, 0, -5)
					repeat task.wait() until Distance(Prompted.Position) < 8
					wait(0.3)
					fireproximityprompt(Prompted:FindFirstChildOfClass("ProximityPrompt"))
				end
			end
		end
	end
	if cframe then
		wait(0.2)
		root.CFrame = cframe
	end
end
_G.LoadingScript = false
    end
})

Main:Button({
    Title = "Quest Close Window",
    Locked = false,
    Callback = function()
if _G.LoadingScript then return end
_G.LoadingScript = true
if House then	
	local cframe = root.CFrame
	local Window = House:FindFirstChild("Curtains")
	
	if Window then
		for i, v in pairs(Window:GetChildren()) do
			if v.Name == "CurtainN" and v:FindFirstChild("Prompt") and v.Prompt:FindFirstChild("Open").Value then
				local Prompted = v:FindFirstChild("Prompt")
				if Prompted then
					root.CFrame = Prompted.CFrame * CFrame.new(0, 0, 4.3)
					repeat task.wait() until Distance(Prompted.Position) < 8
					wait(0.3)
					fireproximityprompt(Prompted:FindFirstChildOfClass("ProximityPrompt"))
				end
			end
		end
	end
	if cframe then
		wait(0.2)
		root.CFrame = cframe
	end
end
_G.LoadingScript = false
    end
})

Main:Button({
    Title = "Quest Open TV",
    Locked = false,
    Callback = function()
if _G.LoadingScript then return end
_G.LoadingScript = true
if Game then	
	local cframe = root.CFrame
	local TV = Game:FindFirstChild("Remote")
	if TV then
		root.CFrame = TV.CFrame * CFrame.new(0, 2.5, 0)
		repeat task.wait() until Distance(TV.Position) < 8
		wait(0.2)
		fireproximityprompt(TV:FindFirstChildOfClass("ProximityPrompt"))
	end
	if cframe then
		wait(0.2)
		root.CFrame = cframe
	end
end
_G.LoadingScript = false
    end
})

Main:Button({
    Title = "Quest Check Door",
    Locked = false,
    Callback = function()
if _G.LoadingScript then return end
_G.LoadingScript = true
if House then	
	local cframe = root.CFrame
	local DoorFront = House:FindFirstChild("FrontDoor", true)
	local DoorLock = DoorFront:FindFirstChild("Door1", true)
	if DoorLock then
		root.CFrame = DoorLock.CFrame * CFrame.new(0, 0, -5)
		repeat task.wait() until Distance(DoorLock.Position) < 8
		wait(0.2)
		fireproximityprompt(DoorLock:FindFirstChildOfClass("ProximityPrompt"))
	end
	if cframe then
		wait(0.2)
		root.CFrame = cframe
	end
end
_G.LoadingScript = false
    end
})

local Misc = Tabs.Tab1
Misc:Toggle({
    Title = "Auto Sleep",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.Sleeping = Value
while _G.Sleeping do
if Dad and Room then
	local DadReal = Dad:FindFirstChild("PossesedDad")
	local DadRoot = DadReal and DadReal:FindFirstChild("HumanoidRootPart")
	local DadCheck = DadRoot and DadReal:FindFirstChild("ChaseDoor")
	local BedRoom = Room:FindFirstChild("Bedroom")
	local Beds = BedRoom and BedRoom:FindFirstChild("Beds")
	
	if Beds then
		if DadCheck and DadCheck.Value == true then
			if player:FindFirstChild("IsSleeping") and player.IsSleeping.Value == false then
				for i, v in pairs(Beds:GetChildren()) do
					if v.Name == "Bed" and v:FindFirstChild("Primary") and v.Primary:FindFirstChild("WeldConstraint") == nil then
						root.CFrame = v.Primary.CFrame
						repeat task.wait() until Distance(v.Primary.Position) < 8
						wait(0.2)
						fireproximityprompt(v.Primary:FindFirstChildOfClass("ProximityPrompt"))
						break
					end
				end
			end
		end
	end
end
task.wait()
end
    end
})

Misc:Toggle({
    Title = "Auto Drink Water",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.DrinkWater = Value
while _G.DrinkWater do
if House then
	local DadReal = Dad:FindFirstChild("PossesedDad")
	local DadRoot = DadReal and DadReal:FindFirstChild("HumanoidRootPart")
	local DadCheck = DadRoot and DadReal:FindFirstChild("ChaseDoor")
	
	local Spares = House:FindFirstChild("Spares")
	local WaterFilter = Spares and Spares:FindFirstChild("WaterDispenser")
	local Shelf = Spares and Spares:FindFirstChild("Shelf with Drinks")
	
	local PrimaryDispenser, PrimaryShelf = (WaterFilter and WaterFilter:FindFirstChild("Primary")), (Shelf and Shelf:FindFirstChild("Primary"))
	
	if not hasTool("Drinking Glass") and not hasTool("Glass of Water") then
		if PrimaryShelf then
			root.CFrame = PrimaryShelf.CFrame * CFrame.new(0, 0, -5)
			repeat task.wait() until Distance(PrimaryShelf.Position) < 8
			task.wait(0.2)
			local prompt = PrimaryShelf:FindFirstChildOfClass("ProximityPrompt")
			if prompt then
				fireproximityprompt(prompt)
			end
		end
	end
	if player:FindFirstChild("Thirst") and player.Thirst.Value <= 40 then
		if hasTool("Glass of Water") then
			local GlassWater = hasTool("Glass of Water")
			local UserRemote = GlassWater and GlassWater:FindFirstChild("Use")
			if UserRemote then
				UserRemote:FireServer()
			end
		end
	end
	if DadCheck and DadCheck.Value == false then
		if pack:FindFirstChild("Drinking Glass") then
			pack:FindFirstChild("Drinking Glass").Parent = char
		end
		if char:FindFirstChild("Drinking Glass") then
			if PrimaryDispenser then
				root.CFrame = PrimaryDispenser.CFrame * CFrame.new(0, 0, -5)
				repeat task.wait() until Distance(PrimaryDispenser.Position) < 8
				wait(0.3)
				fireproximityprompt(PrimaryDispenser:FindFirstChildOfClass("ProximityPrompt"))
			end
		end
	end
end
task.wait()
end
    end
})

Misc:Toggle({
    Title = "Auto Hunger",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.OmgEat = Value
while _G.OmgEat do
if Kitchen then
	local DadReal = Dad:FindFirstChild("PossesedDad")
	local DadRoot = DadReal and DadReal:FindFirstChild("HumanoidRootPart")
	local DadCheck = DadRoot and DadReal:FindFirstChild("ChaseDoor")
	
	if DadCheck and DadCheck.Value == false and player:FindFirstChild("Hunger") and player.Hunger.Value <= 40 then
		local fridge = Kitchen:FindFirstChild("FridgeNoodles")
		local stove = Kitchen:FindFirstChild("Stove")
		local table = Kitchen:FindFirstChild("DiningTable")
		local noodles = table:FindFirstChild("Noodles")
		local tabledad = noodles:FindFirstChild("DadPlate")
		
		local function AutoCookNoodle()
			if fridge and stove then
				if fridge:FindFirstChild("Primary") and fridge.Primary:FindFirstChildOfClass("ProximityPrompt") then
					root.CFrame = fridge.Primary.CFrame * CFrame.new(0, 0, -5)
					repeat task.wait() until Distance(fridge.Primary.Position) < 8
					wait(0.3)
					fireproximityprompt(fridge.Primary:FindFirstChildOfClass("ProximityPrompt"))
				end
				repeat task.wait() until hasTool("Raw Noodle")
				wait(0.3)
				if pack:FindFirstChild("Raw Noodle") then
					pack["Raw Noodle"].Parent = char
				end
				wait(0.3)
				if stove:FindFirstChild("Primary") and stove.Primary:FindFirstChildOfClass("ProximityPrompt") then
					root.CFrame = stove.Primary.CFrame * CFrame.new(0, 0, -5)
					repeat task.wait() until Distance(stove.Primary.Position) < 8
					wait(0.3)
					fireproximityprompt(stove.Primary:FindFirstChildOfClass("ProximityPrompt"))
				end
			end
		end
		
		for _, v in ipairs(noodles:GetChildren()) do
		    if v.Name ~= "DadPlate" and v:FindFirstChild("Plate") and v.Plate:FindFirstChildOfClass("ProximityPrompt") and v.Plate.Transparency > 0 then
				AutoCookNoodle()
				repeat task.wait() until hasTool("Cooked Noodle")
				wait(0.3)
				if pack:FindFirstChild("Cooked Noodle") then
					pack["Cooked Noodle"].Parent = char
				end
				wait(0.3)
				root.CFrame = v.Plate.CFrame * CFrame.new(0, 3, 0)
				repeat task.wait() until Distance(v.Plate.Position) < 8
				wait(0.3)
				for i = 1, 2 do
					fireproximityprompt(v.Plate:FindFirstChildOfClass("ProximityPrompt"))
					task.wait(0.3)
				end
				break
		    end
		end
	end
end
task.wait()
end
    end
})

Misc:Toggle({
    Title = "Auto Generator",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.GenNow = Value
while _G.GenNow do
if House then
	local Gas = House:FindFirstChild("GasCans")
	local Gen = House:FindFirstChild("Generator")
	if Gas and Gen and Gen:FindFirstChild("Bar") <= 40 then
		if not hasTool("gas can") then
			for i, v in ipairs(Gas:GetChildren()) do
				if v.Name == "GasCan" and v:FindFirstChild("Primary") and v.Primary:FindFirstChildOfClass("ProximityPrompt") then
					root.CFrame = v.Primary.CFrame * CFrame.new(0, 3, 0)
					repeat task.wait() until Distance(v.Primary.Position) < 8
					wait(0.3)
					fireproximityprompt(v.Primary:FindFirstChildOfClass("ProximityPrompt"))
					break
				end
			end
		end
		repeat task.wait() until hasTool("gas can")
		wait(0.3)
		if pack:FindFirstChild("gas can") then
			pack["gas can"].Parent = char
		end
		wait(0.15)
		if Gen:FindFirstChild("Button") and Gen.Button:FindFirstChildOfClass("ProximityPrompt") then
			root.CFrame = Gen.Button.CFrame * CFrame.new(0, 0, 5)
			repeat task.wait() until Distance(Gen.Button.Position) < 8
			wait(0.3)
			fireproximityprompt(Gen.Button:FindFirstChildOfClass("ProximityPrompt"))
		end
	end
end
task.wait()
end
    end
})

local Esp = Tabs.Tab2
Esp:Toggle({
    Title = "Esp Dad",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspDad = Value
if _G.EspDad == false then
for _, v in pairs(Dad:GetChildren()) do 
if v.Name == "PossesedDad" and v:FindFirstChild("HumanoidRootPart") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
end
while _G.EspDad do
for i, v in pairs(Dad:GetChildren()) do
if v.Name == "PossesedDad" and v:FindFirstChild("HumanoidRootPart") then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 0, 0)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 0, 0)
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
	        (_G.EspName == true and "Dad" or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.HumanoidRootPart.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v.Head
	GuiEsp.Name = "Esp_Gui"
	GuiEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiEsp.AlwaysOnTop = true
	GuiEspText = Instance.new("TextLabel", GuiEsp)
	GuiEspText.BackgroundTransparency = 1
	GuiEspText.Font = Enum.Font.Code
	GuiEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiEspText.TextSize = 15
	GuiEspText.TextColor3 = Color3.new(0,0,0) 
	GuiEspText.TextStrokeTransparency = 0.5
	GuiEspText.Text = ""
	local GuiEspTextSizeConstraint = Instance.new("UITextSizeConstraint", GuiEspText)
	GuiEspTextSizeConstraint.MaxTextSize = 35
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiEspText
	elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
	v:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
task.wait()
end
    end
})

Esp:Toggle({
    Title = "Esp Player",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspPlayer = Value
if _G.EspPlayer == false then
for i, v in pairs(game.Players:GetChildren()) do
	if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
		for x, b in pairs(v.Character:GetChildren()) do
			if b.Name:find("Esp_") then
				b:Destroy()
			end
		end
	end
end
end
while _G.EspPlayer do
for i, v in pairs(game.Players:GetChildren()) do
if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
if v.Character:FindFirstChild("Esp_Highlight") then
	v.Character:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.new(255, 255, 255)
	v.Character:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.new(255, 255, 255)
end
if _G.EspHighlight == true and v.Character:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(255, 255, 255) 
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v.Character
	Highlight.Parent = v.Character
	elseif _G.EspHighlight == false and v.Character:FindFirstChild("Esp_Highlight") then
	v.Character:FindFirstChild("Esp_Highlight"):Destroy()
end
if v.Character:FindFirstChild("Esp_Gui") and v.Character["Esp_Gui"]:FindFirstChild("TextLabel") then
	v.Character["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and v.Name or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.Character.HumanoidRootPart.Position)).."m)" or "")..
            (_G.EspHealth == true and "\nHealth ("..(v.Character.Humanoid.Health <= 0 and "Dead" or string.format("%.0f", (v.Character.Humanoid.Health)))..")" or "")
    v.Character["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v.Character["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v.Character:FindFirstChild("Esp_Gui") == nil then
	GuiPlayerEsp = Instance.new("BillboardGui", v.Character)
	GuiPlayerEsp.Adornee = v.Character.Head
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
	local GuiEspTextSizeConstraint = Instance.new("UITextSizeConstraint", GuiPlayerEspText)
	GuiEspTextSizeConstraint.MaxTextSize = 35
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiPlayerEspText
	elseif _G.EspGui == false and v.Character:FindFirstChild("Esp_Gui") then
	v.Character:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
task.wait()
end
    end
})

Esp:Section({Title = "Settings Esp", TextXAlignment = "Left", TextSize = 17})

Esp:Toggle({
    Title = "Esp Gui",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspGui = Value
    end
})

Esp:Toggle({
    Title = "Esp HightLight",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspHighlight = Value
    end
})

Esp:Section({Title = "Settings Color", TextXAlignment = "Left", TextSize = 17})

Esp:Colorpicker({
    Title = "Color Gui",
    Default = Color3.fromRGB(255, 255, 255),
    Transparency = 0,
    Locked = false,
    Callback = function(Value) 
_G.EspGuiTextColor = Value
    end
})

Esp:Colorpicker({
    Title = "Color HightLight",
    Default = Color3.fromRGB(255, 255, 255),
    Transparency = 0,
    Locked = false,
    Callback = function(Value) 
_G.ColorLight = Value
    end
})

Esp:Slider({
    Title = "Text Size [ Gui ]",
    Step = 1,
    Value = {
        Min = 5,
        Max = 50,
        Default = 10,
    },
    Callback = function(Value)
_G.EspGuiTextSize = Value
    end
})

Esp:Section({Title = "Settings Text", TextXAlignment = "Left", TextSize = 17})

Esp:Toggle({
    Title = "Esp Name",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspName = Value
    end
})

Esp:Toggle({
    Title = "Esp Distance",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspDistance = Value
    end
})

Esp:Toggle({
    Title = "Esp Health",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspHealth = Value
    end
})

-----------------------------------
Info = Tabs["Info"]
local InviteCode = "NE4fqyAStd"
local DiscordAPI = "https://discord.com/api/v10/invites/" .. InviteCode .. "?with_counts=true&with_expiration=true"
local function LoadDiscordInfo()
    local success, result = pcall(function()
        return game:GetService("HttpService"):JSONDecode(ui.Creator.Request({
            Url = DiscordAPI,
            Method = "GET",
            Headers = {
                ["User-Agent"] = "RobloxBot/1.0",
                ["Accept"] = "application/json"
            }
        }).Body)
    end)

    if success and result and result.guild then
        local DiscordInfo = Info:Paragraph({
            Title = result.guild.name,
            Desc = ' <font color="#52525b">•</font> Member Count : ' .. tostring(result.approximate_member_count) ..
                '\n <font color="#16a34a">•</font> Online Count : ' .. tostring(result.approximate_presence_count),
            Image = "https://cdn.discordapp.com/icons/" .. result.guild.id .. "/" .. result.guild.icon .. ".png?size=1024",
            ImageSize = 42,
        })

        Info:Button({
            Title = "Update Info",
            Callback = function()
                local updated, updatedResult = pcall(function()
                    return game:GetService("HttpService"):JSONDecode(ui.Creator.Request({
                        Url = DiscordAPI,
                        Method = "GET",
                    }).Body)
                end)

                if updated and updatedResult and updatedResult.guild then
                    DiscordInfo:SetDesc(
                        ' <font color="#52525b">�</font> Member Count : ' .. tostring(updatedResult.approximate_member_count) ..
                        '\n <font color="#16a34a">�</font> Online Count : ' .. tostring(updatedResult.approximate_presence_count)
                    )
                end
            end
        })

        Info:Button({
            Title = "Copy Discord Invite",
            Callback = function()
	            Notification({title = "Arona", content = "Copy Success", duration = 5, icon = "82357489459031", background = "119839538905938"})
                setclipboard("https://discord.gg/" .. InviteCode)
            end
        })
    else
        Info:Paragraph({
            Title = "Error fetching Discord Info",
            Desc = game:GetService("HttpService"):JSONEncode(result),
            Image = "triangle-alert",
            ImageSize = 26,
            Color = "Red",
        })
    end
end

LoadDiscordInfo()

Info:Divider()
Info:Section({ 
    Title = "All Creator Hub",
    TextXAlignment = "Center",
    TextSize = 17,
})
Info:Divider()
local Owner = Info:Paragraph({
    Title = "Nova Hoang (Nguyễn Tn Hoàng)",
    Desc = "Owner Of Article Hub and Nihahaha Hub",
    Image = "rbxassetid://77933782593847",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
})

local CoOwner = Info:Paragraph({
    Title = "Giang Hub (Giang)",
    Desc = "Co-Owner Of Article Hub and Nihahaha Hub",
    Image = "rbxassetid://138779531145636",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
})

--// setting \\--

settings = Tabs["Info"]
settings:Section({ 
    Title = "Theme",
    TextXAlignment = "Center",
    TextSize = 14,
})

local ThemeSelect
ThemeSelect = settings:Dropdown({
    Title = "Select Theme",
    Values = themeValues,
    Value = themeValues[1],
    Callback = function(option)
        _G.ThemeSelect = option
    end
})

settings:Button({
    Title = "Apply Theme",
    Desc = "Apply Theme Selected",
    Locked = false,
    Callback = function()
        if _G.ThemeSelect then
            ui:SetTheme(_G.ThemeSelect)
        end
    end
})
settings:Section({ 
    Title = "Background",
    TextXAlignment = "Center",
    TextSize = 14,
})

_G.BVaildSelect = {
    {"Miyako Winter L2d", "rbxassetid://135163165559760"},
    {"Hoshino L2d", "rbxassetid://103851438259846"},
    {"Hoshino Battle L2d", "rbxassetid://75926776642023"},
    {"Hoshino Swimsuit", "rbxassetid://74106641546392"},
    {"Koyuki L2d", "rbxassetid://103762147211543"},
    {"Nozomi L2d", "rbxassetid://85859359097457"},
    {"Hikari L2d", "rbxassetid://119414088930558"},
    {"Hina L2d", "rbxassetid://112066327222887"},
    {"Hina Swimsuit L2d", "rbxassetid://132997118288263"},
    {"Hina Dress L2d", "rbxassetid://87969100647163"},
    {"Iroha L2d", "rbxassetid://108978317263049"},
    {"Ibuki L2d", "rbxassetid://93610279036015"},
    {"Kuroko L2d", "rbxassetid://83965863962182"},
    {"Shiroko L2d", "rbxassetid://112249533991911"},
    {"Mika L2d", "rbxassetid://103641747937298"},
    {"Momoi L2d", "rbxassetid://92208907380304"},
    {"Midori L2d", "rbxassetid://96245685520202"},
    {"Nonomi L2d", "rbxassetid://121480067706078"},
    {"Hoshino Frist Year L2d", "rbxassetid://110606960925136"},
    {"Yume L2d", "rbxassetid://115200865502040"},
    {"No Background", "rbxassetid://0"},
}

_G.ImageGet = {}
for i, v in ipairs(_G.BVaildSelect) do
    table.insert(_G.ImageGet, v[1])
end

local SBA = settings:Dropdown({
    Title = "Select Available Background",
    Values = _G.ImageGet,
    Value = "Miyako Winter L2d",
    Callback = function(option)
for _, v in ipairs(_G.BVaildSelect) do
    if v[1] == option then
        Setbackground = v[2]
        break
    end
end
if Setbackground then
win:SetBackgroundImage(Setbackground)
end
    end
})

local CustomBackground = settings:Input({
    Title = "Put You Background ID Here",
    Desc = "Dont Try Put Link Image Is Doesn't, Use Id instant",
    Value = "",
    Type = "Input",
    Placeholder = "135163165559760",
    Callback = function(input)
    if not input == "" then
    _G.BackgroundImage = "rbxassetid://" ..input
        win:SetBackgroundImage(_G.BackgroundImage)
        end
    end
})

_G.ChooseNotify = "WindUI"
local NotifyYeap = settings:Dropdown({
    Title = "Choose Notify",
    Values = {"WindUI", "Roblox"},
    Value = "WindUI",
    Callback = function(Value)
_G.ChooseNotify = Value
    end
})

settings:Section({ 
    Title = "Config",
    TextXAlignment = "Center",
    TextSize = 14,
})

_G.ConfigName = ""
local savedFiles = ListFiles()
local auto = readAuto()
_G.ConfigName = auto.NameFileSelected

settings:Input({
	Title = "Name Config",
	Desc = "Input name to save/load config",
	Value = _G.ConfigName,
	InputIcon = "file",
	Type = "Input",
	Placeholder = "Config1",
	Callback = function(text)
		_G.ConfigName = text
	end
})

local filesDropdown = settings:Dropdown({
	Title = "Select Config File",
	Multi = false,
	AllowNone = true,
	Values = savedFiles,
	Value = _G.ConfigName ~= "" and _G.ConfigName or savedFiles[1],
	Callback = function(file)
		_G.ConfigName = file
	end
})

settings:Button({
	Title = "Save Config",
	Desc = "Save current UI config",
	Callback = function()
		if _G.ConfigName and _G.ConfigName ~= "" then
			SaveConfig(_G.ConfigName, {
				Theme = ui:GetCurrentTheme(),
				BackgroundImage = _G.BackgroundImage
			})
			writeAuto(readAuto().Auto)
			Notification({title = "Saved", content = "Config saved as " .. _G.ConfigName, duration = 5, icon = "82357489459031", background = "103762147211543"})
		end
	end
})

settings:Button({
	Title = "Load Config",
	Desc = "Load selected config",
	Callback = function()
		if _G.ConfigName and _G.ConfigName ~= "" then
			local data = LoadConfig(_G.ConfigName)
			if data then
				if data.Theme then ui:SetTheme(data.Theme) end
				if data.BackgroundImage then win:SetBackgroundImage(data.BackgroundImage) end
				Notification({title = "Loaded", content = "Config loaded from " .. _G.ConfigName, duration = 5, icon = "82357489459031", background = "103762147211543"})
			end
		end
	end
})

settings:Button({
	Title = "Overwrite Config",
	Desc = "Replace file with current config",
	Callback = function()
		if _G.ConfigName and _G.ConfigName ~= "" then
			SaveConfig(_G.ConfigName, {
				Theme = ui:GetCurrentTheme(),
				BackgroundImage = _G.BackgroundImage
			})
			Notification({title = "Overwritten", content = "File " .. _G.ConfigName .. " updated", duration = 5, icon = "82357489459031", background = "103762147211543"})
		end
	end
})

settings:Button({
	Title = "Refresh Config List",
	Callback = function()
		filesDropdown:Refresh(ListFiles())
	end
})

local AutoLoadConfigToggle = settings:Toggle({
	Title = "Auto Load Config",
	Desc = "Automatically load when script starts",
	Default = readAuto().Auto,
	Callback = function(state)
	task.wait(3)
		writeAuto(state)
	end
})

AutoLoadConfigToggle:Set(readAuto().Auto)

local autoData = readAuto()
if autoData and autoData.Auto and autoData.NameFileSelected and autoData.NameFileSelected ~= "" then
	local data = LoadConfig(autoData.NameFileSelected)
	if data then
		if data.Theme then ui:SetTheme(data.Theme) end
		if data.BackgroundImage then
			win:SetBackgroundImage(data.BackgroundImage)
			_G.BackgroundImage = data.BackgroundImage
		end
	end
end