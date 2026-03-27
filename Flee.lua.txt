local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

if not game:IsLoaded() then
    game:GetService("StarterGui"):SetCore("SendNotification", { ["Title"] = "Script loading", ["Text"] = "Waiting for the game to finish loading!", ["Duration"] = 5 })
    game.Loaded:Wait()
end

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = true
Library.ShowToggleFrameInKeybinds = true
Library.ShowCustomCursor = true
Library.ToggleKeybind = Enum.KeyCode.U

local Window = Library:CreateWindow({
    Title = "UNXHub",
    Footer = "Version: " .. (getgenv().unxshared and getgenv().unxshared.version or "Unknown") .. ", Game: " .. (getgenv().unxshared and getgenv().unxshared.gamename or "Unknown") .. ", Player: " .. (getgenv().unxshared and getgenv().unxshared.playername or "Unknown"),
    Icon = 73740010358428,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Main = Window:AddTab("Main", "user"),
    Visuals = Window:AddTab("Visuals", "eye"),
    Features = Window:AddTab("Features", "bug"),
    ["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local MainCharacterGB = Tabs.Main:AddLeftGroupbox("Character", "user")
local MainOtherGB = Tabs.Main:AddRightGroupbox("Other", "package")

MainCharacterGB:AddSlider("WalkSpeed", {Text = "Walk Speed", Default = 16, Min = 16, Max = 100, Rounding = 0})
MainCharacterGB:AddSlider("JumpPower", {Text = "Jump Power", Default = 50, Min = 50, Max = 250, Rounding = 0})
MainCharacterGB:AddSlider("MaxZoom", {Text = "Max Zoom", Default = 128, Min = 0, Max = 800, Rounding = 0})
MainCharacterGB:AddToggle("NoVelocity", {Text = "No Velocity", Default = false})
MainCharacterGB:AddDivider()
MainCharacterGB:AddToggle("NoClip", {Text = "No-Clip", Default = false})
MainCharacterGB:AddDivider()
MainCharacterGB:AddToggle("BunnyHop", {Text = "Bunny Hop", Default = false})
MainCharacterGB:AddSlider("BunnyHopDelay", {Text = "Bunny Hop Delay (s)", Default = 0.2, Min = 0, Max = 3, Rounding = 2})

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local TeleportLocations = {
    Cabin = Vector3.new(104, 8, -417),
    ["Map Voting #1"] = Vector3.new(148, 4, -334),
    ["Map Voting #2"] = Vector3.new(153, 4, -333),
    ["Map Voting #3"] = Vector3.new(159, 4, -333),
    ["Map Voting #4"] = Vector3.new(166, 4, -333),
}

local function SmartTeleport(targetPos)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local root = char.HumanoidRootPart
    local teleportType = Options.TeleportType and Options.TeleportType.Value or "Instant (TP)"
    local useNoclip = Toggles.NoclipOnTween and Toggles.NoclipOnTween.Value or false
    local originalNoclip = Toggles.NoClip and Toggles.NoClip.Value or false
    
    if teleportType == "Instant (TP)" then
        root.CFrame = CFrame.new(targetPos)
        return
    end
    
    local distance = (root.Position - targetPos).Magnitude
    local tweenSpeed = Options.TweenSpeed and Options.TweenSpeed.Value or 100
    local duration = distance / tweenSpeed
    if duration <= 0 then duration = 0.1 end
    
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(root, tweenInfo, {CFrame = CFrame.new(targetPos)})
    
    if useNoclip and Toggles.NoClip then
        Toggles.NoClip:SetValue(true)
    end
    
    tween:Play()
    tween.Completed:Connect(function()
        if useNoclip and not originalNoclip and Toggles.NoClip then
            Toggles.NoClip:SetValue(false)
        end
    end)
end

MainOtherGB:AddButton("Teleport (Cabin)", function() SmartTeleport(TeleportLocations.Cabin) end)
MainOtherGB:AddDivider()
MainOtherGB:AddButton("Teleport (Map Voting #1)", function() SmartTeleport(TeleportLocations["Map Voting #1"]) end)
MainOtherGB:AddButton("Teleport (Map Voting #2)", function() SmartTeleport(TeleportLocations["Map Voting #2"]) end)
MainOtherGB:AddButton("Teleport (Map Voting #3)", function() SmartTeleport(TeleportLocations["Map Voting #3"]) end)
MainOtherGB:AddButton("Teleport (Map Voting #4)", function() SmartTeleport(TeleportLocations["Map Voting #4"]) end)
MainOtherGB:AddDivider()

MainOtherGB:AddButton("Teleport (Beast)", function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Hammer") then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then SmartTeleport(root.Position + Vector3.new(0, 5, 0)); break end
        end
    end
end)

local survivorNames = {"No Survivors"}

local function UpdateSurvivorDropdown()
    local newNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and not player.Character:FindFirstChild("Hammer") then
            table.insert(newNames, player.DisplayName)
        end
    end
    if #newNames == 0 then newNames = {"No Survivors"} end
    survivorNames = newNames
    if Options.SurvivorDropdown then
        Options.SurvivorDropdown:SetValues(survivorNames)
        if not table.find(survivorNames, Options.SurvivorDropdown.Value) then
            Options.SurvivorDropdown:SetValue(survivorNames[1])
        end
    end
end

MainOtherGB:AddDropdown("SurvivorDropdown", {Text = "Survivors", Values = {}, Default = 1, Searchable = true, Scrollable = true})

MainOtherGB:AddButton("Teleport (Survivor)", function()
    local target = Options.SurvivorDropdown and Options.SurvivorDropdown.Value
    if target and target ~= "No Survivors" then
        local player = Players:FindFirstChild(target)
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            SmartTeleport(player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
        end
    end
end)

MainOtherGB:AddDivider()

local ESPData = {KnownComputers = {}}

local function ScanComputers()
    ESPData.KnownComputers = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "ComputerTable" and obj:IsA("Model") then
            local screen = obj:FindFirstChild("Screen")
            if screen and screen:IsA("BasePart") then
                local c = screen.Color
                if not (c.R == 40/255 and c.G == 127/255 and c.B == 71/255) then
                    table.insert(ESPData.KnownComputers, obj)
                end
            end
        end
    end
end

local computerNames = {"No Computers"}

local function UpdateComputerDropdown()
    ScanComputers()
    local newNames = {}
    for i, _ in ipairs(ESPData.KnownComputers) do
        table.insert(newNames, "Computer #" .. i)
    end
    if #newNames == 0 then newNames = {"No Computers"} end
    computerNames = newNames
    if Options.ComputerDropdown then
        Options.ComputerDropdown:SetValues(computerNames)
        if not table.find(computerNames, Options.ComputerDropdown.Value) then
            Options.ComputerDropdown:SetValue(computerNames[1])
        end
    end
end

MainOtherGB:AddDropdown("ComputerDropdown", {Text = "Computers", Values = {}, Default = 1, Searchable = true, Scrollable = true})

MainOtherGB:AddButton("Teleport (Computer)", function()
    local target = Options.ComputerDropdown and Options.ComputerDropdown.Value
    if target and target ~= "No Computers" then
        local index = tonumber(target:match("#(%d+)"))
        if index and ESPData.KnownComputers[index] then
            local pos = ESPData.KnownComputers[index]:GetPivot().Position
            SmartTeleport(pos + Vector3.new(0, 5, 0))
        end
    end
end)

MainOtherGB:AddLabel("Other")
MainOtherGB:AddDivider()

MainOtherGB:AddDropdown("TeleportType", {
    Text = "Teleport Type",
    Values = {"Instant (TP)", "Slow (Tween)"},
    Default = 1,
})

MainOtherGB:AddSlider("TweenSpeed", {
    Text = "Tween Speed (Studs/s)",
    Default = 100,
    Min = 1,
    Max = 250,
    Rounding = 0,
})

MainOtherGB:AddToggle("NoclipOnTween", {
    Text = "Noclip On Tween",
    Default = true,
})

local function ApplyCharacterMods()
    local char = LocalPlayer.Character
    if not char then return end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = Options.WalkSpeed and Options.WalkSpeed.Value or 16
        hum.JumpPower = Options.JumpPower and Options.JumpPower.Value or 50
    end
end

local function ApplyZoom()
    LocalPlayer.CameraMaxZoomDistance = Options.MaxZoom and Options.MaxZoom.Value or 128
end

local function ApplyNoVelocity()
    local char = LocalPlayer.Character
    if not char then return end
    
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then
        root.Velocity = Vector3.new(0, 0, 0)
        root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    end
end

local noClipConn, bunnyHopConn
local lastJump = 0

local function ToggleNoClip()
    if Toggles.NoClip and Toggles.NoClip.Value then
        local char = LocalPlayer.Character
        if char then
            noClipConn = RunService.Stepped:Connect(function()
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end)
        end
    else
        if noClipConn then noClipConn:Disconnect(); noClipConn = nil end
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = true end
            end
        end
    end
end

local function ToggleBunnyHop()
    if Toggles.BunnyHop and Toggles.BunnyHop.Value then
        bunnyHopConn = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if not char then return end
            
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hum or hum.FloorMaterial == Enum.Material.Air then return end
            
            local delay = Options.BunnyHopDelay and Options.BunnyHopDelay.Value or 0.2
            if tick() - lastJump >= delay then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
                lastJump = tick()
            end
        end)
    else
        if bunnyHopConn then bunnyHopConn:Disconnect(); bunnyHopConn = nil end
    end
end

task.spawn(function()
    while not Options.WalkSpeed do task.wait() end
    Options.WalkSpeed:OnChanged(ApplyCharacterMods)
    Options.JumpPower:OnChanged(ApplyCharacterMods)
    Options.MaxZoom:OnChanged(ApplyZoom)
    Toggles.NoVelocity:OnChanged(ApplyNoVelocity)
    Toggles.NoClip:OnChanged(ToggleNoClip)
    Toggles.BunnyHop:OnChanged(ToggleBunnyHop)
    Options.BunnyHopDelay:OnChanged(function()
        if Toggles.BunnyHop and Toggles.BunnyHop.Value then ToggleBunnyHop() ToggleBunnyHop() end
    end)
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.1)
    ApplyCharacterMods()
    ApplyZoom()
    if Toggles.NoClip and Toggles.NoClip.Value then ToggleNoClip() end
    if Toggles.BunnyHop and Toggles.BunnyHop.Value then ToggleBunnyHop() end
end)

RunService.Heartbeat:Connect(function()
    if Toggles.NoVelocity and Toggles.NoVelocity.Value then ApplyNoVelocity() end
end)

if LocalPlayer.Character then ApplyCharacterMods(); ApplyZoom() end

task.spawn(function()
    while task.wait(1) do
        UpdateSurvivorDropdown()
        UpdateComputerDropdown()
    end
end)

local VisualsTabbox = Tabs.Visuals:AddLeftTabbox()
local ESPTab = VisualsTabbox:AddTab("ESPs", "scan")

ESPTab:AddToggle("ComputerESP", {Text = "Computer ESP", Default = false}):AddColorPicker("ComputerESPColor", {Default = Color3.fromRGB(0,255,0)})
ESPTab:AddToggle("FreezePodESP", {Text = "Freeze Pod ESP", Default = false}):AddColorPicker("FreezePodESPColor", {Default = Color3.fromRGB(0,255,255)})
ESPTab:AddToggle("BeastESP", {Text = "Beast ESP", Default = false}):AddColorPicker("BeastESPColor", {Default = Color3.fromRGB(255,0,0)})
ESPTab:AddToggle("SurvivorESP", {Text = "Survivor ESP", Default = false}):AddColorPicker("SurvivorESPColor", {Default = Color3.fromRGB(0,100,0)})

local ConfigTab = VisualsTabbox:AddTab("Configurations", "gear")

ConfigTab:AddToggle("ShowDistance", {Text = "Show Distance", Default = true})
ConfigTab:AddLabel("Tracers"); ConfigTab:AddDivider()
ConfigTab:AddToggle("SurvivorTracers", {Text = "Survivor Tracers", Default = false})
ConfigTab:AddToggle("BeastTracers", {Text = "Beast Tracers", Default = false})
ConfigTab:AddToggle("ComputerTracers", {Text = "Computer Tracers", Default = false})
ConfigTab:AddToggle("FreezePodTracers", {Text = "Freeze Pod Tracers", Default = false})
ConfigTab:AddLabel("Outlines"); ConfigTab:AddDivider()
ConfigTab:AddToggle("OutlineSurvivors", {Text = "Outline Survivors", Default = false})
ConfigTab:AddToggle("OutlineBeast", {Text = "Outline Beast", Default = false})
ConfigTab:AddToggle("OutlineComputers", {Text = "Outline Computers", Default = false})
ConfigTab:AddToggle("OutlineFreezePod", {Text = "Outline Freeze Pod", Default = false})
ConfigTab:AddLabel("Rainbow Effects"); ConfigTab:AddDivider()
ConfigTab:AddToggle("RainbowESPs", {Text = "Rainbow ESPs", Default = false})
ConfigTab:AddSlider("RainbowSpeed", {Text = "Rainbow Speed", Default = 10, Min = 1, Max = 50, Rounding = 0})
ConfigTab:AddLabel("Other"); ConfigTab:AddDivider()
ConfigTab:AddSlider("ESPTextSize", {Text = "ESP Text Size", Default = 16, Min = 16, Max = 50, Rounding = 0})
ConfigTab:AddDropdown("ESPTextFont", {Text = "Font", Values = {"UI", "System", "Plex", "Monospace"}, Default = 1, Searchable = true, Scrollable = true})
ConfigTab:AddSlider("TracerThickness", {Text = "Tracer Thickness", Default = 2, Min = 1, Max = 10, Rounding = 0})
ConfigTab:AddSlider("OutlineFillTransparency", {Text = "Outline Fill (%)", Default = 100, Min = 0, Max = 100, Rounding = 0})
ConfigTab:AddSlider("OutlineTransparency", {Text = "Outline Transp (%)", Default = 0, Min = 0, Max = 100, Rounding = 0})

local VisualsGameCamGB = Tabs.Visuals:AddRightGroupbox("Game & Camera", "camera")

VisualsGameCamGB:AddSlider("FOVSlider", {Text = "FOV", Default = 80, Min = 80, Max = 120, Rounding = 0})
VisualsGameCamGB:AddToggle("Fullbright", {Text = "Full Bright", Default = false}):AddColorPicker("FullbrightColor", {Default = Color3.fromRGB(255,255,255)})
VisualsGameCamGB:AddToggle("NoFog", {Text = "No Fog", Default = false})

local ESP = {Drawings = {}, Tracers = {}, Highlights = {}, KnownComputers = {}, KnownPods = {}, Connections = {}}
local FontMap = {UI = 0, System = 1, Plex = 2, Monospace = 3}

local function CreateText()
    local t = Drawing.new("Text")
    t.Visible = false; t.Center = true; t.Outline = true; t.Font = 2; t.Size = 16
    return t
end

local function CreateLine()
    local l = Drawing.new("Line")
    l.Visible = false; l.Thickness = 2; l.Transparency = 1
    return l
end

local function CreateHighlight()
    local h = Instance.new("Highlight")
    h.FillTransparency = 1; h.OutlineTransparency = 0; h.Enabled = false
    return h
end

local function GetRainbow(speed)
    return Color3.fromHSV((tick() * ((speed or 10) / 10)) % 1, 1, 1)
end

local function RemoveESP(key)
    local d = ESP.Drawings[key]
    if d and d.Remove then d:Remove() end
    local t = ESP.Tracers[key]
    if t and t.Remove then t:Remove() end
    local h = ESP.Highlights[key]
    if h and h.Destroy then h:Destroy() end
    ESP.Drawings[key], ESP.Tracers[key], ESP.Highlights[key] = nil, nil, nil
end

local function ClearAllESP()
    for key in pairs(ESP.Drawings) do RemoveESP(key) end
end

local function ScanComputers()
    ESP.KnownComputers = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "ComputerTable" and obj:IsA("Model") then
            local screen = obj:FindFirstChild("Screen")
            if screen and screen:IsA("BasePart") then
                local c = screen.Color
                if not (c.R == 40/255 and c.G == 127/255 and c.B == 71/255) then
                    table.insert(ESP.KnownComputers, obj)
                    local key = "Comp_" .. obj:GetDebugId()
                    obj.AncestryChanged:Connect(function(_, parent) if not parent then RemoveESP(key) end end)
                    obj.Destroying:Connect(function() RemoveESP(key) end)
                end
            end
        end
    end
end

local function ScanPods()
    ESP.KnownPods = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj.Name == "FreezePod" or obj.Name == "Freeze Pod") and obj:IsA("Model") then
            table.insert(ESP.KnownPods, obj)
            local key = "Pod_" .. obj:GetDebugId()
            obj.AncestryChanged:Connect(function(_, parent) if not parent then RemoveESP(key) end end)
            obj.Destroying:Connect(function() RemoveESP(key) end)
        end
    end
end

Players.PlayerRemoving:Connect(function(player)
    RemoveESP("Beast_" .. player.UserId)
    RemoveESP("Surv_" .. player.UserId)
end)

local function CleanupTracers()
    for key, tracer in pairs(ESP.Tracers) do
        if tracer and tracer.Remove then tracer:Remove() end
        ESP.Tracers[key] = nil
    end
end

local function CleanupHighlights()
    for key, hl in pairs(ESP.Highlights) do
        if hl and hl.Destroy then hl:Destroy() end
        ESP.Highlights[key] = nil
    end
end

Toggles.SurvivorTracers:OnChanged(function()
    if not Toggles.SurvivorTracers.Value then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local isBeast = player.Character:FindFirstChild("Hammer") ~= nil
                if not isBeast then
                    local key = "Surv_" .. player.UserId
                    if ESP.Tracers[key] then
                        ESP.Tracers[key]:Remove()
                        ESP.Tracers[key] = nil
                    end
                end
            end
        end
    end
end)

Toggles.BeastTracers:OnChanged(function()
    if not Toggles.BeastTracers.Value then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Hammer") then
                local key = "Beast_" .. player.UserId
                if ESP.Tracers[key] then
                    ESP.Tracers[key]:Remove()
                    ESP.Tracers[key] = nil
                end
            end
        end
    end
end)

Toggles.ComputerTracers:OnChanged(function()
    if not Toggles.ComputerTracers.Value then
        for i, obj in ipairs(ESP.KnownComputers) do
            if obj and obj.Parent then
                local key = "Comp_" .. obj:GetDebugId()
                if ESP.Tracers[key] then
                    ESP.Tracers[key]:Remove()
                    ESP.Tracers[key] = nil
                end
            end
        end
    end
end)

Toggles.FreezePodTracers:OnChanged(function()
    if not Toggles.FreezePodTracers.Value then
        for i, obj in ipairs(ESP.KnownPods) do
            if obj and obj.Parent then
                local key = "Pod_" .. obj:GetDebugId()
                if ESP.Tracers[key] then
                    ESP.Tracers[key]:Remove()
                    ESP.Tracers[key] = nil
                end
            end
        end
    end
end)

Toggles.OutlineSurvivors:OnChanged(function()
    if not Toggles.OutlineSurvivors.Value then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local isBeast = player.Character:FindFirstChild("Hammer") ~= nil
                if not isBeast then
                    local key = "Surv_" .. player.UserId
                    if ESP.Highlights[key] then
                        ESP.Highlights[key]:Destroy()
                        ESP.Highlights[key] = nil
                    end
                end
            end
        end
    end
end)

Toggles.OutlineBeast:OnChanged(function()
    if not Toggles.OutlineBeast.Value then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Hammer") then
                local key = "Beast_" .. player.UserId
                if ESP.Highlights[key] then
                    ESP.Highlights[key]:Destroy()
                    ESP.Highlights[key] = nil
                end
            end
        end
    end
end)

Toggles.OutlineComputers:OnChanged(function()
    if not Toggles.OutlineComputers.Value then
        for i, obj in ipairs(ESP.KnownComputers) do
            if obj and obj.Parent then
                local key = "Comp_" .. obj:GetDebugId()
                if ESP.Highlights[key] then
                    ESP.Highlights[key]:Destroy()
                    ESP.Highlights[key] = nil
                end
            end
        end
    end
end)

Toggles.OutlineFreezePod:OnChanged(function()
    if not Toggles.OutlineFreezePod.Value then
        for i, obj in ipairs(ESP.KnownPods) do
            if obj and obj.Parent then
                local key = "Pod_" .. obj:GetDebugId()
                if ESP.Highlights[key] then
                    ESP.Highlights[key]:Destroy()
                    ESP.Highlights[key] = nil
                end
            end
        end
    end
end)

local function UpdateESP()
    local cam = workspace.CurrentCamera
    if not cam then return end
    
    local camPos = cam.CFrame.Position
    local showDist = Toggles.ShowDistance and Toggles.ShowDistance.Value
    local rainbow = Toggles.RainbowESPs and Toggles.RainbowESPs.Value
    
    for _, d in pairs(ESP.Drawings) do 
        if d and d.__OBJECT_EXISTS then 
            d.Size = Options.ESPTextSize and Options.ESPTextSize.Value or 16
            d.Font = FontMap[Options.ESPTextFont and Options.ESPTextFont.Value or "Plex"] or 2
        end 
    end
    
    for _, l in pairs(ESP.Tracers) do 
        if l then 
            l.Thickness = Options.TracerThickness and Options.TracerThickness.Value or 2
        end 
    end
    
    for _, h in pairs(ESP.Highlights) do 
        if h then 
            local fillTrans = Options.OutlineFillTransparency and Options.OutlineFillTransparency.Value or 100
            local outTrans = Options.OutlineTransparency and Options.OutlineTransparency.Value or 0
            h.FillTransparency = fillTrans / 100
            h.OutlineTransparency = outTrans / 100
        end 
    end
    
    if Toggles.ComputerESP and Toggles.ComputerESP.Value then
        for i, obj in ipairs(ESP.KnownComputers) do
            if obj and obj.Parent then
                local key = "Comp_" .. obj:GetDebugId()
                local drawing = ESP.Drawings[key] or CreateText(); ESP.Drawings[key] = drawing
                local tracer = Toggles.ComputerTracers and Toggles.ComputerTracers.Value and (ESP.Tracers[key] or CreateLine()) or ESP.Tracers[key]
                local hl = Toggles.OutlineComputers and Toggles.OutlineComputers.Value and (ESP.Highlights[key] or CreateHighlight()) or ESP.Highlights[key]
                
                local color = rainbow and GetRainbow() or (Options.ComputerESPColor and Options.ComputerESPColor.Value or Color3.fromRGB(0,255,0))
                local pos = obj:GetPivot().Position + Vector3.new(0, 5, 0)
                local screenPos, onScreen = cam:WorldToViewportPoint(pos)
                
                if onScreen then
                    local dist = math.floor((camPos - pos).Magnitude)
                    drawing.Text = showDist and ("Computer #"..i.." ["..dist.." studs]") or ("Computer #"..i)
                    drawing.Position = Vector2.new(screenPos.X, screenPos.Y)
                    drawing.Color = color
                    drawing.Visible = true
                    
                    if tracer then
                        tracer.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y)
                        tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                        tracer.Color = color
                        tracer.Visible = true
                        ESP.Tracers[key] = tracer
                    end
                    
                    if hl then
                        hl.Parent = obj
                        hl.FillColor = color
                        hl.OutlineColor = color
                        hl.Enabled = true
                        ESP.Highlights[key] = hl
                    end
                else
                    drawing.Visible = false
                    if tracer then tracer.Visible = false end
                    if hl then hl.Enabled = false end
                end
            end
        end
    else
        for i, obj in ipairs(ESP.KnownComputers) do
            if obj and obj.Parent then
                local key = "Comp_" .. obj:GetDebugId()
                RemoveESP(key)
            end
        end
    end
    
    if Toggles.FreezePodESP and Toggles.FreezePodESP.Value then
        for i, obj in ipairs(ESP.KnownPods) do
            if obj and obj.Parent then
                local key = "Pod_" .. obj:GetDebugId()
                local drawing = ESP.Drawings[key] or CreateText(); ESP.Drawings[key] = drawing
                local tracer = Toggles.FreezePodTracers and Toggles.FreezePodTracers.Value and (ESP.Tracers[key] or CreateLine()) or ESP.Tracers[key]
                local hl = Toggles.OutlineFreezePod and Toggles.OutlineFreezePod.Value and (ESP.Highlights[key] or CreateHighlight()) or ESP.Highlights[key]
                
                local color = rainbow and GetRainbow() or (Options.FreezePodESPColor and Options.FreezePodESPColor.Value or Color3.fromRGB(0,255,255))
                local pos = obj:GetPivot().Position + Vector3.new(0, 5, 0)
                local screenPos, onScreen = cam:WorldToViewportPoint(pos)
                
                if onScreen then
                    local dist = math.floor((camPos - pos).Magnitude)
                    drawing.Text = showDist and ("Freeze Pod #"..i.." ["..dist.." studs]") or ("Freeze Pod #"..i)
                    drawing.Position = Vector2.new(screenPos.X, screenPos.Y)
                    drawing.Color = color
                    drawing.Visible = true
                    
                    if tracer then
                        tracer.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y)
                        tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                        tracer.Color = color
                        tracer.Visible = true
                        ESP.Tracers[key] = tracer
                    end
                    
                    if hl then
                        hl.Parent = obj
                        hl.FillColor = color
                        hl.OutlineColor = color
                        hl.Enabled = true
                        ESP.Highlights[key] = hl
                    end
                else
                    drawing.Visible = false
                    if tracer then tracer.Visible = false end
                    if hl then hl.Enabled = false end
                end
            end
        end
    else
        for i, obj in ipairs(ESP.KnownPods) do
            if obj and obj.Parent then
                local key = "Pod_" .. obj:GetDebugId()
                RemoveESP(key)
            end
        end
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local isBeast = player.Character:FindFirstChild("Hammer") ~= nil
            local key = (isBeast and "Beast_" or "Surv_") .. player.UserId
            local shouldShow = (isBeast and Toggles.BeastESP and Toggles.BeastESP.Value) or (not isBeast and Toggles.SurvivorESP and Toggles.SurvivorESP.Value)
            local color = rainbow and GetRainbow() or (isBeast and (Options.BeastESPColor and Options.BeastESPColor.Value or Color3.fromRGB(255,0,0)) or (Options.SurvivorESPColor and Options.SurvivorESPColor.Value or Color3.fromRGB(0,100,0)))
            
            if shouldShow then
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    local pos = root.Position + Vector3.new(0, 3.5, 0)
                    local screenPos, onScreen = cam:WorldToViewportPoint(pos)
                    
                    if onScreen then
                        local drawing = ESP.Drawings[key] or CreateText(); ESP.Drawings[key] = drawing
                        local tracer = (isBeast and Toggles.BeastTracers and Toggles.BeastTracers.Value or Toggles.SurvivorTracers and Toggles.SurvivorTracers.Value) and (ESP.Tracers[key] or CreateLine()) or ESP.Tracers[key]
                        local hl = (isBeast and Toggles.OutlineBeast and Toggles.OutlineBeast.Value or Toggles.OutlineSurvivors and Toggles.OutlineSurvivors.Value) and (ESP.Highlights[key] or CreateHighlight()) or ESP.Highlights[key]
                        
                        local dist = math.floor((camPos - pos).Magnitude)
                        drawing.Text = showDist and (player.DisplayName.." ["..(isBeast and "BEAST" or "SURV").."] ["..dist.." studs]") or (player.DisplayName.." ["..(isBeast and "BEAST" or "SURV").."]")
                        drawing.Position = Vector2.new(screenPos.X, screenPos.Y)
                        drawing.Color = color
                        drawing.Visible = true
                        
                        if tracer then
                            tracer.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y)
                            tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                            tracer.Color = color
                            tracer.Visible = true
                            ESP.Tracers[key] = tracer
                        end
                        
                        if hl then
                            hl.Parent = player.Character
                            hl.FillColor = color
                            hl.OutlineColor = color
                            hl.Enabled = true
                            ESP.Highlights[key] = hl
                        end
                    else
                        local d = ESP.Drawings[key]; if d then d.Visible = false end
                        local t = ESP.Tracers[key]; if t then t.Visible = false end
                        local h = ESP.Highlights[key]; if h then h.Enabled = false end
                    end
                end
            else
                RemoveESP(key)
            end
        end
    end
end

ScanComputers()
ScanPods()
UpdateSurvivorDropdown()
UpdateComputerDropdown()

table.insert(ESP.Connections, RunService.Heartbeat:Connect(UpdateESP))

task.spawn(function()
    while task.wait(3) do
        if Toggles.ComputerESP and Toggles.ComputerESP.Value then ScanComputers() end
        if Toggles.FreezePodESP and Toggles.FreezePodESP.Value then ScanPods() end
    end
end)

RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = Options.WalkSpeed and Options.WalkSpeed.Value or 16
            hum.JumpPower = Options.JumpPower and Options.JumpPower.Value or 50
        end
    end
    
    LocalPlayer.CameraMaxZoomDistance = Options.MaxZoom and Options.MaxZoom.Value or 128
    workspace.CurrentCamera.FieldOfView = Options.FOVSlider and Options.FOVSlider.Value or 80
    
    if Toggles.Fullbright and Toggles.Fullbright.Value then
        local color = Options.FullbrightColor and Options.FullbrightColor.Value or Color3.fromRGB(255,255,255)
        Lighting.Ambient = color
        Lighting.ColorShift_Bottom = color
        Lighting.ColorShift_Top = color
        Lighting.OutdoorAmbient = color
        Lighting.Brightness = 1
        Lighting.ClockTime = 12
        Lighting.GlobalShadows = false
    else
        Lighting.Ambient = Color3.fromRGB(127, 127, 127)
        Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        Lighting.Brightness = 1
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = true
    end
    
    if Toggles.NoFog and Toggles.NoFog.Value then
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
        if Lighting:FindFirstChild("Atmosphere") then
            Lighting.Atmosphere.Density = 0
        end
    else
        Lighting.FogEnd = 100
        Lighting.FogStart = 0
        if Lighting:FindFirstChild("Atmosphere") then
            Lighting.Atmosphere.Density = 0.3
        end
    end
end)

local FeaturesGB = Tabs.Features:AddLeftGroupbox("Features", "zap")

FeaturesGB:AddToggle("BeastPOV", {Text = "Beast Point Of View (POV)", Default = false})
FeaturesGB:AddDropdown("BeastPOVPlacement", {
    Text = "Beast (POV) Screen Placement",
    Values = {"Upper Left Corner", "Upper Right Corner", "Lower Right Corner", "Lower Left Corner", "Middle Right", "Middle Left", "Middle Upper", "Middle Lower"},
    Default = 1,
})
FeaturesGB:AddSlider("BeastPOVSize", {
    Text = "Beast (POV) Frame Size",
    Default = 5,
    Min = 1,
    Max = 10,
    Rounding = 0,
})
FeaturesGB:AddDivider()
FeaturesGB:AddToggle("NoPCError", {Text = "No PC Error", Default = false})
FeaturesGB:AddLabel("All Credits Of This Feature <font color=\"rgb(0,255,0)\"><u>Anti PC Error</u></font> Goes To <font color=\"rgb(0,255,0)\"><b>Imperial - Yarhm</b></font>", true)

FeaturesGB:AddButton({
    Text = "Execute Yarhm & Unload UNXHub",
    Func = function()
        local src = ""
        local CoreGui = game:GetService("StarterGui")
        pcall(function()
            src = game:HttpGet("https://yarhm.mhi.im/scr", false)
        end)
        if src == "" then
            CoreGui:SetCore("SendNotification", {
                Title = "YARHM Outage",
                Text = "YARHM Online is currently unavailable! Sorry for the inconvenience. Using YARHM Offline.",
                Duration = 5,
            })
            src = game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.19/yarhm.lua", false)
        end
        loadstring(src)()
        Library:Unload()
    end,
})

task.spawn(function()
    local OldNameCall = nil
    OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
        local Args = {...}
        local NamecallMethod = getnamecallmethod()
        if NamecallMethod == "FireServer" and Args[1] == "SetPlayerMinigameResult" and Toggles.NoPCError and Toggles.NoPCError.Value then
            Args[2] = true
        end
        return OldNameCall(Self, unpack(Args))
    end)
end)

local BeastPOVGui = nil
local BeastPOVFrame = nil
local BeastViewport = nil
local BeastCamera = nil
local BeastCharClone = nil
local BeastPOVConnection = nil
local LastBeastPlayer = nil

local PlacementPositions = {
    ["Upper Left Corner"] = UDim2.new(0, 10, 0, 10),
    ["Upper Right Corner"] = UDim2.new(1, -260, 0, 10),
    ["Lower Right Corner"] = UDim2.new(1, -260, 1, -260),
    ["Lower Left Corner"] = UDim2.new(0, 10, 1, -260),
    ["Middle Right"] = UDim2.new(1, -260, 0.5, -125),
    ["Middle Left"] = UDim2.new(0, 10, 0.5, -125),
    ["Middle Upper"] = UDim2.new(0.5, -125, 0, 10),
    ["Middle Lower"] = UDim2.new(0.5, -125, 1, -260),
}

local function GetBeastPlayer()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Hammer") then
            return player
        end
    end
    return nil
end

local function CleanupBeastClone()
    if BeastCharClone then
        pcall(function() BeastCharClone:Destroy() end)
        BeastCharClone = nil
    end
end

local function CreateBeastPOVUI()
    if BeastPOVGui then return end
    
    BeastPOVGui = Instance.new("ScreenGui")
    BeastPOVGui.Name = "BeastPOVGui"
    BeastPOVGui.ResetOnSpawn = false
    BeastPOVGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BeastPOVGui.Parent = game:GetService("CoreGui")
    
    BeastPOVFrame = Instance.new("Frame")
    BeastPOVFrame.Name = "BeastPOVFrame"
    BeastPOVFrame.Size = UDim2.new(0, 250, 0, 250)
    BeastPOVFrame.Position = PlacementPositions["Upper Left Corner"]
    BeastPOVFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    BeastPOVFrame.BackgroundTransparency = 0.2
    BeastPOVFrame.BorderSizePixel = 3
    BeastPOVFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    BeastPOVFrame.Parent = BeastPOVGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = BeastPOVFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(1, 0, 0, 25)
    TitleLabel.Position = UDim2.new(0, 0, 0, 0)
    TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    TitleLabel.BackgroundTransparency = 0.3
    TitleLabel.BorderSizePixel = 0
    TitleLabel.Text = "BEAST POV"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Parent = BeastPOVFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 8)
    TitleCorner.Parent = TitleLabel
    
    BeastViewport = Instance.new("ViewportFrame")
    BeastViewport.Name = "BeastViewport"
    BeastViewport.Size = UDim2.new(1, -10, 1, -35)
    BeastViewport.Position = UDim2.new(0, 5, 0, 30)
    BeastViewport.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    BeastViewport.BackgroundTransparency = 0
    BeastViewport.BorderSizePixel = 0
    BeastViewport.Parent = BeastPOVFrame
    
    local ViewportCorner = Instance.new("UICorner")
    ViewportCorner.CornerRadius = UDim.new(0, 6)
    ViewportCorner.Parent = BeastViewport
    
    BeastCamera = Instance.new("Camera")
    BeastCamera.Parent = BeastViewport
    BeastViewport.CurrentCamera = BeastCamera
end

local function CreateBeastClone(beastChar)
    CleanupBeastClone()
    
    if not beastChar then return end
    
    local success, clone = pcall(function()
        return beastChar:Clone()
    end)
    
    if not success or not clone then return end
    
    pcall(function()
        for _, obj in ipairs(clone:GetDescendants()) do
            if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                obj:Destroy()
            elseif obj:IsA("BasePart") then
                obj.Anchored = true
                obj.CanCollide = false
                obj.CanQuery = false
                obj.CanTouch = false
            elseif obj:IsA("Humanoid") then
                obj.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            end
        end
        
        clone.Parent = BeastViewport
        BeastCharClone = clone
    end)
end

local function UpdateBeastPOV()
    if not Toggles.BeastPOV or not Toggles.BeastPOV.Value then
        if BeastPOVFrame then
            BeastPOVFrame.Visible = false
        end
        CleanupBeastClone()
        LastBeastPlayer = nil
        return
    end
    
    local beastPlayer = GetBeastPlayer()
    
    if not beastPlayer or not beastPlayer.Character then
        if BeastPOVFrame then
            BeastPOVFrame.Visible = false
        end
        CleanupBeastClone()
        LastBeastPlayer = nil
        return
    end
    
    if not BeastPOVGui then
        CreateBeastPOVUI()
    end
    
    if beastPlayer ~= LastBeastPlayer then
        CreateBeastClone(beastPlayer.Character)
        LastBeastPlayer = beastPlayer
    end
    
    if not BeastCharClone or BeastCharClone.Parent == nil then
        CreateBeastClone(beastPlayer.Character)
    end
    
    local beastHead = beastPlayer.Character:FindFirstChild("Head")
    if beastHead and BeastCamera and BeastCharClone then
        pcall(function()
            BeastCamera.CFrame = beastHead.CFrame
            
            for _, part in ipairs(beastPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    local clonePart = BeastCharClone:FindFirstChild(part.Name)
                    if clonePart and clonePart:IsA("BasePart") then
                        clonePart.CFrame = part.CFrame
                    end
                end
            end
        end)
    end
    
    if BeastPOVFrame and Options.BeastPOVSize and Options.BeastPOVPlacement then
        local sizeValue = Options.BeastPOVSize.Value or 5
        local size = sizeValue * 50
        BeastPOVFrame.Size = UDim2.new(0, size, 0, size)
        BeastPOVFrame.Position = PlacementPositions[Options.BeastPOVPlacement.Value or "Upper Left Corner"]
        BeastPOVFrame.Visible = true
    end
end

task.spawn(function()
    while not Options.BeastPOVPlacement do task.wait() end
    
    Toggles.BeastPOV:OnChanged(function()
        UpdateBeastPOV()
    end)
    
    Options.BeastPOVPlacement:OnChanged(function()
        if Toggles.BeastPOV.Value then
            UpdateBeastPOV()
        end
    end)
    
    Options.BeastPOVSize:OnChanged(function()
        if Toggles.BeastPOV.Value then
            UpdateBeastPOV()
        end
    end)
end)

BeastPOVConnection = RunService.RenderStepped:Connect(function()
    if Toggles.BeastPOV and Toggles.BeastPOV.Value then
        UpdateBeastPOV()
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player == LastBeastPlayer then
        CleanupBeastClone()
        LastBeastPlayer = nil
    end
end)

local FlingGroupBox = Tabs.Features:AddLeftGroupbox("Fling", "wind")

local flingTime = 5
local flingForce = 50000

local function getPlayerList()
	local list = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LocalPlayer then table.insert(list, p.Name) end
	end
	return list
end

FlingGroupBox:AddDropdown("FlingPlayer", {
	Text = "Select Players",
	Values = getPlayerList(),
	Multi = true,
	Searchable = true,
	Callback = function(v) end
})

local function fling(TargetPlayer, duration)
	local startTime = tick()
	local Character = LocalPlayer.Character
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
	local RootPart = Humanoid and Humanoid.RootPart

	local TCharacter = TargetPlayer.Character
	local THumanoid
	local TRootPart
	local THead
	local Accessory
	local Handle

	if TCharacter:FindFirstChildOfClass("Humanoid") then
		THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
	end
	if THumanoid and THumanoid.RootPart then
		TRootPart = THumanoid.RootPart
	end
	if TCharacter:FindFirstChild("Head") then
		THead = TCharacter.Head
	end
	if TCharacter:FindFirstChildOfClass("Accessory") then
		Accessory = TCharacter:FindFirstChildOfClass("Accessory")
	end
	if Accessory and Accessory:FindFirstChild("Handle") then
		Handle = Accessory.Handle
	end

	if Character and Humanoid and RootPart then
		if RootPart.Velocity.Magnitude < 50 then
			getgenv().OldPos = RootPart.CFrame
		end
		if THead then
			workspace.CurrentCamera.CameraSubject = THead
		elseif not THead and Handle then
			workspace.CurrentCamera.CameraSubject = Handle
		elseif THumanoid and TRootPart then
			workspace.CurrentCamera.CameraSubject = THumanoid
		end
		if not TCharacter:FindFirstChildWhichIsA("BasePart") then
			return
		end
		
		local FPos = function(BasePart, Pos, Ang)
			RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
			Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
			RootPart.Velocity = Vector3.new(flingForce, flingForce * 10, flingForce)
			RootPart.RotVelocity = Vector3.new(flingForce * 20, flingForce * 20, flingForce * 20)
		end
		
		local SFBasePart = function(BasePart)
			local TimeToWait = duration or 2
			local Time = tick()
			local Angle = 0

			repeat
				if RootPart and THumanoid then
					if BasePart.Velocity.Magnitude < 50 then
						Angle = Angle + 100

						FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()
					else
						FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						
						FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()
					end
				else
					break
				end
			until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or tick() > Time + TimeToWait
		end
		
		local previousDestroyHeight = workspace.FallenPartsDestroyHeight
		workspace.FallenPartsDestroyHeight = 0/0
		
		local BV = Instance.new("BodyVelocity")
		BV.Name = "EpixVel"
		BV.Parent = RootPart
		BV.Velocity = Vector3.new(flingForce, flingForce, flingForce)
		BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
		
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
		
		if TRootPart and THead then
			if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
				SFBasePart(THead)
			else
				SFBasePart(TRootPart)
			end
		elseif TRootPart and not THead then
			SFBasePart(TRootPart)
		elseif not TRootPart and THead then
			SFBasePart(THead)
		elseif not TRootPart and not THead and Accessory and Handle then
			SFBasePart(Handle)
		end
		
		BV:Destroy()
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		workspace.CurrentCamera.CameraSubject = Humanoid
		
		repeat
			if Character and Humanoid and RootPart and getgenv().OldPos then
				RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
				Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
				Humanoid:ChangeState("GettingUp")
				table.foreach(Character:GetChildren(), function(_, x)
					if x:IsA("BasePart") then
						x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
					end
				end)
			end
			task.wait()
		until RootPart and getgenv().OldPos and (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
		workspace.FallenPartsDestroyHeight = previousDestroyHeight
	end
end

FlingGroupBox:AddButton({Text="Fling Selected", Func=function()
	if not Options.FlingPlayer.Value then return end
	
	for selectedPlayer, isSelected in pairs(Options.FlingPlayer.Value) do
		if isSelected then
			local targetPlayer = Players:FindFirstChild(tostring(selectedPlayer))
			if targetPlayer and targetPlayer.Character then
				fling(targetPlayer, flingTime)
				task.wait(flingTime + 0.5)
			end
		end
	end
end})

FlingGroupBox:AddButton({Text="Fling All", Func=function()
	for _, targetPlayer in ipairs(Players:GetPlayers()) do
		if targetPlayer ~= LocalPlayer and targetPlayer.Character then
			fling(targetPlayer, flingTime)
			task.wait(flingTime + 0.5)
		end
	end
end})

FlingGroupBox:AddButton({Text="Fling Beast", Func=function()
	for _, targetPlayer in ipairs(Players:GetPlayers()) do
		if targetPlayer ~= LocalPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Hammer") then
			fling(targetPlayer, flingTime)
			task.wait(flingTime + 0.5)
			break
		end
	end
end})

FlingGroupBox:AddDivider()

FlingGroupBox:AddSlider("FlingTime", {Text="Fling Time", Default=5, Min=1, Max=25, Rounding=1, Callback=function(v) flingTime = v end})
FlingGroupBox:AddSlider("FlingForce", {Text="Fling Force", Default=50000, Min=1, Max=9999999, Rounding=0, Callback=function(v) flingForce = v end})

local FunMiscGB = Tabs.Features:AddRightGroupbox("Fun & Misc", "confetti_ball")

FunMiscGB:AddToggle("RGBAsync", {Text = "RGB ASync", Default = false})
FunMiscGB:AddSlider("RGBAsyncSpeed", {Text = "RGB Async Speed", Default = 5, Min = 1, Max = 10, Rounding = 0})
FunMiscGB:AddDivider()
FunMiscGB:AddToggle("RGBHammer", {Text = "RGB Hammer", Default = false})
FunMiscGB:AddToggle("RGBLight", {Text = "RGB Light", Default = false})
FunMiscGB:AddSlider("RGBHammerSpeed", {Text = "RGB Hammer Speed", Default = 5, Min = 1, Max = 10, Rounding = 0})
FunMiscGB:AddSlider("RGBLightSpeed", {Text = "RGB Light Speed", Default = 5, Min = 1, Max = 10, Rounding = 0})
FunMiscGB:AddDropdown("RGBMethod", {
    Text = "RGB Method",
    Values = {"HSV", "RGB"},
    Default = 1,
})
FunMiscGB:AddDivider()
FunMiscGB:AddButton("Reset", function()
    if Toggles.RGBAsync then Toggles.RGBAsync:SetValue(false) end
    if Toggles.RGBHammer then Toggles.RGBHammer:SetValue(false) end
    if Toggles.RGBLight then Toggles.RGBLight:SetValue(false) end
    if Options.RGBAsyncSpeed then Options.RGBAsyncSpeed:SetValue(5) end
    if Options.RGBHammerSpeed then Options.RGBHammerSpeed:SetValue(5) end
    if Options.RGBLightSpeed then Options.RGBLightSpeed:SetValue(5) end
    if Options.RGBMethod then Options.RGBMethod:SetValue("HSV") end
end)

FunMiscGB:AddButton("Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end)

local RGB = {
    HammerHighlight = nil,
    GemstoneLight = nil,
    LastHammerUpdate = 0,
    LastLightUpdate = 0,
}

local function GetRGBColor(method, speed)
    local rgbMethod = method or "HSV"
    local rgbSpeed = speed or 5
    
    if rgbMethod == "HSV" then
        return Color3.fromHSV((tick() * rgbSpeed / 10) % 1, 1, 1)
    else
        local time = tick() * rgbSpeed
        return Color3.fromRGB(
            127 + 127 * math.sin(time),
            127 + 127 * math.sin(time + 2),
            127 + 127 * math.sin(time + 4)
        )
    end
end

local function UpdateRGB()
    local char = LocalPlayer.Character
    if not char then return end
    
    if Toggles.RGBHammer and Toggles.RGBHammer.Value then
        local hammer = char:FindFirstChild("Hammer")
        if hammer then
            if not RGB.HammerHighlight then
                RGB.HammerHighlight = Instance.new("Highlight")
                RGB.HammerHighlight.FillTransparency = 0.5
                RGB.HammerHighlight.OutlineTransparency = 0
                RGB.HammerHighlight.Parent = hammer
            end
            
            if tick() - RGB.LastHammerUpdate >= 0.05 then
                local speed = (Toggles.RGBAsync and Toggles.RGBAsync.Value and Options.RGBAsyncSpeed and Options.RGBAsyncSpeed.Value) or (Options.RGBHammerSpeed and Options.RGBHammerSpeed.Value) or 5
                local method = Options.RGBMethod and Options.RGBMethod.Value or "HSV"
                local color = GetRGBColor(method, speed)
                RGB.HammerHighlight.FillColor = color
                RGB.HammerHighlight.OutlineColor = color
                RGB.LastHammerUpdate = tick()
            end
        end
    else
        if RGB.HammerHighlight then
            RGB.HammerHighlight:Destroy()
            RGB.HammerHighlight = nil
        end
    end
    
    if Toggles.RGBLight and Toggles.RGBLight.Value then
        local gemstone = workspace:FindFirstChild(LocalPlayer.Name) and workspace[LocalPlayer.Name]:FindFirstChild("Gemstone")
        if gemstone then
            local handle = gemstone:FindFirstChild("Handle")
            if handle then
                local light = handle:FindFirstChild("PointLight") or Instance.new("PointLight", handle)
                light.Brightness = 3
                light.Range = 15
                
                if tick() - RGB.LastLightUpdate >= 0.05 then
                    local speed = (Toggles.RGBAsync and Toggles.RGBAsync.Value and Options.RGBAsyncSpeed and Options.RGBAsyncSpeed.Value) or (Options.RGBLightSpeed and Options.RGBLightSpeed.Value) or 5
                    local method = Options.RGBMethod and Options.RGBMethod.Value or "HSV"
                    light.Color = GetRGBColor(method, speed)
                    RGB.LastLightUpdate = tick()
                end
            end
        end
    else
        local gemstone = workspace:FindFirstChild(LocalPlayer.Name) and workspace[LocalPlayer.Name]:FindFirstChild("Gemstone")
        if gemstone then
            local handle = gemstone:FindFirstChild("Handle")
            if handle then
                local light = handle:FindFirstChild("PointLight")
                if light then light:Destroy() end
            end
        end
    end
end

RunService.Heartbeat:Connect(UpdateRGB)

task.spawn(function()
    while task.wait(0.1) do
        if Toggles.RGBAsync and Toggles.RGBAsync.Value and Toggles.RainbowESPs and Toggles.RainbowESPs.Value then
            local speed = Options.RGBAsyncSpeed and Options.RGBAsyncSpeed.Value or 5
            local method = Options.RGBMethod and Options.RGBMethod.Value or "HSV"
            
            for _, d in pairs(ESP.Drawings) do
                if d and d.__OBJECT_EXISTS and d.Visible then
                    d.Color = GetRGBColor(method, speed)
                end
            end
            
            for _, l in pairs(ESP.Tracers) do
                if l and l.Visible then
                    l.Color = GetRGBColor(method, speed)
                end
            end
            
            for _, h in pairs(ESP.Highlights) do
                if h and h.Enabled then
                    local color = GetRGBColor(method, speed)
                    h.FillColor = color
                    h.OutlineColor = color
                end
            end
        end
    end
end)

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "RightShift", NoUI = true, Text = "Menu keybind"})
MenuGroup:AddButton("Unload", function() Library:Unload() end)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({"MenuKeybind"})

ThemeManager:SetFolder("unxhub")
SaveManager:SetFolder("unxhub")

SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomButtonGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999999999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = gethui and gethui() or game:GetService("CoreGui")

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HapticService = game:GetService("HapticService")

local button = Instance.new("ImageButton")
button.Name = "CustomButton"
button.Image = "rbxassetid://130346803512317"
button.BackgroundTransparency = 1
button.Position = UDim2.new(0.5, 0, 0, 50)
button.AnchorPoint = Vector2.new(0.5, 0)
button.Size = UDim2.new(0, 60, 0, 60)
button.ClipsDescendants = true
button.ZIndex = 999999999
button.Visible = false
button.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = button

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Thickness = 2
uiStroke.Parent = button

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 140, 100)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 90, 65))
}
uiGradient.Rotation = 0
uiGradient.Parent = uiStroke

local function triggerSmallHaptic()
	if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
		local success, supported = pcall(function()
			return HapticService:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small)
		end)
		
		if success and supported then
			HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0.3)
			task.delay(0.06, function()
				HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0)
			end)
		end
	end
end

local currentInput = nil
local dragStartPos = nil
local isDragging = false
local dragThreshold = 8
local clickStartTime = 0

button.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		if currentInput then return end
		currentInput = input
		dragStartPos = input.Position
		isDragging = false
		clickStartTime = tick()
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == currentInput and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStartPos
		
		if delta.Magnitude > dragThreshold and not isDragging then
			isDragging = true
		end
		
		if isDragging then
			local newPos = UDim2.new(0, dragStartPos.X + delta.X, 0, dragStartPos.Y + delta.Y)
			TweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Position = newPos}):Play()
		end
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input == currentInput then
		local clickDuration = tick() - clickStartTime
		
		if not isDragging and clickDuration < 0.3 then
			Library:Toggle()
			triggerSmallHaptic()
			
			local pos = input.Position
			local absPos = button.AbsolutePosition
			local absSize = button.AbsoluteSize
			local relX = absSize.X > 0 and (pos.X - absPos.X) / absSize.X or 0.5
			local relY = absSize.Y > 0 and (pos.Y - absPos.Y) / absSize.Y or 0.5
			
			local wave = Instance.new("ImageLabel")
			wave.Size = UDim2.new(0, 0, 0, 0)
			wave.Position = UDim2.new(relX, 0, relY, 0)
			wave.AnchorPoint = Vector2.new(0.5, 0.5)
			wave.BackgroundTransparency = 1
			wave.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
			wave.ImageColor3 = Color3.fromRGB(255, 255, 255)
			wave.ImageTransparency = 0.3
			wave.ZIndex = 999999999
			wave.Parent = button
			
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(1, 0)
			corner.Parent = wave
			
			local tween = TweenService:Create(wave, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
				Size = UDim2.new(2.5, 0, 2.5, 0),
				ImageTransparency = 1
			})
			tween:Play()
			task.delay(0.5, function() wave:Destroy() end)
		end
		
		currentInput = nil
		isDragging = false
	end
end)

button.MouseEnter:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
		Size = UDim2.new(0, button.Size.X.Offset * 1.08, 0, button.Size.Y.Offset * 1.08)
	}):Play()
end)

button.MouseLeave:Connect(function()
	local cam = workspace.CurrentCamera
	if not cam then return end
	
	local viewportSize = cam.ViewportSize
	local base = math.clamp(math.min(viewportSize.X, viewportSize.Y) * 0.08, 50, 80)
	local scale = (toggleSize or 100) / 100
	
	TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
		Size = UDim2.new(0, base * scale, 0, base * scale)
	}):Play()
end)

local function updateButtonSize()
	local cam = workspace.CurrentCamera
	if not cam then return end
	
	local viewportSize = cam.ViewportSize
	if not viewportSize then return end
	
	local minViewport = math.min(viewportSize.X or 800, viewportSize.Y or 600)
	local base = math.clamp(minViewport * 0.08, 50, 80)
	local scale = (toggleSize or 100) / 100
	button.Size = UDim2.new(0, base * scale, 0, base * scale)
end

local showToggle = isfile("showtoggle.unx")
local toggleSize = 100
if isfile("togglesize.unx") then
	local success, sizeStr = pcall(function()
		return readfile("togglesize.unx")
	end)
	if success and sizeStr then
		toggleSize = tonumber(sizeStr) or 100
	end
end

if showToggle then
	button.Visible = true
end

updateButtonSize()

workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateButtonSize)

MenuGroup:AddToggle("CustomToggle", { 
	Text = "Custom Toggle", 
	Default = showToggle, 
	Callback = function(v) 
		if v then
			writefile("showtoggle.unx", "")
		else
			if isfile("showtoggle.unx") then
				delfile("showtoggle.unx")
			end
		end
		if button then button.Visible = v end
	end 
})

MenuGroup:AddSlider("CustomToggleSize", { 
	Text = "Custom Toggle Size (%)", 
	Default = toggleSize, 
	Min = 50, 
	Max = 200, 
	Rounding = 0, 
	Callback = function(v)
		toggleSize = v
		writefile("togglesize.unx", tostring(v))
		updateButtonSize()
	end 
})

local function refreshPlayers()
	task.wait(1)
	if Options.FlingPlayer then Options.FlingPlayer:SetValues(getPlayerList()) end
end

Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)
refreshPlayers()

Library:OnUnload(function()
	ClearAllESP()
	for _, c in pairs(ESP.Connections) do if c.Connected then c:Disconnect() end end
	if noClipConn then noClipConn:Disconnect() end
	if bunnyHopConn then bunnyHopConn:Disconnect() end
	if BeastPOVConnection then
		BeastPOVConnection:Disconnect()
		BeastPOVConnection = nil
	end
	CleanupBeastClone()
	if BeastPOVGui then
		pcall(function() BeastPOVGui:Destroy() end)
		BeastPOVGui = nil
	end
	if screenGui then
		screenGui:Destroy()
	end
	game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end)
