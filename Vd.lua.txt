local version = "3.8.1"

repeat task.wait() until game:IsLoaded()

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

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local RunService = game:GetService("RunService")
local LocalPlayer = game.Players.LocalPlayer
local Workspace = game.Workspace
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- 🎨 Color Variables
local COLOR_SURVIVOR       = Color3.fromRGB(0,0,255)
local COLOR_MURDERER       = Color3.fromRGB(255,0,0)
local COLOR_GENERATOR      = Color3.fromRGB(255,255,255)
local COLOR_GENERATOR_DONE = Color3.fromRGB(0,255,0)
local COLOR_GATE           = Color3.fromRGB(255,255,255)
local COLOR_PALLET         = Color3.fromRGB(255,255,0)
local COLOR_OUTLINE        = Color3.fromRGB(0,0,0)
local COLOR_WINDOW         = Color3.fromRGB(255,165,0)

-- Window GUI
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
    User = {
        Enabled = true,
        Anonymous = false
    },
})

pcall(function()
    Window:Tag({
        Title = verison,
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
local EspTab = Window:Tab({ Title = "ESP", Icon = "eye" })

Window:SelectTab(1)

-- ESP Variables
local espEnabled = false
local espSurvivor = false
local espMurder = false
local espGenerator = false
local espGate = false
local espPallet = false
local espObjects = {}
local espWindowEnabled = false

-- 🔹 ลบ ESP ของ object
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

-- 🔹 สร้าง ESP
local function createESP(obj, baseColor)
    if not obj or obj.Name == "Lobby" or espObjects[obj] then return end

    if obj:FindFirstChild("Bottom") then
        obj.Bottom.Transparency = 0
    end

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

-- 🔹 อัปเดต ESP Window ทุกอัน
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

-- 🔹 อัปเดต ESP หลัก realtime
local function updateESP()
    if not espEnabled then return end

    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    -- Survivor / Murderer realtime
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character ~= LocalPlayer.Character and player.Character.Name ~= "Lobby" then
            local isMurderer = player.Character:FindFirstChild("Weapon") ~= nil
            local currentESP = espObjects[player.Character]

            if isMurderer then
                if espMurder then
                    if currentESP and currentESP.color ~= COLOR_MURDERER then removeESP(player.Character); currentESP=nil end
                    createESP(player.Character, COLOR_MURDERER)
                else
                    removeESP(player.Character)
                end
            else
                if espSurvivor then
                    if currentESP and currentESP.color ~= COLOR_SURVIVOR then removeESP(player.Character); currentESP=nil end
                    createESP(player.Character, COLOR_SURVIVOR)
                else
                    removeESP(player.Character)
                end
            end
        end
    end

    -- Generator / Gate / Pallet
    for _, obj in pairs(Workspace.Map:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("BasePart") then
            -- Generator
            if espGenerator and obj.Name == "Generator" then
                local hitbox = obj:FindFirstChild("HitBox")
                local pointLight = hitbox and hitbox:FindFirstChildOfClass("PointLight")
                local color = COLOR_GENERATOR
                if pointLight and pointLight.Color == Color3.fromRGB(126,255,126) then
                    color = COLOR_GENERATOR_DONE
                end
                createESP(obj, color)
            elseif not espGenerator and obj.Name == "Generator" then
                removeESP(obj)
            end

            -- Gate
            if espGate and obj.Name == "Gate" then
                createESP(obj, COLOR_GATE)
            elseif not espGate and obj.Name == "Gate" then
                removeESP(obj)
            end

            -- Pallet
            if espPallet and obj.Name == "Palletwrong" then
                createESP(obj, COLOR_PALLET)
            elseif not espPallet and obj.Name == "Palletwrong" then
                removeESP(obj)
            end
        end
    end

    -- ESP Window ทุกอัน
    updateWindowESP()

    -- อัปเดตระยะทางทุก ESP
    for obj,data in pairs(espObjects) do
        if obj and obj.Parent and obj.Name~="Lobby" then
            local targetPart = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if targetPart then
                local dist = math.floor((hrp.Position - targetPart.Position).Magnitude)
                data.distLabel.Text = "["..dist.."m]"
            end
        end
    end
end

RunService.RenderStepped:Connect(updateESP)

-- Player respawn / leave
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function() task.wait(1) end)
end)
game.Players.PlayerRemoving:Connect(function(player)
    if player.Character then removeESP(player.Character) end
end)

-- ESP Tab Toggle
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

EspTab:Toggle({Title="ESP Survivor",  Default=false, Callback=function(v) espSurvivor=v end})
EspTab:Toggle({Title="ESP Murderer",  Default=false, Callback=function(v) espMurder=v end})
EspTab:Toggle({Title="ESP Generator", Default=false, Callback=function(v) espGenerator=v end})
EspTab:Toggle({Title="ESP Gate",      Default=false, Callback=function(v) espGate=v end})
EspTab:Toggle({Title="ESP Pallet",    Default=false, Callback=function(v) espPallet=v end})
EspTab:Toggle({Title="ESP Window",   Default=false, Callback=function(v) espWindowEnabled=v; updateWindowESP() end})

-- Main Tab Toggles

-- No Flashlight Toggle

-- Loop ตรวจสอบ ScreenshotHudFrame
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


local autoGeneratorEnabled = false
MainTab:Toggle({Title="Auto Generator", Default=false, Callback=function(v)
    autoGeneratorEnabled = v
end})

-- Auto Generator Loop
spawn(function()
    local GeneratorPoints = {"GeneratorPoint1","GeneratorPoint2","GeneratorPoint3","GeneratorPoint4"}
    while task.wait(1) do
        if autoGeneratorEnabled then
            for index, pointName in ipairs(GeneratorPoints) do
                local generator = Workspace.Map:FindFirstChild("Generator")
                if generator then
                    local point = generator:FindFirstChild(pointName)
                    if point then
                        local args = {
                            "neutral",
                            index,
                            generator,
                            point
                        }
                        local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Generator"):WaitForChild("SkillCheckResultEvent")
                        remote:FireServer(unpack(args))
                    end
                end
            end
        end
    end
end)

local noFlashlightEnabled = false
MainTab:Toggle({Title="No Flashlight", Default=false, Callback=function(v)
    noFlashlightEnabled = v
end})

MainTab:Toggle({Title="Full Bright", Default=false, Callback=function(v)
    Lighting.Brightness = v and 2 or 1
    Lighting.ClockTime = v and 14 or 12
    Lighting.Ambient = v and Color3.fromRGB(255,255,255) or Color3.fromRGB(128,128,128)
end})

MainTab:Toggle({Title="No Fog", Default=false, Callback=function(v)
    Lighting.FogEnd = v and 100000 or 1000
    Lighting.FogStart = v and 0 or 0
end})

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
