-- ======================
local version = "4.2.4"
-- ======================

repeat task.wait() until game:IsLoaded()

-- FPS Unlock
if setfpscap then
    setfpscap(1000000)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "dsc.gg/dyhub",
        Text = "FPS Unlocked!",
        Duration = 2,
        Button1 = "Okay"
    })
    warn("FPS Unlocked!")
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "dsc.gg/dyhub",
        Text = "Your exploit does not support setfpscap.",
        Duration = 2,
        Button1 = "Okay"
    })
    warn("Your exploit does not support setfpscap.")
end

-- Services
local RunService = game:GetService("RunService")
local Workspace = game.Workspace
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- ====================== ESP SETTINGS ======================
local ESPSURVIVOR = false
local ESPMURDER   = false
local ESPGENERATOR = false
local ESPGATE      = false
local ESPPALLET    = false
local ESPWINDOW    = false
local ESPHOOK      = false

local COLOR_SURVIVOR       = Color3.fromRGB(0,0,255)
local COLOR_MURDERER       = Color3.fromRGB(255,0,0)
local COLOR_GENERATOR      = Color3.fromRGB(255,255,255)
local COLOR_GENERATOR_DONE = Color3.fromRGB(0,255,0)
local COLOR_GATE           = Color3.fromRGB(255,255,255)
local COLOR_PALLET         = Color3.fromRGB(255,255,0)
local COLOR_OUTLINE        = Color3.fromRGB(0,0,0)
local COLOR_WINDOW         = Color3.fromRGB(255,165,0)
local COLOR_HOOK           = Color3.fromRGB(255,0,0)

-- ====================== WINDOW ======================
local Window = WindUI:CreateWindow({
    Title = "DYHUB",
    IconThemed = true,
    Icon = "rbxassetid://104487529937663",
    Author = "Violence District | Premium Version",
    Folder = "DYHUB_VD_ESP",
    Size = UDim2.fromOffset(500, 350),
    Transparent = true,
    Theme = "Dark",
    BackgroundImageTransparency = 0.8,
    HasOutline = false,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = { Enabled = true, Anonymous = false },
})

pcall(function()
    Window:Tag({
        Title = version,
        Color = Color3.fromHex("#30ff6a")
    })
end)

Window:EditOpenButton({
    Title = "DYHUB - Open",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(255, 255, 255)),
    Draggable = true,
})

-- Tabs
local InfoTab = Window:Tab({ Title = "Information", Icon = "info" })
local MainDivider = Window:Divider()
local MainTab = Window:Tab({ Title = "Main", Icon = "rocket" })
local PlayerTab = Window:Tab({ Title = "Player", Icon = "user" })
local EspTab = Window:Tab({ Title = "Esp", Icon = "eye" })

Window:SelectTab(1)

-- ====================== ESP SYSTEM ======================
local espEnabled = false
local espSurvivor = false
local espMurder = false
local espGenerator = false
local espGate = false
local espPallet = false
local espObjects = {}
local espWindowEnabled = false

-- Remove ESP
local function removeESP(obj)
    if espObjects[obj] then
        local data = espObjects[obj]
        if data.highlight then data.highlight:Destroy() end
        if data.nameLabel and data.nameLabel.Parent then
            data.nameLabel.Parent.Parent:Destroy()
        end
        espObjects[obj] = nil
    end
end

-- Create ESP
local function createESP(obj, baseColor)
    if not obj or obj.Name == "Lobby" or espObjects[obj] then return end

    if obj:FindFirstChild("Bottom") then obj.Bottom.Transparency = 0 end

    local highlight = Instance.new("Highlight")
    highlight.Adornee = obj
    highlight.FillColor = baseColor
    highlight.FillTransparency = 0.8
    highlight.OutlineColor = baseColor
    highlight.OutlineTransparency = 0.1
    highlight.Parent = obj

    local bill = Instance.new("BillboardGui")
    bill.Size = UDim2.new(0, 200, 0, 50)
    bill.Adornee = obj
    bill.AlwaysOnTop = true
    bill.Parent = obj

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundTransparency = 1
    frame.Parent = bill

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1,0,0.5,0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextScaled = false
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.TextSize = 14
    nameLabel.TextColor3 = baseColor
    nameLabel.TextStrokeColor3 = COLOR_OUTLINE
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Text = obj.Name
    nameLabel.Parent = frame

    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1,0,0.5,0)
    distLabel.Position = UDim2.new(0,0,0.5,0)
    distLabel.BackgroundTransparency = 1
    distLabel.TextScaled = false
    distLabel.Font = Enum.Font.SourceSansBold
    distLabel.TextSize = 14
    distLabel.TextColor3 = baseColor
    distLabel.TextStrokeColor3 = COLOR_OUTLINE
    distLabel.TextStrokeTransparency = 0
    distLabel.Text = "[ 0m ]"
    distLabel.Parent = frame

    espObjects[obj] = {highlight = highlight, nameLabel = nameLabel, distLabel = distLabel, color = baseColor}
end

-- Update Window ESP
local function updateWindowESP()
    if not espEnabled then return end
    for _, windowModel in pairs(Workspace.Map:GetDescendants()) do
        if windowModel:IsA("Model") and windowModel.Name == "Window" then
            local bottomPart = windowModel:FindFirstChild("Bottom")
            if bottomPart then
                bottomPart.Transparency = espWindowEnabled and 0 or 1
                if espWindowEnabled then
                    createESP(windowModel, COLOR_WINDOW)
                else
                    removeESP(windowModel)
                end
            end
        end
    end
end

-- Update ESP Main
local function updateESP()
    if not espEnabled then return end
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    -- Player ESP
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character ~= LocalPlayer.Character and player.Character.Name ~= "Lobby" then
            local isMurderer = player.Character:FindFirstChild("Weapon") ~= nil
            local currentESP = espObjects[player.Character]

            if isMurderer then
                if espMurder then
                    if currentESP and currentESP.color ~= COLOR_MURDERER then removeESP(player.Character); currentESP=nil end
                    createESP(player.Character, COLOR_MURDERER)
                else removeESP(player.Character) end
            else
                if espSurvivor then
                    if currentESP and currentESP.color ~= COLOR_SURVIVOR then removeESP(player.Character); currentESP=nil end
                    createESP(player.Character, COLOR_SURVIVOR)
                else removeESP(player.Character) end
            end
        end
    end

    -- Object ESP
    for _, obj in pairs(Workspace.Map:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("BasePart") then
            -- Generator
            if obj.Name == "Generator" then
                if espGenerator then
                    local hitbox = obj:FindFirstChild("HitBox")
                    local pointLight = hitbox and hitbox:FindFirstChildOfClass("PointLight")
                    local color = COLOR_GENERATOR
                    if pointLight and pointLight.Color == Color3.fromRGB(126,255,126) then
                        color = COLOR_GENERATOR_DONE
                    end
                    createESP(obj, color)
                else removeESP(obj) end
            end

            -- Gate
            if obj.Name == "Gate" then
                if espGate then createESP(obj, COLOR_GATE) else removeESP(obj) end
            end

            -- Hook
            if obj.Name == "Hook" and obj:FindFirstChild("Model") then
                if espHook then createESP(obj.Model, COLOR_HOOK) else removeESP(obj.Model) end
            end

            -- Pallet
            if obj.Name == "Palletwrong" then
                if espPallet then createESP(obj, COLOR_PALLET) else removeESP(obj) end
            end
        end
    end

    updateWindowESP()

    -- Update distances
    for obj,data in pairs(espObjects) do
        if obj and obj.Parent and obj.Name ~= "Lobby" then
            local targetPart = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if targetPart then
                local dist = math.floor((hrp.Position - targetPart.Position).Magnitude)
                data.distLabel.Text = "["..dist.."m]"
            end
        end
    end
end

RunService.RenderStepped:Connect(updateESP)

-- Player added/removed
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function() task.wait(1) end)
end)
Players.PlayerRemoving:Connect(function(player)
    if player.Character then removeESP(player.Character) end
end)

-- ====================== ESP GUI ======================
EspTab:Section({ Title = "Feature Esp", Icon = "eye" })
EspTab:Toggle({Title="Enable ESP", Default=false, Callback=function(v)
    espEnabled = v
    if not espEnabled then
        for obj,_ in pairs(espObjects) do
            if obj:FindFirstChild("Bottom") then obj.Bottom.Transparency = 1 end
            removeESP(obj)
        end
    else
        updateESP()
        updateWindowESP()
    end
end})

EspTab:Section({ Title = "Esp Role", Icon = "settings" })
EspTab:Toggle({Title="ESP Survivor", Default=ESPSURVIVOR, Callback=function(v) espSurvivor=v end})
EspTab:Toggle({Title="ESP Murderer", Default=ESPMURDER, Callback=function(v) espMurder=v end})

EspTab:Section({ Title = "Esp Engine", Icon = "biceps-flexed" })
EspTab:Toggle({Title="ESP Generator", Default=ESPGENERATOR, Callback=function(v) espGenerator=v end})
EspTab:Toggle({Title="ESP Gate", Default=ESPGATE, Callback=function(v) espGate=v end})

EspTab:Section({ Title = "Esp Object", Icon = "package" })
EspTab:Toggle({Title="ESP Pallet", Default=ESPPALLET, Callback=function(v) espPallet=v end})
EspTab:Toggle({Title="ESP Hook", Default=ESPHOOK, Callback=function(v) espHook=v end})
EspTab:Toggle({Title="ESP Window", Default=ESPWINDOW, Callback=function(v) espWindowEnabled=v; updateWindowESP() end})

-- ====================== NO FLASHLIGHT ======================
local noFlashlightEnabled = false
spawn(function()
    while task.wait(5) do
        if noFlashlightEnabled then
            local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
            if playerGui then
                local screenshotFrame = playerGui:FindFirstChild("ScreenshotHudFrame")
                if screenshotFrame then
                    screenshotFrame:Destroy()
                end
            end
        end
    end
end)

-- ====================== BYPASS GATE ======================
local bypassGateEnabled = false
local gates = {}

for _, gate in pairs(workspace:WaitForChild("Map"):GetChildren()) do
    if gate.Name == "Gate" then
        table.insert(gates, gate)
    end
end

local function setGateState(enabled)
    for _, gate in pairs(gates) do
        local leftGate = gate:FindFirstChild("LeftGate")
        local rightGate = gate:FindFirstChild("RightGate")
        local leftEnd = gate:FindFirstChild("LeftGate-end")
        local rightEnd = gate:FindFirstChild("RightGate-end")
        local box = gate:FindFirstChild("Box")

        if leftGate or rightGate or leftEnd or rightEnd then
            if enabled then
                if leftGate then
                    leftGate.Transparency = 1
                    leftGate.CanCollide = false
                end
                if rightGate then
                    rightGate.Transparency = 1
                    rightGate.CanCollide = false
                end
                if leftEnd then leftEnd.Transparency = 0 end
                if rightEnd then rightEnd.Transparency = 0 end
            else
                if leftGate then
                    leftGate.Transparency = 0
                    leftGate.CanCollide = true
                end
                if rightGate then
                    rightGate.Transparency = 0
                    rightGate.CanCollide = true
                end
            end
        else
            if box then
                box.CanCollide = not enabled
            end
        end
    end
end

MainTab:Section({ Title = "Feature Bypass", Icon = "lock-open" })
MainTab:Toggle({
    Title = "Bypass Gate (Beta)",
    Default = false,
    Callback = function(state)
        bypassGateEnabled = state
        setGateState(state)
    end
})

-- ====================== AUTO GENERATOR ======================
local autoGeneratorEnabled = false
MainTab:Section({ Title = "Feature Cheat", Icon = "zap" })
MainTab:Toggle({Title="Auto Generator", Default=false, Callback=function(v) autoGeneratorEnabled=v end})

spawn(function()
    local GeneratorPoints = {"GeneratorPoint1","GeneratorPoint2","GeneratorPoint3","GeneratorPoint4"}
    while task.wait(1) do
        if autoGeneratorEnabled then
            local generator = Workspace.Map:FindFirstChild("Generator")
            if generator then
                for index, pointName in ipairs(GeneratorPoints) do
                    local point = generator:FindFirstChild(pointName)
                    if point then
                        local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Generator"):WaitForChild("SkillCheckResultEvent")
                        remote:FireServer("neutral", index, generator, point)
                    end
                end
            end
        end
    end
end)

MainTab:Toggle({Title="No Flashlight", Default=false, Callback=function(v) noFlashlightEnabled=v end})

-- ====================== VISUAL ======================
MainTab:Section({ Title = "Feature Visual", Icon = "lightbulb" })
MainTab:Toggle({Title="Full Bright", Default=false, Callback=function(v)
    Lighting.Brightness = v and 2 or 1
    Lighting.ClockTime = v and 14 or 12
    Lighting.Ambient = v and Color3.fromRGB(255,255,255) or Color3.fromRGB(128,128,128)
end})

MainTab:Toggle({Title="No Fog", Default=false, Callback=function(v)
    Lighting.FogEnd = v and 100000 or 1000
    Lighting.FogStart = 0
end})

-- ====================== PLAYER ======================
local speedEnabled, flyNoclipSpeed = false, 50
local speedConnection, noclipConnection

PlayerTab:Section({ Title = "Feature Player", Icon = "arrow-big-up-dash" })
PlayerTab:Slider({ Title = "Set Speed Value", Value={Min=1,Max=100,Default=10}, Step=1, Callback=function(val) flyNoclipSpeed=val end })

PlayerTab:Toggle({ Title = "Enable Speed", Default=false, Callback=function(v)
    speedEnabled=v
    if speedEnabled then
        if speedConnection then speedConnection:Disconnect() end
        speedConnection=RunService.RenderStepped:Connect(function()
            local char=LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char.Humanoid.MoveDirection.Magnitude>0 then
                char.HumanoidRootPart.CFrame=char.HumanoidRootPart.CFrame+char.Humanoid.MoveDirection*flyNoclipSpeed*0.016
            end
        end)
    else
        if speedConnection then speedConnection:Disconnect() speedConnection=nil end
    end
end })

PlayerTab:Toggle({ Title = "No Clip", Default=false, Callback=function(state)
    if state then
        noclipConnection=RunService.Stepped:Connect(function()
            local char=LocalPlayer.Character
            if char then
                for _,part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide=false end
                end
            end
        end)
    else
        if noclipConnection then noclipConnection:Disconnect() noclipConnection=nil end
        local char=LocalPlayer.Character
        if char then
            for _,part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide=true end
            end
        end
    end
end })

-- ====================== INFINITE JUMP ======================
local infiniteJumpEnabled = false
PlayerTab:Toggle({ Title = "Infinite Jump", Default = false, Callback = function(state) infiniteJumpEnabled = state end })

UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

Info = InfoTab

if not ui then ui = {} end
if not ui.Creator then ui.Creator = {} end

-- Define the Request function that mimics ui.Creator.Request
ui.Creator.Request = function(requestData)
    local HttpService = game:GetService("HttpService")
    
    -- Try different HTTP methods
    local success, result = pcall(function()
        if HttpService.RequestAsync then
            -- Method 1: Use RequestAsync if available
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
        else
            -- Method 2: Fallback to GetAsync
            local body = HttpService:GetAsync(requestData.Url)
            return {
                Body = body,
                StatusCode = 200,
                Success = true
            }
        end
    end)
    
    if success then
        return result
    else
        error("HTTP Request failed: " .. tostring(result))
    end
end

-- Remove this line completely: Info = InfoTab
-- The Info variable is already correctly set above

local InviteCode = "jWNDPNMmyB"
local DiscordAPI = "https://discord.com/api/v10/invites/" .. InviteCode .. "?with_counts=true&with_expiration=true"

local function LoadDiscordInfo()
    local success, result = pcall(function()
        return game:GetService("HttpService"):JSONDecode(ui.Creator.Request({
            Url = DiscordAPI,
            Method = "GET",
            Headers = {
                ["User-Agent"] = "RobloxBot/1.0",
                ["Accept"] = "application/json"
            }
        }).Body)
    end)

    if success and result and result.guild then
        local DiscordInfo = Info:Paragraph({
            Title = result.guild.name,
            Desc = ' <font color="#52525b">●</font> Member Count : ' .. tostring(result.approximate_member_count) ..
                '\n <font color="#16a34a">●</font> Online Count : ' .. tostring(result.approximate_presence_count),
            Image = "https://cdn.discordapp.com/icons/" .. result.guild.id .. "/" .. result.guild.icon .. ".png?size=1024",
            ImageSize = 42,
        })

        Info:Button({
            Title = "Update Info",
            Callback = function()
                local updated, updatedResult = pcall(function()
                    return game:GetService("HttpService"):JSONDecode(ui.Creator.Request({
                        Url = DiscordAPI,
                        Method = "GET",
                    }).Body)
                end)

                if updated and updatedResult and updatedResult.guild then
                    DiscordInfo:SetDesc(
                        ' <font color="#52525b">●</font> Member Count : ' .. tostring(updatedResult.approximate_member_count) ..
                        '\n <font color="#16a34a">●</font> Online Count : ' .. tostring(updatedResult.approximate_presence_count)
                    )
                    
                    WindUI:Notify({
                        Title = "Discord Info Updated",
                        Content = "Successfully refreshed Discord statistics",
                        Duration = 2,
                        Icon = "refresh-cw",
                    })
                else
                    WindUI:Notify({
                        Title = "Update Failed",
                        Content = "Could not refresh Discord info",
                        Duration = 3,
                        Icon = "alert-triangle",
                    })
                end
            end
        })

        Info:Button({
            Title = "Copy Discord Invite",
            Callback = function()
                setclipboard("https://discord.gg/" .. InviteCode)
                WindUI:Notify({
                    Title = "Copied!",
                    Content = "Discord invite copied to clipboard",
                    Duration = 2,
                    Icon = "clipboard-check",
                })
            end
        })
    else
        Info:Paragraph({
            Title = "Error fetching Discord Info",
            Desc = "Unable to load Discord information. Check your internet connection.",
            Image = "triangle-alert",
            ImageSize = 26,
            Color = "Red",
        })
        print("Discord API Error:", result) -- Debug print
    end
end

LoadDiscordInfo()

Info:Divider()
Info:Section({ 
    Title = "DYHUB Information",
    TextXAlignment = "Center",
    TextSize = 17,
})
Info:Divider()

local Owner = Info:Paragraph({
    Title = "Main Owner",
    Desc = "@dyumraisgoodguy#8888",
    Image = "rbxassetid://119789418015420",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
})

local Social = Info:Paragraph({
    Title = "Social",
    Desc = "Copy link social media for follow!",
    Image = "rbxassetid://104487529937663",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
    Buttons = {
        {
            Icon = "copy",
            Title = "Copy Link",
            Callback = function()
                setclipboard("https://guns.lol/DYHUB")
                print("Copied social media link to clipboard!")
            end,
        }
    }
})

local Discord = Info:Paragraph({
    Title = "Discord",
    Desc = "Join our discord for more scripts!",
    Image = "rbxassetid://104487529937663",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
    Buttons = {
        {
            Icon = "copy",
            Title = "Copy Link",
            Callback = function()
                setclipboard("https://discord.gg/jWNDPNMmyB")
                print("Copied discord link to clipboard!")
            end,
        }
    }
})
