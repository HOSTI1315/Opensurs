

local success, content = pcall(function()
    return game:HttpGet("https://nexviewsservice.shardweb.app/services/nytherune_hub/start")
end)

local found = string.match(content or "", "reg") ~= nil
print("Checking the connection:", found)







game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer(table.unpack({
    [1] = "RolePlayBio",
    [2] = "Nytherune Hub 2",
}))

game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer(table.unpack({
    [1] = "RolePlayName",
    [2] = "[ Nytherune Hub User ]",
}))

game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer(table.unpack({
    [1] = "PickingRPBioColor",
    [2] = Color3.new(0, 0, 0),
}))

game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer(table.unpack({
    [1] = "PickingRPNameColor",
    [2] = Color3.new(255, 255, 255),
}))

local Libary = loadstring(game:HttpGet("https://raw.githubusercontent.com/wx-sources/NytheruneLibrary/refs/heads/main/Redzhubui.txt"))()
workspace.FallenPartsDestroyHeight = -math.huge

local Window = Libary:MakeWindow({
    Title = "🌌 Nytherune Hub 2.0.1 + 🌌 - New Update for Nytherune Brookhaven Script",
    SubTitle = "Updated - Brookhaven RP 🏡",
    LoadText = "Nytherune Developers",
    Flags = "Nytherune_Broookhaven"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://112577912202044", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local InfoTab = Window:MakeTab({ "Informations", "info" })

InfoTab:AddSection({ "Informations" })

InfoTab:AddSection({ "Credits" })
InfoTab:AddParagraph({ "Programmer:", "WxDeveloper" })
InfoTab:AddParagraph({ "Team:", "Nytherune Developers" })

InfoTab:AddSection({ "Internet Things" })
InfoTab:AddDiscordInvite({
    Name = "Nytherune Developers",
    Description = "Stay up to date with all the news from our Hub",
    Logo = "rbxassetid://112577912202044",
    Invite = "dsc.gg/nytherune",
})
InfoTab:AddDiscordInvite({
    Name = "👾 The Serverside Scripter 👾",
    Description = "YouTube channel",
    Logo = "rbxassetid://112577912202044",
    Invite = "https://youtube.com/@serverrside",
})


InfoTab:AddSection({ "Information" })
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local UserInputService = game:GetService("UserInputService")
local LocalizationService = game:GetService("LocalizationService")
local player = Players.LocalPlayer

local function getStatValue(parent, name)
    if parent then
        local obj = parent:FindFirstChild(name)
        if obj and obj.GetValue then
            local success, value = pcall(function() return obj:GetValue() end)
            if success then
                return math.floor(value)
            end
        end
    end
    return "Unidentified"
end

local info = {}

info["You Username:"] = player.Name or "Unidentified"
info["You Display Name:"] = player.DisplayName or "Unidentified"
info["You User Id:"] = player.UserId or "Unidentified"
info["You Account Age:"] = player.AccountAge or "Unidentified"

local netStats = Stats:FindFirstChild("Network")
local serverStats = netStats and netStats:FindFirstChild("ServerStatsItem")
info["You Ping:"] = (serverStats and getStatValue(serverStats, "Data Ping") .. " ms") or "Unidentified"

if identifyexecutor then
    local success, name, version = pcall(function() return identifyexecutor() end)
    info["You Executor:"] = success and (name .. (version and (" v" .. version) or "")) or "Unidentified"
else
    info["You Executor:"] = "Unidentified"
end

for key, value in pairs(info) do
    InfoTab:AddParagraph({key, tostring(value)})
end
InfoTab:AddParagraph({ "You Language:", "English" })
InfoTab:AddParagraph({ "You are Playing:", "Brookhaven RP 🏡" })
InfoTab:AddParagraph({ "You are Using:", "Nytherune Hub" })
InfoTab:AddParagraph({ "You are Using Version:", "2.0.1 - Updated" })

InfoTab:AddSection({ "Warns" })

InfoTab:AddSection({ "Others" })
InfoTab:AddButton({
    Name = "Rejoin",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r")

-- Function to spawn cars
local function spawnCar(name)
    Remote:FireServer("PickingCar", name)
end

-- Premium cars list (all you sent so far)
local premiumCars = {
    "Bugatti",
    "PartyBike",
    "GolfCartElectric4",
    "Ford4x4Truck",
    "Lamborgini",
    "DragBike",
    "Limo",
    "CopLamborgini",
    "Quad",
    "Ferrari",
    "Escalade",
    "GoKartPremium",
    "Bugatti",
    "NascarPremium",
    "Snowmobile",
    "TankPremium",
    "CyberTruck",
    "3WheelRacer",
    "RollsRoyce",
    "SuperCar",
    "Skyline",
    "HarleyDavison",
    "HummerLimo",
    "SemiPass",
    "Kawazaki",
    "RaptorMonster",
    "4DoorJeep",
    "SemiPool",
    "HighwayPatrol",
    "Buggy",
    "Baja",
    "Roadster",
    "SWAT",
    "Lamboego",
    "Hummer",
    "Benz",
    "Formula1"
}

-- Premium tab
local premiumTab = Window:MakeTab({ "Premium", "apple" })
premiumTab:AddSection({"All premium cars for free"})

-- Variable to store selected car
local selectedCar = premiumCars[1]

-- Dropdown with premium cars
premiumTab:AddDropdown({
  Name = "Select a premium car",
  Description = "Choose a car from the list",
  Options = premiumCars,
  Default = premiumCars[1],
  Flag = "dropdownPremiumCars",
  Callback = function(Value)
      selectedCar = Value
  end
})

-- Button to spawn selected car
premiumTab:AddButton({
    Name = "Spawn selected car",
    Callback = function()
        if selectedCar then
            spawnCar(selectedCar)
        end
    end
})




local AutoTab = Window:MakeTab({ "Auto Farm", "gift" })

AutoTab:AddSection({ "Auto Farm" })

AutoTab:AddSection({ "Events" })
AutoTab:AddParagraph({ "There are currently no active events..." })

local ShadersTab = Window:MakeTab({ "Shaders", "server" })

ShadersTab:AddSection({ "Shaders" })

ShadersTab:AddSection({ "Type 1 (Client-Sided)" })
ShadersTab:AddButton({
Name = "Enable Shaders (Irreversible)",
Callback = function()
local workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local model = workspace:FindFirstChild("Model")

if model then
	local function setMat(obj)
		for _, c in pairs(obj:GetChildren()) do
			if c:IsA("BasePart") then
				c.Material = Enum.Material.Basalt
			elseif c:IsA("Model") or c:IsA("Folder") then
				setMat(c)
			end
		end
	end
	if model:FindFirstChild("001_SnowStreet") then
		setMat(model["001_SnowStreet"])
	end
	if model:FindFirstChild("Street") then
		for _, o in pairs(model.Street:GetDescendants()) do
			if o:IsA("BasePart") then
				o.Material = Enum.Material.Basalt
			end
		end
	end
	for _, o in pairs(model:GetChildren()) do
		if o:IsA("BasePart") and (o.Name == "Sidewalk" or o.Name == "Wedge") and o.Material == Enum.Material.SmoothPlastic then
			o.Material = Enum.Material.Cobblestone
		end
	end
	model.ChildAdded:Connect(function(obj)
		if obj:IsA("BasePart") and (obj.Name == "Sidewalk" or obj.Name == "Wedge") and obj.Material == Enum.Material.SmoothPlastic then
			obj.Material = Enum.Material.Cobblestone
		end
	end)
end

local soundPart = Instance.new("Part")
soundPart.Size = Vector3.new(1,1,1)
soundPart.Transparency = 1
soundPart.Anchored = true
soundPart.CanCollide = false
soundPart.Parent = workspace
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local birdSound = Instance.new("Sound")
birdSound.Name = "BirdsSound"
birdSound.SoundId = "rbxassetid://1237969272"
birdSound.Looped = true
birdSound.Volume = 0.05
birdSound.Parent = soundPart

local wolfSound = Instance.new("Sound")
wolfSound.SoundId = "rbxassetid://6654360741"
wolfSound.Volume = 0.05
wolfSound.Looped = false
wolfSound.Parent = workspace

RunService.Heartbeat:Connect(function()
	if hrp and hrp.Parent then
		soundPart.Position = hrp.Position + Vector3.new(0,10,0)
	end
end)

local function isNight()
	local t = Lighting.ClockTime
	return (t >= 18 or t <= 6)
end

task.spawn(function()
	while true do
		if isNight() then
			if birdSound.IsPlaying then birdSound:Stop() end
			if wolfSound.IsPlaying then wolfSound:Stop() end
			wolfSound:Play()
		else
			if wolfSound.IsPlaying then wolfSound:Stop() end
			if not birdSound.IsPlaying then birdSound:Play() end
		end
		wait(20)
	end
end)

local fountainPart = Instance.new("Part")
fountainPart.Anchored = true
fountainPart.CanCollide = false
fountainPart.Transparency = 1
fountainPart.Size = Vector3.new(1,1,1)
fountainPart.Position = Vector3.new(-27,19,15)
fountainPart.Parent = workspace

local attachment = Instance.new("Attachment")
attachment.Position = Vector3.new(-27,19,15)
attachment.Parent = fountainPart

local fountainSound = Instance.new("Sound")
fountainSound.Name = "FountainSound"
fountainSound.SoundId = "rbxassetid://4766793559"
fountainSound.Looped = true
fountainSound.Volume = 0.03
fountainSound.EmitterSize = 10
fountainSound.RollOffMode = Enum.RollOffMode.Linear
fountainSound.MaxDistance = 100
fountainSound.Parent = attachment
fountainSound:Play()

local customSound = Instance.new("Sound")
customSound.Name = "MyCustomSound"
customSound.SoundId = "rbxassetid://9048659736"
customSound.Volume = 0.01
customSound.Looped = true
customSound.PlayOnRemove = false
customSound.Parent = workspace
customSound:Play()

local active = false
local stars = {}
local shootingStarsFolder = Instance.new("Folder",workspace)
shootingStarsFolder.Name = "ShootingStars"
local STAR_COUNT = 300
local SHOOTING_STAR_CHANCE = 0.3
local SHOOTING_STAR_MAX = 12
local shootingStarCooldown = 0.1

local spaceSound = Instance.new("Sound",workspace)
spaceSound.SoundId = "rbxassetid://1843520836"
spaceSound.Volume = 0.3
spaceSound.Looped = true
spaceSound.Name = "SpaceAmbience"

local function createStar()
	local star = Instance.new("Part")
	local size = math.random(1,3)*0.5
	star.Size = Vector3.new(size,size,size)
	star.Position = Vector3.new(math.random(-1000,1000),math.random(300,700),math.random(-1000,1000))
	star.Anchored = true
	star.CanCollide = false
	star.Material = Enum.Material.Neon
	local colors = {Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,180),Color3.fromRGB(180,200,255)}
	star.Color = colors[math.random(1,#colors)]
	star.Name = "Star"
	star.Parent = workspace
	local light = Instance.new("PointLight",star)
	light.Brightness = 2 + math.random()*1.5
	light.Range = 12
	spawn(function()
		while star.Parent and active do
			star.Transparency = 0.2 + math.sin(tick()*math.random(2,5))*0.2
			RunService.Heartbeat:Wait()
		end
		if star.Parent then star:Destroy() end
	end)
	table.insert(stars,star)
end

local function createShootingStar()
	if not active then return end
	local startPos = Vector3.new(math.random(-1000,1000),math.random(350,600),math.random(-1000,1000))
	local dir = Vector3.new(math.random(-1,1),math.random(-0.1,0.1),math.random(-1,1)).Unit
	local speed = math.random(350,550)
	local isFire = math.random() <= SHOOTING_STAR_CHANCE
	local color = isFire and Color3.fromRGB(255,50,50) or Color3.fromRGB(255,255,220)
	local trailColor = isFire and ColorSequence.new(Color3.fromRGB(255,120,0),Color3.fromRGB(255,230,50)) or ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,180))
	local star = Instance.new("Part")
	star.Size = Vector3.new(0.5,0.5,3)
	star.Position = startPos
	star.Anchored = true
	star.CanCollide = false
	star.Material = Enum.Material.Neon
	star.Color = color
	star.Name = "ShootingStar"
	star.Parent = shootingStarsFolder
	local att0 = Instance.new("Attachment",star)
	local att1 = Instance.new("Attachment",star)
	att1.Position = Vector3.new(0,0,-3)
	local trail = Instance.new("Trail",star)
	trail.Attachment0 = att0
	trail.Attachment1 = att1
	trail.Lifetime = 0.35
	trail.Color = trailColor
	trail.LightEmission = 1
	trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)})
	local light = Instance.new("PointLight",star)
	light.Brightness = isFire and 12 or 7
	light.Range = 35
	light.Color = color
	if isFire then
		local fire = Instance.new("Fire",star)
		fire.Heat = 15
		fire.Size = 3.5
		fire.Color = Color3.fromRGB(255,110,0)
		fire.SecondaryColor = Color3.fromRGB(255,210,0)
	end
	local lifetime = math.random(1,1.5)
	local timePassed = 0
	local moveConn
	moveConn = RunService.Heartbeat:Connect(function(dt)
		if not active then moveConn:Disconnect() if star.Parent then star:Destroy() end return end
		timePassed += dt
		if timePassed >= lifetime then moveConn:Disconnect() if star.Parent then star:Destroy() end return end
		local curve = math.sin(timePassed*20)*0.5
		star.Position += (dir+Vector3.new(0,curve,0)).Unit*speed*dt
	end)
	Debris:AddItem(star,4)
end

local function updateSky()
	local hour = Lighting.ClockTime
	local shouldBeActive = hour >= 18 or hour < 6
	if shouldBeActive and not active then
		active = true
		Lighting.FogColor = Color3.fromRGB(10,10,30)
		Lighting.FogEnd = 5000
		Lighting.Brightness = 2
		for _,s in ipairs(stars) do if s and s.Parent then s:Destroy() end end
		stars = {}
		for _,p in ipairs(shootingStarsFolder:GetChildren()) do p:Destroy() end
		for i=1,STAR_COUNT do createStar() end
		spaceSound:Play()
	elseif not shouldBeActive and active then
		active = false
		for _,s in ipairs(stars) do if s and s.Parent then s:Destroy() end end
		stars = {}
		for _,p in ipairs(shootingStarsFolder:GetChildren()) do p:Destroy() end
		spaceSound:Stop()
		Lighting.FogColor = Color3.fromRGB(192,192,192)
		Lighting.FogEnd = 100000
		Lighting.Brightness = 2
	end
end

task.spawn(function()
	while true do
		if active then
			for i=1,SHOOTING_STAR_MAX do
				createShootingStar()
				task.wait(shootingStarCooldown)
			end
		else
			task.wait(1)
		end
	end
end)

task.spawn(function()
	while true do
		updateSky()
		task.wait(1)
	end
end)

local rainFolder = Instance.new("Folder",workspace)
rainFolder.Name = "FakeRain"
local isRaining = false

local birds = Instance.new("Sound",SoundService)
birds.SoundId = "rbxassetid://9111139882"
birds.Volume = 0.2
birds.Looped = true
birds:Play()

local rainSound = Instance.new("Sound",SoundService)
rainSound.SoundId = "rbxassetid://9118823106"
rainSound.Volume = 0.3
rainSound.Looped = true
rainSound:Play()

local thunder = Instance.new("Sound",SoundService)
thunder.SoundId = "rbxassetid://9120018695"
thunder.Volume = 0.4

local function updateBirdSound()
	birds.Volume = isRaining and 0 or 0.2
end

local function spawnRain()
	isRaining = true
	updateBirdSound()
	for i=1,120 do
		local drop = Instance.new("Part")
		drop.Size = Vector3.new(0.1,2,0.1)
		drop.Anchored = true
		drop.CanCollide = false
		drop.Material = Enum.Material.Glass
		drop.Transparency = 0.5
		drop.Color = Color3.fromRGB(160,160,255)
		drop.Position = Vector3.new(math.random(-150,150),100,math.random(-150,150))
		drop.Parent = rainFolder
		local tween = TweenService:Create(drop,TweenInfo.new(1),{Position=drop.Position-Vector3.new(0,60,0)})
		tween:Play()
		Debris:AddItem(drop,1.5)
	end
	wait(1.5)
	isRaining = false
	updateBirdSound()
end

local function lightningStrike()
	local flash = Instance.new("Part")
	flash.Size = Vector3.new(1,1000,1)
	flash.Anchored = true
	flash.CanCollide = false
	flash.Transparency = 0.4
	flash.Material = Enum.Material.Neon
	flash.Color = Color3.new(1,1,1)
	flash.Position = Vector3.new(math.random(-100,100),500,math.random(-100,100))
	flash.Parent = workspace
	Lighting.Brightness = Lighting.Brightness + 1.5
	thunder:Play()
	wait(0.1)
	Lighting.Brightness = Lighting.Brightness - 1.5
	flash:Destroy()
end

for _,part in pairs(workspace:GetDescendants()) do
	if part:IsA("BasePart") and part.Material == Enum.Material.SmoothPlastic then
		part.Reflectance = 0.25
	end
end

task.spawn(function()
	while true do
		spawnRain()
		if math.random() < 0.2 then lightningStrike() end
		wait(1)
	end
end)

Lighting.Brightness = 2
Lighting.GlobalShadows = true
Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
Lighting.FogColor = Color3.fromRGB(120, 130, 140)
Lighting.FogStart = 80
Lighting.FogEnd = 600
Lighting.EnvironmentSpecularScale = 1
Lighting.EnvironmentDiffuseScale = 0.5

local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://159454299"
sky.SkyboxDn = "rbxassetid://159454296"
sky.SkyboxFt = "rbxassetid://159454293"
sky.SkyboxLf = "rbxassetid://159454286"
sky.SkyboxRt = "rbxassetid://159454300"
sky.SkyboxUp = "rbxassetid://159454304"
sky.Parent = Lighting

local color = Instance.new("ColorCorrectionEffect", Lighting)
color.Brightness = 0.03
color.Contrast = 0.15
color.Saturation = 0.05
color.TintColor = Color3.fromRGB(255, 240, 220)

local bloom = Instance.new("BloomEffect", Lighting)
bloom.Intensity = 0.8
bloom.Size = 56
bloom.Threshold = 0.9

local sunRays = Instance.new("SunRaysEffect", Lighting)
sunRays.Intensity = 0.05
sunRays.Spread = 0.8

local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
end
})

local TrollTab = Window:MakeTab({ "Trolling Map", "map" })

TrollTab:AddSection({ "Trolling Map" })
--[[
TrollTab:AddSection({ "Landmark" })
local Facs = {
    [1] = {Name = "House #1", Position = Vector3.new(260.29, 4.37, 209.32)},
    [2] = {Name = "House #2", Position = Vector3.new(234.49, 4.37, 228.00)},
    [3] = {Name = "House #3", Position = Vector3.new(262.79, 21.37, 210.84)},
    [4] = {Name = "House #4", Position = Vector3.new(229.60, 21.37, 225.40)},
    [5] = {Name = "House #5", Position = Vector3.new(173.44, 21.37, 228.11)},
    [6] = {Name = "House #6", Position = Vector3.new(-43, 21, -137)},
    [7] = {Name = "House #7", Position = Vector3.new(-40, 36, -137)},
    [11] = {Name = "House #11", Position = Vector3.new(-21, 40, 436)},
    [12] = {Name = "House #12", Position = Vector3.new(155, 37, 433)},
    [13] = {Name = "House #13", Position = Vector3.new(255, 35, 431)},
    [14] = {Name = "House #14", Position = Vector3.new(254, 38, 394)},
    [15] = {Name = "House #15", Position = Vector3.new(148, 39, 387)},
    [16] = {Name = "House #16", Position = Vector3.new(-17, 42, 395)},
    [17] = {Name = "House #17", Position = Vector3.new(-189, 37, -247)},
    [18] = {Name = "House #18", Position = Vector3.new(-354, 37, -244)},
    [19] = {Name = "House #19", Position = Vector3.new(-456, 36, -245)},
    [20] = {Name = "House #20", Position = Vector3.new(-453, 38, -295)},
    [21] = {Name = "House #21", Position = Vector3.new(-356, 38, -294)},
    [22] = {Name = "House #22", Position = Vector3.new(-187, 37, -295)},
    [23] = {Name = "House #23", Position = Vector3.new(-410, 68, -447)},
    [24] = {Name = "House #24", Position = Vector3.new(-348, 69, -496)},
    [28] = {Name = "House #28", Position = Vector3.new(-103, 12, 1087)},
    [29] = {Name = "House #29", Position = Vector3.new(-730, 6, 808)},
    [30] = {Name = "House #30", Position = Vector3.new(-245, 7, 822)},
    [31] = {Name = "House #31", Position = Vector3.new(639, 76, -361)},
    [32] = {Name = "House #32", Position = Vector3.new(-908, 6, -361)},
    [33] = {Name = "House #33", Position = Vector3.new(-111, 70, -417)},
    [34] = {Name = "House #34", Position = Vector3.new(230, 38, 569)},
    [35] = {Name = "House #35", Position = Vector3.new(-30, 13, 2209)}
}

local FacOP = {}
for id, data in pairs(Facs) do
    table.insert(FacOP, {ID = id, Name = data.Name})
end

table.sort(FacOP, function(a, b)
    local numA = tonumber(a.Name:match("%d+")) or 0
    local numB = tonumber(b.Name:match("%d+")) or 0
    return numA < numB
end)

TrollTab:AddDropdown({
        Name = "Select a House",
        Options = (function()
        local t = {}
        for _, v in ipairs(FacOP) do
            table.insert(t, v.Name)
        end
        return t
    end)(),
        Callback = function(selectedName)
local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        local FacID, FacPos
        for _, data in ipairs(FacOP) do
            if data.Name == selectedName then
                FacID = data.ID
                FacPos = Facs[FacID].Position
                break
            end
        end
        if not FacID or not FacPos then return end

        hrp.CFrame = CFrame.new(FacPos)
        
        task.wait(0.5)

        local args1 = {FacID}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Lot:Claim"):InvokeServer(unpack(args1))

        local args2 = {FacID, "001_Landmark"}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Lot:BuildProperty"):FireServer(unpack(args2))
    end
})

TrollTab:AddParagraph({ "Select a House to Spawn a Landmark", "If you get an error, restart your character or rejoin" })

TrollTab:AddSection({ "Skybox" })
TrollTab:AddButton({
   Name = "[OP] Apply Skybox",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/isdavidwork/Work-of-Scholl/refs/heads/main/scholl.txt"))()
end
})

TrollTab:AddButton({
   Name = "Remove Skybox",
   Callback = function()
local Remote = game:GetService("ReplicatedStorage").Remotes.ResetCharacterAppearance
firesignal(Remote.OnClientEvent)

game:GetService("ReplicatedStorage").Remotes.ResetCharacterAppearance:FireServer()

task.wait(0.5)

local player = game.Players.LocalPlayer
if player.Character and player.Character:FindFirstChild("Humanoid") then
player.Character.Humanoid.Health = 0
end
end
})

TrollTab:AddParagraph({ "Warn", "This is not visual, it applies directly to the shirt you are wearing" })
--]]
TrollTab:AddSection({ "Naruto" })

shinraSound = nil
cancelShinra = false

TrollTab:AddButton({
    Name = "[OP] Shinra Tensei - Pain",
    Callback = function()
local TextChatService = game:GetService("TextChatService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

cancelShinra = false

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then 
    TextChatService.TextChannels.RBXGeneral:SendAsync(
        "hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rShinra Tensei..."
    )
else 
end

task.spawn(function()
local player = game.Players.LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local root = player.Character.HumanoidRootPart

    local bodyPos = Instance.new("BodyPosition")
    bodyPos.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bodyPos.Position = root.Position
    bodyPos.Parent = root

    local targetUp = root.Position + Vector3.new(0, 10, 0)
    for i = 1, 10 do
        bodyPos.Position = bodyPos.Position:Lerp(targetUp, 0.1)
        task.wait(0.03)
    end

    task.wait(2)

    for i = 1, 10 do
        bodyPos.Position = bodyPos.Position:Lerp(root.Position, 0.1)
        task.wait(0.03)
    end
    
    bodyPos:Destroy()
end)

local RE = ReplicatedStorage:WaitForChild("RE")
local ClearEvent = RE:FindFirstChild("1Clea1rTool1s")
local ToolEvent = RE:FindFirstChild("1Too1l")
local FireEvent = RE:FindFirstChild("1Gu1n")

local function clearAllTools()
    if ClearEvent then
        ClearEvent:FireServer("ClearAllTools")
    end
end

local function getAssault()
    if ToolEvent then
        ToolEvent:InvokeServer("PickingTools", "Assault")
    end
end

local function hasAssault()
    return Player.Backpack:FindFirstChild("Assault") ~= nil
end

local function fireAtPart(targetPart)
    local gunScript = Player.Backpack:FindFirstChild("Assault")
        and Player.Backpack.Assault:FindFirstChild("GunScript_Local")

    if not gunScript or not targetPart then return end

    local args = {
        targetPart,
        targetPart,
        Vector3.new(1e14, 1e14, 1e14),
        targetPart.Position,
        gunScript:FindFirstChild("MuzzleEffect"),
        gunScript:FindFirstChild("HitEffect"),
        0,
        0,
        { false },
        {
            25,
            Vector3.new(100, 100, 100),
            BrickColor.new(29),
            0.25,
            Enum.Material.SmoothPlastic,
            0.25
        },
        true,
        false
    }

    FireEvent:FireServer(unpack(args))
end

local function fireAtAllPlayers(times)
    for i = 1, times do
        if cancelShinra then break end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                fireAtPart(player.Character.HumanoidRootPart)
                task.wait(0.1)
            end
        end
    end
end

local selectedAudioID = 127171723747143

task.spawn(function()
local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
if remote then
remote:FireServer(workspace, selectedAudioID, 1)
end

local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
if root then
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. selectedAudioID
sound.Volume = 1
sound.Looped = false
sound.Parent = root
sound:Play()
sound.Ended:Connect(function() sound:Destroy() end)
else
end
end)
            
task.spawn(function()
    while not cancelShinra do
        clearAllTools()
        getAssault()

        repeat
            task.wait(0.2)
        until hasAssault() or cancelShinra

        if not cancelShinra then
            fireAtAllPlayers(3)
            task.wait(1)
        end
    end
end)
end
})

TrollTab:AddButton({
    Name = "Cancel Shinra Tensei",
    Callback = function()
        cancelShinra = true
    
    if shinraSound then
            shinraSound:Stop()
            shinraSound:Destroy()
            shinraSound = nil
        end
    end
})

TrollTab:AddSection({ "Jujutsu Kaisen" })

cancelExpansion = false
expansionSound = nil
expansionModel = nil
originalSky = nil

TrollTab:AddButton({
    Name = "[OP] Domain Expansion - Gojo",
    Callback = function()
local TextChatService = game:GetService("TextChatService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

cancelExpansion = false

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then 
    TextChatService.TextChannels.RBXGeneral:SendAsync(
        "hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rDomain Expansion..."
    )
else 
end

local function ativarDominio()
    local char = Player.Character or Player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local dominio = Instance.new("Model", workspace)
    dominio.Name = "InfiniteVoid"
    expansionModel = dominio

    local esfera = Instance.new("Part")
    esfera.Shape = Enum.PartType.Ball
    esfera.Size = Vector3.new(300, 300, 300)
    esfera.Position = hrp.Position
    esfera.Anchored = true
    esfera.CanCollide = false
    esfera.Material = Enum.Material.ForceField
    esfera.Transparency = 0.3
    esfera.Color = Color3.fromRGB(0, 0, 0)
    esfera.Parent = dominio

    local luz = Instance.new("PointLight", esfera)
    luz.Color = Color3.fromRGB(0, 153, 255)
    luz.Brightness = 10
    luz.Range = 300

    local ps = Instance.new("ParticleEmitter", esfera)
    ps.Texture = "rbxassetid://243660364"
    ps.Color = ColorSequence.new(Color3.fromRGB(0, 153, 255))
    ps.LightEmission = 1
    ps.Size = NumberSequence.new(3)
    ps.Transparency = NumberSequence.new(0.2)
    ps.Rate = 1000
    ps.Lifetime = NumberRange.new(2)
    ps.Speed = NumberRange.new(0)
    ps.VelocitySpread = 180

    local som = Instance.new("Sound", esfera)
    som.SoundId = "rbxassetid://1843527678"
    som.Volume = 2
    som.Looped = true
    som:Play()
    expansionSound = som

    originalSky = Lighting:FindFirstChildOfClass("Sky")
    if originalSky then
        originalSky.Parent = nil
    end

    local newSky = Instance.new("Sky", Lighting)
    newSky.SkyboxBk = "rbxassetid://159454299"
    newSky.SkyboxDn = "rbxassetid://159454296"
    newSky.SkyboxFt = "rbxassetid://159454293"
    newSky.SkyboxLf = "rbxassetid://159454286"
    newSky.SkyboxRt = "rbxassetid://159454300"
    newSky.SkyboxUp = "rbxassetid://159454288"
end

ativarDominio()

local selectedAudioID = 140031333626044

task.spawn(function()
    while not cancelExpansion do
        local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
        if remote then
            remote:FireServer(workspace, selectedAudioID, 1)
        end

        local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. selectedAudioID
            sound.Volume = 1
            sound.Looped = false
            sound.Parent = root
            sound:Play()
            sound.Ended:Connect(function() sound:Destroy() end)
            task.wait(sound.TimeLength + 0.1)
        else
            break
        end
    end
end)

local RE = ReplicatedStorage:WaitForChild("RE")
local ClearEvent = RE:FindFirstChild("1Clea1rTool1s")
local ToolEvent = RE:FindFirstChild("1Too1l")
local FireEvent = RE:FindFirstChild("1Gu1n")

local function clearAllTools()
    if ClearEvent then
        ClearEvent:FireServer("ClearAllTools")
    end
end

local function getAssault()
    if ToolEvent then
        ToolEvent:InvokeServer("PickingTools", "Assault")
    end
end

local function hasAssault()
    return Player.Backpack:FindFirstChild("Assault") ~= nil
end

local function fireAtPart(targetPart)
    local gunScript = Player.Backpack:FindFirstChild("Assault")
        and Player.Backpack.Assault:FindFirstChild("GunScript_Local")

    if not gunScript or not targetPart then return end

    local args = {
        targetPart,
        targetPart,
        Vector3.new(1e14, 1e14, 1e14),
        targetPart.Position,
        gunScript:FindFirstChild("MuzzleEffect"),
        gunScript:FindFirstChild("HitEffect"),
        0,
        0,
        { false },
        {
            25,
            Vector3.new(100, 100, 100),
            BrickColor.new(29),
            0.25,
            Enum.Material.SmoothPlastic,
            0.25
        },
        true,
        false
    }

    FireEvent:FireServer(unpack(args))
end

local function fireAtAllPlayers(times)
    for i = 1, times do
        if cancelExpansion then break end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                fireAtPart(player.Character.HumanoidRootPart)
                task.wait(0.1)
            end
        end
    end
end

task.spawn(function()
    while not cancelExpansion do
        clearAllTools()
        getAssault()

        repeat
            task.wait(0.2)
        until hasAssault() or cancelExpansion

        if not cancelExpansion then
            fireAtAllPlayers(3)
            task.wait(1)
        end
    end
end)
end
})

TrollTab:AddButton({
    Name = "Cancel Domain Expansion",
    Callback = function()
        cancelExpansion = true

        if expansionSound then
            expansionSound:Stop()
            expansionSound:Destroy()
            expansionSound = nil
        end

        if expansionModel and expansionModel.Parent then
            expansionModel:Destroy()
            expansionModel = nil
        end

        local Lighting = game:GetService("Lighting")
        local currentSky = Lighting:FindFirstChildOfClass("Sky")
        if currentSky then currentSky:Destroy() end

        if originalSky then
            originalSky.Parent = Lighting
            originalSky = nil
        end
    end
})

TrollTab:AddSection({ "Natural Disasters" })
TrollTab:AddButton({
    Name = "[OP] Tornado - Pirate Ship (Large)",
    Callback = function()
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Vehicles = workspace:WaitForChild("Vehicles")

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then 
    TextChatService.TextChannels.RBXGeneral:SendAsync(
        "hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rTornado has appeared! Be careful..."
    )
else 
end

local selectedAudioID = 9068077052
local function playAudio()
    if not selectedAudioID then
        return
    end

    local args = {
        [1] = workspace,
        [2] = selectedAudioID,
        [3] = 1,
    }

    for i = 1, 5 do
        RS.RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))

        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. tostring(selectedAudioID)
        sound.Parent = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if sound.Parent then
            sound:Play()
        else
            break
        end

        task.wait(1.5)
        sound:Destroy()
    end
end

local function spawnBoat()
    RootPart.CFrame = CFrame.new(1754, -2, 58)
    task.wait(0.5)
    RS:WaitForChild("RE"):FindFirstChild("1Ca1r"):FireServer("PickingBoat", "PirateFree")
    task.wait(1)
    return Vehicles:FindFirstChild(Player.Name .. "Car")
end

local PCar = spawnBoat()
if not PCar then
    return
end

local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
if not Seat then
    return
end

repeat
    task.wait(0.1)
    RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
until Humanoid.SeatPart == Seat

task.spawn(playAudio)

task.delay(4, function()
    if Humanoid.SeatPart then
        Humanoid.Sit = false
    end
    RootPart.CFrame = CFrame.new(0, 0, 0)
end)

local RE_Flip = RS:WaitForChild("RE"):WaitForChild("1Player1sCa1r")
task.spawn(function()
    while PCar and PCar.Parent do
        RE_Flip:FireServer("Flip")
        task.wait(0.5)
    end
end)

local waypoints = {
    Vector3.new(-16, 0, -47),
    Vector3.new(-110, 0, -45),
    Vector3.new(16, 0, -55)
}

local currentIndex = 1
local nextIndex = 2
local moveSpeed = 15
local rotationSpeed = math.rad(720)
local progress = 0
local currentRotation = 0

local function lerpCFrame(a, b, t)
    return a:lerp(b, t)
end

RunService.Heartbeat:Connect(function(dt)
    if not (PCar and PCar.PrimaryPart) then return end

    local startPos = waypoints[currentIndex]
    local endPos = waypoints[nextIndex]

    progress += (moveSpeed * dt) / (startPos - endPos).Magnitude
    if progress >= 1 then
        progress = 0
        currentIndex = nextIndex
        nextIndex = (nextIndex % #waypoints) + 1
    end

    local newPos = lerpCFrame(CFrame.new(startPos), CFrame.new(endPos), progress).p
    currentRotation += rotationSpeed * dt

    local cf = CFrame.new(newPos) * CFrame.Angles(0, currentRotation, 0)
    PCar:SetPrimaryPartCFrame(cf)
end)
end
})

TrollTab:AddButton({
    Name = "Cancel Tornado",
    Callback = function()
        local success, err = pcall(function()
            local args = { "DeleteAllVehicles" }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
        end)

        if not success then
        else
        end
    end
})

TrollTab:AddSection({ "Others" })
TrollTab:AddButton({
    Name = "Black Hole",
    Description = "Activating this pulls Parts to your character",
    Callback = function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local angle = 1
local radius = 10
local blackHoleActive = false

local function setupPlayer()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local Folder = Instance.new("Folder", Workspace)
    local Part = Instance.new("Part", Folder)
    local Attachment1 = Instance.new("Attachment", Part)
    Part.Anchored = true
    Part.CanCollide = false
    Part.Transparency = 1

    return humanoidRootPart, Attachment1
end

local humanoidRootPart, Attachment1 = setupPlayer()

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(part)
        if typeof(part) == "Instance" and part:IsA("BasePart") and part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, part)
            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, part in pairs(Network.BaseParts) do
                if part:IsDescendantOf(Workspace) then
                    part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(1000000, 1000000, 1000000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = math.huge
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 500
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local function toggleBlackHole()
    blackHoleActive = not blackHoleActive
    if blackHoleActive then
        for _, v in next, Workspace:GetDescendants() do
            ForcePart(v)
        end

        Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
                ForcePart(v)
            end
        end)

        spawn(function()
            while blackHoleActive and RunService.RenderStepped:Wait() do
                angle = angle + math.rad(2)

                local offsetX = math.cos(angle) * radius
                local offsetZ = math.sin(angle) * radius

                Attachment1.WorldCFrame = humanoidRootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)
            end
        end)
    else
        Attachment1.WorldCFrame = CFrame.new(0, -1000, 0)
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    humanoidRootPart, Attachment1 = setupPlayer()
    if blackHoleActive then
        toggleBlackHole()
    end
end)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
local window = library:Window("Black Hole")

window:Slider("Radius Black Hole",1,100,10, function(Value)
   radius = Value
end)

window:Toggle("Toggle Black Hole", true, function(Value)
       if Value then
            toggleBlackHole()
        else
            blackHoleActive = false
        end
end)

spawn(function()
    while true do
        RunService.RenderStepped:Wait()
        if blackHoleActive then
            angle = angle + math.rad(angleSpeed)
        end
    end
end)

toggleBlackHole()
    end
})
TrollTab:AddButton({
    Name = "Bring Parts",
    Description = "To use, approach the Selected Player",
    Callback = function()
local Gui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Box = Instance.new("TextBox")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local Label = Instance.new("TextLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local Button = Instance.new("TextButton")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")

Gui.Name = "Gui"
Gui.Parent = gethui()
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = Gui
Main.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.335954279, 0, 0.542361975, 0)
Main.Size = UDim2.new(0.240350261, 0, 0.166880623, 0)
Main.Active = true
Main.Draggable = true

Box.Name = "Box"
Box.Parent = Main
Box.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
Box.BorderSizePixel = 0
Box.Position = UDim2.new(0.0980926454, 0, 0.218712583, 0)
Box.Size = UDim2.new(0.801089942, 0, 0.364963502, 0)
Box.FontFace = Font.new("rbxasset://fonts/families/SourceSansSemibold.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Box.PlaceholderText = "Player Name..."
Box.Text = ""
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.TextScaled = true
Box.TextSize = 31.000
Box.TextWrapped = true

UITextSizeConstraint.Parent = Box
UITextSizeConstraint.MaxTextSize = 31

Label.Name = "Label"
Label.Parent = Main
Label.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderSizePixel = 0
Label.Size = UDim2.new(1, 0, 0.160583943, 0)
Label.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Label.Text = "Bring Parts"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextScaled = true
Label.TextSize = 14.000
Label.TextWrapped = true

UITextSizeConstraint_2.Parent = Label
UITextSizeConstraint_2.MaxTextSize = 21

Button.Name = "Button"
Button.Parent = Main
Button.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.183284417, 0, 0.656760991, 0)
Button.Size = UDim2.new(0.629427791, 0, 0.277372271, 0)
Button.Font = Enum.Font.Nunito
Button.Text = "Bring Parts (Off)"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.TextSize = 28.000
Button.TextWrapped = true

UITextSizeConstraint_3.Parent = Button
UITextSizeConstraint_3.MaxTextSize = 28

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local character
local humanoidRootPart

mainStatus = true
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessedEvent then
		mainStatus = not mainStatus
		Main.Visible = mainStatus
	end
end)

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
	getgenv().Network = {
		BaseParts = {},
		Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
	}

	Network.RetainPart = function(Part)
		if Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
			table.insert(Network.BaseParts, Part)
			Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
			Part.CanCollide = false
		end
	end

	local function EnablePartControl()
		LocalPlayer.ReplicationFocus = Workspace
		RunService.Heartbeat:Connect(function()
			sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
			for _, Part in pairs(Network.BaseParts) do
				if Part:IsDescendantOf(Workspace) then
					Part.Velocity = Network.Velocity
				end
			end
		end)
	end

	EnablePartControl()
end

local function ForcePart(v)
	if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
		for _, x in ipairs(v:GetChildren()) do
			if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then
				x:Destroy()
			end
		end
		if v:FindFirstChild("Attachment") then
			v:FindFirstChild("Attachment"):Destroy()
		end
		if v:FindFirstChild("AlignPosition") then
			v:FindFirstChild("AlignPosition"):Destroy()
		end
		if v:FindFirstChild("Torque") then
			v:FindFirstChild("Torque"):Destroy()
		end
		v.CanCollide = false
		local Torque = Instance.new("Torque", v)
		Torque.Torque = Vector3.new(100000, 100000, 100000)
		local AlignPosition = Instance.new("AlignPosition", v)
		local Attachment2 = Instance.new("Attachment", v)
		Torque.Attachment0 = Attachment2
		AlignPosition.MaxForce = math.huge
		AlignPosition.MaxVelocity = math.huge
		AlignPosition.Responsiveness = 200
		AlignPosition.Attachment0 = Attachment2
		AlignPosition.Attachment1 = Attachment1
	end
end

local blackHoleActive = false
local DescendantAddedConnection

local function toggleBlackHole()
	blackHoleActive = not blackHoleActive
	if blackHoleActive then
		Button.Text = "Bring Parts (On)"
		for _, v in ipairs(Workspace:GetDescendants()) do
			ForcePart(v)
		end

		DescendantAddedConnection = Workspace.DescendantAdded:Connect(function(v)
			if blackHoleActive then
				ForcePart(v)
			end
		end)

		spawn(function()
			while blackHoleActive and RunService.RenderStepped:Wait() do
				Attachment1.WorldCFrame = humanoidRootPart.CFrame
			end
		end)
	else
		Button.Text = "Bring Parts (Off)"
		if DescendantAddedConnection then
			DescendantAddedConnection:Disconnect()
		end
	end
end

local function getPlayer(name)
	local lowerName = string.lower(name)
	for _, p in pairs(Players:GetPlayers()) do
		local lowerPlayer = string.lower(p.Name)
		if string.find(lowerPlayer, lowerName) then
			return p
		elseif string.find(string.lower(p.DisplayName), lowerName) then
			return p
		end
	end
end

local player = nil

local function VDOYZQL_fake_script() 
	local script = Instance.new('Script', Box)

	script.Parent.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			player = getPlayer(Box.Text)
			if player then
				Box.Text = player.Name
			else
			end
		end
	end)
end
coroutine.wrap(VDOYZQL_fake_script)()
local function JUBNQKI_fake_script()
	local script = Instance.new('Script', Button)

	script.Parent.MouseButton1Click:Connect(function()
		if player then
			character = player.Character or player.CharacterAdded:Wait()
			humanoidRootPart = character:WaitForChild("HumanoidRootPart")
			toggleBlackHole()
		else
		end
	end)
end
coroutine.wrap(JUBNQKI_fake_script)()
    end
})

local Tab = Window:MakeTab({
    Title = "Troll Players",
    Icon = "Bomb"
})


local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local LocalPlayer = Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local currentTarget = nil
local viewEnabled = false
local characterAddedConn = nil
local teleportLoop = nil
local LoopFling = false


local Targets = {""}


local function GetAndEquipCouch()
    local hasCouchInBackpack = false
    for _, v in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == "Couch" then
            hasCouchInBackpack = true
            v.Grip = CFrame.new(0, 2, -2.5)
            v.Parent = LocalPlayer.Character
            return true
        end
    end

    local args = {  
        [1] = "PickingTools",  
        [2] = "Couch"  
    }  
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))  
    
    local startTime = tick()  
    while tick() - startTime < 0.5 do  
        for _, v in ipairs(LocalPlayer.Backpack:GetChildren()) do  
            if v:IsA("Tool") and v.Name == "Couch" then  
                v.Grip = CFrame.new(0, 2, -2.5)  
                v.Parent = LocalPlayer.Character  
                return true  
            end  
        end  
        task.wait(0.1)  
    end  
    
    return false
end


local function GetPlayerNames()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(list, p.Name)
        end
    end
    table.sort(list)
    return list
end

local function resetCamera()
    if LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() then
        CurrentCamera.CameraSubject = LocalPlayer.Character
    end
end

local function tweenToTargetPart(part)
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local targetCFrame = part.CFrame + part.CFrame.LookVector * -10 + Vector3.new(0, 5, 0)
    local goal = {CFrame = CFrame.new(targetCFrame.Position, part.Position)}
    local tween = TweenService:Create(CurrentCamera, tweenInfo, goal)
    tween:Play()
end


function setViewTarget(targetName)
    local targetPlayer = Players:FindFirstChild(targetName)
    if not targetPlayer then
        warn("[VIEW] Jogador não encontrado.")
        return
    end

    currentTarget = targetPlayer

    if characterAddedConn then characterAddedConn:Disconnect() end

    characterAddedConn = targetPlayer.CharacterAdded:Connect(function(char)
        task.wait(0.1)
        if viewEnabled and currentTarget == targetPlayer then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                tweenToTargetPart(hrp)
                pcall(function() CurrentCamera.CameraSubject = char end)
            end
        end
    end)

    if targetPlayer.Character then
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            tweenToTargetPart(hrp)
            pcall(function() CurrentCamera.CameraSubject = targetPlayer.Character end)
        end
    end
end

function stopViewing()
    viewEnabled = false
    currentTarget = nil
    if characterAddedConn then
        characterAddedConn:Disconnect()
        characterAddedConn = nil
    end
    resetCamera()
end


local function GetPlayer(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        return "all"
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers, LocalPlayer) then 
            table.remove(GetPlayers, table.find(GetPlayers, LocalPlayer)) 
        end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _, x in next, Players:GetPlayers() do
            if x ~= LocalPlayer then
                if x.Name:lower():match("^"..Name) then
                    return x
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x
                end
            end
        end
    end
    return nil
end

local function SkidFling(TargetPlayer)
    local Character = LocalPlayer.Character
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
        
        
        
        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
        
        local SFBasePart = function(BasePart)
            local TimeToWait = 2
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
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        
        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
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
    end
end


RunService.RenderStepped:Connect(function()
    if viewEnabled and currentTarget then
        if not currentTarget:IsDescendantOf(game) then
            stopViewing()
            return
        end
        if currentTarget.Character and CurrentCamera.CameraSubject ~= currentTarget.Character then
            pcall(function()
                CurrentCamera.CameraSubject = currentTarget.Character
            end)
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    if player == LocalPlayer and LoopFling == true then
        LoopFling = false
        task.wait(1)
        LoopFling = true
    end
end)


local Dropdown = Tab:AddDropdown({
    Title = "Select Target",
    Desc = "Target For Methods Kill & Fling",
    Options = GetPlayerNames(),
    Callback = function (selected)
        Targets[1] = selected
        getgenv().Target = selected
    end,
    Default = "Strex999", 
    Flag = false,
    MultiSelect = false 
})

local UpdateButton = Tab:AddButton({
    Title = "Update Player List",
    Desc = "Refresh the target dropdown with current players", 
    Callback = function ()
        Dropdown:SetOptions(GetPlayerNames())
        print("Player list updated")
    end
})


local Section = Tab:AddSection({
    Title = "View Player & Teleport"
})


local Toggle = Tab:AddToggle({
    Title = "View Player  Select ",
    Desc = "View Target Player ( Dropwdom )",
    Callback = function (state)
        viewEnabled = state
        if state and getgenv().Target then
            setViewTarget(getgenv().Target)
        else
            stopViewing()
        end
    end,
    Default = false, 
    Flag = false
})


Tab:AddButton({
    Title = "Teleport Player",
    Desc = "Teleport Target Player", 
    Callback = function ()
       local success, err = pcall(function()
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hrp = character:FindFirstChild("HumanoidRootPart")

            if not hrp then return end

            local targetName = getgenv().Target
            if not targetName then
                warn("[GOTO] Nenhum alvo definido.")
                return
            end

            local targetPlayer = Players:FindFirstChild(targetName)
            if not targetPlayer or not targetPlayer.Character then
                warn("[GOTO] Alvo inválido ou não encontrado.")
                return
            end

            local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not targetHRP then
                warn("[GOTO] Alvo sem HumanoidRootPart.")
                return
            end

            local goal = {CFrame = targetHRP.CFrame + Vector3.new(2, 0, 2)}
            local tween = TweenService:Create(hrp, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal)
            tween:Play()
        end)

        if not success then
            warn("[GOTO] Erro ao teleportar:", err)
        end
        print("Teleported to target")
 print("Button Clicked")
    end
})


local Toggle = Tab:AddToggle({
    Title = "Loop Teleport",
    Desc = "Loop Teleport Player Select", 
    Callback = function (state)
        if state then
            teleportLoop = RunService.Stepped:Connect(function()
                local targetPlayer = Players:FindFirstChild(getgenv().Target)
                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2, 0, 2)
                    end
                end
            end)
        else
            if teleportLoop then
                teleportLoop:Disconnect()
                teleportLoop = nil
            end
        end
    end,
    Default = false, 
    Flag = false
})


local Section = Tab:AddSection({
    Title = "Fling & Bring ( Couch Methods )"
})


local Toggle = Tab:AddToggle({
    Title = "Fling Couch ( Beta )",
    Desc = "Couch Fling Player Target", 
    Callback = function (Value)
        if Value then
    LoopFling = true
    task.spawn(function()
        GetAndEquipCouch()
        
        while LoopFling do
            local hasCouch = false
            for _, v in ipairs(LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and v.Name == "Couch" then
                    hasCouch = true
                    break
                end
            end
            
            if not hasCouch then
                GetAndEquipCouch()
            end
            
            local targetName = Targets[1]
            if targetName and targetName ~= "" then
                local targetPlayer = GetPlayer(targetName)
                if targetPlayer and targetPlayer ~= LocalPlayer then
                    if targetPlayer.UserId ~= 0 then
                        while not targetPlayer.Character do
                            task.wait(1)
                        end
                        SkidFling(targetPlayer)
                    end
                end
            end
            task.wait(0.2)
        end
    end)
    workspace.FallenPartsDestroyHeight = 0/0
else
    LoopFling = false
    workspace.FallenPartsDestroyHeight = -500
end
    end,
    Default = false, 
    Flag = false
})


local bringActive = false


local Toggle = Tab:AddToggle({
    Title = "Couch Bring",
    Desc = "bring player (Select Dropwdom)",
    Callback = function (state)
        bringActive = state
        if state and Targets[1] then
            local target = Players:FindFirstChild(Targets[1])
            if not target or not target.Character then return end

            
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")

            local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            if not root or not tRoot then return end

            local char = Players.LocalPlayer.Character
            local hum = char:FindFirstChildOfClass("Humanoid")
            local originalPos = root.Position

            local tool = Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
            if tool then tool.Parent = char end

            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            hum.PlatformStand = false
            workspace.CurrentCamera.CameraSubject = tRoot

            local align = Instance.new("BodyPosition")
            align.Name = "BringPosition"
            align.MaxForce = Vector3.new(1/0, 1/0, 1/0)
            align.D = 10
            align.P = 30000
            align.Position = root.Position
            align.Parent = tRoot

            task.spawn(function()
                local angle = 0
                while bringActive and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
                    local tHum = target.Character:FindFirstChildOfClass("Humanoid")
                    if not tHum or tHum.Sit then break end

                    angle = angle + 50
                    root.CFrame = tRoot.CFrame * CFrame.new(0, 2, 0) * CFrame.Angles(math.rad(angle), 0, 0)
                    align.Position = root.Position + Vector3.new(2, 0, 0)
                    task.wait()
                end

                bringActive = false
                align:Destroy()
                hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                hum.PlatformStand = false
                workspace.CurrentCamera.CameraSubject = hum

                for _, p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then
                        p.Velocity = Vector3.zero
                        p.RotVelocity = Vector3.zero
                    end
                end

                task.wait(0.1)
                root.Anchored = true
                root.CFrame = CFrame.new(originalPos + Vector3.new(0, 5, 0))
                task.wait(0.2)
                root.Anchored = false

                
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
            end)
        end
    end,
    Default = false, 
    Flag = false
})


local Section = Tab:AddSection({
    Title = "Configs ( Fuctions )"
})


local Toggle = Tab:AddToggle({
    Title = "Speed Couch Fling",
    Desc = "more speed on Couch Fling", 
    Callback = function (Value)
        print("Activy", Value)
    end,
    Default = false, 
    Flag = false
})


local Toggle = Tab:AddToggle({
    Title = "Speed Couch Bring",
    Desc = "more speed on Couch Bring", 
    Callback = function (Value)
        print("Activy", Value)
    end,
    Default = false, 
    Flag = false
})


local Slider = Tab:AddSlider({
    Title = "Rotation Speed ( Couch Fling )",
    Desc = "Set Speed Couch Fling", 
    Min = 1,
    Max = 10000,
    Increase = 10,
    Callback = function (Value)
        print("Set Speed Couch !", Value)
    end,
    Flag = false,
    Default = 999
})


local Slider = Tab:AddSlider({
    Title = "Rotation Speed ( Couch Bring )",
    Desc = "Set Speed Couch Bring", 
    Min = 1,
    Max = 10000,
    Increase = 10,
    Callback = function (Value)
        print("Set Speed Couch !", Value)
    end,
    Flag = false,
    Default = 999
})


local Section = Tab:AddSection({
    Title = "Fast Fling & Ball Fling"
})

local function getPlayerList()
    local players = Players:GetPlayers()
    local playerNames = {}
    for _, player in ipairs(players) do
        if player ~= LocalPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local killDropdown = Tab:AddDropdown({
    Name = "Select Player",
    Options = getPlayerList(),
    Default = "Streex999",
    Callback = function(value)
        selectedPlayerName = value
        getgenv().Target = value
    end
})

Tab:AddButton({
    Name = "Update Player List",
    Callback = function()
        local tablePlayers = Players:GetPlayers()
        local newPlayers = {}
        if killDropdown and #tablePlayers > 0 then
            for _, player in ipairs(tablePlayers) do
                if player.Name ~= LocalPlayer.Name then
                    table.insert(newPlayers, player.Name)
                end
            end
            killDropdown:Set(newPlayers)
            if selectedPlayerName and not Players:FindFirstChild(selectedPlayerName) then
                selectedPlayerName = nil
                getgenv().Target = nil
                killDropdown:SetValue("")
            end
        end
    end
})


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local cam = workspace.CurrentCamera
local currentPlayers, selectedPlayer = {}, nil
local viewing = false
local flingActive = false

Tab:AddToggle({
    Name = "Fast Fling Couch ( Beta )",
    Default = false,
    Callback = function(state)
        flingActive = state
        if state and selectedPlayerName then
            local target = Players:FindFirstChild(selectedPlayerName)
            if not target or not target.Character then return end
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            if not root or not tRoot then return end
            local char = LocalPlayer.Character
            local hum = char:FindFirstChildOfClass("Humanoid")
            local original = root.CFrame

local args = {
	"ClearAllTools"
}
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))

task.wait(0.2)


            local args = {
                [1] = "PickingTools",
                [2] = "Couch"
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

            task.wait(0.3)
            local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
            if tool then
                tool.Parent = char
            end
				task.wait(0.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
task.wait(0.25)

            workspace.FallenPartsDestroyHeight = 0/0
            local bv = Instance.new("BodyVelocity")
            bv.Name = "FlingForce"
            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bv.MaxForce = Vector3.new(1/0, 1/0, 1/0)
            bv.Parent = root
            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            hum.PlatformStand = false
            cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

            task.spawn(function()
                local angle = 0
                local parts = {root}
                while flingActive and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
                    local tHum = target.Character:FindFirstChildOfClass("Humanoid")
                    if tHum.Sit then break end
                    angle += 50

                    for _, part in ipairs(parts) do
                        local pos_x = target.Character.HumanoidRootPart.Position.X
                        local pos_y = target.Character.HumanoidRootPart.Position.Y
                        local pos_z = target.Character.HumanoidRootPart.Position.Z
                        pos_x = pos_x + (target.Character.HumanoidRootPart.Velocity.X / 1.5)
                        pos_y = pos_y + (target.Character.HumanoidRootPart.Velocity.Y / 1.5)
                        pos_z = pos_z + (target.Character.HumanoidRootPart.Velocity.Z / 1.5)
                        root.CFrame = CFrame.new(pos_x, pos_y, pos_z) * CFrame.Angles(math.rad(angle), 0, 0)
                    end

                    root.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    task.wait()
                end
                flingActive = false
                bv:Destroy()
                hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                hum.PlatformStand = false
                root.CFrame = original
                cam.CameraSubject = hum
                for _, p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then
                        p.Velocity = Vector3.zero
                        p.RotVelocity = Vector3.zero
                    end
                end
                hum:UnequipTools()
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
            end)
        end
    end
})


local function FlingBall(target)

    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local hrp = character:WaitForChild("HumanoidRootPart")
    local backpack = player:WaitForChild("Backpack")
    local ServerBalls = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")

    local function GetBall()
        if not backpack:FindFirstChild("SoccerBall") then
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
        end
        repeat task.wait() until backpack:FindFirstChild("SoccerBall")
        backpack.SoccerBall.Parent = character
        repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)
        character.SoccerBall.Parent = backpack
        return ServerBalls:FindFirstChild("Soccer" .. player.Name)
    end

    local Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()
    Ball.CanCollide = false
    Ball.Massless = true
    Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

    if target ~= player then
        local tchar = target.Character
        if tchar and tchar:FindFirstChild("HumanoidRootPart") and tchar:FindFirstChild("Humanoid") then
            local troot = tchar.HumanoidRootPart
            local thum = tchar.Humanoid

            if Ball:FindFirstChildWhichIsA("BodyVelocity") then
                Ball:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
            end

            local bv = Instance.new("BodyVelocity")
            bv.Name = "FlingPower"
            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.P = 9e900
            bv.Parent = Ball

            workspace.CurrentCamera.CameraSubject = thum
            local StartTime = os.time()
            repeat
                if troot.Velocity.Magnitude > 0 then
                
                local pos_x = troot.Position.X + (troot.Velocity.X / 1.5)
                local pos_y = troot.Position.Y + (troot.Velocity.Y / 1.5)
                local pos_z = troot.Position.Z + (troot.Velocity.Z / 1.5)

                
                local position = Vector3.new(pos_x, pos_y, pos_z)
                Ball.CFrame = CFrame.new(position)
                Ball.Orientation += Vector3.new(45, 60, 30)
else
for i, v in pairs(tchar:GetChildren()) do
if v:IsA("BasePart") and v.CanCollide and not v.Anchored then
Ball.CFrame = v.CFrame
task.wait(1/6000)
end
end
end
                task.wait(1/6000)
            until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(workspace) or target.Parent ~= players
            workspace.CurrentCamera.CameraSubject = humanoid
        end
    end
end

Tab:AddButton({
    Name = "Ball Fling ( Target )",
    Callback = function()
        FlingBall(game:GetService("Players")[selectedPlayerName])
    end
})

local Players = game:GetService('Players')
local lplayer = Players.LocalPlayer

local function isItemInInventory(itemName)
    for _, item in pairs(lplayer.Backpack:GetChildren()) do
        if item.Name == itemName then
            return true
        end
    end
    return false
end

local function equipItem(itemName)
    local item = lplayer.Backpack:FindFirstChild(itemName)
    if item then
        lplayer.Character.Humanoid:EquipTool(item)
    end
end

local function unequipItem(itemName)
    local item = lplayer.Character:FindFirstChild(itemName)
    if item then
        item.Parent = lplayer.Backpack
    end
end

local function ActiveAutoFling(targetPlayer)
    if not isItemInInventory("Couch") then
        local args = { [1] = "PickingTools", [2] = "Couch" }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    end

    equipItem("Couch")
    getgenv().flingloop = true

    while getgenv().flingloop do
        local function flingloopfix()
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local AllBool = false

            local SkidFling = function(TargetPlayer)
                local Character = Player.Character
                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                local RootPart = Humanoid and Humanoid.RootPart
                local TCharacter = TargetPlayer.Character
                local THumanoid, TRootPart, THead, Accessory, Handle

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
                    if THumanoid and THumanoid.Sit and not AllBool then
                        unequipItem("Couch")
                        getgenv().flingloop = false
                        return
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
                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    end

                    local SFBasePart = function(BasePart)
                        local TimeToWait = 2
                        local Time = tick()
                        local Angle = 0
                        repeat
                            if RootPart and THumanoid then
                                if BasePart.Velocity.Magnitude < 50 then
                                    Angle = Angle + 100
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
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
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                end
                            else
                                break
                            end
                        until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait or getgenv().flingloop == false
                    end

                    workspace.FallenPartsDestroyHeight = 0/0
                    local BV = Instance.new("BodyVelocity")
                    BV.Name = "SpeedDoPai"
                    BV.Parent = RootPart
                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
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
                        RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                        Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                        Humanoid:ChangeState("GettingUp")
                        table.foreach(Character:GetChildren(), function(_, x)
                            if x:IsA("BasePart") then
                                x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                            end
                        end)
                        task.wait()
                    until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25

                    workspace.FallenPartsDestroyHeight = getgenv().FPDH
                end
            end

            if AllBool then
                for _, x in next, Players:GetPlayers() do
                    SkidFling(x)
                end
            end

            if targetPlayer then
                SkidFling(targetPlayer)
            end

            task.wait()
        end

        wait()
        pcall(flingloopfix)
    end
end

--[[     
local Section = Tab:AddSection({
    Title = "Fling - Block ( Beta )"
})


Tab:AddButton({
    Title = "Start Fling ( Block Target )",
    Desc = "Block Fling ( Nearst )", -- Optional
    Callback = function ()
      local function PullPart()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")

    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local player = LocalPlayer.Name
    local part = workspace["001_Lots"][player .. "House"].HousePickedByPlayer.HouseModel.Model.NoLockHouseDoor.Door

    part.Anchored = false
    part.CanCollide = false
    part.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
    part.Massless = true
    part.Velocity = Vector3.new(0, 0, 0)

    local function setNetworkOwner(part)
        if part:IsA("BasePart") and not part.Anchored then
            pcall(function()
                part:SetNetworkOwner(LocalPlayer)
            end)
        end
    end

    setNetworkOwner(part)

    local bambamPart = Instance.new("BodyAngularVelocity")
    bambamPart.Name = "FlingEffect_"..tostring(math.random(1000,9999))
    bambamPart.Parent = part
    bambamPart.AngularVelocity = Vector3.new(0, 99999, 0)
    bambamPart.MaxTorque = Vector3.new(0, math.huge, 0)
    bambamPart.P = math.huge

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Parent = part
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)

    RunService.Stepped:Connect(function()
        if part and humanoidRootPart then
            local direction = (humanoidRootPart.Position - part.Position).Unit * 50
            bodyVelocity.Velocity = direction
            
            if math.random() > 0.5 then
                bambamPart.AngularVelocity = Vector3.new(0, 99999, 0)
            else
                bambamPart.AngularVelocity = Vector3.new(0, 0, 0)
            end
            
            setNetworkOwner(part)
        end
    end)
end

local RunService = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local flinging = true

local function randomString()
    local length = math.random(10, 20)
    local chars = {}
    for i = 1, length do
        chars[i] = string.char(math.random(32, 126))
    end
    return table.concat(chars)
end

local function getRoot(char)
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
end

local function unfling()
    flinging = false
    if character then
        local root = getRoot(character)
        if root then
            local bambam = root:FindFirstChildOfClass("BodyAngularVelocity")
            if bambam then bambam:Destroy() end
        end
        
        for _, child in pairs(character:GetDescendants()) do
            if child:IsA("BasePart") then
                child.CustomPhysicalProperties = nil
                child.CanCollide = true
                child.Massless = false
            end
        end
    end
end

local noclipConnection
noclipConnection = RunService.Stepped:Connect(function()
    if character then
        for _, child in pairs(character:GetDescendants()) do
            if child:IsA("BasePart") then
                child.CanCollide = false
            end
        end
    else
        noclipConnection:Disconnect()
    end
end)

local function startFling()
    for _, child in pairs(character:GetDescendants()) do
        if child:IsA("BasePart") then
            child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
            child.Massless = true
            child.Velocity = Vector3.new(0, 0, 0)
        end
    end
    
    local bambam = Instance.new("BodyAngularVelocity")
    bambam.Name = randomString()
    bambam.Parent = getRoot(character)
    bambam.AngularVelocity = Vector3.new(0, 99999, 0)
    bambam.MaxTorque = Vector3.new(0, math.huge, 0)
    bambam.P = math.huge
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Died:Connect(unfling)
    end
    
    while flinging and character and character.Parent do
        bambam.AngularVelocity = Vector3.new(0, 99999, 0)
        task.wait(0.2)
        bambam.AngularVelocity = Vector3.new(0, 0, 0)
        task.wait(0.1)
    end
    
    unfling()
end

PullPart()
wait(3)
startFling()
  print("Button Clicked")
    end
})


Tab:AddButton({
    Title = "Disabled Fling Block ",
    Desc = "Stop Fling ( Block Methedos )", -- Optional
    Callback = function ()
        unfling()
print("Button Clicked")
    end
})


Tab:AddButton({
    Title = "Spawn ( Block For Fling )",
    Desc = "Spawn Block Fling For Methods", -- Optional
    Callback = function ()
       local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

humanoidRootPart.CFrame = CFrame.new(-189, 34, -253)

task.wait(1)

local args = {
    [1] = 17;
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("Lot:Claim", 9e9):InvokeServer(unpack(args))
task.wait(0.1)
local args = {
    [1] = 17;
    [2] = "016_House";
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("Lot:BuildProperty", 9e9):FireServer(unpack(args))
 print("Button Clicked")
    end
})


local Section = Tab:AddSection({
    Title = "Config For Methods ( Block )"
})


local Toggle = Tab:AddToggle({
    Title = "Pull Strength Block",
    Desc = "Pull Max Off Block Fling", -- Optional
    Callback = function (Value)
        print("Activy", Value)
    end,
    Default = false, 
    Flag = false
})


local Toggle = Tab:AddToggle({
    Title = "Fling Car ( Block )",
    Desc = "Fling Car Block when it gets close", -- Optional
    Callback = function (Value)
        print("Activy", Value)
    end,
    Default = false, 
    Flag = false
})


local Slider = Tab:AddSlider({
    Title = "distance for Block Fling player",
    Desc = "Set distance For Target", -- Optional
    Min = 1,
    Max = 20,
    Increase = 1,
    Callback = function (Value)
        print("Activy", Value)
    end,
    Flag = false,
    Default = 50
})


local Slider = Tab:AddSlider({
    Title = "stabilizes the block",
    Desc = "Set Stabilize For Block Fling", -- Optional
    Min = 1,
    Max = 20,
    Increase = 1,
    Callback = function (Value)
        print("Activy", Value)
    end,
    Flag = false,
    Default = 50
})


local Paragraph = Tab:AddParagraph({
    Title = "Warn",
    Text = "Block Fling is in ( Beta ) then it can't work very well !"
})
]]

local Section = Tab:AddSection({
    Title = "Kill Couch ( Player Select )"
})


local targetPlayer = nil
local playersTable = {}

local function getPlayersList()
    local list = {}
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            table.insert(list, v.Name)
        end
    end
    return list
end

local function updateDropdown()
    playersTable = getPlayersList()
end

local TargetDropdown = Tab:AddDropdown({
    Title = "Select Target",
    Description = "Choose player to kill",
    Options = getPlayersList(),
    Multi = false,
    Default = 1,
    Callback = function(Value)
        targetPlayer = Value
    end
})

local function refreshPlayerList()
    local newList = getPlayersList()
    TargetDropdown:Refresh(newList, true)
end

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

local function executeKill()
    if not targetPlayer then
        return
    end
    
    local target = nil
    for _, v in pairs(Players:GetPlayers()) do
        if v.Name == targetPlayer then
            target = v
            break
        end
    end
    
    if not target or not target.Character then
        return
    end

    local myChar = LocalPlayer.Character
    if not myChar then
        return
    end
    
    local humanoid = myChar:FindFirstChildOfClass("Humanoid")
    local rootPart = myChar:FindFirstChild("HumanoidRootPart")
    local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not rootPart or not targetRoot then
        return
    end

    local startPos = rootPart.Position
    local deathPos = Vector3.new(145.51, -350.09, 21.58)

    pcall(function()
        ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
    end)
    
    wait(0.2)
    
    pcall(function()
        ReplicatedStorage.RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
    end)
    
    wait(0.3)

    local couchTool = LocalPlayer.Backpack:FindFirstChild("Couch")
    if couchTool then
        couchTool.Parent = myChar
    end
    
    wait(0.1)
    
    pcall(function()
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
    end)
    
    wait(0.1)

    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    humanoid.PlatformStand = false
    
    if target.Character:FindFirstChild("Head") then
        cam.CameraSubject = target.Character.Head
    end

    local bodyPos = Instance.new("BodyPosition")
    bodyPos.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyPos.Position = rootPart.Position
    bodyPos.Parent = targetRoot

    spawn(function()
        local rotation = 0
        local timeStart = tick()
        
        while tick() - timeStart < 5 do
            if not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then
                break
            end
            
            local targetHum = target.Character:FindFirstChildOfClass("Humanoid")
            if targetHum and targetHum.Sit then
                break
            end

            rotation = rotation + 50
            local targetPos = targetRoot.Position + Vector3.new(0, 2, 0)
            
            rootPart.CFrame = CFrame.new(targetPos) * CFrame.Angles(math.rad(rotation), 0, 0)
            bodyPos.Position = rootPart.Position + Vector3.new(2, 0, 0)

            wait()
        end

        if bodyPos then
            bodyPos:Destroy()
        end
        
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        cam.CameraSubject = humanoid

        for _, part in pairs(myChar:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Velocity = Vector3.new(0, 0, 0)
                part.RotVelocity = Vector3.new(0, 0, 0)
            end
        end

        wait(0.1)
        rootPart.CFrame = CFrame.new(deathPos)
        wait(0.3)

        local tool = myChar:FindFirstChild("Couch")
        if tool then
            tool.Parent = LocalPlayer.Backpack
        end

        wait(0.1)
        pcall(function()
            ReplicatedStorage.RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
        end)
        
        wait(0.2)
        rootPart.CFrame = CFrame.new(startPos)
    end)
end

Tab:AddButton({
    Title = "Kill Target",
    Description = "Execute kill on selected player",
    Callback = function()
        executeKill()
    end
})


local Section = Tab:AddSection({
    Title = "Config ( Kill Fuction )"
})


local Slider = Tab:AddSlider({
    Title = "Speed Kill ( Beta )",
    Desc = "Set Speed On Kill", 
    Min = 1,
    Max = 99999,
    Increase = 10,
    Callback = function (Value)
        print("Set Kill Speed", Value)
    end,
    Flag = false,
    Default = 9999
})


local Slider = Tab:AddSlider({
    Title = "Speed Teleport  ( Kill )",
    Desc = "Set Teleport On Kill", 
    Min = 1,
    Max = 99999,
    Increase = 10,
    Callback = function (Value)
        print("Set Kill Speed", Value)
    end,
    Flag = false,
    Default = 9999
})


local Section = Tab:AddSection({
    Title = "Car ( Methods & Fuctions)"
})


local function GetPlayerNames()
    local playerNames = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    if #playerNames == 0 then
        table.insert(playerNames, "No players found")
    end
    return playerNames
end

local TargetDropdown = Tab:AddDropdown({
    Title = "Select target",
    Desc = "Select Player For Methods", 
    Options = GetPlayerNames(),
    Callback = function(selected)
        if selected ~= "No players found" then
            getgenv().Target = selected
        end
    end,
    Default = 1,
    Flag = "TargetPlayer",
    MultiSelect = false
})

local function UpdateDropdown()
    local newOptions = GetPlayerNames()
    TargetDropdown:Refresh(newOptions, true)
end


local UpdateButton = Tab:AddButton({
    Title = "Update Player List",
    Desc = "Manually refresh the player dropdown list",
    Callback = function()
        UpdateDropdown()
        print("Player list updated!")
    end
})


game.Players.PlayerAdded:Connect(function(player)
    wait(0.1)
    UpdateDropdown()
end)


game.Players.PlayerRemoving:Connect(function(player)
    wait(0.1)
    UpdateDropdown()
end)



local function GetPlayerNames()
    local playerNames = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    if #playerNames == 0 then
        table.insert(playerNames, "No players found")
    end
    return playerNames
end

local function ExecuteStelariumBus()
    local player = game.Players.LocalPlayer
    local rs = game:GetService("ReplicatedStorage")
    local ws = game:GetService("Workspace")
    local runService = game:GetService("RunService")

    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")

    if not hrp or not humanoid then 
        warn("HumanoidRootPart Not Found!")
        return 
    end

    
    if not getgenv().Target then
        warn("No target selected! Use the dropdown to select a player.")
        return
    end

    local target = game.Players:FindFirstChild(getgenv().Target)
    if not target or not target.Character then 
        warn("Target player not found or no character!")
        return 
    end

    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
    local targetHum = target.Character:FindFirstChildOfClass("Humanoid")
    if not targetHRP or not targetHum then 
        warn("HumanoidRootPart  Humanoid Not Found")
        return 
    end

    local savedPos = hrp.Position

    local function getStelariumBus()
        local vehicles = ws:FindFirstChild("Vehicles")
        if not vehicles then return nil end

        local bus = vehicles:FindFirstChild(player.Name .. "Car")
        if bus and not bus.PrimaryPart then
            local body = bus:FindFirstChild("Body")
            if body then
                bus.PrimaryPart = body
            end
        end
        return bus
    end

    local bus = getStelariumBus()

    if not bus then
        hrp.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.5)

        local re = rs:FindFirstChild("RE")
        if re and re:FindFirstChild("1Ca1r") then
            re["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
        end

        task.wait(1)
        bus = getStelariumBus()
    end

    if bus then
        local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
        if seat and not humanoid.Sit then
            repeat
                hrp.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                task.wait()
            until humanoid.Sit or not bus.Parent

            for _, v in pairs(bus.Body:GetChildren()) do
                if v:IsA("Seat") then
                    v.CanTouch = false
                end
            end
        end
    end

    hrp.Anchored = true
    hrp.CFrame = CFrame.new(1171.15, 79.45, -1166.2)
    task.wait(0.2)
    hrp.Velocity = Vector3.zero
    hrp.RotVelocity = Vector3.zero
    hrp.Anchored = false
    humanoid:ChangeState(Enum.HumanoidStateType.Seated)

    local startTime = tick()
    local running = true
    local conn
    local rotationSpeed = 10
    local currentRotation = 0

    conn = runService.Heartbeat:Connect(function()
        if not running then
            conn:Disconnect()
            return
        end

        if not bus or not bus.PrimaryPart then return end
        local tHRP = target.Character:FindFirstChild("HumanoidRootPart")
        local tHum = target.Character:FindFirstChild("Humanoid")
        if not tHRP or not tHum then return end

        currentRotation = currentRotation + (rotationSpeed * runService.Heartbeat:Wait())
        
        local offset = Vector3.new(math.random(-10,10), 5, math.random(-10,10))
        local targetPos = tHRP.Position + offset
        
        local rotationCFrame = CFrame.Angles(math.pi, currentRotation, 0)
        local finalCFrame = CFrame.new(targetPos) * rotationCFrame
        
        pcall(function()
            bus:PivotTo(finalCFrame)
        end)

        local seated = false
        for _, s in ipairs(bus:GetDescendants()) do
            if (s:IsA("Seat") or s:IsA("VehicleSeat")) and s.Occupant == tHum then
                seated = true
                break
            end
        end

        if seated or tick() - startTime > 10 then
            running = false
            conn:Disconnect()

            task.spawn(function()
                local fallTime = tick()
                local fallConn
                fallConn = runService.Heartbeat:Connect(function()
                    if not bus or not bus.PrimaryPart then 
                        fallConn:Disconnect()
                        return 
                    end
                    
                    currentRotation = currentRotation + (rotationSpeed * 2 * runService.Heartbeat:Wait())
                    local fallPos = Vector3.new(-76.6, -401.97 - ((tick() - fallTime) * 50), -84.26)
                    local fallCFrame = CFrame.new(fallPos) * CFrame.Angles(math.pi, currentRotation, 0)
                    
                    pcall(function()
                        bus:PivotTo(fallCFrame)
                    end)
                    
                    if tick() - fallTime > 3 then
                        fallConn:Disconnect()
                    end
                end)
            end)

            task.wait(0.5)
            hrp.Anchored = true
            hrp.CFrame = CFrame.new(savedPos + Vector3.new(0, 5, 0))
            task.wait(0.2)
            hrp.Velocity = Vector3.zero
            hrp.RotVelocity = Vector3.zero
            hrp.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end)
end


Tab:AddButton({
    Title = "Car Kill ( Target Player )",
    Desc = "Car Kill For Player Select ( Manual Sit )", 
    Callback = function ()
        if not getgenv().Target then
            warn("Select a target first!")
            return
        end
        ExecuteStelariumBus()
print("Button Clicked")
    end
})


Tab:AddButton({
    Title = "Car Bring ( Target Player )",
    Desc = "Bring Target For You( Manual Sit )",
    Callback = function ()
        if not getgenv().Target or getgenv().Target == "No players found" then
            print("No target selected!")
            return
        end

        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer

        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not hrp then return end

        local savedPos = hrp.CFrame

        local function getStelariumBus()
            local vehicles = Workspace:FindFirstChild("Vehicles")
            if not vehicles then return nil end
            local bus = vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
            if bus and not bus.PrimaryPart then
                local body = bus:FindFirstChild("Body")
                if body then bus.PrimaryPart = body end
            end
            return bus
        end

        local bus = getStelariumBus()

        if not bus then
            hrp.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
            task.wait(0.5)
            local re = ReplicatedStorage:FindFirstChild("RE")
            if re and re:FindFirstChild("1Ca1r") then
                re["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
            end
            task.wait(1)
            bus = getStelariumBus()
        end

        if bus then
            local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
            if seat and not humanoid.Sit then
                repeat
                    hrp.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                    task.wait()
                until humanoid.Sit or not bus.Parent
            end
        end

        local target = Players:FindFirstChild(getgenv().Target)
        if not target or not target.Character then 
            print("Target not found or has no character!")
            return 
        end
        
        local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
        local targetHum = target.Character:FindFirstChildOfClass("Humanoid")
        if not targetHRP or not targetHum then 
            print("Target has no HumanoidRootPart or Humanoid!")
            return 
        end

        local running = true

        local conn
        conn = RunService.Heartbeat:Connect(function()
            if not running then
                conn:Disconnect()
                return
            end

            if not target.Character then
                running = false
                conn:Disconnect()
                return
            end

            targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
            targetHum = target.Character:FindFirstChildOfClass("Humanoid")
            if not targetHRP or not targetHum then return end

            local seated = targetHum.Sit
            if seated then
                running = false
                conn:Disconnect()

                bus:SetPrimaryPartCFrame(savedPos)
                task.wait(0.5)

                local args = { [1] = "DeleteAllVehicles" }
                ReplicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
                print("Car bring completed!")
            else
                local offset = Vector3.new(math.random(-10,10),0,math.random(-10,10))
                pcall(function() bus:PivotTo(CFrame.new(targetHRP.Position + offset)) end)
            end
        end)
        
        print("Car bring started for target:", getgenv().Target)
    end
})


local function murphyHubBusFunction(state)
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer

    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Humanoid = character:FindFirstChildOfClass("Humanoid")
    local MeuHRPStell = character:FindFirstChild("HumanoidRootPart")
    if not Humanoid or not MeuHRPStell then return end

    local savedPosition = MeuHRPStell.Position

    local function getMurphyHubBus()
        local vehicles = Workspace:FindFirstChild("Vehicles")
        
        if not vehicles then return nil end
        
        local bus = vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
        
        if bus and not bus.PrimaryPart then
            local body = bus:FindFirstChild("Body")
            
            if body then bus.PrimaryPart = body end
        end
        
        return bus
    end

    local running = state

    if running then
        local bus = getMurphyHubBus()

        if not bus then
            MeuHRPStell.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
            task.wait(0.5)
            
            local re = ReplicatedStorage:FindFirstChild("RE")
            if re and re:FindFirstChild("1Ca1r") then
                re["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
            end
            
            task.wait(1)
            bus = getMurphyHubBus()
        end

        if not bus then return end

        local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")

        if seat and not Humanoid.Sit then
            repeat
                task.wait()
                MeuHRPStell.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
            until Humanoid.Sit or not bus.Parent
        end

        spawn(function()
            while running do
                
                local target = getgenv().Target and Players:FindFirstChild(getgenv().Target)
                if not target or not target.Character then 
                    task.wait(0.1)
                    continue
                end

                local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                local targetHum = target.Character:FindFirstChildOfClass("Humanoid")
                if not targetHRP or not targetHum then 
                    task.wait(0.1)
                    continue
                end

                local offset = Vector3.new(math.random(-10,10), 0, math.random(-10,10))
                pcall(function()
                    if bus and bus.Parent then
                        bus:PivotTo(CFrame.new(targetHRP.Position + offset) * CFrame.Angles(
                            math.rad(Workspace.DistributedGameTime * 12060),
                            math.rad(Workspace.DistributedGameTime * 15000),
                            math.rad(Workspace.DistributedGameTime * 18000)
                        ))
                    end
                end)

                task.wait()
            end
        end)

    else
        local bus = getMurphyHubBus()
        if bus and bus.PrimaryPart then
            pcall(function()
                bus:SetPrimaryPartCFrame(CFrame.new(savedPosition))
                local args = { [1] = "DeleteAllVehicles" }
                ReplicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
            end)
        end

        pcall(function()
            MeuHRPStell.CFrame = CFrame.new(savedPosition)
            task.wait(0.2)
            MeuHRPStell.Velocity = Vector3.zero
            MeuHRPStell.RotVelocity = Vector3.zero
            Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end)
    end
end


local Toggle = Tab:AddToggle({
    Title = "Car Fling ( Target Player )",
    Desc = "Fling Player Select ( Manual Sit ) ", 
    Callback = function (state)
        murphyHubBusFunction(state)
    end,
    Default = false, 
    Flag = false
})

local kill = Tab:AddSection({Name = "(Tool) Click to execute - by Wx"})

local Section = Tab:AddSection({
    Title = "Boat - Fling"
})


local flingActive = false
local currentFlingThread = nil
local currentSpin = nil
local function boatFling()
    local selectedPlayerName = getgenv().Target
    
    if not selectedPlayerName or not game.Players:FindFirstChild(selectedPlayerName) then
        return
    end

    local Player = game.Players.LocalPlayer
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = game.Workspace:FindFirstChild("Vehicles")

    if not Humanoid or not RootPart then
        return
    end

    local function spawnBoat()
        RootPart.CFrame = CFrame.new(1754, -2, 58)
        task.wait(0.5)
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
        task.wait(1)
        return Vehicles:FindFirstChild(Player.Name.."Car")
    end

    local PCar = Vehicles:FindFirstChild(Player.Name.."Car") or spawnBoat()
    if not PCar then
        return
    end

    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
    if not Seat then
        return
    end

    repeat 
        task.wait(0.1)
        RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
    until Humanoid.SeatPart == Seat

    local TargetPlayer = game.Players:FindFirstChild(selectedPlayerName)
    if not TargetPlayer or not TargetPlayer.Character then
        return
    end

    local TargetC = TargetPlayer.Character
    local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
    local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")

    if not TargetRP or not TargetH then
        return
    end

    flingActive = true
    local Spin = Instance.new("BodyAngularVelocity")
    Spin.Name = "Spinning"
    Spin.Parent = PCar.PrimaryPart
    Spin.MaxTorque = Vector3.new(0, math.huge, 0)
    Spin.AngularVelocity = Vector3.new(0, 369, 0)
    currentSpin = Spin

    local function moveCar(TargetRP, offset)
        if PCar and PCar.PrimaryPart then
            PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + offset))
        end
    end

    currentFlingThread = task.spawn(function()
        while flingActive and PCar and PCar.Parent and TargetRP and TargetRP.Parent do
            task.wait(0.01) 
            
            moveCar(TargetRP, Vector3.new(0, 1, 0))  
            moveCar(TargetRP, Vector3.new(0, -2.25, 5))  
            moveCar(TargetRP, Vector3.new(0, 2.25, 0.25))  
            moveCar(TargetRP, Vector3.new(-2.25, -1.5, 2.25))  
            moveCar(TargetRP, Vector3.new(0, 1.5, 0))  
            moveCar(TargetRP, Vector3.new(0, -1.5, 0))  

            if PCar and PCar.PrimaryPart and flingActive then
                local Rotation = CFrame.Angles(
                    math.rad(math.random(-369, 369)),  
                    math.rad(math.random(-369, 369)), 
                    math.rad(math.random(-369, 369))
                )
                PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + Vector3.new(0, 1.5, 0)) * Rotation)
            end
        end

        if Spin and Spin.Parent then
            Spin:Destroy()
        end
    end)
end

local function stopFling()
    flingActive = false
    
    if currentFlingThread then
        task.cancel(currentFlingThread)
        currentFlingThread = nil
    end
    
    if currentSpin and currentSpin.Parent then
        currentSpin:Destroy()
        currentSpin = nil
    end
end


Tab:AddButton({
    Title = "Fling Boat ( Boat Normal )",
    Desc = "Boat Fling Player Target Dropwdom",
    Callback = function ()
        boatFling()
print("Button Clicked")
    end
})


Tab:AddButton({
    Title = "Stop Boat Fling",
    Desc = "Stop Fuctions Fling Boat", 
    Callback = function ()
     stopFling()
   print("Button Clicked")
    end
})


local Paragraph = Tab:AddParagraph({
    Title = "Warn",
    Text = "In other updates I will add more boats !"
})
local Section = Tab:AddSection({
    Title = "Stephanny - Things"
})
Tab:AddButton({
    Title = "Couch Annoy (Stephanny) [BETA]",
    Desc = "Stephanny Couch Annoy - made by Wx",
    Callback = function()
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local LocalPlayer = Players.LocalPlayer
        local RE = ReplicatedStorage:WaitForChild("RE")

        local targetPlayer = Players:FindFirstChild(getgenv().Target)
        if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            warn("Nn tem alvo!!")
            return
        end

        RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllTools")
        RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")

        local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)
        if not couch then
            warn("couch nao esta disponivel !!")
            return
        end

        couch.Name = "StxL.Arium.Wx.Strex.Stell.Couch"
        local seat1, seat2, handle = couch:FindFirstChild("Seat1"), couch:FindFirstChild("Seat2"), couch:FindFirstChild("Handle")
        if not (seat1 and seat2 and handle) then
            warn("um erro de sintaxe aleatorio")
            return
        end

        seat1.Disabled, seat2.Disabled = true, true
        handle.Name = "Handle "
        couch.Parent = LocalPlayer.Character

        local bv = Instance.new("BodyVelocity", seat1)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.P = 1250
        bv.Velocity = Vector3.zero
        bv.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

        repeat
            if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then break end
            for _ = 1, 35 do
                local tRoot = targetPlayer.Character.HumanoidRootPart
                local pos = tRoot.Position + (tRoot.Velocity / 2)
                seat1.CFrame = CFrame.new(pos) * CFrame.new(-2, 2, 0)
                task.wait()
            end
            bv.Velocity = Vector3.zero
            couch.Parent = LocalPlayer.Backpack
            task.wait(0.2)
            couch.Handle.Name = "Handle "
            task.wait(0.2)
            couch.Parent = LocalPlayer.Character
        until targetPlayer.Character:FindFirstChildOfClass("Humanoid").Sit

        bv:Destroy()
        seat1.CFrame = CFrame.new(9e10, 9e10, 9e10)
        seat2.CFrame = CFrame.new(9e10, 9e10, 9e10)
        couch.Parent = LocalPlayer.Backpack
        task.wait(2)
        RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    end
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local RE = ReplicatedStorage:WaitForChild("RE")
local ClearEvent = RE:FindFirstChild("1Clea1rTool1s")
local ToolEvent = RE:FindFirstChild("1Too1l")
local FireEvent = RE:FindFirstChild("1Gu1n")

local FlingSystem = { power = 1e16, damage = 9999999999999999999999999999998, interval = 0.02 }
local StephannyThread

local Toggle = Tab:AddToggle({
	Title = "Admin Annoy (Stephanny)",
	Desc = "Stephanny Annoy - made by Wx",
	Default = false,
	Flag = false,
	Callback = function(state)
		if state then
			if StephannyThread then return end
			StephannyThread = task.spawn(function()
				while state do
					local function clearTools()
						if ClearEvent then ClearEvent:FireServer("ClearAllTools") end
					end

					local function requestAssault()
						if ToolEvent then ToolEvent:InvokeServer("PickingTools", "Assault") end
					end

					local function hasWeapon()
						return LocalPlayer.Backpack:FindFirstChild("Assault") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Assault"))
					end

					local function equipWeapon()
						local weapon = LocalPlayer.Backpack:FindFirstChild("Assault")
						if weapon and LocalPlayer.Character then
							local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
							if humanoid then humanoid:EquipTool(weapon) end
						end
					end

					local function getGunScript()
						if LocalPlayer.Character then
							local weapon = LocalPlayer.Character:FindFirstChild("Assault") or LocalPlayer.Backpack:FindFirstChild("Assault")
							if weapon then return weapon:FindFirstChild("GunScript_Local") end
						end
						return nil
					end

					local function executeShot(targetPart)
						local gunScript = getGunScript()
						if not gunScript or not targetPart or not FireEvent then return end
						local muzzle = gunScript:FindFirstChild("MuzzleEffect")
						local hit = gunScript:FindFirstChild("HitEffect")
						if not muzzle or not hit then return end
						local args = {
							targetPart, targetPart, Vector3.new(FlingSystem.power, FlingSystem.power, FlingSystem.power),
							targetPart.Position, muzzle, hit, 0, 0, { false },
							{
								FlingSystem.damage, Vector3.new(5000, 5000, 5000),
								BrickColor.new(29), 0.25, Enum.Material.SmoothPlastic, 0.25
							},
							true, false
						}
						FireEvent:FireServer(unpack(args))
					end

					local function getSelectedTarget()
						if not selectedPlayerName then return nil end
						local player = Players:FindFirstChild(selectedPlayerName)
						if player and player.Character then
							local humanoid = player.Character:FindFirstChild("Humanoid")
							local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
							if humanoid and humanoid.Health > 0 and rootPart then
								return { player = player, part = rootPart }
							end
						end
						return nil
					end

					local function flingTarget()
						local target = getSelectedTarget()
						if not target then return end
						executeShot(target.part)
						local char = target.player.Character
						if not char then return end
						local head = char:FindFirstChild("Head")
						if head then executeShot(head) end
						local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
						if torso then executeShot(torso) end
					end

					local function maintainWeapon()
						if not hasWeapon() then
							clearTools()
							task.wait(0.1)
							requestAssault()
							task.wait(0.2)
							local attempts = 0
							while not hasWeapon() and attempts < 20 do
								task.wait(0.1)
								attempts += 1
							end
							if hasWeapon() then equipWeapon() end
						end
					end

					pcall(function()
						maintainWeapon()
						if hasWeapon() and getGunScript() then
							flingTarget()
						end
					end)
					task.wait(FlingSystem.interval)
				end
			end)
		else
			if StephannyThread then
				task.cancel(StephannyThread)
				StephannyThread = nil
			end
		end
	end
})

local BobEsponjaCalssaCagada = Tab:AddSection({"Anti - Things"})
    
Tab:AddToggle({
    Name = "Steal Tools From Player (Anti-tools)",
    Default = false,
    Callback = function(v)
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local remote = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Playe1rTrigge1rEven1t")

        local bobesponja = getgenv().Target
        if not bobesponja then return end

        local slaaa = Players:FindFirstChild(bobesponja)
        if not slaaa then return end

        if v then
            -- inicia loop
            getgenv().AntiToolLoop = true
            task.spawn(function()
                while getgenv().AntiToolLoop do
                    if slaaa.Character then
                        for _, toolzinhadowx in ipairs(slaaa.Character:GetChildren()) do
                            if toolzinhadowx:IsA("Tool") then
                                local args = {
                                    "AcceptedToolToServer",
                                    toolzinhadowx,
                                    slaaa
                                }
                                remote:FireServer(unpack(args))
                            end
                        end
                    end
                    task.wait(1) -- intervalo de 1 segundo
                end
            end)
        else
            -- para loop
            getgenv().AntiToolLoop = false
        end
    end
})



local FunT = Window:MakeTab({ "Fun Players", "fun" })

FunT:AddSection({ "Fun Players" })

Section = FunT:AddSection({
    Name = "Head Sit"
})

local selectedHeadSit = nil
local headSitConnection = nil

local pl = game.Players.LocalPlayer
local players = {}

local function updatePlayerList()
    players = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    return players
end

updatePlayerList()

local headSitDropdown = FunT:AddDropdown({
    Name = "Select a Player",
    Default = "",
    Options = players,
    Callback = function(Value)
        selectedHeadSit = Value
    end
})

FunT:AddToggle({
    Name = "Head Sit",
    Default = false,
    Callback = function(bool)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local humanoid = character:WaitForChild("Humanoid")

        if not selectedHeadSit or selectedHeadSit == "" then
            return false
        end

        local selectedPlayer = game.Players:FindFirstChild(selectedHeadSit)

        if bool then
            if selectedPlayer and selectedPlayer.Character then
                humanoid.Sit = true

                if headSitConnection then
                    headSitConnection:Disconnect()
                end

                headSitConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("Head") and humanoid.Sit then
                        local targetHead = selectedPlayer.Character.Head
                        humanoidRootPart.CFrame = targetHead.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 1.6, 0.4)
                    else
                        if headSitConnection then
                            headSitConnection:Disconnect()
                            headSitConnection = nil
                            humanoid.Sit = false
                        end
                    end
                end)
            else
                return false
            end
        else
            if headSitConnection then
                headSitConnection:Disconnect()
                headSitConnection = nil
            end
            humanoid.Sit = false
        end
    end
})

FunT:AddButton({
    Name = "Update Player List",
    Callback = function()
        local updatedPlayers = updatePlayerList()
        if headSitDropdown and updatedPlayers then
            pcall(function()
                headSitDropdown:Refresh(updatedPlayers)
            end)
            if selectedHeadSit and not game.Players:FindFirstChild(selectedHeadSit) then
                selectedHeadSit = nil
                pcall(function()
                    headSitDropdown:Set("")
                end)
            end
        end
    end
})


local Tab = Window:MakeTab({"Avatar", "rbxassetid://10734952036"})

Tab:AddSection({ Name = "Avatar" })

Tab:AddSection({ Name = "Copy Avatar" })
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local Target = nil

local function GetPlayerNames()
    local PlayerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(PlayerNames, player.Name)
    end
    return PlayerNames
end

local Dropdown = Tab:AddDropdown({
    Name = "Select Player",
    Options = GetPlayerNames(),
    Default = Target,
    Callback = function(Value)
        Target = Value
    end
})

local function UpdateDropdown()
    Dropdown:Refresh(GetPlayerNames(), true)
end

Players.PlayerAdded:Connect(UpdateDropdown)
Players.PlayerRemoving:Connect(UpdateDropdown)

Tab:AddButton({
    Name = "Copy Avatar",
    Callback = function()
        if not Target then return end

        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)

        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

            if LHumanoid and THumanoid then
                local LDesc = LHumanoid:GetAppliedDescription()

                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                        task.wait(0.2)
                    end
                end

                if tonumber(LDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                    task.wait(0.2)
                end

                local PDesc = THumanoid:GetAppliedDescription()

                local argsBody = {
                    [1] = {
                        [1] = PDesc.Torso,
                        [2] = PDesc.RightArm,
                        [3] = PDesc.LeftArm,
                        [4] = PDesc.RightLeg,
                        [5] = PDesc.LeftLeg,
                        [6] = PDesc.Head
                    }
                }
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.wait(0.5)

                if tonumber(PDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                    task.wait(0.3)
                end

                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                        task.wait(0.3)
                    end
                end

                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.wait(0.3)
                end

                if tonumber(PDesc.IdleAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.wait(0.3)
                end

                local Bag = TPlayer:FindFirstChild("PlayersBag")
                if Bag then
                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPNameColor") then
                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBioColor") then
                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                        task.wait(0.3)
                    end
                end
            end
        end
    end
})

Tab:AddSection({ "Invisible" })

Tab:AddButton({
    Name = "[FE] Character Invisible",
    Description = "Makes your character invisible",
Callback = function()
        
        local args = {
    [1] = {
        [1] = 102344834840946,
        [2] = 70400527171038,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 0
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(111858803548721)
local allaccessories = {}

for zxcwefwfecas, xcaefwefas in ipairs({
    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.BackAccessory,
    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.FaceAccessory,
    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.FrontAccessory,
    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.NeckAccessory,
    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.HatAccessory,
    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.HairAccessory,
    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.ShouldersAccessory,
    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.WaistAccessory,
    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.GraphicTShirt
}) do
    for scacvdfbdb in string.gmatch(xcaefwefas, "%d+") do
        table.insert(allaccessories, tonumber(scacvdfbdb))
    end
end

wait()

for asdwr,asderg in ipairs(allaccessories) do
    task.spawn(function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(asderg)
    end)
end
    end
})


Tab:AddSection({ "Character" })

local colors = { "Bright red", "Lime green", "Bright blue", "Bright yellow", "Bright cyan", "Hot pink", "Royal purple" }
local rgbEnabled = false

local function changeColor(color)
    local args = { color }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeBodyColor"):FireServer(unpack(args))
end

local function toggleRGBCharacter(enabled)
    rgbEnabled = enabled
    if rgbEnabled then
        while rgbEnabled do
            for _, color in ipairs(colors) do
                if not rgbEnabled then return end
                changeColor(color)
                wait(0.5)
            end
        end
    end
end

Tab:AddToggle({
    Name = "RGB Character",
    Description = "Make your character RGB",
    Default = false,
    Callback = function(value)
        toggleRGBCharacter(value)
    end
})


Tab:AddSection({ "Hair" })
local hairColors = {
    Color3.new(1, 1, 0), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 1, 1),
    Color3.new(0, 1, 0), Color3.new(0.5, 0, 1), Color3.new(1, 0.647, 0), Color3.new(0, 1, 1)
}
local isActive = false


local function changeHairColor()
    local i = 1
    while isActive do
        if not isActive then break end
        local args = { [1] = "ChangeHairColor2", [2] = hairColors[i] }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Max1y"):FireServer(unpack(args))
        wait(0.1)
        i = i % #hairColors + 1
    end
end


Tab:AddToggle({
    Name = "Hair RGB",
    Description = "Make Your Hair RGB",
    Default = false,
    Callback = function(value)
        isActive = value
        if isActive then
            changeHairColor()
        end
    end
})

local colors = {
    Color3.new(1, 0, 0),
    Color3.new(0, 1, 0),
    Color3.new(0, 0, 1),
    Color3.new(1, 1, 0),
    Color3.new(0, 1, 1),
    Color3.new(1, 0, 1)
}

local isHouseRGBActive = false

local function changeColor()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local remoteEvent = replicatedStorage:FindFirstChild("RE") and replicatedStorage.RE:FindFirstChild("1Player1sHous1e")
    
    if not remoteEvent then
        return
    end

    while isHouseRGBActive do
        for _, color in ipairs(colors) do
            if not isHouseRGBActive then return end
            local args = {
                [1] = "ColorPickHouse",
                [2] = color
            }
            pcall(function()
                remoteEvent:FireServer(unpack(args))
            end)
            task.wait(0.8)
        end
    end
end

local function toggleHouseRGB(state)
    isHouseRGBActive = state
    if isHouseRGBActive then
        spawn(changeColor)
    else
    end
end

local isUnbanActive = false
local HouseTab = Window:MakeTab({"House", "home"})
local SelectHouse = nil
local NoclipDoor = nil

HouseTab:AddSection({Name = "House"})

HouseTab:AddSection({Name = "Lots"})
local function getHouseList()
    local Tabela = {}
    local lots = workspace:FindFirstChild("001_Lots")
    if lots then
        for _, House in ipairs(lots:GetChildren()) do
            if House.Name ~= "For Sale" and House:IsA("Model") then
                table.insert(Tabela, House.Name)
            end
        end
    end
    return Tabela
end

pcall(function()
    HouseTab:AddDropdown({
        Name = "Select a House",
        Options = getHouseList(),
        Default = "...",
        Callback = function(Value)
            SelectHouse = Value
            if NoclipDoor then
                NoclipDoor:Set(false)
            end
        end
    })
end)

local function DropdownHouseUpdate()
    local Tabela = getHouseList()
    pcall(function()
        HouseTab:ClearDropdown("Select a House") 
        HouseTab:AddDropdown({
            Name = "Select a House",
            Options = Tabela,
            Default = "...",
            Callback = function(Value)
                SelectHouse = Value
                if NoclipDoor then
                    NoclipDoor:Set(false)
                end
            end
        })
    end)
end

pcall(DropdownHouseUpdate)

pcall(function()
    HouseTab:AddButton({
        Name = "Update Houses List",
        Callback = function()
            pcall(DropdownHouseUpdate)
        end
    })
end)

pcall(function()
    HouseTab:AddButton({
        Name = "Teleport to House",
        Callback = function()
            local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
            if House and game.Players.LocalPlayer.Character then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(House.WorldPivot.Position)
            else
            end
        end
    })
end)

pcall(function()
    HouseTab:AddButton({
        Name = "Teleport to Safe",
        Callback = function()
            local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
            if House and House:FindFirstChild("HousePickedByPlayer") and game.Players.LocalPlayer.Character then
                local safe = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_Safe")
                if safe then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(safe.WorldPivot.Position)
                else
                end
            else
            end
        end
    })
end)

pcall(function()
    NoclipDoor = HouseTab:AddToggle({
        Name = "Noclip Doors",
        Description = "",
        Default = false,
        Callback = function(Value)
            pcall(function()
                local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
                if House and House:FindFirstChild("HousePickedByPlayer") then
                    local housepickedbyplayer = House.HousePickedByPlayer
                    local doors = housepickedbyplayer.HouseModel:FindFirstChild("001_HouseDoors")
                    if doors and doors:FindFirstChild("HouseDoorFront") then
                        for _, Base in ipairs(doors.HouseDoorFront:GetChildren()) do
                            if Base:IsA("BasePart") then
                                Base.CanCollide = not Value
                            end
                        end
                    end
                end
            end)
        end
    })
end)

pcall(function()
    HouseTab:AddToggle({
        Name = "Ring the Bell",
        Description = "",
        Default = false,
        Callback = function(Value)
            getgenv().ChaosHubAutoSpawnDoorbellValue = Value
            spawn(function()
                while getgenv().ChaosHubAutoSpawnDoorbellValue do
                    local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
                    if House and House:FindFirstChild("HousePickedByPlayer") then
                        local doorbell = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_DoorBell")
                        if doorbell and doorbell:FindFirstChild("TouchBell") then
                            pcall(function()
                                fireclickdetector(doorbell.TouchBell.ClickDetector)
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    })
end)

pcall(function()
    HouseTab:AddToggle({
        Name = "Knock on the Door",
        Description = "",
        Default = false,
        Callback = function(Value)
            getgenv().ChaosHubAutoSpawnDoorValue = Value
            spawn(function()
                while getgenv().ChaosHubAutoSpawnDoorValue do
                    local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
                    if House and House:FindFirstChild("HousePickedByPlayer") then
                        local doors = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_HouseDoors")
                        if doors and doors:FindFirstChild("HouseDoorFront") and doors.HouseDoorFront:FindFirstChild("Knock") then
                            pcall(function()
                                fireclickdetector(doors.HouseDoorFront.Knock.TouchBell.ClickDetector)
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    })
end)

pcall(function()
HouseTab:AddParagraph({"Note", "The option to update the house list has a bug, it will be fixed soon"})
end)

pcall(function()
    HouseTab:AddSection({ Name = "Teleport to the Houses" })
end)

local casas = {
    ["House #1"] = Vector3.new(260.29, 4.37, 209.32),
    ["House #2"] = Vector3.new(234.49, 4.37, 228.00),
    ["House #3"] = Vector3.new(262.79, 21.37, 210.84),
    ["House #4"] = Vector3.new(229.60, 21.37, 225.40),
    ["House #5"] = Vector3.new(173.44, 21.37, 228.11),
    ["House #6"] = Vector3.new(-43, 21, -137),
    ["House #7"] = Vector3.new(-40, 36, -137),
    ["Landmark #1"] = Vector3.new(500, 0, 390),
    ["House #11"] = Vector3.new(-21, 40, 436),
    ["House #12"] = Vector3.new(155, 37, 433),
    ["House #13"] = Vector3.new(255, 35, 431),
    ["House #14"] = Vector3.new(254, 38, 394),
    ["House #15"] = Vector3.new(148, 39, 387),
    ["House #16"] = Vector3.new(-17, 42, 395),
    ["House #17"] = Vector3.new(-189, 37, -247),
    ["House #18"] = Vector3.new(-354, 37, -244),
    ["House #19"] = Vector3.new(-456, 36, -245),
    ["House #20"] = Vector3.new(-453, 38, -295),
    ["House #21"] = Vector3.new(-356, 38, -294),
    ["House #22"] = Vector3.new(-187, 37, -295),
    ["House #23"] = Vector3.new(-410, 68, -447),
    ["House #24"] = Vector3.new(-348, 69, -496),
    ["House #28"] = Vector3.new(-103, 12, 1087),
    ["House #29"] = Vector3.new(-730, 6, 808),
    ["House #30"] = Vector3.new(-245, 7, 822),
    ["House #31"] = Vector3.new(639, 76, -361),
    ["House #32"] = Vector3.new(-908, 6, -361),
    ["House #33"] = Vector3.new(-111, 70, -417),
    ["House #34"] = Vector3.new(230, 38, 569),
    ["House #35"] = Vector3.new(-30, 13, 2209)
}

local casasNomes = {}
for nome, _ in pairs(casas) do
    table.insert(casasNomes, nome)
end

table.sort(casasNomes, function(a, b)
    local numA = tonumber(a:match("%d+")) or 0
    local numB = tonumber(b:match("%d+")) or 0
    return numA < numB
end)

pcall(function()
    HouseTab:AddDropdown({
        Name = "Select a House",
        Options = casasNomes,
        Callback = function(casaSelecionada)
            local player = game.Players.LocalPlayer
            if player and player.Character then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(casas[casaSelecionada])
            end
        end
    })
end)

pcall(function()
    HouseTab:AddSection({ Name = "Unban" })
end)

pcall(function()
    HouseTab:AddToggle({
        Name = "Auto Unban",
        Default = false,
        Callback = function(state)
            isUnbanActive = state
            if isUnbanActive then
                spawn(startAutoUnban)
            else
            end
        end
    })
end)

pcall(function()
    HouseTab:AddSection({ Name = "RGB" })
end)

pcall(function()
    HouseTab:AddToggle({
        Name = "House RGB",
        Default = false,
        Callback = function(state)
            toggleHouseRGB(state)
        end
    })
end)

function startAutoUnban()
    while isUnbanActive do
        pcall(function()
            for _, v in pairs(game:GetService("Workspace"):WaitForChild("001_Lots"):GetDescendants()) do
                if v.Name:match("^BannedBlock%d+$") then
                    v:Destroy()
                end
            end
        end)
        task.wait(1)
    end
end

pcall(function()
    HouseTab:AddSection({ Name = "Music" })
end)

local Musichsids = {
    "71373562243752", "138129019858244", "138480372357526", "122199933878670",
    "74187181906707", "82793916573031", "107421761958790", "91394092603440",
    "113198957973421", "81452315991527", "93786060174790", "74752089069476",
    "131592235762789", "132081774507495", "124394293950763", "83381647646350",
    "16190782181", "1841682637", "3148329638", "124928367733395",
    "106317184644394", "100247055114504", "107035638005233", "109351649716900",
    "84751398517083", "125259969174449", "89269071829332", "88094479399489",
    "72440232513341", "92893359226454", "111281710445018", "98677515506006",
    "105882833374061", "104541292443133", "105832154444494", "84733736048142",
    "94718473830640", "130324826943718", "123039027577735", "113312785512702",
    "139161205970637", "113768944849093", "135667903253566", "81335392002580",
    "77428091165211", "14145624031", "8080255618", "8654835474",
    "13530439502", "18841894272", "90323407842935", "136932193331774",
    "113504863495384", "1836175030", "79998949362539", "109188610023287",
    "134939857094956", "132245626038510", "124567809277408", "72591334498716",
    "76578817848504", "17422156627", "81902909302285", "130449561461006",
    "110519234838026", "106434295960535", "86271123924168", "85481949732828",
    "106476166672589", "87968531262747", "73966367524216", "137962454483542",
    "98371771055411", "111668097052966", "140095882383991", "122873874738223",
    "105461615542794"
}

local function playHouseMusic(musichsid)
    if musichsid and musichsid ~= "" then
        local houseArgs = {
            [1] = "PickHouseMusicText",
            [2] = musichsid
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(houseArgs))
    end
end

pcall(function()
HouseTab:AddTextBox({
    Name = "Music ID (Gamepass Required)",
    PlaceholderText = "Type Here...",
    Callback = function(value)
        playHouseMusic(value)
    end
})
end)

pcall(function()
HouseTab:AddDropdown({
    Name = "Select Music (Gamepass Required)",
    Options = Musichsids,
    Callback = function(value)
        playHouseMusic(value)
    end
})
end)

pcall(function()
HouseTab:AddParagraph({"Note", "The music script works in all Houses"})
end)

local Tab = Window:MakeTab({"Sound All", "music"})

Tab:AddSection({"Sound All"})

Tab:AddParagraph({"Warn", "Everyone on the servers can hear the sound"})

local audios = {
    {Name = "Yamete Kudasai", ID = 108494476595033},
    {Name = "Gritinho", ID = 5710016194},
    {Name = "Jumpscare Horroroso", ID = 85435253347146},
    {Name = "Áudio Alto", ID = 6855150757},
    {Name = "Ruído", ID = 120034877160791},
    {Name = "Jumpscare 2", ID = 110637995610528},
    {Name = "Risada Da Bruxa Minecraft", ID = 116214940486087},
    {Name = "The Boiled One", ID = 137177653817621},
    {Name = "Deitei Um Ave Maria Doido", ID = 128669424001766},
    {Name = "Mandrake Detected", ID = 9068077052},
    {Name = "Aaaaaaaaa", ID = 80156405968805},
    {Name = "AAAHHHH", ID = 9084006093},
    {Name = "amongus", ID = 6651571134},
    {Name = "Sus", ID = 6701126635},
    {Name = "Gritao AAAAAAAAA", ID = 5853668794},
    {Name = "UHHHHH COFFCOFF", ID = 7056720271},
    {Name = "SUS", ID = 7153419575},
    {Name = "Sonic.exe", ID = 2496367477},
    {Name = "Tubers93 1", ID = 270145703},
    {Name = "Tubers93 2", ID = 18131809532},
    {Name = "John's Laugh", ID = 130759239},
    {Name = "Nao sei KKKK", ID = 6549021381},
    {Name = "Grito", ID = 80156405968805},
    {Name = "audio estranho", ID = 7705506391},
    {Name = "AAAH", ID = 7772283448},
    {Name = "Gay, gay", ID = 18786647417},
    {Name = "Bat Hit", ID = 7129073354},
    {Name = "Nuclear Siren", ID = 675587093},
    {Name = "Sem ideia de nome KK", ID = 7520729342},
    {Name = "Grito 2", ID = 91412024101709},
    {Name = "Estora tímpano", ID = 268116333},
    --{Name = "[ Content Deleted ]", ID = 106835463235574},
    {Name = "Toma Jack", ID = 132603645477541},
    {Name = "Pede ifood pede", ID = 133843750864059},
    {Name = "I Ghost The down", ID = 84663543883498},
    {Name = "Compre OnLine Na shoope", ID = 8747441609},
    {Name = "Meu nome é ???", ID = 7339658122},
    {Name = "FAZ O L!!!!", ID = 94350012510206},
    {Name = "Uh Que Nojo", ID = 103440368630269},
    {Name = "Sai dai Lava Prato", ID = 101232400175829},
    {Name = "Seloko num compensa", ID = 78442476709262},
    --{Name = "Chimpanzini Bananini Funk", ID = 137148228908678},
    --{Name = "Candyland Tobu", ID = 118939739460633},
    {Name = "Meme do Dom pollo What the hell", ID = 100656590080703},
    {Name = "Não to entendendo nada Estourado", ID = 7962533987},
    {Name = "Cachorro Rindo", ID = 8449305114},
}

local selectedAudioID

Tab:AddTextBox({
    Name = "Enter Sound ID",
    PlaceholderText = "Type Here...",
    Callback = function(value)
        selectedAudioID = tonumber(value)
    end
})

local audioNames = {}
for _, audio in ipairs(audios) do
    table.insert(audioNames, audio.Name)
end

Tab:AddDropdown({
    Name = "Select Sound",
    Description = "Choose an audio from the list",
    Options = audioNames,
    Default = audioNames[1],
    Flag = "selected_audio",
    Callback = function(value)
        for _, audio in ipairs(audios) do
            if audio.Name == value then
                selectedAudioID = audio.ID
                break
            end
        end
    end
})

local audioLoop = false

Tab:AddSection({"Loop Sound"})

local function playLoopedAudio()
    while audioLoop do
        if selectedAudioID then
            local args = {
                [1] = game:GetService("Workspace"),
                [2] = selectedAudioID,
                [3] = 1,
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))

            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. selectedAudioID
            sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            sound:Play()
        else
        end

        task.wait(0.5) 
    end
end

Tab:AddToggle({
    Name = "Loop Play Sound",
    Default = false,
    Flag = "audio_loop",
    Callback = function(value)
        audioLoop = value
        if audioLoop then
            task.spawn(playLoopedAudio) 
        end
    end
})

local function playAudio()
    if selectedAudioID then
        local args = {
            [1] = game:GetService("Workspace"),
            [2] = selectedAudioID,
            [3] = 1,
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))

        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. selectedAudioID
        sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        sound:Play()
    else
    end
end

Tab:AddButton({"Play Sound", function()
    playAudio()
end})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local audioID = 6314880174

local function Audio_All_ClientSide(ID)
    local function CheckFolderAudioAll()
        local FolderAudio = workspace:FindFirstChild("Audio all client")
        if not FolderAudio then
            FolderAudio = Instance.new("Folder")
            FolderAudio.Name = "Audio all client"
            FolderAudio.Parent = workspace
        end
        return FolderAudio
    end

    local function CreateSound(ID)
        if type(ID) ~= "number" then
            return nil
        end

        local Folder_Audio = CheckFolderAudioAll()
        if Folder_Audio then
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://" .. ID
            Sound.Volume = 1
            Sound.Looped = false
            Sound.Parent = Folder_Audio
            Sound:Play()
            task.wait(1) 
            Sound:Destroy()
        end
    end

    CreateSound(ID)
end

local function Audio_All_ServerSide(ID)
    if type(ID) ~= "number" then
        return nil
    end

    local GunSoundEvent = ReplicatedStorage:FindFirstChild("1Gu1nSound1s", true)
    if GunSoundEvent then
        GunSoundEvent:FireServer(workspace, ID, 1)
    end
end

Tab:AddToggle({
    Name = "Blow everyone's ears... lol...",
    Description = "Play burst audio repeatedly for everyone",
    Default = false,
    Flag = "audio_spam",
    Callback = function(value)
        getgenv().Audio_All_loop_fast = value

        while getgenv().Audio_All_loop_fast do
            Audio_All_ServerSide(audioID)
            task.spawn(function()
                Audio_All_ClientSide(audioID)
            end)
            task.wait(0.03) 
        end
    end
})


local Tab = Window:MakeTab({"Lag Server", "bomb"})

Tab:AddSection({
    Name = "Lag Server"
})

local Section = Tab:AddSection({
    Name = "Experimental"
})

local runLag = false
local lagCoroutine

Tab:AddToggle({
    Name = "Lag Bus",
    Default = false,
    Callback = function(Value)
        runLag = Value

        if runLag then
            local Players = game:GetService("Players")  
            local ReplicatedStorage = game:GetService("ReplicatedStorage")  
            local LocalPlayer = Players.LocalPlayer  

            if not LocalPlayer then  
                return  
            end  

            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()  
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)  
            if not humanoidRootPart then  
                return  
            end  

            local function GetBus()  
                local vehicles = workspace:FindFirstChild("Vehicles")  
                if vehicles then  
                    return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")  
                end  
                return nil  
            end  

            local remoteEvent = ReplicatedStorage:FindFirstChild("RE")  
            if not remoteEvent then  
                return  
            end  

            if not remoteEvent:FindFirstChild("1Ca1r") then  
                return  
            end  

            lagCoroutine = coroutine.wrap(function()  
                while runLag do  
                    local success, err = pcall(function()  
                        humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)  
                        local bus = GetBus()  
                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")  
                    end)  

                    if not success then   
                        runLag = false  
                        break  
                    end  

                    task.wait(0)
                end  
            end)  
            lagCoroutine()
        end
    end
})

local Section = Tab:AddSection({
    Name = "Laptop"
})

local toggles = { LagLaptop = false }

local function clickNormally(object)
    local clickDetector = object:FindFirstChildWhichIsA("ClickDetector")
    if clickDetector then
        fireclickdetector(clickDetector)
    end
end

local function lagarJogoLaptop(laptopPath, maxTeleports)
    if laptopPath then
        local teleportCount = 0
        while teleportCount < maxTeleports and toggles.LagLaptop do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = laptopPath.CFrame
            clickNormally(laptopPath)
            teleportCount = teleportCount + 1
            wait(0.0001)
        end
    else
    end
end

Tab:AddToggle({
    Name = "Lag Laptop (Hard)",
    Default = false,
    Callback = function(state)
        toggles.LagLaptop = state
        if state then
            local laptopPath = workspace:FindFirstChild("WorkspaceCom"):FindFirstChild("001_GiveTools"):FindFirstChild("Laptop")
            if laptopPath then
                spawn(function()
                    lagarJogoLaptop(laptopPath, 999999999)
                end)
            else
            end
        else
        end
    end
})

Tab:AddParagraph({
    "Warn",
    "The lag effect starts after 20 seconds"
})

local Section = Tab:AddSection({
    Name = "Boooooooom!!"
})


local BombActive = false

Tab:AddToggle({
    Name = "Lag Bomb",
    Default = false,
    Callback = function(Value)
        if Value then
            BombActive = true

            local Player = game.Players.LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local RootPart = Character:WaitForChild("HumanoidRootPart")
            local WorkspaceService = game:GetService("Workspace")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Bomb = WorkspaceService:WaitForChild("WorkspaceCom"):WaitForChild("001_CriminalWeapons"):WaitForChild("GiveTools"):WaitForChild("Bomb")

            task.spawn(function()
                while BombActive do
                    if Bomb and RootPart then
                        RootPart.CFrame = Bomb.CFrame
                        fireclickdetector(Bomb.ClickDetector) 
                        task.wait(0.00001) 
                    else
                        task.wait(0.0001) 
                    end
                end
            end)

            task.spawn(function()
                while BombActive do
                    if Bomb and RootPart then
                        local VirtualInputManager = game:GetService("VirtualInputManager")
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, game, 0) 
                        task.wait(1.5)
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, game, 0) 

                        local args = {
                            [1] = "Bomb" .. Player.Name 
                        }
                        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Blo1wBomb1sServe1r"):FireServer(unpack(args))
                    end
                    task.wait(1.5) 
                end
            end)
        else
            BombActive = false
        end
    end
})

Tab:AddParagraph({
    "Warn",
    "The lag effect starts after 35 seconds"
})

local Tab = Window:MakeTab({"Name & Bio", "Paper"})

local isNameActive = false
local isBioActive = false

local SectionRGBName = Tab:AddSection({
    Name = "Name"
})

Tab:AddToggle({
    Name = "Name RGB",
    Description = "Make the Name colorful",
    Default = false,
    Callback = function(value)
        isNameActive = value
    end
})


local SectionRGBBio = Tab:AddSection({
    Name = "Bio"
})

Tab:AddToggle({
    Name = "Bio RGB",
    Description = "Make the Bio colorful",
    Default = false,
    Callback = function(value)
        isBioActive = value
    end
})


local vibrantColors = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(255, 0, 255),
    Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(255, 165, 0),
    Color3.fromRGB(128, 0, 128),
    Color3.fromRGB(255, 20, 147)
}

spawn(function()
    while true do
        if isNameActive then
            local randomColor = vibrantColors[math.random(#vibrantColors)]
            local args = {
                [1] = "PickingRPNameColor",
                [2] = randomColor
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
        end
        wait(0.1)
    end
end)

spawn(function()
    while true do
        if isBioActive then
            local randomColor = vibrantColors[math.random(#vibrantColors)]
            local args = {
                [1] = "PickingRPBioColor",
                [2] = randomColor
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
        end
        wait(0.1)
    end
end)

local SectionNames = Tab:AddSection({
    Name = "Custom Names"
})

local names = {
    {"Anonymus", " Anonymus "},
    {"PRO", " PRO "},
    {"ERR0R_666", " ERR0R_666 "},
    {"DARKNE1SSS", " DARKNE1SSS "},
    {"GHOST", " GHOST "},
    {"JOKER", " JOKER "},
    {"ADMIN", " ADMIN "},
    {"TUBERS93", " TUBERS 93 "},
    {"CO0LKID", " CO0 LKID "},
    {"GAME ATTACKED BY FALLEN", " GAME ATTACKED BY FALLEN "},
    {"INC0MUN", " INC0MUN"},
    {"BAD BOY", " BAD BOY "}
}

for _, name in ipairs(names) do
    Tab:AddButton({
        Name = name[1],
        Callback = function()
            game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", name[2])
        end
    })
end


local CarTab = Window:MakeTab({"Vehicles", "car"})

CarTab:AddSection({"Vehicles"})
local colors = {
    Color3.new(1, 0, 0),
    Color3.new(0, 1, 0),
    Color3.new(0, 0, 1),
    Color3.new(1, 1, 0),
    Color3.new(1, 0, 1),
    Color3.new(0, 1, 1),
    Color3.new(0.5, 0, 0.5),
    Color3.new(1, 0.5, 0)
}

local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = replicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r")

local isColorChanging = false
local colorChangeCoroutine = nil

local function changeCarColor()
    while isColorChanging do
        for _, color in ipairs(colors) do
            if not isColorChanging then return end
            local args = {
                [1] = "PickingCarColor",
                [2] = color
            }
            remoteEvent:FireServer(unpack(args))
            wait(1)
        end
    end
end

CarTab:AddButton({
    Name = "Remove All Vehicles",
    Callback = function()
        local ofnawufn = false

if ofnawufn == true then
    return
end
ofnawufn = true

local cawwfer = "MilitaryBoatFree" 
local oldcfffff = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1754, -2, 58) 
wait(0.3)

local args = {
    [1] = "PickingBoat", 
    [2] = cawwfer
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
wait(1)

local wrinfjn
for _, errb in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do
    if errb:IsA("VehicleSeat") then
        wrinfjn = errb
    end
end

repeat
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then return end
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        if not game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,1,0)
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,-1,0)
    task.wait()
until game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn

for _, wifn in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do
    if wifn.Name == "PhysicalWheel" then
        wifn:Destroy()
    end
end

local FLINGED = Instance.new("BodyThrust", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass) 
FLINGED.Force = Vector3.new(50000, 0, 50000) 
FLINGED.Name = "Flinged"
FLINGED.Location = game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.Position

for _, wvwvwasc in pairs(game.workspace.Vehicles:GetChildren()) do
    for _, ascegr in pairs(wvwvwasc:GetDescendants()) do
        if ascegr.Name == "VehicleSeat" then
            local targetcar = ascegr
            local tet = Instance.new("BodyVelocity", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass)
            tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            tet.P = 1250
            tet.Velocity = Vector3.new(0,0,0)
            tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
            for m=1,25 do
                local pos = {x=0, y=0, z=0}
                pos.x = targetcar.Position.X
                pos.y = targetcar.Position.Y
                pos.z = targetcar.Position.Z
                pos.x = pos.x + targetcar.Velocity.X / 2
                pos.y = pos.y + targetcar.Velocity.Y / 2
                pos.z = pos.z + targetcar.Velocity.Z / 2
                if pos.y <= -200 then
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(0,1000,0)
                else
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z))
                    task.wait()
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) + Vector3.new(0,-2,0)
                    task.wait()
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(0,0,2)
                    task.wait()
                    game.workspace.Vehicles[
game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(2,0,0)
                    task.wait()
                end
                task.wait()
            end
        end
    end
end

task.wait()
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
game.Players.LocalPlayer.Character.Humanoid.Sit = false
wait()
local tet = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
tet.P = 1250
tet.Velocity = Vector3.new(0,0,0)
tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
wait(0.1)
for m=1,2 do 
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff
end
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"):Destroy()
wait(0.2)
ofnawufn = false
    end
})

CarTab:AddParagraph({"Warn", "We recommend using it twice to ensure all vehicles are removed"})

CarTab:AddButton({
    Name = "Bring All Vehicles",
    Callback = function()
        for _, v in next, workspace.Vehicles:GetChildren() do
            v:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character:GetPrimaryPartCFrame())
        end
    end
})

CarTab:AddParagraph({"Warn", "Pulls all vehicles from the server to you"})

local SpeedSection = CarTab:AddSection({"Speed"})

local Speed = 50
local Turbo = 50

local function ChangeCarSpeedAndTurbo(speedValue, turboValue)
    local player = game.Players.LocalPlayer
    local car = workspace.Vehicles:FindFirstChild(player.Name .. "Car")

    if car then
        local body = car:FindFirstChild("Body").VehicleSeat
        if body then
            body.TopSpeed.Value = speedValue
            body.Turbo.Value = turboValue
            wait(0.1)
        else
            FallenLib:MakeNotification({
                Name = "Error",
                Content = "Sit in car first!",
                Time = 5
            })
        end
    else
        FallenLib:MakeNotification({
            Name = "Error",
            Content = "Put a Car First!",
            Time = 5
        })
    end
end

CarTab:AddTextBox({
    Name = "Speed",
    PlaceholderText = "50",
    Callback = function(value)
        local newSpeed = tonumber(value)
        if newSpeed then
            Speed = newSpeed
        end
    end
})

CarTab:AddTextBox({
    Name = "Turbo",
    PlaceholderText = "50",
    Callback = function(value)
        local newTurbo = tonumber(value)
        if newTurbo then
            Turbo = newTurbo
        end
    end
})

CarTab:AddTextBox({
    Name = "Drift",
    PlaceholderText = "50",
    Callback = function(value)
        local args = {
            [1] = "DriftingNumber",
            [2] = value
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
    end
})

CarTab:AddButton({
    Name = "Aplicar Velocidade, Turbo e drift",
    Callback = function()
        ChangeCarSpeedAndTurbo(Speed, Turbo)
    end
})

local TurboSection = CarTab:AddSection({"Turbo"})

CarTab:AddButton({
    Name = "Turbo [Recommended]",
    Callback = function()
     local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

local voando = false
local velocidade = 30

local telaGui = Instance.new("ScreenGui", player.PlayerGui)

local function criarBotaoImagem(nome, posicao, idImagem, rotacao, acao)
    local botao = Instance.new("ImageButton", telaGui)
    botao.Size = UDim2.new(0, 60, 0, 60)
    botao.Position = posicao
    botao.BackgroundTransparency = 1
    botao.Image = "rbxassetid://" .. idImagem
    botao.Rotation = rotacao
    botao.MouseButton1Down:Connect(acao)
    return botao
end

local botaoFrente = criarBotaoImagem("BotaoFrente", UDim2.new(0, 10, 0.35, 0), "18478249606", 0, function()
    voando = true
    while voando do
        if humanoidRootPart then
            humanoidRootPart.Velocity = humanoidRootPart.CFrame.LookVector * velocidade
        end
        task.wait()
    end
end)

local botaoTras = criarBotaoImagem("BotaoTras", UDim2.new(0, 10, 0.5, 0), "18478249606", 180, function()
    voando = true
    while voando do
        if humanoidRootPart then
            humanoidRootPart.Velocity = -humanoidRootPart.CFrame.LookVector * velocidade
        end
        task.wait()
    end
end)

local botaoEsquerda = criarBotaoImagem("BotaoEsquerda", UDim2.new(1, -210, 0.3, 0), "18478249606", -90, function()
    voando = true
    while voando do
        if humanoidRootPart then
            humanoidRootPart.Velocity = -humanoidRootPart.CFrame.RightVector * velocidade
        end
        task.wait()
    end
end)

local botaoDireita = criarBotaoImagem("BotaoDireita", UDim2.new(1, -140, 0.3, 0), "18478249606", 90, function()
    voando = true
    while voando do
        if humanoidRootPart then
            humanoidRootPart.Velocity = humanoidRootPart.CFrame.RightVector * velocidade
        end
        task.wait()
    end
end)

local function pararVoo()
    voando = false
    if humanoidRootPart then
        humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    end
end

botaoFrente.MouseButton1Up:Connect(pararVoo)
botaoTras.MouseButton1Up:Connect(pararVoo)
botaoEsquerda.MouseButton1Up:Connect(pararVoo)
botaoDireita.MouseButton1Up:Connect(pararVoo)

local botaoTurbo = Instance.new("ImageButton", telaGui)
botaoTurbo.Size = UDim2.new(0, 60, 0, 60)
botaoTurbo.Position = UDim2.new(1, -130, 0, 10)
botaoTurbo.BackgroundTransparency = 1
botaoTurbo.Image = "rbxassetid://97607579386418"
botaoTurbo.MouseButton1Down:Connect(function()
    velocidade = 300
end)

local botaoMinimizar = Instance.new("TextButton", telaGui)
botaoMinimizar.Size = UDim2.new(0, 60, 0, 60)
botaoMinimizar.Position = UDim2.new(0, 10, 0, 10)
botaoMinimizar.BackgroundTransparency = 1
botaoMinimizar.Text = "-"
botaoMinimizar.TextSize = 40
botaoMinimizar.TextColor3 = Color3.fromRGB(255, 255, 255)

local botoes = {botaoFrente, botaoTras, botaoEsquerda, botaoDireita, botaoTurbo}

local minimizado = false

local function alternarBotoes()
    minimizado = not minimizado
    for _, botao in ipairs(botoes) do
        botao.Visible = not minimizado
    end
    
    if minimizado then
        botaoMinimizar.Text = "+"
    else
        botaoMinimizar.Text = "-"
    end
end

botaoMinimizar.MouseButton1Down:Connect(alternarBotoes)    
    end
})

CarTab:AddParagraph({"Warn", "Both turbos/Speed do not need Gamepass"})

local MusicSection = CarTab:AddSection({"Music"})

local musicIds = {
    "71373562243752", "138129019858244", "138480372357526", "122199933878670",
    "74187181906707", "82793916573031", "107421761958790", "91394092603440",
    "113198957973421", "81452315991527", "93786060174790", "74752089069476",
    "131592235762789", "132081774507495", "124394293950763", "83381647646350",
    "16190782181", "1841682637", "3148329638", "124928367733395",
    "106317184644394", "100247055114504", "107035638005233", "109351649716900",
    "84751398517083", "125259969174449", "89269071829332", "88094479399489",
    "72440232513341", "92893359226454", "111281710445018", "98677515506006",
    "105882833374061", "104541292443133", "105832154444494", "84733736048142",
    "94718473830640", "130324826943718", "123039027577735", "113312785512702",
    "139161205970637", "113768944849093", "135667903253566", "81335392002580",
    "77428091165211", "14145624031", "8080255618", "8654835474",
    "13530439502", "18841894272", "90323407842935", "136932193331774",
    "113504863495384", "1836175030", "79998949362539", "109188610023287",
    "134939857094956", "132245626038510", "124567809277408", "72591334498716",
    "76578817848504", "17422156627", "81902909302285", "130449561461006",
    "110519234838026", "106434295960535", "86271123924168", "85481949732828",
    "106476166672589", "87968531262747", "73966367524216", "137962454483542",
    "98371771055411", "111668097052966", "140095882383991", "122873874738223",
    "105461615542794"
}

local function playCarMusic(musicId)
    if musicId and musicId ~= "" then
        local carArgs = {
            [1] = "PickingCarMusicText",
            [2] = musicId
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(carArgs))
    end
end

local function playScooterMusic(musicId)
    if musicId and musicId ~= "" then
        local scooterArgs = {
            [1] = "PickingScooterMusicText",
            [2] = musicId
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(scooterArgs))
    end
end

CarTab:AddTextBox({
    Name = "Music ID (Gamepass Required)",
    PlaceholderText = "Type Here...",
    Callback = function(value)
        playCarMusic(value)
        playScooterMusic(value)
    end
})

CarTab:AddDropdown({
    Name = "Select Music (Gamepass Required)",
    Options = musicIds,
    Callback = function(value)
        playCarMusic(value)
        playScooterMusic(value)
    end
})

CarTab:AddParagraph({"Note", "The music script works in all Vehicles"})

local RGBSection = CarTab:AddSection({"Vehicle"})

CarTab:AddToggle({
    Name = "Vehicle RGB",
    Default = false,
    Callback = function(state)
        isColorChanging = state
        if isColorChanging then
            colorChangeCoroutine = coroutine.create(changeCarColor)
            coroutine.resume(colorChangeCoroutine)
        end
    end
})

CarTab:AddParagraph({"Note", "Enabling this will make your car RGB"})

local HornSection = CarTab:AddSection({"Spam"})

local spamming = false
local args = {"Horn"}

local function spamHorn()
    while spamming do
        remoteEvent:FireServer(unpack(args))
        wait(0.1)
    end
end

CarTab:AddToggle({
    Name = "Spam Horn",
    Default = false,
    Callback = function(value)
        spamming = value
        if spamming then
            spawn(spamHorn)
        end
    end
})

local carList = {
    "SchoolBus", "SmartCar", "FarmTruck", "Cadillac", "Excavator",
    "Jeep", "NascarTruck", "TowTruck", "Snowplow", "MilitaryTruck",
    "Tank", "Limo", "FireTruck"
}

local spamCarsActive = false

local function spawnCar(carName)
    local args = {
        [1] = "PickingCar",
        [2] = carName
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end

CarTab:AddToggle({
    Name = "Spam Vehicles",
    Default = false,
    Callback = function(state)
        spamCarsActive = state
        if spamCarsActive then
            task.spawn(function()
                while spamCarsActive do
                    for _, carName in ipairs(carList) do
                        if not spamCarsActive then break end
                        spawnCar(carName)
                        wait(0.4)
                    end
                end
            end)
        end
    end
})

local FlySection = CarTab:AddSection({"Other"})

CarTab:AddButton({
    Name = "Fly Vehicle",
    Callback = function()
local Flymguiv2 = Instance.new("ScreenGui")
local Drag = Instance.new("Frame")
local FlyFrame = Instance.new("Frame")
local ddnsfbfwewefe = Instance.new("TextButton")
local Speed = Instance.new("TextBox")
local Fly = Instance.new("TextButton")
local Speeed = Instance.new("TextLabel")
local Stat = Instance.new("TextLabel")
local Stat2 = Instance.new("TextLabel")
local Unfly = Instance.new("TextButton")
local Vfly = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
local Flyon = Instance.new("Frame")
local W = Instance.new("TextButton")
local S = Instance.new("TextButton")

Flymguiv2.Name = "Car Fly"
Flymguiv2.Parent = game.CoreGui
Flymguiv2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Drag.Name = "Drag"
Drag.Parent = Flymguiv2
Drag.Active = true
Drag.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Drag.BorderSizePixel = 0
Drag.Draggable = true
Drag.Position = UDim2.new(0.482438415, 0, 0.454874992, 0)
Drag.Size = UDim2.new(0, 237, 0, 27)

FlyFrame.Name = "FlyFrame"
FlyFrame.Parent = Drag
FlyFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
FlyFrame.BorderSizePixel = 0
FlyFrame.Draggable = true
FlyFrame.Position = UDim2.new(-0.00200000009, 0, 0.989000022, 0)
FlyFrame.Size = UDim2.new(0, 237, 0, 139)

Speed.Name = "Speed"
Speed.Parent = FlyFrame
Speed.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
Speed.BorderColor3 = Color3.fromRGB(0, 0, 191)
Speed.BorderSizePixel = 0
Speed.Position = UDim2.new(0.445025861, 0, 0.402877688, 0)
Speed.Size = UDim2.new(0, 111, 0, 33)
Speed.Font = Enum.Font.SourceSans
Speed.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Speed.Text = "50"
Speed.TextColor3 = Color3.fromRGB(255, 255, 255)
Speed.TextScaled = true
Speed.TextSize = 14.000
Speed.TextWrapped = true

Fly.Name = "Fly"
Fly.Parent = FlyFrame
Fly.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Fly.BorderSizePixel = 0
Fly.Position = UDim2.new(0.0759493634, 0, 0.705797076, 0)
Fly.Size = UDim2.new(0, 199, 0, 32)
Fly.Font = Enum.Font.SourceSans
Fly.Text = "Enable"
Fly.TextColor3 = Color3.fromRGB(255, 255, 255)
Fly.TextScaled = true
Fly.TextSize = 14.000
Fly.TextWrapped = true
Fly.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	Fly.Visible = false
	Stat2.Text = "On"
	Stat2.TextColor3 = Color3.fromRGB(0, 255, 0)
	Unfly.Visible = true
	Flyon.Visible = true
	local BV = Instance.new("BodyVelocity",HumanoidRP)
	local BG = Instance.new("BodyGyro",HumanoidRP)
	BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	game:GetService('RunService').RenderStepped:connect(function()
	BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
	BG.D = 5000
	BG.P = 100000
	BG.CFrame = game.Workspace.CurrentCamera.CFrame
	end)
end)

Speeed.Name = "Speeed"
Speeed.Parent = FlyFrame
Speeed.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Speeed.BorderSizePixel = 0
Speeed.Position = UDim2.new(0.0759493634, 0, 0.402877688, 0)
Speeed.Size = UDim2.new(0, 87, 0, 32)
Speeed.ZIndex = 0
Speeed.Font = Enum.Font.SourceSans
Speeed.Text = "Speed:"
Speeed.TextColor3 = Color3.fromRGB(255, 255, 255)
Speeed.TextScaled = true
Speeed.TextSize = 14.000
Speeed.TextWrapped = true

Stat.Name = "Stat"
Stat.Parent = FlyFrame
Stat.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Stat.BorderSizePixel = 0
Stat.Position = UDim2.new(0.299983799, 0, 0.239817441, 0)
Stat.Size = UDim2.new(0, 85, 0, 15)
Stat.Font = Enum.Font.SourceSans
Stat.Text = "Status:"
Stat.TextColor3 = Color3.fromRGB(255, 255, 255)
Stat.TextScaled = true
Stat.TextSize = 14.000
Stat.TextWrapped = true

Stat2.Name = "Stat2"
Stat2.Parent = FlyFrame
Stat2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Stat2.BorderSizePixel = 0
Stat2.Position = UDim2.new(0.546535194, 0, 0.239817441, 0)
Stat2.Size = UDim2.new(0, 27, 0, 15)
Stat2.Font = Enum.Font.SourceSans
Stat2.Text = "Off"
Stat2.TextColor3 = Color3.fromRGB(255, 0, 0)
Stat2.TextScaled = true
Stat2.TextSize = 14.000
Stat2.TextWrapped = true

Unfly.Name = "Unfly"
Unfly.Parent = FlyFrame
Unfly.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Unfly.BorderSizePixel = 0
Unfly.Position = UDim2.new(0.0759493634, 0, 0.705797076, 0)
Unfly.Size = UDim2.new(0, 199, 0, 32)
Unfly.Visible = false
Unfly.Font = Enum.Font.SourceSans
Unfly.Text = "Disable"
Unfly.TextColor3 = Color3.fromRGB(255, 255, 255)
Unfly.TextScaled = true
Unfly.TextSize = 14.000
Unfly.TextWrapped = true
Unfly.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	Fly.Visible = true
	Stat2.Text = "Off"
	Stat2.TextColor3 = Color3.fromRGB(255, 0, 0)
	wait()
	Unfly.Visible = false
	Flyon.Visible = false
	HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
	HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
end)

Vfly.Name = "Vfly"
Vfly.Parent = Drag
Vfly.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Vfly.BorderSizePixel = 0
Vfly.Size = UDim2.new(0, 57, 0, 27)
Vfly.Font = Enum.Font.SourceSans
Vfly.Text = "Car fly"
Vfly.TextColor3 = Color3.fromRGB(255, 255, 255)
Vfly.TextScaled = true
Vfly.TextSize = 14.000
Vfly.TextWrapped = true

Close.Name = "Close"
Close.Parent = Drag
Close.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.875, 0, 0, 0)
Close.Size = UDim2.new(0, 27, 0, 27)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.MouseButton1Click:Connect(function()
	Flymguiv2:Destroy()
end)

Minimize.Name = "Minimize"
Minimize.Parent = Drag
Minimize.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.75, 0, 0, 0)
Minimize.Size = UDim2.new(0, 27, 0, 27)
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "-"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextScaled = true
Minimize.TextSize = 14.000
Minimize.TextWrapped = true
function Mini()
	if Minimize.Text == "-" then
		Minimize.Text = "+"
		FlyFrame.Visible = false
	elseif Minimize.Text == "+" then
		Minimize.Text = "-"
		FlyFrame.Visible = true
	end
end
Minimize.MouseButton1Click:Connect(Mini)

Flyon.Name = "Fly on"
Flyon.Parent = Flymguiv2
Flyon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Flyon.BorderSizePixel = 0
Flyon.Position = UDim2.new(0.117647067, 0, 0.550284624, 0)
Flyon.Size = UDim2.new(0.148000002, 0, 0.314999998, 0)
Flyon.Visible = false
Flyon.Active = true
Flyon.Draggable = true

W.Name = "W"
W.Parent = Flyon
W.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
W.BorderSizePixel = 0
W.Position = UDim2.new(0.134719521, 0, 0.0152013302, 0)
W.Size = UDim2.new(0.708999991, 0, 0.499000013, 0)
W.Font = Enum.Font.SourceSans
W.Text = "^"
W.TextColor3 = Color3.fromRGB(255, 255, 255)
W.TextScaled = true
W.TextSize = 14.000
W.TextWrapped = true
W.TouchLongPress:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)

W.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)

S.Name = "S"
S.Parent = Flyon
S.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
S.BorderSizePixel = 0
S.Position = UDim2.new(0.134000003, 0, 0.479999989, 0)
S.Rotation = 180.000
S.Size = UDim2.new(0.708999991, 0, 0.499000013, 0)
S.Font = Enum.Font.SourceSans
S.Text = "^"
S.TextColor3 = Color3.fromRGB(255, 255, 255)
S.TextScaled = true
S.TextSize = 14.000
S.TextWrapped = true
S.TouchLongPress:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)

S.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)
    end
})

CarTab:AddParagraph({"Note", "When activated this you can fly with your car"})

local pl = game.Players.LocalPlayer
local players = {}

local function updatePlayerList()
    players = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    return players
end

updatePlayerList()

local ChildTab = Window:MakeTab({"Child", "baby"})

local Section = ChildTab:AddSection({
    Name = "Child"
})

local chasingplayer = nil
local playerChild = ChildTab:AddDropdown({
    Name = "Select a player to chase",
    Options = players,
    Default = "",
    Callback = function(selected)
        if game.Players:FindFirstChild(selected) then
            chasingplayer = selected
        else
            chasingplayer = nil
        end
    end
})

ChildTab:AddButton({
    Name = "Update Player List",
    Callback = function()
        local updatedPlayers = updatePlayerList()
        if playerChild and updatedPlayers then
            pcall(function()
                playerChild:Refresh(updatedPlayers)
            end)
            if chasingplayer and not game.Players:FindFirstChild(chasingplayer) then
                chasingplayer = nil
                pcall(function()
                    playerChild:Set("")
                end)
            end
        end
    end
})

game.Players.PlayerAdded:Connect(function()
    task.wait(0.1)
    local updatedPlayers = updatePlayerList()
    if playerChild and updatedPlayers then
        pcall(function()
            playerChild:Refresh(updatedPlayers)
        end)
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    task.wait(0.1)
    local updatedPlayers = updatePlayerList()
    if playerChild and updatedPlayers then
        pcall(function()
            playerChild:Refresh(updatedPlayers)
        end)
        if chasingplayer == player.Name then
            chasingplayer = nil
            pcall(function()
                playerChild:Set("")
            end)
        end
    end
end)

ChildTab:AddButton({
    Name = "Send Child",
    Callback = function()
        if not chasingplayer then
            return
        end
        if not workspace:FindFirstChild(pl.Name) or not workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            local args = {
                [1] = "CharacterFollowSpawnPlayer",
                [2] = "BabyBoy"
            }
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
            end)
            if not success then
            end
        end
        
        task.wait(0.2)
        
        if workspace:FindFirstChild(pl.Name) then
            for _, v in pairs(workspace[pl.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = true
                end
            end
        end

        local target = chasingplayer
        if workspace:FindFirstChild(target) and workspace:FindFirstChild(pl.Name) and workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            workspace[pl.Name].FollowCharacter.Parent = workspace[target]

            if rawget(getgenv(), "RunService") then
                return
            end

            getgenv().RunService = game:GetService("RunService").Heartbeat:Connect(function()
                local followCharacter = workspace[target]:FindFirstChild("FollowCharacter")
                if followCharacter and followCharacter:FindFirstChild("Torso") and followCharacter.Torso:FindFirstChild("BodyPosition") then
                    local humanoidRootPart = workspace[target]:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        followCharacter.Torso.BodyPosition.Position = humanoidRootPart.Position - (humanoidRootPart.CFrame.LookVector * 3)
                        followCharacter.Torso.BodyGyro.CFrame = humanoidRootPart.CFrame
                    end
                end
            end)
        end
    end
})

ChildTab:AddButton({
    Name = "Return Child",
    Callback = function()
        if rawget(getgenv(), "RunService") then
            getgenv().RunService:Disconnect()
            getgenv().RunService = nil
        end

        local args = { [1] = "DeleteFollowCharacter" }
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
        end)
        if not success then
        end

        local args1 = { [1] = "CharacterFollowSpawnPlayer", [2] = "BabyBoy" }
        success, err = pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args1))
        end)
        if not success then
        end
    end
})

ChildTab:AddToggle({
    Name = "View Player",
    Default = false,
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        local Camera = workspace.CurrentCamera

        if Value then
            if not chasingplayer then
                return false
            end

            if not rawget(getgenv(), "CameraConnection") then
                getgenv().CameraConnection = RunService.Heartbeat:Connect(function()
                    local targetPlayer = Players:FindFirstChild(chasingplayer)
                    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                        Camera.CameraSubject = targetPlayer.Character.Humanoid
                    else
                        if rawget(getgenv(), "CameraConnection") then
                            getgenv().CameraConnection:Disconnect()
                            getgenv().CameraConnection = nil
                        end
                        Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or nil
                    end
                end)
            end
        else
            if rawget(getgenv(), "CameraConnection") then
                getgenv().CameraConnection:Disconnect()
                getgenv().CameraConnection = nil
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
            end
        end
    end
})

local LocalPlayerTab = Window:MakeTab({"Local Player", "user"})

local Section = LocalPlayerTab:AddSection({
    Name = "Local Player"
})

LocalPlayerTab:AddTextBox({
    Name = "Walk Speed",
    PlaceholderText = "Type here...",
    Callback = function(value)
        local speed = tonumber(value)
        if speed and pl.Character and pl.Character:FindFirstChild("Humanoid") then
            pl.Character.Humanoid.WalkSpeed = speed
        else
        end
    end
})

LocalPlayerTab:AddButton({
    Name = "Reset Walk Speed",
    Callback = function()
        if pl.Character and pl.Character:FindFirstChild("Humanoid") then
            pl.Character.Humanoid.WalkSpeed = 16
        end
    end
})

LocalPlayerTab:AddTextBox({
    Name = "Jump Power",
    PlaceholderText = "Type here...",
    Callback = function(value)
        local jumpHeight = tonumber(value)
        if jumpHeight and pl.Character and pl.Character:FindFirstChild("Humanoid") then
            pl.Character.Humanoid.JumpPower = jumpHeight
        else
        end
    end
})

LocalPlayerTab:AddButton({
    Name = "Reset Jump Power",
    Callback = function()
        if pl.Character and pl.Character:FindFirstChild("Humanoid") then
            pl.Character.Humanoid.JumpPower = 50
        end
    end
})

LocalPlayerTab:AddTextBox({
    Name = "Gravity",
    PlaceholderText = "Type here...",
    Callback = function(value)
        local gravity = tonumber(value)
        if gravity then
            workspace.Gravity = gravity
        else
        end
    end
})

LocalPlayerTab:AddButton({
    Name = "Reset Gravity",
    Callback = function()
        workspace.Gravity = 196.2
    end
})

Section = LocalPlayerTab:AddSection({
    Name = "Chat"
})

local TextSave
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration and tcs.ChatInputBarConfiguration.TargetTextChannel

function sendchat(msg)
    if not msg or msg == "" then return end
    if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg, "All")
        end)
        if not success then
        end
    elseif chat then
        local success, err = pcall(function()
            chat:SendAsync(msg)
        end)
        if not success then
        end
    end
end

LocalPlayerTab:AddTextBox({
    Name = "Enter Text",
    PlaceholderText = "Uh... Hi!",
    Callback = function(text)
        TextSave = text
    end
})

LocalPlayerTab:AddButton({
    Name = "Send Chat",
    Callback = function()
        sendchat(TextSave)
    end
})

getgenv().ChaosHubEnviarDelay = 1

LocalPlayerTab:AddSlider({
    Name = "Delay Spam",
    Min = 0.4,
    Max = 10,
    Default = 1,
    Increment = 0.1,
    Callback = function(Value)
        getgenv().ChaosHubEnviarDelay = Value
    end
})

LocalPlayerTab:AddToggle({
    Name = "Spam Chat",
    Default = false,
    Flag = "SpamXhati",
    Callback = function(Value)
        getgenv().ChaosHubSpawnText = Value
        while getgenv().ChaosHubSpawnText do
            sendchat(TextSave)
            task.wait(getgenv().ChaosHubEnviarDelay)
        end
    end
})

LocalPlayerTab:AddButton({
    Name = "Spam Chat - Hacked by S4turn Hub",
    Callback = function()
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then 
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rSystem: Hacked by S4turn Hub")
        else 
    end
end
})

LocalPlayerTab:AddButton({
    Name = "Clear Chat",
    Callback = function()
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then 
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rServer: Chat Cleared")
        else 
    end
end
})

local Tab = Window:MakeTab({"Teleports", "tp"}) 

local Section = Tab:AddSection({
    Name = "Teleports"
})

local teleportButtons = {
    {"Hotel", CFrame.new(192, 4, 272)},
    {"Urban Center", CFrame.new(136, 4, 117)},
    {"Criminal Area", CFrame.new(-119, -28, 235)},
    {"Abandoned House", CFrame.new(986, 4, 63)},
    {"Agency Portal", CFrame.new(672, 4, -296)},
    {"Hideout", CFrame.new(505, -75, 143)},
    {"School", CFrame.new(-312, 4, 211)},
    {"Burguer Barn", CFrame.new(161, 8, 52)},
    {"Starting Point", CFrame.new(-26, 4, -23)},
    {"Main Arch", CFrame.new(-589, 141, -59)},
    {"Hospital", CFrame.new(-309, 4, 71)},
    {"Agency Base", CFrame.new(179, 4, -464)},
    {"Hidden Place of the Workshop", CFrame.new(0, 4, -495)},
    {"Secret Place", CFrame.new(-343, 4, -613)},
    {"Isolated Island", CFrame.new(-1925, 23, 127)},
    {"Hotel Square", CFrame.new(182, 4, 150)},
    {"Climb Mountain", CFrame.new(-670, 251, 765)},
    {"Main Bank", CFrame.new(2.28, 4.65, 254.58)},
    {"Clothing Store", CFrame.new(-46.15, 4.65, 253.20)},
    {"Veterinary", CFrame.new(-88.48, 22.05, 262.34)},
    {"Dental Clinic", CFrame.new(-53.58, 22.15, 265.61)},
    {"Coffee", CFrame.new(-97.12, 4.65, 254.99)}
}

for _, btn in ipairs(teleportButtons) do
    Tab:AddButton({
        btn[1],
        function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = btn[2]
        end
    })
end



local ToolsTab = Window:MakeTab({"Itens [ Update! ]", "backpack"})

local SectionDupl = ToolsTab:AddSection({
Name = "Duplicate Laptops"
})
ToolsTab:AddButton({
Name = "Duplicate Laptops (Required for Some Things)",
Callback = function()
-- Função para simular clique normal
local function clickNormally(object)
local clickDetector = object:FindFirstChildWhichIsA("ClickDetector")
if clickDetector then
fireclickdetector(clickDetector)
end
end

-- Encontrar o laptop
local laptop = workspace:FindFirstChild("WorkspaceCom")
if laptop then
laptop = laptop:FindFirstChild("001_GiveTools")
if laptop then
laptop = laptop:FindFirstChild("Laptop")
end
end

if laptop then
local player = game.Players.LocalPlayer
local character = player.Character
if character and character:FindFirstChild("HumanoidRootPart") then
local startTime = tick()  -- Marca o tempo de início
while tick() - startTime < 60 do  -- Loop por 60 segundos
-- Teleportar para o laptop
character.HumanoidRootPart.CFrame = laptop.CFrame
-- Clicar continuamente
clickNormally(laptop)
-- Delay para evitar crash
task.wait(0.25)
end

-- Desequipar todas as ferramentas, mantendo-as no inventário    
    local backpack = player:FindFirstChildOfClass("Backpack")    
    if backpack then    
        for _, tool in ipairs(character:GetChildren()) do    
            if tool:IsA("Tool") then    
                tool.Parent = backpack  -- Move a ferramenta da mão para o inventário    
            end    
        end    
    end    

    print("Parou de clicar após 60 segundos e ferramentas foram desequipadas.")    
else    
    warn("HumanoidRootPart não encontrado.")    
end

else
warn("Laptop não encontrado.")
end
end
})

-- Referências aos remotes
local cleartoolremote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clea1rTool1s")
local picktoolremote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l")

-- Seção de controle de itens
local Section = ToolsTab:AddSection({
Name = "Items Control"
})

-- Botão para limpar todas as ferramentas
ToolsTab:AddButton({
Name = "Clear All Tools",
Callback = function()
local args = {
[1] = "ClearAllTools"
}
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
end
})

-- Seção para equipar itens
Section = ToolsTab:AddSection({
Name = "Equip Items"
})

-- Botão para equipar todos os itens
ToolsTab:AddButton({
Name = "Equipar todos os itens",
Callback = function()
for _, tool in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if tool:IsA("Tool") then
tool.Parent = game.Players.LocalPlayer.Character
end
end
end
})

-- Seção para Testes
Section = ToolsTab:AddSection({
Name = "Super Aura Things/Tools"
})

-- Botão para Super Aura Smoke
ToolsTab:AddButton({
Name = "Super Aura Smoke [ NEW ! ]",
Description = "A aura vai aparecer se vc segurar a tela, aí a fumaça vai aparecendo!",
Callback = function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Caminho do FireX
local fireXPath = workspace:FindFirstChild("WorkspaceCom")
and workspace.WorkspaceCom:FindFirstChild("001_GiveTools")
and workspace.WorkspaceCom["001_GiveTools"]:FindFirstChild("FireX")

local nametools = "crystal nazi lel"
local oldcframe = LocalPlayer.Character.HumanoidRootPart.CFrame
local attempts = 57
local delayBetweenClicks = 0.3

-- Grip e Handle
local gripBase = CFrame.new(-0.290086746, 0.0755810738, -0.0109872818, 0.0439560413, 0.509705901, -0.859225094, -0.0591450632, -0.857220173, -0.511542261, -0.997281134, 0.0733042806, -0.00753343105)
local handleOffset = CFrame.new(2, 1, -3)

-- Velocidade absurda de rotação (sempre)
local rotSpeed = math.rad(3600) -- 3600°/s

-- Função de clique na ferramenta
local function clickTool(object)
local clickDetector = object:FindFirstChildWhichIsA("ClickDetector")
if clickDetector then
fireclickdetector(clickDetector)
end
end

-- Configura Grip e Handle
local function setupTool(tool)
tool.Grip = gripBase
tool.Name = nametools

local handle = tool:FindFirstChild("Handle")    
if handle then    
    local weld = handle:FindFirstChildWhichIsA("Motor6D")    
    if weld then weld:Destroy() end    

    -- HandleOffset fixo    
    RunService.RenderStepped:Connect(function()    
        if handle.Parent == LocalPlayer.Character then    
            handle.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * handleOffset    
        end    
    end)    
end    

tool.Parent = LocalPlayer.Character

end

-- Rotação contínua infinita
RunService.RenderStepped:Connect(function(deltaTime)
local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if hrp then
hrp.CFrame = hrp.CFrame * CFrame.Angles(0, rotSpeed * deltaTime, 0)
end
end)

-- Função de duplicação do FireX
local function dupeToolsFireX(fireXPath)
if not fireXPath then
warn("FireX não encontrado.")
return
end

local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")    
if not hrp then return end    

hrp.CFrame = fireXPath.CFrame    

for i = 1, attempts do    
    clickTool(fireXPath)    
    task.wait(delayBetweenClicks)    

    local tool = LocalPlayer.Backpack:FindFirstChild("FireX")    
    if tool then    
        setupTool(tool)    
    end    
end    

hrp.CFrame = oldcframe

end

-- Executa o dupe
dupeToolsFireX(fireXPath)
end
})

local SectionToolW = ToolsTab:AddSection({
Name = "Tool Writer (doesnt support more than 10 letters)"
})

ToolsTab:AddButton({
Name = "Tool Writer (10 Letters)",
Callback = function()
if getgenv()._Running then
warn("Already running")
return
end
getgenv()._Running = true

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local CHAR_MAP = {
["A"] = {"01110","10001","10001","11111","10001","10001","10001"},
["B"] = {"11110","10001","10001","11110","10001","10001","11110"},
["C"] = {"01110","10001","10000","10000","10000","10001","01110"},
["D"] = {"11110","10001","10001","10001","10001","10001","11110"},
["E"] = {"11111","10000","10000","11110","10000","10000","11111"},
["F"] = {"11111","10000","10000","11110","10000","10000","10000"},
["G"] = {"01110","10001","10000","10111","10001","10001","01110"},
["H"] = {"10001","10001","10001","11111","10001","10001","10001"},
["I"] = {"111","010","010","010","010","010","111"},
["J"] = {"00111","00010","00010","00010","10010","10010","01100"},
["K"] = {"10001","10010","10100","11000","10100","10010","10001"},
["L"] = {"10000","10000","10000","10000","10000","10000","11111"},
["M"] = {"10001","11011","10101","10101","10001","10001","10001"},
["N"] = {"10001","11001","10101","10011","10001","10001","10001"},
["O"] = {"01110","10001","10001","10001","10001","10001","01110"},
["P"] = {"11110","10001","10001","11110","10000","10000","10000"},
["Q"] = {"01110","10001","10001","10001","10101","10010","01101"},
["R"] = {"11110","10001","10001","11110","10100","10010","10001"},
["S"] = {"01111","10000","10000","01110","00001","00001","11110"},
["T"] = {"11111","00100","00100","00100","00100","00100","00100"},
["U"] = {"10001","10001","10001","10001","10001","10001","01110"},
["V"] = {"10001","10001","10001","10001","10001","01010","00100"},
["W"] = {"10001","10001","10001","10101","10101","11011","10001"},
["X"] = {"10001","01010","00100","00100","01010","10001","10001"},
["Y"] = {"10001","10001","10001","01010","00100","00100","00100"},
["Z"] = {"11111","00001","00010","00100","01000","10000","11111"},
[" "] = {"00000","00000","00000","00000","00000","00000","00000"},
}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TextToolGUI"
screenGui.Parent = CoreGui
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 250, 0, 120)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -60)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "Text Former"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255, 50, 50)

local textBox = Instance.new("TextBox", mainFrame)
textBox.Size = UDim2.new(0.9, 0, 0, 30)
textBox.Position = UDim2.new(0.05, 0, 0, 40)
textBox.PlaceholderText = "Type here..."
textBox.Text = ""
textBox.TextSize = 14
textBox.Font = Enum.Font.Gotham
textBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
textBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)

local button = Instance.new("TextButton", mainFrame)
button.Size = UDim2.new(0.9, 0, 0, 30)
button.Position = UDim2.new(0.05, 0, 0, 80)
button.Text = "Form Text"
button.Font = Enum.Font.GothamBold
button.TextSize = 14
button.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
button.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

local function getTools()
local tools = {}
for _, c in ipairs({player.Backpack, player.Character}) do
for _, tool in ipairs(c:GetChildren()) do
if tool:IsA("Tool") then
table.insert(tools, tool)
end
end
end
return tools
end

local function formText(text)
local tools = getTools()
local gripMap = {}
local startPos = Vector3.new(0, -5, 0)
local pixelSize = Vector3.new(1.2, 1.2, 0)
local toolIndex = 1
local offsetX = 0

for i = 1, #text do    
    local char = text:sub(i,i):upper()    
    local map = CHAR_MAP[char]    
    if map then    
        for y = 1, #map do    
            for x = 1, #map[y] do    
                if map[y]:sub(x,x) == "1" then    
                    local tool = tools[toolIndex]    
                    if tool then    
                        gripMap[tool] = CFrame.new(    
                            startPos.X + (offsetX + x - 1) * pixelSize.X,    
                            startPos.Y + (y - 1) * pixelSize.Y,    
                            startPos.Z    
                        )    
                        toolIndex += 1    
                    end    
                end    
            end    
        end    
        offsetX += #map[1] + 1    
    end    
end    

for tool, grip in pairs(gripMap) do    
    tool.Grip = grip    
    tool.Parent = player.Character    
end

end

button.MouseButton1Click:Connect(function()
if textBox.Text ~= "" then
formText(textBox.Text)
end
end)

do
local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = mainFrame.Position

input.Changed:Connect(function()    
            if input.UserInputState == Enum.UserInputState.End then    
                dragging = false    
            end    
        end)    
    end    
end)    

mainFrame.InputChanged:Connect(function(input)    
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then    
        dragInput = input    
    end    
end)    

UserInputService.InputChanged:Connect(function(input)    
    if input == dragInput and dragging then    
        local delta = input.Position - dragStart    
        mainFrame.Position = UDim2.new(    
            startPos.X.Scale, startPos.X.Offset + delta.X,    
            startPos.Y.Scale, startPos.Y.Offset + delta.Y    
        )    
    end    
end)

end

getgenv()._Running = false
end
})


                                                                                                                        
                                                    

local AntiTab = Window:MakeTab({"Protections", "shield"})

AntiTab:AddSection({
    Name = "Protections"
})

AntiTab:AddSection({
    Name = "Tools"
})

AntiTab:AddToggle({
    Name = "Protection Sit",
    Description = "Create a protection against the Sit Tools/Objects",
    Default = false,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local connections = {}
        local runService = game:GetService("RunService")


        local function preventSitting(humanoid)
            if humanoid then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                local sitConnection = humanoid.StateChanged:Connect(function(_, newState)
                    if newState == Enum.HumanoidStateType.Seated then
                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                    end
                end)
                table.insert(connections, sitConnection)
            end
        end


        local function monitorCharacter()
            local function onCharacterAdded(character)
                local humanoid = character:WaitForChild("Humanoid")
                preventSitting(humanoid)
            end


            local characterAddedConnection = player.CharacterAdded:Connect(onCharacterAdded)
            table.insert(connections, characterAddedConnection)


            if player.Character then
                onCharacterAdded(player.Character)
            end
        end


        local function resetSitting()
            for _, connection in ipairs(connections) do
                connection:Disconnect()
            end
            connections = {}
            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            end
        end


        if Value then
            monitorCharacter()
            local heartbeatConnection = runService.Heartbeat:Connect(function()
                local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                end
            end)
            table.insert(connections, heartbeatConnection)
        else
            resetSitting()
        end
    end
})

AntiTab:AddSection({
    Name = "Bugs"
})

AntiTab:AddButton({
    Name = "Protection Bug (Irreversible)",
    Description = "Create a protection against the Bugs/Scripters",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        local blacklist = {
            {Name = "water", Class = "Part"},
        }
        
        local function neutralize(part)
            if part and part:IsA("BasePart") then
                pcall(function()
                    part.Anchored = true
                    part.CanCollide = false
                    part.Massless = true
                    part.Transparency = 1
                    part:ClearAllChildren()
                end)
                pcall(function()
                    part:Destroy()
                end)
            end
        end
        
        workspace.DescendantAdded:Connect(function(obj)
            for _, rule in ipairs(blacklist) do
                if obj.Name == rule.Name and obj.ClassName == rule.Class then
                    neutralize(obj)
                end
            end
        end)
        
        for _, obj in ipairs(workspace:GetDescendants()) do
            for _, rule in ipairs(blacklist) do
                if obj.Name == rule.Name and obj.ClassName == rule.Class then
                    neutralize(obj)
                end
            end
        end
        
        task.spawn(function()
            while task.wait(0.25) do
                for _, rule in ipairs(blacklist) do
                    for _, v in next, getnilinstances() do
                        if v.Name == rule.Name and v.ClassName == rule.Class then
                            neutralize(v)
                        end
                    end
                end
            end
        end)
        
        LocalPlayer.CharacterAdded:Connect(function(char)
            local hum = char:WaitForChild("Humanoid")
            hum.Touched:Connect(function(hit)
                for _, rule in ipairs(blacklist) do
                    if hit.Name == rule.Name and hit.ClassName == rule.Class then
                        neutralize(hit)
                    end
                end
            end)
        end)
    end
})

AntiTab:AddSection({
    Name = "Fling"
})

AntiTab:AddButton({
    Name = "Protection Fling (Irreversible)",
    Description = "Create a protection against the Fling",
    Callback = function()
    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
 
RunService.Stepped:Connect(function()
    for _, CoPlayer in pairs(Players:GetChildren()) do
        if CoPlayer ~= Player and CoPlayer.Character then
            for _, Part in pairs(CoPlayer.Character:GetChildren()) do
                if Part.Name == "HumanoidRootPart" then
                    Part.CanCollide = false
                end
            end
        end
    end
 
    for _, Accessory in pairs(workspace:GetChildren()) do
        if Accessory:IsA("Accessory") and Accessory:FindFirstChildWhichIsA("Part") then
            Accessory:FindFirstChildWhichIsA("Part"):Destroy()
        end
    end
end)
    end
})

local ScriptsTab = Window:MakeTab({"Scripts", "codesandbox"})

ScriptsTab:AddSection({
    Name = "Scripts"
})

ScriptsTab:AddSection({
    Name = "This Place"
})
ScriptsTab:AddButton({
    Name = "Chaos Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Venom-devX/ChaosHub/refs/heads/main/loader.lua"))()
    end
})

ScriptsTab:AddButton({
    Name = "Rael Hub",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Mimic-Rael-Hub-20921"))()
    end
})

ScriptsTab:AddButton({
    Name = "Cartola Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()
    end
})

ScriptsTab:AddButton({
    Name = "Coquette Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Daivd977/Deivd999/refs/heads/main/pessal"))()
    end
})

ScriptsTab:AddButton({
    Name = "Furia Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dboas123432sx/bsx_hub/refs/heads/main/FURIAHUB-v1"))()
    end
})

ScriptsTab:AddButton({
    Name = "Drip Client",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/realgengar/Main/refs/heads/main/base.lua"),true))()
    end
})

local UniversalTab = Window:MakeTab({"Scripts Universal", "codesandbox"})

UniversalTab:AddSection({
    Name = "Scripts Universal"
})

UniversalTab:AddSection({
    Name = "All Places"
})
UniversalTab:AddButton({
    Name = "Shift Lock",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/N2tiHgyv"))()
    end
})

UniversalTab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

UniversalTab:AddButton({
    Name = "Teleport Tool",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/err0r129/KptHadesBlair/main/Bao.lua"))()
    end
})

UniversalTab:AddButton({
    Name = "Fly Gui",
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fly-v3-7412"))()
    end
})
 
UniversalTab:AddButton({
    Name = "Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end
})


UniversalTab:AddButton({
    Name = "Telekinesis",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SAZXHUB/Control-update/main/README.md", true))()
    end

})


task.delay(5, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wx-sources/ScriptAdminNew/refs/heads/main/NytheruneHubAdmin"))()
end)












