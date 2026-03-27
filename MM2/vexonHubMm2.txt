local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/Dr.Ray-VexonHub"))()
v1:Load("VexonHub", "http://www.roblox.com/asset/?id=84519376661277")
game:GetService("CoreGui").DrRay.TopBar.BackgroundColor3 = Color3.new(0, 0, 0)
game:GetService("CoreGui").DrRay.MainBar.BackgroundColor3 = Color3.new(0, 0, 0)
game:GetService("CoreGui").DrRay.TopBar.TopBar.BackgroundColor3 = Color3.new(0, 0, 0)
game:GetService("CoreGui").DrRay.TopBar.ProfileMenu.Clock.BackgroundTransparency = 0.5
game:GetService("CoreGui").DrRay.TopBar.ProfileMenu.PlayerProfile.BackgroundTransparency = 0.5
game:GetService("CoreGui").DrRay.TopBar.ProfileMenu.Title.BackgroundTransparency = 0.5
game:GetService("CoreGui").DrRay.TopBar.TopBarClose.BackgroundTransparency = 0.55
game:GetService("CoreGui").DrRay.TopBar.TopBarClose.idk.Visible = false
local vu2 = game.Players.LocalPlayer
local function vu8()
    if vu2 and vu2.Character and vu2.Character:FindFirstChild("Humanoid") then
        vu2.Character.Animate.Disabled = false
        local v3 = vu2.Character.Humanoid:GetPlayingAnimationTracks()
        local v4, v5, v6 = pairs(v3)
        while true do
            local v7
            v6, v7 = v4(v5, v6)
            if v6 == nil then
                break
            end
            v7:Stop()
        end
    end
end
function getMap()
    local v9, v10, v11 = ipairs(workspace:GetChildren())
    while true do
        local v12
        v11, v12 = v9(v10, v11)
        if v11 == nil then
            break
        end
        if v12:FindFirstChild("CoinContainer") and v12:FindFirstChild("Spawns") then
            return v12
        end
    end
    return nil
end
local function vu17()
    local v13, v14, v15 = ipairs(game.Players:GetPlayers())
    while true do
        local v16
        v15, v16 = v13(v14, v15)
        if v15 == nil then
            break
        end
        if v16.Character and v16.Backpack and (v16.Character:FindFirstChild("Knife") or v16.Backpack:FindFirstChild("Knife")) then
            return v16
        end
    end
    return nil
end
loadstring(game:HttpGet("https://pastefy.app/hcVkWhQF/raw"))()
local v18 = v1.newTab("Main", "http://www.roblox.com/asset/?id=9405923687")
v18.newButton("Copy Discord Link", "Join Dc For Free Bobuc :0", function()
    loadstring(game:HttpGet("https://pastefy.app/XBYwIrZH/raw"))()
end)
v18.newLabel("Murder")
v18.newToggle("Auto Kill All", "If you are a murderer, it will automatically kill everyone. ", false, function(p19)
    if p19 then
        if vu17() ~= localplayer then
            CoreGui:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "You Are Not Murder...",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            return
        end
        if not localplayer.Character:FindFirstChild("Knife") then
            local v20 = localplayer.Character:FindFirstChild("Humanoid")
            if not localplayer.Backpack:FindFirstChild("Knife") then
                CoreGui:SetCore("SendNotification", {
                    Title = "VexonHub",
                    Text = "You don\'t have the knife..?",
                    Icon = "http://www.roblox.com/asset/?id=84519376661277",
                    Duration = 5
                })
                return
            end
            v20:EquipTool(localplayer.Backpack:FindFirstChild("Knife"))
        end
        local v21, v22, v23 = ipairs(game.Players:GetPlayers())
        local vu24 = {}
        while true do
            local v25
            v23, v25 = v21(v22, v23)
            if v23 == nil then
                break
            end
            if v25.Character and (v25.Character:FindFirstChild("HumanoidRootPart") and v25 ~= localplayer) then
                local v26 = v25.Character:FindFirstChild("HumanoidRootPart")
                v26.Anchored = true
                table.insert(vu24, v26)
                v26.CFrame = localplayer.Character:FindFirstChild("HumanoidRootPart").CFrame + localplayer.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 1
            end
        end
        localplayer.Character.Knife.Stab:FireServer(unpack({
            "Slash"
        }))
        task.delay(2, function()
            local v27, v28, v29 = ipairs(vu24)
            while true do
                local v30
                v29, v30 = v27(v28, v29)
                if v29 == nil then
                    break
                end
                if v30 and v30.Parent then
                    v30.Anchored = false
                end
            end
        end)
    end
end)
v18.newToggle("Auto Kill Sheriff", "If you are a murderer, it will automatically kill sheriff.", false, function(p31)
    if p31 then
        if vu17() ~= localplayer then
            CoreGui:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "You Are Not Murder...",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            return
        end
        if not localplayer.Character:FindFirstChild("Knife") then
            local v32 = localplayer.Character:FindFirstChild("Humanoid")
            if not localplayer.Backpack:FindFirstChild("Knife") then
                CoreGui:SetCore("SendNotification", {
                    Title = "VexonHub",
                    Text = "You don\'t have the knife..?",
                    Icon = "http://www.roblox.com/asset/?id=84519376661277",
                    Duration = 5
                })
                return
            end
            v32:EquipTool(localplayer.Backpack:FindFirstChild("Knife"))
        end
        local v33, v34, v35 = ipairs(game.Players:GetPlayers())
        local v36 = nil
        while true do
            local v37
            v35, v37 = v33(v34, v35)
            if v35 == nil then
                v37 = v36
                break
            end
            if v37 ~= localplayer and v37.Character and ((v37.Backpack:FindFirstChild("Gun") or v37.Character:FindFirstChild("Gun")) and v37.Character:FindFirstChild("HumanoidRootPart")) then
                break
            end
        end
        if not v37 then
            CoreGui:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "Sheriff Not Found...",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            return
        end
        local vu38 = v37.Character:FindFirstChild("HumanoidRootPart")
        if vu38 then
            vu38.Anchored = true
            vu38.CFrame = localplayer.Character:FindFirstChild("HumanoidRootPart").CFrame + localplayer.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 1
            localplayer.Character.Knife.Stab:FireServer(unpack({
                "Slash"
            }))
            task.delay(2, function()
                if vu38 and vu38.Parent then
                    vu38.Anchored = false
                end
            end)
        end
    end
end)
v18.newToggle("Auto Kill Innocents", "If you are a murderer, it will automatically kill innocents.", false, function(p39)
    if p39 then
        if vu17() ~= localplayer then
            CoreGui:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "You\'re not murderer...",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            return
        end
        if not localplayer.Character:FindFirstChild("Knife") then
            local v40 = localplayer.Character:FindFirstChild("Humanoid")
            if not localplayer.Backpack:FindFirstChild("Knife") then
                CoreGui:SetCore("SendNotification", {
                    Title = "VexonHub",
                    Text = "You don\'t have the knife..?",
                    Icon = "http://www.roblox.com/asset/?id=84519376661277",
                    Duration = 5
                })
                return
            end
            v40:EquipTool(localplayer.Backpack:FindFirstChild("Knife"))
        end
        local v41, v42, v43 = ipairs(game.Players:GetPlayers())
        local vu44 = {}
        while true do
            local v45
            v43, v45 = v41(v42, v43)
            if v43 == nil then
                break
            end
            if v45 ~= localplayer and v45.Character and v45.Character:FindFirstChild("HumanoidRootPart") and not (v45.Backpack:FindFirstChild("Gun") or v45.Character:FindFirstChild("Gun")) then
                table.insert(vu44, v45.Character:FindFirstChild("HumanoidRootPart"))
            end
        end
        if # vu44 == 0 then
            CoreGui:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "Innocent Not Found?",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            return
        end
        local v46, v47, v48 = ipairs(vu44)
        while true do
            local v49
            v48, v49 = v46(v47, v48)
            if v48 == nil then
                break
            end
            v49.Anchored = true
            v49.CFrame = localplayer.Character:FindFirstChild("HumanoidRootPart").CFrame + localplayer.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 1
        end
        localplayer.Character.Knife.Stab:FireServer(unpack({
            "Slash"
        }))
        task.delay(2, function()
            local v50, v51, v52 = ipairs(vu44)
            while true do
                local v53
                v52, v53 = v50(v51, v52)
                if v52 == nil then
                    break
                end
                if v53 and v53.Parent then
                    v53.Anchored = false
                end
            end
        end)
    end
end)
v18.newInput("Kill Player", "If you are a murderer its Kills the Chosen Player ", function(p54)
    local v55 = p54:lower()
    local v56, v57, v58 = ipairs(game.Players:GetPlayers())
    local v59 = nil
    while true do
        local v60
        v58, v60 = v56(v57, v58)
        if v58 == nil then
            v60 = v59
            break
        end
        if v60 ~= localplayer then
            local v61 = v60.Name:lower()
            local v62 = v60.DisplayName:lower()
            if v61:find(v55) or v62:find(v55) then
                break
            end
        end
    end
    if v60 then
        if vu17() == localplayer then
            if not localplayer.Character:FindFirstChild("Knife") then
                local v63 = localplayer.Character:FindFirstChild("Humanoid")
                if not localplayer.Backpack:FindFirstChild("Knife") then
                    CoreGui:SetCore("SendNotification", {
                        Title = "VexonHub",
                        Text = "You don\'t have the knife..?",
                        Icon = "http://www.roblox.com/asset/?id=84519376661277",
                        Duration = 5
                    })
                    return
                end
                v63:EquipTool(localplayer.Backpack:FindFirstChild("Knife"))
            end
            local vu64 = v60.Character
            if vu64 then
                vu64 = v60.Character:FindFirstChild("HumanoidRootPart")
            end
            if vu64 then
                vu64.Anchored = true
                vu64.CFrame = localplayer.Character:FindFirstChild("HumanoidRootPart").CFrame + localplayer.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 1
                localplayer.Character.Knife.Stab:FireServer(unpack({
                    "Slash"
                }))
                task.delay(2, function()
                    if vu64 and vu64.Parent then
                        vu64.Anchored = false
                    end
                end)
            else
                CoreGui:SetCore("SendNotification", {
                    Title = "VexonHub",
                    Text = "Error",
                    Icon = "http://www.roblox.com/asset/?id=84519376661277",
                    Duration = 5
                })
            end
        else
            CoreGui:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "You\'re Not Murder...",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
        end
    else
        CoreGui:SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "Player Not Found...",
            Icon = "http://www.roblox.com/asset/?id=84519376661277",
            Duration = 5
        })
        return
    end
end)
local vu65 = game.Players.LocalPlayer
local vu66 = nil
local vu67 = 7
local vu68 = 60
v18.newToggle("Kill Aura", "Automatically Kills Nearby People", false, function(p69)
    if p69 then
        vu66 = game:GetService("RunService").Heartbeat:Connect(function()
            local v70 = vu65.Character
            local v71
            if v70 then
                v71 = v70:FindFirstChild("HumanoidRootPart")
            else
                v71 = v70
            end
            local v72
            if v70 then
                v72 = v70:FindFirstChild("Knife")
            else
                v72 = v70
            end
            if v70 and (v71 and (v72 and v72:FindFirstChild("Stab"))) then
                local v73 = vu67
                local v74 = vu68
                local v75, v76, v77 = ipairs(game.Players:GetPlayers())
                while true do
                    local v78
                    v77, v78 = v75(v76, v77)
                    if v77 == nil then
                        break
                    end
                    if v78 ~= vu65 and v78.Character and v78.Character:FindFirstChild("HumanoidRootPart") then
                        local v79 = v78.Character
                        local v80 = v79.HumanoidRootPart
                        local v81 = v79:FindFirstChild("Humanoid")
                        if v80 and (v81 and v81.Health > 0) then
                            local v82 = (v80.Position - v71.Position).Magnitude
                            local v83 = (v80.Position - v71.Position).Unit:Dot(v71.CFrame.LookVector)
                            local v84 = math.acos(math.clamp(v83, - 1, 1))
                            local v85 = math.deg(v84)
                            if v82 < v73 and v85 < v74 / 2 then
                                v80.Anchored = true
                                v80.CFrame = v71.CFrame + v71.CFrame.LookVector * 2
                                task.wait(0.1)
                                v72.Stab:FireServer(unpack({
                                    "Slash"
                                }))
                                task.wait(0.1)
                                v80.Anchored = false
                            end
                        end
                    end
                end
            end
        end)
    elseif vu66 then
        vu66:Disconnect()
        vu66 = nil
    end
end)
v18.newSlider("Reach", "attack distance", 0, 30, vu67, true, function(p86)
    vu67 = p86
end)
v18.newSlider("Angle", "Angle", 0, 360, vu68, true, function(p87)
    vu68 = p87
end)
v18.newLabel("Sheriff")
local vu88 = game:GetService("Players")
local vu89 = game:GetService("RunService")
local vu90 = vu88.LocalPlayer
local vu91 = false
local vu92 = nil
local function vu100()
    local v93 = vu88
    local v94, v95, v96 = ipairs(v93:GetPlayers())
    while true do
        local v97
        v96, v97 = v94(v95, v96)
        if v96 == nil then
            break
        end
        if v97 ~= vu90 then
            local v98 = v97:FindFirstChild("Backpack")
            local v99 = v97.Character
            if v98 and v98:FindFirstChild("Knife") or v99 and v99:FindFirstChild("Knife") then
                return v97
            end
        end
    end
    return nil
end
local function vu104(p101, p102)
    local v103 = p101.Character
    if v103 then
        v103 = p101.Character:FindFirstChild("HumanoidRootPart")
    end
    if v103 and v103.Velocity then
        return v103.Position + v103.Velocity * 0.125 + p102
    else
        return v103 and v103.Position or Vector3.zero
    end
end
v18.newToggle("AimBot Cam Murder", "Sadece hedefi ni\197\159anlar, otomatik ate\197\159 etmez", false, function(p105)
    vu91 = p105
    if vu91 then
        vu92 = vu89.RenderStepped:Connect(function()
            local v106 = vu100()
            if v106 and vu90.Character then
                local v107 = vu104(v106, Vector3.new(0, 0, 0))
                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, v107)
            end
        end)
    elseif vu92 then
        vu92:Disconnect()
        vu92 = nil
    end
end)
local vu108 = game:GetService("Players")
local vu109 = game:GetService("RunService")
local vu110 = game:GetService("UserInputService")
game:GetService("ContextActionService")
local vu111 = vu108.LocalPlayer
_G.GunAimbotArgs = nil
local vu112 = false
local vu113 = nil
local vu114 = nil
v18.newToggle("Gun Aimbot", "Auto Aims To Murderer", false, function(p115)
    vu112 = p115
    if p115 then
        vu113 = vu109.RenderStepped:Connect(function()
            local v116 = vu108
            local v117, v118, v119 = ipairs(v116:GetPlayers())
            local v120 = nil
            while true do
                local v121
                v119, v121 = v117(v118, v119)
                if v119 == nil then
                    v121 = v120
                    break
                end
                if v121 ~= vu111 then
                    local v122 = v121:FindFirstChild("Backpack")
                    local v123 = v121.Character
                    if v122 and v122:FindFirstChild("Knife") or v123 and v123:FindFirstChild("Knife") then
                        break
                    end
                end
            end
            if v121 and v121.Character and v121.Character:FindFirstChild("HumanoidRootPart") then
                local v124 = v121.Character.HumanoidRootPart
                local v125 = {
                    1,
                    v124.Position + v124.Velocity * 0.125,
                    "AH2"
                }
                _G.GunAimbotArgs = v125
            else
                _G.GunAimbotArgs = nil
            end
        end)
        local function vu127()
            local vu126 = vu111.Character
            if vu126 then
                vu126 = vu111.Character:FindFirstChild("Gun")
            end
            if vu126 and _G.GunAimbotArgs then
                pcall(function()
                    vu126.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(unpack(_G.GunAimbotArgs))
                end)
            end
        end
        vu110.InputBegan:Connect(function(p128, p129)
            if not p129 then
                if p128.UserInputType == Enum.UserInputType.MouseButton1 then
                    vu127()
                end
            end
        end)
        vu114 = vu110.TouchTap:Connect(function()
            vu127()
        end)
    else
        if vu113 then
            vu113:Disconnect()
            vu113 = nil
        end
        if vu114 then
            vu114:Disconnect()
            vu114 = nil
        end
        _G.GunAimbotArgs = nil
    end
end)
v18.newLabel("Innocent")
v18.newButton("Gun TP", "Take the Gun and Become a Sheriff", function()
    local v130 = game.Players.LocalPlayer.Character
    if v130 and v130:FindFirstChild("HumanoidRootPart") then
        local v131 = v130.HumanoidRootPart.Position
        local v132 = math.huge
        local v133, v134, v135 = pairs(workspace:GetDescendants())
        local v136 = nil
        while true do
            local v137
            v135, v137 = v133(v134, v135)
            if v135 == nil then
                break
            end
            if v137.Name == "GunDrop" and v137:IsA("BasePart") then
                local v138 = (v130.HumanoidRootPart.Position - v137.Position).Magnitude
                if v138 < v132 then
                    v136 = v137
                    v132 = v138
                end
            end
        end
        if v136 then
            v130.HumanoidRootPart.CFrame = v136.CFrame
            task.wait(0.1)
            v130.HumanoidRootPart.CFrame = CFrame.new(v131)
        end
    end
end)
local vu139 = false
v18.newToggle("Auto Gun TP", "Automatically take the gun and become a Sheriff", false, function(p140)
    vu139 = p140
    if p140 then
        task.spawn(function()
            while vu139 do
                local v141 = game.Players.LocalPlayer.Character
                if v141 and v141:FindFirstChild("HumanoidRootPart") then
                    local v142 = v141.HumanoidRootPart.Position
                    local v143 = math.huge
                    local v144, v145, v146 = pairs(workspace:GetDescendants())
                    local v147 = nil
                    while true do
                        local v148
                        v146, v148 = v144(v145, v146)
                        if v146 == nil then
                            break
                        end
                        if v148.Name == "GunDrop" and v148:IsA("BasePart") then
                            local v149 = (v141.HumanoidRootPart.Position - v148.Position).Magnitude
                            if v149 < v143 then
                                v147 = v148
                                v143 = v149
                            end
                        end
                    end
                    if v147 then
                        v141.HumanoidRootPart.CFrame = v147.CFrame
                        task.wait(0.1)
                        v141.HumanoidRootPart.CFrame = CFrame.new(v142)
                    end
                end
                task.wait(1)
            end
        end)
    end
end)
v18.newButton("God mode", "Very, VERY UNSTABLE and buggy", function()
    local v150 = workspace.CurrentCamera
    local v151 = v150.CFrame
    local v152 = game.Players.LocalPlayer.Character
    local v153
    if v152 then
        v153 = v152:FindFirstChildWhichIsA("Humanoid")
    else
        v153 = v152
    end
    local v154 = v153:Clone()
    game.Players.LocalPlayer.Character = nil
    v154.Parent = v152
    v154:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    v154:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    v154:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
    v153:Destroy()
    v154.BreakJointsOnDeath = true
    local v155 = game.Players.LocalPlayer
    local v156 = wait()
    if not v156 then
        v151 = v156
    end
    v150.CFrame = v151
    v150.CameraSubject = v154
    v155.Character = v152
    v154.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    local v157 = v152:FindFirstChild("Animate")
    if v157 then
        v157.Disabled = true
        wait()
        v157.Disabled = false
    end
    v154.Health = v154.MaxHealth
end)
v18.newLabel("Farm")
local v158 = game:GetService("Players").LocalPlayer
local vu159 = v158.Character or v158.CharacterAdded:Wait()
local v160 = game:GetService("RunService")
local vu161 = false
local vu162 = "Nearest"
local vu163 = 3
local vu164 = 0
local vu165 = nil
local function vu171()
    local v166, v167, v168 = pairs(workspace:GetChildren())
    while true do
        local v169
        v168, v169 = v166(v167, v168)
        if v168 == nil then
            break
        end
        local v170 = v169:FindFirstChild("CoinContainer")
        if v170 then
            return v170
        end
    end
    return nil
end
local function vu181(p172)
    local v173 = vu171()
    if not v173 then
        return nil
    end
    local v174 = vu159:WaitForChild("HumanoidRootPart")
    local v175, v176, v177 = pairs(v173:GetChildren())
    local v178 = nil
    while true do
        local v179
        v177, v179 = v175(v176, v177)
        if v177 == nil then
            break
        end
        if v179:IsA("BasePart") and v179 ~= vu165 then
            local v180 = (v179.Position - v174.Position).Magnitude
            if v180 < p172 then
                v178 = v179
                p172 = v180
            end
        end
    end
    return v178
end
local function vu183(p182)
    vu159:WaitForChild("HumanoidRootPart").CFrame = p182.CFrame
    vu165 = p182
end
local function vu192()
    if vu161 then
        if tick() - vu164 >= vu163 then
            local v184 = nil
            if vu162 ~= "Nearest" then
                if vu162 == "Random" then
                    local v185 = vu171()
                    if v185 then
                        local v186 = v185:GetChildren()
                        local v187, v188, v189 = pairs(v186)
                        local v190 = {}
                        while true do
                            local v191
                            v189, v191 = v187(v188, v189)
                            if v189 == nil then
                                break
                            end
                            if v191:IsA("BasePart") and v191 ~= vu165 then
                                table.insert(v190, v191)
                            end
                        end
                        if # v190 > 0 then
                            v184 = v190[math.random(1, # v190)]
                        end
                    end
                end
            else
                v184 = vu181(50)
            end
            if v184 then
                vu183(v184)
                vu164 = tick()
                print("TP yap\196\177ld\196\177:", vu162)
            end
        end
    else
        return
    end
end
local function v194(p193)
    vu159 = p193
end
v158.CharacterAdded:Connect(v194)
v160.Heartbeat:Connect(function()
    vu192()
end)
v18.newToggle("Auto TP Coin", "TP to coins at interval", false, function(p195)
    vu161 = p195
end)
v18.newDropdown("Coin Mode", "Choose how to collect coins", {
    "Nearest",
    "Random"
}, function(p196)
    vu162 = p196
end)
v18.newSlider("TP Interval", "How many seconds between each TP", 3, 10, 4, false, function(p197)
    vu163 = p197
end)
local vu198 = game:GetService("RunService")
local vu199 = false
local vu200 = 5
local vu201 = nil
v18.newToggle("Spin", "Slowly Spins to Get Every Coin with 100% Chance.", false, function(p202)
    if p202 then
        print("On")
        vu199 = true
        local vu203 = (game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
        vu201 = vu198.RenderStepped:Connect(function(_)
            if vu199 and vu203 then
                vu203.CFrame = vu203.CFrame * CFrame.Angles(0, math.rad(vu200), 0)
            end
        end)
    else
        print("Off")
        vu199 = false
        if vu201 then
            vu201:Disconnect()
            vu201 = nil
        end
    end
end)
local vu204 = nil
v18.newToggle("Anti-AFK", "Doesn\'t kick after being afk for 20 minutes", false, function(p205)
    if p205 then
        vu204 = game:GetService("Players").LocalPlayer.Idled:Connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            task.wait(10)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    elseif vu204 then
        vu204:Disconnect()
        vu204 = nil
    end
end)
v18.newLabel("Movement")
local v206 = game:GetService("UserInputService")
local vu207 = false
local vu208 = 9
local function vu213(p209)
    vu207 = p209
    getgenv().WalkspeedBypass = vu207
    if vu207 then
        task.spawn(function()
            while getgenv().WalkspeedBypass == true and game:GetService("Players").LocalPlayer do
                pcall(function()
                    local v210 = game:GetService("Players").LocalPlayer.Character
                    if v210 then
                        local v211 = v210:FindFirstChildWhichIsA("Humanoid")
                        if v211 and v211.Parent then
                            local v212 = game:GetService("RunService").Heartbeat:Wait()
                            if v211.MoveDirection.Magnitude <= 0 then
                                v210:TranslateBy(v211.MoveDirection * v212 * 7)
                            else
                                v210:TranslateBy(v211.MoveDirection * vu208 * v212 * 7)
                            end
                        end
                    end
                end)
                task.wait(0.0015)
            end
        end)
    end
end
v18.newToggle("Speed", "On/Off With V Key", false, function(p214)
    vu213(p214)
end)
v18.newSlider("Speed Boost Value", "Speed Multiplier", 1, 100, 9, true, function(p215)
    vu208 = p215
end)
v206.InputBegan:Connect(function(p216, p217)
    if p216.KeyCode == Enum.KeyCode.V and not p217 then
        vu213(not vu207)
    end
end)
local vu218 = 200
v18.newToggle("Jump", "Teleport Super Jump", false, function(p219)
    getgenv().JumpPowerBypass = p219
    task.spawn(function()
        while getgenv().JumpPowerBypass == true do
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.Jumping then
                    game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame = game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame * CFrame.new(0, vu218, 0)
                end
            end)
            task.wait(0.0015)
        end
    end)
end)
v18.newSlider("Jump Boost Value", "Epic slider", 1, 1000, 200, false, function(p220)
    vu218 = p220
end)
v18.newLabel("Esp")
local vu221 = game:GetService("Players")
local vu222 = vu221.LocalPlayer
local vu223 = {
    Murder = false,
    Sheriff = false,
    Innocent = false
}
local function vu229()
    local v224 = vu221
    local v225, v226, v227 = pairs(v224:GetPlayers())
    while true do
        local v228
        v227, v228 = v225(v226, v227)
        if v227 == nil then
            break
        end
        if v228.Character and v228.Character:FindFirstChild("Knife") then
            return v228
        end
        if v228:FindFirstChild("Backpack") and v228.Backpack:FindFirstChild("Knife") then
            return v228
        end
    end
    return nil
end
local function vu235()
    local v230 = vu221
    local v231, v232, v233 = pairs(v230:GetPlayers())
    while true do
        local v234
        v233, v234 = v231(v232, v233)
        if v233 == nil then
            break
        end
        if v234.Character and v234.Character:FindFirstChild("Gun") then
            return v234
        end
        if v234:FindFirstChild("Backpack") and v234.Backpack:FindFirstChild("Gun") then
            return v234
        end
    end
    return nil
end
local function vu237(p236)
    return p236 ~= vu229() and (p236 ~= vu235() and "Innocent" or "Sheriff") or "Murder"
end
local function vu239(p238)
    if p238 == "Murder" then
        return Color3.fromRGB(255, 0, 0)
    elseif p238 == "Sheriff" then
        return Color3.fromRGB(0, 150, 255)
    else
        return Color3.fromRGB(0, 255, 0)
    end
end
local function vu246()
    local v240 = vu221
    local v241, v242, v243 = pairs(v240:GetPlayers())
    while true do
        local v244
        v243, v244 = v241(v242, v243)
        if v243 == nil then
            break
        end
        if v244.Character then
            local v245 = v244.Character:FindFirstChild("ESPHighlight")
            if v245 then
                v245:Destroy()
            end
        end
    end
end
local function vu254()
    vu246()
    local v247 = vu221
    local v248, v249, v250 = pairs(v247:GetPlayers())
    while true do
        local v251
        v250, v251 = v248(v249, v250)
        if v250 == nil then
            break
        end
        if v251 ~= vu222 and v251.Character then
            local v252 = vu237(v251)
            if vu223[v252] then
                local v253 = Instance.new("Highlight")
                v253.Name = "ESPHighlight"
                v253.Adornee = v251.Character
                v253.FillTransparency = 0.5
                v253.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                v253.FillColor = vu239(v252)
                v253.OutlineColor = vu239(v252)
                v253.Parent = v251.Character
            end
        end
    end
end
local function vu259(pu255)
    local function vu257()
        local v256 = pu255:FindFirstChild("Backpack")
        if v256 then
            v256.ChildAdded:Connect(vu254)
            v256.ChildRemoved:Connect(vu254)
        end
    end
    if pu255:FindFirstChild("Backpack") then
        vu257()
    else
        pu255.ChildAdded:Connect(function(p258)
            if p258.Name == "Backpack" then
                vu257()
            end
        end)
    end
end
local function vu261(pu260)
    pu260.CharacterAdded:Connect(function()
        vu259(pu260)
        vu254()
    end)
end
vu221.PlayerAdded:Connect(function(p262)
    vu261(p262)
    vu259(p262)
end)
local v263 = vu221
local v264, v265, v266 = pairs(vu221.GetPlayers(v263))
local vu267 = vu2
local vu268 = vu254
local vu269 = vu223
local v270 = vu259
local v271 = vu261
local v272 = vu222
while true do
    local v273, v274 = v264(v265, v266)
    if v273 == nil then
        break
    end
    v266 = v273
    if v274 ~= v272 then
        v271(v274)
        v270(v274)
    end
end
v18.newToggle("ESP Murder", "Shows esp of the murderer", false, function(p275)
    vu269.Murder = p275
    vu268()
end)
v18.newToggle("ESP Sheriff", "Shows esp of the sheriff", false, function(p276)
    vu269.Sheriff = p276
    vu268()
end)
v18.newToggle("ESP Innocent", "Shows esp of the innocents", false, function(p277)
    vu269.Innocent = p277
    vu268()
end)
local vu278 = nil
v18.newToggle("Gun ESP", "Droped Gun Esp", false, function(p279)
    if p279 then
        vu278 = Instance.new("Highlight", game.CoreGui)
        vu278.OutlineTransparency = 1
        vu278.FillColor = Color3.fromRGB(0, 255, 0)
        vu278.Name = "GunESP"
        vu278.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        local function v281(p280)
            if p280.Name == "GunDrop" then
                vu278.Adornee = p280
                vu278.Enabled = true
            end
        end
        local v282, v283, v284 = pairs(workspace:GetDescendants())
        while true do
            local v285
            v284, v285 = v282(v283, v284)
            if v284 == nil then
                break
            end
            v281(v285)
        end
        workspace.DescendantAdded:Connect(v281)
    elseif vu278 then
        vu278:Destroy()
        vu278 = nil
    end
end)
v18.newLabel("Spectate")
local vu286 = game:GetService("Players")
local vu287 = vu286.LocalPlayer
local vu288 = game.Workspace.CurrentCamera
local function vu294()
    local v289 = vu286
    local v290, v291, v292 = pairs(v289:GetPlayers())
    while true do
        local v293
        v292, v293 = v290(v291, v292)
        if v292 == nil then
            break
        end
        if v293 ~= vu287 and v293.Character and (v293.Backpack:FindFirstChild("Knife") or v293.Character:FindFirstChild("Knife")) then
            return v293.Character
        end
    end
    return nil
end
v18.newButton("Spectate Murder", "Spectate the Player Who is the Murder", function()
    local v295 = vu294()
    if v295 and v295:FindFirstChild("HumanoidRootPart") then
        vu288.CameraSubject = v295:FindFirstChild("Humanoid")
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "Murder Not Found",
            Duration = 1,
            Callback = AllowRunServiceBind
        })
    end
end)
local vu296 = game:GetService("Players")
local vu297 = vu296.LocalPlayer
local vu298 = game.Workspace.CurrentCamera
game:GetService("StarterGui")
local function vu304()
    local v299 = vu296
    local v300, v301, v302 = pairs(v299:GetPlayers())
    while true do
        local v303
        v302, v303 = v300(v301, v302)
        if v302 == nil then
            break
        end
        if v303 ~= vu297 and v303.Character and (v303.Backpack:FindFirstChild("Gun") or v303.Character:FindFirstChild("Gun")) then
            return v303.Character
        end
    end
    return nil
end
v18.newButton("Spectate Sheriff", "Spectate the Player Who has the Gun", function()
    local v305 = vu304()
    if v305 and v305:FindFirstChild("Humanoid") then
        vu298.CameraSubject = v305:FindFirstChild("Humanoid")
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "Sheriff Not Found",
            Duration = 10,
            Callback = AllowRunServiceBind
        })
    end
end)
v18.newButton("Spectate Random", "Spectates a Random Person on the Server", function()
    local v306 = game:GetService("Players")
    local v307 = v306.LocalPlayer
    local v308 = v306:GetPlayers()
    if # v308 <= 1 then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "There must be at least 2 people on the server",
            Duration = 1,
            Callback = AllowRunServiceBind
        })
    else
        repeat
            local v309 = v308[math.random(1, # v308)]
        until v309 ~= v307 and v309.Character and v309.Character:FindFirstChild("Humanoid")
        workspace.CurrentCamera.CameraSubject = v309.Character:FindFirstChild("Humanoid")
    end
end)
local vu310 = game:GetService("Players").LocalPlayer
local vu311 = game.Workspace.CurrentCamera
v18.newButton("Stop Spectating", "Stop spectating and return to normal", function()
    if vu310.Character and vu310.Character:FindFirstChild("Humanoid") then
        vu311.CameraSubject = vu310.Character:FindFirstChild("Humanoid")
    end
end)
local v312 = v1.newTab("Misc", "http://www.roblox.com/asset/?id=138210695069104")
v312.newButton("Copy Discord Link", "Join Dc For Free Bobuc :0", function()
    loadstring(game:HttpGet("https://pastefy.app/XBYwIrZH/raw"))()
end)
v312.newLabel("")
v312.newButton("Inf Yield", "Best Admin Panel Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
v312.newButton("Dex Explorer", "Normal pc/mobile White Dex", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Classic-Dex-Explorer-21009"))()
end)
v312.newButton("Remote Spy", "Just a Remote Spy Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
end)
v312.newButton("KeyBoard", "Mobile KeyBoard Gui", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)
v312.newButton("Anim Logger", "Animation ID Grabber", function()
    loadstring(game:HttpGet("https://pastefy.app/juBGMpCZ/raw"))()
end)
v312.newButton("f3x", "inf yield f3x Build Tool", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/f3x.lua"))()
end)
v312.newButton("Fly V3", "Like inf yield Fly But Has Gui", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/xuSMWfDu"))()
end)
v312.newButton("VFX Logger", "VFX Logger Graber Player", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/2uXfJqdU"))()
end)
v312.newLabel("Player")
v312.newButton("ServerHop", "Change Server", function()
    loadstring(game:HttpGet("https://pastefy.app/uTXUoORd/raw"))()
end)
v312.newButton("Rejoin", "ReJoin Server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
v312.newButton("Reset", "Restart Your Characther", function()
    loadstring(game:HttpGet("https://pastefy.app/YPv8xrYN/raw"))()
end)
v312.newButton("Fix Cam", "Sets Your Camera To Normal", function()
    loadstring(game:HttpGet("https://pastefy.app/IrvnCaF2/raw"))()
end)
v312.newLabel("Tools")
v312.newButton("TP Tool", "Click Tp", function()
    loadstring(game:HttpGet("https://pastefy.app/ZLpXLAeF/raw"))()
end)
v312.newButton("Jerk Off Tool", "Susy Baka (R6)", function()
    loadstring(game:HttpGet("https://pastefy.app/LcC6ZrhN/raw"))()
end)
local v313 = v1.newTab("Animations", "http://www.roblox.com/asset/?id=9405930424")
v313.newButton("Copy Discord Link", "Join Dc For Free Bobuc :0", function()
    setclipboard("https://discord.gg/Xm5sThnfsP")
end)
v313.newLabel("Walk Animations")
v313.newButton("Vampire", "Use Free Vampire Walk Anim", function()
    local v314 = vu267.Character.Animate
    v314.Disabled = true
    vu8()
    v314.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
    v314.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
    v314.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
    v314.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
    v314.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
    v314.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
    v314.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
    vu267.Character.Humanoid:ChangeState(3)
    v314.Disabled = false
end)
v313.newButton("Hero", "Use Free Hero Walk Anim", function()
    local v315 = vu267.Character.Animate
    v315.Disabled = true
    vu8()
    v315.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
    v315.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
    v315.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
    v315.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
    v315.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
    v315.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
    v315.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
    vu267.Character.Humanoid:ChangeState(3)
    v315.Disabled = false
end)
v313.newButton("ZombieClassic", "Use Free ZombieClassic Walk Anim", function()
    local v316 = vu267.Character.Animate
    v316.Disabled = true
    vu8()
    v316.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
    v316.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
    v316.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
    v316.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
    v316.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
    v316.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
    v316.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
    vu267.Character.Humanoid:ChangeState(3)
    v316.Disabled = false
end)
v313.newButton("Mage", "Use Free Mage Walk Anim", function()
    local v317 = vu267.Character.Animate
    v317.Disabled = true
    vu8()
    v317.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
    v317.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
    v317.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
    v317.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
    v317.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
    v317.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
    v317.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
    vu267.Character.Humanoid:ChangeState(3)
    v317.Disabled = false
end)
v313.newButton("Ghost", "Use Free Ghost Walk Anim", function()
    local v318 = vu267.Character.Animate
    v318.Disabled = true
    vu8()
    v318.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
    v318.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
    v318.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
    v318.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
    v318.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
    v318.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
    v318.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
    vu267.Character.Humanoid:ChangeState(3)
    v318.Disabled = false
end)
v313.newButton("Elder", "Use Free Elder Walk Anim", function()
    local v319 = vu267.Character.Animate
    v319.Disabled = true
    vu8()
    v319.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
    v319.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
    v319.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
    v319.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
    v319.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
    v319.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
    v319.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
    vu267.Character.Humanoid:ChangeState(3)
    v319.Disabled = false
end)
v313.newButton("Levitation", "Use Free Levitation Walk Anim", function()
    local v320 = vu267.Character.Animate
    v320.Disabled = true
    vu8()
    v320.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
    v320.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
    v320.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
    v320.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
    v320.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
    v320.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
    v320.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
    vu267.Character.Humanoid:ChangeState(3)
    v320.Disabled = false
end)
v313.newButton("Astronaut", "Use Free Astronaut Walk Anim", function()
    local v321 = vu267.Character.Animate
    v321.Disabled = true
    vu8()
    v321.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
    v321.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
    v321.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
    v321.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
    v321.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
    v321.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
    v321.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
    vu267.Character.Humanoid:ChangeState(3)
    v321.Disabled = false
end)
v313.newButton("Ninja", "Use Free Ninja Walk Anim", function()
    local v322 = vu267.Character.Animate
    v322.Disabled = true
    vu8()
    v322.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
    v322.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
    v322.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
    v322.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
    v322.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
    v322.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
    v322.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
    vu267.Character.Humanoid:ChangeState(3)
    v322.Disabled = false
end)
v313.newButton("Werewolf", "Use Free Werewolf Walk Anim", function()
    local v323 = vu267.Character.Animate
    v323.Disabled = true
    vu8()
    v323.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
    v323.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
    v323.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
    v323.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
    v323.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
    v323.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
    v323.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
    vu267.Character.Humanoid:ChangeState(3)
    v323.Disabled = false
end)
v313.newButton("Cartoon", "Use Free Cartoon Walk Anim", function()
    local v324 = vu267.Character.Animate
    v324.Disabled = true
    vu8()
    v324.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
    v324.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
    v324.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
    v324.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
    v324.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
    v324.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
    v324.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
    vu267.Character.Humanoid:ChangeState(3)
    v324.Disabled = false
end)
v313.newButton("Pirate", "Use Free Pirate Walk Anim", function()
    local v325 = vu267.Character.Animate
    v325.Disabled = true
    vu8()
    v325.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
    v325.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
    v325.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
    v325.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
    v325.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
    v325.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
    v325.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
    vu267.Character.Humanoid:ChangeState(3)
    v325.Disabled = false
end)
v313.newButton("Sneaky", "Use Free Sneaky Walk Anim", function()
    local v326 = vu267.Character.Animate
    v326.Disabled = true
    vu8()
    v326.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
    v326.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
    v326.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
    v326.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
    v326.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
    v326.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
    v326.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
    vu267.Character.Humanoid:ChangeState(3)
    v326.Disabled = false
end)
v313.newButton("Toy", "Use Free Toy Walk Anim", function()
    local v327 = vu267.Character.Animate
    v327.Disabled = true
    vu8()
    v327.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    v327.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
    v327.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
    v327.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
    v327.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
    v327.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
    v327.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
    vu267.Character.Humanoid:ChangeState(3)
    v327.Disabled = false
end)
v313.newButton("Knight", "Use Free Knight Walk Anim", function()
    local v328 = vu267.Character.Animate
    v328.Disabled = true
    vu8()
    v328.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
    v328.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
    v328.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
    v328.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
    v328.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
    v328.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
    v328.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
    vu267.Character.Humanoid:ChangeState(3)
    v328.Disabled = false
end)
v313.newButton("Confident", "Use Free Confident Walk Anim", function()
    local v329 = vu267.Character.Animate
    v329.Disabled = true
    vu8()
    v329.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
    v329.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
    v329.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
    v329.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
    v329.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
    v329.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
    v329.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"
    vu267.Character.Humanoid:ChangeState(3)
    v329.Disabled = false
end)
v313.newButton("Popstar", "Use Free Popstar Walk Anim", function()
    local v330 = vu267.Character.Animate
    v330.Disabled = true
    vu8()
    v330.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
    v330.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
    v330.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
    v330.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
    v330.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
    v330.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
    v330.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"
    vu267.Character.Humanoid:ChangeState(3)
    v330.Disabled = false
end)
v313.newButton("Princess", "Use Free Princess Walk Anim", function()
    local v331 = vu267.Character.Animate
    v331.Disabled = true
    vu8()
    v331.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=941003647"
    v331.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=941013098"
    v331.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=941028902"
    v331.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=941015281"
    v331.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=941008832"
    v331.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=940996062"
    v331.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=941000007"
    vu267.Character.Humanoid:ChangeState(3)
    v331.Disabled = false
end)
v313.newButton("Cowboy", "Use Free Cowboy Walk Anim", function()
    local v332 = vu267.Character.Animate
    v332.Disabled = true
    vu8()
    v332.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
    v332.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
    v332.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
    v332.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
    v332.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
    v332.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
    v332.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"
    vu267.Character.Humanoid:ChangeState(3)
    v332.Disabled = false
end)
v313.newButton("Patrol", "Use Free Patrol Walk Anim", function()
    local v333 = vu267.Character.Animate
    v333.Disabled = true
    vu8()
    v333.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
    v333.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
    v333.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
    v333.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
    v333.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1150944216"
    v333.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
    v333.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"
    vu267.Character.Humanoid:ChangeState(3)
    v333.Disabled = false
end)
v313.newButton("Zombie FE", "Use Free Zombie FE Walk Anim", function()
    local v334 = vu267.Character.Animate
    v334.Disabled = true
    vu8()
    v334.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
    v334.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
    v334.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=3489174223"
    v334.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3489173414"
    v334.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
    v334.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
    v334.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
    vu267.Character.Humanoid:ChangeState(3)
    v334.Disabled = false
end)
local v335 = v1.newTab("Fling", "http://www.roblox.com/asset/?id=138210695069104")
v335.newButton("Copy Discord Link", "Join Dc For Free Bobuc :0", function()
    setclipboard("https://discord.gg/Xm5sThnfsP")
end)
v335.newLabel("MM2")
v335.newButton("Fling Sheriff", "Flings Sheriff For Killing", function()
    local v336 = game:GetService("Players")
    local v337 = v336.LocalPlayer
    local v338, v339, v340 = pairs(v336:GetPlayers())
    local v341 = nil
    while true do
        local v342
        v340, v342 = v338(v339, v340)
        if v340 == nil then
            v342 = v341
            break
        end
        if v342 ~= v337 and v342.Character then
            local v343 = v342:FindFirstChild("Backpack")
            if v343 and v343:FindFirstChild("Gun") then
                break
            end
        end
    end
    if v342 then
        miniFling(v342)
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "Sheriff Not found!",
            Duration = 1
        })
    end
end)
v335.newButton("Fling Murder", "Flings Murder For Killing", function()
    local v344 = game:GetService("Players")
    local v345 = v344.LocalPlayer
    local v346, v347, v348 = pairs(v344:GetPlayers())
    local v349 = nil
    while true do
        local v350
        v348, v350 = v346(v347, v348)
        if v348 == nil then
            v350 = v349
            break
        end
        if v350 ~= v345 and v350.Character then
            local v351 = v350:FindFirstChild("Backpack")
            if v351 and v351:FindFirstChild("Knife") then
                break
            end
        end
    end
    if v350 then
        miniFling(v350)
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "Murderer Not Found",
            Duration = 1,
            Callback = AllowRunServiceBind
        })
    end
end)
v335.newLabel("Players")
local vu352 = game:GetService("Players")
local vu353 = game:GetService("StarterGui")
local vu354 = vu352.LocalPlayer
local vu355 = game.Workspace.CurrentCamera
_G.SelectedPlayer = ""
local vu356 = false
local vu357 = false
local vu358 = false
local vu359 = vu355.CameraSubject
v335.newInput("Select Player", "Enter Player Name To Select", function(p360)
    _G.SelectedPlayer = p360
    if p360 and p360 ~= "" then
        local v361 = vu352
        local v362, v363, v364 = ipairs(v361:GetPlayers())
        while true do
            local v365
            v364, v365 = v362(v363, v364)
            if v364 == nil then
                break
            end
            if string.find(string.lower(v365.Name), string.lower(p360), 1, true) or string.find(string.lower(v365.DisplayName), string.lower(p360), 1, true) then
                vu353:SetCore("SendNotification", {
                    Title = "VexonHub",
                    Text = "Selected: " .. v365.DisplayName,
                    Icon = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. v365.UserId .. "&width=420&height=420&format=png",
                    Duration = 10
                })
                return
            end
        end
        vu353:SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "Player Not Found",
            Icon = "http://www.roblox.com/asset/?id=84519376661277",
            Duration = 5
        })
    else
        vu353:SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "No One Selected",
            Icon = "http://www.roblox.com/asset/?id=84519376661277",
            Duration = 5
        })
    end
end)
local function vu373()
    local v366 = vu354.Character
    if _G.SelectedPlayer and _G.SelectedPlayer ~= "" then
        if v366 and v366:FindFirstChild("HumanoidRootPart") then
            local v367 = vu352
            local v368, v369, v370 = ipairs(v367:GetPlayers())
            while true do
                local v371
                v370, v371 = v368(v369, v370)
                if v370 == nil then
                    break
                end
                if string.find(string.lower(v371.Name), string.lower(_G.SelectedPlayer), 1, true) or string.find(string.lower(v371.DisplayName), string.lower(_G.SelectedPlayer), 1, true) then
                    local v372 = v371.Character
                    if v372 and v372:FindFirstChild("HumanoidRootPart") then
                        v366:FindFirstChild("HumanoidRootPart").CFrame = v372:FindFirstChild("HumanoidRootPart").CFrame
                        return
                    end
                end
            end
        end
    else
        return
    end
end
v335.newButton("Teleport", "Teleport to Selected Player One Time", function()
    if _G.SelectedPlayer and _G.SelectedPlayer ~= "" then
        vu373()
    else
        vu353:SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "No One Selected",
            Icon = "http://www.roblox.com/asset/?id=84519376661277",
            Duration = 5
        })
    end
end)
v335.newToggle("Loop Teleport", "Loop Teleport To The Selected Person", false, function(p374)
    vu356 = p374
    if p374 then
        if not _G.SelectedPlayer or _G.SelectedPlayer == "" then
            vu353:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "No One Selected",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            vu356 = false
            return
        end
        task.spawn(function()
            while vu356 do
                vu373()
                task.wait(0.1)
            end
        end)
    end
end)
v335.newButton("Fling", "Fling The Selected Player One Time", function()
    if _G.SelectedPlayer and _G.SelectedPlayer ~= "" then
        local v375 = vu352
        local v376, v377, v378 = ipairs(v375:GetPlayers())
        while true do
            local v379
            v378, v379 = v376(v377, v378)
            if v378 == nil then
                break
            end
            if string.find(string.lower(v379.Name), string.lower(_G.SelectedPlayer), 1, true) or string.find(string.lower(v379.DisplayName), string.lower(_G.SelectedPlayer), 1, true) then
                miniFling(v379)
                return
            end
        end
        vu353:SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "Player Not Found",
            Icon = "http://www.roblox.com/asset/?id=84519376661277",
            Duration = 5
        })
    else
        vu353:SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "No One Selected",
            Icon = "http://www.roblox.com/asset/?id=84519376661277",
            Duration = 5
        })
    end
end)
v335.newToggle("Loop Fling", "Loop Fling Selected Player", false, function(p380)
    vu357 = p380
    if p380 then
        if not _G.SelectedPlayer or _G.SelectedPlayer == "" then
            vu353:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "No One Selected",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            vu357 = false
            return
        end
        task.spawn(function()
            while vu357 do
                local v381 = vu352
                local v382, v383, v384 = ipairs(v381:GetPlayers())
                while true do
                    local v385
                    v384, v385 = v382(v383, v384)
                    if v384 == nil then
                        break
                    end
                    if string.find(string.lower(v385.Name), string.lower(_G.SelectedPlayer or ""), 1, true) or string.find(string.lower(v385.DisplayName), string.lower(_G.SelectedPlayer or ""), 1, true) then
                        miniFling(v385)
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end)
v335.newButton("View Player", "View Selected Player For 3 Seconds", function()
    if _G.SelectedPlayer and _G.SelectedPlayer ~= "" then
        local v386 = vu352
        local v387, v388, v389 = ipairs(v386:GetPlayers())
        while true do
            local v390
            v389, v390 = v387(v388, v389)
            if v389 == nil then
                break
            end
            if string.find(string.lower(v390.Name), string.lower(_G.SelectedPlayer), 1, true) or string.find(string.lower(v390.DisplayName), string.lower(_G.SelectedPlayer), 1, true) then
                local vu391 = v390.Character
                if vu391 then
                    vu391 = vu391:FindFirstChildOfClass("Humanoid")
                end
                if vu391 then
                    local vu392 = vu355.CameraSubject
                    vu355.CameraSubject = vu391
                    task.delay(3, function()
                        if vu355.CameraSubject == vu391 then
                            vu355.CameraSubject = vu392
                        end
                    end)
                end
                return
            end
        end
    else
        vu353:SetCore("SendNotification", {
            Title = "VexonHub",
            Text = "No One Selected",
            Icon = "http://www.roblox.com/asset/?id=84519376661277",
            Duration = 5
        })
    end
end)
v335.newToggle("Loop View", "Keep Viewing Selected Player", false, function(p393)
    vu358 = p393
    if p393 then
        if not _G.SelectedPlayer or _G.SelectedPlayer == "" then
            vu353:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "No One Selected",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            vu358 = false
            return
        end
        task.spawn(function()
            while true do
                if not vu358 then
                    vu355.CameraSubject = vu359
                    return
                end
                local v394 = vu352
                local v395, v396, v397 = ipairs(v394:GetPlayers())
                local v398 = false
                while true do
                    local v399
                    v397, v399 = v395(v396, v397)
                    if v397 == nil then
                        break
                    end
                    if string.find(string.lower(v399.Name), string.lower(_G.SelectedPlayer or ""), 1, true) or string.find(string.lower(v399.DisplayName), string.lower(_G.SelectedPlayer or ""), 1, true) then
                        local v400 = v399.Character
                        if v400 then
                            v400 = v400:FindFirstChildOfClass("Humanoid")
                        end
                        if v400 then
                            vu355.CameraSubject = v400
                            v398 = true
                        end
                        break
                    end
                end
                if not v398 then
                    vu355.CameraSubject = vu359
                end
                task.wait(0.1)
            end
        end)
    else
        vu355.CameraSubject = vu359
    end
end)
v335.newToggle("AimLock Cam Player", "Lock Camera to Selected Player", false, function(p401)
    aimBotEnabled = p401
    if aimBotEnabled then
        if not _G.SelectedPlayer or _G.SelectedPlayer == "" then
            vu353:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "No One Selected",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            aimBotEnabled = false
            return
        end
        task.spawn(function()
            while aimBotEnabled do
                aimAtSelectedPlayer()
                task.wait(0)
            end
        end)
    end
end)
v335.newToggle("AimLock Character Player", "Lock Character to Selected Player", false, function(p402)
    characterAimLockEnabled = p402
    if characterAimLockEnabled then
        if not _G.SelectedPlayer or _G.SelectedPlayer == "" then
            vu353:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "No One Selected",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            characterAimLockEnabled = false
            return
        end
        task.spawn(function()
            while characterAimLockEnabled do
                lockCharacterToSelectedPlayer()
                task.wait(0)
            end
        end)
    end
end)
local vu403 = game:GetService("RunService")
local vu404 = false
local vu405 = nil
local vu406 = nil
v335.newToggle("Orbit Player", "Orbit Around Selected Player", false, function(p407)
    vu404 = p407
    if vu404 then
        if not _G.SelectedPlayer or _G.SelectedPlayer == "" then
            vu353:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "No One Selected",
                Icon = "http://www.roblox.com/asset/?id=84519376661277",
                Duration = 5
            })
            vu404 = false
            return
        end
        task.spawn(function()
            local vu408 = vu354.Character
            if vu408 then
                vu408 = vu408:FindFirstChild("HumanoidRootPart")
            end
            if not vu408 then
                return
            end
            local v409 = vu352
            local v410, v411, v412 = ipairs(v409:GetPlayers())
            local v413 = nil
            while true do
                local v414
                v412, v414 = v410(v411, v412)
                if v412 == nil then
                    v414 = v413
                    break
                end
                if string.find(string.lower(v414.Name), string.lower(_G.SelectedPlayer or ""), 1, true) or string.find(string.lower(v414.DisplayName), string.lower(_G.SelectedPlayer or ""), 1, true) then
                    break
                end
            end
            if v414 and v414.Character and v414.Character:FindFirstChild("HumanoidRootPart") then
                local vu415 = v414.Character:FindFirstChild("HumanoidRootPart")
                local vu416 = 0
                local vu417 = 8
                local vu418 = 5
                vu405 = vu403.Heartbeat:Connect(function()
                    if vu404 and (vu408 and vu415) then
                        vu416 = vu416 + vu417
                        vu408.CFrame = CFrame.new(vu415.Position) * CFrame.Angles(0, math.rad(vu416), 0) * CFrame.new(vu418, 0, 0)
                    else
                        vu405:Disconnect()
                        vu406:Disconnect()
                    end
                end)
                vu406 = vu403.RenderStepped:Connect(function()
                    if vu404 and (vu408 and vu415) then
                        vu408.CFrame = CFrame.new(vu408.Position, vu415.Position)
                    else
                        vu405:Disconnect()
                        vu406:Disconnect()
                    end
                end)
            end
        end)
    else
        if vu405 then
            vu405:Disconnect()
        end
        if vu406 then
            vu406:Disconnect()
        end
    end
end)
local vu419 = false
local vu420 = nil
v335.newToggle("Notify On Death", "Sends notification if the selected person dies ", false, function(p421)
    vu419 = p421
    if vu420 then
        vu420:Disconnect()
        vu420 = nil
    end
    if p421 then
        if not _G.SelectedPlayer or _G.SelectedPlayer == "" then
            vu353:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = "No One Selected",
                Duration = 5
            })
            vu419 = false
            return
        end
        local v422 = vu352
        local v423, v424, v425 = ipairs(v422:GetPlayers())
        while true do
            local vu426
            v425, vu426 = v423(v424, v425)
            if v425 == nil then
                break
            end
            if string.lower(vu426.Name):find(string.lower(_G.SelectedPlayer)) or string.lower(vu426.DisplayName):find(string.lower(_G.SelectedPlayer)) then
                local v427 = (vu426.Character or vu426.CharacterAdded:Wait()):WaitForChild("Humanoid", 5)
                if v427 then
                    vu420 = v427.Died:Connect(function()
                        vu353:SetCore("SendNotification", {
                            Title = "VexonHub",
                            Text = vu426.DisplayName .. " Died",
                            Duration = 5
                        })
                    end)
                end
                break
            end
        end
    end
end)
vu352.PlayerRemoving:Connect(function(p428)
    if _G.SelectedPlayer and _G.SelectedPlayer ~= "" and (string.lower(p428.Name):find(string.lower(_G.SelectedPlayer)) or string.lower(p428.DisplayName):find(string.lower(_G.SelectedPlayer))) then
        vu353:SetCore("SendNotification", {
            Title = "VexonHub",
            Text = p428.DisplayName .. " Leaved The Game",
            Duration = 5
        })
    end
end)
vu352.PlayerAdded:Connect(function(pu429)
    if _G.SelectedPlayer and _G.SelectedPlayer ~= "" and (string.lower(pu429.Name):find(string.lower(_G.SelectedPlayer)) or string.lower(pu429.DisplayName):find(string.lower(_G.SelectedPlayer))) then
        task.delay(0.5, function()
            vu353:SetCore("SendNotification", {
                Title = "VexonHub",
                Text = pu429.DisplayName .. " Rejoined The Game!",
                Duration = 6
            })
        end)
    end
end)
v335.newLabel("Fling")
local vu430 = false
local vu431 = game.Players.LocalPlayer
game:GetService("RunService")
v335.newToggle("Fling Aura", "Flings Person Within 10 Stud", false, function(p432)
    vu430 = p432
    if p432 then
        task.spawn(function()
            while vu430 do
                if vu431.Character and vu431.Character:FindFirstChild("HumanoidRootPart") then
                    local v433, v434, v435 = pairs(game.Players:GetPlayers())
                    while true do
                        local v436
                        v435, v436 = v433(v434, v435)
                        if v435 == nil then
                            break
                        end
                        if v436 ~= vu431 and v436.Character and v436.Character:FindFirstChild("HumanoidRootPart") then
                            local v437 = v436.Character.HumanoidRootPart
                            if (vu431.Character.HumanoidRootPart.Position - v437.Position).Magnitude <= 10 then
                                miniFling(v436)
                            end
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    end
end)
vu431.CharacterAdded:Connect(function()
    vu430 = false
end)
local vu438 = game:GetService("Players")
local v439 = game:GetService("UserInputService")
local vu440 = vu438.LocalPlayer
local v441 = vu440
local vu442 = vu440.GetMouse(v441)
local vu443 = workspace.CurrentCamera
local vu444 = false
v335.newToggle("Click Fling", "Flings the Person You Clicked", false, function(p445)
    vu444 = p445
end)
local function vu447(p446)
    if p446 and p446.Parent and p446.Parent:IsA("Model") then
        local _ = vu438.GetPlayerFromCharacter
        local _ = p446.Parent
    end
end
vu442.Button1Down:Connect(function()
    if vu444 then
        local v448 = vu447(vu442.Target)
        if v448 and v448 ~= vu440 then
            miniFling(v448)
        end
    end
end)
v439.TouchTap:Connect(function(p449, p450)
    if vu444 and not p450 then
        local v451 = p449[1]
        local v452 = vu443.CFrame.Position
        local v453 = vu443:ViewportPointToRay(v451.X, v451.Y).Direction * 500
        local v454 = RaycastParams.new()
        v454.FilterDescendantsInstances = {
            vu440.Character
        }
        v454.FilterType = Enum.RaycastFilterType.Blacklist
        local v455 = workspace:Raycast(v452, v453, v454)
        local v456 = vu447
        if v455 then
            v455 = v455.Instance
        end
        local v457 = v456(v455)
        if v457 and v457 ~= vu440 then
            miniFling(v457)
        end
    end
end)
local vu458 = false
local vu459 = game:GetService("Players")
local vu460 = vu459.LocalPlayer
local vu461 = (vu460.Character or vu460.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
local vu462
if vu461 then
    vu462 = vu461.CFrame
else
    vu462 = vu461
end
v335.newToggle("Fling All", "Flings Everyone Loop", false, function(p463)
    vu458 = p463
    if p463 then
        task.spawn(function()
            while vu458 do
                local v464 = vu459
                local v465, v466, v467 = pairs(v464:GetPlayers())
                while true do
                    local v468
                    v467, v468 = v465(v466, v467)
                    if v467 == nil then
                        break
                    end
                    if v468 ~= vu460 then
                        miniFling(v468)
                    end
                end
                task.wait(0.5)
            end
        end)
    elseif vu462 and vu461 then
        vu461.CFrame = vu462
    end
end)
local _ = game.Players.LocalPlayer
game:GetService("UserInputService")
local vu469
if game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
    vu469 = false
else
    local v470 = Instance.new("Decal")
    v470.Name = "juisdfj0i32i0eidsuf0iok"
    v470.Parent = game:GetService("ReplicatedStorage")
    vu469 = false
end
local function vu476()
    local v471 = nil
    local v472 = nil
    local v473 = 0.1
    while vu469 do
        game:GetService("RunService").Heartbeat:Wait()
        local v474 = game.Players.LocalPlayer
        while vu469 and not (v471 and (v471.Parent and (v472 and v472.Parent))) do
            game:GetService("RunService").Heartbeat:Wait()
            v471 = v474.Character
            v472 = v471:FindFirstChild("HumanoidRootPart") or (v471:FindFirstChild("Torso") or v471:FindFirstChild("UpperTorso"))
        end
        if vu469 then
            local v475 = v472.Velocity
            v472.Velocity = v475 * 10000 + Vector3.new(0, 10000, 0)
            game:GetService("RunService").RenderStepped:Wait()
            if v471 and (v471.Parent and (v472 and v472.Parent)) then
                v472.Velocity = v475
            end
            game:GetService("RunService").Stepped:Wait()
            if v471 and (v471.Parent and (v472 and v472.Parent)) then
                v472.Velocity = v475 + Vector3.new(0, v473, 0)
                v473 = v473 * - 1
            end
        end
    end
end
v335.newToggle("Touch Fling", "Fling The Person You Touch", false, function(p477)
    if p477 then
        vu469 = true
        coroutine.wrap(vu476)()
    else
        vu469 = false
    end
end)
local vu478 = false
local vu479 = {}
local function vu485(p480)
    if vu478 and p480.Character then
        local v481, v482, v483 = pairs(p480.Character:GetDescendants())
        while true do
            local v484
            v483, v484 = v481(v482, v483)
            if v483 == nil then
                break
            end
            if v484:IsA("BasePart") and v484.CanCollide then
                v484.CanCollide = false
            end
        end
    end
end
local function vu494()
    local v486, v487, v488 = pairs(game.Players:GetPlayers())
    while true do
        local v489
        v488, v489 = v486(v487, v488)
        if v488 == nil then
            break
        end
        if v489 ~= game.Players.LocalPlayer and v489.Character then
            local v490, v491, v492 = pairs(v489.Character:GetDescendants())
            while true do
                local v493
                v492, v493 = v490(v491, v492)
                if v492 == nil then
                    break
                end
                if v493:IsA("BasePart") then
                    v493.CanCollide = true
                end
            end
        end
    end
end
local function vu502()
    local v495, v496, v497 = pairs(game.Players:GetPlayers())
    while true do
        local vu498
        v497, vu498 = v495(v496, v497)
        if v497 == nil then
            break
        end
        if vu498 ~= game.Players.LocalPlayer then
            local v499 = game:GetService("RunService").Stepped:Connect(function()
                vu485(vu498)
            end)
            table.insert(vu479, v499)
        end
    end
    game.Players.PlayerAdded:Connect(function(pu500)
        if pu500 ~= game.Players.LocalPlayer then
            local v501 = game:GetService("RunService").Stepped:Connect(function()
                vu485(pu500)
            end)
            table.insert(vu479, v501)
        end
    end)
end
local function vu507()
    local v503, v504, v505 = pairs(vu479)
    while true do
        local v506
        v505, v506 = v503(v504, v505)
        if v505 == nil then
            break
        end
        v506:Disconnect()
    end
    table.clear(vu479)
    vu494()
end
v335.newToggle("Anti Fling", "Other Exploiters Cant Fling You", false, function(p508)
    vu478 = p508
    if p508 then
        vu502()
    else
        vu507()
    end
end)
local vu509 = 1000
local vu510
if game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
    vu510 = false
else
    local v511 = Instance.new("Decal")
    v511.Name = "juisdfj0i32i0eidsuf0iok"
    v511.Parent = game:GetService("ReplicatedStorage")
    vu510 = false
end
local function vu517()
    local v512 = nil
    local v513 = nil
    local v514 = 0.1
    while vu510 do
        game:GetService("RunService").Heartbeat:Wait()
        local v515 = game.Players.LocalPlayer
        while vu510 and not (v512 and (v512.Parent and (v513 and v513.Parent))) do
            game:GetService("RunService").Heartbeat:Wait()
            v512 = v515.Character
            v513 = v512:FindFirstChild("HumanoidRootPart") or (v512:FindFirstChild("Torso") or v512:FindFirstChild("UpperTorso"))
        end
        if vu510 then
            local v516 = v513.Velocity
            v513.Velocity = v516 * vu509 + Vector3.new(0, 100, 0)
            game:GetService("RunService").RenderStepped:Wait()
            if v512 and (v512.Parent and (v513 and v513.Parent)) then
                v513.Velocity = v516
            end
            game:GetService("RunService").Stepped:Wait()
            if v512 and (v512.Parent and (v513 and v513.Parent)) then
                v513.Velocity = v516 + Vector3.new(0, v514, 0)
                v514 = v514 * - 1
            end
        end
    end
end
v335.newToggle("Costum Touch Fling Power", "Fling The Person You Touch", false, function(p518)
    if p518 then
        vu510 = true
        coroutine.wrap(vu517)()
    else
        vu510 = false
    end
end)
v335.newSlider("Fling Power Value", "Adjust the fling power", 1, 10000, 1000, true, function(p519)
    vu509 = p519
end)
local v520 = v1.newTab("Places", "http://www.roblox.com/asset/?id=6723742952")
v520.newButton("Copy Discord Link", "Join Dc For Free Bobuc :0", function()
    loadstring(game:HttpGet("https://pastefy.app/XBYwIrZH/raw"))()
end)
v520.newLabel("")
v520.newButton("TP to Sheriff", "Teleport to the Person Who is the Murder", function()
    local v521 = game:GetService("Players")
    local v522 = v521.LocalPlayer
    local v523 = (v522.Character or v522.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    local v524, v525, v526 = ipairs(v521:GetPlayers())
    local function v538(p527)
        local v528 = p527:FindFirstChild("Backpack")
        if v528 then
            local v529, v530, v531 = ipairs(v528:GetChildren())
            while true do
                local v532
                v531, v532 = v529(v530, v531)
                if v531 == nil then
                    break
                end
                if v532.Name:lower() == "gun" then
                    return true
                end
            end
        end
        local v533 = p527.Character
        if v533 then
            local v534, v535, v536 = ipairs(v533:GetChildren())
            while true do
                local v537
                v536, v537 = v534(v535, v536)
                if v536 == nil then
                    break
                end
                if v537:IsA("Tool") and v537.Name:lower() == "knife" then
                    return true
                end
            end
        end
        return false
    end
    while true do
        local v539
        v526, v539 = v524(v525, v526)
        if v526 == nil then
            break
        end
        if v539 ~= v522 and v538(v539) then
            local v540 = v539.Character
            if v540 and v540:FindFirstChild("HumanoidRootPart") then
                wait(0.5)
                v523.CFrame = v540.HumanoidRootPart.CFrame + Vector3.new(2, 0, 0)
            end
        end
    end
end)
v520.newButton("TP to Murder", "Teleport to the Person Who is the Murder", function()
    local v541 = game:GetService("Players")
    local v542 = v541.LocalPlayer
    local v543 = (v542.Character or v542.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    local v544, v545, v546 = ipairs(v541:GetPlayers())
    local function v558(p547)
        local v548 = p547:FindFirstChild("Backpack")
        if v548 then
            local v549, v550, v551 = ipairs(v548:GetChildren())
            while true do
                local v552
                v551, v552 = v549(v550, v551)
                if v551 == nil then
                    break
                end
                if v552.Name:lower() == "knife" then
                    return true
                end
            end
        end
        local v553 = p547.Character
        if v553 then
            local v554, v555, v556 = ipairs(v553:GetChildren())
            while true do
                local v557
                v556, v557 = v554(v555, v556)
                if v556 == nil then
                    break
                end
                if v557:IsA("Tool") and v557.Name:lower() == "knife" then
                    return true
                end
            end
        end
        return false
    end
    while true do
        local v559
        v546, v559 = v544(v545, v546)
        if v546 == nil then
            break
        end
        if v559 ~= v542 and v558(v559) then
            local v560 = v559.Character
            if v560 and v560:FindFirstChild("HumanoidRootPart") then
                wait(0.5)
                v543.CFrame = v560.HumanoidRootPart.CFrame + Vector3.new(2, 0, 0)
            end
        end
    end
end)
local vu561 = game:GetService("Players")
local vu562 = vu561.LocalPlayer
vu161 = false
originalPosition = nil
v520.newToggle("Tp All Loop", "Teleports to Everyone in the Server Every 0.1 Seconds", false, function(p563)
    vu161 = p563
    if p563 then
        if vu562.Character and vu562.Character:FindFirstChild("HumanoidRootPart") then
            originalPosition = vu562.Character.HumanoidRootPart.CFrame
        end
        startTeleporting()
    elseif originalPosition and vu562.Character and vu562.Character:FindFirstChild("HumanoidRootPart") then
        vu562.Character.HumanoidRootPart.CFrame = originalPosition
    end
end)
function startTeleporting()
    task.spawn(function()
        while vu161 do
            local v564 = vu561
            local v565, v566, v567 = ipairs(v564:GetPlayers())
            while true do
                local v568
                v567, v568 = v565(v566, v567)
                if v567 == nil then
                    break
                end
                if v568 ~= vu562 and v568.Character and (v568.Character:FindFirstChild("HumanoidRootPart") and vu562.Character and vu562.Character:FindFirstChild("HumanoidRootPart")) then
                    vu562.Character.HumanoidRootPart.CFrame = v568.Character.HumanoidRootPart.CFrame
                    task.wait(0.1)
                end
            end
            task.wait(0.1)
        end
    end)
end
vu562.CharacterAdded:Connect(function()
    if vu161 then
        startTeleporting()
    end
end)
v520.newButton("TP to Lobby", "Teleport To Lobby", function()
    workspace.Part:TweenPosition(Vector3.new(- 108.5, 142, 0.6), "Out", "Quad", 3, false)
end)
v520.newButton("TP to Map", "Teleport To Current Map", function()
    local v569 = workspace:GetChildren()
    local v570, v571, v572 = pairs(v569)
    while true do
        local v573
        v572, v573 = v570(v571, v572)
        if v572 == nil then
            break
        end
        local v574 = v573:GetChildren()
        local v575, v576, v577 = pairs(v574)
        while true do
            local v578
            v577, v578 = v575(v576, v577)
            if v577 == nil then
                break
            end
            if v578.Name == "Spawns" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v578.Spawn.CFrame
            end
        end
    end
end)
local v579 = v1.newTab("Gui", "http://www.roblox.com/asset/?id=86855135563483")
v579.newButton("Copy Discord Link", "Join Dc For Free Bobuc :0", function()
    setclipboard("https://discord.gg/Xm5sThnfsP")
end)
v579.newLabel("Main Bar")
v579.newButton("Red", "", function()
    loadstring(game:HttpGet("https://pastefy.app/t2EZmina/raw"))()
end)
v579.newButton("Yellow", "", function()
    loadstring(game:HttpGet("https://pastefy.app/ky88HKCn/raw"))()
end)
v579.newButton("Green", "", function()
    loadstring(game:HttpGet("https://pastefy.app/R9LpNo4o/raw"))()
end)
v579.newButton("Cyan", "", function()
    loadstring(game:HttpGet("https://pastefy.app/WLGGjcNr/raw"))()
end)
v579.newButton("Blue", "", function()
    loadstring(game:HttpGet("https://pastefy.app/tWEF9ub9/raw"))()
end)
v579.newButton("Purple", "", function()
    loadstring(game:HttpGet("https://pastefy.app/3cqB8vef/raw"))()
end)
v579.newButton("White", "", function()
    loadstring(game:HttpGet("https://pastefy.app/PJmlpOD5/raw"))()
end)
v579.newButton("Black", "", function()
    loadstring(game:HttpGet("https://pastefy.app/89XoyHTP/raw"))()
end)
v579.newLabel("Top Bar")
v579.newButton("Red", "", function()
    loadstring(game:HttpGet("https://pastefy.app/CaTmibHh/raw"))()
end)
v579.newButton("Yellow", "", function()
    loadstring(game:HttpGet("https://pastefy.app/MNuiGJKS/raw"))()
end)
v579.newButton("Green", "", function()
    loadstring(game:HttpGet("https://pastefy.app/xs0p0WLV/raw"))()
end)
v579.newButton("Cyan", "", function()
    loadstring(game:HttpGet("https://pastefy.app/hvR4wdES/raw"))()
end)
v579.newButton("Blue", "", function()
    loadstring(game:HttpGet("https://pastefy.app/sxlH2Qh8/raw"))()
end)
v579.newButton("Purple", "", function()
    loadstring(game:HttpGet("https://pastefy.app/WaomktDR/raw"))()
end)
v579.newButton("Black", "", function()
    loadstring(game:HttpGet("https://pastefy.app/INfdOZTH"))()
end)
v579.newButton("White", "", function()
    loadstring(game:HttpGet("https://pastefy.app/oTIPoMQD/raw"))()
end)
v579.newLabel("Transparency")
v579.newButton("100", "", function()
    loadstring(game:HttpGet("https://pastefy.app/KzTm98bw/raw"))()
end)
v579.newButton("75", "", function()
    loadstring(game:HttpGet("https://pastefy.app/MlvMAVCw/raw"))()
end)
v579.newButton("50", "", function()
    loadstring(game:HttpGet("https://pastefy.app/2c7CSeUo/raw"))()
end)
v579.newButton("25", "", function()
    loadstring(game:HttpGet("https://pastefy.app/7NWaq078/raw"))()
end)
v579.newButton("0", "", function()
    loadstring(game:HttpGet("https://pastefy.app/2qNW7vWu/raw"))()
end)
v579.newLabel("Restart")
v579.newButton("Restart Colors", "", function()
    loadstring(game:HttpGet("https://pastefy.app/qasYsJ1p/raw"))()
end)
v579.newButton("Restart Transparency", "", function()
    loadstring(game:HttpGet("https://pastefy.app/21OJEwHm/raw"))()
end)