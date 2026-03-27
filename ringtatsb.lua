local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/eeeiqjjj/WindUI/main/dist/main.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Animator = Humanoid:FindFirstChildOfClass("Animator")
local Camera = workspace.CurrentCamera

local Window = WindUI:CreateWindow({
    Folder = "RINGTA",
    Title = "RINGTA SCRIPTS",
    Icon = "star",
    Author = "RINGTA and BUBLIK6241",
    Theme = "Indigo",
    Size = UDim2.fromOffset(620, 460),
    HasOutline = true,
})

Window:EditOpenButton({
    Title = "Open RINGTA SCRIPTS",
    Icon = "pointer",
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromRGB(200, 0, 255), Color3.fromRGB(0, 200, 255)),
    Draggable = true,
    OnlyMobile = false,
})

Window:SetToggleKey(Enum.KeyCode.G)

local Sections = {
    Home = Window:Section({
        Title = "Home",
        Icon = "star",
        Opened = true,
    }),
    Combat = Window:Section({
        Title = "Combat",
        Icon = "sword",
        Opened = true,
    }),
}

local Tabs = {
    Home = Sections.Home:Tab({
        Title = "Home",
        Icon = "star",
        Desc = "Info & Settings",
        ShowTabTitle = true
    }),
    Main = Sections.Combat:Tab({
        Title = "Main",
        Icon = "zap",
        Desc = "Auto Features",
        ShowTabTitle = true
    }),
    Fighting = Sections.Combat:Tab({
        Title = "Fighting",
        Icon = "sword",
        Desc = "Combat Features",
        ShowTabTitle = true
    }),
    Fling = Sections.Combat:Tab({
        Title = "Fling",
        Icon = "user",
        Desc = "Fling Features",
        ShowTabTitle = true
    }),
    ESP = Sections.Combat:Tab({
        Title = "ESP",
        Icon = "eye",
        Desc = "ESP Features",
        ShowTabTitle = true
    }),
    Movement = Sections.Combat:Tab({
        Title = "Movement",
        Icon = "rocket",
        Desc = "Movement Features",
        ShowTabTitle = true
    }),
    Tech = Sections.Combat:Tab({
        Title = "Tech",
        Icon = "wrench",
        Desc = "Tech Scripts",
        ShowTabTitle = true
    }),
    Misc = Sections.Combat:Tab({
        Title = "Misc",
        Icon = "sparkles",
        Desc = "Misc Features",
        ShowTabTitle = true
    }),
    LagPing = Sections.Combat:Tab({
        Title = "Lag-Ping",
        Icon = "leaf",
        Desc = "Performance",
        ShowTabTitle = true
    }),
    Animations = Sections.Combat:Tab({
        Title = "Animations",
        Icon = "package",
        Desc = "Animation Features",
        ShowTabTitle = true
    }),
    Places = Sections.Combat:Tab({
        Title = "Places",
        Icon = "map",
        Desc = "Teleport Locations",
        ShowTabTitle = true
    }),
    Moveset = Sections.Combat:Tab({
        Title = "Moveset",
        Icon = "star",
        Desc = "Moveset Features",
        ShowTabTitle = true
    }),
    Info = Sections.Combat:Tab({
        Title = "Information",
        Icon = "badge-info",
        Desc = "Credits & Info",
        ShowTabTitle = true
    }),
}

Tabs.Home:Paragraph({
    Title = "Open UI IN PC",
    Desc = "PRESS G in your keyboard to open the ui in pc if it disappears when minimizing the ui",
    Color = "Green",
    Locked = false,
})

local Services = {
    HttpService = game:GetService("HttpService"),
    Players = game:GetService("Players")
}

local Response = nil
pcall(function()
    Response = Services.HttpService:JSONDecode(WindUI.Creator.Request({
        Url = "https://discord.com/api/v10/invites/ringta?with_counts=true&with_expiration=true",
        Method = "GET",
        Headers = {
            ["User-Agent"] = "RobloxBot/1.0",
            ["Accept"] = "application/json"
        }
    }).Body)
end)

if Response and Response.guild then
    Tabs.Home:Paragraph({
        Title = Response.guild.name,
        Desc = 
            '<font color="#52525b">•</font> Members: ' .. tostring(Response.approximate_member_count) .. 
            '\n<font color="#16a34a">•</font> Online: ' .. tostring(Response.approximate_presence_count),
        Thumbnail = "rbxassetid://131915027058214",
        ImageSize = 34,
        Buttons = {
            {
                Title = "Discord",
                Icon = "message-circle",
                Callback = function()
                    setclipboard("discord.gg/ringta")
                    WindUI:Notify({
                        Title = "Invite Copied",
                        Content = "Discord Invite has been copied to your clipboard!",
                        Icon = "square-arrow-out-up-right",
                        Duration = 10
                    })
                end,
            },
            {
                Title = "Youtube",
                Icon = "youtube",
                Callback = function()
                    setclipboard("https://www.youtube.com/@RINGTASCRIPTS")
                    WindUI:Notify({
                        Title = "Link Copied",
                        Content = "Youtube Link has been copied to your clipboard!",
                        Icon = "square-arrow-out-up-right",
                        Duration = 10
                    })
                end,
            }
        }
    })
end

local homeWindowSection = Tabs.Home:Section({
    Title = "Window",
    TextXAlignment = "Left",
    TextSize = 17,
    Icon = "app-window-mac"
})

local Themes = {}
for Name, _ in pairs(WindUI:GetThemes()) do
    table.insert(Themes, Name)
end

homeWindowSection:Dropdown({
    Title = "Theme",
    Multi = false,
    AllowNone = false,
    Value = "Indigo",
    Values = Themes,
    Callback = function(v)
        WindUI:SetTheme(v)
    end
})

homeWindowSection:Toggle({
    Title = "Transparency",
    Icon = "palette",
    Value = WindUI:GetTransparency(),
    Callback = function(v)
        Window:ToggleTransparency(v)
    end
})

Tabs.Home:Paragraph({
    Title = "CONTENT CREATOR",
    Desc = "if you upload a video on this script and dm ringta in discord you will get the content creator role and your video will be published in a showcase channel which can get you free views + you get access to 2 cool private channels the video DOES NOT HAVE TO GET ALOT OF VIEWS AND YOU don't need a lot of subs just make a good video and put some effort in and your good (: ",
    Color = "Green",
    Locked = false,
})

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

local CharacterGame = Character
local HumanoidGame = Humanoid
local AnimatorGame = Animator
local LocalPlayerGame = LocalPlayer

workspace.FallenPartsDestroyHeight = -math.huge

local function OnCharacterAdded(newCharacter)
    Character = newCharacter
    CharacterGame = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    HumanoidGame = Humanoid
    Animator = Humanoid:FindFirstChildOfClass("Animator")
    AnimatorGame = Animator
end

LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)

local autoSection = Tabs.Main:Section({
    Title = "Auto Features",
    Icon = "star",
    Opened = true,
})

autoSection:Button({
    Title = "Select Place - Map",
    Icon = "map",
    Callback = function()
        TeleportPosition = Vector3.new(150, 505, 30)
        WindUI:Notify({
            Title = "Place Selected",
            Content = "Map selected for auto void",
            Duration = 2,
            Icon = "check"
        })
    end
})

autoSection:Button({
    Title = "Select Place - Pixel",
    Icon = "grid",
    Callback = function()
        TeleportPosition = Vector3.new(30000000, 30000000, 30000000)
        WindUI:Notify({
            Title = "Place Selected",
            Content = "Pixel selected for auto void",
            Duration = 2,
            Icon = "check"
        })
    end
})

autoSection:Button({
    Title = "Select Place - Void",
    Icon = "cloud",
    Callback = function()
        TeleportPosition = Vector3.new(150, -495, 30)
        WindUI:Notify({
            Title = "Place Selected",
            Content = "Void selected for auto void",
            Duration = 2,
            Icon = "check"
        })
    end
})

autoSection:Button({
    Title = "Select Place - Darkness",
    Icon = "moon",
    Callback = function()
        TeleportPosition = Vector3.new(0, 900000000002, 0)
        WindUI:Notify({
            Title = "Place Selected",
            Content = "Darkness selected for auto void",
            Duration = 2,
            Icon = "check"
        })
    end
})

autoSection:Button({
    Title = "Select Place - Mountain",
    Icon = "mountain",
    Callback = function()
        TeleportPosition = Vector3.new(155.577392578125, 628.742431640625, -447.93841552734375)
        WindUI:Notify({
            Title = "Place Selected",
            Content = "Mountain selected for auto void",
            Duration = 2,
            Icon = "check"
        })
    end
})

autoSection:Button({
    Title = "Select Place - Counter",
    Icon = "shield",
    Callback = function()
        TeleportPosition = Vector3.new(-68, 29, 20346)
        WindUI:Notify({
            Title = "Place Selected",
            Content = "Counter selected for auto void",
            Duration = 2,
            Icon = "check"
        })
    end
})

autoSection:Button({
    Title = "Select Place - Atomic Base",
    Icon = "atom",
    Callback = function()
        TeleportPosition = Vector3.new(1063, 30, 23006)
        WindUI:Notify({
            Title = "Place Selected",
            Content = "Atomic Base selected for auto void",
            Duration = 2,
            Icon = "check"
        })
    end
})

autoSection:Button({
    Title = "Select Place - Atomic Base Up",
    Icon = "arrow-up",
    Callback = function()
        TeleportPosition = Vector3.new(1063, 405, 23006)
        WindUI:Notify({
            Title = "Place Selected",
            Content = "Atomic Base Up selected for auto void",
            Duration = 2,
            Icon = "check"
        })
    end
})

autoSection:Button({
    Title = "Select Place - Atomic Slash",
    Icon = "zap",
    Callback = function()
        TeleportPosition = Vector3.new(1063, 131, 23006)
        WindUI:Notify({
            Title = "Place Selected",
            Content = "Atomic Slash selected for auto void",
            Duration = 2,
            Icon = "check"
        })
    end
})

autoSection:Button({
    Title = "Select Place - Prison",
    Icon = "lock",
    Callback = function()
        TeleportPosition = Vector3.new(438, 439, -376)
        WindUI:Notify({
            Title = "Place Selected",
            Content = "Prison selected for auto void",
            Duration = 2,
            Icon = "check"
        })
    end
})

autoSection:Toggle({
    Title = "Auto Void/Place",
    Icon = "zap",
    Value = false,
    Callback = function(state)
        AutoVoidEnabled = state
    end
})

autoSection:Toggle({
    Title = "Tp Back Old Pos",
    Icon = "arrow-left",
    Value = false,
    Callback = function(state)
        TpBackEnabled = state
    end
})

local function onAnimationPlayed_AutoVoid(animTrack)
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

autoSection:Toggle({
    Title = "Auto Whirlwind Dunk",
    Icon = "wind",
    Value = false,
    Callback = function(state)
        AutoWhirlwindDunk = state
    end
})

local function OnWhirlwindAnimation(animTrack)
    if AutoWhirlwindDunk and animTrack.Animation and animTrack.Animation.AnimationId == WhirlwindAnimId then
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

autoSection:Toggle({
    Title = "Auto WallCombo + WallCombo Everywhere",
    Icon = "layers",
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

local antiSection = Tabs.Main:Section({
    Title = "Anti Features",
    Icon = "shield",
    Opened = false,
})

antiSection:Toggle({
    Title = "Anti Invisibility",
    Icon = "eye-off",
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
                        if track.Animation and track.Animation.AnimationId == DeathCounterAnimId and not inAnimation then
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

antiSection:Toggle({
    Title = "Anti Death Counter",
    Icon = "shield",
    Value = false,
    Callback = function(state)
        if state then
            StartAntiDeathCounter()
        else
            AntiDeathCounterActive = false
        end
    end
})

antiSection:Toggle({
    Title = "Anti AFK",
    Icon = "clock",
    Value = false,
    Callback = function(state)
        if state then
            AntiAfkConnection = LocalPlayer.Idled:Connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.zero)
            end)
        else
            if AntiAfkConnection then
                AntiAfkConnection:Disconnect()
                AntiAfkConnection = nil
            end
        end
    end
})

local espSection = Tabs.ESP:Section({
    Title = "ESP Features",
    Icon = "eye",
    Opened = true,
})

local UltEspData = {}

local function CreateUltEsp(player, character)
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local head = character:FindFirstChild("Head")
    if not humanoid or not head then return end
    if UltEspData[player] then
        UltEspData[player][1]()
    end
    local espText = Drawing.new("Text")
    espText.Visible = false
    espText.Center = true
    espText.Outline = true
    espText.Font = Drawing.Fonts.UI
    espText.Size = 14
    espText.Color = Color3.fromRGB(255, 255, 0)
    local function GetUltText()
        local liveChar = workspace.Live:FindFirstChild(player.Name)
        if liveChar then
            local ultBar = liveChar:GetAttribute("UltimateBar") or 0
            return string.format("[ULT: %.0f%%]", ultBar * 100)
        end
        return "[ULT: 0%]"
    end
    local connections = {}
    local function Cleanup()
        espText:Remove()
        for _, conn in ipairs(connections) do
            conn:Disconnect()
        end
        UltEspData[player] = nil
    end
    table.insert(connections, character.AncestryChanged:Connect(function(_, parent)
        if not parent then
            Cleanup()
        end
    end))
    table.insert(connections, humanoid.Died:Connect(Cleanup))
    table.insert(connections, RunService.RenderStepped:Connect(function()
        if EspUltBar and head and head.Parent then
            local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(head.Position)
            if onScreen then
                espText.Position = Vector2.new(screenPos.X, screenPos.Y - 42)
                espText.Text = GetUltText()
                espText.Visible = true
            else
                espText.Visible = false
            end
        else
            espText.Visible = false
        end
    end))
    UltEspData[player] = {Cleanup}
end

local function ClearAllUltEsp()
    for _, data in pairs(UltEspData) do
        if data[1] then
            data[1]()
        end
    end
    UltEspData = {}
end

local function SetupUltEspForPlayer(player)
    if player ~= LocalPlayer then
        if player.Character then
            CreateUltEsp(player, player.Character)
        end
        player.CharacterAdded:Connect(function(char)
            CreateUltEsp(player, char)
        end)
    end
end

espSection:Toggle({
    Title = "ESP Ult Bar",
    Icon = "bar-chart",
    Value = false,
    Callback = function(state)
        EspUltBar = state
        if EspUltBar then
            for _, player in pairs(Players:GetPlayers()) do
                SetupUltEspForPlayer(player)
            end
        else
            ClearAllUltEsp()
        end
    end
})

local DeathEspData = {}

local function CreateDeathEsp(player, character)
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local head = character:FindFirstChild("Head")
    if not humanoid or not head then return end
    if DeathEspData[player] then
        DeathEspData[player][1]()
    end
    local espText = Drawing.new("Text")
    espText.Visible = false
    espText.Center = true
    espText.Outline = true
    espText.Font = Drawing.Fonts.UI
    espText.Size = 14
    espText.Color = Color3.fromRGB(255, 0, 0)
    local function GetDeathText()
        local liveChar = workspace.Live:FindFirstChild(player.Name)
        if liveChar then
            local deaths = liveChar:GetAttribute("Deaths") or 0
            return string.format("[Deaths: %d]", deaths)
        end
        return "[Deaths: 0]"
    end
    local connections = {}
    local function Cleanup()
        espText:Remove()
        for _, conn in ipairs(connections) do
            conn:Disconnect()
        end
        DeathEspData[player] = nil
    end
    table.insert(connections, character.AncestryChanged:Connect(function(_, parent)
        if not parent then
            Cleanup()
        end
    end))
    table.insert(connections, humanoid.Died:Connect(Cleanup))
    table.insert(connections, RunService.RenderStepped:Connect(function()
        if EspDeathCounter and head and head.Parent then
            local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(head.Position)
            if onScreen then
                espText.Position = Vector2.new(screenPos.X, screenPos.Y - 57)
                espText.Text = GetDeathText()
                espText.Visible = true
            else
                espText.Visible = false
            end
        else
            espText.Visible = false
        end
    end))
    DeathEspData[player] = {Cleanup}
end

local function ClearAllDeathEsp()
    for _, data in pairs(DeathEspData) do
        if data[1] then
            data[1]()
        end
    end
    DeathEspData = {}
end

local function SetupDeathEspForPlayer(player)
    if player ~= LocalPlayer then
        if player.Character then
            CreateDeathEsp(player, player.Character)
        end
        player.CharacterAdded:Connect(function(char)
            CreateDeathEsp(player, char)
        end)
    end
end

espSection:Toggle({
    Title = "ESP Death Counter",
    Icon = "skull",
    Value = false,
    Callback = function(state)
        EspDeathCounter = state
        if EspDeathCounter then
            for _, player in pairs(Players:GetPlayers()) do
                SetupDeathEspForPlayer(player)
            end
        else
            ClearAllDeathEsp()
        end
    end
})

local function CreatePlayerEsp(player, character)
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local head = character:FindFirstChild("Head")
    if not humanoid or not head then return end
    if EspData[player] then
        EspData[player][1]()
    end
    local espText = Drawing.new("Text")
    espText.Visible = false
    espText.Center = true
    espText.Outline = true
    espText.Font = Drawing.Fonts.UI
    espText.Size = 14
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

espSection:Toggle({
    Title = "ESP Everyone",
    Icon = "users",
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

local movementSection = Tabs.Movement:Section({
    Title = "Movement Features",
    Icon = "rocket",
    Opened = true,
})

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

movementSection:Toggle({
    Title = "Speed (V Key On/Off)",
    Icon = "zap",
    Value = false,
    Callback = ToggleSpeed
})

movementSection:Slider({
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

movementSection:Toggle({
    Title = "Jump",
    Icon = "arrow-up",
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

movementSection:Slider({
    Title = "Jump Boost Value",
    Value = {Min = 1, Max = 1000, Default = 200},
    Callback = function(value)
        JumpValue = value
    end
})

movementSection:Toggle({
    Title = "No Stun",
    Icon = "shield",
    Value = false,
    Callback = function(state)
        getgenv().AutoNoSlow = state
        task.spawn(function()
            local connection
            connection = RunService.RenderStepped:Connect(function()
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