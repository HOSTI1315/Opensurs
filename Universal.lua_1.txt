local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local TextChatService = game:GetService("TextChatService")

Library.ForceCheckbox = true
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "UNXHub",
    Footer = "Version: " .. (getgenv().unxshared and getgenv().unxshared.version or "Unknown") .. ", Game: " .. (getgenv().unxshared and getgenv().unxshared.gamename or "Unknown") .. ", Player: " .. (getgenv().unxshared and getgenv().unxshared.playername or "Unknown"),
    Icon = 73740010358428,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
	Main = Window:AddTab("Main", "home"),
	Visuals = Window:AddTab("Visuals", "eye"),
	Features = Window:AddTab("Features", "zap"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local defaultWalkSpeed = 16
local defaultJumpPower = 50
local defaultMaxZoom = 400
local defaultGravity = 196.2
local xrayTransparency = 0.8
local defaultFieldOfView = camera.FieldOfView

local character, humanoid, rootpart

local function getCharacter()
	character = player.Character or player.CharacterAdded:Wait()
	humanoid = character:WaitForChild("Humanoid", 5)
	rootpart = character:WaitForChild("HumanoidRootPart", 5)
	defaultWalkSpeed = humanoid.WalkSpeed
	defaultJumpPower = humanoid.JumpPower
	defaultMaxZoom = player.CameraMaxZoomDistance
	defaultGravity = Workspace.Gravity
end

getCharacter()
player.CharacterAdded:Connect(getCharacter)

local FlyGroupBox = Tabs.Main:AddRightGroupbox("Fly", "plane")

local flySpeed = 5
local flying = false
local bodyVelocity, bodyGyro, flyConnection

local function startFlying()
	if not humanoid or not rootpart then return end
	humanoid.PlatformStand = true
	bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.MaxForce = Vector3.new(1e6,1e6,1e6)
	bodyVelocity.Velocity = Vector3.zero
	bodyVelocity.Parent = rootpart
	bodyGyro = Instance.new("BodyGyro")
	bodyGyro.MaxTorque = Vector3.new(1e6,1e6,1e6)
	bodyGyro.P = 10000
	bodyGyro.D = 500
	bodyGyro.Parent = rootpart
	flyConnection = RunService.Heartbeat:Connect(function()
		if not humanoid or not rootpart then return end
		local cm = require(player.PlayerScripts:WaitForChild("PlayerModule",5):WaitForChild("ControlModule",5))
		if not cm then return end
		local mv = cm:GetMoveVector()
		local dir = camera.CFrame:VectorToWorldSpace(mv)
		bodyVelocity.Velocity = dir * (flySpeed*10)
		bodyGyro.CFrame = camera.CFrame
	end)
end

local function stopFlying()
	if humanoid then humanoid.PlatformStand = false end
	if bodyVelocity then bodyVelocity:Destroy() end
	if bodyGyro then bodyGyro:Destroy() end
	if flyConnection then flyConnection:Disconnect() end
	bodyVelocity, bodyGyro, flyConnection = nil,nil,nil
end

FlyGroupBox:AddToggle("Fly", {Text="Fly", Default=false, Callback=function(v)
	flying = v
	if v then startFlying() else stopFlying() end
end})

Toggles.Fly:AddKeyPicker("FlyKeybind", {Default="F", Mode="Toggle", Text="Fly", SyncToggleState=true})

FlyGroupBox:AddSlider("FlySpeed", {Text="Fly Speed", Default=5, Min=1, Max=75, Rounding=0, Callback=function(v) flySpeed = v end})

player.CharacterAdded:Connect(function(c)
	character = c
	humanoid = c:WaitForChild("Humanoid")
	rootpart = c:WaitForChild("HumanoidRootPart")
	if flying then startFlying() end
end)

local LeftMain = Tabs.Main:AddLeftGroupbox("Character", "user")

LeftMain:AddSlider("Walkspeed", {Text="Walkspeed", Default=defaultWalkSpeed, Min=1, Max=500, Rounding=0})
LeftMain:AddSlider("Jumppower", {Text="Jumppower", Default=defaultJumpPower, Min=1, Max=1000, Rounding=0})
LeftMain:AddSlider("MaxZoom", {Text="Max Zoom", Default=defaultMaxZoom, Min=1, Max=1000, Rounding=0})
LeftMain:AddSlider("Gravity", {Text="Gravity", Default=defaultGravity, Min=0, Max=500, Rounding=1})

LeftMain:AddDivider()

LeftMain:AddToggle("InfiniteJump", {Text="Infinite Jump", Default=false})

Toggles.InfiniteJump:AddKeyPicker("InfiniteJumpKeybind", {Default="I", Mode="Toggle", Text="Infinite Jump", SyncToggleState=true})

LeftMain:AddToggle("Noclip", {Text="Noclip", Default=false})

Toggles.Noclip:AddKeyPicker("NoclipKeybind", {Default="N", Mode="Toggle", Text="Noclip", SyncToggleState=true})

LeftMain:AddToggle("ForceThirdPerson", {Text="Force Third Person", Default=false})

LeftMain:AddDivider()

LeftMain:AddToggle("CounterFling", {Text="Counter Fling", Default=false, Callback=function(v)
    if v then
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                for _, part in ipairs(otherPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
        
        Players.PlayerAdded:Connect(function(newPlayer)
            if newPlayer.Character then
                for _, part in ipairs(newPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
            newPlayer.CharacterAdded:Connect(function(char)
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
        end)
    else
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                for _, part in ipairs(otherPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
end})

LeftMain:AddToggle("CounterVoid", {Text="Counter Void", Default=false, Callback=function(v)
    if v then
        getgenv().VoidConnection = RunService.Heartbeat:Connect(function()
            if character and rootpart then
                local voidThreshold = workspace.FallenPartsDestroyHeight or -500
                if rootpart.Position.Y < voidThreshold + 10 then
                    rootpart.Velocity = Vector3.new(rootpart.Velocity.X, 100, rootpart.Velocity.Z)
                end
            end
        end)
    else
        if getgenv().VoidConnection then
            getgenv().VoidConnection:Disconnect()
            getgenv().VoidConnection = nil
        end
    end
end})

LeftMain:AddToggle("NoAFKKick", {Text="No AFK Kick", Default=false, Callback=function(v)
    if v then
        getgenv().AFKConnection = RunService.Heartbeat:Connect(function()
            if player then
                local VirtualInputManager = game:GetService("VirtualInputManager")
                VirtualInputManager:SendMouseMoveEvent(10, 10, game)
                task.wait(1)
                VirtualInputManager:SendMouseMoveEvent(20, 20, game)
            end
        end)
        
        if player then
            local playerScripts = player:FindFirstChild("PlayerScripts")
            if playerScripts then
                local playerModule = playerScripts:FindFirstChild("PlayerModule")
                if playerModule then
                    local controlModule = playerModule:FindFirstChild("ControlModule")
                    if controlModule then
                        getgenv().OriginalControlModule = controlModule:Clone()
                    end
                end
            end
        end
    else
        if getgenv().AFKConnection then
            getgenv().AFKConnection:Disconnect()
            getgenv().AFKConnection = nil
        end
        
        if getgenv().OriginalControlModule and player then
            local playerScripts = player:FindFirstChild("PlayerScripts")
            if playerScripts then
                local playerModule = playerScripts:FindFirstChild("PlayerModule")
                if playerModule then
                    local controlModule = playerModule:FindFirstChild("ControlModule")
                    if controlModule then
                        controlModule:Destroy()
                        getgenv().OriginalControlModule.Parent = playerModule
                    end
                end
            end
            getgenv().OriginalControlModule = nil
        end
    end
end})

LeftMain:AddDivider()

local originalTransparencies = {}
local xrayEnabled = false

LeftMain:AddToggle("XRay", {Text="X-Ray", Default=false, Callback=function(v)
	xrayEnabled = v
	if v then
		originalTransparencies = {}
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:IsA("BasePart") and obj.Parent ~= character then
				originalTransparencies[obj] = obj.Transparency
				obj.Transparency = xrayTransparency
			end
		end
	else
		for obj, originalTransparency in pairs(originalTransparencies) do
			if obj and obj:IsA("BasePart") then
				obj.Transparency = originalTransparency
			end
		end
		originalTransparencies = {}
	end
end})

LeftMain:AddSlider("XRayTransparency", {Text="X-Ray Transparency (%)", Default=80, Min=0, Max=100, Rounding=0, Suffix="%", Callback=function(v)
	xrayTransparency = v/100
	if xrayEnabled then
		for obj, _ in pairs(originalTransparencies) do
			if obj and obj:IsA("BasePart") then
				obj.Transparency = xrayTransparency
			end
		end
	end
end})

local RightMain = Tabs.Main:AddRightGroupbox("Misc", "box")

RightMain:AddButton({Text="Reset Character", Func=function()
	if character then
		character:BreakJoints()
	end
end})

RightMain:AddDivider()

RightMain:AddButton({Text="Reset Walk Speed", Func=function() Options.Walkspeed:SetValue(defaultWalkSpeed) end})
RightMain:AddButton({Text="Reset Jump Power", Func=function() Options.Jumppower:SetValue(defaultJumpPower) end})
RightMain:AddButton({Text="Reset Max Zoom", Func=function() Options.MaxZoom:SetValue(defaultMaxZoom) end})
RightMain:AddButton({Text="Reset Gravity", Func=function() Options.Gravity:SetValue(defaultGravity) end})

local ESPTabBox = Tabs.Visuals:AddLeftTabbox()
local ESPTab = ESPTabBox:AddTab("ESP")
local ESPConfigTab = ESPTabBox:AddTab("Config")
local GameVisuals = Tabs.Visuals:AddRightGroupbox("Game", "camera")

local espColor = Color3.new(1,1,1)
local outlineColor = Color3.new(1,1,1)
local tracersColor = Color3.new(1,1,1)
local outlineFillTransparency = 1
local outlineTransparency = 0
local espSize = 16
local espFont = 1
local showDistance = true
local showPlayerName = true
local rainbowSpeed = 5
local tracerOrigin = "Down"

local highlights = {}
local drawings = {}

local function addPlayer(plr)
	if plr == player then return end
	local function onChar(c)
		if drawings[plr] then drawings[plr].espText:Remove() drawings[plr].tracer:Remove() drawings[plr] = nil end
		if highlights[plr] then highlights[plr]:Destroy() highlights[plr] = nil end
		local hl = Instance.new("Highlight")
		hl.Adornee = c
		hl.Parent = c
		hl.Enabled = false
		highlights[plr] = hl
		local t = Drawing.new("Text")
		t.Visible = false t.Center = true t.Outline = true t.Font = espFont t.Size = espSize t.Color = espColor
		local l = Drawing.new("Line")
		l.Visible = false l.Color = tracersColor l.Thickness = 1
		drawings[plr] = {espText=t, tracer=l}
	end
	if plr.Character then onChar(plr.Character) end
	plr.CharacterAdded:Connect(onChar)
end

for _,p in Players:GetPlayers() do addPlayer(p) end
Players.PlayerAdded:Connect(addPlayer)
Players.PlayerRemoving:Connect(function(plr)
	if highlights[plr] then highlights[plr]:Destroy() highlights[plr] = nil end
	if drawings[plr] then drawings[plr].espText:Remove() drawings[plr].tracer:Remove() drawings[plr] = nil end
end)

local mousePos = Vector2.new()
UserInputService.InputChanged:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseMovement then mousePos = Vector2.new(i.Position.X,i.Position.Y) end
end)

RunService.RenderStepped:Connect(function()
	for plr, hl in pairs(highlights) do
		local char = plr.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChild("Humanoid")
		if not char or not hrp or not hum or hum.Health <= 0 then
			hl.Enabled = false
			if drawings[plr] then drawings[plr].espText.Visible = false drawings[plr].tracer.Visible = false end
			continue
		end
		local head = char:FindFirstChild("Head") or hrp
		local headPos = head.Position + Vector3.new(0,2,0)
		local pos3d, onScreen = camera:WorldToViewportPoint(headPos)
		local pos = Vector2.new(pos3d.X, pos3d.Y)
		if not onScreen then
			hl.Enabled = false
			if drawings[plr] then drawings[plr].espText.Visible = false drawings[plr].tracer.Visible = false end
			continue
		end
		if Toggles.Outline and Toggles.Outline.Value then
			hl.Enabled = true
			local c = outlineColor
			if Toggles.OutlineColorFromTeam and Toggles.OutlineColorFromTeam.Value and plr.Team then c = plr.TeamColor.Color end
			if Toggles.RainbowOutline and Toggles.RainbowOutline.Value then c = Color3.fromHSV(tick()*(rainbowSpeed/50)%1,1,1) end
			hl.OutlineColor = c hl.FillColor = c hl.OutlineTransparency = outlineTransparency hl.FillTransparency = outlineFillTransparency
		else
			hl.Enabled = false
		end
		if Toggles.ESP and Toggles.ESP.Value and drawings[plr] then
			local d = drawings[plr].espText
			d.Visible = true
			local c = espColor
			if Toggles.ESPColorFromTeam and Toggles.ESPColorFromTeam.Value and plr.Team then c = plr.TeamColor.Color end
			if Toggles.RainbowESP and Toggles.RainbowESP.Value then c = Color3.fromHSV(tick()*(rainbowSpeed/50)%1,1,1) end
			d.Color = c d.Size = espSize d.Font = espFont d.Position = pos
			local txt = showPlayerName and plr.Name or ""
			if showDistance and rootpart then
				local dist = (rootpart.Position - hrp.Position).Magnitude
				txt = txt .. (txt~="" and " " or "") .. "["..math.floor(dist).." STUDS]"
			end
			d.Text = txt ~= "" and txt or plr.Name
		elseif drawings[plr] then drawings[plr].espText.Visible = false end
		if Toggles.Tracers and Toggles.Tracers.Value and drawings[plr] then
			local t = drawings[plr].tracer
			t.Visible = true
			local c = tracersColor
			if Toggles.TracersColorFromTeam and Toggles.TracersColorFromTeam.Value and plr.Team then c = plr.TeamColor.Color end
			if Toggles.RainbowTracers and Toggles.RainbowTracers.Value then c = Color3.fromHSV(tick()*(rainbowSpeed/50)%1,1,1) end
			t.Color = c
			if tracerOrigin == "Mouse" then t.From = mousePos
			elseif tracerOrigin == "Upper" then t.From = Vector2.new(camera.ViewportSize.X/2,0)
			elseif tracerOrigin == "Middle" then t.From = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y/2)
			else t.From = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y) end
			t.To = pos
		elseif drawings[plr] then drawings[plr].tracer.Visible = false end
	end
end)

ESPTab:AddToggle("ESP", {Text="ESP", Default=false}):AddColorPicker("ESPColor", {Default=Color3.new(1,1,1), Title="ESP Color", Callback=function(v) espColor = v end})

ESPTab:AddToggle("Outline", {Text="Outline", Default=false}):AddColorPicker("OutlineColor", {Default=Color3.new(1,1,1), Title="Outline Color", Callback=function(v) outlineColor = v end})

ESPTab:AddToggle("Tracers", {Text="Tracers", Default=false}):AddColorPicker("TracersColor", {Default=Color3.new(1,1,1), Title="Tracers Color", Callback=function(v) tracersColor = v end})

ESPConfigTab:AddToggle("RainbowESP", {Text="Rainbow ESP", Default=false})
ESPConfigTab:AddToggle("RainbowOutline", {Text="Rainbow Outline", Default=false})
ESPConfigTab:AddToggle("RainbowTracers", {Text="Rainbow Tracers", Default=false})
ESPConfigTab:AddSlider("RainbowSpeed", {Text="Rainbow Speed", Min=0, Max=10, Default=5, Rounding=1, Callback=function(v) rainbowSpeed = v end})
ESPConfigTab:AddSlider("ESPSize", {Text="ESP Size", Min=16, Max=50, Default=16, Rounding=0, Callback=function(v) espSize = v end})
ESPConfigTab:AddDropdown("ESPFont", {Text="ESP Font", Values={"UI","System","Plex","Monospace"}, Default=1, Callback=function(v) espFont = ({UI=0,System=1,Plex=2,Monospace=3})[v] or 1 end})
ESPConfigTab:AddToggle("ShowDistance", {Text="Show Distance", Default=true, Callback=function(v) showDistance = v end})
ESPConfigTab:AddToggle("ShowPlayerName", {Text="Show Player Name", Default=true, Callback=function(v) showPlayerName = v end})
ESPConfigTab:AddSlider("OutlineFillTransparency", {Text="Outline Fill Transparency (%)", Min=0, Max=100, Default=100, Suffix="%", Rounding=0, Callback=function(v) outlineFillTransparency = v/100 end})
ESPConfigTab:AddSlider("OutlineTransparency", {Text="Outline Transparency (%)", Min=0, Max=100, Default=0, Suffix="%", Rounding=0, Callback=function(v) outlineTransparency = v/100 end})
ESPConfigTab:AddDropdown("TracersPosition", {Text="Tracers Position", Values={"Mouse","Upper","Middle","Down"}, Default="Down", Callback=function(v) tracerOrigin = v end})
ESPConfigTab:AddToggle("ESPColorFromTeam", {Text="ESP Color From Team", Default=false})
ESPConfigTab:AddToggle("OutlineColorFromTeam", {Text="Outline Color From Team", Default=false})
ESPConfigTab:AddToggle("TracersColorFromTeam", {Text="Tracers Color From Team", Default=false})

local originalLighting = {}
local originalAtmospheres = {}

GameVisuals:AddSlider("FieldOfView", {Text="Field Of View", Default=defaultFieldOfView, Min=60, Max=120, Rounding=0})
GameVisuals:AddToggle("FullBright", {Text="Full Bright", Default=false, Callback=function(v)
	if v then
		originalLighting.Brightness = Lighting.Brightness
		originalLighting.Ambient = Lighting.Ambient
		originalLighting.OutdoorAmbient = Lighting.OutdoorAmbient
		originalLighting.ClockTime = Lighting.ClockTime
		originalLighting.FogEnd = Lighting.FogEnd
		originalLighting.FogStart = Lighting.FogStart
		originalLighting.FogColor = Lighting.FogColor
		
		Lighting.Brightness = 2
		Lighting.Ambient = Color3.fromRGB(255,255,255)
		Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
		Lighting.ClockTime = 12
		Lighting.FogEnd = 100000
		Lighting.FogStart = 0
		Lighting.FogColor = Color3.fromRGB(255,255,255)
	else
		if originalLighting.Brightness then
			Lighting.Brightness = originalLighting.Brightness
			Lighting.Ambient = originalLighting.Ambient
			Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
			Lighting.ClockTime = originalLighting.ClockTime
			Lighting.FogEnd = originalLighting.FogEnd
			Lighting.FogStart = originalLighting.FogStart
			Lighting.FogColor = originalLighting.FogColor
		end
	end
end})
GameVisuals:AddToggle("NoFog", {Text="No Fog", Default=false, Callback=function(v)
	if v then
		originalLighting.FogEnd = Lighting.FogEnd
		originalAtmospheres = {}
		
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:IsA("Atmosphere") then
				originalAtmospheres[obj] = obj.Density
				obj.Density = 0
			end
		end
		Lighting.FogEnd = 100000000
	else
		if originalLighting.FogEnd then
			Lighting.FogEnd = originalLighting.FogEnd
		end
		for atmosphere, originalDensity in pairs(originalAtmospheres) do
			if atmosphere and atmosphere:IsA("Atmosphere") then
				atmosphere.Density = originalDensity
			end
		end
		originalAtmospheres = {}
	end
end})

local AimlockTabbox = Tabs.Features:AddLeftTabbox("Aimlock", "target")
local AimlockTab = AimlockTabbox:AddTab("Aimlock")
local AimlockConfigTab = AimlockTabbox:AddTab("Configuration")

AimlockTab:AddToggle("EnableAimlock", { Text = "Enable Aimlock", Default = false })
AimlockTab:AddDropdown("AimlockType", { Values = { "Nearest Character", "Nearest Mouse" }, Default = 1, Text = "Aimlock Type" })
AimlockTab:AddDivider()
AimlockTab:AddToggle("WallCheck", { Text = "Wall Check", Default = true })
AimlockTab:AddToggle("TeamCheck", { Text = "Team Check", Default = true })
AimlockTab:AddDivider()
AimlockTab:AddDropdown("AimlockCertainPlayer", { 
    SpecialType = "Player", 
    ExcludeLocalPlayer = true, 
    Multi = false,
    Searchable = true,
    Text = "Aimlock Certain Player" 
})
AimlockTab:AddDivider()
AimlockTab:AddToggle("EnableFOV", { Text = "Enable FOV", Default = false })
AimlockTab:AddToggle("ShowFOV", { Text = "Show FOV", Default = false })
AimlockTab:AddLabel("FOV Color"):AddColorPicker("FOVColor", { 
    Default = Color3.fromRGB(255, 255, 255), 
    Title = "FOV Color", 
    Transparency = 1
})
AimlockTab:AddDropdown("FOVType", { Values = { "Centered", "Mouse" }, Default = 1, Text = "FOV Type" })

AimlockConfigTab:AddSlider("AimlockMaxDist", { Text = "Aimlock Max Dist", Default = 5000, Min = 1, Max = 10000, Rounding = 0 })
AimlockConfigTab:AddSlider("MouseMaxDist", { Text = "Mouse Max Dist", Default = 5000, Min = 1, Max = 10000, Rounding = 0 })
AimlockConfigTab:AddSlider("FOVMaxDist", { Text = "FOV Max Dist", Default = 5000, Min = 1, Max = 10000, Rounding = 0 })
AimlockConfigTab:AddDivider()
AimlockConfigTab:AddToggle("SmoothAimlock", { Text = "Smooth Aimlock", Default = false })
AimlockConfigTab:AddSlider("AimbotSmoothness", { Text = "Aimbot Smoothness", Default = 25, Min = 1, Max = 100, Rounding = 0 })
AimlockConfigTab:AddDivider()
AimlockConfigTab:AddSlider("FOVSize", { Text = "FOV Size", Default = 150, Min = 1, Max = 750, Rounding = 0 })
AimlockConfigTab:AddSlider("FOVStrokeThickness", { Text = "FOV Stroke Thickness", Default = 2.5, Min = 1, Max = 10, Rounding = 1 })
AimlockConfigTab:AddToggle("RainbowFOV", { Text = "Rainbow FOV", Default = false })
AimlockConfigTab:AddSlider("RainbowFOVSpeed", { Text = "Rainbow FOV Speed", Default = 2, Min = 1, Max = 10, Rounding = 0 })
AimlockConfigTab:AddDivider()
AimlockConfigTab:AddDropdown("WhitelistPlayers", { 
    SpecialType = "Player", 
    ExcludeLocalPlayer = true, 
    Multi = true,
    Searchable = true,
    Text = "Whitelist Players" 
})
AimlockConfigTab:AddDropdown("PrioritizePlayers", { 
    SpecialType = "Player", 
    ExcludeLocalPlayer = true, 
    Multi = true,
    Searchable = true,
    Text = "Prioritize Players" 
})
AimlockConfigTab:AddDivider()
AimlockConfigTab:AddSlider("AimlockOffsetY", { Text = "Aimlock Offset (Y)", Default = 0, Min = -1, Max = 1, Rounding = 2 })
AimlockConfigTab:AddSlider("AimlockOffsetX", { Text = "Aimlock Offset (X)", Default = 0, Min = -1, Max = 1, Rounding = 2 })

local FlingGroupBox = Tabs.Features:AddLeftGroupbox("Fling", "wind")

local flingTime = 5
local flingForce = 50000

local function getPlayerList()
	local list = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player then table.insert(list, p.Name) end
	end
	return list
end

FlingGroupBox:AddDropdown("FlingPlayer", {
	Text = "Select Players",
	Values = getPlayerList(),
	Multi = true,
	Searchable = true,
	Callback = function(v) end
})

local function fling(TargetPlayer, duration)
	local startTime = tick()
	local Character = player.Character
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
	local RootPart = Humanoid and Humanoid.RootPart

	local TCharacter = TargetPlayer.Character
	local THumanoid
	local TRootPart
	local THead
	local Accessory
	local Handle

	if TCharacter:FindFirstChildOfClass("Humanoid") then
		THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
	end
	if THumanoid and THumanoid.RootPart then
		TRootPart = THumanoid.RootPart
	end
	if TCharacter:FindFirstChild("Head") then
		THead = TCharacter.Head
	end
	if TCharacter:FindFirstChildOfClass("Accessory") then
		Accessory = TCharacter:FindFirstChildOfClass("Accessory")
	end
	if Accessory and Accessory:FindFirstChild("Handle") then
		Handle = Accessory.Handle
	end

	if Character and Humanoid and RootPart then
		if RootPart.Velocity.Magnitude < 50 then
			getgenv().OldPos = RootPart.CFrame
		end
		if THead then
			workspace.CurrentCamera.CameraSubject = THead
		elseif not THead and Handle then
			workspace.CurrentCamera.CameraSubject = Handle
		elseif THumanoid and TRootPart then
			workspace.CurrentCamera.CameraSubject = THumanoid
		end
		if not TCharacter:FindFirstChildWhichIsA("BasePart") then
			return
		end
		
		local FPos = function(BasePart, Pos, Ang)
			RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
			Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
			RootPart.Velocity = Vector3.new(flingForce, flingForce * 10, flingForce)
			RootPart.RotVelocity = Vector3.new(flingForce * 20, flingForce * 20, flingForce * 20)
		end
		
		local SFBasePart = function(BasePart)
			local TimeToWait = duration or 2
			local Time = tick()
			local Angle = 0

			repeat
				if RootPart and THumanoid then
					if BasePart.Velocity.Magnitude < 50 then
						Angle = Angle + 100

						FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()
					else
						FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						
						FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()
					end
				else
					break
				end
			until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or tick() > Time + TimeToWait
		end
		
		local previousDestroyHeight = workspace.FallenPartsDestroyHeight
		workspace.FallenPartsDestroyHeight = 0/0
		
		local BV = Instance.new("BodyVelocity")
		BV.Name = "EpixVel"
		BV.Parent = RootPart
		BV.Velocity = Vector3.new(flingForce, flingForce, flingForce)
		BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
		
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
		
		if TRootPart and THead then
			if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
				SFBasePart(THead)
			else
				SFBasePart(TRootPart)
			end
		elseif TRootPart and not THead then
			SFBasePart(TRootPart)
		elseif not TRootPart and THead then
			SFBasePart(THead)
		elseif not TRootPart and not THead and Accessory and Handle then
			SFBasePart(Handle)
		end
		
		BV:Destroy()
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		workspace.CurrentCamera.CameraSubject = Humanoid
		
		repeat
			if Character and Humanoid and RootPart and getgenv().OldPos then
				RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
				Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
				Humanoid:ChangeState("GettingUp")
				table.foreach(Character:GetChildren(), function(_, x)
					if x:IsA("BasePart") then
						x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
					end
				end)
			end
			task.wait()
		until RootPart and getgenv().OldPos and (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
		workspace.FallenPartsDestroyHeight = previousDestroyHeight
	end
end

FlingGroupBox:AddButton({Text="Fling Selected", Func=function()
	if not Options.FlingPlayer.Value then return end
	
	for selectedPlayer, isSelected in pairs(Options.FlingPlayer.Value) do
		if isSelected then
			local targetPlayer = Players:FindFirstChild(tostring(selectedPlayer))
			if targetPlayer and targetPlayer.Character then
				fling(targetPlayer, flingTime)
				task.wait(flingTime + 0.5)
			end
		end
	end
end})

FlingGroupBox:AddButton({Text="Fling All", Func=function()
	for _, targetPlayer in ipairs(Players:GetPlayers()) do
		if targetPlayer ~= player and targetPlayer.Character then
			fling(targetPlayer, flingTime)
			task.wait(flingTime + 0.5)
		end
	end
end})

FlingGroupBox:AddDivider()

FlingGroupBox:AddSlider("FlingTime", {Text="Fling Time", Default=5, Min=1, Max=25, Rounding=1, Callback=function(v) flingTime = v end})
FlingGroupBox:AddSlider("FlingForce", {Text="Fling Force", Default=50000, Min=1, Max=9999999, Rounding=0, Callback=function(v) flingForce = v end})

local TeleportGroupBox = Tabs.Features:AddLeftGroupbox("Teleport", "map-pin")
local SpectateGroupBox = Tabs.Features:AddLeftGroupbox("Spectate", "eye")

local teleportPlayer = nil
local teleportType = "Instant (TP)"

TeleportGroupBox:AddDropdown("TeleportPlayer", {
	Text = "Select Player",
	Values = getPlayerList(),
	Callback = function(v) teleportPlayer = Players:FindFirstChild(v) end
})

local noclipDuringTween = false
TeleportGroupBox:AddButton({Text="Teleport To Player", Func=function()
	if not teleportPlayer or not teleportPlayer.Character or not teleportPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return
	end
	local target = teleportPlayer.Character.HumanoidRootPart
	local wasNoclip = Toggles.Noclip.Value
	if teleportType == "Tween (Fast)" and Toggles.NoclipOnTween.Value then
		Toggles.Noclip:SetValue(true)
		noclipDuringTween = true
	end
	if teleportType == "Instant (TP)" then
		if rootpart then rootpart.CFrame = target.CFrame end
	else
		if rootpart then
			local dist = (rootpart.Position - target.Position).Magnitude
			local tween = TweenService:Create(rootpart, TweenInfo.new(dist/500, Enum.EasingStyle.Linear), {CFrame = target.CFrame})
			tween:Play()
			tween.Completed:Wait()
			if Toggles.NoclipOnTween.Value and not wasNoclip then
				Toggles.Noclip:SetValue(false)
				noclipDuringTween = false
			end
		end
	end
end})

TeleportGroupBox:AddDropdown("TeleportType", {Text="Teleport Type", Values={"Instant (TP)","Tween (Fast)"}, Default="Instant (TP)", Callback=function(v) teleportType = v end})
TeleportGroupBox:AddToggle("NoclipOnTween", {Text="Noclip During Tween", Default=false})

local spectatePlayer = nil
local spectateType = "Third Person"

local function updateSpectate()
	if Toggles.SpectatePlayer.Value and spectatePlayer and spectatePlayer.Character then
		local humanoid = spectatePlayer.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			if spectateType == "First Person" then
				player.CameraMode = Enum.CameraMode.LockFirstPerson
				player.CameraMaxZoomDistance = 0
				camera.CameraSubject = humanoid
				camera.CameraType = Enum.CameraType.Custom
			else
				player.CameraMode = Enum.CameraMode.Classic
				player.CameraMaxZoomDistance = defaultMaxZoom
				camera.CameraSubject = humanoid
				camera.CameraType = Enum.CameraType.Follow
			end
		end
	else
		if character and humanoid then
			player.CameraMode = Enum.CameraMode.Classic
			player.CameraMaxZoomDistance = defaultMaxZoom
			camera.CameraSubject = humanoid
			camera.CameraType = Enum.CameraType.Custom
		end
	end
end

SpectateGroupBox:AddToggle("SpectatePlayer", {Text="Spectate Player", Default=false, Callback=function(v)
	updateSpectate()
end})

SpectateGroupBox:AddDropdown("PlayerToSpectate", {
	Text = "Player To Spectate",
	Values = getPlayerList(),
	Searchable = true,
	Callback = function(v) 
		spectatePlayer = Players:FindFirstChild(v)
		if Toggles.SpectatePlayer.Value then
			updateSpectate()
		end
	end
})

SpectateGroupBox:AddDropdown("SpectateType", {
	Text = "Type",
	Values = {"First Person", "Third Person"},
	Default = "Third Person",
	Callback = function(v) 
		spectateType = v
		if Toggles.SpectatePlayer.Value then
			updateSpectate()
		end
	end
})

local FPSGroupBox = Tabs.Features:AddRightGroupbox("FPS", "activity")

local fpsValue = 60
FPSGroupBox:AddSlider("FPSMeter", {Text="FPS Cap", Default=60, Min=1, Max=720, Rounding=0, Callback=function(v) fpsValue = v end})
FPSGroupBox:AddButton({Text="Apply FPS Cap", Func=function() setfpscap(fpsValue) end})

local ServerGroupBox = Tabs.Features:AddRightGroupbox("Server", "server")

ServerGroupBox:AddButton({Text = "Copy Server JobID", Func = function()
	setclipboard(game.JobId)
end})

ServerGroupBox:AddButton({Text = "Copy Server Join Link", Func = function()
	local link = string.format("roblox://placeId=%d&gameInstanceId=%s", game.PlaceId, game.JobId)
	setclipboard(link)
end})

ServerGroupBox:AddDivider()

local targetJobId = ""
ServerGroupBox:AddInput("TargetJobId", {
	Text = "Target Server JobID",
	Placeholder = "Enter JobId...",
	Callback = function(v) targetJobId = v:gsub("%s+", "") end
})

ServerGroupBox:AddButton({Text = "Join Server", Func = function()
	if targetJobId == "" or not targetJobId:match("^%w+%-") then
		return
	end
	TeleportService:TeleportToPlaceInstance(game.PlaceId, targetJobId, player)
end})

ServerGroupBox:AddDivider()

ServerGroupBox:AddButton({Text = "Rejoin Server", Func = function()
	if game.JobId == "" then return end
	TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
end})

ServerGroupBox:AddLabel("Rejoin Keybind"):AddKeyPicker("RejoinKeybind", {Default="R", Mode="Press", Text="Rejoin Server", Callback=function()
	if game.JobId == "" then return end
	TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
end})

ServerGroupBox:AddButton({Text = "Quit Game", Func = function() game:Shutdown() end, Risky=true})

local AutoChatGroupBox = Tabs.Features:AddRightGroupbox("Auto-Chat", "message-square")

local autoChatEnabled = false
local autoChatDelay = 1
local autoChatMessage = "hi!"
local autoChatType = "Infinite"
local autoChatLimit = 10

AutoChatGroupBox:AddToggle("AutoChat", {Text="Auto Chat", Default=false, Callback=function(v) autoChatEnabled = v end})
AutoChatGroupBox:AddSlider("AutoChatDelay", {Text="Auto Chat Delay", Default=1, Min=0, Max=5, Rounding=2, Callback=function(v) autoChatDelay = v end})
AutoChatGroupBox:AddInput("AutoChatMessage", {Text="Auto Chat Message", Default="hi!", Callback=function(v) autoChatMessage = v end})
AutoChatGroupBox:AddDropdown("AutoChatType", {Text="Auto Chat Type", Values={"Infinite", "Times", "Seconds"}, Default="Infinite", Callback=function(v) autoChatType = v end})
AutoChatGroupBox:AddInput("AutoChatLimit", {Text="Times / Seconds", Default="10", Callback=function(v) autoChatLimit = tonumber(v) or 10 end})

local chatChannel = TextChatService.TextChannels:WaitForChild("RBXGeneral")

spawn(function()
	while task.wait(autoChatDelay) do
		if not autoChatEnabled then continue end
		if autoChatMessage == "" then continue end

		if autoChatType == "Infinite" then
			chatChannel:SendAsync(autoChatMessage)
		elseif autoChatType == "Times" then
			if autoChatLimit > 0 then
				chatChannel:SendAsync(autoChatMessage)
				autoChatLimit -= 1
			else
				Toggles.AutoChat:SetValue(false)
			end
		elseif autoChatType == "Seconds" then
			local start = tick()
			repeat
				chatChannel:SendAsync(autoChatMessage)
				task.wait(autoChatDelay)
			until tick() - start >= autoChatLimit or not autoChatEnabled
			Toggles.AutoChat:SetValue(false)
		end
	end
end)

local CoreGui = game:GetService("CoreGui")

local FOVGui = Instance.new("ScreenGui")
FOVGui.Name = "UNX_FOV_Circle"
FOVGui.ResetOnSpawn = false
FOVGui.IgnoreGuiInset = true
FOVGui.DisplayOrder = 999999999
FOVGui.Parent = CoreGui

local FOVFrame = Instance.new("Frame")
FOVFrame.Name = "Circle"
FOVFrame.AnchorPoint = Vector2.new(0.5, 0.5)
FOVFrame.BackgroundTransparency = 1
FOVFrame.BorderSizePixel = 0
FOVFrame.Size = UDim2.new(0, 200, 0, 200)
FOVFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
FOVFrame.Parent = FOVGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = FOVFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2.5
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Transparency = 1
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = FOVFrame

local rainbowClock = 0
local function UpdateRainbowFOV()
    if Toggles.RainbowFOV.Value then
        rainbowClock = rainbowClock + (Options.RainbowFOVSpeed.Value / 100)
        local r = math.sin(rainbowClock) * 0.5 + 0.5
        local g = math.sin(rainbowClock + 2) * 0.5 + 0.5
        local b = math.sin(rainbowClock + 4) * 0.5 + 0.5
        UIStroke.Color = Color3.new(r, g, b)
    else
        UIStroke.Color = Options.FOVColor.Value
    end
end

local function UpdateFOV()
    if Toggles.ShowFOV.Value then
        local radius = Options.FOVSize.Value
        FOVFrame.Size = UDim2.new(0, radius * 2, 0, radius * 2)
        UIStroke.Transparency = Options.FOVColor.Transparency
        UIStroke.Thickness = Options.FOVStrokeThickness.Value

        if Options.FOVType.Value == "Centered" then
            FOVFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        else
            local mousePos = UserInputService:GetMouseLocation()
            FOVFrame.Position = UDim2.new(0, mousePos.X, 0, mousePos.Y)
        end

        UpdateRainbowFOV()
        FOVGui.Enabled = true
    else
        FOVGui.Enabled = false
    end
end

local function IsValidTarget(plr)
    if not plr or plr == player then return false end
    if not plr.Character or not plr.Character:FindFirstChild("Head") or not plr.Character:FindFirstChild("Humanoid") then return false end
    if plr.Character.Humanoid.Health <= 0 then return false end
    if Toggles.TeamCheck.Value and plr.Team == player.Team then return false end
    
    if Options.WhitelistPlayers.Value then
        for whitelistedPlayer, isWhitelisted in pairs(Options.WhitelistPlayers.Value) do
            if isWhitelisted and plr.Name == tostring(whitelistedPlayer) then
                return false
            end
        end
    end
    
    return true
end

local function HasLineOfSight(targetHead)
    if not Toggles.WallCheck.Value then return true end
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {character}
    local result = Workspace:Raycast(camera.CFrame.Position, (targetHead.Position - camera.CFrame.Position).Unit * 500, raycastParams)
    return not result or result.Instance:IsDescendantOf(targetHead.Parent)
end

local function GetClosestPlayer()
    if Options.AimlockCertainPlayer.Value and Options.AimlockCertainPlayer.Value ~= "" then
        local certainPlayerValue = tostring(Options.AimlockCertainPlayer.Value)
        local certainPlayer = Players:FindFirstChild(certainPlayerValue)
        if certainPlayer and IsValidTarget(certainPlayer) then
            local head = certainPlayer.Character:FindFirstChild("Head")
            if head and HasLineOfSight(head) then
                local worldDist = (head.Position - camera.CFrame.Position).Magnitude
                local maxDist = Options.AimlockType.Value == "Nearest Mouse" and Options.MouseMaxDist.Value or Options.AimlockMaxDist.Value
                if worldDist <= maxDist then
                    return certainPlayer
                end
            end
        end
        return nil
    end

    local closest = nil
    local shortestDistance = math.huge
    local mousePos = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y + 36)
    local centerPos = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
    local checkPos = Options.AimlockType.Value == "Nearest Mouse" and mousePos or centerPos

    local prioritizedPlayers = {}
    local normalPlayers = {}

    for _, plr in Players:GetPlayers() do
        if IsValidTarget(plr) then
            local isPrioritized = false
            if Options.PrioritizePlayers.Value then
                for prioritizedPlayer, isPrio in pairs(Options.PrioritizePlayers.Value) do
                    if isPrio and plr.Name == tostring(prioritizedPlayer) then
                        isPrioritized = true
                        break
                    end
                end
            end
            
            if isPrioritized then
                table.insert(prioritizedPlayers, plr)
            else
                table.insert(normalPlayers, plr)
            end
        end
    end

    local function CheckPlayer(plr)
        local head = plr.Character:FindFirstChild("Head")
        if head then
            local screenPos, onScreen = camera:WorldToViewportPoint(head.Position)
            if onScreen then
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - checkPos).Magnitude
                local worldDist = (head.Position - camera.CFrame.Position).Magnitude
                local maxDist = Options.AimlockType.Value == "Nearest Mouse" and Options.MouseMaxDist.Value or Options.AimlockMaxDist.Value

                if worldDist <= maxDist and distance < shortestDistance then
                    if Toggles.EnableFOV.Value then
                        local fovCenter = Options.FOVType.Value == "Centered" and centerPos or mousePos
                        if (Vector2.new(screenPos.X, screenPos.Y) - fovCenter).Magnitude <= Options.FOVMaxDist.Value then
                            if HasLineOfSight(head) then
                                shortestDistance = distance
                                return plr
                            end
                        end
                    else
                        if HasLineOfSight(head) then
                            shortestDistance = distance
                            return plr
                        end
                    end
                end
            end
        end
        return nil
    end

    for _, plr in ipairs(prioritizedPlayers) do
        local result = CheckPlayer(plr)
        if result then
            closest = result
        end
    end

    if not closest then
        for _, plr in ipairs(normalPlayers) do
            local result = CheckPlayer(plr)
            if result then
                closest = result
            end
        end
    end

    return closest
end

RunService.RenderStepped:Connect(function()
    UpdateFOV()

    if Toggles.EnableAimlock.Value then
        local target = GetClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            local head = target.Character.Head
            local offset = Vector3.new(Options.AimlockOffsetX.Value * 10, Options.AimlockOffsetY.Value * 10, 0)
            local targetPos = head.Position + offset

            if Toggles.SmoothAimlock.Value then
                local smoothness = Options.AimbotSmoothness.Value / 100
                camera.CFrame = camera.CFrame:Lerp(CFrame.new(camera.CFrame.Position, targetPos), smoothness)
            else
                camera.CFrame = CFrame.new(camera.CFrame.Position, targetPos)
            end
        end
    end
end)

local noclipConnection
RunService.Stepped:Connect(function()
	if not character or not humanoid or not rootpart then return end

	if Toggles.Noclip.Value or noclipDuringTween then
		for _, part in ipairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end

	if Toggles.ForceThirdPerson and Toggles.ForceThirdPerson.Value then
		player.CameraMode = Enum.CameraMode.Classic
		player.CameraMinZoomDistance = 0.5
		player.CameraMaxZoomDistance = Options.MaxZoom.Value
	end

	humanoid.WalkSpeed = Options.Walkspeed.Value
	humanoid.JumpPower = Options.Jumppower.Value
	player.CameraMaxZoomDistance = Options.MaxZoom.Value
	Workspace.Gravity = Options.Gravity.Value
	camera.FieldOfView = Options.FieldOfView.Value
end)

Toggles.Noclip:OnChanged(function()
	if not Toggles.Noclip.Value and not noclipDuringTween and character then
		for _, part in ipairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = true
			end
		end
	end
end)

UserInputService.JumpRequest:Connect(function()
	if Toggles.InfiniteJump and Toggles.InfiniteJump.Value and humanoid then
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")
MenuGroup:AddToggle("KeybindMenuOpen", {Default=Library.KeybindFrame.Visible, Text="Open Keybind Menu", Callback=function(v) Library.KeybindFrame.Visible = v end})
MenuGroup:AddToggle("ShowCustomCursor", {Text="Custom Cursor", Default=true, Callback=function(v) Library.ShowCustomCursor = v end})
MenuGroup:AddDropdown("NotificationSide", {Values={"Left","Right"}, Default="Right", Text="Notification Side", Callback=function(v) Library:SetNotifySide(v) end})
MenuGroup:AddDropdown("DPIDropdown", {Values={"50%","75%","100%","125%","150%","175%","200%"}, Default="100%", Text="DPI Scale", Callback=function(v) Library:SetDPIScale(tonumber(v:gsub("%%",""))/100) end})
MenuGroup:AddDivider()
MenuGroup:AddButton("Unload", function()
	Library:Unload()
	TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
end)
MenuGroup:AddLabel("<font color='rgb(255,0,0)'><u>DISCLAIMER</u></font>: We Use This To See How Many Users We Get, <u>We Do Not Share This Information With Any Third Partys</u>.", true)
MenuGroup:AddCheckbox("OptOutLog", {
	Text = "Opt-Out Log",
	Default = isfile("optout.unx"),
	Callback = function(Value)
		if Value then
			writefile("optout.unx", "")
		else
			if isfile("optout.unx") then
				delfile("optout.unx")
			end
		end
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default="U", NoUI=true, Text="Menu keybind"})
Library.ToggleKeybind = Options.MenuKeybind

Library:OnUnload(function()
	TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({"MenuKeybind"})
ThemeManager:SetFolder("unxhub")
SaveManager:SetFolder("unxhub")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

spawn(function()
	while task.wait(0.1) do
		if Options.RainbowSpeed then rainbowSpeed = Options.RainbowSpeed.Value end
		if Options.ESPSize then espSize = Options.ESPSize.Value end
		if Options.ESPFont then espFont = ({UI=0,System=1,Plex=2,Monospace=3})[Options.ESPFont.Value] or 1 end
		if Options.ShowDistance then showDistance = Options.ShowDistance.Value end
		if Options.ShowPlayerName then showPlayerName = Options.ShowPlayerName.Value end
		if Options.OutlineFillTransparency then outlineFillTransparency = Options.OutlineFillTransparency.Value/100 end
		if Options.OutlineTransparency then outlineTransparency = Options.OutlineTransparency.Value/100 end
	end
end)

local function refreshPlayers()
	task.wait(1)
	if Options.TeleportPlayer then Options.TeleportPlayer:SetValues(getPlayerList()) end
	if Options.PlayerToSpectate then Options.PlayerToSpectate:SetValues(getPlayerList()) end
	if Options.FlingPlayer then Options.FlingPlayer:SetValues(getPlayerList()) end
end

Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)
refreshPlayers()
