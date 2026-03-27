-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))():start("Be NPC or Die!", "2.0", true):addTab("Auto Farms")
local vu3 = game:GetService("ReplicatedStorage")
game:GetService("Players")
game:GetService("PathfindingService")
function TeleportTo(p4)
    local v5 = game:GetService("Players").LocalPlayer;
    (v5.Character or v5.CharacterAdded:Wait()):SetPrimaryPartCFrame(p4 * CFrame.new(0, 0, 0))
    return true
end
function fireproximityprompt(p6, p7, p8)
    if p6.ClassName == "ProximityPrompt" then
        local v9 = p7 or 1
        local v10 = p6.HoldDuration
        if p8 then
            p6.HoldDuration = 0
        end
        for _ = 1, v9 do
            p6:InputHoldBegin()
            if not p8 then
                wait(p6.HoldDuration)
            end
            p6:InputHoldEnd()
        end
        p6.HoldDuration = v10
    end
end
v2:addToggle("Auto Collect Money (Safe)", "", "big", false, function(p11)
    if p11 then
        local v12 = game:GetService("Players").LocalPlayer
        local v13 = v12.Character or v12.CharacterAdded:Wait()
        local vu14 = v13:WaitForChild("Humanoid")
        local vu15 = v13:WaitForChild("HumanoidRootPart")
        local vu16 = workspace:WaitForChild("CollectableItems")
        local function v25(pu17)
            local vu18 = game:GetService("PathfindingService"):CreatePath({
                AgentRadius = 2,
                AgentHeight = 5,
                AgentCanJump = false,
                AgentJumpHeight = 0,
                AgentMaxSlope = 45
            })
            local v19, _ = pcall(function()
                vu18:ComputeAsync(vu15.Position, pu17.Position)
            end)
            if v19 and vu18.Status == Enum.PathStatus.Success then
                local v20 = vu18
                local v21, v22, v23 = ipairs(vu18.GetWaypoints(v20))
                while true do
                    local v24
                    v23, v24 = v21(v22, v23)
                    if v23 == nil then
                        break
                    end
                    vu14:MoveTo(v24.Position)
                    vu14.MoveToFinished:Wait()
                end
            end
        end
        local function v34()
            local v26 = math.huge
            local v27 = vu16
            local v28, v29, v30 = ipairs(v27:GetChildren())
            local v31 = nil
            while true do
                local v32
                v30, v32 = v28(v29, v30)
                if v30 == nil then
                    break
                end
                local v33 = (vu15.Position - v32.Position).Magnitude
                if v33 < v26 then
                    v31 = v32
                    v26 = v33
                end
            end
            return v31
        end
        while vu1.Settings["Auto Collect Money (Safe)"] do
            task.wait()
            local v35 = v34()
            if v35 then
                v25(v35)
            end
        end
    end
end)
v2:addToggle("Inf Stamina", "", "big", false, function(pu36)
    if pu36 then
        local v37 = getrawmetatable(game)
        make_writeable(v37)
        local vu38 = v37.__index
        function v37.__index(p39, p40)
            if tostring(p39) ~= "Stamina" or tostring(p40) ~= "Value" then
                return vu38(p39, p40)
            else
                return not pu36 and 6 or math.huge
            end
        end
    end
end)
v2:addToggle("Esp Players", "", "big", false, function(p41)
    if p41 then
        while vu1.Settings["Esp Players"] do
            wait()
            local v42, v43, v44 = ipairs(game.Players:GetPlayers())
            while true do
                local v45
                v44, v45 = v42(v43, v44)
                if v44 == nil then
                    break
                end
                local v46 = workspace:FindFirstChild(v45.Name)
                if v46 then
                    local v47 = v46:FindFirstChild("HumanoidRootPart")
                    if v47 and v46:FindFirstChild("PlayerProximityPrompt") then
                        local v48 = v47:FindFirstChild("ESP")
                        if not v48 then
                            v48 = Instance.new("BillboardGui")
                            v48.Name = "ESP"
                            v48.Adornee = v47
                            v48.Size = UDim2.new(4, 0, 6, 0)
                            v48.StudsOffset = Vector3.new(0, 3, 0)
                            v48.AlwaysOnTop = true
                            local v49 = Instance.new("Frame")
                            v49.Size = UDim2.new(1, 0, 1, 0)
                            v49.BackgroundTransparency = 1
                            v49.BorderSizePixel = 1
                            v49.Parent = v48
                            local v50 = Instance.new("Frame")
                            v50.Size = UDim2.new(1, 0, 1, 0)
                            v50.Name = "Frame2"
                            v50.BackgroundTransparency = 1
                            v50.Position = UDim2.new(0, 0, 0.4, 0)
                            v50.BorderSizePixel = 1
                            v50.Parent = v49
                            local v51 = Instance.new("UIStroke")
                            v51.Name = "Stroke"
                            v51.Thickness = 2.3
                            v51.Parent = v50
                            local v52 = Instance.new("ImageLabel")
                            v52.Size = UDim2.new(0.8, 0, 0.8, 0)
                            v52.Position = UDim2.new(0.1, 0, 0.1, 0)
                            v52.BackgroundTransparency = 1
                            v52.Image = "rbxassetid://6031090990"
                            v52.Parent = v49
                            local v53 = Instance.new("TextLabel")
                            v53.Size = UDim2.new(1, 0, 0.2, 0)
                            v53.Position = UDim2.new(0, 0, 0, 0)
                            v53.BackgroundTransparency = 1
                            v53.TextColor3 = Color3.new(1, 1, 1)
                            v53.TextScaled = true
                            v53.Font = Enum.Font.GothamBold
                            v53.Parent = v49
                            v48.Parent = v47
                        end
                        local v54 = v48.Frame.ImageLabel
                        local v55 = v48.Frame.TextLabel
                        local v56 = v48.Frame.Frame2.Stroke
                        if v46:FindFirstChild("GunSource") then
                            v54.ImageColor3 = Color3.new(0, 0, 1)
                            v56.Color = Color3.new(0, 0, 1)
                            v55.Text = "Sheriff: " .. v45.Name
                        else
                            v54.ImageColor3 = Color3.new(1, 0, 0)
                            v56.Color = Color3.new(1, 0, 0)
                            v55.Text = "Criminal: " .. v45.Name
                        end
                    end
                end
            end
        end
        local v57, v58, v59 = ipairs(game.Players:GetPlayers())
        while true do
            local v60
            v59, v60 = v57(v58, v59)
            if v59 == nil then
                break
            end
            local v61 = workspace:FindFirstChild(v60.Name)
            if v61 then
                local v62, v63, v64 = ipairs(v61:GetDescendants())
                while true do
                    local v65
                    v64, v65 = v62(v63, v64)
                    if v64 == nil then
                        break
                    end
                    if v65:IsA("BillboardGui") and v65.Name == "ESP" then
                        v65:Destroy()
                    end
                end
            end
        end
    end
end)
v2:addToggle("Auto Task", "", "big", false, function(p66)
    if p66 then
        while vu1.Settings["Auto Task"] do
            wait()
            local v67 = game:GetService("Players").LocalPlayer
            local vu68 = v67.Character or v67.CharacterAdded:Wait()
            local vu69 = vu3.Maps
            local vu70 = nil
            pcall(function()
                local v71 = vu69
                local v72, v73, v74 = pairs(v71:GetChildren())
                while true do
                    local v75
                    v74, v75 = v72(v73, v74)
                    if v74 == nil then
                        break
                    end
                    local v76 = workspace:FindFirstChild(v75.Name)
                    if v76 then
                        vu70 = v76
                        break
                    end
                end
                local v77 = vu70 and vu70:FindFirstChild("Tasks")
                if v77 then
                    local v78 = vu68:GetAttribute("TaskName")
                    local v79 = v78 and v77:FindFirstChild(v78)
                    if v79 then
                        print(v78)
                        local v80 = v79:FindFirstChild("ProximityPrompt")
                        if v80 then
                            v80.HoldDuration = 0
                            v80.MaxActivationDistance = 100000
                            v80.RequiresLineOfSight = false
                            v80.Parent = vu68
                            local v81 = tick()
                            local v82 = 15
                            repeat
                                wait(0.5)
                                fireproximityprompt(v80)
                            until vu68:GetAttribute("TaskName") ~= v78 or v82 < tick() - v81
                        end
                    end
                end
            end)
        end
    end
end)
v2:addToggle("Auto Kill (Sheriff)", "", "big", true, function(p83)
    if p83 then
        while vu1.Settings["Auto Kill (Sheriff)"] do
            wait(1)
            local v84 = game:GetService("Players")
            local vu85 = v84.LocalPlayer
            local vu86 = vu85.Character or vu85.CharacterAdded:Wait()
            local function v92(p87)
                if vu86:FindFirstChild("HumanoidRootPart") then
                    local v88 = p87.Position + Vector3.new(math.random(- 5, 5), 0, math.random(- 5, 5)) + Vector3.new(0, 2, 0)
                    local v89 = {
                        v88,
                        (p87.Position - v88).Unit,
                        p87,
                        p87.Position
                    }
                    local v90 = vu86:FindFirstChild("GunSource") or vu85.Backpack:FindFirstChild("GunSource")
                    if v90 then
                        if not vu86:FindFirstChild("GunSource") and vu85.Backpack:FindFirstChild("GunSource") then
                            vu85.Backpack.GunSource.Parent = vu86
                        end
                        local v91 = v90:FindFirstChild("Events")
                        if v91 then
                            v91 = v90.Events:FindFirstChild("Fire")
                        end
                        if v91 then
                            v91:FireServer(unpack(v89))
                        end
                    end
                end
            end
            if vu85.Character:FindFirstChild("GunSource") or vu85.Backpack:FindFirstChild("GunSource") then
                local v93, v94, v95 = ipairs(v84:GetPlayers())
                while true do
                    local v96
                    v95, v96 = v93(v94, v95)
                    if v95 == nil or not vu1.Settings["Auto Kill (Sheriff)"] then
                        break
                    end
                    if v96 ~= vu85 then
                        local v97 = workspace:FindFirstChild(v96.Name)
                        if v97 then
                            local v98 = v97:FindFirstChild("HumanoidRootPart")
                            if v98 and (v97:FindFirstChild("PlayerProximityPrompt") and (v97:FindFirstChild("Task") and not v97:FindFirstChild("GunSource"))) then
                                v92(v98)
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end)
v2:addToggle("Auto Play (Safe)", "", "big", true, function(p99)
    if p99 then
        local v100 = game:GetService("Players")
        local vu101 = game:GetService("PathfindingService")
        local vu102 = false
        local vu103 = false
        while vu1.Settings["Auto Play (Safe)"] do
            task.wait()
            local v104 = game:GetService("Players").LocalPlayer
            local v105 = v104.Character or v104:WaitForChild("Character")
            local vu106 = vu3.Maps
            local vu107 = nil
            pcall(function()
                local v108 = vu106
                local v109, v110, v111 = pairs(v108:GetChildren())
                while true do
                    local v112
                    v111, v112 = v109(v110, v111)
                    if v111 == nil then
                        break
                    end
                    local v113 = workspace:FindFirstChild(v112.Name)
                    if v113 then
                        vu107 = v113
                        break
                    end
                end
            end)
            if vu107 then
                if v105:FindFirstChild("Task") then
                    wait()
                    local _ = v100.LocalPlayer
                    local vu114 = v104.Character or v104.CharacterAdded:Wait()
                    local v115 = vu114
                    local vu116 = vu114.WaitForChild(v115, "Humanoid")
                    local v117 = vu114
                    local vu118 = vu114.WaitForChild(v117, "HumanoidRootPart")
                    local vu119 = vu3.Maps
                    local vu120 = nil
                    pcall(function()
                        local function vu121()
                            task.wait(math.random(1, 3) * 0.1)
                        end
                        local function vu131()
                            local v122 = vu120.Walkways:GetChildren()
                            if # v122 ~= 0 then
                                local v123 = v122[math.random(1, # v122)]
                                if v123:IsA("BasePart") then
                                    local v124 = vu101:CreatePath({
                                        AgentRadius = 2,
                                        AgentHeight = 5,
                                        AgentCanJump = false,
                                        AgentJumpHeight = 0,
                                        AgentMaxSlope = 45
                                    })
                                    v124:ComputeAsync(vu118.Position, v123.Position)
                                    if v124.Status ~= Enum.PathStatus.Success then
                                        vu131()
                                    else
                                        local v125 = v124:GetWaypoints()
                                        local v126 = math.random(1, 2) == 1
                                        local v127, v128, v129 = pairs(v125)
                                        while true do
                                            local v130
                                            v129, v130 = v127(v128, v129)
                                            if v129 == nil or not vu1.Settings["Auto Play (Safe)"] then
                                                break
                                            end
                                            if v126 then
                                                vu121()
                                            end
                                            vu116:MoveTo(v130.Position)
                                            vu116.MoveToFinished:Wait()
                                        end
                                        vu131()
                                    end
                                else
                                    vu131()
                                end
                            else
                                return
                            end
                        end
                        spawn(function()
                            if vu116 and vu118 then
                                if vu114:GetAttribute("TaskName") then
                                    if not vu103 then
                                        vu103 = true
                                        vu131()
                                    end
                                else
                                    vu103 = false
                                end
                            end
                        end)
                        local v132 = vu119
                        local v133, v134, v135 = pairs(v132:GetChildren())
                        while true do
                            local v136
                            v135, v136 = v133(v134, v135)
                            if v135 == nil then
                                break
                            end
                            local v137 = workspace:FindFirstChild(v136.Name)
                            if v137 then
                                vu120 = v137
                                break
                            end
                        end
                        local v138 = vu120 and vu120:FindFirstChild("Tasks")
                        if v138 then
                            local v139 = vu114:GetAttribute("TaskName")
                            local v140 = v139 and v138:FindFirstChild(v139)
                            if v140 then
                                print(v139)
                                local v141 = v140:FindFirstChild("ProximityPrompt")
                                if v141 then
                                    v141.HoldDuration = 0
                                    v141.MaxActivationDistance = 100000
                                    v141.RequiresLineOfSight = false
                                    v141.Parent = vu114
                                    local v142 = tick()
                                    local v143 = 15
                                    repeat
                                        wait(0.5)
                                        fireproximityprompt(v141)
                                    until vu114:GetAttribute("TaskName") ~= v139 or (v143 < tick() - v142 or not vu1.Settings["Auto Play (Safe)"])
                                end
                            end
                        end
                    end)
                else
                    wait(1)
                    local v144 = game:GetService("Players")
                    local vu145 = v144.LocalPlayer
                    local vu146 = vu145.Character or vu145.CharacterAdded:Wait()
                    local function v166(pu147)
                        vu102 = false
                        local v148 = vu146:FindFirstChildOfClass("Humanoid")
                        local vu149 = vu146:FindFirstChild("HumanoidRootPart")
                        if v148 and vu149 then
                            while not vu102 do
                                local vu150 = false
                                local function v151()
                                    vu150 = true
                                end
                                if pu147 and pu147:IsA("BasePart") then
                                    if (vu149.Position - pu147.Position).Magnitude >= 5 then
                                        local vu152 = vu101:CreatePath({
                                            AgentRadius = 2,
                                            AgentHeight = 5,
                                            AgentCanJump = true,
                                            AgentCanClimb = true
                                        })
                                        local v153, v154 = pcall(function()
                                            vu152:ComputeAsync(vu149.Position, pu147.Position)
                                        end)
                                        if v153 and vu152.Status == Enum.PathStatus.Success then
                                            local v155 = vu152
                                            local v156 = vu152.GetWaypoints(v155)
                                            local v157, v158, v159 = ipairs(v156)
                                            while true do
                                                local v160
                                                v159, v160 = v157(v158, v159)
                                                if v159 == nil or vu102 then
                                                    break
                                                end
                                                if v159 > 1 then
                                                    v148:MoveTo(v160.Position)
                                                    local v161 = tick()
                                                    local vu162 = false
                                                    local vu163 = nil
                                                    vu163 = v148.MoveToFinished:Connect(function(p164)
                                                        vu162 = p164
                                                        if vu163 then
                                                            vu163:Disconnect()
                                                        end
                                                    end)
                                                    local v165 = vu163
                                                    while not vu162 and tick() - v161 < 2 do
                                                        if (vu149.Position - pu147.Position).Magnitude < 5 then
                                                            if v165 then
                                                                v165:Disconnect()
                                                            end
                                                            return true
                                                        end
                                                        wait(0.1)
                                                    end
                                                    if v165 then
                                                        v165:Disconnect()
                                                    end
                                                    if (v160.Position - pu147.Position).Magnitude > 10 then
                                                        v151()
                                                    end
                                                end
                                            end
                                            wait(0.2)
                                        else
                                            warn("Falha ao calcular o caminho: " .. (v154 or tostring(vu152.Status)))
                                            v148:MoveTo(pu147.Position)
                                            wait(1)
                                        end
                                    else
                                        v148:MoveTo(vu149.Position)
                                        wait(0.5)
                                    end
                                else
                                    warn("O HumanoidRootPart do alvo n\195\163o \195\169 v\195\161lido.")
                                end
                                if vu150 then
                                    break
                                end
                            end
                            return false
                        end
                        warn("Erro: Humanoid ou RootPart n\195\163o encontrado!")
                    end
                    local function v172(p167)
                        if vu146:FindFirstChild("HumanoidRootPart") then
                            local v168 = p167.Position + Vector3.new(math.random(- 5, 5), 0, math.random(- 5, 5)) + Vector3.new(0, 2, 0)
                            local v169 = {
                                v168,
                                (p167.Position - v168).Unit,
                                p167,
                                p167.Position
                            }
                            local v170 = vu146:FindFirstChild("GunSource") or vu145.Backpack:FindFirstChild("GunSource")
                            if v170 then
                                if not vu146:FindFirstChild("GunSource") and vu145.Backpack:FindFirstChild("GunSource") then
                                    vu145.Backpack.GunSource.Parent = vu146
                                end
                                local v171 = v170:FindFirstChild("Events")
                                if v171 then
                                    v171 = v170.Events:FindFirstChild("Fire")
                                end
                                if v171 then
                                    v171:FireServer(unpack(v169))
                                end
                                vu102 = false
                            end
                        end
                    end
                    if vu145.Character:FindFirstChild("GunSource") or vu145.Backpack:FindFirstChild("GunSource") then
                        local v173, v174, v175 = pairs(v144:GetPlayers())
                        while true do
                            local v176
                            v175, v176 = v173(v174, v175)
                            if v175 == nil or not vu1.Settings["Auto Play (Safe)"] then
                                break
                            end
                            if v176 ~= vu145 then
                                local v177 = workspace:FindFirstChild(v176.Name)
                                if v177 then
                                    local v178 = v177:FindFirstChild("HumanoidRootPart")
                                    if v178 and (v177:FindFirstChild("PlayerProximityPrompt") and (v177:FindFirstChild("Task") and not v177:FindFirstChild("GunSource"))) then
                                        if v166(v178) then
                                            local v179 = true
                                            v172(v178)
                                            vu102 = v179
                                        end
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)