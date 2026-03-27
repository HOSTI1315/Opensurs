
local Library = loadstring(game:HttpGet("https://you.whimper.xyz/sources/btteam/SystemUI.lua"))() -- LIBRARY

local Window = Library:CreateWindow('BT Project') -- CREATE WINDOW

local Tab = { -- CREATE TABS
    Tab_1 = Window:addTab('#Home'),
    Tab_Event = Window:addTab('#Events'),
    Tab_2 = Window:addTab('#Farms'),
    Tab_3 = Window:addTab('#Pets'),
    Tab_4 = Window:addTab('#Arms'),
    Tab_5 = Window:addTab('#Machines'),
    Tab_6 = Window:addTab('#Misc'),
    
}


local Home_Left = Tab.Tab_1:addSection() -- HOME LEFT SECTION
local Changelog = Home_Left:addMenu("#Changelog")
Changelog:addChangelog('[December, 08 2024]')
Changelog:addChangelog('- Added Christmas Event')
Changelog:addChangelog('- Added New Farm Table')
Changelog:addChangelog('')
Changelog:addChangelog('[December, 06 2024]')
Changelog:addChangelog('- Added Event (Classic and Halloween)')
Changelog:addChangelog('- Added New World (World 10 - 16)')
Changelog:addChangelog('- Update Tools Farm')
Changelog:addChangelog('- Update Eggs')
Changelog:addChangelog('')
Changelog:addChangelog('[March, 31 2024]')
Changelog:addChangelog('- New Eggs Hatch List')
Changelog:addChangelog('- New Dumbells Tools')
Changelog:addChangelog('- New NPC List')
Changelog:addChangelog('')
Changelog:addChangelog('[March, 26 2024]')
Changelog:addChangelog('- Added Hunt and Easter Event')
Changelog:addChangelog('- Added New Map (Roman Empire and Magma World)')
Changelog:addChangelog('- Added Farm Easter Coin + TP')
Changelog:addChangelog('- Added Auto Fight Easter Boss')
Changelog:addChangelog('- Added New Eggs')
Changelog:addChangelog('- Added New NPC List')
Changelog:addChangelog('- Added New Train List')
Changelog:addChangelog('- And More.')
Changelog:addChangelog('')
Changelog:addChangelog('[Janury, 20 2024]')
Changelog:addChangelog('- Hide Notification for Auto Tools Farm')
Changelog:addChangelog('- Fixed Auto Fight BOSS')
Changelog:addChangelog('- Delete Feature Events')
Changelog:addChangelog('')
Changelog:addChangelog('[Janury, 7 2024]')
Changelog:addChangelog('- Fixed Lock/Unlock Arms and Pets')
Changelog:addChangelog('- Fixed Deletes Arms and Pets')
Changelog:addChangelog('- Fixed Craft Arms and Pets')
Changelog:addChangelog('- Fixed some minor bug.')
Changelog:addChangelog('')
Changelog:addChangelog('[December, 17 2023 - CHRISTMAS UPDATE PART 2]')
Changelog:addChangelog('- Auto Farm Gingerbread')
Changelog:addChangelog('- Auto Hatch Gingerbread Eggs')
Changelog:addChangelog('')
Changelog:addChangelog('[December, 12 2023 - CHRISTMAS UPDATE]')
Changelog:addChangelog('- Auto Farm Snow and Candy')
Changelog:addChangelog('- Auto Fight Santa Boss')
Changelog:addChangelog('- Auto Claim Christmas Egg')
Changelog:addChangelog('')
Changelog:addChangelog('[November, 12 2023 - WORLD 7 UPDATE]')
Changelog:addChangelog('- New World 7 Space Center')
Changelog:addChangelog('- New PunchBags List')
Changelog:addChangelog('- New Dumbells List')
Changelog:addChangelog('- New Barbells List')
Changelog:addChangelog('- New NPC List')
Changelog:addChangelog('- Fixed issued with New Remote')
Changelog:addChangelog('')
Changelog:addChangelog('[October, 20 2023 - HALLOWEEN UPDATE #3]')
Changelog:addChangelog('- Auto Trck or Treat!')
Changelog:addChangelog('- Auto Grind Candy Only')
Changelog:addChangelog('- Auto Grind Candy + Teleport')
Changelog:addChangelog('- Auto Make Couldron Pets')
Changelog:addChangelog('- Auto Claim Coudron Pets')
Changelog:addChangelog('- Auto Use Snack')
Changelog:addChangelog('- New Eggs Halloween')
Changelog:addChangelog('- New Code Redeem')

local Home_Right = Tab.Tab_1:addSection() -- HOME RIGHT SECTION
local Main_Home = Home_Right:addMenu("#Home")

getgenv().WalkSpeedValue = 26
Main_Home:addTextbox("Speed Hack", getgenv().WalkSpeedValue, function(speedfunc)
    getgenv().WalkSpeedValue = speedfunc
    if getgenv().WalkSpeedValue then
        local Player = game:service'Players'.LocalPlayer
        Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
            Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
        end)
        Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end
end)

getgenv().JumpValue = 50
Main_Home:addTextbox("Jump Hack", getgenv().JumpValue, function(jumpfunc)
    getgenv().JumpValue = jumpfunc
    if getgenv().JumpValue then
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = getgenv().JumpValue
    end
end)

Main_Home:addToggle("Infinite Jump", InfiniteJumpEnabled, function(Value)
    InfiniteJumpEnabled = Value
    if InfiniteJumpEnabled then
        game:GetService("UserInputService").JumpRequest:connect(function()
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end)
    end
end)

Main_Home:addToggle('No Clip', getgenv().NoClip, function(clipf)
    getgenv().NoClip = clipf
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().NoClip then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

getgenv().AntiAFK = true
Main_Home:addToggle("Anti AFK", getgenv().AntiAFK, function(Value)
    getgenv().AntiAFK = Value
end)

task.spawn(function ()
    while wait(.1) do
        if getgenv().AntiAFK then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end
    end
end)

Main_Home:addButton("FPS Boost", function()
    local decalsyeeted = false
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

Main_Home:addButton("Rejoin Server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

Main_Home:addButton("Server Hop", function()
    Hop()
end)
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
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
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait(.1)
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(.1)
                end
            end
        end
    end
    function Teleport() 
        while wait(.1) do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

Main_Home:addButton("Teleport To Lower Server", function()
    local maxplayers, gamelink, goodserver, data_table = math.huge, "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    if not _G.FailedServerID then _G.FailedServerID = {} end

    local function serversearch()
        data_table = game:GetService"HttpService":JSONDecode(game:HttpGetAsync(gamelink))
        for _, v in pairs(data_table.data) do
            pcall(function()
                if type(v) == "table" and v.id and v.playing and tonumber(maxplayers) > tonumber(v.playing) and not table.find(_G.FailedServerID, v.id) then
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end)
        end
    end

    function getservers()
        pcall(serversearch)
        for i, v in pairs(data_table) do
            if i == "nextPageCursor" then
                if gamelink:find"&cursor=" then
                    local a = gamelink:find"&cursor="
                    local b = gamelink:sub(a)
                    gamelink = gamelink:gsub(b, "")
                end
                gamelink = gamelink .. "&cursor=" .. v
                pcall(getservers)
            end
        end
    end

    pcall(getservers)
    wait(.1)
    if goodserver == game.JobId or maxplayers == #game:GetService"Players":GetChildren() - 1 then
    end
    table.insert(_G.FailedServerID, goodserver)
    game:GetService"TeleportService":TeleportToPlaceInstance(game.PlaceId, goodserver)

    while wait(.1) do
        pcall(function()
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            game.CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function()
                local GUI = game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")
                if GUI then
                    if GUI.TitleFrame.ErrorTitle.Text == "Disconnected" then
                        if #game.Players:GetPlayers() <= 1 then
                            game.Players.LocalPlayer:Kick("\nRejoining...")
                            wait(.1)
                            game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                        else
                            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                        end
                    end
                end
            end)
        end)
    end
end)

Main_Home:addButton("Destroy GUI", function()
    Library:DestroyGui()
end)

function TPArea(Tarpos)
    if (Tarpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Tarpos
    end
end

----------------------------------------------------//----------------------------------------------------
--// INIT Remote
local LocalPlayer = game:GetService('Players').LocalPlayer
local PlayerStat = LocalPlayer.leaderstats

-- FireServer
local onGuiEquipRequest = game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onGuiEquipRequest
local onEquipRequest = game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onEquipRequest
local onUnequipRequest = game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onUnequipRequest
local onClick = game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onClick
local onEnterNPCTable = game:GetService("ReplicatedStorage").Packages.Knit.Services.ArmWrestleService.RE.onEnterNPCTable
local onClickRequest = game:GetService("ReplicatedStorage").Packages.Knit.Services.ArmWrestleService.RE.onClickRequest
local clickMusicalTile = game:GetService("ReplicatedStorage").Packages.Knit.Services.ArmWrestleService.RE.clickMusicalTile
local onGiveStats = game:GetService("ReplicatedStorage").Packages.Knit.Services.PunchBagService.RE.onGiveStats
local teleport = game:GetService("ReplicatedStorage").Packages.Knit.Services.ZoneService.RE.teleport

-- InvokeServer
local getTradeablePlayers = game:GetService("ReplicatedStorage").Packages.Knit.Services.TradingService.RF.getTradeablePlayers
local ReEquip = game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RF.ReEquip
local playerEquip = game:GetService("ReplicatedStorage").Packages.Knit.Services.PetService.RF.playerEquip
local purchaseEgg = game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.purchaseEgg
local getOwned = game:GetService("ReplicatedStorage").Packages.Knit.Services.PetService.RF.getOwned
local SetAutoDelete = game:GetService("ReplicatedStorage").Packages.Knit.Services.PetService.RF.SetAutoDelete
local ShowTeleport = game:GetService("ReplicatedStorage").Packages.Knit.Services.TeleportService.RF.ShowTeleport
local FightNpc = game:GetService("ReplicatedStorage").Packages.Knit.Services.WrestleRNGService.RF.FightNpc
local OnClickInvoke = game:GetService("ReplicatedStorage").Packages.Knit.Services.WrestleService.RF.OnClick

----------------------------------------------------//----------------------------------------------------
--// EVENT LEFT
local Event_Left = Tab.Tab_Event:addSection()

local Teleport_Event = Event_Left:addMenu('#Teleport Event')

local EventList = {"Christmas Event";}

Teleport_Event:addDropdown('Select Event', SelectedEvent, EventList, function (Value)
    SelectedEvent = Value
    UpdateEventNPCList()
end)

Teleport_Event:addButton('Teleport to Event', function()
    if SelectedEvent == "Christmas Event" then
        local args = {
            [1] = game:GetService("Workspace").Zones["ChristmasEvent"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    end
end)

----------------------------------------------------//----------------------------------------------------
local Main_Event = Event_Left:addMenu('#Main Event')

local function DumbellsEvent()
    if SelectedEvent == "Christmas Event" then
        local abbreviations = {
            k = 10^3,
            m = 10^6,
            b = 10^9
        }
        local str = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Currencies.ChristmasCurrency.ClassicStrength.Amount.Text
        local num
        for i,v in pairs(abbreviations) do
            if str:sub(#str,#str) == i then
                local n,t = str:gsub(i,"")
                num = tonumber(n)*v
                break
            end
        end
        
        if num == nil or num <= 1000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas1")
        elseif num == nil or num <= 1000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas2")
        elseif num == 1000 or num <= 7500 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas3")
        elseif num == 7500 or num <= 25000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas4")
        elseif num == 25000 or num <= 50000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas5")
        elseif num == 50000 or num <= 100000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas6")
        elseif num == 100000 or num <= 750000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas7")
        elseif num == 750000 or num <= 2500000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas8")
        elseif num == 2500000 or num <= 10000000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas9")
        elseif num == 10000000 or num <= 25000000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas10")
        elseif num == 25000000 or num <= 100000000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas11")
        elseif num >= 100000000 then
            onGuiEquipRequest:FireServer("ChristmasEvent", "Dumbells", "Christmas12")
        
        end
    end
end

local function BarbellsEvent()
    if SelectedEvent == "Christmas Event" then
        local abbreviations = {
            k = 10^3,
            m = 10^6,
            b = 10^9
        }
        local str = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Currencies.ChristmasCurrency.ClassicStrength.Amount.Text
        local num
        for i,v in pairs(abbreviations) do
            if str:sub(#str,#str) == i then
                local n,t = str:gsub(i,"")
                num = tonumber(n)*v
                break
            end
        end
        if num == 125000 or num <= 5000000 then
            onEquipRequest:FireServer("ChristmasEvent", "Barbells", "Christmas1")
        elseif num == 5000000 or num <= 120000000 then
            onEquipRequest:FireServer("ChristmasEvent", "Barbells", "Christmas2")
        elseif num >= 120000000 then
            onEquipRequest:FireServer("ChristmasEvent", "Barbells", "Christmas3")
        end
    end
end

Main_Event:addToggle('Auto Farm Dumbells', ThisAutoOnClickDumbells, function (Value)
    ThisAutoOnClickDumbells = Value

    while ThisAutoOnClickDumbells do wait()
        if SelectedEvent == "Christmas Event" then
            pcall(function()
                DumbellsEvent()
                onClick:FireServer()
            end)
        end
    end
end)

Main_Event:addToggle('Auto Farm Barbells', ThisAutoOnClickBarbells, function (Value)
    ThisAutoOnClickBarbells = Value

    while ThisAutoOnClickBarbells do wait()
        if SelectedEvent == "Christmas Event" then
            pcall(function()
                BarbellsEvent()
                onClick:FireServer()
            end)
        end
    end
end)
----------------------------------------------------//----------------------------------------------------
--// NPC
local Event_NPC = Event_Left:addMenu('#NPC Event')

local NPCEventList = {}
local NPCEventRefresh = Event_NPC:addDropdown('Select NPC', NPCEventSelected, NPCEventList, function (Value)
    NPCEventSelected = Value
end)

function UpdateEventNPCList()
    if SelectedEvent == "Christmas Event" then
        NPCEventList = {"TownDefender"; "EvilGingerbread"; "EvilCracker"; "Lumberjack"; "LocomotiveDriver"; "LakeMonster";}
        NPCEventRefresh:Clear()
        NPCEventRefresh:Refresh(NPCEventList)
    end
end

Event_NPC:addToggle('Enabled NPC Farm', AutoFarmBattleEvent, function (Value)
    AutoFarmBattleEvent = Value

    while AutoFarmBattleEvent do wait()
        if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Wrestle.Visible == false then
            local args = {
                [1] = NPCEventSelected,
                [2] = game:GetService("Workspace").GameObjects.ArmWrestling:FindFirstChild("ChristmasEvent").NPC:FindFirstChild(NPCEventSelected).Table,
                [3] = "ChristmasEvent",
            }
            onEnterNPCTable:FireServer(unpack(args))
        else
            onClickRequest:FireServer()
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Right Event
local Event_Right = Tab.Tab_Event:addSection()

local Table_FarmEVENT = Event_Right:addMenu('#Table Farm')

function TPAreaEvent(Tarpos)
    if (Tarpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Tarpos
    end
end

--// Player Body Velocity
spawn(function()
    while wait() do
        pcall(function()
            if AutoFarmTable1 or AutoFarmTable3 or AutoFarmTable2 or AutoFarmTable4 or AutoFarmTable5 or AutoFarmTable6 then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end)
    end
end)

--// Farming Clip Tween
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if AutoFarmTable1 or AutoFarmTable3 or AutoFarmTable2 or AutoFarmTable4 or AutoFarmTable5 or AutoFarmTable6 then
                for _,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

Table_FarmEVENT:addToggle('Auto Farm Table (Common)', AutoFarmTable1, function(Value)
    AutoFarmTable1 = Value
end)
spawn(function()
    while task.wait() do
        if AutoFarmTable1 then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").GameObjects.RngNPCs["Christmas-ClumsyInvader"].Npc:GetChildren()) do
                    if v.Name == "Clumsy Invader" then
                        if v:FindFirstChild("Npc"):FindFirstChild("HumanoidRootPart") then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                TPAreaEvent(v.Npc.HumanoidRootPart.CFrame)
                                if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Wrestle.Visible == false then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                                    wait(1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)
                                else
                                    game:GetService("ReplicatedStorage").Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
                                end
                            until not AutoFarmTable1 or not game:GetService("Workspace").GameObjects.RngNPCs["Christmas-ClumsyInvader"].Npc:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        end
    end
end)

Table_FarmEVENT:addToggle('Auto Farm Table (Uncommon)', AutoFarmTable3, function(Value)
    AutoFarmTable3 = Value
end)
spawn(function()
    while task.wait() do
        if AutoFarmTable3 then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").GameObjects.RngNPCs["Christmas-EvilSnowman"].Npc:GetChildren()) do
                    if v.Name == "Evil Snowman" then
                        if v:FindFirstChild("Npc"):FindFirstChild("HumanoidRootPart") then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                TPAreaEvent(v.Npc.HumanoidRootPart.CFrame)
                                if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Wrestle.Visible == false then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                                    wait(1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)
                                else
                                    game:GetService("ReplicatedStorage").Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
                                end
                            until not AutoFarmTable3 or not game:GetService("Workspace").GameObjects.RngNPCs["Christmas-EvilSnowman"].Npc:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        end
    end
end)

Table_FarmEVENT:addToggle('Auto Farm Table (Rare)', AutoFarmTable2, function(Value)
    AutoFarmTable2 = Value
end)
spawn(function()
    while task.wait() do
        if AutoFarmTable2 then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").GameObjects.RngNPCs["Christmas-CursedWinter"].Npc:GetChildren()) do
                    if v.Name == "Cursed Winter" then
                        if v:FindFirstChild("Npc"):FindFirstChild("HumanoidRootPart") then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                TPAreaEvent(v.Npc.HumanoidRootPart.CFrame)
                                if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Wrestle.Visible == false then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                                    wait(1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)
                                else
                                    game:GetService("ReplicatedStorage").Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
                                end
                            until not AutoFarmTable2 or not game:GetService("Workspace").GameObjects.RngNPCs["Christmas-CursedWinter"].Npc:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        end
    end
end)

Table_FarmEVENT:addToggle('Auto Farm Table (Epic)', AutoFarmTable4, function(Value)
    AutoFarmTable4 = Value
end)
spawn(function()
    while task.wait() do
        if AutoFarmTable4 then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").GameObjects.RngNPCs["Christmas-CursedSanta"].Npc:GetChildren()) do
                    if v.Name == "Cursed Santa" then
                        if v:FindFirstChild("Npc"):FindFirstChild("HumanoidRootPart") then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                TPAreaEvent(v.Npc.HumanoidRootPart.CFrame)
                                if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Wrestle.Visible == false then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                                    wait(1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)
                                else
                                    game:GetService("ReplicatedStorage").Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
                                end
                            until not AutoFarmTable4 or not game:GetService("Workspace").GameObjects.RngNPCs["Christmas-CursedSanta"].Npc:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        end
    end
end)

Table_FarmEVENT:addToggle('Auto Farm Table (Legendary)', AutoFarmTable5, function(Value)
    AutoFarmTable5 = Value
end)
spawn(function()
    while task.wait() do
        if AutoFarmTable5 then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").GameObjects.RngNPCs["Christmas-IceYeti"].Npc:GetChildren()) do
                    if v.Name == "Ice Yeti" then
                        if v:FindFirstChild("Npc"):FindFirstChild("HumanoidRootPart") then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                TPAreaEvent(v.Npc.HumanoidRootPart.CFrame)
                                if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Wrestle.Visible == false then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                                    wait(1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)
                                else
                                    game:GetService("ReplicatedStorage").Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
                                end
                            until not AutoFarmTable5 or not game:GetService("Workspace").GameObjects.RngNPCs["Christmas-IceYeti"].Npc:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        end
    end
end)

Table_FarmEVENT:addToggle('Auto Farm Table (Mythic)', AutoFarmTable6, function(Value)
    AutoFarmTable6 = Value
end)
spawn(function()
    while task.wait() do
        if AutoFarmTable6 then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").GameObjects.RngNPCs["Christmas-FrozenWrestler"].Npc:GetChildren()) do
                    if v.Name == "Frozen Wrestler" then
                        if v:FindFirstChild("Npc"):FindFirstChild("HumanoidRootPart") then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                TPAreaEvent(v.Npc.HumanoidRootPart.CFrame)
                                if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Wrestle.Visible == false then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                                    wait(1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)
                                else
                                    game:GetService("ReplicatedStorage").Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
                                end
                            until not AutoFarmTable6 or not game:GetService("Workspace").GameObjects.RngNPCs["Christmas-FrozenWrestler"].Npc:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Right Event

local Eggs_Event = Event_Right:addMenu('#Eggs Event')

local EggEventList = {"Christmas"; "Gift"; "Icebound"; "CandyCane";}
Eggs_Event:addDropdown('Select Eggs', SelectedEventEggs, EggEventList, function(Value)
    SelectedEventEggs = Value
end)

function UpdateEventEgg()
    if SelectedEvent == "Classic Event" then
        EggEventList = {
            "Christmas"; "Gift"; "Icebound"; "CandyCane";
        }
        EggEventRefresh:Clear()
        EggEventRefresh:Refresh(EggEventList)
        
	end
end


local HatchTypeEventList = {'Single Hatch', 'Triple Hatch', 'Octuple Hatch'}
Eggs_Event:addDropdown('Select Hatch Type', SelectedTypeEventHatch, HatchTypeEventList, function(Value)
    SelectedTypeEventHatch = Value
end)

Eggs_Event:addToggle('Enable Hatch Eggs', AutoOpenEventEggs, function(Value)
    AutoOpenEventEggs = Value

    while AutoOpenEventEggs do wait()
        if SelectedTypeEventHatch == 'Single Hatch' then
            local args = {
                [1] = SelectedEventEggs,
                [2] = {},
                [3] = false
            }
            purchaseEgg:InvokeServer(unpack(args))

        elseif SelectedTypeEventHatch == 'Triple Hatch' then
            local args = {
                [1] = SelectedEventEggs,
                [2] = {},
                [3] = true,
                [4] = false
            }
            purchaseEgg:InvokeServer(unpack(args))

        elseif SelectedTypeEventHatch == 'Octuple Hatch' then
            local args = {
                [1] = SelectedEventEggs,
                [2] = {},
                [3] = false,
                [4] = true
            }
            purchaseEgg:InvokeServer(unpack(args))
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Other
local Other_Event = Event_Right:addMenu('#Misc')

Other_Event:addToggle('Auto Claim Playtime Pass (Free)', PlaytimeFreePass, function(Value)
    PlaytimeFreePass = Value

    while PlaytimeFreePass do wait()
        local ClaimReward = game:GetService("ReplicatedStorage").Packages.Knit.Services.EventPassService.RF.ClaimReward
        ClaimReward:InvokeServer("Free", math.random(1, 12))
    end
end)

Other_Event:addToggle('Auto Claim Playtime Pass (Exclusive)', PlaytimeExclusivePass, function(Value)
    PlaytimeExclusivePass = Value

    while PlaytimeExclusivePass do wait()
        local ClaimReward = game:GetService("ReplicatedStorage").Packages.Knit.Services.EventPassService.RF.ClaimReward
        ClaimReward:InvokeServer("Exclusive", math.random(1, 12))
    end
end)

Other_Event:addToggle('Auto Claim Calender Christmas', CalenderChristmas, function(Value)
    CalenderChristmas = Value

    while CalenderChristmas do wait()
        local Claim = game:GetService("ReplicatedStorage").Packages.Knit.Services.AdventCalenderService.RF.Claim
        Claim:InvokeServer(math.random(1, 24))
    end
end)

Other_Event:addToggle('Auto Spin Christmas', SpinChristmas, function(Value)
    SpinChristmas = Value

    while SpinChristmas do wait()
        game:GetService("ReplicatedStorage").Packages.Knit.Services.ChristmasSpinService.RE.onAllSpinRequest:FireServer()
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Event 

--[[Easter_Event:addToggle('Auto Fight Easter Boss', FightEasterBoss, function (Value)
    FightEasterBoss = Value

    while FightEasterBoss do wait()
        local args = {
            [1] = "Easter Boss"
        }
        game:GetService("ReplicatedStorage").Packages.Knit.Services.EasterBossService.RF.StartFight:InvokeServer(unpack(args))
        game:GetService("ReplicatedStorage").Packages.Knit.Services.EasterBossService.RF.Damage:InvokeServer()
    end
end)

function FarmTP(Tarpos)
    if (Tarpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Tarpos
    end
end

Easter_Event:addToggle('Auto Farm Easter Coin + TP', AutoFarmEasterCoinTP, function(Value)
    AutoFarmEasterCoinTP = Value
end)
local AutoFarmTP = false
spawn(function()
    while task.wait() do
        if AutoFarmEasterCoinTP then
            AutoFarmTP = true
            pcall(function()
                local HitBreakable = game:GetService("ReplicatedStorage").Packages.Knit.Services.EasterZoneService.RF.HitBreakable
                for i,v in pairs(game.Workspace.GameObjects.Breakables:GetChildren()) do
                    if v.Name then
                        if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 7 then
                            local args = {
                                [1] = v.Name
                            }
                            HitBreakable:InvokeServer(unpack(args))
                        end
                    end
                end
            end)
        else
            AutoFarmTP = false
        end
    end
end)
spawn(function()
    while task.wait() do
        if AutoFarmTP then
            pcall(function()
                for i,v in pairs(game.Workspace.GameObjects.Breakables:GetChildren()) do
                    if v.Name then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            FarmTP(v.CFrame * CFrame.new(3, 0, 0))
                        until not AutoFarmTP or not game.Workspace.GameObjects.Breakables:FindFirstChild(v.Name)
                    end
                end
            end)
        end
    end
end)

Easter_Event:addToggle('Auto Farm Easter Coin (Without TP)', AutoFarmEasterCoinNormal, function(Value)
    AutoFarmEasterCoinNormal = Value
end)
spawn(function()
    while task.wait() do
        if AutoFarmEasterCoinNormal then
            pcall(function()
                local HitBreakable = game:GetService("ReplicatedStorage").Packages.Knit.Services.EasterZoneService.RF.HitBreakable
                for i,v in pairs(game.Workspace.GameObjects.Breakables:GetChildren()) do
                    if v.Name then
                        if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
                            local args = {
                                [1] = v.Name
                            }
                            HitBreakable:InvokeServer(unpack(args))
                        end
                    end
                end
            end)
        end
    end
end)]]



----------------------------------------------------//----------------------------------------------------
--// FUNCTION DUMBELLS
local function CheckDumbells()
    local dumbelstat = PlayerStat.Biceps.Value
    if SelectedZone == "Zone 1 (School)" then
        if dumbelstat == 0 or dumbelstat <= 50 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "1Kg")
        elseif dumbelstat == 51 or dumbelstat <= 350 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "2Kg")
        elseif dumbelstat == 351 or dumbelstat <= 1000 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "3Kg")
        elseif dumbelstat == 1001 or dumbelstat <= 2500 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "4Kg")
        elseif dumbelstat == 2501 or dumbelstat <= 5000 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "5Kg")
        elseif dumbelstat == 5001 or dumbelstat <= 7500 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "10Kg")
        elseif dumbelstat == 7501 or dumbelstat <= 10000 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "15Kg")
        elseif dumbelstat == 10001 or dumbelstat <= 15000 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "20Kg")
        elseif dumbelstat == 15001 or dumbelstat <= 20000 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "25Kg")
        elseif dumbelstat == 20001 or dumbelstat <= 25000 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "50Kg")
        elseif dumbelstat == 25001 or dumbelstat <= 50000 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "100Kg")
        elseif dumbelstat >= 50001 then
            onGuiEquipRequest:FireServer("1", "Dumbells", "250Kg")
        end
    elseif SelectedZone == "Zone 2 (Space Gym)" then
        if dumbelstat == 0 or dumbelstat <= 750000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "300Kg")
        elseif dumbelstat == 750001 or dumbelstat <= 1125000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "400Kg")
        elseif dumbelstat == 1125001 or dumbelstat <= 175000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "500Kg")
        elseif dumbelstat == 1750001 or dumbelstat <= 2625000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "650Kg")
        elseif dumbelstat == 2625001 or dumbelstat <= 4000000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "800Kg")
        elseif dumbelstat == 4000001 or dumbelstat <= 6000000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "1000Kg")
        elseif dumbelstat == 6000001 or dumbelstat <= 7500000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "1500Kg")
        elseif dumbelstat == 7500001 or dumbelstat <= 9000000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "2000Kg")
        elseif dumbelstat == 9000001 or dumbelstat <= 13500000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "2500Kg")
        elseif dumbelstat == 13500001 or dumbelstat <= 20250000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "3000Kg")
        elseif dumbelstat == 20250001 or dumbelstat <= 30000000 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "3500Kg")
        elseif dumbelstat >= 30000001 then
            onGuiEquipRequest:FireServer("2", "Dumbells", "4000Kg")
        end
    elseif SelectedZone == "Zone 3 (Beach)" then
        if dumbelstat == 0 or dumbelstat <= 42000000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "5000Kg")
        elseif dumbelstat == 42000001 or dumbelstat <= 63000000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "6000Kg")
        elseif dumbelstat == 63000001 or dumbelstat <= 94500000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "7500Kg")
        elseif dumbelstat == 94500001 or dumbelstat <= 141750000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "10000Kg")
        elseif dumbelstat == 141750001 or dumbelstat <= 200000000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "12500Kg")
        elseif dumbelstat == 200000001 or dumbelstat <= 300000000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "15000Kg")
        elseif dumbelstat == 300000001 or dumbelstat <= 450000000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "20000Kg")
        elseif dumbelstat == 450000001 or dumbelstat <= 675000000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "25000Kg")
        elseif dumbelstat == 675000001 or dumbelstat <= 1000000000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "30000Kg")
        elseif dumbelstat == 1000000001 or dumbelstat <= 1500000000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "35000Kg")
        elseif dumbelstat == 1500000001 or dumbelstat <= 2250000000 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "40000Kg")
        elseif dumbelstat >= 2250000001 then
            onGuiEquipRequest:FireServer("3", "Dumbells", "45000Kg")
        end
    elseif SelectedZone == "Zone 4 (Bunker)" then
        if dumbelstat == 0 or dumbelstat <= 3375000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "50000Kg")
        elseif dumbelstat == 3375000001 or dumbelstat <= 5000000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "60000Kg")
        elseif dumbelstat == 5000000001 or dumbelstat <= 7500000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "70000Kg")
        elseif dumbelstat == 7500000001 or dumbelstat <= 11250000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "80000Kg")
        elseif dumbelstat == 11250000001 or dumbelstat <= 16875000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "90000Kg")
        elseif dumbelstat == 16875000001 or dumbelstat <= 25000000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "100000Kg")
        elseif dumbelstat == 25000000001 or dumbelstat <= 37500000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "125000Kg")
        elseif dumbelstat == 37500000001 or dumbelstat <= 56000000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "150000Kg")
        elseif dumbelstat == 56000000001 or dumbelstat <= 84000000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "175000Kg")
        elseif dumbelstat == 84000000001 or dumbelstat <= 126000000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "200000Kg")
        elseif dumbelstat == 126000000001 or dumbelstat <= 189000000000 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "250000Kg")
        elseif dumbelstat >= 189000000001 then
            onGuiEquipRequest:FireServer("4", "Dumbells", "300000Kg")
        end
    elseif SelectedZone == "Zone 6 (Void)" then
        if dumbelstat == 0 or dumbelstat <= 1000000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "350000Kg")
        elseif dumbelstat == 1000000000001 or dumbelstat <= 1200000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "375000Kg")
        elseif dumbelstat == 1200000000001 or dumbelstat <= 1400000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "400000Kg")
        elseif dumbelstat == 1400000000001 or dumbelstat <= 1800000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "Starter")
        elseif dumbelstat == 1800000000001 or dumbelstat <= 2200000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "450000Kg")
        elseif dumbelstat == 2200000000001 or dumbelstat <= 2500000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "Starter")
        elseif dumbelstat == 2500000000001 or dumbelstat <= 2800000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "500000Kg")
        elseif dumbelstat == 2800000000001 or dumbelstat <= 3200000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "525000Kg")
        elseif dumbelstat == 3200000000001 or dumbelstat <= 3500000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "550000Kg")
        elseif dumbelstat == 3500000000001 or dumbelstat <= 4000000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "575000Kg")
        elseif dumbelstat == 4000000000001 or dumbelstat <= 4200000000000 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "600000Kg")
        elseif dumbelstat >= 4200000000001 then
            onGuiEquipRequest:FireServer("6", "Dumbells", "625000Kg")
        end
    elseif SelectedZone == "Zone 7 (Space Center)" then
        if dumbelstat == 0 or dumbelstat <= 4500000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "650000Kg")
        elseif dumbelstat == 4500000000000 or dumbelstat <= 4900000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "675000Kg")
        elseif dumbelstat == 4900000000000 or dumbelstat <= 5300000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "700000Kg")
        elseif dumbelstat == 5300000000000 or dumbelstat <= 5800000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "725000Kg")
        elseif dumbelstat == 5800000000000 or dumbelstat <= 6300000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "750000Kg")
        elseif dumbelstat == 6300000000000 or dumbelstat <= 6800000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "775000Kg")
        elseif dumbelstat == 6800000000000 or dumbelstat <= 7300000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "800000Kg")
        elseif dumbelstat == 7300000000000 or dumbelstat <= 7900000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "825000Kg")
        elseif dumbelstat == 7900000000000 or dumbelstat <= 8500000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "850000Kg")
        elseif dumbelstat == 8500000000000 or dumbelstat <= 9100000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "875000Kg")
        elseif dumbelstat == 9100000000000 or dumbelstat <= 9700000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "900000Kg")
        elseif dumbelstat >= 9700000000000 then
            onGuiEquipRequest:FireServer("7", "Dumbells", "925000Kg")
        end
    elseif SelectedZone == "Zone 8 (Roman Empire)" then
        if dumbelstat == 0 or dumbelstat <= 1.65e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "650000Kg")
        elseif dumbelstat == 1.65e+22 or dumbelstat <= 1.92e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "675000Kg")
        elseif dumbelstat == 1.92e+22 or dumbelstat <= 2.83e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "700000Kg")
        elseif dumbelstat == 2.83e+22 or dumbelstat <= 3.79e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "725000Kg")
        elseif dumbelstat == 3.79e+22 or dumbelstat <= 4.25e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "750000Kg")
        elseif dumbelstat == 4.25e+22 or dumbelstat <= 4.8e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "775000Kg")
        elseif dumbelstat == 4.8e+22 or dumbelstat <= 5.2e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "800000Kg")
        elseif dumbelstat == 5.2e+22 or dumbelstat <= 5.6e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "825000Kg")
        elseif dumbelstat == 5.6e+22 or dumbelstat <= 6.35e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "850000Kg")
        elseif dumbelstat == 6.35e+22 or dumbelstat <= 6.75e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "875000Kg")
        elseif dumbelstat == 6.75e+22 or dumbelstat <= 7.3e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "900000Kg")
        elseif dumbelstat >= 7.3e+22 then
            onGuiEquipRequest:FireServer("8", "Dumbells", "925000Kg")
        end
    elseif SelectedZone == "Zone 9 (Underworld)" then
        if dumbelstat == 0 or dumbelstat <= 2.475e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "650000Kg")
        elseif dumbelstat == 2.475e+22 or dumbelstat <= 2.88e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "675000Kg")
        elseif dumbelstat == 2.88e+22 or dumbelstat <= 4.245e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "700000Kg")
        elseif dumbelstat == 4.245e+22 or dumbelstat <= 5.685e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "725000Kg")
        elseif dumbelstat == 5.685e+22 or dumbelstat <= 6.3749999999999994e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "750000Kg")
        elseif dumbelstat == 6.3749999999999994e+22 or dumbelstat <= 7.2e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "775000Kg")
        elseif dumbelstat == 7.2e+22 or dumbelstat <= 7.8e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "800000Kg")
        elseif dumbelstat == 7.8e+22 or dumbelstat <= 8.4e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "825000Kg")
        elseif dumbelstat == 8.4e+22 or dumbelstat <= 9.525e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "850000Kg")
        elseif dumbelstat == 9.525e+22 or dumbelstat <= 1.0124999999999999e+23 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "875000Kg")
        elseif dumbelstat == 1.0124999999999999e+23 or dumbelstat <= 1.095e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "900000Kg")
        elseif dumbelstat >= 1.095e+22 then
            onGuiEquipRequest:FireServer("9", "Dumbells", "925000Kg")
        end
    elseif SelectedZone == "Zone 10 (Magic Forest)" then
        if dumbelstat == 0 or dumbelstat <= 1.3e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic1")
        elseif dumbelstat == 1.3e+24 or dumbelstat <= 1.7e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic2")
        elseif dumbelstat == 1.7e+24 or dumbelstat <= 2e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic3")
        elseif dumbelstat == 2e+24 or dumbelstat <= 2.7999999999999996e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic4")
        elseif dumbelstat == 2.7999999999999996e+24 or dumbelstat <= 3.2000000000000003e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic5")
        elseif dumbelstat == 3.2000000000000003e+24 or dumbelstat <= 4e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic6")
        elseif dumbelstat == 4e+24 or dumbelstat <= 5.1e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic7")
        elseif dumbelstat == 5.1e+24 or dumbelstat <= 6e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic8")
        elseif dumbelstat == 6e+24 or dumbelstat <= 7e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic9")
        elseif dumbelstat == 7e+24 or dumbelstat <= 8.199999999999999e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic10")
        elseif dumbelstat == 8.199999999999999e+24 or dumbelstat <= 8.999999999999999e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic11")
        elseif dumbelstat >= 8.999999999999999e+24 then
            onGuiEquipRequest:FireServer("10", "Dumbells", "Magic12")
        end
    elseif SelectedZone == "Zone 11 (Snowy Peaks)" then
        if dumbelstat == 0 or dumbelstat <= 1.3e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice1")
        elseif dumbelstat == 1.3e+24 or dumbelstat <= 1.7e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice2")
        elseif dumbelstat == 1.7e+24 or dumbelstat <= 2e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice3")
        elseif dumbelstat == 2e+24 or dumbelstat <= 2.7999999999999996e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice4")
        elseif dumbelstat == 2.7999999999999996e+24 or dumbelstat <= 3.2000000000000003e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice5")
        elseif dumbelstat == 3.2000000000000003e+24 or dumbelstat <= 4e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice6")
        elseif dumbelstat == 4e+24 or dumbelstat <= 5.1e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice7")
        elseif dumbelstat == 5.1e+24 or dumbelstat <= 6e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice8")
        elseif dumbelstat == 6e+24 or dumbelstat <= 7e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice9")
        elseif dumbelstat == 7e+24 or dumbelstat <= 8.199999999999999e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice10")
        elseif dumbelstat == 8.199999999999999e+24 or dumbelstat <= 8.99999999999999e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice11")
        elseif dumbelstat >= 8.99999999999999e+24 then
            onGuiEquipRequest:FireServer("11", "Dumbells", "Ice12")
        end

    elseif SelectedZone == "Zone 12 (Dusty Tavern)" then
        if dumbelstat == 0 or dumbelstat <= 1.3e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining1")
        elseif dumbelstat == 1.3e+24 or dumbelstat <= 1.7e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining2")
        elseif dumbelstat == 1.7e+24 or dumbelstat <= 2e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining3")
        elseif dumbelstat == 2e+24 or dumbelstat <= 2.7999999999999996e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining4")
        elseif dumbelstat == 2.7999999999999996e+24 or dumbelstat <= 3.2000000000000003e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining5")
        elseif dumbelstat == 3.2000000000000003e+24 or dumbelstat <= 4e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining6")
        elseif dumbelstat == 4e+24 or dumbelstat <= 5.1e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining7")
        elseif dumbelstat == 5.1e+24 or dumbelstat <= 6e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining8")
        elseif dumbelstat == 6e+24 or dumbelstat <= 7e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining9")
        elseif dumbelstat == 7e+24 or dumbelstat <= 8.199999999999999e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining10")
        elseif dumbelstat == 8.199999999999999e+24 or dumbelstat <= 8.99999999999999e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining11")
        elseif dumbelstat >= 8.99999999999999e+24 then
            onGuiEquipRequest:FireServer("12", "Dumbells", "Mining12")
        end

    elseif SelectedZone == "Zone 13 (Lost Kingdom)" then
        if dumbelstat == 0 or dumbelstat <= 1.3e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom1")
        elseif dumbelstat == 1.3e+24 or dumbelstat <= 1.7e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom2")
        elseif dumbelstat == 1.7e+24 or dumbelstat <= 2e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom3")
        elseif dumbelstat == 2e+24 or dumbelstat <= 2.7999999999999996e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom4")
        elseif dumbelstat == 2.7999999999999996e+24 or dumbelstat <= 3.2000000000000003e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom5")
        elseif dumbelstat == 3.2000000000000003e+24 or dumbelstat <= 4e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom6")
        elseif dumbelstat == 4e+24 or dumbelstat <= 5.1e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom7")
        elseif dumbelstat == 5.1e+24 or dumbelstat <= 6e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom8")
        elseif dumbelstat == 6e+24 or dumbelstat <= 7e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom9")
        elseif dumbelstat == 7e+24 or dumbelstat <= 8.199999999999999e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom10")
        elseif dumbelstat == 8.199999999999999e+24 or dumbelstat <= 8.99999999999999e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom11")
        elseif dumbelstat >= 8.99999999999999e+24 then
            onGuiEquipRequest:FireServer("13", "Dumbells", "Kingdom12")
        end

    elseif SelectedZone == "Zone 14 (Orc Paradise)" then
        if dumbelstat == 0 or dumbelstat <= 1.3e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise1")
        elseif dumbelstat == 1.3e+24 or dumbelstat <= 1.7e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise2")
        elseif dumbelstat == 1.7e+24 or dumbelstat <= 2e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise3")
        elseif dumbelstat == 2e+24 or dumbelstat <= 2.7999999999999996e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise4")
        elseif dumbelstat == 2.7999999999999996e+24 or dumbelstat <= 3.2000000000000003e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise5")
        elseif dumbelstat == 3.2000000000000003e+24 or dumbelstat <= 4e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise6")
        elseif dumbelstat == 4e+24 or dumbelstat <= 5.1e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise7")
        elseif dumbelstat == 5.1e+24 or dumbelstat <= 6e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise8")
        elseif dumbelstat == 6e+24 or dumbelstat <= 7e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise9")
        elseif dumbelstat == 7e+24 or dumbelstat <= 8.199999999999999e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise10")
        elseif dumbelstat == 8.199999999999999e+24 or dumbelstat <= 8.99999999999999e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise11")
        elseif dumbelstat >= 8.99999999999999e+24 then
            onGuiEquipRequest:FireServer("14", "Dumbells", "Paradise12")
        end

    elseif SelectedZone == "Zone 15 (Heavenly Island)" then
        if dumbelstat == 0 or dumbelstat <= 1.3e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven1")
        elseif dumbelstat == 1.3e+24 or dumbelstat <= 1.7e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven2")
        elseif dumbelstat == 1.7e+24 or dumbelstat <= 2e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven3")
        elseif dumbelstat == 2e+24 or dumbelstat <= 2.7999999999999996e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven4")
        elseif dumbelstat == 2.7999999999999996e+24 or dumbelstat <= 3.2000000000000003e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven5")
        elseif dumbelstat == 3.2000000000000003e+24 or dumbelstat <= 4e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven6")
        elseif dumbelstat == 4e+24 or dumbelstat <= 5.1e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven7")
        elseif dumbelstat == 5.1e+24 or dumbelstat <= 6e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven8")
        elseif dumbelstat == 6e+24 or dumbelstat <= 7e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven9")
        elseif dumbelstat == 7e+24 or dumbelstat <= 8.199999999999999e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven10")
        elseif dumbelstat == 8.199999999999999e+24 or dumbelstat <= 8.99999999999999e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven11")
        elseif dumbelstat >= 8.99999999999999e+24 then
            onGuiEquipRequest:FireServer("15", "Dumbells", "Heaven12")
        end

    elseif SelectedZone == "Zone 16 (The Rift)" then
        if dumbelstat == 0 or dumbelstat <= 1.2e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift1")
        elseif dumbelstat == 1.2e+25 or dumbelstat <= 1.5e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift2")
        elseif dumbelstat == 1.5e+25 or dumbelstat <= 2.3e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift3")
        elseif dumbelstat == 2.3e+25 or dumbelstat <= 2.5e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift4")
        elseif dumbelstat == 2.5e+25 or dumbelstat <= 3.2e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift5")
        elseif dumbelstat == 3.2e+25 or dumbelstat <= 3.5e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift6")
        elseif dumbelstat == 3.5e+25 or dumbelstat <= 3.61e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift7")
        elseif dumbelstat == 3.61e+25 or dumbelstat <= 3.8e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift8")
        elseif dumbelstat == 3.8e+25 or dumbelstat <= 4.5e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift9")
        elseif dumbelstat == 4.5e+25 or dumbelstat <= 5.32e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift10")
        elseif dumbelstat == 5.32e+25 or dumbelstat <= 6e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift11")
        elseif dumbelstat >= 6e+25 then
            onGuiEquipRequest:FireServer("16", "Dumbells", "Rift12")
        end
    end
end

--// FUNCTION BARBELLS
local function CheckBarbells()
    local barbelstat = PlayerStat.Biceps.Value
    if SelectedZone == "Zone 1 (School)" then
        if barbelstat == 3000 or barbelstat <= 15000 then
            onEquipRequest:FireServer("1", "Barbells", "Tier1")
        elseif barbelstat == 15001 or barbelstat <= 50000 then
            onEquipRequest:FireServer("1", "Barbells", "Tier2")
        elseif barbelstat >= 50001 then
            onEquipRequest:FireServer("1", "Barbells", "Tier3")
        end
    elseif SelectedZone == "Zone 2 (Space Gym)" then
        if barbelstat == 250000 or barbelstat <= 1250000 then
            onEquipRequest:FireServer("2", "Barbells", "Tier4")
        elseif barbelstat == 1250000 or barbelstat <= 5000000 then
            onEquipRequest:FireServer("2", "Barbells", "Tier5")
        elseif barbelstat >= 5000000 then
            onEquipRequest:FireServer("2", "Barbells", "Tier6")
        end
    elseif SelectedZone == "Zone 3 (Beach)" then
        if barbelstat == 10000000 or barbelstat <= 25000000 then
            onEquipRequest:FireServer("3", "Barbells", "Tier7")
        elseif barbelstat == 25000000 or barbelstat <= 45000000 then
            onEquipRequest:FireServer("3", "Barbells", "Tier8")
        elseif barbelstat >= 45000000 then
            onEquipRequest:FireServer("3", "Barbells", "Tier9")
        end
    elseif SelectedZone == "Zone 4 (Bunker)" then
        if barbelstat == 3937500000 or barbelstat <= 21850000000 then
            onEquipRequest:FireServer("4", "Barbells", "Tier10")
        elseif barbelstat == 21850000000 or barbelstat <= 220000000000 then
            onEquipRequest:FireServer("4", "Barbells", "Tier11")
        elseif barbelstat >= 220000000000 then
            onEquipRequest:FireServer("4", "Barbells", "Tier12")
        end
    elseif SelectedZone == "Zone 6 (Void)" then
        if barbelstat == 2.16e+19 or barbelstat <= 2.7e+19 then
            onEquipRequest:FireServer("6", "Barbells", "Tier16")
        elseif barbelstat == 2.7e+19 or barbelstat <= 3.24e+19 then
            onEquipRequest:FireServer("6", "Barbells", "Tier17")
        elseif barbelstat >= 3.24e+19 then
            onEquipRequest:FireServer("6", "Barbells", "Tier18")
        end
    elseif SelectedZone == "Zone 7 (Space Center)" then
        if barbelstat == 37800000000000000000 or barbelstat <= 43200000000000000000 then
            onEquipRequest:FireServer("7", "Barbells", "Tier19")
        elseif barbelstat == 43200000000000000000 or barbelstat <= 48600000000000000000 then
            onEquipRequest:FireServer("7", "Barbells", "Tier20")
        elseif barbelstat >= 48600000000000000000 then
            onEquipRequest:FireServer("7", "Barbells", "Tier21")
        end
    elseif SelectedZone == "Zone 8 (Roman Empire)" then
        if barbelstat == 5e+22 or barbelstat <= 1.28e+23 then
            onEquipRequest:FireServer("8", "Barbells", "Tier22")
        elseif barbelstat == 1.28e+23 or barbelstat <= 2.8e+23 then
            onEquipRequest:FireServer("8", "Barbells", "Tier23")
        elseif barbelstat >= 2.8e+23 then
            onEquipRequest:FireServer("8", "Barbells", "Tier24")
        end
    elseif SelectedZone == "Zone 9 (Underworld)" then
        if barbelstat == 4.2e+23 or barbelstat <= 5.6e+23 then
            onEquipRequest:FireServer("9", "Barbells", "Tier25")
        elseif barbelstat == 5.6e+23 or barbelstat <= 7e+23 then
            onEquipRequest:FireServer("9", "Barbells", "Tier26")
        elseif barbelstat >= 7e+23 then
            onEquipRequest:FireServer("9", "Barbells", "Tier27")
        end
    elseif SelectedZone == "Zone 10 (Magic Forest)" then
        if barbelstat == 1.5e+24 or barbelstat <= 4e+24 then
            onEquipRequest:FireServer("10", "Barbells", "Tier28")
        elseif barbelstat == 4e+24 or barbelstat <= 8e+24 then
            onEquipRequest:FireServer("10", "Barbells", "Tier29")
        elseif barbelstat >= 8e+24 then
            onEquipRequest:FireServer("10", "Barbells", "Tier30")
        end

    elseif SelectedZone == "Zone 11 (Snowy Peaks)" then
        if barbelstat == 1.2e+25 or barbelstat <= 1.4e+25 then
            onEquipRequest:FireServer("11", "Barbells", "Tier31")
        elseif barbelstat == 1.4e+25 or barbelstat <= 1.6e+25 then
            onEquipRequest:FireServer("11", "Barbells", "Tier32")
        elseif barbelstat >= 1.6e+25 then
            onEquipRequest:FireServer("11", "Barbells", "Tier33")
        end

    elseif SelectedZone == "Zone 12 (Dusty Tavern)" then
        if barbelstat == 1.2e+25 or barbelstat <= 1.4e+25 then
            onEquipRequest:FireServer("12", "Barbells", "Mining1")
        elseif barbelstat == 1.4e+25 or barbelstat <= 1.6e+25 then
            onEquipRequest:FireServer("12", "Barbells", "Mining2")
        elseif barbelstat >= 1.6e+25 then
            onEquipRequest:FireServer("12", "Barbells", "Mining3")
        end

    elseif SelectedZone == "Zone 13 (Lost Kingdom)" then
        if barbelstat == 1.2e+25 or barbelstat <= 1.4e+25 then
            onEquipRequest:FireServer("13", "Barbells", "Kingdom1")
        elseif barbelstat == 1.4e+25 or barbelstat <= 1.6e+25 then
            onEquipRequest:FireServer("13", "Barbells", "Kingdom2")
        elseif barbelstat >= 1.6e+25 then
            onEquipRequest:FireServer("13", "Barbells", "Kingdom3")
        end

    elseif SelectedZone == "Zone 14 (Orc Paradise)" then
        if barbelstat == 1.2e+25 or barbelstat <= 1.4e+25 then
            onEquipRequest:FireServer("14", "Barbells", "Paradise1")
        elseif barbelstat == 1.4e+25 or barbelstat <= 1.6e+25 then
            onEquipRequest:FireServer("14", "Barbells", "Paradise2")
        elseif barbelstat >= 1.6e+25 then
            onEquipRequest:FireServer("14", "Barbells", "Paradise3")
        end

    elseif SelectedZone == "Zone 15 (Heavenly Island)" then
        if barbelstat == 3.5999999999999997e+25 or barbelstat <= 4.2e+25 then
            onEquipRequest:FireServer("15", "Barbells", "Heaven1")
        elseif barbelstat == 4.2e+25 or barbelstat <= 4.8e+25 then
            onEquipRequest:FireServer("15", "Barbells", "Heaven2")
        elseif barbelstat >= 4.8e+25 then
            onEquipRequest:FireServer("15", "Barbells", "Heaven3")
        end

    elseif SelectedZone == "Zone 16 (The Rift)" then
        if barbelstat == 5.999999999999999e+25 or barbelstat <= 7.5000000000000001e+25 then
            onEquipRequest:FireServer("1", "Barbells", "Rift1")
        elseif barbelstat == 7.5000000000000001e+25 or barbelstat <= 9e+25 then
            onEquipRequest:FireServer("1", "Barbells", "Rift2")
        elseif barbelstat >= 9e+25 then
            onEquipRequest:FireServer("1", "Barbells", "Rift3")
        end
    end
end

--// FUNCTION GRIPS
local function CheckGrips()
    local gripstat = PlayerStat.Hands.Value
    if SelectedZone == "Zone 1 (School)" then
        if gripstat == 0 or gripstat <= 50 then
            onGuiEquipRequest:FireServer("1", "Grips", "1Kg")
        elseif gripstat == 51 or gripstat <= 150 then
            onGuiEquipRequest:FireServer("1", "Grips", "2Kg")
        elseif gripstat == 151 or gripstat <= 300 then
            onGuiEquipRequest:FireServer("1", "Grips", "3Kg")
        elseif gripstat == 301 or gripstat <= 500 then
            onGuiEquipRequest:FireServer("1", "Grips", "4Kg")
        elseif gripstat == 501 or gripstat <= 1500 then
            onGuiEquipRequest:FireServer("1", "Grips", "5Kg")
        elseif gripstat == 1501 or gripstat <= 3000 then
            onGuiEquipRequest:FireServer("1", "Grips", "10Kg")
        elseif gripstat == 3001 or gripstat <= 5000 then
            onGuiEquipRequest:FireServer("1", "Grips", "15Kg")
        elseif gripstat == 5001 or gripstat <= 10000 then
            onGuiEquipRequest:FireServer("1", "Grips", "20Kg")
        elseif gripstat == 10001 or gripstat <= 25000 then
            onGuiEquipRequest:FireServer("1", "Grips", "25Kg")
        elseif gripstat == 25001 or gripstat <= 100000 then
            onGuiEquipRequest:FireServer("1", "Grips", "50Kg")
        elseif gripstat == 100001 or gripstat <= 300000 then
            onGuiEquipRequest:FireServer("1", "Grips", "100Kg")
        elseif gripstat >= 300000 then
            onGuiEquipRequest:FireServer("1", "Grips", "250Kg")
        end
    elseif SelectedZone == "Zone 2 (Space Gym)" then
        if gripstat == 0 or gripstat <= 750000 then
            onGuiEquipRequest:FireServer("2", "Grips", "300Kg")
        elseif gripstat == 750000 or gripstat <= 1125000 then
            onGuiEquipRequest:FireServer("2", "Grips", "350Kg")
        elseif gripstat == 1125000 or gripstat <= 1750000 then
            onGuiEquipRequest:FireServer("2", "Grips", "400Kg")
        elseif gripstat == 1750000 or gripstat <= 2500000 then
            onGuiEquipRequest:FireServer("2", "Grips", "450Kg")
        elseif gripstat == 2500000 or gripstat <= 3750000 then
            onGuiEquipRequest:FireServer("2", "Grips", "500Kg")
        elseif gripstat == 3750000 or gripstat <= 5625000 then
            onGuiEquipRequest:FireServer("2", "Grips", "600Kg")
        elseif gripstat == 5625000 or gripstat <= 8500000 then
            onGuiEquipRequest:FireServer("2", "Grips", "700Kg")
        elseif gripstat == 8500000 or gripstat <= 12750000 then
            onGuiEquipRequest:FireServer("2", "Grips", "800Kg")
        elseif gripstat == 12750000 or gripstat <= 16000000 then
            onGuiEquipRequest:FireServer("2", "Grips", "900Kg")
        elseif gripstat == 16000000 or gripstat <= 22000000 then
            onGuiEquipRequest:FireServer("2", "Grips", "1000Kg")
        elseif gripstat == 22000000 or gripstat <= 30000000 then
            onGuiEquipRequest:FireServer("2", "Grips", "1250Kg")
        elseif gripstat >= 30000000 then
            onGuiEquipRequest:FireServer("2", "Grips", "1500Kg")
        end
    elseif SelectedZone == "Zone 3 (Beach)" then
        if gripstat == 0 or gripstat <= 42000000 then
            onGuiEquipRequest:FireServer("3", "Grips", "5000Kg")
        elseif gripstat == 42000000 or gripstat <= 63000000 then
            onGuiEquipRequest:FireServer("3", "Grips", "6000Kg")
        elseif gripstat == 63000000 or gripstat <= 94500000 then
            onGuiEquipRequest:FireServer("3", "Grips", "7500Kg")
        elseif gripstat == 94500000 or gripstat <= 141750000 then
            onGuiEquipRequest:FireServer("3", "Grips", "10000Kg")
        elseif gripstat == 141750000 or gripstat <= 212625000 then
            onGuiEquipRequest:FireServer("3", "Grips", "12500Kg")
        elseif gripstat == 212625000 or gripstat <= 318937500 then
            onGuiEquipRequest:FireServer("3", "Grips", "15000Kg")
        elseif gripstat == 318937500 or gripstat <= 500000000 then
            onGuiEquipRequest:FireServer("3", "Grips", "20000Kg")
        elseif gripstat == 500000000 or gripstat <= 750000000 then
            onGuiEquipRequest:FireServer("3", "Grips", "25000Kg")
        elseif gripstat == 750000000 or gripstat <= 1125000000 then
            onGuiEquipRequest:FireServer("3", "Grips", "30000Kg")
        elseif gripstat == 1125000000 or gripstat <= 1687500000 then
            onGuiEquipRequest:FireServer("3", "Grips", "35000Kg")
        elseif gripstat == 1687500000 or gripstat <= 2500000000 then
            onGuiEquipRequest:FireServer("3", "Grips", "40000Kg")
        elseif gripstat >= 2500000000 then
            onGuiEquipRequest:FireServer("3", "Grips", "45000Kg")
        end
    elseif SelectedZone == "Zone 4 (Bunker)" then
        if gripstat == 0 or gripstat <= 3750000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "50000Kg")
        elseif gripstat == 3750000000 or gripstat <= 4000000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "60000Kg")
        elseif gripstat == 4000000000 or gripstat <= 6500000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "70000Kg")
        elseif gripstat == 6500000000 or gripstat <= 12250000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "80000Kg")
        elseif gripstat == 12250000000 or gripstat <= 14875000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "90000Kg")
        elseif gripstat == 14875000000 or gripstat <= 23000000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "100000Kg")
        elseif gripstat == 23000000000 or gripstat <= 36500000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "125000Kg")
        elseif gripstat == 36500000000 or gripstat <= 53000000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "150000Kg")
        elseif gripstat == 53000000000 or gripstat <= 80000000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "175000Kg")
        elseif gripstat == 80000000000 or gripstat <= 120000000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "200000Kg")
        elseif gripstat == 120000000000 or gripstat <= 200000000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "250000Kg")
        elseif gripstat >= 200000000000 then
            onGuiEquipRequest:FireServer("4", "Grips", "300000Kg")
        end
    elseif SelectedZone == "Zone 5 (Dino)" then
        if gripstat == 0 or gripstat <= 2.499875e+14 then
            onGuiEquipRequest:FireServer("5", "Grips", "350000Kg")
        elseif gripstat == 2.499875e+14 or gripstat <= 4.99975e+14 then
            onGuiEquipRequest:FireServer("5", "Grips", "375000Kg")
        elseif gripstat == 4.99975e+14 or gripstat <= 9.9995e+14 then
            onGuiEquipRequest:FireServer("5", "Grips", "400000Kg")
        elseif gripstat == 9.9995e+14 or gripstat <= 1.499925e+15 then
            onGuiEquipRequest:FireServer("5", "Grips", "425000Kg")
        elseif gripstat == 1.499925e+15 or gripstat <= 1.9999e+15 then
            onGuiEquipRequest:FireServer("5", "Grips", "450000Kg")
        elseif gripstat == 1.9999e+15 or gripstat <= 2.499875e+15 then
            onGuiEquipRequest:FireServer("5", "Grips", "475000Kg")
        elseif gripstat == 2.499875e+15 or gripstat <= 2.99985e+15 then
            onGuiEquipRequest:FireServer("5", "Grips", "500000Kg")
        elseif gripstat == 2.99985e+15 or gripstat <= 3.499825e+15 then
            onGuiEquipRequest:FireServer("5", "Grips", "525000Kg")
        elseif gripstat == 3.499825e+15 or gripstat <= 3.9998e+15 then
            onGuiEquipRequest:FireServer("5", "Grips", "550000Kg")
        elseif gripstat == 3.9998e+15 or gripstat <= 4.499775e+15 then
            onGuiEquipRequest:FireServer("5", "Grips", "575000Kg")
        elseif gripstat == 4.499775e+15 or gripstat <= 5e+15 then
            onGuiEquipRequest:FireServer("5", "Grips", "600000Kg")
        elseif gripstat >= 5e+15 then
            onGuiEquipRequest:FireServer("5", "Grips", "625000Kg")
        end
    elseif SelectedZone == "Zone 6 (Void)" then
        if gripstat == 0 or gripstat <= 2.16e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "650000Kg")
        elseif gripstat == 2.16e+19 or gripstat <= 2.52e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "675000Kg")
        elseif gripstat == 2.52e+19 or gripstat <= 2.88e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "700000Kg")
        elseif gripstat == 2.88e+19 or gripstat <= 3.24e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "725000Kg")
        elseif gripstat == 3.24e+19 or gripstat <= 3.6e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "750000Kg")
        elseif gripstat == 3.6e+19 or gripstat <= 3.96e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "775000Kg")
        elseif gripstat == 3.96e+19 or gripstat <= 4.32e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "800000Kg")
        elseif gripstat == 4.32e+19 or gripstat <= 4.68e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "825000Kg")
        elseif gripstat == 4.68e+19 or gripstat <= 5.04e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "850000Kg")
        elseif gripstat == 5.04e+19 or gripstat <= 5.4e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "875000Kg")
        elseif gripstat == 5.4e+19 or gripstat <= 5.76e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "900000Kg")
        elseif gripstat >= 5.76e+19 then
            onGuiEquipRequest:FireServer("6", "Grips", "925000Kg")
        end
    elseif SelectedZone == "Zone 7 (Space Center)" then
        if gripstat == 0 or gripstat <= 60480000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "875000Kg")
        elseif gripstat == 60480000000000000000 or gripstat <= 69120000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "900000Kg")
        elseif gripstat == 69120000000000000000 or gripstat <= 77760000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "925000Kg")
        elseif gripstat == 77760000000000000000 or gripstat <= 86400000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "950000Kg")
        elseif gripstat == 86400000000000000000 or gripstat <= 95040000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "975000Kg")
        elseif gripstat == 95040000000000000000 or gripstat <= 103680000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "1000000Kg")
        elseif gripstat == 103680000000000000000 or gripstat <= 112320000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "1025000Kg")
        elseif gripstat == 112320000000000000000 or gripstat <= 120960000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "1050000Kg")
        elseif gripstat == 120960000000000000000 or gripstat <= 129600000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "1075000Kg")
        elseif gripstat == 129600000000000000000 or gripstat <= 138240000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "1100000Kg")
        elseif gripstat == 138240000000000000000 or gripstat <= 146880000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "1125000Kg")
        elseif gripstat >= 146880000000000000000 then
            onGuiEquipRequest:FireServer("7", "Grips", "1150000Kg")
        end
    elseif SelectedZone == "Zone 8 (Roman Empire)" then
        if gripstat == 0 or gripstat <= 1.52e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "875000Kg")
        elseif gripstat == 1.52e+22 or gripstat <= 2.63e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "900000Kg")
        elseif gripstat == 2.63e+22 or gripstat <= 3.8e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "925000Kg")
        elseif gripstat == 3.8e+22 or gripstat <= 4.32e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "950000Kg")
        elseif gripstat == 4.32e+22 or gripstat <= 4.75e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "975000Kg")
        elseif gripstat == 4.75e+22 or gripstat <= 5.179999999999999e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "1000000Kg")
        elseif gripstat == 5.179999999999999e+22 or gripstat <= 5.6e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "1025000Kg")
        elseif gripstat == 5.6e+22 or gripstat <= 6.0399999999999996e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "1050000Kg")
        elseif gripstat == 6.0399999999999996e+22 or gripstat <= 6.45e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "1075000Kg")
        elseif gripstat == 6.45e+22 or gripstat <= 6.9e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "1100000Kg")
        elseif gripstat == 6.9e+22 or gripstat <= 7.3e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "1125000Kg")
        elseif gripstat >= 7.3e+22 then
            onGuiEquipRequest:FireServer("8", "Grips", "1150000Kg")
        end
    elseif SelectedZone == "Zone 9 (Underworld)" then
        if gripstat == 0 or gripstat <= 2.736e+22 then
            onGuiEquipRequest:FireServer("9", "Grips", "875000Kg")
        elseif gripstat == 2.736e+22 or gripstat <= 4.7340000000000005e+22 then
            onGuiEquipRequest:FireServer("9", "Grips", "900000Kg")
        elseif gripstat == 4.7340000000000005e+22 or gripstat <= 6.840000000000001e+22 then
            onGuiEquipRequest:FireServer("9", "Grips", "925000Kg")
        elseif gripstat == 6.840000000000001e+22 or gripstat <= 7.776e+22 then
            onGuiEquipRequest:FireServer("9", "Grips", "950000Kg")
        elseif gripstat == 7.776e+22 or gripstat <= 8.55e+22 then
            onGuiEquipRequest:FireServer("9", "Grips", "975000Kg")
        elseif gripstat == 8.55e+22 or gripstat <= 9.3239999999999999e+22 then
            onGuiEquipRequest:FireServer("9", "Grips", "1000000Kg")
        elseif gripstat == 9.3239999999999999e+22 or gripstat <= 1.008e+23 then
            onGuiEquipRequest:FireServer("9", "Grips", "1025000Kg")
        elseif gripstat == 1.008e+23 or gripstat <= 1.0871999999999999e+23 then
            onGuiEquipRequest:FireServer("9", "Grips", "1050000Kg")
        elseif gripstat == 1.0871999999999999e+23 or gripstat <= 1.161e+23 then
            onGuiEquipRequest:FireServer("9", "Grips", "1075000Kg")
        elseif gripstat == 1.161e+23 or gripstat <= 1.242e+23 then
            onGuiEquipRequest:FireServer("9", "Grips", "1100000Kg")
        elseif gripstat == 1.242e+23 or gripstat <= 1.314e+23 then
            onGuiEquipRequest:FireServer("9", "Grips", "1125000Kg")
        elseif gripstat >= 1.314e+23 then
            onGuiEquipRequest:FireServer("9", "Grips", "1150000Kg")
        end
    elseif SelectedZone == "Zone 10 (Magic Forest)" then
        if gripstat == 0 or gripstat <= 1.5e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "875000Kg")
        elseif gripstat == 1.5e+24 or gripstat <= 2.2e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "900000Kg")
        elseif gripstat == 2.2e+24 or gripstat <= 2.9e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "925000Kg")
        elseif gripstat == 2.9e+24 or gripstat <= 3.5e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "950000Kg")
        elseif gripstat == 3.5e+24 or gripstat <= 4.3e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "975000Kg")
        elseif gripstat == 4.3e+24 or gripstat <= 5.1e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "1000000Kg")
        elseif gripstat == 5.1e+24 or gripstat <= 6e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "1025000Kg")
        elseif gripstat == 6e+24 or gripstat <= 6.8e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "1050000Kg")
        elseif gripstat == 6.8e+24 or gripstat <= 7.7e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "1075000Kg")
        elseif gripstat == 7.7e+24 or gripstat <= 8.5e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "1100000Kg")
        elseif gripstat == 8.5e+24 or gripstat <= 9.999999999999999e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "1125000Kg")
        elseif gripstat >= 9.999999999999999e+24 then
            onGuiEquipRequest:FireServer("10", "Grips", "1150000Kg")
        end

    elseif SelectedZone == "Zone 11 (Snowy Peaks)" then
        if gripstat == 0 or gripstat <= 1.05e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice1")
        elseif gripstat == 1.05e+25 or gripstat <= 1.1e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice2")
        elseif gripstat == 1.1e+25 or gripstat <= 1.2e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice3")
        elseif gripstat == 1.2e+25 or gripstat <= 1.25e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice4")
        elseif gripstat == 1.25e+25 or gripstat <= 1.4e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice5")
        elseif gripstat == 1.4e+25 or gripstat <= 1.45e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice6")
        elseif gripstat == 1.45e+25 or gripstat <= 1.6e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice7")
        elseif gripstat == 1.6e+25 or gripstat <= 1.7999999999999999e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice8")
        elseif gripstat == 1.7999999999999999e+25 or gripstat <= 1.95e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice9")
        elseif gripstat == 1.95e+25 or gripstat <= 2.2e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice10")
        elseif gripstat == 2.2e+25 or gripstat <= 2.5e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice11")
        elseif gripstat >= 2.5e+25 then
            onGuiEquipRequest:FireServer("11", "Grips", "Ice12")
        end

    elseif SelectedZone == "Zone 12 (Dusty Tavern)" then
        if gripstat == 0 or gripstat <= 1.05e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining1")
        elseif gripstat == 1.05e+25 or gripstat <= 1.1e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining2")
        elseif gripstat == 1.1e+25 or gripstat <= 1.2e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining3")
        elseif gripstat == 1.2e+25 or gripstat <= 1.25e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining4")
        elseif gripstat == 1.25e+25 or gripstat <= 1.4e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining5")
        elseif gripstat == 1.4e+25 or gripstat <= 1.45e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining6")
        elseif gripstat == 1.45e+25 or gripstat <= 1.6e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining7")
        elseif gripstat == 1.6e+25 or gripstat <= 1.7999999999999999e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining8")
        elseif gripstat == 1.7999999999999999e+25 or gripstat <= 1.95e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining9")
        elseif gripstat == 1.95e+25 or gripstat <= 2.2e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining10")
        elseif gripstat == 2.2e+25 or gripstat <= 2.5e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining11")
        elseif gripstat >= 2.5e+25 then
            onGuiEquipRequest:FireServer("12", "Grips", "Mining12")
        end

    elseif SelectedZone == "Zone 13 (Lost Kingdom)" then
        if gripstat == 0 or gripstat <= 1.05e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom1")
        elseif gripstat == 1.05e+25 or gripstat <= 1.1e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom2")
        elseif gripstat == 1.1e+25 or gripstat <= 1.2e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom3")
        elseif gripstat == 1.2e+25 or gripstat <= 1.25e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom4")
        elseif gripstat == 1.25e+25 or gripstat <= 1.4e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom5")
        elseif gripstat == 1.4e+25 or gripstat <= 1.45e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom6")
        elseif gripstat == 1.45e+25 or gripstat <= 1.6e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom7")
        elseif gripstat == 1.6e+25 or gripstat <= 1.7999999999999999e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom8")
        elseif gripstat == 1.7999999999999999e+25 or gripstat <= 1.95e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom9")
        elseif gripstat == 1.95e+25 or gripstat <= 2.2e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom10")
        elseif gripstat == 2.2e+25 or gripstat <= 2.5e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom11")
        elseif gripstat >= 2.5e+25 then
            onGuiEquipRequest:FireServer("13", "Grips", "Kingdom12")
        end

    elseif SelectedZone == "Zone 14 (Orc Paradise)" then
        if gripstat == 0 or gripstat <= 1.05e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise1")
        elseif gripstat == 1.05e+25 or gripstat <= 1.1e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise2")
        elseif gripstat == 1.1e+25 or gripstat <= 1.2e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise3")
        elseif gripstat == 1.2e+25 or gripstat <= 1.25e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise4")
        elseif gripstat == 1.25e+25 or gripstat <= 1.4e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise5")
        elseif gripstat == 1.4e+25 or gripstat <= 1.45e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise6")
        elseif gripstat == 1.45e+25 or gripstat <= 1.6e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise7")
        elseif gripstat == 1.6e+25 or gripstat <= 1.7999999999999999e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise8")
        elseif gripstat == 1.7999999999999999e+25 or gripstat <= 1.95e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise9")
        elseif gripstat == 1.95e+25 or gripstat <= 2.2e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise10")
        elseif gripstat == 2.2e+25 or gripstat <= 2.5e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise11")
        elseif gripstat >= 2.5e+25 then
            onGuiEquipRequest:FireServer("14", "Grips", "Paradise12")
        end

    elseif SelectedZone == "Zone 15 (Heavenly Island)" then
        if gripstat == 0 or gripstat <= 1.05e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven1")
        elseif gripstat == 1.05e+25 or gripstat <= 1.1e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven2")
        elseif gripstat == 1.1e+25 or gripstat <= 1.2e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven3")
        elseif gripstat == 1.2e+25 or gripstat <= 1.25e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven4")
        elseif gripstat == 1.25e+25 or gripstat <= 1.4e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven5")
        elseif gripstat == 1.4e+25 or gripstat <= 1.45e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven6")
        elseif gripstat == 1.45e+25 or gripstat <= 1.6e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven7")
        elseif gripstat == 1.6e+25 or gripstat <= 1.7999999999999999e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven8")
        elseif gripstat == 1.7999999999999999e+25 or gripstat <= 1.95e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven9")
        elseif gripstat == 1.95e+25 or gripstat <= 2.2e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven10")
        elseif gripstat == 2.2e+25 or gripstat <= 2.5e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven11")
        elseif gripstat >= 2.5e+25 then
            onGuiEquipRequest:FireServer("15", "Grips", "Heaven12")
        end

    elseif SelectedZone == "Zone 16 (The Rift)" then
        if gripstat == 0 or gripstat <= 2.5e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven1")
        elseif gripstat == 2.5e+25 or gripstat <= 2.6e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven2")
        elseif gripstat == 2.6e+25 or gripstat <= 2.9e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven3")
        elseif gripstat == 2.9e+25 or gripstat <= 3.3e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven4")
        elseif gripstat == 3.3e+25 or gripstat <= 3.7e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven5")
        elseif gripstat == 3.7e+25 or gripstat <= 3.9999999999999995e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven6")
        elseif gripstat == 3.9999999999999995e+25 or gripstat <= 4.3e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven7")
        elseif gripstat == 4.3e+25 or gripstat <= 4.5e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven8")
        elseif gripstat == 4.5e+25 or gripstat <= 5.3e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven9")
        elseif gripstat == 5.3e+25 or gripstat <= 5.8e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven10")
        elseif gripstat == 5.8e+25 or gripstat <= 6.3e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven11")
        elseif gripstat >= 6.3e+25 then
            onGuiEquipRequest:FireServer("16", "Grips", "Heaven12")
        end
    end
end

local function WeightClick()
    onClick:FireServer()
end

local function DataAreaPunch()
    if SelectedZone == "Zone 1 (School)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(-10225.1885, 5.15053797, 114.77298, 0.0419209749, 0, -0.999120951, -0, 1, -0, 0.999120951, 0, 0.0419209749))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(-10225.3047, 5.15053797, 123.505898, -0.124665223, 0, -0.992198944, 0, 1.00000012, -0, 0.992198944, -0, -0.124665223))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(-10228.8115, 5.15053797, 128.500717, -0.641293526, 0, -0.767295718, 0, 1.00000012, -0, 0.767295718, -0, -0.641293526))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(-10233.9277, 5.15053797, 129.869186, -0.942385435, 0, 0.334529191, 0, 1, -0, -0.334529221, 0, -0.942385316))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(-10243.7715, 5.15053797, 130.623001, -0.942408919, 0, 0.334462821, 0, 1, -0, -0.334462821, 0, -0.942408919))
        elseif BagPunchSelected == "Tier6" then
            TPArea(CFrame.new(-10252.374, 5.15053797, 129.984131, -0.920902312, 0, 0.389793485, 0, 1, -0, -0.389793485, 0, -0.920902312))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(-10261.8525, 5.15053797, 130.090988, -0.470817924, 6.91860791e-08, 0.882230401, 5.01210664e-08, 1, -5.16737799e-08, -0.882230401, 1.98893844e-08, -0.470817924))
        end
    elseif SelectedZone == "Zone 2 (Space Gym)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(-10312.9844, -154.949097, 2804.17163, -0.0140013611, 0, 0.99990195, 0, 1, -0, -0.99990207, 0, -0.0140013592))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(-10312.1924, -154.949081, 2795.8855, 0.0397631377, 0, 0.999209166, 0, 1, -0, -0.999209166, 0, 0.0397631377))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(-10311.6865, -154.949066, 2787.02295, -0.138817862, 0, 0.990317941, 0, 1, -0, -0.990317941, 0, -0.138817862))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(-10311.543, -154.949066, 2777.61792, -0.0653384775, 0, 0.997863114, 0, 1, -0, -0.997863233, 0, -0.06533847))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(-10311.8906, -154.949097, 2767.55933, 0.0101079652, 0, 0.999948859, 0, 1, -0, -0.999948978, 0, 0.0101079643))
        elseif BagPunchSelected == "Tier6" then
            TPArea(CFrame.new(-10310.9521, -154.949097, 2758.55029, 0.111349232, 0, 0.993781388, 0, 1.00000012, -0, -0.993781388, 0, 0.111349232))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(-10311.2705, -154.949066, 2750.12451, 0.266251743, 0, 0.963903546, 0, 1, -0, -0.963903546, 0, 0.266251743))
        end
    elseif SelectedZone == "Zone 3 (Beach)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(11558.6582, 9.88073826, 125.84948, -0.217357725, 0, 0.9760921, 0, 1.00000012, -0, -0.976091981, 0, -0.217357755))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(11557.7197, 9.88073826, 118.182503, -0.0782098621, 0, 0.996936917, 0, 1, -0, -0.996936917, 0, -0.0782098621))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(11557.2344, 9.88073826, 110.129379, -0.103174299, 0, 0.994663358, 0, 1.00000012, -0, -0.994663358, 0, -0.103174299))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(11557.3457, 9.88073826, 101.352608, 0.102762975, 0, 0.994705856, 0, 1.00000012, -0, -0.994705975, 0, 0.10276296))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(11557.1123, 9.88074017, 91.1643753, -0.161527604, 0, 0.986868203, 0, 1, -0, -0.986868203, 0, -0.161527604))
        elseif BagPunchSelected == "Tier6" then
            TPArea(CFrame.new(11555.7783, 9.88073826, 81.3701096, -0.338747054, 0, 0.940877497, 0, 1, -0, -0.940877497, 0, -0.338747054))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(11557.9404, 9.8804121, 80.235672, -0.393749058, 0, 0.919217944, 0, 1, -0, -0.919217944, 0, -0.393749058))
        end
    elseif SelectedZone == "Zone 4 (Bunker)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(-10360.6553, 6.23877478, -888.147583, 0.867073357, 0, 0.498180538, 0, 1, -0, -0.498180598, 0, 0.867073238))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(-10355.1855, 6.23877478, -894.127075, 0.954581916, 0, 0.297948867, 0, 1, -0, -0.297948897, 0, 0.954581797))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(-10346.0654, 5.95642185, -896.915283, 0.799118578, 0, 0.601173401, 0, 1, -0, -0.601173401, 0, 0.799118578))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(-10342.0059, 6.23877478, -903.461853, 0.960983276, 0, 0.27660647, 0, 1, -0, -0.27660647, 0, 0.960983276))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(-10334.957, 6.23877478, -909.604004, 0.783549249, 7.21945099e-08, 0.621329665, -1.41132661e-08, 1, -9.83955459e-08, -0.621329665, 6.83287666e-08, 0.783549249))
        end
    elseif SelectedZone == "Zone 6 (Void)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(428.126343, 40.2590561, -137.544189, -0.993069947, 0, -0.117525138, 0, 1.00000012, -0, 0.117525138, -0, -0.993069947))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(416.100769, 40.2590561, -135.599548, -0.989562273, 0, 0.144106343, 0, 1, -0, -0.144106358, 0, -0.989562154))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(402.214172, 40.2590561, -135.935806, -0.992473662, 0, -0.122458838, 0, 1.00000012, -0, 0.122458838, -0, -0.992473662))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(389.887787, 40.2590561, -137.885193, -0.983317912, 0, 0.181895196, 0, 1, -0, -0.181895196, 0, -0.983317912))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(383.9758, 40.2590599, -144.226501, 0.0482875444, 0, 0.998833537, 0, 1.00000012, -0, -0.998833537, 0, 0.0482875444))
        elseif BagPunchSelected == "Tier6" then
            TPArea(CFrame.new(384.490723, 40.2590561, -158.568741, 0.119142972, 0, 0.992877066, 0, 1, -0, -0.992877185, 0, 0.119142957))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(384.531067, 40.2590561, -173.923935, -0.0110860635, 0, 0.999938548, 0, 1, -0, -0.999938548, 0, -0.0110860635))
        end
    elseif SelectedZone == "Zone 7 (Space Center)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(-9709.16895, 46.9589653, 515.433777, 0.117800578, 0, 0.993037283, 0, 1, -0, -0.993037283, 0, 0.117800578))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(-9708.99805, 46.9589653, 494.919067, 0.0281911753, 0, 0.999602556, 0, 1, -0, -0.999602556, 0, 0.0281911753))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(-9708.55469, 46.9589653, 474.15799, 0.977341592, 2.68517031e-09, 0.211668208, 3.57621599e-09, 1, -2.91983149e-08, -0.211668208, 2.92936981e-08, 0.977341592))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(-9700.11523, 46.9589653, 460.796753, 0.743226886, 0, -0.669039488, -0, 1, -0, 0.669039488, 0, 0.743226886))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(-9682.22656, 46.9589767, 460.730377, 0.834624588, 0, -0.550819159, -0, 0.99999994, -0, 0.550819159, 0, 0.834624588))
        elseif BagPunchSelected == "Tier6" then
            TPArea(CFrame.new(-9662.43555, 46.9589691, 462.22464, 0.933089256, 0, 0.359644979, 0, 1.00000012, -0, -0.359644979, 0, 0.933089256))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(-9646.5293, 46.9589653, 460.563263, 0.964431822, 0, -0.264331937, -0, 1.00000012, -0, 0.264331937, 0, 0.964431822))
        end
    elseif SelectedZone == "Zone 8 (Roman Empire)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(-1562.02966, 47.7637024, 6.22029686, -0.828873873, -4.24696829e-08, 0.559435487, -8.47698232e-08, 1, -4.96818835e-08, -0.559435487, -8.86032652e-08, -0.828873873))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(-1562.65491, 47.7636909, -1.44569683, 0.24394539, 0, 0.969789028, 0, 1.00000012, -0, -0.969789028, 0, 0.24394539))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(-1562.41321, 47.7636909, -11.2723103, -0.15126887, 0, 0.988492668, 0, 1, -0, -0.988492668, 0, -0.15126887))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(-1560.91187, 47.7636909, -20.9894753, -0.305013329, 0, 0.952348113, 0, 1, -0, -0.952348113, 0, -0.305013329))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(-1561.73645, 47.7636909, -29.869421, -0.493594676, 0, 0.869692087, 0, 1, -0, -0.869692087, 0, -0.493594676))
        elseif BagPunchSelected == "Tier6" then
            TPArea(CFrame.new(-1559.49524, 47.7637024, -38.8936501, -0.914466918, -2.64521098e-08, 0.404660642, -3.32189103e-08, 1, -9.70068736e-09, -0.404660642, -2.23133441e-08, -0.914466918))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(-1560.82715, 47.7636909, -48.2506523, -0.0290641747, 0, 0.999577463, 0, 0.99999994, -0, -0.999577582, 0, -0.029064171))
        end
    elseif SelectedZone == "Zone 9 (Underworld)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(-12373.4277, 71.6354828, 1317.09814, 0.99847579, 0, 0.0551929176, 0, 1, -0, -0.055192925, 0, 0.998475671))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(-12367.1406, 71.6004944, 1318.70337, 0.983754694, 0, -0.179518223, -0, 1.00000012, -0, 0.179518223, 0, 0.983754694))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(-12358.1396, 71.6354752, 1317.59583, 0.938703358, 0, 0.344726026, 0, 1, -0, -0.344726026, 0, 0.938703358))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(-12351.6816, 71.6354752, 1317.86304, 0.991702497, 0, 0.128554031, 0, 1, -0, -0.128554031, 0, 0.991702497))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(-12344.8105, 71.6354752, 1318.04651, 0.996965051, 0, 0.0778509751, 0, 1.00000012, -0, -0.0778509751, 0, 0.996965051))
        elseif BagPunchSelected == "Tier6" then
            TPArea(CFrame.new(-12338.1982, 71.5655136, 1318.87024, 0.998851895, 0, -0.0479071885, -0, 1.00000012, -0, 0.047907196, 0, 0.998851776))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(-12330.7988, 71.6354752, 1318.27502, 0.989132702, 0, 0.147025809, 0, 0.99999994, -0, -0.147025824, 0, 0.989132583))
        end
    elseif SelectedZone == "Zone 10 (Magic Forest)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(-6145.56006, -96.0125732, -1492.05005, -0.992135465, 0, -0.125168845, 0, 1, -0, 0.125168845, -0, -0.992135465))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(-6151.93359, -96.0475616, -1491.81128, -0.999852359, 0, 0.0171877816, 0, 1, -0, -0.0171877835, 0, -0.99985224))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(-6160.08691, -96.0825348, -1491.55298, -0.999306202, 0, 0.0372449532, 0, 0.99999994, -0, -0.0372449569, 0, -0.999306083))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(-6168.3833, -96.0825348, -1491.44812, -0.999502778, 0, -0.0315319486, 0, 1, -0, 0.0315319486, -0, -0.999502778))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(-6176.55957, -96.0825348, -1491.34436, -0.999725223, 0, -0.0234416425, 0, 1, -0, 0.0234416425, -0, -0.999725223))
        elseif BagPunchSelected == "Tier6" then
            TPArea(CFrame.new(-6184.63525, -96.0825348, -1489.90881, -0.99895972, 0, -0.0456031673, 0, 1, -0, 0.045603171, -0, -0.998959601))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(-6191.79834, -96.0825348, -1488.75085, 0.360560894, -2.24419905e-09, 0.932735682, -1.90545784e-08, 1, 9.77183046e-09, -0.932735682, -2.12962252e-08, 0.360560894))
        end

    elseif SelectedZone == "Zone 11 (Snowy Peaks)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(1675.96362, -8.37515545, 2156.54492, 0.902372301, 0, -0.430957526, -0, 1.00000012, -0, 0.430957586, 0, 0.902372181))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(1683.53333, -8.37515545, 2159.3689, 0.790528119, 0, -0.612425864, -0, 1.00000012, -0, 0.612425923, 0, 0.790527999))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(1694.11938, -8.37515354, 2161.70996, 0.836271584, 0, -0.548315525, -0, 1.00000012, -0, 0.548315525, 0, 0.836271584))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(1702.93567, -8.37515545, 2164.92871, 0.815602183, 0, -0.578613162, -0, 1.00000012, -0, 0.578613162, 0, 0.815602183))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(1710.94727, -8.37515545, 2169.18896, 0.761875272, 0, -0.647723794, -0, 1, -0, 0.647723794, 0, 0.761875272))
        elseif BagPunchSelected == "Tier6" then
            TPArea(CFrame.new(1719.70874, -8.37515545, 2172.68237, 0.804367423, 0, -0.594132245, -0, 1, -0, 0.594132304, 0, 0.804367304))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(1729.72485, -8.37515831, 2176.01562, 0.409520894, -2.14058588e-07, -0.912300766, 1.56437409e-07, 1, -1.64413109e-07, 0.912300766, -7.53873621e-08, 0.409520894))
        end

    elseif SelectedZone == "Zone 12 (Dusty Tavern)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(2975.7002, -3.12988043, -3893.54565, -0.981103122, 0, -0.193485513, 0, 1, -0, 0.193485513, -0, -0.981103122))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(2964.32251, -3.12988043, -3889.89087, -0.981720269, 0, -0.19032985, 0, 1, -0, 0.19032988, -0, -0.98172015))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(2952.46875, -3.12988043, -3887.46631, -0.968761265, 0, -0.247995555, 0, 1.00000012, -0, 0.247995585, -0, -0.968761146))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(2942.28833, -3.12988043, -3883.55859, -0.972948849, 0, -0.231020719, 0, 1, -0, 0.231020719, -0, -0.972948849))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(2931.00586, -3.12987995, -3881.18262, -0.97906369, 0, -0.203554377, 0, 1, -0, 0.203554407, -0, -0.97906357))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(2921.15308, -3.12987995, -3877.98145, -0.989313841, -2.50694256e-08, 0.145801634, -3.38416264e-08, 1, -5.76849715e-08, -0.145801634, -6.20027052e-08, -0.989313841))
        end

    elseif SelectedZone == "Zone 13 (Lost Kingdom)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(2883.69385, 1.49053204, 574.641479, -0.999920785, 0, -0.0125937071, 0, 1, -0, 0.0125937089, -0, -0.999920666))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(2873.82373, 1.49053204, 574.340759, -0.998228192, 0, 0.059502285, 0, 1.00000012, -0, -0.059502285, 0, -0.998228192))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(2865.50537, 1.49053228, 575.482727, -0.954454303, 0, 0.298357189, 0, 1, -0, -0.298357189, 0, -0.954454303))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(2855.67554, 1.49053204, 575.076172, -0.999964595, 0, -0.00842210278, 0, 1, -0, 0.00842210371, -0, -0.999964476))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(2846.53027, 1.49053204, 574.692749, -0.991879404, 0, 0.127182841, 0, 1.00000012, -0, -0.127182856, 0, -0.991879284))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(2838.22852, 1.49053216, 574.567993, -0.508367062, 3.00500669e-09, 0.86114049, 5.90910165e-09, 1, -1.17745082e-12, -0.86114049, 5.08796827e-09, -0.508367062))
        end

    elseif SelectedZone == "Zone 14 (Orc Paradise)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(-438.425415, 71.4885712, 3228.90723, -0.891522169, 0, 0.45297718, 0, 1.00000012, -0, -0.45297718, 0, -0.891522169))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(-448.34671, 71.4885712, 3226.71851, -0.882656693, 0, 0.470018268, 0, 1, -0, -0.470018268, 0, -0.882656693))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(-459.32666, 71.4885635, 3224.23096, -0.934073925, 0, 0.357079864, 0, 1, -0, -0.357079893, 0, -0.934073806))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(-468.438538, 71.4885712, 3220.56274, -0.944450796, 0, 0.328652829, 0, 1, -0, -0.328652829, 0, -0.944450796))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(-478.139679, 71.4885712, 3217.65601, -0.968081772, 0, 0.250634938, 0, 1.00000012, -0, -0.250634968, 0, -0.968081653))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(-486.463348, 71.4885788, 3216.08032, -0.91034019, 1.19643504e-08, 0.413860738, 4.08833749e-08, 1, 6.10191506e-08, -0.413860738, 7.2468211e-08, -0.91034019))
        end

    elseif SelectedZone == "Zone 15 (Heavenly Island)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(-843.63147, 67.6951828, -5262.11377, -0.540441513, 0, -0.84138155, 0, 1, -0, 0.84138155, -0, -0.540441513))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(-848.138611, 67.6951752, -5251.13037, -0.414766282, 0, -0.909928024, 0, 1.00000012, -0, 0.909928024, -0, -0.414766282))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(-854.029236, 67.6951828, -5240.26074, -0.525166869, 0, -0.850999296, 0, 1.00000012, -0, 0.850999415, -0, -0.52516681))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(-859.495789, 67.6951828, -5230.18799, -0.54235518, 0, -0.840149343, 0, 1, -0, 0.840149343, -0, -0.54235518))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(-863.956787, 67.6951752, -5219.25537, -0.471052527, 0, -0.882105172, 0, 1, -0, 0.882105172, -0, -0.471052527))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(-868.671448, 67.6951828, -5209.4585, -0.315498471, 6.26630436e-09, -0.948926091, 2.25653434e-08, 1, -8.98939423e-10, 0.948926091, -2.16964562e-08, -0.315498471))
        end

    elseif SelectedZone == "Zone 16 (The Rift)" then
        if BagPunchSelected == "Tier1" then
            TPArea(CFrame.new(-439.903107, -12.8557758, 761.22876, 0.275226682, 0, -0.961379349, -0, 1, -0, 0.961379349, 0, 0.275226682))
        elseif BagPunchSelected == "Tier2" then
            TPArea(CFrame.new(-433.697296, -12.8557758, 768.474182, 0.617868841, 0, -0.786281168, -0, 1, -0, 0.786281168, 0, 0.617868841))
        elseif BagPunchSelected == "Tier3" then
            TPArea(CFrame.new(-428.270813, -12.8557768, 774.812805, 0.533799827, 0, -0.845610857, -0, 1, -0, 0.845610857, 0, 0.533799827))
        elseif BagPunchSelected == "Tier4" then
            TPArea(CFrame.new(-421.922485, -12.8557758, 779.55249, 0.396557152, 0, -0.918009996, -0, 1, -0, 0.918010116, 0, 0.396557093))
        elseif BagPunchSelected == "Tier5" then
            TPArea(CFrame.new(-417.187225, -12.8557758, 787.157837, 0.711408854, 0, -0.702778399, -0, 1, -0, 0.702778399, 0, 0.711408854))
        elseif BagPunchSelected == "VIP" then
            TPArea(CFrame.new(-412.764526, -12.8557758, 792.086609, 0.352967829, -1.79194526e-08, -0.935635448, -2.73474878e-08, 1, -2.94689944e-08, 0.935635448, 3.59888865e-08, 0.352967829))
        end
    end
end


local function CheckPunch()
    local stat1 = PlayerStat.Biceps.Value
    local stat2 = PlayerStat.Hands.Value
    local stat3 = PlayerStat.Knuckles.Value
    local totalstat = stat1 + stat2 + stat3
    if SelectedZone == "Zone 1 (School)" then
        if totalstat == 0 or totalstat <= 400 then
            TPArea(CFrame.new(-10224.6982, 5.15053797, 113.17659, -0.519135237, 0, -0.854692101, 0, 1, -0, 0.854692221, -0, -0.519135177))
            onGiveStats:FireServer("1", "Tier1")
        elseif totalstat == 400 or totalstat <= 3000 then
            TPArea(CFrame.new(-10226.5186, 5.15053797, 123.771912, -0.0155829815, 0, -0.999878585, 0, 1, -0, 0.999878585, -0, -0.0155829815))
            onGiveStats:FireServer("1", "Tier2")
        elseif totalstat == 3000 or totalstat <= 15000 then
            TPArea(CFrame.new(-10227.5752, 5.15053797, 128.306076, -0.786992908, 0, -0.616962135, 0, 1.00000012, -0, 0.616962135, -0, -0.786992908))
            onGiveStats:FireServer("1", "Tier3")
        elseif totalstat == 15000 or totalstat <= 38900 then
            TPArea(CFrame.new(-10234.5283, 5.15053797, 130.125748, -0.988179982, 0, 0.153298795, 0, 1.00000012, -0, -0.15329881, 0, -0.988179862))
            onGiveStats:FireServer("1", "Tier4")
        elseif totalstat == 38900 or totalstat <= 100000 then
            TPArea(CFrame.new(-10244.6602, 5.15053797, 130.682388, -0.99505651, 0, -0.0993106812, 0, 0.99999994, -0, 0.0993106961, -0, -0.995056391))
            onGiveStats:FireServer("1", "Tier5")
        elseif totalstat >= 100000 then
            TPArea(CFrame.new(-10253.0537, 5.15053797, 129.890686, -0.98821795, 0, 0.153053313, 0, 1, -0, -0.153053313, 0, -0.98821795))
            onGiveStats:FireServer("1", "Tier6")
        end
    elseif SelectedZone == "Zone 2 (Space Gym)" then
        if totalstat == 0 or totalstat <= 300000 then
            TPArea(CFrame.new(-10312.9844, -154.949097, 2804.17163, -0.0140013611, 0, 0.99990195, 0, 1, -0, -0.99990207, 0, -0.0140013592))
            onGiveStats:FireServer("2", "Tier1")
        elseif totalstat == 300000 or totalstat <= 750000 then
            TPArea(CFrame.new(-10312.1924, -154.949081, 2795.8855, 0.0397631377, 0, 0.999209166, 0, 1, -0, -0.999209166, 0, 0.0397631377))
            onGiveStats:FireServer("2", "Tier2")
        elseif totalstat == 750000 or totalstat <= 1250000 then
            TPArea(CFrame.new(-10311.6865, -154.949066, 2787.02295, -0.138817862, 0, 0.990317941, 0, 1, -0, -0.990317941, 0, -0.138817862))
            onGiveStats:FireServer("2", "Tier3")
        elseif totalstat == 1250000 or totalstat <= 2300000 then
            TPArea(CFrame.new(-10311.543, -154.949066, 2777.61792, -0.0653384775, 0, 0.997863114, 0, 1, -0, -0.997863233, 0, -0.06533847))
            onGiveStats:FireServer("2", "Tier4")
        elseif totalstat == 2300000 or totalstat <= 3750000 then
            TPArea(CFrame.new(-10311.8906, -154.949097, 2767.55933, 0.0101079652, 0, 0.999948859, 0, 1, -0, -0.999948978, 0, 0.0101079643))
            onGiveStats:FireServer("2", "Tier5")
        elseif totalstat >= 3750000 then
            TPArea(CFrame.new(-10310.9521, -154.949097, 2758.55029, 0.111349232, 0, 0.993781388, 0, 1.00000012, -0, -0.993781388, 0, 0.111349232))
            onGiveStats:FireServer("2", "Tier6")
        end
    elseif SelectedZone == "Zone 3 (Beach)" then
        if totalstat == 0 or totalstat <= 6750000 then
            TPArea(CFrame.new(11558.6787, 9.88073826, 127.701035, 0.388837308, 0, 0.921306431, 0, 1, -0, -0.921306431, 0, 0.388837308))
            onGiveStats:FireServer("3", "Tier1")
        elseif totalstat == 6750000 or totalstat <= 12000000 then
            TPArea(CFrame.new(11556.3896, 9.88073826, 117.506966, -0.56194371, 0, 0.827175498, 0, 1, -0, -0.827175498, 0, -0.56194371))
            onGiveStats:FireServer("3", "Tier2")
        elseif totalstat == 12000000 or totalstat <= 20400000 then
            TPArea(CFrame.new(11556.0283, 9.88073826, 109.48912, -0.496633857, 0, 0.867960155, 0, 1, -0, -0.867960155, 0, -0.496633857))
            onGiveStats:FireServer("3", "Tier3")
        elseif totalstat == 20400000 or totalstat <= 40800000 then
            TPArea(CFrame.new(11555.6895, 9.88073826, 101.532738, 0.341993362, 0, 0.939702332, 0, 1, -0, -0.939702451, 0, 0.341993332))
            onGiveStats:FireServer("3", "Tier4")
        elseif totalstat == 40800000 or totalstat <= 81600000 then
            TPArea(CFrame.new(11555.208, 9.88073826, 90.8077087, -0.489960104, 0, 0.871744931, 0, 1.00000012, -0, -0.871744931, 0, -0.489960104))
            onGiveStats:FireServer("3", "Tier5")
        elseif totalstat >= 81600000 then
            TPArea(CFrame.new(11554.8125, 9.88073826, 81.8547592, -0.282327443, 0, 0.959318101, 0, 1, -0, -0.959318101, 0, -0.282327443))
            onGiveStats:FireServer("3", "Tier6")
        end
    elseif SelectedZone == "Zone 4 (Bunker)" then
        if totalstat == 0 or totalstat <= 302400000 then
            TPArea(CFrame.new(-10360.8809, 6.23877525, -889.909973, 0.719137967, 0, 0.694867432, 0, 1.00000012, -0, -0.694867432, 0, 0.719137967))
            onGiveStats:FireServer("4", "Tier1")
        elseif totalstat == 302400000 or totalstat <= 1512000000 then
            TPArea(CFrame.new(-10354.0449, 6.23877478, -894.323853, 0.668553412, 0, 0.743664145, 0, 1, -0, -0.743664145, 0, 0.668553412))
            onGiveStats:FireServer("4", "Tier2")
        elseif totalstat == 1512000000 or totalstat <= 7560000000 then
            TPArea(CFrame.new(-10347.4297, 6.23877478, -898.982117, 0.756246209, 0, 0.654287219, 0, 1.00000012, -0, -0.654287219, 0, 0.756246209))
            onGiveStats:FireServer("4", "Tier3")
        elseif totalstat >= 7560000000 then
            TPArea(CFrame.new(-10341.8145, 6.23877478, -904.149902, 0.909319699, 0, 0.416098177, 0, 1, -0, -0.416098177, 0, 0.909319699))
            onGiveStats:FireServer("4", "Tier4")
        end
    elseif SelectedZone == "Zone 6 (Void)" then
        if totalstat == 0 or totalstat <= 2.16e+19 then
            TPArea(CFrame.new(428.126343, 40.2590561, -137.544189, -0.993069947, 0, -0.117525138, 0, 1.00000012, -0, 0.117525138, -0, -0.993069947))
            onGiveStats:FireServer("6", "Tier1")
        elseif totalstat == 2.16e+19 or totalstat <= 2.7e+19 then
            TPArea(CFrame.new(416.100769, 40.2590561, -135.599548, -0.989562273, 0, 0.144106343, 0, 1, -0, -0.144106358, 0, -0.989562154))
            onGiveStats:FireServer("6", "Tier2")
        elseif totalstat == 2.7e+19 or totalstat <= 3.6e+19 then
            TPArea(CFrame.new(402.214172, 40.2590561, -135.935806, -0.992473662, 0, -0.122458838, 0, 1.00000012, -0, 0.122458838, -0, -0.992473662))
            onGiveStats:FireServer("6", "Tier3")
        elseif totalstat == 3.6e+19 or totalstat <= 4.5e+19 then
            TPArea(CFrame.new(389.887787, 40.2590561, -137.885193, -0.983317912, 0, 0.181895196, 0, 1, -0, -0.181895196, 0, -0.983317912))
            onGiveStats:FireServer("6", "Tier4")
        elseif totalstat == 4.5e+19 or totalstat <= 5.4e+19 then
            TPArea(CFrame.new(383.9758, 40.2590599, -144.226501, 0.0482875444, 0, 0.998833537, 0, 1.00000012, -0, -0.998833537, 0, 0.0482875444))
            onGiveStats:FireServer("6", "Tier5")
        elseif totalstat >= 5.4e+19 then
            TPArea(CFrame.new(384.490723, 40.2590561, -158.568741, 0.119142972, 0, 0.992877066, 0, 1, -0, -0.992877185, 0, 0.119142957))
            onGiveStats:FireServer("6", "Tier6")
        end
    elseif SelectedZone == "Zone 7 (Space Center)" then
        if totalstat == 0 or totalstat <= 63000000000000000000 then
            TPArea(CFrame.new(-9709.16895, 46.9589653, 515.433777, 0.117800578, 0, 0.993037283, 0, 1, -0, -0.993037283, 0, 0.117800578))
            onGiveStats:FireServer("7", "Tier1")
        elseif totalstat == 63000000000000000000 or totalstat <= 72000000000000000000 then
            TPArea(CFrame.new(-9708.99805, 46.9589653, 494.919067, 0.0281911753, 0, 0.999602556, 0, 1, -0, -0.999602556, 0, 0.0281911753))
            onGiveStats:FireServer("7", "Tier2")
        elseif totalstat == 72000000000000000000 or totalstat <= 81000000000000000000 then
            TPArea(CFrame.new(-9708.55469, 46.9589653, 474.15799, 0.977341592, 2.68517031e-09, 0.211668208, 3.57621599e-09, 1, -2.91983149e-08, -0.211668208, 2.92936981e-08, 0.977341592))
            onGiveStats:FireServer("7", "Tier3")
        elseif totalstat == 81000000000000000000 or totalstat <= 90000000000000000000 then
            TPArea(CFrame.new(-9700.11523, 46.9589653, 460.796753, 0.743226886, 0, -0.669039488, -0, 1, -0, 0.669039488, 0, 0.743226886))
            onGiveStats:FireServer("7", "Tier4")
        elseif totalstat == 90000000000000000000 or totalstat <= 99000000000000000000 then
            TPArea(CFrame.new(-9682.22656, 46.9589767, 460.730377, 0.834624588, 0, -0.550819159, -0, 0.99999994, -0, 0.550819159, 0, 0.834624588))
            onGiveStats:FireServer("7", "Tier5")
        elseif totalstat >= 99000000000000000000 then
            TPArea(CFrame.new(-9662.43555, 46.9589691, 462.22464, 0.933089256, 0, 0.359644979, 0, 1.00000012, -0, -0.359644979, 0, 0.933089256))
            onGiveStats:FireServer("7", "Tier6")
        end
    elseif SelectedZone == "Zone 8 (Roman Empire)" then
        if totalstat == 0 or totalstat <= 2.2e+22 then
            TPArea(CFrame.new(-1562.02966, 47.7637024, 6.22029686, -0.828873873, -4.24696829e-08, 0.559435487, -8.47698232e-08, 1, -4.96818835e-08, -0.559435487, -8.86032652e-08, -0.828873873))
            onGiveStats:FireServer("8", "Tier1")
        elseif totalstat == 2.2e+22 or totalstat <= 3.8e+22 then
            TPArea(CFrame.new(-1562.65491, 47.7636909, -1.44569683, 0.24394539, 0, 0.969789028, 0, 1.00000012, -0, -0.969789028, 0, 0.24394539))
            onGiveStats:FireServer("8", "Tier2")
        elseif totalstat == 3.8e+22 or totalstat <= 4.5e+22 then
            TPArea(CFrame.new(-1562.41321, 47.7636909, -11.2723103, -0.15126887, 0, 0.988492668, 0, 1, -0, -0.988492668, 0, -0.15126887))
            onGiveStats:FireServer("8", "Tier3")
        elseif totalstat == 4.5e+22 or totalstat <= 6.1e+22 then
            TPArea(CFrame.new(-1560.91187, 47.7636909, -20.9894753, -0.305013329, 0, 0.952348113, 0, 1, -0, -0.952348113, 0, -0.305013329))
            onGiveStats:FireServer("8", "Tier4")
        elseif totalstat == 6.1e+22 or totalstat <= 7e+22 then
            TPArea(CFrame.new(-1561.73645, 47.7636909, -29.869421, -0.493594676, 0, 0.869692087, 0, 1, -0, -0.869692087, 0, -0.493594676))
            onGiveStats:FireServer("8", "Tier5")
        elseif totalstat >= 7e+22 then
            TPArea(CFrame.new(-1559.49524, 47.7637024, -38.8936501, -0.914466918, -2.64521098e-08, 0.404660642, -3.32189103e-08, 1, -9.70068736e-09, -0.404660642, -2.23133441e-08, -0.914466918))
            onGiveStats:FireServer("8", "Tier6")
        end
    elseif SelectedZone == "Zone 9 (Underworld)" then
        if totalstat == 0 or totalstat <= 2.64e+22 then
            TPArea(CFrame.new(-12373.4277, 71.6354828, 1317.09814, 0.99847579, 0, 0.0551929176, 0, 1, -0, -0.055192925, 0, 0.998475671))
            onGiveStats:FireServer("9", "Tier1")
        elseif totalstat == 2.64e+22 or totalstat <= 5.700000000000001e+22 then
            TPArea(CFrame.new(-12367.1406, 71.6004944, 1318.70337, 0.983754694, 0, -0.179518223, -0, 1.00000012, -0, 0.179518223, 0, 0.983754694))
            onGiveStats:FireServer("9", "Tier2")
        elseif totalstat == 5.700000000000001e+22 or totalstat <= 8.1e+22 then
            TPArea(CFrame.new(-12358.1396, 71.6354752, 1317.59583, 0.938703358, 0, 0.344726026, 0, 1, -0, -0.344726026, 0, 0.938703358))
            onGiveStats:FireServer("9", "Tier3")
        elseif totalstat == 8.1e+22 or totalstat <= 1.4029999999999999e+23 then
            TPArea(CFrame.new(-12351.6816, 71.6354752, 1317.86304, 0.991702497, 0, 0.128554031, 0, 1, -0, -0.128554031, 0, 0.991702497))
            onGiveStats:FireServer("9", "Tier4")
        elseif totalstat == 1.4029999999999999e+23 or totalstat <= 1.82e+23 then
            TPArea(CFrame.new(-12344.8105, 71.6354752, 1318.04651, 0.996965051, 0, 0.0778509751, 0, 1.00000012, -0, -0.0778509751, 0, 0.996965051))
            onGiveStats:FireServer("9", "Tier5")
        elseif totalstat >= 1.82e+23 then
            TPArea(CFrame.new(-12338.1982, 71.5655136, 1318.87024, 0.998851895, 0, -0.0479071885, -0, 1.00000012, -0, 0.047907196, 0, 0.998851776))
            onGiveStats:FireServer("9", "Tier6")
        end
    elseif SelectedZone == "Zone 10 (Magic Forest)" then
        if totalstat == 0 or totalstat <= 1e+24 then
            TPArea(CFrame.new(-6145.56006, -96.0125732, -1492.05005, -0.992135465, 0, -0.125168845, 0, 1, -0, 0.125168845, -0, -0.992135465))
            onGiveStats:FireServer("10", "Tier1")
        elseif totalstat == 1e+24 or totalstat <= 2.3e+24 then
            TPArea(CFrame.new(-6151.93359, -96.0475616, -1491.81128, -0.999852359, 0, 0.0171877816, 0, 1, -0, -0.0171877835, 0, -0.99985224))
            onGiveStats:FireServer("10", "Tier2")
        elseif totalstat == 2.3e+24 or totalstat <= 4e+24 then
            TPArea(CFrame.new(-6160.08691, -96.0825348, -1491.55298, -0.999306202, 0, 0.0372449532, 0, 0.99999994, -0, -0.0372449569, 0, -0.999306083))
            onGiveStats:FireServer("10", "Tier3")
        elseif totalstat == 4e+24 or totalstat <= 4.9e+24 then
            TPArea(CFrame.new(-6168.3833, -96.0825348, -1491.44812, -0.999502778, 0, -0.0315319486, 0, 1, -0, 0.0315319486, -0, -0.999502778))
            onGiveStats:FireServer("10", "Tier4")
        elseif totalstat == 4.9e+24 or totalstat <= 5.5e+24 then
            TPArea(CFrame.new(-6176.55957, -96.0825348, -1491.34436, -0.999725223, 0, -0.0234416425, 0, 1, -0, 0.0234416425, -0, -0.999725223))
            onGiveStats:FireServer("10", "Tier5")
        elseif totalstat >= 5.5e+24 then
            TPArea(CFrame.new(-6184.63525, -96.0825348, -1489.90881, -0.99895972, 0, -0.0456031673, 0, 1, -0, 0.045603171, -0, -0.998959601))
            onGiveStats:FireServer("10", "Tier6")
        end
    
    elseif SelectedZone == "Zone 11 (Snowy Peaks)" then
        if totalstat == 0 or totalstat <= 7e+24 then
            TPArea(CFrame.new(1675.96362, -8.37515545, 2156.54492, 0.902372301, 0, -0.430957526, -0, 1.00000012, -0, 0.430957586, 0, 0.902372181))
            onGiveStats:FireServer("11", "Tier1")
        elseif totalstat == 7e+24 or totalstat <= 8.5e+24 then
            TPArea(CFrame.new(1683.53333, -8.37515545, 2159.3689, 0.790528119, 0, -0.612425864, -0, 1.00000012, -0, 0.612425923, 0, 0.790527999))
            onGiveStats:FireServer("11", "Tier2")
        elseif totalstat == 8.5e+24 or totalstat <= 9.999999999999999e+24 then
            TPArea(CFrame.new(1694.11938, -8.37515354, 2161.70996, 0.836271584, 0, -0.548315525, -0, 1.00000012, -0, 0.548315525, 0, 0.836271584))
            onGiveStats:FireServer("11", "Tier3")
        elseif totalstat == 9.999999999999999e+24 or totalstat <= 1.2e+25 then
            TPArea(CFrame.new(1702.93567, -8.37515545, 2164.92871, 0.815602183, 0, -0.578613162, -0, 1.00000012, -0, 0.578613162, 0, 0.815602183))
            onGiveStats:FireServer("11", "Tier4")
        elseif totalstat == 1.2e+25 or totalstat <= 1.35e+25 then
            TPArea(CFrame.new(1710.94727, -8.37515545, 2169.18896, 0.761875272, 0, -0.647723794, -0, 1, -0, 0.647723794, 0, 0.761875272))
            onGiveStats:FireServer("11", "Tier5")
        elseif totalstat >= 1.35e+25 then
            TPArea(CFrame.new(1719.70874, -8.37515545, 2172.68237, 0.804367423, 0, -0.594132245, -0, 1, -0, 0.594132304, 0, 0.804367304))
            onGiveStats:FireServer("11", "Tier6")
        end
    
    elseif SelectedZone == "Zone 12 (Dusty Tavern)" then
        if totalstat == 0 or totalstat <= 7e+24 then
            TPArea(CFrame.new(2975.7002, -3.12988043, -3893.54565, -0.981103122, 0, -0.193485513, 0, 1, -0, 0.193485513, -0, -0.981103122))
            onGiveStats:FireServer("12", "Tier1")
        elseif totalstat == 7e+24 or totalstat <= 8.5e+24 then
            TPArea(CFrame.new(2964.32251, -3.12988043, -3889.89087, -0.981720269, 0, -0.19032985, 0, 1, -0, 0.19032988, -0, -0.98172015))
            onGiveStats:FireServer("12", "Tier2")
        elseif totalstat == 8.5e+24 or totalstat <= 9.999999999999999e+24 then
            TPArea(CFrame.new(2952.46875, -3.12988043, -3887.46631, -0.968761265, 0, -0.247995555, 0, 1.00000012, -0, 0.247995585, -0, -0.968761146))
            onGiveStats:FireServer("12", "Tier3")
        elseif totalstat == 9.999999999999999e+24 or totalstat <= 1.2e+25 then
            TPArea(CFrame.new(2942.28833, -3.12988043, -3883.55859, -0.972948849, 0, -0.231020719, 0, 1, -0, 0.231020719, -0, -0.972948849))
            onGiveStats:FireServer("12", "Tier4")
        elseif totalstat >= 1.2e+25 then
            TPArea(CFrame.new(2931.00586, -3.12987995, -3881.18262, -0.97906369, 0, -0.203554377, 0, 1, -0, 0.203554407, -0, -0.97906357))
            onGiveStats:FireServer("12", "Tier5")
        end
    
    elseif SelectedZone == "Zone 13 (Lost Kingdom)" then
        if totalstat == 0 or totalstat <= 7e+24 then
            TPArea(CFrame.new(2883.69385, 1.49053204, 574.641479, -0.999920785, 0, -0.0125937071, 0, 1, -0, 0.0125937089, -0, -0.999920666))
            onGiveStats:FireServer("13", "Tier1")
        elseif totalstat == 7e+24 or totalstat <= 8.5e+24 then
            TPArea(CFrame.new(2873.82373, 1.49053204, 574.340759, -0.998228192, 0, 0.059502285, 0, 1.00000012, -0, -0.059502285, 0, -0.998228192))
            onGiveStats:FireServer("13", "Tier2")
        elseif totalstat == 8.5e+24 or totalstat <= 9.999999999999999e+24 then
            TPArea(CFrame.new(2865.50537, 1.49053228, 575.482727, -0.954454303, 0, 0.298357189, 0, 1, -0, -0.298357189, 0, -0.954454303))
            onGiveStats:FireServer("13", "Tier3")
        elseif totalstat == 9.999999999999999e+24 or totalstat <= 1.2e+25 then
            TPArea(CFrame.new(2855.67554, 1.49053204, 575.076172, -0.999964595, 0, -0.00842210278, 0, 1, -0, 0.00842210371, -0, -0.999964476))
            onGiveStats:FireServer("13", "Tier4")
        elseif totalstat >= 1.2e+25 then
            TPArea(CFrame.new(2846.53027, 1.49053204, 574.692749, -0.991879404, 0, 0.127182841, 0, 1.00000012, -0, -0.127182856, 0, -0.991879284))
            onGiveStats:FireServer("13", "Tier5")
        end
    
    elseif SelectedZone == "Zone 14 (Orc Paradise)" then
        if totalstat == 0 or totalstat <= 1.2e+25 then
            TPArea(CFrame.new(-438.425415, 71.4885712, 3228.90723, -0.891522169, 0, 0.45297718, 0, 1.00000012, -0, -0.45297718, 0, -0.891522169))
            onGiveStats:FireServer("14", "Tier1")
        elseif totalstat == 1.2e+25 or totalstat <= 1.7e+25 then
            TPArea(CFrame.new(-448.34671, 71.4885712, 3226.71851, -0.882656693, 0, 0.470018268, 0, 1, -0, -0.470018268, 0, -0.882656693))
            onGiveStats:FireServer("14", "Tier2")
        elseif totalstat == 1.7e+25 or totalstat <= 2.1e+25 then
            TPArea(CFrame.new(-459.32666, 71.4885635, 3224.23096, -0.934073925, 0, 0.357079864, 0, 1, -0, -0.357079893, 0, -0.934073806))
            onGiveStats:FireServer("14", "Tier3")
        elseif totalstat == 2.1e+25 or totalstat <= 3e+25 then
            TPArea(CFrame.new(-468.438538, 71.4885712, 3220.56274, -0.944450796, 0, 0.328652829, 0, 1, -0, -0.328652829, 0, -0.944450796))
            onGiveStats:FireServer("14", "Tier4")
        elseif totalstat >= 3e+25 then
            TPArea(CFrame.new(-478.139679, 71.4885712, 3217.65601, -0.968081772, 0, 0.250634938, 0, 1.00000012, -0, -0.250634968, 0, -0.968081653))
            onGiveStats:FireServer("14", "Tier5")
        end
    
    elseif SelectedZone == "Zone 15 (Heavenly Island)" then
        if totalstat == 0 or totalstat <= 1.2e+25 then
            TPArea(CFrame.new(-843.63147, 67.6951828, -5262.11377, -0.540441513, 0, -0.84138155, 0, 1, -0, 0.84138155, -0, -0.540441513))
            onGiveStats:FireServer("15", "Tier1")
        elseif totalstat == 1.2e+25 or totalstat <= 1.7e+25 then
            TPArea(CFrame.new(-848.138611, 67.6951752, -5251.13037, -0.414766282, 0, -0.909928024, 0, 1.00000012, -0, 0.909928024, -0, -0.414766282))
            onGiveStats:FireServer("15", "Tier2")
        elseif totalstat == 1.7e+25 or totalstat <= 2.1e+25 then
            TPArea(CFrame.new(-854.029236, 67.6951828, -5240.26074, -0.525166869, 0, -0.850999296, 0, 1.00000012, -0, 0.850999415, -0, -0.52516681))
            onGiveStats:FireServer("15", "Tier3")
        elseif totalstat == 2.1e+25 or totalstat <= 3e+25 then
            TPArea(CFrame.new(-859.495789, 67.6951828, -5230.18799, -0.54235518, 0, -0.840149343, 0, 1, -0, 0.840149343, -0, -0.54235518))
            onGiveStats:FireServer("15", "Tier4")
        elseif totalstat >= 3e+25 then
            TPArea(CFrame.new(-863.956787, 67.6951752, -5219.25537, -0.471052527, 0, -0.882105172, 0, 1, -0, 0.882105172, -0, -0.471052527))
            onGiveStats:FireServer("15", "Tier5")
        end
    
    elseif SelectedZone == "Zone 16 (The Rift)" then
        if totalstat == 0 or totalstat <= 5e+25 then
            TPArea(CFrame.new(-439.903107, -12.8557758, 761.22876, 0.275226682, 0, -0.961379349, -0, 1, -0, 0.961379349, 0, 0.275226682))
            onGiveStats:FireServer("16", "Tier1")
        elseif totalstat == 5e+25 or totalstat <= 6e+25 then
            TPArea(CFrame.new(-433.697296, -12.8557758, 768.474182, 0.617868841, 0, -0.786281168, -0, 1, -0, 0.786281168, 0, 0.617868841))
            onGiveStats:FireServer("16", "Tier2")
        elseif totalstat == 6e+25 or totalstat <= 7e+25 then
            TPArea(CFrame.new(-428.270813, -12.8557768, 774.812805, 0.533799827, 0, -0.845610857, -0, 1, -0, 0.845610857, 0, 0.533799827))
            onGiveStats:FireServer("16", "Tier3")
        elseif totalstat == 7e+25 or totalstat <= 7.999999999999999e+25 then
            TPArea(CFrame.new(-421.922485, -12.8557758, 779.55249, 0.396557152, 0, -0.918009996, -0, 1, -0, 0.918010116, 0, 0.396557093))
            onGiveStats:FireServer("16", "Tier4")
        elseif totalstat >= 7.999999999999999e+25 then
            TPArea(CFrame.new(-417.187225, -12.8557758, 787.157837, 0.711408854, 0, -0.702778399, -0, 1, -0, 0.702778399, 0, 0.711408854))
            onGiveStats:FireServer("16", "Tier5")
        end
    end
end

----------------------------------------------------//----------------------------------------------------
--// FARM LEFT
local Farm_Left = Tab.Tab_2:addSection()

--// WORLD SELECTED
local World_Farm = Farm_Left:addMenu("#Zone Selected")
local DataZone = nil
function UpdateDataZone()
    if SelectedZone == "Zone 1 (School)" then
        DataZone = "1"
    elseif SelectedZone == "Zone 2 (Space Gym)" then
        DataZone = "2"
    elseif SelectedZone == "Zone 3 (Beach)" then
        DataZone = "3"
    elseif SelectedZone == "Zone 4 (Bunker)" then
        DataZone = "4"
    elseif SelectedZone == "Zone 5 (Dino)" then
        DataZone = "5"
    elseif SelectedZone == "Zone 6 (Void)" then
        DataZone = "6"
    elseif SelectedZone == "Zone 7 (Space Center)" then
        DataZone = "7"
    elseif SelectedZone == "Zone 8 (Roman Empire)" then
        DataZone = "8"
    elseif SelectedZone == "Zone 9 (Underworld)" then
        DataZone = "9"
    elseif SelectedZone == "Zone 10 (Magic Forest)" then
        DataZone = "10"
    elseif SelectedZone == "Zone 11 (Snowy Peaks)" then
        DataZone = "11"
    elseif SelectedZone == "Zone 12 (Dusty Tavern)" then
        DataZone = "12"
    elseif SelectedZone == "Zone 13 (Lost Kingdom)" then
        DataZone = "13"
    elseif SelectedZone == "Zone 14 (Orc Paradise)" then
        DataZone = "14"
    elseif SelectedZone == "Zone 15 (Heavenly Island)" then
        DataZone = "15"
    elseif SelectedZone == "Zone 16 (The Rift)" then
        DataZone = "16"
    end
end

local ZoneList =  {
    "Zone 1 (School)"; "Zone 2 (Space Gym)"; "Zone 3 (Beach)"; "Zone 4 (Bunker)"; "Zone 5 (Dino)"; "Zone 6 (Void)"; "Zone 7 (Space Center)"; "Zone 8 (Roman Empire)"; "Zone 9 (Underworld)"; "Zone 10 (Magic Forest)";
    "Zone 11 (Snowy Peaks)"; "Zone 12 (Dusty Tavern)"; "Zone 13 (Lost Kingdom)"; "Zone 14 (Orc Paradise)"; "Zone 15 (Heavenly Island)"; "Zone 16 (The Rift)";
}
World_Farm:addDropdown('Select Zones', SelectedZone, ZoneList, function (Value)
    SelectedZone = Value
    UpdateDataZone()
    UpdateValueTools()
    UpdateNPCList()
end)

World_Farm:addButton('Teleport to Zone', function()
    if SelectedZone == "Zone 1 (School)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["1"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 2 (Space Gym)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["2"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 3 (Beach)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["3"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 4 (Bunker)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["4"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 5 (Dino)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["5"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 6 (Void)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["6"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 7 (Space Center)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["7"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 8 (Roman Empire)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["8"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 9 (Underworld)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["9"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 10 (Magic Forest)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["10"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 11 (Snowy Peaks)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["11"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 12 (Dusty Tavern)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["12"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 13 (Lost Kingdom)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["13"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 14 (Orc Paradise)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["14"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 15 (Heavenly Island)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["15"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
    elseif SelectedZone == "Zone 16 (The Rift)" then
        local args = {
            [1] = game:GetService("Workspace").Zones["16"].Interactables.Teleports.Locations.Spawn
        }
        teleport:FireServer(unpack(args))
        
    end
end)

----------------------------------------------------//----------------------------------------------------
--// TOOLS FARM
local Tools_Farm = Farm_Left:addMenu('#Tools Farm')
local Datas = game:GetService("ReplicatedStorage").Data
local ToolList = {'Dumbells', 'Barbells', 'Grips'}
Tools_Farm:addDropdown('Select Tools', SelectedTools, ToolList, function (Value)
    SelectedTools = Value
    UpdateValueTools()
end)

local ValueFarmTools = {}
local RefreshValueMode =  Tools_Farm:addDropdown('Select Value Tools', ValueSelected, ValueFarmTools, function(Value)
    ValueSelected = Value
end)

function UpdateValueTools()
    if SelectedTools == "Dumbells" then
        ValueFarmTools = {}
        for i,v in pairs(require(Datas.Dumbells)) do
            for i2,v2 in pairs(v) do
                if i == DataZone then
                    table.insert(ValueFarmTools, i2)
                end
            end
        end
        table.sort(ValueFarmTools,function(a,b)
            return a<b
        end)
        local ValueSort = {}
        for a,b in pairs(ValueFarmTools) do
            table.insert(ValueSort, b)
        end
        RefreshValueMode:Clear()
        RefreshValueMode:Refresh(ValueSort)

    elseif SelectedTools == "Barbells" then
        ValueFarmTools = {}
        for i,v in pairs(require(Datas.Barbells)) do
            for i2,v2 in pairs(v) do
                if i == DataZone then
                    table.insert(ValueFarmTools, i2)
                end
            end
        end
        table.sort(ValueFarmTools,function(a,b)
            return a<b
        end)
        local ValueSort = {}
        for a,b in pairs(ValueFarmTools) do
            table.insert(ValueSort, b)
        end
        RefreshValueMode:Clear()
        RefreshValueMode:Refresh(ValueSort)

    elseif SelectedTools == "Grips" then
        ValueFarmTools = {}
        for i,v in pairs(require(Datas.Grips)) do
            for i2,v2 in pairs(v) do
                if i == DataZone then
                    table.insert(ValueFarmTools, i2)
                end
            end
        end
        table.sort(ValueFarmTools,function(a,b)
            return a<b
        end)
        local ValueSort = {}
        for a,b in pairs(ValueFarmTools) do
            table.insert(ValueSort, b)
        end
        RefreshValueMode:Clear()
        RefreshValueMode:Refresh(ValueSort)
    end
end

Tools_Farm:addToggle('Auto Farm (With Selected Value)', ManualFarmTools, function(Value)
    ManualFarmTools = Value

    while ManualFarmTools do wait()
        pcall(function()
            onGuiEquipRequest:FireServer(DataZone, SelectedTools, ValueSelected)
            WeightClick()
        end)
    end
end)

Tools_Farm:addToggle('Auto Farm (Without Selected Value)', AutoOnClick, function (Value)
    AutoOnClick = Value

    while AutoOnClick do wait()
        if SelectedTools == "Dumbells" then
            pcall(function()
                CheckDumbells()
                WeightClick()
            end)
        elseif SelectedTools == "Barbells" then
            pcall(function()
                CheckBarbells()
                WeightClick()
            end)
        elseif SelectedTools == "Grips" then
            pcall(function()
                CheckGrips()
                WeightClick()
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// FARM RIGHT
local Farm_Right = Tab.Tab_2:addSection()

--// PUNCH FARM
local Punch_Farm = Farm_Right:addMenu('#Knuckles Farm')

local BagpunchList = {
    "Tier1", "Tier2", "Tier3", "Tier4", "Tier5", "Tier6", "VIP",
}
Punch_Farm:addDropdown('Select Tier Punch', BagPunchSelected, BagpunchList, function (Value)
    BagPunchSelected = Value
end)

Punch_Farm:addToggle('Auto Farm Punch (With Tier Selected)', AutoFarmPunch, function (Value)
    AutoFarmPunch = Value

    while AutoFarmPunch do wait()
        pcall(function()
            DataAreaPunch()
            onGiveStats:FireServer(DataZone, BagPunchSelected)
        end)
    end
end)

Punch_Farm:addToggle('Auto Farm Punch (Withoud Tier Selected)', AutoKnucklesFarm, function(Value)
    AutoKnucklesFarm = Value

    while AutoKnucklesFarm do wait()
        pcall(function()
            CheckPunch()
        end)
    end
end)

----------------------------------------------------//----------------------------------------------------
--// NPC FARM
local Npc_Farm = Farm_Right:addMenu('#NPC Farm')
local NPCList = {}
local NPCRefresh = Npc_Farm:addDropdown('Select NPC', NPCSelected, NPCList, function (Value)
    NPCSelected = Value
end)

function UpdateNPCList()
    if SelectedZone == "Zone 1 (School)" then
        NPCList = {"Bully", "Teacher", "GymRat", "MafiaBoss", "Champion"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)

    elseif SelectedZone == "Zone 2 (Space Gym)" then
        NPCList = {"ScrapTrader", "CyberCop", "SlicerAssassin", "RipperDoc", "RogueAi"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)

    elseif SelectedZone == "Zone 3 (Beach)" then
        NPCList = {"CocoNut", "FatPirate", "MermaidKing", "FriendlyShark", "KrakenBoss"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)

    elseif SelectedZone == "Zone 4 (Bunker)" then
        NPCList = {"Barbarian", "Hazmat", "Enforcer", "Bulk", "MutantKing"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)

    elseif SelectedZone == "Zone 5 (Dino)" then
        NPCList = {"Primal", "Dino", "Archeologist", "TribeLeader", "Mammoth"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)

    elseif SelectedZone == "Zone 6 (Void)" then
        NPCList = {"Orinthian", "Spaceboy", "DemonSlayer", "Udzal", "Cybernetic"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    elseif SelectedZone == "Zone 7 (Space Center)" then
        NPCList = {"RocketRider", "MissileMaven", "LairGuardian", "NovaNomad", "DrPropulsion"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    elseif SelectedZone == "Zone 8 (Roman Empire)" then
        NPCList = {"Noob", "Trainer", "Rogue", "Master", "DivineTrainer"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    elseif SelectedZone == "Zone 9 (Underworld)" then
        NPCList = {"DeskAgent", "FieryGuide", "DarkBanker", "MagmaTroll", "EvilOverseer"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    elseif SelectedZone == "Zone 10 (Magic Forest)" then
        NPCList = {"Sorcerer"; "CyclopChris"; "Leviathan"; "FungiCrusher"; "BruteHunter"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    elseif SelectedZone == "Zone 11 (Snowy Peaks)" then
        NPCList = {"SnowOps"; "MountainSkier"; "Frostington"; "Frostfang"; "Glaciator"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    elseif SelectedZone == "Zone 12 (Dusty Tavern)" then
        NPCList = {"EvilRuby"; "BanditCash"; "MinerMike"; "CaveClint"; "MrLizard"; "UnluckyMiner"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    elseif SelectedZone == "Zone 13 (Lost Kingdom)" then
        NPCList = {"GuardianKnight"; "PrincessPhoebe"; "Goblin"; "KingKieran"; "ShinyKnight"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    elseif SelectedZone == "Zone 14 (Orc Paradise)" then
        NPCList = {"RookieOrc"; "HunterOrc"; "DemonOrc"; "ElderOrc"; "WealthyOrc"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    elseif SelectedZone == "Zone 15 (Heavenly Island)" then
        NPCList = {"EvilMinion"; "PureMinion"; "AngelicWarrior"; "DarkBrute"; "Empyrean"; "Overseer"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    elseif SelectedZone == "Zone 16 (The Rift)" then
        NPCList = {"GhostBlade"; "WhiteMage"; "RustGolem"; "LightEmber"; "LightBringer"; "RiftedWarrior"}
        NPCRefresh:Clear()
        NPCRefresh:Refresh(NPCList)
    end
end

Npc_Farm:addToggle('Enabled NPC Farm', AutoFarmBattle, function (Value)
    AutoFarmBattle = Value

    while AutoFarmBattle do wait()
        if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Wrestle.Visible == false then
            local args = {
                [1] = NPCSelected,
                [2] = game:GetService("Workspace").GameObjects.ArmWrestling:FindFirstChild(DataZone).NPC:FindFirstChild(NPCSelected).Table,
                [3] = DataZone,
            }
            onEnterNPCTable:FireServer(unpack(args))
        else
            onClickRequest:FireServer()
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// MUSICAL FARM
--[[local Musical_Farm = Farm_Right:addMenu('#Musical Farm')
local MusicalList = {'Starter', 'Hardcore', 'Impossible'}
Musical_Farm:addDropdown('Select Difficult', DifficultSelected, MusicalList, function(Value)
    DifficultSelected = Value
end)

local function MusicalFarmBoss()
    local target = game:GetService("Workspace").Zones['3'].Interactables.ArmWrestling.NPC.KrakenMegaBoss
    if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.MusicalBoss.Visible == false then
        for i,v in pairs(target:GetChildren()) do
            if DifficultSelected == 'Starter' then
                if i == 1 then
                    onEnterNPCTable:FireServer("KrakenMegaBoss", v, "3")
                end
            elseif DifficultSelected == 'Hardcore' then
                if i == 4 then
                    onEnterNPCTable:FireServer("KrakenMegaBoss", v, "3")
                end
            elseif DifficultSelected == 'Impossible' then
                if i == 5 then
                    onEnterNPCTable:FireServer("KrakenMegaBoss", v, "3")
                end
            end
        end
    end
end

local function MusicalTitle()
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.MusicalBoss.PianoFrames:GetChildren()) do
        for i2,v2 in pairs(v:GetChildren()) do
            if not (v2.Name == "A" or v2.Name == "D" or v2.Name == "S" or v2.Name == "W") then
                clickMusicalTile:FireServer(v2.Name)
            end
        end
    end
end

Musical_Farm:addToggle('Enabled Musical Farm', MusicalFarm, function(Value)
    MusicalFarm = Value

    while MusicalFarm do wait()
        pcall(function()
            MusicalFarmBoss()
            MusicalTitle()
        end)
    end
end)]]

----------------------------------------------------//----------------------------------------------------
--// REBITH
local Rebith_Main = Farm_Right:addMenu('#Auto Rebith')
local RebithRec = Rebith_Main:addLabel('')
function UpdateRebith()
    local rebithammount = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Rebirth.Container.Bar.Amount
    RebithRec:Refresh("Next Rebith Requirements : " .. tostring(rebithammount.Text))
end

task.spawn(UpdateRebith)

Rebith_Main:addToggle("Auto Rebith", AutoRebith, function (Value)
    AutoRebith = Value

    while AutoRebith do wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("RebirthService"):WaitForChild("RE"):WaitForChild("onRebirthRequest"):FireServer()
    end
end)

----------------------------------------------------//----------------------------------------------------
--// PETS LEFT
local Pets_Left = Tab.Tab_3:addSection()
local Main_Pets = Pets_Left:addMenu('#Open Eggs')

local EggWorld = {
    "School", "Space Gym", "Beach", "Bunker", "Dino", "Void", "Space Center", "Roman Empire", "Underworld", "Magic Forest", "Snowy Peaks", "Dusty Tavern", "Lost Kingdom", "Orc Paradise", "Heavenly Island", "The Rift"
}
Main_Pets:addDropdown('Select World', SelectedEggWorld, EggWorld, function(Value)
    SelectedEggWorld = Value
    UpdateEgg()
end)

local EggList = {}
local EggRefresh = Main_Pets:addDropdown('Select Eggs', SelectedEggs, EggList, function(Value)
    SelectedEggs = Value
end)

function UpdateEgg()
    if SelectedEggWorld == "School" then
        EggList = {
            "Earth", "Icy", "Lava", "Blackhole"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)

    elseif SelectedEggWorld == "Space Gym" then
        EggList = {
            "Burning", "Moon", "Crystal", "Molten", "Ice", "Solar"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)
        
    elseif SelectedEggWorld == "Beach" then
        EggList = {
            "Treasure", "Coconut", "Poseidon", "Clam", "Palm", "KingFish"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)
        
    elseif SelectedEggWorld == "Bunker" then
        EggList = {
            "Widget", "Iridescent", "Nuclear", "Mutant", "Atom", "Rust"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)
        
    elseif SelectedEggWorld == "Dino" then
        EggList = {
            "Herbivore", "Gem", "TRex", "DinoFossil", "Mystic", "Pterodactyl"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)
        
    elseif SelectedEggWorld == "Void" then
        EggList = {
            "Void", "Star", "Nebula", "Wormhole"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)
    elseif SelectedEggWorld == "Space Center" then
        EggList = {
            "Rocket", "Cyberpunk", "Meteor", "Deepsea"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)
    elseif SelectedEggWorld == "Roman Empire" then
        EggList = {
            "Gladius", "Arena", "Lionheart", "Praetorian"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)
    elseif SelectedEggWorld == "Underworld" then
        EggList = {
            "Ember", "Inferno", "Eternal", "Heated"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)
    elseif SelectedEggWorld == "Magic Forest" then
        EggList = {
            "Critters"; "Pixie"; "Berserker"; "Mushroom";
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)

    elseif SelectedEggWorld == "Snowy Peaks" then
        EggList = {
            "Frozen"; "Iced";
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)

    elseif SelectedEggWorld == "Dusty Tavern" then
        EggList = {
            "Miner"; "Bandit";
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)

    elseif SelectedEggWorld == "Lost Kingdom" then
        EggList = {
            "Knight"; "Kingdom";
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)

    elseif SelectedEggWorld == "Orc Paradise" then
        EggList = {
            "Orc"; "Paradise";
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)

    elseif SelectedEggWorld == "Heavenly Island" then
        EggList = {
            "Virtous"; "Evil"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)

    elseif SelectedEggWorld == "The Rift" then
        EggList = {
            "Dream"; "Rift"; "Starlight"; "Twilight"
        }
        EggRefresh:Clear()
        EggRefresh:Refresh(EggList)
    end
end

local HatchTypeList = {'Single Hatch', 'Triple Hatch', 'Octuple Hatch'}
Main_Pets:addDropdown('Select Hatch Type', SelectedTypeHatch, HatchTypeList, function(Value)
    SelectedTypeHatch = Value
end)

Main_Pets:addToggle('Enable Hatch Eggs', AutoOpenEggs, function(Value)
    AutoOpenEggs = Value

    while AutoOpenEggs do wait()
        if SelectedTypeHatch == 'Single Hatch' then
            local args = {
                [1] = SelectedEggs,
                [2] = {},
                [3] = false
            }
            purchaseEgg:InvokeServer(unpack(args))

        elseif SelectedTypeHatch == 'Triple Hatch' then
            local args = {
                [1] = SelectedEggs,
                [2] = {},
                [3] = true,
                [4] = false
            }
            purchaseEgg:InvokeServer(unpack(args))

        elseif SelectedTypeHatch == 'Octuple Hatch' then
            local args = {
                [1] = SelectedEggs,
                [2] = {},
                [3] = false,
                [4] = true
            }
            purchaseEgg:InvokeServer(unpack(args))
        end
    end
end)

local equipBest = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetService"):WaitForChild("RF"):WaitForChild("equipBest")
local unequipAll = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetService"):WaitForChild("RF"):WaitForChild("unequipAll")
local updateLocked = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetService"):WaitForChild("RF"):WaitForChild("updateLocked")

Main_Pets:addButton('Equip Best Pets', function()
    local args = {
        [1] = game:GetService("Players").LocalPlayer
    }
    equipBest:InvokeServer(unpack(args))
end)

Main_Pets:addButton('Unequip Pets', function()
    local args = {
        [1] = game:GetService("Players").LocalPlayer
    }
    unequipAll:InvokeServer(unpack(args))
end)

Main_Pets:addButton('Lock All Pets', function()
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Inventory.Display.Pets.ScrollingFrame.Pets:GetChildren()) do
        if v:IsA('Frame') then
            if v:FindFirstChild('Toggle').LockPet.Visible == false then
                updateLocked:InvokeServer({[v.Name] = true})
                wait()
                v:FindFirstChild('Toggle').LockPet.Visible = true
            end
        end
    end
end)

Main_Pets:addButton('Unlock All Pets', function()
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Inventory.Display.Pets.ScrollingFrame.Pets:GetChildren()) do
        if v:IsA('Frame') then
            if v:FindFirstChild('Toggle').LockPet.Visible == true then
                updateLocked:InvokeServer({[v.Name] = false})
                wait()
                v:FindFirstChild('Toggle').LockPet.Visible = false
            end
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// PETS RIGHT
local Pets_Right = Tab.Tab_3:addSection()

local Rarity_Pets = Pets_Right:addMenu('#Rarity Pets')
Rarity_Pets:addToggle('Common Pets', CommonPet, function(Value)
    CommonPet = Value
end)

Rarity_Pets:addToggle('Uncommon Pets', UncommonPet, function(Value)
    UncommonPet = Value
end)

Rarity_Pets:addToggle('Rare Pets', RarePet, function(Value)
    RarePet = Value
end)

Rarity_Pets:addToggle('Epic Pets', EpicPet, function(Value)
    EpicPet = Value
end)

Rarity_Pets:addToggle('Legendary Pets', LegendaryPet, function(Value)
    LegendaryPet = Value
end)

Rarity_Pets:addToggle('Mythic Pets', MythicPet, function(Value)
    MythicPet = Value
end)

Rarity_Pets:addToggle('Omega Pets', OmegaPet, function(Value)
    OmegaPet = Value
end)

Rarity_Pets:addToggle('Exclusive Pets', ExclusivePet, function(Value)
    ExclusivePet = Value
end)
----------------------------------------------------//----------------------------------------------------
--// Rarity Name
local ExclusiveColor = Color3.fromRGB(255, 200, 1)
local OmegaColor = Color3.fromRGB(120, 0, 166)
local MychicalColor = Color3.fromRGB(31, 31, 31)
local LegendaryColor = Color3.fromRGB(255, 152, 0)
local EpicColor = Color3.fromRGB(233, 0, 247)
local RareColor = Color3.fromRGB(0, 116, 255)
local UncommonColor = Color3.fromRGB(0, 218, 4)
local CommonColor = Color3.fromRGB(181, 181, 181)
----------------------------------------------------//----------------------------------------------------
--// CRAFT PETS
local Craft_Pets = Pets_Right:addMenu('#Craft & Deletes')

local craftsP = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetService"):WaitForChild("RF"):WaitForChild("craft")
local deletesP = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetService"):WaitForChild("RF"):WaitForChild("delete")
--[[local function CraftPets(RarityName)
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.PetInventory.Container.ScrollingFrame.Pets:GetChildren()) do
        if v:IsA('Frame') then
            if v.Toggle.SpikeyBackground.ImageColor3 == RarityName then
                local args = {
                    [1] = v.Name,
                    [2] = true
                }
                craftsP:InvokeServer(unpack(args))
            end
        end
    end
end]]

local function CraftPets(RarityName)
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Inventory.Display.Pets.ScrollingFrame.Pets:GetChildren()) do
        if v:IsA('Frame') then
            if v.Toggle.SpikeyBackground.ImageColor3 == RarityName then
                local args = {
                    [1] = v.Name,
                    [2] = true
                }
                craftsP:InvokeServer(unpack(args))
            end
        end
    end
end

Craft_Pets:addToggle('Auto Craft Pets by Rartity', CraftPetsFunc, function(Value)
    CraftPetsFunc = Value

    while CraftPetsFunc do wait()
        if ExclusivePet then
            pcall(function()
                CraftPets(ExclusiveColor)
            end)
        end
        if OmegaPet then
            pcall(function()
                CraftPets(OmegaColor)
            end)
        end
        if MythicPet then
            pcall(function()
                CraftPets(MychicalColor)
            end)
        end
        if LegendaryPet then
            pcall(function()
                CraftPets(LegendaryColor)
            end)
        end
        if EpicPet then
            pcall(function()
                CraftPets(EpicColor)
            end)
        end
        if RarePet then
            pcall(function()
                CraftPets(RareColor)
            end)
        end
        if UncommonPet then
            pcall(function()
                CraftPets(UncommonColor)
            end)
        end
        if CommonPet then
            pcall(function()
                CraftPets(CommonColor)
            end)
        end
    end
end)

--[[local function DeletesPet(rarityName)
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.PetInventory.Container.ScrollingFrame.Pets:GetChildren()) do
        if v:IsA('Frame') then
            if v.Toggle.SpikeyBackground.ImageColor3 == rarityName then
                deletesP:InvokeServer(v.Name)
            end
        end
    end
end]]

local function DeletesPet(rarityName)
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Inventory.Display.Pets.ScrollingFrame.Pets:GetChildren()) do
        if v:IsA('Frame') then
            if v.Toggle.SpikeyBackground.ImageColor3 == rarityName then
                deletesP:InvokeServer(v.Name)
            end
        end
    end
end

Craft_Pets:addToggle('Auto Delete Pets by Rarity', DeletePetsFunc, function(Value)
    DeletePetsFunc = Value

    while DeletePetsFunc do wait()
        if ExclusivePet then
            pcall(function()
                DeletesPet(ExclusiveColor)
            end)
        end
        if OmegaPet then
            pcall(function()
                DeletesPet(OmegaColor)
            end)
        end
        if MythicPet then
            pcall(function()
                DeletesPet(MychicalColor)
            end)
        end
        if LegendaryPet then
            pcall(function()
                DeletesPet(LegendaryColor)
            end)
        end
        if EpicPet then
            pcall(function()
                DeletesPet(EpicColor)
            end)
        end
        if RarePet then
            pcall(function()
                DeletesPet(RareColor)
            end)
        end
        if UncommonPet then
            pcall(function()
                DeletesPet(UncommonColor)
            end)
        end
        if CommonPet then
            pcall(function()
                DeletesPet(CommonColor)
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// ARMS LEFT
local Arms_Left = Tab.Tab_4:addSection()

local Main_Crate = Arms_Left:addMenu('#Crates')
local CrateList = {
    'RustCrate', 'SilverCrate', 'GoldCrate', 'DiamondCrate'
}
Main_Crate:addDropdown('Select Crate', CrateSelected, CrateList, function(Value)
    CrateSelected = Value
end)

local CrateAmountList = {
    '1', '10', '100'
}
Main_Crate:addDropdown('Select Amount', SelectedAmountCrate, CrateAmountList, function(Value)
    SelectedAmountCrate = Value
end)

Main_Crate:addToggle('Buy Crate', BuyCrate, function(Value)
    BuyCrate = Value

    while BuyCrate do wait()
        local PurchaseCrates = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmsService"):WaitForChild("RF"):WaitForChild("PurchaseCrates")
        local args = {
            [1] = CrateSelected,
            [2] = SelectedAmountCrate
        }
        PurchaseCrates:InvokeServer(unpack(args))
    end
end)

Main_Crate:addToggle('Open All Crate', OpenAllCrate, function(Value)
    OpenAllCrate = Value

    while OpenAllCrate do wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmsService"):WaitForChild("RF"):WaitForChild("RollAllCratesForPlayer"):InvokeServer()
    end
end)

----------------------------------------------------//----------------------------------------------------
--// MISC CRATE
local Misc_Crate = Arms_Left:addMenu('#Misc')

local function UpdateLockArm(rarityName, Value1, Value2)
    local UpdateArmLocks = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmsService"):WaitForChild("RF"):WaitForChild("UpdateArmLocks")
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Arms.Container.Arms:GetChildren()) do
        if v:IsA('Frame') then
            if v.Toggle.LockPet.Visible == Value1 then
                if v:FindFirstChild('Toggle').CircleBackground.BackgroundColor3 == rarityName then
                    UpdateArmLocks:InvokeServer({[v.Name] = Value2})
                    wait()
                    v.Toggle.LockPet.Visible = Value2
                end
            end
        end
    end
end

Misc_Crate:addToggle('Lock Arm by rarities', LockArm, function(Value)
    LockArm = Value

    while LockArm do wait()
        if CommonArm then
            pcall(function()
                UpdateLockArm(CommonColor, false, true)
            end)
        end
        if UncommonArm then
            pcall(function()
                UpdateLockArm(UncommonColor, false, true)
            end)
        end
        if RareArm then
            pcall(function()
                UpdateLockArm(RareColor, false, true)
            end)
        end
        if EpicArm then
            pcall(function()
                UpdateLockArm(EpicColor, false, true)
            end)
        end
        if LegendaryArm then
            pcall(function()
                UpdateLockArm(LegendaryColor, false, true)
            end)
        end
        if MythicArm then
            pcall(function()
                UpdateLockArm(MychicalColor, false, true)
            end)
        end
        if OmegaArm then
            pcall(function()
                UpdateLockArm(OmegaColor, false, true)
            end)
        end
        if ExclusiveArm then
            pcall(function()
                UpdateLockArm(ExclusiveColor, false, true)
            end)
        end
    end
end)

Misc_Crate:addToggle('Unlock Arm by Rarities', UnlockArm, function(Value)
    UnlockArm = Value

    while UnlockArm do wait()
        if CommonArm then
            pcall(function()
                UpdateLockArm(CommonColor, true, false)
            end)
        end
        if UncommonArm then
            pcall(function()
                UpdateLockArm(UncommonColor, true, false)
            end)
        end
        if RareArm then
            pcall(function()
                UpdateLockArm(ExclusiveColor, true, false)
            end)
        end
        if EpicArm then
            pcall(function()
                UpdateLockArm(EpicColor, true, false)
            end)
        end
        if LegendaryArm then
            pcall(function()
                UpdateLockArm(LegendaryColor, true, false)
            end)
        end
        if MythicArm then
            pcall(function()
                UpdateLockArm(MychicalColor, true, false)
            end)
        end
        if OmegaArm then
            pcall(function()
                UpdateLockArm(OmegaColor, true, false)
            end)
        end
        if ExclusiveArm then
            pcall(function()
                UpdateLockArm(ExclusiveColor, true, false)
            end)
        end
    end
end)

local function UpdateDeleteArms(rarityName)
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Arms.Container.Arms:GetChildren()) do
        if v:IsA('Frame') then
            if v.Toggle.CircleBackground.BackgroundColor3 == rarityName then
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmsService"):WaitForChild("RF"):WaitForChild("DeleteArms"):InvokeServer({v.Name})
            end
        end
    end
end

Misc_Crate:addToggle('Delete Arm by Rarities', DeleteArms, function(Value)
    DeleteArms = Value

    while DeleteArms do wait()
        if CommonArm then
            pcall(function()
                UpdateDeleteArms(CommonColor)
            end)
        end
        if UncommonArm then
            pcall(function()
                UpdateDeleteArms(UncommonColor)
            end)
        end
        if RareArm then
            pcall(function()
                UpdateDeleteArms(RareColor)
            end)
        end
        if EpicArm then
            pcall(function()
                UpdateDeleteArms(EpicColor)
            end)
        end
        if LegendaryArm then
            pcall(function()
                UpdateDeleteArms(LegendaryColor)
            end)
        end
        if MythicArm then
            pcall(function()
                UpdateDeleteArms(MychicalColor)
            end)
        end
        if OmegaArm then
            pcall(function()
                UpdateDeleteArms(OmegaColor)
            end)
        end
        if ExclusiveArm then
            pcall(function()
                UpdateDeleteArms(ExclusiveColor)
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// ARMS RIGHT
local Arms_Right = Tab.Tab_4:addSection()

local Rarity_Arms = Arms_Right:addMenu('#Rarity Arms')
Rarity_Arms:addToggle('Common Arm', CommonArm, function(Value)
    CommonArm = Value
end)

Rarity_Arms:addToggle('Uncommon Arm', UncommonArm, function(Value)
    UncommonArm = Value
end)

Rarity_Arms:addToggle('Rare Arm', RareArm, function(Value)
    RareArm = Value
end)

Rarity_Arms:addToggle('Epic Arm', EpicArm, function(Value)
    EpicArm = Value
end)

Rarity_Arms:addToggle('Legendary Arm', LegendaryArm, function(Value)
    LegendaryArm = Value
end)

Rarity_Arms:addToggle('Mythic Arm', MythicArm, function(Value)
    MythicArm = Value
end)

Rarity_Arms:addToggle('Omega Arm', OmegaArm, function(Value)
    OmegaArm = Value
end)

Rarity_Arms:addToggle('Exclusive Arm', ExclusiveArm, function(Value)
    ExclusiveArm = Value
end)

----------------------------------------------------//----------------------------------------------------
--// MACHINE LEFT
local Machine_Left = Tab.Tab_5:addSection()

--// GOLDEN PETS
local Golden_Pets = Machine_Left:addMenu('#Golden Pets')
Golden_Pets:addTextbox('Pets Name', NameSelected, function(Value)
    NameSelected = Value
end)

local amountlist = {1, 2, 3, 4, 5}
Golden_Pets:addDropdown('Select Amounnt', AmountSelected, amountlist, function(Value)
    AmountSelected = Value
end)

function GetMyPets(target)
    local MyPets = {}
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Inventory.Display.Pets.ScrollingFrame.Pets:GetChildren()) do
        if v:IsA('Frame') then
            if v:FindFirstChild('Toggle').Stat.TextColor3 == target and v:FindFirstChild('Toggle').Stat.Text == NameSelected and v:FindFirstChild('Toggle').LockPet.Visible == false then
                table.insert(MyPets, v.Name)
            end
        end
    end
    return MyPets
end

Golden_Pets:addToggle('Enabled Gold Pets', EnableGold, function(Value)
    EnableGold = Value

    while EnableGold do wait()
        local goldify = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetService"):WaitForChild("RF"):WaitForChild("goldify")
        local Normal = Color3.fromRGB(255, 255, 255)
        local PetsIDS = GetMyPets(Normal)
        if #PetsIDS >= AmountSelected then
            local args = {}
            for i = 1, AmountSelected do
                args[#args+1] = PetsIDS[#args+1]
            end
            goldify:InvokeServer(args)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// GOLDEN ARMS
local Golden_Arms = Machine_Left:addMenu('#Golden Arms')
Golden_Arms:addTextbox('Arms Percentace', PercentaceArm, function(Value)
    PercentaceArm = Value
end)

local armamountlist = {1, 2, 3, 4, 5}
Golden_Arms:addDropdown('Select Amount', AmountArmSelected, armamountlist, function(Value)
    AmountArmSelected = Value
end)

function GetMyArms(armtarget)
    local MyArms = {}
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Arms.Container.Arms:GetChildren()) do
        if v:IsA('Frame') then
            if v:FindFirstChild('Toggle').SpikeyBackground.ImageColor3 == armtarget and v:FindFirstChild('Toggle').Stat.Text == PercentaceArm .. "%" and v:FindFirstChild('Toggle').LockPet.Visible == false then
                table.insert(MyArms, v.Name)
            end
        end
    end
    return MyArms
end

Golden_Arms:addToggle('Enabled Gold Arms', ArmGold, function(Value)
    ArmGold = Value

    while ArmGold do wait()
        local EvolveArms = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmsService"):WaitForChild("RF"):WaitForChild("EvolveArms")
        local Normal = Color3.fromRGB(255, 255, 255)
        local ArmIDS = GetMyArms(Normal)
        if #ArmIDS >= AmountArmSelected then
            local args = {}
            for i = 1, AmountArmSelected do
                args[#args+1] = ArmIDS[#args+1]
            end
            EvolveArms:InvokeServer(args)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// MACHINE RIGHT
local Machine_Right = Tab.Tab_5:addSection()

--// VOID PETS
local Void_Pets = Machine_Right:addMenu('#Void Pets')
Void_Pets:addTextbox('Pets Name', NameVoidSelected, function(Value)
    NameVoidSelected = Value
end)

Void_Pets:addToggle('Enabled Void Pets', EnableVoid, function(Value)
    EnableVoid = Value

    while EnableVoid do wait()
        local onCraftToVoid = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetVoidService"):WaitForChild("RE"):WaitForChild("onCraftToVoid")
        local Golden = Color3.fromRGB(255, 215, 0)
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Inventory.Display.Pets.ScrollingFrame.Pets:GetChildren()) do
            if v:IsA('Frame') then
                if v:FindFirstChild('Toggle').Stat.TextColor3 == Golden and v:FindFirstChild('Toggle').Stat.Text == NameVoidSelected and v:FindFirstChild('Toggle').LockPet.Visible == false then
                    onCraftToVoid:FireServer(v.Name)
                end
            end
        end
    end
end)

Void_Pets:addButton('Claim Void Pets', function()
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Inventory.Display.Pets.ScrollingFrame.Pets:GetChildren()) do
        if v:IsA('Frame') then
            if v.Visible == false then
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetVoidService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer(v.Name)
            end
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// MACHINE GUI
local Machine_Gui = Machine_Right:addMenu('#Machine GUI')
Machine_Gui:addButton('Enchant Machine', function()
    game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Enchant.Visible = not game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Enchant.Visible
end)

Machine_Gui:addButton('Goliath Machine', function()
    game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Goliath.Visible = not game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Goliath.Visible
end)

Machine_Gui:addButton('Mutate Machine', function()
    game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Mutate.Visible = not game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Mutate.Visible
end)

Machine_Gui:addButton('Cure Machine', function()
    game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Cure.Visible = not game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Cure.Visible
end)

----------------------------------------------------//----------------------------------------------------
--// MISC LEFT
local Misc_Left = Tab.Tab_6:addSection()
local Teleport = Misc_Left:addMenu('#Bypass Teleports')
Teleport:addButton('Zone 1 (School)', function()
    TPArea(game:GetService("Workspace").Zones["1"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 2 (Space Gym)', function()
    TPArea(game:GetService("Workspace").Zones["2"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 3 (Beach)', function()
    TPArea(game:GetService("Workspace").Zones["3"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 4 (Bunker)', function()
    TPArea(game:GetService("Workspace").Zones["4"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 5 (Dino)', function()
    TPArea(game:GetService("Workspace").Zones["5"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 6 (Void)', function()
    TPArea(game:GetService("Workspace").Zones["6"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 7 (Space Center)', function()
    TPArea(game:GetService("Workspace").Zones["7"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 8 (Roman Empire)', function()
    TPArea(game:GetService("Workspace").Zones["8"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 9 (Underworld)', function()
    TPArea(game:GetService("Workspace").Zones["9"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 10 (Magic Forest)', function()
    TPArea(game:GetService("Workspace").Zones["10"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 11 (Snowy Peaks)', function()
    TPArea(game:GetService("Workspace").Zones["11"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 12 (Dusty Tavern)', function()
    TPArea(game:GetService("Workspace").Zones["12"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 13 (Lost Kingdom)', function()
    TPArea(game:GetService("Workspace").Zones["13"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 14 (Orc Paradise)', function()
    TPArea(game:GetService("Workspace").Zones["14"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 15 (Heavenly Island)', function()
    TPArea(game:GetService("Workspace").Zones["15"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

Teleport:addButton('Zone 16 (The Rift)', function()
    TPArea(game:GetService("Workspace").Zones["16"].Interactables.Teleports.Locations.Spawn.CFrame)
end)

----------------------------------------------------//----------------------------------------------------
--// MISC RIGHT
local Misc_Right = Tab.Tab_6:addSection()

--// CLAIM REDEEM
local Redeem_Claim = Misc_Right:addMenu('#Claim & Redeem')

Redeem_Claim:addToggle('Auto Claim Event Egg', ClaimEventEgg, function(Value)
    ClaimEventEgg = Value

    if ClaimEventEgg then
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventService"):WaitForChild("RF"):WaitForChild("ClaimEgg"):InvokeServer(8)
    end
end)

Redeem_Claim:addToggle('Auto Claim Free Gifts', ClaimFreeGift, function(Value)
    ClaimFreeGift = Value

    while ClaimFreeGift do wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TimedRewardService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer(math.random(1, 14))
    end
end)

Redeem_Claim:addToggle('Auto Claim Daily Gifts', ClaimDailyGift, function(Value)
    ClaimDailyGift = Value

    while ClaimDailyGift do wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("DailyRewardService"):WaitForChild("RE"):WaitForChild("onClaimReward"):FireServer()
    end
end)

Redeem_Claim:addToggle('Auto Claim Main Season Reward', ClaimMianSeason, function(Value)
    ClaimMianSeason = Value

    while ClaimMianSeason do wait()
        local Network = require(game:GetService("ReplicatedStorage").Vendor.Network)
        Network:InvokeServer("ClaimSeasonReward", math.random(1, 20), "Main")
    end
end)

Redeem_Claim:addToggle('Auto Claim Premium Season Reward', ClaimPremiumSeason, function(Value)
    ClaimPremiumSeason = Value

    while ClaimPremiumSeason do wait()
        local Network = require(game:GetService("ReplicatedStorage").Vendor.Network)
        Network:InvokeServer("ClaimSeasonReward", math.random(1, 20), "Premium")
    end
end)

Redeem_Claim:addToggle('Auto Spin', AutoSpin, function(Value)
    AutoSpin = Value

    while AutoSpin do wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("SpinService"):WaitForChild("RE"):WaitForChild("onSpinRequest"):FireServer()
    end
end)

Redeem_Claim:addToggle('Auto Redeem Lucky Draw', RedeemLuckyDraw, function(Value)
    RedeemLuckyDraw = Value

    while RedeemLuckyDraw do wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BlueprintService"):WaitForChild("RF"):WaitForChild("LuckyDraw"):InvokeServer(true)
    end
end)

Redeem_Claim:addToggle('Auto Spin Lucky Draw', SpinLuckyDraw, function(Value)
    SpinLuckyDraw = Value

    while SpinLuckyDraw do wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BlueprintService"):WaitForChild("RF"):WaitForChild("LuckyDraw"):InvokeServer(false)
    end
end)

Redeem_Claim:addButton('Redeem All Code', function()
    local Code = {
        'noob', 'WEDNESDAY', 'FIXED', '200m', 'enchant', 'Leagues', 'pinksandcastle', 'secret', 'gullible', 'knighty', 'axel', 'THANKSFOR400M', "FORGIVEUS", "SCARY", "christmas"
    }
    for i,v in pairs(Code) do
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer(v)
    end
end)

Redeem_Claim:addButton('UGC Quest', function()
    game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.UGCQuest.Visible = not game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.UGCQuest.Visible
end)

Redeem_Claim:addButton('Pet Playtime Quest', function()
    game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.PetPlaytimeQuest.Visible = not game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.PetPlaytimeQuest.Visible
end)


----------------------------------------------------//----------------------------------------------------
--// MISC RIGHT

local Setting_Misc = Misc_Right:addMenu('#Misc')

HideNotificationSetting = true
Setting_Misc:addToggle('Hide Notifications', HideNotificationSetting, function(Value)
    HideNotificationSetting = Value
end)
spawn(function()
    while task.wait() do
        if HideNotificationSetting then
            game.Players.LocalPlayer.PlayerGui.Notification.Enabled = false
        else
            game.Players.LocalPlayer.PlayerGui.Notification.Enabled = true
        end
    end
end)