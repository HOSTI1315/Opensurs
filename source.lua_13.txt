-- its source again lmao

_G.accept = false
local invite = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")

invite.Name = "invite"
invite.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
invite.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = invite
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(126, 132, 145)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 432, 0, 109)

Frame_2.Parent = Frame
Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_2.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame_2.Size = UDim2.new(1, -2, 1, -2)

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Frame_2

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 13, 0, 13)
TextLabel.Size = UDim2.new(1, 0, 0, 20)
TextLabel.Font = Enum.Font.ArialBold
TextLabel.Text = "Do you want to join the NXP Hub discord server?"
TextLabel.TextColor3 = Color3.fromRGB(185, 185, 185)
TextLabel.TextSize = 14.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

ImageLabel.Parent = Frame_2
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0, 15, 0, 45)
ImageLabel.Size = UDim2.new(0, 50, 0, 50)
ImageLabel.Image = "rbxassetid://92119666481944"

UICorner_2.CornerRadius = UDim.new(0, 13)
UICorner_2.Parent = ImageLabel

TextLabel_2.Parent = Frame_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 75, 0, 50)
TextLabel_2.Size = UDim2.new(1, 0, 0, 20)
TextLabel_2.Font = Enum.Font.ArialBold
TextLabel_2.Text = "NXP Hub [Forsaken]"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 17.000
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

TextLabel_3.Parent = Frame_2
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0, 75, 0, 70)
TextLabel_3.Size = UDim2.new(1, 0, 0, 20)
TextLabel_3.Font = Enum.Font.ArialBold
TextLabel_3.Text = "https://discord.gg/B8RmDbnrWc"
TextLabel_3.TextColor3 = Color3.fromRGB(172, 172, 172)
TextLabel_3.TextSize = 14.000
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

TextButton.Parent = Frame_2
TextButton.AnchorPoint = Vector2.new(1, 1)
TextButton.BackgroundColor3 = Color3.fromRGB(67, 181, 129)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(1, -15, 1, -15)
TextButton.Size = UDim2.new(0, 70, 0, 40)
TextButton.AutoButtonColor = false
TextButton.Font = Enum.Font.ArialBold
TextButton.Text = "Join"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = TextButton

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = Frame

-- Scripts:

local function YQZUQ_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local ts = game:GetService("TweenService")
	local bruh = script.Parent
	local yes = false
	bruh.MouseEnter:Connect(function()
		if yes then return end
		ts:Create(bruh, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(47, 127, 88)}):Play()
	end)
	bruh.MouseLeave:Connect(function()
		if yes then return end
		ts:Create(bruh, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(67, 181, 129)}):Play()
	end)
	bruh.MouseButton1Click:Connect(function()
		setclipboard("https://discord.gg/B8RmDbnrWc")
		yes = true
    _G.accept = true
		ts:Create(bruh, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(41, 112, 77)}):Play()
		script.Parent.Text = "..."
		wait(0.2)
		script.Parent.Text = "Copied"
		wait(1)
		for i, v in pairs(bruh.Parent.Parent:GetDescendants()) do
			if v:IsA("TextButton") or v:IsA("TextLabel") then
				ts:Create(v, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
				ts:Create(v, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
			elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
				ts:Create(v, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
				ts:Create(v, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
			end
		end
		wait(0.5)
		ts:Create(bruh.Parent.Parent, TweenInfo.new(1), {Size = UDim2.fromOffset(432, 0)}):Play()
	end)
end
coroutine.wrap(YQZUQ_fake_script)()
repeat task.wait() until _G.accept

local lplr = game.Players.LocalPlayer
local function kick(reason)
  lplr:Kick(reason)
end
local forsaken_games = {
  99661246287362; -- forsaken but infinite
  100039707794702; -- untitled forsaken engine
  18687417158; -- forsaken original
  76797953666623; -- for the saken
  136474108446847; -- forsaken modded
}
if not table.find(forsaken_games, game.PlaceId) then
  kick("unsupported game")
  return
end

pcall(function()
    for i, v in pairs({"xeno", "solara", "celery", "nezur", "luna"}) do
        if string.find(identifyexecutor():lower(), v) then
            kick("Your executor is not supported. [" .. identifyexecutor() .. "]\n") -- thought i changed it back
        end
    end
end)

-- remove if no like analytics
loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/NeptX/refs/heads/main/NeptZ/Forsaken/test.lua"))()

local function debugCall(suc, res)
    if (not suc) and (res ~= nil) then
        --warn("[DEBUG] " .. res)
    end
end

local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local Network = replicatedStorage:WaitForChild("Modules"):WaitForChild("Network")
local gameMap = workspace.Map

local pathfindingIndex = 0
local function pathfindTo(targetPos)
    local indexNow = pathfindingIndex
    local plr = Players.LocalPlayer
    local char = plr.Character
    if not char then return end

    local hum = char:FindFirstChild("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if (not char) or (not hum) then return end

    local path = PathfindingService:CreatePath({
        AgentRadius = 2,
        AgentHeight = 5,
        AgentCanJump = false,
        AgentJumpHeight = 10,
        AgentMaxSlope = 45
    })

    path:ComputeAsync(root.Position, targetPos)

    if path.Status == Enum.PathStatus.Success then
        for _, waypoint in ipairs(path:GetWaypoints()) do
            if indexNow ~= pathfindingIndex then return end
            repeat hum:MoveTo(waypoint.Position) task.wait() until ((root.Position * Vector3.new(1, 0, 1)) - (waypoint.Position * Vector3.new(1, 0, 1))).magnitude <= 2 or not plr.Character.HumanoidRootPart or indexNow ~= pathfindingIndex
            if waypoint.Action == Enum.PathWaypointAction.Jump then
                hum.Jump = true
            end
        end
    else
        _Notify("Pathfinding", "Path failed! Resorted to teleporting", 7)
        root.CFrame = CFrame.new(targetPos)
    end
end

local autoBlockAnimations = {"rbxassetid://94067586317868", "rbxassetid://107925328038675"} -- like basic slash animations ig
local autoBlockVar

local function hasAbility(name)
    return localPlayer.PlayerGui.MainUI:FindFirstChild("AbilityContainer")
        and localPlayer.PlayerGui.MainUI.AbilityContainer:FindFirstChild(name)
end

local function hasAbilityReady(name)
    if not hasAbility(name) then
        return false
    end

    return hasAbility(name).CooldownTime.Text == ""
end

local actor = Network:WaitForChild("RemoteEvent")


    local function trackAnimations(char)
        local humanoid = char:WaitForChild("Humanoid", 5)
        if not humanoid then return end
        
        local animator = humanoid:WaitForChild("Animator", 5)
        if not animator then return end

        animator.AnimationPlayed:Connect(function(track)
            if hasAbilityReady("Block") and isSurvivor and autoBlockVar and table.find(autoBlockAnimations, track.Animation.AnimationId) then
                if killerModel then
                    local suc, res = pcall(function()
                        if (localPlayer.Character.HumanoidRootPart.Position - killerModel.HumanoidRootPart.Position).magnitude <= 13 then
                            _G._Notify("Blocking", "Hit detected, trying to block", 5)

                            task.wait(Options.AutoBlockMS.Value / 1000)
                            actor.FireServer(actor, "UseActorAbility", "Block")

                            _G._Notify("Blocked", "Hit blocked, you might've still taken damage though", 5)
                        end
                    end)
                end
            end
        end)
    end

    workspace.Players.Killers.ChildAdded:Connect(function(killer)
        trackAnimations(killer)
    end)

    for _, killer in ipairs(workspace.Players.Killers:GetChildren()) do
        trackAnimations(killer)
    end

    local killers = game:GetService("ReplicatedStorage").Assets.Killers

    local function getanims(name)
        return killers:FindFirstChild(name) and require(killers[name].Config).Animations
    end
    
    local jason = getanims("Slasher")
    if jason then
        table.insert(autoBlockAnimations, jason.Slash)
        table.insert(autoBlockAnimations, jason.Behead)
        table.insert(autoBlockAnimations, jason.GashingWoundStart)
    end

    local mathguy = getanims("1x1x1x1")
    if mathguy then
        table.insert(autoBlockAnimations, mathguy.Slash)
        table.insert(autoBlockAnimations, mathguy.MassInfection)
        table.insert(autoBlockAnimations, mathguy.Entanglement)
    end

    local johndoe = getanims("JohnDoe")
    if johndoe then
        table.insert(autoBlockAnimations, johndoe.Slash)
    end

    local noli = getanims("Noli")
    if noli then
        table.insert(autoBlockAnimations, noli.Stab)
        table.insert(autoBlockAnimations, noli.VoidRush.StartDashInit)
    end

    local coolkid = getanims("c00lkidd")
    if coolkid then
        table.insert(autoBlockAnimations, coolkid.Attack)
        table.insert(autoBlockAnimations, coolkid.WalkspeedOverrideStart)
    end

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local function Notify(Title, Text, Duration)
    Library:Notify({
        Title = Title,
        Description = Text,
        Time = Duration,
    })
end
_G._Notify = Notify

Options = Library.Options
Toggles = Library.Toggles

Window = Library:CreateWindow({
    Title = "NXP hub V3.1",
    Footer = "Forsaken | Source",
    Icon = "rbxassetid://130931198530758",
    NotifySide = "Right",
    ShowCustomCursor = true,
    Size = UDim2.fromOffset(736, 370)
})

local Discord = Window:AddTab("DISCORD", "external-link", "Our discord server: https://discord.gg/B8RmDbnrWc")
local A = Discord:AddLeftGroupbox("Discord", "external-link")
A:AddButton({
    Text = "Copy Discord",
    Func = function()
        setclipboard("https://discord.gg/B8RmDbnrWc")
        Notify("Copied", "Discord invite copied! please join", 9)
    end
})

local Tabs = {
    Main = Window:AddTab("Main", "zap"),
    ESP = Window:AddTab("Visuals", "eye"),
    ["Local Player"] = Window:AddTab("Local", "user"), -- renamed to local
    Killer = Window:AddTab("Player", "pencil"), -- renamed to player
    Teleport = Window:AddTab("Locations", "pin"),
    Anti = Window:AddTab("Antis", "ban"),
    Misc = Window:AddTab("Misc", "cloudy"),
    ["UI Settings"] = Window:AddTab("UI Settings", "wrench"),
}


task.spawn(function()
    while task.wait() do
        local _isKiller = false

        if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
            for _, v in pairs(workspace.Players.Killers:GetChildren()) do
                if v:GetAttribute("Username") and game.Players:FindFirstChild(v:GetAttribute("Username")) then
                    killerModel = v
                end

                if v:GetAttribute("Username") == localPlayer.Name then
                    killerModel = v
                    _isKiller = true
                end
            end

            isSurvivor = not _isKiller
            isKiller = _isKiller
        end
    end
end)

local function getClosestSurvivorToMouse(x, y)
    local closestDistance = math.huge
    local closestSurvivor = nil
    local cam = workspace.CurrentCamera

    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors") then
        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
            if v:GetAttribute("Username") ~= localPlayer.Name then
                if v:FindFirstChild("HumanoidRootPart")then
                    local nihpos = v.HumanoidRootPart.Position
                    local vector, onScreen = cam:WorldToViewportPoint(nihpos)

                    if onScreen then
                        local mag = (Vector2.new(x, y) - Vector2.new(vector.X, vector.Y)).Magnitude
                        if mag < closestDistance then
                            closestDistance = mag
                            closestSurvivor = v
                        end
                    end
                end
            end
        end
    end

    return closestSurvivor
end

local GeneratorsGroup = Tabs.Main:AddLeftGroupbox("Generators", "battery-charging")
local SurvivorsGroup = Tabs.Main:AddRightGroupbox("Survivors", "user")
local ItemsGroup = Tabs.Main:AddLeftGroupbox("Items", "shovel")
local AimbotGroup = Tabs.Main:AddRightGroupbox("Aimbot", "mouse")

local GeneratorsESPGroup = Tabs.ESP:AddLeftGroupbox("Generators ESP", "battery-charging")
local KillersESPGroup = Tabs.ESP:AddLeftGroupbox("Killers ESP", "skull")
local SurvivorsESPGroup = Tabs.ESP:AddRightGroupbox("Survivors ESP", "user")
local ItemsESPGroup = Tabs.ESP:AddRightGroupbox("Items ESP", "shovel")
local MiscESPGroup = Tabs.ESP:AddRightGroupbox("Misc ESP", "chart-no-axes-gantt")
local ESPSettingsGroup = Tabs.ESP:AddLeftGroupbox("ESP Settings", "settings")

local function generatorWait()
    task.wait(Options.GeneratorDelay1.Value < Options.GeneratorDelay2.Value and math.random(Options.GeneratorDelay1.Value * 10, Options.GeneratorDelay2.Value * 10) / 10 or math.random(Options.GeneratorDelay2.Value * 10, Options.GeneratorDelay1.Value * 10) / 10)
end

ESPSettingsGroup:AddToggle("ShowOutlinesInESP", {
    Text = "Show Outlines",
}):AddColorPicker("ESPOutlineColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Outline Color",
})
--[[ESPSettingsGroup:AddToggle("OnlyShowOutlinesInESP", {
    Text = "Dont Fill",
    Callback = function()
        task.spawn(function()
            while Toggles.OnlyShowOutlinesInESP.Value and task.wait() do
                Toggles.ShowOutlinesInESP:SetValue(true)
            end
        end)
    end
})]]

ESPSettingsGroup:AddSlider("ESPFillTransparency", {
    Text = "Fill Transparency",
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 1,
})

GeneratorsESPGroup:AddToggle("GeneratorsESP", {
    Text = "Generators ESP",
    Default = false,
    Callback = function(bool)
        _G.generators = bool

        task.spawn(function()
            while task.wait() do
                if _G.generators then
                    debugCall(pcall(function()
                        if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                if v.Name == "Generator" and not v:FindFirstChild("gen_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "gen_esp"
                                elseif v:FindFirstChild("gen_esp") and v.Name == "Generator" then
                                    if v:FindFirstChild("Progress") then
                                        if v.Progress.Value < 100 or not Toggles.GeneratorsESPGreen.Value then
                                            v.gen_esp.FillColor = Options.GeneratorsESPColor.Value
                                        end
                                    end

                                    v.gen_esp.OutlineTransparency = Toggles.ShowOutlinesInESP.Value and 0 or 1
                                    v.gen_esp.FillTransparency = Options.ESPFillTransparency.Value
                                    v.gen_esp.OutlineColor = Options.ESPOutlineColor.Value

                                    if v:FindFirstChild("Progress") and v.Progress.Value >= 100 and Toggles.GeneratorsESPGreen.Value then
                                        v.gen_esp.FillColor = Color3.fromRGB(0, 255, 0)
                                    end
                                end
                            end
                        end
                    end))
                else
                    debugCall(pcall(function()
                        if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                if v.Name == "Generator" and v:FindFirstChild("gen_esp") then
                                    v.gen_esp:Destroy()
                                end
                            end
                        end
                    end))
                    break
                end
            end
        end)
    end
}):AddColorPicker("GeneratorsESPColor", {
    Default = Color3.fromRGB(255, 255, 51),
    Title = "Generator Color",
})

GeneratorsESPGroup:AddToggle("GeneratorsESPGreen", {
    Text = "Show Green When Done",
})

GeneratorsESPGroup:AddToggle("GeneratorsNametags", {
    Text = "Generators Nametags",
    Default = false,
    Callback = function(bool)
        _G.generatorstag = bool

        task.spawn(function()
            while task.wait() do
                if _G.generatorstag then
                    pcall(function()
                        if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                if v.Name == "Generator" and not v:FindFirstChild("nametag") then
                                    local bb = Instance.new("BillboardGui", v)
                                    bb.Size = UDim2.new(4, 0, 1, 0)
                                    bb.AlwaysOnTop = true
                                    bb.Name = "nametag"

                                    local text = Instance.new("TextLabel", bb)
                                    text.TextStrokeTransparency = 0
                                    text.Text = "Generator (" .. (v:FindFirstChild("Progress") and v.Progress.Value or 0) .. "%)"
                                    text.TextSize = 15
                                    text.BackgroundTransparency = 1
                                    text.Size = UDim2.new(1, 0, 1, 0)
                                elseif v:FindFirstChild("nametag") and v.Name == "Generator" then
                                    v.nametag.TextLabel.TextColor3 = Options.GeneratorsNametagsColor.Value

                                    if v:FindFirstChild("Progress") then
                                        v.nametag.TextLabel.Text = "Generator (" .. v.Progress.Value .. "%)"
                                    end
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                if v.Name == "Generator" and v:FindFirstChild("nametag") then
                                    v.nametag:Destroy()
                                end
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
}):AddColorPicker("GeneratorsNametagsColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Nametag Color",
})

local generatorsDid = {}
local activelyAutoing = false

GeneratorsGroup:AddToggle("AutoCompleteGenerator", {
    Text = "Auto Complete Generator",
    Default = false,
    Callback = function(bool)
        _G.instantGenerator = bool

        task.spawn(function()
            while _G.instantGenerator and task.wait() do
                if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                    pcall(function()
                        for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                            debugCall(pcall(function()
                                if not generatorsDid[v] and v.Name == "Generator" and v:FindFirstChild("Scripts") and v.Scripts:FindFirstChild("Client") then
                                    if not getsenv(v.Scripts.Client).toggleGeneratorState then return end
                                    generatorsDid[v] = true
                                    local old; old = hookfunction(getsenv(v.Scripts.Client).toggleGeneratorState, newcclosure(function(a)
                                        if checkcaller() then
                                            return old(a)
                                        end

                                        if not _G.instantGenerator then
                                            return old(a) 
                                        end

                                        if a ~= "enter" then 
                                            activelyAutoing = false
                                            return old("leave")
                                        end

                                        local result = v.Remotes.RF:InvokeServer("enter")
                                        if result ~= "fixing" then
                                            return
                                        end

                                        activelyAutoing = true

                                        for i = 1, 4 do
                                            if v.Progress.Value >= 100 then break end
                                            v.Remotes.RE:FireServer()
                                            setthreadidentity(8)
                                            Notify("Generator Step", "Finished puzzle " .. i, 4)
                                            generatorWait()
                                        end

                                        activelyAutoing = false
                                        return ""
                                    end))
                                end
                            end))
                        end
                    end)
                end
            end
        end)
    end
})

GeneratorsGroup:AddToggle("AutoStartGenerator", {
    Text = "Auto Start Generator",
    Default = false,
    Callback = function(bool)
        _G.autoGen = bool
        task.spawn(function()
            while _G.autoGen and task.wait() do
                if gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                    pcall(function()
                        for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                            if v.Name == "Generator" then
                                pcall(function()
                                    local function nextStep()
                                        if localPlayer.PlayerGui:FindFirstChild("PuzzleUI") then return end
                                        if activelyAutoing then return end

                                        if v.Main:FindFirstChild("Prompt") then
                                            fireproximityprompt(v.Main.Prompt)
                                        end
                                        task.wait(1)
                                    end

                                    local hello = v.Positions.Center.Position
                                    local hello2 = v.Positions.Right.Position
                                    local hello3 = v.Positions.Left.Position

                                    if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

                                    local pos = localPlayer.Character.HumanoidRootPart.Position
                                    if (pos - hello).Magnitude <= 4 then
                                        nextStep()
                                    elseif (pos - hello2).Magnitude <= 4 then
                                        nextStep()
                                    elseif (pos - hello3).Magnitude <= 4 then
                                        nextStep()
                                    end
                                end)
                            end
                        end
                    end)
                end
            end
        end)
    end
})

GeneratorsGroup:AddButton({
    Text = "Complete Active Generator",
    Func = function()
        if activelyAutoing then return end
        pcall(function()
            if not (gameMap and gameMap.Ingame and gameMap.Ingame.Map) then return end
            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" then
                    pcall(function ()
                        if localPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
                            local hello = v.Positions.Center.Position
                            if (localPlayer.Character.HumanoidRootPart.Position - hello).Magnitude <= 21 then
                                for i = 1, 4 do
                                    if v.Progress.Value >= 100 then break end

                                    if activelyAutoing then return end
                                    if not localPlayer.PlayerGui:FindFirstChild("PuzzleUI") then break end

                                    setthreadidentity(8)
                                    Notify("Generator Step", "Finished puzzle " .. i, 4 )
                                    v.Remotes.RE:FireServer()
                                    generatorWait()
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end
})

GeneratorsGroup:AddButton({
    Text = "Complete All Generators",
    Func = function()
        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end

        if activelyAutoing then return end

        debugCall(pcall(function()
            if not (gameMap and gameMap.Ingame and gameMap.Ingame.Map) then return end

            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" then
                    debugCall(pcall(function()
                        if v.Progress.Value >= 100 then return end

                        local function checkOccupance(pos)
                            if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then print("yeah 1") return false end
                            for _, sv in pairs(workspace.Players.Survivors:GetChildren()) do
                                if sv:FindFirstChild("HumanoidRootPart") then
                                    if sv ~= localPlayer then
                                        if (sv.HumanoidRootPart.Position - pos).Magnitude <= 6 then
                                            return true
                                        end
                                    end
                                end
                            end

                            return false
                        end
                        local centerOccupied, rightOccupied, leftOccupied =
                            checkOccupance(v.Positions.Center.Position),
                            checkOccupance(v.Positions.Right.Position),
                            checkOccupance(v.Positions.Left.Position)
                            
                        if centerOccupied and rightOccupied and leftOccupied then return print("occuhpied")end
                        if not centerOccupied then
                            localPlayer.Character.HumanoidRootPart.CFrame = v.Positions.Center.CFrame
                        elseif not rightOccupied then
                            localPlayer.Character.HumanoidRootPart.CFrame = v.Positions.Right.CFrame
                        else
                            localPlayer.Character.HumanoidRootPart.CFrame = v.Positions.Left.CFrame
                        end

                        task.wait(0.2)
                        

                        local result = v.Remotes.RF:InvokeServer("enter")
                        if result ~= "fixing" then
                            return
                        end

                        for j = 1, 4 do
                            if v.Progress.Value >= 100 then break end
                            if activelyAutoing then return end
                            setthreadidentity(8)
                            Notify("Generator Step", "Finished puzzle " .. tostring(j), 4)
                            v.Remotes.RE:FireServer()
                            generatorWait()
                        end
                    end))
                end
            end
        end))
    end
})

GeneratorsGroup:AddSlider("GeneratorDelay1", {
    Text = "Puzzle Delay 1",
    Default = 1.4,
    Min = 1.4,
    Max = 16,
    Rounding = 1,
})

GeneratorsGroup:AddSlider("GeneratorDelay2", {
    Text = "Puzzle Delay 2",
    Default = 1.4,
    Min = 1.4,
    Max = 16,
    Rounding = 1,
})

local aimbotHeld = false
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function (i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotHeld = true
    end
end)
uis.InputEnded:Connect(function (i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotHeld = false
    end
end)
AimbotGroup:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = false,
    Callback = function (bool)
        _G.aimbot = bool
        if bool then
            game.StarterGui:SetCore("SendNotification", { Title = "aimbot enabled", Text = "aimbot is now on you can now hold right click to lock onto a survivor or the killer", Duration = 9 })
        end
        task.spawn(function()
            while _G.aimbot do
                if aimbotHeld then
                    local cam = workspace.CurrentCamera
                    if isKiller then
                        local mouse = localPlayer:GetMouse()
                        local x, y = mouse.X, mouse.Y
                        local v = getClosestSurvivorToMouse(x, y)
                        if v then
                            local root = v.HumanoidRootPart
                            cam.CFrame = CFrame.new(cam.CFrame.Position, root.Position + (Toggles.AimbotPrediction.Value and (v.HumanoidRootPart.Velocity * (10 / Options.PredictionLevel.Value)) or Vector3.one))
                        end
                    elseif isSurvivor then
                        if killerModel and ({cam:WorldToViewportPoint(killerModel.HumanoidRootPart.Position)})[2] then
                            cam.CFrame = CFrame.new(cam.CFrame.Position, killerModel.HumanoidRootPart.Position + (Toggles.AimbotPrediction.Value and (killerModel.HumanoidRootPart.Velocity * (10 / Options.PredictionLevel.Value )) or Vector3.one))
                        end
                    end
                end 
                task.wait()
            end
        end)
    end
})
AimbotGroup:AddToggle("AimbotPrediction", {
    Text = "Prediction",
    Default = true
})
AimbotGroup:AddSlider("PredictionLevel", {
    Text = "Prediction Level",
    Default = 100,
    Min = 25,
    Max = 100,
    Rounding = 0,
})

KillersESPGroup:AddToggle("KillerESP", {
    Text = "Killer ESP",
    Default = false,
    Callback = function(bool)
        _G.killers = bool
        task.spawn(function()
            while task.wait() do
                if _G.killers == true and not isKiller then
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
                        for _, v in pairs(workspace.Players.Killers:GetChildren()) do
                            if not v:FindFirstChild("killer_esp") then
                                local hl = Instance.new("Highlight", v)
                                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                hl.Name = "killer_esp"
                            else
                                v.killer_esp.FillColor = Options.KillerESPColor.Value
                                v.killer_esp.OutlineTransparency = Toggles.ShowOutlinesInESP.Value and 0 or 1
                                v.killer_esp.FillTransparency = Options.ESPFillTransparency.Value
                                v.killer_esp.OutlineColor = Options.ESPOutlineColor.Value
                            end
                        end
                    end
                else
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
                        for _, v in pairs(workspace.Players.Killers:GetChildren()) do
                            if v:FindFirstChild("killer_esp") then
                                v.killer_esp:Destroy()
                            end
                        end
                    end
                    break
                end
            end
        end)
    end
}):AddColorPicker("KillerESPColor", {
    Default = Color3.fromRGB(255, 0, 0),
    Title = "Killer Color",
})

KillersESPGroup:AddToggle("KillersNametags", {
    Text = "Killer Nametag",
    Default = false,
    Callback = function(bool)
        _G.killertag = bool
        task.spawn(function()
            while task.wait() do
                if _G.killertag then
                    pcall(function()
                        local v = killerModel
                        if v and not v:FindFirstChild("nametag") then
                            local bb = Instance.new("BillboardGui", v)
                            bb.Size = UDim2.new(4, 0, 1, 0)
                            bb.AlwaysOnTop = true
                            bb.Name = "nametag"
                            local text = Instance.new("TextLabel", bb)
                            text.TextStrokeTransparency = 0
                            text.Text = "Killer"
                            text.TextSize = 15
                            text.BackgroundTransparency = 1
                            text.Size = UDim2.new(1, 0, 1, 0)
                        elseif v and v:FindFirstChild("nametag") then
                            v.nametag.TextLabel.TextColor3 = Options.KillerNametagColor.Value
                        end
                    end)
                else
                    pcall(function()
                        if killerModel and killerModel:FindFirstChild("nametag") then
                            killerModel.nametag:Destroy()
                        end
                    end)
                    break
                end
            end
        end)
    end
}):AddColorPicker("KillerNametagColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Color",
})

SurvivorsESPGroup:AddToggle("SurvivorESP", {
    Text = "Survivors ESP",
    Default = false,
    Callback = function(bool)
        _G.survivors = bool
        task.spawn(function()
            while task.wait() do
                if _G.survivors == true then
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors") then
                        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
                            if v:GetAttribute("Username") ~= localPlayer.Name then
                                if not v:FindFirstChild("survivor_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "survivor_esp"
                                else    
                                    v.survivor_esp.FillColor = Options.SurvivorsESP.Value
                                    v.survivor_esp.OutlineTransparency = Toggles.ShowOutlinesInESP.Value and 0 or 1
                                    v.survivor_esp.FillTransparency = Options.ESPFillTransparency.Value
                                    v.survivor_esp.OutlineColor = Options.ESPOutlineColor.Value
                                end
                            end
                        end
                    end
                else
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors") then
                        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
                            if v:FindFirstChild("survivor_esp") then
                                v.survivor_esp:Destroy()
                            end
                        end
                    end
                    break
                end
            end
        end)
    end
}):AddColorPicker("SurvivorsESP", {
    Default = Color3.fromRGB(0, 0, 255),
    Title = "Survivor Color",
})

SurvivorsESPGroup:AddToggle("SurvivorsNametags", {
    Text = "Survivors Nametag",
    Default = false,
    Callback = function(bool)
        _G.survivorstag = bool
        task.spawn(function()
            while task.wait() do
                if _G.survivorstag then
                    pcall(function()
                        for i, v in pairs(workspace.Players.Survivors:GetChildren()) do
                            if v:GetAttribute("Username") ~= localPlayer.Name then
                                if not v:FindFirstChild("nametag") then
                                    local bb = Instance.new("BillboardGui", v)
                                    bb.Size = UDim2.new(4, 0, 1, 0)
                                    bb.AlwaysOnTop = true
                                    bb.Name = "nametag"
                                    local text = Instance.new("TextLabel", bb)
                                    text.TextStrokeTransparency = 0
                                    text.Text = "Survivor"
                                    text.TextSize = 15
                                    text.BackgroundTransparency = 1
                                    text.Size = UDim2.new(1, 0, 1, 0)
                                elseif v:FindFirstChild("nametag") then
                                    v.nametag.TextLabel.TextColor3 = Options.SurvivorNametagColor.Value
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        for i, v in pairs(workspace.Players.Survivors:GetChildren()) do
                            if v:FindFirstChild("nametag") then
                                v.nametag:Destroy()
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
}):AddColorPicker("SurvivorNametagColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Color",
})

SurvivorsGroup:AddToggle("AutoCoinFlip", {
    Text = "Auto Coin Flip",
    Default = false,
    Callback = function (cool)
        _G.coin = cool
        task.spawn(function ()
            while _G.coin and task.wait(2.1) do
                Network:WaitForChild("RemoteEvent"):FireServer("UseActorAbility", "CoinFlip")
            end
        end)
    end
})

-- silent aim bruh
local SilentAimGroup = Tabs.Main:AddLeftGroupbox("Silent Aim", "swords")
SilentAimGroup:AddToggle("DusekkarSilentAim", {
    Text = "Dusekkar Silent Aim",
})
SilentAimGroup:AddToggle("CoolkidSilentAim", {
    Text = "c00lkid Silent Aim",
})
local suc, res = pcall(function()
    local isDusekkar = false
    local isCoolkid
    local old; old = hookmetamethod(game, "__namecall", function(self, ...)
        if typeof(self) == "Instance" and tostring(self) == "RemoteEvent" then
            if ({...})[2] == "PlasmaBeam" then
                isDusekkar = true
                task.spawn(function()
                    task.wait(3)
                    isDusekkar = false
                end)
            elseif ({...})[2] == "CorruptNature" then
                isCoolkid = true
                task.spawn(function()
                    task.wait(3)
                    isCoolkid = false
                end)
            end
        end
        return old(self, ...)
    end)
    local gmp = require(game:GetService("ReplicatedStorage").Systems.Player.Miscellaneous.GetPlayerMousePosition).GetMousePos
    local old; old = hookfunction(gmp, newcclosure(function()
        if isDusekkar and killerModel and Toggles.DusekkarSilentAim.Value then
            return killerModel.HumanoidRootPart.Position
        end
        if isCoolkid and getClosestSurvivor() and Toggles.CoolkidSilentAim.Value then
            return getClosestSurvivor().HumanoidRootPart.Position
        end
        return old()
    end))
end)
if not suc then
    warn("error in silent aim:", res)
else
    print("dusekkar set up")
end

SurvivorsGroup:AddToggle("AutoBlock", {
    Text = "Auto Block",
    Default = false,
    Callback = function(cool)
        autoBlockVar = cool
        if autoBlockVar then
            Notify("beware", "this feature is very beta IDK in what cases it works LOL", 7)
        end
    end
})
SurvivorsGroup:AddSlider("AutoBlockMS", {
    Text = "Block Delay [ms]",
    Default = 110,
    Min = 0,
    Max = 300,
    Rounding = 0
})

function hasNotification(text)
    for i, v in pairs(localPlayer.PlayerGui.Notis:GetChildren()) do
        if string.find(v.Text:lower(), text) then
            return true
        end
    end
end
local function backstab(model)
    if not model then
        return
    else
        local stabbing = tick()
        local oldCf = localPlayer.Character.HumanoidRootPart.CFrame
        task.spawn(function()
            task.wait(0.2)
            Network:WaitForChild("RemoteEvent"):FireServer("UseActorAbility", "Dagger")
        end)
        repeat
            localPlayer.Character.HumanoidRootPart.CFrame = model.HumanoidRootPart.CFrame - (model.HumanoidRootPart.CFrame.LookVector * 1)
            task.wait()
        until (tick() - stabbing >= 3.5) or hasNotification("stab")
        task.wait(0.5)
        localPlayer.Character.HumanoidRootPart.CFrame = oldCf
    end
end
local function backstabClose(model)
    if not model then
        return
    else
        if (localPlayer.Character.HumanoidRootPart.Position - model.HumanoidRootPart.Position).magnitude <= Options.BackstabRange.Value then
            backstab(model)
        end
    end
end
SurvivorsGroup:AddToggle("AutoDagger", {
    Text = "Auto Backstab",
    Default = false,
    Callback = function(cool)
        task.spawn(function()
            while Toggles.AutoDagger.Value and task.wait(0.1) do
                if hasAbilityReady("Dagger") and isSurvivor then
                    local suc, res = pcall(backstab, killerModel)
                    if not suc then
                        warn("error when backstabbing:", res)
                    end
                end
            end
        end)
    end
})
SurvivorsGroup:AddToggle("DaggerAura", {
    Text = "Backstab Aura",
    Default = false,
    Callback = function(cool)
        task.spawn(function()
            while Toggles.DaggerAura.Value and task.wait(0.1) do
                if not Toggles.AutoDagger.Value and hasAbilityReady("Dagger") and isSurvivor then
                    local suc, res = pcall(backstabClose, killerModel)
                    if not suc then
                        warn("error when backstabbing near killer:", res)
                    end
                end
            end
        end)
    end
})
SurvivorsGroup:AddSlider("BackstabRange", {
    Text = "Backstab Aura Range",
    Default = 20,
    Min = 7,
    Max = 99,
    Rounding = 0
})

ItemsESPGroup:AddToggle("ItemsESP", {
    Text = "Items ESP",
    Default = false,
    Callback = function(bool)
        _G.items = bool
        task.spawn(function()
            while task.wait() do
                if _G.items == true then
                    debugCall(pcall(function()
                        if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(gameMap.Ingame:GetChildren()) do
                                if v:IsA("Tool") and not v:FindFirstChild("tool_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "tool_esp"
                                elseif v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp.FillColor = Options.ItemsESPColor.Value
                                    v.tool_esp.OutlineTransparency = Toggles.ShowOutlinesInESP.Value and 0 or 1
                                    v.tool_esp.FillTransparency = Options.ESPFillTransparency.Value
                                    v.tool_esp.OutlineColor = Options.ESPOutlineColor.Value
                                end
                            end
                            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                if v:IsA("Tool") and not v:FindFirstChild("tool_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "tool_esp"
                                    hl.OutlineTransparency = Toggles.ShowOutlinesInESP.Value and 0 or 1
                                elseif v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp.FillColor = Options.ItemsESPColor.Value
                                    v.tool_esp.OutlineTransparency = Toggles.ShowOutlinesInESP.Value and 0 or 1
                                    v.tool_esp.FillTransparency = Options.ESPFillTransparency.Value
                                    v.tool_esp.OutlineColor = Options.ESPOutlineColor.Value
                                end
                            end
                        end
                    end))
                else
                    debugCall(pcall(function()
                        if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(gameMap.Ingame:GetChildren()) do
                                if v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp:Destroy()
                                end
                            end
                            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                if v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp:Destroy()
                                end
                            end
                        end
                    end))
                    break
                end
            end
        end)
    end
}):AddColorPicker("ItemsESPColor", {
    Default = Color3.fromRGB(0, 255, 255),
    Title = "Item Color",
})

ItemsESPGroup:AddToggle("ItemsNametags", {
    Text = "Items Nametag",
    Default = false,
    Callback = function(bool)
        _G.killertag = bool
        task.spawn(function()
            while task.wait() do
                if _G.killertag then
                    pcall(function()
                        if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") then
                            for _, v in pairs(gameMap.Ingame:GetChildren()) do
                                if v:IsA("Tool") then
                                    if not v:FindFirstChild("tool_nametag") then
                                        local bb = Instance.new("BillboardGui", v)
                                        bb.Size = UDim2.new(4, 0, 1, 0)
                                        bb.AlwaysOnTop = true
                                        bb.Name = "tool_nametag"
                                        local text = Instance.new("TextLabel", bb)
                                        text.TextStrokeTransparency = 0
                                        text.Text = (v.Name == "BloxyCola" and "Bloxy Cola") or v.Name
                                        text.TextSize = 15
                                        text.BackgroundTransparency = 1
                                        text.Size = UDim2.new(1, 0, 1, 0)
                                    elseif v:FindFirstChild("tool_nametag") then
                                        v.tool_nametag.TextLabel.TextColor3 = Options.itemNametagColor.Value
                                    end
                                end
                            end
                            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                if v:IsA("Tool") then
                                    if not v:FindFirstChild("tool_nametag") then
                                        local bb = Instance.new("BillboardGui", v)
                                        bb.Size = UDim2.new(4, 0, 1, 0)
                                        bb.AlwaysOnTop = true
                                        bb.Name = "tool_nametag"
                                        local text = Instance.new("TextLabel", bb)
                                        text.TextStrokeTransparency = 0
                                        text.Text = (v.Name == "BloxyCola" and "Bloxy Cola") or v.Name
                                        text.TextSize = 15
                                        text.BackgroundTransparency = 1
                                        text.Size = UDim2.new(1, 0, 1, 0)
                                    elseif v:FindFirstChild("tool_nametag") then
                                        v.tool_nametag.TextLabel.TextColor3 = Options.itemNametagColor.Value
                                    end
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") then
                            for _, v in pairs(gameMap.Ingame:GetChildren()) do
                                if v:IsA("Tool") and v:FindFirstChild("tool_nametag") then
                                    v.tool_nametag:Destroy()
                                end
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
}):AddColorPicker("itemNametagColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Color",
})

MiscESPGroup:AddToggle("ZombieESP", {
    Text = "1x1x1x1 Zombie ESP",
    Default = false,
    Callback = function(bool)
        _G.killers = bool
        task.spawn(function()
            while task.wait() do
                if _G.killers == true and not isKiller then
                    if gameMap.Ingame:FindFirstChild("Map") then
                        for _, v in pairs(gameMap.Ingame:GetChildren()) do
                            if v.Name == "1x1x1x1Zombie" then
                                if not v:FindFirstChild("zombie_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "zombie_esp"
                                else
                                    v.zombie_esp.FillColor = Options.ZombieESPColor.Value
                                    v.zombie_esp.OutlineTransparency = Toggles.ShowOutlinesInESP.Value and 0 or 1
                                    v.zombie_esp.FillTransparency = Options.ESPFillTransparency.Value
                                    v.zombie_esp.OutlineColor = Options.ESPOutlineColor.Value
                                end
                            end
                        end
                    end
                else
                    if gameMap.Ingame:FindFirstChild("Map") then
                        for _, v in pairs(gameMap.Ingame:GetChildren()) do
                            if v:FindFirstChild("zombie_esp") then
                                v.zombie_esp:Destroy()
                            end
                        end
                    end
                    break
                end
            end
        end)
    end
}):AddColorPicker("ZombieESPColor", {
    Default = Color3.fromRGB(255, 0, 0),
    Title = "Zombie Color",
})

ItemsGroup:AddToggle("AutoPickUpNearItems", {
    Text = "Auto Pick Up Near Items",
    Default = false,
    Callback = function (call)
        _G.pickUpNear = call
        task.spawn(function()
            while _G.pickUpNear and task.wait() do
                pcall(function()
                    if isKiller then return end
                    local items = {}
                    if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") then
                        for _, v in pairs(gameMap.Ingame:GetChildren()) do
                            if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
                                table.insert(items, v.ItemRoot)
                            end
                        end
                        for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                            if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
                                table.insert(items, v.ItemRoot)
                            end
                        end
                    end
                    for _, itemRoot in pairs(items) do
                        local lp = localPlayer
                        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                            local magnitude = (lp.Character.HumanoidRootPart.Position - itemRoot.Position).Magnitude
                            if magnitude <= 10 then
                                if itemRoot:FindFirstChild("ProximityPrompt") then
                                    fireproximityprompt(itemRoot.ProximityPrompt)
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
})

ItemsGroup:AddButton({
    Text = "Pick Up Available Items",
    Func = function()
        pcall(function()
            if isKiller then return end
            local items = {}
            if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") then
                for _, v in pairs(gameMap.Ingame:GetDescendants()) do
                    if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
                        table.insert(items, v.ItemRoot)
                    end
                end
            end
            for _, itemRoot in pairs(items) do
                local toolName = itemRoot.Parent and itemRoot.Parent.Name
                if toolName and not localPlayer.Backpack:FindFirstChild(toolName) then
                    localPlayer.Character.HumanoidRootPart.CFrame = itemRoot.CFrame
                    task.wait(0.5)
                    if itemRoot:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(itemRoot.ProximityPrompt)
                    end
                end
            end
        end)
    end
})

ItemsGroup:AddButton({
    Text = "Walk To Random Item",
    Func = function()
        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end
        pcall(function ()
            local items = {}
            if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") then
                for _, v in pairs(gameMap.Ingame:GetDescendants()) do
                    if v:IsA("Tool") then
                        table.insert(items, v)
                    end
                end
            end
            if #items > 0 and items[1]:FindFirstChild("ItemRoot") then
                pathfindTo(items[math.random(1, #items)].ItemRoot.Position)
            end
        end)
    end
})

local StaminaGroup = Tabs["Local Player"]:AddLeftGroupbox("Stamina", "biceps-flexed")
local oldstamina
StaminaGroup:AddToggle("InfStamina", {
    Text = "Infinite Stamina",
    Callback = function(Val)
        local sprintmodule = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
        if Val then
            oldstamina = sprintmodule.Stamina
            task.spawn(function()
                while Toggles.InfStamina.Value do
                    sprintmodule.Stamina = sprintmodule.MaxStamina
                    sprintmodule.__staminaChangedEvent:Fire()
                    task.wait()
                end
            end)
        else
            sprintmodule.Stamina = oldstamina
            sprintmodule.__staminaChangedEvent:Fire()
        end
    end
})

StaminaGroup:AddToggle("AlwaysSprint", {
    Text = "Always Sprint",
    Default = false,
    Callback = function (call)
        _G.alwaysSprint = call
        task.spawn(function()
            while _G.alwaysSprint and task.wait() do
                local sprint = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
                if not sprint.IsSprinting then
                    sprint.IsSprinting = true
                    sprint.__sprintedEvent:Fire(true)
                end
            end
        end)
    end
})

local sprintSpeed = 26
StaminaGroup:AddToggle("FastSprint", {
    Text = "Fast Sprint",
    Default = false,
    Callback = function (call)
        _G.fsprint = call
    end
})

task.spawn(function ()
    local sprint = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
    while true do
        if _G.fsprint then
            sprint.SprintSpeed = sprintSpeed
        else
            sprint.SprintSpeed = 26
        end
        task.wait()
    end 
end)

StaminaGroup:AddSlider("SprintSpeed", {
    Text = "Sprint Speed",
    Default = 26,
    Min = 26,
    Max = 80,
    Rounding = 0,
    Callback = function (slid)
        sprintSpeed = slid

        local sprint = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
        if sprint.IsSprinting then
            sprint.IsSprinting = false
            sprint.__sprintedEvent:Fire(false)
            sprint.IsSprinting = true
            sprint.__sprintedEvent:Fire(true)
        end
    end
})

local SpeedGroup = Tabs["Local Player"]:AddRightGroupbox("Speed", "wind")
local yeahvariable = 0

SpeedGroup:AddSlider("SpeedBypass", {
    Text = "Speed (Bypass)",
    Default = 16,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Callback = function (s) yeahvariable = s end
})
SpeedGroup:AddToggle("SpeedToggle", {
    Text = "Speed Toggle",
    Default = false,
    Callback = function (s)
        _G.SpeedToggle = s
        task.spawn(function ()
            local localPlayer = localPlayer
            while task.wait() do
                if not _G.SpeedToggle then break end
                local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
                if humanoid and humanoid.MoveDirection ~= Vector3.zero then
                    localPlayer.Character:TranslateBy(humanoid.MoveDirection * yeahvariable * game:GetService("RunService").RenderStepped:Wait())
                end
            end
        end)
    end
})

local NoclipGroup = Tabs["Local Player"]:AddRightGroupbox("Noclip", "cuboid")
local cachedParts = {}
function enableNoclip()
    if localPlayer.Character then
        for _, v in pairs(localPlayer.Character.GetChildren(localPlayer.Character)) do
            if v:IsA("BasePart") then
                cachedParts[v] = v
                v.CanCollide = false
            end
        end
    end
end
function disableNoclip()
    for _, v in pairs(cachedParts) do
        v.CanCollide = true
    end
end
NoclipGroup:AddToggle("EnableNoclip", {
    Text = "Enable Noclip",
    Default = false,
    Callback = function (s)
        _G.noclipState = s
        task.spawn(function ()
            while task.wait() do
                if not _G.noclipState then
                    disableNoclip()
                    break
                end

                enableNoclip()
            end
        end)
    end
})

local InfJumpGroup = Tabs["Local Player"]:AddLeftGroupbox("Misc", "wind")
local up, down
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(h,g)
    if h.KeyCode == Enum.KeyCode.LeftShift then
        down = true
    end
    if h.KeyCode == Enum.KeyCode.Space then
        if g then return end
        up = true
    end
end)
uis.InputEnded:Connect(function(h,g)
    if h.KeyCode == Enum.KeyCode.LeftShift then
        down = false
    end
    if h.KeyCode == Enum.KeyCode.Space then
        if g then return end
        up = false
    end
end)
local localPlayer = localPlayer
local fly = InfJumpGroup:AddToggle("InfiniteJump", {
    Text = "Fly",
    Default = false,
    Callback = function ()
        task.spawn(function()
            while Toggles.InfiniteJump.Value and task.wait() do
                if localPlayer.Character then
                    local root = localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        local vel = 2.45

                        if up then
                            vel = vel + Options.FlyVerticalSpeed.Value - 2.45
                        end

                        if down then
                            vel = vel - Options.FlyVerticalSpeed.Value + 2.45
                        end

                        if root then
                            root.Velocity = Vector3.new(root.Velocity.X, vel, root.Velocity.Z)
                            if localPlayer.Character.Humanoid.MoveDirection ~= Vector3.zero then
                                localPlayer.Character:TranslateBy(localPlayer.Character.Humanoid.MoveDirection * Options.FlySpeed.Value * game:GetService("RunService").RenderStepped:Wait())
                            end
                        end
                    end
                end
            end
        end)
    end
})
fly:AddKeyPicker("KeyPicker", {
	Default = "Z",
	Text = "fly keybind",
	NoUI = false,
	Callback = function()
        print("h")
		Toggles.InfiniteJump:SetValue(not Toggles.InfiniteJump.Value)
	end,
})
InfJumpGroup:AddSlider("FlySpeed", {
    Text = "Fly Speed",
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 0,
})
InfJumpGroup:AddSlider("FlyVerticalSpeed", {
    Text = "Fly Vertical Speed",
    Default = 34,
    Min = 7,
    Max = 80,
    Rounding = 0,
})

local loopRunning, loopThread, currentAnim, lastAnim
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://75804462760596"
InfJumpGroup:AddToggle("Invis", {
    Text = "Invisibility",
    Default = false,
    Callback = function(Value)
        if game.PlaceId ~= 18687417158 then
            if not Value then return end
            return Notify("Please use in real forsaken", "Invisibility doesnt work in games that are not the real forsaken", 8)
        end
        if Value then
            Notify("Warning", "You can still be seen when people use certain abilities or if they have the collision hitboxes setting on.", 6)
            loopRunning = true

            loopThread = task.spawn(function()
                while loopRunning do
                    local hum = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChild("Humanoid")
                    if hum then
                        enableNoclip()
                    end

                    if hum then
                        local loadedAnim = hum:LoadAnimation(anim)
                        currentAnim = loadedAnim
                        loadedAnim.Looped = false
                        loadedAnim:Play()
                        loadedAnim:AdjustSpeed(0)
                        task.wait(0.1)
                        if lastAnim then
                            lastAnim:Stop()
                            lastAnim:Destroy()
                        end
                        lastAnim = currentAnim
                    else
                        currentAnim = nil
                    end
                    task.wait()
                end
            end)
        else
            loopRunning = false

            if loopThread then
                loopRunning = false
                task.cancel(loopThread)
            end

            if currentAnim then
                currentAnim:Stop()
                currentAnim = nil
            end

            local Humanoid = localPlayer.Character and (localPlayer.Character:FindFirstChildOfClass("Humanoid") or localPlayer.Character:FindFirstChildOfClass("AnimationController"))
            if Humanoid then
                for _, v in pairs(Humanoid:GetPlayingAnimationTracks()) do
                    v:AdjustSpeed(100000)
                end
                for _, v in pairs(localPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end

            local animateScript = localPlayer.Character and localPlayer.Character:FindFirstChild("Animate")
            if animateScript then
                animateScript.Disabled = true
                animateScript.Disabled = false
            end
        end
    end
})

local KillerGroup = Tabs.Killer:AddLeftGroupbox("Killer", "skull")
local KillerMisc = Tabs.Killer:AddRightGroupbox("Misc", "cloud")
KillerGroup:AddToggle("AllowKillerEntrances", {
    Text = "Allow Killer Entrances",
    Default = false,
    Callback = function (call)
        _G.killerent = call
        local function s9audioak()
            if not (gameMap and gameMap.Ingame and gameMap.Ingame:FindFirstChild("Map")) then return end
            local walls = gameMap.Ingame.Map:FindFirstChild("Killer_Only Wall") or gameMap.Ingame.Map:FindFirstChild("KillerOnlyEntrances")
            if not walls then return end
            for _, v in pairs(walls:GetChildren()) do
                v.CanCollide = true
            end
        end

        if not _G.killerent then
            pcall(s9audioak)
            return
        end

        task.spawn(function ()
            while _G.killerent and task.wait() do
                if (gameMap and gameMap.Ingame and gameMap.Ingame:FindFirstChild("Map")) then
                    local walls = gameMap.Ingame.Map:FindFirstChild("Killer_Only Wall") or gameMap.Ingame.Map:FindFirstChild("KillerOnlyEntrances")

                    if walls then
                        if not _G.killerent then
                            pcall(s9audioak)
                            break
                        end

                        pcall(function()
                            local walls = gameMap.Ingame.Map:FindFirstChild("Killer_Only Wall") or gameMap.Ingame.Map:FindFirstChild("KillerOnlyEntrances")
                            if walls then
                                for _, v in pairs(walls:GetChildren()) do
                                    v.CanCollide = false
                                end
                            end
                        end)
                    end
                end
            end
        end)
    end
})

KillerGroup:AddToggle("SpectateKiller", {
    Text = "Spectate Killer",
    Default = false,
    Callback = function (state)
        if state then
            local killer = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") and workspace.Players.Killers:GetChildren()[1]
            if killer then
                workspace.CurrentCamera.CameraSubject = killer
            end
        else
            pcall(function()
                workspace.CurrentCamera.CameraSubject = localPlayer.Character
            end)
        end
    end
})

KillerGroup:AddButton({
    Text = "Teleport To Killer",
    Func = function ()
        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end

        local killer = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") and workspace.Players.Killers:GetChildren()[1]
        if killer then
            pcall(function()
                localPlayer.Character.HumanoidRootPart.CFrame = killer.PrimaryPart.CFrame
            end)
        end
    end
})

KillerGroup:AddButton({
    Text = "Teleport To Random Survivor",
    Func = function()
        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end
        pcall(function()
            if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then return end
            local survs = workspace.Players.Survivors:GetChildren()
            if #survs == 0 then return end

            localPlayer.Character.HumanoidRootPart.CFrame = survs[math.random(1, #survs)].HumanoidRootPart.CFrame
        end)
    end
})

KillerGroup:AddToggle('KillAll', {
    Text = "Kill All",
    Callback = function(s)
        if s and playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end
        if s and isSurvivor then
            return Notify("Please be killer", "To use this feature, you must be killer", 7)
        end
        if not Toggles.KillAll.Value then return end
        if localPlayer:GetNetworkPing() >= 0.3 then
            Toggles.KillAll:SetValue(false)
            return game.StarterGui:SetCore("SendNotification", { Title = "Kill all stopped", Text = "kill all stopped because your ping is too high. try getting better wifi and try again", Duration = 9 })
        end
        if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then Toggles.KillAll:SetValue(false) return end
        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
            if not (workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap:FindFirstChild("Ingame"):FindFirstChild("Map")) then
                Toggles.KillAll:SetValue(false)
                return
            end
            if playingState == "Spectating" then
                Toggles.KillAll:SetValue(false)
                return
            end
            local name = v:GetAttribute("Username")
            local plr = game.Players:FindFirstChild(name)
            if plr then
                local skipTimeout = tick()
                while tick() - skipTimeout <= 25 do
                    if localPlayer:GetNetworkPing() >= 0.3 then
                        Toggles.KillAll:SetValue(false)
                        return game.StarterGui:SetCore("SendNotification", { Title = "Kill all stopped", Text = "kill all stopped because your ping is too high. try getting better wifi and try again", Duration = 9 })
                    end
                    if game.Players:FindFirstChild(name) == nil then
                        break 
                    end
                    if plr.Character == nil then
                        break
                    end
                    if plr.Character:FindFirstChild("Humanoid") == nil then
                        break
                    end
                    if plr.Character.Humanoid.Health <= 0 then
                        break
                    end
                    if not Toggles.KillAll.Value then
                        return
                    end
                    enableNoclip()
                    localPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
                    localPlayer.Character.HumanoidRootPart.Velocity = Vector3.zero
                    killerAttack()
                    task.wait()
                end
            end
        end
    end
})

KillerGroup:AddToggle('VoidRushCollision', {
    Text = "Void Rush Anti Collision"
})

KillerGroup:AddToggle('VoidRushNoclip', {
    Text = "Void Rush Noclip"
})

KillerGroup:AddToggle('WalkspeedAntiCollision', {
    Text = "WS Override Anti Collision"
})

pcall(function()
    local old
    old = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        if type(args[1]) == "string" and string.find(args[1], localPlayer.Name) and string.find(args[1], "VoidRushCollision") then
            if Toggles.VoidRushCollision.Value then
                return
            end
        end
        return old(self, ...)
    end)
end)
pcall(function()
    local old
    old = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        if type(args[1]) == "string" and string.find(args[1], localPlayer.Name) and string.find(args[1], "C00lkiddCollision") then
            if Toggles.WalkspeedAntiCollision.Value then
                return
            end
        end
        return old(self, ...)
    end)
end)
task.spawn(function()
    function isNoliVoidRush()
        return isKiller and localPlayer.Character and localPlayer.Character.Name == "Noli" and "Dashing" == localPlayer.Character:GetAttribute("VoidRushState")
    end
    while true do
        if isNoliVoidRush() and Toggles.VoidRushNoclip.Value and (not Toggles.EnableNoclip.Value) then
            enableNoclip()
        elseif (not isNoliVoidRush()) and (not Toggles.EnableNoclip.Value) then
            disableNoclip()
        end
        task.wait()
    end
end)

function killerAttack()
    if hasAbilityReady("Slash") then
        Network.RemoteEvent:FireServer("UseActorAbility", "Slash")
    elseif hasAbilityReady("Punch") then
        Network.RemoteEvent:FireServer("UseActorAbility", "Punch")
    elseif hasAbilityReady("Stab") then
        Network.RemoteEvent:FireServer("UseActorAbility", "Stab")
    end
end

KillerMisc:AddButton({
    Text = "Walk To Random Survivor",
    Func = function()
        task.spawn(function()
            if playingState == "Spectating" then
                return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
            end
            pcall(function()
                if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then return end
                local survs = workspace.Players.Survivors:GetChildren()
                if #survs == 0 then return end

                local target = survs[math.random(1, #survs)]
                local hrp = target:WaitForChild("HumanoidRootPart")

                while target.Parent and hrp and hrp.Parent and (localPlayer.Character.Humanoid.Position - hrp.Position).magnitude >= 5 do
                    pathfindTo(hrp.Position)
                    task.wait(0.3)
                end
            end)
        end)
    end
})

local function getASurvivor(dist)
    local char = localPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, s in ipairs(workspace.Players.Survivors:GetChildren()) do
        local h = s:FindFirstChild("HumanoidRootPart")
        if h then
            local d = (hrp.Position - h.Position).Magnitude
            if d < dist then
                return s
            end
        end
    end
end

function getClosestSurvivor()
    local closest, dist = nil, math.huge
    local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil, nil end
    for _, s in pairs(workspace.Players.Survivors:GetChildren()) do
        local hrp2 = s:FindFirstChild("HumanoidRootPart")
        if hrp2 then
            local d = (hrp.Position - hrp2.Position).Magnitude
            if d < dist then
                closest = s
                dist = d
            end
        end
    end
    return closest, dist
end

KillerMisc:AddToggle("SlashAura", { 
    Text = "Slash Aura",
    Default = false,
    Callback = function()
        task.spawn(function()
            while Toggles.SlashAura.Value do
                local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    if isKiller then
                        local yh = getASurvivor(Options.SlashAuraRange.Value)
                        if yh then
                            killerAttack()
                        end
                    else
                        if killerModel and killerModel:FindFirstChild("HumanoidRootPart") then
                            local dist = (hrp.Position - killerModel.HumanoidRootPart.Position).magnitude
                            if dist <= Options.SlashAuraRange.Value then
                                killerAttack()
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

KillerMisc:AddSlider("SlashAuraRange", {
    Text = "Slash Aura Range",
    Default = 7,
    Min = 4,
    Max = 11,
    Rounding = 0,
})

KillerMisc:AddToggle("HitboxExpander", { 
    Text = "Reach Expander",
    Default = false,
})
KillerMisc:AddSlider("HitboxExpanderRange", {
    Text = "Reach Distance",
    Default = 37,
    Min = 20,
    Max = 200,
    Rounding = 0,
})

local function assist(target, dist)
    if target and dist <= 25 then
        local pos = localPlayer.Character.HumanoidRootPart.Position
        local targetPos = target.HumanoidRootPart.Position

        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(pos.X, pos.Y, pos.Z), Vector3.new(targetPos.X, pos.Y, targetPos.Z))
    end
end
KillerMisc:AddToggle("KillerAimAssist", { 
    Text = "Killer Aim Assist",
    Tooltip = "helps you hit by aiming your character at the nearest survivor",
    Callback = function()
        while Toggles.KillerAimAssist.Value and task.wait() do
            debugCall(pcall(function()
                if isSurvivor then return end

                local target, dist = getClosestSurvivor()
                assist(target, dist)
            end))
        end
    end
})

SurvivorsGroup:AddToggle("SurvivorAimAssist", { 
    Text = "Survivor Aim Assist",
    Tooltip = "helps you hit by aiming your character at the killer",
    Callback = function()
        while Toggles.SurvivorAimAssist.Value and task.wait() do
            debugCall(pcall(function()
                if isKiller then return end
                if not killerModel then return end

                local dist = (localPlayer.Character.HumanoidRootPart.Position - killerModel.HumanoidRootPart.Position).magnitude
                assist(killerModel, dist)
            end))
        end
    end
})

KillerMisc:AddButton({
    Text = "Fling Killer",
    Func = function()
        Notify("warning", "this feature kinda only works in some certain fake forsaken games cuz forsaken has collision stuff", 7)

        if isKiller then
            return Notify("Trying to fling yourself", "you're the killer buddy", 7)
        end

        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end

        pcall(function()
            if killerModel and isSurvivor then
                local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local fail = tick()
                    local old = hrp.CFrame

                    enableNoclip()

                    repeat
                        hrp.Velocity = Vector3.new(0, -10000, 0)
                        hrp.CFrame = killerModel.HumanoidRootPart.CFrame
                        if killerModel.HumanoidRootPart.Velocity.magnitude >= 50 then
                            Notify("Success?", "If the killer got fling, he will respawn in a random spot, or in very rare cases he will die", 7)
                            break
                        end
                        task.wait()
                    until tick() - fail >= 3

                    disableNoclip()

                    hrp.Velocity = Vector3.zero
                    hrp.CFrame = old
                end
            end
        end)
    end
})

KillerMisc:AddToggle("FrontFlip", { 
    Text = "Front Flip",
    Tooltip = "funny",
    Default = true,
    Callback = function(callback)
        getgenv().FlipUI.Enabled = callback
    end
}):AddKeyPicker("KeyPicker", {
	Default = "F",
	Text = "flip keybind",
	NoUI = false,
	Callback = function()
        if not Toggles.FrontFlip.Value then return end
		FortniteFlips()
	end,
})

-- NOT MADE BY ME, BUT FIXED BY ME
task.spawn(function()
    local RunService = game:GetService("RunService")
    local RNG = Random.new()

    local Character = lplr.Character or lplr.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

    lplr.CharacterAdded:Connect(function(char)
        Character = char
        Humanoid = char:WaitForChild("Humanoid")
        HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
    end)

    local AttackAnimations = {
        "rbxassetid://131430497821198", "rbxassetid://83829782357897", "rbxassetid://126830014841198",
        "rbxassetid://126355327951215", "rbxassetid://121086746534252", "rbxassetid://105458270463374",
        "rbxassetid://127172483138092", "rbxassetid://18885919947", "rbxassetid://18885909645",
        "rbxassetid://87259391926321", "rbxassetid://106014898528300", "rbxassetid://86545133269813",
        "rbxassetid://89448354637442", "rbxassetid://90499469533503", "rbxassetid://116618003477002",
        "rbxassetid://106086955212611", "rbxassetid://107640065977686", "rbxassetid://77124578197357",
        "rbxassetid://101771617803133", "rbxassetid://134958187822107", "rbxassetid://111313169447787",
        "rbxassetid://71685573690338", "rbxassetid://129843313690921", "rbxassetid://97623143664485",
        "rbxassetid://136007065400978", "rbxassetid://86096387000557", "rbxassetid://108807732150251",
        "rbxassetid://138040001965654", "rbxassetid://73502073176819", "rbxassetid://86709774283672",
        "rbxassetid://140703210927645", "rbxassetid://96173857867228", "rbxassetid://121255898612475",
        "rbxassetid://98031287364865", "rbxassetid://119462383658044", "rbxassetid://77448521277146",
        "rbxassetid://103741352379819", "rbxassetid://131696603025265", "rbxassetid://122503338277352",
        "rbxassetid://97648548303678", "rbxassetid://94162446513587", "rbxassetid://84426150435898",
        "rbxassetid://93069721274110", "rbxassetid://114620047310688", "rbxassetid://97433060861952",
        "rbxassetid://82183356141401", "rbxassetid://100592913030351", "rbxassetid://121293883585738",
        "rbxassetid://70447634862911", "rbxassetid://92173139187970", "rbxassetid://106847695270773",
        "rbxassetid://125403313786645", "rbxassetid://81639435858902", "rbxassetid://137314737492715",
        "rbxassetid://120112897026015", "rbxassetid://82113744478546", "rbxassetid://118298475669935",
        "rbxassetid://126681776859538", "rbxassetid://129976080405072", "rbxassetid://109667959938617",
        "rbxassetid://74707328554358", "rbxassetid://133336594357903", "rbxassetid://86204001129974",
        "rbxassetid://124243639579224", "rbxassetid://70371667919898", "rbxassetid://131543461321709",
        "rbxassetid://136323728355613", "rbxassetid://109230267448394"
    }

    while task.wait() do
        if Toggles.HitboxExpander.Value and HumanoidRootPart then
            local playing = false
            for _, track in ipairs(Humanoid:GetPlayingAnimationTracks()) do
                if table.find(AttackAnimations, track.Animation.AnimationId) and (track.TimePosition / track.Length < 0.75) then
                    playing = true
                    break
                end
            end

            if playing then
                local Target
                local NearestDist = Options.HitboxExpanderRange.Value

                local function scanGroup(group)
                    for _, obj in ipairs(group) do
                        if obj ~= Character and obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("Humanoid").Health > 0 then
                            local dist = (obj.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude
                            if dist < NearestDist then
                                NearestDist = dist
                                Target = obj
                            end
                        end
                    end
                end

                scanGroup(workspace.Players:GetDescendants())
                local npcs = workspace:FindFirstChild("Map", true) and workspace.Map:FindFirstChild("NPCs", true)
                if npcs then
                    scanGroup(npcs:GetChildren())
                end

                if Target then
                    local ping = lplr:GetNetworkPing()
                    local randomOffset = Vector3.new(RNG:NextNumber(-1.5, 1.5), 0, RNG:NextNumber(-1.5, 1.5))
                    local predicted = Target.HumanoidRootPart.Position + randomOffset + (Target.HumanoidRootPart.Velocity * (ping * 1.25))
                    local neededVelocity = (predicted - HumanoidRootPart.Position) / (ping * 2)

                    local oldVelocity = HumanoidRootPart.Velocity
                    HumanoidRootPart.Velocity = neededVelocity
                    RunService.RenderStepped:Wait()
                    HumanoidRootPart.Velocity = oldVelocity
                end
            end
        end
    end
end)

local GensTP = Tabs.Teleport:AddLeftGroupbox("Generators Teleport", "pin")
for i = 1, 5 do
    GensTP:AddButton({
        Text = "Teleport To Generator " .. i,
        Func = function ()
            if playingState == "Spectating" then
                return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
            end

            pcall(function ()
                if not (gameMap and gameMap.Ingame and gameMap.Ingame.Map) then return end
                local gens = {}

                for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                    if v.Name == "Generator" then
                        table.insert(gens, v)
                    end
                end

                if gens[i] and gens[i]:FindFirstChild("Positions") and gens[i].Positions:FindFirstChild("Center") then
                    localPlayer.Character.HumanoidRootPart.CFrame = gens[i].Positions.Center.CFrame + Vector3.new(0, 10, 0)
                end
            end)
        end
    })
end

local GensTP = Tabs.Teleport:AddRightGroupbox("Generators Walk", "pin")
for i = 1, 5 do
    GensTP:AddButton({
        Text = "Walk To Generator " .. i,
        Func = function ()
            if playingState == "Spectating" then
                return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
            end

            local s, r = pcall(function ()
                if not (gameMap and gameMap.Ingame and gameMap.Ingame.Map) then return end
                local gens = {}

                for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                    if v.Name == "Generator" then
                        table.insert(gens, v)
                    end
                end

                if gens[i] and gens[i]:FindFirstChild("Positions") and gens[i].Positions:FindFirstChild("Center") then
                    pcall(pathfindTo, gens[i].Positions.Center.Position)
                end
            end)

            if not s then
                warn("Pathfind failed", r)
            end
        end
    })
end

local ItemsTP = Tabs.Teleport:AddRightGroupbox("Items", "shovel")
ItemsTP:AddButton({
    Text = "Teleport To Random Item",
    Func = function ()
        local items = {}

        pcall(function ()
            if playingState == "Spectating" then
                return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
            end

            if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") then
                for _, v in pairs(gameMap.Ingame:GetDescendants()) do
                    if v:IsA("Tool") then
                        table.insert(items, v)
                    end
                end
            end
        end)

        if #items > 0 and items[1]:FindFirstChild("ItemRoot") then
            localPlayer.Character.HumanoidRootPart.CFrame = items[math.random(1, #items)].ItemRoot.CFrame + Vector3.new(0, 10, 0)
        end
    end
})

local MiscGroup = Tabs.Misc:AddLeftGroupbox("Miscallenous", "circle-question-mark")
MiscGroup:AddToggle("AllowJump", {
    Text = "Allow Jump",
    Default = false,
    Callback = function (state)
        _G.AllowJump = state

        if state then
            game.StarterGui:SetCore("SendNotification", { Title = "KICK WARNING", Text = "WARNING jumping repeatedly will KICK YOU because the game will think you are flying!", Duration = 9 })
        end

        task.spawn(function ()
            while task.wait() do
                if not _G.AllowJump then break end
                local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")

                if humanoid then
                    humanoid.JumpPower = 50
                end
            end
        end)
    end
})

local function FullBright()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
    game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end

local alreadyPressed = false
local alreadyPressedFB = false
MiscGroup:AddButton({
    Text = "No Fog",
    Func = function ()
        if alreadyPressed then return end
        alreadyPressed = true
        while true do
            for _, v in pairs(game.Lighting:GetDescendants()) do
                if v:IsA("Atmosphere") then
                    v:Destroy()
                end
            end

            game.Lighting.FogEnd = 999999
            task.wait(1)
        end
    end
})

MiscGroup:AddButton({
    Text = "Full Bright",
    Func = function()
        if alreadyPressedFB then return end
        alreadyPressedFB = true
        while true do
            FullBright()
            task.wait(1)
        end
    end
})

MiscGroup:AddButton({
    Text = "Kill Yourself",
    Func = function ()
        pcall(function ()
            localPlayer.Character.Humanoid.Health = 0
        end)
    end
})

MiscGroup:AddButton({
    Text = "Rejoin",
    Func = function ()
        pcall(function ()
            game:GetService("TeleportService"):Teleport(game.PlaceId, localPlayer)
        end)
    end
})

MiscGroup:AddToggle('IZD', {
    Text = "Infinite Zoom Distance",
    Callback = function(state)
        localPlayer.CameraMaxZoomDistance = state and math.huge or 12
    end
})

MiscGroup:AddToggle('IZD', {
    Text = "Camera Noclip",
    Callback = function(state)
        localPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode[state and "Invisicam" or "Zoom"]
    end
})


local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")
local replacementAnimations = {
    idle = "rbxassetid://134624270247120",
    walk = "rbxassetid://132377038617766",
    run = "rbxassetid://115946474977409"
}
local animationNameCache = {}
local currentTrack = nil
local currentType = nil
local toggleEnabled = false
local getAnimationNameFromId = function(assetId)
    if animationNameCache[assetId] then
        return animationNameCache[assetId]
    end
    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(assetId)
    end)
    if success and info and info.Name then
        animationNameCache[assetId] = info.Name
        return info.Name
    end
    return nil
end
local playReplacementAnimation = function(animator, animType)
    if currentTrack then
        currentTrack:Stop()
    end
    local anim = Instance.new("Animation")
    anim.AnimationId = replacementAnimations[animType]
    local track = animator:LoadAnimation(anim)
    track.Priority = Enum.AnimationPriority.Movement
    track:Play()
    currentTrack = track
    currentType = animType
end
local setupCharacter = function(char)
    local humanoid = char:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = humanoid
    end
    RunService.Heartbeat:Connect(function()
        if toggleEnabled and currentTrack then
            if currentType == "idle" then
                currentTrack:AdjustSpeed(1)
            elseif currentType == "walk" then
                currentTrack:AdjustSpeed(humanoid.WalkSpeed / 12)
            elseif currentType == "run" then
                currentTrack:AdjustSpeed(humanoid.WalkSpeed / 26)
            end
        end
    end)
    animator.AnimationPlayed:Connect(function(track)
        if toggleEnabled then
            local animationId = track.Animation.AnimationId
            local assetId = animationId:match("%d+")
            if assetId then
                local animName = getAnimationNameFromId(tonumber(assetId))
                if animName then
                    local lowerName = animName:lower()
                    if lowerName:find("idle") then
                        track:Stop()
                        playReplacementAnimation(animator, "idle")
                    elseif lowerName:find("walk") then
                        track:Stop()
                        playReplacementAnimation(animator, "walk")
                    elseif lowerName:find("run") then
                        track:Stop()
                        playReplacementAnimation(animator, "run")
                    end
                end
            end
        end
    end)
end
if localPlayer.Character then
    setupCharacter(localPlayer.Character)
end
localPlayer.CharacterAdded:Connect(setupCharacter)

MiscGroup:AddToggle("FakeInjure", {
    Text = "Fake Injured Animations",
    Callback = function(value)
        toggleEnabled = value
        if not value and currentTrack then
            currentTrack:Stop()
        end
    end
})

local function pressReturnButton()
    if not firesignal then
        return print("🥺")
    else
        local exists, GUI = pcall(function()
            return localPlayer.PlayerGui.EndScreen.Main.Return
        end)
        if not exists then
            return
        else
            firesignal(GUI.MouseButton1Click)
        end
    end
end

MiscGroup:AddToggle("AutoLobby", {
    Text = "Auto Lobby",
    Callback = function(value)
        task.spawn(function()
            while Toggles.AutoLobby.Value and task.wait(0.2) do
                pressReturnButton()
            end
        end)
    end
})

pcall(function()
    if workspace.Players.Spectating:FindFirstChild(localPlayer.Name) then
        playingState = "Spectating"
    else
        playingState = "Playing"
    end

    workspace.Players.Spectating.ChildAdded:Connect(function(v)
        if v.Name == localPlayer.Name then
            playingState = "Spectating"
            Notify("Playing state", playingState, 7)
        end
    end)

    workspace.Players.Spectating.ChildRemoved:Connect(function(v)
        if v.Name == localPlayer.Name then
            playingState = "Playing"
            Notify("Playing state", "In Round", 7)
        end
    end)

    MiscGroup:AddToggle('AlwaysShowChat', {
        Text = "Always Show Chat",
        Callback = function(state)
            if state then
                _G.showChat = true
                task.spawn(function()
                    while _G.showChat and task.wait() do
                        game:GetService("TextChatService"):FindFirstChildOfClass("ChatWindowConfiguration").Enabled = true
                    end
                end)
            else
                _G.showChat = false
                if playingState ~= "Spectating" then
                    game:GetService("TextChatService"):FindFirstChildOfClass("ChatWindowConfiguration").Enabled = false
                end
            end
        end
    })

    local KillerChanceText = MiscGroup:AddLabel({
        Text = "Chance to be killer: n/a%",
    })

    task.spawn(function()
        while true do
            KillerChanceText:SetText(string.format("Chance to be killer: %d%%", localPlayer.leaderstats.KillerChance.Value))
            task.wait(0.3)
        end
    end)

    function panic()
        for i, v in pairs(Toggles) do
            debugCall(pcall(function()
                if v.Value == false then return end
                v:SetValue(false)
            end))
        end
    end

    MiscGroup:AddButton({
        Text = "Panic",
        Func = panic
    })

    Library:OnUnload(function()
        panic()
        getgenv().FlipUI:Destroy()
    end)
end)

local AntiGroup = Tabs.Anti:AddLeftGroupbox("Anti", "ban")
AntiGroup:AddToggle("AutoRemove1x1x1x1", {
    Text = "Anti 1x1x1x1 popups",
    Default = false,
    Callback = function (bool)
        _G.no1x= bool
        task.spawn(function ()
            while _G.no1x and task.wait() do
                local temp = localPlayer.PlayerGui:FindFirstChild("TemporaryUI")

                if temp and temp:FindFirstChild("1x1x1x1Popup") then
                    if firesignal then
                        firesignal(temp["1x1x1x1Popup"].MouseButton1Click)
                    end
                    warn("yes its gone, maybe")
                end
            end
        end)
    end
})

local function removeHealthGlitch()
    local TemporaryUI = localPlayer.PlayerGui:FindFirstChild("TemporaryUI")
    for i, v in pairs(TemporaryUI:GetChildren()) do
         if v.Name == "Frame" and v:FindFirstChild("Glitched") then
            v:Destroy()
            Notify("deleted", "deleted health glitch", 6)
        end
    end
end
AntiGroup:AddToggle("AntiHealthGlitch", {
    Text = "Anti Health Glitch",
    Default = false,
    Callback = function()
        task.spawn(function()
            while Toggles.AntiHealthGlitch.Value and task.wait() do
                removeHealthGlitch()
            end
        end)
    end
})
AntiGroup:AddToggle("AntiStun", {
    Text = "Anti Stun",
    Default = false,
    Callback = function ()
        task.spawn(function ()
            while Toggles.AntiStun.Value and task.wait() do
                if localPlayer.Character and localPlayer.Character:FindFirstChild("SpeedMultipliers") then
                    if localPlayer.Character.SpeedMultipliers:FindFirstChild("Stunned") then
                        localPlayer.Character.SpeedMultipliers:FindFirstChild("Stunned").Value = 1
                    end
                end
            end
        end)
    end
})
AntiGroup:AddToggle("AntiSlow", {
    Text = "Anti Slow",
    Default = false,
    Callback = function ()
        task.spawn(function ()
            while Toggles.AntiSlow.Value and task.wait() do
                if localPlayer.Character and localPlayer.Character:FindFirstChild("SpeedMultipliers") then
                    for i, v in localPlayer.Character.SpeedMultipliers:GetChildren() do
                        if v.Value < 1 then
                            v.Value = 1
                        end
                    end
                end
            end
        end)
    end
})
AntiGroup:AddToggle("AntiBlindness", {
    Text = "Anti Blindness",
    Default = false,
    Callback = function ()
        task.spawn(function ()
            while Toggles.AntiBlindness.Value and task.wait() do
                if game.Lighting:FindFirstChild("BlindnessBlur") then
                    game.Lighting.BlindnessBlur:Destroy()
                end
            end
        end)
    end
})
AntiGroup:AddToggle("AntiSubspace", {
    Text = "Anti Subspace",
    Default = false,
    Callback = function ()
        task.spawn(function ()
            while Toggles.AntiSubspace.Value and task.wait() do
                local subspace = {
                    "SubspaceVFXBlur",
                    "SubspaceVFXColorCorrection"
                }

                for i, v in pairs(subspace) do
                    if game.Lighting:FindFirstChild(v) then
                        game.Lighting[v]:Destroy()
                    end
                end
            end
        end)
    end
})

AntiGroup:AddToggle("AntiFootsteps", {
    Text = "Anti Footsteps",
    Default = false,
})

pcall(function()
    local old; old = hookmetamethod(game, "__namecall", function (self, ...)
        local args = {...}

        if Toggles.AntiFootsteps.Value and args[1] == "FootstepPlayed" and type(args[2]) == "number" then
            return 
        end

        return old(self, unpack(args))
    end)
end)

local Players = game:GetService("Players")
local originalValues = {}

local paths = {
    "HideKillerWins",
    "HidePlaytime",
    "HideSurvivorWins"
}
local function saveOriginals(player)
    if not originalValues[player.UserId] then
        originalValues[player.UserId] = {}
    end
    for _, key in ipairs(paths) do
        local value = player.PlayerData.Settings.Privacy:FindFirstChild(key)
        originalValues[player.UserId][key] = value.Value
    end
end

local function reveal(player)
    for _, key in ipairs(paths) do
        local value = player.PlayerData.Settings.Privacy:FindFirstChild(key)
        value.Value = false
    end
end

local function restore(player)
    if originalValues[player.UserId] then
        for key, val in pairs(originalValues[player.UserId]) do
            local value = player.PlayerData.Settings.Privacy:FindFirstChild(key)
            value.Value = val
        end
    end
end

local function hiddenStatsFunc(disable)
    for _, player in ipairs(Players:GetPlayers()) do
        if disable then
            saveOriginals(player)
            reveal(player)
        else
            restore(player)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    if toggleState == true then
        saveOriginals(player)
        reveal(player)
    end
end)

AntiGroup:AddToggle("AntiHiddenStats", {
    Text = "Anti Hidden Stats",
    Default = false,
    Tooltip = "lets you view peoples stats even if they are off",
    Callback = function(value)
        toggleState = value
        hiddenStatsFunc(value)
    end
})

local canDoRequire = pcall(function()
    require(game:GetService("ReplicatedStorage").Assets.Emotes.AICatDance)
end)

if canDoRequire then
    local EmoteGroup = Tabs.Misc:AddRightGroupbox("Emote As Killer", "party-popper")
    local emoteName = "AICatDance"
    local emoteTable = {}

    for _, v in pairs(game:GetService("ReplicatedStorage").Assets.Emotes:GetChildren()) do
        table.insert(emoteTable, require(v).DisplayName)
    end
    table.sort(emoteTable)

    EmoteGroup:AddDropdown("EmoteDropdown", {
        Values = emoteTable,
        Default = emoteName,
        Multi = false,
        Text = "Select Emote (must own)",
        Callback = function(e) emoteName = e end
    })

    EmoteGroup:AddButton({
        Text = "Play Emote",
        Func = function ()
            local p

            for _, v in pairs(game:GetService("ReplicatedStorage").Assets.Emotes:GetChildren()) do
                if require(v).DisplayName == emoteName then
                    p = v.Name
                    break
                end
            end

            Network:WaitForChild("RemoteEvent"):FireServer("PlayEmote", "Animations", p)
        end
    });
end

local function unlock(achieve)
   local remote = Network:WaitForChild("RemoteEvent")
   remote:FireServer("UnlockAchievement", achieve)
end

local BadgeGroup = Tabs.Misc:AddRightGroupbox("Achievements", "award")

BadgeGroup:AddButton({
   Text = "\".\"",
   Func = function() unlock("MeetBrandon") end,
})

BadgeGroup:AddButton({
   Text = "\"Meow meow meow\"",
   Func = function() unlock("ILoveCats") end,
})

BadgeGroup:AddButton({
   Text = "\"Coming straight from YOUR house\"",
   Func = function() unlock("TVTIME") end,
})

BadgeGroup:AddButton({
   Text = "\"A Captain and his Ship\"",
   Func = function() unlock("MeetDemophon") end,
})

BadgeGroup:AddButton({
   Text = "\"Black, white, and gray\"",
   Func = function() unlock("Morality") end,
})

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,
    Text = "Open Keybind Menu",
    Callback = function(value)
        Library.KeybindFrame.Visible = value
    end,
})
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end,
})
MenuGroup:AddDropdown("NotificationSide", {
    Values = { "Left", "Right" },
    Default = "Right",
    Text = "Notification Side",
    Callback = function(Value)
        Library:SetNotifySide(Value)
    end,
})
MenuGroup:AddDropdown("DPIDropdown", {
    Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",
    Text = "DPI Scale",
    Callback = function(Value)
        Value = Value:gsub("%%", "")
        local DPI = tonumber(Value)
        Library:SetDPIScale(DPI)
    end,
})
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
ThemeManager:ApplyToTab(Tabs["UI Settings"])
ThemeManager:SetFolder("NXP_Hub")
ThemeManager:ApplyTheme("Tokyo Night")
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
SaveManager:SetSubFolder("Forsaken")
SaveManager:SetFolder("NXP_Hub/Forsaken")
SaveManager:BuildConfigSection(Tabs["UI Settings"])

local FlipCooldown = false
function FortniteFlips()
    if FlipCooldown then
        return
    end

    FlipCooldown = true
    local character = lplr.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
    if not hrp or not humanoid then
        FlipCooldown = false
        return
    end

    local savedTracks = {}

    if animator then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            savedTracks[#savedTracks + 1] = { track = track, time = track.TimePosition }
            track:Stop(0)
        end
    end

    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)

    local duration = 0.45
    local steps = 120
    local startCFrame = hrp.CFrame
    local forwardVector = startCFrame.LookVector
    local upVector = Vector3.new(0, 1, 0)
    task.spawn(function()
        local startTime = tick()
        for i = 1, steps do
            local t = i / steps
            local height = 4 * (t - t ^ 2) * 10
            local nextPos = startCFrame.Position + forwardVector * (35 * t) + upVector * height
            local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)

            hrp.CFrame = CFrame.new(nextPos) * rotation
            local elapsedTime = tick() - startTime
            local expectedTime = (duration / steps) * i
            local waitTime = expectedTime - elapsedTime
            if waitTime > 0 then
                task.wait(waitTime)
            end
        end

        hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * 35) * startCFrame.Rotation
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
        humanoid:ChangeState(Enum.HumanoidStateType.Running)

        if animator then
            for _, data in ipairs(savedTracks) do
                local track = data.track
                track:Play()
                track.TimePosition = data.time
            end
        end
        task.wait(0.25)
        FlipCooldown = false
    end)
end

local Flip = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local button = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local move = Instance.new("ImageLabel")

Flip.Name = "Flip"
Flip.Parent = gethui()
Flip.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Flip.DisplayOrder = 999999
Flip.OnTopOfCoreBlur = true

Frame.Parent = Flip
Frame.AnchorPoint = Vector2.new(1, 1)
Frame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(1, -30, 1, -30)
Frame.Size = UDim2.new(0, 98, 0, 44)

button.Name = "button"
button.Parent = Frame
button.AnchorPoint = Vector2.new(0, 0.5)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundTransparency = 1.000
button.BorderColor3 = Color3.fromRGB(0, 0, 0)
button.BorderSizePixel = 0
button.Position = UDim2.new(0, 5, 0.5, 0)
button.Size = UDim2.new(0, 36, 0, 36)
button.Image = "rbxassetid://114905930912702"
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

UICorner.CornerRadius = UDim.new(0, 13)
UICorner.Parent = Frame

move.Name = "move"
move.Parent = Frame
move.AnchorPoint = Vector2.new(1, 0.5)
move.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
move.BackgroundTransparency = 1.000
move.BorderColor3 = Color3.fromRGB(0, 0, 0)
move.BorderSizePixel = 0
move.Position = UDim2.new(1, -5, 0.5, 0)
move.Size = UDim2.new(0, 36, 0, 36)
move.Image = "rbxassetid://107178621515925"

local UIS = game:GetService("UserInputService")
local function dragify(Frame, DragInp)
	local dragToggle = nil
	local dragInput = nil
	local dragStart = nil
	local Delta
	local Position
	local startPos
	local function updateInput(input)
		Delta = input.Position - dragStart
		Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		Frame.Position = Position
	end
	DragInp.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	DragInp.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
dragify(Frame, move)
getgenv().FlipUI = Flip
button.MouseButton1Click:Connect(FortniteFlips)

SaveManager:LoadAutoloadConfig()
