local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = true
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
	Title = "UNXHub",
	Footer = "Version: " .. (getgenv().unxshared and getgenv().unxshared.version or "Unknown") .. ", Game: " .. (getgenv().unxshared and getgenv().unxshared.gamename or "Unknown"),
	Icon = 123333102279908,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local Tabs = {
	Main = Window:AddTab("Main", "user"),
	Visuals = Window:AddTab("Visuals", "eye"),
	Features = Window:AddTab("Features", "bug"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Stats = game:GetService("Stats")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local currentwalkspeed = 16
local xrayenabled = false
local xraytransparency = 0.6
local originaltransparencies = {}
local noVelocityEnabled = false
local noVelocityConnection = nil
local bunnyHopEnabled = false
local bunnyHopDelay = 1
local bunnyHopConnection = nil

local originallighting = {
	Brightness = game.Lighting.Brightness,
	Ambient = game.Lighting.Ambient,
	OutdoorAmbient = game.Lighting.OutdoorAmbient,
	FogEnd = game.Lighting.FogEnd,
	FogStart = game.Lighting.FogStart
}

local espenabled = false
local outlineenabled = false
local tracersenabled = false
local skeletonenabled = false

local espconfig = {
	espcolor = Color3.fromRGB(255, 255, 255),
	outlinecolor = Color3.fromRGB(255, 255, 255),
	outlinefillcolor = Color3.fromRGB(255, 255, 255),
	tracercolor = Color3.fromRGB(255, 255, 255),
	skeletoncolor = Color3.fromRGB(255, 255, 255),
	espsize = 16,
	tracersize = 2,
	outlinetransparency = 0,
	outlinefilltransparency = 1,
	rainbowesp = false,
	rainbowoutline = false,
	rainbowtracers = false,
	rainbowskeleton = false,
	rainbowspeed = 5,
	tracerposition = "Bottom"
}

local rainbowhue = 0
local lastupdate = 0
local espobjects = {}
local activehighlights = {}
local playerconnections = {}
local tracerlines = {}
local skeletonlines = {}
local shieldedPlayers = {}

local aimlockenabled = false
local smoothaimlock = false
local aimlocktype = "Nearest Player"
local aimpart = "Head"
local fovenabled = false
local showfov = false
local fovsize = 100
local fovcolor = Color3.fromRGB(255, 255, 255)
local fovgui = nil
local fovframe = nil
local fovstroke = nil
local fovstrokethickness = 2
local nearestplayerdistance = 1000
local nearestmousedistance = 500
local fovlockdistance = 1000
local rainbowfov = false
local aimlockcertainplayer = false
local selectedplayer = nil
local ignoredplayers = {}
local prioritizedplayers = {}
local wallcheckenabled = true
local lerpalpha = 0.4
local aimlockOffsetX = 0
local aimlockOffsetY = 0
local ignoreShielded = true
local ignoreLobby = true

local autoFireEnabled = false
local autoFireDelay = 1.5
local autoFireShootDelay = 0.1
local nextFireTime = 0
local currentTarget = nil
local autoFireConnection = nil
local isFiring = false

local knifeCloseEnabled = false
local knifeRange = 10
local showKnifeRange = false
local knifeRangeColor = Color3.fromRGB(255, 255, 255)
local knifeRangeTransparency = 0.5
local rangeSphere = nil
local knifeConnection = nil
local lastKnifeState = nil
local SwapWeapon = nil
local knifeCrateCount = 0
local gunCrateCount = 0
local isOpeningCrates = false

local autoRespawnEnabled = false
local autoRespawnDelay = 0
local autoRespawnLastFire = 0
local CommandRemote = nil

local rgbGunKnifeEnabled = false
local rgbSpeed = 10
local rgbReapplySpeed = 1
local rgbHue = 0
local rgbConnection = nil
local rgbReapplyConnection = nil
local lastGunTool = nil
local rgbType = "Material"

local hitSfxId = ""
local critSfxId = ""
local autoApplySfx = false
local autoApplyDelay = 1
local autoApplyConnection = nil

local rgbAsyncEnabled = false
local rgbSyncHue = 0
local rgbSyncLastUpdate = 0
local rgbAsyncSpeed = 10
local rgbAsyncMode = "Backwards"

getgenv().RGB_ForceNeon = true

local inLobby = false

local function GetLocalHRP()
	if not LocalPlayer.Character then return nil end
	return LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
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

local function getSyncRainbowColor()
	local currenttime = tick()
	local speedmultiplier = 11 - rgbAsyncSpeed
	local increment = 0.001 * speedmultiplier
	if rgbAsyncMode == "Backwards" then increment = -increment end
	if currenttime - rgbSyncLastUpdate >= 0.1 then
		rgbSyncHue = (rgbSyncHue + increment) % 1
		rgbSyncLastUpdate = currenttime
	end
	return Color3.fromHSV(rgbSyncHue, 1, 1)
end

local function getPlayerWeapon(player)
	if not player.Character then return "None" end
	local tool = player.Character:FindFirstChildWhichIsA("Tool")
	if tool then return tool.Name end
	return "None"
end

local function createesp(player)
	if player == LocalPlayer or espobjects[player] then return end
	local nametext = Drawing.new("Text")
	nametext.Size = espconfig.espsize
	nametext.Center = true
	nametext.Outline = true
	nametext.Color = espconfig.espcolor
	nametext.Font = 2
	nametext.Visible = false
	espobjects[player] = { Name = nametext }
end

local function removeesp(player)
	if espobjects[player] then
		espobjects[player].Name:Remove()
		espobjects[player] = nil
	end
end

local function updateesp()
	for player, esp in pairs(espobjects) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = player.Character.HumanoidRootPart
			local pos, onscreen = Camera:WorldToViewportPoint(hrp.Position)
			local isShielded = shieldedPlayers[player]
			local color = isShielded and Color3.fromRGB(255, 0, 0) or (espconfig.rainbowesp and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or espconfig.espcolor)
			esp.Name.Color = color
			esp.Name.Size = espconfig.espsize
			if onscreen then
				local distance = (Camera.CFrame.Position - hrp.Position).Magnitude
				local weapon = getPlayerWeapon(player)
				local prefix = isShielded and "[SHIELDED] " or ""
				esp.Name.Position = Vector2.new(pos.X, pos.Y - 20)
				esp.Name.Text = prefix .. player.Name .. " | " .. math.floor(distance) .. " studs | " .. weapon
				esp.Name.Visible = true
			else
				esp.Name.Visible = false
			end
		else
			esp.Name.Visible = false
		end
	end
end

local function applyhighlighttocharacter(player, character)
	if not character then return end
	local userid = player.UserId
	if activehighlights[userid] then activehighlights[userid]:Destroy() end
	local highlighter = Instance.new("Highlight")
	highlighter.FillTransparency = espconfig.outlinefilltransparency
	highlighter.OutlineTransparency = espconfig.outlinetransparency
	highlighter.OutlineColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or espconfig.outlinecolor
	highlighter.FillColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or espconfig.outlinefillcolor
	highlighter.Adornee = character
	highlighter.Parent = character
	activehighlights[userid] = highlighter
end

local function setupplayerhighlight(player)
	local userid = player.UserId
	playerconnections[userid] = playerconnections[userid] or {}
	local function oncharacteradded(character)
		if not character then return end
		task.spawn(function()
			local humanoid = character:WaitForChild("Humanoid", 5)
			if not humanoid then return end
			if outlineenabled then applyhighlighttocharacter(player, character) end
			table.insert(playerconnections[userid], player:GetPropertyChangedSignal("TeamColor"):Connect(function()
				local highlight = activehighlights[userid]
				if highlight then
					highlight.OutlineColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or (player.TeamColor and player.TeamColor.Color) or espconfig.outlinecolor
				end
			end))
			table.insert(playerconnections[userid], humanoid.Died:Connect(function() removehighlight(player) end))
		end)
	end
	local charaddedconn = player.CharacterAdded:Connect(oncharacteradded)
	table.insert(playerconnections[userid], charaddedconn)
	if player.Character then oncharacteradded(player.Character) end
end

function removehighlight(player)
	local userid = player.UserId
	if activehighlights[userid] then activehighlights[userid]:Destroy() activehighlights[userid] = nil end
	if playerconnections[userid] then
		for _, conn in pairs(playerconnections[userid]) do if conn then conn:Disconnect() end end
		playerconnections[userid] = nil
	end
end

local function createtracers()
	tracerlines = {}
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local line = Drawing.new("Line")
			line.Thickness = espconfig.tracersize
			line.Transparency = 1
			line.Visible = false
			tracerlines[player] = line
		end
	end
end

local function updatetracers()
	local screenHeight = Camera.ViewportSize.Y
	local fromY
	if espconfig.tracerposition == "Bottom" then
		fromY = screenHeight
	elseif espconfig.tracerposition == "Middle" then
		fromY = screenHeight / 2
	elseif espconfig.tracerposition == "Up" then
		fromY = 0
	end
	for player, line in pairs(tracerlines) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local root = player.Character.HumanoidRootPart
			local screenpos, onscreen = Camera:WorldToViewportPoint(root.Position)
			local isShielded = shieldedPlayers[player]
			local color = isShielded and Color3.fromRGB(255, 0, 0) or (espconfig.rainbowtracers and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or espconfig.tracercolor)
			if onscreen then
				line.From = Vector2.new(Camera.ViewportSize.X / 2, fromY)
				line.To = Vector2.new(screenpos.X, screenpos.Y)
				line.Color = color
				line.Visible = true
			else
				line.Visible = false
			end
		else
			line.Visible = false
		end
	end
end

local function toggletracers()
	if tracersenabled then
		createtracers()
		RunService:BindToRenderStep("Tracers", Enum.RenderPriority.Camera.Value + 1, updatetracers)
	else
		RunService:UnbindFromRenderStep("Tracers")
		for _, line in pairs(tracerlines) do line:Remove() end
		tracerlines = {}
	end
end

local function createskeletonlines()
	skeletonlines = {}
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local lines = {}
			for i = 1, 6 do
				local line = Drawing.new("Line")
				line.Thickness = 2
				line.Transparency = 1
				line.Visible = false
				lines[i] = line
			end
			skeletonlines[player] = lines
		end
	end
end

local function updateskeleton()
	for player, lines in pairs(skeletonlines) do
		if player.Character then
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
			local isShielded = shieldedPlayers[player]
			local color = isShielded and Color3.fromRGB(255, 0, 0) or (espconfig.rainbowskeleton and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or espconfig.skeletoncolor)
			local function getscreen(part) if part then local pos, visible = Camera:WorldToViewportPoint(part.Position) if visible then return Vector2.new(pos.X, pos.Y) end end end
			local head = getscreen(parts.Head)
			local torso = getscreen(parts.Torso)
			local hip = getscreen(parts.Hip)
			local la = getscreen(parts.LeftArm)
			local ra = getscreen(parts.RightArm)
			local ll = getscreen(parts.LeftLeg)
			local rl = getscreen(parts.RightLeg)
			
			local connections = {
				{head, torso, lines[1]},
				{torso, hip, lines[2]},
				{torso, la, lines[3]},
				{torso, ra, lines[4]},
				{hip, ll, lines[5]},
				{hip, rl, lines[6]}
			}
			
			for _, conn in ipairs(connections) do
				local p1, p2, line = conn[1], conn[2], conn[3]
				if p1 and p2 then
					line.From = p1
					line.To = p2
					line.Color = color
					line.Visible = true
				else
					line.Visible = false
				end
			end
		else
			for _, line in ipairs(lines) do line.Visible = false end
		end
	end
end

local function toggleskeleton()
	if skeletonenabled then
		createskeletonlines()
		RunService:BindToRenderStep("SkeletonESP", Enum.RenderPriority.Camera.Value + 1, updateskeleton)
	else
		RunService:UnbindFromRenderStep("SkeletonESP")
		for _, lines in pairs(skeletonlines) do
			for _, line in ipairs(lines) do line:Remove() end
		end
		skeletonlines = {}
	end
end

local function applyShieldEffect(player)
	if player == LocalPlayer then return end
	shieldedPlayers[player] = true
	if activehighlights[player.UserId] then
		activehighlights[player.UserId].OutlineColor = Color3.fromRGB(255, 0, 0)
		activehighlights[player.UserId].FillColor = Color3.fromRGB(255, 0, 0)
	end
	task.delay(1.5, function()
		if shieldedPlayers[player] then
			shieldedPlayers[player] = nil
			if activehighlights[player.UserId] then
				activehighlights[player.UserId].OutlineColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or espconfig.outlinecolor
				activehighlights[player.UserId].FillColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or espconfig.outlinefillcolor
			end
		end
	end)
end

local function isShielded(player)
	return shieldedPlayers[player] == true
end

local function checkLobbyStatus()
	local team = LocalPlayer.Team
	if team then
		inLobby = (team.Name == "Lobby")
	else
		inLobby = false
	end
end

LocalPlayer:GetPropertyChangedSignal("Team"):Connect(checkLobbyStatus)
LocalPlayer:GetPropertyChangedSignal("TeamColor"):Connect(checkLobbyStatus)
checkLobbyStatus()

local function getclosestplayer()
	local localHRP = GetLocalHRP()
	if not localHRP then return nil end
	local mousePos = UserInputService:GetMouseLocation()

	local function getPriorityScore(player)
		if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return math.huge end
		if player == LocalPlayer or ignoredplayers[player.Name] or (ignoreShielded and isShielded(player)) or (ignoreLobby and player.Team and player.Team.Name == "Lobby") then return math.huge end

		local hrp = player.Character.HumanoidRootPart
		local screen, onscreen = Camera:WorldToViewportPoint(hrp.Position)
		if not onscreen then return math.huge end

		if fovenabled then
			local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
			local distFromCenter = (Vector2.new(screen.X, screen.Y) - center).Magnitude
			if distFromCenter > fovsize/2 then return math.huge end
			if (localHRP.Position - hrp.Position).Magnitude > fovlockdistance then return math.huge end
		end

		if wallcheckenabled then
			local head = player.Character:FindFirstChild("Head")
			if head then
				local origin = localHRP.Parent:FindFirstChild("Head") and localHRP.Parent.Head.Position or localHRP.Position
				local direction = head.Position - origin
				local rayParams = RaycastParams.new()
				rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
				rayParams.FilterType = Enum.RaycastFilterType.Exclude
				local result = workspace:Raycast(origin, direction, rayParams)
				if result then
					if not result.Instance:IsDescendantOf(player.Character) then
						return math.huge
					end
				end
			end
		end

		if aimlocktype == "Nearest Player" then
			return (localHRP.Position - hrp.Position).Magnitude
		else
			return (Vector2.new(screen.X, screen.Y) - mousePos).Magnitude
		end
	end

	local bestPlayer, bestScore = nil, math.huge
	for _, player in ipairs(prioritizedplayers) do
		local score = getPriorityScore(player)
		if score and score < bestScore then
			bestScore = score
			bestPlayer = player
		end
	end

	if bestPlayer then return bestPlayer end

	for _, player in ipairs(Players:GetPlayers()) do
		if table.find(prioritizedplayers, player) then continue end
		local score = getPriorityScore(player)
		if score and score < bestScore then
			bestScore = score
			bestPlayer = player
		end
	end

	return bestPlayer
end

local function getaimpartposition(targetplayer)
	if not targetplayer or not targetplayer.Character then return nil end
	if aimpart == "Head" and targetplayer.Character:FindFirstChild("Head") then
		return targetplayer.Character.Head.Position
	elseif aimpart == "Torso" then
		local torso = targetplayer.Character:FindFirstChild("UpperTorso") or targetplayer.Character:FindFirstChild("Torso")
		if torso then return torso.Position end
	elseif aimpart == "Feet" and targetplayer.Character:FindFirstChild("HumanoidRootPart") then
		return targetplayer.Character.HumanoidRootPart.Position + Vector3.new(0, -3, 0)
	end
	return nil
end

local aimlockConnection = nil

local function updateaimlock()
	local localHRP = GetLocalHRP()
	if not localHRP then return end
	
	checkLobbyStatus()
	if inLobby then return end

	local targetplayer = aimlockcertainplayer and selectedplayer or getclosestplayer()
	if targetplayer then
		local targetposition = getaimpartposition(targetplayer)
		if targetposition then
			targetposition = targetposition + Vector3.new(aimlockOffsetX, aimlockOffsetY, 0)
			local lookdirection = (targetposition - Camera.CFrame.Position).Unit
			if smoothaimlock then
				local targetcframe = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + lookdirection)
				Camera.CFrame = Camera.CFrame:Lerp(targetcframe, lerpalpha)
			else
				Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + lookdirection)
			end
		end
	end
end

local function startAimlockLoop()
	if aimlockConnection then return end
	aimlockConnection = RunService.RenderStepped:Connect(updateaimlock)
end

local function stopAimlockLoop()
	if aimlockConnection then
		aimlockConnection:Disconnect()
		aimlockConnection = nil
	end
end

local function updatefovcircle()
	if fovframe and fovstroke then
		if showfov then
			fovstroke.Color = rainbowfov and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or fovcolor
			fovframe.Visible = true
		else
			fovframe.Visible = false
		end
	end
end

local function toggleNoVelocity()
	if noVelocityEnabled then
		noVelocityConnection = RunService.Heartbeat:Connect(function()
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local hrp = player.Character.HumanoidRootPart
					hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				end
			end
		end)
	else
		if noVelocityConnection then noVelocityConnection:Disconnect() noVelocityConnection = nil end
	end
end

local function toggleBunnyHop()
	if bunnyHopEnabled then
		bunnyHopConnection = RunService.Heartbeat:Connect(function()
			local char = LocalPlayer.Character
			if not char or not char:FindFirstChild("Humanoid") then return end
			local humanoid = char.Humanoid

			if humanoid:GetState() == Enum.HumanoidStateType.Running and humanoid.FloorMaterial ~= Enum.Material.Air then
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				task.wait(bunnyHopDelay)
			end
		end)
	else
		if bunnyHopConnection then bunnyHopConnection:Disconnect() bunnyHopConnection = nil end
	end
end

local function updateKnifeRangeSphere()
	if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		if rangeSphere then rangeSphere.Transparency = 1 end
		return
	end
	local root = LocalPlayer.Character.HumanoidRootPart
	if showKnifeRange then
		if not rangeSphere then
			rangeSphere = Instance.new("Part")
			rangeSphere.Name = "KnifeRangeSphere"
			rangeSphere.Shape = Enum.PartType.Ball
			rangeSphere.Material = Enum.Material.ForceField
			rangeSphere.CanCollide = false
			rangeSphere.Anchored = true
			rangeSphere.CastShadow = false
			rangeSphere.Parent = workspace
		end
		rangeSphere.Size = Vector3.new(knifeRange * 2, knifeRange * 2, knifeRange * 2)
		rangeSphere.CFrame = root.CFrame
		rangeSphere.Color = knifeRangeColor
		rangeSphere.Transparency = knifeRangeTransparency
	else
		if rangeSphere then rangeSphere:Destroy() rangeSphere = nil end
	end
end

local function applyRGBToGun(toolModel, hue)
	if not toolModel then return end
	local faces = Enum.NormalId:GetEnumItems()
	local forceNeon = getgenv().RGB_ForceNeon == true
	for _, part in ipairs(toolModel:GetDescendants()) do
		if part:IsA("UnionOperation") or part:IsA("BasePart") then
			if rgbGunKnifeEnabled and forceNeon then
				part.Material = Enum.Material.Neon
			end
			if rgbGunKnifeEnabled then
				part.Color = Color3.fromHSV(hue, 1, 1)
				part.UsePartColor = true
				local light = part:FindFirstChildOfClass("SpotLight") or Instance.new("SpotLight")
				light.Color = Color3.fromHSV(hue, 1, 1)
				light.Range = 18
				light.Brightness = 5
				light.Face = faces[math.random(1, #faces)]
				light.Angle = 90
				light.Parent = part
			end
		end
	end
end

local function applyHighlightToTool(tool, hue)
	if not tool or not rgbGunKnifeEnabled or rgbType ~= "Highlight" then return end
	local highlight = tool:FindFirstChild("RGBHighlight") or Instance.new("Highlight")
	highlight.Name = "RGBHighlight"
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.FillColor = Color3.fromHSV(hue, 1, 1)
	highlight.OutlineColor = Color3.fromHSV(hue, 1, 1)
	highlight.Adornee = tool
	highlight.Parent = tool
end

local function toggleRGBGunKnife()
	if rgbGunKnifeEnabled then
		local localTool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
		if localTool then lastGunTool = localTool end
		rgbConnection = RunService.Heartbeat:Connect(function()
			rgbHue = (rgbHue + (rgbSpeed / 5000)) % 1
			if rgbAsyncEnabled then
				rgbHue = rgbSyncHue
			end
			if LocalPlayer.Character then
				for _, tool in ipairs(LocalPlayer.Character:GetChildren()) do
					if tool:IsA("Tool") then
						if rgbType == "Material" then
							for _, model in ipairs(tool:GetChildren()) do
								if model:IsA("Model") then
									applyRGBToGun(model, rgbHue)
								end
							end
						elseif rgbType == "Highlight" then
							applyHighlightToTool(tool, rgbHue)
						end
					end
				end
			end
		end)
		rgbReapplyConnection = RunService.Heartbeat:Connect(function()
			task.wait(rgbReapplySpeed)
			if lastGunTool and lastGunTool.Parent then
				if rgbType == "Material" then
					for _, model in ipairs(lastGunTool:GetChildren()) do
						if model:IsA("Model") then
							applyRGBToGun(model, rgbHue)
						end
					end
				elseif rgbType == "Highlight" then
					applyHighlightToTool(lastGunTool, rgbHue)
				end
			end
		end)
	else
		if rgbConnection then rgbConnection:Disconnect() rgbConnection = nil end
		if rgbReapplyConnection then rgbReapplyConnection:Disconnect() rgbReapplyConnection = nil end
		if lastGunTool then
			for _, model in ipairs(lastGunTool:GetDescendants()) do
				if model:IsA("BasePart") or model:IsA("UnionOperation") then
					local light = model:FindFirstChildOfClass("SpotLight")
					if light then light:Destroy() end
				end
			end
			local highlight = lastGunTool:FindFirstChild("RGBHighlight")
			if highlight then highlight:Destroy() end
		end
	end
end

local function anyEnemyInRange()
	local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not root then return false end
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local dist = (root.Position - plr.Character.HumanoidRootPart.Position).Magnitude
			if dist <= knifeRange then return true end
		end
	end
	return false
end

local function toggleKnifeSwitch()
	if knifeCloseEnabled then
		knifeConnection = RunService.Heartbeat:Connect(function()
			if not knifeCloseEnabled then return end
			local inRange = anyEnemyInRange()
			local shouldBeKnife = inRange
			if lastKnifeState == nil or lastKnifeState ~= shouldBeKnife then
				if SwapWeapon then SwapWeapon:Fire() end
				lastKnifeState = shouldBeKnife
			end
		end)
	else
		if knifeConnection then knifeConnection:Disconnect() knifeConnection = nil end
		lastKnifeState = nil
	end
end

local RollCrate = nil
local function openKnifeCrates()
	if isOpeningCrates then return end
	isOpeningCrates = true
	for i = 1, knifeCrateCount do
		if RollCrate then RollCrate:FireServer("KnifeCrate") end
		task.wait(0.1)
	end
	isOpeningCrates = false
end
local function openGunCrates()
	if isOpeningCrates then return end
	isOpeningCrates = true
	for i = 1, gunCrateCount do
		if RollCrate then RollCrate:FireServer("GunCrate") end
		task.wait(0.1)
	end
	isOpeningCrates = false
end

local function applyCustomSFX()
	local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
	if not playerGui then return end
	local effect = playerGui:FindFirstChild("Effect")
	if not effect then return end
	local hitSound = effect:FindFirstChild("Bang")
	local critSound = effect:FindFirstChild("Crit")
	if hitSound and hitSfxId ~= "" then hitSound.SoundId = "rbxassetid://" .. hitSfxId end
	if critSound and critSfxId ~= "" then critSound.SoundId = "rbxassetid://" .. critSfxId end
end

local function toggleAutoApplySFX()
	if autoApplySfx then
		autoApplyConnection = RunService.Heartbeat:Connect(function()
			task.wait(autoApplyDelay)
			applyCustomSFX()
		end)
	else
		if autoApplyConnection then autoApplyConnection:Disconnect() autoApplyConnection = nil end
	end
end

local AimWeapon = nil
local AimStateChanged = nil
local FireWeaponMobile = nil
local Sound_Request = nil
local CheckFire = nil
local CheckShot = nil
local ProjectileRender = nil
local ProjectileFinished = nil

local function waitForRemote(path, name)
	if not path or not name then return nil end
	while not path:FindFirstChild(name) do
		task.wait(0.1)
	end
	return path:FindFirstChild(name)
end

task.spawn(function()
	local signalEvents = ReplicatedStorage:WaitForChild("SignalManager", 10)
	if not signalEvents then return end
	signalEvents = signalEvents:WaitForChild("SignalEvents", 10)
	if not signalEvents then return end

	AimWeapon = waitForRemote(signalEvents, "AimWeapon")
	AimStateChanged = waitForRemote(signalEvents, "AimStateChanged")
	FireWeaponMobile = waitForRemote(signalEvents, "FireWeaponMoblie")
	
	local remotes = ReplicatedStorage:WaitForChild("Remotes", 10)
	if remotes then
		CommandRemote = waitForRemote(remotes, "Command")
		RollCrate = waitForRemote(remotes, "RollCrate")
	end
	
	local soundModule = ReplicatedStorage:FindFirstChild("SoundModule")
	if soundModule then
		Sound_Request = waitForRemote(soundModule, "Sound_RequestFromServer_C2S")
	end
	
	local clientRemotes = LocalPlayer:FindFirstChild("ClientRemotes")
	if clientRemotes then
		CheckFire = waitForRemote(clientRemotes, "CheckFire")
		CheckShot = waitForRemote(clientRemotes, "CheckShot")
	end
	
	local gunModules = ReplicatedStorage:FindFirstChild("ModuleScripts")
	if gunModules then
		gunModules = gunModules:FindFirstChild("GunModules")
		if gunModules then
			gunModules = gunModules:FindFirstChild("Remote")
			if gunModules then
				ProjectileRender = waitForRemote(gunModules, "ProjectileRender")
				ProjectileFinished = waitForRemote(gunModules, "ProjectileFinished")
			end
		end
	end
	
	SwapWeapon = waitForRemote(signalEvents, "SwapWeapon")
end)

local aiming = false
local function startAim(head)
	if aiming then return end
	if AimStateChanged then AimStateChanged:Fire(true) end
	if AimWeapon then AimWeapon:Fire(Enum.UserInputState.Begin) end
	Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
	aiming = true
end

local function stopAim()
	if not aiming then return end
	if AimStateChanged then AimStateChanged:Fire(false) end
	if AimWeapon then AimWeapon:Fire(Enum.UserInputState.End) end
	aiming = false
end

local function fireOnce(head)
	if isFiring then return end
	isFiring = true
	local ts = os.clock()
	local muz = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Torso") and LocalPlayer.Character.Torso.Position) or Camera.CFrame.Position
	local hit = head.Position
	local dir = (hit - muz).Unit
	local vel = dir * 800

	if Sound_Request then Sound_Request:FireServer(LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Torso") or Camera, "rbxassetid://3821795742") end
	if CheckFire then CheckFire:FireServer(ts, hit) end
	local cf = CFrame.lookAt(hit, muz)
	if CheckShot then CheckShot:FireServer(0,0,1,0.8, cf, muz, head, 6310, ts) end
	if ProjectileRender then ProjectileRender:FireServer(ts, LocalPlayer.Character, muz, vel, 130, 1, Vector3.zero, 5, "Bullet") end
	if FireWeaponMobile then
		FireWeaponMobile:Fire(Enum.UserInputState.Begin)
		task.wait(autoFireShootDelay)
		FireWeaponMobile:Fire(Enum.UserInputState.End)
	end
	task.delay(0.1, function()
		if ProjectileFinished then ProjectileFinished:FireServer(ts, head.CFrame, "Gib_T", false, 15, "rbxassetid://2814354338") end
	end)
	task.delay(autoFireDelay, function()
		isFiring = false
	end)
end

local function toggleAutoFire()
	if autoFireEnabled then
		currentTarget = nil
		nextFireTime = 0
		isFiring = false

		autoFireConnection = RunService.Heartbeat:Connect(function()
			if not autoFireEnabled then return end
			
			checkLobbyStatus()
			if inLobby then 
				if currentTarget then
					stopAim()
					currentTarget = nil
				end
				return 
			end
			
			local localHRP = GetLocalHRP()
			if not localHRP then 
				if currentTarget then
					stopAim()
					currentTarget = nil
				end
				return 
			end

			local targetplayer = aimlockcertainplayer and selectedplayer or getclosestplayer()
			if not targetplayer or not targetplayer.Character then
				if currentTarget then
					stopAim()
					currentTarget = nil
				end
				return
			end

			local head = targetplayer.Character:FindFirstChild("Head")
			if not head then
				if currentTarget then
					stopAim()
					currentTarget = nil
				end
				return
			end

			local hum = targetplayer.Character:FindFirstChild("Humanoid")
			if not hum or hum.Health <= 0 then
				if currentTarget then
					stopAim()
					currentTarget = nil
				end
				return
			end

			local origin = localHRP.Parent:FindFirstChild("Head") and localHRP.Parent.Head.Position or localHRP.Position
			local direction = head.Position - origin
			local rayParams = RaycastParams.new()
			rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
			rayParams.FilterType = Enum.RaycastFilterType.Exclude
			local result = workspace:Raycast(origin, direction, rayParams)
			if result and not result.Instance:IsDescendantOf(targetplayer.Character) then
				if currentTarget then
					stopAim()
					currentTarget = nil
				end
				return
			end

			if targetplayer ~= currentTarget then
				currentTarget = targetplayer
				startAim(head)
			end

			if not isFiring then
				fireOnce(head)
			end
		end)
	else
		if autoFireConnection then autoFireConnection:Disconnect() autoFireConnection = nil end
		currentTarget = nil
		isFiring = false
		stopAim()
	end
end

local function toggleAimlock()
	if aimlockenabled then
		startAimlockLoop()
	else
		stopAimlockLoop()
	end
end

LocalPlayer.CharacterAdded:Connect(function(char)
	aiming = false
	currentTarget = nil
end)

local statusGroup = Tabs.Main:AddRightGroupbox("Status", "info")
local healthLabel = statusGroup:AddLabel("Health: 0")
local versionLabel = statusGroup:AddLabel(
	"Version: " .. (getgenv().unxshared and getgenv().unxshared.version or "Unknown")
)
local fpsLabel = statusGroup:AddLabel("FPS: 0")
local pingLabel = statusGroup:AddLabel("Ping: 0")

local characterGroup = Tabs.Main:AddLeftGroupbox("Character", "user")
characterGroup:AddSlider("WalkSpeed", { Text = "WalkSpeed", Default = 20, Min = 20, Max = 24, Rounding = 1, Callback = function(v) currentwalkspeed = v end })
characterGroup:AddCheckbox("NoVelocity", { Text = "No Velocity", Default = false, Callback = function(v) noVelocityEnabled = v toggleNoVelocity() end })
characterGroup:AddCheckbox("BunnyHop", { Text = "Bunny Hop", Default = false, Callback = function(v) bunnyHopEnabled = v toggleBunnyHop() end })
characterGroup:AddSlider("BunnyHopDelay", { Text = "Bunny Hop Delay", Default = 1, Min = 0, Max = 5, Rounding = 2, Suffix = "s", Callback = function(v) bunnyHopDelay = v end })
characterGroup:AddDivider()
characterGroup:AddCheckbox("XRay", { Text = "X-Ray", Default = false, Callback = function(v) 
    xrayenabled = v 
    if v then 
        for _, obj in pairs(workspace:GetDescendants()) do 
            if obj:IsA("BasePart") and not obj:IsDescendantOf(LocalPlayer.Character) then 
                originaltransparencies[obj] = obj.Transparency 
                obj.Transparency = xraytransparency 
            end 
        end 
    else 
        for obj, t in pairs(originaltransparencies) do 
            if obj and obj.Parent then obj.Transparency = t end 
        end 
        originaltransparencies = {} 
    end 
end })
characterGroup:AddSlider("XRayTransparency", { Text = "X-Ray Transparency", Default = 60, Min = 0, Max = 100, Rounding = 1, Suffix = "%", Callback = function(v) 
    xraytransparency = v / 100 
    if xrayenabled then 
        for _, obj in pairs(workspace:GetDescendants()) do 
            if obj:IsA("BasePart") and not obj:IsDescendantOf(LocalPlayer.Character) and originaltransparencies[obj] then 
                obj.Transparency = v / 100 
            end 
        end 
    end 
end })

local otherGroup = Tabs.Main:AddLeftGroupbox("Other", "gamepad-2")
otherGroup:AddToggle("AutoRespawn", { Text = "Auto Respawn", Default = false, Callback = function(v) 
	autoRespawnEnabled = v 
	if v then
		task.spawn(function()
			while autoRespawnEnabled do
				if not workspace:FindFirstChild(LocalPlayer.Name) then
					if tick() - autoRespawnLastFire >= 1 then
						if CommandRemote then CommandRemote:FireServer("Play") end
						autoRespawnLastFire = tick()
					end
				end
				task.wait(autoRespawnDelay)
			end
		end)
	end
end })
otherGroup:AddSlider("AutoRespawnDelay", { 
	Text = "Auto Respawn Delay", 
	Default = 0, 
	Min = 0, 
	Max = 3, 
	Rounding = 2, 
	Suffix = "s", 
	Callback = function(v) 
		autoRespawnDelay = v 
	end 
})
otherGroup:AddDivider()
otherGroup:AddButton("Lobby", function() if CommandRemote then CommandRemote:FireServer("Lobby") end end)
otherGroup:AddButton("Play", function() if CommandRemote then CommandRemote:FireServer("Play") end end)

local esptabbox = Tabs.Visuals:AddLeftTabbox()
local esptab = esptabbox:AddTab("ESP")
local configtab = esptabbox:AddTab("Configurations")

esptab:AddCheckbox("ESP", { Text = "ESP", Default = false, Callback = function(v) 
    espenabled = v 
    if v then 
        for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then createesp(p) end end
        RunService:BindToRenderStep("ESPUpdate", Enum.RenderPriority.Camera.Value + 1, updateesp)
    else 
        for p, _ in pairs(espobjects) do removeesp(p) end
        RunService:UnbindFromRenderStep("ESPUpdate")
    end 
end }):AddColorPicker("ESPColor", { Default = Color3.fromRGB(255,255,255), Title = "ESP Color", Callback = function(v) espconfig.espcolor = v end })

esptab:AddCheckbox("Outline", { Text = "Outline", Default = false, Callback = function(v) 
    outlineenabled = v 
    if v then 
        for _, p in pairs(Players:GetPlayers()) do 
            if p ~= LocalPlayer then
                playerconnections[p.UserId] = {} 
                setupplayerhighlight(p) 
            end 
        end 
    else 
        for _, p in pairs(Players:GetPlayers()) do removehighlight(p) end 
    end 
end }):AddColorPicker("OutlineColor", { Default = Color3.fromRGB(255,255,255), Title = "Outline Color", Callback = function(v) espconfig.outlinecolor = v end })
   :AddColorPicker("OutlineFillColor", { Default = Color3.fromRGB(255,255,255), Title = "Fill Color", Callback = function(v) espconfig.outlinefillcolor = v end })

esptab:AddCheckbox("Tracers", { Text = "Tracers", Default = false, Callback = function(v) tracersenabled = v toggletracers() end }):AddColorPicker("TracerColor", { Default = Color3.fromRGB(255,255,255), Title = "Tracer Color", Callback = function(v) espconfig.tracercolor = v end })
esptab:AddCheckbox("SkeletonESP", { Text = "Skeleton ESP", Default = false, Callback = function(v) skeletonenabled = v toggleskeleton() end }):AddColorPicker("SkeletonColor", { Default = Color3.fromRGB(255,255,255), Title = "Skeleton Color", Callback = function(v) espconfig.skeletoncolor = v end })

configtab:AddCheckbox("RainbowESP", { Text = "Rainbow ESP", Default = false, Callback = function(v) espconfig.rainbowesp = v end })
configtab:AddCheckbox("RainbowOutline", { Text = "Rainbow Outline", Default = false, Callback = function(v) espconfig.rainbowoutline = v end })
configtab:AddCheckbox("RainbowTracers", { Text = "Rainbow Tracers", Default = false, Callback = function(v) espconfig.rainbowtracers = v end })
configtab:AddCheckbox("RainbowSkeleton", { Text = "Rainbow Skeleton ESP", Default = false, Callback = function(v) espconfig.rainbowskeleton = v end })
configtab:AddSlider("ESPSize", { Text = "ESP Size", Default = 16, Min = 16, Max = 48, Rounding = 1, Callback = function(v) espconfig.espsize = v end })
configtab:AddDropdown("TracerPosition", { Values = {"Bottom", "Middle", "Up"}, Default = 1, Text = "Tracer Position", Callback = function(v) espconfig.tracerposition = v end })
configtab:AddSlider("OutlineTransparency", { Text = "Outline Transparency", Default = 0, Min = 0, Max = 100, Rounding = 1, Suffix = "%", Callback = function(v) espconfig.outlinetransparency = v / 100 end })
configtab:AddSlider("OutlineFillTransparency", { Text = "Outline Fill Transparency", Default = 50, Min = 0, Max = 100, Rounding = 1, Suffix = "%", Callback = function(v) espconfig.outlinefilltransparency = v / 100 end })
configtab:AddSlider("RainbowSpeed", { Text = "Rainbow Speed", Default = 5, Min = 1, Max = 10, Rounding = 1, Callback = function(v) espconfig.rainbowspeed = v end })

local gamegroup = Tabs.Visuals:AddRightGroupbox("Game", "gamepad-2")
gamegroup:AddSlider("FieldOfView", { Text = "Field of View", Default = 70, Min = 60, Max = 120, Rounding = 1, Callback = function(v) Camera.FieldOfView = v end })
gamegroup:AddCheckbox("FullBright", { Text = "Full Bright", Default = false, Callback = function(v) 
    if v then 
        game.Lighting.Brightness = 2 
        game.Lighting.Ambient = Color3.fromRGB(255,255,255) 
        game.Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255) 
    else 
        game.Lighting.Brightness = originallighting.Brightness 
        game.Lighting.Ambient = originallighting.Ambient 
        game.Lighting.OutdoorAmbient = originallighting.OutdoorAmbient 
    end 
end })
gamegroup:AddCheckbox("NoFog", { Text = "No Fog", Default = false, Callback = function(v) 
    if v then 
        game.Lighting.FogEnd = 100000 
        game.Lighting.FogStart = 0 
    else 
        game.Lighting.FogEnd = originallighting.FogEnd 
        game.Lighting.FogStart = originallighting.FogStart 
    end 
end })

local aimlocktabbox = Tabs.Features:AddLeftTabbox()
local aimlocktab = aimlocktabbox:AddTab("AimLock")
local aimlockconfigtab = aimlocktabbox:AddTab("Configurations")

aimlocktab:AddCheckbox("AimLock", { Text = "Activate Aimlock", Default = false, Callback = function(v) 
	aimlockenabled = v 
	toggleAimlock() 
end })

aimlocktab:AddDropdown("AimLockType", { Values = {"Nearest Player", "Nearest Mouse"}, Default = 1, Text = "Aimlock Type", Callback = function(v) aimlocktype = v end })

aimlocktab:AddToggle("AutoFire", { Text = "Auto-Fire (W.I.P)", Default = false, Callback = function(v) 
	autoFireEnabled = v 
	toggleAutoFire() 
end })
aimlocktab:AddLabel("<font color='rgb(255,0,0)'><u>CAUTION:</u> This feature will maybe get u <b>DETECTED</b> or even <b>TEMPORARY BANNED</b>, as this feature is still W.I.P (Work in progress)!</font>", true)

aimlocktab:AddCheckbox("AimLockCertainPlayer", { Text = "Aimlock Certain Player", Default = false, Callback = function(v) aimlockcertainplayer = v end })
aimlocktab:AddDropdown("AimLockPlayerSelect", { SpecialType = "Player", ExcludeLocalPlayer = true, Text = "Select Player", Callback = function(v) selectedplayer = v end })

aimlocktab:AddCheckbox("EnableFOV", { Text = "Enable FOV", Default = false, Callback = function(v) 
    fovenabled = v 
    if v then Options.AimLockType.Disabled = true else Options.AimLockType.Disabled = false end 
end }):AddColorPicker("FOVColor", { Default = Color3.fromRGB(255,255,255), Title = "FOV Color", Callback = function(v) fovcolor = v end })

aimlocktab:AddCheckbox("ShowFOV", { Text = "Show FOV", Default = false, Callback = function(v) 
    showfov = v 
    if v then 
        if not fovgui then 
            fovgui = Instance.new("ScreenGui") 
            fovgui.Name = "FOVCircle" 
            fovgui.IgnoreGuiInset = true 
            fovgui.Parent = game:GetService("CoreGui") 
            fovframe = Instance.new("Frame") 
            fovframe.Name = "Circle" 
            fovframe.AnchorPoint = Vector2.new(0.5, 0.5) 
            fovframe.Position = UDim2.new(0.5, 0, 0.5, 0) 
            fovframe.BackgroundTransparency = 1
            fovframe.BorderSizePixel = 0 
            fovframe.Parent = fovgui 
            local corner = Instance.new("UICorner") 
            corner.CornerRadius = UDim.new(1, 0) 
            corner.Parent = fovframe 
            fovstroke = Instance.new("UIStroke") 
            fovstroke.Color = Color3.fromRGB(255,255,255) 
            fovstroke.Thickness = fovstrokethickness 
            fovstroke.Parent = fovframe 
            fovframe.Size = UDim2.new(0, fovsize, 0, fovsize) 
        end 
        fovframe.Visible = true 
    else 
        if fovframe then fovframe.Visible = false end 
    end 
end })

aimlockconfigtab:AddSlider("NearestPlayerDistance", { Text = "Nearest Player Lock Distance (Studs)", Default = 1000, Min = 10, Max = 5000, Rounding = 1, Callback = function(v) nearestplayerdistance = v end })
aimlockconfigtab:AddSlider("NearestMouseDistance", { Text = "Nearest Mouse Lock Distance (Studs)", Default = 500, Min = 10, Max = 5000, Rounding = 1, Callback = function(v) nearestmousedistance = v end })
aimlockconfigtab:AddSlider("FOVLockDistance", { Text = "FOV Lock Distance (Studs)", Default = 1000, Min = 50, Max = 5000, Rounding = 1, Callback = function(v) fovlockdistance = v end })
aimlockconfigtab:AddCheckbox("SmoothAimlock", { Text = "Smooth Aimlock", Default = false, Callback = function(v) smoothaimlock = v end })
aimlockconfigtab:AddSlider("SmoothAimlockSpeed", { Text = "Smooth Aimlock Speed (lerp alpha)", Default = 400, Min = 100, Max = 1000, Rounding = 0, Callback = function(v) lerpalpha = v / 1000 end })
aimlockconfigtab:AddCheckbox("IgnoreShielded", { Text = "Ignore Shielded", Default = true, Callback = function(v) ignoreShielded = v end })
aimlockconfigtab:AddCheckbox("IgnoreLobby", { Text = "Ignore Lobby", Default = true, Callback = function(v) ignoreLobby = v end })
aimlockconfigtab:AddDropdown("AimPart", { Values = {"Head", "Torso", "Feet"}, Default = 1, Text = "Aim Part", Callback = function(v) aimpart = v end })
aimlockconfigtab:AddCheckbox("RainbowFOV", { Text = "Rainbow FOV", Default = false, Callback = function(v) rainbowfov = v end })
aimlockconfigtab:AddSlider("FOVSize", { Text = "FOV Size", Default = 100, Min = 1, Max = 750, Rounding = 1, Callback = function(v) fovsize = v if fovframe then fovframe.Size = UDim2.new(0, v, 0, v) end end })
aimlockconfigtab:AddSlider("FOVStrokeThickness", { Text = "FOV Stroke Thickness", Default = 2, Min = 1, Max = 10, Rounding = 1, Callback = function(v) fovstrokethickness = v if fovstroke then fovstroke.Thickness = v end end })
aimlockconfigtab:AddSlider("AutoFireDelay", { Text = "Auto-Fire Delay (W.I.P)", Default = 1.5, Min = 1.5, Max = 3, Rounding = 2, Suffix = "s", Callback = function(v) autoFireDelay = v end })
aimlockconfigtab:AddSlider("AutoFireShootDelay", { Text = "Auto-Fire Shoot Delay (W.I.P)", Default = 0.1, Min = 0.1, Max = 1, Rounding = 2, Suffix = "s", Callback = function(v) autoFireShootDelay = v end })
aimlockconfigtab:AddDivider()
aimlockconfigtab:AddCheckbox("WallCheck", { Text = "Wall Check", Default = true, Callback = function(v) wallcheckenabled = v end })
aimlockconfigtab:AddDivider()

aimlockconfigtab:AddDropdown("IgnorePlayers", { 
    SpecialType = "Player", 
    ExcludeLocalPlayer = true, 
    Multi = true, 
    Text = "Ignore Players", 
    Callback = function(v) 
        ignoredplayers = {} 
        for p, s in pairs(v) do 
            if s then ignoredplayers[p.Name] = true end 
        end 
    end 
})

aimlockconfigtab:AddDropdown("PrioritizePlayers", { 
    SpecialType = "Player", 
    ExcludeLocalPlayer = true, 
    Multi = true, 
    Text = "Prioritize Players", 
    Tooltip = "Locks in mouse-distance order then others", 
    Callback = function(v) 
        prioritizedplayers = {} 
        for p, s in pairs(v) do 
            if s then table.insert(prioritizedplayers, p) end 
        end 
    end 
})

aimlockconfigtab:AddDivider()
aimlockconfigtab:AddLabel("Advanced Configurations")
aimlockconfigtab:AddSlider("AimlockOffsetY", { Text = "Aimlock Offset (Y)", Default = 0, Min = -1, Max = 1, Rounding = 2, Callback = function(v) aimlockOffsetY = v end })
aimlockconfigtab:AddSlider("AimlockOffsetX", { Text = "Aimlock Offset (X)", Default = 0, Min = -1, Max = 1, Rounding = 2, Callback = function(v) aimlockOffsetX = v end })

local featuresGroup = Tabs.Features:AddRightGroupbox("Features", "zap")
featuresGroup:AddToggle("KnifeCloseToggle", { Text = "Switch To Knife When Close To Player", Default = false, Callback = function(v) knifeCloseEnabled = v toggleKnifeSwitch() end })
featuresGroup:AddSlider("KnifeRange", { Text = "S.T.K.W.C.T.P. Range", Default = 10, Min = 1, Max = 50, Rounding = 1, Suffix = " studs", Callback = function(v) knifeRange = v updateKnifeRangeSphere() end })
featuresGroup:AddToggle("ShowKnifeRange", { Text = "Show S.T.K.W.C.T.P. Range", Default = false, Callback = function(v) showKnifeRange = v updateKnifeRangeSphere() end }):AddColorPicker("KnifeRangeColor", { Default = Color3.fromRGB(255,255,255), Title = "Range Color", Transparency = 0.5, Callback = function(v, t) knifeRangeColor = v knifeRangeTransparency = t or 0.5 updateKnifeRangeSphere() end })
featuresGroup:AddDivider()
featuresGroup:AddButton("Mass Open Knife Crate", openKnifeCrates)
featuresGroup:AddSlider("KnifeCrateCount", { Text = "Knife Crate Count To Open", Default = 0, Min = 0, Max = 25, Rounding = 1, Callback = function(v) knifeCrateCount = math.floor(v) end })
featuresGroup:AddButton("Mass Open Gun Crate", openGunCrates)
featuresGroup:AddSlider("GunCrateCount", { Text = "Gun Crate Count To Open", Default = 0, Min = 0, Max = 15, Rounding = 1, Callback = function(v) gunCrateCount = math.floor(v) end })

local funGroup = Tabs.Features:AddRightGroupbox("Fun", "party-popper")
funGroup:AddCheckbox("RGBAsync", { Text = "RGB ASync", Default = false, Callback = function(v) rgbAsyncEnabled = v end })
funGroup:AddSlider("RGBAsyncSpeed", { Text = "RGB ASync Speed", Default = 10, Min = 1, Max = 50, Rounding = 1, Callback = function(v) rgbAsyncSpeed = v end })
funGroup:AddDropdown("RGBAsyncMode", { Values = {"Forward", "Backwards"}, Default = 2, Text = "RGB ASync Spectrum Mode", Callback = function(v) rgbAsyncMode = v end })
funGroup:AddDivider()
funGroup:AddToggle("RGBGunKnife", { Text = "RGB Gun/Knife", Default = false, Callback = function(v) rgbGunKnifeEnabled = v toggleRGBGunKnife() end })
funGroup:AddSlider("RGBSpeed", { Text = "RGB Speed", Default = 10, Min = 1, Max = 50, Rounding = 0, Callback = function(v) rgbSpeed = v end })
funGroup:AddSlider("RGBReapplySpeed", { Text = "RGB Re-Apply Speed", Default = 1, Min = 0, Max = 5, Rounding = 1, Suffix = "s", Callback = function(v) rgbReapplySpeed = v end })
funGroup:AddDropdown("RGBType", { Values = {"Material", "Highlight"}, Default = 1, Text = "RGB Type", Callback = function(v) rgbType = v end })
funGroup:AddToggle("RGBForceNeon", { Text = "Change Material To Neon", Default = true, Callback = function(v) getgenv().RGB_ForceNeon = v end })
funGroup:AddDivider()
funGroup:AddInput("HitSFX", { Default = "", Text = "Hit SFX", Placeholder = "rbxassetid://...", Callback = function(v) hitSfxId = v:gsub("rbxassetid://", "") end })
funGroup:AddInput("CritSFX", { Default = "", Text = "Critical SFX", Placeholder = "rbxassetid://...", Callback = function(v) critSfxId = v:gsub("rbxassetid://", "") end })
funGroup:AddButton("Apply Custom SFX", applyCustomSFX)
funGroup:AddToggle("AutoApplySFX", { Text = "Auto Apply Custom SFX", Default = false, Callback = function(v) autoApplySfx = v toggleAutoApplySFX() end })
funGroup:AddSlider("AutoApplyDelay", { Text = "Auto Apply Delay", Default = 1, Min = 0, Max = 5, Rounding = 2, Suffix = "s", Callback = function(v) autoApplyDelay = v end })

Library:OnUnload(function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end)

local menugroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "settings")
menugroup:AddInput("DPIScale", { Default = "100", Text = "DPI Scale", Callback = function(v) local dpi = tonumber(v) if dpi then Library:SetDPIScale(dpi) end end })
menugroup:AddCheckbox("KeybindMenuOpen", { Default = Library.KeybindFrame.Visible, Text = "Open Keybind Menu", Callback = function(v) Library.KeybindFrame.Visible = v end })
menugroup:AddCheckbox("ShowCustomCursor", { Text = "Custom Cursor", Default = true, Callback = function(v) Library.ShowCustomCursor = v end })
menugroup:AddDropdown("NotificationSide", { Values = { "Left", "Right" }, Default = "Right", Text = "Notification Side", Callback = function(v) Library:SetNotifySide(v) end })
menugroup:AddDropdown("DPIDropdown", { Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" }, Default = "100%", Text = "DPI Scale", Callback = function(v) v = v:gsub("%%", "") local dpi = tonumber(v) Library:SetDPIScale(dpi) end })
menugroup:AddDivider()
menugroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "U", NoUI = true, Text = "Menu keybind"})
menugroup:AddButton("Unload", function() Library:Unload() end)
menugroup:AddLabel("<font color='rgb(255,0,0)'><u>DISCLAIMER</u></font>: We Use This To See How Many Users We Get, <u>We Do Not Share This Information With Any Third Partys</u>.", true)
menugroup:AddCheckbox("OptOutLog", {
	Text = "Opt-Out Log",
	Default = isfile("optout.unx"),
	Callback = function(Value)
		if Value then
			writefile("optout.unx", "")
			Library:Notify("Opt-Out Log Enabled", 3)
		else
			if isfile("optout.unx") then
				delfile("optout.unx")
			end
			Library:Notify("Opt-Out Log Disabled", 3)
		end
	end,
})

menugroup:AddDivider()
local showToggle = isfile("showtoggle.unx")
local toggleSize = 100
if isfile("togglesize.unx") then
	local sizeStr = readfile("togglesize.unx")
	toggleSize = tonumber(sizeStr) or 100
end

menugroup:AddToggle("CustomToggle", { 
	Text = "Custom Toggle", 
	Default = showToggle, 
	Callback = function(v) 
		if v then
			writefile("showtoggle.unx", "")
		else
			if isfile("showtoggle.unx") then
				delfile("showtoggle.unx")
			end
		end
		if button then button.Visible = v end
	end 
})

menugroup:AddSlider("CustomToggleSize", { 
	Text = "Custom Toggle Size (%)", 
	Default = toggleSize, 
	Min = 50, 
	Max = 200, 
	Rounding = 0, 
	Callback = function(v)
		writefile("togglesize.unx", tostring(v))
		local scale = v / 100
		if button then
			local base = math.clamp(math.min(workspace.CurrentCamera.ViewportSize.X, workspace.CurrentCamera.ViewportSize.Y) * 0.08, 50, 80)
			button.Size = UDim2.new(0, base * scale, 0, base * scale)
		end
	end 
})

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("unxhub")
SaveManager:SetFolder("unxhub")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])

Players.PlayerAdded:Connect(function(p)
	if p ~= LocalPlayer then
		if espenabled then createesp(p) end
		if outlineenabled then playerconnections[p.UserId] = {} setupplayerhighlight(p) end
		if tracersenabled then
			local line = Drawing.new("Line")
			line.Thickness = espconfig.tracersize
			line.Transparency = 1
			line.Visible = false
			tracerlines[p] = line
		end
		if skeletonenabled then
			local lines = {}
			for i = 1, 6 do
				local line = Drawing.new("Line")
				line.Thickness = 2
				line.Transparency = 1
				line.Visible = false
				lines[i] = line
			end
			skeletonlines[p] = lines
		end
		p.CharacterAdded:Connect(function(c)
			applyShieldEffect(p)
			if espenabled then task.wait(0.1) if not espobjects[p] then createesp(p) end end
			if outlineenabled then task.wait(0.1) applyhighlighttocharacter(p, c) end
		end)
	end
end)

Players.PlayerRemoving:Connect(function(p)
	removeesp(p)
	removehighlight(p)
	shieldedPlayers[p] = nil
	if tracerlines[p] then tracerlines[p]:Remove() tracerlines[p] = nil end
	if skeletonlines[p] then
		for _, line in ipairs(skeletonlines[p]) do line:Remove() end
		skeletonlines[p] = nil
	end
end)

for _, p in pairs(Players:GetPlayers()) do
	if p ~= LocalPlayer then
		p.CharacterAdded:Connect(function(c)
			applyShieldEffect(p)
			if espenabled then task.wait(0.1) if not espobjects[p] then createesp(p) end end
			if outlineenabled then task.wait(0.1) applyhighlighttocharacter(p, c) end
		end)
	end
end

RunService.RenderStepped:Connect(function(dt)
	fpsLabel:SetText("FPS: " .. math.floor(1 / dt))
	pingLabel:SetText("Ping: " .. math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) .. "ms")
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("Humanoid") then
		healthLabel:SetText("Health: " .. math.floor(char.Humanoid.Health))
	else
		healthLabel:SetText("Health: 0")
	end
	updateKnifeRangeSphere()
	if outlineenabled then
		for _, h in pairs(activehighlights) do
			if h then
				h.OutlineColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or espconfig.outlinecolor
				h.FillColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor()) or espconfig.outlinefillcolor
			end
		end
	end
	updatefovcircle()
end)

task.spawn(function()
	while true do
		task.wait()
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LocalPlayer.Character.Humanoid.WalkSpeed = currentwalkspeed
		end
	end
end)

Library.ToggleKeybind = Options.MenuKeybind

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomButtonGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999999999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = gethui and gethui() or game:GetService("CoreGui")

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HapticService = game:GetService("HapticService")

local button = Instance.new("ImageButton")
button.Name = "CustomButton"
button.Image = "rbxassetid://130346803512317"
button.BackgroundTransparency = 1
button.Position = UDim2.new(0.5, 0, 0, 50)
button.AnchorPoint = Vector2.new(0.5, 0)
button.Size = UDim2.new(0, 60, 0, 60)
button.ClipsDescendants = true
button.ZIndex = 999999999
button.Visible = showToggle
button.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = button

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Thickness = 2
uiStroke.Parent = button

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 140, 100)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 90, 65))
}
uiGradient.Rotation = 0
uiGradient.Parent = uiStroke

local function triggerSmallHaptic()
	if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
		local success, supported = pcall(function()
			return HapticService:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small)
		end)
		if success and supported then
			HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0.3)
			task.delay(0.06, function()
				HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0)
			end)
		end
	end
end

local currentInput = nil
local dragStartPos = nil
local isDragging = false
local dragThreshold = 8
local clickStartTime = 0

button.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		if currentInput then return end
		currentInput = input
		dragStartPos = input.Position
		isDragging = false
		clickStartTime = tick()
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == currentInput and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStartPos
		if delta.Magnitude > dragThreshold and not isDragging then
			isDragging = true
		end
		if isDragging then
			local newPos = UDim2.new(0, dragStartPos.X + delta.X, 0, dragStartPos.Y + delta.Y)
			TweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Position = newPos}):Play()
		end
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input == currentInput then
		local clickDuration = tick() - clickStartTime
		if not isDragging and clickDuration < 0.3 then
			Library:Toggle()
			triggerSmallHaptic()
			local pos = input.Position
			local absPos = button.AbsolutePosition
			local absSize = button.AbsoluteSize
			local relX = (pos.X - absPos.X) / absSize.X
			local relY = (pos.Y - absPos.Y) / absSize.Y
			local wave = Instance.new("ImageLabel")
			wave.Size = UDim2.new(0, 0, 0, 0)
			wave.Position = UDim2.new(relX, 0, relY, 0)
			wave.AnchorPoint = Vector2.new(0.5, 0.5)
			wave.BackgroundTransparency = 1
			wave.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
			wave.ImageColor3 = Color3.fromRGB(255, 255, 255)
			wave.ImageTransparency = 0.3
			wave.ZIndex = 999999999
			wave.Parent = button
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(1, 0)
			corner.Parent = wave
			local tween = TweenService:Create(wave, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
				Size = UDim2.new(2.5, 0, 2.5, 0),
				ImageTransparency = 1
			})
			tween:Play()
			task.delay(0.5, function() wave:Destroy() end)
		end
		currentInput = nil
		isDragging = false
	end
end)

button.MouseEnter:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
		Size = UDim2.new(0, button.Size.X.Offset * 1.08, 0, button.Size.Y.Offset * 1.08)
	}):Play()
end)

button.MouseEnter:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
		Size = UDim2.new(0, button.Size.X.Offset * 1.08, 0, button.Size.Y.Offset * 1.08)
	}):Play()
end)

button.MouseLeave:Connect(function()
	local size = math.clamp(math.min(workspace.CurrentCamera.ViewportSize.X, workspace.CurrentCamera.ViewportSize.Y) * 0.08, 50, 80)
	local scale = toggleSize / 100
	TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
		Size = UDim2.new(0, size * scale, 0, size * scale)
	}):Play()
end)

local function updateButtonSize()
	local base = math.clamp(math.min(workspace.CurrentCamera.ViewportSize.X, workspace.CurrentCamera.ViewportSize.Y) * 0.08, 50, 80)
	local scale = toggleSize / 100
	button.Size = UDim2.new(0, base * scale, 0, base * scale)
end

updateButtonSize()

workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateButtonSize)

if showToggle then
	button.Visible = true
end

local function isPCPlatform()
    return not (UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled)
end

if isPCPlatform() then
    button.Visible = showToggle
else
    print("NOT ON A PC!!!!, PASS!")
end

Library.ToggleKeybind = Options.MenuKeybind
