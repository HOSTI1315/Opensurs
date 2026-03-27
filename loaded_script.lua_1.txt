local StuffsModule = {}

local PingsOrFpsEnabled = false
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local waterPart = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("WaterBase-Plane")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local Lighting = game:GetService("Lighting")
local Terrain = Workspace:FindFirstChildOfClass("Terrain")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")
local ShootGunEvent = Net:WaitForChild("RE/ShootGunEvent")
local GunValidator = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Validator2")

local ScreenGui
local FpsPingLabel
local FpsBoostEnabled = false
local InfiniteEnergy = false
local FastAttackEnabled = false
local WalkWaterEnabled = false
local fog = false
local Lava = false

local fastConn
local energyConnection
local fpsBoostConn

local savedSettings = {}
local connections = {}

local function createGui()
	if ScreenGui then return end 

	ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "FpsPingGui"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

	FpsPingLabel = Instance.new("TextLabel")
	FpsPingLabel.Name = "FpsPingLabel"
	FpsPingLabel.Size = UDim2.new(0, 120, 0, 20)
	FpsPingLabel.Position = UDim2.new(1, -10, 0, 10)
	FpsPingLabel.AnchorPoint = Vector2.new(1, 0) 
	FpsPingLabel.BackgroundTransparency = 1
	FpsPingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	FpsPingLabel.Font = Enum.Font.SourceSansBold
	FpsPingLabel.TextSize = 18
	FpsPingLabel.TextXAlignment = Enum.TextXAlignment.Right
	FpsPingLabel.RichText = true
	FpsPingLabel.Parent = ScreenGui
end

local lastTime = tick()
local frameCount = 0
local fps = 0
local fpsConn

local function startFPSLoop()
    if fpsConn then return end
    
    fpsConn = RunService.RenderStepped:Connect(function(deltaTime)
        if not PingsOrFpsEnabled then
            ScreenGui.Enabled = false
            return
        end
        
        createGui()
        ScreenGui.Enabled = true
        
        frameCount = frameCount + 1
        if tick() - lastTime >= 1 then
            fps = frameCount
            frameCount = 0
            lastTime = tick()
        end

        local ping = math.floor(LocalPlayer:GetNetworkPing() * 2000)

        local fpsColor
        if fps >= 50 then
            fpsColor = "00FF00"
        elseif fps >= 30 then
            fpsColor = "FFA500"
        else
            fpsColor = "FF0000"
        end

        local pingColor
        if ping <= 80 then
            pingColor = "00FF00"
        elseif ping <= 150 then
            pingColor = "FFFF00"
        else
            pingColor = "FF0000"
        end

        FpsPingLabel.Text = string.format(
            '<font color="#%s">FPS: %d</font>  |  <font color="#%s">Ping: %dms</font>',
            fpsColor,
            fps,
            pingColor,
            ping
        )
    end)
end

local function stopFPSLoop()
    if fpsConn then
        fpsConn:Disconnect()
        fpsConn = nil
    end
end

local function FPSBoost()
	Lighting.FogEnd = 1e9
	Lighting.FogStart = 1e9
	Lighting.ClockTime = 12
	Lighting.GlobalShadows = false
	Lighting.Brightness = 2
	Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)

	if Terrain then
	    Terrain.WaterWaveSize = 0
	    Terrain.WaterWaveSpeed = 0
	    Terrain.WaterReflectance = 0
	    Terrain.WaterTransparency = 1
	end
	
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then  
		    v:Destroy()
        elseif v:IsA("ParticleEmitter") then
            v.Lifetime = NumberRange.new(0, 0)
        elseif v:IsA("Trail") then
	        v.Lifetime = 0
        elseif v:IsA("Explosion") then
	        v.BlastPressure = 1
			v.BlastRadius = 1
        elseif v:IsA("BasePart") then
            v.CastShadow = false
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
			v.Enabled = false
        end
    end
    
    if fpsBoostConn then
	    fpsBoostConn:Disconnect()
	    fpsBoostConn = nil
	end
	
	fpsBoostConn = Workspace.DescendantAdded:Connect(function(v)
	    task.wait(0.1)
        if v:IsA("ParticleEmitter") then
            v.Lifetime = NumberRange.new(0, 0)
        elseif v:IsA("Trail") then
	        v.Lifetime = 0
        elseif v:IsA("Explosion") then
	        v.BlastPressure = 1
			v.BlastRadius = 1
	    elseif v:IsA("BasePart") then
	        v.CastShadow = false
		elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
			v.Enabled = false
	    end
	end)
end

do
	if fog then
		local c = game.Lighting
	    c.FogEnd = 100000
	    for r, v in pairs(c:GetDescendants()) do
	        if v:IsA("Atmosphere") then
	            v:Destroy()
	        end
	    end
	end
end

do
	if Lava then
		for i, v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "Lava" then
				v:Destroy();
			end;
		end;
		for i, v in pairs(game.ReplicatedStorage:GetDescendants()) do
			if v.Name == "Lava" then
				v:Destroy();
			end;
		end;
	end
end

local function infinitestam(state)
    InfiniteEnergy = state
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local energy = character:FindFirstChild("Energy")
    if not energy then return end

    if not state then
        if energyConnection then
            energyConnection:Disconnect()
            energyConnection = nil
        end
        return
    end
    
    if not energyConnection then
        energyConnection = energy.Changed:Connect(function()
            if InfiniteEnergy then
                energy.Value = energy.MaxValue
            end
        end)
    end
end

local Config = {
    AttackDistance = 200,
    AttackMobs = true,
    AttackPlayers = true,
    AttackCooldown = 0.001,
    ComboResetTime = 0.001,
    MaxCombo = 2,
    HitboxLimbs = {"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand"},
    AutoClickEnabled = true
}

local FastAttack = {}
FastAttack.__index = FastAttack

function FastAttack.new()
    local self = setmetatable({
        Debounce = 0,
        ComboDebounce = 0,
        ShootDebounce = 0,
        M1Combo = 0,
        EnemyRootPart = nil,
        Connections = {},
        Overheat = {
            Dragonstorm = {
                Cooldown = 0,
                Distance = 350,
            }
        },
    }, FastAttack)
    
    pcall(function()
        self.CombatFlags = require(Modules.Flags).COMBAT_REMOTE_THREAD
        self.ShootFunction = getupvalue(require(ReplicatedStorage.Controllers.CombatController).Attack, 9)
        local LocalScript = LocalPlayer:WaitForChild("PlayerScripts"):FindFirstChildOfClass("LocalScript")
        if LocalScript and getsenv then
            self.HitFunction = getsenv(LocalScript)._G.SendHitsToServer
        end
    end)
    
    return self
end

function FastAttack:IsEntityAlive(entity)
    local humanoid = entity and entity:FindFirstChild("Humanoid")
    return humanoid and humanoid.Health > 0
end

function FastAttack:CheckStun(Character, Humanoid, ToolTip)
    local Stun = Character:FindFirstChild("Stun")
    local Busy = Character:FindFirstChild("Busy")
    if Humanoid.Sit and (ToolTip == "Sword" or ToolTip == "Melee" or ToolTip == "Blox Fruit") then
        return false
    elseif Stun and Stun.Value > 0 or Busy and Busy.Value then
        return false
    end
    return true
end

function FastAttack:GetBladeHits(Character, Distance)
    local Position = Character:GetPivot().Position
    local BladeHits = {}
    Distance = Distance or Config.AttackDistance
    
    local function ProcessTargets(Folder, CanAttack)
        for _, Enemy in ipairs(Folder:GetChildren()) do
            if Enemy ~= Character and self:IsEntityAlive(Enemy) then
                local BasePart = Enemy:FindFirstChild(Config.HitboxLimbs[math.random(#Config.HitboxLimbs)]) or Enemy:FindFirstChild("HumanoidRootPart")
                if BasePart and (Position - BasePart.Position).Magnitude <= Distance then
                    if not self.EnemyRootPart then
                        self.EnemyRootPart = BasePart
                    else
                        table.insert(BladeHits, {Enemy, BasePart})
                    end
                end
            end
        end
    end
    
    if Config.AttackMobs then ProcessTargets(Workspace.Enemies) end
    if Config.AttackPlayers then ProcessTargets(Workspace.Characters, true) end
    
    return BladeHits
end

function FastAttack:GetClosestEnemy(Character, Distance)
    local BladeHits = self:GetBladeHits(Character, Distance)
    local Closest, MinDistance = nil, math.huge
    
    for _, Hit in ipairs(BladeHits) do
        local Magnitude = (Character:GetPivot().Position - Hit[2].Position).Magnitude
        if Magnitude < MinDistance then
            MinDistance = Magnitude
            Closest = Hit[2]
        end
    end
    return Closest
end

function FastAttack:GetCombo()
    local Combo = (tick() - self.ComboDebounce) <= Config.ComboResetTime and self.M1Combo or 0
    Combo = Combo >= Config.MaxCombo and 1 or Combo + 1
    self.ComboDebounce = tick()
    self.M1Combo = Combo
    return Combo
end

function FastAttack:ShootInTarget(TargetPosition)
    local Character = LocalPlayer.Character
    if not self:IsEntityAlive(Character) then return end
    
    local Equipped = Character:FindFirstChildOfClass("Tool")
    if not Equipped or Equipped.ToolTip ~= "Gun" then return end
    
    local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or 0.3
    if (tick() - self.ShootDebounce) < Cooldown then return end
    
    local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
    if ShootType == "Position" or (ShootType == "TAP" and Equipped:FindFirstChild("RemoteEvent")) then
        Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
        GunValidator:FireServer(self:GetValidator2())
        
        if ShootType == "TAP" then
            Equipped.RemoteEvent:FireServer("TAP", TargetPosition)
        else
            ShootGunEvent:FireServer(TargetPosition)
        end
        self.ShootDebounce = tick()
    else
        self.ShootDebounce = tick()
    end
end

function FastAttack:GetValidator2()
    local v1 = getupvalue(self.ShootFunction, 15)
    local v2 = getupvalue(self.ShootFunction, 13)
    local v3 = getupvalue(self.ShootFunction, 16)
    local v4 = getupvalue(self.ShootFunction, 17)
    local v5 = getupvalue(self.ShootFunction, 14)
    local v6 = getupvalue(self.ShootFunction, 12)
    local v7 = getupvalue(self.ShootFunction, 18)
    
    local v8 = v6 * v2
    local v9 = (v5 * v2 + v6 * v1) % v3
    v9 = (v9 * v3 + v8) % v4
    v5 = math.floor(v9 / v3)
    v6 = v9 - v5 * v3
    v7 = v7 + 1
    
    setupvalue(self.ShootFunction, 15, v1)
    setupvalue(self.ShootFunction, 13, v2)
    setupvalue(self.ShootFunction, 16, v3)
    setupvalue(self.ShootFunction, 17, v4)
    setupvalue(self.ShootFunction, 14, v5)
    setupvalue(self.ShootFunction, 12, v6)
    setupvalue(self.ShootFunction, 18, v7)
    
    return math.floor(v9 / v4 * 16777215), v7
end

function FastAttack:UseNormalClick(Character, Humanoid, Cooldown)
    self.EnemyRootPart = nil
    local BladeHits = self:GetBladeHits(Character)
    
    if self.EnemyRootPart then
        RegisterAttack:FireServer(Cooldown)
        if self.CombatFlags and self.HitFunction then
            self.HitFunction(self.EnemyRootPart, BladeHits)
        else
            RegisterHit:FireServer(self.EnemyRootPart, BladeHits)
        end
    end
end

function FastAttack:UseFruitM1(Character, Equipped, Combo)
    local range = Config.AttackDistance
    local Targets = self:GetBladeHits(Character, range)
    if not Targets[1] then return end

    local Direction = (Targets[1][2].Position - Character:GetPivot().Position).Unit
    Equipped.LeftClickRemote:FireServer(Direction, Combo)
end

function FastAttack:Attack()
    if not Config.AutoClickEnabled or (tick() - self.Debounce) < Config.AttackCooldown then return end
    local Character = LocalPlayer.Character
    if not Character or not self:IsEntityAlive(Character) then return end
    
    local Humanoid = Character.Humanoid
    local Equipped = Character:FindFirstChildOfClass("Tool")
    if not Equipped then return end
    
    local ToolTip = Equipped.ToolTip
    if not table.find({"Melee", "Blox Fruit", "Sword", "Gun"}, ToolTip) then return end
    
    local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or Config.AttackCooldown
    if not self:CheckStun(Character, Humanoid, ToolTip) then return end
    
    local Combo = self:GetCombo()
    Cooldown = Cooldown + (Combo >= Config.MaxCombo and 0.05 or 0)
    self.Debounce = Combo >= Config.MaxCombo and ToolTip ~= "Gun" and (tick() + 0.05) or tick()
    
    if ToolTip == "Blox Fruit" and Equipped:FindFirstChild("LeftClickRemote") then
        self:UseFruitM1(Character, Equipped, Combo)
    elseif ToolTip == "Gun" then
        local Target = self:GetClosestEnemy(Character, 120)
        if Target then
            self:ShootInTarget(Target.Position)
        end
    else
        self:UseNormalClick(Character, Humanoid, Cooldown)
    end
end

local AttackInstance = FastAttack.new()
local function startFastAttack()
    if fastConn then return end
    fastConn = RunService.Stepped:Connect(function()
        if FastAttackEnabled then
            AttackInstance:Attack()
        end
    end)
end

local function stopFastAttack()
    if fastConn then
        fastConn:Disconnect()
        fastConn = nil
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    infinitestam()
end)

if LocalPlayer.Character then
    infinitestam()
end

function StuffsModule:SetFpsBoost(state)
    FpsBoostEnabled = state
    if state then
        FPSBoost()
    else
        if fpsBoostConn then
            fpsBoostConn:Disconnect()
            fpsBoostConn = nil
        end
    end
end

function StuffsModule:SetINFEnergy(state)
    infinitestam(state)
end

function StuffsModule:SetFog(state)
    fog = state
end

function StuffsModule:SetLava(state)
    Lava = state
end

function StuffsModule:SetRejoinServer(state)
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end

function StuffsModule:SetFastAttack(state)
    FastAttackEnabled = state
    if state then
        startFastAttack()
    else
        stopFastAttack()
    end
end

function StuffsModule:SetWalkWater(state)
    WalkWaterEnabled = state
    if WalkWaterEnabled then
        waterPart.Size = Vector3.new(1000,110,1000)
    else
        waterPart.Size = Vector3.new(1000,80,1000)
    end
end

function StuffsModule:SetPingsOrFps(state)
    PingsOrFpsEnabled = state
    if state then
        startFPSLoop()
    else
        stopFPSLoop()
    end
end

return StuffsModule
