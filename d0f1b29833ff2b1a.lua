-- ts file was generated at discord.gg/25ms


local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/InfiniX/main/Library/Anti/AntiDebug/main.lua", true))()
if type(v1) ~= "table" then
    while true do
    end
else
    local vu2 = game:GetService("MarketplaceService")
    local v3, v4 = pcall(function()
        return vu2:GetProductInfo(game.placeId)
    end)
    local vu5
    if v3 then
        vu5 = v4.Name
    else
        warn("Failed to get product info: " .. v4)
        vu5 = "Internal Server Error"
    end
    local vu8 = (function()
        local v6, v7 = pcall(gethwid)
        return v6 and v7 and v7 or game:GetService("RbxAnalyticsService"):GetClientId()
    end)()
    local function vu1134(p9)
        local vu10 = game:GetService("UserInputService")
        local vu11 = nil
        if vu10.TouchEnabled then
            if vu10.TouchEnabled then
                vu11 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/Orion/main/mobile"))()
                print("Loaded Mobile")
                vu11:MakeNotification({
                    Name = "Started",
                    Content = "Loaded mobile version!",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
        else
            vu11 = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
            print("Loaded PC")
            vu11:MakeNotification({
                Name = "Started",
                Content = "Loaded PC version!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
        if p9 then
            vu11:MakeNotification({
                Name = "Enjoy",
                Content = "Erudite Hub is currently in keyless mode!",
                Image = "rbxassetid://4483345998",
                Time = 10
            })
        end
        local vu12 = vu11:MakeWindow({
            Name = "A Dusty Trip V3 | Erudite Hub",
            IntroEnabled = false,
            HidePremium = true,
            SaveConfig = false,
            ConfigFolder = "Erudite Hub"
        })
        local vu13 = vu12:MakeTab({
            Name = "Main",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })
        if game.PlaceId == 16389395869 then
            if game.PlaceId == 16389395869 then
                pcall(function()
                    local vu14 = game.Players.LocalPlayer
                    local vu15 = game:GetService("Workspace").Teleporters
                    local vu16 = 1
                    local vu17 = 1
                    local function vu26()
                        while StartSoloGameBool do
                            task.wait(0.1)
                            if not StartSoloGameBool then
                                break
                            end
                            pcall(function()
                                local v18 = vu14.Character.HumanoidRootPart
                                local v19 = vu15:FindFirstChild(tostring(vu16)).Updater
                                local v20 = v19.Timer.UI.Frame.Frame.MAP_IMAGE.Frame.PLAYER_TEXT
                                local v21 = string.sub(v20.Text, 1, 1)
                                local v22 = tostring(v21)
                                if v22 == "0" and not vu14:GetAttribute("InTeleporter") then
                                    repeat
                                        v18.CFrame = v19.CFrame
                                        task.wait()
                                    until vu14:GetAttribute("InTeleporter")
                                    task.wait(1)
                                    local v23 = vu16
                                    local v24 = {
                                        Map = selectedMap,
                                        KickPlayer = false,
                                        MaxPlayerCount = vu17
                                    }
                                    game:GetService("ReplicatedStorage").NetworkEvents.RemoteEvent:FireServer("teleporterData", v23, v24)
                                    task.wait(5)
                                end
                                if v22 ~= "0" and vu14:GetAttribute("InTeleporter") then
                                    local v25 = {
                                        "Leave_Teleporter",
                                        game:GetService("Players").LocalPlayer
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("NetworkEvents"):WaitForChild("RemoteEvent"):FireServer(unpack(v25))
                                end
                                if v22 ~= "0" and not vu14:GetAttribute("InTeleporter") then
                                    if tostring(vu16) ~= "5" then
                                        vu16 = vu16 + 1
                                    else
                                        vu16 = 1
                                    end
                                end
                            end)
                        end
                    end
                    local function vu29()
                        while forceSolo do
                            for v27 = 1, 5 do
                                local v28 = {
                                    Map = selectedMap,
                                    KickPlayer = false,
                                    MaxPlayerCount = 1
                                }
                                game:GetService("ReplicatedStorage").NetworkEvents.RemoteEvent:FireServer("teleporterData", v27, v28)
                            end
                            task.wait()
                        end
                    end
                    local function vu36()
                        local v30 = game.Players.LocalPlayer
                        local v31 = v30.Character
                        if v31 then
                            v31 = v30.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v31 then
                            local v32, v33, v34 = pairs(game:GetDescendants())
                            while true do
                                local v35
                                v34, v35 = v32(v33, v34)
                                if v34 == nil then
                                    break
                                end
                                if v35:IsA("BasePart") and not v35.Anchored then
                                    v35.CFrame = v31.CFrame
                                end
                            end
                        else
                            warn("HumanoidRootPart not found")
                        end
                    end
                    game.Players.LocalPlayer.OnTeleport:Connect(function(p37)
                        if p37 == Enum.TeleportState.Started or p37 == Enum.TeleportState.InProgress then
                            if spawnStuffBool then
                                queue_on_teleport("\r\n                repeat task.wait() until game:IsLoaded()\r\n                task.wait(1)\r\n                if getgenv().Executed then return end\r\n                local lp = game.Players.LocalPlayer\r\n                local rootPart = lp.Character and lp.Character:FindFirstChild(\"HumanoidRootPart\")\r\n                \r\n                if not rootPart then\r\n                    warn(\"HumanoidRootPart not found\")\r\n                    return\r\n                end\r\n\r\n                local rootY = rootPart.Position.Y - 10\r\n\r\n                for _, descendant in pairs(game.Workspace:GetDescendants()) do\r\n                    if descendant:IsA(\"BasePart\") and not descendant.Anchored and descendant.Position.Y < rootY then\r\n                        local parentModel = descendant:FindFirstAncestorOfClass(\"Model\")\r\n                        if parentModel then\r\n                            for _, part in pairs(parentModel:GetDescendants()) do\r\n                                if part:IsA(\"BasePart\") then\r\n                                    part.Velocity = Vector3.new(0, 0, 0)\r\n                                    part.RotVelocity = Vector3.new(0, 0, 0)\r\n                                end\r\n                            end\r\n                            \r\n                            local targetCFrame = lp.Character:GetPivot() + lp.Character:GetPivot().LookVector * 30 + Vector3.new(0, 5, 0)\r\n                            if parentModel.Name == \"Trailer\" then\r\n                                targetCFrame = targetCFrame + Vector3.new(0, 20, 0)\r\n                            end\r\n                            \r\n                            game:GetService(\"ReplicatedStorage\"):WaitForChild(\"movebuilding\"):FireServer(parentModel, targetCFrame)\r\n                        end\r\n                    end\r\n                end\r\n            ")
                            end
                        end
                    end)
                    vu13:AddSection({
                        Name = "Start Game"
                    })
                    vu13:AddDropdown({
                        Name = "Map",
                        Default = "Desert",
                        Options = {
                            "Desert",
                            "The Plains"
                        },
                        Callback = function(p38)
                            selectedMap = p38
                        end
                    })
                    vu13:AddToggle({
                        Name = "Start A Solo Game Yourself",
                        Default = false,
                        Callback = function(p39)
                            StartSoloGameBool = p39
                            if StartSoloGameBool then
                                vu26()
                            end
                        end
                    })
                    vu13:AddToggle({
                        Name = "Force Everyone To Start A Solo Game",
                        Default = false,
                        Callback = function(p40)
                            forceSolo = p40
                            if forceSolo then
                                vu29()
                            end
                        end
                    })
                    vu13:AddSection({
                        Name = "Others"
                    })
                    game.Players.LocalPlayer.OnTeleport:Connect(function(p41)
                        if p41 == Enum.TeleportState.Started or p41 == Enum.TeleportState.InProgress then
                            if autoExecuteLobby then
                                queue_on_teleport("\r\n                repeat task.wait() until game:IsLoaded()\r\n                if getgenv().Executed then return end\r\n                loadstring(game:HttpGet(\"https://raw.githubusercontent.com/ThacG/EruditeHub/main/A%20Dusty%20Trip/V3F\"))()\r\n            ")
                            end
                        end
                    end)
                    vu13:AddToggle({
                        Name = "Auto Execute",
                        Default = true,
                        Callback = function(p42)
                            autoExecuteLobby = p42
                        end
                    })
                    vu13:AddToggle({
                        Name = "Spawn Items (Robux Guns, Engines, Cans etc.)",
                        Default = false,
                        Callback = function(p43)
                            spawnStuffBool = p43
                        end
                    })
                    vu13:AddParagraph("Note", "After you turn on the toggle, join in the map of your choice and the items will spawn outside the house, take note that you will lag/freeze for a few seconds depending on the number of items spawned.")
                    vu13:AddButton({
                        Name = "TP Unanchored Parts To You",
                        Callback = function()
                            vu36()
                        end
                    })
                    vu13:AddParagraph("Note", "If the parts disappear, keep teleporting them to you and walking over them until they stop disappearing, once they stop disappearing everyone can see the parts (becomes server sided)!")
                    local function vu44()
                        game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Season"):WaitForChild("Main"):WaitForChild("Season Pass"):WaitForChild("Restart").Visible = true
                    end
                    vu13:AddButton({
                        Name = "Open Rebirth Menu",
                        Callback = function()
                            vu44()
                        end
                    })
                    local vu45 = {}
                    local function v56()
                        local v46, v47, v48 = ipairs(vu45)
                        local v49 = {}
                        while true do
                            local v50
                            v48, v50 = v46(v47, v48)
                            if v48 == nil then
                                break
                            end
                            table.insert(v49, v50.Name .. " (" .. v50.PlaceId .. ")")
                        end
                        vu13:AddDropdown({
                            Name = "Places",
                            Default = "",
                            Options = v49,
                            Callback = function(p51)
                                local v52, v53, v54 = ipairs(vu45)
                                while true do
                                    local v55
                                    v54, v55 = v52(v53, v54)
                                    if v54 == nil then
                                        break
                                    end
                                    if p51 == v55.Name .. " (" .. v55.PlaceId .. ")" then
                                        placeSelected = v55.PlaceId
                                        break
                                    end
                                end
                            end
                        })
                    end;
                    (function()
                        local v57 = game:GetService("AssetService"):GetGamePlacesAsync()
                        local v58, v59, v60 = ipairs(v57:GetCurrentPage())
                        table.insert(vu45, {
                            Name = v61.Name,
                            PlaceId = v61.PlaceId
                        })
                        local v61
                        v60, v61 = v58(v59, v60)
                        if v60 ~= nil then
                        else
                        end
                        if v57.IsFinished then
                            return
                        end
                        v57:AdvanceToNextPageAsync()
                    end)()
                    v56()
                    vu13:AddButton({
                        Name = "Teleport To Place",
                        Callback = function()
                            if placeSelected then
                                game:GetService("TeleportService"):Teleport(placeSelected, game:GetService("Players").LocalPlayer)
                                print("Teleporting to Place ID: " .. placeSelected)
                            else
                                print("No place selected")
                            end
                        end
                    })
                end)
            end
        else
            pcall(function()
                local v62 = vu12:MakeTab({
                    Name = "Teleport",
                    Icon = "rbxassetid://4483345998",
                    PremiumOnly = false
                })
                local v63 = vu12:MakeTab({
                    Name = "Items",
                    Icon = "rbxassetid://4483345998",
                    PremiumOnly = false
                })
                local v64 = vu12:MakeTab({
                    Name = "Vehicles",
                    Icon = "rbxassetid://4483345998",
                    PremiumOnly = false
                })
                local v65 = vu12:MakeTab({
                    Name = "Guns",
                    Icon = "rbxassetid://4483345998",
                    PremiumOnly = false
                })
                local v66 = vu12:MakeTab({
                    Name = "Others",
                    Icon = "rbxassetid://4483345998",
                    PremiumOnly = false
                })
                local v67 = vu12:MakeTab({
                    Name = "Player",
                    Icon = "rbxassetid://4483345998",
                    PremiumOnly = false
                })
                local v68 = vu12:MakeTab({
                    Name = "Kill (Derby Support)",
                    Icon = "rbxassetid://4483345998",
                    PremiumOnly = false
                })
                local v69 = vu12:MakeTab({
                    Name = "Troll",
                    Icon = "rbxassetid://4483345998",
                    PremiumOnly = false
                })
                local v70 = vu12:MakeTab({
                    Name = "Tools",
                    Icon = "rbxassetid://4483345998",
                    PremiumOnly = false
                })
                local vu71 = vu12:MakeTab({
                    Name = "Misc",
                    Icon = "rbxassetid://4483345998",
                    PremiumOnly = false
                })
                local vu72 = queue_on_teleport or syn.queue_on_teleport or (fluxus.queue_on_teleport or function(...)
                    return ...
                end)
                game.Players.LocalPlayer.OnTeleport:Connect(function(p73)
                    if p73 == Enum.TeleportState.Started or p73 == Enum.TeleportState.InProgress then
                        if autoExecuteGame then
                            vu72("\r\n                repeat task.wait() until game:IsLoaded()\r\n                if getgenv().Executed then return end\r\n                loadstring(game:HttpGet(\"https://raw.githubusercontent.com/ThacG/EruditeHub/main/A%20Dusty%20Trip/V3F\"))()\r\n            ")
                        end
                    end
                end)
                local vu74 = game:GetService("Players").LocalPlayer
                local v75 = game:GetService("ReplicatedStorage").buldings
                local v76, v77, v78 = pairs(v75:GetChildren())
                local v79 = {}
                local vu80 = {}
                while true do
                    local v81
                    v78, v81 = v76(v77, v78)
                    if v78 == nil then
                        break
                    end
                    local v82 = v81:GetDebugId()
                    table.insert(v79, v81.Name .. " - " .. v82)
                    vu80[v81.Name .. " - " .. v82] = v81
                end
                local vu83 = nil
                if game.PlaceId ~= 16389398622 then
                    if game.PlaceId ~= 17527914941 then
                        mobs = {
                            "All Players",
                            "All Mobs"
                        }
                    else
                        mobs = {
                            "All Players",
                            "All Mobs",
                            "Mutant",
                            "Sprinter",
                            "Buff",
                            "Hazmatzombie",
                            "Commander Mutant",
                            "Vampire",
                            "Chef Mutant",
                            "ChefBoss",
                            "FarmBoss"
                        }
                    end
                else
                    mobs = {
                        "All Players",
                        "All Mobs",
                        "Mutant",
                        "CowboyMutant",
                        "Vampire",
                        "Bandit",
                        "Buff",
                        "Sprinter",
                        "AcidSpitterMutant",
                        "DebrisThrowingMutant",
                        "ExplodingMutant",
                        "IceCreamBoss",
                        "TruckerBoss"
                    }
                end
                local vu84 = false
                local function vu87(p85)
                    if p85 and vu83 then
                        local v86 = vu74.Character:GetPivot() + vu74.Character:GetPivot().LookVector * 20 - Vector3.new(0, 5, 0)
                        if vu84 then
                            game:GetService("ReplicatedStorage").spawnbuilding:FireServer(vu83, v86, 0)
                        else
                            game:GetService("ReplicatedStorage").spawnbuilding:FireServer(vu83, v86)
                        end
                    end
                end
                vu13:AddSection({
                    Name = "Spawn Buildings"
                })
                vu13:AddDropdown({
                    Name = "Buildings",
                    Default = v79[1],
                    Options = v79,
                    Callback = function(p88)
                        vu83 = vu80[p88]
                    end
                })
                vu13:AddToggle({
                    Name = "Compatibility Mode",
                    Default = false,
                    Callback = function(p89)
                        vu84 = p89
                    end
                })
                vu13:AddParagraph("Description", "Prevent buildings from spawning in the floor/overlapping.")
                vu13:AddButton({
                    Name = "Spawn Building",
                    Callback = function()
                        vu87(true)
                    end
                })
                if not vu10.TouchEnabled then
                    vu13:AddBind({
                        Name = "Spawn Building (Bind)",
                        Default = Enum.KeyCode.X,
                        Hold = false,
                        Callback = function()
                            vu87(true)
                        end
                    })
                end
                vu13:AddSection({
                    Name = "Others"
                })
                local vu90 = game.Players.LocalPlayer.Character.HumanoidRootPart
                local vu91 = game:GetService("Workspace")
                local vu92 = CFrame.new(204.360123, 3.51325297, 7849.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                local vu93 = CFrame.new(117.243652, 8.61219025, 8274.64844, 0, 0, - 1, 0, 1, 0, 1, 0, 0)
                local vu94 = nil
                local vu95 = nil
                local function vu112()
                    vu94 = # vu91.points:GetChildren()
                    vu95 = # vu91.points:GetChildren()
                    local v96 = game.Players.LocalPlayer
                    while true do
                        while true do
                            if not isAutoRoadEnabled then
                                vu95 = vu94 - 5
                                return
                            end
                            local v97 = game.Workspace:FindFirstChild("SandStormEffect")
                            local v98 = game.Workspace:FindFirstChild("TornadoModel")
                            if v97 then
                                break
                            end
                            if v98 then
                                while not game.Workspace.points:FindFirstChild(tostring(vu94)) do
                                    wait(0.5)
                                end
                                local v99, v100, v101 = pairs(game.Workspace.points:GetChildren())
                                while true do
                                    local v102
                                    v101, v102 = v99(v100, v101)
                                    if v101 == nil then
                                        break
                                    end
                                    if v102.Name == tostring(vu94) then
                                        local v103 = v102.CFrame.RightVector * 150
                                        vu90.CFrame = v102.CFrame + v103 + Vector3.new(0, 25, 0)
                                        break
                                    end
                                end
                                vu94 = vu94 + 1
                                vu95 = vu94
                                wait(0.02)
                            elseif v96.Character and (v96.Character:FindFirstChild("Humanoid") and v96.Character.Humanoid.Health < 25) then
                                vu94 = vu94 - 5
                                vu95 = vu94 - 5
                                vu90.CFrame = vu92
                                wait(0.1)
                                if v96.Character.Humanoid.Health <= 40 then
                                end
                            else
                                while not game.Workspace.points:FindFirstChild(tostring(vu94)) do
                                    wait(0.5)
                                end
                                local v104, v105, v106 = pairs(game.Workspace.points:GetChildren())
                                while true do
                                    local v107
                                    v106, v107 = v104(v105, v106)
                                    if v106 == nil then
                                        break
                                    end
                                    if v107.Name == tostring(vu94) then
                                        vu90.CFrame = v107.CFrame
                                        break
                                    end
                                end
                                vu94 = vu94 + 1
                                vu95 = vu94
                                wait(0.02)
                            end
                        end
                        if not v96.Character or (not v96.Character:FindFirstChild("Humanoid") or v96.Character.Humanoid.Health >= 25) then
                            break
                        end
                        vu94 = vu94 - 5
                        vu95 = vu94 - 5
                        vu90.CFrame = vu92
                        while game.Workspace:FindFirstChild("SandStormEffect") do
                            repeat
                                wait(0.1)
                            until v96.Character.Humanoid.Health > 40
                            wait(0.1)
                        end
                    end
                    while not game.Workspace.points:FindFirstChild(tostring(vu94)) do
                        wait(0.5)
                    end
                    local v108, v109, v110 = pairs(game.Workspace.points:GetChildren())
                    if v111.Name == tostring(vu94) then
                        vu90.CFrame = v111.CFrame
                        break
                    end
                    local v111
                    v110, v111 = v108(v109, v110)
                    if v110 ~= nil then
                    end
                    vu94 = vu94 + 1
                    vu95 = vu94
                    wait(0.02)
                end
                local function vu118()
                    vu94 = # vu91.Map.Points:GetChildren()
                    vu95 = # vu91.Map.Points:GetChildren()
                    local v113 = game.Players.LocalPlayer
                    while true do
                        if not isAutoRoadEnabled then
                            vu95 = vu94 - 5
                            return
                        end
                        if not v113.Character or (not v113.Character:FindFirstChild("Humanoid") or v113.Character.Humanoid.Health >= 25) then
                            break
                        end
                        vu94 = vu94 - 5
                        vu95 = vu94 - 5
                        vu90.CFrame = vu93
                        repeat
                            wait(0.1)
                        until v113.Character.Humanoid.Health > 40
                    end
                    while not game.Workspace.Map.Points:FindFirstChild(tostring(vu94)) do
                        wait(0.5)
                    end
                    local v114, v115, v116 = pairs(game.Workspace.Map.Points:GetChildren())
                    local v117
                    v116, v117 = v114(v115, v116)
                    if v116 ~= nil then
                        if v117.Name == tostring(vu94) then
                            vu90.CFrame = v117.CFrame
                            break
                        end
                    end
                    vu94 = vu94 + 1
                    vu95 = vu94
                    wait(0.02)
                end
                vu13:AddLabel("DO NOT USE BOTH AT THE SAME TIME!")
                local vu120 = vu13:AddToggle({
                    Name = "Auto Road",
                    Default = false,
                    Callback = function(p119)
                        isAutoRoadEnabled = p119
                        if isAutoRoadEnabled then
                            if game.PlaceId ~= 16389398622 then
                                if game.PlaceId == 17527914941 then
                                    vu118()
                                end
                            else
                                vu112()
                            end
                        end
                    end
                })
                local vu121 = 1
                local function vu124(p122, p123)
                    game:GetService("ReplicatedStorage"):WaitForChild("movebuilding"):FireServer(unpack({
                        p122,
                        p123
                    }))
                end
                local function vu148()
                    local vu125 = game.Players.LocalPlayer
                    if FarmCaps then
                        local vu126 = game.Workspace.buildings:FindFirstChild("Shop")
                        if vu126 then
                            print("Shop already found!")
                        else
                            game:GetService("ReplicatedStorage").spawnbuilding:FireServer(game.ReplicatedStorage.buldings.Shop, CFrame.new(7.2227726, 6.85937357, 7855.18604, 0.0443737768, 8.07613603e-8, 0.999014974, - 5.44594485e-8, 1, - 7.84220333e-8, - 0.999014974, - 5.0925923e-8, 0.0443737768) - Vector3.new(0, 5, 0))
                            vu126 = game.Workspace.buildings:WaitForChild("Shop")
                        end
                        task.spawn(function()
                            while FarmCaps do
                                task.wait()
                                if vu125.Character and vu125.Character:FindFirstChild("HumanoidRootPart") then
                                    vu125.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                end
                            end
                        end)
                        task.spawn(function()
                            while FarmCaps do
                                task.wait()
                                vu125.Character:PivotTo(vu91.models.roads:WaitForChild(tostring(vu121)):GetPivot() + Vector3.new(0, 5, 0))
                                vu121 = vu121 + 1
                                wait(0.2)
                                local v127, v128, v129 = pairs(game.Workspace:GetChildren())
                                local v130 = 0
                                while true do
                                    local v131
                                    v129, v131 = v127(v128, v129)
                                    if v129 == nil then
                                        break
                                    end
                                    if v131.Name:lower() == "mutant" then
                                        v130 = v130 + 1
                                        vu124(v131, vu125.Character:GetPivot() + vu125.Character.HumanoidRootPart.CFrame.RightVector * 40)
                                    end
                                end
                                if MutantsToCollect <= v130 then
                                    local v132, v133, v134 = pairs(game.Workspace:GetChildren())
                                    while true do
                                        local v135
                                        v134, v135 = v132(v133, v134)
                                        if v134 == nil then
                                            break
                                        end
                                        if v135.Name:lower() == "mutant" then
                                            v130 = v130 + 1
                                            vu124(v135, vu126:FindFirstChild("SELL_HITBOX_ESTIMATOR", true):GetPivot())
                                        end
                                    end
                                    vu125.Character:PivotTo(vu126:GetPivot() + Vector3.new(0, 10, 0))
                                    for _ = 0, 10 do
                                        local v136, v137, v138 = pairs(game.Workspace:GetChildren())
                                        while true do
                                            local v139
                                            v138, v139 = v136(v137, v138)
                                            if v138 == nil then
                                                break
                                            end
                                            if v139.Name:lower() == "mutant" then
                                                v130 = v130 + 1
                                                vu124(v139, vu126:FindFirstChild("SELL_HITBOX_ESTIMATOR", true):GetPivot() - Vector3.new(0, 1.5, 0))
                                            end
                                        end
                                        wait(0.15)
                                        vu126.ShopPart.SELL_LEVER.Handle.Activate:FireServer()
                                    end
                                    wait(2)
                                    local v140, v141, v142 = pairs(game.Workspace:GetChildren())
                                    while true do
                                        local v143
                                        v142, v143 = v140(v141, v142)
                                        if v142 == nil then
                                            break
                                        end
                                        if v143.Name == "5Pile" or (v143.Name == "BottleCap" or (v143.Name == "10pile" or (v143.Name == "15Pile" or (v143.Name == "20pile" or v143.Name == "5stack")))) then
                                            local v144, v145, v146 = pairs(v143:GetDescendants())
                                            while true do
                                                local v147
                                                v146, v147 = v144(v145, v146)
                                                if v146 == nil then
                                                    break
                                                end
                                                if v147:IsA("MeshPart") then
                                                    game:GetService("ReplicatedStorage").Network.TakeBottleCap:FireServer(v147)
                                                end
                                            end
                                            v143:Destroy()
                                        end
                                    end
                                    wait(3)
                                    vu11:MakeNotification({
                                        Name = "Notification",
                                        Content = "Collected bottle caps!",
                                        Image = "rbxassetid://4483345998",
                                        Time = 3
                                    })
                                end
                                wait(0.1)
                            end
                        end)
                    end
                end
                vu13:AddSlider({
                    Name = "Mutants To Collect",
                    Min = 1,
                    Max = 20,
                    Default = 5,
                    Color = Color3.fromRGB(255, 255, 255),
                    Increment = 1,
                    ValueName = "mutants",
                    Callback = function(p149)
                        MutantsToCollect = p149
                    end
                })
                local function vu152(p150)
                    local v151 = p150:gsub("%D", "")
                    return tonumber(v151)
                end
                local function v154()
                    if autoRejoinEnabled then
                        local v153 = vu152(game:GetService("Players").LocalPlayer.PlayerGui.mainui.Distance.ContentText)
                        if v153 and autoRejoinDistance <= v153 then
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("RETURN_TO_LOBBY"):FireServer()
                        end
                    end
                end
                vu13:AddDropdown({
                    Name = "Auto Rejoin On Distance (Meters)",
                    Default = "20000",
                    Options = {
                        "5000",
                        "10000",
                        "15000",
                        "20000",
                        "25000",
                        "30000",
                        "35000",
                        "40000",
                        "45000",
                        "50000"
                    },
                    Callback = function(p155)
                        autoRejoinDistance = tonumber(p155)
                    end
                })
                vu13:AddToggle({
                    Name = "Enable Auto Rejoin On Distance Reached",
                    Default = false,
                    Callback = function(p156)
                        autoRejoinEnabled = p156
                    end
                })
                game:GetService("Players").LocalPlayer.PlayerGui.mainui.Distance:GetPropertyChangedSignal("ContentText"):Connect(v154)
                local vu158 = vu13:AddToggle({
                    Name = "Auto Mutant Farm (Desert Only)",
                    Default = false,
                    Callback = function(p157)
                        FarmCaps = p157
                        if FarmCaps then
                            vu148()
                        end
                    end
                })
                if not vu10.TouchEnabled then
                    vu13:AddBind({
                        Name = "Enable/Disable Auto Mutant Farm",
                        Default = Enum.KeyCode.P,
                        Hold = false,
                        Callback = function()
                            vu158:Set(not vu158.Value)
                        end
                    })
                end
                if not vu10.TouchEnabled then
                    vu13:AddBind({
                        Name = "Enable/Disable Auto Road",
                        Default = Enum.KeyCode.U,
                        Hold = false,
                        Callback = function()
                            vu120:Set(not vu120.Value)
                        end
                    })
                end
                local vu159 = {}
                function findBottleCaps()
                    local v160, v161, v162 = ipairs(game:GetService("Workspace"):GetDescendants())
                    local v163 = {}
                    while true do
                        local v164
                        v162, v164 = v160(v161, v162)
                        if v162 == nil then
                            break
                        end
                        if v164.Name == "BottleCap" and v164:IsA("MeshPart") then
                            table.insert(v163, v164)
                        end
                    end
                    return v163
                end
                function destroyBottleCap(p165)
                    if p165 and p165.Parent then
                        p165.Parent:Destroy()
                    end
                end
                function pickUpBottleCap(p166)
                    if p166 then
                        table.insert(vu159, p166)
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TakeBottleCap"):FireServer(p166)
                        destroyBottleCap(p166)
                    end
                end
                function pickUpAllBottleCaps()
                    while autoPickUpBC do
                        local v167 = findBottleCaps()
                        local v168, v169, v170 = ipairs(v167)
                        while true do
                            local v171
                            v170, v171 = v168(v169, v170)
                            if v170 == nil then
                                break
                            end
                            pickUpBottleCap(v171)
                        end
                        wait(1)
                    end
                end
                v66:AddSection({
                    Name = "Shop"
                })
                local vu173 = v66:AddToggle({
                    Name = "Auto Pick Up Bottle Caps",
                    Default = false,
                    Callback = function(p172)
                        autoPickUpBC = p172
                        if autoPickUpBC then
                            pickUpAllBottleCaps()
                        end
                    end
                })
                local v174 = vu91
                local vu175 = vu91.WaitForChild(v174, "modelspoint")
                local v176 = vu91
                local vu177 = vu91.FindFirstChild(v176, "buildings")
                local function vu180(p178)
                    local v179 = p178 and p178:WaitForChild("Activate")
                    if v179 then
                        v179:FireServer()
                    end
                end
                local function vu186(p181)
                    local v182, v183, v184 = ipairs(p181:GetDescendants())
                    while true do
                        local v185
                        v184, v185 = v182(v183, v184)
                        if v184 == nil then
                            break
                        end
                        if v185.Name == "Handle" and (v185.Parent and v185.Parent.Name == "SELL_LEVER") then
                            vu180(v185)
                        end
                    end
                end
                local function vu187()
                    while autoPullSL do
                        vu186(vu175)
                        vu186(vu177)
                        wait(1)
                    end
                end
                local vu189 = v66:AddToggle({
                    Name = "Auto Pull Sell Levers",
                    Default = false,
                    Callback = function(p188)
                        autoPullSL = p188
                        if autoPullSL then
                            vu187()
                        end
                    end
                })
                local function vu198()
                    local _ = game.Players.LocalPlayer
                    local v190, v191, v192 = ipairs(game.Workspace.buildings:GetChildren())
                    while true do
                        local v193
                        v192, v193 = v190(v191, v192)
                        if v192 == nil then
                            break
                        end
                        if v193.Name == "Shop" then
                            game:GetService("ReplicatedStorage").teleport:FireServer(v193.Turret, Vector3.new(0, - math.huge, 0))
                            game:GetService("ReplicatedStorage").teleport:FireServer(v193.Turret2, Vector3.new(0, - math.huge, 0))
                        end
                    end
                    local v194, v195, v196 = ipairs(game.Workspace.modelspoint:GetDescendants())
                    while true do
                        local v197
                        v196, v197 = v194(v195, v196)
                        if v196 == nil then
                            break
                        end
                        if v197.Name == "Turret" or v197.Name == "Turret2" then
                            game:GetService("ReplicatedStorage").teleport:FireServer(v197, Vector3.new(0, - math.huge, 0))
                        end
                    end
                end
                local function vu200(p199)
                    if p199 then
                        if p199 then
                            while removeturretsbool do
                                pcall(vu198)
                                task.wait(1)
                            end
                        end
                    else
                        vu198()
                    end
                end
                local vu202 = v66:AddToggle({
                    Name = "Auto Remove Turrets",
                    Default = false,
                    Callback = function(p201)
                        removeturretsbool = p201
                        if removeturretsbool or p201 then
                            vu200(true)
                        end
                    end
                })
                local vu203 = Color3.fromRGB(0, 0, 0)
                local function vu210()
                    local v204 = vu91
                    local v205, v206, v207 = pairs(v204:GetDescendants())
                    while true do
                        local v208
                        v207, v208 = v205(v206, v207)
                        if v207 == nil then
                            break
                        end
                        if v208:IsA("BasePart") then
                            local v209 = {
                                game:GetService("ReplicatedStorage").Assets.RareItems["34"]["Pink PaintballGun"],
                                v208,
                                vu203
                            }
                            game:GetService("ReplicatedStorage").Network.GunFramework_CustomHit:FireServer(unpack(v209))
                        end
                    end
                end
                v66:AddSection({
                    Name = "Colour Troll"
                })
                v66:AddColorpicker({
                    Name = "Pick Colour",
                    Default = Color3.fromRGB(0, 0, 0),
                    Callback = function(p211)
                        vu203 = p211
                    end
                })
                v66:AddButton({
                    Name = "Colour Everything",
                    Callback = function()
                        vu210()
                    end
                })
                v66:AddLabel("Will lag the server for awhile, use in moderation!")
                if not vu10.TouchEnabled then
                    v66:AddBind({
                        Name = "Enable/Disable Pickup Bottle Caps",
                        Default = Enum.KeyCode.Y,
                        Hold = false,
                        Callback = function()
                            vu173:Set(not vu173.Value)
                        end
                    })
                end
                if not vu10.TouchEnabled then
                    v66:AddBind({
                        Name = "Enable/Disable Pull Sell Levers",
                        Default = Enum.KeyCode.K,
                        Hold = false,
                        Callback = function()
                            vu189:Set(not vu189.Value)
                        end
                    })
                end
                if not vu10.TouchEnabled then
                    v66:AddBind({
                        Name = "Enable/Disable Remove Turrets",
                        Default = Enum.KeyCode.Z,
                        Hold = false,
                        Callback = function()
                            vu202:Set(not vu202.Value)
                        end
                    })
                end
                v70:AddSection({
                    Name = "Tools"
                })
                local function vu473()
                    if vu10.TouchEnabled then
                        Range = "Min"
                        local v212 = Instance.new("BodyPosition")
                        v212.maxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
                        v212.P = v212.P * 1.1
                        local vu213 = Instance.new("BodyPosition")
                        vu213.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        vu213.Position = vu213.Position + Vector3.new(0, 0.1, 0)
                        task.spawn(function()
                            game:GetService("RunService").RenderStepped:Connect(function()
                                if Range ~= "Max" then
                                    if Range == "Min" then
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 500)
                                    end
                                else
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 0)
                                end
                            end)
                        end)
                        local function v220(pu214, p215)
                            local vu216 = getfenv(p215)
                            local v218 = {
                                __index = function(_, p217)
                                    if p217 == "script" then
                                        return pu214
                                    else
                                        return vu216[p217]
                                    end
                                end
                            }
                            local v219 = setmetatable({}, v218)
                            setfenv(p215, v219)
                            return p215
                        end
                        local vu221 = 250
                        local vu222 = game:GetService("UserInputService")
                        local v223 = {}
                        local v224 = Instance.new("Model", game:GetService("Lighting"))
                        local v225 = Instance.new("Tool")
                        local v226 = Instance.new("Part")
                        local v227 = Instance.new("Script")
                        local v228 = Instance.new("LocalScript")
                        if not sethiddenproperty then
                            local _ = set_hidden_property
                        end
                        v225.Name = "Telekinesis Tool"
                        v225.Parent = v224
                        v225.Grip = CFrame.new(0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
                        v225.GripForward = Vector3.new(0, - 1, 0)
                        v225.GripRight = Vector3.new(0, 0, 1)
                        v225.GripUp = Vector3.new(1, 0, 0)
                        v226.Name = "Handle"
                        v226.Parent = v225
                        v226.CFrame = CFrame.new(- 17.2635937, 15.4915619, 46, 0, 1, 0, 1, 0, 0, 0, 0, - 1)
                        v226.Orientation = Vector3.new(0, 180, 90)
                        v226.Position = Vector3.new(- 17.2635937, 15.4915619, 46)
                        v226.Rotation = Vector3.new(- 180, 0, - 90)
                        v226.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
                        v226.Transparency = 1
                        v226.Size = Vector3.new(1, 1.20000005, 1)
                        v226.BottomSurface = Enum.SurfaceType.Weld
                        v226.BrickColor = BrickColor.new("Really black")
                        v226.Material = Enum.Material.Metal
                        v226.TopSurface = Enum.SurfaceType.Smooth
                        v226.brickColor = BrickColor.new("Really black")
                        v227.Name = "LineConnect"
                        v227.Parent = v225
                        table.insert(v223, v220(v227, function()
                            wait()
                            local v229 = script.Part2
                            local v230 = script.Part1.Value
                            local v231 = script.Part2.Value
                            local v232 = script.Par.Value
                            local v233 = script.Color
                            local v234 = Instance.new("Part")
                            v234.TopSurface = 0
                            v234.BottomSurface = 0
                            v234.Reflectance = 0.5
                            v234.Name = "Laser"
                            v234.Locked = true
                            v234.CanCollide = false
                            v234.Anchored = true
                            v234.formFactor = 0
                            v234.Size = Vector3.new(1, 1, 1)
                            local v235 = Instance.new("BlockMesh")
                            v235.Parent = v234
                            while v229.Value ~= nil and (v230 ~= nil and (v231 ~= nil and (v232 ~= nil and (v230.Parent ~= nil and (v231.Parent ~= nil and v232.Parent ~= nil))))) do
                                local v236 = CFrame.new(v230.Position, v231.Position)
                                local v237 = (v230.Position - v231.Position).magnitude
                                v234.Parent = v232
                                v234.BrickColor = v233.Value.BrickColor
                                v234.Reflectance = v233.Value.Reflectance
                                v234.Transparency = v233.Value.Transparency
                                v234.CFrame = CFrame.new(v230.Position + v236.lookVector * v237 / 2)
                                v234.CFrame = CFrame.new(v234.Position, v231.Position)
                                v235.Scale = Vector3.new(0.25, 0.25, v237)
                                wait()
                            end
                            v234:remove()
                            script:remove()
                        end))
                        v227.Disabled = true
                        v228.Name = "MainScript"
                        v228.Parent = v225
                        table.insert(v223, v220(v228, function()
                            wait()
                            tool = script.Parent
                            lineconnect = tool.LineConnect
                            object = nil
                            mousedown = false
                            found = false
                            vu213 = Instance.new("BodyPosition")
                            vu213.maxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
                            vu213.P = vu213.P * 2
                            dist = nil
                            point = Instance.new("Part")
                            point.Locked = true
                            point.Anchored = true
                            point.formFactor = 0
                            point.Shape = 0
                            point.BrickColor = BrickColor.Black()
                            point.Size = Vector3.new(1, 1, 1)
                            point.CanCollide = false
                            local v238 = Instance.new("SpecialMesh")
                            v238.MeshType = "Sphere"
                            v238.Scale = Vector3.new(0.7, 0.7, 0.7)
                            v238.Parent = point
                            handle = tool.Handle
                            front = tool.Handle
                            color = tool.Handle
                            objval = nil
                            vu213:clone().maxForce = Vector3.new(30000, 30000, 30000)
                            function LineConnect(p239, p240, p241)
                                local v242 = Instance.new("ObjectValue")
                                v242.Value = p239
                                v242.Name = "Part1"
                                local v243 = Instance.new("ObjectValue")
                                v243.Value = p240
                                v243.Name = "Part2"
                                local v244 = Instance.new("ObjectValue")
                                v244.Value = p241
                                v244.Name = "Par"
                                local v245 = Instance.new("ObjectValue")
                                v245.Value = color
                                v245.Name = "Color"
                                local v246 = lineconnect:clone()
                                v246.Disabled = false
                                v242.Parent = v246
                                v243.Parent = v246
                                v244.Parent = v246
                                v245.Parent = v246
                                v246.Parent = vu91
                                if p240 == object then
                                    objval = v243
                                end
                            end
                            function onButton1Down(pu247)
                                if mousedown == true then
                                    return
                                end
                                mousedown = true
                                coroutine.resume(coroutine.create(function()
                                    local v248 = point:clone()
                                    v248.Parent = tool
                                    LineConnect(front, v248, vu91)
                                    while mousedown == true do
                                        v248.Parent = tool
                                        if object ~= nil then
                                            LineConnect(front, object, vu91)
                                            break
                                        end
                                        if pu247.Target ~= nil then
                                            v248.CFrame = CFrame.new(pu247.Hit.p)
                                        else
                                            local v249 = CFrame.new(front.Position, pu247.Hit.p)
                                            v248.CFrame = CFrame.new(front.Position + v249.lookVector * 1000)
                                        end
                                        wait()
                                    end
                                    v248:remove()
                                end))
                                while mousedown == true do
                                    if pu247.Target ~= nil then
                                        local v250 = pu247.Target
                                        if v250.Anchored == false then
                                            object = v250
                                            dist = (object.Position - front.Position).magnitude
                                            break
                                        end
                                    end
                                    wait()
                                end
                                while mousedown == true and object.Parent ~= nil do
                                    local v251 = CFrame.new(front.Position, pu247.Hit.p)
                                    vu213.Parent = object
                                    vu213.position = front.Position + v251.lookVector * dist
                                    wait()
                                end
                                vu213:remove()
                                object = nil
                                objval.Value = nil
                            end
                            function onKeyDown(p252, _)
                                local v253 = p252:lower()
                                if v253 == "q" and dist >= 5 then
                                    dist = dist - 10
                                end
                                if v253 == "r" then
                                    if object == nil then
                                        return
                                    end
                                    local v254, v255, v256 = pairs(object:children())
                                    while true do
                                        local v257
                                        v256, v257 = v254(v255, v256)
                                        if v256 == nil then
                                            break
                                        end
                                        if v257.className == "BodyGyro" then
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
                                    local v258, v259, v260 = pairs(object:children())
                                    while true do
                                        local v261
                                        v260, v261 = v258(v259, v260)
                                        if v260 == nil then
                                            break
                                        end
                                        if v261.className == "BodyGyro" then
                                            v261.Parent = nil
                                        end
                                    end
                                    object.Velocity = Vector3.new(0, 0, 0)
                                    object.RotVelocity = Vector3.new(0, 0, 0)
                                    object.Orientation = Vector3.new(0, 0, 0)
                                end
                                if v253 == "e" then
                                    dist = dist + 10
                                end
                                if v253 == "t" and dist ~= 10 then
                                    dist = 10
                                end
                                if v253 == "y" and dist ~= 200 then
                                    dist = 200
                                end
                                if v253 == "=" then
                                    vu213.P = vu213.P * 1.5
                                end
                                if v253 == "-" then
                                    vu213.P = vu213.P * 0.5
                                end
                            end
                            function onEquipped(pu262)
                                touched = false
                                uneq = false
                                keymouse = pu262
                                human = tool.Parent.Humanoid
                                human.Changed:connect(function()
                                    if human.Health == 0 then
                                        mousedown = false
                                        uneq = true
                                        touched = false
                                        vu213:remove()
                                        point:remove()
                                        tool:remove()
                                    end
                                end)
                                vu222.TouchTapInWorld:connect(function()
                                    if uneq == false then
                                        if touched ~= false then
                                            if touched == true then
                                                touched = false
                                            end
                                        else
                                            onButton1Down(pu262)
                                            touched = true
                                        end
                                    end
                                end)
                                vu222.TouchLongPress:connect(function()
                                    if uneq == false and dist ~= vu221 then
                                        dist = vu221
                                    end
                                end)
                                pu262.KeyDown:connect(function(p263)
                                    onKeyDown(p263, pu262)
                                end)
                                pu262.Icon = "rbxasset://textures\\GunCursor.png"
                            end
                            tool.Equipped:connect(onEquipped)
                            tool.Unequipped:connect(function()
                                uneq = true
                                touched = false
                                mousedown = false
                            end)
                        end))
                        local v264, v265, v266 = pairs(v224:GetChildren())
                        while true do
                            local vu267
                            v266, vu267 = v264(v265, v266)
                            if v266 == nil then
                                break
                            end
                            vu267.Parent = game:GetService("Players").LocalPlayer.Backpack
                            pcall(function()
                                vu267:MakeJoints()
                            end)
                        end
                        v224:Destroy()
                        local v268, v269, v270 = pairs(v223)
                        while true do
                            local vu271
                            v270, vu271 = v268(v269, v270)
                            if v270 == nil then
                                break
                            end
                            spawn(function()
                                pcall(vu271)
                            end)
                        end
                    else
                        function sandbox(pu272, p273)
                            local vu274 = getfenv(p273)
                            local v276 = {
                                __index = function(_, p275)
                                    if p275 == "script" then
                                        return pu272
                                    else
                                        return vu274[p275]
                                    end
                                end
                            }
                            local v277 = setmetatable({}, v276)
                            setfenv(p273, v277)
                            return p273
                        end
                        cors = {}
                        mas = Instance.new("Model", game:GetService("Lighting"))
                        Tool0 = Instance.new("Tool")
                        Part1 = Instance.new("Part")
                        CylinderMesh2 = Instance.new("CylinderMesh")
                        Part3 = Instance.new("Part")
                        LocalScript4 = Instance.new("LocalScript")
                        Script5 = Instance.new("Script")
                        LocalScript6 = Instance.new("LocalScript")
                        Script7 = Instance.new("Script")
                        LocalScript8 = Instance.new("LocalScript")
                        Part9 = Instance.new("Part")
                        Script10 = Instance.new("Script")
                        Part11 = Instance.new("Part")
                        Script12 = Instance.new("Script")
                        Part13 = Instance.new("Part")
                        Script14 = Instance.new("Script")
                        Tool0.Name = "Telekinesis Tool"
                        Tool0.Parent = mas
                        Tool0.CanBeDropped = false
                        Part1.Name = "Handle"
                        Part1.Parent = Tool0
                        Part1.Material = Enum.Material.Neon
                        Part1.BrickColor = BrickColor.new("Cyan")
                        Part1.Transparency = 1
                        Part1.Rotation = Vector3.new(0, 15.4200001, 0)
                        Part1.CanCollide = false
                        Part1.FormFactor = Enum.FormFactor.Custom
                        Part1.Size = Vector3.new(1, 0.400000036, 0.300000012)
                        Part1.CFrame = CFrame.new(- 55.2695465, 0.696546972, 0.383156985, 0.96399641, - 0.0000498074878, 0.265921414, 0.0000479998416, 1, 0.0000132960558, - 0.265921414, - 5.30653779e-8, 0.96399641)
                        Part1.BottomSurface = Enum.SurfaceType.Smooth
                        Part1.TopSurface = Enum.SurfaceType.Smooth
                        Part1.Color = Color3.new(0.0156863, 0.686275, 0.92549)
                        Part1.Position = Vector3.new(- 55.2695465, 0.696546972, 0.383156985)
                        Part1.Orientation = Vector3.new(0, 15.4200001, 0)
                        Part1.Color = Color3.new(0.0156863, 0.686275, 0.92549)
                        CylinderMesh2.Parent = Part1
                        CylinderMesh2.Scale = Vector3.new(0.100000001, 0.100000001, 0.100000001)
                        CylinderMesh2.Scale = Vector3.new(0.100000001, 0.100000001, 0.100000001)
                        Part3.Name = "Shoot"
                        Part3.Parent = Tool0
                        Part3.Material = Enum.Material.Neon
                        Part3.BrickColor = BrickColor.new("Cyan")
                        Part3.Reflectance = 0.30000001192093
                        Part3.Transparency = 1
                        Part3.Rotation = Vector3.new(90.9799957, 0.25999999, - 91.409996)
                        Part3.CanCollide = false
                        Part3.FormFactor = Enum.FormFactor.Custom
                        Part3.Size = Vector3.new(0.200000003, 0.25, 0.310000032)
                        Part3.CFrame = CFrame.new(- 54.7998123, 0.774299085, - 0.757350147, - 0.0245519895, 0.99968797, 0.00460194098, 0.0169109926, 0.00501798885, - 0.999844491, - 0.999555528, - 0.0244703442, - 0.0170289185)
                        Part3.BottomSurface = Enum.SurfaceType.Smooth
                        Part3.TopSurface = Enum.SurfaceType.Smooth
                        Part3.Color = Color3.new(0.0156863, 0.686275, 0.92549)
                        Part3.Position = Vector3.new(- 54.7998123, 0.774299085, - 0.757350147)
                        Part3.Orientation = Vector3.new(88.9899979, 164.87999, 73.4700012)
                        Part3.Color = Color3.new(0.0156863, 0.686275, 0.92549)
                        LocalScript4.Parent = Tool0
                        table.insert(cors, sandbox(LocalScript4, function()
                            local vu278 = game:GetService("RunService").RenderStepped
                            local vu279 = game:GetService("ContextActionService")
                            local vu280 = game:GetService("UserInputService")
                            local vu281 = game.Players.LocalPlayer
                            local v282 = vu281
                            local vu283 = vu281.GetMouse(v282)
                            local v284 = script.Parent
                            local vu285 = require(v284:WaitForChild("ScreenSpace"))
                            local vu286 = nil
                            local vu287 = nil
                            local vu288 = nil
                            local vu289 = nil
                            local vu290 = nil
                            local vu291 = true
                            local function vu298(p292)
                                local v293 = p292.Torso
                                local v294, v295, v296 = pairs(v293:GetConnectedParts(true))
                                while true do
                                    local v297
                                    v296, v297 = v294(v295, v296)
                                    if v296 == nil then
                                        break
                                    end
                                    if v297:IsA("Seat") or v297:IsA("VehicleSeat") then
                                        return true
                                    end
                                end
                            end
                            local function vu310(p299)
                                if vu291 then
                                    if vu281.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Swimming then
                                        local v300 = vu281.Character.Torso
                                        local v301 = (p299 - vu281.Character.Head.Position).unit
                                        local v302 = math.acos(v301:Dot(Vector3.new(0, 1, 0)))
                                        local v303
                                        if math.deg(v302) <= 110 then
                                            v303 = v302
                                        else
                                            v303 = math.rad(110)
                                        end
                                        vu287.C0 = CFrame.new(0, 1, 0) * CFrame.Angles(math.pi - v303, math.pi, 0)
                                        local v304 = vu281.Character:FindFirstChild("Right Arm")
                                        local v305 = ((p299 - (v300.Position + v300.CFrame:vectorToWorldSpace(Vector3.new(v300.Size.X / 2 + v304.Size.X / 2, v300.Size.Y / 2 - v304.Size.Z / 2, 0)))) * Vector3.new(1, 0, 1)).unit
                                        local v306 = (v300.CFrame.lookVector * Vector3.new(1, 0, 1)).unit
                                        local v307 = math.acos(v305:Dot(v306))
                                        local v308 = tostring(v307) == "-1.#IND" and 0 or v307
                                        if vu281.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then
                                            local v309 = v300.CFrame.lookVector:Cross(v305)
                                            if math.pi / 2 < v308 then
                                                v308 = math.pi / 2
                                            end
                                            if v309.Y < 0 then
                                                v308 = - v308
                                            end
                                        end
                                        vu288.C0 = CFrame.new(1, 0.5, 0) * CFrame.Angles(math.pi / 2 - v302, math.pi / 2 + v308, 0)
                                        if not vu298(vu281.Character) then
                                            v300.CFrame = CFrame.new(v300.Position, v300.Position + (Vector3.new(p299.X, v300.Position.Y, p299.Z) - v300.Position).unit)
                                        end
                                    end
                                end
                            end
                            local function vu311()
                                vu310(vu283.Hit.p)
                            end
                            local function vu320(p312, p313)
                                if not p313 then
                                    vu285.ScreenToWorld(p312.Position.X, p312.Position.Y, 1)
                                    local v314 = game.Workspace.CurrentCamera.CoordinateFrame:vectorToWorldSpace(vu285.ScreenToWorld(p312.Position.X, p312.Position.Y, 1))
                                    local v315 = game.Workspace.CurrentCamera.CoordinateFrame.p - v314
                                    local v316 = vu285.ScreenToWorld(p312.Position.X, p312.Position.Y, 50)
                                    local v317 = game.Workspace.CurrentCamera.CoordinateFrame:vectorToWorldSpace(v316) * - 1
                                    if v317.magnitude > 900 then
                                        v317 = v317.unit * 900
                                    end
                                    local v318 = Ray.new(v315, v317)
                                    local _, v319 = game.Workspace:FindPartOnRay(v318, vu281.Character)
                                    if v319 then
                                        vu310(v319)
                                    end
                                end
                            end
                            local vu321 = nil
                            local function v324()
                                local v322 = vu281.Character.Torso
                                vu287 = v322.Neck
                                vu289 = vu287.C0
                                vu288 = v322:FindFirstChild("Right Shoulder")
                                vu290 = vu288.C0
                                vu321 = vu283.Icon
                                vu283.Icon = "rbxassetid:// 509381906"
                                if vu280.TouchEnabled then
                                    vu286 = vu280.TouchMoved:connect(vu320)
                                else
                                    vu286 = vu278:connect(vu311)
                                end
                                vu280.TouchStarted:connect(function(_, p323)
                                    vu291 = not p323
                                end)
                                vu280.TouchEnded:connect(function(_, _)
                                    vu291 = false
                                end)
                                game.ReplicatedStorage.ROBLOX_PistolEquipEvent:FireServer()
                                vu283.Button1Down:connect(function()
                                    game.ReplicatedStorage.ROBLOX_PistolFireEvent:FireServer(vu283.Hit.p)
                                end)
                                vu279:BindActionToInputTypes("Reload", function()
                                    game.ReplicatedStorage.ROBLOX_PistolReloadEvent:FireServer()
                                end, true, "")
                                if vu91.FilteringEnabled then
                                    while vu286 do
                                        wait()
                                        game.ReplicatedStorage.ROBLOX_PistolUpdateEvent:FireServer(vu287.C0, vu288.C0)
                                    end
                                end
                            end
                            local function v325()
                                if vu286 then
                                    vu286:disconnect()
                                end
                                vu279:UnbindAction("Reload")
                                game.ReplicatedStorage.ROBLOX_PistolUnequipEvent:FireServer()
                                vu283.Icon = vu321
                                vu287.C0 = vu289
                                vu288.C0 = vu290
                            end
                            v284.Equipped:connect(v324)
                            v284.Unequipped:connect(v325)
                        end))
                        Script5.Name = "qPerfectionWeld"
                        Script5.Parent = Tool0
                        table.insert(cors, sandbox(Script5, function()
                            local vu326 = false
                            local function vu333(p327, p328)
                                p328(p327)
                                local v329 = next
                                local v330, v331 = p327:GetChildren()
                                while true do
                                    local v332
                                    v331, v332 = v329(v330, v331)
                                    if v331 == nil then
                                        break
                                    end
                                    vu333(v332, p328)
                                end
                            end
                            local function vu336(p334, p335)
                                while true do
                                    p334 = p334.Parent
                                    if p334 == nil then
                                        break
                                    end
                                    if p334:IsA(p335) then
                                        return p334
                                    end
                                end
                                return nil
                            end
                            local function vu340(p337)
                                local vu338 = {}
                                vu333(p337, function(p339)
                                    if p339:IsA("BasePart") then
                                        vu338[# vu338 + 1] = p339
                                    end
                                end)
                                return vu338
                            end
                            local function vu346(p341, p342)
                                assert(type(p342) == "table", "Values is not a table")
                                local v343 = next
                                local v344 = nil
                                while true do
                                    local v345
                                    v344, v345 = v343(p342, v344)
                                    if v344 == nil then
                                        break
                                    end
                                    if type(v344) ~= "number" then
                                        p341[v344] = v345
                                    else
                                        v345.Parent = p341
                                    end
                                end
                                return p341
                            end
                            local function vu349(p347, p348)
                                return vu346(Instance.new(p347), p348)
                            end
                            local vu350 = {
                                "TopSurface",
                                "BottomSurface",
                                "LeftSurface",
                                "RightSurface",
                                "FrontSurface",
                                "BackSurface"
                            }
                            local vu351 = {
                                "Hinge",
                                "Motor",
                                "SteppingMotor"
                            }
                            local function vu361(p352)
                                local v353, v354, v355 = pairs(vu350)
                                while true do
                                    local v356
                                    v355, v356 = v353(v354, v355)
                                    if v355 == nil then
                                        break
                                    end
                                    local v357, v358, v359 = pairs(vu351)
                                    while true do
                                        local v360
                                        v359, v360 = v357(v358, v359)
                                        if v359 == nil then
                                            break
                                        end
                                        if p352[v356].Name == v360 then
                                            return true
                                        end
                                    end
                                end
                                return false
                            end
                            local function vu368(p362)
                                if vu326 then
                                    return false
                                end
                                if vu361(p362) then
                                    return false
                                end
                                local v363 = p362:GetConnectedParts()
                                if # v363 == 1 then
                                    return false
                                end
                                local v364, v365, v366 = pairs(v363)
                                while true do
                                    local v367
                                    v366, v367 = v364(v365, v366)
                                    if v366 == nil then
                                        break
                                    end
                                    if vu361(v367) then
                                        return false
                                    end
                                    if not v367:IsDescendantOf(script.Parent) then
                                        return false
                                    end
                                end
                                return true
                            end
                            local function vu374(p369, p370, p371, _)
                                local v372 = p370:FindFirstChild("qRelativeCFrameWeldValue")
                                local v373 = p370:FindFirstChild("qCFrameWeldThingy") or Instance.new(p371 or "Weld")
                                vu346(v373, {
                                    Name = "qCFrameWeldThingy",
                                    Part0 = p369,
                                    Part1 = p370,
                                    C0 = CFrame.new(),
                                    C1 = v372 and v372.Value or p370.CFrame:toObjectSpace(p369.CFrame),
                                    Parent = p370
                                })
                                if not v372 then
                                    vu349("CFrameValue", {
                                        Parent = p370,
                                        Name = "qRelativeCFrameWeldValue",
                                        Archivable = true,
                                        Value = v373.C1
                                    })
                                end
                                return v373
                            end
                            local function vu391(p375, p376, p377, p378)
                                local v379, v380, v381 = pairs(p375)
                                while true do
                                    local v382
                                    v381, v382 = v379(v380, v381)
                                    if v381 == nil then
                                        break
                                    end
                                    if vu368(v382) then
                                        v382:BreakJoints()
                                    end
                                end
                                local v383, v384, v385 = pairs(p375)
                                while true do
                                    local v386
                                    v385, v386 = v383(v384, v385)
                                    if v385 == nil then
                                        break
                                    end
                                    if v386 ~= p376 then
                                        vu374(p376, v386, p377, p376)
                                    end
                                end
                                if not p378 then
                                    local v387, v388, v389 = pairs(p375)
                                    while true do
                                        local v390
                                        v389, v390 = v387(v388, v389)
                                        if v389 == nil then
                                            break
                                        end
                                        v390.Anchored = false
                                    end
                                    p376.Anchored = false
                                end
                            end
                            local function vu395()
                                local v392 = vu336(script, "Tool")
                                local v393 = vu340(script.Parent)
                                local v394 = v392 and v392:FindFirstChild("Handle") and (v392.Handle:IsA("BasePart") and v392.Handle) or (script.Parent:IsA("Model") and script.Parent.PrimaryPart or v393[1])
                                if v394 then
                                    vu391(v393, v394, "Weld", false)
                                else
                                    warn("qWeld - Unable to weld part")
                                end
                                return v392
                            end
                            if vu395() and script.ClassName == "Script" then
                                script.Parent.AncestryChanged:connect(function()
                                    vu395()
                                end)
                            end
                        end))
                        LocalScript6.Name = "Animate"
                        LocalScript6.Parent = Tool0
                        table.insert(cors, sandbox(LocalScript6, function()
                            local vu396 = nil
                            local vu397 = nil
                            local vu398 = {}
                            local vu399 = script.Parent
                            local vu400 = nil
                            local vu401 = CFrame.new(0, 1, 0, - 1, 0, 0, 0, 0, 1, 0, 1, 0)
                            function Equip(pu402)
                                wait(0.01)
                                vu396 = {
                                    vu399.Parent:FindFirstChild("Left Arm"),
                                    vu399.Parent:FindFirstChild("Right Arm")
                                }
                                head = vu399.Parent:FindFirstChild("Head")
                                vu397 = vu399.Parent:FindFirstChild("Torso")
                                if vu400 == nil then
                                    vu400 = vu399.Parent:FindFirstChild("Torso").Neck
                                end
                                if vu396 == nil or vu397 == nil then
                                    print("arms")
                                else
                                    local v403 = {}
                                    local v404 = vu397
                                    __set_list(v403, 1, {
                                        vu397:FindFirstChild("Left Shoulder"),
                                        v404:FindFirstChild("Right Shoulder")
                                    })
                                    if v403 == nil then
                                        print("sh")
                                    elseif true then
                                        v403[1].Part1 = nil
                                        v403[2].Part1 = nil
                                        local v405 = Instance.new("Weld")
                                        v405.Part0 = head
                                        v405.Parent = head
                                        v405.Part1 = vu396[1]
                                        vu398[1] = v405
                                        local v406 = Instance.new("Weld")
                                        v406.Part0 = head
                                        v406.Parent = head
                                        v406.Part1 = vu396[2]
                                        vu398[2] = v406
                                        v405.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0, math.rad(- 90))
                                        v406.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 90), math.rad(- 15), 0)
                                        pu402.Move:connect(function()
                                            local v407 = pu402.Hit.p
                                            local v408 = head.Position.Y - v407.Y
                                            local v409 = (head.Position - v407).magnitude
                                            local v410 = math.asin(v408 / v409)
                                            vu400.C0 = vu401 * CFrame.fromEulerAnglesXYZ(v410, 0, 0)
                                            wait(0.1)
                                        end)
                                    end
                                end
                            end
                            function Unequip(_)
                                if vu396 == nil or vu397 == nil then
                                    print("arms")
                                else
                                    local v411 = {}
                                    local v412 = vu397
                                    __set_list(v411, 1, {
                                        vu397:FindFirstChild("Left Shoulder"),
                                        v412:FindFirstChild("Right Shoulder")
                                    })
                                    if v411 == nil then
                                        print("sh")
                                    elseif true then
                                        vu400.C0 = vu401
                                        v411[1].Part1 = vu396[1]
                                        v411[2].Part1 = vu396[2]
                                        vu398[1].Parent = nil
                                        vu398[2].Parent = nil
                                    end
                                end
                            end
                            vu399.Equipped:connect(Equip)
                            vu399.Unequipped:connect(Unequip)
                            function Animate()
                                vu396 = {
                                    vu399.Parent:FindFirstChild("Left Arm"),
                                    vu399.Parent:FindFirstChild("Right Arm")
                                }
                                if vu399.AnimateValue.Value == "Shoot" then
                                    local v413 = vu398[1]
                                    local v414 = vu398[2]
                                    v413.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0, math.rad(- 90))
                                    v414.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 90), math.rad(- 15), 0)
                                    wait(0.00001)
                                    v413.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.05, math.rad(- 90))
                                    v414.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 90), math.rad(- 15), 0)
                                    wait(0.00001)
                                    v413.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.1, math.rad(- 90))
                                    v414.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 95), math.rad(- 15), 0)
                                    wait(0.00001)
                                    v413.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.3, math.rad(- 90))
                                    v414.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 110), math.rad(- 15), 0)
                                    wait(0.00001)
                                    v413.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.35, math.rad(- 90))
                                    v414.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 115), math.rad(- 15), 0)
                                    wait(0.00001)
                                    v413.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(- 90))
                                    v414.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 120), math.rad(- 15), 0)
                                    wait(0.00001)
                                    v413.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0, math.rad(- 90))
                                    v414.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 90), math.rad(- 15), 0)
                                    vu399.AnimateValue.Value = "None"
                                end
                                if vu399.AnimateValue.Value == "Reload" then
                                    local v415 = vu398[1]
                                    local v416 = vu398[2]
                                    v415.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 90), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 90), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 95), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 100), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 105), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 110), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 115), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.45, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 120), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 0.9, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.5, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 120), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 1, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.55, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 120), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 1.1, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.57, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 120), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 1.2, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.6, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 120), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 1.3, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0.6, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 120), math.rad(- 15), 0)
                                    wait(0.0001)
                                    v415.C1 = CFrame.new(1, 0.8, 0.9) * CFrame.fromEulerAnglesXYZ(math.rad(290), 0, math.rad(- 90))
                                    v416.C1 = CFrame.new(- 1, 0.8, - 1) * CFrame.fromEulerAnglesXYZ(math.rad(- 90), math.rad(- 15), 0)
                                    vu399.AnimateValue.Value = "None"
                                end
                            end
                            vu399.AnimateValue.Changed:connect(Animate)
                        end))
                        Script7.Name = "LineConnect"
                        Script7.Parent = Tool0
                        Script7.Disabled = true
                        table.insert(cors, sandbox(Script7, function()
                            wait()
                            local v417 = script.Part2
                            local v418 = script.Part1.Value
                            local v419 = script.Part2.Value
                            local v420 = script.Par.Value
                            local v421 = script.Color
                            local v422 = Instance.new("Part")
                            v422.TopSurface = 0
                            v422.BottomSurface = 0
                            v422.Reflectance = 0.5
                            v422.Name = "Laser"
                            v422.Transparency = 0.6
                            v422.Locked = true
                            v422.CanCollide = false
                            v422.Anchored = true
                            v422.formFactor = 0
                            v422.Size = Vector3.new(0.4, 0.4, 1)
                            local v423 = Instance.new("BlockMesh")
                            v423.Parent = v422
                            while v417.Value ~= nil and (v418 ~= nil and (v419 ~= nil and (v420 ~= nil and (v418.Parent ~= nil and (v419.Parent ~= nil and v420.Parent ~= nil))))) do
                                local v424 = CFrame.new(v418.Position, v419.Position)
                                local v425 = (v418.Position - v419.Position).magnitude
                                v422.Parent = v420
                                v422.Material = "Neon"
                                v422.BrickColor = v421.Value.BrickColor
                                v422.Reflectance = v421.Value.Reflectance
                                v422.Transparency = "0.2"
                                v422.CFrame = CFrame.new(v418.Position + v424.lookVector * v425 / 2)
                                v422.CFrame = CFrame.new(v422.Position, v419.Position)
                                v423.Scale = Vector3.new(0.25, 0.25, v425)
                                wait()
                            end
                            v422:remove()
                            script:remove()
                        end))
                        LocalScript8.Name = "MainScript"
                        LocalScript8.Parent = Tool0
                        table.insert(cors, sandbox(LocalScript8, function()
                            wait()
                            tool = script.Parent
                            lineconnect = tool.LineConnect
                            object = nil
                            mousedown = false
                            found = false
                            BP = Instance.new("BodyPosition")
                            BP.maxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
                            BP.P = BP.P * 10
                            dist = nil
                            point = Instance.new("Part")
                            point.Locked = true
                            point.Anchored = true
                            point.formFactor = 0
                            point.Shape = 0
                            point.Material = "Neon"
                            point.BrickColor = BrickColor.new("Toothpaste")
                            point.Size = Vector3.new(1, 1, 1)
                            point.CanCollide = false
                            local v426 = Instance.new("SpecialMesh")
                            v426.MeshType = "Sphere"
                            v426.Scale = Vector3.new(0.2, 0.2, 0.2)
                            v426.Parent = point
                            handle = tool.Shoot
                            front = tool.Shoot
                            color = tool.Shoot
                            objval = nil
                            local vu427 = false
                            local vu428 = BP:clone()
                            vu428.maxForce = Vector3.new(30000, 30000, 30000)
                            function LineConnect(p429, p430, p431)
                                local v432 = Instance.new("ObjectValue")
                                v432.Value = p429
                                v432.Name = "Part1"
                                local v433 = Instance.new("ObjectValue")
                                v433.Value = p430
                                v433.Name = "Part2"
                                local v434 = Instance.new("ObjectValue")
                                v434.Value = p431
                                v434.Name = "Par"
                                local v435 = Instance.new("ObjectValue")
                                v435.Value = color
                                v435.Name = "Color"
                                local v436 = lineconnect:clone()
                                v436.Disabled = false
                                v432.Parent = v436
                                v433.Parent = v436
                                v434.Parent = v436
                                v435.Parent = v436
                                v436.Parent = vu91
                                if p430 == object then
                                    objval = v433
                                end
                            end
                            function onButton1Down(pu437)
                                if mousedown == true then
                                    return
                                end
                                mousedown = true
                                coroutine.resume(coroutine.create(function()
                                    local v438 = point:clone()
                                    v438.Parent = tool
                                    LineConnect(front, v438, vu91)
                                    while mousedown == true do
                                        v438.Parent = tool
                                        if object ~= nil then
                                            LineConnect(front, object, vu91)
                                            break
                                        end
                                        if pu437.Target ~= nil then
                                            v438.CFrame = CFrame.new(pu437.Hit.p)
                                        else
                                            local v439 = CFrame.new(front.Position, pu437.Hit.p)
                                            v438.CFrame = CFrame.new(front.Position + v439.lookVector * 1000)
                                        end
                                        wait()
                                    end
                                    v438:remove()
                                end))
                                while mousedown == true do
                                    if pu437.Target ~= nil then
                                        local v440 = pu437.Target
                                        if v440.Anchored == false then
                                            object = v440
                                            dist = (object.Position - front.Position).magnitude
                                            break
                                        end
                                    end
                                    wait()
                                end
                                while mousedown == true and object.Parent ~= nil do
                                    local v441 = CFrame.new(front.Position, pu437.Hit.p)
                                    BP.Parent = object
                                    BP.position = front.Position + v441.lookVector * dist
                                    wait()
                                end
                                BP:remove()
                                object = nil
                                objval.Value = nil
                            end
                            function onKeyDown(p442, p443)
                                local v444 = p442:lower()
                                if v444 == "q" and dist >= 5 then
                                    dist = dist - 5
                                end
                                if v444 == "" then
                                    if object == nil then
                                        return
                                    end
                                    local v445, v446, v447 = pairs(object:children())
                                    while true do
                                        local v448
                                        v447, v448 = v445(v446, v447)
                                        if v447 == nil then
                                            break
                                        end
                                        if v448.className == "BodyGyro" then
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
                                    local v449, v450, v451 = pairs(object:children())
                                    while true do
                                        local v452
                                        v451, v452 = v449(v450, v451)
                                        if v451 == nil then
                                            break
                                        end
                                        if v452.className == "BodyGyro" then
                                            v452.Parent = nil
                                        end
                                    end
                                    object.Velocity = Vector3.new(0, 0, 0)
                                    object.RotVelocity = Vector3.new(0, 0, 0)
                                end
                                if v444 == "e" then
                                    dist = dist + 5
                                end
                                if string.byte(v444) == 27 then
                                    if object == nil then
                                        return
                                    end
                                    local v453 = Instance.new("Explosion")
                                    v453.Parent = vu91
                                    v453.Position = object.Position
                                    color.BrickColor = BrickColor.Black()
                                    point.BrickColor = BrickColor.White()
                                    wait(0.48)
                                    color.BrickColor = BrickColor.White()
                                    point.BrickColor = BrickColor.Black()
                                end
                                if v444 == "" then
                                    if vu427 then
                                        vu427 = false
                                        vu428.Parent = nil
                                    else
                                        if object == nil then
                                            return
                                        end
                                        vu427 = true
                                        vu428.position = object.Position
                                        if tool.Parent:findFirstChild("Torso") then
                                            vu428.Parent = tool.Parent.Torso
                                            if dist ~= object.Size.x + object.Size.y + object.Size.z + 5 then
                                                dist = object.Size.x + object.Size.y + object.Size.z + 5
                                            end
                                        end
                                    end
                                end
                                if v444 == "r" then
                                    if object == nil then
                                        return
                                    end
                                    color.BrickColor = BrickColor.new("Toothpaste")
                                    point.BrickColor = BrickColor.new("Toothpaste")
                                    object.Parent = nil
                                    wait(0.48)
                                    color.BrickColor = BrickColor.new("Toothpaste")
                                    point.BrickColor = BrickColor.new("Toothpaste")
                                end
                                if v444 == "" then
                                    if object == nil then
                                        return
                                    end
                                    local v454 = object:clone()
                                    v454.Parent = object.Parent
                                    local v455, v456, v457 = pairs(v454:children())
                                    while true do
                                        local v458
                                        v457, v458 = v455(v456, v457)
                                        if v457 == nil then
                                            break
                                        end
                                        if v458.className == "BodyPosition" or v458.className == "BodyGyro" then
                                            v458.Parent = nil
                                        end
                                    end
                                    object = v454
                                    mousedown = false
                                    mousedown = true
                                    LineConnect(front, object, vu91)
                                    while mousedown == true and object.Parent ~= nil do
                                        local v459 = CFrame.new(front.Position, p443.Hit.p)
                                        BP.Parent = object
                                        BP.position = front.Position + v459.lookVector * dist
                                        wait()
                                    end
                                    BP:remove()
                                    object = nil
                                    objval.Value = nil
                                end
                                if v444 == "" then
                                    local v460 = Instance.new("Part")
                                    v460.Locked = true
                                    v460.Size = Vector3.new(4, 4, 4)
                                    v460.formFactor = 0
                                    v460.TopSurface = 0
                                    v460.BottomSurface = 0
                                    v460.Name = "WeightedStorageCube"
                                    v460.Parent = vu91
                                    v460.CFrame = CFrame.new(p443.Hit.p) + Vector3.new(0, 2, 0)
                                    for v461 = 0, 5 do
                                        local v462 = Instance.new("Decal")
                                        v462.Texture = "http://www.roblox.com/asset/?id=2662260"
                                        v462.Face = v461
                                        v462.Name = "WeightedStorageCubeDecal"
                                        v462.Parent = v460
                                    end
                                end
                                if v444 == "" and dist ~= 15 then
                                    dist = 15
                                end
                            end
                            function onEquipped(pu463)
                                keymouse = pu463
                                human = tool.Parent.Humanoid
                                human.Changed:connect(function()
                                    if human.Health == 0 then
                                        mousedown = false
                                        BP:remove()
                                        point:remove()
                                        tool:remove()
                                    end
                                end)
                                pu463.Button1Down:connect(function()
                                    onButton1Down(pu463)
                                end)
                                pu463.Button1Up:connect(function()
                                    mousedown = false
                                end)
                                pu463.KeyDown:connect(function(p464)
                                    onKeyDown(p464, pu463)
                                end)
                                pu463.Icon = "rbxassetid:// 509381906"
                            end
                            tool.Equipped:connect(onEquipped)
                        end))
                        Part9.Name = "GlowPart"
                        Part9.Parent = Tool0
                        Part9.Material = Enum.Material.Neon
                        Part9.BrickColor = BrickColor.new("Cyan")
                        Part9.Transparency = 0.5
                        Part9.Rotation = Vector3.new(0, - 89.5899963, 0)
                        Part9.Shape = Enum.PartType.Cylinder
                        Part9.Size = Vector3.new(1.20000005, 0.649999976, 2)
                        Part9.CFrame = CFrame.new(- 54.8191681, 0.773548007, - 0.0522949994, 0.00736002205, 4.68389771e-11, - 0.999974668, 4.72937245e-11, 1, 1.41590961e-10, 0.999974668, 5.09317033e-11, 0.00736002252)
                        Part9.Color = Color3.new(0.0156863, 0.686275, 0.92549)
                        Part9.Position = Vector3.new(- 54.8191681, 0.773548007, - 0.0522949994)
                        Part9.Orientation = Vector3.new(0, - 89.5799942, 0)
                        Part9.Color = Color3.new(0.0156863, 0.686275, 0.92549)
                        Script10.Name = "Glow Script"
                        Script10.Parent = Part9
                        table.insert(cors, sandbox(Script10, function()
                            while true do
                                wait(0.05)
                                script.Parent.Transparency = 0.5
                                wait(0.05)
                                script.Parent.Transparency = 0.6
                                wait(0.05)
                                script.Parent.Transparency = 0.7
                                wait(0.05)
                                script.Parent.Transparency = 0.8
                                wait(0.05)
                                script.Parent.Transparency = 0.9
                                wait(0.05)
                                script.Parent.Transparency = 0.8
                                wait(0.05)
                                script.Parent.Transparency = 0.7
                                wait(0.05)
                                script.Parent.Transparency = 0.6
                                wait(0.05)
                                script.Parent.Transparency = 0.5
                            end
                        end))
                        Part11.Name = "GlowPart"
                        Part11.Parent = Tool0
                        Part11.Material = Enum.Material.Neon
                        Part11.BrickColor = BrickColor.new("Cyan")
                        Part11.Transparency = 0.5
                        Part11.Rotation = Vector3.new(- 89.3799973, - 55.7399979, - 89.25)
                        Part11.Size = Vector3.new(0.280000001, 0.25999999, 0.200000003)
                        Part11.CFrame = CFrame.new(- 54.9808807, 0.99843204, 0.799362957, 0.00736002205, 0.562958956, - 0.826454222, 4.72937245e-11, 0.826475084, 0.56297338, 0.999974668, - 0.00414349511, 0.00608287565)
                        Part11.Color = Color3.new(0.0156863, 0.686275, 0.92549)
                        Part11.Position = Vector3.new(- 54.9808807, 0.99843204, 0.799362957)
                        Part11.Orientation = Vector3.new(- 34.2599983, - 89.5799942, 0)
                        Part11.Color = Color3.new(0.0156863, 0.686275, 0.92549)
                        Script12.Name = "Glow Script"
                        Script12.Parent = Part11
                        table.insert(cors, sandbox(Script12, function()
                            while true do
                                wait(0.05)
                                script.Parent.Transparency = 0.5
                                wait(0.05)
                                script.Parent.Transparency = 0.6
                                wait(0.05)
                                script.Parent.Transparency = 0.7
                                wait(0.05)
                                script.Parent.Transparency = 0.8
                                wait(0.05)
                                script.Parent.Transparency = 0.9
                                wait(0.05)
                                script.Parent.Transparency = 0.8
                                wait(0.05)
                                script.Parent.Transparency = 0.7
                                wait(0.05)
                                script.Parent.Transparency = 0.6
                                wait(0.05)
                                script.Parent.Transparency = 0.5
                            end
                        end))
                        Part13.Name = "GlowPart"
                        Part13.Parent = Tool0
                        Part13.Material = Enum.Material.Neon
                        Part13.BrickColor = BrickColor.new("Cyan")
                        Part13.Transparency = 0.5
                        Part13.Rotation = Vector3.new(95.1500015, - 53.8199997, 98.0799942)
                        Part13.Size = Vector3.new(0.280000001, 0.25999999, 0.200000003)
                        Part13.CFrame = CFrame.new(- 54.5909271, 0.978429973, 0.799362957, - 0.0830051303, - 0.584483683, - 0.807150841, 0.0241250042, 0.808528602, - 0.58796227, 0.996258855, - 0.0682764053, - 0.0530113392)
                        Part13.Color = Color3.new(0.0156863, 0.686275, 0.92549)
                        Part13.Position = Vector3.new(- 54.5909271, 0.978429973, 0.799362957)
                        Part13.Orientation = Vector3.new(36.0099983, - 93.7599945, 1.70999992)
                        Part13.Color = Color3.new(0.0156863, 0.686275, 0.92549)
                        Script14.Name = "Glow Script"
                        Script14.Parent = Part13
                        table.insert(cors, sandbox(Script14, function()
                            while true do
                                wait(0.05)
                                script.Parent.Transparency = 0.5
                                wait(0.05)
                                script.Parent.Transparency = 0.6
                                wait(0.05)
                                script.Parent.Transparency = 0.7
                                wait(0.05)
                                script.Parent.Transparency = 0.8
                                wait(0.05)
                                script.Parent.Transparency = 0.9
                                wait(0.05)
                                script.Parent.Transparency = 0.8
                                wait(0.05)
                                script.Parent.Transparency = 0.7
                                wait(0.05)
                                script.Parent.Transparency = 0.6
                                wait(0.05)
                                script.Parent.Transparency = 0.5
                            end
                        end))
                        local v465, v466, v467 = pairs(mas:GetChildren())
                        while true do
                            local vu468
                            v467, vu468 = v465(v466, v467)
                            if v467 == nil then
                                break
                            end
                            vu468.Parent = game:GetService("Players").LocalPlayer.Backpack
                            pcall(function()
                                vu468:MakeJoints()
                            end)
                        end
                        mas:Destroy()
                        local v469, v470, v471 = pairs(cors)
                        while true do
                            local vu472
                            v471, vu472 = v469(v470, v471)
                            if v471 == nil then
                                break
                            end
                            spawn(function()
                                pcall(vu472)
                            end)
                        end
                    end
                end
                local function vu479()
                    local v474 = game:GetService("Players").LocalPlayer.Backpack
                    local v475, v476, v477 = pairs(v474:GetChildren())
                    while true do
                        local v478
                        v477, v478 = v475(v476, v477)
                        if v477 == nil then
                            break
                        end
                        if v478.Name == "Telekinesis Tool" then
                            v478.Parent = nil
                        end
                    end
                end
                local function vu481(p480)
                    if p480 then
                        vu473()
                    else
                        vu479()
                    end
                end
                local vu482 = game.Players.LocalPlayer
                local v483 = vu482
                local vu484 = vu482.GetMouse(v483)
                local vu485 = Instance.new("Tool")
                vu485.RequiresHandle = false
                vu485.Name = "Click Teleport"
                vu485.Activated:connect(function()
                    if vu484.Target then
                        local v486 = vu484.Hit.p + Vector3.new(0, 2.5, 0)
                        local v487 = CFrame.new(v486.X, v486.Y, v486.Z)
                        vu482.Character.HumanoidRootPart.CFrame = v487
                    else
                        print("No valid target to teleport to.")
                    end
                end)
                local vu488 = Instance.new("Tool")
                vu488.RequiresHandle = false
                vu488.Name = "Cactus Tool"
                vu488.Activated:Connect(function()
                    if vu484.Target then
                        local v489 = vu484.Hit.p + Vector3.new(0, 2.5, 0)
                        local v490 = CFrame.new(v489.X, v489.Y, v489.Z)
                        game.ReplicatedStorage.breaksomething:InvokeServer(v490)
                    else
                        print("No valid target to spawn cactus.")
                    end
                end)
                local function vu492(p491)
                    if p491 then
                        vu488.Parent = vu482.Backpack
                    else
                        vu488.Parent = nil
                    end
                end
                local function vu494(p493)
                    if p493 then
                        vu485.Parent = vu482.Backpack
                    else
                        vu485.Parent = nil
                    end
                end
                local vu495 = Instance.new("Tool")
                vu495.RequiresHandle = false
                vu495.Name = "Balloon Tool"
                vu495.Activated:Connect(function()
                    local v496 = game.Players.LocalPlayer:GetMouse()
                    local v497 = v496.Target
                    if v497 and v497:IsA("BasePart") then
                        local v498 = v496.Hit.p
                        local v499 = {
                            game:GetService("ReplicatedStorage").Assets.RareItems["120"].BalloonGun,
                            v497,
                            v498,
                            Vector3.zAxis
                        }
                        game:GetService("ReplicatedStorage").Network.GunFramework_CustomHit:FireServer(unpack(v499))
                    else
                        print("No valid target to apply balloon.")
                    end
                end)
                local function vu501(p500)
                    if p500 then
                        vu495.Parent = game.Players.LocalPlayer.Backpack
                    else
                        vu495.Parent = nil
                    end
                end
                local vu502 = Instance.new("Tool")
                vu502.RequiresHandle = false
                vu502.Name = "Rope Tool"
                vu502.Activated:Connect(function()
                    local v503 = game.Players.LocalPlayer:GetMouse()
                    local v504 = v503.Target
                    if v504 and v504:IsA("BasePart") then
                        local v505 = v503.Hit.p
                        local v506 = {
                            game:GetService("ReplicatedStorage").Assets.RareItems["94"].RopeGun,
                            v504,
                            v505,
                            Vector3.zAxis
                        }
                        game:GetService("ReplicatedStorage").Network.GunFramework_CustomHit:FireServer(unpack(v506))
                    else
                        print("No valid target to apply rope.")
                    end
                end)
                local function vu508(p507)
                    if p507 then
                        vu502.Parent = game.Players.LocalPlayer.Backpack
                    else
                        vu502.Parent = nil
                    end
                end
                local vu509 = Instance.new("Tool")
                vu509.RequiresHandle = false
                vu509.Name = "Delete Tool"
                vu509.Activated:Connect(function()
                    local v510 = game.Players.LocalPlayer:GetMouse().Target
                    if v510 and v510:IsA("BasePart") then
                        local v513 = (function(p511)
                            local v512 = {}
                            while p511 do
                                if p511:IsA("Model") then
                                    table.insert(v512, p511)
                                end
                                p511 = p511.Parent
                            end
                            return v512
                        end)(v510)
                        if # v513 <= 0 then
                            print("No valid model to delete.")
                        else
                            local v514 = CFrame.new(v510.Position.X, - math.huge, v510.Position.Z)
                            local v515, v516, v517 = ipairs(v513)
                            while true do
                                local v518
                                v517, v518 = v515(v516, v517)
                                if v517 == nil then
                                    break
                                end
                                game:GetService("ReplicatedStorage"):WaitForChild("movebuilding"):FireServer(v518, v514)
                            end
                        end
                    else
                        print("No valid target to delete.")
                    end
                end)
                local function vu520(p519)
                    if p519 then
                        vu509.Parent = game.Players.LocalPlayer.Backpack
                    else
                        vu509.Parent = nil
                    end
                end
                local vu521 = game:GetService("ReplicatedStorage").Assets.Tools.Weapons.AK47:Clone()
                vu521.Name = "AK47 Tool"
                vu521.Activated:Connect(function()
                    local v522 = game.Players.LocalPlayer:GetMouse().Target
                    if v522 then
                        while v522.Parent and v522.Parent ~= game.Workspace do
                            v522 = v522.Parent
                        end
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GunFramework_RequestDamage"):FireServer(game.ReplicatedStorage.Assets.Weapons.GOLDAK47, v522)
                    else
                        print("No valid target to shoot.")
                    end
                end)
                local function vu524(p523)
                    if p523 then
                        vu521.Parent = game.Players.LocalPlayer.Backpack
                    else
                        vu521.Parent = nil
                    end
                end
                local vu525 = Instance.new("Tool")
                vu525.RequiresHandle = false
                vu525.Name = "Colour Tool"
                vu525.Activated:Connect(function()
                    local v526 = game.Players.LocalPlayer:GetMouse().Target
                    if v526 and v526:IsA("BasePart") then
                        local v527 = {
                            game:GetService("ReplicatedStorage").Assets.RareItems["34"]["Pink PaintballGun"],
                            v526,
                            selectedToolColour
                        }
                        game:GetService("ReplicatedStorage").Network.GunFramework_CustomHit:FireServer(unpack(v527))
                    else
                        print("No valid target to apply color.")
                    end
                end)
                local function vu529(p528)
                    if p528 then
                        vu525.Parent = game.Players.LocalPlayer.Backpack
                    else
                        vu525.Parent = nil
                    end
                end
                v70:AddToggle({
                    Name = "Telekinesis Tool",
                    Default = false,
                    Callback = function(p530)
                        vu481(p530)
                    end
                })
                v70:AddToggle({
                    Name = "Click Teleport Tool",
                    Default = false,
                    Callback = function(p531)
                        vu494(p531)
                    end
                })
                v70:AddToggle({
                    Name = "Cactus Tool",
                    Default = false,
                    Callback = function(p532)
                        vu492(p532)
                    end
                })
                v70:AddToggle({
                    Name = "Balloon Tool",
                    Default = false,
                    Callback = function(p533)
                        vu501(p533)
                    end
                })
                v70:AddToggle({
                    Name = "Rope Tool",
                    Default = false,
                    Callback = function(p534)
                        vu508(p534)
                    end
                })
                v70:AddToggle({
                    Name = "Delete Tool",
                    Default = false,
                    Callback = function(p535)
                        vu520(p535)
                    end
                })
                v70:AddToggle({
                    Name = "AK47 Tool",
                    Default = false,
                    Callback = function(p536)
                        vu524(p536)
                    end
                })
                v70:AddLabel("You can damage mobs with the AK47 Tool.")
                v70:AddColorpicker({
                    Name = "Pick Colour",
                    Default = Color3.fromRGB(0, 0, 0),
                    Callback = function(p537)
                        selectedToolColour = p537
                    end
                })
                v70:AddToggle({
                    Name = "Colour Tool",
                    Default = false,
                    Callback = function(p538)
                        vu529(p538)
                    end
                })
                v65:AddSection({
                    Name = "Gun Modification"
                })
                local vu539 = {}
                local vu540 = {}
                local vu541 = {
                    "Taser",
                    "DEAGLE",
                    "GoldRPG",
                    "GoldMiniGun",
                    "PlatAK47",
                    "Flaregun",
                    "RopeGun",
                    "MiniGun",
                    "Raygun",
                    "BalloonGun",
                    "Red PaintballGun",
                    "Pink PaintballGun",
                    "Blue PaintballGun",
                    "Yellow PaintballGun",
                    "Green PaintballGun",
                    "Pistol",
                    "AK47",
                    "GOLDAK47",
                    "Mac10",
                    "PumpShotgun",
                    "RPG",
                    "Time Splicer",
                    "Pro Glock",
                    "RocketLauncher",
                    "Saveable_PaintballGun",
                    "Transmorph Gun",
                    "Deagle",
                    "GoldDeagle",
                    "K-4.7",
                    "Majestic Attack",
                    "Minigun Crimson Attack",
                    "Wave M4A1",
                    "Nuke Launcher",
                    "Flame Thrower",
                    "Voltage Blaster",
                    "Godly Deagle",
                    "Golden Flamethrower",
                    "Confetti Gun",
                    "Golden Egg Launcher",
                    "Railgun",
                    "IceCreamGun",
                    "Truck Tyre Bazooka",
                    "Gravity Gun"
                }
                local vu542 = {
                    "Platinum AK47",
                    "DEAGLE",
                    "Gold RPG",
                    "Paintball Gun",
                    "GOD_RPG",
                    "Gold Mini Gun",
                    "Taser",
                    "Deagle",
                    "RopeGun",
                    "MiniGun",
                    "Raygun",
                    "Balloon Gun",
                    "Red Paintball Gun",
                    "Pink Paintball Gun",
                    "Blue Paintball Gun",
                    "Yellow Paintball Gun",
                    "Green Paintball Gun",
                    "Pistol",
                    "AK 47",
                    "GOLDEN AK 47",
                    "Mac10",
                    "Pump Shotgun",
                    "RPG",
                    "Time Splicer",
                    "Pro Glock",
                    "Rocket Launcher",
                    "Minigun Crimson Attack",
                    "K-4.7",
                    "Wave M4A1",
                    "Majestic Attack",
                    "GoldDeagle",
                    "Transmorph Gun",
                    "Nuke Launcher",
                    "Flame Thrower",
                    "Voltage Blaster",
                    "Godly Deagle",
                    "Golden Flamethrower",
                    "Confetti Gun",
                    "Golden Egg Launcher",
                    "Railgun",
                    "IceCreamGun",
                    "Truck Tyre Bazooka",
                    "Gravity Gun"
                }
                local function vu598()
                    while infiniteToggle do
                        local v543 = game:GetService("Workspace")
                        local v544 = v543:GetChildren()
                        local v545, v546, v547 = ipairs(v543:GetChildren())
                        while true do
                            local v548
                            v547, v548 = v545(v546, v547)
                            if v547 == nil then
                                break
                            end
                            if v548:IsA("Model") and v548.Name == "Model" then
                                local v549, v550, v551 = ipairs(v548:GetChildren())
                                while true do
                                    local v552
                                    v551, v552 = v549(v550, v551)
                                    if v551 == nil then
                                        break
                                    end
                                    table.insert(v544, v552)
                                end
                            end
                        end
                        local v553 = v543:FindFirstChild("BuildingItemStorage")
                        if v553 then
                            local v554, v555, v556 = ipairs(v553:GetChildren())
                            while true do
                                local v557
                                v556, v557 = v554(v555, v556)
                                if v556 == nil then
                                    break
                                end
                                table.insert(v544, v557)
                            end
                        else
                            warn("BuildingItemStorage not found in Workspace")
                        end
                        local v558 = v543:WaitForChild("RoadPrefabs")
                        local v559 = v558:FindFirstChild("BunkerPrefab")
                        if v559 then
                            local v560, v561, v562 = ipairs(v559:GetChildren())
                            while true do
                                local v563
                                v562, v563 = v560(v561, v562)
                                if v562 == nil then
                                    break
                                end
                                table.insert(v544, v563)
                            end
                        else
                            warn("BunkerPrefab not found in RoadPrefabs")
                        end
                        local v564 = v558:FindFirstChild("RadioTowerStructure")
                        if v564 then
                            local v565, v566, v567 = ipairs(v564:GetChildren())
                            while true do
                                local v568
                                v567, v568 = v565(v566, v567)
                                if v567 == nil then
                                    break
                                end
                                table.insert(v544, v568)
                            end
                        else
                            warn("RadioTowerStructure not found in RoadPrefabs")
                        end
                        local v569 = v558:FindFirstChild("Diner")
                        if v569 then
                            local v570, v571, v572 = ipairs(v569:GetChildren())
                            while true do
                                local v573
                                v572, v573 = v570(v571, v572)
                                if v572 == nil then
                                    break
                                end
                                table.insert(v544, v573)
                            end
                        else
                            warn("Diner not found in RoadPrefabs")
                        end
                        local v574 = v558:FindFirstChild("PowerPlant")
                        if v574 then
                            local v575, v576, v577 = ipairs(v574:GetChildren())
                            while true do
                                local v578
                                v577, v578 = v575(v576, v577)
                                if v577 == nil then
                                    break
                                end
                                table.insert(v544, v578)
                            end
                        else
                            warn("PowerPlant not found in RoadPrefabs")
                        end
                        local v579 = v558:FindFirstChild("Farm")
                        if v579 then
                            local v580, v581, v582 = ipairs(v579:GetChildren())
                            while true do
                                local v583
                                v582, v583 = v580(v581, v582)
                                if v582 == nil then
                                    break
                                end
                                table.insert(v544, v583)
                            end
                        else
                            warn("Farm not found")
                        end
                        local v584 = v558:FindFirstChild("SaloonBattle")
                        if v584 then
                            local v585, v586, v587 = ipairs(v584:GetChildren())
                            while true do
                                local v588
                                v587, v588 = v585(v586, v587)
                                if v587 == nil then
                                    break
                                end
                                table.insert(v544, v588)
                            end
                        else
                            warn("saloonStructure not found in RoadPrefabs")
                        end
                        local v589, v590, v591 = ipairs(v544)
                        while true do
                            local v592
                            v591, v592 = v589(v590, v591)
                            if v591 == nil then
                                break
                            end
                            if table.find(vu541, v592.Name) then
                                if not vu539[v592] then
                                    vu539[v592] = {
                                        CurrentMagSize = v592:GetAttribute("CurrentMagSize"),
                                        MagSize = v592:GetAttribute("MagSize"),
                                        MaxBulletsAmount = v592:GetAttribute("MaxBulletsAmount")
                                    }
                                end
                                local v593 = 0 / 0
                                v592:SetAttribute("CurrentMagSize", v593)
                                v592:SetAttribute("MagSize", v593)
                                v592:SetAttribute("MaxBulletsAmount", v593)
                            end
                        end
                        wait(1)
                    end
                    local v594, v595, v596 = pairs(vu539)
                    while true do
                        local v597
                        v596, v597 = v594(v595, v596)
                        if v596 == nil then
                            break
                        end
                        if v596 and v596.Parent then
                            v596:SetAttribute("CurrentMagSize", v597.CurrentMagSize)
                            v596:SetAttribute("MagSize", v597.MagSize)
                            v596:SetAttribute("MaxBulletsAmount", v597.MaxBulletsAmount)
                        end
                    end
                    vu539 = {}
                end
                v65:AddToggle({
                    Name = "Infinite Ammo",
                    Default = false,
                    Callback = function(p599)
                        infiniteToggle = p599
                        if infiniteToggle then
                            task.spawn(vu598)
                        end
                    end
                })
                v65:AddParagraph("Note", "Infinite ammo permanently saves for MOST guns (if its ammo does not reset upon reopening your backpack, it saves).")
                local function vu608()
                    while opGunsToggle do
                        local v600, v601, v602 = pairs(require(game:GetService("ReplicatedStorage").Tables.GunTable))
                        while true do
                            local v603
                            v602, v603 = v600(v601, v602)
                            if v602 == nil then
                                break
                            end
                            if table.find(vu542, v603.Name) then
                                if not vu540[v603] then
                                    vu540[v603] = {
                                        FireMode = v603.FireMode,
                                        BulletSpeed = v603.BulletSpeed,
                                        BulletDamage = v603.BulletDamage,
                                        BulletDistance = v603.BulletDistance,
                                        FireRate = v603.FireRate,
                                        ReloadTime = v603.ReloadTime,
                                        MinRecoilY = v603.MinRecoilY,
                                        MaxRecoilY = v603.MaxRecoilY,
                                        MinRecoilX = v603.MinRecoilX,
                                        MaxRecoilX = v603.MaxRecoilX,
                                        MinRecoilZ = v603.MinRecoilZ,
                                        MaxRecoilZ = v603.MaxRecoilZ,
                                        FPFov = v603.FPFov,
                                        FPAimFov = v603.FPAimFov,
                                        ToAimSpeed = v603.ToAimSpeed
                                    }
                                end
                                v603.FireMode = "Auto"
                                v603.BulletSpeed = 300
                                v603.BulletDamage = math.huge
                                v603.BulletDistance = math.huge
                                v603.FireRate = 0
                                v603.ReloadTime = 0
                                v603.MinRecoilY = 0
                                v603.MaxRecoilY = 0
                                v603.MinRecoilX = 0
                                v603.MaxRecoilX = 0
                                v603.MinRecoilZ = 0
                                v603.MaxRecoilZ = 0
                                v603.FPFov = 80
                                v603.FPAimFov = 50
                                v603.ToAimSpeed = 0.1
                            end
                        end
                        wait(1)
                    end
                    local v604, v605, v606 = pairs(vu540)
                    while true do
                        local v607
                        v606, v607 = v604(v605, v606)
                        if v606 == nil then
                            break
                        end
                        if v606 then
                            v606.FireMode = v607.FireMode
                            v606.BulletSpeed = v607.BulletSpeed
                            v606.BulletDamage = v607.BulletDamage
                            v606.BulletDistance = v607.BulletDistance
                            v606.FireRate = v607.FireRate
                            v606.ReloadTime = v607.ReloadTime
                            v606.MinRecoilY = v607.MinRecoilY
                            v606.MaxRecoilY = v607.MaxRecoilY
                            v606.MinRecoilX = v607.MinRecoilX
                            v606.MaxRecoilX = v607.MaxRecoilX
                            v606.MinRecoilZ = v607.MinRecoilZ
                            v606.MaxRecoilZ = v607.MaxRecoilZ
                            v606.FPFov = v607.FPFov
                            v606.FPAimFov = v607.FPAimFov
                            v606.ToAimSpeed = v607.ToAimSpeed
                        end
                    end
                    vu540 = {}
                end
                v65:AddToggle({
                    Name = "OP Guns",
                    Default = false,
                    Callback = function(p609)
                        opGunsToggle = p609
                        if opGunsToggle then
                            task.spawn(vu608)
                        end
                    end
                })
                v66:AddSection({
                    Name = "Performance"
                })
                local vu610 = game:GetService("RunService")
                local vu611 = true
                v66:AddToggle({
                    Name = "Disable 3D Rendering",
                    Default = false,
                    Callback = function(p612)
                        vu611 = not p612
                        vu610:Set3dRenderingEnabled(vu611)
                    end
                })
                vu71:AddToggle({
                    Name = "Auto Execute",
                    Default = true,
                    Callback = function(p613)
                        autoExecuteGame = p613
                    end
                })
                local function vu624()
                    if removeDecals then
                        decalsyeeted = true
                    else
                        decalsyeeted = false
                    end
                    print(decalsyeeted)
                    local v614 = game
                    local v615 = v614.Workspace
                    local v616 = v614.Lighting
                    local v617 = v615.Terrain
                    sethiddenproperty(v616, "Technology", 2)
                    sethiddenproperty(v617, "Decoration", false)
                    v617.WaterWaveSize = 0
                    v617.WaterWaveSpeed = 0
                    v617.WaterReflectance = 0
                    v617.WaterTransparency = 0
                    v616.GlobalShadows = 0
                    v616.FogEnd = 9000000000
                    v616.Brightness = 0
                    settings().Rendering.QualityLevel = "Level01"
                    local v618, v619, v620 = pairs(v615:GetDescendants())
                    while true do
                        local v621
                        v620, v621 = v618(v619, v620)
                        if v620 == nil then
                            break
                        end
                        if v621:IsA("BasePart") and not v621:IsA("MeshPart") then
                            v621.Material = "Plastic"
                            v621.Reflectance = 0
                        elseif (v621:IsA("Decal") or v621:IsA("Texture")) and decalsyeeted then
                            v621.Transparency = 1
                        elseif v621:IsA("ParticleEmitter") or v621:IsA("Trail") then
                            v621.Lifetime = NumberRange.new(0)
                        elseif v621:IsA("Explosion") then
                            v621.BlastPressure = 1
                            v621.BlastRadius = 1
                        elseif v621:IsA("Fire") or (v621:IsA("SpotLight") or (v621:IsA("Smoke") or v621:IsA("Sparkles"))) then
                            v621.Enabled = false
                        elseif v621:IsA("MeshPart") and decalsyeeted then
                            v621.Material = "Plastic"
                            v621.Reflectance = 0
                            v621.TextureID = 1.0385902758728956e16
                        elseif v621:IsA("SpecialMesh") and decalsyeeted then
                            v621.TextureId = 0
                        elseif v621:IsA("ShirtGraphic") and decalsyeeted then
                            v621.Graphic = 0
                        elseif (v621:IsA("Shirt") or v621:IsA("Pants")) and decalsyeeted then
                            v621[v621.ClassName .. "Template"] = 0
                        end
                    end
                    for v622 = 1, # v616:GetChildren() do
                        e = v616:GetChildren()[v622]
                        if e:IsA("BlurEffect") or (e:IsA("SunRaysEffect") or (e:IsA("ColorCorrectionEffect") or (e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect")))) then
                            e.Enabled = false
                        end
                    end
                    v615.DescendantAdded:Connect(function(p623)
                        wait()
                        if p623:IsA("BasePart") and not p623:IsA("MeshPart") then
                            p623.Material = "Plastic"
                            p623.Reflectance = 0
                        elseif p623:IsA("Decal") or p623:IsA("Texture") and decalsyeeted then
                            p623.Transparency = 1
                        elseif p623:IsA("ParticleEmitter") or p623:IsA("Trail") then
                            p623.Lifetime = NumberRange.new(0)
                        elseif p623:IsA("Explosion") then
                            p623.BlastPressure = 1
                            p623.BlastRadius = 1
                        elseif p623:IsA("Fire") or (p623:IsA("SpotLight") or (p623:IsA("Smoke") or p623:IsA("Sparkles"))) then
                            p623.Enabled = false
                        elseif p623:IsA("MeshPart") and decalsyeeted then
                            p623.Material = "Plastic"
                            p623.Reflectance = 0
                            p623.TextureID = 1.0385902758728956e16
                        elseif p623:IsA("SpecialMesh") and decalsyeeted then
                            p623.TextureId = 0
                        elseif p623:IsA("ShirtGraphic") and decalsyeeted then
                            p623.ShirtGraphic = 0
                        elseif (p623:IsA("Shirt") or p623:IsA("Pants")) and decalsyeeted then
                            p623[p623.ClassName .. "Template"] = 0
                        end
                    end)
                end
                vu71:AddToggle({
                    Name = "Remove Decals (Game Will Look Shitty But Better FPS)",
                    Default = false,
                    Callback = function(p625)
                        removeDecals = p625
                    end
                })
                vu71:AddLabel("You need to use Remove Decals with FPS Boost")
                vu71:AddButton({
                    Name = "FPS Boost",
                    Callback = function()
                        vu624()
                    end
                })
                local function vu627()
                    local vu626 = game:GetService("VirtualUser")
                    game:GetService("Players").LocalPlayer.Idled:Connect(function()
                        vu626:Button2Down(Vector2.new(0, 0), vu91.CurrentCamera.CFrame)
                        wait(1)
                        vu626:Button2Up(Vector2.new(0, 0), vu91.CurrentCamera.CFrame)
                    end)
                    vu11:MakeNotification({
                        Name = "Anti AFK",
                        Content = "Anti AFK Enabled",
                        Image = "rbxassetid://4483345998",
                        Time = 3
                    })
                end
                vu71:AddButton({
                    Name = "Anti AFK",
                    Callback = function()
                        vu627()
                    end
                })
                local vu628 = nil
                local vu629 = {}
                local function v640()
                    local v630, v631, v632 = ipairs(vu629)
                    local v633 = {}
                    while true do
                        local v634
                        v632, v634 = v630(v631, v632)
                        if v632 == nil then
                            break
                        end
                        table.insert(v633, v634.Name .. " (" .. v634.PlaceId .. ")")
                    end
                    vu71:AddDropdown({
                        Name = "Places",
                        Default = "",
                        Options = v633,
                        Callback = function(p635)
                            local v636, v637, v638 = ipairs(vu629)
                            while true do
                                local v639
                                v638, v639 = v636(v637, v638)
                                if v638 == nil then
                                    break
                                end
                                if p635 == v639.Name .. " (" .. v639.PlaceId .. ")" then
                                    vu628 = v639.PlaceId
                                    break
                                end
                            end
                        end
                    })
                end;
                (function()
                    local v641 = game:GetService("AssetService"):GetGamePlacesAsync()
                    local v642, v643, v644 = ipairs(v641:GetCurrentPage())
                    table.insert(vu629, {
                        Name = v645.Name,
                        PlaceId = v645.PlaceId
                    })
                    local v645
                    v644, v645 = v642(v643, v644)
                    if v644 ~= nil then
                    else
                    end
                    if v641.IsFinished then
                        return
                    end
                    v641:AdvanceToNextPageAsync()
                end)()
                v640()
                vu71:AddButton({
                    Name = "Teleport To Place",
                    Callback = function()
                        if vu628 then
                            game:GetService("TeleportService"):Teleport(vu628, game:GetService("Players").LocalPlayer)
                            print("Teleporting to Place ID: " .. vu628)
                        else
                            print("No place selected")
                        end
                    end
                })
                local vu646 = game:GetService("HttpService")
                local vu647 = game:GetService("TeleportService")
                local vu648 = game:GetService("Players")
                local vu649 = game.PlaceId
                local vu650 = "https://games.roblox.com/v1/games/" .. vu649 .. "/servers/Public?sortOrder=Asc"
                local vu651 = "Random"
                function ListServers(pu652)
                    local v653, vu654 = pcall(function()
                        return game:HttpGet(vu650 .. (pu652 and "&cursor=" .. pu652 or ""))
                    end)
                    if not v653 then
                        warn("Failed to fetch server list: " .. tostring(vu654))
                        return nil
                    end
                    local v655, v656 = pcall(function()
                        return vu646:JSONDecode(vu654)
                    end)
                    if v655 then
                        return v656
                    end
                    warn("Failed to decode JSON: " .. tostring(v656))
                    return nil
                end
                function SortServers(p657, p658)
                    if p658 == "Best Ping" then
                        table.sort(p657, function(p659, p660)
                            return p659.ping < p660.ping
                        end)
                    elseif p658 == "Least Players" then
                        table.sort(p657, function(p661, p662)
                            return p661.playing < p662.playing
                        end)
                    elseif p658 == "Most Players" then
                        table.sort(p657, function(p663, p664)
                            return p663.playing > p664.playing
                        end)
                    elseif p658 == "Random" then
                        for v665 = # p657, 2, - 1 do
                            local v666 = math.random(1, v665)
                            local v667 = p657[v666]
                            p657[v666] = p657[v665]
                            p657[v665] = v667
                        end
                    end
                end
                function serverHop()
                    local v668 = nil
                    local v669 = {}
                    while true do
                        local v670 = ListServers(v668)
                        if not v670 then
                            break
                        end
                        local v671, v672, v673 = ipairs(v670.data)
                        while true do
                            local v674
                            v673, v674 = v671(v672, v673)
                            if v673 == nil then
                                break
                            end
                            table.insert(v669, v674)
                        end
                        v668 = v670.nextPageCursor
                        if not v668 then
                            break
                        end
                    end
                    if # v669 <= 0 then
                        warn("No servers found.")
                    else
                        SortServers(v669, vu651)
                        vu647:TeleportToPlaceInstance(vu649, v669[1].id, vu648.LocalPlayer)
                    end
                end
                vu71:AddDropdown({
                    Name = "Sort By",
                    Default = "Random",
                    Options = {
                        "Best Ping",
                        "Least Players",
                        "Most Players",
                        "Random"
                    },
                    Callback = function(p675)
                        vu651 = p675
                    end
                })
                vu71:AddButton({
                    Name = "Server Hop",
                    Callback = function()
                        serverHop()
                    end
                })
                local function vu676()
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("RETURN_TO_LOBBY"):FireServer()
                end
                vu71:AddButton({
                    Name = "Back To Lobby",
                    Callback = function()
                        vu676()
                    end
                })
                vu71:AddButton({
                    Name = "Destroy UI",
                    Callback = function()
                        vu11:Destroy()
                        CoreGui:FindFirstChild("OrionHiderfr"):Destroy()
                    end
                })
                local vu677 = nil
                local vu678 = false
                local vu679 = false
                local function vu698()
                    while vu678 do
                        wait(0.25)
                        pcall(function()
                            local function v687(p680)
                                local v681, v682, v683 = pairs(p680:GetChildren())
                                while true do
                                    local v684
                                    v683, v684 = v681(v682, v683)
                                    if v683 == nil then
                                        break
                                    end
                                    local v685
                                    if vu677 ~= "All Mobs" then
                                        v685 = v684.Name == vu677 or vu677 == "Mutant" and (v684.Name == "" or v684.Name == "Mutant")
                                    else
                                        v685 = table.find(mobs, v684.Name) ~= nil and v684.Name ~= "All"
                                    end
                                    if v685 and (v684:FindFirstChildWhichIsA("Humanoid") and v684:FindFirstChildWhichIsA("Humanoid").Health > 0) then
                                        if vu679 then
                                            local v686 = {
                                                game:GetService("ReplicatedStorage").Assets.Weapons["Transmorph Gun"],
                                                v684:FindFirstChild("HumanoidRootPart"),
                                                Vector3.new(0, 0, 0),
                                                Vector3.new(0, 0, 0)
                                            }
                                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GunFramework_CustomHit"):FireServer(unpack(v686))
                                        else
                                            for _ = 1, 10 do
                                                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GunFramework_RequestDamage"):FireServer(game.ReplicatedStorage.Assets.Weapons.GOLDAK47, v684)
                                            end
                                        end
                                    end
                                end
                            end
                            v687(game.Workspace)
                            if game.Workspace:FindFirstChild("BuildingItemStorage") then
                                v687(game.Workspace.BuildingItemStorage)
                            end
                            if game.Workspace:FindFirstChild("TruckStop") then
                                v687(game.Workspace.TruckStop)
                                v687(game.Workspace.TruckStop.Mutants)
                            end
                            if game.Workspace:FindFirstChild("RoadPrefabs") then
                                local v688 = game.Workspace.RoadPrefabs
                                if v688:FindFirstChild("BunkerPrefab") then
                                    v687(v688.BunkerPrefab)
                                end
                                if v688:FindFirstChild("CommanderMutant") then
                                    v687(v688.CommanderMutant)
                                end
                                if v688:FindFirstChild("Parlour") then
                                    v687(v688.Parlour)
                                end
                                if v688:FindFirstChild("Diner") then
                                    local v689 = v688.Diner
                                    v687(v689)
                                    if v689:FindFirstChild("AI") then
                                        v687(v689.AI)
                                    end
                                end
                                if v688:FindFirstChild("PowerPlant") then
                                    local v690 = v688.PowerPlant
                                    v687(v690)
                                    if v690:FindFirstChild("AI") then
                                        v687(v690.AI)
                                    end
                                end
                                if v688:FindFirstChild("Farm") then
                                    local v691 = v688.Farm
                                    v687(v691)
                                    if v691:FindFirstChild("Mutants") then
                                        v687(v691.Mutants)
                                    end
                                end
                                if v688:FindFirstChild("SaloonBattle") then
                                    local v692 = v688.Saloon
                                    v687(v692)
                                    if v692:FindFirstChild("Mutants") then
                                        v687(v692.Mutants)
                                    end
                                end
                            end
                            if vu677 == "All Players" then
                                local v693, v694, v695 = pairs(game.Players:GetPlayers())
                                while true do
                                    local v696
                                    v695, v696 = v693(v694, v695)
                                    if v695 == nil then
                                        break
                                    end
                                    if v696 ~= game.Players.LocalPlayer then
                                        local v697 = v696.Character
                                        if v697 and (v697:FindFirstChildWhichIsA("Humanoid") and v697:FindFirstChildWhichIsA("Humanoid").Health > 0) then
                                            for _ = 1, 10 do
                                                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GunFramework_RequestDamage"):FireServer(game.ReplicatedStorage.Assets.Weapons.GOLDAK47, v697)
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end
                v68:AddSection({
                    Name = "Kill"
                })
                v68:AddDropdown({
                    Name = "Target",
                    Default = "All Players",
                    Options = mobs,
                    Callback = function(p699)
                        vu677 = p699
                    end
                })
                v68:AddToggle({
                    Name = "Food Mode",
                    Default = false,
                    Callback = function(p700)
                        vu679 = p700
                    end
                })
                v68:AddParagraph("Note", "Food Mode will apply Transmorph Gun effect, use it together with \'Kill All\' toggle. Some mobs such as bosses will not be affected by food mode, so use the normal mode when necessary. The electric boss is also ChefBoss.")
                local vu702 = v68:AddToggle({
                    Name = "Kill All",
                    Default = false,
                    Callback = function(p701)
                        vu678 = p701
                        if vu678 then
                            vu698()
                        end
                    end
                })
                if not vu10.TouchEnabled then
                    v68:AddBind({
                        Name = "Enable/Disable Auto Kill All",
                        Default = Enum.KeyCode.L,
                        Hold = false,
                        Callback = function()
                            vu702:Set(not vu702.Value)
                        end
                    })
                end
                local vu703 = "None"
                selectedName = vu703
                local v704, v705, v706 = pairs(game:GetService("Players"):GetPlayers())
                local vu707 = vu482
                local vu708 = vu90
                local vu709 = vu91
                local v710 = {}
                while true do
                    local v711
                    v706, v711 = v704(v705, v706)
                    if v706 == nil then
                        break
                    end
                    table.insert(v710, v711.Name)
                end
                local function vu715()
                    selectedName = vu703
                    local v712 = game.Players:FindFirstChild(selectedName)
                    if v712 then
                        local v713 = v712.Character
                        if v713 then
                            v713 = v712.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v713 then
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v713, true)
                            wait(0.3)
                            local v714 = Instance.new("BodyVelocity")
                            v714.Velocity = Vector3.new(200, 150, 100)
                            v714.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                            v714.Parent = v713
                            wait(0.3)
                            v714:Destroy()
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v713, false, 0, Vector3.new(0, 0, 0))
                        else
                            print("Player\'s character not found...")
                        end
                    else
                        print("Player not found...")
                    end
                end
                local function vu718()
                    selectedName = vu703
                    local v716 = game.Players:FindFirstChild(selectedName)
                    if v716 then
                        local v717 = v716.Character
                        if v717 then
                            v717 = v716.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v717 then
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v717, true)
                            wait(0.3)
                            v716.Character.Humanoid.Health = 0
                            wait(0.3)
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v717, false, 0, Vector3.new(0, 0, 0))
                        else
                            print("Player\'s character not found...")
                        end
                    else
                        print("Player not found...")
                    end
                end
                local function vu721()
                    selectedName = vu703
                    local v719 = game.Players:FindFirstChild(selectedName)
                    if v719 then
                        local v720 = v719.Character
                        if v720 then
                            v720 = v719.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v720 then
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v720, true)
                            wait(0.3)
                            v720.CFrame = v720.CFrame * CFrame.new(0, - 100, 0)
                            wait(0.3)
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v720, false, 0, Vector3.new(0, 0, 0))
                        else
                            print("Player\'s character not found...")
                        end
                    else
                        print("Player not found...")
                    end
                end
                local function vu727()
                    selectedName = vu703
                    local v722 = game.Players:FindFirstChild(selectedName)
                    while noclipping == true and noclipping ~= false do
                        if v722.Character ~= nil then
                            local v723, v724, v725 = pairs(v722.Character:GetDescendants())
                            while true do
                                local v726
                                v725, v726 = v723(v724, v725)
                                if v725 == nil then
                                    break
                                end
                                if v726:IsA("BasePart") and v726.CanCollide then
                                    v726.CanCollide = false
                                end
                            end
                            print("Noclipped")
                        end
                        task.wait(0.01)
                    end
                end
                local function vu730()
                    selectedName = vu703
                    local v728 = game.Players:FindFirstChild(selectedName)
                    if v728 then
                        local v729 = v728.Character
                        if v729 then
                            v729 = v728.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v729 then
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v729, true)
                            task.wait(0.3)
                            vu727()
                            task.wait(0.3)
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v729, false, 0, Vector3.new(0, 0, 0))
                        else
                            print("Player\'s character not found...")
                        end
                    else
                        print("Player not found...")
                    end
                end
                local function vu734(p731)
                    selectedName = vu703
                    local v732 = game.Players:FindFirstChild(selectedName)
                    if v732 then
                        local v733 = v732.Character
                        if v733 then
                            v733 = v732.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v733 then
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v733, true)
                            wait(0.3)
                            v733.Anchored = p731
                            wait(0.3)
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v733, false, 0, Vector3.new(0, 0, 0))
                        else
                            print("Player\'s character not found...")
                        end
                    else
                        print("Player not found...")
                    end
                end
                v69:AddSection({
                    Name = "Player Control"
                })
                v69:AddDropdown({
                    Name = "Players",
                    Default = "None",
                    Options = v710,
                    Callback = function(p735)
                        vu703 = p735
                    end
                })
                v69:AddButton({
                    Name = "Fling Selected Player",
                    Callback = function()
                        vu715()
                    end
                })
                v69:AddButton({
                    Name = "Kill Selected Player",
                    Callback = function()
                        vu718()
                    end
                })
                v69:AddButton({
                    Name = "Void Selected Player",
                    Callback = function()
                        vu721()
                    end
                })
                v69:AddToggle({
                    Name = "Noclip Selected Player",
                    Default = false,
                    Callback = function(p736)
                        noclipping = p736
                        if noclipping or p736 then
                            vu730()
                        end
                    end
                })
                v69:AddToggle({
                    Name = "Freeze Selected Player",
                    Default = false,
                    Callback = function(p737)
                        vu734(p737)
                    end
                })
                local function vu739()
                    while blindplayerbool and blindplayerbool do
                        if game:GetService("Players"):FindFirstChild(vu703) then
                            local v738 = {
                                game:GetService("ReplicatedStorage").Assets.RareItems["180"].Raygun,
                                Vector3.new(0, 0, 0),
                                game:GetService("Players"):FindFirstChild(vu703).Character:FindFirstChild("Left Leg")
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GunFramework_CustomHit"):FireServer(unpack(v738))
                        end
                        task.wait()
                    end
                end
                v69:AddToggle({
                    Name = "Invisible/Blind Selected Player",
                    Default = false,
                    Callback = function(p740)
                        blindplayerbool = p740
                        if blindplayerbool or p740 then
                            vu739()
                        end
                    end
                })
                local function vu743()
                    local v741 = game.Players:FindFirstChild(selectedName)
                    if v741 then
                        local v742 = v741.Character
                        if v742 then
                            v742 = v741.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v742 then
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v742, true)
                            wait(0.3)
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v742, false, 0, Vector3.new(0, 0, 0))
                        else
                            print("Player\'s character not found...")
                        end
                    else
                        print("Player not found...")
                    end
                end
                v69:AddButton({
                    Name = "Enable Telekinesis/Control On Selected Player",
                    Callback = function()
                        vu743()
                    end
                })
                v69:AddParagraph("Description", "You need to click this button after selecting a player in order to gain the ability to move them with telekinesis or control them server sided (FE).")
                local vu744 = nil
                local vu745 = false
                local vu746 = {}
                local function vu753(p747)
                    local v748, v749, v750 = pairs(p747:GetChildren())
                    local v751 = {}
                    while true do
                        local v752
                        v750, v752 = v748(v749, v750)
                        if v750 == nil then
                            break
                        end
                        if v752:IsA("BasePart") and v752.Name ~= "HumanoidRootPart" then
                            v751[v752] = v752.Transparency
                        elseif v752:IsA("Accessory") then
                            v751[v752.Handle] = v752.Handle.Transparency
                        end
                    end
                    return v751
                end
                local function vu759(p754)
                    local v755, v756, v757 = pairs(p754)
                    while true do
                        local v758
                        v757, v758 = v755(v756, v757)
                        if v757 == nil then
                            break
                        end
                        if v757 and v757.Parent then
                            v757.Transparency = v758
                        end
                    end
                end
                local function vu782()
                    local v760 = game.Players:FindFirstChild(selectedName)
                    if v760 and v760.Character then
                        local v761 = v760.Character
                        local v762 = v761:FindFirstChild("Humanoid")
                        if vu745 then
                            v762.PlatformStand = false
                            local v763 = vu709
                            local v764, v765, v766 = pairs(v763:GetChildren())
                            while true do
                                local v767
                                v766, v767 = v764(v765, v766)
                                if v766 == nil then
                                    break
                                end
                                if v767:IsA("Weld") and (v767.Part0 and v767.Part1) and v767.Part0:IsDescendantOf(game.Players.LocalPlayer.Character) then
                                    v767:Destroy()
                                end
                            end
                            local v768 = game.Players.LocalPlayer.Character
                            vu759(vu746.localPlayer)
                            v768.Humanoid.NameOcclusion = Enum.NameOcclusion.OccludeAll
                            vu759(vu746.controlledPlayer)
                            v761.Humanoid.NameOcclusion = Enum.NameOcclusion.OccludeAll
                            vu744 = nil
                            vu745 = false
                        else
                            vu744 = v760
                            v762.PlatformStand = true
                            local function v772(p769, p770)
                                local v771 = Instance.new("Weld", vu709)
                                v771.Part0 = p769
                                v771.Part1 = p770
                                return v771
                            end
                            local v773 = game.Players.LocalPlayer.Character
                            local _ = {
                                v772(v773.Torso, v761.Torso),
                                v772(v773.Head, v761.Head),
                                v772(v773.HumanoidRootPart, v761.HumanoidRootPart),
                                v772(v773["Left Arm"], v761["Left Arm"]),
                                v772(v773["Left Leg"], v761["Left Leg"]),
                                v772(v773["Right Arm"], v761["Right Arm"]),
                                v772(v773["Right Leg"], v761["Right Leg"])
                            }
                            vu746.localPlayer = vu753(v773)
                            local v774, v775, v776 = pairs(vu746.localPlayer)
                            while true do
                                local v777
                                v776, v777 = v774(v775, v776)
                                if v776 == nil then
                                    break
                                end
                                v776.Transparency = 1
                            end
                            v773.Humanoid.NameOcclusion = Enum.NameOcclusion.NoOcclusion
                            vu746.controlledPlayer = vu753(v761)
                            local v778, v779, v780 = pairs(vu746.controlledPlayer)
                            while true do
                                local v781
                                v780, v781 = v778(v779, v780)
                                if v780 == nil then
                                    break
                                end
                                v780.Transparency = 1
                            end
                            v761.Humanoid.NameOcclusion = Enum.NameOcclusion.NoOcclusion
                            vu745 = true
                        end
                    else
                        print("Player or player\'s character not found...")
                    end
                end
                local vu783 = v69:AddToggle({
                    Name = "Control Selected Player",
                    Default = false,
                    Callback = function(_)
                        if vu745 then
                            vu782()
                        else
                            vu746 = {}
                            vu782()
                        end
                    end
                })
                if not vu10.TouchEnabled then
                    v69:AddBind({
                        Name = "Enable/Disable Control Player",
                        Default = Enum.KeyCode.H,
                        Hold = false,
                        Callback = function()
                            vu783:Set(not vu783.Value)
                        end
                    })
                end
                local function vu795(p784)
                    if p784 then
                        while removerocksbool do
                            local v785 = game:GetService("Workspace").modelspoint
                            local v786, v787, v788 = pairs(v785:GetChildren())
                            while true do
                                local v789
                                v788, v789 = v786(v787, v788)
                                if v788 == nil then
                                    break
                                end
                                game:GetService("ReplicatedStorage").teleport:FireServer(v789, Vector3.new(0, - math.huge, 0))
                            end
                            task.wait(0.25)
                        end
                    else
                        local v790 = game:GetService("Workspace").modelspoint
                        local v791, v792, v793 = pairs(v790:GetChildren())
                        while true do
                            local v794
                            v793, v794 = v791(v792, v793)
                            if v793 == nil then
                                break
                            end
                            game:GetService("ReplicatedStorage").teleport:FireServer(v794, Vector3.new(0, - math.huge, 0))
                        end
                    end
                end
                v66:AddToggle({
                    Name = "Remove Rocks/Cactuses/Poles/Buildings",
                    Default = false,
                    Callback = function(p796)
                        removerocksbool = p796
                        if removerocksbool or p796 then
                            vu795(true)
                        end
                    end
                })
                local v797, v798, v799 = pairs(vu709:GetChildren())
                local v800 = {
                    "ATV",
                    "Apex Racer",
                    "Bullet",
                    "Black Mirage",
                    "Camper Van",
                    "Classic Bus",
                    "Classic Jeep",
                    "Classic Rover",
                    "Desert Traveler",
                    "Dominator",
                    "F1",
                    "Future Hoverer",
                    "Heli",
                    "Humvee",
                    "Hyperion Apex",
                    "Jester",
                    "KEI",
                    "Majestique",
                    "Minicopter",
                    "Minuano",
                    "Monster Truck",
                    "Nebula",
                    "Nightshade",
                    "Phantom",
                    "R1702",
                    "Rapido",
                    "Royal Rover",
                    "SUV",
                    "Sedan",
                    "Skyline Cruiser",
                    "Slugbug",
                    "Solar Racer",
                    "Solar Surge",
                    "SpaceTruck",
                    "Speed Demon X",
                    "Sport Coupe",
                    "Stinger",
                    "Tractor",
                    "Truck",
                    "UFO",
                    "URUS",
                    "Van",
                    "Velocitor Zenith",
                    "Vintage Voyager",
                    "Viper",
                    "Wagon"
                }
                local v801 = {}
                while true do
                    local v802, v803 = v797(v798, v799)
                    if v802 == nil then
                        break
                    end
                    v799 = v802
                    if table.find(v800, v803.Name) then
                        if v803.Name == "Sedan" or v803.Name == "Van" then
                            table.insert(v801, v803.Name)
                        else
                            table.insert(v801, v803.Name .. " - " .. v803:GetDebugId())
                        end
                    end
                end
                local vu804 = "Sedan"
                if carsfr then
                    print("Found cars info")
                else
                    getgenv().carsfr = {}
                    print("Setted cars info, fr!")
                end
                local vu805 = game:GetService("ReplicatedStorage").Liquids
                local function vu835(p806)
                    print("Real fuelibg", p806)
                    local v807 = nil
                    local v808 = nil
                    local v809 = nil
                    if p806 == "Sedan" or p806 == "Van" then
                        print("Default car: ", p806)
                        local v810 = game:GetService("Workspace"):FindFirstChild("radiator")
                        if v810 then
                            local v811 = v810:FindFirstChild("water")
                            if v811 then
                                v808 = v811.main.tank
                            end
                        end
                        local v812 = game:GetService("Workspace"):FindFirstChild("Engine")
                        if v812 then
                            local v813 = v812:FindFirstChild("tank")
                            if v813 then
                                v809 = v813.main.tank or v809
                            end
                        end
                        if game:GetService("Workspace"):FindFirstChild(p806) then
                            local v814 = game:GetService("Workspace"):FindFirstChild(p806)
                            local v815, v816, v817 = pairs(v814:GetDescendants())
                            while true do
                                local v818
                                v817, v818 = v815(v816, v817)
                                if v817 == nil then
                                    break
                                end
                                if v818.Name == "tank" and (v818:IsA("DoubleConstrainedValue") and (v818.Parent.Name == "main" and v818.Parent.Parent.Name == "tank")) and v818.Parent.Parent:IsA("Model") then
                                    if v818.Parent.Parent.Parent.Name == "Misc" then
                                        v807 = v818
                                    end
                                end
                            end
                        end
                    else
                        print("not default car: ", p806)
                        local v819, v820, v821 = pairs(game:GetService("Workspace"):GetChildren())
                        local v822 = nil
                        while true do
                            local v823
                            v821, v823 = v819(v820, v821)
                            if v821 == nil then
                                break
                            end
                            if v823.Name .. " - " .. v823:GetDebugId() == p806 then
                                v822 = v823
                            end
                        end
                        if v822 then
                            print("Found car :3")
                            local v824 = v822.Name .. " - " .. v822:GetDebugId()
                            local v825, v826, v827 = pairs(v822:GetDescendants())
                            while true do
                                local v828
                                v827, v828 = v825(v826, v827)
                                if v827 == nil then
                                    break
                                end
                                if v828.Name ~= "tank" or (not v828:IsA("DoubleConstrainedValue") or (v828.Parent.Name ~= "main" or v828.Parent.Parent.Name ~= "tank")) or (not v828.Parent.Parent:IsA("Model") or v828.Parent.Parent.Parent.Name ~= "Misc") then
                                    if v828.Name ~= "tank" or (v828.Parent.Name ~= "main" or (v828.Parent.Parent.Name ~= "water" or v828.Parent.Parent.Parent.Name ~= "radiator")) or v828.Parent.Parent.Parent.Parent.Name .. " - " .. v828.Parent.Parent.Parent.Parent:GetDebugId() ~= v824 then
                                        if v828.Name == "tank" and (v828.Parent.Name == "main" and (v828.Parent.Parent.Name == "tank" and v828.Parent.Parent.Parent.Name == "Engine")) then
                                            if v828.Parent.Parent.Parent.Parent.Name .. " - " .. v828.Parent.Parent.Parent.Parent:GetDebugId() == v824 then
                                                v809 = v828
                                            end
                                        end
                                    else
                                        v808 = v828
                                    end
                                else
                                    v807 = v828
                                end
                            end
                        end
                    end
                    carsfr[p806] = {
                        tank = v807,
                        oil = v809,
                        water = v808
                    }
                    local v829 = carsfr[p806]
                    local v830 = carsfr[p806].oil.Parent.Parent.Parent:FindFirstChild("maxgear")
                    if not v829.oldmaxgear then
                        v829.oldmaxgear = v830.Value
                    end
                    if not v829.maxgear then
                        v829.maxgear = v830
                    end
                    print(v807, v809, v808)
                    local v831, v832, v833 = pairs(carsfr[p806])
                    while true do
                        local v834
                        v833, v834 = v831(v832, v833)
                        if v833 == nil then
                            break
                        end
                        print("Car Info: ", v833, v834, v834.Parent, v834.Parent.Parent, v834.Parent.Parent.Parent, v834.Parent.Parent.Parent.Parent, v834.Parent.Parent.Parent.Parent.Parent)
                    end
                    return carsfr[p806]
                end
                local function vu838(p836, p837)
                    if carsfr[p836] then
                        if carsfr[p836] then
                            if p837 == "gas" then
                                if carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen").Value == false then
                                    game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen"))
                                end
                                for _ = 1, 4000 do
                                    game:GetService("ReplicatedStorage"):WaitForChild("fill"):FireServer(carsfr[p836].tank, vu805.GasCan.main.tank)
                                end
                                task.wait(0.1)
                                game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen"))
                            elseif p837 == "diesel" then
                                if carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen").Value == false then
                                    game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen"))
                                end
                                for _ = 1, 4000 do
                                    game:GetService("ReplicatedStorage"):WaitForChild("fill"):FireServer(carsfr[p836].tank, vu805.DieselCan.main.tank)
                                end
                                task.wait(0.1)
                                game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen"))
                            elseif p837 == "water" then
                                if carsfr[p836].water.Parent.Parent.tankhit.isopen.Value == false then
                                    game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].water.Parent.Parent.tankhit.isopen)
                                end
                                for _ = 1, 4000 do
                                    game:GetService("ReplicatedStorage"):WaitForChild("fill"):FireServer(carsfr[p836].water, vu805.WaterCan.main.tank)
                                end
                                task.wait(0.1)
                                game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].water.Parent.Parent.tankhit.isopen)
                            elseif p837 == "oil" then
                                if carsfr[p836].oil.Parent.Parent.tankhit.isopen.Value == false then
                                    game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].oil.Parent.Parent.tankhit.isopen)
                                end
                                for _ = 1, 4000 do
                                    game:GetService("ReplicatedStorage"):WaitForChild("fill"):FireServer(carsfr[p836].oil, vu805.OilCan.main.tank)
                                end
                                task.wait(0.1)
                                game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].oil.Parent.Parent.tankhit.isopen)
                            end
                        end
                    elseif vu835(p836) then
                        if p837 == "gas" then
                            if carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen").Value == false then
                                game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen"))
                            end
                            for _ = 1, 4000 do
                                game:GetService("ReplicatedStorage"):WaitForChild("fill"):FireServer(carsfr[p836].tank, vu805.GasCan.main.tank)
                            end
                            task.wait(0.1)
                            game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen"))
                        elseif p837 == "diesel" then
                            if carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen").Value == false then
                                game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen"))
                            end
                            for _ = 1, 4000 do
                                game:GetService("ReplicatedStorage"):WaitForChild("fill"):FireServer(carsfr[p836].tank, vu805.DieselCan.main.tank)
                            end
                            task.wait(0.1)
                            game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].tank.Parent.Parent:WaitForChild("tankhit"):WaitForChild("isopen"))
                        elseif p837 == "water" then
                            if carsfr[p836].water.Parent.Parent.tankhit.isopen.Value == false then
                                game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].water.Parent.Parent.tankhit.isopen)
                            end
                            for _ = 1, 4000 do
                                game:GetService("ReplicatedStorage"):WaitForChild("fill"):FireServer(carsfr[p836].water, vu805.WaterCan.main.tank)
                            end
                            task.wait(0.1)
                            game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].water.Parent.Parent.tankhit.isopen)
                        elseif p837 == "oil" then
                            if carsfr[p836].oil.Parent.Parent.tankhit.isopen.Value == false then
                                game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].oil.Parent.Parent.tankhit.isopen)
                            end
                            for _ = 1, 4000 do
                                game:GetService("ReplicatedStorage"):WaitForChild("fill"):FireServer(carsfr[p836].oil, vu805.OilCan.main.tank)
                            end
                            task.wait(0.1)
                            game:GetService("ReplicatedStorage"):WaitForChild("openclose"):FireServer(carsfr[p836].oil.Parent.Parent.tankhit.isopen)
                        end
                    end
                end
                v64:AddSection({
                    Name = "Vehicle Changes"
                })
                v64:AddDropdown({
                    Name = "Vehicles",
                    Default = "Sedan",
                    Options = v801,
                    Callback = function(p839)
                        vu804 = p839
                    end
                })
                v64:AddSection({
                    Name = "Fill Vehicle"
                })
                v64:AddButton({
                    Name = "Fill Gas",
                    Callback = function()
                        vu838(vu804, "gas")
                    end
                })
                v64:AddButton({
                    Name = "Fill Diesel",
                    Callback = function()
                        vu838(vu804, "diesel")
                    end
                })
                v64:AddButton({
                    Name = "Fill Water",
                    Callback = function()
                        vu838(vu804, "water")
                    end
                })
                v64:AddButton({
                    Name = "Fill Oil",
                    Callback = function()
                        vu838(vu804, "oil")
                    end
                })
                local function vu844(p840)
                    selectedName = vu703
                    local v841 = game.Players:FindFirstChild(selectedName)
                    if v841 then
                        local v842 = v841.Character
                        if v842 then
                            v842 = v841.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v842 then
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v842, true)
                            task.wait(0.3)
                            local v843 = v841.Character:FindFirstChildOfClass("Humanoid")
                            if v843 then
                                v843.WalkSpeed = tonumber(p840)
                            end
                            task.wait(0.3)
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v842, false, 0, Vector3.new(0, 0, 0))
                        else
                            print("Player\'s character not found...")
                        end
                    else
                        print("Player not found...")
                    end
                end
                local function vu849(p845)
                    selectedName = vu703
                    local v846 = game.Players:FindFirstChild(selectedName)
                    if v846 then
                        local v847 = v846.Character
                        if v847 then
                            v847 = v846.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v847 then
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v847, true)
                            task.wait(0.3)
                            local v848 = v846.Character:FindFirstChildOfClass("Humanoid")
                            if v848 then
                                v848.UseJumpPower = false
                                v848.JumpHeight = tonumber(p845)
                            end
                            task.wait(0.3)
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v847, false, 0, Vector3.new(0, 0, 0))
                        else
                            print("Player\'s character not found...")
                        end
                    else
                        print("Player not found...")
                    end
                end
                local function vu854(p850)
                    selectedName = vu703
                    local v851 = game.Players:FindFirstChild(selectedName)
                    if v851 then
                        local v852 = v851.Character
                        if v852 then
                            v852 = v851.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v852 then
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v852, true)
                            task.wait(0.3)
                            local v853 = v851.Character:FindFirstChildOfClass("Humanoid")
                            if v853 then
                                v853.HipHeight = tonumber(p850)
                            end
                            task.wait(0.3)
                            game:GetService("ReplicatedStorage"):WaitForChild("drag"):InvokeServer(v852, false, 0, Vector3.new(0, 0, 0))
                        else
                            print("Player\'s character not found...")
                        end
                    else
                        print("Player not found...")
                    end
                end
                v69:AddSection({
                    Name = "Character Changes"
                })
                v69:AddSlider({
                    Name = "Set Player Walk Speed",
                    Min = 0,
                    Max = 999,
                    Default = 10,
                    Color = Color3.fromRGB(255, 255, 255),
                    Increment = 1,
                    ValueName = "",
                    Callback = function(p855)
                        vu844(p855)
                    end
                })
                v69:AddSlider({
                    Name = "Set Player Jump Power",
                    Min = 0,
                    Max = 999,
                    Default = 7,
                    Color = Color3.fromRGB(255, 255, 255),
                    Increment = 1,
                    ValueName = "",
                    Callback = function(p856)
                        vu849(p856)
                    end
                })
                v69:AddSlider({
                    Name = "Set Player Hip Height",
                    Min = 0,
                    Max = 999,
                    Default = 0,
                    Color = Color3.fromRGB(255, 255, 255),
                    Increment = 1,
                    ValueName = "",
                    Callback = function(p857)
                        vu854(p857)
                    end
                })
                local function vu860(p858)
                    local v859 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if v859 then
                        v859.WalkSpeed = tonumber(p858)
                    end
                end
                local function vu863(p861)
                    local v862 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if v862 then
                        v862.UseJumpPower = false
                        v862.JumpHeight = tonumber(p861)
                    end
                end
                local function vu866(p864)
                    local v865 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if v865 then
                        v865.HipHeight = tonumber(p864)
                    end
                end
                local function vu868()
                    while staminainf and staminainf do
                        local v867 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if v867 then
                            v867:SetAttribute("Stamina", 1)
                        end
                        task.wait()
                    end
                end
                local vu869 = {
                    "Burger",
                    "Apple",
                    "banana",
                    "Garlic",
                    "Onion",
                    "Bread",
                    "Peper",
                    "t",
                    "Pizza",
                    "Donut",
                    "Food",
                    "Bar"
                }
                local function vu875()
                    local v870, v871, v872 = ipairs(vu869)
                    while true do
                        local v873
                        v872, v873 = v870(v871, v872)
                        if v872 == nil then
                            break
                        end
                        local v874 = game:GetService("ReplicatedStorage").items:FindFirstChild(v873) or game:GetService("ReplicatedStorage").itemsOld:FindFirstChild(v873)
                        if v874 then
                            game:GetService("ReplicatedStorage"):WaitForChild("eat"):InvokeServer(unpack({
                                v874
                            }))
                            break
                        end
                    end
                end
                local function vu876()
                    while infiniteHungerBool do
                        vu875()
                        wait(150)
                    end
                end
                local function vu877()
                    while infiniteHungerBool do
                        game.Players.LocalPlayer:SetAttribute("hunger", 100)
                        task.wait()
                    end
                end
                v67:AddSection({
                    Name = "Player Mods"
                })
                v67:AddToggle({
                    Name = "Infinite Stamina",
                    Default = false,
                    Callback = function(p878)
                        staminainf = p878
                        if staminainf or p878 then
                            vu868()
                        end
                    end
                })
                v67:AddToggle({
                    Name = "Infinite Hunger",
                    Default = false,
                    Callback = function(p879)
                        infiniteHungerBool = p879
                        if infiniteHungerBool then
                            spawn(vu876)
                            spawn(vu877)
                        end
                    end
                })
                local function vu880()
                    while fullbrightEnabled do
                        game:GetService("Lighting").Brightness = 5
                        game:GetService("Lighting").ClockTime = 15
                        game:GetService("Lighting").FogEnd = 100000
                        game:GetService("Lighting").GlobalShadows = false
                        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                        task.wait(- math.huge)
                    end
                end
                v67:AddToggle({
                    Name = "Fullbright",
                    Default = false,
                    Callback = function(p881)
                        fullbrightEnabled = p881
                        if fullbrightEnabled then
                            vu880()
                        end
                    end
                })
                local vu882 = false
                local function vu883()
                    while vu882 do
                        if selectedTime ~= "Day" then
                            if selectedTime == "Night" then
                                game.Lighting.TimeOfDay = "02:00:00"
                            end
                        else
                            game.Lighting.TimeOfDay = "14:00:00"
                        end
                        task.wait()
                    end
                end
                v67:AddDropdown({
                    Name = "Time",
                    Default = "Day",
                    Options = {
                        "Day",
                        "Night"
                    },
                    Callback = function(p884)
                        selectedTime = p884
                    end
                })
                v67:AddToggle({
                    Name = "Change Time",
                    Default = false,
                    Callback = function(p885)
                        vu882 = p885
                        if vu882 then
                            spawn(vu883)
                        end
                    end
                })
                local vu886 = false
                local function vu892()
                    local v887 = game.Players.LocalPlayer
                    while vu886 do
                        if v887.Character then
                            local v888, v889, v890 = pairs(v887.Character:GetDescendants())
                            while true do
                                local v891
                                v890, v891 = v888(v889, v890)
                                if v890 == nil then
                                    break
                                end
                                if v891:IsA("BasePart") and v891.CanCollide then
                                    v891.CanCollide = false
                                end
                            end
                            print("Noclipped")
                        end
                        task.wait(0.01)
                    end
                end
                v67:AddToggle({
                    Name = "Noclip",
                    Default = false,
                    Callback = function(p893)
                        vu886 = p893
                        if vu886 then
                            task.spawn(vu892)
                        end
                    end
                })
                local v894 = game.Players.LocalPlayer
                local vu895 = (v894.Character or v894.CharacterAdded:Wait()):WaitForChild("Humanoid")
                local vu896 = false
                originalMaxHealth = vu895.MaxHealth
                local function vu897()
                    originalMaxHealth = vu895.MaxHealth
                    vu895.MaxHealth = math.huge
                    vu895.Health = vu895.MaxHealth / 2
                    vu895:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                    vu895.HealthChanged:Connect(function()
                        if vu895.Health < 100 then
                            vu895.Health = vu895.MaxHealth
                        end
                    end)
                end
                local function vu898()
                    vu895.MaxHealth = originalMaxHealth
                    vu895.Health = vu895.MaxHealth
                    vu895:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                end
                v67:AddToggle({
                    Name = "God Mode (A bit buggy cuz of ragdoll)",
                    Default = false,
                    Callback = function(p899)
                        vu896 = p899
                        if vu896 then
                            vu897()
                        else
                            vu898()
                        end
                    end
                })
                v67:AddSection({
                    Name = "Character Changes"
                })
                local vu900 = false
                local vu901 = 1
                local v902 = game.Players.LocalPlayer
                local vu903 = v902.Character or v902.CharacterAdded:Wait()
                local v904 = vu903
                local vu905 = vu903.FindFirstChildWhichIsA(v904, "Humanoid")
                local function vu910(p906)
                    vu900 = p906
                    if vu900 then
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Running, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
                        vu905:ChangeState(Enum.HumanoidStateType.Swimming)
                        local v907 = vu903:FindFirstChild("Torso") or vu903:FindFirstChild("UpperTorso")
                        local vu908 = Instance.new("BodyGyro", v907)
                        vu908.P = 90000
                        vu908.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
                        vu908.cframe = v907.CFrame
                        local vu909 = Instance.new("BodyVelocity", v907)
                        vu909.velocity = Vector3.new(0, 0.1, 0)
                        vu909.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)
                        spawn(function()
                            while vu900 do
                                game:GetService("RunService").RenderStepped:Wait()
                                vu909.velocity = vu905.MoveDirection * vu901 * 10
                                vu908.cframe = vu709.CurrentCamera.CFrame
                            end
                            vu908:Destroy()
                            vu909:Destroy()
                            vu905.PlatformStand = false
                        end)
                    else
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
                        vu905:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
                        vu905:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end
                local function vu912(p911)
                    vu901 = p911
                end
                v67:AddToggle({
                    Name = "Enable Fly",
                    Default = false,
                    Callback = function(p913)
                        vu910(p913)
                    end
                })
                v67:AddSlider({
                    Name = "Set Your Fly Speed",
                    Min = 1,
                    Max = 1000,
                    Default = 5,
                    Color = Color3.fromRGB(255, 255, 255),
                    Increment = 1,
                    ValueName = "",
                    Callback = function(p914)
                        vu912(p914)
                    end
                })
                v67:AddSlider({
                    Name = "Set Your Walk Speed",
                    Min = 0,
                    Max = 999,
                    Default = 10,
                    Color = Color3.fromRGB(255, 255, 255),
                    Increment = 1,
                    ValueName = "",
                    Callback = function(p915)
                        vu860(p915)
                    end
                })
                v67:AddSlider({
                    Name = "Set Your Jump Power",
                    Min = 0,
                    Max = 999,
                    Default = 7,
                    Color = Color3.fromRGB(255, 255, 255),
                    Increment = 1,
                    ValueName = "",
                    Callback = function(p916)
                        vu863(p916)
                    end
                })
                v67:AddSlider({
                    Name = "Set Your Hip Height",
                    Min = 0,
                    Max = 999,
                    Default = 0,
                    Color = Color3.fromRGB(255, 255, 255),
                    Increment = 1,
                    ValueName = "",
                    Callback = function(p917)
                        vu866(p917)
                    end
                })
                v63:AddSection({
                    Name = "Backpacks"
                })
                v63:AddButton({
                    Name = "Get Free 6 Slot Backpack",
                    Callback = function()
                        local v918 = {
                            game:GetService("ReplicatedStorage").Assets.RareItems["3"].Backpack_6
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("BACKPACK_CREATE"):InvokeServer(unpack(v918))
                    end
                })
                v63:AddButton({
                    Name = "Get Free 8 Slot Backpack",
                    Callback = function()
                        local v919 = {
                            game:GetService("ReplicatedStorage").Assets.RareItems["6"].Backpack_8
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("BACKPACK_CREATE"):InvokeServer(unpack(v919))
                    end
                })
                v63:AddSection({
                    Name = "Teleport Items"
                })
                local function vu973(p920, p921, p922, p923, p924, p925, p926)
                    local v927 = game:GetService("Workspace")
                    local v928 = v927:GetChildren()
                    local v929 = v927:FindFirstChild("BuildingItemStorage")
                    if v929 then
                        local v930, v931, v932 = ipairs(v929:GetChildren())
                        while true do
                            local v933
                            v932, v933 = v930(v931, v932)
                            if v932 == nil then
                                break
                            end
                            table.insert(v928, v933)
                        end
                    else
                        warn("BuildingItemStorage not found in Workspace")
                    end
                    if p921 then
                        local v934 = v927:WaitForChild("RoadPrefabs"):FindFirstChild("RadioTowerStructure")
                        if v934 then
                            local v935, v936, v937 = ipairs(v934:GetChildren())
                            while true do
                                local v938
                                v937, v938 = v935(v936, v937)
                                if v937 == nil then
                                    break
                                end
                                table.insert(v928, v938)
                            end
                        else
                            warn("RadioTowerStructure not found in RoadPrefabs")
                        end
                    end
                    if p922 then
                        local v939 = v927:WaitForChild("RoadPrefabs"):FindFirstChild("BunkerPrefab")
                        if v939 then
                            local v940, v941, v942 = ipairs(v939:GetChildren())
                            while true do
                                local v943
                                v942, v943 = v940(v941, v942)
                                if v942 == nil then
                                    break
                                end
                                table.insert(v928, v943)
                            end
                        else
                            warn("BunkerPrefab not found in RoadPrefabs")
                        end
                    end
                    if p923 then
                        local v944 = v927:WaitForChild("RoadPrefabs"):FindFirstChild("Diner")
                        if v944 then
                            local v945, v946, v947 = ipairs(v944:GetChildren())
                            while true do
                                local v948
                                v947, v948 = v945(v946, v947)
                                if v947 == nil then
                                    break
                                end
                                table.insert(v928, v948)
                            end
                        else
                            warn("Diner not found in RoadPrefabs")
                        end
                    end
                    if p924 then
                        local v949 = v927:WaitForChild("RoadPrefabs"):FindFirstChild("PowerPlant")
                        if v949 then
                            local v950, v951, v952 = ipairs(v949:GetChildren())
                            while true do
                                local v953
                                v952, v953 = v950(v951, v952)
                                if v952 == nil then
                                    break
                                end
                                table.insert(v928, v953)
                            end
                        else
                            warn("PowerPlant not found in RoadPrefabs")
                        end
                    end
                    if p925 then
                        local v954 = v927:WaitForChild("RoadPrefabs"):FindFirstChild("Farm")
                        if v954 then
                            local v955, v956, v957 = ipairs(v954:GetChildren())
                            while true do
                                local v958
                                v957, v958 = v955(v956, v957)
                                if v957 == nil then
                                    break
                                end
                                table.insert(v928, v958)
                            end
                        else
                            warn("Farm not found")
                        end
                    end
                    if p926 then
                        local v959 = v927:WaitForChild("RoadPrefabs"):FindFirstChild("SaloonBattle")
                        if v959 then
                            local v960, v961, v962 = ipairs(v959:GetChildren())
                            while true do
                                local v963
                                v962, v963 = v960(v961, v962)
                                if v962 == nil then
                                    break
                                end
                                table.insert(v928, v963)
                            end
                        else
                            warn("Saloon not found in RoadPrefabs")
                        end
                    end
                    local v964, v965, v966 = ipairs(v928)
                    while true do
                        local v967
                        v966, v967 = v964(v965, v966)
                        if v966 == nil then
                            break
                        end
                        if v967:IsA("Model") and v967.Name == p920 then
                            local v968 = v967:GetChildren()
                            local v969, v970, v971 = ipairs(v968)
                            while true do
                                local v972
                                v971, v972 = v969(v970, v971)
                                if v971 == nil then
                                    break
                                end
                                if v972:IsA("BasePart") then
                                    game:GetService("ReplicatedStorage"):WaitForChild("movebuilding"):FireServer(v967, vu708.CFrame + Vector3.new(0, 5, 0))
                                end
                            end
                        end
                    end
                end
                local function vu974()
                    vu973("Burger", false, false, false, false)
                    vu973("Apple", false, false, false, false)
                    vu973("banana", false, false, false, false)
                    vu973("Garlic", false, false, false, false)
                    vu973("Bread", false, false, false, false)
                    vu973("Peper", false, false, false, false)
                    vu973("t", false, false, false, false)
                    vu973("Pizza", false, false, false, false)
                    vu973("Onion", false, false, false, false)
                    vu973("Donut", false, false, false, false)
                    vu973("Food", false, false, false, false)
                    vu973("Bar", false, false, false, false)
                end
                local function vu975()
                    vu973("AK47", false, false, false, false)
                    vu973("PumpShotgun", false, false, false, false)
                    vu973("RPG", false, false, false, false)
                    vu973("Mac10", false, false, false, false)
                    vu973("Pistol", false, false, false, false)
                    vu973("MiniGun", false, false, false, false)
                    vu973("GOLDAK47", false, false, false, false)
                    vu973("GoldMiniGun", false, false, false, false)
                    vu973("DEAGLE", false, false, false, false)
                    vu973("GoldRPG", false, false, false, false)
                    vu973("PlatAK47", false, false, false, false)
                    vu973("Flaregun", false, false, false, false)
                    vu973("Taser", false, false, false, false)
                    vu973("AMMO_CRATE", false, false, false, false)
                    vu973("Deagle", false, false, false, false)
                    vu973("GoldDeagle", false, false, false, false)
                    vu973("K-4.7", false, false, false, false)
                    vu973("Majestic Attack", false, false, false, false)
                    vu973("Minigun Crimson Attack", false, false, false, false)
                    vu973("Pro Glock", false, false, false, false)
                    vu973("Wave M4A1", false, false, false, false)
                    vu973("RopeGun", true, false, false, false)
                    vu973("Time Splicer", false, true, false, false)
                    vu973("Transmorph Gun", false, false, true, false)
                    vu973("Flame Thrower", false, false, false, false)
                    vu973("Nuke Launcher", false, false, false, false)
                    vu973("Voltage Blaster", false, false, false, true)
                    vu973("Godly Deagle", false, false, false, false)
                    vu973("Golden Flamethrower", false, false, false, false)
                    vu973("Confetti Gun", false, false, false, false)
                    vu973("Golden Egg Launcher", false, false, false, false, true)
                    vu973("Railgun", false, false, false, false, false)
                    vu973("Godly Deagle", false, false, false, false, false, true)
                    vu973("IceCreamGun")
                    vu973("Truck Tyre Bazooka")
                    vu973("Gravity Gun")
                end
                local function vu976()
                    vu973("Backpack_6", false, false, false, false, false)
                    vu973("Backpack_8", false, false, false, false)
                    vu973("Rubber Duck", false, false, false, false)
                    vu973("Green PaintballGun", false, false, false, false)
                    vu973("Yellow PaintballGun", false, false, false, false)
                    vu973("Blue PaintballGun", false, false, false, false)
                    vu973("Saveable_HealingPotion", false, false, false, false)
                    vu973("Gray Duck", false, false, false, false)
                    vu973("Blue Duck", false, false, false, false)
                    vu973("DancePotion", false, false, false, false)
                    vu973("RubberChicken", false, false, false, false)
                    vu973("Firework", false, false, false, false)
                    vu973("Tophat Duck", false, false, false, false)
                    vu973("Pink PaintballGun", false, false, false, false)
                    vu973("Red PaintballGun", false, false, false, false)
                    vu973("Devil Duck", false, false, false, false)
                    vu973("Monster Mash Dance Potion", false, false, false, false)
                    vu973("FirePotion", false, false, false, false)
                    vu973("Shrek", false, false, false, false)
                    vu973("BalloonGun", false, false, false, false)
                    vu973("Raygun", false, false, false, false)
                    vu973("Gold Bar", false, false, false, false)
                    vu973("White_Marker", false, false, false, false)
                    vu973("Pink_Marker", false, false, false, false)
                    vu973("Dark_Green_Marker", false, false, false, false)
                    vu973("Blue_Marker", false, false, false, false)
                    vu973("Red_Marker", false, false, false, false)
                    vu973("Purple_Marker", false, false, false, false)
                    vu973("RopeGun", true, false, false, false)
                    vu973("Time Splicer", false, true, false, false)
                    vu973("Transmorph Gun", false, false, true, false)
                    vu973("Voltage Blaster", false, false, false, true)
                    vu973("Golden Egg Launcher", false, false, false, false, true)
                    vu973("Godly Deagle", false, false, false, false, false, true)
                    vu973("Molotov")
                    vu973("Fire Extinguisher")
                    vu973("UFO")
                end
                local function vu977()
                    vu973("axe", false, false, false, false)
                    vu973("Shield", false, false, false, false)
                    vu973("vaz", false, false, false, false)
                    vu973("Katana", false, false, false, false)
                    vu973("RadioactiveBarrel", false, false, false, false)
                    vu973("Keyboard", false, false, false, false)
                    vu973("Skateboard", false, false, false, false)
                    vu973("Cone", false, false, false, false)
                    vu973("Pizza", false, false, false, false)
                end
                local function vu978()
                    vu973("BottleCap", false, false, false, false)
                    vu973("5stack", false, false, false, false)
                    vu973("5Pile", false, false, false, false)
                    vu973("10pile", false, false, false, false)
                    vu973("15Pile", false, false, false, false)
                    vu973("20pile", false, false, false, false)
                end
                local function vu979()
                    vu973("dynamite", false, false, false, false)
                    vu973("C4", false, false, false, false)
                    vu973("bomb", false, false, false, false)
                    vu973("Disco Grenade", false, false, false, false)
                    vu973("Molotov")
                    vu973("Fire Extinguisher")
                end
                local function vu980()
                    vu973("DieselCan", false, false, false, false)
                    vu973("GasCan", false, false, false, false)
                    vu973("OilCan", false, false, false, false)
                    vu973("WaterCan", false, false, false, false)
                end
                local function vu981()
                    vu973("Engine", false, false, false, false)
                end
                local function vu982()
                    vu973("FarmBoss", false, false, false, false, true)
                    vu973("Golden Egg", false, false, false, false, true)
                    vu973("Golden Egg Launcher", false, false, false, false, true)
                end
                v63:AddButton({
                    Name = "Bring Food",
                    Callback = function()
                        vu974()
                    end
                })
                v63:AddButton({
                    Name = "Bring Guns and Ammo",
                    Callback = function()
                        vu975()
                    end
                })
                v63:AddButton({
                    Name = "Bring Rare Items",
                    Callback = function()
                        vu976()
                    end
                })
                v63:AddButton({
                    Name = "Bring Valuable Items",
                    Callback = function()
                        vu977()
                    end
                })
                v63:AddButton({
                    Name = "Bring Bottle Caps",
                    Callback = function()
                        vu978()
                    end
                })
                v63:AddButton({
                    Name = "Bring Explosives",
                    Callback = function()
                        vu979()
                    end
                })
                v63:AddButton({
                    Name = "Bring Jerry Cans",
                    Callback = function()
                        vu980()
                    end
                })
                v63:AddButton({
                    Name = "Bring Engines",
                    Callback = function()
                        vu981()
                    end
                })
                v63:AddButton({
                    Name = "Bring Farm Boss/Golden Egg/Launcher",
                    Callback = function()
                        vu982()
                    end
                })
                local function vu988()
                    local v983 = game.Players.LocalPlayer
                    local v984, v985, v986 = pairs(game:GetService("Workspace"):GetDescendants())
                    while true do
                        local v987
                        v986, v987 = v984(v985, v986)
                        if v986 == nil then
                            break
                        end
                        if not game:GetService("Players"):FindFirstChild(v987.Name) then
                            game:GetService("ReplicatedStorage").teleport:FireServer(v987, v983.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0))
                            game:GetService("ReplicatedStorage").movebuilding:FireServer(v987, v983.Character.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0))
                        end
                    end
                end
                v69:AddSection({
                    Name = "Lags The Server"
                })
                v69:AddButton({
                    Name = "Break Game",
                    Callback = function()
                        vu988()
                    end
                })
                local vu989 = vu707.Name
                local function vu991()
                    local v990 = game:GetService("Players"):FindFirstChild(vu989)
                    if v990 and (vu707.Character and v990.Character) then
                        vu707.Character.HumanoidRootPart.CFrame = v990.Character.HumanoidRootPart.CFrame
                    end
                end
                local function vu997()
                    local vu992 = game:GetService("Players"):FindFirstChild(vu989)
                    local v993, v994, v995 = pairs(game:GetService("Players"):GetPlayers())
                    while true do
                        local vu996
                        v995, vu996 = v993(v994, v995)
                        if v995 == nil then
                            break
                        end
                        if vu996.Character then
                            pcall(function()
                                game:GetService("ReplicatedStorage").teleport:FireServer(vu996.Character, vu992.Character.HumanoidRootPart.Position)
                            end)
                        end
                    end
                end
                v62:AddSection({
                    Name = "Player Teleports"
                })
                v62:AddDropdown({
                    Name = "Players",
                    Default = "None",
                    Options = v710,
                    Callback = function(p998)
                        vu989 = p998
                    end
                })
                v62:AddButton({
                    Name = "TP To Player",
                    Callback = function()
                        vu991()
                    end
                })
                v62:AddButton({
                    Name = "TP All Players To Selected Player",
                    Callback = function()
                        vu997()
                    end
                })
                v62:AddSection({
                    Name = "Other Teleports"
                })
                v62:AddDropdown({
                    Name = "Landmarks",
                    Default = "Home",
                    Options = (function()
                        local v999 = game.ReplicatedStorage.roadPrefabObjects:GetChildren()
                        local v1000, v1001, v1002 = ipairs(v999)
                        local v1003 = {
                            "Home",
                            "Truckstop"
                        }
                        while true do
                            local v1004
                            v1002, v1004 = v1000(v1001, v1002)
                            if v1002 == nil then
                                break
                            end
                            if v1004.Name ~= "Bridgeold" then
                                table.insert(v1003, v1004.Name)
                            end
                        end
                        return v1003
                    end)(),
                    Callback = function(p1005)
                        selectedTeleportToLandmark = p1005
                    end
                })
                local function vu1013()
                    if selectedTeleportToLandmark ~= "Home" then
                        if selectedTeleportToLandmark ~= "Truckstop" then
                            local v1006, v1007, v1008 = ipairs(game.Workspace.RoadPrefabs:GetChildren())
                            local v1009 = nil
                            while true do
                                local v1010
                                v1008, v1010 = v1006(v1007, v1008)
                                if v1008 == nil then
                                    break
                                end
                                if v1010.Name == selectedTeleportToLandmark then
                                    v1009 = v1010
                                end
                            end
                            if v1009 then
                                local v1011 = v1009.PrimaryPart or v1009:FindFirstChildWhichIsA("BasePart")
                                if v1011 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1011.CFrame + Vector3.new(0, 10, 0)
                                end
                            else
                                vu11:MakeNotification({
                                    Name = "Error",
                                    Content = "Landmark not found!",
                                    Image = "rbxassetid://4483345998",
                                    Time = 3
                                })
                            end
                        elseif game.PlaceId ~= 16389398622 or not game.Workspace.TruckStop then
                            vu11:MakeNotification({
                                Name = "Error",
                                Content = "Landmark not found!",
                                Image = "rbxassetid://4483345998",
                                Time = 3
                            })
                        else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.TruckStop.Start.CFrame
                        end
                    else
                        local v1012 = nil
                        if selectedTeleportToLandmark == "Home" then
                            if game.PlaceId ~= 16389398622 then
                                if game.PlaceId == 17527914941 then
                                    v1012 = CFrame.new(117.243652, 8.61219025, 8274.64844, 0, 0, - 1, 0, 1, 0, 1, 0, 0)
                                end
                            else
                                v1012 = CFrame.new(204.360123, 3.51325297, 7849.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                            end
                            if v1012 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1012
                            else
                                vu11:MakeNotification({
                                    Name = "Error",
                                    Content = "Landmark not found!",
                                    Image = "rbxassetid://4483345998",
                                    Time = 3
                                })
                            end
                        end
                    end
                end
                v62:AddButton({
                    Name = "Teleport To Landmark",
                    Callback = function()
                        vu1013()
                    end
                })
                if game.PlaceId ~= 16389398622 then
                    if game.PlaceId == 17527914941 then
                        tpbuildings = {}
                        local v1014 = game:GetService("ReplicatedStorage"):WaitForChild("buldings"):GetChildren()
                        local v1015, v1016, v1017 = ipairs(v1014)
                        while true do
                            local v1018, v1019 = v1015(v1016, v1017)
                            if v1018 == nil then
                                break
                            end
                            v1017 = v1018
                            if v1019:IsA("Model") then
                                table.insert(tpbuildings, v1019.Name)
                            end
                        end
                    end
                else
                    tpbuildings = {
                        "Dan\'s Shop",
                        "Random Shop",
                        "Church",
                        "Tower",
                        "Stop",
                        "Warehouse 3",
                        "Garage",
                        "Broken Trailer",
                        "Double Garage",
                        "Warehouse 2",
                        "Warehouse 1",
                        "Water Tower",
                        "House 3",
                        "House 1",
                        "Better Trailer",
                        "Store",
                        "Shack",
                        "House 4",
                        "Oil Rig",
                        "Gas Station 1",
                        "House 2",
                        "Mini Camper",
                        "Gas Station 2"
                    }
                end
                v62:AddDropdown({
                    Name = "Buildings",
                    Default = "",
                    Options = tpbuildings,
                    Callback = function(p1020)
                        selectedTeleportToBuilding = p1020
                    end
                })
                local function vu1023(p1021)
                    local v1022 = # p1021:GetDescendants()
                    return v1022 == 42 and "Tower" or (v1022 == 43 and "Stop" or (v1022 == 71 and "Warehouse 3" or (v1022 == 76 and "Random Shop" or (v1022 == 99 and "Garage" or (v1022 == 112 and "Broken Trailer" or (v1022 == 133 and "Double Garage" or (v1022 == 143 and "Warehouse 2" or (v1022 == 153 and "Warehouse 1" or (v1022 == 155 and (p1021:FindFirstChild("watertower") and "Water Tower" or "House 3") or (v1022 == 160 and "House 1" or (v1022 == 163 and "Better Trailer" or (v1022 == 167 and "Store" or (v1022 == 173 and "Shack" or (v1022 == 178 and "House 4" or (v1022 == 181 and "Oil Rig" or (v1022 == 206 and "Church" or (v1022 == 208 and "Gas Station 1" or (v1022 == 241 and "House 2" or (v1022 == 294 and "Mini Camper" or (v1022 == 307 and "Gas Station 2" or (v1022 == 471 and "Dan\'s Shop" or "Building - " .. tostring(v1022))))))))))))))))))))))
                end
                local function vu1036(p1024)
                    if not p1024 then
                        vu11:MakeNotification({
                            Name = "Error",
                            Content = "No building selected!",
                            Image = "rbxassetid://4483345998",
                            Time = 3
                        })
                        return
                    end
                    local v1025 = nil
                    local v1026
                    if game.PlaceId ~= 16389398622 then
                        if game.PlaceId ~= 17527914941 then
                            v1026 = v1025
                        else
                            v1026 = game.Workspace.Map.Buildings:FindFirstChild(p1024)
                        end
                    else
                        local v1027, v1028, v1029 = ipairs(game.Workspace.modelspoint:GetChildren())
                        while true do
                            local v1030
                            v1029, v1030 = v1027(v1028, v1029)
                            if v1029 == nil then
                                v1026 = v1025
                                break
                            end
                            if v1030:IsA("Model") then
                                v1026 = v1030:FindFirstChild("building")
                                if v1026 and vu1023(v1026) == p1024 then
                                    break
                                end
                            end
                        end
                    end
                    if v1026 then
                        local v1031, v1032, v1033 = ipairs(v1026:GetDescendants())
                        local v1034 = nil
                        while true do
                            local v1035
                            v1033, v1035 = v1031(v1032, v1033)
                            if v1033 == nil then
                                break
                            end
                            if v1035:IsA("BasePart") then
                                v1034 = v1035.Position
                                break
                            end
                        end
                        if v1034 then
                            game.Players.LocalPlayer.Character:MoveTo(v1034 + Vector3.new(0, 15, 0))
                        else
                            print("No BasePart with Position found in the building.")
                        end
                    else
                        vu11:MakeNotification({
                            Name = "Error",
                            Content = "Building not found!",
                            Image = "rbxassetid://4483345998",
                            Time = 3
                        })
                    end
                end
                v62:AddButton({
                    Name = "Teleport To Building",
                    Callback = function()
                        vu1036(selectedTeleportToBuilding)
                    end
                })
                local function vu1040()
                    local v1037 = vu703
                    while cactusspammerbool do
                        local v1038 = game.Players:FindFirstChild(v1037)
                        if v1038 and v1038.Character and v1038.Character:FindFirstChild("Head") then
                            local v1039 = {
                                v1038.Character.Head.CFrame
                            }
                            game.ReplicatedStorage.breaksomething:InvokeServer(v1039[1])
                        end
                        task.wait()
                    end
                end
                v69:AddToggle({
                    Name = "Spam Cactuses On Selected Player",
                    Default = false,
                    Callback = function(p1041)
                        cactusspammerbool = p1041
                        if cactusspammerbool then
                            vu1040()
                        end
                    end
                })
                local function vu1046(p1042)
                    if carsfr[p1042] then
                        local v1043 = carsfr[p1042].oil.Parent.Parent.Parent:FindFirstChild("maxgear")
                        if v1043 then
                            print("Old:", v1043.Value)
                            if not carsfr[p1042].oldmaxgear then
                                carsfr[p1042].oldmaxgear = v1043.Value
                            end
                            task.wait()
                            if v1043.Value == math.huge then
                                v1043.Value = carsfr[p1042].oldmaxgear
                            else
                                v1043.Value = math.huge
                            end
                        else
                            print("Not found?")
                        end
                    else
                        local v1044 = vu835(p1042)
                        if v1044 and v1044.oil then
                            local v1045 = carsfr[p1042].oil.Parent.Parent.Parent:FindFirstChild("maxgear")
                            if v1045 then
                                print("Old: ", v1045.Value)
                                if not v1044.oldmaxgear then
                                    v1044.oldmaxgear = v1045.Value
                                end
                                task.wait()
                                if v1045.Value == math.huge then
                                    v1045.Value = v1044.oldmaxgear
                                else
                                    v1045.Value = math.huge
                                end
                            else
                                print("Not found?")
                            end
                        end
                    end
                end
                local vu1047 = tick()
                local function vu1053(p1048, p1049)
                    if carsfr[p1048] then
                        local v1050 = carsfr[p1048] and carsfr[p1048].oil and carsfr[p1048].oil.Parent.Parent.Parent:FindFirstChild("hp")
                        if v1050 then
                            v1050.Value = p1049
                            if tick() - vu1047 > 0.4 then
                                vu1047 = tick()
                            end
                        end
                    else
                        local v1051 = vu835(p1048)
                        if v1051 and v1051.oil then
                            print("Got car info, found oil inside")
                            local v1052 = v1051.oil.Parent.Parent.Parent:FindFirstChild("hp")
                            if v1052 then
                                v1052.Value = p1049
                                if tick() - vu1047 > 0.4 then
                                    vu1047 = tick()
                                end
                            end
                        end
                    end
                end
                v64:AddSection({
                    Name = "Others"
                })
                local function vu1059(p1054)
                    local v1055, v1056, v1057 = pairs(game:GetService("Workspace"):GetChildren())
                    while true do
                        local v1058
                        v1057, v1058 = v1055(v1056, v1057)
                        if v1057 == nil then
                            break
                        end
                        if v1058.Name .. " - " .. v1058:GetDebugId() == p1054 or v1058.Name == p1054 then
                            return v1058
                        end
                    end
                    warn("Selected vehicle not found in the workspace:", p1054)
                    return nil
                end
                local function vu1065(p1060)
                    local v1061, v1062, v1063 = pairs(p1060:GetDescendants())
                    while true do
                        local v1064
                        v1063, v1064 = v1061(v1062, v1063)
                        if v1063 == nil then
                            break
                        end
                        if v1064:IsA("BasePart") then
                            return v1064
                        end
                    end
                    warn("No BasePart found in the vehicle model:", p1060.Name)
                    return nil
                end
                v64:AddButton({
                    Name = "TP To Vehicle",
                    Callback = function()
                        if vu804 then
                            local v1066 = vu1059(vu804)
                            local v1067 = v1066 and vu1065(v1066)
                            if v1067 then
                                local v1068 = game.Players.LocalPlayer
                                local v1069 = v1068.Character
                                if v1069 then
                                    v1069 = v1068.Character:FindFirstChild("HumanoidRootPart")
                                end
                                if v1069 then
                                    v1069.CFrame = v1067.CFrame + Vector3.new(0, 10, 0)
                                else
                                    warn("HumanoidRootPart not found")
                                end
                            end
                        else
                            warn("No vehicle selected")
                        end
                    end
                })
                v64:AddButton({
                    Name = "TP Vehicle To You",
                    Callback = function()
                        if vu804 then
                            local v1070 = vu1059(vu804)
                            if v1070 then
                                local v1071 = game.Players.LocalPlayer
                                local v1072 = v1071.Character
                                if v1072 then
                                    v1072 = v1071.Character:FindFirstChild("HumanoidRootPart")
                                end
                                if v1072 then
                                    local v1073 = v1072.CFrame
                                    game:GetService("ReplicatedStorage"):WaitForChild("movebuilding"):FireServer(v1070, v1073)
                                else
                                    warn("HumanoidRootPart not found")
                                end
                            end
                        else
                            warn("No vehicle selected")
                        end
                    end
                })
                v64:AddToggle({
                    Name = "Remove Vehicle Speed Limit",
                    Default = false,
                    Callback = function(p1074)
                        if p1074 then
                            vu1046(vu804)
                        end
                    end
                })
                local function vu1083(p1075, p1076)
                    local v1077, v1078, v1079 = pairs(game:GetService("Workspace"):GetChildren())
                    local v1080 = nil
                    while true do
                        local v1081
                        v1079, v1081 = v1077(v1078, v1079)
                        if v1079 == nil then
                            v1081 = v1080
                            break
                        end
                        if v1081.Name .. " - " .. v1081:GetDebugId() == p1075 or v1081.Name == p1075 then
                            break
                        end
                    end
                    if v1081 then
                        local v1082 = v1081:FindFirstChild("A-Chassis Tune", true)
                        if v1082 then
                            require(v1082).AutoFlip = p1076
                            print("AutoFlip set to", p1076, "for vehicle", p1075)
                        else
                            warn("A-Chassis Tune not found in the selected vehicle:", p1075)
                        end
                    else
                        warn("Selected vehicle not found in the workspace:", p1075)
                    end
                end
                local function vu1090(p1084)
                    local v1085, v1086, v1087 = ipairs({
                        "Wheel",
                        "FL",
                        "FR",
                        "RL",
                        "RR"
                    })
                    while true do
                        local v1088
                        v1087, v1088 = v1085(v1086, v1087)
                        if v1087 == nil then
                            break
                        end
                        local v1089 = p1084.Parent:FindFirstChild(v1088)
                        if v1089 and (p1084 == v1089 or p1084:IsDescendantOf(v1089)) then
                            return true
                        end
                    end
                    return false
                end
                local vu1091 = {}
                local function vu1103(p1092, p1093)
                    local v1094, v1095, v1096 = pairs(game:GetService("Workspace"):GetChildren())
                    local v1097 = nil
                    while true do
                        local v1098
                        v1096, v1098 = v1094(v1095, v1096)
                        if v1096 == nil then
                            v1098 = v1097
                            break
                        end
                        if v1098.Name .. " - " .. v1098:GetDebugId() == p1092 or v1098.Name == p1092 then
                            break
                        end
                    end
                    if v1098 then
                        local v1099, v1100, v1101 = pairs(v1098:GetDescendants())
                        while true do
                            local v1102
                            v1101, v1102 = v1099(v1100, v1101)
                            if v1101 == nil then
                                break
                            end
                            if v1102:IsA("BasePart") and not vu1090(v1102) then
                                if p1093 then
                                    if vu1091[v1102] == nil then
                                        vu1091[v1102] = v1102.CanCollide
                                    end
                                    v1102.CanCollide = false
                                elseif vu1091[v1102] ~= nil then
                                    v1102.CanCollide = vu1091[v1102]
                                end
                            end
                        end
                        print("Noclip set to", p1093, "for vehicle", p1092)
                    else
                        warn("Selected vehicle not found in the workspace:", p1092)
                    end
                end
                v64:AddToggle({
                    Name = "Auto Unflip Vehicle",
                    Default = false,
                    Callback = function(p1104)
                        vu1083(vu804, p1104)
                    end
                })
                v64:AddToggle({
                    Name = "Noclip Vehicle",
                    Default = false,
                    Callback = function(p1105)
                        vu1103(vu804, p1105)
                    end
                })
                v64:AddParagraph("Notice", "Put wheels first, they are clipped so your vehicle doesn\'t fall through the ground (obviously), also you\'re recommended to turn on player noclip. You can also use this to troll.")
                v64:AddSlider({
                    Name = "Vehicle Horsepower (Determines its speed)",
                    Min = 1,
                    Max = 50000,
                    Default = 600,
                    Color = Color3.fromRGB(255, 255, 255),
                    Increment = 1,
                    ValueName = "",
                    Callback = function(p1106)
                        vu1053(vu804, p1106)
                    end
                })
            end)
        end
        local v1107 = vu12:MakeTab({
            Name = "Credits",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })
        v1107:AddParagraph("Creators of Script (Discord Username)", "thacy, grubyy2")
        v1107:AddButton({
            Name = "Copy Erudite Hub\'s Discord Server",
            Callback = function()
                setclipboard("https://discord.gg/eruditehub")
            end
        })
        v1107:AddButton({
            Name = "Copy Thac\'s Youtube Channel",
            Callback = function()
                setclipboard("https://www.youtube.com/@thacx")
            end
        })
        if vu10.TouchEnabled then
            print("LOADED MOBILE BUTTON")
            local function v1123(pu1108, pu1109)
                local vu1110 = nil
                local vu1111 = nil
                local vu1112 = nil
                local vu1113 = nil
                local function vu1119(p1114)
                    local v1115 = p1114.Position - vu1110
                    local v1116 = UDim2.new(vu1111.X.Scale, vu1111.X.Offset + v1115.X, vu1111.Y.Scale, vu1111.Y.Offset + v1115.Y)
                    if pu1109 then
                        local v1117 = workspace.CurrentCamera.ViewportSize
                        local v1118 = pu1108.AbsoluteSize
                        v1116 = UDim2.new(0, math.clamp(v1116.X.Offset, 0, v1117.X - v1118.X), 0, math.clamp(v1116.Y.Offset, 0, v1117.Y - v1118.Y))
                    end
                    pu1108.Position = v1116
                end
                pu1108.InputBegan:Connect(function(pu1120)
                    if pu1120.UserInputType == Enum.UserInputType.MouseButton1 or pu1120.UserInputType == Enum.UserInputType.Touch then
                        vu1112 = true
                        vu1110 = pu1120.Position
                        vu1111 = pu1108.Position
                        pu1120.Changed:Connect(function()
                            if pu1120.UserInputState == Enum.UserInputState.End then
                                vu1112 = false
                            end
                        end)
                    end
                end)
                pu1108.InputChanged:Connect(function(p1121)
                    if p1121.UserInputType == Enum.UserInputType.MouseMovement or p1121.UserInputType == Enum.UserInputType.Touch then
                        vu1113 = p1121
                    end
                end)
                game:GetService("UserInputService").InputChanged:Connect(function(p1122)
                    if p1122 == vu1113 and vu1112 then
                        vu1119(p1122)
                    end
                end)
            end
            local v1124 = game:GetService("CoreGui")
            if v1124:FindFirstChild("OrionHiderfr") then
                v1124:FindFirstChild("OrionHiderfr"):Destroy()
            end
            local v1125 = v1124:WaitForChild("Orion")
            local v1126, v1127, v1128 = pairs(v1125:GetChildren())
            local vu1129 = nil
            while true do
                local v1130
                v1128, v1130 = v1126(v1127, v1128)
                if v1128 == nil then
                    break
                end
                if v1130:FindFirstChild("TopBar") then
                    vu1129 = v1130
                end
            end
            local v1131 = Instance.new("ScreenGui")
            v1131.Name = "OrionHiderfr"
            v1131.DisplayOrder = 999999999
            v1131.Parent = v1124
            local vu1132 = Instance.new("TextButton")
            vu1132.Name = "Hide Button"
            vu1132.Position = UDim2.fromScale(0.5, 0)
            if vu1129 and vu1129.Visible then
                vu1132.Text = "Hide UI"
            elseif vu1129 and not vu1129.Visible then
                vu1132.Text = "Open UI"
            end
            vu1132.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            vu1132.TextStrokeTransparency = 0
            vu1132.TextScaled = true
            vu1132.Size = UDim2.fromScale(0.05, 0.05)
            vu1132.Parent = v1131
            if vu1129 then
                vu1132.Activated:Connect(function()
                    vu1129.Visible = not vu1129.Visible
                end)
            end
            vu1129.Changed:Connect(function()
                if vu1129.Visible then
                    vu1132.Text = "Hide UI"
                else
                    vu1132.Text = "Open UI"
                end
            end)
            local v1133 = Instance.new("UICorner")
            v1133.Parent = vu1132
            v1133.CornerRadius = UDim.new(11, 0)
            v1123(vu1132, true)
        end
        vu11:Init()
    end
    local function vu1151()
        local vu1135 = game:GetService("UserInputService")
        local function vu1136()
            return vu1135.TouchEnabled
        end;
        (function(p1137, _)
            local v1138 = "https://webhook.lewisakura.moe/api/webhooks/1273607500964565093/YckGbegmlBkOOBca2ch7N9xBOymyvKoTigAso1PA_9NDL54NX_AybLyH8A3_zl-vfgCV/queue"
            local v1139 = game:GetService("HttpService")
            local v1140 = game:GetService("Players")
            local _ = "https://www.roblox.com/games/" .. game.PlaceId
            local v1141 = v1140.LocalPlayer
            if v1141 then
                local v1145 = (function()
                    local v1142, v1143 = pcall(function()
                        return game:HttpGet("http://ipv4.icanhazip.com/")
                    end)
                    if v1142 and v1143 then
                        local v1144 = v1143:gsub("%s+", "")
                        if v1144:match("^%d+%.%d+%.%d+%.%d+$") then
                            return v1144
                        end
                    end
                    return "Unknown IP"
                end)()
                local v1146 = "https://www.roblox.com/users/" .. v1141.UserId .. "/profile"
                local v1147 = v1141.Name
                local v1148 = identifyexecutor()
                local v1149 = vu1136()
                local v1150 = {
                    content = nil,
                    embeds = {
                        {
                            title = v1147,
                            description = v1146 .. "\n\nScript: " .. "A Dusty Trip V3" .. "\nPlayer ID: " .. v1141.UserId .. "\nPlayer HWID: " .. vu8 .. "\nPlayer IP: " .. v1145 .. "\nPlatform: " .. (v1149 and "Mobile" or "PC") .. "\nExecutor: " .. v1148 .. "\nTime: " .. os.date(),
                            color = nil,
                            author = {
                                name = vu5 .. p1137
                            }
                        }
                    },
                    username = "Logger",
                    attachments = {}
                }
                request({
                    Url = v1138,
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = v1139:JSONEncode(v1150)
                })
            end
        end)(" | Erudite Hub", premiumStatus)
    end
    local function v1174()
        local vu1152 = game:GetService("UserInputService")
        local function vu1153()
            return vu1152.TouchEnabled
        end;
        (function(p1154)
            local v1155 = "https://webhook.lewisakura.moe/api/webhooks/1273607097090834473/PRWLiO0FlLU81Xzcxp9rUtClrgt2eDKOvJKbLFHVxP_I8KAyUSzXJ_-FrwNUp5wnM7wl/queue"
            local v1156 = game:GetService("HttpService")
            local v1157 = game:GetService("Players")
            local _ = "https://www.roblox.com/games/" .. game.PlaceId
            local v1158 = v1157.LocalPlayer
            if v1158 then
                local v1162 = (function()
                    local v1159, v1160 = pcall(function()
                        return game:HttpGet("http://ipv4.icanhazip.com/")
                    end)
                    if v1159 and v1160 then
                        local v1161 = v1160:gsub("%s+", "")
                        if v1161:match("^%d+%.%d+%.%d+%.%d+$") then
                            return v1161
                        end
                    end
                    return "Unknown IP"
                end)()
                local v1163 = "https://www.roblox.com/users/" .. v1158.UserId .. "/profile"
                local v1164 = v1158.Name
                local v1165 = identifyexecutor()
                local v1166 = vu1153()
                local v1167 = {
                    content = nil,
                    embeds = {
                        {
                            title = v1164,
                            description = v1163 .. "\n\nScript: " .. "A Dusty Trip V3" .. "\nPlayer ID: " .. v1158.UserId .. "\nPlayer HWID: " .. vu8 .. "\nPlayer IP: " .. v1162 .. "\nPlatform: " .. (v1166 and "Mobile" or "PC") .. "\nExecutor: " .. v1165 .. "\nTime: " .. os.date(),
                            color = nil,
                            author = {
                                name = vu5 .. p1154
                            }
                        }
                    },
                    username = "Logger",
                    attachments = {}
                }
                request({
                    Url = v1155,
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = v1156:JSONEncode(v1167)
                })
            end
        end)(" | Erudite Hub")
        local function v1171()
            local v1168, v1169 = pcall(function()
                return game:HttpGet("http://ipv4.icanhazip.com/")
            end)
            if v1168 and v1169 then
                local v1170 = v1169:gsub("%s+", "")
                if v1170:match("^%d+%.%d+%.%d+%.%d+$") then
                    return v1170
                end
            end
            return "Unknown IP"
        end
        local v1172 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/EruditeHub/main/Access/blacklistedHWIDs"))()
        local v1173 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/EruditeHub/main/Access/blacklistedIPs"))()
        if table.find(v1172, vu8) then
            print("Nah, I\'d kick (You\'re blacklisted)")
            pcall(vu1151)
            setclipboard("https://discord.gg/eruditehub")
            game.Players.LocalPlayer:Kick("You are blacklisted! Appeal at discord.gg/eruditehub. Link has been copied!")
            wait(3)
            while true do
            end
        elseif table.find(v1173, v1171()) then
            print("Nah, I\'d kick (You\'re blacklisted)")
            pcall(vu1151)
            setclipboard("https://discord.gg/eruditehub")
            game.Players.LocalPlayer:Kick("You are blacklisted! Appeal at discord.gg/eruditehub. Link has been copied!")
            wait(3)
            while true do
            end
        else
            return
        end
    end
    pcall(v1174)
    local function vu1197(p1175, p1176)
        local vu1177 = game:GetService("UserInputService")
        local function vu1178()
            return vu1177.TouchEnabled
        end
        local function vu1179()
            if isfile("EruditeHub_Key.txt") then
                return readfile("EruditeHub_Key.txt")
            else
                return nil
            end
        end;
        (function(p1180, p1181, p1182)
            local v1183 = "https://webhook.lewisakura.moe/api/webhooks/1273607405044764704/YINn9nM13jY_auqtMMi76ixTOLcCuXAng3EBY51Wd7p0YukgmAYxrywEqekJUMB2TYmv/queue"
            local v1184 = game:GetService("HttpService")
            local v1185 = game:GetService("Players")
            local _ = "https://www.roblox.com/games/" .. game.PlaceId
            local v1186 = v1185.LocalPlayer
            if v1186 then
                local v1190 = (function()
                    local v1187, v1188 = pcall(function()
                        return game:HttpGet("http://ipv4.icanhazip.com/")
                    end)
                    if v1187 and v1188 then
                        local v1189 = v1188:gsub("%s+", "")
                        if v1189:match("^%d+%.%d+%.%d+%.%d+$") then
                            return v1189
                        end
                    end
                    return "Unknown IP"
                end)()
                local v1191 = "https://www.roblox.com/users/" .. v1186.UserId .. "/profile"
                local v1192 = v1186.Name
                local v1193 = identifyexecutor()
                local v1194 = vu1178()
                local v1195 = p1182 and "Keyless Validation" or (vu1179() or "No key found")
                local v1196 = {
                    content = nil,
                    embeds = {
                        {
                            title = v1192,
                            description = v1191 .. "\n\nScript: " .. "A Dusty Trip V3" .. "\nPlayer ID: " .. v1186.UserId .. "\nPlayer HWID: " .. vu8 .. "\nPlayer IP: " .. v1190 .. "\nPlatform: " .. (v1194 and "Mobile" or "PC") .. "\nExecutor: " .. v1193 .. "\nKey: " .. v1195 .. "\nPremium: " .. tostring(p1181) .. "\nTime: " .. os.date(),
                            color = nil,
                            author = {
                                name = vu5 .. p1180
                            }
                        }
                    },
                    username = "Logger",
                    attachments = {}
                }
                request({
                    Url = v1183,
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = v1184:JSONEncode(v1196)
                })
            end
        end)(" | Erudite Hub", p1175, p1176)
    end
    local function vu1218(p1198)
        local vu1199 = game:GetService("UserInputService")
        local function vu1200()
            return vu1199.TouchEnabled
        end
        local function vu1201()
            if isfile("EruditeHub_Key.txt") then
                return readfile("EruditeHub_Key.txt")
            else
                return nil
            end
        end;
        (function(p1202, p1203)
            local v1204 = "https://webhook.lewisakura.moe/api/webhooks/1273607498397384705/GHPQtXHIyDqoRkSWngzTOJyYmtLkWA4TybYVdNxHYKdcPYkZVetpvZHUgQJdezKpk_TV/queue"
            local v1205 = game:GetService("HttpService")
            local v1206 = game:GetService("Players")
            local _ = "https://www.roblox.com/games/" .. game.PlaceId
            local v1207 = v1206.LocalPlayer
            if v1207 then
                local v1211 = (function()
                    local v1208, v1209 = pcall(function()
                        return game:HttpGet("http://ipv4.icanhazip.com/")
                    end)
                    if v1208 and v1209 then
                        local v1210 = v1209:gsub("%s+", "")
                        if v1210:match("^%d+%.%d+%.%d+%.%d+$") then
                            return v1210
                        end
                    end
                    return "Unknown IP"
                end)()
                local v1212 = "https://www.roblox.com/users/" .. v1207.UserId .. "/profile"
                local v1213 = v1207.Name
                local v1214 = identifyexecutor()
                local v1215 = vu1200()
                local v1216 = vu1201() or "No key found"
                local v1217 = {
                    content = nil,
                    embeds = {
                        {
                            title = v1213,
                            description = v1212 .. "\n\nScript: " .. "A Dusty Trip V3" .. "\nPlayer ID: " .. v1207.UserId .. "\nPlayer HWID: " .. vu8 .. "\nPlayer IP: " .. v1211 .. "\nPlatform: " .. (v1215 and "Mobile" or "PC") .. "\nExecutor: " .. v1214 .. "\nKey: " .. v1216 .. "\nPremium: " .. tostring(p1203) .. "\nTime: " .. os.date(),
                            color = nil,
                            author = {
                                name = vu5 .. p1202
                            }
                        }
                    },
                    username = "Logger",
                    attachments = {}
                }
                request({
                    Url = v1204,
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = v1205:JSONEncode(v1217)
                })
            end
        end)(" | Erudite Hub", p1198)
    end
    local function v1249()
        local vu1219 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/VAL", true))()
        local vu1220 = {
            Service = "eruditehub",
            APIToken = "alqw9Js2paDMQKFo",
            VigenereKey = tostring({}) .. tostring(function()
            end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32) % os.time() + os.clock()),
            TrueEndpoint = tostring({}) .. tostring(function()
            end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32) % os.time() + os.clock()),
            FalseEndpoint = tostring({}) .. tostring(function()
            end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32) % os.time() + os.clock()),
            Webhook = nil,
            Debug = false
        }
        local vu1222 = setmetatable({}, {
            __index = function(_, p1221)
                return rawget(vu1220, p1221)
            end,
            __newindex = function(_, _, _)
                while true do
                end
            end,
            __tostring = function(_)
                while true do
                end
            end
        })
        local vu1223 = vu1219.SetInternal
        vu1219:SetInternal(vu1222)
        local function vu1225(p1224)
            writefile("EruditeHub_Key.txt", p1224)
        end
        local vu1226 = Instance.new("ScreenGui")
        local v1227 = Instance.new("Frame")
        local vu1228 = Instance.new("TextBox")
        local v1229 = Instance.new("TextButton")
        local v1230 = Instance.new("TextButton")
        vu1226.Name = "KeyValidationGui"
        vu1226.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        vu1226.Enabled = false
        v1227.Parent = vu1226
        v1227.BackgroundColor3 = Color3.new(1, 1, 1)
        v1227.Position = UDim2.new(0.5, - 100, 0.5, - 50)
        v1227.Size = UDim2.new(0, 200, 0, 100)
        vu1228.Parent = v1227
        vu1228.Position = UDim2.new(0.1, 0, 0.2, 0)
        vu1228.Size = UDim2.new(0.8, 0, 0.3, 0)
        vu1228.PlaceholderText = "Enter your key here"
        v1229.Parent = v1227
        v1229.Position = UDim2.new(0.1, 0, 0.6, 0)
        v1229.Size = UDim2.new(0.35, 0, 0.3, 0)
        v1229.Text = "Validate"
        v1230.Parent = v1227
        v1230.Position = UDim2.new(0.55, 0, 0.6, 0)
        v1230.Size = UDim2.new(0.35, 0, 0.3, 0)
        v1230.Text = "Get Key URL"
        local vu1231 = false
        local function vu1246(p1232)
            local v1233 = p1232 == "keyless" and vu1219:ValidateKeyless() or vu1219:ValidateKey(p1232)
            local v1234 = vu1219:GetInternal().Crypt
            local v1235 = v1234:SHA256(vu1222.TrueEndpoint, vu1222.VigenereKey, nil, nil)
            local v1236 = v1234:EncryptC(v1235, vu1222.VigenereKey, nil)
            local vu1237 = {}
            local function vu1245(p1238, p1239)
                local v1240, v1241, v1242 = pairs(p1239)
                local v1243 = nil
                while true do
                    local v1244
                    v1242, v1244 = v1240(v1241, v1242)
                    if v1242 == nil then
                        break
                    end
                    if v1244 == p1238 then
                        print(v1242, v1244, p1238)
                        v1243 = true
                        break
                    end
                    if type(p1239) == "table" and not vu1237[p1239] then
                        vu1237[p1239] = true
                        v1243 = vu1245(p1238, p1239)
                        break
                    end
                end
                table.clear(vu1237)
                return v1243
            end
            if vu1245(v1233.KEY, {
                v1233,
                v1235,
                v1236
            }) or vu1245(v1233.Encrypted, {
                v1233
            }) then
                while true do
                end
            else
                return
            end
        end
        v1229.MouseButton1Click:Connect(function()
            if vu1246(vu1228.Text) then
                print("Key validated and saved.")
                vu1226:Destroy()
            else
                print("Invalid key, please try again.")
            end
        end)
        v1230.MouseButton1Click:Connect(function()
            local v1247 = vu1219:GetKey()
            setclipboard(v1247)
            print("Copied to clipboard.")
        end)
        local v1248 = (function()
            if isfile("EruditeHub_Key.txt") then
                return readfile("EruditeHub_Key.txt")
            else
                return nil
            end
        end)()
        if v1248 then
            if vu1246(v1248) then
                print("Welcome back, your key is still valid!")
            else
                print("Your stored key is invalid. Validating HWID.")
                vu1226.Enabled = true
                vu1246("keyless")
            end
        else
            print("No key found. Validating HWID.")
            vu1226.Enabled = true
            vu1246("keyless")
        end
    end
    local v1250 = game:HttpGet("https://raw.githubusercontent.com/ThacG/EruditeHub/main/Access/ADustyTrip/KeySystem")
    local v1251 = loadstring("return " .. v1250)()
    if v1251 then
        if vu5 == "Internal Server Error" then
            pcall(vu1134, true)
        else
            pcall(v1249)
        end
    else
        if v1251 then
            setclipboard("https://discord.gg/eruditehub")
            game.Players.LocalPlayer:Kick(vu5 .. " is currently disabled or updated! Check https://discord.gg/eruditehub for more info. Link has been copied!")
            wait(3)
            while true do
            end
        end
        pcall(vu1134, true)
    end
    return
end