-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local vu2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))()
local v3 = vu2:start("Car Dealership Tycoon", "3.0", true)
local v4 = v3:addTab("Main Options")
local v5 = v3:addTab("Auto Races")
v3:addTab("Season Pass")
local v6 = v3:addTab("Car Options")
local vu7 = cloneref(game:GetService("Players").LocalPlayer)
local vu8 = cloneref(game:GetService("ReplicatedStorage"))
local vu9 = vu7.Character or vu7.CharacterAdded:Wait()
local _ = vu9.Humanoid
local _ = vu9.HumanoidRootPart
function findCarPl()
    local vu10 = workspace:WaitForChild("Cars")
    local function v19()
        local v11 = vu10
        local v12, v13, v14 = ipairs(v11:GetChildren())
        while true do
            local v15
            v14, v15 = v12(v13, v14)
            if v14 == nil then
                break
            end
            local v16 = v15:FindFirstChild("Stats")
            if v16 then
                v16 = v15.Stats:FindFirstChild("Owner")
            end
            if v16 and v16.Value == vu7.Name then
                local v17 = v15:FindFirstChild("Body")
                if v17 then
                    v17 = v15.Body:FindFirstChild("VehicleSeat")
                end
                if v17 and (v17.Occupant and v17.Occupant.Parent == vu7.Character) then
                    return v15
                end
                local v18 = workspace.Cars[v15.Name].Body.VehicleSeat
                workspace.Cars[v15.Name].ChassisMain.Seat:FireServer(v18)
                return v15
            end
        end
    end
    local v20 = v19()
    if not v20 then
        vu8.Remotes.Spawn:FireServer("Fiat", "Desktop")
        wait(0.5)
        v20 = v19()
    end
    repeat
        wait(0.2)
    until v20
    return v20
end
function createPlatform()
    local v21 = Instance.new("Part", game:GetService("Workspace"))
    v21.Size = Vector3.new(2048, 1, 2048)
    v21.CFrame = CFrame.new(- 3966.61011, 608.327026, - 4139.58984, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    v21.Anchored = true
    v21.Name = "Platform69"
    print("Platform created")
    return v21
end
function moveCarTo(p22, p23, p24)
    local v25 = p22.PrimaryPart.CFrame
    local v26 = v25.Position
    local v27 = p23.Position
    local v28 = tick()
    while tick() - v28 < p24 do
        local v29 = v26:Lerp(v27, (tick() - v28) / p24)
        p22:SetPrimaryPartCFrame(CFrame.new(v29) * CFrame.Angles(v25:ToEulerAnglesXYZ()))
        wait()
    end
    p22:SetPrimaryPartCFrame(CFrame.new(v27) * CFrame.Angles(v25:ToEulerAnglesXYZ()))
end
function moveCarToFast(p30, p31, p32)
    local v33 = p30.PrimaryPart.CFrame
    local _ = v33.Position
    local v34 = p31.Position
    tick()
    local v35 = p32 or CFrame.Angles(v33:ToEulerAnglesXYZ())
    p30:SetPrimaryPartCFrame(CFrame.new(v34) * v35)
end
function TeleportTo(p36)
    vu9:SetPrimaryPartCFrame(p36 * CFrame.new(0, 5, 0))
    return true
end
function RenderMap()
    local v37 = vu9.HumanoidRootPart
    local v38 = {
        Vector3.new(2143.22, 1588.35, - 225.68),
        Vector3.new(- 737.55, 1380.95, - 615),
        Vector3.new(- 3690.9, 1316.24, - 204.82),
        Vector3.new(- 5206.97, 1395.32, 2188.12),
        Vector3.new(- 2870.82, 1126.8, 6060.86),
        Vector3.new(435.03, 1135.34, 5609.99),
        Vector3.new(2500.57, 955.91, 5461.14),
        Vector3.new(3230.22, 1171.46, 4124.99),
        Vector3.new(2894.9, 1214.47, 2255.58),
        Vector3.new(- 844.67, 1518.7, 2697.47),
        Vector3.new(- 2995.08, 1180.89, 2267.57)
    }
    local v39, v40, v41 = ipairs(v38)
    while true do
        local v42
        v41, v42 = v39(v40, v41)
        if v41 == nil then
            break
        end
        if vu9 and vu9:FindFirstChild("HumanoidRootPart") then
            v37.CFrame = CFrame.new(v42)
            v37.Anchored = true
        end
        wait(1.5)
    end
    v37.Anchored = false
end
v4:addLine("Farm Options:", "Big")
v4:addToggle("Auto Farm Car", "", "big", false, function(p43)
    local v44 = p43 and findCarPl()
    if v44 then
        vu2:SendNotification("Auto Farm Started! Please do not move the car!", "Any errors? Restart Auto Farm", true)
        spawn(function()
            while vu1.Settings["Auto Farm Car"] and wait() do
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", 0, game)
            end
        end)
        local v45 = CFrame.Angles(0, math.rad(179.7), 0)
        moveCarToFast(v44, CFrame.new(- 1861, 603, 3210), v45)
        while vu1.Settings["Auto Farm Car"] and wait() do
            if (v44.PrimaryPart.Position - Vector3.new(- 1861, 603, 5227)).Magnitude < 60 then
                moveCarToFast(v44, CFrame.new(- 1861, 603, 3210), v45)
            end
        end
    end
end)
v4:addLine("Tycoon Options:", "Big")
v4:addToggle("Auto Build Tycoon", "", "big", false, function(p46)
    if p46 then
        local v47, v48, v49 = pairs(workspace.Tycoons:GetChildren())
        local v50 = nil
        while true do
            local v51
            v49, v51 = v47(v48, v49)
            if v49 == nil then
                break
            end
            if v51.Owner.Value == vu7.Name then
                v50 = v51
            end
        end
        while vu1.Settings["Auto Build Tycoon"] and wait() do
            local v52, v53, v54 = pairs(v50.Dealership.Purchases:GetChildren())
            while true do
                local v55
                v54, v55 = v52(v53, v54)
                if v54 == nil then
                    break
                end
                local v56 = {
                    "BuyItem",
                    v55.Name
                }
                vu8.Remotes.Build:FireServer(unpack(v56))
            end
        end
    end
end)
v4:addToggle("Auto Sell For NPC", "", "big", false, function(p57)
    if p57 then
        local v58, v59, v60 = pairs(workspace.Tycoons:GetChildren())
        local v61 = nil
        while true do
            local vu62
            v60, vu62 = v58(v59, v60)
            if v60 == nil then
                vu62 = v61
                break
            end
            if vu62.Owner.Value == vu7.Name then
                break
            end
        end
        if vu62 then
            local vu63 = require(vu8.Databases.Cars)
            local v64 = require(vu8.Modules.DealershipCustomerClientController)
            local vu65 = false
            local vu66 = v64.OnNPCAdded
            function v64.OnNPCAdded(...)
                if vu1.Settings["Auto Sell For NPC"] then
                    print("OnNPCAdded chamada")
                    vu65 = true
                    return vu66(...)
                end
            end
            local vu67 = v64.ShowCustomerDialogueMessage
            function v64.ShowCustomerDialogueMessage(...)
                if not vu1.Settings["Auto Sell For NPC"] then
                    return
                end
                if vu65 then
                    local v68, v69, v70 = pairs(vu62.Dealership:GetChildren())
                    local v71 = nil
                    while true do
                        local v72
                        v70, v72 = v68(v69, v70)
                        if v70 == nil then
                            v72 = v71
                            break
                        end
                        if v72:GetAttribute("CustomerName") then
                            break
                        end
                    end
                    if v72 then
                        local v73 = v72:GetAttribute("OrderId")
                        local v74 = v72:GetAttribute("OrderSpecBudget")
                        local v75 = v72:GetAttribute("OrderSpecColor")
                        local v76 = v72:GetAttribute("OrderSpecRimColor")
                        local v77 = v72:GetAttribute("OrderSpecRims")
                        local v78 = v72:GetAttribute("OrderSpecSprings")
                        if not vu1.Settings["Auto Sell For NPC"] then
                            return
                        end
                        vu8.Remotes.DealershipCustomerController.NPCHandler:FireServer({
                            Action = "AcceptOrder",
                            OrderId = tostring(v73)
                        })
                        local v79, v80 = unpack(string.split(v74, ";"))
                        local v81 = tonumber(v79)
                        local v82 = tonumber(v80)
                        local v83, v84, v85 = pairs(vu63)
                        local v86 = nil
                        while true do
                            local vu87, _ = v83(v84, v85)
                            if vu87 == nil then
                                break
                            end
                            v85 = vu87
                            local v88, v89 = pcall(function()
                                return vu8.Packages._Index["sleitnick_knit@1.7.0"].knit.Services.CarCustomizationService.RF.GetCarPrice:InvokeServer(vu87)
                            end)
                            if v88 and v89 then
                                local v90 = tonumber(v89)
                                if v81 <= v90 and v90 <= v82 then
                                    v86 = tostring(vu87)
                                    break
                                end
                            end
                        end
                        if v86 then
                            vu8.Remotes.DealershipCustomerController.NPCHandler:FireServer({
                                OrderId = tostring(v73),
                                Action = "CompleteOrder",
                                Specs = {
                                    Car = tostring(v86),
                                    Color = tostring(v75),
                                    Rims = tostring(v77),
                                    Springs = tostring(v78),
                                    RimColor = tostring(v76)
                                }
                            })
                            vu8.Remotes.DealershipCustomerController.NPCHandler:FireServer({
                                Action = "CollectReward",
                                OrderId = tostring(v73)
                            })
                        end
                    end
                end
                vu65 = false
                return vu67(...)
            end
        end
    end
end)
v4:addToggle("Auto Delivery", "", "big", true, function(p91)
    if p91 then
        local vu92 = false
        while vu1.Settings["Auto Delivery"] do
            if vu92 then
                return
            end
            task.wait()
            vu8.Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({
                Action = "RequestJobsData"
            })
            local vu93 = nil
            vu93 = vu8.Remotes.DealershipCustomerController.JobRemoteHandler.OnClientEvent:Connect(function(p94)
                if not vu92 then
                    vu92 = true
                    if # p94.Jobs > 0 then
                        local v95 = p94.Jobs[1]
                        local vu96 = {}
                        local v97 = {
                            Truck = "DeliveryTruck",
                            Action = "StartDeliveryJob"
                        }
                        local v98 = {
                            {
                                Id = v95.Id,
                                Image = "rbxassetid://14766562703",
                                CFrame = CFrame.new(- 1628.668701171875, 601.6500854492188, 4617.27587890625) * CFrame.Angles(0, 1.5707963705062866, 0),
                                JobData = {
                                    Id = v95.Id,
                                    Rims = v95.Rims,
                                    OrderId = v95.OrderId,
                                    Distance = v95.Distance,
                                    State = v95.State,
                                    Customer = v95.Customer,
                                    Color = v95.Color,
                                    Car = v95.Car,
                                    Springs = v95.Springs,
                                    Destination = v95.Destination,
                                    MoneyReward = v95.MoneyReward,
                                    RimColor = v95.RimColor
                                }
                            }
                        }
                        v97.Jobs = v98
                        vu96[1] = v97
                        local v99, _ = pcall(function()
                            vu8.Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(unpack(vu96))
                        end)
                        if v99 then
                            wait(5.5)
                            local v100 = workspace.ActionTasksGames.Jobs[v95.Destination]
                            if v100 then
                                local v101, v102, v103 = pairs(workspace.Cars:GetChildren())
                                while true do
                                    local v104
                                    v103, v104 = v101(v102, v103)
                                    if v103 == nil then
                                        break
                                    end
                                    if v104.Name == "DeliveryTruck" and v104.Stats.Owner.Value == vu7.Name then
                                        local v105 = v100.DeliveryPart.CFrame - v100.DeliveryPart.Position
                                        v104:SetPrimaryPartCFrame(CFrame.new(v100.DeliveryPart.Position + Vector3.new(0, 5, 0)) * v105)
                                        wait(8)
                                        vu93:Disconnect()
                                        vu92 = false
                                    end
                                end
                            end
                        else
                            vu93:Disconnect()
                            vu92 = false
                        end
                    end
                end
            end)
        end
    end
end)
local v106 = v5:addFolder("Airport Drag Race")
local vu107 = v106:addCombo("Select Laps", "", {
    "1x",
    "3x",
    "5x"
})
v106:addToggle("Auto Airport Drag Race", "", "big", false, function(p108)
    local v109 = p108 and findCarPl()
    if v109 then
        moveCarToFast(v109, CFrame.new(- 4517, 603, 3416))
        wait(1)
        local v110 = findCarPl()
        local v111 = workspace:WaitForChild("Races"):WaitForChild("Airport")
        local v112 = v111.LobbyBottom
        local v113 = v111.Checkpoints
        local v114 = vu107:getValue()
        local v115 = {
            ["1x"] = "1",
            ["3x"] = "3",
            ["5x"] = "5"
        }
        while vu1.Settings["Auto Airport Drag Race"] and wait() do
            if v111.Script.LobbyMembersAmount.Value <= 14 then
                local v116 = v110.PrimaryPart.CFrame - v110.PrimaryPart.Position
                local v117 = v112.Position + Vector3.new(0, 10, 0)
                repeat
                    v110:SetPrimaryPartCFrame(CFrame.new(v117) * v116)
                    wait()
                until (v110.PrimaryPart.Position - v117).Magnitude <= 2.5 or not vu1.Settings["Auto Airport Drag Race"]
                repeat
                    wait()
                until not (v111.Script.RaceProgress.Value and vu1.Settings["Auto Airport Drag Race"])
                if not v111.Script.LobbyProgress.Value then
                    repeat
                        workspace.Races.RaceHandler.StartLobby:FireServer("Airport")
                        wait()
                    until v111.Script.LobbyProgress.Value or not vu1.Settings["Auto Airport Drag Race"]
                end
                v111.Script.Vote:FireServer(v115[v114], "Vote")
                repeat
                    wait()
                until v111.Script.RaceProgress.Value or not vu1.Settings["Auto Airport Drag Race"]
                local v118 = v111.Script.Laps.Value
                for v119 = 1, v118 do
                    local _ = v119
                    for v120 = 1, # v113:GetChildren() do
                        if not vu1.Settings["Auto Airport Drag Race"] then
                            break
                        end
                        local v121 = v113[v120]:FindFirstChild("Checkpoint").CFrame
                        moveCarToFast(v110, v121)
                        wait(2.3)
                    end
                    if v118 == 2 and v119 == 2 or v118 == 3 and v119 == 3 then
                        break
                    end
                    wait(0.5)
                    moveCarToFast(v110, v111.GoalPart.CFrame)
                    wait(0.5)
                end
                if vu1.Settings["Auto Airport Drag Race"] then
                    moveCarTo(v110, v111.GoalPart.CFrame + Vector3.new(0, 2, 0), 2)
                    wait(1)
                    vu8.Remotes.DestroyGui:FireServer("Prize")
                end
                TeleportTo(v112.CFrame)
            end
        end
    end
end)
local v122 = v5:addFolder("Drag Race")
local vu123 = v122:addCombo("Select Vote", "", {
    "1/2",
    "1/4",
    "1/8"
})
v122:addToggle("Auto Drag Race", "", "big", false, function(p124)
    local v125 = p124 and findCarPl()
    if v125 then
        moveCarToFast(v125, CFrame.new(1462, 603, 2118))
        wait(0.5)
        moveCarToFast(v125, CFrame.new(1461, 605, 3228))
        wait(0.5)
        local v126 = findCarPl()
        local v127 = vu123:getValue() or "1/2"
        local v128 = workspace:WaitForChild("Races"):WaitForChild("Drag")
        local v129 = v128.LobbyBottom
        local v130 = {
            ["1/8"] = "1",
            ["1/4"] = "3",
            ["1/2"] = "5"
        }
        local v131 = {
            ["1/8"] = 2.5,
            ["1/4"] = 3.5,
            ["1/2"] = 4.5
        }
        while vu1.Settings["Auto Drag Race"] and wait() do
            if v128.Script.LobbyMembersAmount.Value <= 3 then
                local v132 = v126.PrimaryPart.CFrame - v126.PrimaryPart.Position
                local v133 = v129.Position + Vector3.new(0, 10, 0)
                v126:SetPrimaryPartCFrame(CFrame.new(v133) * v132)
                wait(1.5)
                repeat
                    wait()
                until not (vu1.Settings["Auto Drag Race"] and v128.Script.RaceProgress.Value)
                if not v128.Script.LobbyProgress.Value then
                    repeat
                        workspace.Races.RaceHandler.StartLobby:FireServer("Drag")
                        wait()
                    until v128.Script.LobbyProgress.Value
                end
                local v134 = {
                    v130[v127],
                    "Vote"
                }
                v128.Script.Vote:FireServer(unpack(v134))
                repeat
                    wait()
                until not vu1.Settings["Auto Drag Race"] or v128.Script.RaceProgress.Value
                if vu1.Settings["Auto Drag Race"] then
                    local v135 = workspace.Races.Drag[v128.Script.Mile.Value].GoalPart.CFrame + Vector3.new(0, 10, 0)
                    moveCarTo(v126, v135, v131[v128.Script.Mile.Value])
                    wait(1)
                    game:GetService("ReplicatedStorage").Remotes.DestroyGui:FireServer("PrizeDrag")
                end
            end
        end
    end
end)
v5:addFolder("Mountain Race"):addToggle("Auto Mountain Race", "", "big", false, function(p136)
    if p136 then
        local v137 = findCarPl()
        moveCarToFast(v137, CFrame.new(- 3902, 668, 1463))
        wait(1)
        if v137 then
            local v138 = workspace:WaitForChild("Races"):WaitForChild("Mountain")
            local v139 = v138.LobbyBottom
            local v140 = v138.Checkpoints
            while vu1.Settings["Auto Mountain Race"] and wait() do
                if v138.Script.LobbyMembersAmount.Value <= 3 then
                    local v141 = v137.PrimaryPart.CFrame - v137.PrimaryPart.Position
                    local v142 = v139.Position + Vector3.new(0, 10, 0)
                    repeat
                        local v143 = (v137.PrimaryPart.Position - v142).Magnitude
                        v137:SetPrimaryPartCFrame(CFrame.new(v142) * v141)
                        wait()
                    until v143 <= 2.5
                    repeat
                        wait()
                    until not (vu1.Settings["Auto Mountain Race"] and v138.Script.RaceProgress.Value)
                    if not v138.Script.LobbyProgress.Value then
                        repeat
                            workspace.Races.RaceHandler.StartLobby:FireServer("Mountain")
                            wait()
                        until v138.Script.LobbyProgress.Value
                    end
                    repeat
                        wait()
                    until not vu1.Settings["Auto Mountain Race"] or v138.Script.RaceProgress.Value
                    for v144 = 1, # v140:GetChildren() do
                        if not vu1.Settings["Auto Mountain Race"] then
                            break
                        end
                        local v145 = v140[v144]:FindFirstChild("Checkpoint").CFrame
                        moveCarToFast(v137, v145)
                        wait(2.3)
                    end
                    if vu1.Settings["Auto Mountain Race"] then
                        local v146 = v138.GoalPart.CFrame + Vector3.new(0, 2, 0)
                        moveCarTo(v137, v146, 5)
                        wait(1)
                        game:GetService("ReplicatedStorage").Remotes.DestroyGui:FireServer("Prize")
                    end
                    TeleportTo(v139.CFrame)
                end
            end
        end
    end
end)
local v147 = v5:addFolder("Circuit Race")
local vu148 = v147:addCombo("Select Mode", "", {
    "Circuit",
    "Gokart",
    "Oval"
})
local vu149 = v147:addCombo("Select Slot Laps", "", {
    "1 Slot",
    "2 Slot",
    "3 Slot"
})
v147:addToggle("Auto Circuit Race", "", "big", false, function(p150)
    local v151 = p150 and findCarPl()
    if v151 then
        moveCarToFast(v151, CFrame.new(1104, 603, 2519))
        wait(1)
        local v152 = findCarPl()
        local v153 = workspace:WaitForChild("Races"):WaitForChild("Race")
        local v154 = v153.LobbyBottom
        local v155 = vu148:getValue()
        local v156 = vu149:getValue()
        local v157 = {
            Gokart = 2.3,
            Circuit = 2.3,
            Oval = 4
        }
        local v158 = {
            Gokart = "1",
            Circuit = "3",
            Oval = "5"
        }
        local v159 = {
            ["1 Slot"] = "1",
            ["2 Slot"] = "3",
            ["3 Slot"] = "5"
        }
        while vu1.Settings["Auto Circuit Race"] and wait() do
            if v153.Script.LobbyMembersAmount.Value <= 14 then
                local v160 = v152.PrimaryPart.CFrame - v152.PrimaryPart.Position
                local v161 = v154.Position + Vector3.new(0, 10, 0)
                local v162 = false
                repeat
                    local v163 = (v152.PrimaryPart.Position - v161).Magnitude
                    v152:SetPrimaryPartCFrame(CFrame.new(v161) * v160)
                    wait()
                until v163 <= 2.5
                repeat
                    wait()
                until not (vu1.Settings["Auto Circuit Race"] and v153.Script.RaceProgress.Value)
                if not v153.Script.LobbyProgress.Value then
                    repeat
                        workspace.Races.RaceHandler.StartLobby:FireServer("Race")
                        wait()
                    until v153.Script.LobbyProgress.Value
                end
                local v164 = {
                    v158[v155] or "Oval",
                    "VoteRace"
                }
                workspace.Races.Race.Script.Vote:FireServer(unpack(v164))
                repeat
                    wait()
                until v153.Script.RaceType.Value ~= ""
                local v165 = {
                    v159[v156] or "1",
                    tostring("VoteLaps" .. v153.Script.RaceType.Value)
                }
                workspace.Races.Race.Script.Vote:FireServer(unpack(v165))
                repeat
                    wait()
                until not vu1.Settings["Auto Circuit Race"] or v153.Script.RaceProgress.Value
                if v153.Script.RaceType.Value == "Gokart" then
                    v152 = findCarPl()
                    v162 = true
                end
                for _ = 1, v153.Script.Laps.Value do
                    local v166 = v153[v153.Script.RaceType.Value]:FindFirstChild("Checkpoints")
                    for v167 = 1, # v166:GetChildren() do
                        if not vu1.Settings["Auto Circuit Race"] then
                            break
                        end
                        local v168 = v166[v167]:FindFirstChild("Checkpoint").CFrame
                        moveCarToFast(v152, v168)
                        wait(v157[v153.Script.RaceType.Value])
                    end
                    wait(0.5)
                    local v169 = v153[v153.Script.RaceType.Value].GoalPart.CFrame
                    moveCarToFast(v152, v169)
                    wait(0.5)
                end
                if vu1.Settings["Auto Circuit Race"] then
                    local v170 = v153[v153.Script.RaceType.Value].GoalPart.CFrame
                    moveCarToFast(v152, v170)
                    wait(1)
                    game:GetService("ReplicatedStorage").Remotes.DestroyGui:FireServer("Prize")
                end
                TeleportTo(v154.CFrame)
                if v162 then
                    v152 = findCarPl()
                end
            end
        end
    end
end)
local v171 = v5:addFolder("Endurance Race")
local vu172 = v171:addCombo("Select Slot Laps", "", {
    "1x",
    "2x",
    "3x"
})
v171:addToggle("Auto Endurance Race", "", "big", false, function(p173)
    local v174 = p173 and findCarPl()
    if v174 then
        moveCarToFast(v174, CFrame.new(- 2779, 603, 4598))
        wait(1)
        local v175 = findCarPl()
        local v176 = workspace:WaitForChild("Races"):WaitForChild("Endurance")
        local v177 = v176.LobbyBottom
        local v178 = v176.Checkpoints
        local v179 = vu172:getValue()
        local v180 = {
            ["1x"] = "1",
            ["2x"] = "3",
            ["3x"] = "5"
        }
        while vu1.Settings["Auto Endurance Race"] and wait() do
            if v176.Script.LobbyMembersAmount.Value <= 14 then
                local v181 = v175.PrimaryPart.CFrame - v175.PrimaryPart.Position
                local v182 = v177.Position + Vector3.new(0, 10, 0)
                repeat
                    v175:SetPrimaryPartCFrame(CFrame.new(v182) * v181)
                    wait()
                until (v175.PrimaryPart.Position - v182).Magnitude <= 2.5 or not vu1.Settings["Auto Endurance Race"]
                repeat
                    wait()
                until not (v176.Script.RaceProgress.Value and vu1.Settings["Auto Endurance Race"])
                if not v176.Script.LobbyProgress.Value then
                    repeat
                        workspace.Races.RaceHandler.StartLobby:FireServer("Endurance")
                        wait()
                    until v176.Script.LobbyProgress.Value or not vu1.Settings["Auto Endurance Race"]
                end
                workspace.Races.Endurance.Script.Vote:FireServer(v180[v179], "Vote")
                repeat
                    wait()
                until v176.Script.RaceProgress.Value or not vu1.Settings["Auto Endurance Race"]
                local v183 = v176.Script.Laps.Value
                for v184 = 1, v183 do
                    local _ = v184
                    for v185 = 1, # v178:GetChildren() do
                        if not vu1.Settings["Auto Endurance Race"] then
                            break
                        end
                        local v186 = v185 == 10 and CFrame.new(737, 671, - 53) or v178[v185]:FindFirstChild("Checkpoint").CFrame
                        moveCarToFast(v175, v186)
                        wait(2.5)
                    end
                    if v183 == 2 and v184 == 2 or v183 == 3 and v184 == 3 then
                        break
                    end
                    wait(0.5)
                    moveCarToFast(v175, v176.GoalPart.CFrame)
                    wait(0.5)
                end
                if vu1.Settings["Auto Endurance Race"] then
                    moveCarTo(v175, v176.GoalPart.CFrame + Vector3.new(0, 2, 0), 2)
                    wait(1)
                    game:GetService("ReplicatedStorage").Remotes.DestroyGui:FireServer("Prize")
                end
                TeleportTo(v177.CFrame)
            end
        end
    end
end)
local v187 = v5:addFolder("Rally Race")
local vu188 = v187:addCombo("Select Slot Laps", "", {
    "1x",
    "2x",
    "3x"
})
v187:addToggle("Auto Rally Race", "", "big", false, function(p189)
    local v190 = p189 and findCarPl()
    if v190 then
        moveCarToFast(v190, CFrame.new(- 2767, 608, 1096))
        wait(1)
        local v191 = findCarPl()
        local v192 = workspace:WaitForChild("Races"):WaitForChild("Rally")
        local v193 = v192.LobbyBottom
        local v194 = v192.Checkpoints
        local v195 = vu188:getValue()
        local v196 = {
            ["1x"] = "1",
            ["2x"] = "3",
            ["3x"] = "5"
        }
        while vu1.Settings["Auto Rally Race"] and wait() do
            if v192.Script.LobbyMembersAmount.Value <= 14 then
                local v197 = v191.PrimaryPart.CFrame - v191.PrimaryPart.Position
                local v198 = v193.Position + Vector3.new(0, 10, 0)
                repeat
                    v191:SetPrimaryPartCFrame(CFrame.new(v198) * v197)
                    wait()
                until (v191.PrimaryPart.Position - v198).Magnitude <= 2.5 or not vu1.Settings["Auto Rally Race"]
                repeat
                    wait()
                until not (v192.Script.RaceProgress.Value and vu1.Settings["Auto Rally Race"])
                if not v192.Script.LobbyProgress.Value then
                    repeat
                        workspace.Races.RaceHandler.StartLobby:FireServer("Rally")
                        wait()
                    until v192.Script.LobbyProgress.Value or not vu1.Settings["Auto Rally Race"]
                end
                v192.Script.Vote:FireServer(v196[v195], "Vote")
                repeat
                    wait()
                until v192.Script.RaceProgress.Value or not vu1.Settings["Auto Rally Race"]
                local v199 = v192.Script.Laps.Value
                for v200 = 1, v199 do
                    local v201 = v200
                    for v202 = 1, # v194:GetChildren() do
                        if not vu1.Settings["Auto Rally Race"] then
                            break
                        end
                        local v203 = v194[v202]:FindFirstChild("Checkpoint").CFrame
                        moveCarToFast(v191, v203)
                        wait(2.3)
                    end
                    if v199 == 2 and v201 == 2 or v199 == 3 and v201 == 3 then
                        break
                    end
                    wait(0.5)
                    moveCarToFast(v191, v192.GoalPart.CFrame)
                    wait(0.5)
                end
                if vu1.Settings["Auto Rally Race"] then
                    moveCarTo(v191, v192.GoalPart.CFrame + Vector3.new(0, 2, 0), 2)
                    wait(1)
                    game:GetService("ReplicatedStorage").Remotes.DestroyGui:FireServer("Prize")
                end
                TeleportTo(v193.CFrame)
            end
        end
    end
end)
local v204 = v5:addFolder("Street Race")
local vu205 = v204:addCombo("Select Mode", "", {
    "City",
    "Drag",
    "Highway"
})
local vu206 = v204:addCombo("Select Slot Laps", "", {
    "1 Slot",
    "2 Slot",
    "3 Slot"
})
v204:addToggle("Auto Street Race", "", "big", false, function(p207)
    local v208 = p207 and findCarPl()
    if v208 then
        moveCarToFast(v208, CFrame.new(- 2068, 603, 5142))
        wait(1)
        local v209 = findCarPl()
        local v210 = workspace:WaitForChild("Races"):WaitForChild("City")
        local v211 = v210.LobbyBottom
        local v212 = vu205:getValue()
        local v213 = vu206:getValue()
        local v214 = {
            City = "1",
            Drag = "3",
            Highway = "5"
        }
        local v215 = {
            ["1 Slot"] = "1",
            ["2 Slot"] = "3",
            ["3 Slot"] = "5"
        }
        local v216 = {
            City = 2.3,
            Drag = 3.9,
            Highway = 2.3
        }
        while vu1.Settings["Auto Street Race"] and wait() do
            if v210.Script.LobbyMembersAmount.Value <= 14 then
                local v217 = v209.PrimaryPart.CFrame - v209.PrimaryPart.Position
                local v218 = v211.Position + Vector3.new(0, 10, 0)
                repeat
                    local v219 = (v209.PrimaryPart.Position - v218).Magnitude
                    v209:SetPrimaryPartCFrame(CFrame.new(v218) * v217)
                    wait()
                until v219 <= 2.5
                repeat
                    wait()
                until not (v210.Script.RaceProgress.Value and vu1.Settings["Auto Street Race"])
                if not v210.Script.LobbyProgress.Value then
                    repeat
                        workspace.Races.RaceHandler.StartLobby:FireServer("City")
                        wait()
                    until v210.Script.LobbyProgress.Value or not vu1.Settings["Auto Street Race"]
                end
                local v220 = {
                    v214[v212] or "City",
                    "VoteRace"
                }
                v210.Script.Vote:FireServer(unpack(v220))
                repeat
                    wait()
                until v210.Script.RaceType.Value ~= "" or not vu1.Settings["Auto Street Race"]
                if v210.Script.RaceType.Value ~= "Drag" then
                    local v221 = {
                        v215[v213] or "1",
                        tostring("VoteLaps" .. v210.Script.RaceType.Value)
                    }
                    v210.Script.Vote:FireServer(unpack(v221))
                end
                repeat
                    wait()
                until v210.Script.RaceProgress.Value or not vu1.Settings["Auto Street Race"]
                local v222 = v210[v210.Script.RaceType.Value]
                local v223 = v210.Script.Laps.Value
                if v210.Script.RaceType.Value == "Drag" then
                    local v224 = v222.GoalPart.CFrame + Vector3.new(0, 2, 0)
                    moveCarTo(v209, v224, v216[v210.Script.RaceType.Value])
                else
                    local v225 = v222:FindFirstChild("Checkpoints")
                    for v226 = 1, v223 do
                        local _ = v226
                        for v227 = 1, # v225:GetChildren() do
                            if not vu1.Settings["Auto Street Race"] then
                                break
                            end
                            local v228 = v227 == 19 and (CFrame.new(2024, 624, 4132) and v210.Script.RaceType.Value == "Highway") and true or v225[v227]:FindFirstChild("Checkpoint").CFrame
                            moveCarToFast(v209, v228)
                            wait(v216[v210.Script.RaceType.Value])
                        end
                        if v223 == 2 and v226 == 2 or (v223 == 3 and v226 == 3 or v223 == 4 and v226 == 4) then
                            break
                        end
                        wait(0.5)
                        local v229 = v210[v210.Script.RaceType.Value].GoalPart.CFrame
                        moveCarToFast(v209, v229)
                        wait(0.5)
                    end
                end
                if vu1.Settings["Auto Street Race"] and v210.Script.RaceType.Value ~= "Drag" or v210.Script.RaceType.Value ~= nil then
                    local v230 = v222.GoalPart.CFrame
                    moveCarToFast(v209, v230)
                end
                wait(1)
                game:GetService("ReplicatedStorage").Remotes.DestroyGui:FireServer("Prize")
                TeleportTo(v211.CFrame)
            end
        end
    end
end)
local v231 = vu7.PlayerGui.Menu.Inventory.Cars.Frame.Frame
local v232, v233, v234 = pairs(v231:GetChildren())
local v235 = {}
while true do
    local v236
    v234, v236 = v232(v233, v234)
    if v234 == nil then
        break
    end
    if v236:IsA("ImageButton") then
        local v237 = tostring(v236.Title.Text)
        table.insert(v235, v237)
    end
end
local vu238 = v6:addMultiCombo("Select Car", "", v235)
v6:addClick("Open Color Wheel", "", "Small", false, function(_)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/feVeolel/naofodeporra/refs/heads/main/Color%20Wheel"))()
end)
v6:addClick("Color Car (Need Use Color Wheel)", "", "big", false, function(_)
    local v239 = vu7.PlayerGui["LDS HUB COLOR WHEEL"].ColorEditor
    local v240 = vu238:getValue()
    local v241, v242, v243 = pairs(v240)
    while true do
        local v244
        v243, v244 = v241(v242, v243)
        if v243 == nil then
            break
        end
        local v245 = vu7.PlayerGui.Menu.Inventory.Cars.Frame.Frame
        local v246, v247, v248 = pairs(v245:GetChildren())
        while true do
            local v249
            v248, v249 = v246(v247, v248)
            if v248 == nil then
                break
            end
            if v249:IsA("ImageButton") and v249.Title.Text == v244 then
                local v250 = v239.Frame.BackgroundColor3
                vu8.Remotes.Paint:FireServer(v249.Name, v250, "Paint")
            end
        end
    end
end)
local vu251 = 1
v6:addSlider("Select Multiplier Velocity", "", 1, 150, function(p252)
    vu251 = p252
end)
v6:addToggle("Multiplier Velocity Car", "", "big", false, function(p253)
    if p253 then
        local v254 = getgc(true)
        local v255 = next
        local v256 = nil
        local v257 = {}
        local v258 = nil
        while true do
            local v259
            v256, v259 = v255(v254, v256)
            if v256 == nil then
                v259 = v258
                break
            end
            if type(v259) == "table" and rawget(v259, "GearAccels") then
                for v260 = 1, 5 do
                    v257[v260] = v259.GearAccels[v260]
                end
                break
            end
        end
        while true do
            task.wait()
            if v259 then
                for v261 = 1, 5 do
                    v259.GearAccels[v261] = v259.GearAccels[v261] * tonumber(vu251)
                end
            end
            if not vu1.Settings["Multiplier Velocity Car"] then
                if v259 then
                    for v262 = 1, 5 do
                        v259.GearAccels[v262] = v257[v262]
                    end
                end
            end
        end
    else
        return
    end
end)
v6:addToggle("Multiplier Final Speed Car", "", "big", false, function(p263)
    if p263 then
        local v264 = getgc(true)
        local v265 = next
        local v266 = nil
        local v267 = {}
        local v268 = nil
        while true do
            local v269
            v266, v269 = v265(v264, v266)
            if v266 == nil then
                v269 = v268
                break
            end
            if type(v269) == "table" and rawget(v269, "GearSpeeds") then
                for v270 = 1, 5 do
                    v267[v270] = v269.GearSpeeds[v270]
                end
                break
            end
        end
        while true do
            task.wait()
            if v269 then
                for v271 = 1, 5 do
                    v269.GearSpeeds[v271] = v269.GearSpeeds[v271] * tonumber(vu251)
                end
            end
            if not vu1.Settings["Multiplier Final Speed Car"] then
                if v269 then
                    for v272 = 1, 5 do
                        v269.GearSpeeds[v272] = v267[v272]
                    end
                end
            end
        end
    else
        return
    end
end)
v6:addToggle("Multiplier Torque Car", "", "big", false, function(p273)
    if p273 then
        local v274 = getgc(true)
        local v275 = next
        local v276 = nil
        local v277 = {}
        local v278 = nil
        while true do
            local v279
            v276, v279 = v275(v274, v276)
            if v276 == nil then
                v279 = v278
                break
            end
            if type(v279) == "table" and rawget(v279, "GearTorques") then
                for v280 = 1, 5 do
                    v277[v280] = v279.GearTorques[v280]
                end
                break
            end
        end
        while true do
            task.wait()
            if v279 then
                for v281 = 1, 5 do
                    v279.GearTorques[v281] = v279.GearTorques[v281] * tonumber(vu251)
                end
            end
            if not vu1.Settings["Multiplier Final Speed Car"] then
                if v279 then
                    for v282 = 1, 5 do
                        v279.GearTorques[v282] = v277[v282]
                    end
                end
            end
        end
    else
        return
    end
end)
v6:addClick("Click to AirPlane Hand Brake", "", "big", false, function(_)
    local v283 = getgc(true)
    local v284 = next
    local v285 = nil
    local v286 = nil
    while true do
        local v287
        v285, v287 = v284(v283, v285)
        if v285 == nil then
            v287 = v286
            break
        end
        if type(v287) == "table" and rawget(v287, "BrakePower") then
            break
        end
    end
    if v287 then
        local v288 = v287.BrakePower
        rawset(v287, "BrakePower", math.huge)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "S", 0, game)
        wait(0.5)
        rawset(v287, "BrakePower", v288)
    end
end)