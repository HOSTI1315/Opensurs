local TweenService: TweenService = game:GetService("TweenService");
local VirtualInputManager: VirtualInputManager = game:GetService("VirtualInputManager")
local CollectionService: CollectionService = game:GetService("CollectionService")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService: TeleportService = game:GetService("TeleportService")
local RunService: RunService = game:GetService("RunService")
local Players: Players = game:GetService("Players")
local PlaceId: PlaceId = game:GetService("PlaceId");
local Player = Players.LocalPlayer;

local ChestModels = workspace:WaitForChild("ChestModels");
local WorldOrigin = workspace:WaitForChild("_WorldOrigin");
local Characters = workspace:WaitForChild("Characters");
local SeaBeasts = workspace:WaitForChild("SeaBeasts");
local Enemies = workspace:WaitForChild("Enemies");
local Map = workspace:WaitForChild("Map");

local Main_Module = loadstring(game:HttpGet("https://files.btteam.net/files/games/bf/modules/Front-modules.lua"))()

local QuestModules = {} do

    QuestModules.GetListed = function()

        if Main_Module.GameData.Sea == 1 then
            Monster_Listed = {
                "Bandit [Lv. 1]";
                "Monkey [Lv. 10]";
                "Gorilla [Lv. 15]";
                "Pirate [Lv. 30]";
                "Brute [Lv. 45]";
                "Desert Bandit [Lv. 60]";
                "Desert Officer [Lv. 75]";
                "Snow Bandit [Lv. 90]";
                "Snowman [Lv. 100]";
                "Chief Petty Officer [Lv. 120]";
                "Sky Bandit [Lv. 150]";
                "Dark Master [Lv. 175]";
                "Prisoner [Lv. 190]";
                "Dangerous Prisoner [Lv. 210]";
                "Toga Warrior [Lv. 250]";
                "Gladiator [Lv. 275]";
                "Military Soldier [Lv. 300]";
                "Military Spy [Lv. 325]";
                "Fishman Warrior [Lv. 375]";
                "Fishman Commando [Lv. 400]";
                "God's Guard [Lv. 450]";
                "Shanda [Lv. 475]";
                "Royal Squad [Lv. 525]";
                "Royal Soldier [Lv. 550]";
                "Galley Pirate [Lv. 625]";
                "Galley Captain [Lv. 650]"
            }
    
            Boss_Listed = {
                "The Gorilla King";
                "Bobby";
                "The Saw";
                "Yeti";
                "Mob Leader";
                "Vice Admiral";
                "Saber Expert";
                "Warden";
                "Chief Warden";
                "Swan";
                "Magma Admiral";
                "Fishman Lord";
                "Wysper";
                "Thunder God";
                "Cyborg";
                "Ice Admiral";
                "Greybeard"
            }
    
            Material_Listed = {
                "Angel Wings";
                "Leather";
                "Magma Ore";
                "Scrap Metal";
                "Yeti Fur";
                "Fish Tail"
            }
    
        elseif Main_Module.GameData.Sea == 2 then
            Monster_Listed = {
                "Raider [Lv. 700]";
                "Mercenary [Lv. 725]";
                "Swan Pirate [Lv. 775]";
                "Factory Staff [Lv. 800]";
                "Marine Lieutenant [Lv. 875]";
                "Marine Captain [Lv. 900]";
                "Zombie [Lv. 950]";
                "Vampire [Lv. 975]";
                "Snow Trooper [Lv. 1000]";
                "Winter Warrior [Lv. 1050]";
                "Lab Subordinate [Lv. 1100]";
                "Horned Warrior [Lv. 1125]";
                "Magma Ninja [Lv. 1175]";
                "Lava Pirate [Lv. 1200]";
                "Ship Deckhand [Lv. 1250]";
                "Ship Engineer [Lv. 1275]";
                "Ship Steward [Lv. 1300]";
                "Ship Officer [Lv. 1325]";
                "Arctic Warrior [Lv. 1350]";
                "Snow Lurker [Lv. 1375]";
                "Sea Soldier [Lv. 1425]";
                "Water Fighter [Lv. 1450]"
            }
    
            Boss_Listed = {
                "Diamond";
                "Jeremy";
                "Fajita";
                "Don Swan";
                "Smoke Admiral";
                "Awakened Ice Admiral";
                "Tide Keeper";
                "Darkbeard";
                "Cursed Captain";
                "Order";
                "rip_indra"
            }
    
            Material_Listed = {
                "Ectoplasm";
                "Leather";
                "Magma Ore";
                "Scrap Metal";
                "Mystic Drople";
                "Radioactive";
                "Vampire Fang";
                "Meteorite";
                "Dark Fragment"
            }
            
        elseif Main_Module.GameData.Sea == 3 then
            Monster_Listed = {
                "Pirate Millionaire [Lv. 1500]";
                "Pistol Billionaire [Lv. 1525]";
                "Dragon Crew Warrior [Lv. 1575]";
                "Dragon Crew Archer [Lv. 1600]";
                "Hydra Enforcer [Lv. 1625]";
                "Venomous Assailant [Lv. 1650]";
                "Marine Commodore [Lv. 1700]";
                "Marine Rear Admiral [Lv. 1725]";
                "Fishman Raider [Lv. 1775]";
                "Fishman Captain [Lv. 1800]";
                "Forest Pirate [Lv. 1825]";
                "Mythological Pirate [Lv. 1850]";
                "Jungle Pirate [Lv. 1900]";
                "Musketeer Pirate [Lv. 1925]";
                "Reborn Skeleton [Lv. 1975]";
                "Living Zombie [Lv. 2000]";
                "Demonic Soul [Lv. 2025]";
                "Posessed Mummy [Lv. 2050]";
                "Peanut Scout [Lv. 2075]";
                "Peanut President [Lv. 2100]";
                "Ice Cream Chef [Lv. 2125]";
                "Ice Cream Commander [Lv. 2150]";
                "Cookie Crafter [Lv. 2200]";
                "Cake Guard [Lv. 2225]";
                "Baking Staff [Lv. 2250]";
                "Head Baker [Lv. 2275]";
                "Cocoa Warrior [Lv. 2300]";
                "Chocolate Bar Battler [Lv. 2325]";
                "Sweet Thief [Lv. 2350]";
                "Candy Rebel [Lv. 2375]";
                "Candy Pirate [Lv. 2400]";
                "Snow Demon [Lv. 2425]";
                "Isle Outlaw [Lv. 2450]";
                "Island Boy [2475]";
                "Sun-kissed Warrior [Lv. 2500]";
                "Isle Champion [Lv. 2525]";
                "Serpent Hunter [Lv. 2550]";
                "Skull Slayer [Lv. 2575]";
                "Reef Bandit [Lv. 2600]";
                "Coral Pirate [Lv. 2625]";
                "Sea Chanter [Lv. 2650]";
                "Ocean Prophet [Lv. 2675]";
                "High Disciple [Lv. 2700]";
                "Grand Devotee [Lv. 2725]";
            }
    
            Boss_Listed = {
                "Stone";
                "Hydra Leader";
                "Kilo Admiral";
                "Captain Elephant";
                "Beautiful Pirate";
                "Cake Queen";
                "Longma";
                "Soul Reaper";
                "rip_indra True Form";
                "Cursed Skeleton";
                "Heaven's Guardian";
                "Hell's Messenger";
                "Cake Prince";
                "Dough King";
                "Terrorshark";
                "Leviathan";
                "Deandre";
                "Diablo";
                "Urban"
            }
    
            Material_Listed = {
                "Bones";
                "Leather";
                "Scrap Metal";
                "Fish Tail";
                "Gunpowder";
                "Mini Tusk";
                "Conjured Cocoa";
                "Demonic Wisp";
                "Dragon Scale";
                "Mirror Fractal"
            }

        end;
    end;

    QuestModules.GetListed()

    QuestModules.QuestLevel = function()
        local Lv = Player.Data.Level.Value;

        if Main_Module.GameData.Sea == 1 then
            if Lv == 1 or Lv <= 10 or (Selected_Monster or Selected_Monster_Mastery) == "Bandit [Lv. 1]" then -- Bandit
                TaskQuest = "Bandit"
                NameMonster = "Bandit"
                NameQuest = "BanditQuest1"
                QuestLv = 1
                CFrameQuest = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
                CFrameMonster = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)

            elseif Lv == 10 or Lv <= 15 or (Selected_Monster or Selected_Monster_Mastery) == "Monkey [Lv. 10]" then -- Monkey
                TaskQuest = "Monkey"
                NameMonster = "Monkey"
                NameQuest = "JungleQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
                CFrameMonster = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)

            elseif Lv == 15 or Lv <= 30 or (Selected_Monster or Selected_Monster_Mastery) == "Gorilla [Lv. 15]" then -- Gorilla
                TaskQuest = "Gorilla"
                NameMonster = "Gorilla"
                NameQuest = "JungleQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
                CFrameMonster = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)

            elseif Lv == 30 or Lv <= 40 or (Selected_Monster or Selected_Monster_Mastery) == "Pirate [Lv. 30]" then -- Pirate
                TaskQuest = "Pirate"
                NameMonster = "Pirate"
                NameQuest = "BuggyQuest1"
                QuestLv = 1
                CFrameQuest = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
                CFrameMonster = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)

            elseif Lv == 40 or Lv <= 60 or (Selected_Monster or Selected_Monster_Mastery) == "Brute [Lv. 45]" then -- Brute
                TaskQuest = "Brute"
                NameMonster = "Brute"
                NameQuest = "BuggyQuest1"
                QuestLv = 2
                CFrameQuest = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
                CFrameMonster = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)

            elseif Lv == 60 or Lv <= 75 or (Selected_Monster or Selected_Monster_Mastery) == "Desert Bandit [Lv. 60]" then -- Desert Bandit
                TaskQuest = "Desert Bandit"
                NameMonster = "Desert Bandit"
                NameQuest = "DesertQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
                CFrameMonster = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)

            elseif Lv == 75 or Lv <= 90 or (Selected_Monster or Selected_Monster_Mastery) == "Desert Officer [Lv. 75]" then -- Desert Officer
                TaskQuest = "Desert Officer"
                NameMonster = "Desert Officer"
                NameQuest = "DesertQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
                CFrameMonster = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)

            elseif Lv == 90 or Lv <= 100 or (Selected_Monster or Selected_Monster_Mastery) == "Snow Bandit [Lv. 90]" then -- Snow Bandit
                TaskQuest = "Snow Bandit"
                NameMonster = "Snow Bandit"
                NameQuest = "SnowQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
                CFrameMonster = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)

            elseif Lv == 100 or Lv <= 120 or (Selected_Monster or Selected_Monster_Mastery) == "Snowman [Lv. 100]" then -- Snowman
                TaskQuest = "Snowman"
                NameMonster = "Snowman"
                NameQuest = "SnowQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
                CFrameMonster = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)

            elseif Lv == 120 or Lv <= 150 or (Selected_Monster or Selected_Monster_Mastery) == "Chief Petty Officer [Lv. 120]" then -- Chief Petty Officer
                TaskQuest = "Chief Petty Officer"
                NameMonster = "Chief Petty Officer"
                NameQuest = "MarineQuest2"
                QuestLv = 1
                CFrameQuest = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
                CFrameMonster = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)

            elseif Lv == 150 or Lv <= 175 or (Selected_Monster or Selected_Monster_Mastery) == "Sky Bandit [Lv. 150]" then -- Sky Bandit
                TaskQuest = "Sky Bandit"
                NameMonster = "Sky Bandit"
                NameQuest = "SkyQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
                CFrameMonster = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)

            elseif Lv == 175 or Lv <= 190 or (Selected_Monster or Selected_Monster_Mastery) == "Dark Master [Lv. 175]" then -- Dark Master
                TaskQuest = "Dark Master"
                NameMonster = "Dark Master"
                NameQuest = "SkyQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
                CFrameMonster = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)

            elseif Lv == 190 or Lv <= 210 or (Selected_Monster or Selected_Monster_Mastery) == "Prisoner [Lv. 190]" then -- Prisoner
                TaskQuest = "Prisoner"
                NameMonster = "Prisoner"
                NameQuest = "PrisonerQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(5310.60547, 0.350014925, 474.946594)
                CFrameMonster = CFrame.new(4937.31885, 0.332031399, 649.574524)

            elseif Lv == 210 or Lv <= 250 or (Selected_Monster or Selected_Monster_Mastery) == "Dangerous Prisoner [Lv. 210]" then -- Dangerous Prisoner
                TaskQuest = "Dangerous Prisoner"
                NameMonster = "Dangerous Prisoner"
                NameQuest = "PrisonerQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(5310.60547, 0.350014925, 474.946594)
                CFrameMonster = CFrame.new(5099.6626, 0.351562679, 1055.7583)

            elseif Lv == 250 or Lv <= 275 or (Selected_Monster or Selected_Monster_Mastery) == "Toga Warrior [Lv. 250]" then -- Toga Warrior
                TaskQuest = "Toga Warrior"
                NameMonster = "Toga Warrior"
                NameQuest = "ColosseumQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
                CFrameMonster = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)

            elseif Lv == 275 or Lv <= 300 or (Selected_Monster or Selected_Monster_Mastery) == "Gladiator [Lv. 275]" then -- Gladiator
                TaskQuest = "Toga Warrior"
                NameMonster = "Toga Warrior"
                --NameMonster = "Gladiator"
                NameQuest = "ColosseumQuest"
                QuestLv = 1
                NameMon = "Toga Warrior"
                CFrameQuest = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
                CFrameMonster = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
                --CFrameMonster = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438) -- Gladiator bugs

            elseif Lv == 300 or Lv <= 325 or (Selected_Monster or Selected_Monster_Mastery) == "Military Soldier [Lv. 300]" then -- Military Soldier
                TaskQuest = "Military Soldier"
                NameMonster = "Military Soldier"
                NameQuest = "MagmaQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
                CFrameMonster = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)

            elseif Lv == 325 or Lv <= 375 or (Selected_Monster or Selected_Monster_Mastery) == "Military Spy [Lv. 325]" then -- Military Spy
                TaskQuest = "Military Spy"
                NameMonster = "Military Spy"
                NameQuest = "MagmaQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
                CFrameMonster = CFrame.new(-5787.00293, 75.8262634, 8651.69922)

            elseif Lv == 375 or Lv <= 400 or (Selected_Monster or Selected_Monster_Mastery) == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior
                TaskQuest = "Fishman Warrior"
                NameMonster = "Fishman Warrior"
                NameQuest = "FishmanQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameMonster = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end

            elseif Lv == 400 or Lv <= 450 or (Selected_Monster or Selected_Monster_Mastery) == "Fishman Commando [Lv. 400]" then -- Fishman Commando
                TaskQuest = "Fishman Commando"
                NameMonster = "Fishman Commando"
                NameQuest = "FishmanQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameMonster = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end

            elseif Lv == 450 or Lv <= 474 or (Selected_Monster or Selected_Monster_Mastery) == "God's Guard [Lv. 450]" then -- God's Guard
                TaskQuest = "God's Guard"
                NameMonster = "God's Guard"
                NameQuest = "SkyExp1Quest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
                CFrameMonster = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
                end

            elseif Lv == 475 or Lv <= 525 or (Selected_Monster or Selected_Monster_Mastery) == "Shanda [Lv. 475]" then -- Shanda
                TaskQuest = "Shanda"
                NameMonster = "Shanda"
                NameQuest = "SkyExp1Quest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
                CFrameMonster = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                end

            elseif Lv == 525 or Lv <= 550 or (Selected_Monster or Selected_Monster_Mastery) == "Royal Squad [Lv. 525]" then -- Royal Squad
                TaskQuest = "Royal Squad"
                NameMonster = "Royal Squad"
                NameQuest = "SkyExp2Quest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                CFrameMonster = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)

            elseif Lv == 550 or Lv <= 625 or (Selected_Monster or Selected_Monster_Mastery) == "Royal Soldier [Lv. 550]" then -- Royal Soldier
                TaskQuest = "Royal Soldier"
                NameMonster = "Royal Soldier"
                NameQuest = "SkyExp2Quest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                CFrameMonster = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)

            elseif Lv == 625 or Lv <= 650 or (Selected_Monster or Selected_Monster_Mastery) == "Galley Pirate [Lv. 625]" then -- Galley Pirate
                TaskQuest = "Galley Pirate"
                NameMonster = "Galley Pirate"
                NameQuest = "FountainQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                CFrameMonster = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)

            elseif Lv >= 650 or (Selected_Monster or Selected_Monster_Mastery) == "Galley Captain [Lv. 650]" then -- Galley Captain
                TaskQuest = "Galley Captain"
                NameMonster = "Galley Captain"
                NameQuest = "FountainQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                CFrameMonster = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)

            end

        elseif Main_Module.GameData.Sea == 2 then

            if Lv == 700 or Lv <= 725 or (Selected_Monster or Selected_Monster_Mastery) == "Raider [Lv. 700]" then -- Raider
                TaskQuest = "Raider"
                NameMonster = "Raider"
                NameQuest = "Area1Quest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
                CFrameMonster = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)

            elseif Lv == 725 or Lv <= 775 or (Selected_Monster or Selected_Monster_Mastery) == "Mercenary [Lv. 725]" then -- Mercenary
                TaskQuest = "Mercenary"
                NameMonster = "Mercenary"
                NameQuest = "Area1Quest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
                CFrameMonster = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)

            elseif Lv == 775 or Lv <= 800 or (Selected_Monster or Selected_Monster_Mastery) == "Swan Pirate [Lv. 775]" then -- Swan Pirate
                TaskQuest = "Swan Pirate"
                NameMonster = "Swan Pirate"
                NameQuest = "Area2Quest"
                QuestLv = 1
                CFrameQuest = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
                CFrameMonster = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)

            elseif Lv == 800 or Lv <= 875 or (Selected_Monster or Selected_Monster_Mastery) == "Factory Staff [Lv. 800]" then -- Factory Staff
                TaskQuest = "Factory Staff"
                NameMonster = "Factory Staff"
                NameQuest = "Area2Quest"
                QuestLv = 2
                CFrameQuest = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
                CFrameMonster = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)

            elseif Lv == 875 or Lv <= 900 or (Selected_Monster or Selected_Monster_Mastery) == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant
                TaskQuest = "Marine Lieutenant"
                NameMonster = "Marine Lieutenant"
                NameQuest = "MarineQuest3"
                QuestLv = 1
                CFrameQuest = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
                CFrameMonster = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)

            elseif Lv == 900 or Lv <= 950 or (Selected_Monster or Selected_Monster_Mastery) == "Marine Captain [Lv. 900]" then -- Marine Captain
                TaskQuest = "Marine Captain"
                NameMonster = "Marine Captain"
                NameQuest = "MarineQuest3"
                QuestLv = 2
                CFrameQuest = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
                CFrameMonster = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)

            elseif Lv == 950 or Lv <= 975 or (Selected_Monster or Selected_Monster_Mastery) == "Zombie [Lv. 950]" then -- Zombie
                TaskQuest = "Zombie"
                NameMonster = "Zombie"
                NameQuest = "ZombieQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
                CFrameMonster = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)

            elseif Lv == 975 or Lv <= 1000 or (Selected_Monster or Selected_Monster_Mastery) == "Vampire [Lv. 975]" then -- Vampire
                TaskQuest = "Vampire"
                NameMonster = "Vampire"
                NameQuest = "ZombieQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
                CFrameMonster = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)

            elseif Lv == 1000 or Lv <= 1050 or (Selected_Monster or Selected_Monster_Mastery) == "Snow Trooper [Lv. 1000]" then -- Snow Trooper
                TaskQuest = "Snow Trooper"
                NameMonster = "Snow Trooper"
                NameQuest = "SnowMountainQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
                CFrameMonster = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)

            elseif Lv == 1050 or Lv <= 1100 or (Selected_Monster or Selected_Monster_Mastery) == "Winter Warrior [Lv. 1050]" then -- Winter Warrior
                TaskQuest = "Winter Warrior"
                NameMonster = "Winter Warrior"
                NameQuest = "SnowMountainQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
                CFrameMonster = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)

            elseif Lv == 1100 or Lv <= 1125 or (Selected_Monster or Selected_Monster_Mastery) == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate
                TaskQuest = "Lab Subordinate"
                NameMonster = "Lab Subordinate"
                NameQuest = "IceSideQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
                CFrameMonster = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)

            elseif Lv == 1125 or Lv <= 1175 or (Selected_Monster or Selected_Monster_Mastery) == "Horned Warrior [Lv. 1125]" then -- Horned Warrior
                TaskQuest = "Horned Warrior"
                NameMonster = "Horned Warrior"
                NameQuest = "IceSideQuest"
                QuestLv = 2
                NameMon = "Horned Warrior"
                CFrameQuest = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
                CFrameMonster = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)

            elseif Lv == 1175 or Lv <= 1200 or (Selected_Monster or Selected_Monster_Mastery) == "Magma Ninja [Lv. 1175]" then -- Magma Ninja
                TaskQuest = "Magma Ninja"
                NameMonster = "Magma Ninja"
                NameQuest = "FireSideQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
                CFrameMonster = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)

            elseif Lv == 1200 or Lv <= 1250 or (Selected_Monster or Selected_Monster_Mastery) == "Lava Pirate [Lv. 1200]" then -- Lava Pirate
                TaskQuest = "Lava Pirate"
                NameMonster = "Lava Pirate"
                NameQuest = "FireSideQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
                CFrameMonster = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)

            elseif Lv == 1250 or Lv <= 1275 or (Selected_Monster or Selected_Monster_Mastery) == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand
                TaskQuest = "Ship Deckhand"
                NameMonster = "Ship Deckhand"
                NameQuest = "ShipQuest1"
                QuestLv = 1
                CFrameQuest = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
                CFrameMonster = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end

            elseif Lv == 1275 or Lv <= 1300 or (Selected_Monster or Selected_Monster_Mastery) == "Ship Engineer [Lv. 1275]" then -- Ship Engineer
                TaskQuest = "Ship Engineer"
                NameMonster = "Ship Engineer"
                NameQuest = "ShipQuest1"
                QuestLv = 2
                CFrameQuest = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
                CFrameMonster = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end

            elseif Lv == 1300 or Lv <= 1325 or (Selected_Monster or Selected_Monster_Mastery) == "Ship Steward [Lv. 1300]" then -- Ship Steward
                TaskQuest = "Ship Steward"
                NameMonster = "Ship Steward"
                NameQuest = "ShipQuest2"
                QuestLv = 1
                CFrameQuest = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
                CFrameMonster = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end

            elseif Lv == 1325 or Lv <= 1350 or (Selected_Monster or Selected_Monster_Mastery) == "Ship Officer [Lv. 1325]" then -- Ship Officer
                TaskQuest = "Ship Officer"
                NameMonster = "Ship Officer"
                NameQuest = "ShipQuest2"
                QuestLv = 2
                CFrameQuest = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
                CFrameMonster = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end

            elseif Lv == 1350 or Lv <= 1375 or (Selected_Monster or Selected_Monster_Mastery) == "Arctic Warrior [Lv. 1350]" then -- Arctic Warrior
                TaskQuest = "Arctic Warrior"
                NameMonster = "Arctic Warrior"
                NameQuest = "FrostQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
                CFrameMonster = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                end

            elseif Lv == 1375 or Lv <= 1425 or (Selected_Monster or Selected_Monster_Mastery) == "Snow Lurker [Lv. 1375]" then -- Snow Lurker
                TaskQuest = "Snow Lurker"
                NameMonster = "Snow Lurker"
                NameQuest = "FrostQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
                CFrameMonster = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)

            elseif Lv == 1425 or Lv <= 1450 or (Selected_Monster or Selected_Monster_Mastery) == "Sea Soldier [Lv. 1425]" then -- Sea Soldier
                TaskQuest = "Sea Soldier"
                NameMonster = "Sea Soldier"
                NameQuest = "ForgottenQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
                CFrameMonster = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)

            elseif Lv >= 1450 or (Selected_Monster or Selected_Monster_Mastery) == "Water Fighter [Lv. 1450]" then -- Water Fighter
                TaskQuest = "Water Fighter"
                NameMonster = "Water Fighter"
                NameQuest = "ForgottenQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
                CFrameMonster = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)

            end

        elseif Main_Module.GameData.Sea == 3 then

            if Lv == 1500 or Lv <= 1525 or (Selected_Monster or Selected_Monster_Mastery) == "Pirate Millionaire [Lv. 1500]" then -- Pirate Millionaire
                TaskQuest = "Pirate Millionaire"
                NameMonster = "Pirate Millionaire"
                NameQuest = "PiratePortQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
                CFrameMonster = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)

            elseif Lv == 1525 or Lv <= 1575 or (Selected_Monster or Selected_Monster_Mastery) == "Pistol Billionaire [Lv. 1525]" then -- Pistol Billoonaire
                TaskQuest = "Pistol Billionaire"
                NameMonster = "Pistol Billionaire"
                NameQuest = "PiratePortQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
                CFrameMonster = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)

            elseif Lv == 1575 or Lv <= 1600 or (Selected_Monster or Selected_Monster_Mastery) == "Dragon Crew Warrior [Lv. 1575]" then -- Dragon Crew Warrior
                TaskQuest = "Dragon Crew Warrior"
                NameMonster = "Dragon Crew Warrior"
                NameQuest = "DragonCrewQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(6735.11084, 126.990463, -711.097961)
                CFrameMonster = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)

            elseif Lv == 1600 or Lv <= 1625 or (Selected_Monster or Selected_Monster_Mastery) == "Dragon Crew Archer [Lv. 1600]" then -- Dragon Crew Archer
                TaskQuest = "Dragon Crew Archer"
                NameMonster = "Dragon Crew Archer"
                NameQuest = "DragonCrewQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(6735.11084, 126.990463, -711.097961)
                CFrameMonster = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)

            elseif Lv == 1625 or Lv <= 1650 or (Selected_Monster or Selected_Monster_Mastery) == "Hydra Enforcer [Lv. 1625]" then -- Hydra Enforcer
                TaskQuest = "Hydra Enforcer"
                NameMonster = "Hydra Enforcer"
                NameQuest = "VenomCrewQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(5214.33936, 1003.46765, 759.507324)
                CFrameMonster = CFrame.new(5195.61182, 1089.23682, 617.974304)

            elseif Lv == 1650 or Lv <= 1700 or (Selected_Monster or Selected_Monster_Mastery) == "Venomous Assailant [Lv. 1650]" then -- Venomous Assailant
                TaskQuest = "Venomous Assailant"
                NameMonster = "Venomous Assailant"
                NameQuest = "VenomCrewQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(5214.33936, 1003.46765, 759.507324)
                CFrameMonster = CFrame.new(5195.61182, 1089.23682, 617.974304)

            elseif Lv == 1700 or Lv <= 1725 or (Selected_Monster or Selected_Monster_Mastery) == "Marine Commodore [Lv. 1700]" then -- Marine Commodore
                TaskQuest = "Marine Commodore"
                NameMonster = "Marine Commodore"
                NameQuest = "MarineTreeIsland"
                QuestLv = 1
                CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
                CFrameMonster = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)

            elseif Lv == 1725 or Lv <= 1775 or (Selected_Monster or Selected_Monster_Mastery) == "Marine Rear Admiral [Lv. 1725]" then -- Marine Rear Admiral
                TaskQuest = "Marine Rear Admiral"
                NameMonster = "Marine Rear Admiral"
                NameQuest = "MarineTreeIsland"
                QuestLv = 2
                CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
                CFrameMonster = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)

            elseif Lv == 1775 or Lv <= 1800 or (Selected_Monster or Selected_Monster_Mastery) == "Fishman Raider [Lv. 1775]" then -- Fishman Raider
                TaskQuest = "Fishman Raider"
                NameMonster = "Fishman Raider"
                NameQuest = "DeepForestIsland3"
                QuestLv = 1
                CFrameQuest = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
                CFrameMonster = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)

            elseif Lv == 1800 or Lv <= 1825 or (Selected_Monster or Selected_Monster_Mastery) == "Fishman Captain [Lv. 1800]" then -- Fishman Captain
                TaskQuest = "Fishman Captain"
                NameMonster = "Fishman Captain"
                NameQuest = "DeepForestIsland3"
                QuestLv = 2
                CFrameQuest = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
                CFrameMonster = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)

            elseif Lv == 1825 or Lv <= 1850 or (Selected_Monster or Selected_Monster_Mastery) == "Forest Pirate [Lv. 1825]" then -- Forest Pirate
                TaskQuest = "Forest Pirate"
                NameMonster = "Forest Pirate"
                NameQuest = "DeepForestIsland"
                QuestLv = 1
                CFrameQuest = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
                CFrameMonster = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)

            elseif Lv == 1850 or Lv <= 1900 or (Selected_Monster or Selected_Monster_Mastery) == "Mythological Pirate [Lv. 1850]" then -- Mythological Pirate
                TaskQuest = "Mythological Pirate"
                NameMonster = "Mythological Pirate"
                NameQuest = "DeepForestIsland"
                QuestLv = 2
                CFrameQuest = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
                CFrameMonster = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)

            elseif Lv == 1900 or Lv <= 1925 or (Selected_Monster or Selected_Monster_Mastery) == "Jungle Pirate [Lv. 1900]" then -- Jungle Pirate
                TaskQuest = "Jungle Pirate"
                NameMonster = "Jungle Pirate"
                NameQuest = "DeepForestIsland2"
                QuestLv = 1
                CFrameQuest = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                CFrameMonster = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)

            elseif Lv == 1925 or Lv <= 1975 or (Selected_Monster or Selected_Monster_Mastery) == "Musketeer Pirate [Lv. 1925]" then -- Musketeer Pirate
                TaskQuest = "Musketeer Pirate"
                NameMonster = "Musketeer Pirate"
                NameQuest = "DeepForestIsland2"
                QuestLv = 2
                CFrameQuest = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                CFrameMonster = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)

            elseif Lv == 1975 or Lv <= 2000 or (Selected_Monster or Selected_Monster_Mastery) == "Reborn Skeleton [Lv. 1975]" then -- Reborn Skeleton
                TaskQuest = "Reborn Skeleton"
                NameMonster = "Reborn Skeleton"
                NameQuest = "HauntedQuest1"
                QuestLv = 1
                CFrameQuest = CFrame.new(-9480.80762, 142.130661, 5566.37305)
                CFrameMonster = CFrame.new(-8761.77148, 183.431747, 6168.33301)

            elseif Lv == 2000 or Lv <= 2025 or (Selected_Monster or Selected_Monster_Mastery) == "Living Zombie [Lv. 2000]" then -- Living Zombie [Lv. 2000]
                TaskQuest = "Living Zombie"
                NameMonster = "Living Zombie"
                NameQuest = "HauntedQuest1"
                QuestLv = 2
                CFrameQuest = CFrame.new(-9480.80762, 142.130661, 5566.37305)
                CFrameMonster = CFrame.new(-10103.7529, 238.565979, 6179.75977)

            elseif Lv == 2025 or Lv <= 2050 or (Selected_Monster or Selected_Monster_Mastery) == "Demonic Soul [Lv. 2025]" then -- Demonic Soul [Lv. 2025]
                TaskQuest = "Demonic Soul"
                NameMonster = "Demonic Soul"
                NameQuest = "HauntedQuest2"
                QuestLv = 1
                CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                CFrameMonster = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)

            elseif Lv == 2050 or Lv <= 2075 or (Selected_Monster or Selected_Monster_Mastery) == "Posessed Mummy [Lv. 2050]" then -- Posessed Mummy [Lv. 2050]
                TaskQuest = "Posessed Mummy"
                NameMonster = "Posessed Mummy"
                NameQuest = "HauntedQuest2"
                QuestLv = 2
                CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                CFrameMonster = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)

            elseif Lv == 2075 or Lv <= 2100 or (Selected_Monster or Selected_Monster_Mastery) == "Peanut Scout [Lv. 2075]" then -- Peanut Scout [Lv. 2075]
                TaskQuest = "Peanut Scout"
                NameMonster = "Peanut Scout"
                NameQuest = "NutsIslandQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-2105.53198, 37.2495995, -10195.5088)
                CFrameMonster = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)

            elseif Lv == 2100 or Lv <= 2125 or (Selected_Monster or Selected_Monster_Mastery) == "Peanut President [Lv. 2100]" then -- Peanut President [Lv. 2100]
                TaskQuest = "Peanut President"
                NameMonster = "Peanut President"
                NameQuest = "NutsIslandQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-2105.53198, 37.2495995, -10195.5088)
                CFrameMonster = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)

            elseif Lv == 2125 or Lv <= 2150 or (Selected_Monster or Selected_Monster_Mastery) == "Ice Cream Chef [Lv. 2125]" then -- Ice Cream Chef [Lv. 2125]
                TaskQuest = "Ice Cream Chef"
                NameMonster = "Ice Cream Chef"
                NameQuest = "IceCreamIslandQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(-819.376709, 64.9259796, -10967.2832)
                CFrameMonster = CFrame.new(-789.941528, 209.382889, -11009.9805)

            elseif Lv == 2150 or Lv <= 2200 or (Selected_Monster or Selected_Monster_Mastery) == "Ice Cream Commander [Lv. 2150]" then -- Ice Cream Commander [Lv. 2150]
                TaskQuest = "Ice Cream Commander"
                NameMonster = "Ice Cream Commander"
                NameQuest = "IceCreamIslandQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(-819.376709, 64.9259796, -10967.2832)
                CFrameMonster = CFrame.new(-789.941528, 209.382889, -11009.9805)

            elseif Lv == 2200 or Lv <= 2225 or (Selected_Monster or Selected_Monster_Mastery) == "Cookie Crafter [Lv. 2200]" then -- Cookie Crafter [Lv. 2200]
                TaskQuest = "Cookie Crafter"
                NameMonster = "Cookie Crafter"
                NameQuest = "CakeQuest1"
                QuestLv = 1
                CFrameQuest = CFrame.new(-2022.29858, 36.9275894, -12030.9766)
                CFrameMonster = CFrame.new(-2321.71216, 36.699482, -12216.7871)

            elseif Lv == 2225 or Lv <= 2250 or (Selected_Monster or Selected_Monster_Mastery) == "Cake Guard [Lv. 2225]" then -- Cake Guard [Lv. 2225]
                TaskQuest = "Cake Guard"
                NameMonster = "Cake Guard"
                NameQuest = "CakeQuest1"
                QuestLv = 2
                CFrameQuest = CFrame.new(-2022.29858, 36.9275894, -12030.9766)
                CFrameMonster = CFrame.new(-1418.11011, 36.6718941, -12255.7324)

            elseif Lv == 2250 or Lv <= 2275 or (Selected_Monster or Selected_Monster_Mastery) == "Baking Staff [Lv. 2250]" then -- Baking Staff [Lv. 2250]
                TaskQuest = "Baking Staff"
                NameMonster = "Baking Staff"
                NameQuest = "CakeQuest2"
                QuestLv = 1
                CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
                CFrameMonster = CFrame.new(-1980.43848, 36.6716766, -12983.8418)

            elseif Lv == 2275 or Lv <= 2300 or (Selected_Monster or Selected_Monster_Mastery) == "Head Baker [Lv. 2275]" then -- Head Baker [Lv. 2275]
                TaskQuest = "Head Baker"
                NameMonster = "Head Baker"
                NameQuest = "CakeQuest2"
                QuestLv = 2
                CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
                CFrameMonster = CFrame.new(-2251.5791, 52.2714615, -13033.3965)

            elseif Lv == 2300 or Lv <= 2325 or (Selected_Monster or Selected_Monster_Mastery) == "Cocoa Warrior [Lv. 2300]" then -- Cocoa Warrior [Lv. 2300]
                TaskQuest = "Cocoa Warrior"
                NameMonster = "Cocoa Warrior"
                NameQuest ="ChocQuest1"
                QuestLv = 1
                CFrameQuest = CFrame.new(231.75, 23.9003029, -12200.292)
                CFrameMonster = CFrame.new(167.978516, 26.2254658, -12238.874)

            elseif Lv == 2325 or Lv <= 2350 or (Selected_Monster or Selected_Monster_Mastery) == "Chocolate Bar Battler [Lv. 2325]" then -- Chocolate Bar Battler [Lv. 2325]
                TaskQuest = "Chocolate Bar Battler"
                NameMonster = "Chocolate Bar Battler"
                NameQuest = "ChocQuest1"
                QuestLv = 2
                CFrameQuest = CFrame.new(231.75, 23.9003029, -12200.292)
                CFrameMonster = CFrame.new(701.312073, 25.5824986, -12708.2148)

            elseif Lv == 2350 or Lv <= 2375 or (Selected_Monster or Selected_Monster_Mastery) == "Sweet Thief [Lv. 2350]" then -- Sweet Thief [Lv. 2350]
                TaskQuest = "Sweet Thief"
                NameMonster = "Sweet Thief"
                NameQuest = "ChocQuest2"
                QuestLv = 1
                CFrameQuest = CFrame.new(151.198242, 23.8907146, -12774.6172)
                CFrameMonster = CFrame.new(-140.258301, 25.5824986, -12652.3115)

            elseif Lv == 2375 or Lv <= 2400 or (Selected_Monster or Selected_Monster_Mastery) == "Candy Rebel [Lv. 2375]" then -- Candy Rebel [Lv. 2375]
                TaskQuest = "Candy Rebel"
                NameMonster = "Candy Rebel"
                NameQuest = "ChocQuest2"
                QuestLv = 2
                CFrameQuest = CFrame.new(151.198242, 23.8907146, -12774.6172)
                CFrameMonster = CFrame.new(47.9231453, 25.5824986, -13029.2402)

            elseif Lv == 2400 or Lv <= 2425 or (Selected_Monster or Selected_Monster_Mastery) == "Candy Pirate [Lv. 2400]" then -- Candy Pirate [Lv. 2400]
                TaskQuest = "Candy Pirate"
                NameMonster = "Candy Pirate"
                NameQuest = "CandyQuest1"
                QuestLv = 1
                CFrameQuest = CFrame.new(-1149.328, 13.5759039, -14445.6143)
                CFrameMonster = CFrame.new(-1437.56348, 17.1481285, -14385.6934)

            elseif Lv == 2425 or Lv <= 2450 or (Selected_Monster or Selected_Monster_Mastery) == "Snow Demon [Lv. 2425]" then -- Snow Demon [Lv. 2425]
                TaskQuest = "Snow Demon"
                NameMonster = "Snow Demon"
                NameQuest = "CandyQuest1"
                QuestLv = 2
                CFrameQuest = CFrame.new(-1149.328, 13.5759039, -14445.6143)
                CFrameMonster = CFrame.new(-916.222656, 17.1481285, -14638.8125)

            elseif Lv == 2450 or Lv <= 2475 or (Selected_Monster or Selected_Monster_Mastery) == "Isle Outlaw [Lv. 2450]" then -- Isle Outlaw [Lv. 2450]
                TaskQuest = "Isle Outlaw"
                NameMonster = "Isle Outlaw"
                NameQuest = "TikiQuest1"
                QuestLv = 1
                CFrameQuest = CFrame.new(-16548.8164, 55.6059914, -172.8125)
                CFrameMonster = CFrame.new(-16122.4062, 10.6328173, -257.351685)

            elseif Lv == 2475 or Lv <= 2500 or (Selected_Monster or Selected_Monster_Mastery) == "Island Boy [2475]" then -- Island Boy [2475]
                TaskQuest = "Island Boy"
                NameMonster = "Island Boy"
                NameQuest = "TikiQuest1"
                QuestLv = 2
                CFrameQuest = CFrame.new(-16548.8164, 55.6059914, -172.8125)
                CFrameMonster = CFrame.new(-16736.2266, 20.533947, -131.718811)

            elseif Lv == 2500 or Lv <= 2525 or (Selected_Monster or Selected_Monster_Mastery) == "Sun-kissed Warrior [Lv. 2500]" then -- Sun-kissed Warrior [Lv. 2500]
                TaskQuest = "kissed Warrior"
                NameMonster = "Sun-kissed Warrior"
                NameQuest = "TikiQuest2"
                QuestLv = 1
                CFrameQuest = CFrame.new(-16541.0215, 54.770813, 1051.46118)
                CFrameMonster = CFrame.new(-16413.5078, 54.6350479, 1054.43555)

            elseif Lv == 2525 or Lv <= 2550 or (Selected_Monster or Selected_Monster_Mastery) == "Isle Champion [Lv. 2525]" then -- Isle Champion [Lv. 2525]
                TaskQuest = "Isle Champion"
                NameMonster = "Isle Champion"
                NameQuest = "TikiQuest2"
                QuestLv = 2
                CFrameQuest = CFrame.new(-16541.0215, 54.770813, 1051.46118)
                CFrameMonster = CFrame.new(-16787.3203, 20.6350517, 992.131836)

            elseif Lv == 2550 or Lv <= 2575 or (Selected_Monster or Selected_Monster_Mastery) == "Serpent Hunter [Lv. 2550]" then -- Serpent Hunter [Lv. 2550]
                TaskQuest = "Serpent Hunter"
                NameMonster = "Serpent Hunter"
                NameQuest = "TikiQuest3"
                QuestLv = 1
                CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434)
                CFrameMonster = CFrame.new(-16654.7754, 105.286232, 1579.67444)

            elseif Lv == 2575 or Lv <= 2599 or (Selected_Monster or Selected_Monster_Mastery) == "Skull Slayer [Lv. 2575]" then -- Skull Slayer [Lv. 2575]
                TaskQuest = "Skull Slayer"
                NameMonster = "Skull Slayer"
                NameQuest = "TikiQuest3"
                QuestLv = 2
                CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434)
                CFrameMonster = CFrame.new(-16654.7754, 105.286232, 1579.67444)

            elseif Lv == 2600 or Lv <= 2624 or (Selected_Monster or Selected_Monster_Mastery) == "Reef Bandit [Lv. 2600]" then -- Reef Bandit [Lv. 2600]
                TaskQuest = "Reef Bandit"
                NameMonster = "Reef Bandit"
                NameQuest = "SubmergedQuest1"
                QuestLv = 1
                CFrameQuest = CFrame.new(10882.264, -2086.322, 10034.226)
                CFrameMonster = CFrame.new(10736.6191, -2087.8439, 9338.4882)

            elseif Lv == 2625 or Lv <= 2649 or (Selected_Monster or Selected_Monster_Mastery) == "Coral Pirate [Lv. 2625]" then -- Coral Pirate [Lv. 2625]
                TaskQuest = "Coral Pirate"
                NameMonster = "Coral Pirate"
                NameQuest = "SubmergedQuest1"
                QuestLv = 2
                CFrameQuest = CFrame.new(10882.264, -2086.322, 10034.226)
                CFrameMonster = CFrame.new(10965.1025, -2158.8842, 9177.2597)

            elseif Lv == 2650 or Lv <= 2674 or (Selected_Monster or Selected_Monster_Mastery) == "Sea Chanter [Lv. 2650]" then -- Sea Chanter [Lv. 2650]
                TaskQuest = "Sea Chanter"
                NameMonster = "Sea Chanter"
                NameQuest = "SubmergedQuest2"
                QuestLv = 1
                CFrameQuest = CFrame.new(10882.264, -2086.322, 10034.226)
                CFrameMonster = CFrame.new(10621.0342, -2087.8440, 10102.0332)

            elseif Lv == 2675 or Lv <= 2699 or (Selected_Monster or Selected_Monster_Mastery) == "Ocean Prophet [Lv. 2675]" then -- Ocean Prophet [Lv. 2675]
                TaskQuest = "Ocean Prophet"
                NameMonster = "Ocean Prophet"
                NameQuest = "SubmergedQuest2"
                QuestLv = 2
                CFrameQuest = CFrame.new(10882.264, -2086.322, 10034.226)
                CFrameMonster = CFrame.new(11056.1445, -2001.6717, 10117.4493)

            elseif Lv == 2700 or Lv <= 2724 or (Selected_Monster or Selected_Monster_Mastery) == "High Disciple [Lv. 2700]" then -- High Disciple [Lv. 2700]
                TaskQuest = "High Disciple"
                NameMonster = "High Disciple"
                NameQuest = "SubmergedQuest3"
                QuestLv = 1
                CFrameQuest = CFrame.new(9636.52441, -1992.19507, 9609.52832)
                CFrameMonster = CFrame.new(9828.087890625, -1940.908935546875, 9693.0634765625)

            elseif Lv >= 2725 or (Selected_Monster or Selected_Monster_Mastery) == "Grand Devotee [Lv. 2725]" then -- Grand Devotee [Lv. 2725]
                TaskQuest = "Grand Devotee"
                NameMonster = "Grand Devotee"
                NameQuest = "SubmergedQuest3"
                QuestLv = 1
                CFrameQuest = CFrame.new(9636.52441, -1992.19507, 9609.52832)
                CFrameMonster = CFrame.new(9557.5849609375, -1928.0404052734375, 9859.1826171875)
            end

        end
    end;

    QuestModules.QuestBoss = function()

        if Main_Module.GameData.Sea == 1 then

            if (Selected_Boss or Selected_Monster_Mastery) == "The Gorilla King" then -- The Gorilla King [Lv. 25] [Boss]
                NameBoss = 'The Gorrila King'
                NameQuest = "JungleQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
                CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Bobby" then -- Bobby [Lv. 55] [Boss]
                NameBoss = 'Bobby'
                NameQuest = "BuggyQuest1"
                QuestLv = 3
                CFrameQuest = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
                CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "The Saw" then -- The Saw [Lv. 100] [Boss]
                NameBoss = 'The Saw'
                CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Yeti" then -- Yeti [Lv. 110] [Boss]
                NameBoss = 'Yeti'
                NameQuest = "SnowQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
                CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Mob Leader" then -- Mob Leader [Lv. 120] [Boss]
                NameBoss = 'Mob Leader'
                CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Vice Admiral" then -- Vice Admiral [Lv. 130] [Boss]
                NameBoss = 'Vice Admiral'
                NameQuest = "MarineQuest2"
                QuestLv = 2
                CFrameQuest = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
                CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Saber Expert" then -- Saber Expert [Lv. 200] [Boss]
                NameBoss = 'Saber Expert'
                CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Warden" then -- Warden [Lv. 220] [Boss]
                NameBoss = 'Warden'
                NameQuest = "ImpelQuest"
                QuestLv = 1
                CFrameQuest = CFrame.new(5278.04932, 2.15167475, 944.101929)
                CFrameBoss= CFrame.new(5191.86133, 2.84020686, 686.438721)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Chief Warden" then -- Chief Warden [Lv. 230] [Boss]
                NameBoss = 'Chief Warden'
                NameQuest = "ImpelQuest"
                QuestLv = 2
                CFrameQuest = CFrame.new(5206.92578, 0.997753382, 814.976746)
                CFrameBoss = CFrame.new(5191.86133, 2.84020686, 686.438721)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Swan" then -- Swan [Lv. 240] [Boss]
                NameBoss = 'Swan'
                NameQuest = "ImpelQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(5325.09619, 7.03906584, 719.570679)
                CFrameBoss = CFrame.new(5191.86133, 2.84020686, 686.438721)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Magma Admiral" then -- Magma Admiral [Lv. 350] [Boss]
                NameBoss = 'Magma Admiral'
                NameQuest = "MagmaQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
                CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Fishman Lord" then -- Fishman Lord [Lv. 425] [Boss]
                NameBoss = 'Fishman Lord'
                NameQuest = "FishmanQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Wysper" then -- Wysper [Lv. 500] [Boss]
                NameBoss = 'Wysper'
                NameQuest = "SkyExp1Quest"
                QuestLv = 3
                CFrameQuest = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
                CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Thunder God" then -- Thunder God [Lv. 575] [Boss]
                NameBoss = 'Thunder God'
                NameQuest = "SkyExp2Quest"
                QuestLv = 3
                CFrameQuest = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Cyborg" then -- Cyborg [Lv. 675] [Boss]
                NameBoss = 'Cyborg'
                NameQuest = "FountainQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Ice Admiral" then -- Ice Admiral [Lv. 700] [Boss]
                NameBoss = 'Ice Admiral'
                CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Greybeard" then -- Greybeard [Lv. Lv. 750] [Raid Boss]
                NameBoss = 'Greybeard'
                CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)

            end

        elseif Main_Module.GameData.Sea == 2 then

            if (Selected_Boss or Selected_Monster_Mastery) == "Diamond" then -- Diamond [Lv. 750] [Boss]
                NameBoss = 'Diamond'
                NameQuest = "Area1Quest"
                QuestLv = 3
                CFrameQuest = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
                CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Jeremy" then -- Jeremy [Lv. 850] [Boss]
                NameBoss = 'Jeremy'
                NameQuest = "Area2Quest"
                QuestLv = 3
                CFrameQuest = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
                CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Fajita" then -- Fajita [Lv. 925] [Boss]
                NameBoss = 'Fajita'
                NameQuest = "MarineQuest3"
                QuestLv = 3
                CFrameQuest = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
                CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Don Swan" then -- Don Swan [Lv. 1000] [Boss]
                NameBoss = 'Don Swan'
                CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Smoke Admiral" then -- Smoke Admiral [Lv. 1150] [Boss]
                NameBoss = 'Smoke Admiral'
                NameQuest = "IceSideQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
                CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Awakened Ice Admiral" then -- Awakened Ice Admiral [Lv. 1400] [Boss]
                NameBoss = 'Awakened Ice Admiral'
                NameQuest = "FrostQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
                CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Tide Keeper" then -- Tide Keeper [Lv. 1475] [Boss]
                NameBoss = 'Tide Keeper'
                NameQuest = "ForgottenQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
                CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Darkbeard" then -- Darkbeard [Lv. 1000] [Raid Boss]
                NameBoss = 'Darkbeard'
                CFrameBoss = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Cursed Captain" then -- Cursed Captain [Lv. 1325] [Raid Boss]
                NameBoss = 'Cursed Captain'
                CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Order" then -- Order [Lv. 1250] [Raid Boss]
                NameBoss = 'Order'
                CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "rip_indra" then -- rip_indra [Lv. 1500] [Boss]
                NameBoss = 'rip_indra'
                CFrameBoss = game.ReplicatedStorage:FindFirstChild('rip_indra').CFrame

            end

        elseif Main_Module.GameData.Sea == 3 then

            if (Selected_Boss or Selected_Monster_Mastery) == "Stone" then -- Stone [Lv. 1550] [Boss]
                NameBoss = 'Stone'
                NameQuest = "PiratePortQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
                CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Hydra Leader" then -- Hydra Leader [Lv. 1675] [Boss]
                NameBoss = 'Hydra Leader'
                NameQuest = "VenomCrewQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(5214.33936, 1003.46765, 759.507324)
                CFrameBoss = CFrame.new(5887.97168, 1018.40173, -117.293022)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Kilo Admiral" then -- Kilo Admiral [Lv. 1750] [Boss]
                NameBoss = 'Kilo Admiral'
                NameQuest = "MarineTreeIsland"
                QuestLv = 3
                CFrameQuest = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
                CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Captain Elephant" then -- Captain Elephant [Lv. 1875] [Boss]
                NameBoss = 'Captain Elephant'
                NameQuest = "DeepForestIsland"
                QuestLv = 3
                CFrameQuest = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
                CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Beautiful Pirate" then -- Beautiful Pirate [Lv. 1950] [Boss]
                NameBoss = 'Beautiful Pirate'
                NameQuest = "DeepForestIsland2"
                QuestLv = 3
                CFrameQuest = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Cake Queen" then -- Cake Queen [Lv. 2175] [Boss]
                NameBoss = 'Cake Queen'
                NameQuest = "IceCreamIslandQuest"
                QuestLv = 3
                CFrameQuest = CFrame.new(-819.376709, 64.9259796, -10967.2832)
                CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Longma" then -- Longma [Lv. 2000] [Boss]
                NameBoss = 'Longma'
                CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Soul Reaper" then -- Soul Reaper [Lv. 2100] [Raid Boss]
                NameBoss = 'Soul Reaper'
                CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "rip_indra True Form" then -- rip_indra True Form [Lv. 5000] [Raid Boss]
                NameBoss = 'rip_indra True Form'
                CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Cursed Skeleton Boss" then -- Cursed Skeleton [Lv. 2050] [Boss]
                NameBoss = 'Cursed Skeleton Boss'
                CFrameBoss = game.ReplicatedStorage:FindFirstChild('Cursed Skeleton Boss').CFrame

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Heaven's Guardian" then -- Heaven's Guardian [Lv. 2200] [Boss]
                NameBoss = "Heaven's Guardian"
                CFrameBoss = game.ReplicatedStorage:FindFirstChild("Heaven's Guardian").CFrame

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Hell's Messenger" then -- Hell's Messenger [Lv. 2200] [Boss]
                NameBoss = "Hell's Messenger"
                CFrameBoss = game.ReplicatedStorage:FindFirstChild("Hell's Messenger").CFrame

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Cake Prince" then -- Cake Prince [Lv. 2300] [Raid Boss]
                NameBoss = 'Cake Prince'
                CFrameBoss = CFrame.new(-2103, 70, -12165)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Dough King" then -- Dough King [Lv. 2300] [Raid Boss]
                NameBoss = 'Dough King'
                CFrameBoss = CFrame.new(-2103, 70, -12165)

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Terrorshark" then -- Terrorshark [Lv. 2000] [Raid Boss]
                NameBoss = 'Terrorshark'
                CFrameBoss = game.ReplicatedStorage:FindFirstChild('Terrorshark').CFrame

            elseif (Selected_Boss or Selected_Monster_Mastery) == "Leviathan" then -- Leviathan [Raid Boss]
                NameBoss = 'Leviathan'
                CFrameBoss = game.ReplicatedStorage:FindFirstChild('Leviathan').CFrame

            end

        end
    end

    QuestModules.QuestMaterial = function()

        if Main_Module.GameData.Sea == 1 then
            
            if (Selected_Material or Selected_Monster_Mastery) == 'Angel Wings' then
                NameMonster = {"Royal Squad"}
                CFrameMaterial = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Leather' then
                NameMonster = {"Pirate"}
                CFrameMaterial = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Magma Ore' then
                NameMonster = {"Military Soldier"}
                CFrameMaterial = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Scrap Metal' then
                NameMonster = {"Pirate"}
                CFrameMaterial = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Yeti Fur' then
                NameMonster = {"Yeti"}
                CFrameMaterial = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Fish Tail' then
                NameMonster = {"Fishman Warrior"}
                CFrameMaterial = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)

                if (CFrameMaterial.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end

            end

        elseif Main_Module.GameData.Sea == 2 then

            if (Selected_Material or Selected_Monster_Mastery) == 'Leather' then
                NameMonster = {"Marine Captain"}
                CFrameMaterial = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Magma Ore' then
                NameMonster = {"Magma Ninja"}
                CFrameMaterial = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Scrap Metal' then
                NameMonster = {"Lab Subordinate"}
                CFrameMaterial = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Mystic Droplet' then
                NameMonster = {"Sea Soldier"}
                CFrameMaterial = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Radioactive' then
                NameMonster = {"Factory Staff"}
                CFrameMaterial = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Vampire Fang' then
                NameMonster = {"Vampire"}
                CFrameMaterial = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Meteorite' then
                NameMonster = {"Fajita"}
                CFrameMaterial = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Dark Fragment' then
                NameMonster = {"Darkbeard"}
                CFrameMaterial = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Ectoplasm' then
                NameMonster = {"Ship Steward", "Ship Engineer", "Ship Deckhand", "Ship Officer"}
                CFrameMaterial = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
                if (CFrameMaterial.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            end

        elseif Main_Module.GameData.Sea == 3 then

            if (Selected_Material or Selected_Monster_Mastery) == 'Leather' then
                NameMonster = {"Forest Pirate"}
                CFrameMaterial = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Scrap Metal' then
                NameMonster = {"Forest Pirate"}
                CFrameMaterial = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Fish Tail' then
                NameMonster = {"Fishman Raider"}
                CFrameMaterial = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Gunpowder' then
                NameMonster = {"Pistol Billionaire"}
                CFrameMaterial = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Mini Tusk' then
                NameMonster = {"Mythological Pirate"}
                CFrameMaterial = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Conjured Cocoa' then
                NameMonster = {"Cocoa Warrior"}
                CFrameMaterial = CFrame.new(167.978516, 26.2254658, -12238.874)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Demonic Wisp' then
                NameMonster = {"Demonic Soul"}
                CFrameMaterial = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Dragon Scale' then
                NameMonster = {"Dragon Crew Warrior"}
                CFrameMaterial = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Mirror Fractal' then
                NameMonster = {"Dough King"}
                CFrameMaterial = CFrame.new(-2103, 70, -12165)

            elseif (Selected_Material or Selected_Monster_Mastery) == 'Bones' then
                NameMonster = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                CFrameMaterial = CFrame.new(-9508.5673828125, 142.1398468017578, 5737.3603515625)

            end
        end
    end

    QuestModules.QuestElite = function()
        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
            NameElite = "Diablo"
            CFrameElite = game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame

        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
            NameElite = "Deandre"
            CFrameElite = game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame

        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
            NameElite = "Urban"
            CFrameElite = game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame

        end
    end

    QuestModules.HeartFarm = function()
        if Main_Module.GameData.Sea == 1 then
            MonsterTable = {"Galley Captain", "Galley Pirate"}
            MonsterPosition = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            MaxLevelMonster = 650

        elseif Main_Module.GameData.Sea == 2 then
            MonsterTable = {"Sea Soldier", "Water Fighter"}
            MonsterPosition = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            MaxLevelMonster = 1450

        elseif Main_Module.GameData.Sea == 3 then
            MonsterTable = {"Skull Slayer", "Serpent Hunter", "Isle Champion", "Sun-kissed Warrior"}
            MonsterPosition = CFrame.new(-16541.0215, 54.770813, 1051.46118)
            MaxLevelMonster = 2575

        end

    end

    QuestModules.ObservationFarm = function()
        if Main_Module.GameData.Sea == 1 then
            ObservationMonsterName = "Galley Captain"
            ObservationPos = CFrame.new(5533.29785, 88.1079102, 4852.3916)

        elseif Main_Module.GameData.Sea == 2 then
            ObservationMonsterName = "Water Fighter"
            ObservationPos = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)

        elseif Main_Module.GameData.Sea == 3 then
            ObservationMonsterName = "Skull Slayer"
            ObservationPos = CFrame.new(-16654.7754, 105.286232, 1579.67444)

        end
    end

end

--// Auto Farm Quest
spawn(function()
    while task.wait() do
        if Level_Quest_Func then
            Selected_Monster = nil
            Selected_Monster_Mastery = nil
            QuestModules.QuestLevel()

            if not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, TaskQuest) then
                Main_Module.InvokeRemote("AbandonQuest")
            end
            wait(.1)
            if Player.PlayerGui.Main.Quest.Visible == false then
                Main_Module.Tween(CFrameQuest)
                if (CFrameQuest.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                    wait(.1)
                    Main_Module.InvokeRemote("StartQuest", NameQuest, QuestLv)
                end
            elseif Player.PlayerGui.Main.Quest.Visible == true then
                if Enemies:FindFirstChild(NameMonster) then

                    for i,v in Enemies:GetChildren() do
                        if v.Name == NameMonster then
                            if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    Main_Module:BringEnemies(v, true)
                                until not Level_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end

                else
                    Main_Module.WaitMobs(CFrameMonster)
                end
            end
        end
    end
end)

--// Auto Farm No Quest
spawn(function()
    while task.wait() do
        if Level_No_Quest_Func then
            Selected_Monster = nil
            Selected_Monster_Mastery = nil
            QuestModules.QuestLevel()
            if Enemies:FindFirstChild(NameMonster) then

                for i,v in Enemies:GetChildren() do
                    if v.Name == NameMonster then
                        if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                Main_Module:BringEnemies(v, true)
                            until not Level_No_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
                
            else
                Main_Module.WaitMobs(CFrameMonster)
            end
        end
    end
end)

--// Auto Farm Hearts
spawn(function()
    while task.wait() do
        if Hearts_Farm_Func then
            QuestModules.HeartFarm()

            local Level = Player.Data.Level.Value

            if Level <= MaxLevelMonster then
                Selected_Monster = nil
                Selected_Monster_Mastery = nil
                QuestModules.QuestLevel()

                if not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, TaskQuest) then
                    Main_Module.InvokeRemote("AbandonQuest")
                end
                wait(.1)

                if Player.PlayerGui.Main.Quest.Visible == false then
                    Main_Module.Tween(CFrameQuest)
                    if (CFrameQuest.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        wait(.1)
                        Main_Module.InvokeRemote("StartQuest", NameQuest, QuestLv)
                    end
                elseif Player.PlayerGui.Main.Quest.Visible == true then
                    if Enemies:FindFirstChild(NameMonster) then
    
                        for i,v in Enemies:GetChildren() do
                            if v.Name == NameMonster then
                                if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                    repeat task.wait()
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        Main_Module:BringEnemies(v, true)
                                    until not Hearts_Farm_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or Level.Value >= MaxLevelMonster
                                end
                            end
                        end
    
                    else
                        Main_Module.WaitMobs(CFrameMonster)
                    end
                end

            elseif Level >= MaxLevelMonster then

                if Enemies:FindFirstChild(MonsterTable[1]) or Enemies:FindFirstChild(MonsterTable[2]) or Enemies:FindFirstChild(MonsterTable[3]) or Enemies:FindFirstChild(MonsterTable[4]) then

                    for i,v in Enemies:GetChildren() do
                        if table.find(MonsterTable, v.Name) then
                            if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    Main_Module:BringEnemies(v, true)
                                until not Hearts_Farm_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                end
            end
        end
    end
end)

--// Auto Farm Nearest
spawn(function()
    while task.wait() do
        if Nearest_Farm_Func then

            for z,x in pairs(Enemies:GetChildren()) do
                if x:FindFirstChild("Humanoid") and x:FindFirstChild("HumanoidRootPart") and x.Humanoid.Health > 0 then
                    if x.Name then
                        repeat task.wait()
                            Main_Module.SetWeapon(Selected_Weapon)
                            Main_Module.Tween(x.HumanoidRootPart.CFrame * Farm_Mode)
                            x.HumanoidRootPart.CanCollide = false
                            x.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            x.HumanoidRootPart.Transparency = 1
                            x.Humanoid:ChangeState(11)
                            x.Humanoid:ChangeState(14)
                            Main_Module:BringEnemies(x, true)
                        until not Nearest_Farm_Func or not x.Parent or x.Humanoid.Health <= 0 or not Enemies:FindFirstChild(x.Name)
                    end
                end
            end
        end
    end
end)

--// Auto Farm Select Monster Quest
spawn(function()
    while task.wait() do
        if Select_Monster_Quest_Func then
            Selected_Monster_Mastery = nil
            QuestModules.QuestLevel()

            if not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, TaskQuest) then
                Main_Module.InvokeRemote("AbandonQuest")
            end
            wait(.1)
            if Player.PlayerGui.Main.Quest.Visible == false then
                Main_Module.Tween(CFrameQuest)
                if (CFrameQuest.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                    wait(.1)
                    Main_Module.InvokeRemote("StartQuest", NameQuest, QuestLv)
                end
            elseif Player.PlayerGui.Main.Quest.Visible == true then
                if Enemies:FindFirstChild(NameMonster) then

                    for i,v in Enemies:GetChildren() do
                        if v.Name == NameMonster then
                            if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    Main_Module:BringEnemies(v, true)
                                until not Select_Monster_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end

                else
                    Main_Module.WaitMobs(CFrameMonster)
                end
            end
        end
    end
end)

--// Auto Farm Select Monster No Quest
spawn(function()
    while task.wait() do
        if Select_Monster_No_Quest_Func then
            Selected_Monster_Mastery = nil
            QuestModules.QuestLevel()
            if Enemies:FindFirstChild(NameMonster) then

                for i,v in Enemies:GetChildren() do
                    if v.Name == NameMonster then
                        if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                Main_Module:BringEnemies(v, true)
                            until not Select_Monster_No_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end

            else
                Main_Module.WaitMobs(CFrameMonster)
            end
        end
    end
end)

--// Auto Farm Material
spawn(function()
    while task.wait() do
        if Select_Materials_Func then
            Selected_Monster_Mastery = nil
            QuestModules.QuestMaterial()

            if Enemies:FindFirstChild(NameMonster[1]) or Enemies:FindFirstChild(NameMonster[2]) or Enemies:FindFirstChild(NameMonster[3]) or Enemies:FindFirstChild(NameMonster[4]) then

                for i,v in Enemies:GetChildren() do
                    if table.find(NameMonster, v.Name) then
                        if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                Main_Module:BringEnemies(v, true)
                            until not Select_Materials_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end

            else
                Main_Module.Tween(CFrameMaterial)
            end
        end
    end
end)

--// Auto Farm Mastery
spawn(function()
    while task.wait() do
        if Mastery_Farming_Func then
            if Selected_Type_Mastery == "Blox Fruits" then
                if Selected_Mode_Mastery == "Quest" then
                    Selected_Monster = nil
                    Selected_Monster_Mastery = nil
                    QuestModules.QuestLevel()

                    if not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, TaskQuest) then
                        Main_Module.InvokeRemote("AbandonQuest")
                    end
                    wait(.1)
                    if Player.PlayerGui.Main.Quest.Visible == false then
                        Main_Module.Tween(CFrameQuest)
                        if (CFrameQuest.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                            wait(.1)
                            Main_Module.InvokeRemote("StartQuest", NameQuest, QuestLv)
                        end
                    elseif Player.PlayerGui.Main.Quest.Visible == true then
                        if Enemies:FindFirstChild(NameMonster) then

                            for i,v in Enemies:GetChildren() do
                                if v.Name == NameMonster then
                                    if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                        repeat task.wait()
                                        
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            Main_Module:BringEnemies(v, true)

                                            if v.Humanoid.Health <= v.Humanoid.MaxHealth * tonumber(Mastery_Farm_Monster_Health_Set) / 100 then

                                                local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                                __UseSkill = true
                                                Target_Locked = v.HumanoidRootPart
                                                Equipped.MousePos.Value = Target_Locked.Position

                                                Main_Module.SetWeapon("Blox Fruit")
                                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                                Main_Module.UseSkillsMastery()

                                            else
                                                __UseSkill = false
                                                Main_Module.SetWeapon(Selected_Weapon)
                                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                                            end

                                        until not Mastery_Farming_Func or Selected_Type_Mastery ~= "Blox Fruits" or Selected_Mode_Mastery ~= "Quest" or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                                    end
                                end
                            end

                        else
                            Main_Module.WaitMobs(CFrameMonster)
                        end
                    end

                elseif Selected_Mode_Mastery == "Nearest" then
                    for z,x in pairs(Enemies:GetChildren()) do
                        if x:FindFirstChild("Humanoid") and x:FindFirstChild("HumanoidRootPart") and x.Humanoid.Health > 0 then
                            if x.Name then
                                repeat task.wait()
                                    if x.Humanoid.Health <= x.Humanoid.MaxHealth * tonumber(Mastery_Farm_Monster_Health_Set) / 100 then
                                        local Equipped = Player.Character:FindFirstChildOfClass("Tool")

                                        __UseSkill = true
                                        Target_Locked = x.HumanoidRootPart
                                        Main_Module.SetWeapon("Blox Fruit")
                                        Main_Module.Tween(x.HumanoidRootPart.CFrame * Farm_Mode)
                                        x.HumanoidRootPart.CanCollide = false
                                        x.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        x.HumanoidRootPart.Transparency = 1
                                        Main_Module:BringEnemies(x, true)
                                        Equipped.MousePos.Value = Target_Locked.Position
                                        Main_Module.UseSkillsMastery()

                                    else
                                        __UseSkill = false
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(x.HumanoidRootPart.CFrame * Farm_Mode)
                                        x.HumanoidRootPart.CanCollide = false
                                        x.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        x.HumanoidRootPart.Transparency = 1
                                        Main_Module:BringEnemies(x, true)
                                    end
                                    
                                until not Mastery_Farming_Func or Selected_Type_Mastery ~= "Blox Fruits" or Selected_Mode_Mastery ~= "Nearest" or not x.Parent or x.Humanoid.Health <= 0 or not Enemies:FindFirstChild(x.Name)
                            end
                        end
                    end

                elseif Selected_Mode_Mastery == "Select Monsters" then
                    Selected_Monster = nil
                    QuestModules.QuestLevel()
                    if Enemies:FindFirstChild(NameMonster) then

                        for i,v in Enemies:GetChildren() do
                            if v.Name == NameMonster then
                                if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                    repeat task.wait()
                                    
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        Main_Module:BringEnemies(v, true)

                                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * tonumber(Mastery_Farm_Monster_Health_Set) / 100 then

                                            local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                            __UseSkill = true
                                            Target_Locked = v.HumanoidRootPart
                                            Equipped.MousePos.Value = Target_Locked.Position

                                            Main_Module.SetWeapon("Blox Fruit")
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            Main_Module.UseSkillsMastery()

                                        else
                                            __UseSkill = false
                                            Main_Module.SetWeapon(Selected_Weapon)
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                                        end

                                    until not Mastery_Farming_Func or Selected_Type_Mastery ~= "Blox Fruits" or Selected_Mode_Mastery ~= "Select Monsters" or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end

                    else
                        Main_Module.WaitMobs(CFrameMonster)
                    end

                elseif Selected_Mode_Mastery == "Select Boss" then
                    Selected_Boss = nil
                    QuestModules.QuestBoss()

                    if Enemies:FindFirstChild(Selected_Monster_Mastery) then

                        for i,v in Enemies:GetChildren() do
                            if v.Name == NameBoss then
                                if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                    repeat task.wait()
                                    
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)

                                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * tonumber(Mastery_Farm_Monster_Health_Set) / 100 then

                                            local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                            __UseSkill = true
                                            Target_Locked = v.HumanoidRootPart
                                            Equipped.MousePos.Value = Target_Locked.Position

                                            Main_Module.SetWeapon("Blox Fruit")
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            Main_Module.UseSkillsMastery()

                                        else
                                            __UseSkill = false
                                            Main_Module.SetWeapon(Selected_Weapon)
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                                        end

                                    until not Mastery_Farming_Func or Selected_Type_Mastery ~= "Blox Fruits" or Selected_Mode_Mastery ~= "Select Boss" or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end

                    else
                        Main_Module.WaitMobs(CFrameBoss)
                    end

                elseif Selected_Mode_Mastery == "Material" then
                    Selected_Material = nil
                    QuestModules.QuestMaterial()
                    Main_Module.Tween(CFrameMaterial)

                    for i,v in Enemies:GetChildren() do
                        if table.find(NameMonster, v.Name) then
                            if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Main_Module:BringEnemies(v, true)

                                    if v.Humanoid.Health <= v.Humanoid.MaxHealth * tonumber(Mastery_Farm_Monster_Health_Set) / 100 then

                                        local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                        __UseSkill = true
                                        Target_Locked = v.HumanoidRootPart
                                        Equipped.MousePos.Value = Target_Locked.Position

                                        Main_Module.SetWeapon("Blox Fruit")
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        Main_Module.UseSkillsMastery()

                                    else
                                        __UseSkill = false
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                                    end

                                until not Mastery_Farming_Func or Selected_Type_Mastery ~= "Blox Fruits" or Selected_Mode_Mastery ~= "Material" or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end

                end

            elseif Selected_Type_Mastery == "Gun" then
                if Selected_Mode_Mastery == "Quest" then
                    Selected_Monster = nil
                    Selected_Monster_Mastery = nil
                    QuestModules.QuestLevel()

                    if not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, TaskQuest) then
                        Main_Module.InvokeRemote("AbandonQuest")
                    end
                    wait(.1)
                    if Player.PlayerGui.Main.Quest.Visible == false then
                        Main_Module.Tween(CFrameQuest)
                        if (CFrameQuest.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                            wait(.1)
                            Main_Module.InvokeRemote("StartQuest", NameQuest, QuestLv)
                        end
                    elseif Player.PlayerGui.Main.Quest.Visible == true then
                        if Enemies:FindFirstChild(NameMonster) then

                            for i,v in Enemies:GetChildren() do
                                if v.Name == NameMonster then
                                    if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                        repeat task.wait()
                                        
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            Main_Module:BringEnemies(v, true)
    
                                            if v.Humanoid.Health <= v.Humanoid.MaxHealth * tonumber(Mastery_Farm_Monster_Health_Set) / 100 then
    
                                                local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                                __UseSkill = true
                                                Target_Locked = v.HumanoidRootPart
                                                Equipped.MousePos.Value = Target_Locked.Position
    
                                                Main_Module.SetWeapon("Gun")
                                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                                Main_Module.UseSkillsMastery()
    
                                            else
                                                __UseSkill = false
                                                Main_Module.SetWeapon(Selected_Weapon)
                                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
    
                                            end
    
                                        until not Mastery_Farming_Func or Selected_Type_Mastery ~= "Gun" or Selected_Mode_Mastery ~= "Quest" or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                                    end
                                end
                            end

                        else
                            Main_Module.WaitMobs(CFrameMonster)
                        end
                    end

                elseif Selected_Mode_Mastery == "Nearest" then
                    for z,x in pairs(Enemies:GetChildren()) do
                        if x:FindFirstChild("Humanoid") and x:FindFirstChild("HumanoidRootPart") and x.Humanoid.Health > 0 then
                            if x.Name then
                                repeat task.wait()
                                    if x.Humanoid.Health <= x.Humanoid.MaxHealth * tonumber(Mastery_Farm_Monster_Health_Set) / 100 then
                                        local Equipped = Player.Character:FindFirstChildOfClass("Tool")

                                        __UseSkill = true
                                        Target_Locked = x.HumanoidRootPart
                                        Main_Module.SetWeapon("Gun")
                                        Main_Module.Tween(x.HumanoidRootPart.CFrame * Farm_Mode)
                                        x.HumanoidRootPart.CanCollide = false
                                        x.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        x.HumanoidRootPart.Transparency = 1
                                        Main_Module:BringEnemies(x, true)
                                        Equipped.MousePos.Value = Target_Locked.Position
                                        Main_Module.UseSkillsMastery()

                                    else
                                        __UseSkill = false
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(x.HumanoidRootPart.CFrame * Farm_Mode)
                                        x.HumanoidRootPart.CanCollide = false
                                        x.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        x.HumanoidRootPart.Transparency = 1
                                        Main_Module:BringEnemies(x, true)
                                    end
                                    
                                until not Mastery_Farming_Func or Selected_Type_Mastery ~= "Gun" or Selected_Mode_Mastery ~= "Nearest" or not x.Parent or x.Humanoid.Health <= 0 or not Enemies:FindFirstChild(x.Name)
                            end
                        end
                    end

                elseif Selected_Mode_Mastery == "Select Monsters" then
                    Selected_Monster = nil
                    QuestModules.QuestLevel()
                    if Enemies:FindFirstChild(NameMonster) then

                        for i,v in Enemies:GetChildren() do
                            if v.Name == NameMonster then
                                if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                    repeat task.wait()
                                    
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        Main_Module:BringEnemies(v, true)

                                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * tonumber(Mastery_Farm_Monster_Health_Set) / 100 then

                                            local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                            __UseSkill = true
                                            Target_Locked = v.HumanoidRootPart
                                            Equipped.MousePos.Value = Target_Locked.Position

                                            Main_Module.SetWeapon("Gun")
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            Main_Module.UseSkillsMastery()

                                        else
                                            __UseSkill = false
                                            Main_Module.SetWeapon(Selected_Weapon)
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                                        end

                                    until not Mastery_Farming_Func or Selected_Type_Mastery ~= "Gun" or Selected_Mode_Mastery ~= "Select Monsters" or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end

                    else
                        Main_Module.WaitMobs(CFrameMonster)
                    end

                elseif Selected_Mode_Mastery == "Select Boss" then
                    Selected_Boss = nil
                    QuestModules.QuestBoss()

                    if Enemies:FindFirstChild(Selected_Monster_Mastery) then

                        for i,v in Enemies:GetChildren() do
                            if v.Name == NameBoss then
                                if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                    repeat task.wait()
                                    
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)

                                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * tonumber(Mastery_Farm_Monster_Health_Set) / 100 then

                                            local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                            __UseSkill = true
                                            Target_Locked = v.HumanoidRootPart
                                            Equipped.MousePos.Value = Target_Locked.Position

                                            Main_Module.SetWeapon("Gun")
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            Main_Module.UseSkillsMastery()

                                        else
                                            __UseSkill = false
                                            Main_Module.SetWeapon(Selected_Weapon)
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                                        end

                                    until not Mastery_Farming_Func or Selected_Type_Mastery ~= "Gun" or Selected_Mode_Mastery ~= "Select Boss" or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end

                    else
                        Main_Module.WaitMobs(CFrameBoss)
                    end

                elseif Selected_Mode_Mastery == "Material" then
                    Selected_Material = nil
                    QuestModules.QuestMaterial()
                    Main_Module.Tween(CFrameMaterial)

                    for i,v in Enemies:GetChildren() do
                        if table.find(NameMonster, v.Name) then
                            if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Main_Module:BringEnemies(v, true)

                                    if v.Humanoid.Health <= v.Humanoid.MaxHealth * tonumber(Mastery_Farm_Monster_Health_Set) / 100 then

                                        local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                        __UseSkill = true
                                        Target_Locked = v.HumanoidRootPart
                                        Equipped.MousePos.Value = Target_Locked.Position

                                        Main_Module.SetWeapon("Gun")
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        Main_Module.UseSkillsMastery()

                                    else
                                        __UseSkill = false
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                                    end

                                until not Mastery_Farming_Func or Selected_Type_Mastery ~= "Gun" or Selected_Mode_Mastery ~= "Material" or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end

                end
            end
        end
    end
end)

--// Auto Farm Boss Quest
spawn(function()
    while task.wait() do
        if Select_Boss_Quest_Func then
            Selected_Monster_Mastery = nil
            QuestModules.QuestBoss()

            if not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
                Main_Module.InvokeRemote("AbandonQuest")
            end
            wait(.1)
            if Player.PlayerGui.Main.Quest.Visible == false then
                Main_Module.Tween(CFrameQuest)
                if (CFrameQuest.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                    wait(.1)
                    Main_Module.InvokeRemote("StartQuest", NameQuest, QuestLv)
                end
            elseif Player.PlayerGui.Main.Quest.Visible == true then
                if Enemies:FindFirstChild(Selected_Boss) then

                    for i,v in Enemies:GetChildren() do
                        if v.Name == NameBoss then
                            if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                                until not Select_Boss_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end

                else
                    Main_Module.WaitMobs(CFrameBoss)
                end
            end
        end
    end
end)

--// Auto Farm Boss No Quest
spawn(function()
    while task.wait() do
        if Select_Boss_No_Quest_Func then
            Selected_Monster_Mastery = nil
            QuestModules.QuestBoss()

            if Enemies:FindFirstChild(Selected_Boss) then

                for i,v in Enemies:GetChildren() do
                    if v.Name == NameBoss then
                        if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                            until not Select_Boss_No_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end

            else
                Main_Module.WaitMobs(CFrameBoss)
            end
        end
    end
end)

--// Auto Farm Elite Hunter
spawn(function()
    while task.wait() do
        if Elite_Hunter_Quest_Func then
            local Elite_Boss_List = {"Deandre", "Diablo", "Urban"}
            QuestModules.QuestElite()

            if Player.PlayerGui.Main.Quest.Visible == false then
                Main_Module.InvokeRemote("EliteHunter")

            elseif Player.PlayerGui.Main.Quest.Visible == true then
                if Enemies:FindFirstChild(Elite_Boss_List[1]) or Enemies:FindFirstChild(Elite_Boss_List[2]) or Enemies:FindFirstChild(Elite_Boss_List[3]) then

                    for i,v in Enemies:GetChildren() do
                        if table.find(NameElite, v.Name) then
                            if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()

                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
    
                                until not Elite_Hunter_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end

                else

                    if string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameElite) then
                        Main_Module.Tween(CFrameElite)
                    end
                end
            end
        end
    end
end)

--// Auto Farm Cake Prince
local function CheckCakePrinceifSpawned()
    local CheckCakePrinceSpawner = Main_Module.InvokeRemote("CakePrinceSpawner")

    if string.len(CheckCakePrinceSpawner) == 88 or string.len(CheckCakePrinceSpawner) == 87 or string.len(CheckCakePrinceSpawner) == 86 then
        return false

    else
        return true
    end
end

spawn(function()
    while task.wait() do
        if Cake_Prince_Quest_Func then
            local Cake_Monster = {"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
            local Cake_Boss = {"Cake Prince"}
            local Cake_Monster_Pos = CFrame.new(-2077, 252, -12373)
            local Cake_Boss_Pos = CFrame.new(-2151.82153, 149.315704, -12404.9053)

            if CheckCakePrinceifSpawned() == false then

                if Enemies:FindFirstChild(Cake_Monster[1]) or Enemies:FindFirstChild(Cake_Monster[2]) or Enemies:FindFirstChild(Cake_Monster[3]) or Enemies:FindFirstChild(Cake_Monster[4]) then
                    
                    for Index_0, Value_0 in Enemies:GetChildren() do
                        if table.find(Cake_Monster, Value_0.Name) then
                            if Value_0:FindFirstChild('Humanoid') and Value_0:FindFirstChild('HumanoidRootPart') and Value_0:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                    Value_0.HumanoidRootPart.CanCollide = false
                                    Value_0.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    Value_0.HumanoidRootPart.Transparency = 1
                                    Value_0.Humanoid:ChangeState(11)
                                    Value_0.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(Value_0.HumanoidRootPart.CFrame * Farm_Mode)
                                    Main_Module:BringEnemies(Value_0, true)
                                until not Cake_Prince_Quest_Func or not Value_0.Parent or Value_0.Humanoid.Health <= 0 or not Enemies:FindFirstChild(Value_0.Name)
                            end
                        end
                    end
    
                else
                    Main_Module.Tween(Cake_Monster_Pos)
                end

            elseif CheckCakePrinceifSpawned() == true then
                if Enemies:FindFirstChild("Cake Prince") then

                    for Index_1, Value_1 in Enemies:GetChildren() do
                        if table.find(Cake_Boss, Value_1.Name) then
                            if Value_1:FindFirstChild('Humanoid') and Value_1:FindFirstChild('HumanoidRootPart') and Value_1:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                    Value_1.HumanoidRootPart.CanCollide = false
                                    Value_1.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    Value_1.HumanoidRootPart.Transparency = 1
                                    Value_1.Humanoid:ChangeState(11)
                                    Value_1.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(Value_1.HumanoidRootPart.CFrame * Farm_Mode)

                                until not Cake_Prince_Quest_Func or not Value_1.Parent or Value_1.Humanoid.Health <= 0 or not Enemies:FindFirstChild(Value_1.Name)
                            end
                        end
                    end

                else
                    if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
                        Main_Module.Tween(Cake_Boss_Pos)
                        
                        if (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - Player.Character.HumanoidRootPart.Position).Magnitude >= 1000 then
                            Player.Character.HumanoidRootPart.CFrame = Cake_Boss_Pos
                        end
                    end
                end
            end
            
        end
    end
end)

--// Auto Farm Dough King
spawn(function()
    while task.wait() do
        if Dough_King_Quest_Func then
            local Cake_Monster = {"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
            local Cake_Boss = {"Dough King"}
            local Cake_Monster_Pos = CFrame.new(-2077, 252, -12373)
            local Cake_Boss_Pos = CFrame.new(-2151.82153, 149.315704, -12404.9053)

            if CheckCakePrinceifSpawned() == false then

                if Enemies:FindFirstChild(Cake_Monster[1]) or Enemies:FindFirstChild(Cake_Monster[2]) or Enemies:FindFirstChild(Cake_Monster[3]) or Enemies:FindFirstChild(Cake_Monster[4]) then
                    
                    for Index_0, Value_0 in Enemies:GetChildren() do
                        if table.find(Cake_Monster, Value_0.Name) then
                            if Value_0:FindFirstChild('Humanoid') and Value_0:FindFirstChild('HumanoidRootPart') and Value_0:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                    Value_0.HumanoidRootPart.CanCollide = false
                                    Value_0.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    Value_0.HumanoidRootPart.Transparency = 1
                                    Value_0.Humanoid:ChangeState(11)
                                    Value_0.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(Value_0.HumanoidRootPart.CFrame * Farm_Mode)
                                    Main_Module:BringEnemies(Value_0, true)
                                until not Dough_King_Quest_Func or not Value_0.Parent or Value_0.Humanoid.Health <= 0 or not Enemies:FindFirstChild(Value_0.Name)
                            end
                        end
                    end
    
                else
                    Main_Module.Tween(Cake_Monster_Pos)
                end

            elseif CheckCakePrinceifSpawned() == true then
                Main_Module.InvokeRemote("DoughKingSpawner", true)
                wait(0.3)
                if Enemies:FindFirstChild("Dough King") then

                    for Index_1, Value_1 in Enemies:GetChildren() do
                        if table.find(Cake_Boss, Value_1.Name) then
                            if Value_1:FindFirstChild('Humanoid') and Value_1:FindFirstChild('HumanoidRootPart') and Value_1:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                    Value_1.HumanoidRootPart.CanCollide = false
                                    Value_1.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    Value_1.HumanoidRootPart.Transparency = 1
                                    Value_1.Humanoid:ChangeState(11)
                                    Value_1.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(Value_1.HumanoidRootPart.CFrame * Farm_Mode)

                                until not Dough_King_Quest_Func or not Value_1.Parent or Value_1.Humanoid.Health <= 0 or not Enemies:FindFirstChild(Value_1.Name)
                            end
                        end
                    end

                else
                    if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
                        Main_Module.Tween(Cake_Boss_Pos)
                        
                        if (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - Player.Character.HumanoidRootPart.Position).Magnitude >= 1000 then
                            Player.Character.HumanoidRootPart.CFrame = Cake_Boss_Pos
                        end
                    end
                end
            end

        end
    end
end)

--// Auto Farm Factory
spawn(function()
    while task.wait() do
        if Factory_Farming_Func then
            if Enemies:FindFirstChild("Core") then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == "Core" then
                        if v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                            until not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild("Core") or not Factory_Farming_Func
                        end
                    end
                end
            else
                Main_Module.Tween(CFrame.new(448.46756, 199.356781, -441.389252))
            end
        end
    end
end)

--// Auto Farm Pirate
spawn(function()
    while task.wait() do
        if Pirate_Raid_Farming_Func then
            local PiratePos = CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125)

            if (PiratePos.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                for i, v in Enemies:GetChildren() do
                    if v.Name and v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                        repeat task.wait()
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            v.HumanoidRootPart.Transparency = 1
                            v.Humanoid:ChangeState(11)
                            v.Humanoid:ChangeState(14)

                            Main_Module.SetWeapon(Selected_Weapon)
                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)

                        until not Pirate_Raid_Farming_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                    end
                end
            else
                Main_Module.Tween(PiratePos)
            end
        end
    end
end)

--// Auto Farm Chest
local function GetChest()
    local ChestTable = {}
    local ChestList = Main_Module.ChestList
    for i_Chest, v_Chest in workspace.ChestModels:GetChildren() do
        if table.find(ChestList, v_Chest.Name) then
            table.insert(ChestTable, v_Chest.RootPart.CFrame)
        end
    end
    return ChestTable
end
spawn(function()
    while task.wait() do
        if Farming_Chest_Func then
            local ChestList = Main_Module.ChestList
            local newIslandChest = Main_Module.getListNewChest()
            local isTargetChest = GetChest()
            
            if workspace.ChestModels:FindFirstChild(ChestList[1]) or workspace.ChestModels:FindFirstChild(ChestList[2]) or workspace.ChestModels:FindFirstChild(ChestList[3]) or workspace.ChestModels:FindFirstChild(ChestList[4]) or workspace.ChestModels:FindFirstChild(ChestList[5]) or workspace.ChestModels:FindFirstChild(ChestList[6]) then
                for i=1, #isTargetChest do
                    local isChest = isTargetChest[i]
                    repeat task.wait()
                        Main_Module.Tween(isChest)
                    until not Farming_Chest_Func or (isChest.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 1
                end
            else
                local ChestTarget = newIslandChest[math.random(#newIslandChest)]
                repeat task.wait()
                    Main_Module.Tween(ChestTarget)
                until not Farming_Chest_Func or (ChestTarget.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 10 
            end
        end
    end
end)

--// Auto Farm Observation
spawn(function()
    while task.wait() do
        if Farming_Observation_Func then
            QuestModules.ObservationFarm()

            if not Player.Character:FindFirstChild("Highlight") then
                VirtualInputManager:SendKeyEvent(true, "E", false, game)
                wait(.1)
                VirtualInputManager:SendKeyEvent(false, "E", false, game)
            end
            wait(.1)

            if Enemies:FindFirstChild(ObservationMonsterName) then
                if Player.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                    repeat task.wait()
                        Main_Module.Tween(Enemies:FindFirstChild(ObservationMonsterName).HumanoidRootPart.CFrame * CFrame.new(2,0,0))
                    until not Farming_Observation_Func or not Player.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                else
                    Main_Module.Tween(Enemies:FindFirstChild(ObservationMonsterName).HumanoidRootPart.CFrame * CFrame.new(0,100,0))
                end
            else
                Main_Module.Tween(ObservationPos)
            end
        end
    end
end)

--// Observation V2
spawn(function()
    while task.wait() do
        if Get_Observation_V2_Func then
            local Fruit_Table = {'Banana', 'Apple', 'Pineapple'}
            local Invent = Player.Backpack or Player.Character

            if Main_Module.InvokeRemote("CitizenQuestProgress","Citizen") == 3 then
                if Invent:FindFirstChild(Fruit_Table[1]) and Invent:FindFirstChild(Fruit_Table[2]) and Invent:FindFirstChild(Fruit_Table[3]) then
                    local Locations = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
                    repeat task.wait()
                        Main_Module.Tween(Locations)
                    until not Get_Observation_V2_Func or (Locations.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5
                    wait(.5)
                    Main_Module.InvokeRemote("CitizenQuestProgress","Citizen")

                elseif Invent:FindFirstChild("Fruit Bowl") then
                    local Locations = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
                    repeat task.wait()
                        Main_Module.Tween(Locations)
                    until not Get_Observation_V2_Func or (Locations.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5
                    wait(.5)
                    Main_Module.InvokeRemote("KenTalk2","Start")
                    wait(1)
                    Main_Module.InvokeRemote("KenTalk2","Buy")

                else
                    for i,v in pairs(workspace:GetChildren()) do
                        if table.find(Fruit_Table, v.Name) then
                            v.Handle.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10)
                            wait(.1)
                            firetouchinterest(Player.Character.HumanoidRootPart,v.Handle,0)
                            wait(.1)
                        end
                    end
                end
            end
        end
    end
end)

--// Death Step
spawn(function()
    while task.wait() do
        if Death_Step_Quest_Func then
            Main_Module.InvokeRemote("BuyBlackLeg")

            if Player.Character:FindFirstChild("Black Leg").Level.Value >= 400 or Player.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 then
                if Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then
                    Main_Module.Tween(CFrame.new(6372.57275, 302.194611, -6838.97461))
                    wait(.1)
                    Main_Module.InvokeRemote("BuyDeathStep")
                    wait(.1)

                    if Player.Character:FindFirstChild("Library Key") or Player.Backpack:FindFirstChild("Library Key") then
                        Main_Module.EquipTool("Library Key")
                        Main_Module.Tween(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))
                        wait(.1)
                        if (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            wait(.1)
                            Main_Module.InvokeRemote("OpenLibrary")
                            wait(.1)
                            Main_Module.InvokeRemote("BuyDeathStep", true)
                            wait(.1)
                            Main_Module.InvokeRemote("BuyDeathStep")
                        end

                    else
                        if Enemies:FindFirstChild("Awakened Ice Admiral") then
                            for i,v in pairs(Enemies:GetChildren()) do
                                if v.Name == "Awakened Ice Admiral" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            
                                            Main_Module.SetWeapon(Selected_Weapon)
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        until not Death_Step_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or Player.Character:FindFirstChild("Library Key") or Player.Backpack:FindFirstChild("Library Key")
                                    end
                                end
                            end
                        else
                            Main_Module.Tween(CFrame.new(6473, 297, -6944))
                        end
                    end
                else
                    Main_Module.InvokeRemote("BuyDeathStep", true)
                    wait(.1)
                    Main_Module.InvokeRemote("BuyDeathStep")
                end
            else
                Main_Module:SetNotify("Death Step Required", "You need to reach Black Leg Mastery 400++", 5)
                wait(4)
            end
        end
    end
end)

--// Sharkman Karate
spawn(function()
    while task.wait() do
        if Sharkman_Karate_Quest_Func then
            Main_Module.InvokeRemote("BuyFishmanKarate")

            if Player.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 or Player.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                Main_Module.Tween(CFrame.new(-2604.6958, 239.432526, -10315.1982))
                wait(.1)
                Main_Module.InvokeRemote("BuySharkmanKarate")
                wait(.1)

                if Player.Character:FindFirstChild("Water Key") or Player.Backpack:FindFirstChild("Water Key") then
                    Main_Module.EquipTool("Water Key")
                    Main_Module.Tween(CFrame.new(-2604.6958, 239.432526, -10315.1982))
                    wait(.1)

                    if (CFrame.new(-2604.6958, 239.432526, -10315.1982).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                        wait(.1)
                        Main_Module.InvokeRemote("OpenLibrary")
                        wait(.1)
                        Main_Module.InvokeRemote("BuySharkmanKarate")
                    end
                else
                    if Enemies:FindFirstChild("Tide Keeper") then
                        for i,v in pairs(Enemies:GetChildren()) do
                            if v.Name == "Tide Keeper" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    until not Sharkman_Karate_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or Player.Character:FindFirstChild("Library Key") or Player.Backpack:FindFirstChild("Library Key")
                                end
                            end
                        end
                    else
                        Main_Module.Tween(CFrame.new(-3711, 77, -11469))
                    end
                end
            else
                Main_Module:SetNotify("Sharkman Karate Required", "You need to reach Water Kung Fu Mastery 400++", 5)
                wait(4)
            end
        end
    end
end)

--// Electric Claw
spawn(function()
    while task.wait() do
        if Electric_Claw_Quest_Func then
            Main_Module.InvokeRemote("BuyElectro")

            if Player.Character:FindFirstChild("Electro").Level.Value >= 400 or Player.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
                Main_Module.Tween(CFrame.new(-10371.4717, 330.764496, -10131.4199))

                if (CFrame.new(-10371.4717, 330.764496, -10131.4199).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                    repeat task.wait()
                        Main_Module.InvokeRemote("BuyElectricClaw", true)
                        Main_Module.InvokeRemote("BuyElectricClaw")
                        wait(2)
                        Main_Module.InvokeRemote("BuyElectricClaw", "Start")
                        Main_Module.InvokeRemote("BuyElectricClaw")
                        wait(2)
                    until string.find(Player.PlayerGui.Notifications.NotificationTemplate.Text, "GO!")

                    if string.find(Player.PlayerGui.Notifications.NotificationTemplate.Text, "GO!") then
                        Main_Module.Tween(CFrame.new(-12548.5967, 337.198151, -7492.63623))
                        if (CFrame.new(-12548.5967, 337.198151, -7492.63623).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(3)
                            Main_Module.InvokeRemote("BuyElectricClaw")
                        end
                    end
                end

            else
                Main_Module:SetNotify("Electric Claw Required", "You need to reach Electric Mastery 400++", 5)
                wait(4)
            end
        end
    end
end)

--// Dragon Talon
spawn(function()
    while task.wait() do
        if Dragon_Talon_Quest_Func then
            Main_Module.InvokeRemote("BlackbeardReward","DragonClaw","1")
            Main_Module.InvokeRemote("BlackbeardReward","DragonClaw","2")

            if Player.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 or Player.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                if Player.Character:FindFirstChild("Fire Essence") or Player.Backpack:FindFirstChild("Fire Essence") then
                    if (CFrame.new(5661.89844, 1210.87708, 863.175537).Position - Player.Character.HumanoidRootPart.Position).Magnitude < 10 then
                        Main_Module.Tween(CFrame.new(5661.89844, 1210.87708, 863.175537))
                    else
                        Main_Module.InvokeRemote("BuyDragonTalon", true)
                        wait(.1)
                        Main_Module.InvokeRemote("BuyDragonTalon")
                    end
                
                else
                    Main_Module.InvokeRemote("Bones", "Buy", 1, 1)
                end

            else
                Main_Module:SetNotify("Dragon Talon Required", "You need to reach Deagon Claw Mastery 400++", 5)
                wait(4)
            end
        end
    end
end)

--// Godhuman
spawn(function()
    while task.wait() do
        if Godhuman_Quest_Func then
            if Main_Module.InvokeRemote("BuyGodhuman") == 1 then
                Main_Module.InvokeRemote("BuyGodhuman")
            else
                Main_Module:SetNotify("Godhuman Required", "- Access to the Third Sea (Lv. 1500+)\n- Mastery 400+ on all fighting styles\n- $5,000,000 and f5,000\n- 10 Dragon Scale\n- 20 Fish Tail\n- 10 Mystic Dreplet\n- 20 Magma Ore", 5)
                wait(4)
            end
        end
    end
end)

--// Sanguine Art
spawn(function()
    while task.wait() do
        if Sangui_art_Quest_Func then
            if Main_Module.InvokeRemote("BuySanguineArt") == 1 then
                Main_Module.InvokeRemote("BuySanguineArt")
            else
                Main_Module:SetNotify("Sanguine Art Required", "- Leviathan Heart\n- 20 Demonic Wisps\n- 20 Vampire Fangs\n- 2 Dark Fragments\n- $5,000,000 and f5,000", 5)
                wait(4)
            end
        end
    end
end)

--// Saber V1
spawn(function()
    while task.wait() do
        if Saber_V1_Quest_Func then
            if Player.Data.Level.Value >= 200 then
                if Map.Jungle.Final.Part.Transparency == 0 then
                    if Map.Jungle.QuestPlates.Door.Transparency == 0 then

                        if (CFrame.new(-1612.55884, 36.9774132, 148.719543).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            Main_Module.Tween(Player.Character.HumanoidRootPart.CFrame)
                            wait(1)
                            Player.Character.HumanoidRootPart.CFrame = Map.Jungle.QuestPlates.Plate1.Button.CFrame
                            wait(1.5)
                            Player.Character.HumanoidRootPart.CFrame = Map.Jungle.QuestPlates.Plate2.Button.CFrame
                            wait(1.5)
                            Player.Character.HumanoidRootPart.CFrame = Map.Jungle.QuestPlates.Plate3.Button.CFrame
                            wait(1.5)
                            Player.Character.HumanoidRootPart.CFrame = Map.Jungle.QuestPlates.Plate4.Button.CFrame
                            wait(1.5)
                            Player.Character.HumanoidRootPart.CFrame = Map.Jungle.QuestPlates.Plate5.Button.CFrame
                            wait(1.5)
                        else
                            Main_Module.Tween(CFrame.new(-1612.55884, 36.9774132, 148.719543))
                        end
                    else
                        if Map.Desert.Burn.Part.Transparency == 0 then
                            if Player.Backpack:FindFirstChild("Torch") or Player.Character:FindFirstChild("Torch") then
                                Main_Module.EquipTool("Torch")
                                Main_Module.Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803))
                            else
                                Main_Module.Tween(CFrame.new(-1610.00757, 11.5049858, 164.001587))
                            end
                        else
                            if Main_Module.InvokeRemote("ProQuestProgress", "SickMan") ~= 0 then
                                Main_Module.InvokeRemote("ProQuestProgress", "GetCup")
                                wait(1)
                                Main_Module.EquipTool("Cup")
                                wait(1)
                                Main_Module.InvokeRemote("ProQuestProgress", "FillCup", Player.Character.Cup)
                                wait(1)
                                Main_Module.InvokeRemote("ProQuestProgress", "SickMan")
                            else
                                if Main_Module.InvokeRemote("ProQuestProgress", "RichSon") == nil then
                                    Main_Module.InvokeRemote("ProQuestProgress", "RichSon")

                                elseif Main_Module.InvokeRemote("ProQuestProgress", "RichSon") == 0 then
                                    if Enemies:FindFirstChild("Mob Leader") then
                                        for i,v in pairs(Enemies:GetChildren()) do
                                            if v.Name == "Mob Leader" then
                                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                
                                                    repeat task.wait()
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                                        v.HumanoidRootPart.Transparency = 1
                                                        v.Humanoid:ChangeState(11)
                                                        v.Humanoid:ChangeState(14)
                                                        
                                                        Main_Module.SetWeapon(Selected_Weapon)
                                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                                    until not Saber_V1_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or Main_Module.InvokeRemote("ProQuestProgress", "RichSon") == 1
                                                end
                                            end
                                        end
                                    else
                                        Main_Module.Tween(CFrame.new(-2815.05396, 36.3834953, 5377.89258))
                                    end

                                elseif Main_Module.InvokeRemote("ProQuestProgress", "RichSon") == 1 then
                                    Main_Module.InvokeRemote("ProQuestProgress", "RichSon")
                                    wait(1)
                                    Main_Module.EquipTool("Relic")
                                    wait(1)
                                    Main_Module.Tween(CFrame.new(-1404.91504, 29.9773273, 3.80598116))
                                    wait(1)
                                    Main_Module.InvokeRemote("OpenLibrary")
                                end
                            end
                        end
                    end
                else
                    if Enemies:FindFirstChild("Saber Expert") then
                        for i,v in pairs(Enemies:GetChildren()) do
                            if v.Name == "Saber Expert" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                
                                    repeat task.wait()
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    until not Saber_V1_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or Player.Backpack:FindFirstChild("Saber") or Player.Character:FindFirstChild("Saber")
                                    if v.Humanoid.Health <= 0 then
                                        Main_Module.InvokeRemote("ProQuestProgress", "PlaceRelic")
                                    end
                                end
                            end
                        end
                    else
                        Main_Module.Tween(CFrame.new(-1430.15576, 62.2188568, -7.36060524))
                    end
                end
            else
                Main_Module:SetNotify("Saber Required", "- You need to reach Lv.200.", 5)
                wait(4)
            end
        end
    end
end)

--// Legendary Sword
spawn(function()
    while task.wait() do
        if Legendary_Sword_Dealer_Func then
            Main_Module.InvokeRemote("LegendarySworldDealer", "1")
            Main_Module.InvokeRemote("LegendarySworldDealer", "2")
            Main_Module.InvokeRemote("LegendarySworldDealer", "3")
        end
    end
end)

--// Rengoku
spawn(function()
    while task.wait() do
        if Rengoku_Quest_Func then
            if Player.Backpack:FindFirstChild("Hidden Key") or Player.Character:FindFirstChild("Hidden Key") then
                Main_Module.EquipTool("Hidden Key")
                wait(1)
                Main_Module.Tween(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                wait(1)
                Main_Module.InvokeRemote("OpenLibrary")
            else
                if Enemies:FindFirstChild("Snow Lurker") or Enemies:FindFirstChild("Arctic Warrior") or Enemies:FindFirstChild("Awakened Ice Admiral") then
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v.Name == "Snow Lurker" or v.Name == "Arctic Warrior" or v.Name == "Awakened Ice Admiral" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            
                                repeat task.wait()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    Main_Module:BringEnemies(v, true)
                                until not Rengoku_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or Player.Backpack:FindFirstChild("Hidden Key") or Player.Character:FindFirstChild("Hidden Key")
                            end
                        end
                    end
                else
                    Main_Module.Tween(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                end
            end
        end
    end
end)

--// Buddy Sword
spawn(function()
    while task.wait() do
        if Buddy_Sword_Quest_Func then
            local Cake_Monster = {"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
            local Cake_Boss = {"Cake Prince"}
            local Cake_Monster_Pos = CFrame.new(-2077, 252, -12373)
            local Cake_Boss_Pos = CFrame.new(-2151.82153, 149.315704, -12404.9053)

            if CheckCakePrinceifSpawned() == false then

                if Enemies:FindFirstChild(Cake_Monster[1]) or Enemies:FindFirstChild(Cake_Monster[2]) or Enemies:FindFirstChild(Cake_Monster[3]) or Enemies:FindFirstChild(Cake_Monster[4]) then
                    
                    for Index_0, Value_0 in Enemies:GetChildren() do
                        if table.find(Cake_Monster, Value_0.Name) then
                            if Value_0:FindFirstChild('Humanoid') and Value_0:FindFirstChild('HumanoidRootPart') and Value_0:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                    Value_0.HumanoidRootPart.CanCollide = false
                                    Value_0.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    Value_0.HumanoidRootPart.Transparency = 1
                                    Value_0.Humanoid:ChangeState(11)
                                    Value_0.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(Value_0.HumanoidRootPart.CFrame * Farm_Mode)
                                    Main_Module:BringEnemies(Value_0, true)
                                until not Buddy_Sword_Quest_Func or not Value_0.Parent or Value_0.Humanoid.Health <= 0 or not Enemies:FindFirstChild(Value_0.Name)
                            end
                        end
                    end
    
                else
                    Main_Module.Tween(Cake_Monster_Pos)
                end

            elseif CheckCakePrinceifSpawned() == true then
                if Enemies:FindFirstChild("Cake Prince") then

                    for Index_1, Value_1 in Enemies:GetChildren() do
                        if table.find(Cake_Boss, Value_1.Name) then
                            if Value_1:FindFirstChild('Humanoid') and Value_1:FindFirstChild('HumanoidRootPart') and Value_1:FindFirstChild('Humanoid').Health > 0 then
                                repeat task.wait()
                                    Value_1.HumanoidRootPart.CanCollide = false
                                    Value_1.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    Value_1.HumanoidRootPart.Transparency = 1
                                    Value_1.Humanoid:ChangeState(11)
                                    Value_1.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(Value_1.HumanoidRootPart.CFrame * Farm_Mode)

                                until not Buddy_Sword_Quest_Func or not Value_1.Parent or Value_1.Humanoid.Health <= 0 or not Enemies:FindFirstChild(Value_1.Name)
                            end
                        end
                    end

                else
                    if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
                        Main_Module.Tween(Cake_Boss_Pos)
                        
                        if (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - Player.Character.HumanoidRootPart.Position).Magnitude >= 1000 then
                            Player.Character.HumanoidRootPart.CFrame = Cake_Boss_Pos
                        end
                    end
                end
            end
        end
    end
end)

--// Pole (1st Form)
spawn(function()
    while task.wait() do
        if Pole_1stForm_Quest_Func then
            if Enemies:FindFirstChild("Thunder God") then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == "Thunder God" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                            until not Pole_1stForm_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                Main_Module.Tween(CFrame.new(-7751, 5607, -2315))
            end
        end
    end
end)

--// Cavander
spawn(function()
    while task.wait() do
        if Cavander_Quest_Func then
            if Enemies:FindFirstChild("Beautiful Pirate") then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == "Beautiful Pirate" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                            until not Cavander_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                Main_Module.Tween(CFrame.new(5370, 22, -89))
            end
        end
    end
end)

--// Yama
spawn(function()
    while task.wait() do
        if Yama_Quest_Func then
            if Main_Module.InvokeRemote("EliteHunter", "Progress") >= 30 then
                if Enemies:FindFirstChild("Ghost") then
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v.Name == "Ghost" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            
                                repeat task.wait()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    Main_Module:BringEnemies(v, true)
                                until not Yama_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or Player.Backpack:FindFirstChild("Yama") or Player.Character:FindFirstChild("Yama")
                            end
                        end
                    end
                else
                    Main_Module.Tween(CFrame.new(5253.25635, 18.5894566, 455.359833))
                    wait(0.1)
                    repeat task.wait()
                        fireclickdetector(Map.Waterfall.SealedKatana.Hitbox.ClickDetector)
                    until Player.Backpack:FindFirstChild("Yama") or Player.Character:FindFirstChild("Yama") or not Yama_Quest_Func
                end
            else
                Main_Module:SetNotify("Yama Quest", "- You need to defeat "..tostring(Main_Module.InvokeRemote("EliteHunter", "Progress")).."/30 Elite Progress", 5)
                wait(4)
            end
        end
    end
end)

--// Tushita
spawn(function()
    while task.wait() do
        if Tushita_Quest_Func then
            if not Player.Backpack:FindFirstChild("God's Chalice") and not Player.Character:FindFirstChild("God's Chalice") then
                if ReplicatedStorage:FindFirstChild("Deandre") or ReplicatedStorage:FindFirstChild("Urban") or ReplicatedStorage:FindFirstChild("Diablo") then
                    if Player.PlayerGui.Main.Quest.Visible == false then
                        Main_Module.InvokeRemote("EliteHunter")
                    elseif Player.PlayerGui.Main.Quest.Visible == true then
                        if string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
                            if Enemies:FindFirstChild("Diablo") or Enemies:FindFirstChild("Deandre") or Enemies:FindFirstChild("Urban") then
                                for i,v in pairs(Enemies:GetChildren()) do
                                    if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        
                                            repeat task.wait()
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid:ChangeState(11)
                                                v.Humanoid:ChangeState(14)
                        
                                                Main_Module.SetWeapon(Selected_Weapon)
                                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            until not Tushita_Quest_Func or v.Humanoid.Health <= 0 or not v.Parent or not Enemies:FindFirstChild(v.Name) or Player.PlayerGui.Main.Quest.Visible == false or Player.Backpack:FindFirstChild("God's Chalice") or Player.Character:FindFirstChild("God's Chalice")
                                        end
                                    end
                                end
                            else
                                if ReplicatedStorage:FindFirstChild("Diablo") then
                                    Main_Module.Tween(ReplicatedStorage:FindFirstChild("Diablo").HumanoidRootPart.CFrame)
                                elseif ReplicatedStorage:FindFirstChild("Deandre") then
                                    Main_Module.Tween(ReplicatedStorage:FindFirstChild("Deandre").HumanoidRootPart.CFrame)
                                elseif ReplicatedStorage:FindFirstChild("Urban") then
                                    Main_Module.Tween(ReplicatedStorage:FindFirstChild("Urban").HumanoidRootPart.CFrame)
                                end
                            end
                        end
                    end
                else
                    Main_Module.Tween(CFrame.new(-12554.9443, 337.194092, -7501.44727))
                end
            elseif Player.Backpack:FindFirstChild("God's Chalice") or Player.Character:FindFirstChild("God's Chalice") then
                Main_Module.InvokeRemote("activateColor", "Winter Sky")
                wait(0.5)
                Main_Module.Tween(CFrame.new(-5420.16602, 1084.9657, -2666.8208))
                wait(0.5)
                Main_Module.InvokeRemote("activateColor", "Pure Red")
                wait(0.5)
                Main_Module.Tween(CFrame.new(-5414.41357, 309.865753, -2212.45776))
                wait(0.5)
                Main_Module.InvokeRemote("activateColor", "Snow White")
                wait(0.5)
                Main_Module.Tween(CFrame.new(-4971.47559, 331.565765, -3720.02954))
                wait(0.5)
                Main_Module.EquipTool("God's Chalice")
                wait(0.5)
                Main_Module.Tween(CFrame.new(-5560.27295, 313.915466, -2663.89795))
                wait(0.5)
                Main_Module.Tween(CFrame.new(-5561.37451, 313.342529, -2663.4948))
                wait(1)
                Main_Module.Tween(CFrame.new(5154.17676, 141.786423, 911.046326))
                wait(0.2)
                Main_Module.Tween(CFrame.new(5148.03613, 162.352493, 910.548218))
                wait(1)
                Main_Module.EquipTool("Holy Torch")
                wait(1)
                wait(0.4)
                Main_Module.Tween(CFrame.new(-10752.7695, 412.229523, -9366.36328))
                wait(0.4)
                Main_Module.Tween(CFrame.new(-11673.4111, 331.749023, -9474.34668))
                wait(0.4)
                Main_Module.Tween(CFrame.new(-12133.3389, 519.47522, -10653.1904))
                wait(0.4)
                Main_Module.Tween(CFrame.new(-13336.5, 485.280396, -6983.35254))
                wait(0.4)
                Main_Module.Tween(CFrame.new(-13487.4131, 334.84845, -7926.34863))
                wait(1)

                if Enemies:FindFirstChild("Longma") then
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v.Name == "Longma" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            
                                repeat task.wait()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                until not Tushita_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                else
                    Main_Module.Tween(CFrame.new(-10218, 333, -9444))
                end

                if Enemies:FindFirstChild("rip_indra True Form") then
                    
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v.Name == "rip_indra True Form" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            
                                repeat task.wait()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
            
                                    Main_Module.SetWeapon(Selected_Weapon)
                                    Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                until not Tushita_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                else
                    Main_Module.Tween(CFrame.new(-5333, 424, -2673))
                end
            end
        end
    end
end)

--// Dark Dagger
spawn(function()
    while task.wait() do
        if Dark_Dragger_Quest_Func then
            if Enemies:FindFirstChild("rip_indra True Form") then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == "rip_indra True Form" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                            until not Dark_Dragger_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                Main_Module.Tween(CFrame.new(-5333, 424, -2673))
            end
        end
    end
end)

--// Koko
spawn(function()
    while task.wait() do
        if Koko_Quest_Func then
            if Enemies:FindFirstChild("Order") then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == "Order" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                            until not Koko_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                Main_Module.Tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
            end
        end
    end
end)

--// Spikey Trident
spawn(function()
    while task.wait() do
        if Spikey_Trident_Quest_Func then
            if Enemies:FindFirstChild("Cake Prince") or Enemies:FindFirstChild("Dough King") then

                for Index_1, Value_1 in Enemies:GetChildren() do
                    if Value_1.Name == "Cake Prince" or Value_1.Name == "Dough King" then
                        if Value_1:FindFirstChild('Humanoid') and Value_1:FindFirstChild('HumanoidRootPart') and Value_1:FindFirstChild('Humanoid').Health > 0 then
                            repeat task.wait()
                                Value_1.HumanoidRootPart.CanCollide = false
                                Value_1.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                Value_1.HumanoidRootPart.Transparency = 1
                                Value_1.Humanoid:ChangeState(11)
                                Value_1.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(Value_1.HumanoidRootPart.CFrame * Farm_Mode)

                            until not Spikey_Trident_Quest_Func or not Value_1.Parent or Value_1.Humanoid.Health <= 0 or not Enemies:FindFirstChild(Value_1.Name)
                        end
                    end
                end

            else
                Main_Module.Tween(CFrame.new(-2103, 70, -12165))
                    
                if (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - Player.Character.HumanoidRootPart.Position).Magnitude >= 1000 then
                    Player.Character.HumanoidRootPart.CFrame = CFrame.new(-2103, 70, -12165)
                end
            end
        end
    end
end)

--// Hallow Scythe
spawn(function()
    while task.wait() do
        if Hallow_Scythe_Quest_Func then
            
            if Enemies:FindFirstChild("Soul Reaper") then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == "Soul Reaper" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                            until not Hallow_Scythe_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                Main_Module.Tween(CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813))
            end
        end
    end
end)

--// Citizen
spawn(function()
    while task.wait() do
        if Citizen_Quest_Func then
            local Check_Quest = false

            if Player.Backpack:FindFirstChild("Musketeer Hat") or Player.Character:FindFirstChild("Musketeer Hat") then
                Check_Quest = true
            end

            if Check_Quest then
                Main_Module:SetNotify("Citizen Quest", "- Musketeer Hat Successfully.", 5)
                wait(4)
            end

            if Main_Module.InvokeRemote("CitizenQuestProgress", "Citizen") == 3 then
                Main_Module:SetNotify("Citizen Quest", "- Citizen Quest has completed.", 5)
                wait(4)
            end

            if Player.Data.Level.Value >= 1800 then
                if Main_Module.InvokeRemote("CitizenQuestProgress").KilledBandits == false and Main_Module.InvokeRemote("CitizenQuestProgress").KilledBoss == false then

                    if Player.PlayerGui.Main.Quest.Visible == false then
                        Main_Module.Tween(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                        wait(0.3)
                        if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125) - Player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1)
                            Main_Module.InvokeRemote("StartQuest", "CitizenQuest", 1)
                        end

                    elseif Player.PlayerGui.Main.Quest.Visible == true then
                        if Enemies:FindFirstChild("Forest Pirate") then
                            for i,v in pairs(Enemies:GetChildren()) do
                                if v.Name == "Forest Pirate" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    
                                        repeat task.wait()
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                    
                                            Main_Module.SetWeapon(Selected_Weapon)
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            Main_Module:BringEnemies(v, true)
                                        until not Citizen_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or Main_Module.InvokeRemote("CitizenQuestProgress").KilledBandits == true
                                    end
                                end
                            end
                        else
                            Main_Module.Tween(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
                        end
                    end

                elseif Main_Module.InvokeRemote("CitizenQuestProgress").KilledBandits == true and Main_Module.InvokeRemote("CitizenQuestProgress").KilledBoss == false then

                    if Player.PlayerGui.Main.Quest.Visible == false then
                        Main_Module.Tween(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                        wait(0.3)
                        if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125) - Player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1)
                            Main_Module.InvokeRemote("CitizenQuestProgress", "Citizen")
                        end

                    elseif Player.PlayerGui.Main.Quest.Visible == true then
                        if Enemies:FindFirstChild("Captain Elephant") then
                            for i,v in pairs(Enemies:GetChildren()) do
                                if v.Name == "Captain Elephant" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    
                                        repeat task.wait()
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                    
                                            Main_Module.SetWeapon(Selected_Weapon)
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        until not Citizen_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or Main_Module.InvokeRemote("CitizenQuestProgress").KilledBoss == true
                                    end
                                end
                            end
                        else
                            Main_Module.Tween(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
                        end
                    end

                elseif Main_Module.InvokeRemote("CitizenQuestProgress", "Citizen") == 2 then
                    Main_Module.Tween(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))

                end
            else
                Main_Module:SetNotify("Citizen Quest", "- You need to reach Lv 1800.", 5)
                wait(4)
            end
        end
    end
end)

--// Bartilo
spawn(function()
    while task.wait() do
        if Bartilo_Quest_Func then
            local BartiloNpc = CFrame.new(-455.806122, 73.3869019, 301.771637)

            if Player.Data.Level.Value >= 850 then
                if Main_Module.InvokeRemote("BartiloQuestProgress", "Bartilo") == 0 then
                    local MonsterName = {"Swan Pirate"}
                    local MonsterPos = CFrame.new(1057.92761, 137.614319, 1242.08069)

                    if Player.PlayerGui.Main.Quest.Visible == false then
                        Main_Module.Tween(BartiloNpc)
                        if (BartiloNpc.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                            wait(.1)
                            Main_Module.InvokeRemote("StartQuest", "BartiloQuest", 1)
                        end

                    elseif Player.PlayerGui.Main.Quest.Visible == true then
                        if Enemies:FindFirstChild("Swan Pirate") then

                            for i,v in pairs(Enemies:GetChildren()) do
                                if v.Name == "Forest Pirate" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    
                                        repeat task.wait()
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                    
                                            Main_Module.SetWeapon(Selected_Weapon)
                                            Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            Main_Module:BringEnemies(v, true)
                                        until not Bartilo_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or Main_Module.InvokeRemote("CitizenQuestProgress").KilledBandits == true
                                    end
                                end
                            end

                        else
                            Main_Module.WaitMobs(MonsterPos)
                        end

                    end

                elseif Main_Module.InvokeRemote("BartiloQuestProgress", "Bartilo") == 1 then
                    local MonsterName = {"Jeremy"}
                    local MonsterPos = CFrame.new(1931.5931396484, 402.67391967773, 956.52215576172)

                    Main_Module.InvokeRemote("BartiloQuestProgress", "Bartilo")
                    wait(0.1)

                    if Enemies:FindFirstChild(Jeremy) then

                        OtherModules.AttackMonster(MonsterName, Function)

                    else
                        Main_Module.Tween(MonsterPos)
                    end

                elseif Main_Module.InvokeRemote("BartiloQuestProgress", "Bartilo") == 2 then
                    local PlayerPos = Player.Character.HumanoidRootPart.CFrame
                    local Puzzle_1 = CFrame.new(-1836.1412353515625, 10.458294868469238, 1692.491943359375)

                    if (Player.Character.HumanoidRootPart.Position - Puzzle_1.Position).Magnitude > 1000 then
                        Main_Module.Tween(Puzzle_1)
                    else
                        wait(1)
                        PlayerPos = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
                        wait(1)
                        PlayerPos = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
                        wait(1)
                        PlayerPos = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
                        wait(1)
                        PlayerPos = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
                        wait(1)
                        PlayerPos = CFrame.new(-1869.54224, 15.987854, 1681.00659)
                        wait(1)
                        PlayerPos = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
                        wait(1)
                        PlayerPos = CFrame.new(-1819.26343, 14.795166, 1717.90625)
                        wait(1)
                        PlayerPos = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
                    end

                end
            else
                Main_Module:SetNotify("Citizen Quest", "- You need to reach Lv 850.", 5)
                wait(4)
            end
        end
    end
end)

--// Don Swan
spawn(function()
    while task.wait() do
        if Down_Swan_Quest_Func then
            if Enemies:FindFirstChild("Don Swan") then

                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == "Don Swan" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                            until not Down_Swan_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end

            else
                Main_Module.Tween(CFrame.new(2191.1674804688, 15.177842140198, 694.69873046875))
            end
        end
    end
end)

--// Rip Indra True Form
spawn(function()
    while task.wait() do
        if rip_indra_True_Form_Quest_Func then
            if Enemies:FindFirstChild("rip_indra True Form") then

                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == "rip_indra True Form" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                            until not rip_indra_True_Form_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end

            else
                Main_Module.Tween(CFrame.new(-5524.53271, 313.800537, -2918.07422))
            end
        end
    end
end)

--// Rainbow Haki
spawn(function()
    while task.wait() do
        if Rainbow_Haki_Quest_Func then
            local HornedManNpc = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)

            if Player.PlayerGui.Main.Quest.Visible == false then
                --[[if (CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875) - Player.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                    wait(1)
                    Main_Module.InvokeRemote("HornedMan", "Bet")
                end]]
                Main_Module.InvokeRemote("HornedMan", "Bet")
            elseif Player.PlayerGui.Main.Quest.Visible == true then
                if string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                    if Enemies:FindFirstChild("Stone") then

                        for i,v in pairs(Enemies:GetChildren()) do
                            if v.Name == "Stone" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                
                                    repeat task.wait()
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    until not Rainbow_Haki_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone")
                                end
                            end
                        end

                    else
                        Main_Module.Tween(CFrame.new(-1049, 40, 6791))
                    end

                elseif string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
                    if Enemies:FindFirstChild("Hydra Leader") then

                        for i,v in pairs(Enemies:GetChildren()) do
                            if v.Name == "Hydra Leader" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                
                                    repeat task.wait()
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    until not Rainbow_Haki_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader")
                                end
                            end
                        end

                    else
                        Main_Module.Tween(CFrame.new(5836, 1019, -83))
                    end

                elseif string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                    if Enemies:FindFirstChild("Kilo Admiral") then

                        for i,v in pairs(Enemies:GetChildren()) do
                            if v.Name == "Kilo Admiral" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                
                                    repeat task.wait()
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    until not Rainbow_Haki_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral")
                                end
                            end
                        end

                    else
                        Main_Module.Tween(CFrame.new(2904, 509, -7349))
                    end

                elseif string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                    if Enemies:FindFirstChild("Captain Elephant") then

                        for i,v in pairs(Enemies:GetChildren()) do
                            if v.Name == "Captain Elephant" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                
                                    repeat task.wait()
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    until not Rainbow_Haki_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")
                                end
                            end
                        end

                    else
                        Main_Module.Tween(CFrame.new(-13393, 319, -8423))
                    end

                elseif string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                    if Enemies:FindFirstChild("Beautiful Pirate") then

                        for i,v in pairs(Enemies:GetChildren()) do
                            if v.Name == "Beautiful Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                
                                    repeat task.wait()
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                
                                        Main_Module.SetWeapon(Selected_Weapon)
                                        Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    until not Rainbow_Haki_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or not string.find(Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate")
                                end
                            end
                        end

                    else
                        Main_Module.Tween(CFrame.new(5370, 22, -89))
                    end
                end
            end
        end
    end
end)

--// Pray and Try Luck Gravestone
spawn(function()
    while task.wait() do
        if Pray_and_Tryluck_Quest_Func then
            if (CFrame.new(-8652.99707, 143.450119, 6170.50879) - Player.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                wait(1)
                Main_Module.InvokeRemote("gravestoneEvent", 1)
                Main_Module.InvokeRemote("gravestoneEvent", 2)
            end
        end
    end
end)

--// Advance Dungeon Bird-Bird: Phoenix
spawn(function()
    while task.wait() do
        if Advanced_Dungeon_Phoenix_Quest_Func then
            if Player.Character:FindFirstChild("Bird-Bird: Phoenix") or Player.Backpack:FindFirstChild("Bird-Bird: Phoenix") then
                if Player.Backpack:FindFirstChild(Player.Data.DevilFruit.Value) then
                    if Player.Backpack:FindFirstChild(Player.Data.DevilFruit.Value).Level.Value >= 400 then
                        Main_Module.Tween(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                        
                        if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1)
                            Main_Module.InvokeRemote("SickScientist", "Check")
                            Main_Module.InvokeRemote("SickScientist", "Heal")
                        end
                    end
                end
            end
        end
    end
end)

--// Color Haki
spawn(function()
    while task.wait() do
        if Color_Haki_Quest_Func then
            Main_Module.InvokeRemote("ColorsDealer", "1")
            Main_Module.InvokeRemote("ColorsDealer", "2")
            Main_Module.InvokeRemote("ColorsDealer", "3")
        end
    end
end)

--// Venom Bow
spawn(function()
    while task.wait() do
        if Venom_Bow_Quest_Func then
            if Enemies:FindFirstChild("Hydra Leader") then

                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == "Hydra Leader" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                            until not Venom_Bow_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name) or Player.Backpack:FindFirstChild("Venom Bow") or Player.Character:FindFirstChild("Venom Bow")
                        end
                    end
                end

            else
                Main_Module.Tween(CFrame.new(5836, 1019, -83))
            end
        end
    end
end)

--// Dojo Quest
spawn(function()
    while task.wait() do
        if Dojo_Quest_Func then
            Main_Module.Tween(CFrame.new(5855.19629, 1208.32178, 872.713501))

            if (CFrame.new(5855.19629, 1208.32178, 872.713501).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                local ohTable1 = {
                    ["NPC"] = "Dojo Trainer",
                    ["Command"] = "ClaimQuest"
                }
                Main_Module.InvokeModules("RF/InteractDragonQuest", ohTable1)

                wait(1)

                local ohTable2 = {
                    ["NPC"] = "Dojo Trainer",
                    ["Command"] = "RequestQuest"
                }
                Main_Module.InvokeModules("RF/InteractDragonQuest", ohTable2)
            end
        end
    end
end)

--// Hydra Mobs
spawn(function()
    while task.wait() do
        if Hydra_Mob_Quest_Func then
            if Enemies:FindFirstChild('Hydra Enforcer') or Enemies:FindFirstChild('Venomous Assailant') then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == 'Hydra Enforcer' or v.Name == 'Venomous Assailant' then
                        if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Selected_Weapon)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                Main_Module:BringEnemies(v, true)
                            until not Hydra_Mob_Quest_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                Main_Module.Tween(CFrame.new(5394.36475, 1082.71057, 561.993958))
            end
            for i,v in pairs(workspace:GetChildren()) do
                if v.Name == 'EmberTemplate' then
                    v.Part.CFrame = Player.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
end)

--// Destroy Tree
spawn(function()
    while task.wait() do
        if Destroy_Tree_Quest_Func then
            Main_Module.Tween(CFrame.new(5287.38867, 1005.39508, 389.256714) * CFrame.new(0,50,0))
            Main_Module.EquipTool("Blox Fruit")

            for i,v in pairs(workspace:GetChildren()) do
                if v.Name == 'EmberTemplate' then
                    v.Part.CFrame = Player.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
end)

--// Upgrade Dragon Talon
spawn(function()
    while task.wait() do
        if Upgrade_Dragon_Talon_Quest_Func then
            Main_Module.Tween(CFrame.new(5661.89014, 1211.31909, 864.836731))

            if (CFrame.new(5661.89014, 1211.31909, 864.836731).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                local ohTable1 = {
                    ["NPC"] = "Uzoth",
                    ["Command"] = "Upgrade"
                }
                
                Main_Module.InvokeModules("RF/InteractDragonQuest", ohTable1)
            end
        end
    end
end)

return QuestModules