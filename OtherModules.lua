--// Path
local TweenService: TweenService = game:GetService("TweenService");
local VirtualInputManager: VirtualInputManager = game:GetService("VirtualInputManager")
local CollectionService: CollectionService = game:GetService("CollectionService")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService: TeleportService = game:GetService("TeleportService")
local RunService: RunService = game:GetService("RunService")
local Players: Players = game:GetService("Players")

local ChestModels = workspace:WaitForChild("ChestModels");
local WorldOrigin = workspace:WaitForChild("_WorldOrigin");
local Characters = workspace:WaitForChild("Characters");
local SeaBeasts = workspace:WaitForChild("SeaBeasts");
local Enemies = workspace:WaitForChild("Enemies");
local Map = workspace:WaitForChild("Map");
local Boats = workspace:WaitForChild("Boats");

local EnemySpawns = WorldOrigin:WaitForChild("EnemySpawns");
local Locations = WorldOrigin:WaitForChild("Locations");

local RenderStepped = RunService.RenderStepped
local Heartbeat = RunService.Heartbeat
local Stepped = RunService.Stepped
local Player = game:GetService('Players').LocalPlayer;
local OldBounty = Player.leaderstats["Bounty/Honor"].Value

local Main_Module = loadstring(game:HttpGet("https://files.btteam.net/files/games/bf/modules/Front-modules.lua"))()

local OtherModules = {} do

    OtherModules.RedeemCodes = {
        "fudd10"; "fudd10_V2"; "Chandler"; "BigNews"; "KITT_RESET"; "Sub2UncleKizaru"; "SUB2GAMERROBOT_RESET1"; "ADMINFIGHT"; "Sub2Fer999"; "Enyu_is_Pro";
        "JCWK"; "StarcodeHEO"; "MagicBUS"; "KittGaming"; "Sub2CaptainMaui"; "Sub2OfficialNoobie"; "TheGreatAce"; "Sub2NoobMaster123"; "Sub2Daigrock"; "Axiore";
        "StrawHatMaine"; "TantaiGaming"; "Bluxxy"; "SUB2GAMERROBOT_EXP1"; "GIFTING_HOURS"; "EARN_FRUITS"; "FIGHT4FRUIT"; "NOEXPLOITER"; "ADMINHACKED"; "NOOB2ADMIN";
        "CODESLIDE"; "ADMINDARES"; "fruitconcepts"; "krazydares"; "TRIPLEABUSE"; "SEATROLLING"; "24NOADMIN"; "REWARDFUN"; "NEWTROLL"; "SECRET_ADMIN";
        "ADMIN_TROLL"; "youtuber_shipbattle"; "STAFFBATTLE"; "ADMIN_STRENGTH"; "JULYUPDATE_RESET"; "DRAGONABUSE"; "NOOB2PRO"; "CINCODEMAYO_BOOST"; "Noob_Refund"; "CODE_SERVICIO";
        "DEVSCOOKING"; "TY_FOR_WATCHING"; "GAMERROBOT_YT"; "GAMER_ROBOT_1M"; "EXP_5B"; "RESET_5B"; "1MLIKES_RESET"; "THIRDSEA"; "1BILLION"; "2BILLION";
        "3BVISITS"; "Update10"; "Update11"; "UPD14"; "UPD15"; "UPD16"; "ShutDownFix2"; "XmasExp"; "XmasReset"; "PointsReset";
        "Colosseum"; "Sky Island 3"; "Fountain City"; "Control"; "NOMOREHACK"; "BANEXPLOIT";

    }

    OtherModules.CheckFruits = {
        ["Rocket-Rocket"] = {
            ["Name"] = "Rocket Fruit",
            ["Id"] = "rbxassetid://15060012861",
            ["Rarity"] = 0
        },
        ["Spin-Spin"] = {
            ["Name"] = "Spin Fruit",
            ["Id"] = "rbxassetid://15057683975",
            ["Rarity"] = 0
        },
        ["Blade-Blade"] = {
            ["Name"] = "Blade Fruit",
            ["Id"] = "rbxassetid://15104782377",
            ["Rarity"] = 0
        },
        ["Spring-Spring"] = {
            ["Name"] = "Spring Fruit",
            ["Id"] = "rbxassetid://15105281957",
            ["Rarity"] = 0
        },
        ["Bomb-Bomb"] = {
            ["Name"] = "Bomb Fruit",
            ["Id"] = "rbxassetid://15116740364",
            ["Rarity"] = 0
        },
        ["Smoke-Smoke"] = {
            ["Name"] = "Smoke Fruit",
            ["Id"] = "rbxassetid://15116696973",
            ["Rarity"] = 0
        },
        ["Spike-Spike"] = {
            ["Name"] = "Spike Fruit",
            ["Id"] = "rbxassetid://15107005807",
            ["Rarity"] = 0
        },
        ["Flame-Flame"] = {
            ["Name"] = "Flame Fruit",
            ["Id"] = "rbxassetid://15111584216",
            ["Rarity"] = 1
        },
        ["Falcon-Falcon"] = {
            ["Name"] = "Falcon Fruit",
            ["Id"] = "rbxassetid://15112469964",
            ["Rarity"] = 1
        },
        ["Ice-Ice"] = {
            ["Name"] = "Ice Fruit",
            ["Id"] = "rbxassetid://15100433167",
            ["Rarity"] = 1
        },
        ["Sand-Sand"] = {
            ["Name"] = "Sand Fruit",
            ["Id"] = "rbxassetid://15111517529",
            ["Rarity"] = 1
        },
        ["Dark-Dark"] = {
            ["Name"] = "Dark Fruit",
            ["Id"] = "rbxassetid://15111553409",
            ["Rarity"] = 1
        },
        ["Diamond-Diamond"] = {
            ["Name"] = "Diamond Fruit",
            ["Id"] = "rbxassetid://15112600534",
            ["Rarity"] = 1
        },
        ["Light-Light"] = {
            ["Name"] = "Light Fruit",
            ["Id"] = "rbxassetid://15100283484",
            ["Rarity"] = 2
        },
        ["Rubber-Rubber"] = {
            ["Name"] = "Rubber Fruit",
            ["Id"] = "rbxassetid://15104817760",
            ["Rarity"] = 2
        },
        ["Barrier-Barrier"] = {
            ["Name"] = "Barrier Fruit",
            ["Id"] = "rbxassetid://15100485671",
            ["Rarity"] = 2
        },
        ["Ghost-Ghost"] = {
            ["Name"] = "Ghost Fruit",
            ["Id"] = "rbxassetid://15112333093",
            ["Rarity"] = 2
        },
        ["Magma-Magma"] = {
            ["Name"] = "Magma Fruit",
            ["Id"] = "rbxassetid://15105350415",
            ["Rarity"] = 2
        },
        ["Quake-Quake"] = {
            ["Name"] = "Quake Fruit",
            ["Id"] = "rbxassetid://15057718441",
            ["Rarity"] = 3
        },
        ["Buddha-Buddha"] = {
            ["Name"] = "Buddha Fruit",
            ["Id"] = "rbxassetid://15100313696",
            ["Rarity"] = 3
        },
        ["Love-Love"] = {
            ["Name"] = "Love Fruit",
            ["Id"] = "rbxassetid://15116730102",
            ["Rarity"] = 3
        },
        ["Spider-Spider"] = {
            ["Name"] = "Spider Fruit",
            ["Id"] = "rbxassetid://15116967784",
            ["Rarity"] = 3
        },
        ["Sound-Sound"] = {
            ["Name"] = "Sound Fruit",
            ["Id"] = "rbxassetid://14661873358",
            ["Rarity"] = 3
        },
        ["Phoenix-Phoenix"] = {
            ["Name"] = "Phoenix Fruit",
            ["Id"] = "rbxassetid://15100246632",
            ["Rarity"] = 3
        },
        ["Portal-Portal"] = {
            ["Name"] = "Portal Fruit",
            ["Id"] = "rbxassetid://15112215862",
            ["Rarity"] = 3
        },
        ["Rumble-Rumble"] = {
            ["Name"] = "Rumble Fruit",
            ["Id"] = "rbxassetid://15116747420",
            ["Rarity"] = 3
        },
        ["Pain-Pain"] = {
            ["Name"] = "Pain Fruit",
            ["Id"] = "rbxassetid://15116721173",
            ["Rarity"] = 3
        },
        ["Blizzard-Blizzard"] = {
            ["Name"] = "Blizzard Fruit",
            ["Id"] = "rbxassetid://15100384816",
            ["Rarity"] = 3
        },
        ["Gravity-Gravity"] = {
            ["Name"] = "Gravity Fruit",
            ["Id"] = "rbxassetid://15100299740",
            ["Rarity"] = 4
        },
        ["Mammoth-Mammoth"] = {
            ["Name"] = "Mammoth Fruit",
            ["Id"] = "rbxassetid://14661837634",
            ["Rarity"] = 4
        },
        ["T-Rex-T-Rex"] = {
            ["Name"] = "T-Rex Fruit",
            ["Id"] = "rbxassetid://15708895165",
            ["Rarity"] = 4
        },
        ["Dough-Dough"] = {
            ["Name"] = "Dough Fruit",
            ["Id"] = "rbxassetid://15100273645",
            ["Rarity"] = 4
        },
        ["Shadow-Shadow"] = {
            ["Name"] = "Shadow Fruit",
            ["Id"] = "rbxassetid://15112263502",
            ["Rarity"] = 4
        },
        ["Control-Control"] = {
            ["Name"] = "Control Fruit",
            ["Id"] = "rbxassetid://15100184583",
            ["Rarity"] = 4
        },
        ["Leopard-Leopard"] = {
            ["Name"] = "Leopard Fruit",
            ["Id"] = "rbxassetid://15106768588",
            ["Rarity"] = 4
        },
        ["Kitsune-Kitsune"] = {
            ["Name"] = "Kitsune Fruit",
            ["Id"] = "rbxassetid://15482881956",
            ["Rarity"] = 4
        },
        ["Spirit-Spirit"] = {
            ["Name"] = "Spirit Fruit",
            ["Id"] = "rbxassetid://11911905519",
            ["Rarity"] = 4
        },
        ["Gas-Gas"] = {
            ["Name"] = "Gas Fruit",
            ["Id"] = "rbxassetid://118054805452821",
            ["Rarity"] = 4
        },
        ["Yeti-Yeti"] = {
            ["Name"] = "Yeti Fruit",
            ["Id"] = "rbxassetid://115276580506154",
            ["Rarity"] = 4
        },
        ["Venom-Venom"] = {
            ["Name"] = "Venom Fruit",
            ["Id"] = "https://assetdelivery.roblox.com/v1/asset/?id=10395893751",
            ["Rarity"] = 4
        },
        ["Dragon-Dragon"] = {
            ["Name"] = "Dragon Fruit",
            ["Id"] = "https://assetdelivery.roblox.com/v1/asset/?id=10537896371",
            ["Rarity"] = 4
        },
    }

    OtherModules.Shops = {
        ["Main"] = {
            ["Ghoul Race - 100 Ectoplasm"] = {"Ectoplasm", "Change", 4},
            ["Cyborg Race"] = {"CyborgTrainer", "Buy"},
            ["Suprissed Bone - 50 Bones"] = {"Bones", "Buy", 1, 1},
            ["Stat Refund - f2,500"] = {"BlackbeardReward", "Refund", "2"},
            ["Reroll Race - f3,000"] = {"BlackbeardReward", "Reroll", "2"},
        },

        ["Fighting Style"] = {
            ["Dark Step - $150,000"] = {"BuyBlackLeg"},
            ["Electric - $500,000"] = {"BuyElectro"},
            ["Water Kung Fu - $750,000"] = {"BuyFishmanKarate"},
            ["Dragon Breath - f1,500"] = {"BlackbeardReward","DragonClaw","2"},
            ["Superhuman - $3,000,000"] = {"BuySuperhuman"},
            ["Death Step - $2,500,000/f5,000"] = {"BuyDeathStep"},
            ["Sharkman Karate - $2,500,000/f5,000"] = {"BuySharkmanKarate"},
            ["Electric Claw - $3,000,000/f5,000"] = {"BuyElectricClaw"},
            ["Dragon Talon - $3,000,000/f5,000"] = {"BuyDragonTalon"},
            ["Godhuman - $5,000,000/f5,000"] = {"BuyGodhuman"},
            ["Sanguine Art - $5,000,000/f5,000"] = {"BuySanguineArt"},
        },

        ["Sword"] = {
            ["Cutlass - $1,000"] = {"BuyItem", "Cutlass"},
            ["Katana - $1,000"] = {"BuyItem", "Katana"},
            ["Dual Katana - $12,000"] = {"BuyItem", "Dual Katana"},
            ["Iron Mace - $25,000"] = {"BuyItem", "Iron Mace"},
            ["Triple Katana - $60,000"] = {"BuyItem", "Triple Katana"},
            ["Pipe - $100,000"] = {"BuyItem", "Pipe"},
            ["Dual-Headed Blade - $400,000"] = {"BuyItem", "Dual-Headed Blade"},
            ["Soul Cane - $750,000"] = {"BuyItem", "Soul Cane"},
            ["Bisento - $1,200,000"] = {"BuyItem", "Bisento"},
            ["Pole V2 - f5,000"] = {"ThunderGodTalk"},
        },

        ["Abilities"] = {
            ["Air Jump - $10,000"] = {"BuyHaki", "Geppo"},
            ["Aura - $25,000"] = {"BuyHaki", "Buso"},
            ["Flash Step - $100,000"] = {"BuyHaki", "Soru"},
            ["Instinct V1 - $750,000"] = {"Buy", "KenTalk"},
        },

        ["Gun"] = {
            ["Slingshot - $5,000"] = {"BuyItem", "Slingshot"},
            ["Musket - $8,000"] = {"BuyItem", "Musket"},
            ["Flintlock - $10,500"] = {"BuyItem", "Flintlock"},
            ["Refined Slingshot - $30,000"] = {"BuyItem", "Refined Slingshot"},
            ["Refined Flintlock - $65,000"] = {"BuyItem", "Refined Flintlock"},
            ["Dual Flintlock - $65,000"] = {"BuyItem", "Dual Flintlock"},
            ["Cannon - $100,000"] = {"BuyItem", "Cannon"},
            ["Kabucha - f1,500"] = {"BlackbeardReward", "Slingshot", "2"},
        },

        ["Accessories"] = {
            ["Black Cape - $50,000"] = {"BuyItem", "Black Cape"},
            ["Swordsman Hat - $150,000"] = {"BuyItem", "Swordsman Hat"},
            ["Tomoe Ring - $500,000"] = {"BuyItem", "Tomoe Ring"},
        }
    }

    OtherModules.RaidChip = {
        "Flame";
        "Ice";
        "Quake";
        "Light";
        "Dark";
        "Spider";
        "Rumble";
        "Magma";
        "Buddha";
        "Sand";
        "Phoenix";
        "Dough"
    }

    OtherModules.BuyMicrochips = function()
        if not Player.Character:FindFirstChild('Microchip') or not Player.Backpack:FindFirstChild('Microchip') or not Player.Character:FindFirstChild('Special Microchip') or not Player.Backpack:FindFirstChild('Special Microchip') then
            Main_Module.InvokeRemote('RaidsNpc', "Select", Select_Chips_Raid_Func)
        end
    end

    OtherModules.AutoStartRaids = function()
        if Player.Character:FindFirstChild('Microchip') or Player.Backpack:FindFirstChild('Microchip') or Player.Character:FindFirstChild('Special Microchip') or Player.Backpack:FindFirstChild('Special Microchip') then
            if Main_Module.GameData.Sea == 2 then
                fireclickdetector(Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)

            elseif Main_Module.GameData.Sea == 3 then
                local RaidLab = CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469)

                if (RaidLab.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 10 then
                    Main_Module.Tween(RaidLab)
                elseif (RaidLab.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 10 then
                    wait(1)
                    fireclickdetector(Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                end
            end
        end
    end

    OtherModules.GetShopList = function(TargetShop: string?): (nil)
        local ShopTable = {}

        for shop_Index, shop_Value in OtherModules.Shops do
            if shop_Index == TargetShop then
                for newshop_Index, newshop_Value in shop_Value do
                    table.insert(ShopTable, newshop_Index)
                end
            end
        end

        return ShopTable
    end

    OtherModules.GetBuyinShop = function(TargetShop: string, FunctionBuy: boolean?): (nil)
        for shop_Index, shop_Value in OtherModules.Shops do
            if shop_Index == TargetShop then
                for newshop_Index, newshop_Value in shop_Value do
                    if newshop_Index == FunctionBuy then
                        Main_Module.InvokeRemote(unpack(newshop_Value))
                    end
                end
            end
        end
    end

    OtherModules.AttackMonster = function(MonsterTables: table, is_Function: boolean?): (nil)
        if not is_Function then return end

        for i,v in Enemies:GetChildren() do
            if table.find(MonsterTables, v.Name) then
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
                    until not is_Function or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                end
            end
        end
    end

    OtherModules.BartiloQuest = function(Function: boolean?): (nil)
        if not Function then return end

        local RequiredLevel = 850
        local BartiloNpc = CFrame.new(-455.806122, 73.3869019, 301.771637)

        if Player.Data.Level.Value >= RequiredLevel then
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

                        OtherModules.AttackMonster(MonsterName, Function)

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
        end
    end

    function OtherModules.AutoSecondWorld()
        if not Second_World_Quest_Func then return end

        local MonsterTables = {"Ice Admiral"}
        local KeyDoor = CFrame.new(1347.65271, 37.3906517, -1325.07715)

        if Main_Module.InvokeRemote("DressrosaQuestProgress").UsedKey == false then
            if Player.Backpack:FindFirstChild("Key") or Player.Character:FindFirstChild("Key") then
                Main_Module.EquipTool("Key")
                if (KeyDoor.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 5 then
                    Main_Module.InvokeRemote("OpenLibrary")
                else
                    Main_Module.Tween(KeyDoor)
                end
            else
                Main_Module.InvokeRemote("DressrosaQuestProgress", "Detective")
            end

        elseif Main_Module.InvokeRemote("DressrosaQuestProgress").UsedKey == true then
            if Main_Module.InvokeRemote("DressrosaQuestProgress").KilledIceBoss == false then
                if Enemies:FindFirstChild("Ice Admiral") then
                    OtherModules.AttackMonster(MonsterTables, Second_World_Quest_Func)
                else
                    for i,v in ReplicatedStorage:GetChildren() do
                        if v.Name == "Ice Admiral" then
                            Main_Module.Tween(v.HumanoidRootPart.CFrame)
                        end
                    end
                end

            elseif Main_Module.InvokeRemote("DressrosaQuestProgress").KilledIceBoss == true then
                Main_Module.InvokeRemote("TravelDressrosa")
            end
        end
    end

    function OtherModules.AutoThirdWorld()
        if not Third_World_Quest_Func then return end

        if Main_Module.InvokeRemote("BartiloQuestProgress", "Bartilo") == 3 then
            if Main_Module.InvokeRemote("GetUnlockables").FlamingoAccess == nil then
                TabelDevilFruitStore = {}
                TabelDevilFruitOpen = {}

                for i,v in Main_Module.InvokeRemote("getInventoryFruits") do
                    for i1,v1 in pairs(v) do
                        if i1 == "Name" then
                            table.insert(TabelDevilFruitStore,v1)
                        end
                    end
                end

                for i,v in Main_Module.InvokeRemote("GetFruits") do
                    if v.Price >= 1000000 then
                        table.insert(TabelDevilFruitOpen,v.Name)
                    end
                end

                for i,DevilFruitOpenDoor in TabelDevilFruitOpen do
                    for i1,DevilFruitStore in TabelDevilFruitStore do
                        if DevilFruitOpenDoor == DevilFruitStore and Main_Module.InvokeRemote("GetUnlockables").FlamingoAccess == nil then
                            if not Player.Backpack:FindFirstChild(DevilFruitStore) then
                                Main_Module.InvokeRemote("LoadFruit", DevilFruitStore)
                            else
                                Main_Module.InvokeRemote("TalkTrevor", "1")
                                Main_Module.InvokeRemote("TalkTrevor", "2")
                                Main_Module.InvokeRemote("TalkTrevor", "3")
                            end
                        end
                    end
                end
                Main_Module.InvokeRemote("TalkTrevor", "1")
                Main_Module.InvokeRemote("TalkTrevor", "2")
                Main_Module.InvokeRemote("TalkTrevor", "3")

            elseif Main_Module.InvokeRemote("GetUnlockables").FlamingoAccess == true then
                if Main_Module.InvokeRemote("ZQuestProgress", "Check") == nil then
                    local BossNamed = {"Don Swan"}
                    local BossPoss = CFrame.new(2288.802, 15.1870775, 863.034607)

                    if Enemies:FindFirstChild("Don Swan") then
                        OtherModules.AttackMonster(BossNamed, Third_World_Quest_Func)
                    else
                        Main_Module.Tween(BossPoss)
                    end

                elseif Main_Module.InvokeRemote("ZQuestProgress", "Check") == 0 then
                    local NPCThirdSea = CFrame.new(-1926.59277, 10.7166662, 1720.21216)
                    local BossNamed = {"rip_indra"}

                    if Main_Module.InvokeRemote("ZQuestProgress", "Begin") == 'Let us begin.' then
                        if Enemies:FindFirstChild("Don Swan") then
                            OtherModules.AttackMonster(BossNamed, Third_World_Quest_Func)
                        else
                            Main_Module.Tween(BossPoss)
                        end

                    else
                        if (NPCThirdSea.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 5 then
                            Main_Module.InvokeRemote("ZQuestProgress", "Check")
                            wait(.1)
                            Main_Module.InvokeRemote("ZQuestProgress", "Begin")
                            wait(.1)
                        else
                            Main_Module.Tween(NPCThirdSea)
                        end
                    end

                elseif Main_Module.InvokeRemote("ZQuestProgress", "Check") == 1 then
                    Main_Module.InvokeRemote("TravelZou")
                end
            end

        else
            OtherModules.BartiloQuest(Third_World_Quest_Func)
        end
    end

    function OtherModules.ButtonIslandTeleport(is_Button, is_Title)
        is_Button:AddButton({
            Text = is_Title,
            Callback = function()
                Main_Module.Tween(Main_Module.Island[is_Title])
            end
        })
    end

    function OtherModules.IslandTeleports(is_Button)
        if Main_Module.GameData.Sea == 1 then
            OtherModules.ButtonIslandTeleport(is_Button, "Start Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Marine Start")
            OtherModules.ButtonIslandTeleport(is_Button, "Middle Town")
            OtherModules.ButtonIslandTeleport(is_Button, "Jungle")
            OtherModules.ButtonIslandTeleport(is_Button, "Pirate Village")
            OtherModules.ButtonIslandTeleport(is_Button, "Desert")
            OtherModules.ButtonIslandTeleport(is_Button, "Frozen Village")
            OtherModules.ButtonIslandTeleport(is_Button, "Marine Ford")
            OtherModules.ButtonIslandTeleport(is_Button, "Colosseum")
            OtherModules.ButtonIslandTeleport(is_Button, "Sky island 1")
            OtherModules.ButtonIslandTeleport(is_Button, "Sky island 2")
            OtherModules.ButtonIslandTeleport(is_Button, "Sky island 3")
            OtherModules.ButtonIslandTeleport(is_Button, "Sky island 4")
            OtherModules.ButtonIslandTeleport(is_Button, "Prison")
            OtherModules.ButtonIslandTeleport(is_Button, "Magma Village")
            OtherModules.ButtonIslandTeleport(is_Button, "UndeyWater City")
            OtherModules.ButtonIslandTeleport(is_Button, "Fountain City")
            OtherModules.ButtonIslandTeleport(is_Button, "House Cyborgs")
            OtherModules.ButtonIslandTeleport(is_Button, "Shanks Room")
            OtherModules.ButtonIslandTeleport(is_Button, "Mob Island")
            
        elseif Main_Module.GameData.Sea == 2 then
            OtherModules.ButtonIslandTeleport(is_Button, "Dock")
            OtherModules.ButtonIslandTeleport(is_Button, "Kingdom of Rose")
            OtherModules.ButtonIslandTeleport(is_Button, "Mansion")
            OtherModules.ButtonIslandTeleport(is_Button, "Flamingo Room")
            OtherModules.ButtonIslandTeleport(is_Button, "Green Zone")
            OtherModules.ButtonIslandTeleport(is_Button, "Cafe")
            OtherModules.ButtonIslandTeleport(is_Button, "Factory")
            OtherModules.ButtonIslandTeleport(is_Button, "Colosseum")
            OtherModules.ButtonIslandTeleport(is_Button, "Grave Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Snow Mountain")
            OtherModules.ButtonIslandTeleport(is_Button, "Cold Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Hot Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Cursed Ship")
            OtherModules.ButtonIslandTeleport(is_Button, "Ice Castle")
            OtherModules.ButtonIslandTeleport(is_Button, "Forgotten Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Usoapp Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Minisky Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Raid Lab")

        elseif Main_Module.GameData.Sea == 3 then
            OtherModules.ButtonIslandTeleport(is_Button, "Port Town")
            OtherModules.ButtonIslandTeleport(is_Button, "Hydra Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Great Tree")
            OtherModules.ButtonIslandTeleport(is_Button, "Castle on the Sea")
            OtherModules.ButtonIslandTeleport(is_Button, "Floating Turtle")
            OtherModules.ButtonIslandTeleport(is_Button, "Mansion")
            OtherModules.ButtonIslandTeleport(is_Button, "Secret Temple")
            OtherModules.ButtonIslandTeleport(is_Button, "Friendly Arena")
            OtherModules.ButtonIslandTeleport(is_Button, "Beautiful Pirate Domain")
            OtherModules.ButtonIslandTeleport(is_Button, "Teler Park")
            OtherModules.ButtonIslandTeleport(is_Button, "Peanut Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Chocolate Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Ice Cream Island")
            OtherModules.ButtonIslandTeleport(is_Button, "Haunted Castle")
            OtherModules.ButtonIslandTeleport(is_Button, "Cake Loaf")
            OtherModules.ButtonIslandTeleport(is_Button, "Candy Cane")
            OtherModules.ButtonIslandTeleport(is_Button, "Tiki Outpost")
            OtherModules.ButtonIslandTeleport(is_Button, "Raid Lab")
            OtherModules.ButtonIslandTeleport(is_Button, "Mini Sky")
            OtherModules.ButtonIslandTeleport(is_Button, "Sea of Treats")
            OtherModules.ButtonIslandTeleport(is_Button, "Sea Castle")

        end
    end

    function OtherModules.StatsUpped()
        for stats_Index, stats_Value in Stats_Listed_Func do
            if stats_Index == "Melee" then
                if stats_Value == true then
                    Main_Module.InvokeRemote("AddPoint", "Melee", tonumber(Up_Stat_Req_Point_Func))
                end

            elseif stats_Index == "Defense" then
                if stats_Value == true then
                    Main_Module.InvokeRemote("AddPoint", "Defense", tonumber(Up_Stat_Req_Point_Func))
                end

            elseif stats_Index == "Sword" then
                if stats_Value == true then
                    Main_Module.InvokeRemote("AddPoint", "Sword", tonumber(Up_Stat_Req_Point_Func))
                end

            elseif stats_Index == "Blox Fruit" then
                if stats_Value == true then
                    Main_Module.InvokeRemote("AddPoint", "Demon Fruit", tonumber(Up_Stat_Req_Point_Func))
                end

            elseif stats_Index == "Gun" then
                if stats_Value == true then
                    Main_Module.InvokeRemote("AddPoint", "Gun", tonumber(Up_Stat_Req_Point_Func))
                end

            end
        end
    end

    function OtherModules.GetShopFruits()
        local Fruits_Table_Shop = {}

        for index_Fruits, value_Fruits in Main_Module.InvokeRemote("GetFruits") do
            table.insert(Fruits_Table_Shop, value_Fruits.Name)
        end

        return Fruits_Table_Shop
    end

    function OtherModules.CreateESP(PartTarget, PartName, is_Colors)
        if not PartTarget:FindFirstChild("BillboardGui") then
            local BillboardGui = Instance.new("BillboardGui")
            local TextLabel = Instance.new("TextLabel")

            BillboardGui.Name = "BillboardGui"
            BillboardGui.Parent = PartTarget
            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            BillboardGui.Active = true
            BillboardGui.AlwaysOnTop = true
            BillboardGui.LightInfluence = 1.000
            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
            BillboardGui.StudsOffset = Vector3.new(0, 5, 0)

            TextLabel.Parent = BillboardGui
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Size = UDim2.new(0, 200, 0, 50)
            TextLabel.Font = Enum.Font.SourceSansBold
            TextLabel.TextColor3 = is_Colors
            TextLabel.FontSize = "Size18"
            TextLabel.Visible = true
            TextLabel.TextStrokeTransparency = 0.5
        end

        local DistanceTarget = math.floor((Player.Character.HumanoidRootPart.Position - PartTarget.Position).Magnitude)

        PartTarget:WaitForChild("BillboardGui").TextLabel.Text = PartName.." - "..DistanceTarget.."m"
    end

    function OtherModules.BerriesESP()

        local BerryBush = CollectionService:GetTagged("BerryBush")

        if Berries_ESP_Func then
            
            for i = 1, #BerryBush do
                local Bush = BerryBush[i]

                for AttributeName, BerryName in pairs(Bush:GetAttributes()) do

                    if BerryName == "Blue Icicle Berry" then
                        is_Colored = Color3.fromRGB(0, 179, 255)

                    elseif BerryName == "Green Toad Berry" then
                        is_Colored = Color3.fromRGB(4, 255, 0)

                    elseif BerryName == "Orange Berry" then
                        is_Colored = Color3.fromRGB(255, 136, 0)

                    elseif BerryName == "Pink Pig Berry" then
                        is_Colored = Color3.fromRGB(247, 0, 255)

                    elseif BerryName == "Purple Jelly Berry" then
                        is_Colored = Color3.fromRGB(149, 0, 255)

                    elseif BerryName == "Red Cherry Berry" then
                        is_Colored = Color3.fromRGB(255, 0, 4)

                    elseif BerryName == "White Cloud Berry" then
                        is_Colored = Color3.fromRGB(255, 255, 255)

                    elseif BerryName == "Yellow Star Berry" then
                        is_Colored = Color3.fromRGB(255, 204, 0)
                    end

                    if not Bush:FindFirstChild('BillboardGui') then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Name = "BillboardGui"
                        BillboardGui.Parent = Bush
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.SourceSansBold
                        TextLabel.TextColor3 = is_Colored
                        TextLabel.FontSize = "Size18"
                        TextLabel.Visible = true
                        TextLabel.TextStrokeTransparency = 0.5
                    end

                    local DistanceTarget = math.floor((Player.Character.HumanoidRootPart.Position - Bush.Parent:GetPivot().Position).Magnitude)

                    Bush:WaitForChild("BillboardGui").TextLabel.Text = BerryName.." - "..DistanceTarget.."m"

                end
            end
        else
            for i = 1, #BerryBush do
                local Bush = BerryBush[i]

                for AttributeName, BerryName in pairs(Bush:GetChildren()) do

                    if Bush:FindFirstChild('BillboardGui') then
                        Bush:FindFirstChild('BillboardGui'):Destroy()
                    end
                end
            end
        end
    end

    function OtherModules.RefreshBerries()
        local BerryBush = CollectionService:GetTagged("BerryBush")

        if Berries_ESP_Func then
            
            for i = 1, #BerryBush do
                local Bush = BerryBush[i]
                
                for AttributeName, BerryName in pairs(Bush:GetChildren()) do

                    if Bush:FindFirstChild('BillboardGui') then
                        Bush:FindFirstChild('BillboardGui'):Destroy()
                        
                    end
                end
            end
        end
    end

    function OtherModules.CollectBerries()
        if Berries_Farming_Func then
            local BerryBush = CollectionService:GetTagged("BerryBush")
            for i = 1, #BerryBush do
                local Bush = BerryBush[i]

                for AttributeName, BerryName in pairs(Bush:GetAttributes()) do
                    Main_Module.Tween(Bush.Parent:GetPivot())

                    for z,x in pairs(Bush:GetChildren()) do
                        for a,b in pairs(x:GetChildren()) do
                            if string.find(b.Name, "Sphere") then
                                Main_Module.Tween(b.CFrame)
                                game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                                wait(.1)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)

                            else
                                Main_Module.Tween(Bush.Parent:GetPivot())
                            end 
                        end
                    end

                    
                end
            end
        end
    end

    function OtherModules.PlayerESP()
        if Player_ESP_Func then
            
            for i,v in pairs(Players:GetChildren()) do
                if v.Name ~= Player.Name then

                    if v.Team == Player.Team then
                        is_Colored = Color3.fromRGB(255,255,0)
                    else
                        is_Colored = Color3.fromRGB(255,0,0)
                    end

                    OtherModules.CreateESP(v.Character.HumanoidRootPart, v.DisplayName, is_Colored)
                    
                end
            end

        else
            for i,v in pairs(Players:GetChildren()) do
                if v.Name ~= Player.Name then
                    if v.Character.HumanoidRootPart:FindFirstChild("BillboardGui") then
                        v.Character.HumanoidRootPart.BillboardGui:Destroy()
                    end
                end
            end
        end
    end

    function OtherModules.MonsterEsp()
        if Monster_ESP_Func then
            for i,v in Enemies:GetChildren() do
                if v.Name then
                    
                    OtherModules.CreateESP(v.HumanoidRootPart, v.Name, Color3.fromRGB(100,100,255))

                end
            end
        else
            for i,v in Enemies:GetChildren() do
                if v.HumanoidRootPart:FindFirstChild("BillboardGui") then
                    v.HumanoidRootPart:FindFirstChild("BillboardGui"):Destroy()
                end
            end
        end
    end

    function OtherModules.IslandESP()
        if Island_ESP_Func then
            
            for i,v in Locations:GetChildren() do

                OtherModules.CreateESP(v, v.Name, Color3.fromRGB(255,200,0))

            end

        else
            for i,v in Locations:GetChildren() do
                if v:FindFirstChild("BillboardGui") then
                    v:FindFirstChild("BillboardGui"):Destroy()
                end
            end
        end
    end

    function OtherModules.MirageNotification()
        if Mirage_Notification_Func then
            if Locations:FindFirstChild("Mirage Island") then

                local DistanceTarget = math.floor((Player.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Mirage Island").Position).Magnitude)

                Main_Module.SetNotify("Mirage Notification", "Mirage Island has spawned in "..DistanceTarget.."m", 3)
                wait(2)
            end
        end
    end

    function OtherModules.KitsuneNotification()
        if Kitsune_Notification_Func then
            if Locations:FindFirstChild("Kitsune Island") then

                local DistanceTarget = math.floor((Player.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Kitsune Island").Position).Magnitude)

                Main_Module.SetNotify("Kitsune Notification", "Kitsune Island has spawned in "..DistanceTarget.."m", 3)
                wait(2)
            end
        end
    end

    function OtherModules.PrehistoricNotification()
        if Prehistoric_Notification_Func then
            if Locations:FindFirstChild("Prehistoric Island") then

                local DistanceTarget = math.floor((Player.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Prehistoric Island").Position).Magnitude)

                Main_Module.SetNotify("Prehistoric Notification", "Prehistoric Island has spawned in "..DistanceTarget.."m", 3)
                wait(2)
            end
        end
    end

    function OtherModules.MirageESP()
        if Mirage_Esp_Func then
            for i,v in Locations:GetChildren() do
                if v.Name == "Mirage Island" then

                    OtherModules.CreateESP(v, v.Name, Color3.fromRGB(255,200,0))
                end
            end
        else
            for i,v in Locations:GetChildren() do
                if v.Name == "Mirage Island" then

                    if v:FindFirstChild("BillboardGui") then
                        v:FindFirstChild("BillboardGui"):Destroy()
                    end
                end
            end
        end
    end

    function OtherModules.KitsuneESP()
        if Kitsune_Esp_Func then
            for i,v in Locations:GetChildren() do
                if v.Name == "Kitsune Island" then

                    OtherModules.CreateESP(v, v.Name, Color3.fromRGB(255,200,0))
                end
            end
        else
            for i,v in Locations:GetChildren() do
                if v.Name == "Kitsune Island" then

                    if v:FindFirstChild("BillboardGui") then
                        v:FindFirstChild("BillboardGui"):Destroy()
                    end
                end
            end
        end
    end

    function OtherModules.PrehistoricESP()
        if Prehistoric_Esp_Func then
            for i,v in Locations:GetChildren() do
                if v.Name == "Prehistoric Island" then

                    OtherModules.CreateESP(v, v.Name, Color3.fromRGB(255,200,0))
                end
            end
        else
            for i,v in Locations:GetChildren() do
                if v.Name == "Prehistoric Island" then

                    if v:FindFirstChild("BillboardGui") then
                        v:FindFirstChild("BillboardGui"):Destroy()
                    end
                end
            end
        end
    end

    function OtherModules.NpcESP()
        if NPC_ESP_Func then
            
            for i,v in workspace.NPCs:GetChildren() do

                if v.Name then
                    OtherModules.CreateESP(v.HumanoidRootPart, v.Name, Color3.fromRGB(0,255,255))

                end
            end

        else
            for i,v in workspace.NPCs:GetChildren() do
                if v.HumanoidRootPart:FindFirstChild("BillboardGui") then
                    v.HumanoidRootPart:FindFirstChild("BillboardGui"):Destroy()
                end
            end
        end
    end

    function OtherModules.FruitEsp()
        if Fruit_ESP_Func then
            
            for i,v in workspace:GetChildren() do

                if (v:IsA("Tool") or v:IsA('Model')) and string.find(v.Name, 'Fruit') then
                    if v:FindFirstChild("Handle") then

                        OtherModules.CreateESP(v.Handle, v.Name, Color3.fromRGB(80,255,80))
                    end
                end

                if v.Name == "PineappleSpawner" or v.Name == "BananaSpawner" or v.Name == "AppleSpawner" then
                    for index_Fruit, value_Fruit in v:GetChildren() do
                        if value_Fruit:IsA('Tool') then
                            if value_Fruit:FindFirstChild("Handle") then

                                OtherModules.CreateESP(value_Fruit.Handle, v.Name, Color3.fromRGB(80,255,80))
                            end
                        end
                    end
                end
            end

        else
            for i,v in workspace:GetChildren() do
                if (v:IsA("Tool") or v:IsA('Model')) and string.find(v.Name, 'Fruit') then
                    if v:FindFirstChild("Handle") then
                        if v.Handle:FindFirstChild("BillboardGui") then
                            v.Handle:FindFirstChild("BillboardGui"):Destroy()
                        end
                    end
                end

                if v.Name == "PineappleSpawner" or v.Name == "BananaSpawner" or v.Name == "AppleSpawner" then
                    for index_Fruit, value_Fruit in v:GetChildren() do
                        if value_Fruit:IsA('Tool') then
                            if value_Fruit:FindFirstChild("Handle") then
                                if value_Fruit.Handle:FindFirstChild("BillboardGui") then
                                    value_Fruit.Handle:FindFirstChild("BillboardGui"):Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    function OtherModules.ChestESP()
        if Chest_ESP_Func then
            
            for i,v in ChestModels:GetChildren() do

                if v.Name then
                    OtherModules.CreateESP(v.PushBox, v.Name, Color3.fromRGB(255,255,255))
                end
            end

        else
            for i,v in ChestModels:GetChildren() do
                if v.PushBox:FindFirstChild("BillboardGui") then
                    v.PushBox:FindFirstChild("BillboardGui"):Destroy()
                end
            end
        end
    end

    function OtherModules.FlowerESP()
        if Flower_ESP_Func then
            
            for i,v in workspace:GetChildren() do

                if v.Name == "Flower2" or v.Name == "Flower1" then
                    OtherModules.CreateESP(v, v.Name, Color3.fromRGB(255,255,255))

                end
            end

        else
            for i,v in workspace:GetChildren() do
                if v.Name == "Flower2" or v.Name == "Flower1" then
                    if v:FindFirstChild("BillboardGui") then
                        v:FindFirstChild("BillboardGui"):Destroy()
                    end
                end
            end
        end
    end

    function OtherModules.NoDodgeCooldown()
        for i,v in getgc() do
            if typeof(v) == "function" then
                if getfenv(v).script == Player.Character:WaitForChild("Dodge") then
                    for script_Index, script_Value in getupvalues(v) do
                        if tostring(script_Value) == "0.4" then
                            setupvalue(v,script_Index,0)
                        end
                    end
                end
            end
        end
    end

    function OtherModules.InfiniteEnergy()
        Player.Character.Energy.Changed:connect(function()
            Player.Character.Energy.Value = Player.Character.Energy.MaxValue
        end)
    end

    function OtherModules.NoGeppoCooldown()
        for i,v in getgc() do
            if typeof(v) == "function" then
                if getfenv(v).script == Player.Character:WaitForChild("Geppo") then
                    for script_Index, script_Value in getupvalues(v) do
                        if tostring(script_Value) == "0" then
                            setupvalue(v,script_Index,0)
                        end
                    end
                end
            end
        end
    end

    function OtherModules.NoSoruCooldown()
        for i,v in getgc() do
            if typeof(v) == "function" then
                if getfenv(v).script == Player.Character:WaitForChild("Soru") then
                    for script_Index, script_Value in getupvalues(v) do
                        if type(script_Value) == 'table' then
                            if script_Value.LastUse then
                                setupvalue(v, script_Index, {LastAfter = 0,LastUse = 0})
                            end
                        end
                    end
                end
            end
        end
    end

    function OtherModules.WalkOnWater()
        if Walk_ON_Water_Func then
            Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
        else
            Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
        end
    end

    function OtherModules.RemoveFog()
        if Remove_Fog_Func then
            game.Lighting.FogEnd = 9e9
        else
            game.Lighting.FogEnd = 2500
        end
    end

    function OtherModules.WhiteScreen()
        if White_Screen_Func then
            RunService:Set3dRenderingEnabled(false)
        else
            RunService:Set3dRenderingEnabled(true)
        end
    end

    function OtherModules.BlackScreen()
        if Black_Screen_Func then
            game:GetService("Lighting").GlobalColorCorrection.TintColor = Color3.fromRGB(0,0,0)
            
        else
            game:GetService("Lighting").GlobalColorCorrection.TintColor = Color3.fromRGB(255,255,255)
            
        end
    end

    function OtherModules.RemoveLava()
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "Lava" then   
                v:Destroy()
            end
        end
        for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
            if v.Name == "Lava" then   
                v:Destroy()
            end
        end
    end

    function OtherModules.AlwaysDay()
        if Always_Day_Func then
            game:GetService("Lighting").ClockTime = 12
        end
    end

    function OtherModules.BringFruits()
        for i,v in workspace:GetChildren() do
            if (v:IsA('Model') or v:IsA('Tool')) and string.find(v.Name, 'Fruit') then
                if v:FindFirstChild("Handle") then
                    v.Handle.CFrame = Player.Character.HumanoidRootPart.CFrame
                    v.RootPart.CFrame = Player.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end

    function OtherModules.TweenFruits()
        for i,v in workspace:GetChildren() do
            if (v:IsA('Model') or v:IsA('Tool')) and string.find(v.Name, 'Fruit') then
                if v:FindFirstChild("Handle") then
                    Main_Module.Tween(v.Handle.CFrame)
                end
            end
        end
    end

    function OtherModules.AutoStoredFruit()
        for i,v in OtherModules.CheckFruits do
            if Player.Character:FindFirstChild(v.Name) or Player.Backpack:FindFirstChild(v.Name) then
                local StoredTable = {
                    [1] = "StoreFruit",
                    [2] = i,
                    [3] = Player.Character:FindFirstChild(v.Name) or Player.Backpack:FindFirstChild(v.Name)
                }

                Main_Module.InvokeRemote(unpack(StoredTable))
            end
        end
    end

    function OtherModules.EarnedBounty()
        
        local Earned = tostring(Player.leaderstats["Bounty/Honor"].Value - OldBounty)
        local is_Earned = 0

        if string.len(Earned) <= 3 then
            is_Earned = Earned

        elseif string.len(Earned) == 4 then
            is_Earned = string.sub(Earned,1,1).."."..string.sub(Earned,2,3).."K"

        elseif string.len(Earned) == 5 then
            is_Earned = string.sub(Earned,1,2).."."..string.sub(Earned,3,4).."K"

        elseif string.len(Earned) == 6 then
            is_Earned = string.sub(Earned,1,3).."."..string.sub(Earned,4,5).."K"

        elseif string.len(Earned) == 7 then
            is_Earned = string.sub(Earned,1,1).."."..string.sub(Earned,2,3).."M"

        elseif string.len(Earned) == 8 then
            is_Earned = string.sub(Earned,1,2).."."..string.sub(Earned,3,4).."M"

        elseif string.len(Earned) == 9 then
            is_Earned = string.sub(Earned,1,3).."."..string.sub(Earned,4,5).."M"

        elseif string.len(Earned) == 10 then
            is_Earned = string.sub(Earned,1,1).."."..string.sub(Earned,2,3).."B"

        elseif string.len(Earned) == 11 then
            is_Earned = string.sub(Earned,1,2).."."..string.sub(Earned,3,4).."B"

        elseif string.len(Earned) == 12 then
            is_Earned = string.sub(Earned,1,3).."."..string.sub(Earned,4,5).."B"
        end

        return is_Earned
    end

    function OtherModules.CurrentBounty()
        local Bounty = tostring(Player.leaderstats["Bounty/Honor"].Value)
        local is_Bounty = nil

        if string.len(Bounty) <= 3 then
            is_Bounty = Bounty

        elseif string.len(Bounty) == 4 then
            is_Bounty = string.sub(Bounty,1,1).."."..string.sub(Bounty,2,3).."K"

        elseif string.len(Bounty) == 5 then
            is_Bounty = string.sub(Bounty,1,2).."."..string.sub(Bounty,3,4).."K"

        elseif string.len(Bounty) == 6 then
            is_Bounty = string.sub(Bounty,1,3).."."..string.sub(Bounty,4,5).."K"

        elseif string.len(Bounty) == 7 then
            is_Bounty = string.sub(Bounty,1,1).."."..string.sub(Bounty,2,3).."M"

        elseif string.len(Bounty) == 8 then
            is_Bounty = string.sub(Bounty,1,2).."."..string.sub(Bounty,3,4).."M"

        elseif string.len(Bounty) == 9 then
            is_Bounty = string.sub(Bounty,1,3).."."..string.sub(Bounty,4,5).."M"

        elseif string.len(Bounty) == 10 then
            is_Bounty = string.sub(Bounty,1,1).."."..string.sub(Bounty,2,3).."B"

        elseif string.len(Bounty) == 11 then
            is_Bounty = string.sub(Bounty,1,2).."."..string.sub(Bounty,3,4).."B"

        elseif string.len(Bounty) == 12 then
            is_Bounty = string.sub(Bounty,1,3).."."..string.sub(Bounty,4,5).."B"
        end

        return is_Bounty
    end

    function OtherModules.EnablePvp()
        if Enable_Pvp_Func then
            if Player.PlayerGui.Main.BottomHUDList.PvpDisabled.Visible == true then
                Main_Module.InvokeRemote("EnablePvp")
            end
        end
    end

    function OtherModules.GetListPlayers()
        local PlayerTable = {}
        
        for i,v in Players:GetChildren() do
            if v.DisplayName ~= Player.DisplayName then
                table.insert(PlayerTable, v.DisplayName)
            end
        end

        return PlayerTable
    end

    function OtherModules.SpectatePlayer()
        P1 = Player.Character.Humanoid

        if Spectate_Player_Func then
            for i,v in Players:GetChildren() do
                if v.DisplayName == Selected_Player_Func then
                    if v.Character:FindFirstChild('Humanoid') and v.Character.Humanoid.Health > 0 then

                        repeat task.wait()
                            workspace.Camera.CameraSubject = v.Character.Humanoid
                        until not Spectate_Player_Func or not Players:FindFirstChild(v.DisplayName)
                    end
                end
            end
        else
            workspace.Camera.CameraSubject = P1
        end
    end

    function OtherModules.TweenToPlayers()
        if Tween_Players_Func then
            for i,v in Players:GetChildren() do
                if v.DisplayName == Selected_Player_Func then
                    if v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
                        repeat task.wait()
                            Main_Module.SetWeapon(Selected_Weapon)
                            Main_Module.Tween(v.Character.HumanoidRootPart.CFrame * Farm_Mode)
                        until not Tween_Players_Func or not v.Parent or v.Character.Humanoid.Health <= 0 or not Players:FindFirstChild(v.DisplayName)
                    end
                end
            end
        end
    end

    function OtherModules.AimbotSKillToPlayer()
        if Aimbot_Skill_Func then
            for i,v in Players:GetChildren() do
                if v.DisplayName == Selected_Player_Func then
                    if v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
                        repeat task.wait()
                            local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                            __UseSkill = true
                            Target_Locked = v.Character.HumanoidRootPart
                            Equipped.MousePos.Value = Target_Locked.Position
                            Main_Module.AimbotSkillToPlayers()
                        until not Aimbot_Skill_Func or not v.Parent or v.Character.Humanoid.Health <= 0 or not Players:FindFirstChild(v.DisplayName)
                    end
                end
            end
        end
    end

    function OtherModules.AttackFishFarm(SeaPatch)
        if Fish_Farming_Func and Auto_Sails_Func then

            if Enemies:FindFirstChild("Shark") or Enemies:FindFirstChild("Piranha") or Enemies:FindFirstChild("Fish Crew Member") then
                
                Main_Module.BoatsStopTween(Auto_Sails_Func)

                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == 'Shark' or v.Name == 'Piranha' or v.Name == 'Fish Crew Member' then
                        if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Sea_Event_Weapon_Selected_Func)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Sea_Event_Distance_Func)
                                Main_Module:BringEnemies(v, true)

                                if AimbotSkill_SeaEvent_Func then
                                    local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                    __UseSkill = true
                                    Target_Locked = v.HumanoidRootPart
                                    Equipped.MousePos.Value = Target_Locked.Position
                                    Main_Module.SeaEventSkillEnabled()
                                else
                                    __UseSkill = false
                                end
                            until not Fish_Farming_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                if Boats:FindFirstChild(Boats_Selected_Func).Owner.Value.Name == tostring(Player.Name) then

                    Main_Module.Tween(Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.CFrame * CFrame.new(0,1,0))

                    if (Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 1 then

                        Main_Module.BoatsTween(Main_Module.SeaEvent:FindFirstChild(SeaPatch) * CFrame.new(0,10,0))
                    end
                else
                    Main_Module.Tween(Player.Character.HumanoidRootPart.CFrame)
                end
            end
        end
    end

    function OtherModules.AttackTerrorsharFarm(SeaPatch)
        if Terrorshark_Farming_Func and Auto_Sails_Func then

            if Enemies:FindFirstChild("Terrorshark") then
                
                Main_Module.BoatsStopTween(Auto_Sails_Func)

                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == 'Terrorshark' then
                        if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
        
                                Main_Module.SetWeapon(Sea_Event_Weapon_Selected_Func)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Sea_Event_Distance_Func)

                                if AimbotSkill_SeaEvent_Func then
                                    local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                    __UseSkill = true
                                    Target_Locked = v.HumanoidRootPart
                                    Equipped.MousePos.Value = Target_Locked.Position
                                    Main_Module.SeaEventSkillEnabled()
                                else
                                    __UseSkill = false
                                end

                            until not Terrorshark_Farming_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                if Boats:FindFirstChild(Boats_Selected_Func).Owner.Value.Name == tostring(Player.Name) then

                    Main_Module.Tween(Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.CFrame * CFrame.new(0,1,0))

                    if (Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 1 then

                        Main_Module.BoatsTween(Main_Module.SeaEvent:FindFirstChild(SeaPatch) * CFrame.new(0,10,0))
                    end
                else
                    Main_Module.Tween(Player.Character.HumanoidRootPart.CFrame)
                end
            end
        end
    end

    function OtherModules.AttackGhostShipFarm(SeaPatch)
        if GhostShip_Farming_Func and Auto_Sails_Func then

            if Enemies:FindFirstChild("PirateBrigade") or Enemies:FindFirstChild("PirateGrandBrigade") then
                
                Main_Module.BoatsStopTween(Auto_Sails_Func)

                for i,v in pairs(Enemies:GetChildren()) do
                    if v.Name == 'PirateBrigade' then
                        if v:FindFirstChild('Humanoid') and v:FindFirstChild('Engine') and v.Humanoid.Value > 0 then
                            repeat task.wait()
                                v.Engine.CanCollide = false
                                v.Engine.Size = Vector3.new(60,60,60)
                                v.Engine.Transparency = 1
        
                                Main_Module.SetWeapon(Sea_Event_Weapon_Selected_Func)
                                Main_Module.Tween(v.Engine.CFrame * CFrame.new(0,30,20))

                                if AimbotSkill_SeaEvent_Func then
                                    local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                    __UseSkill = true
                                    Target_Locked = v.Sails
                                    Equipped.MousePos.Value = Target_Locked.Position
                                    Main_Module.SeaEventSkillEnabled()
                                else
                                    __UseSkill = false
                                end

                            until not GhostShip_Farming_Func or not v.Parent or v.Humanoid.Value <= 0 or not Enemies:FindFirstChild(v.Name)
                        end

                    elseif v.Name == 'PirateGrandBrigade' then
                        if v:FindFirstChild('Humanoid') and v:FindFirstChild('Engine') and v.Humanoid.Value > 0 then
                            repeat task.wait()
                                v.Engine.CanCollide = false
                                v.Engine.Size = Vector3.new(60,60,60)
                                v.Engine.Transparency = 1
        
                                Main_Module.SetWeapon(Sea_Event_Weapon_Selected_Func)
                                Main_Module.Tween(v.Engine.CFrame * CFrame.new(0,80,20))

                                if AimbotSkill_SeaEvent_Func then
                                    local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                    __UseSkill = true
                                    Target_Locked = v.Sails
                                    Equipped.MousePos.Value = Target_Locked.Position
                                    Main_Module.SeaEventSkillEnabled()
                                else
                                    __UseSkill = false
                                end
                            until not GhostShip_Farming_Func or not v.Parent or v.Humanoid.Value <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                if Boats:FindFirstChild(Boats_Selected_Func).Owner.Value.Name == tostring(Player.Name) then

                    Main_Module.Tween(Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.CFrame * CFrame.new(0,1,0))

                    if (Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 1 then

                        Main_Module.BoatsTween(Main_Module.SeaEvent:FindFirstChild(SeaPatch) * CFrame.new(0,10,0))
                    end
                else
                    Main_Module.Tween(Player.Character.HumanoidRootPart.CFrame)
                end
            end
        end
    end

    function OtherModules.AttackSeaBeastFarm(SeaPatch)
        if Sea_Beast_Farming_Func and Auto_Sails_Func then

            if SeaBeasts:FindFirstChild("SeaBeast1") then
                
                Main_Module.BoatsStopTween(Auto_Sails_Func)

                for i,v in pairs(SeaBeasts:GetChildren()) do
                    if v.Name == 'SeaBeast1' then
                        if v:FindFirstChild('Health') and v:FindFirstChild("HumanoidRootPart") and v.Health.Value > 0 then
                            repeat task.wait()
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
        
                                Main_Module.SetWeapon(Sea_Event_Weapon_Selected_Func)
                                Main_Module.Tween(v.HumanoidRootPart.CFrame * Sea_Event_Distance_Func)

                                if AimbotSkill_SeaEvent_Func then
                                    local Equipped = Player.Character:FindFirstChildOfClass("Tool")
                                    __UseSkill = true
                                    Target_Locked = v.HumanoidRootPart
                                    Equipped.MousePos.Value = Target_Locked.Position
                                    Main_Module.SeaEventSkillEnabled()
                                else
                                    __UseSkill = false
                                end
                            until not Sea_Beast_Farming_Func or not v.Parent or v.Health.Value <= 0 or not SeaBeasts:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                if Boats:FindFirstChild(Boats_Selected_Func).Owner.Value.Name == tostring(Player.Name) then

                    Main_Module.Tween(Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.CFrame * CFrame.new(0,1,0))

                    if (Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 1 then

                        Main_Module.BoatsTween(Main_Module.SeaEvent:FindFirstChild(SeaPatch) * CFrame.new(0,10,0))
                    end
                else
                    Main_Module.Tween(Player.Character.HumanoidRootPart.CFrame)
                end
            end
        end
    end

end

--// Auto Sails
spawn(function()
    while task.wait() do
        if Auto_Sails_Func then
            if Boats:FindFirstChild(Boats_Selected_Func) then

                if Boats:FindFirstChild(Boats_Selected_Func).Owner.Value.Name == tostring(Player.Name) then

                    Main_Module.Tween(Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.CFrame * CFrame.new(0,1,0))

                    if (Boats:FindFirstChild(Boats_Selected_Func).VehicleSeat.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 1 then
                        if Sea_Danger_Selected_Func == "Sea Danger 1" then
                            OtherModules.AttackFishFarm("Sea Danger 1")
                            OtherModules.AttackTerrorsharFarm("Sea Danger 1")
                            OtherModules.AttackGhostShipFarm("Sea Danger 1")
                            OtherModules.AttackSeaBeastFarm("Sea Danger 1")

                        elseif Sea_Danger_Selected_Func == "Sea Danger 2" then
                            OtherModules.AttackFishFarm("Sea Danger 2")
                            OtherModules.AttackTerrorsharFarm("Sea Danger 2")
                            OtherModules.AttackGhostShipFarm("Sea Danger 2")
                            OtherModules.AttackSeaBeastFarm("Sea Danger 2")

                        elseif Sea_Danger_Selected_Func == "Sea Danger 3" then
                            OtherModules.AttackFishFarm("Sea Danger 3")
                            OtherModules.AttackTerrorsharFarm("Sea Danger 3")
                            OtherModules.AttackGhostShipFarm("Sea Danger 3")
                            OtherModules.AttackSeaBeastFarm("Sea Danger 3")

                        elseif Sea_Danger_Selected_Func == "Sea Danger 4" then
                            OtherModules.AttackFishFarm("Sea Danger 4")
                            OtherModules.AttackTerrorsharFarm("Sea Danger 4")
                            OtherModules.AttackGhostShipFarm("Sea Danger 4")
                            OtherModules.AttackSeaBeastFarm("Sea Danger 4")

                        elseif Sea_Danger_Selected_Func == "Sea Danger 5" then
                            OtherModules.AttackFishFarm("Sea Danger 5")
                            OtherModules.AttackTerrorsharFarm("Sea Danger 5")
                            OtherModules.AttackGhostShipFarm("Sea Danger 5")
                            OtherModules.AttackSeaBeastFarm("Sea Danger 5")

                        elseif Sea_Danger_Selected_Func == "Sea Danger 6" then
                            OtherModules.AttackFishFarm("Sea Danger 6")
                            OtherModules.AttackTerrorsharFarm("Sea Danger 6")
                            OtherModules.AttackGhostShipFarm("Sea Danger 6")
                            OtherModules.AttackSeaBeastFarm("Sea Danger 6")

                        end
                    end

                elseif Boats:FindFirstChild(Boats_Selected_Func).Owner.Value.Name ~= tostring(Player.Name) then

                    Main_Module.Tween(Main_Module.BoatsTween(Main_Module.SeaEvent["Tiki Boat Dealer"]))

                    if (Main_Module.SeaEvent["Tiki Boat Dealer"].Position - Player.Character.HumanoidRootPart.Position).magnitude <= 10 then

                        Main_Module.InvokeRemote("BuyBoat", Boats_Selected_Func)
                        wait(1)
                    end

                end

            elseif not Boats:FindFirstChild(Boats_Selected_Func) then

                Main_Module.Tween(Main_Module.BoatsTween(Main_Module.SeaEvent["Tiki Boat Dealer"]))

                if (Main_Module.SeaEvent["Tiki Boat Dealer"].Position - Player.Character.HumanoidRootPart.Position).magnitude <= 10 then
                    
                    Main_Module.InvokeRemote("BuyBoat", Boats_Selected_Func)
                    wait(1)
                end

            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Mirage_Teleport_Func then
            if Map:FindFirstChild("MysticIsland") then
                Main_Module.Tween(Locations:FindFirstChild("Mirage Island").CFrame)
                if (Locations:FindFirstChild("Mirage Island").Position - Player.Character.HumanoidRootPart.Position).Magnitude < 5 then
                    Main_Module.Tween(Locations:FindFirstChild("Mirage Island").CFrame * CFrame.new(0,100,0))
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Mirage_Gear_Teleport_Func then
            if Map:FindFirstChild("MysticIsland") then
                for i,v in pairs(Map:FindFirstChild("MysticIsland"):GetChildren()) do 
                    if v:IsA("MeshPart")then 
                        if v.Material ==  Enum.Material.Neon then  
                            Main_Module.Tween(v.CFrame)
                        end
                    end
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Fruit_Dealer_Teleport_Func then
            if workspace.NPCs:FindFirstChild("Advanced Fruit Dealer") then
                Main_Module.Tween(workspace.NPCs:FindFirstChild("Advanced Fruit Dealer").HumanoidRootPart.CFrame)
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Collect_Azure_Kitsune_Func then
            for i,v in pairs(workspace:GetChildren()) do
                if v.Name == 'EmberTemplate' then
                    Main_Module.Tween(v.Part.CFrame)
                    ReplicatedStorage.Modules.Net["RE/CollectBlueEmber"]:FireServer()
                end
                if v.Name == 'AttachedAzureEmber' then
                    Main_Module.Tween(v.Part.CFrame)
                    ReplicatedStorage.Modules.Net["RE/CollectBlueEmber"]:FireServer()
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Teleport_Kitsune_Func then
            if Map:FindFirstChild("KitsuneIsland") then
                if Map.KitsuneIsland:FindFirstChild("ShrineActive") then
                    for _, v in pairs(Map.KitsuneIsland:FindFirstChild("ShrineActive"):GetDescendants()) do
                        if v:IsA("BasePart") and v:FindFirstChild("NeonShrinePart") then
                            Main_Module.Tween(v.CFrame)
                        end
                    end

                else
                    Main_Module.Tween(Locations:FindFirstChild("Kitsune Island").CFrame)
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Teleport_Prehistoric_Func then
            if Map:FindFirstChild("PrehistoricIsland") then
                if Map.PrehistoricIsland.Core.PrehistoricRelic:FindFirstChild('Skull') then
                    Main_Module.Tween(Map.PrehistoricIsland.Core.PrehistoricRelic:FindFirstChild('Skull').CFrame)
                else
                    Main_Module.Tween(Locations:FindFirstChild("Prehistoric Island").CFrame * CFrame.new(0,50,0))
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Kill_Golem_Func then
            for i,v in Enemies:GetChildren() do
                if v.Name == 'Lava Golem' or v.Name == "Lava Golem [Lv. 2500]" then
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
                        until not Kill_Golem_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                    end
                end
            end
        end
    end
end)

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if Kill_Golem_Instantly_Func then
            for i,v in Enemies:GetDescendants() do
                if v.Name == 'Lava Golem' or v.Name == "Lava Golem [Lv. 2500]" then
                    if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid').Health > 0 then
                        repeat task.wait()
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid.Health = 0
                            Main_Module.SetWeapon(Selected_Weapon)
                            sethiddenproperty(Player,"SimulationRadius",math.huge)
                        until not Kill_Golem_Instantly_Func or not v.Parent or not Enemies:FindFirstChild(v.Name)
                    end
                end
            end
        end
    end)
end)

spawn(function()
    while task.wait() do
        if Collect_Dragon_Egg_Func then
            if Map:FindFirstChild("PrehistoricIsland") then
                for i,v in pairs(Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetDescendants()) do
                    if v:IsA('Part') or v:IsA('MeshPart') then
                        Main_Module.Tween(v.CFrame)
                        ReplicatedStorage.Modules.Net["RE/CollectedDragonEgg"]:FireServer()
                    end
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Teleport_Race_Door_Func then
            Main_Module.InvokeRemote("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
            wait(.5)
            if Player.Data.Race.Value == "Human" then
                Main_Module.Tween(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
            elseif Player.Data.Race.Value == "Skypiea" then
                Main_Module.Tween(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
            elseif Player.Data.Race.Value == "Fishman" then
                Main_Module.Tween(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
            elseif Player.Data.Race.Value == "Cyborg" then
                Main_Module.Tween(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
            elseif Player.Data.Race.Value == "Ghoul" then
                Main_Module.Tween(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
            elseif Player.Data.Race.Value == "Mink" then
                Main_Module.Tween(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094))
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Auto_Trial_Race_Func then
            if Player.Data.Race.Value == "Human" then
                for i,v in pairs(Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if v.Name then
                            repeat task.wait()
                                v.Humanoid.Health = 0
                                v.HumanoidRootPart.CanCollide = false
                                Main_Module.SetWeapon(Selected_Weapon)
                                sethiddenproperty(Player,"SimulationRadius",math.huge)
                            until not Auto_Trial_Race_Func or not v.Parent or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            elseif Player.Data.Race.Value == "Skypiea" then
                for i,v in pairs(Map.SkyTrial.Model:GetDescendants()) do
                    if v.Name ==  "snowisland_Cylinder.081" then
                        Main_Module.Tween(v.CFrame * CFrame.new(0,0,0))
                    end
                end
            elseif Player.Data.Race.Value == "Fishman" then
                for i,v in pairs(SeaBeasts.SeaBeast1:GetDescendants()) do
                    if v.Name ==  "HumanoidRootPart" then
                        Main_Module.Tween(v.CFrame * CFrame.new(20,450,0))
                        for k,l in pairs(Player.Backpack:GetChildren()) do
                            if l:IsA("Tool") then
                                if l.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    Player.Character.Humanoid:EquipTool(l)
                                end
                            end
                        end
                        VirtualInputManager:SendKeyEvent(true,122,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,122,false,Player.Character.HumanoidRootPart)
                        wait(.2)
                        VirtualInputManager:SendKeyEvent(true,120,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,120,false,Player.Character.HumanoidRootPart)
                        wait(.2)
                        VirtualInputManager:SendKeyEvent(true,99,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,99,false,Player.Character.HumanoidRootPart)
                        for k,l in pairs(Player.Backpack:GetChildren()) do
                            if l:IsA("Tool") then
                                if l.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    Player.Character.Humanoid:EquipTool(l)
                                end
                            end
                        end
                        VirtualInputManager:SendKeyEvent(true,122,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,122,false,Player.Character.HumanoidRootPart)
                        wait(.2)
                        VirtualInputManager:SendKeyEvent(true,120,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,120,false,Player.Character.HumanoidRootPart)
                        wait(.2)
                        VirtualInputManager:SendKeyEvent(true,99,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,99,false,Player.Character.HumanoidRootPart)
                
                        wait(0.5)
                        for k,l in pairs(Player.Backpack:GetChildren()) do
                            if l:IsA("Tool") then
                                if l.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    Player.Character.Humanoid:EquipTool(l)
                                end
                            end
                        end
                        VirtualInputManager:SendKeyEvent(true,122,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,122,false,Player.Character.HumanoidRootPart)
                        wait(.2)
                        VirtualInputManager:SendKeyEvent(true,120,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,120,false,Player.Character.HumanoidRootPart)
                        wait(.2)
                        VirtualInputManager:SendKeyEvent(true,99,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,99,false,Player.Character.HumanoidRootPart)
                        wait(0.5)
                        for k,l in pairs(Player.Backpack:GetChildren()) do
                            if l:IsA("Tool") then
                                if l.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    Player.Character.Humanoid:EquipTool(l)
                                end
                            end
                        end
                        VirtualInputManager:SendKeyEvent(true,122,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,122,false,Player.Character.HumanoidRootPart)
                        wait(.2)
                        VirtualInputManager:SendKeyEvent(true,120,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,120,false,Player.Character.HumanoidRootPart)
                        wait(.2)
                        VirtualInputManager:SendKeyEvent(true,99,false,Player.Character.HumanoidRootPart)
                        VirtualInputManager:SendKeyEvent(false,99,false,Player.Character.HumanoidRootPart)
                    end
                end
            elseif Player.Data.Race.Value == "Cyborg" then
                Main_Module.Tween(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif Player.Data.Race.Value == "Ghoul" then
                pcall(function()
                    for i,v in pairs(Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name then
                                repeat task.wait()
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(Player,"SimulationRadius",math.huge)
                                until not Auto_Trial_Race_Func or not v.Parent or not Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                end)
            elseif Player.Data.Race.Value == "Mink" then
                for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v.Name == "StartPoint" then
                        Main_Module.Tween(v.CFrame* CFrame.new(0,10,0))
                    end
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Auto_Train_Race_Func then
            VirtualInputManager:SendKeyEvent(true,"Y",false,game)
            wait(0.1)
            VirtualInputManager:SendKeyEvent(false,"Y",false,game)

            if Enemies:FindFirstChild("Cocoa Warrior") or Enemies:FindFirstChild("Chocolate Bar Battler") or Enemies:FindFirstChild("Sweet Thief") or Enemies:FindFirstChild("Candy Rebel") then
                for i,v in Enemies:GetChildren() do
                    if v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" or v.Name == "Sweet Thief" or v.Name == "Candy Rebel" then
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
                            until not Auto_Train_Race_Func or not v.Parent or v.Humanoid.Health <= 0 or not Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            else
                Main_Module.Tween(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
            end
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            OtherModules.PrehistoricESP()
            OtherModules.KitsuneESP()
            OtherModules.MirageESP()
            OtherModules.PrehistoricNotification()
            OtherModules.KitsuneNotification()
            OtherModules.MirageNotification()
        end)
    end
end)


return OtherModules