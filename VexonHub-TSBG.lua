repeat task.wait() until game:IsLoaded()

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:AddTheme({
    Name = "Dark",
    Accent = "#18181b",
    Dialog = "#18181b",
    Outline = "#FFFFFF",
    Text = "#FFFFFF",
    Placeholder = "#999999",
    Background = "#0e0e10",
    Button = "#52525b",
    Icon = "#a1a1aa"
})

WindUI:AddTheme({
    Name = "Light",
    Accent = "#f4f4f5",
    Dialog = "#f4f4f5",
    Outline = "#000000",
    Text = "#000000",
    Placeholder = "#666666",
    Background = "#ffffff",
    Button = "#e4e4e7",
    Icon = "#52525b"
})

WindUI:AddTheme({
    Name = "Gray",
    Accent = "#374151",
    Dialog = "#374151",
    Outline = "#d1d5db",
    Text = "#f9fafb",
    Placeholder = "#9ca3af",
    Background = "#1f2937",
    Button = "#4b5563",
    Icon = "#d1d5db"
})

WindUI:AddTheme({
    Name = "Blue",
    Accent = "#1e40af",
    Dialog = "#1e3a8a",
    Outline = "#93c5fd",
    Text = "#f0f9ff",
    Placeholder = "#60a5fa",
    Background = "#1e293b",
    Button = "#3b82f6",
    Icon = "#93c5fd"
})

WindUI:AddTheme({
    Name = "Green",
    Accent = "#059669",
    Dialog = "#047857",
    Outline = "#6ee7b7",
    Text = "#ecfdf5",
    Placeholder = "#34d399",
    Background = "#064e3b",
    Button = "#10b981",
    Icon = "#6ee7b7"
})

WindUI:AddTheme({
    Name = "Purple",
    Accent = "#7c3aed",
    Dialog = "#6d28d9",
    Outline = "#c4b5fd",
    Text = "#faf5ff",
    Placeholder = "#a78bfa",
    Background = "#581c87",
    Button = "#8b5cf6",
    Icon = "#c4b5fd"
})

WindUI:SetNotificationLower(true)

local ThemeList = {"Dark", "Light", "Gray", "Blue", "Green", "Purple"}
local ThemeIndex = 1

if not getgenv().TransparencyEnabled then
    getgenv().TransparencyEnabled = false
end

game.StarterGui:SetCore("SendNotification", {
    Title = "VexonHub",
    Text = "Toggle Keybind: ( R )",
    Duration = 30,
    Icon = "rbxassetid://84519376661277"
})

loadstring(game:HttpGet("https://pastefy.app/ZQtMnR66/raw"))()

local Window = WindUI:CreateWindow({
    Title = "VexonHub",
    Icon = "zap",
    Author = "The Strongest Battle Grounds",
    Folder = "vexonhub",
    Size = UDim2.fromOffset(500, 350),
    Transparent = getgenv().TransparencyEnabled,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 150,
    BackgroundImageTransparency = 0.8,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            ThemeIndex = ThemeIndex + 1
            if ThemeIndex > #ThemeList then
                ThemeIndex = 1
            end
            local selectedTheme = ThemeList[ThemeIndex]
            WindUI:SetTheme(selectedTheme)
            WindUI:Notify({
                Title = "Theme Changed",
                Content = "Switched to " .. selectedTheme .. " theme!",
                Duration = 2,
                Icon = "palette"
            })
            print("Switched to " .. selectedTheme .. " theme")
        end
    }
})

pcall(function()
    Window:CreateTopbarButton("TransparencyToggle", "eye", function()
        if getgenv().TransparencyEnabled then
            getgenv().TransparencyEnabled = false
            pcall(function()
                Window:ToggleTransparency(false)
            end)
            WindUI:Notify({
                Title = "Transparency",
                Content = "Transparency disabled",
                Duration = 3,
                Icon = "eye"
            })
            print("Transparency = false")
        else
            getgenv().TransparencyEnabled = true
            pcall(function()
                Window:ToggleTransparency(true)
            end)
            WindUI:Notify({
                Title = "Transparency",
                Content = "Transparency enabled",
                Duration = 3,
                Icon = "eye-off"
            })
            print(" Transparency = true")
        end
        print("Debug - Current Transparency state:", getgenv().TransparencyEnabled)
    end, 990)
end)

loadstring(game:HttpGet("https://pastefy.app/hcVkWhQF/raw"))()

Window.EditOpenButton(Window, {
    Title = "VexonHub",
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(255, 255, 255)),
    Draggable = true
})

Window.ToggleKey = Enum.KeyCode.R

local Tabs = {}
Tabs.Main = Window.Tab(Window, {Title = "Main", Icon = "eye", Desc = "VexonHub"})
Tabs.Misc = Window.Tab(Window, {Title = "Misc", Icon = "sparkles", Desc = "VexonHub"})
Tabs.Fight = Window.Tab(Window, {Title = "Fighting", Icon = "sword", Desc = "VexonHub"})
Tabs.Tech = Window.Tab(Window, {Title = "Tech", Icon = "wrench", Desc = "VexonHub"})
Tabs.Lag = Window.Tab(Window, {Title = "Lag-Ping", Icon = "leaf", Desc = "VexonHub"})
Tabs.Anim = Window.Tab(Window, {Title = "Animations", Icon = "package", Desc = "VexonHub"})
Tabs.Place = Window.Tab(Window, {Title = "Places", Icon = "map", Desc = "VexonHub"})
Tabs.Moveset = Window.Tab(Window, {Title = "Moveset", Icon = "star", Desc = "VexonHub"})
Tabs.Fling = Window.Tab(Window, {Title = "Fling", Icon = "user", Desc = "VexonHub"})
Tabs.Info = Window.Tab(Window, {Title = "Information", Icon = "badge-info", Desc = "VexonHub"})

Window.SelectTab(Window, 10)

Tabs.Main:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/mdJKdwbKjE")
    end
})

Tabs.Main:Section({Title = "Autos", Icon = "star"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character.WaitForChild(Character, "Humanoid")
local Animator = Humanoid.FindFirstChildOfClass(Humanoid, "Animator")
local Player = game:GetService("Players").LocalPlayer

Vector3.new(150, -495, 30)

local AutoWhirlwindDunk = false
local AutoWallCombo = false
local AntiInvisibility = false
local EspDeathCounter = false
local EspUltBar = false
local EspEveryone = false
local SpeedEnabled = false
local FakeDownslam = false
local SpeedValue = 9
local JumpValue = 200

local WallComboConnection1 = nil
local WallComboConnection2 = nil
local AntiAfkConnection = nil
local InvisibilityCache = {}
local EspData = {}

local WhirlwindAnimId = "rbxassetid://12296113986"

local InvisAnimIds = {
    ["136370737633649"] = true,
    ["18182425133"] = true,
    ["18236605028"] = true
}

local WallComboAnimIds = {
    ["rbxassetid://17325537719"] = true,
    ["rbxassetid://10469643643"] = true,
    ["rbxassetid://13294471966"] = true,
    ["rbxassetid://13295936866"] = true,
    ["rbxassetid://13378708199"] = true,
    ["rbxassetid://14136436157"] = true,
    ["rbxassetid://15162694192"] = true,
    ["rbxassetid://16552234590"] = true,
    ["rbxassetid://17889290569"] = true
}

local RoastMessages = {
    "Pathetic", "Nice try, loser", "Git gud", "You're a noob", "Did you even try?",
    "Keep dying, it's amusing", "Too easy", "Better luck next time", "That was embarrassing",
    "You're just feeding my kills", "Can't handle the pressure?", "You call that playing?",
    "LOL, what a scrub", "Go cry to your mommy", "Just uninstall.", "I'm not even trying.",
    "Get rekt, scrub", "You're a joke", "Just stop trying.", "Noob alert",
    "Stay in the kiddie pool", "Did someone forget their skills?", "Do you need a tutorial?",
    "You make this too easy.", "You're not even worth my time.", "I've seen toddlers play better.",
    "You're a respawn machine", "You're like a training dummy.", "Did you pay to be this bad?",
    "Even the NPCs play better than you.", "You must be allergic to victory.",
    "Your gameplay is a tutorial on how not to play.", "I bet you're proud of that death streak.",
    "You're the MVP of feeding kills.", "You're like a pinata... full of free kills.",
    "You're like a legend... in dying.", "Do you think dying is a tactic?",
    "What The Sigma.", "Ez Kill LOL", "hehe cry more"
}

local TeleportPosition = Vector3.new(150, -495, 30)
local AutoVoidEnabled = false
local IsVoiding = false
local TpBackEnabled = false

local VoidAnimations = {
    {id = "12273188754", timewait = 0.5},
    {id = "12296113986", timewait = 0.5},
    {id = "15145462680", timewait = 1.5},
    {id = "16139108718", timewait = 0.1},
    {id = "17889080495", timewait = 0},
    {id = "14705929107", timewait = 1.3},
    {id = "14701242661", timewait = 3},
    {id = "14920779925", timewait = 0.2},
    {id = "16062712948", timewait = 1}
}

local function OnCharacterAdded(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    Animator = Humanoid:FindFirstChildOfClass("Animator")
    if Animator then
        Animator.AnimationPlayed:Connect(onAnimationPlayed_AutoVoid)
    end
end

LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)
workspace.FallenPartsDestroyHeight = -math.huge

Tabs.Main:Dropdown({
    Title = "Select Place",
    Desc = "Where Do You Want It To Auto Place To?",
    [Players] = {"Map", "Pixel", "Void", "Darkness", "Mountain", "Counter", "Atomic Base", "Atomic Base Up", "Atomic Slash", "Prison"},
    Value = "Void",
    Multi = false,
    Callback = function(selected)
        if selected == "Map" then
            TeleportPosition = Vector3.new(150, 505, 30)
        elseif selected == "Pixel" then
            TeleportPosition = Vector3.new(30000000, 30000000, 30000000)
        elseif selected == "Void" then
            TeleportPosition = Vector3.new(150, -495, 30)
        elseif selected == "Darkness" then
            TeleportPosition = Vector3.new(0, 900000000002, 0)
        elseif selected == "Mountain" then
            TeleportPosition = Vector3.new(155.577392578125, 628.742431640625, -447.93841552734375)
        elseif selected == "Counter" then
            TeleportPosition = Vector3.new(-68, 29, 20346)
        elseif selected == "Atomic Base" then
            TeleportPosition = Vector3.new(1063, 30, 23006)
        elseif selected == "Atomic Base Up" then
            TeleportPosition = Vector3.new(1063, 405, 23006)
        elseif selected == "Atomic Slash" then
            TeleportPosition = Vector3.new(1063, 131, 23006)
        elseif selected == "Prison" then
            TeleportPosition = Vector3.new(438, 439, -376)
        end
    end
})

Tabs.Main:Toggle({
    Title = "Auto Void/Place",
    Value = false,
    Callback = function(state)
        AutoVoidEnabled = state
    end
})

Tabs.Main:Toggle({
    Title = "Tp Back Old Pos",
    Value = false,
    Callback = function(state)
        TpBackEnabled = state
    end
})

function onAnimationPlayed_AutoVoid(animTrack)
    if not AutoVoidEnabled or IsVoiding then
        return
    end
    
    local animation = animTrack.Animation
    if not animation then
        return
    end
    
    for _, animData in ipairs(VoidAnimations) do
        if animation.AnimationId == "rbxassetid://" .. animData.id then
            IsVoiding = true
            
            if not Character or not Character.Parent or not Humanoid or Humanoid.Health <= 0 then
                IsVoiding = false
                return
            end
            
            local rootPart = Character:FindFirstChild("HumanoidRootPart")
            if not rootPart then
                IsVoiding = false
                return
            end
            
            local oldCFrame = rootPart.CFrame
            task.wait(animData.timewait)
            
            if Character and Character.Parent and AutoVoidEnabled and Humanoid.Health > 0 then
                rootPart.CFrame = CFrame.new(TeleportPosition)
                animTrack.Stopped:Wait()
                
                if Character and Character.Parent and AutoVoidEnabled and TpBackEnabled and Humanoid.Health > 0 then
                    rootPart.CFrame = oldCFrame
                end
            end
            
            IsVoiding = false
            break
        end
    end
end

if Animator then
    Animator.AnimationPlayed:Connect(onAnimationPlayed_AutoVoid)
end

Tabs.Main:Toggle({
    Title = "Auto Whirlwind Dunk",
    Value = false,
    Callback = function(state)
        AutoWhirlwindDunk = state
    end
})

local function OnWhirlwindAnimation(animTrack)
    if AutoWhirlwindDunk and animTrack.Animation.AnimationId == WhirlwindAnimId then
        task.wait(1.2)
        local rootPart = Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local pos = rootPart.Position
            rootPart.CFrame = CFrame.new(pos.X, pos.Y + 100, pos.Z)
        end
    end
end

local function SendQInput()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
end

local function HandleWallComboAnimation(animTrack, character)
    if AutoWallCombo and animTrack.Animation then
        local rootPart = WallComboAnimIds[animTrack.Animation.AnimationId] and character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local savedCFrame = rootPart.CFrame
            local startTime = tick()
            local connection
            connection = RunService.Heartbeat:Connect(function()
                if AutoWallCombo and tick() - startTime < 0.3 then
                    if rootPart and rootPart.Parent then
                        rootPart.CFrame = savedCFrame * CFrame.Angles(math.rad(-25), 0, 0)
                    end
                else
                    if rootPart and rootPart.Parent then
                        rootPart.CFrame = savedCFrame
                    end
                    connection:Disconnect()
                end
            end)
        end
    end
end

local function SetupWallCombo(character)
    if WallComboConnection1 then
        WallComboConnection1:Disconnect()
    end
    if WallComboConnection2 then
        WallComboConnection2:Disconnect()
    end
    
    WallComboConnection1 = character.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("ObjectValue") and descendant.Name:lower() == "wallcombo" and AutoWallCombo then
            local startTime = tick()
            repeat
                SendQInput()
                task.wait()
            until not descendant.Parent or descendant.Parent ~= character or tick() - startTime >= (descendant:GetAttribute("DeleteMe") or 0.6)
        end
    end)
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        WallComboConnection2 = humanoid.AnimationPlayed:Connect(function(animTrack)
            HandleWallComboAnimation(animTrack, character)
        end)
    end
end

Tabs.Main:Toggle({
    Title = "Auto WallCombo + WallCombo Everywhere",
    Value = false,
    Callback = function(state)
        AutoWallCombo = state
        if state then
            if LocalPlayer.Character then
                SetupWallCombo(LocalPlayer.Character)
            end
        else
            if WallComboConnection1 then
                WallComboConnection1:Disconnect()
            end
            if WallComboConnection2 then
                WallComboConnection2:Disconnect()
            end
        end
    end
})

Tabs.Main:Section({Title = "Antis", Icon = "settings"})

Tabs.Main:Toggle({
    Title = "Anti Invisibility",
    Value = false,
    Callback = function(state)
        AntiInvisibility = state
        if not state then
            InvisibilityCache = {}
        end
    end
})

RunService.RenderStepped:Connect(function()
    if AntiInvisibility then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid = humanoid:FindFirstChildOfClass("Animator")
                end
                if humanoid then
                    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                        local animId = track.Animation
                        if animId then
                            animId = track.Animation.AnimationId:gsub("rbxassetid://", "")
                        end
                        if animId and InvisAnimIds[animId] then
                            track:Stop()
                        end
                    end
                end
            end
        end
    end
end)

local DeathCounterAnimId = "rbxassetid://1234567890"
local AntiDeathCounterActive = false

local function StartAntiDeathCounter()
    AntiDeathCounterActive = true
    task.spawn(function()
        local voidPos = Vector3.new(1000, -499, 1000)
        local camera = workspace.CurrentCamera
        local inAnimation = false
        
        while AntiDeathCounterActive do
            task.wait()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local animator = char:FindFirstChildOfClass("Animator")
                if animator then
                    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                        if track.Animation.AnimationId == DeathCounterAnimId and not inAnimation then
                            task.wait(0.5)
                            local isPlaying = true
                            local savedPos = char.HumanoidRootPart.Position
                            
                            track.Stopped:Connect(function()
                                isPlaying = false
                            end)
                            
                            repeat
                                task.wait()
                                char.HumanoidRootPart.CFrame = CFrame.new(voidPos)
                                task.wait(4)
                                char.HumanoidRootPart.CFrame = CFrame.new(savedPos)
                                task.wait(0.1)
                            until not isPlaying
                            
                            camera.CameraType = Enum.CameraType.Custom
                            game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
                            inAnimation = isPlaying
                        end
                    end
                end
            end
        end
    end)
end

local function StopAntiDeathCounter()
    AntiDeathCounterActive = false
end

Tabs.Main:Toggle({
    Title = "Anti Death Counter",
    Value = false,
    Callback = function(state)
        if state then
            StartAntiDeathCounter()
        else
            StopAntiDeathCounter()
        end
    end
})

Tabs.Main:Toggle({
    Title = "Anti-AFK",
    Value = false,
    Callback = function(state)
        if state then
            if AntiAfkConnection then
                AntiAfkConnection:Disconnect()
            end
            AntiAfkConnection = LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                task.wait(10)
                VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        elseif AntiAfkConnection then
            AntiAfkConnection:Disconnect()
            AntiAfkConnection = nil
        end
    end
})

Tabs.Main:Section({Title = "OP", Icon = "eye"})

Tabs.Main:Button({
    Title = "VexonHub Mini",
    Desc = "First version of the VexonHub but rly usefull",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/187a02764b1ad1a4"))()
    end
})

Tabs.Main:Button({
    Title = "Free Private Server",
    Desc = "you can farm kills in this Private server when you invite your frends",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/JYJEBr16/raw"))()
    end
})

Tabs.Main:Toggle({
    Title = "No Dash Cool Down",
    Value = false,
    Callback = function(state)
        workspace:SetAttribute("EffectAffects", state and 1 or 0)
        workspace:SetAttribute("NoDashCooldown", state)
    end
})

local PlayersService = game:GetService("Players")
local RunServiceGame = game:GetService("RunService")
local LocalPlayerGame = PlayersService.LocalPlayer
local CharacterGame = LocalPlayerGame.Character or LocalPlayerGame.CharacterAdded:Wait()
local HumanoidGame = CharacterGame.WaitForChild(CharacterGame, "Humanoid")
local AnimatorGame = HumanoidGame.FindFirstChildOfClass(HumanoidGame, "Animator")

local InvisAnimationId = "rbxassetid://136370737633649"
local InvisTimePosition = 4.56
local InvisSpeed = 0
local InvisTrack = nil
local InvisibilityEnabled = false

local function SetBodyTransparency(transparency)
    if CharacterGame then
        for _, partName in ipairs({"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}) do
            local part = CharacterGame:FindFirstChild(partName)
            if part and part:IsA("BasePart") then
                part.Transparency = transparency
            end
        end
    end
end

local function PlayInvisAnimation()
    if not (InvisTrack and InvisTrack.IsPlaying) then
        local anim = Instance.new("Animation")
        anim.AnimationId = InvisAnimationId
        InvisTrack = AnimatorGame:LoadAnimation(anim)
        InvisTrack:Play()
        InvisTrack.TimePosition = InvisTimePosition
        InvisTrack:AdjustSpeed(InvisSpeed)
    end
end

local function StopInvisAnimation()
    if InvisTrack and InvisTrack.IsPlaying then
        InvisTrack:Stop()
        InvisTrack = nil
    end
end

Tabs.Main:Toggle({
    Title = "Invisiblity",
    Value = false,
    Callback = function(state)
        InvisibilityEnabled = state
        if InvisibilityEnabled then
            SetBodyTransparency(0.5)
        else
            SetBodyTransparency(0)
            StopInvisAnimation()
        end
    end
})

RunServiceGame.RenderStepped:Connect(function()
    if InvisibilityEnabled and InvisTrack and InvisTrack.IsPlaying then
        StopInvisAnimation()
    end
end)

RunServiceGame.Heartbeat:Connect(function()
    if InvisibilityEnabled then
        PlayInvisAnimation()
    end
end)

local function OnCharacterAddedInvis(newChar)
    CharacterGame = newChar
    HumanoidGame = CharacterGame:WaitForChild("Humanoid")
    AnimatorGame = HumanoidGame:FindFirstChildOfClass("Animator")
    
    HumanoidGame.Died:Connect(function()
        if InvisibilityEnabled then
            StopInvisAnimation()
        end
    end)
    
    if InvisibilityEnabled then
        SetBodyTransparency(0.5)
        PlayInvisAnimation()
    end
end

LocalPlayerGame.CharacterAdded:Connect(OnCharacterAddedInvis)

Tabs.Main:Section({Title = "ESP", Icon = "package"})

local function UpdateDeathCounterEsp()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Counter") then
            if not player:FindFirstChild("SkullBillboard") then
                local head = player.Character:FindFirstChild("Head")
                if head then
                    local billboard = Instance.new("BillboardGui", head)
                    billboard.Size = UDim2.new(5, 0, 5, 0)
                    billboard.Adornee = head
                    billboard.AlwaysOnTop = true
                    
                    local label = Instance.new("TextLabel", billboard)
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.Text = "💀💀💀"
                    label.TextSize = 50
                    label.BackgroundTransparency = 1
                    label.TextColor3 = Color3.fromRGB(200, 200, 200)
                    
                    local tracker = Instance.new("ObjectValue", player)
                    tracker.Name = "SkullBillboard"
                    tracker.Value = billboard
                end
            end
        elseif player:FindFirstChild("SkullBillboard") then
            player.SkullBillboard.Value:Destroy()
            player.SkullBillboard:Destroy()
        end
    end
end

Tabs.Main:Toggle({
    Title = "Esp Death Counter",
    Value = false,
    Callback = function(state)
        EspDeathCounter = state
        if state then
            task.spawn(function()
                while EspDeathCounter do
                    UpdateDeathCounterEsp()
                    task.wait(1)
                end
            end)
        end
    end
})

local function CreateUltEsp(character, player)
    if EspUltBar then
        local head = character:FindFirstChild("Head")
        if head and not head:FindFirstChild("UltimateTag") then
            local billboard = Instance.new("BillboardGui", head)
            billboard.Name = "UltimateTag"
            billboard.Size = UDim2.new(0, 150, 0, 70)
            billboard.StudsOffset = Vector3.new(0, 4, 0)
            billboard.AlwaysOnTop = true
            billboard.Adornee = head
            
            local label = Instance.new("TextLabel", billboard)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 0.8
            label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            label.TextColor3 = Color3.fromRGB(255, 255, 0)
            label.TextScaled = true
            label.Font = Enum.Font.FredokaOne
            label.TextStrokeTransparency = 0.5
            label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            
            local function UpdateUlt()
                local ultValue = player:GetAttribute("Ultimate")
                label.Text = ultValue and "ULT: " .. tostring(math.floor(ultValue)) or "ULT: N/A"
            end
            
            UpdateUlt()
            player:GetAttributeChangedSignal("Ultimate"):Connect(UpdateUlt)
        end
    end
end

local function SetupUltEspForPlayer(player)
    player.CharacterAdded:Connect(function(char)
        task.wait(1)
        if char then
            CreateUltEsp(char, player)
        end
    end)
    if player.Character then
        CreateUltEsp(player.Character, player)
    end
end

Tabs.Main:Toggle({
    Title = "Esp Ult Bar",
    Value = false,
    Callback = function(state)
        EspUltBar = state
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                if state then
                    CreateUltEsp(player.Character, player)
                else
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        local tag = head:FindFirstChild("UltimateTag")
                        if tag then
                            tag:Destroy()
                        end
                    end
                end
            end
        end
    end
})

local function CreatePlayerEsp(player, character)
    if EspEveryone then
        local humanoid = character:WaitForChild("Humanoid")
        local head = character:WaitForChild("Head")
        
        local espText = Drawing.new("Text")
        espText.Visible = false
        espText.Center = true
        espText.Outline = true
        espText.Font = 3
        espText.Size = 18
        espText.Color = Color3.fromRGB(255, 255, 255)
        
        local function GetEspText()
            local ping = math.floor(player:GetAttribute("Ping") or 0)
            local platform = player:GetAttribute("Mobile") and "Mobile" or "PC"
            local streak = workspace.Live:FindFirstChild(player.Name) and (workspace.Live[player.Name]:GetAttribute("CurrentStreak") or 0) or 0
            return "[ " .. player.Name .. " | Ping: " .. tostring(ping) .. " | " .. platform .. " | Streak: " .. tostring(streak) .. " ]"
        end
        
        local connections = {}
        
        local function Cleanup()
            espText:Remove()
            for _, conn in ipairs(connections) do
                conn:Disconnect()
            end
            EspData[player] = nil
        end
        
        table.insert(connections, character.AncestryChanged:Connect(function(_, parent)
            if not parent then
                Cleanup()
            end
        end))
        
        table.insert(connections, humanoid.Died:Connect(Cleanup))
        
        table.insert(connections, RunService.RenderStepped:Connect(function()
            if EspEveryone and head and head.Parent then
                local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(head.Position)
                if onScreen then
                    espText.Position = Vector2.new(screenPos.X, screenPos.Y - 27)
                    espText.Text = GetEspText()
                    espText.Visible = true
                else
                    espText.Visible = false
                end
            else
                Cleanup()
            end
        end))
        
        EspData[player] = {Cleanup}
    end
end

local function ClearAllEsp()
    for _, data in pairs(EspData) do
        if data[1] then
            data[1]()
        end
    end
    EspData = {}
end

local function SetupEspForPlayer(player)
    if player ~= LocalPlayer then
        if player.Character then
            CreatePlayerEsp(player, player.Character)
        end
        player.CharacterAdded:Connect(function(char)
            CreatePlayerEsp(player, char)
        end)
    end
end

Tabs.Main:Toggle({
    Title = "ESP Everyone",
    Value = false,
    Callback = function(state)
        EspEveryone = state
        if EspEveryone then
            for _, player in pairs(Players:GetPlayers()) do
                SetupEspForPlayer(player)
            end
        else
            ClearAllEsp()
        end
    end
})

Tabs.Main:Section({Title = "Movement", Icon = "settings"})

local function ToggleSpeed(state)
    SpeedEnabled = state
    getgenv().WalkspeedBypass = SpeedEnabled
    if state then
        task.spawn(function()
            while getgenv().WalkspeedBypass and Character and Character.Parent do
                local hum = Character:FindFirstChildOfClass("Humanoid")
                if hum and hum.MoveDirection.Magnitude > 0 then
                    Character:TranslateBy(hum.MoveDirection * SpeedValue * RunService.Heartbeat:Wait() * 7)
                else
                    task.wait()
                end
            end
        end)
    end
end

Tabs.Main:Toggle({
    Title = "Speed (V Key On/Off)",
    Value = false,
    Callback = ToggleSpeed
})

Tabs.Main:Slider({
    Title = "Speed Boost Value",
    Value = {Min = 1, Max = 100, Default = 9},
    Callback = function(value)
        SpeedValue = value
    end
})

UserInputService.InputBegan:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.V and not processed then
        ToggleSpeed(not SpeedEnabled)
    end
end)

Tabs.Main:Toggle({
    Title = "Jump",
    Value = false,
    Callback = function(state)
        getgenv().JumpPowerBypass = state
        if state then
            task.spawn(function()
                while getgenv().JumpPowerBypass do
                    if HumanoidGame and HumanoidGame:GetState() == Enum.HumanoidStateType.Jumping then
                        CharacterGame.HumanoidRootPart.CFrame = CharacterGame.HumanoidRootPart.CFrame * CFrame.new(0, JumpValue, 0)
                    end
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Main:Slider({
    Title = "Jump Boost Value",
    Value = {Min = 1, Max = 1000, Default = 200},
    Callback = function(value)
        JumpValue = value
    end
})

Tabs.Main:Toggle({
    Title = "No Stun",
    Value = false,
    Callback = function(state)
        getgenv().AutoNoSlow = state
        task.spawn(function()
            local connection
            connection = game:GetService("RunService").RenderStepped:Connect(function()
                if getgenv().AutoNoSlow ~= true then
                    connection:Disconnect()
                else
                    pcall(function()
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
                    end)
                end
            end)
        end)
    end
})

Tabs.Main:Section({Title = "Character", Icon = "box"})

Tabs.Main:Toggle({
    Title = "Fake Downslam",
    Value = false,
    Callback = function(state)
        FakeDownslam = state
    end
})

local function OnStateChanged(_, newState)
    if FakeDownslam and newState == Enum.HumanoidStateType.Jumping then
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://10470104242"
        if HumanoidGame then
            local track = HumanoidGame:LoadAnimation(anim)
            task.wait(0.3)
            track:Play()
        end
    end
end

Tabs.Main:Toggle({
    Title = "Auto Safe Zone",
    Value = false,
    Callback = function(state)
        getgenv().AutoReturnSafeZone = state
        if state then
            local hasTeleported = false
            task.spawn(function()
                while getgenv().AutoReturnSafeZone do
                    if HumanoidGame and HumanoidGame.Health < 45 and not hasTeleported then
                        CharacterGame.HumanoidRootPart.CFrame = CFrame.new(150, 705, 30)
                        hasTeleported = true
                    elseif HumanoidGame and HumanoidGame.Health == 50 and hasTeleported then
                        hasTeleported = false
                    end
                    task.wait(0.15)
                end
            end)
        end
    end
})

Tabs.Main:Toggle({
    Title = "Spawn Fe Stone Effects",
    Value = false,
    Callback = function(state)
        getgenv().AutoDashEffect = state
        if state then
            task.spawn(function()
                while getgenv().AutoDashEffect and CharacterGame and CharacterGame:FindFirstChild("Communicate") do
                    local args = {{Dash = Enum.KeyCode.S, Key = Enum.KeyCode.Q, Goal = "KeyPress"}}
                    CharacterGame.Communicate:FireServer(unpack(args))
                    task.wait(0.15)
                end
            end)
        end
    end
})

Tabs.Main:Toggle({
    Title = "Roast Dead Players",
    Value = false,
    Callback = function(state)
        getgenv().AutoMocking = state
        if state then
            task.spawn(function()
                while getgenv().AutoMocking do
                    local rootPart = CharacterGame and CharacterGame:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        local closestDistance = 65
                        local closestTarget = nil
                        
                        for _, model in ipairs(workspace.Live:GetChildren()) do
                            local hum = model:FindFirstChildOfClass("Humanoid")
                            local hrp = model:FindFirstChild("HumanoidRootPart")
                            if hum and hrp and model ~= CharacterGame and hum.Health == 0 then
                                local dist = (rootPart.Position - hrp.Position).magnitude
                                if dist < closestDistance then
                                    closestTarget = hrp
                                    closestDistance = dist
                                end
                            end
                        end
                        
                        if closestTarget then
                            local roast = RoastMessages[math.random(#RoastMessages)]
                            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(roast, "All")
                        end
                    end
                    task.wait(2.85)
                end
            end)
        end
    end
})

LocalPlayer.CharacterAdded:Connect(function(newChar)
    OnCharacterAdded(newChar)
    if AutoWallCombo then
        SetupWallCombo(newChar)
    end
    HumanoidGame.AnimationPlayed:Connect(onAnimationPlayed_AutoVoid)
    HumanoidGame.AnimationPlayed:Connect(OnWhirlwindAnimation)
    HumanoidGame.AnimationPlayed:Connect(onAnimationPlayed_DeathCounter)
    HumanoidGame.StateChanged:Connect(OnStateChanged)
    HumanoidGame.Died:Connect(onCharacterDied_DeathCounter)
    HumanoidGame.Died:Connect(function() end)
end)

HumanoidGame.AnimationPlayed:Connect(onAnimationPlayed_AutoVoid)
HumanoidGame.AnimationPlayed:Connect(OnWhirlwindAnimation)
HumanoidGame.AnimationPlayed:Connect(onAnimationPlayed_DeathCounter)
HumanoidGame.StateChanged:Connect(OnStateChanged)
HumanoidGame.Died:Connect(onCharacterDied_DeathCounter)
HumanoidGame.Died:Connect(function() end)

if AutoWallCombo then
    SetupWallCombo(CharacterGame)
end

Players.PlayerAdded:Connect(SetupUltEspForPlayer)
Players.PlayerAdded:Connect(SetupEspForPlayer)

for _, player in pairs(Players:GetPlayers()) do
    SetupUltEspForPlayer(player)
    SetupEspForPlayer(player)
end

Players.PlayerRemoving:Connect(function(player)
    if EspData[player] and EspData[player][1] then
        EspData[player][1]()
    end
end)

Tabs.Main:Toggle({
    Title = "Grape Dummy :>",
    Value = false,
    Callback = function(state)
        getgenv().AutoFuckingGoku = state
        task.spawn(function()
            if getgenv().AutoFuckingGoku ~= true then
                for _, track in ipairs((game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("AnimationController")):GetPlayingAnimationTracks()) do
                    track:Stop()
                end
            else
                local anim = Instance.new("Animation")
                anim.AnimationId = "rbxassetid://148840371"
                local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
                track:Play()
                track:AdjustSpeed(6)
            end
        end)
        
        task.spawn(function()
            if getgenv().AutoFuckingGoku ~= true then
                for _, child in ipairs(workspace:children()) do
                    if child:isA("Sound") then
                        child:Destroy()
                    end
                end
            else
                local sound1 = Instance.new("Sound")
                sound1.Name = "Sound"
                sound1.SoundId = "http://www.roblox.com/asset/?id=8448213216"
                sound1.Volume = 10
                sound1.Looped = false
                sound1.Archivable = false
                sound1.Parent = game.Workspace
                sound1:Play()
                
                local sound2 = Instance.new("Sound")
                sound2.Name = "Sound"
                sound2.SoundId = "http://www.roblox.com/asset/?id=9114758204"
                sound2.Volume = 10
                sound2.Looped = true
                sound2.Archivable = false
                sound2.Parent = game.Workspace
                sound2:Play()
            end
        end)
        
        task.spawn(function()
            while getgenv().AutoFuckingGoku == true do
                pcall(function()
                    local dummy = game.Workspace.Live["Weakest Dummy"]
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(dummy.HumanoidRootPart.Position - dummy.HumanoidRootPart.CFrame.LookVector * 1, dummy.HumanoidRootPart.Position)
                end)
                task.wait(0)
            end
        end)
    end
})

Tabs.Misc:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/mdJKdwbKjE")
    end
})

Tabs.Misc:Section({Title = "Universal Scripts", Icon = "flame"})

Tabs.Misc:Button({Title = "Inf Yield", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end})

Tabs.Misc:Button({Title = "Dex Explorer", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Classic-Dex-Explorer-21009"))()
end})

Tabs.Misc:Button({Title = "Remote Spy", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
end})

Tabs.Misc:Button({Title = "Keyboard", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end})

Tabs.Misc:Button({Title = "Anim Logger", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/juBGMpCZ/raw"))()
end})

Tabs.Misc:Button({Title = "f3x", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/f3x.lua"))()
end})

Tabs.Misc:Button({Title = "Fly V3", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/xuSMWfDu"))()
end})

Tabs.Misc:Button({Title = "VFX Logger", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/2uXfJqdU"))()
end})

Tabs.Misc:Button({Title = "Auto Block V10", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/TSB/refs/heads/main/CombatGui"))()
end})

Tabs.Misc:Section({Title = "Player", Icon = "star"})

Tabs.Misc:Button({Title = "ServerHop", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/uTXUoORd/raw"))()
end})

Tabs.Misc:Button({Title = "Rejoin", Locked = false, Callback = function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end})

Tabs.Misc:Button({Title = "Reset", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/YPv8xrYN/raw"))()
end})

Tabs.Misc:Button({Title = "Fixcam V1", Locked = false, Callback = function()
    Camera.CameraType = Enum.CameraType.Custom
    LocalPlayerGame.CameraMode = Enum.CameraMode.Classic
end})

Tabs.Misc:Button({Title = "Fixcam V2", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/IrvnCaF2/raw"))()
end})

Tabs.Misc:Section({Title = "Random", Icon = "utensils"})

Tabs.Misc:Button({Title = "Buy limited Emotes", Desc = "(You can buy limited emotes that have been removed from the game with robux idrl is this patched or not)", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/UiPAjkB4/raw"))()
end})

Tabs.Misc:Button({Title = "Strange Character Mod", Desc = "(WallCombo Everywhere + Ragdoll Hit + NoVelocity Dash + Upsitedown)", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/dwPwscTr/raw"))()
end})

Tabs.Misc:Button({Title = "Strange Attacks", Desc = "(All moves fall from above)", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/jP73sWh8/raw"))()
end})

Tabs.Misc:Button({Title = "Baldy Dummy", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/b1matovZ/raw"))()
end})

Tabs.Misc:Button({Title = "Crazy Spin", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/BFB6IlAQ/raw"))()
end})

Tabs.Misc:Button({Title = "Crazy Dance", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/I5eLfnge/raw"))()
end})

Tabs.Misc:Toggle({
    Title = "Anti Fly Bypass",
    Value = false,
    Callback = function(state)
        if state then
            workspace:SetAttribute("VIPServer", true)
        else
            workspace:SetAttribute("VIPServer", false)
        end
    end
})

Tabs.Misc:Section({Title = "Tools", Icon = "eye"})

local function CreatePlaceTool(toolName, position)
    local backpack = Player.Backpack
    local savedPosition = nil
    
    local tool = Instance.new("Tool")
    tool.Name = toolName
    tool.RequiresHandle = false
    tool.Parent = backpack
    
    tool.Equipped:Connect(function()
        savedPosition = Player.Character.HumanoidRootPart.Position
        Player.Character:SetPrimaryPartCFrame(CFrame.new(position))
    end)
    
    tool.Unequipped:Connect(function()
        if savedPosition then
            Player.Character:SetPrimaryPartCFrame(CFrame.new(savedPosition))
        end
    end)
end

Tabs.Misc:Dropdown({
    Title = "Place Tools",
    Desc = "What Place Tool Do You Want?",
    [Players] = {"Map", "SafeZone1", "SafeZone2", "Pixel", "Void", "DarkNess", "Montain", "Counter", "Counter Up", "Atomic Base", "Atomic Base Up", "Atomic Slash", "Prison"},
    Multi = false,
    AllowNone = false,
    Callback = function(selected)
        local toolData = {
            Map = {name = "Map Tool", position = Vector3.new(150, 440, 30)},
            SafeZone1 = {name = "SafeZone1 Tool", position = Vector3.new(150, 505, 30)},
            SafeZone2 = {name = "SafeZone2 Tool", position = Vector3.new(150, 705, 30)},
            Pixel = {name = "Pixel Tool", position = Vector3.new(30000000, 30000000, 30000000)},
            Void = {name = "Void Tool", position = Vector3.new(150, -495, 30)},
            DarkNess = {name = "DarkNess Tool", position = Vector3.new(0, 900000000002, 0)},
            Montain = {name = "Mountain Tool", position = Vector3.new(155.577, 628.742, -447.938)},
            Counter = {name = "Counter Tool", position = Vector3.new(-68, 29, 20346)},
            ["Counter Up"] = {name = "CounterUp Tool", position = Vector3.new(-68, 84, 20354)},
            ["Atomic Base"] = {name = "AtomicBase Tool", position = Vector3.new(1063, 30, 23006)},
            ["Atomic Base Up"] = {name = "AtomicBaseUp Tool", position = Vector3.new(1063, 405, 23006)},
            ["Atomic Slash"] = {name = "AtomicSlash Tool", position = Vector3.new(1063, 131, 23006)},
            Prison = {name = "Prison Tool", position = Vector3.new(438, 439, -376)}
        }
        
        local data = toolData[selected]
        if data then
            CreatePlaceTool(data.name, data.position)
        end
    end
})

Tabs.Misc:Button({Title = "TrashCan Tool", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/ffnvee4X/raw"))()
end})

Tabs.Misc:Button({Title = "Fake 20-20-20 Dropkick", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/Ja7L18CD/raw"))()
end})

Tabs.Misc:Button({Title = "Dodge", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/XB1ykQuc/raw"))()
end})

Tabs.Misc:Button({Title = "TP Tool (Anim)", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/yEwya3MR/raw"))()
end})

Tabs.Misc:Button({Title = "TP Tool (Normal)", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/ZLpXLAeF/raw"))()
end})

Tabs.Misc:Button({Title = "Run Tool", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/6DahLoA3/raw"))()
end})

Tabs.Misc:Button({Title = "Super Run Tool", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/uN8jb9GF/raw"))()
end})

Tabs.Misc:Button({Title = "Jerk Of Tool", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/LcC6ZrhN/raw"))()
end})

Tabs.Misc:Button({Title = "Invis Block Tool (Buggy)", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/sl5RToWq/raw"))()
end})

Tabs.Tech:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/mdJKdwbKjE")
    end
})

Tabs.Tech:Section({Title = "Tech Scripts", Icon = "box"})

Tabs.Tech:Button({Title = "M1 Reset Script", Locked = false, Callback = function()
    getgenv().keybinds = {m1reset = Enum.KeyCode.R, emotedash = Enum.KeyCode.T, rotation = Enum.KeyCode.H}
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Slaphello/M1-Reset-And-Emote-Dash-TSB-OLD-/refs/heads/main/M1R%26ED%20TSB"))()
end})

Tabs.Tech:Button({Title = "Auto Kyoto Script", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Auto%20kyoto%20ma%20hoa"))()
end})

Tabs.Tech:Button({Title = "Loop Dash Script", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Loop%20Dash%20Rework%20Script%20Real"))()
end})

Tabs.Tech:Button({Title = "Oreo Dash Script", Locked = false, Callback = function()
    loadstring("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Oreo%20Tech%20Script\"))()")()
end})

Tabs.Tech:Button({Title = "Tornado Dash Script", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Idk%20lolololol"))()
end})

Tabs.Tech:Button({Title = "Supa Dash Script", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Supa%20tech%20script"))()
end})

Tabs.Tech:Button({Title = "BackDash Script (MOBILE)", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/BackDash%20Tech"))()
end})

Tabs.Tech:Button({Title = "Backdash Script (PC)", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/BackDash%20For%20Pc"))()
end})

Tabs.Tech:Section({Title = "Auto Techs", Icon = "sword"})

local TrueDownslamConnection = nil

Tabs.Tech:Toggle({
    Title = "True DownSlam",
    Value = false,
    Callback = function(state)
        local PlayersService = game:GetService("Players")
        local RunServiceLocal = game:GetService("RunService")
        local WorkspaceLocal = game:GetService("Workspace")
        local LocalPlayerLocal = PlayersService.LocalPlayer
        local CameraLocal = WorkspaceLocal.CurrentCamera
        
        local DownslamAnims = {
            ["rbxassetid://13532600125"] = true,
            ["rbxassetid://10469630950"] = true,
            ["rbxassetid://13296577783"] = true,
            ["rbxassetid://13370310513"] = true,
            ["rbxassetid://15240216931"] = true,
            ["rbxassetid://16515520431"] = true,
            ["rbxassetid://17889461810"] = true
        }
        
        local DownslamHitAnims = {
            ["rbxassetid://13532604085"] = true,
            ["rbxassetid://10469639222"] = true,
            ["rbxassetid://13295919399"] = true,
            ["rbxassetid://13378751717"] = true,
            ["rbxassetid://15240176873"] = true,
            ["rbxassetid://16515448089"] = true,
            ["rbxassetid://17889471098"] = true
        }
        
        local AnimCooldowns = {}
        local CharacterLocal = nil
        
        local function GetCharacter()
            local char = LocalPlayerLocal.Character or LocalPlayerLocal.CharacterAdded:Wait()
            local hum = char:WaitForChild("Humanoid")
            char.PrimaryPart = char:WaitForChild("HumanoidRootPart")
            return char, hum
        end
        
        local function PerformTrueDownslam()
            if CharacterLocal and CharacterLocal.PrimaryPart then
                local camSubject = CameraLocal.CameraSubject
                CameraLocal.CameraSubject = nil
                
                local currentPivot = CharacterLocal:GetPivot()
                local targetPivot = currentPivot + Vector3.new(0, 7, 0)
                local steps = 10
                local duration = 0.1
                
                for i = 1, steps do
                    CharacterLocal:PivotTo(currentPivot:Lerp(targetPivot, i / steps))
                    task.wait(duration / steps)
                end
                
                CameraLocal.CameraSubject = camSubject
            end
        end
        
        if state then
            if TrueDownslamConnection then
                TrueDownslamConnection:Disconnect()
            end
            
            local char, hum = GetCharacter()
            CharacterLocal = char
            
            TrueDownslamConnection = RunServiceLocal.RenderStepped:Connect(function()
                if LocalPlayerLocal.Character ~= CharacterLocal then
                    char, hum = GetCharacter()
                    CharacterLocal = char
                end
                
                for _, track in pairs(hum:GetPlayingAnimationTracks()) do
                    local animId = tostring(track.Animation.AnimationId)
                    local currentTime = tick()
                    
                    if DownslamAnims[animId] and (not AnimCooldowns[animId] or currentTime - AnimCooldowns[animId] > 0.5) then
                        AnimCooldowns[animId] = currentTime
                        task.delay(0.15, PerformTrueDownslam)
                    elseif DownslamHitAnims[animId] and (not AnimCooldowns[animId] or currentTime - AnimCooldowns[animId] > 0.5) then
                        AnimCooldowns[animId] = currentTime
                        task.delay(0.15, function()
                            hum:ChangeState(Enum.HumanoidStateType.Jumping)
                        end)
                    end
                end
            end)
        elseif TrueDownslamConnection then
            TrueDownslamConnection:Disconnect()
            TrueDownslamConnection = nil
        end
    end
})

local TwistedTechActive = false
local TwistedTechConnection = nil
local TwistedAnimId = "rbxassetid://13294471966"
local TwistedDelay = 0.23

local function SendDash()
    local args = {{Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress"}}
    local char = LocalPlayerGame.Character
    if char and char:FindFirstChild("Communicate") then
        char.Communicate:FireServer(unpack(args))
    end
end

local function MoveForward()
    local rootPart = LocalPlayerGame.Character and LocalPlayerGame.Character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        rootPart.CFrame = rootPart.CFrame * CFrame.new(0, 0, 3)
    end
end

local function SetupTwistedTech()
    TwistedTechConnection = (LocalPlayerGame.Character or LocalPlayerGame.CharacterAdded:Wait()):WaitForChild("Humanoid").AnimationPlayed:Connect(function(track)
        if track.Animation and track.Animation.AnimationId == TwistedAnimId and not TwistedTechActive then
            TwistedTechActive = true
            task.delay(TwistedDelay, function()
                MoveForward()
                SendDash()
            end)
            task.delay(5, function()
                TwistedTechActive = false
            end)
        end
    end)
end

Tabs.Tech:Toggle({
    Title = "Auto Twisted Tech",
    Value = false,
    Callback = function(state)
        if state then
            SetupTwistedTech()
            LocalPlayerGame.CharacterAdded:Connect(function()
                task.wait(1)
                SetupTwistedTech()
            end)
        elseif TwistedTechConnection then
            TwistedTechConnection:Disconnect()
            TwistedTechConnection = nil
        end
    end
})

local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera
local InstantTwistedActive = false
local InstantTwistedAnimConnection = nil
local InstantTwistedCharConnection = nil

local function PerformInstantTwisted()
    local args = {{Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress"}}
    local char = LocalPlayerGame.Character
    if char and char:FindFirstChild("Communicate") then
        char.Communicate:FireServer(unpack(args))
    end
    
    local currentCFrame = Camera.CFrame
    local rotatedCFrame = currentCFrame * CFrame.Angles(40, math.rad(-90), 180)
    Camera.CameraType = Enum.CameraType.Scriptable
    
    local tween1 = TweenService:Create(Camera, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {CFrame = rotatedCFrame})
    tween1:Play()
    tween1.Completed:Wait()
    wait(0.00001)
    
    local tween2 = TweenService:Create(Camera, TweenInfo.new(0.001, Enum.EasingStyle.Sine), {CFrame = currentCFrame})
    tween2:Play()
    tween2.Completed:Wait()
    wait(0.1)
    
    local tween3 = TweenService:Create(Camera, TweenInfo.new(0.0001, Enum.EasingStyle.Sine), {CFrame = currentCFrame * CFrame.Angles(math.rad(-6), math.rad(20), 0)})
    tween3:Play()
    tween3.Completed:Wait()
    
    Camera.CameraType = Enum.CameraType.Custom
end

local function SetupInstantTwisted(animator)
    InstantTwistedAnimConnection = animator.AnimationPlayed:Connect(function(track)
        if track.Animation and track.Animation.AnimationId == TwistedAnimId and not InstantTwistedActive then
            InstantTwistedActive = true
            
            local rootPart = LocalPlayerGame.Character and LocalPlayerGame.Character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                local backVector = rootPart.CFrame.LookVector * -1
                rootPart.CFrame = rootPart.CFrame + backVector
            end
            
            task.delay(0.25, function()
                PerformInstantTwisted()
                wait(5)
                InstantTwistedActive = false
            end)
        end
    end)
end

local function InitInstantTwisted()
    local humanoid = (LocalPlayerGame.Character or LocalPlayerGame.CharacterAdded:Wait()):WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if animator then
        SetupInstantTwisted(animator)
    else
        humanoid.ChildAdded:Connect(function(child)
            if child:IsA("Animator") then
                SetupInstantTwisted(child)
            end
        end)
    end
end

Tabs.Tech:Toggle({
    Title = "Instant Twisted Tech",
    Value = false,
    Callback = function(state)
        if state then
            InitInstantTwisted()
            InstantTwistedCharConnection = LocalPlayerGame.CharacterAdded:Connect(InitInstantTwisted)
        else
            if InstantTwistedAnimConnection then
                InstantTwistedAnimConnection:Disconnect()
                InstantTwistedAnimConnection = nil
            end
            if InstantTwistedCharConnection then
                InstantTwistedCharConnection:Disconnect()
                InstantTwistedCharConnection = nil
            end
        end
    end
})

local SupaStreamAnimId = "rbxassetid://12296113986"
local SupaStreamActive = false
local SupaStreamAnimConnection = nil
local SupaStreamCharConnection = nil

local function SupaStreamJump()
    local humanoid = LocalPlayerGame.Character and LocalPlayerGame.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Jump = true
    end
end

local function SupaStreamStopJump()
    local humanoid = LocalPlayerGame.Character and LocalPlayerGame.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Jump = false
    end
end

local function SupaStreamTurn()
    local rootPart = LocalPlayerGame.Character and LocalPlayerGame.Character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        local cf = rootPart.CFrame
        local backVector = -cf.LookVector
        rootPart.CFrame = CFrame.lookAt(cf.Position, cf.Position + backVector)
        Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + backVector)
    end
end

local function SupaStreamDash()
    local communicate = LocalPlayerGame.Character and LocalPlayerGame.Character:FindFirstChild("Communicate")
    if communicate then
        local args = {{Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress"}}
        communicate:FireServer(unpack(args))
    end
end

local function SetupSupaStream(humanoid)
    SupaStreamAnimConnection = humanoid.AnimationPlayed:Connect(function(track)
        if track.Animation and track.Animation.AnimationId == SupaStreamAnimId and not SupaStreamActive then
            SupaStreamActive = true
            SupaStreamJump()
            task.delay(2, function()
                SupaStreamDash()
                task.delay(0.26, function()
                    SupaStreamTurn()
                    SupaStreamStopJump()
                    SupaStreamActive = false
                end)
            end)
        end
    end)
end

local function InitSupaStream()
    SetupSupaStream((LocalPlayerGame.Character or LocalPlayerGame.CharacterAdded:Wait()):WaitForChild("Humanoid"))
end

Tabs.Tech:Toggle({
    Title = "Auto Supa Stream",
    Value = false,
    Callback = function(state)
        if state then
            InitSupaStream()
            SupaStreamCharConnection = LocalPlayerGame.CharacterAdded:Connect(InitSupaStream)
        else
            if SupaStreamAnimConnection then
                SupaStreamAnimConnection:Disconnect()
                SupaStreamAnimConnection = nil
            end
            if SupaStreamCharConnection then
                SupaStreamCharConnection:Disconnect()
                SupaStreamCharConnection = nil
            end
        end
    end
})

local SupaUppercutAnimId = "rbxassetid://10503381238"
local SupaUppercutActive = false
local SupaUppercutAnimConnection = nil
local SupaUppercutCharConnection = nil

local function SupaUppercutJump()
    local humanoid = LocalPlayerGame.Character and LocalPlayerGame.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Jump = true
    end
end

local function SupaUppercutStopJump()
    local humanoid = LocalPlayerGame.Character and LocalPlayerGame.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Jump = false
    end
end

local function SupaUppercutTurn()
    local rootPart = LocalPlayerGame.Character and LocalPlayerGame.Character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        local cf = rootPart.CFrame
        local backVector = -cf.LookVector
        rootPart.CFrame = CFrame.lookAt(cf.Position, cf.Position + backVector)
        Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + backVector)
    end
end

local function SupaUppercutDash()
    local communicate = LocalPlayerGame.Character and LocalPlayerGame.Character:FindFirstChild("Communicate")
    if communicate then
        local args = {{Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress"}}
        communicate:FireServer(unpack(args))
    end
end

local function SetupSupaUppercut(humanoid)
    SupaUppercutAnimConnection = humanoid.AnimationPlayed:Connect(function(track)
        if track.Animation and track.Animation.AnimationId == SupaUppercutAnimId and not SupaUppercutActive then
            SupaUppercutActive = true
            SupaUppercutJump()
            task.delay(1, function()
                SupaUppercutDash()
                task.delay(0.26, function()
                    SupaUppercutTurn()
                    SupaUppercutStopJump()
                    SupaUppercutActive = false
                end)
            end)
        end
    end)
end

local function InitSupaUppercut()
    SetupSupaUppercut((LocalPlayerGame.Character or LocalPlayerGame.CharacterAdded:Wait()):WaitForChild("Humanoid"))
end

Tabs.Tech:Toggle({
    Title = "Auto Supa Uppercut",
    Value = false,
    Callback = function(state)
        if state then
            InitSupaUppercut()
            SupaUppercutCharConnection = LocalPlayerGame.CharacterAdded:Connect(InitSupaUppercut)
        else
            if SupaUppercutAnimConnection then
                SupaUppercutAnimConnection:Disconnect()
                SupaUppercutAnimConnection = nil
            end
            if SupaUppercutCharConnection then
                SupaUppercutCharConnection:Disconnect()
                SupaUppercutCharConnection = nil
            end
        end
    end
})

local FlowingGraspAnimId = "rbxassetid://12273188754"
local FlowingGraspConnection = nil
local FlowingGraspEnabled = false

Tabs.Tech:Toggle({
    Title = "Flowing + Grasp",
    Value = false,
    Callback = function(state)
        FlowingGraspEnabled = state
        if FlowingGraspConnection then
            FlowingGraspConnection:Disconnect()
            FlowingGraspConnection = nil
        end
        
        if FlowingGraspEnabled then
            local isAnimating = false
            local hasFired = false
            
            FlowingGraspConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local char = LocalPlayerGame.Character
                if not char then return end
                
                local humanoid = char:FindFirstChild("Humanoid")
                local rootPart = char:FindFirstChild("HumanoidRootPart")
                if not (humanoid and rootPart) then return end
                
                local foundAnim = false
                for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                    if track.Animation and track.Animation.AnimationId == FlowingGraspAnimId then
                        foundAnim = true
                        break
                    end
                end
                
                if foundAnim and not (isAnimating or hasFired) then
                    isAnimating = true
                    hasFired = true
                    
                    task.delay(1.8, function()
                        local targetCFrame = rootPart.CFrame + rootPart.CFrame.LookVector * 24
                        local tween = TweenService:Create(rootPart, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = targetCFrame})
                        tween:Play()
                        tween.Completed:Wait()
                        
                        local graspTool = LocalPlayerGame.Backpack:FindFirstChild("Hunter's Grasp")
                        local communicate = char:FindFirstChild("Communicate")
                        if graspTool and communicate then
                            communicate:FireServer(unpack({{Tool = graspTool, Goal = "Console Move"}}))
                        end
                        
                        isAnimating = false
                    end)
                elseif not foundAnim then
                    hasFired = false
                end
            end)
        end
    end
})

local UpperGraspAnimId = "rbxassetid://10503381238"
local UpperGraspOffset = Vector3.new(0, 8, 0)
local UpperGraspEnabled = false
local UpperGraspConnection = nil

Tabs.Tech:Toggle({
    Title = "Upper + Grasp",
    Value = false,
    Callback = function(state)
        UpperGraspEnabled = state
        if UpperGraspConnection then
            UpperGraspConnection:Disconnect()
            UpperGraspConnection = nil
        end
        
        if UpperGraspEnabled then
            local isAnimating = false
            local hasFired = false
            local onCooldown = false
            
            UpperGraspConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local char = LocalPlayerGame.Character
                local rootPart = char and char:FindFirstChild("HumanoidRootPart")
                local humanoid = char and char:FindFirstChild("Humanoid")
                
                if not (char and rootPart and humanoid) then return end
                
                local foundAnim = false
                for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                    if track.Animation and track.Animation.AnimationId == UpperGraspAnimId then
                        foundAnim = true
                        break
                    end
                end
                
                if foundAnim and not (isAnimating or hasFired or onCooldown) then
                    isAnimating = true
                    hasFired = true
                    onCooldown = true
                    
                    task.delay(0.18, function()
                        local closestTorso = nil
                        local closestDist = 7
                        local liveFolder = workspace:FindFirstChild("Live")
                        
                        if liveFolder then
                            for _, model in ipairs(liveFolder:GetChildren()) do
                                if model:IsA("Model") and model ~= char then
                                    local torso = model:FindFirstChild("Torso") or model:FindFirstChild("UpperTorso")
                                    if torso then
                                        local dist = (rootPart.Position - torso.Position).Magnitude
                                        if dist <= closestDist then
                                            closestDist = dist
                                            closestTorso = torso
                                        end
                                    end
                                end
                            end
                        end
                        
                        if closestTorso then
                            local targetPos = closestTorso.Position + UpperGraspOffset
                            local tween = TweenService:Create(rootPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {CFrame = 
                            CFrame.new(targetPos)})
                            tween:Play()
                            tween.Completed:Wait()
                        end
                        
                        local graspTool = LocalPlayerGame.Backpack:FindFirstChild("Hunter's Grasp")
                        local communicate = char:FindFirstChild("Communicate")
                        if graspTool and communicate then
                            communicate:FireServer(unpack({{Tool = graspTool, Goal = "Console Move"}}))
                        end
                        
                        isAnimating = false
                        task.delay(15, function()
                            onCooldown = false
                        end)
                    end)
                elseif not foundAnim then
                    hasFired = false
                end
            end)
        end
    end
})

Tabs.Lag:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/mdJKdwbKjE")
    end
})

Tabs.Lag:Section({Title = "Anti Lag", Icon = "heart"})

Tabs.Lag:Button({
    Title = "Destroy Spawned Stones (By ItsLouisPlayz)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/ItsLouisPlayz-Scripts/main/TSB%20Anti%20Lag.lua"))()
    end
})

Tabs.Lag:Toggle({
    Title = "Low Graphics",
    Value = false,
    Callback = function(state)
        if state then
            local gameInstance = game
            local workspaceInstance = gameInstance.Workspace
            local lighting = gameInstance.Lighting
            local terrain = workspaceInstance.Terrain
            
            sethiddenproperty(lighting, "Technology", 2)
            sethiddenproperty(terrain, "Decoration", false)
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 0
            lighting.GlobalShadows = 0
            lighting.FogEnd = 9000000000
            lighting.Brightness = 0
            settings().Rendering.QualityLevel = "Level01"
            
            local removeTextures = true
            
            for _, descendant in pairs(workspaceInstance:GetDescendants()) do
                if descendant:IsA("BasePart") and not descendant:IsA("MeshPart") then
                    descendant.Material = "Plastic"
                    descendant.Reflectance = 0
                elseif (descendant:IsA("Decal") or descendant:IsA("Texture")) and removeTextures then
                    descendant.Transparency = 1
                elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
                    descendant.Lifetime = NumberRange.new(0)
                elseif descendant:IsA("Explosion") then
                    descendant.BlastPressure = 1
                    descendant.BlastRadius = 1
                elseif descendant:IsA("Fire") or descendant:IsA("SpotLight") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then
                    descendant.Enabled = false
                elseif descendant:IsA("MeshPart") and removeTextures then
                    descendant.Material = "Plastic"
                    descendant.Reflectance = 0
                    descendant.TextureID = 1.0385902758728956e16
                elseif descendant:IsA("SpecialMesh") and removeTextures then
                    descendant.TextureId = 0
                elseif descendant:IsA("ShirtGraphic") and removeTextures then
                    descendant.Graphic = 0
                elseif (descendant:IsA("Shirt") or descendant:IsA("Pants")) and removeTextures then
                    descendant[descendant.ClassName .. "Template"] = 0
                end
            end
            
            for _, effect in pairs(lighting:GetChildren()) do
                if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("DepthOfFieldEffect") then
                    effect.Enabled = false
                end
            end
            
            workspaceInstance.DescendantAdded:Connect(function(descendant)
                task.wait()
                if descendant:IsA("BasePart") and not descendant:IsA("MeshPart") then
                    descendant.Material = "Plastic"
                    descendant.Reflectance = 0
                elseif descendant:IsA("Decal") or descendant:IsA("Texture") and removeTextures then
                    descendant.Transparency = 1
                elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
                    descendant.Lifetime = NumberRange.new(0)
                elseif descendant:IsA("Explosion") then
                    descendant.BlastPressure = 1
                    descendant.BlastRadius = 1
                elseif descendant:IsA("Fire") or descendant:IsA("SpotLight") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then
                    descendant.Enabled = false
                elseif descendant:IsA("MeshPart") and removeTextures then
                    descendant.Material = "Plastic"
                    descendant.Reflectance = 0
                    descendant.TextureID = 1.0385902758728956e16
                elseif descendant:IsA("SpecialMesh") and removeTextures then
                    descendant.TextureId = 0
                elseif descendant:IsA("ShirtGraphic") and removeTextures then
                    descendant.Graphic = 0
                elseif (descendant:IsA("Shirt") or descendant:IsA("Pants")) and removeTextures then
                    descendant[descendant.ClassName .. "Template"] = 0
                end
            end)
        end
    end
})

Tabs.Lag:Section({Title = "Hide Parts", Icon = "package"})

local MapFolder = workspace:FindFirstChild("Map")
if MapFolder then
    local HiddenParts = {}
    
    local function ToggleMapPart(partName, visible)
        local part = MapFolder:FindFirstChild(partName)
        if visible then
            if not part and HiddenParts[partName] then
                HiddenParts[partName].Parent = MapFolder
            end
        elseif part then
            HiddenParts[partName] = part
            part.Parent = nil
        end
    end
    
    Tabs.Lag:Toggle({Title = "Trees", Value = true, Callback = function(state)
        ToggleMapPart("Trees", state)
    end})
    
    Tabs.Lag:Toggle({Title = "Walls", Value = true, Callback = function(state)
        ToggleMapPart("Walls", state)
    end})
    
    Tabs.Lag:Toggle({Title = "Grass", Value = true, Callback = function(state)
        ToggleMapPart("Grass", state)
        ToggleMapPart("GrassBottom", state)
    end})
    
    Tabs.Lag:Toggle({Title = "Benches", Value = true, Callback = function(state)
        ToggleMapPart("Benchs", state)
    end})
    
    ToggleMapPart("Trees", true)
    ToggleMapPart("Walls", true)
    ToggleMapPart("Grass", true)
    ToggleMapPart("GrassBottom", true)
    ToggleMapPart("Benches", true)
end

Tabs.Anim:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/mdJKdwbKjE")
    end
})

Tabs.Anim:Section({Title = "Play/Stop", Icon = "eye"})

Tabs.Anim:Input({
    Title = "Play Animation",
    Desc = "Use Anim Ids To Play Anim",
    Value = tostring(hungerThreshold),
    Placeholder = "Anim Id Here",
    Numeric = true,
    Callback = function(animId)
        local function PlayAnimation(character, id)
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. id
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
                animator:LoadAnimation(anim):Play()
            end
        end
        
        if tonumber(animId) then
            PlayAnimation(CharacterGame, animId)
        end
    end
})

local NoAnimConnection = nil
local NoAnimDeathConnection = nil

local function SetupNoAnimation()
    local humanoid = CharacterGame:WaitForChild("Humanoid")
    local allowedAnimId = "136370737633649"
    
    local function StopOtherAnims(track)
        if track.Animation.AnimationId:match("%d+") ~= allowedAnimId then
            track:Stop()
        end
    end
    
    if NoAnimConnection then
        NoAnimConnection:Disconnect()
    end
    NoAnimConnection = humanoid.AnimationPlayed:Connect(StopOtherAnims)
    
    if NoAnimDeathConnection then
        NoAnimDeathConnection:Disconnect()
    end
    NoAnimDeathConnection = humanoid.Died:Connect(function()
        SetupNoAnimation()
    end)
end

Tabs.Anim:Toggle({
    Title = "No Animation",
    Value = false,
    Callback = function(state)
        if state then
            SetupNoAnimation()
        else
            if NoAnimConnection then
                NoAnimConnection:Disconnect()
            end
            if NoAnimDeathConnection then
                NoAnimDeathConnection:Disconnect()
            end
        end
    end
})

Tabs.Anim:Section({Title = "Characters", Icon = "user"})

local AnimationScripts = {
    {"KJ/Gojo/Dummy", "Special Animations", "https://pastefy.app/qfu9PA3v/raw"},
    {"Saitama", "Saitama Animations", "https://pastefy.app/77H3wRXO/raw"},
    {"Garou", "Garou Animations", "https://pastefy.app/VY6onISD/raw"},
    {"Genos", "Genos Animations", "https://pastefy.app/0EPn6woL/raw"},
    {"Sonic", "Sonic Animations", "https://pastefy.app/KaiJDJHg/raw"},
    {"MetalBat", "MetalBat Animations", "https://pastefy.app/mObEgCqc/raw"},
    {"Atomic Samurai", "Atomic Samurai Animations", "https://pastefy.app/9bllab1z/raw"},
    {"Tatsumaki", "Tatsumaki Animations", "https://pastefy.app/qhJrd1zw/raw"},
    {"Suiryu", "Suiryu Animations", "https://pastefy.app/AKyKbIt0/raw"}
}

for _, scriptData in ipairs(AnimationScripts) do
    Tabs.Anim:Button({
        Title = scriptData[2],
        Locked = false,
        Callback = function()
            loadstring(game:HttpGet(scriptData[3]))()
        end
    })
end

Tabs.Fight:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/mdJKdwbKjE")
    end
})

Tabs.Fight:Section({Title = "Farm", Icon = "map"})

Tabs.Fight:Button({
    Title = "TrashCan Kill Farmer",
    Locked = false,
    Callback = function()
        getgenv().Settings = {
            TargetHealth = 50,
            CharacterHeight = 8,
            ResetStreak = false,
            AntiDC = false
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/TrashCan-Farm"))()
    end
})

Tabs.Fight:Button({
    Title = "Auto Get Emotes",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/bqVKWKRG/raw"))()
    end
})

Tabs.Fight:Toggle({
    Title = "Auto Reset Streak",
    Value = false,
    Callback = function(state)
        getgenv().ResetStreak = state
        if state then
            local localPlayer = game:GetService("Players").LocalPlayer
            
            local function CheckStreak()
                if getgenv().ResetStreak then
                    local liveFolder = workspace:FindFirstChild("Live")
                    if liveFolder then
                        local charModel = liveFolder:FindFirstChild(localPlayer.Name)
                        if charModel then
                            if (charModel:GetAttribute("CurrentStreak") or 0) >= 9 then
                                local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")
                                if humanoid then
                                    humanoid.Health = 0
                                end
                            end
                        end
                    end
                end
            end
            
            task.spawn(function()
                while getgenv().ResetStreak do
                    CheckStreak()
                    task.wait(1)
                end
            end)
        else
            getgenv().ResetStreak = false
        end
    end
})

Tabs.Fight:Toggle({
    Title = "Auto Farm Lowest Health",
    Value = false,
    Callback = function(state)
        getgenv().AutoKillLowestHealthPlr = state
        getgenv().TeleportDistance = 5
        
        local myRootPart = nil
        
        local function UpdateRootPart()
            local char = Player.Character
            myRootPart = char and char:FindFirstChild("HumanoidRootPart")
            if not myRootPart then
                char.ChildAdded:Wait()
                myRootPart = char:WaitForChild("HumanoidRootPart")
            end
        end
        
        local function IsPlayer(model)
            return game.Players:GetPlayerFromCharacter(model) ~= nil
        end
        
        local function FindLowestHealthTarget()
            local targetRoot = nil
            
            for _, model in pairs(game.Workspace.Live:GetChildren()) do
                if IsPlayer(model) then
                    local humanoid = model:FindFirstChildOfClass("Humanoid")
                    local rootPart = model:FindFirstChild("HumanoidRootPart")
                    if humanoid and rootPart and model ~= Player.Character and humanoid.Health > 0 and humanoid.Health <= 35 then
                        targetRoot = rootPart
                    end
                end
            end
            
            return targetRoot
        end
        
        task.spawn(function()
            while getgenv().AutoKillLowestHealthPlr == true do
                pcall(function()
                    UpdateRootPart()
                    if myRootPart then
                        local target = FindLowestHealthTarget()
                        if target then
                            Player.Character:SetPrimaryPartCFrame(CFrame.new(target.Position - Vector3.new(0, target.Size.Y / 2, 0) - target.CFrame.LookVector * getgenv().TeleportDistance + Vector3.new(0, -6, 0), target.Position - Vector3.new(0, target.Size.Y / 2, 0)))
                            
                            if not (workspace.Live:FindFirstChild(target.Parent.Name):FindFirstChild("RagdollSim") or workspace.Live:FindFirstChild(target.Parent.Name):FindFirstChild("AbsoluteImmortal")) then
                                task.spawn(function()
                                    local clickArgs = {{Goal = "LeftClick", Mobile = true}}
                                    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(clickArgs))
                                    local releaseArgs = {{Goal = "LeftClickRelease", Mobile = true}}
                                    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(releaseArgs))
                                end)
                                
                                for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if tool:IsA("Tool") and tool.Name ~= "Prey's Peril" and tool.Name ~= "Split Second Counter" then
                                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(tool)
                                        tool:Activate()
                                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                                    end
                                end
                            end
                        else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(150, 705, 30)
                        end
                    end
                end)
                task.wait(0.015)
            end
        end)
        
        Player.CharacterAdded:Connect(function()
            task.wait(1.5)
            UpdateRootPart()
        end)
    end
})

Tabs.Fight:Toggle({
    Title = "Auto Farm Nearest",
    Value = false,
    Callback = function(state)
        getgenv().AutoKillNearestPlr = state
        getgenv().TeleportDistance = 5
        
        task.spawn(function()
            if getgenv().AutoKillNearestPlr == false then
                game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame = game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame * CFrame.new(0, 20, -20)
            end
        end)
        
        local myRootPart = nil
        
        local function UpdateRootPart()
            local char = Player.Character
            myRootPart = char and char:FindFirstChild("HumanoidRootPart")
            if not myRootPart then
                char.ChildAdded:Wait()
                myRootPart = char:WaitForChild("HumanoidRootPart")
            end
        end
        
        local function IsPlayer(model)
            return game.Players:GetPlayerFromCharacter(model) ~= nil
        end
        
        local function FindNearestTarget()
            local closestDist = math.huge
            local targetRoot = nil
            
            for _, model in pairs(game.Workspace.Live:GetChildren()) do
                if IsPlayer(model) then
                    local humanoid = model:FindFirstChildOfClass("Humanoid")
                    local rootPart = model:FindFirstChild("HumanoidRootPart")
                    if humanoid and rootPart and model ~= Player.Character and humanoid.Health > 0 then
                        local dist = (myRootPart.Position - rootPart.Position).magnitude
                        if dist < closestDist then
                            targetRoot = rootPart
                            closestDist = dist
                        end
                    end
                end
            end
            
            return targetRoot
        end
        
        task.spawn(function()
            while getgenv().AutoKillNearestPlr == true do
                pcall(function()
                    UpdateRootPart()
                    local target = myRootPart and FindNearestTarget()
                    if target then
                        Player.Character:SetPrimaryPartCFrame(CFrame.new(target.Position - Vector3.new(0, target.Size.Y / 2, 0) - target.CFrame.LookVector * getgenv().TeleportDistance + Vector3.new(0, -6, 0), target.Position - Vector3.new(0, target.Size.Y / 2, 0)))
                        
                        if not (workspace.Live:FindFirstChild(target.Parent.Name):FindFirstChild("RagdollSim") or workspace.Live:FindFirstChild(target.Parent.Name):FindFirstChild("AbsoluteImmortal")) then
                            task.spawn(function()
                                local clickArgs = {{Goal = "LeftClick", Mobile = true}}
                                game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(clickArgs))
                                local releaseArgs = {{Goal = "LeftClickRelease", Mobile = true}}
                                game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(releaseArgs))
                            end)
                            
                            for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if tool:IsA("Tool") and tool.Name ~= "Prey's Peril" and tool.Name ~= "Split Second Counter" then
                                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(tool)
                                    tool:Activate()
                                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                                end
                            end
                        end
                    end
                end)
                task.wait(0.015)
            end
        end)
        
        Player.CharacterAdded:Connect(function()
            task.wait(1.5)
            UpdateRootPart()
        end)
    end
})

Tabs.Fight:Toggle({
    Title = "Auto Give Kills",
    Value = false,
    Callback = function(state)
        getgenv().AutoGiveKills = state
        task.spawn(function()
            while getgenv().AutoGiveKills == true do
                pcall(function()
                    if workspace.Live[game.Players.LocalPlayer.Name]:FindFirstChild("Humanoid").MaxHealth ~= workspace.Live[game.Players.LocalPlayer.Name]:FindFirstChild("Humanoid").Health then
                        game.Players.LocalPlayer.Character.Humanoid.Health = 0
                    end
                end)
                task.wait(0.35)
            end
        end)
    end
})

Tabs.Fight:Section({Title = "Fighting", Icon = "sword"})

getgenv().CamKey = "Z"
getgenv().CharacterKey = "X"

local AimLockCam = false
local AimLockChar = false
local AimLockTarget = nil

local function FindNearestToCrosshair()
    local closestDist = math.huge
    local screenCenter = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
    local nearestRoot = nil
    
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game:GetService("Players").LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local rootPart = player.Character.HumanoidRootPart
                local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(rootPart.Position)
                if onScreen then
                    local dist = (screenCenter - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                    if dist < closestDist then
                        nearestRoot = rootPart
                        closestDist = dist
                    end
                end
            end
        end
    end
    
    return nearestRoot
end

local function UpdateAimLockTarget()
    if AimLockCam or AimLockChar then
        AimLockTarget = FindNearestToCrosshair()
    else
        AimLockTarget = nil
    end
end

game:GetService("RunService").Heartbeat:Connect(function()
    if AimLockTarget and AimLockTarget.Parent then
        local humanoid = AimLockTarget.Parent:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health > 0 then
            local myRoot = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myRoot then
                local predictedPos = AimLockTarget.Position + AimLockTarget.Velocity * 0.016
                if AimLockCam then
                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, predictedPos)
                end
                if AimLockChar then
                    myRoot.CFrame = CFrame.new(myRoot.Position, Vector3.new(predictedPos.X, myRoot.Position.Y, predictedPos.Z))
                end
            end
        else
            AimLockTarget = nil
        end
    end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if not processed then
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local keyName = input.KeyCode.Name
            if keyName == getgenv().CamKey then
                AimLockCam = not AimLockCam
                AimLockChar = false
                UpdateAimLockTarget()
            elseif keyName == getgenv().CharacterKey then
                AimLockChar = not AimLockChar
                AimLockCam = false
                UpdateAimLockTarget()
            end
        end
    end
end)

Tabs.Fight:Toggle({
    Title = "AimLock Cam",
    Value = false,
    Callback = function(state)
        AimLockCam = state
        AimLockChar = false
        UpdateAimLockTarget()
    end
})

Tabs.Fight:Toggle({
    Title = "AimLock Character",
    Value = false,
    Callback = function(state)
        AimLockChar = state
        AimLockCam = false
        UpdateAimLockTarget()
    end
})

Tabs.Fight:Toggle({
    Title = "M1 Click Reach",
    Value = false,
    Callback = function(state)
        getgenv().AutoTeleportPunching = state
        getgenv().DetectionDistance = 999999
        getgenv().TeleportDistance = 3
        
        local myRootPart = nil
        
        local function UpdateRootPart()
            local char = Player.Character
            myRootPart = char and char:FindFirstChild("HumanoidRootPart")
            if not myRootPart then
                char.ChildAdded:Wait()
                myRootPart = char:WaitForChild("HumanoidRootPart")
            end
        end
        
        local function FindNearestTarget()
            local closestDist = getgenv().DetectionDistance
            local targetRoot = nil
            
            for _, model in pairs(game.Workspace.Live:GetChildren()) do
                local humanoid = model:FindFirstChildOfClass("Humanoid")
                local rootPart = model:FindFirstChild("HumanoidRootPart")
                if humanoid and rootPart and model ~= Player.Character and humanoid.Health > 0 then
                    local dist = (myRootPart.Position - rootPart.Position).magnitude
                    if dist < closestDist then
                        targetRoot = rootPart
                        closestDist = dist
                    end
                end
            end
            
            return targetRoot
        end
        
        task.spawn(function()
            while getgenv().AutoTeleportPunching == true do
                pcall(function()
                    UpdateRootPart()
                    local isPunching = workspace.Live[game.Players.LocalPlayer.Name]:FindFirstChild("M1ing")
                    local target = isPunching and myRootPart and FindNearestTarget()
                    if target then
                        local targetPos = target.Position + -target.CFrame.LookVector * getgenv().TeleportDistance
                        Player.Character:SetPrimaryPartCFrame(CFrame.new(targetPos, targetPos + (target.Position - targetPos).unit))
                    end
                end)
                task.wait(0.015)
            end
        end)
        
        Player.CharacterAdded:Connect(function()
            task.wait(3)
            UpdateRootPart()
        end)
    end
})

local AutoHitEnabled = false
local AutoHitLocalPlayer = game:GetService("Players").LocalPlayer

local function RunAutoHit()
    task.spawn(function()
        while AutoHitEnabled do
            local myChar = AutoHitLocalPlayer.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if myRoot then
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= AutoHitLocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and (myRoot.Position - player.Character.HumanoidRootPart.Position).Magnitude < 10 then
                        AutoHitLocalPlayer.Character.Communicate:FireServer(unpack({{Goal = "LeftClick", Mobile = true}}))
                        task.wait(0.1)
                        AutoHitLocalPlayer.Character.Communicate:FireServer(unpack({{Goal = "LeftClickRelease", Mobile = true}}))
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end

Tabs.Fight:Toggle({
    Title = "Auto Hit",
    Value = false,
    Callback = function(state)
        AutoHitEnabled = state
        if state then
            RunAutoHit()
        end
    end
})

AutoHitLocalPlayer.CharacterAdded:Connect(function()
    if AutoHitEnabled then
        task.wait(1)
        RunAutoHit()
    end
end)

Tabs.Fight:Toggle({
    Title = "Auto Dodge Players",
    Value = false,
    Callback = function(state)
        getgenv().AutoDodging = state
        
        local dodgeAnimIds = {}
        local animCategories = {
            {NormalDash = {10479335397}, WeaponDash = {13380255751}},
            {NormalPunch = {10468665991}, ConsecutivePunches = {10466974800}, Shove = {10471336737}, Uppercut = {12510170988}},
            {FlowingWater = {12272894215}, LethalWhirlwindStream = {12296882427}, HunterGrasp = {12307656616}}
        }
        
        for _, category in pairs(animCategories) do
            for _, anims in pairs(category) do
                for _, animId in pairs(anims) do
                    table.insert(dodgeAnimIds, animId)
                end
            end
        end
        
        task.spawn(function()
            local connection
            connection = game:GetService("RunService").RenderStepped:Connect(function()
                if getgenv().AutoDodging ~= true then
                    connection:Disconnect()
                else
                    pcall(function()
                        for _, model in ipairs(workspace.Live:GetChildren()) do
                            if model:IsA("Model") and model:FindFirstChild("Head") and model.Head:IsA("Part") and model.Head.Name == "Head" and model.Head ~= game.Players.LocalPlayer.Character.Head and (model.Head.Position - game.Players.LocalPlayer.Character.Head.Position).magnitude <= 25 and model:FindFirstChildOfClass("Humanoid") and model:FindFirstChildOfClass("Humanoid").Health > 0 then
                                local isAttacking = false
                                
                                for _, track in pairs(model:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do
                                    if table.find(dodgeAnimIds, tonumber(track.Animation.AnimationId:match("%d+"))) then
                                        isAttacking = true
                                        break
                                    end
                                end
                                
                                if model:FindFirstChild("M1ing") or isAttacking then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(model.Head.Position + model.Head.CFrame.lookVector * -5 + Vector3.new(0, 0, 0), model.Head.Position)
                                end
                            end
                        end
                    end)
                end
            end)
        end)
    end
})

Tabs.Fight:Button({
    Title = "Easy Kill Player panel",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/7qmTI84P/raw"))()
    end
})

local StarterGui = game:GetService("StarterGui")
local PlayersService = game:GetService("Players")
local RunServiceFling = game:GetService("RunService")
local FlingLocalPlayer = PlayersService.LocalPlayer
local FlingCamera = workspace.CurrentCamera
local FlingCameraSubject = FlingCamera.CameraSubject

local SelectedPlayer = nil
local DeathNotifyConnection = nil
local OrbitConnection1 = nil
local OrbitConnection2 = nil
local EspConnection = nil
local FlingEspData = {}
local FlingEspEnabled = false

local FlingStates = {
    teleport = false,
    fling = false,
    view = false,
    aimLockCam = false,
    aimLockChar = false,
    orbit = false,
    notifyOnDeath = false
}

local function SendNotification(title, text, icon, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title or "VexonHub",
        Text = text,
        Icon = icon or "rbxassetid://84519376661277",
        Duration = duration or 5
    })
end

local function AimCameraAtPlayer(player)
    local head = player and player.Character and player.Character:FindFirstChild("Head")
    if head then
        FlingCamera.CFrame = CFrame.new(FlingCamera.CFrame.Position, head.Position)
    end
end

local function AimCharacterAtPlayer(player)
    local myRoot = FlingLocalPlayer.Character and FlingLocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local theirRoot = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if myRoot and theirRoot then
        myRoot.CFrame = CFrame.new(myRoot.Position, theirRoot.Position)
    end
end

local function SetupDeathNotification()
    if DeathNotifyConnection then
        DeathNotifyConnection:Disconnect()
        DeathNotifyConnection = nil
    end
    
    if FlingStates.notifyOnDeath and SelectedPlayer then
        local char = SelectedPlayer.Character or SelectedPlayer.CharacterAdded:Wait()
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            DeathNotifyConnection = humanoid.Died:Connect(function()
                SendNotification("VexonHub", SelectedPlayer.DisplayName .. " Died")
            end)
        end
    end
end

local function SelectPlayer(playerName)
    if DeathNotifyConnection then
        DeathNotifyConnection:Disconnect()
        DeathNotifyConnection = nil
    end
    
    SelectedPlayer = nil
    
    if not playerName or playerName == "" then
        SendNotification("VexonHub", "No One Selected")
        return
    end
    
    local lowerName = string.lower(playerName)
    local foundPlayer = nil
    
    for _, player in ipairs(PlayersService:GetPlayers()) do
        if string.find(string.lower(player.Name), lowerName, 1, true) or string.find(string.lower(player.DisplayName), lowerName, 1, true) then
            foundPlayer = player
            break
        end
    end
    
    if foundPlayer then
        SelectedPlayer = foundPlayer
        SendNotification("VexonHub", "Selected: " .. foundPlayer.DisplayName, "https://www.roblox.com/headshot-thumbnail/image?userId=" .. foundPlayer.UserId .. "&width=420&height=420&format=png", 10)
        SetupDeathNotification()
    else
        SendNotification("VexonHub", "Player Not Found...")
    end
end

function createEspForPlayer(player)
    local head = player.Character and player.Character:FindFirstChild("Head")
    if head then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_Billboard"
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.Adornee = head
        billboard.AlwaysOnTop = true
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = Color3.new(0.8, 0, 0)
        frame.BackgroundTransparency = 0.6
        frame.Parent = billboard
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = frame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Text = player.DisplayName
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 16
        label.Parent = frame
        
        FlingEspData[player] = {billboard = billboard}
        billboard.Parent = FlingLocalPlayer.PlayerGui
    end
end

function updateEspForPlayer(player)
    local data = FlingEspData[player]
    if data and data.billboard then
        local head = player.Character and player.Character:FindFirstChild("Head")
        if head and data.billboard.Adornee ~= head then
            data.billboard.Adornee = head
        end
    end
end

function removeEspForPlayer(player)
    if FlingEspData[player] then
        if FlingEspData[player].billboard then
            FlingEspData[player].billboard:Destroy()
        end
        FlingEspData[player] = nil
    end
end

function runEspLoop()
    for _, player in ipairs(PlayersService:GetPlayers()) do
        if player == FlingLocalPlayer or not player.Character or not player.Character:FindFirstChild("Head") then
            if FlingEspData[player] then
                removeEspForPlayer(player)
            end
        elseif FlingEspData[player] then
            updateEspForPlayer(player)
        else
            createEspForPlayer(player)
        end
    end
end

Tabs.Fling:Button({
    Title = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/mdJKdwbKjE")
        SendNotification("VexonHub", "Discord link copied to clipboard!")
    end
})

Tabs.Fling:Section({Title = "Player Selection", Icon = "eye"})

Tabs.Fling:Input({
    Title = "Select Player",
    Desc = "Enter Player Name To Select Target",
    Placeholder = "PlayerName",
    Callback = function(name)
        SelectPlayer(name)
    end
})

Tabs.Fling:Section({Title = "Player Actions"})

Tabs.Fling:Button({
    Title = "Teleport to Player",
    Callback = function()
        if SelectedPlayer then
            local myRoot = FlingLocalPlayer.Character and FlingLocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local theirRoot = SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myRoot and theirRoot then
                myRoot.CFrame = theirRoot.CFrame
            else
                SendNotification("VexonHub", "Could not find character to teleport.")
            end
        else
            SendNotification("VexonHub", "No One Selected")
        end
    end
})

Tabs.Fling:Toggle({
    Title = "Loop Teleport",
    Value = FlingStates.teleport,
    Callback = function(state)
        FlingStates.teleport = state
        if state then
            if SelectedPlayer then
                task.spawn(function()
                    while FlingStates.teleport and SelectedPlayer and SelectedPlayer.Parent do
                        local myRoot = FlingLocalPlayer.Character and FlingLocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local theirRoot = SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if not (myRoot and theirRoot) then
                            FlingStates.teleport = false
                            break
                        end
                        myRoot.CFrame = theirRoot.CFrame
                        task.wait()
                    end
                end)
            else
                SendNotification("VexonHub", "No One Selected")
                FlingStates.teleport = false
            end
        end
    end
})

Tabs.Fling:Button({
    Title = "Fling Player",
    Callback = function()
        if SelectedPlayer then
            miniFling(SelectedPlayer)
        else
            SendNotification("VexonHub", "No One Selected")
        end
    end
})

Tabs.Fling:Toggle({
    Title = "Loop Fling",
    Value = FlingStates.fling,
    Callback = function(state)
        FlingStates.fling = state
        if state then
            if SelectedPlayer then
                task.spawn(function()
                    while FlingStates.fling and SelectedPlayer and SelectedPlayer.Parent do
                        miniFling(SelectedPlayer)
                        task.wait(0.5)
                    end
                end)
            else
                SendNotification("VexonHub", "No One Selected")
                FlingStates.fling = false
            end
        end
    end
})

Tabs.Fling:Button({
    Title = "View Player (3 sec)",
    Callback = function()
        if SelectedPlayer then
            local targetHumanoid = SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChildOfClass("Humanoid")
            if targetHumanoid then
                FlingCamera.CameraSubject = targetHumanoid
                task.delay(3, function()
                    if FlingCamera.CameraSubject == targetHumanoid then
                        FlingCamera.CameraSubject = FlingCameraSubject
                    end
                end)
            else
                SendNotification("VexonHub", "Could not find the player's character to view.")
            end
        else
            SendNotification("VexonHub", "No One Selected")
        end
    end
})

Tabs.Fling:Toggle({
    Title = "Loop View",
    Value = FlingStates.view,
    Callback = function(state)
        FlingStates.view = state
        if state then
            if SelectedPlayer then
                task.spawn(function()
                    while FlingStates.view and SelectedPlayer and SelectedPlayer.Parent do
                        local targetHumanoid = SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if targetHumanoid then
                            FlingCamera.CameraSubject = targetHumanoid
                        end
                        task.wait(0.1)
                    end
                    FlingCamera.CameraSubject = FlingCameraSubject
                end)
            else
                SendNotification("VexonHub", "No One Selected")
                FlingStates.view = false
            end
        else
            FlingCamera.CameraSubject = FlingCameraSubject
        end
    end
})

Tabs.Fling:Toggle({
    Title = "AimLock (Camera)",
    Value = FlingStates.aimLockCam,
    Callback = function(state)
        FlingStates.aimLockCam = state
        if state then
            if SelectedPlayer then
                task.spawn(function()
                    while FlingStates.aimLockCam and SelectedPlayer and SelectedPlayer.Parent do
                        AimCameraAtPlayer(SelectedPlayer)
                        RunServiceFling.RenderStepped:Wait()
                    end
                end)
            else
                SendNotification("VexonHub", "No One Selected")
                FlingStates.aimLockCam = false
            end
        end
    end
})

Tabs.Fling:Toggle({
    Title = "AimLock (Character)",
    Value = FlingStates.aimLockChar,
    Callback = function(state)
        FlingStates.aimLockChar = state
        if state then
            if SelectedPlayer then
                task.spawn(function()
                    while FlingStates.aimLockChar and SelectedPlayer and SelectedPlayer.Parent do
                        AimCharacterAtPlayer(SelectedPlayer)
                        RunServiceFling.Heartbeat:Wait()
                    end
                end)
            else
                SendNotification("VexonHub", "No One Selected")
                FlingStates.aimLockChar = false
            end
        end
    end
})

Tabs.Fling:Toggle({
    Title = "ESP",
    Value = FlingEspEnabled,
    Callback = function(state)
        FlingEspEnabled = state
        if FlingEspEnabled then
            if not EspConnection then
                EspConnection = RunServiceFling.RenderStepped:Connect(runEspLoop)
            end
        else
            if EspConnection then
                EspConnection:Disconnect()
                EspConnection = nil
            end
            for player, _ in pairs(FlingEspData) do
                removeEspForPlayer(player)
            end
            table.clear(FlingEspData)
        end
    end
})

Tabs.Fling:Toggle({
    Title = "Orbit Player",
    Value = FlingStates.orbit,
    Callback = function(state)
        FlingStates.orbit = state
        
        if OrbitConnection1 then
            OrbitConnection1:Disconnect()
            OrbitConnection1 = nil
        end
        if OrbitConnection2 then
            OrbitConnection2:Disconnect()
            OrbitConnection2 = nil
        end
        
        if state then
            if SelectedPlayer then
                task.spawn(function()
                    local angle = 0
                    local speed = 8
                    local distance = 10
                    
                    OrbitConnection1 = RunServiceFling.Heartbeat:Connect(function()
                        if FlingStates.orbit and SelectedPlayer and SelectedPlayer.Parent then
                            local myRoot = FlingLocalPlayer.Character and FlingLocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            local theirRoot = SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if myRoot and theirRoot then
                                angle = angle + speed
                                myRoot.CFrame = CFrame.new(theirRoot.Position) * CFrame.Angles(0, math.rad(angle), 0) * CFrame.new(distance, 0, 0)
                            else
                                FlingStates.orbit = false
                            end
                        else
                            if OrbitConnection1 then OrbitConnection1:Disconnect() OrbitConnection1 = nil end
                            if OrbitConnection2 then OrbitConnection2:Disconnect() OrbitConnection2 = nil end
                        end
                    end)
                    
                    OrbitConnection2 = RunServiceFling.RenderStepped:Connect(function()
                        if FlingStates.orbit and SelectedPlayer and SelectedPlayer.Parent then
                            local myRoot = FlingLocalPlayer.Character and FlingLocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            local theirRoot = SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if myRoot and theirRoot then
                                myRoot.CFrame = CFrame.new(myRoot.Position, theirRoot.Position)
                            else
                                FlingStates.orbit = false
                            end
                        else
                            if OrbitConnection1 then OrbitConnection1:Disconnect() OrbitConnection1 = nil end
                            if OrbitConnection2 then OrbitConnection2:Disconnect() OrbitConnection2 = nil end
                        end
                    end)
                end)
            else
                SendNotification("VexonHub", "No One Selected")
                FlingStates.orbit = false
            end
        end
    end
})

Tabs.Fling:Toggle({
    Title = "Notify On Death",
    Value = FlingStates.notifyOnDeath,
    Callback = function(state)
        FlingStates.notifyOnDeath = state
        SetupDeathNotification()
    end
})

PlayersService.PlayerRemoving:Connect(function(player)
    if SelectedPlayer and player == SelectedPlayer then
        SendNotification("VexonHub", player.DisplayName .. " left the game")
        SelectedPlayer = nil
        for key, _ in pairs(FlingStates) do
            FlingStates[key] = false
        end
    end
    removeEspForPlayer(player)
end)

Tabs.Fling:Section({Title = "Fling", Icon = "utensils"})

local FlingAuraPlayer = game.Players.LocalPlayer
local FlingAuraEnabled = false

Tabs.Fling:Toggle({
    Title = "Fling Aura",
    Value = false,
    Callback = function(state)
        FlingAuraEnabled = state
        if state then
            task.spawn(function()
                while FlingAuraEnabled do
                    if FlingAuraPlayer.Character and FlingAuraPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        for _, player in pairs(game.Players:GetPlayers()) do
                            if player ~= FlingAuraPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local theirRoot = player.Character.HumanoidRootPart
                                if (FlingAuraPlayer.Character.HumanoidRootPart.Position - theirRoot.Position).Magnitude <= 15 then
                                    pcall(function()
                                        miniFling(player)
                                    end)
                                end
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

FlingAuraPlayer.CharacterAdded:Connect(function()
    FlingAuraEnabled = false
end)

local ClickFlingPlayers = game:GetService("Players")
local ClickFlingUIS = game:GetService("UserInputService")
local ClickFlingLocalPlayer = ClickFlingPlayers.LocalPlayer
local ClickFlingMouse = ClickFlingLocalPlayer:GetMouse()
local ClickFlingCamera = workspace.CurrentCamera
local ClickFlingEnabled = false

Tabs.Fling:Toggle({
    Title = "Click Fling",
    Value = false,
    Callback = function(state)
        ClickFlingEnabled = state
    end
})

local function GetPlayerFromPart(part)
    if part and part.Parent and part.Parent:IsA("Model") then
        return ClickFlingPlayers:GetPlayerFromCharacter(part.Parent)
    end
    return nil
end

ClickFlingMouse.Button1Down:Connect(function()
    if ClickFlingEnabled then
        local player = GetPlayerFromPart(ClickFlingMouse.Target)
        if player and player ~= ClickFlingLocalPlayer then
            miniFling(player)
        end
    end
end)

ClickFlingUIS.TouchTap:Connect(function(touchPositions, processed)
    if ClickFlingEnabled and not processed then
        local touchPos = touchPositions[1]
        local camPos = ClickFlingCamera.CFrame.Position
        local direction = ClickFlingCamera:ViewportPointToRay(touchPos.X, touchPos.Y).Direction * 500
        
        local rayParams = RaycastParams.new()
        rayParams.FilterDescendantsInstances = {ClickFlingLocalPlayer.Character}
        rayParams.FilterType = Enum.RaycastFilterType.Blacklist
        
        local result = workspace:Raycast(camPos, direction, rayParams)
        local player = GetPlayerFromPart(result and result.Instance)
        if player and player ~= ClickFlingLocalPlayer then
            miniFling(player)
        end
    end
end)

local FlingAllEnabled = false
local FlingAllPlayers = game:GetService("Players")
local FlingAllLocalPlayer = FlingAllPlayers.LocalPlayer
local FlingAllRootPart = (FlingAllLocalPlayer.Character or FlingAllLocalPlayer.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
local FlingAllSavedCFrame = FlingAllRootPart and FlingAllRootPart.CFrame

Tabs.Fling:Toggle({
    Title = "Fling All (Buggy?)",
    Value = false,
    Callback = function(state)
        FlingAllEnabled = state
        if state then
            task.spawn(function()
                while FlingAllEnabled do
                    for _, player in pairs(FlingAllPlayers:GetPlayers()) do
                        if player ~= FlingAllLocalPlayer then
                            miniFling(player)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        elseif FlingAllSavedCFrame and FlingAllRootPart then
            FlingAllRootPart.CFrame = FlingAllSavedCFrame
        end
    end
})

local TouchFlingEnabled
if game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
    TouchFlingEnabled = false
else
    local marker = Instance.new("Decal")
    marker.Name = "juisdfj0i32i0eidsuf0iok"
    marker.Parent = game:GetService("ReplicatedStorage")
    TouchFlingEnabled = false
end

local function RunTouchFling()
    local character = nil
    local rootPart = nil
    local toggle = 0.1
    
    while TouchFlingEnabled do
        game:GetService("RunService").Heartbeat:Wait()
        local localPlayer = game.Players.LocalPlayer
        
        while TouchFlingEnabled and not (character and character.Parent and rootPart and rootPart.Parent) do
            game:GetService("RunService").Heartbeat:Wait()
            character = localPlayer.Character
            rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
        end
        
        if TouchFlingEnabled then
            local velocity = rootPart.Velocity
            rootPart.Velocity = velocity * 10000 + Vector3.new(0, 10000, 0)
            game:GetService("RunService").RenderStepped:Wait()
            
            if character and character.Parent and rootPart and rootPart.Parent then
                rootPart.Velocity = velocity
            end
            
            game:GetService("RunService").Stepped:Wait()
            
            if character and character.Parent and rootPart and rootPart.Parent then
                rootPart.Velocity = velocity + Vector3.new(0, toggle, 0)
                toggle = toggle * -1
            end
        end
    end
end

Tabs.Fling:Toggle({
    Title = "Touch Fling",
    Value = false,
    Callback = function(state)
        if state then
            TouchFlingEnabled = true
            coroutine.wrap(RunTouchFling)()
        else
            TouchFlingEnabled = false
        end
    end
})

local AntiFlingEnabled = false
local AntiFlingConnections = {}

local function DisableCollision(player)
    if AntiFlingEnabled and player.Character then
        for _, descendant in pairs(player.Character:GetDescendants()) do
            if descendant:IsA("BasePart") and descendant.CanCollide then
                descendant.CanCollide = false
            end
        end
    end
end

local function ReEnableCollisions()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            for _, descendant in pairs(player.Character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.CanCollide = true
                end
            end
        end
    end
end

local function SetupAntiFling()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local conn = game:GetService("RunService").Stepped:Connect(function()
                DisableCollision(player)
            end)
            table.insert(AntiFlingConnections, conn)
        end
    end
    
    game.Players.PlayerAdded:Connect(function(player)
        if player ~= game.Players.LocalPlayer then
            local conn = game:GetService("RunService").Stepped:Connect(function()
                DisableCollision(player)
            end)
            table.insert(AntiFlingConnections, conn)
        end
    end)
end

local function CleanupAntiFling()
    for _, conn in pairs(AntiFlingConnections) do
        conn:Disconnect()
    end
    table.clear(AntiFlingConnections)
    ReEnableCollisions()
end

Tabs.Fling:Toggle({
    Title = "Anti Fling",
    Value = false,
    Callback = function(state)
        AntiFlingEnabled = state
        if state then
            SetupAntiFling()
        else
            CleanupAntiFling()
        end
    end
})

local CustomFlingPower = 1000

local CustomTouchFlingEnabled
if game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
    CustomTouchFlingEnabled = false
else
    local marker = Instance.new("Decal")
    marker.Name = "juisdfj0i32i0eidsuf0iok"
    marker.Parent = game:GetService("ReplicatedStorage")
    CustomTouchFlingEnabled = false
end

local function RunCustomTouchFling()
    local character = nil
    local rootPart = nil
    local toggle = 0.1
    
    while CustomTouchFlingEnabled do
        game:GetService("RunService").Heartbeat:Wait()
        local localPlayer = game.Players.LocalPlayer
        
        while CustomTouchFlingEnabled and not (character and character.Parent and rootPart and rootPart.Parent) do
            game:GetService("RunService").Heartbeat:Wait()
            character = localPlayer.Character
            rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
        end
        
        if CustomTouchFlingEnabled then
            local velocity = rootPart.Velocity
            rootPart.Velocity = velocity * CustomFlingPower + Vector3.new(0, 100, 0)
            game:GetService("RunService").RenderStepped:Wait()
            
            if character and character.Parent and rootPart and rootPart.Parent then
                rootPart.Velocity = velocity
            end
            
            game:GetService("RunService").Stepped:Wait()
            
            if character and character.Parent and rootPart and rootPart.Parent then
                rootPart.Velocity = velocity + Vector3.new(0, toggle, 0)
                toggle = toggle * -1
            end
        end
    end
end

Tabs.Fling:Toggle({
    Title = "Costum Touch Fling Power",
    Value = false,
    Callback = function(state)
        if state then
            CustomTouchFlingEnabled = true
            coroutine.wrap(RunCustomTouchFling)()
        else
            CustomTouchFlingEnabled = false
        end
    end
})

Tabs.Fling:Slider({
    Title = "Fling Power Value",
    Value = {Min = 1, Max = 10000, Default = 100},
    Callback = function(value)
        CustomFlingPower = value
    end
})

Tabs.Place:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/mdJKdwbKjE")
    end
})

Tabs.Place:Section({Title = "TP Stuff", Icon = "eye"})

Tabs.Place:Button({Title = "Teleport Panel", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/uiTL0dfO/raw"))()
end})

Tabs.Place:Button({Title = "TP Frozen Lock", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/yxXqDjA2/raw"))()
end})

Tabs.Place:Button({Title = "TP Dummy", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/oJwPZY4a/raw"))()
end})

Tabs.Place:Section({Title = "Teleport Places", Icon = "map"})

local TeleportLocations = {
    {"Middle Of Map", 139, 440, 32},
    {"Prison", 438, 439, -376},
    {"Montain", 155, 628, -447},
    {"Door 1", 17, 440, -301},
    {"Door 2", 290, 440, 361},
    {"Corner 1", 29, 442, 488},
    {"Corner 2", -261, 442, -248},
    {"Corner 3", 263, 442, -456},
    {"Corner 4", 566, 442, 274},
    {"Counter", -68, 29, 20346},
    {"Counter Up", -78, 84, 20354},
    {"Atomic Base", 1063, 30, 23006},
    {"Atomic Base Up", 1063, 405, 23006},
    {"Atomic Slash", 1063, 131, 23006},
    {"Atomic Slash Up", 1063, 190, 23006},
    {"Little SafeZone", 150, 505, 30},
    {"Big SafeZone", 150, 705, 30},
    {"Void", 150, -495, 30},
    {"Darkness", 0, 900000000005, 0},
    {"Smoke", 0, -1, 0},
    {"Pixel", 30000000, 30000000, 30000000}
}

for _, locationData in ipairs(TeleportLocations) do
    Tabs.Place:Button({
        Title = locationData[1],
        Locked = false,
        Callback = function()
            local localPlayer = game.Players.LocalPlayer
            if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(locationData[2], locationData[3], locationData[4])
            end
        end
    })
end

Tabs.Moveset:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/mdJKdwbKjE")
    end
})

Tabs.Moveset:Section({Title = "Characther Movesets", Icon = "box"})

local MovesetScripts = {
    {"The Garbage Ghost (Universal)", "https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/TheGarbageGhost"},
    {"Trash-Can Man (Universal)", "https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man"},
    {"StarGlicher (Universal)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/SG_DEMO.lua"},
    {"JK (Saitama)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-JK-Moveset-24889"},
    {"Kenjihin (Saitama)", "https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Tp%20exploit%20saitama%20to%20jun"},
    {"Gojo 1 (Saitama)", "https://raw.githubusercontent.com/Nova2ezz/jjs-gojo-/refs/heads/main/SaitamaToGojoV3_SOURCE-obfuscated_2.txt"},
    {"Mahito (Saitama)", "https://raw.githubusercontent.com/dendendenver1/mahitotsbthing/refs/heads/main/main.lua"},
    {"Yuji/Sukuna (Saitama)", "https://pastebin.com/raw/1yaXL0rA"},
    {"Ichigo Kurosaki (Saitama)", "https://raw.githubusercontent.com/grest0n/CustomMovesets/refs/heads/main/Ichigo%20Kurosaki"},
    {"JJS Gojo (Saitama)", "https://gist.githubusercontent.com/JcBoomin/a63e9ac3e90cef03ecf37e997fd21632/raw/98b567b81f61bb30042e0078b78f3fb24685fb8d/Gojo"},
    {"Hakari (Saitama)", "https://raw.githubusercontent.com/dendendenver1/HakariTSB/refs/heads/main/HakariTSB.lua"},
    {"KJ (Garou)", "https://rawscripts.net/raw/KJ-The-Strongest-Battlegrounds-Garou-to-kj-27085"},
    {"Chainsaw Man (Garou)", "https://gist.githubusercontent.com/GoldenHeads2/0fd8d36993c850f3fac89e5adf793076/raw/ab4f5a42bd0b2e24a32a46301d533ea849ca771c/gistfile1.txt"},
    {"Okarun (Garou)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Garou-to-OKARUN-24065"},
    {"Sukuna (Garou)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Garou-to-Sukuna-24081"},
    {"Gojo (Garou)", "https://pastebin.com/raw/3Cz8kF8M"},
    {"Cyber Psycho (Garou)", "https://pastebin.com/raw/7V1mUBtQ"},
    {"Suriyu (Garou)", "https://rawscripts.net/raw/he-Strongest-Battlegrounds-Garou-to-Suiryu-script-18098"},
    {"Goku V2 (Garou)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Goku-Moveset-V2-17977"},
    {"Toji (Atomic Samurai)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Toji-moveset-for-Atomic-Samurai-22498"},
    {"Toji 2 (Atomic Samurai)", "https://paste.ee/r/0uIxM"},
    {"Sukuna (Atomic Samurai)", "https://pastebin.com/raw/gUrBYsGK"},
    {"Toji (Sonic)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Toji-moveset-21449"},
    {"Voltra (Sonic)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VOLTA.lua"}
}

for _, scriptData in ipairs(MovesetScripts) do
    Tabs.Moveset:Button({
        Title = scriptData[1],
        Locked = false,
        Callback = function()
            loadstring(game:HttpGet(scriptData[2], true))()
        end
    })
end

Tabs.Moveset:Button({
    Title = "Gojo 2 (Saitama)",
    Locked = false,
    Callback = function()
        getgenv().morph = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/refs/heads/main/LatestV2.lua"))()
    end
})

Tabs.Moveset:Button({
    Title = "Gojo 3 (Saitama)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/3Cz8kF8M", true))()
    end
})

Tabs.Moveset:Button({
    Title = "Arcaura (Garou)",
    Locked = false,
    Callback = function()
        getgenv().OptimizeUltimate = false
        getgenv().ReduceUltFlash = true
        getgenv().Move1Insta = false
        getgenv().LowQualityMode = true
        getgenv().BetaConsole = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/ARCAURA.lua"))()
    end
})

Tabs.Moveset:Button({
    Title = "Minos Prime (Garou)",
    Locked = false,
    Callback = function()
        _G.SkipIntro = true
        _G.Night = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/S1gmaGuy/MinosPrimeFixed/refs/heads/main/ThefixIsSoSigma"))()
    end
})

Tabs.Moveset:Button({
    Title = "APOPHENIA (Metal Bat)",
    Locked = false,
    Callback = function()
        getgenv().Music = false
        getgenv().AttackQuality = "High"
        getgenv().ConstantSpeed = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/main/APOPHENIA.lua"))()
    end
})

Info = Tabs.Info

if not ui then
    ui = {}
end
if not ui.Creator then
    ui.Creator = {}
end

function ui.Creator.Request(requestData)
    local HttpService = game:GetService("HttpService")
    
    local success, result = pcall(function()
        if not HttpService.RequestAsync then
            return {
                Body = HttpService:GetAsync(requestData.Url),
                StatusCode = 200,
                Success = true
            }
        end
        
        local response = HttpService:RequestAsync({
            Url = requestData.Url,
            Method = requestData.Method or "GET",
            Headers = requestData.Headers or {}
        })
        
        return {
            Body = response.Body,
            StatusCode = response.StatusCode,
            Success = response.Success
        }
    end)
    
    if success then
        return result
    end
    
    error("HTTP Request failed: " .. tostring(result))
end

local DiscordInviteCode = "mdJKdwbKjE"
local DiscordApiUrl = "https://discord.com/api/v10/invites/" .. DiscordInviteCode .. "?with_counts=true&with_expiration=true"

local function SetupDiscordInfo()
    local success, data = pcall(function()
        local requestData = {
            Url = DiscordApiUrl,
            Method = "GET",
            Headers = {
                ["User-Agent"] = "RobloxBot/1.0",
                ["Accept"] = "application/json"
            }
        }
        return game:GetService("HttpService"):JSONDecode(ui.Creator.Request(requestData).Body)
    end)
    
    if success and data and data.guild then
        local DiscordParagraph = Info:Paragraph({
            Title = data.guild.name,
            Desc = " <font color=\"#52525b\">●</font> Member Count : " .. tostring(data.approximate_member_count) .. "\n <font color=\"#16a34a\">●</font> Online Count : " .. tostring(data.approximate_presence_count),
            Image = "https://cdn.discordapp.com/icons/" .. data.guild.id .. "/" .. data.guild.icon .. ".png?size=1024",
            ImageSize = 42
        })
        
        Info:Button({
            Title = "Update Info",
            Callback = function()
                local refreshSuccess, refreshData = pcall(function()
                    local refreshRequest = {Url = DiscordApiUrl, Method = "GET"}
                    return game:GetService("HttpService"):JSONDecode(ui.Creator.Request(refreshRequest).Body)
                end)
                
                if refreshSuccess and refreshData and refreshData.guild then
                    DiscordParagraph:SetDesc(" <font color=\"#52525b\">●</font> Member Count : " .. tostring(refreshData.approximate_member_count) .. "\n <font color=\"#16a34a\">●</font> Online Count : " .. tostring(refreshData.approximate_presence_count))
                    WindUI:Notify({
                        Title = "Discord Info Updated",
                        Content = "Successfully refreshed Discord statistics",
                        Duration = 2,
                        Icon = "refresh-cw"
                    })
                else
                    WindUI:Notify({
                        Title = "Update Failed",
                        Content = "Could not refresh Discord info",
                        Duration = 3,
                        Icon = "alert-triangle"
                    })
                end
            end
        })
        
        Info:Button({
            Title = "Copy Discord Invite",
            Callback = function()
                setclipboard("https://discord.gg/" .. DiscordInviteCode)
                WindUI:Notify({
                    Title = "Copied!",
                    Content = "Discord invite copied to clipboard",
                    Duration = 2,
                    Icon = "clipboard-check"
                })
            end
        })
    else
        Info:Paragraph({
            Title = "Error fetching Discord Info",
            Desc = "Unable to load Discord information. Check your internet connection.",
            Image = "triangle-alert",
            ImageSize = 26,
            Color = "Red"
        })
        print("Discord API Error:", data)
    end
end

SetupDiscordInfo()

Info:Divider()

Info:Section({
    Title = "VexonHub",
    TextXAlignment = "Center",
    TextSize = 17
})

Info:Divider()

Info:Paragraph({
    Title = "Owner:",
    Desc = "TheVex0n",
    Image = "rbxassetid://84519376661277",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false
})

Info:Paragraph({
    Title = "Discord",
    Desc = "Join our discord for more info and stuff",
    Image = "rbxassetid://84519376661277",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
    Buttons = {
        {
            Icon = "copy",
            Title = "Copy Link",
            Callback = function()
                setclipboard("https://discord.gg/mdJKdwbKjE")
            end
        }
    }
})