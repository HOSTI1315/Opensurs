if game.Players.LocalPlayer.PlayerGui:FindFirstChild("LoadingUI") and game.Players.LocalPlayer.PlayerGui.LoadingUI.Enabled == true then
repeat task.wait() until game.Players.LocalPlayer.PlayerGui.LoadingUI.Enabled == false
end

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

Screech, ClutchHeart, AutoUseCrouch = false, false, false
if not old then
local old
old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
	local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" then
	    if tostring(self) == "Screech" and Screech == true then
	        args[1] = true
	        return old(self,unpack(args))
	    end
	    if tostring(self) == "ClutchHeartbeat" and ClutchHeart == true then
	        args[2] = true
	        return old(self,unpack(args))
	    end
	    if tostring(self) == "Crouch" and AutoUseCrouch == true then
	        args[1] = true
	        return old(self,unpack(args))
	    end
    end
    return old(self,...)
end))
end

function Distance(pos)
	if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - pos).Magnitude
	end
end

function Deciphercode(v)
local Hints = game.Players.LocalPlayer.PlayerGui:WaitForChild("PermUI"):WaitForChild("Hints")
local code = {[1] = "_",[2] = "_", [3] = "_", [4] = "_", [5] = "_"}
    for i, v in pairs(v:WaitForChild("UI"):GetChildren()) do
        if v:IsA("ImageLabel") and v.Name ~= "Image" then
            for b, n in pairs(Hints:GetChildren()) do
                if n:IsA("ImageLabel") and n.Visible and v.ImageRectOffset == n.ImageRectOffset then
                    code[tonumber(v.Name)] = n:FindFirstChild("TextLabel").Text 
                end
            end
        end
    end 
    return code
end

if game.CoreGui:FindFirstChild("Gui Track") == nil then
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "Gui Track"
gui.Enabled = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.2, 0, 0.1, 0)
Frame.Position = UDim2.new(0.02, 0, 0.87, 0)
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 1
Frame.Active = true
Frame.BackgroundTransparency = 0 
Frame.Parent = gui

local UICorner = Instance.new("UIStroke")
UICorner.Color = Color3.new(0, 0, 0)
UICorner.Thickness = 2.5
UICorner.Parent = Frame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

local Frame1 = Instance.new("Frame")
Frame1.Size = UDim2.new(1, 0, 1, 0)
Frame1.Position = UDim2.new(0, 0, 0, 0)
Frame1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame1.BorderColor3 = Color3.new(0, 0, 0)
Frame1.BorderSizePixel = 1
Frame1.Active = true
Frame1.BackgroundTransparency = 0.3
Frame1.Parent = Frame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame1

local Frame2 = Instance.new("Frame")
Frame2.Name = "Frame1"
Frame2.Size = UDim2.new(1, 0, 1, 0)
Frame2.Position = UDim2.new(0, 0, 0, 0)
Frame2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Frame2.BorderColor3 = Color3.new(0, 0, 0)
Frame2.BorderSizePixel = 1
Frame2.Active = true
Frame2.BackgroundTransparency = 0.15
Frame2.Parent = Frame1

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame2

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.BorderSizePixel = 1
TextLabel.Text = ""
TextLabel.TextSize = 16
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.Font = Enum.Font.Code
TextLabel.TextWrapped = true
TextLabel.Parent = Frame

local UITextSizeConstraint = Instance.new("UITextSizeConstraint", TextLabel)
UITextSizeConstraint.MaxTextSize = 35
end

function UpdateTrack(enabled, update)
update.Name = update.Name or "Bruh"
update.Size = update.Size or 1
if game.CoreGui:FindFirstChild("Gui Track") then
game.CoreGui["Gui Track"].Enabled = enabled or false
game.CoreGui["Gui Track"].Frame:FindFirstChild("TextLabel").Text = update.Name
local TweenService = game:GetService("TweenService")
local TweenBar = TweenService:Create(game.CoreGui["Gui Track"].Frame.Frame:FindFirstChild("Frame1"), TweenInfo.new(2), {Size = UDim2.new(update.Size, 0, 1, 0)})
TweenBar:Play()
end
end

------ Script --------

local HttpService = game:GetService("HttpService")
local PFS = game:GetService("PathfindingService")
local EntityModules = game:GetService("ReplicatedStorage").ModulesClient.EntityModules
gameData = game.ReplicatedStorage:WaitForChild("GameData")
local RoomLate = gameData.LatestRoom
local floor = gameData:WaitForChild("Floor")
local isMines = floor.Value == "Mines"
local isHotel = floor.Value == "Hotel"
local isBackdoor = floor.Value == "Backdoor"
local isGarden = floor.Value == "Garden"
local isRoom = floor.Value == "Rooms"

for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
	if v.Name == "MainUI" and v:FindFirstChild("Initiator") and v.Initiator:FindFirstChild("Main_Game") then
		requireGui = require(v.Initiator.Main_Game)
		MainUi = v
	end
end
game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(function()
	if v.Name == "MainUI" and v:FindFirstChild("Initiator") and v.Initiator:FindFirstChild("Main_Game") then
		requireGui = require(v.Initiator.Main_Game)
		MainUi = v
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
for i, v in pairs(_G.GetOldBright.New) do
	if _G.FullBright then
		game.Lighting[i] = v
	end
end
if _G.AntiCheatBruh and game.Players.LocalPlayer.Character then
game.Players.LocalPlayer.Character:PivotTo(game.Players.LocalPlayer.Character:GetPivot() * CFrame.new(0, 0, 1000))
end
if game:GetService("Workspace"):FindFirstChild("Camera") then
local CAM = game:GetService("Workspace").Camera
if _G.ThirdCamera and requireGui then
	CAM.CFrame = requireGui.finalCamCFrame * CFrame.new(1.5, -0.5, 6.5)
end
if _G.FovOPCamera then
	CAM.FieldOfView = _G.FovOP or 71
end
end
end)

if not isHotel then
_G.RemoveLag = {"Leaves", "HidingShrub", "Flowers"}
function RemoveLagTo(v)
	if _G.AntiLag == true then
		local Terrain = workspace:FindFirstChildOfClass("Terrain")
		Terrain.WaterWaveSize = 0
		Terrain.WaterWaveSpeed = 0
		Terrain.WaterReflectance = 0
		Terrain.WaterTransparency = 1
		game.Lighting.GlobalShadows = false
		game.Lighting.FogEnd = 9e9
		game.Lighting.FogStart = 9e9
		if v:IsA("ForceField") or v:IsA("Sparkles") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Beam") then
			v:Destroy()
		end
		for i, n in pairs(_G.RemoveLag) do
			if v.Name == n or v.Name:find("grass") then
				v:Destroy()
			end
		end
		if v:IsA("PostEffect") then
			v.Enabled = false
		end
		if v:IsA("BasePart") then
			v.Material = "Plastic"
			v.Reflectance = 0
			v.BackSurface = "SmoothNoOutlines"
			v.BottomSurface = "SmoothNoOutlines"
			v.FrontSurface = "SmoothNoOutlines"
			v.LeftSurface = "SmoothNoOutlines"
			v.RightSurface = "SmoothNoOutlines"
			v.TopSurface = "SmoothNoOutlines"
		elseif v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		end
	end
end
workspace.DescendantAdded:Connect(function(v)
	RemoveLagTo(v)
end)
end

if isRoom then
	if workspace:FindFirstChild("PathFindPartsFolder") == nil then
	    local Folder = Instance.new("Folder")
	    Folder.Parent = workspace
	    Folder.Name = "PathFindPartsFolder"
	end
end

---- UiLib ----

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
ui:Notify({
    Title = notifyFu.title or "",
    Content = notifyFu.content or "",
    Duration = notifyFu.duration or 3,
    Icon = ("rbxassetid://"..notifyFu.icon) or "",
    Background = ("rbxassetid://"..notifyFu.background) or "0"
})
local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound.Volume = 2
sound.PlayOnRemove = true
sound:Destroy()
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

Main:Toggle({
    Title = "Third Camera",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.ThirdCamera = Value
    end
})

Main:Slider({
    Title = "FOV Camera",
    Step = 1,
    Value = {
        Min = 70,
        Max = 150,
        Default = 80,
    },
    Callback = function(Value)
_G.FovOP = Value
    end
})

Main:Toggle({
    Title = "FOV Camera",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.FovOPCamera = Value
    end
})

Main:Section({Title = "Misc Main", TextXAlignment = "Left", TextSize = 17})

Main:Toggle({
    Title = "Anti Screech",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.AntiScreech = Value
Screech = Value
if _G.AntiScreech then
local function CheckSreech(v)
if v:IsA("Model") and v.Name == "Screech" then
v:Destroy()
end
end
for _, v in ipairs(workspace:GetDescendants()) do
        CheckSreech(v)
end
RemoveScreech = workspace.DescendantAdded:Connect(function(v)
        CheckSreech(v)
end)
elseif not _G.AntiScreech then
if RemoveScreech then
RemoveScreech:Disconnect()
RemoveScreech = nil
end
end
    end
})

Main:Toggle({
    Title = "Auto Clutch Heart Win",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
ClutchHeart = Value
    end
})

Main:Toggle({
    Title = "Anti Halt",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.NoHalt = Value
local HaltShade = EntityModules:FindFirstChild("Shade") or EntityModules:FindFirstChild("_Shade")
if HaltShade then
    HaltShade.Name = _G.NoHalt and "_Shade" or "Shade"
end
    end
})

Main:Toggle({
    Title = "Anti Eyes / Lookman",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.NoEyes = Value
while _G.NoEyes do
if workspace:FindFirstChild("Eyes") or workspace:FindFirstChild("BackdoorLookman") then
if game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder") then
game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("MotorReplication"):FireServer(-649)
end
end
task.wait()
end
    end
})

Main:Toggle({
    Title = "Anti Snare",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.NoSnare = Value
if _G.NoSnare then
local function CheckSnare(v)
        if v:IsA("Model") and v.Name == "Snare" then
                if v:FindFirstChild("Hitbox") then
                        v.Hitbox:Destroy()
                end
        end
end
for _, v in ipairs(workspace:GetDescendants()) do
        CheckSnare(v)
end
RemoveSnare = workspace.DescendantAdded:Connect(function(v)
        CheckSnare(v)
end)
elseif not _G.NoSnare then
if RemoveSnare then
RemoveSnare:Disconnect()
RemoveSnare = nil
end
end
    end
})

if isGarden then
Main:Toggle({
    Title = "Anti Monument",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.NoMonument = Value
while _G.NoMonument do
for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "MonumentEntity" and v:FindFirstChild("Top") then
                for _, x in pairs(v.Top:GetChildren()) do
                        if x.Name:find("Hitbox") then
                                x:Destroy()
                        end
                end
        end
end
task.wait()
end
    end
})
end

if isRoom then
Main:Toggle({
    Title = "Anti A-90",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.NoA90 = Value
if MainUi:FindFirstChild("Initiator") and MainUi.Initiator:FindFirstChild("Main_Game") and MainUi.Initiator.Main_Game:FindFirstChild("RemoteListener") and MainUi.Initiator.Main_Game.RemoteListener:FindFirstChild("Modules") then
	local A90Script = MainUi.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("A90") or MainUi.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("A90")
	if A90Script then
	    A90Script.Name = _G.NoA90 and "_A90" or "A90"
	end
end
    end
})
end

if isMines then
Main:Toggle({
    Title = "Anti Egg Gloom",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.AntiEggGloom = Value
if _G.AntiEggGloom then
for _, v in ipairs(workspace:GetDescendants()) do
    if v.Name == "Egg" then
		v.CanTouch = false
	end
end
AntiEggGloom = workspace.DescendantAdded:Connect(function(v)
	if v.Name == "Egg" then
		v.CanTouch = false
	end
end)
else
if AntiEggGloom then
AntiEggGloom:Disconnect()
AntiEggGloom = nil
end
end
    end
})

Main:Toggle({
    Title = "Anti Giggle",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.AntiGiggle = Value
if _G.AntiGiggle then
local function GiggleCeilings(v)
	if v:IsA("Model") and v.Name == "GiggleCeiling" then
		repeat task.wait() until v:FindFirstChild("Hitbox")
		wait(0.1)
		if v:FindFirstChild("Hitbox") then
			v.Hitbox:Destroy()
		end
	end
end
for _, v in ipairs(workspace:GetDescendants()) do
        GiggleCeilings(v)
end
AntiGiggle = workspace.DescendantAdded:Connect(function(v)
        GiggleCeilings(v)
end)
else
if AntiGiggle then
AntiGiggle:Disconnect()
AntiGiggle = nil
end
end
    end
})

Main:Toggle({
    Title = "Anti Fall Barrier",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.AntiFall = Value
if _G.AntiFall then
local function Falls(v)
        if v.Name == "PlayerBarrier" and v.Size.Y == 2.75 and (v.Rotation.X == 0 or v.Rotation.X == 180) then
                local CLONEBARRIER = v:Clone()
                CLONEBARRIER.CFrame = CLONEBARRIER.CFrame * CFrame.new(0, 0, -5)
                CLONEBARRIER.Color = Color3.new(1, 1, 1)
                CLONEBARRIER.Name = "CLONEBARRIER_ANTI"
                CLONEBARRIER.Size = Vector3.new(CLONEBARRIER.Size.X, CLONEBARRIER.Size.Y, 11)
			    CLONEBARRIER.Transparency = 0
			    CLONEBARRIER.Parent = v.Parent
        end
end
for _, v in ipairs(workspace:GetDescendants()) do
        Falls(v)
end
AntiFallReal = workspace.DescendantAdded:Connect(function(v)
        Falls(v)
end)
else
if AntiFallReal then
AntiFallReal:Disconnect()
AntiFallReal = nil
end
for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "CLONEBARRIER_ANTI" then
                v:Destroy()
        end
end
end
    end
})
end

if not isHotel then
Main:Toggle({
    Title = "Anti Lag",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.AntiLag = Value
if _G.AntiLag == true then
for i,v in pairs(game:GetDescendants()) do
	RemoveLagTo(v)
end
end
    end
})
end

Main:Toggle({
    Title = "Auto Use Crouch",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
AutoUseCrouch = Value
    end
})

Main:Toggle({
    Title = "Use Jump",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.ButtonJump = Value 
while _G.ButtonJump do 
if game.Players.LocalPlayer.Character then
game.Players.LocalPlayer.Character:SetAttribute("CanJump", true)
end
task.wait()
end 
if game.Players.LocalPlayer.Character then
game.Players.LocalPlayer.Character:SetAttribute("CanJump", false)
end
    end
})

Main:Toggle({
    Title = "Check "..(isBackdoor and "Haste Clock" or "Oxygen"),
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.ActiveCheck = Value
if _G.ActiveCheck then
if isBackdoor then
	if game:GetService("ReplicatedStorage"):FindFirstChild("FloorReplicated") and game:GetService("ReplicatedStorage").FloorReplicated:FindFirstChild("DigitalTimer") and game:GetService("ReplicatedStorage").FloorReplicated:FindFirstChild("ScaryStartsNow") then
		local function getTimeFormat(sec)
		    local min = math.floor(sec / 60)
		    local remSec = sec % 60
		    return string.format("%02d:%02d", min, remSec)
		end
		getCheck = game:GetService("ReplicatedStorage").FloorReplicated.DigitalTimer:GetPropertyChangedSignal("Value"):Connect(function()
		    if _G.ActiveCheck and game:GetService("ReplicatedStorage").FloorReplicated.ScaryStartsNow.Value then
			    if game:GetService("ReplicatedStorage").FloorReplicated.DigitalTimer.Value <= 60 then
					SizeTime = (game:GetService("ReplicatedStorage").FloorReplicated.DigitalTimer.Value / 60)
				else
					SizeTime = 1
				end
		        UpdateTrack(true, {Name = "Clock: "..getTimeFormat(game:GetService("ReplicatedStorage").FloorReplicated.DigitalTimer.Value), Size = SizeTime or 1})
		    end
		end)
	end
else
	getCheck = game.Players.LocalPlayer.Character:GetAttributeChangedSignal("Oxygen"):Connect(function()
		if game.Players.LocalPlayer.Character:GetAttribute("Oxygen") < 100 then
			UpdateTrack(true, {
				Name = string.format("Oxygen: %.1f", game.Players.LocalPlayer.Character:GetAttribute("Oxygen")),
				Size = (game.Players.LocalPlayer.Character:GetAttribute("Oxygen") / 100)
			})
		else
			UpdateTrack(false, {Name = "Oxygen: 100", Size = 1})
		end
	end)
end
else
if getCheck then
	getCheck:Disconnect()
	getCheck = nil
end
UpdateTrack(false, {Name = "Ok", Size = 1})
end
    end
})

local Misc = Tabs.Tab1
local EntityGet = Misc:Dropdown({
    Title = "Choose Entity",
    Values = {"Rush", "Seek", "Eyes", "Window", "LookMan", "Gloombat", "Ambush", "A-60", "A-120", "Monument"},
    Value = {"Rush"},
    Multi = true,
    AllowNone = true,
    Callback = function(Value) 
_G.EntityChoose = Value
    end
})

Misc:Toggle({
    Title = "Notification Entity",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.NotifyEntity = Value
if _G.NotifyEntity then
    EntityChild = workspace.ChildAdded:Connect(function(child)
        for _, v in ipairs(_G.EntityChoose) do
            if child:IsA("Model") and child.Name:find(v) then
                repeat task.wait() until not child:IsDescendantOf(workspace) or (game.Players.LocalPlayer:DistanceFromCharacter(child:GetPivot().Position) < 1000)
                if child:IsDescendantOf(workspace) then
					child.AncestryChanged:Connect(function()
					  if not child.Parent then
						if _G.GoodbyeBro then
						    Notification({title = "Arona", content = "Goodbye "..v.."!!", duration = 5, icon = "82357489459031", background = "119839538905938"})
			                if _G.NotifyEntityChat then
			                    local text = _G.ChatNotify or ""
			                    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(text.." Goodbye "..v.."!!")
			                end
						end
					  end
					end)
                    Notification({title = "Arona", content = v.." Spawn!!", duration = 5, icon = "82357489459031", background = "119839538905938"})
                    if _G.NotifyEntityChat then
                        local text = _G.ChatNotify or ""
                        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(text..v.." Spawn!!")
                    end
                end
            end
        end
    end)
else
    if EntityChild then
        EntityChild:Disconnect()
        EntityChild = nil
    end
end
    end
})

Misc:Toggle({
    Title = "Notification Goodbye",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.GoodbyeBro = Value
    end
})

if isGarden then
Misc:Toggle({
    Title = "Notification Bramble Light",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.BrambleLight = Value
if _G.BrambleLight then
local function BrambleLight(v)
	if v.Name == "LiveEntityBramble" and v:FindFirstChild("Head") and v.Head:FindFirstChild("LanternNeon") then
		for i, x in pairs(v.Head.LanternNeon:GetChildren()) do
			if x.Name == "Attachment" and x:FindFirstChild("PointLight") then
				LightningNotifyBr = x.PointLight:GetPropertyChangedSignal("Enabled"):Connect(function()
					if x.PointLight.Enabled then turn = "ON" else turn = "OFF" end
					Notification({title = "Arona", content = "Bramble Light ("..turn..")", duration = 3, icon = "82357489459031", background = "119839538905938"})
					if _G.NotifyEntityChat then
						TextChat = _G.ChatNotify or ""
						if TextChat then
							game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(TextChat.." Bramble Light ("..turn..")")
						end
					end
				end)
			end
		end
	end
end
for _, v in ipairs(workspace:GetDescendants()) do
	BrambleLight(v)
end
BrambleSpawn = workspace.DescendantAdded:Connect(function(v)
	BrambleLight(v)
end)
else
if LightningNotifyBr then
LightningNotifyBr:Disconnect()
LightningNotifyBr = nil
end
if BrambleSpawn then
BrambleSpawn:Disconnect()
BrambleSpawn = nil
end
end
    end
})
end

if isMines then
Misc:Toggle({
    Title = "Auto Mines Anchor",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.MinesAnchorOh = Value
if _G.MinesAnchorOh then
_G.MinesAnchorOhTablet = {}
_G.ConnectMinesAn = {}
local function DeciphercodeMine(v)
	if not table.find(_G.MinesAnchorOhTablet, v) and v.Name == "MinesAnchor" then
		table.insert(_G.MinesAnchorOhTablet, v)
	end
end
for _, v in ipairs(workspace:GetDescendants()) do
	DeciphercodeMine(v)
end
table.insert(_G.ConnectMinesAn, workspace.DescendantAdded:Connect(function(v)
    DeciphercodeMine(v)
end))
table.insert(_G.ConnectMinesAn, workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.MinesAnchorOhTablet, 1, -1 do
        if _G.MinesAnchorOhTablet[i] == v then
            table.remove(_G.MinesAnchorOhTablet, i)
            break
        end
    end
end))
else
if _G.ConnectMinesAn then
for i, v in pairs(_G.ConnectMinesAn) do
v:Disconnect()
end
end
_G.ConnectMinesAn = {}
end
while _G.MinesAnchorOh do
if MainUi:FindFirstChild("AnchorHintFrame") and MainUi.AnchorHintFrame:FindFirstChild("Code") then
for i, v in pairs(_G.MinesAnchorOhTablet) do
if v.Name == "MinesAnchor" and v:FindFirstChild("AnchorRemote") and Distance(v:GetPivot().Position) <= 10 then
v.AnchorRemote:InvokeServer(MainUi.AnchorHintFrame.Code.Text)
end
end
end
task.wait()
end
    end
})
end

if isHotel then
Misc:Toggle({
    Title = "Auto Get Code Library",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.NotifyEntity = Value
if _G.NotifyEntity then
local function CodeAll(v)
	if v:IsA("Tool") and v.Name == "LibraryHintPaper" then
        code = table.concat(Deciphercode(v))
        if code then
	        Notification({title = "Arona", content = "Code: "..code, duration = 15, icon = "82357489459031", background = "119839538905938"})
			if _G.NotifyEntityChat then
				TextChat = _G.ChatNotify or ""
				if TextChat then
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(TextChat..code)
				end
			end
			if _G.AutoUnlockPadlock then
				game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("PL"):FireServer(code)
			end
		end
    end
end
Getpaper = game.Players.LocalPlayer.Character.ChildAdded:Connect(function(v)
CodeAll(v)
end)
else
if Getpaper then
Getpaper:Disconnect()
Getpaper = nil
end
end
    end
})

Misc:Toggle({
    Title = "Auto Unlock Padlock",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.AutoUnlockPadlock = Value
    end
})
end

Misc:Input({
    Title = "Input Chat",
    Value = "",
    InputIcon = "speaker",
    Type = "Input",
    Placeholder = "Your Chat...",
    Callback = function(Value) 
_G.ChatNotify = Value
    end
})

Misc:Toggle({
    Title = "Notification Chat",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.NotifyEntityChat = Value
    end
})

Misc:Slider({
    Title = "Hiding Transparency",
    Step = 0.1,
    Value = {
        Min = 0,
        Max = 1,
        Default = 0.5,
    },
    Callback = function(Value)
_G.TransparencyHide = Value
    end
})

Misc:Toggle({
    Title = "Transparency Hiding",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.HidingTransparency = Value
while _G.HidingTransparency do
if game.Players.LocalPlayer.Character:GetAttribute("Hiding") then
	for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
		if v:IsA("ObjectValue") and v.Name == "HiddenPlayer" then
			if v.Value == game.Players.LocalPlayer.Character then
                local hidePart = {}
                for _, i in pairs(v.Parent:GetChildren()) do
                    if i:IsA("BasePart") then
		                i.Transparency = _G.TransparencyHide or 0.5
		                table.insert(hidePart, i)
		            end
		        end
            repeat task.wait()
                for _, h in pairs(hidePart) do
                    h.Transparency = _G.TransparencyHide or 0.5
                    task.wait()
                end
            until not game.Players.LocalPlayer.Character:GetAttribute("Hiding") or not _G.HidingTransparency
            for _, n in pairs(hidePart) do
                n.Transparency = 0
                task.wait()
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
    Title = "Anticheat Manipulation",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.AntiCheatBruh = Value
    end
})

if isRoom then
Misc:Toggle({
    Title = "Auto Room",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.AutoRoom = Value
if _G.AutoRoom then
	_G.ConnectRooms = {}
	if MainUi:FindFirstChild("Initiator") and MainUi.Initiator:FindFirstChild("Main_Game") and MainUi.Initiator.Main_Game:FindFirstChild("RemoteListener") and MainUi.Initiator.Main_Game.RemoteListener:FindFirstChild("Modules") then
		local A90Script = MainUi.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("A90")
		if A90Script then
		    A90Script.Name = "_A90"
		end
	end
	function Locker()
		local LockerRooms
		for i,v in pairs(workspace.CurrentRooms:GetDescendants()) do
	        if v.Name:find("Rooms_Locker") then
	            if v:FindFirstChild("Door") and v:FindFirstChild("HiddenPlayer") then
	                if v.HiddenPlayer.Value == nil and v.Door.Position.Y > -3 then
                        if LockerRooms == nil then
                            LockerRooms = v.Door
                        else
                            if Distance(v.Door.Position) < (LockerRooms.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                                LockerRooms = v.Door
                            end
                        end
	                end
	            end
	        end
	    end
		return LockerRooms
	end
	function getPathRooms()
	    local Part
	    local Entity = (workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120"))
	    if Entity and Entity.Main.Position.Y > -6.5 then
	        Part = Locker()
	    else
			if game.Players.LocalPlayer.Character:GetAttribute("Hiding") then
	           game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("CamLock"):FireServer()	
			end
	        Part = workspace.CurrentRooms[RoomLate.Value].Door.Door
	    end
	    return Part
	end
	function getHide()
		local Path = getPathRooms()
	    local Entity = (workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120"))
	    if Entity then
	        if Path then
	            if Path.Parent.Name:find("Rooms_Locker") and Entity:FindFirstChild("Main") and Entity.Main.Position.Y > -6.5 then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Path.Position).Magnitude <= 30 then
                        if not game.Players.LocalPlayer.Character:GetAttribute("Hiding") then
                            fireproximityprompt(Path.Parent:FindFirstChild("HidePrompt"))
                        end
                    end
	            end
	        end
		end
	end
end
spawn(function()
while _G.AutoRoom do getHide(); _G.SpeedWalk = false; task.wait() end
end)
while _G.AutoRoom do 
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 21.3
	Destination = getPathRooms()
	path = PFS:CreatePath({WaypointSpacing = 0.3, AgentRadius = 0.1, AgentCanJump = false})
	path:ComputeAsync(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 2.5, 0), Destination.Position)
	if path and path.Status == Enum.PathStatus.Success then
		local Waypoints = path:GetWaypoints()
	    workspace:FindFirstChild("PathFindPartsFolder"):ClearAllChildren()
	    for _, Waypoint in pairs(Waypoints) do
	        local part = Instance.new("Part")
	        part.Size = Vector3.new(0.5, 0.5, 0.5)
	        part.Position = Waypoint.Position
	        part.Shape = "Cylinder"
	        part.Material = "SmoothPlastic"
			part.Shape = Enum.PartType.Ball
	        part.Anchored = true
	        part.CanCollide = false
	        part.Parent = workspace:FindFirstChild("PathFindPartsFolder")
	    end
	    for _, Waypoint in pairs(Waypoints) do
	        if game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored == false then
	            game.Players.LocalPlayer.Character.Humanoid:MoveTo(Waypoint.Position)
	            game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
	        end
	    end
	end
end
function moveToCleanup()
	workspace:FindFirstChild("PathFindPartsFolder"):ClearAllChildren()
	if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
		game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
	end
end
moveToCleanup()
    end
})
end

Misc:Dropdown({
    Title = "Auto Loot",
    Values = {"Interactions", "Not Interactions"},
    Value = "Interactions",
    Callback = function(Value) 
_G.InteractionsLoot = Value
    end
})

_G.Aura = {
    "ActivateEventPrompt",
    "AwesomePrompt",
    "FusesPrompt",
    "HerbPrompt",
    "LeverPrompt",
    "LootPrompt",
    "ModulePrompt",
    "SkullPrompt",
    "UnlockPrompt",
    "ValvePrompt",
}
_G.InteractionsLoot = "Interactions"
Misc:Toggle({
    Title = "Auto Loot",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.AutoLoot = Value
if _G.AutoLoot then
lootables = {}
_G.Connectlootables = {}
local function LootCheck(v)
	if v:IsA("ProximityPrompt") and table.find(_G.Aura, v.Name) then
	    table.insert(lootables, v)
	end
end
for _, v in ipairs(workspace:GetDescendants()) do
	LootCheck(v)
end
table.insert(_G.Connectlootables, workspace.DescendantAdded:Connect(function(v)
	LootCheck(v)
end))
table.insert(_G.Connectlootables, workspace.DescendantRemoving:Connect(function(v)
    for i = #lootables, 1, -1 do
        if lootables[i] == v then
            table.remove(lootables, i)
            break
        end
    end
end))
else
if _G.Connectlootables then
for i, v in pairs(_G.Connectlootables) do
v:Disconnect()
end
end
_G.Connectlootables = {}
end
while _G.AutoLoot do
for i, v in pairs(lootables) do
	if v:IsA("ProximityPrompt") and table.find(_G.Aura, v.Name) and v.Enabled == true then
		if _G.InteractionsLoot == "Interactions" and not v:GetAttribute("Interactions"..game.Players.LocalPlayer.Name) or _G.InteractionsLoot == "Not Interactions" then
			if Distance(v.Parent:GetPivot().Position) <= 12 then
				if v.Parent.Name ~= "Mandrake" then
					fireproximityprompt(v)
				end
			end
		end
	end
end
task.wait(0.1)
end
    end
})

Misc:Slider({
    Title = "Walkspeed",
    Step = 1,
    Value = {
        Min = 16,
        Max = 25,
        Default = 16,
    },
    Callback = function(Value)
_G.WalkSpeedTp = Value
    end
})

if isMines then
Misc:Slider({
    Title = "Ladder Speed",
    Step = 1,
    Value = {
        Min = 16,
        Max = 75,
        Default = 30,
    },
    Callback = function(Value)
_G.LadderSpeed = Value
    end
})
end

Misc:Slider({
    Title = "Vitamin Speed",
    Step = 0.1,
    Value = {
        Min = 1,
        Max = 7,
        Default = 0.6,
    },
    Callback = function(Value)
_G.VitaminSpeed = Value
    end
})

Misc:Dropdown({
    Title = "WalkSpeed",
    Values = {"Vitamin", "Speed Hack"},
    Value = "",
    Callback = function(Value) 
_G.WalkSpeedChose = Value
if Value ~= "Vitamin" then
if game.Players.LocalPlayer.Character then
game.Players.LocalPlayer.Character:SetAttribute("SpeedBoost", 0)
end
end
    end
})

Misc:Toggle({
    Title = "WalkSpeed",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.SpeedWalk = Value
while _G.SpeedWalk do
if _G.WalkSpeedChose == "Speed Hack" then
if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (game.Players.LocalPlayer.Character:GetAttribute("Climbing") and (_G.LadderSpeed or 30) or _G.WalkSpeedTp)
end
elseif _G.WalkSpeedChose == "Vitamin" then
if game.Players.LocalPlayer.Character then
game.Players.LocalPlayer.Character:SetAttribute("SpeedBoost", _G.VitaminSpeed)
end
end
task.wait()
end
if game.Players.LocalPlayer.Character then
game.Players.LocalPlayer.Character:SetAttribute("SpeedBoost", 0)
end
    end
})

local Esp = Tabs.Tab2
if not isGarden and not isRoom then
Esp:Toggle({
    Title = "Esp "..(((isHotel or isBackdoor) and " Key / Lever") or (isMines and " Fuse")),
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspKey = Value
if _G.EspKey == false then
_G.KeyAdd = {}
if _G.ConnectKey then
for i, v in pairs(_G.ConnectKey) do
v:Disconnect()
end
end
_G.ConnectKey = {}
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name:find("Key") or v.Name == "LeverForGate" or v.Name:find("FuseObtain") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Keys(v)
if ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v:FindFirstChild("Hitbox")) or (v.Name == "LeverForGate" and v.PrimaryPart) then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
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
	        (_G.EspName == true and ((v.Name == "LeverForGate" and "Lever") or (v.Name:find("Key") and "Key") or (v.Name:find("FuseObtain") and "Fuse")) or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance((v.Name == "LeverForGate" and v.PrimaryPart.Position) or ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v.Hitbox.Position))).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
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
local function CheckKey(v)
    if not table.find(_G.KeyAdd, v) and ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v:FindFirstChild("Hitbox")) or (v.Name == "LeverForGate" and v.PrimaryPart) then
        table.insert(_G.KeyAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckKey(v)
end
table.insert(_G.ConnectKey, workspace.DescendantAdded:Connect(function(v)
    CheckKey(v)
end))
table.insert(_G.ConnectKey, workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.KeyAdd, 1, -1 do
        if _G.KeyAdd[i] == v then
            table.remove(_G.KeyAdd, i)
            break
        end
    end
end))
end
while _G.EspKey do
for i, v in pairs(_G.KeyAdd) do
if v:IsA("Model") then
Keys(v)
end
end
task.wait()
end
    end
})
end

if isGarden then
Esp:Toggle({
    Title = "Esp Guillotine",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspGuillotine = Value
if _G.EspGuillotine == false then
_G.GuillotinedAdd = {}
if _G.ConnectGuillotine then
for i, v in pairs(_G.ConnectGuillotine) do
v:Disconnect()
end
end
_G.ConnectGuillotine = {}
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name == "VineGuillotine" then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Guillotineds(v)
if v.Name == "VineGuillotine" then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
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
	        (_G.EspName == true and "Guillotineor" or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v:GetPivot().Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
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
local function CheckGuillotined(v)
    if not table.find(_G.GuillotinedAdd, v) and v.Name == "VineGuillotine" then
        table.insert(_G.GuillotinedAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckGuillotined(v)
end
table.insert(_G.ConnectGuillotine, workspace.DescendantAdded:Connect(function(v)
    CheckGuillotined(v)
end))
table.insert(_G.ConnectGuillotine, workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.GuillotinedAdd, 1, -1 do
        if _G.GuillotinedAdd[i] == v then
            table.remove(_G.GuillotinedAdd, i)
            break
        end
    end
end))
end
while _G.EspGuillotine do
for i, v in pairs(_G.GuillotinedAdd) do
if v:IsA("Model") then
Guillotineds(v)
end
end
task.wait()
end
    end
})
end

if isMines then
Esp:Toggle({
    Title = "Esp Generator",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspGenerator = Value
if _G.EspGenerator == false then
_G.EspGeneratorAdd = {}
if _G.ConnectGen then
for i, v in pairs(_G.ConnectGen) do
v:Disconnect()
end
end
_G.ConnectGen = {}
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name == "MinesGenerator" then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Gens(v)
if v.Name == "MinesGenerator" and v.PrimaryPart then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
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
	        (_G.EspName == true and "Generator" or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.PrimaryPart)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
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
local function CheckGens(v)
    if not table.find(_G.EspGeneratorAdd, v) and v.Name == "MinesGenerator" then
        table.insert(_G.EspGeneratorAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckGens(v)
end
table.insert(_G.ConnectGen, workspace.DescendantAdded:Connect(function(v)
    CheckGens(v)
end))
table.insert(_G.ConnectGen, workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.EspGeneratorAdd, 1, -1 do
        if _G.EspGeneratorAdd[i] == v then
            table.remove(_G.EspGeneratorAdd, i)
            break
        end
    end
end))
end
while _G.EspGenerator do
for i, v in pairs(_G.EspGeneratorAdd) do
if v:IsA("Model") then
Gens(v)
end
end
task.wait()
end
    end
})

Esp:Toggle({
    Title = "Esp Anchor Mines",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspAnchorMines = Value
if _G.EspAnchorMines == false then
_G.EspAnchorMinesAdd = {}
if _G.ConnectAnchorMines then
for i, v in pairs(_G.ConnectAnchorMines) do
v:Disconnect()
end
end
_G.ConnectAnchorMines = {}
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name == "MinesAnchor" then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function MinesAnchors(v)
if v.Name == "MinesAnchor" and v.PrimaryPart then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
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
	        (_G.EspName == true and "Anchor Mines ("..(v:FindFirstChild("Sign") and v.Sign:FindFirstChild("TextLabel") and v.Sign.TextLabel.Text)..")" or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.PrimaryPart)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
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
local function CheckMinesAnchors(v)
    if not table.find(_G.EspAnchorMinesAdd, v) and v.Name == "MinesAnchor" then
        table.insert(_G.EspAnchorMinesAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckMinesAnchors(v)
end
table.insert(_G.ConnectAnchorMines, workspace.DescendantAdded:Connect(function(v)
    CheckMinesAnchors(v)
end))
table.insert(_G.ConnectAnchorMines, workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.EspAnchorMinesAdd, 1, -1 do
        if _G.EspAnchorMinesAdd[i] == v then
            table.remove(_G.EspAnchorMinesAdd, i)
            break
        end
    end
end))
end
while _G.EspAnchorMines do
for i, v in pairs(_G.EspAnchorMinesAdd) do
if v:IsA("Model") then
MinesAnchors(v)
end
end
task.wait()
end
    end
})
end

Esp:Toggle({
    Title = "Esp "..(isRoom and "Room" or "Door"),
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspDoor = Value
if _G.EspDoor == false then
for _, v in pairs(game.Workspace:FindFirstChild("CurrentRooms"):GetChildren()) do 
if v:isA("Model") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
end
while _G.EspDoor do
for i, v in pairs(game.Workspace:FindFirstChild("CurrentRooms"):GetChildren()) do
if v:IsA("Model") and v:FindFirstChild("Door") and v.Door:FindFirstChild("Door") then
if not v.Door:GetAttribute("Opened") then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(255, 255, 255) 
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v.Door
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
	v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and (isRoom and "Room " or "Door ")..((v.Door:FindFirstChild("Sign") and v.Door.Sign:FindFirstChild("Stinker") and v.Door.Sign.Stinker.Text) or (v.Door.Sign:FindFirstChild("SignText") and v.Door.Sign.SignText.Text)):gsub("^0+", "")..(v.Door:FindFirstChild("Lock") and " (lock)" or "") or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.Door.Door.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v.Door
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
elseif v.Door:GetAttribute("Opened") then
for i, z in pairs(v:GetChildren()) do
	if z.Name:find("Esp_") then
		z:Destroy()
	end
end
end
end
end
task.wait()
end
    end
})

if isBackdoor then
Esp:Toggle({
    Title = "Esp Time Lever",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspLeverTime = Value
if _G.EspLeverTime == false then
_G.TimeLeverAdd = {}
if _G.ConnectTimeLever then
for i, v in pairs(_G.ConnectTimeLever) do
v:Disconnect()
end
end
_G.ConnectTimeLever = {}
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name:find("TimerLever") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function LeverTimes(v)
if v.Name:find("TimerLever") and v.PrimaryPart then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
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
	        (_G.EspName == true and "Lever Time" or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.PrimaryPart.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
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
local function CheckTimeLever(v)
    if not table.find(_G.TimeLeverAdd, v) and v.Name == "TimerLever" then
        table.insert(_G.TimeLeverAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckTimeLever(v)
end
table.insert(_G.ConnectTimeLever, workspace.DescendantAdded:Connect(function(v)
    CheckTimeLever(v)
end))
table.insert(_G.ConnectTimeLever, workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.TimeLeverAdd, 1, -1 do
        if _G.TimeLeverAdd[i] == v then
            table.remove(_G.TimeLeverAdd, i)
            break
        end
    end
end))
end
while _G.EspLeverTime do
for i, v in pairs(_G.TimeLeverAdd) do
if v:IsA("Model") then
LeverTimes(v)
end
end
task.wait()
end
    end
})
end

if isHotel then
Esp:Toggle({
    Title = "Esp Book",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspBook = Value
if _G.EspBook == false then
_G.BookAdd = {}
if _G.ConnectBook then
for i, v in pairs(_G.ConnectBook) do
v:Disconnect()
end
end
_G.ConnectBook = {}
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name:find("LiveHintBook") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Books(v)
if v.Name:find("LiveHintBook") and v.PrimaryPart then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
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
	        (_G.EspName == true and "Book" or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.PrimaryPart.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
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
local function CheckBook(v)
    if not table.find(_G.BookAdd, v) and v.Name == "LiveHintBook" then
        table.insert(_G.BookAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckBook(v)
end
table.insert(_G.ConnectBook, workspace.DescendantAdded:Connect(function(v)
    CheckBook(v)
end))
table.insert(_G.ConnectBook, workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.BookAdd, 1, -1 do
        if _G.BookAdd[i] == v then
            table.remove(_G.BookAdd, i)
            break
        end
    end
end))
end
while _G.EspBook do
for i, v in pairs(_G.BookAdd) do
if v:IsA("Model") then
Books(v)
end
end
task.wait()
end
    end
})

Esp:Toggle({
    Title = "Esp Breaker",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspBreaker = Value
if _G.EspBreaker == false then
_G.BreakerAdd = {}
if _G.ConnectBreaker then
for i, v in pairs(_G.ConnectBreaker) do
v:Disconnect()
end
end
_G.ConnectBreaker = {}
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name:find("LiveBreakerPolePickup") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Breakers(v)
if v.Name == "LiveBreakerPolePickup" and v:FindFirstChildOfClass("ProximityPrompt") then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
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
	        (_G.EspName == true and "Breaker" or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.PrimaryPart.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
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
local function CheckBreaker(v)
    if not table.find(_G.BreakerAdd, v) and v.Name == "LiveBreakerPolePickup" then
        table.insert(_G.BreakerAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckBreaker(v)
end
table.insert(_G.ConnectBreaker, workspace.DescendantAdded:Connect(function(v)
    CheckBreaker(v)
end))
table.insert(_G.ConnectBreaker, workspace.DescendantRemoving:Connect(function(v)
for i = #_G.BreakerAdd, 1, -1 do
    if _G.BreakerAdd[i] == v then
        table.remove(_G.BreakerAdd, i)
        break
    end
end
end))
end
while _G.EspBreaker do
for i, v in pairs(_G.BreakerAdd) do
if v.Name == "LiveBreakerPolePickup" then
Breakers(v)
end
end
task.wait()
end
    end
})
end

Esp:Toggle({
    Title = "Esp Item",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspItem = Value
if _G.EspItem == false then
_G.ItemAdd = {}
if _G.ConnectItem then
for i, v in pairs(_G.ConnectItem) do
v:Disconnect()
end
end
_G.ConnectItem = {}
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name:find("Handle") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Items(v)
if v.Name == "Handle" and v.Parent:FindFirstChildOfClass("ProximityPrompt") then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(255, 255, 255) 
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v.Parent
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
	v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and v.Parent.Name or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v.Parent
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
local function CheckItem(v)
    if not table.find(_G.ItemAdd, v) and v.Name == "Handle" then
        table.insert(_G.ItemAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckItem(v)
end
table.insert(_G.ConnectItem, workspace.DescendantAdded:Connect(function(v)
    CheckItem(v)
end))
table.insert(_G.ConnectItem, workspace.DescendantRemoving:Connect(function(v)
for i = #_G.ItemAdd, 1, -1 do
    if _G.ItemAdd[i] == v then
        table.remove(_G.ItemAdd, i)
        break
    end
end
end))
end
while _G.EspItem do
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	if v:IsA("Tool") then
		for i, z in pairs(v:GetChildren()) do
			if z.Name:find("Esp_") then
				z:Destroy()
			end
		end
	end
end
for i, v in pairs(_G.ItemAdd) do
if v.Name == "Handle" then
Items(v)
end
end
task.wait()
end
    end
})

_G.EspEntityNameDis = {
	["FigureRig"] = "Figure",
	["SallyMoving"] = "Window",
	["RushMoving"] = "Rush",
	["Eyes"] = "Eyes",
	["Groundskeeper"] = "Skeeper",
	["BackdoorLookman"] = "Lookman",
	["BackdoorRush"] = "Blitz",
	["MandrakeLive"] = "Mandrake",
	["GloomPile"] = "Egg",
	["Snare"] = "Snare",
	["MonumentEntity"] = "Monument",
	["LiveEntityBramble"] = "Bramble",
	["GrumbleRig"] = "Grumble",
	["GiggleCeiling"] = "Giggle",
	["AmbushMoving"] = "Ambush",
	["A60"] = "A-60",
	["A120"] = "A-120"
}

Esp:Toggle({
    Title = "Esp Entity",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspEntity = Value
if _G.EspEntity == false then
_G.EntityAdd = {}
if _G.ConnectEntity then
for i, v in pairs(_G.ConnectEntity) do
v:Disconnect()
end
end
_G.ConnectEntity = {}
for _, v in pairs(workspace:GetDescendants()) do 
for x, z in pairs(_G.EspEntityNameDis) do
if v:IsA("Model") and (v.Name == x) then
if v.PrimaryPart then
v.PrimaryPart.Transparency = 1
end
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
end
else
local function CheckEntity(v)
	for x, z in pairs(_G.EspEntityNameDis) do
		if v:IsA("Model") and (v.Name == x) then
			if v.Name == "Snare" and v.Parent and v.Parent:IsA("Model") and v.Parent.Name == "Snare" then
				return
			end			
			if not table.find(_G.EntityAdd, v) then
				table.insert(_G.EntityAdd, v)
			end
		end
	end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckEntity(v)
end
table.insert(_G.ConnectEntity, workspace.DescendantAdded:Connect(function(v)
    CheckEntity(v)
end))
table.insert(_G.ConnectEntity, workspace.DescendantRemoving:Connect(function(v)
for i = #_G.EntityAdd, 1, -1 do
    if _G.EntityAdd[i] == v then
        table.remove(_G.EntityAdd, i)
        break
    end
end
end))
end
while _G.EspEntity do
for i, v in pairs(_G.EntityAdd) do
for x, z in pairs(_G.EspEntityNameDis) do
if v:IsA("Model") and (v.Name == x) then
AllTransparent = true
for _, v3 in ipairs(v:GetChildren()) do
    if v3:IsA("BasePart") and v3.Transparency < 1 then
        AllTransparent = false
        break
    end
end
if AllTransparent then
    if v.PrimaryPart then
		v.PrimaryPart.Transparency = 1
	end
end
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
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
	        (_G.EspName == true and _G.EspEntityNameDis[v.Name] or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.PrimaryPart.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
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
end
task.wait()
end
    end
})

Esp:Toggle({
    Title = "Esp Hiding Spots",
    Type = "Toggle",
    Default = false,
    Callback = function(Value)
_G.EspHiding = Value
if _G.EspHiding == false then
_G.HidingAdd = {}
if _G.ConnectHiding then
for i, v in pairs(_G.ConnectHiding) do
v:Disconnect()
end
end
_G.ConnectHiding = {}
for _, v in pairs(workspace:GetDescendants()) do 
if v:IsA("ObjectValue") and v.Name == "HiddenPlayer" then
for i, z in pairs(v.Parent:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
local function CheckHiding(v)
    if not table.find(_G.HidingAdd, v) and v:IsA("ObjectValue") and v.Name == "HiddenPlayer" then
        table.insert(_G.HidingAdd, v.Parent)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckHiding(v)
end
table.insert(_G.ConnectHiding, workspace.DescendantAdded:Connect(function(v)
    CheckHiding(v)
end))
table.insert(_G.ConnectHiding, workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.HidingAdd, 1, -1 do
        if _G.HidingAdd[i] == v then
            table.remove(_G.HidingAdd, i)
            break
        end
    end
end))
end
while _G.EspHiding do
for i, v in pairs(_G.HidingAdd) do
if v:IsA("Model") and v.PrimaryPart then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
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
	        (_G.EspName == true and v.Name.." (Hide)" or "")..
            (_G.EspDistance == true and "\n("..string.format("%.0f", Distance(v.PrimaryPart.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
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