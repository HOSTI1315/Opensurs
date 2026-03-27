local Update = loadstring(game:HttpGet"https://you.whimper.xyz/sources/relzhub/dep/pc.lua")()
local Library = Update:Window("Ninja Legends");
local main = Library:Tab("Main", "rbxassetid://6026568198")
local farm = Library:Tab("Auto Farm", "rbxassetid://7044284832")
local tp = Library:Tab("Teleport", "rbxassetid://6035190846")
local egg = Library:Tab("Crystal", "rbxassetid://6031265976")
local misc = Library:Tab("Misc", "rbxassetid://6034509993")
local cred = Library:Tab("Credits", "rbxassetid://7743867811")


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
 setclipboard("https://discord.com/invite/25ms")
 end)
 
 main:Seperator("Main")
    

    
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
    table.insert(PLIST,v.DisplayName)
end

local TpPlayer;

 main:Dropdown("Select Player",PLIST,false,function(value)
    TpPlayer = value;
end)



main:Button("Teleport To Player",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  game.Players[TpPlayer].Character.HumanoidRootPart.CFrame * CFrame.new(0,20,1)
end)
 
main:Slider("Speed",0,1000,16,function(v)
 game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
 end)

main:Slider("Jump",0,1000,50,function(v)
 game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
 end)
    

farm:Seperator("Auto Farm")
farm:Toggle("Auto Swing",false,"Auto Farm Ninjitsu",function(state)
_G.swing = (state and true or false)
	wait()
	while _G.swing == true do
		wait()

local args = {
    [1] = "swingKatana"
}

game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
end
end)
farm:Toggle("Auto Sell",false,"Auto Sell Ninjitsu",function(state)
_G.sell = (state and true or false)
	wait()
	while _G.sell == true do
		wait()
game.workspace.sellAreaCircles["sellAreaCircle15"].circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
wait()
game.workspace.sellAreaCircles["sellAreaCircle15"].circleInner.CFrame = game.Workspace.Part.CFrame
end
end)
farm:Toggle("Auto Sell When Full",false,"Auto Sell Ninjitsu when full", function(state)
_G.sell = (state and true or false)
	wait()
	while _G.sell == true do
		wait()
if player.PlayerGui.gameGui.maxNinjitsuMenu.Visible == true then
game.workspace.sellAreaCircles["sellAreaCircle15"].circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
wait()
game.workspace.sellAreaCircles["sellAreaCircle15"].circleInner.CFrame = game.Workspace.Part.CFrame
end
end
end)
farm:Toggle("Auto Buy Sword",false,"Auto Buy All Swords", function(state)
_G.sw = (state and true or false)
	wait()
	while _G.sw == true do
		wait()

local args = {
    [1] = "buyAllSwords",
    [2] = "Blazing Vortex Island"
}

game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))

end
end)
farm:Toggle("Auto Buy Belts",false,"Auto Buy All Belts",function(state)
_G.sw = (state and true or false)
	wait()
	while _G.sw == true do
		wait()
local args = {
    [1] = "buyAllBelts",
    [2] = "Blazing Vortex Island"
}

game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))

end
end)
farm:Toggle("Auto Buy Skills",false,"Auto Buy All Skills", function(state)
_G.sk = (state and true or false)
	wait()
	while _G.sk == true do
		wait()
local args = {
    [1] = "buyAllSkills",
    [2] = "Blazing Vortex Island"
}

game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))

end
end)
farm:Toggle("Auto Buy Ranks",false,"Auto Buy Rank when meet the requirements",function(state)
_G.r = (state and true or false)
	wait()
	while _G.r == true do
		wait()
local oh1 = "buyRank"
local oh2 = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
for i = 1,#oh2 do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i].Name)
end
end
end)
farm:Toggle("Auto Buy Shurikens",false,"Auto Buy All Shurikens",function(state)
_G.sh = (state and true or false)
	wait()
	while _G.sh == true do
		wait()
local args = {
    [1] = "buyAllShurikens",
    [2] = "Blazing Vortex Island"
}

game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))

end
end)
farm:Toggle("Auto Farm Chi",false,"Auto Teleport to Chi",function(state)
_G.c = (state and true or false)
	wait()
	while _G.c == true do
		wait()
for i,v in pairs(game.Workspace.spawnedCoins.Valley:GetChildren()) do
if v.Name == "Blue Chi Crate" then 
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
wait(.3)
end
end
end
end)
farm:Toggle("Auto Farm Coin",false,"Auto Teleport to Coin",function(state)
_G.co = (state and true or false)
	wait()
	while _G.co == true do
		wait()
for i,v in pairs(game.Workspace.spawnedCoins.Valley:GetChildren()) do
if v.Name == "Purple Coin Crate" then 
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
wait(.3)
end
end
end
end)
farm:Toggle("Auto Hoops",false,"Auto Hoops",function(state)
_G.hoops = (state and true or false)
	wait()
	while _G.hoops == true do
		wait()
local plr = game.Players.LocalPlayer
for _,v in pairs(workspace.Hoops:GetDescendants()) do
if v.ClassName == "MeshPart" then
v.touchPart.CFrame = plr.Character.HumanoidRootPart.CFrame
end
end
end
end)


local ISLAND = {}
for i,v in pairs(game.workspace.islandUnlockParts:GetChildren()) do
table.insert(ISLAND, v.Name)
end

tp:Seperator("Island")
tp:Dropdown('Teleports',ISLAND,false,function(a)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.islandUnlockParts[a].islandSignPart.CFrame
end)
tp:Button("Unlock All Island", function()
for i,v in next, game.workspace.islandUnlockParts:GetChildren() do 
if v then 
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.islandSignPart.CFrame; 
wait(.2)
end
end
end)
egg:Seperator("Crystal")
local Crystal = {}
for i,v in pairs(game.workspace.mapCrystalsFolder:GetChildren()) do 
table.insert(Crystal,v.Name)
end
egg:Dropdown('Select Crystal',Crystal,false,function(value)
_G.cryEgg = value
end)

egg:Toggle("Open Crystal",false,"Auto Open Selected Crystal",function(state)
_G.cCry = (state and true or false)
	wait()
	while _G.cCry == true do
		wait()
    local oh1 = "openCrystal"
local oh2 = _G.cryEgg
game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(oh1, oh2)
end
end)
egg:Toggle("Auto Evolved Pet","Auto Evolved All Pet",false,function(state)
_G.ePet = (state and true or false)
	wait()
	while _G.ePet == true do
		wait()
for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
for i,x in pairs(v:GetChildren()) do
local oh1 = "evolvePet"
local oh2 = x.Name
game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer(oh1, oh2)
end
end
end
end)
misc:Seperator("Misc")

misc:Toggle("Inf Double Jump",false,"Unlimited Double Jump", function(state)
_G.iJump = state
if _G.iJump then
game.Players.LocalPlayer.multiJumpCount.Value = "99999999999999999"
end
end)
misc:Button("Get All Elements", function()
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Frost")

    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Inferno")
    
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Lightning")
    
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Electral Chaos")
    
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Masterful Wrath")
    
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Shadow Charge")
   
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Shadowfire")

    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Eternity Storm")
        
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Blazing Entity")
end)
main:Toggle("Dissable PopUp Coin & Chi",false,"Hide Popup",function(state)
_G.PopUp = state
game:GetService("Players").LocalPlayer.PlayerGui.statEffectsGui.Enabled = not game:GetService("Players").LocalPlayer.PlayerGui.statEffectsGui.Enabled
game:GetService("Players").LocalPlayer.PlayerGui.hoopGui.Enabled = not game:GetService("Players").LocalPlayer.PlayerGui.hoopGui.Enabled
end)
main:Toggle("Invisibility",false,"Invisibility Character",function(state)
_G.invis = (state and true or false)
	wait()
	while _G.invis == true do
		wait()
		local A_1 = "goInvisible"
local Event = game.Players.LocalPlayer.ninjaEvent
Event:FireServer(A_1)
end
end)


misc:Toggle("Inf Jump",false,"Unlimited Jump",function(state)
_G.iJumps = state
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
 								

cred:Seperator("Credits")
cred:Button("Youtube",function()
setclipboard('https://youtube.com/@RelzBlox')
end)

cred:Button("Discord",function()
setclipboard("https://discord.gg/822wEuEmmxe")
end)

cred:Button("My Site",function()
setclipboard("https://relzscript.com")
end)
    
