-- now 2 games supported!

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({
    Title = "UNXHub",
    Footer = "Version: " .. (getgenv().unxshared and getgenv().unxshared.version or "Unknown") .. ", Game: " .. (getgenv().unxshared and getgenv().unxshared.gamename or "Unknown"),
    Icon = 123333102279908,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

Library:Notify({
	Title = "Welcome To UNXHub " .. game.Players.LocalPlayer.Name .. "!",
	Description = "Script loaded successfully",
	Time = 5,
})

local Tabs = {
	Main = Window:AddTab("Main", "user"),
	Visuals = Window:AddTab("Visuals", "eye"),
	Features = Window:AddTab("Features", "bug"),
	["Fun"] = Window:AddTab("Fun", "music"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local debugmode = isfile("debugtrue")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")
local TextChatService = game:GetService("TextChatService")
local SoundService = game:GetService("SoundService")

local originalwalkspeed = 16
local originaljumppower = 50
local originalgravity = workspace.Gravity
local originallighting = {}
local noclipenabled = false
local infinitejumpenabled = false
local antiflingenabled = false
local antiafkenabled = false
local antivoidenabled = false
local antikickenabled = false
local antillagenabled = false
local fullbrightenabled = false
local nofogenabled = false
local noaccelerationenabled = false
local antiflingconnections = {}
local antiafkconnection = nil
local antivoidconnection = nil
local antikickconnections = {}
local originaltextures = {}
local lastposition = nil
local originalsettings = {}

originallighting.Brightness = game.Lighting.Brightness
originallighting.Ambient = game.Lighting.Ambient
originallighting.OutdoorAmbient = game.Lighting.OutdoorAmbient
originallighting.FogEnd = game.Lighting.FogEnd
originallighting.FogStart = game.Lighting.FogStart

local espenabled = false
local outlineenabled = false
local tracersenabled = false
local skeletonenabled = false

local espconfig = {
	showname = true,
	showdistance = true,
	espcolor = Color3.fromRGB(255, 255, 255),
	outlinecolor = Color3.fromRGB(255, 255, 255),
	outlinefillcolor = Color3.fromRGB(255, 255, 255),
	tracercolor = Color3.fromRGB(255, 255, 255),
	skeletoncolor = Color3.fromRGB(255, 255, 255),
	espsize = 16,
	tracersize = 2,
	esptransparency = 1,
	outlinetransparency = 0,
	outlinefilltransparency = 1,
	rainbowesp = false,
	rainbowoutline = false,
	rainbowtracers = false,
	rainbowskeleton = false,
	rainbowspeed = 5,
}

local rainbowhue = 0
local lastupdate = 0
local espobjects = {}
local activehighlights = {}
local playerconnections = {}
local tracerlines = {}
local skeletonlines = {}

local aimlockenabled = false
local aimlocktype = "Nearest Player"
local fovenabled = false
local showfov = false
local fovsize = {X = 100, Y = 100}
local fovcolor = Color3.fromRGB(255, 255, 255)
local fovcircle = nil
local nearestplayerdistance = 1000
local nearestmousedistance = 500
local fovlockdistance = 1000
local rainbowfov = false
local aimlockcertainplayer = false
local selectedplayer = nil

local animationspeed = 1
local selectedanimation = ""
local loopanimation = false
local animationids = {
	["Dance (R15)"] = "507766388",
	["Zombie (R15)"] = "616158929",
	["Sit (R15)"] = "2506281703",
	["Salute (R15)"] = "582855105",
	["Bang (R6)"] = "148840371",
	["Jerk (R6)"] = "72042024",
	["Lay (R6)"] = "282574440"
}

local function playanimation(animid)
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		local humanoid = LocalPlayer.Character.Humanoid
		local animator = humanoid:FindFirstChild("Animator")
		if animator then
			local animationobject = Instance.new("Animation")
			animationobject.AnimationId = "rbxassetid://" .. animid
			local animtrack = animator:LoadAnimation(animationobject)
			animtrack:Play()
			animtrack:AdjustSpeed(animationspeed)
			if loopanimation then
				animtrack.Looped = true
			else
				animtrack.Ended:Connect(function()
					if Toggles.PlayAnimation then
						Toggles.PlayAnimation:SetValue(false)
					end
					if Toggles.PlayCustomAnimation then
						Toggles.PlayCustomAnimation:SetValue(false)
					end
				end)
			end
		end
	end
end

local function stopanimation()
	local character = Players.LocalPlayer.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
				track:Stop()
			end
			if debugmode then
				print("[DEBUG]: All animations stopped")
			end
		end
	end
end

local function getrainbowcolor()
	local currenttime = tick()
	local speedmultiplier = 11 - espconfig.rainbowspeed
	local increment = 0.001 * speedmultiplier
	if currenttime - lastupdate >= 0.1 then
		rainbowhue = (rainbowhue + increment) % 1
		lastupdate = currenttime
	end
	return Color3.fromHSV(rainbowhue, 1, 1)
end

local function getplayercolor(player)
	if player.Team then
		return player.TeamColor.Color
	else
		return Color3.new(1, 1, 1)
	end
end

local function createesp(player)
	if player == LocalPlayer then return end
	if espobjects[player] then return end

	local nametext = Drawing.new("Text")
	nametext.Size = espconfig.espsize
	nametext.Center = true
	nametext.Outline = true
	nametext.Color = espconfig.espcolor

	local infotext = Drawing.new("Text")
	infotext.Size = espconfig.espsize - 4
	infotext.Center = true
	infotext.Outline = true
	infotext.Color = espconfig.espcolor

	espobjects[player] = {
		Name = nametext,
		Info = infotext
	}
end

local function removeesp(player)
	if espobjects[player] then
		espobjects[player].Name:Remove()
		espobjects[player].Info:Remove()
		espobjects[player] = nil
	end
end

local function updateesp()
	for player, esp in pairs(espobjects) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = player.Character.HumanoidRootPart
			local pos, onscreen = Camera:WorldToViewportPoint(hrp.Position)

			local color = espconfig.rainbowesp and getrainbowcolor() or espconfig.espcolor
			esp.Name.Color = color
			esp.Info.Color = color
			esp.Name.Size = espconfig.espsize
			esp.Info.Size = espconfig.espsize - 4

			if onscreen then
				local distance = (Camera.CFrame.Position - hrp.Position).Magnitude
				local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
				local health = humanoid and math.floor(humanoid.Health) or 0

				esp.Name.Position = Vector2.new(pos.X, pos.Y - 20)
				esp.Name.Text = espconfig.showname and player.Name or ""
				esp.Name.Visible = espconfig.showname

				esp.Info.Position = Vector2.new(pos.X, pos.Y - 7)
				esp.Info.Text = espconfig.showdistance and ("[Distance " .. math.floor(distance) .. "]") or ""
				esp.Info.Visible = espconfig.showdistance
			else
				esp.Name.Visible = false
				esp.Info.Visible = false
			end
		else
			removeesp(player)
		end
	end
end

local function applyhighlighttocharacter(player, character)
	local userid = player.UserId
	if activehighlights[userid] then
		activehighlights[userid]:Destroy()
	end

	local highlighter = Instance.new("Highlight")
	highlighter.Name = "PlayerHighlight"
	highlighter.FillTransparency = espconfig.outlinefilltransparency
	highlighter.OutlineTransparency = espconfig.outlinetransparency
	highlighter.OutlineColor = espconfig.rainbowoutline and getrainbowcolor() or espconfig.outlinecolor
	highlighter.FillColor = espconfig.rainbowoutline and getrainbowcolor() or espconfig.outlinefillcolor
	highlighter.Adornee = character
	highlighter.Parent = character

	activehighlights[userid] = highlighter
end

local function setupplayerhighlight(player)
	local userid = player.UserId
	playerconnections[userid] = playerconnections[userid] or {}

	local function oncharacteradded(character)
		local humanoid = character:WaitForChild("Humanoid")
		if outlineenabled then
			applyhighlighttocharacter(player, character)
		end

		table.insert(playerconnections[userid], player:GetPropertyChangedSignal("TeamColor"):Connect(function()
			local highlight = activehighlights[userid]
			if highlight then
				highlight.OutlineColor = espconfig.rainbowoutline and getrainbowcolor() or (player.TeamColor and player.TeamColor.Color) or espconfig.outlinecolor
			end
		end))

		table.insert(playerconnections[userid], humanoid.Died:Connect(function()
			removehighlight(player)
		end))
	end

	local charaddedconn = player.CharacterAdded:Connect(oncharacteradded)
	table.insert(playerconnections[userid], charaddedconn)

	if player.Character then
		oncharacteradded(player.Character)
	end
end

function removehighlight(player)
	local userid = player.UserId
	if activehighlights[userid] then
		activehighlights[userid]:Destroy()
		activehighlights[userid] = nil
	end

	if playerconnections[userid] then
		for _, conn in pairs(playerconnections[userid]) do
			conn:Disconnect()
		end
		playerconnections[userid] = nil
	end
end

local function toggletracers()
	if tracersenabled then
		RunService:BindToRenderStep("Tracers", Enum.RenderPriority.Camera.Value + 1, function()
			for _, line in ipairs(tracerlines) do
				line:Destroy()
			end
			tracerlines = {}

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local root = player.Character.HumanoidRootPart
					local screenpos, onscreen = Camera:WorldToViewportPoint(root.Position)

					if onscreen then
						local line = Drawing.new("Line")
						line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
						line.To = Vector2.new(screenpos.X, screenpos.Y)
						line.Color = espconfig.rainbowtracers and getrainbowcolor() or espconfig.tracercolor
						line.Thickness = espconfig.tracersize
						line.Transparency = 1
						line.Visible = true
						table.insert(tracerlines, line)
					end
				end
			end
		end)
	else
		RunService:UnbindFromRenderStep("Tracers")
		for _, line in ipairs(tracerlines) do
			line:Destroy()
		end
		tracerlines = {}
	end
end

local function toggleskeleton()
	if skeletonenabled then
		RunService:BindToRenderStep("SkeletonESP", Enum.RenderPriority.Camera.Value + 1, function()
			for _, line in ipairs(skeletonlines) do
				line:Destroy()
			end
			skeletonlines = {}

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and player.Character then
					local char = player.Character
					local parts = {
						Head = char:FindFirstChild("Head"),
						Torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"),
						Hip = char:FindFirstChild("LowerTorso") or char:FindFirstChild("Torso"),
						LeftArm = char:FindFirstChild("LeftUpperArm") or char:FindFirstChild("Left Arm"),
						RightArm = char:FindFirstChild("RightUpperArm") or char:FindFirstChild("Right Arm"),
						LeftLeg = char:FindFirstChild("LeftUpperLeg") or char:FindFirstChild("Left Leg"),
						RightLeg = char:FindFirstChild("RightUpperLeg") or char:FindFirstChild("Right Leg")
					}

					local color = espconfig.rainbowskeleton and getrainbowcolor() or espconfig.skeletoncolor

					local function getscreen(part)
						if part then
							local pos, visible = Camera:WorldToViewportPoint(part.Position)
							if visible then return Vector2.new(pos.X, pos.Y) end
						end
						return nil
					end

					local function drawline(p1, p2)
						if p1 and p2 then
							local line = Drawing.new("Line")
							line.From = p1
							line.To = p2
							line.Color = color
							line.Thickness = 2
							line.Transparency = 1
							line.Visible = true
							table.insert(skeletonlines, line)
						end
					end

					local head = getscreen(parts.Head)
					local torso = getscreen(parts.Torso)
					local hip = getscreen(parts.Hip)
					local la = getscreen(parts.LeftArm)
					local ra = getscreen(parts.RightArm)
					local ll = getscreen(parts.LeftLeg)
					local rl = getscreen(parts.RightLeg)

					drawline(head, torso)
					drawline(torso, hip)
					drawline(torso, la)
					drawline(torso, ra)
					drawline(hip, ll)
					drawline(hip, rl)
				end
			end
		end)
	else
		RunService:UnbindFromRenderStep("SkeletonESP")
		for _, line in ipairs(skeletonlines) do
			line:Destroy()
		end
		skeletonlines = {}
	end
end

local function getclosestplayer()
	local closestplayer = nil
	local shortestdistance = math.huge

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude

			if aimlocktype == "Nearest Player" and distance < nearestplayerdistance and distance < shortestdistance then
				closestplayer = player
				shortestdistance = distance
			elseif aimlocktype == "Nearest Mouse" and distance < nearestmousedistance then
				local screenpos, onscreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
				if onscreen then
					local mousedistance = (Vector2.new(screenpos.X, screenpos.Y) - Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)).Magnitude
					if mousedistance < shortestdistance then
						closestplayer = player
						shortestdistance = mousedistance
					end
				end
			end
		end
	end

	if fovenabled and closestplayer then
		local screenpos, onscreen = Camera:WorldToViewportPoint(closestplayer.Character.HumanoidRootPart.Position)
		if onscreen then
			local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
			local distance = (Vector2.new(screenpos.X, screenpos.Y) - center).Magnitude
			local worlddistance = (LocalPlayer.Character.HumanoidRootPart.Position - closestplayer.Character.HumanoidRootPart.Position).Magnitude

			if distance > math.min(fovsize.X, fovsize.Y) / 2 or worlddistance > fovlockdistance then
				return nil
			end
		end
	end

	return closestplayer
end

local function updateaimlock()
	if not aimlockenabled then return end

	local targetplayer = nil

	if aimlockcertainplayer and selectedplayer then
		targetplayer = selectedplayer
	else
		targetplayer = getclosestplayer()
	end

	if targetplayer and targetplayer.Character and targetplayer.Character:FindFirstChild("Head") then
		local targetposition = targetplayer.Character.Head.Position
		local lookdirection = (targetposition - Camera.CFrame.Position).Unit
		Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + lookdirection)
	end
end

local function updatefovcircle()
	if showfov and fovcircle then
		fovcircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
		fovcircle.Radius = math.min(fovsize.X, fovsize.Y) / 2
		fovcircle.Color = rainbowfov and getrainbowcolor() or fovcolor
		fovcircle.Visible = true
	end
end

local function setupantifling()
	if antiflingenabled then
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character then
				for _, part in pairs(player.Character:GetChildren()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end
			end
		end

		antiflingconnections.PlayerAdded = Players.PlayerAdded:Connect(function(player)
			player.CharacterAdded:Connect(function(character)
				if antiflingenabled then
					for _, part in pairs(character:GetChildren()) do
						if part:IsA("BasePart") then
							part.CanCollide = false
						end
					end
				end
			end)
		end)

		antiflingconnections.CharacterAdded = {}
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer then
				antiflingconnections.CharacterAdded[player] = player.CharacterAdded:Connect(function(character)
					if antiflingenabled then
						for _, part in pairs(character:GetChildren()) do
							if part:IsA("BasePart") then
								part.CanCollide = false
							end
						end
					end
				end)
			end
		end
	else
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character then
				for _, part in pairs(player.Character:GetChildren()) do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						part.CanCollide = true
					end
				end
			end
		end

		for _, connection in pairs(antiflingconnections) do
			if typeof(connection) == "RBXScriptConnection" then
				connection:Disconnect()
			elseif typeof(connection) == "table" then
				for _, conn in pairs(connection) do
					conn:Disconnect()
				end
			end
		end
		antiflingconnections = {}
	end
end

local playergroup = Tabs.Main:AddLeftGroupbox("Player", "user")

local currentwalkspeed = 16
local currentjumppower = 50
local currentgravity = 196.2

playergroup:AddSlider("WalkSpeed", {
	Text = "WalkSpeed",
	Default = 16,
	Min = 0,
	Max = 100,
	Rounding = 1,
	Callback = function(Value)
		currentwalkspeed = Value
	end,
})

playergroup:AddSlider("JumpPower", {
	Text = "JumpPower",
	Default = 50,
	Min = 0,
	Max = 200,
	Rounding = 1,
	Callback = function(Value)
		currentjumppower = Value
	end,
})

playergroup:AddSlider("Gravity", {
	Text = "Gravity",
	Default = 196.2,
	Min = 0,
	Max = 500,
	Rounding = 1,
	Callback = function(Value)
		currentgravity = Value
	end,
})

playergroup:AddCheckbox("NoAcceleration", {
	Text = "No Acceleration",
	Default = false,
	Callback = function(Value)
		noaccelerationenabled = Value
		local character = LocalPlayer.Character
		if character and character:FindFirstChild("Humanoid") then
			if Value then
				character.Humanoid.WalkSpeed = character.Humanoid.WalkSpeed
				character.Humanoid.JumpPower = character.Humanoid.JumpPower
			else
				character.Humanoid.WalkSpeed = originalwalkspeed
				character.Humanoid.JumpPower = originaljumppower
			end
		end
	end,
})

playergroup:AddDivider()

playergroup:AddCheckbox("AntiFling", {
	Text = "Anti-Fling",
	Default = false,
	Callback = function(Value)
		antiflingenabled = Value
		setupantifling()
	end,
})

playergroup:AddCheckbox("AntiAFK", {
	Text = "Anti-AFK",
	Default = false,
	Callback = function(Value)
		antiafkenabled = Value
		if Value then
			antiafkconnection = RunService.Heartbeat:Connect(function()
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					local currentpos = LocalPlayer.Character.HumanoidRootPart.Position
					if not lastposition then
						lastposition = currentpos
					end

					if (currentpos - lastposition).Magnitude < 0.1 then
						LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0.1, 0)
						wait(0.1)
						LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0, 0.1, 0)
					end
					lastposition = currentpos
				end
			end)
		else
			if antiafkconnection then
				antiafkconnection:Disconnect()
				antiafkconnection = nil
			end
		end
	end,
})

playergroup:AddCheckbox("AntiVoid", {
	Text = "Anti-Void",
	Default = false,
	Callback = function(Value)
		antivoidenabled = Value
		if Value then
			antivoidconnection = RunService.Heartbeat:Connect(function()
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if LocalPlayer.Character.HumanoidRootPart.Position.Y < -100 then
						LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
					end
				end
			end)
		else
			if antivoidconnection then
				antivoidconnection:Disconnect()
				antivoidconnection = nil
			end
		end
	end,
})

playergroup:AddCheckbox("AntiKick", {
	Text = "Anti-Kick",
	Default = false,
	Callback = function(Value)
		antikickenabled = Value
		if Value then
			local mt = getrawmetatable(game)
			local oldnamecall = mt.__namecall
			setreadonly(mt, false)

			mt.__namecall = function(self, ...)
				local method = getnamecallmethod()
				if method == "Kick" then
					return
				end
				return oldnamecall(self, ...)
			end

			setreadonly(mt, true)
		end
	end,
})

playergroup:AddDivider()

playergroup:AddCheckbox("Noclip", {
	Text = "Noclip",
	Default = false,
	Callback = function(Value)
		noclipenabled = Value
		local character = LocalPlayer.Character
		if character then
			for _, part in pairs(character:GetChildren()) do
				if part:IsA("BasePart") then
					part.CanCollide = not Value
				end
			end
		end
	end,
}):AddKeyPicker("NoclipKey", {
	Default = "N",
	Text = "Noclip",
	Callback = function()
		Toggles.Noclip:SetValue(not Toggles.Noclip.Value)
	end,
})

playergroup:AddCheckbox("InfiniteJump", {
	Text = "Infinite Jump",
	Default = false,
	Callback = function(Value)
		infinitejumpenabled = Value
	end,
}):AddKeyPicker("InfiniteJumpKey", {
	Default = "J",
	Text = "Infinite Jump",
	Callback = function()
		Toggles.InfiniteJump:SetValue(not Toggles.InfiniteJump.Value)
	end,
})

local flygroup = Tabs.Main:AddRightGroupbox("Fly", "plane")

local flySpeed = 1
local nowe = false
local tpwalking = false
local speeds = 1

local function startFlying()
	if nowe == true then return end

	nowe = true
	local player = Players.LocalPlayer
	local character = player.Character
	if not character then return end

	for i = 1, speeds do
		spawn(function()
			local hb = RunService.Heartbeat
			tpwalking = true
			local chr = player.Character
			local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
			while tpwalking and hb:Wait() and chr and hum and hum.Parent do
				if hum.MoveDirection.Magnitude > 0 then
					chr:TranslateBy(hum.MoveDirection)
				end
			end
		end)
	end

	character.Animate.Disabled = true
	local humanoid = character:FindFirstChildOfClass("Humanoid") or character:FindFirstChildOfClass("AnimationController")
	for i,v in next, humanoid:GetPlayingAnimationTracks() do
		v:AdjustSpeed(0)
	end

	humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
	humanoid:ChangeState(Enum.HumanoidStateType.Swimming)

	if humanoid.RigType == Enum.HumanoidRigType.R6 then
		local torso = character.Torso
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0

		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame

		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

		humanoid.PlatformStand = true

		spawn(function()
			while nowe == true and humanoid.Health > 0 do
				RunService.RenderStepped:Wait()

				local moveVector = humanoid.MoveDirection
				if moveVector.Magnitude > 0 then
					ctrl.f = moveVector.Z < 0 and 1 or 0
					ctrl.b = moveVector.Z > 0 and 1 or 0
					ctrl.l = moveVector.X < 0 and 1 or 0
					ctrl.r = moveVector.X > 0 and 1 or 0
				else
					ctrl = {f = 0, b = 0, l = 0, r = 0}
				end

				if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
					speed = speed+.5+(speed/maxspeed)
					if speed > maxspeed then
						speed = maxspeed
					end
				elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
					speed = speed-1
					if speed < 0 then
						speed = 0
					end
				end

				if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
					bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p))*speed
					lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
				elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
					bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p))*speed
				else
					bv.velocity = Vector3.new(0,0,0)
				end

				bg.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
			end

			bg:Destroy()
			bv:Destroy()
			humanoid.PlatformStand = false
			character.Animate.Disabled = false
			tpwalking = false
		end)
	else
		local upperTorso = character.UpperTorso
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0

		local bg = Instance.new("BodyGyro", upperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = upperTorso.CFrame

		local bv = Instance.new("BodyVelocity", upperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

		humanoid.PlatformStand = true

		spawn(function()
			while nowe == true and humanoid.Health > 0 do
				wait()

				local moveVector = humanoid.MoveDirection
				if moveVector.Magnitude > 0 then
					ctrl.f = moveVector.Z < 0 and 1 or 0
					ctrl.b = moveVector.Z > 0 and 1 or 0
					ctrl.l = moveVector.X < 0 and 1 or 0
					ctrl.r = moveVector.X > 0 and 1 or 0
				else
					ctrl = {f = 0, b = 0, l = 0, r = 0}
				end

				if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
					speed = speed+.5+(speed/maxspeed)
					if speed > maxspeed then
						speed = maxspeed
					end
				elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
					speed = speed-1
					if speed < 0 then
						speed = 0
					end
				end

				if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
					bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p))*speed
					lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
				elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
					bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p))*speed
				else
					bv.velocity = Vector3.new(0,0,0)
				end

				bg.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
			end

			bg:Destroy()
			bv:Destroy()
			humanoid.PlatformStand = false
			character.Animate.Disabled = false
			tpwalking = false
		end)
	end
end

local function stopFlying()
	if nowe == false then return end

	nowe = false
	tpwalking = false
	local player = Players.LocalPlayer
	local character = player.Character
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
	humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
end

flygroup:AddToggle("FlyToggle", {
	Text = "Fly",
	Default = false,
	Callback = function(Value)
		if debugmode then
			print("[DEBUG]: Fly Toggle " .. (Value and "On" or "Off"))
		end

		if Value then
			startFlying()
		else
			stopFlying()
		end
	end,
}):AddKeyPicker("FlyKeybind", {
	Default = "F",
	Text = "Fly Keybind",
	SyncToggleState = true,
})

flygroup:AddSlider("FlySpeed", {
	Text = "Fly Speed",
	Default = 1,
	Min = 1,
	Max = 100,
	Rounding = 0,
	Callback = function(Value)
		speeds = Value
		flySpeed = Value
		if debugmode then
			print("[DEBUG]: Fly Speed set to " .. Value)
		end

		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()
					local hb = RunService.Heartbeat
					tpwalking = true
					local chr = Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end
				end)
			end
		end
	end,
})

Players.LocalPlayer.CharacterAdded:Connect(function(character)
	wait(0.7)
	nowe = false
	tpwalking = false
	if character:FindFirstChildOfClass("Humanoid") then
		character:FindFirstChildOfClass("Humanoid").PlatformStand = false
		if character:FindFirstChild("Animate") then
			character.Animate.Disabled = false
		end
	end
end)

-- Fixed status group by removing duplicate ping label and divider
local statusgroup = Tabs.Main:AddLeftGroupbox("Status", "activity")

local fpslabel = statusgroup:AddLabel("FPS: 0")
local pinglabel = statusgroup:AddLabel("PING: 0")
local versionlabel = statusgroup:AddLabel("UNXHub Ver.: " .. (getgenv().unxshared and getgenv().unxshared.version or "Unknown"))

spawn(function()
	while true do
		local fps = math.floor(1 / RunService.Heartbeat:Wait())
		fpslabel:SetText("FPS: " .. fps)
		wait(1)
	end
end)

spawn(function()
	while true do
		local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
		pinglabel:SetText("PING: " .. ping)
		wait(0.001)
	end
end)

local othergroup = Tabs.Main:AddRightGroupbox("Other", "more-horizontal")

othergroup:AddButton({
	Text = "Reset",
	Func = function()
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LocalPlayer.Character.Humanoid.Health = 0
		end
	end,
})

othergroup:AddButton({
	Text = "Rejoin",
	Func = function()
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end,
})

othergroup:AddDivider()

othergroup:AddButton({
	Text = "Reset WalkSpeed",
	Func = function()
		currentwalkspeed = 16
		Options.WalkSpeed:SetValue(16)
	end,
})

othergroup:AddButton({
	Text = "Reset JumpPower",
	Func = function()
		currentjumppower = 50
		Options.JumpPower:SetValue(50)
	end,
})

othergroup:AddButton({
	Text = "Reset Gravity",
	Func = function()
		currentgravity = 196.2
		Options.Gravity:SetValue(196.2)
	end,
})

local esptabbox = Tabs.Visuals:AddLeftTabbox()
local esptab = esptabbox:AddTab("ESP")
local configtab = esptabbox:AddTab("Configurations")

esptab:AddCheckbox("ESP", {
	Text = "ESP",
	Default = false,
	Callback = function(Value)
		espenabled = Value
		if Value then
			for _, player in pairs(Players:GetPlayers()) do
				createesp(player)
			end
		else
			for player, _ in pairs(espobjects) do
				removeesp(player)
			end
		end
	end,
}):AddColorPicker("ESPColor", {
	Default = Color3.fromRGB(255, 255, 255),
	Title = "ESP Color",
	Callback = function(Value)
		espconfig.espcolor = Value
	end,
})

esptab:AddCheckbox("Outline", {
	Text = "Outline",
	Default = false,
	Callback = function(Value)
		outlineenabled = Value
		if Value then
			for _, player in pairs(Players:GetPlayers()) do
				playerconnections[player.UserId] = {}
				setupplayerhighlight(player)
			end
		else
			for _, player in pairs(Players:GetPlayers()) do
				removehighlight(player)
			end
		end
	end,
}):AddColorPicker("OutlineColor", {
	Default = Color3.fromRGB(255, 255, 255),
	Title = "Outline Color",
	Callback = function(Value)
		espconfig.outlinecolor = Value
	end,
}):AddColorPicker("OutlineFillColor", {
	Default = Color3.fromRGB(255, 255, 255),
	Title = "Fill Color",
	Callback = function(Value)
		espconfig.outlinefillcolor = Value
	end,
})

esptab:AddCheckbox("Tracers", {
	Text = "Tracers",
	Default = false,
	Callback = function(Value)
		tracersenabled = Value
		toggletracers()
	end,
}):AddColorPicker("TracerColor", {
	Default = Color3.fromRGB(255, 255, 255),
	Title = "Tracer Color",
	Callback = function(Value)
		espconfig.tracercolor = Value
	end,
})

esptab:AddCheckbox("SkeletonESP", {
	Text = "Skeleton ESP",
	Default = false,
	Callback = function(Value)
		skeletonenabled = Value
		toggleskeleton()
	end,
}):AddColorPicker("SkeletonColor", {
	Default = Color3.fromRGB(255, 255, 255),
	Title = "Skeleton Color",
	Callback = function(Value)
		espconfig.skeletoncolor = Value
	end,
})

configtab:AddCheckbox("ShowName", {
	Text = "Show Name",
	Default = true,
	Callback = function(Value)
		espconfig.showname = Value
	end,
})

configtab:AddCheckbox("ShowDistance", {
	Text = "Show Distance",
	Default = true,
	Callback = function(Value)
		espconfig.showdistance = Value
	end,
})

configtab:AddCheckbox("RainbowESP", {
	Text = "Rainbow ESP",
	Default = false,
	Callback = function(Value)
		espconfig.rainbowesp = Value
	end,
})

configtab:AddCheckbox("RainbowOutline", {
	Text = "Rainbow Outline",
	Default = false,
	Callback = function(Value)
		espconfig.rainbowoutline = Value
	end,
})

configtab:AddCheckbox("RainbowTracers", {
	Text = "Rainbow Tracers",
	Default = false,
	Callback = function(Value)
		espconfig.rainbowtracers = Value
	end,
})

configtab:AddCheckbox("RainbowSkeleton", {
	Text = "Rainbow Skeleton ESP",
	Default = false,
	Callback = function(Value)
		espconfig.rainbowskeleton = Value
	end,
})

configtab:AddSlider("ESPSize", {
	Text = "ESP Size",
	Default = 16,
	Min = 16,
	Max = 48,
	Rounding = 1,
	Callback = function(Value)
		espconfig.espsize = Value
	end,
})

configtab:AddSlider("TracerSize", {
	Text = "Tracer Size",
	Default = 2,
	Min = 0.5,
	Max = 2,
	Rounding = 0.1,
	Callback = function(Value)
		espconfig.tracersize = Value
	end,
})

configtab:AddSlider("OutlineTransparency", {
	Text = "Outline Transparency",
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 0.1,
	Callback = function(Value)
		espconfig.outlinetransparency = Value
	end,
})

configtab:AddSlider("OutlineFillTransparency", {
	Text = "Outline Fill Transparency",
	Default = 1,
	Min = 0,
	Max = 1,
	Rounding = 0.1,
	Callback = function(Value)
		espconfig.outlinefilltransparency = Value
	end,
})

configtab:AddSlider("RainbowSpeed", {
	Text = "Rainbow Speed",
	Default = 5,
	Min = 1,
	Max = 10,
	Rounding = 1,
	Callback = function(Value)
		espconfig.rainbowspeed = Value
	end,
})

local gamegroup = Tabs.Visuals:AddRightGroupbox("Game", "gamepad-2")

gamegroup:AddSlider("FieldOfView", {
	Text = "Field of View",
	Default = 70,
	Min = 60,
	Max = 120,
	Rounding = 1,
	Callback = function(Value)
		workspace.CurrentCamera.FieldOfView = Value
	end,
})

gamegroup:AddCheckbox("FullBright", {
	Text = "Full Bright",
	Default = false,
	Callback = function(Value)
		fullbrightenabled = Value
		if Value then
			game.Lighting.Brightness = 2
			game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
			game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
		else
			game.Lighting.Brightness = originallighting.Brightness
			game.Lighting.Ambient = originallighting.Ambient
			game.Lighting.OutdoorAmbient = originallighting.OutdoorAmbient
		end
	end,
})

gamegroup:AddCheckbox("NoFog", {
	Text = "No Fog",
	Default = false,
	Callback = function(Value)
		nofogenabled = Value
		if Value then
			game.Lighting.FogEnd = 100000
			game.Lighting.FogStart = 0
		else
			game.Lighting.FogEnd = originallighting.FogEnd
			game.Lighting.FogStart = originallighting.FogStart
		end
	end,
})

gamegroup:AddCheckbox("AntiLag", {
	Text = "Anti Lag",
	Default = false,
	Callback = function(Value)
		antillagenabled = Value
		if Value then
			originalsettings.RenderDistance = workspace.CurrentCamera.RenderDistance
			originalsettings.QualityLevel = settings().Rendering.QualityLevel

			workspace.CurrentCamera.RenderDistance = 50
			settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("Texture") or obj:IsA("Decal") then
					originaltextures[obj] = obj.Texture
					obj.Texture = ""
				elseif obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
					obj.Enabled = false
				end
			end
		else
			if originalsettings.RenderDistance then
				workspace.CurrentCamera.RenderDistance = originalsettings.RenderDistance
			end
			if originalsettings.QualityLevel then
				settings().Rendering.QualityLevel = originalsettings.QualityLevel
			end

			for obj, texture in pairs(originaltextures) do
				if obj and obj.Parent then
					obj.Texture = texture
				end
			end
			originaltextures = {}

			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
					obj.Enabled = true
				end
			end
		end
	end,
})

local teleportgroup = Tabs.Features:AddLeftGroupbox("Teleport", "zap")

teleportgroup:AddDropdown("TeleportPlayer", {
	SpecialType = "Player",
	ExcludeLocalPlayer = true,
	Text = "Select Player",
	Callback = function(Value)
	end,
})

teleportgroup:AddButton({
	Text = "Teleport to Player",
	Func = function()
		local selectedPlayer = Options.TeleportPlayer.Value
		if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
			if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				Players.LocalPlayer.Character.HumanoidRootPart.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame
				if debugmode then
					print("[DEBUG]: Teleported to " .. selectedPlayer.Name)
				end
			end
		end
	end,
})

local autochatgroup = Tabs.Features:AddLeftGroupbox("Auto Chat", "message-circle")

-- Updated auto chat to use TextChatService
local autochatEnabled = false
local autochatMessage = "Hello World!"
local autochatInterval = 1

autochatgroup:AddCheckbox("AutoChat", {
	Text = "Auto Chat",
	Default = false,
	Callback = function(Value)
		autochatEnabled = Value
		if Value then
			spawn(function()
				while autochatEnabled do
					if TextChatService.TextChannels.RBXGeneral then
						TextChatService.TextChannels.RBXGeneral:SendAsync(autochatMessage)
					end
					wait(autochatInterval)
				end
			end)
		end
	end,
})

autochatgroup:AddInput("AutoChatMessage", {
	Default = "Hello World!",
	Text = "Chat Message",
	Callback = function(Value)
		autochatMessage = Value
	end,
})

autochatgroup:AddSlider("AutoChatInterval", {
	Text = "Chat Interval (seconds)",
	Default = 1,
	Min = 0.1,
	Max = 5,
	Rounding = 0.1,
	Callback = function(Value)
		autochatInterval = Value
	end,
})

local servergroup = Tabs.Features:AddRightGroupbox("Server Options", "server")

servergroup:AddButton({
	Text = "Copy Server JobID",
	Func = function()
		setclipboard(game.JobId)
		Library:Notify("Server JobID copied to clipboard!", 3)
	end,
})

servergroup:AddInput("ServerJobID", {
	Default = "",
	Text = "Server JobID",
	Callback = function(Value)
	end,
})

servergroup:AddButton({
	Text = "Join Server",
	Func = function()
		local jobid = Options.ServerJobID.Value
		if jobid and jobid ~= "" then
			TeleportService:TeleportToPlaceInstance(game.PlaceId, jobid, LocalPlayer)
		end
	end,
})

local fpsgroup = Tabs.Features:AddRightGroupbox("FPS Control", "gauge")

fpsgroup:AddSlider("FPSCap", {
	Text = "FPS Cap",
	Default = 60,
	Min = 1,
	Max = 520,
	Rounding = 1,
	Callback = function(Value)
		setfpscap(Value)
	end,
})

fpsgroup:AddDropdown("FPSPresets", {
	Values = {"24", "30", "60", "120", "240", "460", "520"},
	Default = 1,
	Text = "FPS Presets",
	Callback = function(Value)
		local fps = tonumber(Value)
		if fps then
			setfpscap(fps)
			Options.FPSCap:SetValue(fps)
		end
	end,
})

fpsgroup:AddButton({
	Text = "Unlimited FPS",
	Func = function()
		setfpscap(9999)
		Options.FPSCap:SetValue(520)
	end,
})

local aimlocktabbox = Tabs.Features:AddLeftTabbox()
local aimlocktab = aimlocktabbox:AddTab("AimLock")
local aimlockconfigtab = aimlocktabbox:AddTab("Configurations")

aimlocktab:AddCheckbox("AimLock", {
	Text = "Activate Aimlock",
	Default = false,
	Callback = function(Value)
		aimlockenabled = Value
	end,
})

aimlocktab:AddDropdown("AimLockType", {
	Values = {"Nearest Player", "Nearest Mouse"},
	Default = 1,
	Text = "Aimlock Type",
	Callback = function(Value)
		aimlocktype = Value
	end,
})

aimlocktab:AddCheckbox("AimLockCertainPlayer", {
	Text = "Aimlock Certain Player",
	Default = false,
	Callback = function(Value)
		aimlockcertainplayer = Value
	end,
})

aimlocktab:AddDropdown("AimLockPlayerSelect", {
	SpecialType = "Player",
	ExcludeLocalPlayer = true,
	Text = "Select Player",
	Callback = function(Value)
		selectedplayer = Value
	end,
})

aimlocktab:AddCheckbox("EnableFOV", {
	Text = "Enable FOV",
	Default = false,
	Callback = function(Value)
		fovenabled = Value
		if Value then
			Options.AimLockType.Disabled = true
		else
			Options.AimLockType.Disabled = false
		end
	end,
})

aimlocktab:AddCheckbox("ShowFOV", {
	Text = "Show FOV (Feature Is Broken)",
	Default = false,
	Tooltip = "Feature Is Broken",
	Callback = function(Value)
		showfov = false
	end,
}):AddColorPicker("FOVColor", {
	Default = Color3.fromRGB(255, 255, 255),
	Title = "FOV Color",
	Callback = function(Value)
		fovcolor = Value
	end,
})

if Options.ShowFOV then
	Options.ShowFOV.Disabled = true
end

aimlockconfigtab:AddSlider("NearestPlayerDistance", {
	Text = "Nearest Player Lock Distance (Studs)",
	Default = 1000,
	Min = 10,
	Max = 5000,
	Rounding = 1,
	Callback = function(Value)
		nearestplayerdistance = Value
	end,
})

aimlockconfigtab:AddSlider("NearestMouseDistance", {
	Text = "Nearest Mouse Lock Distance (Studs)",
	Default = 500,
	Min = 10,
	Max = 5000,
	Rounding = 1,
	Callback = function(Value)
		nearestmousedistance = Value
	end,
})

aimlockconfigtab:AddSlider("FOVLockDistance", {
	Text = "FOV Lock Distance (Studs)",
	Default = 1000,
	Min = 50,
	Max = 5000,
	Rounding = 1,
	Callback = function(Value)
		fovlockdistance = Value
	end,
})

aimlockconfigtab:AddCheckbox("RainbowFOV", {
	Text = "Rainbow FOV",
	Default = false,
	Callback = function(Value)
		rainbowfov = Value
	end,
})

aimlockconfigtab:AddSlider("FOVSizeX", {
	Text = "FOV Size (X)",
	Default = 100,
	Min = 50,
	Max = 500,
	Rounding = 1,
	Callback = function(Value)
		fovsize.X = Value
		if fovcircle then
			fovcircle.Radius = math.min(fovsize.X, fovsize.Y) / 2
		end
	end,
})

aimlockconfigtab:AddSlider("FOVSizeY", {
	Text = "FOV Size (Y)",
	Default = 100,
	Min = 50,
	Max = 500,
	Rounding = 1,
	Callback = function(Value)
		fovsize.Y = Value
		if fovcircle then
			fovcircle.Radius = math.min(fovsize.X, fovsize.Y) / 2
		end
	end,
})

local menugroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "settings")

-- Fixed DPI Scale input to handle % symbol properly
menugroup:AddInput("DPIScale", {
	Default = "100",
	Text = "DPI Scale",
	Callback = function(Value)
		local dpi = tonumber(Value)
		if dpi then
			Library:SetDPIScale(dpi)
		end
	end,
})

menugroup:AddCheckbox("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})

menugroup:AddCheckbox("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})

menugroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",
	Text = "Notification Side",
	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})

menugroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",
	Text = "DPI Scale",
	Callback = function(Value)
		Value = string.gsub(Value, "%%", "")
		local dpi = tonumber(Value)
		Library:SetDPIScale(dpi)
	end,
})

menugroup:AddDivider()

menugroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

menugroup:AddButton("Unload", function()
	Library:Unload()
end)

menugroup:AddToggle("DebugMode", {
	Text = "Debug Mode (Restart Required)",
	Default = debugmode,
	Callback = function(Value)
		if Value then
			writefile("debugtrue", "debug enabled")
			if debugmode then
				print("[DEBUG]: Debug mode file created - restart script to enable")
			end
		else
			if isfile("debugtrue") then
				delfile("debugtrue")
				if debugmode then
					print("[DEBUG]: Debug mode file deleted - restart script to disable")
				end
			end
		end
	end,
})

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")

SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()

-- Updated animations section to be in Fun tab instead of FE Stuff
local animationstabbox = Tabs["Fun"]:AddLeftTabbox()
local animtab = animationstabbox:AddTab("Anim")
local animconfigtab = animationstabbox:AddTab("Config")

local animationnames = {}
for name, _ in pairs(animationids) do
	table.insert(animationnames, name)
end

animtab:AddDropdown("AnimationSelect", {
	Values = animationnames,
	Default = 1,
	Text = "Select Animation",
	Callback = function(Value)
		selectedanimation = animationids[Value]
		if debugmode then
			print("[DEBUG]: Selected animation: " .. Value .. " (ID: " .. selectedanimation .. ")")
		end
	end,
})

animtab:AddCheckbox("PlayAnimation", {
	Text = "Play Animation",
	Default = false,
	Callback = function(Value)
		if Value then
			if selectedanimation and selectedanimation ~= "" then
				playanimation(selectedanimation)
				if debugmode then
					print("[DEBUG]: Playing animation: " .. selectedanimation)
				end
			end
		else
			stopanimation()
			if debugmode then
				print("[DEBUG]: Stopped animation via checkbox")
			end
		end
	end,
})

animtab:AddInput("CustomAnimID", {
	Default = "",
	Numeric = true,
	Text = "Custom Animation ID",
	Placeholder = "Enter animation ID...",
	Callback = function(Value)
		if debugmode then
			print("[DEBUG]: Custom animation ID set to: " .. Value)
		end
	end,
})

animtab:AddCheckbox("PlayCustomAnimation", {
	Text = "Play Custom Animation ID",
	Default = false,
	Callback = function(Value)
		if Value then
			local customID = Options.CustomAnimID.Value
			if customID and customID ~= "" then
				playanimation(customID)
				if debugmode then
					print("[DEBUG]: Playing custom animation: " .. customID)
				end
			else
				Toggles.PlayCustomAnimation:SetValue(false)
				if debugmode then
					print("[DEBUG]: No custom animation ID provided")
				end
			end
		else
			stopanimation()
			if debugmode then
				print("[DEBUG]: Stopped custom animation via checkbox")
			end
		end
	end,
})

animconfigtab:AddCheckbox("LoopAnimation", {
	Text = "Loop Animation",
	Default = false,
	Callback = function(Value)
		loopanimation = Value
		if debugmode then
			print("[DEBUG]: Loop Animation set to: " .. tostring(Value))
		end
	end,
})

-- Replaced basic music player with advanced audio player logic
-- Remove the existing music player section and replace with comprehensive version
local musicplayergroup = Tabs["Fun"]:AddRightGroupbox("Music Player", "music")

-- Music system variables
local CurrentSound -- stores currently playing sound
local musicFolder = "unxhub/musics"

-- Create music folder if it doesn't exist
if not isfolder("unxhub") then
	makefolder("unxhub")
end
if not isfolder(musicFolder) then
	makefolder(musicFolder)
end

-- Helper: Load songs from folder
local function LoadSongs(folder)
	local files = listfiles(folder)
	local songs = {}
	for _, f in ipairs(files) do
		if isfile(f) then
			local content = readfile(f)
			local id, name = content:match("ID:(%d+)\nName:(.+)")
			if id and name then
				table.insert(songs, name .. " (" .. id .. ")")
			end
		end
	end
	return songs
end

-- Helper: Play sound
local function PlaySound(id, label, loop)
	if CurrentSound then CurrentSound:Destroy() end
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. id
	sound.Parent = SoundService
	sound.Volume = Options.MusicVolume and Options.MusicVolume.Value or 1
	sound.PlaybackSpeed = Options.MusicSpeed and Options.MusicSpeed.Value or 1
	sound.Pitch = Options.MusicPitch and Options.MusicPitch.Value or 1
	sound.Looped = loop or (Toggles.LoopPlay and Toggles.LoopPlay.Value)
	sound:Play()
	CurrentSound = sound
	Library:Notify("Playing: " .. label, 3)
end

-- Music List Dropdown
musicplayergroup:AddDropdown("MusicList", {
	Values = LoadSongs(musicFolder),
	Default = 1,
	Multi = false,
	Text = "Music List",
	Searchable = true,
})

-- Auto-update dropdown every 0.5s
task.spawn(function()
	while true do
		task.wait(0.5)
		if Options.MusicList then
			Options.MusicList.Values = LoadSongs(musicFolder)
		end
		-- Added auto-update for RemoveSound dropdown
		if Options.RemoveSound then
			Options.RemoveSound.Values = LoadSongs(musicFolder)
		end
	end
end)

-- Play Music (Order)
musicplayergroup:AddButton({
	Text = "Play Music (Order)",
	Func = function()
		local val = Options.MusicList.Value
		if not val then Library:Notify("Select a music first", 3) return end
		local id = val:match("%((%d+)%)")
		if id then PlaySound(id, val) end
	end,
})

-- Play Music (Shuffled)
musicplayergroup:AddButton({
	Text = "Play Music (Shuffled)",
	Func = function()
		local songs = LoadSongs(musicFolder)
		if #songs == 0 then Library:Notify("No songs found", 3) return end
		local pick = songs[math.random(1, #songs)]
		local id = pick:match("%((%d+)%)")
		if id then PlaySound(id, pick) end
	end,
})

-- Stop Music
musicplayergroup:AddButton({
	Text = "Stop Music",
	Func = function()
		if CurrentSound then
			CurrentSound:Destroy()
			CurrentSound = nil
			Library:Notify("Stopped music", 3)
		else
			Library:Notify("No music is playing", 3)
		end
	end,
})

-- Division Line
musicplayergroup:AddDivider()

-- Music ID & Name inputs
musicplayergroup:AddInput("MusicID", {Text="Music ID", Default="", Numeric=true, ClearTextOnFocus=true, Placeholder="Enter ID"})
musicplayergroup:AddInput("MusicName", {Text="Music Name", Default="", Numeric=false, ClearTextOnFocus=true, Placeholder="Enter Name"})

-- Add Music
musicplayergroup:AddButton({
	Text = "Add Music To Music List",
	Func = function()
		local id,name = Options.MusicID.Value, Options.MusicName.Value
		if id=="" or name=="" then Library:Notify("Fill both ID and Name",3) return end
		writefile(musicFolder.."/"..name..".txt","ID:"..id.."\nName:"..name)
		Library:Notify("Added: "..name,3)
	end,
})

-- Remove Sound Dropdown & Button
musicplayergroup:AddDropdown("RemoveSound", {
	Values = LoadSongs(musicFolder),
	Multi = true,
	Text = "Remove Sound",
	Searchable = true,
})

musicplayergroup:AddButton({
	Text = "Remove Selected Sound(s)",
	Func = function()
		local selections = Options.RemoveSound.Value
		if not selections or #selections==0 then Library:Notify("Select sound(s) to remove",3) return end
		for _, s in ipairs(selections) do
			local id = s:match("%((%d+)%)")
			local fname = s:match("(.+) %("..id.."%)")
			if id and fname and isfile(musicFolder.."/"..fname..".txt") then
				delfile(musicFolder.."/"..fname..".txt")
			end
		end
		Library:Notify("Removed selected sound(s)",3)
		Options.RemoveSound.Values = LoadSongs(musicFolder)
	end,
})

-- Updated config section to use separate tabbox for better organization
local musicconfigtabbox = Tabs["Fun"]:AddRightTabbox()
local musicconfigtab = musicconfigtabbox:AddTab("Music Config")

musicconfigtab:AddSlider("MusicSpeed", {Text="Playback Speed", Default=1, Min=0.5, Max=10, Rounding=1, Callback=function(val) if CurrentSound then CurrentSound.PlaybackSpeed=val end end})
musicconfigtab:AddSlider("MusicVolume",{Text="Volume",Default=1,Min=0.1,Max=10,Rounding=1,Callback=function(val) if CurrentSound then CurrentSound.Volume=val end end})
musicconfigtab:AddSlider("MusicPitch",{Text="Pitch",Default=1,Min=0.1,Max=10,Rounding=1,Callback=function(val) if CurrentSound then CurrentSound.Pitch=val end end})

-- Loop Play (Toggle converted to Checkbox as requested)
musicconfigtab:AddCheckbox("LoopPlay", {
	Text = "Music Looped",
	Default = false,
	Callback = function(val)
		if CurrentSound then CurrentSound.Looped = val end
		Library:Notify("Looping is now " .. (val and "Enabled" or "Disabled"), 3)
	end,
})

-- Added Example Songs group with predefined music library
local ExampleGroup = Tabs["Fun"]:AddLeftGroupbox("Example Songs","example-box")
local ExampleFolder = "unxhub/examples"

-- Create example folder
if not isfolder(ExampleFolder) then
	makefolder(ExampleFolder)
end

local ExampleSongs = {
	["Life Goes On!"]=7608899217,["Feels"]=8879155640,["Gangster Paradise"]=6070263388,
	["Faceoff – The Rock"]=7795812961,["Stay – Kid Laroi ft. Justin Bieber"]=9062549544,
	["Toxic"]=1842652230,["SAD – X"]=7707736242,["Moskau"]=135055100,["Xo tour Lif3"]=7823128741,
	["Tokyo Machine – Play"]=5410085763,["The Rolling Stones – Paint It, Black"]=6828176320,
	["Koven – All for Nothing"]=7024143472,["Chicken Nugget Dreamland"]=9245561450,["Drake – God's Plan"]=1665926924,
	["Maroon 5 – Moves Like Jagger"]=291895335,["Christopher Michael Walters – Everything"]=1837014514,
	["One Piece"]=1838028562,["Changing World (A)"]=1842471943,["Deep And Dirty"]=1836785943,
	["Knuckle"]=1842727209,["Portrait of You"]=7023435987,["Cyber Music"]=6911766512,
	["Michael Jackson – Smooth Criminal"]=4883181281,["Bensley"]=5410082273,["Face Off"]=7795812961,
	["Happy Music"]=1848239370,["Light It"]=1840006854,["I Want You To Be My Man"]=1839707917,
	["Lovely Day"]=1839481371,["Hallelujah"]=1846627271,["Labor of Love"]=1843541645,
	["Pushing Forward"]=1843528841,["Higher & Higher"]=1837256919,["Squid Game RLGL"]=7535587224,
	["Busybody"]=1839986001,["Danyka"]=7024233823,["I See Colors"]=7023720291,["Lil Mosey"]=10460286916
}

-- Write example songs to folder if not exist
for name,id in pairs(ExampleSongs) do
	local path = ExampleFolder.."/"..name..".txt"
	if not isfile(path) then
		writefile(path,"ID:"..id.."\nName:"..name)
	end
end

-- Dropdown for example songs
ExampleGroup:AddDropdown("ExampleList",{
	Values=LoadSongs(ExampleFolder),
	Default=1,
	Multi=false,
	Text="Example Songs",
	Searchable=true
})

-- Play Example
ExampleGroup:AddButton({Text="Play Example",Func=function()
	local val=Options.ExampleList.Value
	if not val then Library:Notify("Select a song",3) return end
	local id=val:match("%((%d+)%)")
	if id then PlaySound(id,val) end
end})

-- Stop Example
ExampleGroup:AddButton({Text="Stop Example",Func=function()
	if CurrentSound then CurrentSound:Destroy() CurrentSound=nil Library:Notify("Stopped music",3)
	else Library:Notify("No music is playing",3) end
end})

-- Loop Example checkbox
ExampleGroup:AddCheckbox("LoopExample",{Text="Loop Example",Default=false,Callback=function(val)
	if CurrentSound then CurrentSound.Looped=val end
	Library:Notify("Example Loop "..(val and "Enabled" or "Disabled"),3)
end})

Library:OnUnload(function()
	for player, _ in pairs(espobjects) do
		removeesp(player)
	end

	for _, player in pairs(Players:GetPlayers()) do
		removehighlight(player)
	end

	RunService:UnbindFromRenderStep("Tracers")
	RunService:UnbindFromRenderStep("SkeletonESP")

	if fovcircle then
		fovcircle:Remove()
	end

	for _, line in ipairs(tracerlines) do
		line:Destroy()
	end

	for _, line in ipairs(skeletonlines) do
		line:Destroy()
	end
end)

task.spawn(function()
	while true do
		task.wait()
		local character = LocalPlayer.Character
		if character and character:FindFirstChild("Humanoid") then
			character.Humanoid.WalkSpeed = currentwalkspeed
			character.Humanoid.JumpPower = currentjumppower
		end
		workspace.Gravity = currentgravity
	end
end)

RunService.RenderStepped:Connect(function()
	if espenabled then
		updateesp()
	end

	if outlineenabled then
		for userid, highlight in pairs(activehighlights) do
			if highlight then
				highlight.OutlineColor = espconfig.rainbowoutline and getrainbowcolor() or espconfig.outlinecolor
				highlight.FillColor = espconfig.rainbowoutline and getrainbowcolor() or espconfig.outlinefillcolor
			end
		end
	end

	updateaimlock()
	updatefovcircle()
end)

UserInputService.JumpRequest:Connect(function()
	if infinitejumpenabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

RunService.Heartbeat:Connect(function()
	if noclipenabled and LocalPlayer.Character then
		for _, part in pairs(LocalPlayer.Character:GetChildren()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

-- some loadstring calls :)

loadstring(game:HttpGet("https://raw.githubusercontent.com/not-gato/UNX/refs/heads/main/Modules/v2/Invite.lua",true))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/not-gato/UNX/refs/heads/main/Modules/v2/API.lua",true))()
Library.ToggleKeybind = Options.MenuKeybind

local player = Players.LocalPlayer
local exec = (type(identifyexecutor) == "function" and identifyexecutor()) or "Not Possible To Fetch Executor Name, Your Executor Probably Doesn't Support identifyexecutor()"

-- THIS SHOULD FIX THE FUCKING ERROR
if not player then
	player = Players.PlayerAdded:Wait()
end
