
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local selectedTheme = "Default"
local Window = Rayfield:CreateWindow({
   Name = "Hunty Zombies - Script By Iliankytb",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Hunty Zombies",
   LoadingSubtitle = "Script By Iliankytb",
   Theme = selectedTheme, -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SaverHZ", -- Create a custom folder for your hub/game
      FileName = "K"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local PlayerTab = Window:CreateTab("Player")
local GameTab = Window:CreateTab("Game")
local DiscordTab = Window:CreateTab("Discord")
local SettingsTab = Window:CreateTab("Settings")
local ActiveSpeedBoost,AutoFarm,NoCooldownAbility,AutoReplay,FreezeNPC,AutoCollect,NoStun,InCollecting,AutoEscape,InteractedWithGen,InEscaping,ActivateDash,InSafePos,AutoSP,AutoGen = false,false,false,false,false,false,false,false,false,false,false,false,false,false,false
local DS = false
Rayfield:Notify({
   Title = "script Version",
   Content = "V.0.18",
   Duration = 2.5,
   Image = "rewind",
})
local function copyToClipboard(text)
    if setclipboard then
        setclipboard(text)
    else
        warn("setclipboard is not supported in this environment.")
    end
end
local DiscordLink = DiscordTab:CreateButton({
   Name = "Discord Link",
   Callback = function()
copyToClipboard("https://discord.gg/E2TqYRsRP4")
end,
})
local ValueSpeed = 16
local PlayerSpeedSlider = PlayerTab:CreateSlider({
   Name = "Player Speed",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Speeds",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
CurrentValue = Value
ValueSpeed = Value
end,  ValueSpeed = CurrentValue,
})

local PlayerActiveModifyingSpeedToggle = PlayerTab:CreateToggle({
   Name = "Active Modifying Player Speed",
   CurrentValue = false,
   Flag = "ButtonSpeed1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  ActiveSpeedBoost = Value 
task.spawn(function()
while ActiveSpeedBoost do 
task.spawn(function()
Game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ValueSpeed 
end)
task.wait(0.1)
end end)
end,
})
local ValueSpeed2 = 16
local PlayerSpeedSlider = PlayerTab:CreateSlider({
   Name = "Dash Speed",
   Range = {0, 1000},
   Increment = 1,
   Suffix = "Speeds",
   CurrentValue = 16,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
CurrentValue = Value
ValueSpeed2 = Value
end,  ValueSpeed2 = CurrentValue,
})

local PlayerActiveModifyingSpeedToggle = PlayerTab:CreateToggle({
   Name = "Active Modifying Dash Speed",
   CurrentValue = false,
   Flag = "ButtonSpeed2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  ActiveDash = Value 
task.spawn(function()
while ActiveDash do 
task.spawn(function()
Game.Players.LocalPlayer.Character:SetAttribute("DashMagnitude",ValueSpeed2)
end)
task.wait(0.1)
end 
Game.Players.LocalPlayer.Character:SetAttribute("DashMagnitude",16)
end)
end,
})

local AFToggle = GameTab:CreateToggle({
   Name = "AutoFarm",
   CurrentValue = false,
   Flag = "ButtonAF1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  AutoFarm = Value 
task.spawn(function()
while AutoFarm do
for _,zombies in pairs(workspace.Entities.Zombie:GetChildren()) do
if zombies:IsA("Model") and zombies.Head.EntityHealth.HealthBar.Bar.Size.X.Scale ~= 0 and not DS and not InSafePos and not InCollecting and not InEscaping and not InteractedWithGen and not Game.Players.LocalPlayer:GetAttribute("escaped") then 
Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = zombies.PrimaryPart.CFrame
end 
end 
wait(0.1)
end
end)
end,
})

local NCAToggle = GameTab:CreateToggle({
   Name = "No Cooldown Ability",
   CurrentValue = false,
   Flag = "ButtonNCA1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  NoCooldownAbility = Value 
task.spawn(function()
while NoCooldownAbility do
for I = 1,9 do 
task.spawn(function()
game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):SetAttribute("lastActivated"..I-1,game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):GetAttribute("lastActivated"..I-1)+0.00001)
end)
task.wait(0.1) 
end
task.wait(0.1) end
end)
end,
})
local FreezeZombiesToggle = GameTab:CreateToggle({
   Name = "Freeze Zombies",
   CurrentValue = false,
   Flag = "ButtonFreezeZombies1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  FreezeNPC = Value 
local Map = ""
if Workspace:FindFirstChild("School") then
Map = "School"
elseif Workspace:FindFirstChild("Sewers") then 
Map = "Sewers"
end
while FreezeNPC do
for _, k in pairs(Workspace[Map].Doors:GetChildren()) do 
k:SetAttribute("locked",true)
end
wait(1)
end
for _, k in pairs(Workspace[Map].Doors:GetChildren()) do k:SetAttribute("locked",false)  end
 end,
})
local AutoCollectToggle = GameTab:CreateToggle({
   Name = "Auto Collect",
   CurrentValue = false,
   Flag = "ButtonAC1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  AutoCollect = Value 
while AutoCollect do
InCollecting = false
for _, k in pairs(workspace.DropItems:GetChildren()) do 
task.spawn(function()
if k:isA("BasePart") and not DS and not InSafePos and  not InEscaping and not Game.Players.LocalPlayer:GetAttribute("escaped") then
InCollecting = true
Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.CFrame
wait(0.25)
end 
end)
end
wait(0.1)
end InCollecting = false
end,
})
local NoStunToggle = GameTab:CreateToggle({
   Name = "No Stun",
   CurrentValue = false,
   Flag = "ButtonNS1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  NoStun = Value 
while NoStun do
if  not Game.Players.LocalPlayer:GetAttribute("escaped") and not InEscaping then
Game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
Game.Players.LocalPlayer.Character:SetAttribute("abilitiesDisabled",false)
end
wait(0.1)
end
end,
})
if Workspace:FindFirstChild("Sewers") then
local AutoGenToggle = GameTab:CreateToggle({
   Name = "Auto Gen",
   CurrentValue = false,
   Flag = "ButtonAG1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  AutoGen = Value 
while AutoGen do
if workspace.Sewers.Rooms:FindFirstChild("BossRoom") and not InEscaping and not InteractedWithGen and not Game.Players.LocalPlayer:GetAttribute("escaped")  then
local heliObjective = workspace.Sewers.Rooms.BossRoom.generator.gen
local prompt = heliObjective:FindFirstChildOfClass("ProximityPrompt")
if prompt then
DS = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = heliObjective.CFrame
  wait(0.5)  
prompt:InputHoldBegin()
task.wait(prompt.HoldDuration) -- Attente de la durée de maintien
    wait(0.5)
InteractedWithGen = true
DS = false
end
end
wait(0.1)
end
end,
})
local SafePositionToggle = GameTab:CreateToggle({
   Name = "Auto Safe Position",
   CurrentValue = false,
   Flag = "ButtonASP1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  AutoSP = Value 
while AutoSP do 
task.spawn(function()
if game:GetService("ReplicatedStorage").OBJECTIVES.timer and not game.Players.LocalPlayer.Character:GetAttribute("Escaped") then
InSafePos = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Sewers.Rooms.BossRoom.NewSpawnPos.CFrame + Vector3.new(0,150,0)
if InteractedWithGen then
InEscaping = true
end
end
end)
wait(0.1)
end
InSafePos = false
end,
})
end
if Workspace:FindFirstChild("School") then
local AutoEscapeToggle = GameTab:CreateToggle({
   Name = "Auto Escape",
   CurrentValue = false,
   Flag = "ButtonAE1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  AutoEscape = Value 
while AutoEscape do 
if workspace.School.Rooms:FindFirstChild("RooftopBoss") and not InEscaping and not game:GetService("ReplicatedStorage").OBJECTIVES:FindFirstChild("surviveTimer") and not InteractedWithGen and not Game.Players.LocalPlayer:GetAttribute("escaped")  then
local heliObjective = workspace.School.Rooms.RooftopBoss.RadioObjective
local prompt = heliObjective:FindFirstChildOfClass("ProximityPrompt")
if prompt then
DS = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = heliObjective.CFrame
  wait(0.5)  
prompt:InputHoldBegin()
task.wait(prompt.HoldDuration) -- Attente de la durée de maintien
DS = false
wait(7)
InteractedWithGen = true
end
end
if game:GetService("ReplicatedStorage").OBJECTIVES:FindFirstChild("surviveTimer") and workspace.School.Rooms:FindFirstChild("RooftopBoss") and not InEscaping and InteractedWithGen and not Game.Players.LocalPlayer:GetAttribute("escaped") then
local heliObjective = workspace.School.Rooms.RooftopBoss.HeliObjective
local prompt = heliObjective:FindFirstChildOfClass("ProximityPrompt")

if prompt then
DS = true
InEscaping = true
for _, part in pairs(workspace.School.Rooms.RooftopBoss.Buildings.InvisibleWalls:GetChildren()) do
if part then
part.CanCollide = false
end
end

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = heliObjective.CFrame
  wait(0.5) 
prompt:InputHoldBegin()
    task.wait(prompt.HoldDuration) -- Attente de la durée de maintien
    wait(0.5)
DS = false
end
end
wait(0.1)
end
end,
})
end
local AutoReplayToggle = GameTab:CreateToggle({
   Name = "Auto Replay",
   CurrentValue = false,
   Flag = "ButtonAR1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  AutoReplay = Value 
while AutoReplay do
game:GetService("ReplicatedStorage").external.Packets.voteReplay:FireServer()
wait(0.1)
end
end,
})
if Workspace:FindFirstChild("Sewers") then
local ButtonTPCheat = GameTab:CreateButton({
   Name = "TP to end",
   Callback = function()
if workspace.Sewers.Rooms.BossRoom then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Sewers.Rooms.BossRoom.NewSpawnPos.CFrame
end
end,
})
end
if Workspace:FindFirstChild("School") then
local ButtonTPCheat = GameTab:CreateButton({
   Name = "TP to end",
   Callback = function()
if workspace.School.Rooms.RooftopBoss.HeliObjective then
Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.School.Rooms.RooftopBoss.HeliObjective.CFrame
for _, part in pairs(workspace.School.Rooms.RooftopBoss.Buildings.InvisibleWalls:GetChildren()) do
if part then
part.CanCollide = false
end
end
end
end,
})
end
local ButtonUnloadCheat = SettingsTab:CreateButton({
   Name = "Unload Cheat",
   Callback = function()
  Rayfield:Destroy()
end,
})
local Themes = {
   ["Default"] = "Default",
   ["Amber Glow"] = "AmberGlow",
   ["Amethyst"] = "Amethyst",
   ["Bloom"] = "Bloom",
   ["Dark Blue"] = "DarkBlue",
   ["Green"] = "Green",
   ["Light"] = "Light",
   ["Ocean"] = "Ocean",
   ["Serenity"] = "Serenity"
}

local Dropdown = SettingsTab:CreateDropdown({
   Name = "Change Theme",
   Options = {"Default", "Amber Glow", "Amethyst", "Bloom", "Dark Blue", "Green", "Light", "Ocean", "Serenity"},
   CurrentOption = selectedTheme,  -- pour afficher ce qui est réellement chargé
   Flag = "ThemeSelection",
   Callback = function(Selected)
      local ident = Themes[Selected[1]]
      Window.ModifyTheme(ident)  -- <— Applique le thème en direct
   end, 
})

Rayfield:LoadConfiguration() 
