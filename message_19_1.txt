getgenv().KeanW = {
    Main = {
        ["FindBestServer"] = false, -- connects to server with best ping
        ["Key"] = "your_key",
        ["Gui"] = false,
        ["GuiInfo"] = true,
        ["AutoLowGFX"] = true, 
        ["DisableShadows"] = true, 
        ["MuteBoomBox"] = true,
    },
    Silent = {
        ["Enabled"] = true,
        ["UseKeybind"] = true,
        ["Keybind"] = "k",
        ["Part"] = "HumanoidRootPart",
        ["Prediction"] = 0.136,
        ["Default"] = 0.136,
        ["ClosestPart"] = true,
        ["ClosestPoint"] = true,
        ["AntiGroundShots"] = true,
        ["Checks"] = {
            ["DeathCheck"] = true,
            ["VisibleCheck"] = true,
            ["GrabbedCheck"] = true
        }
    },
    Aimbot = {
        ["Enabled"] = true,
        ["Keybind"] = "c",
        ["Part"] = "UpperTorso",
        ["UsePrediction"] = false,
        ["Prediction"] = 0.14,
        ["FirstPerson"] = true,
        ["ThirdPerson"] = true,
        ["Radius"] = 35,
        ["Smoothness"] = false,
        ["Amount"] = 0.375,
        ["ClosestPart"] = true,
        ["Checks"] = {
            ["DeathCheck"] = true,
            ["OwnDeathCheck"] = true,
            ["WallCheck"] = true
        }
    },
    Resolver = {
        ["Enabled"] = true, -- // If you want to resolve anti-locks
        ["Resolve_Desync"] = true,
        ["Resolve_Underground"] = true,
        ["AntiAimViewer"] = true -- Bypasses serverside mouse position (note: doesnt work on client)
    },
    FOV = {
        ["Visible"] = false,
        ["Radius"] = 40,
        ["Default"] = 22,
        ["Color"] = "teal"
    },
    Range = {
        ["Enabled"] = true,
        ["CloseDistance"] = 37,
        ["MidDistance"] = 68,
        ["FarDistance"] = math.huge,
        ["FOV"] = {
            ["Enabled"] = false,
            ["Close"] = 31,
            ["Mid"] = 23,
            ["Far"] = 15
        },
        ["Smoothness"] = {
            ["Enabled"] = false,
            ["Close"] = 0.098,
            ["Mid"] = 0.068,
            ["Far"] = 0.037
        },
        ["Prediction"] = {
            ["Enabled"] = true,
            ["Close"] = {
                ["P20_30"] = 0.12542465767834,
                ["P30_40"] = 0.12742,
                ["P50_60"] = 0.134543,
                ["P60_70"] = 0.141,
                ["P70_80"] = 0.1413,
                ["P80_90"] = 0.1487,
                ["P90_120"] = 0.15738,
                ["P120_140"] = 0.12534,
                ["P140_200"] = 0.1652131
            },
            ["Mid"] = {
                ["P20_30"] = 0.12588,
                ["P30_40"] = 0.11,
                ["P40_50"] = 0.127668,
                ["P50_60"] = 0.12731,
                ["P70_80"] = 0.1365,
                ["P80_90"] = 0.138,
                ["P90_120"] = 0.157,
                ["P120_140"] = 0.13432,
                ["P140_200"] = 0.16779123
            },
            ["Far"] = {
                ["P20_30"] = 0.11120,
                ["P30_40"] = 0.11120,
                ["P40_50"] = 0.12542465767834,
                ["P50_60"] = 0.12921,
                ["P60_70"] = 0.1311,
                ["P70_80"] = 0.1311,
                ["P80_90"] = 0.1311,
                ["P90_120"] = 0.14325,
                ["P120_140"] = 0.138876,
                ["P140_200"] = 0.165455312399999
            }
        }
    },
    GunFOV =  {
        ["Enabled"] = false, --// Enables gun fov
        ["Double-Barrel SG"] = {["FOV"] = 31},
        ["Revolver"] = {["FOV"] = 22},
        ["SMG"] = {["FOV"] = 18},
        ["Shotgun"] = { ["FOV"] = 23},
        ["Rifle"] = { ["FOV"] = 12},
        ["TacticalShotgun"] = {["FOV"] = 21},
        ["Silencer"] = {["FOV"] = 20},
        ["AK47"] = { ["FOV"] = 12.5},
        ["AR"] = { ["FOV"] = 12.5},
    },
    InventorySorter = {
        ["Enabled"] = true, -- If you want to use the sorter
        ["Keybind"] = "j", -- Keybind to update your inventory
        ["List"] = {"[Double-Barrel SG]","[Revolver]","[TacticalShotgun]", "[Shotgun]", "[SMG]"}, -- up to 9
    },
    Macro = {
        ["Enabled"] = true, -- If you want to use macro
        ["AntiFling"] = false,
        ["Keybind"] = "q", -- // Keybind to toggle the macro
        ["Mode"] = "FirstPerson", -- // First person or third person
        ["Speed"] = 1.17
    },
    AutoPred = {
        ["Enabled"] = true, -- // If you want to use auto prediction
        ["Interval"] = 0.2, -- // How fast the auto prediction refreshes
        ["Silent"] = {
            ["Enabled"] = true,
            ["P10"] = 0.11,
            ["P20"] = 0.12588,
            ["P30"] = 0.11911,
            ["P40"] = 0.1256,
            ["P50"] = 0.12766,
            ["P60"] = 0.136,
            ["P70"] = 0.12951,
            ["P80"] = 0.13181,
            ["P90"] = 0.13685,
            ["P100"] = 0.13334,
            ["P110"] = 0.14552,
            ["P120"] = 0.1652131,
            ["P130"] = 0.15669,
            ["P140"] = 0.15669,
            ["P150"] = 0.15214,
            ["P160"] = 0.16262,
            ["P170"] = 0.19231,
            ["P180"] = 0.19284,
            ["P190"] = 0.16594,
            ["P200"] = 0.16942
        },
        ["Aimbot"] = {
            ["Enabled"] = false,
            ["P10"] = 0.11,
            ["P20"] = 0.12588,
            ["P30"] = 0.11911,
            ["P40"] = 0.1256,
            ["P50"] = 0.12766,
            ["P60"] = 0.136,
            ["P70"] = 0.12951,
            ["P80"] = 0.13181,
            ["P90"] = 0.13685,
            ["P100"] = 0.13334,
            ["P110"] = 0.14552,
            ["P120"] = 0.1652131,
            ["P130"] = 0.15669,
            ["P140"] = 0.15669,
            ["P150"] = 0.15214,
            ["P160"] = 0.16262,
            ["P170"] = 0.19231,
            ["P180"] = 0.19284,
            ["P190"] = 0.16594,
            ["P200"] = 0.16942
        }
    },
    Emotes = { -- credits to evolution
        ["Greet"] = true, ["GreetKey"] = Enum.KeyCode.G,
        ["Lay"] = true, ["LayKey"] = Enum.KeyCode.T,
        ["Speed"] = false, ["SpeedKey"] = Enum.KeyCode.N,
        ["Sturdy"] = false, ["SturdyKey"] = Enum.KeyCode.H,
        ["Griddy"] = false, ["GriddyKey"] = Enum.KeyCode.G,
    },
    MemorySpoofer = {
        ["MemSpoofer"] = true, -- // If you want to use the memory spoofer
        ["Minimum"] = 500, -- // Minimum memory to spoof
        ["Maximum"] = 800, -- // Maximum memory to spoof
    },
    PingSpoofer = {
        ["PingSpoofer"] = false,
        ["PingTabColor"] = Color3.fromRGB(211, 88, 33),
        ["Minimum"] = 130,
        ["Maximum"] = 180
    },
    Esp = {
        ["Enabled"] = true, -- Loads the ESP
        ["Bounding_Box"] = true, -- Box Base
        ["Fill_Box"] = false, -- If you want to fill the box
        ["Fill_Transparency"] = 0.75, -- Box transparency
        ["Show_Distance"] = false, -- Shows the players distance
        ["Show_Name"] = true, -- Shows the players name
        ["Show_Health"] = true, -- Shows the players health
        ["Health_Type"] = "Bar" -- Text, Both 
    },
    Blink = { 
        ["Enabled"] = true,
        ["BlinkKeybind"] = "N",
        ["BlinkDuration"] = 1,
    },
    Spin = {
        ["Toggle"] = false,
        ["RotationSpeed"] = 2600, -- higher you go the faster the spin. 2500 is good
        ["Keybind"] = Enum.KeyCode.V
    }
}



local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()


if not game:IsLoaded() then
    game.Loaded:Wait()
end
local Players, Client, Mouse, RS, Camera =
    game:GetService("Players"),
    game:GetService("Players").LocalPlayer,
    game:GetService("Players").LocalPlayer:GetMouse(),
    game:GetService("RunService"),
    game.Workspace.CurrentCamera

-----------------------------------------
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local Heartbeat = RunService.Heartbeat
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local Drawingnew = Drawing.new
local Color3fromRGB = Color3.fromRGB
local Vector2new = Vector2.new
local GetGuiInset = GuiService.GetGuiInset
local Randomnew = Random.new
local mathfloor = math.floor
local CharacterAdded = LocalPlayer.CharacterAdded
local CharacterAddedWait = CharacterAdded.Wait
local WorldToViewportPoint = CurrentCamera.WorldToViewportPoint
local RaycastParamsnew = RaycastParams.new
local EnumRaycastFilterTypeBlacklist = Enum.RaycastFilterType.Blacklist
local Raycast = Workspace.Raycast
local GetPlayers = Players.GetPlayers
local Instancenew = Instance.new
local IsDescendantOf = Instancenew("Part").IsDescendantOf
local FindFirstChildWhichIsA = Instancenew("Part").FindFirstChildWhichIsA
local FindFirstChild = Instancenew("Part").FindFirstChild
local tableremove = table.remove
local tableinsert = table.insert
-----------------------------------------

local Circle = Drawing.new("Circle")
Circle.Color = Color3.new(0,255,255)
Circle.Thickness = 1



game.Lighting.GlobalShadows = not KeanW.Main.DisableShadows
if KeanW.Main.MuteBoomBox == true then 
    for i,v in pairs(game.Players:GetChildren()) do 
        if v.Name ~= game.Players.LocalPlayer.Name then 
            if game.Players:FindFirstChild(v.Name) then 
                repeat wait() until v.Character
                for i,x in pairs(v.Character:GetDescendants()) do
                    if x:IsA("Sound") and x.Playing == true then
                        x.Playing = false
                    end
                end
            end
        end
    end
end
local UpdateFOV = function ()
    if (not Circle) then
        return Circle
    end
    Circle.Visible = KeanW.FOV["Visible"]
    Circle.Radius = KeanW.FOV["Radius"] * 3
    Circle.Position = Vector2.new(Mouse.X, Mouse.Y + (game:GetService("GuiService"):GetGuiInset().Y))
    Circle.Color = Circle.Color
    return Circle
end
RS.Heartbeat:Connect(UpdateFOV)

if KeanW.FOV.Color == "red" then
    Circle.Color = Color3.new(255, 0, 0)
elseif KeanW.FOV.Color == "blue" then
    Circle.Color = Color3.new(0, 0, 255)
elseif KeanW.FOV.Color == "green" then
    Circle.Color = Color3.new(0, 255, 0)
elseif KeanW.FOV.Color == "yellow" then
    Circle.Color = Color3.new(255, 255, 0)
elseif KeanW.FOV.Color == "purple" then
    Circle.Color = Color3.new(128, 0, 128)
elseif KeanW.FOV.Color == "orange" then
    Circle.Color = Color3.new(255, 165, 0)
elseif KeanW.FOV.Color == "pink" then
    Circle.Color = Color3.new(255, 192, 203)
elseif KeanW.FOV.Color == "brown" then
    Circle.Color = Color3.new(165, 42, 42)
elseif KeanW.FOV.Color == "black" then
    Circle.Color = Color3.new(0, 0, 0)
elseif KeanW.FOV.Color == "white" then
    Circle.Color = Color3.new(255, 255, 255)
elseif KeanW.FOV.Color == "gray" then
    Circle.Color = Color3.new(128, 128, 128)
elseif KeanW.FOV.Color == "light blue" then
    Circle.Color = Color3.new(173, 216, 230)
elseif KeanW.FOV.Color == "maroon" then
    Circle.Color = Color3.new(128, 0, 0)
elseif KeanW.FOV.Color == "teal" then
    Circle.Color = Color3.new(0, 128, 128)
elseif KeanW.FOV.Color == "lime" then
    Circle.Color = Color3.new(0, 255, 0)
elseif KeanW.FOV.Color == "magenta" then
    Circle.Color = Color3.new(255, 0, 255)
elseif KeanW.FOV.Color == "turquoise" then
    Circle.Color = Color3.new(64, 224, 208)
end

if KeanW.Macro.Enabled then
    if KeanW.Macro.Mode == "ThirdPerson" then
        getgenv().macrokey = KeanW.Macro.Keybind
        getgenv().macrospeed = KeanW.Macro.Speed -- the lower fps u have the higher u put this
        getgenv().macrotype = "normal" -- normal or mouse
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FederalW/scripts/main/macro"))()
    elseif KeanW.Macro.Mode == "FirstPerson" then -- yeah i skidded feds go cry
        getgenv().macrokey = KeanW.Macro.Keybind
        getgenv().macrospeed = KeanW.Macro.Speed -- the lower fps u have the higher u put this
        getgenv().macrotype = "mouse" -- normal or mouse
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FederalW/scripts/main/macro"))()
    end
end


if KeanW.InventorySorter.Enabled == true then 
local services = {
   ["Players"] = game:GetService("Players"),
   ["RunService"] = game:GetService("RunService"),
}

local variables = {
   ["LocalPlayer"] = services["Players"].LocalPlayer,
   ["RenderStepped"] = services["RunService"].RenderStepped,
}

local function get_instance(from,name)
   if from ~= nil and name ~= nil then
       local inst = from:FindFirstChildOfClass(name)
       if not inst then
           inst = from:FindFirstChild(name)
       end
       if inst then
           return inst
       end
   end
end
local function update()
   variables["RenderStepped"]:wait()
   local temp = {}
   for i=1,#variables["LocalPlayer"].Backpack:GetChildren() do
       local tool = get_instance(variables["LocalPlayer"].Backpack,"Tool")
       if tool then
           table.insert(temp,tool)
           tool.Parent = game
       end
   end
   for x=1,#KeanW.InventorySorter.List do
       for i=1,#temp do
           if string.sub(string.lower(tostring(temp[i])),1,string.len(string.lower(KeanW.InventorySorter.List[x]))) == string.lower(KeanW.InventorySorter.List[x]) then
               temp[i].Parent = variables["LocalPlayer"].Backpack
               wait(0.105)
           end
       end
   end
   for i=1,#temp do
       temp[i].Parent = variables["LocalPlayer"].Backpack
       wait(0)
   end
end
Mouse.KeyDown:Connect(function(key)
    if key == KeanW.InventorySorter.Keybind and KeanW.InventorySorter.Enabled then
        update()
    end
end)
end



if KeanW.Main.AutoLowGFX then
    for _,v in pairs(workspace:GetDescendants()) do
    if v.ClassName == "Part"
    or v.ClassName == "SpawnLocation"
    or v.ClassName == "WedgePart"
    or v.ClassName == "Terrain"
    or v.ClassName == "MeshPart" then
    v.Material = "Plastic"
    end
    end
end

function IsPartVisible(Part, PartDescendant)
    -- // Vars
    local Character = LocalPlayer.Character or CharacterAddedWait(CharacterAdded)
    local Origin = CurrentCamera.CFrame.Position
    local _, OnScreen = WorldToViewportPoint(CurrentCamera, Part.Position)

    -- //
    if (OnScreen) then
        -- // Vars
        local raycastParams = RaycastParamsnew()
        raycastParams.FilterType = EnumRaycastFilterTypeBlacklist
        raycastParams.FilterDescendantsInstances = {Character, CurrentCamera}

        -- // Cast ray
        local Result = Raycast(Workspace, Origin, Part.Position - Origin, raycastParams)

        -- // Make sure we get a result
        if (Result) then
            -- // Vars
            local PartHit = Result.Instance
            local Visible = (not PartHit or IsDescendantOf(PartHit, PartDescendant))

            -- // Return
            return Visible
        end
    end

    -- // Return
    return false
end

ClosestPlrFromMouse = function()
    local Target, Closest = nil, 1/0
 
    for _ ,v in pairs(Players:GetPlayers()) do
        if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
            local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
            local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude

            if (Circle.Radius > Distance and Distance < Closest and OnScreen) then
                Closest = Distance
                Target = v
            end
        end
    end

    return Target
end


local WTS = function (Object)
    local ObjectVector = Camera:WorldToScreenPoint(Object.Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

local IsOnScreen = function (Object)
    local IsOnScreen = Camera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end

local FilterObjs = function (Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end

local GetClosestBodyPart = function (character)
    local ClosestDistance = 1/0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _,  x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if (Circle.Radius > Distance and Distance < ClosestDistance) then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end
    return BodyPart
end
if KeanW.Silent.UseKeybind then
    Mouse.KeyDown:Connect(function(key)
        if key == KeanW.Silent.Keybind and KeanW.Silent.Enabled then
            getgenv().KeanW.Silent.Enabled = false
        elseif key == KeanW.Silent.Keybind and not KeanW.Silent.Enabled then
            getgenv().KeanW.Silent.Enabled = true
        end
    end)
end



local Prey

task.spawn(function ()
    while task.wait() do
        if Prey then
            if KeanW.Silent.Enabled and KeanW.Silent.ClosestPart == true then
                KeanW.Silent["Part"] = tostring(GetClosestBodyPart(Prey.Character))
            end
        end
    end
end)

local grmt = getrawmetatable(game)
local backupindex = grmt.__index
setreadonly(grmt, false)

grmt.__index = newcclosure(function(self, v)
    if (KeanW.Silent.Enabled and Mouse and tostring(v) == "Hit") then

        Prey = ClosestPlrFromMouse()

        if Prey then
            local endpoint = game.Players[tostring(Prey)].Character[KeanW.Silent["Part"]].CFrame + (
                game.Players[tostring(Prey)].Character[KeanW.Silent["Part"]].Velocity * KeanW.Silent.Prediction
            )
            return (tostring(v) == "Hit" and endpoint)
        end
    end
    return backupindex(self, v)
end)

if KeanW.Macro.AntiFling then
-- // Constants \\ --
-- [ Services ] --
local Services = setmetatable({}, {__index = function(Self, Index)
    local NewService = game.GetService(game, Index)
    if NewService then
    Self[Index] = NewService
    end
    return NewService
    end})
    
    -- [ LocalPlayer ] --
    local LocalPlayer = Services.Players.LocalPlayer
    
    -- // Functions \\ --
    local function PlayerAdded(Player)
       local Detected = false
       local Character;
       local PrimaryPart;
    
       local function CharacterAdded(NewCharacter)
           Character = NewCharacter
           repeat
               wait()
               PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
           until PrimaryPart
           Detected = false
       end
    
       CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
       Player.CharacterAdded:Connect(CharacterAdded)
       Services.RunService.Heartbeat:Connect(function()
           if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
               if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                   if Detected == false then
                       game.StarterGui:SetCore("ChatMakeSystemMessage", {
                           Text = "Fling Exploit detected, Player: " .. tostring(Player);
                           Color = Color3.fromRGB(255, 200, 0);
                       })
                   end
                   Detected = true
                   for i,v in ipairs(Character:GetDescendants()) do
                       if v:IsA("BasePart") then
                           v.CanCollide = false
                           v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                           v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                           v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                       end
                   end
                   PrimaryPart.CanCollide = false
                   PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                   PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                   PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
               end
           end
       end)
    end

    -- // Event Listeners \\ --
    for i,v in ipairs(Services.Players:GetPlayers()) do
       if v ~= LocalPlayer then
           PlayerAdded(v)
       end
    end
    Services.Players.PlayerAdded:Connect(PlayerAdded)
    
    local LastPosition = nil
    Services.RunService.Heartbeat:Connect(function()
       pcall(function()
           local PrimaryPart = LocalPlayer.Character.PrimaryPart
           if PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CFrame = LastPosition
    
               game.StarterGui:SetCore("ChatMakeSystemMessage", {
                   Text = "You were flung. Neutralizing velocity.";
                   Color = Color3.fromRGB(255, 0, 0);
               })
           elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
               LastPosition = PrimaryPart.CFrame
           end
       end)
    end)
end




if KeanW.Aimbot.Enabled then
getgenv().AimPart = KeanW.Aimbot.Part
getgenv().AimlockKey = KeanW.Aimbot.Keybind
getgenv().AimRadius = 30
getgenv().ThirdPerson = KeanW.Aimbot.ThirdPerson
getgenv().FirstPerson = KeanW.Aimbot.FirstPerson
getgenv().TeamCheck = false
getgenv().PredictMovement = KeanW.Aimbot.UsePrediction
getgenv().PredictionVelocity = KeanW.Aimbot.Prediction
getgenv().Smoothness = KeanW.Aimbot.Smoothness
getgenv().SmoothnessAmount = KeanW.Aimbot.Amount
getgenv().DeathCheck = KeanW.Aimbot.Checks.DeathCheck
getgenv().WallCheck = KeanW.Aimbot.Checks.WallCheck -- Add this line

local Players, Uis, RService, SGui = game:GetService"Players", game:GetService"UserInputService", game:GetService"RunService", game:GetService"StarterGui";
local Client, Mouse, Camera, CF, RNew, Vec3, Vec2 = Players.LocalPlayer, Players.LocalPlayer:GetMouse(), workspace.CurrentCamera, CFrame.new, Ray.new, Vector3.new, Vector2.new;
local Aimlock, MousePressed, CanNotify = true, false, false;
local AimlockTarget;
local OldPre;

getgenv().WorldToViewportPoint = function(P)
    return Camera:WorldToViewportPoint(P)
end

getgenv().WorldToScreenPoint = function(P)
    return Camera.WorldToScreenPoint(Camera, P)
end

getgenv().GetObscuringObjects = function(T)
    if T and T:FindFirstChild(getgenv().AimPart) and Client and Client.Character:FindFirstChild("Head") then 
        local RayPos = workspace:FindPartOnRay(RNew(
            T[getgenv().AimPart].Position, Client.Character.Head.Position)
        )
        if RayPos then return RayPos:IsDescendantOf(T) end
    end
end

getgenv().GetNearestTarget = function()
    local players = {}
    local PLAYER_HOLD = {}
    local DISTANCES = {}
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Client then
            table.insert(players, v)
        end
    end
    for i, v in pairs(players) do
        if v.Character ~= nil then
            local AIM = v.Character:FindFirstChild("Head")
            if getgenv().TeamCheck == true and v.Team ~= Client.Team then
                local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                local HIT, POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                local DIFF = math.floor((POS - AIM.Position).magnitude)
                PLAYER_HOLD[v.Name .. i] = {}
                PLAYER_HOLD[v.Name .. i].dist = DISTANCE
                PLAYER_HOLD[v.Name .. i].plr = v
                PLAYER_HOLD[v.Name .. i].diff = DIFF
                table.insert(DISTANCES, DIFF)
            elseif getgenv().TeamCheck == false and v.Team == Client.Team then 
                local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                local HIT, POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                local DIFF = math.floor((POS - AIM.Position).magnitude)
                PLAYER_HOLD[v.Name .. i] = {}
                PLAYER_HOLD[v.Name .. i].dist = DISTANCE
                PLAYER_HOLD[v.Name .. i].plr = v
                PLAYER_HOLD[v.Name .. i].diff = DIFF
                table.insert(DISTANCES, DIFF)
            end
        end
    end
    
    if unpack(DISTANCES) == nil then
        return nil
    end
    
    local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
    if L_DISTANCE > getgenv().AimRadius then
        return nil
    end
    
    for i, v in pairs(PLAYER_HOLD) do
        if v.diff == L_DISTANCE then
            return v.plr
        end
    end
    return nil
end

-- Add the function to check if the target's health is 2 or under.
getgenv().CheckTargetHealth = function(target)
    if target.Character and target.Character:FindFirstChild("Humanoid") then
        local health = target.Character.Humanoid.Health
        return health <= 2
    end
    return false
end

-- Add the function to check if the target is obstructed by a wall.
getgenv().CheckIfObstructed = function(target)
    if target.Character and target.Character:FindFirstChild(getgenv().AimPart) then
        local aimPart = target.Character[getgenv().AimPart]
        if aimPart then
            local ray = Ray.new(Camera.CFrame.p, (aimPart.Position - Camera.CFrame.p).unit * getgenv().AimRadius)
            local hit, position = workspace:FindPartOnRay(ray, workspace)
            return hit and hit:IsDescendantOf(target.Character)
        end
    end
    return false
end

Mouse.KeyDown:Connect(function(a)
    if not (Uis:GetFocusedTextBox()) then 
        if a == AimlockKey and AimlockTarget == nil then
            pcall(function()
                if MousePressed ~= true then MousePressed = true end 
                local Target;Target = GetNearestTarget()
                if Target ~= nil then 
                    AimlockTarget = Target
                end
            end)
        elseif a == AimlockKey and AimlockTarget ~= nil then
            if AimlockTarget ~= nil then AimlockTarget = nil end
            if MousePressed ~= false then 
                MousePressed = false 
            end
        end
    end
end)



RService.RenderStepped:Connect(function()
    if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then 
        if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 or (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
            CanNotify = true 
        else 
            CanNotify = false 
        end
    elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then 
        if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then 
            CanNotify = true 
        else 
            CanNotify = false 
        end
    elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then 
        if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
            CanNotify = true 
        else 
            CanNotify = false 
        end
    end
    if Aimlock == true and MousePressed == true then 
        if AimlockTarget and AimlockTarget.Character and AimlockTarget.Character:FindFirstChild(getgenv().AimPart) then 
            if getgenv().DeathCheck and CheckTargetHealth(AimlockTarget) then
                AimlockTarget = nil -- Unlock from the target with health 2 or under.
                return
            end
            
            if KeanW.Aimbot.Checks.VisibleCheck then
                if AimlockTarget and not IsPartVisible(AimlockTarget.Character.HumanoidRootPart, Target.Character) then
                    AimlockTarget = nil
                    return
                end
            end
            if KeanW.Silent.Checks.OwnDeathCheck then
                local LocalPlayer = game.Players.LocalPlayer
                local LocalPlayerHealth = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health or 0

                if LocalPlayerHealth < 2 then
                    AimlockTarget = nil
                    return
                end
            end

            
            if getgenv().FirstPerson == true then
                if CanNotify == true then
                    if getgenv().PredictMovement == true then
                        if getgenv().Smoothness == true then
                            local Main = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity*PredictionVelocity)
                            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                        else
                            Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity*PredictionVelocity)
                        end
                    elseif getgenv().PredictMovement == false then 
                        if getgenv().Smoothness == true then
                            local Main = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)
                            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                        else
                            Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)
                        end
                    end
                end
            end
        end
    end
end)
end


local custom_theme = {} --soon

local function CreateInstance(cls,props)
local inst = Instance.new(cls)
for i,v in pairs(props) do
	inst[i] = v
end
return inst
end

if KeanW.Resolver.AntiAimViewer == true then
    print('aav')
    for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= Client and v.Character and v.Character:FindFirstChild("Head") and  v.Character:FindFirstChild("HumanoidRootPart")  then
        local c = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
        local d = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(c.X, c.Y)).Magnitude
    end
end
end

game:GetService("RunService").Heartbeat:Connect(function() 
        if KeanW.AutoPred.Enabled then
            local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            local pingValue = string.split(ping, " ")[1]
            local pingNumber = tonumber(pingValue)
            if KeanW.AutoPred.Silent.Enabled == true then
                if pingNumber > 310 then
                    getgenv().KeanW.Silent.Prediction = 0.16780
                elseif pingNumber > 260 then
                    getgenv().KeanW.Silent.Prediction = 0.1651
                elseif pingNumber > 210 then
                    getgenv().KeanW.Silent.Prediction = 0.16942
                elseif pingNumber > 200 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P200
                elseif pingNumber > 190 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P190
                elseif pingNumber > 180 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P180
                elseif pingNumber > 170 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P170
                elseif pingNumber > 160 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P160
                elseif pingNumber > 150 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P150
                elseif pingNumber > 140 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P140
                elseif pingNumber > 130 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P130
                elseif pingNumber > 120 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P120
                elseif pingNumber > 110 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P110
                elseif pingNumber > 100 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P100
                elseif pingNumber > 90 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P90
                elseif pingNumber > 80 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P80
                elseif pingNumber > 70 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P70
                elseif pingNumber > 60 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P60
                elseif pingNumber > 50 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P50
                elseif pingNumber > 40 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P40
                elseif pingNumber > 30 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P30
                elseif pingNumber > 20 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P20
                elseif pingNumber > 10 then
                    getgenv().KeanW.Silent.Prediction = KeanW.AutoPred.Silent.P10
                end
            end
            if KeanW.AutoPred.Aimbot.Enabled == true then
                if pingNumber > 310 then
                    getgenv().PredictionVelocity = 0.16780
                elseif pingNumber > 260 then
                    getgenv().PredictionVelocity = 0.1651
                elseif pingNumber > 210 then
                    getgenv().PredictionVelocity = 0.16942
                elseif pingNumber > 200 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P200
                elseif pingNumber > 190 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P190
                elseif pingNumber > 180 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P180
                elseif pingNumber > 170 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P170
                elseif pingNumber > 160 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P160
                elseif pingNumber > 150 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P150
                elseif pingNumber > 140 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P140
                elseif pingNumber > 130 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P130
                elseif pingNumber > 120 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P120
                elseif pingNumber > 110 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P110
                elseif pingNumber > 100 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P100
                elseif pingNumber > 90 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P90
                elseif pingNumber > 80 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P80
                elseif pingNumber > 70 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P70
                elseif pingNumber > 60 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P60
                elseif pingNumber > 50 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P50
                elseif pingNumber > 40 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P40
                elseif pingNumber > 30 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P30
                elseif pingNumber > 20 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P20
                elseif pingNumber > 10 then
                    getgenv().PredictionVelocity = KeanW.AutoPred.Aimbot.P10
                end
            end
        end
    end)


-- Define the function to find the target distance
local function find_target_mag()
    if KeanW.Range.Enabled then
    Prey = ClosestPlrFromMouse()
    local preyPlayer = game.Players:FindFirstChild(tostring(Prey))
    local partName = KeanW.Silent["Part"]
    local prediction = KeanW.Silent.Prediction
    if Prey then
        local TargetHealth = Target.Character:FindFirstChild("Humanoid") and Target.Character.Humanoid.Health or 0
        if TargetHealth < 2 then
            return
        end
    end
    if preyPlayer and preyPlayer.Character and preyPlayer.Character:FindFirstChild(partName) then
        local preyPart = preyPlayer.Character[partName]

        if preyPart and preyPart:IsA("BasePart") then
            local preyPosition = preyPart.CFrame.Position + (preyPart.Velocity * prediction)
            local clientPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            local distance = (preyPosition - clientPosition).Magnitude

            -- 'distance' now contains the distance in studs between the client and the calculated point.
        end
    end
    return distance
    end
end

-- Connect the function to the Heartbeat event to run it every frame
local RunService = game:GetService("RunService")

local function manage_range()
    Prey = ClosestPlrFromMouse()
    local preyPlayer = game.Players:FindFirstChild(tostring(Prey))
    local partName = KeanW.Silent["Part"]
    local prediction = KeanW.Silent.Prediction

    if preyPlayer and preyPlayer.Character and preyPlayer.Character:FindFirstChild(partName) then
        local preyPart = preyPlayer.Character[partName]

        if preyPart and preyPart:IsA("BasePart") then
            local preyPosition = preyPart.CFrame.Position + (preyPart.Velocity * prediction)
            local clientPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            local distance = (preyPosition - clientPosition).Magnitude
            if distance < KeanW.Range.CloseDistance then
                if KeanW.Range.FOV.Enabled then
                    getgenv().KeanW.FOV.Radius = KeanW.Range.FOV.Close
                end
                if KeanW.Range.Smoothness.Enabled then
                    getgenv().SmoothnessAmount = KeanW.Range.Smoothness.Close
                end
                if KeanW.Range.Prediction.Enabled then
                    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                    local pingValue = string.split(ping, " ")[1]
                    local pingNumber = tonumber(pingValue)
                    if pingNumber > 140 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P140_200
                    elseif pingNumber > 120 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P120_140
                    elseif pingNumber > 90 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P90_120
                    elseif pingNumber > 80 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P80_90
                    elseif pingNumber > 70 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P70_80
                    elseif pingNumber > 60 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P60_70
                    elseif pingNumber > 50 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P50_60
                    elseif pingNumber > 40 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P40_50
                    elseif pingNumber > 30 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P30_40
                    elseif pingNumber > 20 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P20_30
                    elseif pingNumber > 10 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Close.P10
                    end
                end
            elseif distance < KeanW.Range.MidDistance then
                if KeanW.Range.FOV.Enabled then
                    getgenv().KeanW.FOV.Radius = KeanW.Range.FOV.Mid
                end
                if KeanW.Range.Smoothness.Enabled then
                    getgenv().SmoothnessAmount = KeanW.Range.Smoothness.Mid
                end
                if KeanW.Range.Prediction.Enabled then
                    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                    local pingValue = string.split(ping, " ")[1]
                    local pingNumber = tonumber(pingValue)
                    if pingNumber > 140 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P140_200
                    elseif pingNumber > 120 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P120_140
                    elseif pingNumber > 90 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P90_120
                    elseif pingNumber > 80 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P80_90
                    elseif pingNumber > 70 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P70_80
                    elseif pingNumber > 60 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P60_70
                    elseif pingNumber > 50 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P50_60
                    elseif pingNumber > 40 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P40_50
                    elseif pingNumber > 30 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P30_40
                    elseif pingNumber > 20 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P20_30
                    elseif pingNumber > 10 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Mid.P10
                    end
                end
            elseif distance < KeanW.Range.FarDistance then
                if KeanW.Range.FOV.Enabled then
                    getgenv().KeanW.FOV.Radius = KeanW.Range.FOV.Far
                end
                if KeanW.Range.Smoothness.Enabled then
                    getgenv().SmoothnessAmount = KeanW.Range.Smoothness.Far
                end
                if KeanW.Range.Prediction.Enabled then
                    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                    local pingValue = string.split(ping, " ")[1]
                    local pingNumber = tonumber(pingValue)
                    if pingNumber > 140 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P140_200
                    elseif pingNumber > 120 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P120_140
                    if pingNumber > 90 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P90_120
                    elseif pingNumber > 80 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P80_90
                    elseif pingNumber > 70 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P70_80
                    elseif pingNumber > 60 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P60_70
                    elseif pingNumber > 50 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P50_60
                    elseif pingNumber > 40 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P40_50
                    elseif pingNumber > 30 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P30_40
                    elseif pingNumber > 20 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P20_30
                    elseif pingNumber > 10 then
                        getgenv().KeanW.Silent.Prediction = KeanW.Range.Prediction.Far.P10_20
                    end
                end
            else
                getgenv().KeanW.Silent.Prediction = getgenv().KeanW.Range.Prediction.Far
                getgenv().KeanW.FOV.Radius = getgenv().KeanW.Range.Smoothness.Far
                getgenv().SmoothnessAmount = getgenv().KeanW.Range.Smoothness.Far
            end
        end
    end
end
end

RunService.Heartbeat:Connect(manage_range) 

local AnimationIds = {
    Lay = "rbxassetid://3152378852",
    Greet = "rbxassetid://3189777795",
    Sturdy = "rbxassetid://11710529975",
    Griddy = "rbxassetid://11710529975",
    Speed = "rbxassetid://11710541744",
}


local Script = {Functions = {}}
    Script.Functions.getToolName = function(name)
        local split = string.split(string.split(name, "[")[2], "]")[1]
        return split
    end
    Script.Functions.getEquippedWeaponName = function()
        if (Client.Character) and Client.Character:FindFirstChildWhichIsA("Tool") then
           local Tool =  Client.Character:FindFirstChildWhichIsA("Tool")
           if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then
              return Script.Functions.getToolName(Tool.Name)
           end
        end
        return nil
    end
    RS.RenderStepped:Connect(function()
    if Script.Functions.getEquippedWeaponName() ~= nil then
        local WeaponSettings = getgenv().KeanW.GunFOV[Script.Functions.getEquippedWeaponName()]
        if WeaponSettings ~= nil and getgenv().KeanW.GunFOV.Enabled == true then
            getgenv().KeanW.FOV.Radius = WeaponSettings.FOV
        else
            getgenv().KeanW.FOV.Radius = getgenv().KeanW.FOV.Radius
        end
    end
end)



game:GetService("UserInputService").InputBegan:Connect(function(key, gp)
    if not gp then 
        if key.KeyCode == KeanW.Emotes.LayKey then 
            if KeanW.Emotes.Lay then 
                local Lay = Instance.new("Animation")
                Lay.AnimationId = AnimationIds.Lay
                local LayTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Lay)
                LayTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    LayTrack:Stop()
                end)
            end
        end
        if key.KeyCode == KeanW.Emotes.GreetKey then
            if KeanW.Emotes.Greet then 
                local Greet = Instance.new("Animation")
                Greet.AnimationId = AnimationIds.Greet
                local GreetTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Greet)
                GreetTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    GreetTrack:Stop()
                end)
            end
        end
        if key.KeyCode == KeanW.Emotes.SpeedKey then
            if KeanW.Emotes.Speed then 
                local Speed = Instance.new("Animation")
                Speed.AnimationId = AnimationIds.Speed
                local SppedTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Speed)
                SpeedTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    SpeedTrack:Stop()
                end)
            end
        end
        if key.KeyCode == KeanW.Emotes.SturdyKey then
            if KeanW.Emotes.Sturdy then 
                local Sturdy = Instance.new("Animation")
                Sturdy.AnimationId = AnimationIds.Sturdy
                local SturdyTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Sturdy)
                SturdyTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    SturdyTrack:Stop()
                end)
            end
        end
        if key.KeyCode == KeanW.Emotes.GriddyKey then
            if KeanW.Emotes.Griddy then 
                local Griddy = Instance.new("Animation")
                Griddy.AnimationId = AnimationIds.Griddy
                local GriddyTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Griddy)
                GriddyTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    GriddyTrack:Stop()
                end)
            end
        end
    end
end)






if KeanW.Main.FindBestServer then
    HTTPService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local StatsService = game:GetService("Stats")

    local function fetchServersData(placeId, limit)
        local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", placeId, limit)
        local success, response = pcall(function()
            return HTTPService:JSONDecode(game:HttpGet(url))
        end)

        if success and response and response.data then
            return response.data
        end

        return nil
    end

    local placeId = game.PlaceId
    local serverLimit = 100
    local servers = fetchServersData(placeId, serverLimit)

    if not servers then
        return
    end

    local lowestPingServer = servers[1]

    for _, server in pairs(servers) do
        if server["ping"] < lowestPingServer["ping"] and server.maxPlayers > server.playing then
            lowestPingServer = server
        end
    end

    local commonLoadTime = 5
    task.wait(commonLoadTime)

    local pingThreshold = 100
    local serverStats = StatsService.Network.ServerStatsItem
    local dataPing = serverStats["Data Ping"]:GetValueString()
    local pingValue = tonumber(dataPing:match("(%d+)"))

    if pingValue >= pingThreshold then
        TeleportService:TeleportToPlaceInstance(placeId, lowestPingServer.id)
    else
        -- Good ping
    end
end


if KeanW.MemorySpoofer.MemSpoofer then
    local Settings = {
        range1 = KeanW.MemorySpoofer.Minimum,
        range2 = KeanW.MemorySpoofer.Maximum,
        
    }

    for __, v in pairs(game.CoreGui.RobloxGui.PerformanceStats:GetChildren()) do
        if v.Name == "PS_Button" and v.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
            Memory = v.StatsMiniTextPanelClass.ValueLabel
        end
    end

    Memory:GetPropertyChangedSignal("Text"):Connect(function()
        local Random = math.random(Settings.range1,Settings.range2)
        Random = Random * 1.23 
        Memory.Text = "".. Random .." MB"
    end)
end

Mouse.KeyDown:Connect(function(Key)
    if Key == (string.lower(KeanW.Blink.BlinkKeybind))then
        if KeanW.Blink.Enabled then
            settings():GetService("NetworkSettings").IncomingReplicationLag = 99999
            print('blinking...')
            wait(KeanW.Blink.BlinkDuration)
            settings():GetService("NetworkSettings").IncomingReplicationLag = 0
        end
    end
end)


-- Spin on bind made by prime >_<
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local Toggle = getgenv().KeanW.Spin.Toggle
local RotationSpeed = getgenv().KeanW.Spin.RotationSpeed
local Keybind = getgenv().KeanW.Spin.Keybind

local function OnKeyPress(Input, GameProcessedEvent)
    if Input.KeyCode == Keybind and not GameProcessedEvent then 
        Toggle = not Toggle
    end
end

UserInputService.InputBegan:Connect(OnKeyPress)

local LastRenderTime = 0
local FullCircleRotation = 2 * math.pi
local TotalRotation = 0

local function RotateCamera()
    if Toggle then
        local CurrentTime = tick()
        local TimeDelta = math.min(CurrentTime - LastRenderTime, 0.01)
        LastRenderTime = CurrentTime

        local Rotation = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(RotationSpeed * TimeDelta))
        Camera.CFrame = Camera.CFrame * Rotation

        TotalRotation = TotalRotation + math.rad(RotationSpeed * TimeDelta)
        if TotalRotation >= FullCircleRotation then
            Toggle = false
            TotalRotation = 0
        end
    end
end

RunService.RenderStepped:Connect(RotateCamera)


local localplayer = game:GetService"Players".LocalPlayer
local uis = game:GetService"UserInputService"

local cheats = {
	b_b = KeanW.Esp.Bounding_Box;
	b_f = KeanW.Esp.Fill_Box;
	b_f_t = KeanW.Esp.Fill_Transparency;
	b_sd = KeanW.Esp.Show_Distance;
	b_sn = KeanW.Esp.Show_Name;
	b_sh = KeanW.Esp.Show_Health;
	b_ht = KeanW.Esp.Health_Type;
	b_rt = true;
	b_tc = true;
}







--------------------------------------------------------
--------------------------------------------------------
--------------------------------------------------------
--------------------------------------------------------









if KeanW.Main.Gui then
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/k4alt/gray/main/Library.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/k4alt/gray/main/theme.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/k4alt/gray/main/save.lua'))()

local Window = Library:CreateWindow({
    Title = 'KeanW ; 1.0.2',
    Center = true, 
    AutoShow = true,
})

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    ['Aiming'] = Window:AddTab("Aiming"), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local AimingLeftBox = Tabs.Aiming:AddLeftGroupbox('Silent')

AimingLeftBox:AddToggle('SilentToggle', {
    Text = 'Silent Aim',
    Default = KeanW.Silent.Enabled, -- Default value (true / false)
    Tooltip = 'Enables/Disables Silent Aim', -- Information shown when you hover over the toggle
})

Toggles.SilentToggle:OnChanged(function()
    getgenv().KeanW.Silent.Enabled = Toggles.SilentToggle.Value
end)

AimingLeftBox:AddInput('SilentKeybindText', {
    Default = KeanW.Silent.Keybind,
    Numeric = false, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Keybind',
    Tooltip = 'Sets the Silent Aims Keybind Toggle', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.SilentKeybindText:OnChanged(function()
    getgenv().KeanW.Silent.Keybind = Options.SilentKeybindText.Value
end)

AimingLeftBox:AddToggle('UseKeybindToggle', {
    Text = 'UseKeybind',
    Default = KeanW.Silent.UseKeybind, -- Default value (true / false)
    Tooltip = 'Enables/Disables Use Keybind', -- Information shown when you hover over the toggle
})

Toggles.UseKeybindToggle:OnChanged(function()
    getgenv().KeanW.Silent.UseKeybind = Toggles.UseKeybindToggle.Value
end)

AimingLeftBox:AddDropdown('PartDrop', {
    Values = { 'HumanoidRootPart', 'UpperTorso', 'LowerTorso', 'Head' },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Part',
    Tooltip = 'Sets the silents part', -- Information shown when you hover over the textbox
})

Options.PartDrop:OnChanged(function()
    getgenv().KeanW.Silent.Part = Options.PartDrop.Value
end)

AimingLeftBox:AddToggle('ClosestPartToggle', {
    Text = 'ClosestPart',
    Default = KeanW.Silent.ClosestPart, -- Default value (true / false)
    Tooltip = 'Enables/Disables Use Keybind', -- Information shown when you hover over the toggle
})

Toggles.ClosestPartToggle:OnChanged(function()
    getgenv().KeanW.Silent.ClosestPart = Toggles.ClosestPartToggle.Value
end)

AimingLeftBox:AddInput('PredText', {
    Default = KeanW.Silent.Prediction,
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Sets the Silent Aim prediction', -- Information shown when you hover over the textbox

    Placeholder = 'Prediction', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.PredText:OnChanged(function()
    getgenv().KeanW.Silent.Prediction = Options.PredText.Value
end)

AimingLeftBox:AddToggle('AutoPredToggle', {
    Text = 'AutoPred',
    Default = KeanW.AutoPred.Enabled, -- Default value (true / false)
    Tooltip = 'Enables/Disables Use Keybind', -- Information shown when you hover over the toggle
})

Toggles.AutoPredToggle:OnChanged(function()
    getgenv().KeanW.AutoPred.Enabled = Toggles.AutoPredToggle.Value
end)

AimingLeftBox:AddToggle('RangePredToggle', {
    Text = 'RangePred',
    Default = KeanW.Range.Prediction.Enabled, -- Default value (true / false)
    Tooltip = 'Enable/Disables RangePred', -- Information shown when you hover over the toggle
})

Toggles.RangePredToggle:OnChanged(function()
    getgenv().KeanW.Range.Prediction.Enabled = Toggles.RangePredToggle.Value
end)




AimingLeftBox:AddDivider()


AimingLeftBox:AddSlider('FOVSlid', {
    Text = 'Radius',

    Default = KeanW.FOV.Radius,
    Min = 5,
    Max = 80,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})

AimingLeftBox:AddToggle('VisibleTog', {
    Text = 'Visible',
    Default = KeanW.FOV.Visible, -- Default value (true / false)
    Tooltip = 'Enable/Disables Visible FOV', -- Information shown when you hover over the toggle
})

Toggles.VisibleTog:OnChanged(function()
    getgenv().KeanW.FOV.Visible = Toggles.VisibleTog.Value
end)

Options.FOVSlid:OnChanged(function()
    getgenv().KeanW.FOV.Radius = Options.FOVSlid.Value
end)

AimingLeftBox:AddToggle('GunFOVToggle', {
    Text = 'GunFOV',
    Default = KeanW.GunFOV.Enabled, -- Default value (true / false)
    Tooltip = 'Enable/Disables GunFOV', -- Information shown when you hover over the toggle
})

Toggles.GunFOVToggle:OnChanged(function()
    getgenv().KeanW.GunFOV.Enabled = Toggles.GunFOVToggle.Value
end)

AimingLeftBox:AddToggle('RangeFOVToggle', {
    Text = 'RangeFOV',
    Default = KeanW.Range.FOV.Enabled, -- Default value (true / false)
    Tooltip = 'Enable/Disables RangeFOV', -- Information shown when you hover over the toggle
})

Toggles.RangeFOVToggle:OnChanged(function()
    getgenv().KeanW.Range.FOV.Enabled = Toggles.RangeFOVToggle.Value
end)

AimingLeftBox:AddLabel('Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0), -- Bright green
    Title = 'Color', -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ColorPicker:OnChanged(function()
    Circle.Color = Options.ColorPicker.Value
end)

Options.ColorPicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

AimingLeftBox:AddDivider()

AimingLeftBox:AddToggle('DeathTog', {
    Text = 'Death Check',
    Default = KeanW.Silent.Checks.DeathCheck, -- Default value (true / false)
    Tooltip = 'Enable/Disables Death Check', -- Information shown when you hover over the toggle
})

Toggles.DeathTog:OnChanged(function()
    getgenv().KeanW.Silent.Checks.DeathCheck = Toggles.DeathTog.Value
end)

AimingLeftBox:AddToggle('VisTog', {
    Text = 'VisibleCheck',
    Default = KeanW.Silent.Checks.VisibleCheck, -- Default value (true / false)
    Tooltip = 'Enable/Disables Death Check', -- Information shown when you hover over the toggle
})

Toggles.VisTog:OnChanged(function()
    getgenv().KeanW.Silent.Checks.VisibleCheck = Toggles.VisTog.Value
end)

local RightGroupBox = Tabs.Aiming:AddRightGroupbox('Aimbot')

RightGroupBox:AddInput('MyTextboxKey', {
    Default = KeanW.Aimbot.Keybind,
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Keybind',
    Tooltip = 'Sets the Keybind', -- Information shown when you hover over the textbox

    Placeholder = 'Toggle Key', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextboxKey:OnChanged(function()
    getgenv().AimlockKey = Options.MyTextboxKey.Value
end)

RightGroupBox:AddDropdown('MyDropdown2', {
    Values = { 'HumanoidRootPart', 'UpperTorso', 'LowerTorso', 'Head'},
    Default = 2, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Part',
    Tooltip = 'What part to aim at (non closest part)', -- Information shown when you hover over the textbox
})

Options.MyDropdown2:OnChanged(function()
    key21 = Options.MyDropdown2.Value
end)

RightGroupBox:AddInput('MyTextboxPred', {
    Default = KeanW.Aimbot.Prediction,
    Numeric = true, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Sets the Prediction', -- Information shown when you hover over the textbox

    Placeholder = 'Prediction Amount', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextboxPred:OnChanged(function()
    getgenv().PredictionVelocity = Options.MyTextboxPred.Value
end)


RightGroupBox:AddToggle('MyToggleSmooth', {
    Text = 'Smoothness',
    Default = KeanW.Aimbot.Smoothness, -- Default value (true / false)
    Tooltip = 'Smoothness (makes you look more legit)', -- Information shown when you hover over the toggle
})

RightGroupBox:AddSlider('MySliderAM', {
    Text = 'Smoothness: ',

    Default = 0.05,
    Min = 0.01,
    Max = 1,
    Rounding = 2,

    Compact = false, -- If set to true, then it will hide the label
})

-- Options is a table added to getgenv() by the library

Options.MySliderAM:OnChanged(function()
    getgenv().SmoothnessAmount = Options.MySliderAM.Value
end)

RightGroupBox:AddToggle('MyToggleGG', {
    Text = 'Range-Smoothness',
    Default = KeanW.Range.Smoothness.Enabled, -- Default value (true / false)
    Tooltip = 'Smoothness based on range', -- Information shown when you hover over the toggle
})

Toggles.MyToggleGG:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().KeanW.Range.Smoothness.Enabled = Toggles.MyToggleGG.Value
end)



local RightGroupBox = Tabs.Aiming:AddRightGroupbox('Checks')

RightGroupBox:AddToggle('MyToggleFP', {
    Text = 'First-Person',
    Default = true, -- Default value (true / false)
    Tooltip = 'Traces in first person', -- Information shown when you hover over the toggle
})

Toggles.MyToggleFP:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().FirstPerson = Toggles.MyToggleFP.Value
end)
RightGroupBox:AddToggle('MyToggleTP', {
    Text = 'Third-Person',
    Default = true, -- Default value (true / false)
    Tooltip = 'Traces in third person', -- Information shown when you hover over the toggle
})

Toggles.MyToggleTP:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().ThirdPerson = Toggles.MyToggleTP.Value
end)

RightGroupBox:AddLabel('')

RightGroupBox:AddToggle('MyToggleWA', {
    Text = 'Death Check',
    Default = true, -- Default value (true / false)
    Tooltip = 'Unlocks on player death', -- Information shown when you hover over the toggle
})

Toggles.MyToggleWA:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().DeathCheck = Toggles.MyToggleWA.Value
end)

RightGroupBox:AddToggle('MyToggleYE', {
    Text = 'Wall Check',
    Default = true, -- Default value (true / false)
    Tooltip = 'Unlocks if player is behind wall.', -- Information shown when you hover over the toggle
})

RightGroupBox:AddToggle('MyToggleEE', {
    Text = 'Own-Death Check',
    Default = true, -- Default value (true / false)
    Tooltip = 'Unlocks on your death', -- Information shown when you hover over the toggle
})

Toggles.MyToggleEE:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().KeanW.Aimbot.OwnDeathCheck = Toggles.MyToggleEE.Value
end)




task.spawn(function()
    while true do
        wait(1)

        -- example for checking if a keybind is being pressed
        local state = Options.KeyPicker:GetState()
        if state then
            print('KeyPicker is being held down')
        end

        if Library.Unloaded then break end
    end
end)



-- Library functions
-- Sets the watermark visibility
Library:SetWatermarkVisibility(KeanW.Main.GuiInfo)

game:GetService("RunService").Heartbeat:Connect(function() 
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local pingValue = string.split(ping, " ")[1]
        local pingNumber = tonumber(pingValue)
        Library:SetWatermark('Prediction: ' .. KeanW.Silent.Prediction .. '  Ping: ' .. pingNumber)
    end)

Library.KeybindFrame.Visible = false; -- todo: add a function for this

Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end) 
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'M', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings']) 

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])
end
-- You can use the SaveManager:LoadAutoloadConfig() to load a config 
-- which has been marked to be one that auto loads!

local cheatsf = Instance.new("Folder", game.CoreGui) cheatsf.Name = "cheats"
local espf = Instance.new("Folder", cheatsf) espf.Name = "esp"
if KeanW.Esp.Enabled then
    function addEsp(player)
        local bbg = Instance.new("BillboardGui", espf)
        bbg.Name = player.Name
        bbg.AlwaysOnTop = true
        bbg.Size = UDim2.new(4,0,5.4,0)
        bbg.ClipsDescendants = false
        
        local outlines = Instance.new("Frame", bbg)
        outlines.Size = UDim2.new(1,0,1,0)
        outlines.BorderSizePixel = 0
        outlines.BackgroundTransparency = 1
        local left = Instance.new("Frame", outlines)
        left.BorderSizePixel = 0
        left.Size = UDim2.new(0,1,1,0)
        local right = left:Clone()
        right.Parent = outlines
        right.Size = UDim2.new(0,-1,1,0)
        right.Position = UDim2.new(1,0,0,0)
        local up = left:Clone()
        up.Parent = outlines
        up.Size = UDim2.new(1,0,0,1)
        local down = left:Clone()
        down.Parent = outlines
        down.Size = UDim2.new(1,0,0,-1)
        down.Position = UDim2.new(0,0,1,0)
        
        local info = Instance.new("BillboardGui", bbg)
        info.Name = "info"
        info.Size = UDim2.new(3,0,0,54)
        info.StudsOffset = Vector3.new(3.6,-3,0)
        info.AlwaysOnTop = true
        info.ClipsDescendants = false
        local namelabel = Instance.new("TextLabel", info)
        namelabel.Name = "namelabel"
        namelabel.BackgroundTransparency = 1
        namelabel.TextStrokeTransparency = 0
        namelabel.TextXAlignment = Enum.TextXAlignment.Left
        namelabel.Size = UDim2.new(0,100,0,18)
        namelabel.Position = UDim2.new(0,0,0,0)
        namelabel.Text = player.Name
        local distancel = Instance.new("TextLabel", info)
        distancel.Name = "distancelabel"
        distancel.BackgroundTransparency = 1
        distancel.TextStrokeTransparency = 0
        distancel.TextXAlignment = Enum.TextXAlignment.Left
        distancel.Size = UDim2.new(0,100,0,18)
        distancel.Position = UDim2.new(0,0,0,18)
        local healthl = Instance.new("TextLabel", info)
        healthl.Name = "healthlabel"
        healthl.BackgroundTransparency = 1
        healthl.TextStrokeTransparency = 0
        healthl.TextXAlignment = Enum.TextXAlignment.Left
        healthl.Size = UDim2.new(0,100,0,18)
        healthl.Position = UDim2.new(0,0,0,36)
        
        local uill = Instance.new("UIListLayout", info)
        
        local forhealth = Instance.new("BillboardGui", bbg)
        forhealth.Name = "forhealth"
        forhealth.Size = UDim2.new(5,0,6,0)
        forhealth.AlwaysOnTop = true
        forhealth.ClipsDescendants = false
        
        local healthbar = Instance.new("Frame", forhealth)
        healthbar.Name = "healthbar"
        healthbar.BackgroundColor3 = Color3.fromRGB(40,40,40)
        healthbar.BorderColor3 = Color3.fromRGB(0,0,0)
        healthbar.Size = UDim2.new(0.04,0,0.9,0)
        healthbar.Position = UDim2.new(0,0,0.05,0)
        local bar = Instance.new("Frame", healthbar)
        bar.Name = "bar"
        bar.BorderSizePixel = 0
        bar.BackgroundColor3 = Color3.fromRGB(94,255,69)
        bar.AnchorPoint = Vector2.new(0,1)
        bar.Position = UDim2.new(0,0,1,0)
        bar.Size = UDim2.new(1,0,1,0)
        
        local co = coroutine.create(function()
            while wait(0.1) do
                if (player.Character and player.Character:FindFirstChild"HumanoidRootPart") then
                    bbg.Adornee = player.Character.HumanoidRootPart
                    info.Adornee = player.Character.HumanoidRootPart
                    forhealth.Adornee = player.Character.HumanoidRootPart
                    
                    if (player.Team ~= localplayer.Team) then
                        bbg.Enabled = true
                        info.Enabled = true
                        forhealth.Enabled = true
                    end
                    if player.Character:FindFirstChild("ForceField") then
                        outlines.BackgroundTransparency = 0.4
                        left.BackgroundTransparency = 0.4
                        right.BackgroundTransparency = 0.4
                        up.BackgroundTransparency = 0.4
                        down.BackgroundTransparency = 0.4
                        healthl.TextTransparency = 0.4
                        healthl.TextStrokeTransparency = 0.8
                        distancel.TextTransparency = 0.4
                        distancel.TextStrokeTransparency = 0.8
                        namelabel.TextTransparency = 0.4
                        namelabel.TextStrokeTransparency = 0.8
                        bar.BackgroundTransparency = 0.4
                        healthbar.BackgroundTransparency = 0.8
                    else
                        outlines.BackgroundTransparency = 0
                        left.BackgroundTransparency = 0
                        right.BackgroundTransparency = 0
                        up.BackgroundTransparency = 0
                        down.BackgroundTransparency = 0
                        healthl.TextTransparency = 0
                        healthl.TextStrokeTransparency = 0
                        distancel.TextTransparency = 0
                        distancel.TextStrokeTransparency = 0
                        namelabel.TextTransparency = 0
                        namelabel.TextStrokeTransparency = 0
                        bar.BackgroundTransparency = 0
                        healthbar.BackgroundTransparency = 0
                    end
                    if cheats.b_b == true then
                        outlines.Visible = true
                    else
                        outlines.Visible = false
                    end
                    if cheats.b_f == true then
                        if player.Character:FindFirstChild("ForceField") then
                            outlines.BackgroundTransparency = 0.9
                        else
                            outlines.BackgroundTransparency = cheats.b_f_t
                        end
                    else
                        outlines.BackgroundTransparency = 1
                    end
                    if cheats.b_sh == true then
                        if (player.Character:FindFirstChild"Humanoid") then
                            healthl.Text = "Health: "..math.floor(player.Character:FindFirstChild"Humanoid".Health)
                            healthbar.bar.Size = UDim2.new(1,0,player.Character:FindFirstChild"Humanoid".Health/player.Character:FindFirstChild"Humanoid".MaxHealth,0)
                        end
                        if cheats.b_ht == "Text" then
                            healthbar.Visible = false
                            healthl.Visible = true
                        end
                        if cheats.b_ht == "Bar" then
                            healthl.Visible = false
                            healthbar.Visible = true
                        end
                        if cheats.b_ht == "Both" then
                            healthl.Visible = true
                            healthbar.Visible = true
                        end
                    else
                        healthl.Visible = false
                        healthbar.Visible = false
                    end
                    if cheats.b_sn then
                        namelabel.Visible = true
                    else
                        namelabel.Visible = false
                    end
                    if cheats.b_sd == true then
                        distancel.Visible = true
                        if (localplayer.Character and localplayer.Character:FindFirstChild"HumanoidRootPart") then
                            distancel.Text = "Distance: "..math.floor(0.5+(localplayer.Character:FindFirstChild"HumanoidRootPart".Position - player.Character:FindFirstChild"HumanoidRootPart".Position).magnitude)
                        end
                    else
                        distancel.Visible = false
                    end
                    if cheats.b_rt == true then
                        if (player.Team == localplayer.Team) then
                            bbg.Enabled = true
                            info.Enabled = true
                            forhealth.Enabled = true
                        end
                    else
                        if (player.Team == localplayer.Team) then
                            bbg.Enabled = false
                            info.Enabled = false
                            forhealth.Enabled = false
                        end
                    end
                    if cheats.b_tc == true then
                        outlines.BackgroundColor3 = player.TeamColor.Color
                        left.BackgroundColor3 = player.TeamColor.Color
                        right.BackgroundColor3 = player.TeamColor.Color
                        up.BackgroundColor3 = player.TeamColor.Color
                        down.BackgroundColor3 = player.TeamColor.Color
                        healthl.TextColor3 = player.TeamColor.Color
                        distancel.TextColor3 = player.TeamColor.Color
                        namelabel.TextColor3 = player.TeamColor.Color
                    else
                        if (player.Team == localplayer.Team) then
                            outlines.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            left.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            right.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            up.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            down.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            healthl.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            distancel.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            namelabel.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                        else
                            outlines.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            left.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            right.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            up.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            down.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            healthl.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            distancel.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            namelabel.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                        end
                    end
                end
                if not (game:GetService"Players":FindFirstChild(player.Name)) then
                    print(player.Name.." has left. Clearing esp.")
                    espf:FindFirstChild(player.Name):Destroy()
                    coroutine.yield()
                end
            end
        end)
        coroutine.resume(co)
    end

    --main
    do
        wait(2)
        --initial player addition
        for _,v in pairs(game:GetService("Players"):GetChildren()) do
            if not (v.Name == localplayer.Name) then
                if not (espf:FindFirstChild(v.Name)) then
                    addEsp(v)
                end
            end
        end
        
        --auto-update
        while wait(10) do
            for _,v in pairs(game:GetService("Players"):GetChildren()) do
                if not (v.Name == localplayer.Name) then
                    if not (espf:FindFirstChild(v.Name)) then
                        addEsp(v)
                    end
                end
            end
        end
    end
end

