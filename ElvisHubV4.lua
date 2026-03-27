local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/SuperHackerYT/ElvisHub/refs/heads/main/lunauisourcebutmod.lua", true))()

local Window = Luna:CreateWindow({
	Name = "Elvis Hub - Luna",
	Subtitle = "A powerful script hub",
	LogoID = "82795327169782",
	LoadingEnabled = true,
	LoadingTitle = "Elvis Hub - Luna",
	LoadingSubtitle = "Elvis Hub is now Luna Edition!",

	ConfigSettings = {
		RootFolder = nil,
		ConfigFolder = "ElvisHubLuna"
	},

	KeySystem = false,
	KeySettings = {
		Title = "Elvis Hub Luna",
		Subtitle = "Key System",
		Note = "Please get the key and enter.",
		SaveInRoot = false,
		SaveKey = true,
		Key = {"1234"},
		SecondAction = {
			Enabled = true,
			Type = "Link", -- You can also put discord as an option, if your are doing that, donâ€™t include discord.gg as Luna will auto add it as a prefix, just replace it with your identifier, example, if your are doing discord.gg/mspaint, just use mspaint.
			Parameter = ""
		}
	}
})

Window:CreateHomeTab({
	SupportedExecutors = {
		"All",
		"Everything"
		},
	DiscordInvite = "7zyT99D7S3",
	Icon = 1
})

local Main = Window:CreateTab({
	Name = "Main",
	Icon = "grid_view",
	ImageSource = "Material",
	ShowTitle = true
})

Main:CreateSection("Movement")

-- Fly
local flyToggle = false
local flySpeed = 1
local FLYING = false
local flyKeyDown, flyKeyUp, mfly1, mfly2
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

-- PC Fly
local function sFLY()
    repeat task.wait() until lp and lp.Character and lp.Character:WaitForChild("HumanoidRootPart") and lp.Character:FindFirstChildOfClass("Humanoid")
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect(); flyKeyUp:Disconnect() end

    local T = lp.Character:WaitForChild("HumanoidRootPart")
    local CONTROL = {F=0,B=0,L=0,R=0,Q=0,E=0}
    local lCONTROL = {F=0,B=0,L=0,R=0,Q=0,E=0}
    local SPEED = flySpeed

    local function FLY()
        FLYING = true
        local BG = Instance.new('BodyGyro', T)
        local BV = Instance.new('BodyVelocity', T)
        BG.P = 9e4
        BG.MaxTorque = Vector3.new(9e9,9e9,9e9)
        BG.CFrame = T.CFrame
        BV.MaxForce = Vector3.new(9e9,9e9,9e9)
        BV.Velocity = Vector3.new(0,0,0)

        task.spawn(function()
            while FLYING do
                task.wait()
                if not flyToggle and lp.Character:FindFirstChildOfClass('Humanoid') then
                    lp.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                end
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                    SPEED = flySpeed
                else
                    SPEED = 0
                end
                if SPEED ~= 0 then
                    BV.Velocity = ((workspace.CurrentCamera.CFrame.LookVector * (CONTROL.F + CONTROL.B)) +
                                  ((workspace.CurrentCamera.CFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,0).p) -
                                  workspace.CurrentCamera.CFrame.p)) * SPEED
                    lCONTROL = {F=CONTROL.F,B=CONTROL.B,L=CONTROL.L,R=CONTROL.R}
                else
                    BV.Velocity = Vector3.new(0,0,0)
                end
                BG.CFrame = workspace.CurrentCamera.CFrame
            end
            BG:Destroy()
            BV:Destroy()
            if lp.Character:FindFirstChildOfClass('Humanoid') then
                lp.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
            end
        end)
    end

    flyKeyDown = UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local KEY = input.KeyCode.Name
            if KEY=="W" then CONTROL.F=flySpeed
            elseif KEY=="S" then CONTROL.B=-flySpeed
            elseif KEY=="A" then CONTROL.L=-flySpeed
            elseif KEY=="D" then CONTROL.R=flySpeed
            elseif KEY=="E" then CONTROL.Q=flySpeed*2
            elseif KEY=="Q" then CONTROL.E=-flySpeed*2 end
        end
    end)

    flyKeyUp = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local KEY = input.KeyCode.Name
            if KEY=="W" then CONTROL.F=0
            elseif KEY=="S" then CONTROL.B=0
            elseif KEY=="A" then CONTROL.L=0
            elseif KEY=="D" then CONTROL.R=0
            elseif KEY=="E" then CONTROL.Q=0
            elseif KEY=="Q" then CONTROL.E=0 end
        end
    end)

    FLY()
end

-- Stop fly
local function NOFLY()
    FLYING = false
    if flyKeyDown then flyKeyDown:Disconnect() end
    if flyKeyUp then flyKeyUp:Disconnect() end
    if mfly1 then mfly1:Disconnect() end
    if mfly2 then mfly2:Disconnect() end
    if lp.Character:FindFirstChildOfClass('Humanoid') then
        lp.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
    end
end

-- Mobile Fly
local function MobileFly()
    NOFLY()
    FLYING = true
    local root = lp.Character:WaitForChild("HumanoidRootPart")
    local camera = workspace.CurrentCamera
    local controlModule = require(lp.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
    local v3inf = Vector3.new(9e9,9e9,9e9)
    local v3none = Vector3.new(0,0,0)

    local bv = Instance.new("BodyVelocity", root)
    bv.Name = "BodyVelocity"
    bv.MaxForce = v3none
    bv.Velocity = v3none

    local bg = Instance.new("BodyGyro", root)
    bg.Name = "BodyGyro"
    bg.MaxTorque = v3inf
    bg.P = 1000
    bg.D = 50

    mfly2 = RunService.RenderStepped:Connect(function()
        root = lp.Character:WaitForChild("HumanoidRootPart")
        camera = workspace.CurrentCamera
        if lp.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild("BodyVelocity") and root:FindFirstChild("BodyGyro") then
            local humanoid = lp.Character:FindFirstChildWhichIsA("Humanoid")
            local VelocityHandler = root:FindFirstChild("BodyVelocity")
            local GyroHandler = root:FindFirstChild("BodyGyro")
            VelocityHandler.MaxForce = v3inf
            GyroHandler.MaxTorque = v3inf
            humanoid.PlatformStand = true
            GyroHandler.CFrame = camera.CFrame
            VelocityHandler.Velocity = v3none
            local direction = controlModule:GetMoveVector()
            VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (flySpeed*50))
            VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (flySpeed*50))
        end
    end)
end

local Fly = Main:CreateToggle({
    Name = "Fly",
    Description = "Gives you the ability to fly!",
    CurrentValue = false,
    Callback = function(Value)
        flyToggle = Value
        if flyToggle then
            if UserInputService.TouchEnabled then
                MobileFly()
            else
                sFLY()
            end
        else

            FLYING = false

            if flyKeyDown then flyKeyDown:Disconnect() flyKeyDown=nil end
            if flyKeyUp then flyKeyUp:Disconnect() flyKeyUp=nil end
            if mfly1 then mfly1:Disconnect() mfly1=nil end
            if mfly2 then mfly2:Disconnect() mfly2=nil end

            local root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if root then
                if root:FindFirstChild("BodyVelocity") then root.BodyVelocity:Destroy() end
                if root:FindFirstChild("BodyGyro") then root.BodyGyro:Destroy() end
            end

            local humanoid = lp.Character and lp.Character:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
    end
})

local NoClip = false

local Noclip = Main:CreateToggle({
    Name = "NoClip",
    Description = "Pass through walls",
    CurrentValue = false,
    Callback = function(Value)
    NoClip = Value 
end
})

RunService.Stepped:Connect(function()
    if NoClip then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local WalkSpeedValue = 16
local JumpPowerValue = 50

local function applyValues()
	if humanoid then
		humanoid.WalkSpeed = WalkSpeedValue
		humanoid.JumpPower = JumpPowerValue
	end
end

player.CharacterAdded:Connect(function(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
	applyValues()
end)

local Walkspeed = Main:CreateSlider({
	Name = "WalkSpeed",
	Range = {0, 200},
	Increment = 5,
	CurrentValue = WalkSpeedValue,
	Callback = function(Value)
		WalkSpeedValue = Value
		if humanoid then
			humanoid.WalkSpeed = Value
		end
	end
}, "WalkSpeed")

local JumpPower = Main:CreateSlider({
	Name = "JumpPower",
	Range = {0, 300},
	Increment = 5,
	CurrentValue = JumpPowerValue,
	Callback = function(Value)
		JumpPowerValue = Value
		if humanoid then
			humanoid.JumpPower = Value
		end
	end
}, "JumpPower")

local Gravity = Main:CreateSlider({
	Name = "Gravity",
	Range = {0, 500},
	Increment = 5,
	CurrentValue = workspace.Gravity,
	Callback = function(Value)
		workspace.Gravity = Value
	end
}, "Gravity")

Main:CreateDivider()

Main:CreateSection("Protection")

local AntiFling = Main:CreateToggle({
	Name = "AntiFling",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			antiFlingConnection = game:GetService("RunService").Heartbeat:Connect(function()
				for _, part in pairs(character:GetChildren()) do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						part.CanCollide = false
						if part.Velocity.magnitude > 50 then
							part.Velocity = Vector3.new(0,0,0)
						end
					end
				end
			end)
		else
			if antiFlingConnection then
				antiFlingConnection:Disconnect()
				antiFlingConnection = nil
			end
			for _, part in pairs(character:GetChildren()) do
				if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
					part.CanCollide = true
				end
			end
		end
	end
}, "AntiFling")

local AntiVoid = Main:CreateToggle({
	Name = "AntiVoid",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			antiVoidConnection = game:GetService("RunService").Heartbeat:Connect(function()
				if humanoidRootPart.Position.Y < -100 or humanoidRootPart.Position.Y > 400 then
					humanoidRootPart.CFrame = lastSafePosition
				end
			end)

			positionConnection = game:GetService("RunService").Heartbeat:Connect(function()
				if humanoidRootPart.Velocity.magnitude < 50 and humanoidRootPart.RotVelocity.magnitude < 50 then
					lastSafePosition = humanoidRootPart.CFrame
				end
			end)

			velocityConnection = game:GetService("RunService").Stepped:Connect(function()
				if humanoidRootPart.Velocity.magnitude > 50 then
					humanoidRootPart.Velocity = Vector3.new(0,0,0)
				end
				if humanoidRootPart.RotVelocity.magnitude > 50 then
					humanoidRootPart.RotVelocity = Vector3.new(0,0,0)
				end
			end)
		else
			if antiVoidConnection then antiVoidConnection:Disconnect() antiVoidConnection = nil end
			if positionConnection then positionConnection:Disconnect() positionConnection = nil end
			if velocityConnection then velocityConnection:Disconnect() velocityConnection = nil end
		end
	end
}, "AntiVoid")

local AntiKillPart = Main:CreateToggle({
	Name = "Anti-KillPart / Anti-TouchPart",
	CurrentValue = false,
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()

		for _, part in pairs(character:GetChildren()) do
			if part:IsA("BasePart") then
				part.CanCollide = not Value
			end
		end
	end
}, "AntiKillPart")

Main:CreateDivider()

Main:CreateSection("Troll")

local WalkFling = Main:CreateToggle({
	Name = "Walk Fling",
	CurrentValue = false,
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local Root = character:WaitForChild("HumanoidRootPart")
		local Humanoid = character:WaitForChild("Humanoid")
		local walkflinging

		local function startFling(char)
			local Root = char:WaitForChild("HumanoidRootPart")
			local Humanoid = char:WaitForChild("Humanoid")
			walkflinging = true
			Root.CanCollide = false
			Humanoid:ChangeState(11)

			spawn(function()
				while walkflinging and Root and Root.Parent do
					game:GetService("RunService").Heartbeat:Wait()
					local vel = Root.Velocity
					Root.Velocity = vel * 99999999 + Vector3.new(0, 99999999, 0)
					game:GetService("RunService").RenderStepped:Wait()
					Root.Velocity = vel
					game:GetService("RunService").Stepped:Wait()
					Root.Velocity = vel + Vector3.new(0, 0.1, 0)
				end
			end)
		end

		if Value then
			startFling(character)
			player.CharacterAdded:Connect(startFling)
		else
			walkflinging = false
			if Root then
				Root.CanCollide = true
			end
		end
	end
}, "WalkFling")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local invisEnabled = false

local function setTransparency(character, transparency)
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") then
            part.Transparency = transparency
        end
    end
end

local function toggleInvis(state)
    invisEnabled = state
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    if invisEnabled then
        local savedPos = char.HumanoidRootPart.CFrame
        task.wait()
        char:MoveTo(Vector3.new(-25.95, 84, 3537.55))
        task.wait(0.15)

        local Seat = Instance.new("Seat", workspace)
        Seat.Anchored = false
        Seat.CanCollide = false
        Seat.Name = "invischair"
        Seat.Transparency = 0.1
        Seat.Position = Vector3.new(-25.95, 84, 3537.55)

        local Weld = Instance.new("Weld", Seat)
        Weld.Part0 = Seat
        Weld.Part1 = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")

        task.wait()
        Seat.CFrame = savedPos
        setTransparency(char, 0.75)
    else
        local invisChair = workspace:FindFirstChild("invischair")
        if invisChair then invisChair:Destroy() end
        if LocalPlayer.Character then
            setTransparency(LocalPlayer.Character, 0)
        end
    end
end

Main:CreateToggle({
    Name = "Invisible",
    CurrentValue = false,
    Callback = function(Value)
        toggleInvis(Value)
    end
}, "Invisibility")

local LocalPlayer = Players.LocalPlayer  
local Workspace = game:GetService("Workspace")  

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()  
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")  

local Folder = Instance.new("Folder", Workspace)  
local Part = Instance.new("Part", Folder)  
local Attachment1 = Instance.new("Attachment", Part)  
Part.Anchored = true  
Part.CanCollide = false  
Part.Transparency = 1

if not getgenv().Network then  
    getgenv().Network = { BaseParts = {}, Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424) }  

    Network.RetainPart = function(Part)  
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then  
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

local radius = 50  
local height = 100  
local rotationSpeed = 0.5  
local attractionStrength = 1000  
local ringPartsEnabled = false  

local function RetainPart(Part)  
    if Part:IsA("BasePart") and not Part.Anchored and Part:IsDescendantOf(Workspace) then  
        if Part.Parent == LocalPlayer.Character or Part:IsDescendantOf(LocalPlayer.Character) then return false end  
        Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)  
        Part.CanCollide = false  
        return true  
    end  
    return false  
end  

local parts = {}  
local function addPart(part)  
    if RetainPart(part) and not table.find(parts, part) then  
        table.insert(parts, part)  
    end  
end  

local function removePart(part)  
    local index = table.find(parts, part)  
    if index then table.remove(parts, index) end  
end  

for _, part in pairs(Workspace:GetDescendants()) do addPart(part) end  
Workspace.DescendantAdded:Connect(addPart)  
Workspace.DescendantRemoving:Connect(removePart)  

Main:CreateToggle({
	Name = "Ring Unanchored Parts",
	CurrentValue = false,
	Callback = function(Value)
		ringPartsEnabled = Value
	end
}, "RingParts")

Main:CreateSlider({
	Name = "Ring Radius",
	Range = {10, 100},
	Increment = 1,
	CurrentValue = radius,
	Callback = function(Value)
		radius = Value
	end
}, "RingRadius")

Main:CreateSlider({
	Name = "Ring Speed",
	Range = {0.1, 5},
	Increment = 0.1,
	CurrentValue = rotationSpeed,
	Callback = function(Value)
		rotationSpeed = Value
	end
}, "RingSpeed")

Main:CreateSlider({
	Name = "Ring Attraction",
	Range = {100, 5000},
	Increment = 50,
	CurrentValue = attractionStrength,
	Callback = function(Value)
		attractionStrength = Value
	end
}, "RingAttraction")

RunService.Heartbeat:Connect(function()  
    if not ringPartsEnabled then return end  
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
    if humanoidRootPart then  
        local tornadoCenter = humanoidRootPart.Position  
        for _, part in pairs(parts) do  
            if part.Parent and not part.Anchored then  
                local pos = part.Position  
                local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude  
                local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)  
                local newAngle = angle + math.rad(rotationSpeed)  
                local targetPos = Vector3.new(  
                    tornadoCenter.X + math.cos(newAngle) * math.min(radius, distance),  
                    tornadoCenter.Y + (height * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / height)))),  
                    tornadoCenter.Z + math.sin(newAngle) * math.min(radius, distance)
                )
                local directionToTarget = (targetPos - part.Position).unit  
                part.Velocity = directionToTarget * attractionStrength  
            end  
        end  
    end  
end)

local defaultHitboxSize = 4
local hitboxSize = defaultHitboxSize

local function applyHitbox()
	local player = game.Players.LocalPlayer
	for _, plr in pairs(game.Players:GetPlayers()) do
		if plr.Character and plr ~= player then
			local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				hrp.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
			end
		end
	end
end

Main:CreateSlider({
	Name = "Hitbox Size",
	Range = {1, 20},
	Increment = 0.5,
	CurrentValue = hitboxSize,
	Callback = function(Value)
		hitboxSize = Value
		applyHitbox()
	end
}, "HitboxSize")

local gearAuraRadius = 10

Main:CreateSlider({
	Name = "Kill Aura",
	Range = {5, 50},
	Increment = 1,
	CurrentValue = gearAuraRadius,
	Callback = function(Value)
		gearAuraRadius = Value
	end
}, "GearAuraRadius")

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function gearAuraLoop()
	local char = LocalPlayer.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local targetHRP = plr.Character.HumanoidRootPart
			if (hrp.Position - targetHRP.Position).Magnitude <= gearAuraRadius then
				for _, tool in pairs(char:GetChildren()) do
					if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
						tool.Handle.CFrame = targetHRP.CFrame
						tool:Activate()
					end
				end
			end
		end
	end
end

RunService.Heartbeat:Connect(gearAuraLoop)

LocalPlayer.CharacterAdded:Connect(function()
	task.wait(1)
	applyHitbox()
end)

Main:CreateDivider()

local Scripts = Window:CreateTab({
	Name = "Scripts",
	Icon = "chat",
	ImageSource = "Material",
	ShowTitle = true
})

Scripts:CreateSection("Admin Scripts")

-- QuirkyCMD
Scripts:CreateButton({
	Name = "QuirkyCMD",
	Description = "A serversided admin script which has specific games for it to work",
    Callback = function()
	loadstring(game:HttpGet("https://gist.githubusercontent.com/OfficialCynatica/636bed3e9ba0088733feb986768f8015/raw",true))()
	end
})

-- Nameless Admin
Scripts:CreateButton({
	Name = "Nameless Admin",
	Description = "Best Admin Script + It's reworked to make better",
    Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
	end
})

-- Infinite Yield
Scripts:CreateButton({
	Name = "Infinite Yield",
	Description = "The OG admin script",
    Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end
})

-- AK Admin
Scripts:CreateButton({
	Name = "AK Admin (KeySystem) ",
	Description = "A good admin script and also has game specific commands but it has a KeySystem",
    Callback = function()
	loadstring(game:HttpGet("https://angelical.me/ak.lua"))()
	end
})

Scripts:CreateDivider()

Scripts:CreateSection("Other")

-- Dex Explorer
Scripts:CreateButton({
    Name = "Dex Explorer",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/DEX-Explorer/refs/heads/main/Mobile.lua"))()
    end
})

-- Dex ++
Scripts:CreateButton({
    Name = "Dex ++",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
    end
})

-- RemoteSpy
Scripts:CreateButton({
    Name = "RemoteSpy",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/p0e1/Gg/refs/heads/main/RemoteSpy.lua"))()
    end
})

-- SimpleSpy
Scripts:CreateButton({
    Name = "SimpleSpy",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BOXLEGENDARY/SimpleSpyZxL/refs/heads/main/notify.lua"))()
    end
})

Scripts:CreateDivider()

Scripts:CreateSection("Chat Bypassers")

Scripts:CreateButton({
	Name = "BetterBypasser",
	Description = "Best Chat-Bypasser but have a KeySystem",
    Callback = function()
	loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Synergy-Networks/products/main/BetterBypasser/loader.lua"))()
	end
})

Scripts:CreateButton({
	Name = "Xeon Chat Bypasser",
	Description = "Uses AI to Auto Bypass your chat",
    Callback = function()
	loadstring(game:HttpGet("https://gist.githubusercontent.com/ProphecySkondo/00152838123b42aac0dc879eb9c47042/raw/fde6a9fc2ed94d03c9ff84360b7cd8929f69ddf7/gistfile1.txt"))()
	end
})

Scripts:CreateButton({
	Name = "Cookie Chat Bypasser",
	Description = "A new chat bypasser that is good ",
    Callback = function()
	loadstring(game:HttpGet("https://gist.githubusercontent.com/mert134/358b6c0b43e67f75dd4c8f1fc17af692/raw/d79af94b05269769e44360e4c4bb4dff5cda2a15/gistfile1.txt"))()
	end
})

Scripts:CreateDivider()

Scripts:CreateSection("FE Scripts (NO GUIS)")

Scripts:CreateButton({
	Name = "FE Telekinesis",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Telekinesis-V5-21542"))()
	end
})

Scripts:CreateButton({
	Name = "FE Become HamsterBall",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/KaterHub-Inc/scripts/refs/heads/main/unofficial-Projects/FEHamsterBall.lua"))()
	end
})

Scripts:CreateButton({
	Name = "FE BlackHole",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BringFlingPlayers"))()
	end
})

Scripts:CreateButton({
	Name = "FE ChatSpy",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Dan41/Roblox-Scripts/refs/heads/main/CHAT%20SPY%20-%202025/ChatSpy2025.lua", true))()
	end
})

Scripts:CreateButton({
	Name = "FE Egor",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/RybHqGnp", true))()
	end
})

Scripts:CreateButton({
	Name = "FE Sharingan",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/bidQM5Bz"))()
	end
})

Scripts:CreateButton({
	Name = "FE Players' Inventory Viewer",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/gQNchhrC"))()
	end
})

Scripts:CreateButton({
	Name = "FE Sandevistan",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/idbiRMZG"))()
	end
})

Scripts:CreateButton({
	Name = "FE Superhero Fly",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/XyR6izYv"))()
	end
})

Scripts:CreateButton({
	Name = "FE Sonic",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/chqPBh9F"))()
	end
})

Scripts:CreateButton({
	Name = "FE Ragdoll",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/shakk-code/fe-ragdoll-script/refs/heads/main/script.lua", true))()
	end
})

Scripts:CreateButton({
	Name = "FE Punch NPC",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/wJy7ksD0"))()
	end
})

Scripts:CreateButton({
	Name = "FE Drift Car",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AstraOutlight/my-scripts/refs/heads/main/fe%20car%20v3"))()
	end
})

Scripts:CreateButton({
	Name = "Become Steve and play Minecraft",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Biem6ondo/mc/refs/heads/main/STARTUP"))()
	end
})

Scripts:CreateButton({
	Name = "FE Become Dog",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/WyqDmp0t"))()
	end
})

Scripts:CreateButton({
	Name = "FE Fake IP Logger",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/rpmS1eWX"))()
	end
})

Scripts:CreateButton({
	Name = "FE Invisible VoiceChat Troll",
	Description = nil,
	Callback = function()
		_G.Snail_Config = {
			Speed = 0.4,
			TunnelSpeed = 1,

			--// Offsets
			Offset = CFrame.new(0,3,0),
			TunnelOffset = CFrame.new(0,-6,0), -- This is added to the Offset

			--// Control
			Teleport = Enum.KeyCode.E,
			Tunnel = Enum.KeyCode.Q,
			ResetCamera = Enum.KeyCode.R,

			TunnelIsToggle = true,
			DistanceChangesSpeed = true,
			UseCameraRotaton = false, -- Old movement
			Distance = 5,

			--// Animations
			Enabled = true, -- If disabled, the script will not run after death
			Sounds = true,

			--// Sounds
			Audios = {
				Teleport = {
					SoundId = 507863457
				}
			},

			--// Misc (Advanced)
			Max_Height = 15,
			Root_Height = 4,
		}

		------------------------------

		if _G.Snail_Ran then return end
		loadstring(game:HttpGet("https://raw.githubusercontent.com/MastersMZ-Scripts/Scripts/main/Snail%20Script/Snail%20Limbs%20Version.lua"))()
	end
})

Scripts:CreateButton({
	Name = "FE Float Tools (Press J To Float)",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/DDK5Ek1A"))()
	end
})

Scripts:CreateDivider()

Scripts:CreateSection("FE Scripts (GUIS)")

-- FE Trolling GUI
Scripts:CreateButton({
    Name = "FE Trolling GUI",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
    end
})

-- FE Tool Giver
Scripts:CreateButton({
    Name = "FE Tool Giver",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolgiver.lua"))()
    end
})

-- FE Animations Hub
Scripts:CreateButton({
    Name = "FE Animations Hub (R6 / R15)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Dvrknvss/UniversalFEScriptHub/main/UFE'))()
    end
})

-- FE Animations Player
Scripts:CreateButton({
    Name = "FE Animations Player",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Idk12384/Animation-Player-Script/refs/heads/main/Main%20Code"))()
    end
})

-- FE Super Lag
Scripts:CreateButton({
    Name = "FE Super Lag",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/GBmWn4eZ", true))()
    end
})

-- FE Gun (Needs hats)
Scripts:CreateButton({
    Name = "FE Gun",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/pYMbRb7w"))()
    end
})

-- FE NPC Controller
Scripts:CreateButton({
	Name = "FE Control NPC",
	Description = nil,
	Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/fe-source/refs/heads/main/NPC/source/main.Luau"))()
	end
})

-- FE Jerk Off R6
Scripts:CreateButton({
    Name = "FE Jerk Off R6",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/imalwaysad/universal-gui/refs/heads/main/jerk%20off%20r6"))()
    end
})

-- FE Invisible
Scripts:CreateButton({
    Name = "FE Invisible",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
    end
})

-- FE Equip Multiple Tools
Scripts:CreateButton({
    Name = "FE Equip Multiple Tools",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/MultiToolsV1/main/script"))()
    end
})

-- FE Face Bang R6
Scripts:CreateButton({
    Name = "FE Face Bang R6",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-FACEBANG-28199"))()
    end
})

-- FE Seraphic Blade
Scripts:CreateButton({
    Name = "FE Seraphic Blade",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/59mJGQGe/raw"))()
    end
})

-- FE Ragdoll
Scripts:CreateButton({
    Name = "FE Ragdoll",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrArgy/MrArgyRobloxScripts/refs/heads/main/ragdoll_buttons_secured.txt"))()
    end
})

-- FE Rewind
Scripts:CreateButton({
    Name = "FE Rewind",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/L"))()
    end
})

Scripts:CreateDivider()

local Executors = Window:CreateTab({
	Name = "Executors",
	Icon = "code",
	ImageSource = "Material",
	ShowTitle = true
})

Executors:CreateSection("Executors")

-- Trigon Executor (OLD)
Executors:CreateButton({
    Name = "Trigon Executor (OLD)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SuperHackerYT/Trigon/refs/heads/main/Trigon.txt"))()
    end
})

-- Codex Executor (NEW)
Executors:CreateButton({
    Name = "Codex Executor (NEW)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CodexScripts/CodexUI/refs/heads/main/CodexMain"))()
    end
})

-- Delta Executor (NEW)
Executors:CreateButton({
    Name = "Delta Executor (NEW)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/iXvqMv4G/raw", true))()
    end
})

-- Arceus X (OLD)
Executors:CreateButton({
    Name = "Arceus X (OLD)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Arceus-X-Executor-22878"))()
    end
})

-- KRNL (OLD)
Executors:CreateButton({
    Name = "KRNL (OLD)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wtfplayer/redemption/main/krnlnoui.lua"))()
    end
})

-- Hydrogen (Remake)
Executors:CreateButton({
    Name = "Hydrogen (Remake)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dnezero/hydrogen_remake/refs/heads/main/.lua"))()
    end
})

-- Synapse X (REMAKE)
Executors:CreateButton({
    Name = "Synapse X (REMAKE)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/tB1McyJv/raw"))()
    end
})

local Games = Window:CreateTab({
	Name = "Game Scripts",
	Icon = "view_list",
	ImageSource = "Material",
	ShowTitle = true
})

Games:CreateSection("Hubs for games")

-- 99 Nights In The Forest (Axiora)
Games:CreateButton({
    Name = "99 Nights In The Forest (Axiora)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AXS-Main/AXS-Script/refs/heads/main/AXS-HUB/99/Nights/in/the/Forest/Loader3"))()
    end
})

-- 99 Nights In The Forest (ToastyXD Hub)
Games:CreateButton({
    Name = "99 Nights In The Forest (ToastyXD)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nouralddin-abdullah/99-night/refs/heads/main/main-en.lua"))()
    end
})

-- BlueLock Rivals (Fearise)
Games:CreateButton({
    Name = "Blue Lock Rivals (Fearise)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EnesXVC/Games-Scripts/main/Blue-Lock-Fearise-Hub"))()
    end
})

-- Build A Plane (Axiora)
Games:CreateButton({
    Name = "Build A Plane (Axiora)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AXS-Main/AXS-Script/refs/heads/main/AXS-HUB/99/Nights/in/the/Forest/Loader3"))()
    end
})

-- Doors (Axiora)
Games:CreateButton({
    Name = "Doors (Axiora)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AXS-Main/AXS-Script/refs/heads/main/AXS-HUB/99/Nights/in/the/Forest/Loader3"))()
    end
})

-- Grow A Garden (ThanHub)
Games:CreateButton({
    Name = "Grow A Garden (ThanHub)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
    end
})

-- Grow A Garden Spawner (Mozil)
Games:CreateButton({
    Name = "Grow A Garden Spawner (Mozil)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MoziIOnTop/MoziIHub/refs/heads/main/GrowaGarden"))()
    end
})

-- Hide the body
Games:CreateButton({
    Name = "Hide The Body",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/DVkt43Ch/raw"))()
    end
})

-- Hunty Zombies (Axiora)
Games:CreateButton({
    Name = "Hunty Zombies (Axiora)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AXS-Main/AXS-Script/refs/heads/main/AXS-HUB/99/Nights/in/the/Forest/Loader3"))()
    end
})

-- Ink Game (Ringta)
Games:CreateButton({
    Name = "Ink Game (Ringta)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()
    end
})

-- Rivals (Zeferus)
Games:CreateButton({
    Name = "Rivals (Zeferus)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/necode102/-loader-100/refs/heads/main/loader.lua"))()
    end
})

-- Steal A Brainrot (Ajjan)
Games:CreateButton({
    Name = "Steal A Brainrot (Ajjan)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/onliengamerop/Steal-a-brainrot/refs/heads/main/Protected_3771863424757750.lua.txt"))()
    end
})

-- Steal A Brainrot (Rinns)
Games:CreateButton({
    Name = "Steal A Brainrot (Rinns)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiCen/MainMenu/main/Code"))()
    end
})

-- Something Evil Will Happen (Axiora)
Games:CreateButton({
    Name = "Something Evil Will Happen (Axiora)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AXS-HUB2/AXS-ScriptS/refs/heads/main/AXS-HUB/Main/Loader"))()
    end
})

-- Survive The Killer
Games:CreateButton({
	Name = "Survive The Killer",
	Description = nil,
	Callback = function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Survive-the-Killer!-Pedro-Group-STK-43390"))()
	end
})

Games:CreateDivider()

local Server = Window:CreateTab({
	Name = "Server",
	Icon = "language",
	ImageSource = "Material",
	ShowTitle = true
})

Server:CreateSection("Server Stuff")

-- Rejoin Button
Server:CreateButton({
    Name = "Rejoin Server",
    Description = "Leave and instantly rejoin the current game",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

-- Server Hop Button
Server:CreateButton({
    Name = "Server Hop",
    Description = "Join a random new server",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPService = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"

        local function serverhop()
            local Servers = Http:JSONDecode(game:HttpGet(Api))
            for _,v in pairs(Servers.data) do
                if v.playing < v.maxPlayers then
                    TPService:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                    break
                end
            end
        end
        serverhop()
    end
})

-- Low Ping Server Button
Server:CreateButton({
    Name = "Find Low Ping Server",
    Description = "Searches for servers with lowest latency",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPService = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"

        local bestPing, bestServer = math.huge, nil
        local Servers = Http:JSONDecode(game:HttpGet(Api))
        for _,v in pairs(Servers.data) do
            if v.ping and v.ping < bestPing then
                bestPing = v.ping
                bestServer = v
            end
        end
        if bestServer then
            TPService:TeleportToPlaceInstance(game.PlaceId, bestServer.id, game.Players.LocalPlayer)
        else
            warn("No low ping servers found.")
        end
    end
})

-- Anti AFK Toggle
Server:CreateToggle({
    Name = "Anti AFK",
    Description = "Prevents you from getting kicked for being idle",
    Default = false,
    Callback = function(state)
        if state then
            _G.AntiAFKConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                task.wait(1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        else
            if _G.AntiAFKConnection then
                _G.AntiAFKConnection:Disconnect()
                _G.AntiAFKConnection = nil
            end
        end
    end
})

-- Shutdown Notifier Toggle
Server:CreateToggle({
    Name = "Shutdown Notifier",
    Description = "Alerts you if the server is shutting down",
    Default = false,
    Callback = function(state)
        if state then
            _G.ShutdownNotifier = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(obj)
                if obj.Name == "ErrorPrompt" then
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "⚠️ Server Notice";
                        Text = "The server is shutting down!";
                        Duration = 10;
                    })
                end
            end)
        else
            if _G.ShutdownNotifier then
                _G.ShutdownNotifier:Disconnect()
                _G.ShutdownNotifier = nil
            end
        end
    end
})

-- Ping Check Button
Server:CreateButton({
    Name = "Check Ping",
    Description = "Check your current network ping (ms)",
    Callback = function()
        local stats = game:GetService("Stats")
        local ping = math.round(stats.Network.ServerStatsItem["Data Ping"]:GetValue())

        -- Show a Luna notification
        Luna:Notification({ 
            Title = "📡 Ping Check",
            Icon = "network_check",
            ImageSource = "Material",
            Content = "Your current ping is: "..ping.." ms"
        })
    end
})

-- Join Lowest Player Server
Server:CreateButton({
	Name = "Join Lowest Player Server",
	Callback = function()
		local Http = game:GetService("HttpService")
		local TeleportService = game:GetService("TeleportService")
		local Players = game:GetService("Players")
		local PlaceId = game.PlaceId
		local Cursor = ""
		local Lowest = nil

		local function ListServers(cursor)
			local Raw = game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"..(cursor and "&cursor="..cursor or ""))
			return Http:JSONDecode(Raw)
		end

		repeat
			local Servers = ListServers(Cursor)
			for _,v in pairs(Servers.data) do
				if v.playing < v.maxPlayers and (not Lowest or v.playing < Lowest.playing) then
					Lowest = v
				end
			end
			Cursor = Servers.nextPageCursor
		until not Cursor or Lowest

		if Lowest then
			TeleportService:TeleportToPlaceInstance(PlaceId, Lowest.id, Players.LocalPlayer)
		end
	end
})

-- Join Highest Player Server (Not Full)
Server:CreateButton({
	Name = "Join Most Player Server",
	Callback = function()
		local Http = game:GetService("HttpService")
		local TeleportService = game:GetService("TeleportService")
		local Players = game:GetService("Players")
		local PlaceId = game.PlaceId
		local Cursor = ""
		local Highest = nil

		local function ListServers(cursor)
			local Raw = game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Desc&limit=100"..(cursor and "&cursor="..cursor or ""))
			return Http:JSONDecode(Raw)
		end

		repeat
			local Servers = ListServers(Cursor)
			for _,v in pairs(Servers.data) do
				if v.playing < v.maxPlayers and (not Highest or v.playing > Highest.playing) then
					Highest = v
				end
			end
			Cursor = Servers.nextPageCursor
		until not Cursor or Highest

		if Highest then
			TeleportService:TeleportToPlaceInstance(PlaceId, Highest.id, Players.LocalPlayer)
		end
	end
})

-- Join by JobID Input
local JobInput = Server:CreateInput({
	Name = "Join By JobID",
	PlaceholderText = "Paste JobID here",
	CurrentValue = "",
	Numeric = false,
	Enter = true, -- press enter to confirm
	Callback = function(JobID)
		local TeleportService = game:GetService("TeleportService")
		local Players = game:GetService("Players")

		if JobID ~= "" then
			TeleportService:TeleportToPlaceInstance(game.PlaceId, JobID, Players.LocalPlayer)
		else
			Luna:Notification({
				Title = "Server Join Failed",
				Icon = "error",
				ImageSource = "Material",
				Content = "Invalid JobID, try again."
			})
		end
	end
}, "JobIDInput")

-- Join By Username Input
local UserInput = Server:CreateInput({
	Name = "Join By Username",
	PlaceholderText = "Enter Player Username",
	CurrentValue = "",
	Numeric = false,
	Enter = true, -- press enter to confirm
	Callback = function(User)
		local TeleportService = game:GetService("TeleportService")
		local Players = game:GetService("Players")
		local HttpService = game:GetService("HttpService")

		if User ~= "" then
			-- Try to fetch their userId
			local success, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet("https://users.roblox.com/v1/usernames/users", true, {
					usernames = {User}
				}))
			end)

			if success and result and result.data and result.data[1] then
				local userId = result.data[1].id
				local servers = game:HttpGet("https://games.roblox.com/v1/users/"..userId.."/presence")
				
				if servers then
					local info = HttpService:JSONDecode(servers)
					if info.userPresenceType == 2 and info.placeId == game.PlaceId then
						TeleportService:TeleportToPlaceInstance(info.placeId, info.gameId, Players.LocalPlayer)
					else
						Luna:Notification({
							Title = "Join Failed",
							Icon = "error",
							ImageSource = "Material",
							Content = User.." is not in this game!"
						})
					end
				end
			else
				Luna:Notification({
					Title = "Invalid Username",
					Icon = "error",
					ImageSource = "Material",
					Content = "Couldn't find that Roblox user."
				})
			end
		else
			Luna:Notification({
				Title = "Join Failed",
				Icon = "error",
				ImageSource = "Material",
				Content = "Please enter a username!"
			})
		end
	end
}, "UserJoinInput")

-- Join Friends Dropdown
local TeleportService = game:GetService("TeleportService")

-- Get friend usernames
local success, friends = pcall(function()
	return game:GetService("Players"):GetFriendsAsync(Players.LocalPlayer.UserId)
end)

local friendNames = {}
if success then
	for _, friend in ipairs(friends:GetCurrentPage()) do
		table.insert(friendNames, friend.Username)
	end
else
	friendNames = {"No Friends Found"}
end

local Dropdown = Server:CreateDropdown({
	Name = "Join Friend",
	Description = "Select a friend to join",
	Options = friendNames,
	CurrentOption = {friendNames[1] or ""},
	MultipleOptions = false,
	Callback = function(Option)
		if Option and Option ~= "No Friends Found" then
			-- Get userId
			local userId
			for _, friend in ipairs(friends:GetCurrentPage()) do
				if friend.Username == Option then
					userId = friend.Id
					break
				end
			end

			if userId then
				-- Check presence
				local presence = game:HttpGet("https://presence.roblox.com/v1/presence/users", true)
				local data = game:GetService("HttpService"):JSONDecode(presence)

				-- Teleport if in same game
				for _, info in ipairs(data.userPresences or {}) do
					if info.userId == userId and info.placeId == game.PlaceId then
						TeleportService:TeleportToPlaceInstance(info.placeId, info.gameId, Players.LocalPlayer)
						return
					end
				end

				Luna:Notification({
					Title = "Join Failed",
					Icon = "error",
					ImageSource = "Material",
					Content = Option.." is not in this game."
				})
			end
		end
	end
}, "JoinFriendDropdown")