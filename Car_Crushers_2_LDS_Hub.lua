-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local vu2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))()
local v3 = vu2:start("Car Crushers 2", "3.0", true)
local v4 = v3:addTab("Auto Farm")
local v5 = v3:addTab("Select Material")
local v6 = v3:addTab("Core Escape")
local v7 = v3:addTab("Modifiers")
local v8 = cloneref(game:GetService("Players"))
local vu9 = cloneref(game:GetService("ReplicatedStorage"))
cloneref(game:GetService("VirtualUser"))
local vu10 = cloneref(game:GetService("VirtualInputManager"))
local vu11 = v8.LocalPlayer
local vu12 = workspace.CarCollection
local vu13 = vu9.VehicleInformation
local v14, v15, v16 = pairs(vu13:GetChildren())
local v17 = {}
while true do
    local v18
    v16, v18 = v14(v15, v16)
    if v16 == nil then
        break
    end
    table.insert(v17, v18:FindFirstChild("Name").Value)
end
function Character()
    return vu11.Character or vu11.CharacterAdded:Wait()
end
function TeleportTo(p19)
    local v20 = Character()
    local v21 = v20 and v20:FindFirstChild("HumanoidRootPart")
    if v21 then
        v21.CFrame = p19
        if (v21.Position - p19.Position).Magnitude <= 5 then
            return true
        end
    end
    return false
end
function antiragdoll()
    vu9.rE.ChangeSetting:FireServer("RagdollMode", 0)
end
function acharnomecarro(p22)
    local v23 = vu13
    local v24, v25, v26 = pairs(v23:GetChildren())
    while true do
        local v27
        v26, v27 = v24(v25, v26)
        if v26 == nil then
            break
        end
        if v27:FindFirstChild("Name").Value == p22 then
            return v27.Name
        end
    end
end
function UpSeatToSafe()
    local v28 = Character()
    local v29 = v28 and v28:FindFirstChild("Humanoid")
    if v29 then
        local v30 = tick()
        local v31 = 2
        repeat
            task.wait()
        until v29.Sit == true or v31 < tick() - v30
        if v29.Sit == true then
            v29.Sit = false
            local v32 = tick()
            local v33 = 2
            repeat
                task.wait()
            until v29.Sit == false or v33 < tick() - v32
            if v29.Sit == false and TeleportTo(CFrame.new(23, 12, 35) + Vector3.new(0, 5, 0)) then
                task.wait()
                return true
            end
        end
    end
    return false
end
vu11.Settings.RagdollMode:GetPropertyChangedSignal("Value"):Connect(function()
    if vu11.Settings.RagdollMode.Value == 1 then
        vu2:SendNotification("Anti Ragdoll activated!!", "do not activate ragdoll!!", true)
        antiragdoll()
    end
end)
local vu34 = v4:addCombo("Select Car", "select a car for auto farms", v17)
v4:addToggle("Auto Farm Car (selected)", "By activating this option, you will start farming the selected car.", "big", false, function(p35)
    if p35 then
        local v36 = vu34:getValue()
        local v37 = acharnomecarro(v36)
        local vu38 = false
        while vu1.Settings["Auto Farm Car (selected)"] do
            task.wait()
            if v37 then
                local vu39 = vu12:FindFirstChild(vu11.Name)
                if vu39 then
                    pcall(function()
                        local v40 = vu39
                        local v41, v42, v43 = pairs(v40:GetDescendants())
                        while true do
                            local v44
                            v43, v44 = v41(v42, v43)
                            if v43 == nil then
                                break
                            end
                            if v44.Name == "Wheels" then
                                local v45, v46, v47 = pairs(v44:GetChildren())
                                while true do
                                    local v48
                                    v47, v48 = v45(v46, v47)
                                    if v47 == nil then
                                        break
                                    end
                                    v48:Destroy()
                                end
                            end
                        end
                        if UpSeatToSafe() or vu38 then
                            vu38 = true
                            local v49 = vu39.Car.Body.HitBoxes.Main
                            v49.CFrame = v49.CFrame * CFrame.new(0, 60, 0)
                            v49.Velocity = v49.CFrame.lookVector * 1000
                            task.wait(0.5)
                        end
                    end)
                    if vu11.SpawnTimer.Value == 0 then
                        local v50 = false
                        vu9.rE.Vehicle.Spawning.RequestVehicleSpawn:FireServer("Dealership", v37)
                        task.wait(2)
                        vu38 = v50
                    end
                else
                    vu9.rE.Vehicle.Spawning.RequestVehicleSpawn:FireServer("Dealership", v37)
                    vu38 = false
                end
            else
                vu2:SendNotification("You need to select a Car to use this option!", "ERROR!", false)
            end
        end
    end
end)
v4:addToggle("Auto Farm Up Platina", "", "big", false, function(p51)
    if not p51 then
        return
    end
    while true do
        if not vu1.Settings["Auto Farm Up Platina"] then
        end
        task.wait()
        local v52 = require(vu9.SharedModules.Player.VehicleValueRetriver)
        local v53 = vu9.VehicleInformation
        local v54 = vu11.Passes.VIP
        local v55 = vu11.JoinedGroup
        local v56 = vu11.IsFavorited
        local v57 = workspace.CarCollection
        local v58, v59, v60 = pairs(v53:GetChildren())
        local v61 = {}
        while true do
            local v62, v63 = v58(v59, v60)
            if v62 == nil then
                break
            end
            v60 = v62
            if v63:FindFirstChild("PlatinaPrice") then
                local v64 = v63.PlatinaPrice.Value
                local v65 = v63.Name
                local v66 = v63:FindFirstChild("VipOnly")
                if v66 then
                    v66 = v63.VipOnly.Value
                end
                local v67 = v63:FindFirstChild("GroupOnly")
                if v67 then
                    v67 = v63.GroupOnly.Value
                end
                local v68 = v63:FindFirstChild("FavoriteOnly")
                if v68 then
                    v68 = v63.FavoriteOnly.Value
                end
                local v69 = v63:FindFirstChild("Exclusive")
                if v69 then
                    v69 = v63.Exclusive.Value
                end
                local v70 = (not v66 or v54.Value) and true or false
                if v67 and not v55.Value then
                    v70 = false
                end
                if v68 and not v56.Value then
                    v70 = false
                end
                if v69 then
                    v70 = false
                end
                if v70 then
                    local v71, v72, v73 = ipairs(v52.OwnedVehicles)
                    local v74 = false
                    while true do
                        local v75
                        v73, v75 = v71(v72, v73)
                        if v73 == nil then
                            break
                        end
                        if v75 == v65 then
                            v74 = true
                            break
                        end
                    end
                    table.insert(v61, {
                        name = v65,
                        platinaPrice = v64,
                        owned = v74
                    })
                end
            end
        end
        table.sort(v61, function(p76, p77)
            return p76.platinaPrice < p77.platinaPrice
        end)
        local v78, v79, v80 = ipairs(v61)
        local v81 = 0
        while true do
            local v82
            v80, v82 = v78(v79, v80)
            if v80 == nil then
                break
            end
            if v82.owned then
                v81 = v80
            end
        end
        if 0 < v81 and v81 < # v61 then
            local vu83 = v61[v81]
            local vu84 = v61[v81 + 1]
            if vu11.Platina.Value < vu84.platinaPrice then
                local v85, _ = pcall(function()
                    repeat
                        task.wait()
                    until vu11.SpawnTimer.Value <= 0
                    vu9.rE.Vehicle.Spawning.RequestVehicleSpawn:FireServer("Dealership", vu83.name, false)
                end)
                if v85 then
                    local vu86 = true
                    task.delay(10, function()
                        vu86 = false
                    end)
                    local v87 = vu86
                    task.wait()
                    local vu88 = v57:WaitForChild(vu11.Name, 10)
                    if vu88 then
                        pcall(function()
                            local v89 = vu88
                            local v90, v91, v92 = pairs(v89:GetDescendants())
                            while true do
                                local v93
                                v92, v93 = v90(v91, v92)
                                if v92 == nil then
                                    break
                                end
                                if v93.Name == "Wheels" then
                                    local v94, v95, v96 = pairs(v93:GetChildren())
                                    while true do
                                        local v97
                                        v96, v97 = v94(v95, v96)
                                        if v96 == nil then
                                            break
                                        end
                                        v97:Destroy()
                                    end
                                end
                            end
                            if UpSeatToSafe() then
                                local v98 = vu88.Car.Body.HitBoxes.Main
                                v98.CFrame = v98.CFrame * CFrame.new(0, 60, 0)
                                v98.Velocity = v98.CFrame.lookVector * 1000
                                task.wait(0.5)
                            end
                        end)
                    end
                    if v87 and vu1.Settings["Auto Farm Up Platina"] then
                    end
                end
            else
                print("ok")
                local v99, _ = pcall(function()
                    vu9.rF.PurchasePlatinaVehicle:InvokeServer(vu84.name)
                end)
                if v99 then
                    v52.SetOwnedVehicles({
                        vu84.name
                    })
                end
            end
        end
    end
end)
v4:addToggle("Auto Bonus Crusher (Selected) | BETA!", "By activating this option, you will start farming the selected car.", "big", true, function(p100)
    if p100 then
        local vu101 = workspace.Indicators
        local vu102 = game.Workspace.Crushers
        local vu103 = game:GetService("TweenService")
        local vu104 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
        vu1.X = true
        local function v105()
            repeat
                wait()
            until Character() and (Character():FindFirstChild("Humanoid") and Character().Humanoid.Sit)
            spawn(function()
                wait(0.5)
                vu10:SendKeyEvent(true, "Space", false, uwu)
            end)
            if Character().Humanoid.Sit then
                return true
            end
        end
        local function v108()
            local v106 = vu34:getValue()
            local v107 = acharnomecarro(v106)
            repeat
                wait()
            until vu11.SpawnTimer.Value == 0
            if vu11.SpawnTimer.Value == 0 then
                if v107 then
                    vu9.rE.Vehicle.Spawning.RequestVehicleSpawn:FireServer("Dealership", v107)
                else
                    vu2:SendNotification("You need to select a Car to use this option!", "ERROR!", false)
                end
            end
        end
        local function vu111(p109, p110)
            return vu103:Create(p109, vu104, {
                CFrame = p110
            })
        end
        local function vu113(p112)
            fireclickdetector(p112)
        end
        local function v155()
            local v114 = workspace.CarCollection:FindFirstChild(vu11.Name):FindFirstChild("Car"):FindFirstChild("Body").HitBoxes.Main
            local v115, v116, v117 = pairs(workspace.CarCollection:FindFirstChild(vu11.Name):GetDescendants())
            while true do
                local v118
                v117, v118 = v115(v116, v117)
                if v117 == nil then
                    break
                end
                if v118.Name == "Wheels" then
                    local v119, v120, v121 = pairs(v118:GetChildren())
                    while true do
                        local v122
                        v121, v122 = v119(v120, v121)
                        if v121 == nil then
                            break
                        end
                        v122:Destroy()
                    end
                end
            end
            local v123 = vu101
            local v124, v125, v126 = pairs(v123:GetChildren())
            while true do
                local v127
                v126, v127 = v124(v125, v126)
                if v126 == nil or not vu1.Settings["Auto Bonus Crusher (Selected) | BETA!"] then
                    break
                end
                if v127.Name ~= "FrenzyIndicator" then
                    local v128 = v127.Main
                    CFrame.new(v128.Position)
                    local v129 = vu102
                    local v130, v131, v132 = pairs(v129:GetChildren())
                    while true do
                        local v133
                        v132, v133 = v130(v131, v132)
                        if v132 == nil or not vu1.Settings["Auto Bonus Crusher (Selected) | BETA!"] then
                            break
                        end
                        local vu134 = v133.Centerpoint
                        if v128.CFrame == vu134.CFrame then
                            local vu135 = v133:FindFirstChild("CrusherSpawn")
                            spawn(function()
                                if vu135 then
                                    local v136 = vu111(Character().HumanoidRootPart, CFrame.new(vu134.Position) * CFrame.new(0, 2, 0))
                                    v136:Play()
                                    v136.Completed:Wait()
                                    wait(0.5)
                                    local v137 = vu111(Character().HumanoidRootPart, CFrame.new(vu135.Position) * CFrame.new(0, 2, 0))
                                    v137:Play()
                                    v137.Completed:Wait()
                                else
                                    local v138 = vu111(Character().HumanoidRootPart, CFrame.new(vu134.Position) * CFrame.new(0, 2, 0))
                                    v138:Play()
                                    v138.Completed:Wait()
                                end
                            end)
                            local v139 = vu111(v114, CFrame.new(v128.Position) * CFrame.new(0, 2, 0))
                            v139:Play()
                            v139.Completed:Wait(0.2)
                            local vu140 = v133:FindFirstChild("Scripted")
                            if vu140 then
                                local v141 = vu140:FindFirstChild("Conveyor")
                                if v141 then
                                    local vu142 = {
                                        "Controls",
                                        "Active",
                                        "Incinerator",
                                        "Magnets",
                                        "Spin",
                                        "Activate"
                                    }
                                    local function v147()
                                        local v143, v144, v145 = ipairs(vu142)
                                        while true do
                                            local v146
                                            v145, v146 = v143(v144, v145)
                                            if v145 == nil then
                                                break
                                            end
                                            if vu140:FindFirstChild(v146) then
                                                return v146
                                            end
                                        end
                                    end
                                    local v148 = vu140:FindFirstChild("ConveyorPart")
                                    if v148 then
                                        vu111(v114, CFrame.new(v148.Position) * CFrame.new(0, 2, 0)):Play()
                                    else
                                        print("NAAO TEM O CONVEYORPART")
                                    end
                                    wait(0.5)
                                    local v149 = v141.Fast.ClickDetector
                                    local v150 = v141.Enable.ClickDetector
                                    vu113(v149)
                                    if v141.Direction.Enabled.Value then
                                        vu113(v141.Direction.ClickDetector)
                                        wait(0.2)
                                        vu113(v150)
                                    else
                                        vu113(v150)
                                    end
                                    local v151 = vu140:FindFirstChild("Enable")
                                    if v151 then
                                        print("Existe Botao Rapido!")
                                        local v152 = v151.QuickButton.ClickDetector
                                        wait(0.5)
                                        vu113(v152)
                                    else
                                        print("Nao tem o Botao Rapido")
                                        local v153 = v147()
                                        if v153 then
                                            print("Elemento ativado:", v153)
                                            if v153 == "Controls" then
                                                wait(2)
                                                vu113(vu140.Controls.Enable.ClickDetector)
                                            elseif v153 == "Active" then
                                                wait(2)
                                                vu113(vu140.Active.Button.ClickDetector)
                                            elseif v153 == "Incinerator" then
                                                wait(1.5)
                                                vu113(vu140.Incinerator.Button.ClickDetector)
                                            elseif v153 == "Magnets" then
                                                wait(1.5)
                                                for _ = 1, 10 do
                                                    vu113(vu140.Left.Button.ClickDetector)
                                                    wait(1)
                                                    vu113(vu140.Right.Button.ClickDetector)
                                                    wait(1)
                                                end
                                            elseif v153 == "Spin" then
                                                wait(1.5)
                                                vu113(vu140.Spin.Enable.ClickDetector)
                                            elseif v153 == "Activate" then
                                                wait(2)
                                                vu113(vu140.Activate.Button.ClickDetector)
                                            end
                                        else
                                            print("Nenhum elemento encontrado")
                                        end
                                    end
                                else
                                    print("Conveyor Nao encontrado")
                                    v114.Velocity = v114.CFrame.lookVector * 1000
                                end
                            else
                                print("Scripted NAO ENCONTRADO")
                                local v154 = v133.Content.AlwaysPresent.Wall
                                if v154 then
                                    vu111(v114, CFrame.new(v154.Position) * CFrame.new(0, 0, 0)):Play()
                                else
                                    print("no wall")
                                end
                            end
                        end
                    end
                end
            end
            vu1.X = true
        end
        while vu1.Settings["Auto Bonus Crusher (Selected) | BETA!"] do
            if vu11.SpawnTimer.Value == 0 then
                v108()
                repeat
                    wait(0)
                until not vu1.Settings["Auto Bonus Crusher (Selected) | BETA!"] or v105()
                wait()
                if vu1.X == true then
                    vu1.X = false
                    v155()
                end
            end
            wait(0.5)
        end
    end
end)
v4:addToggle("Best Auto Farm Car (selected)", "By activating this option, you will start farming the selected car.", "big", true, function(p156)
    if p156 then
        local vu157 = workspace:WaitForChild("Crushers"):WaitForChild("Speed Crash Test"):WaitForChild("Scripted"):WaitForChild("Wall"):WaitForChild("Wall")
        local vu158 = game:GetService("Workspace").CarCollection
        local _ = vu11.PlayerGui.VehicleMenu.Menu.Background.List.Respawn.TextLabel.Text
        local v159 = vu34:getValue()
        local v160 = acharnomecarro(v159)
        local function vu164()
            if vu157 and vu11 then
                local v161 = vu158:FindFirstChild(vu11.Name).Car.Body.HitBoxes.Main
                local v162 = v161.Position + (v161.CFrame.lookVector or Vector3.new(0, 0, 1)) * 300
                local v163 = Vector3.new(v162.X, 15, v162.Z)
                vu157.Transparency = 1
                vu157.Size = Vector3.new(800, 1000, 50)
                vu157.Anchored = true
                vu157.Position = v163
            end
        end
        local function vu166()
            if vu158:FindFirstChild(vu11.Name) and UpSeatToSafe() then
                local v165 = vu158:FindFirstChild(vu11.Name).Car.Body.HitBoxes.Main
                v165.Velocity = v165.CFrame.lookVector * 1500
            end
        end
        while vu1.Settings["Best Auto Farm Car (selected)"] do
            task.wait()
            local v167 = game:GetService("Workspace").CarCollection:FindFirstChild(vu11.Name)
            if v167 then
                local v168, v169, v170 = pairs(v167:GetDescendants())
                while true do
                    local v171
                    v170, v171 = v168(v169, v170)
                    if v170 == nil then
                        break
                    end
                    if v171.Name == "Wheels" then
                        local v172, v173, v174 = pairs(v171:GetChildren())
                        while true do
                            local v175
                            v174, v175 = v172(v173, v174)
                            if v174 == nil then
                                break
                            end
                            v175:Destroy()
                        end
                    end
                end
                pcall(function()
                    vu166()
                    task.wait(0.5)
                    vu164()
                end)
                if vu11.SpawnTimer.Value == 0 then
                    if v160 then
                        vu9.rE.Vehicle.Spawning.RequestVehicleSpawn:FireServer("Dealership", v160)
                        task.wait(2)
                    else
                        vu2:SendNotification("You need to select a Car to use this option!", "ERROR!", false)
                    end
                end
            elseif v160 then
                vu9.rE.Vehicle.Spawning.RequestVehicleSpawn:FireServer("Dealership", v160)
            else
                vu2:SendNotification("You need to select a Car to use this option!", "ERROR!", false)
            end
        end
    end
end)
local v176 = vu11.PlayerGui.Dealership.Customize.Paint.Materials.Grid
local v177, v178, v179 = pairs(v176:GetChildren())
local v180 = {}
while true do
    local v181, v182 = v177(v178, v179)
    if v181 == nil then
        break
    end
    v179 = v181
    if v182:IsA("Frame") then
        table.insert(v180, v182.Name)
    end
end
local vu183 = v5:addCombo("Select Material", "select a Material for automatic change (Need Gamepass)", v180)
local vu184 = v5:addCombo("Select Car", "select a Car for automatic change (Need Gamepass)", v17)
v5:addClick("Change Material (Selected Car)", "By activating this option, you will automatically change the material of the car selection", "big", false, function(_)
    local v185 = vu184:getValue()
    local v186 = acharnomecarro(v185)
    local v187 = {}
    local v188 = {}
    local v189 = {}
    local v190 = {
        Material = vu183:getValue()
    }
    v189.Paint = v190
    v188.BodyPaint = v189
    v187[1] = v188
    v187[2] = v186
    vu9.rE.SaveCustoms:FireServer(unpack(v187))
end)
v5:addClick("Change Material (All Cars!)", "By activating this option, you will automatically change the material of the car selection", "big", false, function(_)
    local v191 = vu13
    local v192, v193, v194 = pairs(v191:GetChildren())
    while true do
        local v195
        v194, v195 = v192(v193, v194)
        if v194 == nil then
            break
        end
        local v196 = {}
        local v197 = {}
        local v198 = {}
        local v199 = {
            Material = vu183:getValue()
        }
        v198.Paint = v199
        v197.BodyPaint = v198
        v196[1] = v197
        v196[2] = v195.Name
        vu9.rE.SaveCustoms:FireServer(unpack(v196))
    end
end)
local vu200 = v6:addCombo("Select Escape Mode", "", {
    "Boat",
    "Helicopter"
})
vu1.core = true
v6:addToggle("Auto Escape Core", "", "big", false, function(p201)
    if p201 then
        local function v202()
            repeat
                wait()
            until Character() and (Character():FindFirstChild("Humanoid") and Character().Humanoid.Sit)
            spawn(function()
                wait(0.5)
                vu10:SendKeyEvent(true, "Space", false, uwu)
            end)
            if Character().Humanoid.Sit then
                return true
            end
        end
        local function v208(p203, p204, p205)
            if p203.ClassName == "ProximityPrompt" then
                local v206 = p204 or 1
                local v207 = p203.HoldDuration
                if p205 then
                    p203.HoldDuration = 0
                end
                for _ = 1, v206 do
                    p203:InputHoldBegin()
                    if not p205 then
                        wait(p203.HoldDuration)
                    end
                    p203:InputHoldEnd()
                end
                p203.HoldDuration = v207
            end
        end
        while vu1.Settings["Auto Escape Core"] do
            wait()
            local v209 = workspace:FindFirstChild("EnergyCore_Session")
            local v210 = vu200:getValue()
            if v209 then
                vu2:SendNotification("Locating the " .. v210 .. "!!", "It may take a few seconds!", true)
                wait(3)
                local v211 = v209:FindFirstChild(v210)
                if vu1.core and v211 then
                    local v212 = v211.Seats:GetChildren()
                    vu1.core = false
                    if # v212 > 0 then
                        local v213 = v212[1]
                        Character():SetPrimaryPartCFrame(v213.CFrame)
                        wait(0.5)
                        repeat
                            v208(v213.Prompt)
                        until v202()
                        repeat
                            wait()
                        until not (workspace:FindFirstChild("EnergyCore_Session") and vu1.Settings["Auto Escape Core"])
                        vu1.core = true
                    end
                end
            end
        end
    end
end)
v6:addClick("Active Core (Need Gamepass)", "", "big", false, function(_)
    local v214 = workspace.EnergyCore.ControlRoom.Enable.ClickDetector
    fireclickdetector(v214)
end)
v6:addToggle("Auto Explode Core (Need Gamepass)", "", "big", false, function(p215)
    if p215 then
        local function v216()
            return workspace.EnergyCore.ControlRoom.Screens.Energy.UI.Frame.Power.Text == "25000/25000 MWh"
        end
        while vu1.Settings["Auto Explode Core (Need Gamepass)"] do
            wait(0.5)
            local v217 = workspace.EnergyCore.ControlRoom.Glass.ClickDetector
            local v218 = workspace.EnergyCore.ControlRoom.SelfDestruct.ClickDetector
            if v216() then
                fireclickdetector(v217)
                for _ = 1, 20 do
                    wait(1)
                    fireclickdetector(v218)
                end
            end
        end
    end
end)
local vu219 = {}
local vu220 = {
    maxSpeed = nil,
    horsePower = nil,
    brakeForce = nil,
    acceleration = nil,
    steerAngle = nil,
    handling = nil,
    suspensionStiffness = nil,
    torque = nil,
    grip = nil,
    driftTuning = nil,
    downforce = nil,
    airDrag = nil
}
v7:addSlider("Max Speed Multiplier", "", 1, 250, function(p221)
    vu220.maxSpeed = p221
end)
v7:addSlider("Horse Power Multiplier", "", 1, 250, function(p222)
    vu220.horsePower = p222
end)
v7:addSlider("Brake Force Multiplier", "", 1, 250, function(p223)
    vu220.brakeForce = p223
end)
v7:addSlider("Acceleration Multiplier", "", 1, 250, function(p224)
    vu220.acceleration = p224
end)
v7:addSlider("Steer Angle Multiplier", "", 1, 100, function(p225)
    vu220.steerAngle = p225
end)
v7:addSlider("Handling Multiplier", "", 1, 100, function(p226)
    vu220.handling = p226
end)
v7:addSlider("Suspension Stiffness Multiplier", "", 1, 100, function(p227)
    vu220.suspensionStiffness = p227
end)
v7:addSlider("Torque Multiplier", "", 1, 250, function(p228)
    vu220.torque = p228
end)
v7:addSlider("Grip Multiplier", "", 1, 100, function(p229)
    vu220.grip = p229
end)
v7:addSlider("Drift Tuning Multiplier", "", 1, 10, function(p230)
    vu220.driftTuning = p230
end)
v7:addSlider("Downforce Multiplier", "", 1, 100, function(p231)
    vu220.downforce = p231
end)
v7:addSlider("Air Drag Multiplier", "", 1, 100, function(p232)
    vu220.airDrag = p232
end)
local vu233 = v7:addCombo("Transmission Mode", "", {
    "RWD",
    "FWD",
    "AWD"
})
v7:addClick("Apply Modifiers to Car", "", "big", false, function(_)
    local v234 = require(workspace.CarCollection[vu11.Name].Car.Body.Configuration)
    vu219 = table.clone(v234)
    if vu220.maxSpeed then
        v234.TopSpeed = v234.TopSpeed * vu220.maxSpeed
    end
    if vu220.horsePower then
        v234.Horsepower = v234.Horsepower * vu220.horsePower
    end
    if vu220.brakeForce then
        v234.BrakeForce = v234.BrakeForce * vu220.brakeForce
    end
    if vu220.acceleration then
        v234.Acceleration = v234.Acceleration * vu220.acceleration
    end
    if vu220.steerAngle then
        v234.SteerAngle = v234.SteerAngle * vu220.steerAngle
    end
    if vu220.handling then
        v234.Handling = v234.Handling * vu220.handling
    end
    if vu220.suspensionStiffness then
        v234.SusStiffness = v234.SusStiffness * vu220.suspensionStiffness
    end
    if vu220.grip then
        v234.RearGripDrift = v234.RearGripDrift * vu220.grip
        v234.DriftSlide = v234.DriftSlide * vu220.grip
    end
    if vu220.driftTuning then
        v234.DriftSlide = v234.DriftSlide * vu220.driftTuning
    end
    if vu220.downforce then
        v234.Downforce = v234.Downforce and v234.Downforce * vu220.downforce or vu220.downforce
    end
    if vu220.airDrag then
        v234.AirDrag = v234.AirDrag and v234.AirDrag * vu220.airDrag or vu220.airDrag
    end
    local v235 = vu233:getValue()
    if v235 then
        v234.Config = v235
    end
end)
v7:addClick("Reset Modifiers Car", "", "big", false, function(_)
    local v236 = require(workspace.CarCollection[vu11.Name].Car.Body.Configuration)
    local v237, v238, v239 = pairs(vu219)
    while true do
        local v240
        v239, v240 = v237(v238, v239)
        if v239 == nil then
            break
        end
        v236[v239] = v240
    end
end)