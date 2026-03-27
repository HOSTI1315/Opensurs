local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/BoredStuff2/notify-lib/main/lib"))()
NotifyLib.prompt('FazeWare - Special', 'Loading..', 5)
wait(2)
NotifyLib.prompt('FazeWare', 'Skivux.cc lol', 5)
NotifyLib.prompt('FazeWare', 'Skivux.cc lol', 5)
--// minecrafto
local Window = Library.CreateLib("FazeWare - Special")
local Aimlock = Window:NewTab("Aimlock")
local Silent = Window:NewTab("Silent Aim")
local SilentAimlock = Window:NewTab("Silent Aimlock")
local Visuals = Window:NewTab("Visuals")
local UISettings = Window:NewTab("GUI Settings")
--Tabs are finished <3
local Section = Aimlock:NewSection("Aimlock Section")
Section:NewButton("Aimlock", "Q  To lock on people", function()
    NotifyLib.prompt('FazeWare', '( Press ( P ) To enable aimlock ) Aimlock Loaded Keybind is { Q } ( made by evan licensed aimlock love u no homo )', 5)
wait(1)
getgenv().Prediction = 6.450
getgenv().AimPart = "LowerTorso"
getgenv().Key = "Q"
getgenv().DisableKey = "P"

getgenv().FOV = true
getgenv().ShowFOV = false
getgenv().FOVSize = 70

getgenv().SmoothnessMode = true
getgenv().Smoothness = 1

--// Variables (Service)

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")
local GS = game:GetService("GuiService")
local SG = game:GetService("StarterGui")

--// Variables (regular)

local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
local Camera = WS.CurrentCamera
local GetGuiInset = GS.GetGuiInset

local AimlockState = false
local Locked
local Victim

local SelectedKey = getgenv().Key
local SelectedDisableKey = getgenv().DisableKey

--// Notification function

function Notify(tx)
    SG:SetCore("SendNotification", {
        Title = "Evan's Camlock",
        Text = tx,
        Duration = 5
    })
end

--// Check if aimlock is loaded

if getgenv().Loaded == true then
    Notify("Aimlock is already loaded!")
    return
end

getgenv().Loaded = true

--// FOV Circle

local fov = Drawing.new("Circle")
fov.Filled = false
fov.Transparency = 1
fov.Thickness = 1
fov.Color = Color3.fromRGB(255, 255, 0)
fov.NumSides = 1000

--// Functions

function update()
    if getgenv().FOV == true then
        if fov then
            fov.Radius = getgenv().FOVSize * 2
            fov.Visible = getgenv().ShowFOV
            fov.Position = Vector2.new(Mouse.X, Mouse.Y + GetGuiInset(GS).Y)

            return fov
        end
    end
end

function WTVP(arg)
    return Camera:WorldToViewportPoint(arg)
end

function WTSP(arg)
    return Camera.WorldToScreenPoint(Camera, arg)
end

function getClosest()
    local closest
    local dist = math.huge
    
    for i,v in pairs(Players:GetPlayers()) do
        local char = v.Character
        local KO = char:WaitForChild("BodyEffects")["K.O"]
        local Grabbed = char:FindFirstChild("GRABBING_COINSTRAINT") ~= nil

        if v ~= LP and char and char:FindFirstChild("Humanoid") and char:FindFirstChild(getgenv().AimPart) then
            local pos, vis = WTVP(char.PrimaryPart.Position)
            local mag = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude

            if getgenv().FOV then
                if (fov.Radius > mag and mag < dist) then
                    closest = v
                    dist = mag
                end
            else
                if (mag < dist) then
                    closest = v
                    dist = mag
                end
            end
        end
    end

    return closest
end

--// Checks if key is down

Mouse.KeyDown:Connect(function(k)
    SelectedKey = SelectedKey:lower()
    SelectedDisableKey = SelectedDisableKey:lower()
    if k == SelectedKey then
        if AimlockState then
            Locked = not Locked
            if Locked then
                Victim = getClosest()

                Notify("Locked onto: "..tostring(Victim.Character.Humanoid.DisplayName))
            elseif not Locked then
                Victim = nil

                Notify("Unlocked!")
            end
        else
            print("Aimlock is not enabled!")
        end
    end
    if k == SelectedDisableKey then
        AimlockState = not AimlockState
    end
end)

--// Loop update FOV and loop camera lock onto target

RS.RenderStepped:Connect(function()
    update()
    if AimlockState == true then
        if Victim ~= nil then
            if getgenv().SmoothnessMode then
                local CoordFrame = CFrame.new(Camera.CFrame.p, Victim.Character[getgenv().AimPart].Position + Victim.Character[getgenv().AimPart].Velocity/getgenv().Prediction)
                Camera.CFrame = Camera.CFrame:Lerp(CoordFrame, getgenv().Smoothness)
            else
                Camera.CFrame = CFrame.new(Camera.CFrame.p, Victim.Character[getgenv().AimPart].Position + Victim.Character[getgenv().AimPart].Velocity/getgenv().Prediction)
            end
        end
    end
end)
end)
--Aimlock Prediction
Section:NewTextBox("Aimlock Prediction", "love you all", function(txt)
getgenv().Prediction = txt
end)
Section:NewToggle("Smoothnes Mode", "KANKA NE DIYOSUNNN", function(ok)
getgenv().SmoothnessMode = ok
end)
Section:NewSlider("Aimlock Fov", "OH", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
   getgenv().FOVSize = s
end)
Section:NewTextBox("Aimlock Keybind", "Keybind", function(ad)
getgenv().Key = ad
end)
Section:NewToggle("Aimlock Fov", "okokboredasfuck", function(ok)
getgenv().ShowFOV = ok
end)
Section:NewDropdown("Aimlock Part", "Part", {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart"}, function(currentOption)
    getgenv().AimPart = currentOption
end)
--aimlock finish
local Section = Silent:NewSection("Silent Aim")
Section:NewButton("Silent Aim", "Silent Aim!", function()
     NotifyLib.prompt('FazeWare', 'Silent Aim Enabled! Credits To Stefanuk12 For Modulev2 ( with license )', 5)
-- // Dependencies
local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Aiming/main/Load.lua"))()("Module")

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")

-- // Vars
local MainEvent = ReplicatedStorage.MainEvent
local AimingSelected = Aiming.Selected
local AimingChecks = Aiming.Checks
local DataPing = Stats.Network.ServerStatsItem["Data Ping"]

-- // Workout the prediction stuff
local PredictionBase = 0.037
local CurrentPredictionValue = 0

RunService.Heartbeat:Connect(function()
    -- // Workout the prediction value
    local Ping = tostring(DataPing:GetValueString()):split(" ")[1]
    CurrentPredictionValue = (Ping / 1000 + PredictionBase)
end)

-- // Apply the prediction
local function ApplyPredictionFormula(SelectedPart)
    -- // Workout the predicted place
    local Predicted = SelectedPart.CFrame + (SelectedPart.Velocity * CurrentPredictionValue)

    -- // Return it
    return Predicted
end

-- // So it works when not obfuscating
LPH_JIT_ULTRA = LPH_JIT_ULTRA or function(...)
    return ...
end

-- //
LPH_JIT_ULTRA(function()
    local __namecall
    __namecall = hookmetamethod(game, "__namecall", function(...)
        -- // Vars
        local args = {...}
        local self = args[1]
        local method = getnamecallmethod()

        -- // Make sure aiming is enabled, and the game is trying to send the mouse pos to server
        if (method == "FireServer" and self == MainEvent and args[2] == "UpdateMousePos" and AimingChecks.IsAvailable()) then
            -- // Spoof mouse pos
            local Hit = ApplyPredictionFormula(AimingSelected.Part)
            args[3] = Hit.Position

            -- // Return spoofed args
            return __namecall(unpack(args))
        end

        -- // Return
        return __namecall(...)
    end)
end)()
end)


Section:NewColorPicker("Fov Color", "Color Info", Color3.fromRGB(0,0,0), function(color)
Aiming.Settings.FOVSettings.Colour = color
end)
Section:NewSlider("Hit Chance", "hit chance like yk", 100, 0, function(s)
Aiming.Settings.HitChance = s
end)
Section:NewToggle("Wall Check", "Doesnt Shoot Behind Wall people whaeterv nigga", function(s) 
Aiming.Settings.FOVSettings.VisibleCheck = s
end)

Section:NewToggle("Fov Enabled", "gah dam", function(ok)
Aiming.Settings.FOVSettings.Enabled = ok
end)
Section:NewSlider("Silent Aim Sides", "like yk", 100, 0, function(s)
Aiming.Settings.FOVSettings.Sides = s
end)

--// Silent End LOLz
local Section = SilentAimlock:NewSection("Silent Aimlock")

Section:NewButton("Silent Aimlock", "Enable", function()
    NotifyLib.prompt('FazeWare', 'Credits TO Flash For The Lock ( Hes Main Lock But Thats Paid No One Can Deobfuscate Luraph Stay Safe Flash Nigga )' )

--[[
███████╗██╗░░░░░░█████╗░░██████╗██╗░░██╗░██╗░░░░░░░██╗
██╔════╝██║░░░░░██╔══██╗██╔════╝██║░░██║░██║░░██╗░░██║
█████╗░░██║░░░░░███████║╚█████╗░███████║░╚██╗████╗██╔╝
██╔══╝░░██║░░░░░██╔══██║░╚═══██╗██╔══██║░░████╔═████║░
██║░░░░░███████╗██║░░██║██████╔╝██║░░██║░░╚██╔╝░╚██╔╝░
╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░

]]
-- Toggle
getgenv().Target = true
-- Configuration
    getgenv().Key = Enum.KeyCode.Q
getgenv().Prediction = 0.140
getgenv().ChatMode = false
getgenv().NotifMode = false
    getgenv().PartMode = false
    getgenv().AirshotFunccc = false
    getgenv().Partz = "HumanoidRootPart"
    getgenv().AutoPrediction = false
    --
    _G.Types = {
        Ball = Enum.PartType.Ball,
        Block = Enum.PartType.Block, 
        Cylinder = Enum.PartType.Cylinder
    }
    
    --variables                 
    	local Tracer = Instance.new("Part", game.Workspace)
    Tracer.Name = "gay"	
    Tracer.Anchored = true		
    Tracer.CanCollide = false
    Tracer.Transparency = 0.8
    Tracer.Parent = game.Workspace	
    Tracer.Shape = _G.Types.Block
    Tracer.Size = Vector3.new(14,14,14)
    Tracer.Color = Color3.fromRGB(128,128,128)
    
    --
    local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local Runserv = game:GetService("RunService")

circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(255,255,255)
circle.Thickness = 0
circle.NumSides = 732
circle.Radius = 120
circle.Thickness = 0
circle.Transparency = 0.7
circle.Visible = false
circle.Filled = false

Runserv.RenderStepped:Connect(function()
    circle.Position = Vector2.new(mouse.X,mouse.Y+35)
end)
    
    	local guimain = Instance.new("Folder", game.CoreGui)
    	local CC = game:GetService"Workspace".CurrentCamera
    local LocalMouse = game.Players.LocalPlayer:GetMouse()
    	local Locking = false
    
    	
    --
    if getgenv().valiansh == true then
                        game.StarterGui:SetCore("SendNotification", {
                   Title = "FazeWare",
                   Text = "Already Loaded!",
                   Duration = 5
        
                   })
        return
    end
    
    getgenv().valiansh = true
    
        local UserInputService = game:GetService("UserInputService")

    UserInputService.InputBegan:Connect(function(keygo,ok)
           if (not ok) then
           if (keygo.KeyCode == getgenv().Key) then
               if getgenv().Target == true then
               Locking = not Locking
               
               if Locking then
               Plr =  getClosestPlayerToCursor()
                if getgenv().ChatMode then
        local A_1 = "Target: "..tostring(Plr.Character.Humanoid.DisplayName) local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
        	end	
               if getgenv().NotifMode then
    			game.StarterGui:SetCore("SendNotification", {
        Title = "FazeWare";
        Text = "Target: "..tostring(Plr.Character.Humanoid.DisplayName);
    
    })
    end
    elseif not Locking then
         if getgenv().ChatMode then
        local A_1 = "Unlocked!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
        	end	
        if getgenv().NotifMode then
                        game.StarterGui:SetCore("SendNotification", {
                   Title = "FazeWare    ",
                   Text = "Unlocked",
                   Duration = 5
               })
           elseif getgenv().Target == false then
                        game.StarterGui:SetCore("SendNotification", {
                   Title = "FazeWare",
                   Text = "Target isn't enabled",
                   Duration = 5
     
                   })
               
               end
                  
 
 end     end   
end
end
end)
	
	function getClosestPlayerToCursor()
		local closestPlayer
		local shortestDistance =  circle.Radius

		for i, v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("LowerTorso") then
				local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
				local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalMouse.X, LocalMouse.Y)).magnitude
				if magnitude < shortestDistance then
					closestPlayer = v
					shortestDistance = magnitude
				end
			end
		end
		return closestPlayer
	end
--
if getgenv().PartMode then
	game:GetService"RunService".Stepped:connect(function()
		if Locking and Plr.Character and Plr.Character:FindFirstChild("LowerTorso") then
			Tracer.CFrame = CFrame.new(Plr.Character.LowerTorso.Position+(Plr.Character.LowerTorso.Velocity*Prediction))
		else
			Tracer.CFrame = CFrame.new(0, 9999, 0)

		end
	end)
end

    
    
    --
	local rawmetatable = getrawmetatable(game)
	local old = rawmetatable.__namecall
	setreadonly(rawmetatable, false)
	rawmetatable.__namecall = newcclosure(function(...)
		local args = {...}
		if Locking and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character[getgenv().Partz].Position+(Plr.Character[getgenv().Partz].Velocity*Prediction)
			return old(unpack(args))
		end
		return old(...)
	end)
	if getgenv.AirshotFunccc then
	if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        getgenv().Partz = "RightFoot"
    else
        getgenv().Partz = "LowerTorso"
end
end
end)

Section:NewDropdown("SilentAimlock Part", "Part", {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart"}, function(ok)
    getgenv().Partz = ok
end)


Section:NewTextBox("Prediction", "ok", function(txt)
getgenv().Prediction = txt
end)

Section:NewToggle("Auto Prediction", "good", function(txt)
	while wait() do
        if getgenv().AutoPrediction == true then
        local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local split = string.split(pingvalue,'(')
        local ping = tonumber(split[1])
            if ping < 225 then
            getgenv().Prediction = 0.169
        elseif ping < 215 then
            getgenv().Prediction = 0.167
	    elseif ping < 205 then
            getgenv().Prediction = 0.165
	    elseif ping < 190 then
            getgenv().Prediction = 0.163
        elseif ping < 180 then
            getgenv().Prediction = 0.161
	    elseif ping < 170 then
            getgenv().Prediction = 0.159
	    elseif ping < 160 then
            getgenv().Prediction = 0.157
	    elseif ping < 150 then
            getgenv().Prediction = 0.155
        elseif ping < 140 then
            getgenv().Prediction = 0.153
        elseif ping < 130 then
            getgenv().Prediction = 0.151
        elseif ping < 120 then
            getgenv().Prediction = 0.149
        elseif ping < 110 then
            getgenv().Prediction = 0.146
        elseif ping < 105 then
            getgenv().Prediction = 0.138
        elseif ping < 90 then
            getgenv().Prediction = 0.136
        elseif ping < 80 then
            getgenv().Prediction = 0.134
        elseif ping < 70 then
            getgenv().Prediction = 0.131
        elseif ping < 60 then
            getgenv().Prediction = 0.1229
        elseif ping < 50 then
            getgenv().Prediction = 0.1225
        elseif ping < 40 then
            getgenv().Prediction = 0.1256
        elseif ping < 30 then
            getgenv().Prediction = 0.1254
        end
        end
	end
end)


Section:NewToggle("Chat Mode", "love you all", function(txt)
    getgenv().ChatMode = txt
    end)
    Section:NewToggle("Notfiy Mode", "Notifying", function(ok)
        
    getgenv().NotifMode = ok
    end)
    Section:NewToggle("Airshot Function", "EASY!!!!!!!!", function(ok)
      
        getgenv().AirshotFunccc = ok
    end)
    Section:NewToggle("Auto Prediction", "ok", function(ok)
        getgenv().AutoPrediction = ok
    end)
    
    local Section = UISettings:NewSection("GUI Toggle")
    Section:NewKeybind("GUI Toggle", "close open nigga", Enum.KeyCode.V, function()
        Library:ToggleUI()
    end) 
    
    

local Section = Visuals:NewSection("Visual Section")
Section:NewButton("Enable ESP!", "", function()
     NotifyLib.prompt('FazeWare', 'ESP Enabled!', 5)

local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

local HeadOff = Vector3.new(0, 0.5, 0)
local LegOff = Vector3.new(0,3,0)

for i,v in pairs(game.Players:GetChildren()) do
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local HealthBarOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 3
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Color3.new(0,0,0)
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false

    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true

                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                    HealthBarOutline.Visible = true

                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / math.clamp(game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value, 0, game:GetService("Players")[v.Character.Name].NRPBS:WaitForChild("MaxHealth").Value)))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                    HealthBar.Color = Color3.fromRGB(255 - 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 0)
                    HealthBar.Visible = true

                    if v.TeamColor == lplr.TeamColor then
                        --- Our Team
                        BoxOutline.Visible = false
                        Box.Visible = false
                        HealthBarOutline.Visible = false
                        HealthBar.Visible = false
                    else
                        ---Enemy Team
                        BoxOutline.Visible = true
                        Box.Visible = true
                        HealthBarOutline.Visible = true
                        HealthBar.Visible = true
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
                HealthBarOutline.Visible = false
                HealthBar.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end

game.Players.PlayerAdded:Connect(function(v)
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local HealthBarOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 3
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Color3.new(0,0,0)
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false

    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true

                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                    HealthBarOutline.Visible = true

                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / math.clamp(game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value, 0, game:GetService("Players")[v.Character.Name].NRPBS:WaitForChild("MaxHealth").Value)))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1/HealthBar.Size.Y))
		    HealthBar.Color = Color3.fromRGB(255 - 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 0)                    
		    HealthBar.Visible = true

                    if v.TeamColor == lplr.TeamColor then
                        --- Our Team
                        BoxOutline.Visible = false
                        Box.Visible = false
                        HealthBarOutline.Visible = false
                        HealthBar.Visible = false
                    else
                        ---Enemy Team
                        BoxOutline.Visible = true
                        Box.Visible = true
                        HealthBarOutline.Visible = true
                        HealthBar.Visible = true
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
                HealthBarOutline.Visible = false
                HealthBar.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end)
end)