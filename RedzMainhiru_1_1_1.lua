repeat
    wait()
until game:IsLoaded()
if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
end
local function setTeam(teamName)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", teamName)
end
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
if getgenv().Settings.JoinTeam then
    local minimal = playerGui:FindFirstChild("Main (minimal)")
    if minimal then
        task.wait(5)
        setTeam(getgenv().Settings.Team)
    end
end
repeat
    wait()
until game.Players.LocalPlayer.Character
loadstring(game:HttpGet("https://raw.githubusercontent.com/viplam087-png/Hjj/main/AttackAndBring.lua"))()
function CheckQuest() 
    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if World1 then
        if MyLevel >= 1 and MyLevel <= 9 then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
            CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif MyLevel >= 10 and MyLevel <= 14 then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif MyLevel >= 15 and MyLevel <= 29 then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif MyLevel >= 30 and MyLevel <= 39 then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif MyLevel >= 40 and MyLevel <= 59 then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif MyLevel >= 60 and MyLevel <= 74 then
            Mon = "Desert Bandit"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif MyLevel >= 75 and MyLevel <= 89 then
            Mon = "Desert Officer"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif MyLevel >= 90 and MyLevel <= 99 then
            Mon = "Snow Bandit"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif MyLevel >= 100 and MyLevel <= 119 then
            Mon = "Snowman"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif MyLevel >= 120 and MyLevel <= 149 then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif MyLevel >= 150 and MyLevel <= 174 then
            Mon = "Sky Bandit"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif MyLevel >= 175 and MyLevel <= 189 then
            Mon = "Dark Master"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif MyLevel >= 190 and MyLevel <= 209 then
            Mon = "Prisoner"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif MyLevel >= 210 and MyLevel <= 249 then
            Mon = "Dangerous Prisoner"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif MyLevel >= 250 and MyLevel <= 274 then
            Mon = "Toga Warrior"
            LevelQuest = 1
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif MyLevel >= 275 and MyLevel <= 299 then
            Mon = "Gladiator"
            LevelQuest = 2
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif MyLevel >= 300 and MyLevel <= 324 then
            Mon = "Military Soldier"
            LevelQuest = 1
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif MyLevel >= 325 and MyLevel <= 374 then
            Mon = "Military Spy"
            LevelQuest = 2
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif MyLevel >= 375 and MyLevel <= 399 then
            Mon = "Fishman Warrior"
            LevelQuest = 1
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel >= 400 and MyLevel <= 449 then
            Mon = "Fishman Commando"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel >= 450 and MyLevel <= 474 then
            Mon = "God's Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
            CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif MyLevel >= 475 and MyLevel <= 524 then
            Mon = "Shanda"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
            CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif MyLevel >= 525 and MyLevel <= 549 then
            Mon = "Royal Squad"
            LevelQuest = 1
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif MyLevel >= 550 and MyLevel <= 624 then
            Mon = "Royal Soldier"
            LevelQuest = 2
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif MyLevel >= 625 and MyLevel <= 649 then
            Mon = "Galley Pirate"
            LevelQuest = 1
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif MyLevel >= 650 then
            Mon = "Galley Captain"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif World2 then
        if MyLevel >= 700 and MyLevel <= 724 then
            Mon = "Raider"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif MyLevel >= 725 and MyLevel <= 774 then
            Mon = "Mercenary"
            LevelQuest = 2
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif MyLevel >= 775 and MyLevel <= 799 then
            Mon = "Swan Pirate"
            LevelQuest = 1
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
            CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif MyLevel >= 800 and MyLevel <= 874 then
            Mon = "Factory Staff"
            NameQuest = "Area2Quest"
            LevelQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
            CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
        elseif MyLevel >= 875 and MyLevel <= 899 then
            Mon = "Marine Lieutenant"
            LevelQuest = 1
            NameQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif MyLevel >= 900 and MyLevel <= 949 then
            Mon = "Marine Captain"
            LevelQuest = 2
            NameQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
        elseif MyLevel >= 950 and MyLevel <= 974 then
            Mon = "Zombie"
            LevelQuest = 1
            NameQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
        elseif MyLevel >= 975 and MyLevel <= 999 then
            Mon = "Vampire"
            LevelQuest = 2
            NameQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
        elseif MyLevel >= 1000 and MyLevel <= 1049 then
            Mon = "Snow Trooper"
            LevelQuest = 1
            NameQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
        elseif MyLevel >= 1050 and MyLevel <= 1099 then
            Mon = "Winter Warrior"
            LevelQuest = 2
            NameQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
        elseif MyLevel >= 1100 and MyLevel <= 1124 then
            Mon = "Lab Subordinate"
            LevelQuest = 1
            NameQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
        elseif MyLevel >= 1125 and MyLevel <= 1174 then
            Mon = "Horned Warrior"
            LevelQuest = 2
            NameQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
        elseif MyLevel >= 1175 and MyLevel <= 1199 then
            Mon = "Magma Ninja"
            LevelQuest = 1
            NameQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
        elseif MyLevel >= 1200 and MyLevel <= 1249 then
            Mon = "Lava Pirate"
            LevelQuest = 2
            NameQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif MyLevel >= 1250 and MyLevel <= 1274 then
            Mon = "Ship Deckhand"
            LevelQuest = 1
            NameQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
            CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)    
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel >= 1275 and MyLevel <= 1299 then
            Mon = "Ship Engineer"
            LevelQuest = 2
            NameQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)   
            CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end             
        elseif MyLevel >= 1300 and MyLevel <= 1324 then
            Mon = "Ship Steward"
            LevelQuest = 1
            NameQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)         
            CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)      
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel >= 1325 and MyLevel <= 1349 then
            Mon = "Ship Officer"
            LevelQuest = 2
            NameQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel >= 1350 and MyLevel <= 1374 then
            Mon = "Arctic Warrior"
            LevelQuest = 1
            NameQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
            end
        elseif MyLevel >= 1375 and MyLevel <= 1424 then
            Mon = "Snow Lurker"
            LevelQuest = 2
            NameQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
        elseif MyLevel >= 1425 and MyLevel <= 1449 then
            Mon = "Sea Soldier"
            LevelQuest = 1
            NameQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
            CFrameMon = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        elseif MyLevel >= 1450 then
            Mon = "Water Fighter"
            LevelQuest = 2
            NameQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054, 240, -10146)
            CFrameMon = CFrame.new(-3291, 252, -10501)
        end
    elseif World3 then
        if MyLevel >= 1500 and MyLevel <= 1524 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif MyLevel >= 1525 and MyLevel <= 1574 then
            Mon = "Pistol Billionaire"
            LevelQuest = 2
            NameQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
        elseif MyLevel >= 1575 and MyLevel <= 1599 then
            Mon = "Dragon Crew Warrior"
            LevelQuest = 1
            NameQuest = "DragonCrewQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(6738.96142578125, 127.81645965576172, -713.511474609375)
            CFrameMon = CFrame.new(6920.71435546875, 56.15597152709961, -942.5044555664062)
        elseif MyLevel >= 1600 and MyLevel <= 1624 then 
            Mon = "Dragon Crew Archer"
            NameQuest = "DragonCrewQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(6738.96142578125, 127.81645965576172, -713.511474609375)
            CFrameMon = CFrame.new(6817.91259765625, 484.804443359375, 513.4141235351562)
        elseif MyLevel >= 1625 and MyLevel <= 1649 then
            Mon = "Hydra Enforcer"
            NameQuest = "VenomCrewQuest"
            LevelQuest = 1
            NameMon = "Hydra Enforcer"
            CFrameQuest = CFrame.new(5213.8740234375, 1004.5042724609375, 758.6944580078125)
            CFrameMon = CFrame.new(4584.69287109375, 1002.6435546875, 705.7958984375)
        elseif MyLevel >= 1650 and MyLevel <= 1699 then 
            Mon = "Venomous Assailant"
            NameQuest = "VenomCrewQuest"
            LevelQuest = 2
            NameMon = "Venomous Assailant"
            CFrameQuest = CFrame.new(5213.8740234375, 1004.5042724609375, 758.6944580078125)
            CFrameMon = CFrame.new(4638.78564453125, 1078.94091796875, 881.8002319335938)        
        elseif MyLevel >= 1700 and MyLevel <= 1724 then
            Mon = "Marine Commodore"
            LevelQuest = 1
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
            CFrameMon = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
        elseif MyLevel >= 1725 and MyLevel <= 1774 then
            Mon = "Marine Rear Admiral"
            NameMon = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            LevelQuest = 2
            CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
        elseif MyLevel >= 1775 and MyLevel <= 1799 then
            Mon = "Fishman Raider"
            LevelQuest = 1
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
        elseif MyLevel >= 1800 and MyLevel <= 1824 then
            Mon = "Fishman Captain"
            LevelQuest = 2
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
        elseif MyLevel >= 1825 and MyLevel <= 1849 then
            Mon = "Forest Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
            CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
        elseif MyLevel >= 1850 and MyLevel <= 1899 then
            Mon = "Mythological Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
            CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif MyLevel >= 1900 and MyLevel <= 1924 then
            Mon = "Jungle Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
        elseif MyLevel >= 1925 and MyLevel <= 1974 then
            Mon = "Musketeer Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
        elseif MyLevel >= 1975 and MyLevel <= 1999 then
            Mon = "Reborn Skeleton"
            LevelQuest = 1
            NameQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
        elseif MyLevel >= 2000 and MyLevel <= 2024 then
            Mon = "Living Zombie"
            LevelQuest = 2
            NameQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
        elseif MyLevel >= 2025 and MyLevel <= 2049 then
            Mon = "Demonic Soul"
            LevelQuest = 1
            NameQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
            CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
        elseif MyLevel >= 2050 and MyLevel <= 2074 then
            Mon = "Posessed Mummy"
            LevelQuest = 2
            NameQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif MyLevel >= 2075 and MyLevel <= 2099 then
            Mon = "Peanut Scout"
            LevelQuest = 1
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
        elseif MyLevel >= 2100 and MyLevel <= 2124 then
            Mon = "Peanut President"
            LevelQuest = 2
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
        elseif MyLevel >= 2125 and MyLevel <= 2149 then
            Mon = "Ice Cream Chef"
            LevelQuest = 1
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
        elseif MyLevel >= 2150 and MyLevel <= 2199 then
            Mon = "Ice Cream Commander"
            LevelQuest = 2
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
        elseif MyLevel >= 2200 and MyLevel <= 2224 then
            Mon = "Cookie Crafter"
            LevelQuest = 1
            NameQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
        elseif MyLevel >= 2225 and MyLevel <= 2249 then
            Mon = "Cake Guard"
            LevelQuest = 2
            NameQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
        elseif MyLevel >= 2250 and MyLevel <= 2274 then
            Mon = "Baking Staff"
            LevelQuest = 1
            NameQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
        elseif MyLevel >= 2275 and MyLevel <= 2299 then
            Mon = "Head Baker"
            LevelQuest = 2
            NameQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
        elseif MyLevel >= 2300 and MyLevel <= 2324 then
            Mon = "Cocoa Warrior"
            LevelQuest = 1
            NameQuest = "ChocQuest1"
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
        elseif MyLevel >= 2325 and MyLevel <= 2349 then
            Mon = "Chocolate Bar Battler"
            LevelQuest = 2
            NameQuest = "ChocQuest1"
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif MyLevel >= 2350 and MyLevel <= 2374 then
            Mon = "Sweet Thief"
            LevelQuest = 1
            NameQuest = "ChocQuest2"
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
        elseif MyLevel >= 2375 and MyLevel <= 2399 then
            Mon = "Candy Rebel"
            LevelQuest = 2
            NameQuest = "ChocQuest2"
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
        elseif MyLevel >= 2400 and MyLevel <= 2424 then
            Mon = "Candy Pirate"
            LevelQuest = 1
            NameQuest = "CandyQuest1"
            NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif MyLevel >= 2425 and MyLevel <= 2449 then
            Mon = "Snow Demon"
            LevelQuest = 2
            NameQuest = "CandyQuest1"
            NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)            
        elseif MyLevel >= 2450 and MyLevel <= 2474 then
            Mon = "Isle Outlaw"
            LevelQuest = 1
            NameQuest = "TikiQuest1"
            NameMon = "Isle Outlaw"
            CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
            CFrameMon = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
        elseif MyLevel >= 2475 and MyLevel <= 2524 then
            Mon = "Island Boy"
            LevelQuest = 2
            NameQuest = "TikiQuest1"
            NameMon = "Island Boy"
            CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
            CFrameMon = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562)
        elseif MyLevel >= 2525 and MyLevel <= 2550 then
            Mon = "Isle Champion"
            LevelQuest = 2
            NameQuest = "TikiQuest2"
            NameMon = "Isle Champion"
            CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(-16641.6796875, 235.7825469970703, 1031.282958984375)
        elseif MyLevel >= 2550 and MyLevel <= 2574 then
            Mon = "Serpent Hunter"
            LevelQuest = 1
            NameQuest = "TikiQuest3"
            NameMon = "Serpent Hunter"
            CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-16521.0625, 106.09285, 1488.78467, 0.469467044, 0, 0.882950008, 0, 1, 0, -0.882950008, 0, 0.469467044)
        elseif MyLevel >= 2575 and MyLevel <= 2599 then
            Mon = "Skull Slayer"
            LevelQuest = 2
            NameQuest = "TikiQuest3"
            NameMon = "Skull Slayer"
            CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-16887.7305, 113.074638, 1629.97778, -0.559032857, 1.2313353e-08, -0.829145491, 1.05618814e-09, 1, 1.41385428e-08, 0.829145491, 7.02817626e-09, -0.559032857)           
        elseif MyLevel >= 2600 and MyLevel <= 2624 then
            Mon = "Reef Bandit"
            LevelQuest = 1
            NameQuest = "SubmergedQuest1"
            NameMon = "Reef Bandits"
            CFrameQuest = CFrame.new(10778.875, -2087.72437, 9265.18359, 0.934615612, -9.33109447e-08, -0.355659455, 9.17655143e-08, 1, -2.12154276e-08, 0.355659455, -1.28090019e-08, 0.934615612)
            CFrameMon = CFrame.new(11019.1318, -2146.06812, 9342.3916, -0.719955266, -1.74275385e-08, 0.69402045, 5.76556367e-08, 1, 8.49211546e-08, -0.69402045, 1.01153624e-07, -0.719955266)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            topos(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 1.47309942e-09, -0.0721890926, -4.00651912e-09, 0.99999994, -2.51183763e-09, 0.0721890852, 5.75363091e-10, 0.997390926))
            task.wait(2)
            local args = {"TravelToSubmergedIsland"} game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer(unpack(args))
            end             
        elseif MyLevel >= 2625 and MyLevel <= 2649 then
            Mon = "Coral Pirate"
            LevelQuest = 2
            NameQuest = "SubmergedQuest1"
            NameMon = "Coral Pirates"
            CFrameQuest = CFrame.new(10778.875, -2087.72437, 9265.18359, 0.934615612, -9.33109447e-08, -0.355659455, 9.17655143e-08, 1, -2.12154276e-08, 0.355659455, -1.28090019e-08, 0.934615612)
            CFrameMon = CFrame.new(10808.6006, -2030.36145, 9364.2334, -0.775185347, -0.0359364748, 0.6307109, 0.0615428537, 0.989336014, 0.132010356, -0.628728986, 0.141148239, -0.764707148)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            topos(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 1.47309942e-09, -0.0721890926, -4.00651912e-09, 0.99999994, -2.51183763e-09, 0.0721890852, 5.75363091e-10, 0.997390926))
            task.wait(2)
            local args = {"TravelToSubmergedIsland"} game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer(unpack(args))
            end
        elseif MyLevel >= 2650 and MyLevel <= 2674 then
            Mon = "Sea Chanter"
            LevelQuest = 1
            NameQuest = "SubmergedQuest2"
            NameMon = "Sea Chanters"
            CFrameQuest = CFrame.new(10880.6855, -2086.20044, 10032.624, -0.321384728, 9.87648434e-08, -0.946948707, 7.13271007e-08, 1, 8.00902953e-08, 0.946948707, -4.18033075e-08, -0.321384728)
            CFrameMon = CFrame.new(10671.2715, -2057.59155, 10047.2588, -0.846484065, -3.11045447e-08, 0.532414079, -5.55383117e-08, 1, -2.98785316e-08, -0.532414079, -5.48610757e-08, -0.846484065)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            topos(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 1.47309942e-09, -0.0721890926, -4.00651912e-09, 0.99999994, -2.51183763e-09, 0.0721890852, 5.75363091e-10, 0.997390926))
            task.wait(2)
            local args = {"TravelToSubmergedIsland"} game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer(unpack(args))
            end
        elseif MyLevel >= 2675 and MyLevel <= 2699 then             
            Mon = "Ocean Prophet"
            LevelQuest = 2
            NameQuest = "SubmergedQuest2"
            NameMon = "Ocean Prophets"
            CFrameQuest = CFrame.new(10880.6855, -2086.20044, 10032.624, -0.321384728, 9.87648434e-08, -0.946948707, 7.13271007e-08, 1, 8.00902953e-08, 0.946948707, -4.18033075e-08, -0.321384728)
            CFrameMon = CFrame.new(11008.5195, -2007.72839, 10223.0791, -0.688615739, 2.33523378e-09, -0.725126445, 2.99292546e-09, 1, 3.78221315e-10, 0.725126445, -1.90980032e-09, -0.688615739)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            topos(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 1.47309942e-09, -0.0721890926, -4.00651912e-09, 0.99999994, -2.51183763e-09, 0.0721890852, 5.75363091e-10, 0.997390926))
            task.wait(2)
            local args = {"TravelToSubmergedIsland"} game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer(unpack(args))
            end
        elseif MyLevel >= 2700 and MyLevel <= 2724 then             
            Mon = "High Disciple"
            LevelQuest = 1
            NameQuest = "SubmergedQuest3"
            NameMon = "High Disciple"
            CFrameQuest = CFrame.new(9640.08789, -1992.44507, 9613.65234, -0.957327187, 4.11991223e-08, 0.289006323, 1.5775445e-08, 1, -9.02985846e-08, -0.289006323, -8.18860855e-08, -0.957327187)
            CFrameMon = CFrame.new(9750.41602, -1966.93884, 9753.36035, -0.749824047, 5.57797613e-08, -0.661637306, 2.03500754e-08, 1, 6.1243199e-08, 0.661637306, 3.24572511e-08, -0.749824047)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            topos(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 1.47309942e-09, -0.0721890926, -4.00651912e-09, 0.99999994, -2.51183763e-09, 0.0721890852, 5.75363091e-10, 0.997390926))
            task.wait(2)
            local args = {"TravelToSubmergedIsland"} game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer(unpack(args))
            end      
        elseif MyLevel >= 2725 then             
            Mon = "Grand Devotee"
            LevelQuest = 2
            NameQuest = "SubmergedQuest3"
            NameMon = "Grand Devotee"
            CFrameQuest = CFrame.new(9640.08789, -1992.44507, 9613.65234, -0.957327187, 4.11991223e-08, 0.289006323, 1.5775445e-08, 1, -9.02985846e-08, -0.289006323, -8.18860855e-08, -0.957327187)
            CFrameMon = CFrame.new(9611.70508, -1993.47119, 9882.68848, -0.591375351, 4.14332426e-08, -0.806396425, 4.73774868e-08, 1, 1.66361875e-08, 0.806396425, -2.83668058e-08, -0.591375351)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
            topos(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 1.47309942e-09, -0.0721890926, -4.00651912e-09, 0.99999994, -2.51183763e-09, 0.0721890852, 5.75363091e-10, 0.997390926))
            task.wait(2)
            local args = {"TravelToSubmergedIsland"} game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer(unpack(args))
            end               
        end
    end
end
MaterialMon = function()
    local a = game.Players.LocalPlayer
    local b = a.Character and a.Character:FindFirstChild("HumanoidRootPart")
    if not b then return end
    if World1 then
        if SelectMaterial == "Angel Wings" then
            MMon = {"Shanda", "Royal Squad", "Royal Soldier", "Wysper", "Thunder God"}
            MPos = CFrame.new(-4698, 845, -1912)
            SP = "Default"
        elseif SelectMaterial == "Leather + Scrap Metal" then
            MMon = {"Brute", "Pirate"}
            MPos = CFrame.new(-1145, 15, 4350)
            SP = "Default"
        elseif SelectMaterial == "Magma Ore" then
            MMon = {"Military Soldier", "Military Spy", "Magma Admiral"}
            MPos = CFrame.new(-5815, 84, 8820)
            SP = "Default"
        elseif SelectMaterial == "Fish Tail" then
            MMon = {"Fishman Warrior", "Fishman Commando", "Fishman Lord"}
            MPos = CFrame.new(61123, 19, 1569)
            SP = "Default"
        end
    elseif World2 then
        if SelectMaterial == "Leather + Scrap Metal" then
            MMon = {"Marine Captain"}
            MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
            SP = "Default"
        elseif SelectMaterial == "Magma Ore" then
            MMon = {"Magma Ninja", "Lava Pirate"}
            MPos = CFrame.new(-5428, 78, -5959)
            SP = "Default"
        elseif SelectMaterial == "Ectoplasm" then
            MMon = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
            MPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625)
            SP = "Default"
        elseif SelectMaterial == "Mystic Droplet" then
            MMon = {"Water Fighter"}
            MPos = CFrame.new(-3385, 239, -10542)
            SP = "Default"
        elseif SelectMaterial == "Radioactive Material" then
            MMon = {"Factory Staff"}
            MPos = CFrame.new(295, 73, -56)
            SP = "Default"
        elseif SelectMaterial == "Vampire Fang" then
            MMon = {"Vampire"}
            MPos = CFrame.new(-6033, 7, -1317)
            SP = "Default"
        end
    elseif World3 then
        if SelectMaterial == "Scrap Metal" then
            MMon = {"Jungle Pirate", "Forest Pirate"}
            MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
            SP = "Default"
        elseif SelectMaterial == "Fish Tail" then
            MMon = {"Fishman Raider", "Fishman Captain"}
            MPos = CFrame.new(-10993, 332, -8940)
            SP = "Default"
        elseif SelectMaterial == "Conjured Cocoa" then
            MMon = {"Chocolate Bar Battler", "Cocoa Warrior"}
            MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
            SP = "Default"
        elseif SelectMaterial == "Dragon Scale" then
            MMon = {"Dragon Crew Archer", "Dragon Crew Warrior"}
            MPos = CFrame.new(6594, 383, 139)
            SP = "Default"
        elseif SelectMaterial == "Gunpowder" then
            MMon = {"Pistol Billionaire"}
            MPos = CFrame.new(-84.8556900024414, 85.62061309814453, 6132.0087890625)
            SP = "Default"
        elseif SelectMaterial == "Mini Tusk" then
            MMon = {"Mythological Pirate"}
            MPos = CFrame.new(-13545, 470, -6917)
            SP = "Default"
        elseif SelectMaterial == "Demonic Wisp" then
            MMon = {"Demonic Soul"}
            MPos = CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)
            SP = "Default"
        end
    end
end
function UpdateBerriesESP()
	local CollectionService = game:GetService("CollectionService")
	local BerryBushes = CollectionService:GetTagged("BerryBush")
	for _, Bush in pairs(BerryBushes) do
		pcall(function()
			for AttributeName, Berry in pairs(Bush:GetAttributes()) do
				if Berry then
					if not Bush.Parent:FindFirstChild("BerryESP") then
						local bill = Instance.new("BillboardGui", Bush.Parent)
						bill.Name = "BerryESP"
						bill.ExtentsOffset = Vector3.new(0, 2, 0)
						bill.Size = UDim2.new(1, 200, 1, 30)
						bill.Adornee = Bush.Parent
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel", bill)
						name.Font = Enum.Font.GothamSemibold
						name.TextSize = 14
						name.TextWrapped = true
						name.Size = UDim2.new(1, 0, 1, 0)
						name.TextYAlignment = Enum.TextYAlignment.Top
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 0)
						name.Text = Berry
					end
					if Bush.Parent:FindFirstChild("BerryESP") then
						local Player = game.Players.LocalPlayer
						if Player and Player.Character and Player.Character:FindFirstChild("Head") then
							local Position = Player.Character.Head.Position
							local Magnitude = (Bush.Parent:GetPivot().Position - Position).Magnitude
							Bush.Parent.BerryESP.TextLabel.Text = Berry .. "\n" .. math.floor(Magnitude) .. "m"
						end
					end
				else
					if Bush.Parent:FindFirstChild("NameEsp") then
						Bush.Parent:FindFirstChild("NameEsp"):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateIslandESP()
	for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		pcall(function()
			if IslandESP then
				if v.Name ~= "Sea" then
					if not v:FindFirstChild("NameEsp") then
						local bill = Instance.new("BillboardGui", v)
						bill.Name = "NameEsp"
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1, 200, 1, 30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel", bill)
						name.Font = "GothamSemibold"
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1, 0, 1, 0)
						name.TextYAlignment = "Top"
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
					else
						v["NameEsp"].TextLabel.Text =
							v.Name .. "   \n" ..
							round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. " Distance"
					end
				end
			else
				if v:FindFirstChild("NameEsp") then
					v:FindFirstChild("NameEsp"):Destroy()
				end
			end
		end)
	end
end
function round(num)
	return math.floor(num + 0.5)
end
function UpdateDevilChams()
	for i, v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if DevilFruitESP then
				if string.find(v.Name, "Fruit") then
					if not v.Handle:FindFirstChild("NameEsp" .. Number) then
						local bill = Instance.new("BillboardGui", v.Handle)
						bill.Name = "NameEsp" .. Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1, 200, 1, 30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel", bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1, 0, 1, 0)
						name.TextYAlignment = "Top"
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
						name.Text = v.Name .. " \n" ..
							round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3) ..
							" Distance"
					else
						v.Handle["NameEsp" .. Number].TextLabel.Text =
							v.Name .. "   \n" ..
							round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3) ..
							" Distance"
					end
				end
			else
				if v.Handle:FindFirstChild("NameEsp" .. Number) then
					v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
				end
			end
		end)
	end
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	for i, v in pairs(game:GetService("Players"):GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild("NameEsp" .. Number) then
						local bill = Instance.new("BillboardGui", v.Character.Head)
						bill.Name = "NameEsp" .. Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1, 200, 1, 30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel", bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = v.Name .. " \n" ..
							round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. " Distance"
						name.Size = UDim2.new(1, 0, 1, 0)
						name.TextYAlignment = "Top"
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.new(0, 255, 0)
						else
							name.TextColor3 = Color3.new(255, 0, 0)
						end
					else
						v.Character.Head["NameEsp" .. Number].TextLabel.Text =
							v.Name .. " | " ..
							round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " ..
							round(v.Character.Humanoid.Health * 100 / v.Character.Humanoid.MaxHealth) .. "%"
					end
				else
					if v.Character.Head:FindFirstChild("NameEsp" .. Number) then
						v.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
					end
				end
			end
		end)
	end
end
function isnil(thing)
	return (thing == nil)
end
function UpdateIslandESP()
	for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		pcall(function()
			if IslandESP then
				if v.Name ~= "Sea" then
					if not v:FindFirstChild("NameEsp") then
						local bill = Instance.new("BillboardGui", v)
						bill.Name = "NameEsp"
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1, 200, 1, 30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel", bill)
						name.Font = "GothamSemibold"
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1, 0, 1, 0)
						name.TextYAlignment = "Top"
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
					else
						v["NameEsp"].TextLabel.Text =
							v.Name .. "   \n" ..
							round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. " Distance"
					end
				end
			else
				if v:FindFirstChild("NameEsp") then
					v:FindFirstChild("NameEsp"):Destroy()
				end
			end
		end)
	end
end
function round(num)
	return math.floor(num + 0.5)
end
function UpdateDevilChams()
	for i, v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if DevilFruitESP then
				if string.find(v.Name, "Fruit") then
					if not v.Handle:FindFirstChild("NameEsp" .. Number) then
						local bill = Instance.new("BillboardGui", v.Handle)
						bill.Name = "NameEsp" .. Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1, 200, 1, 30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel", bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1, 0, 1, 0)
						name.TextYAlignment = "Top"
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
						name.Text = v.Name .. " \n" ..
							round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3) ..
							" Distance"
					else
						v.Handle["NameEsp" .. Number].TextLabel.Text =
							v.Name .. "   \n" ..
							round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3) ..
							" Distance"
					end
				end
			else
				if v.Handle:FindFirstChild("NameEsp" .. Number) then
					v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
				end
			end
		end)
	end
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	for i, v in pairs(game:GetService("Players"):GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild("NameEsp" .. Number) then
						local bill = Instance.new("BillboardGui", v.Character.Head)
						bill.Name = "NameEsp" .. Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1, 200, 1, 30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel", bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = v.Name .. " \n" ..
							round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. " Distance"
						name.Size = UDim2.new(1, 0, 1, 0)
						name.TextYAlignment = "Top"
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.new(0, 255, 0)
						else
							name.TextColor3 = Color3.new(255, 0, 0)
						end
					else
						v.Character.Head["NameEsp" .. Number].TextLabel.Text =
							v.Name .. " | " ..
							round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " ..
							round(v.Character.Humanoid.Health * 100 / v.Character.Humanoid.MaxHealth) .. "%"
					end
				else
					if v.Character.Head:FindFirstChild("NameEsp" .. Number) then
						v.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
					end
				end
			end
		end)
	end
end
function isnil(thing)
	return (thing == nil)
end
function InfAb()
    local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    if InfAbility then
        if not hrp:FindFirstChild("Agility") then
            local inf = Instance.new("ParticleEmitter")
            inf.Acceleration = Vector3.new(0, 0, 0)
            inf.Archivable = true
            inf.Drag = 20
            inf.EmissionDirection = Enum.NormalId.Top
            inf.Enabled = true
            inf.Lifetime = NumberRange.new(0, 0)
            inf.LightInfluence = 0
            inf.LockedToPart = true
            inf.Name = "Agility"
            inf.Rate = 500
            inf.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 4)
            })
            inf.RotSpeed = NumberRange.new(9999, 99999)
            inf.Rotation = NumberRange.new(0, 0)
            inf.Speed = NumberRange.new(30, 30)
            inf.SpreadAngle = Vector2.new(0, 0)
            inf.Texture = ""
            inf.VelocityInheritance = 0
            inf.ZOffset = 2
            inf.Transparency = NumberSequence.new(0)
            inf.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0))
            inf.Parent = hrp
        end
    else
        if hrp:FindFirstChild("Agility") then
            hrp.Agility:Destroy()
        end
    end
end
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    function TPReturner()
        local Site
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. foundAnything))
        end
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" then
            foundAnything = Site.nextPageCursor
        end
        local num = 0
        for _, v in pairs(Site.data) do
            local Possible = true
            local ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _, Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local _ = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible then
                    table.insert(AllIDs, ID)
                    wait(0.1)
                    pcall(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(1)
                    break
                end
            end
        end
    end
    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
            wait(HopDelay)
        end
    end
    Teleport()
end
function FPSBooster()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    sethiddenproperty(t, "Decoration", false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    local function optimizePart(v)
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
            v.TextureID = "rbxassetid://0"
        end
    end
    for _, v in pairs(w:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("MeshPart") then
            optimizePart(v)
        end
    end
    for _, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or
           e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end
local plr = game.Players.LocalPlayer
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().TeleportIsland or getgenv().TeleportNPC or getgenv().AutoFarm or getgenv().AutoMaterial or getgenv().AutoFarmMasteryFruit or getgenv().AutoFarmMasteryGun or getgenv().AutoFarmMasteryAllSword or getgenv().AutoGetMelee or getgenv().TeleportToFruit or getgenv().AutoNewWorld or getgenv().AutoThirdSea or getgenv().AutoBartilo or getgenv().AutoTrainingDummy or getgenv().AutoFactory or getgenv().AutoPirateRaid or getgenv().AutoEliteHunter or getgenv().AutoUnHaki or getgenv().AutoAttackRipIndra or getgenv().AutoSoulReaper or getgenv().AutoDoughKing or getgenv().AutoAttackDoughKing or getgenv().AutoPhoenixRaid or getgenv().AutoDarkBladev3 or getgenv().AutoDarkbeard or getgenv().DojoClaimQuest or getgenv().DragonTalonUpgrade or getgenv().AutoCollectBerry or getgenv().AutoFarmChest or getgenv().AutoLaw or getgenv().AutoObservationHakiV2 or getgenv().AutoObservation or getgenv().AutoKillMob or getgenv().AutoKillBoss or getgenv().AutoKillAllBoss or getgenv().AutoStartRaid or getgenv().AutoDungeon or getgenv().AutoTeleportLab or getgenv().TeleportNpcSea or getgenv().SailBoat or getgenv().Autoterrorshark or getgenv().KillShark or getgenv().KillPiranha or getgenv().KillFishCrew or getgenv().TeleportToKitsuneIsland or getgenv().AutoStartKitsune or getgenv().CollectAzure or getgenv().TeleportFrozenDimension or getgenv().AutoAttackLeviathan or getgenv().TrialTeleportDraco or getgenv().AutoTrialDracoBeta or getgenv().AutoTrainDraco or getgenv().AutoDracoV2 or getgenv().AutoUpgradeRace or getgenv().TeleportAcientClock or getgenv().AutoBuyGear or getgenv().QuestTrain_2 or getgenv().TweenMigareIsland or getgenv().AutoTeleportHighestPoint or getgenv().TeleportAdvancedFruitDealer or getgenv().TweenToGear or getgenv().TeleportTrialDoor or getgenv().AutoTrialRace or getgenv().AutoKillPlayerAfterTrial or getgenv().AutoTeleportLegendarySwordDealer or getgenv().AutoTeleportBaristaCousin or getgenv().AutoRainBowHaki or getgenv().AutoSkullGuitar or getgenv().AutoGetCDK or getgenv().AutoTushita or getgenv().AutoHolyTorch or getgenv().AutoSaber or getgenv().FindPrehistoric or getgenv().TeleportToPrehistoricIsland or getgenv().AutoStartPrehistoric or getgenv().AutoDefendVolcano or getgenv().CollectBone or getgenv().CollectEgg or getgenv().TpPly then
                if not plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = plr.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                    Noclip.Velocity = Vector3.new(0, 0, 0)
                end
                if not plr.Character:FindFirstChild("highlight") then
                    local Test = Instance.new("Highlight")
                    Test.Name = "highlight"
                    Test.Enabled = true
                    Test.FillColor = Color3.fromRGB(219, 18, 18)
                    Test.OutlineColor = Color3.fromRGB(255, 255, 255)
                    Test.FillTransparency = 0.5
                    Test.OutlineTransparency = 0.2
                    Test.Parent = plr.Character
                end
                for _, no in pairs(plr.Character:GetDescendants()) do
                    if no:IsA("BasePart") then
                        no.CanCollide = false
                    end
                end
            else
                local clip = plr.Character.HumanoidRootPart:FindFirstChild("BodyClip")
                if clip then clip:Destroy() end
                local hl = plr.Character:FindFirstChild("highlight")
                if hl then hl:Destroy() end
            end
        end)
    end
end)
function CheckNearestTeleporter(aI)
    local MyLevel = game.Players.LocalPlayer.Data.Level.Value
    local vcspos = aI.Position
    local min = math.huge
    local min2 = math.huge
    local y = game.PlaceId
    local isTempleTarget = tostring(aI.Position) == "28286, 14897, 103"
    if isTempleTarget then
        local mapStash = game:GetService("ReplicatedStorage"):WaitForChild("MapStash")
        local temple = mapStash:FindFirstChild("Temple of Time")
        if temple and not workspace:FindFirstChild("Temple of Time") then
            temple.Parent = workspace:WaitForChild("Map")
        end
        while not workspace:FindFirstChild("Temple of Time") do
            task.wait(0.1)
        end
    end
    local TableLocations = {}
    if y == 7449423635 then
        TableLocations = {
            ["Mansion"] = Vector3.new(-12471, 374, -7551),
            ["Hydra"] = Vector3.new(5659, 1013, -341),
            ["Caslte On The Sea"] = Vector3.new(-5092, 315, -3130),
            ["Floating Turtle"] = Vector3.new(-12001, 332, -8861),
            ["Beautiful Pirate"] = Vector3.new(5319, 23, -93),
            ["Temple of Time"] = Vector3.new(28286, 14897, 103)
        }
    elseif y == 4442272183 then
        TableLocations = {
            ["Flamingo Mansion"] = Vector3.new(-317, 331, 597),
            ["Flamingo Room"] = Vector3.new(2283, 15, 867),
            ["Cursed Ship"] = Vector3.new(923, 125, 32853),
            ["Zombie Island"] = Vector3.new(-6509, 83, -133)
        }
    elseif y == 2753915549 then
        TableLocations = {
            ["Sky Island 1"] = Vector3.new(-4652, 873, -1754),
            ["Sky Island 2"] = Vector3.new(-7895, 5547, -380),
            ["Under Water Island"] = Vector3.new(61164, 5, 1820),
            ["Under Water Island Entrance"] = Vector3.new(3865, 5, -1926)
        }
    end
    local TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - vcspos).Magnitude
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    local choose
    for r, v in pairs(TableLocations2) do
        if v <= min then
            choose = TableLocations[r]
        end
    end
    local min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if min2 <= min3 then
        return choose
    end
end
function requestEntrance(aJ)
    local args = { "requestEntrance", aJ }
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
    local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local char = game.Players.LocalPlayer.Character.HumanoidRootPart
    char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
    task.wait(0.5)
end
function topos(aL)
    pcall(function()
        local player = game:GetService("Players").LocalPlayer
        local character = player and player.Character
        local humanoid = character and character:FindFirstChild("Humanoid")
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        if player and character and humanoid and rootPart and humanoid.Health > 0 then
            if humanoid.Sit then
                humanoid.Sit = false
            end
            if getgenv().currentTween then
                getgenv().currentTween:Cancel()
                getgenv().currentTween = nil
            end
            if not TweenSpeed then
                TweenSpeed = 350
            end
            local DefaultY = aL.Y
            local TargetY = aL.Y
            local targetCFrameWithDefaultY = CFrame.new(aL.X, DefaultY, aL.Z)
            local targetPos = aL.Position
            local Distance = (targetPos - rootPart.Position).Magnitude
            if Distance <= 300 then
                rootPart.CFrame = aL
                return
            end
            local aM = CheckNearestTeleporter(aL)
            if aM then
                requestEntrance(aM)
            end
            local b1 = CFrame.new(rootPart.CFrame.X, DefaultY, rootPart.CFrame.Z)
            local IgnoreY = true
            if IgnoreY and (b1.Position - targetCFrameWithDefaultY.Position).Magnitude > 5 then
                rootPart.CFrame = CFrame.new(rootPart.CFrame.X, DefaultY, rootPart.CFrame.Z)
                local tweenService = game:GetService("TweenService")
                local tweenInfo = TweenInfo.new((targetPos - rootPart.Position).Magnitude / TweenSpeed, Enum.EasingStyle.Linear)
                getgenv().currentTween = tweenService:Create(rootPart, tweenInfo, { CFrame = targetCFrameWithDefaultY })
                getgenv().currentTween:Play()
                getgenv().currentTween.Completed:Wait()
                rootPart.CFrame = CFrame.new(rootPart.CFrame.X, TargetY, rootPart.CFrame.Z)
            else
                local tweenService = game:GetService("TweenService")
                local tweenInfo = TweenInfo.new((targetPos - rootPart.Position).Magnitude / TweenSpeed, Enum.EasingStyle.Linear)
                getgenv().currentTween = tweenService:Create(rootPart, tweenInfo, { CFrame = aL })
                getgenv().currentTween:Play()
                getgenv().currentTween.Completed:Wait()
                rootPart.CFrame = CFrame.new(rootPart.CFrame.X, TargetY, rootPart.CFrame.Z)
            end
        end
    end)
end
function StopTween(target)
    local char = game.Players.LocalPlayer.Character
    if getgenv().currentTween then
        getgenv().currentTween:Cancel()
        getgenv().currentTween = nil
    end
    if not target then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame + Vector3.new(0, 0.01, 0)
        end
        if hrp and hrp:FindFirstChild("BodyClip") then
            hrp.BodyClip:Destroy()
        end
    end
end
function TPB(CFgo, seat)
    local tween_s = game:GetService("TweenService")
    local info = TweenInfo.new((seat.Position - CFgo.Position).Magnitude / 350,Enum.EasingStyle.Linear)
    local tween = tween_s:Create(seat, info, {CFrame = CFgo})
    tween:Play()
    local tweenfunc = {}
    function tweenfunc:Stop()
        tween:Cancel()
    end
    return tweenfunc
end
function TPBSEA(CFgo)
    local tween_s = game:GetService("TweenService")
    local info = TweenInfo.new((game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude / 350,Enum.EasingStyle.Linear)
    tween = tween_s:Create(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat,info,{CFrame = CFgo})
    tween:Play()
    local tweenfunc = {}
    function tweenfunc:Stop()
        tween:Cancel()
    end
    return tweenfunc
end
function TPP(CFgo)
    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 
        or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") 
    then
        tween:Cancel()
        repeat 
            wait() 
        until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") 
            and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
        wait(7)
        return
    end
    local tween_s = game:GetService("TweenService")
    local info = TweenInfo.new((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFgo.Position).Magnitude / 325,Enum.EasingStyle.Linear)
    tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,info,{CFrame = CFgo})
    tween:Play()
    local tweenfunc = {}
    function tweenfunc:Stop()
        tween:Cancel()
    end
    return tweenfunc
end
CheckF = function()
    if GetBP("Dragon-Dragon") 
    or GetBP("Gas-Gas") 
    or GetBP("Yeti-Yeti") 
    or GetBP("Kitsune-Kitsune") 
    or GetBP("T-Rex-T-Rex") 
    then 
        return true 
    end
end
local plr = game:GetService("Players").LocalPlayer
GetBP = function(v)
    return plr.Backpack:FindFirstChild(v) or plr.Character:FindFirstChild(v)
end
local replicated = game:GetService("ReplicatedStorage")
GetM = function(Name)
    local inv = replicated.Remotes.CommF_:InvokeServer("getInventory")
    for _, tab in pairs(inv) do
        if type(tab) == "table" and tab.Type == "Material" and tab.Name == Name then
            return tab.Count
        end
    end
    return 0
end
local function getRoot()
    return plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
end
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local function EquipWeapon(text)
    if not text then return end
    local tool = plr.Backpack:FindFirstChild(text)
    if tool and plr.Character and plr.Character:FindFirstChild("Humanoid") then
        plr.Character.Humanoid:EquipTool(tool)
    end
end
local function weaponSc(weapon)
    for _, v in pairs(plr.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == weapon then
            EquipWeapon(v.Name)
            break
        end
    end
end
local plr = game.Players.LocalPlayer
DropFruits = function()
    for _, v3 in next, plr.Backpack:GetChildren() do
        if string.find(v3.Name, "Fruit") then
            EquipWeapon(v3.Name)
            wait(0.1)
            if plr.PlayerGui.Main.Dialogue.Visible == true then
                plr.PlayerGui.Main.Dialogue.Visible = false
            end
            EquipWeapon(v3.Name)
            plr.Character:FindFirstChild(v3.Name).EatRemote:InvokeServer("Drop")
        end
    end
    for _, b2 in pairs(plr.Character:GetChildren()) do
        if string.find(b2.Name, "Fruit") then
            EquipWeapon(b2.Name)
            wait(0.1)
            if plr.PlayerGui.Main.Dialogue.Visible == true then
                plr.PlayerGui.Main.Dialogue.Visible = false
            end
            EquipWeapon(b2.Name)
            plr.Character:FindFirstChild(b2.Name).EatRemote:InvokeServer("Drop")
        end
    end
end
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local replicated = ReplicatedStorage
function UpdStFruit()
    for _, item in next, plr.Backpack:GetChildren() do
        local StoreFruit = item:FindFirstChild("EatRemote", true)
        if StoreFruit then
            local fruitName = item:GetAttribute("OriginalName") or item.Name
            replicated.Remotes.CommF_:InvokeServer("StoreFruit", fruitName, item)
        end
    end
end
GetConnectionEnemies = function(a)
    for _, v in pairs(ReplicatedStorage:GetChildren()) do
        if v:IsA("Model") 
        and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) 
        and v:FindFirstChild("Humanoid") 
        and v.Humanoid.Health > 0 then
            return v
        end
    end
    local enemiesFolder = game.Workspace:FindFirstChild("Enemies")
    if enemiesFolder then
        for _, v in pairs(enemiesFolder:GetChildren()) do
            if v:IsA("Model") 
            and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) 
            and v:FindFirstChild("Humanoid") 
            and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
end
local Attack = {}
Attack.__index = Attack
Attack.Alive = function(model)
    if not model then 
        return 
    end
    local Humanoid = model:FindFirstChild("Humanoid")
    return Humanoid and Humanoid.Health > 0
end
Attack.Kill = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame)
        end        
        PosMon = model:GetAttribute("Locked").Position
        BringEnemy()        
        EquipWeapon(getgenv().SelectWeapon)
        local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local ToolTip = Equipped and Equipped.ToolTip
        if ToolTip == "Blox Fruit" then
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(0, math.rad(90), 0))
        else
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0) * CFrame.Angles(0, math.rad(180), 0))
        end
        if RandomCFrame then
            wait(0.5); topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            wait(0.5); topos(model.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
            wait(0.5); topos(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
            wait(0.5); topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            wait(0.5); topos(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
        end
    end
end
Attack.Kill2 = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame)
        end
        model.HumanoidRootPart.CFrame = model:GetAttribute("Locked")
        EquipWeapon(getgenv().SelectWeapon)
        local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local ToolTip = Equipped.ToolTip
        if ToolTip == "Blox Fruit" then
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(0, math.rad(90), 0))
        else
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 8) * CFrame.Angles(0, math.rad(180), 0))
        end
        if RandomCFrame then
            wait(0.1)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            wait(0.1)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
            wait(0.1)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
            wait(0.1)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            wait(0.1)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
        end
    end
end
Attack.KillSea = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame)
        end
        EquipWeapon(getgenv().SelectWeapon)
        local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local ToolTip = Equipped.ToolTip
        if ToolTip == "Blox Fruit" then
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(0, math.rad(90), 0))
        else
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 50, 8))
            wait(0.85)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 400, 0))
            wait(1)
        end
    end
end
Attack.Mas = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame)
        end
        PosMon = model:GetAttribute("Locked").Position
        BringEnemy()              
        if model.Humanoid.Health <= HealthM then
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
            Useskills("Blox Fruit", "Z")
            Useskills("Blox Fruit", "X")
            Useskills("Blox Fruit", "C")
        else
            weaponSc("Melee")
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        end
    end
end
Attack.Masgun = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame)
        end
        PosMon = model:GetAttribute("Locked").Position
        BringEnemy()
        if model.Humanoid.Health <= HealthM then
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 35, 8))
            Useskills("Gun", "Z")
            Useskills("Gun", "X")
        else
            weaponSc("Melee")
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        end
    end
end
Attack.Sword = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame)
        end
        PosMon = model:GetAttribute("Locked").Position
        BringEnemy()
        weaponSc("Sword")
        topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        if RandomCFrame then
            wait(0.1)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            wait(0.1)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
            wait(0.1)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
            wait(0.1)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            wait(0.1)
            topos(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
        end
    end
end
local vim1 = game:GetService("VirtualInputManager")
Useskills = function(weapon, skill)
    if weapon == "Melee" then
        weaponSc("Melee")
        if skill == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif skill == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        elseif skill == "C" then
            vim1:SendKeyEvent(true, "C", false, game)
            vim1:SendKeyEvent(false, "C", false, game)
        end
    elseif weapon == "Sword" then
        weaponSc("Sword")
        if skill == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif skill == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        end
    elseif weapon == "Blox Fruit" then
        weaponSc("Blox Fruit")
        if skill == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif skill == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        elseif skill == "C" then
            vim1:SendKeyEvent(true, "C", false, game)
            vim1:SendKeyEvent(false, "C", false, game)
        elseif skill == "V" then
            vim1:SendKeyEvent(true, "V", false, game)
            vim1:SendKeyEvent(false, "V", false, game)
        end
    elseif weapon == "Gun" then
        weaponSc("Gun")
        if skill == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif skill == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        end
    end
    if weapon == "nil" and skill == "Y" then
        vim1:SendKeyEvent(true, "Y", false, game)
        vim1:SendKeyEvent(false, "Y", false, game)
    end
end
local gg  = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args   = {...}
    if tostring(method) == "FireServer" then
        if tostring(args[1]) == "RemoteEvent" then
            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                if (getgenv().AutoFarmMasteryFruit) or (getgenv().AutoFarmMasteryGun) or (getgenv().AutoDefendVolcano) or (getgenv().AutoAttackLeviathan) or (getgenv().AimMethod and (ABmethod == "Select Player" or ABmethod == "Target nearest Player")) and MousePos then
                    args[2] = MousePos
                    return old(unpack(args))
                end
            end
        end
    end
    return old(...)
end)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/viplam087-png/Hjj/main/LibraryRedz.lua"))()
local Window = Library:MakeWindow({
  Title = "Hiru Hub : Blox Fruits",
  SubTitle = "by Kiddo",
  SaveFolder = "Hiru Hub | Blox Fruits.lua"
})
local Discord = Window:MakeTab({
  Title = "Tab Discord",
  Icon = "Info"
})
local Shop = Window:MakeTab({
  Title = "Tab Shop",
  Icon = "rbxassetid://6031265976"
})
local Status = Window:MakeTab({
  Title = "Tab Status And Server",
  Icon = "rbxassetid://7040410130"
})
local LocalPlayer = Window:MakeTab({
  Title = "Tab Local Player",
  Icon = "rbxassetid://13075651575"
})
local Setting = Window:MakeTab({
  Title = "Setting Farm",
  Icon = "rbxassetid://7734053495"
})
local Farm = Window:MakeTab({
  Title = "Tab Farming",
  Icon = "rbxassetid://7733960981"
})
local Stack = Window:MakeTab({
  Title = "Tab Stack Farm",
  Icon = "rbxassetid://13075622619"
})
local Other = Window:MakeTab({
  Title = "Tab Farming Other",
  Icon = "rbxassetid://10723405360"
})
local FruitRaid = Window:MakeTab({
  Title = "Tab Fruit and Raid",
  Icon = "rbxassetid://11155986081"
})
local Event = Window:MakeTab({
  Title = "Tab Sea Event",
  Icon = "rbxassetid://10709783577"
})
local Race = Window:MakeTab({
  Title = "Tab Upgrade Race",
  Icon = "rbxassetid://11162889532"
})
local Get = Window:MakeTab({
  Title = "Tab Get\nand Upgrade Items",
  Icon = "rbxassetid://11156061121"
})
local Volcano = Window:MakeTab({
  Title = "Tab Volcano Event",
  Icon = "tent"
})
local ESP = Window:MakeTab({
  Title = "Tab ESP",
  Icon = "rbxassetid://11155851001"
})
local Player = Window:MakeTab({
  Title = "Tab PVP",
  Icon = "rbxassetid://7251993295"
})
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
ScreenGui.Name = "ImageButton"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ImageButton.Parent = ScreenGui
ImageButton.Active = true
ImageButton.AutoButtonColor = true
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0, 20, 0.1, -6)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.ZIndex = 10
ImageButton.Image = "rbxassetid://91921394662978"
ImageButton.MouseButton1Click:Connect(function()
    pcall(function()
        if Window and Window.Minimize then
            Window:Minimize()
        end
    end)
end)
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ImageButton
UIStroke.Color = Color3.fromRGB(139, 0, 0)
UIStroke.Thickness = 1.5
UIStroke.Parent = ImageButton
Discord:AddDiscordInvite({
    Name = "Hiru Hub",
    Description = "Join Our Discord For Update Notifications",
    Logo = "rbxassetid://98474018544837",
    Invite = "https://discord.gg/cEmDhtEv"
})
Discord:AddDiscordInvite({
    Name = "Xester Hub",
    Description = "Discord Server Dev Infinity Script Dev Team Hiru Hub!",
    Logo = "rbxassetid://121207298510000",
    Invite = "https://discord.gg/infinityscript"
})
local Codes = {
    "WildDares",
    "BossBuild",
    "GetPranked",
    "Sub2OfficialNoobie",
    "Sub2Daigrock",
    "Sub2NoobMaster123",
    "Bluxxy",
    "JCWK",
    "Enyu_is_Pro",
    "Sub2Fer999",
    "kittgaming",
    "TheGreatAce",
    "StrawHatMaine",
    "TantaiGaming",
    "Axiore",
    "SUB2GAMERROBOT_EXP1",
    "MagicBus",
    "StarcodeHEO",
    "Sub2CaptainMaui",
    "FIGHT4FRUIT",
    "EARN_FRUITS",
}
Shop:AddButton({
    Name = "Redeem Code",
    Callback = function()
        function RedeemCode(Value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Value)
        end        
        for i, v in pairs(Codes) do
            RedeemCode(v)
        end
    end
})
Shop:AddButton({
    Name = "Teleport Old World",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})
Shop:AddButton({
    Name = "Teleport New World",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})
Shop:AddButton({
    Name = "Teleport Third Sea",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})
Shop:AddSection("Fighting Shop")
Shop:AddButton({
    Name = "Black Leg",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
})
Shop:AddButton({
    Name = "Fishman Karate",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end
})
Shop:AddButton({
    Name = "Electro",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end
})
Shop:AddButton({
    Name = "Dragon Breath",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    end
})
Shop:AddButton({
    Name = "SuperHuman",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end
})
Shop:AddButton({
    Name = "Death Step",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end
})
Shop:AddButton({
    Name = "Sharkman Karate",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
})
Shop:AddButton({
    Name = "Electric Claw",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end
})
Shop:AddButton({
    Name = "Dragon Talon",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end
})
Shop:AddButton({
    Name = "God Human",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end
})
Shop:AddButton({
    Name = "Sanguine Art",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
})
Shop:AddSection("Sword")
Shop:AddButton({
    Name = "Cutlass [ 1,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
    end
})
Shop:AddButton({
    Name = "Katana [ 1,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
    end
})
Shop:AddButton({
    Name = "Iron Mace [ 25,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
    end
})
Shop:AddButton({
    Name = "Dual Katana [ 12,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
    end
})
Shop:AddButton({
    Name = "Triple Katana [ 60,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
    end
})
Shop:AddButton({
    Name = "Pipe [ 100,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
    end
})
Shop:AddButton({
    Name = "Dual-Headed Blade [ 400,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
    end
})
Shop:AddButton({
    Name = "Bisento [ 1,200,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
    end
})
Shop:AddButton({
    Name = "Soul Cane [ 750,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
    end
})
Shop:AddButton({
    Name = "Pole v.2 [ 5,000 Fragments ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ThunderGodTalk")
    end
})
Shop:AddSection("Gun")
Shop:AddButton({
    Name = "Slingshot [ 5,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
    end
})
Shop:AddButton({
    Name = "Musket [ 8,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket")
    end
})
Shop:AddButton({
    Name = "Flintlock [ 10,500 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
    end
})
Shop:AddButton({
    Name = "Refined Slingshot [ 30,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
    end
})
Shop:AddButton({
    Name = "Refined Flintlock [ 65,000 Beli ]",
    Callback = function()
        local args = {
            [1] = "BuyItem",
            [2] = "Refined Flintlock"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
Shop:AddButton({
    Name = "Cannon [ 100,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
    end
})
Shop:AddButton({
    Name = "Kabucha [ 1,500 Fragments]",
    Callback = function()
        local Remote = game:GetService("ReplicatedStorage").Remotes.CommF_
        Remote:InvokeServer("BlackbeardReward", "Slingshot", "1")
        Remote:InvokeServer("BlackbeardReward", "Slingshot", "2")
    end
})
Shop:AddButton({
    Name = "Bizarre Rifle [ 250 Ectoplasm ]",
    Callback = function()
        local Remote = game:GetService("ReplicatedStorage").Remotes.CommF_
        local args = { "Ectoplasm", "Buy", 1 }
        Remote:InvokeServer(unpack(args))
        Remote:InvokeServer(unpack(args))
    end
})
Shop:AddSection("Abilities Shop")
Shop:AddButton({
    Name = "Skyjump [ $10,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
    end
})
Shop:AddButton({
    Name = "Buso Haki [ $25,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
    end
})
Shop:AddButton({
    Name = "Observation haki [ $750,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
    end
})
Shop:AddButton({
    Name = "Soru [ $100,000 Beli ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
    end
})
Shop:AddSection("Misc Shop")
Shop:AddButton({
    Name = "Buy Refund Stat (2500F)",
    Callback = function()
        local Remote = game:GetService("ReplicatedStorage").Remotes.CommF_
        Remote:InvokeServer("BlackbeardReward", "Refund", "1")
        Remote:InvokeServer("BlackbeardReward", "Refund", "2")
    end
})
Shop:AddButton({
    Name = "Buy Reroll Race (3000F)",
    Callback = function()
        local Remote = game:GetService("ReplicatedStorage").Remotes.CommF_
        Remote:InvokeServer("BlackbeardReward", "Reroll", "1")
        Remote:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})
Shop:AddButton({
    Name = "Buy Draco",
    Callback = function()
        topos(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        local targetPosition = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        repeat wait()
        until (character.HumanoidRootPart.Position - targetPosition).Magnitude < 1
        local args = {
            [1] = {
                ["NPC"] = "Dragon Wizard",
                ["Command"] = "DragonRace"
            }
        }
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
    end
})
Shop:AddButton({
    Name = "Buy Ghoul Race",
    Callback = function()
        local args = {
            [1] = "Ectoplasm",
            [2] = "Change",
            [3] = 4
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
Shop:AddButton({
    Name = "Buy Cyborg Race (2500F)",
    Callback = function()
        local args = {
            [1] = "CyborgTrainer",
            [2] = "Buy"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
local Time = Status:AddParagraph({
    Title = "Time Zone",
    Desc = ""
})
function UpdateOS()
    date = os.date("*t")
    hour = (date.hour) % 24
    ampm = hour < 12 and "AM" or "PM"
    timezone = string.format("%02i:%02i:%02i %s",((hour - 1) % 12) + 1,date.min,date.sec,ampm)
    datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
    LocalizationService = game:GetService("LocalizationService")
    Players = game:GetService("Players")
    player = Players.LocalPlayer
    name = player.Name
    result, code = pcall(function()
        return LocalizationService:GetCountryRegionForPlayerAsync(player)
    end)
    Time:SetDesc(datetime .. " - " .. timezone .. " [ " .. code .. " ]")
end
spawn(function()
    while wait() do
        UpdateOS()
        game:GetService("RunService").RenderStepped:Wait()
    end
end)
local Timmessss = Status:AddParagraph({
    Title = "Time",
    Desc = ""
})
function UpdateTime()
    GameTime = math.floor(workspace.DistributedGameTime + 0.5)
    Hour = math.floor(GameTime / (60 ^ 2)) % 24
    Minute = math.floor(GameTime / 60) % 60
    Second = GameTime % 60
    Timmessss:SetDesc(Hour .. " Hour (h) " ..Minute .. " Minute (m) " ..Second .. " Second (s) ")
end
spawn(function()
    while wait() do
        UpdateTime()
        wait()
    end
end)
local Miragecheck = Status:AddParagraph({
    Title = "Mirage Island",
    Desc = "Status: "
})
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
                Miragecheck:SetDesc('✅️')
            else
                Miragecheck:SetDesc('❌️')
            end
        end
    end)
end)
local Kitsunecheck = Status:AddParagraph({
    Title = "Kitsune Island",
    Desc = "Status: "
})
spawn(function()
    pcall(function()
        while wait() do
            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                Kitsunecheck:SetDesc('✅️')
            else
                Kitsunecheck:SetDesc('❌️')
            end
        end
    end)
end)
local CPrehistoriccheck = Status:AddParagraph({
    Title = "Prehistoric Island",
    Desc = "Status: "
})
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Prehistoric Island') then
                CPrehistoriccheck:SetDesc('✅️')
            else
                CPrehistoriccheck:SetDesc('❌️')
            end
        end
    end)
end)
local FrozenIsland = Status:AddParagraph({
    Title = "Frozen Dimension",
    Desc = "Status: "
})
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                FrozenIsland:SetDesc('✅️')
            else
                FrozenIsland:SetDesc('❌️')
            end
        end
    end)
end)
local MobCakePrince = Status:AddParagraph({
    Title = "Dimension Killed",
    Desc = ""
})
spawn(function()
    while wait() do
        pcall(function()
            local response = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
            local len = string.len(response)
            if len == 88 then
                MobCakePrince:SetDesc("Kill : " .. string.sub(response, 39, 41))
            elseif len == 87 then
                MobCakePrince:SetDesc("Kill : " .. string.sub(response, 39, 40))
            elseif len == 86 then
                MobCakePrince:SetDesc("Kill : " .. string.sub(response, 39, 39) .. " ")
            else
                MobCakePrince:SetDesc("Cake Prince : ✅️")
            end
        end)
    end
end)
local TyrantStatus = Status:AddParagraph({
    Title = "Tyrant of the Skies",
    Desc = "Status: "
})
spawn(function()
    pcall(function()
        while wait() do
            if game:GetService("Workspace").Enemies:FindFirstChild("Tyrant of the Skies") then
                TyrantStatus:SetDesc("Status : ✅️")
            else
                TyrantStatus:SetDesc("Status : ❌️")
            end
        end
    end)
end)
local CheckRip = Status:AddParagraph({
    Title = "Rip_Indra",
    Desc = "Status: "
})
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") 
            or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                CheckRip:SetDesc("Status : ✅️")
            else
                CheckRip:SetDesc("Status : ❌️")
            end
        end)
    end
end)
local CheckDoughKing = Status:AddParagraph({
    Title = "Dough King",
    Desc = "Status: "
})
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") 
            or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                CheckDoughKing:SetDesc("Status : ✅️")
            else
                CheckDoughKing:SetDesc("Status : ❌️")
            end
        end)
    end
end)
local EliteHunter = Status:AddParagraph({
    Title = "Elite Hunter",
    Desc = "Status: "
})
spawn(function()
    while wait() do
        pcall(function()
            local rs = game:GetService("ReplicatedStorage")
            local ws = game:GetService("Workspace").Enemies
            local progress = rs.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
            if rs:FindFirstChild("Diablo") or rs:FindFirstChild("Deandre") or rs:FindFirstChild("Urban")
            or ws:FindFirstChild("Diablo") or ws:FindFirstChild("Deandre") or ws:FindFirstChild("Urban") then
                EliteHunter:SetDesc("Status : ✅️ | Killed: " .. progress)
            else
                EliteHunter:SetDesc("Status : ❌️ | Killed: " .. progress)
            end
        end)
    end
end)
local Pullever = Status:AddParagraph({
    Title = "Pull Lever",
    Desc = "Status: "
})
spawn(function()
    while wait() do
        pcall(function()
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                Pullever:SetDesc("✅")
            else
                Pullever:SetDesc("❌")
            end
        end)
    end
end)
local FM = Status:AddParagraph({
    Title = "Full Moon",
    Desc = ""
})
spawn(function()
    while wait() do
        pcall(function()
            local moonId = game:GetService("Lighting").Sky.MoonTextureId
            if moonId == "http://www.roblox.com/asset/?id=9709149431" then
                FM:SetDesc("Moon: 5/5")
            elseif moonId == "http://www.roblox.com/asset/?id=9709149052" then
                FM:SetDesc("Moon: 4/5")
            elseif moonId == "http://www.roblox.com/asset/?id=9709143733" then
                FM:SetDesc("Moon: 3/5")
            elseif moonId == "http://www.roblox.com/asset/?id=9709150401" then
                FM:SetDesc("Moon: 2/5")
            elseif moonId == "http://www.roblox.com/asset/?id=9709149680" then
                FM:SetDesc("Moon: 1/5")
            else
                FM:SetDesc("Moon: 0/5")
            end
        end)
    end
end)
local LegendarySword = Status:AddParagraph({
    Title = "Legendary Sword",
    Desc = "Status: "
})
spawn(function()
    pcall(function()
        while wait() do
            local rs = game:GetService("ReplicatedStorage").Remotes.CommF_   
            if rs:InvokeServer("LegendarySwordDealer", "1") then
                LegendarySword:SetDesc("Shisui")
            elseif rs:InvokeServer("LegendarySwordDealer", "2") then
                LegendarySword:SetDesc("Wando")
            elseif rs:InvokeServer("LegendarySwordDealer", "3") then
                LegendarySword:SetDesc("Saddi")
            else
                LegendarySword:SetDesc("Not Found Legend Swords")
            end
        end
    end)
end)
local Bone = Status:AddParagraph({
    Title = "Bone",
    Desc = ""
})
spawn(function()
    pcall(function()
        while wait() do
            local bones = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
            Bone:SetDesc("You Have : " .. tostring(bones) .. " Bones")
        end
    end)
end)
Status:AddTextBox({
    Name = "Input Job Id",
    Placeholder = "Job ID",
    ClearOnFocus = true,
    Callback = function(Value)
        getgenv().Job = Value
    end
})
Status:AddToggle({
    Name = "Spam Join",
    Default = false,
    Callback = function(Value)
        getgenv().Join = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().Join then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,getgenv().Job,game.Players.LocalPlayer)
        end
    end
end)
Status:AddButton({
    Name = "Join Server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,getgenv().Job,game.Players.LocalPlayer)
    end
})
Status:AddButton({
    Name = "Copy JobId",
    Callback = function()
        setclipboard(tostring(game.JobId))
    end
})
Status:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
    end
})
Status:AddButton({
    Name = "Hop Server",
    Callback = function()
        Hop()
    end
})
Status:AddButton({
    Name = "Hop Server Less People",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local plr = Players.LocalPlayer
        local Api = "https://games.roblox.com/v1/games/"
        local _place = game.PlaceId
        local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=100"
        local function ListServers(cursor)
            local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
            return Http:JSONDecode(Raw)
        end
        local Server, Next
        repeat
            local Servers = ListServers(Next)
            Server = Servers.data[1]
            Next = Servers.nextPageCursor
        until Server
        TPS:TeleportToPlaceInstance(_place, Server.id, plr)
    end
})
Status:AddButton({
    Name = "Hop Server Vip [No One Left]",
    Callback = function()
        local md5, hmac, base64 = {}, {}, {}
        do
            local T = {
                0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
                0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
                0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
                0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
                0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
                0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
                0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
                0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
                0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
                0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
                0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05,
                0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
                0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
                0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
                0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
                0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391,
            }
            local function add(a, b)
                local lsw = bit32.band(a, 0xFFFF) + bit32.band(b, 0xFFFF)
                local msw = bit32.rshift(a, 16) + bit32.rshift(b, 16) + bit32.rshift(lsw, 16)
                return bit32.bor(bit32.lshift(msw, 16), bit32.band(lsw, 0xFFFF))
            end
            local function rol(x, n)
                return bit32.bor(bit32.lshift(x, n), bit32.rshift(x, 32 - n))
            end
            local function F(x, y, z) return bit32.bor(bit32.band(x, y), bit32.band(bit32.bnot(x), z)) end
            local function G(x, y, z) return bit32.bor(bit32.band(x, z), bit32.band(y, bit32.bnot(z))) end
            local function H(x, y, z) return bit32.bxor(x, bit32.bxor(y, z)) end
            local function I(x, y, z) return bit32.bxor(y, bit32.bor(x, bit32.bnot(z))) end
            function md5.sum(message)
                local a, b, c, d = 0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476
                local message_len = #message
                local padded_message = message .. "\128"
                while #padded_message % 64 ~= 56 do
                    padded_message = padded_message .. "\0"
                end
                local len_bytes = ""
                local len_bits = message_len * 8
                for i = 0, 7 do
                    len_bytes = len_bytes .. string.char(bit32.band(bit32.rshift(len_bits, i * 8), 0xFF))
                end
                padded_message = padded_message .. len_bytes
                for i = 1, #padded_message, 64 do
                    local chunk = padded_message:sub(i, i + 63)
                    local X = {}
                    for j = 0, 15 do
                        local b1, b2, b3, b4 = chunk:byte(j * 4 + 1, j * 4 + 4)
                        X[j] = bit32.bor(b1, bit32.lshift(b2, 8), bit32.lshift(b3, 16), bit32.lshift(b4, 24))
                    end
                    local aa, bb, cc, dd = a, b, c, d
                    local s = {7, 12, 17, 22, 5, 9, 14, 20, 4, 11, 16, 23, 6, 10, 15, 21}
                    for j = 0, 63 do
                        local f, k, shift_index
                        if j < 16 then
                            f, k, shift_index = F(b, c, d), j, j % 4
                        elseif j < 32 then
                            f, k, shift_index = G(b, c, d), (1 + 5 * j) % 16, 4 + (j % 4)
                        elseif j < 48 then
                            f, k, shift_index = H(b, c, d), (5 + 3 * j) % 16, 8 + (j % 4)
                        else
                            f, k, shift_index = I(b, c, d), (7 * j) % 16, 12 + (j % 4)
                        end
                        local temp = add(a, f)
                        temp = add(temp, X[k])
                        temp = add(temp, T[j + 1])
                        temp = rol(temp, s[shift_index + 1])
                        local new_b = add(b, temp)
                        a, b, c, d = d, new_b, b, c
                    end
                    a, b, c, d = add(a, aa), add(b, bb), add(c, cc), add(d, dd)
                end
                local function to_le_hex(n)
                    local s = ""
                    for i = 0, 3 do
                        s = s .. string.char(bit32.band(bit32.rshift(n, i * 8), 0xFF))
                    end
                    return s
                end
                return to_le_hex(a) .. to_le_hex(b) .. to_le_hex(c) .. to_le_hex(d)
            end
        end
        do
            function hmac.new(key, msg, hash_func)
                if #key > 64 then key = hash_func(key) end
                local o_key_pad, i_key_pad = "", ""
                for i = 1, 64 do
                    local byte = (i <= #key and string.byte(key, i)) or 0
                    o_key_pad = o_key_pad .. string.char(bit32.bxor(byte, 0x5C))
                    i_key_pad = i_key_pad .. string.char(bit32.bxor(byte, 0x36))
                end
                return hash_func(o_key_pad .. hash_func(i_key_pad .. msg))
            end
        end
        do
            local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
            function base64.encode(data)
                return (
                    (data:gsub(".", function(x)
                        local r, b_val = "", x:byte()
                        for i = 8, 1, -1 do
                            r = r .. (b_val % 2 ^ i - b_val % 2 ^ (i - 1) > 0 and "1" or "0")
                        end
                        return r
                    end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
                        if #x < 6 then return "" end
                        local c = 0
                        for i = 1, 6 do
                            c = c + (x:sub(i, i) == "1" and 2 ^ (6 - i) or 0)
                        end
                        return b:sub(c + 1, c + 1)
                    end) .. ({ "", "==", "=" })[#data % 3 + 1])
            end
        end
        local function GenerateReservedServerCode(placeId)
            local uuid = {}
            for i = 1, 16 do
                uuid[i] = math.random(0, 255)
            end
            uuid[7] = bit32.bor(bit32.band(uuid[7], 0x0F), 0x40)
            uuid[9] = bit32.bor(bit32.band(uuid[9], 0x3F), 0x80)
            local firstBytes = ""
            for i = 1, 16 do
                firstBytes = firstBytes .. string.char(uuid[i])
            end
            local gameCode = string.format("%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",table.unpack(uuid))
            local placeIdBytes, pIdRec = "", placeId
            for _ = 1, 8 do
                placeIdBytes = placeIdBytes .. string.char(pIdRec % 256)
                pIdRec = math.floor(pIdRec / 256)
            end
            local content = firstBytes .. placeIdBytes
            local SECRET_KEY = "e4Yn8ckbCJtw2sv7qmbg"
            local signature = hmac.new(SECRET_KEY, content, md5.sum)
            local accessCodeBytes = signature .. content
            local accessCode = base64.encode(accessCodeBytes):gsub("+", "-"):gsub("/", "_")
            local padding = 0
            accessCode, _ = accessCode:gsub("=", function()
                padding = padding + 1
                return ""
            end)
            accessCode = accessCode .. tostring(padding)
            return accessCode, gameCode
        end
        local function CanRunFunc()
            return #game.Players:GetPlayers() > 1
        end
        task.delay(5, function()
            if CanRunFunc() then
                local accessCode = GenerateReservedServerCode(game.PlaceId)
                game.RobloxReplicatedStorage.ContactListIrisInviteTeleport:FireServer(game.PlaceId, "", accessCode)
            end
        end)
    end
})
LocalPlayer:AddButton({
    Name = "Stop Tween",
    Callback = function()
        StopTween()
    end
})
LocalPlayer:AddButton({
    Name = "Open Devil Fruit Shop",
    Callback = function()
        local a = game
        local b = a.Players
        local c = b.LocalPlayer
        local d = c.PlayerGui
        local e = d:WaitForChild("Main")
        local f = e:WaitForChild("FruitShopAndDealer")
        local g = f:WaitForChild("Controller")
        require(g):Open()
    end
})
LocalPlayer:AddButton({
    Name = "Open Title",
    Callback = function()
        local args = {
            [1] = "getTitles"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        game.Players.LocalPlayer.PlayerGui.Main.Titles.Visible = true
    end
})
LocalPlayer:AddButton({
    Name = "Open Awakening",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
    end
})
LocalPlayer:AddButton({
    Name = "Boost FPS",
    Callback = function()
        FPSBooster()
    end
})
LocalPlayer:AddDropdown({
    Name = "Select Haki State",
    Options = {"State 0", "State 1", "State 2", "State 3", "State 4", "State 5"},
    Callback = function(Value)
        getgenv().SelectStateHaki = Value
    end
})
LocalPlayer:AddButton({
    Name = "Change Buso Haki State",
    Callback = function()
        if getgenv().SelectStateHaki == "State 0" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 0)
        elseif getgenv().SelectStateHaki == "State 1" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 1)
        elseif getgenv().SelectStateHaki == "State 2" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 2)
        elseif getgenv().SelectStateHaki == "State 3" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 3)
        elseif getgenv().SelectStateHaki == "State 4" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 4)
        elseif getgenv().SelectStateHaki == "State 5" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 5)
        end
    end
})
LocalPlayer:AddDropdown({
    Name = "Select Stats",
    Options = {"Melee", "Defense", "Sword", "Gun", "Fruit"},
    Callback = function(Value)
        getgenv().StatsMode = Value
    end
})
spawn(function()
    while wait() do
        wait()
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("Data") and player.Data:FindFirstChild("Points") then
            if player.Data.Points.Value >= 1 and getgenv().AutoStats then
                local statTypes = {
                    Melee = "Melee",
                    Defense = "Defense",
                    Sword = "Sword",
                    Gun = "Gun",
                    Fruit = "Demon Fruit"
                }
                local selectedStat = statTypes[getgenv().StatsMode]
                if selectedStat then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint",selectedStat,PointStats)
                end
            end
        end
    end
end)
LocalPlayer:AddToggle({
    Name = "Auto Stats",
    Default = false,
    Callback = function(Value)
        getgenv().AutoStats = Value
    end
})
LocalPlayer:AddToggle({
    Name = "Beautiful Graphics",
    Default = false,
    Callback = function(Value)
        local Lighting = game:GetService("Lighting")
        local effectsToRemove = {
            "BloomEffect_Graphic",
            "ColorCorrectionEffect1_Graphic",
            "ColorCorrectionEffect2_Graphic",
            "ColorCorrectionEffect3_Graphic",
            "SunRaysEffect_Graphic",
            "DepthOfFieldEffect_Graphic"
        }
        for _, v in pairs(effectsToRemove) do
            local obj = Lighting:FindFirstChild(v)
            if obj then
                obj:Destroy()
            end
        end
        if Value then
            getgenv().mode = "Autumn"
            Lighting.Ambient = Color3.fromRGB(33, 33, 33)
            Lighting.Brightness = 0.3
            Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
            Lighting.ColorShift_Top = Color3.fromRGB(255, 247, 237)
            Lighting.EnvironmentDiffuseScale = 0.105
            Lighting.EnvironmentSpecularScale = 0.522
            Lighting.GlobalShadows = true
            Lighting.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
            Lighting.ShadowSoftness = 0.04
            Lighting.GeographicLatitude = -15.525
            Lighting.ExposureCompensation = 0.75
            local bloom = Instance.new("BloomEffect")
            bloom.Name = "BloomEffect_Graphic"
            bloom.Intensity = 0.04
            bloom.Size = 1900
            bloom.Threshold = 0.915
            bloom.Parent = Lighting
            local cc1 = Instance.new("ColorCorrectionEffect")
            cc1.Name = "ColorCorrectionEffect1_Graphic"
            cc1.Brightness = 0.176
            cc1.Contrast = 0.39
            cc1.Saturation = 0.2
            cc1.Enabled = true
            cc1.TintColor = getgenv().mode == "Summer"
                and Color3.fromRGB(255, 220, 148)
                or Color3.fromRGB(242, 193, 79)
            cc1.Parent = Lighting
            local dof = Instance.new("DepthOfFieldEffect")
            dof.Name = "DepthOfFieldEffect_Graphic"
            dof.Enabled = true
            dof.FarIntensity = 0.077
            dof.FocusDistance = 21.54
            dof.InFocusRadius = 20.77
            dof.NearIntensity = 0.277
            dof.Parent = Lighting
            local cc2 = Instance.new("ColorCorrectionEffect")
            cc2.Name = "ColorCorrectionEffect2_Graphic"
            cc2.Brightness = 0
            cc2.Contrast = -0.07
            cc2.Saturation = 0
            cc2.TintColor = Color3.fromRGB(255, 247, 239)
            cc2.Parent = Lighting
            local cc3 = Instance.new("ColorCorrectionEffect")
            cc3.Name = "ColorCorrectionEffect3_Graphic"
            cc3.Brightness = 0.2
            cc3.Contrast = 0.45
            cc3.Saturation = -0.1
            cc3.TintColor = Color3.fromRGB(255, 255, 255)
            cc3.Parent = Lighting
            local sun = Instance.new("SunRaysEffect")
            sun.Name = "SunRaysEffect_Graphic"
            sun.Enabled = false
            sun.Intensity = 0.01
            sun.Spread = 0.146
            sun.Parent = Lighting
        else
            Lighting.Ambient = Color3.fromRGB(170, 170, 170)
            Lighting.Brightness = 2
            Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
            Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
            Lighting.EnvironmentDiffuseScale = 0.105
            Lighting.EnvironmentSpecularScale = 0.522
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
            Lighting.ShadowSoftness = 0
            Lighting.GeographicLatitude = 66
            Lighting.ExposureCompensation = 0.2
        end
    end
})
LocalPlayer:AddToggle({
    Name = "White Screen",
    Default = false,
    Callback = function(Value)
        getgenv().WhiteScreen = Value
        if Value then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end
})
LocalPlayer:AddToggle({
    Name = "Black Screen",
    Default = false,
    Callback = function(Value)
        getgenv().StartBlackScreen = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().StartBlackScreen then
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(500, 0, 500, 500)
        else
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(1, 0, 500, 500)
        end
    end
end)
local StarterGui = game:GetService("StarterGui")
LocalPlayer:AddToggle({
    Name = "Hide Chat",
    Default = false,
    Callback = function(Value)
        local HideChat = Value
        if HideChat then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
        else
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        end
    end
})
local StarterGui = game:GetService("StarterGui")
LocalPlayer:AddToggle({
    Name = "Hide LeaderBoard",
    Default = false,
    Callback = function(Value)
        if Value then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
        else
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
        end
    end
})
LocalPlayer:AddToggle({
    Name = "Hide Mob",
    Default = false,
    Callback = function(Value)
        getgenv().HideMob = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().HideMob then
            pcall(function()
                for _, v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.ClassName == "MeshPart" then
                        v.Transparency = 1
                    end
                end
                for _, v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.Name == "Head" then
                        v.Transparency = 1
                    end
                end
                for _, v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.ClassName == "Accessory" then
                        v.Handle.Transparency = 1
                    end
                end
                for _, v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.ClassName == "Decal" then
                        v.Transparency = 1
                    end
                end
            end)
        end
    end
end)
LocalPlayer:AddToggle({
    Name = "Remove Dame Text",
    Default = false,
    Callback = function(Value)
        getgenv().RemoveText = Value
        game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = not getgenv().RemoveText
    end
})
LocalPlayer:AddToggle({
    Name = "Remove Notification",
    Default = false,
    Callback = function(Value)
        getgenv().RemoveNotification = Value
        game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = not getgenv().RemoveNotification
    end
})
LocalPlayer:AddToggle({
    Name = "Auto Rejoin On Kick",
    Default = false,
    Callback = function(Value)
        getgenv().AutoRejoinKick = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoRejoinKick then
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                if child.Name == 'ErrorPrompt' and 
                   child:FindFirstChild('MessageArea') and 
                   child.MessageArea:FindFirstChild("ErrorFrame") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            end)
        end
    end
end)
if World1 then
    LocalPlayer:AddDropdown({
        Name = "Select Island",
        Default = false,
        Options = {
            "WindMill", "Marine", "Middle Town", "Jungle", "Pirate Village",
            "Desert", "Snow Island", "MarineFord", "Colosseum", "Sky Island 1",
            "Sky Island 2", "Sky Island 3", "Prison", "Magma Village",
            "Under Water Island", "Fountain City", "Shank Room", "Mob Island",
        },
        Callback = function(Value)
            getgenv().SelectIsland = Value
        end
    })
end
if World2 then
    LocalPlayer:AddDropdown({
        Name = "Select Island",
        Default = false,
        Options = {
            "The Cafe", "Frist Spot", "Dark Area", "Flamingo Mansion", "Flamingo Room",
            "Green Zone", "Factory", "Colossuim", "Zombie Island", "Two Snow Mountain",
            "Punk Hazard", "Cursed Ship", "Ice Castle", "Forgotten Island",
            "Ussop Island", "Mini Sky Island",
        },
        Callback = function(Value)
            getgenv().SelectIsland = Value
        end
    })
end
if World3 then
    LocalPlayer:AddDropdown({
        Name = "Select Island",
        Default = false,
        Options = {
            "Mansion", "Port Town", "Great Tree", "Castle On The Sea", "MiniSky",
            "Hydra Island", "Floating Turtle", "Haunted Castle", "Ice Cream Island",
            "Peanut Island", "Cake Island", "Cocoa Island", "Candy Island",
            "Tiki Outpost", "Submerged Island",
        },
        Callback = function(Value)
            getgenv().SelectIsland = Value
        end
    })
end
LocalPlayer:AddToggle({
    Name = "Teleport Island",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportIsland = Value
        if getgenv().TeleportIsland == true then
            repeat
                wait()
                if getgenv().SelectIsland == "WindMill" then
                    topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                elseif getgenv().SelectIsland == "Marine" then
                    topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                elseif getgenv().SelectIsland == "Middle Town" then
                    topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                elseif getgenv().SelectIsland == "Jungle" then
                    topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
                elseif getgenv().SelectIsland == "Pirate Village" then
                    topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
                elseif getgenv().SelectIsland == "Desert" then
                    topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                elseif getgenv().SelectIsland == "Snow Island" then
                    topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
                elseif getgenv().SelectIsland == "MarineFord" then
                    topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
                elseif getgenv().SelectIsland == "Colosseum" then
                    topos(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
                elseif getgenv().SelectIsland == "Sky Island 1" then
                    topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
                elseif getgenv().SelectIsland == "Sky Island 2" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
                elseif getgenv().SelectIsland == "Sky Island 3" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                elseif getgenv().SelectIsland == "Prison" then
                    topos(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                elseif getgenv().SelectIsland == "Magma Village" then
                    topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
                elseif getgenv().SelectIsland == "Under Water Island" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                elseif getgenv().SelectIsland == "Fountain City" then
                    topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                elseif getgenv().SelectIsland == "Shank Room" then
                    topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                elseif getgenv().SelectIsland == "Mob Island" then
                    topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                elseif getgenv().SelectIsland == "The Cafe" then
                    topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                elseif getgenv().SelectIsland == "Frist Spot" then
                    topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
                elseif getgenv().SelectIsland == "Dark Area" then
                    topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
                elseif getgenv().SelectIsland == "Flamingo Mansion" then
                    topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
                elseif getgenv().SelectIsland == "Flamingo Room" then
                    topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                elseif getgenv().SelectIsland == "Green Zone" then
                    topos(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
                elseif getgenv().SelectIsland == "Factory" then
                    topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
                elseif getgenv().SelectIsland == "Colossuim" then
                    topos(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
                elseif getgenv().SelectIsland == "Zombie Island" then
                    topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
                elseif getgenv().SelectIsland == "Two Snow Mountain" then
                    topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
                elseif getgenv().SelectIsland == "Punk Hazard" then
                    topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
                elseif getgenv().SelectIsland == "Cursed Ship" then
                    topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                elseif getgenv().SelectIsland == "Ice Castle" then
                    topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
                elseif getgenv().SelectIsland == "Forgotten Island" then
                    topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
                elseif getgenv().SelectIsland == "Ussop Island" then
                    topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                elseif getgenv().SelectIsland == "Mini Sky Island" then
                    topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
                elseif getgenv().SelectIsland == "Great Tree" then
                    topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
                elseif getgenv().SelectIsland == "Castle On The Sea" then
                    topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
                elseif getgenv().SelectIsland == "MiniSky" then
                    topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
                elseif getgenv().SelectIsland == "Port Town" then
                    topos(CFrame.new(-95, 11, 5455))
                elseif getgenv().SelectIsland == "Hydra Island" then
                    topos(CFrame.new(5433, 1062, 290))
                elseif getgenv().SelectIsland == "Floating Turtle" then
                    topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
                elseif getgenv().SelectIsland == "Mansion" then
                    topos(CFrame.new(-12551, 337, -7476))
                elseif getgenv().SelectIsland == "Haunted Castle" then
                    topos(CFrame.new(-9516, 142, 5537))
                elseif getgenv().SelectIsland == "Ice Cream Island" then
                    topos(CFrame.new(-874, 66, -10915))
                elseif getgenv().SelectIsland == "Peanut Island" then
                    topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
                elseif getgenv().SelectIsland == "Cake Island" then
                    topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                elseif getgenv().SelectIsland == "Cocoa Island" then
                    topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
                elseif getgenv().SelectIsland == "Candy Island" then
                    topos(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
                elseif getgenv().SelectIsland == "Tiki Outpost" then
                    topos(CFrame.new(-16101.1885, 12.8422165, 380.942291,0.194113985, 1.39194061e-08, -0.980978966,-9.82904691e-09, 1, 1.22443504e-08,0.980978966, 7.26528837e-09, 0.194113985))
                elseif getgenv().SelectIsland == "Submerged Island" then
                    topos(CFrame.new(-16269.7041, 25.2288494, 1373.65955,0.997390985, 1.47309942e-09, -0.0721890926,-4.00651912e-09, 0.99999994, -2.51183763e-09,0.0721890852, 5.75363091e-10, 0.997390926))
                    task.wait(2)
                    local args = {"TravelToSubmergedIsland"}
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer(unpack(args))
                end
            until not getgenv().TeleportIsland
        end
        StopTween(getgenv().TeleportIsland)
    end
})
if World1 then
    LocalPlayer:AddDropdown({
        Name = "Select NPC",
        Default = false,
        Options = {
            "Random Devil Fruit",
            "Blox Fruits Dealer",
            "Remove Devil Fruit",
            "Ability Teacher",
            "Dark Step",
            "Electro",
            "Fishman Karate"
        },
        Callback = function(Value)
            getgenv().SelectNPC = Value
        end
    })
end
if World2 then
    LocalPlayer:AddDropdown({
        Name = "Select NPC",
        Default = false,
        Options = {
            "Dargon Berath",
            "Mtsterious Man",
            "Mysterious Scientist",
            "Awakening Expert",
            "Nerd",
            "Bar Manager",
            "Blox Fruits Dealer",
            "Trevor",
            "Enhancement Editor",
            "Pirate Recruiter",
            "Marines Recruiter",
            "Chemist",
            "Cyborg",
            "Ghoul Mark",
            "Guashiem",
            "El Admin",
            "El Rodolfo",
            "Arowe"
        },
        Callback = function(Value)
            getgenv().SelectNPC = Value
        end
    })
end
if World3 then
    LocalPlayer:AddDropdown({
        Name = "Select NPC",
        Default = false,
        Options = {
            "Blox Fruits Dealer",
            "Remove Devil Fruit",
            "Horned Man",
            "Hungey Man",
            "Previous Hero",
            "Butler",
            "Lunoven",
            "Trevor",
            "Elite Hunter",
            "Player Hunter",
            "Uzoth"
        },
        Callback = function(Value)
            getgenv().SelectNPC = Value
        end
    })
end
LocalPlayer:AddToggle({
    Name = "Teleport NPC",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportNPC = Value
        if getgenv().TeleportNPC == true then
            repeat wait()
                if getgenv().SelectNPC == "Dargon Berath" then
                    topos(CFrame.new(703.372986, 186.985519, 654.522034))
                elseif getgenv().SelectNPC == "Mtsterious Man" then
                    topos(CFrame.new(-2574.43335, 1627.92371, -3739.35767))
                elseif getgenv().SelectNPC == "Mysterious Scientist" then
                    topos(CFrame.new(-6437.87793, 250.645355, -4498.92773))
                elseif getgenv().SelectNPC == "Awakening Expert" then
                    topos(CFrame.new(-408.098846, 16.0459061, 247.432846))
                elseif getgenv().SelectNPC == "Nerd" then
                    topos(CFrame.new(-401.783722, 73.0859299, 262.306702))
                elseif getgenv().SelectNPC == "Bar Manager" then
                    topos(CFrame.new(-385.84726, 73.0458984, 316.088806))
                elseif getgenv().SelectNPC == "Blox Fruits Dealer" then
                    topos(CFrame.new(-12511, 337, -7448))
                elseif getgenv().SelectNPC == "Trevor" then
                    topos(CFrame.new(-341.498322, 331.886444, 643.024963))
                elseif getgenv().SelectNPC == "Plokster" then
                    topos(CFrame.new(-1885.16016, 88.3838196, -1912.28723))
                elseif getgenv().SelectNPC == "Enhancement Editor" then
                    topos(CFrame.new(-346.820221, 72.9856339, 1194.36218))
                elseif getgenv().SelectNPC == "Pirate Recruiter" then
                    topos(CFrame.new(-428.072998, 72.9495239, 1445.32422))
                elseif getgenv().SelectNPC == "Marines Recruiter" then
                    topos(CFrame.new(-1349.77295, 72.9853363, -1045.12964))
                elseif getgenv().SelectNPC == "Chemist" then
                    topos(CFrame.new(-2777.45288, 72.9919434, -3572.25732))
                elseif getgenv().SelectNPC == "Ghoul Mark" then
                    topos(CFrame.new(635.172546, 125.976357, 33219.832))
                elseif getgenv().SelectNPC == "Cyborg" then
                    topos(CFrame.new(629.146851, 312.307373, -531.624146))
                elseif getgenv().SelectNPC == "Guashiem" then
                    topos(CFrame.new(937.953003, 181.083359, 33277.9297))
                elseif getgenv().SelectNPC == "El Admin" then
                    topos(CFrame.new(1322.80835, 126.345039, 33135.8789))
                elseif getgenv().SelectNPC == "El Rodolfo" then
                    topos(CFrame.new(941.228699, 40.4686775, 32778.9922))
                elseif getgenv().SelectNPC == "Arowe" then
                    topos(CFrame.new(-1994.51038, 125.519142, -72.2622986))
                elseif getgenv().SelectNPC == "Random Devil Fruit" then
                    topos(CFrame.new(-12491, 337, -7449))
                elseif getgenv().SelectNPC == "Remove Devil Fruit" then
                    topos(CFrame.new(-5571, 1089, -2661))
                elseif getgenv().SelectNPC == "Ability Teacher" then
                    topos(CFrame.new(-1057.67822, 9.65220833, 1799.49146))
                elseif getgenv().SelectNPC == "Dark Step" then
                    topos(CFrame.new(-987.873047, 13.7778397, 3989.4978))
                elseif getgenv().SelectNPC == "Electro" then
                    topos(CFrame.new(-5389.49561, 13.283, -2149.80151))
                elseif getgenv().SelectNPC == "Fishman Karate" then
                    topos(CFrame.new(61581.8047, 18.8965912, 987.832703))
                elseif getgenv().SelectNPC == "Horned Man" then
                    topos(CFrame.new(-11890, 931, -8760))
                elseif getgenv().SelectNPC == "Hungey Man" then
                    topos(CFrame.new(-10919, 624, -10268))
                elseif getgenv().SelectNPC == "Previous Hero" then
                    topos(CFrame.new(-10368, 332, -10128))
                elseif getgenv().SelectNPC == "Butler" then
                    topos(CFrame.new(-5125, 316, -3130))
                elseif getgenv().SelectNPC == "Lunoven" then
                    topos(CFrame.new(-5117, 316, -3093))
                elseif getgenv().SelectNPC == "Elite Hunter" then
                    topos(CFrame.new(-5420, 314, -2828))
                elseif getgenv().SelectNPC == "Player Hunter" then
                    topos(CFrame.new(-5559, 314, -2840))
                elseif getgenv().SelectNPC == "Uzoth" then
                    topos(CFrame.new(-9785, 852, 6667))
                end
            until not getgenv().TeleportNPC
        end
        StopTween(getgenv().TeleportNPC)
    end
})
Setting:AddDropdown({
    Name = "Select Weapon",
    Options = { "Melee", "Sword", "Blox Fruit" },
    Default = "Melee",
    Callback = function(Value)
        getgenv().SelectWP = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().SelectWP == "Melee" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == "Melee" then
                        getgenv().SelectWeapon = v.Name
                    end
                end
            elseif getgenv().SelectWP == "Sword" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == "Sword" then
                        getgenv().SelectWeapon = v.Name
                    end
                end
            elseif getgenv().SelectWP == "Blox Fruit" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
                        getgenv().SelectWeapon = v.Name
                    end
                end
            end
        end)
    end
end)
Setting:AddToggle({
    Name = "Auto Turn On Buso",
    Default = true,
    Callback = function(Value)
        getgenv().AutoHakiBuso = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoHakiBuso then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                local args = {
                    [1] = "Buso"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)
Setting:AddToggle({
    Name = "Auto Haki Observation",
    Default = false,
    Callback = function(Value)
        getgenv().Observation = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().Observation then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
            end)
        end
    end
end)
Setting:AddToggle({
    Name = "Auto Turn On Race V4",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTurnOnV4 = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoTurnOnV4 then
            local character = game.Players.LocalPlayer.Character
            if character:FindFirstChild("RaceEnergy")
                and character.RaceEnergy.Value >= 1
                and not character.RaceTransformed.Value
            then
                local be = game:GetService("VirtualInputManager")
                be:SendKeyEvent(true, "Y", false, game)
                task.wait()
                be:SendKeyEvent(false, "Y", false, game)
            end
        end
    end
end)
Setting:AddToggle({
    Name = "Auto Turn On Race V3",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTurnOnV3 = Value
    end
})
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoTurnOnV3 then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
            end
        end
    end)
end)
Setting:AddToggle({
    Name = "Anti AFK",
    Default = true,
    Callback = function(Value)
        if Value then
            local vu = game:GetService("VirtualUser")
            repeat wait() until game:IsLoaded()
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
})
Setting:AddToggle({
    Name = "Remove Hit Effect",
    Default = false,
    Callback = function(Value)
        getgenv().DistroyHit = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().DistroyHit then
            pcall(function()
                local __Effect = {"SlashHit", "CurvedRing", "SwordSlash", "SlashTail"}
                for _, x in pairs(workspace["_WorldOrigin"]:GetChildren()) do
                    if table.find(__Effect, x.Name) then
                        x:Destroy()
                    end
                end
            end)
        end
    end
end)
Setting:AddToggle({
    Name = "Auto Spin Position",
    Default = false,
    Callback = function(Value)
        RandomCFrame = Value
    end
})
Setting:AddToggle({
    Name = "Teleport Y if low Health",
    Default = false,
    Callback = function(Value)
        getgenv().SafeMode = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().SafeMode then
                local CharacterPlayer = game.Players.LocalPlayer.Character
                if CharacterPlayer and CharacterPlayer:FindFirstChild("Humanoid") and CharacterPlayer:FindFirstChild("HumanoidRootPart") then
                    local HealthMinPlayer = CharacterPlayer.Humanoid.MaxHealth * (getgenv().Safe / 100)
                    if CharacterPlayer.Humanoid.Health <= HealthMinPlayer then
                        while getgenv().SafeMode and CharacterPlayer.Humanoid.Health <= HealthMinPlayer do
                            task.wait()
                            CharacterPlayer.HumanoidRootPart.CFrame = CharacterPlayer.HumanoidRootPart.CFrame + Vector3.new(0, getgenv().PosYSafeHealth or 15, 0)
                        end
                    end
                end
            end
        end)
    end
end)
Setting:AddTextBox({
    Name = "% Health player",
    Placeholder = "input",
    ClearOnFocus = true,
    Callback = function(Value)
        getgenv().Safe = Value
    end
})
Setting:AddSlider({
    Name = "Distance Teleport Y",
    Min = -100,
    Max = 1000,
    Increment = 1,
    Default = 100,
    Callback = function(Value)
        getgenv().PosYSafeHealth = Value
    end
})
Setting:AddToggle({
    Name = "Auto Set Spawn Point",
    Default = false,
    Callback = function(Value)
        getgenv().Set = Value
        if Value then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            end)
        end
    end
})
Setting:AddToggle({
    Name = "Auto Request Temple of Time",
    Description = "Please Do Not Turn Off To Avoid Errors",
    Default = true,
    Callback = function(Value)
        getgenv().RequestTeleportTemple = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().RequestTeleportTemple then
                topos(CFrame.new(28286, 14897, 103))
            end
        end)
    end
end)
Setting:AddSlider({
    Name = "Time Hop Server",
    Min = 1,
    Max = 30,
    Increment = 1,
    Default = 1,
    Callback = function(Value)
        HopDelay = Value
    end
})
Setting:AddToggle({
    Name = "Bring Mob",
    Default = true,
    Callback = function(Value)
        getgenv().BringMob = Value
    end
})
Setting:AddDropdown({
    Name = "Bring Mob Speed",
    Options = {"50", "100", "150", "200", "250", "300", "350"},
    Default = "250",
    Callback = function(Value)
        getgenv().BringMode = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().BringMode then
            pcall(function()
                if getgenv().BringMode == "50" then
                    getgenv().BringMode = 50
                elseif getgenv().BringMode == "100" then
                    getgenv().BringMode = 100
                elseif getgenv().BringMode == "150" then
                    getgenv().BringMode = 150
                elseif getgenv().BringMode == "200" then
                    getgenv().BringMode = 200
                elseif getgenv().BringMode == "250" then
                    getgenv().BringMode = 250
                elseif getgenv().BringMode == "300" then
                    getgenv().BringMode = 300
                elseif getgenv().BringMode == "350" then
                    getgenv().BringMode = 350
                end
            end)
        end
    end
end)
Setting:AddToggle({
    Name = "Auto Anti - Admin Join Server",
    Description = "Please Do Not Turn Off To Avoid Errors",
    Default = true,
    Callback = function(Value)
        getgenv().HopServerAdmin = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().HopServerAdmin then
                for _, v in pairs(game.Players:GetPlayers()) do
                    local blacklist = {
                        "red_game43", "rip_indra", "Axiore", "Polkster", "wenlocktoad",
                        "Daigrock", "toilamvidamme", "oofficialnoobie", "Uzoth", "Azarth",
                        "arlthmetic", "Death_King", "Lunoven", "TheGreateAced", "rip_fud",
                        "drip_mama", "layandikit12", "Hingoi"
                    }
                    if table.find(blacklist, v.Name) then
                        Hop()
                    end
                end
            end
        end)
    end
end)
Setting:AddButton({
    Name = "Remove Fog [ Blind Bones ]",
    Callback = function()
        game:GetService("Lighting").BaseAtmosphere:Destroy()
    end
})
Farm:AddDropdown({
    Name = "Select Method Farm",
    Options = { "Level Farm", "Farm Bones", "Farm Katakuri", "Farm Tyrant of the Skies", "Aura Farm" },
    Default = "Level Farm",
    Callback = function(Value)
        getgenv().FarmMode = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().FarmMode == "Level Farm" and getgenv().AutoFarm then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                CheckQuest()
                if not string.find(QuestTitle, NameMon) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    topos(CFrameQuest)
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 20 then
                        task.wait(2)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if string.find(QuestTitle, "kissed") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v.Name, "kissed Warrior") then
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if string.find(QuestTitle, NameMon) then
                                        repeat task.wait()
                                            Attack.Kill(v, getgenv().AutoFarm)
                                        until not getgenv().AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    else
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            elseif string.find(v.Name, "kissed Warrior") == nil then
                                topos(CFrameMon)
                                if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(QuestTitle, NameMon) then
                                            repeat task.wait()
                                                Attack.Kill(v, getgenv().AutoFarm)
                                            until not getgenv().AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        else
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            topos(CFrameMon)
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                            end
                        end
                    end
                end
            end)
        end
    end
end)
local BonePos = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
spawn(function()
    while task.wait() do
        if getgenv().FarmMode == "Farm Bones" and getgenv().AutoFarm and World3 then
            pcall(function()
                local player = game.Players.LocalPlayer
                local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                local questUI = player.PlayerGui.Main.Quest
                local enemies = workspace:FindFirstChild("Enemies")
                if not (player and root and enemies) then return end
                local foundEnemy = false
                for _, v in pairs(enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") 
                    and v:FindFirstChild("HumanoidRootPart") 
                    and v.Humanoid.Health > 0 
                    and (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" 
                    or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") then
                        foundEnemy = true
                        if getgenv().AcceptQuest and not questUI.Visible then
                            local questPos = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                            topos(questPos)
                            while (questPos.Position - root.Position).Magnitude > 50 do
                                task.wait(0.2)
                            end
                            task.wait(2)
                            local randomQuest = math.random(1, 4)
                            local questData = {
                                [1] = {"StartQuest", "HauntedQuest2", 2},
                                [2] = {"StartQuest", "HauntedQuest2", 1},
                                [3] = {"StartQuest", "HauntedQuest1", 1},
                                [4] = {"StartQuest", "HauntedQuest1", 2}
                            }
                            pcall(function()
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(questData[randomQuest]))
                            end)
                        end
                        repeat
                            task.wait()
                            Attack.Kill(v, getgenv().AutoFarm)
                        until not getgenv().AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                    end
                end
                if not foundEnemy then
                    topos(BonePos)
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        local cakeframe = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375)
        if getgenv().FarmMode == "Farm Katakuri" and getgenv().AutoFarm and World3 then
            pcall(function()
                topos(cakeframe)
                local player = game.Players.LocalPlayer
                local char = player.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                local questUI = player:WaitForChild("PlayerGui"):WaitForChild("Main"):WaitForChild("Quest")
                local enemies = workspace:WaitForChild("Enemies")
                local bigMirror = workspace.Map.CakeLoaf:WaitForChild("BigMirror")
                if not root then return end
                if not bigMirror:FindFirstChild("Other") then
                    topos(CFrame.new(-2077, 252, -12373))
                    return
                end
                if bigMirror.Other.Transparency == 0 or enemies:FindFirstChild("Cake Prince") then
                    local v = GetConnectionEnemies("Cake Prince")
                    if v and v:FindFirstChild("HumanoidRootPart") then
                        repeat
                            task.wait()
                            Attack.Kill2(v, getgenv().AutoFarm)
                        until not getgenv().AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                    else
                        if bigMirror.Other.Transparency == 0 
                            and (CFrame.new(-1990.67, 4533, -14973.67).Position - root.Position).Magnitude >= 2000 then
                            topos(CFrame.new(-2151.82, 149.32, -12404.91))
                        end
                    end
                else
                    local v = GetConnectionEnemies{"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
                    if v and v:FindFirstChild("HumanoidRootPart") then
                        if getgenv().AcceptQuest and not questUI.Visible then
                            local questPos = CFrame.new(-1927.92, 37.8, -12842.54)
                            topos(questPos)
                            while (questPos.Position - root.Position).Magnitude > 50 do
                                task.wait(0.2)
                            end
                            task.wait(2)                           
                            local randomQuest = math.random(1, 4)
                            local questData = {
                                [1] = {"StartQuest", "CakeQuest2", 2},
                                [2] = {"StartQuest", "CakeQuest2", 1},
                                [3] = {"StartQuest", "CakeQuest1", 1},
                                [4] = {"StartQuest", "CakeQuest1", 2}
                            }                            
                            pcall(function()
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(questData[randomQuest]))
                            end)
                        end
                        repeat
                            task.wait()
                            Attack.Kill(v, getgenv().AutoFarm)
                        until not getgenv().AutoFarm or v.Humanoid.Health <= 0 or bigMirror.Other.Transparency == 0 or (getgenv().AcceptQuest and not questUI.Visible)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().FarmMode == "Farm Tyrant of the Skies" and getgenv().AutoFarm and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Tyrant of the Skies") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Tyrant of the Skies" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    Attack.Kill(v, getgenv().AutoFarm)
                                until not getgenv().AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Tyrant of the Skies") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Tyrant of the Skies").HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().FarmMode == "Aura Farm" and getgenv().AutoFarm then
            pcall(function()
                for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") 
                    and v:FindFirstChild("HumanoidRootPart") 
                    and v.Humanoid.Health > 0 then                        
                        local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                        if distance <= 5000 then
                            repeat
                                task.wait()
                                Attack.Kill(v, getgenv().AutoFarm)                     
                            until not getgenv().AutoFarm or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        end
    end
end)
Farm:AddToggle({
    Name = "Start Farm",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarm = Value
        StopTween(getgenv().AutoFarm)
    end
})
Farm:AddToggle({
    Name = "Get Quest Farm [Katakuri Or Bone]",
    Default = false,
    Callback = function(Value)
        getgenv().AcceptQuest = Value
    end
})
Farm:AddSection("Farming Material")
MaterialList = {}
if World1 then
    MaterialList = {
        "Leather + Scrap Metal",
        "Angel Wings",
        "Magma Ore",
        "Fish Tail"
    }
elseif World2 then
    MaterialList = {
        "Leather + Scrap Metal",
        "Radioactive Material",
        "Ectoplasm",
        "Mystic Droplet",
        "Magma Ore",
        "Vampire Fang"
    }
elseif World3 then
    MaterialList = {
        "Scrap Metal",
        "Demonic Wisp",
        "Conjured Cocoa",
        "Dragon Scale",
        "Gunpowder",
        "Fish Tail",
        "Mini Tusk"
    }
end
Farm:AddDropdown({
    Name = "Select Material",
    Options = MaterialList,
    Callback = function(Value)
        getgenv().SelectMaterial = Value
    end
})
Farm:AddToggle({
    Name = "Farm Material",
    Default = false,
    Callback = function(Value)
        getgenv().AutoMaterial = Value
        StopTween(getgenv().AutoMaterial)
    end
})
spawn(function()
    local function processEnemy(v, EnemyName)
        if v:FindFirstChild("Humanoid")
            and v:FindFirstChild("HumanoidRootPart")
            and v.Humanoid.Health > 0
        then
            if v.Name == EnemyName then
                repeat
                    task.wait()
                    Attack.Kill(v, getgenv().AutoMaterial)
                until not getgenv().AutoMaterial or not v.Parent or v.Humanoid.Health <= 0
            end
        end
    end
    local function handleEnemySpawns()
        for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
            for _, EnemyName in ipairs(MMon) do
                if string.find(v.Name, EnemyName) then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
                        topos(v.CFrame * Pos)
                    end
                end
            end
        end
    end
    while wait() do
        if getgenv().AutoMaterial then
            pcall(function()
                if getgenv().SelectMaterial then
                    MaterialMon(getgenv().SelectMaterial)
                    topos(MPos)
                end
                for _, EnemyName in ipairs(MMon) do
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        processEnemy(v, EnemyName)
                    end
                end
                handleEnemySpawns()
            end)
        end
    end
end)
Farm:AddSection("Mastery Farm")
Farm:AddDropdown({
    Name = "Select Method Mastery",
    Options = {"Cake", "Bone"},
    Callback = function(Value)
        getgenv().AutoMethodMastery = Value
    end
})
Farm:AddSlider({
    Name = "Health %",
    Min = 0,
    Max = 100,
    Increment = 5,
    Default = 60,
    Callback = function(Value)
        getgenv().MasteryHealth = Value
    end
})
Farm:AddToggle({
    Name = "Auto Farm Mastery Fruit",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarmMasteryFruit = Value
        StopTween(getgenv().AutoFarmMasteryFruit)
    end
})
spawn(function()
    local RunService = game:GetService("RunService")
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local notifications = playerGui:WaitForChild("Notifications")
    RunService.RenderStepped:Connect(function()
        pcall(function()
            if getgenv().AutoFarmMasteryFruit or getgenv().AutoFarmMasteryGun or getgenv().AutoFarmMasteryAllSword then
                for _, v in pairs(notifications:GetChildren()) do
                    if v.Name == "NotificationTemplate" then
                        local textObject = v:FindFirstChildOfClass("TextLabel")
                        if textObject and string.find(textObject.Text, "Skill locked!") then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    while wait() do
        if getgenv().AutoFarmMasteryFruit then
            pcall(function()
                if getgenv().AutoMethodMastery == "Cake" then
                    local v = GetConnectionEnemies{"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
                    if v then
                        HealthM = v.Humanoid.MaxHealth * getgenv().MasteryHealth / 100
                        repeat
                            task.wait()
                            MousePos = v.HumanoidRootPart.Position
                            Attack.Mas(v,getgenv().AutoFarmMasteryFruit)                            
                        until getgenv().AutoFarmMasteryFruit == false or v.Humanoid.Health <= 0 or not v.Parent
                    else
                        topos(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
                    end
                elseif getgenv().AutoMethodMastery == "Bone" then
                    local v = GetConnectionEnemies{"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                    if v then
                        HealthM = v.Humanoid.MaxHealth * getgenv().MasteryHealth / 100
                        repeat
                            task.wait()                            
                            MousePos = v.HumanoidRootPart.Position
                            Attack.Mas(v,getgenv().AutoFarmMasteryFruit)
                        until getgenv().AutoFarmMasteryFruit == false or v.Humanoid.Health <= 0 or not v.Parent
                    else
                        topos(CFrame.new(-9503.70215, 172.538528, 6042.53125, -0.995873988, -6.34736264e-09, 0.0907468647, -3.20872462e-09, 1, 3.47326292e-08, -0.0907468647, 3.4298143e-08, -0.995873988))
                    end
                end
            end)
        end
    end
end)
Farm:AddToggle({
    Name = "Auto Farm Mastery Gun",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarmMasteryGun = Value
        StopTween(getgenv().AutoFarmMasteryGun)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoFarmMasteryGun then
            pcall(function()
                if getgenv().AutoMethodMastery == "Cake" then
                    local v = GetConnectionEnemies{"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
                    if v then
                        HealthM = v.Humanoid.MaxHealth * getgenv().MasteryHealth / 100
                        repeat
                            task.wait()
                            MousePos = v.HumanoidRootPart.Position
                            Attack.Masgun(v, getgenv().AutoFarmMasteryGun)
                        until getgenv().AutoFarmMasteryGun == false or v.Humanoid.Health <= 0 or not v.Parent
                    else
                        topos(CFrame.new(-1943.6765, 251.5096, -12337.8809))
                    end
                elseif getgenv().AutoMethodMastery == "Bone" then
                    local v = GetConnectionEnemies{"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                    if v then
                        HealthM = v.Humanoid.Health * getgenv().MasteryHealth / 100
                        repeat
                            task.wait()
                            MousePos = v.HumanoidRootPart.Position
                            Attack.Masgun(v, getgenv().AutoFarmMasteryGun)
                        until getgenv().AutoFarmMasteryGun == false or v.Humanoid.Health <= 0 or not v.Parent
                    else
                        topos(CFrame.new(-9503.70215, 172.538528, 6042.53125, -0.995873988, -6.34736264e-09, 0.0907468647, -3.20872462e-09, 1, 3.47326292e-08, -0.0907468647, 3.4298143e-08, -0.995873988))
                    end
                end
            end)
        end
    end
end)
Farm:AddToggle({
    Name = "Auto Farm Mastery All Sword",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarmMasteryAllSword = Value
        StopTween(getgenv().AutoFarmMasteryAllSword)
    end
})
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoFarmMasteryAllSword then
                if getgenv().AutoMethodMastery == "Cake" then
                    for _, v in next, replicated.Remotes.CommF_:InvokeServer("getInventory") do
                        if type(v) == "table" then
                            if v.Type == "Sword" then
                                SwordName = v.Name
                                if tonumber(v.Mastery) >= 1 or tonumber(v.Mastery) <= 599 then
                                    local enemy = GetConnectionEnemies{"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
                                    if GetBP(SwordName) then
                                        if enemy then
                                            repeat
                                                task.wait()
                                                Attack.Sword(enemy, getgenv().AutoFarmMasteryAllSword)
                                            until getgenv().AutoFarmMasteryAllSword == false or not enemy.Parent or enemy.Humanoid.Health <= 0
                                        else
                                            topos(CFrame.new(-1943.6765, 251.5096, -12337.8809))
                                        end
                                    else
                                        replicated.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
                                    end
                                elseif tonumber(v.Mastery) >= 600 then
                                    if not GetBP(SwordName) then
                                        replicated.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
                                    end
                                end
                                break
                            end
                        end
                    end
                elseif getgenv().AutoMethodMastery == "Bone" then
                    for _, v in next, replicated.Remotes.CommF_:InvokeServer("getInventory") do
                        if type(v) == "table" then
                            if v.Type == "Sword" then
                                SwordName = v.Name
                                if tonumber(v.Mastery) >= 1 or tonumber(v.Mastery) <= 599 then
                                    local enemy = GetConnectionEnemies{"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                                    if GetBP(SwordName) then
                                        if enemy then
                                            repeat
                                                task.wait()
                                                Attack.Sword(enemy, getgenv().AutoFarmMasteryAllSword)
                                            until getgenv().AutoFarmMasteryAllSword == false or not enemy.Parent or enemy.Humanoid.Health <= 0
                                        else
                                            topos(CFrame.new(-9495.6807, 453.5862, 5977.3486))
                                        end
                                    else
                                        replicated.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
                                    end
                                elseif tonumber(v.Mastery) >= 600 then
                                    if not GetBP(SwordName) then
                                        replicated.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
                                    end
                                end
                                break
                            end
                        end
                    end
                end
            end
        end)
    end
end)
Stack:AddDropdown({
    Name = "Select Melee",
    Options = {
        "Superhuman",
        "DeathStep",
        "Sharkman Karate",
        "Electric Claw",
        "Dragon Talon",
        "GodHuman"
    },
    Callback = function(Value)
        getgenv().GetMode = Value
    end
})
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().GetMode == "Superhuman" and getgenv().AutoGetMelee and World2 then
                local M_Beli = plr.Data.Beli.Value
                local M_Frag = plr.Data.Fragments.Value
                if plr:FindFirstChild("WeaponAssetCache") then
                    if not GetBP("Superhuman") then                        
                        if not GetBP("Black Leg") then
                            if (M_Beli >= 150000) then
                                replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
                            end
                        elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 299 then
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = true
                        elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 300 then
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = false
                        end
                        if not GetBP("Electro") then
                            if (M_Beli >= 500000) then
                                replicated.Remotes.CommF_:InvokeServer("BuyElectro")
                            end
                        elseif GetBP("Electro") and GetBP("Electro").Level.Value < 299 then
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = true
                        elseif GetBP("Electro") and GetBP("Electro").Level.Value >= 300 then
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = false
                        end
                        if not GetBP("Fishman Karate") then
                            if (M_Beli >= 750000) then
                                replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                            end
                        elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 299 then
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = true
                        elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 300 then
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = false
                        end
                        if not GetBP("Dragon Claw") then
                            if (M_Frag >= 1500) then
                                replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                            end
                        elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 299 then
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = true
                        elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 300 then
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = false
                        end
                        replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
                    end
                end
            end
        end)
    end
end)
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
local Root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
spawn(function()
    while wait() do
        if getgenv().GetMode == "DeathStep" and getgenv().AutoGetMelee and World2 then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") then
                    if not GetBP("Death Step") then
                        if not GetBP("Black Leg") then
                            replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
                        end
                        if GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 400 then
                            replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = false
                        elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 399 then
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = true
                        end
                        if GetBP("Black Leg") or GetBP("Black Leg").Level.Value >= 400 then
                            if workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then
                                if GetBP("Library Key") then
                                    repeat task.wait()
                                        topos(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))
                                    until not getgenv().AutoGetMelee or (Root.Position == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position)
                                    if (Root.CFrame == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) then
                                        replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
                                    end
                                elseif not GetBP("Library Key") then
                                    local v = GetConnectionEnemies("Awakened Ice Admiral")
                                    if v then
                                        repeat task.wait()
                                            Attack.Kill(v, getgenv().AutoGetMelee)
                                        until not v.Parent or v.Humanoid.Health <= 0 or getgenv().AutoGetMelee == false or GetBP("Library Key") or GetBP("Death Step")
                                    else
                                        topos(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
local Root = plr.Character and plr.Character:WaitForChild("HumanoidRootPart")
spawn(function()
    while wait() do
        if getgenv().GetMode == "Sharkman Karate" and getgenv().AutoGetMelee and World2 then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") then
                    if not GetBP("Sharkman Karate") then
                        if not GetBP("Fishman Karate") then
                            replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 400 then
                            replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = false
                        elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 399 then
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = true
                        end
                        if GetBP("Fishman Karate") or GetBP("Fishman Karate").Level.Value >= 400 then
                            if GetBP("Water Key") then
                                if string.find(replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then
                                    if GetBP("Water Key") then
                                        repeat
                                            task.wait()
                                            topos(CFrame.new(-2604.6958, 239.432526, -10315.1982,0.0425701365, 0, -0.999093413,0, 1, 0,0.999093413, 0, 0.0425701365))
                                        until not getgenv().AutoGetMelee or (Root.Position == CFrame.new(-2604.6958, 239.432526, -10315.1982,0.0425701365, 0, -0.999093413,0, 1, 0,0.999093413, 0, 0.0425701365).Position)
                                        replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                                    end
                                end
                            elseif not GetBP("Water Key") then
                                local v = GetConnectionEnemies("Tide Keeper")
                                if v then
                                    repeat
                                        task.wait()
                                        Attack.Kill(v, getgenv().AutoGetMelee)
                                    until not v.Parent or v.Humanoid.Health <= 0 or getgenv().AutoGetMelee == false or GetBP("Water Key") or GetBP("Sharkman Karate")
                                else
                                    topos(CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625))
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
local plr = game.Players.LocalPlayer
local replicated = game.ReplicatedStorage
spawn(function()
    while wait() do
        if getgenv().GetMode == "Electric Claw" and getgenv().AutoGetMelee and World3 then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") then
                    if not GetBP("Electro") then
                        replicated.Remotes.CommF_:InvokeServer("BuyElectro")
                    end
                    if GetBP("Electro") and GetBP("Electro").Level.Value >= 400 then
                        if replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then
                            topos(CFrame.new(-12548, 337, -7481))
                        end
                        replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
                    elseif GetBP("Electro") and GetBP("Electro").Level.Value < 400 then
                        repeat
                            getgenv().FarmMode = "Farm Bones"
                            getgenv().AutoFarm = true
                            task.wait()
                        until not getgenv().AutoGetMelee or GetBP("Electric Claw")
                        getgenv().FarmMode = "Farm Bones"
                        getgenv().AutoFarm = false
                    end
                end
            end)
        end
    end
end)
local plr = game.Players.LocalPlayer
local replicated = game.ReplicatedStorage
spawn(function()
    while wait() do
        if getgenv().GetMode == "Dragon Talon" and getgenv().AutoGetMelee and World3 then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") then
                    if not GetBP("Dragon Claw") then
                        replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                    end
                    if GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 400 then
                        replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                        replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                    elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 400 then
                        repeat
                            getgenv().FarmMode = "Farm Bones"
                            getgenv().AutoFarm = true
                            task.wait()
                        until not getgenv().AutoGetMelee or GetBP("Dragon Talon")
                        getgenv().FarmMode = "Farm Bones"
                        getgenv().AutoFarm = false
                    end
                end
            end)
        end
    end
end)
local plr = game.Players.LocalPlayer
local replicated = game.ReplicatedStorage
local Lv = plr.Data.Level.Value
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().GetMode == "GodHuman" and getgenv().AutoGetMelee and World3 then
                local result = replicated.Remotes.CommF_:InvokeServer("BuyGodhuman", true)
                if result == "Bring me 20 Fish Tails, 20 Magma Ore, 10 Dragon Scales and 10 Mystic Droplets." then
                    if GetM("Dragon Scale") == false or GetM("Dragon Scale") < 10 then
                        if World3 then
                            Lv = 1575
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = true
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    elseif GetM("Fish Tail") == false or GetM("Fish Tail") < 20 then
                        if World3 then
                            Lv = 1775
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = true
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    elseif GetM("Mystic Droplet") == false or GetM("Mystic Droplet") < 10 then
                        if World2 then
                            Lv = 1425
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = true
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    elseif GetM("Magma Ore") == false or GetM("Magma Ore") < 20 then
                        if World2 then
                            Lv = 1175
                            getgenv().FarmMode = "Level Farm"
                            getgenv().AutoFarm = true
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    end
                elseif result == 3 then
                    return nil
                else
                    replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
                end
            end
        end)
    end
end)
Stack:AddToggle({
    Name = "Auto Get Melee",
    Default = false,
    Callback = function(Value)
        getgenv().AutoGetMelee = Value
        StopTween(getgenv().AutoGetMelee)
    end
})
Stack:AddToggle({
    Name = "Teleport To Fruit",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportToFruit = Value
        StopTween(getgenv().TeleportToFruit)
    end
})
spawn(function()
    while wait() do
        if getgenv().TeleportToFruit then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    topos(v.Handle.CFrame)
                end
            end
        end
    end
end)
Stack:AddToggle({
    Name = "Teleport To Fruit [ Hop Server ]",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportToFruitHop = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().TeleportToFruit and getgenv().TeleportToFruitHop then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    topos(v.Handle.CFrame)
                elseif not string.find(v.Name, "Fruit") then
                    wait(1)
                    Hop()
                end
            end
        end
    end
end)
Stack:AddToggle({
    Name = "Auto New World",
    Default = false,
    Callback = function(Value)
        getgenv().AutoNewWorld = Value
        StopTween(getgenv().AutoNewWorld)
    end
})
local plr = game.Players.LocalPlayer
local replicated = game.ReplicatedStorage
local Enemies = workspace:WaitForChild("Enemies")
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoNewWorld then
                if plr.Data.Level.Value >= 700 then
                    if workspace.Map.Ice.Door.CanCollide == true and workspace.Map.Ice.Door.Transparency == 0 then
                        replicated.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                        EquipWeapon("Key")
                        repeat
                            task.wait()
                            topos(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        until not getgenv().AutoNewWorld or (Root.Position == CFrame.new(1347.7124, 37.3751602, -1325.6488).Position)

                    elseif workspace.Map.Ice.Door.CanCollide == false and workspace.Map.Ice.Door.Transparency == 1 then
                        if Enemies:FindFirstChild("Ice Admiral") then
                            for _, xz in pairs(Enemies:GetChildren()) do
                                if xz.Name == "Ice Admiral" and Attack.Alive(xz) then
                                    repeat
                                        task.wait()
                                        Attack.Kill(xz, getgenv().AutoNewWorld)
                                    until getgenv().AutoNewWorld == false or xz.Humanoid.Health <= 0
                                    replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                                end
                            end
                        else
                            topos(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        end
                    else
                        replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end
                end
            end
        end)
    end
end)
Stack:AddToggle({
    Name = "Auto Third World",
    Default = false,
    Callback = function(Value)
        getgenv().AutoThirdSea = Value
        StopTween(getgenv().AutoThirdSea)
    end
})
local plr = game.Players.LocalPlayer
local Root = plr.Character.HumanoidRootPart
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoThirdSea then
                if plr.Data.Level.Value >= 1500 then
                    if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
                        if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
                            replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")
                            if replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                                local v = GetConnectionEnemies("rip_indra")
                                if v then
                                    repeat task.wait()
                                        Attack.Kill(v,getgenv().AutoThirdSea)
                                    until not getgenv().AutoThirdSea or not v.Parent or v.Humanoid.Health <= 0
                                    Check = 2
                                    repeat task.wait()
                                        replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")
                                    until Check == 1
                                else
                                    replicated.Remotes.CommF_:InvokeServer("F_","ZQuestProgress","Check")
                                    wait(1)
                                    replicated.Remotes.CommF_:InvokeServer("F_","ZQuestProgress","Begin")
                                end
                            elseif replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1 then
                                replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")
                            else
                                local v = GetConnectionEnemies("Don Swan")
                                if v then
                                    repeat task.wait()
                                        Attack.Kill(v,getgenv().AutoThirdSea)
                                    until not getgenv().AutoThirdSea or not v.Parent or v.Humanoid.Health <= 0
                                else
                                    repeat task.wait()
                                        topos(CFrame.new(2288.802, 15.1870775, 863.034607))
                                    until not getgenv().AutoThirdSea or (Root.Position == CFrame.new(2288.802, 15.1870775, 863.034607).Position)

                                    if Root.CFrame == CFrame.new(2288.802, 15.1870775, 863.034607) then
                                        topos(CFrame.new(2288.802, 15.1870775, 863.034607))
                                    end
                                end
                            end
                        else
                            if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                TabelDevilFruitStore = {}
                                TabelDevilFruitOpen = {}
                                for i,v in pairs(replicated.Remotes.CommF_:InvokeServer("getInventoryFruits")) do
                                    for i1,v1 in pairs(v) do
                                        if i1 == "Name" then
                                            table.insert(TabelDevilFruitStore,v1)
                                        end
                                    end
                                end
                                for i,v in next, replicated.Remotes.CommF_:InvokeServer("GetFruits") do
                                    if v.Price >= 1000000 then
                                        table.insert(TabelDevilFruitOpen,v.Name)
                                    end
                                end
                                for i,DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
                                    for i1,DevilFruitStore in pairs(TabelDevilFruitStore) do
                                        if DevilFruitOpenDoor == DevilFruitStore and replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                            if not plr.Backpack:FindFirstChild(DevilFruitStore) then
                                                replicated.Remotes.CommF_:InvokeServer("F_","LoadFruit",DevilFruitStore)
                                            else
                                                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","1")
                                                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","2")
                                                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","3")
                                            end
                                        end
                                    end
                                end
                                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","1")
                                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","2")
                                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","3")
                            end
                        end
                    else
                        if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                            if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates")
                            and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")
                            and plr.PlayerGui.Main.Quest.Visible == true then                                
                                local v = GetConnectionEnemies("Swan Pirate")
                                if v then
                                    pcall(function()
                                        repeat task.wait()
                                            Attack.Kill(v,getgenv().AutoThirdSea)
                                        until not v.Parent or v.Humanoid.Health <= 0 or getgenv().AutoThirdSea == false or plr.PlayerGui.Main.Quest.Visible == false
                                    end)
                                else
                                    topos(CFrame.new(1057.92761, 137.614319, 1242.08069))
                                end
                            else
                                topos(CFrame.new(-456.28952, 73.0200958, 299.895966))
                            end
                        elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                            local v = GetConnectionEnemies("Jeremy")
                            if v then
                                repeat task.wait()
                                    Attack.Kill(v,getgenv().AutoThirdSea)
                                until not v.Parent or v.Humanoid.Health <= 0 or getgenv().AutoThirdSea == false
                            else
                                topos(CFrame.new(2099.88159, 448.931, 648.997375))
                            end
                        elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                            repeat task.wait()
                                topos(CFrame.new(-1836, 11, 1714))
                            until not getgenv().AutoThirdSea or (Root.Position == CFrame.new(-1836, 11, 1714).Position)
                            if Root.CFrame == CFrame.new(-1836, 11, 1714) then
                                topos(CFrame.new(-1836, 11, 1714))
                            end
                            topos(CFrame.new(-1850.49329, 13.1789551, 1750.89685))
                            wait(1)
                            topos(CFrame.new(-1858.87305, 19.3777466, 1712.01807))
                            wait(1)
                            topos(CFrame.new(-1803.94324, 16.5789185, 1750.89685))
                            wait(1)
                            topos(CFrame.new(-1858.55835, 16.8604317, 1724.79541))
                            wait(1)
                            topos(CFrame.new(-1869.54224, 15.987854, 1681.00659))
                            wait(1)
                            topos(CFrame.new(-1800.0979, 16.4978027, 1684.52368))
                            wait(1)
                            topos(CFrame.new(-1819.26343, 14.795166, 1717.90625))
                            wait(1)
                            topos(CFrame.new(-1813.51843, 14.8604736, 1724.79541))
                        end
                    end
                end
            end
        end)
    end
end)
Stack:AddToggle({
    Name = "Auto Bartilo",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBartilo = Value
        StopTween(getgenv().AutoBartilo)
    end
})
local plr = game.Players.LocalPlayer
local replicated = game.ReplicatedStorage
local Lv = plr.Data.Level.Value
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoBartilo and Lv >= 850 then
                local Qbart = plr.PlayerGui.Main.Quest
                if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                    if Qbart.Visible == true then
                        local v = GetConnectionEnemies("Swan Pirate")
                        if v then
                            local x = GetConnectionEnemies { "Swan Pirate", "Jeremy" }
                            if x then
                                repeat task.wait()
                                    if not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate") then
                                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                                    else
                                        Attack.Kill(x, getgenv().AutoBartilo)
                                    end
                                until getgenv().AutoBartilo == false or not x.Parent or x.Humanoid.Health <= 0 or Qbart.Visible == false or not x:FindFirstChild("HumanoidRootPart")
                            end
                        else
                            topos(CFrame.new(970.369446, 142.653198, 1217.3667,0.162079468, -4.85452638e-08, -0.986777723,1.03357589e-08, 1, -4.74980872e-08,0.986777723, -2.50063148e-09, 0.162079468))
                        end
                    else
                        repeat task.wait()
                            topos(CFrame.new(-461.533203, 72.3478546, 300.311096,0.050853312, 0, -0.998706102,0, 1, 0,0.998706102, 0, 0.050853312))
                        until ((CFrame.new(-461.533203, 72.3478546, 300.311096,0.050853312, 0, -0.998706102,0, 1, 0,0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 20) or getgenv().AutoBartilo == false
                        if ((CFrame.new(-461.533203, 72.3478546, 300.311096,0.050853312, 0, -0.998706102,0, 1, 0,0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1) then
                            replicated.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
                        end
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 then
                    local je = GetConnectionEnemies("Jeremy")
                    if je then
                        repeat task.wait()
                            Attack.Kill(je, getgenv().AutoBartilo)
                        until getgenv().AutoBartilo == false or not je.Parent or je.Humanoid.Health <= 0 or Qbart.Visible == false or not je:FindFirstChild("HumanoidRootPart")
                    else
                        topos(CFrame.new(2158.97412, 449.056244, 705.411682,-0.754199564, -4.17389057e-09, -0.656645238,-4.47752875e-08, 1, 4.50709301e-08,0.656645238, 6.3393955e-08, -0.754199564))
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
                    repeat task.wait()
                        topos(CFrame.new(-1830.83972, 10.5578213, 1680.60229,0.979988456, -2.02152783e-08, -0.199054286,2.20792113e-08, 1, 7.1442483e-09,0.199054286, -1.13962431e-08, 0.979988456))
                    until ((CFrame.new(-1830.83972, 10.5578213, 1680.60229,0.979988456, -2.02152783e-08, -0.199054286,2.20792113e-08, 1, 7.1442483e-09,0.199054286, -1.13962431e-08, 0.979988456).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1) or getgenv().AutoBartilo == false
                    task.wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate1.CFrame
                    task.wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate2.CFrame
                    task.wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate3.CFrame
                    task.wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate4.CFrame
                    task.wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate5.CFrame
                    task.wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate6.CFrame
                    task.wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate7.CFrame
                    task.wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate8.CFrame
                    task.wait(2.5)
                end
            end
        end)
    end
end)
Stack:AddToggle({
    Name = "Auto Training Dummy",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTrainingDummy = Value
        StopTween(getgenv().AutoTrainingDummy)
    end
})
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        if getgenv().AutoTrainingDummy then
            pcall(function()
                if plr.PlayerGui.Main.Quest.Visible == false then
                    local xxx = { [1] = "ArenaTrainer" }
                    replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(xxx))
                else
                    local v = GetConnectionEnemies("Training Dummy")
                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v,getgenv().AutoTrainingDummy)
                        until not getgenv().AutoTrainingDummy or not v.Parent or v.Humanoid.Health <= 0
                    else
                        topos(CFrame.new(3688.005126953125, 12.746943473815918, 170.20953369140625))
                    end
                end
            end)
        end
    end
end)
Stack:AddToggle({
    Name = "Auto Factory",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFactory = Value
        StopTween(getgenv().AutoFactory)
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoFactory and World2 then
                local v = GetConnectionEnemies("Core")
                if v then
                    repeat task.wait()
                        EquipWeapon(getgenv().SelectWeapon)
                        topos(CFrame.new(448.46756, 199.356781, -441.389252))
                    until not v.Parent or v.Humanoid.Health <= 0 or getgenv().AutoFactory == false
                else
                    topos(CFrame.new(448.46756, 199.356781, -441.389252))
                end
            end
        end)
    end
end)
Stack:AddToggle({
    Name = "Auto Pirate Raid",
    Default = false,
    Callback = function(Value)
        getgenv().AutoPirateRaid = Value
        StopTween(getgenv().AutoPirateRaid)
    end
})
local replicated = game:GetService("ReplicatedStorage")
local Root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
spawn(function()
    while wait() do
        if getgenv().AutoPirateRaid then
            pcall(function()
                local CFrameCastleRaid = CFrame.new(-5496.17432, 313.768921, -2841.53027,0.924894512, 7.37058015e-09, 0.380223751,3.5881019e-08, 1, -1.06665446e-07,-0.380223751, 1.12297109e-07, 0.924894512)
                local CastlePos = CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125)
                if (CastlePos.Position - Root.Position).Magnitude <= 500 then
                    for i, v in pairs(workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") 
                            and v:FindFirstChild("Humanoid") 
                            and v.Humanoid.Health > 0 then                            
                            if v.Name then
                                if (v.HumanoidRootPart.Position - Root.Position).Magnitude <= 2000 then
                                    repeat
                                        task.wait()
                                        Attack.Kill(v,getgenv().AutoPirateRaid)
                                    until not getgenv().AutoPirateRaid or not v.Parent or v.Humanoid.Health <= 0 or not workspace.Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end
                    end
                else
                    local Castle_Mob = {
                        "Galley Pirate", "Galley Captain", "Raider", "Mercenary", "Vampire", "Zombie",
                        "Snow Trooper", "Winter Warrior", "Lab Subordinate", "Horned Warrior",
                        "Magma Ninja", "Lava Pirate", "Ship Deckhand", "Ship Engineer",
                        "Ship Steward", "Ship Officer", "Arctic Warrior", "Snow Lurker",
                        "Sea Soldier", "Water Fighter"
                    }
                    for i = 1, #Castle_Mob do
                        if replicated:FindFirstChild(Castle_Mob[i]) then
                            for _, v in pairs(replicated:GetChildren()) do
                                if table.find(Castle_Mob, v.Name) then
                                    topos(CFrameCastleRaid)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
Stack:AddToggle({
    Name = "Auto Elite Hunter",
    Default = false,
    Callback = function(Value)
        getgenv().AutoEliteHunter = Value
        StopTween(getgenv().AutoEliteHunter)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoEliteHunter and World3 then
            pcall(function()
                local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
                local questGui = playerGui.Main.Quest
                local questText = playerGui.Main.Quest.Container.QuestTitle.Title.Text
                if questGui.Visible == true then
                    if string.find(questText, "Diablo") or string.find(questText, "Deandre") or string.find(questText, "Urban") then
                        local enemies = game:GetService("Workspace").Enemies
                        if enemies:FindFirstChild("Diablo") or enemies:FindFirstChild("Deandre") or enemies:FindFirstChild("Urban") then
                            for i, v in pairs(enemies:GetChildren()) do
                                if (v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban") and 
                                   v:FindFirstChild("Humanoid") and 
                                   v:FindFirstChild("HumanoidRootPart") and 
                                   v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        Attack.Kill(v, getgenv().AutoEliteHunter)
                                    until getgenv().AutoEliteHunter == false or v.Humanoid.Health <= 0 or not v.Parent
                                end
                            end
                        else
                            local rs = game:GetService("ReplicatedStorage")
                            if rs:FindFirstChild("Diablo") then
                                topos(rs.Diablo.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            elseif rs:FindFirstChild("Deandre") then
                                topos(rs.Deandre.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            elseif rs:FindFirstChild("Urban") then
                                topos(rs.Urban.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            end
                        end
                    end
                else
                    if getgenv().AutoEliteHunterHop and 
                       game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("EliteHunter") == 
                       "I don't have anything for you right now. Come back later." then
                        Hop()
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                    end
                end
            end)
        end
    end
end)
Stack:AddToggle({
    Name = "Hop Server Elite Hunter",
    Default = false,
    Callback = function(Value)
        getgenv().AutoEliteHunterHop = Value
    end
})
Stack:AddToggle({
    Name = "Auto Open Haki Pad",
    Default = false,
    Callback = function(Value)
        getgenv().AutoUnHaki = Value
        StopTween(getgenv().AutoUnHaki)
    end
})
local replicated = game:GetService("ReplicatedStorage")
local function AuraSkin(HakiID)
    if not HakiID then return end
    local args = {
        [1] = {
            ["StorageName"] = HakiID,
            ["Type"] = "AuraSkin",
            ["Context"] = "Equip"
        }
    }
    replicated:WaitForChild("Modules")
        :WaitForChild("Net")
        :WaitForChild("RF/FruitCustomizerRF")
        :InvokeServer(args[1])
end
local function ValidColor(Part)
    return Part and Part.BrickColor and tostring(Part.BrickColor) == "Lime green"
end
local function HakiCalculate(Part)
    local ID = {
        ["Really red"] = "Pure Red",
        ["Oyster"] = "Snow White",
        ["Hot pink"] = "Winter Sky"
    }
    if Part and Part.BrickColor then
        return ID[tostring(Part.BrickColor)]
    end
end
spawn(function()
    while wait() do
        if getgenv().AutoUnHaki and World3 then
            pcall(function()
                local Summoner = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Boat Castle"):FindFirstChild("Summoner")
                if Summoner and Summoner:FindFirstChild("Circle") then
                    for _, v in pairs(Summoner.Circle:GetChildren()) do
                        if v.Name == "Part" then
                            local TogglesPart = v:FindFirstChild("Part")
                            if not ValidColor(TogglesPart) then
                                AuraSkin(HakiCalculate(v))
                                repeat
                                    task.wait()
                                    topos(v.CFrame)
                                until ValidColor(TogglesPart) or not getgenv().AutoUnHaki
                            end
                        end
                    end
                end
            end)
        end
    end
end)
Stack:AddToggle({
    Name = "Auto Attack Rip Indra",
    Default = false,
    Callback = function(Value)
        getgenv().AutoAttackRipIndra = Value
        StopTween(getgenv().AutoAttackRipIndra)
    end
})
local AdminPos = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoAttackRipIndra and World3 then
                local enemies = game:GetService("Workspace").Enemies
                local ripIndra = enemies:FindFirstChild("rip_indra True Form") or enemies:FindFirstChild("rip_indra")
                if ripIndra then
                    for i, v in pairs(enemies:GetChildren()) do
                        if (v.Name == "rip_indra True Form" or v.Name == "rip_indra")
                        and v:IsA("Model")
                        and v:FindFirstChild("Humanoid")
                        and v:FindFirstChild("HumanoidRootPart")
                        and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                pcall(function()
                                    Attack.Kill(v, getgenv().AutoAttackRipIndra)
                                end)
                            until getgenv().AutoAttackRipIndra == false or v.Humanoid.Health <= 0
                        end
                    end
                else
                    topos(AdminPos)
                    topos(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
                end
            end
        end
    end)
end)
Stack:AddToggle({
    Name = "Auto Soul Reaper",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSoulReaper = Value
        StopTween(getgenv().AutoSoulReaper)
    end
})
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        if getgenv().AutoSoulReaper and World3 then
            pcall(function()
                local v = GetConnectionEnemies("Soul Reaper")
                if v then
                    repeat 
                        task.wait()
                        Attack.Kill(v,getgenv().AutoSoulReaper)
                    until v.Humanoid.Health <= 0 or not getgenv().AutoSoulReaper
                else
                    if not GetBP("Hallow Essence") then
                        repeat 
                            task.wait(0.1)
                            replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                        until not getgenv().AutoSoulReaper or GetBP("Hallow Essence")
                    else
                        local summonPos = CFrame.new(-8932.322, 146.8315, 6062.550)
                        repeat 
                            task.wait(0.1)
                            topos(summonPos)
                        until not getgenv().AutoSoulReaper or (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and (plr.Character.HumanoidRootPart.Position - summonPos.Position).Magnitude < 5)
                        EquipWeapon("Hallow Essence")
                    end
                end
            end)
        end
    end
end)
Stack:AddToggle({
    Name = "Auto Dough King",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDoughKing = Value
        StopTween(getgenv().AutoDoughKing)
    end
})
local plr = game.Players.LocalPlayer
local replicated = game.ReplicatedStorage
spawn(function()
    while wait() do
        if getgenv().AutoDoughKing then
            pcall(function()
                if not workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
                    if GetBP("Red Key") then
                        replicated.Remotes.CommF_:InvokeServer("CakeScientist", "Check")
                        replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
                    end
                elseif workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
                    if GetBP("Red Key") then
                        repeat
                            task.wait()
                            topos(CFrame.new(-2681.97998, 64.3921585, -12853.7363,0.149007782, -1.87902192e-08, 0.98883605,3.60619588e-08, 1, 1.35681812e-08,-0.98883605, 3.36376011e-08, 0.149007782))
                        until not getgenv().AutoDoughKing or (plr.Character.HumanoidRootPart.CFrame - CFrame.new(-2681.97998, 64.3921585, -12853.7363,0.149007782, -1.87902192e-08, 0.98883605,3.60619588e-08, 1, 1.35681812e-08,-0.98883605, 3.36376011e-08, 0.149007782)).Magnitude <= 5
                        EquipWeapon("Red Key")
                    end
                elseif GetConnectionEnemies("Dough King") then
                    local v = GetConnectionEnemies("Dough King")
                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, getgenv().AutoDoughKing)
                        until not getgenv().AutoDoughKing or not v.Parent or v.Humanoid.Health <= 0
                    else
                        topos(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
                    end
                end
                if GetBP("Sweet Chalice") then
                    replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
                    getgenv().AutoAttackDoughKing = true
                else
                    getgenv().AutoAttackDoughKing = false
                end
                if GetBP("God's Chalice") and GetM("Conjured Cocoa") >= 10 then
                    replicated.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                end
                if not plr.Backpack:FindFirstChild("God's Chalice")
                    or plr.Character:FindFirstChild("God's Chalice")
                then
                    getgenv().AutoEliteHunter = true
                else
                    getgenv().AutoEliteHunter = false
                end
                if GetM("Conjured Cocoa") <= 10 then
                    local v = GetConnectionEnemies{"Cocoa Warrior", "Chocolate Bar Battler"}
                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, getgenv().AutoDoughKing)
                        until getgenv().AutoDoughKing == false or not v.Parent or v.Humanoid.Health <= 0
                    else
                        topos(CFrame.new(402.7189025878906, 81.06050109863281, -12259.54296875))
                    end
                end
            end)
        end
    end
end)
Stack:AddToggle({
    Name = "Auto Attack Dough King",
    Default = false,
    Callback = function(Value)
        getgenv().AutoAttackDoughKing = Value
        StopTween(getgenv().AutoAttackDoughKing)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoAttackDoughKing and World3 then
            pcall(function()
                local v = GetConnectionEnemies("Dough King")
                if v then
                    repeat 
                        task.wait()
                        Attack.Kill(v,getgenv().AutoAttackDoughKing)
                    until not getgenv().AutoAttackDoughKing or not v.Parent or v.Humanoid.Health <= 0
                else
                    topos(CFrame.new(-1943.6765, 251.5095, -12337.8809))
                end
            end)
        end
    end
end)
Stack:AddToggle({
    Name = "Auto Phoenix Raid",
    Default = false,
    Callback = function(Value)
        getgenv().AutoPhoenixRaid = Value
        StopTween(getgenv().AutoPhoenixRaid)
    end
})
local replicated = ReplicatedStorage
spawn(function()
    while wait() do
        if getgenv().AutoPhoenixRaid then
            pcall(function()
                if GetBP("Bird-Bird: Phoenix") then
                    if plr.Backpack:FindFirstChild(plr.Data.DevilFruit.Value) then
                        if plr.Backpack[plr.Data.DevilFruit.Value].Level.Value >= 400 then
                            topos(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                            if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position 
                                - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                replicated.Remotes.CommF_:InvokeServer("SickScientist", "Check")
                                replicated.Remotes.CommF_:InvokeServer("SickScientist", "Heal")
                            end
                        end
                    elseif plr.Character:FindFirstChild(plr.Data.DevilFruit.Value) then
                        if plr.Character[plr.Data.DevilFruit.Value].Level.Value >= 400 then
                            topos(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                            if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position 
                                - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                replicated.Remotes.CommF_:InvokeServer("SickScientist", "Check")
                                replicated.Remotes.CommF_:InvokeServer("SickScientist", "Heal")
                            end
                        end
                    end
                end
            end)
        end
    end
end)
Stack:AddToggle({
    Name = "Auto Dark Blade V3",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDarkBladev3 = Value
        StopTween(getgenv().AutoDarkBladev3)
    end
})
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
local Root = plr.Character:WaitForChild("HumanoidRootPart")
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoDarkBladev3 and World2 then
                if not GetBP("Dark Blade") then
                    replicated.Remotes.CommF_:InvokeServer("LoadItem", "Dark Blade")
                end
                if GetBP("Fist of Darkness") > 1 then
                    if not workspace.Enemies:FindFirstChild("Darkbeard") then
                        topos(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
                    elseif GetConnectionEnemies("Darkbeard") and GetBP("Fist of Darkness") >= 1 then
                        repeat
                            task.wait()
                            topos(CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375))
                        until not getgenv().AutoDarkBladev3 or (Root.Position == CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375).Position)

                        fireclickdetector(workspace.Map.GraveIsland.Mountain.Rocks.Button.ClickDetector)
                    end
                else
                    getgenv().AutoFarmChest = true
                end
            end
        end)
    end
end)
Stack:AddToggle({
    Name = "Auto Darkbeard",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDarkbeard = Value
        StopTween(getgenv().AutoDarkbeard)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoDarkbeard and World2 then
            pcall(function()
                if GetBP("Fist of Darkness") and not workspace.Enemies:FindFirstChild("Darkbeard") then
                    topos(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))                
                elseif GetConnectionEnemies("Darkbeard") then
                    local v = GetConnectionEnemies("Darkbeard")
                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v,getgenv().AutoDarkbeard)
                        until getgenv().AutoDarkbeard == false or not v.Parent or v.Humanoid.Health <= 0
                    end               
                elseif not GetBP("Fist of Darkness") and not GetConnectionEnemies("Darkbeard") then
                    repeat
                        task.wait()
                        getgenv().AutoFarmChest = true
                    until not getgenv().AutoDarkbeard or GetBP("Fist of Darkness") or GetConnectionEnemies("Darkbeard")
                    getgenv().AutoFarmChest = false
                end
            end)
        end
    end
end)
Other:AddSection("Fishing")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")
local FishReplicated = ReplicatedStorage:WaitForChild("FishReplicated")
local FishingRequest = FishReplicated:FindFirstChild("FishingRequest")
local FishingRemote = FishReplicated:FindFirstChild("FishingRemote")
local FishingClient = FishReplicated:WaitForChild("FishingClient")
local Config = require(FishingClient:WaitForChild("Config"))
local Util = ReplicatedStorage:WaitForChild("Util")
local GetWaterHeightAtLocation = require(Util:WaitForChild("GetWaterHeightAtLocation"))
local COMMF_ = Net:FindFirstChild("RF/JobsRemoteFunction")
local CraftRF = Net:FindFirstChild("RF/Craft")
local function EnsureRodAndBait()
    if not COMMF_ then return end
    pcall(function()
        COMMF_:InvokeServer("FishingNPC", "FirstTimeFreeRod")
        COMMF_:InvokeServer("LoadItem", getgenv().SelectedRod, {"Gear"})
    end)
    task.wait(0.5)
    local FishingData = LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("FishingData")
    if FishingData and table.find({"None", nil}, FishingData:GetAttribute("SelectedBait")) then
        local success, inventory = pcall(function()
            return COMMF_:InvokeServer("getInventory")
        end)
        if success and inventory then
            for _, v in pairs(inventory) do
                if v.Type == "Bait" and v.Name == getgenv().SelectedBait then
                    COMMF_:InvokeServer("LoadItem", v.Name, {"Usables"})
                    return
                end
            end
        end
        if CraftRF then
            CraftRF:InvokeServer("Craft", getgenv().SelectedBait)
            task.wait(2)
        end
    end
end
local function EquipRod()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if not Character:FindFirstChild(getgenv().SelectedRod) then
        local BackpackRod = LocalPlayer.Backpack:FindFirstChild(getgenv().SelectedRod)
        if BackpackRod and Humanoid then
            Humanoid:EquipTool(BackpackRod)
            task.wait(0.3)
        end
    end
end
local function GetCastPosition()
    local waterY = GetWaterHeightAtLocation(HumanoidRootPart.Position)
    local direction = HumanoidRootPart.CFrame.LookVector * (Config.Rod.MaxLaunchDistance or 50)
    local _, hitPos = Workspace:FindPartOnRayWithIgnoreList(
        Ray.new(Character.Head.Position, direction),
        {Character, Workspace.Characters, Workspace.Enemies}
    )
    if not hitPos then
        return HumanoidRootPart.Position + Vector3.new(0, -10, 0)
    end
    local _, groundHit = Workspace:FindPartOnRayWithIgnoreList(
        Ray.new(hitPos + Vector3.new(0, 3, 0), Vector3.new(0, -500, 0)),
        {Character, Workspace.Characters, Workspace.Enemies}
    )
    if groundHit and groundHit.Y < waterY then
        return Vector3.new(hitPos.X, math.max(groundHit.Y, waterY), hitPos.Z)
    end
    return hitPos
end
local function CastLine()
    if not FishingRequest then return end
    pcall(function()
        FishingRequest:InvokeServer("StartCasting")
        task.wait(0.7)
        FishingRequest:InvokeServer("CastLineAtLocation", GetCastPosition(), 100, true)
    end)
end
local function CatchFish()
    if not FishingRequest then return end
    pcall(function()
        FishingRequest:InvokeServer("Catching", 1)
        task.wait(0.25)
        FishingRequest:InvokeServer("Catch", 1)
    end)
end
Other:AddDropdown({
    Name = "Select Rod",
    Options = {"Fishing Rod", "Gold Rod", "Shark Rod", "Shell Rod", "Treasure Rod"},
    Default = "Fishing Rod",
    Callback = function(Value)
        getgenv().SelectedRod = Value
    end
})
Other:AddDropdown({
    Name = "Select Bait",
    Options = {"Basic Bait", "Kelp Bait", "Good Bait", "Abyssal Bait", "Frozen Bait", "Epic Bait", "Carnivore Bait"},
    Default = "Basic Bait",
    Callback = function(Value)
        getgenv().SelectedBait = Value
    end
})
Other:AddToggle({
    Name = "Auto Fishing",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFishing = Value
        if Value then
            spawn(function()
                while getgenv().AutoFishing do
                    task.wait(0.3)
                    pcall(function()
                        Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                        HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
                        EnsureRodAndBait()
                        EquipRod()
                        local Rod = Character:FindFirstChild(getgenv().SelectedRod)
                        if Rod then
                            local state = Rod:GetAttribute("ServerState") or Rod:GetAttribute("State")
                            if state == "Biting" then
                                CatchFish()
                            elseif state == "ReeledIn" or state == "Idle" or not state then
                                CastLine()
                            end
                        end
                    end)
                end
            end)
        end
    end
})
Other:AddSection("Quest Dragon")
Other:AddToggle({
    Name = "Auto Claim Dojo Belt",
    Default = false,
    Callback = function(Value)
        getgenv().DojoClaimQuest = Value
        StopTween(getgenv().DojoClaimQuest)
    end
})
local DojoQuestNpc = CFrame.new(5855.19629, 1208.32178, 872.713501,0.606994748, -1.81058823e-09, -0.794705868,5.72712722e-09, 1, 2.09605577e-09,0.794705868, -5.82367621e-09, 0.606994748)
spawn(function()
    while wait() do
        if getgenv().DojoClaimQuest and World3 then
            pcall(function()
                topos(DojoQuestNpc)
                local distance = (DojoQuestNpc.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 5 then
                    local claimQuestTable = {
                        ["NPC"] = "Dojo Trainer",
                        ["Command"] = "ClaimQuest"
                    }
                    game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]:InvokeServer(claimQuestTable)
                    task.wait()
                    local requestQuestTable = {
                        ["NPC"] = "Dojo Trainer",
                        ["Command"] = "RequestQuest"
                    }
                    game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]:InvokeServer(requestQuestTable)
                end
            end)
        end
    end
end)
Other:AddToggle({
    Name = "Auto Claim Upgrade Dragon Talon",
    Default = false,
    Callback = function(Value)
        getgenv().DragonTalonUpgrade = Value
        StopTween(getgenv().DragonTalonUpgrade)
    end
})
spawn(function()
    while wait() do
        if getgenv().DragonTalonUpgrade and World3 then
            local UzothNPC = CFrame.new(5661.89014, 1211.31909, 864.836731,0.811413169, -1.36805838e-08, -0.584473014,4.75227395e-08, 1, 4.25682458e-08,0.584473014, -6.23161966e-08, 0.811413169)
            local distance = (UzothNPC.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance > 5 then
                topos(UzothNPC)
            else
                local ohTable1 = {
                    ["NPC"] = "Uzoth",
                    ["Command"] = "Upgrade"
                }
                game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]:InvokeServer(ohTable1)
            end
        end
    end
end)
Other:AddToggle({
    Name = "Auto Collect Berry",
    Default = false,
    Callback = function(Value)
        getgenv().AutoCollectBerry = Value
        StopTween(getgenv().AutoCollectBerry)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoCollectBerry then
            local Player = Players.LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local Position = Character:GetPivot().Position
            local CollectionService = game:GetService("CollectionService")
            local BerryBushes = CollectionService:GetTagged("BerryBush")       
            local Distance, Nearest, BerryName = math.huge, nil, nil
            for i = 1, #BerryBushes do
                local Bush = BerryBushes[i]
                for AttributeName, Berry in pairs(Bush:GetAttributes()) do
                    local Magnitude = (Bush.Parent:GetPivot().Position - Position).Magnitude
                    if Magnitude < Distance then
                        Distance, Nearest, BerryName = Magnitude, Bush, Berry
                    end
                end
            end            
            if not Nearest and getgenv().AutoHopBerry then
                Hop()
            end         
            if Nearest then
                local BushPosition = Nearest.Parent:GetPivot().Position
                if (BushPosition - Position).Magnitude > 5 then
                    topos(CFrame.new(BushPosition))
                end
                for _, Berry in pairs(Nearest:GetChildren()) do
                    if Berry:FindFirstChild("ProximityPrompt") then
                        topos(Berry.WorldPivot)
                        fireproximityprompt(Berry.ProximityPrompt, math.huge)
                    end
                end
            end
        end
    end
end)
Other:AddToggle({
    Name = "Hop Find Berry",
    Default = false,
    Callback = function(Value)
        getgenv().AutoHopBerry = Value
    end
})
Other:AddSection("Farm Chest")
Other:AddToggle({
    Name = "Auto Chest",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarmChest = Value
        StopTween(getgenv().AutoFarmChest)
    end
})
local function HasChestInServer()
    for _, v in pairs(game:GetService("Workspace").ChestModels:GetChildren()) do
        if v:IsA("Model") and v.Name:find("Chest") then
            return true
        end
    end
    return false
end
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoFarmChest then
                if HasChestInServer() then
                    for _, chest in pairs(game:GetService("Workspace").ChestModels:GetChildren()) do
                        if chest:IsA("Model") and chest.Name:find("Chest") then
                            repeat
                                task.wait()
                                topos(chest.RootPart.CFrame)
                            until not chest.Parent or not getgenv().AutoFarmChest
                        end
                    end
                    topos(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                else
                    if getgenv().AutoFarmChestHop then
                        Hop()
                    end
                    wait(5)
                end
            end
        end)
    end
end)
Other:AddToggle({
    Name = "Auto Chest Hop",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarmChestHop = Value
    end
})
Other:AddSection("Raid Law")
Other:AddToggle({
    Name = "Auto Buy Chip And Attack Law",
    Default = false,
    Callback = function(Value)
        getgenv().AutoLaw = Value
        StopTween(getgenv().AutoLaw)
    end
})
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoLaw and World2 then
                local player = game:GetService("Players").LocalPlayer
                local char = player.Character
                local backpack = player.Backpack
                local enemies = game:GetService("Workspace").Enemies
                local replicated = game:GetService("ReplicatedStorage")
                if not char:FindFirstChild("Microchip") and
                   not backpack:FindFirstChild("Microchip") and
                   not enemies:FindFirstChild("Order") and
                   not replicated:FindFirstChild("Order") then
                    wait(0.3)
                    replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                    replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                end
                if not enemies:FindFirstChild("Order") and
                   not replicated:FindFirstChild("Order") then
                    if char:FindFirstChild("Microchip") or backpack:FindFirstChild("Microchip") then
                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                    end
                end
                if replicated:FindFirstChild("Order") or enemies:FindFirstChild("Order") then
                    if enemies:FindFirstChild("Order") then
                        for _, i in pairs(enemies:GetChildren()) do
                            if i.Name == "Order" then
                                repeat task.wait()
                                    Attack.Kill(i,getgenv().AutoLaw)
                                until not i.Parent or i.Humanoid.Health <= 0 or getgenv().AutoLaw == false
                            end
                        end
                    elseif replicated:FindFirstChild("Order") then
                        topos(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                    end
                end
            end
        end
    end)
end)
Other:AddSection("Farm Observation")
local ObservationRange = Other:AddParagraph({
    Title = "Observation Level",
    Desc = ""
})
spawn(function()
    local lastValue = game:GetService("Players").LocalPlayer.VisionRadius.Value
    while wait() do
        pcall(function()
            local currentValue = game:GetService("Players").LocalPlayer.VisionRadius.Value
            if currentValue ~= lastValue then
                ObservationRange:SetDesc("Observation Range Level: " .. math.floor(currentValue))
                lastValue = currentValue
            end
        end)
    end
end)
Other:AddToggle({
    Name = "Auto UP Observation V2",
    Default = false,
    Callback = function(Value)
        getgenv().AutoObservationHakiV2 = Value
        StopTween(getgenv().AutoObservationHakiV2)
    end
})
local LocalPlayer = Players.LocalPlayer
local replicated = ReplicatedStorage
local plr = LocalPlayer
spawn(function()
    while wait() do
        if getgenv().AutoObservationHakiV2 then
            pcall(function()
                local Kv2Pos1 = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
                local Kv2Pos2 = "Kuy"
                local Kv2Pos3 = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
                local Kv2Pos4 = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
                local Kv2Pos5 = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)
                if plr.PlayerGui.Main.Quest.Visible == true 
                    and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates") then
                    local v = GetConnectionEnemies("Forest Pirate")
                    if v then
                        repeat task.wait()
                            Attack.Kill(v,getgenv().AutoObservationHakiV2)
                        until not getgenv().AutoObservationHakiV2 or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        topos(Kv2Pos4)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true then
                    local v = GetConnectionEnemies("Captain Elephant")
                    if v then
                        repeat task.wait()
                            Attack.Kill(v,getgenv().AutoObservationHakiV2)
                        until not getgenv().AutoObservationHakiV2 or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        topos(Kv2Pos5)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == false then
                    replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                    wait(.1)
                    replicated.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                end
                if replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
                    topos(CFrame.new(-12513.51953125, 340.1137390136719, -9873.048828125))
                end
                if not plr.Backpack:FindFirstChild("Fruit Bowl") 
                    or not plr.Character:FindFirstChild("Fruit Bowl") then
                    if not GetBP("Fruit Bowl") then
                        if not GetBP("Apple") then
                            for i, v in pairs(workspace:GetDescendants()) do
                                if v.Name == "Apple" then
                                    v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                    wait()
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 0)
                                    wait()
                                end
                            end
                        elseif not GetBP("Banana") then
                            topos(CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125))
                            for i, v in pairs(workspace:GetDescendants()) do
                                if v.Name == "Banana" then
                                    v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                    wait()
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 0)
                                    wait()
                                end
                            end
                        elseif not GetBP("Pineapple") then
                            topos(CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625))
                            for i, v in pairs(workspace:GetDescendants()) do
                                if v.Name == "Pineapple" then
                                    v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                    wait()
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 0)
                                    wait()
                                end
                            end
                        end
                    end
                    if (plr.Backpack:FindFirstChild("Banana") and plr.Backpack:FindFirstChild("Apple") and plr.Backpack:FindFirstChild("Pineapple"))
                        or (plr:FindFirstChild("Banana") and plr:FindFirstChild("Apple") and plr:FindFirstChild("Pineapple")) then
                        repeat task.wait()
                            topos(Kv2Pos1)
                        until getgenv().AutoObservationHakiV2 or plr.Character.HumanoidRootPart.CFrame == Kv2Pos1           
                        replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                    end
                end
                if plr.Backpack:FindFirstChild("Fruit Bowl") or plr.Character:FindFirstChild("Fruit Bowl") then
                    if plr.Character.HumanoidRootPart.CFrame ~= Kv2Pos3 then
                        topos(Kv2Pos3)
                    elseif plr.Character.HumanoidRootPart.CFrame == Kv2Pos3 then
                        replicated.Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                        wait(.1)
                        replicated.Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
                    end
                end
            end)
        end
    end
end)
Other:AddToggle({
    Name = "Farm Observation",
    Default = false,
    Callback = function(Value)
        getgenv().AutoObservation = Value
        StopTween(getgenv().AutoObservation)
    end
})
local Workspace = game:GetService("Workspace")
local TeleportService = game:GetService("TeleportService")
local replicated = ReplicatedStorage
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoObservation then
                replicated.Remotes.CommE:FireServer("Ken", true)
                if plr:GetAttribute("KenDodgesLeft") == 0 then
                    KenTest = false
                elseif plr:GetAttribute("KenDodgesLeft") > 0 then
                    replicated.Remotes.CommE:FireServer("Ken", true)
                    KenTest = true
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoObservation then
                if World1 then
                    local enemy = workspace.Enemies:FindFirstChild("Galley Captain")
                    if enemy then
                        if KenTest then
                            repeat task.wait()
                                plr.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                            until not getgenv().AutoObservation or not KenTest
                        else
                            repeat task.wait()
                                plr.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                            until not getgenv().AutoObservation or KenTest
                        end
                    else
                        if getgenv().AutoObservationHop then
                            TeleportService:Teleport(game.PlaceId, plr)
                            task.wait(5)
                        else
                            topos(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                        end
                    end
                elseif World2 then
                    local enemy = workspace.Enemies:FindFirstChild("Lava Pirate")
                    if enemy then
                        if KenTest then
                            repeat task.wait()
                                plr.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                            until not getgenv().AutoObservation or not KenTest
                        else
                            repeat task.wait()
                                plr.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                            until not getgenv().AutoObservation or KenTest
                        end
                    else
                        if getgenv().AutoObservationHop then
                            TeleportService:Teleport(game.PlaceId, plr)
                            task.wait(5)
                        else
                            topos(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                        end
                    end
                elseif World3 then
                    local enemy = workspace.Enemies:FindFirstChild("Venomous Assailant")
                    if enemy then
                        if KenTest then
                            repeat task.wait()
                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                            until not getgenv().AutoObservation or not KenTest
                        else
                            repeat task.wait()
                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                            until not getgenv().AutoObservation or KenTest
                        end
                    else
                        if getgenv().AutoObservationHop then
                            TeleportService:Teleport(game.PlaceId, plr)
                            task.wait(5)
                        else
                            topos(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                        end
                    end
                end
            end
        end)
    end
end)
Other:AddToggle({
    Name = "Farm Observation [ Hop Server ]",
    Default = false,
    Callback = function(Value)
        getgenv().AutoObservationHop = Value
    end
})
Other:AddSection("Auto Kill Mob")
if World1 then
    Other:AddDropdown({
        Name = "Select Mob",
        Default = false,
        Options = {
            "Bandit", "Monkey", "Gorilla", "Pirate", "Brute",
            "Desert Bandit", "Desert Officer", "Snow Bandit", "Snowman",
            "Chief Petty Officer", "Sky Bandit", "Dark Master", "Toga Warrior",
            "Gladiator", "Military Soldier", "Military Spy",
            "Fishman Warrior", "Fishman Commando",
            "God's Guard", "Shanda", "Royal Squad", "Royal Soldier",
            "Galley Pirate", "Galley Captain",
        },
        Callback = function(Value)
            getgenv().SelectMob = Value
        end
    })
end
if World2 then
    Other:AddDropdown({
        Name = "Select Mob",
        Default = false,
        Options = {
            "Raider", "Mercenary", "Swan Pirate", "Factory Staff",
            "Marine Lieutenant", "Marine Captain", "Zombie", "Vampire",
            "Snow Trooper", "Winter Warrior", "Lab Subordinate",
            "Horned Warrior", "Magma Ninja", "Lava Pirate",
            "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer",
            "Arctic Warrior", "Snow Lurker", "Sea Soldier", "Water Fighter",
        },
        Callback = function(Value)
            getgenv().SelectMob = Value
        end
    })
end
if World3 then
    Other:AddDropdown({
        Name = "Select Mob",
        Default = false,
        Options = {
            "Pirate Millionaire", "Dragon Crew Warrior", "Dragon Crew Archer",
            "Female Islander", "Giant Islander", "Marine Commodore",
            "Marine Rear Admiral", "Fishman Raider", "Fishman Captain",
            "Forest Pirate", "Mythological Pirate", "Jungle Pirate",
            "Musketeer Pirate", "Reborn Skeleton", "Living Zombie",
            "Demonic Soul", "Posessed Mummy", "Peanut Scout",
            "Peanut President", "Ice Cream Chef", "Ice Cream Commander",
            "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker",
            "Cocoa Warrior", "Chocolate Bar Battler", "Sweet Thief",
            "Candy Rebel", "Candy Pirate", "Snow Demon", "Isle Outlaw",
            "Island Boy", "Sun-kissed Warrior", "Isle Champion",
        },
        Callback = function(Value)
            getgenv().SelectMob = Value
        end
    })
end
Other:AddToggle({
    Name = "Kill Mob",
    Default = false,
    Callback = function(Value)
        getgenv().AutoKillMob = Value
        StopTween(getgenv().AutoKillMob)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoKillMob then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(getgenv().SelectMob) then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == getgenv().SelectMob then
                            if v:FindFirstChild("Humanoid")
                            and v:FindFirstChild("HumanoidRootPart")
                            and v.Humanoid.Health > 0 then                                
                                repeat
                                    game:GetService("RunService").Heartbeat:Wait()
                                    Attack.Kill(v,getgenv().AutoKillMob)
                                until not getgenv().AutoKillMob or not v.Parent or v.Humanoid.Health <= 0                                
                            end
                        end
                    end
                end
            end)
        end
    end
end)
Other:AddSection("Auto Boss")
BossList = {}
if World1 then
    BossList = {
        "The Gorilla King", "Bobby", "Yeti", "Mob Leader", "Vice Admiral",
        "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord",
        "Wysper", "Thunder God", "Cyborg", "Saber Expert"
    }
elseif World2 then
    BossList = {
        "Diamond", "Jeremy", "Orbitus", "Don Swan", "Smoke Admiral",
        "Cursed Captain", "Darkbeard", "Order", "Awakened Ice Admiral", "Tide Keeper"
    }
elseif World3 then
    BossList = {
        "Stone", "Island Empress", "Kilo Admiral", "Captain Elephant",
        "Beautiful Pirate", "rip_indra True Form", "Longma", "Soul Reaper",
        "Cake Queen", "Cake Prince", "Dough King"
    }
end
Other:AddDropdown({
    Name = "Select Boss",
    Options = BossList,
    Callback = function(Value)
        getgenv().SelectBoss = Value
    end
})
Other:AddToggle({
    Name = "Auto Kill Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoKillBoss = Value
        StopTween(getgenv().AutoKillBoss)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoKillBoss then
            pcall(function()
                local boss = game:GetService("Workspace").Enemies:FindFirstChild(getgenv().SelectBoss)
                if boss then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == getgenv().SelectBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                Attack.Kill(v,getgenv().AutoKillBoss)
                            until not getgenv().AutoKillBoss or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    local bossInRep = game:GetService("ReplicatedStorage"):FindFirstChild(getgenv().SelectBoss)
                    if bossInRep and bossInRep:FindFirstChild("HumanoidRootPart") then
                        topos(bossInRep.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    end
                end
            end)
        end
    end
end)
Other:AddToggle({
    Name = "Auto Kill All Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoKillAllBoss = Value
        StopTween(getgenv().AutoKillAllBoss)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoKillAllBoss then
            pcall(function()
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if (v.Name == "rip_indra" or v.Name == "Ice Admiral")
                        or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg")
                        or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Orbitus" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard")
                        or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 17000 then
                            repeat
                                task.wait()
                                Attack.Kill(v,getgenv().AutoKillAllBoss)
                            until v.Humanoid.Health <= 0 or getgenv().AutoKillAllBoss == false or not v.Parent
                        end
                    else
                        if getgenv().AutoKillAllBossHop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)
Other:AddToggle({
    Name = "Auto Kill All Boss [ Hop Server ]",
    Default = false,
    Callback = function(Value)
        getgenv().AutoKillAllBossHop = Value
    end
})
FruitRaid:AddToggle({
    Name = "Random Devil Fruit",
    Default = false,
    Callback = function(Value)
        getgenv().RandomDevilFruit = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().RandomDevilFruit then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
        end
    end
end)
FruitRaid:AddToggle({
    Name = "Auto Drop Fruit",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDropFruit = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoDropFruit then
            pcall(function()
                DropFruits()
            end)
        end
    end
end)
FruitRaid:AddToggle({
    Name = "Auto Store Fruit",
    Default = false,
    Callback = function(Value)
        getgenv().AutoStoreFruit = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoStoreFruit then
            pcall(function()
                UpdStFruit()
            end)
        end
    end
end)
FruitRaid:AddDropdown({
    Name = "Blox Fruit Sniper Shop",
    Options = {
        "Rocket-Rocket", "Spin-Spin", "Blade-Blade", "Spring-Spring",
        "Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame",
        "Ice-Ice", "Sand-Sand", "Dark-Dark", "Eagle-Eagle",
        "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Ghost-Ghost",
        "Magma-Magma", "Quake-Quake", "Buddha-Buddha", "Love-Love",
        "Creation-Creation", "Spider-Spider", "Sound-Sound", "Phoenix-Phoenix",
        "Portal-Portal", "Lightning-Lightning", "Pain-Pain", "Blizzard-Blizzard",
        "Gravity-Gravity", "T-Rex-T-Rex", "Mammoth-Mammoth", "Dough-Dough",
        "Shadow-Shadow", "Venom-Venom", "Gas-Gas", "Control-Control",
        "Spirit-Spirit", "Leopard-Leopard", "Yeti-Yeti", "Kitsune-Kitsune",
        "Dragon-Dragon"
    },
    Callback = function(Value)
        getgenv().SelectFruit = Value
    end
})
FruitRaid:AddToggle({
    Name = "Buy Blox Fruit Sniper Shop",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBuyFruitSniper = Value
    end
})
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoBuyFruitSniper then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", getgenv().SelectFruit)
            end
        end
    end)
end)
FruitRaid:AddSection("Raids")
FruitRaid:AddDropdown({
    Name = "Select Raid",
    Options  = {
        "Dark", "Sand", "Magma", "Flame",
        "Ice", "Light", "Quake", "Buddha",
        "Spider","Phoenix","Dough"
    },
    Callback = function(Value)
        getgenv().SelectChip = Value
    end
})
FruitRaid:AddToggle({
    Name = "Get Fruit In Inventory Low Beli",
    Default = false,
    Callback = function(Value)
        getgenv().AutoGetFruit = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoGetFruit then
                local fruits = {
                    "Rocket-Rocket", "Spin-Spin", "Chop-Chop", "Spring-Spring", "Bomb-Bomb", "Smoke-Smoke",
                    "Spike-Spike", "Flame-Flame", "Falcon-Falcon", "Ice-Ice", "Sand-Sand", "Dark-Dark",
                    "Ghost-Ghost", "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Barrier-Barrier"
                }
                for _, fruit in ipairs(fruits) do
                    local args = {
                        [1] = "LoadFruit",
                        [2] = fruit
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end)
    end
end)
FruitRaid:AddButton({
    Name = "Buy Chip",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", getgenv().SelectChip)
    end
})
FruitRaid:AddToggle({
    Name = "Auto Start Raid",
    Default = false,
    Callback = function(Value)
        getgenv().AutoStartRaid = Value
        StopTween(getgenv().AutoStartRaid)
    end
})
local plr = game.Players.LocalPlayer
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoStartRaid then
                if plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
                    if GetBP("Special Microchip") then
                        if World2 then
                            topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                            fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif World3 then
                            topos(CFrame.new(-5097.93164, 316.447021, -3142.66602,-0.405007899, -4.31682743e-08, 0.914313197,-1.90943332e-08, 1, 3.8755779e-08,-0.914313197, -1.76180437e-09, -0.405007899))
                            fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)
FruitRaid:AddToggle({
    Name = "Auto Farm Raid",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDungeon = Value
        StopTween(getgenv().AutoDungeon)
    end
})
function IsIslandRaid(cu)
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local nearest, min = nil, math.huge
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        if v.Name == "Island " .. cu then
            local dist = (v.Position - hrp.Position).Magnitude
            if dist < min then
                min = dist
                nearest = v
            end
        end
    end
    return nearest
end
function getNextIsland()
    local TableIslandsRaid = {5, 4, 3, 2, 1}
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, num in pairs(TableIslandsRaid) do
        local island = IsIslandRaid(num)
        if island and (island.Position - hrp.Position).Magnitude <= 4500 then
            return island
        end
    end
end
function attackNearbyEnemies()
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
        if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
            local dist = (enemy.HumanoidRootPart.Position - hrp.Position).Magnitude
            if dist <= 1000 then
                while getgenv().AutoDungeon and enemy and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 do
                    pcall(function()
                        Attack.Kill(enemy, true)
                    end)
                    task.wait(0.1)
                end
            end
        end
    end
end
spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().AutoDungeon then
                local player = game.Players.LocalPlayer
                local raidUI = player:WaitForChild("PlayerGui"):WaitForChild("Main").TopHUDList.RaidTimer
                if raidUI and raidUI.Visible then
                    attackNearbyEnemies()
                    local nextIsland = getNextIsland()
                    if nextIsland then
                        topos(nextIsland.CFrame * CFrame.new(0, 60, 0))
                    end
                end
            end
        end)
    end
end)
FruitRaid:AddToggle({
    Name = "Auto Awaken Fruit",
    Default = false,
    Callback = function(Value)
        getgenv().AutoAwaken = Value
    end
})
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoAwaken then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Check")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end
        end
    end)
end)
FruitRaid:AddToggle({
    Name = "Auto Teleport To Lab",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTeleportLab = Value
        StopTween(getgenv().AutoTeleportLab)
        while getgenv().AutoTeleportLab do
            wait()
            if getgenv().AutoTeleportLab then
                if World2 and getgenv().AutoTeleportLab then
                    topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                elseif World3 and getgenv().AutoTeleportLab then
                    topos(CFrame.new(-5017.40869, 314.844055, -2823.0127,-0.925743818, 4.48217499e-08, -0.378151238,4.55503146e-09, 1, 1.07377559e-07,0.378151238, 9.7681621e-08, -0.925743818))
                end
            end
        end
    end
})
Event:AddButton({
    Name = "Remove Lighting Effect",
    Callback = function()
        game:GetService("Lighting").BaseAtmosphere:Destroy()
    end
})
Event:AddToggle({
    Name = "Ship Speed Modifier",
    Default = false,
    Callback = function(Value)
        getgenv().SpeedBoat = Value
    end
})
game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().SpeedBoat then
        local plr = game:GetService("Players").LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            if plr.Character.Humanoid.Sit then
                for _, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                    local seat = boat:FindFirstChildWhichIsA("VehicleSeat")
                    if seat then
                        seat.MaxSpeed = SetSpeedBoat
                    end
                end
            end
        end
    end
end)
Event:AddSlider({
    Name = "Ship Speed",
    Min = 0,
    Max = 1000,
    Increment = 1,
    Default = 300,
    Callback = function(Value)
        SetSpeedBoat = Value
    end
})
Event:AddToggle({
    Name = "Auto Press W",
    Default = false,
    Callback = function(Value)
        getgenv().AutoPressW = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoPressW then
                local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                if humanoid.Sit == true then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                end
            end
        end)
    end
end)
Event:AddToggle({
    Name = "No Clip Ship",
    Default = false,
    Callback = function(Value)
        getgenv().NoClipShip = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            for i, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                for _, v in pairs(boat:GetDescendants()) do
                    if v:IsA("BasePart") then
                        if getgenv().NoClipShip or getgenv().FindPrehistoric then
                            v.CanCollide = false
                        else
                            v.CanCollide = true
                        end
                    end
                end
            end
        end)
    end
end)
local Lighting = game:GetService("Lighting")
Event:AddDropdown({
    Name = "Select Method Time",
    Options = {"Day", "Night"},
    Callback = function(Value)
        getgenv().SelectDN = Value
    end
})
Event:AddToggle({
    Name = "Auto Turn On Time",
    Default = false,
    Callback = function(Value)
        getgenv().daylightN = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().daylightN then
            if getgenv().SelectDN == "Day" then
                Lighting.ClockTime = 12
            elseif getgenv().SelectDN == "Night" then
                Lighting.ClockTime = 0
            end
        end
    end
end)
Event:AddDropdown({
    Name = "Select Method NPC",
    Options = {"Spy", "Beast Hunter", "Shark Hunter", "Shipwright Teacher"},
    Default = "Spy",
    Callback = function(Value)
        getgenv().NpcMode = Value
    end
})
Event:AddToggle({
    Name = "Teleport To NPC",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportNpcSea = Value
        StopTween(getgenv().TeleportNpcSea)
    end
})
spawn(function()
    while wait() do
        if getgenv().TeleportNpcSea and World3 then
            local NpcList = getgenv().NpcMode
            if NpcList == "Spy" then
                topos(CFrame.new(-16470.1289, 528.018005, 539.729736,0.923504472, 0.14256525, -0.356110483,-0.12577644, 0.989586353, 0.0699937791,0.362380743, -0.0198492594, 0.931818783))
            elseif NpcList == "Beast Hunter" then
                topos(CFrame.new(-16282.7754, 72.8005219, 262.864899,0.999961197, 1.3790713e-09, -0.00881191809,-9.40171052e-10, 1, 4.98117245e-08,0.00881191809, -4.98015034e-08, 0.999961197))
            elseif NpcList == "Shark Hunter" then
                topos(CFrame.new(-16526.1348, 108.07634, 750.895447,-0.997955203, 9.56297868e-08, -0.0639176369,9.5004161e-08, 1, 1.28273223e-08,0.0639176369, 6.72865097e-09, -0.997955203))
            elseif NpcList == "Shipwright Teacher" then
                topos(CFrame.new(-16526, 78.5615463, 304.426758,-0.997302055, -0.0361390784, -0.0638951063,-0.0359273851, 0.999344468, -0.00445934385,0.0640143752, -0.00215172861, -0.99794668))
            end
        end
    end
end)
Event:AddToggle({
    Name = "Auto Drive Boats",
    Default = false,
    Callback = function(Value)
        getgenv().SailBoat = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().SailBoat then
                if not game:GetService("Workspace").Enemies:FindFirstChild("Shark") or not game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or not game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or not game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                    if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                        buyb = TPP(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))
                        if (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                            if buyb then buyb:Stop() end
                            local args = {
                                [1] = "BuyBoat",
                                [2] = "PirateBrigade"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    elseif game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                            TPP(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))
                        else
                            for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                if v.Name == "PirateBrigade" then
                                    repeat task.wait()
                                        if (CFrame.new(-17013.80078125, 10.962434768676758, 438.0169982910156).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPBSEA(CFrame.new(-37813.6953, -0.3221744, 6105.16895, -0.252362996, 4.13621581e-09, 0.967632651, 2.87320709e-08, 1, 3.21888249e-09, -0.967632651, 2.86144175e-08, -0.252362996))
                                        elseif (CFrame.new(-37813.6953, -0.3221744, 6105.16895, -0.252362996, 4.13621581e-09, 0.967632651, 2.87320709e-08, 1, 3.21888249e-09, -0.967632651, 2.86144175e-08, -0.252362996).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPBSEA(CFrame.new(-42250.2227, -0.3221744, 9247.07715, -0.45916447, 6.39043236e-08, 0.888351262, -3.36711423e-08, 1, -8.93395651e-08, -0.888351262, -7.09333605e-08, -0.45916447))
                                        elseif (CFrame.new(-42250.2227, -0.3221744, 9247.07715, -0.45916447, 6.39043236e-08, 0.888351262, -3.36711423e-08, 1, -8.93395651e-08, -0.888351262, -7.09333605e-08, -0.45916447).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPBSEA(CFrame.new(-37813.6953, -0.3221744, 6105.16895, -0.252362996, 4.13621581e-09, 0.967632651, 2.87320709e-08, 1, 3.21888249e-09, -0.967632651, 2.86144175e-08, -0.252362996))
                                        end 
                                    until game:GetService("Workspace").Enemies:FindFirstChild("Shark") or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") or getgenv().SailBoat == false
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().SailBoat then
                if game:GetService("Workspace").Enemies:FindFirstChild("Shark") or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
            end
        end
    end)
end)
Event:AddToggle({
    Name = "Auto Kill Terror Shark",
    Default = false,
    Callback = function(Value)
        getgenv().Autoterrorshark = Value
        StopTween(getgenv().Autoterrorshark)
    end
})
spawn(function()
    while wait() do
        if getgenv().Autoterrorshark and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                or game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                or game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Terrorshark" then
                            if v:FindFirstChild("Humanoid")
                            and v:FindFirstChild("HumanoidRootPart")
                            and v.Humanoid.Health > 0 then                                
                                repeat task.wait() 
                                    Attack.KillSea(v,getgenv().Autoterrorshark)                            
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false                  
                                until not getgenv().Autoterrorshark or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    topos(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, -1, 0))         
                    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                        if v.Name == "Terrorshark" then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        else
                            game:GetService("Workspace").Boats.VehicleSeat.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
        end
    end
end)
Event:AddToggle({
    Name = "Auto Kill Shark",
    Default = false,
    Callback = function(Value)
        getgenv().KillShark = Value
        StopTween(getgenv().KillShark)
    end
})      
spawn(function()
    while wait() do
        if getgenv().KillShark and World3 and getgenv().SailBoat then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                or game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Shark" then
                            if v:FindFirstChild("Humanoid")
                            and v:FindFirstChild("HumanoidRootPart")
                            and v.Humanoid.Health > 0 then                                
                                repeat task.wait()
                                    Attack.Kill(v,getgenv().KillShark)
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not getgenv().KillShark or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    topos(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, -1, 0))          
                    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                        if not v.Name == "Shark" then
                            game:GetService("Workspace").Boats.VehicleSeat.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        elseif v.Name == "Shark" then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end
            end)
        end
    end
end)
Event:AddToggle({
    Name = "Auto Kill Piranha",
    Default = false,
    Callback = function(Value)
        getgenv().KillPiranha = Value
        StopTween(getgenv().KillPiranha)
    end
})
spawn(function()
    while wait() do 
        if getgenv().KillPiranha and World3 then
            pcall(function()                 
                if game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                or game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Piranha" then
                            if v:FindFirstChild("Humanoid") 
                            and v:FindFirstChild("HumanoidRootPart") 
                            and v.Humanoid.Health > 0 then                                
                                repeat task.wait()
                                    Attack.Kill(v,getgenv().KillPiranha)
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not getgenv().KillPiranha or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    topos(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, -1, 0))          
                    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                        if not v.Name == "Piranha" then
                            game:GetService("Workspace").Boats.VehicleSeat.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        elseif v.Name == "Piranha" then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))   
                        end
                    end
                end
            end)
        end
    end
end)
Event:AddToggle({
    Name = "Auto Kill Fish Crew Member",
    Default = false,
    Callback = function(Value)
        getgenv().KillFishCrew = Value
        StopTween(getgenv().KillFishCrew)
    end
})
spawn(function()
    while wait() do
        if getgenv().KillFishCrew and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                or game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                or game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic") then   
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Fish Crew Member" then
                            if v:FindFirstChild("Humanoid")
                            and v:FindFirstChild("HumanoidRootPart")
                            and v.Humanoid.Health > 0 then                                
                                repeat task.wait()
                                    Attack.Kill(v,getgenv().KillFishCrew)
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not getgenv().KillFishCrew or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    topos(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, -1, 0))          
                    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                        if not v.Name == "Fish Crew Member" then
                            game:GetService("Workspace").Boats.VehicleSeat.CFrame =
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
        end
    end
end)
Event:AddSection("Kitsune Event")
Event:AddToggle({
    Name = "Teleport To Kitsune Island",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportToKitsuneIsland = Value
        StopTween(getgenv().TeleportToKitsuneIsland)
    end
})
spawn(function()
    while wait() do
        if getgenv().TeleportToKitsuneIsland then
            local map = game:GetService("Workspace").Map
            local kitsuneIsland = map:FindFirstChild("KitsuneIsland")
            if kitsuneIsland then
                local shrinePart = kitsuneIsland.ShrineActive.NeonShrinePart
                topos(shrinePart.CFrame * CFrame.new(0, 0, 10))
            end
        end
    end
end)
Event:AddToggle({
    Name = "Auto Start Kitsune Island",
    Default = false,
    Callback = function(Value)
        getgenv().AutoStartKitsune = Value
        StopTween(getgenv().AutoStartKitsune)
    end
})
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        if getgenv().AutoStartKitsune then
            pcall(function()
                local kit_is = workspace.Map:FindFirstChild("KitsuneIsland") or game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
                if not kit_is then return end
                local shrineActive = kit_is:FindFirstChild("ShrineActive")
                if shrineActive then
                    for _, v in next, shrineActive:GetDescendants() do
                        if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
                            replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
                            repeat
                                task.wait()
                                topos(v.CFrame * CFrame.new(0,2,0))
                            until not getgenv().AutoStartKitsune or not kit_is
                        end
                    end
                else
                    local kitsuneIsland = workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
                    if kitsuneIsland then
                        topos(kitsuneIsland.CFrame * CFrame.new(0,500,0))
                    end
                end
            end)
        end
    end
end)
Event:AddToggle({
    Name = "Auto Collect Azure Wisp",
    Default = false,
    Callback = function(Value)
        getgenv().CollectAzure = Value
        StopTween(getgenv().CollectAzure)
    end
})
spawn(function()
    while wait() do
        if getgenv().CollectAzure then
            pcall(function()
                local workspace = game:GetService("Workspace")
                local attachedAzure = workspace:FindFirstChild("AttachedAzureEmber")
                local emberTemplate = workspace:FindFirstChild("EmberTemplate")
                if attachedAzure and emberTemplate then
                    local part = emberTemplate:FindFirstChild("Part")
                    if part then
                        local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        local targetPos = part.Position
                        if (playerPos - targetPos).Magnitude > 10 then
                            topos(part.CFrame)
                        end
                    end
                end
            end)
        end
    end
end)
Event:AddSlider({
    Name = "Set Azure Ember",
    Min = 0,
    Max = 25,
    Increment = 5,
    Default = 20,
    Callback = function(Value)
        getgenv().SetToTradeAureEmber = Value
    end
})
Event:AddToggle({
    Name = "Auto Trade Azure Ember",
    Default = false,
    Callback = function(Value)
        getgenv().TradeAureEmber = Value
    end
})
function GetCountMaterials(MaterialName)
    local Inventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
    for _, v in pairs(Inventory) do
        if v.Name == MaterialName then
            return v["Count"]
        end
    end
    return 0
end
spawn(function()
    while wait() do
        if getgenv().TradeAureEmber then
            pcall(function()
                local AzureAvailable = GetCountMaterials("Azure Ember")
                if AzureAvailable >= getgenv().SetToTradeAureEmber then
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KitsuneStatuePray")
                    task.wait(5)
                end
            end)
        end
    end
end)
Event:AddButton({
    Name = "Trade Azure Wisp",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer()
    end
})
Event:AddSection("Frozen Dimension Event")
Event:AddButton({
    Name = "Craft Leviathan Crown",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CraftItem", "Craft", "LeviathanCrown")
    end
})
Event:AddButton({
    Name = "Craft Leviathan Shield",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CraftItem", "Craft", "LeviathanShield")
    end
})
Event:AddButton({
    Name = "Craft Leviathan Boat",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CraftItem", "Craft", "LeviathanBoat")
    end
})
Event:AddButton({
    Name = "Buy Spy",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
    end
})
Event:AddToggle({
    Name = "Teleport To Frozen Dimension",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportFrozenDimension = Value
        StopTween(getgenv().TeleportFrozenDimension)
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().TeleportFrozenDimension and World3 then
                local frozenDim = game:GetService("Workspace").Map:FindFirstChild("FrozenDimension")
                if frozenDim then
                    local targetPos = frozenDim.Center.Position
                    local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    if (playerPos - Vector3.new(targetPos.X, 500, targetPos.Z)).Magnitude > 10 then
                        topos(CFrame.new(targetPos.X, 500, targetPos.Z))
                    end
                end
            end
        end)
    end
end)
Event:AddToggle({
    Name = "Auto Attack Leviathan [ Beta ]",
    Default = false,
    Callback = function(Value)
        getgenv().AutoAttackLeviathan = Value
        StopTween(getgenv().AutoAttackLeviathan)
    end
})
local plr = game.Players.LocalPlayer
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoAttackLeviathan then
                if workspace.SeaBeasts:FindFirstChild("Leviathan") then
                    for _, b in pairs(workspace.SeaBeasts:GetChildren()) do
                        if b:FindFirstChild("HumanoidRootPart") 
                        and b:FindFirstChild("Leviathan Segment") 
                        and b:FindFirstChild("Health") 
                        and b.Health.Value > 0 then                            
                            repeat task.wait()
                                spawn(function()
                                    topos(CFrame.new(b.HumanoidRootPart.Position.X,game.Workspace.Map["WaterBase-Plane"].Position.Y + 200,b.HumanoidRootPart.Position.Z))
                                end)
                                if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position) <= 500 then
                                    MousePos = b:FindFirstChild("Leviathan Segment").Position
                                    if CheckF() then
                                        weaponSc("Blox Fruit")
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                    else
                                        Useskills("Melee", "Z")
                                        Useskills("Melee", "X")
                                        Useskills("Melee", "C")
                                        wait(.1)
                                        Useskills("Sword", "Z")
                                        Useskills("Sword", "X")
                                        wait(.1)
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                        wait(.1)
                                        Useskills("Gun", "Z")
                                        Useskills("Gun", "X")
                                    end
                                end
                            until getgenv().AutoAttackLeviathan == false or not b:FindFirstChild("HumanoidRootPart") or not b.Parent or b.Health.Value <= 0
                        end
                    end
                end
            end
        end)
    end
end)
Race:AddToggle({
    Name = "Teleport To Trial Draco",
    Default = false,
    Callback = function(Value)
        getgenv().TrialTeleportDraco = Value
        StopTween(getgenv().TrialTeleportDraco)
    end
})
spawn(function()
    while wait() do
        if getgenv().TrialTeleportDraco and World3 then
            local map = workspace:FindFirstChild("Map")
            if map then
                local island = map:FindFirstChild("PrehistoricIsland")
                if island then
                    local trialTeleport = island:FindFirstChild("TrialTeleport")
                    if trialTeleport and trialTeleport:IsA("Part") then
                        topos(CFrame.new(trialTeleport.Position))
                        local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - trialTeleport.Position).Magnitude
                        if distance <= 1 then
                            getgenv().TrialTeleportDraco = false
                        end
                    end
                end
            end
        end
    end
end)
Race:AddToggle({
    Name = "Auto Trial Draco [ Beta ]",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTrialDracoBeta = Value
        StopTween(getgenv().AutoTrialDracoBeta)
    end
})
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        if getgenv().AutoTrialDracoBeta then
            pcall(function()
                local Root = getRoot()
                if not Root then return end
                if workspace.Map:FindFirstChild("DracoTrial") then
                    replicated.Remotes.DracoTrial:InvokeServer()
                    wait(0.5)
                    repeat
                        task.wait()
                        topos(CFrame.new(-39934.9765625, 10685.359375, 22999.34375))
                    until not getgenv().AutoTrialDracoBeta or (Root.Position - Vector3.new(-39934.9765625, 10685.359375, 22999.34375)).Magnitude < 2
                    repeat
                        task.wait()
                        topos(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625))
                    until not getgenv().AutoTrialDracoBeta or (Root.Position - Vector3.new(-40511.25390625, 9376.4013671875, 23458.37890625)).Magnitude < 2
                    wait(2.5)
                    repeat
                        task.wait()
                        topos(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375))
                    until not getgenv().AutoTrialDracoBeta or (Root.Position - Vector3.new(-39914.65625, 10685.384765625, 23000.177734375)).Magnitude < 2
                    repeat
                        task.wait()
                        topos(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375))
                    until not getgenv().AutoTrialDracoBeta or (Root.Position - Vector3.new(-40045.83203125, 9376.3984375, 22791.287109375)).Magnitude < 2
                    wait(2.5)
                    repeat
                        task.wait()
                        topos(CFrame.new(-39908.5, 10685.4052734375, 22990.04296875))
                    until not getgenv().AutoTrialDracoBeta or (Root.Position - Vector3.new(-39908.5, 10685.4052734375, 22990.04296875)).Magnitude < 2
                    repeat
                        task.wait()
                        topos(CFrame.new(-39609.5, 9376.400390625, 23472.94335975))
                    until not getgenv().AutoTrialDracoBeta or (Root.Position - Vector3.new(-39609.5, 9376.400390625, 23472.94335975)).Magnitude < 2
                else
                    local drago = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
                    if drago and drago:IsA("Part") then
                        topos(CFrame.new(drago.Position))
                    end
                end
            end)
        end
    end
end)
Race:AddToggle({
    Name = "Auto Train Draco",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTrainDraco = Value
        StopTween(getgenv().AutoTrainDraco)
    end
})
local replicated = game:GetService("ReplicatedStorage")
local vim1 = game:GetService("VirtualInputManager")
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoTrainDraco then
                local DragoM = {"Venomous Assailant", "Hydra Enforcer"}  
                for i = 1, #DragoM do
                    local raceEnergy = plr.Character:FindFirstChild("RaceEnergy")
                    local raceTransformed = plr.Character:FindFirstChild("RaceTransformed")
                    if raceEnergy and raceEnergy.Value == 1 then
                        vim1:SendKeyEvent(true, "Y", false, game)
                        replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy", 2)
                        topos(CFrame.new(4620.6157, 1002.2954, 399.0868))
                    elseif raceTransformed and raceTransformed.Value == false then
                        local v = GetConnectionEnemies(DragoM)
                        if v then
                            repeat
                                task.wait()
                                Attack.Kill(v, getgenv().AutoTrainDraco)
                            until not getgenv().AutoTrainDraco or not v.Parent or v.Humanoid.Health <= 0
                        else
                            topos(CFrame.new(4620.6157, 1002.2954, 399.0868))
                        end
                    end
                end
            end
        end)
    end
end)
Race:AddToggle({
    Name = "Auto Draco V2",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDracoV2 = Value
        StopTween(getgenv().AutoDracoV2)
    end
})
local vim1 = game:GetService("VirtualInputManager")
spawn(function()
    while wait() do
        if getgenv().AutoDracoV2 and World3 then
            local FireFlower = workspace:FindFirstChild("FireFlowers")
            local v = GetConnectionEnemies("Forest Pirate")
            if v then
                repeat
                    task.wait()
                    Attack.Kill(v,getgenv().AutoDracoV2)
                until not getgenv().AutoDracoV2 or not v.Parent or v.Humanoid.Health <= 0 or FireFlower
            else
                topos(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
            end
            if FireFlower then
                for _, flower in pairs(FireFlower:GetChildren()) do
                    if flower:IsA("Model") and flower.PrimaryPart then
                        local FlowerPos = flower.PrimaryPart.Position
                        local playerRoot = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.HumanoidRootPart.Position
                        if playerRoot then
                            local Magnited = (FlowerPos - playerRoot).Magnitude
                            if Magnited <= 100 then
                                vim1:SendKeyEvent(true, "E", false, game)
                                task.wait(1.5)
                                vim1:SendKeyEvent(false, "E", false, game)
                            else
                                topos(CFrame.new(FlowerPos))
                            end
                        end
                    end
                end
            end
        end
    end
end)
Race:AddSection("Race Normal")
Race:AddDropdown({
    Name = "Select Race Upgrade",
    Options = {"Race Mink", "Race Human", "Race Skypiea", "Race FishMan"},
    Callback = function(Value)
        getgenv().UpgradeRaceMethod = Value
    end
})
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().UpgradeRaceMethod == "Race Mink" and getgenv().AutoUpgradeRace then
                if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= 2 then
                    if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                        replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
                    elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                        if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
                            topos(workspace.Flower1.CFrame)
                        elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
                            topos(workspace.Flower2.CFrame)
                        elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
                            local v = GetConnectionEnemies("Swan Pirate")
                            if v then
                                repeat 
                                    task.wait()
                                    Attack.Kill(v,getgenv().AutoUpgradeRace)
                                until GetBP("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or getgenv().AutoUpgradeRace == false
                            else
                                topos(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                            end
                        end
                    elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                        replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                    replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
                    getgenv().AutoFarmChest = true
                else
                    getgenv().AutoFarmChest = false
                end
            end
        end)
    end
end)
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().UpgradeRaceMethod == "Race Human" and getgenv().AutoUpgradeRace then
                if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= -2 then
                    if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                        replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
                    elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                        if not plr.Backpack:FindFirstChild("Flower 1") 
                        and not plr.Character:FindFirstChild("Flower 1") then
                            topos(workspace.Flower1.CFrame)
                        elseif not plr.Backpack:FindFirstChild("Flower 2") 
                        and not plr.Character:FindFirstChild("Flower 2") then
                            topos(workspace.Flower2.CFrame)
                        elseif not plr.Backpack:FindFirstChild("Flower 3") 
                        and not plr.Character:FindFirstChild("Flower 3") then
                            local v = GetConnectionEnemies("Swan Pirate")
                            if v then
                                repeat task.wait()
                                    Attack.Kill(v,getgenv().AutoUpgradeRace)
                                until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or getgenv().AutoUpgradeRace == false
                            else
                                topos(CFrame.new(980.0985, 121.3313, 1287.2093))
                            end
                        end
                    elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                        replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                    replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
                    local v = GetConnectionEnemies("Orbitus")
                    if v then
                        repeat task.wait()
                            Attack.Kill(v,getgenv().AutoUpgradeRace)
                        until v.Humanoid.Health <= 0 or not v.Parent or not getgenv().AutoUpgradeRace
                    else
                        topos(CFrame.new(-2172.74, 103.322, -4015.025))
                    end
                    local v = GetConnectionEnemies("Jeremy")
                    if v then
                        repeat task.wait()
                            Attack.Kill(v,getgenv().AutoUpgradeRace)
                        until v.Humanoid.Health <= 0 or not v.Parent or not getgenv().AutoUpgradeRace
                    else
                        topos(CFrame.new(2006.926, 448.957, 853.983))
                    end
                    local v = GetConnectionEnemies("Diamond")
                    if v then
                        repeat task.wait()
                            Attack.Kill(v,getgenv().AutoUpgradeRace)
                        until v.Humanoid.Health <= 0 or not v.Parent or not getgenv().AutoUpgradeRace
                    else
                        topos(CFrame.new(-1576.717, 198.593, 13.7243))
                    end
                end
            end
        end)
    end
end)
local replicated = game:GetService("ReplicatedStorage")
local plr = game.Players.LocalPlayer
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().UpgradeRaceMethod == "Race Skypiea" and getgenv().AutoUpgradeRace then
                if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= -2 then
                    if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                        replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
                    elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                        if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
                            topos(workspace.Flower1.CFrame)
                        elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
                            topos(workspace.Flower2.CFrame)
                        elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
                            local v = GetConnectionEnemies("Swan Pirate")
                            if v then
                                repeat
                                    task.wait()
                                    Attack.Kill(v,getgenv().AutoUpgradeRace)
                                until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or getgenv().AutoUpgradeRace == false
                            else
                                topos(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                            end
                        end
                    elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                        replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                    replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
                    for i, v in pairs(game.Players:GetChildren()) do
                        if v.Name ~= plr.Name and tostring(v.Data.Race.Value) == "Skypiea" then
                            repeat
                                task.wait()
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-45), 0, 0))
                            until v.Humanoid.Health <= 0 or getgenv().AutoUpgradeRace == false
                        end
                    end
                end
            end
        end)
    end
end)
local plr = game.Players.LocalPlayer
local replicated = game.ReplicatedStorage
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().UpgradeRaceMethod == "Race FishMan" and getgenv().AutoUpgradeRace then
                if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= -2 then
                    if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                        replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
                    elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                        if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
                            topos(workspace.Flower1.CFrame)
                        elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
                            topos(workspace.Flower2.CFrame)
                        elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
                            local v = GetConnectionEnemies("Swan Pirate")
                            if v then
                                repeat
                                    task.wait()
                                    Attack.Kill(v,getgenv().AutoUpgradeRace)
                                until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or getgenv().AutoUpgradeRace == false
                            else
                                topos(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                            end
                        end
                    elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                        replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                    replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                end
            end
        end)
    end
end)
Race:AddToggle({
    Name = "Auto Upgrade Race V2-V3",
    Default = false,
    Callback = function(Value)
        getgenv().AutoUpgradeRace = Value
        StopTween(getgenv().AutoUpgradeRace)
    end
})
Race:AddSection("Race V4")
Race:AddToggle({
    Name = "No Frog",
    Default = false,
    Callback = function(Value)
        getgenv().NoFrog = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().NoFrog and World3 then
                pcall(function()
                    local lighting = game:GetService("Lighting")
                    local lightingLayers = lighting:FindFirstChild("LightingLayers")
                    if lightingLayers then
                        lightingLayers:Destroy()
                    end
                    local sky = lighting:FindFirstChild("Sky")
                    if sky then
                        sky:Destroy()
                    end
                end)
            end
            task.wait(1)
            while not getgenv().NoFrog do
                task.wait(1)
            end
        end)
    end
end)
Race:AddToggle({
    Name = "Teleport Ancient Clock",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportAcientClock = Value
        StopTween(getgenv().TeleportAcientClock)
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().TeleportAcientClock then
                topos(CFrame.new(29549, 15069, -88))
            end
        end)
    end
end)
Race:AddToggle({
    Name = "Auto Buy Gear",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBuyGear = Value
    end
})
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoBuyGear and World3 then
                local args = {"UpgradeRace", "Buy"}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
            else
                repeat task.wait(1) until getgenv().AutoBuyGear
            end
        end
    end)
end)
Race:AddToggle({
    Name = "Auto Finish Train Quest",
    Default = false,
    Callback = function(Value)
        getgenv().Race_1 = Value
        getgenv().QuestTrain_2 = Value
        StopTween(getgenv().QuestTrain_2)
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Race_1 and game.Players.LocalPlayer.Character then
                local char = game.Players.LocalPlayer.Character
                if char:FindFirstChild("RaceTransformed") and char.RaceTransformed.Value then
                    getgenv().QuestTrain_2 = false
                    topos(CFrame.new(-9507.03125, 713.654968, 6186.39453))
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().QuestTrain_2 and World3 and game.Players.LocalPlayer.Character then
                local enemies = workspace:FindFirstChild("Enemies")
                if enemies then
                    for _, v in pairs(enemies:GetChildren()) do
                        if v:IsA("Model") and (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    Attack.Kill(v,getgenv().getgenv().QuestTrain_2)
                                until not getgenv().QuestTrain_2 or v.Parent == nil or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
                topos(CFrame.new(-9507.03125, 713.654968, 6186.39453))                
                local replicated = game:GetService("ReplicatedStorage")
                for _, v in pairs(replicated:GetChildren()) do
                    if v:IsA("Model") and (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") then
                        if v:FindFirstChild("HumanoidRootPart") then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Race_1 and game.Players.LocalPlayer.Character then
                local char = game.Players.LocalPlayer.Character
                if char:FindFirstChild("RaceTransformed") and not char.RaceTransformed.Value then
                    getgenv().QuestTrain_2 = true
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Race_1 and game.Players.LocalPlayer.Character then
                local char = game.Players.LocalPlayer.Character
                if char:FindFirstChild("RaceEnergy") and char.RaceEnergy.Value >= 1 and not char.RaceTransformed.Value then
                    local be = game:GetService("VirtualInputManager")
                    be:SendKeyEvent(true, "Y", false, game)
                    task.wait()
                    be:SendKeyEvent(false, "Y", false, game)
                end
            end
        end)
    end
end)
local CheckTier = Race:AddParagraph({
    Title = "Tiers Gear V4",
    Desc = ""
})
spawn(function()
    pcall(function()
        while wait() do
            CheckTier:SetDesc(" Tiers Gear - V4 : " .. plr.Data.Race.C.Value)
        end
    end)
end)
Race:AddToggle({
    Name = "Auto Pull Lever",
    Description = "Not Working Well Yet",
    Default = false,
    Callback = function(Value)
        getgenv().PullLever = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().PullLever then
            pcall(function()
                local temple = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Temple of Time")
                if temple then
                    for _, c in pairs(temple:GetDescendants()) do
                        if c:IsA("ProximityPrompt") then
                            fireproximityprompt(c, math.huge)
                        end
                    end
                end
            end)
        end
    end
end)
Race:AddButton({
    Name = "Talk With Stone",
    Callback = function()
        local remotes = replicated:WaitForChild("Remotes"):WaitForChild("CommF_")
        remotes:InvokeServer("RaceV4Progress", "Begin")
        remotes:InvokeServer("RaceV4Progress", "Check")
        remotes:InvokeServer("RaceV4Progress", "Teleport")
        remotes:InvokeServer("RaceV4Progress", "Continue")
    end
})
Race:AddToggle({
    Name = "Teleport To Migare Island",
    Default = false,
    Callback = function(Value)
        getgenv().TweenMigareIsland = Value
        StopTween(getgenv().TweenMigareIsland)
    end
})
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().TweenMigareIsland and World3 then
                local island = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if island and island:FindFirstChild("Center") then
                    local targetPos = island.Center.Position
                    local currentPos = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    if currentPos and (Vector3.new(targetPos.X, 500, targetPos.Z) - currentPos).magnitude > 5 then
                        topos(CFrame.new(targetPos.X, 500, targetPos.Z))
                    end
                end
            end
        end
    end)
end)
Race:AddToggle({
    Name = "Auto Teleport To Highest Point",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTeleportHighestPoint = Value
        StopTween(getgenv().AutoTeleportHighestPoint)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoTeleportHighestPoint then
            pcall(function()
                if workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island", true) then
                    topos(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 400, 0))
                end
            end)
        end
    end
end)
Race:AddToggle({
    Name = "Teleport To Advanced Fruit Dealer",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportAdvancedFruitDealer = Value
        StopTween(getgenv().TeleportAdvancedFruitDealer)
    end
})
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        if getgenv().TeleportAdvancedFruitDealer then
            pcall(function()
                for _, v in pairs(replicated.NPCs:GetChildren()) do
                    if v.Name == "Advanced Fruit Dealer" then
                        topos(v.HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)
Race:AddToggle({
    Name = "Teleport To Gear",
    Default = false,
    Callback = function(Value)
        getgenv().TweenToGear = Value
        StopTween(getgenv().TweenToGear)
    end
})
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().TweenToGear then
                for i, v in pairs(workspace.Map:FindFirstChild('MysticIsland'):GetChildren()) do
                    if v.Name == "Part" then
                        if v.ClassName == "MeshPart" then
                            topos(v.CFrame)
                        end
                    end
                end
            end
        end
    end)
end)
Race:AddToggle({
    Name = "Change Transparency Can See Gear",
    Default = false,
    Callback = function(Value)
        getgenv().AutoShowGear = Value
    end
})
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoShowGear then
                local mysticIsland = workspace.Map:FindFirstChild("MysticIsland")
                if mysticIsland then
                    for i, v in pairs(mysticIsland:GetChildren()) do
                        if v.Name == "Part" then
                            if v.ClassName == "MeshPart" then
                                v.Transparency = 0
                            else
                                v.Transparency = 1
                            end
                        end
                    end
                end
            end
        end
    end)
end)
Race:AddToggle({
    Name = "Look Moon And Use Race Skill",
    Default = false,
    Callback = function(Value)
        getgenv().LookMoonAndUseRaceSkill = Value
    end
})
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
function MoveCamtoMoon()
    local moonDirection = Vector3.new(0, 1, 0)
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + moonDirection)
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position, plr.Character.HumanoidRootPart.Position + moonDirection)
    end
end
spawn(function()
    while wait() do
        if getgenv().LookMoonAndUseRaceSkill then
            MoveCamtoMoon()
            task.wait(0.1)
            replicated.Remotes.CommE:FireServer("ActivateAbility")
        end
    end
end)
Race:AddButton({
    Name = "Teleport To Ancient Tree",
    Callback = function()
        topos(CFrame.new(28603.7305, 14896.5352, 105.38382))
        wait(0.4)
        local args = {
            [1] = "RaceV4Progress",
            [2] = "TeleportBack"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
Race:AddButton({
    Name = "Teleport Lever Pull",
    Callback = function()        
        topos(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end
})
Race:AddButton({
    Name = "Teleport Acient One",
    Callback = function()
        topos(CFrame.new(28981.552734375, 14888.4267578125, - 120.245849609375))
    end
})
Race:AddButton({
    Name = "Temple of Time",
    Callback = function()        
        topos(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586))
    end
})
Race:AddToggle({
    Name = "Auto Teleport To Trial Door",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportTrialDoor = Value
        StopTween(getgenv().TeleportTrialDoor)
    end
})
local plr = game.Players.LocalPlayer
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().TeleportTrialDoor and plr and plr:FindFirstChild("Data") and plr.Data:FindFirstChild("Race") then
                local race = tostring(plr.Data.Race.Value)
                if race == "Mink" then
                    topos(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
                elseif race == "Fishman" then
                    topos(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
                elseif race == "Cyborg" then
                    topos(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
                elseif race == "Skypiea" then
                    topos(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
                elseif race == "Ghoul" then
                    topos(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
                elseif race == "Human" then
                    topos(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
                end
            end
        end)
    end
end)
Race:AddToggle({
    Name = "Auto Trial Race",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTrialRace = Value
        StopTween(getgenv().AutoTrialRace)
    end
})
GetSeaBeastTrial = function()
    if not workspace.Map:FindFirstChild("FishmanTrial") then return nil end
    local FishmanTrial
    if workspace["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then
        FishmanTrial = workspace["_WorldOrigin"].Locations:FindFirstChild("Trial of Water")
    end
    if FishmanTrial then
        for _, v in next, workspace.SeaBeasts:GetChildren() do
            if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 then
                if v.Health.Value > 0 then
                    return v
                end
            end
        end
    end
end
local plr = game.Players.LocalPlayer
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoTrialRace and tostring(plr.Data.Race.Value) == "Mink" then
                topos(workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0, -20, 0))
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoTrialRace and tostring(plr.Data.Race.Value) == "Fishman" then
                if GetSeaBeastTrial() then
                    repeat
                        task.wait()
                        spawn(function()
                            local beastPos = GetSeaBeastTrial().HumanoidRootPart.Position
                            topos(CFrame.new(beastPos.X,workspace.Map["WaterBase-Plane"].Position.Y + 300,beastPos.Z))
                        end)
                        MousePos = GetSeaBeastTrial().HumanoidRootPart.Position
                        Useskills("Melee", "Z")
                        Useskills("Melee", "X")
                        Useskills("Melee", "C")
                        wait(0.1)
                        Useskills("Sword", "Z")
                        Useskills("Sword", "X")
                        wait(0.1)
                        Useskills("Blox Fruit", "Z")
                        Useskills("Blox Fruit", "X")
                        Useskills("Blox Fruit", "C")
                        wait(0.1)
                        Useskills("Gun", "Z")
                        Useskills("Gun", "X")
                    until getgenv().AutoTrialRace == false or not GetSeaBeastTrial()
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoTrialRace and tostring(plr.Data.Race.Value) == "Cyborg" then
                topos(workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0, 500, 0))
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoTrialRace and tostring(plr.Data.Race.Value) == "Skypiea" then
                topos(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoTrialRace and (tostring(plr.Data.Race.Value) == "Human" or tostring(plr.Data.Race.Value) == "Ghoul") then
                local v = GetConnectionEnemies{"Ancient Vampire", "Ancient Zombie"}
                if v then
                    repeat
                        task.wait()
                        Attack.Kill(v,getgenv().AutoTrialRace)
                    until getgenv().AutoTrialRace == false or not v.Parent or v.Humanoid.Health <= 0
                end
            end
        end)
    end
end)
Race:AddToggle({
    Name = "Auto Kill Player After Trial V4",
    Default = false,
    Callback = function(Value)
        getgenv().AutoKillPlayerAfterTrial = Value
        StopTween(getgenv().AutoKillPlayerAfterTrial)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoKillPlayerAfterTrial then
            pcall(function()
                for i, v in pairs(game.Workspace.Characters:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        if v:FindFirstChild("Humanoid")
                        and v.Humanoid.Health > 0
                        and v:FindFirstChild("HumanoidRootPart")
                        and v.Parent
                        and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 250 then                            
                            repeat task.wait()
                                EquipWeapon(getgenv().SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 15))
                                if getgenv().SkillTrialZ then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                    wait(0.1)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                                end
                                if getgenv().SkillTrialX then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                    wait(0.1)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                                end
                                if getgenv().SkillTrialC then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                    wait(0.1)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                                end
                            until getgenv().AutoKillPlayerAfterTrial == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
                        end
                    end
                end
            end)
        end
    end
end)
Race:AddToggle({
    Name = "Use Skill When Kill Player",
    Default = false,
    Callback = function(Value)
        getgenv().SkillTrialZ = Value
        getgenv().SkillTrialX = Value
        getgenv().SkillTrialC = Value
    end
})
Get:AddToggle({
    Name = "Auto Trade Bones",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTradeBone = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoTradeBone then
            local args = {
                [1] = "Bones",
                [2] = "Buy",
                [3] = 1,
                [4] = 1
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
Get:AddToggle({
    Name = "Auto Buy Legendary Sword",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBuyLegendarySword = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoBuyLegendarySword then
            pcall(function()
                local args1 = {
                    [1] = "LegendarySwordDealer",
                    [2] = "1"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1))
                local args2 = {
                    [1] = "LegendarySwordDealer",
                    [2] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args2))
                local args3 = {
                    [1] = "LegendarySwordDealer",
                    [2] = "3"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args3))
            end)
        end 
    end
end)
Get:AddToggle({
    Name = "Auto Buy Haki Color",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBuyHakiColor = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoBuyHakiColor then
            local args = {
                [1] = "ColorsDealer",
                [2] = "2"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
Get:AddToggle({
    Name = "Auto Teleport Legendary Sword Dealer",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTeleportLegendarySwordDealer = Value
        StopTween(getgenv().AutoTeleportLegendarySwordDealer)
    end
})
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        if getgenv().AutoTeleportLegendarySwordDealer and World2 then
            pcall(function()
                for _, v in pairs(replicated.NPCs:GetChildren()) do
                    if v.Name == "Legendary Sword Dealer" then
                        topos(v.HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)
Get:AddToggle({
    Name = "Auto Teleport Barista Cousin",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTeleportBaristaCousin = Value
        StopTween(getgenv().AutoTeleportBaristaCousin)
    end
})
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    while wait() do
        if getgenv().AutoTeleportBaristaCousin then
            pcall(function()
                for _, v in pairs(replicated.NPCs:GetChildren()) do
                    if v.Name == "Barista Cousin" then
                        topos(v.HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)
Get:AddToggle({
    Name = "Auto Get Rainbow Haki",
    Default = false,
    Callback = function(Value)
        getgenv().AutoRainBowHaki = Value
        StopTween(getgenv().AutoRainBowHaki)
    end
})
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoRainBowHaki then
                if plr.PlayerGui.Main.Quest.Visible == false then
                    if getgenv().AutoQuestRainBowHaki then
                        if plr.PlayerGui.Main.Quest.Visible == false then
                            replicated.Remotes.CommF_:InvokeServer("HornedMan","Bet")
                        end
                    else
                        local Rainbow1 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
                        if (plr.Character.HumanoidRootPart.CFrame ~= Rainbow1) then
                            topos(Rainbow1)
                        elseif (plr.Character.HumanoidRootPart.CFrame == Rainbow1) then
                            wait(1)
                            replicated.Remotes.CommF_:InvokeServer("HornedMan","Bet")
                        end
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true 
                    and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                    local v = GetConnectionEnemies("Stone")
                    if v then
                        repeat wait()
                            Attack.Kill(v,getgenv().AutoRainBowHaki) 
                        until getgenv().AutoRainBowHaki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        topos(CFrame.new(-1086.11621, 38.8425903, 6768.71436))
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true 
                    and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
                    local v = GetConnectionEnemies("Hydra Leader")
                    if v then
                        repeat task.wait()
                            Attack.Kill(v,getgenv().AutoRainBowHaki)
                        until getgenv().AutoRainBowHaki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        local framelong2 = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
                        topos(framelong2)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true 
                    and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                    local v = GetConnectionEnemies("Kilo Admiral")
                    if v then
                        repeat task.wait()
                            Attack.Kill(v,getgenv().AutoRainBowHaki)
                        until getgenv().AutoRainBowHaki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        topos(CFrame.new(2877.61743, 423.558685, -7207.31006))
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true 
                    and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                    local v = GetConnectionEnemies("Captain Elephant")
                    if v then
                        repeat task.wait()
                            Attack.Kill(v,getgenv().AutoRainBowHaki)
                        until getgenv().AutoRainBowHaki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        local gamergayror2 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
                        topos(gamergayror2)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true 
                    and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                    local v = GetConnectionEnemies("Captain Elephant")
                    if v then
                        repeat task.wait()
                            Attack.Kill(v,getgenv().AutoRainBowHaki)
                        until getgenv().AutoRainBowHaki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        topos(CFrame.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
                    end
                end
            end
        end
    end)
end)
Get:AddToggle({
    Name = "Auto Quest Get Rainbow Haki",
    Default = false,
    Callback = function(Value)
        getgenv().AutoQuestRainBowHaki = Value
    end
})
Get:AddToggle({
    Name = "Auto Skull Guitar",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSkullGuitar = Value
        StopTween(getgenv().AutoSkullGuitar)
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoSkullGuitar and World3 then
                local CommF_ = ReplicatedStorage.Remotes.CommF_
                CommF_:InvokeServer("gravestoneEvent", 2)
                CommF_:InvokeServer("gravestoneEvent", 2, true)
                local progress = CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
                if not progress then
                    CommF_:InvokeServer("gravestoneEvent", 2)
                    CommF_:InvokeServer("gravestoneEvent", 2, true)
                elseif not progress.Swamp then
                    local Enemies = workspace.Enemies
                    if Enemies:FindFirstChild("Living Zombie") then
                        for _, v in pairs(Enemies:GetChildren()) do
                            if v.Name == "Living Zombie" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    Attack.Kill(v,getgenv().AutoSkullGuitar)
                                until not getgenv().AutoSkullGuitar or v.Humanoid.Health <= 0 or not v.Parent or workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0)
                            end
                        end
                    else
                        topos(CFrame.new(-10170.73, 138.65, 5934.26))
                    end
                elseif not progress.Gravestones then
                    GetFirePlacard("7", "Left")
                    GetFirePlacard("6", "Left")
                    GetFirePlacard("5", "Left")
                    GetFirePlacard("4", "Right")
                    GetFirePlacard("3", "Left")
                    GetFirePlacard("2", "Right")
                    GetFirePlacard("1", "Right")
                elseif not progress.Ghost then
                    CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
                    CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
                elseif not progress.Trophies then
                    local Tablet = workspace.Map["Haunted Castle"].Tablet
                    local function clickSegment(segment)
                        local seg = Tablet[segment]
                        local line = seg.Line
                        repeat task.wait()
                            fireclickdetector(seg:FindFirstChild("ClickDetector"))
                        until line.Position.Y == -1000 or not getgenv().AutoSkullGuitar
                    end
                    clickSegment("Segment2")
                    clickSegment("Segment5")
                    clickSegment("Segment6")
                    clickSegment("Segment8")
                    clickSegment("Segment9")
                    for i = 1, 5 do
                        local segMap = {1, 3, 4, 7, 10}
                        local seg = Tablet["Segment" .. segMap[i]]
                        local rotation = seg.Line.Rotation.Z
                        local data = getTrophies(i)
                        if data[1] then
                            repeat task.wait()
                                fireclickdetector(seg:FindFirstChild("ClickDetector"))
                                rotation = seg.Line.Rotation.Z
                            until rotation == data[2] or rotation == getTrophies(1)[3] or not getgenv().AutoSkullGuitar or CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Trophies
                        end
                    end
                elseif not progress.Pipes then
                    local pipesPos = CFrame.new(-9628.027, 6.131, 6157.478)
                    topos(pipesPos)
                    repeat task.wait() until not getgenv().AutoSkullGuitar or GetDistance(pipesPos) <= 10
                    local Puzzle = workspace.Map["Haunted Castle"]["Lab Puzzle"]
                    local Floor = Puzzle.ColorFloor.Model
                    local Pipe = Puzzle.Pipes
                    local function solvePipe(partIndex)
                        local partName = "Part" .. tostring(partIndex)
                        local part = Floor[partName]
                        local pipePart = Pipe[partName][partName]
                        if part.BrickColor ~= pipePart.BrickColor then
                            repeat task.wait()
                                fireclickdetector(part.ClickDetector)
                            until part.BrickColor == pipePart.BrickColor or not getgenv().AutoSkullGuitar or CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Pipes
                        end
                    end
                    solvePipe(10)
                    solvePipe(8)
                    solvePipe(6)
                    solvePipe(4)
                    solvePipe(2)
                end
            end
        end)
    end
end)
Get:AddToggle({
    Name = "Auto CDK",
    Default = false,
    Callback = function(Value)
        getgenv().AutoGetCDK = Value
        StopTween(getgenv().AutoGetCDK)
    end
})
spawn(function()
    repeat task.wait() until getgenv().AutoGetCDK
    local player = game.Players.LocalPlayer
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local workspace = game:GetService("Workspace")
    local enemies = workspace.Enemies
    while getgenv().AutoGetCDK do
        task.wait()
        pcall(function()
            replicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
            task.wait()
            replicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
            task.wait()
            replicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Boss")
            task.wait()
            local boss = enemies:FindFirstChild("Cursed Skeleton Boss")
            if boss then
                for _, v in pairs(enemies:GetChildren()) do
                    if v.Name == "Cursed Skeleton Boss"
                        and v:FindFirstChild("Humanoid")
                        and v:FindFirstChild("HumanoidRootPart")
                        and v.Humanoid.Health > 0
                    then
                        local char = player.Character
                        local backpack = player.Backpack
                        if char:FindFirstChild("Yama") or backpack:FindFirstChild("Yama") then
                            EquipWeapon("Yama")
                        elseif char:FindFirstChild("Tushita") or backpack:FindFirstChild("Tushita") then
                            EquipWeapon("Tushita")
                        end
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        if syn and not getgenv().SimulationSet then
                            sethiddenproperty(player, "SimulationRadius", math.huge)
                            getgenv().SimulationSet = true
                        end
                        repeat
                            task.wait()
                        until not getgenv().AutoGetCDK or not v.Parent or v.Humanoid.Health <= 0
                    end
                end
            else
                topos(CFrame.new(-12318.193, 601.951, -6538.662))
                task.wait()
                topos(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
            end
        end)
    end
end)
Get:AddToggle({
    Name = "Auto Yama",
    Default = false,
    Callback = function(Value)
        getgenv().AutoYama = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoYama then
            local progress = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
            if progress >= 30 then
                repeat
                    task.wait()
                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not getgenv().AutoYama
            end
        end
    end
end)
Get:AddToggle({
    Name = "Auto Tushita",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTushita = Value
        StopTween(getgenv().AutoTushita)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoTushita then
            pcall(function()
                local enemies = game:GetService("Workspace").Enemies
                local replicated = game:GetService("ReplicatedStorage")
                if enemies:FindFirstChild("Longma") then
                    for _, v in pairs(enemies:GetChildren()) do
                        if v.Name == "Longma" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    Attack.Kill(v,getgenv().AutoTushita)
                                until not getgenv().AutoTushita or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    topos(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
                    local boss = replicated:FindFirstChild("Longma")
                    if boss then
                        topos(boss.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end
            end)
        end
    end
end)
Get:AddToggle({
    Name = "Auto Holy Torch",
    Default = false,
    Callback = function(Value)
        getgenv().AutoHolyTorch = Value
        StopTween(getgenv().AutoHolyTorch)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoHolyTorch and World3 then
            pcall(function()
                topos(CFrame.new(5711.87451171875, 45.82802963256836, 254.17005920410156))
                wait(15)
                EquipWeapon("Holy Torch")
                repeat
                    topos(CFrame.new(-10752, 417, -9366))
                    wait()
                until not getgenv().AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10752, 417, -9366)).Magnitude <= 10
                wait(1)
                repeat
                    topos(CFrame.new(-11672, 334, -9474))
                    wait()
                until not getgenv().AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-11672, 334, -9474)).Magnitude <= 10
                wait(1)
                repeat
                    topos(CFrame.new(-12132, 521, -10655))
                    wait()
                until not getgenv().AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12132, 521, -10655)).Magnitude <= 10
                wait(1)
                repeat
                    topos(CFrame.new(-13336, 486, -6985))
                    wait()
                until not getgenv().AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13336, 486, -6985)).Magnitude <= 10
                wait(1)
                repeat
                    topos(CFrame.new(-13489, 332, -7925))
                    wait()
                until not getgenv().AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13489, 332, -7925)).Magnitude <= 10
            end)
        end
    end
end)
Get:AddToggle({
    Name = "Auto Saber",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSaber = Value
        StopTween(getgenv().AutoSaber)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoSaber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
            pcall(function()
                local Workspace = game:GetService("Workspace")
                local LocalPlayer = Players.LocalPlayer
                if Workspace.Map.Jungle.Final.Part.Transparency == 0 then
                    if Workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
                        local junglePos = CFrame.new(-1612.55884, 36.9774132, 148.719543).Position
                        if (junglePos - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            topos(LocalPlayer.Character.HumanoidRootPart.CFrame)
                            wait(1)
                            for i = 1, 5 do
                                LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates["Plate"..i].Button.CFrame
                                wait(1)
                            end
                        else
                            topos(CFrame.new(-1612.55884, 36.9774132, 148.719543))
                        end
                    else
                        if Workspace.Map.Desert.Burn.Part.Transparency == 0 then
                            if LocalPlayer.Backpack:FindFirstChild("Torch") or LocalPlayer.Character:FindFirstChild("Torch") then
                                EquipWeapon("Torch")
                                topos(CFrame.new(1114.61475, 5.04679728, 4350.22803))
                            else
                                topos(CFrame.new(-1610.00757, 11.5049858, 164.001587))
                            end
                        else
                            if ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                                wait(0.5)
                                EquipWeapon("Cup")
                                wait(0.5)
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", LocalPlayer.Character.Cup)
                                wait(0)
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                            else
                                local richSon = ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                if richSon == nil then
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                elseif richSon == 0 then
                                    if Workspace.Enemies:FindFirstChild("Mob Leader") or ReplicatedStorage:FindFirstChild("Mob Leader") then
                                        topos(CFrame.new(-2967.59521, -4.91089821, 5328.70703))
                                        for _, v in pairs(Workspace.Enemies:GetChildren()) do
                                            if v.Name == "Mob Leader" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                repeat task.wait()
                                                    Attack.Kill(v, getgenv().AutoSaber)
                                                until v.Humanoid.Health <= 0 or not getgenv().AutoSaber
                                            end
                                        end
                                    end
                                elseif richSon == 1 then
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                    wait(0.5)
                                    EquipWeapon("Relic")
                                    wait(0.5)
                                    topos(CFrame.new(-1404.91504, 29.9773273, 3.80598116))
                                end
                            end
                        end
                    end
                else
                    if Workspace.Enemies:FindFirstChild("Saber Expert") or ReplicatedStorage:FindFirstChild("Saber Expert") then
                        for _, v in pairs(Workspace.Enemies:GetChildren()) do
                            if v.Name == "Saber Expert" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    Attack.Kill(v, getgenv().AutoSaber)
                                until v.Humanoid.Health <= 0 or not getgenv().AutoSaber
                                if v.Humanoid.Health <= 0 then
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
Volcano:AddButton({
    Name = "Destroy Lava In Prehistoric Island",
    Callback = function()
        for i, v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "Lava" then
                v:Destroy()
            end
        end
        for i, v in pairs(game.ReplicatedStorage:GetDescendants()) do
            if v.Name == "Lava" then
                v:Destroy()
            end
        end
    end
})
Volcano:AddButton({
    Name = "Craft Dino Hood",
    Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "DinoHood"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
Volcano:AddButton({
    Name = "Craft T-Rex Skull",
    Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "TRexSkull"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
Volcano:AddButton({
    Name = "Crafting Volcanic Magnet",
    Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "Volcanic Magnet"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
Volcano:AddToggle({
    Name = "Auto Find Prehistoric Island",
    Description = "Prehistoric Island Has Appeared And Has Stopped Boat Please Turn Off Function",
    Default = false,
    Callback = function(Value)
        getgenv().FindPrehistoric = Value
        StopTween(getgenv().FindPrehistoric)
    end
})
function CheckBoat()
    for i, v in pairs(workspace.Boats:GetChildren()) do
        if v.Name == getgenv().SelectedBoat and v:FindFirstChild("MyBoatEsp") then
            return v
        end
    end
    return false
end
function AddEsp(Name, Parent)
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")
    BillboardGui.Parent = Parent
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.Name = Name
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.new(1,1,1)
    TextLabel.TextSize = 15
    TextLabel.Text = "YOUR BOAT HERE ↓"
end
getgenv().SelectedBoat = "PirateBrigade"
local PrehisSeaPoint = CFrame.new(-10000000, 31, 37016.25)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().FindPrehistoric and World3 then
                local root = game.Players.LocalPlayer.Character.HumanoidRootPart
                local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                local BuyBoatCFrame = CFrame.new(-16927.45, 9.08, 433.86)
                local Locations = workspace._WorldOrigin:FindFirstChild("Locations")
                if not CheckBoat() then
                    topos(BuyBoatCFrame)
                    if (BuyBoatCFrame.Position - root.Position).Magnitude <= 10 then
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyBoat", getgenv().SelectedBoat)
                        for _, v in pairs(workspace.Boats:GetChildren()) do
                            if v.Name == getgenv().SelectedBoat and (v.VehicleSeat.Position - root.Position).Magnitude <= 100 then
                                AddEsp("MyBoatEsp", v)
                            end
                        end
                    end
                else
                    local myBoat = CheckBoat()
                    if myBoat then
                        if not humanoid.Sit then
                            topos(myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                        else
                            while humanoid.Sit and getgenv().FindPrehistoric do
                                if Locations and Locations:FindFirstChild("Prehistoric Island") then
                                    if stopboat then stopboat:Stop() end
                                    getgenv().FindPrehistoric = false
                                    break
                                end
                                stopboat = TPB(PrehisSeaPoint, myBoat.VehicleSeat)
                                task.wait()
                            end
                            if stopboat then stopboat:Stop() end
                            local vim = game.VirtualInputManager
                            vim:SendKeyEvent(true, 32, false, game)
                            task.wait(0.1)
                            vim:SendKeyEvent(false, 32, false, game)
                        end
                    end
                end
            end
        end)
    end
end)
Volcano:AddToggle({
    Name = "Teleport Prehistoric Island",
    Default = false,
    Callback = function(Value)
        getgenv().TeleportToPrehistoricIsland = Value
        StopTween(getgenv().TeleportToPrehistoricIsland)
    end
})
spawn(function()
    local island
    while not island do
        island = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        wait()
    end
    while wait() do
        if getgenv().TeleportToPrehistoricIsland and World3 then
            local prehistoricIslandCore = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
            if prehistoricIslandCore then
                local relic = prehistoricIslandCore:FindFirstChild("Core") 
                             and prehistoricIslandCore.Core:FindFirstChild("PrehistoricRelic")
                local skull = relic and relic:FindFirstChild("Skull")                
                if skull then
                    topos(CFrame.new(skull.Position))
                    getgenv().TeleportToPrehistoricIsland = false
                end
            end
        end
    end
end)
Volcano:AddToggle({
    Name = "Auto Start Prehistoric island",
    Default = false,
    Callback = function(Value)
        getgenv().AutoStartPrehistoric = Value
        StopTween(getgenv().AutoStartPrehistoric)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoStartPrehistoric then
            pcall(function()
                local prehistoricIsland = workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true)
                if prehistoricIsland then
                    if workspace.Map:FindFirstChild("PrehistoricIsland", true) then
                        local promptPart = workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt", true)
                        if promptPart and promptPart:FindFirstChild("ProximityPrompt") then
                            if plr:DistanceFromCharacter(promptPart.CFrame.Position) <= 150 then
                                fireproximityprompt(promptPart.ProximityPrompt, math.huge)
                                vim1:SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vim1:SendKeyEvent(false, "E", false, game)
                            end
                            topos(promptPart.CFrame)
                        end
                    end
                end
            end)
        end
    end
end)
Volcano:AddToggle({
    Name = "Auto Event Prehistoric Island",
    Description = "Auto Start Event And Kill Golem Aura,Auto Fix Volcano",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDefendVolcano = Value
        StopTween(getgenv().AutoDefendVolcano)
    end
})
spawn(function()
    while wait() do
        if getgenv().AutoDefendVolcano then
            pcall(function()
                local prehistoricIsland = workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true)
                if prehistoricIsland then
                    if workspace.Map:FindFirstChild("PrehistoricIsland", true) then
                        local promptPart = workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt", true)
                        if promptPart and promptPart:FindFirstChild("ProximityPrompt") then
                            if plr:DistanceFromCharacter(promptPart.CFrame.Position) <= 150 then
                                fireproximityprompt(promptPart.ProximityPrompt, math.huge)
                                vim1:SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vim1:SendKeyEvent(false, "E", false, game)
                            end
                            topos(promptPart.CFrame)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().AutoDefendVolcano then
            local prehistoricIsland = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
            if prehistoricIsland then
                for _, obj in pairs(prehistoricIsland:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name:lower():find("lava") then
                        obj:Destroy()
                    end
                    if obj:IsA("MeshPart") and obj.Name:lower():find("lava") then
                        obj:Destroy()
                    end
                end
                local lavaModel = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
                if lavaModel and lavaModel:IsA("Model") then
                    lavaModel:Destroy()
                end
                local Island = workspace.Map:FindFirstChild("PrehistoricIsland")
                if Island then
                    local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
                    for _, v in pairs(Island:GetDescendants()) do
                        if v.Name == "TouchInterest" then
                            if not (trialTeleport and v:IsDescendantOf(trialTeleport)) then
                                v.Parent:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end
end)
local plr = game.Players.LocalPlayer
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoDefendVolcano then
                if workspace.Enemies:FindFirstChild("Lava Golem") then
                    local v = GetConnectionEnemies("Lava Golem")
                    if v then
                        repeat task.wait()
                            Attack.Kill(v,getgenv().AutoDefendVolcano)
                            v.Humanoid:ChangeState(15)
                        until not getgenv().AutoDefendVolcano or not v.Parent or v.Humanoid.Health <= 0
                    end
                end
                for _, v in pairs(game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks:GetChildren()) do
                    if v:FindFirstChild("VFXLayer") then
                        if v:FindFirstChild("VFXLayer").At0.Glow.Enabled == true or v.VFXLayer.At0.Glow.Enabled == true then
                            repeat task.wait()
                                topos(v.VFXLayer.CFrame)
                                if v.VFXLayer.At0.Glow.Enabled == true and plr:DistanceFromCharacter(v.VFXLayer.CFrame.Position) <= 150 then
                                    MousePos = v.VFXLayer.CFrame.Position
                                    Useskills("Melee", "Z") wait(.5)
                                    Useskills("Melee", "X") wait(.5)
                                    Useskills("Melee", "C") wait(.5)
                                    Useskills("Blox Fruit", "Z") wait(.5)
                                    Useskills("Blox Fruit", "X") wait(.5)
                                    Useskills("Blox Fruit", "C")
                                end
                            until not getgenv().AutoDefendVolcano 
                                or v:FindFirstChild("VFXLayer").At0.Glow.Enabled == false 
                                or v.VFXLayer.At0.Glow.Enabled == false
                        end
                    end
                end
            end
        end)
    end
end)
Volcano:AddToggle({
    Name = "Auto Reset When Complete Volcano",
    Default = false,
    Callback = function(Value)
        getgenv().ResetVolcano = Value
    end
})
local plr = game.Players.LocalPlayer
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().ResetVolcano then
                local v748 = workspace.Map:FindFirstChild("PrehistoricIsland")
                if v748 and v748:FindFirstChild("TrialTeleport") and v748.TrialTeleport:FindFirstChild("TouchInterest") then
                    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
                        plr.Character.Humanoid.Health = 0
                    end
                else
                    if workspace:FindFirstChild("DinoBone") then
                        for _, v in pairs(workspace:GetChildren()) do
                            if v.Name == "DinoBone" and v:IsA("Model") and v.PrimaryPart then
                                if typeof(topos) == "function" then
                                    topos(v.PrimaryPart.CFrame)
                                end
                            elseif v.Name == "DinoBone" and v:IsA("Part") then
                                if typeof(topos) == "function" then
                                    topos(v.CFrame)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
Volcano:AddToggle({
    Name = "Auto Collect Bones",
    Default = false,
    Callback = function(Value)
        getgenv().CollectBone = Value
        StopTween(getgenv().CollectBone)
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().CollectBone then
                local bone = workspace:FindFirstChild("DinoBone")
                if bone then
                    topos(bone.CFrame)
                end
            end
        end)
    end
end)
Volcano:AddToggle({
    Name = "Auto Collect Egg",
    Default = false,
    Callback = function(Value)
        getgenv().CollectEgg = Value
        StopTween(getgenv().CollectEgg)
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().CollectEgg then
                local eggsFolder = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs
                local egg = eggsFolder:FindFirstChild("DragonEgg")
                if egg and egg:FindFirstChild("Molten") then
                    local molten = egg.Molten
                    if molten:IsA("BasePart") and molten:FindFirstChild("ProximityPrompt") then
                        topos(molten.CFrame)
                        fireproximityprompt(molten.ProximityPrompt, 30)
                    end
                end
            end
        end)
    end
end)
ESP:AddToggle({
    Name = "ESP Berry",
    Default = false,
    Callback = function(Value)
        Berry = Value
        while Berry do
            wait()
            UpdateBerriesESP()
        end
    end
})
spawn(function()
    while wait() do
        if Berry then
            UpdateBerriesESP()
        end
    end
end)
ESP:AddToggle({
    Name = "ESP Island",
    Default = false,
    Callback = function(Value)
        IslandESP = Value
        while IslandESP do
            wait()
            UpdateIslandESP()
        end
    end
})
spawn(function()
    while wait() do
        if IslandESP then
            UpdateIslandESP()
        end
    end
end)
ESP:AddToggle({
    Name = "ESP Fruit",
    Default = false,
    Callback = function(Value)
        DevilFruitESP = Value
        while DevilFruitESP do
            wait()
            UpdateDevilChams()
        end
    end
})
spawn(function()
    while wait() do
        if DevilFruitESP then
            UpdateDevilChams()
        end
    end
end)
ESP:AddToggle({
    Name = "ESP Player",
    Default = false,
    Callback = function(Value)
        ESPPlayer = Value
        while ESPPlayer do
            wait()
            UpdatePlayerChams()
        end
    end
})
spawn(function()
    while wait() do
        if ESPPlayer then
            UpdatePlayerChams()
        end
    end
end)
local CheckPlayer = Player:AddParagraph({
    Title = "Time Zone",
    Desc = "Status: "
})
spawn(function()
    while wait() do
        pcall(function()
            local playerCount = #game:GetService("Players"):GetPlayers()
            local content = ""
            if playerCount == 1 then
                content = "Player: " .. playerCount .. " / 12"
            elseif playerCount >= 12 then
                content = "Players: " .. playerCount .. " / 12 (Max)"
            else
                content = "Players: " .. playerCount .. " / 12"
            end
            CheckPlayer:SetDesc(content)
        end)
    end
end)
local PlrList = {}
for _, v in pairs(Players:GetPlayers()) do
    table.insert(PlrList, v.Name)
end
Player:AddDropdown({
    Name = "Select Player PVP",
    Options = PlrList,
    Callback = function(Value)
        getgenv().PlayersList = Value
    end
})
Player:AddDropdown({
    Name = "Select Method Aimbot",
    Options = {"Select Player", "Target nearest Player"},
    Callback = function(Value)
        ABmethod = Value
    end
})
Player:AddToggle({
    Name = "Teleport Player",
    Default = false,
    Callback = function(Value)
        getgenv().TpPly = Value
        StopTween(getgenv().TpPly)
        spawn(function()
            while getgenv().TpPly do
                wait()
                local target = Players:FindFirstChild(getgenv().PlayersList)
                if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    topos(target.Character.HumanoidRootPart.CFrame)
                end
            end
        end)
    end
})
Player:AddToggle({
    Name = "Auto Aimbot",
    Default = false,
    Callback = function(Value)
        getgenv().AimMethod = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AimMethod and ABmethod == "Select Player" then
                local target = Players:FindFirstChild(getgenv().PlayersList)
                if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    if target.Team ~= plr.Team then
                        MousePos = target.Character.HumanoidRootPart.Position
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AimMethod and ABmethod == "Target nearest Player" then
                local MaxDistance = math.huge
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= plr and v.Team ~= plr.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        local Distance = (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                        if Distance < MaxDistance then
                            MaxDistance = Distance
                            MousePos = v.Character.HumanoidRootPart.Position
                        end
                    end
                end
            end
        end)
    end
end)
Player:AddToggle({
    Name = "Auto Aimbot Camera",
    Default = false,
    Callback = function(Value)
        getgenv().AutoAimbotCamera = Value
    end
})
spawn(function()
    local ply = game:GetService("Players")
    local plr = ply.LocalPlayer
    local camera = workspace.CurrentCamera
    local function closestplayer()
        local dist = math.huge
        local target = nil
        for _, v in next, ply:GetPlayers() do
            if v ~= plr then
                if v.Character
                    and v.Character:FindFirstChild("Head")
                    and v.Character:FindFirstChild("HumanoidRootPart")
                    and v.Character:FindFirstChildOfClass("Humanoid").Health > 0
                then
                    local Mag = (v.Character.Head.Position - plr.Character.Head.Position).Magnitude
                    if Mag < dist then
                        dist = Mag
                        target = v
                    end
                end
            end
        end
        return target
    end
    while wait() do
        pcall(function()
            if getgenv().AutoAimbotCamera then
                repeat
                    task.wait()
                    local target = closestplayer()
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        camera.CFrame = CFrame.new(camera.CFrame.Position,target.Character.HumanoidRootPart.Position)
                    end
                until not getgenv().AutoAimbotCamera
            end
        end)
    end
end)
Player:AddToggle({
    Name = "Speed Run Player",
    Default = false,
    Callback = function(Value)
        InfAbility = Value
        if Value == false then
            local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            if hrp:FindFirstChild("Agility") then
                hrp.Agility:Destroy()
            end
        end
    end
})
spawn(function()
    while wait() do
        if InfAbility then
            InfAb()
        end
    end
end)
Player:AddToggle({
    Name = "Dash no Cd",
    Default = false,
    Callback = function(Value)
        getgenv().DodgeNoCD = Value
    end
})
local function NoCooldown()
    local dodgeScript = game.Players.LocalPlayer.Character:WaitForChild("Dodge")
    for i, v in next, getgc() do
        if typeof(v) == "function" then
            local funcEnv = getfenv(v)
            if funcEnv.script == dodgeScript then
                for i2, v2 in next, getupvalues(v) do
                    if tostring(v2) == "0.4" then
                        setupvalue(v, i2, 0)
                    end
                end
            end
        end
    end
end
spawn(function()
    while wait() do
        if getgenv().DodgeNoCD then
            pcall(NoCooldown)
        end
        wait()
    end
end)
Player:AddToggle({
    Name = "Inf Soru",
    Default = false,
    Callback = function(Value)
        getgenv().InfiniteSoru = Value
    end
})
local function InfiniteSoruLoop()
    while getgenv().InfiniteSoru do
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            for i, v in next, getgc() do
                if typeof(v) == "function" and getfenv(v).script == character:WaitForChild("Soru") then
                    for i2, v2 in pairs(debug.getupvalues(v)) do
                        if type(v2) == "table" and v2.LastUse then
                            repeat
                                setupvalue(v, i2, { LastAfter = 0, LastUse = 0 })
                                task.wait()
                            until not getgenv().InfiniteSoru or character.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end
        task.wait()
    end
end
spawn(function()
    while wait() do
        if getgenv().InfiniteSoru then
            pcall(function()
                InfiniteSoruLoop()
            end)
        end
        task.wait()
    end
end)
Player:AddToggle({
    Name = "Inf Geppo",
    Default = false,
    Callback = function(Value)
        getgenv().InfiniteGeppo = Value
    end
})
local function InfiniteGeppoLoop()
    while getgenv().InfiniteGeppo do
        for i, v in next, getgc() do
            if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Geppo") then
                for i2, v2 in next, getupvalues(v) do
                    if tostring(v2) == "0" then
                        repeat
                            setupvalue(v, i2, 0)
                            wait()
                        until not getgenv().InfiniteGeppo 
                        or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                    end
                end
            end
        end
        wait()
    end
end
spawn(function()
    while wait() do
        if getgenv().InfiniteGeppo then
            pcall(function()
                InfiniteGeppoLoop()
            end)
        end
        wait()
    end
end)
Player:AddToggle({
    Name = "No Clip",
    Default = false,
    Callback = function(Value)
        getgenv().NoClip = Value
    end
})
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().NoClip then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") or v:IsA("Part") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)
Player:AddToggle({
    Name = "Walk On Water",
    Default = true,
    Callback = function(Value)
        getgenv().WalkWater = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().WalkWater then
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
            else
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
            end
        end)
    end
end)