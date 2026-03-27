local Update =  loadstring(game:HttpGet"https://you.whimper.xyz/sources/relzhub/dep/pc.lua")()
local Library = Update:Window("Legends Of Speed")
local main = Library:Tab("Main", "rbxassetid://6026568198")
local ss = Library:Tab("Auto Farm", "rbxassetid://7044284832")
local sss = Library:Tab("Teleport", "rbxassetid://6035190846")
local race = Library:Tab("Race", "rbxassetid://7251993295")
local egg = Library:Tab("Crystal", "rbxassetid://6031265976")
local misc = Library:Tab("Misc", "rbxassetid://6034509993")
local cred = Library:Tab("Credits", "rbxassetid://7743866778")
local how = Library:Tab("Glitch Help", "rbxassetid://7733964808")

local player = game.Players.LocalPlayer
local antiAFK = true
player.Idled:connect(function()
while wait(5) do
	if antiAFK then
		game.VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		game.VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end
	end
end)

main:Seperator("Main")

Time = main:Label("Executer Time")

function UpdateTime()
local GameTime = math.floor(workspace.DistributedGameTime+0.5)
local Hour = math.floor(GameTime/(60^2))%24
local Minute = math.floor(GameTime/(60^1))%60
local Second = math.floor(GameTime/(60^0))%60
Time:Set("[GameTime] : Hours : "..Hour.." Minutes : "..Minute.." Seconds : "..Second)
end

spawn(function()
 while task.wait() do
 pcall(function()
  UpdateTime()
  end)
 end
 end)

Client = main:Label("Client")

function UpdateClient()
local Fps = workspace:GetRealPhysicsFPS()
Client:Set("[Fps] : "..Fps)
end

spawn(function()
 while true do wait(.1)
 UpdateClient()
 end
 end)

Client1 = main:Label("Client")

function UpdateClient1()
local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
Client1:Set("[Ping] : "..Ping)
end

spawn(function()
 while true do wait(.1)
 UpdateClient1()
 end
 end)
 
 
 main:Label("Join My discord For More Info!")


main:Button("Copy Discord Link",function()
 setclipboard("https://discord.com/invite/hYmREEpSwh")
 end)
 

main:Line()

cred:Seperator("Credits")
race:Seperator("Race")
main:Button('Claim All Chests', function()
	workspace.goldenChest.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
	workspace.enchantedChest.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
	workspace.magmaChest.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
	workspace.groupRewardsCircle.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
	wait()
	workspace.goldenChest.circleInner.CFrame = oldGoldenChestPosition
	workspace.enchantedChest.circleInner.CFrame = oldEnchantedChestPosition
	workspace.magmaChest.circleInner.CFrame = oldMagmaChestPosition
	workspace.groupRewardsCircle.circleInner.CFrame = oldGroupRewardsPosition
end)

main:Toggle("Auto Rebirth",false,"Automatically rebirth at max level",function(state)
_G.Rebirth = (state and true or false)
	wait()
	while _G.Rebirth == true do
		wait()
		game.ReplicatedStorage.rEvents.rebirthEvent:FireServer("rebirthRequest")
		end
		end)
    	spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.NoClip then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)
	
main:Toggle("No Clip",false, "Penetrate anything",function(value)
        _G.NoClip = value
    end)

 main:Button("Dissable Trading",function()
 local args = {
    [1] = "disableTrading"
}

game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer(unpack(args))
 end)


 main:Button("Enable Trading",function()
 local args = {
    [1] = "enableTrading"
}

game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer(unpack(args))
 end)

 
 local PLIST = {}

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    table.insert(PLIST,v.Name)
end

local TpPlayer;

 main:Dropdown("Select Player",PLIST,false,function(value)
    TpPlayer = value;
end)



main:Button("Teleport To Player",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  game.Players[TpPlayer].Character.HumanoidRootPart.CFrame * CFrame.new(0,2,1)
end)
 
main:Slider("Speed",0,5000,300,function(v)
 game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
 end)

main:Slider("Jump",0,1000,50,function(v)
 game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
 end)
    
   ss:Seperator("Auto Farm")
   ss:Label("[ Farm Setting ]")
   local locate; 
    ss:Dropdown("Select Location", {"City",
  "Snow City"  ,
  "Magma City" , 
  "Legends Highway", 
  "Space" , 
  "Desert"
  
    },false, function(value)
        locate = value; 
    end)
 
local orbs; 
    ss:Dropdown("Select Orbs", {"Red Orb",
  "Yellow Orb"  ,
  "Gem"
  
    },false, function(value)
        orbs = value; --STORES THE USERS SELECTION
    end)
   local setFarm;
   ss:Dropdown("Select Mode",{
   "Super Fast",
   "Fast",
   "Medium",
   "Slow"
   },false, function(value)
   setFarm = value;

   if setFarm == "Super Fast" then
       setFarm = 40
    elseif setFarm == "Fast" then
       setFarm = 30 
    elseif setFarm == "Medium" then
       setFarm = 20
    elseif setFarm == "Slow" then
       setFarm = 10
    end
   end)

    ss:Label("• Super Fast Value = 40")
    ss:Label("• Fast Value = 30")
    ss:Label("• Medium Value = 20")
    ss:Label("• Slow Value = 10")
    ss:Label("Not Recommended Using Super Fast Mode")
    ss:Label("Because it will cause a delay / lag in the game")
    
    
  ss:Toggle("Start Farm",false,"Auto Collect Orbs",function(state)
_G.Farm = (state and true or false)
	wait()
	while _G.Farm == true do
		wait()
	for i=1, setFarm do
local A_1 = "collectOrb"
local A_2 = orbs
local A_3 = locate
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end) 

ss:Toggle("Hoops Farm",false,"Automatically moves the ring",function(state)
_G.Hoops = (state and true or false)
	wait()
	while _G.Hoops == true do
		wait()
    local children = workspace.Hoops:GetChildren()
    for i, child in ipairs(children) do
        if child.Name == 'Hoop' then
child.Transparency = 1
            child.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
        end
        end 
        end)
 
game.ReplicatedStorage.raceInProgress.Changed:Connect(function(state)
	if not getgenv().AutoRace then return end
	if state then
		game.ReplicatedStorage.rEvents.raceEvent:FireServer('joinRace')
		wait()
		player.PlayerGui.gameGui.raceJoinLabel.Visible = false
	end
end)
game.ReplicatedStorage.raceStarted.Changed:Connect(function(state)
	if not getgenv().AutoRace then return end
	if state then
		for i, v in pairs(workspace.raceMaps:GetChildren()) do
			local oldFinishPosition = v.finishPart.CFrame
			v.finishPart.CFrame = player.Character.HumanoidRootPart.CFrame
			wait()
			v.finishPart.CFrame = oldFinishPosition
		end
	end
end)
race:Toggle('Auto Finish Race',false,"Automatically join and win the race",function(state)
	getgenv().AutoRace = state
end)
 

sss:Seperator("Teleports")
if game.PlaceId == 3101667897 then --City
		sss:Button("City", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-9687.1923828125, 59.072853088378906, 3096.58837890625))
end)

sss:Button("Snow City", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-9677.6640625, 59.072853088378906, 3783.736572265625))
end)

sss:Button("Magma City", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-11053.3837890625, 217.0328369140625, 4896.10986328125))
end)

sss:Button("Legends Highway", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-13097.8583984375, 217.0328369140625, 5904.84716796875))
end)

sss:Button("Space", function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(3232996272, p)
end)

sss:Button("Desert", function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(3276265788, p)
end)

elseif game.PlaceId == 3232996272 then --space
sss:Button("City", function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(3101667897, p)
end)

sss:Button("Desert", function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(3276265788, p)
end)
elseif game.PlaceId == 3276265788 then --desert
sss:Button("City", function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(3101667897, p)
end)

sss:Button("Space", function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(3232996272, p)
end)
end


egg:Seperator("Crystal")

  local Crystal = {}
for i,v in pairs(game.workspace.mapCrystalsFolder:GetChildren()) do 
    table.insert(Crystal,v.Name)
end

function OpenCrystal(v) 
local args = {
            [1] = "openCrystal",
            [2] = v
        }
        game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
        end

local OPENEGG
egg:Dropdown('Select Crystal', Crystal,false, function(value)
    OPENEGG = value
end)

egg:Toggle("Open Crystal", false,"Auto Open Crystal",function(state)
    _G.Mm = state
    while _G.Mm do
        wait()
        OpenCrystal(OPENEGG) 
    end
end)
  
spawn(function() 
while wait() do
if _G.AutoSellAllTrails then
local rank = {}
for i,rank in pairs(game:GetService("Players").LocalPlayer.trailsFolder:GetChildren()) do
rank = rank.Name
    for i,item in pairs(game:GetService("Players").LocalPlayer.trailsFolder[rank]:GetChildren()) do
   
local args = {
    [1] = "sellTrail",
    [2] = game:GetService("Players").LocalPlayer.trailsFolder[rank]:FindFirstChild(item.Name)
}

game:GetService("ReplicatedStorage").rEvents.sellTrailEvent:FireServer(unpack(args))

    
    end
end
end
end
end) 

spawn(function() 
while wait() do
if _G.AutoSellAllPets then
local rank = {}
for i,rank in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
rank = rank.Name
    for i,item in pairs(game:GetService("Players").LocalPlayer.petsFolder[rank]:GetChildren()) do
    if item.Name ~= "Ultra Birdie" then
local args = {
    [1] = "sellPet",
    [2] = game:GetService("Players").LocalPlayer.petsFolder[rank]:FindFirstChild(item.Name)
}

game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer(unpack(args))

    end
    end
end
end
end
end) 

spawn(function() 
while wait() do
if _G.BunnyFarm then
local rank = {}
for i,rank in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
rank = rank.Name
    for i,item in pairs(game:GetService("Players").LocalPlayer.petsFolder[rank]:GetChildren()) do
    if item.Name ~= "Ultimate Overdrive Bunny" then
local args = {
    [1] = "sellPet",
    [2] = game:GetService("Players").LocalPlayer.petsFolder[rank]:FindFirstChild(item.Name)
}

game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer(unpack(args))

    end
    end
end
end
end
end) 

spawn(function() 
while wait() do
if _G.AutoUnique then
local rank = {}
for i,rank in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
rank = rank.Name
  if rank ~= "Unique" then
    for i,item in pairs(game:GetService("Players").LocalPlayer.petsFolder[rank]:GetChildren()) do
  
local args = {
    [1] = "sellPet",
    [2] = game:GetService("Players").LocalPlayer.petsFolder[rank]:FindFirstChild(item.Name)
}

game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer(unpack(args))

    end
    end
end
end
end
end) 

spawn(function() 
while wait() do
if _G.OpenBirdieEgg then
OpenCrystal("Electro Crystal") 
end
end
end) 

spawn(function() 
while wait() do
if _G.OpenVoidEgg then
OpenCrystal("Desert Crystal") 
end
end
end) 

spawn(function() 
while wait() do
if _G.OpenLegendsEgg then
OpenCrystal("Electro Legends Crystal") 
end
end
end) 

egg:Toggle("Auto Void Dragon [Desert]",false,"Auto Delete All Pets if not Void Dragon",function(state)

_G.OpenVoidEgg = state
_G.AutoUnique = state
_G.AutoSellAllTrails = state
end)

egg:Toggle("Auto Ultra Birdie [Best Pet Desert]",false,"Auto Delete All Pets if not Ultra Birdie",function(state)

_G.OpenBirdieEgg = state
_G.AutoSellAllPets = state
_G.AutoSellAllTrails = state
end)

egg:Toggle("Auto Unltimate Overdrive Bunny",false,"Auto Delete All Pets if not Overdrive Bunny",function(state)
_G.BunnyFarm = state
_G.OpenLegendsEgg = state
end)

egg:Toggle("Auto Evolved All Pets",false,"Auto Evolved",function(state)
_G.Evo = (state and true or false)
	wait()
	while _G.Evo == true do
		wait()
		for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
    for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder[v.Name]:GetChildren()) do
local args = {
    [1] = "evolvePet",
    [2] = v.Name
}

game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer(unpack(args))
end
end
end
end)




misc:Seperator("Misc")
misc:Toggle('Hide Popups', false,"Remove popup notifications", function(state)
	getgenv().HidePopups = state
	if not getgenv().HidePopups then player.PlayerGui.orbGui.Enabled = true player.PlayerGui.gameGui.trailsNotificationsFrame.Visible = true return end
	player.PlayerGui.orbGui.Enabled = false
	player.PlayerGui.gameGui.trailsNotificationsFrame.Visible = false
end)

misc:Toggle("Inf Jump",false,"Player jumps are unlimited",function(v)
_G.InfJump = v
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end
end)
end)
 
 misc:Button("Rejoin",function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(game.PlaceId, p)
end)
misc:Button("Low Server Hop",function()
        local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")()
		module:Teleport(game.PlaceId) ;
    end)
    
 								

cred:Button("Youtube Channel",function()
setclipboard('https://youtube.com/@RelzBlox')
end)
cred:Button("Discord",function()
setclipboard("https://discord.gg/25ms")
end)

how:Seperator("Tutorial")
how:Label("1. Use Pet Level 1 No XP")
how:Label("2. Turn on Yellow Orbs In Auto Farm Menu")
how:Label("3. Don't Get About XP")
how:Label("4. Don't Use Other Features Except Yellow Orbs")
how:Label("5. Done")

how:Seperator("Notes")
how:Label("> Make sure your Rebirth is Odd")
how:Label("> The Power Pet Will Return If You Disconnect")

