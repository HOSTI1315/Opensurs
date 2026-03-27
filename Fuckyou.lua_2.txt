-- =========================
local version = "3.5.4"
-- =========================

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

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- ====================== SERVICES ======================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Backpack = LocalPlayer:WaitForChild("Backpack")

-- ====================== SETTINGS ======================
local AutoCollect = false
local AutoEB = false
local AutoEBRunning = false
local AutoCollectV2 = false
local AutoCollectV2Running = false

local AutoFarm = false
local autoClicking = false
local AutoCollectDelay = 20
local ClickInterval = 0.25

local AntiAFKEnabled = false

local SellBrainrot = false
local SellPlant = false
local SellEverything = false

local HeldToolNames = {
    "Basic Bat",
    "Leather Grip Bat",
    "Iron Plate Bat",
    "Iron Core Bat",
    "Aluminum Bat"
}

local serverStartTime = os.time()

-- ===================== SHOP ITEMS =====================
local shop = {
    seedList = {
        "Cactus Seed",
        "Strawberry Seed",
        "Pumpkin Seed",
        "Sunflower Seed",
        "Dragon Seed",
        "Eggplant Seed",
        "Watermelon Seed",
        "Grape Seed",
        "Cocotank Seed",
        "Carnivorous Plant Seed",
        "Mr Carrot Seed",
        "Tomatrio Seed",
        "Shroombino Seed"
    },

    gearList = {
        "Water Bucket",
        "Frost Grenade",
        "Banana Gun",
        "Frost Blower",
        "Carrot Launcher"
    },
    PlatformList = {
        "1","2","3","4","5",
        "6","7","8","9","10",
        "11","12","13","14",
        "15","16","17"
    }
}

-- ===================== VARIABLES =====================
local selectedSeeds = {}
local selectedGears = {}
local selectedPlatform = {}

local AutoBuyAllSeed = false
local AutoBuyAllGear = false
local AutoBuyPlatformAll = false

local AutoBuySelectedGear = false
local AutoBuySelectedSeed = false
local AutoBuyPlatformSelect = false

-- ====================== HELPER FUNCTIONS ======================
local function GetMyPlot()
    for _, plot in ipairs(Workspace.Plots:GetChildren()) do
        local playerSign = plot:FindFirstChild("PlayerSign")
        if playerSign then
            local bg = playerSign:FindFirstChild("BillboardGui")
            local textLabel = bg and bg:FindFirstChild("TextLabel")
            if textLabel and (textLabel.Text == LocalPlayer.Name or textLabel.Text == LocalPlayer.DisplayName) then
                return plot
            end
        end
    end
    return nil
end

local function GetMyPlotName()
    local plot = GetMyPlot()
    return plot and plot.Name or "No Plot"
end

local function GetMoney()
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    return leaderstats and leaderstats:FindFirstChild("Money") and leaderstats.Money.Value or 0
end

local function GetRebirth()
    local gui = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("Main")
    if gui and gui:FindFirstChild("Rebirth") then
        local text = gui.Rebirth.Frame.Title.Text or "Rebirth 0"
        local n = tonumber(text:match("%d+")) or 0
        return math.max(0, n - 1)
    end
    return 0
end

local function FormatTime(sec)
    local h = math.floor(sec / 3600)
    local m = math.floor((sec % 3600) / 60)
    local s = sec % 60
    return string.format("%02d:%02d:%02d", h, m, s)
end

-- safe remote getters
local function GetBridgeNet2()
    return ReplicatedStorage:FindFirstChild("BridgeNet2")
end

local function GetRemotesFolder()
    return ReplicatedStorage:FindFirstChild("Remotes")
end

-- ====================== WINDOW ======================
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local FreeVersion = "Free Version"
local PremiumVersion = "Premium Version"

local function checkVersion(playerName)
    local url = "https://raw.githubusercontent.com/dyumra/Whitelist/refs/heads/main/DYHUB-PREMIUM.lua"

    local success, response = pcall(function()
        return game:HttpGet(url)
    end)

    if not success then
        return FreeVersion
    end

    local premiumData
    local func, err = loadstring(response)
    if func then
        premiumData = func()
    else
        return FreeVersion
    end

    if premiumData[playerName] then
        return PremiumVersion
    else
        return FreeVersion
    end
end

local player = Players.LocalPlayer
local userversion = checkVersion(player.Name)

local Window = WindUI:CreateWindow({
    Title = "DYHUB",
    IconThemed = true,
    Icon = "rbxassetid://104487529937663",
    Author = "Plants Vs Brainrots | " .. userversion,
    Folder = "DYHUB_PVSB",
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

local InfoTab = Window:Tab({ Title = "Information", Icon = "info" })
local MainDivider = Window:Divider()
local Main = Window:Tab({ Title = "Main", Icon = "rocket" })
local Shop = Window:Tab({ Title = "Shop", Icon = "shopping-cart" })
local Collect = Window:Tab({ Title = "Auto", Icon = "crown" })
local Sell = Window:Tab({ Title = "Sell", Icon = "dollar-sign" })
local Misc = Window:Tab({ Title = "Misc", Icon = "settings" })
Window:SelectTab(1)

-- ====================== MAIN ======================
Main:Section({ Title = "Auto Farm", Icon = "backpack" })

Main:Paragraph({
    Title = "Your Status",
    Desc = "[+] Show Plots \n[+] Show Rebirth \n[+] Show Money \n[+] Show Playtime",
    Image = "rbxassetid://104487529937663",
    ImageSize = 50,
    Locked = false,
    Buttons = {
        {
            Icon = "info",
            Title = "Show Status",
            Callback = function()
                local message = "Your Status\n"
                message = message .. "Plots: " .. GetMyPlotName() .. "\n"
                message = message .. "Rebirth: " .. GetRebirth() .. "\n"
                message = message .. "Money: " .. GetMoney() .. "\n"
                message = message .. "Playtime: " .. FormatTime(os.time() - serverStartTime)

                WindUI:Notify({
                    Title = "DYHUB Status",
                    Content = message,
                    Duration = 2,
                    Icon = "user-check",
                })
            end
        }
    }
})

Main:Section({ Title = "Use on private servers for security", Icon = "triangle-alert" })

-- ====================== BRAINROTS CACHE ======================
local BrainrotsCache = {}

local function UpdateBrainrotsCache()
    local ok, folder = pcall(function()
        return Workspace:WaitForChild("ScriptedMap"):WaitForChild("Brainrots")
    end)
    if not ok or not folder then return end
    BrainrotsCache = {}
    for _, b in ipairs(folder:GetChildren()) do
        if b:FindFirstChild("BrainrotHitbox") then
            table.insert(BrainrotsCache, b)
        end
    end
end

local function GetNearestBrainrot()
    local nearest = nil
    local minDist = math.huge
    for _, b in ipairs(BrainrotsCache) do
        local hitbox = b:FindFirstChild("BrainrotHitbox")
        if hitbox then
            local dist = (HumanoidRootPart.Position - hitbox.Position).Magnitude
            if dist < minDist then
                minDist = dist
                nearest = b
            end
        end
    end
    return nearest
end

-- ====================== UTILITY FUNCTIONS ======================
local HeldToolName = nil

local function EquipBat()
    for _, toolName in ipairs(HeldToolNames) do
        local tool = Backpack:FindFirstChild(toolName) or Character:FindFirstChild(toolName)
        if tool then
            tool.Parent = Character
            HeldToolName = toolName
            return true
        end
    end
    return false
end

local function InstantWarpToBrainrot(brainrot)
    local hitbox = brainrot and brainrot:FindFirstChild("BrainrotHitbox")
    if hitbox then
        local offset = Vector3.new(0, 0.69, 2.5)
        HumanoidRootPart.CFrame = CFrame.new(hitbox.Position + offset, hitbox.Position)
    end
end

local function DoClick()
    pcall(function()
        VirtualUser:Button1Down(Vector2.new(0, 0))
        task.wait(0.05) -- เพิ่มความเร็วให้คลิกบ่อยขึ้น
        VirtualUser:Button1Up(Vector2.new(0, 0))
    end)
end

-- ====================== AUTO FARM ======================
Main:Toggle({
    Title = "Auto Farm (Fixed)",
    Description = "Automatically attack approaching Brainrot faster",
    Default = false,
    Callback = function(state)
        AutoFarm = state
        autoClicking = state

        if state then
            EquipBat()
            UpdateBrainrotsCache()

            -- AUTO CLICKER
            task.spawn(function()
                while autoClicking do
                    if Character and Character:FindFirstChild(HeldToolName) then
                        DoClick()
                    end
                    task.wait(ClickInterval)
                end
            end)

            -- AUTO EQUIP
            task.spawn(function()
                while AutoFarm do
                    if Character and not Character:FindFirstChild(HeldToolName) then
                        EquipBat()
                    end
                    task.wait(0.25)
                end
            end)

            -- BRAINROTS CACHE REFRESH
            task.spawn(function()
                while AutoFarm do
                    UpdateBrainrotsCache()
                    task.wait(0.25)
                end
            end)

            -- AUTO FARM BRAINROT
            task.spawn(function()
                while AutoFarm do
                    local currentTarget = GetNearestBrainrot()
                    if currentTarget and currentTarget:FindFirstChild("BrainrotHitbox") then
                        InstantWarpToBrainrot(currentTarget)
                        pcall(function()
                            local remotes = GetRemotesFolder()
                            if remotes and remotes:FindFirstChild("AttacksServer") and remotes.AttacksServer:FindFirstChild("WeaponAttack") then
                                remotes.AttacksServer.WeaponAttack:FireServer({ { target = currentTarget.BrainrotHitbox } })
                            else
                                local ok, _ = pcall(function()
                                    ReplicatedStorage.Remotes.AttacksServer.WeaponAttack:FireServer({ { target = currentTarget.BrainrotHitbox } })
                                end)
                            end
                        end)
                    end
                    task.wait(ClickInterval)
                end
            end)

        else
            autoClicking = false
        end
    end
})

-- ====================== AUTO COLLECT ======================
local function GetNearestPlot()
    local nearestPlot = nil
    local minDist = math.huge
    for _, plot in ipairs(Workspace.Plots:GetChildren()) do
        if plot:IsA("Folder") then
            local center = plot:FindFirstChild("Center") or plot:FindFirstChildWhichIsA("BasePart")
            if center then
                local dist = (HumanoidRootPart.Position - center.Position).Magnitude
                if dist < minDist then
                    minDist = dist
                    nearestPlot = plot
                end
            end
        end
    end
    return nearestPlot
end

local function CollectFromPlot(plot)
    if not plot then return end
    local brainrotsFolder = plot:FindFirstChild("Brainrots")
    if not brainrotsFolder then return end

    for i = 1, 17 do
        local slot = brainrotsFolder:FindFirstChild(tostring(i))
        if slot and slot:FindFirstChild("Brainrot") then
            local brainrot = slot:FindFirstChild("Brainrot")
            if brainrot:FindFirstChild("BrainrotHitbox") then
                local hitbox = brainrot.BrainrotHitbox
                local offset = Vector3.new(0, 1, 3)
                HumanoidRootPart.CFrame = CFrame.new(hitbox.Position + offset, hitbox.Position)
                task.wait(0.2)
                pcall(function()
                    local remotes = GetRemotesFolder()
                    if remotes and remotes:FindFirstChild("AttacksServer") and remotes.AttacksServer:FindFirstChild("WeaponAttack") then
                        remotes.AttacksServer.WeaponAttack:FireServer({ { target = hitbox } })
                    else
                        ReplicatedStorage.Remotes.AttacksServer.WeaponAttack:FireServer({ { target = hitbox } })
                    end
                end)
            end
        end
    end
end

Collect:Section({ Title = "Auto Collect", Icon = "hand-coins" })

Collect:Slider({
    Title = "Auto Collect Delay (sec)",
    Description = "Set delay time between collections",
    Value = {Min = 1, Max = 300, Default = 20},
    Step = 1,
    Callback = function(val)
        AutoCollectDelay = val
    end
})

Collect:Toggle({
    Title = "Auto Collect Money",
    Description = "Automatically Teleport to Collect",
    Default = false,
    Callback = function(state)
        AutoCollect = state
        if state then
            task.spawn(function()
                while AutoCollect do
                    local nearestPlot = GetNearestPlot()
                    if nearestPlot then
                        CollectFromPlot(nearestPlot)
                    end
                    task.wait(AutoCollectDelay)
                end
            end)
        end
    end
})

Collect:Toggle({
    Title = "Auto Collect Money V2",
    Description = "Automatically Collect Without Teleport",
    Default = false,
    Callback = function(state)
        AutoCollectV2 = state
        if state and not AutoCollectV2Running then
            AutoCollectV2Running = true
            task.spawn(function()
                while AutoCollectV2 do
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipBestBrainrots"):FireServer()
                    task.wait(AutoCollectDelay)
                end
                AutoCollectV2Running = false
            end)
        end
    end
})

-- ====================== AUTO EQUIP ======================
Collect:Section({ Title = "Auto Equip", Icon = "star" })

Collect:Toggle({
    Title = "Auto Equip Best Brainrot",
    Description = "Automatically Equip Best Brainrot",
    Default = false,
    Callback = function(state)
        AutoEB = state
        if state and not AutoEBRunning then
            AutoEBRunning = true
            task.spawn(function()
                while AutoEB do
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipBestBrainrots"):FireServer()
                    task.wait(5)
                end
                AutoEBRunning = false
            end)
        end
    end
})

-- ====================== SELL ======================
Sell:Section({ Title = "Auto Sell", Icon = "dollar-sign" })

Sell:Toggle({
    Title = "Sell Brainrot All",
    Default = false,
    Callback = function(state)
        SellBrainrot = state
        while SellBrainrot do
            task.wait(0.5) 
            ReplicatedStorage.Remotes.ItemSell:FireServer()
        end
    end
})

Sell:Toggle({
    Title = "Sell Plants All",
    Default = false,
    Callback = function(state)
        SellPlant = state
        while SellPlant do
            task.wait(0.5)
            ReplicatedStorage.Remotes.ItemSell:FireServer()
        end
    end
})

Sell:Section({ Title = "Sell Everything", Icon = "gem" })

Sell:Toggle({
    Title = "Sell Both All",
    Default = false,
    Callback = function(state)
        SellEverything = state
        while SellEverything do
            task.wait(0.5)
            ReplicatedStorage.Remotes.ItemSell:FireServer()
        end
    end
})

-- ===================== SHOP UI =====================
Shop:Section({ Title = "Buy Seed", Icon = "leaf" })

Shop:Dropdown({
    Title = "Select Seed",
    Values = shop.seedList,
    Multi = true,
    Callback = function(values)
        selectedSeeds = values
    end
})

-- Auto Buy Seed (Selected - loop by order)
Shop:Toggle({
    Title = "Auto Buy Seed (Selected)",
    Default = false,
    Callback = function(state)
        AutoBuySelectedSeed = state
        if state then
            task.spawn(function()
                while AutoBuySelectedSeed do
                    if #selectedSeeds > 0 then
                        for _, seed in ipairs(selectedSeeds) do
                            if not AutoBuySelectedSeed then break end
                            local BuySeedRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyItem")
                            BuySeedRemote:FireServer(seed)
                            task.wait(0.3)
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Auto Buy Seed (All - loop full list)
Shop:Toggle({
    Title = "Auto Buy Seed (All)",
    Default = false,
    Callback = function(state)
        AutoBuyAllSeed = state
        if state then
            task.spawn(function()
                while AutoBuyAllSeed do
                    for _, seed in ipairs(shop.seedList) do
                        if not AutoBuyAllSeed then break end
                        local BuySeedRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyItem")
                        BuySeedRemote:FireServer(seed)
                        task.wait(0.3)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- ================== GEAR ==================
Shop:Section({ Title = "Buy Gear", Icon = "package" })

Shop:Dropdown({
    Title = "Select Gear",
    Values = shop.gearList,
    Multi = true,
    Callback = function(values)
        selectedGears = values
    end
})

-- Auto Buy Gear (Selected - loop by order)
Shop:Toggle({
    Title = "Auto Buy Gear (Selected)",
    Default = false,
    Callback = function(state)
        AutoBuySelectedGear = state
        if state then
            task.spawn(function()
                while AutoBuySelectedGear do
                    if #selectedGears > 0 then
                        for _, gear in ipairs(selectedGears) do
                            if not AutoBuySelectedGear then break end
                            local BuyGearRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyGear")
                            BuyGearRemote:FireServer(gear)
                            task.wait(0.3)
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Auto Buy Gear (All - loop full list)
Shop:Toggle({
    Title = "Auto Buy Gear (All)",
    Default = false,
    Callback = function(state)
        AutoBuyAllGear = state
        if state then
            task.spawn(function()
                while AutoBuyAllGear do
                    for _, gear in ipairs(shop.gearList) do
                        if not AutoBuyAllGear then break end
                        local BuyGearRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyGear")
                        BuyGearRemote:FireServer(gear)
                        task.wait(0.3)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- ================== PLATFORM ==================
Shop:Section({ Title = "Buy Platform", Icon = "house" })

Shop:Dropdown({
    Title = "Select Platform",
    Values = shop.PlatformList,
    Multi = true,
    Callback = function(values)
        selectedPlatform = values
    end
})

Shop:Toggle({
    Title = "Auto Buy Platform (Selected)",
    Default = false,
    Callback = function(state)
        AutoBuyPlatformSelect = state
        if state and #selectedPlatform > 0 then
            task.spawn(function()
                while state do
                    for _, platform in ipairs(selectedPlatform) do
                        local BuyPlatformRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyPlatform")
                        BuyPlatformRemote:FireServer(platform)
                        task.wait(0.3)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

Shop:Toggle({
    Title = "Auto Buy Platform (All)",
    Description = "Automatically buy platform for brainrot section rebirth",
    Default = false,
    Callback = function(state)
        AutoBuyPlatformAll = state
        if state then
            task.spawn(function()
                while state do
                    for _, platform in ipairs(shop.PlatformList) do
                        local BuyPlatformRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyPlatform")
                        BuyPlatformRemote:FireServer(platform)
                        task.wait(0.3)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- ====================== MISC ======================
Misc:Section({ Title = "Misc", Icon = "settings" })

Misc:Toggle({
    Title = "Anti AFK",
    Description = "Prevent being kicked for inactivity",
    Default = false,
    Callback = function(state)
        AntiAFKEnabled = state
        if state then
            local conn
            conn = Players.LocalPlayer.Idled:Connect(function()
                if AntiAFKEnabled then
                    VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                    task.wait(0.1)
                    VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                else
                    conn:Disconnect()
                end
            end)
        end
    end
})

Misc:Button({
    Title = "FPS Boost",
    Description = "Click to enable FPS Boost and improve game performance",
    Callback = function()
        WindUI:Notify({
            Title = "DYHUB Boost",
            Content = "The FPS Boost script is being executed...",
            Duration = 2,
            Icon = "user-check",
        })

        loadstring(game:HttpGet("https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Nigga.lua"))()
        
        WindUI:Notify({
            Title = "DYHUB Boost",
            Content = "FPS Boost script has been executed successfully.",
            Duration = 2,
            Icon = "user-check",
        })
    end
})

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
