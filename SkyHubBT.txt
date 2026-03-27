if syn and syn.cache_replace and syn.cache_invalidate and syn.is_cached and syn.write_clipboard and syn.set_thread_identity then
--[[games it supports Da Hood, Arsenal, Tower of Hell, KAT!, Fencing,
Work At A Pizza Place, VR Hands, Adopt Me, Jailbreak, Prison Life, and
Build A Boat For Treasure, and Gorrila Tag Professional.
12+ games
Rebuilt On IllusionHub
Last Updated 2/18/2022
]]--
local OptTheme = "BloodTheme"
local string = "https://discord.gg/A6HQQXvwNs"
local string2 = "https://discord.com/invite/jVf7eSrED9"
-- Da Hood
if game.PlaceId == 2788229376 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
   local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

MainSection:NewButton("RayCodeX", "Launches RayCodeX script", function()
   loadstring(game:GetObjects("rbxassetid://5812737894")[1].Source)()
end)


MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

   local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
--Arsenal
elseif game.PlaceId == 286090429 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)


MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("Impluse hub", "idk", function()
loadstring(game:HttpGet('http://impulse-hub.xyz/ImpulseHub',true))()
 end)

MainSection:NewButton("Zyrex-Hub", "10+", function()
   _G.Toggle_GUI = Enum.KeyCode.RightControl --Right Ctrl

loadstring(game:HttpGet(("https://raw.githubusercontent.com/NotZyrex/Zyrex-Hub/master/Main.lua"), true))();
end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Arsenal RAC Ban Menu", "Shows in chat also I have no idea what this does", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/qtDZm7LX"))()
end)

MainSection:NewButton("MonkeThing", "idk", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/MonkeHub/main/arsenal.lua"))()
end)

MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

MainSection:NewButton("Arsenal FE audio + more!", "NOTE: you can get banned from some of these scripts", function()
 value = "2038227137" --song id here


    local args = {
        [1] = {
            [1] = "UpdateID",
            [2] =  value,
        },
    }
    
    game:GetService("ReplicatedStorage").Events.UpdateLoadout:FireServer(unpack(args))

local args = {
    [1] = true,
    [2] = game:GetService("ReplicatedStorage").Taunts.Megaphone,
}

game:GetService("ReplicatedStorage").Events.ReplicateGear:FireServer(unpack(args))




Players = game:GetService("Players")
for i, player in pairs(Players:GetPlayers()) do
    print("["..i.."] = "..player.Name)
    local args = {
    [1] = "GET NOOB",
    "["..i.."] = "..player.Name,
}
end
  end)
-- Tower Of Hell
elseif game.PlaceId == 1962086868 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Tower of hell script", "just a gui", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/JayZone69/Tower-of-Hell/main/Script"))()
end)

MainSection:NewButton("Tower of hell script2", "idka", function()
   loadstring(game:HttpGet("https://gist.githubusercontent.com/BloxiYT/26f5c60eaed40ab1ab4e1756a70eac69/raw/b386cfd481e316f72103a0e88c0316be7891f3fb/OMG%2520123456"))()
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- KAT!
elseif game.PlaceId == 621129760 then 
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)


MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("KAT!", "auto throws knife", function()
   --Subscribe to Ducky Exploits
function nearestPlayerToRay()
    local dist = math.huge
    local ray
    
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Head") and not v.Character:FindFirstChild("ForceField") then
            if v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") then -- needed..
                local newVec = (v.Character.Head.Position - game.Players.LocalPlayer.Character.Head.Position)
                if newVec.magnitude < dist then
                    local toRay = Ray.new(game.Players.LocalPlayer.Character.Head.Position, newVec)
                    if not workspace:FindPartOnRayWithIgnoreList(toRay, {game.Players.LocalPlayer.Character, v.Character, workspace.WorldIgnore, workspace.CurrentCamera}) then
                        dist = newVec.magnitude
                        ray = toRay
                    end
                end
            end
        end
    end
    return ray
end

local ray

function init()
    local knife = game.Players.LocalPlayer.Character:WaitForChild("Knife")
    local scr = getsenv(knife.KnifeServer.KnifeClient)
    if scr then
        local ir = scr.inputReleased
        local u7 = debug.getupvalue(ir, 2)
        local cam = debug.getupvalue(ir, 5)
        debug.setupvalue(ir, 5, setmetatable({}, {
            __index = function(t,k)
                if k == "ScreenPointToRay" then
                    if ray ~= nil then
                        return function() return ray end
                    end
                end
                return cam[k]
            end
        }))
    
        
        while wait(.1) do
            if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                break    
            end
            ray = nearestPlayerToRay()
            if ray then
                scr.inputDown()
                u7.ChargeStart = -math.huge
                ir()
            end
        end
    end
end

init()
game.Players.LocalPlayer.CharacterAdded:connect(function()
    print("hi")
    wait()
    init()
   end)
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)


local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
 -- Fencing
 elseif game.PlaceId == 12109643 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
 local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

   MainSection:NewButton("FE Brick Spam", "spams bricks", function()
   -- https://www.roblox.com/games/12109643/Fencing

game:GetService('RunService').Stepped:connect(function()
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v.Name == "Spray" then
if v.Handle.Mesh then
v.Handle.Mesh:Destroy()
end
v.Parent = workspace
end
end
end)
local function paint()
for i,v in pairs(game.Workspace:GetChildren())do
if v.Name == "Handle" then
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
v.Transparency = 1
v.CanCollide = false
wait()
v.CFrame = game.Players.LocalPlayer.Character["Left Leg"].CFrame
end
end
end
local function equip()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do
if v.Name == "Spray" then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
end
end
end
while wait(0.05) do
paint()
equip()
end
end)

MainSection:NewButton("FE Gain Double Health", "bruh", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(56,3.5,124.5)
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-130,3.5,30)
end)

MainSection:NewButton("FE Give SprayPaint", "SprayPaint", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-130,3.5,30)
end)

MainSection:NewButton("FE Perm God Mode", "permeanent God mode", function()
   button              = workspace.Button
button.CanCollide   = false
button.Transparency = 1

game:GetService("RunService").Heartbeat:connect(function(step)
button.CFrame = CFrame.new(game.Players.LocalPlayer.Character.Head.Position)
button.Size   = Vector3.new(math.random(0,0), math.random(0,0), math.random(1,5))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Right Arm"].Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character.Torso.Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Left Arm"].Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Left Leg"].Position)
wait()
button.Size   = Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
button.CFrame = CFrame.new(game.Players.LocalPlayer.Character["Right Leg"].Position)
end)
end)

MainSection:NewButton("FE Reach", "Farther Reach", function()
   a=Instance.new("SelectionBox",game.Players.LocalPlayer.Backpack.Foil.Handle)
a.Adornee=game.Players.LocalPlayer.Backpack.Foil.Handle
game.Players.LocalPlayer.Backpack.Foil.Handle.Size=Vector3.new(1,1,30)
end)

MainSection:NewButton("FE Seat Spam", "Seat Spam", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
end)

MainSection:NewButton("FE Weird Broken Fencing Swords", "Swords", function()
  game.Lighting["LinkedSword3"]:Clone().Parent = game.Players.LocalPlayer.Backpack
game.Lighting["LinkedSword2"]:Clone().Parent = game.Players.LocalPlayer.Backpack
game.Lighting["LinkedSword"]:Clone().Parent = game.Players.LocalPlayer.Backpack
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- Work at a Pizza Place
 elseif game.PlaceId == 192800 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")




local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
 local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)
   
 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)
   
MainSection:NewButton("IDK", "script", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/cEwtwKZR",true))()
end)

MainSection:NewButton("FE Open Manager's Door", "Opens Manager's Door", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(43,5,7)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(42,5,7)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(43,5,7)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51,5,7)
end)

MainSection:NewButton("FE Paint Cars Hot Pink", "Paints the cars but it can be laggy", function()
 --Change "Hot Pink" to a Roblox Color that they have.

local Color = BrickColor.new('Hot pink')

local PaintCar = function(Car,Color_Code)
for ii, Child in pairs(Car:GetChildren()) do
game.ReplicatedStorage.Channels.VehicleChannel:FireServer('Paint', Child, 'None', Color_Code)
end
end

while wait() do
for i, Car in pairs(workspace.Cars:GetChildren()) do
PaintCar(Car, Color.Number)
end
end
end)

MainSection:NewButton("GabX", "GabX", function()
   --// GabX, the script hub that has all you need! \\--
-- Made by Darion#8863

local tabs = {
	{
		name = "Scripts",
		comingsoon = false,
		scripts = {
			{
				"R2S (EnvEdit)",
				"https://pastebin.com/raw/ZAHTikfe"
			},
			{
				"Old R2S",
				"https://pastebin.com/raw/jXh45kfE"
			},
			{
				"Grab Knife V4",
				"https://pastebin.com/raw/7zK1Swpt"
			},
			{
				"Grab Knife V3",
				"https://pastebin.com/raw/TPZXG8fH"
			},
			{
				"R6 Fly(E)",
				"https://pastebin.com/raw/hTJsM2jV"
			},
			{
				"Speed",
				"https://pastebin.com/raw/mrdWh73D"
			},
			{
				"JumpPower",
				"https://pastebin.com/raw/sA5xym2V"
			},
			{
				"Loopheal",
				"https://pastebin.com/raw/vD9zjBQx"
			},
			{
				"Chat Logs",
				"https://pastebin.com/raw/mtGM0Dkh"
			},
			{
				"Audio Stealer",
				"https://pastebin.com/raw/ABRqgZ3L"
			},
			{
				"FE Check (F9)",
				"https://pastebin.com/raw/SRibuFiK"
			},
			{
				"No clip (F)",
				"https://pastebin.com/raw/bnqAE95f"
			},
			{
				"Bomb Vest",
				"https://pastebin.com/raw/S7vdifqp"
			},
			{
				"Robux Troll",
				"https://pastebin.com/raw/BHjfPXC6"
			}
		}
	},
	{
		name = "FeScripts",
		comingsoon = false,
		scripts = {
			{
				"FE God",
				"https://pastebin.com/raw/p814kXmM"
			},
			{
				"Kill/Fling",
				"https://pastebin.com/raw/Pb3PR6EL"
			},
			{
				"Shutdown",
				"https://pastebin.com/raw/RELufQFM"
			},
			{
				"Hat Spin",
				"https://pastebin.com/raw/Y8iEYKZD"
			},
			{
				"Suicide Gun",
				"https://pastebin.com/raw/SeRxrgci"
			},
			{
				"Click TP Tool",
				"https://pastebin.com/raw/16tXkJjD"
			},
			{
				"OOF Spam",
				"https://pastebin.com/raw/JaMbzp0B"
			},
			{
				"Respawn",
				"https://pastebin.com/raw/61WmHqNp"
			}
		}
	},
	{
		name = "GUIs",
		comingsoon = false,
		scripts = {
			{
				"Topk3k V4",
				"https://pastebin.com/raw/bEmmF8UH"
			},
			{
				"Arosia",
				"https://pastebin.com/raw/Nwit6ZqP"
			},
			{
				"Equinox",
				"https://pastebin.com/raw/scYFbHQb"
			},
			{
				"Ani's(R15)",
				"https://pastebin.com/raw/MenK10Ak"
			},
			{
				"Ani's(R6)",
				"https://pastebin.com/raw/Ydt76Kep"
			},
			{
				"Rose Hub",
				"https://pastebin.com/raw/1BJj0fB4"
			},
			{
				"OPFinality",
				"https://pastebin.com/raw/fG5b1zrM"
			},
			{
				"Old OPHub",
				"https://pastebin.com/raw/FxhQbqsp"
			},
			{
				"HyperTotal",
				"https://pastebin.com/raw/aYdepQa0"
			},
			{
				"Clown Van",
				"https://pastebin.com/raw/0uJXBEmN"
			},
			{
				"Sern Hub",
				"https://pastebin.com/raw/8sD7V8xp"
			},
			{
				"Cooler Kids V2",
				"https://pastebin.com/raw/GGQeWXSL"
			},
			{
				"Ping/FPS",
				"https://pastebin.com/raw/Qh8eeWF7"
			},
			{
				"Spectate",
				"https://pastebin.com/raw/WgpJfMGS"
			},
			{
				"Ro-xploit",
				"https://pastebin.com/raw/ZkhCcaa5"
			},
			{
				"TP GUI",
				"https://pastebin.com/raw/EBhdqeWb"
			}
		}
	},
	{
		name = "Commands",
		comingsoon = false,
		scripts = {
			{
				"BTools",
				"https://pastebin.com/raw/752Gzv1G"
			},
			{
				"Ghost",
				"https://pastebin.com/raw/aiYL4LKV"
			},
			{
				"Big pp",
				"https://pastebin.com/raw/xAcpS2Ze"
			},
			{
				"Inf Jump",
				"https://pastebin.com/raw/Dz61QSir"
			}
		}
	},
	{
		name = "Stat Change",
		comingsoon = false,
		scripts = {
			{
				"Clone Tycoon 2",
				"https://pastebin.com/raw/ga02bJq5"
			},
			{
				"Naruto Final Bond LVL",
				"https://pastebin.com/raw/j5gYsnxM"
			},
			{
				"Shinobi Life",
				"https://pastebin.com/raw/rpWG7xBj"
			},
			{
				"Rocitizens",
				"https://pastebin.com/raw/P3WAujA9"
			},
			{
				"Naruto New Gen",
				"https://pastebin.com/raw/34Fdq480"
			},
			{
				"False DBFP",
				"https://pastebin.com/raw/tTCcVDAf"
			},
			{
				"Jaws",
				"https://pastebin.com/raw/RkNJ3jn2"
			},
			{
				"Giant Survival 2",
				"https://pastebin.com/raw/sbme5pNF"
			},
			{
				"One Piece Unleashed 2",
				"https://pastebin.com/raw/QAgtrGdX"
			},
			{
				"Tuber Simulator",
				"https://pastebin.com/raw/zy1dFtrc"
			},
			{
				"Yard Work Simulator",
				"https://pastebin.com/raw/udKYdRpW"
			},
			{
				"Dragon Ball Super 2",
				"https://pastebin.com/raw/U5i77x2T"
			},
			{
				"Avatar: Legend of Kora",
				"https://pastebin.com/raw/ggcfAQcH"
			}
		}
	},
	{
		name = "Games",
		comingsoon = false,
		scripts = {
			{
				"NRPG Beyond Fast Shoot",
				"https://pastebin.com/raw/zXCvQxRF"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Jailbreak AFK",
				"https://pastebin.com/raw/hhRca3cj"
			},
			{
				"Jailbreak GUI",
				"https://pastebin.com/raw/CQFw06tN"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Lumber Tycoon",
				"https://pastebin.com/raw/33kYAahS"
			},
			{
				"Phantom Forces",
				"https://pastebin.com/raw/LgQEjvxS"
			},
			{
				"Hilton Hotels",
				"https://pastebin.com/raw/QfHywxaZ"
			},
			{
				"Work At A Pizza Place",
				"https://pastebin.com/raw/KyfBZCKL"
			},
			{
				"Prison Royale",
				"https://pastebin.com/raw/0W4QBB5C"
			},
			{
				"Greenwood Town",
				"https://pastebin.com/raw/96JTe9Gd"
			},
			{	
				"Naruto Final Bond",
				"https://pastebin.com/raw/ujKgVWBn"
			},
			{	"Project Pokemon",
				"https://pastebin.com/raw/jDTLJf9Z"
			},
			{	"Scuba Diving",
				"https://pastebin.com/raw/NwSeijRv"
			}
		}
	},
	{
		name = "Admins",
		comingsoon = false,
		scripts = {
			{
				"Infinite Yield",
				"https://pastebin.com/raw/MjBzRjmT"
			},
			{
				"Rocky's",
				"https://pastebin.com/raw/3V4s9UPx"
			},
			{
				"Dex Explorer",
				"https://pastebin.com/raw/eqy8yt4q"
			},
			{
				"N3xulis",
				"https://pastebin.com/raw/eKkbtM3A"
			},
			{
				"ARX Admin",
				"https://pastebin.com/raw/4PGmJv5R"
			},
			{
				"Shattervast",
				"https://pastebin.com/raw/44bNjECt"
			},
			{
				"Filter My Ass",
				"https://pastebin.com/raw/Tn1xz43y"
			},
			{
				"C00lgui",
				"https://pastebin.com/raw/Xt0S28mx"
			},
			{
				"Mayem",
				"https://pastebin.com/raw/tWQnvRqH"
			},
			{
				"Nosyliam",
				"https://pastebin.com/raw/FmeiVpiE"
			},
			{
				"Your Mom V2",
				"https://pastebin.com/raw/1FsNUZHq"
			},
			{
				"PME Safazi",
				"https://pastebin.com/raw/yrnDMLYs"
			}
		}
	},
	{
		name = "Forms",
		comingsoon = false,
		scripts = {
			{
				"Madara",
				"https://pastebin.com/raw/LYjZdycr"
			},
			{
				"Shadow Titan",
				"https://pastebin.com/raw/E7b9cy1h"
			},
			{
				"Assasin",
				"https://pastebin.com/raw/bKu2GuzN"
			},
			{
				"Beast Claws",
				"https://pastebin.com/raw/0AH8SZTJ"
			},
			{
				"6 Swords",
				"https://pastebin.com/raw/80juE2kw"
			},
			{
				"Goku SSJ3",
				"https://pastebin.com/raw/vFmVuXk4"
			},
			{
				"OmagaV2",
				"https://pastebin.com/raw/VSerZV3e"
			},
			{
				"Absalom Titan",
				"https://pastebin.com/raw/ZmySaMrb"
			},
			{
				"Ace",
				"https://pastebin.com/raw/fA4XSTY1"
			},
			{
				"Beerus",
				"https://pastebin.com/raw/c1TGDAKC"
			},
			{
				"DSSJ4",
				"https://pastebin.com/raw/pfdud8wK"
			},
			{
				"Zenatic",
				"https://pastebin.com/raw/wTJxmWyG"
			},
			{
				"Naruto",
				"https://pastebin.com/raw/eEN5mC9u"
			}
		}
	},
	{
		name = "Extra",
		comingsoon = true
	}
}
local othertabs = {
	{
		name = "Info",
		text = "GabX was made by a new learning scripter named Darion. It started off as a simple project to learn scripting just for myself, but I decided to release it anyways just for fun. It received quite a bit of attention and several youtube videos were made on it. I felt like I didn't deserve the support because nothing was actually made by me, I just added buttons. I decided to rewrite the UI all by myself! I did get some help in the scripting part because I'm not the best in scripting since I'm new to making scripts and exploiting related stuff in general. Now GabX has been updated and the UI was all self made! Also, when I wanted to release it I didn't know any good name for it. I asked my friend and he didn't know either, so I just chose my friends name and added an X to it! :D",
	},
	{
		name = "Help",
		text = "If there is anything patched, not the most recent update, broken or anything else please DM Darion#8863 and join the server. http://discord.gg/E64Jd89"
	},
	{
		name = "Credits",
		text = "GabX was made by Darion#8863."
	}
}


local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local openclose = Instance.new("TextButton")
openclose.Parent = gui
openclose.Name = "OpenClose"
openclose.Style = Enum.ButtonStyle.RobloxRoundButton
openclose.Font = Enum.Font.SciFi
openclose.TextSize = 25
openclose.Text = "OPEN"
openclose.ZIndex = 12
openclose.Size = UDim2.new(0, 110,0, 45)
openclose.Position = UDim2.new(0, 0,0.791, 0)

local top = Instance.new("Frame")
top.Parent = gui
top.Name = "Topbar"
top.BorderSizePixel = 0
top.BackgroundColor3 = Color3.new((192 / 255), (225 / 255), (237 / 255))
top.Size = UDim2.new(0, 500, 0, 36)
top.Position = UDim2.new(0, -505, 0.5, -218)
top.Draggable = true
top.Active = true
top.ZIndex = 10
top.Visible = false

local logo = Instance.new("ImageLabel")
logo.Parent = top
logo.Name = "Logo"
logo.BorderSizePixel = 0
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://1902404068"
logo.ScaleType = Enum.ScaleType.Crop
logo.Size = UDim2.new(0, 140, 0, 36)
logo.Position = UDim2.new(0.5, -70, 0, 0)
logo.ZIndex = 11

local main = Instance.new("Frame")
main.Parent = top
main.Name = "MainFrame"
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BackgroundTransparency = 0.2
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(1, 0, 0, 400)
main.ZIndex = 10

local tabsf = Instance.new("Frame")
tabsf.Parent = main
tabsf.Name = "Tabs"
tabsf.BorderSizePixel = 0
tabsf.BackgroundTransparency = 1
tabsf.Position = UDim2.new(0, 0, 0, 0)
tabsf.Size = UDim2.new(0, 100, 1, 0)


openclose.MouseButton1Click:connect(function()
	if top.Visible then
		openclose.Text = "OPEN"
		top:TweenPosition(UDim2.new(0, -505, 0.5, -218))
		wait(1.05)
		top.Visible = false
	else
		openclose.Text = "CLOSE"
		top.Visible = true
		top:TweenPosition(UDim2.new(0.5, -250, 0.5, -218))
		wait(1.05)
	end 
end)

local current = "Scripts"
for i1, tab in ipairs(tabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, (i1 - 1) * 30)
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local tabfr = Instance.new("Frame")
	tabfr.Parent = main
	tabfr.Name = tab.name
	tabfr.BorderSizePixel = 0
	tabfr.BackgroundTransparency = 1
	tabfr.Size = UDim2.new(0, 390, 1, -10)
	tabfr.Position = UDim2.new(0, 105, 0, 5)
	if tab.name ~= current then
		tabfr.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		tabfr.Visible = true 
	end)
	
	if tab.comingsoon then
		local text = Instance.new("TextLabel")
		text.Parent = tabfr
		text.BorderSizePixel = 0
		text.BackgroundTransparency = 1
		text.BackgroundColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.SciFi
		text.TextSize = 60
		text.Text = "Coming Soon!"
		text.Position = UDim2.new(0, 0, 0, 0)
		text.Size = UDim2.new(1, 0, 0, 100)
		text.ZIndex = 11
	else
		for i2, scr in ipairs(tab.scripts) do
			local scrbtn = Instance.new("TextButton")
			scrbtn.Parent = tabfr
			scrbtn.Name = scr[1]
			scrbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
			scrbtn.Position = UDim2.new(0, ((i2 - 1) % 4) * 100, 0, math.floor((i2 - 1) / 4) * 50)
			scrbtn.Size = UDim2.new(0, 90, 0, 40)
			scrbtn.TextSize = 14
			scrbtn.TextScaled = true
			scrbtn.TextScaled = false
			scrbtn.Font = Enum.Font.SciFi
			scrbtn.Text = scr[1]
			scrbtn.ZIndex = 11
			
			scrbtn.MouseButton1Click:connect(function()
				loadstring(game:HttpGet(scr[2], true))()
			end)
		end
	end
end
for i,tab in ipairs(othertabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name 
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, 314 + ((i - 1) * 30))
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local text = Instance.new("TextLabel")
	text.Parent = main
	text.Name = tab.name 
	text.BorderSizePixel = 0
	text.BackgroundTransparency = 0.2
	text.BackgroundColor3 = Color3.new(1, 1, 1)
	text.Size = UDim2.new(0, 390, 1, -10)
	text.Position = UDim2.new(0, 105, 0, 5)
	text.Text = tab.text
	text.Font = Enum.Font.SciFi
	text.TextSize = 20
	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextYAlignment = Enum.TextYAlignment.Top
	text.TextWrapped = true
	text.ZIndex = 11 
	if tab.name ~= current then
		text.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		text.Visible = true 
	end)
end

end)

 MainSection:NewButton("FE Pizza Toppings Troll", "troll", function()
   for i,v in pairs(workspace.AllDough:GetChildren()) do
    workspace.GameService.AddIngredientToPizza:FireServer(v, "Sausage")
    workspace.GameService.AddIngredientToPizza:FireServer(v, "Cheese")
    workspace.GameService.AddIngredientToPizza:FireServer(v, "Pepperoni")
    workspace.GameService.AddIngredientToPizza:FireServer(v, "TomatoSauce")
end
end)

MainSection:NewButton("FE Teleport To manager chair", "it tps to manager chair", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(23,5,6.5)
  end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
 -- VR Hands
elseif game.PlaceId == 4832438542 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
 local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)
   
 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)
   
MainSection:NewButton("VR Hands GUI", "GUI", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/ugQ9Nb7t"))()
end)

MainSection:NewButton("Hands VR", "VR Hands withour VR", function()
    local cam = workspace.Camera
local p
local headObject
local events = {}

local controls = {
	[Enum.UserInputType.MouseButton1] = {"move", "leftHand"},
	[Enum.UserInputType.MouseMovement] = {"updateTarget"}, -- do not change
	[Enum.UserInputType.MouseWheel] = {"adjustOffset"},
	[Enum.UserInputType.MouseButton2] = {"move", "rightHand"},
	[Enum.KeyCode.W] = {"move", "head", Vector3.new(0, 1, 0)},
	[Enum.KeyCode.A] = {"move", "head", Vector3.new(-1, 0, 0)},
	[Enum.KeyCode.S] = {"move", "head", Vector3.new(0, -1, 0)},
	[Enum.KeyCode.D] = {"move", "head", Vector3.new(1, 0, 0)},
	[Enum.KeyCode.Q] = {"move", "head", Vector3.new(0, 0, -1)},
	[Enum.KeyCode.E] = {"move", "head", Vector3.new(0, 0, 1)},
	[Enum.KeyCode.LeftShift] = {"gesture", "Fist"},
	[Enum.KeyCode.LeftControl] = {"gesture", "Index"},
	[Enum.KeyCode.LeftAlt] = {"gesture", "Thumb"},
	[Enum.KeyCode.Z] = {"toggle", "canOffset"},
	[Enum.KeyCode.R] = {"toggle", "rotationManager"},
	[Enum.KeyCode.Tab] = {"selectAxis", "rotationManager"},
	[Enum.KeyCode.Left] = {"updateAxisMover", "rotationManager", -1},
	[Enum.KeyCode.Right] = {"updateAxisMover", "rotationManager", 1}
}

local services = {}

setmetatable(services, {
	__index = function(t, k)
		services[k] = rawget(services, k) or game:GetService(k)
		return services[k]
	end
})

local function angleBetween(vecx, vecy)
	return math.acos(vecx:Dot(vecy))
end

local hand = {}
hand.__index = hand

function hand:gesture(gestureName, keyState)
	if keyState ~= 1 then
		return
	end

	headObject.realHeadset[self.id .. gestureName] = 1 - headObject.realHeadset[self.id .. gestureName]
end

function hand:getMouseRay()
	local mousePos = services.UserInputService:GetMouseLocation()
	return CFrame.new(cam:ViewportPointToRay(mousePos.x, mousePos.y).Direction * (1.5 + headObject.handOffset))
end

function hand:calculateEndRotation()
	return CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()) * CFrame.Angles(self.rotation[1] * (math.pi/6), self.rotation[2] * (math.pi/6), self.rotation[3] * (math.pi/6))
end

function hand:updateTarget()

	local camLook = (cam.CFrame.lookVector * Vector3.new(1,0,1)).unit
	
	local theta = angleBetween(Vector3.new(-1, 0, 0), camLook)
	theta = camLook.z > 0 and (2 * math.pi) - theta or theta

	local relativeAngle = (self.id == "l" and -headObject.handAngle or headObject.handAngle)
	local startPosition = CFrame.new(-math.cos(theta + relativeAngle), -0.5, -math.sin(theta + relativeAngle)) + (camLook * headObject.handOffset)

	self.targetPosition = startPosition:Lerp(self:getMouseRay(), self.alpha) * self:calculateEndRotation()
	
	self.replicatePosition:Fire()
end

function hand:beginMove(minAlpha, maxAlpha)
	local distAlpha = (maxAlpha - minAlpha) / 2

	self.moving = true
	repeat
		services.RunService.RenderStepped:wait()
		self:updateTarget()
	until math.abs(self.alpha - minAlpha) < 0.05 or math.abs(maxAlpha - self.alpha) < 0.05 or self.alpha ~= self.alpha
	
	if self.alpha ~= self.alpha then
		self.alpha = 0
	end
	
	self.moving = false
end

function hand:move(keyState)

	if headObject.rotationManager.active then
		if self.id == "l" then
			headObject.rotationManager.held = keyState == 1
			
			headObject.rotationManager.selectedAxis = 0
		end
		return
	end

	self.alphaMultiplier = keyState == 1 and 0.05 or -0.05
	
	if not self.moving and not (keyState == 1 and self.alpha >= 1) then
		if keyState == 1 then
			headObject.recentHand = self
		end
	
		self:beginMove(0, 1)
	end
end

function hand:new(direction, realHand)
	local newHand = setmetatable({direction = direction, realHand = realHand}, hand)
	newHand.alpha = 0
	newHand.alphaMultiplier = 0.05
	newHand.id = direction and "r" or "l"
	newHand.targetPosition = CFrame.new()
	newHand.moving = false
	newHand.rotation = {0, 0, 0}
	newHand.replicatePosition = Instance.new("BindableEvent")
	newHand.replicatePosition.Event:connect(function()
		events.UserCFrameChanged:Fire(newHand.direction and Enum.UserCFrame.RightHand or Enum.UserCFrame.LeftHand, newHand.targetPosition)
	end)
	
	return newHand
end

local head = {}
head.__index = head

function head:handleInput(input, keyState)
	local bind = controls[input.KeyCode] or controls[input.UserInputType]
	
	if bind then
		if bind[1] == "updateTarget" and not self.rotationManager.active then
			self.leftHand:updateTarget()
			self.rightHand:updateTarget()
		elseif bind[2] and type(self[bind[2]]) == "table" then
			self[bind[2]][bind[1]](self[bind[2]], keyState, bind[3])
		elseif bind[3] then
			self[bind[1]](self, bind[3], keyState)
		elseif bind[2] and self.recentHand[bind[1]] then
			self.recentHand[bind[1]](self.recentHand, bind[2], keyState)
		else
			self[bind[1]](self, bind[2], keyState)
		end
	end
end

function head:adjustOffset(_, keyState)
	if self.canOffset then		
		self.leftHand:updateTarget()
		self.rightHand:updateTarget()
	end
end

function head:move(vec, keyState)
	if vec.z ~= 0 then
		self.realHeadset.Stick2 = math.clamp(self.realHeadset.Stick2 + (vec.z * keyState), -1, 1)
	else
	end
end

function head:freezeCam(b)
	local dist = (self.realHeadset.Head.PrimaryPart.Position - cam.CFrame.p).magnitude
		
	p.CameraMinZoomDistance = b and dist or 0.5
	p.CameraMaxZoomDistance = b and dist or 128
end

function head:toggle(stat, keyState)
	if keyState ~= 1 then
		return
	end

	self[stat] = not self[stat]
	
	if stat == "canOffset" then
		self:freezeCam(self[stat])
	end
end

local rotation = {}
rotation.__index = rotation

function rotation:new()
	local newRotation = setmetatable({}, rotation)
	
	newRotation.rotationLookup = {{}, {}, {}}
	newRotation.lineLookup = {{}, {}, {}}
	newRotation.active = false
	newRotation.held = false
	newRotation.selectedAxis = 0
	newRotation.angleLookup = {1, 1, 1}
	
	for i=1,3 do
		local ref = {}
		ref[i] = function() return 0 end
		ref[i + 1 > 3 and ((i + 1) % 4) + 1 or i + 1] = math.cos
		ref[i + 2 > 3 and ((i + 2) % 4) + 1 or i + 2] = math.sin
		
		local color = Color3.fromRGB(i == 1 and 255 or 0, i == 2 and 255 or 0, i == 3 and 255 or 0)
		
		for j=1,13 do
			if j < 13 then
				local step = math.pi * (j/6)
				newRotation.rotationLookup[i][j] = Vector3.new(ref[1](step), ref[2](step), ref[3](step))
			end
			
			local line = Drawing.new("Line")
			line.Visible = true
			line.Thickness = 5
			line.Color = color
			newRotation.lineLookup[i][j] = line
		end
		
		local circle = Drawing.new("Circle")
		circle.Visible = true
		circle.Color = color
		circle.Filled = true
		circle.Radius = 10
		circle.Position = Vector2.new(-2000, -2000)
		newRotation.lineLookup[i][14] = circle
		
		local text = Drawing.new("Text")
		text.Visible = true
		text.Font = Drawing.Fonts.System
		text.Size = 18
		text.Color = Color3.new():lerp(color, 0.3)
		text.Outline = false
		newRotation.lineLookup[i][15] = text
	end
	
	return newRotation
end

function rotation:selectAxis(keyState)
	self.tabActivated = keyState == 1
	if self.tabActivated then
		self.selectedAxis = math.clamp((self.selectedAxis + 1) % 4, 1, 3)
	end
end 

function rotation:toggle(keyState)
	if keyState == 1 and headObject.recentHand.alpha < 0.05 and not self.held then
		self.active = not self.active
		
		if not self.active then
			self:updateAxes(0)
			self.selectedAxis = 0
			self.held = false
			headObject.recentHand:updateTarget()
		end
	end
end

function rotation:updateAxes(visibleOverride)
	local basePos = headObject.recentHand.realHand.Base.Position
	local basePoint = cam:WorldToViewportPoint(basePos)

	for i=1,3 do
		for j=1,12 do
			local vec, visible = cam:WorldToViewportPoint(basePos + (self.rotationLookup[i][j] * 10))
			local vec2, visible2 = cam:WorldToViewportPoint(basePos + ((self.rotationLookup[i][j + 1] or self.rotationLookup[i][1]) * 10))
			
			local line = self.lineLookup[i][j]
			
			line.Transparency = visibleOverride or ((visible and visible2) and 1 or 0)
			line.From = Vector2.new(vec.x, vec.y)
			line.To = Vector2.new(vec2.x, vec2.y)
		end
		local axisRotation = headObject.recentHand.rotation[i]
		
		local axisMover = self.lineLookup[i][13]
		local axisCircle = self.lineLookup[i][14]
		local axisText = self.lineLookup[i][15]
		
		axisMover.From = Vector2.new(basePoint.x, basePoint.y)
		axisMover.To = self.lineLookup[i][math.clamp(axisRotation < 1 and 12 or axisRotation, 1, 12)].From -- sorry, lazy
		axisMover.Transparency = visibleOverride or 1
		
		axisCircle.Position = self.lineLookup[i][13].To
		axisCircle.Transparency = visibleOverride or 1
		
		
		
		axisText.Position = self.lineLookup[2][3].From + axisText.TextBounds
		axisText.Text = string.char(87 + self.selectedAxis) .. ": " .. math.deg(axisRotation * (math.pi / 6))
		axisText.Transparency = visibleOverride or ((self.held or self.tabActivated) and self.selectedAxis == i and 1 or 0)
		
		local mousePos = services.UserInputService:GetMouseLocation()
		if self.held and (self.lineLookup[i][14].Position - mousePos).magnitude < 10 and self.selectedAxis == 0 then
			self.selectedAxis = i
		end
	end
end

function rotation:updateAxisMover(keyState, direction)
	if keyState and direction then
		if self.tabActivated and keyState == 1 then
			headObject.recentHand.rotation[self.selectedAxis] = (headObject.recentHand.rotation[self.selectedAxis] + direction) % 12
			headObject.recentHand:updateTarget()
		end
		return
	end

	if self.selectedAxis ~= 0 then
		local mousePos = services.UserInputService:GetMouseLocation()
		
		local circlePos = self.lineLookup[self.selectedAxis][12].From
		
		local handPos = self.lineLookup[self.selectedAxis][13].From
		
		local mouseDir = self.selectedAxis == 1 and headObject.recentHand.id == "r" and (Vector2.new(-mousePos.x + (handPos.x * 2), mousePos.y) - handPos).unit or (mousePos - handPos).unit
		-- mouse angle relating to the red circle is reflected on the right hand, so i "re-reflect" it. bad practice
		
		local circleDir = (circlePos - handPos).unit
		
		local rotationTheta = angleBetween(mouseDir, circleDir)
		
		local direction = mouseDir:Cross(circleDir)
		
		rotationTheta = direction > 0 and rotationTheta or (2 * math.pi) - rotationTheta
		
		if rotationTheta == rotationTheta then
			headObject.recentHand.rotation[self.selectedAxis] = math.floor(6 * rotationTheta / math.pi)
			
			local hand = headObject.recentHand
			hand.replicatePosition:Fire()
		end
	end
end

function head:new(realHeadset)
	local newHead = setmetatable({realHeadset = realHeadset}, head)
	
	newHead.leftHand = hand:new(false, realHeadset.lHand)
	newHead.rightHand = hand:new(true, realHeadset.rHand)
	newHead.canOffset = false
	newHead.recentHand = newHead.leftHand
	newHead.handOffset = 0
	newHead.handAngle = math.pi / 4
	
	newHead.rotationManager = rotation:new()
	
	newHead.chatRemote = debug.getupvalue(realHeadset.ButtonPressed, 3)
	
	cam:GetPropertyChangedSignal("CameraSubject"):connect(function()
		if cam.CameraSubject ~= headObject.realHeadset.Head then
			cam.CameraType = Enum.CameraType.Custom
		end
	end)
	
	services.UserInputService.WindowFocused:connect(function()
		newHead.realHeadset.StickPosition = Vector3.new(0, 0, 0)
		newHead.realHeadset.Stick2 = 0
	end)
	
	return newHead
end

local ind, nc, nind

local realVrService = game:GetService("VRService")

local fakeVrService = setmetatable({
	VREnabled = true,
	SetTouchpadMode = function()
	end,
	RecenterUserHeadCFrame = function()
	end,
	GetUserCFrameEnabled = function(cf)
		return true
	end,
	GetUserCFrame = function(cf)
		return CFrame.new()
	end

}, {
	__index = function(t, k)
		local real = ind(realVrService, k)
		if typeof(real) == "RBXScriptSignal" then
			events[k] = events[k] or {
				Name = k,
				Connect = function(t, f)
					t.Function = f

					if t.Name == "UserCFrameChanged" then
						headObject = head:new(debug.getupvalue(t.Function, 1))
						
						services.UserInputService.InputBegan:connect(function(i)
							headObject:handleInput(i, 1)
						end)

						services.UserInputService.InputChanged:connect(function(i)
							headObject:handleInput(i, i.UserInputType == Enum.UserInputType.MouseWheel and i.Position.z or 0)
						end)

						services.UserInputService.InputEnded:connect(function(i)
							headObject:handleInput(i, -1)
						end)
					end

				end, 
				Fire = function(t, ...)
					return t.Function(...)
				end
			}

			return events[k]
		end

		return real
	end,
	__call = function(t, method, vr, ...)
		return t[method](...)
	end
})

ind = hookmetamethod(game, "__index", function(...)
	local t, k = ...

	local scr = getcallingscript()

	if t == realVrService and not (scr and ind(scr, "Name") == "CameraModule") then
		return fakeVrService[k]
	end

	return ind(...)
end)

nc = hookmetamethod(game, "__namecall", function(...)
	local t = ...

	if t == realVrService then
		local method = getnamecallmethod()
		return fakeVrService(method, ...)
	elseif t == game.GetService(game, "StarterGui") and game.IsLoaded(game) then
		return
	end

	return nc(...)
end)

nind = hookmetamethod(game, "__newindex", function(...)
	local t, k, v = ...
	
	local scr = getcallingscript()
	
	if t == cam and headObject then	
		if k == "CFrame" and events.UserCFrameChanged then
		
			events.UserCFrameChanged:Fire(Enum.UserCFrame.Head, CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()))
			
			if headObject.rotationManager.active then
			
				headObject.rotationManager:updateAxes()
				
				if headObject.rotationManager.held then
					headObject.rotationManager:updateAxisMover()
				end
			end
			
			if headObject.rotationManager.tabActivated and services.UserInputService:IsKeyDown(Enum.KeyCode.Left) or services.UserInputService:IsKeyDown(Enum.KeyCode.Right) then -- prevent controls from messing with camera
				return
			end
		elseif k == "CameraType" then
			nind(t, k, Enum.CameraType.Custom)
			nind(t, "CameraSubject", headObject.realHeadset.Head)
			headObject.leftHand:updateTarget()
			headObject.rightHand:updateTarget()
		end
		if not (scr and scr.Name == "CameraModule") and not checkcaller() then
			return
		end
	end
	
	nind(t, k, v)
end)

p = services.Players.LocalPlayer or (function()
	services.Players:GetPropertyChangedSignal("LocalPlayer"):wait() -- this doesnt return anything for some reason??
	return services.Players.LocalPlayer
end)()

p.Chatted:connect(function(c)
	services.ReplicatedStorage.COM.Chat:FireServer("Chat", c)
end)
end)
 

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- Adopt me
elseif game.PlaceId == 920587237 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
   local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Antartic Hub", "idk", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/JusticeValley/Antarctic-Hub/main/New.lua", true))()
 end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("GabX", "GabX", function()
   --// GabX, the script hub that has all you need! \\--
-- Made by Darion#8863

local tabs = {
	{
		name = "Scripts",
		comingsoon = false,
		scripts = {
			{
				"R2S (EnvEdit)",
				"https://pastebin.com/raw/ZAHTikfe"
			},
			{
				"Old R2S",
				"https://pastebin.com/raw/jXh45kfE"
			},
			{
				"Grab Knife V4",
				"https://pastebin.com/raw/7zK1Swpt"
			},
			{
				"Grab Knife V3",
				"https://pastebin.com/raw/TPZXG8fH"
			},
			{
				"R6 Fly(E)",
				"https://pastebin.com/raw/hTJsM2jV"
			},
			{
				"Speed",
				"https://pastebin.com/raw/mrdWh73D"
			},
			{
				"JumpPower",
				"https://pastebin.com/raw/sA5xym2V"
			},
			{
				"Loopheal",
				"https://pastebin.com/raw/vD9zjBQx"
			},
			{
				"Chat Logs",
				"https://pastebin.com/raw/mtGM0Dkh"
			},
			{
				"Audio Stealer",
				"https://pastebin.com/raw/ABRqgZ3L"
			},
			{
				"FE Check (F9)",
				"https://pastebin.com/raw/SRibuFiK"
			},
			{
				"No clip (F)",
				"https://pastebin.com/raw/bnqAE95f"
			},
			{
				"Bomb Vest",
				"https://pastebin.com/raw/S7vdifqp"
			},
			{
				"Robux Troll",
				"https://pastebin.com/raw/BHjfPXC6"
			}
		}
	},
	{
		name = "FeScripts",
		comingsoon = false,
		scripts = {
			{
				"FE God",
				"https://pastebin.com/raw/p814kXmM"
			},
			{
				"Kill/Fling",
				"https://pastebin.com/raw/Pb3PR6EL"
			},
			{
				"Shutdown",
				"https://pastebin.com/raw/RELufQFM"
			},
			{
				"Hat Spin",
				"https://pastebin.com/raw/Y8iEYKZD"
			},
			{
				"Suicide Gun",
				"https://pastebin.com/raw/SeRxrgci"
			},
			{
				"Click TP Tool",
				"https://pastebin.com/raw/16tXkJjD"
			},
			{
				"OOF Spam",
				"https://pastebin.com/raw/JaMbzp0B"
			},
			{
				"Respawn",
				"https://pastebin.com/raw/61WmHqNp"
			}
		}
	},
	{
		name = "GUIs",
		comingsoon = false,
		scripts = {
			{
				"Topk3k V4",
				"https://pastebin.com/raw/bEmmF8UH"
			},
			{
				"Arosia",
				"https://pastebin.com/raw/Nwit6ZqP"
			},
			{
				"Equinox",
				"https://pastebin.com/raw/scYFbHQb"
			},
			{
				"Ani's(R15)",
				"https://pastebin.com/raw/MenK10Ak"
			},
			{
				"Ani's(R6)",
				"https://pastebin.com/raw/Ydt76Kep"
			},
			{
				"Rose Hub",
				"https://pastebin.com/raw/1BJj0fB4"
			},
			{
				"OPFinality",
				"https://pastebin.com/raw/fG5b1zrM"
			},
			{
				"Old OPHub",
				"https://pastebin.com/raw/FxhQbqsp"
			},
			{
				"HyperTotal",
				"https://pastebin.com/raw/aYdepQa0"
			},
			{
				"Clown Van",
				"https://pastebin.com/raw/0uJXBEmN"
			},
			{
				"Sern Hub",
				"https://pastebin.com/raw/8sD7V8xp"
			},
			{
				"Cooler Kids V2",
				"https://pastebin.com/raw/GGQeWXSL"
			},
			{
				"Ping/FPS",
				"https://pastebin.com/raw/Qh8eeWF7"
			},
			{
				"Spectate",
				"https://pastebin.com/raw/WgpJfMGS"
			},
			{
				"Ro-xploit",
				"https://pastebin.com/raw/ZkhCcaa5"
			},
			{
				"TP GUI",
				"https://pastebin.com/raw/EBhdqeWb"
			}
		}
	},
	{
		name = "Commands",
		comingsoon = false,
		scripts = {
			{
				"BTools",
				"https://pastebin.com/raw/752Gzv1G"
			},
			{
				"Ghost",
				"https://pastebin.com/raw/aiYL4LKV"
			},
			{
				"Big pp",
				"https://pastebin.com/raw/xAcpS2Ze"
			},
			{
				"Inf Jump",
				"https://pastebin.com/raw/Dz61QSir"
			}
		}
	},
	{
		name = "Stat Change",
		comingsoon = false,
		scripts = {
			{
				"Clone Tycoon 2",
				"https://pastebin.com/raw/ga02bJq5"
			},
			{
				"Naruto Final Bond LVL",
				"https://pastebin.com/raw/j5gYsnxM"
			},
			{
				"Shinobi Life",
				"https://pastebin.com/raw/rpWG7xBj"
			},
			{
				"Rocitizens",
				"https://pastebin.com/raw/P3WAujA9"
			},
			{
				"Naruto New Gen",
				"https://pastebin.com/raw/34Fdq480"
			},
			{
				"False DBFP",
				"https://pastebin.com/raw/tTCcVDAf"
			},
			{
				"Jaws",
				"https://pastebin.com/raw/RkNJ3jn2"
			},
			{
				"Giant Survival 2",
				"https://pastebin.com/raw/sbme5pNF"
			},
			{
				"One Piece Unleashed 2",
				"https://pastebin.com/raw/QAgtrGdX"
			},
			{
				"Tuber Simulator",
				"https://pastebin.com/raw/zy1dFtrc"
			},
			{
				"Yard Work Simulator",
				"https://pastebin.com/raw/udKYdRpW"
			},
			{
				"Dragon Ball Super 2",
				"https://pastebin.com/raw/U5i77x2T"
			},
			{
				"Avatar: Legend of Kora",
				"https://pastebin.com/raw/ggcfAQcH"
			}
		}
	},
	{
		name = "Games",
		comingsoon = false,
		scripts = {
			{
				"NRPG Beyond Fast Shoot",
				"https://pastebin.com/raw/zXCvQxRF"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Jailbreak AFK",
				"https://pastebin.com/raw/hhRca3cj"
			},
			{
				"Jailbreak GUI",
				"https://pastebin.com/raw/CQFw06tN"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Lumber Tycoon",
				"https://pastebin.com/raw/33kYAahS"
			},
			{
				"Phantom Forces",
				"https://pastebin.com/raw/LgQEjvxS"
			},
			{
				"Hilton Hotels",
				"https://pastebin.com/raw/QfHywxaZ"
			},
			{
				"Work At A Pizza Place",
				"https://pastebin.com/raw/KyfBZCKL"
			},
			{
				"Prison Royale",
				"https://pastebin.com/raw/0W4QBB5C"
			},
			{
				"Greenwood Town",
				"https://pastebin.com/raw/96JTe9Gd"
			},
			{	
				"Naruto Final Bond",
				"https://pastebin.com/raw/ujKgVWBn"
			},
			{	"Project Pokemon",
				"https://pastebin.com/raw/jDTLJf9Z"
			},
			{	"Scuba Diving",
				"https://pastebin.com/raw/NwSeijRv"
			}
		}
	},
	{
		name = "Admins",
		comingsoon = false,
		scripts = {
			{
				"Infinite Yield",
				"https://pastebin.com/raw/MjBzRjmT"
			},
			{
				"Rocky's",
				"https://pastebin.com/raw/3V4s9UPx"
			},
			{
				"Dex Explorer",
				"https://pastebin.com/raw/eqy8yt4q"
			},
			{
				"N3xulis",
				"https://pastebin.com/raw/eKkbtM3A"
			},
			{
				"ARX Admin",
				"https://pastebin.com/raw/4PGmJv5R"
			},
			{
				"Shattervast",
				"https://pastebin.com/raw/44bNjECt"
			},
			{
				"Filter My Ass",
				"https://pastebin.com/raw/Tn1xz43y"
			},
			{
				"C00lgui",
				"https://pastebin.com/raw/Xt0S28mx"
			},
			{
				"Mayem",
				"https://pastebin.com/raw/tWQnvRqH"
			},
			{
				"Nosyliam",
				"https://pastebin.com/raw/FmeiVpiE"
			},
			{
				"Your Mom V2",
				"https://pastebin.com/raw/1FsNUZHq"
			},
			{
				"PME Safazi",
				"https://pastebin.com/raw/yrnDMLYs"
			}
		}
	},
	{
		name = "Forms",
		comingsoon = false,
		scripts = {
			{
				"Madara",
				"https://pastebin.com/raw/LYjZdycr"
			},
			{
				"Shadow Titan",
				"https://pastebin.com/raw/E7b9cy1h"
			},
			{
				"Assasin",
				"https://pastebin.com/raw/bKu2GuzN"
			},
			{
				"Beast Claws",
				"https://pastebin.com/raw/0AH8SZTJ"
			},
			{
				"6 Swords",
				"https://pastebin.com/raw/80juE2kw"
			},
			{
				"Goku SSJ3",
				"https://pastebin.com/raw/vFmVuXk4"
			},
			{
				"OmagaV2",
				"https://pastebin.com/raw/VSerZV3e"
			},
			{
				"Absalom Titan",
				"https://pastebin.com/raw/ZmySaMrb"
			},
			{
				"Ace",
				"https://pastebin.com/raw/fA4XSTY1"
			},
			{
				"Beerus",
				"https://pastebin.com/raw/c1TGDAKC"
			},
			{
				"DSSJ4",
				"https://pastebin.com/raw/pfdud8wK"
			},
			{
				"Zenatic",
				"https://pastebin.com/raw/wTJxmWyG"
			},
			{
				"Naruto",
				"https://pastebin.com/raw/eEN5mC9u"
			}
		}
	},
	{
		name = "Extra",
		comingsoon = true
	}
}
local othertabs = {
	{
		name = "Info",
		text = "GabX was made by a new learning scripter named Darion. It started off as a simple project to learn scripting just for myself, but I decided to release it anyways just for fun. It received quite a bit of attention and several youtube videos were made on it. I felt like I didn't deserve the support because nothing was actually made by me, I just added buttons. I decided to rewrite the UI all by myself! I did get some help in the scripting part because I'm not the best in scripting since I'm new to making scripts and exploiting related stuff in general. Now GabX has been updated and the UI was all self made! Also, when I wanted to release it I didn't know any good name for it. I asked my friend and he didn't know either, so I just chose my friends name and added an X to it! :D",
	},
	{
		name = "Help",
		text = "If there is anything patched, not the most recent update, broken or anything else please DM Darion#8863 and join the server. http://discord.gg/E64Jd89"
	},
	{
		name = "Credits",
		text = "GabX was made by Darion#8863."
	}
}


local gui = Instance.new("ScreenGui")
syn.protect_gui(gui)
gui.Parent = game.CoreGui

local openclose = Instance.new("TextButton")
openclose.Parent = gui
openclose.Name = "OpenClose"
openclose.Style = Enum.ButtonStyle.RobloxRoundButton
openclose.Font = Enum.Font.SciFi
openclose.TextSize = 25
openclose.Text = "OPEN"
openclose.ZIndex = 12
openclose.Size = UDim2.new(0, 110,0, 45)
openclose.Position = UDim2.new(0, 0,0.791, 0)

local top = Instance.new("Frame")
top.Parent = gui
top.Name = "Topbar"
top.BorderSizePixel = 0
top.BackgroundColor3 = Color3.new((192 / 255), (225 / 255), (237 / 255))
top.Size = UDim2.new(0, 500, 0, 36)
top.Position = UDim2.new(0, -505, 0.5, -218)
top.Draggable = true
top.Active = true
top.ZIndex = 10
top.Visible = false

local logo = Instance.new("ImageLabel")
logo.Parent = top
logo.Name = "Logo"
logo.BorderSizePixel = 0
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://1902404068"
logo.ScaleType = Enum.ScaleType.Crop
logo.Size = UDim2.new(0, 140, 0, 36)
logo.Position = UDim2.new(0.5, -70, 0, 0)
logo.ZIndex = 11

local main = Instance.new("Frame")
main.Parent = top
main.Name = "MainFrame"
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BackgroundTransparency = 0.2
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(1, 0, 0, 400)
main.ZIndex = 10

local tabsf = Instance.new("Frame")
tabsf.Parent = main
tabsf.Name = "Tabs"
tabsf.BorderSizePixel = 0
tabsf.BackgroundTransparency = 1
tabsf.Position = UDim2.new(0, 0, 0, 0)
tabsf.Size = UDim2.new(0, 100, 1, 0)


openclose.MouseButton1Click:connect(function()
	if top.Visible then
		openclose.Text = "OPEN"
		top:TweenPosition(UDim2.new(0, -505, 0.5, -218))
		wait(1.05)
		top.Visible = false
	else
		openclose.Text = "CLOSE"
		top.Visible = true
		top:TweenPosition(UDim2.new(0.5, -250, 0.5, -218))
		wait(1.05)
	end 
end)

local current = "Scripts"
for i1, tab in ipairs(tabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, (i1 - 1) * 30)
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local tabfr = Instance.new("Frame")
	tabfr.Parent = main
	tabfr.Name = tab.name
	tabfr.BorderSizePixel = 0
	tabfr.BackgroundTransparency = 1
	tabfr.Size = UDim2.new(0, 390, 1, -10)
	tabfr.Position = UDim2.new(0, 105, 0, 5)
	if tab.name ~= current then
		tabfr.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		tabfr.Visible = true 
	end)
	
	if tab.comingsoon then
		local text = Instance.new("TextLabel")
		text.Parent = tabfr
		text.BorderSizePixel = 0
		text.BackgroundTransparency = 1
		text.BackgroundColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.SciFi
		text.TextSize = 60
		text.Text = "Coming Soon!"
		text.Position = UDim2.new(0, 0, 0, 0)
		text.Size = UDim2.new(1, 0, 0, 100)
		text.ZIndex = 11
	else
		for i2, scr in ipairs(tab.scripts) do
			local scrbtn = Instance.new("TextButton")
			scrbtn.Parent = tabfr
			scrbtn.Name = scr[1]
			scrbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
			scrbtn.Position = UDim2.new(0, ((i2 - 1) % 4) * 100, 0, math.floor((i2 - 1) / 4) * 50)
			scrbtn.Size = UDim2.new(0, 90, 0, 40)
			scrbtn.TextSize = 14
			scrbtn.TextScaled = true
			scrbtn.TextScaled = false
			scrbtn.Font = Enum.Font.SciFi
			scrbtn.Text = scr[1]
			scrbtn.ZIndex = 11
			
			scrbtn.MouseButton1Click:connect(function()
				loadstring(game:HttpGet(scr[2], true))()
			end)
		end
	end
end
for i,tab in ipairs(othertabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name 
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, 314 + ((i - 1) * 30))
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local text = Instance.new("TextLabel")
	text.Parent = main
	text.Name = tab.name 
	text.BorderSizePixel = 0
	text.BackgroundTransparency = 0.2
	text.BackgroundColor3 = Color3.new(1, 1, 1)
	text.Size = UDim2.new(0, 390, 1, -10)
	text.Position = UDim2.new(0, 105, 0, 5)
	text.Text = tab.text
	text.Font = Enum.Font.SciFi
	text.TextSize = 20
	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextYAlignment = Enum.TextYAlignment.Top
	text.TextWrapped = true
	text.ZIndex = 11 
	if tab.name ~= current then
		text.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		text.Visible = true 
	end)
end

end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

   local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- JailBreak
elseif game.PlaceId == 606849621 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")




local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
   local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

MainSection:NewButton("Auto Arrest V2", "Arrest", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/HazeWasTaken/Jailbricked/main/AutoArrest.lua'))()
end)

MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("Auto Rob", "Rob stores", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/wawsdasdacx/ohascriptnrrewading/main/jbsaxcriptidk1'))()
end)

MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

MainSection:NewButton("ESP/Aimbot", "bro", function()
   local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")

--Properties:
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 1
Frame.Position = UDim2.new(0, 0, 0.876175702, 0)
Frame.Size = UDim2.new(0, 100, 0, 84)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.Size = UDim2.new(0, 100, 0, 34)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = "Press E To Lock-On"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 11

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.Position = UDim2.new(0, 0, 0.40476191, 0)
TextLabel_2.Size = UDim2.new(0, 100, 0, 25)
TextLabel_2.Font = Enum.Font.SciFi
TextLabel_2.Text = "Press T To Start ESP"
TextLabel_2.TextColor3 = Color3.new(0, 0, 0)
TextLabel_2.TextSize = 11

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_3.Position = UDim2.new(0, 0, 0.702380955, 0)
TextLabel_3.Size = UDim2.new(0, 100, 0, 25)
TextLabel_3.Font = Enum.Font.Gotham
TextLabel_3.Text = "Press L To Loop-ESP"
TextLabel_3.TextColor3 = Color3.new(0, 0, 0)
TextLabel_3.TextSize = 10
pcall(function()
local espcolor = Color3.fromRGB(140, 69, 102)
local wallhack_esp_transparency = .4
local gui_hide_button = {Enum.KeyCode.LeftControl, "h"}
local plrs = game:GetService("Players")
local lplr = game:GetService("Players").LocalPlayer
local TeamBased = true ; local teambasedswitch = "o"
local presskeytoaim = true; local aimkey = "e"
aimbothider = false; aimbothiderspeed = .5
local Aim_Assist = false ; Aim_Assist_Key = {Enum.KeyCode.LeftControl, "z"}
local espupdatetime = 5; autoesp = false; local charmsesp = true
local movementcounting = true




local mouselock = false
local canaimat = true
local lockaim = true; local lockangle = 5
local ver = "2.4"
local cam = game.Workspace.CurrentCamera
local BetterDeathCount = true
local ballisticsboost = 0

local mouse = lplr:GetMouse()
local switch = false
local key = "k"
local aimatpart = nil
local lightesp = false

local abs = math.abs

local Gui = Instance.new("ScreenGui")
local Move = Instance.new("Frame")
local Main = Instance.new("Frame")
local EspStatus = Instance.new("TextLabel")
local st1 = Instance.new("TextLabel")
local st1_2 = Instance.new("TextLabel")
local st1_3 = Instance.new("TextBox")
local Name = Instance.new("TextLabel")
--Properties:

Gui.Parent = plrs.LocalPlayer:WaitForChild("PlayerGui")


local aimbotstatus = {"qc", "qr", "qe", "qd", "qi", "qt", "qs", "dd", "sp", "ql", "qa", "qd", "qs"}
local gotstring = 0
local function getrandomstring()
    gotstring = gotstring+666
    local str = ""
    local randomstring = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "g", "k", "l", "m", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
         "а","б","в","г","д","е","ё","ж","з","и","й","к","л","м","о","п","р","с","т","у","ф","х","ч","щ","ъ","ы","ъ","э","ю","я", "`", "$", 
        "0","1","2","3","4","5","6","7","8","9", }
    local counting123 = 0
    for i, v in ipairs(randomstring) do
        counting123 = i
    end
    do
        math.randomseed(tick()+gotstring)
        for i = 3, math.random(1,100) do
                math.randomseed(i+tick()+gotstring)
                
                local oneortwo = math.random(1,2)
                if oneortwo == 2 then
                    math.randomseed(i+tick()+gotstring)
                    str = str..""..randomstring[math.random(1, counting123)]
                else
                    math.randomseed(i+tick()+gotstring)
                    str = str..""..string.upper(randomstring[math.random(1, counting123)])
                end
            
        end
    end
    return str
end
local mousedown = false
local isonmovething = false
local mouseoffset = Vector2.new()
local mousedown = false
local bspeed = 3584
local aimbotoffset = {dd = ":", sp = " ", qa = "a", qb = "b",qc = "c", qd = "d", qe = "e", qf = "f", qg = "g" , qh = "h" , qi = "i", qj = "j", qk = "k", ql = "l", qm = "m", qn = "n", qo = "o", qp = "p", qq = "q", qr = "r", qs = "s", qt = "t", qu = "u", qv = "w", qx = "x", qy = "y", qz = "z"}



Gui.Name = getrandomstring()

Move.Name = getrandomstring()
Move.Draggable = true
Move.Parent = Gui
Move.BackgroundColor3 = Color3.new(0.0431373, 1, 0.0745098)
Move.BackgroundTransparency = 0.40000000596046
Move.BorderSizePixel = 0
Move.Position = UDim2.new(0.5, 0,0.018, 0)
Move.Size = UDim2.new(0, 320, 0, 30)

Move.MouseEnter:Connect(function()
    
    isonmovething = true
    
end)
Move.MouseLeave:Connect(function()
    
    isonmovething = mousedown and true or false
end)
mouse.Button1Down:connect(function()
    mousedown = true
    mouseoffset = Move.AbsolutePosition - Vector2.new(mouse.X, mouse.Y)
end)
mouse.Button1Up:connect(function()
    mousedown = false
end)

mouse.Move:Connect(function()
    if isonmovething == true and mousedown then
        Move.Position = UDim2.new(0, mouseoffset.X + mouse.X, 0, mouseoffset.Y + mouse.Y)
    end
end)
local function uc (st)
    local ast = ""
    for i, v in ipairs(st) do
        local let = aimbotoffset[v]
        ast = ast..let
    end
    return ast
end

Main.Name = getrandomstring()
Main.Parent = Move
Main.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
Main.BackgroundTransparency = 0.69999998807907
Main.Position = UDim2.new(0, 0, 0.995670795, 0)
Main.Size = UDim2.new(1.0000006, 0, 11.2, 0)

st1.Name = getrandomstring()
st1.Parent = Main
st1.BackgroundColor3 = Color3.new(1, 1, 1)
st1.BackgroundTransparency = 1
st1.Position = UDim2.new(0, 0, 0, 0)
st1.Size = UDim2.new(1, 0, 0.161862016, 0)
st1.Font = Enum.Font.ArialBold
st1.Text = uc(aimbotstatus)
st1.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1.TextScaled = true
st1.TextSize = 14
st1.TextWrapped = true

st1_2.Name = getrandomstring()
st1_2.Parent = Main
st1_2.BackgroundColor3 = Color3.new(1, 1, 1)
st1_2.BackgroundTransparency = 1
st1_2.Position = UDim2.new(0, 0, 0.375590861, 0)
st1_2.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_2.Font = Enum.Font.ArialBold
st1_2.TextXAlignment = Enum.TextXAlignment.Left
st1_2.Text = "Current ballistics: 0"
st1_2.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1_2.TextScaled = true
st1_2.TextSize = 14
st1_2.TextWrapped = true

local aimbothiderbox = Instance.new("TextBox")
aimbothiderbox.Name = getrandomstring()
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
aimbothiderbox.Size = UDim2.new(1, 0,0.162, 0)
aimbothiderbox.TextScaled = true
aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
aimbothiderbox.Position = UDim2.new(0, 0,0.853, 0)
aimbothiderbox.BackgroundTransparency = 1
aimbothiderbox.Parent = Main

st1_3.Name = getrandomstring()
st1_3.Parent = Main
st1_3.BackgroundColor3 = Color3.new(1, 1, 1)
st1_3.BackgroundTransparency = 1
st1_3.Position = UDim2.new(0, 0, 0.18558608, 0)
st1_3.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_3.Font = Enum.Font.ArialBold
st1_3.Text = "Bullet speed = 3584"
st1_3.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1_3.TextScaled = true
st1_3.TextSize = 14
st1_3.TextWrapped = true
local teambasedstatus = st1_3:Clone()
teambasedstatus.Parent = Main
teambasedstatus.TextScaled = true
teambasedstatus.Position = UDim2.new(0, 0,.7, 0)
teambasedstatus.Size = UDim2.new(1, 0,.1, 0)
teambasedstatus.Name = getrandomstring()
teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
local espstatustext = teambasedstatus:Clone()
espstatustext.Name = getrandomstring()
espstatustext.Position = UDim2.new(0, 0,0.58, 0)
espstatustext.Text = "Esp loop :"..tostring(autoesp)
espstatustext.Parent = Main
local hide = Instance.new("TextButton")
hide.Text = "_"
hide.BackgroundTransparency = 1
hide.TextScaled = true
hide.TextWrapped = true
hide.Size = UDim2.new(0.1, 0,1, 0)
hide.Position = UDim2.new(0.9, 0,-0.15, 0)
hide.Name = getrandomstring()
hide.Parent = Move
Name.Name = getrandomstring()
Name.Parent = Move
Name.BackgroundColor3 = Color3.new(1, 1, 1)
Name.BackgroundTransparency = 1
Name.Size = UDim2.new(0.838, 0, 1, 0)
Name.Font = Enum.Font.Arial
Name.Text = "FPS gui v"..ver
Name.TextColor3 = Color3.new(0, 0, 0)
Name.TextScaled = true
Name.TextSize = 14
Name.TextWrapped = true
Name.TextXAlignment = Enum.TextXAlignment.Left
local scr = Instance.new("ScrollingFrame")
scr.Size = Main.Size
scr.Position = Main.Position
scr.ScrollBarThickness = 0
scr.BackgroundTransparency = 1
scr.Name = getrandomstring()
Main.Size = UDim2.new(1, 0, 1, 0)
Main.Position = UDim2.new(0,0,0,0)
Main.Parent = scr
scr.Parent = Move
startpos = Main.Position
Move.Active = true
Move:Destroy()
-- Scripts:
hided = true
hide.MouseButton1Click:Connect(function()
    if hided == false then
        hided = true
        Main:TweenPosition(UDim2.new(0, 0, -1.5, 0))
    else
        hided = false
        Main:TweenPosition(startpos)
    end
end)


aimbothiderbox.FocusLost:Connect(function()
    local numb = tonumber(aimbothiderbox.Text)
    if aimbothider == true then
        aimbothiderbox.TextColor3 =Color3.fromRGB(11, 255, 19)
    else
        aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
    end
    if numb ~= nil then
        aimbothiderspeed = numb
        if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
    else
        if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
    end
end)


local plrsforaim = {}


Move.Draggable = true
Gui.ResetOnSpawn = false
--Gui.Name = "Chat"
Gui.DisplayOrder = 999
pcall(function()
if not game:GetService("CoreGui") then
    Gui.Parent = plrs.LocalPlayer.PlayerGui
else
    Gui.Parent = game:GetService("CoreGui")
end
end)
local espheadthing
do
local BillboardGui = Instance.new("BillboardGui")
local PName = Instance.new("TextLabel")
local Pdist = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local ImageLabel_2 = Instance.new("ImageLabel")
--Properties:
--BillboardGui.Parent = game.Workspace.Part
BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui.AlwaysOnTop = true
BillboardGui.LightInfluence = 0
BillboardGui.Size = UDim2.new(0, 100, 0, 46)
BillboardGui.Name = "headoverthing"
PName.Name = "PName"
PName.Parent = BillboardGui
PName.BackgroundColor3 = espcolor
PName.BackgroundTransparency = 0.55000001192093
PName.BorderSizePixel = 0
PName.Size = UDim2.new(0, 100, 0, 23)
PName.Font = Enum.Font.SourceSans
PName.Text = "urmom"
PName.TextColor3 = Color3.new(0, 0, 0)
PName.TextScaled = true
PName.TextSize = 14
PName.TextWrapped = true
st1.Text = uc(aimbotstatus)
Pdist.Name = "Pdist"
Pdist.Parent = BillboardGui
Pdist.AnchorPoint = Vector2.new(0.5, 0)
Pdist.BackgroundColor3 = espcolor
Pdist.BackgroundTransparency = 0.55000001192093
Pdist.BorderSizePixel = 0
Pdist.Position = UDim2.new(0.5, 0, 0.5, 0)
Pdist.Size = UDim2.new(0, 70, 0, 23)
Pdist.Font = Enum.Font.SourceSans
Pdist.Text = "666"
Pdist.TextColor3 = Color3.new(0, 0, 0)
Pdist.TextScaled = true
Pdist.TextSize = 14
Pdist.TextWrapped = true

ImageLabel.Parent = BillboardGui
ImageLabel.BackgroundColor3 = Color3.new(0.298039, 1, 0)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = espcolor
ImageLabel.Position = UDim2.new(1, -15, 0.5, 0)
ImageLabel.Rotation = 180
ImageLabel.Size = UDim2.new(0, 15, 0, 23)
ImageLabel.Image = "rbxassetid://2832171824"
ImageLabel.ImageColor3 = espcolor
ImageLabel.ImageTransparency = 0.55000001192093

ImageLabel_2.Parent = BillboardGui
ImageLabel_2.BackgroundColor3 = espcolor
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.BorderColor3 = Color3.new(0.298039, 1, 0)
ImageLabel_2.Position = UDim2.new(0, 0, 0.5, 0)
ImageLabel_2.Rotation = 180
ImageLabel_2.Size = UDim2.new(0, 15, 0, 23)
ImageLabel_2.Image = "rbxassetid://2832177613"
ImageLabel_2.ImageColor3 = espcolor
ImageLabel_2.ImageTransparency = 0.55000001192093
espheadthing = BillboardGui
end



f = {}
f.UpdateHeadUI = function(v)
    
        
            if v.Adornee and v.Adornee ~= nil then
                local destr = false
                if TeamBased then
                    destr = true
                    local plr = plrs:GetPlayerFromCharacter(v.Adornee.Parent)
                    if plr and plr.Team and plr.Team.Name ~= lplr.Team.Name then
                        destr = false
                    end
                end
                if lightesp == true then
                    v.Pdist.TextColor3 = Color3.new(1,1,1)
                    v.PName.TextColor3 = Color3.new(1,1,1)
                else
                    v.Pdist.TextColor3 = Color3.new(0,0,0)
                    v.PName.TextColor3 = Color3.new(0,0,0)
                end
                local d = math.floor((cam.CFrame.p - v.Adornee.CFrame.p).magnitude)
                v.Pdist.Text = tostring(d)
                if d < 14 then
                    v.Enabled = false
                else
                    v.Enabled = true
                end
                v.StudsOffset = Vector3.new(0,.6+d/14,0)
                if destr then
                    v:Destroy()
                end
            else
                v:Destroy()
            end
        
    
end
st1.Text = uc(aimbotstatus)
local espforlder
local partconverter = Instance.new("Part")
--local headsupdatelist = {}
st1_3.FocusLost:connect(function()
    if tonumber(st1_3.Text) then
        bspeed = tonumber(st1_3.Text)
    else
        
    end
end)
f.addesp = function()
    pcall(function()
    --print("ESP ran")
    if espforlder then
        espforlder:Destroy()
        espforlder = Instance.new("Folder")
        espforlder.Parent = game.Workspace.CurrentCamera
    else
        espforlder = Instance.new("Folder")
        espforlder.Parent = game.Workspace.CurrentCamera
    end
    for i, v in pairs(espforlder:GetChildren()) do
        v:Destroy()
    end
    for _, plr in pairs(plrs:GetChildren()) do
        if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Name ~= lplr.Name then
            if TeamBased == true then
                
                if plr.Team.Name ~= plrs.LocalPlayer.Team.Name  then
                    pcall(function()
                    local e = espforlder:FindFirstChild(plr.Name)
                    if not e then
                        local fold = Instance.new("Folder", espforlder)
                        fold.Name = plr.Name
                        
                        --partconverter.BrickColor = plr.Team.Color
                        --local teamc = partconverter.Color
                        for i, p in pairs(plr.Character:GetChildren()) do
                            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                                if charmsesp then
                                local urmom = Instance.new("BoxHandleAdornment")
                                urmom.ZIndex = 10
                                urmom.AlwaysOnTop = true
                                urmom.Color3 = espcolor
                                urmom.Size = p.Size
                                urmom.Adornee = p
                                urmom.Name = tick().." Ur mom has big gay"
                                urmom.Transparency = wallhack_esp_transparency
                                urmom.Parent = fold
                                if p.Name == "Head" then
                                    local th = p:FindFirstChild("headoverthing")
                                    if not th then
                                        local ht = espheadthing:Clone()
                                        ht.PName.Text = p.Parent.Name
                                        ht.Adornee = p
                                        --table.insert(headsupdatelist, ht)
                                        delay(0, function()
                                            while wait(0.08) and plr and p do
                                                f.UpdateHeadUI(ht)
                                            end
                                        end)
                                        ht.Parent = p
                                    end
                                end
                                end
                            end
                        end
                        plr.Character.Humanoid.Died:Connect(function()
                            fold:Destroy()
                        end)
                        
                    end
                    end)
                end
            else
                local e = espforlder:FindFirstChild(plr.Name)
                if not e then
                    local fold = Instance.new("Folder", espforlder)
                        fold.Name = plr.Name
                        
                        --partconverter.BrickColor = plr.Team.Color
                        --local teamc = Move.BackgroundColor3
                        for i, p in pairs(plr.Character:GetChildren()) do
                            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                                pcall(function()
                                if charmsesp then
                                local urmom = Instance.new("BoxHandleAdornment")
                                urmom.ZIndex = 10
                                urmom.AlwaysOnTop = true
                                urmom.Color3 = espcolor
                                urmom.Size = p.Size
                                urmom.Adornee = p
                                urmom.Name = tick().." Ur mom has big gay"
                                urmom.Transparency = wallhack_esp_transparency
                                urmom.Parent = fold
                                end
                                if p.Name == "Head" then
                                    local th = p:FindFirstChild("headoverthing")
                                    if not th then
                                        local ht = espheadthing:Clone()
                                        ht.PName.Text = p.Parent.Name
                                        ht.Adornee = p
                                        delay(0, function()
                                            while wait(0.08) and plr and p do
                                                f.UpdateHeadUI(ht)
                                            end
                                        end)
                                        --table.insert(headsupdatelist, ht)
                                        ht.Parent = p
                                    end
                                end
                                end)
                            end
                        end
                        plr.Character.Humanoid.Died:Connect(function()
                            fold:Destroy()
                        end)
                end
            end
            
            
        end
    end
    end)
end

local uis = game:GetService("UserInputService")
local bringall = false
local hided2 = false
local upping = false
local downing = false
mouse.KeyDown:Connect(function(a)
    
    if a == "t" then
        --print("worked1")
        f.addesp()
    elseif a == gui_hide_button[2] and uis:IsKeyDown(gui_hide_button[1]) then
        if hided2 == false then
            hided2 = true
            autoesp =false
            if espforlder then
                espforlder:Destroy()
            end
            Gui.Enabled = false
        else
            Gui.Enabled = true
            hided2 = false
        end
            
    elseif a == "" then
        if aimbothider == false then
            aimbothider = true
            if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
        else
            
            aimbothider = false
            if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
        end
        if aimbothider == true then
            aimbothiderbox.TextColor3 =Color3.fromRGB(11, 255, 19)
        else
            aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
        end
    elseif a == "l" then
        if not uis:IsKeyDown(Enum.KeyCode.LeftControl) then
            if autoesp == false then
                autoesp = true
            else
                autoesp = false
            end
        else
            if lightesp == true then
                lightesp = false
            else
                lightesp = true
            end
        end
    elseif a == "]" then
        upping = true
        downing = false
    elseif a== "[" then
        downing = true
        upping = false
    elseif a == Aim_Assist_Key[2] and uis:IsKeyDown(Aim_Assist_Key[1]) then
        if Aim_Assist == true then
            Aim_Assist = false
            --print("disabled")
        else
            Aim_Assist = true
        end
    end
    if a == "j" then
        if mouse.Target then
            mouse.Target:Destroy()
        end
    end
    if a == key then
        if switch == false then
            switch = true
        else
            switch = false
            if aimatpart ~= nil then
                aimatpart = nil
            end
        end
    elseif a == "b" and uis:IsKeyDown(Enum.KeyCode.LeftControl) and not uis:IsKeyDown(Enum.KeyCode.R) then
        if movementcounting then
            movementcounting = false
        else
            movementcounting = true
        end
    elseif a == teambasedswitch then
        if TeamBased == true then
            TeamBased = false
            teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
        else
            TeamBased = true
            teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
        end
    elseif a == "b" and uis:IsKeyDown(Enum.KeyCode.LeftControl) and uis:IsKeyDown(Enum.KeyCode.R) then
        ballisticsboost = 0
    elseif a == aimkey then
        if not aimatpart then
            local maxangle = math.rad(20)
            for i, plr in pairs(plrs:GetChildren()) do
                if plr.Name ~= lplr.Name and plr.Character and plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 1 then
                    if TeamBased == true then
                        if plr.Team.Name ~= lplr.Team.Name then
                            local an = checkfov(plr.Character.Head)
                            if an < maxangle then
                                maxangle = an
                                aimatpart = plr.Character.Head
                            end
                        end
                    else
                        local an = checkfov(plr.Character.Head)
                            if an < maxangle then
                                maxangle = an
                                aimatpart = plr.Character.Head
                            end
                            --print(plr)
                    end
                    local old = aimatpart
                    plr.Character.Humanoid.Died:Connect(function()
                        --print("died")
                        if aimatpart and aimatpart == old then
                            aimatpart = nil
                        end
                    end)
                    
                end
            end
        else
            aimatpart = nil
            canaimat = false
            delay(1.1, function()
                canaimat = true
            end)
        end
    end
end)

function getfovxyz (p0, p1, deg)
    local x1, y1, z1 = p0:ToOrientation()
    local cf = CFrame.new(p0.p, p1.p)
    local x2, y2, z2 = cf:ToOrientation()
    local d = math.deg
    if deg then
        return Vector3.new(d(x1-x2), d(y1-y2), d(z1-z2))
    else
        return Vector3.new((x1-x2), (y1-y2), (z1-z2))
    end
end


function aimat(part)
    if part then
        --print(part)
        local d = (cam.CFrame.p - part.CFrame.p).magnitude
        local calculatedrop
        local timetoaim = 0
        local pos2 = Vector3.new()
        if movementcounting == true then
            timetoaim = d/bspeed
            pos2 = part.Velocity * timetoaim
        end
        local minuseddrop = (ballisticsboost+50)/50
        if ballisticsboost ~= 0 then
            calculatedrop = d - (d/minuseddrop)
            
        else
            calculatedrop = 0
        end
        --print(calculatedrop)
        local addative = Vector3.new()
        if movementcounting then
            addative = pos2
        end
        local cf = CFrame.new(cam.CFrame.p, (addative + part.CFrame.p+ Vector3.new(0, calculatedrop, 0)))
        if aimbothider == true or Aim_Assist == true then
            cam.CFrame = cam.CFrame:Lerp(cf, aimbothiderspeed)
        else
            
            cam.CFrame = cf
        end
        --print(cf)
    end
end
function checkfov (part)
    local fov = getfovxyz(game.Workspace.CurrentCamera.CFrame, part.CFrame)
    local angle = math.abs(fov.X) + math.abs(fov.Y)
    return angle
end
pcall(function()
    delay(0, function()
        while wait(.32) do
            if Aim_Assist and not aimatpart and canaimat and lplr.Character and lplr.Character.Humanoid and lplr.Character.Humanoid.Health > 0 then
                for i, plr in pairs(plrs:GetChildren()) do
                    
                    
                        local minangle = math.rad(5.5)
                        local lastpart = nil
                        local function gg(plr)
                            pcall(function()
                            if plr.Name ~= lplr.Name and plr.Character and plr.Character.Humanoid and plr.Character.Humanoid.Health > 0 and plr.Character.Head then
                                local raycasted = false
                                local cf1 = CFrame.new(cam.CFrame.p, plr.Character.Head.CFrame.p) * CFrame.new(0, 0, -4)
                                local r1 = Ray.new(cf1.p, cf1.LookVector * 9000)
                                local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
                                local dist = (plr.Character.Head.CFrame.p- pos).magnitude
                                if dist < 4 then
                                    raycasted = true
                                end
                                if raycasted == true then
                                    local an1 = getfovxyz(cam.CFrame, plr.Character.Head.CFrame)
                                    local an = abs(an1.X) + abs(an1.Y)
                                    if an < minangle then
                                        minangle = an
                                        lastpart = plr.Character.Head
                                    end
                                end
                            end
                            end)
                        end
                        if TeamBased then
                            if plr.Team.Name ~= lplr.Team.Name then
                                gg(plr)
                            end
                        else
                            gg(plr)
                        end
                        --print(math.deg(minangle))
                        if lastpart then
                            aimatpart = lastpart
                            aimatpart.Parent.Humanoid.Died:Connect(function()
                                if aimatpart == lastpart then
                                    aimatpart = nil
                                end
                            end)
                        
                    end
                end
            end
        end
    end)
end)
local oldheadpos
local lastaimapart
game:GetService("RunService").RenderStepped:Connect(function(dt)
    if uis:IsKeyDown(Enum.KeyCode.RightBracket) or uis:IsKeyDown(Enum.KeyCode.LeftBracket) then
        if upping then
            ballisticsboost = ballisticsboost + dt/1.9
        elseif downing then
            ballisticsboost = ballisticsboost - dt/1.9
        end
    end
    if movementcounting then
        st1_2.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
        st1_2.Text = "Current ballistics: "..tostring(math.floor(ballisticsboost*10)/10)
    else
        st1_2.TextColor3 = Color3.new(1,0,0)
    end
    espstatustext.Text = "Esp loop :"..tostring(autoesp)
    if aimatpart and lplr.Character and lplr.Character.Head then
        if BetterDeathCount and lastaimapart and lastaimapart == aimatpart then
            local dist = (oldheadpos - aimatpart.CFrame.p).magnitude
            if dist > 40 then
                aimatpart = nil
            end
        end
        lastaimapart = aimatpart
        oldheadpos = lastaimapart.CFrame.p
        do 
            if aimatpart.Parent == plrs.LocalPlayer.Character then
                aimatpart = nil
            end
            aimat(aimatpart)
            pcall(function()
                if Aim_Assist == true then
                    local cf1 = CFrame.new(cam.CFrame.p, aimatpart.CFrame.p) * CFrame.new(0, 0, -4)
                    local r1 = Ray.new(cf1.p, cf1.LookVector * 1000)
                    local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
                    local dist = (aimatpart.CFrame.p- pos).magnitude
                    if obj then
                        --print(obj:GetFullName())
                    end
                    if not obj or dist > 6 then
                        aimatpart = nil
                        --print("ooof")
                    end
                    canaimat = false
                    delay(.5, function()
                        canaimat = true
                    end)
                end
            end)
        end
        
        
        
    end
end)


delay(0, function()
    while wait(espupdatetime) do
        if autoesp == true then
            pcall(function()
            f.addesp()
            end)
        end
    end
end)
--warn("loaded")
end)
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MainSection:NewButton("JailMonkey", "MASSIVE FPS DROP", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/MonkeyScripts/main/JailMonkey.lua"))()
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("GabX", "GabX", function()
   --// GabX, the script hub that has all you need! \\--
-- Made by Darion#8863

local tabs = {
	{
		name = "Scripts",
		comingsoon = false,
		scripts = {
			{
				"R2S (EnvEdit)",
				"https://pastebin.com/raw/ZAHTikfe"
			},
			{
				"Old R2S",
				"https://pastebin.com/raw/jXh45kfE"
			},
			{
				"Grab Knife V4",
				"https://pastebin.com/raw/7zK1Swpt"
			},
			{
				"Grab Knife V3",
				"https://pastebin.com/raw/TPZXG8fH"
			},
			{
				"R6 Fly(E)",
				"https://pastebin.com/raw/hTJsM2jV"
			},
			{
				"Speed",
				"https://pastebin.com/raw/mrdWh73D"
			},
			{
				"JumpPower",
				"https://pastebin.com/raw/sA5xym2V"
			},
			{
				"Loopheal",
				"https://pastebin.com/raw/vD9zjBQx"
			},
			{
				"Chat Logs",
				"https://pastebin.com/raw/mtGM0Dkh"
			},
			{
				"Audio Stealer",
				"https://pastebin.com/raw/ABRqgZ3L"
			},
			{
				"FE Check (F9)",
				"https://pastebin.com/raw/SRibuFiK"
			},
			{
				"No clip (F)",
				"https://pastebin.com/raw/bnqAE95f"
			},
			{
				"Bomb Vest",
				"https://pastebin.com/raw/S7vdifqp"
			},
			{
				"Robux Troll",
				"https://pastebin.com/raw/BHjfPXC6"
			}
		}
	},
	{
		name = "FeScripts",
		comingsoon = false,
		scripts = {
			{
				"FE God",
				"https://pastebin.com/raw/p814kXmM"
			},
			{
				"Kill/Fling",
				"https://pastebin.com/raw/Pb3PR6EL"
			},
			{
				"Shutdown",
				"https://pastebin.com/raw/RELufQFM"
			},
			{
				"Hat Spin",
				"https://pastebin.com/raw/Y8iEYKZD"
			},
			{
				"Suicide Gun",
				"https://pastebin.com/raw/SeRxrgci"
			},
			{
				"Click TP Tool",
				"https://pastebin.com/raw/16tXkJjD"
			},
			{
				"OOF Spam",
				"https://pastebin.com/raw/JaMbzp0B"
			},
			{
				"Respawn",
				"https://pastebin.com/raw/61WmHqNp"
			}
		}
	},
	{
		name = "GUIs",
		comingsoon = false,
		scripts = {
			{
				"Topk3k V4",
				"https://pastebin.com/raw/bEmmF8UH"
			},
			{
				"Arosia",
				"https://pastebin.com/raw/Nwit6ZqP"
			},
			{
				"Equinox",
				"https://pastebin.com/raw/scYFbHQb"
			},
			{
				"Ani's(R15)",
				"https://pastebin.com/raw/MenK10Ak"
			},
			{
				"Ani's(R6)",
				"https://pastebin.com/raw/Ydt76Kep"
			},
			{
				"Rose Hub",
				"https://pastebin.com/raw/1BJj0fB4"
			},
			{
				"OPFinality",
				"https://pastebin.com/raw/fG5b1zrM"
			},
			{
				"Old OPHub",
				"https://pastebin.com/raw/FxhQbqsp"
			},
			{
				"HyperTotal",
				"https://pastebin.com/raw/aYdepQa0"
			},
			{
				"Clown Van",
				"https://pastebin.com/raw/0uJXBEmN"
			},
			{
				"Sern Hub",
				"https://pastebin.com/raw/8sD7V8xp"
			},
			{
				"Cooler Kids V2",
				"https://pastebin.com/raw/GGQeWXSL"
			},
			{
				"Ping/FPS",
				"https://pastebin.com/raw/Qh8eeWF7"
			},
			{
				"Spectate",
				"https://pastebin.com/raw/WgpJfMGS"
			},
			{
				"Ro-xploit",
				"https://pastebin.com/raw/ZkhCcaa5"
			},
			{
				"TP GUI",
				"https://pastebin.com/raw/EBhdqeWb"
			}
		}
	},
	{
		name = "Commands",
		comingsoon = false,
		scripts = {
			{
				"BTools",
				"https://pastebin.com/raw/752Gzv1G"
			},
			{
				"Ghost",
				"https://pastebin.com/raw/aiYL4LKV"
			},
			{
				"Big pp",
				"https://pastebin.com/raw/xAcpS2Ze"
			},
			{
				"Inf Jump",
				"https://pastebin.com/raw/Dz61QSir"
			}
		}
	},
	{
		name = "Stat Change",
		comingsoon = false,
		scripts = {
			{
				"Clone Tycoon 2",
				"https://pastebin.com/raw/ga02bJq5"
			},
			{
				"Naruto Final Bond LVL",
				"https://pastebin.com/raw/j5gYsnxM"
			},
			{
				"Shinobi Life",
				"https://pastebin.com/raw/rpWG7xBj"
			},
			{
				"Rocitizens",
				"https://pastebin.com/raw/P3WAujA9"
			},
			{
				"Naruto New Gen",
				"https://pastebin.com/raw/34Fdq480"
			},
			{
				"False DBFP",
				"https://pastebin.com/raw/tTCcVDAf"
			},
			{
				"Jaws",
				"https://pastebin.com/raw/RkNJ3jn2"
			},
			{
				"Giant Survival 2",
				"https://pastebin.com/raw/sbme5pNF"
			},
			{
				"One Piece Unleashed 2",
				"https://pastebin.com/raw/QAgtrGdX"
			},
			{
				"Tuber Simulator",
				"https://pastebin.com/raw/zy1dFtrc"
			},
			{
				"Yard Work Simulator",
				"https://pastebin.com/raw/udKYdRpW"
			},
			{
				"Dragon Ball Super 2",
				"https://pastebin.com/raw/U5i77x2T"
			},
			{
				"Avatar: Legend of Kora",
				"https://pastebin.com/raw/ggcfAQcH"
			}
		}
	},
	{
		name = "Games",
		comingsoon = false,
		scripts = {
			{
				"NRPG Beyond Fast Shoot",
				"https://pastebin.com/raw/zXCvQxRF"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Jailbreak AFK",
				"https://pastebin.com/raw/hhRca3cj"
			},
			{
				"Jailbreak GUI",
				"https://pastebin.com/raw/CQFw06tN"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Lumber Tycoon",
				"https://pastebin.com/raw/33kYAahS"
			},
			{
				"Phantom Forces",
				"https://pastebin.com/raw/LgQEjvxS"
			},
			{
				"Hilton Hotels",
				"https://pastebin.com/raw/QfHywxaZ"
			},
			{
				"Work At A Pizza Place",
				"https://pastebin.com/raw/KyfBZCKL"
			},
			{
				"Prison Royale",
				"https://pastebin.com/raw/0W4QBB5C"
			},
			{
				"Greenwood Town",
				"https://pastebin.com/raw/96JTe9Gd"
			},
			{	
				"Naruto Final Bond",
				"https://pastebin.com/raw/ujKgVWBn"
			},
			{	"Project Pokemon",
				"https://pastebin.com/raw/jDTLJf9Z"
			},
			{	"Scuba Diving",
				"https://pastebin.com/raw/NwSeijRv"
			}
		}
	},
	{
		name = "Admins",
		comingsoon = false,
		scripts = {
			{
				"Infinite Yield",
				"https://pastebin.com/raw/MjBzRjmT"
			},
			{
				"Rocky's",
				"https://pastebin.com/raw/3V4s9UPx"
			},
			{
				"Dex Explorer",
				"https://pastebin.com/raw/eqy8yt4q"
			},
			{
				"N3xulis",
				"https://pastebin.com/raw/eKkbtM3A"
			},
			{
				"ARX Admin",
				"https://pastebin.com/raw/4PGmJv5R"
			},
			{
				"Shattervast",
				"https://pastebin.com/raw/44bNjECt"
			},
			{
				"Filter My Ass",
				"https://pastebin.com/raw/Tn1xz43y"
			},
			{
				"C00lgui",
				"https://pastebin.com/raw/Xt0S28mx"
			},
			{
				"Mayem",
				"https://pastebin.com/raw/tWQnvRqH"
			},
			{
				"Nosyliam",
				"https://pastebin.com/raw/FmeiVpiE"
			},
			{
				"Your Mom V2",
				"https://pastebin.com/raw/1FsNUZHq"
			},
			{
				"PME Safazi",
				"https://pastebin.com/raw/yrnDMLYs"
			}
		}
	},
	{
		name = "Forms",
		comingsoon = false,
		scripts = {
			{
				"Madara",
				"https://pastebin.com/raw/LYjZdycr"
			},
			{
				"Shadow Titan",
				"https://pastebin.com/raw/E7b9cy1h"
			},
			{
				"Assasin",
				"https://pastebin.com/raw/bKu2GuzN"
			},
			{
				"Beast Claws",
				"https://pastebin.com/raw/0AH8SZTJ"
			},
			{
				"6 Swords",
				"https://pastebin.com/raw/80juE2kw"
			},
			{
				"Goku SSJ3",
				"https://pastebin.com/raw/vFmVuXk4"
			},
			{
				"OmagaV2",
				"https://pastebin.com/raw/VSerZV3e"
			},
			{
				"Absalom Titan",
				"https://pastebin.com/raw/ZmySaMrb"
			},
			{
				"Ace",
				"https://pastebin.com/raw/fA4XSTY1"
			},
			{
				"Beerus",
				"https://pastebin.com/raw/c1TGDAKC"
			},
			{
				"DSSJ4",
				"https://pastebin.com/raw/pfdud8wK"
			},
			{
				"Zenatic",
				"https://pastebin.com/raw/wTJxmWyG"
			},
			{
				"Naruto",
				"https://pastebin.com/raw/eEN5mC9u"
			}
		}
	},
	{
		name = "Extra",
		comingsoon = true
	}
}
local othertabs = {
	{
		name = "Info",
		text = "GabX was made by a new learning scripter named Darion. It started off as a simple project to learn scripting just for myself, but I decided to release it anyways just for fun. It received quite a bit of attention and several youtube videos were made on it. I felt like I didn't deserve the support because nothing was actually made by me, I just added buttons. I decided to rewrite the UI all by myself! I did get some help in the scripting part because I'm not the best in scripting since I'm new to making scripts and exploiting related stuff in general. Now GabX has been updated and the UI was all self made! Also, when I wanted to release it I didn't know any good name for it. I asked my friend and he didn't know either, so I just chose my friends name and added an X to it! :D",
	},
	{
		name = "Help",
		text = "If there is anything patched, not the most recent update, broken or anything else please DM Darion#8863 and join the server. http://discord.gg/E64Jd89"
	},
	{
		name = "Credits",
		text = "GabX was made by Darion#8863."
	}
}


local gui = Instance.new("ScreenGui")
syn.protect_gui(gui)
gui.Parent = game.CoreGui

local openclose = Instance.new("TextButton")
openclose.Parent = gui
openclose.Name = "OpenClose"
openclose.Style = Enum.ButtonStyle.RobloxRoundButton
openclose.Font = Enum.Font.SciFi
openclose.TextSize = 25
openclose.Text = "OPEN"
openclose.ZIndex = 12
openclose.Size = UDim2.new(0, 110,0, 45)
openclose.Position = UDim2.new(0, 0,0.791, 0)

local top = Instance.new("Frame")
top.Parent = gui
top.Name = "Topbar"
top.BorderSizePixel = 0
top.BackgroundColor3 = Color3.new((192 / 255), (225 / 255), (237 / 255))
top.Size = UDim2.new(0, 500, 0, 36)
top.Position = UDim2.new(0, -505, 0.5, -218)
top.Draggable = true
top.Active = true
top.ZIndex = 10
top.Visible = false

local logo = Instance.new("ImageLabel")
logo.Parent = top
logo.Name = "Logo"
logo.BorderSizePixel = 0
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://1902404068"
logo.ScaleType = Enum.ScaleType.Crop
logo.Size = UDim2.new(0, 140, 0, 36)
logo.Position = UDim2.new(0.5, -70, 0, 0)
logo.ZIndex = 11

local main = Instance.new("Frame")
main.Parent = top
main.Name = "MainFrame"
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BackgroundTransparency = 0.2
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(1, 0, 0, 400)
main.ZIndex = 10

local tabsf = Instance.new("Frame")
tabsf.Parent = main
tabsf.Name = "Tabs"
tabsf.BorderSizePixel = 0
tabsf.BackgroundTransparency = 1
tabsf.Position = UDim2.new(0, 0, 0, 0)
tabsf.Size = UDim2.new(0, 100, 1, 0)


openclose.MouseButton1Click:connect(function()
	if top.Visible then
		openclose.Text = "OPEN"
		top:TweenPosition(UDim2.new(0, -505, 0.5, -218))
		wait(1.05)
		top.Visible = false
	else
		openclose.Text = "CLOSE"
		top.Visible = true
		top:TweenPosition(UDim2.new(0.5, -250, 0.5, -218))
		wait(1.05)
	end 
end)

local current = "Scripts"
for i1, tab in ipairs(tabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, (i1 - 1) * 30)
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local tabfr = Instance.new("Frame")
	tabfr.Parent = main
	tabfr.Name = tab.name
	tabfr.BorderSizePixel = 0
	tabfr.BackgroundTransparency = 1
	tabfr.Size = UDim2.new(0, 390, 1, -10)
	tabfr.Position = UDim2.new(0, 105, 0, 5)
	if tab.name ~= current then
		tabfr.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		tabfr.Visible = true 
	end)
	
	if tab.comingsoon then
		local text = Instance.new("TextLabel")
		text.Parent = tabfr
		text.BorderSizePixel = 0
		text.BackgroundTransparency = 1
		text.BackgroundColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.SciFi
		text.TextSize = 60
		text.Text = "Coming Soon!"
		text.Position = UDim2.new(0, 0, 0, 0)
		text.Size = UDim2.new(1, 0, 0, 100)
		text.ZIndex = 11
	else
		for i2, scr in ipairs(tab.scripts) do
			local scrbtn = Instance.new("TextButton")
			scrbtn.Parent = tabfr
			scrbtn.Name = scr[1]
			scrbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
			scrbtn.Position = UDim2.new(0, ((i2 - 1) % 4) * 100, 0, math.floor((i2 - 1) / 4) * 50)
			scrbtn.Size = UDim2.new(0, 90, 0, 40)
			scrbtn.TextSize = 14
			scrbtn.TextScaled = true
			scrbtn.TextScaled = false
			scrbtn.Font = Enum.Font.SciFi
			scrbtn.Text = scr[1]
			scrbtn.ZIndex = 11
			
			scrbtn.MouseButton1Click:connect(function()
				loadstring(game:HttpGet(scr[2], true))()
			end)
		end
	end
end
for i,tab in ipairs(othertabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name 
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, 314 + ((i - 1) * 30))
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local text = Instance.new("TextLabel")
	text.Parent = main
	text.Name = tab.name 
	text.BorderSizePixel = 0
	text.BackgroundTransparency = 0.2
	text.BackgroundColor3 = Color3.new(1, 1, 1)
	text.Size = UDim2.new(0, 390, 1, -10)
	text.Position = UDim2.new(0, 105, 0, 5)
	text.Text = tab.text
	text.Font = Enum.Font.SciFi
	text.TextSize = 20
	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextYAlignment = Enum.TextYAlignment.Top
	text.TextWrapped = true
	text.ZIndex = 11 
	if tab.name ~= current then
		text.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		text.Visible = true 
	end)
end

end)

   local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
--Prison Life
elseif game.PlaceId == 155615604 then
    local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)


MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
end)

MainSection:NewButton("Prison Destroyer V2", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/DTi4fbKh"))();
end)

MainSection:NewButton("Prison Life Anti Abusers GUI", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/6mhZBAkh",true))()
end)

MainSection:NewButton("Prison Destroyer", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/08z0DUDE",true))()
end)

MainSection:NewButton("Kick Player", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/5iyrwLSH",true))()
end)

MainSection:NewButton("Prison Destroyer V1.6", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/4rkRHviN",true))()
end)

MainSection:NewButton("Loop Bring All", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/j80DG72a",true))()
end)

MainSection:NewButton("Bring All/Crim", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/aiNDd7Js",true))()
end)
game.Players.LocalPlayer.PlayerGui.Home.fadeFrame:Destroy()
        local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    -- Build A Boat
elseif game.PlaceId == 537413528 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("scriptt", "just a gui", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Build%20A%20Boat%20For%20Treasure/BABFT"))()
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- Gorilla Tag Professional
elseif game.PlaceId == 8690998110 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")




local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
	    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
            local Window = Library.CreateLib("SkyHub Universal", OptTheme)
            local Main = Window:NewTab("Main")
            local MainSection = Main:NewSection("Main")
            MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
                setclipboard(string)
            end)
	 MainSection:NewButton("V3rm Script", "Copys Discord invite link", function()
                -- Made by 13 YOLD
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
local window1 = library:Window("Scripts")
local window2 = library:Window("Teleport Areas")
window1:Button("Infinite Wins", function()
    spawn(function()
while true do
   local dec = game:GetService("Workspace"):FindFirstChild("ClickToGetCash").ClickDetector
   fireclickdetector(dec)
   local fun = game:GetService("Workspace"):FindFirstChild("ClickToGetCash").ClickDetector
   fireclickdetector(fun)
   wait(0.1)
end
end)
end)
window2:Button("Spectate (Easy Win)", function()
    spawn(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39.386, 59.2163, -102.248)

end)
end)
window1:Button("TP All to You (Use Lava)", function()
    spawn(function()
  for _, player in pairs(game.Players:GetPlayers()) do
player.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
      end
    end)
end)
window2:Button("Become a Lava Monke", function()
    spawn(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(79.2755, 71.1624, -54.2756)
end)
end)
window1:Slider("Walkspeed",16,70,5, function(value)
  game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
window1:Slider("JumpPower",50,150,20, function(value)
  game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
end)
library:Keybind("Tab")
game:GetService("StarterGui"):SetCore("SendNotification",{     
Title = "Important!",     
Text = "Infinite Wins is patched",
Button1 = "unpatch pls?",Button2 = "no",     Duration = 20, })
            end)
-- Universal
else
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")




local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
	    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
            local Window = Library.CreateLib("SkyHub Universal", OptTheme)
            local Main = Window:NewTab("Main")
            local MainSection = Main:NewSection("Main")
            MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
                setclipboard(string)
            end)

            MainSection:NewButton("NoClip", "Walk Through Walls Hold V", function()
                local h,char,play
                play = game.Players.LocalPlayer
                local uisss = game:getService("UserInputService")
                game:getService("RunService"):BindToRenderStep("",0,function()
                    char = play.Character
	                if char then h = char:findFirstChildOfClass("Humanoid") end
	               if not h then return end
	               if uisss:IsKeyDown(Enum.KeyCode.V) then
		                h:ChangeState(11)
	                end
                end)
            end)

            MainSection:NewButton("Btools", "Btools lol", function()
                game.StarterGui:SetCoreGuiEnabled(2, true)
                a = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
                a.BinType = 2
                b = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
                b.BinType = 3
                c = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
                c.BinType = 4
            end)
 
MainSection:NewButton("FE Gui", "By Me sky", function()
                local Admin = Instance.new("ScreenGui")
local MainFrame = Instance.new("ScrollingFrame")
local FlyBut = Instance.new("TextButton")
local RespawnBut = Instance.new("TextButton")
local Credslol = Instance.new("TextLabel")
local ClickTpBut = Instance.new("TextButton")
local NoClipBut = Instance.new("TextButton")
local SonicBut = Instance.new("TextButton")
local TelekiniesBut = Instance.new("TextButton")
local WalkWallsBut = Instance.new("TextButton")
local BtoolsBut = Instance.new("TextButton")
local MEME = Instance.new("TextButton")
syn.protect_gui(Admin)
Admin.Name = "Admin"
Admin.Parent = game.CoreGui
Admin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = Admin
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.fromRGB(208, 66, 255)
MainFrame.Position = UDim2.new(0.416337252, 0, 0.274846643, 0)
MainFrame.Size = UDim2.new(0, 429, 0, 262)

FlyBut.Name = "FlyBut"
FlyBut.Parent = MainFrame
FlyBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyBut.Position = UDim2.new(0, 0, 0.0306748468, 0)
FlyBut.Size = UDim2.new(0, 200, 0, 50)
FlyBut.Style = Enum.ButtonStyle.RobloxButton
FlyBut.Font = Enum.Font.SourceSans
FlyBut.Text = "Fly"
FlyBut.TextColor3 = Color3.fromRGB(58, 93, 170)
FlyBut.TextSize = 14.000

RespawnBut.Name = "RespawnBut"
RespawnBut.Parent = MainFrame
RespawnBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RespawnBut.Position = UDim2.new(0.510489523, 0, 0.0306748468, 0)
RespawnBut.Size = UDim2.new(0, 200, 0, 50)
RespawnBut.Style = Enum.ButtonStyle.RobloxButton
RespawnBut.Font = Enum.Font.SourceSans
RespawnBut.Text = "Respawn"
RespawnBut.TextColor3 = Color3.fromRGB(58, 93, 170)
RespawnBut.TextSize = 14.000

Credslol.Name = "Creds lol"
Credslol.Parent = MainFrame
Credslol.BackgroundColor3 = Color3.fromRGB(208, 66, 255)
Credslol.Size = UDim2.new(0, 419, 0, 50)
Credslol.Font = Enum.Font.SourceSans
Credslol.Text = "FE GUI Made By Sky Press down on Mouse Wheel to open/close"
Credslol.TextColor3 = Color3.fromRGB(58, 93, 170)
Credslol.TextSize = 14.000

ClickTpBut.Name = "ClickTpBut"
ClickTpBut.Parent = MainFrame
ClickTpBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickTpBut.Position = UDim2.new(-0.00233101845, 0, 0.0650306717, 0)
ClickTpBut.Size = UDim2.new(0, 200, 0, 50)
ClickTpBut.Style = Enum.ButtonStyle.RobloxButton
ClickTpBut.Font = Enum.Font.SourceSans
ClickTpBut.Text = "ClickTP"
ClickTpBut.TextColor3 = Color3.fromRGB(58, 93, 170)
ClickTpBut.TextSize = 14.000

NoClipBut.Name = "NoClipBut"
NoClipBut.Parent = MainFrame
NoClipBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NoClipBut.Position = UDim2.new(0.510489523, 0, 0.0650306717, 0)
NoClipBut.Size = UDim2.new(0, 200, 0, 50)
NoClipBut.Style = Enum.ButtonStyle.RobloxButton
NoClipBut.Font = Enum.Font.SourceSans
NoClipBut.Text = "Noclip"
NoClipBut.TextColor3 = Color3.fromRGB(58, 93, 170)
NoClipBut.TextSize = 14.000

SonicBut.Name = "SonicBut"
SonicBut.Parent = MainFrame
SonicBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SonicBut.Position = UDim2.new(-0.00233097491, 0, 0.0969325155, 0)
SonicBut.Size = UDim2.new(0, 200, 0, 50)
SonicBut.Style = Enum.ButtonStyle.RobloxButton
SonicBut.Font = Enum.Font.SourceSans
SonicBut.Text = "FE Sonic Animation"
SonicBut.TextColor3 = Color3.fromRGB(58, 93, 170)
SonicBut.TextSize = 14.000

TelekiniesBut.Name = "TelekiniesBut"
TelekiniesBut.Parent = MainFrame
TelekiniesBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TelekiniesBut.Position = UDim2.new(0.510489523, 0, 0.0957055241, 0)
TelekiniesBut.Size = UDim2.new(0, 200, 0, 50)
TelekiniesBut.Style = Enum.ButtonStyle.RobloxButton
TelekiniesBut.Font = Enum.Font.SourceSans
TelekiniesBut.Text = "Telekines"
TelekiniesBut.TextColor3 = Color3.fromRGB(58, 93, 170)
TelekiniesBut.TextSize = 14.000

WalkWallsBut.Name = "WalkWallsBut"
WalkWallsBut.Parent = MainFrame
WalkWallsBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WalkWallsBut.Position = UDim2.new(0, 0, 0.130061358, 0)
WalkWallsBut.Size = UDim2.new(0, 200, 0, 50)
WalkWallsBut.Style = Enum.ButtonStyle.RobloxButton
WalkWallsBut.Font = Enum.Font.SourceSans
WalkWallsBut.Text = "FE Walk On walls"
WalkWallsBut.TextColor3 = Color3.fromRGB(58, 93, 170)
WalkWallsBut.TextSize = 14.000

BtoolsBut.Name = "BtoolsBut"
BtoolsBut.Parent = MainFrame
BtoolsBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BtoolsBut.Position = UDim2.new(0.510489523, 0, 0.130061358, 0)
BtoolsBut.Size = UDim2.new(0, 200, 0, 50)
BtoolsBut.Style = Enum.ButtonStyle.RobloxButton
BtoolsBut.Font = Enum.Font.SourceSans
BtoolsBut.Text = "Btools"
BtoolsBut.TextColor3 = Color3.fromRGB(58, 93, 170)
BtoolsBut.TextSize = 14.000

MEME.Name = "MEME"
MEME.Parent = MainFrame
MEME.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MEME.Position = UDim2.new(0, 0, 0.16257669, 0)
MEME.Size = UDim2.new(0, 200, 0, 50)
MEME.Style = Enum.ButtonStyle.RobloxButton
MEME.Font = Enum.Font.SourceSans
MEME.Text = "MEME"
MEME.TextColor3 = Color3.fromRGB(58, 93, 170)
MEME.TextSize = 14.000

-- Scripts:

local function TSQII_fake_script() -- FlyBut.Fly 
	local script = Instance.new('LocalScript', FlyBut)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Text == "Fly Already On." then
			game.StarterGui:SetCore("SendNotification",  {
				Title = "Fly Noti";
				Text = "FLY ALREADY ON";
				Icon = "";
				Duration = 5;
			})
		else
			script.Parent.Text = "Press E to disable/Enable"
			wait(2.5)
			script.Parent.Text = "Fly Already On."
			repeat wait() 
			until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
			local mouse = game.Players.LocalPlayer:GetMouse() 
			repeat wait() until mouse
			local plr = game.Players.LocalPlayer 
			local torso = plr.Character.HumanoidRootPart 
			local flying = true
			local deb = true 
			local ctrl = {f = 0, b = 0, l = 0, r = 0} 
			local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
			local maxspeed = 50 
			local speed = 0 
	
			function Fly() 
				local bg = Instance.new("BodyGyro", torso) 
				bg.P = 9e4 
				bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
				bg.cframe = torso.CFrame 
				local bv = Instance.new("BodyVelocity", torso) 
				bv.velocity = Vector3.new(0,0.1,0) 
				bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
				repeat wait() 
					plr.Character.Humanoid.PlatformStand = true 
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
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
						lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
					elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
					else 
						bv.velocity = Vector3.new(0,0.1,0) 
					end 
					bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
				until not flying 
				ctrl = {f = 0, b = 0, l = 0, r = 0} 
				lastctrl = {f = 0, b = 0, l = 0, r = 0} 
				speed = 0 
				bg:Destroy() 
				bv:Destroy() 
				plr.Character.Humanoid.PlatformStand = false 
			end 
			mouse.KeyDown:connect(function(key) 
				if key:lower() == "e" then 
					if flying then flying = false 
					else 
						flying = true 
						Fly() 
					end 
				elseif key:lower() == "w" then 
					ctrl.f = 1 
				elseif key:lower() == "s" then 
					ctrl.b = -1 
				elseif key:lower() == "a" then 
					ctrl.l = -1 
				elseif key:lower() == "d" then 
					ctrl.r = 1 
				end 
			end) 
			mouse.KeyUp:connect(function(key) 
				if key:lower() == "w" then 
					ctrl.f = 0 
				elseif key:lower() == "s" then 
					ctrl.b = 0 
				elseif key:lower() == "a" then 
					ctrl.l = 0 
				elseif key:lower() == "d" then 
					ctrl.r = 0 
				end 
			end)
			Fly()
		end
	end)
end
coroutine.wrap(TSQII_fake_script)()
local function XMMUGI_fake_script() -- MainFrame.Drag 
	local script = Instance.new('LocalScript', MainFrame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(XMMUGI_fake_script)()
local function UEZKG_fake_script() -- RespawnBut.Repsawn 
	local script = Instance.new('LocalScript', RespawnBut)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Text == "Respawning..." then
			game.StarterGui:SetCore("SendNotification",  {
				Title = "Respawn Noti";
				Text = "Already Respawning...";
				Icon = "";
				Duration = 5;
			})
		else
			script.Parent.Text = "Respawning..."
			wait(2.5)
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			game.Players.LocalPlayer.Character.Head.Remove()
			end
	end)
end
coroutine.wrap(UEZKG_fake_script)()
local function WOLU_fake_script() -- MainFrame.MouseButton3 
	local script = Instance.new('LocalScript', MainFrame)

	local UserInputService = game:GetService("UserInputService")
	local function onInputBegan(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton3 then
			if script.Parent.Visible == true then
				script.Parent.Visible = false
			else
				script.Parent.Visible = true
			end
		end
	end
	UserInputService.InputBegan:Connect(onInputBegan)
	
end
coroutine.wrap(WOLU_fake_script)()
local function TGAB_fake_script() -- ClickTpBut.ClickTp 
	local script = Instance.new('LocalScript', ClickTpBut)

	script.Parent.MouseButton1Down:Connect(function()
		mouse = game.Players.LocalPlayer:GetMouse()
		tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.Name = "Click Teleport"
		tool.Activated:connect(function()
			local pos = mouse.Hit+Vector3.new(0,2.5,0)
			pos = CFrame.new(pos.X,pos.Y,pos.Z)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		end)
		tool.Parent = game.Players.LocalPlayer.Backpack
	
	end)
end
coroutine.wrap(TGAB_fake_script)()
local function AATJTM_fake_script() -- NoClipBut.Noclip 
	local script = Instance.new('LocalScript', NoClipBut)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Text == "Noclip" then
			script.Parent.Text = "Clip"
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
		wait(2.6)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";noclip","All")
		else
			script.Parent.Text = "Noclip"
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";clip","All")
		end
	end)
end
coroutine.wrap(AATJTM_fake_script)()
local function ZDXVH_fake_script() -- SonicBut.Sonic 
	local script = Instance.new('LocalScript', SonicBut)

	script.Parent.MouseButton1Down:Connect(function()
		loadstring(game:HttpGetAsync("https://pastebin.com/raw/SyF5t70A"))()
	end)
end
coroutine.wrap(ZDXVH_fake_script)()
local function CRSQC_fake_script() -- TelekiniesBut.TEL 
	local script = Instance.new('LocalScript', TelekiniesBut)

	script.Parent.MouseButton1Down:Connect(function()
		--BROUGHT TO YOU BY RobloxScripter.com!--
		--Follow Our Partners!--
	
		local function a(b, c)
			local d = getfenv(c)
			local e =
				setmetatable(
					{},
					{__index = function(self, f)
					if f == "script" then
						return b
					else
						return d[f]
					end
				end}
				)
			setfenv(c, e)
			return c
		end
		local g = {}
		local h = Instance.new("Model", game:GetService("Lighting"))
		local i = Instance.new("Tool")
		local j = Instance.new("Part")
		local k = Instance.new("Script")
		local l = Instance.new("LocalScript")
		local m = sethiddenproperty or set_hidden_property
		i.Name = "Telekinesis"
		i.Parent = h
		i.Grip = CFrame.new(0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
		i.GripForward = Vector3.new(-0, -1, -0)
		i.GripRight = Vector3.new(0, 0, 1)
		i.GripUp = Vector3.new(1, 0, 0)
		j.Name = "Handle"
		j.Parent = i
		j.CFrame = CFrame.new(-17.2635937, 15.4915619, 46, 0, 1, 0, 1, 0, 0, 0, 0, -1)
		j.Orientation = Vector3.new(0, 180, 90)
		j.Position = Vector3.new(-17.2635937, 15.4915619, 46)
		j.Rotation = Vector3.new(-180, 0, -90)
		j.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
		j.Transparency = 1
		j.Size = Vector3.new(1, 1.20000005, 1)
		j.BottomSurface = Enum.SurfaceType.Weld
		j.BrickColor = BrickColor.new("Really black")
		j.Material = Enum.Material.Metal
		j.TopSurface = Enum.SurfaceType.Smooth
		j.brickColor = BrickColor.new("Really black")
		k.Name = "LineConnect"
		k.Parent = i
		table.insert(
			g,
			a(
				k,
				function()
					wait()
					local n = script.Part2
					local o = script.Part1.Value
					local p = script.Part2.Value
					local q = script.Par.Value
					local color = script.Color
					local r = Instance.new("Part")
					r.TopSurface = 0
					r.BottomSurface = 0
					r.Reflectance = .5
					r.Name = "Laser"
					r.Locked = true
					r.CanCollide = false
					r.Anchored = true
					r.formFactor = 0
					r.Size = Vector3.new(1, 1, 1)
					local s = Instance.new("BlockMesh")
					s.Parent = r
					while true do
						if n.Value == nil then
							break
						end
						if o == nil or p == nil or q == nil then
							break
						end
						if o.Parent == nil or p.Parent == nil then
							break
						end
						if q.Parent == nil then
							break
						end
						local t = CFrame.new(o.Position, p.Position)
						local dist = (o.Position - p.Position).magnitude
						r.Parent = q
						r.BrickColor = color.Value.BrickColor
						r.Reflectance = color.Value.Reflectance
						r.Transparency = color.Value.Transparency
						r.CFrame = CFrame.new(o.Position + t.lookVector * dist / 2)
						r.CFrame = CFrame.new(r.Position, p.Position)
						s.Scale = Vector3.new(.25, .25, dist)
						wait()
					end
					r:remove()
					script:remove()
				end
			)
		)
		k.Disabled = true
		l.Name = "MainScript"
		l.Parent = i
		table.insert(
			g,
			a(
				l,
				function()
					wait()
					tool = script.Parent
					lineconnect = tool.LineConnect
					object = nil
					mousedown = false
					found = false
					BP = Instance.new("BodyPosition")
					BP.maxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
					BP.P = BP.P * 1.1
					dist = nil
					point = Instance.new("Part")
					point.Locked = true
					point.Anchored = true
					point.formFactor = 0
					point.Shape = 0
					point.BrickColor = BrickColor.Black()
					point.Size = Vector3.new(1, 1, 1)
					point.CanCollide = false
					local s = Instance.new("SpecialMesh")
					s.MeshType = "Sphere"
					s.Scale = Vector3.new(.7, .7, .7)
					s.Parent = point
					handle = tool.Handle
					front = tool.Handle
					color = tool.Handle
					objval = nil
					local u = false
					local v = BP:clone()
					v.maxForce = Vector3.new(30000, 30000, 30000)
					function LineConnect(o, p, q)
						local w = Instance.new("ObjectValue")
						w.Value = o
						w.Name = "Part1"
						local x = Instance.new("ObjectValue")
						x.Value = p
						x.Name = "Part2"
						local y = Instance.new("ObjectValue")
						y.Value = q
						y.Name = "Par"
						local z = Instance.new("ObjectValue")
						z.Value = color
						z.Name = "Color"
						local A = lineconnect:clone()
						A.Disabled = false
						w.Parent = A
						x.Parent = A
						y.Parent = A
						z.Parent = A
						A.Parent = workspace
						if p == object then
							objval = x
						end
					end
					function onButton1Down(B)
						if mousedown == true then
							return
						end
						mousedown = true
						coroutine.resume(
							coroutine.create(
								function()
									local C = point:clone()
									C.Parent = tool
									LineConnect(front, C, workspace)
									while mousedown == true do
										C.Parent = tool
										if object == nil then
											if B.Target == nil then
												local t = CFrame.new(front.Position, B.Hit.p)
												C.CFrame = CFrame.new(front.Position + t.lookVector * 1000)
											else
												C.CFrame = CFrame.new(B.Hit.p)
											end
										else
											LineConnect(front, object, workspace)
											break
										end
										wait()
									end
									C:remove()
								end
							)
						)
						while mousedown == true do
							if B.Target ~= nil then
								local D = B.Target
								if D.Anchored == false then
									object = D
									dist = (object.Position - front.Position).magnitude
									break
								end
							end
							wait()
						end
						while mousedown == true do
							if object.Parent == nil then
								break
							end
							local t = CFrame.new(front.Position, B.Hit.p)
							BP.Parent = object
							BP.position = front.Position + t.lookVector * dist
							wait()
						end
						BP:remove()
						object = nil
						objval.Value = nil
					end
					function onKeyDown(E, B)
						local E = E:lower()
						local F = false
						if E == "q" then
							if dist >= 5 then
								dist = dist - 10
							end
						end
						if E == "r" then
							if object == nil then
								return
							end
							for G, H in pairs(object:children()) do
								if H.className == "BodyGyro" then
									return nil
								end
							end
							BG = Instance.new("BodyGyro")
							BG.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
							BG.cframe = CFrame.new(object.CFrame.p)
							BG.Parent = object
							repeat
								wait()
							until object.CFrame == CFrame.new(object.CFrame.p)
							BG.Parent = nil
							if object == nil then
								return
							end
							for G, H in pairs(object:children()) do
								if H.className == "BodyGyro" then
									H.Parent = nil
								end
							end
							object.Velocity = Vector3.new(0, 0, 0)
							object.RotVelocity = Vector3.new(0, 0, 0)
							object.Orientation = Vector3.new(0, 0, 0)
						end
						if E == "e" then
							dist = dist + 10
						end
						if E == "t" then
							if dist ~= 10 then
								dist = 10
							end
						end
						if E == "y" then
							if dist ~= 200 then
								dist = 200
							end
						end
						if E == "=" then
							BP.P = BP.P * 1.5
						end
						if E == "-" then
							BP.P = BP.P * 0.5
						end
					end
					function onEquipped(B)
						keymouse = B
						local I = tool.Parent
						human = I.Humanoid
						human.Changed:connect(
							function()
								if human.Health == 0 then
									mousedown = false
									BP:remove()
									point:remove()
									tool:remove()
								end
							end
						)
						B.Button1Down:connect(
							function()
								onButton1Down(B)
							end
						)
						B.Button1Up:connect(
							function()
								mousedown = false
							end
						)
						B.KeyDown:connect(
							function(E)
								onKeyDown(E, B)
							end
						)
						B.Icon = "rbxasset://textures\\GunCursor.png"
					end
					tool.Equipped:connect(onEquipped)
				end
			)
		)
		for J, H in pairs(h:GetChildren()) do
			H.Parent = game:GetService("Players").LocalPlayer.Backpack
			pcall(
				function()
					H:MakeJoints()
				end
			)
		end
		h:Destroy()
		for J, H in pairs(g) do
			spawn(
				function()
					pcall(H)
				end
			)
		end
	end)
end
coroutine.wrap(CRSQC_fake_script)()
local function ZHDWEL_fake_script() -- WalkWallsBut.walls 
	local script = Instance.new('LocalScript', WalkWallsBut)

	script.Parent.MouseButton1Down:Connect(function()
		getgenv()["cofiG"] = getgenv()["cofiG"] or {}
		local hasToUpdate = true
		local alreadyRan = cofiG.gravityController ~= nil
	
		local http = game:GetService'HttpService'
		local readfile,writefile,fileexists = readfile or syn_io_read,writefile or syn_io_write,isfile or readfile
	
		local rawUrl,baseUrl = "https://ixss.keybase.pub/rblx/gravityController/", "https://keybase.pub/ixss/rblx/gravityController/"
	
		do
			_G.req = [[
	        local require = function(lol)
	            lol = "https://raw.githubusercontent.com/msva/lua-htmlparser/master/src/"..lol:gsub("%.","/")..".lua";
	            return loadstring(_G.req..game:HttpGet(lol))();
	        end;
	    ]]
	
			local require = function(lol)
				lol = "https://raw.githubusercontent.com/msva/lua-htmlparser/master/src/"..lol:gsub("%.","/")..".lua";
				return loadstring(_G.req..game:HttpGet(lol))();
			end;
	
			cofiG.htmlparser = cofiG.htmlparser or require"htmlparser"
		end
	
		do  -- check if exists
			if fileexists'gravityController.json' then
				local json = readfile'gravityController.json'
				if json then
					cofiG.gravityController = http:JSONDecode(json)
					hasToUpdate = cofiG.gravityController.Version ~= game:HttpGet(rawUrl.."Version.txt")
				end
			end
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = hasToUpdate and "Updating script..." or "Running script!";
				Font = Enum.Font.Code;
				Color = Color3.fromRGB(255, 60, 60);
				FontSize = Enum.FontSize.Size96;   
			})
		end
	
	
		if hasToUpdate then -- update/download
	
			function getScripts()
				local ret = {}
				local text = game:HttpGet(baseUrl, false)
	
				local root = cofiG.htmlparser.parse(text)
				local files = root:select(".file")
	
				for i,v in pairs(files) do
					if string.sub(v.attributes.href, string.len(v.attributes.href)-3) == ".lua" then
						local name = string.sub(v.attributes.href,string.len(baseUrl)+1, string.len(v.attributes.href)-4)
						local script = rawUrl..name..".lua"
						ret[name] = game:HttpGet(script)
					elseif string.sub(v.attributes.href, string.len(v.attributes.href)-3) == ".txt" then
						local name = string.sub(v.attributes.href,string.len(baseUrl)+1, string.len(v.attributes.href)-4)
						local script = rawUrl..name..".txt"
						ret[name] = game:HttpGet(script)
					end
				end
	
				return ret
			end
			cofiG.gravityController = getScripts()
			writefile('gravityController.json', http:JSONEncode(cofiG.gravityController))
			warn('Script updated!')
		end
	
		local a,b = pcall(loadstring(cofiG.gravityController.Loader))
	
		if not a then
			error('Loader ', b)
		end
	
		if not alreadyRan then
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = game:HttpGet('https://ixss.keybase.pub/Watermark.txt', true)..", originally made by EgoMoose.";
				Font = Enum.Font.Code;
				Color = Color3.fromRGB(244, 0, 175);
				FontSize = Enum.FontSize.Size96;   
			})
		end
	end)
end
coroutine.wrap(ZHDWEL_fake_script)()
local function GGZTRR_fake_script() -- BtoolsBut.Btools 
	local script = Instance.new('LocalScript', BtoolsBut)

	script.Parent.MouseButton1Down:Connect(function()
		game.StarterGui:SetCoreGuiEnabled(2, true)
		a = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
		a.BinType = 2
		b = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
		b.BinType = 3
		c = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
		c.BinType = 4
	end)
end
coroutine.wrap(GGZTRR_fake_script)()
local function ACHGC_fake_script() -- MEME.me me 
	local script = Instance.new('LocalScript', MEME)

	script.Parent.MouseButton1Down:Connect(function()
		loadstring(game:HttpGetAsync("https://pastebin.com/raw/0QfjMKrF"))()
	end)
end
coroutine.wrap(ACHGC_fake_script)()

            end)    


    MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

MainSection:NewButton("Dex", "Explorer", function()
loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()
end)

MainSection:NewButton("Impluse hub", "idk", function()
loadstring(game:HttpGet('http://impulse-hub.xyz/ImpulseHub',true))()
 end)

MainSection:NewButton("Zyrex-Hub", "10+", function()
   _G.Toggle_GUI = Enum.KeyCode.RightControl --Right Ctrl

loadstring(game:HttpGet(("https://raw.githubusercontent.com/NotZyrex/Zyrex-Hub/master/Main.lua"), true))();
end)

MainSection:NewButton("Psyhub", "idk", function()
loadstring(game:GetObjects("rbxassetid://3014051754")[1].Source)()
 end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("Remote Spy", "Find remotes press F9", function()
loadstring(game:HttpGet('https://pastebin.com/raw/b33cjh0p'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)
    
	   MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

        MainSection:NewButton("Infinite Yield FE", "Admin", function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)

        MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
            setclipboard(string2)
        end)
        
        MainSection:NewButton("Destroy GUIS", "CLCK A LOT OF TIMES", function()
                for i, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            if v.Name == "Main" and v.Parent then
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                break
            end
        end
end)
        
        local Player = Window:NewTab("Player")
        local PlayerSection = Player:NewSection("Player")
        PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end)

        PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end)
        
        local Placeinfo = Window:NewTab("Place Info")
        local Playerinform = Placeinfo:NewSection("Place Info")
        
         Playerinform:NewButton(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Description), function()
end)
Playerinform:NewButton(game:GetService("Players"):GetNameFromUserIdAsync(game.CreatorId), (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Description), function()

end)
       Playerinform:NewButton("FilterEnabled/Repesect Is: (Click dots)", ("Click on the button and press F9"), function()
       print(game.Workspace.FilteringEnabled, "If it says true it means its on if it says false then it means its off")
        if game:GetService("SoundService").RespectFilteringEnabled == true then
                    print("RespectFilteringEnabled is enabled")
                else
                    print("RespectFilteringEnabled is disabled")
                end
       end)
end
end
local S = ""
if identifyexecutor then
	S = select(1, identifyexecutor())
end
if S == "ScriptWare" then
--[[games it supports Da Hood, Arsenal, Tower of Hell, KAT!, Fencing,
Work At A Pizza Place, VR Hands, Adopt Me, Jailbreak, Prison Life, and
Build A Boat For Treasure, and Gorrila Tag Professional.
12+ games
Rebuilt On IllusionHub
Last Updated 2/18/2022
]]--
local OptTheme = "BloodTheme"
local string = "https://discord.gg/A6HQQXvwNs"
local string2 = "https://discord.com/invite/jVf7eSrED9"
-- Da Hood
if game.PlaceId == 2788229376 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
   local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

MainSection:NewButton("RayCodeX", "Launches RayCodeX script", function()
   loadstring(game:GetObjects("rbxassetid://5812737894")[1].Source)()
end)


MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

   local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
--Arsenal
elseif game.PlaceId == 286090429 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)


MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("Impluse hub", "idk", function()
loadstring(game:HttpGet('http://impulse-hub.xyz/ImpulseHub',true))()
 end)

MainSection:NewButton("Zyrex-Hub", "10+", function()
   _G.Toggle_GUI = Enum.KeyCode.RightControl --Right Ctrl

loadstring(game:HttpGet(("https://raw.githubusercontent.com/NotZyrex/Zyrex-Hub/master/Main.lua"), true))();
end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Arsenal RAC Ban Menu", "Shows in chat also I have no idea what this does", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/qtDZm7LX"))()
end)

MainSection:NewButton("MonkeThing", "idk", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/MonkeHub/main/arsenal.lua"))()
end)

MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

MainSection:NewButton("Arsenal FE audio + more!", "NOTE: you can get banned from some of these scripts", function()
 value = "2038227137" --song id here


    local args = {
        [1] = {
            [1] = "UpdateID",
            [2] =  value,
        },
    }
    
    game:GetService("ReplicatedStorage").Events.UpdateLoadout:FireServer(unpack(args))

local args = {
    [1] = true,
    [2] = game:GetService("ReplicatedStorage").Taunts.Megaphone,
}

game:GetService("ReplicatedStorage").Events.ReplicateGear:FireServer(unpack(args))




Players = game:GetService("Players")
for i, player in pairs(Players:GetPlayers()) do
    print("["..i.."] = "..player.Name)
    local args = {
    [1] = "GET NOOB",
    "["..i.."] = "..player.Name,
}
end
  end)
-- Tower Of Hell
elseif game.PlaceId == 1962086868 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Tower of hell script", "just a gui", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/JayZone69/Tower-of-Hell/main/Script"))()
end)

MainSection:NewButton("Tower of hell script2", "idka", function()
   loadstring(game:HttpGet("https://gist.githubusercontent.com/BloxiYT/26f5c60eaed40ab1ab4e1756a70eac69/raw/b386cfd481e316f72103a0e88c0316be7891f3fb/OMG%2520123456"))()
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- KAT!
elseif game.PlaceId == 621129760 then 
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)


MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("KAT!", "auto throws knife", function()
   --Subscribe to Ducky Exploits
function nearestPlayerToRay()
    local dist = math.huge
    local ray
    
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Head") and not v.Character:FindFirstChild("ForceField") then
            if v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") then -- needed..
                local newVec = (v.Character.Head.Position - game.Players.LocalPlayer.Character.Head.Position)
                if newVec.magnitude < dist then
                    local toRay = Ray.new(game.Players.LocalPlayer.Character.Head.Position, newVec)
                    if not workspace:FindPartOnRayWithIgnoreList(toRay, {game.Players.LocalPlayer.Character, v.Character, workspace.WorldIgnore, workspace.CurrentCamera}) then
                        dist = newVec.magnitude
                        ray = toRay
                    end
                end
            end
        end
    end
    return ray
end

local ray

function init()
    local knife = game.Players.LocalPlayer.Character:WaitForChild("Knife")
    local scr = getsenv(knife.KnifeServer.KnifeClient)
    if scr then
        local ir = scr.inputReleased
        local u7 = debug.getupvalue(ir, 2)
        local cam = debug.getupvalue(ir, 5)
        debug.setupvalue(ir, 5, setmetatable({}, {
            __index = function(t,k)
                if k == "ScreenPointToRay" then
                    if ray ~= nil then
                        return function() return ray end
                    end
                end
                return cam[k]
            end
        }))
    
        
        while wait(.1) do
            if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                break    
            end
            ray = nearestPlayerToRay()
            if ray then
                scr.inputDown()
                u7.ChargeStart = -math.huge
                ir()
            end
        end
    end
end

init()
game.Players.LocalPlayer.CharacterAdded:connect(function()
    print("hi")
    wait()
    init()
   end)
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)


local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
 -- Fencing
 elseif game.PlaceId == 12109643 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
 local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

   MainSection:NewButton("FE Brick Spam", "spams bricks", function()
   -- https://www.roblox.com/games/12109643/Fencing

game:GetService('RunService').Stepped:connect(function()
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v.Name == "Spray" then
if v.Handle.Mesh then
v.Handle.Mesh:Destroy()
end
v.Parent = workspace
end
end
end)
local function paint()
for i,v in pairs(game.Workspace:GetChildren())do
if v.Name == "Handle" then
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
v.Transparency = 1
v.CanCollide = false
wait()
v.CFrame = game.Players.LocalPlayer.Character["Left Leg"].CFrame
end
end
end
local function equip()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do
if v.Name == "Spray" then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
end
end
end
while wait(0.05) do
paint()
equip()
end
end)

MainSection:NewButton("FE Gain Double Health", "bruh", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(56,3.5,124.5)
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-130,3.5,30)
end)

MainSection:NewButton("FE Give SprayPaint", "SprayPaint", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-130,3.5,30)
end)

MainSection:NewButton("FE Perm God Mode", "permeanent God mode", function()
   button              = workspace.Button
button.CanCollide   = false
button.Transparency = 1

game:GetService("RunService").Heartbeat:connect(function(step)
button.CFrame = CFrame.new(game.Players.LocalPlayer.Character.Head.Position)
button.Size   = Vector3.new(math.random(0,0), math.random(0,0), math.random(1,5))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Right Arm"].Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character.Torso.Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Left Arm"].Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Left Leg"].Position)
wait()
button.Size   = Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
button.CFrame = CFrame.new(game.Players.LocalPlayer.Character["Right Leg"].Position)
end)
end)

MainSection:NewButton("FE Reach", "Farther Reach", function()
   a=Instance.new("SelectionBox",game.Players.LocalPlayer.Backpack.Foil.Handle)
a.Adornee=game.Players.LocalPlayer.Backpack.Foil.Handle
game.Players.LocalPlayer.Backpack.Foil.Handle.Size=Vector3.new(1,1,30)
end)

MainSection:NewButton("FE Seat Spam", "Seat Spam", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
end)

MainSection:NewButton("FE Weird Broken Fencing Swords", "Swords", function()
  game.Lighting["LinkedSword3"]:Clone().Parent = game.Players.LocalPlayer.Backpack
game.Lighting["LinkedSword2"]:Clone().Parent = game.Players.LocalPlayer.Backpack
game.Lighting["LinkedSword"]:Clone().Parent = game.Players.LocalPlayer.Backpack
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- Work at a Pizza Place
 elseif game.PlaceId == 192800 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
 local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)
   
 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)
   
MainSection:NewButton("IDK", "script", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/cEwtwKZR",true))()
end)

MainSection:NewButton("FE Open Manager's Door", "Opens Manager's Door", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(43,5,7)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(42,5,7)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(43,5,7)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51,5,7)
end)

MainSection:NewButton("FE Paint Cars Hot Pink", "Paints the cars but it can be laggy", function()
 --Change "Hot Pink" to a Roblox Color that they have.

local Color = BrickColor.new('Hot pink')

local PaintCar = function(Car,Color_Code)
for ii, Child in pairs(Car:GetChildren()) do
game.ReplicatedStorage.Channels.VehicleChannel:FireServer('Paint', Child, 'None', Color_Code)
end
end

while wait() do
for i, Car in pairs(workspace.Cars:GetChildren()) do
PaintCar(Car, Color.Number)
end
end
end)

MainSection:NewButton("GabX", "GabX", function()
   --// GabX, the script hub that has all you need! \\--
-- Made by Darion#8863

local tabs = {
	{
		name = "Scripts",
		comingsoon = false,
		scripts = {
			{
				"R2S (EnvEdit)",
				"https://pastebin.com/raw/ZAHTikfe"
			},
			{
				"Old R2S",
				"https://pastebin.com/raw/jXh45kfE"
			},
			{
				"Grab Knife V4",
				"https://pastebin.com/raw/7zK1Swpt"
			},
			{
				"Grab Knife V3",
				"https://pastebin.com/raw/TPZXG8fH"
			},
			{
				"R6 Fly(E)",
				"https://pastebin.com/raw/hTJsM2jV"
			},
			{
				"Speed",
				"https://pastebin.com/raw/mrdWh73D"
			},
			{
				"JumpPower",
				"https://pastebin.com/raw/sA5xym2V"
			},
			{
				"Loopheal",
				"https://pastebin.com/raw/vD9zjBQx"
			},
			{
				"Chat Logs",
				"https://pastebin.com/raw/mtGM0Dkh"
			},
			{
				"Audio Stealer",
				"https://pastebin.com/raw/ABRqgZ3L"
			},
			{
				"FE Check (F9)",
				"https://pastebin.com/raw/SRibuFiK"
			},
			{
				"No clip (F)",
				"https://pastebin.com/raw/bnqAE95f"
			},
			{
				"Bomb Vest",
				"https://pastebin.com/raw/S7vdifqp"
			},
			{
				"Robux Troll",
				"https://pastebin.com/raw/BHjfPXC6"
			}
		}
	},
	{
		name = "FeScripts",
		comingsoon = false,
		scripts = {
			{
				"FE God",
				"https://pastebin.com/raw/p814kXmM"
			},
			{
				"Kill/Fling",
				"https://pastebin.com/raw/Pb3PR6EL"
			},
			{
				"Shutdown",
				"https://pastebin.com/raw/RELufQFM"
			},
			{
				"Hat Spin",
				"https://pastebin.com/raw/Y8iEYKZD"
			},
			{
				"Suicide Gun",
				"https://pastebin.com/raw/SeRxrgci"
			},
			{
				"Click TP Tool",
				"https://pastebin.com/raw/16tXkJjD"
			},
			{
				"OOF Spam",
				"https://pastebin.com/raw/JaMbzp0B"
			},
			{
				"Respawn",
				"https://pastebin.com/raw/61WmHqNp"
			}
		}
	},
	{
		name = "GUIs",
		comingsoon = false,
		scripts = {
			{
				"Topk3k V4",
				"https://pastebin.com/raw/bEmmF8UH"
			},
			{
				"Arosia",
				"https://pastebin.com/raw/Nwit6ZqP"
			},
			{
				"Equinox",
				"https://pastebin.com/raw/scYFbHQb"
			},
			{
				"Ani's(R15)",
				"https://pastebin.com/raw/MenK10Ak"
			},
			{
				"Ani's(R6)",
				"https://pastebin.com/raw/Ydt76Kep"
			},
			{
				"Rose Hub",
				"https://pastebin.com/raw/1BJj0fB4"
			},
			{
				"OPFinality",
				"https://pastebin.com/raw/fG5b1zrM"
			},
			{
				"Old OPHub",
				"https://pastebin.com/raw/FxhQbqsp"
			},
			{
				"HyperTotal",
				"https://pastebin.com/raw/aYdepQa0"
			},
			{
				"Clown Van",
				"https://pastebin.com/raw/0uJXBEmN"
			},
			{
				"Sern Hub",
				"https://pastebin.com/raw/8sD7V8xp"
			},
			{
				"Cooler Kids V2",
				"https://pastebin.com/raw/GGQeWXSL"
			},
			{
				"Ping/FPS",
				"https://pastebin.com/raw/Qh8eeWF7"
			},
			{
				"Spectate",
				"https://pastebin.com/raw/WgpJfMGS"
			},
			{
				"Ro-xploit",
				"https://pastebin.com/raw/ZkhCcaa5"
			},
			{
				"TP GUI",
				"https://pastebin.com/raw/EBhdqeWb"
			}
		}
	},
	{
		name = "Commands",
		comingsoon = false,
		scripts = {
			{
				"BTools",
				"https://pastebin.com/raw/752Gzv1G"
			},
			{
				"Ghost",
				"https://pastebin.com/raw/aiYL4LKV"
			},
			{
				"Big pp",
				"https://pastebin.com/raw/xAcpS2Ze"
			},
			{
				"Inf Jump",
				"https://pastebin.com/raw/Dz61QSir"
			}
		}
	},
	{
		name = "Stat Change",
		comingsoon = false,
		scripts = {
			{
				"Clone Tycoon 2",
				"https://pastebin.com/raw/ga02bJq5"
			},
			{
				"Naruto Final Bond LVL",
				"https://pastebin.com/raw/j5gYsnxM"
			},
			{
				"Shinobi Life",
				"https://pastebin.com/raw/rpWG7xBj"
			},
			{
				"Rocitizens",
				"https://pastebin.com/raw/P3WAujA9"
			},
			{
				"Naruto New Gen",
				"https://pastebin.com/raw/34Fdq480"
			},
			{
				"False DBFP",
				"https://pastebin.com/raw/tTCcVDAf"
			},
			{
				"Jaws",
				"https://pastebin.com/raw/RkNJ3jn2"
			},
			{
				"Giant Survival 2",
				"https://pastebin.com/raw/sbme5pNF"
			},
			{
				"One Piece Unleashed 2",
				"https://pastebin.com/raw/QAgtrGdX"
			},
			{
				"Tuber Simulator",
				"https://pastebin.com/raw/zy1dFtrc"
			},
			{
				"Yard Work Simulator",
				"https://pastebin.com/raw/udKYdRpW"
			},
			{
				"Dragon Ball Super 2",
				"https://pastebin.com/raw/U5i77x2T"
			},
			{
				"Avatar: Legend of Kora",
				"https://pastebin.com/raw/ggcfAQcH"
			}
		}
	},
	{
		name = "Games",
		comingsoon = false,
		scripts = {
			{
				"NRPG Beyond Fast Shoot",
				"https://pastebin.com/raw/zXCvQxRF"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Jailbreak AFK",
				"https://pastebin.com/raw/hhRca3cj"
			},
			{
				"Jailbreak GUI",
				"https://pastebin.com/raw/CQFw06tN"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Lumber Tycoon",
				"https://pastebin.com/raw/33kYAahS"
			},
			{
				"Phantom Forces",
				"https://pastebin.com/raw/LgQEjvxS"
			},
			{
				"Hilton Hotels",
				"https://pastebin.com/raw/QfHywxaZ"
			},
			{
				"Work At A Pizza Place",
				"https://pastebin.com/raw/KyfBZCKL"
			},
			{
				"Prison Royale",
				"https://pastebin.com/raw/0W4QBB5C"
			},
			{
				"Greenwood Town",
				"https://pastebin.com/raw/96JTe9Gd"
			},
			{	
				"Naruto Final Bond",
				"https://pastebin.com/raw/ujKgVWBn"
			},
			{	"Project Pokemon",
				"https://pastebin.com/raw/jDTLJf9Z"
			},
			{	"Scuba Diving",
				"https://pastebin.com/raw/NwSeijRv"
			}
		}
	},
	{
		name = "Admins",
		comingsoon = false,
		scripts = {
			{
				"Infinite Yield",
				"https://pastebin.com/raw/MjBzRjmT"
			},
			{
				"Rocky's",
				"https://pastebin.com/raw/3V4s9UPx"
			},
			{
				"Dex Explorer",
				"https://pastebin.com/raw/eqy8yt4q"
			},
			{
				"N3xulis",
				"https://pastebin.com/raw/eKkbtM3A"
			},
			{
				"ARX Admin",
				"https://pastebin.com/raw/4PGmJv5R"
			},
			{
				"Shattervast",
				"https://pastebin.com/raw/44bNjECt"
			},
			{
				"Filter My Ass",
				"https://pastebin.com/raw/Tn1xz43y"
			},
			{
				"C00lgui",
				"https://pastebin.com/raw/Xt0S28mx"
			},
			{
				"Mayem",
				"https://pastebin.com/raw/tWQnvRqH"
			},
			{
				"Nosyliam",
				"https://pastebin.com/raw/FmeiVpiE"
			},
			{
				"Your Mom V2",
				"https://pastebin.com/raw/1FsNUZHq"
			},
			{
				"PME Safazi",
				"https://pastebin.com/raw/yrnDMLYs"
			}
		}
	},
	{
		name = "Forms",
		comingsoon = false,
		scripts = {
			{
				"Madara",
				"https://pastebin.com/raw/LYjZdycr"
			},
			{
				"Shadow Titan",
				"https://pastebin.com/raw/E7b9cy1h"
			},
			{
				"Assasin",
				"https://pastebin.com/raw/bKu2GuzN"
			},
			{
				"Beast Claws",
				"https://pastebin.com/raw/0AH8SZTJ"
			},
			{
				"6 Swords",
				"https://pastebin.com/raw/80juE2kw"
			},
			{
				"Goku SSJ3",
				"https://pastebin.com/raw/vFmVuXk4"
			},
			{
				"OmagaV2",
				"https://pastebin.com/raw/VSerZV3e"
			},
			{
				"Absalom Titan",
				"https://pastebin.com/raw/ZmySaMrb"
			},
			{
				"Ace",
				"https://pastebin.com/raw/fA4XSTY1"
			},
			{
				"Beerus",
				"https://pastebin.com/raw/c1TGDAKC"
			},
			{
				"DSSJ4",
				"https://pastebin.com/raw/pfdud8wK"
			},
			{
				"Zenatic",
				"https://pastebin.com/raw/wTJxmWyG"
			},
			{
				"Naruto",
				"https://pastebin.com/raw/eEN5mC9u"
			}
		}
	},
	{
		name = "Extra",
		comingsoon = true
	}
}
local othertabs = {
	{
		name = "Info",
		text = "GabX was made by a new learning scripter named Darion. It started off as a simple project to learn scripting just for myself, but I decided to release it anyways just for fun. It received quite a bit of attention and several youtube videos were made on it. I felt like I didn't deserve the support because nothing was actually made by me, I just added buttons. I decided to rewrite the UI all by myself! I did get some help in the scripting part because I'm not the best in scripting since I'm new to making scripts and exploiting related stuff in general. Now GabX has been updated and the UI was all self made! Also, when I wanted to release it I didn't know any good name for it. I asked my friend and he didn't know either, so I just chose my friends name and added an X to it! :D",
	},
	{
		name = "Help",
		text = "If there is anything patched, not the most recent update, broken or anything else please DM Darion#8863 and join the server. http://discord.gg/E64Jd89"
	},
	{
		name = "Credits",
		text = "GabX was made by Darion#8863."
	}
}


local gui = Instance.new("ScreenGui")
gui.Parent = gethui()

local openclose = Instance.new("TextButton")
openclose.Parent = gui
openclose.Name = "OpenClose"
openclose.Style = Enum.ButtonStyle.RobloxRoundButton
openclose.Font = Enum.Font.SciFi
openclose.TextSize = 25
openclose.Text = "OPEN"
openclose.ZIndex = 12
openclose.Size = UDim2.new(0, 110,0, 45)
openclose.Position = UDim2.new(0, 0,0.791, 0)

local top = Instance.new("Frame")
top.Parent = gui
top.Name = "Topbar"
top.BorderSizePixel = 0
top.BackgroundColor3 = Color3.new((192 / 255), (225 / 255), (237 / 255))
top.Size = UDim2.new(0, 500, 0, 36)
top.Position = UDim2.new(0, -505, 0.5, -218)
top.Draggable = true
top.Active = true
top.ZIndex = 10
top.Visible = false

local logo = Instance.new("ImageLabel")
logo.Parent = top
logo.Name = "Logo"
logo.BorderSizePixel = 0
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://1902404068"
logo.ScaleType = Enum.ScaleType.Crop
logo.Size = UDim2.new(0, 140, 0, 36)
logo.Position = UDim2.new(0.5, -70, 0, 0)
logo.ZIndex = 11

local main = Instance.new("Frame")
main.Parent = top
main.Name = "MainFrame"
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BackgroundTransparency = 0.2
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(1, 0, 0, 400)
main.ZIndex = 10

local tabsf = Instance.new("Frame")
tabsf.Parent = main
tabsf.Name = "Tabs"
tabsf.BorderSizePixel = 0
tabsf.BackgroundTransparency = 1
tabsf.Position = UDim2.new(0, 0, 0, 0)
tabsf.Size = UDim2.new(0, 100, 1, 0)


openclose.MouseButton1Click:connect(function()
	if top.Visible then
		openclose.Text = "OPEN"
		top:TweenPosition(UDim2.new(0, -505, 0.5, -218))
		wait(1.05)
		top.Visible = false
	else
		openclose.Text = "CLOSE"
		top.Visible = true
		top:TweenPosition(UDim2.new(0.5, -250, 0.5, -218))
		wait(1.05)
	end 
end)

local current = "Scripts"
for i1, tab in ipairs(tabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, (i1 - 1) * 30)
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local tabfr = Instance.new("Frame")
	tabfr.Parent = main
	tabfr.Name = tab.name
	tabfr.BorderSizePixel = 0
	tabfr.BackgroundTransparency = 1
	tabfr.Size = UDim2.new(0, 390, 1, -10)
	tabfr.Position = UDim2.new(0, 105, 0, 5)
	if tab.name ~= current then
		tabfr.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		tabfr.Visible = true 
	end)
	
	if tab.comingsoon then
		local text = Instance.new("TextLabel")
		text.Parent = tabfr
		text.BorderSizePixel = 0
		text.BackgroundTransparency = 1
		text.BackgroundColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.SciFi
		text.TextSize = 60
		text.Text = "Coming Soon!"
		text.Position = UDim2.new(0, 0, 0, 0)
		text.Size = UDim2.new(1, 0, 0, 100)
		text.ZIndex = 11
	else
		for i2, scr in ipairs(tab.scripts) do
			local scrbtn = Instance.new("TextButton")
			scrbtn.Parent = tabfr
			scrbtn.Name = scr[1]
			scrbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
			scrbtn.Position = UDim2.new(0, ((i2 - 1) % 4) * 100, 0, math.floor((i2 - 1) / 4) * 50)
			scrbtn.Size = UDim2.new(0, 90, 0, 40)
			scrbtn.TextSize = 14
			scrbtn.TextScaled = true
			scrbtn.TextScaled = false
			scrbtn.Font = Enum.Font.SciFi
			scrbtn.Text = scr[1]
			scrbtn.ZIndex = 11
			
			scrbtn.MouseButton1Click:connect(function()
				loadstring(game:HttpGet(scr[2], true))()
			end)
		end
	end
end
for i,tab in ipairs(othertabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name 
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, 314 + ((i - 1) * 30))
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local text = Instance.new("TextLabel")
	text.Parent = main
	text.Name = tab.name 
	text.BorderSizePixel = 0
	text.BackgroundTransparency = 0.2
	text.BackgroundColor3 = Color3.new(1, 1, 1)
	text.Size = UDim2.new(0, 390, 1, -10)
	text.Position = UDim2.new(0, 105, 0, 5)
	text.Text = tab.text
	text.Font = Enum.Font.SciFi
	text.TextSize = 20
	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextYAlignment = Enum.TextYAlignment.Top
	text.TextWrapped = true
	text.ZIndex = 11 
	if tab.name ~= current then
		text.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		text.Visible = true 
	end)
end

end)

 MainSection:NewButton("FE Pizza Toppings Troll", "troll", function()
   for i,v in pairs(workspace.AllDough:GetChildren()) do
    workspace.GameService.AddIngredientToPizza:FireServer(v, "Sausage")
    workspace.GameService.AddIngredientToPizza:FireServer(v, "Cheese")
    workspace.GameService.AddIngredientToPizza:FireServer(v, "Pepperoni")
    workspace.GameService.AddIngredientToPizza:FireServer(v, "TomatoSauce")
end
end)

MainSection:NewButton("FE Teleport To manager chair", "it tps to manager chair", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(23,5,6.5)
  end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
 -- VR Hands
elseif game.PlaceId == 4832438542 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
 local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)
   
 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)
   
MainSection:NewButton("VR Hands GUI", "GUI", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/ugQ9Nb7t"))()
end)

MainSection:NewButton("Hands VR", "VR Hands withour VR", function()
    local cam = workspace.Camera
local p
local headObject
local events = {}

local controls = {
	[Enum.UserInputType.MouseButton1] = {"move", "leftHand"},
	[Enum.UserInputType.MouseMovement] = {"updateTarget"}, -- do not change
	[Enum.UserInputType.MouseWheel] = {"adjustOffset"},
	[Enum.UserInputType.MouseButton2] = {"move", "rightHand"},
	[Enum.KeyCode.W] = {"move", "head", Vector3.new(0, 1, 0)},
	[Enum.KeyCode.A] = {"move", "head", Vector3.new(-1, 0, 0)},
	[Enum.KeyCode.S] = {"move", "head", Vector3.new(0, -1, 0)},
	[Enum.KeyCode.D] = {"move", "head", Vector3.new(1, 0, 0)},
	[Enum.KeyCode.Q] = {"move", "head", Vector3.new(0, 0, -1)},
	[Enum.KeyCode.E] = {"move", "head", Vector3.new(0, 0, 1)},
	[Enum.KeyCode.LeftShift] = {"gesture", "Fist"},
	[Enum.KeyCode.LeftControl] = {"gesture", "Index"},
	[Enum.KeyCode.LeftAlt] = {"gesture", "Thumb"},
	[Enum.KeyCode.Z] = {"toggle", "canOffset"},
	[Enum.KeyCode.R] = {"toggle", "rotationManager"},
	[Enum.KeyCode.Tab] = {"selectAxis", "rotationManager"},
	[Enum.KeyCode.Left] = {"updateAxisMover", "rotationManager", -1},
	[Enum.KeyCode.Right] = {"updateAxisMover", "rotationManager", 1}
}

local services = {}

setmetatable(services, {
	__index = function(t, k)
		services[k] = rawget(services, k) or game:GetService(k)
		return services[k]
	end
})

local function angleBetween(vecx, vecy)
	return math.acos(vecx:Dot(vecy))
end

local hand = {}
hand.__index = hand

function hand:gesture(gestureName, keyState)
	if keyState ~= 1 then
		return
	end

	headObject.realHeadset[self.id .. gestureName] = 1 - headObject.realHeadset[self.id .. gestureName]
end

function hand:getMouseRay()
	local mousePos = services.UserInputService:GetMouseLocation()
	return CFrame.new(cam:ViewportPointToRay(mousePos.x, mousePos.y).Direction * (1.5 + headObject.handOffset))
end

function hand:calculateEndRotation()
	return CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()) * CFrame.Angles(self.rotation[1] * (math.pi/6), self.rotation[2] * (math.pi/6), self.rotation[3] * (math.pi/6))
end

function hand:updateTarget()

	local camLook = (cam.CFrame.lookVector * Vector3.new(1,0,1)).unit
	
	local theta = angleBetween(Vector3.new(-1, 0, 0), camLook)
	theta = camLook.z > 0 and (2 * math.pi) - theta or theta

	local relativeAngle = (self.id == "l" and -headObject.handAngle or headObject.handAngle)
	local startPosition = CFrame.new(-math.cos(theta + relativeAngle), -0.5, -math.sin(theta + relativeAngle)) + (camLook * headObject.handOffset)

	self.targetPosition = startPosition:Lerp(self:getMouseRay(), self.alpha) * self:calculateEndRotation()
	
	self.replicatePosition:Fire()
end

function hand:beginMove(minAlpha, maxAlpha)
	local distAlpha = (maxAlpha - minAlpha) / 2

	self.moving = true
	repeat
		services.RunService.RenderStepped:wait()
		self:updateTarget()
	until math.abs(self.alpha - minAlpha) < 0.05 or math.abs(maxAlpha - self.alpha) < 0.05 or self.alpha ~= self.alpha
	
	if self.alpha ~= self.alpha then
		self.alpha = 0
	end
	
	self.moving = false
end

function hand:move(keyState)

	if headObject.rotationManager.active then
		if self.id == "l" then
			headObject.rotationManager.held = keyState == 1
			
			headObject.rotationManager.selectedAxis = 0
		end
		return
	end

	self.alphaMultiplier = keyState == 1 and 0.05 or -0.05
	
	if not self.moving and not (keyState == 1 and self.alpha >= 1) then
		if keyState == 1 then
			headObject.recentHand = self
		end
	
		self:beginMove(0, 1)
	end
end

function hand:new(direction, realHand)
	local newHand = setmetatable({direction = direction, realHand = realHand}, hand)
	newHand.alpha = 0
	newHand.alphaMultiplier = 0.05
	newHand.id = direction and "r" or "l"
	newHand.targetPosition = CFrame.new()
	newHand.moving = false
	newHand.rotation = {0, 0, 0}
	newHand.replicatePosition = Instance.new("BindableEvent")
	newHand.replicatePosition.Event:connect(function()
		events.UserCFrameChanged:Fire(newHand.direction and Enum.UserCFrame.RightHand or Enum.UserCFrame.LeftHand, newHand.targetPosition)
	end)
	
	return newHand
end

local head = {}
head.__index = head

function head:handleInput(input, keyState)
	local bind = controls[input.KeyCode] or controls[input.UserInputType]
	
	if bind then
		if bind[1] == "updateTarget" and not self.rotationManager.active then
			self.leftHand:updateTarget()
			self.rightHand:updateTarget()
		elseif bind[2] and type(self[bind[2]]) == "table" then
			self[bind[2]][bind[1]](self[bind[2]], keyState, bind[3])
		elseif bind[3] then
			self[bind[1]](self, bind[3], keyState)
		elseif bind[2] and self.recentHand[bind[1]] then
			self.recentHand[bind[1]](self.recentHand, bind[2], keyState)
		else
			self[bind[1]](self, bind[2], keyState)
		end
	end
end

function head:adjustOffset(_, keyState)
	if self.canOffset then		
		self.leftHand:updateTarget()
		self.rightHand:updateTarget()
	end
end

function head:move(vec, keyState)
	if vec.z ~= 0 then
		self.realHeadset.Stick2 = math.clamp(self.realHeadset.Stick2 + (vec.z * keyState), -1, 1)
	else
	end
end

function head:freezeCam(b)
	local dist = (self.realHeadset.Head.PrimaryPart.Position - cam.CFrame.p).magnitude
		
	p.CameraMinZoomDistance = b and dist or 0.5
	p.CameraMaxZoomDistance = b and dist or 128
end

function head:toggle(stat, keyState)
	if keyState ~= 1 then
		return
	end

	self[stat] = not self[stat]
	
	if stat == "canOffset" then
		self:freezeCam(self[stat])
	end
end

local rotation = {}
rotation.__index = rotation

function rotation:new()
	local newRotation = setmetatable({}, rotation)
	
	newRotation.rotationLookup = {{}, {}, {}}
	newRotation.lineLookup = {{}, {}, {}}
	newRotation.active = false
	newRotation.held = false
	newRotation.selectedAxis = 0
	newRotation.angleLookup = {1, 1, 1}
	
	for i=1,3 do
		local ref = {}
		ref[i] = function() return 0 end
		ref[i + 1 > 3 and ((i + 1) % 4) + 1 or i + 1] = math.cos
		ref[i + 2 > 3 and ((i + 2) % 4) + 1 or i + 2] = math.sin
		
		local color = Color3.fromRGB(i == 1 and 255 or 0, i == 2 and 255 or 0, i == 3 and 255 or 0)
		
		for j=1,13 do
			if j < 13 then
				local step = math.pi * (j/6)
				newRotation.rotationLookup[i][j] = Vector3.new(ref[1](step), ref[2](step), ref[3](step))
			end
			
			local line = Drawing.new("Line")
			line.Visible = true
			line.Thickness = 5
			line.Color = color
			newRotation.lineLookup[i][j] = line
		end
		
		local circle = Drawing.new("Circle")
		circle.Visible = true
		circle.Color = color
		circle.Filled = true
		circle.Radius = 10
		circle.Position = Vector2.new(-2000, -2000)
		newRotation.lineLookup[i][14] = circle
		
		local text = Drawing.new("Text")
		text.Visible = true
		text.Font = Drawing.Fonts.System
		text.Size = 18
		text.Color = Color3.new():lerp(color, 0.3)
		text.Outline = false
		newRotation.lineLookup[i][15] = text
	end
	
	return newRotation
end

function rotation:selectAxis(keyState)
	self.tabActivated = keyState == 1
	if self.tabActivated then
		self.selectedAxis = math.clamp((self.selectedAxis + 1) % 4, 1, 3)
	end
end 

function rotation:toggle(keyState)
	if keyState == 1 and headObject.recentHand.alpha < 0.05 and not self.held then
		self.active = not self.active
		
		if not self.active then
			self:updateAxes(0)
			self.selectedAxis = 0
			self.held = false
			headObject.recentHand:updateTarget()
		end
	end
end

function rotation:updateAxes(visibleOverride)
	local basePos = headObject.recentHand.realHand.Base.Position
	local basePoint = cam:WorldToViewportPoint(basePos)

	for i=1,3 do
		for j=1,12 do
			local vec, visible = cam:WorldToViewportPoint(basePos + (self.rotationLookup[i][j] * 10))
			local vec2, visible2 = cam:WorldToViewportPoint(basePos + ((self.rotationLookup[i][j + 1] or self.rotationLookup[i][1]) * 10))
			
			local line = self.lineLookup[i][j]
			
			line.Transparency = visibleOverride or ((visible and visible2) and 1 or 0)
			line.From = Vector2.new(vec.x, vec.y)
			line.To = Vector2.new(vec2.x, vec2.y)
		end
		local axisRotation = headObject.recentHand.rotation[i]
		
		local axisMover = self.lineLookup[i][13]
		local axisCircle = self.lineLookup[i][14]
		local axisText = self.lineLookup[i][15]
		
		axisMover.From = Vector2.new(basePoint.x, basePoint.y)
		axisMover.To = self.lineLookup[i][math.clamp(axisRotation < 1 and 12 or axisRotation, 1, 12)].From -- sorry, lazy
		axisMover.Transparency = visibleOverride or 1
		
		axisCircle.Position = self.lineLookup[i][13].To
		axisCircle.Transparency = visibleOverride or 1
		
		
		
		axisText.Position = self.lineLookup[2][3].From + axisText.TextBounds
		axisText.Text = string.char(87 + self.selectedAxis) .. ": " .. math.deg(axisRotation * (math.pi / 6))
		axisText.Transparency = visibleOverride or ((self.held or self.tabActivated) and self.selectedAxis == i and 1 or 0)
		
		local mousePos = services.UserInputService:GetMouseLocation()
		if self.held and (self.lineLookup[i][14].Position - mousePos).magnitude < 10 and self.selectedAxis == 0 then
			self.selectedAxis = i
		end
	end
end

function rotation:updateAxisMover(keyState, direction)
	if keyState and direction then
		if self.tabActivated and keyState == 1 then
			headObject.recentHand.rotation[self.selectedAxis] = (headObject.recentHand.rotation[self.selectedAxis] + direction) % 12
			headObject.recentHand:updateTarget()
		end
		return
	end

	if self.selectedAxis ~= 0 then
		local mousePos = services.UserInputService:GetMouseLocation()
		
		local circlePos = self.lineLookup[self.selectedAxis][12].From
		
		local handPos = self.lineLookup[self.selectedAxis][13].From
		
		local mouseDir = self.selectedAxis == 1 and headObject.recentHand.id == "r" and (Vector2.new(-mousePos.x + (handPos.x * 2), mousePos.y) - handPos).unit or (mousePos - handPos).unit
		-- mouse angle relating to the red circle is reflected on the right hand, so i "re-reflect" it. bad practice
		
		local circleDir = (circlePos - handPos).unit
		
		local rotationTheta = angleBetween(mouseDir, circleDir)
		
		local direction = mouseDir:Cross(circleDir)
		
		rotationTheta = direction > 0 and rotationTheta or (2 * math.pi) - rotationTheta
		
		if rotationTheta == rotationTheta then
			headObject.recentHand.rotation[self.selectedAxis] = math.floor(6 * rotationTheta / math.pi)
			
			local hand = headObject.recentHand
			hand.replicatePosition:Fire()
		end
	end
end

function head:new(realHeadset)
	local newHead = setmetatable({realHeadset = realHeadset}, head)
	
	newHead.leftHand = hand:new(false, realHeadset.lHand)
	newHead.rightHand = hand:new(true, realHeadset.rHand)
	newHead.canOffset = false
	newHead.recentHand = newHead.leftHand
	newHead.handOffset = 0
	newHead.handAngle = math.pi / 4
	
	newHead.rotationManager = rotation:new()
	
	newHead.chatRemote = debug.getupvalue(realHeadset.ButtonPressed, 3)
	
	cam:GetPropertyChangedSignal("CameraSubject"):connect(function()
		if cam.CameraSubject ~= headObject.realHeadset.Head then
			cam.CameraType = Enum.CameraType.Custom
		end
	end)
	
	services.UserInputService.WindowFocused:connect(function()
		newHead.realHeadset.StickPosition = Vector3.new(0, 0, 0)
		newHead.realHeadset.Stick2 = 0
	end)
	
	return newHead
end

local ind, nc, nind

local realVrService = game:GetService("VRService")

local fakeVrService = setmetatable({
	VREnabled = true,
	SetTouchpadMode = function()
	end,
	RecenterUserHeadCFrame = function()
	end,
	GetUserCFrameEnabled = function(cf)
		return true
	end,
	GetUserCFrame = function(cf)
		return CFrame.new()
	end

}, {
	__index = function(t, k)
		local real = ind(realVrService, k)
		if typeof(real) == "RBXScriptSignal" then
			events[k] = events[k] or {
				Name = k,
				Connect = function(t, f)
					t.Function = f

					if t.Name == "UserCFrameChanged" then
						headObject = head:new(debug.getupvalue(t.Function, 1))
						
						services.UserInputService.InputBegan:connect(function(i)
							headObject:handleInput(i, 1)
						end)

						services.UserInputService.InputChanged:connect(function(i)
							headObject:handleInput(i, i.UserInputType == Enum.UserInputType.MouseWheel and i.Position.z or 0)
						end)

						services.UserInputService.InputEnded:connect(function(i)
							headObject:handleInput(i, -1)
						end)
					end

				end, 
				Fire = function(t, ...)
					return t.Function(...)
				end
			}

			return events[k]
		end

		return real
	end,
	__call = function(t, method, vr, ...)
		return t[method](...)
	end
})

ind = hookmetamethod(game, "__index", function(...)
	local t, k = ...

	local scr = getcallingscript()

	if t == realVrService and not (scr and ind(scr, "Name") == "CameraModule") then
		return fakeVrService[k]
	end

	return ind(...)
end)

nc = hookmetamethod(game, "__namecall", function(...)
	local t = ...

	if t == realVrService then
		local method = getnamecallmethod()
		return fakeVrService(method, ...)
	elseif t == game.GetService(game, "StarterGui") and game.IsLoaded(game) then
		return
	end

	return nc(...)
end)

nind = hookmetamethod(game, "__newindex", function(...)
	local t, k, v = ...
	
	local scr = getcallingscript()
	
	if t == cam and headObject then	
		if k == "CFrame" and events.UserCFrameChanged then
		
			events.UserCFrameChanged:Fire(Enum.UserCFrame.Head, CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()))
			
			if headObject.rotationManager.active then
			
				headObject.rotationManager:updateAxes()
				
				if headObject.rotationManager.held then
					headObject.rotationManager:updateAxisMover()
				end
			end
			
			if headObject.rotationManager.tabActivated and services.UserInputService:IsKeyDown(Enum.KeyCode.Left) or services.UserInputService:IsKeyDown(Enum.KeyCode.Right) then -- prevent controls from messing with camera
				return
			end
		elseif k == "CameraType" then
			nind(t, k, Enum.CameraType.Custom)
			nind(t, "CameraSubject", headObject.realHeadset.Head)
			headObject.leftHand:updateTarget()
			headObject.rightHand:updateTarget()
		end
		if not (scr and scr.Name == "CameraModule") and not checkcaller() then
			return
		end
	end
	
	nind(t, k, v)
end)

p = services.Players.LocalPlayer or (function()
	services.Players:GetPropertyChangedSignal("LocalPlayer"):wait() -- this doesnt return anything for some reason??
	return services.Players.LocalPlayer
end)()

p.Chatted:connect(function(c)
	services.ReplicatedStorage.COM.Chat:FireServer("Chat", c)
end)
end)
 

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- Adopt me
elseif game.PlaceId == 920587237 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
   local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Antartic Hub", "idk", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/JusticeValley/Antarctic-Hub/main/New.lua", true))()
 end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("GabX", "GabX", function()
   --// GabX, the script hub that has all you need! \\--
-- Made by Darion#8863

local tabs = {
	{
		name = "Scripts",
		comingsoon = false,
		scripts = {
			{
				"R2S (EnvEdit)",
				"https://pastebin.com/raw/ZAHTikfe"
			},
			{
				"Old R2S",
				"https://pastebin.com/raw/jXh45kfE"
			},
			{
				"Grab Knife V4",
				"https://pastebin.com/raw/7zK1Swpt"
			},
			{
				"Grab Knife V3",
				"https://pastebin.com/raw/TPZXG8fH"
			},
			{
				"R6 Fly(E)",
				"https://pastebin.com/raw/hTJsM2jV"
			},
			{
				"Speed",
				"https://pastebin.com/raw/mrdWh73D"
			},
			{
				"JumpPower",
				"https://pastebin.com/raw/sA5xym2V"
			},
			{
				"Loopheal",
				"https://pastebin.com/raw/vD9zjBQx"
			},
			{
				"Chat Logs",
				"https://pastebin.com/raw/mtGM0Dkh"
			},
			{
				"Audio Stealer",
				"https://pastebin.com/raw/ABRqgZ3L"
			},
			{
				"FE Check (F9)",
				"https://pastebin.com/raw/SRibuFiK"
			},
			{
				"No clip (F)",
				"https://pastebin.com/raw/bnqAE95f"
			},
			{
				"Bomb Vest",
				"https://pastebin.com/raw/S7vdifqp"
			},
			{
				"Robux Troll",
				"https://pastebin.com/raw/BHjfPXC6"
			}
		}
	},
	{
		name = "FeScripts",
		comingsoon = false,
		scripts = {
			{
				"FE God",
				"https://pastebin.com/raw/p814kXmM"
			},
			{
				"Kill/Fling",
				"https://pastebin.com/raw/Pb3PR6EL"
			},
			{
				"Shutdown",
				"https://pastebin.com/raw/RELufQFM"
			},
			{
				"Hat Spin",
				"https://pastebin.com/raw/Y8iEYKZD"
			},
			{
				"Suicide Gun",
				"https://pastebin.com/raw/SeRxrgci"
			},
			{
				"Click TP Tool",
				"https://pastebin.com/raw/16tXkJjD"
			},
			{
				"OOF Spam",
				"https://pastebin.com/raw/JaMbzp0B"
			},
			{
				"Respawn",
				"https://pastebin.com/raw/61WmHqNp"
			}
		}
	},
	{
		name = "GUIs",
		comingsoon = false,
		scripts = {
			{
				"Topk3k V4",
				"https://pastebin.com/raw/bEmmF8UH"
			},
			{
				"Arosia",
				"https://pastebin.com/raw/Nwit6ZqP"
			},
			{
				"Equinox",
				"https://pastebin.com/raw/scYFbHQb"
			},
			{
				"Ani's(R15)",
				"https://pastebin.com/raw/MenK10Ak"
			},
			{
				"Ani's(R6)",
				"https://pastebin.com/raw/Ydt76Kep"
			},
			{
				"Rose Hub",
				"https://pastebin.com/raw/1BJj0fB4"
			},
			{
				"OPFinality",
				"https://pastebin.com/raw/fG5b1zrM"
			},
			{
				"Old OPHub",
				"https://pastebin.com/raw/FxhQbqsp"
			},
			{
				"HyperTotal",
				"https://pastebin.com/raw/aYdepQa0"
			},
			{
				"Clown Van",
				"https://pastebin.com/raw/0uJXBEmN"
			},
			{
				"Sern Hub",
				"https://pastebin.com/raw/8sD7V8xp"
			},
			{
				"Cooler Kids V2",
				"https://pastebin.com/raw/GGQeWXSL"
			},
			{
				"Ping/FPS",
				"https://pastebin.com/raw/Qh8eeWF7"
			},
			{
				"Spectate",
				"https://pastebin.com/raw/WgpJfMGS"
			},
			{
				"Ro-xploit",
				"https://pastebin.com/raw/ZkhCcaa5"
			},
			{
				"TP GUI",
				"https://pastebin.com/raw/EBhdqeWb"
			}
		}
	},
	{
		name = "Commands",
		comingsoon = false,
		scripts = {
			{
				"BTools",
				"https://pastebin.com/raw/752Gzv1G"
			},
			{
				"Ghost",
				"https://pastebin.com/raw/aiYL4LKV"
			},
			{
				"Big pp",
				"https://pastebin.com/raw/xAcpS2Ze"
			},
			{
				"Inf Jump",
				"https://pastebin.com/raw/Dz61QSir"
			}
		}
	},
	{
		name = "Stat Change",
		comingsoon = false,
		scripts = {
			{
				"Clone Tycoon 2",
				"https://pastebin.com/raw/ga02bJq5"
			},
			{
				"Naruto Final Bond LVL",
				"https://pastebin.com/raw/j5gYsnxM"
			},
			{
				"Shinobi Life",
				"https://pastebin.com/raw/rpWG7xBj"
			},
			{
				"Rocitizens",
				"https://pastebin.com/raw/P3WAujA9"
			},
			{
				"Naruto New Gen",
				"https://pastebin.com/raw/34Fdq480"
			},
			{
				"False DBFP",
				"https://pastebin.com/raw/tTCcVDAf"
			},
			{
				"Jaws",
				"https://pastebin.com/raw/RkNJ3jn2"
			},
			{
				"Giant Survival 2",
				"https://pastebin.com/raw/sbme5pNF"
			},
			{
				"One Piece Unleashed 2",
				"https://pastebin.com/raw/QAgtrGdX"
			},
			{
				"Tuber Simulator",
				"https://pastebin.com/raw/zy1dFtrc"
			},
			{
				"Yard Work Simulator",
				"https://pastebin.com/raw/udKYdRpW"
			},
			{
				"Dragon Ball Super 2",
				"https://pastebin.com/raw/U5i77x2T"
			},
			{
				"Avatar: Legend of Kora",
				"https://pastebin.com/raw/ggcfAQcH"
			}
		}
	},
	{
		name = "Games",
		comingsoon = false,
		scripts = {
			{
				"NRPG Beyond Fast Shoot",
				"https://pastebin.com/raw/zXCvQxRF"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Jailbreak AFK",
				"https://pastebin.com/raw/hhRca3cj"
			},
			{
				"Jailbreak GUI",
				"https://pastebin.com/raw/CQFw06tN"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Lumber Tycoon",
				"https://pastebin.com/raw/33kYAahS"
			},
			{
				"Phantom Forces",
				"https://pastebin.com/raw/LgQEjvxS"
			},
			{
				"Hilton Hotels",
				"https://pastebin.com/raw/QfHywxaZ"
			},
			{
				"Work At A Pizza Place",
				"https://pastebin.com/raw/KyfBZCKL"
			},
			{
				"Prison Royale",
				"https://pastebin.com/raw/0W4QBB5C"
			},
			{
				"Greenwood Town",
				"https://pastebin.com/raw/96JTe9Gd"
			},
			{	
				"Naruto Final Bond",
				"https://pastebin.com/raw/ujKgVWBn"
			},
			{	"Project Pokemon",
				"https://pastebin.com/raw/jDTLJf9Z"
			},
			{	"Scuba Diving",
				"https://pastebin.com/raw/NwSeijRv"
			}
		}
	},
	{
		name = "Admins",
		comingsoon = false,
		scripts = {
			{
				"Infinite Yield",
				"https://pastebin.com/raw/MjBzRjmT"
			},
			{
				"Rocky's",
				"https://pastebin.com/raw/3V4s9UPx"
			},
			{
				"Dex Explorer",
				"https://pastebin.com/raw/eqy8yt4q"
			},
			{
				"N3xulis",
				"https://pastebin.com/raw/eKkbtM3A"
			},
			{
				"ARX Admin",
				"https://pastebin.com/raw/4PGmJv5R"
			},
			{
				"Shattervast",
				"https://pastebin.com/raw/44bNjECt"
			},
			{
				"Filter My Ass",
				"https://pastebin.com/raw/Tn1xz43y"
			},
			{
				"C00lgui",
				"https://pastebin.com/raw/Xt0S28mx"
			},
			{
				"Mayem",
				"https://pastebin.com/raw/tWQnvRqH"
			},
			{
				"Nosyliam",
				"https://pastebin.com/raw/FmeiVpiE"
			},
			{
				"Your Mom V2",
				"https://pastebin.com/raw/1FsNUZHq"
			},
			{
				"PME Safazi",
				"https://pastebin.com/raw/yrnDMLYs"
			}
		}
	},
	{
		name = "Forms",
		comingsoon = false,
		scripts = {
			{
				"Madara",
				"https://pastebin.com/raw/LYjZdycr"
			},
			{
				"Shadow Titan",
				"https://pastebin.com/raw/E7b9cy1h"
			},
			{
				"Assasin",
				"https://pastebin.com/raw/bKu2GuzN"
			},
			{
				"Beast Claws",
				"https://pastebin.com/raw/0AH8SZTJ"
			},
			{
				"6 Swords",
				"https://pastebin.com/raw/80juE2kw"
			},
			{
				"Goku SSJ3",
				"https://pastebin.com/raw/vFmVuXk4"
			},
			{
				"OmagaV2",
				"https://pastebin.com/raw/VSerZV3e"
			},
			{
				"Absalom Titan",
				"https://pastebin.com/raw/ZmySaMrb"
			},
			{
				"Ace",
				"https://pastebin.com/raw/fA4XSTY1"
			},
			{
				"Beerus",
				"https://pastebin.com/raw/c1TGDAKC"
			},
			{
				"DSSJ4",
				"https://pastebin.com/raw/pfdud8wK"
			},
			{
				"Zenatic",
				"https://pastebin.com/raw/wTJxmWyG"
			},
			{
				"Naruto",
				"https://pastebin.com/raw/eEN5mC9u"
			}
		}
	},
	{
		name = "Extra",
		comingsoon = true
	}
}
local othertabs = {
	{
		name = "Info",
		text = "GabX was made by a new learning scripter named Darion. It started off as a simple project to learn scripting just for myself, but I decided to release it anyways just for fun. It received quite a bit of attention and several youtube videos were made on it. I felt like I didn't deserve the support because nothing was actually made by me, I just added buttons. I decided to rewrite the UI all by myself! I did get some help in the scripting part because I'm not the best in scripting since I'm new to making scripts and exploiting related stuff in general. Now GabX has been updated and the UI was all self made! Also, when I wanted to release it I didn't know any good name for it. I asked my friend and he didn't know either, so I just chose my friends name and added an X to it! :D",
	},
	{
		name = "Help",
		text = "If there is anything patched, not the most recent update, broken or anything else please DM Darion#8863 and join the server. http://discord.gg/E64Jd89"
	},
	{
		name = "Credits",
		text = "GabX was made by Darion#8863."
	}
}


local gui = Instance.new("ScreenGui")
gui.Parent = gethui()

local openclose = Instance.new("TextButton")
openclose.Parent = gui
openclose.Name = "OpenClose"
openclose.Style = Enum.ButtonStyle.RobloxRoundButton
openclose.Font = Enum.Font.SciFi
openclose.TextSize = 25
openclose.Text = "OPEN"
openclose.ZIndex = 12
openclose.Size = UDim2.new(0, 110,0, 45)
openclose.Position = UDim2.new(0, 0,0.791, 0)

local top = Instance.new("Frame")
top.Parent = gui
top.Name = "Topbar"
top.BorderSizePixel = 0
top.BackgroundColor3 = Color3.new((192 / 255), (225 / 255), (237 / 255))
top.Size = UDim2.new(0, 500, 0, 36)
top.Position = UDim2.new(0, -505, 0.5, -218)
top.Draggable = true
top.Active = true
top.ZIndex = 10
top.Visible = false

local logo = Instance.new("ImageLabel")
logo.Parent = top
logo.Name = "Logo"
logo.BorderSizePixel = 0
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://1902404068"
logo.ScaleType = Enum.ScaleType.Crop
logo.Size = UDim2.new(0, 140, 0, 36)
logo.Position = UDim2.new(0.5, -70, 0, 0)
logo.ZIndex = 11

local main = Instance.new("Frame")
main.Parent = top
main.Name = "MainFrame"
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BackgroundTransparency = 0.2
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(1, 0, 0, 400)
main.ZIndex = 10

local tabsf = Instance.new("Frame")
tabsf.Parent = main
tabsf.Name = "Tabs"
tabsf.BorderSizePixel = 0
tabsf.BackgroundTransparency = 1
tabsf.Position = UDim2.new(0, 0, 0, 0)
tabsf.Size = UDim2.new(0, 100, 1, 0)


openclose.MouseButton1Click:connect(function()
	if top.Visible then
		openclose.Text = "OPEN"
		top:TweenPosition(UDim2.new(0, -505, 0.5, -218))
		wait(1.05)
		top.Visible = false
	else
		openclose.Text = "CLOSE"
		top.Visible = true
		top:TweenPosition(UDim2.new(0.5, -250, 0.5, -218))
		wait(1.05)
	end 
end)

local current = "Scripts"
for i1, tab in ipairs(tabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, (i1 - 1) * 30)
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local tabfr = Instance.new("Frame")
	tabfr.Parent = main
	tabfr.Name = tab.name
	tabfr.BorderSizePixel = 0
	tabfr.BackgroundTransparency = 1
	tabfr.Size = UDim2.new(0, 390, 1, -10)
	tabfr.Position = UDim2.new(0, 105, 0, 5)
	if tab.name ~= current then
		tabfr.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		tabfr.Visible = true 
	end)
	
	if tab.comingsoon then
		local text = Instance.new("TextLabel")
		text.Parent = tabfr
		text.BorderSizePixel = 0
		text.BackgroundTransparency = 1
		text.BackgroundColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.SciFi
		text.TextSize = 60
		text.Text = "Coming Soon!"
		text.Position = UDim2.new(0, 0, 0, 0)
		text.Size = UDim2.new(1, 0, 0, 100)
		text.ZIndex = 11
	else
		for i2, scr in ipairs(tab.scripts) do
			local scrbtn = Instance.new("TextButton")
			scrbtn.Parent = tabfr
			scrbtn.Name = scr[1]
			scrbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
			scrbtn.Position = UDim2.new(0, ((i2 - 1) % 4) * 100, 0, math.floor((i2 - 1) / 4) * 50)
			scrbtn.Size = UDim2.new(0, 90, 0, 40)
			scrbtn.TextSize = 14
			scrbtn.TextScaled = true
			scrbtn.TextScaled = false
			scrbtn.Font = Enum.Font.SciFi
			scrbtn.Text = scr[1]
			scrbtn.ZIndex = 11
			
			scrbtn.MouseButton1Click:connect(function()
				loadstring(game:HttpGet(scr[2], true))()
			end)
		end
	end
end
for i,tab in ipairs(othertabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name 
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, 314 + ((i - 1) * 30))
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local text = Instance.new("TextLabel")
	text.Parent = main
	text.Name = tab.name 
	text.BorderSizePixel = 0
	text.BackgroundTransparency = 0.2
	text.BackgroundColor3 = Color3.new(1, 1, 1)
	text.Size = UDim2.new(0, 390, 1, -10)
	text.Position = UDim2.new(0, 105, 0, 5)
	text.Text = tab.text
	text.Font = Enum.Font.SciFi
	text.TextSize = 20
	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextYAlignment = Enum.TextYAlignment.Top
	text.TextWrapped = true
	text.ZIndex = 11 
	if tab.name ~= current then
		text.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		text.Visible = true 
	end)
end

end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

   local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- JailBreak
elseif game.PlaceId == 606849621 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
   local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

MainSection:NewButton("Auto Arrest V2", "Arrest", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/HazeWasTaken/Jailbricked/main/AutoArrest.lua'))()
end)

MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("Auto Rob", "Rob stores", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/wawsdasdacx/ohascriptnrrewading/main/jbsaxcriptidk1'))()
end)

MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

MainSection:NewButton("ESP/Aimbot", "bro", function()
   local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 1
Frame.Position = UDim2.new(0, 0, 0.876175702, 0)
Frame.Size = UDim2.new(0, 100, 0, 84)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.Size = UDim2.new(0, 100, 0, 34)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = "Press E To Lock-On"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 11

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.Position = UDim2.new(0, 0, 0.40476191, 0)
TextLabel_2.Size = UDim2.new(0, 100, 0, 25)
TextLabel_2.Font = Enum.Font.SciFi
TextLabel_2.Text = "Press T To Start ESP"
TextLabel_2.TextColor3 = Color3.new(0, 0, 0)
TextLabel_2.TextSize = 11

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_3.Position = UDim2.new(0, 0, 0.702380955, 0)
TextLabel_3.Size = UDim2.new(0, 100, 0, 25)
TextLabel_3.Font = Enum.Font.Gotham
TextLabel_3.Text = "Press L To Loop-ESP"
TextLabel_3.TextColor3 = Color3.new(0, 0, 0)
TextLabel_3.TextSize = 10
pcall(function()
local espcolor = Color3.fromRGB(140, 69, 102)
local wallhack_esp_transparency = .4
local gui_hide_button = {Enum.KeyCode.LeftControl, "h"}
local plrs = game:GetService("Players")
local lplr = game:GetService("Players").LocalPlayer
local TeamBased = true ; local teambasedswitch = "o"
local presskeytoaim = true; local aimkey = "e"
aimbothider = false; aimbothiderspeed = .5
local Aim_Assist = false ; Aim_Assist_Key = {Enum.KeyCode.LeftControl, "z"}
local espupdatetime = 5; autoesp = false; local charmsesp = true
local movementcounting = true




local mouselock = false
local canaimat = true
local lockaim = true; local lockangle = 5
local ver = "2.4"
local cam = game.Workspace.CurrentCamera
local BetterDeathCount = true
local ballisticsboost = 0

local mouse = lplr:GetMouse()
local switch = false
local key = "k"
local aimatpart = nil
local lightesp = false

local abs = math.abs

local Gui = Instance.new("ScreenGui")
local Move = Instance.new("Frame")
local Main = Instance.new("Frame")
local EspStatus = Instance.new("TextLabel")
local st1 = Instance.new("TextLabel")
local st1_2 = Instance.new("TextLabel")
local st1_3 = Instance.new("TextBox")
local Name = Instance.new("TextLabel")
--Properties:

Gui.Parent = plrs.LocalPlayer:WaitForChild("PlayerGui")


local aimbotstatus = {"qc", "qr", "qe", "qd", "qi", "qt", "qs", "dd", "sp", "ql", "qa", "qd", "qs"}
local gotstring = 0
local function getrandomstring()
    gotstring = gotstring+666
    local str = ""
    local randomstring = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "g", "k", "l", "m", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
         "а","б","в","г","д","е","ё","ж","з","и","й","к","л","м","о","п","р","с","т","у","ф","х","ч","щ","ъ","ы","ъ","э","ю","я", "`", "$", 
        "0","1","2","3","4","5","6","7","8","9", }
    local counting123 = 0
    for i, v in ipairs(randomstring) do
        counting123 = i
    end
    do
        math.randomseed(tick()+gotstring)
        for i = 3, math.random(1,100) do
                math.randomseed(i+tick()+gotstring)
                
                local oneortwo = math.random(1,2)
                if oneortwo == 2 then
                    math.randomseed(i+tick()+gotstring)
                    str = str..""..randomstring[math.random(1, counting123)]
                else
                    math.randomseed(i+tick()+gotstring)
                    str = str..""..string.upper(randomstring[math.random(1, counting123)])
                end
            
        end
    end
    return str
end
local mousedown = false
local isonmovething = false
local mouseoffset = Vector2.new()
local mousedown = false
local bspeed = 3584
local aimbotoffset = {dd = ":", sp = " ", qa = "a", qb = "b",qc = "c", qd = "d", qe = "e", qf = "f", qg = "g" , qh = "h" , qi = "i", qj = "j", qk = "k", ql = "l", qm = "m", qn = "n", qo = "o", qp = "p", qq = "q", qr = "r", qs = "s", qt = "t", qu = "u", qv = "w", qx = "x", qy = "y", qz = "z"}



Gui.Name = getrandomstring()

Move.Name = getrandomstring()
Move.Draggable = true
Move.Parent = Gui
Move.BackgroundColor3 = Color3.new(0.0431373, 1, 0.0745098)
Move.BackgroundTransparency = 0.40000000596046
Move.BorderSizePixel = 0
Move.Position = UDim2.new(0.5, 0,0.018, 0)
Move.Size = UDim2.new(0, 320, 0, 30)

Move.MouseEnter:Connect(function()
    
    isonmovething = true
    
end)
Move.MouseLeave:Connect(function()
    
    isonmovething = mousedown and true or false
end)
mouse.Button1Down:connect(function()
    mousedown = true
    mouseoffset = Move.AbsolutePosition - Vector2.new(mouse.X, mouse.Y)
end)
mouse.Button1Up:connect(function()
    mousedown = false
end)

mouse.Move:Connect(function()
    if isonmovething == true and mousedown then
        Move.Position = UDim2.new(0, mouseoffset.X + mouse.X, 0, mouseoffset.Y + mouse.Y)
    end
end)
local function uc (st)
    local ast = ""
    for i, v in ipairs(st) do
        local let = aimbotoffset[v]
        ast = ast..let
    end
    return ast
end

Main.Name = getrandomstring()
Main.Parent = Move
Main.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
Main.BackgroundTransparency = 0.69999998807907
Main.Position = UDim2.new(0, 0, 0.995670795, 0)
Main.Size = UDim2.new(1.0000006, 0, 11.2, 0)

st1.Name = getrandomstring()
st1.Parent = Main
st1.BackgroundColor3 = Color3.new(1, 1, 1)
st1.BackgroundTransparency = 1
st1.Position = UDim2.new(0, 0, 0, 0)
st1.Size = UDim2.new(1, 0, 0.161862016, 0)
st1.Font = Enum.Font.ArialBold
st1.Text = uc(aimbotstatus)
st1.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1.TextScaled = true
st1.TextSize = 14
st1.TextWrapped = true

st1_2.Name = getrandomstring()
st1_2.Parent = Main
st1_2.BackgroundColor3 = Color3.new(1, 1, 1)
st1_2.BackgroundTransparency = 1
st1_2.Position = UDim2.new(0, 0, 0.375590861, 0)
st1_2.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_2.Font = Enum.Font.ArialBold
st1_2.TextXAlignment = Enum.TextXAlignment.Left
st1_2.Text = "Current ballistics: 0"
st1_2.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1_2.TextScaled = true
st1_2.TextSize = 14
st1_2.TextWrapped = true

local aimbothiderbox = Instance.new("TextBox")
aimbothiderbox.Name = getrandomstring()
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
aimbothiderbox.Size = UDim2.new(1, 0,0.162, 0)
aimbothiderbox.TextScaled = true
aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
aimbothiderbox.Position = UDim2.new(0, 0,0.853, 0)
aimbothiderbox.BackgroundTransparency = 1
aimbothiderbox.Parent = Main

st1_3.Name = getrandomstring()
st1_3.Parent = Main
st1_3.BackgroundColor3 = Color3.new(1, 1, 1)
st1_3.BackgroundTransparency = 1
st1_3.Position = UDim2.new(0, 0, 0.18558608, 0)
st1_3.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_3.Font = Enum.Font.ArialBold
st1_3.Text = "Bullet speed = 3584"
st1_3.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1_3.TextScaled = true
st1_3.TextSize = 14
st1_3.TextWrapped = true
local teambasedstatus = st1_3:Clone()
teambasedstatus.Parent = Main
teambasedstatus.TextScaled = true
teambasedstatus.Position = UDim2.new(0, 0,.7, 0)
teambasedstatus.Size = UDim2.new(1, 0,.1, 0)
teambasedstatus.Name = getrandomstring()
teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
local espstatustext = teambasedstatus:Clone()
espstatustext.Name = getrandomstring()
espstatustext.Position = UDim2.new(0, 0,0.58, 0)
espstatustext.Text = "Esp loop :"..tostring(autoesp)
espstatustext.Parent = Main
local hide = Instance.new("TextButton")
hide.Text = "_"
hide.BackgroundTransparency = 1
hide.TextScaled = true
hide.TextWrapped = true
hide.Size = UDim2.new(0.1, 0,1, 0)
hide.Position = UDim2.new(0.9, 0,-0.15, 0)
hide.Name = getrandomstring()
hide.Parent = Move
Name.Name = getrandomstring()
Name.Parent = Move
Name.BackgroundColor3 = Color3.new(1, 1, 1)
Name.BackgroundTransparency = 1
Name.Size = UDim2.new(0.838, 0, 1, 0)
Name.Font = Enum.Font.Arial
Name.Text = "FPS gui v"..ver
Name.TextColor3 = Color3.new(0, 0, 0)
Name.TextScaled = true
Name.TextSize = 14
Name.TextWrapped = true
Name.TextXAlignment = Enum.TextXAlignment.Left
local scr = Instance.new("ScrollingFrame")
scr.Size = Main.Size
scr.Position = Main.Position
scr.ScrollBarThickness = 0
scr.BackgroundTransparency = 1
scr.Name = getrandomstring()
Main.Size = UDim2.new(1, 0, 1, 0)
Main.Position = UDim2.new(0,0,0,0)
Main.Parent = scr
scr.Parent = Move
startpos = Main.Position
Move.Active = true
Move:Destroy()
-- Scripts:
hided = true
hide.MouseButton1Click:Connect(function()
    if hided == false then
        hided = true
        Main:TweenPosition(UDim2.new(0, 0, -1.5, 0))
    else
        hided = false
        Main:TweenPosition(startpos)
    end
end)


aimbothiderbox.FocusLost:Connect(function()
    local numb = tonumber(aimbothiderbox.Text)
    if aimbothider == true then
        aimbothiderbox.TextColor3 =Color3.fromRGB(11, 255, 19)
    else
        aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
    end
    if numb ~= nil then
        aimbothiderspeed = numb
        if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
    else
        if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
    end
end)


local plrsforaim = {}


Move.Draggable = true
Gui.ResetOnSpawn = false
--Gui.Name = "Chat"
Gui.DisplayOrder = 999
pcall(function()
if not game:GetService("CoreGui") then
    Gui.Parent = plrs.LocalPlayer.PlayerGui
else
    Gui.Parent = game:GetService("CoreGui")
end
end)
local espheadthing
do
local BillboardGui = Instance.new("BillboardGui")
local PName = Instance.new("TextLabel")
local Pdist = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local ImageLabel_2 = Instance.new("ImageLabel")
--Properties:
--BillboardGui.Parent = game.Workspace.Part
BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui.AlwaysOnTop = true
BillboardGui.LightInfluence = 0
BillboardGui.Size = UDim2.new(0, 100, 0, 46)
BillboardGui.Name = "headoverthing"
PName.Name = "PName"
PName.Parent = BillboardGui
PName.BackgroundColor3 = espcolor
PName.BackgroundTransparency = 0.55000001192093
PName.BorderSizePixel = 0
PName.Size = UDim2.new(0, 100, 0, 23)
PName.Font = Enum.Font.SourceSans
PName.Text = "urmom"
PName.TextColor3 = Color3.new(0, 0, 0)
PName.TextScaled = true
PName.TextSize = 14
PName.TextWrapped = true
st1.Text = uc(aimbotstatus)
Pdist.Name = "Pdist"
Pdist.Parent = BillboardGui
Pdist.AnchorPoint = Vector2.new(0.5, 0)
Pdist.BackgroundColor3 = espcolor
Pdist.BackgroundTransparency = 0.55000001192093
Pdist.BorderSizePixel = 0
Pdist.Position = UDim2.new(0.5, 0, 0.5, 0)
Pdist.Size = UDim2.new(0, 70, 0, 23)
Pdist.Font = Enum.Font.SourceSans
Pdist.Text = "666"
Pdist.TextColor3 = Color3.new(0, 0, 0)
Pdist.TextScaled = true
Pdist.TextSize = 14
Pdist.TextWrapped = true

ImageLabel.Parent = BillboardGui
ImageLabel.BackgroundColor3 = Color3.new(0.298039, 1, 0)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = espcolor
ImageLabel.Position = UDim2.new(1, -15, 0.5, 0)
ImageLabel.Rotation = 180
ImageLabel.Size = UDim2.new(0, 15, 0, 23)
ImageLabel.Image = "rbxassetid://2832171824"
ImageLabel.ImageColor3 = espcolor
ImageLabel.ImageTransparency = 0.55000001192093

ImageLabel_2.Parent = BillboardGui
ImageLabel_2.BackgroundColor3 = espcolor
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.BorderColor3 = Color3.new(0.298039, 1, 0)
ImageLabel_2.Position = UDim2.new(0, 0, 0.5, 0)
ImageLabel_2.Rotation = 180
ImageLabel_2.Size = UDim2.new(0, 15, 0, 23)
ImageLabel_2.Image = "rbxassetid://2832177613"
ImageLabel_2.ImageColor3 = espcolor
ImageLabel_2.ImageTransparency = 0.55000001192093
espheadthing = BillboardGui
end



f = {}
f.UpdateHeadUI = function(v)
    
        
            if v.Adornee and v.Adornee ~= nil then
                local destr = false
                if TeamBased then
                    destr = true
                    local plr = plrs:GetPlayerFromCharacter(v.Adornee.Parent)
                    if plr and plr.Team and plr.Team.Name ~= lplr.Team.Name then
                        destr = false
                    end
                end
                if lightesp == true then
                    v.Pdist.TextColor3 = Color3.new(1,1,1)
                    v.PName.TextColor3 = Color3.new(1,1,1)
                else
                    v.Pdist.TextColor3 = Color3.new(0,0,0)
                    v.PName.TextColor3 = Color3.new(0,0,0)
                end
                local d = math.floor((cam.CFrame.p - v.Adornee.CFrame.p).magnitude)
                v.Pdist.Text = tostring(d)
                if d < 14 then
                    v.Enabled = false
                else
                    v.Enabled = true
                end
                v.StudsOffset = Vector3.new(0,.6+d/14,0)
                if destr then
                    v:Destroy()
                end
            else
                v:Destroy()
            end
        
    
end
st1.Text = uc(aimbotstatus)
local espforlder
local partconverter = Instance.new("Part")
--local headsupdatelist = {}
st1_3.FocusLost:connect(function()
    if tonumber(st1_3.Text) then
        bspeed = tonumber(st1_3.Text)
    else
        
    end
end)
f.addesp = function()
    pcall(function()
    --print("ESP ran")
    if espforlder then
        espforlder:Destroy()
        espforlder = Instance.new("Folder")
        espforlder.Parent = game.Workspace.CurrentCamera
    else
        espforlder = Instance.new("Folder")
        espforlder.Parent = game.Workspace.CurrentCamera
    end
    for i, v in pairs(espforlder:GetChildren()) do
        v:Destroy()
    end
    for _, plr in pairs(plrs:GetChildren()) do
        if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Name ~= lplr.Name then
            if TeamBased == true then
                
                if plr.Team.Name ~= plrs.LocalPlayer.Team.Name  then
                    pcall(function()
                    local e = espforlder:FindFirstChild(plr.Name)
                    if not e then
                        local fold = Instance.new("Folder", espforlder)
                        fold.Name = plr.Name
                        
                        --partconverter.BrickColor = plr.Team.Color
                        --local teamc = partconverter.Color
                        for i, p in pairs(plr.Character:GetChildren()) do
                            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                                if charmsesp then
                                local urmom = Instance.new("BoxHandleAdornment")
                                urmom.ZIndex = 10
                                urmom.AlwaysOnTop = true
                                urmom.Color3 = espcolor
                                urmom.Size = p.Size
                                urmom.Adornee = p
                                urmom.Name = tick().." Ur mom has big gay"
                                urmom.Transparency = wallhack_esp_transparency
                                urmom.Parent = fold
                                if p.Name == "Head" then
                                    local th = p:FindFirstChild("headoverthing")
                                    if not th then
                                        local ht = espheadthing:Clone()
                                        ht.PName.Text = p.Parent.Name
                                        ht.Adornee = p
                                        --table.insert(headsupdatelist, ht)
                                        delay(0, function()
                                            while wait(0.08) and plr and p do
                                                f.UpdateHeadUI(ht)
                                            end
                                        end)
                                        ht.Parent = p
                                    end
                                end
                                end
                            end
                        end
                        plr.Character.Humanoid.Died:Connect(function()
                            fold:Destroy()
                        end)
                        
                    end
                    end)
                end
            else
                local e = espforlder:FindFirstChild(plr.Name)
                if not e then
                    local fold = Instance.new("Folder", espforlder)
                        fold.Name = plr.Name
                        
                        --partconverter.BrickColor = plr.Team.Color
                        --local teamc = Move.BackgroundColor3
                        for i, p in pairs(plr.Character:GetChildren()) do
                            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                                pcall(function()
                                if charmsesp then
                                local urmom = Instance.new("BoxHandleAdornment")
                                urmom.ZIndex = 10
                                urmom.AlwaysOnTop = true
                                urmom.Color3 = espcolor
                                urmom.Size = p.Size
                                urmom.Adornee = p
                                urmom.Name = tick().." Ur mom has big gay"
                                urmom.Transparency = wallhack_esp_transparency
                                urmom.Parent = fold
                                end
                                if p.Name == "Head" then
                                    local th = p:FindFirstChild("headoverthing")
                                    if not th then
                                        local ht = espheadthing:Clone()
                                        ht.PName.Text = p.Parent.Name
                                        ht.Adornee = p
                                        delay(0, function()
                                            while wait(0.08) and plr and p do
                                                f.UpdateHeadUI(ht)
                                            end
                                        end)
                                        --table.insert(headsupdatelist, ht)
                                        ht.Parent = p
                                    end
                                end
                                end)
                            end
                        end
                        plr.Character.Humanoid.Died:Connect(function()
                            fold:Destroy()
                        end)
                end
            end
            
            
        end
    end
    end)
end

local uis = game:GetService("UserInputService")
local bringall = false
local hided2 = false
local upping = false
local downing = false
mouse.KeyDown:Connect(function(a)
    
    if a == "t" then
        --print("worked1")
        f.addesp()
    elseif a == gui_hide_button[2] and uis:IsKeyDown(gui_hide_button[1]) then
        if hided2 == false then
            hided2 = true
            autoesp =false
            if espforlder then
                espforlder:Destroy()
            end
            Gui.Enabled = false
        else
            Gui.Enabled = true
            hided2 = false
        end
            
    elseif a == "" then
        if aimbothider == false then
            aimbothider = true
            if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
        else
            
            aimbothider = false
            if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
        end
        if aimbothider == true then
            aimbothiderbox.TextColor3 =Color3.fromRGB(11, 255, 19)
        else
            aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
        end
    elseif a == "l" then
        if not uis:IsKeyDown(Enum.KeyCode.LeftControl) then
            if autoesp == false then
                autoesp = true
            else
                autoesp = false
            end
        else
            if lightesp == true then
                lightesp = false
            else
                lightesp = true
            end
        end
    elseif a == "]" then
        upping = true
        downing = false
    elseif a== "[" then
        downing = true
        upping = false
    elseif a == Aim_Assist_Key[2] and uis:IsKeyDown(Aim_Assist_Key[1]) then
        if Aim_Assist == true then
            Aim_Assist = false
            --print("disabled")
        else
            Aim_Assist = true
        end
    end
    if a == "j" then
        if mouse.Target then
            mouse.Target:Destroy()
        end
    end
    if a == key then
        if switch == false then
            switch = true
        else
            switch = false
            if aimatpart ~= nil then
                aimatpart = nil
            end
        end
    elseif a == "b" and uis:IsKeyDown(Enum.KeyCode.LeftControl) and not uis:IsKeyDown(Enum.KeyCode.R) then
        if movementcounting then
            movementcounting = false
        else
            movementcounting = true
        end
    elseif a == teambasedswitch then
        if TeamBased == true then
            TeamBased = false
            teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
        else
            TeamBased = true
            teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
        end
    elseif a == "b" and uis:IsKeyDown(Enum.KeyCode.LeftControl) and uis:IsKeyDown(Enum.KeyCode.R) then
        ballisticsboost = 0
    elseif a == aimkey then
        if not aimatpart then
            local maxangle = math.rad(20)
            for i, plr in pairs(plrs:GetChildren()) do
                if plr.Name ~= lplr.Name and plr.Character and plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 1 then
                    if TeamBased == true then
                        if plr.Team.Name ~= lplr.Team.Name then
                            local an = checkfov(plr.Character.Head)
                            if an < maxangle then
                                maxangle = an
                                aimatpart = plr.Character.Head
                            end
                        end
                    else
                        local an = checkfov(plr.Character.Head)
                            if an < maxangle then
                                maxangle = an
                                aimatpart = plr.Character.Head
                            end
                            --print(plr)
                    end
                    local old = aimatpart
                    plr.Character.Humanoid.Died:Connect(function()
                        --print("died")
                        if aimatpart and aimatpart == old then
                            aimatpart = nil
                        end
                    end)
                    
                end
            end
        else
            aimatpart = nil
            canaimat = false
            delay(1.1, function()
                canaimat = true
            end)
        end
    end
end)

function getfovxyz (p0, p1, deg)
    local x1, y1, z1 = p0:ToOrientation()
    local cf = CFrame.new(p0.p, p1.p)
    local x2, y2, z2 = cf:ToOrientation()
    local d = math.deg
    if deg then
        return Vector3.new(d(x1-x2), d(y1-y2), d(z1-z2))
    else
        return Vector3.new((x1-x2), (y1-y2), (z1-z2))
    end
end


function aimat(part)
    if part then
        --print(part)
        local d = (cam.CFrame.p - part.CFrame.p).magnitude
        local calculatedrop
        local timetoaim = 0
        local pos2 = Vector3.new()
        if movementcounting == true then
            timetoaim = d/bspeed
            pos2 = part.Velocity * timetoaim
        end
        local minuseddrop = (ballisticsboost+50)/50
        if ballisticsboost ~= 0 then
            calculatedrop = d - (d/minuseddrop)
            
        else
            calculatedrop = 0
        end
        --print(calculatedrop)
        local addative = Vector3.new()
        if movementcounting then
            addative = pos2
        end
        local cf = CFrame.new(cam.CFrame.p, (addative + part.CFrame.p+ Vector3.new(0, calculatedrop, 0)))
        if aimbothider == true or Aim_Assist == true then
            cam.CFrame = cam.CFrame:Lerp(cf, aimbothiderspeed)
        else
            
            cam.CFrame = cf
        end
        --print(cf)
    end
end
function checkfov (part)
    local fov = getfovxyz(game.Workspace.CurrentCamera.CFrame, part.CFrame)
    local angle = math.abs(fov.X) + math.abs(fov.Y)
    return angle
end
pcall(function()
    delay(0, function()
        while wait(.32) do
            if Aim_Assist and not aimatpart and canaimat and lplr.Character and lplr.Character.Humanoid and lplr.Character.Humanoid.Health > 0 then
                for i, plr in pairs(plrs:GetChildren()) do
                    
                    
                        local minangle = math.rad(5.5)
                        local lastpart = nil
                        local function gg(plr)
                            pcall(function()
                            if plr.Name ~= lplr.Name and plr.Character and plr.Character.Humanoid and plr.Character.Humanoid.Health > 0 and plr.Character.Head then
                                local raycasted = false
                                local cf1 = CFrame.new(cam.CFrame.p, plr.Character.Head.CFrame.p) * CFrame.new(0, 0, -4)
                                local r1 = Ray.new(cf1.p, cf1.LookVector * 9000)
                                local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
                                local dist = (plr.Character.Head.CFrame.p- pos).magnitude
                                if dist < 4 then
                                    raycasted = true
                                end
                                if raycasted == true then
                                    local an1 = getfovxyz(cam.CFrame, plr.Character.Head.CFrame)
                                    local an = abs(an1.X) + abs(an1.Y)
                                    if an < minangle then
                                        minangle = an
                                        lastpart = plr.Character.Head
                                    end
                                end
                            end
                            end)
                        end
                        if TeamBased then
                            if plr.Team.Name ~= lplr.Team.Name then
                                gg(plr)
                            end
                        else
                            gg(plr)
                        end
                        --print(math.deg(minangle))
                        if lastpart then
                            aimatpart = lastpart
                            aimatpart.Parent.Humanoid.Died:Connect(function()
                                if aimatpart == lastpart then
                                    aimatpart = nil
                                end
                            end)
                        
                    end
                end
            end
        end
    end)
end)
local oldheadpos
local lastaimapart
game:GetService("RunService").RenderStepped:Connect(function(dt)
    if uis:IsKeyDown(Enum.KeyCode.RightBracket) or uis:IsKeyDown(Enum.KeyCode.LeftBracket) then
        if upping then
            ballisticsboost = ballisticsboost + dt/1.9
        elseif downing then
            ballisticsboost = ballisticsboost - dt/1.9
        end
    end
    if movementcounting then
        st1_2.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
        st1_2.Text = "Current ballistics: "..tostring(math.floor(ballisticsboost*10)/10)
    else
        st1_2.TextColor3 = Color3.new(1,0,0)
    end
    espstatustext.Text = "Esp loop :"..tostring(autoesp)
    if aimatpart and lplr.Character and lplr.Character.Head then
        if BetterDeathCount and lastaimapart and lastaimapart == aimatpart then
            local dist = (oldheadpos - aimatpart.CFrame.p).magnitude
            if dist > 40 then
                aimatpart = nil
            end
        end
        lastaimapart = aimatpart
        oldheadpos = lastaimapart.CFrame.p
        do 
            if aimatpart.Parent == plrs.LocalPlayer.Character then
                aimatpart = nil
            end
            aimat(aimatpart)
            pcall(function()
                if Aim_Assist == true then
                    local cf1 = CFrame.new(cam.CFrame.p, aimatpart.CFrame.p) * CFrame.new(0, 0, -4)
                    local r1 = Ray.new(cf1.p, cf1.LookVector * 1000)
                    local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
                    local dist = (aimatpart.CFrame.p- pos).magnitude
                    if obj then
                        --print(obj:GetFullName())
                    end
                    if not obj or dist > 6 then
                        aimatpart = nil
                        --print("ooof")
                    end
                    canaimat = false
                    delay(.5, function()
                        canaimat = true
                    end)
                end
            end)
        end
        
        
        
    end
end)


delay(0, function()
    while wait(espupdatetime) do
        if autoesp == true then
            pcall(function()
            f.addesp()
            end)
        end
    end
end)
--warn("loaded")
end)
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MainSection:NewButton("JailMonkey", "MASSIVE FPS DROP", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/MonkeyScripts/main/JailMonkey.lua"))()
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("GabX", "GabX", function()
   --// GabX, the script hub that has all you need! \\--
-- Made by Darion#8863

local tabs = {
	{
		name = "Scripts",
		comingsoon = false,
		scripts = {
			{
				"R2S (EnvEdit)",
				"https://pastebin.com/raw/ZAHTikfe"
			},
			{
				"Old R2S",
				"https://pastebin.com/raw/jXh45kfE"
			},
			{
				"Grab Knife V4",
				"https://pastebin.com/raw/7zK1Swpt"
			},
			{
				"Grab Knife V3",
				"https://pastebin.com/raw/TPZXG8fH"
			},
			{
				"R6 Fly(E)",
				"https://pastebin.com/raw/hTJsM2jV"
			},
			{
				"Speed",
				"https://pastebin.com/raw/mrdWh73D"
			},
			{
				"JumpPower",
				"https://pastebin.com/raw/sA5xym2V"
			},
			{
				"Loopheal",
				"https://pastebin.com/raw/vD9zjBQx"
			},
			{
				"Chat Logs",
				"https://pastebin.com/raw/mtGM0Dkh"
			},
			{
				"Audio Stealer",
				"https://pastebin.com/raw/ABRqgZ3L"
			},
			{
				"FE Check (F9)",
				"https://pastebin.com/raw/SRibuFiK"
			},
			{
				"No clip (F)",
				"https://pastebin.com/raw/bnqAE95f"
			},
			{
				"Bomb Vest",
				"https://pastebin.com/raw/S7vdifqp"
			},
			{
				"Robux Troll",
				"https://pastebin.com/raw/BHjfPXC6"
			}
		}
	},
	{
		name = "FeScripts",
		comingsoon = false,
		scripts = {
			{
				"FE God",
				"https://pastebin.com/raw/p814kXmM"
			},
			{
				"Kill/Fling",
				"https://pastebin.com/raw/Pb3PR6EL"
			},
			{
				"Shutdown",
				"https://pastebin.com/raw/RELufQFM"
			},
			{
				"Hat Spin",
				"https://pastebin.com/raw/Y8iEYKZD"
			},
			{
				"Suicide Gun",
				"https://pastebin.com/raw/SeRxrgci"
			},
			{
				"Click TP Tool",
				"https://pastebin.com/raw/16tXkJjD"
			},
			{
				"OOF Spam",
				"https://pastebin.com/raw/JaMbzp0B"
			},
			{
				"Respawn",
				"https://pastebin.com/raw/61WmHqNp"
			}
		}
	},
	{
		name = "GUIs",
		comingsoon = false,
		scripts = {
			{
				"Topk3k V4",
				"https://pastebin.com/raw/bEmmF8UH"
			},
			{
				"Arosia",
				"https://pastebin.com/raw/Nwit6ZqP"
			},
			{
				"Equinox",
				"https://pastebin.com/raw/scYFbHQb"
			},
			{
				"Ani's(R15)",
				"https://pastebin.com/raw/MenK10Ak"
			},
			{
				"Ani's(R6)",
				"https://pastebin.com/raw/Ydt76Kep"
			},
			{
				"Rose Hub",
				"https://pastebin.com/raw/1BJj0fB4"
			},
			{
				"OPFinality",
				"https://pastebin.com/raw/fG5b1zrM"
			},
			{
				"Old OPHub",
				"https://pastebin.com/raw/FxhQbqsp"
			},
			{
				"HyperTotal",
				"https://pastebin.com/raw/aYdepQa0"
			},
			{
				"Clown Van",
				"https://pastebin.com/raw/0uJXBEmN"
			},
			{
				"Sern Hub",
				"https://pastebin.com/raw/8sD7V8xp"
			},
			{
				"Cooler Kids V2",
				"https://pastebin.com/raw/GGQeWXSL"
			},
			{
				"Ping/FPS",
				"https://pastebin.com/raw/Qh8eeWF7"
			},
			{
				"Spectate",
				"https://pastebin.com/raw/WgpJfMGS"
			},
			{
				"Ro-xploit",
				"https://pastebin.com/raw/ZkhCcaa5"
			},
			{
				"TP GUI",
				"https://pastebin.com/raw/EBhdqeWb"
			}
		}
	},
	{
		name = "Commands",
		comingsoon = false,
		scripts = {
			{
				"BTools",
				"https://pastebin.com/raw/752Gzv1G"
			},
			{
				"Ghost",
				"https://pastebin.com/raw/aiYL4LKV"
			},
			{
				"Big pp",
				"https://pastebin.com/raw/xAcpS2Ze"
			},
			{
				"Inf Jump",
				"https://pastebin.com/raw/Dz61QSir"
			}
		}
	},
	{
		name = "Stat Change",
		comingsoon = false,
		scripts = {
			{
				"Clone Tycoon 2",
				"https://pastebin.com/raw/ga02bJq5"
			},
			{
				"Naruto Final Bond LVL",
				"https://pastebin.com/raw/j5gYsnxM"
			},
			{
				"Shinobi Life",
				"https://pastebin.com/raw/rpWG7xBj"
			},
			{
				"Rocitizens",
				"https://pastebin.com/raw/P3WAujA9"
			},
			{
				"Naruto New Gen",
				"https://pastebin.com/raw/34Fdq480"
			},
			{
				"False DBFP",
				"https://pastebin.com/raw/tTCcVDAf"
			},
			{
				"Jaws",
				"https://pastebin.com/raw/RkNJ3jn2"
			},
			{
				"Giant Survival 2",
				"https://pastebin.com/raw/sbme5pNF"
			},
			{
				"One Piece Unleashed 2",
				"https://pastebin.com/raw/QAgtrGdX"
			},
			{
				"Tuber Simulator",
				"https://pastebin.com/raw/zy1dFtrc"
			},
			{
				"Yard Work Simulator",
				"https://pastebin.com/raw/udKYdRpW"
			},
			{
				"Dragon Ball Super 2",
				"https://pastebin.com/raw/U5i77x2T"
			},
			{
				"Avatar: Legend of Kora",
				"https://pastebin.com/raw/ggcfAQcH"
			}
		}
	},
	{
		name = "Games",
		comingsoon = false,
		scripts = {
			{
				"NRPG Beyond Fast Shoot",
				"https://pastebin.com/raw/zXCvQxRF"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Jailbreak AFK",
				"https://pastebin.com/raw/hhRca3cj"
			},
			{
				"Jailbreak GUI",
				"https://pastebin.com/raw/CQFw06tN"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Lumber Tycoon",
				"https://pastebin.com/raw/33kYAahS"
			},
			{
				"Phantom Forces",
				"https://pastebin.com/raw/LgQEjvxS"
			},
			{
				"Hilton Hotels",
				"https://pastebin.com/raw/QfHywxaZ"
			},
			{
				"Work At A Pizza Place",
				"https://pastebin.com/raw/KyfBZCKL"
			},
			{
				"Prison Royale",
				"https://pastebin.com/raw/0W4QBB5C"
			},
			{
				"Greenwood Town",
				"https://pastebin.com/raw/96JTe9Gd"
			},
			{	
				"Naruto Final Bond",
				"https://pastebin.com/raw/ujKgVWBn"
			},
			{	"Project Pokemon",
				"https://pastebin.com/raw/jDTLJf9Z"
			},
			{	"Scuba Diving",
				"https://pastebin.com/raw/NwSeijRv"
			}
		}
	},
	{
		name = "Admins",
		comingsoon = false,
		scripts = {
			{
				"Infinite Yield",
				"https://pastebin.com/raw/MjBzRjmT"
			},
			{
				"Rocky's",
				"https://pastebin.com/raw/3V4s9UPx"
			},
			{
				"Dex Explorer",
				"https://pastebin.com/raw/eqy8yt4q"
			},
			{
				"N3xulis",
				"https://pastebin.com/raw/eKkbtM3A"
			},
			{
				"ARX Admin",
				"https://pastebin.com/raw/4PGmJv5R"
			},
			{
				"Shattervast",
				"https://pastebin.com/raw/44bNjECt"
			},
			{
				"Filter My Ass",
				"https://pastebin.com/raw/Tn1xz43y"
			},
			{
				"C00lgui",
				"https://pastebin.com/raw/Xt0S28mx"
			},
			{
				"Mayem",
				"https://pastebin.com/raw/tWQnvRqH"
			},
			{
				"Nosyliam",
				"https://pastebin.com/raw/FmeiVpiE"
			},
			{
				"Your Mom V2",
				"https://pastebin.com/raw/1FsNUZHq"
			},
			{
				"PME Safazi",
				"https://pastebin.com/raw/yrnDMLYs"
			}
		}
	},
	{
		name = "Forms",
		comingsoon = false,
		scripts = {
			{
				"Madara",
				"https://pastebin.com/raw/LYjZdycr"
			},
			{
				"Shadow Titan",
				"https://pastebin.com/raw/E7b9cy1h"
			},
			{
				"Assasin",
				"https://pastebin.com/raw/bKu2GuzN"
			},
			{
				"Beast Claws",
				"https://pastebin.com/raw/0AH8SZTJ"
			},
			{
				"6 Swords",
				"https://pastebin.com/raw/80juE2kw"
			},
			{
				"Goku SSJ3",
				"https://pastebin.com/raw/vFmVuXk4"
			},
			{
				"OmagaV2",
				"https://pastebin.com/raw/VSerZV3e"
			},
			{
				"Absalom Titan",
				"https://pastebin.com/raw/ZmySaMrb"
			},
			{
				"Ace",
				"https://pastebin.com/raw/fA4XSTY1"
			},
			{
				"Beerus",
				"https://pastebin.com/raw/c1TGDAKC"
			},
			{
				"DSSJ4",
				"https://pastebin.com/raw/pfdud8wK"
			},
			{
				"Zenatic",
				"https://pastebin.com/raw/wTJxmWyG"
			},
			{
				"Naruto",
				"https://pastebin.com/raw/eEN5mC9u"
			}
		}
	},
	{
		name = "Extra",
		comingsoon = true
	}
}
local othertabs = {
	{
		name = "Info",
		text = "GabX was made by a new learning scripter named Darion. It started off as a simple project to learn scripting just for myself, but I decided to release it anyways just for fun. It received quite a bit of attention and several youtube videos were made on it. I felt like I didn't deserve the support because nothing was actually made by me, I just added buttons. I decided to rewrite the UI all by myself! I did get some help in the scripting part because I'm not the best in scripting since I'm new to making scripts and exploiting related stuff in general. Now GabX has been updated and the UI was all self made! Also, when I wanted to release it I didn't know any good name for it. I asked my friend and he didn't know either, so I just chose my friends name and added an X to it! :D",
	},
	{
		name = "Help",
		text = "If there is anything patched, not the most recent update, broken or anything else please DM Darion#8863 and join the server. http://discord.gg/E64Jd89"
	},
	{
		name = "Credits",
		text = "GabX was made by Darion#8863."
	}
}


local gui = Instance.new("ScreenGui")
gui.Parent = gethui()

local openclose = Instance.new("TextButton")
openclose.Parent = gui
openclose.Name = "OpenClose"
openclose.Style = Enum.ButtonStyle.RobloxRoundButton
openclose.Font = Enum.Font.SciFi
openclose.TextSize = 25
openclose.Text = "OPEN"
openclose.ZIndex = 12
openclose.Size = UDim2.new(0, 110,0, 45)
openclose.Position = UDim2.new(0, 0,0.791, 0)

local top = Instance.new("Frame")
top.Parent = gui
top.Name = "Topbar"
top.BorderSizePixel = 0
top.BackgroundColor3 = Color3.new((192 / 255), (225 / 255), (237 / 255))
top.Size = UDim2.new(0, 500, 0, 36)
top.Position = UDim2.new(0, -505, 0.5, -218)
top.Draggable = true
top.Active = true
top.ZIndex = 10
top.Visible = false

local logo = Instance.new("ImageLabel")
logo.Parent = top
logo.Name = "Logo"
logo.BorderSizePixel = 0
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://1902404068"
logo.ScaleType = Enum.ScaleType.Crop
logo.Size = UDim2.new(0, 140, 0, 36)
logo.Position = UDim2.new(0.5, -70, 0, 0)
logo.ZIndex = 11

local main = Instance.new("Frame")
main.Parent = top
main.Name = "MainFrame"
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BackgroundTransparency = 0.2
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(1, 0, 0, 400)
main.ZIndex = 10

local tabsf = Instance.new("Frame")
tabsf.Parent = main
tabsf.Name = "Tabs"
tabsf.BorderSizePixel = 0
tabsf.BackgroundTransparency = 1
tabsf.Position = UDim2.new(0, 0, 0, 0)
tabsf.Size = UDim2.new(0, 100, 1, 0)


openclose.MouseButton1Click:connect(function()
	if top.Visible then
		openclose.Text = "OPEN"
		top:TweenPosition(UDim2.new(0, -505, 0.5, -218))
		wait(1.05)
		top.Visible = false
	else
		openclose.Text = "CLOSE"
		top.Visible = true
		top:TweenPosition(UDim2.new(0.5, -250, 0.5, -218))
		wait(1.05)
	end 
end)

local current = "Scripts"
for i1, tab in ipairs(tabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, (i1 - 1) * 30)
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local tabfr = Instance.new("Frame")
	tabfr.Parent = main
	tabfr.Name = tab.name
	tabfr.BorderSizePixel = 0
	tabfr.BackgroundTransparency = 1
	tabfr.Size = UDim2.new(0, 390, 1, -10)
	tabfr.Position = UDim2.new(0, 105, 0, 5)
	if tab.name ~= current then
		tabfr.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		tabfr.Visible = true 
	end)
	
	if tab.comingsoon then
		local text = Instance.new("TextLabel")
		text.Parent = tabfr
		text.BorderSizePixel = 0
		text.BackgroundTransparency = 1
		text.BackgroundColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.SciFi
		text.TextSize = 60
		text.Text = "Coming Soon!"
		text.Position = UDim2.new(0, 0, 0, 0)
		text.Size = UDim2.new(1, 0, 0, 100)
		text.ZIndex = 11
	else
		for i2, scr in ipairs(tab.scripts) do
			local scrbtn = Instance.new("TextButton")
			scrbtn.Parent = tabfr
			scrbtn.Name = scr[1]
			scrbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
			scrbtn.Position = UDim2.new(0, ((i2 - 1) % 4) * 100, 0, math.floor((i2 - 1) / 4) * 50)
			scrbtn.Size = UDim2.new(0, 90, 0, 40)
			scrbtn.TextSize = 14
			scrbtn.TextScaled = true
			scrbtn.TextScaled = false
			scrbtn.Font = Enum.Font.SciFi
			scrbtn.Text = scr[1]
			scrbtn.ZIndex = 11
			
			scrbtn.MouseButton1Click:connect(function()
				loadstring(game:HttpGet(scr[2], true))()
			end)
		end
	end
end
for i,tab in ipairs(othertabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name 
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, 314 + ((i - 1) * 30))
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local text = Instance.new("TextLabel")
	text.Parent = main
	text.Name = tab.name 
	text.BorderSizePixel = 0
	text.BackgroundTransparency = 0.2
	text.BackgroundColor3 = Color3.new(1, 1, 1)
	text.Size = UDim2.new(0, 390, 1, -10)
	text.Position = UDim2.new(0, 105, 0, 5)
	text.Text = tab.text
	text.Font = Enum.Font.SciFi
	text.TextSize = 20
	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextYAlignment = Enum.TextYAlignment.Top
	text.TextWrapped = true
	text.ZIndex = 11 
	if tab.name ~= current then
		text.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		text.Visible = true 
	end)
end

end)

   local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
--Prison Life
elseif game.PlaceId == 155615604 then
    local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)


MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
end)

MainSection:NewButton("Prison Destroyer V2", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/DTi4fbKh"))();
end)

MainSection:NewButton("Prison Life Anti Abusers GUI", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/6mhZBAkh",true))()
end)

MainSection:NewButton("Prison Destroyer", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/08z0DUDE",true))()
end)

MainSection:NewButton("Kick Player", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/5iyrwLSH",true))()
end)

MainSection:NewButton("Prison Destroyer V1.6", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/4rkRHviN",true))()
end)

MainSection:NewButton("Loop Bring All", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/j80DG72a",true))()
end)

MainSection:NewButton("Bring All/Crim", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/aiNDd7Js",true))()
end)
game.Players.LocalPlayer.PlayerGui.Home.fadeFrame:Destroy()
        local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    -- Build A Boat
elseif game.PlaceId == 537413528 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("scriptt", "just a gui", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Build%20A%20Boat%20For%20Treasure/BABFT"))()
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- Gorilla Tag Professional
elseif game.PlaceId == 8690998110 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")




local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
	    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
            local Window = Library.CreateLib("SkyHub Universal", OptTheme)
            local Main = Window:NewTab("Main")
            local MainSection = Main:NewSection("Main")
            MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
                setclipboard(string)
            end)
	 MainSection:NewButton("V3rm Script", "Copys Discord invite link", function()
                -- Made by 13 YOLD
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
local window1 = library:Window("Scripts")
local window2 = library:Window("Teleport Areas")
window1:Button("Infinite Wins", function()
    spawn(function()
while true do
   local dec = game:GetService("Workspace"):FindFirstChild("ClickToGetCash").ClickDetector
   fireclickdetector(dec)
   local fun = game:GetService("Workspace"):FindFirstChild("ClickToGetCash").ClickDetector
   fireclickdetector(fun)
   wait(0.1)
end
end)
end)
window2:Button("Spectate (Easy Win)", function()
    spawn(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39.386, 59.2163, -102.248)

end)
end)
window1:Button("TP All to You (Use Lava)", function()
    spawn(function()
  for _, player in pairs(game.Players:GetPlayers()) do
player.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
      end
    end)
end)
window2:Button("Become a Lava Monke", function()
    spawn(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(79.2755, 71.1624, -54.2756)
end)
end)
window1:Slider("Walkspeed",16,70,5, function(value)
  game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
window1:Slider("JumpPower",50,150,20, function(value)
  game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
end)
library:Keybind("Tab")
game:GetService("StarterGui"):SetCore("SendNotification",{     
Title = "Important!",     
Text = "Infinite Wins is patched",
Button1 = "unpatch pls?",Button2 = "no",     Duration = 20, })
            end)
-- Universal
else
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = gethui()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
	    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
            local Window = Library.CreateLib("SkyHub Universal", OptTheme)
            local Main = Window:NewTab("Main")
            local MainSection = Main:NewSection("Main")
            MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
                setclipboard(string)
            end)

            MainSection:NewButton("NoClip", "Walk Through Walls Hold V", function()
                local h,char,play
                play = game.Players.LocalPlayer
                local uisss = game:getService("UserInputService")
                game:getService("RunService"):BindToRenderStep("",0,function()
                    char = play.Character
	                if char then h = char:findFirstChildOfClass("Humanoid") end
	               if not h then return end
	               if uisss:IsKeyDown(Enum.KeyCode.V) then
		                h:ChangeState(11)
	                end
                end)
            end)

            MainSection:NewButton("Btools", "Btools lol", function()
                game.StarterGui:SetCoreGuiEnabled(2, true)
                a = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
                a.BinType = 2
                b = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
                b.BinType = 3
                c = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
                c.BinType = 4
            end)
 
MainSection:NewButton("FE Gui", "By Me sky", function()
                local Admin = Instance.new("ScreenGui")
local MainFrame = Instance.new("ScrollingFrame")
local FlyBut = Instance.new("TextButton")
local RespawnBut = Instance.new("TextButton")
local Credslol = Instance.new("TextLabel")
local ClickTpBut = Instance.new("TextButton")
local NoClipBut = Instance.new("TextButton")
local SonicBut = Instance.new("TextButton")
local TelekiniesBut = Instance.new("TextButton")
local WalkWallsBut = Instance.new("TextButton")
local BtoolsBut = Instance.new("TextButton")
local MEME = Instance.new("TextButton")

Admin.Name = "Admin"
Admin.Parent = gethui()
Admin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = Admin
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.fromRGB(208, 66, 255)
MainFrame.Position = UDim2.new(0.416337252, 0, 0.274846643, 0)
MainFrame.Size = UDim2.new(0, 429, 0, 262)

FlyBut.Name = "FlyBut"
FlyBut.Parent = MainFrame
FlyBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyBut.Position = UDim2.new(0, 0, 0.0306748468, 0)
FlyBut.Size = UDim2.new(0, 200, 0, 50)
FlyBut.Style = Enum.ButtonStyle.RobloxButton
FlyBut.Font = Enum.Font.SourceSans
FlyBut.Text = "Fly"
FlyBut.TextColor3 = Color3.fromRGB(58, 93, 170)
FlyBut.TextSize = 14.000

RespawnBut.Name = "RespawnBut"
RespawnBut.Parent = MainFrame
RespawnBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RespawnBut.Position = UDim2.new(0.510489523, 0, 0.0306748468, 0)
RespawnBut.Size = UDim2.new(0, 200, 0, 50)
RespawnBut.Style = Enum.ButtonStyle.RobloxButton
RespawnBut.Font = Enum.Font.SourceSans
RespawnBut.Text = "Respawn"
RespawnBut.TextColor3 = Color3.fromRGB(58, 93, 170)
RespawnBut.TextSize = 14.000

Credslol.Name = "Creds lol"
Credslol.Parent = MainFrame
Credslol.BackgroundColor3 = Color3.fromRGB(208, 66, 255)
Credslol.Size = UDim2.new(0, 419, 0, 50)
Credslol.Font = Enum.Font.SourceSans
Credslol.Text = "FE GUI Made By Sky Press down on Mouse Wheel to open/close"
Credslol.TextColor3 = Color3.fromRGB(58, 93, 170)
Credslol.TextSize = 14.000

ClickTpBut.Name = "ClickTpBut"
ClickTpBut.Parent = MainFrame
ClickTpBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickTpBut.Position = UDim2.new(-0.00233101845, 0, 0.0650306717, 0)
ClickTpBut.Size = UDim2.new(0, 200, 0, 50)
ClickTpBut.Style = Enum.ButtonStyle.RobloxButton
ClickTpBut.Font = Enum.Font.SourceSans
ClickTpBut.Text = "ClickTP"
ClickTpBut.TextColor3 = Color3.fromRGB(58, 93, 170)
ClickTpBut.TextSize = 14.000

NoClipBut.Name = "NoClipBut"
NoClipBut.Parent = MainFrame
NoClipBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NoClipBut.Position = UDim2.new(0.510489523, 0, 0.0650306717, 0)
NoClipBut.Size = UDim2.new(0, 200, 0, 50)
NoClipBut.Style = Enum.ButtonStyle.RobloxButton
NoClipBut.Font = Enum.Font.SourceSans
NoClipBut.Text = "Noclip"
NoClipBut.TextColor3 = Color3.fromRGB(58, 93, 170)
NoClipBut.TextSize = 14.000

SonicBut.Name = "SonicBut"
SonicBut.Parent = MainFrame
SonicBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SonicBut.Position = UDim2.new(-0.00233097491, 0, 0.0969325155, 0)
SonicBut.Size = UDim2.new(0, 200, 0, 50)
SonicBut.Style = Enum.ButtonStyle.RobloxButton
SonicBut.Font = Enum.Font.SourceSans
SonicBut.Text = "FE Sonic Animation"
SonicBut.TextColor3 = Color3.fromRGB(58, 93, 170)
SonicBut.TextSize = 14.000

TelekiniesBut.Name = "TelekiniesBut"
TelekiniesBut.Parent = MainFrame
TelekiniesBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TelekiniesBut.Position = UDim2.new(0.510489523, 0, 0.0957055241, 0)
TelekiniesBut.Size = UDim2.new(0, 200, 0, 50)
TelekiniesBut.Style = Enum.ButtonStyle.RobloxButton
TelekiniesBut.Font = Enum.Font.SourceSans
TelekiniesBut.Text = "Telekines"
TelekiniesBut.TextColor3 = Color3.fromRGB(58, 93, 170)
TelekiniesBut.TextSize = 14.000

WalkWallsBut.Name = "WalkWallsBut"
WalkWallsBut.Parent = MainFrame
WalkWallsBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WalkWallsBut.Position = UDim2.new(0, 0, 0.130061358, 0)
WalkWallsBut.Size = UDim2.new(0, 200, 0, 50)
WalkWallsBut.Style = Enum.ButtonStyle.RobloxButton
WalkWallsBut.Font = Enum.Font.SourceSans
WalkWallsBut.Text = "FE Walk On walls"
WalkWallsBut.TextColor3 = Color3.fromRGB(58, 93, 170)
WalkWallsBut.TextSize = 14.000

BtoolsBut.Name = "BtoolsBut"
BtoolsBut.Parent = MainFrame
BtoolsBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BtoolsBut.Position = UDim2.new(0.510489523, 0, 0.130061358, 0)
BtoolsBut.Size = UDim2.new(0, 200, 0, 50)
BtoolsBut.Style = Enum.ButtonStyle.RobloxButton
BtoolsBut.Font = Enum.Font.SourceSans
BtoolsBut.Text = "Btools"
BtoolsBut.TextColor3 = Color3.fromRGB(58, 93, 170)
BtoolsBut.TextSize = 14.000

MEME.Name = "MEME"
MEME.Parent = MainFrame
MEME.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MEME.Position = UDim2.new(0, 0, 0.16257669, 0)
MEME.Size = UDim2.new(0, 200, 0, 50)
MEME.Style = Enum.ButtonStyle.RobloxButton
MEME.Font = Enum.Font.SourceSans
MEME.Text = "MEME"
MEME.TextColor3 = Color3.fromRGB(58, 93, 170)
MEME.TextSize = 14.000

-- Scripts:

local function TSQII_fake_script() -- FlyBut.Fly 
	local script = Instance.new('LocalScript', FlyBut)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Text == "Fly Already On." then
			game.StarterGui:SetCore("SendNotification",  {
				Title = "Fly Noti";
				Text = "FLY ALREADY ON";
				Icon = "";
				Duration = 5;
			})
		else
			script.Parent.Text = "Press E to disable/Enable"
			wait(2.5)
			script.Parent.Text = "Fly Already On."
			repeat wait() 
			until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
			local mouse = game.Players.LocalPlayer:GetMouse() 
			repeat wait() until mouse
			local plr = game.Players.LocalPlayer 
			local torso = plr.Character.HumanoidRootPart 
			local flying = true
			local deb = true 
			local ctrl = {f = 0, b = 0, l = 0, r = 0} 
			local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
			local maxspeed = 50 
			local speed = 0 
	
			function Fly() 
				local bg = Instance.new("BodyGyro", torso) 
				bg.P = 9e4 
				bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
				bg.cframe = torso.CFrame 
				local bv = Instance.new("BodyVelocity", torso) 
				bv.velocity = Vector3.new(0,0.1,0) 
				bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
				repeat wait() 
					plr.Character.Humanoid.PlatformStand = true 
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
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
						lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
					elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
					else 
						bv.velocity = Vector3.new(0,0.1,0) 
					end 
					bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
				until not flying 
				ctrl = {f = 0, b = 0, l = 0, r = 0} 
				lastctrl = {f = 0, b = 0, l = 0, r = 0} 
				speed = 0 
				bg:Destroy() 
				bv:Destroy() 
				plr.Character.Humanoid.PlatformStand = false 
			end 
			mouse.KeyDown:connect(function(key) 
				if key:lower() == "e" then 
					if flying then flying = false 
					else 
						flying = true 
						Fly() 
					end 
				elseif key:lower() == "w" then 
					ctrl.f = 1 
				elseif key:lower() == "s" then 
					ctrl.b = -1 
				elseif key:lower() == "a" then 
					ctrl.l = -1 
				elseif key:lower() == "d" then 
					ctrl.r = 1 
				end 
			end) 
			mouse.KeyUp:connect(function(key) 
				if key:lower() == "w" then 
					ctrl.f = 0 
				elseif key:lower() == "s" then 
					ctrl.b = 0 
				elseif key:lower() == "a" then 
					ctrl.l = 0 
				elseif key:lower() == "d" then 
					ctrl.r = 0 
				end 
			end)
			Fly()
		end
	end)
end
coroutine.wrap(TSQII_fake_script)()
local function XMMUGI_fake_script() -- MainFrame.Drag 
	local script = Instance.new('LocalScript', MainFrame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(XMMUGI_fake_script)()
local function UEZKG_fake_script() -- RespawnBut.Repsawn 
	local script = Instance.new('LocalScript', RespawnBut)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Text == "Respawning..." then
			game.StarterGui:SetCore("SendNotification",  {
				Title = "Respawn Noti";
				Text = "Already Respawning...";
				Icon = "";
				Duration = 5;
			})
		else
			script.Parent.Text = "Respawning..."
			wait(2.5)
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			game.Players.LocalPlayer.Character.Head.Remove()
			end
	end)
end
coroutine.wrap(UEZKG_fake_script)()
local function WOLU_fake_script() -- MainFrame.MouseButton3 
	local script = Instance.new('LocalScript', MainFrame)

	local UserInputService = game:GetService("UserInputService")
	local function onInputBegan(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton3 then
			if script.Parent.Visible == true then
				script.Parent.Visible = false
			else
				script.Parent.Visible = true
			end
		end
	end
	UserInputService.InputBegan:Connect(onInputBegan)
	
end
coroutine.wrap(WOLU_fake_script)()
local function TGAB_fake_script() -- ClickTpBut.ClickTp 
	local script = Instance.new('LocalScript', ClickTpBut)

	script.Parent.MouseButton1Down:Connect(function()
		mouse = game.Players.LocalPlayer:GetMouse()
		tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.Name = "Click Teleport"
		tool.Activated:connect(function()
			local pos = mouse.Hit+Vector3.new(0,2.5,0)
			pos = CFrame.new(pos.X,pos.Y,pos.Z)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		end)
		tool.Parent = game.Players.LocalPlayer.Backpack
	
	end)
end
coroutine.wrap(TGAB_fake_script)()
local function AATJTM_fake_script() -- NoClipBut.Noclip 
	local script = Instance.new('LocalScript', NoClipBut)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Text == "Noclip" then
			script.Parent.Text = "Clip"
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
		wait(2.6)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";noclip","All")
		else
			script.Parent.Text = "Noclip"
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";clip","All")
		end
	end)
end
coroutine.wrap(AATJTM_fake_script)()
local function ZDXVH_fake_script() -- SonicBut.Sonic 
	local script = Instance.new('LocalScript', SonicBut)

	script.Parent.MouseButton1Down:Connect(function()
		loadstring(game:HttpGetAsync("https://pastebin.com/raw/SyF5t70A"))()
	end)
end
coroutine.wrap(ZDXVH_fake_script)()
local function CRSQC_fake_script() -- TelekiniesBut.TEL 
	local script = Instance.new('LocalScript', TelekiniesBut)

	script.Parent.MouseButton1Down:Connect(function()
		--BROUGHT TO YOU BY RobloxScripter.com!--
		--Follow Our Partners!--
	
		local function a(b, c)
			local d = getfenv(c)
			local e =
				setmetatable(
					{},
					{__index = function(self, f)
					if f == "script" then
						return b
					else
						return d[f]
					end
				end}
				)
			setfenv(c, e)
			return c
		end
		local g = {}
		local h = Instance.new("Model", game:GetService("Lighting"))
		local i = Instance.new("Tool")
		local j = Instance.new("Part")
		local k = Instance.new("Script")
		local l = Instance.new("LocalScript")
		local m = sethiddenproperty or set_hidden_property
		i.Name = "Telekinesis"
		i.Parent = h
		i.Grip = CFrame.new(0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
		i.GripForward = Vector3.new(-0, -1, -0)
		i.GripRight = Vector3.new(0, 0, 1)
		i.GripUp = Vector3.new(1, 0, 0)
		j.Name = "Handle"
		j.Parent = i
		j.CFrame = CFrame.new(-17.2635937, 15.4915619, 46, 0, 1, 0, 1, 0, 0, 0, 0, -1)
		j.Orientation = Vector3.new(0, 180, 90)
		j.Position = Vector3.new(-17.2635937, 15.4915619, 46)
		j.Rotation = Vector3.new(-180, 0, -90)
		j.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
		j.Transparency = 1
		j.Size = Vector3.new(1, 1.20000005, 1)
		j.BottomSurface = Enum.SurfaceType.Weld
		j.BrickColor = BrickColor.new("Really black")
		j.Material = Enum.Material.Metal
		j.TopSurface = Enum.SurfaceType.Smooth
		j.brickColor = BrickColor.new("Really black")
		k.Name = "LineConnect"
		k.Parent = i
		table.insert(
			g,
			a(
				k,
				function()
					wait()
					local n = script.Part2
					local o = script.Part1.Value
					local p = script.Part2.Value
					local q = script.Par.Value
					local color = script.Color
					local r = Instance.new("Part")
					r.TopSurface = 0
					r.BottomSurface = 0
					r.Reflectance = .5
					r.Name = "Laser"
					r.Locked = true
					r.CanCollide = false
					r.Anchored = true
					r.formFactor = 0
					r.Size = Vector3.new(1, 1, 1)
					local s = Instance.new("BlockMesh")
					s.Parent = r
					while true do
						if n.Value == nil then
							break
						end
						if o == nil or p == nil or q == nil then
							break
						end
						if o.Parent == nil or p.Parent == nil then
							break
						end
						if q.Parent == nil then
							break
						end
						local t = CFrame.new(o.Position, p.Position)
						local dist = (o.Position - p.Position).magnitude
						r.Parent = q
						r.BrickColor = color.Value.BrickColor
						r.Reflectance = color.Value.Reflectance
						r.Transparency = color.Value.Transparency
						r.CFrame = CFrame.new(o.Position + t.lookVector * dist / 2)
						r.CFrame = CFrame.new(r.Position, p.Position)
						s.Scale = Vector3.new(.25, .25, dist)
						wait()
					end
					r:remove()
					script:remove()
				end
			)
		)
		k.Disabled = true
		l.Name = "MainScript"
		l.Parent = i
		table.insert(
			g,
			a(
				l,
				function()
					wait()
					tool = script.Parent
					lineconnect = tool.LineConnect
					object = nil
					mousedown = false
					found = false
					BP = Instance.new("BodyPosition")
					BP.maxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
					BP.P = BP.P * 1.1
					dist = nil
					point = Instance.new("Part")
					point.Locked = true
					point.Anchored = true
					point.formFactor = 0
					point.Shape = 0
					point.BrickColor = BrickColor.Black()
					point.Size = Vector3.new(1, 1, 1)
					point.CanCollide = false
					local s = Instance.new("SpecialMesh")
					s.MeshType = "Sphere"
					s.Scale = Vector3.new(.7, .7, .7)
					s.Parent = point
					handle = tool.Handle
					front = tool.Handle
					color = tool.Handle
					objval = nil
					local u = false
					local v = BP:clone()
					v.maxForce = Vector3.new(30000, 30000, 30000)
					function LineConnect(o, p, q)
						local w = Instance.new("ObjectValue")
						w.Value = o
						w.Name = "Part1"
						local x = Instance.new("ObjectValue")
						x.Value = p
						x.Name = "Part2"
						local y = Instance.new("ObjectValue")
						y.Value = q
						y.Name = "Par"
						local z = Instance.new("ObjectValue")
						z.Value = color
						z.Name = "Color"
						local A = lineconnect:clone()
						A.Disabled = false
						w.Parent = A
						x.Parent = A
						y.Parent = A
						z.Parent = A
						A.Parent = workspace
						if p == object then
							objval = x
						end
					end
					function onButton1Down(B)
						if mousedown == true then
							return
						end
						mousedown = true
						coroutine.resume(
							coroutine.create(
								function()
									local C = point:clone()
									C.Parent = tool
									LineConnect(front, C, workspace)
									while mousedown == true do
										C.Parent = tool
										if object == nil then
											if B.Target == nil then
												local t = CFrame.new(front.Position, B.Hit.p)
												C.CFrame = CFrame.new(front.Position + t.lookVector * 1000)
											else
												C.CFrame = CFrame.new(B.Hit.p)
											end
										else
											LineConnect(front, object, workspace)
											break
										end
										wait()
									end
									C:remove()
								end
							)
						)
						while mousedown == true do
							if B.Target ~= nil then
								local D = B.Target
								if D.Anchored == false then
									object = D
									dist = (object.Position - front.Position).magnitude
									break
								end
							end
							wait()
						end
						while mousedown == true do
							if object.Parent == nil then
								break
							end
							local t = CFrame.new(front.Position, B.Hit.p)
							BP.Parent = object
							BP.position = front.Position + t.lookVector * dist
							wait()
						end
						BP:remove()
						object = nil
						objval.Value = nil
					end
					function onKeyDown(E, B)
						local E = E:lower()
						local F = false
						if E == "q" then
							if dist >= 5 then
								dist = dist - 10
							end
						end
						if E == "r" then
							if object == nil then
								return
							end
							for G, H in pairs(object:children()) do
								if H.className == "BodyGyro" then
									return nil
								end
							end
							BG = Instance.new("BodyGyro")
							BG.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
							BG.cframe = CFrame.new(object.CFrame.p)
							BG.Parent = object
							repeat
								wait()
							until object.CFrame == CFrame.new(object.CFrame.p)
							BG.Parent = nil
							if object == nil then
								return
							end
							for G, H in pairs(object:children()) do
								if H.className == "BodyGyro" then
									H.Parent = nil
								end
							end
							object.Velocity = Vector3.new(0, 0, 0)
							object.RotVelocity = Vector3.new(0, 0, 0)
							object.Orientation = Vector3.new(0, 0, 0)
						end
						if E == "e" then
							dist = dist + 10
						end
						if E == "t" then
							if dist ~= 10 then
								dist = 10
							end
						end
						if E == "y" then
							if dist ~= 200 then
								dist = 200
							end
						end
						if E == "=" then
							BP.P = BP.P * 1.5
						end
						if E == "-" then
							BP.P = BP.P * 0.5
						end
					end
					function onEquipped(B)
						keymouse = B
						local I = tool.Parent
						human = I.Humanoid
						human.Changed:connect(
							function()
								if human.Health == 0 then
									mousedown = false
									BP:remove()
									point:remove()
									tool:remove()
								end
							end
						)
						B.Button1Down:connect(
							function()
								onButton1Down(B)
							end
						)
						B.Button1Up:connect(
							function()
								mousedown = false
							end
						)
						B.KeyDown:connect(
							function(E)
								onKeyDown(E, B)
							end
						)
						B.Icon = "rbxasset://textures\\GunCursor.png"
					end
					tool.Equipped:connect(onEquipped)
				end
			)
		)
		for J, H in pairs(h:GetChildren()) do
			H.Parent = game:GetService("Players").LocalPlayer.Backpack
			pcall(
				function()
					H:MakeJoints()
				end
			)
		end
		h:Destroy()
		for J, H in pairs(g) do
			spawn(
				function()
					pcall(H)
				end
			)
		end
	end)
end
coroutine.wrap(CRSQC_fake_script)()
local function ZHDWEL_fake_script() -- WalkWallsBut.walls 
	local script = Instance.new('LocalScript', WalkWallsBut)

	script.Parent.MouseButton1Down:Connect(function()
		getgenv()["cofiG"] = getgenv()["cofiG"] or {}
		local hasToUpdate = true
		local alreadyRan = cofiG.gravityController ~= nil
	
		local http = game:GetService'HttpService'
		local readfile,writefile,fileexists = readfile or syn_io_read,writefile or syn_io_write,isfile or readfile
	
		local rawUrl,baseUrl = "https://ixss.keybase.pub/rblx/gravityController/", "https://keybase.pub/ixss/rblx/gravityController/"
	
		do
			_G.req = [[
	        local require = function(lol)
	            lol = "https://raw.githubusercontent.com/msva/lua-htmlparser/master/src/"..lol:gsub("%.","/")..".lua";
	            return loadstring(_G.req..game:HttpGet(lol))();
	        end;
	    ]]
	
			local require = function(lol)
				lol = "https://raw.githubusercontent.com/msva/lua-htmlparser/master/src/"..lol:gsub("%.","/")..".lua";
				return loadstring(_G.req..game:HttpGet(lol))();
			end;
	
			cofiG.htmlparser = cofiG.htmlparser or require"htmlparser"
		end
	
		do  -- check if exists
			if fileexists'gravityController.json' then
				local json = readfile'gravityController.json'
				if json then
					cofiG.gravityController = http:JSONDecode(json)
					hasToUpdate = cofiG.gravityController.Version ~= game:HttpGet(rawUrl.."Version.txt")
				end
			end
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = hasToUpdate and "Updating script..." or "Running script!";
				Font = Enum.Font.Code;
				Color = Color3.fromRGB(255, 60, 60);
				FontSize = Enum.FontSize.Size96;   
			})
		end
	
	
		if hasToUpdate then -- update/download
	
			function getScripts()
				local ret = {}
				local text = game:HttpGet(baseUrl, false)
	
				local root = cofiG.htmlparser.parse(text)
				local files = root:select(".file")
	
				for i,v in pairs(files) do
					if string.sub(v.attributes.href, string.len(v.attributes.href)-3) == ".lua" then
						local name = string.sub(v.attributes.href,string.len(baseUrl)+1, string.len(v.attributes.href)-4)
						local script = rawUrl..name..".lua"
						ret[name] = game:HttpGet(script)
					elseif string.sub(v.attributes.href, string.len(v.attributes.href)-3) == ".txt" then
						local name = string.sub(v.attributes.href,string.len(baseUrl)+1, string.len(v.attributes.href)-4)
						local script = rawUrl..name..".txt"
						ret[name] = game:HttpGet(script)
					end
				end
	
				return ret
			end
			cofiG.gravityController = getScripts()
			writefile('gravityController.json', http:JSONEncode(cofiG.gravityController))
			warn('Script updated!')
		end
	
		local a,b = pcall(loadstring(cofiG.gravityController.Loader))
	
		if not a then
			error('Loader ', b)
		end
	
		if not alreadyRan then
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = game:HttpGet('https://ixss.keybase.pub/Watermark.txt', true)..", originally made by EgoMoose.";
				Font = Enum.Font.Code;
				Color = Color3.fromRGB(244, 0, 175);
				FontSize = Enum.FontSize.Size96;   
			})
		end
	end)
end
coroutine.wrap(ZHDWEL_fake_script)()
local function GGZTRR_fake_script() -- BtoolsBut.Btools 
	local script = Instance.new('LocalScript', BtoolsBut)

	script.Parent.MouseButton1Down:Connect(function()
		game.StarterGui:SetCoreGuiEnabled(2, true)
		a = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
		a.BinType = 2
		b = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
		b.BinType = 3
		c = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
		c.BinType = 4
	end)
end
coroutine.wrap(GGZTRR_fake_script)()
local function ACHGC_fake_script() -- MEME.me me 
	local script = Instance.new('LocalScript', MEME)

	script.Parent.MouseButton1Down:Connect(function()
		loadstring(game:HttpGetAsync("https://pastebin.com/raw/0QfjMKrF"))()
	end)
end
coroutine.wrap(ACHGC_fake_script)()

            end)    


    MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

MainSection:NewButton("Dex", "Explorer", function()
loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()
end)

MainSection:NewButton("Impluse hub", "idk", function()
loadstring(game:HttpGet('http://impulse-hub.xyz/ImpulseHub',true))()
 end)

MainSection:NewButton("Zyrex-Hub", "10+", function()
   _G.Toggle_GUI = Enum.KeyCode.RightControl --Right Ctrl

loadstring(game:HttpGet(("https://raw.githubusercontent.com/NotZyrex/Zyrex-Hub/master/Main.lua"), true))();
end)

MainSection:NewButton("Psyhub", "idk", function()
loadstring(game:GetObjects("rbxassetid://3014051754")[1].Source)()
 end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("Remote Spy", "Find remotes press F9", function()
loadstring(game:HttpGet('https://pastebin.com/raw/b33cjh0p'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)
    
	   MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

        MainSection:NewButton("Infinite Yield FE", "Admin", function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)

        MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
            setclipboard(string2)
        end)
        
        MainSection:NewButton("Destroy GUIS", "CLCK A LOT OF TIMES", function()
                for i, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            if v.Name == "Main" and v.Parent then
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                break
            end
        end
end)
        
        local Player = Window:NewTab("Player")
        local PlayerSection = Player:NewSection("Player")
        PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end)

        PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end)
        
        local Placeinfo = Window:NewTab("Place Info")
        local Playerinform = Placeinfo:NewSection("Place Info")
        
         Playerinform:NewButton(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Description), function()
end)
Playerinform:NewButton(game:GetService("Players"):GetNameFromUserIdAsync(game.CreatorId), (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Description), function()

end)
       Playerinform:NewButton("FilterEnabled/Repesect Is: (Click dots)", ("Click on the button and press F9"), function()
       print(game.Workspace.FilteringEnabled, "If it says true it means its on if it says false then it means its off")
        if game:GetService("SoundService").RespectFilteringEnabled == true then
                    print("RespectFilteringEnabled is enabled")
                else
                    print("RespectFilteringEnabled is disabled")
                end
       end)
    end
    end
    if not syn and not S == "ScriptWare" then
    --[[games it supports Da Hood, Arsenal, Tower of Hell, KAT!, Fencing,
Work At A Pizza Place, VR Hands, Adopt Me, Jailbreak, Prison Life, and
Build A Boat For Treasure, and Gorrila Tag Professional.
12+ games
Rebuilt On IllusionHub
Last Updated 2/18/2022
]]--
local OptTheme = "BloodTheme"
local string = "https://discord.gg/A6HQQXvwNs"
local string2 = "https://discord.com/invite/jVf7eSrED9"
-- Da Hood
if game.PlaceId == 2788229376 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
   local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

MainSection:NewButton("RayCodeX", "Launches RayCodeX script", function()
   loadstring(game:GetObjects("rbxassetid://5812737894")[1].Source)()
end)


MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

   local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
--Arsenal
elseif game.PlaceId == 286090429 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)


MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("Impluse hub", "idk", function()
loadstring(game:HttpGet('http://impulse-hub.xyz/ImpulseHub',true))()
 end)

MainSection:NewButton("Zyrex-Hub", "10+", function()
   _G.Toggle_GUI = Enum.KeyCode.RightControl --Right Ctrl

loadstring(game:HttpGet(("https://raw.githubusercontent.com/NotZyrex/Zyrex-Hub/master/Main.lua"), true))();
end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Arsenal RAC Ban Menu", "Shows in chat also I have no idea what this does", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/qtDZm7LX"))()
end)

MainSection:NewButton("MonkeThing", "idk", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/MonkeHub/main/arsenal.lua"))()
end)

MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

MainSection:NewButton("Arsenal FE audio + more!", "NOTE: you can get banned from some of these scripts", function()
 value = "2038227137" --song id here


    local args = {
        [1] = {
            [1] = "UpdateID",
            [2] =  value,
        },
    }
    
    game:GetService("ReplicatedStorage").Events.UpdateLoadout:FireServer(unpack(args))

local args = {
    [1] = true,
    [2] = game:GetService("ReplicatedStorage").Taunts.Megaphone,
}

game:GetService("ReplicatedStorage").Events.ReplicateGear:FireServer(unpack(args))




Players = game:GetService("Players")
for i, player in pairs(Players:GetPlayers()) do
    print("["..i.."] = "..player.Name)
    local args = {
    [1] = "GET NOOB",
    "["..i.."] = "..player.Name,
}
end
  end)
-- Tower Of Hell
elseif game.PlaceId == 1962086868 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Tower of hell script", "just a gui", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/JayZone69/Tower-of-Hell/main/Script"))()
end)

MainSection:NewButton("Tower of hell script2", "idka", function()
   loadstring(game:HttpGet("https://gist.githubusercontent.com/BloxiYT/26f5c60eaed40ab1ab4e1756a70eac69/raw/b386cfd481e316f72103a0e88c0316be7891f3fb/OMG%2520123456"))()
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- KAT!
elseif game.PlaceId == 621129760 then 
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)


MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("KAT!", "auto throws knife", function()
   --Subscribe to Ducky Exploits
function nearestPlayerToRay()
    local dist = math.huge
    local ray
    
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Head") and not v.Character:FindFirstChild("ForceField") then
            if v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") then -- needed..
                local newVec = (v.Character.Head.Position - game.Players.LocalPlayer.Character.Head.Position)
                if newVec.magnitude < dist then
                    local toRay = Ray.new(game.Players.LocalPlayer.Character.Head.Position, newVec)
                    if not workspace:FindPartOnRayWithIgnoreList(toRay, {game.Players.LocalPlayer.Character, v.Character, workspace.WorldIgnore, workspace.CurrentCamera}) then
                        dist = newVec.magnitude
                        ray = toRay
                    end
                end
            end
        end
    end
    return ray
end

local ray

function init()
    local knife = game.Players.LocalPlayer.Character:WaitForChild("Knife")
    local scr = getsenv(knife.KnifeServer.KnifeClient)
    if scr then
        local ir = scr.inputReleased
        local u7 = debug.getupvalue(ir, 2)
        local cam = debug.getupvalue(ir, 5)
        debug.setupvalue(ir, 5, setmetatable({}, {
            __index = function(t,k)
                if k == "ScreenPointToRay" then
                    if ray ~= nil then
                        return function() return ray end
                    end
                end
                return cam[k]
            end
        }))
    
        
        while wait(.1) do
            if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                break    
            end
            ray = nearestPlayerToRay()
            if ray then
                scr.inputDown()
                u7.ChargeStart = -math.huge
                ir()
            end
        end
    end
end

init()
game.Players.LocalPlayer.CharacterAdded:connect(function()
    print("hi")
    wait()
    init()
   end)
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)


local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
 -- Fencing
 elseif game.PlaceId == 12109643 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
 local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

   MainSection:NewButton("FE Brick Spam", "spams bricks", function()
   -- https://www.roblox.com/games/12109643/Fencing

game:GetService('RunService').Stepped:connect(function()
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v.Name == "Spray" then
if v.Handle.Mesh then
v.Handle.Mesh:Destroy()
end
v.Parent = workspace
end
end
end)
local function paint()
for i,v in pairs(game.Workspace:GetChildren())do
if v.Name == "Handle" then
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
v.Transparency = 1
v.CanCollide = false
wait()
v.CFrame = game.Players.LocalPlayer.Character["Left Leg"].CFrame
end
end
end
local function equip()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do
if v.Name == "Spray" then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
end
end
end
while wait(0.05) do
paint()
equip()
end
end)

MainSection:NewButton("FE Gain Double Health", "bruh", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(56,3.5,124.5)
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-130,3.5,30)
end)

MainSection:NewButton("FE Give SprayPaint", "SprayPaint", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-130,3.5,30)
end)

MainSection:NewButton("FE Perm God Mode", "permeanent God mode", function()
   button              = workspace.Button
button.CanCollide   = false
button.Transparency = 1

game:GetService("RunService").Heartbeat:connect(function(step)
button.CFrame = CFrame.new(game.Players.LocalPlayer.Character.Head.Position)
button.Size   = Vector3.new(math.random(0,0), math.random(0,0), math.random(1,5))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Right Arm"].Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character.Torso.Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Left Arm"].Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Left Leg"].Position)
wait()
button.Size   = Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
button.CFrame = CFrame.new(game.Players.LocalPlayer.Character["Right Leg"].Position)
end)
end)

MainSection:NewButton("FE Reach", "Farther Reach", function()
   a=Instance.new("SelectionBox",game.Players.LocalPlayer.Backpack.Foil.Handle)
a.Adornee=game.Players.LocalPlayer.Backpack.Foil.Handle
game.Players.LocalPlayer.Backpack.Foil.Handle.Size=Vector3.new(1,1,30)
end)

MainSection:NewButton("FE Seat Spam", "Seat Spam", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25,7.5,54)
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Sit            = false
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30,7.5,54)
wait(0.05)
end)

MainSection:NewButton("FE Weird Broken Fencing Swords", "Swords", function()
  game.Lighting["LinkedSword3"]:Clone().Parent = game.Players.LocalPlayer.Backpack
game.Lighting["LinkedSword2"]:Clone().Parent = game.Players.LocalPlayer.Backpack
game.Lighting["LinkedSword"]:Clone().Parent = game.Players.LocalPlayer.Backpack
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- Work at a Pizza Place
 elseif game.PlaceId == 192800 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
 local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)
   
 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)
   
MainSection:NewButton("IDK", "script", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/cEwtwKZR",true))()
end)

MainSection:NewButton("FE Open Manager's Door", "Opens Manager's Door", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(43,5,7)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(42,5,7)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(43,5,7)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51,5,7)
end)

MainSection:NewButton("FE Paint Cars Hot Pink", "Paints the cars but it can be laggy", function()
 --Change "Hot Pink" to a Roblox Color that they have.

local Color = BrickColor.new('Hot pink')

local PaintCar = function(Car,Color_Code)
for ii, Child in pairs(Car:GetChildren()) do
game.ReplicatedStorage.Channels.VehicleChannel:FireServer('Paint', Child, 'None', Color_Code)
end
end

while wait() do
for i, Car in pairs(workspace.Cars:GetChildren()) do
PaintCar(Car, Color.Number)
end
end
end)

MainSection:NewButton("GabX", "GabX", function()
   --// GabX, the script hub that has all you need! \\--
-- Made by Darion#8863

local tabs = {
	{
		name = "Scripts",
		comingsoon = false,
		scripts = {
			{
				"R2S (EnvEdit)",
				"https://pastebin.com/raw/ZAHTikfe"
			},
			{
				"Old R2S",
				"https://pastebin.com/raw/jXh45kfE"
			},
			{
				"Grab Knife V4",
				"https://pastebin.com/raw/7zK1Swpt"
			},
			{
				"Grab Knife V3",
				"https://pastebin.com/raw/TPZXG8fH"
			},
			{
				"R6 Fly(E)",
				"https://pastebin.com/raw/hTJsM2jV"
			},
			{
				"Speed",
				"https://pastebin.com/raw/mrdWh73D"
			},
			{
				"JumpPower",
				"https://pastebin.com/raw/sA5xym2V"
			},
			{
				"Loopheal",
				"https://pastebin.com/raw/vD9zjBQx"
			},
			{
				"Chat Logs",
				"https://pastebin.com/raw/mtGM0Dkh"
			},
			{
				"Audio Stealer",
				"https://pastebin.com/raw/ABRqgZ3L"
			},
			{
				"FE Check (F9)",
				"https://pastebin.com/raw/SRibuFiK"
			},
			{
				"No clip (F)",
				"https://pastebin.com/raw/bnqAE95f"
			},
			{
				"Bomb Vest",
				"https://pastebin.com/raw/S7vdifqp"
			},
			{
				"Robux Troll",
				"https://pastebin.com/raw/BHjfPXC6"
			}
		}
	},
	{
		name = "FeScripts",
		comingsoon = false,
		scripts = {
			{
				"FE God",
				"https://pastebin.com/raw/p814kXmM"
			},
			{
				"Kill/Fling",
				"https://pastebin.com/raw/Pb3PR6EL"
			},
			{
				"Shutdown",
				"https://pastebin.com/raw/RELufQFM"
			},
			{
				"Hat Spin",
				"https://pastebin.com/raw/Y8iEYKZD"
			},
			{
				"Suicide Gun",
				"https://pastebin.com/raw/SeRxrgci"
			},
			{
				"Click TP Tool",
				"https://pastebin.com/raw/16tXkJjD"
			},
			{
				"OOF Spam",
				"https://pastebin.com/raw/JaMbzp0B"
			},
			{
				"Respawn",
				"https://pastebin.com/raw/61WmHqNp"
			}
		}
	},
	{
		name = "GUIs",
		comingsoon = false,
		scripts = {
			{
				"Topk3k V4",
				"https://pastebin.com/raw/bEmmF8UH"
			},
			{
				"Arosia",
				"https://pastebin.com/raw/Nwit6ZqP"
			},
			{
				"Equinox",
				"https://pastebin.com/raw/scYFbHQb"
			},
			{
				"Ani's(R15)",
				"https://pastebin.com/raw/MenK10Ak"
			},
			{
				"Ani's(R6)",
				"https://pastebin.com/raw/Ydt76Kep"
			},
			{
				"Rose Hub",
				"https://pastebin.com/raw/1BJj0fB4"
			},
			{
				"OPFinality",
				"https://pastebin.com/raw/fG5b1zrM"
			},
			{
				"Old OPHub",
				"https://pastebin.com/raw/FxhQbqsp"
			},
			{
				"HyperTotal",
				"https://pastebin.com/raw/aYdepQa0"
			},
			{
				"Clown Van",
				"https://pastebin.com/raw/0uJXBEmN"
			},
			{
				"Sern Hub",
				"https://pastebin.com/raw/8sD7V8xp"
			},
			{
				"Cooler Kids V2",
				"https://pastebin.com/raw/GGQeWXSL"
			},
			{
				"Ping/FPS",
				"https://pastebin.com/raw/Qh8eeWF7"
			},
			{
				"Spectate",
				"https://pastebin.com/raw/WgpJfMGS"
			},
			{
				"Ro-xploit",
				"https://pastebin.com/raw/ZkhCcaa5"
			},
			{
				"TP GUI",
				"https://pastebin.com/raw/EBhdqeWb"
			}
		}
	},
	{
		name = "Commands",
		comingsoon = false,
		scripts = {
			{
				"BTools",
				"https://pastebin.com/raw/752Gzv1G"
			},
			{
				"Ghost",
				"https://pastebin.com/raw/aiYL4LKV"
			},
			{
				"Big pp",
				"https://pastebin.com/raw/xAcpS2Ze"
			},
			{
				"Inf Jump",
				"https://pastebin.com/raw/Dz61QSir"
			}
		}
	},
	{
		name = "Stat Change",
		comingsoon = false,
		scripts = {
			{
				"Clone Tycoon 2",
				"https://pastebin.com/raw/ga02bJq5"
			},
			{
				"Naruto Final Bond LVL",
				"https://pastebin.com/raw/j5gYsnxM"
			},
			{
				"Shinobi Life",
				"https://pastebin.com/raw/rpWG7xBj"
			},
			{
				"Rocitizens",
				"https://pastebin.com/raw/P3WAujA9"
			},
			{
				"Naruto New Gen",
				"https://pastebin.com/raw/34Fdq480"
			},
			{
				"False DBFP",
				"https://pastebin.com/raw/tTCcVDAf"
			},
			{
				"Jaws",
				"https://pastebin.com/raw/RkNJ3jn2"
			},
			{
				"Giant Survival 2",
				"https://pastebin.com/raw/sbme5pNF"
			},
			{
				"One Piece Unleashed 2",
				"https://pastebin.com/raw/QAgtrGdX"
			},
			{
				"Tuber Simulator",
				"https://pastebin.com/raw/zy1dFtrc"
			},
			{
				"Yard Work Simulator",
				"https://pastebin.com/raw/udKYdRpW"
			},
			{
				"Dragon Ball Super 2",
				"https://pastebin.com/raw/U5i77x2T"
			},
			{
				"Avatar: Legend of Kora",
				"https://pastebin.com/raw/ggcfAQcH"
			}
		}
	},
	{
		name = "Games",
		comingsoon = false,
		scripts = {
			{
				"NRPG Beyond Fast Shoot",
				"https://pastebin.com/raw/zXCvQxRF"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Jailbreak AFK",
				"https://pastebin.com/raw/hhRca3cj"
			},
			{
				"Jailbreak GUI",
				"https://pastebin.com/raw/CQFw06tN"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Lumber Tycoon",
				"https://pastebin.com/raw/33kYAahS"
			},
			{
				"Phantom Forces",
				"https://pastebin.com/raw/LgQEjvxS"
			},
			{
				"Hilton Hotels",
				"https://pastebin.com/raw/QfHywxaZ"
			},
			{
				"Work At A Pizza Place",
				"https://pastebin.com/raw/KyfBZCKL"
			},
			{
				"Prison Royale",
				"https://pastebin.com/raw/0W4QBB5C"
			},
			{
				"Greenwood Town",
				"https://pastebin.com/raw/96JTe9Gd"
			},
			{	
				"Naruto Final Bond",
				"https://pastebin.com/raw/ujKgVWBn"
			},
			{	"Project Pokemon",
				"https://pastebin.com/raw/jDTLJf9Z"
			},
			{	"Scuba Diving",
				"https://pastebin.com/raw/NwSeijRv"
			}
		}
	},
	{
		name = "Admins",
		comingsoon = false,
		scripts = {
			{
				"Infinite Yield",
				"https://pastebin.com/raw/MjBzRjmT"
			},
			{
				"Rocky's",
				"https://pastebin.com/raw/3V4s9UPx"
			},
			{
				"Dex Explorer",
				"https://pastebin.com/raw/eqy8yt4q"
			},
			{
				"N3xulis",
				"https://pastebin.com/raw/eKkbtM3A"
			},
			{
				"ARX Admin",
				"https://pastebin.com/raw/4PGmJv5R"
			},
			{
				"Shattervast",
				"https://pastebin.com/raw/44bNjECt"
			},
			{
				"Filter My Ass",
				"https://pastebin.com/raw/Tn1xz43y"
			},
			{
				"C00lgui",
				"https://pastebin.com/raw/Xt0S28mx"
			},
			{
				"Mayem",
				"https://pastebin.com/raw/tWQnvRqH"
			},
			{
				"Nosyliam",
				"https://pastebin.com/raw/FmeiVpiE"
			},
			{
				"Your Mom V2",
				"https://pastebin.com/raw/1FsNUZHq"
			},
			{
				"PME Safazi",
				"https://pastebin.com/raw/yrnDMLYs"
			}
		}
	},
	{
		name = "Forms",
		comingsoon = false,
		scripts = {
			{
				"Madara",
				"https://pastebin.com/raw/LYjZdycr"
			},
			{
				"Shadow Titan",
				"https://pastebin.com/raw/E7b9cy1h"
			},
			{
				"Assasin",
				"https://pastebin.com/raw/bKu2GuzN"
			},
			{
				"Beast Claws",
				"https://pastebin.com/raw/0AH8SZTJ"
			},
			{
				"6 Swords",
				"https://pastebin.com/raw/80juE2kw"
			},
			{
				"Goku SSJ3",
				"https://pastebin.com/raw/vFmVuXk4"
			},
			{
				"OmagaV2",
				"https://pastebin.com/raw/VSerZV3e"
			},
			{
				"Absalom Titan",
				"https://pastebin.com/raw/ZmySaMrb"
			},
			{
				"Ace",
				"https://pastebin.com/raw/fA4XSTY1"
			},
			{
				"Beerus",
				"https://pastebin.com/raw/c1TGDAKC"
			},
			{
				"DSSJ4",
				"https://pastebin.com/raw/pfdud8wK"
			},
			{
				"Zenatic",
				"https://pastebin.com/raw/wTJxmWyG"
			},
			{
				"Naruto",
				"https://pastebin.com/raw/eEN5mC9u"
			}
		}
	},
	{
		name = "Extra",
		comingsoon = true
	}
}
local othertabs = {
	{
		name = "Info",
		text = "GabX was made by a new learning scripter named Darion. It started off as a simple project to learn scripting just for myself, but I decided to release it anyways just for fun. It received quite a bit of attention and several youtube videos were made on it. I felt like I didn't deserve the support because nothing was actually made by me, I just added buttons. I decided to rewrite the UI all by myself! I did get some help in the scripting part because I'm not the best in scripting since I'm new to making scripts and exploiting related stuff in general. Now GabX has been updated and the UI was all self made! Also, when I wanted to release it I didn't know any good name for it. I asked my friend and he didn't know either, so I just chose my friends name and added an X to it! :D",
	},
	{
		name = "Help",
		text = "If there is anything patched, not the most recent update, broken or anything else please DM Darion#8863 and join the server. http://discord.gg/E64Jd89"
	},
	{
		name = "Credits",
		text = "GabX was made by Darion#8863."
	}
}


local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local openclose = Instance.new("TextButton")
openclose.Parent = gui
openclose.Name = "OpenClose"
openclose.Style = Enum.ButtonStyle.RobloxRoundButton
openclose.Font = Enum.Font.SciFi
openclose.TextSize = 25
openclose.Text = "OPEN"
openclose.ZIndex = 12
openclose.Size = UDim2.new(0, 110,0, 45)
openclose.Position = UDim2.new(0, 0,0.791, 0)

local top = Instance.new("Frame")
top.Parent = gui
top.Name = "Topbar"
top.BorderSizePixel = 0
top.BackgroundColor3 = Color3.new((192 / 255), (225 / 255), (237 / 255))
top.Size = UDim2.new(0, 500, 0, 36)
top.Position = UDim2.new(0, -505, 0.5, -218)
top.Draggable = true
top.Active = true
top.ZIndex = 10
top.Visible = false

local logo = Instance.new("ImageLabel")
logo.Parent = top
logo.Name = "Logo"
logo.BorderSizePixel = 0
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://1902404068"
logo.ScaleType = Enum.ScaleType.Crop
logo.Size = UDim2.new(0, 140, 0, 36)
logo.Position = UDim2.new(0.5, -70, 0, 0)
logo.ZIndex = 11

local main = Instance.new("Frame")
main.Parent = top
main.Name = "MainFrame"
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BackgroundTransparency = 0.2
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(1, 0, 0, 400)
main.ZIndex = 10

local tabsf = Instance.new("Frame")
tabsf.Parent = main
tabsf.Name = "Tabs"
tabsf.BorderSizePixel = 0
tabsf.BackgroundTransparency = 1
tabsf.Position = UDim2.new(0, 0, 0, 0)
tabsf.Size = UDim2.new(0, 100, 1, 0)


openclose.MouseButton1Click:connect(function()
	if top.Visible then
		openclose.Text = "OPEN"
		top:TweenPosition(UDim2.new(0, -505, 0.5, -218))
		wait(1.05)
		top.Visible = false
	else
		openclose.Text = "CLOSE"
		top.Visible = true
		top:TweenPosition(UDim2.new(0.5, -250, 0.5, -218))
		wait(1.05)
	end 
end)

local current = "Scripts"
for i1, tab in ipairs(tabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, (i1 - 1) * 30)
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local tabfr = Instance.new("Frame")
	tabfr.Parent = main
	tabfr.Name = tab.name
	tabfr.BorderSizePixel = 0
	tabfr.BackgroundTransparency = 1
	tabfr.Size = UDim2.new(0, 390, 1, -10)
	tabfr.Position = UDim2.new(0, 105, 0, 5)
	if tab.name ~= current then
		tabfr.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		tabfr.Visible = true 
	end)
	
	if tab.comingsoon then
		local text = Instance.new("TextLabel")
		text.Parent = tabfr
		text.BorderSizePixel = 0
		text.BackgroundTransparency = 1
		text.BackgroundColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.SciFi
		text.TextSize = 60
		text.Text = "Coming Soon!"
		text.Position = UDim2.new(0, 0, 0, 0)
		text.Size = UDim2.new(1, 0, 0, 100)
		text.ZIndex = 11
	else
		for i2, scr in ipairs(tab.scripts) do
			local scrbtn = Instance.new("TextButton")
			scrbtn.Parent = tabfr
			scrbtn.Name = scr[1]
			scrbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
			scrbtn.Position = UDim2.new(0, ((i2 - 1) % 4) * 100, 0, math.floor((i2 - 1) / 4) * 50)
			scrbtn.Size = UDim2.new(0, 90, 0, 40)
			scrbtn.TextSize = 14
			scrbtn.TextScaled = true
			scrbtn.TextScaled = false
			scrbtn.Font = Enum.Font.SciFi
			scrbtn.Text = scr[1]
			scrbtn.ZIndex = 11
			
			scrbtn.MouseButton1Click:connect(function()
				loadstring(game:HttpGet(scr[2], true))()
			end)
		end
	end
end
for i,tab in ipairs(othertabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name 
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, 314 + ((i - 1) * 30))
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local text = Instance.new("TextLabel")
	text.Parent = main
	text.Name = tab.name 
	text.BorderSizePixel = 0
	text.BackgroundTransparency = 0.2
	text.BackgroundColor3 = Color3.new(1, 1, 1)
	text.Size = UDim2.new(0, 390, 1, -10)
	text.Position = UDim2.new(0, 105, 0, 5)
	text.Text = tab.text
	text.Font = Enum.Font.SciFi
	text.TextSize = 20
	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextYAlignment = Enum.TextYAlignment.Top
	text.TextWrapped = true
	text.ZIndex = 11 
	if tab.name ~= current then
		text.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		text.Visible = true 
	end)
end

end)

 MainSection:NewButton("FE Pizza Toppings Troll", "troll", function()
   for i,v in pairs(workspace.AllDough:GetChildren()) do
    workspace.GameService.AddIngredientToPizza:FireServer(v, "Sausage")
    workspace.GameService.AddIngredientToPizza:FireServer(v, "Cheese")
    workspace.GameService.AddIngredientToPizza:FireServer(v, "Pepperoni")
    workspace.GameService.AddIngredientToPizza:FireServer(v, "TomatoSauce")
end
end)

MainSection:NewButton("FE Teleport To manager chair", "it tps to manager chair", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(23,5,6.5)
  end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
 -- VR Hands
elseif game.PlaceId == 4832438542 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
 local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)
   
 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)
   
MainSection:NewButton("VR Hands GUI", "GUI", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/ugQ9Nb7t"))()
end)

MainSection:NewButton("Hands VR", "VR Hands withour VR", function()
    local cam = workspace.Camera
local p
local headObject
local events = {}

local controls = {
	[Enum.UserInputType.MouseButton1] = {"move", "leftHand"},
	[Enum.UserInputType.MouseMovement] = {"updateTarget"}, -- do not change
	[Enum.UserInputType.MouseWheel] = {"adjustOffset"},
	[Enum.UserInputType.MouseButton2] = {"move", "rightHand"},
	[Enum.KeyCode.W] = {"move", "head", Vector3.new(0, 1, 0)},
	[Enum.KeyCode.A] = {"move", "head", Vector3.new(-1, 0, 0)},
	[Enum.KeyCode.S] = {"move", "head", Vector3.new(0, -1, 0)},
	[Enum.KeyCode.D] = {"move", "head", Vector3.new(1, 0, 0)},
	[Enum.KeyCode.Q] = {"move", "head", Vector3.new(0, 0, -1)},
	[Enum.KeyCode.E] = {"move", "head", Vector3.new(0, 0, 1)},
	[Enum.KeyCode.LeftShift] = {"gesture", "Fist"},
	[Enum.KeyCode.LeftControl] = {"gesture", "Index"},
	[Enum.KeyCode.LeftAlt] = {"gesture", "Thumb"},
	[Enum.KeyCode.Z] = {"toggle", "canOffset"},
	[Enum.KeyCode.R] = {"toggle", "rotationManager"},
	[Enum.KeyCode.Tab] = {"selectAxis", "rotationManager"},
	[Enum.KeyCode.Left] = {"updateAxisMover", "rotationManager", -1},
	[Enum.KeyCode.Right] = {"updateAxisMover", "rotationManager", 1}
}

local services = {}

setmetatable(services, {
	__index = function(t, k)
		services[k] = rawget(services, k) or game:GetService(k)
		return services[k]
	end
})

local function angleBetween(vecx, vecy)
	return math.acos(vecx:Dot(vecy))
end

local hand = {}
hand.__index = hand

function hand:gesture(gestureName, keyState)
	if keyState ~= 1 then
		return
	end

	headObject.realHeadset[self.id .. gestureName] = 1 - headObject.realHeadset[self.id .. gestureName]
end

function hand:getMouseRay()
	local mousePos = services.UserInputService:GetMouseLocation()
	return CFrame.new(cam:ViewportPointToRay(mousePos.x, mousePos.y).Direction * (1.5 + headObject.handOffset))
end

function hand:calculateEndRotation()
	return CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()) * CFrame.Angles(self.rotation[1] * (math.pi/6), self.rotation[2] * (math.pi/6), self.rotation[3] * (math.pi/6))
end

function hand:updateTarget()

	local camLook = (cam.CFrame.lookVector * Vector3.new(1,0,1)).unit
	
	local theta = angleBetween(Vector3.new(-1, 0, 0), camLook)
	theta = camLook.z > 0 and (2 * math.pi) - theta or theta

	local relativeAngle = (self.id == "l" and -headObject.handAngle or headObject.handAngle)
	local startPosition = CFrame.new(-math.cos(theta + relativeAngle), -0.5, -math.sin(theta + relativeAngle)) + (camLook * headObject.handOffset)

	self.targetPosition = startPosition:Lerp(self:getMouseRay(), self.alpha) * self:calculateEndRotation()
	
	self.replicatePosition:Fire()
end

function hand:beginMove(minAlpha, maxAlpha)
	local distAlpha = (maxAlpha - minAlpha) / 2

	self.moving = true
	repeat
		services.RunService.RenderStepped:wait()
		self:updateTarget()
	until math.abs(self.alpha - minAlpha) < 0.05 or math.abs(maxAlpha - self.alpha) < 0.05 or self.alpha ~= self.alpha
	
	if self.alpha ~= self.alpha then
		self.alpha = 0
	end
	
	self.moving = false
end

function hand:move(keyState)

	if headObject.rotationManager.active then
		if self.id == "l" then
			headObject.rotationManager.held = keyState == 1
			
			headObject.rotationManager.selectedAxis = 0
		end
		return
	end

	self.alphaMultiplier = keyState == 1 and 0.05 or -0.05
	
	if not self.moving and not (keyState == 1 and self.alpha >= 1) then
		if keyState == 1 then
			headObject.recentHand = self
		end
	
		self:beginMove(0, 1)
	end
end

function hand:new(direction, realHand)
	local newHand = setmetatable({direction = direction, realHand = realHand}, hand)
	newHand.alpha = 0
	newHand.alphaMultiplier = 0.05
	newHand.id = direction and "r" or "l"
	newHand.targetPosition = CFrame.new()
	newHand.moving = false
	newHand.rotation = {0, 0, 0}
	newHand.replicatePosition = Instance.new("BindableEvent")
	newHand.replicatePosition.Event:connect(function()
		events.UserCFrameChanged:Fire(newHand.direction and Enum.UserCFrame.RightHand or Enum.UserCFrame.LeftHand, newHand.targetPosition)
	end)
	
	return newHand
end

local head = {}
head.__index = head

function head:handleInput(input, keyState)
	local bind = controls[input.KeyCode] or controls[input.UserInputType]
	
	if bind then
		if bind[1] == "updateTarget" and not self.rotationManager.active then
			self.leftHand:updateTarget()
			self.rightHand:updateTarget()
		elseif bind[2] and type(self[bind[2]]) == "table" then
			self[bind[2]][bind[1]](self[bind[2]], keyState, bind[3])
		elseif bind[3] then
			self[bind[1]](self, bind[3], keyState)
		elseif bind[2] and self.recentHand[bind[1]] then
			self.recentHand[bind[1]](self.recentHand, bind[2], keyState)
		else
			self[bind[1]](self, bind[2], keyState)
		end
	end
end

function head:adjustOffset(_, keyState)
	if self.canOffset then		
		self.leftHand:updateTarget()
		self.rightHand:updateTarget()
	end
end

function head:move(vec, keyState)
	if vec.z ~= 0 then
		self.realHeadset.Stick2 = math.clamp(self.realHeadset.Stick2 + (vec.z * keyState), -1, 1)
	else
	end
end

function head:freezeCam(b)
	local dist = (self.realHeadset.Head.PrimaryPart.Position - cam.CFrame.p).magnitude
		
	p.CameraMinZoomDistance = b and dist or 0.5
	p.CameraMaxZoomDistance = b and dist or 128
end

function head:toggle(stat, keyState)
	if keyState ~= 1 then
		return
	end

	self[stat] = not self[stat]
	
	if stat == "canOffset" then
		self:freezeCam(self[stat])
	end
end

local rotation = {}
rotation.__index = rotation

function rotation:new()
	local newRotation = setmetatable({}, rotation)
	
	newRotation.rotationLookup = {{}, {}, {}}
	newRotation.lineLookup = {{}, {}, {}}
	newRotation.active = false
	newRotation.held = false
	newRotation.selectedAxis = 0
	newRotation.angleLookup = {1, 1, 1}
	
	for i=1,3 do
		local ref = {}
		ref[i] = function() return 0 end
		ref[i + 1 > 3 and ((i + 1) % 4) + 1 or i + 1] = math.cos
		ref[i + 2 > 3 and ((i + 2) % 4) + 1 or i + 2] = math.sin
		
		local color = Color3.fromRGB(i == 1 and 255 or 0, i == 2 and 255 or 0, i == 3 and 255 or 0)
		
		for j=1,13 do
			if j < 13 then
				local step = math.pi * (j/6)
				newRotation.rotationLookup[i][j] = Vector3.new(ref[1](step), ref[2](step), ref[3](step))
			end
			
			local line = Drawing.new("Line")
			line.Visible = true
			line.Thickness = 5
			line.Color = color
			newRotation.lineLookup[i][j] = line
		end
		
		local circle = Drawing.new("Circle")
		circle.Visible = true
		circle.Color = color
		circle.Filled = true
		circle.Radius = 10
		circle.Position = Vector2.new(-2000, -2000)
		newRotation.lineLookup[i][14] = circle
		
		local text = Drawing.new("Text")
		text.Visible = true
		text.Font = Drawing.Fonts.System
		text.Size = 18
		text.Color = Color3.new():lerp(color, 0.3)
		text.Outline = false
		newRotation.lineLookup[i][15] = text
	end
	
	return newRotation
end

function rotation:selectAxis(keyState)
	self.tabActivated = keyState == 1
	if self.tabActivated then
		self.selectedAxis = math.clamp((self.selectedAxis + 1) % 4, 1, 3)
	end
end 

function rotation:toggle(keyState)
	if keyState == 1 and headObject.recentHand.alpha < 0.05 and not self.held then
		self.active = not self.active
		
		if not self.active then
			self:updateAxes(0)
			self.selectedAxis = 0
			self.held = false
			headObject.recentHand:updateTarget()
		end
	end
end

function rotation:updateAxes(visibleOverride)
	local basePos = headObject.recentHand.realHand.Base.Position
	local basePoint = cam:WorldToViewportPoint(basePos)

	for i=1,3 do
		for j=1,12 do
			local vec, visible = cam:WorldToViewportPoint(basePos + (self.rotationLookup[i][j] * 10))
			local vec2, visible2 = cam:WorldToViewportPoint(basePos + ((self.rotationLookup[i][j + 1] or self.rotationLookup[i][1]) * 10))
			
			local line = self.lineLookup[i][j]
			
			line.Transparency = visibleOverride or ((visible and visible2) and 1 or 0)
			line.From = Vector2.new(vec.x, vec.y)
			line.To = Vector2.new(vec2.x, vec2.y)
		end
		local axisRotation = headObject.recentHand.rotation[i]
		
		local axisMover = self.lineLookup[i][13]
		local axisCircle = self.lineLookup[i][14]
		local axisText = self.lineLookup[i][15]
		
		axisMover.From = Vector2.new(basePoint.x, basePoint.y)
		axisMover.To = self.lineLookup[i][math.clamp(axisRotation < 1 and 12 or axisRotation, 1, 12)].From -- sorry, lazy
		axisMover.Transparency = visibleOverride or 1
		
		axisCircle.Position = self.lineLookup[i][13].To
		axisCircle.Transparency = visibleOverride or 1
		
		
		
		axisText.Position = self.lineLookup[2][3].From + axisText.TextBounds
		axisText.Text = string.char(87 + self.selectedAxis) .. ": " .. math.deg(axisRotation * (math.pi / 6))
		axisText.Transparency = visibleOverride or ((self.held or self.tabActivated) and self.selectedAxis == i and 1 or 0)
		
		local mousePos = services.UserInputService:GetMouseLocation()
		if self.held and (self.lineLookup[i][14].Position - mousePos).magnitude < 10 and self.selectedAxis == 0 then
			self.selectedAxis = i
		end
	end
end

function rotation:updateAxisMover(keyState, direction)
	if keyState and direction then
		if self.tabActivated and keyState == 1 then
			headObject.recentHand.rotation[self.selectedAxis] = (headObject.recentHand.rotation[self.selectedAxis] + direction) % 12
			headObject.recentHand:updateTarget()
		end
		return
	end

	if self.selectedAxis ~= 0 then
		local mousePos = services.UserInputService:GetMouseLocation()
		
		local circlePos = self.lineLookup[self.selectedAxis][12].From
		
		local handPos = self.lineLookup[self.selectedAxis][13].From
		
		local mouseDir = self.selectedAxis == 1 and headObject.recentHand.id == "r" and (Vector2.new(-mousePos.x + (handPos.x * 2), mousePos.y) - handPos).unit or (mousePos - handPos).unit
		-- mouse angle relating to the red circle is reflected on the right hand, so i "re-reflect" it. bad practice
		
		local circleDir = (circlePos - handPos).unit
		
		local rotationTheta = angleBetween(mouseDir, circleDir)
		
		local direction = mouseDir:Cross(circleDir)
		
		rotationTheta = direction > 0 and rotationTheta or (2 * math.pi) - rotationTheta
		
		if rotationTheta == rotationTheta then
			headObject.recentHand.rotation[self.selectedAxis] = math.floor(6 * rotationTheta / math.pi)
			
			local hand = headObject.recentHand
			hand.replicatePosition:Fire()
		end
	end
end

function head:new(realHeadset)
	local newHead = setmetatable({realHeadset = realHeadset}, head)
	
	newHead.leftHand = hand:new(false, realHeadset.lHand)
	newHead.rightHand = hand:new(true, realHeadset.rHand)
	newHead.canOffset = false
	newHead.recentHand = newHead.leftHand
	newHead.handOffset = 0
	newHead.handAngle = math.pi / 4
	
	newHead.rotationManager = rotation:new()
	
	newHead.chatRemote = debug.getupvalue(realHeadset.ButtonPressed, 3)
	
	cam:GetPropertyChangedSignal("CameraSubject"):connect(function()
		if cam.CameraSubject ~= headObject.realHeadset.Head then
			cam.CameraType = Enum.CameraType.Custom
		end
	end)
	
	services.UserInputService.WindowFocused:connect(function()
		newHead.realHeadset.StickPosition = Vector3.new(0, 0, 0)
		newHead.realHeadset.Stick2 = 0
	end)
	
	return newHead
end

local ind, nc, nind

local realVrService = game:GetService("VRService")

local fakeVrService = setmetatable({
	VREnabled = true,
	SetTouchpadMode = function()
	end,
	RecenterUserHeadCFrame = function()
	end,
	GetUserCFrameEnabled = function(cf)
		return true
	end,
	GetUserCFrame = function(cf)
		return CFrame.new()
	end

}, {
	__index = function(t, k)
		local real = ind(realVrService, k)
		if typeof(real) == "RBXScriptSignal" then
			events[k] = events[k] or {
				Name = k,
				Connect = function(t, f)
					t.Function = f

					if t.Name == "UserCFrameChanged" then
						headObject = head:new(debug.getupvalue(t.Function, 1))
						
						services.UserInputService.InputBegan:connect(function(i)
							headObject:handleInput(i, 1)
						end)

						services.UserInputService.InputChanged:connect(function(i)
							headObject:handleInput(i, i.UserInputType == Enum.UserInputType.MouseWheel and i.Position.z or 0)
						end)

						services.UserInputService.InputEnded:connect(function(i)
							headObject:handleInput(i, -1)
						end)
					end

				end, 
				Fire = function(t, ...)
					return t.Function(...)
				end
			}

			return events[k]
		end

		return real
	end,
	__call = function(t, method, vr, ...)
		return t[method](...)
	end
})

ind = hookmetamethod(game, "__index", function(...)
	local t, k = ...

	local scr = getcallingscript()

	if t == realVrService and not (scr and ind(scr, "Name") == "CameraModule") then
		return fakeVrService[k]
	end

	return ind(...)
end)

nc = hookmetamethod(game, "__namecall", function(...)
	local t = ...

	if t == realVrService then
		local method = getnamecallmethod()
		return fakeVrService(method, ...)
	elseif t == game.GetService(game, "StarterGui") and game.IsLoaded(game) then
		return
	end

	return nc(...)
end)

nind = hookmetamethod(game, "__newindex", function(...)
	local t, k, v = ...
	
	local scr = getcallingscript()
	
	if t == cam and headObject then	
		if k == "CFrame" and events.UserCFrameChanged then
		
			events.UserCFrameChanged:Fire(Enum.UserCFrame.Head, CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()))
			
			if headObject.rotationManager.active then
			
				headObject.rotationManager:updateAxes()
				
				if headObject.rotationManager.held then
					headObject.rotationManager:updateAxisMover()
				end
			end
			
			if headObject.rotationManager.tabActivated and services.UserInputService:IsKeyDown(Enum.KeyCode.Left) or services.UserInputService:IsKeyDown(Enum.KeyCode.Right) then -- prevent controls from messing with camera
				return
			end
		elseif k == "CameraType" then
			nind(t, k, Enum.CameraType.Custom)
			nind(t, "CameraSubject", headObject.realHeadset.Head)
			headObject.leftHand:updateTarget()
			headObject.rightHand:updateTarget()
		end
		if not (scr and scr.Name == "CameraModule") and not checkcaller() then
			return
		end
	end
	
	nind(t, k, v)
end)

p = services.Players.LocalPlayer or (function()
	services.Players:GetPropertyChangedSignal("LocalPlayer"):wait() -- this doesnt return anything for some reason??
	return services.Players.LocalPlayer
end)()

p.Chatted:connect(function(c)
	services.ReplicatedStorage.COM.Chat:FireServer("Chat", c)
end)
end)
 

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- Adopt me
elseif game.PlaceId == 920587237 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
   local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Antartic Hub", "idk", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/JusticeValley/Antarctic-Hub/main/New.lua", true))()
 end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("GabX", "GabX", function()
   --// GabX, the script hub that has all you need! \\--
-- Made by Darion#8863

local tabs = {
	{
		name = "Scripts",
		comingsoon = false,
		scripts = {
			{
				"R2S (EnvEdit)",
				"https://pastebin.com/raw/ZAHTikfe"
			},
			{
				"Old R2S",
				"https://pastebin.com/raw/jXh45kfE"
			},
			{
				"Grab Knife V4",
				"https://pastebin.com/raw/7zK1Swpt"
			},
			{
				"Grab Knife V3",
				"https://pastebin.com/raw/TPZXG8fH"
			},
			{
				"R6 Fly(E)",
				"https://pastebin.com/raw/hTJsM2jV"
			},
			{
				"Speed",
				"https://pastebin.com/raw/mrdWh73D"
			},
			{
				"JumpPower",
				"https://pastebin.com/raw/sA5xym2V"
			},
			{
				"Loopheal",
				"https://pastebin.com/raw/vD9zjBQx"
			},
			{
				"Chat Logs",
				"https://pastebin.com/raw/mtGM0Dkh"
			},
			{
				"Audio Stealer",
				"https://pastebin.com/raw/ABRqgZ3L"
			},
			{
				"FE Check (F9)",
				"https://pastebin.com/raw/SRibuFiK"
			},
			{
				"No clip (F)",
				"https://pastebin.com/raw/bnqAE95f"
			},
			{
				"Bomb Vest",
				"https://pastebin.com/raw/S7vdifqp"
			},
			{
				"Robux Troll",
				"https://pastebin.com/raw/BHjfPXC6"
			}
		}
	},
	{
		name = "FeScripts",
		comingsoon = false,
		scripts = {
			{
				"FE God",
				"https://pastebin.com/raw/p814kXmM"
			},
			{
				"Kill/Fling",
				"https://pastebin.com/raw/Pb3PR6EL"
			},
			{
				"Shutdown",
				"https://pastebin.com/raw/RELufQFM"
			},
			{
				"Hat Spin",
				"https://pastebin.com/raw/Y8iEYKZD"
			},
			{
				"Suicide Gun",
				"https://pastebin.com/raw/SeRxrgci"
			},
			{
				"Click TP Tool",
				"https://pastebin.com/raw/16tXkJjD"
			},
			{
				"OOF Spam",
				"https://pastebin.com/raw/JaMbzp0B"
			},
			{
				"Respawn",
				"https://pastebin.com/raw/61WmHqNp"
			}
		}
	},
	{
		name = "GUIs",
		comingsoon = false,
		scripts = {
			{
				"Topk3k V4",
				"https://pastebin.com/raw/bEmmF8UH"
			},
			{
				"Arosia",
				"https://pastebin.com/raw/Nwit6ZqP"
			},
			{
				"Equinox",
				"https://pastebin.com/raw/scYFbHQb"
			},
			{
				"Ani's(R15)",
				"https://pastebin.com/raw/MenK10Ak"
			},
			{
				"Ani's(R6)",
				"https://pastebin.com/raw/Ydt76Kep"
			},
			{
				"Rose Hub",
				"https://pastebin.com/raw/1BJj0fB4"
			},
			{
				"OPFinality",
				"https://pastebin.com/raw/fG5b1zrM"
			},
			{
				"Old OPHub",
				"https://pastebin.com/raw/FxhQbqsp"
			},
			{
				"HyperTotal",
				"https://pastebin.com/raw/aYdepQa0"
			},
			{
				"Clown Van",
				"https://pastebin.com/raw/0uJXBEmN"
			},
			{
				"Sern Hub",
				"https://pastebin.com/raw/8sD7V8xp"
			},
			{
				"Cooler Kids V2",
				"https://pastebin.com/raw/GGQeWXSL"
			},
			{
				"Ping/FPS",
				"https://pastebin.com/raw/Qh8eeWF7"
			},
			{
				"Spectate",
				"https://pastebin.com/raw/WgpJfMGS"
			},
			{
				"Ro-xploit",
				"https://pastebin.com/raw/ZkhCcaa5"
			},
			{
				"TP GUI",
				"https://pastebin.com/raw/EBhdqeWb"
			}
		}
	},
	{
		name = "Commands",
		comingsoon = false,
		scripts = {
			{
				"BTools",
				"https://pastebin.com/raw/752Gzv1G"
			},
			{
				"Ghost",
				"https://pastebin.com/raw/aiYL4LKV"
			},
			{
				"Big pp",
				"https://pastebin.com/raw/xAcpS2Ze"
			},
			{
				"Inf Jump",
				"https://pastebin.com/raw/Dz61QSir"
			}
		}
	},
	{
		name = "Stat Change",
		comingsoon = false,
		scripts = {
			{
				"Clone Tycoon 2",
				"https://pastebin.com/raw/ga02bJq5"
			},
			{
				"Naruto Final Bond LVL",
				"https://pastebin.com/raw/j5gYsnxM"
			},
			{
				"Shinobi Life",
				"https://pastebin.com/raw/rpWG7xBj"
			},
			{
				"Rocitizens",
				"https://pastebin.com/raw/P3WAujA9"
			},
			{
				"Naruto New Gen",
				"https://pastebin.com/raw/34Fdq480"
			},
			{
				"False DBFP",
				"https://pastebin.com/raw/tTCcVDAf"
			},
			{
				"Jaws",
				"https://pastebin.com/raw/RkNJ3jn2"
			},
			{
				"Giant Survival 2",
				"https://pastebin.com/raw/sbme5pNF"
			},
			{
				"One Piece Unleashed 2",
				"https://pastebin.com/raw/QAgtrGdX"
			},
			{
				"Tuber Simulator",
				"https://pastebin.com/raw/zy1dFtrc"
			},
			{
				"Yard Work Simulator",
				"https://pastebin.com/raw/udKYdRpW"
			},
			{
				"Dragon Ball Super 2",
				"https://pastebin.com/raw/U5i77x2T"
			},
			{
				"Avatar: Legend of Kora",
				"https://pastebin.com/raw/ggcfAQcH"
			}
		}
	},
	{
		name = "Games",
		comingsoon = false,
		scripts = {
			{
				"NRPG Beyond Fast Shoot",
				"https://pastebin.com/raw/zXCvQxRF"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Jailbreak AFK",
				"https://pastebin.com/raw/hhRca3cj"
			},
			{
				"Jailbreak GUI",
				"https://pastebin.com/raw/CQFw06tN"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Lumber Tycoon",
				"https://pastebin.com/raw/33kYAahS"
			},
			{
				"Phantom Forces",
				"https://pastebin.com/raw/LgQEjvxS"
			},
			{
				"Hilton Hotels",
				"https://pastebin.com/raw/QfHywxaZ"
			},
			{
				"Work At A Pizza Place",
				"https://pastebin.com/raw/KyfBZCKL"
			},
			{
				"Prison Royale",
				"https://pastebin.com/raw/0W4QBB5C"
			},
			{
				"Greenwood Town",
				"https://pastebin.com/raw/96JTe9Gd"
			},
			{	
				"Naruto Final Bond",
				"https://pastebin.com/raw/ujKgVWBn"
			},
			{	"Project Pokemon",
				"https://pastebin.com/raw/jDTLJf9Z"
			},
			{	"Scuba Diving",
				"https://pastebin.com/raw/NwSeijRv"
			}
		}
	},
	{
		name = "Admins",
		comingsoon = false,
		scripts = {
			{
				"Infinite Yield",
				"https://pastebin.com/raw/MjBzRjmT"
			},
			{
				"Rocky's",
				"https://pastebin.com/raw/3V4s9UPx"
			},
			{
				"Dex Explorer",
				"https://pastebin.com/raw/eqy8yt4q"
			},
			{
				"N3xulis",
				"https://pastebin.com/raw/eKkbtM3A"
			},
			{
				"ARX Admin",
				"https://pastebin.com/raw/4PGmJv5R"
			},
			{
				"Shattervast",
				"https://pastebin.com/raw/44bNjECt"
			},
			{
				"Filter My Ass",
				"https://pastebin.com/raw/Tn1xz43y"
			},
			{
				"C00lgui",
				"https://pastebin.com/raw/Xt0S28mx"
			},
			{
				"Mayem",
				"https://pastebin.com/raw/tWQnvRqH"
			},
			{
				"Nosyliam",
				"https://pastebin.com/raw/FmeiVpiE"
			},
			{
				"Your Mom V2",
				"https://pastebin.com/raw/1FsNUZHq"
			},
			{
				"PME Safazi",
				"https://pastebin.com/raw/yrnDMLYs"
			}
		}
	},
	{
		name = "Forms",
		comingsoon = false,
		scripts = {
			{
				"Madara",
				"https://pastebin.com/raw/LYjZdycr"
			},
			{
				"Shadow Titan",
				"https://pastebin.com/raw/E7b9cy1h"
			},
			{
				"Assasin",
				"https://pastebin.com/raw/bKu2GuzN"
			},
			{
				"Beast Claws",
				"https://pastebin.com/raw/0AH8SZTJ"
			},
			{
				"6 Swords",
				"https://pastebin.com/raw/80juE2kw"
			},
			{
				"Goku SSJ3",
				"https://pastebin.com/raw/vFmVuXk4"
			},
			{
				"OmagaV2",
				"https://pastebin.com/raw/VSerZV3e"
			},
			{
				"Absalom Titan",
				"https://pastebin.com/raw/ZmySaMrb"
			},
			{
				"Ace",
				"https://pastebin.com/raw/fA4XSTY1"
			},
			{
				"Beerus",
				"https://pastebin.com/raw/c1TGDAKC"
			},
			{
				"DSSJ4",
				"https://pastebin.com/raw/pfdud8wK"
			},
			{
				"Zenatic",
				"https://pastebin.com/raw/wTJxmWyG"
			},
			{
				"Naruto",
				"https://pastebin.com/raw/eEN5mC9u"
			}
		}
	},
	{
		name = "Extra",
		comingsoon = true
	}
}
local othertabs = {
	{
		name = "Info",
		text = "GabX was made by a new learning scripter named Darion. It started off as a simple project to learn scripting just for myself, but I decided to release it anyways just for fun. It received quite a bit of attention and several youtube videos were made on it. I felt like I didn't deserve the support because nothing was actually made by me, I just added buttons. I decided to rewrite the UI all by myself! I did get some help in the scripting part because I'm not the best in scripting since I'm new to making scripts and exploiting related stuff in general. Now GabX has been updated and the UI was all self made! Also, when I wanted to release it I didn't know any good name for it. I asked my friend and he didn't know either, so I just chose my friends name and added an X to it! :D",
	},
	{
		name = "Help",
		text = "If there is anything patched, not the most recent update, broken or anything else please DM Darion#8863 and join the server. http://discord.gg/E64Jd89"
	},
	{
		name = "Credits",
		text = "GabX was made by Darion#8863."
	}
}


local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local openclose = Instance.new("TextButton")
openclose.Parent = gui
openclose.Name = "OpenClose"
openclose.Style = Enum.ButtonStyle.RobloxRoundButton
openclose.Font = Enum.Font.SciFi
openclose.TextSize = 25
openclose.Text = "OPEN"
openclose.ZIndex = 12
openclose.Size = UDim2.new(0, 110,0, 45)
openclose.Position = UDim2.new(0, 0,0.791, 0)

local top = Instance.new("Frame")
top.Parent = gui
top.Name = "Topbar"
top.BorderSizePixel = 0
top.BackgroundColor3 = Color3.new((192 / 255), (225 / 255), (237 / 255))
top.Size = UDim2.new(0, 500, 0, 36)
top.Position = UDim2.new(0, -505, 0.5, -218)
top.Draggable = true
top.Active = true
top.ZIndex = 10
top.Visible = false

local logo = Instance.new("ImageLabel")
logo.Parent = top
logo.Name = "Logo"
logo.BorderSizePixel = 0
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://1902404068"
logo.ScaleType = Enum.ScaleType.Crop
logo.Size = UDim2.new(0, 140, 0, 36)
logo.Position = UDim2.new(0.5, -70, 0, 0)
logo.ZIndex = 11

local main = Instance.new("Frame")
main.Parent = top
main.Name = "MainFrame"
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BackgroundTransparency = 0.2
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(1, 0, 0, 400)
main.ZIndex = 10

local tabsf = Instance.new("Frame")
tabsf.Parent = main
tabsf.Name = "Tabs"
tabsf.BorderSizePixel = 0
tabsf.BackgroundTransparency = 1
tabsf.Position = UDim2.new(0, 0, 0, 0)
tabsf.Size = UDim2.new(0, 100, 1, 0)


openclose.MouseButton1Click:connect(function()
	if top.Visible then
		openclose.Text = "OPEN"
		top:TweenPosition(UDim2.new(0, -505, 0.5, -218))
		wait(1.05)
		top.Visible = false
	else
		openclose.Text = "CLOSE"
		top.Visible = true
		top:TweenPosition(UDim2.new(0.5, -250, 0.5, -218))
		wait(1.05)
	end 
end)

local current = "Scripts"
for i1, tab in ipairs(tabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, (i1 - 1) * 30)
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local tabfr = Instance.new("Frame")
	tabfr.Parent = main
	tabfr.Name = tab.name
	tabfr.BorderSizePixel = 0
	tabfr.BackgroundTransparency = 1
	tabfr.Size = UDim2.new(0, 390, 1, -10)
	tabfr.Position = UDim2.new(0, 105, 0, 5)
	if tab.name ~= current then
		tabfr.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		tabfr.Visible = true 
	end)
	
	if tab.comingsoon then
		local text = Instance.new("TextLabel")
		text.Parent = tabfr
		text.BorderSizePixel = 0
		text.BackgroundTransparency = 1
		text.BackgroundColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.SciFi
		text.TextSize = 60
		text.Text = "Coming Soon!"
		text.Position = UDim2.new(0, 0, 0, 0)
		text.Size = UDim2.new(1, 0, 0, 100)
		text.ZIndex = 11
	else
		for i2, scr in ipairs(tab.scripts) do
			local scrbtn = Instance.new("TextButton")
			scrbtn.Parent = tabfr
			scrbtn.Name = scr[1]
			scrbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
			scrbtn.Position = UDim2.new(0, ((i2 - 1) % 4) * 100, 0, math.floor((i2 - 1) / 4) * 50)
			scrbtn.Size = UDim2.new(0, 90, 0, 40)
			scrbtn.TextSize = 14
			scrbtn.TextScaled = true
			scrbtn.TextScaled = false
			scrbtn.Font = Enum.Font.SciFi
			scrbtn.Text = scr[1]
			scrbtn.ZIndex = 11
			
			scrbtn.MouseButton1Click:connect(function()
				loadstring(game:HttpGet(scr[2], true))()
			end)
		end
	end
end
for i,tab in ipairs(othertabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name 
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, 314 + ((i - 1) * 30))
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local text = Instance.new("TextLabel")
	text.Parent = main
	text.Name = tab.name 
	text.BorderSizePixel = 0
	text.BackgroundTransparency = 0.2
	text.BackgroundColor3 = Color3.new(1, 1, 1)
	text.Size = UDim2.new(0, 390, 1, -10)
	text.Position = UDim2.new(0, 105, 0, 5)
	text.Text = tab.text
	text.Font = Enum.Font.SciFi
	text.TextSize = 20
	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextYAlignment = Enum.TextYAlignment.Top
	text.TextWrapped = true
	text.ZIndex = 11 
	if tab.name ~= current then
		text.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		text.Visible = true 
	end)
end

end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

   local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- JailBreak
elseif game.PlaceId == 606849621 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
   local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

MainSection:NewButton("Auto Arrest V2", "Arrest", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/HazeWasTaken/Jailbricked/main/AutoArrest.lua'))()
end)

MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("Auto Rob", "Rob stores", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/wawsdasdacx/ohascriptnrrewading/main/jbsaxcriptidk1'))()
end)

MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

MainSection:NewButton("ESP/Aimbot", "bro", function()
   local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 1
Frame.Position = UDim2.new(0, 0, 0.876175702, 0)
Frame.Size = UDim2.new(0, 100, 0, 84)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.Size = UDim2.new(0, 100, 0, 34)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = "Press E To Lock-On"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 11

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.Position = UDim2.new(0, 0, 0.40476191, 0)
TextLabel_2.Size = UDim2.new(0, 100, 0, 25)
TextLabel_2.Font = Enum.Font.SciFi
TextLabel_2.Text = "Press T To Start ESP"
TextLabel_2.TextColor3 = Color3.new(0, 0, 0)
TextLabel_2.TextSize = 11

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_3.Position = UDim2.new(0, 0, 0.702380955, 0)
TextLabel_3.Size = UDim2.new(0, 100, 0, 25)
TextLabel_3.Font = Enum.Font.Gotham
TextLabel_3.Text = "Press L To Loop-ESP"
TextLabel_3.TextColor3 = Color3.new(0, 0, 0)
TextLabel_3.TextSize = 10
pcall(function()
local espcolor = Color3.fromRGB(140, 69, 102)
local wallhack_esp_transparency = .4
local gui_hide_button = {Enum.KeyCode.LeftControl, "h"}
local plrs = game:GetService("Players")
local lplr = game:GetService("Players").LocalPlayer
local TeamBased = true ; local teambasedswitch = "o"
local presskeytoaim = true; local aimkey = "e"
aimbothider = false; aimbothiderspeed = .5
local Aim_Assist = false ; Aim_Assist_Key = {Enum.KeyCode.LeftControl, "z"}
local espupdatetime = 5; autoesp = false; local charmsesp = true
local movementcounting = true




local mouselock = false
local canaimat = true
local lockaim = true; local lockangle = 5
local ver = "2.4"
local cam = game.Workspace.CurrentCamera
local BetterDeathCount = true
local ballisticsboost = 0

local mouse = lplr:GetMouse()
local switch = false
local key = "k"
local aimatpart = nil
local lightesp = false

local abs = math.abs

local Gui = Instance.new("ScreenGui")
local Move = Instance.new("Frame")
local Main = Instance.new("Frame")
local EspStatus = Instance.new("TextLabel")
local st1 = Instance.new("TextLabel")
local st1_2 = Instance.new("TextLabel")
local st1_3 = Instance.new("TextBox")
local Name = Instance.new("TextLabel")
--Properties:

Gui.Parent = plrs.LocalPlayer:WaitForChild("PlayerGui")


local aimbotstatus = {"qc", "qr", "qe", "qd", "qi", "qt", "qs", "dd", "sp", "ql", "qa", "qd", "qs"}
local gotstring = 0
local function getrandomstring()
    gotstring = gotstring+666
    local str = ""
    local randomstring = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "g", "k", "l", "m", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
         "а","б","в","г","д","е","ё","ж","з","и","й","к","л","м","о","п","р","с","т","у","ф","х","ч","щ","ъ","ы","ъ","э","ю","я", "`", "$", 
        "0","1","2","3","4","5","6","7","8","9", }
    local counting123 = 0
    for i, v in ipairs(randomstring) do
        counting123 = i
    end
    do
        math.randomseed(tick()+gotstring)
        for i = 3, math.random(1,100) do
                math.randomseed(i+tick()+gotstring)
                
                local oneortwo = math.random(1,2)
                if oneortwo == 2 then
                    math.randomseed(i+tick()+gotstring)
                    str = str..""..randomstring[math.random(1, counting123)]
                else
                    math.randomseed(i+tick()+gotstring)
                    str = str..""..string.upper(randomstring[math.random(1, counting123)])
                end
            
        end
    end
    return str
end
local mousedown = false
local isonmovething = false
local mouseoffset = Vector2.new()
local mousedown = false
local bspeed = 3584
local aimbotoffset = {dd = ":", sp = " ", qa = "a", qb = "b",qc = "c", qd = "d", qe = "e", qf = "f", qg = "g" , qh = "h" , qi = "i", qj = "j", qk = "k", ql = "l", qm = "m", qn = "n", qo = "o", qp = "p", qq = "q", qr = "r", qs = "s", qt = "t", qu = "u", qv = "w", qx = "x", qy = "y", qz = "z"}



Gui.Name = getrandomstring()

Move.Name = getrandomstring()
Move.Draggable = true
Move.Parent = Gui
Move.BackgroundColor3 = Color3.new(0.0431373, 1, 0.0745098)
Move.BackgroundTransparency = 0.40000000596046
Move.BorderSizePixel = 0
Move.Position = UDim2.new(0.5, 0,0.018, 0)
Move.Size = UDim2.new(0, 320, 0, 30)

Move.MouseEnter:Connect(function()
    
    isonmovething = true
    
end)
Move.MouseLeave:Connect(function()
    
    isonmovething = mousedown and true or false
end)
mouse.Button1Down:connect(function()
    mousedown = true
    mouseoffset = Move.AbsolutePosition - Vector2.new(mouse.X, mouse.Y)
end)
mouse.Button1Up:connect(function()
    mousedown = false
end)

mouse.Move:Connect(function()
    if isonmovething == true and mousedown then
        Move.Position = UDim2.new(0, mouseoffset.X + mouse.X, 0, mouseoffset.Y + mouse.Y)
    end
end)
local function uc (st)
    local ast = ""
    for i, v in ipairs(st) do
        local let = aimbotoffset[v]
        ast = ast..let
    end
    return ast
end

Main.Name = getrandomstring()
Main.Parent = Move
Main.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
Main.BackgroundTransparency = 0.69999998807907
Main.Position = UDim2.new(0, 0, 0.995670795, 0)
Main.Size = UDim2.new(1.0000006, 0, 11.2, 0)

st1.Name = getrandomstring()
st1.Parent = Main
st1.BackgroundColor3 = Color3.new(1, 1, 1)
st1.BackgroundTransparency = 1
st1.Position = UDim2.new(0, 0, 0, 0)
st1.Size = UDim2.new(1, 0, 0.161862016, 0)
st1.Font = Enum.Font.ArialBold
st1.Text = uc(aimbotstatus)
st1.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1.TextScaled = true
st1.TextSize = 14
st1.TextWrapped = true

st1_2.Name = getrandomstring()
st1_2.Parent = Main
st1_2.BackgroundColor3 = Color3.new(1, 1, 1)
st1_2.BackgroundTransparency = 1
st1_2.Position = UDim2.new(0, 0, 0.375590861, 0)
st1_2.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_2.Font = Enum.Font.ArialBold
st1_2.TextXAlignment = Enum.TextXAlignment.Left
st1_2.Text = "Current ballistics: 0"
st1_2.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1_2.TextScaled = true
st1_2.TextSize = 14
st1_2.TextWrapped = true

local aimbothiderbox = Instance.new("TextBox")
aimbothiderbox.Name = getrandomstring()
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
aimbothiderbox.Size = UDim2.new(1, 0,0.162, 0)
aimbothiderbox.TextScaled = true
aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
aimbothiderbox.Position = UDim2.new(0, 0,0.853, 0)
aimbothiderbox.BackgroundTransparency = 1
aimbothiderbox.Parent = Main

st1_3.Name = getrandomstring()
st1_3.Parent = Main
st1_3.BackgroundColor3 = Color3.new(1, 1, 1)
st1_3.BackgroundTransparency = 1
st1_3.Position = UDim2.new(0, 0, 0.18558608, 0)
st1_3.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_3.Font = Enum.Font.ArialBold
st1_3.Text = "Bullet speed = 3584"
st1_3.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1_3.TextScaled = true
st1_3.TextSize = 14
st1_3.TextWrapped = true
local teambasedstatus = st1_3:Clone()
teambasedstatus.Parent = Main
teambasedstatus.TextScaled = true
teambasedstatus.Position = UDim2.new(0, 0,.7, 0)
teambasedstatus.Size = UDim2.new(1, 0,.1, 0)
teambasedstatus.Name = getrandomstring()
teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
local espstatustext = teambasedstatus:Clone()
espstatustext.Name = getrandomstring()
espstatustext.Position = UDim2.new(0, 0,0.58, 0)
espstatustext.Text = "Esp loop :"..tostring(autoesp)
espstatustext.Parent = Main
local hide = Instance.new("TextButton")
hide.Text = "_"
hide.BackgroundTransparency = 1
hide.TextScaled = true
hide.TextWrapped = true
hide.Size = UDim2.new(0.1, 0,1, 0)
hide.Position = UDim2.new(0.9, 0,-0.15, 0)
hide.Name = getrandomstring()
hide.Parent = Move
Name.Name = getrandomstring()
Name.Parent = Move
Name.BackgroundColor3 = Color3.new(1, 1, 1)
Name.BackgroundTransparency = 1
Name.Size = UDim2.new(0.838, 0, 1, 0)
Name.Font = Enum.Font.Arial
Name.Text = "FPS gui v"..ver
Name.TextColor3 = Color3.new(0, 0, 0)
Name.TextScaled = true
Name.TextSize = 14
Name.TextWrapped = true
Name.TextXAlignment = Enum.TextXAlignment.Left
local scr = Instance.new("ScrollingFrame")
scr.Size = Main.Size
scr.Position = Main.Position
scr.ScrollBarThickness = 0
scr.BackgroundTransparency = 1
scr.Name = getrandomstring()
Main.Size = UDim2.new(1, 0, 1, 0)
Main.Position = UDim2.new(0,0,0,0)
Main.Parent = scr
scr.Parent = Move
startpos = Main.Position
Move.Active = true
Move:Destroy()
-- Scripts:
hided = true
hide.MouseButton1Click:Connect(function()
    if hided == false then
        hided = true
        Main:TweenPosition(UDim2.new(0, 0, -1.5, 0))
    else
        hided = false
        Main:TweenPosition(startpos)
    end
end)


aimbothiderbox.FocusLost:Connect(function()
    local numb = tonumber(aimbothiderbox.Text)
    if aimbothider == true then
        aimbothiderbox.TextColor3 =Color3.fromRGB(11, 255, 19)
    else
        aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
    end
    if numb ~= nil then
        aimbothiderspeed = numb
        if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
    else
        if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
    end
end)


local plrsforaim = {}


Move.Draggable = true
Gui.ResetOnSpawn = false
--Gui.Name = "Chat"
Gui.DisplayOrder = 999
pcall(function()
if not game:GetService("CoreGui") then
    Gui.Parent = plrs.LocalPlayer.PlayerGui
else
    Gui.Parent = game:GetService("CoreGui")
end
end)
local espheadthing
do
local BillboardGui = Instance.new("BillboardGui")
local PName = Instance.new("TextLabel")
local Pdist = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local ImageLabel_2 = Instance.new("ImageLabel")
--Properties:
--BillboardGui.Parent = game.Workspace.Part
BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui.AlwaysOnTop = true
BillboardGui.LightInfluence = 0
BillboardGui.Size = UDim2.new(0, 100, 0, 46)
BillboardGui.Name = "headoverthing"
PName.Name = "PName"
PName.Parent = BillboardGui
PName.BackgroundColor3 = espcolor
PName.BackgroundTransparency = 0.55000001192093
PName.BorderSizePixel = 0
PName.Size = UDim2.new(0, 100, 0, 23)
PName.Font = Enum.Font.SourceSans
PName.Text = "urmom"
PName.TextColor3 = Color3.new(0, 0, 0)
PName.TextScaled = true
PName.TextSize = 14
PName.TextWrapped = true
st1.Text = uc(aimbotstatus)
Pdist.Name = "Pdist"
Pdist.Parent = BillboardGui
Pdist.AnchorPoint = Vector2.new(0.5, 0)
Pdist.BackgroundColor3 = espcolor
Pdist.BackgroundTransparency = 0.55000001192093
Pdist.BorderSizePixel = 0
Pdist.Position = UDim2.new(0.5, 0, 0.5, 0)
Pdist.Size = UDim2.new(0, 70, 0, 23)
Pdist.Font = Enum.Font.SourceSans
Pdist.Text = "666"
Pdist.TextColor3 = Color3.new(0, 0, 0)
Pdist.TextScaled = true
Pdist.TextSize = 14
Pdist.TextWrapped = true

ImageLabel.Parent = BillboardGui
ImageLabel.BackgroundColor3 = Color3.new(0.298039, 1, 0)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = espcolor
ImageLabel.Position = UDim2.new(1, -15, 0.5, 0)
ImageLabel.Rotation = 180
ImageLabel.Size = UDim2.new(0, 15, 0, 23)
ImageLabel.Image = "rbxassetid://2832171824"
ImageLabel.ImageColor3 = espcolor
ImageLabel.ImageTransparency = 0.55000001192093

ImageLabel_2.Parent = BillboardGui
ImageLabel_2.BackgroundColor3 = espcolor
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.BorderColor3 = Color3.new(0.298039, 1, 0)
ImageLabel_2.Position = UDim2.new(0, 0, 0.5, 0)
ImageLabel_2.Rotation = 180
ImageLabel_2.Size = UDim2.new(0, 15, 0, 23)
ImageLabel_2.Image = "rbxassetid://2832177613"
ImageLabel_2.ImageColor3 = espcolor
ImageLabel_2.ImageTransparency = 0.55000001192093
espheadthing = BillboardGui
end



f = {}
f.UpdateHeadUI = function(v)
    
        
            if v.Adornee and v.Adornee ~= nil then
                local destr = false
                if TeamBased then
                    destr = true
                    local plr = plrs:GetPlayerFromCharacter(v.Adornee.Parent)
                    if plr and plr.Team and plr.Team.Name ~= lplr.Team.Name then
                        destr = false
                    end
                end
                if lightesp == true then
                    v.Pdist.TextColor3 = Color3.new(1,1,1)
                    v.PName.TextColor3 = Color3.new(1,1,1)
                else
                    v.Pdist.TextColor3 = Color3.new(0,0,0)
                    v.PName.TextColor3 = Color3.new(0,0,0)
                end
                local d = math.floor((cam.CFrame.p - v.Adornee.CFrame.p).magnitude)
                v.Pdist.Text = tostring(d)
                if d < 14 then
                    v.Enabled = false
                else
                    v.Enabled = true
                end
                v.StudsOffset = Vector3.new(0,.6+d/14,0)
                if destr then
                    v:Destroy()
                end
            else
                v:Destroy()
            end
        
    
end
st1.Text = uc(aimbotstatus)
local espforlder
local partconverter = Instance.new("Part")
--local headsupdatelist = {}
st1_3.FocusLost:connect(function()
    if tonumber(st1_3.Text) then
        bspeed = tonumber(st1_3.Text)
    else
        
    end
end)
f.addesp = function()
    pcall(function()
    --print("ESP ran")
    if espforlder then
        espforlder:Destroy()
        espforlder = Instance.new("Folder")
        espforlder.Parent = game.Workspace.CurrentCamera
    else
        espforlder = Instance.new("Folder")
        espforlder.Parent = game.Workspace.CurrentCamera
    end
    for i, v in pairs(espforlder:GetChildren()) do
        v:Destroy()
    end
    for _, plr in pairs(plrs:GetChildren()) do
        if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Name ~= lplr.Name then
            if TeamBased == true then
                
                if plr.Team.Name ~= plrs.LocalPlayer.Team.Name  then
                    pcall(function()
                    local e = espforlder:FindFirstChild(plr.Name)
                    if not e then
                        local fold = Instance.new("Folder", espforlder)
                        fold.Name = plr.Name
                        
                        --partconverter.BrickColor = plr.Team.Color
                        --local teamc = partconverter.Color
                        for i, p in pairs(plr.Character:GetChildren()) do
                            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                                if charmsesp then
                                local urmom = Instance.new("BoxHandleAdornment")
                                urmom.ZIndex = 10
                                urmom.AlwaysOnTop = true
                                urmom.Color3 = espcolor
                                urmom.Size = p.Size
                                urmom.Adornee = p
                                urmom.Name = tick().." Ur mom has big gay"
                                urmom.Transparency = wallhack_esp_transparency
                                urmom.Parent = fold
                                if p.Name == "Head" then
                                    local th = p:FindFirstChild("headoverthing")
                                    if not th then
                                        local ht = espheadthing:Clone()
                                        ht.PName.Text = p.Parent.Name
                                        ht.Adornee = p
                                        --table.insert(headsupdatelist, ht)
                                        delay(0, function()
                                            while wait(0.08) and plr and p do
                                                f.UpdateHeadUI(ht)
                                            end
                                        end)
                                        ht.Parent = p
                                    end
                                end
                                end
                            end
                        end
                        plr.Character.Humanoid.Died:Connect(function()
                            fold:Destroy()
                        end)
                        
                    end
                    end)
                end
            else
                local e = espforlder:FindFirstChild(plr.Name)
                if not e then
                    local fold = Instance.new("Folder", espforlder)
                        fold.Name = plr.Name
                        
                        --partconverter.BrickColor = plr.Team.Color
                        --local teamc = Move.BackgroundColor3
                        for i, p in pairs(plr.Character:GetChildren()) do
                            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                                pcall(function()
                                if charmsesp then
                                local urmom = Instance.new("BoxHandleAdornment")
                                urmom.ZIndex = 10
                                urmom.AlwaysOnTop = true
                                urmom.Color3 = espcolor
                                urmom.Size = p.Size
                                urmom.Adornee = p
                                urmom.Name = tick().." Ur mom has big gay"
                                urmom.Transparency = wallhack_esp_transparency
                                urmom.Parent = fold
                                end
                                if p.Name == "Head" then
                                    local th = p:FindFirstChild("headoverthing")
                                    if not th then
                                        local ht = espheadthing:Clone()
                                        ht.PName.Text = p.Parent.Name
                                        ht.Adornee = p
                                        delay(0, function()
                                            while wait(0.08) and plr and p do
                                                f.UpdateHeadUI(ht)
                                            end
                                        end)
                                        --table.insert(headsupdatelist, ht)
                                        ht.Parent = p
                                    end
                                end
                                end)
                            end
                        end
                        plr.Character.Humanoid.Died:Connect(function()
                            fold:Destroy()
                        end)
                end
            end
            
            
        end
    end
    end)
end

local uis = game:GetService("UserInputService")
local bringall = false
local hided2 = false
local upping = false
local downing = false
mouse.KeyDown:Connect(function(a)
    
    if a == "t" then
        --print("worked1")
        f.addesp()
    elseif a == gui_hide_button[2] and uis:IsKeyDown(gui_hide_button[1]) then
        if hided2 == false then
            hided2 = true
            autoesp =false
            if espforlder then
                espforlder:Destroy()
            end
            Gui.Enabled = false
        else
            Gui.Enabled = true
            hided2 = false
        end
            
    elseif a == "" then
        if aimbothider == false then
            aimbothider = true
            if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
        else
            
            aimbothider = false
            if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
        end
        if aimbothider == true then
            aimbothiderbox.TextColor3 =Color3.fromRGB(11, 255, 19)
        else
            aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
        end
    elseif a == "l" then
        if not uis:IsKeyDown(Enum.KeyCode.LeftControl) then
            if autoesp == false then
                autoesp = true
            else
                autoesp = false
            end
        else
            if lightesp == true then
                lightesp = false
            else
                lightesp = true
            end
        end
    elseif a == "]" then
        upping = true
        downing = false
    elseif a== "[" then
        downing = true
        upping = false
    elseif a == Aim_Assist_Key[2] and uis:IsKeyDown(Aim_Assist_Key[1]) then
        if Aim_Assist == true then
            Aim_Assist = false
            --print("disabled")
        else
            Aim_Assist = true
        end
    end
    if a == "j" then
        if mouse.Target then
            mouse.Target:Destroy()
        end
    end
    if a == key then
        if switch == false then
            switch = true
        else
            switch = false
            if aimatpart ~= nil then
                aimatpart = nil
            end
        end
    elseif a == "b" and uis:IsKeyDown(Enum.KeyCode.LeftControl) and not uis:IsKeyDown(Enum.KeyCode.R) then
        if movementcounting then
            movementcounting = false
        else
            movementcounting = true
        end
    elseif a == teambasedswitch then
        if TeamBased == true then
            TeamBased = false
            teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
        else
            TeamBased = true
            teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
        end
    elseif a == "b" and uis:IsKeyDown(Enum.KeyCode.LeftControl) and uis:IsKeyDown(Enum.KeyCode.R) then
        ballisticsboost = 0
    elseif a == aimkey then
        if not aimatpart then
            local maxangle = math.rad(20)
            for i, plr in pairs(plrs:GetChildren()) do
                if plr.Name ~= lplr.Name and plr.Character and plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 1 then
                    if TeamBased == true then
                        if plr.Team.Name ~= lplr.Team.Name then
                            local an = checkfov(plr.Character.Head)
                            if an < maxangle then
                                maxangle = an
                                aimatpart = plr.Character.Head
                            end
                        end
                    else
                        local an = checkfov(plr.Character.Head)
                            if an < maxangle then
                                maxangle = an
                                aimatpart = plr.Character.Head
                            end
                            --print(plr)
                    end
                    local old = aimatpart
                    plr.Character.Humanoid.Died:Connect(function()
                        --print("died")
                        if aimatpart and aimatpart == old then
                            aimatpart = nil
                        end
                    end)
                    
                end
            end
        else
            aimatpart = nil
            canaimat = false
            delay(1.1, function()
                canaimat = true
            end)
        end
    end
end)

function getfovxyz (p0, p1, deg)
    local x1, y1, z1 = p0:ToOrientation()
    local cf = CFrame.new(p0.p, p1.p)
    local x2, y2, z2 = cf:ToOrientation()
    local d = math.deg
    if deg then
        return Vector3.new(d(x1-x2), d(y1-y2), d(z1-z2))
    else
        return Vector3.new((x1-x2), (y1-y2), (z1-z2))
    end
end


function aimat(part)
    if part then
        --print(part)
        local d = (cam.CFrame.p - part.CFrame.p).magnitude
        local calculatedrop
        local timetoaim = 0
        local pos2 = Vector3.new()
        if movementcounting == true then
            timetoaim = d/bspeed
            pos2 = part.Velocity * timetoaim
        end
        local minuseddrop = (ballisticsboost+50)/50
        if ballisticsboost ~= 0 then
            calculatedrop = d - (d/minuseddrop)
            
        else
            calculatedrop = 0
        end
        --print(calculatedrop)
        local addative = Vector3.new()
        if movementcounting then
            addative = pos2
        end
        local cf = CFrame.new(cam.CFrame.p, (addative + part.CFrame.p+ Vector3.new(0, calculatedrop, 0)))
        if aimbothider == true or Aim_Assist == true then
            cam.CFrame = cam.CFrame:Lerp(cf, aimbothiderspeed)
        else
            
            cam.CFrame = cf
        end
        --print(cf)
    end
end
function checkfov (part)
    local fov = getfovxyz(game.Workspace.CurrentCamera.CFrame, part.CFrame)
    local angle = math.abs(fov.X) + math.abs(fov.Y)
    return angle
end
pcall(function()
    delay(0, function()
        while wait(.32) do
            if Aim_Assist and not aimatpart and canaimat and lplr.Character and lplr.Character.Humanoid and lplr.Character.Humanoid.Health > 0 then
                for i, plr in pairs(plrs:GetChildren()) do
                    
                    
                        local minangle = math.rad(5.5)
                        local lastpart = nil
                        local function gg(plr)
                            pcall(function()
                            if plr.Name ~= lplr.Name and plr.Character and plr.Character.Humanoid and plr.Character.Humanoid.Health > 0 and plr.Character.Head then
                                local raycasted = false
                                local cf1 = CFrame.new(cam.CFrame.p, plr.Character.Head.CFrame.p) * CFrame.new(0, 0, -4)
                                local r1 = Ray.new(cf1.p, cf1.LookVector * 9000)
                                local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
                                local dist = (plr.Character.Head.CFrame.p- pos).magnitude
                                if dist < 4 then
                                    raycasted = true
                                end
                                if raycasted == true then
                                    local an1 = getfovxyz(cam.CFrame, plr.Character.Head.CFrame)
                                    local an = abs(an1.X) + abs(an1.Y)
                                    if an < minangle then
                                        minangle = an
                                        lastpart = plr.Character.Head
                                    end
                                end
                            end
                            end)
                        end
                        if TeamBased then
                            if plr.Team.Name ~= lplr.Team.Name then
                                gg(plr)
                            end
                        else
                            gg(plr)
                        end
                        --print(math.deg(minangle))
                        if lastpart then
                            aimatpart = lastpart
                            aimatpart.Parent.Humanoid.Died:Connect(function()
                                if aimatpart == lastpart then
                                    aimatpart = nil
                                end
                            end)
                        
                    end
                end
            end
        end
    end)
end)
local oldheadpos
local lastaimapart
game:GetService("RunService").RenderStepped:Connect(function(dt)
    if uis:IsKeyDown(Enum.KeyCode.RightBracket) or uis:IsKeyDown(Enum.KeyCode.LeftBracket) then
        if upping then
            ballisticsboost = ballisticsboost + dt/1.9
        elseif downing then
            ballisticsboost = ballisticsboost - dt/1.9
        end
    end
    if movementcounting then
        st1_2.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
        st1_2.Text = "Current ballistics: "..tostring(math.floor(ballisticsboost*10)/10)
    else
        st1_2.TextColor3 = Color3.new(1,0,0)
    end
    espstatustext.Text = "Esp loop :"..tostring(autoesp)
    if aimatpart and lplr.Character and lplr.Character.Head then
        if BetterDeathCount and lastaimapart and lastaimapart == aimatpart then
            local dist = (oldheadpos - aimatpart.CFrame.p).magnitude
            if dist > 40 then
                aimatpart = nil
            end
        end
        lastaimapart = aimatpart
        oldheadpos = lastaimapart.CFrame.p
        do 
            if aimatpart.Parent == plrs.LocalPlayer.Character then
                aimatpart = nil
            end
            aimat(aimatpart)
            pcall(function()
                if Aim_Assist == true then
                    local cf1 = CFrame.new(cam.CFrame.p, aimatpart.CFrame.p) * CFrame.new(0, 0, -4)
                    local r1 = Ray.new(cf1.p, cf1.LookVector * 1000)
                    local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
                    local dist = (aimatpart.CFrame.p- pos).magnitude
                    if obj then
                        --print(obj:GetFullName())
                    end
                    if not obj or dist > 6 then
                        aimatpart = nil
                        --print("ooof")
                    end
                    canaimat = false
                    delay(.5, function()
                        canaimat = true
                    end)
                end
            end)
        end
        
        
        
    end
end)


delay(0, function()
    while wait(espupdatetime) do
        if autoesp == true then
            pcall(function()
            f.addesp()
            end)
        end
    end
end)
--warn("loaded")
end)
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MainSection:NewButton("JailMonkey", "MASSIVE FPS DROP", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/MonkeyScripts/main/JailMonkey.lua"))()
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("GabX", "GabX", function()
   --// GabX, the script hub that has all you need! \\--
-- Made by Darion#8863

local tabs = {
	{
		name = "Scripts",
		comingsoon = false,
		scripts = {
			{
				"R2S (EnvEdit)",
				"https://pastebin.com/raw/ZAHTikfe"
			},
			{
				"Old R2S",
				"https://pastebin.com/raw/jXh45kfE"
			},
			{
				"Grab Knife V4",
				"https://pastebin.com/raw/7zK1Swpt"
			},
			{
				"Grab Knife V3",
				"https://pastebin.com/raw/TPZXG8fH"
			},
			{
				"R6 Fly(E)",
				"https://pastebin.com/raw/hTJsM2jV"
			},
			{
				"Speed",
				"https://pastebin.com/raw/mrdWh73D"
			},
			{
				"JumpPower",
				"https://pastebin.com/raw/sA5xym2V"
			},
			{
				"Loopheal",
				"https://pastebin.com/raw/vD9zjBQx"
			},
			{
				"Chat Logs",
				"https://pastebin.com/raw/mtGM0Dkh"
			},
			{
				"Audio Stealer",
				"https://pastebin.com/raw/ABRqgZ3L"
			},
			{
				"FE Check (F9)",
				"https://pastebin.com/raw/SRibuFiK"
			},
			{
				"No clip (F)",
				"https://pastebin.com/raw/bnqAE95f"
			},
			{
				"Bomb Vest",
				"https://pastebin.com/raw/S7vdifqp"
			},
			{
				"Robux Troll",
				"https://pastebin.com/raw/BHjfPXC6"
			}
		}
	},
	{
		name = "FeScripts",
		comingsoon = false,
		scripts = {
			{
				"FE God",
				"https://pastebin.com/raw/p814kXmM"
			},
			{
				"Kill/Fling",
				"https://pastebin.com/raw/Pb3PR6EL"
			},
			{
				"Shutdown",
				"https://pastebin.com/raw/RELufQFM"
			},
			{
				"Hat Spin",
				"https://pastebin.com/raw/Y8iEYKZD"
			},
			{
				"Suicide Gun",
				"https://pastebin.com/raw/SeRxrgci"
			},
			{
				"Click TP Tool",
				"https://pastebin.com/raw/16tXkJjD"
			},
			{
				"OOF Spam",
				"https://pastebin.com/raw/JaMbzp0B"
			},
			{
				"Respawn",
				"https://pastebin.com/raw/61WmHqNp"
			}
		}
	},
	{
		name = "GUIs",
		comingsoon = false,
		scripts = {
			{
				"Topk3k V4",
				"https://pastebin.com/raw/bEmmF8UH"
			},
			{
				"Arosia",
				"https://pastebin.com/raw/Nwit6ZqP"
			},
			{
				"Equinox",
				"https://pastebin.com/raw/scYFbHQb"
			},
			{
				"Ani's(R15)",
				"https://pastebin.com/raw/MenK10Ak"
			},
			{
				"Ani's(R6)",
				"https://pastebin.com/raw/Ydt76Kep"
			},
			{
				"Rose Hub",
				"https://pastebin.com/raw/1BJj0fB4"
			},
			{
				"OPFinality",
				"https://pastebin.com/raw/fG5b1zrM"
			},
			{
				"Old OPHub",
				"https://pastebin.com/raw/FxhQbqsp"
			},
			{
				"HyperTotal",
				"https://pastebin.com/raw/aYdepQa0"
			},
			{
				"Clown Van",
				"https://pastebin.com/raw/0uJXBEmN"
			},
			{
				"Sern Hub",
				"https://pastebin.com/raw/8sD7V8xp"
			},
			{
				"Cooler Kids V2",
				"https://pastebin.com/raw/GGQeWXSL"
			},
			{
				"Ping/FPS",
				"https://pastebin.com/raw/Qh8eeWF7"
			},
			{
				"Spectate",
				"https://pastebin.com/raw/WgpJfMGS"
			},
			{
				"Ro-xploit",
				"https://pastebin.com/raw/ZkhCcaa5"
			},
			{
				"TP GUI",
				"https://pastebin.com/raw/EBhdqeWb"
			}
		}
	},
	{
		name = "Commands",
		comingsoon = false,
		scripts = {
			{
				"BTools",
				"https://pastebin.com/raw/752Gzv1G"
			},
			{
				"Ghost",
				"https://pastebin.com/raw/aiYL4LKV"
			},
			{
				"Big pp",
				"https://pastebin.com/raw/xAcpS2Ze"
			},
			{
				"Inf Jump",
				"https://pastebin.com/raw/Dz61QSir"
			}
		}
	},
	{
		name = "Stat Change",
		comingsoon = false,
		scripts = {
			{
				"Clone Tycoon 2",
				"https://pastebin.com/raw/ga02bJq5"
			},
			{
				"Naruto Final Bond LVL",
				"https://pastebin.com/raw/j5gYsnxM"
			},
			{
				"Shinobi Life",
				"https://pastebin.com/raw/rpWG7xBj"
			},
			{
				"Rocitizens",
				"https://pastebin.com/raw/P3WAujA9"
			},
			{
				"Naruto New Gen",
				"https://pastebin.com/raw/34Fdq480"
			},
			{
				"False DBFP",
				"https://pastebin.com/raw/tTCcVDAf"
			},
			{
				"Jaws",
				"https://pastebin.com/raw/RkNJ3jn2"
			},
			{
				"Giant Survival 2",
				"https://pastebin.com/raw/sbme5pNF"
			},
			{
				"One Piece Unleashed 2",
				"https://pastebin.com/raw/QAgtrGdX"
			},
			{
				"Tuber Simulator",
				"https://pastebin.com/raw/zy1dFtrc"
			},
			{
				"Yard Work Simulator",
				"https://pastebin.com/raw/udKYdRpW"
			},
			{
				"Dragon Ball Super 2",
				"https://pastebin.com/raw/U5i77x2T"
			},
			{
				"Avatar: Legend of Kora",
				"https://pastebin.com/raw/ggcfAQcH"
			}
		}
	},
	{
		name = "Games",
		comingsoon = false,
		scripts = {
			{
				"NRPG Beyond Fast Shoot",
				"https://pastebin.com/raw/zXCvQxRF"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Jailbreak AFK",
				"https://pastebin.com/raw/hhRca3cj"
			},
			{
				"Jailbreak GUI",
				"https://pastebin.com/raw/CQFw06tN"
			},
			{
				"The Streets",
				"https://pastebin.com/raw/xZyABVJ1"
			},
			{
				"Lumber Tycoon",
				"https://pastebin.com/raw/33kYAahS"
			},
			{
				"Phantom Forces",
				"https://pastebin.com/raw/LgQEjvxS"
			},
			{
				"Hilton Hotels",
				"https://pastebin.com/raw/QfHywxaZ"
			},
			{
				"Work At A Pizza Place",
				"https://pastebin.com/raw/KyfBZCKL"
			},
			{
				"Prison Royale",
				"https://pastebin.com/raw/0W4QBB5C"
			},
			{
				"Greenwood Town",
				"https://pastebin.com/raw/96JTe9Gd"
			},
			{	
				"Naruto Final Bond",
				"https://pastebin.com/raw/ujKgVWBn"
			},
			{	"Project Pokemon",
				"https://pastebin.com/raw/jDTLJf9Z"
			},
			{	"Scuba Diving",
				"https://pastebin.com/raw/NwSeijRv"
			}
		}
	},
	{
		name = "Admins",
		comingsoon = false,
		scripts = {
			{
				"Infinite Yield",
				"https://pastebin.com/raw/MjBzRjmT"
			},
			{
				"Rocky's",
				"https://pastebin.com/raw/3V4s9UPx"
			},
			{
				"Dex Explorer",
				"https://pastebin.com/raw/eqy8yt4q"
			},
			{
				"N3xulis",
				"https://pastebin.com/raw/eKkbtM3A"
			},
			{
				"ARX Admin",
				"https://pastebin.com/raw/4PGmJv5R"
			},
			{
				"Shattervast",
				"https://pastebin.com/raw/44bNjECt"
			},
			{
				"Filter My Ass",
				"https://pastebin.com/raw/Tn1xz43y"
			},
			{
				"C00lgui",
				"https://pastebin.com/raw/Xt0S28mx"
			},
			{
				"Mayem",
				"https://pastebin.com/raw/tWQnvRqH"
			},
			{
				"Nosyliam",
				"https://pastebin.com/raw/FmeiVpiE"
			},
			{
				"Your Mom V2",
				"https://pastebin.com/raw/1FsNUZHq"
			},
			{
				"PME Safazi",
				"https://pastebin.com/raw/yrnDMLYs"
			}
		}
	},
	{
		name = "Forms",
		comingsoon = false,
		scripts = {
			{
				"Madara",
				"https://pastebin.com/raw/LYjZdycr"
			},
			{
				"Shadow Titan",
				"https://pastebin.com/raw/E7b9cy1h"
			},
			{
				"Assasin",
				"https://pastebin.com/raw/bKu2GuzN"
			},
			{
				"Beast Claws",
				"https://pastebin.com/raw/0AH8SZTJ"
			},
			{
				"6 Swords",
				"https://pastebin.com/raw/80juE2kw"
			},
			{
				"Goku SSJ3",
				"https://pastebin.com/raw/vFmVuXk4"
			},
			{
				"OmagaV2",
				"https://pastebin.com/raw/VSerZV3e"
			},
			{
				"Absalom Titan",
				"https://pastebin.com/raw/ZmySaMrb"
			},
			{
				"Ace",
				"https://pastebin.com/raw/fA4XSTY1"
			},
			{
				"Beerus",
				"https://pastebin.com/raw/c1TGDAKC"
			},
			{
				"DSSJ4",
				"https://pastebin.com/raw/pfdud8wK"
			},
			{
				"Zenatic",
				"https://pastebin.com/raw/wTJxmWyG"
			},
			{
				"Naruto",
				"https://pastebin.com/raw/eEN5mC9u"
			}
		}
	},
	{
		name = "Extra",
		comingsoon = true
	}
}
local othertabs = {
	{
		name = "Info",
		text = "GabX was made by a new learning scripter named Darion. It started off as a simple project to learn scripting just for myself, but I decided to release it anyways just for fun. It received quite a bit of attention and several youtube videos were made on it. I felt like I didn't deserve the support because nothing was actually made by me, I just added buttons. I decided to rewrite the UI all by myself! I did get some help in the scripting part because I'm not the best in scripting since I'm new to making scripts and exploiting related stuff in general. Now GabX has been updated and the UI was all self made! Also, when I wanted to release it I didn't know any good name for it. I asked my friend and he didn't know either, so I just chose my friends name and added an X to it! :D",
	},
	{
		name = "Help",
		text = "If there is anything patched, not the most recent update, broken or anything else please DM Darion#8863 and join the server. http://discord.gg/E64Jd89"
	},
	{
		name = "Credits",
		text = "GabX was made by Darion#8863."
	}
}


local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local openclose = Instance.new("TextButton")
openclose.Parent = gui
openclose.Name = "OpenClose"
openclose.Style = Enum.ButtonStyle.RobloxRoundButton
openclose.Font = Enum.Font.SciFi
openclose.TextSize = 25
openclose.Text = "OPEN"
openclose.ZIndex = 12
openclose.Size = UDim2.new(0, 110,0, 45)
openclose.Position = UDim2.new(0, 0,0.791, 0)

local top = Instance.new("Frame")
top.Parent = gui
top.Name = "Topbar"
top.BorderSizePixel = 0
top.BackgroundColor3 = Color3.new((192 / 255), (225 / 255), (237 / 255))
top.Size = UDim2.new(0, 500, 0, 36)
top.Position = UDim2.new(0, -505, 0.5, -218)
top.Draggable = true
top.Active = true
top.ZIndex = 10
top.Visible = false

local logo = Instance.new("ImageLabel")
logo.Parent = top
logo.Name = "Logo"
logo.BorderSizePixel = 0
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://1902404068"
logo.ScaleType = Enum.ScaleType.Crop
logo.Size = UDim2.new(0, 140, 0, 36)
logo.Position = UDim2.new(0.5, -70, 0, 0)
logo.ZIndex = 11

local main = Instance.new("Frame")
main.Parent = top
main.Name = "MainFrame"
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BackgroundTransparency = 0.2
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(1, 0, 0, 400)
main.ZIndex = 10

local tabsf = Instance.new("Frame")
tabsf.Parent = main
tabsf.Name = "Tabs"
tabsf.BorderSizePixel = 0
tabsf.BackgroundTransparency = 1
tabsf.Position = UDim2.new(0, 0, 0, 0)
tabsf.Size = UDim2.new(0, 100, 1, 0)


openclose.MouseButton1Click:connect(function()
	if top.Visible then
		openclose.Text = "OPEN"
		top:TweenPosition(UDim2.new(0, -505, 0.5, -218))
		wait(1.05)
		top.Visible = false
	else
		openclose.Text = "CLOSE"
		top.Visible = true
		top:TweenPosition(UDim2.new(0.5, -250, 0.5, -218))
		wait(1.05)
	end 
end)

local current = "Scripts"
for i1, tab in ipairs(tabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, (i1 - 1) * 30)
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local tabfr = Instance.new("Frame")
	tabfr.Parent = main
	tabfr.Name = tab.name
	tabfr.BorderSizePixel = 0
	tabfr.BackgroundTransparency = 1
	tabfr.Size = UDim2.new(0, 390, 1, -10)
	tabfr.Position = UDim2.new(0, 105, 0, 5)
	if tab.name ~= current then
		tabfr.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		tabfr.Visible = true 
	end)
	
	if tab.comingsoon then
		local text = Instance.new("TextLabel")
		text.Parent = tabfr
		text.BorderSizePixel = 0
		text.BackgroundTransparency = 1
		text.BackgroundColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.SciFi
		text.TextSize = 60
		text.Text = "Coming Soon!"
		text.Position = UDim2.new(0, 0, 0, 0)
		text.Size = UDim2.new(1, 0, 0, 100)
		text.ZIndex = 11
	else
		for i2, scr in ipairs(tab.scripts) do
			local scrbtn = Instance.new("TextButton")
			scrbtn.Parent = tabfr
			scrbtn.Name = scr[1]
			scrbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
			scrbtn.Position = UDim2.new(0, ((i2 - 1) % 4) * 100, 0, math.floor((i2 - 1) / 4) * 50)
			scrbtn.Size = UDim2.new(0, 90, 0, 40)
			scrbtn.TextSize = 14
			scrbtn.TextScaled = true
			scrbtn.TextScaled = false
			scrbtn.Font = Enum.Font.SciFi
			scrbtn.Text = scr[1]
			scrbtn.ZIndex = 11
			
			scrbtn.MouseButton1Click:connect(function()
				loadstring(game:HttpGet(scr[2], true))()
			end)
		end
	end
end
for i,tab in ipairs(othertabs) do
	local tabbtn = Instance.new("TextButton")
	tabbtn.Parent = tabsf
	tabbtn.Name = tab.name 
	tabbtn.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
	tabbtn.Size = UDim2.new(1, 0, 0, 26)
	tabbtn.Position = UDim2.new(0, 0, 0, 314 + ((i - 1) * 30))
	tabbtn.Font = Enum.Font.SciFi
	tabbtn.TextSize = 16
	tabbtn.Text = tab.name
	tabbtn.ZIndex = 11
	
	local text = Instance.new("TextLabel")
	text.Parent = main
	text.Name = tab.name 
	text.BorderSizePixel = 0
	text.BackgroundTransparency = 0.2
	text.BackgroundColor3 = Color3.new(1, 1, 1)
	text.Size = UDim2.new(0, 390, 1, -10)
	text.Position = UDim2.new(0, 105, 0, 5)
	text.Text = tab.text
	text.Font = Enum.Font.SciFi
	text.TextSize = 20
	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextYAlignment = Enum.TextYAlignment.Top
	text.TextWrapped = true
	text.ZIndex = 11 
	if tab.name ~= current then
		text.Visible = false
	end
	
	tabbtn.MouseButton1Click:connect(function()
		main[current].Visible = false
		current = tab.name
		text.Visible = true 
	end)
end

end)

   local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
--Prison Life
elseif game.PlaceId == 155615604 then
    local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)


MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
end)

MainSection:NewButton("Prison Destroyer V2", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/DTi4fbKh"))();
end)

MainSection:NewButton("Prison Life Anti Abusers GUI", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/6mhZBAkh",true))()
end)

MainSection:NewButton("Prison Destroyer", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/08z0DUDE",true))()
end)

MainSection:NewButton("Kick Player", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/5iyrwLSH",true))()
end)

MainSection:NewButton("Prison Destroyer V1.6", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/4rkRHviN",true))()
end)

MainSection:NewButton("Loop Bring All", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/j80DG72a",true))()
end)

MainSection:NewButton("Bring All/Crim", "Jake11Price", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/aiNDd7Js",true))()
end)
game.Players.LocalPlayer.PlayerGui.Home.fadeFrame:Destroy()
        local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    -- Build A Boat
elseif game.PlaceId == 537413528 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   local Window = Library.CreateLib("SkyHub", OptTheme)
   local Main = Window:NewTab("Main")
   local MainSection = Main:NewSection("Main")
   MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
   setclipboard(string)
end)

 MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
   setclipboard(string2)
end)

MainSection:NewButton("CocoHub", "idk", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'),true))()
 end)

MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)

MainSection:NewButton("scriptt", "just a gui", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Build%20A%20Boat%20For%20Treasure/BABFT"))()
end)

MainSection:NewButton("Infinite Yield FE", "Admin", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Player = Window:NewTab("Player")
   local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
-- Gorilla Tag Professional
elseif game.PlaceId == 8690998110 then
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")




local screenGui = Instance.new("ScreenGui")
syn.protect_gui(screenGui)
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
	    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
            local Window = Library.CreateLib("SkyHub Universal", OptTheme)
            local Main = Window:NewTab("Main")
            local MainSection = Main:NewSection("Main")
            MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
                setclipboard(string)
            end)
	 MainSection:NewButton("V3rm Script", "Copys Discord invite link", function()
                -- Made by 13 YOLD
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
local window1 = library:Window("Scripts")
local window2 = library:Window("Teleport Areas")
window1:Button("Infinite Wins", function()
    spawn(function()
while true do
   local dec = game:GetService("Workspace"):FindFirstChild("ClickToGetCash").ClickDetector
   fireclickdetector(dec)
   local fun = game:GetService("Workspace"):FindFirstChild("ClickToGetCash").ClickDetector
   fireclickdetector(fun)
   wait(0.1)
end
end)
end)
window2:Button("Spectate (Easy Win)", function()
    spawn(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39.386, 59.2163, -102.248)

end)
end)
window1:Button("TP All to You (Use Lava)", function()
    spawn(function()
  for _, player in pairs(game.Players:GetPlayers()) do
player.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
      end
    end)
end)
window2:Button("Become a Lava Monke", function()
    spawn(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(79.2755, 71.1624, -54.2756)
end)
end)
window1:Slider("Walkspeed",16,70,5, function(value)
  game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
window1:Slider("JumpPower",50,150,20, function(value)
  game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
end)
library:Keybind("Tab")
game:GetService("StarterGui"):SetCore("SendNotification",{     
Title = "Important!",     
Text = "Infinite Wins is patched",
Button1 = "unpatch pls?",Button2 = "no",     Duration = 20, })
            end)
-- Universal
else
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading SkyHub."
textLabel.TextSize = 28
textLabel.Parent = screenGui
local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.Parent = screenGui

ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

wait(5)
screenGui:Destroy()

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 255, 153)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
TextLabel.TextSize = 28
TextLabel.Text = "Loaded!"

wait(2.5)
ScreenGui:Destroy()
	    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
            local Window = Library.CreateLib("SkyHub Universal", OptTheme)
            local Main = Window:NewTab("Main")
            local MainSection = Main:NewSection("Main")
            MainSection:NewButton("Discord Invite", "Copys Discord invite link", function()
                setclipboard(string)
            end)

            MainSection:NewButton("NoClip", "Walk Through Walls Hold V", function()
                local h,char,play
                play = game.Players.LocalPlayer
                local uisss = game:getService("UserInputService")
                game:getService("RunService"):BindToRenderStep("",0,function()
                    char = play.Character
	                if char then h = char:findFirstChildOfClass("Humanoid") end
	               if not h then return end
	               if uisss:IsKeyDown(Enum.KeyCode.V) then
		                h:ChangeState(11)
	                end
                end)
            end)

            MainSection:NewButton("Btools", "Btools lol", function()
                game.StarterGui:SetCoreGuiEnabled(2, true)
                a = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
                a.BinType = 2
                b = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
                b.BinType = 3
                c = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
                c.BinType = 4
            end)
 
MainSection:NewButton("FE Gui", "By Me sky", function()
                local Admin = Instance.new("ScreenGui")
local MainFrame = Instance.new("ScrollingFrame")
local FlyBut = Instance.new("TextButton")
local RespawnBut = Instance.new("TextButton")
local Credslol = Instance.new("TextLabel")
local ClickTpBut = Instance.new("TextButton")
local NoClipBut = Instance.new("TextButton")
local SonicBut = Instance.new("TextButton")
local TelekiniesBut = Instance.new("TextButton")
local WalkWallsBut = Instance.new("TextButton")
local BtoolsBut = Instance.new("TextButton")
local MEME = Instance.new("TextButton")

Admin.Name = "Admin"
Admin.Parent = game.CoreGui
Admin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = Admin
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.fromRGB(208, 66, 255)
MainFrame.Position = UDim2.new(0.416337252, 0, 0.274846643, 0)
MainFrame.Size = UDim2.new(0, 429, 0, 262)

FlyBut.Name = "FlyBut"
FlyBut.Parent = MainFrame
FlyBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyBut.Position = UDim2.new(0, 0, 0.0306748468, 0)
FlyBut.Size = UDim2.new(0, 200, 0, 50)
FlyBut.Style = Enum.ButtonStyle.RobloxButton
FlyBut.Font = Enum.Font.SourceSans
FlyBut.Text = "Fly"
FlyBut.TextColor3 = Color3.fromRGB(58, 93, 170)
FlyBut.TextSize = 14.000

RespawnBut.Name = "RespawnBut"
RespawnBut.Parent = MainFrame
RespawnBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RespawnBut.Position = UDim2.new(0.510489523, 0, 0.0306748468, 0)
RespawnBut.Size = UDim2.new(0, 200, 0, 50)
RespawnBut.Style = Enum.ButtonStyle.RobloxButton
RespawnBut.Font = Enum.Font.SourceSans
RespawnBut.Text = "Respawn"
RespawnBut.TextColor3 = Color3.fromRGB(58, 93, 170)
RespawnBut.TextSize = 14.000

Credslol.Name = "Creds lol"
Credslol.Parent = MainFrame
Credslol.BackgroundColor3 = Color3.fromRGB(208, 66, 255)
Credslol.Size = UDim2.new(0, 419, 0, 50)
Credslol.Font = Enum.Font.SourceSans
Credslol.Text = "FE GUI Made By Sky Press down on Mouse Wheel to open/close"
Credslol.TextColor3 = Color3.fromRGB(58, 93, 170)
Credslol.TextSize = 14.000

ClickTpBut.Name = "ClickTpBut"
ClickTpBut.Parent = MainFrame
ClickTpBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickTpBut.Position = UDim2.new(-0.00233101845, 0, 0.0650306717, 0)
ClickTpBut.Size = UDim2.new(0, 200, 0, 50)
ClickTpBut.Style = Enum.ButtonStyle.RobloxButton
ClickTpBut.Font = Enum.Font.SourceSans
ClickTpBut.Text = "ClickTP"
ClickTpBut.TextColor3 = Color3.fromRGB(58, 93, 170)
ClickTpBut.TextSize = 14.000

NoClipBut.Name = "NoClipBut"
NoClipBut.Parent = MainFrame
NoClipBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NoClipBut.Position = UDim2.new(0.510489523, 0, 0.0650306717, 0)
NoClipBut.Size = UDim2.new(0, 200, 0, 50)
NoClipBut.Style = Enum.ButtonStyle.RobloxButton
NoClipBut.Font = Enum.Font.SourceSans
NoClipBut.Text = "Noclip"
NoClipBut.TextColor3 = Color3.fromRGB(58, 93, 170)
NoClipBut.TextSize = 14.000

SonicBut.Name = "SonicBut"
SonicBut.Parent = MainFrame
SonicBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SonicBut.Position = UDim2.new(-0.00233097491, 0, 0.0969325155, 0)
SonicBut.Size = UDim2.new(0, 200, 0, 50)
SonicBut.Style = Enum.ButtonStyle.RobloxButton
SonicBut.Font = Enum.Font.SourceSans
SonicBut.Text = "FE Sonic Animation"
SonicBut.TextColor3 = Color3.fromRGB(58, 93, 170)
SonicBut.TextSize = 14.000

TelekiniesBut.Name = "TelekiniesBut"
TelekiniesBut.Parent = MainFrame
TelekiniesBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TelekiniesBut.Position = UDim2.new(0.510489523, 0, 0.0957055241, 0)
TelekiniesBut.Size = UDim2.new(0, 200, 0, 50)
TelekiniesBut.Style = Enum.ButtonStyle.RobloxButton
TelekiniesBut.Font = Enum.Font.SourceSans
TelekiniesBut.Text = "Telekines"
TelekiniesBut.TextColor3 = Color3.fromRGB(58, 93, 170)
TelekiniesBut.TextSize = 14.000

WalkWallsBut.Name = "WalkWallsBut"
WalkWallsBut.Parent = MainFrame
WalkWallsBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WalkWallsBut.Position = UDim2.new(0, 0, 0.130061358, 0)
WalkWallsBut.Size = UDim2.new(0, 200, 0, 50)
WalkWallsBut.Style = Enum.ButtonStyle.RobloxButton
WalkWallsBut.Font = Enum.Font.SourceSans
WalkWallsBut.Text = "FE Walk On walls"
WalkWallsBut.TextColor3 = Color3.fromRGB(58, 93, 170)
WalkWallsBut.TextSize = 14.000

BtoolsBut.Name = "BtoolsBut"
BtoolsBut.Parent = MainFrame
BtoolsBut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BtoolsBut.Position = UDim2.new(0.510489523, 0, 0.130061358, 0)
BtoolsBut.Size = UDim2.new(0, 200, 0, 50)
BtoolsBut.Style = Enum.ButtonStyle.RobloxButton
BtoolsBut.Font = Enum.Font.SourceSans
BtoolsBut.Text = "Btools"
BtoolsBut.TextColor3 = Color3.fromRGB(58, 93, 170)
BtoolsBut.TextSize = 14.000

MEME.Name = "MEME"
MEME.Parent = MainFrame
MEME.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MEME.Position = UDim2.new(0, 0, 0.16257669, 0)
MEME.Size = UDim2.new(0, 200, 0, 50)
MEME.Style = Enum.ButtonStyle.RobloxButton
MEME.Font = Enum.Font.SourceSans
MEME.Text = "MEME"
MEME.TextColor3 = Color3.fromRGB(58, 93, 170)
MEME.TextSize = 14.000

-- Scripts:

local function TSQII_fake_script() -- FlyBut.Fly 
	local script = Instance.new('LocalScript', FlyBut)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Text == "Fly Already On." then
			game.StarterGui:SetCore("SendNotification",  {
				Title = "Fly Noti";
				Text = "FLY ALREADY ON";
				Icon = "";
				Duration = 5;
			})
		else
			script.Parent.Text = "Press E to disable/Enable"
			wait(2.5)
			script.Parent.Text = "Fly Already On."
			repeat wait() 
			until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
			local mouse = game.Players.LocalPlayer:GetMouse() 
			repeat wait() until mouse
			local plr = game.Players.LocalPlayer 
			local torso = plr.Character.HumanoidRootPart 
			local flying = true
			local deb = true 
			local ctrl = {f = 0, b = 0, l = 0, r = 0} 
			local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
			local maxspeed = 50 
			local speed = 0 
	
			function Fly() 
				local bg = Instance.new("BodyGyro", torso) 
				bg.P = 9e4 
				bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
				bg.cframe = torso.CFrame 
				local bv = Instance.new("BodyVelocity", torso) 
				bv.velocity = Vector3.new(0,0.1,0) 
				bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
				repeat wait() 
					plr.Character.Humanoid.PlatformStand = true 
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
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
						lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
					elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
					else 
						bv.velocity = Vector3.new(0,0.1,0) 
					end 
					bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
				until not flying 
				ctrl = {f = 0, b = 0, l = 0, r = 0} 
				lastctrl = {f = 0, b = 0, l = 0, r = 0} 
				speed = 0 
				bg:Destroy() 
				bv:Destroy() 
				plr.Character.Humanoid.PlatformStand = false 
			end 
			mouse.KeyDown:connect(function(key) 
				if key:lower() == "e" then 
					if flying then flying = false 
					else 
						flying = true 
						Fly() 
					end 
				elseif key:lower() == "w" then 
					ctrl.f = 1 
				elseif key:lower() == "s" then 
					ctrl.b = -1 
				elseif key:lower() == "a" then 
					ctrl.l = -1 
				elseif key:lower() == "d" then 
					ctrl.r = 1 
				end 
			end) 
			mouse.KeyUp:connect(function(key) 
				if key:lower() == "w" then 
					ctrl.f = 0 
				elseif key:lower() == "s" then 
					ctrl.b = 0 
				elseif key:lower() == "a" then 
					ctrl.l = 0 
				elseif key:lower() == "d" then 
					ctrl.r = 0 
				end 
			end)
			Fly()
		end
	end)
end
coroutine.wrap(TSQII_fake_script)()
local function XMMUGI_fake_script() -- MainFrame.Drag 
	local script = Instance.new('LocalScript', MainFrame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(XMMUGI_fake_script)()
local function UEZKG_fake_script() -- RespawnBut.Repsawn 
	local script = Instance.new('LocalScript', RespawnBut)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Text == "Respawning..." then
			game.StarterGui:SetCore("SendNotification",  {
				Title = "Respawn Noti";
				Text = "Already Respawning...";
				Icon = "";
				Duration = 5;
			})
		else
			script.Parent.Text = "Respawning..."
			wait(2.5)
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			game.Players.LocalPlayer.Character.Head.Remove()
			end
	end)
end
coroutine.wrap(UEZKG_fake_script)()
local function WOLU_fake_script() -- MainFrame.MouseButton3 
	local script = Instance.new('LocalScript', MainFrame)

	local UserInputService = game:GetService("UserInputService")
	local function onInputBegan(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton3 then
			if script.Parent.Visible == true then
				script.Parent.Visible = false
			else
				script.Parent.Visible = true
			end
		end
	end
	UserInputService.InputBegan:Connect(onInputBegan)
	
end
coroutine.wrap(WOLU_fake_script)()
local function TGAB_fake_script() -- ClickTpBut.ClickTp 
	local script = Instance.new('LocalScript', ClickTpBut)

	script.Parent.MouseButton1Down:Connect(function()
		mouse = game.Players.LocalPlayer:GetMouse()
		tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.Name = "Click Teleport"
		tool.Activated:connect(function()
			local pos = mouse.Hit+Vector3.new(0,2.5,0)
			pos = CFrame.new(pos.X,pos.Y,pos.Z)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		end)
		tool.Parent = game.Players.LocalPlayer.Backpack
	
	end)
end
coroutine.wrap(TGAB_fake_script)()
local function AATJTM_fake_script() -- NoClipBut.Noclip 
	local script = Instance.new('LocalScript', NoClipBut)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Text == "Noclip" then
			script.Parent.Text = "Clip"
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
		wait(2.6)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";noclip","All")
		else
			script.Parent.Text = "Noclip"
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";clip","All")
		end
	end)
end
coroutine.wrap(AATJTM_fake_script)()
local function ZDXVH_fake_script() -- SonicBut.Sonic 
	local script = Instance.new('LocalScript', SonicBut)

	script.Parent.MouseButton1Down:Connect(function()
		loadstring(game:HttpGetAsync("https://pastebin.com/raw/SyF5t70A"))()
	end)
end
coroutine.wrap(ZDXVH_fake_script)()
local function CRSQC_fake_script() -- TelekiniesBut.TEL 
	local script = Instance.new('LocalScript', TelekiniesBut)

	script.Parent.MouseButton1Down:Connect(function()
		--BROUGHT TO YOU BY RobloxScripter.com!--
		--Follow Our Partners!--
	
		local function a(b, c)
			local d = getfenv(c)
			local e =
				setmetatable(
					{},
					{__index = function(self, f)
					if f == "script" then
						return b
					else
						return d[f]
					end
				end}
				)
			setfenv(c, e)
			return c
		end
		local g = {}
		local h = Instance.new("Model", game:GetService("Lighting"))
		local i = Instance.new("Tool")
		local j = Instance.new("Part")
		local k = Instance.new("Script")
		local l = Instance.new("LocalScript")
		local m = sethiddenproperty or set_hidden_property
		i.Name = "Telekinesis"
		i.Parent = h
		i.Grip = CFrame.new(0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
		i.GripForward = Vector3.new(-0, -1, -0)
		i.GripRight = Vector3.new(0, 0, 1)
		i.GripUp = Vector3.new(1, 0, 0)
		j.Name = "Handle"
		j.Parent = i
		j.CFrame = CFrame.new(-17.2635937, 15.4915619, 46, 0, 1, 0, 1, 0, 0, 0, 0, -1)
		j.Orientation = Vector3.new(0, 180, 90)
		j.Position = Vector3.new(-17.2635937, 15.4915619, 46)
		j.Rotation = Vector3.new(-180, 0, -90)
		j.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
		j.Transparency = 1
		j.Size = Vector3.new(1, 1.20000005, 1)
		j.BottomSurface = Enum.SurfaceType.Weld
		j.BrickColor = BrickColor.new("Really black")
		j.Material = Enum.Material.Metal
		j.TopSurface = Enum.SurfaceType.Smooth
		j.brickColor = BrickColor.new("Really black")
		k.Name = "LineConnect"
		k.Parent = i
		table.insert(
			g,
			a(
				k,
				function()
					wait()
					local n = script.Part2
					local o = script.Part1.Value
					local p = script.Part2.Value
					local q = script.Par.Value
					local color = script.Color
					local r = Instance.new("Part")
					r.TopSurface = 0
					r.BottomSurface = 0
					r.Reflectance = .5
					r.Name = "Laser"
					r.Locked = true
					r.CanCollide = false
					r.Anchored = true
					r.formFactor = 0
					r.Size = Vector3.new(1, 1, 1)
					local s = Instance.new("BlockMesh")
					s.Parent = r
					while true do
						if n.Value == nil then
							break
						end
						if o == nil or p == nil or q == nil then
							break
						end
						if o.Parent == nil or p.Parent == nil then
							break
						end
						if q.Parent == nil then
							break
						end
						local t = CFrame.new(o.Position, p.Position)
						local dist = (o.Position - p.Position).magnitude
						r.Parent = q
						r.BrickColor = color.Value.BrickColor
						r.Reflectance = color.Value.Reflectance
						r.Transparency = color.Value.Transparency
						r.CFrame = CFrame.new(o.Position + t.lookVector * dist / 2)
						r.CFrame = CFrame.new(r.Position, p.Position)
						s.Scale = Vector3.new(.25, .25, dist)
						wait()
					end
					r:remove()
					script:remove()
				end
			)
		)
		k.Disabled = true
		l.Name = "MainScript"
		l.Parent = i
		table.insert(
			g,
			a(
				l,
				function()
					wait()
					tool = script.Parent
					lineconnect = tool.LineConnect
					object = nil
					mousedown = false
					found = false
					BP = Instance.new("BodyPosition")
					BP.maxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
					BP.P = BP.P * 1.1
					dist = nil
					point = Instance.new("Part")
					point.Locked = true
					point.Anchored = true
					point.formFactor = 0
					point.Shape = 0
					point.BrickColor = BrickColor.Black()
					point.Size = Vector3.new(1, 1, 1)
					point.CanCollide = false
					local s = Instance.new("SpecialMesh")
					s.MeshType = "Sphere"
					s.Scale = Vector3.new(.7, .7, .7)
					s.Parent = point
					handle = tool.Handle
					front = tool.Handle
					color = tool.Handle
					objval = nil
					local u = false
					local v = BP:clone()
					v.maxForce = Vector3.new(30000, 30000, 30000)
					function LineConnect(o, p, q)
						local w = Instance.new("ObjectValue")
						w.Value = o
						w.Name = "Part1"
						local x = Instance.new("ObjectValue")
						x.Value = p
						x.Name = "Part2"
						local y = Instance.new("ObjectValue")
						y.Value = q
						y.Name = "Par"
						local z = Instance.new("ObjectValue")
						z.Value = color
						z.Name = "Color"
						local A = lineconnect:clone()
						A.Disabled = false
						w.Parent = A
						x.Parent = A
						y.Parent = A
						z.Parent = A
						A.Parent = workspace
						if p == object then
							objval = x
						end
					end
					function onButton1Down(B)
						if mousedown == true then
							return
						end
						mousedown = true
						coroutine.resume(
							coroutine.create(
								function()
									local C = point:clone()
									C.Parent = tool
									LineConnect(front, C, workspace)
									while mousedown == true do
										C.Parent = tool
										if object == nil then
											if B.Target == nil then
												local t = CFrame.new(front.Position, B.Hit.p)
												C.CFrame = CFrame.new(front.Position + t.lookVector * 1000)
											else
												C.CFrame = CFrame.new(B.Hit.p)
											end
										else
											LineConnect(front, object, workspace)
											break
										end
										wait()
									end
									C:remove()
								end
							)
						)
						while mousedown == true do
							if B.Target ~= nil then
								local D = B.Target
								if D.Anchored == false then
									object = D
									dist = (object.Position - front.Position).magnitude
									break
								end
							end
							wait()
						end
						while mousedown == true do
							if object.Parent == nil then
								break
							end
							local t = CFrame.new(front.Position, B.Hit.p)
							BP.Parent = object
							BP.position = front.Position + t.lookVector * dist
							wait()
						end
						BP:remove()
						object = nil
						objval.Value = nil
					end
					function onKeyDown(E, B)
						local E = E:lower()
						local F = false
						if E == "q" then
							if dist >= 5 then
								dist = dist - 10
							end
						end
						if E == "r" then
							if object == nil then
								return
							end
							for G, H in pairs(object:children()) do
								if H.className == "BodyGyro" then
									return nil
								end
							end
							BG = Instance.new("BodyGyro")
							BG.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
							BG.cframe = CFrame.new(object.CFrame.p)
							BG.Parent = object
							repeat
								wait()
							until object.CFrame == CFrame.new(object.CFrame.p)
							BG.Parent = nil
							if object == nil then
								return
							end
							for G, H in pairs(object:children()) do
								if H.className == "BodyGyro" then
									H.Parent = nil
								end
							end
							object.Velocity = Vector3.new(0, 0, 0)
							object.RotVelocity = Vector3.new(0, 0, 0)
							object.Orientation = Vector3.new(0, 0, 0)
						end
						if E == "e" then
							dist = dist + 10
						end
						if E == "t" then
							if dist ~= 10 then
								dist = 10
							end
						end
						if E == "y" then
							if dist ~= 200 then
								dist = 200
							end
						end
						if E == "=" then
							BP.P = BP.P * 1.5
						end
						if E == "-" then
							BP.P = BP.P * 0.5
						end
					end
					function onEquipped(B)
						keymouse = B
						local I = tool.Parent
						human = I.Humanoid
						human.Changed:connect(
							function()
								if human.Health == 0 then
									mousedown = false
									BP:remove()
									point:remove()
									tool:remove()
								end
							end
						)
						B.Button1Down:connect(
							function()
								onButton1Down(B)
							end
						)
						B.Button1Up:connect(
							function()
								mousedown = false
							end
						)
						B.KeyDown:connect(
							function(E)
								onKeyDown(E, B)
							end
						)
						B.Icon = "rbxasset://textures\\GunCursor.png"
					end
					tool.Equipped:connect(onEquipped)
				end
			)
		)
		for J, H in pairs(h:GetChildren()) do
			H.Parent = game:GetService("Players").LocalPlayer.Backpack
			pcall(
				function()
					H:MakeJoints()
				end
			)
		end
		h:Destroy()
		for J, H in pairs(g) do
			spawn(
				function()
					pcall(H)
				end
			)
		end
	end)
end
coroutine.wrap(CRSQC_fake_script)()
local function ZHDWEL_fake_script() -- WalkWallsBut.walls 
	local script = Instance.new('LocalScript', WalkWallsBut)

	script.Parent.MouseButton1Down:Connect(function()
		getgenv()["cofiG"] = getgenv()["cofiG"] or {}
		local hasToUpdate = true
		local alreadyRan = cofiG.gravityController ~= nil
	
		local http = game:GetService'HttpService'
		local readfile,writefile,fileexists = readfile or syn_io_read,writefile or syn_io_write,isfile or readfile
	
		local rawUrl,baseUrl = "https://ixss.keybase.pub/rblx/gravityController/", "https://keybase.pub/ixss/rblx/gravityController/"
	
		do
			_G.req = [[
	        local require = function(lol)
	            lol = "https://raw.githubusercontent.com/msva/lua-htmlparser/master/src/"..lol:gsub("%.","/")..".lua";
	            return loadstring(_G.req..game:HttpGet(lol))();
	        end;
	    ]]
	
			local require = function(lol)
				lol = "https://raw.githubusercontent.com/msva/lua-htmlparser/master/src/"..lol:gsub("%.","/")..".lua";
				return loadstring(_G.req..game:HttpGet(lol))();
			end;
	
			cofiG.htmlparser = cofiG.htmlparser or require"htmlparser"
		end
	
		do  -- check if exists
			if fileexists'gravityController.json' then
				local json = readfile'gravityController.json'
				if json then
					cofiG.gravityController = http:JSONDecode(json)
					hasToUpdate = cofiG.gravityController.Version ~= game:HttpGet(rawUrl.."Version.txt")
				end
			end
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = hasToUpdate and "Updating script..." or "Running script!";
				Font = Enum.Font.Code;
				Color = Color3.fromRGB(255, 60, 60);
				FontSize = Enum.FontSize.Size96;   
			})
		end
	
	
		if hasToUpdate then -- update/download
	
			function getScripts()
				local ret = {}
				local text = game:HttpGet(baseUrl, false)
	
				local root = cofiG.htmlparser.parse(text)
				local files = root:select(".file")
	
				for i,v in pairs(files) do
					if string.sub(v.attributes.href, string.len(v.attributes.href)-3) == ".lua" then
						local name = string.sub(v.attributes.href,string.len(baseUrl)+1, string.len(v.attributes.href)-4)
						local script = rawUrl..name..".lua"
						ret[name] = game:HttpGet(script)
					elseif string.sub(v.attributes.href, string.len(v.attributes.href)-3) == ".txt" then
						local name = string.sub(v.attributes.href,string.len(baseUrl)+1, string.len(v.attributes.href)-4)
						local script = rawUrl..name..".txt"
						ret[name] = game:HttpGet(script)
					end
				end
	
				return ret
			end
			cofiG.gravityController = getScripts()
			writefile('gravityController.json', http:JSONEncode(cofiG.gravityController))
			warn('Script updated!')
		end
	
		local a,b = pcall(loadstring(cofiG.gravityController.Loader))
	
		if not a then
			error('Loader ', b)
		end
	
		if not alreadyRan then
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = game:HttpGet('https://ixss.keybase.pub/Watermark.txt', true)..", originally made by EgoMoose.";
				Font = Enum.Font.Code;
				Color = Color3.fromRGB(244, 0, 175);
				FontSize = Enum.FontSize.Size96;   
			})
		end
	end)
end
coroutine.wrap(ZHDWEL_fake_script)()
local function GGZTRR_fake_script() -- BtoolsBut.Btools 
	local script = Instance.new('LocalScript', BtoolsBut)

	script.Parent.MouseButton1Down:Connect(function()
		game.StarterGui:SetCoreGuiEnabled(2, true)
		a = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
		a.BinType = 2
		b = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
		b.BinType = 3
		c = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
		c.BinType = 4
	end)
end
coroutine.wrap(GGZTRR_fake_script)()
local function ACHGC_fake_script() -- MEME.me me 
	local script = Instance.new('LocalScript', MEME)

	script.Parent.MouseButton1Down:Connect(function()
		loadstring(game:HttpGetAsync("https://pastebin.com/raw/0QfjMKrF"))()
	end)
end
coroutine.wrap(ACHGC_fake_script)()

            end)    


    MainSection:NewButton("Cattori Hub", "idk", function()
                _G.ToggleKeyBind = "g"
loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)

MainSection:NewButton("Dex", "Explorer", function()
loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()
end)

MainSection:NewButton("Impluse hub", "idk", function()
loadstring(game:HttpGet('http://impulse-hub.xyz/ImpulseHub',true))()
 end)

MainSection:NewButton("Zyrex-Hub", "10+", function()
   _G.Toggle_GUI = Enum.KeyCode.RightControl --Right Ctrl

loadstring(game:HttpGet(("https://raw.githubusercontent.com/NotZyrex/Zyrex-Hub/master/Main.lua"), true))();
end)

MainSection:NewButton("Psyhub", "idk", function()
loadstring(game:GetObjects("rbxassetid://3014051754")[1].Source)()
 end)

MainSection:NewButton("VG Hub", "60+", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
 end)

MainSection:NewButton("Remote Spy", "Find remotes press F9", function()
loadstring(game:HttpGet('https://pastebin.com/raw/b33cjh0p'))()
end)

            MainSection:NewButton("Ezhub", "130+ games", function()
                --[[ this is there cmds list
https://pastebin.com/CvjkJxAt
]]--
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
--[[this is there thing idk
https://pastebin.com/vavZfexv
]]--
 end)
    
	   MainSection:NewButton("Owl Hub", "46+ how", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
            end)

        MainSection:NewButton("Infinite Yield FE", "Admin", function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)

        MainSection:NewButton("Discord Invite2", "Copys Discord invite link", function()
            setclipboard(string2)
        end)
        
        MainSection:NewButton("Destroy GUIS", "CLCK A LOT OF TIMES", function()
                for i, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            if v.Name == "Main" and v.Parent then
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                wait(0.1)
                v.Parent:Destroy()
                break
            end
        end
end)
        
        local Player = Window:NewTab("Player")
        local PlayerSection = Player:NewSection("Player")
        PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v) 
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end)

        PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v) 
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end)
        
        local Placeinfo = Window:NewTab("Place Info")
        local Playerinform = Placeinfo:NewSection("Place Info")
        
         Playerinform:NewButton(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Description), function()
end)
Playerinform:NewButton(game:GetService("Players"):GetNameFromUserIdAsync(game.CreatorId), (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Description), function()

end)
       Playerinform:NewButton("FilterEnabled/Repesect Is: (Click dots)", ("Click on the button and press F9"), function()
       print(game.Workspace.FilteringEnabled, "If it says true it means its on if it says false then it means its off")
        if game:GetService("SoundService").RespectFilteringEnabled == true then
                    print("RespectFilteringEnabled is enabled")
                else
                    print("RespectFilteringEnabled is disabled")
                end
       end)
    end
end
