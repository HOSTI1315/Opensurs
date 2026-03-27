

if game:GetService("CoreGui"):FindFirstChild("ToraScript") then
    game:GetService("CoreGui").ToraScript:Destroy()
end
local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/librarynew", true))()
local v2 = v1:CreateWindow("Dead Rails")
v2:AddButton({
    text = "TP to End",
    flag = "END",
    callback = function()
        local v3 = CFrame.new(- 428.745911, 28.0728378, - 49040.9062)
        local v4 = game.Players.LocalPlayer.Character
        local v5 = v4:WaitForChild("Humanoid")
        local v6 = v4:WaitForChild("HumanoidRootPart")
        while not v5.Sit do
            v6.CFrame = v3
            task.wait()
        end
    end
})
v2:AddToggle({
    text = "Gun Aura (Kill Mobs)",
    flag = "toggle",
    state = false,
    callback = function(p7)
        _G.Gun = p7
        print("Gun: ", p7)
        if p7 then
            Gun()
        end
    end
})
function Gun()
    spawn(function()
        _G.Gun = true
        while _G.Gun do
            wait()
            pcall(function()
                local vu8 = game:GetService("Players").LocalPlayer;
                (function()
                    local v9 = math.huge
                    local v10, v11, v12 = ipairs(workspace:GetDescendants())
                    local v13 = nil
                    while true do
                        local v14
                        v12, v14 = v10(v11, v12)
                        if v12 == nil then
                            break
                        end
                        if v14.Name == "HumanoidRootPart" and v14.Parent:GetAttribute("EntityName") or v14.Name == "HumanoidRootPart" and v14.Parent:GetAttribute("Bounty") then
                            local v15 = v14.Parent:FindFirstChild("Humanoid")
                            if v15 and v15.Health > 0 then
                                local v16 = vu8:DistanceFromCharacter(v14.Position)
                                if v16 < v9 then
                                    v13 = v14
                                    v9 = v16
                                end
                            end
                        end
                    end
                    if v13 then
                        local v17 = {
                            workspace:GetServerTimeNow(),
                            vu8.Character:FindFirstChildOfClass("Tool"),
                            v13.CFrame * CFrame.Angles(- 1.794655442237854, 0.22748638689517975, 2.360928773880005),
                            {
                                ["4"] = v13.Parent:FindFirstChild("Humanoid"),
                                ["2"] = v13.Parent:FindFirstChild("Humanoid")
                            }
                        }
                        game:GetService("ReplicatedStorage").Remotes.Weapon.Shoot:FireServer(unpack(v17))
                        local v18 = {
                            workspace:GetServerTimeNow(),
                            vu8.Character:FindFirstChildOfClass("Tool")
                        }
                        game:GetService("ReplicatedStorage").Remotes.Weapon.Reload:FireServer(unpack(v18))
                    end
                    return v13
                end)()
                wait(0.2)
            end)
        end
    end)
end
v2:AddToggle({
    text = "Collect Bond & Ammo",
    flag = "toggle",
    state = false,
    callback = function(p19)
        _G.Collect = p19
        print("Collect: ", p19)
        if p19 then
            Collect()
        end
    end
})
function Collect()
    spawn(function()
        _G.Collect = true
        while _G.Collect do
            wait()
            pcall(function()
                local v20, v21, v22 = pairs(workspace.RuntimeItems:GetChildren())
                while true do
                    local v23
                    v22, v23 = v20(v21, v22)
                    if v22 == nil then
                        break
                    end
                    if v23:GetAttribute("ActivateText") == "Collect Bond" or v23:GetAttribute("ActivateText") == "Collect" then
                        game:GetService("ReplicatedStorage").Shared.Network.RemotePromise.Remotes.C_ActivateObject:FireServer(unpack({
                            v23
                        }))
                    end
                end
                wait(1)
            end)
        end
    end)
end
v2:AddButton({
    text = "TP to Castle",
    flag = "button",
    callback = function()
        local v24 = tick()
        local v25 = CFrame.new(248, 24, - 9059)
        while tick() - v24 < 1 do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v25
            task.wait()
        end
        local v26 = tick()
        local v27 = CFrame.new(workspace.RuntimeItems.MaximGun.VehicleSeat.Position)
        while tick() - v26 < 3 do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v27
            workspace.RuntimeItems.MaximGun.VehicleSeat.Disabled = false
            task.wait()
        end
    end
})
v2:AddButton({
    text = "TP to TeslaLab",
    flag = "button",
    callback = function()
        local v40, _ = pcall(function()
            local v28 = tick()
            local v29 = CFrame.new(workspace.TeslaLab.Generator.Generator.Position)
            while tick() - v28 < 1 do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v29
                task.wait()
            end
            local v30 = workspace.TeslaLab.Generator.Generator.Position
            local v31 = math.huge
            local v32, v33, v34 = pairs(workspace:GetDescendants())
            local v35 = nil
            while true do
                local v36
                v34, v36 = v32(v33, v34)
                if v34 == nil then
                    break
                end
                if v36:IsA("Seat") then
                    local v37 = (v36.Position - v30).Magnitude
                    if v37 < v31 then
                        v35 = v36
                        v31 = v37
                    end
                end
            end
            local v38 = v35 and v35.CFrame or CFrame.new()
            local v39 = tick()
            while tick() - v39 < 3 do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v38
                workspace.RuntimeItems.Chair.Seat.Disabled = false
                task.wait()
            end
        end)
        if not v40 then
            local v41 = game:GetService("Players")
            local v42 = game:GetService("TweenService")
            local v43 = v41.LocalPlayer
            local v44 = v43.Character or v43.CharacterAdded:Wait()
            local vu45 = v44:WaitForChild("HumanoidRootPart")
            local vu46 = v44:WaitForChild("Humanoid")
            local v47 = CFrame.new(- 424, 30, - 49041)
            local vu48 = v42:Create(vu45, TweenInfo.new(50, Enum.EasingStyle.Linear), {
                CFrame = v47
            })
            local vu49 = true
            vu45.CFrame = CFrame.new(56, 3, 29760)
            local v50 = vu48
            vu48.Play(v50)
            task.spawn(function()
                while vu49 do
                    local v51 = workspace:FindFirstChild("RuntimeItems")
                    if v51 then
                        v51 = workspace.RuntimeItems:FindFirstChild("BrainJar", true)
                    end
                    local v52, v53, v54 = pairs(workspace.RuntimeItems:GetDescendants())
                    local v55 = false
                    while true do
                        local v56
                        v54, v56 = v52(v53, v54)
                        if v54 == nil then
                            break
                        end
                        if v56.Name == "Jar" then
                            v55 = true
                            break
                        end
                    end
                    if v55 and (v51 and v51:FindFirstChild("Brain")) and v51.Brain:FindFirstChild("Jar") then
                        vu48:Cancel()
                        vu49 = false
                        local v57 = v51.Brain.Jar.Position
                        local v58 = math.huge
                        local v59, v60, v61 = pairs(workspace.RuntimeItems:GetDescendants())
                        local v62 = nil
                        while true do
                            local v63
                            v61, v63 = v59(v60, v61)
                            if v61 == nil then
                                break
                            end
                            if v63:IsA("Seat") then
                                local v64 = (v63.Position - v57).Magnitude
                                if v64 < v58 then
                                    v62 = v63
                                    v58 = v64
                                end
                            end
                        end
                        if not v62 then
                            break
                        end
                        local v65 = CFrame.new(v62.Position)
                        local v66 = tick()
                        while tick() - v66 < 3 do
                            vu45.CFrame = v65
                            v62.Disabled = false
                            task.wait()
                        end
                        task.wait()
                        if vu46.Sit == true then
                            break
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
})
v2:AddButton({
    text = "TP to Sterling",
    flag = "button",
    callback = function()
        local v67 = game:GetService("Players")
        local v68 = game:GetService("TweenService")
        local v69 = v67.LocalPlayer
        local v70 = v69.Character or v69.CharacterAdded:Wait()
        local vu71 = v70:WaitForChild("HumanoidRootPart")
        local vu72 = v70:WaitForChild("Humanoid")
        local v73 = CFrame.new(- 424, 30, - 49041)
        local vu74 = v68:Create(vu71, TweenInfo.new(40, Enum.EasingStyle.Linear), {
            CFrame = v73
        })
        local vu75 = true
        vu71.CFrame = CFrame.new(56, 3, 29760)
        local v76 = vu74
        vu74.Play(v76)
        task.spawn(function()
            while vu75 do
                local v77 = workspace:FindFirstChild("Sterling")
                if v77 then
                    local v78 = v77:FindFirstChild("Town")
                    local v79 = v78 and v78:FindFirstChild("Road")
                    if v79 then
                        vu74:Cancel()
                        vu75 = false
                        local v80 = tick()
                        local v81 = v79.CFrame * CFrame.new(0, 5, 0)
                        while tick() - v80 < 2 do
                            vu71.CFrame = v81
                            task.wait()
                        end
                        wait(0.2)
                        workspace.RuntimeItems.Chair.Seat.CFrame = vu71.CFrame * CFrame.new(0, 5, 0)
                        while tick() - v80 < 5 do
                            vu71.CFrame = v81
                            workspace.RuntimeItems.Chair.Seat.Disabled = false
                            workspace.RuntimeItems.Chair.Seat.CFrame = vu71.CFrame * CFrame.new(0, - 1, 0)
                            task.wait()
                        end
                        task.wait()
                        if vu72.Sit == true then
                            break
                        end
                    end
                end
                task.wait(0.2)
            end
        end)
    end
})
v2:AddButton({
    text = "TP to Fort",
    flag = "button",
    callback = function()
        local v82 = game:GetService("Players")
        local v83 = game:GetService("TweenService")
        local v84 = v82.LocalPlayer
        local v85 = v84.Character or v84.CharacterAdded:Wait()
        local vu86 = v85:WaitForChild("HumanoidRootPart")
        local vu87 = v85:WaitForChild("Humanoid")
        local v88 = CFrame.new(- 424, 30, - 49041)
        local vu89 = v83:Create(vu86, TweenInfo.new(50, Enum.EasingStyle.Linear), {
            CFrame = v88
        })
        local vu90 = true
        vu86.CFrame = CFrame.new(56, 3, 29760)
        local v91 = vu89
        vu89.Play(v91)
        task.spawn(function()
            while vu90 do
                local v92 = workspace:FindFirstChild("RuntimeItems")
                if v92 then
                    v92 = workspace.RuntimeItems:FindFirstChild("Cannon")
                end
                if v92 and v92:FindFirstChild("VehicleSeat") then
                    vu89:Cancel()
                    vu90 = false
                    local v93 = v92.VehicleSeat
                    local v94 = tick()
                    local v95 = CFrame.new(v93.Position)
                    while tick() - v94 < 3 do
                        vu86.CFrame = v95
                        v93.Disabled = false
                        task.wait()
                    end
                    repeat
                        task.wait()
                    until vu87.Sit == true
                    break
                end
                task.wait(0.2)
            end
        end)
    end
})
v2:AddBox({
    text = "Countdown",
    flag = "box",
    value = "Set Speed",
    callback = function(_)
    end
})
v2:AddLabel({
    text = "YouTube: Tora IsMe"
})
local v96 = v1:CreateWindow("Main")
v96:AddButton({
    text = "TP to Train",
    flag = "Train",
    callback = function()
        local v97 = game.Players.LocalPlayer.Character
        local v98 = v97:WaitForChild("Humanoid")
        local v99 = v97:WaitForChild("HumanoidRootPart")
        local v100, v101, v102 = pairs(workspace:GetChildren())
        while true do
            local v103
            v102, v103 = v100(v101, v102)
            if v102 == nil then
                break
            end
            if v103:IsA("Model") and v103:GetAttribute("serverEntityId") then
                local v104, v105, v106 = pairs(v103:GetDescendants())
                while true do
                    local v107
                    v106, v107 = v104(v105, v106)
                    if v106 == nil then
                        break
                    end
                    if v107.Name == "VehicleSeat" then
                        local v108 = CFrame.new(v107.Position)
                        while not v98.Sit do
                            v99.CFrame = v108
                            task.wait()
                        end
                    end
                end
            end
        end
    end
})
local vu109 = {}
game:GetService("RunService")
local function vu114(p110, p111)
    if _G.Items and not vu109[p110] then
        local v112 = Instance.new("BillboardGui")
        v112.Name = "ESP"
        v112.Adornee = p110
        v112.Size = UDim2.new(0, 100, 0, 30)
        v112.StudsOffset = Vector3.new(0, 2, 0)
        v112.AlwaysOnTop = true
        local v113 = Instance.new("TextLabel")
        v113.Parent = v112
        v113.Size = UDim2.new(1, 0, 1, 0)
        v113.BackgroundTransparency = 1
        v113.Text = p111
        v113.TextColor3 = Color3.fromRGB(204, 255, 204)
        v113.TextStrokeTransparency = 0
        v113.Font = Enum.Font.SourceSansBold
        v113.TextSize = 16
        v112.Parent = game:GetService("CoreGui")
        vu109[p110] = v112
    end
end
local function vu119()
    while task.wait(1) do
        if _G.Items then
            local v115, v116, v117 = pairs(workspace.RuntimeItems:GetChildren())
            while true do
                local v118
                v117, v118 = v115(v116, v117)
                if v117 == nil then
                    break
                end
                if v118:IsA("Model") and v118.PrimaryPart then
                    vu114(v118.PrimaryPart, v118.Name)
                elseif v118:IsA("BasePart") then
                    vu114(v118, v118.Name)
                end
            end
        end
    end
end
local function vu129(p120)
    _G.Items = p120
    if p120 then
        local v121, v122, v123 = pairs(workspace.RuntimeItems:GetChildren())
        while true do
            local v124
            v123, v124 = v121(v122, v123)
            if v123 == nil then
                break
            end
            if v124:IsA("Model") and v124.PrimaryPart then
                vu114(v124.PrimaryPart, v124.Name)
            elseif v124:IsA("BasePart") then
                vu114(v124, v124.Name)
            end
        end
    else
        local v125, v126, v127 = pairs(vu109)
        while true do
            local v128
            v127, v128 = v125(v126, v127)
            if v127 == nil then
                break
            end
            if v128 then
                v128:Destroy()
            end
        end
        vu109 = {}
    end
end
v96:AddToggle({
    text = "Items ESP",
    flag = "toggle",
    state = false,
    callback = function(p130)
        vu129(p130)
        if p130 then
            task.spawn(vu119)
        end
    end
})
local vu131 = {}
game:GetService("RunService")
local function vu138()
    local v132, v133, v134 = ipairs(workspace:GetDescendants())
    while true do
        local v135
        v134, v135 = v132(v133, v134)
        if v134 == nil then
            break
        end
        if v135:IsA("BasePart") and v135.Name == "HumanoidRootPart" then
            local v136 = v135.Parent
            if (v136:GetAttribute("EntityName") or v136:GetAttribute("Bounty")) and not vu131[v136] then
                local v137 = Instance.new("Highlight")
                v137.Parent = v136
                v137.FillTransparency = 0.3
                v137.FillColor = Color3.fromRGB(255, 0, 0)
                vu131[v136] = v137
            end
        end
    end
end
local function vu144(p139)
    _G.Mobs = p139
    if p139 then
        vu138()
    else
        local v140, v141, v142 = pairs(vu131)
        while true do
            local v143
            v142, v143 = v140(v141, v142)
            if v142 == nil then
                break
            end
            if v143 then
                v143:Destroy()
            end
        end
        vu131 = {}
    end
end
local function vu145()
    while task.wait(1) do
        if _G.Mobs then
            vu138()
        end
    end
end
v96:AddToggle({
    text = "Mobs ESP",
    flag = "toggle",
    state = false,
    callback = function(p146)
        vu144(p146)
        if p146 then
            task.spawn(vu145)
        end
    end
})
local vu147 = game:GetService("RunService")
local vu148 = workspace.CurrentCamera
local vu149 = {}
local vu150 = nil
function updateUnicorns()
    local v151, v152, v153 = pairs(vu149)
    while true do
        local v154
        v153, v154 = v151(v152, v153)
        if v153 == nil then
            break
        end
        if v154.circle then
            v154.circle:Remove()
        end
        if v154.text then
            v154.text:Remove()
        end
    end
    table.clear(vu149)
    local v155, v156, v157 = pairs(workspace:GetDescendants())
    while true do
        local v158
        v157, v158 = v155(v156, v157)
        if v157 == nil then
            break
        end
        if v158.Name == "Unicorn" and (v158:IsA("Model") and v158:FindFirstChild("HumanoidRootPart")) then
            local v159 = Drawing.new("Circle")
            v159.Color = Color3.fromRGB(255, 0, 0)
            v159.Radius = 10
            v159.Thickness = 2
            v159.Filled = false
            v159.Visible = true
            local v160 = Drawing.new("Text")
            v160.Text = "Unicorn"
            v160.Size = 16
            v160.Color = Color3.fromRGB(255, 255, 255)
            v160.Center = true
            v160.Outline = true
            v160.OutlineColor = Color3.fromRGB(0, 0, 0)
            v160.Font = 2
            v160.Visible = true
            vu149[# vu149 + 1] = {
                model = v158,
                circle = v159,
                text = v160
            }
        end
    end
end
function startESP()
    updateUnicorns()
    vu150 = vu147.RenderStepped:Connect(function()
        local v161, v162, v163 = ipairs(vu149)
        while true do
            local v164
            v163, v164 = v161(v162, v163)
            if v163 == nil then
                break
            end
            local v165 = v164.model:FindFirstChild("HumanoidRootPart")
            if v165 and (v164.circle and v164.text) then
                local v166, v167 = vu148:WorldToViewportPoint(v165.Position)
                if v167 then
                    local v168 = Vector2.new(v166.X, v166.Y)
                    v164.circle.Position = v168
                    v164.circle.Visible = true
                    v164.text.Position = v168 + Vector2.new(0, 15)
                    v164.text.Visible = true
                else
                    v164.circle.Visible = false
                    v164.text.Visible = false
                end
            else
                if v164.circle then
                    v164.circle.Visible = false
                end
                if v164.text then
                    v164.text.Visible = false
                end
            end
        end
    end)
    task.spawn(function()
        while _G.UnicornESP do
            updateUnicorns()
            task.wait(2)
        end
    end)
end
function stopESP()
    if vu150 then
        vu150:Disconnect()
    end
    local v169, v170, v171 = pairs(vu149)
    while true do
        local v172
        v171, v172 = v169(v170, v171)
        if v171 == nil then
            break
        end
        if v172.circle then
            v172.circle:Remove()
        end
        if v172.text then
            v172.text:Remove()
        end
    end
    table.clear(vu149)
end
v96:AddToggle({
    text = "Unicorn ESP",
    flag = "UnicornESP",
    state = false,
    callback = function(p173)
        _G.UnicornESP = p173
        print("Unicorn ESP:", p173)
        if p173 then
            startESP()
        else
            stopESP()
        end
    end
})
v96:AddButton({
    text = "UnlockCam",
    flag = "button",
    callback = function()
        local vu174 = game.Players.LocalPlayer
        local vu175 = workspace.CurrentCamera;
        (function()
            vu174.CameraMode = Enum.CameraMode.Classic
            vu174.CameraMinZoomDistance = 0
            vu174.CameraMaxZoomDistance = 150
            vu175.CameraSubject = vu174.Character.Humanoid
        end)()
    end
})
v96:AddButton({
    text = "FullBright",
    flag = "button",
    callback = function()
        if not _G.FullBrightExecuted then
            _G.FullBrightEnabled = false
            local v176 = _G
            local v177 = {
                Brightness = game:GetService("Lighting").Brightness,
                ClockTime = game:GetService("Lighting").ClockTime,
                FogEnd = game:GetService("Lighting").FogEnd,
                GlobalShadows = game:GetService("Lighting").GlobalShadows,
                Ambient = game:GetService("Lighting").Ambient
            }
            v176.NormalLightingSettings = v177
            game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
                if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
                    _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Brightness = 1
                end
            end)
            game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
                if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
                    _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").ClockTime = 12
                end
            end)
            game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
                if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
                    _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").FogEnd = 786543
                end
            end)
            game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
                if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
                    _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").GlobalShadows = false
                end
            end)
            game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
                if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
                    _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                end
            end)
            game:GetService("Lighting").Brightness = 1
            game:GetService("Lighting").ClockTime = 12
            game:GetService("Lighting").FogEnd = 786543
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
            local vu178 = true
            spawn(function()
                repeat
                    wait()
                until _G.FullBrightEnabled
                while wait() do
                    if _G.FullBrightEnabled ~= vu178 then
                        if _G.FullBrightEnabled then
                            game:GetService("Lighting").Brightness = 1
                            game:GetService("Lighting").ClockTime = 12
                            game:GetService("Lighting").FogEnd = 786543
                            game:GetService("Lighting").GlobalShadows = false
                            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                        else
                            game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                            game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                            game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                            game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                            game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                        end
                        vu178 = not vu178
                    end
                end
            end)
        end
        _G.FullBrightExecuted = false
        _G.FullBrightEnabled = not _G.FullBrightEnabled
    end
})
v96:AddButton({
    text = "Inf Jump",
    flag = "button",
    callback = function()
        game:GetService("UserInputService").JumpRequest:Connect(function()
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end)
    end
})
v96:AddToggle({
    text = "Walk Speed",
    flag = "toggle",
    state = false,
    callback = function(p179)
        _G.Speed = p179
        print("Speed: ", p179)
        local v180 = game.Players.LocalPlayer
        local vu181 = v180.Character
        if vu181 then
            vu181 = v180.Character:FindFirstChild("Humanoid")
        end
        if p179 then
            _G.Speed = true
            task.spawn(function()
                while _G.Speed do
                    pcall(function()
                        if vu181 then
                            vu181.WalkSpeed = 18.5
                            workspace.CurrentCamera.FieldOfView = 100
                        end
                    end)
                    task.wait(3)
                    pcall(function()
                        if vu181 then
                            vu181.WalkSpeed = 16
                        end
                    end)
                    task.wait(1)
                end
            end)
        else
            _G.Speed = false
            pcall(function()
                if vu181 then
                    vu181.WalkSpeed = 16
                    workspace.CurrentCamera.FieldOfView = 70
                end
            end)
        end
    end
})
local vu182 = nil
local vu183 = nil
function noclip()
    vu183 = false
    local function v188()
        if not vu183 and game.Players.LocalPlayer.Character then
            local v184, v185, v186 = pairs(game.Players.LocalPlayer.Character:GetDescendants())
            while true do
                local v187
                v186, v187 = v184(v185, v186)
                if v186 == nil then
                    break
                end
                if v187:IsA("BasePart") and v187.CanCollide then
                    v187.CanCollide = false
                end
            end
        end
        wait(0.21)
    end
    vu182 = game:GetService("RunService").Stepped:Connect(v188)
end
function clip()
    if vu182 then
        vu182:Disconnect()
    end
    vu183 = true
end
v96:AddToggle({
    text = "Noclip",
    flag = "toggle_noclip",
    state = false,
    callback = function(p189)
        if p189 then
            noclip()
        else
            clip()
        end
    end
})
v1:Init()
local vu190 = 600
local vu191 = game:GetService("CoreGui").ToraScript.ImageButton.Frame.Frame.TextBox;
(function()
    while vu190 > 0 do
        local v192 = math.floor(vu190 / 60)
        local v193 = vu190 % 60
        vu191.Text = string.format("%02d:%02d", v192, v193)
        wait(1)
        vu190 = vu190 - 1
    end
    vu191.Text = "00:00"
end)()
local vu194 = nil
vu194 = hookmetamethod(game, "__index", function(p195, p196)
    if not checkcaller() then
        local v197 = tostring(p195)
        if v197 == "FireDelay" and p196 == "Value" then
            return 0
        end
        if v197 == "MagazineSize" and p196 == "Value" then
            return math.huge
        end
        if v197 == "ReloadDuration" and p196 == "Value" then
            return 0
        end
        if v197 == "SpreadAngle" and p196 == "Value" then
            return 0
        end
    end
    return vu194(p195, p196)
end)