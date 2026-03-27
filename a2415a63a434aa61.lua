-- ts file was generated at discord.gg/25ms


local vu1 = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local vu2 = game:GetService("Players")
local vu3 = game:GetService("ReplicatedStorage")
local vu4 = game:GetService("Workspace")
local vu5 = vu2.LocalPlayer
local vu6 = false
local vu7 = false
local vu8 = 50
local vu9 = 0
local vu10 = {
    ["Old Axe"] = "3_7367831688",
    ["Good Axe"] = "112_7367831688",
    ["Strong Axe"] = "116_7367831688",
    Chainsaw = "647_8992824875",
    Spear = "196_8999010016"
}
local vu11 = false
local vu12 = "Carrot"
local vu13 = 75
local vu14 = {}
local vu15 = {
    "Bandage",
    "Bolt",
    "Broken Fan",
    "Broken Microwave",
    "Cake",
    "Carrot",
    "Chair",
    "Coal",
    "Coin Stack",
    "Cooked Morsel",
    "Cooked Steak",
    "Fuel Canister",
    "Iron Body",
    "Leather Armor",
    "Log",
    "MadKit",
    "Metal Chair",
    "MedKit",
    "Old Car Engine",
    "Old Flashlight",
    "Old Radio",
    "Revolver",
    "Revolver Ammo",
    "Rifle",
    "Rifle Ammo",
    "Morsel",
    "Sheet Metal",
    "Steak",
    "Tyre",
    "Washing Machine"
}
local vu16 = {
    "Bunny",
    "Wolf",
    "Alpha Wolf",
    "Bear",
    "Cultist",
    "Crossbow Cultist",
    "Alien"
}
local vu17 = {}
local vu18 = {}
local vu19 = {
    "Log",
    "Coal",
    "Fuel Canister",
    "Oil Barrel",
    "Biofuel"
}
local vu20 = Vector3.new(0, 19, 0)
local vu21 = {
    "Morsel",
    "Steak"
}
local vu22 = {}
local vu23 = false
local function vu30(p24)
    local v25, v26, v27 = pairs(vu10)
    while true do
        local v28
        v27, v28 = v25(v26, v27)
        if v27 == nil then
            break
        end
        if not p24 or (v27 == "Old Axe" or (v27 == "Good Axe" or v27 == "Strong Axe")) then
            local v29 = vu5:FindFirstChild("Inventory")
            if v29 then
                v29 = vu5.Inventory:FindFirstChild(v27)
            end
            if v29 then
                return v29, v28
            end
        end
    end
    return nil, nil
end
local function vu32(p31)
    if p31 then
        vu3:WaitForChild("RemoteEvents").EquipItemHandle:FireServer("FireAllClients", p31)
    end
end
local function vu34(p33)
    if p33 then
        vu3:WaitForChild("RemoteEvents").UnequipItemHandle:FireServer("FireAllClients", p33)
    end
end
local function vu43()
    while vu6 do
        local v35 = (vu5.Character or vu5.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
        if v35 then
            local vu36, vu37 = vu30(false)
            if vu36 and vu37 then
                vu32(vu36)
                local v38, v39, v40 = ipairs(vu4.Characters:GetChildren())
                while true do
                    local vu41
                    v40, vu41 = v38(v39, v40)
                    if v40 == nil then
                        break
                    end
                    if vu41:IsA("Model") then
                        local vu42 = vu41:FindFirstChildWhichIsA("BasePart")
                        if vu42 and (vu42.Position - v35.Position).Magnitude <= vu8 then
                            pcall(function()
                                vu3:WaitForChild("RemoteEvents").ToolDamageObject:InvokeServer(vu41, vu36, vu37, CFrame.new(vu42.Position))
                            end)
                        end
                    end
                end
                task.wait(0.1)
            else
                task.wait(1)
            end
        else
            task.wait(0.5)
        end
    end
end
local function vu63()
    while vu7 do
        local v44 = (vu5.Character or vu5.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
        if v44 then
            local vu45, v46 = vu30(true)
            if vu45 and v46 then
                vu32(vu45)
                vu9 = vu9 + 1
                local v47 = {}
                local v48 = vu4:FindFirstChild("Map")
                if v48 then
                    if v48:FindFirstChild("Foliage") then
                        local v49, v50, v51 = ipairs(v48.Foliage:GetChildren())
                        while true do
                            local v52
                            v51, v52 = v49(v50, v51)
                            if v51 == nil then
                                break
                            end
                            if v52:IsA("Model") and v52.Name == "Small Tree" then
                                table.insert(v47, v52)
                            end
                        end
                    end
                    if v48:FindFirstChild("Landmarks") then
                        local v53, v54, v55 = ipairs(v48.Landmarks:GetChildren())
                        while true do
                            local v56
                            v55, v56 = v53(v54, v55)
                            if v55 == nil then
                                break
                            end
                            if v56:IsA("Model") and v56.Name == "Small Tree" then
                                table.insert(v47, v56)
                            end
                        end
                    end
                end
                local v57, v58, v59 = ipairs(v47)
                while true do
                    local vu60
                    v59, vu60 = v57(v58, v59)
                    if v59 == nil then
                        break
                    end
                    local v61 = vu60:FindFirstChild("Trunk")
                    if v61 and (v61:IsA("BasePart") and (v61.Position - v44.Position).Magnitude <= vu8) then
                        local vu62 = false
                        task.spawn(function()
                            while vu7 and (vu60 and (vu60.Parent and not vu62)) do
                                vu62 = true
                                vu9 = vu9 + 1
                                pcall(function()
                                    vu3:WaitForChild("RemoteEvents").ToolDamageObject:InvokeServer(vu60, vu45, tostring(vu9) .. "_7367831688", CFrame.new(- 2.962610244751, 4.5547881126404, - 75.950843811035, 0.89621275663376, - 1.3894891459643e-8, 0.44362446665764, - 7.994568895775e-10, 1, 3.293635941759e-8, - 0.44362446665764, - 2.9872644802253e-8, 0.89621275663376))
                                end)
                                task.wait(0.5)
                            end
                        end)
                    end
                end
                task.wait(0.1)
            else
                task.wait(1)
            end
        else
            task.wait(0.5)
        end
    end
end
function wiki(p64)
    local v65, v66, v67 = ipairs(vu4.Items:GetChildren())
    local v68 = 0
    while true do
        local v69
        v67, v69 = v65(v66, v67)
        if v67 == nil then
            break
        end
        if v69.Name == p64 then
            v68 = v68 + 1
        end
    end
    return v68
end
function ghn()
    return math.floor(vu5.PlayerGui.Interface.StatBars.HungerBar.Bar.Size.X.Scale * 100)
end
function feed(p70)
    local v71, v72, v73 = ipairs(vu4.Items:GetChildren())
    while true do
        local v74
        v73, v74 = v71(v72, v73)
        if v73 == nil then
            break
        end
        if v74.Name == p70 then
            vu3.RemoteEvents.RequestConsumeItem:InvokeServer(v74)
            break
        end
    end
end
function notifeed(_)
    vu1:Notify({
        Title = "Auto Food Paused",
        Content = "The food is gone",
        Duration = 3
    })
end
local function vu78(pu75, pu76)
    if pu75 and (pu75:IsDescendantOf(workspace) and (pu75:IsA("BasePart") or pu75:IsA("Model"))) then
        local vu77
        if pu75:IsA("Model") then
            vu77 = pu75.PrimaryPart or pu75:FindFirstChildWhichIsA("BasePart") or (pu75:FindFirstChild("Handle") or pu75)
        else
            vu77 = pu75
        end
        if vu77 and vu77:IsA("BasePart") then
            if pu75:IsA("Model") and not pu75.PrimaryPart then
                pcall(function()
                    pu75.PrimaryPart = vu77
                end)
            end
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents").RequestStartDraggingItem:FireServer(pu75)
                if pu75:IsA("Model") then
                    pu75:SetPrimaryPartCFrame(CFrame.new(pu76))
                else
                    vu77.CFrame = CFrame.new(pu76)
                end
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents").StopDraggingItem:FireServer(pu75)
            end)
        end
    else
        return
    end
end
local function vu86()
    local v79, v80, v81 = ipairs(workspace:WaitForChild("Items"):GetChildren())
    local v82 = {}
    local v83 = {}
    local v84 = 1
    while true do
        local v85
        v81, v85 = v79(v80, v81)
        if v81 == nil then
            break
        end
        if v85.Name:match("^Item Chest") and not v85:GetAttribute("8721081708Opened") then
            table.insert(v82, v85)
            table.insert(v83, "Chest " .. v84)
            v84 = v84 + 1
        end
    end
    return v82, v83
end
local vu87, vu88 = vu86()
local vu89 = vu88[1] or nil
local function vu97()
    local v90, v91, v92 = ipairs(workspace:WaitForChild("Characters"):GetChildren())
    local v93 = {}
    local v94 = {}
    local v95 = 1
    while true do
        local v96
        v92, v96 = v90(v91, v92)
        if v92 == nil then
            break
        end
        if v96.Name:match("^Lost Child") and v96:GetAttribute("Lost") == true then
            table.insert(v93, v96)
            table.insert(v94, v96.Name)
            v95 = v95 + 1
        end
    end
    return v93, v94
end
local vu98, vu99 = vu97()
local vu100 = vu99[1] or nil
function tp1()
    (game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(0.43132782, 15.77634621, - 1.88620758, - 0.270917892, 0.102997094, 0.957076371, 0.639657021, 0.762253821, 0.0990355015, - 0.719334781, 0.639031112, - 0.272391081)
end
local function vu104()
    local v101 = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Landmarks") and (workspace.Map.Landmarks:FindFirstChild("Stronghold") and workspace.Map.Landmarks.Stronghold:FindFirstChild("Functional") and (workspace.Map.Landmarks.Stronghold.Functional:FindFirstChild("EntryDoors") and workspace.Map.Landmarks.Stronghold.Functional.EntryDoors:FindFirstChild("DoorRight")))
    if v101 then
        v101 = workspace.Map.Landmarks.Stronghold.Functional.EntryDoors.DoorRight:FindFirstChild("Model")
    end
    if v101 then
        local v102 = v101:GetChildren()[5]
        if v102 and v102:IsA("BasePart") then
            local v103 = game.Players.LocalPlayer.Character
            if v103 then
                v103 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
            if v103 then
                v103.CFrame = v102.CFrame + Vector3.new(0, 5, 0)
            end
        end
    end
end
local vu105 = false
local vu106 = 1
local vu107 = false
local vu108 = nil
local vu109 = nil
local vu110 = nil
local vu111 = nil
local vu112 = game:GetService("UserInputService")
local function vu124()
    repeat
        task.wait()
    until vu2.LocalPlayer and vu2.LocalPlayer.Character and (vu2.LocalPlayer.Character:WaitForChild("HumanoidRootPart") and vu2.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
    repeat
        task.wait()
    until vu112
    if vu108 or vu109 then
        vu108:Disconnect()
        vu109:Disconnect()
    end
    local vu113 = vu2.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local vu114 = {
        F = 0,
        B = 0,
        L = 0,
        R = 0,
        Q = 0,
        E = 0
    }
    local vu115 = {
        F = 0,
        B = 0,
        L = 0,
        R = 0,
        Q = 0,
        E = 0
    }
    local vu116 = vu106
    local function v119()
        vu107 = true
        local vu117 = Instance.new("BodyGyro")
        local vu118 = Instance.new("BodyVelocity")
        vu117.P = 90000
        vu117.Parent = vu113
        vu118.Parent = vu113
        vu117.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
        vu117.CFrame = vu113.CFrame
        vu118.Velocity = Vector3.new(0, 0, 0)
        vu118.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
        task.spawn(function()
            while vu107 do
                task.wait()
                if not vu105 and vu2.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    vu2.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                end
                if vu114.L + vu114.R ~= 0 or (vu114.F + vu114.B ~= 0 or vu114.Q + vu114.E ~= 0) then
                    vu116 = vu106
                elseif vu114.L + vu114.R == 0 and (vu114.F + vu114.B == 0 and (vu114.Q + vu114.E == 0 and vu116 ~= 0)) then
                    vu116 = 0
                end
                if vu114.L + vu114.R ~= 0 or (vu114.F + vu114.B ~= 0 or vu114.Q + vu114.E ~= 0) then
                    vu118.Velocity = (workspace.CurrentCamera.CoordinateFrame.lookVector * (vu114.F + vu114.B) + (workspace.CurrentCamera.CoordinateFrame * CFrame.new(vu114.L + vu114.R, (vu114.F + vu114.B + vu114.Q + vu114.E) * 0.2, 0).p - workspace.CurrentCamera.CoordinateFrame.p)) * vu116
                    vu115 = {
                        F = vu114.F,
                        B = vu114.B,
                        L = vu114.L,
                        R = vu114.R
                    }
                elseif vu114.L + vu114.R ~= 0 or (vu114.F + vu114.B ~= 0 or (vu114.Q + vu114.E ~= 0 or vu116 == 0)) then
                    vu118.Velocity = Vector3.new(0, 0, 0)
                else
                    vu118.Velocity = (workspace.CurrentCamera.CoordinateFrame.lookVector * (vu115.F + vu115.B) + (workspace.CurrentCamera.CoordinateFrame * CFrame.new(vu115.L + vu115.R, (vu115.F + vu115.B + vu114.Q + vu114.E) * 0.2, 0).p - workspace.CurrentCamera.CoordinateFrame.p)) * vu116
                end
                vu117.CFrame = workspace.CurrentCamera.CoordinateFrame
            end
            vu114 = {
                F = 0,
                B = 0,
                L = 0,
                R = 0,
                Q = 0,
                E = 0
            }
            vu115 = {
                F = 0,
                B = 0,
                L = 0,
                R = 0,
                Q = 0,
                E = 0
            }
            vu116 = 0
            vu117:Destroy()
            vu118:Destroy()
            if vu2.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                vu2.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
            end
        end)
    end
    vu108 = vu112.InputBegan:Connect(function(p120)
        if p120.UserInputType == Enum.UserInputType.Keyboard then
            local v121 = p120.KeyCode.Name
            if v121 == "W" then
                vu114.F = vu106
            elseif v121 == "S" then
                vu114.B = - vu106
            elseif v121 == "A" then
                vu114.L = - vu106
            elseif v121 == "D" then
                vu114.R = vu106
            elseif v121 == "E" then
                vu114.Q = vu106 * 2
            elseif v121 == "Q" then
                vu114.E = - vu106 * 2
            end
            pcall(function()
                workspace.CurrentCamera.CameraType = Enum.CameraType.Track
            end)
        end
    end)
    vu109 = vu112.InputEnded:Connect(function(p122)
        if p122.UserInputType == Enum.UserInputType.Keyboard then
            local v123 = p122.KeyCode.Name
            if v123 == "W" then
                vu114.F = 0
            elseif v123 == "S" then
                vu114.B = 0
            elseif v123 == "A" then
                vu114.L = 0
            elseif v123 == "D" then
                vu114.R = 0
            elseif v123 == "E" then
                vu114.Q = 0
            elseif v123 == "Q" then
                vu114.E = 0
            end
        end
    end)
    v119()
end
local function vu125()
    vu107 = false
    if vu108 then
        vu108:Disconnect()
    end
    if vu109 then
        vu109:Disconnect()
    end
    if vu110 then
        vu110:Disconnect()
    end
    if vu111 then
        vu111:Disconnect()
    end
    if vu2.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        vu2.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
    end
    pcall(function()
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end)
end
local function vu127()
    pcall(function()
        vu107 = false
        local v126 = vu2.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        if v126:FindFirstChild("BodyVelocity") then
            v126:FindFirstChild("BodyVelocity"):Destroy()
        end
        if v126:FindFirstChild("BodyGyro") then
            v126:FindFirstChild("BodyGyro"):Destroy()
        end
        if vu2.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
            vu2.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
        end
        if vu110 then
            vu110:Disconnect()
        end
        if vu111 then
            vu111:Disconnect()
        end
    end)
end
local function vu143()
    vu127()
    vu107 = true
    local vu128 = vu2.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local vu129 = workspace.CurrentCamera
    local vu130 = Vector3.new()
    local vu131 = Vector3.new(0, 0, 0)
    local vu132 = Vector3.new(9000000000, 9000000000, 9000000000)
    local vu133 = require(vu2.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
    local v134 = Instance.new("BodyVelocity")
    v134.Name = "BodyVelocity"
    v134.Parent = vu128
    v134.MaxForce = vu131
    v134.Velocity = vu131
    local v135 = Instance.new("BodyGyro")
    v135.Name = "BodyGyro"
    v135.Parent = vu128
    v135.MaxTorque = vu132
    v135.P = 1000
    v135.D = 50
    vu110 = vu2.LocalPlayer.CharacterAdded:Connect(function()
        local v136 = vu2.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local v137 = Instance.new("BodyVelocity")
        v137.Name = "BodyVelocity"
        v137.Parent = v136
        v137.MaxForce = vu131
        v137.Velocity = vu131
        local v138 = Instance.new("BodyGyro")
        v138.Name = "BodyGyro"
        v138.Parent = v136
        v138.MaxTorque = vu132
        v138.P = 1000
        v138.D = 50
    end)
    vu111 = game:GetService("RunService").RenderStepped:Connect(function()
        vu128 = vu2.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        vu129 = workspace.CurrentCamera
        if vu2.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and vu128 and (vu128:FindFirstChild("BodyVelocity") and vu128:FindFirstChild("BodyGyro")) then
            local v139 = vu2.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            local v140 = vu128:FindFirstChild("BodyVelocity")
            local v141 = vu128:FindFirstChild("BodyGyro")
            v140.MaxForce = vu132
            v141.MaxTorque = vu132
            v139.PlatformStand = true
            v141.CFrame = vu129.CoordinateFrame
            v140.Velocity = vu130
            local v142 = vu133:GetMoveVector()
            if v142.X > 0 then
                v140.Velocity = v140.Velocity + vu129.CFrame.RightVector * (v142.X * (vu106 * 50))
            end
            if v142.X < 0 then
                v140.Velocity = v140.Velocity + vu129.CFrame.RightVector * (v142.X * (vu106 * 50))
            end
            if v142.Z > 0 then
                v140.Velocity = v140.Velocity - vu129.CFrame.LookVector * (v142.Z * (vu106 * 50))
            end
            if v142.Z < 0 then
                v140.Velocity = v140.Velocity - vu129.CFrame.LookVector * (v142.Z * (vu106 * 50))
            end
        end
    end)
end
local v144 = vu1
local v145 = vu1.CreateWindow(v144, {
    Title = "99 Night in Forest | VexonHub",
    Icon = "star",
    IconThemed = true,
    Author = "VexonHub",
    Folder = "vexonhub",
    Size = UDim2.fromOffset(500, 350),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    ScrollBarEnabled = true
})
v145:EditOpenButton({
    Title = "Open 99 Night in Forest",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(255, 255, 255)),
    Draggable = true
})
local vu146 = {
    Combat = v145:Tab({
        Title = "Combat",
        Icon = "sword",
        Desc = "VexonHub"
    }),
    Main = v145:Tab({
        Title = "Main",
        Icon = "eye",
        Desc = "VexonHub"
    }),
    Auto = v145:Tab({
        Title = "Auto",
        Icon = "wrench",
        Desc = "VexonHub"
    }),
    esp = v145:Tab({
        Title = "Esp",
        Icon = "sparkles",
        Desc = "VexonHub"
    }),
    br = v145:Tab({
        Title = "Bring",
        Icon = "package",
        Desc = "VexonHub"
    }),
    Tp = v145:Tab({
        Title = "Teleport",
        Icon = "map",
        Desc = "VexonHub"
    }),
    Fly = v145:Tab({
        Title = "Player",
        Icon = "user",
        Desc = "VexonHub"
    }),
    About = v145:Tab({
        Title = "About",
        Icon = "package",
        Desc = "VexonHub"
    })
}
v145:SelectTab(1)
vu146.Combat:Section({
    Title = "Aura",
    Icon = "star"
})
vu146.Combat:Toggle({
    Title = "Kill Aura",
    Value = false,
    Callback = function(p147)
        vu6 = p147
        if p147 then
            task.spawn(vu43)
        else
            local v148, _ = vu30(false)
            vu34(v148)
        end
    end
})
vu146.Combat:Toggle({
    Title = "Chop Aura",
    Value = false,
    Callback = function(p149)
        vu7 = p149
        if p149 then
            task.spawn(vu63)
        else
            local v150, _ = vu30(true)
            vu34(v150)
        end
    end
})
vu146.Combat:Section({
    Title = "Settings",
    Icon = "settings"
})
vu146.Combat:Slider({
    Title = "Aura Radius",
    Value = {
        Min = 50,
        Max = 500,
        Default = 50
    },
    Callback = function(p151)
        vu8 = math.clamp(p151, 10, 500)
    end
})
vu146.Main:Section({
    Title = "Auto Feed",
    Icon = "utensils"
})
vu146.Main:Dropdown({
    Title = "Select Food",
    Desc = "Choose the food",
    Values = {
        "Apple",
        "Berry",
        "Carrot",
        "Cake",
        "Chili",
        "Cooked Morsel",
        "Cooked Steak"
    },
    Value = vu12,
    Multi = false,
    Callback = function(p152)
        vu12 = p152
    end
})
vu146.Main:Input({
    Title = "Feed %",
    Desc = "Eat when hunger reaches this %",
    Value = tostring(vu13),
    Placeholder = "Ex: 75",
    Numeric = true,
    Callback = function(p153)
        local v154 = tonumber(p153)
        if v154 then
            vu13 = math.clamp(v154, 0, 100)
        end
    end
})
vu146.Main:Toggle({
    Title = "Auto Feed",
    Value = false,
    Callback = function(p155)
        vu11 = p155
        if p155 then
            task.spawn(function()
                while vu11 do
                    task.wait(0.075)
                    if wiki(vu12) == 0 then
                        vu11 = false
                        vu146.Combat:Find("Auto Feed"):SetValue(false)
                        notifeed(vu12)
                        break
                    end
                    if ghn() <= vu13 then
                        feed(vu12)
                    end
                end
            end)
        end
    end
})
vu146.Auto:Section({
    Title = "Auto Upgrade Campfire",
    Icon = "flame"
})
local vu156 = false
vu146.Auto:Dropdown({
    Title = "Auto Upgrade Campfire",
    Desc = "Choose the items",
    Values = vu19,
    Multi = true,
    AllowNone = true,
    Callback = function(p157)
        local v158, v159, v160 = ipairs(vu19)
        while true do
            local v161
            v160, v161 = v158(v159, v160)
            if v160 == nil then
                break
            end
            vu14[v161] = table.find(p157, v161) ~= nil
        end
    end
})
vu146.Auto:Toggle({
    Title = "Auto Upgrade Campfire",
    Value = false,
    Callback = function(p162)
        vu156 = p162
        if p162 then
            task.spawn(function()
                while vu156 do
                    local v163, v164, v165 = pairs(vu14)
                    while true do
                        local v166
                        v165, v166 = v163(v164, v165)
                        if v165 == nil then
                            break
                        end
                        if v166 then
                            local v167, v168, v169 = ipairs(workspace:WaitForChild("Items"):GetChildren())
                            local v170 = v165
                            while true do
                                local v171
                                v169, v171 = v167(v168, v169)
                                if v169 == nil then
                                    break
                                end
                                if v171.Name == v170 then
                                    vu78(v171, vu20)
                                end
                            end
                        end
                    end
                    task.wait(2)
                end
            end)
        end
    end
})
vu146.Auto:Section({
    Title = "Auto Cook Food",
    Icon = "flame"
})
vu146.Auto:Dropdown({
    Title = "Auto Cook Food",
    Values = vu21,
    Multi = true,
    AllowNone = true,
    Callback = function(p172)
        local v173, v174, v175 = ipairs(vu21)
        while true do
            local v176
            v175, v176 = v173(v174, v175)
            if v175 == nil then
                break
            end
            vu22[v176] = table.find(p172, v176) ~= nil
        end
    end
})
vu146.Auto:Toggle({
    Title = "Auto Cook Food",
    Value = false,
    Callback = function(p177)
        vu23 = p177
    end
})
coroutine.wrap(function()
    while true do
        if vu23 then
            local v178, v179, v180 = pairs(vu22)
            while true do
                local v181
                v180, v181 = v178(v179, v180)
                if v180 == nil then
                    break
                end
                if v181 then
                    local v182, v183, v184 = ipairs(vu4:WaitForChild("Items"):GetChildren())
                    local v185 = v180
                    while true do
                        local v186
                        v184, v186 = v182(v183, v184)
                        if v184 == nil then
                            break
                        end
                        if v186.Name == v185 then
                            vu78(v186, vu20)
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)()
vu146.Tp:Section({
    Title = "Teleport",
    Icon = "map"
})
vu146.Tp:Button({
    Title = "Teleport to Campfire",
    Locked = false,
    Callback = function()
        tp1()
    end
})
vu146.Tp:Button({
    Title = "Teleport to Stronghold",
    Locked = false,
    Callback = function()
        vu104()
    end
})
vu146.Tp:Section({
    Title = "Children",
    Icon = "eye"
})
local vu188 = vu146.Tp:Dropdown({
    Title = "Select Child",
    Values = vu99,
    Multi = false,
    AllowNone = true,
    Callback = function(p187)
        vu100 = p187[# p187] or vu99[1] or nil
    end
})
vu146.Tp:Button({
    Title = "Refresh List",
    Locked = false,
    Callback = function()
        local v189, v190 = vu97()
        vu99 = v190
        vu98 = v189
        if # vu99 <= 0 then
            vu100 = nil
            vu188:Refresh({
                "No child found"
            })
        else
            vu100 = vu99[1]
            vu188:Refresh(vu99)
        end
    end
})
vu146.Tp:Button({
    Title = "Teleport to Child",
    Locked = false,
    Callback = function()
        if vu100 and vu98 then
            local v191, v192, v193 = ipairs(vu99)
            while true do
                local v194
                v193, v194 = v191(v192, v193)
                if v193 == nil then
                    break
                end
                if v194 == vu100 then
                    local v195 = vu98[v193]
                    if v195 then
                        local v196 = v195.PrimaryPart or v195:FindFirstChildWhichIsA("BasePart")
                        local v197 = v196 and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if v197 then
                            v197.CFrame = v196.CFrame + Vector3.new(0, 5, 0)
                        end
                    end
                    break
                end
            end
        end
    end
})
vu146.Tp:Section({
    Title = "Chest",
    Icon = "box"
})
local vu199 = vu146.Tp:Dropdown({
    Title = "Select Chest",
    Values = vu88,
    Multi = false,
    AllowNone = true,
    Callback = function(p198)
        vu89 = p198[# p198] or vu88[1] or nil
    end
})
vu146.Tp:Button({
    Title = "Refresh List",
    Locked = false,
    Callback = function()
        local v200, v201 = vu86()
        vu88 = v201
        vu87 = v200
        if # vu88 <= 0 then
            vu89 = nil
            vu199:Refresh({
                "No chests found"
            })
        else
            vu89 = vu88[1]
            vu199:Refresh(vu88)
        end
    end
})
vu146.Tp:Button({
    Title = "Teleport to Chest",
    Locked = false,
    Callback = function()
        if vu89 and vu87 then
            local v202, v203, v204 = ipairs(vu88)
            local v205 = 1
            while true do
                local v206
                v204, v206 = v202(v203, v204)
                if v204 == nil then
                    v204 = v205
                    break
                end
                if v206 == vu89 then
                    break
                end
            end
            local v207 = vu87[v204]
            if v207 then
                local v208 = v207.PrimaryPart or v207:FindFirstChildWhichIsA("BasePart")
                local v209 = v208 and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if v209 then
                    v209.CFrame = v208.CFrame + Vector3.new(0, 5, 0)
                end
            end
        end
    end
})
vu146.br:Section({
    Title = "Junk",
    Icon = "box"
})
vu146.br:Dropdown({
    Title = "Select Junk Items",
    Desc = "Choose items to bring",
    Values = {
        "Tyre",
        "Bolt",
        "Broken Fan",
        "Broken Microwave",
        "Sheet Metal",
        "Old Radio",
        "Washing Machine",
        "Old Car Engine"
    },
    Multi = true,
    AllowNone = true,
    Callback = function(p210)
        vu17 = p210
    end
})
vu146.br:Button({
    Title = "Bring Junk Items",
    Locked = false,
    Callback = function()
        local v211 = game.Players.LocalPlayer
        if v211.Character and v211.Character:FindFirstChild("HumanoidRootPart") then
            local v212 = v211.Character.HumanoidRootPart.Position + Vector3.new(2, 0, 0)
            local v213, v214, v215 = ipairs(vu17)
            while true do
                local v216
                v215, v216 = v213(v214, v215)
                if v215 == nil then
                    break
                end
                local v217, v218, v219 = ipairs(workspace:GetDescendants())
                while true do
                    local v220
                    v219, v220 = v217(v218, v219)
                    if v219 == nil then
                        break
                    end
                    if v220.Name == v216 and (v220:IsA("BasePart") or v220:IsA("Model")) and (v220.PrimaryPart or v220:FindFirstChildWhichIsA("BasePart")) then
                        vu78(v220, v212)
                    end
                end
            end
        end
    end
})
vu146.br:Section({
    Title = "Fuel",
    Icon = "flame"
})
local vu221 = {}
vu146.br:Dropdown({
    Title = "Select Fuel Items",
    Desc = "Choose items to bring",
    Values = {
        "Log",
        "Chair",
        "Coal",
        "Fuel Canister",
        "Oil Barrel"
    },
    Multi = true,
    AllowNone = true,
    Callback = function(p222)
        vu221 = p222
    end
})
vu146.br:Button({
    Title = "Bring Fuel Items",
    Locked = false,
    Callback = function()
        local v223 = game.Players.LocalPlayer
        if v223.Character and v223.Character:FindFirstChild("HumanoidRootPart") then
            local v224 = v223.Character.HumanoidRootPart.Position + Vector3.new(2, 0, 0)
            local v225, v226, v227 = ipairs(vu221)
            local v228 = 0
            while true do
                local v229
                v227, v229 = v225(v226, v227)
                if v227 == nil then
                    break
                end
                local v230, v231, v232 = ipairs(workspace:GetDescendants())
                while true do
                    local v233
                    v232, v233 = v230(v231, v232)
                    if v232 == nil then
                        break
                    end
                    if v233.Name == v229 and (v233:IsA("BasePart") or v233:IsA("Model")) then
                        vu78(v233, v224)
                        v228 = v228 + 1
                    end
                end
            end
        end
    end
})
vu146.br:Section({
    Title = "Food",
    Icon = "utensils"
})
local vu234 = {}
vu146.br:Dropdown({
    Title = "Select Food Items",
    Desc = "Choose items to bring",
    Values = {
        "Cake",
        "Cooked Steak",
        "Cooked Morsel",
        "Steak",
        "Morsel",
        "Berry",
        "Carrot"
    },
    Multi = true,
    AllowNone = true,
    Callback = function(p235)
        vu234 = p235
    end
})
vu146.br:Button({
    Title = "Bring Food Items",
    Locked = false,
    Callback = function()
        local v236 = game.Players.LocalPlayer
        if v236.Character and v236.Character:FindFirstChild("HumanoidRootPart") then
            local v237 = v236.Character.HumanoidRootPart.Position + Vector3.new(2, 0, 0)
            local v238, v239, v240 = ipairs(vu234)
            while true do
                local v241
                v240, v241 = v238(v239, v240)
                if v240 == nil then
                    break
                end
                local v242, v243, v244 = ipairs(workspace:GetDescendants())
                while true do
                    local v245
                    v244, v245 = v242(v243, v244)
                    if v244 == nil then
                        break
                    end
                    if v245.Name == v241 and (v245:IsA("BasePart") or v245:IsA("Model")) and (v245.PrimaryPart or v245:FindFirstChildWhichIsA("BasePart")) then
                        vu78(v245, v237)
                    end
                end
            end
        end
    end
})
vu146.br:Section({
    Title = "Medicine",
    Icon = "bandage"
})
vu146.br:Dropdown({
    Title = "Select Medical Items",
    Desc = "Choose items to bring",
    Values = {
        "Bandage",
        "MedKit"
    },
    Multi = true,
    AllowNone = true,
    Callback = function(p246)
        vu18 = p246
    end
})
vu146.br:Button({
    Title = "Bring Medical Items",
    Locked = false,
    Callback = function()
        local v247 = game.Players.LocalPlayer
        if v247.Character and v247.Character:FindFirstChild("HumanoidRootPart") then
            local v248 = v247.Character.HumanoidRootPart.Position + Vector3.new(2, 0, 0)
            local v249, v250, v251 = ipairs(vu18)
            while true do
                local v252
                v251, v252 = v249(v250, v251)
                if v251 == nil then
                    break
                end
                local v253, v254, v255 = ipairs(workspace:GetDescendants())
                while true do
                    local v256
                    v255, v256 = v253(v254, v255)
                    if v255 == nil then
                        break
                    end
                    if v256.Name == v252 and (v256:IsA("BasePart") or v256:IsA("Model")) and (v256.PrimaryPart or v256:FindFirstChildWhichIsA("BasePart")) then
                        vu78(v256, v248)
                    end
                end
            end
        end
    end
})
vu146.br:Section({
    Title = "Equipment",
    Icon = "sword"
})
local vu257 = {}
vu146.br:Dropdown({
    Title = "Select Equipment Items",
    Desc = "Choose items to bring",
    Values = {
        "Revolver",
        "Rifle",
        "Leather Body",
        "Iron Body",
        "Revolver Ammo",
        "Rifle Ammo",
        "Giant Sack",
        "Good Sack",
        "Strong Axe",
        "Good Axe"
    },
    Multi = true,
    AllowNone = true,
    Callback = function(p258)
        vu257 = p258
    end
})
vu146.br:Button({
    Title = "Bring Equipment Items",
    Locked = false,
    Callback = function()
        local v259 = game.Players.LocalPlayer
        if v259.Character and v259.Character:FindFirstChild("HumanoidRootPart") then
            local v260 = v259.Character.HumanoidRootPart.Position + Vector3.new(2, 0, 0)
            local v261, v262, v263 = ipairs(vu257)
            while true do
                local v264
                v263, v264 = v261(v262, v263)
                if v263 == nil then
                    break
                end
                local v265, v266, v267 = ipairs(workspace:GetDescendants())
                while true do
                    local v268
                    v267, v268 = v265(v266, v267)
                    if v267 == nil then
                        break
                    end
                    if v268.Name == v264 and (v268:IsA("BasePart") or v268:IsA("Model")) and (v268.PrimaryPart or v268:FindFirstChildWhichIsA("BasePart")) then
                        vu78(v268, v260)
                    end
                end
            end
        end
    end
})
vu146.Fly:Section({
    Title = "Main",
    Icon = "eye"
})
vu146.Fly:Slider({
    Title = "Fly Speed",
    Value = {
        Min = 1,
        Max = 20,
        Default = 1
    },
    Callback = function(p269)
        vu106 = p269
        if vu107 then
            task.spawn(function()
                while vu107 do
                    task.wait(0.1)
                    if game:GetService("UserInputService").TouchEnabled then
                        local v270 = vu2.LocalPlayer.Character
                        if v270 then
                            v270 = vu2.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v270 and v270:FindFirstChild("BodyVelocity") then
                            local v271 = v270:FindFirstChild("BodyVelocity")
                            v271.Velocity = v271.Velocity.Unit * (vu106 * 50)
                        end
                    end
                end
            end)
        end
    end
})
vu146.Fly:Toggle({
    Title = "Enable Fly",
    Value = false,
    Callback = function(p272)
        vu105 = p272
        if vu105 then
            if game:GetService("UserInputService").TouchEnabled then
                vu143()
            else
                vu124()
            end
        else
            vu125()
            vu127()
        end
    end
})
local vu273 = game:GetService("Players")
local vu274 = 16
local function vu277(p275)
    local v276 = vu273.LocalPlayer.Character
    if v276 then
        v276 = vu273.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    end
    if v276 then
        v276.WalkSpeed = p275
    end
end
vu146.Fly:Slider({
    Title = "Speed",
    Value = {
        Min = 16,
        Max = 150,
        Default = 16
    },
    Callback = function(p278)
        vu274 = p278
    end
})
vu146.Fly:Toggle({
    Title = "Enable Speed",
    Value = false,
    Callback = function(p279)
        vu277(p279 and vu274 or 16)
    end
})
local vu280 = game:GetService("Players")
local vu281 = game:GetService("RunService")
local vu282 = nil
vu146.Fly:Toggle({
    Title = "Noclip",
    Value = false,
    Callback = function(p283)
        if p283 then
            vu282 = vu281.Stepped:Connect(function()
                local v284 = vu280.LocalPlayer.Character
                if v284 then
                    local v285, v286, v287 = ipairs(v284:GetDescendants())
                    while true do
                        local v288
                        v287, v288 = v285(v286, v287)
                        if v287 == nil then
                            break
                        end
                        if v288:IsA("BasePart") then
                            v288.CanCollide = false
                        end
                    end
                end
            end)
        elseif vu282 then
            vu282:Disconnect()
            vu282 = nil
        end
    end
})
local vu289 = game:GetService("UserInputService")
local vu290 = game:GetService("Players")
local vu291 = nil
vu146.Fly:Toggle({
    Title = "Inf Jump",
    Value = false,
    Callback = function(p292)
        if p292 then
            vu291 = vu289.JumpRequest:Connect(function()
                local v293 = vu290.LocalPlayer.Character
                if v293 then
                    v293 = v293:FindFirstChildOfClass("Humanoid")
                end
                if v293 then
                    v293:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        elseif vu291 then
            vu291:Disconnect()
            vu291 = nil
        end
    end
})
function createESPText(p294, p295, p296)
    if not p294:FindFirstChild("ESPTexto") then
        local v297 = Instance.new("BillboardGui")
        v297.Name = "ESPTexto"
        v297.Adornee = p294
        v297.Size = UDim2.new(0, 100, 0, 20)
        v297.StudsOffset = Vector3.new(0, 2.5, 0)
        v297.AlwaysOnTop = true
        v297.MaxDistance = 300
        local v298 = Instance.new("TextLabel")
        v298.Parent = v297
        v298.Size = UDim2.new(1, 0, 1, 0)
        v298.BackgroundTransparency = 1
        v298.Text = p295
        v298.TextColor3 = p296 or Color3.fromRGB(255, 255, 0)
        v298.TextStrokeTransparency = 0.2
        v298.TextScaled = true
        v298.Font = Enum.Font.GothamBold
        v297.Parent = p294
    end
end
local function vu308(p299, p300)
    local v301, v302
    if p300 == "item" then
        v301 = workspace:FindFirstChild("Items")
        v302 = Color3.fromRGB(0, 255, 0)
    else
        if p300 ~= "mob" then
            return
        end
        v301 = workspace:FindFirstChild("Characters")
        v302 = Color3.fromRGB(255, 255, 0)
    end
    if v301 then
        local v303, v304, v305 = ipairs(v301:GetChildren())
        while true do
            local v306
            v305, v306 = v303(v304, v305)
            if v305 == nil then
                break
            end
            if v306.Name == p299 then
                local v307 = v306:IsA("BasePart") and v306 and v306 or v306:FindFirstChildWhichIsA("BasePart")
                if v307 then
                    createESPText(v307, v306.Name, v302)
                end
            end
        end
    end
end
local function vu321(p309, p310)
    local v311
    if p310 == "item" then
        v311 = workspace:FindFirstChild("Items")
    else
        if p310 ~= "mob" then
            return
        end
        v311 = workspace:FindFirstChild("Characters")
    end
    if v311 then
        local v312, v313, v314 = ipairs(v311:GetChildren())
        while true do
            local v315
            v314, v315 = v312(v313, v314)
            if v314 == nil then
                break
            end
            if v315.Name == p309 then
                local v316 = v315:IsA("BasePart") and v315 and v315 or v315:FindFirstChildWhichIsA("BasePart")
                if v316 then
                    local v317, v318, v319 = ipairs(v316:GetChildren())
                    while true do
                        local v320
                        v319, v320 = v317(v318, v319)
                        if v319 == nil then
                            break
                        end
                        if v320:IsA("BillboardGui") and v320.Name == "ESPTexto" then
                            v320:Destroy()
                        end
                    end
                end
            end
        end
    end
end
local vu322 = {}
local vu323 = {}
local vu324 = false
local vu325 = false
local vu326 = {}
vu146.esp:Section({
    Title = "Esp Items",
    Icon = "package"
})
vu146.esp:Dropdown({
    Title = "Esp Items",
    Values = vu15,
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(p327)
        vu322 = p327
        if vu324 then
            local v328, v329, v330 = ipairs(vu15)
            while true do
                local v331
                v330, v331 = v328(v329, v330)
                if v330 == nil then
                    break
                end
                if table.find(vu322, v331) then
                    vu308(v331, "item")
                else
                    vu321(v331, "item")
                end
            end
        else
            local v332, v333, v334 = ipairs(vu15)
            while true do
                local v335
                v334, v335 = v332(v333, v334)
                if v334 == nil then
                    break
                end
                vu321(v335, "item")
            end
        end
    end
})
vu146.esp:Toggle({
    Title = "Enable Esp",
    Value = false,
    Callback = function(p336)
        vu324 = p336
        local v337, v338, v339 = ipairs(vu15)
        while true do
            local v340
            v339, v340 = v337(v338, v339)
            if v339 == nil then
                break
            end
            if p336 and table.find(vu322, v340) then
                vu308(v340, "item")
            else
                vu321(v340, "item")
            end
        end
        if p336 then
            local v341 = not vu326.Items and workspace:FindFirstChild("Items")
            if v341 then
                vu326.Items = v341.ChildAdded:Connect(function(p342)
                    local v343 = table.find(vu322, p342.Name) and (p342:IsA("BasePart") and p342 and p342 or p342:FindFirstChildWhichIsA("BasePart"))
                    if v343 then
                        createESP(v343, p342.Name, Color3.fromRGB(0, 255, 0))
                    end
                end)
            end
        elseif vu326.Items then
            vu326.Items:Disconnect()
            vu326.Items = nil
        end
    end
})
vu146.esp:Section({
    Title = "Esp Entity",
    Icon = "user"
})
vu146.esp:Dropdown({
    Title = "Esp Entity",
    Values = vu16,
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(p344)
        vu323 = p344
        if vu325 then
            local v345, v346, v347 = ipairs(vu16)
            while true do
                local v348
                v347, v348 = v345(v346, v347)
                if v347 == nil then
                    break
                end
                if table.find(vu323, v348) then
                    vu308(v348, "mob")
                else
                    vu321(v348, "mob")
                end
            end
        else
            local v349, v350, v351 = ipairs(vu16)
            while true do
                local v352
                v351, v352 = v349(v350, v351)
                if v351 == nil then
                    break
                end
                vu321(v352, "mob")
            end
        end
    end
})
vu146.esp:Toggle({
    Title = "Enable Esp",
    Value = false,
    Callback = function(p353)
        vu325 = p353
        local v354, v355, v356 = ipairs(vu16)
        while true do
            local v357
            v356, v357 = v354(v355, v356)
            if v356 == nil then
                break
            end
            if p353 and table.find(vu323, v357) then
                vu308(v357, "mob")
            else
                vu321(v357, "mob")
            end
        end
        if p353 then
            local v358 = not vu326.Mobs and workspace:FindFirstChild("Characters")
            if v358 then
                vu326.Mobs = v358.ChildAdded:Connect(function(p359)
                    local v360 = table.find(vu323, p359.Name) and (p359:IsA("BasePart") and p359 and p359 or p359:FindFirstChildWhichIsA("BasePart"))
                    if v360 then
                        createESP(v360, p359.Name, Color3.fromRGB(255, 255, 0))
                    end
                end)
            end
        elseif vu326.Mobs then
            vu326.Mobs:Disconnect()
            vu326.Mobs = nil
        end
    end
})
vu146.Main:Section({
    Title = "Misc",
    Icon = "settings"
})
local vu361 = false
local vu362 = nil
local vu363 = {}
vu146.Main:Toggle({
    Title = "Instant Interact",
    Value = false,
    Callback = function(p364)
        vu361 = p364
        if p364 then
            vu363 = {}
            vu362 = task.spawn(function()
                while vu361 do
                    local v365, v366, v367 = ipairs(workspace:GetDescendants())
                    while true do
                        local v368
                        v367, v368 = v365(v366, v367)
                        if v367 == nil then
                            break
                        end
                        if v368:IsA("ProximityPrompt") then
                            if vu363[v368] == nil then
                                vu363[v368] = v368.HoldDuration
                            end
                            v368.HoldDuration = 0
                        end
                    end
                    task.wait(0.5)
                end
            end)
        else
            if vu362 then
                vu361 = false
            end
            local v369, v370, v371 = pairs(vu363)
            while true do
                local v372
                v371, v372 = v369(v370, v371)
                if v371 == nil then
                    break
                end
                if v371 and v371:IsA("ProximityPrompt") then
                    v371.HoldDuration = v372
                end
            end
            vu363 = {}
        end
    end
})
local vu373 = game:GetService("RunService")
local vu374 = game:GetService("ReplicatedStorage")
local vu375 = nil
vu146.Main:Toggle({
    Title = "Auto Stun Deer",
    Value = false,
    Callback = function(p376)
        if p376 then
            vu375 = vu373.RenderStepped:Connect(function()
                pcall(function()
                    local v377 = vu374:FindFirstChild("RemoteEvents")
                    if v377 then
                        v377 = vu374.RemoteEvents:FindFirstChild("DeerHitByTorch")
                    end
                    local v378 = workspace:FindFirstChild("Characters")
                    if v378 then
                        v378 = workspace.Characters:FindFirstChild("Deer")
                    end
                    if v377 and v378 then
                        v377:InvokeServer(v378)
                    end
                end)
                task.wait(0.1)
            end)
        elseif vu375 then
            vu375:Disconnect()
            vu375 = nil
        end
    end
})
vu146.About:Button({
    Title = "Get Discord Link",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/Xm5sThnfsP")
    end
})
vu146.About:Button({
    Title = "Script Made By TheVex0n",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/Xm5sThnfsP")
    end
})