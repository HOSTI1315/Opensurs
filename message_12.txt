local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local ballServiceRemote = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BallService"):WaitForChild("RE"):WaitForChild("Shoot")
local slideRemote = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BallService"):WaitForChild("RE"):WaitForChild("Slide")
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local FootballESPEnabled = false
local Lines = {}
local Quads = {}
local homeGoalPosition = Vector3.new(325, 20, -49)
local awayGoalPosition = Vector3.new(-247, 18, -50)
local autofarmEnabled = false
local autoGoalEnabled = false
local autoStealEnabled = false
local autoTPBallEnabled = false
local autoJoinRandomTeamEnabled = false
local autoJoinHomeEnabled = false
local autoJoinAwayEnabled = false
local roles = {"CF", "GK", "LW", "RW", "CM"}
local nonGKRoles = {"CF", "LW", "RW", "CM"}
local teams = {"Home", "Away"}
local selectedTeam = "Home"
local selectedRole = "CF"

local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
local ball = game.Workspace:FindFirstChild("Football")


local flying = false
local flySpeed = 100
local maxFlySpeed = 1000
local speedIncrement = 0.4
local originalGravity = workspace.Gravity

local VirtualUser = game:GetService("VirtualUser")
local antiAFKEnabled = false

local function ClearESP()
    for _, line in pairs(Lines) do
        if line then line:Remove() end
    end
    Lines = {}

    for _, quad in pairs(Quads) do
        if quad then quad:Remove() end
    end
    Quads = {}
end

local function DrawLine(From, To)
    local FromScreen, FromVisible = Camera:WorldToViewportPoint(From)
    local ToScreen, ToVisible = Camera:WorldToViewportPoint(To)

    if not (FromVisible or ToVisible) then return end

    local FromPos = Vector2.new(FromScreen.X, FromScreen.Y)
    local ToPos = Vector2.new(ToScreen.X, ToScreen.Y)

    local Line = Drawing.new("Line")
    Line.Thickness = 1
    Line.From = FromPos
    Line.To = ToPos
    Line.Color = Color3.fromRGB(255, 255, 255)
    Line.Transparency = 1
    Line.Visible = true

    table.insert(Lines, Line)
end

local function DrawQuad(PosA, PosB, PosC, PosD)
    local PosAScreen, PosAVisible = Camera:WorldToViewportPoint(PosA)
    local PosBScreen, PosBVisible = Camera:WorldToViewportPoint(PosB)
    local PosCScreen, PosCVisible = Camera:WorldToViewportPoint(PosC)
    local PosDScreen, PosDVisible = Camera:WorldToViewportPoint(PosD)

    if not (PosAVisible or PosBVisible or PosCVisible or PosDVisible) then return end

    local Quad = Drawing.new("Quad")
    Quad.PointA = Vector2.new(PosAScreen.X, PosAScreen.Y)
    Quad.PointB = Vector2.new(PosBScreen.X, PosBScreen.Y)
    Quad.PointC = Vector2.new(PosCScreen.X, PosCScreen.Y)
    Quad.PointD = Vector2.new(PosDScreen.X, PosDScreen.Y)
    Quad.Color = Color3.fromRGB(255, 255, 255)
    Quad.Thickness = 0.5
    Quad.Filled = true
    Quad.Transparency = 0.25
    Quad.Visible = true

    table.insert(Quads, Quad)
end

local function GetCorners(Part)
    local CF, Size = Part.CFrame, Part.Size / 2
    local Corners = {}

    for X = -1, 1, 2 do
        for Y = -1, 1, 2 do
            for Z = -1, 1, 2 do
                table.insert(Corners, (CF * CFrame.new(Size * Vector3.new(X, Y, Z))).Position)
            end
        end
    end

    return Corners
end

local function DrawFootballESP(Football)
    local Corners = GetCorners(Football)

    DrawLine(Corners[1], Corners[2])
    DrawLine(Corners[2], Corners[4])
    DrawLine(Corners[4], Corners[3])
    DrawLine(Corners[3], Corners[1])

    DrawLine(Corners[5], Corners[6])
    DrawLine(Corners[6], Corners[8])
    DrawLine(Corners[8], Corners[7])
    DrawLine(Corners[7], Corners[5])

    DrawLine(Corners[1], Corners[5])
    DrawLine(Corners[2], Corners[6])
    DrawLine(Corners[3], Corners[7])
    DrawLine(Corners[4], Corners[8])

    DrawQuad(Corners[1], Corners[2], Corners[6], Corners[5])
    DrawQuad(Corners[3], Corners[4], Corners[8], Corners[7])
    DrawQuad(Corners[1], Corners[3], Corners[7], Corners[5])
    DrawQuad(Corners[2], Corners[4], Corners[8], Corners[6])
end

local function FootballESP()
    ClearESP()

    local Football = Workspace:FindFirstChild("Football")
    if Football and Football:IsA("BasePart") and FootballESPEnabled then
        DrawFootballESP(Football)
    end
end

local function hasBall()
    return character:FindFirstChild("Football") ~= nil
end

local function checkTeam()
    local team = player.Team
    return team and team.Name ~= "Visitor"
end

local function waitForCharacter()
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        player.CharacterAdded:Wait()
        task.wait(1) -- Wait for character to fully load
    end
    return player.Character, player.Character:WaitForChild("HumanoidRootPart")
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local GameValues = ReplicatedStorage.GameValues
local SlideRemote = ReplicatedStorage.Packages.Knit.Services.BallService.RE.Slide
local ShootRemote = ReplicatedStorage.Packages.Knit.Services.BallService.RE.Shoot
local GoalsFolder = workspace.Goals
local AwayGoal, HomeGoal = GoalsFolder.Away, GoalsFolder.Home

local autoGoalEnabled = false

local function IsInGame()
    return GameValues.State.Value == "Playing"
end

local function IsScored()
    return GameValues.Scored.Value
end

local function IsVisitor()
    return LocalPlayer.Team.Name == "Visitor"
end

local function hasBall()
    local character = LocalPlayer.Character
    return character and character:FindFirstChild("Football")
end

local function checkTeam()
    return LocalPlayer.Team and (LocalPlayer.Team.Name == "Away" or LocalPlayer.Team.Name == "Home")
end

local function waitForCharacter()
    repeat task.wait() until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    return LocalPlayer.Character, LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end

local function autoGoal()
    while autoGoalEnabled do
        local character, root = waitForCharacter()
        if not character or not root then continue end

        local team = LocalPlayer.Team
        local goal = team.Name == "Away" and awayGoalPosition or homeGoalPosition
        local football = workspace:FindFirstChild("Football")

        if football and football.Char.Value == character then
            local BV = Instance.new("BodyVelocity")
            BV.Velocity = (goal.Position - football.Position).Unit * 500
            BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            BV.Parent = football

            football.CFrame = goal.CFrame

            task.delay(0.1, function()
                BV:Destroy()
            end)

            task.wait(0.2)
            ballServiceRemote:FireServer(60, nil, nil, Vector3.new(-0.6976, -0.3905, -0.6007))
            task.wait(0.5)
        end
    end
end


local function autoSteal()
    while autoStealEnabled do
        local character, root = waitForCharacter()
        if not character or not root then continue end

        local targetPlayer, closestDistance = nil, math.huge
        
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer == player then continue end
            
            local otherCharacter = otherPlayer.Character
            if not otherCharacter or not otherCharacter:FindFirstChild("Football") or not otherCharacter:FindFirstChild("HumanoidRootPart") then 
                continue 
            end
            
            local distance = (root.Position - otherCharacter.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                targetPlayer = otherPlayer
            end
        end
        
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            root.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            slideRemote:FireServer(targetPlayer)
            task.wait(0)
        else
            task.wait(0.1)
        end
    end
end

local function autoTPBall()
    while autoTPBallEnabled do
        local character, root = waitForCharacter()
        if not character or not root then continue end

        local ball = Workspace:FindFirstChild("Football")
        if ball then
            root.CFrame = ball:GetPivot()
            task.wait(0)
        else
            task.wait(0.1)
        end
    end
end
local function autoFarm()
    if not autoFarmEnabled then return end

    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")

    local LocalPlayer = Players.LocalPlayer

    local GameValues = ReplicatedStorage.GameValues
    local SlideRemote = ReplicatedStorage.Packages.Knit.Services.BallService.RE.Slide
    local ShootRemote = ReplicatedStorage.Packages.Knit.Services.BallService.RE.Shoot
    local GoalsFolder = workspace.Goals
    local AwayGoal, HomeGoal = GoalsFolder.Away, GoalsFolder.Home

    local function IsInGame()
        return GameValues.State.Value == "Playing"
    end

    local function IsScored()
        return GameValues.Scored.Value
    end

    local function IsVisitor()
        return LocalPlayer.Team.Name == "Visitor"
    end

    local function JoinGame()
        if not IsVisitor() then return end
        for _, v in ipairs(ReplicatedStorage.Teams:GetDescendants()) do
            if v:IsA("ObjectValue") and v.Value == nil then
                local args = {string.sub(v.Parent.Name, 1, #v.Parent.Name - 4), v.Name}
                ReplicatedStorage.Packages.Knit.Services.TeamService.RE.Select:FireServer(unpack(args))
            end
        end
    end

    local function StealBall()
        if not IsInGame() or IsScored() then return end
        local LocalCharacter = LocalPlayer.Character
        local LocalHumanoidRootPart = LocalCharacter and LocalCharacter:FindFirstChild("HumanoidRootPart")
        local Football = workspace:FindFirstChild("Football")

        if LocalHumanoidRootPart and Football and not Football.Anchored and Football.Char.Value ~= LocalPlayer.Character then
            LocalHumanoidRootPart.CFrame = CFrame.new(Football.Position.X, 9, Football.Position.Z)
        end

        for _, OtherPlayer in ipairs(Players:GetPlayers()) do
            if OtherPlayer ~= LocalPlayer and OtherPlayer.Team ~= LocalPlayer.Team then
                local OtherCharacter = OtherPlayer.Character
                local OtherFootball = OtherCharacter and OtherCharacter:FindFirstChild("Football")
                local OtherHRP = OtherCharacter and OtherCharacter:FindFirstChild("HumanoidRootPart")
                
                if OtherFootball and OtherHRP and LocalHumanoidRootPart then
                    LocalHumanoidRootPart.CFrame = OtherFootball.CFrame * CFrame.new(0, 3, 0)
                    SlideRemote:FireServer()
                    break
                end
            end
        end
    end

    JoinGame()
    if IsVisitor() and not IsInGame() then return end
    StealBall()
    
    local LocalCharacter = LocalPlayer.Character
    local PlayerFootball = LocalCharacter and LocalCharacter:FindFirstChild("Football")

    if PlayerFootball then
        ShootRemote:FireServer(60, nil, nil, Vector3.new(-0.6976264715194702, -0.3905344605445862, -0.6006664633750916))
    end

    local Football = workspace:FindFirstChild("Football")
    if Football and Football.Char.Value ~= LocalPlayer.Character then return end

    if Football:FindFirstChild("BodyVelocity") then
        Football.BodyVelocity:Destroy()
    end

    local Goal = LocalPlayer.Team.Name == "Away" and AwayGoal or HomeGoal
    local BV = Instance.new("BodyVelocity")
    BV.Velocity = Vector3.new(0, 0, 0)
    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BV.Parent = Football

    Football.CFrame = Goal.CFrame

    task.delay(0.1, function()
        BV:Destroy()
    end)
end

local autoTPEnabled, autoTPHomeEnabled, autoTPAwayEnabled, tpBallToYouEnabled = false, false, false, false
local homeGoalCFrame = CFrame.new(-242.376602, 10.8505239, -49.222084)
local awayGoalCFrame = CFrame.new(319.823425, 10.8505239, -49.222084)




local function autoGoalKeeper()
    local ball
    while autoGoalKeeperEnabled do
        ball = workspace:FindFirstChild("Football")
        if ball and ball.AssemblyLinearVelocity.Magnitude > 5 then
            rootPart.CFrame = CFrame.new(
                ball.Position + (ball.AssemblyLinearVelocity * 0.1)
            )
        end
        task.wait()
    end
end
local function autoBring()
    while autoBringEnabled do
        local ball = workspace:FindFirstChild("Football")
        local character = player.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")

        if ball and root then
            -- Instantly move the ball to the player's position
            local BV = Instance.new("BodyVelocity")
            BV.Velocity = (root.Position - ball.Position).Unit * 500
            BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            BV.Parent = ball

            task.delay(0.1, function()
                BV:Destroy()
            end)
        end
        task.wait(0.1)
    end
end


local function teleportToGoal()
    if not hrp then return end
    if autoTPHomeEnabled then
        hrp.CFrame = homeGoalCFrame
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    elseif autoTPAwayEnabled then
        hrp.CFrame = awayGoalCFrame
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end

local function tpBallToYou()
    if not tpBallToYouEnabled or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local B = workspace:FindFirstChild("Football")
    if B and B.AssemblyLinearVelocity.Magnitude < 35 then
        B:ApplyImpulse((player.Character.HumanoidRootPart.Position + Vector3.new(0, -2.5, 0) - B.Position).Unit * 18)
    end
end

local function autoDribble()
    if not autoDribbleEnabled or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local B = game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Dribble
    local A = require(game:GetService("ReplicatedStorage").Assets.Animations)
    local M = player.Character:FindFirstChild("Humanoid")
    local function G(s)
        if not A.Dribbles[s] then return nil end
        local I = Instance.new("Animation")
        I.AnimationId = A.Dribbles[s]
        return M and M:LoadAnimation(I)
    end
    local function T(p)
        if p == player then return false end
        local c = p.Character
        if not c then return false end
        local V = c.Values and c.Values.Sliding
        if V and V.Value == true then return true end
        local h = c:FindFirstChildOfClass("Humanoid")
        if h and h.MoveDirection.Magnitude > 0 and h.WalkSpeed == 0 then return true end
        return false
    end
    local function O(p)
        if not player.Team or not p.Team then return false end
        return player.Team ~= p.Team
    end
    local function D(d)
        if not autoDribbleEnabled or not player.Character.Values.HasBall.Value then return end
        B:FireServer()
        local s = player.PlayerStats.Style.Value
        local t = G(s)
        if t then
            t:Play()
            t:AdjustSpeed(math.clamp(1 + (10 - d) / 10, 1, 2))
        end
        local F = workspace:FindFirstChild("Football")
        if F then
            F.AssemblyLinearVelocity = Vector3.new()
            F.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2.5, 0)
        end
    end
    for _, p in pairs(game:GetService("Players"):GetPlayers()) do
        if O(p) and T(p) then
            local r = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
            if r then
                local d = (r.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if d < 22 then
                    D(d)
                    break
                end
            end
        end
    end
end
local function randomizeValue(value, range)
    return value + (value * (math.random(-range, range) / 100))
end

local function flyFunction()
    while flying do
        local MoveDirection = Vector3.new()
        local cameraCFrame = workspace.CurrentCamera.CFrame

        MoveDirection = MoveDirection + (UserInputService:IsKeyDown(Enum.KeyCode.W) and cameraCFrame.LookVector or Vector3.new())
        MoveDirection = MoveDirection - (UserInputService:IsKeyDown(Enum.KeyCode.S) and cameraCFrame.LookVector or Vector3.new())
        MoveDirection = MoveDirection - (UserInputService:IsKeyDown(Enum.KeyCode.A) and cameraCFrame.RightVector or Vector3.new())
        MoveDirection = MoveDirection + (UserInputService:IsKeyDown(Enum.KeyCode.D) and cameraCFrame.RightVector or Vector3.new())
        MoveDirection = MoveDirection + (UserInputService:IsKeyDown(Enum.KeyCode.Space) and Vector3.new(0, 1, 0) or Vector3.new())
        MoveDirection = MoveDirection - (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and Vector3.new(0, 1, 0) or Vector3.new())

        if MoveDirection.Magnitude > 0 then
            flySpeed = math.min(flySpeed + speedIncrement, maxFlySpeed)
            MoveDirection = MoveDirection.Unit * math.min(randomizeValue(flySpeed, 10), maxFlySpeed)
            rootPart.Velocity = MoveDirection * 0.5
        else
            rootPart.Velocity = Vector3.new(0, 0, 0)
        end

        RunService.RenderStepped:Wait()
        if not flying then break end
    end
end

local function aimlock()
    while aimlockEnabled do
        local ball = workspace:FindFirstChild("Football")
        if ball then
            local camera = workspace.CurrentCamera
            if player.Character then
                camera.CFrame = CFrame.new(camera.CFrame.Position, ball.Position)
            end
        end
        task.wait()
    end
end

local function autoJoinRandomTeam()
    while autoJoinRandomTeamEnabled do
        if not player.Team or player.Team.Name == "Visitor" then
            -- Select random team and role
            local randomTeam = teams[math.random(1, #teams)]
            local randomRole = roles[math.random(1, #roles)]
            
            -- Fire team selection remote
            local args = {randomTeam, randomRole}
            game:GetService("ReplicatedStorage").Packages.Knit.Services.TeamService.RE.Select:FireServer(unpack(args))
            
            -- Wait to check if team join was successful
            local startTime = tick()
            repeat
                task.wait(0.1)
            until (player.Team and player.Team.Name ~= "Visitor") or (tick() - startTime > 3)
        end
        task.wait(1)
    end
end

local function antiAFK()
    while antiAFKEnabled do
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        task.wait(300) -- Wait 5 minutes between each anti-AFK action
    end
end

player.Idled:Connect(function()
    if antiAFKEnabled then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

-- Add team change detection
player:GetPropertyChangedSignal("Team"):Connect(function()
    if player.Team then
        local teamName = player.Team.Name
        -- Update UI based on current team
        if teamName ~= "Visitor" then
            autoJoinHomeEnabled = false
            autoJoinAwayEnabled = false
            autoJoinRandomTeamEnabled = false
        end
    end
end)

RunService.RenderStepped:Connect(FootballESP)

local playerEspObjects = {}
local teamEspObjects = {}
local enemyEspObjects = {}
local tracer = nil
local distanceText = nil
local highlight = nil

local Luna = loadstring(game:HttpGet("https://paste.ee/r/WSCKThwW", true))()

local getgenv = getgenv
getgenv().Multiplier = 0.5
local CFrameEnabled = false
local connection = n

local function startCFrameSpeed()
    if connection then connection:Disconnect() end
    
    connection = RunService.Heartbeat:Connect(function()
        if CFrameEnabled and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            
            if humanoid and humanoid.MoveDirection.Magnitude > 0 then
                humanoidRootPart.CFrame = humanoidRootPart.CFrame + (humanoid.MoveDirection * getgenv().Multiplier)
            end
        end
    end)
end

local Window = Luna:CreateWindow({
    Name = "The BillDev Hub (Blue Lock Rivals)",
    Subtitle = "by Galaxy/Jah/Whohurtyoudear",
    LogoID = "75237883871377",
    LoadingEnabled = true,
    LoadingTitle = "TheBillDevHub (Blue Lock Rivals)",
    LoadingSubtitle = "by Galaxy/Jah/Whohurtyoudear",
    ConfigSettings = {
        RootFolder = "BillDevHub", 
        ConfigFolder = "Configs", 
        AutoLoadConfig = true 
    },
})

Window:CreateHomeTab({
    SupportedExecutors = {"Delta", "Fluxus", "Codex", "Cryptic", "Vegax", "Trigon", "Synapse X", "Script-Ware", "KRNL", "Seliware", "Solara", "Xeno", "ZORARA", "Luna", "Nihon", "JJsploit", "AWP", "Wave", "Ronix"},
    DiscordInvite = "https://discord.gg/D3T4ArjBqk",
    Icon = 75237883871377,
})
local MainTab = Window:CreateTab({
    Name = "Main",
    Icon = "home_filled",
    ImageSource = "Material",
    ShowTitle = true
})

local CharacterTab = Window:CreateTab({
    Name = "Local Player",
    Icon = "account_circle",
    ImageSource = "Material",
    ShowTitle = true
})

local ESPTab = Window:CreateTab({
    Name = "ESP",
    Icon = "visibility",
    ImageSource = "Material",
    ShowTitle = true
})

local TeamTab = Window:CreateTab({
    Name = "Team",
    Icon = "group_work",
    ImageSource = "Material",
    ShowTitle = true
})

local StyleTab = Window:CreateTab({
    Name = "Styles",
    Icon = "brush",
    ImageSource = "Material",
    ShowTitle = true
})

local FlowTab = Window:CreateTab({
    Name = "Flow",
    Icon = "waves",
    ImageSource = "Material",
    ShowTitle = true
})

local CosmeticTab = Window:CreateTab({
    Name = "Cosmetics",
    Icon = "stars",
    ImageSource = "Material",
    ShowTitle = true
})

local UITab = Window:CreateTab({
    Name = "UI Settings",
    Icon = "settings_applications",
    ImageSource = "Material",
    ShowTitle = true
})

MainTab:CreateSection("Autofarm Features")

MainTab:CreateToggle({
    Name = "Auto Farm (OP)",
    Description = " Enables Overpowered Auto Farm 100% Accuracy Winning When Enabled!",
    CurrentValue = false,
    Callback = function(Value)
        autoFarmEnabled = Value
        if Value then
            task.spawn(autoFarm)
        end
    end

})

MainTab:CreateToggle({
    Name = "Auto Steal",
    Description = "Enable auto steal",
    CurrentValue = false,
    Callback = function(Value)
        autoStealEnabled = Value
        if Value then
            task.spawn(autoSteal)
        else
            task.cancel(autoSteal)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Goal",
    Description = "Automatically score goals when you have the ball",
    CurrentValue = false,
    Callback = function(Value)
        autoGoalEnabled = Value
        if Value then
            task.spawn(autoGoal)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto TP Ball",
    Description = "Automatically teleport to the ball",
    CurrentValue = false,
    Callback = function(Value)
        autoTPBallEnabled = Value
        if Value then
            task.spawn(autoTPBall)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Goal Keeper",
    Description = "Automatically move to block incoming balls",
    CurrentValue = false,
    Callback = function(Value)
        autoGoalKeeperEnabled = Value
        if Value then
            task.spawn(autoGoalKeeper)
        end
    end
})

MainTab:CreateSlider({
    Name = "Goal Keeper Prediction Distance",
    Description = "Adjust the goal keeper prediction distance",
    Range = {0, 100},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 50,
    Callback = function(Value)
        predictionDistance = Value
    end,
})

MainTab:CreateSection("TP?")

MainTab:CreateToggle({
    Name = "Auto Teleport Ball",
    Description = nil,
    CurrentValue = false,
    Callback = function(Value)
        autoTPEnabled = Value
    end
})
MainTab:CreateToggle({
	Name = "Auto TP to Home Goal",
	Description = nil,
	CurrentValue = false,
	Callback = function(Value)
		autoTPHomeEnabled = Value
	end
})

MainTab:CreateToggle({
	Name = "Auto TP to Away Goal",
	Description = nil,
	CurrentValue = false,
	Callback = function(Value)
		autoTPAwayEnabled = Value
	end
})

MainTab:CreateToggle({
	Name = "TP Ball to You",
	Description = nil,
	CurrentValue = false,
	Callback = function(Value)
		tpBallToYouEnabled = Value
	end
})


MainTab:CreateSection("Special Abilities")




local noCDEnabled, autoDribbleEnabled = false, false

MainTab:CreateToggle({
	Name = "No CD",
	Description = nil,
	CurrentValue = false,
	Callback = function(Value)
		noCDEnabled = Value
		if Value then
			local C = require(game:GetService("ReplicatedStorage").Controllers.AbilityController)
			local o = C.AbilityCooldown
			C.AbilityCooldown = function(s, n, ...)
				return o(s, n, 0, ...)
			end
		else
			warn("No CD disabled. Restart the script to revert cooldowns.")
		end
	end
})

MainTab:CreateToggle({
	Name = "Auto Dribble",
	Description = nil,
	CurrentValue = false,
	Callback = function(Value)
		autoDribbleEnabled = Value
	end
})



MainTab:CreateSection("Anti-AFK")

MainTab:CreateToggle({
    Name = "Anti-AFK",
    Description = "Prevent being kicked for inactivity",
    CurrentValue = false,
    Callback = function(Value)
        antiAFKEnabled = Value
        if Value then
            task.spawn(antiAFK)
            Luna:Notification({
                Title = "Anti-AFK Enabled",
                Content = "You will not be kicked for inactivity",
                Icon = "check_circle",
                ImageSource = "Material"
            })
        end
    end
})

ESPTab:CreateSection("ESP Options")

ESPTab:CreateToggle({
    Name = "Football ESP",
    Description = "Show football ESP overlay",
    CurrentValue = false,
    Callback = function(Value)
        FootballESPEnabled = Value
        if not Value then
            ClearESP()
        end
    end
})

ESPTab:CreateToggle({
    Name = "Player ESP",
    Description = "Show player ESP overlay",
    CurrentValue = false,
    Callback = function(Value)
        PlayerESPEnabled = Value
        if not Value then
            ClearPlayerESP()
        end
    end
})

ESPTab:CreateToggle({
    Name = "Team ESP",
    Description = "Show team ESP overlay",
    CurrentValue = false,
    Callback = function(Value)
        TeamESPEnabled = Value
        if not Value then
            ClearTeamESP()
        end
    end
})

TeamTab:CreateSection("Team Selection")

TeamTab:CreateDropdown({
    Name = "Select Team",
    Description = "Choose your team",
    Options = {"Home", "Away"},
    CurrentOption = {"Home"},
    MultipleOptions = false,
    Callback = function(Option)
        selectedTeam = Option
    end
})

TeamTab:CreateDropdown({
    Name = "Select Role",
    Description = "Choose your role",
    Options = {"CF", "GK", "LW", "RW", "CM"},
    CurrentOption = {"CF"},
    MultipleOptions = false,
    Callback = function(Option)
        selectedRole = Option
    end
})

TeamTab:CreateToggle({
    Name = "Auto Join Home",
    Description = "Automatically join home team when visitor",
    CurrentValue = false,
    Callback = function(Value)
        autoJoinHomeEnabled = Value
        if Value then
            task.spawn(function()
                while autoJoinHomeEnabled do
                    if player.Team and player.Team.Name == "Visitor" then
                        local args = {"Home", selectedRole or "CF"}
                        game:GetService("ReplicatedStorage").Packages.Knit.Services.TeamService.RE.Select:FireServer(unpack(args))
                        task.wait(1) -- Short wait after attempting to join
                    end
                    task.wait(5) -- Check every 5 seconds if we're back in Visitor team
                end
            end)
        end
    end
})

TeamTab:CreateToggle({
    Name = "Auto Join Away",
    Description = "Automatically join away team when visitor",
    CurrentValue = false,
    Callback = function(Value)
        autoJoinAwayEnabled = Value
        if Value then
            task.spawn(function()
                while autoJoinAwayEnabled do
                    if player.Team and player.Team.Name == "Visitor" then
                        local args = {"Away", selectedRole or "CF"}
                        game:GetService("ReplicatedStorage").Packages.Knit.Services.TeamService.RE.Select:FireServer(unpack(args))
                        task.wait(1) -- Short wait after attempting to join
                    end
                    task.wait(5) -- Check every 5 seconds if we're back in Visitor team
                end
            end)
        end
    end
})

TeamTab:CreateToggle({
    Name = "Auto Join Random Team",
    Description = "Automatically join a random team when visitor",
    CurrentValue = false,
    Callback = function(Value)
        autoJoinRandomTeamEnabled = Value
        if Value then
            task.spawn(autoJoinRandomTeam)
        end
    end
})

CharacterTab:CreateSection("Character Modifications")

CharacterTab:CreateToggle({
    Name = "Infinite Stamina",
    Description = "Never run out of stamina",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            player.PlayerStats.Stamina.Value = math.huge
        else
            player.PlayerStats.Stamina.Value = 100
        end
    end
})

CharacterTab:CreateToggle({
    Name = "Noclip",
    Description = "Walk through walls",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().noclip = Value
    end
})

CharacterTab:CreateToggle({
    Name = "Fly",
    Description = "Toggle flying ability (Use WASD, Space, and Shift to move)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            fly()
        else
            workspace.Gravity = 196.2
        end
    end
})

CharacterTab:CreateButton({
    Name = "Reset Character",
    Description = "Reset your character",
    Callback = function()
        if player.Character then
            player.Character:BreakJoints()
        end
    end
})

CharacterTab:CreateToggle({
    Name = "Anti Ragdoll",
    Description = "Prevent ragdolling",
    CurrentValue = false,
    Callback = function(Value)
        antiRagdoll = Value
        if Value then
            task.spawn(function()
                while antiRagdoll do
                    if player.Character and player.Character:FindFirstChild("Ragdolled") then
                        player.Character.Ragdolled:Destroy()
                    end
                    task.wait()
                end
            end)
        end
    end
})

CharacterTab:CreateSlider({
    Name = "CFrame Speed",
    Description = "Adjust CFrame movement speed",
    Range = {0, 5},
    Increment = 0.1,
    CurrentValue = 0.5,
    Callback = function(Value)
        getgenv().Multiplier = Value
    end
})

CharacterTab:CreateToggle({
    Name = "Toggle CFrame Speed",
    CurrentValue = false,
    Callback = function(Value)
        CFrameEnabled = Value
        if Value then
            startCFrameSpeed()
        elseif connection then
            connection:Disconnect()
            connection = nil
        end
    end
})

-- Clean up connection when the script is destroyed
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if connection then
        connection:Disconnect()
        connection = nil
        if CFrameEnabled then
            startCFrameSpeed()
        end
    end
end)

StyleTab:CreateSection("Style Selection")

StyleTab:CreateDropdown({
    Name = "Select Style",
    Description = "Choose your player style",
    Options = {"Don Lorenzo", "Kunigami", "Aiku", "Karasu", "Otoya", "Bachira", "Chigiri", "Isagi", 
              "Gagamaru", "King", "Nagi", "Rin", "Sae", "Shidou", "Reo", "Yukimiya", "Hiori"},
    CurrentOption = {"Don Lorenzo"},
    MultipleOptions = false,
    Callback = function(Option)
        player.PlayerStats.Style.Value = Option
    end
})

FlowTab:CreateSection("Flow Selection")

FlowTab:CreateDropdown({
    Name = "Select Flow",
    Description = "Choose your flow ability",
    Options = {
        "Dribbler", "Prodigy", "Awakened Genius",
        "Snake", "Wildcard", "Demon Wings",
        "Trap", "Genius", "Chameleon",
        "King's Instinct", "Gale Burst",
        "Monster", "Puzzle", "Lightning"
    },
    CurrentOption = {"Dribbler"},
    MultipleOptions = false,
    Callback = function(Option)
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = Option
        end
    end
})

CosmeticTab:CreateSection("Cosmetic Selection")

CosmeticTab:CreateLabel({
    Name = "Cosmetics Soon Next Update"
})

UITab:CreateButton({
    Name = "Destroy GUI",
    Description = "Close the GUI",
    Callback = function()
        for _, connection in pairs(getconnections(game:GetService("CoreGui").ChildAdded)) do
            connection:Disable()
        end
        game:GetService("CoreGui").Luna:Destroy()
    end
})

UITab:CreateButton({
    Name = "Rejoin Game",
    Description = "Rejoin the current game",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end
})
UITab:BuildThemeSection()


UITab:BuildConfigSection()
Luna:Notification({
    Title = "Config Loaded",
    Content = "Your saved configuration has been automatically loaded.",
    Icon = "check_circle",
    ImageSource = "Material"
})
game:GetService("RunService").Heartbeat:Connect(function()
    if hrp then
        if autoTPEnabled and ball then
            local distance = (hrp.Position - ball.Position).Magnitude
            if distance > 5 then
                hrp.CFrame = ball.CFrame + Vector3.new(0, 1.5, 0)
            end
        end

        if ball and ball.Parent and ball.Parent:IsA("Model") and ball.Parent:FindFirstChild("Humanoid") and ball.Parent.Name == player.Name then
            teleportToGoal()
        end
    end

    if autoDribbleEnabled then
        autoDribble()
    end

    if tpBallToYouEnabled then
        tpBallToYou()
    end

    if autoFarmEnabled then
        autoFarm()
    end
end)