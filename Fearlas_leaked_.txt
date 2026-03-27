local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/obeseinsect/roblox/main/Ui%20Libraries/Elerium.lua'))()

-- Lock
local V3 = Vector3.new
local V2 = Vector2.new
local inf = math.huge
getgenv().Settings = {
    ["FearLas"] = {
        ["Enabled"] = false,
        ["DOT"] = true,
        ["AIRSHOT"] = false,
        ["Prediction"] = {
            ["Horizontal"] = 0.185,
            ["Vertical"] = 0.1,
        },
        ["CamPrediction"] = {
            ["Prediction"] = {
                ["Horizontal"] = 0.185,
                ["Vertical"] = 0.1,
            },
        },
        ["NOTIF"] = true,
        ["AUTOPRED"] = false,
        ["AdvancedAutoPred"] = false,
        ["FOV"] = inf,
        ["RESOLVER"] = false,
        ["LOCKTYPE"] = "Namecall",
        ["TargetStats"] = false,
        ["Resolver"] = {
              ["Enabled"] = false,
              ["Type"] = "None",
        },
       ["Camera"] = {
        ["Enabled"] = false,
        ["HoodCustomsBypass"] = false,
     },
        ["OnHit"] = {
             ["Enabled"] = true,
             ["Hitchams"] = {
                  ["Enabled"] = false,
                  ["Color"] = Color3.fromRGB(115,0,0),
                  ["Transparency"] = 0,
                  ["Material"] = "ForceField",
             },
            ["Hitsound"] = {
                  ["Enabled"] = false,
                  ["Sound"] = "hitsounds/sparkle.wav",
                  ["Volume"] = 2,
            },
        }
    },
	["Silent"] = {
		["Enabled"] = false,
		["AimPart"] = "HumanoidRootPart",
		["WallCheck"] = false,
		["Visualize"] = false,
		["Prediction"] = {
		   ["Horizontal"] = 0.15,
		   ["Vertical"] = 0.05,
		},
	    ["AutoPrediction"] = {
	        ["Enabled"] = false,
	        ["Type"] = "Normal", --//Normal, Custom
           ["ping20_30"] = 0.12588,
           ["ping30_40"] = 0.11911,
           ["ping40_50"] = 0.12471,
           ["ping50_60"] = 0.13766,
           ["ping60_70"] = 0.13731,
           ["ping70_80"] = 0.13951,
           ["ping80_90"] = 0.14181,
           ["ping90_100"] = 0.148,
           ["ping100_110"] = 0.156,
           ["ping110_120"] = 0.1567,
           ["ping120_130"] = 0.1601,
           ["ping130_140"] = 0.1637,
           ["ping140_150"] = 0.173,
           ["ping150_160"] = 0.1714,
           ["ping160_170"] = 0.1863,
           ["ping170_180"] = 0.1872,
           ["ping180_190"] = 0.1848,
           ["ping190_200"] = 0.1865,
	    },
		["Mode"] = "Namecall", --index,namecal
	},
	["FOV"] = {
		["Enabled"] = false,
		["Size"] = 23,
		["Filled"] = false,
		["Thickness"] = 0.66,
		["Transparency"] = 0.9,
		["Color"] = Color3.fromRGB(255,255,255),
	},
	["Misc"] = {
	    ["NoDelay"] = false,
	    ["AutoReload"] = false,
	    ["AutoAir"] = {
	        ["Enabled"] = false,
	        ["Interval"] = 0.5,
	    },
	    ["CMDS"] = { 
	        ["Enabled"] = false,
	        ["FOVPrefix"] = "B",
	        ["Prediction"] = "A",
	   },
	},
	["Checks"] = { --entirely not
	    ["UnlovkOnKO"] = false,
	    ["TrashTalkOnKO"] = false,
	},
	["Resolution"] = {
	    ["Value"] = 1,
	   },
	["Resolvers"] = {  --entirely not
	    ["Enabled"] = false,
	    ["AutoDetect"] = false,
	    ["Type"] = "Recalculator",
	},
    ["Visuals"] = {
        ["Ambient"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(4, 0, 255),
        },
        ["OutDoor Ambient"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(4, 0, 255)
        },
        ["Fog Modifications"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(4, 0, 255),
            ["Start"] = 15,
            ["End"] = 100 
        },
        ["ColorCorrection"] = {
            ["Enabled"] = false,
            ["Brightness"] = 0,
            ["Saturation"] = 5,
            ["Contrast"] = 2,
        },
    },
}
getgenv().DistancesMid = 50
getgenv().DistancesClose = 10
getgenv().AimSpeed = 1
getgenv().CAMPREDICTION = 0.185
getgenv().CAMJUMPPREDICTION = 0.1
getgenv().HorizontalSmoothness = 1
getgenv().VerticallSmoothness = 0.5
getgenv().ShakeX = 0
getgenv().ShakeY = 0
getgenv().ShakeZ = 0
getgenv().PREDICTION = 0.185
getgenv().JUMPPREDICTION = 0.1
getgenv().SelectedPart = "HumanoidRootPart" --// LowerTorso, UpperTorso, Head
getgenv().Prediction = "Normal"
getgenv().AutoPredType = "Normal"
getgenv().Resolver = false
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()


function SendNotification(text)
    Notification:Notify(
        {Title = "Imperial V3", Description = "By Las (Lion) - "..text},
        {OutlineColor = Color3.fromRGB(115,0,0),Time = 3, Type = "image"},
        {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(115,0,0)}
    )
end
function calculateVelocity(initialPos, finalPos, timeInterval)
    local displacement = finalPos - initialPos
    local velocity = displacement / timeInterval
    return velocity
    end
    game:GetService('RunService').RenderStepped:connect(function(deltaTime)
    if getgenv().Resolver == true and enabled then 
        local character = Plr.Character[getgenv().SelectedPart]
        local lastPosition = character.Position
            task.wait()
        local currentPosition = character.Position
        local velocity = calculateVelocity(lastPosition, currentPosition, deltaTime)
        character.AssemblyLinearVelocity = velocity
        character.Velocity = velocity
            lastPosition = currentPosition
        end
    end)

--// Change Prediction,  AutoPrediction Must Be Off
    local lplr = game.Players.LocalPlayer
    local AnchorCount = 0
    local MaxAnchor = 50
    local CC = game:GetService"Workspace".CurrentCamera
    local Plr;
    local enabled = false
    local mouse = game.Players.LocalPlayer:GetMouse()
    local placemarker = Instance.new("Part", game.Workspace)
    function makemarker(Parent, Adornee, Color, Size, Size2)
        local e = Instance.new("BillboardGui", Parent)
        e.Name = "PP"
        e.Adornee = Adornee
        e.Size = UDim2.new(Size, Size2, Size, Size2)
        e.AlwaysOnTop = getgenv().Settings.FearLas.DOT
        local a = Instance.new("Frame", e)
        if getgenv().Settings.FearLas.DOT == true then
        a.Size = UDim2.new(1, 1, 1, 1)
        else
        a.Size = UDim2.new(0, 0, 0, 0)
        end
        if getgenv().Settings.FearLas.DOT == true then
        a.Transparency = 0
        a.BackgroundTransparency = 0
        else
        a.Transparency = 1
        a.BackgroundTransparency = 1
        end
        a.BackgroundColor3 = Color
        local g = Instance.new("UICorner", a)
        if getgenv().Settings.FearLas.DOT == false then
        g.CornerRadius = UDim.new(1, 1)
        else
        g.CornerRadius = UDim.new(1, 1) 
        end
        return(e)
    end
    local data = game.Players:GetPlayers()
    function noob(player)
        local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(107, 184, 255), 0.3, 3)
        handler.Name = player.Name
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)
 
 
        spawn(function()
            while wait() do
                if player.Character then
                end
            end
        end)
    end
 
    for i = 1, #data do
        if data[i] ~= game.Players.LocalPlayer then
            noob(data[i])
        end
    end
 
    game.Players.PlayerAdded:connect(function(Player)
        noob(Player)
    end)
 
    spawn(function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        if getgenv().Settings.FearLas.DOT == true then
        placemarker.Size = V3(0, 0, 0)
        else
        placemarker.Size = V3(0, 0, 0)
        end
        placemarker.Transparency = 0.75
        if getgenv().Settings.FearLas.DOT then
        makemarker(placemarker, placemarker, Color3.fromRGB(115,0,0), 1, 0)
        end
    end)
 local Tool = Instance.new("Tool")
Tool.RequiresHandle = false
Tool.Name = "Lock Tool"
Tool.Parent = game.Players.LocalPlayer.Backpack
local player = game.Players.LocalPlayer
local function connectCharacterAdded()
    player.CharacterAdded:Connect(onCharacterAdded)
end
connectCharacterAdded()
player.CharacterRemoving:Connect(function()
Tool.Parent = game.Players.LocalPlayer.Backpack
end)
function hitsound()
    local Hit = Instance.new("Sound")
    Hit.Parent = game.SoundService
    Hit.SoundId = getcustomasset(getgenv().Settings.FearLas.OnHit.Hitsound.Sound)
    Hit.Volume = getgenv().Settings.FearLas.OnHit.Hitsound.Volume
    Hit.Looped = false
    Hit:Play()
    Hit.Ended:Connect(function()                                         Hit:Destroy()
        end)
end

Tool.Activated:Connect(function()
if getgenv().Settings.FearLas.Enabled or getgenv().Settings.FearLas.Camera.Enabled then
            if enabled == true then
                enabled = false
                    Plr = LockToPlayer()
                if getgenv().Settings.FearLas.NOTIF == true then 
 SendNotification("Unlocked")
            end
            else
                Plr = LockToPlayer()
                TargetPlayer = tostring(Plr)
                enabled = true
local oldHealt = game.Players[TargetPlayer].Character.Humanoid.Health
                        if getgenv().Settings.FearLas.OnHit.Hitsound.Enabled and Plr ~= nil then

                             game.Players[TargetPlayer].Character.Humanoid.HealthChanged:Connect(function(neHealth)                            
if neHealth < oldHealt then
hitsound()
elseif neHealth > oldHealt then
print("nil")
elseif game.Players[TargetPlayer].Character.Humanoid.Health < 0 then
print("nil")
end
oldHealt = neHealth
end)
end                                      
              
if getgenv().Settings.FearLas.OnHit.Hitchams.Enabled then
   
        if Plr ~= nil then  game.Players[TargetPlayer].Character.Humanoid.HealthChanged:Connect(function(neHealth)
        local Clone = game.Players[TargetPlayer].Character:Clone()
        if neHealth > oldHealt then
            Clone:Destroy()
        end
        if game.Players[TargetPlayer].Character.Humanoid.Health < 0 then
            Clone:Destroy()
        end
        if neHealth < oldHealt then
            -- Main Hit-Chams --
            game.Players[TargetPlayer].Character.Archivable = true
            for _, Obj in next, Clone:GetDescendants() do
                if Obj.Name == "HumanoidRootPart" or Obj:IsA("Humanoid") or Obj:IsA("LocalScript") or Obj:IsA("Script") or Obj:IsA("Decal") then
                    Obj:Destroy()
                elseif Obj:IsA("BasePart") or Obj:IsA("Meshpart") or Obj:IsA("Part") then
                    if Obj.Transparency == 1 then
                        Obj:Destroy()
                    else
                        Obj.CanCollide = false
                        Obj.Anchored = true
                        Obj.Material = getgenv().Settings.FearLas.OnHit.Hitchams.Material
                        Obj.Color = getgenv().Settings.FearLas.OnHit.Hitchams.Color
                        Obj.Transparency = getgenv().Settings.FearLas.OnHit.Hitchams.Transparency
                        Obj.Size = Obj.Size + V3(0.05, 0.05, 0.05)
                    end
                end
           
            end
            Clone.Parent = game.Workspace
            local start = tick()
            local connection
            connection = game:GetService("RunService").Heartbeat:Connect(function()
                if tick() - start >= 3 then
                    connection:Disconnect()
                    Clone:Destroy()
                end
            end)
        end

            oldHealt = neHealth

    end)
    end
end
                if getgenv().Settings.FearLas.NOTIF == true then
SendNotification("Target: "..Plr.Character.Humanoid.DisplayName)
                end
            end
   else
  SendNotification("Cam/Target not enabled!")
        end
    end)
 
local TargetStats = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Picture = Instance.new("ImageLabel")
local Top = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UIGradient_2 = Instance.new("UIGradient")
local HealthBarBackground = Instance.new("Frame")
local UIGradient_3 = Instance.new("UIGradient")
local HealthBar = Instance.new("Frame")
local UIGradient_4 = Instance.new("UIGradient")
local NameOfTarget = Instance.new("TextLabel")

spawn(function()
TargetStats.Name = "TargetStats"
TargetStats.Parent = game.CoreGui
TargetStats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = TargetStats
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.388957828, 0, 0.700122297, 0)
Background.Size = UDim2.new(0, 358, 0, 71)
Background.Visible = false

Picture.Name = "Picture"
Picture.Parent = Background
Picture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Picture.BorderSizePixel = 0
Picture.Position = UDim2.new(0.0279329624, 0, 0.0704225376, 0)
Picture.Size = UDim2.new(0, 59, 0, 59)
Picture.Transparency = 1
Picture.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Top.Name = "Top"
Top.Parent = Background
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(0, 0, -0.101449274, 0)
Top.Size = UDim2.new(0, 358, 0, 7)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(115,0,0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(155,40,0))}
UIGradient.Rotation = 90
UIGradient.Parent = Top

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(52, 52, 52)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient_2.Rotation = 90
UIGradient_2.Parent = Background

HealthBarBackground.Name = "HealthBarBackground"
HealthBarBackground.Parent = Background
HealthBarBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthBarBackground.BorderSizePixel = 0
HealthBarBackground.Position = UDim2.new(0.215083793, 0, 0.348234326, 0)
HealthBarBackground.Size = UDim2.new(0, 270, 0, 19)
HealthBarBackground.Transparency = 1

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))}
UIGradient_3.Rotation = 90
UIGradient_3.Parent = HealthBarBackground

HealthBar.Name = "HealthBar"
HealthBar.Parent = HealthBarBackground
HealthBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthBar.BorderSizePixel = 0
HealthBar.Position = UDim2.new(-0.00336122862, 0, 0.164894029, 0)
HealthBar.Size = UDim2.new(0, 130, 0, 19)

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(184, 159, 227)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 88, 156))}
UIGradient_4.Rotation = 90
UIGradient_4.Parent = HealthBar

NameOfTarget.Name = "NameOfTarget"
NameOfTarget.Parent = Background
NameOfTarget.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NameOfTarget.BackgroundTransparency = 1.000
NameOfTarget.Position = UDim2.new(0.220670387, 0, 0.0704225376, 0)
NameOfTarget.Size = UDim2.new(0, 268, 0, 19)
NameOfTarget.Font = Enum.Font.Code
NameOfTarget.TextColor3 = Color3.fromRGB(255, 255, 255)
NameOfTarget.TextScaled = true
NameOfTarget.TextSize = 14.000
NameOfTarget.TextStrokeTransparency = 0.000
NameOfTarget.TextWrapped = true
end)

local IsAlive = function(GetPlayer)
    return GetPlayer and GetPlayer.Character and GetPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and GetPlayer.Character:FindFirstChild("Humanoid") ~= nil and GetPlayer.Character:FindFirstChild("Head") ~= nil and true or false
end

spawn(function()
    while wait() do
        if getgenv().Settings.FearLas.TargetStats and getgenv().Settings.FearLas.Enabled and enabled then
            if Plr and IsAlive(Plr) then
                Background.Visible = true
                NameOfTarget.Text = tostring(Plr.Character.Humanoid.DisplayName).." ["..tostring(Plr.Name).."]"
                Picture.Image  = "rbxthumb://type=AvatarHeadShot&id=" ..Plr.UserId.. "&w=420&h=420"
                HealthBar:TweenSize(UDim2.new(Plr.Character.Humanoid.Health / Plr.Character.Humanoid.MaxHealth, 0, 1, 0), "In", "Linear", 0.25)
                spawn(function()
                    if getgenv().Settings.FearLas.TargetStats == false then
                        Background.Visible = false
                    end
                end)
            end
        else
            Background.Visible = false
        end
    end
end)
    function LockToPlayer()
        local closestPlayer
        local shortestDistance = getgenv().Settings.FearLas.FOV
 
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (V2(pos.X, pos.Y) - V2(mouse.X, mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end
 
local Stats = game:GetService("Stats")

local Piiing = Stats:WaitForChild("Network"):WaitForChild("ServerStatsItem"):WaitForChild("Data Ping")
local function Predict(Velocity)
    return V3(Velocity.X,math.clamp(Velocity.Y*0.5,-5,10),Velocity.Z)
end

local function GetLockPrediction(Part)
    return Part.CFrame + (Predict(Part.Velocity) * getgenv().PREDICTION)
end
local function GetCamPrediction(Part)
    return Part.CFrame + Predict(Part.Velocity) * (getgenv().CAMPREDICTION)
end

    local pingvalue = nil;
    local split = nil;
    local ping = nil;
local LocalHL = Instance.new("Highlight") 
    game:GetService"RunService".Stepped:connect(function()
        if enabled and getgenv(). Settings.FearLas.Enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") or enabled and getgenv(). Settings.FearLas.Camera.Enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
if getgenv().Prediction == "Normal" then
            placemarker.CFrame = CFrame.new(GetLockPrediction(Plr.Character[getgenv().SelectedPart]).Position)         
elseif getgenv().Prediction == "Yun" then
            placemarker.CFrame = CFrame.new(Plr.Character[getgenv().SelectedPart].Position+V3(Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.X*getgenv().PREDICTION/10,Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.Y*getgenv().JUMPPREDICTION/10,Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.Z*getgenv().PREDICTION/10))
end

LocalHL.Parent = Plr.Character
LocalHL.FillTransparency = 0.2
LocalHL.FillColor = Color3.fromRGB(115,0,0)
LocalHL.OutlineColor = Color3.fromRGB(255,255,255)

        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
    
          LocalHL.Parent = nil
        
        end
pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
split = string.split(pingvalue,'(')
ping = tonumber(split[1])

if getgenv().Settings.FearLas.AdvancedAutoPred == true and enabled then
    getgenv().CAMJUMPPREDICTION = 0.05
    if ping > 300 then
        getgenv().CAMPREDICTION = 0.434
    elseif ping > 290 then
        getgenv().CAMPREDICTION = 0.422
    elseif ping > 280 then
        getgenv().CAMPREDICTION = 0.44
    elseif ping > 270 then
        getgenv().CAMPREDICTION = 0.4385
    elseif ping > 260 then
        getgenv().CAMPREDICTION = 0.4158
    elseif ping > 250 then
        getgenv().CAMPREDICTION = 0.3148
    elseif ping > 240 then
        getgenv().CAMPREDICTION = 0.34
    elseif ping > 230 then
        getgenv().CAMPREDICTION = 0.33
    elseif ping > 220 then
        getgenv().CAMPREDICTION = 0.30
    elseif ping > 210 then
        getgenv().CAMPREDICTION = 0.295
    elseif ping > 200 then
        getgenv().CAMPREDICTION = 0.2915
    elseif ping > 190 then
        getgenv().CAMPREDICTION = 0.2911
    elseif ping > 180 then
        getgenv().CAMPREDICTION = 0.28291198328
    elseif ping > 180 then
        getgenv().CAMPREDICTION = 0.25291198328
    elseif ping > 170 then
        getgenv().CAMPREDICTION = 0.28
    elseif ping > 160 then
        getgenv().CAMPREDICTION = 0.2754
    elseif ping  >150 then
        getgenv().CAMPREDICTION = 0.271
    elseif ping  >140 then
        getgenv().CAMPREDICTION = 0.25
       elseif ping > 130 then
        getgenv().CAMPREDICTION = 0.12057
    elseif ping > 120 then
        getgenv().CAMPREDICTION = 0.1966
    elseif ping > 110 then
        getgenv().CAMPREDICTION = 0.18642271
    elseif ping > 100 then
        getgenv().CAMPREDICTION = 0.18533
    elseif ping > 90 then
        getgenv().CAMPREDICTION = 0.1749573
    elseif ping > 80 then
        getgenv().CAMPREDICTION = 0.1745
    elseif ping > 70 then
        getgenv().CAMPREDICTION = 0.1642
    elseif ping > 50 then
        getgenv().CAMPREDICTION = 0.14267
    elseif ping > 40 then
        getgenv().CAMPREDICTION = 0.142
    elseif ping > 30 then
        getgenv().CAMPREDICTION = 0.1312
   elseif ping > 20 then
        getgenv().CAMPREDICTION = 0.1312
   elseif ping > 10 then
        getgenv().CAMPREDICTION = 0.1287
   end
end
if getgenv().Settings.FearLas.AUTOPRED == true then
if getgenv().AutoPredType == "Normal" then
if getgenv().Prediction == "Normal" then
getgenv().JUMPPREDICTION = tostring(ping/1500)
if ping <200 then
        getgenv().PREDICTION = 0.2198343243234332
    elseif ping < 170 then
        getgenv().PREDICTION = 0.2165713
    elseif ping < 160 then
        getgenv().PREDICTION = 0.16242
    elseif ping < 150 then
        getgenv().PREDICTION = 0.158041
    elseif ping < 140 then
        getgenv().PREDICTION = 0.155313
    elseif ping < 130 then
        getgenv().PREDICTION = 0.152692
    elseif ping < 120 then
        getgenv().PREDICTION = 0.153017
    elseif ping < 110 then
        getgenv().PREDICTION = 0.15165
    elseif ping < 100 then
  getgenv().PREDICTION = 0.1483987
 elseif ping < 80 then
  getgenv().PREDICTION = 0.1451340
 elseif ping < 70 then
  getgenv().PREDICTION = 0.143633
 elseif ping < 65 then
  getgenv().PREDICTION = 0.1374236
 elseif ping < 50 then
  getgenv().PREDICTION = 0.13644
 elseif ping < 30 then
  getgenv().PREDICTION = 0.12452476
end
end
elseif getgenv().AutoPredType == "Beta AutoPred" then
    if getgenv().Prediction == "Normal" then
    getgenv().JUMPPREDICTION = tostring(ping/1500)
    if ping <200 then
        getgenv().PREDICTION = 0.1973432432343325
    elseif ping < 150 then
        getgenv().PREDICTION = 0.1922
    elseif ping < 90 then
        getgenv().PREDICTION = 0.176
    elseif ping < 80 then
        getgenv().PREDICTION = 0.169
    elseif ping < 70 then
        getgenv().PREDICTION = 0.1355
    elseif ping < 50 then
        getgenv().PREDICTION = 0.125
    elseif ping < 40 then
        getgenv().PREDICTION = 0.12
    elseif ping < 30 then
        getgenv().PREDICTION = 0.12
    end
end
elseif getgenv().AutoPredType == "Old Azure" then
if getgenv().Prediction == "Normal" then
 getgenv().JUMPPREDICTION = tostring(ping/1500)
   if ping < 360 then
  getgenv().PREDICTION = 0.16537
  elseif ping < 270 then
     getgenv().PREDICTION = 0.195566
     elseif ping < 260 then
         getgenv().PREDICTION = 0.175566
      elseif ping < 250 then
         getgenv().PREDICTION = 0.1651
              elseif ping < 240 then
           getgenv().PREDICTION = 0.16780
                elseif ping < 230 then
                    getgenv().PREDICTION = 0.15692
                elseif ping < 220 then
                    getgenv().PREDICTION = 0.165566
                elseif ping < 210 then
                    getgenv().PREDICTION = 0.16780
                elseif ping < 200 then
                    getgenv().PREDICTION = 0.165566
                elseif ping < 190 then
                    getgenv().PREDICTION = 0.166547
                elseif ping < 180 then
                    getgenv().PREDICTION = 0.19284
                elseif ping < 170 then
                    getgenv().PREDICTION = 0.1923111 
                elseif ping < 160 then
                    getgenv().PREDICTION = 0.16
                elseif ping < 150 then
                    getgenv().PREDICTION = 0.15
                elseif ping < 140 then
                    getgenv().PREDICTION = 0.1223333
                elseif ping < 130 then
                    getgenv().PREDICTION = 0.156692
                elseif ping < 120 then
                    getgenv().PREDICTION = 0.143765
                elseif ping < 110 then
                    getgenv().PREDICTION = 0.1455
                elseif ping < 100 then
                    getgenv().PREDICTION = 0.130340
                elseif ping < 90 then
                    getgenv().PREDICTION = 0.136
                elseif ping < 80 then
                    getgenv().PREDICTION = 0.1347
                elseif ping < 70 then
                    getgenv().PREDICTION = 0.119
                elseif ping < 60 then
                    getgenv().PREDICTION = 0.12731
                elseif ping < 50 then
                    getgenv().PREDICTION = 0.127668
                elseif ping < 40 then
                    getgenv().PREDICTION = 0.125
                elseif ping < 30 then
                    getgenv().PREDICTION = 0.11
                elseif ping < 20 then
                    getgenv().PREDICTION = 0.12588
                elseif ping < 10 then
                    getgenv().PREDICTION = 0.09
                end
end
elseif getgenv().AutoPredType == "Fake Celex" then
    if getgenv().Prediction == "Normal" then
        getgenv().JUMPPREDICTION = tostring(ping/1500)
                if ping > 190 then
                    getgenv().PREDICTION = 0.206547
                elseif ping > 180 then
                    getgenv().PREDICTION = 0.19284
                elseif ping > 170 then
                    getgenv().PREDICTION = 0.1923111
                elseif ping > 160 then
                    getgenv().PREDICTION = 0.1823111
                elseif ping > 150 then
                    getgenv().PREDICTION = 0.171
                elseif ping > 140 then
                    getgenv().PREDICTION = 0.165773
                elseif ping > 130 then
                    getgenv().PREDICTION = 0.14333322
                elseif ping > 120 then
                    getgenv().PREDICTION = 0.143765
                elseif ping > 110 then
                    getgenv().PREDICTION = 0.1455
                elseif ping > 100 then
                    getgenv().PREDICTION = 0.143987
                elseif ping > 90 then
                    getgenv().PREDICTION = 0.14215
                elseif ping > 80 then
                    getgenv().PREDICTION = 0.141340
                elseif ping > 70 then
                    getgenv().PREDICTION = 0.13633
                elseif ping > 60 then
                    getgenv().PREDICTION = 0.12731
                elseif ping > 50 then
                    getgenv().PREDICTION = 0.127668
                elseif ping > 40 then
                    getgenv().PREDICTION = 0.125
                elseif ping > 30 then
                    getgenv().PREDICTION = 0.1261
                elseif ping > 20 then
                    getgenv().PREDICTION = 0.12588
                elseif ping > 10 then
                    getgenv().PREDICTION = 0.09
                end
    end

end
end

if getgenv().Settings.FearLas.Resolver.Enabled then
if getgenv().Settings.FearLas.Resolver.Type == "Delta Time" then
print("wsg")
end
if getgenv().Settings.FearLas.Resolver.Type == "Recalculator" then
print("wsg")
end
if getgenv().Settings.FearLas.Resolver.Type == "No Y Velocity" then
print("wsg")
end
end
    end)


game:GetService"RunService".Stepped:connect(function()
    if enabled and getgenv().Settings.FearLas.Camera.Enabled then
        if Plr ~= nil then
            local shakeOffset = V3(
                math.random(-getgenv().ShakeX, getgenv().ShakeX),
                math.random(-getgenv().ShakeY, getgenv().ShakeY),
                math.random(-getgenv().ShakeZ, getgenv().ShakeZ)
            ) * 0.1
local HorizontalLookPosition = CFrame.new(CC.CFrame.p, GetCamPrediction(Plr.Character[getgenv().SelectedPart]).Position+shakeOffset)
      CC.CFrame = CC.CFrame:Lerp(HorizontalLookPosition, getgenv().HorizontalSmoothness)
    end
end
end)

    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(...)
        local args = {...}
        local vap = {"UpdateMousePos", "GetMousePos", "MousePos", "MOUSE", "MousePosUpdate"}
        if enabled and getnamecallmethod() == "FireServer" and table.find(vap, args[2]) and getgenv().Settings.FearLas.Enabled and Plr.Character ~= nil and getgenv().Settings.FearLas.LOCKTYPE == "Namecall" then
            if getgenv().Prediction == "Normal" then
            args[3] = GetLockPrediction(Plr.Character[getgenv().SelectedPart]).Position
            elseif getgenv().Prediction == "Yun" then
            args[3] = Plr.Character[getgenv().SelectedPart].Position+V3(Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.X*getgenv().PREDICTION/10,Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.Y*getgenv().JUMPPREDICTION/10,Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.Z*getgenv().PREDICTION/10)
            else
 
            args[3] = Plr.Character[SelectedPart].Position
 
            end
 
            return old(unpack(args))
        end
        return old(...)
    end)

local Hooks = {}
local Client = game.Players.LocalPlayer

Hooks[1] = hookmetamethod(Client:GetMouse(), "__index", newcclosure(function(self, index)
    if index == "Hit" and getgenv().Settings.FearLas.LOCKTYPE == "Index" and enabled and Plr.Character ~= nil and getgenv().Settings.FearLas.Enabled then
            local position = CFrame.new(GetLockPrediction(Plr.Character[getgenv().SelectedPart]).Position)
            return position
        
    end
    return Hooks[1](self, index)
end))



 for _, key in next, getgc(true) do 
        local function updateKey(instanceType)
            if pcall(function() return rawget(key, instanceType) end) and typeof(rawget(key, instanceType)) == 'table' and (rawget(key, instanceType))[1] == 'kick' then
                key.tvk = {
                    'kick',
                    function() 
                        return game.Workspace:WaitForChild('')
                    end
                }
            end
        end
        updateKey('indexInstance')
        updateKey('namecallInstance')
    end
do
	local Window = library:AddWindow("Imperial V3", {
		main_color = Color3.fromRGB(69,0,0),
		min_size = Vector2.new(500, 600),
		toggle_key = Enum.KeyCode.RightShift,
		can_resize = true,
	})

	local Tab = Window:AddTab("Camera Lock")
	local WsgCuh = Window:AddTab("Silent Aim")
	local Teb = Window:AddTab("Target Lock")
	local Tib = Window:AddTab("Miscs")
	local Tub = Window:AddTab("Debugging")

	do -- Elements
	WsgCuh:AddLabel("Configuration")

	local bleud = WsgCuh:AddSwitch("Enabled", function(bool)
	getgenv().Settings.FOV.Enabled = bool
	getgenv().Settings.Silent.Enabled = bool
	end)
bleud:Set(false)
	local bleud = WsgCuh:AddSwitch("Visualize Target", function(bool)
	getgenv().Settings.Silent.Visualize = bool
	end)
	WsgCuh:AddTextBox("FOV Size", function(text)
	getgenv().Settings.FOV.Size = text
		end, 
	{
	["clear"] = false, -- Default: true (options are optional)
	})
local TyperaThing = WsgCuh:AddDropdown("Aim Type", function(object)
			getgenv().Settings.Silent.Mode = object
		end)
TyperaThing:Add("Namecall")
TyperaThing:Add("Index")
	WsgCuh:AddTextBox("Horizontal Prediction", function(text)
	getgenv().Settings.Silent.Prediction.Horizontal = text
		end, 
	{
	["clear"] = false, -- Default: true (options are optional)
	})
	WsgCuh:AddTextBox("Vertical Prediction", function(text)
	getgenv().Settings.Silent.Prediction.Vertical = text
		end, 
	{
	["clear"] = false, -- Default: true (options are optional)
	})
local Swaaetch = WsgCuh:AddSwitch("Auto SetUp", function(bool)
getgenv().Settings.FearLas.AUTOPRED = bool
end)
Swaaetch:Set(false)
local Droeopdown = WsgCuh:AddDropdown("Aim Bone", function(object)
getgenv().SelectedPart = object
end)
Droeopdown:Add("HumanoidRootPart")
Droeopdown:Add("UpperTorso")
Droeopdown:Add("LowerTorso")
Droeopdown:Add("Head")

		Tab:AddLabel("Configuration")

	local Lenabled = Tab:AddSwitch("Enabled", function(bool)
		getgenv().Settings.FearLas.Camera.Enabled = bool
		end)
		Lenabled:Set(false)

	Tab:AddTextBox("Horizontal Prediction", function(text)
	getgenv().CAMPREDICTION = text
		end, 
	{
	["clear"] = false, -- Default: true (options are optional)
	})
	Tab:AddTextBox("Smoothness Value", function(text)
		getgenv().HorizontalSmoothness = text
		end, 
	{
	["clear"] = false, -- Default: true (options are optional)
	})
local ShakeFolder = Tab:AddFolder("Shake Configuration")
	ShakeFolder:AddTextBox("X Value", function(text)
		getgenv().ShakeX = text
		end, 
	{
	["clear"] = false, -- Default: true (options are optional)
	})
	ShakeFolder:AddTextBox("Y Value", function(text)
		getgenv().ShakeY = text
		end, 
	{
	["clear"] = false, -- Default: true (options are optional)
	})
	ShakeFolder:AddTextBox("Z Value", function(text)
		getgenv().ShakeZ = text
		end, 
	{
	["clear"] = false, -- Default: true (options are optional)
	})
local thingsetup = Tab:AddSwitch("Auto SetUp", function(bool)
	getgenv().Settings.FearLas.AdvancedAutoPred = bool
end)
thingsetup:Set(false)
	local Dropdown = Tab:AddDropdown("Aim Bone", function(object)
		getgenv().SelectedPart = object
		end)
Dropdown:Add("HumanoidRootPart")
Dropdown:Add("UpperTorso")
Dropdown:Add("LowerTorso")
Dropdown:Add("Head")
--// Target Lock
	Teb:AddLabel("Configuration")
	local bled = Teb:AddSwitch("Enabled", function(bool)
	getgenv().Settings.FearLas.Enabled = bool
	end)
bled:Set(false)
		local TypeThing = Teb:AddDropdown("Aim Type", function(object)
			getgenv().Settings.FearLas.LOCKTYPE = object
		end)
TypeThing:Add("Namecall")
TypeThing:Add("Index")









		local PredTypeThing = Teb:AddDropdown("Prediction Type", function(object)
			getgenv().Prediction = object
		end)
PredTypeThing:Add("Normal")
PredTypeThing:Add("Yun")
	Teb:AddTextBox("Horizontal Prediction", function(text)
	getgenv().PREDICTION = text
		end, 
	{
	["clear"] = false, -- Default: true (options are optional)
	})
		local Swiitch = Teb:AddSwitch("Auto SetUp", function(bool)
			getgenv().Settings.FearLas.AUTOPRED = bool
		end)
		Swiitch:Set(false)
		local pptch = Teb:AddSwitch("pp", function(bool)
			getgenv().Resolver = bool
		end)
		pptch:Set(false)

		local Droopdown = Teb:AddDropdown("Aim Bone", function(object)
		getgenv().SelectedPart = object
		end)

Droopdown:Add("HumanoidRootPart")
Droopdown:Add("UpperTorso")
Droopdown:Add("LowerTorso")
Droopdown:Add("Head")

--// Miscs

local OnHitFolder = Tib:AddFolder("On Hit")
	OnHitFolder:AddLabel("On Hit")

local HitsoundsFolder = OnHitFolder:AddFolder("Hitsounds")

local HitsoundEnabledThing = HitsoundsFolder:AddSwitch("Enabled", function(bool)
		getgenv().Settings.FearLas.OnHit.Hitsound.Enabled = bool
	end)
HitsoundEnabledThing:Set(false)

local SoundsOptions = HitsoundsFolder:AddDropdown("Sound Effect", function(object)
		getgenv().Settings.FearLas.OnHit.Hitsound.Sound = object
		end)

SoundsOptions:Add("hitsounds/hentai.wav")
SoundsOptions:Add("hitsounds/amongus.wav")
SoundsOptions:Add("hitsounds/sparkle.wav")
SoundsOptions:Add("hitsounds/bell.wav")
SoundsOptions:Add("hitsounds/bepis.wav")
SoundsOptions:Add("hitsounds/bubble.wav")
SoundsOptions:Add("hitsounds/cock.wav")
SoundsOptions:Add("hitsounds/cod.wav")
SoundsOptions:Add("hitsounds/fatality.wav")
SoundsOptions:Add("hitsounds/phonk.wav")

local HitchamsFolder = OnHitFolder:AddFolder("Hitchams")

local HitchamsEnabledThing = HitchamsFolder:AddSwitch("Enabled", function(bool)
		getgenv().Settings.FearLas.OnHit.Hitchams.Enabled = bool
end)
HitchamsEnabledThing:Set(false)

local MaterialOptions = HitchamsFolder:AddDropdown("Material", function(object)
		getgenv().Settings.FearLas.OnHit.Hitchams.Material = object
		end)

MaterialOptions:Add("ForceField")
MaterialOptions:Add("Neon")
MaterialOptions:Add("Glass")
MaterialOptions:Add("Plastic")
MaterialOptions:Add("Brick")

local AntiFolder = Tib:AddFolder("Anti Lock")
		AntiFolder:AddLabel("Anti Locks")


local ActualMiscs = Tib:AddFolder("Others")
ActualMiscs:AddLabel("Miscellaneous")
ActualMiscs:AddButton("CFrame Speed", function()
-- Initial values
getgenv().Speed = false
getgenv().SpeedAmount = 2
-- Create a basic GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
local ToggleButton = Instance.new("TextButton")
ToggleButton.Text = "Toggle Speed"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundTransparency = 0.5
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(1, -120, 0, 35) -- Adjusted the position to top right corner
ToggleButton.Size = UDim2.new(0, 100, 0, 18)
ToggleButton.BackgroundColor3 = Color3.fromRGB(69,0,0)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local UICorner = Instance.new("UICorner")
UICorner.Parent = ToggleButton
local function onButtonClicked()
    getgenv().Speed = not getgenv().Speed
end
ToggleButton.MouseButton1Click:Connect(onButtonClicked)
-- Your existing code modified for the GUI
game:GetService("RunService").Stepped:Connect(function()
    if getgenv().Speed then
        lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + lplr.Character.Humanoid.MoveDirection * getgenv().SpeedAmount
    end
end)
end)

ActualMiscs:AddTextBox("Speed Amount", function(text)
getgenv().SpeedAmount = text
end, 
{
["clear"] = false, -- Default: true (options are optional)
})
local DelaySwitch = ActualMiscs:AddSwitch("No Delay", function(bool)
	getgenv().NoDelay = bool
end)
DelaySwitch:Set(false)
ActualMiscs:AddButton("Rightclick", function()
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Corporations"
ScreenGui.ResetOnSpawn = false -- Keep the GUI after respawn
ScreenGui.Parent = PlayerGui

local TextButton = Instance.new("TextButton")
TextButton.Name = "Imperial"
TextButton.Parent = ScreenGui
TextButton.BackgroundColor3 = Color3.fromRGB(69,0,0)
TextButton.BackgroundTransparency = 0.5
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(1, -120, 0, 10) -- Adjusted the position to top right corner
TextButton.Size = UDim2.new(0, 100, 0, 18)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Rightclick"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 18
local UICorner = Instance.new("UICorner")
UICorner.Parent = TextButton

-- Function to send the keybind
local function OnButtonClick()
    local vim = game:GetService("VirtualInputManager")
    vim:SendKeyEvent(true, "ButtonL2", false, game)
end

-- Event connection
TextButton.MouseButton1Click:Connect(OnButtonClick)
end)

if getgenv().NoDelay == true then
game:GetService("CorePackages").Packages:Destroy()
end
local BypassFolder = Tib:AddFolder("Anti Cheat Bypass")
BypassFolder:AddLabel("Anti Cheats")
local Bypass1 = BypassFolder:AddSwitch("Hood Custom Camlock Bypass", function(bool)
	getgenv().Settings.FearLas.Camera.HoodCustomsBypass = bool
end)
Bypass1:Set(false)
local Bypass2 = BypassFolder:AddSwitch("DaHood Bypass", function(bool)
	getgenv().DaHoodBypass = bool
end)
Bypass2:Set(false)
local Bypass3 = BypassFolder:AddSwitch("Untitled Hood Bypass", function(bool)
	getgenv().UntitledHoodBypass = bool
end)
Bypass3:Set(false)
if getgenv().UntitledHoodBypass == true then
local _1;
_1 = hookmetamethod(game, "__namecall", function(self, ...)
    if not checkcaller() and getnamecallmethod() == "FireServer" then
        if tostring(self.Name) == ".gg/untitledhood" then
            local args = {...}
            if tostring(args[1]) == "ForceDetect" or tostring(args[1]) == "TeleportDetect" or tostring(args[1]) == "GUI_CHECK" then
                return print("anticheat detected something sussy");
            end
        end
    end
    return _1(self, ...);
end)
end

if getgenv().DaHoodBypass == true then
assert(getrawmetatable)
grm = getrawmetatable(game)
setreadonly(grm, false)
old = grm.__namecall
grm.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if tostring(args[1]) == "TeleportDetect" then
        return
    elseif tostring(args[1]) == "CHECKER_1" then
        return
    elseif tostring(args[1]) == "CHECKER" then
        return
    elseif tostring(args[1]) == "GUI_CHECK" then
        return
    elseif tostring(args[1]) == "OneMoreTime" then
        return
    elseif tostring(args[1]) == "checkingSPEED" then
        return
    elseif tostring(args[1]) == "BANREMOTE" then
        return
    elseif tostring(args[1]) == "PERMAIDBAN" then
        return
    elseif tostring(args[1]) == "KICKREMOTE" then
        return
    elseif tostring(args[1]) == "BR_KICKPC" then
        return
    elseif tostring(args[1]) == "BR_KICKMOBILE" then
        return
    end
    return old(self, ...)
end)
end
--// Config System

--// Quick Execute
	local Console = Tub:AddConsole({
			["y"] = 100,
			["source"] = "Lua",
		})
		Console:Set("-- Gamer time!\nfor i = 1, 9 do \n    print(i)\nend")
		print(Console:Get())
		local HA = Tub:AddHorizontalAlignment()
		HA:AddButton("Execute", function()
			loadstring(Console:Get())()
		end)
		HA:AddButton("Clear", function()
			Console:Set("")
		end)
		
	end
	Tab:Show()
	library:FormatWindows()
end