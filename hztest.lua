local function destroyObjectCache(parent)
    for _, obj in pairs(parent:GetChildren()) do
        if obj.Name == "ObjectCache" then
            obj:Destroy()
        else
            destroyObjectCache(obj)
        end
    end
end

destroyObjectCache(workspace.Terrain)

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

getgenv().ESPEnabled = false
getgenv().ESPType = "Highlight"
getgenv().ESPShowName = true
getgenv().ESPShowDistance = true
getgenv().ESPDistance = 50
getgenv().ESPName = "NPC"

getgenv().Radio = false
getgenv().Heli = false
getgenv().Gen = false

getgenv().Setting = getgenv().Setting or {}
getgenv().Setting.Skills = { "Z", "X", "C", "G" }

player.CharacterAdded:Connect(function(newChar)
    char = newChar
    hrp = char:WaitForChild("HumanoidRootPart")
    table.clear(noclipTouchedParts)
end)

local function enableNoclip(character)
    if not character then return end
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.CanCollide then
            noclipTouchedParts[part] = true
            part.CanCollide = false
        end
    end
end

local function disableNoclip(character)
    for part in pairs(noclipTouchedParts) do
        if part and part.Parent then
            part.CanCollide = true
        end
    end
    table.clear(noclipTouchedParts)

    if hrp then
        local bv = hrp:FindFirstChild("Lock")
        if bv then bv:Destroy() end
    end
end

local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

function moveToTarget(targetPart, offset)
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    offset = offset or Vector3.new(0,5,0)
    hrp.CFrame = CFrame.new(targetPart.Position + offset)
end

    offset = offset or Vector3.new(0,5,0)
    local speed = 100

    local bv = hrp:FindFirstChild("Lock")
    if not bv then
        bv = Instance.new("BodyVelocity")
        bv.Name = "Lock"
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Velocity = Vector3.new(0,0,0)
        bv.Parent = hrp
    end

    repeat
        if not (targetHRP and targetHRP.Parent) then break end
        local targetPos = targetHRP.Position + offset
        local dir = targetPos - hrp.Position
        if dir.Magnitude > 0.5 then
            bv.Velocity = dir.Unit * speed
        else
            bv.Velocity = Vector3.zero
        end
        enableNoclip(char)
        RunService.Heartbeat:Wait()
    until not (targetHRP and targetHRP.Parent) or (hrp.Position - targetHRP.Position - offset).Magnitude <= 0.5

    bv.Velocity = Vector3.zero
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ByteNetReliable = ReplicatedStorage:WaitForChild("ByteNetReliable")
local Players = game:GetService("Players")
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ByteNetReliable = ReplicatedStorage:WaitForChild("ByteNetReliable")
local CoreGui = game:GetService("CoreGui")
local zombiesFolder = workspace:WaitForChild("Entities"):WaitForChild("Zombie")
local UIS = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local noclipTouchedParts = {}
local AutoClearToggle = false
local AutoAttackToggle = false
local AutoSwapToggle = false
local AutoCollectToggle = false
local AutoSkillsToggle = false
local UsePerkToggle = false
local BringMobsToggle = false
local AutoReplayToggle = false
local offset = Vector3.new(1, 6, 0)

local Window = Windui:CreateWindow({
    Title = "Wicik",
    Icon = "sun",
    Author = "Hunty Zombie",
    Folder = "Wicik_Hunty",
    Size = UDim2.fromOffset(400, 400),
    Transparent = true,
    Theme = "Solar",
    Resizable = true,
    SideBarWidth = 200,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    CornerRadius = UDim.new(0, 14),
    DropShadow = true
})

Window:EditOpenButton({
    Title = "Wicik",
    Icon = "sun",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromHex("#FF0F7B")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#F89B29"))
    },
    OnlyMobile = true,
    Enabled = true,
    Draggable = true,
})

local MainTab = Window:Tab({ Title = "Auto Farm", Icon = "skull" })
local EspTab = Window:Tab({ Title = "Esp", Icon = "eye" })
local MiscTab = Window:Tab({ Title = "Player", Icon = "user" })
local c = Window:Tab({ Title = "Config", Icon = "paperclip" })
local u = Window:Tab({ Title = "UI Settings", Icon = "settings" })
local i = Window:Tab({ Title = "Information", Icon = "github" })
Window:SelectTab(1)

-- ================= MainTab =================
MainTab:Section({ Title = "Auto Farm", Icon = "skull" })

local AutoFarm = MainTab:Toggle({
    Title = "Auto Farm",
    Default = false,
    Callback = function(state)
        AutoClearToggle = state
        if state then
            task.spawn(function()
                enableNoclip(char)
                while AutoClearToggle do
                    local targetZombie = nil
                    local closestDist = math.huge
                    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

                    if hrp then
                        for _, z in ipairs(zombiesFolder:GetChildren()) do
                            local zHRP = z:FindFirstChild("HumanoidRootPart")
                            if zHRP and zHRP.Position.Y > -20 then
                                local dist = (zHRP.Position - hrp.Position).Magnitude
                                if dist < closestDist then
                                    closestDist = dist
                                    targetZombie = zHRP
                                end
                            end
                        end
                    end

                    if targetZombie and targetZombie.Parent then
                        moveToTarget(targetZombie, Vector3.new(0, 5, 0))
                        task.wait(0.1)
                    else
                        local handled = false

                        -- Sewers
                        local bossRoom = workspace:FindFirstChild("Sewers") 
                            and workspace.Sewers:FindFirstChild("Rooms") 
                            and workspace.Sewers.Rooms:FindFirstChild("BossRoom")

                        if bossRoom and getgenv().Gen then
                            local generator = bossRoom:FindFirstChild("generator")
                            if generator and generator:FindFirstChild("gen") then
                                local gen = generator.gen
                                local pom = gen:FindFirstChild("pom")
                                if pom and pom:IsA("ProximityPrompt") and pom.Enabled then
                                    moveToTarget(gen, Vector3.new(0,0,0))
                                    task.wait(0.5)
                                    fireproximityprompt(pom)
                                    task.wait(1)
                                    handled = true
                                end
                            end
                        end

                        -- School
                        if not handled then
                            local school = workspace:FindFirstChild("School")
                            if school and school:FindFirstChild("Rooms") then
                                local rooftop = school.Rooms:FindFirstChild("RooftopBoss")
                                if rooftop then
                                    if getgenv().Radio and rooftop:FindFirstChild("RadioObjective") then
                                        local radioPrompt = rooftop.RadioObjective:FindFirstChildOfClass("ProximityPrompt")
                                        if radioPrompt and radioPrompt.Enabled then
                                            moveToTarget(rooftop.RadioObjective, Vector3.new(0,0,0))
                                            task.wait(0.5)
                                            fireproximityprompt(radioPrompt)
                                            task.wait(10)

                                            local guiLabel = player.PlayerGui 
                                                and player.PlayerGui.MainScreen 
                                                and player.PlayerGui.MainScreen.ObjectiveDisplay
                                                and player.PlayerGui.MainScreen.ObjectiveDisplay.ObjectiveElement
                                                and player.PlayerGui.MainScreen.ObjectiveDisplay.ObjectiveElement.List
                                                and player.PlayerGui.MainScreen.ObjectiveDisplay.ObjectiveElement.List.Value
                                                and player.PlayerGui.MainScreen.ObjectiveDisplay.ObjectiveElement.List.Value.Label

                                            local timeout = 15
                                            local startTime = os.clock()
                                            repeat
                                                task.wait(1)
                                            until (guiLabel and guiLabel.ContentText == "0") 
                                               or (os.clock() - startTime > timeout)

                                            handled = true
                                        end
                                    end

                                    if getgenv().Heli and rooftop:FindFirstChild("HeliObjective") then
                                        local heliPrompt = rooftop.HeliObjective:FindFirstChildOfClass("ProximityPrompt")
                                        if heliPrompt and heliPrompt.Enabled then
                                            moveToTarget(rooftop.HeliObjective, Vector3.new(0,0,0))
                                            task.wait(0.5)
                                            fireproximityprompt(heliPrompt)
                                            handled = true
                                        end
                                    end
                                end
                            end
                        end

                        if not handled then
                            task.wait(1)
                        end
                    end
                end
                disableNoclip(char)
            end)
        else
            disableNoclip(char)
        end
    end
})

local AutoAttack = MainTab:Toggle({
    Title = "Auto Attack",
    Default = false,
    Callback = function(state)
    AutoAttackToggle = state
        if state then
            task.spawn(function()
                while state do
                    VirtualUser:Button1Down(Vector2.new(958, 466))
                    task.wait(1)
                end
            end)
        end
    end
})

local AutoSwap = MainTab:Toggle({
    Title = "Auto Swap Weapons",
    Default = false,
    Callback = function(state)
        AutoSwapToggle = state
        if state then
            task.spawn(function()
                local keys = { Enum.KeyCode.One, Enum.KeyCode.Two }
                local current = 1
                while AutoSwapToggle.Value do
                    local key = keys[current]
                    VirtualInputManager:SendKeyEvent(true, key, false, game)
                    VirtualInputManager:SendKeyEvent(false, key, false, game)
                    current = current == 1 and 2 or 1
                    task.wait(2)
                end
            end)
        end
    end
})


local AutoCollect = MainTab:Toggle({
    Title = "Auto Collect",
    Default = false,
    Callback = function(state)
        AutoCollectToggle = state
        if state then
            task.spawn(function()
                local DropItemsFolder = workspace:WaitForChild("DropItems")
                while AutoCollectToggle.Value do
                    if hrp then
                        for _, item in ipairs(DropItemsFolder:GetChildren()) do
                            local targetPos
                            if item:IsA("Model") and item.PrimaryPart then
                                targetPos = item.PrimaryPart.Position
                            elseif item:IsA("BasePart") then
                                targetPos = item.Position
                            end
                            if targetPos then
                                hrp.CFrame = CFrame.new(targetPos + Vector3.new(0, 3, 0))
                                task.wait(0.1)
                            end
                        end
                    end
                    task.wait(0.3)
                end
            end)
        end
    end
})

local Skills = MainTab:Dropdown({
    Title = "Select Skills",
    Values = { "Z", "X", "C", "G" },
    Default = getgenv().Setting.Skills,
    Multi = true,
    Callback = function(selected)
        getgenv().Setting.Skills = selected
    end
})

local AutoSkills = MainTab:Toggle({
    Title = "Auto Skills",
    Default = false,
    Callback = function(state)
        AutoSkillsToggle = state
        if state then
            task.spawn(function()
                while AutoSkillsToggle.Value do
                    for _, keyName in ipairs(getgenv().Setting.Skills) do
                        local keyCode = Enum.KeyCode[keyName]
                        if keyCode then
                            VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
                            VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
                        end
                    end
                    RunService.Heartbeat:Wait()
                end
            end)
        end
    end
})

local Perk = MainTab:Toggle({
    Title = "Use Perk",
    Default = false,
    Callback = function(state)
        UsePerkToggle = state

        if state then
            task.spawn(function()
                local args = { buffer.fromstring("\f") }
                while UsePerkToggle.Value do
                    ByteNetReliable:FireServer(unpack(args))
                    RunService.Heartbeat:Wait()
                end
            end)
        end
    end
})

local Bring = MainTab:Toggle({
    Title = "Bring Mobs",
    Default = false,
    Callback = function(state)
        BringMobsToggle = state

        if state then
            task.spawn(function()
                while BringMobsToggle.Value do
                    local sewers = workspace:FindFirstChild("Sewers")
                    if sewers and sewers:FindFirstChild("Doors") then
                        for _, door in ipairs(sewers.Doors:GetChildren()) do
                            local args = { buffer.fromstring("\a\001"), {door} }
                            ByteNetReliable:FireServer(unpack(args))
                            task.wait(0.1)
                        end
                    end
                    local school = workspace:FindFirstChild("School")
                    if school and school:FindFirstChild("Doors") then
                        for _, door in ipairs(school.Doors:GetChildren()) do
                            local args = { buffer.fromstring("\a\001"), {door} }
                            ByteNetReliable:FireServer(unpack(args))
                            task.wait(0.1)
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

local Radio = MainTab:Toggle({ Title = "Auto Radio", Default = true, Callback = function(v) getgenv().Radio = v end })
local Heli = MainTab:Toggle({ Title = "Auto Helicopter", Default = true, Callback = function(v) getgenv().Heli = v end })
local Gen = MainTab:Toggle({ Title = "Auto Generator", Default = true, Callback = function(v) getgenv().Gen = v end })

local Replay = MainTab:Toggle({
    Title = "Auto Replay",
    Default = false,
    Callback = function(state)
        AutoReplayToggle = state

        if state then
            task.spawn(function()
                local voteReplay = ReplicatedStorage:WaitForChild("external"):WaitForChild("Packets"):WaitForChild("voteReplay")
                while AutoReplayToggle.Value do
                    voteReplay:FireServer()
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- ================= ESP Tab =================
EspTab:Section({ Title = "ESP", Icon = "eye" })

local esp5 = EspTab:Dropdown({
    Title = "ESP Type",
    Values = { "Highlight", "BoxHandleAdornment" },
    Default = getgenv().ESPType,
    Multi = false,
    Callback = function(value) getgenv().ESPType = value end
})

local esp4 = EspTab:Toggle({
    Title = "Zombie Esp",
    Default = getgenv().ESPEnabled,
    Callback = function(value) getgenv().ESPEnabled = value end
})

EspTab:Section({ Title = "Settings", Icon = "settings" })

local esp3 = EspTab:Toggle({
    Title = "Show Name",
    Default = getgenv().ESPShowName,
    Callback = function(value) getgenv().ESPShowName = value end
})

local esp2 = EspTab:Toggle({
    Title = "Show Distance",
    Default = getgenv().ESPShowDistance,
    Callback = function(value) getgenv().ESPShowDistance = value end
})

local esp1 = EspTab:Slider({
    Title = "Max Distance",
    Value = { Min = 1, Max = 100, Default = getgenv().ESPDistance },
    Step = 1,
    Callback = function(val) getgenv().ESPDistance = val end
})

-- ฟังก์ชัน update ESP
local function updateESP()
    if not getgenv().ESPEnabled then return end
    local entities = workspace:FindFirstChild("Entities"):FindFirstChild("Zombie")
    if not entities then return end
    for _, npc in ipairs(entities:GetChildren()) do
        if npc:FindFirstChild("HumanoidRootPart") then
            local hrp = npc.HumanoidRootPart

            -- Highlight / Box
            if getgenv().ESPType == "Highlight" and not hrp:FindFirstChild("ESP_Highlight") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = npc
                highlight.Parent = hrp
            elseif getgenv().ESPType == "BoxHandleAdornment" and not hrp:FindFirstChild("ESP_Box") then
                local box = Instance.new("BoxHandleAdornment")
                box.Name = "ESP_Box"
                box.Adornee = hrp
                box.Size = hrp.Size or Vector3.new(2, 2, 1)
                box.Color3 = Color3.fromRGB(255, 0, 0)
                box.AlwaysOnTop = true
                box.Parent = hrp
            end

            -- Name + Distance
            if getgenv().ESPShowName then
                if not hrp:FindFirstChild("ESP_NameTag") then
                    local bill = Instance.new("BillboardGui")
                    bill.Name = "ESP_NameTag"
                    bill.Adornee = hrp
                    bill.Size = UDim2.new(0, 120, 0, 50)
                    bill.AlwaysOnTop = true
                    bill.Parent = hrp

                    local text = Instance.new("TextLabel")
                    text.Size = UDim2.new(1, 0, 1, 0)
                    text.BackgroundTransparency = 1
                    text.TextColor3 = Color3.fromRGB(255, 0, 0)
                    text.TextScaled = true
                    text.Parent = bill
                end

                local label = hrp:FindFirstChild("ESP_NameTag"):FindFirstChildOfClass("TextLabel")
                if label and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                    if dist <= getgenv().ESPDistance then
                        if getgenv().ESPShowDistance then
                            label.Text = getgenv().ESPName .. " - [" .. math.floor(dist) .. "m]"
                        else
                            label.Text = getgenv().ESPName
                        end
                        label.Visible = true
                    else
                        label.Visible = false
                    end
                end
            else
                if hrp:FindFirstChild("ESP_NameTag") then
                    hrp.ESP_NameTag:Destroy()
                end
            end
        end
    end
end

RunService.RenderStepped:Connect(function()
    if getgenv().ESPEnabled then updateESP() end
end)


MiscTab:Section({ Title = "Local Player", Icon = "user" })

getgenv().speedEnabled = false
getgenv().speedValue = 20

local speed99 = MiscTab:Slider({
    Title = "Set Speed Value",
    Value = {Min = 16, Max = 600, Default = 20},
    Step = 1,
    Callback = function(val)
        getgenv().speedValue = val
        if getgenv().speedEnabled then
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then hum.WalkSpeed = val end
        end
    end
})

local speed9 = MiscTab:Toggle({
    Title = "Enable Speed",
    Default = false,
    Callback = function(v)
        getgenv().speedEnabled = v
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v and getgenv().speedValue or 16 end
    end
})

local LocalPlayer = game.Players.LocalPlayer

getgenv().dashValue = 16
getgenv().dashEnabled = false

local dashspeed = MiscTab:Slider({
    Title = "Dash Speed",
    Value = {Min = 0, Max = 500, Default = 16},
    Step = 1,
    Callback = function(val)
        getgenv().dashValue = val
        if getgenv().dashEnabled then
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            char:SetAttribute("DashMagnitude", val)
        end
    end
})

local dashspeed1 = MiscTab:Toggle({
    Title = "Enable Dash Speed",
    Default = false,
    Callback = function(v)
        getgenv().dashEnabled = v
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        if v then
            char:SetAttribute("DashMagnitude", getgenv().dashValue)
            task.spawn(function()
                while getgenv().dashEnabled do
                    if char and char.Parent then
                        char:SetAttribute("DashMagnitude", getgenv().dashValue)
                    end
                    task.wait(0.1)
                end
                if char and char.Parent then
                    char:SetAttribute("DashMagnitude", 16)
                end
            end)
        else
            char:SetAttribute("DashMagnitude", 16)
        end
    end
})

local noclipConnection

local noclip9 = MiscTab:Toggle({
    Title = "Noclip",
    Default = false,
    Callback = function(state)
        if state then
            noclipConnection = RunService.Stepped:Connect(function()
                local Character = LocalPlayer.Character
                if Character then
                    for _, part in pairs(Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            local Character = LocalPlayer.Character
            if Character then
                for _, part in pairs(Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
})

local jump = MiscTab:Toggle({
    Title = "Infinity Jump",
    Default = false,
    Callback = function(state)
        local uis = game:GetService("UserInputService")
        local player = game.Players.LocalPlayer
        local infJumpConnection

        if state then
            infJumpConnection = uis.JumpRequest:Connect(function()
                if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                    player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
            getgenv().infJumpConnection = infJumpConnection
        else
            if getgenv().infJumpConnection then
                getgenv().infJumpConnection:Disconnect()
                getgenv().infJumpConnection = nil
            end
        end
    end
})

MiscTab:Section({ Title = "Misc", Icon = "candy-cane" })

local Lighting = game:GetService("Lighting")
local oldAmbient = Lighting.Ambient
local oldBrightness = Lighting.Brightness
local oldClockTime = Lighting.ClockTime
local oldFogStart = Lighting.FogStart
local oldFogEnd = Lighting.FogEnd
local oldFogColor = Lighting.FogColor

local fullBrightConnection
local noFogConnection

local fullbright = MiscTab:Toggle({
    Title = "Fullbright",
    Default = false,
    Callback = function(state)
        if state then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.Brightness = 5
            Lighting.ClockTime = 14

            fullBrightConnection = RunService.RenderStepped:Connect(function()
                if Lighting.ClockTime ~= 14 then Lighting.ClockTime = 14 end
                if Lighting.Brightness ~= 10 then Lighting.Brightness = 10 end
                if Lighting.Ambient ~= Color3.new(1,1,1) then Lighting.Ambient = Color3.new(1,1,1) end
            end)
        else
            if fullBrightConnection then
                fullBrightConnection:Disconnect()
                fullBrightConnection = nil
            end
            Lighting.Ambient = oldAmbient
            Lighting.Brightness = oldBrightness
            Lighting.ClockTime = oldClockTime
        end
    end
})

local NoFog = MiscTab:Toggle({
    Title = "No Fog",
    Default = false,
    Callback = function(state)
        if state then
            Lighting.FogStart = 0
            Lighting.FogEnd = 1e10
            Lighting.FogColor = Color3.fromRGB(255, 255, 255)

            noFogConnection = RunService.RenderStepped:Connect(function()
                if Lighting.FogStart ~= 0 then Lighting.FogStart = 0 end
                if Lighting.FogEnd ~= 1e10 then Lighting.FogEnd = 1e10 end
                if Lighting.FogColor ~= Color3.fromRGB(255, 255, 255) then Lighting.FogColor = Color3.fromRGB(255, 255, 255) end
            end)
        else
            if noFogConnection then
                noFogConnection:Disconnect()
                noFogConnection = nil
            end
            Lighting.FogStart = oldFogStart
            Lighting.FogEnd = oldFogEnd
            Lighting.FogColor = oldFogColor
        end
    end
})


local showFPS, showPing = false, false
local fpsText, msText = Drawing.new("Text"), Drawing.new("Text")
fpsText.Size, fpsText.Position, fpsText.Color, fpsText.Center, fpsText.Outline, fpsText.Visible =
    16, Vector2.new(Camera.ViewportSize.X - 100, 10), Color3.fromRGB(0, 255, 0), false, true, showFPS
msText.Size, msText.Position, msText.Color, msText.Center, msText.Outline, msText.Visible =
    16, Vector2.new(Camera.ViewportSize.X - 100, 30), Color3.fromRGB(0, 255, 0), false, true, showPing
local fpsCounter, fpsLastUpdate = 0, tick()

RunService.RenderStepped:Connect(function()
    fpsCounter += 1
    if tick() - fpsLastUpdate >= 1 then
        if showFPS then
            fpsText.Text = "FPS: " .. tostring(fpsCounter)
            fpsText.Visible = true
        else
            fpsText.Visible = false
        end
        if showPing then
            local pingStat = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
            local ping = pingStat and math.floor(pingStat:GetValue()) or 0
            msText.Text = "Ping: " .. ping .. " ms"
            if ping <= 60 then
                msText.Color = Color3.fromRGB(0, 255, 0)
            elseif ping <= 120 then
                msText.Color = Color3.fromRGB(255, 165, 0)
            else
                msText.Color = Color3.fromRGB(255, 0, 0)
                msText.Text = "Ew Wifi Ping: " .. ping .. " ms"
            end
            msText.Visible = true
        else
            msText.Visible = false
        end
        fpsCounter = 0
        fpsLastUpdate = tick()
    end
end)

local fovSlider = p:Slider({
    Title = "Fov",
    Step = 1,
    Value = {
        Min = 30,
        Max = 120,
        Default = 70,
    },
    Callback = function(value)
        Workspace.CurrentCamera.FieldOfView = value
    end,
})

local fps = MiscTab:Toggle({
    Title = "Show FPS",
    Default = false,
    Callback = function(val)
        showFPS = val
        fpsText.Visible = val
    end
})

local ping = MiscTab:Toggle({
    Title = "Show Ping",
    Default = false,
    Callback = function(val)
        showPing = val
        msText.Visible = val
    end
})

MiscTab:Button({
    Title = "FPS Boost",
    Callback = function()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            local lighting = game:GetService("Lighting")
            lighting.Brightness = 2
            lighting.FogEnd = 100
            lighting.GlobalShadows = false
            lighting.EnvironmentDiffuseScale = 0
            lighting.EnvironmentSpecularScale = 0
            lighting.ClockTime = 14
            lighting.OutdoorAmbient = Color3.new(0, 0, 0)
            local terrain = workspace:FindFirstChildOfClass("Terrain")
            if terrain then
                terrain.WaterWaveSize = 0
                terrain.WaterWaveSpeed = 0
                terrain.WaterReflectance = 0
                terrain.WaterTransparency = 1
            end
            for _, obj in ipairs(lighting:GetDescendants()) do
                if obj:IsA("PostEffect") or obj:IsA("BloomEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") or obj:IsA("BlurEffect") then
                    obj.Enabled = false
                end
            end
            for _, obj in ipairs(game:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                    obj.Enabled = false
                elseif obj:IsA("Texture") or obj:IsA("Decal") then
                    obj.Transparency = 1
                end
            end
            for _, part in ipairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CastShadow = false
                end
            end
        end)
        print("[Boost] FPS Boost Applied")
    end
})

local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end

u:Section({ Title = "UI Settings", Icon = "settings" })

local theme = u:Dropdown({
    Title = "Select Theme",
    Multi = false,
    AllowNone = false,
    Values = themeValues,
    Value = Solar,
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})

local theme1 = u:Toggle({
    Title = "Toggle Window Transparency",
    Value = WindUI:GetTransparency(),
    Callback = function(state)
        Window:ToggleTransparency(state)
    end
})

local theme2 = u:Keybind({
    Title = "Toggle UI Keybind",
    Value = "G",
    Callback = function(value)
        Window:SetToggleKey(Enum.KeyCode[value])
    end
})

local InviteCode = "SKGYUrmkpH"

i:Section({ Title = "Discord", Icon = "github" })

i:Button({
    Title = "Copy Discord Invite",
    Locked = false,
    Callback = function()
        WindUI:Notify({
           Title = "Wicik",
           Content = "Copy Success",
           Duration = 3
        })
        setclipboard("https://discord.gg/" .. InviteCode)
    end
})

i:Section({ Title = "Credits", Icon = "scroll" })

local Paragraph = i:Paragraph({
    Title = "Wicik",
    Desc = "created this script",
})

local Paragraph = i:Paragraph({
    Title = "x2zu",
    Desc = "Thanks a lot to him, without him the script wouldn't release",
})

local ConfigManager = Window.ConfigManager
local Config = Window.ConfigManager:CreateConfig("config")

Config:Register("AutoFarm", AutoFarm)
Config:Register("AutoAttack", AutoAttack)
Config:Register("AutoSwap", AutoSwap)
Config:Register("AutoCollect", AutoCollect)
Config:Register("Skills", Skills)
Config:Register("AutoSkills", AutoSkills)
Config:Register("Bring", Bring)
Config:Register("Radio", Radio)
Config:Register("Heli", Heli)
Config:Register("Gen", Gen)
Config:Register("Replay", Replay)
Config:Register("Perk", Perk)
Config:Register("theme", theme)
Config:Register("theme1", theme1
Config:Register("theme2", theme2)
Config:Register("NoFog", NoFog)
Config:Register("fovSlider", fovSlider)
Config:Register("ping", ping)
Config:Register("fps", fps)
Config:Register("dashspeed1", dashspeed1)
Config:Register("dashspeed", dashspeed)
Config:Register("noclip9", noclip9)
Config:Register("jump", jump)
Config:Register("speed9", speed9)
Config:Register("speed99", speed99)
Config:Register("esp5", esp5)
Config:Register("esp4", esp4)
Config:Register("esp3", esp3)
Config:Register("esp2", esp2)
Config:Register("esp1", esp1)
Config:Register("fullbright", fullbright)

c:Section({ Title = "Config", Icon = "paperclip" })

local SaveButton = c:Button({
    Title = "Save Config",
    Callback = function()
        Config:Save()
    end
})

local dildo = c:Toggle({
    Title = "Auto Load",
    Value = true,
    Callback = function(state) 
        print("Toggle Activated" .. tostring(state))
    end
})