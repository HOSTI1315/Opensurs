 
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzxzsss/zxs/refs/heads/main/ui/dummyui"))()

-- Create Main Window
local Window = Library:Window({
    Title = "zzz hub made this ",
    Desc = "made by zzz hub",
    Icon = 105059922903197,
    Theme = "Dark",
    Config = {
        Keybind = Enum.KeyCode.LeftControl,
        Size = UDim2.new(0, 500, 0, 400)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "zzz hub"
    }
})

-- Create Tabs
local MainTab = Window:Tab({Title = "Main", Icon = "star"})
local AutoFarmTab = Window:Tab({Title = "Auto Farm", Icon = "zap"})
local RebirthTab = Window:Tab({Title = "Rebirth", Icon = "refresh-cw"})
local KillerTab = Window:Tab({Title = "Killer", Icon = "sword"})
local CrystalsTab = Window:Tab({Title = "Crystals", Icon = "gem"})
local TeleportTab = Window:Tab({Title = "Teleport", Icon = "navigation"})
local StatsTab = Window:Tab({Title = "Stats", Icon = "bar-chart"})
local MiscTab = Window:Tab({Title = "Misc", Icon = "settings"})

-- Main Tab
MainTab:Section({Title = "Basic Controls"})

local selectedSize = "2"
MainTab:Textbox({
    Title = "Size Changer",
    Desc = "Enter Size",
    Placeholder = "Enter size",
    Value = "2",
    ClearTextOnFocus = false,
    Callback = function(Value)
        selectedSize = Value
        if _G.AutoSize then
            game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", tonumber(selectedSize))
        end
    end
})

MainTab:Toggle({
    Title = "Auto Set Size",
    Desc = "Automatically set size",
    Value = false,
    Callback = function(Value)
        _G.AutoSize = Value
        while _G.AutoSize do
            game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", tonumber(selectedSize))
            task.wait(0.1)
        end
    end
})

local selectedSpeed = "125"
MainTab:Textbox({
    Title = "Speed Changer",
    Desc = "Enter Speed",
    Placeholder = "Enter speed",
    Value = "125",
    ClearTextOnFocus = false,
    Callback = function(Value)
        selectedSpeed = Value
        if _G.AutoSpeed then
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(selectedSpeed)
            end
        end
    end
})

MainTab:Toggle({
    Title = "Auto Set Speed",
    Desc = "Automatically set speed",
    Value = false,
    Callback = function(Value)
        _G.AutoSpeed = Value
        while _G.AutoSpeed do
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(selectedSpeed)
            end
            task.wait()
        end
    end
})

MainTab:Button({
    Title = "Free AutoLift Gamepass",
    Desc = "Get free autoLift gamepass",
    Callback = function()
        local gamepassFolder = game:GetService("ReplicatedStorage").gamepassIds
        local player = game:GetService("Players").LocalPlayer
        for _, gamepass in pairs(gamepassFolder:GetChildren()) do
            local value = Instance.new("IntValue")
            value.Name = gamepass.Name
            value.Value = gamepass.Value
            value.Parent = player.ownedGamepasses
        end
        Window:Notify({
            Title = "Success",
            Desc = "AutoLift gamepass activated!",
            Time = 3
        })
    end
})

-- Auto Farm Tab
AutoFarmTab:Section({Title = "Exercise Automation"})

AutoFarmTab:Toggle({
    Title = "Auto Weight",
    Desc = "Automatically use weight",
    Value = false,
    Callback = function(Value)
        _G.AutoWeight = Value
        if Value then
            local weightTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
            if weightTool then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(weightTool)
            end
        else
            local character = game.Players.LocalPlayer.Character
            local equipped = character:FindFirstChild("Weight")
            if equipped then
                equipped.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        while _G.AutoWeight do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0)
        end
    end
})

AutoFarmTab:Toggle({
    Title = "Auto Pushups",
    Desc = "Automatically do pushups",
    Value = false,
    Callback = function(Value)
        _G.AutoPushups = Value
        if Value then
            local pushupsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
            if pushupsTool then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(pushupsTool)
            end
        else
            local character = game.Players.LocalPlayer.Character
            local equipped = character:FindFirstChild("Pushups")
            if equipped then
                equipped.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        while _G.AutoPushups do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0)
        end
    end
})

AutoFarmTab:Toggle({
    Title = "Auto Handstands",
    Desc = "Automatically do handstands",
    Value = false,
    Callback = function(Value)
        _G.AutoHandstands = Value
        if Value then
            local handstandsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstands")
            if handstandsTool then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(handstandsTool)
            end
        else
            local character = game.Players.LocalPlayer.Character
            local equipped = character:FindFirstChild("Handstands")
            if equipped then
                equipped.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        while _G.AutoHandstands do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0)
        end
    end
})

AutoFarmTab:Toggle({
    Title = "Auto Situps",
    Desc = "Automatically do situps",
    Value = false,
    Callback = function(Value)
        _G.AutoSitups = Value
        if Value then
            local situpsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
            if situpsTool then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(situpsTool)
            end
        else
            local character = game.Players.LocalPlayer.Character
            local equipped = character:FindFirstChild("Situps")
            if equipped then
                equipped.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        while _G.AutoSitups do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0)
        end
    end
})

-- Rebirth Tab
RebirthTab:Section({Title = "AutoRebirth"})

local targetRebirthValue = 1
RebirthTab:Textbox({
    Title = "Target Rebirth Amount",
    Desc = "Enter rebirth target",
    Placeholder = "Enter amount",
    Value = "1",
    ClearTextOnFocus = false,
    Callback = function(Value)
        targetRebirthValue = tonumber(Value) or 1
    end
})

RebirthTab:Toggle({
    Title = "Auto Rebirth (Target)",
    Desc = "Rebirth until target reached",
    Value = false,
    Callback = function(Value)
        if Value then
            task.spawn(function()
                while Value and game.Players.LocalPlayer.leaderstats.Rebirths.Value < targetRebirthValue do
                    game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                    task.wait(0.1)
                end
            end)
        end
    end
})

RebirthTab:Toggle({
    Title = "Auto Rebirth (Infinite)",
    Desc = "Rebirth continuously",
    Value = false,
    Callback = function(Value)
        if Value then
            task.spawn(function()
                while Value do
                    game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Killer Tab
KillerTab:Section({Title = "Auto Kill"})

local function gettool()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end

local function killPlayer(target)
    if not game.Players.LocalPlayer.Character then
        repeat task.wait() until game.Players.LocalPlayer.Character
    end
    local character = game.Players.LocalPlayer.Character
    if character and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        if character:FindFirstChild("LeftHand") then
            firetouchinterest(target.Character.HumanoidRootPart, character.LeftHand, 0)
            firetouchinterest(target.Character.HumanoidRootPart, character.LeftHand, 1)
            gettool()
        end
    end
end

KillerTab:Toggle({
    Title = "Start Killing",
    Desc = "Kill all players",
    Value = false,
    Callback = function(Value)
        getgenv().killallv2 = Value
        task.spawn(function()
            while getgenv().killallv2 do
                for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                            killPlayer(player)
                        end
                    end
                end
                task.wait()
            end
        end)
    end
})

-- Crystals Tab
CrystalsTab:Section({Title = "Crystal Opening"})

local selectedCrystal1 = "Blue Crystal"
CrystalsTab:Dropdown({
    Title = "Select Crystal",
    List = {"Blue Crystal", "Green Crystal", "Frost Crystal", "Mythical Crystal", "Inferno Crystal"},
    Value = "Blue Crystal",
    Callback = function(Value)
        selectedCrystal1 = Value
    end
})

CrystalsTab:Toggle({
    Title = "Auto Open Crystal",
    Desc = "Automatically opens selected crystal",
    Value = false,
    Callback = function(Value)
        _G.AutoOpen1 = Value
        while _G.AutoOpen1 do
            game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", selectedCrystal1)
            task.wait(1)
        end
    end
})

-- Teleport Tab
TeleportTab:Section({Title = "Teleportation"})

local teleportLocations = {
    {"Spawn", CFrame.new(2, 8, 115)},
    {"Secret", CFrame.new(1947, 2, 6191)},
    {"Tiny", CFrame.new(-34, 7, 1903)},
    {"Frozen", CFrame.new(-2600.00244, 3.67686558, -403.884369)},
    {"Mythical", CFrame.new(2255, 7, 1071)},
    {"Inferno", CFrame.new(-6768, 7, -1287)},
    {"Legend", CFrame.new(4604, 991, -3887)},
    {"Muscle King", CFrame.new(-8646, 17, -5738)},
    {"Jungle", CFrame.new(-8659, 6, 2384)}
}

for _, location in ipairs(teleportLocations) do
    local name, position = location[1], location[2]
    TeleportTab:Button({
        Title = "Teleport to " .. name,
        Desc = "Click to teleport",
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            humanoidRootPart.CFrame = position
            Window:Notify({
                Title = "Teleported",
                Desc = "Teleported to " .. name,
                Time = 2
            })
        end
    })
end

-- Stats Tab
StatsTab:Section({Title = "Player Statistics"})
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

local startTime = 0
local sessionStartTime = os.time()
local timerRunning = false

local strengthGained = 0
local lastStrengthValue = nil
local rebirthsGained = 0
local lastRebirthsValue = nil
local killsGained = 0
local lastKillsValue = nil
local brawlsGained = 0
local lastBrawlsValue = nil
local goodKarmaGained = 0
local lastGoodKarmaValue = nil
local evilKarmaGained = 0
local lastEvilKarmaValue = nil
local durabilityGained = 0
local lastDurabilityValue = nil
local agilityGained = 0
local lastAgilityValue = nil
local muscleKingTimeGained = 0
local lastMuscleKingTimeValue = nil

local function formatNumber(number)
local formatted = tostring(math.floor(number))
local k
while true do
  formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
  if k == 0 then
    break
  end
end
return formatted
end

local function formatTime(seconds)
local days = math.floor(seconds / 86400)
local hours = math.floor((seconds % 86400) / 3600)
local minutes = math.floor((seconds % 3600) / 60)
local secs = seconds % 60
return string.format("%dd %dh %dm %ds", days, hours, minutes, secs)
end

local function debugPrint(message, value)
print(string.format("[DEBUG] %s: %s", message, tostring(value)))
end

repeat
task.wait()
until game:IsLoaded()
debugPrint("")

if not player.Character then
player.CharacterAdded:Wait()
end
debugPrint("Character Loaded", "Success")

repeat
task.wait()
until player:FindFirstChild("leaderstats") and player:FindFirstChild("goodKarma")
debugPrint("")

local TimerParagraph = StatsTab:CreateLabel("SessionTimer", "⏱️ Session Time: 0d 0h 0m 0s")
local CustomTimerParagraph = StatsTab:CreateLabel("CustomTimer", "⏱️ Custom Timer: Timer not started")
local LeaderParagraph = StatsTab:CreateLabel("LeaderStats", "📊 Leaderboard Stats: Loading stats...")
local IntParagraph = StatsTab:CreateLabel("IntStats", "💪 Player Stats: Loading stats...")

StatsTab:CreateButton("Start/Stop Timer", function()
  if not timerRunning then
    startTime = os.time()
    timerRunning = true
    CustomTimerParagraph:Set("⏱️ Custom Timer: Timer running...")
  else
    timerRunning = false
    CustomTimerParagraph:Set("⏱️ Custom Timer: Timer stopped")
  end
end)

RunService.RenderStepped:Connect(function()
local sessionTime = os.time() - sessionStartTime
TimerParagraph:Set("⏱️ Session Time: "..formatTime(sessionTime))
if timerRunning then
  local elapsed = os.time() - startTime
  CustomTimerParagraph:Set("⏱️ Custom Timer: "..formatTime(elapsed))
end
local currentStrength = player.leaderstats.Strength.Value
local currentRebirths = player.leaderstats.Rebirths.Value
local currentKills = player.leaderstats.Kills.Value
local currentBrawls = player.leaderstats.Brawls.Value
local currentGoodKarma = player.goodKarma.Value
local currentEvilKarma = player.evilKarma.Value
local currentDurability = player.Durability.Value
local currentAgility = player.Agility.Value
local currentMuscleKingTime = player.muscleKingTime.Value
if lastStrengthValue == nil then
  lastStrengthValue = currentStrength
elseif currentStrength > lastStrengthValue then
  strengthGained = strengthGained + (currentStrength - lastStrengthValue)
end
lastStrengthValue = currentStrength
if lastRebirthsValue == nil then
  lastRebirthsValue = currentRebirths
elseif currentRebirths > lastRebirthsValue then
  rebirthsGained = rebirthsGained + (currentRebirths - lastRebirthsValue)
end
lastRebirthsValue = currentRebirths
if lastKillsValue == nil then
  lastKillsValue = currentKills
elseif currentKills > lastKillsValue then
  killsGained = killsGained + (currentKills - lastKillsValue)
end
lastKillsValue = currentKills
if lastBrawlsValue == nil then
  lastBrawlsValue = currentBrawls
elseif currentBrawls > lastBrawlsValue then
  brawlsGained = brawlsGained + (currentBrawls - lastBrawlsValue)
end
lastBrawlsValue = currentBrawls
if lastGoodKarmaValue == nil then
  lastGoodKarmaValue = currentGoodKarma
elseif currentGoodKarma > lastGoodKarmaValue then
  goodKarmaGained = goodKarmaGained + (currentGoodKarma - lastGoodKarmaValue)
end
lastGoodKarmaValue = currentGoodKarma
if lastEvilKarmaValue == nil then
  lastEvilKarmaValue = currentEvilKarma
elseif currentEvilKarma > lastEvilKarmaValue then
  evilKarmaGained = evilKarmaGained + (currentEvilKarma - lastEvilKarmaValue)
end
lastEvilKarmaValue = currentEvilKarma
if lastDurabilityValue == nil then
  lastDurabilityValue = currentDurability
elseif currentDurability > lastDurabilityValue then
  durabilityGained = durabilityGained + (currentDurability - lastDurabilityValue)
end
lastDurabilityValue = currentDurability
if lastAgilityValue == nil then
  lastAgilityValue = currentAgility
elseif currentAgility > lastAgilityValue then
  agilityGained = agilityGained + (currentAgility - lastAgilityValue)
end
lastAgilityValue = currentAgility
if lastMuscleKingTimeValue == nil then
  lastMuscleKingTimeValue = currentMuscleKingTime
elseif currentMuscleKingTime > lastMuscleKingTimeValue then
  muscleKingTimeGained = muscleKingTimeGained + (currentMuscleKingTime - lastMuscleKingTimeValue)
end
lastMuscleKingTimeValue = currentMuscleKingTime
LeaderParagraph:Set("📊 Leaderboard Stats: Strength: " .. formatNumber(currentStrength).."     Strength Gained: ".. formatNumber(strengthGained).."\nRebirths: " .. formatNumber(currentRebirths).."     Rebirths Gained: ".. formatNumber(rebirthsGained).."\nKills: " .. formatNumber(currentKills).."     Kills Gained: ".. formatNumber(killsGained).."\nBrawls: " .. formatNumber(currentBrawls).."     Brawls Gained: "..formatNumber(brawlsGained))
IntParagraph:Set("💪 Player Stats: Good Karma: " .. formatNumber(currentGoodKarma).."     Gained: "..formatNumber(goodKarmaGained).."\nEvil Karma: " .. formatNumber(currentEvilKarma).."     Gained: "..formatNumber(evilKarmaGained).."\nDurability: " .. formatNumber(currentDurability).."     Gained: "..formatNumber(durabilityGained).."\nAgility: " .. formatNumber(currentAgility).."     Gained: "..formatNumber(agilityGained).."\nMuscle King Time: " .. formatNumber(currentMuscleKingTime).."     Gained: "..formatNumber(muscleKingTimeGained))
end)

local leaderStats = {
"Strength",
"Rebirths",
"Kills",
"Brawls"
}

local intStats = {
"Agility",
"Durability",
"Gems",
"evilKarma",
"goodKarma",
"muscleKingTime"
}


-- Misc Tab
MiscTab:Section({Title = "Miscellaneous"})

MiscTab:Toggle({
    Title = "Auto Rejoin",
    Desc = "Auto rejoin on disconnect",
    Value = false,
    Callback = function(Value)
        _G.AutoRejoin = Value
        while _G.AutoRejoin do
            if game:GetService("CoreGui").RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") then
                game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
            end
            task.wait(1)
        end
    end
})

MiscTab:Button({
    Title = "Rejoin",
    Desc = "Rejoin current server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})

MiscTab:Button("Less Lag", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
            v.Enabled = false
        end
    end
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
            v.Material = Enum.Material.SmoothPlastic
            if v:IsA("Texture") then
                v:Destroy()
            end
        end
    end
    settings().Rendering.QualityLevel = 1
end)

MiscTab:Button("Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

MiscTab:Button("ServerHop", function()
  local PlaceID = game.PlaceId
  local AllIDs = {}
  local foundAnything = ""
  local actualHour = os.date("!*t").hour
  local Deleted = false
  local function TPReturner()
    local Site;
    if foundAnything == "" then
      Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
      Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
      foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i, v in pairs(Site.data) do
      local Possible = true
      ID = tostring(v.id)
      if tonumber(v.maxPlayers) > tonumber(v.playing) then
        for _, Existing in pairs(AllIDs) do
          if num ~= 0 then
            if ID == tostring(Existing) then
              Possible = false
            end
          else
            if tonumber(actualHour) ~= tonumber(Existing) then
              local delFile = pcall(function()
                AllIDs = {}
                table.insert(AllIDs, actualHour)
              end)
            end
          end
          num = num + 1
        end
        if Possible == true then
          table.insert(AllIDs, ID)
          task.wait()
          pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
          end)
          task.wait(4)
        end
      end
    end
  end
  TPReturner()
end)

MiscTab:Button("Join Small Server", function()
  local PlaceID = game.PlaceId
  local function GetSmallServer()
    local AllServers = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    local LowestPlayers = math.huge
    local ServerID
    for _, server in pairs(AllServers.data) do
      if server.playing < LowestPlayers and server.playing > 0 then
        LowestPlayers = server.playing
        ServerID = server.id
      end
    end
    if ServerID then
      game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ServerID, game.Players.LocalPlayer)
    end
  end
  GetSmallServer()
end)

-- Settings Tab
local SettingsTab = Window:Tab({Title = "Settings", Icon = "settings"})
SettingsTab:Section({Title = "Settings"})

SettingsTab:Toggle("Lock Position", false, function(Value)
    if Value then
        local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos
            end
        end)
    else
        if getgenv().posLock then
            getgenv().posLock:Disconnect()
        end
    end
end)

SettingsTab:Toggle("NoClip", false, function(Value)
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    if Value then
        getgenv().noclipConnection = RunService.Stepped:Connect(function()
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    else
        if getgenv().noclipConnection then
            getgenv().noclipConnection:Disconnect()
        end
    end
end)

SettingsTab:Toggle("Infinite Jump", false, function(Value)
    _G.InfiniteJump = Value
    local Player = game:GetService('Players').LocalPlayer
    local UserInputService = game:GetService('UserInputService')
    UserInputService.JumpRequest:Connect(function()
        if _G.InfiniteJump then
            Player.Character:FindFirstChildOfClass('Humanoid'):ChangeState('Jumping')
        end
    end)
end)

SettingsTab:Toggle("Remove Portals", false, function(Value)
  if Value then
    for _, portal in pairs(game:GetDescendants()) do
      if portal.Name == "RobloxForwardPortals" then
        portal:Destroy()
      end
    end
    game.DescendantAdded:Connect(function(descendant)
      if descendant.Name == "RobloxForwardPortals" then
        descendant:Destroy()
      end
    end)
  end
end)

SettingsTab:Toggle("Music", false, function(Value)
  if Value then
    local sound = Instance.new("Sound")
    sound.Name = "BackgroundMusic"
    sound.SoundId = "rbxassetid://5410083226"
    sound.Volume = 1
    sound.Looped = true
    sound.Parent = game.Workspace
    sound:Play()
  else
    if game.Workspace:FindFirstChild("BackgroundMusic") then
      game.Workspace.BackgroundMusic:Destroy()
    end
  end
end)

local Dropdown = SettingsTab:CreateDropdown("TimeControl", {
Title = "Time Changer",
Description = "Change time of day",
Values = {
  "Morning",
  "Day",
  "Night"
},
Multi = false,
Default = "Day",
Callback = function(Value)
  local times = {
    ["Morning"] = 7,
    ["Day"] = 14,
    ["Night"] = 0
  }
  game:GetService("Lighting").ClockTime = times[Value]
end
})
local Input = KillerTab:CreateInput("SpectatePlayer", {
Title = "Spectate Player",
Description = "",
Default = "",
Placeholder = "Player name...",
Numeric = false,
Finished = true,
Callback = function(Value)
  local Players = game:GetService("Players")
  local targetPlayer
  targetPlayer = Players:FindFirstChild(Value)
  if not targetPlayer then
    for _, player in pairs(Players:GetPlayers()) do
      if player.DisplayName:lower() == Value:lower() then
        targetPlayer = player
        break
      end
    end
  end
  if targetPlayer and targetPlayer.Character then
    local camera = workspace.CurrentCamera
    camera.CameraSubject = targetPlayer.Character.Humanoid
    print("Now spectating: " .. targetPlayer.DisplayName .. " (@" .. targetPlayer.Name .. ")")
  else
    print("")
  end
end
})


KillerTab:CreateButton("Stop Spying", function()
  local Players = game:GetService("Players")
  local camera = workspace.CurrentCamera
  camera.CameraSubject = Players.LocalPlayer.Character.Humanoid
  print("")
end)

local function unequipAllPets()
local petsFolder = game:GetService("Players").LocalPlayer.petsFolder
for _, folder in pairs(petsFolder:GetChildren()) do
  if folder:IsA("Folder") then
    for _, pet in pairs(folder:GetChildren()) do
      game:GetService("ReplicatedStorage").rEvents.equipPetEvent:fireServer("unequipPet", pet)
    end
  end
end
end

local function equipUniquePet(petName)
unequipAllPets()
task.wait(0.01)
for _, pet in pairs(game:GetService("Players").LocalPlayer.petsFolder.Unique:GetChildren()) do
  if pet.Name == petName then
    game:GetService("ReplicatedStorage").rEvents.equipPetEvent:fireServer("equipPet", pet)
  end
end
end

local function findMachine(machineName)
local machine = workspace.machinesFolder:FindFirstChild(machineName)
if not machine then
  for _, folder in pairs(workspace:GetChildren()) do
    if folder:IsA("Folder") and folder.Name:find("machines") then
      machine = folder:FindFirstChild(machineName)
      if machine then
        break
      end
    end
  end
end
return machine
end

local function pressE()
local vim = game:GetService("VirtualInputManager")
vim:SendKeyEvent(true, "E", false, game)
task.wait(0.1)
vim:SendKeyEvent(false, "E", false, game)
end

local function useOneEgg()
local protein = game.Players.LocalPlayer.Backpack:FindFirstChild("Protein Egg")
if protein then
  protein.Parent = game.Players.LocalPlayer.Character
  task.wait(0.1)
  local virtualInput = game:GetService("VirtualInputManager")
  virtualInput:SendMouseButtonEvent(0, 0, 0, true, game, 1)
  task.wait(0.5)
  virtualInput:SendMouseButtonEvent(0, 0, 0, false, game, 1)
  return true
end
return false
end

local function checkEggTimer()
local boostFolder = game.Players.LocalPlayer:FindFirstChild("boostTimersFolder")
if not boostFolder then
  return false
end
local eggTimer = boostFolder:FindFirstChild("Protein Egg")
if not eggTimer then
  return useOneEgg()
end
if tonumber(eggTimer.Value) <= 25 then
  return useOneEgg()
end
return true
end

local isRunning = false
local targetRebirth = math.huge
local function unequipAllPets()
local petsFolder = game:GetService("Players").LocalPlayer.petsFolder
for _, folder in pairs(petsFolder:GetChildren()) do
  if folder:IsA("Folder") then
    for _, pet in pairs(folder:GetChildren()) do
      game:GetService("ReplicatedStorage").rEvents.equipPetEvent:fireServer("unequipPet", pet)
    end
  end
end
task.wait(0.1)
end

local function createParticles(part)
local attachment = Instance.new("Attachment", part)
local codeParticle = Instance.new("ParticleEmitter", attachment)
codeParticle.Texture = "rbxassetid://244905904"
codeParticle.Color = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)),
  ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 155, 0))
})
codeParticle.Size = NumberSequence.new({
  NumberSequenceKeypoint.new(0, 0.5),
  NumberSequenceKeypoint.new(1, 0)
})
codeParticle.Lifetime = NumberRange.new(0.5, 1)
codeParticle.Rate = 50
codeParticle.Speed = NumberRange.new(5, 10)
codeParticle.SpreadAngle = Vector2.new(-180, 180)
local lightning = Instance.new("Beam", part)
lightning.Texture = "rbxassetid://446111271"
lightning.TextureSpeed = 3
lightning.Color = ColorSequence.new(Color3.fromRGB(0, 255, 0))
return {
  codeParticle,
  lightning
}
end

local RebirthInput = RebirthTab:Textbox({
Title = "Target Rebirth",
Desc = "Farm will stop at this rebirth count",
Placeholder = "Enter target rebirth...",
Value = "50000",
ClearTextOnFocus = false,
Callback = function(Value)
  targetRebirth = tonumber(Value) or math.huge
end
})

local MainToggle = RebirthTab:Toggle({
  Title = "Fast Rebirths",
  Desc = "Farms rebirths automatically",
  Value = false,
  Callback = function(Value)
      isRunning = Value
      getgenv().lift = Value

      if not Value then return end

      task.spawn(function()
          while isRunning do
              local player = game.Players.LocalPlayer
              local rebirths = player.leaderstats.Rebirths.Value
              local rebirthCost = 10000 + (5000 * rebirths)


              if player.ultimatesFolder:FindFirstChild("Golden Rebirth") then
                  local goldenRebirths = player.ultimatesFolder["Golden Rebirth"].Value
                  rebirthCost = math.floor(rebirthCost * (1 - (goldenRebirths * 0.1)))
              end


              local machine = findMachine("Jungle Bar Lift")
              if machine and machine:FindFirstChild("interactSeat") then
                  local character = player.Character
                  if character and character:FindFirstChild("HumanoidRootPart") then
                      character.HumanoidRootPart.CFrame = machine.interactSeat.CFrame * CFrame.new(0, 3, 0)
                      task.wait(0.3)
                      pressE()
                  end
              end


              while isRunning and player.leaderstats.Strength.Value < rebirthCost do
                  game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                  task.wait(0.03)
              end


              if player.leaderstats.Strength.Value >= rebirthCost then
                  task.wait(0.2)
                  game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
              end

              if not isRunning then break end
              task.wait(0.05)
          end
      end)
  end
})


local isGrinding = false

local GrindToggle = RebirthTab:Toggle({
  Title = "Speed Grind (No Rebirth)",
  Desc = "Grinds strength without rebirthing",
  Value = false,
  Callback = function(Value)
      isGrinding = Value

      if not Value then
          return
      end

      for i = 1, 12 do
          task.spawn(function()
              while isGrinding do
                  game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                  task.wait(0.083)
              end
          end)
      end
  end
})



local currentRadius = 75
local RadiusInput = KillerTab:Textbox({
Title = "Kill Aura Radius",
Desc = "Set the kill aura radius (1-150)",
Placeholder = "Enter radius...",
Value = "75",
ClearTextOnFocus = false,
Callback = function(Value)
  currentRadius = math.clamp(tonumber(Value) or 75, 1, 150)
  Window:Notify({
    Title = "Radius Updated",
    Desc = "Kill aura radius set to: " .. currentRadius,
    Time = 2
  })
end
})

local Toggle = KillerTab:Toggle({
Title = "Matrix Kill Aura",
Desc = "Kills nearby players",
Value = false,
Callback = function(v)
  getgenv().killNearby = v
  local radiusVisual = Instance.new("Part")
  radiusVisual.Anchored = true
  radiusVisual.CanCollide = false
  radiusVisual.Transparency = 0.8
  radiusVisual.Material = Enum.Material.ForceField
  radiusVisual.Color = Color3.fromRGB(0, 255, 0)
  radiusVisual.Size = Vector3.new(1, 0.1, 1)
  task.spawn(function()
    while getgenv().killNearby do
      pcall(function()
        local myCharacter = game.Players.LocalPlayer.Character
        local myRoot = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
        if myRoot then
          radiusVisual.Parent = workspace
          radiusVisual.Size = Vector3.new(currentRadius * 2, 0.1, currentRadius * 2)
          radiusVisual.CFrame = myRoot.CFrame * CFrame.new(0, -2, 0)
          local effects = createParticles(myRoot)
          for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player ~= game.Players.LocalPlayer and not whitelist[player.Name] then
              local char = player.Character
              local root = char and char:FindFirstChild("HumanoidRootPart")
              if root and myRoot and myCharacter:FindFirstChild("LeftHand") then
                local distance = (root.Position - myRoot.Position).Magnitude
                if distance <= currentRadius then
                  local killEffect = Instance.new("Part")
                  killEffect.Anchored = true
                  killEffect.CanCollide = false
                  killEffect.Transparency = 0.5
                  killEffect.Material = Enum.Material.Neon
                  killEffect.Color = Color3.fromRGB(0, 255, 0)
                  killEffect.CFrame = root.CFrame
                  killEffect.Size = Vector3.new(5, 5, 5)
                  killEffect.Parent = workspace
                  game:GetService("TweenService"):Create(killEffect, TweenInfo.new(0.5), {
                    Size = Vector3.new(0, 0, 0),
                    Transparency = 1
                  }):Play()
                  game:GetService("Debris"):AddItem(killEffect, 0.5)
                  firetouchinterest(root, myCharacter.LeftHand, 0)
                  task.wait()
                  firetouchinterest(root, myCharacter.LeftHand, 1)
                  gettool()
                end
              end
            end
          end
          task.wait(0.1)
          for _, effect in ipairs(effects) do
            effect:Destroy()
          end
        end
      end)
      task.wait(0.1)
    end
    radiusVisual:Destroy()
  end)
end
})

local targetInput = KillerTab:Textbox({
Title = "Target Player",
Desc = "Enter Username or Display Name",
Placeholder = "Enter name here...",
Value = "",
ClearTextOnFocus = false,
Callback = function(Value)
  targetPlayer = Value
end
})

local TeleportAnimateButton = KillerTab:Toggle({
Title = "Start Banging",
Desc = "LMAO, Start it now",
Value = false,
Callback = function(Value)
  getgenv().doAnimation = Value
  if targetPlayer then
    local character = game.Players.LocalPlayer.Character
    local humanoid = character:WaitForChild("Humanoid")
    local target = game.Players[targetPlayer].Character
    local handsUp = Instance.new('Animation')
    handsUp.AnimationId = 'rbxassetid://148840371'
    local anim = humanoid:LoadAnimation(handsUp)
    spawn(function()
      while getgenv().doAnimation do
        if target and target:FindFirstChild("HumanoidRootPart") then
          character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
        end
        task.wait()
      end
    end)
    anim:Play()
    anim:AdjustSpeed(0.3)
    while getgenv().doAnimation do
      character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
      wait(0.2)
      character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -1)
      wait(0.2)
    end
    if not getgenv().doAnimation then
      anim:Stop()
    end
  end
end
})

local function unequipAllPets()
local petsFolder = game:GetService("Players").LocalPlayer.petsFolder
for _, folder in pairs(petsFolder:GetChildren()) do
  if folder:IsA("Folder") then
    for _, pet in pairs(folder:GetChildren()) do
      game:GetService("ReplicatedStorage").rEvents.equipPetEvent:fireServer("unequipPet", pet)
    end
  end
end
task.wait(0.1)
end

local petTypes = {
["Swift Samurai"] = "Equip All Swift Samurai",
["Tribal Overlord"] = "Equip All Tribal Overlord",
["Mighty Monster"] = "Equip All Mighty Monster",
["Wild Wizard"] = "Equip All Wild Wizard"
}

for petName, buttonTitle in pairs(petTypes) do
CrystalsTab:Button({
  Title = buttonTitle,
  Desc = "Equips all " .. petName .. " pets",
  Callback = function()
    unequipAllPets()
    for _, pet in pairs(game:GetService("Players").LocalPlayer.petsFolder.Unique:GetChildren()) do
      if pet.Name == petName then
        game:GetService("ReplicatedStorage").rEvents.equipPetEvent:fireServer("equipPet", pet)
      end
    end
  end
})
end

local eggToggle = MainTab:Toggle({
Title = "Auto Use Protein Egg",
Desc = "Automatically uses egg at 25 seconds remaining",
Value = false,
Callback = function(Value)
  _G.AutoEgg = Value
  while _G.AutoEgg do
    local boostFolder = game.Players.LocalPlayer:FindFirstChild("boostTimersFolder")
    if not boostFolder then
      useOneEgg()
      task.wait(1)
      continue
    end
    local eggTimer = boostFolder:FindFirstChild("Protein Egg")
    if not eggTimer then
      useOneEgg()
      task.wait(1)
      continue
    end
    if tonumber(eggTimer.Value) <= 25 then
      useOneEgg()
    end
    task.wait(1)
  end
end
})

local AutoStuffTab = Window:Tab({Title = "Auto Stuff", Icon = "sliders"})
AutoStuffTab:Section({Title = "Auto Brawl"})

local Toggle = AutoStuffTab:Toggle({
Title = "Auto Join Brawl",
Desc = "Automatically joins brawl when available",
Value = false,
Callback = function(v)
  getgenv().joinbrawl = v
  while getgenv().joinbrawl do
    task.wait()
    game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
  end
end
})

-- Anti Functions
MiscTab:Section({Title = "Anti Functions"})

local antiRebirthButton = MiscTab:Button({
Title = "Anti Rebirth",
Desc = "Prevents forced rebirths",
Callback = function()
  local OldNameCall = nil
  OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {
      ...
    }
    if self.Name == "rebirthRemote" and Args[1] == "rebirthRequest" then
      return
    end
    return OldNameCall(self, unpack(Args))
  end)
end
})

local antiTradeButton = MiscTab:Button({
Title = "Anti Accept Trade",
Desc = "Prevents accepting trades",
Callback = function()
  local OldNameCall = nil
  OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {
      ...
    }
    if self.Name == "tradingEvent" and Args[1] == "acceptTrade" then
      return
    end
    return OldNameCall(self, unpack(Args))
  end)
end
})

-- Auto Buy Tab
local AutoBuyTab = Window:Tab({Title = "Auto Buy", Icon = "shopping-cart"})
AutoBuyTab:Section({Title = "Auto Buy"})

local function createUltimateUpgrade(name, title, description)
return AutoBuyTab:Toggle({
  Title = title,
  Desc = description,
  Value = false,
  Callback = function(v)
    if v then
      Window:Dialog{
        Title = "Confirm " .. title,
        Content = "Are you sure you want to activate " .. description .. "?",
        Buttons = {
          {
            Title = "Confirm",
            Callback = function()
              game:GetService("ReplicatedStorage").rEvents.ultimatesRemote:InvokeServer("upgradeUltimate", name)
            end
          },
          {
            Title = "Cancel",
            Callback = function()
              AutoBuyTab:SetValue(name, false)
            end
          }
        }
      }
    end
  end
})
end

local ultimateUpgrades = {
{
  name = "RepSpeed",
  title = "+5% Rep Speed",
  description = "+5% Rep Speed"
},
{
  name = "PetSlot",
  title = "+1 Pet Slot",
  description = "+1 Pet Slot"
},
{
  name = "ItemCapacity",
  title = "+10 Item Capacity",
  description = "+10 Item Capacity"
},
{
  name = "DailySpin",
  title = "+1 Daily Spin",
  description = "+1 Daily Spin"
},
{
  name = "ChestRewards",
  title = "x2 Chest Rewards",
  description = "x2 Chest Rewards"
},
{
  name = "QuestRewards",
  title = "x2 Quest Rewards",
  description = "x2 Quest Rewards"
},
{
  name = "MuscleMind",
  title = "Muscle Mind",
  description = "Muscle Mind"
},
{
  name = "JungleSwift",
  title = "Jungle Swift",
  description = "Jungle Swift"
},
{
  name = "InfernalHealth",
  title = "Infernal Health",
  description = "Infernal Health"
},
{
  name = "GalaxyGains",
  title = "+galaxy Gains",
  description = "Galaxy Gains"
},
{
  name = "DemonDamage",
  title = "Demon Damage",
  description = "Demon Damage"
},
{
  name = "GoldenRebirth",
  title = "Golden Rebirth",
  description = "Golden Rebirth"
}
}

for _, upgrade in ipairs(ultimateUpgrades) do
createUltimateUpgrade(upgrade.name, upgrade.title, upgrade.description)
end

local autoWheelToggle = AutoBuyTab:Toggle({
Title = "Auto Spin Wheel",
Desc = "Automatically spins the fortune wheel",
Value = false,
Callback = function(v)
  while v do
    game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"])
    task.wait(1)
  end
end
})

local autoGiftsToggle = AutoBuyTab:Toggle({
Title = "Auto Claim Gifts",
Desc = "Automatically claims free gifts",
Value = false,
Callback = function(v)
  while v do
    for i = 1, 8 do
      game:GetService("ReplicatedStorage").rEvents.freeGiftClaimRemote:InvokeServer("claimGift", i)
    end
    task.wait(1)
  end
end
})

local function pressE()
local vim = game:GetService("VirtualInputManager")
vim:SendKeyEvent(true, "E", false, game)
task.wait(0.1)
vim:SendKeyEvent(false, "E", false, game)
end

local function autoLift()
while getgenv().working and task.wait() do
  game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
end
end

local function teleportAndStart(machineName, position)
if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = position
  task.wait(0.5)
  pressE()
  autoLift()
end
end

local locations = {
["Starter Island"] = true,
["Legend Beach"] = true,
["Frost Gym"] = true,
["Mythical Gym"] = true,
["Eternal Gym"] = true,
["Legend Gym"] = true,
["Muscle King Gym"] = true,
["Jungle Gym"] = true
}

local locationsList = {
"Starter Island",
"Legend Beach",
"Frost Gym",
"Mythical Gym",
"Eternal Gym",
"Legend Gym",
"Muscle King Gym",
"Jungle Gym"
}

local workoutPositions = {
["Bench Press"] = {
  ["Starter Island"] = CFrame.new(- 17.0609932, 3.31417918, - 2.48164988),
  ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, - 321.053925),
  ["Frost Gym"] = CFrame.new(- 3013.24194, 39.2158546, - 335.036926),
  ["Mythical Gym"] = CFrame.new(2371.7356, 39.2158546, 1246.31555),
  ["Eternal Gym"] = CFrame.new(- 7176.19141, 45.394104, - 1106.31421),
  ["Legend Gym"] = CFrame.new(4111.91748, 1020.46674, - 3799.97217),
  ["Muscle King Gym"] = CFrame.new(- 8590.06152, 46.0167427, - 6043.34717),
  ["Jungle Gym"] = CFrame.new(-8173, 64, 1898)
},
["Squat"] = {
  ["Starter Island"] = CFrame.new(- 48.8711243, 3.31417918, - 11.8831778),
  ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, - 321.053925),
  ["Frost Gym"] = CFrame.new(- 2933.47998, 29.6399612, - 579.946045),
  ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
  ["Eternal Gym"] = CFrame.new(- 7176.19141, 45.394104, - 1106.31421),
  ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, - 4124.2334),
  ["Muscle King Gym"] = CFrame.new(- 8940.12402, 13.1642084, - 5699.13477),
  ["Jungle Gym"] = CFrame.new(-8352, 34, 2878)
},
["Deadlift"] = {
  ["Starter Island"] = CFrame.new(- 48.8711243, 3.31417918, - 11.8831778),
  ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, - 321.053925),
  ["Frost Gym"] = CFrame.new(- 2933.47998, 29.6399612, - 579.946045),
  ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
  ["Eternal Gym"] = CFrame.new(- 7176.19141, 45.394104, - 1106.31421),
  ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, - 4124.2334),
  ["Muscle King Gym"] = CFrame.new(- 8940.12402, 13.1642084, - 5699.13477)
},
["Pull Up"] = {
  ["Starter Island"] = CFrame.new(- 33.3047485, 3.31417918, - 11.8831778),
  ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, - 321.053925),
  ["Frost Gym"] = CFrame.new(- 2933.47998, 29.6399612, - 579.946045),
  ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
  ["Eternal Gym"] = CFrame.new(- 7176.19141, 45.394104, - 1106.31421),
  ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, - 4124.2334),
  ["Muscle King Gym"] = CFrame.new(- 8940.12402, 13.1642084, - 5699.13477),
  ["Jungle Gym"] = CFrame.new(-8666, 34, 2070)
},
["Boulder"] = {
  ["Starter Island"] = CFrame.new(- 33.3047485, 3.31417918, - 11.8831778),
  ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, - 321.053925),
  ["Frost Gym"] = CFrame.new(- 2933.47998, 29.6399612, - 579.946045),
  ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
  ["Eternal Gym"] = CFrame.new(- 7176.19141, 45.394104, - 1106.31421),
  ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, - 4124.2334),
  ["Muscle King Gym"] = CFrame.new(- 8940.12402, 13.1642084, - 5699.13477),
  ["Jungle Gym"] = CFrame.new(-8621, 34, 2684)
}
}

local workoutTypes = {
"Bench Press",
"Squat",
"Deadlift",
"Pull Up",
"Boulder"
}
for _, workoutType in ipairs(workoutTypes) do
local dropdown = AutoStuffTab:Dropdown({
  Title = "Select " .. workoutType,
  Desc = "Choose Your Training Location",
  List = locationsList,
  Value = "Starter Island",
  Callback = function(Value)
    _G["select" .. string.lower(string.gsub(workoutType, " ", ""))] = Value
  end
})
local toggle = AutoStuffTab:Toggle({
  Title = "Farm " .. workoutType,
  Desc = "Auto Trains " .. workoutType,
  Value = false,
  Callback = function(Value)
    getgenv().working = Value
    if Value then
      local selected = _G["select" .. string.lower(string.gsub(workoutType, " ", ""))]
      if workoutPositions[workoutType][selected] then
        teleportAndStart(workoutType, workoutPositions[workoutType][selected])
      end
    end
  end
})
end

local treadmillDropdown = AutoStuffTab:Dropdown({
Title = "Select TreadMill",
Desc = "Choose Your Treadmill Location",
List = {
  "Tiny Island",
  "Starter Island",
  "Legend Beach",
  "Frost Gym",
  "Mythical Gym",
  "Eternal Gym",
  "Legend Gym",
  "Jungle Gym"
},
Value = "Tiny Island",
Callback = function(Value)
  selecttreadmill = Value
end
})


local treadmillPositions = {
["Tiny Island"] = {
  pos = CFrame.new(- 31.8626194, 6.0588026, 2087.88672, - 0.999396682, - 9.72631931e-09, 0.034730725, - 6.63278898e-09, 1, 8.91870684e-08, - 0.034730725, 8.8902901e-08, - 0.999396682),
  req = 0
},
["Starter Island"] = {
  pos = CFrame.new(226.252472, 8.1526947, 219.366516, - 0.00880406145, 3.58277887e-08, - 0.999961257, - 4.41204939e-08, 1, 3.62176351e-08, 0.999961257, 4.44376482e-08, - 0.00880406145),
  req = 600
},
["Legend Beach"] = {
  pos = CFrame.new(- 365.798309, 44.5082932, - 501.618591, 0.00878552441, - 6.19950713e-09, 0.999961436, - 4.37451603e-10, 1, 6.20358964e-09, - 0.999961436, - 4.91936492e-10, 0.00878552441),
  req = 3000
},
["Frost Gym"] = {
  pos = CFrame.new(- 2933.47998, 29.6399612, - 579.946045, 0.0345239155, - 1.03010173e-07, 0.999403894, 1.03015294e-08, 1, 1.02715752e-07, - 0.999403894, 6.74923806e-09, 0.0345239155),
  req = 3000
},
["Mythical Gym"] = {
  pos = CFrame.new(2659.50635, 21.6095238, 934.690613, 0.999999881, 4.98906161e-08, 0.000502891606, - 4.98585742e-08, 1, - 6.37288338e-08, - 0.000502891606, 6.37037516e-08, 0.999999881),
  req = 3000
},
["Eternal Gym"] = {
  pos = CFrame.new(- 7176.19141, 45.394104, - 1106.31421, 0.971191287, - 2.38377185e-09, 0.238301158, 1.41694778e-09, 1, 4.22844915e-09, - 0.238301158, - 3.76897269e-09, 0.971191287),
  req = 3500
},
["Legend Gym"] = {
  pos = CFrame.new(4446.91699, 1004.46698, - 3983.76074, - 0.999961317, - 1.97616366e-08, 0.00879266672, - 1.93830077e-08, 1, 4.31365149e-08, - 0.00879266672, 4.29661292e-08, - 0.999961317),
  req = 0
},
["Jungle Gym"] = {
  pos = CFrame.new(-8137, 28, 2820),
  req = 0
}
}

local treadmillToggle = AutoStuffTab:Toggle({
Title = "Farm TreadMill",
Desc = "Automatically farms agility on the treadmill",
Value = false,
Callback = function(Value)
  getgenv().tread = Value
  game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().tread and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
      local treadInfo = treadmillPositions[selecttreadmill]
      if treadInfo and game:GetService("Players").LocalPlayer.Agility.Value > treadInfo.req then
        game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 100))
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = treadInfo.pos
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      end
    end
  end)
end
})

-- Final Notification
Window:Notify({
    Title = "zzz Hub",
    Desc = "Private Script of SLH loaded successfully with DummyUI!",
    Time = 4
})

print("✅ Private Script of zzz loaded successfully with DummyUI!")
