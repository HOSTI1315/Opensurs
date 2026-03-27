-- =========================
local version = "3.2.4"
-- =========================

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

-- ====================== SERVICE ======================
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
local AutoFarm = false
local autoClicking = false
local ClickInterval = 0.5
local HeldToolName = "Bat"
local SellPlant = false
local SellBrainrot = false
local AutoBuyGear = false
local AutoBuySeed = false
local AutoBuyAllGear = false
local AutoBuyAllSeed = false
local selectedGears = {}
local selectedSeeds = {}
local serverStartTime = os.time()


-- ====================== HELPER FUNCTIONS ======================
local function GetMyPlot()
    for _, plot in ipairs(Workspace.Plots:GetChildren()) do
        local playerSign = plot:FindFirstChild("PlayerSign")
        if playerSign then
            local textLabel = playerSign:FindFirstChild("BillboardGui") and playerSign.BillboardGui:FindFirstChild("TextLabel")
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
        return n - 1
    end
    return 0
end

local function FormatTime(sec)
    local h = math.floor(sec / 3600)
    local m = math.floor((sec % 3600) / 60)
    local s = sec % 60
    return string.format("%02d:%02d:%02d", h, m, s)
end

-- Brainrot caching
local BrainrotsCache = {}
local function UpdateBrainrotsCache()
    local folder = Workspace:WaitForChild("ScriptedMap"):WaitForChild("Brainrots")
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

local function EquipBat()
    local tool = Backpack:FindFirstChild(HeldToolName) or Character:FindFirstChild(HeldToolName)
    if tool then tool.Parent = Character end
end

local function InstantWarpToBrainrot(brainrot)
    local hitbox = brainrot:FindFirstChild("BrainrotHitbox")
    if hitbox then
        local offset = Vector3.new(0, 1, 3)
        HumanoidRootPart.CFrame = CFrame.new(hitbox.Position + offset, hitbox.Position)
    end
end

-- ====================== WINDOW ======================
local Window = WindUI:CreateWindow({
    Title = "DYHUB",
    IconThemed = true,
    Icon = "rbxassetid://104487529937663",
    Author = "Plants Vs Brainrots | Free Version",
    Folder = "DYHUB_PVSB_ESP",
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
local Sell = Window:Tab({ Title = "Sell", Icon = "dollar-sign" })
Window:SelectTab(1)

-- ====================== MAIN ======================
Main:Section({ Title = "Auto Farm", Icon = "crown" })

local StatusParagraph = Main:Paragraph({
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
                    Duration = 5,
                    Icon = "user-check",
                })
            end
        }
    }
})

Main:Section({ Title = "Use on private servers for security", Icon = "triangle-alert" })
Main:Toggle({
    Title = "Auto Farm (Upgrade)",
    Default = false,
    Callback = function(state)
        AutoFarm = state
        autoClicking = state
        if state then
            EquipBat()
            UpdateBrainrotsCache()

            -- Auto Clicker
            task.spawn(function()
                while autoClicking do
                    if Character:FindFirstChild(HeldToolName) then
                        if UserInputService.TouchEnabled then
                            VirtualUser:Button1Down(Vector2.new(0,0))
                            task.wait(0.5)
                            VirtualUser:Button1Up(Vector2.new(0,0))
                        else
                            UserInputService.InputBegan:Fire(Enum.UserInputType.MouseButton1, false)
                        end
                    end
                    task.wait(ClickInterval)
                end
            end)

            -- Auto Equip Tool
            task.spawn(function()
                while AutoFarm do
                    if not Character:FindFirstChild(HeldToolName) then
                        EquipBat()
                    end
                    task.wait(1)
                end
            end)

            -- AutoFarm Brainrot
            task.spawn(function()
                while AutoFarm do
                    local nearest = GetNearestBrainrot()
                    if nearest then
                        InstantWarpToBrainrot(nearest)
                        local hitbox = nearest:FindFirstChild("BrainrotHitbox")
                        if hitbox then
                            pcall(function()
                                ReplicatedStorage.Remotes.AttacksServer.WeaponAttack:FireServer({ { target = hitbox } })
                            end)
                        end
                    else
                        UpdateBrainrotsCache()
                    end
                    task.wait(0.15)
                end
                autoClicking = false
            end)
        else
            autoClicking = false
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
    end
})

Sell:Toggle({
    Title = "Sell Plants All",
    Default = false,
    Callback = function(state)
        SellPlant = state
    end
})

Sell:Section({ Title = "Sell Everything", Icon = "gem" })

Sell:Toggle({
    Title = "Sell Both All",
    Default = false,
    Callback = function(state)
        SellEverything = state
    end
})

-- ====================== SHOP ======================
local gearList = {
    "Water Bucket",
    "Frost Grenade",
    "Banana Gun",
    "Frost Blower",
    "Carrot Launcher"
}

local seedList = {
    "Cactus Seed",
    "Strawberry Seed",
    "Pumpkin Seed",
    "Sunflower Seed",
    "Dragon Seed",
    "Eggplant Seed",
    "Watermelon Seed",
    "Cocotank Seed",
    "Carnivorous Plant Seed",
    "Mr Carrot Seed",
    "Tomatrio Seed"
}

-- I should use the name from the seed shop & gear shop mb 😐

Shop:Section({ Title = "Buy Gear", Icon = "package" })

Shop:Dropdown({
    Title = "Select Gear",
    Values = gearList,
    Multi = true,
    Callback = function(values)
        selectedGears = values
    end
})

Shop:Toggle({
    Title = "Auto Buy Gear (Selected)",
    Default = false,
    Callback = function(state)
        AutoBuyGear = state
    end
})

Shop:Toggle({
    Title = "Auto Buy All Gear",
    Default = false,
    Callback = function(state)
        AutoBuyAllGear = state
    end
})

Shop:Section({ Title = "Buy Seed", Icon = "leaf" })

Shop:Dropdown({
    Title = "Select Seed",
    Values = seedList,
    Multi = true,
    Callback = function(values)
        selectedSeeds = values
    end
})

Shop:Toggle({
    Title = "Auto Buy Seed (Selected)",
    Default = false,
    Callback = function(state)
        AutoBuySeed = state
    end
})

Shop:Toggle({
    Title = "Auto Buy All Seed",
    Default = false,
    Callback = function(state)
        AutoBuyAllSeed = state
    end
})

-- ====================== LOOPS ======================
task.spawn(function()
    while task.wait(0.69) do
        if SellBrainrot then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ItemSell"):FireServer()
        end
        if SellPlant then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ItemSell"):FireServer()
        end
        if SellEverything then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ItemSell"):FireServer()
        end
    end
end)

task.spawn(function()
    while task.wait(0.69) do
        if AutoBuyGear and #selectedGears > 0 then
            for _, gear in ipairs(selectedGears) do
                local args = { { gear, " " } }
                ReplicatedStorage:WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
            end
        end
        if AutoBuySeed and #selectedSeeds > 0 then
            for _, seed in ipairs(selectedSeeds) do
                local args = { { seed, "\a" } }
                ReplicatedStorage:WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
            end
        end
        if AutoBuyAllGear then
            for _, gear in ipairs(gearList) do
                local args = { { gear, " " } }
                ReplicatedStorage:WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
            end
        end
        if AutoBuyAllSeed then
            for _, seed in ipairs(seedList) do
                local args = { { seed, "\a" } }
                ReplicatedStorage:WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
            end
        end
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
